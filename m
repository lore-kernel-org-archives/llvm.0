Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CAF288AD;
	Fri, 31 Jul 2026 00:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785456277; cv=none; b=nDHAfTwhmzwby+QTb28t06A2jhgEwQfUGVW14kcsP3brEmdN8tGCDTluaqV2WXHkAETf2d3bvm2Nw3E/ccuXF4c2hm7pgHq6K2djkowsHJPN5ksDDL2Yy6M6iaGwt/FHmEwE9zVDtQi//RyOy4FOdH6Mv9d8s0wDZZOdiAVYBOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785456277; c=relaxed/simple;
	bh=BzIBgxbId4MsXTp3dv2dAiso1jhBqfp0i9lwzXiJbF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X8i4nVQbOGRzjJEm5GWyUYX+Ivc0quAAfaPVAE17SwxQt8ofDPgiSVwevsH/ZsxPfAcImY9p3vZ4Nf6E+ouoTrYiRP1bIyaXam7vN7155sRsziMQpZHJ3JRz1c6umx6EncG02mDW86Lsk4QIspQ2QQlcWmeKoKAlVOeoNAHtcpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=lI7R3JIu; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="lI7R3JIu"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 1329340E00B8;
	Fri, 31 Jul 2026 00:04:34 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 0B5_xJzjBJdo; Fri, 31 Jul 2026 00:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1785456262; bh=WBuq/f+9nALLo4Zi7QAKrUaH/kj1W1dPJQbACcDyLnI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lI7R3JIuil/u8lKmq0FyrpCFZGnjZ8C6Cp+CjteON8sF5GrMva1VsxBMp17oyAPcZ
	 6+gj9MRMoGYX6irDLv9mVABWGzXg3bLw3H/zQH0tYkxKF6PJrudyDmTbsRG2qqbH82
	 PNFR5xHarTJxkgRe/jW0VmFiQUGj6HYebZEz5jwt469GYoYaRnQCMBb3Onrmunl3Mm
	 hdCtIQumSAe6D8D507AuiGp0usYbX9Rkp6Rl1DdNziW3SM1P6aioO2d8/kymZZacGk
	 UsbVHWECgLhNDgxLpWm72BsbHOJPLOc8X+C+gnXG8DJbXRg3oju/5PzyR1fwvQNZwW
	 GScFhFNdi76rNDSVJG2fGR+pkecjf6tH9odpVOBMvERSwWE7yDoaSJ0Ny2jHIUSimj
	 wrwTd2Le28GKesjjRxcleo2+LrtxvvDCukytKumsmMvDq2lFJSh3Vepc1CQf7H90zp
	 X53k9UrSR94eaOFBVORHJrNR0PfbO/OdGqjO/XfUGMotRg1G7SRVPXd2hkVNtmUEEn
	 1S2ghBrGQ4jKvLuYPezBTa1yevMnezmHYgZWnzvBDZAmm26ZL3V3LkZeW3bFWPD0FK
	 5oiU2FiqdhXnfj4n17/FEKnV0I4EQkvHyqjINR4O1cMDKNYYfR/v8ySouJXSDQ8a/j
	 U7Kxuq8OCw1caorc03eDvgDU=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 0016F40E01CE;
	Fri, 31 Jul 2026 00:04:09 +0000 (UTC)
Date: Thu, 30 Jul 2026 17:04:07 -0700
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
Message-ID: <20260731000407.GIamvmdwHRq_PSgyvc@fat_crate.local>
References: <20260714234609.902367-1-rosenp@gmail.com>
 <alhXciS9G_bGB2re@SMW015318>
 <20260719155822.GAalz0Hj3XT97KkPOk@fat_crate.local>
 <CAKxU2N-vMNR+ES2YYuJh+6XASmZ04cnFodb4kP4zRBW0mbEKaw@mail.gmail.com>
 <20260728224059.GAamkv-4LJPspOw5ZV@fat_crate.local>
 <amubjArdXOgTzNCX@SMW015318>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <amubjArdXOgTzNCX@SMW015318>

On Thu, Jul 30, 2026 at 01:44:28PM -0500, Frank Li wrote:
> On Tue, Jul 28, 2026 at 03:40:59PM -0700, Borislav Petkov wrote:
> > [You don't often get email from bp@alien8.de. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> >
> > On Tue, Jul 28, 2026 at 03:08:25PM -0700, Rosen Penev wrote:
> > > The unfortunate part of that is sashiko does not understand v2 patches
> > > and whatnot. Meaning it will always complain about things fixed in
> > > other patches.
> >
> > That's fine as long as we've replied to the patches and said why it is ok. LLM
> > is just a tool, at least for now and how it is used with Sashiko.
> >
> > What is more important here is finding real hw to test it on. I'm hoping Frank
> > on Cc will move...
> 
> Tested-by: Frank Li <Frank.Li@nxp.com>

Thanks. 

We have a bunch of Sashiko reported pre-existing issues:

https://sashiko.dev/#/patchset/20260714234609.902367-1-rosenp%40gmail.com

Who's taking care of those?

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
