Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95330ED2
	for <llvm@lists.linux.dev>; Fri,  3 Jun 2022 13:29:22 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id 187so7187438pfu.9
        for <llvm@lists.linux.dev>; Fri, 03 Jun 2022 06:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=XErfPlkPQAydfkcaqBbLx1zkgdng7Y7LItt4wFyYdO8=;
        b=Nah6ZhOi3gMbUdI6jsqKlaUfHOAk5qNXca+fxDua4XPVee36y7tQof3xSZ48Jf3ajT
         JOsLdm5XquTe7xjJSDvWOMmiY0qcu/FCcx86CraUQ4pYRH9Ft1OGI+ctc+s2ZpBF8l7Q
         ggmoUcT8qW2GgFXh772Lia1SvbJuprTH58V2GsgHb1/m4761U+J423xWUePXZB6+yKfV
         NA0Qq3W4g8HLqCaeEGzYDsyhYUwVQbJF/obLXhKbShMCy0Rwtrjz5UeznJbMQGR9I5WL
         CqQjqtZlP/g8RGha6xGxY5Oos8Kw+rFnssfHeqMJo1xqqu7f0uxr68AxDCMorOtKP1oS
         goHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=XErfPlkPQAydfkcaqBbLx1zkgdng7Y7LItt4wFyYdO8=;
        b=UpZX6hbbG9BKAr1s3H9oj5b5gatXKrfFrgVlS/KkUnigUh8q9DLDXZ8HUg3l7dUoSV
         R37STebe9+CqpyVOVnB7yceDerqPjzHW4H3yziyTA4YWH7L8u6rWtH6cuMlyfV4JeOPP
         JRR71BR4nKIyo0g+EwNzl27FPwVHmwntigw6wew061zboexhuyHwnWMAGCaX+5Ihxlsr
         pSyInGnITX2ZgRrgqhjjiNhW00C9xVHlCpmd/5S7qSNgqu/jiiBVyZoHIxXmo6eLbdH3
         kTRiumBWmoHVd9w5dQPNpt5C2EZby3Yoeo04oEgWZyFFCbDiHaa3BzJBDAzha9fohH/T
         LX6A==
X-Gm-Message-State: AOAM5338HieVhCPcHqfZ4O++n9LBmo7kbvO5tnmz4lYD+n2m+iIkctPn
	+rrSR0jMTc+8v+J+e++0ZXmGj84jNRUWg5xG
X-Google-Smtp-Source: ABdhPJwXIIPusDPKoKLdmDMxZPavO3XYI1xUonX0Wx8tveRD93DegMFRUoyltXyPg3f6c4RKbaWu7g==
X-Received: by 2002:a62:e116:0:b0:51b:c452:47e6 with SMTP id q22-20020a62e116000000b0051bc45247e6mr9779707pfh.25.1654262959985;
        Fri, 03 Jun 2022 06:29:19 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c14-20020a170902c2ce00b0015e8d4eb207sm5410512pla.81.2022.06.03.06.29.18
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 06:29:19 -0700 (PDT)
Message-ID: <629a0caf.1c69fb81.25828.c210@mx.google.com>
Date: Fri, 03 Jun 2022 06:29:19 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20220603
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master build: 211 builds: 22 failed, 189 passed, 54 errors,
 105 warnings (next-20220603)
To: llvm@lists.linux.dev
From: "kernelci.org bot" <bot@kernelci.org>

next/master build: 211 builds: 22 failed, 189 passed, 54 errors, 105 warnin=
gs (next-20220603)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20220603/

Tree: next
Branch: master
Git Describe: next-20220603
Git Commit: 1cfd968b58a10b2b2489d8f64c956c846621ba46
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm64:
    cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config: (clang-13) =
FAIL
    cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chrome=
book: (clang-13) FAIL
    cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.config+arm64-chr=
omebook: (clang-13) FAIL
    cros://chromeos-5.10/arm64/chromiumos-qualcomm.flavour.config+arm64-chr=
omebook: (clang-13) FAIL
    cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.config+arm64-c=
hromebook: (clang-13) FAIL
    allmodconfig: (clang-15) FAIL

arm:
    cros://chromeos-5.10/armel/chromiumos-arm.flavour.config: (clang-13) FA=
IL
    cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config: (clang-1=
3) FAIL
    allmodconfig: (clang-15) FAIL
    allmodconfig: (gcc-10) FAIL
    rpc_defconfig: (gcc-10) FAIL
    sama7_defconfig: (gcc-10) FAIL

i386:
    allmodconfig: (clang-15) FAIL

mips:
    decstation_64_defconfig: (gcc-10) FAIL
    loongson2k_defconfig: (gcc-10) FAIL

riscv:
    defconfig+CONFIG_EFI=3Dn: (clang-15) FAIL

x86_64:
    cros://chromeos-5.10/x86_64/chromeos-amd-stoneyridge.flavour.config+x86=
-chromebook: (clang-13) FAIL
    cros://chromeos-5.10/x86_64/chromeos-intel-denverton.flavour.config+x86=
-chromebook: (clang-13) FAIL
    cros://chromeos-5.10/x86_64/chromeos-intel-pineview.flavour.config+x86-=
chromebook: (clang-13) FAIL
    cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config: (clang-13=
) FAIL
    cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config+x86-chrome=
book: (clang-13) FAIL
    allmodconfig: (clang-15) FAIL

Errors and Warnings Detected:

arc:

arm64:
    allmodconfig (clang-15): 2 errors, 1 warning
    cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config (clang-13): =
1 error
    cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chrome=
book (clang-13): 1 error
    cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.config+arm64-chr=
omebook (clang-13): 1 error
    cros://chromeos-5.10/arm64/chromiumos-qualcomm.flavour.config+arm64-chr=
omebook (clang-13): 1 error
    cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.config+arm64-c=
hromebook (clang-13): 1 error

arm:
    allmodconfig (gcc-10): 1 error, 1 warning
    allmodconfig (clang-15): 1 error, 13 warnings
    am200epdkit_defconfig (gcc-10): 1 warning
    aspeed_g5_defconfig (clang-15): 10 warnings
    badge4_defconfig (gcc-10): 1 warning
    bcm2835_defconfig (gcc-10): 2 warnings
    cm_x300_defconfig (gcc-10): 1 warning
    corgi_defconfig (gcc-10): 1 warning
    cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (clang-13): 1 =
