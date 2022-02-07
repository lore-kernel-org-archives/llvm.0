Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB4A2F24
	for <llvm@lists.linux.dev>; Mon,  7 Feb 2022 01:37:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58E41C340E9;
	Mon,  7 Feb 2022 01:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644197869;
	bh=9I+whS5koYY+pxEubsRWG77KrwVlDeIlbrZ3BX5fbVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IEKb+F95sAcz7UK/L0CLOnWToa1t+elpe2x58gm1Qgq8wV0/6oDKJlljse99ougw7
	 m7YqacuOHmcXis0iAwnfpT5yTiQiNlQ9W/Qf7oBTM9hCvs57b1kTSZhOujOBmkNzYI
	 M6YiKxvzCEf3Brs32KHrSrI8FofoUlYAbwyRBVc61QMX2dba0xzNfBT7eOisCMFGLG
	 BMFBM+lXAbehOHojCm/Y3syut7N+6QDA+83U/RsvAddZlRrAl+swQ7SK+rG9OhE8Qj
	 BZYpudGF+JCJgUV1r97xvUvBPuUqkpqTRTTkoREeIPtfUVZhOhw9RX93MnTslwGJnc
	 r7OwpGfa/3KGg==
Date: Sun, 6 Feb 2022 18:37:44 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Michael Kelley <mikelley@microsoft.com>
Cc: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
	wei.liu@kernel.org, tianyu.lan@microsoft.com, longli@microsoft.com,
	ndesaulniers@google.com, vt@altlinux.org, kuba@kernel.org,
	linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH 1/1] Drivers: hv: vmbus: Rework use of DMA_BIT_MASK(64)
Message-ID: <YgB36FwuRaF85WQq@dev-arch.archlinux-ax161>
References: <1644176216-12531-1-git-send-email-mikelley@microsoft.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1644176216-12531-1-git-send-email-mikelley@microsoft.com>

Hi Michael,

On Sun, Feb 06, 2022 at 11:36:56AM -0800, Michael Kelley wrote:
> Using DMA_BIT_MASK(64) as an initializer for a global variable
> causes problems with Clang 12.0.1. The compiler doesn't understand
> that value 64 is excluded from the shift at compile time, resulting
> in a build error.
> 
> While this is a compiler problem, avoid the issue by setting up
> the dma_mask memory as part of struct hv_device, and initialize
> it using dma_set_mask().
> 
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Reported-by: Vitaly Chikunov <vt@altlinux.org>
> Reported-by: Jakub Kicinski <kuba@kernel.org>
> Fixes: 743b237c3a7b ("scsi: storvsc: Add Isolation VM support for storvsc driver")
> Signed-off-by: Michael Kelley <mikelley@microsoft.com>

Thanks a lot for working around this. I am hoping that this will be
fixed in clang soon, as it is high priority on our list of issues to
fix. Once it has been fixed, we should be able to undo this workaround
in one way or another.

I can confirm the warning is resolved, which will allow us to build
ARCH=arm64 and ARCH=x86_64 allmodconfig with -Werror on mainline with
clang once another fix [1] is merged.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>

[1]: https://git.kernel.org/gregkh/usb/c/b470947c3672f7eb7c4c271d510383d896831cc2

> ---
>  drivers/hv/vmbus_drv.c | 4 ++--
>  include/linux/hyperv.h | 1 +
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
> index 17bf55f..0d96634 100644
> --- a/drivers/hv/vmbus_drv.c
> +++ b/drivers/hv/vmbus_drv.c
> @@ -2079,7 +2079,6 @@ struct hv_device *vmbus_device_create(const guid_t *type,
>  	return child_device_obj;
>  }
>  
> -static u64 vmbus_dma_mask = DMA_BIT_MASK(64);
>  /*
>   * vmbus_device_register - Register the child device
>   */
> @@ -2120,8 +2119,9 @@ int vmbus_device_register(struct hv_device *child_device_obj)
>  	}
>  	hv_debug_add_dev_dir(child_device_obj);
>  
> -	child_device_obj->device.dma_mask = &vmbus_dma_mask;
>  	child_device_obj->device.dma_parms = &child_device_obj->dma_parms;
> +	child_device_obj->device.dma_mask = &child_device_obj->dma_mask;
> +	dma_set_mask(&child_device_obj->device, DMA_BIT_MASK(64));
>  	return 0;
>  
>  err_kset_unregister:
> diff --git a/include/linux/hyperv.h b/include/linux/hyperv.h
> index f565a89..fe2e017 100644
> --- a/include/linux/hyperv.h
> +++ b/include/linux/hyperv.h
> @@ -1262,6 +1262,7 @@ struct hv_device {
>  	struct vmbus_channel *channel;
>  	struct kset	     *channels_kset;
>  	struct device_dma_parameters dma_parms;
> +	u64 dma_mask;
>  
>  	/* place holder to keep track of the dir for hv device in debugfs */
>  	struct dentry *debug_dir;
> -- 
> 1.8.3.1
> 
