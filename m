Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571547C
	for <llvm@lists.linux.dev>; Fri,  4 Mar 2022 22:25:49 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id 27so8592887pgk.10
        for <llvm@lists.linux.dev>; Fri, 04 Mar 2022 14:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=F6kiUcCF5ZokNcha9cIJiJqJQt2QP520m+O6ZjlrnAQ=;
        b=AITxbPmm36Rg6KHetVuNeXsFUAOrtLDej1o+R65MvLFywtul9mtrahjl/d+/CBGEam
         Kzt9aJgFS6Pu35ww9rxSKOh6DXbQ+l9LlYECgr/Gs5KWmH67Hxm71tWt9bpF8BmPJZeE
         ip6sFIpEqFYEvlvl1Zvh5lf8HLr7J2jnjC9kzUuKPHQdQhrLC7C5Sp+kZP0QCuulJL1n
         x30yOMHtfAkomdgq4f1zASCacmaGFTAfDsMjgvq7gSZEKce5RaOSjRPjBiqylyvkL8jk
         Wy4jYY1E5QY5Qk3KjehuTavqDk/nnXC0JyJRSao/dLaWugcqTLHbU5iaarmBnpJjGn1d
         +n9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=F6kiUcCF5ZokNcha9cIJiJqJQt2QP520m+O6ZjlrnAQ=;
        b=N+gHgSie++93VxQnBIGzkPNOVHZeq6cgqQ0h1ieTyz7WaSiKZcNU0t7h6a6XJcJrIS
         6KaJZxoHOO13hd0yQpF8jgo1MPKFz/s051TTVFZads1L2IBE1g7eMH2bgpKnFlxMq88N
         EXkClIc2Z9KsKl3xkDTyfI6nOqp3P8oBZ61nwKybwGKC7/+nbtapaWgiJfb2NQUPrIlz
         CD+4Ewe8CBP1Ep+Ma84SVngoRaDVmIAvk/HSGrHt31dKknWs/sVtn0ys/mlcP4qt1lxh
         RH+sq3G9C3gqoJx/6BX9VuRXkqs2Y/altI6Vxsqh4Gg6lCS26pFp2gnYnEOTa9JAiR6i
         bCVQ==
X-Gm-Message-State: AOAM533A1YKBNmnwlBTmTs062GR6lQdEgscfUxJMLWZBQiF4ZPX+kgBO
	buOGh/oCNVW/3zfxaG7aiP3DczxhiCRbrFNzcs8=
X-Google-Smtp-Source: ABdhPJyF4uGW/6k0aWOhkoDbVHhuWK8SBMHc9SuPoMQg0fns86AKcKi/4LfIvWQmMbHUV6u9PJCBGA==
X-Received: by 2002:a05:6a00:8cc:b0:4bc:3def:b616 with SMTP id s12-20020a056a0008cc00b004bc3defb616mr632089pfu.18.1646432746409;
        Fri, 04 Mar 2022 14:25:46 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id k20-20020a056a00135400b004ecc81067b8sm7435217pfu.144.2022.03.04.14.25.45
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 14:25:45 -0800 (PST)
Message-ID: <622291e9.1c69fb81.aac4f.420f@mx.google.com>
Date: Fri, 04 Mar 2022 14:25:45 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20220304
Subject: next/master build: 181 builds: 11 failed, 170 passed, 29 errors,
 273 warnings (next-20220304)
To: llvm@lists.linux.dev
From: "kernelci.org bot" <bot@kernelci.org>

next/master build: 181 builds: 11 failed, 170 passed, 29 errors, 273 warnin=
gs (next-20220304)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20220304/

Tree: next
Branch: master
Git Describe: next-20220304
Git Commit: 6d284ba80c0c485bcaa7bdf67f232d572640edc4
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm64:
    allmodconfig: (clang-14) FAIL
    allmodconfig: (gcc-10) FAIL

arm:
    allmodconfig: (clang-14) FAIL
    imote2_defconfig: (gcc-10) FAIL
    qcom_defconfig: (gcc-10) FAIL
    rpc_defconfig: (gcc-10) FAIL

i386:
    allmodconfig: (clang-14) FAIL

mips:
    decstation_64_defconfig: (gcc-10) FAIL
    loongson3_defconfig: (gcc-10) FAIL

x86_64:
    allmodconfig: (clang-14) FAIL
    allmodconfig: (gcc-10) FAIL

Errors and Warnings Detected:

