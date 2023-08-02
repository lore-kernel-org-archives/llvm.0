Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE6D79FF
	for <llvm@lists.linux.dev>; Wed,  2 Aug 2023 17:06:16 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-63d10da0f26so222006d6.3
        for <llvm@lists.linux.dev>; Wed, 02 Aug 2023 10:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690995975; x=1691600775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HFQOee4hTWnULitx11DzlNkhDJ14s/pIiIZgweVlW8Q=;
        b=BO/MJQZeKmFlmrrlGJWcbPMRNvuK8w4R32sKNkmcnMJ92imIfy16mOK/kIjc316eKi
         10fwmu4+uZzPE5oYWmJsXXPYoDsmpXhqkSiQpdSBPkO+F/kjtbHNAtTIUXUaNkNN4Td6
         WBnv9kmXSoFN8G+W/i0TbORdS+VKqLQJfv5zJUM0KNyZFUM8nH7Hxy7+EY/sDMZ/A5IC
         shkgxtg37atKZqmSvgEOXmW1+hGQwHW3nlPYcfcqXmRvLZmLpGEEMknMgliVjVClZz0o
         bgVbbIX1zbNlvrMI9qbCTq7+qVdqRfdTi0AuiMfS7vMwaalOSzP/KfF/B6Fk8Jms4reE
         dBCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690995975; x=1691600775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HFQOee4hTWnULitx11DzlNkhDJ14s/pIiIZgweVlW8Q=;
        b=XWgh5G5kXE+W79pIul+ITrJJCr1CWgEmH3QcKVaWlnq2zfX5jPcv5V2rDM5mtOqFgL
         KjjTyvyKpGT3Qw+AdS398QKYJXisPOBsFmAIGU7d0kG+2+1jikMcTWMP8ZN990o1EYrT
         DTIZ9GD38J1BH9wNUNqzZ/QJlEp6/Hjpuro8zvntbTR9do8pi2PSMe2XpLJoGayhxKMa
         +kuq7R0Q8xgZvIe5wMzY/5Y+GHl8k5wvKtGMv8sH/1oIW35MQQxPmUkLY01eaYY65+05
         rrtoQCOv7/JUacWcB5YkXJnPaXitsY9yMrd21I8VKi4Wu2IwOYgvEjLMWjOiFydbZRm0
         eWiA==
X-Gm-Message-State: ABy/qLYsk3DzUJir3NbyEcULoetmtCulu2reaw4aWMTsjdULHAyozwbK
	G0I+BS0SXsTEFCnK1yeEMjzgxIAnS47VHM+g4n/+T95iLLbsnRkOejOfxg==
X-Google-Smtp-Source: APBJJlGw3ArPA8aE3frbJ9C+a2l/+qk+wslRQAq/uxJjAk8qhBNO563bQa6fPSw2+mJCQ45QGJH1ExL4poKqYLL3lZg=
X-Received: by 2002:ad4:4af4:0:b0:63a:3c55:7aa9 with SMTP id
 cp20-20020ad44af4000000b0063a3c557aa9mr14822600qvb.29.1690995974595; Wed, 02
 Aug 2023 10:06:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <64c9ef5e.170a0220.c258a.0ec6@mx.google.com>
In-Reply-To: <64c9ef5e.170a0220.c258a.0ec6@mx.google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 2 Aug 2023 10:06:03 -0700
Message-ID: <CAKwvOdmuXnChEiZ-VOPbhYd_VzqjCJ0+Jc_38hwWMCDDDNM3uA@mail.gmail.com>
Subject: Re: next/master build: 188 builds: 4 failed, 184 passed, 4 errors, 22
 warnings (next-20230802)
To: kernelci@lists.linux.dev
Cc: llvm@lists.linux.dev, "kernelci.org bot" <bot@kernelci.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi KernelCI team.  Thanks for these reports, as always, they are my
"morning paper."

Is it possible to filter out `1 warning generated.` in these reports
(guessing that can be more than 1)?  Otherwise that's showing up in
the diagnostic list at the top, then for individual build reports is
showing up as 2 warnings instead of 1.

On Tue, Aug 1, 2023 at 10:53=E2=80=AFPM kernelci.org bot <bot@kernelci.org>=
 wrote:
