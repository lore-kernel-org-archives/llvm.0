Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76783FDF
	for <llvm@lists.linux.dev>; Mon, 27 Nov 2023 10:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jST5t1RK"
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-462c6f436e4so1299195137.2
        for <llvm@lists.linux.dev>; Mon, 27 Nov 2023 02:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701080680; x=1701685480; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kQcYZagRH+sWiCa3XG+USxp4TwxsDCW824WxKRgWP4w=;
        b=jST5t1RKt7m7rW4DFRuZYpB9edX9xYUJqyd3nehOunDLkek9bqHOUZDG8PUT8Wtkca
         ChTQcuuJ+f0RLJPR7cwcX2NB5dBySOT5xZMcHKp7gzdxhD5ayEgY7H6YHEgB9dc3+0bx
         qYOWHH05UgExqqRylgsWKSE92XYBNTLNFIf6gouNoLCNcz0zLEkUAGNPqNz1Pgln6VQV
         oMHIaImF1oPlTYoQYq2KoApoq4afCei8O+KKjA1FrCZOkkAoWdzP+D3ujNxb95MH/oB5
         Jl1irmvRooQwNeJB5HeXdEvQGJJNi35q9JwzBnMj4R2fmMFXVhipdMD3/AI8wWUGvx6w
         6x1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701080680; x=1701685480;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kQcYZagRH+sWiCa3XG+USxp4TwxsDCW824WxKRgWP4w=;
        b=sCdOiZilZPCx8aIkzZ49s6zcIZO7/i4Z4/ESjmVuVPqxLSCRsNi+Ox2lkVkWqNVQAH
         UlYEX0z78V8wOPj8PmYuEvqUX7uOyhUG3c6gu4eLio1Qze7GL1PW37B0HXo2eGLUPV0f
         31+7knfp+n4wPfrIkXcagVNPXFl4hvdPUWRaHvF3CjFvA9xPovtZGX470Ddo6Zdlq1ks
         pENRNF/svVMNFQOKQpCSo516SZfL9ZtEQ0TsCHRlEQQIydyGmgt3bgH2aRK5Ycfom9fW
         nfox64i0YJx3hol8Dnah+5On2cVuR4xycW0tF/scis62rc6H+nfx97nHDRKEHwt+kgBN
         TKfg==
X-Gm-Message-State: AOJu0YwBlLEjdwajqJG+04QqwV0XyO8Kl4t2eAh3PBu1uHVUgyleywEJ
	7xd5XYi/CvcnmtHHxDH6qi5UGyCI/5BwCc4Qa3MOXw==
X-Google-Smtp-Source: AGHT+IFaIFutf6fTQvnQSmSKQhz1xEKeqV7M7kawbq782Uv+Ok5kW0UrGEYchQvkH0VI2ze/WXtrwKOfwYUBlpXj5NU=
X-Received: by 2002:a05:6102:f10:b0:462:99aa:a077 with SMTP id
 v16-20020a0561020f1000b0046299aaa077mr13681421vss.31.1701080680580; Mon, 27
 Nov 2023 02:24:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 27 Nov 2023 15:54:29 +0530
Message-ID: <CA+G9fYuM6SXzQSgvB4w=Ev4KL3_xV=rUdhs_BX9Ya_yYUqFXow@mail.gmail.com>
Subject: mips: ralink/irq.c:86:5: error: no previous prototype for 'get_c0_perfcount_int'
To: linux-mips@vger.kernel.org, clang-built-linux <llvm@lists.linux.dev>, 
	lkft-triage@lists.linaro.org, regressions@lists.linux.dev
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Arnd Bergmann <arnd@arndb.de>, 
	Nathan Chancellor <nathan@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

[Sorry for the long email]

Following MIPS defconfig and other builds failed with gcc-12 /8 and clang
toolchains on Linux next-20231127 tag.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

mips:
  build:
    * gcc-12-rt305x_defconfig
    * gcc-12-allnoconfig
    * gcc-12-ath79_defconfig
    * gcc-12-malta_defconfig
    * gcc-12-defconfig
    * gcc-12-bcm63xx_defconfig
    * gcc-12-tinyconfig
    * gcc-8-allnoconfig
    * gcc-8-tinyconfig
    * gcc-8-rt305x_defconfig
    * gcc-8-bcm63xx_defconfig
    * gcc-8-bcm47xx_defconfig
    * gcc-8-ath79_defconfig
    * gcc-8-defconfig
    * gcc-8-malta_defconfig
    * gcc-12-bcm47xx_defconfig
    * clang-17-tinyconfig
    * clang-17-defconfig
    * clang-17-allnoconfig
    * clang-nightly-defconfig
    * clang-nightly-tinyconfig
    * clang-nightly-allnoconfig


Build log:
----------
arch/mips/ralink/irq.c:86:5: error: no previous prototype for
'get_c0_perfcount_int' [-Werror=missing-prototypes]
   86 | int get_c0_perfcount_int(void)
      |     ^~~~~~~~~~~~~~~~~~~~
