Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931C61361
	for <llvm@lists.linux.dev>; Mon,  8 May 2023 13:01:40 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1aaf91ae451so42196935ad.1
        for <llvm@lists.linux.dev>; Mon, 08 May 2023 06:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1683550899; x=1686142899;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1ja96vXtrfLP+0hamjYNAHsXZbaZgSam/CycXxHuHxs=;
        b=0pofKfk1/7nASde2uhPML/mAl3/AWv1JCf4sZk+i+z2a86EgMIsikXm7sb4HF8pRA7
         ItAIycmMzBu7/oS/rU1FsOIjeoZQQMgt7M95mdq0xFL85vBIbcFk/JbATWrNI7V85LmO
         QpQH0xZ4ecTZAnganu+P/BO7LfMApdq2x0GSDugVNQnYuFv9XGBTY8OlunO1w29N9KsZ
         C+YS3GvU9PLCTZQnYIQxzbN5fpG7nNPdCjHHZWl3Uo3qsakHSPDpJ90mO0CPa9FRnE7V
         UmxDbFhUJd52xTk6J8Cs4QuklKgtxYybNw73MGmAnAITKA0PFxLxVJt582wROqgNCxUS
         4EyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683550899; x=1686142899;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ja96vXtrfLP+0hamjYNAHsXZbaZgSam/CycXxHuHxs=;
        b=KUyif/aWRaREq1zNl5y8Ih+aiBCE4w5ZwnT6i+xHmDGVybXmXGshgJImilbDF8Xo69
         si5kx33i3BTuk4tk0VMS7Wl+8jt15ZfV4GBaaGGM1yYCQmv0Thlp5opdfwiQtv10AU6I
         7rxR5vGkcLYmih67nYq9suSCMurBjIWLDx3n0e2BIcknsifbsqZuw1zPVaxIMp0LQchr
         Kv9ASrmMEmt80a+CKXji7VEtFhaBHxq2+9Wi3q8h6p+0XdNALigy1yv8Z/xBYjR7fPpX
         k4jmmgk7yHsB3ZoORynBjgSeXDmX9x/1qy3wZ6EakYaQsMU6Rp7mH6VtUDOA4Ec9O582
         NuUg==
X-Gm-Message-State: AC+VfDzqLfVtTRwwNgNGz4VdiPJkr2APlQIOwXR9GiRqPlg0BCCaTzL4
	RrVLbFpqwcrMYnllj9HvwwP5c7vKExgPtdZj0nL9IQ==
X-Google-Smtp-Source: ACHHUZ5CyMuzjHZ4rqLZ07/pJMN16t4PPn0rcs3gB1kzWuIOvdX/kKUq55xsevr0UgZVmMrO0/rJAA==
X-Received: by 2002:a17:902:c1c4:b0:1a8:1320:133 with SMTP id c4-20020a170902c1c400b001a813200133mr9167305plc.51.1683550896640;
        Mon, 08 May 2023 06:01:36 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id jk1-20020a170903330100b0019e60c645b1sm7221041plb.305.2023.05.08.06.01.35
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 06:01:36 -0700 (PDT)
Message-ID: <6458f2b0.170a0220.b35ae.c6d8@mx.google.com>
Date: Mon, 08 May 2023 06:01:36 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20230508
X-Kernelci-Report-Type: build
Subject: next/master build: 134 builds: 9 failed, 125 passed, 20 errors,
 227 warnings (next-20230508)
To: llvm@lists.linux.dev
From: "kernelci.org bot" <bot@kernelci.org>

next/master build: 134 builds: 9 failed, 125 passed, 20 errors, 227 warning=
s (next-20230508)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20230508/

Tree: next
Branch: master
Git Describe: next-20230508
Git Commit: 52025ebbb518a2d876b8aba191b348ffb1cf368b
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 8 unique architectures

Build Failures Detected:

arm64:
    cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chrome=
book: (clang-13) FAIL
    cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.config+arm64-chr=
