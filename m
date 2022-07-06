Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE1F19B
	for <llvm@lists.linux.dev>; Wed,  6 Jul 2022 16:41:14 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id bu42so7028001lfb.0
        for <llvm@lists.linux.dev>; Wed, 06 Jul 2022 09:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2e+EYh18i4Kti20jGIw3VZNWyuKHPcfNwE/Z90++PO8=;
        b=tZ6j2+sjYjAkEU/5FMMPU9VrulVrN886SUTFhLZ9JwUVqsX9k0UGzaXhuEfYx5+T7e
         nngL6CPhkJxagd4vyVkmctt2vvtehDcxrC4Bgj2uGKRrD3V4Q//rGcbflR00uZ1rT0wt
         rcHi5zCwodzqRz4iqwWNVE4EBCa2q0ADvdUKSAEuYzJCNQQefJoR1cwVfnyvD0shZPxA
         4CUYf3uaFCgkRGcfLJOAFBMK6EQ8l9bnyuMTjvK7pu94pFaAQDCKwaRk2abZQHD/L/yH
         RQRtcCbM0TdkhJmHrGS6kxlUEfMoeMzaYucolP/23BBgX9vsOPN9LUVWDM1fxeJfSUFH
         V+8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2e+EYh18i4Kti20jGIw3VZNWyuKHPcfNwE/Z90++PO8=;
        b=GQWLpS0AdxyI4707+Bdgp8Pgkw/f7SCcn9AOd0MBQm2iuqySzHYfwG2jDMH0bwC8/W
         FKHAF3gSaD9d4KkjDRlj6uwJ410pgSMTQOwIBUhoDFDttxu0HqQXuQcAMdsT1M3uXfc1
         ZPaWbhWcBOG4OX2egsYfOcfChFEzsMqhXueXGI4VYvMBwyh5+vAKD+2InMkDTJAF4yvt
         MQkK45tToOf8HsCXIp8I4tJ9jJ1wsZ6XkpGQOfWD4L7nNcF2W2g0t4/6mnSR2HdJZ9t8
         FvYIatluAyWnmXJbwdy3b1lwdBnI1/hR5gdYwQQ3GCrwOSEaLVmaBUx5UQ9/TSshRarK
         46Ag==
X-Gm-Message-State: AJIora8u9Yi1yd2c3ddWPyQffoN7kg2T3i/fvSaDu0dfUE2CpXwoZ/Vp
	DWeqxMVuAXpPNn1rlRKPwS9H6i5kpOXKL65Iv1IjPp9YHYc=
X-Google-Smtp-Source: AGRyM1twopqMetoi9gxhXKrKdbJ13LJou/157e169bff7GsOwn3uRu5ihHJ12qbinxDmbTnVy+P+1CWIjxWb4qAJ8Is=
X-Received: by 2002:a05:6512:2623:b0:47d:ace7:c804 with SMTP id
 bt35-20020a056512262300b0047dace7c804mr27554808lfb.647.1657125671262; Wed, 06
 Jul 2022 09:41:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <62c5b563.1c69fb81.1240a.62b2@mx.google.com>
In-Reply-To: <62c5b563.1c69fb81.1240a.62b2@mx.google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 6 Jul 2022 09:40:59 -0700
Message-ID: <CAKwvOdnusz+AjYzkW4pyHraJ1_exhwAz9bscMkRiqjiXRj+66g@mail.gmail.com>
Subject: Re: next/master build: 205 builds: 8 failed, 197 passed, 21 errors,
 52 warnings (next-20220706)