arch/mips/ralink/irq.c:92:14: error: no previous prototype for
'get_c0_compare_int' [-Werror=missing-prototypes]
   92 | unsigned int get_c0_compare_int(void)
      |              ^~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

arch/mips/kernel/signal.c:438:5: error: no previous prototype for
'setup_sigcontext' [-Werror=missing-prototypes]
  438 | int setup_sigcontext(struct pt_regs *regs, struct sigcontext __user *sc)
      |     ^~~~~~~~~~~~~~~~
arch/mips/kernel/signal.c:515:5: error: no previous prototype for
'restore_sigcontext' [-Werror=missing-prototypes]
  515 | int restore_sigcontext(struct pt_regs *regs, struct sigcontext
__user *sc)
      |     ^~~~~~~~~~~~~~~~~~
arch/mips/kernel/signal.c:636:17: error: no previous prototype for
'sys_sigreturn' [-Werror=missing-prototypes]
  636 | asmlinkage void sys_sigreturn(void)
      |                 ^~~~~~~~~~~~~
arch/mips/kernel/signal.c:673:17: error: no previous prototype for
'sys_rt_sigreturn' [-Werror=missing-prototypes]
  673 | asmlinkage void sys_rt_sigreturn(void)
      |                 ^~~~~~~~~~~~~~~~
