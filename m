Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE69A37C
	for <llvm@lists.linux.dev>; Thu, 16 Mar 2023 02:31:24 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id qe8-20020a17090b4f8800b0023f07253a2cso164919pjb.3
        for <llvm@lists.linux.dev>; Wed, 15 Mar 2023 19:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1678933884;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3sHYphsV+PUCm1AoIxAN8a76L+Sy1g908xOCI7VEqtk=;
        b=4fuDaouZygtmXu2iRXLsycmve+NhsuVT6iziSsi54gPXFO7j64ZspiTV7i9dlDhJr+
         V6wTKiR8sTHDJ8dOdLfbOxlHqf/ZZ1+oT94epwIqCadRdkHSTunHKWGDL2YO3Nc4lQpc
         iMnJmpw9i93Dm5EjqXVld+IV0kCX3VkPzxH7U1s07QpIyBr94+rUmTIMRbYlGebOTPTn
         qQLseYwhlhz7nA9p21w675z2lJIPHvqI13h1JObyLXBs3zO6yZcMKMW0jWOXhI9TQym3
         JQLP5xylhZ3ypaQLCAgJVm4hVSJfWPHjKeqaTTxFiYsREylowWR+JvmxK///MUPdbNtQ
         0azg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678933884;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3sHYphsV+PUCm1AoIxAN8a76L+Sy1g908xOCI7VEqtk=;
        b=3tWWiNFxGRLZ3egBiMAN8szquZ4DiEWrzxyeNrhqM+JtGjwaJeoUxG2vn2sRDJo9QN
         r1Qrw7lA2p0I6yv/8KtMGxjyWDENjVGZzB2L5MHTWCJHozJG3+JOfnfYhM0Xo0A1pmhc
         SCa6ACC3O6pp+YpP9C/A8ALDg1A5wqJ+W6c4dG4/H7LSbQuO2gyQIv3ucIgRAwCgSYBc
         /rKfK/vESBsQHxLD/7bFhkGjhSevdeuuy8BuuMuDkcg+CUtjab5Mjbgty4jyki1fQbb/
         uVig8oTiGwCXdsz5zFbCMLREj9i8gS8aVdKNES7DA6C+97wwFFyoOhCBcuEWsgrasraP
         IH4g==
X-Gm-Message-State: AO0yUKUJhpsrYJelVfyvyp7aMZPJSyGjL80CYgafv82lra+e/49KWXow
	6s6NhLYdBHoWSZVbiRdRRB+Q8Nul8InmOpftFev5ixjD
X-Google-Smtp-Source: AK7set9cukMpLOhx1Aez+4f4axZeCmXg/xWMorrYTKvpWrf3Qa6hrANKZkiZ5xqO0685Xa+iOXvAQA==
X-Received: by 2002:a17:903:11c5:b0:19c:ea4d:5995 with SMTP id q5-20020a17090311c500b0019cea4d5995mr1862004plh.68.1678933882776;
        Wed, 15 Mar 2023 19:31:22 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e35-20020a635463000000b005034a57b963sm3905896pgm.58.2023.03.15.19.31.21
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 19:31:21 -0700 (PDT)
Message-ID: <64127f79.630a0220.eb689.9646@mx.google.com>
Date: Wed, 15 Mar 2023 19:31:21 -0700 (PDT)
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
X-Kernelci-Kernel: next-20230316
X-Kernelci-Report-Type: build
Subject: next/master build: 204 builds: 17 failed, 187 passed, 126 errors,
 24 warnings (next-20230316)
To: llvm@lists.linux.dev
From: "kernelci.org bot" <bot@kernelci.org>

next/master build: 204 builds: 17 failed, 187 passed, 126 errors, 24 warnin=
gs (next-20230316)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20230316/

Tree: next
Branch: master
Git Describe: next-20230316
Git Commit: 6f72958a49f68553f2b6ff713e8c8e51a34c1e1e
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 8 unique architectures

Build Failures Detected:

arc:
    haps_hs_smp_defconfig+kselftest: (gcc-10) FAIL

arm64:
    allmodconfig: (clang-17) FAIL

