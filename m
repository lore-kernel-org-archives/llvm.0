Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62EC7F
	for <llvm@lists.linux.dev>; Wed,  3 Aug 2022 04:30:14 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id p8so15278084plq.13
        for <llvm@lists.linux.dev>; Tue, 02 Aug 2022 21:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=pYtQQVdJ40E4X50kSCl+ciWvL0c0vltSjFrXrNpwjnQ=;
        b=ZmyJZM/2X6r2WQStOOWb1L8YSe3Wmju8ZPJUypJcy9gN7yp8fCWF63uqX4tKBVerTk
         ZjGf0FLnrW0/wEIoa4y0T1oFHYmQrykWk9Rmmj6OAUp9J3WASADI62rUJumWFSwTf/8G
         o88uy0Bvl+Befael+mqciYTIr21Y4KG66ANYtsRAZvuGA8Fb1AKpGlNvruIHB1tsjbo4
         K7/T7kfVQ57h2CfTACEmXYdPsvXIY0T5Pbeucm6TFCT7CoO1JDxxCURIa45Ob06JNsHj
         4h0KMcgKGIX//9K+8rV2XZQ22H9kiMEDfDQUK/GLVc1eu3tdOqpAOigpxBTWeRVfKWs2
         QPFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=pYtQQVdJ40E4X50kSCl+ciWvL0c0vltSjFrXrNpwjnQ=;
        b=7ju6/BdtPDZl3XqqLUV58KITqDLwR5x98OpCYL4RnC0Y6HtjlKHyOeor3B3vG+M0+9
         17/Mga+yuDNs1yYobIGkWbtQ6aAVJsS9cM7JRzC+3zxfjkA0RCFupgT4U/4bEL4RG/Ef
         e2zhZ6kNBNmFZ33uq8W/YzJUG4/iVEGKryvrFWC7E1YQQN4o99cWpRgqczhh1rAL4nb4
         zj453mLdlq2c4rEnNhMIbYXwvxiYYcLGyY7vH8U90oZwLZi7az9PiokZr2JM3/g+HUlN
         yXI7A0TNbN1gRE//6ZiG2RNxFdiYFaeviqAXf10AgfQiKI8fpfOEWT7tRryrEnm79jl1
         t6vw==
X-Gm-Message-State: ACgBeo1Gb7LetoN+Oe15JOuGdB4CycOsLoHxTAwcrlwDcqlVnD92OcVp
	RCnBmj3DEKWERfGf3YEOS/Ip/0LySfafY+EEviw=
X-Google-Smtp-Source: AA6agR5SyjOGv/aZldSjLqg9SnUxxH+alorRSigA/KO8eAyqR6sCOczREDXZTwz8YlO4uAwhACDhBw==
X-Received: by 2002:a17:90b:3a90:b0:1f3:39fa:166a with SMTP id om16-20020a17090b3a9000b001f339fa166amr2975302pjb.64.1659501013976;
        Tue, 02 Aug 2022 21:30:13 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id f185-20020a6251c2000000b0052b9351737fsm12154066pfb.92.2022.08.02.21.30.11
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Aug 2022 21:30:12 -0700 (PDT)
Message-ID: <62e9f9d4.620a0220.7db3d.3920@mx.google.com>
Date: Tue, 02 Aug 2022 21:30:12 -0700 (PDT)
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
X-Kernelci-Kernel: next-20220802
Subject: next/master build: 7 builds: 0 failed, 7 passed,
 12 warnings (next-20220802)
To: llvm@lists.linux.dev
From: "kernelci.org bot" <bot@kernelci.org>

next/master build: 7 builds: 0 failed, 7 passed, 12 warnings (next-20220802)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20220802/

Tree: next
Branch: master
Git Describe: next-20220802
Git Commit: 42d670bda02fdba0f3944c92f545984501e5788d
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
