Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E7329A2
	for <llvm@lists.linux.dev>; Thu, 23 Feb 2023 16:28:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAD26C433EF;
	Thu, 23 Feb 2023 16:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677169710;
	bh=QNtwL+3aQI5NX8KHQuxRVNJuJdxCfz9xgbVF4PuC1B4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ecOScmMnD4FY54PQcTo/sUh3wM/bq5x1gw2ldgd1gw3GsMiqGMHcx0hQYQ6U4hBej
	 JmDyZ/Tx/1Qq6N0Hg17t9W2gweAb3BddapdcI/ALIUxvRBHfrvLcAJBSsOWAbu0fnC
	 W14+vs8BlJ71JMPpCahFLIAWbKCnPLUmMkEAtp5w6825yBsUda4LMq9B4bG9xNMfcw
	 CVVgYVBhmI4PeoxciEBACllNI08VRVitgE7xwwY2RSeLpNshH0H6Q/1qGVi8gTEhuA
	 qunB88ExeofQLMfkFWy/9ZOpGNkuYSTulZCZOf2e0uu2yRzsX+EEqYlLb/zFlYUlnW
	 2q/C8GezC7vtw==
Date: Thu, 23 Feb 2023 09:28:28 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, Mikko Perttunen <mperttunen@nvidia.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Robin Murphy <robin.murphy@arm.com>,
	dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] gpu: host1x: fix uninitialized variable use
Message-ID: <Y/eULFO4jbivQ679@dev-arch.thelio-3990X>
References: <20230127221418.2522612-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230127221418.2522612-1-arnd@kernel.org>

Hi Thierry, Daniel, and David,

On Fri, Jan 27, 2023 at 11:14:00PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The error handling for platform_get_irq() failing no longer
> works after a recent change, clang now points this out with
> a warning:
> 
> drivers/gpu/host1x/dev.c:520:6: error: variable 'syncpt_irq' is uninitialized when used here [-Werror,-Wuninitialized]
>         if (syncpt_irq < 0)
>             ^~~~~~~~~~
> 
> Fix this by removing the variable and checking the correct
> error status.
> 
> Fixes: 625d4ffb438c ("gpu: host1x: Rewrite syncpoint interrupt handling")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/host1x/dev.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
> index 4872d183d860..aae2efeef503 100644
> --- a/drivers/gpu/host1x/dev.c
> +++ b/drivers/gpu/host1x/dev.c
> @@ -487,7 +487,6 @@ static int host1x_get_resets(struct host1x *host)
>  static int host1x_probe(struct platform_device *pdev)
>  {
>  	struct host1x *host;
> -	int syncpt_irq;
>  	int err;
>  
>  	host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
> @@ -517,8 +516,8 @@ static int host1x_probe(struct platform_device *pdev)
>  	}
>  
>  	host->syncpt_irq = platform_get_irq(pdev, 0);
> -	if (syncpt_irq < 0)
> -		return syncpt_irq;
> +	if (host->syncpt_irq < 0)
> +		return host->syncpt_irq;
>  
>  	mutex_init(&host->devices_lock);
>  	INIT_LIST_HEAD(&host->devices);
> -- 
> 2.39.0
> 

Apologies if this has been reported already or has a solution in
progress but mainline is now broken because this change got separated
from the change it is fixing:

https://github.com/ClangBuiltLinux/continuous-integration2/actions/runs/4249931209/jobs/7391912774
https://storage.tuxsuite.com/public/clangbuiltlinux/continuous-integration2/builds/2M7y9HpiXB13qiC2mkHMyeZOcLW/build.log

I see this change sitting in the drm-tegra tree [1], which is getting
merged into -next, so it is fixed there, which is why we did not notice
any issues until the drm-next tree was merged into mainline. Can this be
fast tracked to Linus to unbreak clang builds with -Werror?

[1]: https://gitlab.freedesktop.org/drm/tegra/-/commit/b9930311641cf2ed905a84aabe27e8f3868aee4a

Cheers,
Nathan