arm:
    allmodconfig: (clang-17) FAIL
    aspeed_g5_defconfig: (clang-17) FAIL
    aspeed_g4_defconfig: (gcc-10) FAIL
    aspeed_g5_defconfig: (gcc-10) FAIL
    imxrt_defconfig: (gcc-10) FAIL
    omap1_defconfig: (gcc-10) FAIL
    rpc_defconfig: (gcc-10) FAIL

i386:
    allmodconfig: (clang-17) FAIL

mips:
    32r2el_defconfig+debug: (gcc-10) FAIL
    ar7_defconfig: (gcc-10) FAIL
    ath79_defconfig: (gcc-10) FAIL
    decstation_64_defconfig: (gcc-10) FAIL
    rb532_defconfig: (gcc-10) FAIL

x86_64:
    cros://chromeos-5.10/x86_64/chromeos-intel-denverton.flavour.config+x86=
-chromebook: (clang-13) FAIL
    allmodconfig: (clang-17) FAIL

Errors and Warnings Detected:

arc:
    haps_hs_smp_defconfig+kselftest (gcc-10): 1 error

arm64:
    allmodconfig (clang-17): 2 errors, 1 warning

arm:
    allmodconfig (clang-17): 2 errors, 1 warning
    aspeed_g4_defconfig (gcc-10): 28 errors, 1 warning
    aspeed_g5_defconfig (gcc-10): 28 errors, 1 warning
    aspeed_g5_defconfig (clang-17): 20 errors, 2 warnings
    imxrt_defconfig (gcc-10): 28 errors, 1 warning
    omap1_defconfig (gcc-10): 3 errors
    rpc_defconfig (gcc-10): 2 errors

i386:
    allmodconfig (clang-17): 2 errors, 1 warning

mips:
    ar7_defconfig (gcc-10): 1 error
    ath79_defconfig (gcc-10): 1 error
    fuloong2e_defconfig (gcc-10): 1 error
    lemote2f_defconfig (gcc-10): 1 error
    loongson2k_defconfig (gcc-10): 1 error
    loongson3_defconfig (gcc-10): 1 error
    rb532_defconfig (gcc-10): 1 error

riscv:

sparc:
    allnoconfig (gcc-10): 1 warning
    sparc32_defconfig (gcc-10): 2 warnings
    sparc64_defconfig (gcc-10): 4 warnings
    sparc64_defconfig+debug (gcc-10): 2 warnings
    sparc64_defconfig+kselftest (gcc-10): 2 warnings
    tinyconfig (gcc-10): 1 warning

x86_64:
    allmodconfig (clang-17): 2 errors, 4 warnings
    cros://chromeos-5.10/x86_64/chromeos-intel-denverton.flavour.config+x86=
-chromebook (clang-13): 1 error

Errors summary:

    63   include/linux/rculist.h:393:27: error: invalid use of undefined ty=
pe =E2=80=98struct module=E2=80=99
    16   kernel/bpf/../module/internal.h:205:2: error: incomplete definitio=
n of type 'struct module'
    6    kernel/module/internal.h:252:14: error: expected =E2=80=98;=E2=80=
=99, =E2=80=98,=E2=80=99 or =E2=80=98)=E2=80=99 before =E2=80=98const=E2=80=
=99
    6    include/linux/stddef.h:16:32: error: invalid use of undefined type=
 =E2=80=98struct module=E2=80=99
    6    include/linux/container_of.h:20:47: error: invalid use of undefine=
d type =E2=80=98struct module=E2=80=99
    6    ./../include/linux/compiler_types.h:338:27: error: expression in s=
tatic assertion is not an integer
    5    drivers/net/wireless/intel/iwlwifi/iwl-devtrace.c:15:32: error: un=
known warning group '-Wsuggest-attribute=3Dformat', ignored [-Werror,-Wunkn=
own-warning-option]
    4    drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:2322:8: error: variab=
le 'possible_crtcs' is used uninitialized whenever 'if' condition is false =
[-Werror,-Wsometimes-uninitialized]
    4    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=
=80=98-mhard-float=E2=80=99
    3    include/linux/rculist.h:392:7: error: invalid use of undefined typ=
e =E2=80=98struct module=E2=80=99
    1    net/bpfilter/main.c:3:10: fatal error: sys/uio.h: No such file or =
