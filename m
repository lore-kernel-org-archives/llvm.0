Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94847FF
	for <llvm@lists.linux.dev>; Wed,  5 Jul 2023 04:41:30 +0000 (UTC)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-560b7ac3cbfso4250809eaf.2
        for <llvm@lists.linux.dev>; Tue, 04 Jul 2023 21:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1688532089; x=1691124089;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AmRiaLffe9YUXhGNiOw28wf49CfTmQstIn++K2MStig=;
        b=GT/glx0sNf/yomP1stDJ7v4SNwNwF16kC9wj/BQ2nVZLAOgxQDkNT69Wao4qzOtH8y
         06wZjjqeFOvX98LfDTrjh3GUwkv+6/sn7ZFQkQhfLaZ0Dm/DKZrXWRdIopzzpNI4wXXs
         nsO66B0Uhy8GOgGVsgUpUY1QZ20+CoSpP8vxlX8X0OoHVr+9qzcK0nIZiFkkJO/iQPn1
         JUSrGOPlXcG34Nxc0gQtSY2pDGxUlM3JTKDZywitFoQjGd1NvkDs9NHRol0ZYFntDVNE
         t2yq46Wk3I50ovSeufNGOxaAAvN428xuD+nmwgM/v0dHfmAFvxdshqXtC1Qf1dvDRtVc
         zs3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688532089; x=1691124089;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AmRiaLffe9YUXhGNiOw28wf49CfTmQstIn++K2MStig=;
        b=P+MtqwPsZh7+zPcrqCMLMLYULTPsQPOGK2xNE6auI26wxpCZ/WscRqIqt+rK3tUOzg
         LdohSjb0wy2UpznTa68lDmnMBoKvKBOmvg3xLr2HA44CHSoUQOFUTAsUzw40MLvyYEFe
         nPAb5kZMTvsNP4dCRjlWhUsWi0mQ+/jfZN8CVSmZwwJJRKA5MXJCIPE6Iu+AjS1Ry65O
         64kqZyOvFmc931HwPfoMwONX5heIW054vjfhXWNmR5O/qokrcRaD9lRECW9rHAHLlPXS
         O/zfyo1BXt08ol0pwPbh5E86qOMaqdpY/GSYxTErPcaJXvw2H+a/nxjYz2mKl1JKRBz1
         p8+g==
X-Gm-Message-State: AC+VfDw3kC7DabqNtVRzriqgNHoFJHWZdS7HOwPYadg0RyL0dmlXI4D0
	JjZgizM0g55/3Ap2TbDAp7ZGXrRwaxukr7yCjNSfpA==
X-Google-Smtp-Source: ACHHUZ4u7u8zVmWI5H9SVatXxKcdyskZbo0X3NJl/1e7tmRFQGQj+8W1d/20dEljZZjyLe494yarDQ==
X-Received: by 2002:a05:6870:f592:b0:1a9:af29:46eb with SMTP id eh18-20020a056870f59200b001a9af2946ebmr15656822oab.59.1688532088550;
        Tue, 04 Jul 2023 21:41:28 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id ha8-20020a17090af3c800b0025bbe90d3cbsm398714pjb.44.2023.07.04.21.41.26
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 21:41:27 -0700 (PDT)
Message-ID: <64a4f477.170a0220.ee6a5.11d0@mx.google.com>
Date: Tue, 04 Jul 2023 21:41:27 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20230705
X-Kernelci-Tree: next
X-Kernelci-Report-Type: build
X-Kernelci-Branch: master
Subject: next/master build: 188 builds: 8 failed, 180 passed, 57 errors,
 41 warnings (next-20230705)
To: llvm@lists.linux.dev
From: "kernelci.org bot" <bot@kernelci.org>

next/master build: 188 builds: 8 failed, 180 passed, 57 errors, 41 warnings=
 (next-20230705)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20230705/

Tree: next
Branch: master
Git Describe: next-20230705
Git Commit: e1f6a8eaf1c271a0158114a03e3605f4fba059ad
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 8 unique architectures

Build Failures Detected:

arc:
    haps_hs_smp_defconfig+kselftest: (gcc-10) FAIL

arm64:
    allmodconfig: (clang-17) FAIL

arm:
    allmodconfig: (clang-17) FAIL
    rpc_defconfig: (gcc-10) FAIL

i386:
    allmodconfig: (clang-17) FAIL

