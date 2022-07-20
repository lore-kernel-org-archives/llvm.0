Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B27853A4
	for <llvm@lists.linux.dev>; Wed, 20 Jul 2022 14:12:06 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id h132so16481771pgc.10
        for <llvm@lists.linux.dev>; Wed, 20 Jul 2022 07:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=QpZZx7ydIJqtbmjO1/Eh9nIb8LaVqKd2orn8z+o2Ufk=;
        b=CwbhOuOOOhlKfWnOEDFcbxGG/y3unxh78pR9BWOO6G28nGJG/S7pLgsNtd3Sd03Ozv
         dOoSez0EzpKUP02Gi2wcS1IHJZmP1QlzwjfrLkvTc9emd3/Z1gjlnCVKqZgdRMTQI7ss
         n3VpKv6RU4Y9oQc54pn1UzS5hg4DF+YyvQzn+5A7xGu8Ez6jgMxO4/Ii4vRNBVr0e3an
         bXuJz/4PWkr8x41b84R6ibJVueRvPjRWRRhZGr1RamTp6jhNTjgfNlqMD+nMvUzOvqf7
         TvmWTpytA+5Xv+hzBlnLajFk+mdtaykH7lTUJVTzHrcmsuypvl4N2rGYQmF0sqJ7P17Z
         LsXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=QpZZx7ydIJqtbmjO1/Eh9nIb8LaVqKd2orn8z+o2Ufk=;
        b=Fd1NwufeGr5/5H8kf11BPQi1IykwkcZAjkCoYxyqP4tOMyKgv1m4XU7lfbtYRWXIB5
         zEuVVJWONMwRVLtK1QvKFhwG+nYdscfVZ0YHM+1/fd5zgS1ZKZ9908uXFBuPb7vtEcCa
         LIZDI1ZjgJkzptyb5zIny+u/k2/aiEC+GKijTZViwBnUZOuszqcF8TE14w4uUvDV2XQp
         VaN4Z+acbzEO8Ptu86LBLneSnlbn/XVMS1J7iE95YpQpkPin2fvs3cqpvbMYGbnV7bCt
         AU745emI3h5dterp2r7zaA1ZbLUIvXf5itxEIjuySpYfnsOkyzGzHB9zDuEsjMXhxzwF
         lp5g==
X-Gm-Message-State: AJIora+lYj1lNbOsmPzn1YEpMKfkJ2Z6aI7unnNVihmI89s6XLjpswWS
	7/SSdeYJH39wOwVeZF/8NBV9GCSFqYTa7LbZfF8=
X-Google-Smtp-Source: AGRyM1sgVU9sb8vxYy9egroaaBCUV+w8WRWbiiUy/NCb6aRTL7xy66uC3WGwqpgxhe1M4SHq6VFigQ==
X-Received: by 2002:a63:8bc2:0:b0:41a:3c3:2ee1 with SMTP id j185-20020a638bc2000000b0041a03c32ee1mr17745555pge.142.1658326326009;
        Wed, 20 Jul 2022 07:12:06 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id v11-20020a1709029a0b00b0016bfea13321sm13748000plp.243.2022.07.20.07.12.05
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 07:12:05 -0700 (PDT)
Message-ID: <62d80d35.1c69fb81.6c7d9.4ab3@mx.google.com>
Date: Wed, 20 Jul 2022 07:12:05 -0700 (PDT)
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
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20220720
Subject: next/master build: 14 builds: 2 failed, 12 passed, 2 errors,
 10 warnings (next-20220720)
To: llvm@lists.linux.dev
From: "kernelci.org bot" <bot@kernelci.org>

next/master build: 14 builds: 2 failed, 12 passed, 2 errors, 10 warnings (n=
ext-20220720)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20220720/

Tree: next
Branch: master
Git Describe: next-20220720
Git Commit: 4ee7eaa411ee24d07fa83d97ca03fa6725c40d04
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 3 unique architectures

Build Failures Detected:

arm:
    cros://chromeos-5.10/armel/chromiumos-arm.flavour.config: (clang-13) FA=
IL
    cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config: (clang-1=
3) FAIL

Errors and Warnings Detected:

arm64:

arm:
    cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (clang-13): 1 =
error, 5 warnings
    cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (clang-13=
): 1 error, 5 warnings

x86_64:

Errors summary:

    2    lib/maple_tree.c:4300:20: error: stack frame size (1104) exceeds l=
imit (1024) in function 'mas_wr_modify' [-Werror,-Wframe-larger-than]

Warnings summary:

    10   clang: warning: argument unused during compilation: '-march=3Darmv=
7-a' [-Wunused-command-line-argument]

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

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
=E2=80=94 FAIL, 1 error, 5 warnings, 0 section mismatches

Errors:
    lib/maple_tree.c:4300:20: error: stack frame size (1104) exceeds limit =
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
    lib/maple_tree.c:4300:20: error: stack frame size (1104) exceeds limit =
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
defconfig+arm64-chromebook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 wa=
rnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---
For more info write to <info@kernelci.org>
