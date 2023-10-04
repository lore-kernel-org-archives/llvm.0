Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7404E1856
	for <llvm@lists.linux.dev>; Wed,  4 Oct 2023 07:11:45 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-577fb90bb76so1012626a12.2
        for <llvm@lists.linux.dev>; Wed, 04 Oct 2023 00:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1696403504; x=1697008304; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QD+hfsr6DvU+m1Wg0FpAQe/H++2IvwBuCepWVewJZ9o=;
        b=MutZ7Gp1V2sLT8lTdYDEQNhWBhhoC0e5ITweCBvLUaIoTO0XKFBm44qm/or4pT/mQL
         jdpTtvLG66QNI4QT7QrsZrUOmjCSfIV/3nuQ8VY+maXvfBsYu/6L8gxjs1Tvp3GitNFD
         J4TQ7hC9SNOWFhfB5WDKH8ImfgjP0/QlRxzzZa55oUOsvzkg9CwU5xZjznVQlL1E9yhx
         S7M00YlU2wC13+IrrASYSGYUFCgaX4tUuI971r21SZ+Z4LfzoiUk1PqOnWZm7eyKT0Ac
         oy+1NN2N0ViVNojbtp/voJHRte4XUuCgrOvDiEieMSDDAbFOcLDHGTOl1FGcseVv2xbK
         4IPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696403504; x=1697008304;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QD+hfsr6DvU+m1Wg0FpAQe/H++2IvwBuCepWVewJZ9o=;
        b=frrTGAjgamrBSZbmoW/3nhPoVZxc//W5M+JpUkn1fNKG/li7WrJhQ/4NXGbc0UPoaY
         in4yk2l++FVtk5a8ILRVMSXGnHp/L0llzFSiogsOveVRcboqL9eOm9z240TRbi65A/fX
         rWgWHVp5zIwMsUEPlE+QDoQY91vQnx7ZInDM6WAeWMidMe921mvImp2UIPiQtFPzN+x6
         evlLejgUGSnCWc+gm+hqZ2nfFOuBbDAmkdcPiu+CswcNFIJdvNYPzs4YLM3diHypo8m9
         A2YgzVbcZoIagV5H+MN8/LEF6gLhpTyBGa9GLeqbKlEW2UJyYxnEZFrOFMEEyTQf1/sa
         IMjw==
X-Gm-Message-State: AOJu0YwcrjnsvGX5aSRuq1EyfUmod4QUYdWbGFMsue2n8pSslut861j7
	OqkA/GEaVV/Ee4pbBNalq3We8esuX1BUSRjhJSmkbQ==
X-Google-Smtp-Source: AGHT+IG+CH8YF2xPGMNznvF0XS5YhNoeG+R0eIOYGI9eGfLG3CQtEx3PwLB0OAZhpFvaXWJMhmW1CA==
X-Received: by 2002:a05:6a20:394a:b0:13d:df16:cf29 with SMTP id r10-20020a056a20394a00b0013ddf16cf29mr1783902pzg.15.1696403503108;
        Wed, 04 Oct 2023 00:11:43 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id i15-20020a63b30f000000b00563826c66eesm2317622pgf.61.2023.10.04.00.11.41
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 00:11:42 -0700 (PDT)
Message-ID: <651d102e.630a0220.3f0b.5ea6@mx.google.com>
Date: Wed, 04 Oct 2023 00:11:42 -0700 (PDT)
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
X-Kernelci-Kernel: next-20231004
X-Kernelci-Report-Type: build
Subject: next/master build: 184 builds: 3 failed, 181 passed, 7 errors,
 79 warnings (next-20231004)
To: llvm@lists.linux.dev
From: "kernelci.org bot" <bot@kernelci.org>

next/master build: 184 builds: 3 failed, 181 passed, 7 errors, 79 warnings =
(next-20231004)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20231004/

Tree: next
Branch: master
Git Describe: next-20231004
Git Commit: 33b64befb1a28bca3f5a9ed9807d2f87e976c63a
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 8 unique architectures