directory
    1    kernel/bpf/../module/internal.h:205:2: error: operand of type 'voi=
d' where arithmetic or pointer type is required
    1    kernel/bpf/../module/internal.h:205:2: error: offsetof of incomple=
te type 'typeof (*mod)' (aka 'struct module')
    1    kernel/bpf/../module/internal.h:205:2: error: assigning to 'struct=
 module *' from incompatible type 'void'
    1    fatal error: too many errors emitted, stopping now [-ferror-limit=
=3D]
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=
=3D0x'
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=
=3D0x'

Warnings summary:

    10   <stdin>:1519:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    4    drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:2304:21: note: initia=
lize the variable 'possible_crtcs' to silence this warning
    3    kernel/bpf/../module/internal.h:94:58: warning: =E2=80=98enum mod_=
mem_type=E2=80=99 declared inside parameter list will not be visible outsid=
e of this definition or declaration
    2    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version genera=
tion failed, symbol will not be versioned.
    1    vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x28: relocation to=
 !ENDBR: machine_kexec_prepare+0x27d
    1    kernel/bpf/../module/internal.h:94:58: warning: declaration of 'en=
um mod_mem_type' will not be visible outside of this function [-Wvisibility]
    1    fs/reiserfs/reiserfs.o: warning: objtool: balance_leaf+0x75ee: sta=
ck state mismatch: cfa1=3D4+360 cfa2=3D4+352
    1    drivers/media/i2c/m5mols/m5mols.o: warning: objtool: m5mols_set_fm=
t() falls through to next function __cfi_m5mols_set_frame_desc()
    1    1 warning and 20 errors generated.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
32r2el_defconfig+debug (mips, gcc-10) =E2=80=94 FAIL, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-17) =E2=80=94 FAIL, 2 errors, 1 warning, 0 section=
 mismatches

Errors:
    drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:2322:8: error: variable 'p=
ossible_crtcs' is used uninitialized whenever 'if' condition is false [-Wer=
ror,-Wsometimes-uninitialized]
    drivers/net/wireless/intel/iwlwifi/iwl-devtrace.c:15:32: error: unknown=
 warning group '-Wsuggest-attribute=3Dformat', ignored [-Werror,-Wunknown-w=
arning-option]

Warnings:
    drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:2304:21: note: initialize =
the variable 'possible_crtcs' to silence this warning

---------------------------------------------------------------------------=
-----
allmodconfig (i386, clang-17) =E2=80=94 FAIL, 2 errors, 1 warning, 0 sectio=
n mismatches

Errors:
    drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:2322:8: error: variable 'p=
ossible_crtcs' is used uninitialized whenever 'if' condition is false [-Wer=
ror,-Wsometimes-uninitialized]
    drivers/net/wireless/intel/iwlwifi/iwl-devtrace.c:15:32: error: unknown=
 warning group '-Wsuggest-attribute=3Dformat', ignored [-Werror,-Wunknown-w=
arning-option]

Warnings:
    drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:2304:21: note: initialize =
the variable 'possible_crtcs' to silence this warning

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-17) =E2=80=94 FAIL, 2 errors, 1 warning, 0 secti=
on mismatches

Errors:
    drivers/net/wireless/intel/iwlwifi/iwl-devtrace.c:15:32: error: unknown=
 warning group '-Wsuggest-attribute=3Dformat', ignored [-Werror,-Wunknown-w=
arning-option]
    drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:2322:8: error: variable 'p=
ossible_crtcs' is used uninitialized whenever 'if' condition is false [-Wer=
ror,-Wsometimes-uninitialized]

Warnings:
    drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:2304:21: note: initialize =
the variable 'possible_crtcs' to silence this warning

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, clang-17) =E2=80=94 FAIL, 2 errors, 4 warnings, 0 sec=
tion mismatches

Errors:
    drivers/net/wireless/intel/iwlwifi/iwl-devtrace.c:15:32: error: unknown=
 warning group '-Wsuggest-attribute=3Dformat', ignored [-Werror,-Wunknown-w=
arning-option]
    drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:2322:8: error: variable 'p=
