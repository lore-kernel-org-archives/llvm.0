Received: from condef-09.nifty.com (condef-09.nifty.com [202.248.20.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7DB4699
	for <llvm@lists.linux.dev>; Sun, 28 Aug 2022 17:26:45 +0000 (UTC)
Received: from conssluserg-05.nifty.com ([10.126.8.84])by condef-09.nifty.com with ESMTP id 27SHLoaf031375
	for <llvm@lists.linux.dev>; Mon, 29 Aug 2022 02:21:50 +0900
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44]) (authenticated)
	by conssluserg-05.nifty.com with ESMTP id 27SHLMu6030478
	for <llvm@lists.linux.dev>; Mon, 29 Aug 2022 02:21:22 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 27SHLMu6030478
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1661707283;
	bh=/wxBK7m8lAXZFpL9USnpvkitak2d1egNjzQJgsP+0AI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nF0fZbOjdn6s7I5wZJo6mjT43EuIf/CCthIsgwiVAePFc7gqW8ZvMXhJIr7GqnR9z
	 c3PZBwjmMGjoIshkb1xoI/rVTDv9j0isAYCYLnccK4k/19Xr5p5YZCAFQFzeqyeK0B
	 nywh6tGVayn+jv4zBpcj0+qmtKjfGPmw2OvFXBJfO5K2iZJLkV25TdjGvVeUzN12iC
	 vAnyE741BQeWM8gvHWn62yTtZZzX4y9h10MlAf257TElmSbOpl+lIMRIblhNrZRlCA
	 DniJxpGs98UjvqXiQZy2/zC1HW/tEHtdupNQ46ZB/rkDqNMwcVgiVHOVAc2dCIBIsr
	 ClA9ABUL4EDqw==
X-Nifty-SrcIP: [209.85.210.44]
Received: by mail-ot1-f44.google.com with SMTP id t11-20020a05683014cb00b0063734a2a786so4470790otq.11
        for <llvm@lists.linux.dev>; Sun, 28 Aug 2022 10:21:22 -0700 (PDT)
X-Gm-Message-State: ACgBeo2CZ3sKL4rtvds85JZEEMSUb5kcdTnLlr8HBATlKkeR/u83C670
	4ZbBp/JsVi2f5ttJk50OAKAcZ9gUFT/K2M9J0IU=
X-Google-Smtp-Source: AA6agR68BX+UgxMBvfbvnw8JIecIq4RkerD74kWTFUvD19k9KrVWyW402aX0SzT1wD2UifkGw8qhmHOws4cncnOU4uk=
X-Received: by 2002:a05:6830:2985:b0:61c:c1bb:206a with SMTP id
 t5-20020a056830298500b0061cc1bb206amr5061631otu.343.1661707281453; Sun, 28
 Aug 2022 10:21:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220826181035.859042-1-ndesaulniers@google.com>
 <20220826181035.859042-2-ndesaulniers@google.com> <YwkPNyHvxR2dM+CQ@dev-arch.thelio-3990X>
 <CAKwvOdmR8D_GTM=ZhnhLzR3d9Ra46WpcO1W_CujGjMb+QR-_3w@mail.gmail.com>
In-Reply-To: <CAKwvOdmR8D_GTM=ZhnhLzR3d9Ra46WpcO1W_CujGjMb+QR-_3w@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 29 Aug 2022 02:20:45 +0900
X-Gmail-Original-Message-ID: <CAK7LNATcHt7GcXZ=jMszyH=+M_LC9Qr6yeAGRCBbE6xriLxtUQ@mail.gmail.com>
Message-ID: <CAK7LNATcHt7GcXZ=jMszyH=+M_LC9Qr6yeAGRCBbE6xriLxtUQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] Makefile.compiler: s/KBUILD_CFLAGS/KBUILD_AFLAGS/ for as-option
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>, Tom Rix <trix@redhat.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <llvm@lists.linux.dev>, X86 ML <x86@kernel.org>,
        Dmitrii Bundin <dmitrii.bundin.a@gmail.com>,
        Fangrui Song <maskray@google.com>,
        Alexey Alexandrov <aalexand@google.com>,
        Bill Wendling <morbo@google.com>, Greg Thelen <gthelen@google.com>,
        Arvind Sankar <nivedita@alum.mit.edu>
