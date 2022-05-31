Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4F620F1
	for <llvm@lists.linux.dev>; Tue, 31 May 2022 06:21:20 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id s14so11987206plk.8
        for <llvm@lists.linux.dev>; Mon, 30 May 2022 23:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=kuaW+iDqEG3mGzcObmULN9Wxkyn4GtDysXFTuFolgec=;
        b=Nljemaiss9cG3/5l9n6lWSztwtrQPvXAhsGmTKSk6sBuLtsyvJ5jrJUjrwD+5Dj4Rk
         bisw5YU2krt1PzLDe1VX7kihdi8v6qDaLFOG6qGs7P8cep5bOGRpehEsmj31MupQaiP/
         viILDJuQkuuuS48ewQN5rbd7tLh0kZoKYGBJY3DcreOVrQnCXYiuyfd7dbq6WxMd4HVm
         NRN8ekm2RqQRMsu1N9yqGidxjf/kbk3PGILwMNn+4VYIutXMbFMveLmVy2etw4ka1nqn
         c9K3pi3xUo5AslwS+iZBQ4hV+VLxhTmHDi/cHrpvDXWC8bR6uK403erzATfS/adcq7i6
         bApw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=kuaW+iDqEG3mGzcObmULN9Wxkyn4GtDysXFTuFolgec=;
        b=Qzq6ir9vD2qYbdD2ypgTQrIrG6Cyl/yKZ1U77NgduVG07TyuSUBaKUmg4kx3KNhvkq
         oS44CEu+wdb4OtMNdcxLyZZxu3P8TQdrPGvdXmPL+3cdWo8hv/rZOtiU5NFwQN12+mIS
         fD25pcqDgZTvprWQkRgOCidM3eBeEuBKw4cxQcHNMDfHbWOK+W2686pqj6h8kZH80zOD
         4IvJfGlmTkwOXrf0sk8Ew5IOx61JRKibFR9ZU/e9+2gJ7ago7VTBhKRWfeQ+du2as75x
         PaBUNOH+rNHodt26n1pY17nSoJGt0JMZADuDXNUkGfp3/OkVbknHgzsbgtlZo26FzqDv
         /pbA==
X-Gm-Message-State: AOAM532YiScUDfes9ihePp/zSDiRjFa5oSXeT0w0cUlPlmbKcVXiCDKw
	Z1Q+Z3wbQXlQRz4mDKhK2HhpAHn4XhQCM1S45JY=
X-Google-Smtp-Source: ABdhPJwxLQhXlT010dQePKhgOpzQ84CJRTZroN3IcxzaDqur4NguToj1DPeguBs5rkux4BhXXbKF1Q==
X-Received: by 2002:a17:902:f710:b0:15f:165f:b50b with SMTP id h16-20020a170902f71000b0015f165fb50bmr61160340plo.158.1653978078447;
        Mon, 30 May 2022 23:21:18 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x64-20020a638643000000b003fc087849ddsm3754351pgd.36.2022.05.30.23.21.15
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 23:21:16 -0700 (PDT)
Message-ID: <6295b3dc.1c69fb81.f48fc.9252@mx.google.com>
Date: Mon, 30 May 2022 23:21:16 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20220531
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master build: 205 builds: 12 failed, 193 passed, 57 errors,
 92 warnings (next-20220531)
To: llvm@lists.linux.dev
From: "kernelci.org bot" <bot@kernelci.org>

next/master build: 205 builds: 12 failed, 193 passed, 57 errors, 92 warning=
s (next-20220531)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20220531/

Tree: next
Branch: master
Git Describe: next-20220531
Git Commit: 3b46e4e4418027a622c17d1b7c40c3f565115d03
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm64:
    allmodconfig: (clang-15) FAIL

arm:
    allmodconfig: (clang-15) FAIL
    allmodconfig: (gcc-10) FAIL
    rpc_defconfig: (gcc-10) FAIL

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
    cros://chromeos-5.10/x86_64/chromeos-intel-pineview.flavour.config+x86-=
chromebook: (clang-13) FAIL
    allmodconfig: (clang-15) FAIL
    x86_64_defconfig: (gcc-10) FAIL

Errors and Warnings Detected:

arc:

arm64:
    allmodconfig (clang-15): 2 errors, 1 warning

