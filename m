Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2FA17CE
	for <llvm@lists.linux.dev>; Thu, 23 Mar 2023 04:13:00 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id z19so10773728plo.2
        for <llvm@lists.linux.dev>; Wed, 22 Mar 2023 21:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1679544779;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=E6kdgdsJazUM5sci8JahR0dUzXBqTqFNtmta29tfieM=;
        b=IU4xtvN9R2rn2mP/JII1W5yQeztVG3weqd1uBwU7AqDEwqbBlqK3SBkKMsaNdXfX5Q
         iBinqqyzsuZG4DD/Thc33Su9CWChkRzTtxCSwJI0ER1pC2DCHOdNsy/P+1Fn5Aa9OQlA
         G/UgKR97rZ+8RkR9MdGBruP6jGRt/yR2EFnUyAnfHNBqGuUnoo0HGtv/1oZyHCa7zNVQ
         YPJGDAKy6HWSdycrzS7ZlQGokWnIk7HA27aJQGrAZ1pH//aGxk0DNxJqzEE4a014dW/g
         GPCmGSX/w7WNq2+YJWSfxn+Od28BERg8z75TdcgVDkQHVJ+UW3n0keMhCLoZZt3C5MzQ
         fGzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679544779;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E6kdgdsJazUM5sci8JahR0dUzXBqTqFNtmta29tfieM=;
        b=C44VWlEUKeWa7i2KAB70NuEDxopQcWJBY0MsM8aSo3g+8CUUZ8bLso/C+8zgkEPpzz
         4cG6Eo+HYYMdF4w4l/ZTjOdH2eGM9xEX1U0hjLMUfpJJnBQULXvPzogs9lfw+QpO6ggI
         t8NI2x72kfu24fjg+EVJIvOCmfg/u+PCe62hmayko3LOe96NSb9JIVzq0Q6D4lfZAU4k
         MJJfxLtXzmJj/lSeG/ChozJX96F3wcIOLYhn9Z45xWfUzHJeWjJV0j/hway60KED1BNR
         5tL9hMsVkHkEwQF9Tq/zFBLc9oF3Hw+O0ayqe3zLYEasla4rY72mp31PwDa2Hb5rnruY
         cYlw==
X-Gm-Message-State: AO0yUKVo1u+lD0GZOlFnxpAltQt6aPOr0Vn0Mm8nU9f1feEk/IU/qUdg
	4eTz7c+0RQgR41jePgtN5XxVLbTYNINF+NYlxH2oag==
X-Google-Smtp-Source: AK7set+ncu/7c66HKbKRXM0s9vhJNDAuWR4Kazo79VJFUw88ochMphzawtdZ66QdtvmX/syTvMn4HA==
X-Received: by 2002:a17:902:f550:b0:19e:7b09:bd4d with SMTP id h16-20020a170902f55000b0019e7b09bd4dmr6200991plf.47.1679544779064;
        Wed, 22 Mar 2023 21:12:59 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id je9-20020a170903264900b001a065d3ea3bsm11232440plb.295.2023.03.22.21.12.57
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 21:12:58 -0700 (PDT)
Message-ID: <641bd1ca.170a0220.facf.434f@mx.google.com>
Date: Wed, 22 Mar 2023 21:12:58 -0700 (PDT)
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
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20230323
Subject: next/master build: 18 builds: 13 failed, 5 passed, 14 errors,
 23 warnings (next-20230323)
To: llvm@lists.linux.dev
From: "kernelci.org bot" <bot@kernelci.org>

next/master build: 18 builds: 13 failed, 5 passed, 14 errors, 23 warnings (=
next-20230323)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20230323/

Tree: next
Branch: master
Git Describe: next-20230323
Git Commit: 7c4a254d78f89546d0e74a40617ef24c6151c8d1
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 5 unique architectures

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

arm:
    cros://chromeos-5.10/armel/chromiumos-arm.flavour.config: (clang-13) FA=
IL
    cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config: (clang-1=
3) FAIL

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
    x86_64_defconfig+x86-chromebook: (clang-13) FAIL

Errors and Warnings Detected:

arm64:
    cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config (clang-13): =
1 error, 1 warning
    cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chrome=
book (clang-13): 1 error, 1 warning
    cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.config+arm64-chr=