omebook: (clang-13) FAIL
    cros://chromeos-5.10/arm64/chromiumos-qualcomm.flavour.config+arm64-chr=
omebook: (clang-13) FAIL
    cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.config+arm64-c=
hromebook: (clang-13) FAIL

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

Errors and Warnings Detected:

arc:

arm64:
    cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chrome=
book (clang-13): 2 errors
    cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.config+arm64-chr=
omebook (clang-13): 2 errors
    cros://chromeos-5.10/arm64/chromiumos-qualcomm.flavour.config+arm64-chr=
omebook (clang-13): 2 errors
    cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.config+arm64-c=
hromebook (clang-13): 2 errors

arm:
    aspeed_g4_defconfig (gcc-10): 1 warning
    aspeed_g5_defconfig (clang-17): 3 warnings
    assabet_defconfig (gcc-10): 2 warnings
    axm55xx_defconfig (gcc-10): 2 warnings
    bcm2835_defconfig (gcc-10): 2 warnings
    collie_defconfig (gcc-10): 1 warning
    cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (clang-13): 6 =
warnings
    cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (clang-13=
): 6 warnings
    davinci_all_defconfig (gcc-10): 2 warnings
    exynos_defconfig (gcc-10): 2 warnings
    footbridge_defconfig (gcc-10): 2 warnings
    gemini_defconfig (gcc-10): 1 warning
    h3600_defconfig (gcc-10): 2 warnings
    hisi_defconfig (gcc-10): 1 warning
    imx_v4_v5_defconfig (gcc-10): 2 warnings
    imx_v6_v7_defconfig (gcc-10): 2 warnings
    imxrt_defconfig (gcc-10): 1 warning
    integrator_defconfig (gcc-10): 2 warnings
    ixp4xx_defconfig (gcc-10): 2 warnings
    jornada720_defconfig (gcc-10): 2 warnings
    keystone_defconfig (gcc-10): 2 warnings
    lpc18xx_defconfig (gcc-10): 1 warning
    lpc32xx_defconfig (gcc-10): 2 warnings
    milbeaut_m10v_defconfig (gcc-10): 2 warnings
    mmp2_defconfig (gcc-10): 2 warnings
    moxart_defconfig (gcc-10): 1 warning
    multi_v4t_defconfig (gcc-10): 1 warning
    multi_v7_defconfig (gcc-10): 2 warnings
    multi_v7_defconfig+CONFIG_SMP=3Dn (gcc-10): 2 warnings
    mvebu_v5_defconfig (gcc-10): 2 warnings
    mvebu_v7_defconfig (gcc-10): 2 warnings
    netwinder_defconfig (gcc-10): 1 warning
    omap2plus_defconfig (gcc-10): 2 warnings
    orion5x_defconfig (gcc-10): 2 warnings
    pxa168_defconfig (gcc-10): 2 warnings
    pxa3xx_defconfig (gcc-10): 2 warnings
    pxa910_defconfig (gcc-10): 2 warnings
    pxa_defconfig (gcc-10): 2 warnings
    qcom_defconfig (gcc-10): 2 warnings
    realview_defconfig (gcc-10): 2 warnings
    s3c6400_defconfig (gcc-10): 2 warnings
    s5pv210_defconfig (gcc-10): 2 warnings
    sama5_defconfig (gcc-10): 2 warnings
    sama7_defconfig (gcc-10): 2 warnings
    shmobile_defconfig (gcc-10): 1 warning
    sp7021_defconfig (gcc-10): 2 warnings
    spear13xx_defconfig (gcc-10): 2 warnings
    spear3xx_defconfig (gcc-10): 2 warnings
    spear6xx_defconfig (gcc-10): 2 warnings
    spitz_defconfig (gcc-10): 2 warnings
    stm32_defconfig (gcc-10): 1 warning
    sunxi_defconfig (gcc-10): 2 warnings
    u8500_defconfig (gcc-10): 2 warnings
    vexpress_defconfig (gcc-10): 2 warnings
    vf610m4_defconfig (gcc-10): 1 warning
    vt8500_v6_v7_defconfig (gcc-10): 1 warning
    wpcm450_defconfig (gcc-10): 2 warnings