arm:
    allmodconfig (gcc-10): 1 error, 1 warning
    allmodconfig (clang-15): 6 errors, 15 warnings
    am200epdkit_defconfig (gcc-10): 1 warning
    aspeed_g5_defconfig (clang-15): 10 warnings
    badge4_defconfig (gcc-10): 1 warning
    bcm2835_defconfig (gcc-10): 2 warnings
    cm_x300_defconfig (gcc-10): 1 warning
    colibri_pxa270_defconfig (gcc-10): 1 warning
    corgi_defconfig (gcc-10): 1 warning
    davinci_all_defconfig (gcc-10): 1 warning
    exynos_defconfig (gcc-10): 1 warning
    ezx_defconfig (gcc-10): 1 warning
    imx_v6_v7_defconfig (gcc-10): 1 warning
    magician_defconfig (gcc-10): 1 warning
    mini2440_defconfig (gcc-10): 1 warning
    multi_v7_defconfig (clang-15): 10 warnings
    multi_v7_defconfig (gcc-10): 1 warning
    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (gcc-10): 1 warni=
ng
    multi_v7_defconfig+CONFIG_SMP=3Dn (gcc-10): 1 warning
    multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy (gcc-10): 1 warning
    multi_v7_defconfig+kselftest (gcc-10): 2 warnings
    mvebu_v7_defconfig (gcc-10): 1 warning
    nhk8815_defconfig (gcc-10): 1 warning
    pxa_defconfig (gcc-10): 1 warning
    qcom_defconfig (gcc-10): 1 warning
    rpc_defconfig (gcc-10): 2 errors
    s3c2410_defconfig (gcc-10): 1 warning
    s5pv210_defconfig (gcc-10): 1 warning
    sama7_defconfig (gcc-10): 1 warning
    simpad_defconfig (gcc-10): 1 warning
    spitz_defconfig (gcc-10): 1 warning
    tegra_defconfig (gcc-10): 1 warning
    trizeps4_defconfig (gcc-10): 1 warning
    u8500_defconfig (gcc-10): 1 warning
    viper_defconfig (gcc-10): 1 warning
    zeus_defconfig (gcc-10): 1 warning

i386:
    allmodconfig (clang-15): 10 errors, 1 warning

mips:
    32r2el_defconfig+debug (gcc-10): 1 warning
    32r2el_defconfig+kselftest (gcc-10): 1 warning
    fuloong2e_defconfig (gcc-10): 1 error
    lemote2f_defconfig (gcc-10): 1 error
    loongson2k_defconfig (gcc-10): 1 error, 1 warning
    rb532_defconfig (gcc-10): 1 warning

riscv:
    defconfig+CONFIG_EFI=3Dn (clang-15): 30 errors

x86_64:
    allmodconfig (clang-15): 1 error, 15 warnings
    cros://chromeos-5.10/x86_64/chromeos-amd-stoneyridge.flavour.config+x86=
-chromebook (clang-13): 1 error, 1 warning
    cros://chromeos-5.10/x86_64/chromeos-intel-pineview.flavour.config+x86-=
chromebook (clang-13): 1 error, 1 warning

Errors summary:

    19   arch/riscv/include/asm/tlbflush.h:23:2: error: expected assembly-t=
ime absolute expression
    6    drivers/misc/cardreader/rts5261.c:406:13: error: variable 'setting=
_reg2' is used uninitialized whenever 'if' condition is false [-Werror,-Wso=
metimes-uninitialized]
    6    arch/riscv/include/asm/pgtable-64.h:121:2: error: expected assembl=
y-time absolute expression
    4    arch/riscv/include/asm/pgtable-64.h:105:2: error: expected assembl=
y-time absolute expression
    2    include/linux/fortify-string.h:344:4: error: call to __write_overf=
low_field declared with 'warning' attribute: detected write beyond size of =
field (1st parameter); maybe use struct_group()? [-Werror,-Wattribute-warni=
ng]
    2    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=
=80=98-mhard-float=E2=80=99
    1    sound/soc/intel/avs/path.c:815:18: error: stack frame size (2176) =
exceeds limit (2048) in 'avs_path_create' [-Werror,-Wframe-larger-than]
    1    sound/soc/intel/avs/path.c:815:18: error: stack frame size (1232) =
exceeds limit (1024) in 'avs_path_create' [-Werror,-Wframe-larger-than]
    1    include/linux/fortify-string.h:344:4: error: call to =E2=80=98__wr=
