Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A31AFE6;
	Tue, 18 Apr 2023 18:44:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF325C433EF;
	Tue, 18 Apr 2023 18:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681843461;
	bh=X2ERJkOfj4Ymgygl/bkydbPat6Dfd2beI4YGErqCKIg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t9boim9md6ZCkye7g25ZLUrjEw69KiRT0yprkYF4W0YGIZaXtRyEX8WRYoqRyh6T/
	 atDIyHxDbpnCI7WGunN10OfAuXHCMWcWi0fzdmNcvPpv0+QtKqy8Z8GCOhQQo9Qajf
	 0VtYsKrh+88G7OzyVpV+J/NNPHcbctd9KfI4TD+vlIOS4vcgfzvFOKIe/1lgoSu4Ew
	 SWMia9k6NAEhDX5HQYOJfEG2bla+26LpJsviS//U78f4ieJ28jUVvtSr6erFEBshuK
	 eROBigRPq7FPCyov9JNyohTCjFrwWYuFAI4FMl9opFuJHZEEZNZ/O0J0NOumO7hCk6
	 7LJ5lnFj8ujXQ==
Date: Tue, 18 Apr 2023 11:44:19 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	llvm@lists.linux.dev
Subject: Re: [PATCH] staging: vchiq_arm: Make vchiq_platform_init() static
Message-ID: <20230418184419.GB2635379@dev-arch.thelio-3990X>
References: <20230418-vchiq_platform_init-static-v1-1-3c38ba81bc66@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230418-vchiq_platform_init-static-v1-1-3c38ba81bc66@kernel.org>

On Tue, Apr 18, 2023 at 01:23:11PM +0200, Simon Horman wrote:
> vchiq_platform_init() is only used in this file so it can be static.
> 
> clang-16 with W=1 reports:
> 
>  drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:465:5: error: no previous prototype for function 'vchiq_platform_init' [-Werror,-Wmissing-prototypes]
>  int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state *state)
>      ^
>  drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:465:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
> 
> Signed-off-by: Simon Horman <horms@kernel.org>

Introduced by commit 89cc4218f640 ("staging: vchiq_arm: drop unnecessary
declarations"), not sure it is worth a fixes tag since it is a W=1
warning.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index 40dd62cf7399..59312b9f2058 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -462,7 +462,8 @@ free_pagelist(struct vchiq_instance *instance, struct vchiq_pagelist_info *pagel
>  	cleanup_pagelistinfo(instance, pagelistinfo);
>  }
>  
> -int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state *state)
> +static int
> +vchiq_platform_init(struct platform_device *pdev, struct vchiq_state *state)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct vchiq_drvdata *drvdata = platform_get_drvdata(pdev);
> 