arc:
    tinyconfig (gcc-10): 2 warnings

arm64:
    allmodconfig (gcc-10): 1 error, 1 warning
    allmodconfig (clang-14): 1 error
    defconfig (clang-14): 3 warnings

arm:
    allmodconfig (clang-14): 4 errors, 15 warnings
    am200epdkit_defconfig (gcc-10): 4 warnings
    aspeed_g4_defconfig (gcc-10): 4 warnings
    aspeed_g5_defconfig (clang-14): 10 warnings
    assabet_defconfig (gcc-10): 4 warnings
    axm55xx_defconfig (gcc-10): 4 warnings
    cerfcube_defconfig (gcc-10): 4 warnings
    cm_x300_defconfig (gcc-10): 4 warnings
    colibri_pxa270_defconfig (gcc-10): 4 warnings
    colibri_pxa300_defconfig (gcc-10): 4 warnings
    corgi_defconfig (gcc-10): 4 warnings
    dove_defconfig (gcc-10): 4 warnings
    eseries_pxa_defconfig (gcc-10): 4 warnings
    h3600_defconfig (gcc-10): 4 warnings
    h5000_defconfig (gcc-10): 4 warnings
    hackkit_defconfig (gcc-10): 4 warnings
    hisi_defconfig (gcc-10): 4 warnings
    imote2_defconfig (gcc-10): 4 warnings
    ixp4xx_defconfig (gcc-10): 4 warnings
    jornada720_defconfig (gcc-10): 4 warnings
    lart_defconfig (gcc-10): 4 warnings
    lpc18xx_defconfig (gcc-10): 1 warning
    lpc32xx_defconfig (gcc-10): 4 warnings
    lpd270_defconfig (gcc-10): 4 warnings
    lubbock_defconfig (gcc-10): 4 warnings
    magician_defconfig (gcc-10): 4 warnings
    mmp2_defconfig (gcc-10): 4 warnings
    moxart_defconfig (gcc-10): 4 warnings
    mps2_defconfig (gcc-10): 1 warning
    multi_v7_defconfig (clang-14): 13 warnings
    mvebu_v5_defconfig (gcc-10): 4 warnings
    mvebu_v7_defconfig (gcc-10): 4 warnings
    neponset_defconfig (gcc-10): 4 warnings
    netwinder_defconfig (gcc-10): 4 warnings
    orion5x_defconfig (gcc-10): 4 warnings
    palmz72_defconfig (gcc-10): 4 warnings
    pcm027_defconfig (gcc-10): 4 warnings
    pleb_defconfig (gcc-10): 4 warnings
    pxa255-idp_defconfig (gcc-10): 4 warnings
    pxa910_defconfig (gcc-10): 4 warnings
    pxa_defconfig (gcc-10): 4 warnings
    qcom_defconfig (gcc-10): 4 errors
    rpc_defconfig (gcc-10): 2 errors
    s3c2410_defconfig (gcc-10): 4 warnings
    s3c6400_defconfig (gcc-10): 4 warnings
    sama5_defconfig (gcc-10): 4 warnings
    simpad_defconfig (gcc-10): 4 warnings
    socfpga_defconfig (gcc-10): 4 warnings
    spear13xx_defconfig (gcc-10): 4 warnings
    spear3xx_defconfig (gcc-10): 4 warnings
    spear6xx_defconfig (gcc-10): 4 warnings
    spitz_defconfig (gcc-10): 4 warnings
    stm32_defconfig (gcc-10): 1 warning
    tct_hammer_defconfig (gcc-10): 6 warnings
    trizeps4_defconfig (gcc-10): 4 warnings
    viper_defconfig (gcc-10): 4 warnings
    vt8500_v6_v7_defconfig (gcc-10): 4 warnings
    xcep_defconfig (gcc-10): 4 warnings
    zeus_defconfig (gcc-10): 4 warnings

i386:
    allmodconfig (clang-14): 5 errors
    tinyconfig (gcc-10): 2 warnings

mips:
    32r2el_defconfig+debug (gcc-10): 1 warning
    bcm47xx_defconfig (gcc-10): 1 warning
    ci20_defconfig (gcc-10): 1 warning
    fuloong2e_defconfig (gcc-10): 1 error
    gcw0_defconfig (gcc-10): 1 warning
    lemote2f_defconfig (gcc-10): 1 error
    loongson2k_defconfig (gcc-10): 1 error
    loongson3_defconfig (gcc-10): 2 errors

