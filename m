Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2593220
	for <llvm@lists.linux.dev>; Fri, 28 Apr 2023 17:27:19 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-51b5490c6f0so64132a12.0
        for <llvm@lists.linux.dev>; Fri, 28 Apr 2023 10:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1682702839; x=1685294839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jYpNnylGJHgq8QdgUzYnN4n+L+5QNmyTeDA2Ga8l8RY=;
        b=c1TFqUjbMlG8d+PtKNIeuJGhnVkXEVFm5OJpR+jZHN9QGhY+qOiKdUK4+shywcnUk2
         OwzelfQZlcpZYzeB9UPgDrAtv8MILZNznIvZAc64BS/sRlARMp/OeDQcKRPR5kjhHqjt
         IXtz+RE1RfEjWrPJ3AmzwjWq7InBZ/iZp6ZOF/fyF0GSP8g1uUt/IfL/1w5h0FO874EN
         HdYdXapFssQ9/S4dHxxHCrh1NAnr95QXpVpFm5+iNjcl+FT0pTJy9wxyTimM3FjigwXO
         oFiV1+afM3X5qBprcXqkrQDmDj7jr3SGvPeZiDzun9y/A/u2kelir96G1A23amYLcJZZ
         ez3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682702839; x=1685294839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jYpNnylGJHgq8QdgUzYnN4n+L+5QNmyTeDA2Ga8l8RY=;
        b=k4OI+OnsRc3HeOX10jgfpn6FocoeIim8BPU7L0la7jxFFaDUx5CN3jELuLGQd8rQ4/
         WNHUzN2zpuCyRZThGzvSEGVt4m/esXc7LEN7PFrblK45Yhhqmbz2pNpQP8J9sxF5jDBv
         u27G0epdU55/zpoxfAe0hl8L4Qm1tRNypPDuftofYetfaEXCj1TNrh0/3RSfRQrzNVRY
         rUOSme2njFHuHUa5yCoqynfX4Y9RbyRDt9fIbsPyZKZTS3rbRYvvo6WZXq7CGChZfVVQ
         /J1UrSN1hDo3oyJBnvIWnOVBV7vlEgsw+Jwry9OghbtEzF8tgmMSjaWoyPh9WZGkJWXO
         FGfg==
X-Gm-Message-State: AC+VfDyF1P3Hpr9V3ggjHqzzeRG47hUXKz/Kl1AG/Ba0wMoO7zFaE82m
	zFc7JAUvXMhhCJVkTUyMz8G5DV0V4UafUyqmZVCaSLRk10Xpu1zXRoN5ug==
X-Google-Smtp-Source: ACHHUZ5lKXsh5nlG9/wpXMyBSbCKbXBJSxzarY1uHSFDEGM06hOCCAm4u2OaX+Ped5NHteguRmlUh02OehGnvgsWjC4=
X-Received: by 2002:a17:90a:8414:b0:246:9ef5:3c45 with SMTP id
 j20-20020a17090a841400b002469ef53c45mr6317303pjn.13.1682702838648; Fri, 28
 Apr 2023 10:27:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAK7LNAT_cMLGLBz7ugaLpJD3QmZmY8FK56x9nihvWeYhJpi2ag@mail.gmail.com>
 <20220919170828.3718437-1-ndesaulniers@google.com> <597ef55f-e7c1-ab60-b4aa-0071ff4b5e0e@collabora.com>
In-Reply-To: <597ef55f-e7c1-ab60-b4aa-0071ff4b5e0e@collabora.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 28 Apr 2023 10:27:07 -0700
Message-ID: <CAKwvOdmSrAxx-YY1Na3BSdYuxXCPKK+F0K5V6i+adTn_bVJEsw@mail.gmail.com>
Subject: Re: [PATCH v4] Makefile.compiler: replace cc-ifversion with
 compiler-specific macros
To: Shreeya Patel <shreeya.patel@collabora.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Masahiro Yamada <masahiroy@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	Bill Wendling <morbo@google.com>, Nathan Chancellor <nathan@kernel.org>, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 27, 2023 at 4:54=E2=80=AFAM Shreeya Patel
<shreeya.patel@collabora.com> wrote:
>
> Hi Nick,
>
> On 19/09/22 22:38, Nick Desaulniers wrote:
> > cc-ifversion is GCC specific. Replace it with compiler specific
> > variants. Update the users of cc-ifversion to use these new macros.
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/350
> > Link: https://lore.kernel.org/llvm/CAGG=3D3QWSAUakO42kubrCap8fp-gm1ERJJ=
AYXTnP1iHk_wrH=3DBQ@mail.gmail.com/
> > Suggested-by: Bill Wendling <morbo@google.com>
> > Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
>
> KernelCI found this patch causes a regression in the
> baseline.logintest on qemu_arm-virt-gicv3-uefi [1],
> see the bisection report for more details [2].
>
> Let me know if you have any questions.
>
>
> [1] https://linux.kernelci.org/test/case/id/644596a0beca2ead032e8669/

Hi Shreeya,
Thanks for the report.

