Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE238C08
	for <llvm@lists.linux.dev>; Fri, 16 Dec 2022 23:10:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD19CC433F0;
	Fri, 16 Dec 2022 23:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671232234;
	bh=zgYWqAaqj6eaq/rWdydgspOTjJ0i61y5A/KYsEJprcA=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=hiD4a1XBwZB417IY24mhN+JX31bSQx39n7Zdc60keJ6zlZntYnNedcnt4j4UVIwCD
	 7V//GMK/qxPysAynLs8vu3MoopnuCa0yCumIUA2Zt+mXNdhtj4mxeBs2walUKWw0Oo
	 8hZAh1X1Ssxcr39mfZfCi7RgZ95VzGWHK7Up4o+qhcWGo716iz4Q5AcC5JDqRQTIUI
	 N4r3/t63/pijzKY10eSJhrfMAqieWutRlh6grH90NgTzMcWP9BGaHqtuI+wIYR/TCA
	 prMVtl3s4DsTdfZJ9wMW3GVXzJ4SAm9DVDIs5hPARQpfuNc1u7mvpC+5LYbKUW2P/0
	 7OTIQZFAk/jzw==
Date: Fri, 16 Dec 2022 16:10:32 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Russell King <linux@armlinux.org.uk>,
	Nick Desaulniers <ndesaulniers@google.com>, soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Tom Rix <trix@redhat.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Ard Biesheuvel <ardb@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] ARM: disallow pre-ARMv5 builds with ld.lld
Message-ID: <Y5z66Oh1mcOul0Jw@dev-arch.thelio-3990X>
References: <20221215162635.3750763-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221215162635.3750763-1-arnd@kernel.org>

On Thu, Dec 15, 2022 at 05:26:20PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> lld cannot build for ARMv4/v4T targets because it inserts 'blx' instructions
> that are unsupported there:
> 
>   ld.lld: warning: lld uses blx instruction, no object with architecture supporting feature detected
> 
> Add a Kconfig time dependency to prevent those targets from being
> selected in randconfig builds.
> 
> Link: https://github.com/llvm/llvm-project/issues/50764
> Link: https://github.com/ClangBuiltLinux/linux/issues/964
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  arch/arm/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 4a8fff7f9be0..d995054ab602 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -344,12 +344,14 @@ comment "CPU Core family selection"
>  config ARCH_MULTI_V4
>  	bool "ARMv4 based platforms (FA526, StrongARM)"
>  	depends on !ARCH_MULTI_V6_V7
> +	depends on !LD_IS_LLD
>  	select ARCH_MULTI_V4_V5
>  	select CPU_FA526 if !(CPU_SA110 || CPU_SA1100)
>  
>  config ARCH_MULTI_V4T
>  	bool "ARMv4T based platforms (ARM720T, ARM920T, ...)"
>  	depends on !ARCH_MULTI_V6_V7
> +	depends on !LD_IS_LLD
>  	select ARCH_MULTI_V4_V5
>  	select CPU_ARM920T if !(CPU_ARM7TDMI || CPU_ARM720T || \
>  		CPU_ARM740T || CPU_ARM9TDMI || CPU_ARM922T || \
> -- 
> 2.35.1
> 
