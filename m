Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCC4ECA
	for <llvm@lists.linux.dev>; Thu, 17 Aug 2023 06:56:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B884AC433C8;
	Thu, 17 Aug 2023 06:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692255411;
	bh=JKi+meRqZX/8UsgXnMaQA/rgBXUj+9Xf7F21WE4jfi8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O1ZhxIhknpoHs6tOzMIpy2RDgtvvJBEtxMeyo4St7zs/Czf1JiK6YxyKSg97SlklO
	 oDKoEA588mGo8RWAatxMxA9KqFgIbLCaFCEjrw8987r01ydVlVf9dVdfO56j/2IhZe
	 gkkXT2H6PKRwMJ4+V+O9smk8R5TGauGe/fIX4l3cgNxdthZhtNNrjjDRyUsFIVG44v
	 4mPJwn6LikDx07xBBe9O9tNvgmSBor2w2rIOYKzdQmeT4QDVLwqPKPlUq3H83fm6p6
	 6LON+TZNSWhOQ27g2LeCkjeRUkpGWwDApGg8uGVm+EHa2Ufo7FujZUoafi10xqr1qG
	 M9XEhYlrt4MUg==
Date: Thu, 17 Aug 2023 12:26:41 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Justin Stitt <justinstitt@google.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] dmaengine: owl-dma: fix clang
 -Wvoid-pointer-to-enum-cast warning
Message-ID: <20230817065641.GA4864@thinkpad>
References: <20230816-void-drivers-dma-owl-dma-v1-1-a0a5e085e937@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230816-void-drivers-dma-owl-dma-v1-1-a0a5e085e937@google.com>

On Wed, Aug 16, 2023 at 08:12:50PM +0000, Justin Stitt wrote:
> When building with clang 18 I see the following warning:
> |       drivers/dma/owl-dma.c:1119:14: warning: cast to smaller integer type
> |       'enum owl_dma_id' from 'const void *' [-Wvoid-pointer-to-enum-cast]
> |        1119 | od->devid = (enum owl_dma_id)of_device_get_match_data(&pdev->dev);
> 
> This is due to the fact that `of_device_get_match_data()` returns a
> void* while `enum owl_dma_id` has the size of an int.
> 
> Cast result of `of_device_get_match_data()` to a uintptr_t to silence
> the above warning for clang builds using W=1
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/1910
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Justin Stitt <justinstitt@google.com>

Acked-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> ---
>  drivers/dma/owl-dma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/owl-dma.c b/drivers/dma/owl-dma.c
> index b6e0ac8314e5..f340a04579f4 100644
> --- a/drivers/dma/owl-dma.c
> +++ b/drivers/dma/owl-dma.c
> @@ -1116,7 +1116,7 @@ static int owl_dma_probe(struct platform_device *pdev)
>  	dev_info(&pdev->dev, "dma-channels %d, dma-requests %d\n",
>  		 nr_channels, nr_requests);
>  
> -	od->devid = (enum owl_dma_id)of_device_get_match_data(&pdev->dev);
> +	od->devid = (uintptr_t)of_device_get_match_data(&pdev->dev);
>  
>  	od->nr_pchans = nr_channels;
>  	od->nr_vchans = nr_requests;
> 
> ---
> base-commit: 2ccdd1b13c591d306f0401d98dedc4bdcd02b421
> change-id: 20230816-void-drivers-dma-owl-dma-41b95a098275
> 
> Best regards,
> --
> Justin Stitt <justinstitt@google.com>
> 

-- 
மணிவண்ணன் சதாசிவம்