When I click the above link, then click `multi_v7_defconfig+debug` to
get the config necessary to reproduce, I get an HTTP 404.
https://storage.kernelci.org/mainline/master/v6.3/arm/multi_v7_defconfig+de=
bug/gcc-10/kernel.config

Same for zImage
https://storage.kernelci.org/mainline/master/v6.3/arm/multi_v7_defconfig+de=
bug/gcc-10/zImage

If I click on the log
https://storage.kernelci.org/mainline/master/v6.3/arm/multi_v7_defconfig+de=
bug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3-uefi.txt
It looks like the machine powered up, then powered off. Is the test
actually failing?

I was able to boot ARCH=3Darm defconfig with CC=3Darm-linux-gnueabihf-gcc
(Debian 10.2.1-6) in QEMU just fine.  So I'm going to need some more
information to help reproduce what specifically is failing.

Linux version 6.3.0 (root@61385772abae) (arm-linux-gnueabihf-gcc
(Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian)
2.35.2) #1 SMP Fri Apr 28 17:19:59 UTC 2023

---

It does look like UBSAN is flagging an array OOB:

<3>[    0.417001][    T1] UBSAN: array-index-out-of-bounds in
../arch/arm/mach-sunxi/mc_smp.c:811:29

And potentially another issue with ftrace

<4>[    0.000000][    T0] WARNING: CPU: 0 PID: 0 at
kernel/trace/ftrace.c:2176 ftrace_bug+0x340/0x3b4



> [2] https://groups.io/g/kernelci-results/message/40804
>
>
> Thanks,
> Shreeya Patel
>
> #regzbot introduced: 88b61e3bff93
>
> > ---
> > Changes v3 -> v4:
> > * Split into its own patch again from series, as per Masahiro.
> > * Rebase on top of b0839b281c427e844143dba3893e25c83cdd6c17 and update
> >    clang -Wformat logic in scripts/Makefile.extrawarn, as per Masahiro.
> >
> >   Documentation/kbuild/makefiles.rst          | 29 ++++++++++++--------=
-
> >   Makefile                                    |  6 ++---
> >   drivers/gpu/drm/amd/display/dc/dml/Makefile |  2 +-
> >   scripts/Makefile.compiler                   | 10 ++++---
> >   scripts/Makefile.extrawarn                  |  4 +--
> >   5 files changed, 29 insertions(+), 22 deletions(-)
> >
> > diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/=
makefiles.rst
> > index 11a296e52d68..ee7e3ea1fbe1 100644
> > --- a/Documentation/kbuild/makefiles.rst
> > +++ b/Documentation/kbuild/makefiles.rst
> > @@ -682,22 +682,27 @@ more details, with real examples.
> >       In the above example, -Wno-unused-but-set-variable will be added =
to
> >       KBUILD_CFLAGS only if gcc really accepts it.
> >
> > -    cc-ifversion
> > -     cc-ifversion tests the version of $(CC) and equals the fourth par=
ameter
> > -     if version expression is true, or the fifth (if given) if the ver=
sion
> > -     expression is false.
> > +    gcc-min-version
> > +     gcc-min-version tests if the value of $(CONFIG_GCC_VERSION) is gr=
eater than
> > +     or equal to the provided value and evaluates to y if so.
> >
> >       Example::
> >
> > -             #fs/reiserfs/Makefile
> > -             ccflags-y :=3D $(call cc-ifversion, -lt, 0402, -O1)
> > +             cflags-$(call gcc-min-version, 70100) :=3D -foo
> >
> > -     In this example, ccflags-y will be assigned the value -O1 if the
> > -     $(CC) version is less than 4.2.
> > -     cc-ifversion takes all the shell operators:
> > -     -eq, -ne, -lt, -le, -gt, and -ge
> > -     The third parameter may be a text as in this example, but it may =
also
> > -     be an expanded variable or a macro.
> > +     In this example, cflags-y will be assigned the value -foo if $(CC=
) is gcc and
> > +     $(CONFIG_GCC_VERSION) is >=3D 7.1.
> > +
> > +    clang-min-version
> > +     clang-min-version tests if the value of $(CONFIG_CLANG_VERSION) i=
s greater
> > +     than or equal to the provided value and evaluates to y if so.
> > +
> > +     Example::
> > +
> > +             cflags-$(call clang-min-version, 110000) :=3D -foo
> > +
> > +     In this example, cflags-y will be assigned the value -foo if $(CC=
) is clang
> > +     and $(CONFIG_CLANG_VERSION) is >=3D 11.0.0.
> >
> >       cc-cross-prefix
> >       cc-cross-prefix is used to check if there exists a $(CC) in path =
with
> > diff --git a/Makefile b/Makefile
> > index 298f69060f10..411c8480b37e 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -790,7 +790,6 @@ KBUILD_CFLAGS +=3D $(stackp-flags-y)
> >
> >   KBUILD_CFLAGS-$(CONFIG_WERROR) +=3D -Werror
> >   KBUILD_CFLAGS-$(CONFIG_CC_NO_ARRAY_BOUNDS) +=3D -Wno-array-bounds
> > -KBUILD_CFLAGS +=3D $(KBUILD_CFLAGS-y) $(CONFIG_CC_IMPLICIT_FALLTHROUGH=
)
> >
> >   ifdef CONFIG_CC_IS_CLANG
> >   KBUILD_CPPFLAGS +=3D -Qunused-arguments
> > @@ -972,7 +971,6 @@ ifdef CONFIG_CC_IS_GCC
> >   KBUILD_CFLAGS +=3D -Wno-maybe-uninitialized
> >   endif
> >
> > -ifdef CONFIG_CC_IS_GCC
> >   # The allocators already balk at large sizes, so silence the compiler
> >   # warnings for bounds checks involving those possible values. While
> >   # -Wno-alloc-size-larger-than would normally be used here, earlier ve=
rsions
> > @@ -984,8 +982,8 @@ ifdef CONFIG_CC_IS_GCC
> >   # ignored, continuing to default to PTRDIFF_MAX. So, left with no oth=
er
> >   # choice, we must perform a versioned check to disable this warning.
> >   # https://lore.kernel.org/lkml/20210824115859.187f272f@canb.auug.org.=
au
> > -KBUILD_CFLAGS +=3D $(call cc-ifversion, -ge, 0901, -Wno-alloc-size-lar=
ger-than)
> > -endif
> > +KBUILD_CFLAGS-$(call gcc-min-version, 90100) +=3D -Wno-alloc-size-larg=
er-than
> > +KBUILD_CFLAGS +=3D $(KBUILD_CFLAGS-y) $(CONFIG_CC_IMPLICIT_FALLTHROUGH=
)
> >
> >   # disable invalid "can't wrap" optimizations for signed / pointers
> >   KBUILD_CFLAGS       +=3D -fno-strict-overflow
> > diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/=
drm/amd/display/dc/dml/Makefile
> > index cb81ed2fbd53..d70838edba80 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
> > +++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> > @@ -34,7 +34,7 @@ dml_ccflags :=3D -mhard-float -maltivec
> >   endif
> >
> >   ifdef CONFIG_CC_IS_GCC
> > -ifeq ($(call cc-ifversion, -lt, 0701, y), y)
> > +ifneq ($(call gcc-min-version, 70100),y)
> >   IS_OLD_GCC =3D 1
> >   endif
> >   endif
> > diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
> > index 94d0d40cddb3..9d18fb91890e 100644
> > --- a/scripts/Makefile.compiler
> > +++ b/scripts/Makefile.compiler
> > @@ -61,9 +61,13 @@ cc-option-yn =3D $(call try-run,\
> >   cc-disable-warning =3D $(call try-run,\
> >       $(CC) -Werror $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) -W$(strip $(1))=
 -c -x c /dev/null -o "$$TMP",-Wno-$(strip $(1)))
