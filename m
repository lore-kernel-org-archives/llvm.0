Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D8649550C
	for <llvm@lists.linux.dev>; Tue, 12 May 2026 08:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778574967; cv=none; b=jW6kg1+MdOPMQAbRr+eWlHs6dx7fzcir4MrDKjHr9wrAl8oCrdBHO1NgNwWikeCWbo1cVmiy/GpODKTI602UodMMFiRQm7Hxgy1FQ8LgOA2QsC7zpsKYnJasTc4yOAT41scc0SO+gu6zGP8ZDx3Gc+n661BgCt+XpQUtRbj2RLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778574967; c=relaxed/simple;
	bh=BN88OXqn/RZm+kW7bamY9IQhbkBmsNVwM82h2oVwq6g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e4rszNWJpVpA8idnNdRabrwL2f9J5W2fDBSEfw0bZEm99yq+Bpcm2surBMUsmFkNZKYeWL984socnGDcBAQywqWjjTY1l0n8jwYLNZ2P6Pif6sBIEYiDDVsln5L4vsTs+E1WLJCSuZYxSmWeehd9Batvx+7DtOibN138vKVPt4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=fqDO1IVa; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="fqDO1IVa"
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <andreas@kemnade.info>)
	id 1wMi5P-0000000G8Ve-43dZ
	for llvm@lists.linux.dev;
	Tue, 12 May 2026 10:03:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=StyVMsh38RgdBxuIvlVbMdxNYiH9g+lHhpF3I9+o/1M=; b=fqDO1IVaPCtQ3NRyAgL7Vn0eQO
	MiL1b+tLqQDPObZev8RnMhNjJVBQaSrr95YayUA0q+H7BHfDtCfuuYl7Hxhe9wo5CX3DJf2MchspW
	OjxoPZzaFIo684B+C/yiOoV8Dq1zS1zm/2JhMLgBGW2ae/QZmf5milNvRMCbmUjEtRAp36ZEXgvmf
	WlX+p9iLnN6s6b4jbdzUN1zk25RJtHIlbKESZyLVBo/XAB+mAVWbOxs0VMwLE7OoT+cH6M1E9+wPQ
	zr4izLHmMBKJ+mQUhKGaClRSjEY108sWnsbN4l3gWyxshaQPCBEdwuoSl+NcLVNTIta6gdn35Igtj
	5o/qZswA==;
Date: Tue, 12 May 2026 10:02:07 +0200
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
Message-ID: <20260512100207.3d24837e@kemnade.info>
In-Reply-To: <20260512073442.GA570003@ax162>
References: <20260512042341.1452-1-bavishimithil@gmail.com>
	<20260512073442.GA570003@ax162>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 12 May 2026 16:34:42 +0900
Nathan Chancellor <nathan@kernel.org> wrote:

> On Tue, May 12, 2026 at 12:23:41AM -0400, Mithil Bavishi wrote:
> > With CONFIG_CFI enabled, OMAP4 can trap in omap4_enter_lowpower()
> > because omap_pm_ops.finish_suspend points directly to the assembly
> > routine omap4_finish_suspend, which lacks the expected KCFI type
> > metadata.  
> 
> It sounds like omap4_finish_suspend() should be defined with
> SYM_TYPED_FUNC_START then? Is that the case for all of the other
> functions that are added to omap_pm_ops?
> 
omap_cpu_resume: the address is written to some cpu register and
on that way casted to u32. So therefore does not trigger CFI.
Same for secondary_startup which is also assembler code.
scu_prepare is C.

DO you have a pointer to any documentation:
:~/linux$ grep -R SYM_TYPED_FUNC_START Documentation/

Regards,
Andreas
