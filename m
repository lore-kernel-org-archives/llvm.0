Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40045233
	for <llvm@lists.linux.dev>; Thu,  2 Nov 2023 06:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="HuVLCT0Q"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3b3ec45d6e9so358471b6e.0
        for <llvm@lists.linux.dev>; Wed, 01 Nov 2023 23:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1698905884; x=1699510684; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ETss/SdSNoB8uYU3ulvroKECWSiiTfPbYWyUpCe/2co=;
        b=HuVLCT0Qbgr5ODK1pLmtFo0kpOo1uNXo1sfyw7YvyanKSzVDcFDC6h9BtIoz831yIT
         SbyUJ6IrV13mSm8bFwgSxcC6PAxc3822vdS6TkErwgROsNCwkBjhPzGKYtQ1elJnIytk
         Zd3VDDSO7oUznf36IIySzzK8FbjNa9rM8hwoMbiRL4ZHEnvYzP31CDKcaG3T7bbYkUKo
         Zi00sSKao1MchbZ/EbrIEQRAUopJ/fBpteApWpFZWZJ1ulG2eL+opefx2aAlk2MpGW2r
         m1RfnA8kgFJp/qn263FOhc5cuBYXAKO18q8eXJy8Azg6yl3eAFAjKqgnptmbePPixumw
         TRNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698905884; x=1699510684;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ETss/SdSNoB8uYU3ulvroKECWSiiTfPbYWyUpCe/2co=;
        b=dDNWFOD06+eFzv3iqWEdcZJEx2a69p8cFHKxaWHZ6jiDetmzdqHsRY2WIR7M8kq4xg
         SWm/6s2aENO/wFQG5m28MfgI42akX5+WqwJgW0gEWeh17wmNmjrq4q2XhDYXV3rEzk92
         n8sXC1DrVW0UbU/eYG3Jb6QzUtb7updd1OyTBST0RqTBLWMzoxCqMbXYHRA4c1Y31sdV
         tUeA2m2satpFhyJp7H/u36JU9YsO5XmfqedSf0g9l4RAx5RHUc8buKfn5RSlWEOPZxi5
         iOOEXdl2UP0Vidgv/G5BOwAz6NPhdO4RfIkP8LgfKRP6MdKav2zlLmbKD6g6lYde6SxY
         mhpA==
X-Gm-Message-State: AOJu0Yw5pCIvLLPXdy0aSCN6+uriZwbVsyN5I66jy/vnfDnx2o0Vay+y
	NWunmBvInHbZtQaqcI1ob6twt/QDmdYFJuHK3dYumA==
X-Google-Smtp-Source: AGHT+IGzY73L2P0J/q1U8GxrO3vfU4vEBbfcdw4XW72rMyDt2szJKg8ThPlBuvht9VYvTDmZiMRAXQ==
X-Received: by 2002:a05:6808:158e:b0:3b1:11c6:6cff with SMTP id t14-20020a056808158e00b003b111c66cffmr21159398oiw.43.1698905883659;
        Wed, 01 Nov 2023 23:18:03 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id n27-20020a056a000d5b00b006879493aca0sm2138415pfv.26.2023.11.01.23.18.01
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 23:18:02 -0700 (PDT)
Message-ID: <65433f1a.050a0220.9bd24.6861@mx.google.com>
Date: Wed, 01 Nov 2023 23:18:02 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20231102
X-Kernelci-Report-Type: build
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master build: 187 builds: 5 failed, 182 passed, 21 errors,
 75 warnings (next-20231102)
To: llvm@lists.linux.dev
From: "kernelci.org bot" <bot@kernelci.org>

next/master build: 187 builds: 5 failed, 182 passed, 21 errors, 75 warnings=
 (next-20231102)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20231102/

Tree: next
Branch: master
Git Describe: next-20231102
Git Commit: ab57716449b3438c0136f6f412a2e59e0cf037a9
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 8 unique architectures

Build Failures Detected:

