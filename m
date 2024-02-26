Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604431CD08
	for <llvm@lists.linux.dev>; Mon, 26 Feb 2024 10:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708944413; cv=none; b=reg5ysuuklI4XcDKpA7UR7uOoz11BX7IUYNpQE6Pu2wEzIbDT37L0kMNQVTaIjoxQosC9ILrkXUdkgpzbeHg2O4fPMxkyLzXM6+b5erJKz6vnaFby/skI5O96dnSMQLVXehuRraZo2en/y4O5OHPh6Rb0XrAodo6AkWckPHDQq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708944413; c=relaxed/simple;
	bh=EBM8FUoS8f8ccNaOgqcbyTpIrYLKgu3vx7uNumsB2Bo=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=HM2X1fGQ87Yt143p0padoDeUItyBWsNsDDjggZOvnE4H0xhmLuO8HCbUskydFT6wSGNFhjgOodUD2XLReNp7foeWHIy5R81CrRHdQFvYeKmgvlW+lqHpUZd9JoP/nLzXpjL5tyazrNKEg0PNqA5B1Oc7cKue+P2T1xoJWwUmcsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=lYf4pWCB; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="lYf4pWCB"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1d918008b99so21217015ad.3
        for <llvm@lists.linux.dev>; Mon, 26 Feb 2024 02:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1708944407; x=1709549207; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yevR+N2kEL/l39d8tgU4CJisrhrCPudyZogfbtvuyaM=;
        b=lYf4pWCB628JqRKXGDE2eirGFdPsImArXvc1OaTaeGn7jx3K1HXXy0hdWkPaXNXpsH
         Rx9DCH2m9gDdMSbYjaQCDf5p+R2Dx0yf1FGkH6I57MHhOR2/qGu4GB1i5Lz/LHvp9Jh+
         Bi4FA32p8ZxT5hTJ+1HiGnr2tvW1wvAERg7zQ6LFvClaJj96fJG+aRr9CIZKP3Rd9j3C
         9iADfgzRUreJtgKznV5EclNGaVB8/hNMQ3etdIcE0XFps13D459cqDMi9YPPrBYmXirD
         4ZDMcf09DBQ1qU6KMtQg06wpnFbRCjqsC9UGU1gvRbXP+DIzj393PDp6VDeK5t+SICtk
         lfKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708944407; x=1709549207;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yevR+N2kEL/l39d8tgU4CJisrhrCPudyZogfbtvuyaM=;
        b=JhDcEtYZjS86/vIpcKeqb3XFvI8rW4CunaR0kqIEflCd4i/hdExOZegKBA9Qjv+Wko
         reEejpy7hjZ3BrxUItyGg/st8blmoHlYDcXrAm2cKVjxMgIn7ib5K9qrokyxo/EGz5vH
         gtTuAjn2tTxetgZ5dlyvqNVX/6Uzg8zUKX6wYMZVTASE8587xwXIlG6uCgvb9Wc3QLGK
         MJTq5apIdroyyGLz/5Uv8isfviwftGEsTv1PBpWp/aurmG9rzM/ow5+SNYe0LB3idxuW
         OlttmDYDUubpWztbacFQg6zaYzUAQ29Z1eI7qjZc7xvrOfgR8Q95L7keChepvp3ysipZ
         a0/A==
X-Gm-Message-State: AOJu0YzDgdnsw8fpVA6B7KS9dQjQvd5Mj/d3PLi0suVKNDk0XFdVPfJ1
	elIlZmIjIOOLIOK9gEQRUNfZf0IyxxbDwozvUhF61KZ2KnRWuJyKSIheDOv00TYa52zPb7QE8VS
	D
X-Google-Smtp-Source: AGHT+IFiitNWekp8EyXc4buus9gZQdcPjdraqnHMfbIoLT4uomMU+OTf/0ba2r3WPDmkyaY+nx3O4Q==
X-Received: by 2002:a17:90a:6bc1:b0:299:63ff:9c0f with SMTP id w59-20020a17090a6bc100b0029963ff9c0fmr3887331pjj.21.1708944405737;
        Mon, 26 Feb 2024 02:46:45 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id su6-20020a17090b534600b0029a7951c4a3sm6064711pjb.41.2024.02.26.02.46.44
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 02:46:44 -0800 (PST)
Message-ID: <65dc6c14.170a0220.ae401.3269@mx.google.com>
Date: Mon, 26 Feb 2024 02:46:44 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20240226
X-Kernelci-Report-Type: build
Subject: next/master build: 172 builds: 13 failed, 159 passed, 223 errors,
 346 warnings (next-20240226)
To: llvm@lists.linux.dev
From: "kernelci.org bot" <bot@kernelci.org>

next/master build: 172 builds: 13 failed, 159 passed, 223 errors, 346 warni=
ngs (next-20240226)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20240226/

Tree: next
Branch: master
Git Describe: next-20240226
Git Commit: 8552c902efe7ef670b6961fb8885b67961aeb629
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 8 unique architectures

Build Failures Detected:

arc:
    haps_hs_smp_defconfig+kselftest: (gcc-10) FAIL

arm64:
    defconfig: (clang-17) FAIL
    defconfig: (gcc-10) FAIL
    defconfig+arm64-chromebook: (gcc-10) FAIL
    defconfig+arm64-chromebook+kselftest: (gcc-10) FAIL
    defconfig+arm64-chromebook+videodec: (gcc-10) FAIL
    defconfig+debug: (gcc-10) FAIL
    defconfig+kselftest: (gcc-10) FAIL
    defconfig+videodec: (gcc-10) FAIL
    tinyconfig: (gcc-10) FAIL

arm:
    s3c6400_defconfig: (gcc-10) FAIL

mips:
    bcm47xx_defconfig: (gcc-10) FAIL
    decstation_64_defconfig: (gcc-10) FAIL

Errors and Warnings Detected:

arc:
    allnoconfig (gcc-10): 1 warning
    axs103_defconfig (gcc-10): 4 warnings
    axs103_smp_defconfig (gcc-10): 4 warnings
    haps_hs_smp_defconfig (gcc-10): 4 warnings
    haps_hs_smp_defconfig+debug (gcc-10): 4 warnings
    haps_hs_smp_defconfig+kselftest (gcc-10): 4 warnings
    hsdk_defconfig (gcc-10): 3 warnings
    nsimosci_hs_defconfig (gcc-10): 4 warnings
    nsimosci_hs_smp_defconfig (gcc-10): 4 warnings
    tinyconfig (gcc-10): 1 warning
    vdk_hs38_defconfig (gcc-10): 3 warnings

arm64:
    defconfig (gcc-10): 25 errors, 2 warnings
    defconfig (clang-17): 20 errors
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (gcc-10): 1 warning
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (clang-17): 2 warnings
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy (gcc-10): 25 errors, 2 warnings
    defconfig+arm64-chromebook (gcc-10): 25 errors, 2 warnings
    defconfig+arm64-chromebook+kselftest (gcc-10): 25 errors, 2 warnings
    defconfig+arm64-chromebook+videodec (gcc-10): 25 errors, 2 warnings
    defconfig+debug (gcc-10): 25 errors, 2 warnings
    defconfig+kselftest (gcc-10): 25 errors, 2 warnings
    defconfig+videodec (gcc-10): 25 errors, 2 warnings
    tinyconfig (gcc-10): 1 error

arm:
    collie_defconfig (gcc-10): 1 warning
    mxs_defconfig (gcc-10): 1 warning
    realview_defconfig (gcc-10): 1 warning
    s3c6400_defconfig (gcc-10): 1 error
    versatile_defconfig (gcc-10): 1 warning
    vexpress_defconfig (gcc-10): 1 warning

i386:

mips:
    32r2el_defconfig (gcc-10): 3 warnings
    32r2el_defconfig+debug (gcc-10): 3 warnings
    32r2el_defconfig+kselftest (gcc-10): 3 warnings
    ath79_defconfig (gcc-10): 3 warnings
    bcm47xx_defconfig (gcc-10): 1 error
    bigsur_defconfig (gcc-10): 15 warnings
    cavium_octeon_defconfig (gcc-10): 12 warnings
    db1xxx_defconfig (gcc-10): 21 warnings
    decstation_64_defconfig (gcc-10): 9 warnings
    decstation_defconfig (gcc-10): 9 warnings
    decstation_r4k_defconfig (gcc-10): 9 warnings
    fuloong2e_defconfig (gcc-10): 1 warning
    gpr_defconfig (gcc-10): 1 warning
    ip22_defconfig (gcc-10): 6 warnings
    ip28_defconfig (gcc-10): 8 warnings
    ip32_defconfig (gcc-10): 1 warning
    jazz_defconfig (gcc-10): 5 warnings
    lemote2f_defconfig (gcc-10): 22 warnings
    loongson1b_defconfig (gcc-10): 1 warning
    loongson1c_defconfig (gcc-10): 1 warning
    loongson2k_defconfig (gcc-10): 12 warnings
    loongson3_defconfig (gcc-10): 13 warnings
    maltaaprp_defconfig (gcc-10): 4 warnings
    omega2p_defconfig (gcc-10): 2 warnings
    pic32mzda_defconfig (gcc-10): 1 warning
    rb532_defconfig (gcc-10): 3 warnings
    rm200_defconfig (gcc-10): 8 warnings
    rt305x_defconfig (gcc-10): 2 warnings
    sb1250_swarm_defconfig (gcc-10): 16 warnings
    vocore2_defconfig (gcc-10): 2 warnings

riscv:

sparc:
    allnoconfig (gcc-10): 5 warnings
    sparc32_defconfig (gcc-10): 6 warnings
    sparc64_defconfig (gcc-10): 26 warnings
    sparc64_defconfig+debug (gcc-10): 24 warnings
    sparc64_defconfig+kselftest (gcc-10): 24 warnings
    tinyconfig (gcc-10): 5 warnings

x86_64:

Errors summary:

    14   arch/arm64/include/asm/cmpxchg.h:135:21: error: unknown type name =
=E2=80=98u128=E2=80=99
    14   arch/arm64/include/asm/cmpxchg.h:135:11: error: unknown type name =
=E2=80=98u128=E2=80=99
    14   arch/arm64/include/asm/cmpxchg.h:134:48: error: unknown type name =
=E2=80=98u128=E2=80=99
    14   arch/arm64/include/asm/cmpxchg.h:134:15: error: unknown type name =
=E2=80=98u128=E2=80=99
    14   arch/arm64/include/asm/atomic_lse.h:286:55: error: unknown type na=
me =E2=80=98u128=E2=80=99
    14   arch/arm64/include/asm/atomic_lse.h:286:45: error: unknown type na=
me =E2=80=98u128=E2=80=99
    14   arch/arm64/include/asm/atomic_lse.h:286:34: error: unknown type na=
me =E2=80=98u128=E2=80=99
    14   arch/arm64/include/asm/atomic_lse.h:285:24: error: unknown type na=
me =E2=80=98u128=E2=80=99
    14   arch/arm64/include/asm/atomic_ll_sc.h:306:57: error: unknown type =
name =E2=80=98u128=E2=80=99
    14   arch/arm64/include/asm/atomic_ll_sc.h:306:47: error: unknown type =
name =E2=80=98u128=E2=80=99
    14   arch/arm64/include/asm/atomic_ll_sc.h:306:36: error: unknown type =
name =E2=80=98u128=E2=80=99
    14   arch/arm64/include/asm/atomic_ll_sc.h:305:24: error: unknown type =
name =E2=80=98u128=E2=80=99
    7    arch/arm64/include/asm/atomic_ll_sc.h:298:2: error: unknown type n=
ame =E2=80=98u128=E2=80=99
    4    arch/arm64/include/asm/atomic_ll_sc.h:333:1: error: unknown type n=
ame 'u128'
    4    arch/arm64/include/asm/atomic_ll_sc.h:332:1: error: unknown type n=
ame 'u128'
    2    drivers/leds/leds-gpio-register.c:23:32: error: redefinition of =
=E2=80=98gpio_led_register_device=E2=80=99
    1    fatal error: too many errors emitted, stopping now [-ferror-limit=
=3D]
    1    drivers/power/supply/power_supply_core.c:1630:2: error: too few ar=
guments to function =E2=80=98power_supply_init_attrs=E2=80=99
    1    arch/arm64/include/asm/atomic_lse.h:268:1: error: invalid input co=
nstraint 'rZ' in asm
    1    arch/arm64/include/asm/atomic_lse.h:267:1: error: invalid input co=
nstraint 'rZ' in asm
    1    arch/arm64/include/asm/atomic_lse.h:266:1: error: invalid input co=
nstraint 'rZ' in asm
    1    arch/arm64/include/asm/atomic_lse.h:265:1: error: invalid input co=
nstraint 'rZ' in asm
    1    arch/arm64/include/asm/atomic_ll_sc.h:333:1: error: use of undecla=
red identifier 'u128'
    1    arch/arm64/include/asm/atomic_ll_sc.h:333:1: error: expected expre=
ssion
    1    arch/arm64/include/asm/atomic_ll_sc.h:333:1: error: expected ')'
    1    arch/arm64/include/asm/atomic_ll_sc.h:332:1: error: use of undecla=
red identifier 'u128'
    1    arch/arm64/include/asm/atomic_ll_sc.h:332:1: error: expected expre=
ssion
    1    arch/arm64/include/asm/atomic_ll_sc.h:332:1: error: expected ')'
    1    arch/arm64/include/asm/atomic_ll_sc.h:298:2: error: unknown type n=
ame 'u128'

Warnings summary:

    11   arch/arc/kernel/ptrace.c:342:16: warning: no previous prototype fo=
r 'syscall_trace_enter' [-Wmissing-prototypes]
    10   <stdin>:1519:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    7    arch/arm64/include/asm/memory.h:300:15: warning: cast from pointer=
 to integer of different size [-Wpointer-to-int-cast]
    7    arch/arm64/include/asm/memory.h:243:9: warning: cast from pointer =
to integer of different size [-Wpointer-to-int-cast]
    5    arch/arc/kernel/kprobes.c:193:15: warning: no previous prototype f=