ite_overflow_field=E2=80=99 declared with attribute warning: detected write=
 beyond size of field (1st parameter); maybe use struct_group()? [-Werror=
=3Dattribute-warning]
    1    fatal error: too many errors emitted, stopping now [-ferror-limit=
=3D]
    1    drivers/irqchip/irq-loongson-liointc.c:60:13: error: implicit decl=
aration of function =E2=80=98cpu_logical_map=E2=80=99 [-Werror=3Dimplicit-f=
unction-declaration]
    1    drivers/gpu/drm/selftests/test-drm_mm.c:372:12: error: stack frame=
 size (1032) exceeds limit (1024) in '__igt_reserve' [-Werror,-Wframe-large=
r-than]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_=
calc_31.c:939:13: error: stack frame size (1388) exceeds limit (1024) in 'd=
ml_rq_dlg_get_dlg_params' [-Werror,-Wframe-larger-than]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_=
calc_30.c:981:13: error: stack frame size (1068) exceeds limit (1024) in 'd=
ml_rq_dlg_get_dlg_params' [-Werror,-Wframe-larger-than]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_=
calc_21.c:829:13: error: stack frame size (1100) exceeds limit (1024) in 'd=
ml_rq_dlg_get_dlg_params' [-Werror,-Wframe-larger-than]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vb=
a_21.c:3518:6: error: stack frame size (1260) exceeds limit (1024) in 'dml2=
1_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vb=
a_21.c:1466:13: error: stack frame size (1228) exceeds limit (1024) in 'DIS=
PCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculat=
ion' [-Werror,-Wframe-larger-than]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20v2.c:3393:6: error: stack frame size (1580) exceeds limit (1024) in 'dm=
l20v2_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20v2.c:1145:13: error: stack frame size (1324) exceeds limit (1024) in 'd=
ml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman=
ceCalculation' [-Werror,-Wframe-larger-than]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20.c:3286:6: error: stack frame size (1628) exceeds limit (1024) in 'dml2=
0_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20.c:1085:13: error: stack frame size (1388) exceeds limit (1024) in 'dml=
20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCa=
lculation' [-Werror,-Wframe-larger-than]
    1    crypto/wp512.c:782:13: error: stack frame size (1168) exceeds limi=
t (1024) in 'wp512_process_buffer' [-Werror,-Wframe-larger-than]
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=
=3D0x'
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=
=3D0x'

Warnings summary:

    29   include/linux/bitmap.h:261:2: warning: =E2=80=98memcpy=E2=80=99 fo=
rming offset [4, 7] is out of the bounds [0, 4] of object =E2=80=98flags=E2=
=80=99 with type =E2=80=98long unsigned int[1]=E2=80=99 [-Warray-bounds]
    24   clang: warning: argument unused during compilation: '-march=3Darmv=
6k' [-Wunused-command-line-argument]
    10   clang: warning: argument unused during compilation: '-march=3Darmv=
7-a' [-Wunused-command-line-argument]
    6    drivers/misc/cardreader/rts5261.c:364:32: note: initialize the var=
iable 'setting_reg2' to silence this warning
    2    include/linux/fortify-string.h:344:4: warning: call to =E2=80=98__=
write_overflow_field=E2=80=99 declared with attribute warning: detected wri=
te beyond size of field (1st parameter); maybe use struct_group()? [-Wattri=
bute-warning]
    2    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_devic=
e_reg): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expec=
ted "0,0"
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
ts+0x452: call to __ubsan_handle_load_invalid_value() with UACCESS enabled
    1    arch/x86/kvm/kvm.o: warning: objtool: emulator_cmpxchg_emulated+0x=
71b: call to __ubsan_handle_load_invalid_value() with UACCESS enabled

Section mismatches summary:

    1    WARNING: modpost: vmlinux.o(.text.unlikely+0x2144): Section mismat=
ch in reference from the function at91_pm_secure_init() to the (unknown ref=
erence) .init.rodata:(unknown)

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
32r2el_defconfig+kselftest (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warni=
ng, 0 section mismatches

Warnings:
    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_reg=
): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expected "=
0,0"

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
    WARNING: modpost: vmlinux.o(.text.unlikely+0x2144): Section mismatch in=
 reference from the function at91_pm_secure_init() to the (unknown referenc=
e) .init.rodata:(unknown)

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-15) =E2=80=94 FAIL, 2 errors, 1 warning, 0 secti=
on mismatches

