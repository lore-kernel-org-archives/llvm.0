Received: from wfout8-smtp.messagingengine.com (wfout8-smtp.messagingengine.com [64.147.123.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A5A1865C
	for <llvm@lists.linux.dev>; Mon, 22 Apr 2024 06:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713765624; cv=none; b=Kuis0VwG34dJW6EPPjU+mOlzNqxW3EZ7eIwdZskC+qr5Ih0S5ltPXmDUklEGkr/EXOfugD15lld45c0WPdIIuqrKY+oolYbPvsJZL22CDWV0JaWn/p6wvGgoSjehjHhbzGVG/zrO/WRmL0z5QAEdh69BuYrykFlpt+K1ZvkTiS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713765624; c=relaxed/simple;
	bh=fntBX7jG73XROJLdtV1h5hQLpcafzN9e7OJLuEDtd8g=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=tgpM8q67OGlsWNn/QOFkcSxP0dOxz+M+vDNEqKx/ocwAxeC7I4AjMjLArPlRRRZU1Q23yGY3f1yV3am78IqWBeUdmYlIma1F+x937IwgMXnJqSzVZwaRe8g6iSGX7dmT8WPCcTH46Q/oyrkdtT7qhRfrT7BpCRHxI9fe5bhayjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=GgqOQfjc; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=UbSK8AXY; arc=none smtp.client-ip=64.147.123.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="GgqOQfjc";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UbSK8AXY"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.west.internal (Postfix) with ESMTP id 36DE21C0012A;
	Mon, 22 Apr 2024 02:00:20 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Mon, 22 Apr 2024 02:00:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1713765619; x=1713852019; bh=jlTDzABU5z
	cPj3xza1UZisDPCiNpKwgpkl8MjcwAbtQ=; b=GgqOQfjcpJZKFpgLgnWQYgtVne
	DoBj2Pi2v7umYbtLR4hbnKvD0fiQvVByEs8OOmBQN58cWtl6LEWZz/T2IhHdhS7X
	djpSq6cneqZwW//OI0vmgBDX60aJK1gxb9hmHFeo5SpvaMxyKJI3NEAnONEwLzAR
	aiRXY2/wnWZMcwebny674V02UxtIKYG1tC3vwEB9JMEo4xYW+DBCRU6HdTEKdix/
	PDRY/DZxMC8cfyxnzn249CCUDIszstMGoJbhP5G5wIjdy7te1ZcLnaN/XPpjeC1v
	ptgXz9/4LtRITz7I9zfBkFiMlu1CjUqlHWbdRpvFiSECD/5/qi/ADaCWzbYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1713765619; x=1713852019; bh=jlTDzABU5zcPj3xza1UZisDPCiNp
	Kwgpkl8MjcwAbtQ=; b=UbSK8AXY+Q6/iMnyeLcqhWWTQNtvc2QXqg0JEgNGzlKR
	94c9IvAHI2VA8XpKRVxlvrvuZ4nCoBJlmQYrqCx4qwFnTzNw5S6Yzd+TDqTrHAOY
	cG+rVjhWP+UaW0BDK9gr6ZpP/X/F1bxZAAHnaPW0fuejiZUKQDT0vx7WrgkDxaBl
	N15WSrwERt/hNWizltGass0Nx9HWvR/0sVdFDW2RodzsOIhlEfDynnhEbPPdHsOp
	y8Y/0mh06f4CRav6OGDrfxZMUxJMmU7og75a+II59GblZCtjh4+Hbb+pdjx/pIZO
	i5RhosyD9tn13aCuJTTA+Q96Jl1ssbjgth3oGcbSBA==
X-ME-Sender: <xms:8_wlZljDwOpTIqPKzbQjjBgYgJFgLXp5S0mcjhMoSUSDBfcMfyDIig>
    <xme:8_wlZqBYqtA97HyNrGtRrTfI0p_D2_ozyZ8gtBiPlBpvkNgNQmcKosvL5p7lf6q4V
    y26RVdIyxaHb7wcO_Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudekkedguddtudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:8_wlZlHUB0-SrKuvoA3yC0rulbq269hM2jX87szHmpm41R-b0Ol6WQ>
    <xmx:8_wlZqSYpeycPH5tXRoOZsjtgp0FMkYjEjr2B5KPJHNopZN0wN72DQ>
    <xmx:8_wlZiwaGbWHWNe57tXO_Khnl1UL7neKACUd5jedCeMJVLQlvKsc8g>
    <xmx:8_wlZg5JqnIDQgQs3N353to2xd93scVeGRv3OWBNClEjBI9jkzoL0Q>
    <xmx:8_wlZhlzCO3_Mr330VUkyW6TkHKTSLwnP8a8JSq42Bv1w47NCooTCdd0>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 243DEB6008D; Mon, 22 Apr 2024 02:00:19 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-379-gabd37849b7-fm-20240408.001-gabd37849
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <88672789-9e23-4310-9315-9659d661d1d4@app.fastmail.com>
In-Reply-To: <20240421-arm32-cfi-v7-7-6e132a948cc8@linaro.org>
References: <20240421-arm32-cfi-v7-0-6e132a948cc8@linaro.org>
 <20240421-arm32-cfi-v7-7-6e132a948cc8@linaro.org>
Date: Mon, 22 Apr 2024 08:00:18 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Walleij" <linus.walleij@linaro.org>,
 "Russell King" <linux@armlinux.org.uk>,
 "Sami Tolvanen" <samitolvanen@google.com>,
 "Kees Cook" <keescook@chromium.org>, "Nathan Chancellor" <nathan@kernel.org>,
 "Nick Desaulniers" <ndesaulniers@google.com>,
 "Ard Biesheuvel" <ardb@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH v7 07/11] ARM: mm: Type-annotate all per-processor assembly
 routines
Content-Type: text/plain

On Sun, Apr 21, 2024, at 20:28, Linus Walleij wrote:
> Type tag the remaining per-processor assembly using the CFI
> symbol macros, in addition to those that were previously tagged
> for cache maintenance calls.
>
> This will be used to finally provide proper C prototypes for
> all these calls as well so that CFI can be made to work.
>
> Tested-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

The patch looks fine to me:

Acked-by: Arnd Bergmann <arnd@arndb.de>

> ---
>  arch/arm/mm/proc-arm1020.S   | 24 ++++++++++------
>  arch/arm/mm/proc-arm1020e.S  | 24 ++++++++++------
>  arch/arm/mm/proc-arm1022.S   | 24 ++++++++++------
>  arch/arm/mm/proc-arm1026.S   | 24 ++++++++++------
>  arch/arm/mm/proc-arm720.S    | 25 +++++++++++------
>  arch/arm/mm/proc-arm740.S    | 26 ++++++++++++-----
>  arch/arm/mm/proc-arm7tdmi.S  | 34 +++++++++++++++--------
>  arch/arm/mm/proc-arm920.S    | 31 ++++++++++++---------
>  arch/arm/mm/proc-arm922.S    | 23 +++++++++------
>  arch/arm/mm/proc-arm925.S    | 22 +++++++++------
>  arch/arm/mm/proc-arm926.S    | 31 +++++++++++++--------
>  arch/arm/mm/proc-arm940.S    | 21 +++++++++-----
>  arch/arm/mm/proc-arm946.S    | 21 +++++++++-----
>  arch/arm/mm/proc-arm9tdmi.S  | 26 ++++++++++++-----

I wonder if we should use the opportunity to clean out the
unused cores. Most of the above are not part of any SoC
in the kernel, the only ones that are actually used are
arm720 and arm92x, the arm10 variants are supported by
integrator but that is not really useful by itself.

       Arnd