error, 5 warnings
    cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (clang-13=
): 1 error, 5 warnings
    davinci_all_defconfig (gcc-10): 1 warning
    exynos_defconfig (gcc-10): 1 warning
    ezx_defconfig (gcc-10): 1 warning
    imx_v6_v7_defconfig (gcc-10): 1 warning
    magician_defconfig (gcc-10): 1 warning
    mini2440_defconfig (gcc-10): 1 warning
    multi_v5_defconfig (clang-15): 2 warnings
    multi_v7_defconfig (gcc-10): 1 warning
    multi_v7_defconfig (clang-15): 12 warnings
    multi_v7_defconfig+CONFIG_SMP=3Dn (gcc-10): 1 warning
    multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy (gcc-10): 1 warning
    multi_v7_defconfig+debug (gcc-10): 1 warning
    multi_v7_defconfig+kselftest (gcc-10): 2 warnings
    mvebu_v7_defconfig (gcc-10): 1 warning
    nhk8815_defconfig (gcc-10): 1 warning
    omap2plus_defconfig (gcc-10): 1 warning
    pxa_defconfig (gcc-10): 1 warning
    qcom_defconfig (gcc-10): 1 warning
    rpc_defconfig (gcc-10): 2 errors
    s5pv210_defconfig (gcc-10): 1 warning
    sama7_defconfig (gcc-10): 1 error, 1 warning
    simpad_defconfig (gcc-10): 1 warning
    spitz_defconfig (gcc-10): 1 warning
    tegra_defconfig (gcc-10): 1 warning
    trizeps4_defconfig (gcc-10): 1 warning
    u8500_defconfig (gcc-10): 1 warning
    viper_defconfig (gcc-10): 1 warning
    zeus_defconfig (gcc-10): 1 warning

i386:
    allmodconfig (clang-15): 1 error
    allnoconfig (clang-15): 2 warnings

mips:
    32r2el_defconfig (gcc-10): 1 warning
    32r2el_defconfig+debug (gcc-10): 1 warning
    32r2el_defconfig+kselftest (gcc-10): 1 warning
    lemote2f_defconfig (gcc-10): 1 error
    loongson2k_defconfig (gcc-10): 1 error, 1 warning
    loongson3_defconfig (gcc-10): 1 error
    rb532_defconfig (gcc-10): 1 warning

riscv:
    defconfig+CONFIG_EFI=3Dn (clang-15): 30 errors

x86_64:
    allmodconfig (clang-15): 1 error, 15 warnings
    cros://chromeos-5.10/x86_64/chromeos-amd-stoneyridge.flavour.config+x86=
-chromebook (clang-13): 1 error, 1 warning
    cros://chromeos-5.10/x86_64/chromeos-intel-denverton.flavour.config+x86=
-chromebook (clang-13): 1 error
    cros://chromeos-5.10/x86_64/chromeos-intel-pineview.flavour.config+x86-=
chromebook (clang-13): 1 error, 1 warning
    cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config (clang-13)=
: 1 error
    cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config+x86-chrome=
book (clang-13): 1 error

Errors summary:

    19   arch/riscv/include/asm/tlbflush.h:23:2: error: expected assembly-t=
ime absolute expression
    9    ERROR: modpost: Section mismatches detected.
    6    arch/riscv/include/asm/pgtable-64.h:121:2: error: expected assembl=
y-time absolute expression
    4    drivers/misc/cardreader/rts5261.c:406:13: error: variable 'setting=
_reg2' is used uninitialized whenever 'if' condition is false [-Werror,-Wso=
metimes-uninitialized]
    4    arch/riscv/include/asm/pgtable-64.h:105:2: error: expected assembl=
y-time absolute expression
    2    lib/maple_tree.c:4203:20: error: stack frame size (1096) exceeds l=
imit (1024) in function 'mas_wr_modify' [-Werror,-Wframe-larger-than]
    2    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=
=80=98-mhard-float=E2=80=99
    1    sound/soc/intel/avs/path.c:815:18: error: stack frame size (2176) =
exceeds limit (2048) in 'avs_path_create' [-Werror,-Wframe-larger-than]
    1    lib/maple_tree.c:4203:20: error: stack frame size (1144) exceeds l=
imit (1024) in 'mas_wr_modify' [-Werror,-Wframe-larger-than]
    1    lib/maple_tree.c:4203:20: error: stack frame size (1072) exceeds l=
imit (1024) in 'mas_wr_modify' [-Werror,-Wframe-larger-than]
    1    include/linux/fortify-string.h:344:4: error: call to =E2=80=98__wr=
ite_overflow_field=E2=80=99 declared with attribute warning: detected write=
 beyond size of field (1st parameter); maybe use struct_group()? [-Werror=
=3Dattribute-warning]
    1    fatal error: too many errors emitted, stopping now [-ferror-limit=
=3D]
    1    drivers/irqchip/irq-loongson-liointc.c:60:13: error: implicit decl=
aration of function =E2=80=98cpu_logical_map=E2=80=99 [-Werror=3Dimplicit-f=
unction-declaration]
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=
=3D0x'
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=
=3D0x'

Warnings summary:

    29   include/linux/bitmap.h:261:2: warning: =E2=80=98memcpy=E2=80=99 fo=
rming offset [4, 7] is out of the bounds [0, 4] of object =E2=80=98flags=E2=
=80=99 with type =E2=80=98long unsigned int[1]=E2=80=99 [-Warray-bounds]
    23   clang: warning: argument unused during compilation: '-march=3Darmv=
6k' [-Wunused-command-line-argument]
    20   clang: warning: argument unused during compilation: '-march=3Darmv=
7-a' [-Wunused-command-line-argument]
    4    drivers/misc/cardreader/rts5261.c:364:32: note: initialize the var=
iable 'setting_reg2' to silence this warning
    3    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_devic=
e_reg): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expec=
ted "0,0"
    3    1 warning generated.
    2    include/linux/fortify-string.h:344:4: warning: call to =E2=80=98__=
write_overflow_field=E2=80=99 declared with attribute warning: detected wri=
te beyond size of field (1st parameter); maybe use struct_group()? [-Wattri=
bute-warning]
    1    vmlinux.o: warning: objtool: vc_switch_off_ist+0xbe: call to memcp=
y() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: sync_regs+0x24: call to memcpy() leav=
es .noinstr.text section
    1    vmlinux.o: warning: objtool: fixup_bad_iret+0x36: call to memset()=
 leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: __startup_64() falls through to next =
