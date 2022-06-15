Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251ED7A
	for <llvm@lists.linux.dev>; Wed, 15 Jun 2022 09:47:11 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id g10-20020a17090a708a00b001ea8aadd42bso1556498pjk.0
        for <llvm@lists.linux.dev>; Wed, 15 Jun 2022 02:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=aPwIjxBJdE9LB3wLZM0T7IS7g3U9vzTEOHBfxps9ey8=;
        b=bAR4KmBASbtZXRr43JiN91ARnEH7EQCMIe7BpVXVlpqu1Cpr9D6rfS8czm5kDeSszS
         F1zd69g+sejiA8ZcVQLUNWtPFlwyzKxwCC6nVYdeVs9JQYdDpkgzCGE6ID10MPkBoIIl
         mpadVF4yIF9i9yherryo2iTCtx2FjNPO7plwgmzsiyuOVBrbD9x90307PFJYc3BtpCZG
         U3Wvf/mhD+7MQKJlKJNvai2miWk4UPZI4V9iplcB1HS+YFewwIIokRMMZ0sB+G0sWCHZ
         6G2Ua1Xn67YLeJ2Ii1Vp3VDeuJWJUr0iMiPS/3wCxyzLeE04JxxNKQjoFSznAVASOkvx
         YU6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=aPwIjxBJdE9LB3wLZM0T7IS7g3U9vzTEOHBfxps9ey8=;
        b=UAPm0aDq79V9mI19PFl7gnYaC1uZJ+9DiUFVEQCEcoxaOSLnc93e10KmcQd1Zcw8ZL
         bC3eKyP1kAHnekuDxNzsEj18UT6m3KtGvAYo4jl7kYD0nofR0qGVFWhb9yW/I5Jtv6Gi
         Tt37+gHgCoKelak9AXd2QAV7FuwdUIVyJlRECHNxIW4ZbMecKNfT5QUgDTUOQzFqgZVN
         OqMRejQdtPrW6GYf986WwOvcZUR3pD4vx24rHBvGbFWsrvAFmMmt+76LQp0oBt/VsOcu
         3aaqrUmSbPYj2cfjQQzzL8+po1mWMl5vipsLdlvUEkzK77QEAp4p+huW3GQWIfccVVML
         rRAg==
X-Gm-Message-State: AJIora8pmvFVqv0+hYQIfjCSlQqHRFaj/nmurfL8Ivcm+WW4algytj+I
	/mwvAJ0pvcEzEVm/mhMMOKNKawQaUWwMGiuTqj8=
X-Google-Smtp-Source: AGRyM1uIqjiVoY7rCnyvSEFOYomOC/PkDF/+05O7l+lti/RbIU0DGqpyrg+4D/4/RbCwc5v5Mb2N7A==
X-Received: by 2002:a17:90b:4a42:b0:1e3:331e:d3ec with SMTP id lb2-20020a17090b4a4200b001e3331ed3ecmr9143346pjb.147.1655286430238;
        Wed, 15 Jun 2022 02:47:10 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id i6-20020aa78b46000000b0051bc721b838sm9299204pfd.188.2022.06.15.02.47.09
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 02:47:09 -0700 (PDT)
Message-ID: <62a9aa9d.1c69fb81.18952.b4a6@mx.google.com>
Date: Wed, 15 Jun 2022 02:47:09 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20220615
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master build: 14 builds: 2 failed, 12 passed, 2 errors,
 15 warnings (next-20220615)
To: llvm@lists.linux.dev
From: "kernelci.org bot" <bot@kernelci.org>

next/master build: 14 builds: 2 failed, 12 passed, 2 errors, 15 warnings (n=
ext-20220615)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20220615/

Tree: next
Branch: master
Git Describe: next-20220615
Git Commit: 6012273897fefb12566580efedee10bb06e5e6ed
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
    defconfig+arm64-chromebook (clang-13): 5 warnings

arm:
    cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (clang-13): 1 =
error, 5 warnings
    cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (clang-13=
): 1 error, 5 warnings

x86_64:

Errors summary:

    2    lib/maple_tree.c:4202:20: error: stack frame size (1096) exceeds l=
imit (1024) in function 'mas_wr_modify' [-Werror,-Wframe-larger-than]

Warnings summary:

    10   clang: warning: argument unused during compilation: '-march=3Darmv=
7-a' [-Wunused-command-line-argument]
    1    drivers/mmc/host/sdhci-brcmstb.c:302:6: warning: variable 'base_cl=
k' is used uninitialized whenever 'if' condition is true [-Wsometimes-unini=
tialized]
    1    drivers/mmc/host/sdhci-brcmstb.c:295:6: warning: variable 'base_cl=
k' is used uninitialized whenever 'if' condition is true [-Wsometimes-unini=
tialized]
    1    drivers/mmc/host/sdhci-brcmstb.c:280:6: warning: variable 'base_cl=
k' is used uninitialized whenever 'if' condition is true [-Wsometimes-unini=
tialized]
    1    drivers/mmc/host/sdhci-brcmstb.c:259:22: note: initialize the vari=
able 'base_clk' to silence this warning
    1    3 warnings generated.

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
    lib/maple_tree.c:4202:20: error: stack frame size (1096) exceeds limit =
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
    lib/maple_tree.c:4202:20: error: stack frame size (1096) exceeds limit =
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
defconfig+arm64-chromebook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 5 wa=
rnings, 0 section mismatches

Warnings:
    drivers/mmc/host/sdhci-brcmstb.c:302:6: warning: variable 'base_clk' is=
 used uninitialized whenever 'if' condition is true [-Wsometimes-uninitiali=
zed]
    drivers/mmc/host/sdhci-brcmstb.c:295:6: warning: variable 'base_clk' is=
 used uninitialized whenever 'if' condition is true [-Wsometimes-uninitiali=
zed]
    drivers/mmc/host/sdhci-brcmstb.c:280:6: warning: variable 'base_clk' is=
 used uninitialized whenever 'if' condition is true [-Wsometimes-uninitiali=
zed]
    drivers/mmc/host/sdhci-brcmstb.c:259:22: note: initialize the variable =
'base_clk' to silence this warning
    3 warnings generated.

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---
For more info write to <info@kernelci.org>