or 'arc_kprobe_handler' [-Wmissing-prototypes]
    4    arch/mips/boot/dts/loongson/ls7a-pch.dtsi:68.16-416.5: Warning (in=
terrupt_provider): /bus@10000000/pci@1a000000: '#interrupt-cells' found, bu=
t node is not an interrupt provider
    3    sound/arm/aaci.c:742:15: warning: unused variable =E2=80=98aaci=E2=
=80=99 [-Wunused-variable]
    3    kernel/dma.c:88:6: warning: no previous prototype for =E2=80=98fre=
e_dma=E2=80=99 [-Wmissing-prototypes]
    3    kernel/dma.c:70:5: warning: no previous prototype for =E2=80=98req=
uest_dma=E2=80=99 [-Wmissing-prototypes]
    3    arch/sparc/vdso/vma.c:246:12: warning: no previous prototype for =
=E2=80=98init_vdso_image=E2=80=99 [-Wmissing-prototypes]
    3    arch/sparc/vdso/vdso32/../vclock_gettime.c:343:1: warning: no prev=
ious prototype for =E2=80=98__vdso_gettimeofday_stick=E2=80=99 [-Wmissing-p=
rototypes]
    3    arch/sparc/vdso/vdso32/../vclock_gettime.c:307:1: warning: no prev=
ious prototype for =E2=80=98__vdso_gettimeofday=E2=80=99 [-Wmissing-prototy=
pes]
    3    arch/sparc/vdso/vdso32/../vclock_gettime.c:282:1: warning: no prev=
ious prototype for =E2=80=98__vdso_clock_gettime_stick=E2=80=99 [-Wmissing-=
prototypes]
    3    arch/sparc/vdso/vdso32/../vclock_gettime.c:254:1: warning: no prev=
ious prototype for =E2=80=98__vdso_clock_gettime=E2=80=99 [-Wmissing-protot=
ypes]
    3    arch/sparc/vdso/vclock_gettime.c:343:1: warning: no previous proto=
type for =E2=80=98__vdso_gettimeofday_stick=E2=80=99 [-Wmissing-prototypes]
    3    arch/sparc/vdso/vclock_gettime.c:307:1: warning: no previous proto=
type for =E2=80=98__vdso_gettimeofday=E2=80=99 [-Wmissing-prototypes]
    3    arch/sparc/vdso/vclock_gettime.c:282:1: warning: no previous proto=
type for =E2=80=98__vdso_clock_gettime_stick=E2=80=99 [-Wmissing-prototypes]
    3    arch/sparc/vdso/vclock_gettime.c:254:1: warning: no previous proto=
type for =E2=80=98__vdso_clock_gettime=E2=80=99 [-Wmissing-prototypes]
    3    arch/sparc/prom/p1275.c:52:6: warning: no previous prototype for =
=E2=80=98prom_cif_init=E2=80=99 [-Wmissing-prototypes]
    3    arch/sparc/prom/misc_64.c:165:5: warning: no previous prototype fo=
r =E2=80=98prom_get_mmu_ihandle=E2=80=99 [-Wmissing-prototypes]
    3    arch/sparc/mm/init_64.c:2644:6: warning: no previous prototype for=
 =E2=80=98vmemmap_free=E2=80=99 [-Wmissing-prototypes]
    3    arch/sparc/lib/ucmpdi2.c:5:11: warning: no previous prototype for =
=E2=80=98__ucmpdi2=E2=80=99 [-Wmissing-prototypes]
    3    arch/sparc/lib/cmpdi2.c:6:11: warning: no previous prototype for =
=E2=80=98__cmpdi2=E2=80=99 [-Wmissing-prototypes]
    3    arch/sparc/kernel/uprobes.c:237:17: warning: no previous prototype=
 for =E2=80=98uprobe_trap=E2=80=99 [-Wmissing-prototypes]
    3    arch/sparc/kernel/traps_64.c:2153:6: warning: no previous prototyp=
e for =E2=80=98sun4v_nonresum_error_user_handled=E2=80=99 [-Wmissing-protot=
ypes]
    3    arch/sparc/kernel/time_64.c:880:20: warning: no previous prototype=
 for =E2=80=98sched_clock=E2=80=99 [-Wmissing-prototypes]
    3    arch/sparc/kernel/setup_64.c:602:13: warning: no previous prototyp=
e for =E2=80=98alloc_irqstack_bootmem=E2=80=99 [-Wmissing-prototypes]
    3    arch/sparc/kernel/pci_sun4v.c:259:15: warning: no previous prototy=
pe for =E2=80=98dma_4v_iotsb_bind=E2=80=99 [-Wmissing-prototypes]
    3    arch/sparc/kernel/adi_64.c:299:6: warning: no previous prototype f=
or =E2=80=98del_tag_store=E2=80=99 [-Wmissing-prototypes]
    3    arch/sparc/kernel/adi_64.c:156:21: warning: no previous prototype =
for =E2=80=98alloc_tag_store=E2=80=99 [-Wmissing-prototypes]
    3    arch/sparc/kernel/adi_64.c:124:21: warning: no previous prototype =
for =E2=80=98find_tag_store=E2=80=99 [-Wmissing-prototypes]
    3    arch/mips/ralink/irq.c:92:14: warning: no previous prototype for =
=E2=80=98get_c0_compare_int=E2=80=99 [-Wmissing-prototypes]
    3    arch/mips/ralink/irq.c:86:5: warning: no previous prototype for =
=E2=80=98get_c0_perfcount_int=E2=80=99 [-Wmissing-prototypes]
    3    arch/mips/kernel/cevt-ds1287.c:20:5: warning: no previous prototyp=
e for =E2=80=98ds1287_set_base_clock=E2=80=99 [-Wmissing-prototypes]
    3    arch/mips/kernel/cevt-ds1287.c:15:5: warning: no previous prototyp=
e for =E2=80=98ds1287_timer_state=E2=80=99 [-Wmissing-prototypes]
    3    arch/mips/kernel/cevt-ds1287.c:103:12: warning: no previous protot=
ype for =E2=80=98ds1287_clockevent_init=E2=80=99 [-Wmissing-prototypes]
    3    arch/mips/dec/setup.c:780:25: warning: no previous prototype for =
=E2=80=98dec_irq_dispatch=E2=80=99 [-Wmissing-prototypes]
    3    arch/mips/dec/reset.c:38:13: warning: no previous prototype for =
=E2=80=98dec_intr_halt=E2=80=99 [-Wmissing-prototypes]
    3    arch/mips/dec/reset.c:32:17: warning: no previous prototype for =
=E2=80=98dec_machine_power_off=E2=80=99 [-Wmissing-prototypes]
    3    arch/mips/dec/reset.c:27:17: warning: no previous prototype for =
=E2=80=98dec_machine_halt=E2=80=99 [-Wmissing-prototypes]
    3    arch/mips/dec/reset.c:22:17: warning: no previous prototype for =
=E2=80=98dec_machine_restart=E2=80=99 [-Wmissing-prototypes]
    3    arch/mips/dec/prom/init.c:45:13: warning: no previous prototype fo=
r =E2=80=98which_prom=E2=80=99 [-Wmissing-prototypes]
    3    arch/mips/boot/dts/img/boston.dts:136.23-177.6: Warning (interrupt=
_provider): /pci@14000000/pci2_root@0,0/eg20t_bridge@1,0,0: '#interrupt-cel=
ls' found, but node is not an interrupt provider
    3    arch/mips/boot/dts/img/boston.dts:128.17-178.5: Warning (interrupt=
_provider): /pci@14000000/pci2_root@0,0: '#interrupt-cells' found, but node=
 is not an interrupt provider
    3    arch/mips/boot/dts/img/boston.dtb: Warning (interrupt_map): Failed=
 prerequisite 'interrupt_provider'
    3    arch/arc/boot/dts/haps_hs_idu.dts:68.16-72.5: Warning (interrupt_p=
rovider): /fpga/pct: '#interrupt-cells' found, but node is not an interrupt=
 provider
    3    arch/arc/boot/dts/haps_hs_idu.dtb: Warning (interrupt_map): Failed=
 prerequisite 'interrupt_provider'
    2    drivers/scsi/sgiwd93.c:173:6: warning: no previous prototype for =
=E2=80=98sgiwd93_reset=E2=80=99 [-Wmissing-prototypes]
    2    drivers/net/ethernet/amd/au1000_eth.c:574:6: warning: no previous =
prototype for =E2=80=98au1000_ReleaseDB=E2=80=99 [-Wmissing-prototypes]
    2    arch/sparc/kernel/traps_64.c:253:6: warning: no previous prototype=
 for =E2=80=98is_no_fault_exception=E2=80=99 [-Wmissing-prototypes]
    2    arch/sparc/kernel/traps_64.c:2035:6: warning: no previous prototyp=
e for =E2=80=98do_mcd_err=E2=80=99 [-Wmissing-prototypes]
    2    arch/mips/sibyte/swarm/setup.c:59:5: warning: no previous prototyp=
e for =E2=80=98swarm_be_handler=E2=80=99 [-Wmissing-prototypes]
    2    arch/mips/sibyte/swarm/rtc_xicor1241.c:203:5: warning: no previous=
 prototype for =E2=80=98xicor_probe=E2=80=99 [-Wmissing-prototypes]
    2    arch/mips/sibyte/swarm/rtc_xicor1241.c:167:10: warning: no previou=
s prototype for =E2=80=98xicor_get_time=E2=80=99 [-Wmissing-prototypes]
    2    arch/mips/sibyte/swarm/rtc_xicor1241.c:108:5: warning: no previous=
 prototype for =E2=80=98xicor_set_time=E2=80=99 [-Wmissing-prototypes]
    2    arch/mips/sibyte/swarm/rtc_m41t81.c:219:5: warning: no previous pr=
ototype for =E2=80=98m41t81_probe=E2=80=99 [-Wmissing-prototypes]
    2    arch/mips/sibyte/swarm/rtc_m41t81.c:186:10: warning: no previous p=
rototype for =E2=80=98m41t81_get_time=E2=80=99 [-Wmissing-prototypes]
    2    arch/mips/sibyte/swarm/rtc_m41t81.c:139:5: warning: no previous pr=
ototype for =E2=80=98m41t81_set_time=E2=80=99 [-Wmissing-prototypes]
    2    arch/mips/sgi-ip22/ip22-time.c:119:18: warning: no previous protot=
ype for =E2=80=98indy_8254timer_irq=E2=80=99 [-Wmissing-prototypes]
    2    arch/mips/sgi-ip22/ip22-gio.c:398:12: warning: no previous prototy=
pe for =E2=80=98ip22_gio_init=E2=80=99 [-Wmissing-prototypes]
    2    arch/mips/sgi-ip22/ip22-gio.c:249:6: warning: no previous prototyp=
e for =E2=80=98ip22_gio_set_64bit=E2=80=99 [-Wmissing-prototypes]
    2    arch/mips/mm/cerr-sb1.c:165:17: warning: no previous prototype for=
 =E2=80=98sb1_cache_error=E2=80=99 [-Wmissing-prototypes]
    2    arch/mips/loongson64/pm.c:67:13: warning: no previous prototype fo=
r =E2=80=98mach_resume=E2=80=99 [-Wmissing-prototypes]
    2    arch/mips/loongson64/pm.c:63:13: warning: no previous prototype fo=
r =E2=80=98mach_suspend=E2=80=99 [-Wmissing-prototypes]
    2    arch/mips/loongson64/pm.c:59:13: warning: no previous prototype fo=
r =E2=80=98setup_wakeup_events=E2=80=99 [-Wmissing-prototypes]
    2    arch/mips/loongson64/dma.c:25:13: warning: no previous prototype f=
or =E2=80=98plat_swiotlb_setup=E2=80=99 [-Wmissing-prototypes]
    2    arch/mips/loongson32/common/platform.c:71:5: warning: no previous =
prototype for =E2=80=98ls1x_eth_mux_init=E2=80=99 [-Wmissing-prototypes]
    2    arch/mips/loongson2ef/common/machtype.c:34:20: warning: no previou=
s prototype for =E2=80=98mach_prom_init_machtype=E2=80=99 [-Wmissing-protot=
ypes]
    2    arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dts:32.31-40.4:=
 Warning (interrupt_provider): /bus@10000000/msi-controller@2ff00000: Missi=
ng '#interrupt-cells' in interrupt provider
    2    arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: Warning (i=
nterrupt_map): Failed prerequisite 'interrupt_provider'
    2    arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dts:28.31-36.4:=
 Warning (interrupt_provider): /bus@10000000/msi-controller@2ff00000: Missi=
ng '#interrupt-cells' in interrupt provider
    2    arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: Warning (i=
nterrupt_map): Failed prerequisite 'interrupt_provider'
    2    arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: Warning (=
interrupt_map): Failed prerequisite 'interrupt_provider'
    2    arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi:116.16-297.5: W=
arning (interrupt_provider): /bus@10000000/pci@1a000000: '#interrupt-cells'=
 found, but node is not an interrupt provider
    2    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version genera=
tion failed, symbol will not be versioned.
    1    include/linux/array_size.h:11:25: warning: overflow in conversion =
from =E2=80=98long unsigned int=E2=80=99 to =E2=80=98int=E2=80=99 changes v=
alue from =E2=80=9818446744073709551615=E2=80=99 to =E2=80=98-1=E2=80=99 [-=
Woverflow]
    1    drivers/watchdog/octeon-wdt-main.c:210:6: warning: no previous pro=
totype for =E2=80=98octeon_wdt_nmi_stage3=E2=80=99 [-Wmissing-prototypes]
    1    drivers/video/fbdev/au1100fb.c:565:5: warning: no previous prototy=
pe for =E2=80=98au1100fb_drv_resume=E2=80=99 [-Wmissing-prototypes]
    1    drivers/video/fbdev/au1100fb.c:548:5: warning: no previous prototy=