mips:
    decstation_64_defconfig: (gcc-10) FAIL
    malta_kvm_defconfig: (gcc-10) FAIL

x86_64:
    allmodconfig: (clang-17) FAIL

Errors and Warnings Detected:

arc:
    haps_hs_smp_defconfig+kselftest (gcc-10): 1 error

arm64:
    allmodconfig (clang-17): 13 errors

arm:
    allmodconfig (clang-17): 13 errors
    rpc_defconfig (gcc-10): 2 errors

i386:
    allmodconfig (clang-17): 13 errors

mips:
    malta_kvm_defconfig (gcc-10): 2 errors

riscv:

sparc:
    allnoconfig (gcc-10): 1 warning
    sparc32_defconfig (gcc-10): 2 warnings
    sparc64_defconfig (gcc-10): 4 warnings
    sparc64_defconfig+debug (gcc-10): 2 warnings
    sparc64_defconfig+kselftest (gcc-10): 2 warnings
    tinyconfig (gcc-10): 1 warning

x86_64:
    allmodconfig (clang-17): 13 errors, 2 warnings
    allnoconfig (gcc-10): 3 warnings
    x86_64_defconfig (gcc-10): 3 warnings
    x86_64_defconfig+amdgpu (gcc-10): 3 warnings
    x86_64_defconfig+crypto (gcc-10): 3 warnings
    x86_64_defconfig+debug (gcc-10): 3 warnings
    x86_64_defconfig+ima (gcc-10): 3 warnings
    x86_64_defconfig+kselftest (gcc-10): 3 warnings
    x86_64_defconfig+x86-chromebook+amdgpu (gcc-10): 3 warnings
    x86_64_defconfig+x86-chromebook+kselftest (gcc-10): 3 warnings

Errors summary:

    4    drivers/scsi/aacraid/commsup.c:1790:15: error: array index 3 is pa=
st the end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), ca=
st to '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    4    drivers/scsi/aacraid/commsup.c:1789:15: error: array index 2 is pa=
st the end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), ca=
st to '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    4    drivers/scsi/aacraid/commsup.c:1788:15: error: array index 1 is pa=
st the end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), ca=
st to '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    4    drivers/scsi/aacraid/commsup.c:1351:18: error: array index 4 is pa=
st the end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), ca=
st to '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    4    drivers/scsi/aacraid/commsup.c:1350:18: error: array index 6 is pa=
st the end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), ca=
st to '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    4    drivers/scsi/aacraid/commsup.c:1349:18: error: array index 1 is pa=
st the end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), ca=
st to '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    4    drivers/scsi/aacraid/commsup.c:1334:19: error: array index 4 is pa=
st the end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), ca=
st to '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    4    drivers/scsi/aacraid/commsup.c:1333:50: error: array index 5 is pa=
st the end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), ca=
st to '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    4    drivers/scsi/aacraid/commsup.c:1333:19: error: array index 6 is pa=
st the end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), ca=
st to '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    4    drivers/scsi/aacraid/commsup.c:1332:18: error: array index 1 is pa=
st the end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), ca=
st to '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    4    drivers/scsi/aacraid/commsup.c:1292:21: error: array index 3 is pa=
st the end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), ca=
st to '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    4    drivers/scsi/aacraid/commsup.c:1290:20: error: array index 3 is pa=
st the end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), ca=
st to '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    4    drivers/scsi/aacraid/commsup.c:1170:17: error: array index 1 is pa=
st the end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), ca=
st to '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    1    net/bpfilter/main.c:3:10: fatal error: sys/uio.h: No such file or =
directory
    1    arch/mips/kvm/stats.c:59:22: error: invalid type argument of =E2=
=80=98->=E2=80=99 (have =E2=80=98struct mips_coproc=E2=80=99)
    1    arch/mips/kvm/stats.c:57:23: error: invalid type argument of =E2=
=80=98->=E2=80=99 (have =E2=80=98struct mips_coproc=E2=80=99)
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=
=3D0x'
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=
=3D0x'

Warnings summary:

    10   <stdin>:1519:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    8    vmlinux.o: warning: objtool: iovec_from_user+0x88: call to copy_io=
vec_from_user.part.0() with UACCESS enabled
    7    vmlinux.o: warning: objtool: __import_iovec+0x147: call to copy_io=
vec_from_user.part.0() with UACCESS enabled
    3    vmlinux.o: warning: objtool: .altinstr_replacement+0x17ef: redunda=
