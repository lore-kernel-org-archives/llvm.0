Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A16B4C62E
	for <llvm@lists.linux.dev>; Wed, 13 Nov 2024 14:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731507617; cv=none; b=p7+VOlplo7SZT7cHtg8wcz49sOKNoXcAt+r9fAXCeQgSBLMNMN0G/cdYO/u9p0ZLfs0RJPBO/WmhIOLKy/MXDC7zTXzuWjXj/7kePuUth2KPES1lSDMO4XqpYGrIMQO7WdlofHFiD9XF8YAgGBrohMKvZlFr8Zhh1DySFs2djjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731507617; c=relaxed/simple;
	bh=P17KMoRtkJg6aHvEyApGXy0PV005D3bHiugmndAKsZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rA3KK0eKgE02UA/OTcdNnu3dsDKFpWDGgnDrFD114HpHFjYRWsrk+gGaftFZxJw5sdoX2jBbDiGIxOUT1k0S19h7Y+zuzNEM3t8lB344rgeSSAzbGqJiG3phCPB9p2MXD48Sm8mx9Rm9uXnxaOgKYXNe7mAPZHHXQSss9x3lXzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=im73hmVV; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="im73hmVV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=SlB5MYusK8b1mv7/1MZmVvegYIaryfpg+zAbobQyH78=; b=im73hmVVpi6xpLao3e5pgmuxUK
	XZ6r0bFi2obo11fIc0c9c7wZh2EPJ+Lq/303PvQaydRbs02kSaAb46tnbBqmAGTcvaZTYrxNjvmmC
	ee493QwASJG+9BtQ29OtMyaVnCP82RBwhZ5TSU0+DV4MpiKdUZcjAuDtH7eajSNDOGgM0NUdxqr5o
	8rgsz/0/wEo5LWLoaiG2J5IE1A4hHGnqIgPS5ysFf3Ftl5BuVEwBoc3FEUINvmye3K7jDzfQHluGT
	wHa8Uiwp+OpjonVWAX9IMTaIt3d5vitS5bPhpSkvl+zVo/dtjZ+HEpSnN1jco1+XKw9FC1ps77wEZ
	Ors8NdYg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43462)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tBEE2-0006Mu-1i;
	Wed, 13 Nov 2024 14:20:07 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tBEDy-00006E-10;
	Wed, 13 Nov 2024 14:20:02 +0000
Date: Wed, 13 Nov 2024 14:20:02 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: kernel test robot <lkp@intel.com>, Melon Liu <melon1335@163.com>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [rmk:for-next 3/7] arch/arm/mm/ioremap.c:130:32: error: call to
 undeclared function 'kasan_mem_to_shadow'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <ZzS1ko8pWGvYj895@shell.armlinux.org.uk>
References: <202411130711.xfVEiMKn-lkp@intel.com>
 <CACRpkdYADg4fg2VgRxFBwp1STLbX062zjbZXQ9snOf_p6NvcEA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdYADg4fg2VgRxFBwp1STLbX062zjbZXQ9snOf_p6NvcEA@mail.gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Wed, Nov 13, 2024 at 01:34:34AM +0100, Linus Walleij wrote:
> On Wed, Nov 13, 2024 at 12:11 AM kernel test robot <lkp@intel.com> wrote:
> 
> > >> arch/arm/mm/ioremap.c:130:32: error: call to undeclared function 'kasan_mem_to_shadow'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
> >      130 |                 sync_pgds(mm, (unsigned long)kasan_mem_to_shadow(
> >          |                                              ^
> >    1 warning and 1 error generated.
> 
> I mentioned this in a comment to 9429/1 that it supercedes 9427/1 since the
> author didn't send a new version to solve this issue. Maybe I should have
> mailed some more...

Sorry, missed that comment.

> 9429/1, 9430/1 and 9431/1 can be applied cleanly in its place.

I initially applied all of them, deciding that 9427/1 was a fix and
the other three were development. On merging the two branches, the
conflicts looked horrible, so I dropped the "development" stuff rather
than the apparent "fix" patch, clearly I should've looked closer and
done the opposite.

Now corrected, assuming tonight's build is clean, no further action
should be required.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
