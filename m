Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F34520698
	for <llvm@lists.linux.dev>; Mon,  5 Jun 2023 15:41:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECC14C433D2;
	Mon,  5 Jun 2023 15:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685979688;
	bh=+WQQuLVMz0dVlwh4gz6ce/VTv4FW4L+Vcxee8MeZteg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XQQ95xeeJteSYArjXKbL6Y7mfg2Kz9Dn04aVgJQg7f3UGL5EM8kLg97nECoBqhWwg
	 eBjLjgE0rAvfVkwGKysPRPSv4qAuXUamw1nFE8TxHlMMhleDNYojHgAJ43tU6Wq5W5
	 CLgRujVLKctujLgVIRlfezUhoSk6RUcHMI/UjiTFDZEDfQ7xViOoJJon0zlE6/Gi7+
	 Ncl5JTST1IeNVHvvdeLnX1tZefc24b7gfgREJ2oE6HeeHnlLHtDSdba1qm9/bGNK/Z
	 6iIuuRRBtPXE4GSYKmJgAVC7UzNG5ft9DmCWP3yJB9QaU9qJ5XBFdtAqnO9VOQa5t0
	 AELOVhiFsikbw==
Date: Mon, 5 Jun 2023 08:41:26 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Stuart Yoder <stuyoder@gmail.com>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, Li Yang <leoyang.li@nxp.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, kernel@pengutronix.de,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 2/2] bus: fsl-mc: fsl-mc-allocator: Drop a write-only
 variable
Message-ID: <20230605154126.GC2480995@dev-arch.thelio-3990X>
References: <20230605112025.80061-1-u.kleine-koenig@pengutronix.de>
 <20230605112025.80061-2-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230605112025.80061-2-u.kleine-koenig@pengutronix.de>

On Mon, Jun 05, 2023 at 01:20:25PM +0200, Uwe Kleine-König wrote:
> Fixes a clang compiler warning:
> 
>    drivers/bus/fsl-mc/fsl-mc-allocator.c:565:6: warning: variable 'free_count' set but not used [-Wunused-but-set-variable]
>            int free_count = 0;
> 
> Fixes: d8e026a44919 ("staging: fsl-mc: remove some superfluous WARN_ONs")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  drivers/bus/fsl-mc/fsl-mc-allocator.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/bus/fsl-mc/fsl-mc-allocator.c b/drivers/bus/fsl-mc/fsl-mc-allocator.c
> index 991273f956ce..b5e8c021fa1f 100644
> --- a/drivers/bus/fsl-mc/fsl-mc-allocator.c
> +++ b/drivers/bus/fsl-mc/fsl-mc-allocator.c
> @@ -563,12 +563,9 @@ static void fsl_mc_cleanup_resource_pool(struct fsl_mc_device *mc_bus_dev,
>  	struct fsl_mc_bus *mc_bus = to_fsl_mc_bus(mc_bus_dev);
>  	struct fsl_mc_resource_pool *res_pool =
>  					&mc_bus->resource_pools[pool_type];
> -	int free_count = 0;
>  
> -	list_for_each_entry_safe(resource, next, &res_pool->free_list, node) {
> -		free_count++;
> +	list_for_each_entry_safe(resource, next, &res_pool->free_list, node)
>  		devm_kfree(&mc_bus_dev->dev, resource);
> -	}
>  }
>  
>  void fsl_mc_cleanup_all_resource_pools(struct fsl_mc_device *mc_bus_dev)
> -- 
> 2.39.2
> 
