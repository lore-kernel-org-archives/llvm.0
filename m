Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF5A7A
	for <llvm@lists.linux.dev>; Thu, 24 Feb 2022 16:04:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87D2AC340EC;
	Thu, 24 Feb 2022 16:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645718654;
	bh=jWymqgAfcR3qfS82nYoUUc+s4THWcAw77Lv/fLqZeHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VabpdoNHIcm5/kDkYE0JsGzkAuL1Vu3lh9leQX9oYtKdf1JOHFzhmjAHgUrLuH+pa
	 pE8tAwzkQ3Mfe/q0S1NpFUDifbW3oA9eosOKPtqHxhm2VxX4MA79dbR4JGTzG+Kmqa
	 56eTw1xPUqlWsvKSMgpE9LMQ7kKsYS3gBpaJ2CRAgNnQFz6tIAwBenWIdSPGHbv0em
	 rc+plY3fkKWk/6EcaT9eOxEgzSimHWjGKgGIfRjoBJ5fpLJ1KsJJHjOTQvQSB8V9cs
	 LDulc5OVBeKGu+zXjQw75iauwMAwvQUEy/E/94fNp8HvQCYgbQW/io6nXvDGtR+sJa
	 dOA6jaultOxgg==
Date: Thu, 24 Feb 2022 09:04:08 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Jakob <jakobkoschel@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-arch <linux-arch@vger.kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kees Cook <keescook@chromium.org>, Mike Rapoport <rppt@kernel.org>,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
	Cristiano Giuffrida <c.giuffrida@vu.nl>,
	"Bos, H.J." <h.j.bos@vu.nl>, llvm@lists.linux.dev
Subject: Re: [RFC PATCH 03/13] usb: remove the usage of the list iterator
 after the loop
Message-ID: <YheseEX+xD5q1aAd@dev-arch.archlinux-ax161>
References: <20220217184829.1991035-1-jakobkoschel@gmail.com>
 <20220217184829.1991035-4-jakobkoschel@gmail.com>
 <CAHk-=wg1RdFQ6OGb_H4ZJoUwEr-gk11QXeQx63n91m0tvVUdZw@mail.gmail.com>
 <6DFD3D91-B82C-469C-8771-860C09BD8623@gmail.com>
 <CAHk-=wiyCH7xeHcmiFJ-YgXUy2Jaj7pnkdKpcovt8fYbVFW3TA@mail.gmail.com>
 <CAHk-=wgLe-OSLTEHm=V7eRG6Fcr0dpAM1ZRV1a=R_g6pBOr8Bg@mail.gmail.com>
 <CAK8P3a0DOC3s7x380XR_kN8UYQvkRqvE5LkHQfK2-KzwhcYqQQ@mail.gmail.com>
 <CAHk-=wicJ0VxEmnpb8=TJfkSDytFuf+dvQJj8kFWj0OF2FBZ9w@mail.gmail.com>
 <CAK8P3a2b_RtXkhQ2pwqbZ1zz6QtjaWwD4em_MCF_wGXRwZirKA@mail.gmail.com>
 <CAHk-=wh97QY9fEQUK6zMVQwaQ_JWDvR=R+TxQ_0OYrMHQ+egvQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wh97QY9fEQUK6zMVQwaQ_JWDvR=R+TxQ_0OYrMHQ+egvQ@mail.gmail.com>

On Wed, Feb 23, 2022 at 01:53:39PM -0800, Linus Torvalds wrote:
> On Wed, Feb 23, 2022 at 1:46 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > > Ok, so we should be able to basically convert '--std=gnu89' into
> > > '--std=gnu11 -Wno-shift-negative-value' with no expected change of
> > > behavior.
> >
> > Yes, I think that is correct.
> 
> Ok, somebody please remind me, and let's just try this early in the
> 5.18 merge window.
> 
> Because at least for me, doing
> 
> -                  -std=gnu89
> +                  -std=gnu11 -Wno-shift-negative-value
> 
> for KBUILD_CFLAGS works fine both in my gcc and clang builds. But
> that's obviously just one version of each.

I ran that diff through my set of clang builds on
v5.17-rc5-21-g23d04328444a and only found one issue:

https://github.com/ClangBuiltLinux/linux/issues/1603

I think that should be fixed on the clang side. Once it is, I think we
could just disable that warning in those translation units for older
versions of clang to keep the status quo.

Cheers,
Nathan