To: llvm@lists.linux.dev
Cc: "kernelci.org bot" <bot@kernelci.org>, Guillaume Tucker <guillaume.tucker@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 6, 2022 at 9:16 AM kernelci.org bot <bot@kernelci.org> wrote:
>
> next/master build: 205 builds: 8 failed, 197 passed, 21 errors, 52 warnin=
gs (next-20220706)
>
> Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/=
next-20220706/
>
> Tree: next
> Branch: master
> Git Describe: next-20220706
> Git Commit: 088b9c375534d905a4d337c78db3b3bfbb52c4a0
> Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.=
git
> Built: 7 unique architectures
>
> Build Failures Detected:
>
> arm64:
>     allmodconfig: (clang-15) FAIL
>     allmodconfig: (gcc-10) FAIL
>
> arm:
>     cros://chromeos-5.10/armel/chromiumos-arm.flavour.config: (clang-13) =
FAIL
>     cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config: (clang=
-13) FAIL
>     allmodconfig: (clang-15) FAIL
>     allmodconfig: (gcc-10) FAIL
>
> i386:
>     allmodconfig: (clang-15) FAIL
>
> mips:
>     decstation_64_defconfig: (gcc-10) FAIL
>
> Errors and Warnings Detected:
>
> arc:
>
> arm64:
>     allmodconfig (gcc-10): 4 errors
>     allmodconfig (clang-15): 1 error
>
> arm:
>     allmodconfig (clang-15): 1 error, 13 warnings
>     allmodconfig (gcc-10): 8 errors
>     aspeed_g5_defconfig (clang-15): 10 warnings
>     cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (clang-13): =
1 error, 5 warnings
>     cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (clang-=
13): 1 error, 5 warnings
>     multi_v5_defconfig (clang-15): 2 warnings
>     multi_v7_defconfig (clang-15): 12 warnings
>
> i386:
>     allmodconfig (clang-15): 1 error
>     allnoconfig (clang-15): 2 warnings
>
> mips:
>     32r2el_defconfig (gcc-10): 1 warning
>     32r2el_defconfig+kselftest (gcc-10): 1 warning
>     fuloong2e_defconfig (gcc-10): 1 error
>     lemote2f_defconfig (gcc-10): 1 error
>     loongson2k_defconfig (gcc-10): 1 error
>     loongson3_defconfig (gcc-10): 1 error
>     rb532_defconfig (gcc-10): 1 warning
>
> riscv:
>
> x86_64:
>
> Errors summary:
>
>     4    drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.c:603:59: e=
rror: =E2=80=98-mgeneral-regs-only=E2=80=99 is incompatible with the use of=
 floating-point types
>     4    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =
=E2=80=98-mhard-float=E2=80=99
>     2    lib/maple_tree.c:4272:20: error: stack frame size (1096) exceeds=
 limit (1024) in function 'mas_wr_modify' [-Werror,-Wframe-larger-than]
>     1    sound/soc/intel/avs/path.c:815:18: error: stack frame size (2176=
) exceeds limit (2048) in 'avs_path_create' [-Werror,-Wframe-larger-than]
>     1    lib/maple_tree.c:4272:20: error: stack frame size (1144) exceeds=
 limit (1024) in 'mas_wr_modify' [-Werror,-Wframe-larger-than]
>     1    lib/maple_tree.c:4272:20: error: stack frame size (1072) exceeds=
 limit (1024) in 'mas_wr_modify' [-Werror,-Wframe-larger-than]
>     1    ERROR: modpost: "__aeabi_ui2d" [drivers/gpu/drm/amd/amdgpu/amdgp=
u.ko] undefined!
>     1    ERROR: modpost: "__aeabi_i2d" [drivers/gpu/drm/amd/amdgpu/amdgpu=
.ko] undefined!
>     1    ERROR: modpost: "__aeabi_dsub" [drivers/gpu/drm/amd/amdgpu/amdgp=
u.ko] undefined!
>     1    ERROR: modpost: "__aeabi_dmul" [drivers/gpu/drm/amd/amdgpu/amdgp=
u.ko] undefined!
>     1    ERROR: modpost: "__aeabi_ddiv" [drivers/gpu/drm/amd/amdgpu/amdgp=
u.ko] undefined!
>     1    ERROR: modpost: "__aeabi_dadd" [drivers/gpu/drm/amd/amdgpu/amdgp=
u.ko] undefined!
>     1    ERROR: modpost: "__aeabi_d2uiz" [drivers/gpu/drm/amd/amdgpu/amdg=
pu.ko] undefined!
>     1    ERROR: modpost: "__aeabi_d2iz" [drivers/gpu/drm/amd/amdgpu/amdgp=
u.ko] undefined!

^ interesting, these look new to me, must be from the new CrOS configs.

