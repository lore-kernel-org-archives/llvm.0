Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E12F257C
	for <llvm@lists.linux.dev>; Sun, 14 Aug 2022 19:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=t1+0X+jLswVdkejc/MI/VGIatK9gKFmi7huNqRXsrjY=; b=tQd3aws4JXT2vt4V6EBB0swGii
	kftrvgEuYjuc7McqDq2EpBQ9vhnMdP4bWmTTuOqoazXfFtTEcpse1AlrxJK3JLOIBYAP3L9tMfwWK
	Y8Xv/B7bdERm/CLPGkrIdOrZ0yS0NLY5qhg+uaD/s2ZopBcr+E3idQ50XHXJJEqzZ/hPd6ojrtkRm
	a0diwNV8Ss1bqoHOyDZ7dpZcBkpd41AyNaKxnCbGnsmeLFf36bm8Tn8/AegjCw4mKKY28OB+yvMlC
	HGBGjwlMM70OucyXM1E45uThnJ+fWsi90VcHt3bHUHrcqH14dWkR2lLwIhabOITKXSk+bUI5V4QcG
	v0lUgltg==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.95 #2 (Red Hat Linux))
	id 1oNIyL-004K3f-ET;
	Sun, 14 Aug 2022 19:08:29 +0000
Date: Sun, 14 Aug 2022 20:08:29 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Jeff Layton <jlayton@kernel.org>, Ilya Dryomov <idryomov@gmail.com>,
	ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	clang-built-linux <llvm@lists.linux.dev>
Subject: Re: [GIT PULL] Ceph updates for 5.20-rc1
Message-ID: <YvlILbn1ERLgZreh@ZenIV>
References: <CAOi1vP9BSi-65of-8D0BA1_DC0eVD_TQcWkhrGJwaXw_skhHFQ@mail.gmail.com>
 <5d0b0367a5e28ec5b1f3b995c7792ff9a5cbcbd4.camel@kernel.org>
 <YvVzHQ5DVaPAvw26@ZenIV>
 <72a93a2c8910c3615bba7c093c66c18b1a6a2696.camel@kernel.org>
 <YvV2zfT0XbgwHGe/@ZenIV>
 <CAHk-=wgYnAPiGsh7H4BS_E1aMM46PdSGg8YqFhi2SpGw+Ac_PQ@mail.gmail.com>
 <YvV86p5DjBLjjXHo@ZenIV>
 <CAHk-=wjCa=Xf=pA2Z844WnwEeYgy9OPoB2kWphvg7PVn3ohScw@mail.gmail.com>
 <CAHk-=wjLLw0xjL+TZs5DUGL8hOpmLMa4B92aDVFxw4HZthLraw@mail.gmail.com>
 <CAHk-=wjyOB66pofW0mfzDN7SO8zS1EMRZuR-_2aHeO+7kuSrAg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wjyOB66pofW0mfzDN7SO8zS1EMRZuR-_2aHeO+7kuSrAg@mail.gmail.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Thu, Aug 11, 2022 at 08:58:54PM -0700, Linus Torvalds wrote:
> On Thu, Aug 11, 2022 at 3:43 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > Oh, sadly, clang does much worse here.
> >
> > Gcc ends up being able to not have a stack frame at all for
> > __d_lookup_rcu() once that DCACHE_OP_COMPARE case has been moved out.
> > The gcc code really looks very nice.
> >
> > Clang, not so much, and it still has spills and reloads.
> 
> I ended up looking at the clang code generation more than I probably
> should have, because I found it so odd.
> 
> Our code is literally written to not need that many values, and it
> should be easy to keep everything in registers.
> 
> It turns out that clang is trying much too hard to be clever in
> dentry_string_cmp(). The code is literally written so that we keep the
> count of remaining characters in 'tcount', and then at the end we can
> generate a 'mask' from that to ignore the parts of the pathname that
> are beyond the size.

[snip]

There's a cheap way to reduce the register pressure:
                seq = raw_seqcount_begin(&dentry->d_seq);
		if (dentry->d_parent != parent)
			continue;
		if (d_unhashed(dentry))
			continue;
		if (dentry->d_name.hash_len != hashlen)
			continue;
		if (dentry_cmp(dentry, str, hashlen_len(hashlen)) != 0)
			continue;  
		*seqp = seq;
could move the last store to before dentry_cmp().  Sure, we might get
some extra stores out of that.  Into a hot cacheline, and if we really
hit many of those extra stores, we already have a problem - a lot of
collisions both in ->d_parent and ->d_name.hash_len.  If that happens,
the cost of those extra stores is going to be trivial noise.

From correctness POV that should be fine; callers of __d_lookup_rcu()
getting NULL either entirely ignore *seqp (d_alloc_parallel()) or
proceed to wipe it out (lookup_fast(), by calling try_to_unlazy()).

Comments?
