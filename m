Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7981A0BF1;
	Fri, 31 Jul 2026 00:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785456583; cv=none; b=JVG6bj5ipo9ut4HMGgdNK21EJBj4hVQP7dFsEsKVu4/Pwbvrv8WlUEMGld0fg7N9m4nrxQlA6gvEYF7Nmo8nWRyDZ2mo5VnGYZk64yBRVo1uO+vunBSmcl/a6dT0DdR1flA/ExFtruoo3IsB43ErqffPhhSq65rkwpUaTwbFVmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785456583; c=relaxed/simple;
	bh=GKe8KMcBfKi9yq3nQNy75PmaRGDNOIQgeBU2D4squOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZVlT25BDoJ1g6361JJgnIyYX/i3FGx5wTrgwSPG8IxDweh2zLf/8HrmBVPW+EEhjnlhyq9dBeyngkNd9D92AQHjwSFbq6zvaeob/7oBgPhdmqID/v+5qL8++BjjZLrDkkaAtTCmf7Pjb2ZmnyGBVZBY03FS8LI+bbs077h7b0Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=N6GngwbY; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="N6GngwbY"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id E866E40E02B7;
	Fri, 31 Jul 2026 00:09:38 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id hMLnETdj4O5t; Fri, 31 Jul 2026 00:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1785456568; bh=75gnVvubIjZ/JcinfW6jurHPR5o9ZNDI0cPnaOl57CM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N6GngwbYy+rpHGZlVO2Cy5HvhA/j/50ITpOj956b+6A7vbkQGDD9p3NOEK5+VvNPg
	 ZdK8AatHfPAYZFXPN47xRrIjBabsoqOX01WbHrh146dLtNoBoH8jvE6nJPE9MPsftc
	 srxfaJxvBsVYdvCmOSrfVPXy0sV2aNTKtTtL7VwRSaBVkS2KhdGpJ4ZxFTZRpXI3Aj
	 EMNYeLEbDLDyA39PlpKwb9aOmoWggrAv+tuEN0Hky2P9epAHCrpsRgjGT2Uh7c8lJ9
	 fuOFVZbyzLWaNP/d4nraD3ykkXA1/IYJ67QqoqriTFnSzZ3gcdUIP0eJg8KsC8as10
	 aa/6go3ZFtBlPFQDTT2ujnJH5iBYstKiOzzoNtkOYP0ubYw3+3wmrsD6pl3quTWGIv
	 VxsFQL1oLjzsYlk6fEfm+RRKj1B5E5OvnLSVOmuqzqm6GZ/pFdhl9IKnPmUrkom+Lq
	 9vc1o2NfsQnMt0uRvUINcT5UDR3YvpxpCshR1AqtoSsQT0nYBXrYYdT5Vp3yE4bl9d
	 7Be6Wwx2hwYHAJiRYgpg2QOnhVO9LTCG3h5wAvXYCT3o4AlaKE+Grh62IM8eIB6nPy
	 M0kwIsyScWlGSUgJDpjPQkEFnNmvnoJSEHxnSQ3nxXMp0zuTf7moSklr9xTjTDSm5f
	 g3ZCcm3Ggwm6Mr7l28JlRiRA=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 40F7640E00B8;
	Fri, 31 Jul 2026 00:09:17 +0000 (UTC)
Date: Thu, 30 Jul 2026 17:09:14 -0700
From: Borislav Petkov <bp@alien8.de>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-edac@vger.kernel.org, Frank Li <Frank.Li@nxp.com>,
	Tony Luck <tony.luck@intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"open list:EDAC-FSL_DDR" <imx@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCH] EDAC: fsl_ddr: use devm_platform_ioremap_resource()
Message-ID: <20260731000914.GJamvnqpHP9L5b8s_h@fat_crate.local>
References: <20260714234609.902367-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260714234609.902367-1-rosenp@gmail.com>

On Tue, Jul 14, 2026 at 04:46:09PM -0700, Rosen Penev wrote:
> Subject: Re: [PATCH] EDAC: fsl_ddr: use devm_platform_ioremap_resource()

Before you send patches in the future, do:

git log -p drivers/edac/fsl_ddr_edac.c

and look at how things are formatted there. For example, the subject prefix
is:

EDAC/fsl_ddr: ...

and so on.

The EDAC tree uses the same rules as the tip tree, you might want to read them
before sending patches:

https://docs.kernel.org/process/maintainer-tip.html

> Replace the open-coded of_address_to_resource() plus devm_request_mem_region()
> and devm_ioremap() sequence with devm_platform_ioremap_resource(), which folds
> the resource lookup, region reservation and mapping into one step and returns
> an ERR_PTR checked with IS_ERR()/PTR_ERR().
> 
> Behaviorally equivalent with respect to region reservation: the driver
> already reserved the region, so the non-overlapping reg requirement was
> already satisfied. Drop the now-unused linux/of_address.h include.
> 
> Built for arm64 (defconfig + CONFIG_EDAC_FSL_DDR) with LLVM=1;
> drivers/edac/fsl_ddr_edac.o compiles cleanly.

Testing blurb belongs ...

> Assisted-by: opencode:hy3-free
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

... here, under the three "---" so that it doesn't land in the commit message.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
