Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A90111B8
	for <llvm@lists.linux.dev>; Fri,  2 Jun 2023 13:04:52 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1b02fcde49aso11245185ad.0
        for <llvm@lists.linux.dev>; Fri, 02 Jun 2023 06:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1685711091; x=1688303091;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YrZOkmIe7NtY37zIRS4OLCoF6q/xS3nMCKjuHH4Jdu4=;
        b=QpZ8ktPUzZHX1SbyZUyrdhOIQlFmk9BsE4W5gybFkuQ1qZmVJGRPdzxz9T287vD6kY
         nIAIK/ZyiT5iSwmsEMm68M76UCVOZs4as1US3nZe2JsVOM9EITtqZT0X9ndenXPtDl2o
         3LX2TIEgBHOIxO0Be+z6f4W7Jjj6ZntzCdttyxFe6JhkKYDxs0eQa3LmuKy6Jkm4uR/0
         sON8H1VgDSYLXSttumgqseHb+QvsFf4uPkLEoEJNoEpOnSBuoUjJNxqNQ4AxkmvyBp5I
         ofRRvB73/4c0q6uJws3m3pMS+RyevNGONuTZ37Vk7IVPgv4PHrXwbyzNLrHmZCj9oiMx
         fUTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685711091; x=1688303091;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YrZOkmIe7NtY37zIRS4OLCoF6q/xS3nMCKjuHH4Jdu4=;
        b=KKvpkClJY2TC4zoer5TWGHwvNg++ybsNJiitXS1dOB4cfCvC1P8fsCM0YM4+KGTSkN
         U3Y47qlWU18u2ojiKc1+Y/TcNpiNW/oW27tD+c5EkAcrOc916GcP2vz0kyBiHS0QeYsD
         8awrQ785opOWHrp5HK6u8LFlb0APZRpwBV08D2vhLD9VFlLFlNAtJmx8b20edXwyZ2X7
         ApyngfN8BeigA7MXmH6hkuylcLq8q406PNMOHNfAyUSq8BSQZMVjfGjO4XU0NuLrDRW1
         VmxeCxNFgt2cEKJqtX8ME8+Jp5c/zqgLB79lL8RS2oeY/zE4Aw/I1MOSuWzaWSM/MSei
         WFBw==
X-Gm-Message-State: AC+VfDwWcDVnbNic5RUgoYdfHcbCLElRM6xUaHHWSvyais8Rb6zHbOKH
	U2UVRPvyKzh0Z6fUXcpa10XAvQXmBi9RQVIfzU6FFg==
X-Google-Smtp-Source: ACHHUZ4zm52EcrjgKSNuVeCjOHuUxAg8czM4QbFymKTOr2gaU4O7yyQ/RZokE2vkkbeQr2JCM/e4OQ==
X-Received: by 2002:a17:903:2615:b0:1ac:8384:a7fb with SMTP id jd21-20020a170903261500b001ac8384a7fbmr1071144plb.66.1685711091349;
        Fri, 02 Jun 2023 06:04:51 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x7-20020a170902820700b001a1b66af22fsm1330626pln.62.2023.06.02.06.04.50
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 06:04:50 -0700 (PDT)
Message-ID: <6479e8f2.170a0220.9d430.1f8f@mx.google.com>
Date: Fri, 02 Jun 2023 06:04:50 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20230602
X-Kernelci-Report-Type: build
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master build: 11 builds: 0 failed, 11 passed,
 5 warnings (next-20230602)
To: llvm@lists.linux.dev
From: "kernelci.org bot" <bot@kernelci.org>

next/master build: 11 builds: 0 failed, 11 passed, 5 warnings (next-2023060=
2)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20230602/

Tree: next
Branch: master
Git Describe: next-20230602
Git Commit: bc708bbd8260ee4eb3428b0109f5f3be661fae46
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 3 unique architectures

Warnings Detected:

arm64:
    defconfig+arm64-chromebook (clang-13): 5 warnings

arm:

x86_64:


Warnings summary:

    2    1 warning generated.
    1    fs/btrfs/extent_io.c:230:16: warning: variable 'pages_processed' s=
et but not used [-Wunused-but-set-variable]
    1    drivers/bus/fsl-mc/fsl-mc-allocator.c:108:12: warning: variable 'm=
c_bus_dev' is uninitialized when used here [-Wuninitialized]
    1    drivers/bus/fsl-mc/fsl-mc-allocator.c:100:34: note: initialize the=
 variable 'mc_bus_dev' to silence this warning

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
defconfig+arm64-chromebook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 5 wa=
rnings, 0 section mismatches

Warnings:
    drivers/bus/fsl-mc/fsl-mc-allocator.c:108:12: warning: variable 'mc_bus=
_dev' is uninitialized when used here [-Wuninitialized]
    drivers/bus/fsl-mc/fsl-mc-allocator.c:100:34: note: initialize the vari=
able 'mc_bus_dev' to silence this warning
    1 warning generated.
    fs/btrfs/extent_io.c:230:16: warning: variable 'pages_processed' set bu=
t not used [-Wunused-but-set-variable]
    1 warning generated.

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---
For more info write to <info@kernelci.org>