omebook (clang-13): 1 error, 1 warning
    cros://chromeos-5.10/arm64/chromiumos-qualcomm.flavour.config+arm64-chr=
omebook (clang-13): 1 error, 1 warning
    cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.config+arm64-c=
hromebook (clang-13): 1 error, 1 warning
    defconfig+arm64-chromebook (clang-13): 7 warnings

arm:
    cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (clang-13): 1 =
error, 1 warning
    cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (clang-13=
): 1 error, 1 warning

mips:

sparc:
    allnoconfig (gcc-10): 1 warning
    sparc64_defconfig+kselftest (gcc-10): 1 error, 2 warnings

x86_64:
    cros://chromeos-5.10/x86_64/chromeos-amd-stoneyridge.flavour.config+x86=
-chromebook (clang-13): 1 error, 1 warning
    cros://chromeos-5.10/x86_64/chromeos-intel-denverton.flavour.config+x86=
-chromebook (clang-13): 1 error, 1 warning
    cros://chromeos-5.10/x86_64/chromeos-intel-pineview.flavour.config+x86-=
chromebook (clang-13): 1 error, 1 warning
    cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config (clang-13)=
: 1 error, 1 warning
    cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config+x86-chrome=
book (clang-13): 1 error, 1 warning
    x86_64_defconfig+x86-chromebook (clang-13): 1 error, 1 warning

Errors summary:

    13   mm/mmap.c:939:11: error: variable 'next' is used uninitialized whe=
never 'if' condition is false [-Werror,-Wsometimes-uninitialized]

Warnings summary:

    14   mm/mmap.c:912:36: note: initialize the variable 'next' to silence =
this warning
    1    mm/vmalloc.c:3543:6: warning: variable 'remains' is used uninitial=
ized whenever 'if' condition is true [-Wsometimes-uninitialized]
    1    mm/vmalloc.c:3539:6: warning: variable 'remains' is used uninitial=
ized whenever 'if' condition is true [-Wsometimes-uninitialized]
    1    mm/vmalloc.c:3524:16: note: initialize the variable 'remains' to s=
ilence this warning
    1    mm/mmap.c:939:11: warning: variable 'next' is used uninitialized w=
henever 'if' condition is false [-Wsometimes-uninitialized]
    1    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    1    2 warnings generated.
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
ath25_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
bmips_be_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config (arm64, clang-13=
) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mismatches

Errors:
    mm/mmap.c:939:11: error: variable 'next' is used uninitialized whenever=
 'if' condition is false [-Werror,-Wsometimes-uninitialized]

Warnings:
    mm/mmap.c:912:36: note: initialize the variable 'next' to silence this =
warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chromebook=
 (arm64, clang-13) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mismatches

Errors:
    mm/mmap.c:939:11: error: variable 'next' is used uninitialized whenever=
 'if' condition is false [-Werror,-Wsometimes-uninitialized]

Warnings:
    mm/mmap.c:912:36: note: initialize the variable 'next' to silence this =
warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.config+arm64-chromeb=
ook (arm64, clang-13) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mismatc=
hes

Errors:
    mm/mmap.c:939:11: error: variable 'next' is used uninitialized whenever=
 'if' condition is false [-Werror,-Wsometimes-uninitialized]

Warnings:
    mm/mmap.c:912:36: note: initialize the variable 'next' to silence this =
warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-qualcomm.flavour.config+arm64-chromeb=
ook (arm64, clang-13) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mismatc=
hes

Errors:
    mm/mmap.c:939:11: error: variable 'next' is used uninitialized whenever=
 'if' condition is false [-Werror,-Wsometimes-uninitialized]

Warnings:
    mm/mmap.c:912:36: note: initialize the variable 'next' to silence this =
warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.config+arm64-chrom=
ebook (arm64, clang-13) =E2=80=94 FAIL, 1 error, 1 warning, 0 section misma=
tches

Errors:
    mm/mmap.c:939:11: error: variable 'next' is used uninitialized whenever=
 'if' condition is false [-Werror,-Wsometimes-uninitialized]

Warnings:
    mm/mmap.c:912:36: note: initialize the variable 'next' to silence this =
warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (arm, clang-13) =
=E2=80=94 FAIL, 1 error, 1 warning, 0 section mismatches

