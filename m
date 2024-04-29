Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A6C548EC
	for <llvm@lists.linux.dev>; Mon, 29 Apr 2024 13:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714396927; cv=none; b=smx/SM+IKfzPSu7F8n9Jk9zEgNEhhAhBJ7UfrfPVIHI1uiTlUfvWiKQ+332vSZDk+qBJXDc1LF7UjDAj2dYXP3nEvx3rX44rSZ6L9s2bz48v+UHmafDKq4s5Wdc5vnAycfhwPah2s6pRabPOz0lePaAIcEPU31+kqO9I/dLUDTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714396927; c=relaxed/simple;
	bh=955t3HJFUiYQNiXDEYirmE1LQn9zNIX1PmNE26WZT7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B+ghELaPci+gs260dtZ0rJyB7ao8VB3f2P2xGw9XoLAsarivjUYePwLoPKR6KePmLq25uU85SUrtZV3f7kHmS892FrqEaKQSDgN9H3+Po9OoCvLgCpGLIoOC9E8UDgFTKwlkbtvFpwKhl6TqJidaPI7yt7UD0HZl66J10jKqj9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=ho3SW2Fk; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="ho3SW2Fk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Q0V+bwE2MZPxe/mUdmO9X05LYA9fpfs7pu2kpKbb22s=; b=ho3SW2Fkv9S3TT+T3XSbTJmrj8
	DjPo+d7cSIr8K7mempih02oMWaPDSgwXEiJOGvaw8MnmdnJ9qavl8z8KD18+4JbWY+CHQNw7CGgXg
	hK0QuOJvVPT3zkruIfVGlSxxsUaYHn8pBFU906nblT3YDox+oFPiyxPd+N4iJmkf0kYm75XC5/4Hp
	HnhUpyjzwzmZ8JKlN/q8HCS9kXZHrNFhERCOYpS9S2Tt4PQczogPJn92Xd0FCOn0GHX1HtStW6h+e
	+uecjPjNuq1iWf0sC5UrShd91Gz4WAOIsbfU/hGa6OQULB4ObXkTrdu+PZKvq/0BOL37BC9JdRp1C
	6XF8B2fA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33466)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1s1Qx9-0003FJ-39;
	Mon, 29 Apr 2024 14:21:56 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1s1QxA-0000sV-OT; Mon, 29 Apr 2024 14:21:56 +0100
Date: Mon, 29 Apr 2024 14:21:56 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sami Tolvanen <samitolvanen@google.com>,
	Kees Cook <keescook@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH v8 0/9] CFI for ARM32 using LLVM
Message-ID: <Zi+e9M/f5b/Sto9H@shell.armlinux.org.uk>
References: <20240423-arm32-cfi-v8-0-08f10f5d9297@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240423-arm32-cfi-v8-0-08f10f5d9297@linaro.org>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

I've applied this to a separate branch, and it should be in
linux-next by tomorrow.

As mentioned today on a previous iteration of the patch series,
I'm not all that happy with the introduction of delay-inducing
branches to solve CFI issues especially on the early CPUs where
a branch causes the CPUs pipeline to be flushed - thus making
branches expensive.

Can we make these branches conditional on the use of CFI?

Didn't Ard mention there was a way to do this using symbol aliases?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
