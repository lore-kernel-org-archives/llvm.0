Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FF37E
	for <llvm@lists.linux.dev>; Fri,  3 Nov 2023 06:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="JNnDf35+"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1cc330e8f58so14525435ad.3
        for <llvm@lists.linux.dev>; Thu, 02 Nov 2023 23:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1698994556; x=1699599356; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/v5ZfQMB6sMC51JxgjEVKk7lkodz4aMga39tFHfJ9Qw=;
        b=JNnDf35+jQhHzy0aONPiCFaW1HclFUb23iEdeJHyp/RipK5Rmu7/gopt8KOGMtULZG
         bNE1PzElzUOVqDAAYZ5ZNFv/+vwHXH+XSJwzoXERugnRnfUKy5yK5oe6d1jvysWZsN0m
         h1pJeszzB2iqdzhFAVa9zaxgaxor6zV0/k/mEc7xfLk/f/hlvZEQ+lfcf97dhxVY8L6C
         j/ms3XVzyZQeUe9nE9CXk9bM90XOy/2a5X8iat2x8CnK/84QrFUWv14rYrggnRfBAo+O
         HWFU/pjQz36nlOwbWHTqDFz0jmKPeScCrpKu56yYLu1A7CPHQcd2qVlBvUuNSKXKnhKR
         L9tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698994556; x=1699599356;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/v5ZfQMB6sMC51JxgjEVKk7lkodz4aMga39tFHfJ9Qw=;
        b=Dx943kOBX0aEHP4oNui2rSaE+PpV+JUgzjWcBhTh2vYyMSLPxJ2bXcY2qib8wBsIY/
         /m0nZ4LBuSI6h4s7h/6FqedPM+CUVLVLCMhsF+NwRopNLQ0MbQ5g8fT60BHLMwnCDPpZ
         ZdL6OtgTu6+i2l2DAYDs44ySQgimznp/rHhyJGmX86lIvmPdQ8LLr/ROvx5fvcq1K9BF
         rzNOjliwEAYRNl7LQ7RCjZ6oIHz014Zf6VQHR+1HVCbaDKfXYtfoa0hKdV5BK5A2/HIV
         xWPXWasaRegW9FQuRyQmpbCbFkvjYmutuwKycQbifJf2FuLymkqftwuYNH+0kmhDW+gv
         L2jw==
X-Gm-Message-State: AOJu0YwcIQxSSBB6qGQNNIQ/5ApMQ6p32YFnV7+DTm/cmhEXUCu4SwlO
	32w1OI96QKn34BY6LYQIRAXonOLOvMq9EEeei6a1Cw==
X-Google-Smtp-Source: AGHT+IHmJf9cMfkhOBR7Nx6k8R3sF1uibympnOu2tzKbDQES1qtHFgW7sG7PycBfrKyvWdo3keDxmg==
X-Received: by 2002:a17:902:dac9:b0:1cc:5612:85 with SMTP id q9-20020a170902dac900b001cc56120085mr14382329plx.45.1698994555027;
        Thu, 02 Nov 2023 23:55:55 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id ja21-20020a170902efd500b001bdeedd8579sm722351plb.252.2023.11.02.23.55.53
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 23:55:53 -0700 (PDT)
Message-ID: <65449979.170a0220.1c9b7.1c09@mx.google.com>
Date: Thu, 02 Nov 2023 23:55:53 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20231103
X-Kernelci-Report-Type: build
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master build: 192 builds: 17 failed, 175 passed, 18 errors,
 65 warnings (next-20231103)
To: llvm@lists.linux.dev
From: "kernelci.org bot" <bot@kernelci.org>

next/master build: 192 builds: 17 failed, 175 passed, 18 errors, 65 warning=
s (next-20231103)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20231103/

Tree: next
Branch: master
Git Describe: next-20231103
Git Commit: e27090b1413ff236ca1aec26d6b022149115de2c
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 8 unique architectures

Build Failures Detected:

