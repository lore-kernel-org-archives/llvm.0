Received: from conssluserg-04.nifty.com (conssluserg-04.nifty.com [210.131.2.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F0E612F
	for <llvm@lists.linux.dev>; Fri,  9 Sep 2022 21:03:25 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47]) (authenticated)
	by conssluserg-04.nifty.com with ESMTP id 289L3GVP031625
	for <llvm@lists.linux.dev>; Sat, 10 Sep 2022 06:03:17 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 289L3GVP031625
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1662757397;
	bh=jVyGgFwhONQTKwY4vzLjxp5xcaQ8QE9UcAG8sH6I1mg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=yZX4huWnZ2pHzQxFzbkYZp3zS76GKNTzrjJk1nvL9ro5fkRlCHfTEflLEPZN9UeQq
	 zsOYcV8yGyDzqCVjq2lfH+qJgpzbfLNnjzruwR66bRX5stR113QXvduvGEl7lAUzAO
	 yxnitlDVKrp2y+4HYqF9C+WaVoe4TO4mvY0MYIdq48BpUXNIQBlIe8PeyW20SayYqx
	 DfwvVJIQPZAUXlALO4YpjkjGgUtrPvNRvnncbbNsvWjcnMjFv9CIQmhnxP3XS0zeiv
	 U5ErV/QnBjG+EnebQD/HgkBfQFu+SzF3TYUBeCNeD7zPLjE3al/hBMkuDSM6aS6tAl
	 /cSwC7FmToZlA==
X-Nifty-SrcIP: [209.85.160.47]
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-12ab0eaa366so7041082fac.13
        for <llvm@lists.linux.dev>; Fri, 09 Sep 2022 14:03:17 -0700 (PDT)
X-Gm-Message-State: ACgBeo0dpi6tyFcoKMxHaHudY5O7rDJhfSNqMoVA+RkFonPlJr2cgvif
	Bt9bV7dEXwywbA0u/d60Ui/K3s6TdHBWUiox7J8=
X-Google-Smtp-Source: AA6agR7I10/0/EUMyBoRRVMgj3xe4/Zp3Xj5VntobUHrEDG9pQU8IoSncShphqhTPsMGWHDXwKDTvHf6mn4wOrGveA4=
X-Received: by 2002:a05:6870:f626:b0:10d:a798:f3aa with SMTP id
 ek38-20020a056870f62600b0010da798f3aamr5966177oab.194.1662757396077; Fri, 09
 Sep 2022 14:03:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220907045907.484043-1-ndesaulniers@google.com>
 <20220907045907.484043-6-ndesaulniers@google.com> <CAK7LNARhKobLF4Lw0dqSMqW0SPwmrV9HRas=4L8NoahKTeMCgQ@mail.gmail.com>
In-Reply-To: <CAK7LNARhKobLF4Lw0dqSMqW0SPwmrV9HRas=4L8NoahKTeMCgQ@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 10 Sep 2022 06:02:39 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT_cMLGLBz7ugaLpJD3QmZmY8FK56x9nihvWeYhJpi2ag@mail.gmail.com>
Message-ID: <CAK7LNAT_cMLGLBz7ugaLpJD3QmZmY8FK56x9nihvWeYhJpi2ag@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] Makefile.debug: set -g unconditional on CONFIG_DEBUG_INFO_SPLIT
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <llvm@lists.linux.dev>, X86 ML <x86@kernel.org>,
        Dmitrii Bundin <dmitrii.bundin.a@gmail.com>,
        Fangrui Song <maskray@google.com>,
        Alexey Alexandrov <aalexand@google.com>,
        Bill Wendling <morbo@google.com>, Greg Thelen <gthelen@google.com>,
        Andi Kleen <ak@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, Sep 10, 2022 at 5:56 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Wed, Sep 7, 2022 at 1:59 PM Nick Desaulniers <ndesaulniers@google.com> wrote:
