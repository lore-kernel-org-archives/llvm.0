Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E252C39E9C8;
	Sun, 19 Jul 2026 15:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784476749; cv=none; b=I31ypUw2WSw9q/S/TiNM2sBHROEz6fDsAIIEW0H/O2PDqJu82gQ4XEqKX8zEoQbS9uVvC7kFUWFViGUW1GRwaSJH5oeCd4UMYeZZtWPT3HCTAtIfJjehAsKqUpfXFkejDTIFSb+UP2YQOtxdoqfJdBBiid+jF12S9E147h6peoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784476749; c=relaxed/simple;
	bh=2a8yZFeUetOinMs3hl11PE5Jz4kpfMi82yEofiBWI5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qiZG0hIzNsMhkEO/Q8+zzIpSIdU5zXjh6dN2F1agn2slDy34eEicCJWIWSyh1P+sBaNp+k0s2rnnE2vQtUMe41ZVeVEg86SHlMgOtwiKVHBOIYLh1FGIPTrqdbWs3m022VpiEjZq2ld04vtlLgUOiCJzN1ELr2UUOI4GX+1CnbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=bRX96lti; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="bRX96lti"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id C848B40E00E6;
	Sun, 19 Jul 2026 15:58:57 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id fpeTsoxIvlj8; Sun, 19 Jul 2026 15:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1784476727; bh=/9euEjjwpVwhNmG4Nz1yJBHOlsi3Oon+gwrcJ1j+6iA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bRX96ltiIwhMYoNksg+pbRpiMMl+S5STL+IL5pSc6xbf6M+x0AUAIJiy3n/vYGVSg
	 /EteLpwSBqGol83ZobC9bQpIfmEjSNPdqAWjcjURDEurA9LuClXA4TBxAp6GoYsG3N
	 FTo5arfBGY1pX0f8p1DsZK1mjeVxJ19hcvuxMDsE8KrzorKpqpIMtXywMTcShnGoSI
	 9YHRIc3QNReMmmrfQJuHFiFMJh0yKqY9cHA5dAZdPx+9ddqPibPD0IIEq7vYwjHulK
	 bEp3eP3XoVzmxjcckuy1ldGAUrDp77W5LkGZ3LP5vvpPxAFSATb63jiGn3ngmgw5Ma
	 olDqnZ3Ll2iHv+Pq3bG3P7bi1ZnqL/30i1Mm9VaEI8Sahkf40PFuLe9xbieVRJDPqZ
	 FRchq9FlTvwhymT1cxeaXz96y+OPSzcVRJaekr2nm5r+fFYsHAtZEciYT11x2ob/bP
	 TSEou8WmDjjH1B97PeIj9IT8sWSAq5XA7o+ioehMzuXhrWaOYGUkyGc3j5Px+aZm4e
	 +srpK/yz56f505+fur8o6s8EQzVn8q7ImbKwXECHzZlQQKVmz9M3nZ6PnTdo4I0P/L
	 TFFk8EZnwbGewt/ogD0KcP890Yhtdlo08NH0WH9mC+5hRW8KJPkK0mgz+c6cMw86eH
	 k1lGUq6kgrDmNnclGx8F3q9M=
Received: from stx.tnic (unknown [12.110.208.163])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 88DFF40E0140;
	Sun, 19 Jul 2026 15:58:34 +0000 (UTC)
Date: Sun, 19 Jul 2026 08:58:22 -0700
From: Borislav Petkov <bp@alien8.de>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Rosen Penev <rosenp@gmail.com>, linux-edac@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>, Tony Luck <tony.luck@intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"open list:EDAC-FSL_DDR" <imx@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCH] EDAC: fsl_ddr: use devm_platform_ioremap_resource()
Message-ID: <20260719155822.GAalz0Hj3XT97KkPOk@fat_crate.local>
References: <20260714234609.902367-1-rosenp@gmail.com>
 <alhXciS9G_bGB2re@SMW015318>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alhXciS9G_bGB2re@SMW015318>

On Wed, Jul 15, 2026 at 11:00:50PM -0500, Frank Li wrote:
> On Tue, Jul 14, 2026 at 04:46:09PM -0700, Rosen Penev wrote:
> > Replace the open-coded of_address_to_resource() plus devm_request_mem_region()
> > and devm_ioremap() sequence with devm_platform_ioremap_resource(), which folds
> > the resource lookup, region reservation and mapping into one step and returns
> > an ERR_PTR checked with IS_ERR()/PTR_ERR().
> >
> > Behaviorally equivalent with respect to region reservation: the driver
> > already reserved the region, so the non-overlapping reg requirement was
> > already satisfied. Drop the now-unused linux/of_address.h include.
> >
> > Built for arm64 (defconfig + CONFIG_EDAC_FSL_DDR) with LLVM=1;
> > drivers/edac/fsl_ddr_edac.o compiles cleanly.
> >
> > Assisted-by: opencode:hy3-free
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Sashiko caught a bunch of preexisting issues:

https://sashiko.dev/#/patchset/20260714234609.902367-1-rosenp%40gmail.com

Let's fix them first please.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
