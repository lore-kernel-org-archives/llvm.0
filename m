Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06852C9E
	for <llvm@lists.linux.dev>; Tue,  3 May 2022 11:18:45 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id w5-20020a17090aaf8500b001d74c754128so1952960pjq.0
        for <llvm@lists.linux.dev>; Tue, 03 May 2022 04:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=JAOKaeHhmTIbsWFL3eyHKt1v5gMa/DzMXtgKOC6T444=;
        b=Zoxx18p3LkVoPODa1ohmW2AWH4aCTYUEYtW2RCdcuHPwyrM82Qhdc3UUOeyQkoHq9F
         FtnZ4UsdtKnFWj+njdfPB8puRWkKaK1235BR5hCMwZrAn8RYDYKFjE6PV0MtGiyOmmV3
         y69F5Qb8roBU6i2f3+Sg0ifOA6yuBr7Y1D7UKR+PX8UibdIyl1pNS4P+raWx0dyjmVPj
         2IYuBUA7Ga8LbF+ifXKj3/Z/ldgkTrDy/7bY2TDCLm5DbE8e/ZdgpFG7E8Telg4COx+t
         82yxqJWggRyywYHAmWzLZa7XXGMd1mWKNtp20wN81FxRsstEx1a3McaKjBJvL1orczWb
         ddAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=JAOKaeHhmTIbsWFL3eyHKt1v5gMa/DzMXtgKOC6T444=;
        b=WHbjzaw1tnU0v/aNsdeVGmcIGye1upTA98QOyrZHWUkUU3QY8IOjDcpcR7YlX/lo5T
         W+hoJV7bN/MhsRaVjk5TdbKQe/mSy243uXof4RuO5+aBVSO9mhVZT4NHot/6i/pfS/Ut
         MAy2AJMymF/60qsCt+19MDhGVMuyMxFb6S6WL93zHJBCSWObYkAWuCV/v02EeKbQ9uff
         Cs1lyAsOoTN0BN7r8vdjg61/yTne5tW8QPQ7jvo5REpV8J/QNO8q4K98fUYXdPFyzrV1
         4hSHYwQd7KipSf5cSGvc3XMSSBniihqZQ/aCJ9lVx0H/n/p2XD4qdclmhH95V0P+h9JA
         3Mlw==
X-Gm-Message-State: AOAM5307V67vrp+0/DrzaIQM00G7kF3KVmcm2GcTUGAVP3sLIV/+ZiXO
	w0PBBs+eq+6ONbpf9ErAQrH1oaNE14VSc832SFU=
X-Google-Smtp-Source: ABdhPJwRglLHP1oC6BY/+a4GRxsmfxqXjjGjpExyGJ9d9mYCTRGps8I3hQtw4LOeqnm8c8SrSINn5g==
X-Received: by 2002:a17:90a:ce95:b0:1db:d423:4b76 with SMTP id g21-20020a17090ace9500b001dbd4234b76mr4105856pju.90.1651576724742;
        Tue, 03 May 2022 04:18:44 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e1-20020a17090a4a0100b001dc7623950csm1185868pjh.11.2022.05.03.04.18.43
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 04:18:44 -0700 (PDT)
Message-ID: <62710f94.1c69fb81.5fca0.3378@mx.google.com>
Date: Tue, 03 May 2022 04:18:44 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20220503
X-Kernelci-Report-Type: build
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master build: 14 builds: 13 failed, 1 passed, 25 errors,
 38 warnings (next-20220503)
To: llvm@lists.linux.dev
From: "kernelci.org bot" <bot@kernelci.org>

next/master build: 14 builds: 13 failed, 1 passed, 25 errors, 38 warnings (=
next-20220503)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20220503/

Tree: next
Branch: master
Git Describe: next-20220503
Git Commit: 44a2f39e611ac0bc1f17c288a583d7f2e5684aa7
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 3 unique architectures

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
2 errors, 2 warnings
    cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chrome=
book (clang-13): 2 errors, 2 warnings
    cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.config+arm64-chr=
omebook (clang-13): 2 errors, 2 warnings
    cros://chromeos-5.10/arm64/chromiumos-qualcomm.flavour.config+arm64-chr=
omebook (clang-13): 2 errors, 2 warnings
    cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.config+arm64-c=
hromebook (clang-13): 2 errors, 2 warnings
    defconfig+arm64-chromebook (clang-13): 3 warnings

arm:
    cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (clang-13): 2 =
errors, 7 warnings
    cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (clang-13=
): 2 errors, 7 warnings

x86_64:
    cros://chromeos-5.10/x86_64/chromeos-amd-stoneyridge.flavour.config+x86=