Errors:
    mm/mmap.c:939:11: error: variable 'next' is used uninitialized whenever=
 'if' condition is false [-Werror,-Wsometimes-uninitialized]

Warnings:
    mm/mmap.c:912:36: note: initialize the variable 'next' to silence this =
warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (arm, clang-1=
3) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mismatches

Errors:
    mm/mmap.c:939:11: error: variable 'next' is used uninitialized whenever=
 'if' condition is false [-Werror,-Wsometimes-uninitialized]

Warnings:
    mm/mmap.c:912:36: note: initialize the variable 'next' to silence this =
warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-amd-stoneyridge.flavour.config+x86-chr=
omebook (x86_64, clang-13) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mi=
smatches

Errors:
    mm/mmap.c:939:11: error: variable 'next' is used uninitialized whenever=
 'if' condition is false [-Werror,-Wsometimes-uninitialized]

Warnings:
    mm/mmap.c:912:36: note: initialize the variable 'next' to silence this =
warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-intel-denverton.flavour.config+x86-chr=
omebook (x86_64, clang-13) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mi=
smatches

Errors:
    mm/mmap.c:939:11: error: variable 'next' is used uninitialized whenever=
 'if' condition is false [-Werror,-Wsometimes-uninitialized]

Warnings:
    mm/mmap.c:912:36: note: initialize the variable 'next' to silence this =
warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-intel-pineview.flavour.config+x86-chro=
mebook (x86_64, clang-13) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mis=
matches

Errors:
    mm/mmap.c:939:11: error: variable 'next' is used uninitialized whenever=
 'if' condition is false [-Werror,-Wsometimes-uninitialized]

Warnings:
    mm/mmap.c:912:36: note: initialize the variable 'next' to silence this =
warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config (x86_64, clang=
-13) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mismatches

Errors:
    mm/mmap.c:939:11: error: variable 'next' is used uninitialized whenever=
 'if' condition is false [-Werror,-Wsometimes-uninitialized]

Warnings:
    mm/mmap.c:912:36: note: initialize the variable 'next' to silence this =
warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config+x86-chromebook=
 (x86_64, clang-13) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mismatches

Errors:
    mm/mmap.c:939:11: error: variable 'next' is used uninitialized whenever=
 'if' condition is false [-Werror,-Wsometimes-uninitialized]

Warnings:
    mm/mmap.c:912:36: note: initialize the variable 'next' to silence this =
warning

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 7 wa=
rnings, 0 section mismatches

Warnings:
    mm/mmap.c:939:11: warning: variable 'next' is used uninitialized whenev=
er 'if' condition is false [-Wsometimes-uninitialized]
    mm/mmap.c:912:36: note: initialize the variable 'next' to silence this =
warning
    1 warning generated.
    mm/vmalloc.c:3543:6: warning: variable 'remains' is used uninitialized =
whenever 'if' condition is true [-Wsometimes-uninitialized]
    mm/vmalloc.c:3539:6: warning: variable 'remains' is used uninitialized =
whenever 'if' condition is true [-Wsometimes-uninitialized]
    mm/vmalloc.c:3524:16: note: initialize the variable 'remains' to silenc=
e this warning
    2 warnings generated.

---------------------------------------------------------------------------=
-----
gpr_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
ip32_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
sparc64_defconfig+kselftest (sparc, gcc-10) =E2=80=94 FAIL, 1 error, 2 warn=
ings, 0 section mismatches

Errors:
    arch/sparc/include/asm/percpu_64.h:19:25: error: =E2=80=98__local_per_c=
pu_offset=E2=80=99 undeclared (first use in this function); did you mean =
=E2=80=98per_cpu_offset=E2=80=99?

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    arch/sparc/include/asm/current.h:18:30: warning: call-clobbered registe=
r used for global register variable

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, clang-13) =E2=80=94 FAIL, 1 error,=
 1 warning, 0 section mismatches

Errors:
    mm/mmap.c:939:11: error: variable 'next' is used uninitialized whenever=
 'if' condition is false [-Werror,-Wsometimes-uninitialized]

Warnings:
    mm/mmap.c:912:36: note: initialize the variable 'next' to silence this =
warning

---
For more info write to <info@kernelci.org>
