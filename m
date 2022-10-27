Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19AEA7B
	for <llvm@lists.linux.dev>; Thu, 27 Oct 2022 05:37:12 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id k22so473398pfd.3
        for <llvm@lists.linux.dev>; Wed, 26 Oct 2022 22:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=T9j9zRRQese9k9PrODRTpUi8dr/KIkGm0dSEsv/YkrI=;
        b=dq+RSH6tmP4fpcKYf+vgXwowZ74wxPx+wAMxStSgMN4HvtWj8x1WNQGcQm2N1HjOLv
         ZHaW43sL/0L8WWLCXJAVLJdLPzzew0aPeJ3t6jebFgnT0Wzj/XvHGApx0uOySRC4uQ8F
         sSYfneaq/3wp2TGP+YM2yu5NL1AIDfPv5immsgYPJyboymkM+CGrqI0gwuYN57sFpAq/
         3KzAYD0i2IbySYjrDLO8eGB+rzaK+2hllnDcKt3wP65UolRT0UGBix8tHfU2fJOw+qJL
         rosHiWtIWyQrEY5mHAQmBHxkNVoF9UF2uQtSWQ0f1qPgEn/fnCUCQFPwM+vZOgGevTDd
         gxpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T9j9zRRQese9k9PrODRTpUi8dr/KIkGm0dSEsv/YkrI=;
        b=SPib6E/a2c6A5CYjo/8LZSDsSyUuCmDu+EbRtxs9YrqvJ0D/y1f3thz9YKcX8izB5Y
         PTNkc0Cb8rffxdSMlP9gdjaFe9qCbAisoxEC0IJIyfXPo8t4S7vsNraJeDq59bKfnwEk
         d6I5Bpx+C8TyE9VMbBt7csm/fsbnu9B3nZUTX5pEwVwGMv4ZkrWZt5E3FADMuJV0jvHn
         dXgzf2VH2K0Ec5GSnzjAzoBFaYpLs96L/p9J17MFpcCNr378kM6hrNyCou8ozmcKJv4z
         xEAJjEcb/f54DhqBBeEnlOhlzWOhQPnV36Yrm8ni6NpqAKxgPkJtmvHgp8PR1BDc8Lqp
         upzg==
X-Gm-Message-State: ACrzQf16aESZdVDHH95LUadnjmBAQrzKT8qKl5gKBd6L0Qw4U0DU6f99
	f5XQa4XwirhkAs3QU8sUaKWggh+QGSTI6IzH
X-Google-Smtp-Source: AMsMyM4fIO2KFeSoA4G8Rgv3O2ewdp0pcYJlvYeAMY5pnYckg9JMXExR9ZKX4fy4G+OooKFzqt2FUg==
X-Received: by 2002:a05:6a00:2187:b0:56c:7e85:c8f9 with SMTP id h7-20020a056a00218700b0056c7e85c8f9mr4205562pfi.75.1666849032209;
        Wed, 26 Oct 2022 22:37:12 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p19-20020a170902c71300b00186cd4a8aedsm254974plp.252.2022.10.26.22.37.11
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 22:37:11 -0700 (PDT)
Message-ID: <635a1907.170a0220.a2741.07a6@mx.google.com>
Date: Wed, 26 Oct 2022 22:37:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20221027
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master build: 14 builds: 0 failed, 14 passed,
 12 warnings (next-20221027)
To: llvm@lists.linux.dev
From: "kernelci.org bot" <bot@kernelci.org>

next/master build: 14 builds: 0 failed, 14 passed, 12 warnings (next-202210=
27)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20221027/

Tree: next
Branch: master
Git Describe: next-20221027
Git Commit: ecc4eeb2208ab537a3f3744984cd7f30ac971db8
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
