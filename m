Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28871FC0
	for <llvm@lists.linux.dev>; Thu, 21 Apr 2022 15:13:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10985C385A5;
	Thu, 21 Apr 2022 15:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650553995;
	bh=6WCbXgBpxcPU3GtPzWHW8qUC4r+/Rl9mlE4qE4NMb/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LojKH+YaOy0AvxtLV5mRs47dd+/pJStciB7OVGgv+y3tVNFG+VbRdavc3z3lkq8LF
	 587eZ0ZwZ4W5M+Nj0bNjMKDfPalp7MnpQ7u4K/YapXOYkikLy6MK4bxTXZk3wLWJrO
	 Svsgghr6SbEOszSCJpXLfh+A43RiJx5zyhzzfQB6ua6MS+esFgMDWrFkaVXG2Bni+m
	 Kid3QFkGJCpzqAwrFf2MNMTIEVfQChE8hVSLFT6VZYj7svBrOgMjL0tVnX0r/nlF1n
	 qi0X7qToE/Ww1oecw+JqweEJhtDEs6BDfjszLFvEOot8wctqAh4t0zBFcNroMPo51H
	 OSLZJ4LiIdefA==
Date: Thu, 21 Apr 2022 08:13:13 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, Paul Menzel <pmenzel@molgen.mpg.de>,
	stable@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	llvm@lists.linux.dev
Subject: Re: Apply d799769188529abc6cbf035a10087a51f7832b6b to 5.17 and 5.15?
Message-ID: <YmF0iajmlAg6Kj9I@dev-fedora.thelio-3990X>
References: <Yl8pNxSGUgeHZ1FT@dev-arch.thelio-3990X>
 <877d7ig9oz.fsf@mpe.ellerman.id.au>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877d7ig9oz.fsf@mpe.ellerman.id.au>

On Thu, Apr 21, 2022 at 05:46:52PM +1000, Michael Ellerman wrote:
> Nathan Chancellor <nathan@kernel.org> writes:
> > Hi Greg, Sasha, and Michael,
> >
> > Commit d79976918852 ("powerpc/64: Add UADDR64 relocation support") fixes
> > a boot failure with CONFIG_RELOCATABLE=y kernels linked with recent
> > versions of ld.lld [1]. Additionally, it resolves a separate boot
> > failure that Paul Menzel reported [2] with ld.lld 13.0.0. Is this a
> > reasonable backport for 5.17 and 5.15? It applies cleanly, resolves both
> > problems, and does not appear to cause any other issues in my testing
> > for both trees but I was curious what Michael's opinion was, as I am far
> > from a PowerPC expert.
> >
> > This change does apply cleanly to 5.10 (I did not try earlier branches)
> > but there are other changes needed for ld.lld to link CONFIG_RELOCATABLE
> > kernels in that branch so to avoid any regressions, I think it is safe
> > to just focus on 5.15 and 5.17.
> 
> I considered tagging it for stable, but I wanted it to get a bit of
> testing first, it's a reasonably big patch.
> 
> I think we're reasonably confident it doesn't introduce any new bugs,
> but more testing time is always good.
> 
> So I guess I'd be inclined to wait another week or so before requesting
> a stable backport?

Sure, thanks for the response! I'll ping this thread on Monday, May 2nd,
so that we have two more RC releases to try and flush out any lingering
issues. If you do receive any reports of regressions, please let me
know.

Cheers,
Nathan