Build Failures Detected:

arc:
    haps_hs_smp_defconfig+kselftest: (gcc-10) FAIL

arm:
    rpc_defconfig: (gcc-10) FAIL

mips:
    cavium_octeon_defconfig: (gcc-10) FAIL

Errors and Warnings Detected:

arc:
    haps_hs_smp_defconfig+kselftest (gcc-10): 1 error

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (gcc-10): 3 warnings

arm:
    ixp4xx_defconfig (gcc-10): 3 warnings
    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (gcc-10): 3 warnings
    rpc_defconfig (gcc-10): 2 errors

i386:

mips:
    ath25_defconfig (gcc-10): 3 warnings
    ath79_defconfig (gcc-10): 3 warnings
    bcm63xx_defconfig (gcc-10): 3 warnings
    bigsur_defconfig (gcc-10): 3 warnings
    bmips_be_defconfig (gcc-10): 3 warnings
    cavium_octeon_defconfig (gcc-10): 4 errors, 6 warnings
    ip22_defconfig (gcc-10): 3 warnings
    ip27_defconfig (gcc-10): 3 warnings
    ip28_defconfig (gcc-10): 3 warnings
    ip32_defconfig (gcc-10): 3 warnings
    rbtx49xx_defconfig (gcc-10): 3 warnings
    sb1250_swarm_defconfig (gcc-10): 3 warnings

riscv:

sparc:
    allnoconfig (gcc-10): 4 warnings
    sparc32_defconfig (gcc-10): 5 warnings
    sparc64_defconfig (gcc-10): 7 warnings
    sparc64_defconfig+debug (gcc-10): 5 warnings
    sparc64_defconfig+kselftest (gcc-10): 5 warnings
    tinyconfig (gcc-10): 4 warnings

x86_64:
    x86_64_defconfig+kselftest (rustc-1.71): 1 warning

Errors summary:

    1    fs/proc/task_mmu.c:2104:21: error: 'HPAGE_SIZE' undeclared (first =
use in this function); did you mean 'PAGE_SIZE'?
    1    drivers/staging/octeon/ethernet.c:801:8: error: variable =E2=80=98=
imode=E2=80=99 has initializer but incomplete type
    1    drivers/staging/octeon/ethernet.c:801:35: error: storage size of =
=E2=80=98imode=E2=80=99 isn=E2=80=99t known
    1    drivers/staging/octeon/ethernet.c:205:30: error: storage size of =
=E2=80=98tx_status=E2=80=99 isn=E2=80=99t known
    1    drivers/staging/octeon/ethernet.c:204:30: error: storage size of =
=E2=80=98rx_status=E2=80=99 isn=E2=80=99t known
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=
=3D0x'
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=
=3D0x'

Warnings summary:

    63   scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=
=98__endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointe=
r target type [-Wdiscarded-qualifiers]
    10   <stdin>:1519:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    2    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version genera=
tion failed, symbol will not be versioned.
    1    vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x23: relocation to=
 !ENDBR: .text+0x14b6ab
    1    drivers/staging/octeon/ethernet.c:801:35: warning: unused variable=
 =E2=80=98imode=E2=80=99 [-Wunused-variable]
    1    drivers/staging/octeon/ethernet.c:205:30: warning: unused variable=
 =E2=80=98tx_status=E2=80=99 [-Wunused-variable]
    1    drivers/staging/octeon/ethernet.c:204:30: warning: unused variable=
 =E2=80=98rx_status=E2=80=99 [-Wunused-variable]

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
32r2el_defconfig+debug (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warni=
ngs, 0 section mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 section=
 mismatches

Warnings:
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

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
am200epdkit_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

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
ath25_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]

---------------------------------------------------------------------------=
-----
ath79_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]

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
bcm2835_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
bcm47xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
bcm63xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 se=
ction mismatches

Warnings:
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]

---------------------------------------------------------------------------=
-----
bigsur_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]