-chromebook (clang-13): 2 errors, 2 warnings
    cros://chromeos-5.10/x86_64/chromeos-intel-denverton.flavour.config+x86=
-chromebook (clang-13): 2 errors, 2 warnings
    cros://chromeos-5.10/x86_64/chromeos-intel-pineview.flavour.config+x86-=
chromebook (clang-13): 2 errors, 2 warnings
    cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config (clang-13)=
: 2 errors, 2 warnings
    cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config+x86-chrome=
book (clang-13): 2 errors, 2 warnings
    x86_64_defconfig+x86-chromebook (clang-13): 1 error, 1 warning

Errors summary:

    13   mm/shmem.c:1704:7: error: variable 'folio' is used uninitialized w=
henever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
    12   mm/shmem.c:2337:8: error: variable 'page' is uninitialized when us=
ed here [-Werror,-Wuninitialized]

Warnings summary:

    14   mm/shmem.c:1685:21: note: initialize the variable 'folio' to silen=
ce this warning
    12   mm/shmem.c:2318:19: note: initialize the variable 'page' to silenc=
e this warning
    10   clang: warning: argument unused during compilation: '-march=3Darmv=
7-a' [-Wunused-command-line-argument]
    1    mm/shmem.c:1704:7: warning: variable 'folio' is used uninitialized=
 whenever 'if' condition is true [-Wsometimes-uninitialized]
    1    1 warning generated.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config (arm64, clang-13=
) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 section mismatches

Errors:
    mm/shmem.c:1704:7: error: variable 'folio' is used uninitialized whenev=
er 'if' condition is true [-Werror,-Wsometimes-uninitialized]
    mm/shmem.c:2337:8: error: variable 'page' is uninitialized when used he=
re [-Werror,-Wuninitialized]

Warnings:
    mm/shmem.c:1685:21: note: initialize the variable 'folio' to silence th=
is warning
    mm/shmem.c:2318:19: note: initialize the variable 'page' to silence thi=
s warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chromebook=
 (arm64, clang-13) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 section mismatch=
es

Errors:
    mm/shmem.c:1704:7: error: variable 'folio' is used uninitialized whenev=
er 'if' condition is true [-Werror,-Wsometimes-uninitialized]
    mm/shmem.c:2337:8: error: variable 'page' is uninitialized when used he=
re [-Werror,-Wuninitialized]

Warnings:
    mm/shmem.c:1685:21: note: initialize the variable 'folio' to silence th=
is warning
    mm/shmem.c:2318:19: note: initialize the variable 'page' to silence thi=
s warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.config+arm64-chromeb=
ook (arm64, clang-13) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 section misma=
tches

Errors:
    mm/shmem.c:1704:7: error: variable 'folio' is used uninitialized whenev=
er 'if' condition is true [-Werror,-Wsometimes-uninitialized]
    mm/shmem.c:2337:8: error: variable 'page' is uninitialized when used he=
re [-Werror,-Wuninitialized]

Warnings:
    mm/shmem.c:1685:21: note: initialize the variable 'folio' to silence th=
is warning
    mm/shmem.c:2318:19: note: initialize the variable 'page' to silence thi=
s warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-qualcomm.flavour.config+arm64-chromeb=
ook (arm64, clang-13) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 section misma=
tches

Errors:
    mm/shmem.c:1704:7: error: variable 'folio' is used uninitialized whenev=
er 'if' condition is true [-Werror,-Wsometimes-uninitialized]
    mm/shmem.c:2337:8: error: variable 'page' is uninitialized when used he=
re [-Werror,-Wuninitialized]

Warnings:
    mm/shmem.c:1685:21: note: initialize the variable 'folio' to silence th=
is warning
    mm/shmem.c:2318:19: note: initialize the variable 'page' to silence thi=
s warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.config+arm64-chrom=
ebook (arm64, clang-13) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 section mis=
matches

Errors:
    mm/shmem.c:1704:7: error: variable 'folio' is used uninitialized whenev=
er 'if' condition is true [-Werror,-Wsometimes-uninitialized]
    mm/shmem.c:2337:8: error: variable 'page' is uninitialized when used he=
re [-Werror,-Wuninitialized]

Warnings:
    mm/shmem.c:1685:21: note: initialize the variable 'folio' to silence th=
is warning
    mm/shmem.c:2318:19: note: initialize the variable 'page' to silence thi=
s warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (arm, clang-13) =
=E2=80=94 FAIL, 2 errors, 7 warnings, 0 section mismatches

Errors:
    mm/shmem.c:1704:7: error: variable 'folio' is used uninitialized whenev=
er 'if' condition is true [-Werror,-Wsometimes-uninitialized]
    mm/shmem.c:2337:8: error: variable 'page' is uninitialized when used he=
