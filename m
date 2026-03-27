Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D93274BE1;
	Fri, 27 Mar 2026 05:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774589661; cv=none; b=FHQHqCZHpjB7ZXy3LuvywIg4IBxdTpscVU0iQv8ZuaVrtG6+bBFhdh+Dbs2PbMaGkHJZ8XbN1K0fgx5/x3JvNd2C3vq3NYd6mm+gt80lHI/dl8YREMyRYSmHiRPAq3bw226KzMhG43Oh68EhICFQ0CAPvFMDkmvcFnMSrSOH2yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774589661; c=relaxed/simple;
	bh=weCefxiBjTGq2PwSMe71qissOFHl66eLJ4DpNp4Zd1w=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=h+nJfZyHIdy8/nZ7zPXBSgMsROwg5Ztj6MET6UT2bORAlZSYONi6en39D56vpPKKpQifjU538p685mrINZjj30iu8/HLJ0mg2yMPMSPz79tx/4ubGWYOH7kwj+FWC6JP7riNQT4j2v2dYEi50/h7ucKRKOmQJxXNFEfBJVbXbXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=aZkAHLEA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="aZkAHLEA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7A4FC19423;
	Fri, 27 Mar 2026 05:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1774589661;
	bh=weCefxiBjTGq2PwSMe71qissOFHl66eLJ4DpNp4Zd1w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=aZkAHLEAux8dadNSGOey0wxkDpcPcAptJleH9NyEM/0a5D35/DK22ls6cR/Z8yoeS
	 yByYdpP0YmsbDMxfKeVmAva1lHdgkP4Dak9HFF27QPqwjwNdYVCe/FkpKUZfrqRZW8
	 khTUxjU60ZFLqfiW+wihj8uTKlMgDvWmDc2E+nxM=
Date: Thu, 26 Mar 2026 22:34:20 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Xie Yuanbin
 <qq570070308@gmail.com>, willy@infradead.org, Liam.Howlett@oracle.com,
 david@kernel.org, justinstitt@google.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, ljs@kernel.org, llvm@lists.linux.dev, mhocko@suse.com,
 morbo@google.com, nathan@kernel.org, nick.desaulniers+lkml@gmail.com,
 rppt@kernel.org, surenb@google.com
Subject: Re: [PATCH] mm: optimize the implementation of WARN_ON_ONCE_GFP()
Message-Id: <20260326223420.cf92ff1d55d078390cb10cb9@linux-foundation.org>
In-Reply-To: <20260310145231.1680db9b@pumpkin>
References: <aa7p3eQfEuh2wObQ@casper.infradead.org>
	<20260309155933.41179-1-qq570070308@gmail.com>
	<be647d6b-9bcb-41c8-bfcf-7fa03d2b942f@kernel.org>
	<20260310145231.1680db9b@pumpkin>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 10 Mar 2026 14:52:31 +0000 David Laight <david.laight.linux@gmail.com> wrote:

> > > If a and b is both unlikely, then "unlikely(a) && unlikely(b)" will
> > > generate better code than "unlikely(a && b)". This is also true for gcc.  
> > 
> > What are the details of how it's better for gcc?
> 
> I'm not sure about that specific case, but I've definitely seen gcc
> generate sub-optimal code for some un/likely() of compound expressions.
> The underlying cause is that the code is (probably) first transformed to:
> 	bool tmp = expression;
> 	if (unlikely(tmp)) ...
> this means that you lose some of the short-circuiting that happens
> early in the code generation of 'if (expression)'.
> 
> It is also not at all clear what you want the compiler to generate.
> For 'unlikely(a || b)' you want 'if (a) goto x; if (b) goto x' so that
> the 'likely' path is the no-branch one.
> But for 'unlikely(a && b)' you still want 'if (a) goto x; y:' which means
> that the 'b' test is out-of-line and has to be 'x: if (!b) goto y' to
> avoid a branch when a is false - but that means you have a 'normally
> taken' branch after the test of b.
> That pretty much means the compiler has to decide which unlikely()
> to ignore.
> So it only makes sense to do 'if (unlikely(a) && b)'.
> Indeed even 'if (unlikely(a) && likely(b))' may be better!

fwiw, this change makes no change to `size mm/page_alloc.o' for x86_64
gcc defconfig.

Given the expressed objections and that WARN_ON_ONCE_GFP() is used only
twice in the whole kernel, I think I'll remove this patch.

Xie, if you disagree with this then please resubmit the patch with a
more convincing justification and hopefully people will reconsider it.

Thanks.
