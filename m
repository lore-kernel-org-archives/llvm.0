Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA3E4C74
	for <llvm@lists.linux.dev>; Fri, 26 Aug 2022 19:52:17 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id p5so143461lfc.6
        for <llvm@lists.linux.dev>; Fri, 26 Aug 2022 12:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=mvyJ+Tn0W7GOVforLC2vhB6VbcqK7WY1nq8zsz0n0LY=;
        b=acyPP/v/CPMGXSHhKa6MmW/eKD8bHJzOuWacVrMhTJmj4IkKzCwNRO9R8tMvzL6J1o
         pcUi0HEh2C0dSBDXnN3ZkbaoXawDbZsSpZeUmqDQj9TDjEFH51zrMiDSY743SUfMOnkC
         EIEScB5exyDkMVx63RdbRWnZ1yRDk7+Q6NobjScH9upNrPCDNmUQMQobtxLsJmZ2fZAV
         GHNfqsAPcUcoUC6mnjno57aB33NnlvPllmG8loT9D/ejrXI8hIUSoqfpaMd74Joz85x8
         VRUKXpLFgX0Tki+RZm66Qwbd23TQH/+WWD+eCir4By3Puj/syOCumQmpJKcnPH3WkjVs
         c0oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=mvyJ+Tn0W7GOVforLC2vhB6VbcqK7WY1nq8zsz0n0LY=;
        b=CfvlXndyf9kNHRRucMBILKpLeV4qOTqYNtasjA1+SF1dHkD0zAIxopjz1BC6R9UPVS
         lju+Jd0a3Owyl+Ct/l7Klfee4ISwBFJ35zL1bnOOiP7VW3/V0T0GpcuBHHPVshFyJNNU
         ay9UVvzWHZB/OwPP+AfOd9i/9NdlV7uF/TdeukKhc98v+rjjMrEt/rTWU6OWE1gfcBDq
         mfmuXPXNJoc9hXaFBQCXdfwE+F84vZY4m41Qupbe44RDJmP7obxi27jNxmeGAwjIqhiq
         LLnamFK3lEjSsT2nMraXGke/rRNrQC7tLomUpU3VxRmkCRcXTYYnMNQNRQ2xwpNdNf7f
         nqSA==
X-Gm-Message-State: ACgBeo2S83Mjc769MVnzyK4bSzzSUTjBzQeFXwI0+9M2p6ovac44TaZw
	wthQaCTsbACO9afgyd3vHFAStX5KOwr0YyYWuqdFaw==
X-Google-Smtp-Source: AA6agR7J5J9WO3vFUXX3Xvuw9h7ybz8Uve3m5bhR9VCxiCybF8zHic6IcjhVGvCazKPZQqOXidsCQ5VZ1DIygR3J95c=
X-Received: by 2002:ac2:4f03:0:b0:48a:6061:bd8e with SMTP id
 k3-20020ac24f03000000b0048a6061bd8emr3308421lfr.647.1661543535378; Fri, 26
 Aug 2022 12:52:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220826181035.859042-1-ndesaulniers@google.com>
 <20220826181035.859042-3-ndesaulniers@google.com> <CAGG=3QWSAUakO42kubrCap8fp-gm1ERJJAYXTnP1iHk_wrH=BQ@mail.gmail.com>
In-Reply-To: <CAGG=3QWSAUakO42kubrCap8fp-gm1ERJJAYXTnP1iHk_wrH=BQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 26 Aug 2022 12:52:04 -0700
Message-ID: <CAKwvOdnPjYNFy3r01TBohrZbRGFafGuWaPa8u6b2JdgH=0tKKg@mail.gmail.com>
Subject: Re: [PATCH 2/3] Makefile.debug: re-enable debug info for .S files
To: Bill Wendling <morbo@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, 
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, Dmitrii Bundin <dmitrii.bundin.a@gmail.com>, 
	Fangrui Song <maskray@google.com>, Alexey Alexandrov <aalexand@google.com>, 
	Greg Thelen <gthelen@google.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 26, 2022 at 11:41 AM Bill Wendling <morbo@google.com> wrote:
