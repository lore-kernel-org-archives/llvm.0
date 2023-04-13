Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DAD2F31
	for <llvm@lists.linux.dev>; Thu, 13 Apr 2023 20:41:21 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id hg12so1887318pjb.2
        for <llvm@lists.linux.dev>; Thu, 13 Apr 2023 13:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1681418481; x=1684010481;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JpD/idY75JCUonc1mCHRsxaPMz+Dua0TbOwZfoFGyKc=;
        b=ZS3xVUuekua/xIb85OW00vHzmw9UZEkQs4okOtfSjM0IppwM3nv1gi8nhkTmT7eynb
         41PO43VyeV622cv/Fb6X7ssWuv6JK40f5jWM0CFgP8z/CzBFXIgKRnD6wd53SkYubUr1
         5oOW+GeJ13r5CiSkwBsXmEkuKZYrLRloCg8CiDG0gz7myu4kp3eAd7ujD2zO8uqx0k9W
         frgjC4g1Bm4o9cwei21oOR0oYQKZdRUAe4wBNItm7BsZm+BQaV0ZwueLVUVw909Moum9
         FZYmDMc/91baUGDa9DXpzlCIFaigCRNbEKQiFRCZGESCUvNg8m3PiX+GWS2/YZWo91Em
         w23Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681418481; x=1684010481;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JpD/idY75JCUonc1mCHRsxaPMz+Dua0TbOwZfoFGyKc=;
        b=RNTAU9lUnj8qruUc+XOargyJgcRH52PHyLgzvUYmHXJHcns0+E65VQEXdDiaJImv+u
         O4oqtqWe9rqpMHHEpCipezcgzUeMGW1GcsX9eM3cjrjDNEUds6AcK4YvtO+UpxVQsbxl
         9f/6ptoxWfK05HWRMgL5FO5GvSfVc7WKnmACeYNC78sSEEF2ZTlRx4jO6amGcM7wZRJC
         OgV+7+tvnvKzzHgx/hlobIz7IBRv5t7CKqUMTvI4B7o9clsAIfjNOyym0+Nmt5Rf5ias
         w6tw9GRPL8NUgNc2NXIpSiiZmY0rEU2s4fivPZDFhQFegdbrQzl8GCicztbnzyZztdvw
         kHdg==
X-Gm-Message-State: AAQBX9e+JKWoqssAMC56n5ReWyTx+/NtLVk62w7yNLSw9AT8LFwzCd5u
	qOBUaljk6gaZZI6+BYqf/LIbO9fE1u/Q2v+VbvuKbh/h
X-Google-Smtp-Source: AKy350abb09U9mGJX7y9TaTIZSAg6e8zIAkhOY7ecrDzTCpEnaaGJZfoR56gaIrKK6elLZlwnomVkQ==
X-Received: by 2002:a17:902:ef4d:b0:1a1:e01e:7279 with SMTP id e13-20020a170902ef4d00b001a1e01e7279mr388858plx.4.1681418480811;
        Thu, 13 Apr 2023 13:41:20 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 5-20020a170902e9c500b001a1adbe215asm1870586plk.142.2023.04.13.13.41.20
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 13:41:20 -0700 (PDT)
Message-ID: <643868f0.170a0220.79845.4a9d@mx.google.com>
Date: Thu, 13 Apr 2023 13:41:20 -0700 (PDT)
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
X-Kernelci-Kernel: next-20230413
X-Kernelci-Report-Type: build
Subject: next/master build: 13 builds: 3 failed, 10 passed, 3 errors,
 3 warnings (next-20230413)
To: llvm@lists.linux.dev
From: "kernelci.org bot" <bot@kernelci.org>

next/master build: 13 builds: 3 failed, 10 passed, 3 errors, 3 warnings (ne=
xt-20230413)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20230413/

Tree: next
Branch: master
Git Describe: next-20230413
Git Commit: e3342532ecd39bbd9c2ab5b9001cec1589bc37e9
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

Errors and Warnings Detected:

arm64:
    cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config (clang-13): =
1 error, 1 warning
    cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chrome=
book (clang-13): 1 error, 1 warning
    cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.config+arm64-chr=
omebook (clang-13): 1 error, 1 warning

arm:

x86_64:

Errors summary:

    3    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: error: variable =
'ret' is uninitialized when used here [-Werror,-Wuninitialized]

Warnings summary:

    3    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:216:12: note: initializ=
e the variable 'ret' to silence this warning

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config (arm64, clang-13=
) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mismatches

Errors:
    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: error: variable 'ret'=
 is uninitialized when used here [-Werror,-Wuninitialized]

Warnings:
    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:216:12: note: initialize the=
 variable 'ret' to silence this warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chromebook=
 (arm64, clang-13) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mismatches

Errors:
    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: error: variable 'ret'=
 is uninitialized when used here [-Werror,-Wuninitialized]

Warnings:
    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:216:12: note: initialize the=
 variable 'ret' to silence this warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.config+arm64-chromeb=
ook (arm64, clang-13) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mismatc=
hes

Errors:
    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: error: variable 'ret'=
 is uninitialized when used here [-Werror,-Wuninitialized]

Warnings:
    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:216:12: note: initialize the=
 variable 'ret' to silence this warning

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