i386:

mips:
    32r2el_defconfig+debug (gcc-10): 2 warnings
    ar7_defconfig (gcc-10): 2 warnings
    ath25_defconfig (gcc-10): 2 warnings
    ath79_defconfig (gcc-10): 2 warnings
    bcm47xx_defconfig (gcc-10): 2 warnings
    bigsur_defconfig (gcc-10): 6 warnings
    bmips_stb_defconfig (gcc-10): 2 warnings
    cavium_octeon_defconfig (gcc-10): 6 warnings
    ci20_defconfig (gcc-10): 2 warnings
    cobalt_defconfig (gcc-10): 2 warnings
    cu1000-neo_defconfig (gcc-10): 2 warnings
    cu1830-neo_defconfig (gcc-10): 2 warnings
    db1xxx_defconfig (gcc-10): 1 warning
    decstation_defconfig (gcc-10): 2 warnings
    decstation_r4k_defconfig (gcc-10): 2 warnings
    fuloong2e_defconfig (gcc-10): 1 error, 6 warnings
    gpr_defconfig (gcc-10): 2 warnings
    ip22_defconfig (gcc-10): 2 warnings
    ip27_defconfig (gcc-10): 6 warnings
    ip28_defconfig (gcc-10): 6 warnings
    ip32_defconfig (gcc-10): 6 warnings
    jazz_defconfig (gcc-10): 2 warnings
    loongson1b_defconfig (gcc-10): 2 warnings
    loongson3_defconfig (gcc-10): 1 error, 6 warnings
    malta_defconfig (gcc-10): 2 warnings
    malta_kvm_defconfig (gcc-10): 2 warnings
    maltasmvp_defconfig (gcc-10): 2 warnings
    maltaup_defconfig (gcc-10): 2 warnings
    omega2p_defconfig (gcc-10): 1 warning
    pic32mzda_defconfig (gcc-10): 2 warnings
    rb532_defconfig (gcc-10): 2 warnings
    rbtx49xx_defconfig (gcc-10): 2 warnings
    rm200_defconfig (gcc-10): 2 warnings
    vocore2_defconfig (gcc-10): 1 warning

riscv:

sparc:
    allnoconfig (gcc-10): 2 warnings
    sparc32_defconfig (gcc-10): 4 warnings

x86_64:
    allnoconfig (gcc-10): 3 warnings
    cros://chromeos-5.10/x86_64/chromeos-amd-stoneyridge.flavour.config+x86=
-chromebook (clang-13): 2 errors
    cros://chromeos-5.10/x86_64/chromeos-intel-denverton.flavour.config+x86=
-chromebook (clang-13): 2 errors
    cros://chromeos-5.10/x86_64/chromeos-intel-pineview.flavour.config+x86-=
chromebook (clang-13): 2 errors
    cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config (clang-13)=
: 2 errors
    cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config+x86-chrome=
book (clang-13): 2 errors
    x86_64_defconfig (gcc-10): 3 warnings
    x86_64_defconfig+debug (gcc-10): 3 warnings
    x86_64_defconfig+x86-chromebook (gcc-10): 3 warnings
    x86_64_defconfig+x86-chromebook+amdgpu (gcc-10): 3 warnings
    x86_64_defconfig+x86_kvm_guest (gcc-10): 3 warnings

Errors summary:

    9    drivers/nvme/host/ioctl.c:555:37: error: implicit declaration of f=
unction 'io_uring_sqe_cmd' is invalid in C99 [-Werror,-Wimplicit-function-d=
eclaration]
    9    drivers/nvme/host/ioctl.c:555:31: error: incompatible integer to p=