function startup_64_setup_env()
    1    vmlinux.o: warning: objtool: __sev_put_ghcb+0x35: call to memcpy()=
 leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: __sev_get_ghcb+0xa6: call to memcpy()=
 leaves .noinstr.text section
    1    lib/maple_tree.c:4203:20: warning: stack frame size (1096) exceeds=
 limit (1024) in 'mas_wr_modify' [-Wframe-larger-than]
    1    lib/maple_tree.c:4203:20: warning: stack frame size (1088) exceeds=
 limit (1024) in 'mas_wr_modify' [-Wframe-larger-than]
    1    lib/maple_tree.c:4203:20: warning: stack frame size (1084) exceeds=
 limit (1024) in 'mas_wr_modify' [-Wframe-larger-than]
    1    include/linux/bitmap.h:261:2: warning: =E2=80=98memcpy=E2=80=99 fo=
rming offset [20, 23] is out of the bounds [0, 20] [-Warray-bounds]
    1    drivers/video/fbdev/udlfb.o: warning: objtool: dlfb_ops_write() fa=
lls through to next function dlfb_ops_setcolreg()
    1    drivers/video/fbdev/smscufx.o: warning: objtool: ufx_ops_write() f=
alls through to next function ufx_ops_setcolreg()
    1    drivers/soc/qcom/qcom_rpmh.o: warning: objtool: rpmh_rsc_write_ctr=
l_data() falls through to next function trace_raw_output_rpmh_tx_done()
    1    drivers/gpu/drm/radeon/radeon.o: warning: objtool: sumo_dpm_set_po=
wer_state() falls through to next function sumo_dpm_post_set_power_state()
    1    cc1: warning: result of =E2=80=98-117440512 << 16=E2=80=99 require=
s 44 bits to represent, but =E2=80=98int=E2=80=99 only has 32 bits [-Wshift=
-overflow=3D]
    1    cc1: some warnings being treated as errors
    1    cc1: all warnings being treated as errors
    1    arch/x86/kvm/kvm.o: warning: objtool: paging64_update_accessed_dir=
ty_bits+0x3a6: call to __ubsan_handle_load_invalid_value() with UACCESS ena=
bled
    1    arch/x86/kvm/kvm.o: warning: objtool: paging32_update_accessed_dir=
ty_bits+0x398: call to __ubsan_handle_load_invalid_value() with UACCESS ena=
bled
    1    arch/x86/kvm/kvm.o: warning: objtool: ept_update_accessed_dirty_bi=
ts+0x454: call to __ubsan_handle_load_invalid_value() with UACCESS enabled
    1    arch/x86/kvm/kvm.o: warning: objtool: emulator_cmpxchg_emulated+0x=
71b: call to __ubsan_handle_load_invalid_value() with UACCESS enabled

Section mismatches summary:

    90   WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Sec=
tion mismatch in reference from the variable __ksymtab_mdio_bus_init to the=
 function .init.text:mdio_bus_init()
    80   WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): S=
ection mismatch in reference from the variable __ksymtab_xfrm4_protocol_ini=
t to the function .init.text:xfrm4_protocol_init()
    14   WARNING: modpost: vmlinux.o(___ksymtab_gpl+xen_xlate_map_ballooned=
_pages+0x0): Section mismatch in reference from the variable __ksymtab_xen_=
xlate_map_ballooned_pages to the function .init.text:xen_xlate_map_balloone=
d_pages()
    12   WARNING: modpost: drivers/net/phy/libphy.o(___ksymtab_gpl+mdio_bus=
_init+0x0): Section mismatch in reference from the variable __ksymtab_mdio_=
bus_init to the function .init.text:mdio_bus_init()
    1    WARNING: modpost: vmlinux.o(___ksymtab_gpl+hv_init_clocksource+0x0=
): Section mismatch in reference from the variable __ksymtab_hv_init_clocks=
ource to the function .init.text:hv_init_clocksource()
    1    WARNING: modpost: vmlinux.o(___ksymtab+prom_init_numa_memory+0x0):=
 Section mismatch in reference from the variable __ksymtab_prom_init_numa_m=
emory to the function .init.text:prom_init_numa_memory()
    1    WARNING: modpost: vmlinux.o(.text.unlikely+0x212c): Section mismat=
ch in reference from the function at91_pm_secure_init() to the (unknown ref=
erence) .init.rodata:(unknown)
    1    WARNING: modpost: net/ipv6/ipv6.o(___ksymtab+seg6_hmac_init+0x0): =
Section mismatch in reference from the variable __ksymtab_seg6_hmac_init to=
 the function .init.text:seg6_hmac_init()

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_reg=
): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expected "=
0,0"

---------------------------------------------------------------------------=
-----
32r2el_defconfig+debug (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, =
0 section mismatches

Warnings:
    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_reg=
): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expected "=
0,0"

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warni=
ng, 0 section mismatches

Warnings:
    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_reg=
): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expected "=
0,0"

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, clang-15) =E2=80=94 FAIL, 1 error, 15 warnings, 0 sec=
tion mismatches

Errors:
    drivers/misc/cardreader/rts5261.c:406:13: error: variable 'setting_reg2=
' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometim=
es-uninitialized]

Warnings:
    vmlinux.o: warning: objtool: __startup_64() falls through to next funct=
ion startup_64_setup_env()
    vmlinux.o: warning: objtool: sync_regs+0x24: call to memcpy() leaves .n=
oinstr.text section
    vmlinux.o: warning: objtool: vc_switch_off_ist+0xbe: call to memcpy() l=
eaves .noinstr.text section
    vmlinux.o: warning: objtool: fixup_bad_iret+0x36: call to memset() leav=
es .noinstr.text section
    vmlinux.o: warning: objtool: __sev_get_ghcb+0xa6: call to memcpy() leav=
es .noinstr.text section
    vmlinux.o: warning: objtool: __sev_put_ghcb+0x35: call to memcpy() leav=
es .noinstr.text section
    arch/x86/kvm/kvm.o: warning: objtool: emulator_cmpxchg_emulated+0x71b: =
call to __ubsan_handle_load_invalid_value() with UACCESS enabled
    arch/x86/kvm/kvm.o: warning: objtool: paging64_update_accessed_dirty_bi=
ts+0x3a6: call to __ubsan_handle_load_invalid_value() with UACCESS enabled
    arch/x86/kvm/kvm.o: warning: objtool: paging32_update_accessed_dirty_bi=
ts+0x398: call to __ubsan_handle_load_invalid_value() with UACCESS enabled
    arch/x86/kvm/kvm.o: warning: objtool: ept_update_accessed_dirty_bits+0x=
