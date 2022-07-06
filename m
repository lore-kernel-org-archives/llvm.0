Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DFB538D
	for <llvm@lists.linux.dev>; Wed,  6 Jul 2022 16:51:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F079FC3411C;
	Wed,  6 Jul 2022 16:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657126295;
	bh=wpntw2dt5b5m3SIfa676MVA6wrlb/7K0cDTDkG3UJpw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jBUQbmPPNddi5uEaW1OfkgqkoV//pb/lZxRGekJnjmRlCDdRMVI8fZs2XxF4VpFPx
	 DXZDyuxIwKNz5bfvtty+a3jlqIEKB82kxLI3IDKCspWbK7MSJEYOF01J4GlmNVoej4
	 rsQb89Twj+RFKFaoGPLuzTWw+7rvm4SAJXEON+1k3Ux07EcV/ZtTyh7Un7L6lJBGxn
	 K1iWHdcmRa9sVZUtW+DEOYT066jcN5Xjf3NVFL/SIpRLi70QMQ5Ak+JAB0azES7goa
	 i++NRo4HqBpYhYvJeDSBLyzLObc0tyqfVI9YcklMCF4/M46XHPCWGW4wRY1Jj6Lbtc
	 XkaGcFStsmbuw==
Date: Wed, 6 Jul 2022 09:51:33 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: llvm@lists.linux.dev, "kernelci.org bot" <bot@kernelci.org>,
	Guillaume Tucker <guillaume.tucker@collabora.com>
Subject: Re: next/master build: 205 builds: 8 failed, 197 passed, 21 errors,
 52 warnings (next-20220706)
Message-ID: <YsW9la1mD0CneH4b@dev-arch.thelio-3990X>
References: <62c5b563.1c69fb81.1240a.62b2@mx.google.com>
 <CAKwvOdnusz+AjYzkW4pyHraJ1_exhwAz9bscMkRiqjiXRj+66g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKwvOdnusz+AjYzkW4pyHraJ1_exhwAz9bscMkRiqjiXRj+66g@mail.gmail.com>

