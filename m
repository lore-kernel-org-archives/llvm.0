Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA4F538A
	for <llvm@lists.linux.dev>; Wed, 26 Apr 2023 18:19:53 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-246fdb97191so5200982a91.0
        for <llvm@lists.linux.dev>; Wed, 26 Apr 2023 11:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1682533192; x=1685125192;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=acVLp2KdFIHDtnWfFbUtAF0zCTCq0TWMlXB41sSgVkE=;
        b=kDhHhFyRJrKh54EAdMCki1ou10RKQVHgBtvH28lHeb9L9EOLkbIwWhqXNRuhOFwm4b
         nzvh3h4RnviefYqDkNGj3GSvHOUd+Q77+tdEPX5oLhrGnFtE7tpLw8k2D2smC/WWb6RH
         mNc1sWn3BpNdWE8rcmfgoc3qDiLw9fJHXaIXb595ESiRordqA5iWuopMk2Z64UAUU5CD
         dlJRVttQkQOX/FvJAKVgQzhVWt1f2zhOnIiMZMUufkKDT6VzSRY1+7VgejvU16zMiKrR
         4G9YQX01Isdn19nJcBqjOvEYDSemgKQrLKpVIuaobFTRyJalgBzAAhoJcPTyogwc6osu
         B/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682533192; x=1685125192;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=acVLp2KdFIHDtnWfFbUtAF0zCTCq0TWMlXB41sSgVkE=;
        b=i9aANvIuGRn0/zTkS2NlcZvnFrpHl7MPQyB1sdrMNiOId/Hu9bs2jHq2aVE4fqeA3h
         vAlkG62L6dqH68eQYlW0X/zfJrhwdSyYFi9Y93iduUpA98ofd3ud1PEdUU9VWbuJ71Wc
         zs2lBFV7Mkw1qp3hPgt3AXkJQXHBL5ZxgUQ3kARj5bdm5hTaMsMQc7Bly6Y6jMqgR8+A
         XXlLkru3UOEdU9FCgzmYmu40LGJp4jRegoJPKd9Mrph6BQeNzJFrxr4+KpcQ9FFLuUhY
         kejKb0IYCpk1dgBLD3cF3b7lzl4n3JoX5pUN0UqbzR3FEVYCm+t28++Mi9sp2KA0Ahcg
         W5Xg==
X-Gm-Message-State: AAQBX9fS4MZ+CNDdjspm/fvZjOn+MB5AJodf8DKT6v87+kQelUyyMi6M
	kZFwWF1I+5MrVrVFBI6sowYYsaLWn7oD0/qY45HQdQ==
X-Google-Smtp-Source: AKy350bkJbJXYQ1S4V6TouXgtDP7W7XCXP4xzrAA62y11A5wCJub6/Lgb/9DDV+DTwUiamJ0Rh69qA==
X-Received: by 2002:a17:90a:4b42:b0:247:944d:b75e with SMTP id o2-20020a17090a4b4200b00247944db75emr21764009pjl.12.1682533191426;
        Wed, 26 Apr 2023 11:19:51 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w14-20020a1709029a8e00b00183c6784704sm10229583plp.291.2023.04.26.11.19.50
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 11:19:50 -0700 (PDT)
Message-ID: <64496b46.170a0220.2c2e0.483f@mx.google.com>
Date: Wed, 26 Apr 2023 11:19:50 -0700 (PDT)
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
X-Kernelci-Kernel: next-20230426
X-Kernelci-Report-Type: build
Subject: next/master build: 138 builds: 11 failed, 127 passed, 12 errors,
 167 warnings (next-20230426)
To: llvm@lists.linux.dev
From: "kernelci.org bot" <bot@kernelci.org>

next/master build: 138 builds: 11 failed, 127 passed, 12 errors, 167 warnin=
gs (next-20230426)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20230426/

Tree: next
Branch: master
Git Describe: next-20230426
Git Commit: b7455b10da762f2d447678c88e37cc1eb6cb45ee
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 8 unique architectures

Build Failures Detected:

arm64:
    cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config: (clang-13) =
FAIL
    cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chrome=
book: (clang-13) FAIL
    cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.config+arm64-chr=
omebook: (clang-13) FAIL
    allmodconfig: (clang-17) FAIL

