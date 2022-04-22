Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F4123A4
	for <llvm@lists.linux.dev>; Fri, 22 Apr 2022 09:36:11 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id q3so9666114plg.3
        for <llvm@lists.linux.dev>; Fri, 22 Apr 2022 02:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=6yy0qRwtEmmS9JnCFg1N5H+x2LYK24zklTWONxIg2m0=;
        b=mBrEIQlX0W15pyPTyxZ0+Ne4bvOxHcFogZAECoCTpIRq3cRRgU/8q2VyFaxeQ1eJFp
         Fa+17wDmwxwTr6XSXyB7ELpIdDrXm4L0iqBkbgEVqa5UlcU5ps8/hf5udepuGnTC960A
         3506E8UjQL8ghnRnHGOaywFhShozCyxkzCntlf92SS4dBIO5qG2vqgciPKKWDdXmVOC+
         EIw+w6841uG2vORYiYhblRaZL8uc1YZygqdO4GSDoaEgencPkQxp1yF97pOHFUZ7LymR
         5lxB9CRKAdm6PWJlt6XobcKDPSr3PLgQTjX/zYhMu5832ZYjeIZeMklz6SjXOOZhH/89
         MnoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=6yy0qRwtEmmS9JnCFg1N5H+x2LYK24zklTWONxIg2m0=;
        b=7LwlTJCrANvov+AbcfRRnJ920sdyRtrs5+Iq0huu5G37sTLAEr1Pu11PFAi7DvFK8X
         GyrRyeCbwkZI1jZqsyk4dZYU8lRnFEOdPKrsoHUuqWCoEH89BjFSqvx+jCJVe9lYNj+Q
         8BmGL9wuLjCXMatrY3k+oz5Z3D89SjiNPxAIvLuyaAr0zzsjN43hQMuOLA/rMvuSpyeH
         oCi41BmUDb57C9QxPvqh/M9xVv3t1IDFzAwa1tN3LpJO7Sp1rUuAx01HB8H0LXRv1tHo
         KVwxf+SoGe+3GbaWTRAyHCuLYBwxiHUXn/z/0zqql7fxWGo8ETyu1if7R/GKuuDopFRp
         QsPA==
X-Gm-Message-State: AOAM530h6alqZn2bcCwh/X/rckqhiQLkIFwen1EMTw+CcZVVoSSv6gLX
	wfDZb4mVouV6KXHTrX7oj3qU89CXzWmpXWWOdwE=
X-Google-Smtp-Source: ABdhPJwKdzF7tdp2GWmtZGn+fxjn6RZFUzmWnCQb6cz0xStL3efTfuGEQPKwyFRAlaMCzDe9FAdTwA==
X-Received: by 2002:a17:90a:aa8a:b0:1c9:bfd8:9a90 with SMTP id l10-20020a17090aaa8a00b001c9bfd89a90mr4367188pjq.118.1650620170861;
        Fri, 22 Apr 2022 02:36:10 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 124-20020a621982000000b0050a73577a37sm1931310pfz.45.2022.04.22.02.36.10
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 02:36:10 -0700 (PDT)
Message-ID: <6262770a.1c69fb81.19638.4e0c@mx.google.com>
Date: Fri, 22 Apr 2022 02:36:10 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20220422
X-Kernelci-Report-Type: build
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master build: 14 builds: 0 failed, 14 passed,
 12 warnings (next-20220422)
To: llvm@lists.linux.dev
From: "kernelci.org bot" <bot@kernelci.org>

next/master build: 14 builds: 0 failed, 14 passed, 12 warnings (next-202204=
22)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20220422/

Tree: next
Branch: master
Git Describe: next-20220422
Git Commit: e7d6987e09a328d4a949701db40ef63fbb970670
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

    12   clang: warning: argument unused during compilation: '-march=3Darmv=
7-a' [-Wunused-command-line-argument]

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
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (arm, clang-1=
3) =E2=80=94 PASS, 0 errors, 6 warnings, 0 section mismatches

Warnings:
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
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]

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