Content-Type: text/plain; charset="UTF-8"

On Sat, Aug 27, 2022 at 3:35 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Fri, Aug 26, 2022 at 11:21 AM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > Hi Nick,
> >
> > I think the title would be a little more readable if it was:
> >
> > Makefile.compiler: Use KBUILD_AFLAGS for as-option
>
> Thanks, yeah that looks better; I expect a v2 of this series will be necessary.
>
> >
> > On Fri, Aug 26, 2022 at 11:10:33AM -0700, Nick Desaulniers wrote:
> > > as-instr uses KBUILD_AFLAGS, but as-option uses KBUILD_CFLAGS.  This can
> > > cause as-option to fail unexpectedly because clang will emit
> > > -Werror,-Wunused-command-line-argument for various -m and -f flags for
> > > assembler sources.
> > >
> > > Callers of as-option (and as-instr) likely want to be adding flags to
> > > KBUILD_AFLAGS/aflags-y, not KBUILD_CFLAGS/cflags-y.

Indeed, it has been weird since the day-1 of as-option.

commit cad8244840d1a148f638925758afd1cdf81fc839
Author: Paul Mundt <lethal@linux-sh.org>
Date:   Mon Jan 16 22:14:19 2006 -0800

    [PATCH] sh: Move CPU subtype configuration to its own Kconfig








> > >
> > > Link: https://github.com/ClangBuiltLinux/linux/issues/1699
> > > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > > ---
> > >  arch/x86/boot/compressed/Makefile | 5 +++--
> > >  scripts/Makefile.compiler         | 6 +++---
> > >  2 files changed, 6 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
> > > index 35ce1a64068b..fb3db714a028 100644
> > > --- a/arch/x86/boot/compressed/Makefile
> > > +++ b/arch/x86/boot/compressed/Makefile
> > > @@ -48,8 +48,6 @@ KBUILD_CFLAGS += -Wno-pointer-sign
> > >  KBUILD_CFLAGS += $(call cc-option,-fmacro-prefix-map=$(srctree)/=)
> > >  KBUILD_CFLAGS += -fno-asynchronous-unwind-tables
> > >  KBUILD_CFLAGS += -D__DISABLE_EXPORTS
> > > -# Disable relocation relaxation in case the link is not PIE.
> > > -KBUILD_CFLAGS += $(call as-option,-Wa$(comma)-mrelax-relocations=no)
> > >  KBUILD_CFLAGS += -include $(srctree)/include/linux/hidden.h
> > >
> > >  # sev.c indirectly inludes inat-table.h which is generated during
> > > @@ -58,6 +56,9 @@ KBUILD_CFLAGS += -include $(srctree)/include/linux/hidden.h
> > >  CFLAGS_sev.o += -I$(objtree)/arch/x86/lib/
> > >
> > >  KBUILD_AFLAGS  := $(KBUILD_CFLAGS) -D__ASSEMBLY__
> > > +# Disable relocation relaxation in case the link is not PIE.
> > > +KBUILD_AFLAGS += $(call as-option,-Wa$(comma)-mrelax-relocations=no)
> > > +
> >
> > Commit 09e43968db40 ("x86/boot/compressed: Disable relocation
> > relaxation") added this to address
> > https://github.com/ClangBuiltLinux/linux/issues/1121, is it correct to
> > move it to only being used for the .S files in arch/x86/boot/compressed?

Good catch!


>
> + Arvind
>
> Hmm...that makes me think we might need two different as-option flags;
> one that does use KBUILD_CFLAGS, and whose result is meant to be added
> to cflags-y, then another that uses KBUILD_AFLAGS and is added to
> aflagsy-y.
>
> (My patch 2/3 in the series would use the latter)
>
> Let's see what thoughts Masahiro has.


How about this?

KBUILD_CFLAGS += $(call as-option,-Wa$(comma)-mrelax-relocations=no)

    to

KBUILD_CFLAGS += $(call cc-option,-Wa$(comma)-mrelax-relocations=no)


You can insert this one-liner before this patch.




In Kconfig, -Wa,<as-option> is tested by cc-option.
(See commit 4d0831e8a029c03f49f434f28b8faef9f0bd403f)





--
Best Regards
Masahiro Yamada