pe for =E2=80=98au1100fb_drv_suspend=E2=80=99 [-Wmissing-prototypes]
    1    drivers/video/fbdev/au1100fb.c:523:6: warning: no previous prototy=
pe for =E2=80=98au1100fb_drv_remove=E2=80=99 [-Wmissing-prototypes]
    1    drivers/video/fbdev/au1100fb.c:341:5: warning: no previous prototy=
pe for =E2=80=98au1100fb_fb_mmap=E2=80=99 [-Wmissing-prototypes]
    1    drivers/video/fbdev/au1100fb.c:294:5: warning: no previous prototy=
pe for =E2=80=98au1100fb_fb_pan_display=E2=80=99 [-Wmissing-prototypes]
    1    drivers/video/fbdev/au1100fb.c:235:5: warning: no previous prototy=
pe for =E2=80=98au1100fb_fb_setcolreg=E2=80=99 [-Wmissing-prototypes]
    1    drivers/video/fbdev/au1100fb.c:138:5: warning: no previous prototy=
pe for =E2=80=98au1100fb_setmode=E2=80=99 [-Wmissing-prototypes]
    1    drivers/pcmcia/pxa2xx_sharpsl.c:206:5: warning: no previous protot=
ype for =E2=80=98pcmcia_collie_init=E2=80=99 [-Wmissing-prototypes]
    1    drivers/net/ethernet/sgi/meth.c:271:5: warning: no previous protot=
ype for =E2=80=98meth_reset=E2=80=99 [-Wmissing-prototypes]
    1    drivers/irqchip/irq-pic32-evic.c:164:5: warning: no previous proto=
type for =E2=80=98pic32_irq_domain_xlate=E2=80=99 [-Wmissing-prototypes]
    1    drivers/irqchip/irq-mxs.c:133:39: warning: no previous prototype f=
or =E2=80=98icoll_handle_irq=E2=80=99 [-Wmissing-prototypes]
    1    drivers/irqchip/irq-ath79-misc.c:26:5: warning: no previous protot=
ype for =E2=80=98get_c0_perfcount_int=E2=80=99 [-Wmissing-prototypes]
    1    drivers/irqchip/irq-ath79-misc.c:181:13: warning: no previous prot=
otype for =E2=80=98ath79_misc_irq_init=E2=80=99 [-Wmissing-prototypes]
    1    drivers/irqchip/irq-ath79-cpu.c:89:13: warning: no previous protot=
ype for =E2=80=98ath79_cpu_irq_init=E2=80=99 [-Wmissing-prototypes]
    1    drivers/gpu/drm/imagination/pvr_vm_mips.c:105:49: warning: implici=
t conversion from 'unsigned long' to 'int' changes value from 1844674407370=
9551615 to -1 [-Wconstant-conversion]
    1    arch/mips/sni/rm200.c:428:6: warning: no previous prototype for =
=E2=80=98disable_rm200_irq=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sni/rm200.c:387:13: warning: no previous prototype for =
=E2=80=98sni_rm200_i8259_irqs=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sni/rm200.c:331:6: warning: no previous prototype for =
=E2=80=98sni_rm200_init_8259A=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sni/rm200.c:211:6: warning: no previous prototype for =
=E2=80=98sni_rm200_mask_and_ack_8259A=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sni/reset.c:45:6: warning: no previous prototype for =E2=
=80=98sni_machine_power_off=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sni/reset.c:28:6: warning: no previous prototype for =E2=
=80=98sni_machine_restart=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sni/pcit.c:168:6: warning: no previous prototype for =E2=
=80=98disable_pcit_irq=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sni/pcimt.c:206:6: warning: no previous prototype for =
=E2=80=98disable_pcimt_irq=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sibyte/sb1250/time.c:10:13: warning: no previous prototy=
pe for =E2=80=98plat_time_init=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sibyte/sb1250/smp.c:38:6: warning: no previous prototype=
 for =E2=80=98sb1250_smp_init=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sibyte/sb1250/smp.c:147:6: warning: no previous prototyp=
e for =E2=80=98sb1250_mailbox_interrupt=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sibyte/sb1250/setup.c:79:5: warning: no previous prototy=
pe for =E2=80=98sb1250_m3_workaround_needed=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sibyte/sb1250/setup.c:168:13: warning: no previous proto=
type for =E2=80=98sb1250_setup=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sibyte/sb1250/irq.c:182:13: warning: no previous prototy=
pe for =E2=80=98init_sb1250_irqs=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sibyte/bcm1480/time.c:10:13: warning: no previous protot=
ype for =E2=80=98plat_time_init=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sibyte/bcm1480/smp.c:49:6: warning: no previous prototyp=
e for =E2=80=98bcm1480_smp_init=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sibyte/bcm1480/smp.c:158:6: warning: no previous prototy=
pe for =E2=80=98bcm1480_mailbox_interrupt=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sibyte/bcm1480/setup.c:104:13: warning: no previous prot=
otype for =E2=80=98bcm1480_setup=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sibyte/bcm1480/irq.c:200:13: warning: no previous protot=
ype for =E2=80=98init_bcm1480_irqs=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sgi-ip22/ip28-berr.c:474:5: warning: no previous prototy=
pe for =E2=80=98ip28_show_be_info=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sgi-ip22/ip28-berr.c:469:13: warning: no previous protot=
ype for =E2=80=98ip22_be_init=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sgi-ip22/ip28-berr.c:440:6: warning: no previous prototy=
pe for =E2=80=98ip22_be_interrupt=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sgi-ip22/ip22-eisa.c:95:12: warning: no previous prototy=
pe for =E2=80=98ip22_eisa_init=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sgi-ip22/ip22-berr.c:89:6: warning: no previous prototyp=
e for =E2=80=98ip22_be_interrupt=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sgi-ip22/ip22-berr.c:113:13: warning: no previous protot=
ype for =E2=80=98ip22_be_init=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/rb532/serial.c:48:12: warning: no previous prototype for=
 =E2=80=98setup_serial_port=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/rb532/prom.c:49:13: warning: no previous prototype for =
=E2=80=98prom_setup_cmdline=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/rb532/gpio.c:200:12: warning: no previous prototype for =
=E2=80=98rb532_gpio_init=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/pci/pcie-octeon.c:1465:5: warning: no previous prototype=
 for =E2=80=98octeon_pcie_pcibios_map_irq=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/pci/pci-octeon.c:234:12: warning: no previous prototype =
for =E2=80=98octeon_pci_pcibios_map_irq=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/pci/msi-octeon.c:343:12: warning: no previous prototype =
for =E2=80=98octeon_msi_initialize=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/mm/c-octeon.c:351:17: warning: no previous prototype for=
 =E2=80=98cache_parity_error_octeon_non_recoverable=E2=80=99 [-Wmissing-pro=
totypes]
    1    arch/mips/mm/c-octeon.c:342:17: warning: no previous prototype for=
 =E2=80=98cache_parity_error_octeon_recoverable=E2=80=99 [-Wmissing-prototy=
pes]
    1    arch/mips/mm/c-octeon.c:303:5: warning: no previous prototype for =
=E2=80=98unregister_co_cache_error_notifier=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/mm/c-octeon.c:297:5: warning: no previous prototype for =
=E2=80=98register_co_cache_error_notifier=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/loongson2ef/lemote-2f/pm.c:90:5: warning: no previous pr=
ototype for =E2=80=98wakeup_loongson=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/loongson2ef/lemote-2f/pm.c:52:6: warning: no previous pr=
ototype for =E2=80=98setup_wakeup_events=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/loongson2ef/lemote-2f/pm.c:142:13: warning: no previous =
prototype for =E2=80=98mach_resume=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/loongson2ef/lemote-2f/pm.c:137:13: warning: no previous =
prototype for =E2=80=98mach_suspend=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/loongson2ef/lemote-2f/machtype.c:10:13: warning: no prev=
ious prototype for =E2=80=98mach_prom_init_machtype=E2=80=99 [-Wmissing-pro=
totypes]
    1    arch/mips/loongson2ef/common/pm.c:66:12: warning: no previous prot=
otype for =E2=80=98wakeup_loongson=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/loongson2ef/common/pm.c:59:13: warning: no previous prot=
otype for =E2=80=98setup_wakeup_events=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/loongson2ef/common/pm.c:118:13: warning: no previous pro=
totype for =E2=80=98mach_resume=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/loongson2ef/common/pm.c:114:13: warning: no previous pro=
totype for =E2=80=98mach_suspend=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/loongson2ef/common/cs5536/cs5536_ohci.c:70:5: warning: n=
o previous prototype for =E2=80=98pci_ohci_read_reg=E2=80=99 [-Wmissing-pro=
totypes]
    1    arch/mips/loongson2ef/common/cs5536/cs5536_ohci.c:15:6: warning: n=
o previous prototype for =E2=80=98pci_ohci_write_reg=E2=80=99 [-Wmissing-pr=
ototypes]
    1    arch/mips/loongson2ef/common/cs5536/cs5536_isa.c:84:6: warning: no=
 previous prototype for =E2=80=98pci_isa_write_bar=E2=80=99 [-Wmissing-prot=
otypes]
    1    arch/mips/loongson2ef/common/cs5536/cs5536_isa.c:228:5: warning: n=
o previous prototype for =E2=80=98pci_isa_read_reg=E2=80=99 [-Wmissing-prot=
otypes]
    1    arch/mips/loongson2ef/common/cs5536/cs5536_isa.c:134:6: warning: n=
o previous prototype for =E2=80=98pci_isa_write_reg=E2=80=99 [-Wmissing-pro=
totypes]
    1    arch/mips/loongson2ef/common/cs5536/cs5536_isa.c:110:5: warning: n=
o previous prototype for =E2=80=98pci_isa_read_bar=E2=80=99 [-Wmissing-prot=
otypes]
    1    arch/mips/loongson2ef/common/cs5536/cs5536_ide.c:96:5: warning: no=
 previous prototype for =E2=80=98pci_ide_read_reg=E2=80=99 [-Wmissing-proto=
types]
    1    arch/mips/loongson2ef/common/cs5536/cs5536_ide.c:15:6: warning: no=
 previous prototype for =E2=80=98pci_ide_write_reg=E2=80=99 [-Wmissing-prot=
otypes]
    1    arch/mips/loongson2ef/common/cs5536/cs5536_ehci.c:75:5: warning: n=
o previous prototype for =E2=80=98pci_ehci_read_reg=E2=80=99 [-Wmissing-pro=
totypes]
    1    arch/mips/loongson2ef/common/cs5536/cs5536_ehci.c:15:6: warning: n=
o previous prototype for =E2=80=98pci_ehci_write_reg=E2=80=99 [-Wmissing-pr=
ototypes]
    1    arch/mips/loongson2ef/common/cs5536/cs5536_acc.c:62:5: warning: no=
 previous prototype for =E2=80=98pci_acc_read_reg=E2=80=99 [-Wmissing-proto=
types]
    1    arch/mips/loongson2ef/common/cs5536/cs5536_acc.c:15:6: warning: no=
 previous prototype for =E2=80=98pci_acc_write_reg=E2=80=99 [-Wmissing-prot=
otypes]
    1    arch/mips/kvm/loongson_ipi.c:190:6: warning: no previous prototype=
 for =E2=80=98kvm_init_loongson_ipi=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/kernel/vpe-mt.c:226:5: warning: no previous prototype fo=
r =E2=80=98vpe_free=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/kernel/vpe-mt.c:205:5: warning: no previous prototype fo=
r =E2=80=98vpe_stop=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/kernel/vpe-mt.c:195:5: warning: no previous prototype fo=
r =E2=80=98vpe_start=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/kernel/vpe-mt.c:177:7: warning: no previous prototype fo=
r =E2=80=98vpe_alloc=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/kernel/csrc-sb1250.c:53:13: warning: no previous prototy=
pe for =E2=80=98sb1250_clocksource_init=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/kernel/csrc-bcm1480.c:37:13: warning: no previous protot=
ype for =E2=80=98sb1480_clocksource_init=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/kernel/cevt-sb1250.c:95:6: warning: no previous prototyp=
e for =E2=80=98sb1250_clockevent_init=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/kernel/cevt-bcm1480.c:96:6: warning: no previous prototy=
pe for =E2=80=98sb1480_clockevent_init=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/jazz/setup.c:54:13: warning: no previous prototype for =
=E2=80=98plat_mem_setup=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/jazz/reset.c:49:6: warning: no previous prototype for =
=E2=80=98jazz_machine_restart=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/jazz/irq.c:55:13: warning: no previous prototype for =E2=
=80=98init_r4030_ints=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/jazz/irq.c:38:6: warning: no previous prototype for =E2=
=80=98disable_r4030_irq=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/jazz/irq.c:128:13: warning: no previous prototype for =
=E2=80=98plat_time_init=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/cavium-octeon/smp.c:100:6: warning: no previous prototyp=
e for =E2=80=98octeon_send_ipi_single=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/cavium-octeon/octeon-platform.c:701:13: warning: no prev=
ious prototype for =E2=80=98octeon_fill_mac_addresses=E2=80=99 [-Wmissing-p=
rototypes]
    1    arch/mips/cavium-octeon/executive/cvmx-interrupt-decodes.c:53:6: w=
arning: no previous prototype for =E2=80=98__cvmx_interrupt_gmxx_rxx_int_en=
_enable=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/cavium-octeon/executive/cvmx-helper-errata.c:49:6: warni=
ng: no previous prototype for =E2=80=98__cvmx_helper_errata_qlm_disable_2nd=
_order_cdr=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/alchemy/devboards/platform.c:68:12: warning: no previous=
 prototype for =E2=80=98db1x_register_pcmcia_socket=E2=80=99 [-Wmissing-pro=
totypes]
    1    arch/mips/alchemy/devboards/platform.c:152:12: warning: no previou=
s prototype for =E2=80=98db1x_register_norflash=E2=80=99 [-Wmissing-prototy=
pes]
    1    arch/mips/alchemy/devboards/db1xxx.c:52:13: warning: no previous p=