nt UACCESS disable
    2    vmlinux.o: warning: objtool: .altinstr_replacement+0x1ddc: redunda=
nt UACCESS disable
    2    vmlinux.o: warning: objtool: .altinstr_replacement+0x17e5: redunda=
nt UACCESS disable
    2    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version genera=
tion failed, symbol will not be versioned.
    1    vmlinux.o: warning: objtool: __import_iovec+0x342: call to copy_io=
vec_from_user.part.0() with UACCESS enabled
    1    vmlinux.o: warning: objtool: .altinstr_replacement+0x19aa: redunda=
nt UACCESS disable
    1    lib/iov_iter.o: warning: objtool: iovec_from_user+0x80: call to co=
py_iovec_from_user.part.0() with UACCESS enabled
    1    lib/iov_iter.o: warning: objtool: __import_iovec+0x13b: call to co=
py_iovec_from_user.part.0() with UACCESS enabled
    1    lib/iov_iter.o: warning: objtool: .altinstr_replacement+0x1f: redu=
ndant UACCESS disable
    1    fs/reiserfs/reiserfs.o: warning: objtool: balance_leaf+0x7714: sta=
ck state mismatch: cfa1=3D4+376 cfa2=3D4+368
    1    drivers/misc/lkdtm/lkdtm.o: warning: objtool: bad call to elf_init=
_reloc_text_sym() for data symbol .rodata

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
32r2el_defconfig+debug (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warni=
ngs, 0 section mismatches

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-17) =E2=80=94 FAIL, 13 errors, 0 warnings, 0 secti=
on mismatches

Errors:
    drivers/scsi/aacraid/commsup.c:1170:17: error: array index 1 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1290:20: error: array index 3 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1292:21: error: array index 3 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1332:18: error: array index 1 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1333:19: error: array index 6 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1333:50: error: array index 5 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1334:19: error: array index 4 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1349:18: error: array index 1 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1350:18: error: array index 6 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1351:18: error: array index 4 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1788:15: error: array index 1 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1789:15: error: array index 2 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1790:15: error: array index 3 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-17) =E2=80=94 FAIL, 13 errors, 0 warnings, 0 sec=
tion mismatches

Errors:
    drivers/scsi/aacraid/commsup.c:1170:17: error: array index 1 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1290:20: error: array index 3 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1292:21: error: array index 3 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1332:18: error: array index 1 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1333:19: error: array index 6 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1333:50: error: array index 5 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1334:19: error: array index 4 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1349:18: error: array index 1 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1350:18: error: array index 6 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1351:18: error: array index 4 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1788:15: error: array index 1 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1789:15: error: array index 2 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1790:15: error: array index 3 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allmodconfig (i386, clang-17) =E2=80=94 FAIL, 13 errors, 0 warnings, 0 sect=
ion mismatches

Errors:
    drivers/scsi/aacraid/commsup.c:1170:17: error: array index 1 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1290:20: error: array index 3 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1292:21: error: array index 3 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1332:18: error: array index 1 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1333:19: error: array index 6 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1333:50: error: array index 5 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1334:19: error: array index 4 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1349:18: error: array index 1 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1350:18: error: array index 6 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1351:18: error: array index 4 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1788:15: error: array index 1 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1789:15: error: array index 2 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1790:15: error: array index 3 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, clang-17) =E2=80=94 FAIL, 13 errors, 2 warnings, 0 se=
ction mismatches

Errors:
    drivers/scsi/aacraid/commsup.c:1170:17: error: array index 1 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1290:20: error: array index 3 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1292:21: error: array index 3 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1332:18: error: array index 1 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1333:19: error: array index 6 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1333:50: error: array index 5 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1334:19: error: array index 4 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1349:18: error: array index 1 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1350:18: error: array index 6 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1351:18: error: array index 4 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1788:15: error: array index 1 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1789:15: error: array index 2 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1790:15: error: array index 3 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]

Warnings:
    fs/reiserfs/reiserfs.o: warning: objtool: balance_leaf+0x7714: stack st=
ate mismatch: cfa1=3D4+376 cfa2=3D4+368
    drivers/misc/lkdtm/lkdtm.o: warning: objtool: bad call to elf_init_relo=
c_text_sym() for data symbol .rodata

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    lib/iov_iter.o: warning: objtool: .altinstr_replacement+0x1f: redundant=
 UACCESS disable
    lib/iov_iter.o: warning: objtool: iovec_from_user+0x80: call to copy_io=
