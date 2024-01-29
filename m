Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FCF241E9
	for <llvm@lists.linux.dev>; Mon, 29 Jan 2024 20:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706560520; cv=none; b=h8ozzMNH24dqxdS0fM5k8K2whGAUDii3xBLAGHDnZQ07rfSpoeCIcvuz3fV3PT/Xhhja0dPWp4Sou1GXRHoxIL67JYHlmAlk7/bQV3S0wt5IvYv08U2y5DM0bjdHwEeSaQkvtY2YTCqNFXlDJZwW0eRdhBzCmz3aXf46oK/B3dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706560520; c=relaxed/simple;
	bh=QoilhUw9SN7WQ830sOKj+jn8BuBEKDKexWUDi8GKNe0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pdBE3lPPjVSAgsprm6NMpgjX6pYLT7xyAAOhTfGsN47AXU40i+3oxLEqYyvgIUotKqNysEvl2D0h6LUoEaR/BMwp4gsoUOLRmVCcghTVIcNeUmYp3JCCcgi+EQGiQq8wLsFZffgg6ctdc6eOTV5+bOc+fQCuXM/zh42G4b3sc2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N8TEbDJB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N8TEbDJB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EBD9C433C7;
	Mon, 29 Jan 2024 20:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706560520;
	bh=QoilhUw9SN7WQ830sOKj+jn8BuBEKDKexWUDi8GKNe0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N8TEbDJBjcHOgEzIdq4YEoVZ/MqD5vN4rMltNTC9sw5/4XoXPtXHmVW4RTwzmpNd9
	 kjxjLyvzBpLc6wG/EOTXd0vpQLU7E9s2/RP01PGe68XyZsgeOoCGanT4bcfLi6xEyk
	 eJEKoNjjxNOOmlP7hO+v106lTbZzxicNcwchP2qGgVtGotrlFDMSThVIR/j/5cAPRu
	 nuaqlMx517zsGfHY87mhtSHAZSnWuArY6uE6CaXIbfzM+wJy4/6qq2X40AkvhSgkoc
	 lbIMkscrrm01RcB+a+XRPm3X4LOnU2zJrsYRbqT5e8D3QlU6HS3sP3mY+cNF5kjmIQ
	 Wi8Y9fZyrVomA==
Date: Mon, 29 Jan 2024 13:35:18 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev
Subject: Re: CBL issue 1984 - AMD64 segfault during LTO building linux-6.7.0
 with clang-17.0.6
Message-ID: <20240129203518.GA1851901@dev-arch.thelio-3990X>
References: <CA+icZUW0GvM1+A3NKDYRrWhW+eXZj7s0uksR75FMCChkAqp_2A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+icZUW0GvM1+A3NKDYRrWhW+eXZj7s0uksR75FMCChkAqp_2A@mail.gmail.com>

Hi Sedat,

Good to hear from you as always!

On Mon, Jan 29, 2024 at 12:43:36PM +0100, Sedat Dilek wrote:
> With upcoming Linux v6.7.3 I wanted to jump into building
> clang-thinlto / clang-kcfi kernels again.
> 
> How severe is the bug in #1984?
> Only hitable with special kbuild settings?

I believe that issue is only hittable with CONFIG_ZERO_CALL_USED_REGS=y,
so without that selected, you should be fine.

> Nathan, can you provide a 17.0.x LLVM toolchain with [3] applied?
> Maybe in [4] - in an unofficial sub-folder?
> AFAICS, there will be no v17.0.7.

My build framework for the kernel.org toolchains does not currently have
support for applying patches, it only has support for checking out
specific upstream revisions of LLVM (for both simplicity and ideological
reasons). I have considered supporting patching bugs in unsupported LLVM
versions but I don't really think that is a direction that I want to go,
at least at the present time.  LLVM 18.0.0-rc1 should be coming out very
soon, at which point I will build and upload that for testing. If you
want to stick with LLVM 17.x, the workaround for avoiding that issue is
pretty simple.

Cheers,
Nathan
