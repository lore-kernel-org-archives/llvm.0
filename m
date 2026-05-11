Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E75C3A3E7A;
	Mon, 11 May 2026 13:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778507106; cv=none; b=tAIImWQ8VlKu+MDqMm6CLhX88JTbQlmQhPHFKLHZccFs2hFxE5YWMLi6wIBcMn0BK1IwyUpsoJyexa5tmTHRB+/JqppQ38NFjXs1KNiQD1pQkPVpd7+gOzXb5/MdWKerpVGjaE89s5OJuatrfHyDSpc981wjWKRygakQzWban8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778507106; c=relaxed/simple;
	bh=YB5foC83rUXpsRNNlHJNUbPJ0U/jUjSki9mIQyMMzck=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NsWvC7YcHhdYi+N9C9Y9QMUNwM6+qFOou9sVVtA0swNg3qNNQCjSbaOt0KMa+kMzLoNLpkQptxtnpJomAZoRzS5RT3lLGqEpqiE0DnSh/O2NVC2ASHdnZedH3AcKT5V94MgqEGhwOFbuDjRp/1ecOYVX6O/m7i9Ze8u09u4+mE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bx/vz2Ax; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bx/vz2Ax"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C6E9C2BCB0;
	Mon, 11 May 2026 13:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778507106;
	bh=YB5foC83rUXpsRNNlHJNUbPJ0U/jUjSki9mIQyMMzck=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Bx/vz2AxXZ/UO+SjlqXp2kuGwcATxAeJIGBHJcm5lekYYK24YZZsizVOSKvwkos74
	 UYH+Qam0jt6Vll15oU2Z+ymMek3jiWBIbOZ1Qp5RBJ37xunip+9P0Hw0HkuINxLNHY
	 rmNWAkSzt40AMnjbGwI+0qkFOHxx8+sW7v7f7iaSlYnbvKq25d5VWFWqF1IH9dSZ28
	 gLk4qXeWNJvR3eftJxML3f9tuMkyepjd1j9ByRPIemP5bkc+3uqgNppswak7MKXSuk
	 VyoaRtQAA9uWqW/g4kxuQxGKca/MB2/brDq6Hqh78CzpWFPXY8sXSwsj1IHm1+WpGb
	 Midbg1eFigYeg==
From: Thomas Gleixner <tglx@kernel.org>
To: Rosen Penev <rosenp@gmail.com>, linux-kernel@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Gregory Clement
 <gregory.clement@bootlin.com>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>, "moderated
 list:ARM/Marvell Kirkwood and
 Armada 370, 375, 38x,..." <linux-arm-kernel@lists.infradead.org>, "open
 list:CLANG/LLVM BUILD
 SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCH] irqchip/mvebu: Allow EBU irqchips to be compile-tested
In-Reply-To: <20260510195047.10143-1-rosenp@gmail.com>
References: <20260510195047.10143-1-rosenp@gmail.com>
Date: Mon, 11 May 2026 15:45:02 +0200
Message-ID: <87qzni83hd.ffs@tglx>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Sun, May 10 2026 at 12:50, Rosen Penev wrote:

> The Marvell EBU interrupt controller Kconfig symbols are hidden and
> selected only by platform code. This prevents build coverage for the
> drivers on other architectures even though the code only needs OF and
> MMIO support.
>
> Add COMPILE_TEST prompts and the required dependencies for the GICP,
> ICU, ODMI, PIC and SEI irqchips. While touching PIC for this coverage,
> use GENMASK() and BIT() for its masks so that 32-bit platforms can
> compile this safely without running into issues.

While touching PIC? That's related, but you want to prepare the PIC code
first in order to enable the compile test and not burry that change
within a gazillion lines of Kconfig muck.

>  config MVEBU_GICP
> +	bool "Marvell EBU GICP interrupt controller" if COMPILE_TEST
> +	depends on OF
> +	depends on HAS_IOMEM

  depends on OF && HAS_IOMEM

>  	select IRQ_MSI_LIB
> -	bool
> +	help
> +	  Support the Marvell EBU GICP interrupt controller.
>  
>  config MVEBU_ICU
> -	bool
> +	bool "Marvell EBU ICU interrupt controller" if COMPILE_TEST
> +	depends on OF
> +	depends on HAS_IOMEM
> +	select GENERIC_MSI_IRQ
> +	help
> +	  Support the Marvell EBU ICU interrupt controller.
>  
>  config MVEBU_ODMI
> -	bool
> +	bool "Marvell EBU ODMI interrupt controller" if COMPILE_TEST
> +	depends on OF
> +	depends on HAS_IOMEM
>  	select IRQ_MSI_LIB
>  	select GENERIC_MSI_IRQ

So while at it you can mop up this too. IRQ_MSI_LIB already selects
GENERIC_MSI_IRQ

> +	help
> +	  Support the Marvell EBU ODMI interrupt controller.
>  
>  config MVEBU_PIC
> -	bool
> +	bool "Marvell EBU PIC interrupt controller" if COMPILE_TEST
> +	depends on OF
> +	depends on HAS_IOMEM
> +	help
> +	  Support the Marvell EBU PIC interrupt controller.
>  
>  config MVEBU_SEI
> -        bool
> +	bool "Marvell EBU SEI interrupt controller" if COMPILE_TEST
> +	depends on OF
> +	depends on HAS_IOMEM
> +	help
> +	  Support the Marvell EBU SEI interrupt controller.

What ensures that IRQ_MSI_LIB is selected, when MVEBU_SEI is selected?

>  config LS_EXTIRQ
>  	bool "Freescale Layerscape external IRQ support" if COMPILE_TEST
> diff --git a/drivers/irqchip/irq-mvebu-pic.c b/drivers/irqchip/irq-mvebu-pic.c
> index 10b85128183a..95090d8efc06 100644
> --- a/drivers/irqchip/irq-mvebu-pic.c
> +++ b/drivers/irqchip/irq-mvebu-pic.c
> @@ -24,7 +24,7 @@
>  #define PIC_MASK	       0x4
>  
>  #define PIC_MAX_IRQS		32
> -#define PIC_MAX_IRQ_MASK	((1UL << PIC_MAX_IRQS) - 1)
> +#define PIC_MAX_IRQ_MASK	GENMASK(PIC_MAX_IRQS - 1, 0)

What guarantees that 'linux/bits.h' is included under all circumstances?

I'm really not impressed by this AI assisted slop at all.

Thanks,

        tglx