454: call to __ubsan_handle_load_invalid_value() with UACCESS enabled
    drivers/soc/qcom/qcom_rpmh.o: warning: objtool: rpmh_rsc_write_ctrl_dat=
a() falls through to next function trace_raw_output_rpmh_tx_done()
    drivers/misc/cardreader/rts5261.c:364:32: note: initialize the variable=
 'setting_reg2' to silence this warning
    drivers/video/fbdev/udlfb.o: warning: objtool: dlfb_ops_write() falls t=
hrough to next function dlfb_ops_setcolreg()
    drivers/video/fbdev/smscufx.o: warning: objtool: ufx_ops_write() falls =
through to next function ufx_ops_setcolreg()
    drivers/gpu/drm/radeon/radeon.o: warning: objtool: sumo_dpm_set_power_s=
tate() falls through to next function sumo_dpm_post_set_power_state()

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+xen_xlate_map_ballooned_page=
s+0x0): Section mismatch in reference from the variable __ksymtab_xen_xlate=
_map_ballooned_pages to the function .init.text:xen_xlate_map_ballooned_pag=
es()
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+hv_init_clocksource+0x0): Se=
ction mismatch in reference from the variable __ksymtab_hv_init_clocksource=
 to the function .init.text:hv_init_clocksource()
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mi=
smatches

Errors:
    include/linux/fortify-string.h:344:4: error: call to =E2=80=98__write_o=
verflow_field=E2=80=99 declared with attribute warning: detected write beyo=
nd size of field (1st parameter); maybe use struct_group()? [-Werror=3Dattr=
ibute-warning]

Warnings:
    cc1: all warnings being treated as errors

Section mismatches:
    WARNING: modpost: vmlinux.o(.text.unlikely+0x212c): Section mismatch in=
 reference from the function at91_pm_secure_init() to the (unknown referenc=
e) .init.rodata:(unknown)
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
allmodconfig (i386, clang-15) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sectio=
n mismatches

Errors:
    lib/maple_tree.c:4203:20: error: stack frame size (1072) exceeds limit =
(1024) in 'mas_wr_modify' [-Werror,-Wframe-larger-than]

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+xen_xlate_map_ballooned_page=
s+0x0): Section mismatch in reference from the variable __ksymtab_xen_xlate=
_map_ballooned_pages to the function .init.text:xen_xlate_map_ballooned_pag=
es()
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()
    WARNING: modpost: drivers/net/phy/libphy.o(___ksymtab_gpl+mdio_bus_init=
+0x0): Section mismatch in reference from the variable __ksymtab_mdio_bus_i=
nit to the function .init.text:mdio_bus_init()
    WARNING: modpost: net/ipv6/ipv6.o(___ksymtab+seg6_hmac_init+0x0): Secti=
on mismatch in reference from the variable __ksymtab_seg6_hmac_init to the =
function .init.text:seg6_hmac_init()

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-15) =E2=80=94 FAIL, 2 errors, 1 warning, 0 secti=
on mismatches

Errors:
    drivers/misc/cardreader/rts5261.c:406:13: error: variable 'setting_reg2=
' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometim=
es-uninitialized]
    sound/soc/intel/avs/path.c:815:18: error: stack frame size (2176) excee=
ds limit (2048) in 'avs_path_create' [-Werror,-Wframe-larger-than]

Warnings:
    drivers/misc/cardreader/rts5261.c:364:32: note: initialize the variable=
 'setting_reg2' to silence this warning

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+xen_xlate_map_ballooned_page=
s+0x0): Section mismatch in reference from the variable __ksymtab_xen_xlate=
_map_ballooned_pages to the function .init.text:xen_xlate_map_ballooned_pag=
es()
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-15) =E2=80=94 FAIL, 1 error, 13 warnings, 0 sectio=
n mismatches

Errors:
    lib/maple_tree.c:4203:20: error: stack frame size (1144) exceeds limit =
(1024) in 'mas_wr_modify' [-Werror,-Wframe-larger-than]

Warnings:
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-15) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    lib/maple_tree.c:4203:20: warning: stack frame size (1084) exceeds limi=
t (1024) in 'mas_wr_modify' [-Wframe-larger-than]
    1 warning generated.

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-15) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
am200epdkit_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    include/linux/bitmap.h:261:2: warning: =E2=80=98memcpy=E2=80=99 forming=
 offset [4, 7] is out of the bounds [0, 4] of object =E2=80=98flags=E2=80=
=99 with type =E2=80=98long unsigned int[1]=E2=80=99 [-Warray-bounds]

---------------------------------------------------------------------------=
-----
ar7_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()

---------------------------------------------------------------------------=
-----
aspeed_g4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, clang-15) =E2=80=94 PASS, 0 errors, 10 warnings, =
0 section mismatches

Warnings:
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
assabet_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()

---------------------------------------------------------------------------=
-----
ath25_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
ath79_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
axm55xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
axs103_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
axs103_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
badge4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    include/linux/bitmap.h:261:2: warning: =E2=80=98memcpy=E2=80=99 forming=
 offset [4, 7] is out of the bounds [0, 4] of object =E2=80=98flags=E2=80=
=99 with type =E2=80=98long unsigned int[1]=E2=80=99 [-Warray-bounds]

Section mismatches:
    WARNING: modpost: drivers/net/phy/libphy.o(___ksymtab_gpl+mdio_bus_init=
+0x0): Section mismatch in reference from the variable __ksymtab_mdio_bus_i=
nit to the function .init.text:mdio_bus_init()

---------------------------------------------------------------------------=
-----
bcm2835_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    include/linux/bitmap.h:261:2: warning: =E2=80=98memcpy=E2=80=99 forming=
 offset [20, 23] is out of the bounds [0, 20] [-Warray-bounds]
    include/linux/bitmap.h:261:2: warning: =E2=80=98memcpy=E2=80=99 forming=
 offset [4, 7] is out of the bounds [0, 4] of object =E2=80=98flags=E2=80=
=99 with type =E2=80=98long unsigned int[1]=E2=80=99 [-Warray-bounds]

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()

---------------------------------------------------------------------------=
-----
bcm47xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()

---------------------------------------------------------------------------=
-----
bcm63xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
bigsur_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
bmips_be_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
bmips_stb_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()

