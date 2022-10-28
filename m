Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD7B7B
	for <llvm@lists.linux.dev>; Fri, 28 Oct 2022 05:19:36 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id c24so3909816pls.9
        for <llvm@lists.linux.dev>; Thu, 27 Oct 2022 22:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wp93rgIQd3mRpY4ucT9mEzzX0qmMzoKDPYoatjMvYKs=;
        b=dNyrqSLLuTFwMXm3bGJZpfvYS7NCDukUZMM5xjVJG8Znf4WnXW8QbbL82LJxFenA9G
         yrGwa+dCOuEFTt2w7Hyp3Q8OBxEkRdCQirY5mElXVe0rE6MYHYI4vMM4KQumFisxToNn
         lCziI7tsHEekQrKPZvkEGPO1nsXqqaR326JfDQdpg3SblF3Ck8r+mcCttyhndqWAy8Qr
         8yHwx0j1syrGYqL3zX3X0aBa9WFJ/tnCVMmMPr/eG1jmZ7eIYliSS8I96tr78RrazmzR
         LvrUS4FSjIatX2WqkkgxDWDoKurQAc20+t22DAdwud3gnV4npWbvNHkQSr9Ks25pkAil
         StaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wp93rgIQd3mRpY4ucT9mEzzX0qmMzoKDPYoatjMvYKs=;
        b=bx4EAU9OKxLYoEVoJHQA+8UosIKv1hCdwJY9t3+W7PE3nEoGBMD3Ra2g7VbDG7NEg3
         Xi27P3vXIStEfcrW8jPLsvksJV+yZkdKcpjOU5vSrA5429DCnSot+YOD0zN7H3+p6dly
         9lddLXEHCVCKAE/B4PiL5lxfi+FQqM97bNPFlZJ1pFJuSYIsK13X5Me4F2blqO6U8NUh
         WPJ+KlzS7p7CewqlPMIDw45w+5JwqTMb5ehPPbqJlPT293q3YZAJkFc52FO/EEbhy3pn
         3YoZQV9eY0y9s0SNvbmV7niMcoVbUPqvWhjJW4frOmjeutjlttubTvomnW1HSaMblMWu
         ivfg==
X-Gm-Message-State: ACrzQf1yrESD8dPoD5XmXHux8PGzCNzVyZKu+ouL2ZER1/XXXsEwGqxN
	D00sLnqZwi21JxLhroIYxMWetHi30EAriTVb
X-Google-Smtp-Source: AMsMyM5ikXkoIOZDT5VjGslgvqOLoZ5t2UxfnLuZt7vhX4sWiMGWaiDvBMcEhtyb/428Toq6AHpUHA==
X-Received: by 2002:a17:902:aa8b:b0:178:8f1d:6936 with SMTP id d11-20020a170902aa8b00b001788f1d6936mr53622179plr.168.1666934375575;
        Thu, 27 Oct 2022 22:19:35 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id ik25-20020a170902ab1900b0017834a6966csm2064057plb.176.2022.10.27.22.19.34
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 22:19:34 -0700 (PDT)
Message-ID: <635b6666.170a0220.8b8f0.41d4@mx.google.com>
Date: Thu, 27 Oct 2022 22:19:34 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20221028
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master build: 14 builds: 0 failed, 14 passed, 3 errors,
 12 warnings (next-20221028)
To: llvm@lists.linux.dev
From: "kernelci.org bot" <bot@kernelci.org>

next/master build: 14 builds: 0 failed, 14 passed, 3 errors, 12 warnings (n=
ext-20221028)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20221028/

Tree: next
Branch: master
Git Describe: next-20221028
Git Commit: fd8dab197cca2746e1fcd399a218eec5164726d4
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 3 unique architectures

Errors and Warnings Detected:

arm64:

arm:
    cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (clang-13): 6 =
warnings
    cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (clang-13=
): 6 warnings
    pxa_defconfig (gcc-10): 3 errors

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
pxa_defconfig (arm, gcc-10) =E2=80=94 FAIL, 3 errors, 0 warnings, 0 section=
 mismatches

Errors:
    arch/arm/mach-pxa/spitz.c:410:11: error: =E2=80=98EV_PWR=E2=80=99 undec=
lared here (not in a function)
    arch/arm/mach-pxa/spitz.c:411:11: error: =E2=80=98KEY_SUSPEND=E2=80=99 =
undeclared here (not in a function); did you mean =E2=80=98LED_SUSPENDED=E2=
=80=99?
    arch/arm/mach-pxa/spitz.c:418:11: error: =E2=80=98EV_SW=E2=80=99 undecl=
ared here (not in a function)

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---
For more info write to <info@kernelci.org>