>
> Warnings summary:
>
>     23   clang: warning: argument unused during compilation: '-march=3Dar=
mv6k' [-Wunused-command-line-argument]
>     20   clang: warning: argument unused during compilation: '-march=3Dar=
mv7-a' [-Wunused-command-line-argument]
>     3    1 warning generated.
>     2    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_dev=
ice_reg): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, exp=
ected "0,0"
>     1    lib/maple_tree.c:4272:20: warning: stack frame size (1096) excee=
ds limit (1024) in 'mas_wr_modify' [-Wframe-larger-than]
>     1    lib/maple_tree.c:4272:20: warning: stack frame size (1088) excee=
ds limit (1024) in 'mas_wr_modify' [-Wframe-larger-than]
>     1    lib/maple_tree.c:4272:20: warning: stack frame size (1084) excee=
ds limit (1024) in 'mas_wr_modify' [-Wframe-larger-than]
>     1    cc1: warning: result of =E2=80=98-117440512 << 16=E2=80=99 requi=
res 44 bits to represent, but =E2=80=98int=E2=80=99 only has 32 bits [-Wshi=
ft-overflow=3D]
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
>
> Detailed per-defconfig build reports:
>
> -------------------------------------------------------------------------=
-------
> 32r2el_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches
>
> Warnings:
>     arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_r=
eg): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expected=
 "0,0"
>
> -------------------------------------------------------------------------=
-------
> 32r2el_defconfig+kselftest (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 war=
ning, 0 section mismatches
>
> Warnings:
>     arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_r=
eg): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expected=
 "0,0"
>
> -------------------------------------------------------------------------=
-------
> allmodconfig (arm, clang-15) =E2=80=94 FAIL, 1 error, 13 warnings, 0 sect=
ion mismatches
>
> Errors:
>     lib/maple_tree.c:4272:20: error: stack frame size (1144) exceeds limi=
t (1024) in 'mas_wr_modify' [-Werror,-Wframe-larger-than]
>
> Warnings:
>     clang: warning: argument unused during compilation: '-march=3Darmv6k'=
 [-Wunused-command-line-argument]
>     clang: warning: argument unused during compilation: '-march=3Darmv6k'=
 [-Wunused-command-line-argument]
>     clang: warning: argument unused during compilation: '-march=3Darmv6k'=
 [-Wunused-command-line-argument]
>     clang: warning: argument unused during compilation: '-march=3Darmv6k'=
 [-Wunused-command-line-argument]
>     clang: warning: argument unused during compilation: '-march=3Darmv6k'=
 [-Wunused-command-line-argument]
>     clang: warning: argument unused during compilation: '-march=3Darmv6k'=
 [-Wunused-command-line-argument]
>     clang: warning: argument unused during compilation: '-march=3Darmv6k'=
 [-Wunused-command-line-argument]
>     clang: warning: argument unused during compilation: '-march=3Darmv6k'=
 [-Wunused-command-line-argument]
>     clang: warning: argument unused during compilation: '-march=3Darmv6k'=
 [-Wunused-command-line-argument]
>     clang: warning: argument unused during compilation: '-march=3Darmv6k'=
 [-Wunused-command-line-argument]
>     clang: warning: argument unused during compilation: '-march=3Darmv6k'=
 [-Wunused-command-line-argument]
>     clang: warning: argument unused during compilation: '-march=3Darmv6k'=
 [-Wunused-command-line-argument]
>     clang: warning: argument unused during compilation: '-march=3Darmv6k'=
 [-Wunused-command-line-argument]
>
> -------------------------------------------------------------------------=
-------
> allmodconfig (arm64, gcc-10) =E2=80=94 FAIL, 4 errors, 0 warnings, 0 sect=
ion mismatches
>
> Errors:
>     drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.c:603:59: error:=
 =E2=80=98-mgeneral-regs-only=E2=80=99 is incompatible with the use of floa=
ting-point types
>     drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.c:603:59: error:=
 =E2=80=98-mgeneral-regs-only=E2=80=99 is incompatible with the use of floa=
ting-point types
>     drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.c:603:59: error:=
 =E2=80=98-mgeneral-regs-only=E2=80=99 is incompatible with the use of floa=
ting-point types
>     drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.c:603:59: error:=
 =E2=80=98-mgeneral-regs-only=E2=80=99 is incompatible with the use of floa=
ting-point types
>
> -------------------------------------------------------------------------=
-------
> allmodconfig (i386, clang-15) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sect=
ion mismatches
>
> Errors:
>     lib/maple_tree.c:4272:20: error: stack frame size (1072) exceeds limi=
t (1024) in 'mas_wr_modify' [-Werror,-Wframe-larger-than]
>
> -------------------------------------------------------------------------=
-------
> allmodconfig (arm, gcc-10) =E2=80=94 FAIL, 8 errors, 0 warnings, 0 sectio=
n mismatches
>
> Errors:
>     ERROR: modpost: "__aeabi_ui2d" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]=
 undefined!
