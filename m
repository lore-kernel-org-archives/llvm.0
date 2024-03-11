Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DEF3C097
	for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 12:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710160015; cv=none; b=ENSMwGJlT/MXB44JVR91cQ3Sbh7EcalZgPrDPwPaVA/DSsA5CbbcECN1bAypc2z2ZOSCiMw5k0eRWqId4seAwa0DeWJjVKreEHe+vlVcHFmS4TLY8Mqr+bqDlD1AHhlgxZMQuQm080PvL0tDn5qW1+G+cxpRnLmQrR4ZoGmys2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710160015; c=relaxed/simple;
	bh=jPdkra8jbhLT7J31UV6KRi9N0nUhnWL6ATZJMVGLM2U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ebUIad0w5qn5ie4GqYAOKh1F5qLlDAfu0fbQ30sbot9qNjfmpd+CM3XG8rC3FQr8dhALEoCiHp1k8mm33XDeh1dTAvy6grjsQn0riPjSqVxgVozyIOET9niUxKp/zg/3+hN0f0c206VT+BBC3VF9kXPvhP4v5LHKr/3w9Mw0zkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pbdf0jp3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pbdf0jp3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13CECC433F1
	for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 12:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710160015;
	bh=jPdkra8jbhLT7J31UV6KRi9N0nUhnWL6ATZJMVGLM2U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Pbdf0jp3YMzbRpUcPCDCuJatsxnRiDQuX8gFofchWP0xVbkSBCCxC7RShpGiLFdHF
	 S5qFNQ63HziJdhbQUJWg8tWDtkqxKy/JjZpalIpc0rDcoBJZ7S91SWbanTo1HAzECG
	 MItIWB5n4vq0l9g26Pd1568nqzcfbxU+zwoIEla+Eib4cXOn5NaDdQ+dh9o4a2KLXd
	 /lHWpse0NhzJyEOS1kLVUaIMfoZ5Mtdvu1lIZTlft4Ll2wWhMreEVVDvzZEJX6Uymy
	 hpmoaiVJzVstRyhMKIdLTgPN6fttR8IoaJ09BBLVhSQxshJvFfCLYzJElCQiH8Mq5K
	 1MA7TMy0PQ8sA==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-513b022a238so560551e87.0
        for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 05:26:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXCE5yPUZzRwEZcWp4Eu0/AIyOUu+qBOsqPP8lbUF+RB85P8yGLa0Rzcay5pqLK0FR62yIzeSsk4FXtCXsyxI4sxsa9lg==
X-Gm-Message-State: AOJu0YyXhfJaeg3ctq/0dG99+tazkLyua4+CkcdEiycbFuiC53wIqFlA
	ybLlRsZDe31mdFs+3i/SOZIbhHC/yiohKjKFvtDW30TVfIMNGM/dXsjuSVGjVvGKG89XKAb3u9Q
	3PyZg1wKewQLeLhughRpL/zzIdBM=
X-Google-Smtp-Source: AGHT+IFZpi/dvpaJQF3iFS8ZDXumv9NYgN/JriIjOqA0mN/xGYKwNxEUsJV81ifaupfk9naTbOHJ1Bnyter7E8FZKA0=
X-Received: by 2002:a19:6919:0:b0:513:a7e0:28c7 with SMTP id
 e25-20020a196919000000b00513a7e028c7mr1939875lfc.6.1710160013257; Mon, 11 Mar
 2024 05:26:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240311-arm32-cfi-v3-0-224a0f0a45c2@linaro.org> <20240311-arm32-cfi-v3-5-224a0f0a45c2@linaro.org>
In-Reply-To: <20240311-arm32-cfi-v3-5-224a0f0a45c2@linaro.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 11 Mar 2024 13:26:41 +0100
X-Gmail-Original-Message-ID: <CAMj1kXE9-5VTa=456FrRrnSK7+3i6H2MkjTnvY7Dcv1GSJ5tGw@mail.gmail.com>
Message-ID: <CAMj1kXE9-5VTa=456FrRrnSK7+3i6H2MkjTnvY7Dcv1GSJ5tGw@mail.gmail.com>
Subject: Re: [PATCH v3 5/9] ARM: delay: Turn delay functions into static inlines
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Russell King <linux@armlinux.org.uk>, Sami Tolvanen <samitolvanen@google.com>, 
	Kees Cook <keescook@chromium.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 Mar 2024 at 10:15, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> The members of the vector table arm_delay_ops are called
> directly using defines, but this is really confusing for
> KCFI. Wrap the calls in static inlines and tag them with
> __nocfi so things start to work.
>
> Without this patch, platforms without a delay timer will
> not boot (sticks in calibrating loop etc).
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  arch/arm/include/asm/delay.h | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
>

So what goes wrong without this patch? Is it really that easy to confuse kCFI?

As far as I can tell (and I tried reverting it too), this patch should
not be needed - in general, when all function pointer variables and
the functions themselves are defined in the C domain, the compiler
should be able to figure it out.

Also, these are functions that are used on every system and called
often and in a predictable manner, so they are prime targets for the
kind of attacks that CFI is intended to harden against, so wrapping
them in __nocfi is probably something we should try to avoid.


> diff --git a/arch/arm/include/asm/delay.h b/arch/arm/include/asm/delay.h
> index 1d069e558d8d..7d611b810b6c 100644
> --- a/arch/arm/include/asm/delay.h
> +++ b/arch/arm/include/asm/delay.h
> @@ -55,7 +55,10 @@ extern struct arm_delay_ops {
>         unsigned long ticks_per_jiffy;
>  } arm_delay_ops;
>
> -#define __delay(n)             arm_delay_ops.delay(n)
> +static inline void __nocfi __delay(unsigned long n)
> +{
> +       arm_delay_ops.delay(n);
> +}
>
>  /*
>   * This function intentionally does not exist; if you see references to
> @@ -76,8 +79,15 @@ extern void __bad_udelay(void);
>   * first constant multiplications gets optimized away if the delay is
>   * a constant)
>   */
> -#define __udelay(n)            arm_delay_ops.udelay(n)
> -#define __const_udelay(n)      arm_delay_ops.const_udelay(n)
> +static inline void __nocfi __udelay(unsigned long n)
> +{
> +       arm_delay_ops.udelay(n);
> +}
> +
> +static inline void __nocfi __const_udelay(unsigned long n)
> +{
> +       arm_delay_ops.const_udelay(n);
> +}
>
>  #define udelay(n)                                                      \
>         (__builtin_constant_p(n) ?                                      \
>
> --
> 2.34.1
>