Errors:
    sound/soc/intel/avs/path.c:815:18: error: stack frame size (2176) excee=
ds limit (2048) in 'avs_path_create' [-Werror,-Wframe-larger-than]
    drivers/misc/cardreader/rts5261.c:406:13: error: variable 'setting_reg2=
' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometim=
es-uninitialized]

Warnings:
    drivers/misc/cardreader/rts5261.c:364:32: note: initialize the variable=
 'setting_reg2' to silence this warning

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
452: call to __ubsan_handle_load_invalid_value() with UACCESS enabled
    drivers/video/fbdev/udlfb.o: warning: objtool: dlfb_ops_write() falls t=
hrough to next function dlfb_ops_setcolreg()
    drivers/video/fbdev/smscufx.o: warning: objtool: ufx_ops_write() falls =
through to next function ufx_ops_setcolreg()
    drivers/soc/qcom/qcom_rpmh.o: warning: objtool: rpmh_rsc_write_ctrl_dat=
a() falls through to next function trace_raw_output_rpmh_tx_done()
    drivers/misc/cardreader/rts5261.c:364:32: note: initialize the variable=
 'setting_reg2' to silence this warning
    drivers/gpu/drm/radeon/radeon.o: warning: objtool: sumo_dpm_set_power_s=
tate() falls through to next function sumo_dpm_post_set_power_state()

---------------------------------------------------------------------------=
-----
allmodconfig (i386, clang-15) =E2=80=94 FAIL, 10 errors, 1 warning, 0 secti=
on mismatches

Errors:
    drivers/misc/cardreader/rts5261.c:406:13: error: variable 'setting_reg2=
' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometim=
es-uninitialized]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_=
21.c:829:13: error: stack frame size (1100) exceeds limit (1024) in 'dml_rq=
_dlg_get_dlg_params' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_=
30.c:981:13: error: stack frame size (1068) exceeds limit (1024) in 'dml_rq=
_dlg_get_dlg_params' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_=
31.c:939:13: error: stack frame size (1388) exceeds limit (1024) in 'dml_rq=
_dlg_get_dlg_params' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.=
c:1085:13: error: stack frame size (1388) exceeds limit (1024) in 'dml20_DI=
SPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalcula=
tion' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v=
2.c:1145:13: error: stack frame size (1324) exceeds limit (1024) in 'dml20v=
2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCal=
culation' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.=
c:1466:13: error: stack frame size (1228) exceeds limit (1024) in 'DISPCLKD=
PPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation' =
[-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.=
c:3286:6: error: stack frame size (1628) exceeds limit (1024) in 'dml20_Mod=
eSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.=
c:3518:6: error: stack frame size (1260) exceeds limit (1024) in 'dml21_Mod=
eSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v=
2.c:3393:6: error: stack frame size (1580) exceeds limit (1024) in 'dml20v2=
_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]

Warnings:
    drivers/misc/cardreader/rts5261.c:364:32: note: initialize the variable=
 'setting_reg2' to silence this warning

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-15) =E2=80=94 FAIL, 6 errors, 15 warnings, 0 secti=
on mismatches

Errors:
    crypto/wp512.c:782:13: error: stack frame size (1168) exceeds limit (10=
24) in 'wp512_process_buffer' [-Werror,-Wframe-larger-than]
    sound/soc/intel/avs/path.c:815:18: error: stack frame size (1232) excee=
ds limit (1024) in 'avs_path_create' [-Werror,-Wframe-larger-than]
    drivers/misc/cardreader/rts5261.c:406:13: error: variable 'setting_reg2=
' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometim=
es-uninitialized]
    drivers/gpu/drm/selftests/test-drm_mm.c:372:12: error: stack frame size=
 (1032) exceeds limit (1024) in '__igt_reserve' [-Werror,-Wframe-larger-tha=
n]
    include/linux/fortify-string.h:344:4: error: call to __write_overflow_f=
ield declared with 'warning' attribute: detected write beyond size of field=
 (1st parameter); maybe use struct_group()? [-Werror,-Wattribute-warning]
    include/linux/fortify-string.h:344:4: error: call to __write_overflow_f=
