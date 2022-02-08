Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79FB2F2C
	for <llvm@lists.linux.dev>; Tue,  8 Feb 2022 17:47:01 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id t7so25526403ljc.10
        for <llvm@lists.linux.dev>; Tue, 08 Feb 2022 09:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=C4H60l+MfQQDz9ntVdICbNAqE4mQmfUJ3zaBOzrYpQk=;
        b=BaC//QE5CdAmSiC+fQNjoJC2Cz8jK1edrY+D0ikCqJ9c/3DKUw9qt3H1oPnzoikeAC
         Gpid3d9bKfxp/i7kRYu860XPm/5QGQ259bpE4rEduXYJbo49pjUFM+qIkircmgPLlDa8
         HhHns5PD+4u/bQsVVfTZ20d+EyTuPmMCqmqiRxZKhPzSfMrvVUoYrmHOuowh31jyPnMd
         GlWX9munSExOQBnNJ4fq0X2wPrPuTi2a2/KjYfeuZvvVNXplW7nr28cONX12fOEpV9pS
         gq2q8yV4VY5wjyWKo0QfxubVsJwOvvFYeZh1vdKs+Rff4ouaPJcjD3inEm1o/10njE9A
         87Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=C4H60l+MfQQDz9ntVdICbNAqE4mQmfUJ3zaBOzrYpQk=;
        b=GSfHF8cTHN2xSTzux3fXUnfNqpFI7DADyOaRu3446BR8k+zF6rc/4zbzUVIzmJE6mF
         1nq03u34jnpE8DNi594mVzXyCVnL8mIa4Ncp7TVuXNcd/EelK2jMEXSgrTMdlVvTTyog
         ZGPy70GdtQfxczyk4NCLosFEll876AzkWTloOGLlWfm1j9mgx6StUUlZiWIo0A2NOuYp
         lS9oCjFeYPiOJr4R6CfTdIyXCeBHSPFoBcMbLO7XtPf9O9+G1CjM6hFgNKTDSQ2pChwQ
         UARLFTiWxUKDouxakSnoKVta/04ShkKXEAsDiQXaOsEEDPbXUUu8poszE5CHuKceWt+i
         MlhQ==
X-Gm-Message-State: AOAM530CvAA8+GQGQ6wFS1Fyxw6jeIJIEYdF2XHdUCsxn3kfqL2fwPi+
	yLlXq7jXCkWoXyxe/KlxaHjK7PZxz0MM9fed1aN/Cweqy7Y=
X-Google-Smtp-Source: ABdhPJxmXj1HyZZxx33f6g34M+AHV2zpkU/GTIiZ48RC8zZ6wr5l/+weAbZJ2QJXr4S/8ffQGuXP0Ilk7zYJgWJzk1E=
X-Received: by 2002:a2e:980e:: with SMTP id a14mr3588508ljj.220.1644342419372;
 Tue, 08 Feb 2022 09:46:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220204123740.GA4077@xsang-OptiPlex-9020> <CAKwvOdm0+bB=UY91V=ai2TPg3XCbNUZQfBzxrSUA0AtW=zM=LA@mail.gmail.com>
 <202202071858.0B5538E7CB@keescook> <CAKwvOdm1k51OxYqSq1v9UVp8ZptBkJj7FgOA_QhDjEC6vaU+RQ@mail.gmail.com>
In-Reply-To: <CAKwvOdm1k51OxYqSq1v9UVp8ZptBkJj7FgOA_QhDjEC6vaU+RQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 8 Feb 2022 09:46:47 -0800
Message-ID: <CAKwvOd=uKCizfRdcKJrA8Z0ZzL14P56FPiwsftmzLqvN-qjHOg@mail.gmail.com>
Subject: Fwd: [x86] 1099ce55b0: BUG:kernel_NULL_pointer_dereference,address
To: llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

---------- Forwarded message ---------
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, Feb 8, 2022 at 9:44 AM
Subject: Re: [x86] 1099ce55b0: BUG:kernel_NULL_pointer_dereference,address
To: Kees Cook <keescook@chromium.org>
Cc: Arvind Sankar <nivedita@alum.mit.edu>, Fangrui Song
<maskray@google.com>, LKML <linux-kernel@vger.kernel.org>,
<lkp@lists.01.org>, <lkp@intel.com>, kernel test robot
<oliver.sang@intel.com>