arc:
    haps_hs_smp_defconfig+kselftest: (gcc-10) FAIL

arm:
    rpc_defconfig: (gcc-10) FAIL

riscv:
    allnoconfig: (clang-17) FAIL
    defconfig: (clang-17) FAIL
    nommu_k210_defconfig: (clang-17) FAIL
    nommu_k210_sdcard_defconfig: (clang-17) FAIL
    nommu_virt_defconfig: (clang-17) FAIL
    rv32_defconfig: (clang-17) FAIL
    allnoconfig: (gcc-10) FAIL
    defconfig: (gcc-10) FAIL
    defconfig+debug: (gcc-10) FAIL
    defconfig+kselftest: (gcc-10) FAIL
    nommu_k210_defconfig: (gcc-10) FAIL
    nommu_k210_sdcard_defconfig: (gcc-10) FAIL
    nommu_virt_defconfig: (gcc-10) FAIL
    rv32_defconfig: (gcc-10) FAIL
    tinyconfig: (gcc-10) FAIL

Errors and Warnings Detected:

arc:
    haps_hs_smp_defconfig+kselftest (gcc-10): 1 error

arm64:
    defconfig (gcc-10): 2 warnings
    defconfig (clang-17): 2 warnings
    defconfig+CONFIG_ARM64_16K_PAGES=3Dy (gcc-10): 2 warnings
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (gcc-10): 2 warnings
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (clang-17): 2 warnings
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy (gcc-10): 2 warnings
    defconfig+arm64-chromebook (gcc-10): 2 warnings
    defconfig+arm64-chromebook+kselftest (gcc-10): 2 warnings
    defconfig+arm64-chromebook+videodec (gcc-10): 2 warnings
    defconfig+debug (gcc-10): 2 warnings
    defconfig+kselftest (gcc-10): 2 warnings
    defconfig+videodec (gcc-10): 2 warnings

arm:
    rpc_defconfig (gcc-10): 2 errors

i386:
    i386_defconfig (clang-17): 2 warnings
    i386_defconfig (gcc-10): 2 warnings
    i386_defconfig+debug (gcc-10): 2 warnings
    i386_defconfig+kselftest (gcc-10): 2 warnings

mips:

riscv:
    allnoconfig (gcc-10): 1 error
    allnoconfig (clang-17): 1 error
    defconfig (clang-17): 1 error
    defconfig (gcc-10): 1 error
    defconfig+debug (gcc-10): 1 error
    defconfig+kselftest (gcc-10): 1 error
    nommu_k210_defconfig (gcc-10): 1 error
    nommu_k210_defconfig (clang-17): 1 error
    nommu_k210_sdcard_defconfig (clang-17): 1 error
    nommu_k210_sdcard_defconfig (gcc-10): 1 error
    nommu_virt_defconfig (gcc-10): 1 error
    nommu_virt_defconfig (clang-17): 1 error
    rv32_defconfig (clang-17): 1 error
    rv32_defconfig (gcc-10): 1 error
    tinyconfig (gcc-10): 1 error

sparc:
    allnoconfig (gcc-10): 1 warning
    sparc32_defconfig (gcc-10): 2 warnings
    sparc64_defconfig (gcc-10): 4 warnings
    sparc64_defconfig+debug (gcc-10): 2 warnings
    sparc64_defconfig+kselftest (gcc-10): 2 warnings
    tinyconfig (gcc-10): 1 warning

x86_64:
    x86_64_defconfig (clang-17): 2 warnings
    x86_64_defconfig (rustc-1.73): 2 warnings
    x86_64_defconfig (gcc-10): 2 warnings
    x86_64_defconfig+debug (gcc-10): 2 warnings
    x86_64_defconfig+kselftest (rustc-1.73): 3 warnings
    x86_64_defconfig+kselftest (gcc-10): 2 warnings
    x86_64_defconfig+rust (rustc-1.73): 2 warnings
    x86_64_defconfig+rust-samples (rustc-1.73): 2 warnings
    x86_64_defconfig+x86-board (gcc-10): 2 warnings
    x86_64_defconfig+x86-board+kselftest (gcc-10): 2 warnings

