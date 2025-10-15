Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61362D061E
	for <llvm@lists.linux.dev>; Wed, 15 Oct 2025 14:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760539884; cv=none; b=EbCdN4q7VWsPPeRErkpRGn2J9Vbi9mMhBpO+2YotjSj7g310oIGx2Xd+Msmd7l6LTmXnTylhmqZeT5g3qbkgeeNlMb4irF9ZWGcWafkfkPwtmeDg/5RHqYPB9xtId6RVd2Wgki2dKyxWb7nPYS6XR9KMU5GgWFSMLCFmSN7ctwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760539884; c=relaxed/simple;
	bh=hrGvM3Qk7r7tukv0tdWGtDReqUMPUw8ee1FwVTWSb+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K7FLwg6HjbsIqp7QyrdZnazXoNxi4KRQSaYoBQdRUK/Iqhh1G7BpIMkgrtaNipq44qBvYD9DElIu/TFEB3o5PjoBAdKhXPq+TrfBY6hhsY7lgfQ4NVlcco5tyH8q3whGBQM1fCsYxNgBr9sY/glnNEx+VQSw4/DkCdlit+TQNUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=m59ayehg; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="m59ayehg"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-799572d92b0so88980746d6.3
        for <llvm@lists.linux.dev>; Wed, 15 Oct 2025 07:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1760539880; x=1761144680; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Adpa7m8fOG05p6QgITi5PnCHwpZCCsUy3a+V0Uam0mo=;
        b=m59ayehgdEELdzdxlAxW5cDkYf0anat7AQSIHt7584RLWboWy/OpAA5okL6C5otk8S
         sHDdlzQvS6vN9AhBKMdxV+VEHpE9/+VPQowVDKXILfA2J+eed4i5UPUChLOKNMDei8O3
         +JU8tcqSAde1psUKFJ3stSKKFnAudWj2vz7Gw7aMudsNai1GRmPPeT6pEN34SLsp32Uh
         RdWCSDF/nlGjw8oHgwSgyy9UnAvYf4XSY8A7YZw61HYKxbApXm++EBBITWhVRnb/LCPW
         K2i7kJfifEjznt0+PguxAfD/PvsabbndaWKoCjET3QPklsAodMojlhZvbbg6bStvywzb
         f/sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760539880; x=1761144680;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Adpa7m8fOG05p6QgITi5PnCHwpZCCsUy3a+V0Uam0mo=;
        b=gq2YhQKuFfeb1XivpgUtGlhhMu/hMHNByr+GuEDkcHNPZionz4Rg3aTn+GizYin351
         eKsOu3KXiMq61AXCUT0e6OWNPNGjU1sUuer8bAeGdePnKcGPYKMqeN7A9dnA8lcnHI+a
         1MBK40GthWWrFxfYSXu0QwEAEuSS0lSovCZgj1UMn1wcqAYGEFNuU7bEqYYJGYF/3MRI
         ikw2WPltx0jXLbLwvSbfV7gdLaqGgVvJdrL2o29YJ5kJtBlvPYhYBV39j2m6gWjEJZU5
         mRdh1Uv2OOKkZV71UWNveC0q2W7idNCYAlhdbKMVs+YdZs1EGb5h10yUTs6tdv3kpEpI
         Dh/A==
X-Forwarded-Encrypted: i=1; AJvYcCXOkonXL2mG4kV1oYE0yoXZx7lZwYX4wZPZRfrSu4ovJyzTO5mUCRVTM6O9jHJQ2iLmIJ3q@lists.linux.dev
X-Gm-Message-State: AOJu0YxUKIXrqxVoVrG8RK3CGDTU/ZeCUY/QNPXWnKWY97fWWe61TgrO
	Ja8dHeVjEDKUMAtd/eGcfdZCARZT56Utn/Lx2bo8YiXjgO9KIFpM7LfSjxdVuwJ+bA==
X-Gm-Gg: ASbGnctIyLC2Al7weUoKtVvYDdNaDXAPixRkQNFXp2bX8YvSq0MCJdBUbhHVmRdIG8L
	yWFvcyO4+wYD+wiRixMBZRmYYwAIMs3++bDWCrzsB5l9FQHTzG82vRGOkOCVtiyMtYhaAKT7A5O
	Jq4manPqou00JkuQwV6q5JtMeYrSp9GhPzZ8mae53kyw8mGScZ9ME+lGwCELJLJkvhCtx3EBcI3
	uz0WR9JBC8yeqHU7jN9DGbpeb+b+8L46y1yHw1CDbf630EeXfbPjD17VpXNO8Nvlzl9xKcgaYpO
	gQWuV2/3NXWQ4paBivIhHT0o6KeczCsUV44w63SS/XL+fFgfu1SESoxCLHnJlHWsN89TgzalE2n
	W5jIT7nQUV6CR2+WxsOAVa8siTH0KLpL1DDYRT/FBbZ3liSToGRJmbk+9QpExFopp1SH1bYW2ow
	GJUA==
X-Google-Smtp-Source: AGHT+IHgATM+vpR/CxE89ZGkxxcoAPFDIHN26iOy/FjOgPnA6lzy6iUTWGNa3baX21y+yQJqVKxzZg==
X-Received: by 2002:a05:6214:5083:b0:783:cc80:1770 with SMTP id 6a1803df08f44-87b2106d967mr418771056d6.25.1760539880497;
        Wed, 15 Oct 2025 07:51:20 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c012a79f9sm19380516d6.53.2025.10.15.07.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 07:51:19 -0700 (PDT)