ointer conversion initializing 'const struct nvme_uring_cmd *' with an expr=
ession of type 'int' [-Werror,-Wint-conversion]
    2    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=
=80=98-mhard-float=E2=80=99

Warnings summary:

    191  <stdin>:1567:2: warning: #warning syscall cachestat not implemente=
d [-Wcpp]
    5    vmlinux.o: warning: objtool: iovec_from_user+0x88: call to copy_io=
vec_from_user.part.0() with UACCESS enabled
    5    <stdin>:1567:2: warning: syscall cachestat not implemented [-W#war=
nings]
    5    1 warning generated.
    5    #warning syscall cachestat not implemented
    4    vmlinux.o: warning: objtool: __import_iovec+0x147: call to copy_io=
vec_from_user.part.0() with UACCESS enabled
    4    vmlinux.o: warning: objtool: .altinstr_replacement+0x18c0: redunda=
nt UACCESS disable
    3    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    1    vmlinux.o: warning: objtool: __import_iovec+0x342: call to copy_io=
vec_from_user.part.0() with UACCESS enabled
    1    vmlinux.o: warning: objtool: .altinstr_replacement+0x1a6a: redunda=
nt UACCESS disable
    1    lib/iov_iter.o: warning: objtool: iovec_from_user+0x80: call to co=
py_iovec_from_user.part.0() with UACCESS enabled
    1    lib/iov_iter.o: warning: objtool: __import_iovec+0x13b: call to co=
py_iovec_from_user.part.0() with UACCESS enabled
    1    lib/iov_iter.o: warning: objtool: .altinstr_replacement+0x1f: redu=
