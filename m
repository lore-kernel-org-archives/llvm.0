Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A52F6F061
	for <llvm@lists.linux.dev>; Mon, 29 Apr 2024 13:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714396724; cv=none; b=jO00DXBw1ubGaY1NtCczXq9XsVBZ3JKfIfPydDXPxsVETarkTX0GTBd6bhP3+0Z8wAYHxk4rCEHr9BmNAEFRicxFozCLGtNYgL3xL1dpkgSCdcK5TQrVrwnbJK9tIlrwUDxXnHhitM8Cw9SorWZEiB5NH3Epc9xbs+CggbkJuLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714396724; c=relaxed/simple;
	bh=IRWWy2IlvuwaKbyTPLqQo5C301oLUpf7IlQGHaPwJ9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ew/ljzvIxGN8HSqEq5xcEmQYiDb8tznGDj0XMPyoQde1hzB+fc5GeUaJDADF/Otp9ArS0+AzDYrSbkbssr5QIA/vdQwGOrYY/QsOBXsiHtezJQjyepl9BGCXHTdOv3R2LVnAEwu56H24EuFTJBbe2ViKg4ruNgXDwu8hOoXojvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=S8PNixbP; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="S8PNixbP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ukVgE4qDqlBDH2cqXY2lOwS2mKM9ytx95cPwf5PU+G8=; b=S8PNixbPxQeQKPGe0J0f5+P+68
	Zsu5gpzvVxXg0r9x9Zf+DgStHc1+Hd8T9+khCI/LMaLF/8Yyp4fggUmjhx2ZDiQOvGLjpWVnHi6+Q
	DUOYLTYQ+ixmoLiP5livYM8AOL5tHJBC6ViWzU/GlSaMFndcBcB/8dnvFASoan5QI/G65GHsnfvau
	KfGwX4PrsgcwKH2PB+CNpElOzjVKX3sZahzu4xzh4ZaGilatFTPjROvPMaVdupzHMC8TxiJwBgr5a
	YkoBCBg+/W583xm52lGiaeaIaOmQDNgXn1rNi8YVOUPm1GS8ZoeYwA9P7k0emi0dp5DOKyEvZX6g9
	VB7GpWhg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56856)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1s1Qtp-0003E1-1Z;
	Mon, 29 Apr 2024 14:18:29 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1s1Qtp-0000sO-2Z; Mon, 29 Apr 2024 14:18:29 +0100
Date: Mon, 29 Apr 2024 14:18:28 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sami Tolvanen <samitolvanen@google.com>,
	Kees Cook <keescook@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH v5 04/10] ARM: mm: Type-annotate all cache assembly
 routines
Message-ID: <Zi+eJM8+ulDBYGrQ@shell.armlinux.org.uk>
References: <20240415-arm32-cfi-v5-0-ff11093eeccc@linaro.org>
 <20240415-arm32-cfi-v5-4-ff11093eeccc@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240415-arm32-cfi-v5-4-ff11093eeccc@linaro.org>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Mon, Apr 15, 2024 at 03:43:23PM +0200, Linus Walleij wrote:
> -ENTRY(fa_flush_user_cache_all)
> -	/* FALLTHROUGH */
> +SYM_TYPED_FUNC_START(fa_flush_user_cache_all)
> +	b	fa_flush_kern_cache_all
> +SYM_FUNC_END(fa_flush_user_cache_all)

The thing I don't like about this is that it makes these functions
less efficient - the early CPUs do _not_ have branch predictors,
and they flush the pipeline on branches, so rather than just dropping
rough, this kind of thing introduces pointless multi-cycle delays for
functionality just to keep CFI happy.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