ossible_crtcs' is used uninitialized whenever 'if' condition is false [-Wer=
ror,-Wsometimes-uninitialized]

Warnings:
    vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x28: relocation to !END=
BR: machine_kexec_prepare+0x27d
    fs/reiserfs/reiserfs.o: warning: objtool: balance_leaf+0x75ee: stack st=
ate mismatch: cfa1=3D4+360 cfa2=3D4+352
    drivers/media/i2c/m5mols/m5mols.o: warning: objtool: m5mols_set_fmt() f=
alls through to next function __cfi_m5mols_set_frame_desc()
    drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:2304:21: note: initialize =
the variable 'possible_crtcs' to silence this warning

---------------------------------------------------------------------------=
-----
allnoconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
am200epdkit_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
ar7_defconfig (mips, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section=
 mismatches

Errors:
    kernel/module/internal.h:252:14: error: expected =E2=80=98;=E2=80=99, =
=E2=80=98,=E2=80=99 or =E2=80=98)=E2=80=99 before =E2=80=98const=E2=80=99

---------------------------------------------------------------------------=
-----
aspeed_g4_defconfig (arm, gcc-10) =E2=80=94 FAIL, 28 errors, 1 warning, 0 s=
ection mismatches

Errors:
    include/linux/container_of.h:20:47: error: invalid use of undefined typ=
e =E2=80=98struct module=E2=80=99
    ./../include/linux/compiler_types.h:338:27: error: expression in static=
 assertion is not an integer
    include/linux/stddef.h:16:32: error: invalid use of undefined type =E2=
=80=98struct module=E2=80=99
    include/linux/rculist.h:392:7: error: invalid use of undefined type =E2=
=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/container_of.h:20:47: error: invalid use of undefined typ=
e =E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    ./../include/linux/compiler_types.h:338:27: error: expression in static=
 assertion is not an integer
    include/linux/stddef.h:16:32: error: invalid use of undefined type =E2=
=80=98struct module=E2=80=99

Warnings:
    kernel/bpf/../module/internal.h:94:58: warning: =E2=80=98enum mod_mem_t=
ype=E2=80=99 declared inside parameter list will not be visible outside of =
this definition or declaration

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, gcc-10) =E2=80=94 FAIL, 28 errors, 1 warning, 0 s=
ection mismatches

Errors:
    include/linux/container_of.h:20:47: error: invalid use of undefined typ=
e =E2=80=98struct module=E2=80=99
    ./../include/linux/compiler_types.h:338:27: error: expression in static=
 assertion is not an integer
    include/linux/stddef.h:16:32: error: invalid use of undefined type =E2=
=80=98struct module=E2=80=99
    include/linux/rculist.h:392:7: error: invalid use of undefined type =E2=
=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/container_of.h:20:47: error: invalid use of undefined typ=
e =E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    ./../include/linux/compiler_types.h:338:27: error: expression in static=
 assertion is not an integer
    include/linux/stddef.h:16:32: error: invalid use of undefined type =E2=
=80=98struct module=E2=80=99

Warnings:
    kernel/bpf/../module/internal.h:94:58: warning: =E2=80=98enum mod_mem_t=
ype=E2=80=99 declared inside parameter list will not be visible outside of =
this definition or declaration

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, clang-17) =E2=80=94 FAIL, 20 errors, 2 warnings, =
0 section mismatches

Errors:
    kernel/bpf/../module/internal.h:205:2: error: incomplete definition of =
type 'struct module'
    kernel/bpf/../module/internal.h:205:2: error: offsetof of incomplete ty=
pe 'typeof (*mod)' (aka 'struct module')
    kernel/bpf/../module/internal.h:205:2: error: assigning to 'struct modu=
le *' from incompatible type 'void'
    kernel/bpf/../module/internal.h:205:2: error: incomplete definition of =
type 'struct module'
    kernel/bpf/../module/internal.h:205:2: error: incomplete definition of =
type 'struct module'
    kernel/bpf/../module/internal.h:205:2: error: incomplete definition of =
type 'struct module'
    kernel/bpf/../module/internal.h:205:2: error: incomplete definition of =
type 'struct module'
    kernel/bpf/../module/internal.h:205:2: error: incomplete definition of =