riscv:
    defconfig+CONFIG_EFI=3Dn (clang-14): 3 warnings
    nommu_k210_defconfig (gcc-10): 3 warnings
    nommu_k210_sdcard_defconfig (gcc-10): 3 warnings

x86_64:
    allmodconfig (gcc-10): 2 errors
    allmodconfig (clang-14): 5 errors, 1 warning
    tinyconfig (gcc-10): 2 warnings
    x86_64_defconfig+debug (gcc-10): 2 warnings

Errors summary:

    3    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=
=80=98-mhard-float=E2=80=99
    2    arch/x86/include/asm/kvm-x86-ops.h:90:1: error: pointer type misma=
tch ('u64 (*)(struct kvm_vcpu *, gfn_t, bool)' (aka 'unsigned long long (*)=
(struct kvm_vcpu *, unsigned long long, _Bool)') and 'void *') [-Werror,-Wp=
ointer-type-mismatch]
    2    arch/x86/include/asm/kvm-x86-ops.h:89:1: error: pointer type misma=
tch ('int (*)(struct kvm *, u64)' (aka 'int (*)(struct kvm *, unsigned long=
 long)') and 'void *') [-Werror,-Wpointer-type-mismatch]
    2    arch/x86/include/asm/kvm-x86-ops.h:88:1: error: pointer type misma=
tch ('int (*)(struct kvm *, unsigned int)' and 'void *') [-Werror,-Wpointer=
-type-mismatch]
    2    arch/x86/include/asm/kvm-x86-ops.h:82:1: error: pointer type misma=
tch ('bool (*)(struct kvm_vcpu *)' (aka '_Bool (*)(struct kvm_vcpu *)') and=
 'void *') [-Werror,-Wpointer-type-mismatch]
    2    arch/x86/include/asm/kvm-x86-ops.h:108:1: error: pointer type mism=
atch ('bool (*)(struct kvm_vcpu *)' (aka '_Bool (*)(struct kvm_vcpu *)') an=
d 'void *') [-Werror,-Wpointer-type-mismatch]
    2    /usr/lib/gcc/x86_64-linux-gnu/10/plugin/include/config/i386/i386.h=
:2500:10: fatal error: common/config/i386/i386-cpuinfo.h: No such file or d=
irectory
    1    mips-linux-gnu-ld: (.init.text+0x1730): undefined reference to `no=
de_data'
    1    fs/netfs/io.c:630:6: error: variable 'ret' is used uninitialized w=
henever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
    1    drm_dp_mst_topology.c:(.text+0x870c): undefined reference to `drm_=
kms_helper_hotplug_event'
    1    drm_dp_mst_topology.c:(.text+0x7660): undefined reference to `drm_=
kms_helper_hotplug_event'
    1    drm_dp_mst_topology.c:(.text+0x2964): undefined reference to `drm_=
kms_helper_hotplug_event'
    1    drm_dp_mst_topology.c:(.text+0x1ffc): undefined reference to `__dr=
m_atomic_helper_private_obj_duplicate_state'
    1    drivers/gpu/drm/selftests/test-drm_plane_helper.c:76:5: error: sta=
ck frame size (1200) exceeds limit (1024) in 'igt_check_plane_state' [-Werr=
or,-Wframe-larger-than]
    1    drivers/gpu/drm/selftests/test-drm_mm.c:372:12: error: stack frame=
 size (1040) exceeds limit (1024) in '__igt_reserve' [-Werror,-Wframe-large=
r-than]
    1    drivers/clocksource/timer-imx-tpm.c:78:20: error: =E2=80=98tpm_rea=
d_sched_clock=E2=80=99 defined but not used [-Werror=3Dunused-function]
    1    drivers/clocksource/timer-imx-tpm.c:78:20: error: unused function =
'tpm_read_sched_clock' [-Werror,-Wunused-function]
    1    crypto/wp512.c:782:13: error: stack frame size (1168) exceeds limi=
t (1024) in 'wp512_process_buffer' [-Werror,-Wframe-larger-than]
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=
=3D0x'
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=
=3D0x'
    1    (.init.text+0x1714): undefined reference to `node_data'

Warnings summary:

    51   arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is ou=
tside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 =
[-Warray-bounds]
    51   arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is ou=
tside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 =
[-Warray-bounds]
    51   arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknow=
n> is outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=
=E2=80=99 [-Warray-bounds]
    51   arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknow=
n> is outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=
=E2=80=99 [-Warray-bounds]
    24   clang: warning: argument unused during compilation: '-march=3Darmv=
6k' [-Wunused-command-line-argument]
    10   clang: warning: argument unused during compilation: '-march=3Darmv=
7-a' [-Wunused-command-line-argument]
    5    fs/binfmt_flat.c:117:12: warning: =E2=80=98flat_core_dump=E2=80=99=
 defined but not used [-Wunused-function]
    3    kernel/sched/rt.c:3032:12: warning: =E2=80=98sched_rr_handler=E2=
=80=99 defined but not used [-Wunused-function]
    3    kernel/sched/rt.c:2993:12: warning: =E2=80=98sched_rt_handler=E2=
=80=99 defined but not used [-Wunused-function]
    3    fs/netfs/io.c:604:9: note: initialize the variable 'ret' to silenc=
e this warning
    3    1 warning generated.
    2    fs/netfs/io.c:630:6: warning: variable 'ret' is used uninitialized=
 whenever 'if' condition is false [-Wsometimes-uninitialized]
    2    drivers/i2c/busses/i2c-designware-platdrv.c:465:12: warning: =E2=
=80=98dw_i2c_plat_resume=E2=80=99 defined but not used [-Wunused-function]
    2    drivers/i2c/busses/i2c-designware-platdrv.c:444:12: warning: =E2=
=80=98dw_i2c_plat_suspend=E2=80=99 defined but not used [-Wunused-function]
    1    net/ipv6/ip6mr.c:1656:7: warning: unused variable =E2=80=98do_wrmi=
fwhole=E2=80=99 [-Wunused-variable]
    1    lib/strnlen_user.o: warning: objtool: strnlen_user()+0x59: call to=
 do_strnlen_user() with UACCESS enabled
    1    lib/strncpy_from_user.o: warning: objtool: strncpy_from_user()+0x8=
6: call to do_strncpy_from_user() with UACCESS enabled
    1    kernel/sched/rt.c:3032:12: warning: 'sched_rr_handler' defined but=
 not used [-Wunused-function]
    1    kernel/sched/rt.c:2993:12: warning: 'sched_rt_handler' defined but=
 not used [-Wunused-function]
    1    include/asm-generic/unaligned.h:14:8: warning: array subscript -1 =
is outside array bounds of =E2=80=98unsigned char[1]=E2=80=99 [-Warray-boun=
ds]
    1    drivers/gpu/drm/stm/ltdc.c:625:2: warning: variable 'val' is used =
uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
    1    drivers/gpu/drm/stm/ltdc.c:600:9: note: initialize the variable 'v=
al' to silence this warning
    1    cc1: all warnings being treated as errors
    1    arch/x86/kernel/head64.o: warning: objtool: __startup_64() falls t=
hrough to next function startup_64_setup_env()
    1    arch/mips/boot/dts/ingenic/jz4780.dtsi:513.33-515.6: Warning (unit=
_address_format): /nemc@13410000/efuse@d0/eth-mac-addr@0x22: unit name shou=
ld not have leading "0x"
    1    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_devic=
e_reg): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expec=
ted "0,0"

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

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
allmodconfig (x86_64, gcc-10) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 secti=
on mismatches

Errors:
    /usr/lib/gcc/x86_64-linux-gnu/10/plugin/include/config/i386/i386.h:2500=
:10: fatal error: common/config/i386/i386-cpuinfo.h: No such file or direct=
ory
    /usr/lib/gcc/x86_64-linux-gnu/10/plugin/include/config/i386/i386.h:2500=
:10: fatal error: common/config/i386/i386-cpuinfo.h: No such file or direct=
ory

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-10) =E2=80=94 FAIL, 1 error, 1 warning, 0 section =
mismatches

