Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7944663B
	for <llvm@lists.linux.dev>; Mon, 26 Dec 2022 05:14:46 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id o31-20020a17090a0a2200b00223fedffb30so9838674pjo.3
        for <llvm@lists.linux.dev>; Sun, 25 Dec 2022 21:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+5HuRbPSmDZGq/1bzlPowYPfRgIiv+CL5P1L5Vi5DQM=;
        b=mcskFAZpOCCi/hZJeHc4+Ef0nh2fgDOyMf29Ezm5KaUR73MIutwGqGKEgHXphgguJd
         NEQdc8J+61WTqBFm3bZn1MoE+noTTxH12D6Ymq1v88pFRUHy8U3KHPOYdc/n3qr5bMaC
         AH9gaTT+P99gkziYqQVu0aLaARa/IOJHqN17AYIpHMrQ4lojkInZPhJu1IfxUfuBXnPl
         MeOKHDO4oaCIWjZ4R0xrC0EChqikwDtcT5HuMdHU644PTVWLDCUjU/C7tNfD3qqhowlM
         nq5tmPTlIsoi4iqpCzgLqqdmHsyCZe4TCiL6KizxrqAbvaSjWlHAg1iT9Agqs/iOlilG
         JxiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+5HuRbPSmDZGq/1bzlPowYPfRgIiv+CL5P1L5Vi5DQM=;
        b=wZe4gv7Cym5t+6rfZVbXTmy1yE7Fr4wzj7bzV99r5JgOnRHkjuV3bfOSdh29GYHdGS
         e+jY1TZyQWwlu7i6tnrszz8WL3MZVHoYrzWnpODpoqtudqMPH6fHzPeDS5p0o6ciX9pr
         o2escU5wU6j2h+fSy49NKFQ9wN6jcqS5bZBWbBIol63Pd/X/XHvFCd1qCVzkVr+sGoG+
         tw4Hs2Za924ykArFVCuhGTfw5+IPQw2L8HYcLpczdnkUgkKM2LccvYxV6iyZmWUhT7eR
         eAkwXq69OwrFG3Q5eVCdtzwkX1PhQQYF0WvkaDAYp8zZcfMKnJ0cW2n5jhk1x8P9K5B1
         yg6A==
X-Gm-Message-State: AFqh2kr6ReLoCLAaLxzIi6iQ3lBvul9MFj6ewCb0nPGarwY8lQ+g9Rhl
	ikw9+aJkCJ1PHc77K3W9JrzsStAFcMxEXb75d1o=
X-Google-Smtp-Source: AMrXdXsR8i9GtLspan2ZTpfjgk0x5fZ6T6J2XverZNJsf8GRaPyotdp/gQa1SbeduNGKkDeh0NKTvA==
X-Received: by 2002:a17:90b:3ec4:b0:225:d605:6163 with SMTP id rm4-20020a17090b3ec400b00225d6056163mr7457201pjb.8.1672031685472;
        Sun, 25 Dec 2022 21:14:45 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t16-20020a634610000000b00473c36ea150sm5424560pga.92.2022.12.25.21.14.44
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 21:14:44 -0800 (PST)
Message-ID: <63a92dc4.630a0220.86fbc.9a3f@mx.google.com>
Date: Sun, 25 Dec 2022 21:14:44 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20221226
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Report-Type: build
Subject: next/master build: 14 builds: 13 failed, 1 passed, 13 errors,
 12 warnings (next-20221226)
To: llvm@lists.linux.dev
From: "kernelci.org bot" <bot@kernelci.org>

next/master build: 14 builds: 13 failed, 1 passed, 13 errors, 12 warnings (=
next-20221226)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20221226/

Tree: next
Branch: master
Git Describe: next-20221226
Git Commit: c76083fac3bae1a87ae3d005b5cb1cbc761e31d5
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 3 unique architectures

Build Failures Detected:

arm64:
    cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config: (clang-13) =
FAIL
    cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chrome=
book: (clang-13) FAIL
    cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.config+arm64-chr=
omebook: (clang-13) FAIL
    cros://chromeos-5.10/arm64/chromiumos-qualcomm.flavour.config+arm64-chr=
omebook: (clang-13) FAIL
    cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.config+arm64-c=
hromebook: (clang-13) FAIL
    defconfig+arm64-chromebook: (clang-13) FAIL

arm:
    cros://chromeos-5.10/armel/chromiumos-arm.flavour.config: (clang-13) FA=
IL
    cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config: (clang-1=
3) FAIL

x86_64:
    cros://chromeos-5.10/x86_64/chromeos-amd-stoneyridge.flavour.config+x86=
-chromebook: (clang-13) FAIL
    cros://chromeos-5.10/x86_64/chromeos-intel-denverton.flavour.config+x86=
-chromebook: (clang-13) FAIL
    cros://chromeos-5.10/x86_64/chromeos-intel-pineview.flavour.config+x86-=
chromebook: (clang-13) FAIL
    cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config: (clang-13=
) FAIL
    cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config+x86-chrome=
book: (clang-13) FAIL

Errors and Warnings Detected:

arm64:
    cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config (clang-13): =
1 error, 1 warning
    cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chrome=
book (clang-13): 1 error, 1 warning
    cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.config+arm64-chr=
omebook (clang-13): 1 error, 1 warning
    cros://chromeos-5.10/arm64/chromiumos-qualcomm.flavour.config+arm64-chr=
omebook (clang-13): 1 error, 1 warning
    cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.config+arm64-c=