On Wed, Jul 06, 2022 at 09:40:59AM -0700, Nick Desaulniers wrote:
> On Wed, Jul 6, 2022 at 9:16 AM kernelci.org bot <bot@kernelci.org> wrote:
> >
> > next/master build: 205 builds: 8 failed, 197 passed, 21 errors, 52 warnings (next-20220706)
> >
> > Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/next-20220706/
> >
> > Tree: next
> > Branch: master
> > Git Describe: next-20220706
> > Git Commit: 088b9c375534d905a4d337c78db3b3bfbb52c4a0
> > Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> > Built: 7 unique architectures
> >
> > Build Failures Detected:
> >
> > arm64:
> >     allmodconfig: (clang-15) FAIL
> >     allmodconfig: (gcc-10) FAIL
> >
> > arm:
> >     cros://chromeos-5.10/armel/chromiumos-arm.flavour.config: (clang-13) FAIL
> >     cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config: (clang-13) FAIL
> >     allmodconfig: (clang-15) FAIL
> >     allmodconfig: (gcc-10) FAIL
> >
> > i386:
> >     allmodconfig: (clang-15) FAIL
> >
> > mips:
> >     decstation_64_defconfig: (gcc-10) FAIL
> >
> > Errors and Warnings Detected:
> >
> > arc:
> >
> > arm64:
> >     allmodconfig (gcc-10): 4 errors
> >     allmodconfig (clang-15): 1 error
> >
> > arm:
> >     allmodconfig (clang-15): 1 error, 13 warnings
> >     allmodconfig (gcc-10): 8 errors
> >     aspeed_g5_defconfig (clang-15): 10 warnings
> >     cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (clang-13): 1 error, 5 warnings
> >     cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (clang-13): 1 error, 5 warnings
> >     multi_v5_defconfig (clang-15): 2 warnings
> >     multi_v7_defconfig (clang-15): 12 warnings
> >
> > i386:
> >     allmodconfig (clang-15): 1 error
> >     allnoconfig (clang-15): 2 warnings
> >
> > mips:
> >     32r2el_defconfig (gcc-10): 1 warning
> >     32r2el_defconfig+kselftest (gcc-10): 1 warning
> >     fuloong2e_defconfig (gcc-10): 1 error
> >     lemote2f_defconfig (gcc-10): 1 error
> >     loongson2k_defconfig (gcc-10): 1 error
> >     loongson3_defconfig (gcc-10): 1 error
> >     rb532_defconfig (gcc-10): 1 warning
> >
> > riscv:
> >
> > x86_64:
> >
> > Errors summary:
> >
> >     4    drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.c:603:59: error: ‘-mgeneral-regs-only’ is incompatible with the use of floating-point types
> >     4    cc1: error: ‘-mloongson-mmi’ must be used with ‘-mhard-float’
> >     2    lib/maple_tree.c:4272:20: error: stack frame size (1096) exceeds limit (1024) in function 'mas_wr_modify' [-Werror,-Wframe-larger-than]
> >     1    sound/soc/intel/avs/path.c:815:18: error: stack frame size (2176) exceeds limit (2048) in 'avs_path_create' [-Werror,-Wframe-larger-than]
> >     1    lib/maple_tree.c:4272:20: error: stack frame size (1144) exceeds limit (1024) in 'mas_wr_modify' [-Werror,-Wframe-larger-than]
> >     1    lib/maple_tree.c:4272:20: error: stack frame size (1072) exceeds limit (1024) in 'mas_wr_modify' [-Werror,-Wframe-larger-than]
> >     1    ERROR: modpost: "__aeabi_ui2d" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> >     1    ERROR: modpost: "__aeabi_i2d" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> >     1    ERROR: modpost: "__aeabi_dsub" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> >     1    ERROR: modpost: "__aeabi_dmul" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> >     1    ERROR: modpost: "__aeabi_ddiv" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> >     1    ERROR: modpost: "__aeabi_dadd" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> >     1    ERROR: modpost: "__aeabi_d2uiz" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> >     1    ERROR: modpost: "__aeabi_d2iz" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> 
> ^ interesting, these look new to me, must be from the new CrOS configs.

No, they come from the ARCH=arm allmodconfig with GCC 10. I am in the
process of bisecting the exact patch that caused these but it is likely
commit 85f4bc0c333c ("drm/amd/display: Add SubVP required code").

Cheers,
Nathan

