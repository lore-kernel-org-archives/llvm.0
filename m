Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673E57A
	for <llvm@lists.linux.dev>; Sat, 16 Jul 2022 05:33:52 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id h132so6126927pgc.10
        for <llvm@lists.linux.dev>; Fri, 15 Jul 2022 22:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=WoeyufOymv3rDh4ZpxmLjUwGCbuTEOO2c7PjryyNoG0=;
        b=NN7CrU2xVlkGPkGbYK5q0wxi+nSqeWfFNwlky4wJe8/Z1ARfbRUrOiCHP4AvOx+X1f
         mBPi3KzfU0PNqkNS9TjPFR1DH28goRVg29F9pumpMiVceFNLBlK8B1m8V5a7nGncBs/F
         GqahZADc41SDWCanItmsePAT6lWQeuVIqPjHlg1V1SB4wd0ifRQDdpow4AWsmWAX2dpb
         pFm0fkDzWWrhVpmDnwOwrr0sx9LZnH8Hzoyci/rStoaBwzSjJ1Y3ZOgd2CKh5V/PVdvv
         inoi8XDJufbisrL0gl9wI++IEn162+qjZXILAF/kPgGlGr/GuK/OOdjq2rzfmOQZx3+i
         AfIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=WoeyufOymv3rDh4ZpxmLjUwGCbuTEOO2c7PjryyNoG0=;
        b=2+bnb8Os+abN9a2x2I7y9pdk/c1qXOMEmZPvDPEcHnr6eVFz03xvTcLXOJmqRtTzUv
         JceMuH4t53sc0u/6Gs9ykJrzrXxrBpE+UrlQ392ZmQ3q7tMgfyuQ4K+zQKoOkaUNJKjf
         V3n/cpUh41cz+C/iFMww7ENVAko/W7gQpwGJke2XFveQJ37/1HfTQ1Dl5J7kkh20o6tE
         /Po2zwYuQYy97j+qtlED6gl1yFgDeeVXJoq+n6xUPbUue9Ea2SYQBS1mSoj1MRsBMPOL
         6/k+4Vaqpkob8DWCoETU2nwqtjmmSK0GJhDl9NfvhPDx4eW4BtqYqG3+HczbH5enp7/L
         NwUg==
X-Gm-Message-State: AJIora+UH/JjERNpxtnfv2nPoqPfebRuecmBuomcb+ucM5MimjlxueFl
	auIqW9RbVAtEZfY1iXK7NHAaWYjRDC5X0gvf
X-Google-Smtp-Source: AGRyM1tqllhUHblOhI0SB7FPvyawUwlnvsP0mx8JvkLpJe6a5Sx/NnJWsgL1ZZmecA+6k8RK4C/NTQ==
X-Received: by 2002:a65:6801:0:b0:412:b42c:9d3c with SMTP id l1-20020a656801000000b00412b42c9d3cmr15232288pgt.525.1657949631560;
        Fri, 15 Jul 2022 22:33:51 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id v12-20020a170902d08c00b0016c6e360ff6sm4480952plv.303.2022.07.15.22.33.50
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 22:33:51 -0700 (PDT)
Message-ID: <62d24dbf.1c69fb81.28c77.75a8@mx.google.com>
Date: Fri, 15 Jul 2022 22:33:51 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20220715
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master build: 14 builds: 2 failed, 12 passed, 2 errors,
 10 warnings (next-20220715)
To: llvm@lists.linux.dev
From: "kernelci.org bot" <bot@kernelci.org>

next/master build: 14 builds: 2 failed, 12 passed, 2 errors, 10 warnings (n=
ext-20220715)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20220715/

Tree: next
Branch: master
Git Describe: next-20220715
Git Commit: 6014cfa5bf32cf8c5c58b3cfd5ee0e1542c8a825
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 3 unique architectures

Build Failures Detected:

arm:
    cros://chromeos-5.10/armel/chromiumos-arm.flavour.config: (clang-13) FA=
IL
    cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config: (clang-1=
3) FAIL

Errors and Warnings Detected:

arm64:

arm:
    cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (clang-13): 1 =
error, 5 warnings
    cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (clang-13=
): 1 error, 5 warnings

x86_64:

Errors summary:

    2    lib/maple_tree.c:4292:20: error: stack frame size (1096) exceeds l=
imit (1024) in function 'mas_wr_modify' [-Werror,-Wframe-larger-than]

Warnings summary:

    10   clang: warning: argument unused during compilation: '-march=3Darmv=
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
=E2=80=94 FAIL, 1 error, 5 warnings, 0 section mismatches

Errors:
    lib/maple_tree.c:4292:20: error: stack frame size (1096) exceeds limit =
(1024) in function 'mas_wr_modify' [-Werror,-Wframe-larger-than]

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

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (arm, clang-1=
3) =E2=80=94 FAIL, 1 error, 5 warnings, 0 section mismatches

Errors:
    lib/maple_tree.c:4292:20: error: stack frame size (1096) exceeds limit =
(1024) in function 'mas_wr_modify' [-Werror,-Wframe-larger-than]

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