---------------------------------------------------------------------------=
-----
bmips_be_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
ection mismatches

Warnings:
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]

---------------------------------------------------------------------------=
-----
bmips_stb_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
cavium_octeon_defconfig (mips, gcc-10) =E2=80=94 FAIL, 4 errors, 6 warnings=
, 0 section mismatches

Errors:
    drivers/staging/octeon/ethernet.c:204:30: error: storage size of =E2=80=
=98rx_status=E2=80=99 isn=E2=80=99t known
    drivers/staging/octeon/ethernet.c:205:30: error: storage size of =E2=80=
=98tx_status=E2=80=99 isn=E2=80=99t known
    drivers/staging/octeon/ethernet.c:801:8: error: variable =E2=80=98imode=
=E2=80=99 has initializer but incomplete type
    drivers/staging/octeon/ethernet.c:801:35: error: storage size of =E2=80=
=98imode=E2=80=99 isn=E2=80=99t known

Warnings:
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    drivers/staging/octeon/ethernet.c:205:30: warning: unused variable =E2=
=80=98tx_status=E2=80=99 [-Wunused-variable]
    drivers/staging/octeon/ethernet.c:204:30: warning: unused variable =E2=
=80=98rx_status=E2=80=99 [-Wunused-variable]
    drivers/staging/octeon/ethernet.c:801:35: warning: unused variable =E2=
=80=98imode=E2=80=99 [-Wunused-variable]

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
collie_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
db1xxx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
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
defconfig (riscv, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

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
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-17) =E2=80=94 PASS, 0 er=
rors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 error=
s, 3 warnings, 0 section mismatches

Warnings:
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]

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
defconfig+arm64-chromebook+videodec (arm64, gcc-10) =E2=80=94 PASS, 0 error=
s, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+debug (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+videodec (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
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
haps_hs_smp_defconfig+kselftest (arc, gcc-10) =E2=80=94 FAIL, 1 error, 0 wa=
rnings, 0 section mismatches

Errors:
    fs/proc/task_mmu.c:2104:21: error: 'HPAGE_SIZE' undeclared (first use i=
n this function); did you mean 'PAGE_SIZE'?

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
ip22_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]

---------------------------------------------------------------------------=
-----
ip27_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]

---------------------------------------------------------------------------=
-----
ip28_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]

---------------------------------------------------------------------------=
-----
ip32_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]

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
lemote2f_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

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
loongson2k_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
loongson3_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

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
multi_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-10) =E2=80=94 PASS, =
0 errors, 3 warnings, 0 section mismatches

Warnings:
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]

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
multi_v7_defconfig+kselftest (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

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
orion5x_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
pic32mzda_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

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
rb532_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
ection mismatches

Warnings:
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]

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
rv32_defconfig (riscv, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

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
sb1250_swarm_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings,=
 0 section mismatches

Warnings:
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]

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
sparc32_defconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0 s=
ection mismatches

Warnings:
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
sparc64_defconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 7 warnings, 0 s=
ection mismatches

Warnings:
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.

---------------------------------------------------------------------------=
-----
sparc64_defconfig+debug (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 5 warning=
s, 0 section mismatches

Warnings:
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
sparc64_defconfig+kselftest (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 5 war=
nings, 0 section mismatches

Warnings:
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
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
tinyconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
tinyconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 section =
mismatches

Warnings:
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

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
vexpress_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

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
wpcm450_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, rustc-1.71) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

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
x86_64_defconfig+kselftest (x86_64, rustc-1.71) =E2=80=94 PASS, 0 errors, 1=
 warning, 0 section mismatches

Warnings:
    vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x23: relocation to !END=
BR: .text+0x14b6ab

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 war=
nings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+rust (x86_64, rustc-1.71) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+rust-samples (x86_64, rustc-1.71) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, =
0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook+kselftest (x86_64, gcc-10) =E2=80=94 PASS, =
0 errors, 0 warnings, 0 section mismatches

---
For more info write to <info@kernelci.org>
