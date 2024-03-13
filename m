Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D381448E9;
	Wed, 13 Mar 2024 17:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710352585; cv=none; b=pp1Bn0u9ayovq9+DIxld7MlUqeiiPLM4Qn/30TpaeCMpLjsajsk23kMwB05aeYmV3+1h4ZnF4EPhXPosxEvScWBARbk7n7MxCuAIuMOyivy5TtaL+kumVsmwxYSFEBMSMsFM2QqkiGTE/+SGyKAXvu84EX6AaKnt2Tui5N824iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710352585; c=relaxed/simple;
	bh=GclcN5yJ/san/KwDM/BTLBHQQTbcAlYxCJf6t3MGcu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oKdJxa6SvkDDVWjDMmD6TgRJ39/Q5oKXLYM4+0iC4faILdxJ3nJMl0x82sYMM0qMIOkRpHI1RIvt47pZuafHJn4auLbPXB0SzVvgjseP27NlwSISIXSPTGFLmYiYEIZWgO1aExqQJrkBZNgmaT+lnssat5uKc8bwYgE+1gRZ7Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p1qHGv6O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p1qHGv6O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CCF3C433F1;
	Wed, 13 Mar 2024 17:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710352584;
	bh=GclcN5yJ/san/KwDM/BTLBHQQTbcAlYxCJf6t3MGcu8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p1qHGv6OdpaTj01cnKKkQ2LKv6ymGHD/Wb518B1ZS5PAQJCUgjTybV+B+Ko1Kz2Za
	 q+8nAY6nVpUHiWXAQGdwYHu364Gf95nohMiulEu8pvIYJ8I0Hul75wZSi25ORRncVZ
	 Qs3QEtNnsBTYZKfUG8HY5XSDdWOJgfCjQteGC2ub3nzlxMVJUz65p37ZV6Bm1UVaiT
	 b1DuR9C/6hEeFCBAeJqWj3nbyq7g9CENxsP1giD56bIh5ilfoSu8T6YOOGpNU/Mrf4
	 j75JfzVgNGx0/n5USaFLKnbkzyuPz0wsLUfqtYITg9FB1b8qQ2LAyZ7YT1OwH6RnMB
	 VADWYtJVdh0wQ==
Date: Wed, 13 Mar 2024 10:56:22 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: Denys Fedoryshchenko <denys.f@collabora.com>, kernelci@lists.linux.dev,
	Nick Desaulniers <ndesaulniers@google.com>,
	clang-built-linux <llvm@lists.linux.dev>,
	Miguel Ojeda <ojeda@kernel.org>
Subject: Re: Migration to Debian Bookworm and compiler updates for KernelCI
Message-ID: <20240313175622.GA3091999@dev-arch.thelio-3990X>
References: <42c7f5a3e07c274c2a9d2e45a973c6306b2ba74f.camel@collabora.com>
 <20240307170516.GA1780841@dev-arch.thelio-3990X>
 <64395770-84d4-4b6d-a7ff-d5623564daf3@gtucker.io>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64395770-84d4-4b6d-a7ff-d5623564daf3@gtucker.io>

On Mon, Mar 11, 2024 at 08:10:31PM +0100, Guillaume Tucker wrote:
> Hello,
> 
> On 07/03/2024 6:05 pm, Nathan Chancellor wrote:
> > Hi Denys,
> > 
> > On Thu, Mar 07, 2024 at 01:02:26PM +0200, Denys Fedoryshchenko wrote:
> > > Hello,
> > > 
> > > I'm reaching out on behalf of the KernelCI project team to discuss our
> > > current compiler setup and planned migration to Debian Bookworm.
> > > 
> > > As you may know, our compiler images are currently based on Debian
> > > Bullseye, which is approaching its end of life in July 2024. We have
> > > been testing using gcc-10, which has presented us with some recent
> > > challenges, notably a significant bug that results in false positive
> > > compilation errors (specifically, the -Werror memcpy issue in
> > > security.c). This situation has prompted us to consider an urgent
> > > migration to Debian Bookworm. Additionally, the migration is
> > > necessitated by our requirement to upgrade to a newer Python version to
> > > support KernelCI v2 development efforts.
> > > 
> > > However, before we proceed, we have a couple of pending questions that
> > > we hope to get clarity on:
> > > 
> > > 1) We've noticed that the minimal available version of clang on
> > > https://apt.llvm.org/bookworm/dists/ is 15, whereas our current minimal
> > > requirement for the Linux kernel compilation is clang-13.0.1
> > > (https://www.kernel.org/doc/html/next/process/changes.html). How
> > > critical is it to continue providing compile tests for clang-13 (and
> > > potentially clang-14)? This information would be vital for us in
> > > planning our compiler support strategy moving forward.
> > 
> > Coverage of the minimum version of a particular toolchain for building
> > the kernel is important but I would not describe it as critical.
> > 
> > While apt.llvm.org's Bookworm distribution does not have clang-13 and
> > clang-14, the Bullseye distribution of clang-13 and clang-14 does work
> > on Bookworm, I personally do that for my Debian development containers:
> > 
> > https://github.com/nathanchance/env/blob/12927502f12ec63f50a460f842c9d0a70a82c629/podman/dev/debian/setup-env.sh#L54-L64
> > 
> > Have you explored using the kernel.org GCC and LLVM toolchains instead
> > of the ones in Debian?
> > 
> > https://mirrors.edge.kernel.org/pub/tools/crosstool/
> > https://mirrors.edge.kernel.org/pub/tools/llvm/
> > 
> > That would potentially give you more flexibility with distribution
> > upgrades and stable/deterministic compiler versions around that. I
> > maintain the LLVM ones, which are optimized at build time to be quicker
> > than the Debian one's, so that would save you build minutes over time.
> 
> Ah nice, Arnd suggested a while ago that we used his GCC
> cross-compiler toolchains in KernelCI but it got stuck at a
> slightly lower priority than everything else for core developers.
> It has always been considered a nice thing to do one day, and I

Heh, story of my life :)

> guess there may be additional reasons to pick it up now with the
> need for a wider GCC version coverage and LLVM/Clang too.
> 
> Out of interest, is there going to be some Rust toolchains there
> as well?  Having all the reference toolchains to build the kernel
> in a single location would be great I think.  Of course Rust
> support is still a moving target, so maybe it's still a bit too
> early right now - just wondering.

As Miguel mentioned, we are talking about providing a combo LLVM + Rust
tarball to help make it more accessible to more people.

> Then in addition to the tarballs, one thing that was discussed
> with Linaro in the very early days of tuxmake was to have a
> reference set of Docker image with the toolchains already
> installed - to save everyone creating their own like in Nathan's
> GitHub link.  Has anyone done that already?
> 
> I started looking into it while I was writing my tutorial to
> build a kernel last month but didn't find anything, so it's kind
> of going up on my TODO list now.  It would greatly help unify
> kernel builds across CI systems in particular and improve
> reproducibility.  The TuxBuild / tuxmake Docker images were
> forked from the KernelCI ones so that's already something that
> could be reunited at some point.

I am not aware of that. As far as I can tell, the TuxMake images are
only lightly customized for TuxMake itself, so it is possible they are
already usable by other entities (I maintain my own containers for other
reasons). They recently added images for my kernel.org LLVM builds as
well:

https://gitlab.com/Linaro/tuxmake/-/commit/dca69b3e2f007cc31ab08200ad59593b7eaa5f40

Cheers,
Nathan
