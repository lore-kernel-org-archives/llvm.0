Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7A8263F22
	for <llvm@lists.linux.dev>; Wed, 15 Oct 2025 03:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760497654; cv=none; b=kddQu3iYtU6EWUfGqtVlnBBg5px6p2woidT0G7nL2ui79MI7wAn5b1uuzgB1xyNrVJHN+wklziLX1bHrxkQpJm0U88oPcgZ24DIcmN0Mvcdl4IWkxI+cCWtb17DxHZt+QTs+0CoxCSzrzvvsGsXVpVqFc0QQTrinxP6YnaTQsno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760497654; c=relaxed/simple;
	bh=4FztB+wmWkCqTcyqk43FQ/ijvv8lF01IQlzMj1iMpxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uhKV7djHIVVE9fwHIyLrCzmqENuQrtVC/idStDAt1aXWV/dCmD7zc23eB+/cpnUqqACjYDUfOoAEZP8b/ANMoB1k1jU2te93KAD/Fy9V9MzMGYc71nwictl1Iq8UNUAlxQSggwu3u3EpCc+lhQ9mmVgjQih0wJ1I4OY4x+wmBvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=wjx0+CgN; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="wjx0+CgN"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-87be45cba29so47402326d6.2
        for <llvm@lists.linux.dev>; Tue, 14 Oct 2025 20:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1760497651; x=1761102451; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LYOi/uzG+pxWc7qB8Kx+PDOI9ywodBDgq0X5/pl/onc=;
        b=wjx0+CgNTYGfMNeZ28z13TJuuUKqShXy+VcBsw2UoaNcOlvxU0+GqfTk2lwhvx2/Hs
         9pXQR/1qhj39pNr2SVqVwe2lI1JT82dwumFSmXNpn8hNgkQuSik7x98dAQ9HiAPPult5
         81n4eJNtEnMnNkV9MTLMjTFC01WPq8/XD1Ou2gh6OTnfRqoD2jwpom/Elt93AWpLxn9z
         IX2ia9Mn160rFbjTOp6z/wdBuGn3hwWPOzqCIzIQdvmhd0/4qjBvT9hPheWEld3tYniI
         1spKFZvzgLc5iMPs/ekjJ8YIAkRRzr3BCF9TJLRw2fExcytvfqkHLC//BnbQQcAxi9HH
         1pFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760497651; x=1761102451;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LYOi/uzG+pxWc7qB8Kx+PDOI9ywodBDgq0X5/pl/onc=;
        b=lZwsAR1DBXRwJAkhOlvHVtPq/L1j1V0t1C59Q94TfENC5HSbWNpazikMGd6N+csNc0
         0Ryf/mhUTPVBvdWREualfPfDsH8WCj1nfggvbV9AT3EPzomjOxUXkwzpC2uEaixMDg4+
         cyu9k+Rb45U3hXtAAN/ySWCqHbLq01s7sWt2+TxN8c5tCSCrmfvHaCSp5pXSjNqdecH+
         t9riWp/Q8oV1HmfIFgdeWERij0/r8UZsqtzqWPLgbprgSo9Cg/Ul/FdaNG8jPk9h8K0j
         UjIQfPgpoJD5TtOdnlRPFiIzEY/wQDsoVM0SeKAeTYC1gdzmDdf5hAa+H8yZLukBVc6B
         Z38g==
X-Forwarded-Encrypted: i=1; AJvYcCVfkGb2SlC3FwmxrN6W+HsjQjv3yaK72h6Swtx3zpnJXRQAR0l6q8LUQqJ52QgLDu4t3rM1@lists.linux.dev
X-Gm-Message-State: AOJu0Yxc/KwWW0y/Sp0e7tTNQuKGX4uhobn6PHFm2Q86Huawtsg3ye31
	OgHNdbK+8TMQZzxQ8FqPMolbWL44Cu+j6At1ygFL6I0gx0mlCkS5fi0HOc4mj07oyg==
X-Gm-Gg: ASbGnctDQrLEG525ArCGr/g+6cvUfIzRYSaWfv8+Ei1Ur3Fcw8FaYUSdpAR8IurEXuV
	Lmmw4+s/UMXFdlVkpnk2XbKg3otseULgtRszJD7BBV1CaZO271GZ3lkY/NZp4BYgPgfdDmvIEPk
	CRB/n3l84Lz16KozfqTXQ+UvrwZzB6mV/wWKYWsXegwILEi1/Sk6zcztcRWQkfSEggsTs+7IlAk
	Cc7J3rfCb87X9G0ZooicpXiQkWIkpbEIihACzHV8f0a1VzmwmDPzbi6FvFOjVvHDr8aImkzfmKF
	y+77rgLPEcFMsIoeMuHnP87aKHWr777LDPYjUoRbccVHEm5xz4+oM0DNZWhJqrQdPdRsCgjpLpW
	NQN0Iu1bsLp7ZKn62PnmjfAnn/M9Cwr6C2+HatHhvlW6yFZ3d
