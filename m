Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56461C04
	for <llvm@lists.linux.dev>; Tue,  9 May 2023 07:02:39 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-643912bca6fso4336993b3a.0
        for <llvm@lists.linux.dev>; Tue, 09 May 2023 00:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1683615758; x=1686207758;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fASwKKhjJ1UD/MqD3p1uFJR8yRJBTUOne8HRKyITWJA=;
        b=TO/5PQAvO8lgEr48fxlhwIaFAQK5VO3q/0lp2bn+VvSAur5kQ+78Fs8mGKyGHc+ZCG
         C7ZsY+2m2cOK8JoSrCHpYtQk9CfEBzwStitiIwDibfEk6miejLABO6IOvHWbhrBxDIXv
         w9hQNgj2DD+CXgarc9D6YIpbpHuYOxHLWcwRF6zBnatvYLxJBLv/Se9pqi3+Qvn4cba3
         sYEERuYpFwIsii/xnz/G1NPkQz6eyCkGNGjtmfBzQZBcN8KOo/L9+gQqGiJ/G7y0IQim
         GX1g70k9p/05q622sXRX7KGHWAmRztvtT7mgmyyhwtphhOJGQ2G8RUm8e5Wdjro3cl0K
         KSCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683615758; x=1686207758;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fASwKKhjJ1UD/MqD3p1uFJR8yRJBTUOne8HRKyITWJA=;
        b=V4uJnraRzbJ7TfubqnqEFs8Iv47tdAxU5rwDzBJa3rU0EpqMzA7vMD5PaXTC/WNkmH
         82vDcKecb+0sc3+d/JXovaIkVPONzxUqd78rlRYAnkEfQsox9STFRHDpLQg0L5YBH/jv
         AlvxEjff2rz6q/WhICHt5KWIA2j/JlhRwhUaU7Qsqih546EW+McvACmtaNCumfil1/25
         FSx0l/f6GLTXg/ggnMWhaCoCQzH+WM0f3TJShehEgWPO393Qv+wGZKPG797RPwVLo6LW
         LG/lbnJA7NdROpBEWaHp/9x/rWjbQ//ZocmGvRmgAWSR9iZv3OAyIgfJRSNXd04dcFfC
         +ZdA==
X-Gm-Message-State: AC+VfDx30+nKGHTSiXCXqr34FvDWQBB8z8g0nyIOmrYw7xPAZRaoP0S7
	tl4PF5WKMcgZU2Ax8awoX1E+iF8gTcu8Nl7OY5L4qg==
X-Google-Smtp-Source: ACHHUZ47RM1uGPSFnmQXCaJfvu/EXbZ+JKHQkDpMsHDsUQPkKpnhJyxD+Fa5NlfGTSPsSGmUwykMkg==
X-Received: by 2002:a17:902:ce8d:b0:1ac:2c8b:a0da with SMTP id f13-20020a170902ce8d00b001ac2c8ba0damr16274336plg.51.1683615758504;
        Tue, 09 May 2023 00:02:38 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c6-20020a170902c1c600b001a194df5a58sm712870plc.167.2023.05.09.00.02.37
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 00:02:37 -0700 (PDT)
Message-ID: <6459f00d.170a0220.2ef86.15e1@mx.google.com>
Date: Tue, 09 May 2023 00:02:37 -0700 (PDT)
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
X-Kernelci-Kernel: next-20230509
X-Kernelci-Report-Type: build
Subject: next/master build: 14 builds: 0 failed, 14 passed,
 12 warnings (next-20230509)
To: llvm@lists.linux.dev
From: "kernelci.org bot" <bot@kernelci.org>

next/master build: 14 builds: 0 failed, 14 passed, 12 warnings (next-202305=
09)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20230509/

Tree: next
Branch: master
Git Describe: next-20230509
Git Commit: 47cba14ce6fc4f314bd814d07269d0c8de1e4ae6
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 3 unique architectures

Warnings Detected:

arm64:

arm:
    cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (clang-13): 6 =
warnings
    cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (clang-13=
): 6 warnings

x86_64:


Warnings summary:

    4    <stdin>:1567:2: warning: syscall cachestat not implemented [-W#war=
nings]
    4    1 warning generated.
    4    #warning syscall cachestat not implemented

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