arm:
    allmodconfig: (clang-17) FAIL
    rpc_defconfig: (gcc-10) FAIL

i386:
    allmodconfig: (clang-17) FAIL

mips:
    decstation_64_defconfig: (gcc-10) FAIL

riscv:
    nommu_k210_sdcard_defconfig: (clang-17) FAIL
    nommu_k210_defconfig: (gcc-10) FAIL
    nommu_k210_sdcard_defconfig: (gcc-10) FAIL

Errors and Warnings Detected:

arc:
    axs103_defconfig (gcc-10): 2 warnings
    hsdk_defconfig (gcc-10): 2 warnings
    vdk_hs38_defconfig (gcc-10): 2 warnings
    vdk_hs38_smp_defconfig (gcc-10): 2 warnings

arm64:
    allmodconfig (clang-17): 1 error, 1 warning
    cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config (clang-13): =
1 error, 1 warning
    cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chrome=
book (clang-13): 1 error, 1 warning
    cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.config+arm64-chr=
omebook (clang-13): 1 error, 1 warning
    defconfig+arm64-chromebook (clang-13): 3 warnings

arm:
    allmodconfig (clang-17): 1 error, 1 warning
    aspeed_g5_defconfig (gcc-10): 2 warnings
    aspeed_g5_defconfig (clang-17): 3 warnings
    at91_dt_defconfig (gcc-10): 2 warnings
    axm55xx_defconfig (gcc-10): 2 warnings
    bcm2835_defconfig (gcc-10): 2 warnings
    davinci_all_defconfig (gcc-10): 2 warnings
    hisi_defconfig (gcc-10): 2 warnings
    imxrt_defconfig (gcc-10): 2 warnings
    ixp4xx_defconfig (gcc-10): 2 warnings
    milbeaut_m10v_defconfig (gcc-10): 2 warnings
    mmp2_defconfig (gcc-10): 2 warnings
    moxart_defconfig (gcc-10): 2 warnings
    multi_v7_defconfig+CONFIG_SMP=3Dn (gcc-10): 2 warnings
    mvebu_v5_defconfig (gcc-10): 2 warnings
    nhk8815_defconfig (gcc-10): 2 warnings
    orion5x_defconfig (gcc-10): 2 warnings
    rpc_defconfig (gcc-10): 2 errors
    s3c6400_defconfig (gcc-10): 2 warnings
    sama7_defconfig (gcc-10): 2 warnings
    socfpga_defconfig (gcc-10): 2 warnings
    sp7021_defconfig (gcc-10): 2 warnings
    spear13xx_defconfig (gcc-10): 2 warnings
    spear6xx_defconfig (gcc-10): 2 warnings
    spitz_defconfig (gcc-10): 2 warnings
    stm32_defconfig (gcc-10): 2 warnings
    sunxi_defconfig (gcc-10): 2 warnings
    tegra_defconfig (gcc-10): 2 warnings
    u8500_defconfig (gcc-10): 2 warnings
    vexpress_defconfig (gcc-10): 2 warnings
    vf610m4_defconfig (gcc-10): 2 warnings
    vt8500_v6_v7_defconfig (gcc-10): 2 warnings

i386:
    allmodconfig (clang-17): 1 error, 1 warning

mips:
    32r2el_defconfig (gcc-10): 2 warnings
    32r2el_defconfig+debug (gcc-10): 2 warnings
    bmips_be_defconfig (gcc-10): 2 warnings
    bmips_stb_defconfig (gcc-10): 2 warnings
    cavium_octeon_defconfig (gcc-10): 2 warnings
    ci20_defconfig (gcc-10): 2 warnings
    cobalt_defconfig (gcc-10): 2 warnings
    cu1830-neo_defconfig (gcc-10): 2 warnings
    db1xxx_defconfig (gcc-10): 2 warnings
    decstation_64_defconfig (gcc-10): 2 warnings
    decstation_defconfig (gcc-10): 2 warnings
    decstation_r4k_defconfig (gcc-10): 2 warnings
    fuloong2e_defconfig (gcc-10): 1 error, 2 warnings
    gcw0_defconfig (gcc-10): 2 warnings
    ip27_defconfig (gcc-10): 2 warnings
    jazz_defconfig (gcc-10): 2 warnings
    loongson1c_defconfig (gcc-10): 2 warnings
    pic32mzda_defconfig (gcc-10): 2 warnings
    rm200_defconfig (gcc-10): 2 warnings
    rs90_defconfig (gcc-10): 2 warnings

