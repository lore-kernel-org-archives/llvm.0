Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01B563A7
	for <llvm@lists.linux.dev>; Thu,  9 Mar 2023 09:49:57 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id q23so675301pgt.7
        for <llvm@lists.linux.dev>; Thu, 09 Mar 2023 01:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1678355397;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qBE8/bUIu8uFihmrZzb4200HkAzHyGtmvWgen2dzv4A=;
        b=g5XJH9RMbvGRL0M1nzc0BV8j+g1ty2sHoWKvrWFJb92p4bNxZOppy7AAPQFykzl5iv
         a5/UuW82JIWMhYbPvXdFaui7HqfXsqKqnf6kOgSWiSzPjpMgGf77VjlDlCfeZ9I9OmpY
         z2Zwk0ffqda279lc0IYnTXRM1Db7tRd3elORYLtKgQQmlOi6IiowkwH4KXIArv5mnBzt
         dU3G7tIU9l8gWjJaGiVXmvDcQTYmjTUqLT5qQzGssbbffQfKK90c2T4NEyjmdhqw+s5S
         jHu95t8Gk+Kfn4lqOagRu1h2ZrLdNJCJlEp0I5ExJvAJqTM1BKGNjp06dcI48BZZ6C4I
         DoqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678355397;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qBE8/bUIu8uFihmrZzb4200HkAzHyGtmvWgen2dzv4A=;
        b=SMDlHZsF4BphskyrQzOxHCKtur9K+CfqW2GNnmwZEbyxmCEHbDV1ciRYNyqAIkjtJL
         aXJTSkFkPR7bA/jQ2XjGWszfcJV4F1y2gOVbdkVQDcltFft0odt0QZcqnjNkV7lX2CAt
         IEEICGhxoWrSeHWVf7zKN0oX0XCHeud9jVLUO4fjzRvh4jRhbqSimG/rgZP8I+mRdMZs
         EukeDus0k10HdZhXk+0cQ/Jpkyuy5fyNIfpRys92FfyzSmHYG6FdM5hesyk5ho4DqCvR
         9QaxjgXqopC7o/tvT39t5qqch0al7Q5p6Aqzs4/0DlIeoqiprUwec0fjGWA1B+dv0ett
         2swA==
X-Gm-Message-State: AO0yUKV83FCWDU9Sbqpiv0eov0mRgm27dJrr8oCITsD4R/fufxW0fAYi
	HRBezFlLMCCqmnTbCmWtL+nkD6WmYWe8Sv4Xnx/NYX1B
X-Google-Smtp-Source: AK7set/Y8jupzPrkUPhOz+ZEpqpTlvAaWdf5IWpDEupYDs/8wl5PIkRPFAVt3V/Ze4Za7a0PCvW6Hw==
X-Received: by 2002:a62:8453:0:b0:60a:e919:51ef with SMTP id k80-20020a628453000000b0060ae91951efmr22197688pfd.9.1678355396696;
        Thu, 09 Mar 2023 01:49:56 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g9-20020aa78189000000b0061a942c8b62sm7634734pfi.43.2023.03.09.01.49.56
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 01:49:56 -0800 (PST)
Message-ID: <6409abc4.a70a0220.29c4.dadf@mx.google.com>
Date: Thu, 09 Mar 2023 01:49:56 -0800 (PST)
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
X-Kernelci-Kernel: next-20230309
X-Kernelci-Report-Type: build
Subject: next/master build: 14 builds: 1 failed, 13 passed, 3 errors,
 3 warnings (next-20230309)
To: llvm@lists.linux.dev
From: "kernelci.org bot" <bot@kernelci.org>

next/master build: 14 builds: 1 failed, 13 passed, 3 errors, 3 warnings (ne=
xt-20230309)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20230309/

Tree: next
Branch: master
Git Describe: next-20230309
Git Commit: 2c6433e9294b6d0f4d8f08c3c70a3eac434d3ec8
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 3 unique architectures

Build Failure Detected:

x86_64:
    cros://chromeos-5.10/x86_64/chromeos-amd-stoneyridge.flavour.config+x86=
-chromebook: (clang-13) FAIL

Errors and Warnings Detected:

arm64:

arm:

x86_64:
    cros://chromeos-5.10/x86_64/chromeos-amd-stoneyridge.flavour.config+x86=
-chromebook (clang-13): 3 errors, 3 warnings

Errors summary:

    1    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:115=
2:34: error: variable 'software_shutdown_temp' is uninitialized when used h=
ere [-Werror,-Wuninitialized]
    1    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:114=
9:24: error: variable 'memlimit' is uninitialized when used here [-Werror,-=
Wuninitialized]
    1    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:114=
6:3: error: variable 'hotspotlimit' is uninitialized when used here [-Werro=
r,-Wuninitialized]

Warnings summary:

    1    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:113=
6:18: note: initialize the variable 'memlimit' to silence this warning
    1    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:113=
5:22: note: initialize the variable 'hotspotlimit' to silence this warning
    1    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:113=
4:32: note: initialize the variable 'software_shutdown_temp' to silence thi=
s warning

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
=E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (arm, clang-1=
3) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-amd-stoneyridge.flavour.config+x86-chr=
omebook (x86_64, clang-13) =E2=80=94 FAIL, 3 errors, 3 warnings, 0 section =
mismatches

Errors:
    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:1146:3: =
error: variable 'hotspotlimit' is uninitialized when used here [-Werror,-Wu=
ninitialized]
    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:1149:24:=
 error: variable 'memlimit' is uninitialized when used here [-Werror,-Wunin=
itialized]
    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:1152:34:=
 error: variable 'software_shutdown_temp' is uninitialized when used here [=
-Werror,-Wuninitialized]

Warnings:
    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:1135:22:=
 note: initialize the variable 'hotspotlimit' to silence this warning
    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:1136:18:=
 note: initialize the variable 'memlimit' to silence this warning
    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:1134:32:=
 note: initialize the variable 'software_shutdown_temp' to silence this war=
ning

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
