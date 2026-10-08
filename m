Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AADD35C680;
	Thu,  8 Oct 2026 16:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791476420; cv=none; b=IFg5tlsRqDU/vw2UfhHHZNi5b7Z98B6voB8t6NtmWLra7dqHoKmThdKIT7N93nK4xOsYhme9MOqT9b02tLr47kvyeZzKQgvR5zuuK3KnaC1QKuwKCELV+lU6aL3F1UfKKKkfyT7u2dKx7ARRgUMgo1NvNlPbNpmfR3iGrMdbXI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791476420; c=relaxed/simple;
	bh=vKSxa55Cvakgbl8ezMKkKEcEY+xKhmkB53J/4yQA1UY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HU7FItSrtUv3PABcmjd9pXD67W+EFbtrRr4MbSvQf521cVWY55hdd0i1GWzDA1Yd0cFFHMvuAc6M95MVgWKlxdUa8lHm3PveeDW5jFHucoFadNSrDBMbFLDht/kkEnXWpcqMOsHvG9mDS/bl48sXtyygCQNBPQA86tn/8rJhBvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aPuR5plA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aPuR5plA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38A581F000FF;
	Thu,  8 Oct 2026 16:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791476417;
	bh=Ddg90mdT2s42Svn9HEm+uvQ2yjx4bpVZ2Msr7+rdsFs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aPuR5plAHX8iPeSiW6gL/cbQrRe0kuDgA1XVKlNA5LmBSt4MC/ZRWUfy8yXZ6XElf
	 0FhWI3ivPvHnLIhuTsdafsBY0RwiBHsTWTL3tO2pDgT4csP8UqdzRffXxAt0emvjTB
	 tyn6URwpfSHSkOEcyd2uhAb5bElvoOf8V9NkgYKGcq8FwSUH2YgP0P0/cU5usqr/d5
	 V+UhDgOLhRME1oa/SFMELU+WLBmRA4AxckTSiy30gQ9y31DWWK/yhXeTSgGtiql6BO
	 2c2uNXtJd6R9CPDroazteL85fBvJBocC2t1Q7y9U+9Iv32lcPu94HDYmmRFb12eWro
	 h5XuTC0kChh5g==
Date: Thu, 8 Oct 2026 18:20:13 +0200
From: Nathan Chancellor <nathan@kernel.org>
To: Rong Xu <xur@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	kernel test robot <lkp@intel.com>
Subject: Re: <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
Message-ID: <20261008162013.GA1660409@ax162>
References: <202609040258.xw9R4qaZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202609040258.xw9R4qaZ-lkp@intel.com>

Hi Rong,

This is the build report I mentioned at LPC, please take a look. The
original report is available at:

  https://lore.kernel.org/202609040258.xw9R4qaZ-lkp@intel.com/

but I have also included it below.

