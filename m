Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0744772
	for <llvm@lists.linux.dev>; Wed, 29 Sep 2021 19:11:02 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id i4so15148130lfv.4
        for <llvm@lists.linux.dev>; Wed, 29 Sep 2021 12:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+X1e0IkE1xycXJllhY8KH7nR5VMuinY4y1av7l1HO2E=;
        b=A6vTFI4GI0ABykrmrvQxmVnV6LIcD2XbocmDVJPyqJqCCkhdVhgtV4RJpw5TUR6q7R
         ta4T11QBaFri6MrJzm/8mYHvcn+MSX8cNpzWJb3eGJ0GtAc1ZFDAOgk00ROI3AXZQ0Bz
         CRC9H5HNAeU4DtNL9R5ovr04qSAFh1kkBid0QPFf7vJz/m7oICWEx5OAxWhMc4HNWJ83
         F7TfeMsEii0xY+t2PYhJcBBuv16Y8LWfbevubhHQ9pZ6bJIf31AVg4cqm/KVenTMdkB9
         fn1DvLrGKBj2ntmJjjvY2EjrOlGeGjWe3v5uywCxa90OAtOduI3cCbjwHhFkhZMZhij5
         hmWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+X1e0IkE1xycXJllhY8KH7nR5VMuinY4y1av7l1HO2E=;
        b=dfsBLX6ymkxlpgtLwL/dCTlawaSQT/m4wfbB7LmFzEb8ALtdX5UoM+FG5a+TV5aXPH
         iZw1ORXcLHC3T+wdSIhirv+JqseoNN22KZJbAZSedd6cXJPPU7lHlstwpJUQ1njzDXel
         8t96kbO6Mx1ZBXNCsKsO++JI+ng/zTmryBAIK5QMIDuN5JWxoMllEyjIgZPU8a5zXUkk
         D0pKl3aEFcZHbmOsBHY7uNVPdzYbHMbRoxQFnlJKpapF4ZZZ9uTWMZYPKnn4iBMqASwy
         vAfTdagVePl0QSp5wNet/0O7wxLC2KGsMp4HR4MMYCIx4gYY3Q6zGlDJt/NdvfoPgQOE
         AKNg==
X-Gm-Message-State: AOAM533YWnzJQR/Vjv3/hOij/KgI1eFQC9cNE7IBJlmtj13ZsXwhHLFX
	CKBZ0HhZepeYS8SKCYDDC8R+SIdaQVuWruB6zs/70A==
X-Google-Smtp-Source: ABdhPJxlhvutNtxglq5AM66fAlkeMwumou7oMgak1HMc9PDnF6UJ0qPx3zipOdVHjdoRpOCOwVUaiI/TZ+we3UwGbEI=
X-Received: by 2002:a05:6512:110a:: with SMTP id l10mr1328642lfg.550.1632942660850;
 Wed, 29 Sep 2021 12:11:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210929190810.1597399-1-ndesaulniers@google.com>
In-Reply-To: <20210929190810.1597399-1-ndesaulniers@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 29 Sep 2021 12:10:49 -0700
Message-ID: <CAKwvOd=v+1H4CrDDFENGiUx=9-Q3ieMsA9P7G270pSpW1jC-Yw@mail.gmail.com>
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

+ Dave (Dave, I got a bounceback on your linaro.org email address.
Consider sending a patch updating the .mailmap)

On Wed, Sep 29, 2021 at 12:08 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> QEMU 6.1.0 is more correct about trapping on misaligned accesses. A
> kernel built with CONFIG_THUMB2_KERNEL=y and using clang as the
> assembler could generate non-naturally-aligned v7wbi_tlb_fns which
> results in a boot failure. The original commit adding the macro missed
> the .align directive on this data.
>
> Fixes: 66a625a88174 ("ARM: mm: proc-macros: Add generic proc/cache/tlb struct definition macros")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1447
> Link: https://lore.kernel.org/all/0699da7b-354f-aecc-a62f-e25693209af4@linaro.org/
> Debugged-by: Ard Biesheuvel <ardb@kernel.org>
> Debugged-by: Nathan Chancellor <nathan@kernel.org>
> Debugged-by: Richard Henderson <richard.henderson@linaro.org>
> Suggested-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  arch/arm/Kconfig          | 1 +
>  arch/arm/mm/proc-macros.S | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index fc196421b2ce..b760dd45b734 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -92,6 +92,7 @@ config ARM
>         select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
>         select HAVE_FUNCTION_GRAPH_TRACER if !THUMB2_KERNEL && !CC_IS_CLANG
>         select HAVE_FUNCTION_TRACER if !XIP_KERNEL
> +       select HAVE_FUTEX_CMPXCHG if FUTEX
>         select HAVE_GCC_PLUGINS
>         select HAVE_HW_BREAKPOINT if PERF_EVENTS && (CPU_V6 || CPU_V6K || CPU_V7)
>         select HAVE_IRQ_TIME_ACCOUNTING
> diff --git a/arch/arm/mm/proc-macros.S b/arch/arm/mm/proc-macros.S
> index e2c743aa2eb2..d9f7dfe2a7ed 100644
> --- a/arch/arm/mm/proc-macros.S
> +++ b/arch/arm/mm/proc-macros.S
> @@ -340,6 +340,7 @@ ENTRY(\name\()_cache_fns)
>
>  .macro define_tlb_functions name:req, flags_up:req, flags_smp
>         .type   \name\()_tlb_fns, #object
> +       .align 2
>  ENTRY(\name\()_tlb_fns)
>         .long   \name\()_flush_user_tlb_range
>         .long   \name\()_flush_kern_tlb_range
> --
> 2.33.0.685.g46640cef36-goog
>


-- 
Thanks,
~Nick Desaulniers