ndant UACCESS disable

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig+debug (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings,=
 0 section mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    lib/iov_iter.o: warning: objtool: .altinstr_replacement+0x1f: redundant=
 UACCESS disable
    lib/iov_iter.o: warning: objtool: iovec_from_user+0x80: call to copy_io=
vec_from_user.part.0() with UACCESS enabled
    lib/iov_iter.o: warning: objtool: __import_iovec+0x13b: call to copy_io=
vec_from_user.part.0() with UACCESS enabled

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
allnoconfig (x86_64, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
ar7_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
aspeed_g4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, clang-17) =E2=80=94 PASS, 0 errors, 3 warnings, 0=
 section mismatches

Warnings:
    <stdin>:1567:2: warning: syscall cachestat not implemented [-W#warnings]
    #warning syscall cachestat not implemented
    1 warning generated.

---------------------------------------------------------------------------=
-----
assabet_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
ath25_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
ath79_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
axm55xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

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
bcm2835_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
bcm47xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
bigsur_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
bmips_stb_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
cavium_octeon_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 6 warnings=
, 0 section mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config (arm64, clang-13=
) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chromebook=
 (arm64, clang-13) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 section mismatch=
es

Errors:
    drivers/nvme/host/ioctl.c:555:37: error: implicit declaration of functi=
on 'io_uring_sqe_cmd' is invalid in C99 [-Werror,-Wimplicit-function-declar=
ation]
    drivers/nvme/host/ioctl.c:555:31: error: incompatible integer to pointe=
r conversion initializing 'const struct nvme_uring_cmd *' with an expressio=
n of type 'int' [-Werror,-Wint-conversion]

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.config+arm64-chromeb=
ook (arm64, clang-13) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 section misma=
tches

Errors:
    drivers/nvme/host/ioctl.c:555:37: error: implicit declaration of functi=
on 'io_uring_sqe_cmd' is invalid in C99 [-Werror,-Wimplicit-function-declar=
ation]
    drivers/nvme/host/ioctl.c:555:31: error: incompatible integer to pointe=
r conversion initializing 'const struct nvme_uring_cmd *' with an expressio=
n of type 'int' [-Werror,-Wint-conversion]

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-qualcomm.flavour.config+arm64-chromeb=
ook (arm64, clang-13) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 section misma=
tches

Errors:
    drivers/nvme/host/ioctl.c:555:37: error: implicit declaration of functi=
on 'io_uring_sqe_cmd' is invalid in C99 [-Werror,-Wimplicit-function-declar=
ation]
    drivers/nvme/host/ioctl.c:555:31: error: incompatible integer to pointe=
r conversion initializing 'const struct nvme_uring_cmd *' with an expressio=
n of type 'int' [-Werror,-Wint-conversion]

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.config+arm64-chrom=
ebook (arm64, clang-13) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 section mis=
matches

Errors:
    drivers/nvme/host/ioctl.c:555:37: error: implicit declaration of functi=
on 'io_uring_sqe_cmd' is invalid in C99 [-Werror,-Wimplicit-function-declar=
ation]
    drivers/nvme/host/ioctl.c:555:31: error: incompatible integer to pointe=
r conversion initializing 'const struct nvme_uring_cmd *' with an expressio=
n of type 'int' [-Werror,-Wint-conversion]

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (arm, clang-13) =
=E2=80=94 PASS, 0 errors, 6 warnings, 0 section mismatches

Warnings:
    <stdin>:1567:2: warning: syscall cachestat not implemented [-W#warnings]
    #warning syscall cachestat not implemented
    1 warning generated.
    <stdin>:1567:2: warning: syscall cachestat not implemented [-W#warnings]
    #warning syscall cachestat not implemented
    1 warning generated.

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (arm, clang-1=
3) =E2=80=94 PASS, 0 errors, 6 warnings, 0 section mismatches

Warnings:
    <stdin>:1567:2: warning: syscall cachestat not implemented [-W#warnings]
    #warning syscall cachestat not implemented
    1 warning generated.
    <stdin>:1567:2: warning: syscall cachestat not implemented [-W#warnings]
    #warning syscall cachestat not implemented
    1 warning generated.

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-amd-stoneyridge.flavour.config+x86-chr=
omebook (x86_64, clang-13) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 section =
mismatches

Errors:
    drivers/nvme/host/ioctl.c:555:37: error: implicit declaration of functi=
on 'io_uring_sqe_cmd' is invalid in C99 [-Werror,-Wimplicit-function-declar=
ation]
    drivers/nvme/host/ioctl.c:555:31: error: incompatible integer to pointe=
r conversion initializing 'const struct nvme_uring_cmd *' with an expressio=
n of type 'int' [-Werror,-Wint-conversion]

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-intel-denverton.flavour.config+x86-chr=
omebook (x86_64, clang-13) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 section =
mismatches

Errors:
    drivers/nvme/host/ioctl.c:555:37: error: implicit declaration of functi=
on 'io_uring_sqe_cmd' is invalid in C99 [-Werror,-Wimplicit-function-declar=
ation]
    drivers/nvme/host/ioctl.c:555:31: error: incompatible integer to pointe=
r conversion initializing 'const struct nvme_uring_cmd *' with an expressio=
n of type 'int' [-Werror,-Wint-conversion]

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-intel-pineview.flavour.config+x86-chro=
mebook (x86_64, clang-13) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 section m=
ismatches

Errors:
    drivers/nvme/host/ioctl.c:555:37: error: implicit declaration of functi=
on 'io_uring_sqe_cmd' is invalid in C99 [-Werror,-Wimplicit-function-declar=
ation]
    drivers/nvme/host/ioctl.c:555:31: error: incompatible integer to pointe=
r conversion initializing 'const struct nvme_uring_cmd *' with an expressio=
n of type 'int' [-Werror,-Wint-conversion]

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config (x86_64, clang=
-13) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 section mismatches

Errors:
    drivers/nvme/host/ioctl.c:555:37: error: implicit declaration of functi=
on 'io_uring_sqe_cmd' is invalid in C99 [-Werror,-Wimplicit-function-declar=
ation]
    drivers/nvme/host/ioctl.c:555:31: error: incompatible integer to pointe=
r conversion initializing 'const struct nvme_uring_cmd *' with an expressio=
n of type 'int' [-Werror,-Wint-conversion]

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config+x86-chromebook=
 (x86_64, clang-13) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 section mismatc=
hes

Errors:
    drivers/nvme/host/ioctl.c:555:37: error: implicit declaration of functi=
on 'io_uring_sqe_cmd' is invalid in C99 [-Werror,-Wimplicit-function-declar=
ation]
    drivers/nvme/host/ioctl.c:555:31: error: incompatible integer to pointe=
r conversion initializing 'const struct nvme_uring_cmd *' with an expressio=
n of type 'int' [-Werror,-Wint-conversion]

---------------------------------------------------------------------------=
-----
cu1000-neo_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
cu1830-neo_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warning=
s, 0 section mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

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
defconfig+arm64-chromebook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 wa=
rnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook+kselftest (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 0 warnings, 0 section mismatches

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
exynos_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 6 warnings, 0 s=
ection mismatches

Errors:
    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=80=
=98-mhard-float=E2=80=99

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
gpr_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
h3600_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

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
hisi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
imx_v4_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
imxrt_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
ip22_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
ip27_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 6 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
ip28_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 6 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
ip32_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 6 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
loongson1b_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
loongson3_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 6 warnings, 0 s=
ection mismatches

Errors:
    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=80=
=98-mhard-float=E2=80=99

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
lpc18xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
lpc32xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
malta_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
maltasmvp_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
maltaup_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings,=
 0 section mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2=
 warnings, 0 section mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
netwinder_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
nommu_k210_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

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
omap2plus_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
omega2p_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
pic32mzda_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
pxa3xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
pxa910_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
pxa_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
rb532_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
sama7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
sp7021_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
sparc32_defconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
spear3xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
stm32_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

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
u8500_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

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
vexpress_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
vocore2_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0=
 section mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
wpcm450_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
ection mismatches

Warnings:
    vmlinux.o: warning: objtool: .altinstr_replacement+0x18c0: redundant UA=
CCESS disable
    vmlinux.o: warning: objtool: iovec_from_user+0x88: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled
    vmlinux.o: warning: objtool: __import_iovec+0x147: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled

---------------------------------------------------------------------------=
-----
x86_64_defconfig+debug (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 3 warning=
s, 0 section mismatches

Warnings:
    vmlinux.o: warning: objtool: .altinstr_replacement+0x1a6a: redundant UA=
CCESS disable
    vmlinux.o: warning: objtool: iovec_from_user+0x88: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled
    vmlinux.o: warning: objtool: __import_iovec+0x342: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled

---------------------------------------------------------------------------=
-----
x86_64_defconfig+rust-samples (x86_64, rustc-1.62) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, =
3 warnings, 0 section mismatches

Warnings:
    vmlinux.o: warning: objtool: .altinstr_replacement+0x18c0: redundant UA=
CCESS disable
    vmlinux.o: warning: objtool: iovec_from_user+0x88: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled
    vmlinux.o: warning: objtool: __import_iovec+0x147: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook+amdgpu (x86_64, gcc-10) =E2=80=94 PASS, 0 e=
rrors, 3 warnings, 0 section mismatches

Warnings:
    vmlinux.o: warning: objtool: .altinstr_replacement+0x18c0: redundant UA=
CCESS disable
    vmlinux.o: warning: objtool: iovec_from_user+0x88: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled
    vmlinux.o: warning: objtool: __import_iovec+0x147: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86_kvm_guest (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 3=
 warnings, 0 section mismatches

Warnings:
    vmlinux.o: warning: objtool: .altinstr_replacement+0x18c0: redundant UA=
CCESS disable
    vmlinux.o: warning: objtool: iovec_from_user+0x88: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled
    vmlinux.o: warning: objtool: __import_iovec+0x147: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled

---
For more info write to <info@kernelci.org>