---------------------------------------------------------------------------=
-----
capcella_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()
    WARNING: modpost: drivers/net/phy/libphy.o(___ksymtab_gpl+mdio_bus_init=
+0x0): Section mismatch in reference from the variable __ksymtab_mdio_bus_i=
nit to the function .init.text:mdio_bus_init()

---------------------------------------------------------------------------=
-----
cavium_octeon_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()

---------------------------------------------------------------------------=
-----
cerfcube_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    include/linux/bitmap.h:261:2: warning: =E2=80=98memcpy=E2=80=99 forming=
 offset [4, 7] is out of the bounds [0, 4] of object =E2=80=98flags=E2=80=
=99 with type =E2=80=98long unsigned int[1]=E2=80=99 [-Warray-bounds]

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
colibri_pxa300_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()

---------------------------------------------------------------------------=
-----
corgi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    include/linux/bitmap.h:261:2: warning: =E2=80=98memcpy=E2=80=99 forming=
 offset [4, 7] is out of the bounds [0, 4] of object =E2=80=98flags=E2=80=
=99 with type =E2=80=98long unsigned int[1]=E2=80=99 [-Warray-bounds]

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()
    WARNING: modpost: drivers/net/phy/libphy.o(___ksymtab_gpl+mdio_bus_init=
+0x0): Section mismatch in reference from the variable __ksymtab_mdio_bus_i=
nit to the function .init.text:mdio_bus_init()

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config (arm64, clang-13=
) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section mismatches

Errors:
    ERROR: modpost: Section mismatches detected.

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chromebook=
 (arm64, clang-13) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section mismatches

Errors:
    ERROR: modpost: Section mismatches detected.

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.config+arm64-chromeb=
ook (arm64, clang-13) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section mismat=
ches

Errors:
    ERROR: modpost: Section mismatches detected.

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-qualcomm.flavour.config+arm64-chromeb=
ook (arm64, clang-13) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section mismat=
ches

Errors:
    ERROR: modpost: Section mismatches detected.

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.config+arm64-chrom=
ebook (arm64, clang-13) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section mism=
atches

Errors:
    ERROR: modpost: Section mismatches detected.

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (arm, clang-13) =
=E2=80=94 FAIL, 1 error, 5 warnings, 0 section mismatches

Errors:
    lib/maple_tree.c:4203:20: error: stack frame size (1096) exceeds limit =
(1024) in function 'mas_wr_modify' [-Werror,-Wframe-larger-than]

Warnings:
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (arm, clang-1=
3) =E2=80=94 FAIL, 1 error, 5 warnings, 0 section mismatches

Errors:
    lib/maple_tree.c:4203:20: error: stack frame size (1096) exceeds limit =
(1024) in function 'mas_wr_modify' [-Werror,-Wframe-larger-than]

Warnings:
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-amd-stoneyridge.flavour.config+x86-chr=
omebook (x86_64, clang-13) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mi=
smatches

Errors:
    drivers/misc/cardreader/rts5261.c:406:13: error: variable 'setting_reg2=
' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometim=
es-uninitialized]

Warnings:
    drivers/misc/cardreader/rts5261.c:364:32: note: initialize the variable=
 'setting_reg2' to silence this warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-intel-denverton.flavour.config+x86-chr=
omebook (x86_64, clang-13) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section m=
ismatches

Errors:
    ERROR: modpost: Section mismatches detected.

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-intel-pineview.flavour.config+x86-chro=
mebook (x86_64, clang-13) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mis=
matches

Errors:
    drivers/misc/cardreader/rts5261.c:406:13: error: variable 'setting_reg2=
' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometim=
es-uninitialized]

Warnings:
    drivers/misc/cardreader/rts5261.c:364:32: note: initialize the variable=
 'setting_reg2' to silence this warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config (x86_64, clang=
-13) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section mismatches

Errors:
    ERROR: modpost: Section mismatches detected.

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config+x86-chromebook=
 (x86_64, clang-13) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section mismatch=
es

Errors:
    ERROR: modpost: Section mismatches detected.

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
cu1000-neo_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()

---------------------------------------------------------------------------=
-----
cu1830-neo_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    include/linux/bitmap.h:261:2: warning: =E2=80=98memcpy=E2=80=99 forming=
 offset [4, 7] is out of the bounds [0, 4] of object =E2=80=98flags=E2=80=
=99 with type =E2=80=98long unsigned int[1]=E2=80=99 [-Warray-bounds]

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-10) =E2=80=94 FAIL, 0 errors, 0 warnings=
, 0 section mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-15) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+xen_xlate_map_ballooned_page=
s+0x0): Section mismatch in reference from the variable __ksymtab_xen_xlate=
_map_ballooned_pages to the function .init.text:xen_xlate_map_ballooned_pag=
es()
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_16K_PAGES=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 0 warnings, 0 section mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+xen_xlate_map_ballooned_page=
s+0x0): Section mismatch in reference from the variable __ksymtab_xen_xlate=
_map_ballooned_pages to the function .init.text:xen_xlate_map_ballooned_pag=
es()
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-15) =E2=80=94 PASS, 0 er=
rors, 0 warnings, 0 section mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+xen_xlate_map_ballooned_page=
s+0x0): Section mismatch in reference from the variable __ksymtab_xen_xlate=
_map_ballooned_pages to the function .init.text:xen_xlate_map_ballooned_pag=
es()
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 error=
s, 0 warnings, 0 section mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+xen_xlate_map_ballooned_page=
s+0x0): Section mismatch in reference from the variable __ksymtab_xen_xlate=
_map_ballooned_pages to the function .init.text:xen_xlate_map_ballooned_pag=
es()
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_EFI=3Dn (riscv, clang-15) =E2=80=94 FAIL, 30 errors, 0 war=
nings, 0 section mismatches

Errors:
    arch/riscv/include/asm/tlbflush.h:23:2: error: expected assembly-time a=
bsolute expression
    arch/riscv/include/asm/tlbflush.h:23:2: error: expected assembly-time a=
bsolute expression
    arch/riscv/include/asm/tlbflush.h:23:2: error: expected assembly-time a=
bsolute expression
    arch/riscv/include/asm/tlbflush.h:23:2: error: expected assembly-time a=
bsolute expression
    arch/riscv/include/asm/tlbflush.h:23:2: error: expected assembly-time a=
bsolute expression
    arch/riscv/include/asm/tlbflush.h:23:2: error: expected assembly-time a=
bsolute expression
    arch/riscv/include/asm/tlbflush.h:23:2: error: expected assembly-time a=
bsolute expression
    arch/riscv/include/asm/tlbflush.h:23:2: error: expected assembly-time a=