re [-Werror,-Wuninitialized]

Warnings:
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    mm/shmem.c:1685:21: note: initialize the variable 'folio' to silence th=
is warning
    mm/shmem.c:2318:19: note: initialize the variable 'page' to silence thi=
s warning
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (arm, clang-1=
3) =E2=80=94 FAIL, 2 errors, 7 warnings, 0 section mismatches

Errors:
    mm/shmem.c:1704:7: error: variable 'folio' is used uninitialized whenev=
er 'if' condition is true [-Werror,-Wsometimes-uninitialized]
    mm/shmem.c:2337:8: error: variable 'page' is uninitialized when used he=
re [-Werror,-Wuninitialized]

Warnings:
    mm/shmem.c:1685:21: note: initialize the variable 'folio' to silence th=
is warning
    mm/shmem.c:2318:19: note: initialize the variable 'page' to silence thi=
s warning
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
omebook (x86_64, clang-13) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 section =
mismatches

Errors:
    mm/shmem.c:1704:7: error: variable 'folio' is used uninitialized whenev=
er 'if' condition is true [-Werror,-Wsometimes-uninitialized]
    mm/shmem.c:2337:8: error: variable 'page' is uninitialized when used he=
re [-Werror,-Wuninitialized]

Warnings:
    mm/shmem.c:1685:21: note: initialize the variable 'folio' to silence th=
is warning
    mm/shmem.c:2318:19: note: initialize the variable 'page' to silence thi=
s warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-intel-denverton.flavour.config+x86-chr=
omebook (x86_64, clang-13) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 section =
mismatches

Errors:
    mm/shmem.c:1704:7: error: variable 'folio' is used uninitialized whenev=
er 'if' condition is true [-Werror,-Wsometimes-uninitialized]
    mm/shmem.c:2337:8: error: variable 'page' is uninitialized when used he=
re [-Werror,-Wuninitialized]

Warnings:
    mm/shmem.c:1685:21: note: initialize the variable 'folio' to silence th=
is warning
    mm/shmem.c:2318:19: note: initialize the variable 'page' to silence thi=
s warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-intel-pineview.flavour.config+x86-chro=
mebook (x86_64, clang-13) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 section m=
ismatches

Errors:
    mm/shmem.c:1704:7: error: variable 'folio' is used uninitialized whenev=
er 'if' condition is true [-Werror,-Wsometimes-uninitialized]
    mm/shmem.c:2337:8: error: variable 'page' is uninitialized when used he=
re [-Werror,-Wuninitialized]

Warnings:
    mm/shmem.c:1685:21: note: initialize the variable 'folio' to silence th=
is warning
    mm/shmem.c:2318:19: note: initialize the variable 'page' to silence thi=
s warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config (x86_64, clang=
-13) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 section mismatches

Errors:
    mm/shmem.c:1704:7: error: variable 'folio' is used uninitialized whenev=
er 'if' condition is true [-Werror,-Wsometimes-uninitialized]
    mm/shmem.c:2337:8: error: variable 'page' is uninitialized when used he=
re [-Werror,-Wuninitialized]

Warnings:
    mm/shmem.c:1685:21: note: initialize the variable 'folio' to silence th=
is warning
    mm/shmem.c:2318:19: note: initialize the variable 'page' to silence thi=
s warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config+x86-chromebook=
 (x86_64, clang-13) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 section mismatc=
hes

Errors:
    mm/shmem.c:1704:7: error: variable 'folio' is used uninitialized whenev=
er 'if' condition is true [-Werror,-Wsometimes-uninitialized]
    mm/shmem.c:2337:8: error: variable 'page' is uninitialized when used he=
re [-Werror,-Wuninitialized]

Warnings:
    mm/shmem.c:1685:21: note: initialize the variable 'folio' to silence th=
is warning
    mm/shmem.c:2318:19: note: initialize the variable 'page' to silence thi=
s warning

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 3 wa=
rnings, 0 section mismatches

Warnings:
    mm/shmem.c:1704:7: warning: variable 'folio' is used uninitialized when=
ever 'if' condition is true [-Wsometimes-uninitialized]
    mm/shmem.c:1685:21: note: initialize the variable 'folio' to silence th=
is warning
    1 warning generated.

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, clang-13) =E2=80=94 FAIL, 1 error,=
 1 warning, 0 section mismatches

Errors:
    mm/shmem.c:1704:7: error: variable 'folio' is used uninitialized whenev=
er 'if' condition is true [-Werror,-Wsometimes-uninitialized]

Warnings:
    mm/shmem.c:1685:21: note: initialize the variable 'folio' to silence th=
is warning

---
For more info write to <info@kernelci.org>
