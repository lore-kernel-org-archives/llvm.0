Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7828C38CFE1
	for <llvm@lists.linux.dev>; Wed,  9 Sep 2026 07:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788940561; cv=none; b=niNU7xaoMDfyFXAmvdoDCeCYLJVowDYOk+QkuNkem8BoxpASO/Rg6xNaxXQnwa63Uad0R2LMHLackJs15sMCeD3iLHPBmbIujSmFEp2WMQF3ycE/HYB43oUdhBs+q/t4oBAg9sfia0Ux1i7eAwAPL0vt4af6EDUny0C9wqVvcP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788940561; c=relaxed/simple;
	bh=iYpWo+8WQvUGrE2cJ5v8R1Ujp+sJJyUbgDOvpVF/bt0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lBj68DAZkKXavDGNs+nCNQgp3CyBf+p7qZXdLoLDe0r6Fnhm9PEy8IXhOXrMxNDRE02F8IcxxYRAyg8pb77L9y37PcKeHnaTAb3tvgYQuDaQXGItbm94B6lq1Bhv79+yhAGE3bFeq7FkYP+9g7GZcS9uJcvT/ZPnMjzs8u+y6mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=tm2yfGKY; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="tm2yfGKY"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EB0FC1A1A7A;
	Wed,  9 Sep 2026 07:55:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BDF7A60448;
	Wed,  9 Sep 2026 07:55:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B78B611C7AF61;
	Wed,  9 Sep 2026 09:55:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788940555; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZtaMYrbc1LvJjOcu69HuQuW7Xr+njcmF/jzvYPSq8Gg=;
	b=tm2yfGKY4756Re7kHKVLGXd7MHDbPMEHG0xlUFEKSFKMxxg/xfDoVUaO8M1Fw9+V09CvxY
	ABB+yr6UzwiVQhGGPElyf7azyU+OpJVxD+K5vwVTaNJdf9jo71Oo8MjvbKl1BnfHX7fkpV
	EODCNiElCgl55LDlW020ZuU9QtM7W1PZRDIyn+mX+U9llf7aTyJ6ocjHg/1JWVCk0Rm+l+
	OmEf3U8wu7QeYR/PcARsb7DS2T7WcujuMtZrtuYSH+yWSVOSwj09RAKuBNJtdQ+aUiNmp2
	c7nzhDxLfw4AH4ooRiwRfvEwJ7rGtJmHshVpbYyV7MM3hd5Zp8c6ABz/c4VmDQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-mtd@lists.infradead.org, Rosen Penev <rosenp@gmail.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
In-Reply-To: <20260907004910.226013-1-rosenp@gmail.com>
References: <20260907004910.226013-1-rosenp@gmail.com>
Subject: Re: [PATCH] mtd: docg3: use devm_platform_ioremap_resource()
Message-Id: <178894055366.2043044.18327879742122474927.b4-ty@bootlin.com>
Date: Wed, 09 Sep 2026 09:55:53 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

On Sun, 06 Sep 2026 17:49:10 -0700, Rosen Penev wrote:
> Replace the open-coded platform_get_resource(IORESOURCE_MEM, 0) plus
> devm_ioremap() sequence with devm_platform_ioremap_resource(), which folds
> the resource lookup, region reservation and mapping into one step and
> returns an ERR_PTR checked with IS_ERR()/PTR_ERR().
> 
> The canonical docg3 register window is DOC_IOSPACE_SIZE (0x2000), which is
> the size any platform provides for this device, so mapping the full
> resource is equivalent to the previous fixed-size devm_ioremap().
> 
> [...]

Applied to mtd/next, thanks!

[1/1] mtd: docg3: use devm_platform_ioremap_resource()
      commit: 8fcbb04ee5152b303980b2b48d69c6f7f4094ca6

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