bsolute expression
    arch/riscv/include/asm/tlbflush.h:23:2: error: expected assembly-time a=
bsolute expression
    arch/riscv/include/asm/tlbflush.h:23:2: error: expected assembly-time a=
bsolute expression
    arch/riscv/include/asm/tlbflush.h:23:2: error: expected assembly-time a=
bsolute expression
    arch/riscv/include/asm/tlbflush.h:23:2: error: expected assembly-time a=
bsolute expression
    arch/riscv/include/asm/tlbflush.h:23:2: error: expected assembly-time a=
bsolute expression
    arch/riscv/include/asm/tlbflush.h:23:2: error: expected assembly-time a=
bsolute expression
    arch/riscv/include/asm/tlbflush.h:23:2: error: expected assembly-time a=
bsolute expression
    arch/riscv/include/asm/tlbflush.h:23:2: error: expected assembly-time a=
bsolute expression
    arch/riscv/include/asm/tlbflush.h:23:2: error: expected assembly-time a=
bsolute expression
    arch/riscv/include/asm/tlbflush.h:23:2: error: expected assembly-time a=
bsolute expression
    arch/riscv/include/asm/tlbflush.h:23:2: error: expected assembly-time a=
bsolute expression
    fatal error: too many errors emitted, stopping now [-ferror-limit=3D]
    arch/riscv/include/asm/pgtable-64.h:121:2: error: expected assembly-tim=
e absolute expression
    arch/riscv/include/asm/pgtable-64.h:121:2: error: expected assembly-tim=
e absolute expression
    arch/riscv/include/asm/pgtable-64.h:105:2: error: expected assembly-tim=
e absolute expression
    arch/riscv/include/asm/pgtable-64.h:105:2: error: expected assembly-tim=
e absolute expression
    arch/riscv/include/asm/pgtable-64.h:121:2: error: expected assembly-tim=
e absolute expression
    arch/riscv/include/asm/pgtable-64.h:121:2: error: expected assembly-tim=
e absolute expression
    arch/riscv/include/asm/pgtable-64.h:105:2: error: expected assembly-tim=
e absolute expression
    arch/riscv/include/asm/pgtable-64.h:105:2: error: expected assembly-tim=
e absolute expression
    arch/riscv/include/asm/pgtable-64.h:121:2: error: expected assembly-tim=
e absolute expression
    arch/riscv/include/asm/pgtable-64.h:121:2: error: expected assembly-tim=
e absolute expression

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 error=
s, 0 warnings, 0 section mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+xen_xlate_map_ballooned_page=
s+0x0): Section mismatch in reference from the variable __ksymtab_xen_xlate=
_map_ballooned_pages to the function .init.text:xen_xlate_map_ballooned_pag=
es()
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+xen_xlate_map_ballooned_page=
s+0x0): Section mismatch in reference from the variable __ksymtab_xen_xlate=
_map_ballooned_pages to the function .init.text:xen_xlate_map_ballooned_pag=
es()
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook+kselftest (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 0 warnings, 0 section mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+xen_xlate_map_ballooned_page=
s+0x0): Section mismatch in reference from the variable __ksymtab_xen_xlate=
_map_ballooned_pages to the function .init.text:xen_xlate_map_ballooned_pag=
es()
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
defconfig+crypto (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+xen_xlate_map_ballooned_page=
s+0x0): Section mismatch in reference from the variable __ksymtab_xen_xlate=
_map_ballooned_pages to the function .init.text:xen_xlate_map_ballooned_pag=
es()
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()

---------------------------------------------------------------------------=
-----
defconfig+debug (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()

---------------------------------------------------------------------------=
-----
defconfig+debug (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+xen_xlate_map_ballooned_page=
s+0x0): Section mismatch in reference from the variable __ksymtab_xen_xlate=
_map_ballooned_pages to the function .init.text:xen_xlate_map_ballooned_pag=
es()
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()

---------------------------------------------------------------------------=
-----
defconfig+ima (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+xen_xlate_map_ballooned_page=
s+0x0): Section mismatch in reference from the variable __ksymtab_xen_xlate=
_map_ballooned_pages to the function .init.text:xen_xlate_map_ballooned_pag=
es()
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+xen_xlate_map_ballooned_page=
s+0x0): Section mismatch in reference from the variable __ksymtab_xen_xlate=
_map_ballooned_pages to the function .init.text:xen_xlate_map_ballooned_pag=
es()
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
e55_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
eseries_pxa_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    include/linux/bitmap.h:261:2: warning: =E2=80=98memcpy=E2=80=99 forming=
 offset [4, 7] is out of the bounds [0, 4] of object =E2=80=98flags=E2=80=
=99 with type =E2=80=98long unsigned int[1]=E2=80=99 [-Warray-bounds]

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
ezx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    include/linux/bitmap.h:261:2: warning: =E2=80=98memcpy=E2=80=99 forming=
 offset [4, 7] is out of the bounds [0, 4] of object =E2=80=98flags=E2=80=
=99 with type =E2=80=98long unsigned int[1]=E2=80=99 [-Warray-bounds]

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

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
gpr_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()

