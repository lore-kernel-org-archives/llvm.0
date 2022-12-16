Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62833366
	for <llvm@lists.linux.dev>; Fri, 16 Dec 2022 03:18:19 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id l10so1020019plb.8
        for <llvm@lists.linux.dev>; Thu, 15 Dec 2022 19:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4WJdMXvZ7kUAv4szoXLebQMQHWI3Ns6DNh26EWF8SFI=;
        b=6TQOaWevgEnbEBQrLjlGW9hRHwtzgOKTyN6OVD1Ks9HCJHnrMl4Nl/ttW0VsJdbanf
         GCoDfDrr1vgXMyMIYP9m5tQuTewsK+go4BiuJT0YUhvF3oBGS2vteCz5aznktZoi7zOS
         byZGrF9UY3rIq1ptkUoheZmAzfDBzvgL35HBNujX9KW5X9ZLEPBsylRqeby+oz+lZxcS
         sccKbqSbUSWdUpKNR2hpXMiSrUQaSUHsjzzr49AreKnh00sqv6nBYkX2Dnt2xXV/DPaX
         TrrnVVPO9pTtbhF20bseghiqzz9bfI6yWDbM0WvfIuAPFakd5s1cBh0Kh704X9Q7Ko+n
         3o4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4WJdMXvZ7kUAv4szoXLebQMQHWI3Ns6DNh26EWF8SFI=;
        b=M+i7G1PoXvC03cUKW3mF3w3t8Wx756sSz1r3bbtbmKLr/K6/4SXrv2dbywdlxrtClJ
         sDjY6A3FgNbQ2jOJVNx/vJBykzpSXT1ZadEn0EKNAPZWlI+rq4Y1DUj4oHoBRtszRLUj
         iiBWc/iOwuQv84vgue+gEm+ZBqWfkLFYDN3qEEyQe5tuNmGa9LB4iMbCcgy7u9pi84W/
         j5l0l47Pkvmjo7ZyKY/CkKFpOwLV3Or4qltKCVBTM8kBKkrGplNJG7JGAQSMjoDjbPjU
         ApkAJ8/OR9qdVU0u4zKYlaZmaayPLZbIls+vH+THhjU73n3Zbuk0f7/3xSeubGLnucq7
         6z+g==
X-Gm-Message-State: ANoB5pm6xoYKR9ew+r0SP+NCF/L5aQUd1etyHBDybcpAKBjwK+bvpLAg
	GICMimWG00anNyInKgLqbKODc/W3BTYiOddA72MWBA==
X-Google-Smtp-Source: AA0mqf4msFBS4SmPjxBYX83qlrC1cN1TJx9cHCIwN6ci76b43L+QtvlfJzBS5GgNDwypwTGnY1Eq6w==
X-Received: by 2002:a17:90b:1295:b0:219:967c:95c3 with SMTP id fw21-20020a17090b129500b00219967c95c3mr30970023pjb.1.1671160698293;
        Thu, 15 Dec 2022 19:18:18 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 68-20020a17090a09ca00b00219025945dcsm3843101pjo.19.2022.12.15.19.18.17
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 19:18:17 -0800 (PST)
Message-ID: <639be379.170a0220.c071a.8509@mx.google.com>
Date: Thu, 15 Dec 2022 19:18:17 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20221216
X-Kernelci-Report-Type: build
X-Kernelci-Tree: next
Subject: next/master build: 29 builds: 1 failed, 28 passed, 1 error,
 4 warnings (next-20221216)
To: llvm@lists.linux.dev
From: "kernelci.org bot" <bot@kernelci.org>

next/master build: 29 builds: 1 failed, 28 passed, 1 error, 4 warnings (nex=
t-20221216)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20221216/

Tree: next
Branch: master
Git Describe: next-20221216
Git Commit: ca39c4daa6f7f770b1329ffb46f1e4a6bcc3f291
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failure Detected:

arm64:
    allmodconfig: (gcc-10) FAIL

Errors and Warnings Detected:

arc:

arm64:
    allmodconfig (gcc-10): 1 error, 1 warning

arm:
    tegra_defconfig (gcc-10): 1 warning

mips:
    rs90_defconfig (gcc-10): 1 warning

riscv:

sparc:
    allnoconfig (gcc-10): 1 warning

x86_64:

Errors summary:

    1    include/linux/fortify-string.h:57:29: error: argument 2 null where=
 non-null expected [-Werror=3Dnonnull]

Warnings summary:

    2    fs/coredump.c:841:12: warning: =E2=80=98dump_emit_page=E2=80=99 de=
fined but not used [-Wunused-function]
    1    cc1: all warnings being treated as errors
    1    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-10) =E2=80=94 FAIL, 1 error, 1 warning, 0 section =
mismatches

Errors:
    include/linux/fortify-string.h:57:29: error: argument 2 null where non-=
null expected [-Werror=3Dnonnull]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
allnoconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
aspeed_g4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config (x86_64, clang=
-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
cu1000-neo_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_16K_PAGES=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
ezx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
h5000_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
maltasmvp_eva_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
maltaup_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-16) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
netwinder_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
nhk8815_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
rs90_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/coredump.c:841:12: warning: =E2=80=98dump_emit_page=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/coredump.c:841:12: warning: =E2=80=98dump_emit_page=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, clang-16) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+amdgpu (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnin=
gs, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook+amdgpu (x86_64, gcc-10) =E2=80=94 PASS, 0 e=
rrors, 0 warnings, 0 section mismatches

---
For more info write to <info@kernelci.org>
