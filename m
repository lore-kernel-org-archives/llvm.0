Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FF250276
	for <llvm@lists.linux.dev>; Sat, 23 May 2026 22:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779576422; cv=none; b=MyMQ5foONvGaXfOOx/yDUERs3yG5lCjNSofvXUuEYshp/jz4VDquVZ+Gnn/0vIE0FBkeOt6p0PR9Qxup3VQEPng1Sk1nPhdmiKADZlPQ9rGsk3AyS0X/yy5yIoVNgTpcNK71ATPiDK7XMheR8z1JmzQu7eQEFk9bQVVefBWT5pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779576422; c=relaxed/simple;
	bh=hI2WxIL/SFibqPgCNfqmsJi15LBfE7vwSV9XDng5yMc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=inAMhFvkmnot0wQdUA3s9dl2fi4lNSk7dHi7wYhViXGFfYSB4Zagw67qbJhGWxQpvO14iNV/OjcFUBYokSZZ6r+WB9Pkzp4Xrj3XDhmFoHIOjpxCJ3e8wamqLYGU9cCtxYlUFogqAXEfprkoEmEk9KOLQ67pWvlME+u4EJKx2lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=29eVPFxr; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="29eVPFxr"
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <andreas@kemnade.info>)
	id 1wQuT1-0000000H3qM-0Cpg
	for llvm@lists.linux.dev;
	Sun, 24 May 2026 00:05:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=5y5C7U0eJNMWpozPRhpxeJdIqeK0zzLaadU8ylQbPm8=; b=29eVPFxrSct7jQWCF+6gO7VEHs
	zKAP0Qda313Jh20BQWWgKsnRy1pBtFicxbgKdgC+UZNl9mNE2ESJ65O+vwTbr4DBVdTrjeqg6wR8L
	saOEkvzVEY1VE2xp9ZYWdUfITY1x72Yt4GTaVgaP9gTF3KQqNscluekNakGKl4cro6dHMxjj9xeek
	30PT+yCxhZmCUr5AdO9vAW3XdmXNUzWSjQ6w6P3CJSTz/Fx2x+EqkL6U9jymtBr/xAEc8ygNjbuIa
	H3uj5A9XYEFwlb/lpVf6QpJ7qTtxOjYvw3w11jiicIcuT5SgSwyb57cH/eRRXhlp3NIXzn32Ttvf/
	wAifhk3Q==;
Date: Sun, 24 May 2026 00:04:52 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Mithil Bavishi <bavishimithil@gmail.com>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman
 <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
 <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, Sami Tolvanen
 <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ARM: OMAP2+: Add CFI type for omap4_finish_suspend
Message-ID: <20260524000452.0d67f884@kemnade.info>
In-Reply-To: <20260522233036.12277-1-bavishimithil@gmail.com>
References: <20260522233036.12277-1-bavishimithil@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 22 May 2026 16:30:36 -0700
Mithil Bavishi <bavishimithil@gmail.com> wrote:

> With CONFIG_CFI enabled, OMAP4 can trap in omap4_enter_lowpower()
> because omap_pm_ops.finish_suspend points directly to the assembly
> routine omap4_finish_suspend, which lacks the expected KCFI type
> metadata.
> 
> Annotate omap4_finish_suspend with SYM_TYPED_FUNC_START so the assembly
> routine carries the KCFI type metadata.
> 
> Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  arch/arm/mach-omap2/sleep44xx.S | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/mach-omap2/sleep44xx.S b/arch/arm/mach-omap2/sleep44xx.S
> index f09c91978..0b48df6fc 100644
> --- a/arch/arm/mach-omap2/sleep44xx.S
> +++ b/arch/arm/mach-omap2/sleep44xx.S
> @@ -58,7 +58,7 @@
>   * stack frame and it expects the caller to take care of it. Hence the entire
>   * stack frame is saved to avoid possible stack corruption.
>   */
> -ENTRY(omap4_finish_suspend)
> +SYM_TYPED_FUNC_START(omap4_finish_suspend)
>  	stmfd	sp!, {r4-r12, lr}
>  	cmp	r0, #0x0
>  	beq	do_WFI				@ No lowpower state, jump to WFI
> @@ -223,7 +223,7 @@ skip_scu_gp_clear:
>  	isb
>  	dsb
>  	ldmfd	sp!, {r4-r12, pc}
> -ENDPROC(omap4_finish_suspend)
> +SYM_FUNC_END(omap4_finish_suspend)
>  
>  /*
>   * ============================