riscv:
    defconfig (gcc-10): 2 warnings
    nommu_k210_defconfig (gcc-10): 1 error
    nommu_k210_sdcard_defconfig (clang-17): 1 error
    nommu_k210_sdcard_defconfig (gcc-10): 1 error
    rv32_defconfig (gcc-10): 2 warnings
    rv32_defconfig (clang-17): 3 warnings

sparc:
    allnoconfig (gcc-10): 1 warning
    sparc32_defconfig (gcc-10): 2 warnings
    sparc64_defconfig (gcc-10): 6 warnings
    sparc64_defconfig+debug (gcc-10): 4 warnings
    sparc64_defconfig+kselftest (gcc-10): 4 warnings
    tinyconfig (gcc-10): 1 warning

x86_64:
    allnoconfig (gcc-10): 3 warnings
    x86_64_defconfig (gcc-10): 3 warnings
    x86_64_defconfig+amdgpu (gcc-10): 3 warnings
    x86_64_defconfig+crypto (gcc-10): 3 warnings
    x86_64_defconfig+ima (gcc-10): 3 warnings
    x86_64_defconfig+x86-chromebook (gcc-10): 3 warnings
    x86_64_defconfig+x86-chromebook+amdgpu (gcc-10): 3 warnings
    x86_64_defconfig+x86_kvm_guest (gcc-10): 3 warnings

Errors summary:

    6    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: error: variable =
'ret' is uninitialized when used here [-Werror,-Wuninitialized]
    3    ERROR: modpost: Section mismatches detected.
    1    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=
=80=98-mhard-float=E2=80=99
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=
=3D0x'
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=
=3D0x'

Warnings summary:

    53   fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=
=99 [-Wunused-variable]
    53   fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=
=99 [-Wunused-variable]
    8    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    7    vmlinux.o: warning: objtool: iovec_from_user+0x6d: call to copy_io=
vec_from_user.part.0() with UACCESS enabled
    7    vmlinux.o: warning: objtool: __import_iovec+0x1b8: call to copy_io=
vec_from_user.part.0() with UACCESS enabled
    7    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:216:12: note: initializ=
e the variable 'ret' to silence this warning
    6    vmlinux.o: warning: objtool: .altinstr_replacement+0x1bea: redunda=
nt UACCESS disable
    6    fs/ext4/super.c:5200:15: warning: unused variable 'i' [-Wunused-va=
riable]
    6    fs/ext4/super.c:1262:6: warning: unused variable 'i' [-Wunused-var=
iable]
    2    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version genera=
tion failed, symbol will not be versioned.
    2    2 warnings generated.
    1    vmlinux.o: warning: objtool: .altinstr_replacement+0x1bfe: redunda=
nt UACCESS disable
    1    lib/iov_iter.o: warning: objtool: iovec_from_user.part.0+0x52: cal=
l to copy_iovec_from_user.part.0() with UACCESS enabled
    1    lib/iov_iter.o: warning: objtool: __import_iovec+0x171: call to co=
py_iovec_from_user.part.0() with UACCESS enabled
    1    lib/iov_iter.o: warning: objtool: .altinstr_replacement+0x1f: redu=
ndant UACCESS disable
    1    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: warning: variabl=
e 'ret' is uninitialized when used here [-Wuninitialized]
    1    1 warning generated.

Section mismatches summary:

    6    WARNING: modpost: vmlinux.o: section mismatch in reference: smp_ca=
llin (section: .text) -> probe_vendor_features (section: .init.text)

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
32r2el_defconfig+debug (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings,=
 0 section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-17) =E2=80=94 FAIL, 1 error, 1 warning, 0 section =
mismatches

Errors:
    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: error: variable 'ret'=
 is uninitialized when used here [-Werror,-Wuninitialized]

Warnings:
    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:216:12: note: initialize the=
 variable 'ret' to silence this warning

---------------------------------------------------------------------------=
-----
allmodconfig (i386, clang-17) =E2=80=94 FAIL, 1 error, 1 warning, 0 section=
 mismatches