Errors summary:

    9    arch/riscv/kernel/cpufeature.c:562:6: error: conflicting types for=
 =E2=80=98check_unaligned_access=E2=80=99
    6    arch/riscv/kernel/cpufeature.c:562:6: error: conflicting types for=
 'check_unaligned_access'
    1    fs/proc/task_mmu.c:2099:21: error: 'HPAGE_SIZE' undeclared (first =
use in this function); did you mean 'PAGE_SIZE'?
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=
=3D0x'
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=
=3D0x'

Warnings summary:

    54   WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL=
 used for init symbol. Remove __init or EXPORT_SYMBOL.
    10   <stdin>:1519:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    2    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version genera=
tion failed, symbol will not be versioned.
    1    vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x23: relocation to=
 !ENDBR: .text+0x14c599

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
allnoconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
allnoconfig (riscv, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section =
mismatches

Errors:
    arch/riscv/kernel/cpufeature.c:562:6: error: conflicting types for =E2=
=80=98check_unaligned_access=E2=80=99

---------------------------------------------------------------------------=
-----
allnoconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (riscv, clang-17) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sectio=
n mismatches

Errors:
    arch/riscv/kernel/cpufeature.c:562:6: error: conflicting types for 'che=
ck_unaligned_access'

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
bcm2835_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

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
defconfig (riscv, clang-17) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section =
mismatches

Errors:
    arch/riscv/kernel/cpufeature.c:562:6: error: conflicting types for 'che=
ck_unaligned_access'

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section m=
ismatches

Warnings:
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section mi=
smatches

Errors:
    arch/riscv/kernel/cpufeature.c:562:6: error: conflicting types for =E2=
=80=98check_unaligned_access=E2=80=99

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-17) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_16K_PAGES=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 2 warnings, 0 section mismatches

Warnings:
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 2 warnings, 0 section mismatches

Warnings:
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-17) =E2=80=94 PASS, 0 er=
rors, 2 warnings, 0 section mismatches

Warnings:
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 error=
s, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 error=
s, 2 warnings, 0 section mismatches

Warnings:
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 2 warn=
ings, 0 section mismatches