Errors:
    drivers/clocksource/timer-imx-tpm.c:78:20: error: =E2=80=98tpm_read_sch=
ed_clock=E2=80=99 defined but not used [-Werror=3Dunused-function]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-14) =E2=80=94 FAIL, 1 error, 0 warnings, 0 secti=
on mismatches

Errors:
    drivers/clocksource/timer-imx-tpm.c:78:20: error: unused function 'tpm_=
read_sched_clock' [-Werror,-Wunused-function]

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, clang-14) =E2=80=94 FAIL, 5 errors, 1 warning, 0 sect=
ion mismatches

Errors:
    arch/x86/include/asm/kvm-x86-ops.h:82:1: error: pointer type mismatch (=
'bool (*)(struct kvm_vcpu *)' (aka '_Bool (*)(struct kvm_vcpu *)') and 'voi=
d *') [-Werror,-Wpointer-type-mismatch]
    arch/x86/include/asm/kvm-x86-ops.h:88:1: error: pointer type mismatch (=
'int (*)(struct kvm *, unsigned int)' and 'void *') [-Werror,-Wpointer-type=
-mismatch]
    arch/x86/include/asm/kvm-x86-ops.h:89:1: error: pointer type mismatch (=
'int (*)(struct kvm *, u64)' (aka 'int (*)(struct kvm *, unsigned long long=
)') and 'void *') [-Werror,-Wpointer-type-mismatch]
    arch/x86/include/asm/kvm-x86-ops.h:90:1: error: pointer type mismatch (=
'u64 (*)(struct kvm_vcpu *, gfn_t, bool)' (aka 'unsigned long long (*)(stru=
ct kvm_vcpu *, unsigned long long, _Bool)') and 'void *') [-Werror,-Wpointe=
r-type-mismatch]
    arch/x86/include/asm/kvm-x86-ops.h:108:1: error: pointer type mismatch =
('bool (*)(struct kvm_vcpu *)' (aka '_Bool (*)(struct kvm_vcpu *)') and 'vo=
id *') [-Werror,-Wpointer-type-mismatch]

Warnings:
    arch/x86/kernel/head64.o: warning: objtool: __startup_64() falls throug=
h to next function startup_64_setup_env()

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-14) =E2=80=94 FAIL, 4 errors, 15 warnings, 0 secti=
on mismatches

Errors:
    crypto/wp512.c:782:13: error: stack frame size (1168) exceeds limit (10=
24) in 'wp512_process_buffer' [-Werror,-Wframe-larger-than]
    fs/netfs/io.c:630:6: error: variable 'ret' is used uninitialized whenev=
er 'if' condition is false [-Werror,-Wsometimes-uninitialized]
    drivers/gpu/drm/selftests/test-drm_plane_helper.c:76:5: error: stack fr=
ame size (1200) exceeds limit (1024) in 'igt_check_plane_state' [-Werror,-W=
frame-larger-than]
    drivers/gpu/drm/selftests/test-drm_mm.c:372:12: error: stack frame size=
 (1040) exceeds limit (1024) in '__igt_reserve' [-Werror,-Wframe-larger-tha=
n]

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
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    fs/netfs/io.c:604:9: note: initialize the variable 'ret' to silence thi=
s warning

---------------------------------------------------------------------------=
-----
allmodconfig (i386, clang-14) =E2=80=94 FAIL, 5 errors, 0 warnings, 0 secti=
on mismatches

Errors:
    arch/x86/include/asm/kvm-x86-ops.h:82:1: error: pointer type mismatch (=
'bool (*)(struct kvm_vcpu *)' (aka '_Bool (*)(struct kvm_vcpu *)') and 'voi=
d *') [-Werror,-Wpointer-type-mismatch]
    arch/x86/include/asm/kvm-x86-ops.h:88:1: error: pointer type mismatch (=
'int (*)(struct kvm *, unsigned int)' and 'void *') [-Werror,-Wpointer-type=
-mismatch]
    arch/x86/include/asm/kvm-x86-ops.h:89:1: error: pointer type mismatch (=
'int (*)(struct kvm *, u64)' (aka 'int (*)(struct kvm *, unsigned long long=
)') and 'void *') [-Werror,-Wpointer-type-mismatch]
    arch/x86/include/asm/kvm-x86-ops.h:90:1: error: pointer type mismatch (=
'u64 (*)(struct kvm_vcpu *, gfn_t, bool)' (aka 'unsigned long long (*)(stru=
ct kvm_vcpu *, unsigned long long, _Bool)') and 'void *') [-Werror,-Wpointe=
r-type-mismatch]
    arch/x86/include/asm/kvm-x86-ops.h:108:1: error: pointer type mismatch =
('bool (*)(struct kvm_vcpu *)' (aka '_Bool (*)(struct kvm_vcpu *)') and 'vo=
id *') [-Werror,-Wpointer-type-mismatch]

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-14) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
allnoconfig (i386, clang-14) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
am200epdkit_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0=
 section mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
ar7_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
aspeed_g4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, clang-14) =E2=80=94 PASS, 0 errors, 10 warnings, =
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
assabet_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
ath25_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
axm55xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
axs103_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
bcm2835_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
bcm47xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    net/ipv6/ip6mr.c:1656:7: warning: unused variable =E2=80=98do_wrmifwhol=
e=E2=80=99 [-Wunused-variable]

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
capcella_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
cavium_octeon_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
cerfcube_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    arch/mips/boot/dts/ingenic/jz4780.dtsi:513.33-515.6: Warning (unit_addr=
ess_format): /nemc@13410000/efuse@d0/eth-mac-addr@0x22: unit name should no=
t have leading "0x"

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
colibri_pxa270_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings=
, 0 section mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
colibri_pxa300_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings=
, 0 section mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
corgi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-10) =E2=80=94 FAIL, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-14) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section=
 mismatches

Warnings:
    fs/netfs/io.c:630:6: warning: variable 'ret' is used uninitialized when=
ever 'if' condition is false [-Wsometimes-uninitialized]
    fs/netfs/io.c:604:9: note: initialize the variable 'ret' to silence thi=
s warning
    1 warning generated.

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_16K_PAGES=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_EFI=3Dn (riscv, clang-14) =E2=80=94 PASS, 0 errors, 3 warn=
ings, 0 section mismatches

Warnings:
    fs/netfs/io.c:630:6: warning: variable 'ret' is used uninitialized when=
ever 'if' condition is false [-Wsometimes-uninitialized]
    fs/netfs/io.c:604:9: note: initialize the variable 'ret' to silence thi=
s warning
    1 warning generated.

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 error=
s, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook+kselftest (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+debug (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
defconfig+debug (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
dove_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
e55_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
eseries_pxa_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0=
 section mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 0 warnings, 0 s=
ection mismatches

Errors:
    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=80=
=98-mhard-float=E2=80=99

---------------------------------------------------------------------------=
-----
gcw0_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    include/asm-generic/unaligned.h:14:8: warning: array subscript -1 is ou=
tside array bounds of =E2=80=98unsigned char[1]=E2=80=99 [-Warray-bounds]

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
gpr_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
h3600_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
h5000_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
hackkit_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig+kselftest (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 w=
arnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
hisi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
hsdk_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, clang-14) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

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
imote2_defconfig (arm, gcc-10) =E2=80=94 FAIL, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
ip22_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ip32_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 =
section mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
lart_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
lemote2f_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 0 warnings, 0 se=
ction mismatches

Errors:
    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=80=
=98-mhard-float=E2=80=99

---------------------------------------------------------------------------=
-----
loongson1b_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
loongson1c_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
loongson2k_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 0 warnings, 0 =
section mismatches

Errors:
    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=80=
=98-mhard-float=E2=80=99

---------------------------------------------------------------------------=
-----
loongson3_defconfig (mips, gcc-10) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 =
section mismatches

Errors:
    (.init.text+0x1714): undefined reference to `node_data'
    mips-linux-gnu-ld: (.init.text+0x1730): undefined reference to `node_da=
ta'

---------------------------------------------------------------------------=
-----
lpc18xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/binfmt_flat.c:117:12: warning: =E2=80=98flat_core_dump=E2=80=99 defi=
ned but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
lpc32xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
lpd270_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
lubbock_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
magician_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

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
maltaaprp_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

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
mmp2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
mpc30x_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
mps2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    fs/binfmt_flat.c:117:12: warning: =E2=80=98flat_core_dump=E2=80=99 defi=
ned but not used [-Wunused-function]

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
multi_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-14) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-14) =E2=80=94 PASS, 0 errors, 13 warnings, 0=
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
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    drivers/gpu/drm/stm/ltdc.c:625:2: warning: variable 'val' is used unini=
tialized whenever switch default is taken [-Wsometimes-uninitialized]
    drivers/gpu/drm/stm/ltdc.c:600:9: note: initialize the variable 'val' t=
o silence this warning
    1 warning generated.

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-10) =E2=80=
=94 PASS, 0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy (arm, gcc-10) =E2=80=94 PASS, 0=
 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
neponset_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
netwinder_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
nhk8815_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, =
0 section mismatches

Warnings:
    fs/binfmt_flat.c:117:12: warning: =E2=80=98flat_core_dump=E2=80=99 defi=
ned but not used [-Wunused-function]
    drivers/i2c/busses/i2c-designware-platdrv.c:465:12: warning: =E2=80=98d=
w_i2c_plat_resume=E2=80=99 defined but not used [-Wunused-function]
    drivers/i2c/busses/i2c-designware-platdrv.c:444:12: warning: =E2=80=98d=
w_i2c_plat_suspend=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
nommu_k210_sdcard_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 3 war=
nings, 0 section mismatches

Warnings:
    fs/binfmt_flat.c:117:12: warning: =E2=80=98flat_core_dump=E2=80=99 defi=
ned but not used [-Wunused-function]
    drivers/i2c/busses/i2c-designware-platdrv.c:465:12: warning: =E2=80=98d=
w_i2c_plat_resume=E2=80=99 defined but not used [-Wunused-function]
    drivers/i2c/busses/i2c-designware-platdrv.c:444:12: warning: =E2=80=98d=
w_i2c_plat_suspend=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
nsimosci_hs_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
nsimosci_hs_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

---------------------------------------------------------------------------=
-----
omap2plus_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
omega2p_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
oxnas_v6_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
palmz72_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
pcm027_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
pic32mzda_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
pleb_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
pxa255-idp_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 =
section mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
pxa910_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
pxa_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 section=
 mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-10) =E2=80=94 FAIL, 4 errors, 0 warnings, 0 sectio=
