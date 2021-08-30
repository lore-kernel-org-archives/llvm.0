Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5355D3FC2
	for <llvm@lists.linux.dev>; Mon, 30 Aug 2021 23:31:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1A50A60F57;
	Mon, 30 Aug 2021 23:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630366309;
	bh=7uGwZpbW13LCNDqhoTGRaIB/iCxKyOsJus4ix9oeO7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y5LojrYYMvSJuxlsJwXfr37hjmCPg+vrhGQmLV2jb0BN3MfD8r1h7BQ1niNbYP+iE
	 antEbgc1tDiYSx0urn/xfO0EyDeeNQsjkKkNCPLORzqDPMHGYc9Q0elrAdg/t+oqQN
	 VA7iKQdEfTjxTgywsQpKNvqPm7VgMzx4KYwlFSrkE4xjBTaY6bVl4wNCRYAQOJfmrL
	 HnGhhdwhkG0zBXqoE3v7MfzSMGRYWpG7m7RcdIQj0Bnp+U8kQdIMIE4DG6ZvCeJcAO
	 YC8at02Kv33N0cS5vkk1hUsDROYwrdI6YMu+LThbmi7ZQcqomI9Iw7VMd/TiqvHWNf
	 bONfwqDzdE+JQ==
Date: Mon, 30 Aug 2021 16:31:46 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev,
	Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>, YiFei Zhu <yifeifz2@illinois.edu>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org,
	clang-built-linux@googlegroups.com
Subject: Re: [PATCH] ARM: select HAVE_FUTEX_CMPXCHG
Message-ID: <YS1qYuZ5nM/AQeSh@Ryzen-9-3900X.localdomain>
References: <20210830213846.2609349-1-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210830213846.2609349-1-ndesaulniers@google.com>

On Mon, Aug 30, 2021 at 02:38:43PM -0700, Nick Desaulniers wrote:
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

Tested-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  arch/arm/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index fc196421b2ce..b760dd45b734 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -92,6 +92,7 @@ config ARM
>  	select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
>  	select HAVE_FUNCTION_GRAPH_TRACER if !THUMB2_KERNEL && !CC_IS_CLANG
>  	select HAVE_FUNCTION_TRACER if !XIP_KERNEL
> +	select HAVE_FUTEX_CMPXCHG if FUTEX
>  	select HAVE_GCC_PLUGINS
>  	select HAVE_HW_BREAKPOINT if PERF_EVENTS && (CPU_V6 || CPU_V6K || CPU_V7)
>  	select HAVE_IRQ_TIME_ACCOUNTING
> -- 
> 2.33.0.259.gc128427fd7-goog