type 'struct module'
    kernel/bpf/../module/internal.h:205:2: error: incomplete definition of =
type 'struct module'
    kernel/bpf/../module/internal.h:205:2: error: incomplete definition of =
type 'struct module'
    kernel/bpf/../module/internal.h:205:2: error: incomplete definition of =
type 'struct module'
    kernel/bpf/../module/internal.h:205:2: error: incomplete definition of =
type 'struct module'
    kernel/bpf/../module/internal.h:205:2: error: operand of type 'void' wh=
ere arithmetic or pointer type is required
    kernel/bpf/../module/internal.h:205:2: error: incomplete definition of =
type 'struct module'
    kernel/bpf/../module/internal.h:205:2: error: incomplete definition of =
type 'struct module'
    kernel/bpf/../module/internal.h:205:2: error: incomplete definition of =
type 'struct module'
    kernel/bpf/../module/internal.h:205:2: error: incomplete definition of =
type 'struct module'
    kernel/bpf/../module/internal.h:205:2: error: incomplete definition of =
type 'struct module'
    kernel/bpf/../module/internal.h:205:2: error: incomplete definition of =
type 'struct module'
    fatal error: too many errors emitted, stopping now [-ferror-limit=3D]

Warnings:
    kernel/bpf/../module/internal.h:94:58: warning: declaration of 'enum mo=
d_mem_type' will not be visible outside of this function [-Wvisibility]
    1 warning and 20 errors generated.

---------------------------------------------------------------------------=
-----
assabet_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
ath25_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
ath79_defconfig (mips, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 secti=
on mismatches

Errors:
    kernel/module/internal.h:252:14: error: expected =E2=80=98;=E2=80=99, =
=E2=80=98,=E2=80=99 or =E2=80=98)=E2=80=99 before =E2=80=98const=E2=80=99

---------------------------------------------------------------------------=
-----
axm55xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
axs103_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
axs103_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
bcm2835_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
bcm47xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
bcm63xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
bigsur_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
bmips_be_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
bmips_stb_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
cavium_octeon_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
omebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-intel-denverton.flavour.config+x86-chr=
omebook (x86_64, clang-13) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section m=
ismatches