n mismatches

Errors:
    drm_dp_mst_topology.c:(.text+0x1ffc): undefined reference to `__drm_ato=
mic_helper_private_obj_duplicate_state'
    drm_dp_mst_topology.c:(.text+0x2964): undefined reference to `drm_kms_h=
elper_hotplug_event'
    drm_dp_mst_topology.c:(.text+0x7660): undefined reference to `drm_kms_h=
elper_hotplug_event'
    drm_dp_mst_topology.c:(.text+0x870c): undefined reference to `drm_kms_h=
elper_hotplug_event'

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
rb532_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, gcc-10) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 section=
 mismatches

Errors:
    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=3D0x'
    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=3D0x'

---------------------------------------------------------------------------=
-----
rt305x_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
s3c2410_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
sama7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
sb1250_swarm_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
simpad_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
spear3xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
stm32_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/binfmt_flat.c:117:12: warning: =E2=80=98flat_core_dump=E2=80=99 defi=
ned but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
tb0219_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
tb0226_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
tb0287_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
tct_hammer_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 6 warnings, 0 =
section mismatches

Warnings:
    kernel/sched/rt.c:3032:12: warning: =E2=80=98sched_rr_handler=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/sched/rt.c:2993:12: warning: =E2=80=98sched_rt_handler=E2=80=99 =
