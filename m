Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992D02D94A0
	for <llvm@lists.linux.dev>; Tue, 12 May 2026 19:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778612748; cv=none; b=FHV9psID+p/Zqpr43QPvVazIoQkKzMLJh8OWa+4zg49udJ83C87x2Uq/uw4y1E3VPaESnukedUwx4DgYQYKybH0vRZW/PnsReTUQ8ZqenH1JJnWHA4yMhkGO8npf88zlIaN8nafulnQJHz8kDVaEyTb78Ibu5CB/a3lJsZMqRkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778612748; c=relaxed/simple;
	bh=5K428X9dhidwu0Z6JmtnQhRR4g307EBZgpMMxIZxkYo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YS617dwFuJiEyhLxYQRunX5Wl2BNOIKYL2afkgEMUCa4PzzXkSk7G99CHeJ2b0VnDhU7XO+92bs7lHu0VimNNBv3OAFr4YtkYnd7rhlaHeV9VlbPC1sqJT1rnLNm5E7cO5K8R5Irmnlv/H29Xta5lMKzCD6JSTtsDj/lFCG20EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=Eg5eq0of; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="Eg5eq0of"
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <andreas@kemnade.info>)
	id 1wMsQK-0000000GAZZ-1qD4
	for llvm@lists.linux.dev;
	Tue, 12 May 2026 21:05:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=00u0fNz3bWpllwVWiXvs/q7EItAM6xFzqP7BO4pPgFg=; b=Eg5eq0ofQPoWkiwwJGo2qJSBCd
	+FeS7Xf4fNJv1sNiBgVfW6bunQxTcFYpdQMV1zsFhL49WeTt1MkBQv4KpmW5x1jXioE0f919m2VES
	9/YYdpJIhtswBJ2HOUfZzKBX0q6sPxstNKihRA3DH6mrK+O802RZE6Yxi6wegiiqDw0471Eododd3
	lqef7+ZDA84Esn9zfmqN0roJg8Ss6zLuaA20ozki5fpt3AdQLF8PHMH1uZ5fhcwRKfB47/GuI3x9P
	ZVbj2ihNSiMJEAmeAehCF8LqbNW5adZg1GsKHRS7XhmU5Wlh/A2cQpt6CjCbwqPpzZUNyu74+TNll
	2lPt4nhA==;
Date: Tue, 12 May 2026 21:05:27 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Mithil Bavishi <bavishimithil@gmail.com>, Aaro Koskinen
 <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>, Roger Quadros
 <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, Russell King
 <linux@armlinux.org.uk>, Sami Tolvanen <samitolvanen@google.com>, Kees Cook
 <kees@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: OMAP2+: Make OMAP4 finish_suspend callback
 CFI-safe
Message-ID: <20260512210527.02381e0e@kemnade.info>
In-Reply-To: <20260512135757.GB570003@ax162>
References: <20260512042341.1452-1-bavishimithil@gmail.com>
	<20260512073442.GA570003@ax162>
	<20260512100207.3d24837e@kemnade.info>
	<20260512135757.GB570003@ax162>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 12 May 2026 22:57:57 +0900
Nathan Chancellor <nathan@kernel.org> wrote:

> On Tue, May 12, 2026 at 10:02:07AM +0200, Andreas Kemnade wrote:
> > On Tue, 12 May 2026 16:34:42 +0900
> > Nathan Chancellor <nathan@kernel.org> wrote:
> >   
> > > On Tue, May 12, 2026 at 12:23:41AM -0400, Mithil Bavishi wrote:  
> > > > With CONFIG_CFI enabled, OMAP4 can trap in omap4_enter_lowpower()
> > > > because omap_pm_ops.finish_suspend points directly to the assembly
> > > > routine omap4_finish_suspend, which lacks the expected KCFI type
> > > > metadata.    
> > > 
> > > It sounds like omap4_finish_suspend() should be defined with
> > > SYM_TYPED_FUNC_START then? Is that the case for all of the other
> > > functions that are added to omap_pm_ops?
> > >   
> > omap_cpu_resume: the address is written to some cpu register and
> > on that way casted to u32. So therefore does not trigger CFI.
> > Same for secondary_startup which is also assembler code.
> > scu_prepare is C.
> > 
> > DO you have a pointer to any documentation:
> > :~/linux$ grep -R SYM_TYPED_FUNC_START Documentation/  
> 
> I don't think we have any formal documentation for SYM_TYPED_FUNC_START
> (it should probably be documented via kernel-doc?) but you can read the
> commit message of the change that added it for more information:
> 
>   e84e008e7b02 ("cfi: Add type helper macros")
> 
Ok, I found what is the missing piece of the puzzle in my head:
"
In order to make this easier, the compiler emits a
    __kcfi_typeid_<function> symbol for each address-taken function
    declaration in C, which contains the expected type identifier that
    we can refer to in assembly code.
"
So time to look into my backyard if anything more is there.

Regards,
Andreas