> >
> > -# cc-ifversion
> > -# Usage:  EXTRA_CFLAGS +=3D $(call cc-ifversion, -lt, 0402, -O1)
> > -cc-ifversion =3D $(shell [ $(CONFIG_GCC_VERSION)0 $(1) $(2)000 ] && ec=
ho $(3) || echo $(4))
> > +# gcc-min-version
> > +# Usage: cflags-$(call gcc-min-version, 70100) +=3D -foo
> > +gcc-min-version =3D $(shell [ $(CONFIG_GCC_VERSION) -ge $(1) ] && echo=
 y)
> > +
> > +# clang-min-version
> > +# Usage: cflags-$(call clang-min-version, 110000) +=3D -foo
> > +clang-min-version =3D $(shell [ $(CONFIG_CLANG_VERSION) -ge $(1) ] && =
echo y)
> >
> >   # ld-option
> >   # Usage: KBUILD_LDFLAGS +=3D $(call ld-option, -X, -Y)
> > diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> > index 6ae482158bc4..5769c1939d40 100644
> > --- a/scripts/Makefile.extrawarn
> > +++ b/scripts/Makefile.extrawarn
> > @@ -48,7 +48,7 @@ else
> >   ifdef CONFIG_CC_IS_CLANG
> >   KBUILD_CFLAGS +=3D -Wno-initializer-overrides
> >   # Clang before clang-16 would warn on default argument promotions.
> > -ifeq ($(shell [ $(CONFIG_CLANG_VERSION) -lt 160000 ] && echo y),y)
> > +ifneq ($(call clang-min-version, 160000),y)
> >   # Disable -Wformat
> >   KBUILD_CFLAGS +=3D -Wno-format
> >   # Then re-enable flags that were part of the -Wformat group that aren=
't
> > @@ -56,7 +56,7 @@ KBUILD_CFLAGS +=3D -Wno-format
> >   KBUILD_CFLAGS +=3D -Wformat-extra-args -Wformat-invalid-specifier
> >   KBUILD_CFLAGS +=3D -Wformat-zero-length -Wnonnull
> >   # Requires clang-12+.
> > -ifeq ($(shell [ $(CONFIG_CLANG_VERSION) -ge 120000 ] && echo y),y)
> > +ifeq ($(call clang-min-version, 120000),y)
> >   KBUILD_CFLAGS +=3D -Wformat-insufficient-args
> >   endif
> >   endif



--=20
Thanks,
~Nick Desaulniers