arch/mips/kernel/signal.c:903:17: error: no previous prototype for
'do_notify_resume' [-Werror=missing-prototypes]
  903 | asmlinkage void do_notify_resume(struct pt_regs *regs, void *unused,
      |                 ^~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors


arch/mips/kernel/syscall.c:51:16: error: no previous prototype for
'sysm_pipe' [-Werror=missing-prototypes]
   51 | asmlinkage int sysm_pipe(void)
      |                ^~~~~~~~~
cc1: all warnings being treated as errors

arch/mips/kernel/traps.c:370:6: error: no previous prototype for
'show_registers' [-Werror=missing-prototypes]
  370 | void show_registers(struct pt_regs *regs)
      |      ^~~~~~~~~~~~~~
arch/mips/kernel/traps.c:447:17: error: no previous prototype for
'do_be' [-Werror=missing-prototypes]
  447 | asmlinkage void do_be(struct pt_regs *regs)
      |                 ^~~~~
arch/mips/kernel/traps.c:752:17: error: no previous prototype for
'do_ov' [-Werror=missing-prototypes]
  752 | asmlinkage void do_ov(struct pt_regs *regs)
      |                 ^~~~~
arch/mips/kernel/traps.c:874:17: error: no previous prototype for
'do_fpe' [-Werror=missing-prototypes]
  874 | asmlinkage void do_fpe(struct pt_regs *regs, unsigned long fcr31)
      |                 ^~~~~~
arch/mips/kernel/traps.c:1027:17: error: no previous prototype for
'do_bp' [-Werror=missing-prototypes]
 1027 | asmlinkage void do_bp(struct pt_regs *regs)
      |                 ^~~~~
arch/mips/kernel/traps.c:1114:17: error: no previous prototype for
'do_tr' [-Werror=missing-prototypes]
 1114 | asmlinkage void do_tr(struct pt_regs *regs)
      |                 ^~~~~
arch/mips/kernel/traps.c:1151:17: error: no previous prototype for
'do_ri' [-Werror=missing-prototypes]
 1151 | asmlinkage void do_ri(struct pt_regs *regs)
      |                 ^~~~~
arch/mips/kernel/traps.c:1402:17: error: no previous prototype for
'do_cpu' [-Werror=missing-prototypes]
 1402 | asmlinkage void do_cpu(struct pt_regs *regs)
      |                 ^~~~~~
arch/mips/kernel/traps.c:1507:17: error: no previous prototype for
'do_msa_fpe' [-Werror=missing-prototypes]
 1507 | asmlinkage void do_msa_fpe(struct pt_regs *regs, unsigned int msacsr)
      |                 ^~~~~~~~~~
arch/mips/kernel/traps.c:1527:17: error: no previous prototype for
'do_msa' [-Werror=missing-prototypes]
 1527 | asmlinkage void do_msa(struct pt_regs *regs)
      |                 ^~~~~~
arch/mips/kernel/traps.c:1548:17: error: no previous prototype for
'do_mdmx' [-Werror=missing-prototypes]
 1548 | asmlinkage void do_mdmx(struct pt_regs *regs)
      |                 ^~~~~~~
arch/mips/kernel/traps.c:1560:17: error: no previous prototype for
'do_watch' [-Werror=missing-prototypes]
 1560 | asmlinkage void do_watch(struct pt_regs *regs)
      |                 ^~~~~~~~
arch/mips/kernel/traps.c:1587:17: error: no previous prototype for
'do_mcheck' [-Werror=missing-prototypes]
 1587 | asmlinkage void do_mcheck(struct pt_regs *regs)
      |                 ^~~~~~~~~
arch/mips/kernel/traps.c:1612:17: error: no previous prototype for
'do_mt' [-Werror=missing-prototypes]
 1612 | asmlinkage void do_mt(struct pt_regs *regs)
      |                 ^~~~~
arch/mips/kernel/traps.c:1648:17: error: no previous prototype for
'do_dsp' [-Werror=missing-prototypes]
 1648 | asmlinkage void do_dsp(struct pt_regs *regs)
      |                 ^~~~~~
arch/mips/kernel/traps.c:1656:17: error: no previous prototype for
'do_reserved' [-Werror=missing-prototypes]
 1656 | asmlinkage void do_reserved(struct pt_regs *regs)
      |                 ^~~~~~~~~~~
arch/mips/kernel/traps.c:1832:17: error: no previous prototype for
'cache_parity_error' [-Werror=missing-prototypes]
 1832 | asmlinkage void cache_parity_error(void)
      |                 ^~~~~~~~~~~~~~~~~~
arch/mips/kernel/traps.c:1880:17: error: no previous prototype for
'do_ftlb' [-Werror=missing-prototypes]
 1880 | asmlinkage void do_ftlb(void)
      |                 ^~~~~~~
arch/mips/kernel/traps.c:1909:17: error: no previous prototype for
'do_gsexc' [-Werror=missing-prototypes]
 1909 | asmlinkage void do_gsexc(struct pt_regs *regs, u32 diag1)
      |                 ^~~~~~~~
arch/mips/kernel/traps.c:1944:6: error: no previous prototype for
'ejtag_exception_handler' [-Werror=missing-prototypes]
 1944 | void ejtag_exception_handler(struct pt_regs *regs)
      |      ^~~~~~~~~~~~~~~~~~~~~~~
arch/mips/kernel/traps.c:1989:17: error: no previous prototype for
'nmi_exception_handler' [-Werror=missing-prototypes]
 1989 | void __noreturn nmi_exception_handler(struct pt_regs *regs)
      |                 ^~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

arch/mips/kernel/unaligned.c:1516:17: error: no previous prototype for
'do_ade' [-Werror=missing-prototypes]
 1516 | asmlinkage void do_ade(struct pt_regs *regs)
      |                 ^~~~~~
cc1: all warnings being treated as errors

arch/mips/mm/fault.c:323:17: error: no previous prototype for
'do_page_fault' [-Werror=missing-prototypes]
  323 | asmlinkage void do_page_fault(struct pt_regs *regs,
      |                 ^~~~~~~~~~~~~
cc1: all warnings being treated as errors

arch/mips/kernel/spram.c:194:6: error: no previous prototype for
'spram_config' [-Werror=missing-prototypes]
  194 | void spram_config(void)
      |      ^~~~~~~~~~~~
cc1: all warnings being treated as errors

arch/mips/mm/init.c:60:6: error: no previous prototype for
'setup_zero_pages' [-Werror=missing-prototypes]
   60 | void setup_zero_pages(void)
      |      ^~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

arch/mips/mm/tlbex.c:2547:6: error: no previous prototype for
'build_tlb_refill_handler' [-Werror=missing-prototypes]
 2547 | void build_tlb_refill_handler(void)
      |      ^~~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

arch/mips/mm/uasm.c:421:5: error: no previous prototype for
'uasm_in_compat_space_p' [-Werror=missing-prototypes]
  421 | int uasm_in_compat_space_p(long addr)
      |     ^~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

arch/mips/mm/c-r4k.c:1588:6: error: no previous prototype for
'au1x00_fixup_config_od' [-Werror=missing-prototypes]
 1588 | void au1x00_fixup_config_od(void)
      |      ^~~~~~~~~~~~~~~~~~~~~~
arch/mips/mm/c-r4k.c:1703:6: error: no previous prototype for
'r4k_cache_init' [-Werror=missing-prototypes]
 1703 | void r4k_cache_init(void)
      |      ^~~~~~~~~~~~~~
arch/mips/mm/c-r4k.c:1831:12: error: no previous prototype for
'r4k_cache_init_pm' [-Werror=missing-prototypes]
 1831 | int __init r4k_cache_init_pm(void)
      |            ^~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

arch/mips/mm/tlb-r4k.c:553:6: error: no previous prototype for
'tlb_init' [-Werror=missing-prototypes]
  553 | void tlb_init(void)
      |      ^~~~~~~~
cc1: all warnings being treated as errors

steps to reproduce:
--------

# tuxmake --runtime podman --target-arch mips --toolchain gcc-12
--kconfig bcm63xx_defconfig


Links:
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20231127/testrun/21323584/suite/build/test/gcc-12-rt305x_defconfig/log
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20231127/testrun/21323584/suite/build/test/gcc-12-rt305x_defconfig/history/
- https://storage.tuxsuite.com/public/linaro/lkft/builds/2Yk9XTZIxZgMhlvkvmFPOkt1tLz/


--
Linaro LKFT
https://lkft.linaro.org