X-Google-Smtp-Source: AGHT+IFAjPLGiMuXqey8nUwdA4Iw0xkYkiAWc5b2GEtlEYT/1lGTfUT34pPAOluVQ9gpFjwEo2ePNQ==
X-Received: by 2002:a05:6214:2121:b0:782:3caf:668e with SMTP id 6a1803df08f44-87b2efa9a8fmr314904506d6.40.1760497651363;
        Tue, 14 Oct 2025 20:07:31 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::9c4])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c012b153dsm9788976d6.57.2025.10.14.20.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 20:07:30 -0700 (PDT)
Date: Tue, 14 Oct 2025 23:07:27 -0400
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
Message-ID: <c0d1dc65-6f55-40b9-bbfa-09e8639a28e0@rowland.harvard.edu>
References: <20251014-usb-uhci-avoid-bogus-clang-shift-warning-v1-1-826585eed055@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014-usb-uhci-avoid-bogus-clang-shift-warning-v1-1-826585eed055@kernel.org>

On Tue, Oct 14, 2025 at 04:38:19PM -0700, Nathan Chancellor wrote:
> After commit 18a9ec886d32 ("usb: uhci: Add Aspeed AST2700 support"),
> clang incorrectly warns:
> 
>   In file included from drivers/usb/host/uhci-hcd.c:855:
>   drivers/usb/host/uhci-platform.c:69:32: error: shift count >= width of type [-Werror,-Wshift-count-overflow]
>      69 | static const u64 dma_mask_64 = DMA_BIT_MASK(64);
>         |                                ^~~~~~~~~~~~~~~~
>   include/linux/dma-mapping.h:93:54: note: expanded from macro 'DMA_BIT_MASK'
>      93 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
>         |                                                      ^ ~~~
> 
> clang has a long outstanding and complicated problem [1] with generating
> a proper control flow graph at global scope, resulting in it being
> unable to understand that this shift can never happen due to the
> 'n == 64' check.
> 
> Restructure the code to do the DMA_BIT_MASK() assignments within
> uhci_hcd_platform_probe() (i.e., function scope) to avoid this global
> scope issue.
> 
> Closes: https://github.com/ClangBuiltLinux/linux/issues/2136
> Link: https://github.com/ClangBuiltLinux/linux/issues/92 [1]
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---

Do you think you could instead copy the approach used in:

https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?id=274f2232a94f6ca626d60288044e13d9a58c7612

IMO it is cleaner, and it also moves the DMA_BIT_MASK() computations 
into a function scope.

Alan Stern

>  drivers/usb/host/uhci-platform.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/host/uhci-platform.c b/drivers/usb/host/uhci-platform.c
> index 37607f985cc0..f532d3a0acbf 100644
> --- a/drivers/usb/host/uhci-platform.c
> +++ b/drivers/usb/host/uhci-platform.c
> @@ -65,16 +65,16 @@ static const struct hc_driver uhci_platform_hc_driver = {
>  	.hub_control =		uhci_hub_control,
>  };
>  
> -static const u64 dma_mask_32 = DMA_BIT_MASK(32);
> -static const u64 dma_mask_64 = DMA_BIT_MASK(64);
> +static const bool use_dma_mask_64 = true;
>  
>  static int uhci_hcd_platform_probe(struct platform_device *pdev)
>  {
>  	struct device_node *np = pdev->dev.of_node;
> -	const u64 *dma_mask_ptr;
> +	u64 dma_mask = DMA_BIT_MASK(32);
>  	struct usb_hcd *hcd;
>  	struct uhci_hcd	*uhci;
>  	struct resource *res;
> +	const bool *of_data;
>  	int ret;
>  
>  	if (usb_disabled())
> @@ -85,11 +85,11 @@ static int uhci_hcd_platform_probe(struct platform_device *pdev)
>  	 * Since shared usb code relies on it, set it here for now.
>  	 * Once we have dma capability bindings this can go away.
>  	 */
> -	dma_mask_ptr = (u64 *)of_device_get_match_data(&pdev->dev);
> -	if (!dma_mask_ptr)
> -		dma_mask_ptr = &dma_mask_32;
> +	of_data = of_device_get_match_data(&pdev->dev);
> +	if (of_data && *of_data == use_dma_mask_64)
> +		dma_mask = DMA_BIT_MASK(64);
>  
> -	ret = dma_coerce_mask_and_coherent(&pdev->dev, *dma_mask_ptr);
> +	ret = dma_coerce_mask_and_coherent(&pdev->dev, dma_mask);
>  	if (ret)
>  		return ret;
>  
> @@ -200,7 +200,7 @@ static void uhci_hcd_platform_shutdown(struct platform_device *op)
>  static const struct of_device_id platform_uhci_ids[] = {
>  	{ .compatible = "generic-uhci", },
>  	{ .compatible = "platform-uhci", },
> -	{ .compatible = "aspeed,ast2700-uhci", .data = &dma_mask_64},
> +	{ .compatible = "aspeed,ast2700-uhci", .data = &use_dma_mask_64 },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, platform_uhci_ids);
> 
> ---
> base-commit: 877c80dfbf788e57a3338627899033b7007037ee
> change-id: 20251014-usb-uhci-avoid-bogus-clang-shift-warning-a80166a24472
> 
> Best regards,
> --  
> Nathan Chancellor <nathan@kernel.org>
> 
