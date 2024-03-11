Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC29818659
	for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 09:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710149961; cv=none; b=T5SObqp7OJLg2nJgHMut1dPPLzBwUse1uzwZz+2Qmy0ACQHvFFweUWJuyjSKlZYWwi/b8V3WOJHdgMRMhN7eAVP0fgCxt8P+vcu7oSHbNn/IpMXyWqO6tQlBwy7r+maGAyAUKbW89K3ZG6lCJ7tatP3pFtocrt31EwNUg0ruSFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710149961; c=relaxed/simple;
	bh=VwK3dR3kU+8FFqRcu4bOh78ZHsjymZtoQbK+TYTYwgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=seuVqPyplY+htQLz8EV8G5mk3ALvnuheZAq4mlNqiQq+K/O6ORnJDEdaHtv0HpuqqtTAoMo8OlZTtZnSgZ4Il/R6TrZMtE/lC4RqS+vdrMOUkSQumPH5FO7/gfcjhO/URe8FetAAejNMJIMWlyJYCu8MHu4Dmup+quED5nwT9mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=UZ0P4Az1; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="UZ0P4Az1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=uleLxUZP0z3JKB/D6daaot+Oq/NjX/J1iFMN0XKrvo4=; b=UZ0P4Az1JYP/RhKZLlC2Jryd5p
	BvQroATEPiXsbGQkVFqe0anDGTp4rF7Z8eivjjwM7cFehVaei7/Zx/HDTWBMi4BGMPL7RyHNzsIIv
	euLDiDdPM6k2UjRu81TZUZ2ZxcJQmVQ38fxNdsa12ILSYYEXvq8CNmLuM/jyxGJf5XoYcQ148hndG
	fJHOcnB9zlsz9WUo1Iy++oieL+PKpxR8Wi//bt27FyFVjiQ384fCjR4Kotd+T7AtIwrQj5JrvBtYg
	RAwu969jqrWIpECJStQI25AEv5FXDjdggePaRCpYiwVbTwF1F1sfR6IKqCqNo9WWIOv0s/nEotihd
	Nyw2DKKg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54866)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rjc7b-00053s-1v;
	Mon, 11 Mar 2024 09:39:03 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rjc7Z-0002Vd-HD; Mon, 11 Mar 2024 09:39:01 +0000
Date: Mon, 11 Mar 2024 09:39:01 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sami Tolvanen <samitolvanen@google.com>,
	Kees Cook <keescook@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH v3 2/9] ARM: tlbflush: Make TLB flushes into static
 inlines
Message-ID: <Ze7RNalwiZbceFxX@shell.armlinux.org.uk>
References: <20240311-arm32-cfi-v3-0-224a0f0a45c2@linaro.org>
 <20240311-arm32-cfi-v3-2-224a0f0a45c2@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240311-arm32-cfi-v3-2-224a0f0a45c2@linaro.org>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Mon, Mar 11, 2024 at 10:15:39AM +0100, Linus Walleij wrote:
> Instead of just using defines to define the TLB flush functions,
> use static inlines.
> 
> This has the upside that we can tag those as __nocfi so we can
> execute a CFI-enabled kernel.

Why? This seems to be brain dead.

Why can't CLANG cope with directly calling e.g.
cpu_tlb.flush_user_range? Why does it need a static function to do
exactly the same as the macro does?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