arc:
    haps_hs_smp_defconfig+kselftest: (gcc-10) FAIL

arm:
    rpc_defconfig: (gcc-10) FAIL

mips:
    decstation_64_defconfig: (gcc-10) FAIL
    decstation_defconfig: (gcc-10) FAIL
    decstation_r4k_defconfig: (gcc-10) FAIL

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
    decstation_64_defconfig (gcc-10): 6 errors, 2 warnings
    decstation_defconfig (gcc-10): 6 errors, 2 warnings
    decstation_r4k_defconfig (gcc-10): 6 errors, 2 warnings

riscv:
    defconfig (gcc-10): 1 warning
    defconfig (clang-17): 1 warning
    defconfig+debug (gcc-10): 1 warning
    defconfig+kselftest (gcc-10): 1 warning

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
    x86_64_defconfig+kselftest (gcc-10): 2 warnings
    x86_64_defconfig+kselftest (rustc-1.73): 3 warnings
    x86_64_defconfig+rust (rustc-1.73): 2 warnings
    x86_64_defconfig+rust-samples (rustc-1.73): 2 warnings
    x86_64_defconfig+x86-board (gcc-10): 2 warnings
    x86_64_defconfig+x86-board+kselftest (gcc-10): 2 warnings

Errors summary:

    3    kernel/bpf/task_iter.c:947:2: error: implicit declaration of funct=
ion =E2=80=98css_task_iter_end=E2=80=99 [-Werror=3Dimplicit-function-declar=
ation]
    3    kernel/bpf/task_iter.c:938:9: error: implicit declaration of funct=
ion =E2=80=98css_task_iter_next=E2=80=99; did you mean =E2=80=98class_dev_i=
ter_next=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    3    kernel/bpf/task_iter.c:928:2: error: implicit declaration of funct=
ion =E2=80=98css_task_iter_start=E2=80=99; did you mean =E2=80=98task_seq_s=
tart=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    3    kernel/bpf/task_iter.c:925:53: error: invalid application of =E2=
=80=98sizeof=E2=80=99 to incomplete type =E2=80=98struct css_task_iter=E2=
=80=99
    3    kernel/bpf/task_iter.c:917:7: error: =E2=80=98CSS_TASK_ITER_PROCS=
=E2=80=99 undeclared (first use in this function)
    3    kernel/bpf/task_iter.c:917:29: error: =E2=80=98CSS_TASK_ITER_THREA=
DED=E2=80=99 undeclared (first use in this function)
    1    fs/proc/task_mmu.c:2099:21: error: 'HPAGE_SIZE' undeclared (first =
use in this function); did you mean 'PAGE_SIZE'?
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=
=3D0x'
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=
=3D0x'

Warnings summary:

    56   WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL=
 used for init symbol. Remove __init or EXPORT_SYMBOL.
    10   <stdin>:1519:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    3    kernel/bpf/task_iter.c:938:9: warning: returning =E2=80=98int=E2=