rototype for =E2=80=98get_system_type=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/alchemy/devboards/db1550.c:582:12: warning: no previous =
prototype for =E2=80=98db1550_dev_setup=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/alchemy/devboards/db1550.c:56:12: warning: no previous p=
rototype for =E2=80=98db1550_board_setup=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/alchemy/devboards/db1550.c:501:12: warning: no previous =
prototype for =E2=80=98db1550_pci_setup=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/alchemy/devboards/db1300.c:855:12: warning: no previous =
prototype for =E2=80=98db1300_board_setup=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/alchemy/devboards/db1300.c:786:12: warning: no previous =
prototype for =E2=80=98db1300_dev_setup=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/alchemy/devboards/db1200.c:799:12: warning: no previous =
prototype for =E2=80=98db1200_dev_setup=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/alchemy/devboards/db1200.c:116:12: warning: no previous =
prototype for =E2=80=98db1200_board_setup=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/alchemy/devboards/db1000.c:93:12: warning: no previous p=
rototype for =E2=80=98db1500_pci_setup=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/alchemy/devboards/db1000.c:451:12: warning: no previous =
prototype for =E2=80=98db1000_dev_setup=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/alchemy/devboards/db1000.c:35:12: warning: no previous p=
rototype for =E2=80=98db1000_board_setup=E2=80=99 [-Wmissing-prototypes]
    1    arch/arc/boot/dts/vdk_hs38.dtb: Warning (interrupt_map): Failed pr=
erequisite 'interrupt_provider'
    1    arch/arc/boot/dts/vdk_axs10x_mb.dtsi:36.18-47.5: Warning (interrup=
t_provider): /axs10x_mb_vdk/ethernet@18000: '#interrupt-cells' found, but n=
ode is not an interrupt provider
    1    arch/arc/boot/dts/nsimosci_hs_idu.dts:92.16-96.5: Warning (interru=
pt_provider): /fpga/pct: '#interrupt-cells' found, but node is not an inter=
rupt provider
    1    arch/arc/boot/dts/nsimosci_hs_idu.dtb: Warning (interrupt_map): Fa=
iled prerequisite 'interrupt_provider'
    1    arch/arc/boot/dts/nsimosci_hs.dts:84.16-88.5: Warning (interrupt_p=
rovider): /fpga/pct: '#interrupt-cells' found, but node is not an interrupt=
 provider
    1    arch/arc/boot/dts/nsimosci_hs.dtb: Warning (interrupt_map): Failed=
 prerequisite 'interrupt_provider'
    1    arch/arc/boot/dts/hsdk.dts:207.23-235.5: Warning (interrupt_provid=
er): /soc/ethernet@8000: '#interrupt-cells' found, but node is not an inter=
rupt provider
    1    arch/arc/boot/dts/hsdk.dtb: Warning (interrupt_map): Failed prereq=
uisite 'interrupt_provider'
    1    arch/arc/boot/dts/axs103_idu.dtb: Warning (interrupt_map): Failed =
prerequisite 'interrupt_provider'
    1    arch/arc/boot/dts/axs103.dtb: Warning (interrupt_map): Failed prer=
equisite 'interrupt_provider'
    1    arch/arc/boot/dts/axc003_idu.dtsi:92.16-97.5: Warning (interrupt_p=
rovider): /cpu_card/pct: '#interrupt-cells' found, but node is not an inter=
rupt provider
    1    arch/arc/boot/dts/axc003_idu.dtsi:109.18-111.5: Warning (interrupt=
_provider): /axs10x_mb/ethernet@18000: '#interrupt-cells' found, but node i=
s not an interrupt provider
    1    arch/arc/boot/dts/axc003.dtsi:85.16-90.5: Warning (interrupt_provi=
der): /cpu_card/pct: '#interrupt-cells' found, but node is not an interrupt=
 provider
    1    arch/arc/boot/dts/axc003.dtsi:102.18-104.5: Warning (interrupt_pro=
vider): /axs10x_mb/ethernet@18000: '#interrupt-cells' found, but node is no=
t an interrupt provider
    1    1 warning generated.
    1    ....../arch/sparc/kernel/traps_64.c:2035:6: warning: no previous p=
rototype for =E2=80=98do_mcd_err=E2=80=99 [-Wmissing-prototypes]
    1    ........................................../arch/sparc/kernel/traps=
_64.c:253:6: warning: no previous prototype for =E2=80=98is_no_fault_except=
ion=E2=80=99 [-Wmissing-prototypes]

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    arch/mips/boot/dts/img/boston.dts:128.17-178.5: Warning (interrupt_prov=
ider): /pci@14000000/pci2_root@0,0: '#interrupt-cells' found, but node is n=
ot an interrupt provider
    arch/mips/boot/dts/img/boston.dts:136.23-177.6: Warning (interrupt_prov=
ider): /pci@14000000/pci2_root@0,0/eg20t_bridge@1,0,0: '#interrupt-cells' f=
ound, but node is not an interrupt provider
    arch/mips/boot/dts/img/boston.dtb: Warning (interrupt_map): Failed prer=
equisite 'interrupt_provider'

---------------------------------------------------------------------------=
-----
32r2el_defconfig+debug (mips, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings,=
 0 section mismatches

Warnings:
    arch/mips/boot/dts/img/boston.dts:128.17-178.5: Warning (interrupt_prov=
ider): /pci@14000000/pci2_root@0,0: '#interrupt-cells' found, but node is n=
ot an interrupt provider
    arch/mips/boot/dts/img/boston.dts:136.23-177.6: Warning (interrupt_prov=
ider): /pci@14000000/pci2_root@0,0/eg20t_bridge@1,0,0: '#interrupt-cells' f=
ound, but node is not an interrupt provider
    arch/mips/boot/dts/img/boston.dtb: Warning (interrupt_map): Failed prer=
equisite 'interrupt_provider'

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-10) =E2=80=94 PASS, 0 errors, 3 warni=
ngs, 0 section mismatches

Warnings:
    arch/mips/boot/dts/img/boston.dts:128.17-178.5: Warning (interrupt_prov=
ider): /pci@14000000/pci2_root@0,0: '#interrupt-cells' found, but node is n=
ot an interrupt provider
    arch/mips/boot/dts/img/boston.dts:136.23-177.6: Warning (interrupt_prov=
ider): /pci@14000000/pci2_root@0,0/eg20t_bridge@1,0,0: '#interrupt-cells' f=
ound, but node is not an interrupt provider
    arch/mips/boot/dts/img/boston.dtb: Warning (interrupt_map): Failed prer=
equisite 'interrupt_provider'

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mi=
smatches

Warnings:
    arch/arc/kernel/ptrace.c:342:16: warning: no previous prototype for 'sy=
scall_trace_enter' [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
allnoconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    kernel/dma.c:70:5: warning: no previous prototype for =E2=80=98request_=
dma=E2=80=99 [-Wmissing-prototypes]
    kernel/dma.c:88:6: warning: no previous prototype for =E2=80=98free_dma=
=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/lib/cmpdi2.c:6:11: warning: no previous prototype for =E2=80=
=98__cmpdi2=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/lib/ucmpdi2.c:5:11: warning: no previous prototype for =E2=
=80=98__ucmpdi2=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
am200epdkit_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
aspeed_g4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
assabet_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
ath25_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
ath79_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/irqchip/irq-ath79-cpu.c:89:13: warning: no previous prototype f=
or =E2=80=98ath79_cpu_irq_init=E2=80=99 [-Wmissing-prototypes]
    drivers/irqchip/irq-ath79-misc.c:26:5: warning: no previous prototype f=
or =E2=80=98get_c0_perfcount_int=E2=80=99 [-Wmissing-prototypes]
    drivers/irqchip/irq-ath79-misc.c:181:13: warning: no previous prototype=
 for =E2=80=98ath79_misc_irq_init=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
axm55xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
axs103_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arc/boot/dts/axc003.dtsi:85.16-90.5: Warning (interrupt_provider):=
 /cpu_card/pct: '#interrupt-cells' found, but node is not an interrupt prov=
ider
    arch/arc/boot/dts/axc003.dtsi:102.18-104.5: Warning (interrupt_provider=
): /axs10x_mb/ethernet@18000: '#interrupt-cells' found, but node is not an =
interrupt provider
    arch/arc/boot/dts/axs103.dtb: Warning (interrupt_map): Failed prerequis=
ite 'interrupt_provider'
    arch/arc/kernel/ptrace.c:342:16: warning: no previous prototype for 'sy=
scall_trace_enter' [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
axs103_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 =
section mismatches

Warnings:
    arch/arc/boot/dts/axc003_idu.dtsi:92.16-97.5: Warning (interrupt_provid=
er): /cpu_card/pct: '#interrupt-cells' found, but node is not an interrupt =
provider
    arch/arc/boot/dts/axc003_idu.dtsi:109.18-111.5: Warning (interrupt_prov=
ider): /axs10x_mb/ethernet@18000: '#interrupt-cells' found, but node is not=
 an interrupt provider
    arch/arc/boot/dts/axs103_idu.dtb: Warning (interrupt_map): Failed prere=
quisite 'interrupt_provider'
    arch/arc/kernel/ptrace.c:342:16: warning: no previous prototype for 'sy=
scall_trace_enter' [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
bcm2835_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
bcm47xx_defconfig (mips, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sec=
tion mismatches

Errors:
    drivers/leds/leds-gpio-register.c:23:32: error: redefinition of =E2=80=
=98gpio_led_register_device=E2=80=99

---------------------------------------------------------------------------=
-----
bcm63xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
bigsur_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 15 warnings, 0 se=
ction mismatches

Warnings:
    arch/mips/sibyte/bcm1480/setup.c:104:13: warning: no previous prototype=
 for =E2=80=98bcm1480_setup=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/bcm1480/time.c:10:13: warning: no previous prototype f=
or =E2=80=98plat_time_init=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/bcm1480/irq.c:200:13: warning: no previous prototype f=
or =E2=80=98init_bcm1480_irqs=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/bcm1480/smp.c:49:6: warning: no previous prototype for=
 =E2=80=98bcm1480_smp_init=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/bcm1480/smp.c:158:6: warning: no previous prototype fo=
r =E2=80=98bcm1480_mailbox_interrupt=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/swarm/setup.c:59:5: warning: no previous prototype for=
 =E2=80=98swarm_be_handler=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/swarm/rtc_xicor1241.c:108:5: warning: no previous prot=
otype for =E2=80=98xicor_set_time=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/swarm/rtc_xicor1241.c:167:10: warning: no previous pro=
totype for =E2=80=98xicor_get_time=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/swarm/rtc_xicor1241.c:203:5: warning: no previous prot=
otype for =E2=80=98xicor_probe=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/swarm/rtc_m41t81.c:139:5: warning: no previous prototy=
pe for =E2=80=98m41t81_set_time=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/swarm/rtc_m41t81.c:186:10: warning: no previous protot=
ype for =E2=80=98m41t81_get_time=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/swarm/rtc_m41t81.c:219:5: warning: no previous prototy=
pe for =E2=80=98m41t81_probe=E2=80=99 [-Wmissing-prototypes]
    arch/mips/kernel/cevt-bcm1480.c:96:6: warning: no previous prototype fo=
r =E2=80=98sb1480_clockevent_init=E2=80=99 [-Wmissing-prototypes]
    arch/mips/kernel/csrc-bcm1480.c:37:13: warning: no previous prototype f=
or =E2=80=98sb1480_clocksource_init=E2=80=99 [-Wmissing-prototypes]
    arch/mips/mm/cerr-sb1.c:165:17: warning: no previous prototype for =E2=
=80=98sb1_cache_error=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
bmips_be_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
bmips_stb_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
cavium_octeon_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 12 warning=
s, 0 section mismatches

Warnings:
    arch/mips/cavium-octeon/executive/cvmx-interrupt-decodes.c:53:6: warnin=
g: no previous prototype for =E2=80=98__cvmx_interrupt_gmxx_rxx_int_en_enab=
le=E2=80=99 [-Wmissing-prototypes]
    arch/mips/cavium-octeon/executive/cvmx-helper-errata.c:49:6: warning: n=
o previous prototype for =E2=80=98__cvmx_helper_errata_qlm_disable_2nd_orde=
r_cdr=E2=80=99 [-Wmissing-prototypes]
    arch/mips/cavium-octeon/octeon-platform.c:701:13: warning: no previous =
prototype for =E2=80=98octeon_fill_mac_addresses=E2=80=99 [-Wmissing-protot=
ypes]
    arch/mips/cavium-octeon/smp.c:100:6: warning: no previous prototype for=
 =E2=80=98octeon_send_ipi_single=E2=80=99 [-Wmissing-prototypes]
    arch/mips/mm/c-octeon.c:297:5: warning: no previous prototype for =E2=
=80=98register_co_cache_error_notifier=E2=80=99 [-Wmissing-prototypes]
    arch/mips/mm/c-octeon.c:303:5: warning: no previous prototype for =E2=
=80=98unregister_co_cache_error_notifier=E2=80=99 [-Wmissing-prototypes]
    arch/mips/mm/c-octeon.c:342:17: warning: no previous prototype for =E2=
=80=98cache_parity_error_octeon_recoverable=E2=80=99 [-Wmissing-prototypes]
    arch/mips/mm/c-octeon.c:351:17: warning: no previous prototype for =E2=
=80=98cache_parity_error_octeon_non_recoverable=E2=80=99 [-Wmissing-prototy=
pes]
    arch/mips/pci/pci-octeon.c:234:12: warning: no previous prototype for =
=E2=80=98octeon_pci_pcibios_map_irq=E2=80=99 [-Wmissing-prototypes]
    arch/mips/pci/pcie-octeon.c:1465:5: warning: no previous prototype for =
=E2=80=98octeon_pcie_pcibios_map_irq=E2=80=99 [-Wmissing-prototypes]
    arch/mips/pci/msi-octeon.c:343:12: warning: no previous prototype for =
=E2=80=98octeon_msi_initialize=E2=80=99 [-Wmissing-prototypes]
    drivers/watchdog/octeon-wdt-main.c:210:6: warning: no previous prototyp=
e for =E2=80=98octeon_wdt_nmi_stage3=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    drivers/pcmcia/pxa2xx_sharpsl.c:206:5: warning: no previous prototype f=
or =E2=80=98pcmcia_collie_init=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
cu1000-neo_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
cu1830-neo_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 21 warnings, 0 se=
ction mismatches

Warnings:
    arch/mips/alchemy/devboards/platform.c:68:12: warning: no previous prot=
otype for =E2=80=98db1x_register_pcmcia_socket=E2=80=99 [-Wmissing-prototyp=
es]
    arch/mips/alchemy/devboards/platform.c:152:12: warning: no previous pro=
totype for =E2=80=98db1x_register_norflash=E2=80=99 [-Wmissing-prototypes]
    arch/mips/alchemy/devboards/db1000.c:35:12: warning: no previous protot=
ype for =E2=80=98db1000_board_setup=E2=80=99 [-Wmissing-prototypes]
    arch/mips/alchemy/devboards/db1000.c:93:12: warning: no previous protot=
ype for =E2=80=98db1500_pci_setup=E2=80=99 [-Wmissing-prototypes]
    arch/mips/alchemy/devboards/db1000.c:451:12: warning: no previous proto=
type for =E2=80=98db1000_dev_setup=E2=80=99 [-Wmissing-prototypes]
    arch/mips/alchemy/devboards/db1200.c:116:12: warning: no previous proto=
type for =E2=80=98db1200_board_setup=E2=80=99 [-Wmissing-prototypes]
    arch/mips/alchemy/devboards/db1200.c:799:12: warning: no previous proto=
type for =E2=80=98db1200_dev_setup=E2=80=99 [-Wmissing-prototypes]
    arch/mips/alchemy/devboards/db1300.c:786:12: warning: no previous proto=
type for =E2=80=98db1300_dev_setup=E2=80=99 [-Wmissing-prototypes]
    arch/mips/alchemy/devboards/db1300.c:855:12: warning: no previous proto=
type for =E2=80=98db1300_board_setup=E2=80=99 [-Wmissing-prototypes]
    arch/mips/alchemy/devboards/db1xxx.c:52:13: warning: no previous protot=
ype for =E2=80=98get_system_type=E2=80=99 [-Wmissing-prototypes]
    arch/mips/alchemy/devboards/db1550.c:56:12: warning: no previous protot=
ype for =E2=80=98db1550_board_setup=E2=80=99 [-Wmissing-prototypes]
    arch/mips/alchemy/devboards/db1550.c:501:12: warning: no previous proto=
type for =E2=80=98db1550_pci_setup=E2=80=99 [-Wmissing-prototypes]
    arch/mips/alchemy/devboards/db1550.c:582:12: warning: no previous proto=
type for =E2=80=98db1550_dev_setup=E2=80=99 [-Wmissing-prototypes]
    drivers/video/fbdev/au1100fb.c:138:5: warning: no previous prototype fo=
r =E2=80=98au1100fb_setmode=E2=80=99 [-Wmissing-prototypes]
    drivers/video/fbdev/au1100fb.c:235:5: warning: no previous prototype fo=
r =E2=80=98au1100fb_fb_setcolreg=E2=80=99 [-Wmissing-prototypes]
    drivers/video/fbdev/au1100fb.c:294:5: warning: no previous prototype fo=
r =E2=80=98au1100fb_fb_pan_display=E2=80=99 [-Wmissing-prototypes]
    drivers/video/fbdev/au1100fb.c:341:5: warning: no previous prototype fo=
r =E2=80=98au1100fb_fb_mmap=E2=80=99 [-Wmissing-prototypes]
    drivers/video/fbdev/au1100fb.c:523:6: warning: no previous prototype fo=
r =E2=80=98au1100fb_drv_remove=E2=80=99 [-Wmissing-prototypes]
    drivers/video/fbdev/au1100fb.c:548:5: warning: no previous prototype fo=
r =E2=80=98au1100fb_drv_suspend=E2=80=99 [-Wmissing-prototypes]
    drivers/video/fbdev/au1100fb.c:565:5: warning: no previous prototype fo=
r =E2=80=98au1100fb_drv_resume=E2=80=99 [-Wmissing-prototypes]
    drivers/net/ethernet/amd/au1000_eth.c:574:6: warning: no previous proto=
type for =E2=80=98au1000_ReleaseDB=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-10) =E2=80=94 FAIL, 0 errors, 9 warnings=
, 0 section mismatches

