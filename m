Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F8010E3
	for <llvm@lists.linux.dev>; Wed, 29 Mar 2023 04:45:03 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id k2so13783142pll.8
        for <llvm@lists.linux.dev>; Tue, 28 Mar 2023 21:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1680065103;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OK/6bmZKKYAHSWCi93JOnnJSg+DOE34vh+RTj5Xe2vc=;
        b=PIrxdrPmHA+hVnzs5tu6iNbPBYpRgC30lmxwdmj05UezxMqA6LVrX/K2MF1J0dwpWX
         LH3Cx9zzDnuAgjXPnoh/DgqmChnkJ4dkCyQ7OSCVjBm4s8JfxhK3FqEyWXkKXkL7vp4I
         ycuaiAJNRg/rebZvCdrcl0wVigeEvX7qh4PWZeW6SvmCl0jGr9kZEcKYcNxiyDr2mRHM
         E+6IFA2kJEOfqWuR/jlG7IhRsSO9Fei9yOO4iNDdLnsVpJEn5bY+VHTODIsHSOGmNQ83
         rQxZ47CcJxZv1WcodUleOLIBQywIFEQUsGRBL487Ht+qjcFdkNDNnGmSr379DxU385Cs
         ckrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680065103;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OK/6bmZKKYAHSWCi93JOnnJSg+DOE34vh+RTj5Xe2vc=;
        b=XFX7FxhrYKg2HMCIkYmThyfe20I3S4EzjhYcF4mRnS1zNLJ+DiL5coS45yWtzpN8Kf
         1Oz84rQg6x628QHQxXYaw+7OXHp67mHortobPQ8hr4FGPSCtB2nopFNnr5q0/dhaL698
         knvsf+pEPgcAfgJELmjNLUzBP8lAV5Kl+J510W/cuLYcRgFLSzx3ETtbNBO7yLFHQboC
         xI1g+xY/fJmMdQqSUNbgd68XwGk0APDg/bmhiaAws5V9F0paabqtrMRPEFPLghg7ioFj
         SQnKK60s/Stugt8ZCIzRXkhyFSM2brYDBvBXF9PS+CMLjxAXFkYCNpnSISS+Id5Uma9Z
         n60A==
X-Gm-Message-State: AAQBX9dMYkp0CNEVRXCT82bdSHr0PjPHWBFjPEYB5XT8/zGDgljl/Adq
	X7FzZD5Idip6xSDLRqI5DKrkHUu9fzy8HPkAbXkz9w==
X-Google-Smtp-Source: AKy350ZhBMDmyM310K8tLbKYOChC9/NvGDmJ4WbhCCb/0hzXS8OzBY2qPSh4rHIeC49knBXojYAc4w==
X-Received: by 2002:a17:90b:1b48:b0:23d:2532:ae34 with SMTP id nv8-20020a17090b1b4800b0023d2532ae34mr999053pjb.2.1680065103156;
        Tue, 28 Mar 2023 21:45:03 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id qb2-20020a17090b280200b00240015b837fsm4099033pjb.2.2023.03.28.21.45.02
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 21:45:02 -0700 (PDT)
Message-ID: <6423c24e.170a0220.6bb62.2abc@mx.google.com>
Date: Tue, 28 Mar 2023 21:45:02 -0700 (PDT)
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
X-Kernelci-Kernel: next-20230329
Subject: next/master build: 12 builds: 0 failed, 12 passed (next-20230329)
To: llvm@lists.linux.dev
From: "kernelci.org bot" <bot@kernelci.org>

next/master build: 12 builds: 0 failed, 12 passed (next-20230329)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20230329/

Tree: next
Branch: master
Git Describe: next-20230329
Git Commit: 198925fae644b0099b66fac1d972721e6e563b17
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
cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config+x86-chromebook=
 (x86_64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatc=
hes

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---
For more info write to <info@kernelci.org>