Warnings:
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook+kselftest (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 2 warnings, 0 section mismatches

Warnings:
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook+videodec (arm64, gcc-10) =E2=80=94 PASS, 0 error=
s, 2 warnings, 0 section mismatches

Warnings:
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.

---------------------------------------------------------------------------=
-----
defconfig+debug (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.

---------------------------------------------------------------------------=
-----
defconfig+debug (riscv, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sect=
ion mismatches

Errors:
    arch/riscv/kernel/cpufeature.c:562:6: error: conflicting types for =E2=
=80=98check_unaligned_access=E2=80=99

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 =
section mismatches

Errors:
    arch/riscv/kernel/cpufeature.c:562:6: error: conflicting types for =E2=
=80=98check_unaligned_access=E2=80=99

---------------------------------------------------------------------------=
-----
defconfig+videodec (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.

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
    fs/proc/task_mmu.c:2099:21: error: 'HPAGE_SIZE' undeclared (first use i=
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
i386_defconfig (i386, clang-17) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.

---------------------------------------------------------------------------=
-----
i386_defconfig+debug (i386, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.

---------------------------------------------------------------------------=
-----
i386_defconfig+kselftest (i386, gcc-10) =E2=80=94 PASS, 0 errors, 2 warning=
s, 0 section mismatches

Warnings:
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.

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
ixp4xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
multi_v7_defconfig (arm, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

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
multi_v7_defconfig+debug (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

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
nommu_k210_defconfig (riscv, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0=
 section mismatches

Errors:
    arch/riscv/kernel/cpufeature.c:562:6: error: conflicting types for =E2=
=80=98check_unaligned_access=E2=80=99

---------------------------------------------------------------------------=
-----
nommu_k210_defconfig (riscv, clang-17) =E2=80=94 FAIL, 1 error, 0 warnings,=
 0 section mismatches

Errors:
    arch/riscv/kernel/cpufeature.c:562:6: error: conflicting types for 'che=
ck_unaligned_access'

---------------------------------------------------------------------------=
-----
nommu_k210_sdcard_defconfig (riscv, clang-17) =E2=80=94 FAIL, 1 error, 0 wa=
rnings, 0 section mismatches

Errors:
    arch/riscv/kernel/cpufeature.c:562:6: error: conflicting types for 'che=
ck_unaligned_access'

---------------------------------------------------------------------------=
-----
nommu_k210_sdcard_defconfig (riscv, gcc-10) =E2=80=94 FAIL, 1 error, 0 warn=
ings, 0 section mismatches

Errors:
    arch/riscv/kernel/cpufeature.c:562:6: error: conflicting types for =E2=
=80=98check_unaligned_access=E2=80=99

---------------------------------------------------------------------------=
-----
nommu_virt_defconfig (riscv, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0=
 section mismatches

Errors:
    arch/riscv/kernel/cpufeature.c:562:6: error: conflicting types for =E2=
=80=98check_unaligned_access=E2=80=99

---------------------------------------------------------------------------=
-----
nommu_virt_defconfig (riscv, clang-17) =E2=80=94 FAIL, 1 error, 0 warnings,=
 0 section mismatches

Errors:
    arch/riscv/kernel/cpufeature.c:562:6: error: conflicting types for 'che=
ck_unaligned_access'

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
rv32_defconfig (riscv, clang-17) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sec=
tion mismatches

Errors:
    arch/riscv/kernel/cpufeature.c:562:6: error: conflicting types for 'che=
ck_unaligned_access'

---------------------------------------------------------------------------=
-----
rv32_defconfig (riscv, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 secti=
on mismatches

Errors:
    arch/riscv/kernel/cpufeature.c:562:6: error: conflicting types for =E2=
=80=98check_unaligned_access=E2=80=99

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
sb1250_swarm_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

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
sparc32_defconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
sparc64_defconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.

---------------------------------------------------------------------------=
-----
sparc64_defconfig+debug (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warning=
s, 0 section mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
sparc64_defconfig+kselftest (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 2 war=
nings, 0 section mismatches

Warnings:
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
tinyconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
tinyconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
tinyconfig (riscv, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section m=
ismatches

Errors:
    arch/riscv/kernel/cpufeature.c:562:6: error: conflicting types for =E2=
=80=98check_unaligned_access=E2=80=99

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
tinyconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

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
x86_64_defconfig (x86_64, clang-17) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, rustc-1.73) =E2=80=94 PASS, 0 errors, 2 warnings,=
 0 section mismatches

Warnings:
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.

---------------------------------------------------------------------------=
-----
x86_64_defconfig+debug (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 2 warning=
s, 0 section mismatches

Warnings:
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, rustc-1.73) =E2=80=94 PASS, 0 errors, 3=
 warnings, 0 section mismatches

Warnings:
    vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x23: relocation to !END=
BR: .text+0x14c599
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 2 war=
nings, 0 section mismatches

Warnings:
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.

---------------------------------------------------------------------------=
-----
x86_64_defconfig+rust (x86_64, rustc-1.73) =E2=80=94 PASS, 0 errors, 2 warn=
ings, 0 section mismatches

Warnings:
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.

---------------------------------------------------------------------------=
-----
x86_64_defconfig+rust-samples (x86_64, rustc-1.73) =E2=80=94 PASS, 0 errors=
, 2 warnings, 0 section mismatches

Warnings:
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-board (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 2 war=
nings, 0 section mismatches

Warnings:
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-board+kselftest (x86_64, gcc-10) =E2=80=94 PASS, 0 err=
ors, 2 warnings, 0 section mismatches

Warnings:
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.

---
For more info write to <info@kernelci.org>