hromebook (clang-13): 1 error, 1 warning
    defconfig+arm64-chromebook (clang-13): 1 error

arm:
    cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (clang-13): 1 =
error, 1 warning
    cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (clang-13=
): 1 error, 1 warning

x86_64:
    cros://chromeos-5.10/x86_64/chromeos-amd-stoneyridge.flavour.config+x86=
-chromebook (clang-13): 1 error, 1 warning
    cros://chromeos-5.10/x86_64/chromeos-intel-denverton.flavour.config+x86=
-chromebook (clang-13): 1 error, 1 warning
    cros://chromeos-5.10/x86_64/chromeos-intel-pineview.flavour.config+x86-=
chromebook (clang-13): 1 error, 1 warning
    cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config (clang-13)=
: 1 error, 1 warning
    cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config+x86-chrome=
book (clang-13): 1 error, 1 warning

Errors summary:

    12   fs/udf/inode.c:805:6: error: variable 'newblock' is used uninitial=
ized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
    1    error: unknown warning option '-Wmaybe-uninitialized'; did you mea=
n '-Wuninitialized'? [-Werror,-Wunknown-warning-option]

Warnings summary:

    12   fs/udf/inode.c:607:34: note: initialize the variable 'newblock' to=
 silence this warning

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config (arm64, clang-13=
) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mismatches

Errors:
    fs/udf/inode.c:805:6: error: variable 'newblock' is used uninitialized =
whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]

Warnings:
    fs/udf/inode.c:607:34: note: initialize the variable 'newblock' to sile=
nce this warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chromebook=
 (arm64, clang-13) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mismatches

Errors:
    fs/udf/inode.c:805:6: error: variable 'newblock' is used uninitialized =
whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]

Warnings:
    fs/udf/inode.c:607:34: note: initialize the variable 'newblock' to sile=
nce this warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.config+arm64-chromeb=
ook (arm64, clang-13) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mismatc=
hes

Errors:
    fs/udf/inode.c:805:6: error: variable 'newblock' is used uninitialized =
whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]

Warnings:
    fs/udf/inode.c:607:34: note: initialize the variable 'newblock' to sile=
nce this warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-qualcomm.flavour.config+arm64-chromeb=
ook (arm64, clang-13) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mismatc=
hes

Errors:
    fs/udf/inode.c:805:6: error: variable 'newblock' is used uninitialized =
whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]

Warnings:
    fs/udf/inode.c:607:34: note: initialize the variable 'newblock' to sile=
nce this warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.config+arm64-chrom=
ebook (arm64, clang-13) =E2=80=94 FAIL, 1 error, 1 warning, 0 section misma=
tches

Errors:
    fs/udf/inode.c:805:6: error: variable 'newblock' is used uninitialized =
whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]

Warnings:
    fs/udf/inode.c:607:34: note: initialize the variable 'newblock' to sile=
nce this warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (arm, clang-13) =
=E2=80=94 FAIL, 1 error, 1 warning, 0 section mismatches

Errors:
    fs/udf/inode.c:805:6: error: variable 'newblock' is used uninitialized =
whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]

Warnings:
    fs/udf/inode.c:607:34: note: initialize the variable 'newblock' to sile=
nce this warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (arm, clang-1=
3) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mismatches

Errors:
    fs/udf/inode.c:805:6: error: variable 'newblock' is used uninitialized =
whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]

Warnings:
    fs/udf/inode.c:607:34: note: initialize the variable 'newblock' to sile=
nce this warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-amd-stoneyridge.flavour.config+x86-chr=
omebook (x86_64, clang-13) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mi=
smatches

Errors:
    fs/udf/inode.c:805:6: error: variable 'newblock' is used uninitialized =
whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]

Warnings:
    fs/udf/inode.c:607:34: note: initialize the variable 'newblock' to sile=
nce this warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-intel-denverton.flavour.config+x86-chr=
omebook (x86_64, clang-13) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mi=
smatches

Errors:
    fs/udf/inode.c:805:6: error: variable 'newblock' is used uninitialized =
whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]

Warnings:
    fs/udf/inode.c:607:34: note: initialize the variable 'newblock' to sile=
nce this warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-intel-pineview.flavour.config+x86-chro=
mebook (x86_64, clang-13) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mis=
matches

Errors:
    fs/udf/inode.c:805:6: error: variable 'newblock' is used uninitialized =
whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]

Warnings:
    fs/udf/inode.c:607:34: note: initialize the variable 'newblock' to sile=
nce this warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config (x86_64, clang=
-13) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mismatches

Errors:
    fs/udf/inode.c:805:6: error: variable 'newblock' is used uninitialized =
whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]

Warnings:
    fs/udf/inode.c:607:34: note: initialize the variable 'newblock' to sile=
nce this warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config+x86-chromebook=
 (x86_64, clang-13) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mismatches

Errors:
    fs/udf/inode.c:805:6: error: variable 'newblock' is used uninitialized =
whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]

Warnings:
    fs/udf/inode.c:607:34: note: initialize the variable 'newblock' to sile=
nce this warning

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook (arm64, clang-13) =E2=80=94 FAIL, 1 error, 0 war=
nings, 0 section mismatches

Errors:
    error: unknown warning option '-Wmaybe-uninitialized'; did you mean '-W=
uninitialized'? [-Werror,-Wunknown-warning-option]

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---
For more info write to <info@kernelci.org>
