Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88427E2
	for <llvm@lists.linux.dev>; Thu,  1 Sep 2022 08:39:25 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id y1so14588159plb.2
        for <llvm@lists.linux.dev>; Thu, 01 Sep 2022 01:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc;
        bh=44MSXcB8HZUYziztiBq9LTrzP9UCedLpEB38QreC7cs=;
        b=1UpYVlmsmZvWaAuMTKhgGKM79DsYsCTtQic+zvHNYzKo03UitkSXqnTIUfqH2/0xyS
         luZ5Pj/fQDycWgxBWW51RfWlYrruwuxTe16fmNChcWOIBlBmXSAVvnEO6kW77KqJBc+x
         fnMcyzzaeiFCG8rj/HaSgQU0jx3Urts7yLSZVstWRa+jreuc1kzGZOQ1R/a31KirJfAB
         ELeBfKoHarN1V/8hznGjeTHJWytOqIk+ZzH1QKbBq2j0xABWe5DYxf89q8Hpndxwlu4g
         nrU3A0BHbyjEXoyPwC/DwZ9gOCLJF9Pdiz3GmDF5cVvH0oVC0waKOuZNuIbYiAIq7IH5
         qojQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=44MSXcB8HZUYziztiBq9LTrzP9UCedLpEB38QreC7cs=;
        b=gYBzCxYxqs20OsvmYrgqAa3YFiDmRHLlRX3O87ndyL9CrlCVpUYbRYADsIIOP90lAO
         RfoLk6Tf7g8SqZfizZB8+qyxKbxugoo9tIEupdR+jqlv3Zeu/hWtPL1J0CSPq0x5tMD7
         ttjizM9Rl5XS/DbmEM1VNN0FN187tNwMRXB/cvrWrtJfgocdW9QmMC/SND+EK/TbZMVk
         5uAUBL0r2aUGLpOaNm4xJ+A564xEa8YLA46dc2S7m0MI9rkMThdbFIisdht66Hk23cXd
         uDC0GGaDuOBMkZqCvzXpwF6aysnDWsttdAlKGWl+PATf+3gZi6Koq4Bbf+wYyro/4zqz
         +TPw==
X-Gm-Message-State: ACgBeo0JZhdRH7FAf266YPFugpGtvFP4BC0PP8MbF1h4799HrofNv0He
	7bSrJZt4ZpQ0KqmkzQmgG2TalHUjugcwglaJSJA=
X-Google-Smtp-Source: AA6agR4rFR9Phk9HX+0lXI5zDJXdxC1R7PhTOMzi+289UYMCGC7ud72c4cRJxmodptf7VfdAymwVTQ==
X-Received: by 2002:a17:903:11c9:b0:172:6ea1:b727 with SMTP id q9-20020a17090311c900b001726ea1b727mr29455409plh.78.1662021564883;
        Thu, 01 Sep 2022 01:39:24 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h188-20020a6253c5000000b0052d46b43006sm12767780pfb.156.2022.09.01.01.39.23
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 01:39:23 -0700 (PDT)
Message-ID: <63106fbb.620a0220.5f6d.81bc@mx.google.com>
Date: Thu, 01 Sep 2022 01:39:23 -0700 (PDT)
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
X-Kernelci-Kernel: next-20220901
Subject: next/master build: 14 builds: 2 failed, 12 passed, 2 errors,
 12 warnings (next-20220901)
To: llvm@lists.linux.dev
From: "kernelci.org bot" <bot@kernelci.org>

next/master build: 14 builds: 2 failed, 12 passed, 2 errors, 12 warnings (n=
ext-20220901)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20220901/

Tree: next
Branch: master
Git Describe: next-20220901
Git Commit: e47eb90a0a9ae20b82635b9b99a8d0979b757ad8
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 3 unique architectures

Build Failures Detected:

x86_64:
    cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config: (clang-13=
) FAIL
    cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config+x86-chrome=
book: (clang-13) FAIL

Errors and Warnings Detected:

arm64:

arm:
    cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (clang-13): 6 =
warnings
    cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (clang-13=
): 6 warnings

x86_64:
    cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config (clang-13)=
: 1 error
    cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config+x86-chrome=
book (clang-13): 1 error

Errors summary:

    2    sound/soc/intel/skylake/skl.c:729:18: error: unused variable 'skl'=
 [-Werror,-Wunused-variable]

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
-13) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section mismatches

Errors:
    sound/soc/intel/skylake/skl.c:729:18: error: unused variable 'skl' [-We=
rror,-Wunused-variable]

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config+x86-chromebook=
 (x86_64, clang-13) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section mismatch=
es

Errors:
    sound/soc/intel/skylake/skl.c:729:18: error: unused variable 'skl' [-We=
rror,-Wunused-variable]

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