ield declared with 'warning' attribute: detected write beyond size of field=
 (1st parameter); maybe use struct_group()? [-Werror,-Wattribute-warning]

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
    drivers/misc/cardreader/rts5261.c:364:32: note: initialize the variable=
 'setting_reg2' to silence this warning

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

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
allnoconfig (i386, clang-15) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

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
ath79_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
axm55xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
axs103_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
axs103_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
badge4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    include/linux/bitmap.h:261:2: warning: =E2=80=98memcpy=E2=80=99 forming=
 offset [4, 7] is out of the bounds [0, 4] of object =E2=80=98flags=E2=80=
=99 with type =E2=80=98long unsigned int[1]=E2=80=99 [-Warray-bounds]

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

---------------------------------------------------------------------------=
-----
bcm47xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
bcm63xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
bigsur_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

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
cavium_octeon_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

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

---------------------------------------------------------------------------=
-----
colibri_pxa270_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning,=
 0 section mismatches

Warnings:
    include/linux/bitmap.h:261:2: warning: =E2=80=98memcpy=E2=80=99 forming=
 offset [4, 7] is out of the bounds [0, 4] of object =E2=80=98flags=E2=80=
=99 with type =E2=80=98long unsigned int[1]=E2=80=99 [-Warray-bounds]

---------------------------------------------------------------------------=
-----
colibri_pxa300_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
corgi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    include/linux/bitmap.h:261:2: warning: =E2=80=98memcpy=E2=80=99 forming=
 offset [4, 7] is out of the bounds [0, 4] of object =E2=80=98flags=E2=80=
=99 with type =E2=80=98long unsigned int[1]=E2=80=99 [-Warray-bounds]

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-qualcomm.flavour.config+arm64-chromeb=
ook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section misma=
tches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.config+arm64-chrom=
ebook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mis=
matches

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
omebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

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
cu1000-neo_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
cu1830-neo_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    include/linux/bitmap.h:261:2: warning: =E2=80=98memcpy=E2=80=99 forming=
 offset [4, 7] is out of the bounds [0, 4] of object =E2=80=98flags=E2=80=
