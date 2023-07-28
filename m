Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D270AD45
	for <llvm@lists.linux.dev>; Fri, 28 Jul 2023 06:18:02 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-563d3e4f73cso967874a12.3
        for <llvm@lists.linux.dev>; Thu, 27 Jul 2023 23:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1690525081; x=1691129881;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sNxhTYkcMoh9ZKNvWNArVtU+L64SIZNqzZ85ABD+dNs=;
        b=POchvW7jWC4WyQUersYUu8Etf/d50NR4Ict4INXxm+t9lEA42cyJxXFxez+jRx34mK
         KXQeb1YTuY6MtDsupZlBZptBzSF1FzF9eAiQe77ZwhLANlO9Snkzu6UvOss6gcv84hlZ
         FqM7rrJEM/qgn14B6itoXTDuKq39F/kH4nMBx/ji8RE9H8oEv+X3uZaJfPOqfEKHyP9E
         lqmHxFMhLoIpZQyxxSqcSITV/aij/EdsjwhNMz2p7XxQNpMZ+MBMAHRnoBrHTxZBICei
         uJl78YkodwgGlDVg6Mc1jJbeycJ2ImvNTeml0xadeMIWCP1PyMCl5LDWpL9ZanhQLHNN
         ltnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690525081; x=1691129881;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sNxhTYkcMoh9ZKNvWNArVtU+L64SIZNqzZ85ABD+dNs=;
        b=ixUayuPKzanPvElWXEjg2rv55qSXF9FlemYeOzKwegdtZHzsDP4d0PEpzWgBBzwZCe
         d6w6I2thEV41w/obxJoAKIYa86POvNR6WjWBf9vuHTvqM8ncleYQ90GQRejAzyWS2vNC
         GNPRQx/GQAM9z6NRKeQIfwgzza0NL0/TlUaCv9jG37whc17O1blMDjQuIn4h9Dh9t3Fd
         BPTkjq5vsgnkjXxoQKyBYue/MFoscVRED0mCWrN/NB6PfxBkS0DzlESISSAh+ELYwl6G
         l59/tmEYsxxgSNkd1cPUoiNDXj8+nOr7XWhWbKt1LFyFjvOyF/RVglmJ0uBJVtofSFPK
         exnw==
X-Gm-Message-State: ABy/qLaq6L3zHNkLEofWvjyNGeW8Ti6WO8ZuEMMCAqEexvE7dhEK+Pao
	WesMHvyJiQ+VlnHNPnqp0RE8QKI0cm647S0dSvWNuw==
X-Google-Smtp-Source: APBJJlE9n/9iXqKduekrQhN+tN/HWTlOaclGhUyNR7xbd3vHswTcvxbGx3QG6ve7BPSH2f79kHDx8Q==
X-Received: by 2002:a17:90b:1806:b0:268:5203:b8b7 with SMTP id lw6-20020a17090b180600b002685203b8b7mr483253pjb.21.1690525081107;
        Thu, 27 Jul 2023 23:18:01 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id rj6-20020a17090b3e8600b00263dee538b1sm2027593pjb.25.2023.07.27.23.18.00
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 23:18:00 -0700 (PDT)
Message-ID: <64c35d98.170a0220.59510.3cf4@mx.google.com>
Date: Thu, 27 Jul 2023 23:18:00 -0700 (PDT)
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
X-Kernelci-Kernel: next-20230728
X-Kernelci-Report-Type: build
Subject: next/master build: 30 builds: 3 failed, 27 passed, 9 errors,
 6 warnings (next-20230728)
To: llvm@lists.linux.dev
From: "kernelci.org bot" <bot@kernelci.org>

next/master build: 30 builds: 3 failed, 27 passed, 9 errors, 6 warnings (ne=
xt-20230728)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20230728/

Tree: next
Branch: master
Git Describe: next-20230728
Git Commit: d7b3af5a77e8d8da28f435f313e069aea5bcf172
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm:
    rpc_defconfig: (gcc-10) FAIL

