Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD311A29
	for <llvm@lists.linux.dev>; Thu,  3 Nov 2022 06:17:30 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id k5so720253pjo.5
        for <llvm@lists.linux.dev>; Wed, 02 Nov 2022 23:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2SzhgN8GaqT8zn/DoN1Xiz3L9dooAHfhRVKtCoMKf/Y=;
        b=RCHddAOOVFmq9M3zkNf9ubIIRHbB1xSR7y2nlOGe6LSFsLzzzHVvQHxvh70F72mhau
         kuvxBMpKIFqWNSB85dxspLSuJC7EHfENi+bJRctVTfGHzKb07fqRjfUFvoGf9XDFazfD
         QnEia5ZINliF6uogQgV4psHo4idmGG/gK8kWqdlZaQ1pf8gfv+fqotxhRlComhN+gjPd
         VgDToxtSkYgYCe5aFQ90mY6KDaCBSHvwmOtn6NNm6kDju3Z35m9ynZpQPItRKQVWX+BR
         04Y/j50PEHVCjDfplt+SC0kE2cmerLLueGz3YSFZhI9k5iI84zu5LLNg88IsgZz8I6OZ
         mhxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2SzhgN8GaqT8zn/DoN1Xiz3L9dooAHfhRVKtCoMKf/Y=;
        b=ob9fKC4gnrfs6khc/v+j0cCCcMRc/CxPXkcg7JT6tgxtVkUejjV8MNrCszwc/e3HOc
         S7jqaKBYoh+0snBbA1a88UCQhDBqklZtPVmIhNoe8fcoMfI68NShJvLZ8QIiBmUv00qv
         W0k4qWW1k0AdgDrrV0PUczW6LxCp3VxWPU67JH7hrmR+LWy/Lm4FXG438YnAR4IGkO08
         5yWSSGzaoMQeLXIeqOcDqlE+8k3Ujs1r+ZoPgN7iUkKriz8gxviPjgAwU07HsCrH/w6J
         LmRCB9VpoYdXHf5iw9vUPUjQUglTeM5lIFQK3vibnpbjw4bk4vOTpU9Vj+jzaPGHRnG2
         jwCQ==
X-Gm-Message-State: ACrzQf3cG0EnoU02arCXGTaZFutZ9Ni5C7nans+S7R6eMWxxnPkibOx+
	tYCjH92ikTZuWvm85WAiFadZW1iauM/VsKcE
X-Google-Smtp-Source: AMsMyM7FcoBd+H/5qExdBTz9QAAQCqlPZitum8MXL8H+CbKFo8zktBnK/Nf1WEvuljZSJ1LURIKtYg==
X-Received: by 2002:a17:90a:2a8b:b0:213:9ae5:b9ab with SMTP id j11-20020a17090a2a8b00b002139ae5b9abmr30032867pjd.110.1667456249862;
        Wed, 02 Nov 2022 23:17:29 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q8-20020a170902dac800b0017854cee6ebsm9466817plx.72.2022.11.02.23.17.28
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 23:17:29 -0700 (PDT)
Message-ID: <63635cf9.170a0220.f0f0a.2533@mx.google.com>
Date: Wed, 02 Nov 2022 23:17:29 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20221103
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master build: 11 builds: 0 failed, 11 passed,
 12 warnings (next-20221103)
To: llvm@lists.linux.dev
From: "kernelci.org bot" <bot@kernelci.org>

next/master build: 11 builds: 0 failed, 11 passed, 12 warnings (next-202211=
03)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20221103/

Tree: next
Branch: master
Git Describe: next-20221103
Git Commit: 81214a573d19ae2fa5b528286ba23cd1cb17feec
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