Date: Wed, 15 Oct 2025 10:51:17 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] usb: uhci: Work around bogus clang shift overflow
 warning from DMA_BIT_MASK(64)
Message-ID: <a34eeced-c4f0-48de-8f9e-d78b50378101@rowland.harvard.edu>
References: <20251014-usb-uhci-avoid-bogus-clang-shift-warning-v1-1-826585eed055@kernel.org>
 <c0d1dc65-6f55-40b9-bbfa-09e8639a28e0@rowland.harvard.edu>
 <20251015031952.GA2975353@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015031952.GA2975353@ax162>

On Tue, Oct 14, 2025 at 08:19:52PM -0700, Nathan Chancellor wrote:
> On Tue, Oct 14, 2025 at 11:07:27PM -0400, Alan Stern wrote:
> > On Tue, Oct 14, 2025 at 04:38:19PM -0700, Nathan Chancellor wrote:
> > > After commit 18a9ec886d32 ("usb: uhci: Add Aspeed AST2700 support"),
> > > clang incorrectly warns:
> > > 
> > >   In file included from drivers/usb/host/uhci-hcd.c:855:
> > >   drivers/usb/host/uhci-platform.c:69:32: error: shift count >= width of type [-Werror,-Wshift-count-overflow]
> > >      69 | static const u64 dma_mask_64 = DMA_BIT_MASK(64);
> > >         |                                ^~~~~~~~~~~~~~~~
> > >   include/linux/dma-mapping.h:93:54: note: expanded from macro 'DMA_BIT_MASK'
> > >      93 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
> > >         |                                                      ^ ~~~
> > > 
> > > clang has a long outstanding and complicated problem [1] with generating
> > > a proper control flow graph at global scope, resulting in it being
> > > unable to understand that this shift can never happen due to the
> > > 'n == 64' check.
> > > 
> > > Restructure the code to do the DMA_BIT_MASK() assignments within
> > > uhci_hcd_platform_probe() (i.e., function scope) to avoid this global
> > > scope issue.
> > > 
> > > Closes: https://github.com/ClangBuiltLinux/linux/issues/2136
> > > Link: https://github.com/ClangBuiltLinux/linux/issues/92 [1]
> > > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > > ---
> > 
> > Do you think you could instead copy the approach used in:
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?id=274f2232a94f6ca626d60288044e13d9a58c7612
> > 
> > IMO it is cleaner, and it also moves the DMA_BIT_MASK() computations 
> > into a function scope.
> 
> Sure, would something like this be what you had in mind?
> 
> diff --git a/drivers/usb/host/uhci-platform.c b/drivers/usb/host/uhci-platform.c
> index 37607f985cc0..5e02f2ceafb6 100644
> --- a/drivers/usb/host/uhci-platform.c
> +++ b/drivers/usb/host/uhci-platform.c
> @@ -65,13 +65,10 @@ static const struct hc_driver uhci_platform_hc_driver = {
>  	.hub_control =		uhci_hub_control,
>  };
>  
> -static const u64 dma_mask_32 = DMA_BIT_MASK(32);
> -static const u64 dma_mask_64 = DMA_BIT_MASK(64);
> -
>  static int uhci_hcd_platform_probe(struct platform_device *pdev)
>  {
>  	struct device_node *np = pdev->dev.of_node;
> -	const u64 *dma_mask_ptr;
> +	bool dma_mask_64 = false;
>  	struct usb_hcd *hcd;
>  	struct uhci_hcd	*uhci;
>  	struct resource *res;
> @@ -85,11 +82,11 @@ static int uhci_hcd_platform_probe(struct platform_device *pdev)
>  	 * Since shared usb code relies on it, set it here for now.
>  	 * Once we have dma capability bindings this can go away.
>  	 */
> -	dma_mask_ptr = (u64 *)of_device_get_match_data(&pdev->dev);
> -	if (!dma_mask_ptr)
> -		dma_mask_ptr = &dma_mask_32;
> +	if (of_device_get_match_data(&pdev->dev))
> +		dma_mask_64 = true;
>  
> -	ret = dma_coerce_mask_and_coherent(&pdev->dev, *dma_mask_ptr);
> +	ret = dma_coerce_mask_and_coherent(&pdev->dev,
> +		dma_mask_64 ? DMA_BIT_MASK(64) : DMA_BIT_MASK(32));
>  	if (ret)
>  		return ret;
>  
> @@ -200,7 +197,7 @@ static void uhci_hcd_platform_shutdown(struct platform_device *op)
>  static const struct of_device_id platform_uhci_ids[] = {
>  	{ .compatible = "generic-uhci", },
>  	{ .compatible = "platform-uhci", },
> -	{ .compatible = "aspeed,ast2700-uhci", .data = &dma_mask_64},
> +	{ .compatible = "aspeed,ast2700-uhci", .data = (void *)1 },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, platform_uhci_ids);
> 
> The
> 
>   const struct of_device_id *match;
> 
>   match = of_match_device(dev->dev.driver->of_match_table, &dev->dev);
>   if (match && match->data)
> 
> part of the change you linked to is equivalent to
> 
>   if (of_device_get_match_data(&dev->dev))
> 
> if someone wanted to do a further clean up.

That's a small enough matter, we don't need to worry about it.

At any rate, yes, this is what I had in mind, thanks.  When you submit 
it, you may add:

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern
