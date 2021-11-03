Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D9B2C98
	for <llvm@lists.linux.dev>; Wed,  3 Nov 2021 17:46:57 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id g3so5173690ljm.8
        for <llvm@lists.linux.dev>; Wed, 03 Nov 2021 10:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fz5FHWrY83yI4/8MCcXGCruKU66Cq7FbRKs3mgk0opw=;
        b=azkR5IKUw2xAIUmI9jtpM/gSAeK3bdX2JalJp6GY4/49nW/Y+et72Ld7RF3vi0TT2v
         YtNJgsTEEqYRiEJu2gtNMkvEIYjhI3Ua0NU7TVnhG86icCcO+DotJVEw/aXwUkLol+cf
         hVj56LrNBYBFSnlqrXF8wbFXaBqFoQcwaonwCnkoBpJ9WGDHH1MLpasyqwkTnCeIGHha
         UpVknhITTF12pjkAAsHaaR0ohmZkB7MmAWAeXUK7H6y0m0/pZrK/v8yGUra0H8zGXuYm
         ut8lOyOK4jx4xDbuTSzCNfqE3/A4an4gsX0qSs/oOvwr9zAeRn2Dr8z/mwPzoKYXzTaN
         B56Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fz5FHWrY83yI4/8MCcXGCruKU66Cq7FbRKs3mgk0opw=;
        b=dz3CfplZy4Btq9m2DxsFgrmBg5HElyroq6NiDykkpiBATXPfX7fgp68YlVJuLKs4Hq
         qRsLY8QjQoPcjzqqt6ZqjDLsyQDlGX1SEQHt/qXdigXp8rv6YNslft1TbAUgLgtQ/rXW
         kosYcyTL6T1oG4zqUNvCpkLOlpmz73+0iRT/3oWyahMAfdVsVaVGkkZ5wsZmHP7L5BHZ
         4oKT3e83KMhiKxMizsqV0k67LINNz47pgFMDwsqEmznv41c5Id95/xeDOsZaWSyxf3e/
         3j2jsSTvJrZacsN0YP1MfyHYeW/rvRlpGAb3e6+5ymTUZHMp0eeWCDPw8+OHdxcChw5n
         aKVA==
X-Gm-Message-State: AOAM530I/OIoalwPrfrJ7QdQ9VcUs1htdS/aJEEdhi3C/jhp5p8Sbu9N
	fvY8Qsk4P1UcLjpFJmD4mB19zUkzGQ752Y4/I8pk9imIYug=
X-Google-Smtp-Source: ABdhPJyae0AVEGwuJbzQdS4hy09TxGtKxz8fW5sKlEWPM7UZs0V6FWKzbBirXBdfSDYkI1U80y1cujSX3bJgJyUHV3E=
X-Received: by 2002:a2e:8183:: with SMTP id e3mr14342103ljg.526.1635961615742;
 Wed, 03 Nov 2021 10:46:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <205626749.4145.1635943938669@jenkins.jenkins> <810882F1-8476-435A-8B32-272F4D9D78D5@linaro.org>
 <CAKwvOdnt5G5FLgW9ryycGScRHphkWkgU8=PciCrCfxQyZJ9LKg@mail.gmail.com> <3D7FC531-CCFF-44EC-AE18-C941E30D1C85@linaro.org>
In-Reply-To: <3D7FC531-CCFF-44EC-AE18-C941E30D1C85@linaro.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 3 Nov 2021 10:46:43 -0700
Message-ID: <CAKwvOdn7oW+ZO83-rFuGUMWBj10f=yZ=+O3ZTQ_afgQ6ossZOA@mail.gmail.com>
Subject: Re: [TCWG CI] Regression caused by linux: arm64: vdso32: require
 CROSS_COMPILE_COMPAT for gcc+bfd
To: Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>
Cc: llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 3, 2021 at 10:13 AM Maxim Kuvyrkov
<maxim.kuvyrkov@linaro.org> wrote:
>
> > On 3 Nov 2021, at 20:07, Nick Desaulniers <ndesaulniers@google.com> wrote:
> >
> > On Wed, Nov 3, 2021 at 5:59 AM Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org> wrote:
> >>
> >> Hi Nick,
> >>
> >> Is this known?
> >
> > News to me. Thanks for the report. This is when building with clang?
>
> Yes, clang mainline and latest release branch.  Only kernel defconfig seems to be affected.
>
> > Do you have the make invocation for this test?
>
> The log is here:
>
> https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-aarch64-mainline-defconfig/28/artifact/artifacts/build-3e6f8d1fa18457d54b20917bd9174d27daf09ab9/06-build_linux/
>
> It seems that building aarch64 kernel with clang implies that clang can also build for aarch32 target:
> ===
> error: unable to create target: 'No available targets are compatible with triple "thumbv8-unknown-linux-gnueabi"'
> ===
>
> Which is not the case for our minimally-configured clang.

Ah, ok that makes sense. The kernel patch was written assuming
backends weren't disabled in clang, but the error makes it look like
arm-linux-gnueabi is not supported.

We could adjust the kernel patch to test for that assumption.

That said, since the purpose of the TCWG CI is to catch regressions,
the "32b compat vdso" is actually very important to ensure we keep it
buildable. It's one of the more complex parts of the arm64 kernel's
build process, since for GCC it requires a whole other toolchain.
It's critical for android that we build the 32b compat vdso for arm64.
So it would be good to enable the ARM llvm target at the least to help
us catch build breakage in this important part of the build.  I don't
generally want to encourage from a kbuild perspective folks disabling
default-on llvm backends; while they're generally orthogonal ARM vs
Aarch64 is a little special.

>
> --
> Maxim Kuvyrkov
> https://www.linaro.org
>
>
> >>
> >> This was detected in linux-next a few days ago, but email notifications got lost.  Now this appears to have broken mainline.
> >>
> >> Regards,
> >>
> >> --
> >> Maxim Kuvyrkov
> >> https://www.linaro.org
> >>
> >>> On 3 Nov 2021, at 15:52, ci_notify@linaro.org wrote:
> >>>
> >>> [TCWG CI] Regression caused by linux: arm64: vdso32: require CROSS_COMPILE_COMPAT for gcc+bfd:
> >>> commit 3e6f8d1fa18457d54b20917bd9174d27daf09ab9
> >>> Author: Nick Desaulniers <ndesaulniers@google.com>
> >>>
> >>>   arm64: vdso32: require CROSS_COMPILE_COMPAT for gcc+bfd
> >>>
> >>> Results regressed to
> >>> # reset_artifacts:
> >>> -10
> >>> # build_abe binutils:
> >>> -9
> >>> # build_llvm:
> >>> -5
> >>> # build_abe qemu:
> >>> -2
> >>> # linux_n_obj:
> >>> 37
> >>> # First few build errors in logs:
> >>> # 00:01:21 error: unable to create target: 'No available targets are compatible with triple '
> >>> # 00:01:21 make[1]: *** [arch/arm64/kernel/vdso32/note.o] Error 1
> >>> # 00:01:21 error: unable to create target: 'No available targets are compatible with triple '
> >>> # 00:01:21 make[1]: *** [arch/arm64/kernel/vdso32/vgettimeofday.o] Error 1
> >>> # 00:01:21 make: *** [vdso_prepare] Error 2
> >>>
> >>> from
> >>> # reset_artifacts:
> >>> -10
> >>> # build_abe binutils:
> >>> -9
> >>> # build_llvm:
> >>> -5
> >>> # build_abe qemu:
> >>> -2
> >>> # linux_n_obj:
> >>> 7716
> >>> # linux build successful:
> >>> all
> >>> # linux boot successful:
> >>> boot
> >>>
> >>> THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.
> >>>
> >>> This commit has regressed these CI configurations:
> >>> - tcwg_kernel/llvm-master-aarch64-next-defconfig
> >>> - tcwg_kernel/llvm-release-aarch64-mainline-defconfig
> >>> - tcwg_kernel/llvm-release-aarch64-next-defconfig
> >>>
> >>> First_bad build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-aarch64-mainline-defconfig/28/artifact/artifacts/build-3e6f8d1fa18457d54b20917bd9174d27daf09ab9/
> >>> Last_good build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-aarch64-mainline-defconfig/28/artifact/artifacts/build-14831fad73f5ac30ac61760487d95a538e6ab3cb/
> >>> Baseline build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-aarch64-mainline-defconfig/28/artifact/artifacts/build-baseline/
> >>> Even more details: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-aarch64-mainline-defconfig/28/artifact/artifacts/
> >>>
> >>> Reproduce builds:
> >>> <cut>
> >>> mkdir investigate-linux-3e6f8d1fa18457d54b20917bd9174d27daf09ab9
> >>> cd investigate-linux-3e6f8d1fa18457d54b20917bd9174d27daf09ab9
> >>>
> >>> # Fetch scripts
> >>> git clone https://git.linaro.org/toolchain/jenkins-scripts
> >>>
> >>> # Fetch manifests and test.sh script
> >>> mkdir -p artifacts/manifests
> >>> curl -o artifacts/manifests/build-baseline.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-aarch64-mainline-defconfig/28/artifact/artifacts/manifests/build-baseline.sh --fail
> >>> curl -o artifacts/manifests/build-parameters.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-aarch64-mainline-defconfig/28/artifact/artifacts/manifests/build-parameters.sh --fail
> >>> curl -o artifacts/test.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-aarch64-mainline-defconfig/28/artifact/artifacts/test.sh --fail
> >>> chmod +x artifacts/test.sh
> >>>
> >>> # Reproduce the baseline build (build all pre-requisites)
> >>> ./jenkins-scripts/tcwg_kernel-build.sh @@ artifacts/manifests/build-baseline.sh
> >>>
> >>> # Save baseline build state (which is then restored in artifacts/test.sh)
> >>> mkdir -p ./bisect
> >>> rsync -a --del --delete-excluded --exclude /bisect/ --exclude /artifacts/ --exclude /linux/ ./ ./bisect/baseline/
> >>>
> >>> cd linux
> >>>
> >>> # Reproduce first_bad build
> >>> git checkout --detach 3e6f8d1fa18457d54b20917bd9174d27daf09ab9
> >>> ../artifacts/test.sh
> >>>
> >>> # Reproduce last_good build
> >>> git checkout --detach 14831fad73f5ac30ac61760487d95a538e6ab3cb
> >>> ../artifacts/test.sh
> >>>
> >>> cd ..
> >>> </cut>
> >>>
> >>> Full commit (up to 1000 lines):
> >>> <cut>
> >>> commit 3e6f8d1fa18457d54b20917bd9174d27daf09ab9
> >>> Author: Nick Desaulniers <ndesaulniers@google.com>
> >>> Date:   Tue Oct 19 15:36:46 2021 -0700
> >>>
> >>>   arm64: vdso32: require CROSS_COMPILE_COMPAT for gcc+bfd
> >>>
> >>>   Similar to
> >>>   commit 231ad7f409f1 ("Makefile: infer --target from ARCH for CC=clang")
> >>>   There really is no point in setting --target based on
> >>>   $CROSS_COMPILE_COMPAT for clang when the integrated assembler is being
> >>>   used, since
> >>>   commit ef94340583ee ("arm64: vdso32: drop -no-integrated-as flag").
> >>>
> >>>   Allows COMPAT_VDSO to be selected without setting $CROSS_COMPILE_COMPAT
> >>>   when using clang and lld together.
> >>>
> >>>   Before:
> >>>   $ ARCH=arm64 CROSS_COMPILE_COMPAT=arm-linux-gnueabi- make -j72 LLVM=1 defconfig
> >>>   $ grep CONFIG_COMPAT_VDSO .config
> >>>   CONFIG_COMPAT_VDSO=y
> >>>   $ ARCH=arm64 make -j72 LLVM=1 defconfig
> >>>   $ grep CONFIG_COMPAT_VDSO .config
> >>>   $
> >>>
> >>>   After:
> >>>   $ ARCH=arm64 CROSS_COMPILE_COMPAT=arm-linux-gnueabi- make -j72 LLVM=1 defconfig
> >>>   $ grep CONFIG_COMPAT_VDSO .config
> >>>   CONFIG_COMPAT_VDSO=y
> >>>   $ ARCH=arm64 make -j72 LLVM=1 defconfig
> >>>   $ grep CONFIG_COMPAT_VDSO .config
> >>>   CONFIG_COMPAT_VDSO=y
> >>>
> >>>   Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> >>>   Suggested-by: Nathan Chancellor <nathan@kernel.org>
> >>>   Tested-by: Nathan Chancellor <nathan@kernel.org>
> >>>   Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> >>>   Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
> >>>   Link: https://lore.kernel.org/r/20211019223646.1146945-5-ndesaulniers@google.com
> >>>   Signed-off-by: Will Deacon <will@kernel.org>
> >>> ---
> >>> arch/arm64/Kconfig                |  3 ++-
> >>> arch/arm64/kernel/vdso32/Makefile | 17 +++++------------
> >>> 2 files changed, 7 insertions(+), 13 deletions(-)
> >>>
> >>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> >>> index 5c7ae4c3954b..f0f2c95aa4c8 100644
> >>> --- a/arch/arm64/Kconfig
> >>> +++ b/arch/arm64/Kconfig
> >>> @@ -1264,7 +1264,8 @@ config KUSER_HELPERS
> >>>
> >>> config COMPAT_VDSO
> >>>      bool "Enable vDSO for 32-bit applications"
> >>> -     depends on !CPU_BIG_ENDIAN && "$(CROSS_COMPILE_COMPAT)" != ""
> >>> +     depends on !CPU_BIG_ENDIAN
> >>> +     depends on (CC_IS_CLANG && LD_IS_LLD) || "$(CROSS_COMPILE_COMPAT)" != ""
> >>>      select GENERIC_COMPAT_VDSO
> >>>      default y
> >>>      help
> >>> diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
> >>> index e478cebb9891..c8fec493a450 100644
> >>> --- a/arch/arm64/kernel/vdso32/Makefile
> >>> +++ b/arch/arm64/kernel/vdso32/Makefile
> >>> @@ -10,18 +10,15 @@ include $(srctree)/lib/vdso/Makefile
> >>>
> >>> # Same as cc-*option, but using CC_COMPAT instead of CC
> >>> ifeq ($(CONFIG_CC_IS_CLANG), y)
> >>> -CC_COMPAT_CLANG_FLAGS := --target=$(notdir $(CROSS_COMPILE_COMPAT:%-=%))
> >>> -
> >>> CC_COMPAT ?= $(CC)
> >>> -CC_COMPAT += $(CC_COMPAT_CLANG_FLAGS)
> >>> -
> >>> -ifneq ($(LLVM),)
> >>> -LD_COMPAT ?= $(LD)
> >>> +CC_COMPAT += --target=arm-linux-gnueabi
> >>> else
> >>> -LD_COMPAT ?= $(CROSS_COMPILE_COMPAT)ld
> >>> +CC_COMPAT ?= $(CROSS_COMPILE_COMPAT)gcc
> >>> endif
> >>> +
> >>> +ifeq ($(CONFIG_LD_IS_LLD), y)
> >>> +LD_COMPAT ?= $(LD)
> >>> else
> >>> -CC_COMPAT ?= $(CROSS_COMPILE_COMPAT)gcc
> >>> LD_COMPAT ?= $(CROSS_COMPILE_COMPAT)ld
> >>> endif
> >>>
> >>> @@ -45,10 +42,6 @@ VDSO_CPPFLAGS += $(LINUXINCLUDE)
> >>> # Common C and assembly flags
> >>> # From top-level Makefile
> >>> VDSO_CAFLAGS := $(VDSO_CPPFLAGS)
> >>> -ifneq ($(shell $(CC_COMPAT) --version 2>&1 | head -n 1 | grep clang),)
> >>> -VDSO_CAFLAGS += --target=$(notdir $(CROSS_COMPILE_COMPAT:%-=%))
> >>> -endif
> >>> -
> >>> VDSO_CAFLAGS += $(call cc32-option,-fno-PIE)
> >>> ifdef CONFIG_DEBUG_INFO
> >>> VDSO_CAFLAGS += -g
> >>> </cut>
> >>
> >
> >
> > --
> > Thanks,
> > ~Nick Desaulniers
>


-- 
Thanks,
~Nick Desaulniers
