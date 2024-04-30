Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07611C65E5
	for <llvm@lists.linux.dev>; Tue, 30 Apr 2024 09:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714468750; cv=none; b=speRowZoEgz+MEMkXbvKTWNRaerEdlC4BQSpD2NqVo+J201/31s02Va3LHr6rjFz/f/nmsqb+I1rj1aOW2UnZQpoliU7PH7QPI544pi8b7yUEPTg8xak1TFf62RRmM+DmmehRs4aFikaR6ANARPUxuvYDAmkwb6Wpkn0QRfuLYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714468750; c=relaxed/simple;
	bh=Y9yxI3zCuypgqrXSEcqsue/oJhjSrZUnmLapu8htQFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cw4AOCu2qzoIfJhpHx9r20R7LTsqv2YLu6oNIfV6+/LWeOXxT4ZdkQ0qTxBDT0P6CJJivmOQcZH3xOHjEEdUjGtSRNd1xzQVeTEMDlUdylE66+bChYlwjkRusAwhMndONaicUM/wqf35FjtD61/uW1NkCBbg2OyjX/13BdLS6B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YodmmDw+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YodmmDw+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EA9DC4AF49
	for <llvm@lists.linux.dev>; Tue, 30 Apr 2024 09:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714468750;
	bh=Y9yxI3zCuypgqrXSEcqsue/oJhjSrZUnmLapu8htQFI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YodmmDw+UM86YU6B/sIZScCrBnayS7NQrb07W6UF2FMvff3TQQCaM5zU3FnDIlxA5
	 cPbYA5ApjAgxav1hrTkjduDoJPFvr/fU3NJ58Hk5b3BDX9iQPJIQTiSTPMQxnWI5vL
	 tGE7GTrPS1ZtoVC3Ea1AhGfmQ7Q4fUud8q46YNflgzmHG/kEBZfOn/BFAO7kWulLtY
	 P0D/OAjh90KCssF1XxeDInwQ+iGnfypo4eWz2mqS6/z/2ejaJoa62G3Vztqk8NwRec
	 3cKPHNBx0tyYfVxitGB0X2CEaEkQlDE6wpkx8/Am+b7k7B3qSHRrYfVdfKCQiQOqiC
	 YJQsz4I79Drnw==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-516d2600569so6657240e87.0
        for <llvm@lists.linux.dev>; Tue, 30 Apr 2024 02:19:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUQBQylScr7grFKhc1I6TeDCjE9QeqHjaJ+7VDdQHXS+1Ugh/BmjMnqjtcp25ldAY2ROgfYog7jxGo9m2OTtyBolI7SvQ==
X-Gm-Message-State: AOJu0YxTlz0uGeXatwP4jtNf34ZS/d6C0p39XQPBP+CbnTah9srfma6j
	cx+xJl7Nyow4GJPYXtY8EgKzy6rMgtZeyGpHzDB8AHnahljtcoYGTUfcCb3CdqkIScXkrNn9t7Q
	GgOJUFLzp5SR+OCNkx8uKOHbrLLE=
X-Google-Smtp-Source: AGHT+IGo9esSv7bYrqpKzsiWGAu3ncp+3nWzicbc8d1DasglkUim4tvWtoou/vO/yEF0C5/Ai6yjklxVE8VAUfZRowA=
X-Received: by 2002:a19:6417:0:b0:518:dfed:f021 with SMTP id
 y23-20020a196417000000b00518dfedf021mr6336229lfb.24.1714468748627; Tue, 30
 Apr 2024 02:19:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240430-arm32-cfi-topping-v1-1-4cb6a15552aa@linaro.org>
In-Reply-To: <20240430-arm32-cfi-topping-v1-1-4cb6a15552aa@linaro.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 30 Apr 2024 11:18:55 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEfQYMk-PHBDBJS-LxTcx72+6ZZVffGtnoiHB4KcdoaSQ@mail.gmail.com>
Message-ID: <CAMj1kXEfQYMk-PHBDBJS-LxTcx72+6ZZVffGtnoiHB4KcdoaSQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: Use conditionals for CFI branches
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Russell King <linux@armlinux.org.uk>, Sami Tolvanen <samitolvanen@google.com>, 
	Kees Cook <keescook@chromium.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, 30 Apr 2024 at 10:26, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Commit 9385/2 introduced a few branches inside function
> prototypes when using CFI in order to deal with the situation
> where CFI inserts a few bytes of function information in front
> of the symbol.
>
> This is not good for older CPUs where every cycle counts.
>
> Commit 9386/2 alleviated the situation a bit by using aliases
> for the cache functions with identical signatures.
>
> This leaves the coherent cache flush functions
> *_coherent_kern_range() with these branches to the corresponing
> *_coherent_user_range() around, since their return type differ and
> they therefore cannot be aliased.
>
> Solve this by a simple ifdef so at least we can use fallthroughs
> when compiling without CFI enabled.
>
> Suggested-by: Ard Biesheuvel <ardb@kernel.org>
> Link: https://lore.kernel.org/linux-arm-kernel/Zi+e9M%2Ff5b%2FSto9H@shell.armlinux.org.uk/
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  arch/arm/mm/cache-fa.S      | 2 ++
>  arch/arm/mm/cache-v4.S      | 2 ++
>  arch/arm/mm/cache-v4wb.S    | 4 ++++
>  arch/arm/mm/cache-v4wt.S    | 2 ++
>  arch/arm/mm/cache-v6.S      | 2 ++
>  arch/arm/mm/cache-v7.S      | 2 ++
>  arch/arm/mm/cache-v7m.S     | 2 ++
>  arch/arm/mm/proc-arm1020.S  | 2 ++
>  arch/arm/mm/proc-arm1020e.S | 2 ++
>  arch/arm/mm/proc-arm1022.S  | 2 ++
>  arch/arm/mm/proc-arm1026.S  | 2 ++
>  arch/arm/mm/proc-arm920.S   | 2 ++
>  arch/arm/mm/proc-arm922.S   | 2 ++
>  arch/arm/mm/proc-arm925.S   | 2 ++
>  arch/arm/mm/proc-arm926.S   | 2 ++
>  arch/arm/mm/proc-arm940.S   | 2 ++
>  arch/arm/mm/proc-arm946.S   | 2 ++
>  arch/arm/mm/proc-feroceon.S | 2 ++
>  arch/arm/mm/proc-mohawk.S   | 2 ++
>  arch/arm/mm/proc-xsc3.S     | 2 ++
>  20 files changed, 42 insertions(+)
>
> diff --git a/arch/arm/mm/cache-fa.S b/arch/arm/mm/cache-fa.S
> index db454033b76f..4a3668b52a2d 100644
> --- a/arch/arm/mm/cache-fa.S
> +++ b/arch/arm/mm/cache-fa.S
> @@ -112,7 +112,9 @@ SYM_FUNC_END(fa_flush_user_cache_range)
>   *     - end    - virtual end address
>   */
>  SYM_TYPED_FUNC_START(fa_coherent_kern_range)
> +#ifdef CONFIG_CFI_CLANG /* Fallthrough if !CFI */

These functions are only called indirectly if MULTI_CACHE is enabled,
right? If so, this could be

#if defined(CONFIG_CFI_CLANG) && defined(MULTI_CACHE)

In any case, with or without that tweak

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