Errors:
    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: error: variable 'ret'=
 is uninitialized when used here [-Werror,-Wuninitialized]

Warnings:
    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:216:12: note: initialize the=
 variable 'ret' to silence this warning

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-17) =E2=80=94 FAIL, 1 error, 1 warning, 0 sectio=
n mismatches

Errors:
    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: error: variable 'ret'=
 is uninitialized when used here [-Werror,-Wuninitialized]

Warnings:
    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:216:12: note: initialize the=
 variable 'ret' to silence this warning

---------------------------------------------------------------------------=
-----
allnoconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

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
allnoconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    lib/iov_iter.o: warning: objtool: .altinstr_replacement+0x1f: redundant=
 UACCESS disable
    lib/iov_iter.o: warning: objtool: iovec_from_user.part.0+0x52: call to =
copy_iovec_from_user.part.0() with UACCESS enabled
    lib/iov_iter.o: warning: objtool: __import_iovec+0x171: call to copy_io=
vec_from_user.part.0() with UACCESS enabled

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
ar7_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, clang-17) =E2=80=94 PASS, 0 errors, 3 warnings, 0=
 section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable 'i' [-Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable 'i' [-Wunused-variabl=
e]
    2 warnings generated.

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
ath79_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
axm55xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
axs103_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable 'i' [-Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable 'i' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
bcm2835_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

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
bmips_be_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
bmips_stb_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
cavium_octeon_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings=
, 0 section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config (arm64, clang-13=
) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mismatches

Errors:
    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: error: variable 'ret'=
 is uninitialized when used here [-Werror,-Wuninitialized]

Warnings:
    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:216:12: note: initialize the=
 variable 'ret' to silence this warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chromebook=
 (arm64, clang-13) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mismatches

Errors:
    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: error: variable 'ret'=
 is uninitialized when used here [-Werror,-Wuninitialized]

Warnings:
    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:216:12: note: initialize the=
 variable 'ret' to silence this warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.config+arm64-chromeb=
ook (arm64, clang-13) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mismatc=
hes

Errors:
    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: error: variable 'ret'=
 is uninitialized when used here [-Werror,-Wuninitialized]

Warnings:
    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:216:12: note: initialize the=
 variable 'ret' to silence this warning

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
cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (arm, clang-13) =
=E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (arm, clang-1=
3) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-intel-denverton.flavour.config+x86-chr=
omebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-intel-pineview.flavour.config+x86-chro=
mebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config (x86_64, clang=
-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config+x86-chromebook=
 (x86_64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatc=
hes

---------------------------------------------------------------------------=
-----
cu1830-neo_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-10) =E2=80=94 FAIL, 0 errors, 2 warnings=
, 0 section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warning=
s, 0 section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section m=
ismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: smp_callin =
(section: .text) -> probe_vendor_features (section: .init.text)

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 error=
s, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 3 wa=
rnings, 0 section mismatches

Warnings:
    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: warning: variable 're=
t' is uninitialized when used here [-Wuninitialized]
    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:216:12: note: initialize the=
 variable 'ret' to silence this warning
    1 warning generated.

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook+kselftest (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 2 warnings, 0 s=
ection mismatches

Errors:
    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=80=
=98-mhard-float=E2=80=99

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
gcw0_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

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
hisi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
hsdk_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable 'i' [-Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable 'i' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
imxrt_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

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
ip27_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
ip32_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
loongson1c_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

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
milbeaut_m10v_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings,=
 0 section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

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
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2=
 warnings, 0 section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

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
nhk8815_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
nommu_k210_defconfig (riscv, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0=
 section mismatches

Errors:
    ERROR: modpost: Section mismatches detected.

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: smp_callin =
(section: .text) -> probe_vendor_features (section: .init.text)

---------------------------------------------------------------------------=
-----
nommu_k210_sdcard_defconfig (riscv, clang-17) =E2=80=94 FAIL, 1 error, 0 wa=
rnings, 0 section mismatches

Errors:
    ERROR: modpost: Section mismatches detected.

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: smp_callin =
(section: .text) -> probe_vendor_features (section: .init.text)

---------------------------------------------------------------------------=
-----
nommu_k210_sdcard_defconfig (riscv, gcc-10) =E2=80=94 FAIL, 1 error, 0 warn=
ings, 0 section mismatches

Errors:
    ERROR: modpost: Section mismatches detected.

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: smp_callin =
(section: .text) -> probe_vendor_features (section: .init.text)

---------------------------------------------------------------------------=
-----
nsimosci_hs_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
pic32mzda_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

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
rbtx49xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, gcc-10) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 section=
 mismatches

Errors:
    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=3D0x'
    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=3D0x'

---------------------------------------------------------------------------=
-----
rs90_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
rt305x_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
rv32_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: smp_callin =
(section: .text) -> probe_vendor_features (section: .init.text)

---------------------------------------------------------------------------=
-----
rv32_defconfig (riscv, clang-17) =E2=80=94 PASS, 0 errors, 3 warnings, 0 se=
ction mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable 'i' [-Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable 'i' [-Wunused-variabl=
e]
    2 warnings generated.

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: smp_callin =
(section: .text) -> probe_vendor_features (section: .init.text)

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
sama7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
sb1250_swarm_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
sp7021_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
sparc32_defconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
sparc64_defconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 6 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.

---------------------------------------------------------------------------=
-----
sparc64_defconfig+debug (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 4 warning=
s, 0 section mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
sparc64_defconfig+kselftest (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 4 war=
nings, 0 section mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
stm32_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
tinyconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
vdk_hs38_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable 'i' [-Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable 'i' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
vdk_hs38_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, =
0 section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable 'i' [-Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable 'i' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
vocore2_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, =
0 section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
ection mismatches

Warnings:
    vmlinux.o: warning: objtool: .altinstr_replacement+0x1bea: redundant UA=
CCESS disable
    vmlinux.o: warning: objtool: iovec_from_user+0x6d: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled
    vmlinux.o: warning: objtool: __import_iovec+0x1b8: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled

---------------------------------------------------------------------------=
-----
x86_64_defconfig+amdgpu (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnin=
gs, 0 section mismatches

Warnings:
    vmlinux.o: warning: objtool: .altinstr_replacement+0x1bea: redundant UA=
CCESS disable
    vmlinux.o: warning: objtool: iovec_from_user+0x6d: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled
    vmlinux.o: warning: objtool: __import_iovec+0x1b8: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled

---------------------------------------------------------------------------=
-----
x86_64_defconfig+crypto (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnin=
gs, 0 section mismatches

Warnings:
    vmlinux.o: warning: objtool: .altinstr_replacement+0x1bfe: redundant UA=
CCESS disable
    vmlinux.o: warning: objtool: iovec_from_user+0x6d: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled
    vmlinux.o: warning: objtool: __import_iovec+0x1b8: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled

---------------------------------------------------------------------------=
-----
x86_64_defconfig+ima (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings,=
 0 section mismatches

Warnings:
    vmlinux.o: warning: objtool: .altinstr_replacement+0x1bea: redundant UA=
CCESS disable
    vmlinux.o: warning: objtool: iovec_from_user+0x6d: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled
    vmlinux.o: warning: objtool: __import_iovec+0x1b8: call to copy_iovec_f=
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
    vmlinux.o: warning: objtool: .altinstr_replacement+0x1bea: redundant UA=
CCESS disable
    vmlinux.o: warning: objtool: iovec_from_user+0x6d: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled
    vmlinux.o: warning: objtool: __import_iovec+0x1b8: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook+amdgpu (x86_64, gcc-10) =E2=80=94 PASS, 0 e=
rrors, 3 warnings, 0 section mismatches

Warnings:
    vmlinux.o: warning: objtool: .altinstr_replacement+0x1bea: redundant UA=
CCESS disable
    vmlinux.o: warning: objtool: iovec_from_user+0x6d: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled
    vmlinux.o: warning: objtool: __import_iovec+0x1b8: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86_kvm_guest (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 3=
 warnings, 0 section mismatches

Warnings:
    vmlinux.o: warning: objtool: .altinstr_replacement+0x1bea: redundant UA=
CCESS disable
    vmlinux.o: warning: objtool: iovec_from_user+0x6d: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled
    vmlinux.o: warning: objtool: __import_iovec+0x1b8: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled

---
For more info write to <info@kernelci.org>