>
> next/master build: 188 builds: 4 failed, 184 passed, 4 errors, 22 warning=
s (next-20230802)
>
> Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/=
next-20230802/
>
> Tree: next
> Branch: master
> Git Describe: next-20230802
> Git Commit: 626c67169f9972fffcdf3bc3864de421f162ebf5
> Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.=
git
> Built: 8 unique architectures
>
> Build Failures Detected:
>
> arc:
>     haps_hs_smp_defconfig+kselftest: (gcc-10) FAIL
>
> arm:
>     rpc_defconfig: (gcc-10) FAIL
>
> x86_64:
>     x86_64_defconfig+kselftest: (rustc-1.70) FAIL
>     x86_64_defconfig+rust: (rustc-1.70) FAIL
>
> Errors and Warnings Detected:
>
> arc:
>     haps_hs_smp_defconfig+kselftest (gcc-10): 1 error
>
> arm64:
>     defconfig (clang-17): 2 warnings
>     defconfig+CONFIG_ARM64_64K_PAGES=3Dy (clang-17): 2 warnings
>
> arm:
>     h3600_defconfig (gcc-10): 1 warning
>     rpc_defconfig (gcc-10): 2 errors
>
> i386:
>
> mips:
>
> riscv:
>     defconfig (clang-17): 2 warnings
>     rv32_defconfig (clang-17): 2 warnings
>
> sparc:
>     allnoconfig (gcc-10): 1 warning
>     sparc32_defconfig (gcc-10): 2 warnings
>     sparc64_defconfig (gcc-10): 4 warnings
>     sparc64_defconfig+debug (gcc-10): 2 warnings
>     sparc64_defconfig+kselftest (gcc-10): 2 warnings
>     tinyconfig (gcc-10): 1 warning
>
> x86_64:
>     x86_64_defconfig+kselftest (rustc-1.70): 1 error, 1 warning
>
> Errors summary:
>
>     1    net/bpfilter/main.c:3:10: fatal error: sys/uio.h: No such file o=
r directory
>     1    fs/btrfs/extent_io.c:232:16: error: variable 'pages_processed' s=
et but not used [-Werror,-Wunused-but-set-variable]
>     1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7=
,=3D0x'
>     1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3=
,=3D0x'
>
> Warnings summary:
>
>     10   <stdin>:1519:2: warning: #warning syscall clone3 not implemented=
 [-Wcpp]
>     4    fs/btrfs/extent_io.c:232:16: warning: variable 'pages_processed'=
 set but not used [-Wunused-but-set-variable]
>     4    1 warning generated.
>     2    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version gene=
ration failed, symbol will not be versioned.
>     1    vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x23: relocation =
to !ENDBR: .text+0x1395ab
>     1    drivers/mfd/ipaq-micro.c:81:6: warning: unused variable =E2=80=
=98i=E2=80=99 [-Wunused-variable]
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
> 32r2el_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches
>
> -------------------------------------------------------------------------=
-------
> 32r2el_defconfig+debug (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> 32r2el_defconfig+kselftest (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 war=
nings, 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> allnoconfig (i386, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches
>
> -------------------------------------------------------------------------=
-------
> allnoconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches
>
> -------------------------------------------------------------------------=
-------
> allnoconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches
>
> Warnings:
>     <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wc=
pp]
>
> -------------------------------------------------------------------------=
-------
> allnoconfig (x86_64, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches
>
> -------------------------------------------------------------------------=
-------
> allnoconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches
>
> -------------------------------------------------------------------------=
-------
> allnoconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches
>
> -------------------------------------------------------------------------=
-------
> am200epdkit_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches
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
> aspeed_g5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches
>
> -------------------------------------------------------------------------=
-------
> aspeed_g5_defconfig (arm, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches
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
> bcm2835_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches
>
> -------------------------------------------------------------------------=
-------
> bcm47xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches
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
> ci20_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches
>
> -------------------------------------------------------------------------=
-------
> cobalt_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches
>
> -------------------------------------------------------------------------=
-------
> collie_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches
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
> decstation_64_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnin=
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
> defconfig (riscv, clang-17) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches
>
> Warnings:
>     fs/btrfs/extent_io.c:232:16: warning: variable 'pages_processed' set =
but not used [-Wunused-but-set-variable]
>     1 warning generated.
>
> -------------------------------------------------------------------------=
-------
> defconfig (arm64, clang-17) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches
>
> Warnings:
>     fs/btrfs/extent_io.c:232:16: warning: variable 'pages_processed' set =
but not used [-Wunused-but-set-variable]
>     1 warning generated.
>
> -------------------------------------------------------------------------=
-------
> defconfig+CONFIG_ARM64_16K_PAGES=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 er=
rors, 0 warnings, 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-17) =E2=80=94 PASS, 0 =
errors, 2 warnings, 0 section mismatches
>
> Warnings:
>     fs/btrfs/extent_io.c:232:16: warning: variable 'pages_processed' set =
but not used [-Wunused-but-set-variable]
>     1 warning generated.
>
> -------------------------------------------------------------------------=
-------
> defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 er=
rors, 0 warnings, 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 err=
ors, 0 warnings, 0 section mismatches
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
> defconfig+arm64-chromebook+kselftest (arm64, gcc-10) =E2=80=94 PASS, 0 er=
rors, 0 warnings, 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> defconfig+arm64-chromebook+videodec (arm64, gcc-10) =E2=80=94 PASS, 0 err=
ors, 0 warnings, 0 section mismatches
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
> defconfig+videodec (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> exynos_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches
>
> -------------------------------------------------------------------------=
-------
> footbridge_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> fuloong2e_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> gcw0_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches
>
> -------------------------------------------------------------------------=
-------
> gemini_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches
>
> -------------------------------------------------------------------------=
-------
> gpr_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches
>
> -------------------------------------------------------------------------=
-------
> h3600_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches
>
> Warnings:
>     drivers/mfd/ipaq-micro.c:81:6: warning: unused variable =E2=80=98i=E2=
=80=99 [-Wunused-variable]
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
> haps_hs_smp_defconfig+kselftest (arc, gcc-10) =E2=80=94 FAIL, 1 error, 0 =
warnings, 0 section mismatches
>
> Errors:
>     net/bpfilter/main.c:3:10: fatal error: sys/uio.h: No such file or dir=
ectory
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
> i386_defconfig (i386, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
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
> jornada720_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> keystone_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches
>
> -------------------------------------------------------------------------=
-------
> lemote2f_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches
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
> loongson2k_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> loongson3_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> lpc18xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches
>
> -------------------------------------------------------------------------=
-------
> lpc32xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches
>
> -------------------------------------------------------------------------=
-------
> malta_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches
>
> -------------------------------------------------------------------------=
-------
> malta_kvm_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches
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
> mps2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches
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
> multi_v5_defconfig (arm, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> multi_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches
>
> -------------------------------------------------------------------------=
-------
> multi_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches
>
> -------------------------------------------------------------------------=
-------
> multi_v7_defconfig (arm, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches
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
> nhk8815_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches
>
> -------------------------------------------------------------------------=
-------
> nommu_k210_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> nommu_k210_defconfig (riscv, clang-17) =E2=80=94 PASS, 0 errors, 0 warnin=
gs, 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> nommu_k210_sdcard_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 w=
arnings, 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> nommu_k210_sdcard_defconfig (riscv, clang-17) =E2=80=94 PASS, 0 errors, 0=
 warnings, 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> nsimosci_hs_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches
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
> omega2p_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches
>
> -------------------------------------------------------------------------=
-------
> orion5x_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches
>
> -------------------------------------------------------------------------=
-------
> pic32mzda_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> pxa168_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches
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
> rb532_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches
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
> rpc_defconfig (arm, gcc-10) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 secti=
on mismatches
>
> Errors:
>     arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=3D0=
x'
>     arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=3D0=
x'
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
> rv32_defconfig (riscv, clang-17) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches
>
> Warnings:
>     fs/btrfs/extent_io.c:232:16: warning: variable 'pages_processed' set =
but not used [-Wunused-but-set-variable]
>     1 warning generated.
>
> -------------------------------------------------------------------------=
-------
> rv32_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches
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
> shmobile_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches
>
> -------------------------------------------------------------------------=
-------
> socfpga_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches
>
> -------------------------------------------------------------------------=
-------
> sp7021_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches
>
> -------------------------------------------------------------------------=
-------
> sparc32_defconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches
>
> Warnings:
>     <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wc=
pp]
>     <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wc=
pp]
>
> -------------------------------------------------------------------------=
-------
> sparc64_defconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0=
 section mismatches
>
> Warnings:
>     <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wc=
pp]
>     WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generatio=
n failed, symbol will not be versioned.
>     <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wc=
pp]
>     WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generatio=
n failed, symbol will not be versioned.
>
> -------------------------------------------------------------------------=
-------
> sparc64_defconfig+debug (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warni=
ngs, 0 section mismatches
>
> Warnings:
>     <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wc=
pp]
>     <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wc=
pp]
>
> -------------------------------------------------------------------------=
-------
> sparc64_defconfig+kselftest (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 2 w=
arnings, 0 section mismatches
>
> Warnings:
>     <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wc=
pp]
>     <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wc=
pp]
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
> spitz_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches
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
> tegra_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches
>
> -------------------------------------------------------------------------=
-------
> tinyconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches
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
> tinyconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches
>
> Warnings:
>     <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wc=
pp]
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
> wpcm450_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches
>
> -------------------------------------------------------------------------=
-------
> x86_64_defconfig (x86_64, rustc-1.70) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> x86_64_defconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches
>
> -------------------------------------------------------------------------=
-------
> x86_64_defconfig (x86_64, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> x86_64_defconfig+debug (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warni=
ngs, 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> x86_64_defconfig+kselftest (x86_64, rustc-1.70) =E2=80=94 FAIL, 1 error, =
1 warning, 0 section mismatches
>
> Errors:
>     fs/btrfs/extent_io.c:232:16: error: variable 'pages_processed' set bu=
t not used [-Werror,-Wunused-but-set-variable]
>
> Warnings:
>     vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x23: relocation to !E=
NDBR: .text+0x1395ab
>
> -------------------------------------------------------------------------=
-------
> x86_64_defconfig+kselftest (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 w=
arnings, 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> x86_64_defconfig+rust (x86_64, rustc-1.70) =E2=80=94 FAIL, 0 errors, 0 wa=
rnings, 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> x86_64_defconfig+rust-samples (x86_64, rustc-1.70) =E2=80=94 PASS, 0 erro=
rs, 0 warnings, 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> x86_64_defconfig+x86-chromebook (x86_64, gcc-10) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches
>
> -------------------------------------------------------------------------=
-------
> x86_64_defconfig+x86-chromebook+kselftest (x86_64, gcc-10) =E2=80=94 PASS=
, 0 errors, 0 warnings, 0 section mismatches
>
> ---
> For more info write to <info@kernelci.org>
>


--=20
Thanks,
~Nick Desaulniers