Warnings:
    arch/mips/dec/reset.c:22:17: warning: no previous prototype for =E2=80=
=98dec_machine_restart=E2=80=99 [-Wmissing-prototypes]
    arch/mips/dec/reset.c:27:17: warning: no previous prototype for =E2=80=
=98dec_machine_halt=E2=80=99 [-Wmissing-prototypes]
    arch/mips/dec/reset.c:32:17: warning: no previous prototype for =E2=80=
=98dec_machine_power_off=E2=80=99 [-Wmissing-prototypes]
    arch/mips/dec/reset.c:38:13: warning: no previous prototype for =E2=80=
=98dec_intr_halt=E2=80=99 [-Wmissing-prototypes]
    arch/mips/dec/setup.c:780:25: warning: no previous prototype for =E2=80=
=98dec_irq_dispatch=E2=80=99 [-Wmissing-prototypes]
    arch/mips/kernel/cevt-ds1287.c:15:5: warning: no previous prototype for=
 =E2=80=98ds1287_timer_state=E2=80=99 [-Wmissing-prototypes]
    arch/mips/kernel/cevt-ds1287.c:20:5: warning: no previous prototype for=
 =E2=80=98ds1287_set_base_clock=E2=80=99 [-Wmissing-prototypes]
    arch/mips/kernel/cevt-ds1287.c:103:12: warning: no previous prototype f=
or =E2=80=98ds1287_clockevent_init=E2=80=99 [-Wmissing-prototypes]
    arch/mips/dec/prom/init.c:45:13: warning: no previous prototype for =E2=
=80=98which_prom=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 9 warnings, 0=
 section mismatches

Warnings:
    arch/mips/dec/reset.c:22:17: warning: no previous prototype for =E2=80=
=98dec_machine_restart=E2=80=99 [-Wmissing-prototypes]
    arch/mips/dec/reset.c:27:17: warning: no previous prototype for =E2=80=
=98dec_machine_halt=E2=80=99 [-Wmissing-prototypes]
    arch/mips/dec/reset.c:32:17: warning: no previous prototype for =E2=80=
=98dec_machine_power_off=E2=80=99 [-Wmissing-prototypes]
    arch/mips/dec/reset.c:38:13: warning: no previous prototype for =E2=80=
=98dec_intr_halt=E2=80=99 [-Wmissing-prototypes]
    arch/mips/dec/setup.c:780:25: warning: no previous prototype for =E2=80=
=98dec_irq_dispatch=E2=80=99 [-Wmissing-prototypes]
    arch/mips/kernel/cevt-ds1287.c:15:5: warning: no previous prototype for=
 =E2=80=98ds1287_timer_state=E2=80=99 [-Wmissing-prototypes]
    arch/mips/kernel/cevt-ds1287.c:20:5: warning: no previous prototype for=
 =E2=80=98ds1287_set_base_clock=E2=80=99 [-Wmissing-prototypes]
    arch/mips/kernel/cevt-ds1287.c:103:12: warning: no previous prototype f=
or =E2=80=98ds1287_clockevent_init=E2=80=99 [-Wmissing-prototypes]
    arch/mips/dec/prom/init.c:45:13: warning: no previous prototype for =E2=
=80=98which_prom=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 9 warning=
s, 0 section mismatches

Warnings:
    arch/mips/dec/reset.c:22:17: warning: no previous prototype for =E2=80=
=98dec_machine_restart=E2=80=99 [-Wmissing-prototypes]
    arch/mips/dec/reset.c:27:17: warning: no previous prototype for =E2=80=
=98dec_machine_halt=E2=80=99 [-Wmissing-prototypes]
    arch/mips/dec/reset.c:32:17: warning: no previous prototype for =E2=80=
=98dec_machine_power_off=E2=80=99 [-Wmissing-prototypes]
    arch/mips/dec/reset.c:38:13: warning: no previous prototype for =E2=80=
=98dec_intr_halt=E2=80=99 [-Wmissing-prototypes]
    arch/mips/dec/setup.c:780:25: warning: no previous prototype for =E2=80=
=98dec_irq_dispatch=E2=80=99 [-Wmissing-prototypes]
    arch/mips/kernel/cevt-ds1287.c:15:5: warning: no previous prototype for=
 =E2=80=98ds1287_timer_state=E2=80=99 [-Wmissing-prototypes]
    arch/mips/kernel/cevt-ds1287.c:20:5: warning: no previous prototype for=
 =E2=80=98ds1287_set_base_clock=E2=80=99 [-Wmissing-prototypes]
    arch/mips/kernel/cevt-ds1287.c:103:12: warning: no previous prototype f=
or =E2=80=98ds1287_clockevent_init=E2=80=99 [-Wmissing-prototypes]
    arch/mips/dec/prom/init.c:45:13: warning: no previous prototype for =E2=
=80=98which_prom=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-10) =E2=80=94 FAIL, 25 errors, 2 warnings, 0 section =
mismatches

Errors:
    arch/arm64/include/asm/atomic_ll_sc.h:298:2: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:305:24: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:306:36: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:306:47: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:306:57: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:305:24: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:306:36: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:306:47: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:306:57: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:285:24: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:286:34: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:286:45: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:286:55: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:285:24: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:286:34: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:286:45: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:286:55: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:134:15: error: unknown type name =E2=
=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:134:48: error: unknown type name =E2=
=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:135:11: error: unknown type name =E2=
=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:135:21: error: unknown type name =E2=
=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:134:15: error: unknown type name =E2=
=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:134:48: error: unknown type name =E2=
=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:135:11: error: unknown type name =E2=
=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:135:21: error: unknown type name =E2=
=80=98u128=E2=80=99

Warnings:
    arch/arm64/include/asm/memory.h:243:9: warning: cast from pointer to in=
teger of different size [-Wpointer-to-int-cast]
    arch/arm64/include/asm/memory.h:300:15: warning: cast from pointer to i=
nteger of different size [-Wpointer-to-int-cast]

---------------------------------------------------------------------------=
-----
defconfig (riscv, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-17) =E2=80=94 FAIL, 20 errors, 0 warnings, 0 sectio=
n mismatches

Errors:
    arch/arm64/include/asm/atomic_ll_sc.h:298:2: error: unknown type name '=
u128'
    arch/arm64/include/asm/atomic_ll_sc.h:332:1: error: unknown type name '=
u128'
    arch/arm64/include/asm/atomic_ll_sc.h:332:1: error: unknown type name '=
u128'
    arch/arm64/include/asm/atomic_ll_sc.h:332:1: error: unknown type name '=
u128'
    arch/arm64/include/asm/atomic_ll_sc.h:332:1: error: unknown type name '=
u128'
    arch/arm64/include/asm/atomic_ll_sc.h:332:1: error: expected expression
    arch/arm64/include/asm/atomic_ll_sc.h:332:1: error: use of undeclared i=
dentifier 'u128'
    arch/arm64/include/asm/atomic_ll_sc.h:332:1: error: expected ')'
    arch/arm64/include/asm/atomic_ll_sc.h:333:1: error: unknown type name '=
u128'
    arch/arm64/include/asm/atomic_ll_sc.h:333:1: error: unknown type name '=
u128'
    arch/arm64/include/asm/atomic_ll_sc.h:333:1: error: unknown type name '=
u128'
    arch/arm64/include/asm/atomic_ll_sc.h:333:1: error: unknown type name '=
u128'
    arch/arm64/include/asm/atomic_ll_sc.h:333:1: error: expected expression
    arch/arm64/include/asm/atomic_ll_sc.h:333:1: error: use of undeclared i=
dentifier 'u128'
    arch/arm64/include/asm/atomic_ll_sc.h:333:1: error: expected ')'
    arch/arm64/include/asm/atomic_lse.h:265:1: error: invalid input constra=
int 'rZ' in asm
    arch/arm64/include/asm/atomic_lse.h:266:1: error: invalid input constra=
int 'rZ' in asm
    arch/arm64/include/asm/atomic_lse.h:267:1: error: invalid input constra=
int 'rZ' in asm
    arch/arm64/include/asm/atomic_lse.h:268:1: error: invalid input constra=
int 'rZ' in asm
    fatal error: too many errors emitted, stopping now [-ferror-limit=3D]

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 1 warning, 0 section mismatches

Warnings:
    include/linux/array_size.h:11:25: warning: overflow in conversion from =
=E2=80=98long unsigned int=E2=80=99 to =E2=80=98int=E2=80=99 changes value =
from =E2=80=9818446744073709551615=E2=80=99 to =E2=80=98-1=E2=80=99 [-Wover=
flow]

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-17) =E2=80=94 PASS, 0 er=
rors, 2 warnings, 0 section mismatches

Warnings:
    drivers/gpu/drm/imagination/pvr_vm_mips.c:105:49: warning: implicit con=
version from 'unsigned long' to 'int' changes value from 184467440737095516=
15 to -1 [-Wconstant-conversion]
    1 warning generated.

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 error=
s, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-10) =E2=80=94 FAIL, 25 erro=
rs, 2 warnings, 0 section mismatches

Errors:
    arch/arm64/include/asm/atomic_ll_sc.h:298:2: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:305:24: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:306:36: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:306:47: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:306:57: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:305:24: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:306:36: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:306:47: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:306:57: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:285:24: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:286:34: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:286:45: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:286:55: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:285:24: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:286:34: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:286:45: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:286:55: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:134:15: error: unknown type name =E2=
=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:134:48: error: unknown type name =E2=
=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:135:11: error: unknown type name =E2=
=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:135:21: error: unknown type name =E2=
=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:134:15: error: unknown type name =E2=
=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:134:48: error: unknown type name =E2=
=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:135:11: error: unknown type name =E2=
=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:135:21: error: unknown type name =E2=
=80=98u128=E2=80=99

