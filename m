Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391DB14F7A
	for <llvm@lists.linux.dev>; Fri, 21 Jul 2023 09:33:55 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-668730696a4so1163316b3a.1
        for <llvm@lists.linux.dev>; Fri, 21 Jul 2023 02:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1689932035; x=1690536835;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=S06AqqBQY/XLaTfW98+CLvTaCgLNSccXV/8O8vUmFHQ=;
        b=Gl2t+UnboIuezCJMjDzvyRV/2zBcBBg+M4e4LB+GUmVIqnpYdYqI2Z+xlaQHf0qYoa
         UR6SXid8Vwxas8MZRBhGLNBTsdLBR+pVW4lRAdKZOXgLhoTOSUo38J9csJ8b/GRl4CPj
         pwpEZeiOAZFSNoQJ4if9kO198HNGro2iC4lluF+0tkM1tAGo8u3xIVhCqFt65IPTwOVn
         7p4ecmmnqLTks10jqf7KF6E9vd1MCgmFtuqwJUrifrWSA+lY0NODd7Cm5b1TMRf///LG
         02llI5u/mCJ8SePW6cFZeDFXCw58iinXlYnMHi8tnvMpS/kn+NUxC2+pQPEa0hszucCL
         3fnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689932035; x=1690536835;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S06AqqBQY/XLaTfW98+CLvTaCgLNSccXV/8O8vUmFHQ=;
        b=UzEJROAPHHnbWzHC9yQjWMsdXhSR9BO71amQVryZYnkiBsZ1yeSFtbWk/LzmnNWQx5
         rZyoLXhB13/FyGOyys0S81i1W9ixmtkEuJ+O31Y9trv2QHhNvtbCjX8AA6hdvagnZpP6
         WYksvHDv1o1sK24z6i5x6IvvtNozkAtrNEftDT14Yty/GdX6/ahr6chge4jK/zTMmxEg
         FzSTVFvrmFjztdb3O9VK6T4D+oZKpZtSJPrjZNB4ES4IhFnzbjHJTTDmy/inRNAQxMJi
         IAMaDd/9j3wQkaGzeZqim/Vb/+lfrDzHygdus1aZEE5EdyWajON0ZhebUl6kMjnb2sT+
         tlZQ==
X-Gm-Message-State: ABy/qLaS/d/R1ykBPud28cmwpup6iNI+6cvBWf+b0x2Ebn264cNmoCL+
	kV2BYno8HpTyM/U4fyhY1gsM+Cv1W1lp2HyQLM3r2A==
X-Google-Smtp-Source: APBJJlGhSg0viF/5+u9c1KfZSw1Aa28WHges2GPkIrJqJvJB8GO6cs/igNBy0PQk8znqoQPqOkpvZA==
X-Received: by 2002:a05:6a20:2d9d:b0:12d:3069:69e1 with SMTP id bf29-20020a056a202d9d00b0012d306969e1mr898912pzb.60.1689932034952;
        Fri, 21 Jul 2023 02:33:54 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id iw10-20020a170903044a00b001b531e8a000sm2985183plb.157.2023.07.21.02.33.53
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 02:33:54 -0700 (PDT)
Message-ID: <64ba5102.170a0220.f779d.573a@mx.google.com>
Date: Fri, 21 Jul 2023 02:33:54 -0700 (PDT)
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
X-Kernelci-Kernel: next-20230721
X-Kernelci-Report-Type: build
Subject: next/master build: 6 builds: 0 failed, 6 passed,
 1 warning (next-20230721)
To: llvm@lists.linux.dev
From: "kernelci.org bot" <bot@kernelci.org>

next/master build: 6 builds: 0 failed, 6 passed, 1 warning (next-20230721)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20230721/

Tree: next
Branch: master
Git Describe: next-20230721
Git Commit: ae867bc97b713121b2a7f5fcac68378a0774739b
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 4 unique architectures

Warnings Detected:

arm64:

arm:

sparc:
    allnoconfig (gcc-10): 1 warning

x86_64:


Warnings summary:

    1    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
allnoconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chromebook=
 (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatch=
es

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-qualcomm.flavour.config+arm64-chromeb=
ook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section misma=
tches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (arm, clang-13) =
=E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-intel-denverton.flavour.config+x86-chr=
omebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---
For more info write to <info@kernelci.org>