> >
> > Dmitrii, Fangrui, and Mashahiro note:
> >
> >   Before GCC 11 and Clang 12 -gsplit-dwarf implicitly uses -g2.
> >
> > Fix CONFIG_DEBUG_INFO_SPLIT for gcc-11+ & clang-12+ which now need -g
> > specified in order for -gsplit-dwarf to work at all.
> >
> > -gsplit-dwarf has been mutually exclusive with -g since support for
> > CONFIG_DEBUG_INFO_SPLIT was introduced in
> > commit 866ced950bcd ("kbuild: Support split debug info v4")
> > I don't think it ever needed to be.
> >
> > Link: https://lore.kernel.org/lkml/20220815013317.26121-1-dmitrii.bundin.a@gmail.com/
> > Link: https://lore.kernel.org/lkml/CAK7LNARPAmsJD5XKAw7m_X2g7Fi-CAAsWDQiP7+ANBjkg7R7ng@mail.gmail.com/
> > Link: https://reviews.llvm.org/D80391
> > Cc: Andi Kleen <ak@linux.intel.com>
> > Reported-by: Dmitrii Bundin <dmitrii.bundin.a@gmail.com>
> > Reported-by: Fangrui Song <maskray@google.com>
> > Reported-by: Masahiro Yamada <masahiroy@kernel.org>
> > Suggested-by: Dmitrii Bundin <dmitrii.bundin.a@gmail.com>
> > Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > ---
> > Changes v2 -> v3:
> > * Pick up Nathan's RB tag.
> >
> > Changes v1 -> v2:
> > * Add reference to 866ced950bcd, cc Andi, in commit message.
> >
> >  scripts/Makefile.debug | 10 +++-------
> >  1 file changed, 3 insertions(+), 7 deletions(-)
> >
> > diff --git a/scripts/Makefile.debug b/scripts/Makefile.debug
> > index 2845145c1220..c20f8f2e76bf 100644
> > --- a/scripts/Makefile.debug
> > +++ b/scripts/Makefile.debug
> > @@ -1,10 +1,4 @@
> > -DEBUG_CFLAGS   :=
> > -
> > -ifdef CONFIG_DEBUG_INFO_SPLIT
> > -DEBUG_CFLAGS   += -gsplit-dwarf
> > -else
> > -debug-cflags-y += -g
> > -endif
> > +DEBUG_CFLAGS   := -g
> >
> >  debug-flags-$(CONFIG_DEBUG_INFO_DWARF4)        += -gdwarf-4
> >  debug-flags-$(CONFIG_DEBUG_INFO_DWARF5)        += -gdwarf-5
> > @@ -15,6 +9,8 @@ ifeq ($(CONFIG_CC_IS_CLANG)$(CONFIG_AS_IS_GNU),yy)
> >  KBUILD_AFLAGS  += $(addprefix -Wa$(comma), $(debug-flags-y))
> >  endif
> >
> > +debug-flags-$(CONFIG_DEBUG_INFO_SPLIT) += -gsplit-dwarf
> > +
>
>
> This patch changes the behavior that is not mentioned in the commit log.
>
>
>
>
> Previously, -gsplit-dwarf was passed only when compiling *.c files.
> (DEBUG_CFLAGS).
>
> Now it is passed also when compiling *.S files.
> (debug-flags-y is appended to KBUILD_AFLAGS)
>
>
> Please confirm if this makes sense, and if so,
> please mention it in the commit log.
>
>
>
> As far as I tested, I did not see this change was useful.
>
> When *.S is compiled to *.o, *.dwo is also created,
> but it does not contain any debug info.
>
>
>
> >  ifdef CONFIG_DEBUG_INFO_REDUCED
> >  DEBUG_CFLAGS   += -fno-var-tracking
> >  ifdef CONFIG_CC_IS_GCC
> > --
> > 2.37.2.789.g6183377224-goog
> >
>
>
> --
> Best Regards
> Masahiro Yamada


BTW, you do not need to resend the entire series
even if you end up with v4.


 - 01-02
 - 03
 - 04-05

are mutually independent of the others now.

They can be reviewed separately.


--
Best Regards
Masahiro Yamada