On Mon, Feb 7, 2022 at 7:09 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Mon, Feb 07, 2022 at 04:23:06PM -0800, Nick Desaulniers wrote:
> > On Fri, Feb 4, 2022 at 4:37 AM kernel test robot <oliver.sang@intel.com> wrote:
> > > FYI, we noticed the following commit (built with clang-15):
> > >
> > > commit: 1099ce55b0530ff429312dc37362ad43aee8c5c0 ("x86: don't build CONFIG_X86_32 as -ffreestanding")
> > > https://git.kernel.org/cgit/linux/kernel/git/kees/linux.git for-next/memcpy
> > >
> > > in testcase: boot
> > [...]
> > I've been having a hard time pinpointing via bisection when this
> > stopped working.  I suspect it's actually the change on llvm's side
> > that would replace memcmp with bcmp.  With this diff, we can boot
> > ARCH=i386 defconfig
> >
> > ```
> > diff --git a/arch/x86/Makefile b/arch/x86/Makefile
> > index 7ef211865239..5e4570495206 100644
> > --- a/arch/x86/Makefile
> > +++ b/arch/x86/Makefile
> > @@ -88,6 +88,8 @@ ifeq ($(CONFIG_X86_32),y)
> >          include $(srctree)/arch/x86/Makefile_32.cpu
> >          KBUILD_CFLAGS += $(cflags-y)
> >
> > +        KBUILD_CFLAGS += -fno-builtin-bcmp
> > +
> >         ifeq ($(CONFIG_STACKPROTECTOR),y)
> >                 ifeq ($(CONFIG_SMP),y)
> >                         KBUILD_CFLAGS +=
> > -mstack-protector-guard-reg=fs
> > -mstack-protector-guard-symbol=__stack_chk_guard
> > ```
> >
> > It looks like the call argument setup in the _callers_ of memcmp is messed up.
> >
> > Before:
> > pushl %ecx
> > pushl %ebx
> > pushl -24(%ebp)
> > calll bcmp
> >
> > After:
> > movl  %ebx, %eax
> > movl  %esi, %edx
> > movl  %ecx, %ebx
> > calll memcmp
> >
> > it looks like they're not obeying `-mregparm=3`.
> >
> > https://godbolt.org/z/z3fjveP4h
> >
> > Diffing the IR between `-mregparm=3` vs not, it looks like there's an
> > LLVM IR function argument attribute inreg.
> > https://llvm.org/docs/LangRef.html#parameter-attributes
> > >> This indicates that this parameter or return value should be treated in a
> > >> special target-dependent fashion while emitting code for a function call
> > >> or return (usually, by putting it in a register as opposed to memory,
> > >> though some targets use it to distinguish between two different kinds of
> > >> registers). Use of this attribute is target-specific.
> >
> > As is tradition, instcombine is not checking+carrying over the
> > function argument attributes when replacing calls to memcmp w/ bcmp.
> >
> > Before:
> >   %4 = call i32 @memcmp(i8* inreg noundef %3, i8* inreg noundef %0,
> > i32 inreg noundef %1) #4, !dbg !22
> >
> > After:
> >   %bcmp = call i32 @bcmp(i8* %3, i8* %0, i32 %1), !dbg !22
> >
> > Filed:
> > https://github.com/llvm/llvm-project/issues/53645
> >
> > So I think the best course of action is to disable memcmp to bcmp
> > BEFORE the removal of -ffreestanding, and only for clang until we have
> > a fix in hand.
>
> What do you mean about BEFORE the removal of -ffreestanding? As in, add
> two patches, one to add -fno-builtin-bcmp and the next to remove
> -ffreestanding? i.e.:
>
>
> diff --git a/arch/x86/Makefile b/arch/x86/Makefile
> index e84cdd409b64..c92f69e916b4 100644
> --- a/arch/x86/Makefile
> +++ b/arch/x86/Makefile
> @@ -90,6 +90,9 @@ ifeq ($(CONFIG_X86_32),y)
>
>          # temporary until string.h is fixed
>          KBUILD_CFLAGS += -ffreestanding
> +        ifdef CONFIG_CC_IS_CLANG
> +                KBUILD_CFLAGS += -fno-builtin-bcmp
> +        endif
>
>         ifeq ($(CONFIG_STACKPROTECTOR),y)
>                 ifeq ($(CONFIG_SMP),y)
>
>
> then:
>
>
>
> diff --git a/arch/x86/Makefile b/arch/x86/Makefile
> index c92f69e916b4..f56936aeed9e 100644
> --- a/arch/x86/Makefile
> +++ b/arch/x86/Makefile
> @@ -88,8 +88,6 @@ ifeq ($(CONFIG_X86_32),y)
>          include $(srctree)/arch/x86/Makefile_32.cpu
>          KBUILD_CFLAGS += $(cflags-y)
>
> -        # temporary until string.h is fixed
> -        KBUILD_CFLAGS += -ffreestanding
>          ifdef CONFIG_CC_IS_CLANG
>                  KBUILD_CFLAGS += -fno-builtin-bcmp
>          endif
>
> ?

Yeah, that's what I had in mind yesterday afternoon. Thinking more
about this in the evening though, I think this is a pretty
catastrophic compiler bug in LLVM.

The compiler does change the calling convention (somewhat) as part of
optimizations when the caller and callee are visible within the same
TU. Here, the callee is not visible, and yet the caller is modifying
the calling convention with no corresponding change to the callee.

Essentially, -ffreestanding is holding -mregparam=3 together for
ARCH=i386 LLVM=1 builds.  That my above diff that only avoided the
issue for memcmp -> bcmp was able to boot to command line is kind of a
miracle.  I'm sure there's all kind of things that don't work right,
and we can't ship that since it will come back to bite us for 32b x86
(such as Android Cuttlefish).

Do we need to remove -ffreestanding for ARCH=i386 for FORTIFY_SOURCE
to work _for GCC_?

If yes, then perhaps we can only add -ffreestanding for clang for now?
If no, then perhaps we should leave -ffreestanding for now?

Either way, I would shelve FORTIFY_SOURCE for ARCH=i386 LLVM=1 until
this compiler bug is fixed (and drop my patch, or I can send a v2).
https://github.com/llvm/llvm-project/issues/53645

That said, I would consider this lower priority than
https://github.com/llvm/llvm-project/issues/53118, which looks like a
very obvious clang-14 regression (the 14 release is almost done, so
it's time to fix regression NOW) that produces an true positive
objtool warning.
--
Thanks,
~Nick Desaulniers


-- 
Thanks,
~Nick Desaulniers
