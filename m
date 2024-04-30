Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8603128387
	for <llvm@lists.linux.dev>; Tue, 30 Apr 2024 09:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714469022; cv=none; b=Yrwe5dakzYvAleLNkiPTDCJwRSz6whevTrQHO4oyj3EqskMCToj8jcVhi3w2Z2N1ktip3ANPVqrppCfufFMyja3hzFRA2uxdxe1sjK1t04xZbnZAd5o+HA631EIOezUiI9Hbi5IUGcs/vHx/r/PkJA/GOmI6lcTIlOHPm0ySd5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714469022; c=relaxed/simple;
	bh=CU8MhO3fvl7Gh582J6Sb5XNjge9Fh1PWMbdVFP8TCs0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W3EKAeQ5U0/Wlc/pKouOE/rcceUAtP8+xImkcc69bwvx6xErrztLF+COIr3u2XCkDRJHl86mMi3ukXwC8HjzuLatZ7fv50neDihZjB0psrATnFlG4i2EBW0OnRJ6Sb5THIqg0VYbqX72cFnmY8JLBpYhK3PDuF9v6plgkWzAy9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=1hQkszTR; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="1hQkszTR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=iijlrqDU16ePvlg5sT9u3QWJTUGqRQHjwf91olcab1E=; b=1hQkszTR1j3Cf3e0tAvzBMB053
	DUa0y56OHnrqzwtibwoQdiLQCYk1OpOv1MTjyDVRnGgOWchvnMqr2rXIm53svJQrARp6qlJgZeIkk
	jXtbW6mITrRGnWTb+Nhad74s+e/EQ8eTj2tVJHkiB4uKbXvnuOwPG42kLB6GsbXyigKGN68nb7GRO
	Yc2rombN6oZdgiEnBE+nmon/w+GUvBe4doIMvKqAmkD/UPC9LvLPMCGvq6UuFHZ5UWBlRXr2pSHQb
	7Ki3H59xaPvU82e66e3dWyI8MnwoUK0eyQBYuWaEvipXQKJuTBDWJ9JNiX1CFloWPb9pz+hO40x5a
	ZiM5r0vw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56090)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1s1jhq-0004Mn-0j;
	Tue, 30 Apr 2024 10:23:22 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1s1jhp-0001gQ-0k; Tue, 30 Apr 2024 10:23:21 +0100
Date: Tue, 30 Apr 2024 10:23:20 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Kees Cook <keescook@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] ARM: Use conditionals for CFI branches
Message-ID: <ZjC4iL7lAvReKbx0@shell.armlinux.org.uk>
References: <20240430-arm32-cfi-topping-v1-1-4cb6a15552aa@linaro.org>
 <CAMj1kXEfQYMk-PHBDBJS-LxTcx72+6ZZVffGtnoiHB4KcdoaSQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXEfQYMk-PHBDBJS-LxTcx72+6ZZVffGtnoiHB4KcdoaSQ@mail.gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Tue, Apr 30, 2024 at 11:18:55AM +0200, Ard Biesheuvel wrote:
> On Tue, 30 Apr 2024 at 10:26, Linus Walleij <linus.walleij@linaro.org> wrote:
> > diff --git a/arch/arm/mm/cache-fa.S b/arch/arm/mm/cache-fa.S
> > index db454033b76f..4a3668b52a2d 100644
> > --- a/arch/arm/mm/cache-fa.S
> > +++ b/arch/arm/mm/cache-fa.S
> > @@ -112,7 +112,9 @@ SYM_FUNC_END(fa_flush_user_cache_range)
> >   *     - end    - virtual end address
> >   */
> >  SYM_TYPED_FUNC_START(fa_coherent_kern_range)
> > +#ifdef CONFIG_CFI_CLANG /* Fallthrough if !CFI */
> 
> These functions are only called indirectly if MULTI_CACHE is enabled,
> right? If so, this could be
> 
> #if defined(CONFIG_CFI_CLANG) && defined(MULTI_CACHE)

I don't see that makes any difference. Whether or not they're called
indirectly, the symbol is the entry point to the function. If called
directly and the useless branch is there, we'll incur the overhead of
the BL instruction flushing the pipeline followed immediately by the
overhead of the B instruction flushing the pipeline again.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
