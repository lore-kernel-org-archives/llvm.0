Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10303C10
	for <llvm@lists.linux.dev>; Tue, 14 Mar 2023 12:00:49 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id h11-20020a17090a2ecb00b00237c740335cso14891896pjs.3
        for <llvm@lists.linux.dev>; Tue, 14 Mar 2023 05:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1678795249;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zzdZlteVWktk1QOErkjIUUAR62LdrpQLTg3bwhTJt38=;
        b=GOAgXvP3RXuRkn6qtFp4Hqa2t2pD8ps3TCKmlSRWUkCwgl/OR8GPDAnP3HakP2162Y
         ma7NNUct192HnVG5bot7192AlGYsQ2o4gK8hLbCaPpVrGdxqE6Zt8rnVyNylElOVTPMS
         WswckjHv5sx9skgvJieGWRua3+pNohsoPkXhwCGUwfoc1MLoqyheX1zSqEOa2Rp+D8hX
         uQsnYY0yLkq0IX3pDUFk3wl+30RDJc+L8OTi21zVwv3plKjpUBkvKxYagUmUQ+f63ijC
         mNIBzMBF9YHDaqZVhZllm+ZEsRjamf1pnK05Mjim9UCBE5MpNV2YXcX237UCcnIZjXUz
         pFwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678795249;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zzdZlteVWktk1QOErkjIUUAR62LdrpQLTg3bwhTJt38=;
        b=sJAizBGmgnI2P1iEsnpqzxaWMCk1/+l7ziQ2qIjyj4sLtFfUcpd81G15PSDq0vqVx5
         v10rlKsgz0j0NUMxqaeW5lZRQ+bMhN/GqnQATTMm5GAbdM7mEN8qWvojqsLfO9otauno
         waMbHEJKnE96EriBiTVo4cx+LDDpA3aXALsMAxIYLWlouzgYREi6YjygxlGKNl6GAd1/
         zLY8kZD0dd8PYqpEaTjn9mnRPyU7OIbmVdCWndST8QbjftbuXxodaREFYKFWXubgJYKQ
         eq7pVcflDjGP32omJTSHnN/X/CVqrb4uge61v4OpHf8otrhT286IcRcg2F5jozMd25YT
         l5kQ==
X-Gm-Message-State: AO0yUKWQH4VLXNBX/4tIonKlNu/wpaTm+eTuBlYA5knVF0aszinweG6z
	aXRGO6SSYuwsAMRFimH2vYc8EpD57uqeyVXMPgepmQSh
X-Google-Smtp-Source: AK7set+752LDJlz7b4mFEzkgy7O4Imrqv71UhgO08ypqrIInctEeRoGsGlVoF9UINBEIoMaAFeYSiw==
X-Received: by 2002:a17:903:2349:b0:19c:e046:d906 with SMTP id c9-20020a170903234900b0019ce046d906mr14936514plh.24.1678795248362;
        Tue, 14 Mar 2023 05:00:48 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id ka16-20020a170903335000b0019e21d2ed2esm1619733plb.88.2023.03.14.05.00.47
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 05:00:47 -0700 (PDT)
Message-ID: <641061ef.170a0220.b7f27.38f0@mx.google.com>
Date: Tue, 14 Mar 2023 05:00:47 -0700 (PDT)
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
X-Kernelci-Kernel: next-20230314
X-Kernelci-Report-Type: build
Subject: next/master build: 13 builds: 0 failed, 13 passed (next-20230314)
To: llvm@lists.linux.dev
From: "kernelci.org bot" <bot@kernelci.org>

next/master build: 13 builds: 0 failed, 13 passed (next-20230314)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20230314/

Tree: next
Branch: master
Git Describe: next-20230314
Git Commit: ec0fa9a0a6fac454745c930bdb8619d0a354bac9
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