>     ERROR: modpost: "__aeabi_dsub" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]=
 undefined!
>     ERROR: modpost: "__aeabi_ddiv" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]=
 undefined!
>     ERROR: modpost: "__aeabi_d2uiz" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko=
] undefined!
>     ERROR: modpost: "__aeabi_d2iz" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]=
 undefined!
>     ERROR: modpost: "__aeabi_dmul" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]=
 undefined!
>     ERROR: modpost: "__aeabi_i2d" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] =
undefined!
>     ERROR: modpost: "__aeabi_dadd" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]=
 undefined!
>
> -------------------------------------------------------------------------=
-------
> allmodconfig (arm64, clang-15) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sec=
tion mismatches
>
> Errors:
>     sound/soc/intel/avs/path.c:815:18: error: stack frame size (2176) exc=
eeds limit (2048) in 'avs_path_create' [-Werror,-Wframe-larger-than]
>
> -------------------------------------------------------------------------=
-------
> allnoconfig (x86_64, clang-15) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches
>
> -------------------------------------------------------------------------=
-------
> allnoconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches
>
> -------------------------------------------------------------------------=
-------
> allnoconfig (i386, clang-15) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches
>
> Warnings:
>     lib/maple_tree.c:4272:20: warning: stack frame size (1084) exceeds li=
mit (1024) in 'mas_wr_modify' [-Wframe-larger-than]
>     1 warning generated.
>
> -------------------------------------------------------------------------=
-------
> allnoconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches
>
> -------------------------------------------------------------------------=
-------
> allnoconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches
>
> -------------------------------------------------------------------------=
-------
> ar7_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches
>
> -------------------------------------------------------------------------=
-------
> aspeed_g4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches
>
> -------------------------------------------------------------------------=
-------
> aspeed_g5_defconfig (arm, clang-15) =E2=80=94 PASS, 0 errors, 10 warnings=
, 0 section mismatches
>
> Warnings:
>     clang: warning: argument unused during compilation: '-march=3Darmv6k'=
 [-Wunused-command-line-argument]
>     clang: warning: argument unused during compilation: '-march=3Darmv6k'=
 [-Wunused-command-line-argument]
>     clang: warning: argument unused during compilation: '-march=3Darmv6k'=
 [-Wunused-command-line-argument]
>     clang: warning: argument unused during compilation: '-march=3Darmv6k'=
 [-Wunused-command-line-argument]
>     clang: warning: argument unused during compilation: '-march=3Darmv6k'=
 [-Wunused-command-line-argument]
>     clang: warning: argument unused during compilation: '-march=3Darmv6k'=
 [-Wunused-command-line-argument]
>     clang: warning: argument unused during compilation: '-march=3Darmv6k'=
 [-Wunused-command-line-argument]
>     clang: warning: argument unused during compilation: '-march=3Darmv6k'=
 [-Wunused-command-line-argument]
>     clang: warning: argument unused during compilation: '-march=3Darmv6k'=
 [-Wunused-command-line-argument]
>     clang: warning: argument unused during compilation: '-march=3Darmv6k'=
 [-Wunused-command-line-argument]
