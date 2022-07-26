Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DCC2579
	for <llvm@lists.linux.dev>; Tue, 26 Jul 2022 14:10:34 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id x1so11670858plb.3
        for <llvm@lists.linux.dev>; Tue, 26 Jul 2022 07:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=E3WkBAbIZNQDN6qnICcRcF6GSR6VvBoqLAOZE61ZrSA=;
        b=JN6vuIDWR1T6q3388gYMYRKXQHmt0fuIZjevmsbu7RRsXPxQ8NFK7LoL8Kn/ngcMHm
         z0283CQKAxCNut8Kh0uIrfVoxb8paZJyBhtTzkHDrJYzgBG1X5QlI5yuo9eop7B5yH4z
         65eyv3i6/xhf+c+0KAeZzIUcDJwYW2DBiJu9tHvh/QUAqFa9HSZjnLfI1ePcTkNvrL6k
         6/EjGLBSvWsTPGVp56+5EZ4tJoChUEVE6T1Rj7OrIxabTx1XecLtKL1LkqAI8zuc9iEp
         q/uyDWJSzLs9Nw++MsPwOqYnCQquXMfIZqu5NMIzADdmh+iWrV9MOPiJUeKz3SzvurFH
         ns7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=E3WkBAbIZNQDN6qnICcRcF6GSR6VvBoqLAOZE61ZrSA=;
        b=2i+KTAFLqq0g6ybobt0APUcdGYm5mDoCkBWvFbeKezjAWhWz0MAmJQVTT/Xv6ggeLe
         oSbe9ujh3W6EecwXrzVOOXpDTRT/Rd8rxFfGv/YDqnmwuIEMTlgKsERuHtl/aHQYhwob
         B2g710ql+tDjE/AFTr651rgPJXBR7mLWi79em24D+Kux2s50PD/mMpnx+XrN/mWoX869
         HiJ0gJuN+cmX5JeGDsPGYkYmn1Nf68dgKEx3VMGzeHpArrSbv0Id7geR8OR43UMlUUqo
         drgyzwunx5t7nY/ASFzIDL9Y8BHeOfrVDJAuY7mzFUxT4wFeYsVhcngnMT73hrXmi5/H
         cFCw==
X-Gm-Message-State: AJIora/itBkYdMpi8iLBdXxTgDgttf8ffbP1rIJHyr6QCCPRbGou3rZE
	tVBA7rpm+h25SDs+Mxx/lbTXnJbtCuVI2giC
X-Google-Smtp-Source: AGRyM1sTnrfSJCRLu7YZOcCGUfQLKO5Wn49GrS1W7nDgJOJ/a774gaVhYF/HiUNp8V6EqHK0OyNtqg==
X-Received: by 2002:a17:902:aa4b:b0:15f:b2c:73c7 with SMTP id c11-20020a170902aa4b00b0015f0b2c73c7mr17258579plr.164.1658844633337;
        Tue, 26 Jul 2022 07:10:33 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id ik5-20020a170902ab0500b0016da9128169sm762801plb.130.2022.07.26.07.10.32
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 07:10:33 -0700 (PDT)
Message-ID: <62dff5d9.1c69fb81.f4ba0.1291@mx.google.com>
Date: Tue, 26 Jul 2022 07:10:33 -0700 (PDT)
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
X-Kernelci-Kernel: next-20220726
Subject: next/master build: 14 builds: 1 failed, 13 passed, 1 error,
 13 warnings (next-20220726)
To: llvm@lists.linux.dev
From: "kernelci.org bot" <bot@kernelci.org>

next/master build: 14 builds: 1 failed, 13 passed, 1 error, 13 warnings (ne=
xt-20220726)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20220726/

Tree: next
Branch: master
Git Describe: next-20220726
Git Commit: 058affafc65a74cf54499fb578b66ad0b18f939b
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 3 unique architectures

Build Failure Detected:

x86_64:
    cros://chromeos-5.10/x86_64/chromeos-amd-stoneyridge.flavour.config+x86=
-chromebook: (clang-13) FAIL

Errors and Warnings Detected:

arm64:

arm:
    cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (clang-13): 6 =
warnings
    cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (clang-13=
): 6 warnings

x86_64:
    cros://chromeos-5.10/x86_64/chromeos-amd-stoneyridge.flavour.config+x86=
-chromebook (clang-13): 1 error, 1 warning

Errors summary:

    1    sound/soc/amd/acp/acp-platform.c:117:19: error: variable 'ext_intr=
_stat1' is uninitialized when used here [-Werror,-Wuninitialized]

Warnings summary:

    12   clang: warning: argument unused during compilation: '-march=3Darmv=
7-a' [-Wunused-command-line-argument]
    1    sound/soc/amd/acp/acp-platform.c:97:35: note: initialize the varia=
ble 'ext_intr_stat1' to silence this warning

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
omebook (x86_64, clang-13) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mi=
smatches

Errors:
    sound/soc/amd/acp/acp-platform.c:117:19: error: variable 'ext_intr_stat=
1' is uninitialized when used here [-Werror,-Wuninitialized]

Warnings:
    sound/soc/amd/acp/acp-platform.c:97:35: note: initialize the variable '=
ext_intr_stat1' to silence this warning

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