---------------------------------------------------------------------------=
-----
h3600_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
h5000_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
hackkit_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig+debug (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warni=
ngs, 0 section mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig+kselftest (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 w=
arnings, 0 section mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
hisi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
hsdk_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, clang-15) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
i386_defconfig+debug (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
i386_defconfig+kselftest (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    include/linux/bitmap.h:261:2: warning: =E2=80=98memcpy=E2=80=99 forming=
 offset [4, 7] is out of the bounds [0, 4] of object =E2=80=98flags=E2=80=
=99 with type =E2=80=98long unsigned int[1]=E2=80=99 [-Warray-bounds]

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()

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
ip22_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()
    WARNING: modpost: drivers/net/phy/libphy.o(___ksymtab_gpl+mdio_bus_init=
+0x0): Section mismatch in reference from the variable __ksymtab_mdio_bus_i=
nit to the function .init.text:mdio_bus_init()

---------------------------------------------------------------------------=
-----
ip27_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
ip28_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
ip32_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
lart_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
lemote2f_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 0 warnings, 0 se=
ction mismatches

Errors:
    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=80=
=98-mhard-float=E2=80=99

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
loongson1b_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()

---------------------------------------------------------------------------=
-----
loongson2k_defconfig (mips, gcc-10) =E2=80=94 FAIL, 1 error, 1 warning, 0 s=
ection mismatches

Errors:
    drivers/irqchip/irq-loongson-liointc.c:60:13: error: implicit declarati=
on of function =E2=80=98cpu_logical_map=E2=80=99 [-Werror=3Dimplicit-functi=
on-declaration]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
loongson3_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 0 warnings, 0 s=
ection mismatches

Errors:
    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=80=
=98-mhard-float=E2=80=99

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab+prom_init_numa_memory+0x0): Sect=
ion mismatch in reference from the variable __ksymtab_prom_init_numa_memory=
 to the function .init.text:prom_init_numa_memory()
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
lpc18xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
lpc32xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()

---------------------------------------------------------------------------=
-----
lpd270_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
lubbock_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
magician_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    include/linux/bitmap.h:261:2: warning: =E2=80=98memcpy=E2=80=99 forming=
 offset [4, 7] is out of the bounds [0, 4] of object =E2=80=98flags=E2=80=
=99 with type =E2=80=98long unsigned int[1]=E2=80=99 [-Warray-bounds]

---------------------------------------------------------------------------=
-----
mainstone_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
malta_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()
    WARNING: modpost: drivers/net/phy/libphy.o(___ksymtab_gpl+mdio_bus_init=
+0x0): Section mismatch in reference from the variable __ksymtab_mdio_bus_i=
nit to the function .init.text:mdio_bus_init()

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()
    WARNING: modpost: drivers/net/phy/libphy.o(___ksymtab_gpl+mdio_bus_init=
+0x0): Section mismatch in reference from the variable __ksymtab_mdio_bus_i=
nit to the function .init.text:mdio_bus_init()

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnin=
gs, 0 section mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
maltaaprp_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
maltasmvp_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
maltasmvp_eva_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
maltaup_xpa_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()
    WARNING: modpost: drivers/net/phy/libphy.o(___ksymtab_gpl+mdio_bus_init=
+0x0): Section mismatch in reference from the variable __ksymtab_mdio_bus_i=
nit to the function .init.text:mdio_bus_init()

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
mini2440_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    include/linux/bitmap.h:261:2: warning: =E2=80=98memcpy=E2=80=99 forming=
 offset [4, 7] is out of the bounds [0, 4] of object =E2=80=98flags=E2=80=
=99 with type =E2=80=98long unsigned int[1]=E2=80=99 [-Warray-bounds]

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
mpc30x_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
mps2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
mtx1_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()
    WARNING: modpost: drivers/net/phy/libphy.o(___ksymtab_gpl+mdio_bus_init=
+0x0): Section mismatch in reference from the variable __ksymtab_mdio_bus_i=
nit to the function .init.text:mdio_bus_init()

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-15) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    lib/maple_tree.c:4203:20: warning: stack frame size (1088) exceeds limi=
t (1024) in 'mas_wr_modify' [-Wframe-larger-than]
    1 warning generated.

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    include/linux/bitmap.h:261:2: warning: =E2=80=98memcpy=E2=80=99 forming=
 offset [4, 7] is out of the bounds [0, 4] of object =E2=80=98flags=E2=80=
=99 with type =E2=80=98long unsigned int[1]=E2=80=99 [-Warray-bounds]

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-15) =E2=80=94 PASS, 0 errors, 12 warnings, 0=
 section mismatches

Warnings:
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    lib/maple_tree.c:4203:20: warning: stack frame size (1096) exceeds limi=
t (1024) in 'mas_wr_modify' [-Wframe-larger-than]
    1 warning generated.
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-10) =E2=80=94 PASS, =
0 errors, 0 warnings, 0 section mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1=
 warning, 0 section mismatches

Warnings:
    include/linux/bitmap.h:261:2: warning: =E2=80=98memcpy=E2=80=99 forming=
 offset [4, 7] is out of the bounds [0, 4] of object =E2=80=98flags=E2=80=
=99 with type =E2=80=98long unsigned int[1]=E2=80=99 [-Warray-bounds]

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy (arm, gcc-10) =E2=80=94 PASS, 0=
 errors, 1 warning, 0 section mismatches

Warnings:
    include/linux/bitmap.h:261:2: warning: =E2=80=98memcpy=E2=80=99 forming=
 offset [4, 7] is out of the bounds [0, 4] of object =E2=80=98flags=E2=80=
=99 with type =E2=80=98long unsigned int[1]=E2=80=99 [-Warray-bounds]

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+debug (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning,=
 0 section mismatches

Warnings:
    include/linux/bitmap.h:261:2: warning: =E2=80=98memcpy=E2=80=99 forming=
 offset [4, 7] is out of the bounds [0, 4] of object =E2=80=98flags=E2=80=
=99 with type =E2=80=98long unsigned int[1]=E2=80=99 [-Warray-bounds]

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warn=
ings, 0 section mismatches

Warnings:
    include/linux/fortify-string.h:344:4: warning: call to =E2=80=98__write=
_overflow_field=E2=80=99 declared with attribute warning: detected write be=
yond size of field (1st parameter); maybe use struct_group()? [-Wattribute-=
warning]
    include/linux/fortify-string.h:344:4: warning: call to =E2=80=98__write=
_overflow_field=E2=80=99 declared with attribute warning: detected write be=
yond size of field (1st parameter); maybe use struct_group()? [-Wattribute-=
warning]

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    include/linux/bitmap.h:261:2: warning: =E2=80=98memcpy=E2=80=99 forming=
 offset [4, 7] is out of the bounds [0, 4] of object =E2=80=98flags=E2=80=
=99 with type =E2=80=98long unsigned int[1]=E2=80=99 [-Warray-bounds]

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()

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
nhk8815_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    include/linux/bitmap.h:261:2: warning: =E2=80=98memcpy=E2=80=99 forming=
 offset [4, 7] is out of the bounds [0, 4] of object =E2=80=98flags=E2=80=
=99 with type =E2=80=98long unsigned int[1]=E2=80=99 [-Warray-bounds]

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
nommu_k210_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_sdcard_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 war=
nings, 0 section mismatches

---------------------------------------------------------------------------=
-----
nsimosci_hs_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
nsimosci_hs_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
omap2plus_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    include/linux/bitmap.h:261:2: warning: =E2=80=98memcpy=E2=80=99 forming=
 offset [4, 7] is out of the bounds [0, 4] of object =E2=80=98flags=E2=80=
=99 with type =E2=80=98long unsigned int[1]=E2=80=99 [-Warray-bounds]

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
omega2p_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()

---------------------------------------------------------------------------=
-----
palmz72_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
pcm027_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
pic32mzda_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
pleb_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
pxa255-idp_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

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
pxa_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    include/linux/bitmap.h:261:2: warning: =E2=80=98memcpy=E2=80=99 forming=
 offset [4, 7] is out of the bounds [0, 4] of object =E2=80=98flags=E2=80=
=99 with type =E2=80=98long unsigned int[1]=E2=80=99 [-Warray-bounds]

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    include/linux/bitmap.h:261:2: warning: =E2=80=98memcpy=E2=80=99 forming=
 offset [4, 7] is out of the bounds [0, 4] of object =E2=80=98flags=E2=80=
=99 with type =E2=80=98long unsigned int[1]=E2=80=99 [-Warray-bounds]

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
rb532_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    cc1: warning: result of =E2=80=98-117440512 << 16=E2=80=99 requires 44 =
bits to represent, but =E2=80=98int=E2=80=99 only has 32 bits [-Wshift-over=
flow=3D]

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()
    WARNING: modpost: drivers/net/phy/libphy.o(___ksymtab_gpl+mdio_bus_init=
+0x0): Section mismatch in reference from the variable __ksymtab_mdio_bus_i=
nit to the function .init.text:mdio_bus_init()

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, gcc-10) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 section=
 mismatches