>
> -------------------------------------------------------------------------=
-------
> aspeed_g5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches
>
> -------------------------------------------------------------------------=
-------
> assabet_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches
>
> -------------------------------------------------------------------------=
-------
> at91_dt_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches
>
> -------------------------------------------------------------------------=
-------
> ath25_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches
>
> -------------------------------------------------------------------------=
-------
> ath79_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches
>
> -------------------------------------------------------------------------=
-------
> axm55xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches
>
> -------------------------------------------------------------------------=
-------
> axs103_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches
>
> -------------------------------------------------------------------------=
-------
> axs103_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> badge4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches
>
> -------------------------------------------------------------------------=
-------
> bcm2835_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches
>
> -------------------------------------------------------------------------=
-------
> bcm63xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches
>
> -------------------------------------------------------------------------=
-------
> bigsur_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches
>
> -------------------------------------------------------------------------=
-------
> bmips_be_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches
>
> -------------------------------------------------------------------------=
-------
> bmips_stb_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> cavium_octeon_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnin=
gs, 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> cerfcube_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches
>
> -------------------------------------------------------------------------=
-------
> ci20_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches
>
> -------------------------------------------------------------------------=
-------
> cm_x300_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches
>
> -------------------------------------------------------------------------=
-------
> collie_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches
>
> -------------------------------------------------------------------------=
-------
> corgi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches
>
> -------------------------------------------------------------------------=
-------
> cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config (arm64, clang-=
13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chromebo=
ok (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismat=
ches
>
> -------------------------------------------------------------------------=
-------
> cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.config+arm64-chrom=
ebook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mis=
matches
>
> -------------------------------------------------------------------------=
-------
> cros://chromeos-5.10/arm64/chromiumos-qualcomm.flavour.config+arm64-chrom=
ebook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mis=
matches
>
> -------------------------------------------------------------------------=
-------
> cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (arm, clang-13) =
=E2=80=94 FAIL, 1 error, 5 warnings, 0 section mismatches
>
> Errors:
>     lib/maple_tree.c:4272:20: error: stack frame size (1096) exceeds limi=
t (1024) in function 'mas_wr_modify' [-Werror,-Wframe-larger-than]
>
> Warnings:
>     clang: warning: argument unused during compilation: '-march=3Darmv7-a=
' [-Wunused-command-line-argument]
>     clang: warning: argument unused during compilation: '-march=3Darmv7-a=
' [-Wunused-command-line-argument]
>     clang: warning: argument unused during compilation: '-march=3Darmv7-a=
' [-Wunused-command-line-argument]
>     clang: warning: argument unused during compilation: '-march=3Darmv7-a=
' [-Wunused-command-line-argument]
>     clang: warning: argument unused during compilation: '-march=3Darmv7-a=
' [-Wunused-command-line-argument]
>
> -------------------------------------------------------------------------=
-------
> cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (arm, clang=
-13) =E2=80=94 FAIL, 1 error, 5 warnings, 0 section mismatches
>
> Errors:
>     lib/maple_tree.c:4272:20: error: stack frame size (1096) exceeds limi=
t (1024) in function 'mas_wr_modify' [-Werror,-Wframe-larger-than]
>
> Warnings:
>     clang: warning: argument unused during compilation: '-march=3Darmv7-a=
' [-Wunused-command-line-argument]
>     clang: warning: argument unused during compilation: '-march=3Darmv7-a=
' [-Wunused-command-line-argument]
>     clang: warning: argument unused during compilation: '-march=3Darmv7-a=
' [-Wunused-command-line-argument]
>     clang: warning: argument unused during compilation: '-march=3Darmv7-a=
' [-Wunused-command-line-argument]
>     clang: warning: argument unused during compilation: '-march=3Darmv7-a=
' [-Wunused-command-line-argument]
>
> -------------------------------------------------------------------------=
-------
> cros://chromeos-5.10/x86_64/chromeos-intel-pineview.flavour.config+x86-ch=
romebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches
>
> -------------------------------------------------------------------------=
-------
> cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config (x86_64, cla=
ng-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config+x86-chromebo=
ok (x86_64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section misma=
tches
>
> -------------------------------------------------------------------------=
-------
> cu1000-neo_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> cu1830-neo_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> davinci_all_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> db1xxx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches
>
> -------------------------------------------------------------------------=
-------
> decstation_64_defconfig (mips, gcc-10) =E2=80=94 FAIL, 0 errors, 0 warnin=
gs, 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> decstation_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> decstation_r4k_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warni=
ngs, 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches
>
> -------------------------------------------------------------------------=
-------
> defconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches
>
> -------------------------------------------------------------------------=
-------
> defconfig+CONFIG_ARM64_16K_PAGES=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 er=
rors, 0 warnings, 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 er=
rors, 0 warnings, 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-15) =E2=80=94 PASS, 0 =
errors, 0 warnings, 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 err=
ors, 0 warnings, 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> defconfig+CONFIG_EFI=3Dn (riscv, clang-15) =E2=80=94 PASS, 0 errors, 0 wa=
rnings, 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 err=
ors, 0 warnings, 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> defconfig+arm64-chromebook (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 wa=
rnings, 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> defconfig+arm64-chromebook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 =
warnings, 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> defconfig+arm64-chromebook+kselftest (arm64, gcc-10) =E2=80=94 PASS, 0 er=
rors, 0 warnings, 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> defconfig+crypto (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches
>
> -------------------------------------------------------------------------=
-------
> defconfig+debug (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches
>
> -------------------------------------------------------------------------=
-------
> defconfig+debug (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches
>
> -------------------------------------------------------------------------=
-------
> defconfig+ima (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches
>
> -------------------------------------------------------------------------=
-------
> defconfig+kselftest (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> defconfig+kselftest (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> e55_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches
>
> -------------------------------------------------------------------------=
-------
> eseries_pxa_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> exynos_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches
>
> -------------------------------------------------------------------------=
-------
> ezx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches
>
> -------------------------------------------------------------------------=
-------
> fuloong2e_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 0 warnings, 0=
 section mismatches
>
> Errors:
>     cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=80=
=98-mhard-float=E2=80=99
>
> -------------------------------------------------------------------------=
-------
> gcw0_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches
>
> -------------------------------------------------------------------------=
-------
> h3600_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches
>
> -------------------------------------------------------------------------=
-------
> h5000_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches
>
> -------------------------------------------------------------------------=
-------
> hackkit_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches
>
> -------------------------------------------------------------------------=
-------
> haps_hs_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches
>
> -------------------------------------------------------------------------=
-------
> haps_hs_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> haps_hs_smp_defconfig+debug (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 war=
nings, 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> haps_hs_smp_defconfig+kselftest (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0=
 warnings, 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> hisi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches
>
> -------------------------------------------------------------------------=
-------
> hsdk_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches
>
> -------------------------------------------------------------------------=
-------
> i386_defconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches
>
> -------------------------------------------------------------------------=
-------
> i386_defconfig (i386, clang-15) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches
>
> -------------------------------------------------------------------------=
-------
> i386_defconfig+debug (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> i386_defconfig+kselftest (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warni=
ngs, 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> imx_v4_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches
>
> -------------------------------------------------------------------------=
-------
> imx_v6_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches
>
> -------------------------------------------------------------------------=
-------
> imxrt_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches
>
> -------------------------------------------------------------------------=
-------
> integrator_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> ip22_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches
>
> -------------------------------------------------------------------------=
-------
> ip27_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches
>
> -------------------------------------------------------------------------=
-------
> ip28_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches
>
> -------------------------------------------------------------------------=
-------
> ip32_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches
>
> -------------------------------------------------------------------------=
-------
> ixp4xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches
>
> -------------------------------------------------------------------------=
-------
> jazz_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches
>
> -------------------------------------------------------------------------=
-------
> keystone_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches
>
> -------------------------------------------------------------------------=
-------
> lart_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches
>
> -------------------------------------------------------------------------=
-------
> lemote2f_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 0 warnings, 0 =
section mismatches
>
> Errors:
>     cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=80=
=98-mhard-float=E2=80=99
>
> -------------------------------------------------------------------------=
-------
> loongson1b_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> loongson1c_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> loongson2k_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 0 warnings, =
0 section mismatches
>
> Errors:
>     cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=80=
=98-mhard-float=E2=80=99
>
> -------------------------------------------------------------------------=
-------
> loongson3_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 0 warnings, 0=
 section mismatches
>
> Errors:
>     cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=80=
=98-mhard-float=E2=80=99
>
> -------------------------------------------------------------------------=
-------
> lpc32xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches
>
> -------------------------------------------------------------------------=
-------
> lpd270_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches
>
> -------------------------------------------------------------------------=
-------
> lubbock_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches
>
> -------------------------------------------------------------------------=
-------
> magician_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches
>
> -------------------------------------------------------------------------=
-------
> mainstone_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches
>
> -------------------------------------------------------------------------=
-------
> malta_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches
>
> -------------------------------------------------------------------------=
-------
> malta_qemu_32r6_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> maltaaprp_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> maltasmvp_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> maltasmvp_eva_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnin=
gs, 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> maltaup_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches
>
> -------------------------------------------------------------------------=
-------
> maltaup_xpa_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> milbeaut_m10v_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> mini2440_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches
>
> -------------------------------------------------------------------------=
-------
> mmp2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches
>
> -------------------------------------------------------------------------=
-------
> moxart_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches
>
> -------------------------------------------------------------------------=
-------
> mtx1_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches
>
> -------------------------------------------------------------------------=
-------
> multi_v4t_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches
>
> -------------------------------------------------------------------------=
-------
> multi_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches
>
> -------------------------------------------------------------------------=
-------
> multi_v5_defconfig (arm, clang-15) =E2=80=94 PASS, 0 errors, 2 warnings, =
0 section mismatches
>
> Warnings:
>     lib/maple_tree.c:4272:20: warning: stack frame size (1088) exceeds li=
mit (1024) in 'mas_wr_modify' [-Wframe-larger-than]
>     1 warning generated.
>
> -------------------------------------------------------------------------=
-------
> multi_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches
>
> -------------------------------------------------------------------------=
-------
> multi_v7_defconfig (arm, clang-15) =E2=80=94 PASS, 0 errors, 12 warnings,=
 0 section mismatches
>
> Warnings:
>     clang: warning: argument unused during compilation: '-march=3Darmv7-a=
' [-Wunused-command-line-argument]
>     clang: warning: argument unused during compilation: '-march=3Darmv7-a=
' [-Wunused-command-line-argument]
>     clang: warning: argument unused during compilation: '-march=3Darmv7-a=
' [-Wunused-command-line-argument]
>     clang: warning: argument unused during compilation: '-march=3Darmv7-a=
' [-Wunused-command-line-argument]
>     clang: warning: argument unused during compilation: '-march=3Darmv7-a=
' [-Wunused-command-line-argument]
>     clang: warning: argument unused during compilation: '-march=3Darmv7-a=
' [-Wunused-command-line-argument]
>     clang: warning: argument unused during compilation: '-march=3Darmv7-a=
' [-Wunused-command-line-argument]
>     clang: warning: argument unused during compilation: '-march=3Darmv7-a=
' [-Wunused-command-line-argument]
>     clang: warning: argument unused during compilation: '-march=3Darmv7-a=
' [-Wunused-command-line-argument]
>     lib/maple_tree.c:4272:20: warning: stack frame size (1096) exceeds li=
mit (1024) in 'mas_wr_modify' [-Wframe-larger-than]
>     1 warning generated.
>     clang: warning: argument unused during compilation: '-march=3Darmv7-a=
' [-Wunused-command-line-argument]
>
> -------------------------------------------------------------------------=
-------
> multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-10) =E2=80=94 PASS=
, 0 errors, 0 warnings, 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-10) =E2=
=80=94 PASS, 0 errors, 0 warnings, 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-10) =E2=80=94 PASS, 0 errors,=
 0 warnings, 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy (arm, gcc-10) =E2=80=94 PASS,=
 0 errors, 0 warnings, 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> multi_v7_defconfig+debug (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnin=
gs, 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> multi_v7_defconfig+kselftest (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 wa=
rnings, 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> mvebu_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches
>
> -------------------------------------------------------------------------=
-------
> mvebu_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches
>
> -------------------------------------------------------------------------=
-------
> mxs_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches
>
> -------------------------------------------------------------------------=
-------
> neponset_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches
>
> -------------------------------------------------------------------------=
-------
> netwinder_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches
>
> -------------------------------------------------------------------------=
-------
> nommu_k210_sdcard_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 w=
arnings, 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> nsimosci_hs_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warni=
ngs, 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> omap2plus_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches
>
> -------------------------------------------------------------------------=
-------
> orion5x_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches
>
> -------------------------------------------------------------------------=
-------
> oxnas_v6_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches
>
> -------------------------------------------------------------------------=
-------
> palmz72_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches
>
> -------------------------------------------------------------------------=
-------
> pcm027_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches
>
> -------------------------------------------------------------------------=
-------
> pic32mzda_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> pleb_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches
>
> -------------------------------------------------------------------------=
-------
> pxa168_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches
>
> -------------------------------------------------------------------------=
-------
> pxa255-idp_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> pxa3xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches
>
> -------------------------------------------------------------------------=
-------
> pxa910_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches
>
> -------------------------------------------------------------------------=
-------
> pxa_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches
>
> -------------------------------------------------------------------------=
-------
> qcom_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches
>
> -------------------------------------------------------------------------=
-------
> qi_lb60_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches
>
> -------------------------------------------------------------------------=
-------
> rb532_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches
>
> Warnings:
>     cc1: warning: result of =E2=80=98-117440512 << 16=E2=80=99 requires 4=
4 bits to represent, but =E2=80=98int=E2=80=99 only has 32 bits [-Wshift-ov=
erflow=3D]
>
> -------------------------------------------------------------------------=
-------
> rbtx49xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches
>
> -------------------------------------------------------------------------=
-------
> realview_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches
>
> -------------------------------------------------------------------------=
-------
> rm200_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches
>
> -------------------------------------------------------------------------=
-------
> rs90_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches
>
> -------------------------------------------------------------------------=
-------
> rt305x_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches
>
> -------------------------------------------------------------------------=
-------
> rv32_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches
>
> -------------------------------------------------------------------------=
-------
> s3c2410_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches
>
> -------------------------------------------------------------------------=
-------
> s3c6400_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches
>
> -------------------------------------------------------------------------=
-------
> s5pv210_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches
>
> -------------------------------------------------------------------------=
-------
> sama5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches
>
> -------------------------------------------------------------------------=
-------
> sama7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches
>
> -------------------------------------------------------------------------=
-------
> sb1250_swarm_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> shannon_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches
>
> -------------------------------------------------------------------------=
-------
> shmobile_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches
>
> -------------------------------------------------------------------------=
-------
> simpad_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches
>
> -------------------------------------------------------------------------=
-------
> socfpga_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches
>
> -------------------------------------------------------------------------=
-------
> spear13xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches
>
> -------------------------------------------------------------------------=
-------
> spear3xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches
>
> -------------------------------------------------------------------------=
-------
> spear6xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches
>
> -------------------------------------------------------------------------=
-------
> stm32_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches
>
> -------------------------------------------------------------------------=
-------
> sunxi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches
>
> -------------------------------------------------------------------------=
-------
> tb0219_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches
>
> -------------------------------------------------------------------------=
-------
> tb0226_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches
>
> -------------------------------------------------------------------------=
-------
> tb0287_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches
>
> -------------------------------------------------------------------------=
-------
> tct_hammer_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> tegra_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches
>
> -------------------------------------------------------------------------=
-------
> tinyconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches
>
> -------------------------------------------------------------------------=
-------
> tinyconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches
>
> -------------------------------------------------------------------------=
-------
> tinyconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches
>
> -------------------------------------------------------------------------=
-------
> trizeps4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches
>
> -------------------------------------------------------------------------=
-------
> u8500_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches
>
> -------------------------------------------------------------------------=
-------
> vdk_hs38_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches
>
> -------------------------------------------------------------------------=
-------
> vdk_hs38_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> versatile_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches
>
> -------------------------------------------------------------------------=
-------
> vexpress_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches
>
> -------------------------------------------------------------------------=
-------
> vf610m4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches
>
> -------------------------------------------------------------------------=
-------
> vocore2_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches
>
> -------------------------------------------------------------------------=
-------
> vt8500_v6_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> workpad_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches
>
> -------------------------------------------------------------------------=
-------
> x86_64_defconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches
>
> -------------------------------------------------------------------------=
-------
> x86_64_defconfig (x86_64, clang-15) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> x86_64_defconfig+amdgpu (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> x86_64_defconfig+crypto (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> x86_64_defconfig+ima (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> x86_64_defconfig+kselftest (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 w=
arnings, 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> x86_64_defconfig+x86-chromebook (x86_64, gcc-10) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> x86_64_defconfig+x86-chromebook+amdgpu (x86_64, gcc-10) =E2=80=94 PASS, 0=
 errors, 0 warnings, 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> x86_64_defconfig+x86-chromebook+kselftest (x86_64, gcc-10) =E2=80=94 PASS=
, 0 errors, 0 warnings, 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> x86_64_defconfig+x86_kvm_guest (x86_64, gcc-10) =E2=80=94 PASS, 0 errors,=
 0 warnings, 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> xcep_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches
>
> -------------------------------------------------------------------------=
-------
> zeus_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches
>
> ---
> For more info write to <info@kernelci.org>
>


--=20
Thanks,
~Nick Desaulniers
