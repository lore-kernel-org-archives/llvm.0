Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702D272
	for <llvm@lists.linux.dev>; Wed, 29 Sep 2021 19:14:50 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id b15so14890064lfe.7
        for <llvm@lists.linux.dev>; Wed, 29 Sep 2021 12:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mDIHNqxX9Fp8iiFTAvj5TgT5mn2InH9rtjbNe9JUOVc=;
        b=bKY7C5IcjqavnCqVxihn9nHiGkMGiMtGwrm2kfRvll1oMIo+bT1kqscky7Sw5FKxxf
         RSow5PD50qjDN6jxSzc1V9RCYDNAbELzzGkgDl3sH8rQFMTb5NfhosDA2hcTPkBiEs9d
         lLZ/B0d3BrL5la+7B9iIiXuzwUj1vcevZp+I+EJl6Y+VTzqOeVv5LjJ4c1BFHGOZVEB7
         9F1m5Sc/s8dSx7z41gdKWS1zydSpd8E9QrlJKUAuRA/xZ2vomuBMSI+dN701Fne3hvfR
         Y+Vyuj1JbJ9uao+pkT+EOybZ4ML6dsYpWx6SJi9zRuLxftvJmf5oDFl5QXBoINPuFlJM
         iXBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mDIHNqxX9Fp8iiFTAvj5TgT5mn2InH9rtjbNe9JUOVc=;
        b=4rqrdG5cFlDpnEtrnD21Ys8nPYllJ4tqeuyoQ72bUORQHtIghKnMQNUKul2D2quz/5
         Q4plvHHVbZHTLeNloMcEw2DYWbyIFnYTzWL8lJ+D9vWIrzKYkeZufmptwtUWdt/I8Qz4
         PLu/+tC7V8cNE+WJVnADVeGMLIx49lGD1FbKMw+0kceun/KWmG9y/0cpRP9C4Bz7pzaB
         Y8UqLMLg3s0Hy1fQQAgjwB3Uz1hUxcda/q7IslIrJ1SyWX0QPoQgnPT68OrBzrOIUDqM
         KZMAis40XmKcHKxtqQHjXF4h0IswMEtyzYdhIbp0Drrcm0Zk0AyVx0wwIZr0SQFvL57q
         4+vw==
X-Gm-Message-State: AOAM533lI4bofqfwhIE4b+7eJmQUVDHuaBteIDTUzIOrUxdLSNAERiWk
	yMMEtUWLAbt5GH2V0FbhYqiwbSm+OSHGc6qm1haZtw==
X-Google-Smtp-Source: ABdhPJwUC21w9EPT7MxbyN//j9rdIOl3NsSsHXixRJqVJs9/TftB+fMW8zXEGAuzgGk7MPUx34BuO6hryBxkrerd1Uo=
X-Received: by 2002:a2e:461a:: with SMTP id t26mr1653883lja.198.1632942888274;
 Wed, 29 Sep 2021 12:14:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210929190810.1597399-1-ndesaulniers@google.com> <CAKwvOd=v+1H4CrDDFENGiUx=9-Q3ieMsA9P7G270pSpW1jC-Yw@mail.gmail.com>
In-Reply-To: <CAKwvOd=v+1H4CrDDFENGiUx=9-Q3ieMsA9P7G270pSpW1jC-Yw@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 29 Sep 2021 12:14:36 -0700
Message-ID: <CAKwvOdmjZ+QmjTJnQ-w5hLPJjow1gYnWTe6f8RBhQUJ2b3cYnw@mail.gmail.com>
Subject: Re: [PATCH] ARM: mm: proc-macros: ensure *_tlb_fns are 4B aligned
To: linux-arm-kernel@lists.infradead.org
Cc: Fangrui Song <maskray@google.com>, Peter Smith <Peter.Smith@arm.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Linus Walleij <linus.walleij@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Mike Rapoport <rppt@kernel.org>, 
	YiFei Zhu <yifeifz2@illinois.edu>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Nicolas Pitre <nico@fluxnic.net>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Dave Martin <dave.martin@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 29, 2021 at 12:10 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> + Dave (Dave, I got a bounceback on your linaro.org email address.
> Consider sending a patch updating the .mailmap)
>
> On Wed, Sep 29, 2021 at 12:08 PM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > QEMU 6.1.0 is more correct about trapping on misaligned accesses. A
> > kernel built with CONFIG_THUMB2_KERNEL=y and using clang as the
> > assembler could generate non-naturally-aligned v7wbi_tlb_fns which
> > results in a boot failure. The original commit adding the macro missed
> > the .align directive on this data.
> >
> > Fixes: 66a625a88174 ("ARM: mm: proc-macros: Add generic proc/cache/tlb struct definition macros")
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1447
> > Link: https://lore.kernel.org/all/0699da7b-354f-aecc-a62f-e25693209af4@linaro.org/
> > Debugged-by: Ard Biesheuvel <ardb@kernel.org>
> > Debugged-by: Nathan Chancellor <nathan@kernel.org>
> > Debugged-by: Richard Henderson <richard.henderson@linaro.org>
> > Suggested-by: Ard Biesheuvel <ardb@kernel.org>
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > ---
> >  arch/arm/Kconfig          | 1 +

d'oh, had an unintentional `-a` when I did `git commit`. Will resend a v2...

> >  arch/arm/mm/proc-macros.S | 1 +
> >  2 files changed, 2 insertions(+)
> >
> > diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> > index fc196421b2ce..b760dd45b734 100644
> > --- a/arch/arm/Kconfig
> > +++ b/arch/arm/Kconfig
> > @@ -92,6 +92,7 @@ config ARM
> >         select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
> >         select HAVE_FUNCTION_GRAPH_TRACER if !THUMB2_KERNEL && !CC_IS_CLANG
> >         select HAVE_FUNCTION_TRACER if !XIP_KERNEL
> > +       select HAVE_FUTEX_CMPXCHG if FUTEX
> >         select HAVE_GCC_PLUGINS
> >         select HAVE_HW_BREAKPOINT if PERF_EVENTS && (CPU_V6 || CPU_V6K || CPU_V7)
> >         select HAVE_IRQ_TIME_ACCOUNTING
> > diff --git a/arch/arm/mm/proc-macros.S b/arch/arm/mm/proc-macros.S
> > index e2c743aa2eb2..d9f7dfe2a7ed 100644
> > --- a/arch/arm/mm/proc-macros.S
> > +++ b/arch/arm/mm/proc-macros.S
> > @@ -340,6 +340,7 @@ ENTRY(\name\()_cache_fns)
> >
> >  .macro define_tlb_functions name:req, flags_up:req, flags_smp
> >         .type   \name\()_tlb_fns, #object
> > +       .align 2
> >  ENTRY(\name\()_tlb_fns)
> >         .long   \name\()_flush_user_tlb_range
> >         .long   \name\()_flush_kern_tlb_range
> > --
> > 2.33.0.685.g46640cef36-goog
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers



-- 
Thanks,
~Nick Desaulniers