Errors:
    drivers/net/wireless/intel/iwlwifi/iwl-devtrace.c:15:32: error: unknown=
 warning group '-Wsuggest-attribute=3Dformat', ignored [-Werror,-Wunknown-w=
arning-option]

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
cu1000-neo_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
cu1830-neo_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-10) =E2=80=94 FAIL, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
defconfig (riscv, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-17) =E2=80=94 PASS, 0 er=
rors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 error=
s, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+crypto (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
defconfig+debug (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
defconfig+ima (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 0 warnings, 0 s=
ection mismatches

Errors:
    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=80=
=98-mhard-float=E2=80=99

---------------------------------------------------------------------------=
-----
gcw0_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
gpr_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
h3600_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
haps_hs_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig+debug (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warni=
ngs, 0 section mismatches

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig+kselftest (arc, gcc-10) =E2=80=94 FAIL, 1 error, 0 wa=
rnings, 0 section mismatches

Errors:
    net/bpfilter/main.c:3:10: fatal error: sys/uio.h: No such file or direc=
tory

---------------------------------------------------------------------------=
-----
hisi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
hsdk_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig+debug (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
imx_v4_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
imxrt_defconfig (arm, gcc-10) =E2=80=94 FAIL, 28 errors, 1 warning, 0 secti=
on mismatches

Errors:
    include/linux/container_of.h:20:47: error: invalid use of undefined typ=
e =E2=80=98struct module=E2=80=99
    ./../include/linux/compiler_types.h:338:27: error: expression in static=
 assertion is not an integer
    include/linux/stddef.h:16:32: error: invalid use of undefined type =E2=
=80=98struct module=E2=80=99
    include/linux/rculist.h:392:7: error: invalid use of undefined type =E2=
=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/container_of.h:20:47: error: invalid use of undefined typ=
e =E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    ./../include/linux/compiler_types.h:338:27: error: expression in static=
 assertion is not an integer
    include/linux/stddef.h:16:32: error: invalid use of undefined type =E2=
=80=98struct module=E2=80=99

Warnings:
    kernel/bpf/../module/internal.h:94:58: warning: =E2=80=98enum mod_mem_t=
ype=E2=80=99 declared inside parameter list will not be visible outside of =
this definition or declaration

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
ip22_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ip27_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ip28_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ip32_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
lemote2f_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 0 warnings, 0 se=
ction mismatches

Errors:
    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=80=
=98-mhard-float=E2=80=99

---------------------------------------------------------------------------=
-----
loongson1b_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
loongson1c_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
loongson2k_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 0 warnings, 0 =
section mismatches

Errors:
    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=80=
=98-mhard-float=E2=80=99

---------------------------------------------------------------------------=
-----
loongson3_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 0 warnings, 0 s=
ection mismatches

Errors:
    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=80=
=98-mhard-float=E2=80=99

---------------------------------------------------------------------------=
-----
lpc18xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
lpc32xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
malta_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnin=
gs, 0 section mismatches

---------------------------------------------------------------------------=
-----
maltaaprp_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
maltasmvp_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
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
maltaup_xpa_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
mps2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
mtx1_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-10) =E2=80=94 PASS, =
0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-10) =E2=80=
=94 PASS, 0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0=
 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy (arm, gcc-10) =E2=80=94 PASS, 0=
 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+debug (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
neponset_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

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
nommu_k210_defconfig (riscv, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_sdcard_defconfig (riscv, clang-17) =E2=80=94 PASS, 0 errors, 0 w=
arnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_sdcard_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 war=
nings, 0 section mismatches

---------------------------------------------------------------------------=
-----
nsimosci_hs_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
nsimosci_hs_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

---------------------------------------------------------------------------=
-----
omap1_defconfig (arm, gcc-10) =E2=80=94 FAIL, 3 errors, 0 warnings, 0 secti=
on mismatches

Errors:
    kernel/module/internal.h:252:14: error: expected =E2=80=98;=E2=80=99, =
=E2=80=98,=E2=80=99 or =E2=80=98)=E2=80=99 before =E2=80=98const=E2=80=99
    kernel/module/internal.h:252:14: error: expected =E2=80=98;=E2=80=99, =
=E2=80=98,=E2=80=99 or =E2=80=98)=E2=80=99 before =E2=80=98const=E2=80=99
    kernel/module/internal.h:252:14: error: expected =E2=80=98;=E2=80=99, =
=E2=80=98,=E2=80=99 or =E2=80=98)=E2=80=99 before =E2=80=98const=E2=80=99

---------------------------------------------------------------------------=
-----
omap2plus_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
omega2p_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
oxnas_v6_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
pic32mzda_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
pxa3xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
pxa910_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
pxa_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

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
rb532_defconfig (mips, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 secti=
on mismatches

Errors:
    kernel/module/internal.h:252:14: error: expected =E2=80=98;=E2=80=99, =
=E2=80=98,=E2=80=99 or =E2=80=98)=E2=80=99 before =E2=80=98const=E2=80=99

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, gcc-10) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 section=
 mismatches

Errors:
    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=3D0x'
    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=3D0x'

---------------------------------------------------------------------------=
-----
rs90_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
rt305x_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
rv32_defconfig (riscv, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
rv32_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
sama7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
sb1250_swarm_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
sp7021_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
sparc32_defconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
sparc64_defconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.

---------------------------------------------------------------------------=
-----
sparc64_defconfig+debug (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warning=
s, 0 section mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
sparc64_defconfig+kselftest (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 2 war=
nings, 0 section mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
spear3xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
stm32_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
tinyconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
tinyconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
vdk_hs38_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
vdk_hs38_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
versatile_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
vocore2_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
wpcm450_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, rustc-1.62) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+amdgpu (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnin=
gs, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+crypto (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnin=
gs, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+debug (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+ima (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 war=
nings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+rust (x86_64, rustc-1.62) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+rust-samples (x86_64, rustc-1.62) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, =
0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook+amdgpu (x86_64, gcc-10) =E2=80=94 PASS, 0 e=
rrors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86_kvm_guest (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0=
 warnings, 0 section mismatches

---
For more info write to <info@kernelci.org>
