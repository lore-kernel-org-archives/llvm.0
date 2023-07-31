Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7877B7F3
	for <llvm@lists.linux.dev>; Mon, 31 Jul 2023 05:24:35 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1bb775625e2so25451165ad.1
        for <llvm@lists.linux.dev>; Sun, 30 Jul 2023 22:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1690781074; x=1691385874;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=t6fq/LV1YmPHkGDs9Wdm2PDP4k9jThXQzMa3/EskwoM=;
        b=I6FhXukgroLlt4uJj22WPijUMQLOwy1N46ZTwX1IFL+HP2FfP68+nFtQmjIPCXu2de
         1Fl7q1dvFITLB5dIhln0GCFJVwWarRyQmIONoAFgOPd5C9WQvmOuzY1xJrOxAtHsILpB
         5qRxXDyO+ri9PYCSQ+TPd34N6yJ+BRnXFAPqj0jcuZlOMir8fsMDn/g51/h8MWaTosE0
         cxLvENnxvdLXuJvfAplbEQFhP8+qUVpYPB/0fp7WSaZsrhteA0sID7v4EIgulQRScHWl
         0xBkvaDcIDLHuN8PnFJCz52Bnb4dpz1THFIF8DNYUCpy+B0i/3GrLVh73++YDkXHewbO
         Tvbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690781074; x=1691385874;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t6fq/LV1YmPHkGDs9Wdm2PDP4k9jThXQzMa3/EskwoM=;
        b=geuCEBixV0dNS0+AkzWWYOHSRCAbIUUXbwwBLe2NKRS7R2K6nHlL6fWfplXbsvOdAW
         YZCHqQut6wfu30UGNNcWDKpV8DzwhHYWPm8UVuiBE1tTQDKP2gGEaRgyNceQ2+tnZFqN
         I03cv7aLa5wzgCC4FIiua7pNejhE0WvKvGKpvX/PnhMNC4eavul1RlBI50SHY1GwyGvo
         1jI0R4pvl9CmDe0K6r0QQ4SRc5KXBVlrm8Tgc3SV1kB5QCQzPYILAXLcd8BmkZNccSc5
         j4x7bTd3Ul0f+9bJFv7gvRluxL7ZOCew5t0/PFaLhFduGLJqSlSK2fJ1ACKZy9ryh2IR
         iAvA==
X-Gm-Message-State: ABy/qLYsrxRh6e1EHD/syWp9qui+t6BOs2m734cVwrPP/94nJvdHttF1
	hiDqh99RW9MmHshSo2+L9jtOf1jY5DRYCYMPbmhwjw==
X-Google-Smtp-Source: APBJJlFdOCf/VmE4QJpZAlsVCAkToVFzV1ACRcYWMpdcfwPL5N2btOiFTW+0ado0oPdr/aw4qvEf/w==
X-Received: by 2002:a17:902:c404:b0:1b9:c61c:4c01 with SMTP id k4-20020a170902c40400b001b9c61c4c01mr11893622plk.9.1690781074174;
        Sun, 30 Jul 2023 22:24:34 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 6-20020a170902ee4600b001b8a3a0c928sm7489098plo.181.2023.07.30.22.24.32
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 22:24:33 -0700 (PDT)
Message-ID: <64c74591.170a0220.9a037.d7d3@mx.google.com>
Date: Sun, 30 Jul 2023 22:24:33 -0700 (PDT)
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
X-Kernelci-Kernel: next-20230731
X-Kernelci-Report-Type: build
Subject: next/master build: 13 builds: 0 failed, 13 passed,
 2 warnings (next-20230731)
To: llvm@lists.linux.dev
From: "kernelci.org bot" <bot@kernelci.org>

next/master build: 13 builds: 0 failed, 13 passed, 2 warnings (next-2023073=
1)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20230731/

Tree: next
Branch: master
Git Describe: next-20230731
Git Commit: ec89391563792edd11d138a853901bce76d11f44
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 3 unique architectures

Warnings Detected:

arm64:
    defconfig+arm64-chromebook (clang-13): 2 warnings

arm:

x86_64:


Warnings summary:

    1    fs/btrfs/extent_io.c:232:16: warning: variable 'pages_processed' s=
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
x86_64_defconfig+x86-chromebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---
For more info write to <info@kernelci.org>