defined but not used [-Wunused-function]
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section mi=
smatches

Warnings:
    kernel/sched/rt.c:3032:12: warning: 'sched_rr_handler' defined but not =
used [-Wunused-function]
    kernel/sched/rt.c:2993:12: warning: 'sched_rt_handler' defined but not =
used [-Wunused-function]

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    kernel/sched/rt.c:3032:12: warning: =E2=80=98sched_rr_handler=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/sched/rt.c:2993:12: warning: =E2=80=98sched_rt_handler=E2=80=99 =
defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
tinyconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section m=
ismatches

Warnings:
    kernel/sched/rt.c:3032:12: warning: =E2=80=98sched_rr_handler=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/sched/rt.c:2993:12: warning: =E2=80=98sched_rt_handler=E2=80=99 =
defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
trizeps4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
vdk_hs38_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

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
vf610m4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
viper_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
vocore2_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, =
0 section mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
workpad_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, clang-14) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+amdgpu (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnin=
gs, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+crypto (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnin=
gs, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+debug (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 2 warning=
s, 0 section mismatches

Warnings:
    lib/strncpy_from_user.o: warning: objtool: strncpy_from_user()+0x86: ca=
ll to do_strncpy_from_user() with UACCESS enabled
    lib/strnlen_user.o: warning: objtool: strnlen_user()+0x59: call to do_s=
trnlen_user() with UACCESS enabled

---------------------------------------------------------------------------=
-----
x86_64_defconfig+ima (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 war=
nings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, =
0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook+amdgpu (x86_64, gcc-10) =E2=80=94 PASS, 0 e=
rrors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook+kselftest (x86_64, gcc-10) =E2=80=94 PASS, =
0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86_kvm_guest (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0=
 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
xcep_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
zeus_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---
For more info write to <info@kernelci.org>