vec_from_user.part.0() with UACCESS enabled
    lib/iov_iter.o: warning: objtool: __import_iovec+0x13b: call to copy_io=
vec_from_user.part.0() with UACCESS enabled

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
allnoconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
am200epdkit_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
ar7_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
aspeed_g4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

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
ath79_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
defconfig (riscv, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 error=
s, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 error=
s, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook+kselftest (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 0 warnings, 0 section mismatches

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
defconfig+kselftest (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+videodec (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

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
i386_defconfig (i386, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig+kselftest (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

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
imxrt_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

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
lemote2f_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
loongson1b_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
loongson2k_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
loongson3_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

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
malta_kvm_defconfig (mips, gcc-10) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 =
section mismatches

Errors:
    arch/mips/kvm/stats.c:57:23: error: invalid type argument of =E2=80=98-=
>=E2=80=99 (have =E2=80=98struct mips_coproc=E2=80=99)
    arch/mips/kvm/stats.c:59:22: error: invalid type argument of =E2=80=98-=
>=E2=80=99 (have =E2=80=98struct mips_coproc=E2=80=99)

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
multi_v5_defconfig (arm, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
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
pic32mzda_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

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
rb532_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
rv32_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
rv32_defconfig (riscv, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
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
tinyconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

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
vt8500_v6_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
wpcm450_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
ection mismatches

Warnings:
    vmlinux.o: warning: objtool: .altinstr_replacement+0x17e5: redundant UA=
CCESS disable
    vmlinux.o: warning: objtool: iovec_from_user+0x88: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled
    vmlinux.o: warning: objtool: __import_iovec+0x147: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+amdgpu (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnin=
gs, 0 section mismatches

Warnings:
    vmlinux.o: warning: objtool: .altinstr_replacement+0x17ef: redundant UA=
CCESS disable
    vmlinux.o: warning: objtool: iovec_from_user+0x88: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled
    vmlinux.o: warning: objtool: __import_iovec+0x147: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled

---------------------------------------------------------------------------=
-----
x86_64_defconfig+crypto (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnin=
gs, 0 section mismatches

Warnings:
    vmlinux.o: warning: objtool: .altinstr_replacement+0x17ef: redundant UA=
CCESS disable
    vmlinux.o: warning: objtool: iovec_from_user+0x88: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled
    vmlinux.o: warning: objtool: __import_iovec+0x147: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled

---------------------------------------------------------------------------=
-----
x86_64_defconfig+debug (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 3 warning=
s, 0 section mismatches

Warnings:
    vmlinux.o: warning: objtool: .altinstr_replacement+0x19aa: redundant UA=
CCESS disable
    vmlinux.o: warning: objtool: iovec_from_user+0x88: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled
    vmlinux.o: warning: objtool: __import_iovec+0x342: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled

---------------------------------------------------------------------------=
-----
x86_64_defconfig+ima (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings,=
 0 section mismatches

Warnings:
    vmlinux.o: warning: objtool: .altinstr_replacement+0x17e5: redundant UA=
CCESS disable
    vmlinux.o: warning: objtool: iovec_from_user+0x88: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled
    vmlinux.o: warning: objtool: __import_iovec+0x147: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 3 war=
nings, 0 section mismatches

Warnings:
    vmlinux.o: warning: objtool: .altinstr_replacement+0x1ddc: redundant UA=
CCESS disable
    vmlinux.o: warning: objtool: iovec_from_user+0x88: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled
    vmlinux.o: warning: objtool: __import_iovec+0x147: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook+amdgpu (x86_64, gcc-10) =E2=80=94 PASS, 0 e=
rrors, 3 warnings, 0 section mismatches

Warnings:
    vmlinux.o: warning: objtool: .altinstr_replacement+0x17ef: redundant UA=
CCESS disable
    vmlinux.o: warning: objtool: iovec_from_user+0x88: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled
    vmlinux.o: warning: objtool: __import_iovec+0x147: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook+kselftest (x86_64, gcc-10) =E2=80=94 PASS, =
0 errors, 3 warnings, 0 section mismatches

Warnings:
    vmlinux.o: warning: objtool: .altinstr_replacement+0x1ddc: redundant UA=
CCESS disable
    vmlinux.o: warning: objtool: iovec_from_user+0x88: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled
    vmlinux.o: warning: objtool: __import_iovec+0x147: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled

---
For more info write to <info@kernelci.org>
