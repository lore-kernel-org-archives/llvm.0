Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F1B7464
	for <llvm@lists.linux.dev>; Mon, 26 Jun 2023 09:35:46 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1b80f2ed810so1182155ad.0
        for <llvm@lists.linux.dev>; Mon, 26 Jun 2023 02:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1687772145; x=1690364145;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UH3eVzjLKwWmRMVYeQqwjO56lgLsezdOhj6baGSx02Y=;
        b=3hM6JJc0ratZSvh21uiSdvkVjR4ktcXaTY4LK9w32/dAX0DIFFh/a8E9Pp7m2S93RH
         b7Ht6k3Ix7VzvE3OANMoLvOvSxGgJFzO+bPYdsKpEofi0Z8+wGUX2vDpgvvR+NG0ymgG
         JOxOPRmN6MpDN61JdGall+pz8XE5HITPCvz5Ml7ZjBpX9G8NB30UGk2kZXyePsKyWU+Q
         5xOjewpiPq8xRHBhzqHSdIfPbFteH9HsQ8KiZbZW4NdQR+ot4kzmIQgjFSMjH001Oz8f
         DZJGP9EGMkDLrHYJbsY5ClNNC3JFTBowla4jXwBiNmtlJPBke+NBYWbhaBCLAHX+JITY
         c68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687772145; x=1690364145;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UH3eVzjLKwWmRMVYeQqwjO56lgLsezdOhj6baGSx02Y=;
        b=DHIMBc95jcVRET6N2xz9dl+fkzxrKT5mIZdiXjSfaJj8xfObdQ28T/YalFdf5z8Qwx
         5ZfbHPX+FVZlWn4kHVVSodJgSgaJehE4wv01XtTjaf47KFPu2Gyxlla/BOY8An7sBnPp
         peXKfYVhmIQuQ6vjJ+7Xqmx/VNyFozFmm2lmVWLVbs/0S2chbEOsxdABLJzBSOx9BVEf
         q4Dy2Rtrn5HBwazM9QQOWz33i0ypqaPrYyN5YXLRCJP0F8+riOZvGJlQwwZkM3Affsz4
         F7jLSnOO6zcN75Q9OETFhWoCA0yskabOF4bMPPKL9Nxt+5+Sl9yg7PX7gbjtRTFC6NaT
         zTWg==
X-Gm-Message-State: AC+VfDxHPJ6iMWJkS/IhQJfjzSXpxRReQUV44oamvSxORUcZ0953vbbk
	yTQ5tsywBCVQw4hoEP/FmNmK2HWNSrBpScS1AJ4=
X-Google-Smtp-Source: ACHHUZ5O4pENI0bKJDaxZfS7vETurKhCiJehYkrdaqcTZ7rGvl5FEWCT3ZUp+9MKNUa4ZWBn7JHbzA==
X-Received: by 2002:a17:902:db10:b0:1b6:7f96:42ca with SMTP id m16-20020a170902db1000b001b67f9642camr3364373plx.66.1687772145529;
        Mon, 26 Jun 2023 02:35:45 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id p7-20020a170902bd0700b001b6740207dbsm3475093pls.214.2023.06.26.02.35.44
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 02:35:45 -0700 (PDT)
Message-ID: <64995bf1.170a0220.73bbf.56f6@mx.google.com>
Date: Mon, 26 Jun 2023 02:35:45 -0700 (PDT)
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
X-Kernelci-Kernel: next-20230626
Subject: next/master build: 13 builds: 0 failed, 13 passed (next-20230626)
To: llvm@lists.linux.dev
From: "kernelci.org bot" <bot@kernelci.org>

next/master build: 13 builds: 0 failed, 13 passed (next-20230626)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20230626/

Tree: next
Branch: master
Git Describe: next-20230626
Git Commit: 60e7c4a25da68cd826719b685babbd23e73b85b0
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 3 unique architectures

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
x86_64_defconfig+x86-chromebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---
For more info write to <info@kernelci.org>