=99 with type =E2=80=98long unsigned int[1]=E2=80=99 [-Warray-bounds]

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
defconfig+CONFIG_ARM64_16K_PAGES=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 error=
s, 0 warnings, 0 section mismatches

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
defconfig+arm64-chromebook (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 wa=
rnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook+kselftest (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+crypto (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
defconfig+debug (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
defconfig+ima (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

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

---------------------------------------------------------------------------=
-----
ezx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    include/linux/bitmap.h:261:2: warning: =E2=80=98memcpy=E2=80=99 forming=
 offset [4, 7] is out of the bounds [0, 4] of object =E2=80=98flags=E2=80=
=99 with type =E2=80=98long unsigned int[1]=E2=80=99 [-Warray-bounds]

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 0 warnings, 0 s=
ection mismatches

Errors:
    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=80=
=98-mhard-float=E2=80=99

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
haps_hs_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig+debug (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warni=
ngs, 0 section mismatches

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig+kselftest (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 w=
arnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
hisi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

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
i386_defconfig (i386, clang-15) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
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
imx_v4_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    include/linux/bitmap.h:261:2: warning: =E2=80=98memcpy=E2=80=99 forming=
 offset [4, 7] is out of the bounds [0, 4] of object =E2=80=98flags=E2=80=
=99 with type =E2=80=98long unsigned int[1]=E2=80=99 [-Warray-bounds]

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

---------------------------------------------------------------------------=
-----
ip27_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ip28_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ip32_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

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
lart_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

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
lpc18xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
lpc32xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

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
mini2440_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    include/linux/bitmap.h:261:2: warning: =E2=80=98memcpy=E2=80=99 forming=
 offset [4, 7] is out of the bounds [0, 4] of object =E2=80=98flags=E2=80=
=99 with type =E2=80=98long unsigned int[1]=E2=80=99 [-Warray-bounds]

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
mpc30x_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

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
multi_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-15) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-15) =E2=80=94 PASS, 0 errors, 10 warnings, 0=
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

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    include/linux/bitmap.h:261:2: warning: =E2=80=98memcpy=E2=80=99 forming=
 offset [4, 7] is out of the bounds [0, 4] of object =E2=80=98flags=E2=80=
=99 with type =E2=80=98long unsigned int[1]=E2=80=99 [-Warray-bounds]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-10) =E2=80=94 PASS, =
0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-10) =E2=80=
=94 PASS, 0 errors, 1 warning, 0 section mismatches

Warnings:
    include/linux/bitmap.h:261:2: warning: =E2=80=98memcpy=E2=80=99 forming=
 offset [4, 7] is out of the bounds [0, 4] of object =E2=80=98flags=E2=80=
=99 with type =E2=80=98long unsigned int[1]=E2=80=99 [-Warray-bounds]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1=
 warning, 0 section mismatches

Warnings:
    include/linux/bitmap.h:261:2: warning: =E2=80=98memcpy=E2=80=99 forming=
 offset [4, 7] is out of the bounds [0, 4] of object =E2=80=98flags=E2=80=
=99 with type =E2=80=98long unsigned int[1]=E2=80=99 [-Warray-bounds]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy (arm, gcc-10) =E2=80=94 PASS, 0=
 errors, 1 warning, 0 section mismatches

Warnings:
    include/linux/bitmap.h:261:2: warning: =E2=80=98memcpy=E2=80=99 forming=
 offset [4, 7] is out of the bounds [0, 4] of object =E2=80=98flags=E2=80=
=99 with type =E2=80=98long unsigned int[1]=E2=80=99 [-Warray-bounds]

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

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    include/linux/bitmap.h:261:2: warning: =E2=80=98memcpy=E2=80=99 forming=
 offset [4, 7] is out of the bounds [0, 4] of object =E2=80=98flags=E2=80=
=99 with type =E2=80=98long unsigned int[1]=E2=80=99 [-Warray-bounds]

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

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

---------------------------------------------------------------------------=
-----
nsimosci_hs_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

---------------------------------------------------------------------------=
-----
omega2p_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
oxnas_v6_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

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

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    include/linux/bitmap.h:261:2: warning: =E2=80=98memcpy=E2=80=99 forming=
 offset [4, 7] is out of the bounds [0, 4] of object =E2=80=98flags=E2=80=
=99 with type =E2=80=98long unsigned int[1]=E2=80=99 [-Warray-bounds]

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
rs90_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
rt305x_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
rv32_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
s3c2410_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    include/linux/bitmap.h:261:2: warning: =E2=80=98memcpy=E2=80=99 forming=
 offset [4, 7] is out of the bounds [0, 4] of object =E2=80=98flags=E2=80=
=99 with type =E2=80=98long unsigned int[1]=E2=80=99 [-Warray-bounds]

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
sama5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
sama7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    include/linux/bitmap.h:261:2: warning: =E2=80=98memcpy=E2=80=99 forming=
 offset [4, 7] is out of the bounds [0, 4] of object =E2=80=98flags=E2=80=
=99 with type =E2=80=98long unsigned int[1]=E2=80=99 [-Warray-bounds]

---------------------------------------------------------------------------=
-----
sb1250_swarm_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

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
socfpga_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    include/linux/bitmap.h:261:2: warning: =E2=80=98memcpy=E2=80=99 forming=
 offset [4, 7] is out of the bounds [0, 4] of object =E2=80=98flags=E2=80=
=99 with type =E2=80=98long unsigned int[1]=E2=80=99 [-Warray-bounds]

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
tb0219_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
tb0287_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

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
tinyconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
trizeps4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    include/linux/bitmap.h:261:2: warning: =E2=80=98memcpy=E2=80=99 forming=
 offset [4, 7] is out of the bounds [0, 4] of object =E2=80=98flags=E2=80=
=99 with type =E2=80=98long unsigned int[1]=E2=80=99 [-Warray-bounds]

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    include/linux/bitmap.h:261:2: warning: =E2=80=98memcpy=E2=80=99 forming=
 offset [4, 7] is out of the bounds [0, 4] of object =E2=80=98flags=E2=80=
=99 with type =E2=80=98long unsigned int[1]=E2=80=99 [-Warray-bounds]

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
vexpress_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
viper_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    include/linux/bitmap.h:261:2: warning: =E2=80=98memcpy=E2=80=99 forming=
 offset [4, 7] is out of the bounds [0, 4] of object =E2=80=98flags=E2=80=
=99 with type =E2=80=98long unsigned int[1]=E2=80=99 [-Warray-bounds]

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
x86_64_defconfig (x86_64, gcc-10) =E2=80=94 FAIL, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, clang-15) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
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
x86_64_defconfig+debug (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

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
x86_64_defconfig+x86-chromebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

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
xcep_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

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