Warnings:
    arch/arm64/include/asm/memory.h:243:9: warning: cast from pointer to in=
teger of different size [-Wpointer-to-int-cast]
    arch/arm64/include/asm/memory.h:300:15: warning: cast from pointer to i=
nteger of different size [-Wpointer-to-int-cast]

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook (arm64, gcc-10) =E2=80=94 FAIL, 25 errors, 2 war=
nings, 0 section mismatches

Errors:
    arch/arm64/include/asm/atomic_ll_sc.h:298:2: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:305:24: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:306:36: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:306:47: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:306:57: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:305:24: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:306:36: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:306:47: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:306:57: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:285:24: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:286:34: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:286:45: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:286:55: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:285:24: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:286:34: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:286:45: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:286:55: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:134:15: error: unknown type name =E2=
=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:134:48: error: unknown type name =E2=
=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:135:11: error: unknown type name =E2=
=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:135:21: error: unknown type name =E2=
=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:134:15: error: unknown type name =E2=
=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:134:48: error: unknown type name =E2=
=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:135:11: error: unknown type name =E2=
=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:135:21: error: unknown type name =E2=
=80=98u128=E2=80=99

Warnings:
    arch/arm64/include/asm/memory.h:243:9: warning: cast from pointer to in=
teger of different size [-Wpointer-to-int-cast]
    arch/arm64/include/asm/memory.h:300:15: warning: cast from pointer to i=
nteger of different size [-Wpointer-to-int-cast]

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook+kselftest (arm64, gcc-10) =E2=80=94 FAIL, 25 err=
ors, 2 warnings, 0 section mismatches

Errors:
    arch/arm64/include/asm/atomic_ll_sc.h:298:2: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:305:24: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:306:36: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:306:47: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:306:57: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:305:24: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:306:36: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:306:47: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:306:57: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:285:24: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:286:34: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:286:45: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:286:55: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:285:24: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:286:34: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:286:45: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:286:55: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:134:15: error: unknown type name =E2=
=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:134:48: error: unknown type name =E2=
=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:135:11: error: unknown type name =E2=
=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:135:21: error: unknown type name =E2=
=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:134:15: error: unknown type name =E2=
=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:134:48: error: unknown type name =E2=
=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:135:11: error: unknown type name =E2=
=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:135:21: error: unknown type name =E2=
=80=98u128=E2=80=99

Warnings:
    arch/arm64/include/asm/memory.h:243:9: warning: cast from pointer to in=
teger of different size [-Wpointer-to-int-cast]
    arch/arm64/include/asm/memory.h:300:15: warning: cast from pointer to i=
nteger of different size [-Wpointer-to-int-cast]

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook+videodec (arm64, gcc-10) =E2=80=94 FAIL, 25 erro=
rs, 2 warnings, 0 section mismatches

Errors:
    arch/arm64/include/asm/atomic_ll_sc.h:298:2: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:305:24: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:306:36: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:306:47: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:306:57: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:305:24: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:306:36: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:306:47: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:306:57: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:285:24: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:286:34: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:286:45: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:286:55: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:285:24: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:286:34: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:286:45: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:286:55: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:134:15: error: unknown type name =E2=
=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:134:48: error: unknown type name =E2=
=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:135:11: error: unknown type name =E2=
=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:135:21: error: unknown type name =E2=
=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:134:15: error: unknown type name =E2=
=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:134:48: error: unknown type name =E2=
=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:135:11: error: unknown type name =E2=
=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:135:21: error: unknown type name =E2=
=80=98u128=E2=80=99

Warnings:
    arch/arm64/include/asm/memory.h:243:9: warning: cast from pointer to in=
teger of different size [-Wpointer-to-int-cast]
    arch/arm64/include/asm/memory.h:300:15: warning: cast from pointer to i=
nteger of different size [-Wpointer-to-int-cast]

---------------------------------------------------------------------------=
-----
defconfig+debug (arm64, gcc-10) =E2=80=94 FAIL, 25 errors, 2 warnings, 0 se=
ction mismatches

Errors:
    arch/arm64/include/asm/atomic_ll_sc.h:298:2: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:305:24: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:306:36: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:306:47: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:306:57: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:305:24: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:306:36: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:306:47: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:306:57: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:285:24: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:286:34: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:286:45: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:286:55: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:285:24: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:286:34: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:286:45: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:286:55: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:134:15: error: unknown type name =E2=
=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:134:48: error: unknown type name =E2=
=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:135:11: error: unknown type name =E2=
=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:135:21: error: unknown type name =E2=
=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:134:15: error: unknown type name =E2=
=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:134:48: error: unknown type name =E2=
=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:135:11: error: unknown type name =E2=
=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:135:21: error: unknown type name =E2=
=80=98u128=E2=80=99

Warnings:
    arch/arm64/include/asm/memory.h:243:9: warning: cast from pointer to in=
teger of different size [-Wpointer-to-int-cast]
    arch/arm64/include/asm/memory.h:300:15: warning: cast from pointer to i=
nteger of different size [-Wpointer-to-int-cast]

---------------------------------------------------------------------------=
-----
defconfig+debug (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-10) =E2=80=94 FAIL, 25 errors, 2 warnings, =
0 section mismatches

Errors:
    arch/arm64/include/asm/atomic_ll_sc.h:298:2: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:305:24: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:306:36: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:306:47: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:306:57: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:305:24: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:306:36: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:306:47: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:306:57: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:285:24: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:286:34: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:286:45: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:286:55: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:285:24: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:286:34: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:286:45: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:286:55: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:134:15: error: unknown type name =E2=
=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:134:48: error: unknown type name =E2=
=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:135:11: error: unknown type name =E2=
=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:135:21: error: unknown type name =E2=
=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:134:15: error: unknown type name =E2=
=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:134:48: error: unknown type name =E2=
=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:135:11: error: unknown type name =E2=
=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:135:21: error: unknown type name =E2=
=80=98u128=E2=80=99

Warnings:
    arch/arm64/include/asm/memory.h:243:9: warning: cast from pointer to in=
teger of different size [-Wpointer-to-int-cast]
    arch/arm64/include/asm/memory.h:300:15: warning: cast from pointer to i=
nteger of different size [-Wpointer-to-int-cast]

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+videodec (arm64, gcc-10) =E2=80=94 FAIL, 25 errors, 2 warnings, 0=
 section mismatches

Errors:
    arch/arm64/include/asm/atomic_ll_sc.h:298:2: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:305:24: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:306:36: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:306:47: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:306:57: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:305:24: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:306:36: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:306:47: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_ll_sc.h:306:57: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:285:24: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:286:34: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:286:45: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:286:55: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:285:24: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:286:34: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:286:45: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/atomic_lse.h:286:55: error: unknown type name =
=E2=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:134:15: error: unknown type name =E2=
=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:134:48: error: unknown type name =E2=
=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:135:11: error: unknown type name =E2=
=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:135:21: error: unknown type name =E2=
=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:134:15: error: unknown type name =E2=
=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:134:48: error: unknown type name =E2=
=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:135:11: error: unknown type name =E2=
=80=98u128=E2=80=99
    arch/arm64/include/asm/cmpxchg.h:135:21: error: unknown type name =E2=
=80=98u128=E2=80=99

Warnings:
    arch/arm64/include/asm/memory.h:243:9: warning: cast from pointer to in=
teger of different size [-Wpointer-to-int-cast]
    arch/arm64/include/asm/memory.h:300:15: warning: cast from pointer to i=
nteger of different size [-Wpointer-to-int-cast]

---------------------------------------------------------------------------=
-----
eyeq5_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    arch/mips/loongson2ef/common/machtype.c:34:20: warning: no previous pro=
totype for =E2=80=98mach_prom_init_machtype=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
gcw0_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
gpr_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    drivers/net/ethernet/amd/au1000_eth.c:574:6: warning: no previous proto=
type for =E2=80=98au1000_ReleaseDB=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
h3600_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0=
 section mismatches

Warnings:
    arch/arc/boot/dts/haps_hs_idu.dts:68.16-72.5: Warning (interrupt_provid=
er): /fpga/pct: '#interrupt-cells' found, but node is not an interrupt prov=
ider
    arch/arc/boot/dts/haps_hs_idu.dtb: Warning (interrupt_map): Failed prer=
equisite 'interrupt_provider'
    arch/arc/kernel/ptrace.c:342:16: warning: no previous prototype for 'sy=
scall_trace_enter' [-Wmissing-prototypes]
    arch/arc/kernel/kprobes.c:193:15: warning: no previous prototype for 'a=
rc_kprobe_handler' [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig+debug (arc, gcc-10) =E2=80=94 PASS, 0 errors, 4 warni=
ngs, 0 section mismatches

Warnings:
    arch/arc/boot/dts/haps_hs_idu.dts:68.16-72.5: Warning (interrupt_provid=
er): /fpga/pct: '#interrupt-cells' found, but node is not an interrupt prov=
ider
    arch/arc/boot/dts/haps_hs_idu.dtb: Warning (interrupt_map): Failed prer=
equisite 'interrupt_provider'
    arch/arc/kernel/ptrace.c:342:16: warning: no previous prototype for 'sy=
scall_trace_enter' [-Wmissing-prototypes]
    arch/arc/kernel/kprobes.c:193:15: warning: no previous prototype for 'a=
rc_kprobe_handler' [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig+kselftest (arc, gcc-10) =E2=80=94 FAIL, 0 errors, 4 w=
arnings, 0 section mismatches

Warnings:
    arch/arc/boot/dts/haps_hs_idu.dts:68.16-72.5: Warning (interrupt_provid=
er): /fpga/pct: '#interrupt-cells' found, but node is not an interrupt prov=
ider
    arch/arc/boot/dts/haps_hs_idu.dtb: Warning (interrupt_map): Failed prer=
equisite 'interrupt_provider'
    arch/arc/kernel/ptrace.c:342:16: warning: no previous prototype for 'sy=
scall_trace_enter' [-Wmissing-prototypes]
    arch/arc/kernel/kprobes.c:193:15: warning: no previous prototype for 'a=
rc_kprobe_handler' [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
hisi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
hsdk_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    arch/arc/boot/dts/hsdk.dts:207.23-235.5: Warning (interrupt_provider): =
/soc/ethernet@8000: '#interrupt-cells' found, but node is not an interrupt =
provider
    arch/arc/boot/dts/hsdk.dtb: Warning (interrupt_map): Failed prerequisit=
e 'interrupt_provider'
    arch/arc/kernel/ptrace.c:342:16: warning: no previous prototype for 'sy=
scall_trace_enter' [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig+debug (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig+kselftest (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

---------------------------------------------------------------------------=
-----
imx_v4_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
imxrt_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
ip22_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 6 warnings, 0 secti=
on mismatches

Warnings:
    arch/mips/sgi-ip22/ip22-time.c:119:18: warning: no previous prototype f=
or =E2=80=98indy_8254timer_irq=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sgi-ip22/ip22-gio.c:249:6: warning: no previous prototype for=
 =E2=80=98ip22_gio_set_64bit=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sgi-ip22/ip22-gio.c:398:12: warning: no previous prototype fo=
r =E2=80=98ip22_gio_init=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sgi-ip22/ip22-berr.c:89:6: warning: no previous prototype for=
 =E2=80=98ip22_be_interrupt=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sgi-ip22/ip22-berr.c:113:13: warning: no previous prototype f=
or =E2=80=98ip22_be_init=E2=80=99 [-Wmissing-prototypes]
    drivers/scsi/sgiwd93.c:173:6: warning: no previous prototype for =E2=80=
=98sgiwd93_reset=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
ip27_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ip28_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 8 warnings, 0 secti=
on mismatches

Warnings:
    arch/mips/sgi-ip22/ip22-time.c:119:18: warning: no previous prototype f=
or =E2=80=98indy_8254timer_irq=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sgi-ip22/ip22-gio.c:249:6: warning: no previous prototype for=
 =E2=80=98ip22_gio_set_64bit=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sgi-ip22/ip22-gio.c:398:12: warning: no previous prototype fo=
r =E2=80=98ip22_gio_init=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sgi-ip22/ip28-berr.c:440:6: warning: no previous prototype fo=
r =E2=80=98ip22_be_interrupt=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sgi-ip22/ip28-berr.c:469:13: warning: no previous prototype f=
or =E2=80=98ip22_be_init=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sgi-ip22/ip28-berr.c:474:5: warning: no previous prototype fo=
r =E2=80=98ip28_show_be_info=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sgi-ip22/ip22-eisa.c:95:12: warning: no previous prototype fo=
r =E2=80=98ip22_eisa_init=E2=80=99 [-Wmissing-prototypes]
    drivers/scsi/sgiwd93.c:173:6: warning: no previous prototype for =E2=80=
=98sgiwd93_reset=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
ip32_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    drivers/net/ethernet/sgi/meth.c:271:5: warning: no previous prototype f=
or =E2=80=98meth_reset=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0 secti=
on mismatches

Warnings:
    arch/mips/jazz/irq.c:38:6: warning: no previous prototype for =E2=80=98=
disable_r4030_irq=E2=80=99 [-Wmissing-prototypes]
    arch/mips/jazz/irq.c:55:13: warning: no previous prototype for =E2=80=
=98init_r4030_ints=E2=80=99 [-Wmissing-prototypes]
    arch/mips/jazz/irq.c:128:13: warning: no previous prototype for =E2=80=
=98plat_time_init=E2=80=99 [-Wmissing-prototypes]
    arch/mips/jazz/reset.c:49:6: warning: no previous prototype for =E2=80=
=98jazz_machine_restart=E2=80=99 [-Wmissing-prototypes]
    arch/mips/jazz/setup.c:54:13: warning: no previous prototype for =E2=80=
=98plat_mem_setup=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
lemote2f_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 22 warnings, 0 =
section mismatches

Warnings:
    arch/mips/loongson2ef/common/cs5536/cs5536_ide.c:15:6: warning: no prev=
