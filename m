Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8A33E0245;
	Fri, 31 Jul 2026 23:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785540052; cv=none; b=GUUj25FvOjbkzMu6MpoIVSSJUCk9WQ2dY5eoiqe9MAu2IHmJ8Gq0JFhQ4ptgj5DmJx5oya7r7G3KXVMBMWrYBjar3OAfOLCgPDCUdg6zp/5XCMeQXzPDGlvAAmF9qBEs7MmXLYU5yCPQK7JhMCnYfn8vo5k3Igz1+DuUOODqP2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785540052; c=relaxed/simple;
	bh=U/9Yv45n+yTl+HXiF4bKi1PnabpimsQQpbyopaFT01Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NyLxVlblne9ZpKN3L/wUXC+qDLkk9OBEfBhZ+8vXsDVhE5xzKbDMTnknzoLbuHm35U58jkJkGTpyW0Jts2rj2NmsbMYf14yK5da3dRD7e0aIPP4WNH+hot1XGXiOsE0RBgNDZbxWWHX2nYVJbImFkQ59p0K3OwmTjm9pTMjJsPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=g5+AwHmF; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="g5+AwHmF"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id F1F9040E00B8;
	Fri, 31 Jul 2026 23:20:41 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id sJzj9oJgD8z3; Fri, 31 Jul 2026 23:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1785540032; bh=nE/loPIfIGHulK7EYK3oGTaS2BuMx1WLwvyaaTRjU+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g5+AwHmFTIgT2cGV3dieb9WNSyV1UY9mk6jR3bOhJxbPK023qqngYRoaLQCDgO34g
	 yYTCY92RLYxLfShKanIwbw7UjaJyrqkk2wfj2d7ztnJvjhhUegDR290/PitBRCCN+K
	 UcbE0IaheG1pC0ZpUVgbA4Von0sj2JB2TsMUV1UroZAZEPTgQjLdouu4ExcXyfe6FW
	 2v/eacsoq4qMQouvD2iFVVWSYl4ZlNbTf+sFkvpbz6z+9aoHOHPfXzF5/qRoBo3cgv
	 Kvzd6PWLz1jAp+ImYoRFGfh1xhrNy1Fg3WBOpnu7BFHdy5NhgJ6SSA+QnXpO6rhokw
	 m91O6ud4xI+td6EHDfvcqADdVlsFP5hEmFVUP8h/PO20aTD6/z/F3lwauo1U2aMRW/
	 19OHb/7b7JlWMzBmG922OelsISJSPRX4JbH4feXuM4OiQInEWN0XUksYXq4f0jRjAJ
	 TNCu7FmT54wXt+xPtPscyBTJMLVQeUcrHMnLaS/Cj+CUHyL9NkgLtHKe1E6l/IWJHG
	 MKQ8dusFzuFVQsfybTxPVytgOAEqHmr9rvwQjPq0n1yd/WvBkueJaWaAloCm3DWYC5
	 zmWzqzgQ1HqAZweYC4dSHHGQj1td6OEbkq4ZPqy3pUVgrwhF3JY3KZ+7eTh8m+QJIq
	 kc/6Md5KSkvDUqslXEtH2IuM=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 5284240E0140;
	Fri, 31 Jul 2026 23:20:19 +0000 (UTC)
Date: Fri, 31 Jul 2026 16:20:15 -0700
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
Message-ID: <20260731232015.GDam0trw0zPrA7pw_3@fat_crate.local>
References: <20260714234609.902367-1-rosenp@gmail.com>
 <alhXciS9G_bGB2re@SMW015318>
 <20260719155822.GAalz0Hj3XT97KkPOk@fat_crate.local>
 <CAKxU2N-vMNR+ES2YYuJh+6XASmZ04cnFodb4kP4zRBW0mbEKaw@mail.gmail.com>
 <20260728224059.GAamkv-4LJPspOw5ZV@fat_crate.local>
 <amubjArdXOgTzNCX@SMW015318>
 <20260731000407.GIamvmdwHRq_PSgyvc@fat_crate.local>
 <amy45S6tBC4CjdWa@SMW015318>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <amy45S6tBC4CjdWa@SMW015318>

On Fri, Jul 31, 2026 at 10:01:57AM -0500, Frank Li wrote:
> There are too many pre-existing issues at recent review, we are trying to
> clean up these, but it takes time. I am not sure this driver is in the front
> of queue.
> 
> But I help will review if I see these patches.

Right, I doubt that anyone would jump at fixing those but we'll see. And yes,
I'd appreciate review and testing.

As to fixing those - I'll simply stop taking any new features to the driver
until issues are fixed or addressed or commented on and hopefully, with a team
effort, we'll get them sorted out.

:-)

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