Errors:
    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=3D0x'
    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=3D0x'

---------------------------------------------------------------------------=
-----
rs90_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
rt305x_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()

---------------------------------------------------------------------------=
-----
rv32_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    include/linux/bitmap.h:261:2: warning: =E2=80=98memcpy=E2=80=99 forming=
 offset [4, 7] is out of the bounds [0, 4] of object =E2=80=98flags=E2=80=
=99 with type =E2=80=98long unsigned int[1]=E2=80=99 [-Warray-bounds]

---------------------------------------------------------------------------=
-----
sama7_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 1 warning, 0 section=
 mismatches

Errors:
    ERROR: modpost: Section mismatches detected.

Warnings:
    include/linux/bitmap.h:261:2: warning: =E2=80=98memcpy=E2=80=99 forming=
 offset [4, 7] is out of the bounds [0, 4] of object =E2=80=98flags=E2=80=
=99 with type =E2=80=98long unsigned int[1]=E2=80=99 [-Warray-bounds]

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()

---------------------------------------------------------------------------=
-----
sb1250_swarm_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
shannon_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
simpad_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    include/linux/bitmap.h:261:2: warning: =E2=80=98memcpy=E2=80=99 forming=
 offset [4, 7] is out of the bounds [0, 4] of object =E2=80=98flags=E2=80=
=99 with type =E2=80=98long unsigned int[1]=E2=80=99 [-Warray-bounds]

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()

---------------------------------------------------------------------------=
-----
spear3xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    include/linux/bitmap.h:261:2: warning: =E2=80=98memcpy=E2=80=99 forming=
 offset [4, 7] is out of the bounds [0, 4] of object =E2=80=98flags=E2=80=
=99 with type =E2=80=98long unsigned int[1]=E2=80=99 [-Warray-bounds]

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()
    WARNING: modpost: drivers/net/phy/libphy.o(___ksymtab_gpl+mdio_bus_init=
+0x0): Section mismatch in reference from the variable __ksymtab_mdio_bus_i=
nit to the function .init.text:mdio_bus_init()

---------------------------------------------------------------------------=
-----
stm32_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()

---------------------------------------------------------------------------=
-----
tb0219_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()

---------------------------------------------------------------------------=
-----
tct_hammer_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    include/linux/bitmap.h:261:2: warning: =E2=80=98memcpy=E2=80=99 forming=
 offset [4, 7] is out of the bounds [0, 4] of object =E2=80=98flags=E2=80=
=99 with type =E2=80=98long unsigned int[1]=E2=80=99 [-Warray-bounds]

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
tinyconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
trizeps4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    include/linux/bitmap.h:261:2: warning: =E2=80=98memcpy=E2=80=99 forming=
 offset [4, 7] is out of the bounds [0, 4] of object =E2=80=98flags=E2=80=
=99 with type =E2=80=98long unsigned int[1]=E2=80=99 [-Warray-bounds]

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    include/linux/bitmap.h:261:2: warning: =E2=80=98memcpy=E2=80=99 forming=
 offset [4, 7] is out of the bounds [0, 4] of object =E2=80=98flags=E2=80=
=99 with type =E2=80=98long unsigned int[1]=E2=80=99 [-Warray-bounds]

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()

---------------------------------------------------------------------------=
-----
vdk_hs38_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
versatile_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
viper_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    include/linux/bitmap.h:261:2: warning: =E2=80=98memcpy=E2=80=99 forming=
 offset [4, 7] is out of the bounds [0, 4] of object =E2=80=98flags=E2=80=
=99 with type =E2=80=98long unsigned int[1]=E2=80=99 [-Warray-bounds]

Section mismatches:
    WARNING: modpost: drivers/net/phy/libphy.o(___ksymtab_gpl+mdio_bus_init=
+0x0): Section mismatch in reference from the variable __ksymtab_mdio_bus_i=
nit to the function .init.text:mdio_bus_init()

---------------------------------------------------------------------------=
-----
vocore2_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
workpad_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, clang-15) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
x86_64_defconfig+amdgpu (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnin=
gs, 0 section mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
x86_64_defconfig+debug (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
x86_64_defconfig+ima (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 war=
nings, 0 section mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, =
0 warnings, 0 section mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook+kselftest (x86_64, gcc-10) =E2=80=94 PASS, =
0 errors, 0 warnings, 0 section mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86_kvm_guest (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0=
 warnings, 0 section mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab_gpl+mdio_bus_init+0x0): Section =
mismatch in reference from the variable __ksymtab_mdio_bus_init to the func=
tion .init.text:mdio_bus_init()
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
xcep_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(___ksymtab+xfrm4_protocol_init+0x0): Sectio=
n mismatch in reference from the variable __ksymtab_xfrm4_protocol_init to =
the function .init.text:xfrm4_protocol_init()

---------------------------------------------------------------------------=
-----
zeus_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    include/linux/bitmap.h:261:2: warning: =E2=80=98memcpy=E2=80=99 forming=
 offset [4, 7] is out of the bounds [0, 4] of object =E2=80=98flags=E2=80=
=99 with type =E2=80=98long unsigned int[1]=E2=80=99 [-Warray-bounds]

---
For more info write to <info@kernelci.org>