ious prototype for =E2=80=98pci_ide_write_reg=E2=80=99 [-Wmissing-prototype=
s]
    arch/mips/loongson2ef/common/cs5536/cs5536_ide.c:96:5: warning: no prev=
ious prototype for =E2=80=98pci_ide_read_reg=E2=80=99 [-Wmissing-prototypes]
    arch/mips/loongson2ef/common/cs5536/cs5536_acc.c:15:6: warning: no prev=
ious prototype for =E2=80=98pci_acc_write_reg=E2=80=99 [-Wmissing-prototype=
s]
    arch/mips/loongson2ef/common/cs5536/cs5536_acc.c:62:5: warning: no prev=
ious prototype for =E2=80=98pci_acc_read_reg=E2=80=99 [-Wmissing-prototypes]
    arch/mips/loongson2ef/common/cs5536/cs5536_ohci.c:15:6: warning: no pre=
vious prototype for =E2=80=98pci_ohci_write_reg=E2=80=99 [-Wmissing-prototy=
pes]
    arch/mips/loongson2ef/common/cs5536/cs5536_ohci.c:70:5: warning: no pre=
vious prototype for =E2=80=98pci_ohci_read_reg=E2=80=99 [-Wmissing-prototyp=
es]
    arch/mips/loongson2ef/common/cs5536/cs5536_isa.c:84:6: warning: no prev=
ious prototype for =E2=80=98pci_isa_write_bar=E2=80=99 [-Wmissing-prototype=
s]
    arch/mips/loongson2ef/common/cs5536/cs5536_isa.c:110:5: warning: no pre=
vious prototype for =E2=80=98pci_isa_read_bar=E2=80=99 [-Wmissing-prototype=
s]
    arch/mips/loongson2ef/common/cs5536/cs5536_isa.c:134:6: warning: no pre=
vious prototype for =E2=80=98pci_isa_write_reg=E2=80=99 [-Wmissing-prototyp=
es]
    arch/mips/loongson2ef/common/cs5536/cs5536_isa.c:228:5: warning: no pre=
vious prototype for =E2=80=98pci_isa_read_reg=E2=80=99 [-Wmissing-prototype=
s]
    arch/mips/loongson2ef/common/cs5536/cs5536_ehci.c:15:6: warning: no pre=
vious prototype for =E2=80=98pci_ehci_write_reg=E2=80=99 [-Wmissing-prototy=
pes]
    arch/mips/loongson2ef/common/cs5536/cs5536_ehci.c:75:5: warning: no pre=
vious prototype for =E2=80=98pci_ehci_read_reg=E2=80=99 [-Wmissing-prototyp=
es]
    arch/mips/loongson2ef/common/machtype.c:34:20: warning: no previous pro=
totype for =E2=80=98mach_prom_init_machtype=E2=80=99 [-Wmissing-prototypes]
    arch/mips/loongson2ef/common/pm.c:59:13: warning: no previous prototype=
 for =E2=80=98setup_wakeup_events=E2=80=99 [-Wmissing-prototypes]
    arch/mips/loongson2ef/common/pm.c:66:12: warning: no previous prototype=
 for =E2=80=98wakeup_loongson=E2=80=99 [-Wmissing-prototypes]
    arch/mips/loongson2ef/common/pm.c:114:13: warning: no previous prototyp=
e for =E2=80=98mach_suspend=E2=80=99 [-Wmissing-prototypes]
    arch/mips/loongson2ef/common/pm.c:118:13: warning: no previous prototyp=
e for =E2=80=98mach_resume=E2=80=99 [-Wmissing-prototypes]
    arch/mips/loongson2ef/lemote-2f/machtype.c:10:13: warning: no previous =
prototype for =E2=80=98mach_prom_init_machtype=E2=80=99 [-Wmissing-prototyp=
es]
    arch/mips/loongson2ef/lemote-2f/pm.c:52:6: warning: no previous prototy=
pe for =E2=80=98setup_wakeup_events=E2=80=99 [-Wmissing-prototypes]
    arch/mips/loongson2ef/lemote-2f/pm.c:90:5: warning: no previous prototy=
pe for =E2=80=98wakeup_loongson=E2=80=99 [-Wmissing-prototypes]
    arch/mips/loongson2ef/lemote-2f/pm.c:137:13: warning: no previous proto=
type for =E2=80=98mach_suspend=E2=80=99 [-Wmissing-prototypes]
    arch/mips/loongson2ef/lemote-2f/pm.c:142:13: warning: no previous proto=
type for =E2=80=98mach_resume=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
loongson1b_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    arch/mips/loongson32/common/platform.c:71:5: warning: no previous proto=
type for =E2=80=98ls1x_eth_mux_init=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
loongson1c_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    arch/mips/loongson32/common/platform.c:71:5: warning: no previous proto=
type for =E2=80=98ls1x_eth_mux_init=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
loongson2k_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 12 warnings, =
0 section mismatches

Warnings:
    arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi:116.16-297.5: Warnin=
g (interrupt_provider): /bus@10000000/pci@1a000000: '#interrupt-cells' foun=
d, but node is not an interrupt provider
    arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: Warning (inter=
rupt_map): Failed prerequisite 'interrupt_provider'
    arch/mips/boot/dts/loongson/ls7a-pch.dtsi:68.16-416.5: Warning (interru=
pt_provider): /bus@10000000/pci@1a000000: '#interrupt-cells' found, but nod=
e is not an interrupt provider
    arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dts:28.31-36.4: Warn=
ing (interrupt_provider): /bus@10000000/msi-controller@2ff00000: Missing '#=
interrupt-cells' in interrupt provider
    arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: Warning (interr=
upt_map): Failed prerequisite 'interrupt_provider'
    arch/mips/boot/dts/loongson/ls7a-pch.dtsi:68.16-416.5: Warning (interru=
pt_provider): /bus@10000000/pci@1a000000: '#interrupt-cells' found, but nod=
e is not an interrupt provider
    arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dts:32.31-40.4: Warn=
ing (interrupt_provider): /bus@10000000/msi-controller@2ff00000: Missing '#=
interrupt-cells' in interrupt provider
    arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: Warning (interr=
upt_map): Failed prerequisite 'interrupt_provider'
    arch/mips/loongson64/dma.c:25:13: warning: no previous prototype for =
=E2=80=98plat_swiotlb_setup=E2=80=99 [-Wmissing-prototypes]
    arch/mips/loongson64/pm.c:59:13: warning: no previous prototype for =E2=
=80=98setup_wakeup_events=E2=80=99 [-Wmissing-prototypes]
    arch/mips/loongson64/pm.c:63:13: warning: no previous prototype for =E2=
=80=98mach_suspend=E2=80=99 [-Wmissing-prototypes]
    arch/mips/loongson64/pm.c:67:13: warning: no previous prototype for =E2=
=80=98mach_resume=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
loongson3_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 13 warnings, 0=
 section mismatches

Warnings:
    arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi:116.16-297.5: Warnin=
g (interrupt_provider): /bus@10000000/pci@1a000000: '#interrupt-cells' foun=
d, but node is not an interrupt provider
    arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: Warning (inter=
rupt_map): Failed prerequisite 'interrupt_provider'
    arch/mips/boot/dts/loongson/ls7a-pch.dtsi:68.16-416.5: Warning (interru=
pt_provider): /bus@10000000/pci@1a000000: '#interrupt-cells' found, but nod=
e is not an interrupt provider
    arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dts:28.31-36.4: Warn=
ing (interrupt_provider): /bus@10000000/msi-controller@2ff00000: Missing '#=
interrupt-cells' in interrupt provider
    arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: Warning (interr=
upt_map): Failed prerequisite 'interrupt_provider'
    arch/mips/boot/dts/loongson/ls7a-pch.dtsi:68.16-416.5: Warning (interru=
pt_provider): /bus@10000000/pci@1a000000: '#interrupt-cells' found, but nod=
e is not an interrupt provider
    arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dts:32.31-40.4: Warn=
ing (interrupt_provider): /bus@10000000/msi-controller@2ff00000: Missing '#=
interrupt-cells' in interrupt provider
    arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: Warning (interr=
upt_map): Failed prerequisite 'interrupt_provider'
    arch/mips/loongson64/dma.c:25:13: warning: no previous prototype for =
=E2=80=98plat_swiotlb_setup=E2=80=99 [-Wmissing-prototypes]
    arch/mips/loongson64/pm.c:59:13: warning: no previous prototype for =E2=
=80=98setup_wakeup_events=E2=80=99 [-Wmissing-prototypes]
    arch/mips/loongson64/pm.c:63:13: warning: no previous prototype for =E2=
=80=98mach_suspend=E2=80=99 [-Wmissing-prototypes]
    arch/mips/loongson64/pm.c:67:13: warning: no previous prototype for =E2=
=80=98mach_resume=E2=80=99 [-Wmissing-prototypes]
    arch/mips/kvm/loongson_ipi.c:190:6: warning: no previous prototype for =
=E2=80=98kvm_init_loongson_ipi=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
lpc18xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
lpc32xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
malta_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnin=
gs, 0 section mismatches

---------------------------------------------------------------------------=
-----
maltaaprp_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 =
section mismatches

Warnings:
    arch/mips/kernel/vpe-mt.c:177:7: warning: no previous prototype for =E2=
=80=98vpe_alloc=E2=80=99 [-Wmissing-prototypes]
    arch/mips/kernel/vpe-mt.c:195:5: warning: no previous prototype for =E2=
=80=98vpe_start=E2=80=99 [-Wmissing-prototypes]
    arch/mips/kernel/vpe-mt.c:205:5: warning: no previous prototype for =E2=
=80=98vpe_stop=E2=80=99 [-Wmissing-prototypes]
    arch/mips/kernel/vpe-mt.c:226:5: warning: no previous prototype for =E2=
=80=98vpe_free=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
maltasmvp_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
maltasmvp_eva_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
maltaup_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
maltaup_xpa_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
mps2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
mtx1_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-10) =E2=80=94 PASS, =
0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-10) =E2=80=
=94 PASS, 0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0=
 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy (arm, gcc-10) =E2=80=94 PASS, 0=
 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    drivers/irqchip/irq-mxs.c:133:39: warning: no previous prototype for =
