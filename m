Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDC529CA
	for <llvm@lists.linux.dev>; Tue, 28 Sep 2021 17:20:56 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id y26so56410018lfa.11
        for <llvm@lists.linux.dev>; Tue, 28 Sep 2021 10:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oovrzJURHWJ6qCmrUM9JSWjLkbl3a0JTJO2dczu7GzA=;
        b=Ok+ALmAEK+cZnQ6LuSSxPh+ShUTJqGCiOvmoU/FE8+AFDbt3w2xhf+OJV+wicegC6O
         zU2DU4rpLyA0i2Uy7MMceYMncHY/4DZIXQRThvvvLyG/WcXtf+4JNsa58sUAo+1aj/mX
         ON0HnvzkhDxEhQLZSLEsq4CHpc1tpzlgy0y2FlvYGd1Ocrkzy5HD82giCejK//R+7hGc
         2LZXlfyICmNNA6D/mQkr26WrfwwJpQotDXTrg9YhgOu16u0AqgkKz6M5PqcrV+1Auksa
         BIEPMAbqdhZe9qWJWdZokywf9Qi+0eW8StkBU5rPa+QxgyIrvn+v+bk9IsszNjTqpzbV
         L+IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oovrzJURHWJ6qCmrUM9JSWjLkbl3a0JTJO2dczu7GzA=;
        b=XtDWoBGOlT2du/9yTydWjoUHS9J0BAFlZ2KFBWptayC+svXyFN69F2FDpxQU8g73W3
         OXbrWqsPKoQCRaz3oRWrB/p48DGoLu1EvlaU6JhwwFJpBuXnkdJWRZh/ham+a0a0vO15
         6uSOiKFzHL59zGW9vFvGxNIUsQ3uxfDmaAfFYN3sDQ9t1zAMUSJu+doU0QAbVovqdCqR
         X8CyIodePzgFWFQOAK2EE+jH+A+g6lca381ynCR4jzcCdqdEtLOE9bLWAGpQc6f2IRXu
         dyJnxzcTR7DDC/WAtoZLBZNyyHd/LJ0Vco/CvdzZZ3YRgzu1Rv7p581yNVTiSsBUMO5M
         0trA==
X-Gm-Message-State: AOAM533XbUxWmwLRdEOGQk9xUson3J9ZoAE0po7V0WfZzsHCLjc0Kb5X
	D5pzn+Ye3ooDQbHA1LGG/7J6M+WvAXu2dy/TOMz/jQ==
X-Google-Smtp-Source: ABdhPJwui+sJR23H1nkOUy19dPvbUaqlhgFcXDNU9AQv+t/weNik7LllxBjVxzZsr61RZATSJV00S+5+8Lx+VKX9mTg=
X-Received: by 2002:a05:6512:b0c:: with SMTP id w12mr6917372lfu.240.1632849654306;
 Tue, 28 Sep 2021 10:20:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210928154143.2106903-1-arnd@kernel.org> <20210928154143.2106903-15-arnd@kernel.org>
In-Reply-To: <20210928154143.2106903-15-arnd@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 28 Sep 2021 10:20:42 -0700
Message-ID: <CAKwvOdmhZiOQ1h6_qfOxTKkzoA+Go8BCp-GEUZ6LNQpd0cimzA@mail.gmail.com>
Subject: Re: [PATCH 14/14] [RFC] ARM: forbid ftrace with clang and thumb2_kernel
To: Arnd Bergmann <arnd@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Ard Biesheuvel <ardb@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, Peter Smith <Peter.Smith@arm.com>, 
	Kristof Beyls <Kristof.Beyls@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 28, 2021 at 8:42 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> clang fails to build kernels with THUMB2 and FUNCTION_TRACER
> enabled when there is any inline asm statement containing
> the frame pointer register r7:
>
> arch/arm/mach-versatile/dcscb.c:95:2: error: inline asm clobber list contains reserved registers: R7 [-Werror,-Winline-asm]

^ This file no longer exists in tree?

> arch/arm/mach-exynos/mcpm-exynos.c:154:2: error: inline asm clobber list contains reserved registers: R7 [-Werror,-Winline-asm]
> arch/arm/probes/kprobes/actions-thumb.c:449:3: error: inline asm clobber list contains reserved registers: R7 [-Werror,-Winline-asm]
>
> Apparently gcc should also have warned about this, and the
> configuration is actually invalid, though there is some
> disagreement on the bug trackers about this.
>
> Link: https://bugs.llvm.org/show_bug.cgi?id=45826
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=94986
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  arch/arm/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 0d4f3e2d50ad..7ea95bb40004 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -91,7 +91,7 @@ config ARM
>         select HAVE_FAST_GUP if ARM_LPAE
>         select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
>         select HAVE_FUNCTION_GRAPH_TRACER if !THUMB2_KERNEL && !CC_IS_CLANG
> -       select HAVE_FUNCTION_TRACER if !XIP_KERNEL
> +       select HAVE_FUNCTION_TRACER if !XIP_KERNEL && !(THUMB2_KERNEL && CC_IS_CLANG)
>         select HAVE_GCC_PLUGINS
>         select HAVE_HW_BREAKPOINT if PERF_EVENTS && (CPU_V6 || CPU_V6K || CPU_V7)
>         select HAVE_IRQ_TIME_ACCOUNTING
> --
> 2.29.2
>
>


-- 
Thanks,
~Nick Desaulniers
