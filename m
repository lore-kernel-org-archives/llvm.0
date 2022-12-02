Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A786F7B
	for <llvm@lists.linux.dev>; Fri,  2 Dec 2022 05:14:06 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id f3so3521935pgc.2
        for <llvm@lists.linux.dev>; Thu, 01 Dec 2022 21:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GA0M4uDFJ5XV6gdGxZ8ruug1Dmnd2yqE6qE86rkgnA0=;
        b=W9Z0eQaLR5iCtPowC+kroDJNuqSEvBn7CUYRKSQW4waf4kcsiLTQ1CUUx+7CJZzLDv
         d1lPem8gNo+NlV8LR/YK+eBgZzBOrk/uvpwYK7ZV2WgnALe+P0aYMXgiOe8CGqwgqEI6
         739XMv6y+Hkic+5fGIxtxAZvwaB4g0VLJplx4IaVYFS1CH+Okj2M6ND62BtV+UATaroA
         m+aKULUwx2GmPHa25H1U8FomjerGvA8//CK7VvPcdWQZq4ymt75GaSwEG/KvuDVcnpW1
         rDm5SbJgVKijP/1emlIXHope78hnN2wyxpvPKAFV+7tjXgrUwWGWKTfwXZckma93NMJ+
         SSPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GA0M4uDFJ5XV6gdGxZ8ruug1Dmnd2yqE6qE86rkgnA0=;
        b=Nges6/pAB0zY0P3YuUPXq6obinMP10VpWSxKisYPtJAb6RghKYpkCMHhRNQ0mNTxiB
         ANbKzZaZtoakhrTWwkBBVSUECXoYM1ewi7Yt9r47bTKOhA27rb1uhF+k8VtyLPaIl63W
         zfOi3Ib1UdibKqEPNZ2shUCOkTkdr9A7DyK6raL1aR2CKgEIyQoUsIIGr10/2XIUId3f
         M4o8nru+hxDdeoJrCL1ujx5jwiAedenhcxg65b+FcsDXBsUs5RBEzZI0HZXbrzTOY3io
         fTlZ0UNS8Am9F0bRq3tVbG2vp73h3K0F/x+gt6UMwL69G3eDcKslYjh+TVwvjO+EpDm6
         w+VA==
X-Gm-Message-State: ANoB5pmY+ZepaK6hPdcecEF1a3BSb/IS9uAbO49GnnwqhcZLkQ0NezdS
	YA2SH0d7nYEEynSSf1U9pIPKZa4WQ2U3q9Hu69zmDg==
X-Google-Smtp-Source: AA0mqf7VOMMaWbFTlNICcR780CwmptW61hTBi6gr1w4Wi6kFZ+DXZrzk7izk3bhJ7/DdA19WQGNPtg==
X-Received: by 2002:a63:230e:0:b0:470:86e3:b93e with SMTP id j14-20020a63230e000000b0047086e3b93emr44543154pgj.337.1669958045599;
        Thu, 01 Dec 2022 21:14:05 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s10-20020a170902ea0a00b00189348ab156sm4551251plg.283.2022.12.01.21.14.03
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 21:14:04 -0800 (PST)
Message-ID: <6389899c.170a0220.4d771.90ec@mx.google.com>
Date: Thu, 01 Dec 2022 21:14:04 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20221202
X-Kernelci-Report-Type: build
X-Kernelci-Tree: next
Subject: next/master build: 14 builds: 0 failed, 14 passed (next-20221202)
To: llvm@lists.linux.dev
From: "kernelci.org bot" <bot@kernelci.org>

next/master build: 14 builds: 0 failed, 14 passed (next-20221202)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20221202/

Tree: next
Branch: master
Git Describe: next-20221202
Git Commit: 5be860bfc73408bc1a8af9167955e480ecebba84
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
defconfig+arm64-chromebook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 wa=
rnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---
For more info write to <info@kernelci.org>
