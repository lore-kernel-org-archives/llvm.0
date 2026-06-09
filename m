Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C12E13A258;
	Tue,  9 Jun 2026 00:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780965165; cv=none; b=cfnIm1N1gKFOkKPN5Y77SPy+H7vppT8SVH1VnZiqwaUNTxgnXCZMF+/nhjjlu7kTtPGpQItxqKEkDDoDhQ6ExIJ2sm+6YnlQLKN13xrdLYIxezc/z8PokJ8H4zHpTM2xw5h4FA0ZBXgnAtMmgDHvg9YHfIZZaEOkGHB1h2XUL/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780965165; c=relaxed/simple;
	bh=8t5HE1DLdIUEFSwA61TFs0DG6Iv1WK6pOKa5bnHPuic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FosrpShJz9tAs+NJwPWB3Nw33hSEDPIsNVyFJTcmGcQ1r1R2/xd4igHx3TcHzoeCjIp7K6U0iYDNlQ2v76T8HiyzJtpE16N4MGNkaYV82RAZxLZx72h9L4BLl9BC8thMBYCkCBGNFHW7LhaiMAs63o+El90qUjJyf2H99H3v1h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iC0V95KY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iC0V95KY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41ECB1F00893;
	Tue,  9 Jun 2026 00:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780965163;
	bh=AWqrUcAU/dt3Yzxo/R4IB34ld94Wfxn8b7jvT0dbAR0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iC0V95KY4ScnH68l4HJawJ7OVP+VZbg+jO22tdeMTc+tE3J2rXsQomUEWBDN97mkP
	 cNGwSbxlEqSjPnipuOzPbdHBkPy2kejeOsMZKFVHOo1gyNc10B+S8vH4vNQ/uI4IY7
	 DHHqh1mDA4+XS8bluWat2bI5d9tUATl8R2oDysK+wIO0mRyE0Q53Vl80ZSK4CPoq4j
	 5/zhQ0bOM+gOww0m7KM/3CyQAKfYZPq1hq1Jtp2hbr4kSlTf9vxxshGc6nQZM4QBvm
	 5CS3weUw/0szJ6rN7YhoBh0I2zWai8X1w/WB3zomAMLmvEvZgscNJdNs21/zXpwgLZ
	 kZzpBTNUkdRRA==
Date: Mon, 8 Jun 2026 17:32:38 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: kernelci-results@groups.io, regressions@lists.linux.dev,
	kernelci@lists.linux.dev, gus@collabora.com,
	linux-next@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
	amd-gfx@lists.freedesktop.org,
	Gaghik Khachatrian <gaghik.khachatrian@amd.com>,
	James Lin <pinglei.lin@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>, llvm@lists.linux.dev
Subject: Re: [REGRESSION] next/master: (build) stack frame size (2088)
 exceeds limit (2048) in 'dml31_ModeSupport...
Message-ID: <20260609003238.GA3576576@ax162>
References: <178059594388.10259.8984887956034576074@330cfa3079ca>
 <6bdbbc1b-9934-462c-b9aa-afaf0605c2a0@infradead.org>
 <5f2d4707-ae11-44f3-ad09-1c0580abde91@leemhuis.info>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5f2d4707-ae11-44f3-ad09-1c0580abde91@leemhuis.info>

On Mon, Jun 08, 2026 at 01:24:32PM +0200, Thorsten Leemhuis wrote:
> On 6/5/26 06:23, Randy Dunlap wrote:
> > [adding amd-gfx]
> 
> [+Nathan -- I'm also wondering if we should CC the amdgpu maintainers,
> but lets wait with that for a moment]

Thanks for the CC. Bringing in more folks based on my bisect below.

> Nathan afaics saw this problem a few weeks ago already and filed and
> issue for tracking: https://github.com/ClangBuiltLinux/linux/issues/2161
> 
> To quote from there: ""After LLVM commit 8ac9461e48e0 ("[SLP] Reject
> 2-element vectorization when vector inst count exceeds scalar",
> 2026-04-11), I am seeing two new -Wframe-larger-than instances from
> drivers/gpu/drm/amd/display […]""
> 
> Side note: I wonder if that LLVM commit somehow made it to the KernelCI
> env, or if something in the amdgpu code in -next changed and made the
> problem worse.

So I think these are two separate but perhaps related issues (i.e., the
latter of the "side note" comment), as that LLVM commit is only in LLVM
main (currently 23.0.0) but this instance that KernelCI flags is visible
with clang-21.

With clang-22 and a distribution configuration, I see:

  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:3381:6: warning: stack frame size (2312) exceeds limit (2048) in 'dml30_ModeSupportAndSystemConfigurationFull' [-Wframe-larger-than]
   3381 | void dml30_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
        |      ^
  1 warning generated.
  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:3800:6: warning: stack frame size (2128) exceeds limit (2048) in 'dml31_ModeSupportAndSystemConfigurationFull' [-Wframe-larger-than]
   3800 | void dml31_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
        |      ^
  1 warning generated.
  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:3892:6: warning: stack frame size (2136) exceeds limit (2048) in 'dml314_ModeSupportAndSystemConfigurationFull' [-Wframe-larger-than]
   3892 | void dml314_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
        |      ^
  1 warning generated.

My bisect lands on commit faaeeecef94a ("drm/amd/display: Fix type
mismatches in DML and normalize loop bounds") in -next, which makes
sense. I have not looked into this super closely but I suspect that
change makes it easier for LLVM to inline or unroll loops, which can
result in more stack usage (especially as this code has some functions
with many tens of parameters). It is rather hard to look at and modify
this drm/amd/display code so I have not prioritized it...

I wonder if

  https://github.com/llvm/llvm-project/issues/115862
  https://github.com/llvm/llvm-project/issues/143908

are related, even if KASAN is not enabled here.

> > On 6/4/26 10:59 AM, KernelCI bot wrote:
> >> Hello,
> >>
> >> New build issue found on next/master:
> >>
> >> ---
> >>  stack frame size (2088) exceeds limit (2048) in 'dml31_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than] in drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.o (drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c) [logspec:kbuild,kbuild.compiler.error]
> >> ---
> >>
> >> - dashboard: https://d.kernelci.org/i/maestro:96417cd30041ab8f3153128d0120c6cd70782d99
> >> - giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> >> - commit HEAD:  b99ae45861eccff1e1d8c7b05a13650be805d437
> >> - tags: next-20260604
> >>
> >> Please include the KernelCI tag when submitting a fix:
> >>
> >> Reported-by: kernelci.org bot <bot@kernelci.org>
> >>
> >>
> >> Log excerpt:
> >> =====================================================
> >> /tmp/kci/linux/drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:3872:6: error: stack frame size (2088) exceeds limit (2048) in 'dml31_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
> >>  3872 | void dml31_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
> >>       |      ^
> >> 1 error generated.
> >>
> >> =====================================================
> >>
> >>
> >> # Builds where the incident occurred:
> >>
> >> ## x86_64_defconfig+kselftest+x86-board on (x86_64):
> >> - compiler: clang-21
> >> - config: None
> >> - dashboard: https://d.kernelci.org/build/maestro:6a21abf22cc72b6e94bf3c60
> >>
> >>
> >> #kernelci issue maestro:96417cd30041ab8f3153128d0120c6cd70782d99
> >>
> >> --
> >> This is an experimental report format. Please send feedback in!
> >> Talk to us at kernelci@lists.linux.dev
> >>
> >> Made with love by the KernelCI team - https://kernelci.org
> >>
> > 
> 

-- 
Cheers,
Nathan
