Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA68A29A8;
	Thu, 10 Aug 2023 07:17:00 +0000 (UTC)
Received: from [IPV6:2001:861:4a40:8620:8ec6:a7f6:c8cb:a10d] (unknown [IPv6:2001:861:4a40:8620:8ec6:a7f6:c8cb:a10d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: gtucker)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1765966071DF;
	Thu, 10 Aug 2023 08:16:59 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1691651819;
	bh=lcD3NUwEsqYPBgQmGeJcvTNH9A3+zYataTIYQ1YxJ2k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jo6JnVZWBmwUF7sGIZ4t8X/bprgJutVozoTI96kSlFg/X2OdaQbq8b1ojEJM0QJ5X
	 jIVvHY0ZwWg4QWMJS+lc9Jh71DU4f7keKlYaCKnTIdSwFpuRseyR+yeyk9ggyZB6e3
	 HbwMmj4Mpwc2JVBTE+q8n7H13UhdkydtuF0wtAscdl2hxuVZknzHhM4jRnUl1/lgh8
	 bvapcN4wazmbd07vZBBUGjaLM71LiDOW8zTiN62V3Qs7/epebkrSDyHwjolSGf/8Nq
	 4/iddj7Jihs+AC+WuELwWKd9GbIinIhYLtH1BL5Z99WaGvsSxBL7jppDsDyM/jPhbU
	 eSsP0YGV51gPg==
Message-ID: <4bc752d5-6b36-bafd-0a51-693527fc1db3@collabora.com>
Date: Thu, 10 Aug 2023 09:16:52 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: next/master build: 188 builds: 4 failed, 184 passed, 4 errors, 22
 warnings (next-20230802)
Content-Language: en-US
To: Nick Desaulniers <ndesaulniers@google.com>, kernelci@lists.linux.dev
Cc: llvm@lists.linux.dev
References: <64c9ef5e.170a0220.c258a.0ec6@mx.google.com>
 <CAKwvOdmuXnChEiZ-VOPbhYd_VzqjCJ0+Jc_38hwWMCDDDNM3uA@mail.gmail.com>
From: Guillaume Tucker <guillaume.tucker@collabora.com>
In-Reply-To: <CAKwvOdmuXnChEiZ-VOPbhYd_VzqjCJ0+Jc_38hwWMCDDDNM3uA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Nick,

Sorry for the slow reply, it's the holiday season again.

On 02/08/2023 19:06, Nick Desaulniers wrote:
> Hi KernelCI team.  Thanks for these reports, as always, they are my
> "morning paper."

Thank you so much!  Hope it doesn't bring too much terrible news ;)

> Is it possible to filter out `1 warning generated.` in these reports
> (guessing that can be more than 1)?  Otherwise that's showing up in
> the diagnostic list at the top, then for individual build reports is
> showing up as 2 warnings instead of 1.

Ah, yes.  In principle we're not making changes to the old
codebase that's generating these email reports but this looks
like a bug that's impacting users (at least you) so we should be
able to roll out a fix.  I guess the compiler output has changed
since when the parser was implemented several years ago.

With the new KernelCI API and pipeline, we'll be doing builds
differently and we'll have a much more flexible way of reporting
errors and warnings like this.  We could even have a specific way
of parsing the output for LLVM builds.  Out of interest, are you
doing any post-processing on these email reports or just manual
inspection and text search?

Thanks,
Guillaume

> On Tue, Aug 1, 2023 at 10:53 PM kernelci.org bot <bot@kernelci.org> wrote:
>>
>> next/master build: 188 builds: 4 failed, 184 passed, 4 errors, 22 warnings (next-20230802)
>>
>> Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/next-20230802/
>>
>> Tree: next
>> Branch: master
>> Git Describe: next-20230802
>> Git Commit: 626c67169f9972fffcdf3bc3864de421f162ebf5
>> Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>> Built: 8 unique architectures
>>
>> Build Failures Detected:
>>
>> arc:
>>     haps_hs_smp_defconfig+kselftest: (gcc-10) FAIL
>>
>> arm:
>>     rpc_defconfig: (gcc-10) FAIL
>>
>> x86_64:
>>     x86_64_defconfig+kselftest: (rustc-1.70) FAIL
>>     x86_64_defconfig+rust: (rustc-1.70) FAIL
>>
>> Errors and Warnings Detected:
>>
>> arc:
>>     haps_hs_smp_defconfig+kselftest (gcc-10): 1 error
>>
>> arm64:
>>     defconfig (clang-17): 2 warnings
>>     defconfig+CONFIG_ARM64_64K_PAGES=y (clang-17): 2 warnings
>>
>> arm:
>>     h3600_defconfig (gcc-10): 1 warning
>>     rpc_defconfig (gcc-10): 2 errors
>>
>> i386:
>>
>> mips:
>>
>> riscv:
>>     defconfig (clang-17): 2 warnings
>>     rv32_defconfig (clang-17): 2 warnings
>>
>> sparc:
>>     allnoconfig (gcc-10): 1 warning
>>     sparc32_defconfig (gcc-10): 2 warnings
>>     sparc64_defconfig (gcc-10): 4 warnings
>>     sparc64_defconfig+debug (gcc-10): 2 warnings
>>     sparc64_defconfig+kselftest (gcc-10): 2 warnings
>>     tinyconfig (gcc-10): 1 warning
>>
>> x86_64:
>>     x86_64_defconfig+kselftest (rustc-1.70): 1 error, 1 warning
>>
>> Errors summary:
>>
>>     1    net/bpfilter/main.c:3:10: fatal error: sys/uio.h: No such file or directory
>>     1    fs/btrfs/extent_io.c:232:16: error: variable 'pages_processed' set but not used [-Werror,-Wunused-but-set-variable]
>>     1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=0x'
>>     1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=0x'
>>
>> Warnings summary:
>>
>>     10   <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
>>     4    fs/btrfs/extent_io.c:232:16: warning: variable 'pages_processed' set but not used [-Wunused-but-set-variable]
>>     4    1 warning generated.
>>     2    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation failed, symbol will not be versioned.
>>     1    vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x23: relocation to !ENDBR: .text+0x1395ab
>>     1    drivers/mfd/ipaq-micro.c:81:6: warning: unused variable ‘i’ [-Wunused-variable]
>>
>> ================================================================================
>>
>> Detailed per-defconfig build reports:
>>
>> --------------------------------------------------------------------------------
>> 32r2el_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> 32r2el_defconfig+debug (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> 32r2el_defconfig+kselftest (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> allnoconfig (i386, clang-17) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> allnoconfig (x86_64, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> allnoconfig (sparc, gcc-10) — PASS, 0 errors, 1 warning, 0 section mismatches
>>
>> Warnings:
>>     <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
>>
>> --------------------------------------------------------------------------------
>> allnoconfig (x86_64, clang-17) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> allnoconfig (arc, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> allnoconfig (i386, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> am200epdkit_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> ar7_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> aspeed_g4_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> aspeed_g5_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> aspeed_g5_defconfig (arm, clang-17) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> assabet_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> at91_dt_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> ath25_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> ath79_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> axm55xx_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> axs103_defconfig (arc, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> axs103_smp_defconfig (arc, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> bcm2835_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> bcm47xx_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> bcm63xx_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> bigsur_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> bmips_be_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> bmips_stb_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> cavium_octeon_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> ci20_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> cobalt_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> collie_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> cu1000-neo_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> cu1830-neo_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> davinci_all_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> db1xxx_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> decstation_64_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> decstation_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> decstation_r4k_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> defconfig (riscv, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> defconfig (arm64, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> defconfig (riscv, clang-17) — PASS, 0 errors, 2 warnings, 0 section mismatches
>>
>> Warnings:
>>     fs/btrfs/extent_io.c:232:16: warning: variable 'pages_processed' set but not used [-Wunused-but-set-variable]
>>     1 warning generated.
>>
>> --------------------------------------------------------------------------------
>> defconfig (arm64, clang-17) — PASS, 0 errors, 2 warnings, 0 section mismatches
>>
>> Warnings:
>>     fs/btrfs/extent_io.c:232:16: warning: variable 'pages_processed' set but not used [-Wunused-but-set-variable]
>>     1 warning generated.
>>
>> --------------------------------------------------------------------------------
>> defconfig+CONFIG_ARM64_16K_PAGES=y (arm64, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> defconfig+CONFIG_ARM64_64K_PAGES=y (arm64, clang-17) — PASS, 0 errors, 2 warnings, 0 section mismatches
>>
>> Warnings:
>>     fs/btrfs/extent_io.c:232:16: warning: variable 'pages_processed' set but not used [-Wunused-but-set-variable]
>>     1 warning generated.
>>
>> --------------------------------------------------------------------------------
>> defconfig+CONFIG_ARM64_64K_PAGES=y (arm64, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> defconfig+CONFIG_CPU_BIG_ENDIAN=y (arm64, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> defconfig+CONFIG_RANDOMIZE_BASE=y (arm64, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> defconfig+arm64-chromebook (arm64, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> defconfig+arm64-chromebook+kselftest (arm64, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> defconfig+arm64-chromebook+videodec (arm64, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> defconfig+debug (riscv, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> defconfig+debug (arm64, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> defconfig+kselftest (riscv, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> defconfig+kselftest (arm64, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> defconfig+videodec (arm64, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> exynos_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> footbridge_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> fuloong2e_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> gcw0_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> gemini_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> gpr_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> h3600_defconfig (arm, gcc-10) — PASS, 0 errors, 1 warning, 0 section mismatches
>>
>> Warnings:
>>     drivers/mfd/ipaq-micro.c:81:6: warning: unused variable ‘i’ [-Wunused-variable]
>>
>> --------------------------------------------------------------------------------
>> haps_hs_defconfig (arc, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> haps_hs_smp_defconfig (arc, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> haps_hs_smp_defconfig+debug (arc, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> haps_hs_smp_defconfig+kselftest (arc, gcc-10) — FAIL, 1 error, 0 warnings, 0 section mismatches
>>
>> Errors:
>>     net/bpfilter/main.c:3:10: fatal error: sys/uio.h: No such file or directory
>>
>> --------------------------------------------------------------------------------
>> hisi_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> hsdk_defconfig (arc, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> i386_defconfig (i386, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> i386_defconfig (i386, clang-17) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> i386_defconfig+debug (i386, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> i386_defconfig+kselftest (i386, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> imx_v4_v5_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> imx_v6_v7_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> imxrt_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> integrator_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> ip22_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> ip27_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> ip28_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> ip32_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> ixp4xx_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> jazz_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> jornada720_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> keystone_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> lemote2f_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> loongson1b_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> loongson1c_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> loongson2k_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> loongson3_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> lpc18xx_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> lpc32xx_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> malta_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> malta_kvm_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> malta_qemu_32r6_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> maltaaprp_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> maltasmvp_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> maltasmvp_eva_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> maltaup_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> maltaup_xpa_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> milbeaut_m10v_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> mmp2_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> moxart_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> mps2_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> mtx1_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> multi_v4t_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> multi_v5_defconfig (arm, clang-17) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> multi_v5_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> multi_v7_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> multi_v7_defconfig (arm, clang-17) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=y (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> multi_v7_defconfig+CONFIG_EFI=y+CONFIG_ARM_LPAE=y (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> multi_v7_defconfig+CONFIG_SMP=n (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> multi_v7_defconfig+debug (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> multi_v7_defconfig+kselftest (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> mvebu_v5_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> mvebu_v7_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> mxs_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> neponset_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> netwinder_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> nhk8815_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> nommu_k210_defconfig (riscv, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> nommu_k210_defconfig (riscv, clang-17) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> nommu_k210_sdcard_defconfig (riscv, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> nommu_k210_sdcard_defconfig (riscv, clang-17) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> nsimosci_hs_defconfig (arc, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> nsimosci_hs_smp_defconfig (arc, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> omap2plus_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> omega2p_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> orion5x_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> pic32mzda_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> pxa168_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> pxa3xx_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> pxa910_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> pxa_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> qcom_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> qi_lb60_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> rb532_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> rbtx49xx_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> realview_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> rm200_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> rpc_defconfig (arm, gcc-10) — FAIL, 2 errors, 0 warnings, 0 section mismatches
>>
>> Errors:
>>     arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=0x'
>>     arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=0x'
>>
>> --------------------------------------------------------------------------------
>> rs90_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> rt305x_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> rv32_defconfig (riscv, clang-17) — PASS, 0 errors, 2 warnings, 0 section mismatches
>>
>> Warnings:
>>     fs/btrfs/extent_io.c:232:16: warning: variable 'pages_processed' set but not used [-Wunused-but-set-variable]
>>     1 warning generated.
>>
>> --------------------------------------------------------------------------------
>> rv32_defconfig (riscv, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> s3c6400_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> s5pv210_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> sama5_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> sama7_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> sb1250_swarm_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> shmobile_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> socfpga_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> sp7021_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> sparc32_defconfig (sparc, gcc-10) — PASS, 0 errors, 2 warnings, 0 section mismatches
>>
>> Warnings:
>>     <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
>>     <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
>>
>> --------------------------------------------------------------------------------
>> sparc64_defconfig (sparc, gcc-10) — PASS, 0 errors, 4 warnings, 0 section mismatches
>>
>> Warnings:
>>     <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
>>     WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation failed, symbol will not be versioned.
>>     <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
>>     WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation failed, symbol will not be versioned.
>>
>> --------------------------------------------------------------------------------
>> sparc64_defconfig+debug (sparc, gcc-10) — PASS, 0 errors, 2 warnings, 0 section mismatches
>>
>> Warnings:
>>     <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
>>     <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
>>
>> --------------------------------------------------------------------------------
>> sparc64_defconfig+kselftest (sparc, gcc-10) — PASS, 0 errors, 2 warnings, 0 section mismatches
>>
>> Warnings:
>>     <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
>>     <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
>>
>> --------------------------------------------------------------------------------
>> spear13xx_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> spear3xx_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> spear6xx_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> spitz_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> stm32_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> sunxi_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> tegra_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> tinyconfig (arc, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> tinyconfig (i386, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> tinyconfig (x86_64, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> tinyconfig (sparc, gcc-10) — PASS, 0 errors, 1 warning, 0 section mismatches
>>
>> Warnings:
>>     <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
>>
>> --------------------------------------------------------------------------------
>> u8500_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> vdk_hs38_defconfig (arc, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> vdk_hs38_smp_defconfig (arc, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> versatile_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> vexpress_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> vf610m4_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> vocore2_defconfig (mips, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> vt8500_v6_v7_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> wpcm450_defconfig (arm, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> x86_64_defconfig (x86_64, rustc-1.70) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> x86_64_defconfig (x86_64, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> x86_64_defconfig (x86_64, clang-17) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> x86_64_defconfig+debug (x86_64, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> x86_64_defconfig+kselftest (x86_64, rustc-1.70) — FAIL, 1 error, 1 warning, 0 section mismatches
>>
>> Errors:
>>     fs/btrfs/extent_io.c:232:16: error: variable 'pages_processed' set but not used [-Werror,-Wunused-but-set-variable]
>>
>> Warnings:
>>     vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x23: relocation to !ENDBR: .text+0x1395ab
>>
>> --------------------------------------------------------------------------------
>> x86_64_defconfig+kselftest (x86_64, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> x86_64_defconfig+rust (x86_64, rustc-1.70) — FAIL, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> x86_64_defconfig+rust-samples (x86_64, rustc-1.70) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> x86_64_defconfig+x86-chromebook (x86_64, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> --------------------------------------------------------------------------------
>> x86_64_defconfig+x86-chromebook+kselftest (x86_64, gcc-10) — PASS, 0 errors, 0 warnings, 0 section mismatches
>>
>> ---
>> For more info write to <info@kernelci.org>
>>
> 
> 