On Fri, Sep 04, 2026 at 02:32:03AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   940de590b839f71d6dc846160534bf202401b8b7
> commit: 9f2aee8f7d1842be08da860e45265d30dba0d1f7 kbuild: distributed build support for Clang ThinLTO
> date:   3 months ago
> config: arm64-randconfig-003-20260830 (https://download.01.org/0day-ci/archive/20260904/202609040258.xw9R4qaZ-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260904/202609040258.xw9R4qaZ-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: 9f2aee8f7d18 ("kbuild: distributed build support for Clang ThinLTO")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202609040258.xw9R4qaZ-lkp@intel.com/
> 
> All error/warnings (new ones prefixed by >>):
> 
>    warning: overriding the module target triple with x86_64-unknown-linux-gnu [-Woverride-module]
> >> warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_riscv64.o': Linking two modules of different target triples: 'arch/arm64/mm/init.o' is 'aarch64-unknown-linux-gnu' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_riscv64.o' is 'x86_64-unknown-linux-gnu'
>     [-Wlinker-warnings]
> >> warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_riscv64.o': Linking two modules of different target triples: 'lib/kunit/test.o' is 'aarch64-unknown-linux-gnu' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_riscv64.o' is 'x86_64-unknown-linux-gnu'
>     [-Wlinker-warnings]
> >> warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_riscv64.o': Linking two modules of different target triples: 'lib/kunit/try-catch.o' is 'aarch64-unknown-linux-gnu' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_riscv64.o' is 'x86_64-unknown-linux-gnu'
>     [-Wlinker-warnings]
> >> warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_riscv64.o': Linking two modules of different target triples: 'lib/maple_tree.o' is 'aarch64-unknown-linux-gnu' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_riscv64.o' is 'x86_64-unknown-linux-gnu'
>     [-Wlinker-warnings]
> >> warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_riscv64.o': Linking two modules of different target triples: 'mm/vmstat.o' is 'aarch64-unknown-linux-gnu' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_riscv64.o' is 'x86_64-unknown-linux-gnu'
>     [-Wlinker-warnings]
>    '+outline-atomics' is not a recognized feature for this target (ignoring feature)
>    '+v8a' is not a recognized feature for this target (ignoring feature)
>    '-crypto' is not a recognized feature for this target (ignoring feature)
>    '-fmv' is not a recognized feature for this target (ignoring feature)
>    '-fp-armv8' is not a recognized feature for this target (ignoring feature)
>    '-neon' is not a recognized feature for this target (ignoring feature)
>    '-sha2' is not a recognized feature for this target (ignoring feature)
>    '+outline-atomics' is not a recognized feature for this target (ignoring feature)
>    '+v8a' is not a recognized feature for this target (ignoring feature)
>    '-crypto' is not a recognized feature for this target (ignoring feature)
>    '-fmv' is not a recognized feature for this target (ignoring feature)
>    '-fp-armv8' is not a recognized feature for this target (ignoring feature)
>    '-neon' is not a recognized feature for this target (ignoring feature)
>    '-sha2' is not a recognized feature for this target (ignoring feature)
> >> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 531; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                             ^~~
>    error: cannot compile inline asm
> >> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 563; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                             ^~~
>    error: cannot compile inline asm
> >> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 564; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                             ^~~
>    error: cannot compile inline asm
> >> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 565; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                             ^~~
>    error: cannot compile inline asm
> >> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 566; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                             ^~~
>    error: cannot compile inline asm
> >> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 568; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                             ^~~
>    error: cannot compile inline asm
> >> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 565; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                             ^~~
>    error: cannot compile inline asm
> >> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 566; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                             ^~~
>    error: cannot compile inline asm
> >> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 568; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                             ^~~
>    error: cannot compile inline asm
> >> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 563; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                             ^~~
>    error: cannot compile inline asm
> >> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 564; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                             ^~~
>    error: cannot compile inline asm
> >> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 566; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                             ^~~
>    error: cannot compile inline asm
> >> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 568; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                             ^~~
>    error: cannot compile inline asm
> >> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 531; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                             ^~~
>    error: cannot compile inline asm
> >> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 531; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                             ^~~
>    error: cannot compile inline asm
>    <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 563; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                             ^~~
>    error: cannot compile inline asm
>    <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 564; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                             ^~~
>    error: cannot compile inline asm
>    <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 565; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                             ^~~
>    error: cannot compile inline asm
>    <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 566; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                             ^~~
>    error: cannot compile inline asm
>    <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 568; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                             ^~~
>    fatal error: too many errors emitted, stopping now [-ferror-limit=]
>    <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 112; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                             ^~~
>    <inline asm>:3:2: error: invalid instruction mnemonic 'b'
>            b       .LBB18_17
>            ^
>    <inline asm>:8:2: error: unknown directive
>     .hword (1 << 15) | ($42)
>     ^
>    <inline asm>:3:2: error: invalid instruction mnemonic 'b'
>            b       .LBB18_24
>            ^
>    <inline asm>:8:2: error: unknown directive
>     .hword (1 << 15) | ($42)
>     ^
>    <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 112; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                             ^~~
>    <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 157; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                             ^~~
>    <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 112; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                             ^~~
>    <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 112; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                             ^~~
>    <inline asm>:1:283: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_fmt_defaults.h"; .popsection; .long 14472b - .; .short 277; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                                     ^~~
>    <inline asm>:1:283: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_fmt_defaults.h"; .popsection; .long 14472b - .; .short 286; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                                     ^~~
>    <inline asm>:1:283: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_fmt_defaults.h"; .popsection; .long 14472b - .; .short 290; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                                     ^~~
>    <inline asm>:1:269: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/riscv.h"; .popsection; .long 14472b - .; .short 95; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                       ^~~
>    <inline asm>:1:269: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/riscv.h"; .popsection; .long 14472b - .; .short 95; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                       ^~~
>    <inline asm>:1:270: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/riscv.h"; .popsection; .long 14472b - .; .short 117; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                        ^~~
>    <inline asm>:1:270: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/riscv.h"; .popsection; .long 14472b - .; .short 118; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                        ^~~
>    <inline asm>:1:283: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_fmt_defaults.h"; .popsection; .long 14472b - .; .short 178; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                                     ^~~
>    <inline asm>:1:283: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_fmt_defaults.h"; .popsection; .long 14472b - .; .short 277; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                                     ^~~
>    <inline asm>:1:283: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_fmt_defaults.h"; .popsection; .long 14472b - .; .short 286; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                                     ^~~
>    <inline asm>:1:283: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_fmt_defaults.h"; .popsection; .long 14472b - .; .short 290; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                                     ^~~
>    <inline asm>:1:283: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_fmt_defaults.h"; .popsection; .long 14472b - .; .short 178; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                                     ^~~
>    <inline asm>:1:283: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_fmt_defaults.h"; .popsection; .long 14472b - .; .short 277; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                                     ^~~
>    <inline asm>:1:283: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_fmt_defaults.h"; .popsection; .long 14472b - .; .short 286; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                                     ^~~
>    <inline asm>:1:283: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_fmt_defaults.h"; .popsection; .long 14472b - .; .short 290; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                                     ^~~
>    <inline asm>:1:283: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_fmt_defaults.h"; .popsection; .long 14472b - .; .short 178; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                                     ^~~
>    <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 112; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
> --
>    warning: overriding the module target triple with x86_64-unknown-linux-gnu [-Woverride-module]
>    warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_amdv1.o': Linking two modules of different target triples: 'arch/arm64/mm/init.o' is 'aarch64-unknown-linux-gnu' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_amdv1.o' is 'x86_64-unknown-linux-gnu'
>     [-Wlinker-warnings]
>    warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_amdv1.o': Linking two modules of different target triples: 'lib/kunit/test.o' is 'aarch64-unknown-linux-gnu' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_amdv1.o' is 'x86_64-unknown-linux-gnu'
>     [-Wlinker-warnings]
>    warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_amdv1.o': Linking two modules of different target triples: 'lib/kunit/try-catch.o' is 'aarch64-unknown-linux-gnu' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_amdv1.o' is 'x86_64-unknown-linux-gnu'
>     [-Wlinker-warnings]
>    warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_amdv1.o': Linking two modules of different target triples: 'lib/maple_tree.o' is 'aarch64-unknown-linux-gnu' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_amdv1.o' is 'x86_64-unknown-linux-gnu'
>     [-Wlinker-warnings]
>    warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_amdv1.o': Linking two modules of different target triples: 'mm/vmstat.o' is 'aarch64-unknown-linux-gnu' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_amdv1.o' is 'x86_64-unknown-linux-gnu'
>     [-Wlinker-warnings]
>    '+outline-atomics' is not a recognized feature for this target (ignoring feature)
>    '+v8a' is not a recognized feature for this target (ignoring feature)
>    '-crypto' is not a recognized feature for this target (ignoring feature)
>    '-fmv' is not a recognized feature for this target (ignoring feature)
>    '-fp-armv8' is not a recognized feature for this target (ignoring feature)
>    '-neon' is not a recognized feature for this target (ignoring feature)
>    '-sha2' is not a recognized feature for this target (ignoring feature)
>    '+outline-atomics' is not a recognized feature for this target (ignoring feature)
>    '+v8a' is not a recognized feature for this target (ignoring feature)
>    '-crypto' is not a recognized feature for this target (ignoring feature)
>    '-fmv' is not a recognized feature for this target (ignoring feature)
>    '-fp-armv8' is not a recognized feature for this target (ignoring feature)
>    '-neon' is not a recognized feature for this target (ignoring feature)
>    '-sha2' is not a recognized feature for this target (ignoring feature)
> >> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 531; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                             ^~~
>    error: cannot compile inline asm
> >> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 563; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                             ^~~
>    error: cannot compile inline asm
> >> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 564; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                             ^~~
>    error: cannot compile inline asm
> >> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 565; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                             ^~~
>    error: cannot compile inline asm
> >> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 566; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                             ^~~
>    error: cannot compile inline asm
> >> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 568; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                             ^~~
>    error: cannot compile inline asm
> >> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 565; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                             ^~~
>    error: cannot compile inline asm
> >> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 566; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                             ^~~
>    error: cannot compile inline asm
> >> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 568; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                             ^~~
>    error: cannot compile inline asm
> >> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 563; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                             ^~~
>    error: cannot compile inline asm
> >> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 564; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                             ^~~
>    error: cannot compile inline asm
> >> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 566; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                             ^~~
>    error: cannot compile inline asm
> >> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 568; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                             ^~~
>    error: cannot compile inline asm
> >> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 531; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                             ^~~
>    error: cannot compile inline asm
> >> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 531; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                             ^~~
>    error: cannot compile inline asm
> >> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 563; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                             ^~~
>    error: cannot compile inline asm
> >> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 564; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                             ^~~
>    error: cannot compile inline asm
> >> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 565; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                             ^~~
>    error: cannot compile inline asm
> >> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 566; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                             ^~~
>    error: cannot compile inline asm
> >> <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 568; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                             ^~~
>    fatal error: too many errors emitted, stopping now [-ferror-limit=]
>    <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 112; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                             ^~~
>    <inline asm>:1:270: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/amdv1.h"; .popsection; .long 14472b - .; .short 150; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                        ^~~
>    <inline asm>:3:2: error: invalid instruction mnemonic 'b'
>            b       .LBB19_22
>            ^
>    <inline asm>:8:2: error: unknown directive
>     .hword (1 << 15) | ($42)
>     ^
>    <inline asm>:3:2: error: invalid instruction mnemonic 'b'
>            b       .LBB19_30
>            ^
>    <inline asm>:8:2: error: unknown directive
>     .hword (1 << 15) | ($42)
>     ^
>    <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 112; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                             ^~~
>    <inline asm>:1:270: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/amdv1.h"; .popsection; .long 14472b - .; .short 150; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                        ^~~
>    <inline asm>:1:270: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/amdv1.h"; .popsection; .long 14472b - .; .short 150; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                        ^~~
>    <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 157; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                             ^~~
>    <inline asm>:1:270: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/amdv1.h"; .popsection; .long 14472b - .; .short 150; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                        ^~~
>    <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 112; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                             ^~~
>    <inline asm>:1:270: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/amdv1.h"; .popsection; .long 14472b - .; .short 150; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                        ^~~
>    <inline asm>:1:270: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/amdv1.h"; .popsection; .long 14472b - .; .short 150; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                        ^~~
>    <inline asm>:1:275: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_iter.h"; .popsection; .long 14472b - .; .short 112; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                             ^~~
>    <inline asm>:1:270: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/amdv1.h"; .popsection; .long 14472b - .; .short 150; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                        ^~~
>    <inline asm>:1:270: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/amdv1.h"; .popsection; .long 14472b - .; .short 150; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                        ^~~
>    <inline asm>:1:270: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/amdv1.h"; .popsection; .long 14472b - .; .short 150; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                        ^~~
>    <inline asm>:1:270: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/amdv1.h"; .popsection; .long 14472b - .; .short 150; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                        ^~~
>    <inline asm>:1:283: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_fmt_defaults.h"; .popsection; .long 14472b - .; .short 277; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                                     ^~~
>    <inline asm>:1:270: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/amdv1.h"; .popsection; .long 14472b - .; .short 150; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                        ^~~
>    <inline asm>:1:283: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_fmt_defaults.h"; .popsection; .long 14472b - .; .short 282; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                                     ^~~
>    <inline asm>:1:283: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_fmt_defaults.h"; .popsection; .long 14472b - .; .short 290; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                                     ^~~
>    <inline asm>:1:269: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/amdv1.h"; .popsection; .long 14472b - .; .short 95; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                       ^~~
>    <inline asm>:1:269: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/amdv1.h"; .popsection; .long 14472b - .; .short 95; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                       ^~~
>    <inline asm>:1:270: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/amdv1.h"; .popsection; .long 14472b - .; .short 124; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                        ^~~
>    <inline asm>:1:283: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_fmt_defaults.h"; .popsection; .long 14472b - .; .short 277; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                                     ^~~
>    <inline asm>:1:270: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/amdv1.h"; .popsection; .long 14472b - .; .short 150; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                        ^~~
>    <inline asm>:1:283: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_fmt_defaults.h"; .popsection; .long 14472b - .; .short 282; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                                     ^~~
>    <inline asm>:1:283: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_fmt_defaults.h"; .popsection; .long 14472b - .; .short 290; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                                     ^~~
>    <inline asm>:1:283: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/../pt_fmt_defaults.h"; .popsection; .long 14472b - .; .short 277; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                                     ^~~
>    <inline asm>:1:270: error: invalid instruction mnemonic 'brk'
>            .pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - .; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "drivers/iommu/generic_pt/fmt/amdv1.h"; .popsection; .long 14472b - .; .short 150; .short (1 << 0)|(((9) << 8)); .align 2; .popsection; 14471: brk 0x800
>                                                                                                                                                                                                                                                                                        ^~~
>    <inline asm>:1:283: error: invalid instruction mnemonic 'brk'
> ..
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

-- 
Cheers,
Nathan
