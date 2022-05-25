Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D43A23
	for <llvm@lists.linux.dev>; Wed, 25 May 2022 08:37:31 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id s14so17972755plk.8
        for <llvm@lists.linux.dev>; Wed, 25 May 2022 01:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=gWDOGXPPqAtRmRVUN24CmZl3zbD8OyVyUEJ1L5O8+Wc=;
        b=NxlCm2sciQzlLXYnmP/zWPgXbgXqe/Abq0dQBTnzMmnOEtmY/+KFYMUot9bb8mIojR
         YlXEydg0nim03Y7nOJUp529CjLnARsjmlAKTL4h9e7etKpkGbVP8sjQmro+RnGSEtsC5
         YsZ4ZA3aSTZZ56NA9o95xkbu73EDZCVZuAyr/9SxnrgPp9lAgJZSc+l9OdC2qreJrsfF
         EtK5oX2VD9UksBlwY/lv7aTGhrwBk7WOmkvxn/0qOasdVx2NqX3FxigyFP6Y6jm3mVk7
         aAs2ZxChyBvM1GdFf3h2oZdekMLrATbA3usDW9BicLjJVvx05HjZeCnbyHC6fapZ8jl2
         SZBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=gWDOGXPPqAtRmRVUN24CmZl3zbD8OyVyUEJ1L5O8+Wc=;
        b=YYWzdDJh/H4gF+dSxJsXAwFfTFC5mRVTNYvIdXFiJ/tczCmr0SrluF5j8E5uUB0k/1
         RIuHpGpSjc6teST1dE54m620eSqefvDpKg6bBqnSCw/b32WwVFZrKTRHisXKgBgAdgPm
         3M4lWiJ6qPJthdfniFeu1JKJZUPFQ2j4oe3eEK1M4H6eGsNDHEoFEdU58tUSbM02Emel
         211u+cQL4wDt3dsz/yjGQFX7FymAjmoVtwoeXegn9zojqd4GbLGZ6kYISSqZ9QwjsKuF
         KRekloIcjSuSbpCasQ+UqQr3atHVlyieRFthZu5S57/w8IEsnXBhdZ4nNAhZiOmyFpVV
         08Ow==
X-Gm-Message-State: AOAM531QKYvGULdCry3RvevP8y490SlcRo3omMETGumlRaL9SblhhCLu
	BGMFs+VxOe0n6F0WuaqBJO9nePWFUk79LhBaXVM=
X-Google-Smtp-Source: ABdhPJyREzO9GlsFKs6Syci4x6UeEtOh8g/Yu5god/uvdctnOglqFm8rdUBL6kFYXD09FoTJnq3CuQ==
X-Received: by 2002:a17:903:108c:b0:161:e5a5:e387 with SMTP id u12-20020a170903108c00b00161e5a5e387mr28310846pld.108.1653467850427;
        Wed, 25 May 2022 01:37:30 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id n11-20020a65450b000000b003fa5b550303sm4884732pgq.68.2022.05.25.01.37.29
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 01:37:29 -0700 (PDT)
Message-ID: <628deac9.1c69fb81.414f8.ba78@mx.google.com>
Date: Wed, 25 May 2022 01:37:29 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20220525
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master build: 13 builds: 1 failed, 12 passed, 1 error,
 13 warnings (next-20220525)
To: llvm@lists.linux.dev
From: "kernelci.org bot" <bot@kernelci.org>

next/master build: 13 builds: 1 failed, 12 passed, 1 error, 13 warnings (ne=
xt-20220525)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20220525/

Tree: next
Branch: master
Git Describe: next-20220525
Git Commit: 8cb8311e95e3bb58bd84d6350365f14a718faa6d
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 3 unique architectures

Build Failure Detected:

x86_64:
    cros://chromeos-5.10/x86_64/chromeos-intel-pineview.flavour.config+x86-=
chromebook: (clang-13) FAIL

Errors and Warnings Detected:

arm64:

arm:
    cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (clang-13): 6 =
warnings
    cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (clang-13=
): 6 warnings

x86_64:
    cros://chromeos-5.10/x86_64/chromeos-intel-pineview.flavour.config+x86-=
chromebook (clang-13): 1 error, 1 warning

Errors summary:

    1    drivers/misc/cardreader/rts5261.c:406:13: error: variable 'setting=
_reg2' is used uninitialized whenever 'if' condition is false [-Werror,-Wso=
metimes-uninitialized]

Warnings summary:

    12   clang: warning: argument unused during compilation: '-march=3Darmv=
7-a' [-Wunused-command-line-argument]
    1    drivers/misc/cardreader/rts5261.c:364:32: note: initialize the var=
iable 'setting_reg2' to silence this warning

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
cros://chromeos-5.10/x86_64/chromeos-intel-denverton.flavour.config+x86-chr=
omebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-intel-pineview.flavour.config+x86-chro=
mebook (x86_64, clang-13) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mis=
matches

Errors:
    drivers/misc/cardreader/rts5261.c:406:13: error: variable 'setting_reg2=
' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometim=
es-uninitialized]

Warnings:
    drivers/misc/cardreader/rts5261.c:364:32: note: initialize the variable=
 'setting_reg2' to silence this warning

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
