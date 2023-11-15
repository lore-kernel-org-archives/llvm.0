Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE7D2E62E
	for <llvm@lists.linux.dev>; Wed, 15 Nov 2023 16:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a850aYS/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700065679; x=1731601679;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=XSWLyJxFTqyYvobQOApnn9qgzueYzqYkv2eVyB9iQuM=;
  b=a850aYS/7BjwXIP2ZfpiGUBI5zWrreMQZslbuIiDPPY5PcAlyQYjL25w
   e4/CA4taU2bR/GRW5lzBirPM+/XLmFt+8UEuwkoVxglyQ4zb3OLNUCjuu
   0ON3s32tv/PnhBXQCtWj63CnbQTs6h+tD4mTVu1KP1Bm9oVPMbrM8Vf8S
   DhhiaMlRQ246Wi75MapVryzhu3bT8rEXSkGEqtOuBPjeH4wPRGx5t3EKI
   ePti2FQYnizjbpZoYm4PZgi2KV6q8rqTQZJnIxW95rllXYdJ8icNmImTK
   Tc87961HJIcSDPb17UKCrbRXWwdmALYbbVG2Cr2jIT8Kr8FvzZ8xXmd7c
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="370252754"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="370252754"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 08:27:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="855690652"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="855690652"
Received: from ipaliych-mobl2.amr.corp.intel.com (HELO [10.212.183.137]) ([10.212.183.137])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 08:27:56 -0800
Message-ID: <3e461bb5-fa6b-4729-8ff5-ccc1d2887066@linux.intel.com>
Date: Wed, 15 Nov 2023 08:44:16 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soundwire: amd: add an error code check in
 amd_sdw_clock_stop_exit
To: Su Hui <suhui@nfschina.com>, vkoul@kernel.org,
 yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com, nathan@kernel.org,
 ndesaulniers@google.com, trix@redhat.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, kernel-janitors@vger.kernel.org
References: <20231115095407.1059704-1-suhui@nfschina.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20231115095407.1059704-1-suhui@nfschina.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/15/23 03:54, Su Hui wrote:
> Clang static analyzer complains that value stored to 'ret' is never read.
> Add an error code check and print an error message if 'readl_poll_timeout'
> failed.
> 
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
>  drivers/soundwire/amd_manager.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
> index 3a99f6dcdfaf..f391b541f4b7 100644
> --- a/drivers/soundwire/amd_manager.c
> +++ b/drivers/soundwire/amd_manager.c
> @@ -1029,6 +1029,10 @@ static int amd_sdw_clock_stop_exit(struct amd_sdw_manager *amd_manager)
>  		ret = readl_poll_timeout(amd_manager->mmio + ACP_SW_CLK_RESUME_CTRL, val,
>  					 (val & AMD_SDW_CLK_RESUME_DONE), ACP_DELAY_US,
>  					 AMD_SDW_TIMEOUT);
> +		if (ret)
> +			dev_err(amd_manager->dev, "%s: timed out: %pe\n", __func__,
> +				ERR_PTR(ret));

Is this really the desired behavior?

This patch fixes the static analysis issue by logging the error code,
but does it make sense to continue resuming here and trying to exit from
the clock stop mode?

At this point a bus reset might be a more relevant behavior...

>  		if (val & AMD_SDW_CLK_RESUME_DONE) {
>  			writel(0, amd_manager->mmio + ACP_SW_CLK_RESUME_CTRL);
>  			ret = sdw_bus_exit_clk_stop(&amd_manager->bus);