>
> On Fri, Aug 26, 2022 at 11:10 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > Alexey reported that the fraction of unknown filename instances in
> > kallsyms grew from ~0.3% to ~10% recently; Bill and Greg tracked it down
> > to assembler defined symbols, which regressed as a result of:
> >
> > commit b8a9092330da ("Kbuild: do not emit debug info for assembly with LLVM_IAS=1")
> >
> > In that commit, I allude to restoring debug info for assembler defined
> > symbols in a follow up patch, but it seems I forgot to do so in
> >
> > commit a66049e2cf0e ("Kbuild: make DWARF version a choice")
> >
> > This patch does a few things:
> > 1. Add -g to KBUILD_AFLAGS. This will instruct the compiler to instruct
> >    the assembler to emit debug info. But this can cause an issue for
> >    folks using a newer compiler but older assembler, because the
> >    implicit default DWARF version changed from v4 to v5 in gcc-11 and
> >    clang-14.
> > 2. If the user is using CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT, use a
> >    version check to explicitly set -Wa,-gdwarf-<version> for the
> >    assembler. There's another problem with this; GAS only gained support
> >    for explicit DWARF versions 3-5 in the 2.36 GNU binutils release.
> > 3. Wrap -Wa,-gdwarf-<version> in as-option call to test whether the
> >    assembler supports that explicit DWARF version.
> >
> > Link: https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=31bf18645d98b4d3d7357353be840e320649a67d
> > Fixes: b8a9092330da ("Kbuild: do not emit debug info for assembly with LLVM_IAS=1")
> > Reported-by: Alexey Alexandrov <aalexand@google.com>
> > Reported-by: Bill Wendling <morbo@google.com>
> > Reported-by: Greg Thelen <gthelen@google.com>
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > ---
> >  scripts/Makefile.debug | 22 ++++++++++++++++++----
> >  1 file changed, 18 insertions(+), 4 deletions(-)
> >
> > diff --git a/scripts/Makefile.debug b/scripts/Makefile.debug
> > index 9f39b0130551..a7a6da7f6e7d 100644
> > --- a/scripts/Makefile.debug
> > +++ b/scripts/Makefile.debug
> > @@ -4,18 +4,32 @@ ifdef CONFIG_DEBUG_INFO_SPLIT
> >  DEBUG_CFLAGS   += -gsplit-dwarf
> >  else
> >  DEBUG_CFLAGS   += -g
> > +KBUILD_AFLAGS  += -g
> >  endif
> >
> > -ifndef CONFIG_AS_IS_LLVM
> > -KBUILD_AFLAGS  += -Wa,-gdwarf-2
> > +ifdef CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
> > +# gcc-11+, clang-14+
> > +ifeq ($(shell [ $(CONFIG_GCC_VERSION) -ge 110000 -o $(CONFIG_CLANG_VERSION) -ge 140000 ] && echo y),y)
>
> Do you think this would be better as a macro? Maybe something like:
>
> if $(call cc-min-version,110000,140000)
>
> where the first argument is GCC's min version and second Clang's min
> version. It would be more readable and reusable.

Yeah!

I was looking at cc-ifversion, which has a bug in that it specifically
uses CONFIG_GCC_VERSION.  I think I sent a series maybe a year or two
ago trying to remove all users of that macro; I think most landed but
not all and I never pursued it to completion.  Also, I think there's
one user remaining in the AMDGPU drivers; looks like they're been
reducing their dependency on that SIMD hack I wrote for them years ago
after propagating it to parts of their tree, but one user remains.
Perhaps I can just open code it there, or replace it with something
new like you suggest.

Such a macro would need to consider whether CC_IS_GCC vs CC_IS_CLANG;
I could imagine we might need a version check for both, or just one of
the two compilers.

Ugh, logical OR in GNU make is supported by use of the filter macro...yuck.

ifneq ($(filter y, $(call gcc-min-version, 110000), $(call
clang-min-version, 140000),)
# add gcc-11+, clang-14+ flag
endif

or maybe as you suggest:

ifneq ($(call cc-min-version,110000,140000),)
# add gcc-11+, clang-14+ flag
endif

where the newly minted cc-min-version is implemented in terms of the
newly minted gcc-min-version and clang-min-version.  Then I can use
cc-min-version in this series, and replace cc-ifversion in AMDGPU with
gcc-min-version.  That way, we create composable wrappers that are
readable and reusable.

>
> -bw
>
> > +dwarf-version-y := 5
> > +else
> > +dwarf-version-y := 4
> >  endif
> > -
> > -ifndef CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
> > +else # !CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
> >  dwarf-version-$(CONFIG_DEBUG_INFO_DWARF4) := 4
> >  dwarf-version-$(CONFIG_DEBUG_INFO_DWARF5) := 5
> >  DEBUG_CFLAGS   += -gdwarf-$(dwarf-version-y)
> >  endif
> >
> > +# Binutils 2.35+ (or clang) required for -gdwarf-{4|5}.
> > +# https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=31bf18645d98b4d3d7357353be840e320649a67d
> > +ifneq ($(call as-option,-Wa$(comma)-gdwarf-$(dwarf-version-y)),)
> > +KBUILD_AFLAGS  += -Wa,-gdwarf-$(dwarf-version-y)
> > +else
> > +ifndef CONFIG_AS_IS_LLVM
> > +KBUILD_AFLAGS  += -Wa,-gdwarf-2
> > +endif
> > +endif
> > +
> >  ifdef CONFIG_DEBUG_INFO_REDUCED
> >  DEBUG_CFLAGS   += -fno-var-tracking
> >  ifdef CONFIG_CC_IS_GCC
> > --
> > 2.37.2.672.g94769d06f0-goog
> >



-- 
Thanks,
~Nick Desaulniers
