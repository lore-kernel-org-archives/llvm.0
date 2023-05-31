Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1044A3E
	for <llvm@lists.linux.dev>; Wed, 31 May 2023 06:22:20 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1b0201d9a9eso4627435ad.0
        for <llvm@lists.linux.dev>; Tue, 30 May 2023 23:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1685514139; x=1688106139;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gPCHJw6uiidg13w8mLV6+BRcnhzZLwl+A5RxGxHlMaI=;
        b=IOplZlGjA7KHXer71VbrNZ/0LN5C8DOf1zxqF0b364WVQiUPcIoAnHwq4yChkLvNHl
         ikrM6dTOQC+UW2+wtUtakL38aXkRMCFcPDH5qnwYZuiRpDjZisflnR9gkFC8pikTyh9C
         WLOoOAv/VJ7JHVZ9IR2TysK6PUJhbELuJ+EwgLF5OUG8drO32DUVbF/kRPYcdZNxk2HP
         0EO8Uz9CImeMud2Hs2wGXk3tbuUQPf2OsGuM9Htba7mRLhfVXulpqJCE7tgRyLNe5Ig3
         EAh6VJmtB4n7i6ApSEb6zyeIozhW1w7p1BRthPrCiHC7F11MX9V1642wQS60LxpNYauf
         rW5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685514139; x=1688106139;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gPCHJw6uiidg13w8mLV6+BRcnhzZLwl+A5RxGxHlMaI=;
        b=W8wPm/K70prUKQsovaebIZqCU/lRpuGCh/qFs3x09W+fI2pJrrAwIct1un7vDA6OXr
         xYklE/aqydVJpDpaQI6dostEuXkO36oLyEk2hI/PlEyRZGirARpOGNT/eeVX0gA3hSIN
         jRzaO9vWZ+bKU1JleKHzDCX+XrG2y/+/bm9t2DxN5Tk7Ln7+fQxr+7OStUAT3R3Cnvts
         gYgtGB/QWzq6KxoOZAXIs34vKiCKp4mcLA+t8l5Ej0CDZBfePkax5pVsN32JdD/F1hj8
         uTxcTOy/q//eBlVT4UXrdnBoNHqWbKlFicdkJk1oA4/gTxVR9jnhyNOOCCyEMK37Vgwn
         FVLg==
X-Gm-Message-State: AC+VfDyehLMY+fsABQxE3lpSXJCprat9H9yfm0zyPMRBgQwRUvNxSV6+
	Czc5NqwlLeCV80BjCjh5hr21dPE9zkHNFFS7GjaMig==
X-Google-Smtp-Source: ACHHUZ7yPgZmr+57g35gN7DemXaV5CHn75zYmTLD3deaC8g2ROiyXesd3bI/zUITltfFjYFqevzExg==
X-Received: by 2002:a17:903:41c5:b0:1ac:8835:b881 with SMTP id u5-20020a17090341c500b001ac8835b881mr5207262ple.17.1685514139390;
        Tue, 30 May 2023 23:22:19 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id n6-20020a170902d2c600b001b02162c866sm441461plc.44.2023.05.30.23.22.18
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 23:22:18 -0700 (PDT)
Message-ID: <6476e79a.170a0220.7c63.0c63@mx.google.com>
Date: Tue, 30 May 2023 23:22:18 -0700 (PDT)
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
X-Kernelci-Kernel: next-20230531
X-Kernelci-Report-Type: build
Subject: next/master build: 13 builds: 0 failed, 13 passed,
 2 warnings (next-20230531)
To: llvm@lists.linux.dev
From: "kernelci.org bot" <bot@kernelci.org>

next/master build: 13 builds: 0 failed, 13 passed, 2 warnings (next-2023053=
1)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20230531/

Tree: next
Branch: master
Git Describe: next-20230531
Git Commit: d4cee89031c80066ec461bb77b5e13a4f37d5fd2
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 3 unique architectures

Warnings Detected:

arm64:
    defconfig+arm64-chromebook (clang-13): 2 warnings

arm:

x86_64:


Warnings summary:

    1    fs/btrfs/extent_io.c:230:16: warning: variable 'pages_processed' s=
et but not used [-Wunused-but-set-variable]
    1    1 warning generated.

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
defconfig+arm64-chromebook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 2 wa=
rnings, 0 section mismatches

Warnings:
    fs/btrfs/extent_io.c:230:16: warning: variable 'pages_processed' set bu=
t not used [-Wunused-but-set-variable]
    1 warning generated.

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---
For more info write to <info@kernelci.org>