=E2=80=98icoll_handle_irq=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
neponset_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
netwinder_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
nhk8815_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_defconfig (riscv, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_sdcard_defconfig (riscv, clang-17) =E2=80=94 PASS, 0 errors, 0 w=
arnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_sdcard_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 war=
nings, 0 section mismatches

---------------------------------------------------------------------------=
-----
nsimosci_hs_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0=
 section mismatches

Warnings:
    arch/arc/boot/dts/nsimosci_hs.dts:84.16-88.5: Warning (interrupt_provid=
er): /fpga/pct: '#interrupt-cells' found, but node is not an interrupt prov=
ider
    arch/arc/boot/dts/nsimosci_hs.dtb: Warning (interrupt_map): Failed prer=
equisite 'interrupt_provider'
    arch/arc/kernel/ptrace.c:342:16: warning: no previous prototype for 'sy=
scall_trace_enter' [-Wmissing-prototypes]
    arch/arc/kernel/kprobes.c:193:15: warning: no previous prototype for 'a=
rc_kprobe_handler' [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
nsimosci_hs_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 4 warning=
s, 0 section mismatches

Warnings:
    arch/arc/boot/dts/nsimosci_hs_idu.dts:92.16-96.5: Warning (interrupt_pr=
ovider): /fpga/pct: '#interrupt-cells' found, but node is not an interrupt =
provider
    arch/arc/boot/dts/nsimosci_hs_idu.dtb: Warning (interrupt_map): Failed =
prerequisite 'interrupt_provider'
    arch/arc/kernel/ptrace.c:342:16: warning: no previous prototype for 'sy=
scall_trace_enter' [-Wmissing-prototypes]
    arch/arc/kernel/kprobes.c:193:15: warning: no previous prototype for 'a=
rc_kprobe_handler' [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
omap2plus_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
omega2p_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    arch/mips/ralink/irq.c:86:5: warning: no previous prototype for =E2=80=
=98get_c0_perfcount_int=E2=80=99 [-Wmissing-prototypes]
    arch/mips/ralink/irq.c:92:14: warning: no previous prototype for =E2=80=
=98get_c0_compare_int=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
pic32mzda_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    drivers/irqchip/irq-pic32-evic.c:164:5: warning: no previous prototype =
for =E2=80=98pic32_irq_domain_xlate=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
pxa3xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
pxa910_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
pxa_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
rb532_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    arch/mips/rb532/serial.c:48:12: warning: no previous prototype for =E2=
=80=98setup_serial_port=E2=80=99 [-Wmissing-prototypes]
    arch/mips/rb532/prom.c:49:13: warning: no previous prototype for =E2=80=
=98prom_setup_cmdline=E2=80=99 [-Wmissing-prototypes]
    arch/mips/rb532/gpio.c:200:12: warning: no previous prototype for =E2=
=80=98rb532_gpio_init=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    sound/arm/aaci.c:742:15: warning: unused variable =E2=80=98aaci=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 8 warnings, 0 sect=
ion mismatches

Warnings:
    arch/mips/sni/reset.c:28:6: warning: no previous prototype for =E2=80=
=98sni_machine_restart=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sni/reset.c:45:6: warning: no previous prototype for =E2=80=
=98sni_machine_power_off=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sni/rm200.c:211:6: warning: no previous prototype for =E2=80=
=98sni_rm200_mask_and_ack_8259A=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sni/rm200.c:331:6: warning: no previous prototype for =E2=80=
=98sni_rm200_init_8259A=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sni/rm200.c:387:13: warning: no previous prototype for =E2=80=
=98sni_rm200_i8259_irqs=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sni/rm200.c:428:6: warning: no previous prototype for =E2=80=
=98disable_rm200_irq=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sni/pcimt.c:206:6: warning: no previous prototype for =E2=80=
=98disable_pcimt_irq=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sni/pcit.c:168:6: warning: no previous prototype for =E2=80=
=98disable_pcit_irq=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
rs90_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
rt305x_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    arch/mips/ralink/irq.c:86:5: warning: no previous prototype for =E2=80=
=98get_c0_perfcount_int=E2=80=99 [-Wmissing-prototypes]
    arch/mips/ralink/irq.c:92:14: warning: no previous prototype for =E2=80=
=98get_c0_compare_int=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sect=
ion mismatches

Errors:
    drivers/leds/leds-gpio-register.c:23:32: error: redefinition of =E2=80=
=98gpio_led_register_device=E2=80=99

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
sama7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
sb1250_swarm_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 16 warnings=
, 0 section mismatches

Warnings:
    arch/mips/sibyte/sb1250/setup.c:79:5: warning: no previous prototype fo=
r =E2=80=98sb1250_m3_workaround_needed=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/sb1250/setup.c:168:13: warning: no previous prototype =
for =E2=80=98sb1250_setup=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/sb1250/irq.c:182:13: warning: no previous prototype fo=
r =E2=80=98init_sb1250_irqs=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/sb1250/time.c:10:13: warning: no previous prototype fo=
r =E2=80=98plat_time_init=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/sb1250/smp.c:38:6: warning: no previous prototype for =
=E2=80=98sb1250_smp_init=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/sb1250/smp.c:147:6: warning: no previous prototype for=
 =E2=80=98sb1250_mailbox_interrupt=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/swarm/rtc_xicor1241.c:108:5: warning: no previous prot=
otype for =E2=80=98xicor_set_time=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/swarm/rtc_xicor1241.c:167:10: warning: no previous pro=
totype for =E2=80=98xicor_get_time=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/swarm/rtc_xicor1241.c:203:5: warning: no previous prot=
otype for =E2=80=98xicor_probe=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/swarm/setup.c:59:5: warning: no previous prototype for=
 =E2=80=98swarm_be_handler=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/swarm/rtc_m41t81.c:139:5: warning: no previous prototy=
pe for =E2=80=98m41t81_set_time=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/swarm/rtc_m41t81.c:186:10: warning: no previous protot=
ype for =E2=80=98m41t81_get_time=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/swarm/rtc_m41t81.c:219:5: warning: no previous prototy=
pe for =E2=80=98m41t81_probe=E2=80=99 [-Wmissing-prototypes]
    arch/mips/kernel/cevt-sb1250.c:95:6: warning: no previous prototype for=
 =E2=80=98sb1250_clockevent_init=E2=80=99 [-Wmissing-prototypes]
    arch/mips/kernel/csrc-sb1250.c:53:13: warning: no previous prototype fo=
r =E2=80=98sb1250_clocksource_init=E2=80=99 [-Wmissing-prototypes]
    arch/mips/mm/cerr-sb1.c:165:17: warning: no previous prototype for =E2=
=80=98sb1_cache_error=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
sp7021_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
sparc32_defconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 6 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    kernel/dma.c:70:5: warning: no previous prototype for =E2=80=98request_=
dma=E2=80=99 [-Wmissing-prototypes]
    kernel/dma.c:88:6: warning: no previous prototype for =E2=80=98free_dma=
=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/lib/cmpdi2.c:6:11: warning: no previous prototype for =E2=80=
=98__cmpdi2=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/lib/ucmpdi2.c:5:11: warning: no previous prototype for =E2=
=80=98__ucmpdi2=E2=80=99 [-Wmissing-prototypes]
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
sparc64_defconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 26 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    arch/sparc/kernel/traps_64.c:253:6: warning: no previous prototype for =
=E2=80=98is_no_fault_exception=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/traps_64.c:2035:6: warning: no previous prototype for=
 =E2=80=98do_mcd_err=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/traps_64.c:2153:6: warning: no previous prototype for=
 =E2=80=98sun4v_nonresum_error_user_handled=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/setup_64.c:602:13: warning: no previous prototype for=
 =E2=80=98alloc_irqstack_bootmem=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/time_64.c:880:20: warning: no previous prototype for =
=E2=80=98sched_clock=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/adi_64.c:124:21: warning: no previous prototype for =
=E2=80=98find_tag_store=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/adi_64.c:156:21: warning: no previous prototype for =
=E2=80=98alloc_tag_store=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/adi_64.c:299:6: warning: no previous prototype for =
=E2=80=98del_tag_store=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/pci_sun4v.c:259:15: warning: no previous prototype fo=
r =E2=80=98dma_4v_iotsb_bind=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/uprobes.c:237:17: warning: no previous prototype for =
=E2=80=98uprobe_trap=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/mm/init_64.c:2644:6: warning: no previous prototype for =E2=
=80=98vmemmap_free=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vma.c:246:12: warning: no previous prototype for =E2=80=
=98init_vdso_image=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vclock_gettime.c:254:1: warning: no previous prototype =
for =E2=80=98__vdso_clock_gettime=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vclock_gettime.c:282:1: warning: no previous prototype =
for =E2=80=98__vdso_clock_gettime_stick=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vclock_gettime.c:307:1: warning: no previous prototype =
for =E2=80=98__vdso_gettimeofday=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vclock_gettime.c:343:1: warning: no previous prototype =
for =E2=80=98__vdso_gettimeofday_stick=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vdso32/../vclock_gettime.c:254:1: warning: no previous =
prototype for =E2=80=98__vdso_clock_gettime=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vdso32/../vclock_gettime.c:282:1: warning: no previous =
prototype for =E2=80=98__vdso_clock_gettime_stick=E2=80=99 [-Wmissing-proto=
types]
    arch/sparc/vdso/vdso32/../vclock_gettime.c:307:1: warning: no previous =
prototype for =E2=80=98__vdso_gettimeofday=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vdso32/../vclock_gettime.c:343:1: warning: no previous =
prototype for =E2=80=98__vdso_gettimeofday_stick=E2=80=99 [-Wmissing-protot=
ypes]
    arch/sparc/prom/misc_64.c:165:5: warning: no previous prototype for =E2=
=80=98prom_get_mmu_ihandle=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/prom/p1275.c:52:6: warning: no previous prototype for =E2=80=
=98prom_cif_init=E2=80=99 [-Wmissing-prototypes]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.

---------------------------------------------------------------------------=
-----
sparc64_defconfig+debug (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 24 warnin=
gs, 0 section mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    arch/sparc/kernel/traps_64.c:253:6: warning: no previous prototype for =
=E2=80=98is_no_fault_exception=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/traps_64.c:2035:6: warning: no previous prototype for=
 =E2=80=98do_mcd_err=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/traps_64.c:2153:6: warning: no previous prototype for=
 =E2=80=98sun4v_nonresum_error_user_handled=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/setup_64.c:602:13: warning: no previous prototype for=
 =E2=80=98alloc_irqstack_bootmem=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/time_64.c:880:20: warning: no previous prototype for =
=E2=80=98sched_clock=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/adi_64.c:124:21: warning: no previous prototype for =
=E2=80=98find_tag_store=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/adi_64.c:156:21: warning: no previous prototype for =
=E2=80=98alloc_tag_store=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/adi_64.c:299:6: warning: no previous prototype for =
=E2=80=98del_tag_store=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/pci_sun4v.c:259:15: warning: no previous prototype fo=
r =E2=80=98dma_4v_iotsb_bind=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/uprobes.c:237:17: warning: no previous prototype for =
=E2=80=98uprobe_trap=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/mm/init_64.c:2644:6: warning: no previous prototype for =E2=
=80=98vmemmap_free=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vma.c:246:12: warning: no previous prototype for =E2=80=
=98init_vdso_image=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vclock_gettime.c:254:1: warning: no previous prototype =
for =E2=80=98__vdso_clock_gettime=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vclock_gettime.c:282:1: warning: no previous prototype =
for =E2=80=98__vdso_clock_gettime_stick=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vclock_gettime.c:307:1: warning: no previous prototype =
for =E2=80=98__vdso_gettimeofday=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vclock_gettime.c:343:1: warning: no previous prototype =
for =E2=80=98__vdso_gettimeofday_stick=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vdso32/../vclock_gettime.c:254:1: warning: no previous =
prototype for =E2=80=98__vdso_clock_gettime=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vdso32/../vclock_gettime.c:282:1: warning: no previous =
prototype for =E2=80=98__vdso_clock_gettime_stick=E2=80=99 [-Wmissing-proto=
types]
    arch/sparc/vdso/vdso32/../vclock_gettime.c:307:1: warning: no previous =
prototype for =E2=80=98__vdso_gettimeofday=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vdso32/../vclock_gettime.c:343:1: warning: no previous =
prototype for =E2=80=98__vdso_gettimeofday_stick=E2=80=99 [-Wmissing-protot=
ypes]
    arch/sparc/prom/misc_64.c:165:5: warning: no previous prototype for =E2=
=80=98prom_get_mmu_ihandle=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/prom/p1275.c:52:6: warning: no previous prototype for =E2=80=
=98prom_cif_init=E2=80=99 [-Wmissing-prototypes]
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
sparc64_defconfig+kselftest (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 24 wa=
rnings, 0 section mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    ........................................../arch/sparc/kernel/traps_64.c=
:253:6: warning: no previous prototype for =E2=80=98is_no_fault_exception=
=E2=80=99 [-Wmissing-prototypes]
    ....../arch/sparc/kernel/traps_64.c:2035:6: warning: no previous protot=
ype for =E2=80=98do_mcd_err=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/traps_64.c:2153:6: warning: no previous prototype for=
 =E2=80=98sun4v_nonresum_error_user_handled=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/setup_64.c:602:13: warning: no previous prototype for=
 =E2=80=98alloc_irqstack_bootmem=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/time_64.c:880:20: warning: no previous prototype for =
=E2=80=98sched_clock=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/adi_64.c:124:21: warning: no previous prototype for =
=E2=80=98find_tag_store=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/adi_64.c:156:21: warning: no previous prototype for =
=E2=80=98alloc_tag_store=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/adi_64.c:299:6: warning: no previous prototype for =
=E2=80=98del_tag_store=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/pci_sun4v.c:259:15: warning: no previous prototype fo=
r =E2=80=98dma_4v_iotsb_bind=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/uprobes.c:237:17: warning: no previous prototype for =
=E2=80=98uprobe_trap=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/mm/init_64.c:2644:6: warning: no previous prototype for =E2=
=80=98vmemmap_free=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vma.c:246:12: warning: no previous prototype for =E2=80=
=98init_vdso_image=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vclock_gettime.c:254:1: warning: no previous prototype =
for =E2=80=98__vdso_clock_gettime=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vclock_gettime.c:282:1: warning: no previous prototype =
for =E2=80=98__vdso_clock_gettime_stick=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vclock_gettime.c:307:1: warning: no previous prototype =
for =E2=80=98__vdso_gettimeofday=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vclock_gettime.c:343:1: warning: no previous prototype =
for =E2=80=98__vdso_gettimeofday_stick=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vdso32/../vclock_gettime.c:254:1: warning: no previous =
prototype for =E2=80=98__vdso_clock_gettime=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vdso32/../vclock_gettime.c:282:1: warning: no previous =
prototype for =E2=80=98__vdso_clock_gettime_stick=E2=80=99 [-Wmissing-proto=
types]
    arch/sparc/vdso/vdso32/../vclock_gettime.c:307:1: warning: no previous =
prototype for =E2=80=98__vdso_gettimeofday=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vdso32/../vclock_gettime.c:343:1: warning: no previous =
prototype for =E2=80=98__vdso_gettimeofday_stick=E2=80=99 [-Wmissing-protot=
ypes]
    arch/sparc/prom/misc_64.c:165:5: warning: no previous prototype for =E2=
=80=98prom_get_mmu_ihandle=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/prom/p1275.c:52:6: warning: no previous prototype for =E2=80=
=98prom_cif_init=E2=80=99 [-Wmissing-prototypes]
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
spear3xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
stm32_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    arch/arc/kernel/ptrace.c:342:16: warning: no previous prototype for 'sy=
scall_trace_enter' [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
tinyconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0 section =
mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    arch/sparc/lib/cmpdi2.c:6:11: warning: no previous prototype for =E2=80=
=98__cmpdi2=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/lib/ucmpdi2.c:5:11: warning: no previous prototype for =E2=
=80=98__ucmpdi2=E2=80=99 [-Wmissing-prototypes]
    kernel/dma.c:70:5: warning: no previous prototype for =E2=80=98request_=
dma=E2=80=99 [-Wmissing-prototypes]
    kernel/dma.c:88:6: warning: no previous prototype for =E2=80=98free_dma=
=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
tinyconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
tinyconfig (arm64, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section m=
ismatches

Errors:
    drivers/power/supply/power_supply_core.c:1630:2: error: too few argumen=
ts to function =E2=80=98power_supply_init_attrs=E2=80=99

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
vdk_hs38_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 se=
ction mismatches

Warnings:
    arch/arc/boot/dts/vdk_axs10x_mb.dtsi:36.18-47.5: Warning (interrupt_pro=
vider): /axs10x_mb_vdk/ethernet@18000: '#interrupt-cells' found, but node i=
s not an interrupt provider
    arch/arc/boot/dts/vdk_hs38.dtb: Warning (interrupt_map): Failed prerequ=
isite 'interrupt_provider'
    arch/arc/kernel/ptrace.c:342:16: warning: no previous prototype for 'sy=
scall_trace_enter' [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
versatile_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    sound/arm/aaci.c:742:15: warning: unused variable =E2=80=98aaci=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    sound/arm/aaci.c:742:15: warning: unused variable =E2=80=98aaci=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
vocore2_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    arch/mips/ralink/irq.c:86:5: warning: no previous prototype for =E2=80=
=98get_c0_perfcount_int=E2=80=99 [-Wmissing-prototypes]
    arch/mips/ralink/irq.c:92:14: warning: no previous prototype for =E2=80=
=98get_c0_compare_int=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
wpcm450_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+debug (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 war=
nings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-board (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 war=
nings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-board+kselftest (x86_64, gcc-10) =E2=80=94 PASS, 0 err=
ors, 0 warnings, 0 section mismatches

---
For more info write to <info@kernelci.org>
