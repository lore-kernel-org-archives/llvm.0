Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB0744C4E3;
	Tue, 28 Jul 2026 22:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785278490; cv=none; b=kIDocxDBIjgw/ZHPCGsuRX/b63kUkKHLWIkqvtVR1vcLxipjRLyPV4X8aZB++ZxS4KCE2dwb0QcWGYLnNm4XJ1CaVcxLQRn6d2icAf3ZpVAUAQAMs4TfwVhHayrDg98UvGHcfC0JrJVD0AjTDjdKARdAThD5vst4MHNEw3FmtMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785278490; c=relaxed/simple;
	bh=RSph9tDsdtx/Lt6KlWtiV5B9x9MHOM+1AM22fg5UVwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sy9zdSCEMCvBZNFVx9V3qunTh+D5XIt8+LLEUfr0yMzwOGs6TScYTGcUL5N3L5zO3/njLDWZMPJQ6L0B5W4pb8Zl8r3EzHUCVTrPJXKjHk/GHu/U03f11IjJXWatxDkZe1LmW4TLVfiUtVbTQ1mRslOGg1Yk9o+61UjiZDDq+oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Om1EvPUk; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Om1EvPUk"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id CDFD440E00C3;
	Tue, 28 Jul 2026 22:41:25 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id GMEi1m5IDPut; Tue, 28 Jul 2026 22:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1785278475; bh=dlx2On1I1uFaoQUFDDZWnZfII4ptJarMOuUPPOrgxb4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Om1EvPUks2lmrbVzD5tGaAHL1woB0hfrU3SVx1JdSwq+aAP+D34381sdqaiPgvE0h
	 761k5NRwLN+HJcGMAAqzVMIcnEFIhOkJ+5gAhEQzTah6SYq+eC37wkS8JiBdsDJM/g
	 vK8coDyiaq9DXl+TnOoicX2R2WTpTckcUr3GypjOWL66MJah/5cH69IfQyNyxtIFBW
	 2P4Vsv4cstbdUMP4Am5Fo9omE1J4RyP6gqxHVvIhThrEsvdMEeeI0xcbBG6B8T7cL8
	 zJW0+NgeS6wYwx9/kkXiE4KcdbWaopEgQVgAjPcC12w/nwZinUV3/uQ68qvJ5XGh07
	 mXMuaReEUtKuVX6vQEpDBK2NX2R70GVhti/EzDGFFnA0Pkf575E6m7jbe7EUBibVH9
	 o4MJwDnFvQayrbiOM+hK/87GsN+STTgUbaM5VtVSvwca+VoU/KBEcYBMgyN3gICcRK
	 x1HcPVdO/MfuE+MjOCYro59QqZcSncl/EHMtppAhFaMCID73fScvs8AJQGvi0vWPlX
	 Yo26BdVVCJ03zymxFXLvWIQ/W9ifUgjQeOwvWC+l6KZgaEqAes5xBvHtA7339BX169
	 FuBMc+2w4b50k09BK7Lemrazr83cPVGDcp3frnQDnJhVHDHS/ecIpVfnOnBv+KvNSX
	 9uNHa4kgythe8NTioca3EiU4=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 39DEE40E00E6;
	Tue, 28 Jul 2026 22:41:03 +0000 (UTC)
Date: Tue, 28 Jul 2026 15:40:59 -0700
From: Borislav Petkov <bp@alien8.de>
To: Rosen Penev <rosenp@gmail.com>
Cc: Frank Li <Frank.li@oss.nxp.com>, linux-edac@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>, Tony Luck <tony.luck@intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"open list:EDAC-FSL_DDR" <imx@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCH] EDAC: fsl_ddr: use devm_platform_ioremap_resource()
Message-ID: <20260728224059.GAamkv-4LJPspOw5ZV@fat_crate.local>
References: <20260714234609.902367-1-rosenp@gmail.com>
 <alhXciS9G_bGB2re@SMW015318>
 <20260719155822.GAalz0Hj3XT97KkPOk@fat_crate.local>
 <CAKxU2N-vMNR+ES2YYuJh+6XASmZ04cnFodb4kP4zRBW0mbEKaw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAKxU2N-vMNR+ES2YYuJh+6XASmZ04cnFodb4kP4zRBW0mbEKaw@mail.gmail.com>

On Tue, Jul 28, 2026 at 03:08:25PM -0700, Rosen Penev wrote:
> The unfortunate part of that is sashiko does not understand v2 patches
> and whatnot. Meaning it will always complain about things fixed in
> other patches.

That's fine as long as we've replied to the patches and said why it is ok. LLM
is just a tool, at least for now and how it is used with Sashiko.

What is more important here is finding real hw to test it on. I'm hoping Frank
on Cc will move...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