> >
> > Warnings summary:
> >
> >     23   clang: warning: argument unused during compilation: '-march=armv6k' [-Wunused-command-line-argument]
> >     20   clang: warning: argument unused during compilation: '-march=armv7-a' [-Wunused-command-line-argument]
> >     3    1 warning generated.
> >     2    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_reg): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expected "0,0"
> >     1    lib/maple_tree.c:4272:20: warning: stack frame size (1096) exceeds limit (1024) in 'mas_wr_modify' [-Wframe-larger-than]
> >     1    lib/maple_tree.c:4272:20: warning: stack frame size (1088) exceeds limit (1024) in 'mas_wr_modify' [-Wframe-larger-than]
> >     1    lib/maple_tree.c:4272:20: warning: stack frame size (1084) exceeds limit (1024) in 'mas_wr_modify' [-Wframe-larger-than]
> >     1    cc1: warning: result of ‘-117440512 << 16’ requires 44 bits to represent, but ‘int’ only has 32 bits [-Wshift-overflow=]
> >
> > ================================================================================
> >
> > Detailed per-defconfig build reports:
> >
> > --------------------------------------------------------------------------------
> > 32r2el_defconfig (mips, gcc-10) — PASS, 0 errors, 1 warning, 0 section mismatches
> >
> > Warnings:
> >     arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_reg): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expected "0,0"
> >
> > --------------------------------------------------------------------------------
> > 32r2el_defconfig+kselftest (mips, gcc-10) — PASS, 0 errors, 1 warning, 0 section mismatches
> >
> > Warnings:
> >     arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_reg): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expected "0,0"
> >
> > --------------------------------------------------------------------------------
> > allmodconfig (arm, clang-15) — FAIL, 1 error, 13 warnings, 0 section mismatches
> >
> > Errors:
> >     lib/maple_tree.c:4272:20: error: stack frame size (1144) exceeds limit (1024) in 'mas_wr_modify' [-Werror,-Wframe-larger-than]
> >
> > Warnings:
> >     clang: warning: argument unused during compilation: '-march=armv6k' [-Wunused-command-line-argument]
> >     clang: warning: argument unused during compilation: '-march=armv6k' [-Wunused-command-line-argument]
> >     clang: warning: argument unused during compilation: '-march=armv6k' [-Wunused-command-line-argument]
> >     clang: warning: argument unused during compilation: '-march=armv6k' [-Wunused-command-line-argument]
> >     clang: warning: argument unused during compilation: '-march=armv6k' [-Wunused-command-line-argument]
> >     clang: warning: argument unused during compilation: '-march=armv6k' [-Wunused-command-line-argument]
> >     clang: warning: argument unused during compilation: '-march=armv6k' [-Wunused-command-line-argument]
> >     clang: warning: argument unused during compilation: '-march=armv6k' [-Wunused-command-line-argument]
> >     clang: warning: argument unused during compilation: '-march=armv6k' [-Wunused-command-line-argument]
> >     clang: warning: argument unused during compilation: '-march=armv6k' [-Wunused-command-line-argument]
> >     clang: warning: argument unused during compilation: '-march=armv6k' [-Wunused-command-line-argument]
> >     clang: warning: argument unused during compilation: '-march=armv6k' [-Wunused-command-line-argument]
> >     clang: warning: argument unused during compilation: '-march=armv6k' [-Wunused-command-line-argument]
> >
> > --------------------------------------------------------------------------------
> > allmodconfig (arm64, gcc-10) — FAIL, 4 errors, 0 warnings, 0 section mismatches
> >
> > Errors:
> >     drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.c:603:59: error: ‘-mgeneral-regs-only’ is incompatible with the use of floating-point types
> >     drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.c:603:59: error: ‘-mgeneral-regs-only’ is incompatible with the use of floating-point types
> >     drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.c:603:59: error: ‘-mgeneral-regs-only’ is incompatible with the use of floating-point types
> >     drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.c:603:59: error: ‘-mgeneral-regs-only’ is incompatible with the use of floating-point types
> >
> > --------------------------------------------------------------------------------
> > allmodconfig (i386, clang-15) — FAIL, 1 error, 0 warnings, 0 section mismatches
> >
> > Errors:
> >     lib/maple_tree.c:4272:20: error: stack frame size (1072) exceeds limit (1024) in 'mas_wr_modify' [-Werror,-Wframe-larger-than]
> >
> > --------------------------------------------------------------------------------
> > allmodconfig (arm, gcc-10) — FAIL, 8 errors, 0 warnings, 0 section mismatches
> >
> > Errors:
> >     ERROR: modpost: "__aeabi_ui2d" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> >     ERROR: modpost: "__aeabi_dsub" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> >     ERROR: modpost: "__aeabi_ddiv" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> >     ERROR: modpost: "__aeabi_d2uiz" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> >     ERROR: modpost: "__aeabi_d2iz" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> >     ERROR: modpost: "__aeabi_dmul" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> >     ERROR: modpost: "__aeabi_i2d" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> >     ERROR: modpost: "__aeabi_dadd" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> >
> > --------------------------------------------------------------------------------
> > allmodconfig (arm64, clang-15) — FAIL, 1 error, 0 warnings, 0 section mismatches
> >
> > Errors:
> >     sound/soc/intel/avs/path.c:815:18: error: stack frame size (2176) exceeds limit (2048) in 'avs_path_create' [-Werror,-Wframe-larger-than]
> >
> > --------------------------------------------------------------------------------
> > allnoconfig (x86_64, clang-15) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > allnoconfig (arc, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > allnoconfig (i386, clang-15) — PASS, 0 errors, 2 warnings, 0 section mismatches
> >
> > Warnings:
> >     lib/maple_tree.c:4272:20: warning: stack frame size (1084) exceeds limit (1024) in 'mas_wr_modify' [-Wframe-larger-than]
> >     1 warning generated.
> >
> > --------------------------------------------------------------------------------
> > allnoconfig (x86_64, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > allnoconfig (i386, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > ar7_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > aspeed_g4_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > aspeed_g5_defconfig (arm, clang-15) — PASS, 0 errors, 10 warnings, 0 section mismatches
> >
> > Warnings:
> >     clang: warning: argument unused during compilation: '-march=armv6k' [-Wunused-command-line-argument]
> >     clang: warning: argument unused during compilation: '-march=armv6k' [-Wunused-command-line-argument]
> >     clang: warning: argument unused during compilation: '-march=armv6k' [-Wunused-command-line-argument]
> >     clang: warning: argument unused during compilation: '-march=armv6k' [-Wunused-command-line-argument]
> >     clang: warning: argument unused during compilation: '-march=armv6k' [-Wunused-command-line-argument]
> >     clang: warning: argument unused during compilation: '-march=armv6k' [-Wunused-command-line-argument]
> >     clang: warning: argument unused during compilation: '-march=armv6k' [-Wunused-command-line-argument]
> >     clang: warning: argument unused during compilation: '-march=armv6k' [-Wunused-command-line-argument]
> >     clang: warning: argument unused during compilation: '-march=armv6k' [-Wunused-command-line-argument]
> >     clang: warning: argument unused during compilation: '-march=armv6k' [-Wunused-command-line-argument]
> >
> > --------------------------------------------------------------------------------
> > aspeed_g5_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > assabet_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > at91_dt_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > ath25_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > ath79_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > axm55xx_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > axs103_defconfig (arc, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > axs103_smp_defconfig (arc, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > badge4_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > bcm2835_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > bcm63xx_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > bigsur_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > bmips_be_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > bmips_stb_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > cavium_octeon_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > cerfcube_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > ci20_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > cm_x300_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > collie_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > corgi_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config (arm64, clang-13) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chromebook (arm64, clang-13) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.config+arm64-chromebook (arm64, clang-13) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > cros://chromeos-5.10/arm64/chromiumos-qualcomm.flavour.config+arm64-chromebook (arm64, clang-13) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (arm, clang-13) — FAIL, 1 error, 5 warnings, 0 section mismatches
> >
> > Errors:
> >     lib/maple_tree.c:4272:20: error: stack frame size (1096) exceeds limit (1024) in function 'mas_wr_modify' [-Werror,-Wframe-larger-than]
> >
> > Warnings:
> >     clang: warning: argument unused during compilation: '-march=armv7-a' [-Wunused-command-line-argument]
> >     clang: warning: argument unused during compilation: '-march=armv7-a' [-Wunused-command-line-argument]
> >     clang: warning: argument unused during compilation: '-march=armv7-a' [-Wunused-command-line-argument]
> >     clang: warning: argument unused during compilation: '-march=armv7-a' [-Wunused-command-line-argument]
> >     clang: warning: argument unused during compilation: '-march=armv7-a' [-Wunused-command-line-argument]
> >
> > --------------------------------------------------------------------------------
> > cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (arm, clang-13) — FAIL, 1 error, 5 warnings, 0 section mismatches
> >
> > Errors:
> >     lib/maple_tree.c:4272:20: error: stack frame size (1096) exceeds limit (1024) in function 'mas_wr_modify' [-Werror,-Wframe-larger-than]
> >
> > Warnings:
> >     clang: warning: argument unused during compilation: '-march=armv7-a' [-Wunused-command-line-argument]
> >     clang: warning: argument unused during compilation: '-march=armv7-a' [-Wunused-command-line-argument]
> >     clang: warning: argument unused during compilation: '-march=armv7-a' [-Wunused-command-line-argument]
> >     clang: warning: argument unused during compilation: '-march=armv7-a' [-Wunused-command-line-argument]
> >     clang: warning: argument unused during compilation: '-march=armv7-a' [-Wunused-command-line-argument]
> >
> > --------------------------------------------------------------------------------
> > cros://chromeos-5.10/x86_64/chromeos-intel-pineview.flavour.config+x86-chromebook (x86_64, clang-13) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config (x86_64, clang-13) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config+x86-chromebook (x86_64, clang-13) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > cu1000-neo_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > cu1830-neo_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > davinci_all_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > db1xxx_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > decstation_64_defconfig (mips, gcc-10) — FAIL, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > decstation_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > decstation_r4k_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > defconfig (riscv, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > defconfig (arm64, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > defconfig+CONFIG_ARM64_16K_PAGES=y (arm64, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > defconfig+CONFIG_ARM64_64K_PAGES=y (arm64, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > defconfig+CONFIG_ARM64_64K_PAGES=y (arm64, clang-15) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > defconfig+CONFIG_CPU_BIG_ENDIAN=y (arm64, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > defconfig+CONFIG_EFI=n (riscv, clang-15) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > defconfig+CONFIG_RANDOMIZE_BASE=y (arm64, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > defconfig+arm64-chromebook (arm64, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > defconfig+arm64-chromebook (arm64, clang-13) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > defconfig+arm64-chromebook+kselftest (arm64, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > defconfig+crypto (arm64, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > defconfig+debug (riscv, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > defconfig+debug (arm64, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > defconfig+ima (arm64, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > defconfig+kselftest (riscv, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > defconfig+kselftest (arm64, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > e55_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > eseries_pxa_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > exynos_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > ezx_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > fuloong2e_defconfig (mips, gcc-10) — PASS, 1 error, 0 warnings, 0 section mismatches
> >
> > Errors:
> >     cc1: error: ‘-mloongson-mmi’ must be used with ‘-mhard-float’
> >
> > --------------------------------------------------------------------------------
> > gcw0_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > h3600_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > h5000_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > hackkit_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > haps_hs_defconfig (arc, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > haps_hs_smp_defconfig (arc, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > haps_hs_smp_defconfig+debug (arc, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > haps_hs_smp_defconfig+kselftest (arc, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > hisi_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > hsdk_defconfig (arc, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > i386_defconfig (i386, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > i386_defconfig (i386, clang-15) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > i386_defconfig+debug (i386, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > i386_defconfig+kselftest (i386, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > imx_v4_v5_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > imx_v6_v7_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > imxrt_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > integrator_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > ip22_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > ip27_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > ip28_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > ip32_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > ixp4xx_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > jazz_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > keystone_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > lart_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > lemote2f_defconfig (mips, gcc-10) — PASS, 1 error, 0 warnings, 0 section mismatches
> >
> > Errors:
> >     cc1: error: ‘-mloongson-mmi’ must be used with ‘-mhard-float’
> >
> > --------------------------------------------------------------------------------
> > loongson1b_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > loongson1c_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > loongson2k_defconfig (mips, gcc-10) — PASS, 1 error, 0 warnings, 0 section mismatches
> >
> > Errors:
> >     cc1: error: ‘-mloongson-mmi’ must be used with ‘-mhard-float’
> >
> > --------------------------------------------------------------------------------
> > loongson3_defconfig (mips, gcc-10) — PASS, 1 error, 0 warnings, 0 section mismatches
> >
> > Errors:
> >     cc1: error: ‘-mloongson-mmi’ must be used with ‘-mhard-float’
> >
> > --------------------------------------------------------------------------------
> > lpc32xx_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > lpd270_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > lubbock_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > magician_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > mainstone_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > malta_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > malta_qemu_32r6_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > maltaaprp_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > maltasmvp_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > maltasmvp_eva_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > maltaup_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > maltaup_xpa_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > milbeaut_m10v_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > mini2440_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > mmp2_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > moxart_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > mtx1_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > multi_v4t_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > multi_v5_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > multi_v5_defconfig (arm, clang-15) — PASS, 0 errors, 2 warnings, 0 section mismatches
> >
> > Warnings:
> >     lib/maple_tree.c:4272:20: warning: stack frame size (1088) exceeds limit (1024) in 'mas_wr_modify' [-Wframe-larger-than]
> >     1 warning generated.
> >
> > --------------------------------------------------------------------------------
> > multi_v7_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > multi_v7_defconfig (arm, clang-15) — PASS, 0 errors, 12 warnings, 0 section mismatches
> >
> > Warnings:
> >     clang: warning: argument unused during compilation: '-march=armv7-a' [-Wunused-command-line-argument]
> >     clang: warning: argument unused during compilation: '-march=armv7-a' [-Wunused-command-line-argument]
> >     clang: warning: argument unused during compilation: '-march=armv7-a' [-Wunused-command-line-argument]
> >     clang: warning: argument unused during compilation: '-march=armv7-a' [-Wunused-command-line-argument]
> >     clang: warning: argument unused during compilation: '-march=armv7-a' [-Wunused-command-line-argument]
> >     clang: warning: argument unused during compilation: '-march=armv7-a' [-Wunused-command-line-argument]
> >     clang: warning: argument unused during compilation: '-march=armv7-a' [-Wunused-command-line-argument]
> >     clang: warning: argument unused during compilation: '-march=armv7-a' [-Wunused-command-line-argument]
> >     clang: warning: argument unused during compilation: '-march=armv7-a' [-Wunused-command-line-argument]
> >     lib/maple_tree.c:4272:20: warning: stack frame size (1096) exceeds limit (1024) in 'mas_wr_modify' [-Wframe-larger-than]
> >     1 warning generated.
> >     clang: warning: argument unused during compilation: '-march=armv7-a' [-Wunused-command-line-argument]
> >
> > --------------------------------------------------------------------------------
> > multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=y (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > multi_v7_defconfig+CONFIG_EFI=y+CONFIG_ARM_LPAE=y (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > multi_v7_defconfig+CONFIG_SMP=n (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > multi_v7_defconfig+debug (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > multi_v7_defconfig+kselftest (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > mvebu_v5_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > mvebu_v7_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > mxs_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > neponset_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > netwinder_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > nommu_k210_sdcard_defconfig (riscv, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > nsimosci_hs_smp_defconfig (arc, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > omap2plus_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > orion5x_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > oxnas_v6_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > palmz72_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > pcm027_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > pic32mzda_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > pleb_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > pxa168_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > pxa255-idp_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > pxa3xx_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > pxa910_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > pxa_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > qcom_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > qi_lb60_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > rb532_defconfig (mips, gcc-10) — PASS, 0 errors, 1 warning, 0 section mismatches
> >
> > Warnings:
> >     cc1: warning: result of ‘-117440512 << 16’ requires 44 bits to represent, but ‘int’ only has 32 bits [-Wshift-overflow=]
> >
> > --------------------------------------------------------------------------------
> > rbtx49xx_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > realview_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > rm200_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > rs90_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > rt305x_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > rv32_defconfig (riscv, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > s3c2410_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > s3c6400_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > s5pv210_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > sama5_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > sama7_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > sb1250_swarm_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > shannon_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > shmobile_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > simpad_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > socfpga_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > spear13xx_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > spear3xx_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > spear6xx_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > stm32_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > sunxi_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > tb0219_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > tb0226_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > tb0287_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > tct_hammer_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > tegra_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > tinyconfig (i386, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > tinyconfig (x86_64, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > tinyconfig (arc, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > trizeps4_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > u8500_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > vdk_hs38_defconfig (arc, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > vdk_hs38_smp_defconfig (arc, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > versatile_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > vexpress_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > vf610m4_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > vocore2_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > vt8500_v6_v7_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > workpad_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > x86_64_defconfig (x86_64, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > x86_64_defconfig (x86_64, clang-15) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > x86_64_defconfig+amdgpu (x86_64, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > x86_64_defconfig+crypto (x86_64, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > x86_64_defconfig+ima (x86_64, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > x86_64_defconfig+kselftest (x86_64, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > x86_64_defconfig+x86-chromebook (x86_64, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > x86_64_defconfig+x86-chromebook+amdgpu (x86_64, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > x86_64_defconfig+x86-chromebook+kselftest (x86_64, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > x86_64_defconfig+x86_kvm_guest (x86_64, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > xcep_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > --------------------------------------------------------------------------------
> > zeus_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
> >
> > ---
> > For more info write to <info@kernelci.org>
> >
> 
> 
> -- 
> Thanks,
> ~Nick Desaulniers
> 
