Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939043FC9
	for <llvm@lists.linux.dev>; Thu, 16 Sep 2021 22:40:57 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id g1so24706412lfj.12
        for <llvm@lists.linux.dev>; Thu, 16 Sep 2021 15:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T3YLfr1u9APyPAn/xTQmLc+SC/g630ZJTt80Yi4gRR0=;
        b=KexSko9o03e221TiMOQcTGIr9nxX31lcgWZUT24uOnOkzlEIhpxo0+4tUxCTb2Ra/Q
         GsFPvcg0/vafhLPRYj90x5CgbUW+XaYgtuop2sFuXbDy2Mg5M88m2NUwydBOu2w0Ed1X
         ezmTcMaksDzPxUfp3T+vTrHpF2N1PBXlyzx43Lh3UpWmhKiz5He6roLpcQOlvLNKOisg
         mrShZLY0/+FLp66Y5jdw1ddAglorYfMwyZxmeZJXsxRROBYX3MR8pqe3lsx6qCUxYFKV
         gYUNUCLzpcS75fnYiZsPBOBRhCnzXSGI1xhGZNo6PUr2qxVWfYuiNib+raeA5hCEelG9
         fv9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T3YLfr1u9APyPAn/xTQmLc+SC/g630ZJTt80Yi4gRR0=;
        b=JxbnK4GQW94+nHW36RflXfuEJqTekgVOsxhbjkn0rcTCk4m2rhtH18myqrqDoetJDr
         tOjSwxJ2x154GMlhx/lu3hhgJc7QWPGWlaG+WQtgByUd3TpxkK66SM3tnRj1mhn9trCB
         4u+Dnw0pzI6Y8MseBfRnZn777KCuMqNCXjNQdEH5d9wB2TGwzP7Bs/+d9NR7U5WLRvmq
         ZopwAGs3RYy+1va0VVVsFcrnfSxiMjyW6TyTjKpOzCTHMYfsT8b5yoc7JuuvP5eoZTIq
         vRHYkb33kRcBjzmWZexAfUYhD7mA+WuS4rPWz6xl97kjs+/LivRpBq/PTPihWdesTDSw
         Galw==
X-Gm-Message-State: AOAM532MdaeuYpXLtBJxaglsn2F1C0Qp9r3HQmnaKiUkjGyLsxeVmnr7
	eqVVf/TFJCRxQkvQSAJ276Zzq3woy2qcW/tG8IEZfQ==
X-Google-Smtp-Source: ABdhPJyXkDeVnrvOs5LxGzFpx28xI/fxsrzke22YPtz1FA5rrloxgUZ0IpMgelFS1ql+FkIwlgn7h9HODNy4TSmiYuQ=
X-Received: by 2002:a05:6512:e89:: with SMTP id bi9mr5610868lfb.95.1631832055603;
 Thu, 16 Sep 2021 15:40:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210830213846.2609349-1-ndesaulniers@google.com>
In-Reply-To: <20210830213846.2609349-1-ndesaulniers@google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 17 Sep 2021 00:40:44 +0200
Message-ID: <CACRpkdap==EPZpAggMmd0XN1J-DwK=OQu3oGn-V=zPOaq5XnHw@mail.gmail.com>
Subject: Re: [PATCH] ARM: select HAVE_FUTEX_CMPXCHG
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, llvm@lists.linux.dev, 
	Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Andrew Morton <akpm@linux-foundation.org>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Ard Biesheuvel <ardb@kernel.org>, YiFei Zhu <yifeifz2@illinois.edu>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Mike Rapoport <rppt@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 30, 2021 at 11:38 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:

> tglx notes:
>   This function [futex_detect_cmpxchg] is only needed when an
>   architecture has to runtime discover whether the CPU supports it or
>   not.  ARM has unconditional support for this, so the obvious thing to
>   do is the below.
>
> Fixes linkage failure from Clang randconfigs:
> kernel/futex.o:(.text.fixup+0x5c): relocation truncated to fit: R_ARM_JUMP24 against `.init.text'
> and boot failures for CONFIG_THUMB2_KERNEL.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/325
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

LGTM
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Please put this into Russell's patch tracker!

Yours,
Linus Walleij