mips:
    xway_defconfig: (gcc-10) FAIL

x86_64:
    x86_64_defconfig+rust: (rustc-1.70) FAIL

Errors and Warnings Detected:

arc:

arm64:
    defconfig+arm64-chromebook (clang-13): 2 warnings

arm:
    rpc_defconfig (gcc-10): 8 errors

mips:
    xway_defconfig (gcc-10): 1 error, 1 warning

riscv:

sparc:
    allnoconfig (gcc-10): 1 warning
    sparc32_defconfig (gcc-10): 2 warnings

x86_64:

Errors summary:

    1    arch/mips/lantiq/xway/gptu.c:140:6: error: implicit declaration of=
 function =E2=80=98of_irq_to_resource_table=E2=80=99 [-Werror=3Dimplicit-fu=
nction-declaration]
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=
=3D0x'
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=
=3D0x'
    1    arch/arm/kernel/debug.S:84: Error: missing expression -- `ldr r2,=
=3D0x'
    1    arch/arm/kernel/debug.S:84: Error: missing expression -- `ldr r1,=
=3D0x'
    1    arch/arm/kernel/debug.S:118: Error: missing expression -- `ldr r3,=
=3D0x'
    1    arch/arm/kernel/debug.S:118: Error: missing expression -- `ldr r2,=
=3D0x'
    1    arch/arm/kernel/debug.S:110: Error: missing expression -- `ldr r2,=
=3D0x'
    1    arch/arm/kernel/debug.S:110: Error: missing expression -- `ldr r1,=
=3D0x'

Warnings summary:

    3    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    1    fs/btrfs/extent_io.c:232:16: warning: variable 'pages_processed' s=
et but not used [-Wunused-but-set-variable]
    1    cc1: all warnings being treated as errors
    1    1 warning generated.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
allnoconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
ath25_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config (arm64, clang-13=
) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chromebook=
 (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatch=
es

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.config+arm64-chromeb=
ook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section misma=
tches

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
cros://chromeos-5.10/x86_64/chromeos-amd-stoneyridge.flavour.config+x86-chr=
omebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

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
defconfig+arm64-chromebook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 2 wa=
rnings, 0 section mismatches

Warnings:
    fs/btrfs/extent_io.c:232:16: warning: variable 'pages_processed' set bu=
t not used [-Wunused-but-set-variable]
    1 warning generated.

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
haps_hs_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
lpc18xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

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
mps2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

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
nsimosci_hs_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
pxa910_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, gcc-10) =E2=80=94 FAIL, 8 errors, 0 warnings, 0 section=
 mismatches

Errors:
    arch/arm/kernel/debug.S:84: Error: missing expression -- `ldr r1,=3D0x'
    arch/arm/kernel/debug.S:84: Error: missing expression -- `ldr r2,=3D0x'
    arch/arm/kernel/debug.S:110: Error: missing expression -- `ldr r1,=3D0x'
    arch/arm/kernel/debug.S:110: Error: missing expression -- `ldr r2,=3D0x'
    arch/arm/kernel/debug.S:118: Error: missing expression -- `ldr r2,=3D0x'
    arch/arm/kernel/debug.S:118: Error: missing expression -- `ldr r3,=3D0x'
    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=3D0x'
    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=3D0x'

---------------------------------------------------------------------------=
-----
sparc32_defconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
vdk_hs38_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+rust (x86_64, rustc-1.70) =E2=80=94 FAIL, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
xway_defconfig (mips, gcc-10) =E2=80=94 FAIL, 1 error, 1 warning, 0 section=
 mismatches

Errors:
    arch/mips/lantiq/xway/gptu.c:140:6: error: implicit declaration of func=
tion =E2=80=98of_irq_to_resource_table=E2=80=99 [-Werror=3Dimplicit-functio=
n-declaration]

Warnings:
    cc1: all warnings being treated as errors

---
For more info write to <info@kernelci.org>
