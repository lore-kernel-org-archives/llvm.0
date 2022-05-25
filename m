Received: from conssluserg-05.nifty.com (conssluserg-05.nifty.com [210.131.2.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749317C
	for <llvm@lists.linux.dev>; Wed, 25 May 2022 10:52:49 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51]) (authenticated)
	by conssluserg-05.nifty.com with ESMTP id 24PAqdsI011487
	for <llvm@lists.linux.dev>; Wed, 25 May 2022 19:52:40 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 24PAqdsI011487
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1653475960;
	bh=MtfOTBQmTIo5gTOtbY0pPCrvlLY0X0Y8Np1AC0lw+eQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ANejoCLa+JDY7f/QB+aEMkxCqqDRpGJEjfMrNqahapNxAEVC0xF1w5CQsnCL2lS2O
	 1gX3hq/+f+XudCW1fgQzPL47JwdLvbzHvhyX8mJKCHPF2mSwe3Vq0ISv4YiyHKIZIv
	 leBsblGAqcve8Hkc8vS7kamj6WfzeqTIBXvVYMjZHFlpDXO9x9fRxV3FvCfHIzmkm6
	 6ekMWG561FH5H/cIwmvT1IwvSn3PoF5YGsB2EnjObBC+V2xQ8C9PtYbYqcWCEuUTXe
	 FtvL3ESR85ykxh7vzqD+dtq/iEIgS9wLg2QKTL+7ak7YPZEvhuxVk9D9iBFuLCSERp
	 vapW+WHt4GTdA==
X-Nifty-SrcIP: [209.85.216.51]
Received: by mail-pj1-f51.google.com with SMTP id w2-20020a17090ac98200b001e0519fe5a8so4684599pjt.4
        for <llvm@lists.linux.dev>; Wed, 25 May 2022 03:52:40 -0700 (PDT)
X-Gm-Message-State: AOAM532c63ULw3hxL0CHQXmt3UH6lRxapCzVd0M6/00M/KT4WXlVLhDy
	vsOPNwsTnX1fWadRm04huaZjhH0qooeNtleKhVA=
X-Google-Smtp-Source: ABdhPJwTb+MeL125OS2dBICYlt3qN+vGKJTfy+DMPZOd5L6Xfe4wzuDX6+FP55+i15sov9sLfellQ9730AqgGSrqPB0=
X-Received: by 2002:a17:90a:e004:b0:1e0:7a66:fb3a with SMTP id
 u4-20020a17090ae00400b001e07a66fb3amr7988416pjy.119.1653475959363; Wed, 25
 May 2022 03:52:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220513113930.10488-1-masahiroy@kernel.org> <20220513113930.10488-7-masahiroy@kernel.org>
 <20220525083142.GA1952409@roeck-us.net>
In-Reply-To: <20220525083142.GA1952409@roeck-us.net>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 25 May 2022 19:51:17 +0900
X-Gmail-Original-Message-ID: <CAK7LNATifx2c877yEX5VkTQ5h7_7iSnTB0nkR5i98PEBHb=DuQ@mail.gmail.com>
Message-ID: <CAK7LNATifx2c877yEX5VkTQ5h7_7iSnTB0nkR5i98PEBHb=DuQ@mail.gmail.com>
Subject: Re: [PATCH v6 06/10] kbuild: check static EXPORT_SYMBOL* by script
 instead of modpost
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-modules <linux-modules@vger.kernel.org>,
        clang-built-linux <llvm@lists.linux.dev>,
        Ard Biesheuvel <ardb@kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 25, 2022 at 5:31 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Fri, May 13, 2022 at 08:39:26PM +0900, Masahiro Yamada wrote:
> > The 'static' specifier and EXPORT_SYMBOL() are an odd combination.
> >
> > Commit 15bfc2348d54 ("modpost: check for static EXPORT_SYMBOL*
> > functions") tried to detect it, but this check has false negatives.
> >
> > Here is the sample code.
> >
> >   Makefile:
> >
> >     obj-y += foo1.o foo2.o
> >
> >   foo1.c:
> >
> >     #include <linux/export.h>
> >     static void foo(void) {}
> >     EXPORT_SYMBOL(foo);
> >
> >   foo2.c:
> >
> >     void foo(void) {}
> >
> > foo1.c exports the static symbol 'foo', but modpost cannot catch it
> > because it is fooled by foo2.c, which has a global symbol with the
> > same name.
> >
> > s->is_static is cleared if a global symbol with the same name is found
> > somewhere, but EXPORT_SYMBOL() and the global symbol do not necessarily
> > belong to the same compilation unit.
> >
> > This check should be done per compilation unit, but I do not know how
> > to do it in modpost. modpost runs against vmlinux.o or modules, which
> > merges multiple objects, then forgets their origin.
> >
> > It is true modpost gets access to the lists of all the member objects
> > (.vmlinux.objs and *.mod), but modpost cannot parse individual objects
> > because they may not be ELF but LLVM IR when CONFIG_LTO_CLANG=y.
> >
> > Add a simple bash script to parse the output from ${NM}. This works for
> > CONFIG_LTO_CLANG=y because llvm-nm can dump symbols of LLVM IR files.
> >
>
> On parisc builds, this patch results in:
>
> Building parisc:allnoconfig ... failed
> --------------
> Error log:
> scripts/check-local-export: sh /opt/buildbot/slave/next-next/build/arch/parisc/nm failed
>
> Guenter

Thanks for the report.

parisc overrides NM:

NM              = sh $(srctree)/arch/parisc/nm


I will fix the script to return the correct exit code.



-- 
Best Regards
Masahiro Yamada