=80=99 from a function with return type =E2=80=98struct task_struct *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]
    3    cc1: some warnings being treated as errors
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
allnoconfig (i386, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

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
allnoconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

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
aspeed_g4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

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
decstation_64_defconfig (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 2 warnings=
, 0 section mismatches

Errors:
    kernel/bpf/task_iter.c:917:7: error: =E2=80=98CSS_TASK_ITER_PROCS=E2=80=
=99 undeclared (first use in this function)
    kernel/bpf/task_iter.c:917:29: error: =E2=80=98CSS_TASK_ITER_THREADED=
=E2=80=99 undeclared (first use in this function)
    kernel/bpf/task_iter.c:925:53: error: invalid application of =E2=80=98s=
izeof=E2=80=99 to incomplete type =E2=80=98struct css_task_iter=E2=80=99
    kernel/bpf/task_iter.c:928:2: error: implicit declaration of function =
=E2=80=98css_task_iter_start=E2=80=99; did you mean =E2=80=98task_seq_start=
=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    kernel/bpf/task_iter.c:938:9: error: implicit declaration of function =
=E2=80=98css_task_iter_next=E2=80=99; did you mean =E2=80=98class_dev_iter_=
next=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    kernel/bpf/task_iter.c:947:2: error: implicit declaration of function =
=E2=80=98css_task_iter_end=E2=80=99 [-Werror=3Dimplicit-function-declaratio=
n]

Warnings:
    kernel/bpf/task_iter.c:938:9: warning: returning =E2=80=98int=E2=80=99 =
from a function with return type =E2=80=98struct task_struct *=E2=80=99 mak=
es pointer from integer without a cast [-Wint-conversion]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 2 warnings, 0=
 section mismatches

Errors:
    kernel/bpf/task_iter.c:917:7: error: =E2=80=98CSS_TASK_ITER_PROCS=E2=80=
=99 undeclared (first use in this function)
    kernel/bpf/task_iter.c:917:29: error: =E2=80=98CSS_TASK_ITER_THREADED=
=E2=80=99 undeclared (first use in this function)
    kernel/bpf/task_iter.c:925:53: error: invalid application of =E2=80=98s=
izeof=E2=80=99 to incomplete type =E2=80=98struct css_task_iter=E2=80=99
    kernel/bpf/task_iter.c:928:2: error: implicit declaration of function =
=E2=80=98css_task_iter_start=E2=80=99; did you mean =E2=80=98task_seq_start=
=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    kernel/bpf/task_iter.c:938:9: error: implicit declaration of function =
=E2=80=98css_task_iter_next=E2=80=99; did you mean =E2=80=98class_dev_iter_=
next=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    kernel/bpf/task_iter.c:947:2: error: implicit declaration of function =
=E2=80=98css_task_iter_end=E2=80=99 [-Werror=3Dimplicit-function-declaratio=
n]

Warnings:
    kernel/bpf/task_iter.c:938:9: warning: returning =E2=80=98int=E2=80=99 =
from a function with return type =E2=80=98struct task_struct *=E2=80=99 mak=
es pointer from integer without a cast [-Wint-conversion]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 2 warning=
s, 0 section mismatches

Errors:
    kernel/bpf/task_iter.c:917:7: error: =E2=80=98CSS_TASK_ITER_PROCS=E2=80=
=99 undeclared (first use in this function)
    kernel/bpf/task_iter.c:917:29: error: =E2=80=98CSS_TASK_ITER_THREADED=
=E2=80=99 undeclared (first use in this function)
    kernel/bpf/task_iter.c:925:53: error: invalid application of =E2=80=98s=
izeof=E2=80=99 to incomplete type =E2=80=98struct css_task_iter=E2=80=99
    kernel/bpf/task_iter.c:928:2: error: implicit declaration of function =
=E2=80=98css_task_iter_start=E2=80=99; did you mean =E2=80=98task_seq_start=
=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    kernel/bpf/task_iter.c:938:9: error: implicit declaration of function =
=E2=80=98css_task_iter_next=E2=80=99; did you mean =E2=80=98class_dev_iter_=
next=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    kernel/bpf/task_iter.c:947:2: error: implicit declaration of function =
=E2=80=98css_task_iter_end=E2=80=99 [-Werror=3Dimplicit-function-declaratio=
n]

Warnings:
    kernel/bpf/task_iter.c:938:9: warning: returning =E2=80=98int=E2=80=99 =
from a function with return type =E2=80=98struct task_struct *=E2=80=99 mak=
es pointer from integer without a cast [-Wint-conversion]
    cc1: some warnings being treated as errors

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
defconfig (arm64, clang-17) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mi=
smatches

Warnings:
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.

---------------------------------------------------------------------------=
-----
defconfig (riscv, clang-17) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
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
defconfig+debug (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.

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
multi_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

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
nommu_k210_defconfig (riscv, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

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
tinyconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
tinyconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

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
x86_64_defconfig+kselftest (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 2 war=
nings, 0 section mismatches

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
