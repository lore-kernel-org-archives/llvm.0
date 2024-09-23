Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D0612E5B
	for <llvm@lists.linux.dev>; Mon, 23 Sep 2024 06:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727073498; cv=none; b=VbH1eTQMHmGh450NNAlr6fPDsvoZ78y8KA60bRKFHK+w1aEQY3Fe3T89vfAwT5S24cshhWFunu3HNiVanVsUDgxvGOsqZT5ZZXwYFs4fyM0/LGPMsvfDE7fjUgAtso0HDqdS1ooNjsNbe4LfrOThsiqezXMGzDCr5a/6G9HwKz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727073498; c=relaxed/simple;
	bh=adkwsWEFcrcrhBa6//oKeGXzJBAGOjoocn+XTlCL0qs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SDXmgFsQzyamSfh99KwyF+C94XrfmvR5Cn/BJM1o7eqYAcakKOc+oVBP7NFhVWGGu+qr11GvLVKor3W6rkt9cXfk8zNFyecd7NzeXQlTgijw5cKv9ZHaIVo1etv05ewApp4zz0tRMDKYXoKyT+CcXR4Lp2GMoiZYfpVmtljUBkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mEiZNK9l; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mEiZNK9l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727073495; x=1758609495;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=adkwsWEFcrcrhBa6//oKeGXzJBAGOjoocn+XTlCL0qs=;
  b=mEiZNK9lzeJv19r0KYrzHcoU+vqtKK4GAL6P1+BZzsc2YfF1uheFdMwp
   GDwbqHfJIJdru94uljINK0Z40d31thDaQM3kWFOeaIoZXTuGiaHcFlu/+
   6YoqchovZqjO7keNUlp9HXgJp0eT9AYc94IyhRKVah59FszGCac75Kqkt
   kdo5z735RZAEutTzt17iTI3ixMFppyGVFFnTANMlhkhOSD7uLe1HVJWdr
   LpleF1nbPJ8C1AygTDcGyLOBFWullHNxaanMpdXcyPz3FfV0L35AjTdAQ
   e3oN9mQVO7ehAwl5YxYYTAc17P8MUtjMs1p6GrmoUeuFlPztdacePPQ+s
   A==;
X-CSE-ConnectionGUID: 5315xLsTRQ6nlBrl/1L5fg==
X-CSE-MsgGUID: H7vWnlIfRwOqdTl4UEzTMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="29793279"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="29793279"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 23:38:15 -0700
X-CSE-ConnectionGUID: Ci5p0AlmR9KtN2G+m8XrqQ==
X-CSE-MsgGUID: DGqgHnh+SPeowsoxjCJocQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="75525517"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.246.65])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 23:38:08 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean
 Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers
 <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, Justin Stitt
 <justinstitt@google.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] drm/msm/hdmi: drop pll_cmp_to_fdata from hdmi_phy_8998
In-Reply-To: <20240922-msm-drop-unused-func-v1-1-c5dc083415b8@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240922-msm-drop-unused-func-v1-1-c5dc083415b8@linaro.org>
Date: Mon, 23 Sep 2024 09:38:05 +0300
Message-ID: <874j6698oi.fsf@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Sun, 22 Sep 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> The pll_cmp_to_fdata() was never used by the working code. Drop it to
> prevent warnings with W=1 and clang.
>
> Reported-by: Jani Nikula <jani.nikula@intel.com>
> Closes: https://lore.kernel.org/dri-devel/3553b1db35665e6ff08592e35eb438a574d1ad65.1725962479.git.jani.nikula@intel.com
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c | 9 ---------
>  1 file changed, 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
> index 0e3a2b16a2ce..e6ffaf92d26d 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
> @@ -153,15 +153,6 @@ static inline u32 pll_get_pll_cmp(u64 fdata, unsigned long ref_clk)
>  	return dividend - 1;
>  }
>  
> -static inline u64 pll_cmp_to_fdata(u32 pll_cmp, unsigned long ref_clk)
> -{
> -	u64 fdata = ((u64)pll_cmp) * ref_clk * 10;
> -
> -	do_div(fdata, HDMI_PLL_CMP_CNT);
> -
> -	return fdata;
> -}
> -
>  #define HDMI_REF_CLOCK_HZ ((u64)19200000)
>  #define HDMI_MHZ_TO_HZ ((u64)1000000)
>  static int pll_get_post_div(struct hdmi_8998_post_divider *pd, u64 bclk)
>
> ---
> base-commit: 32ffa5373540a8d1c06619f52d019c6cdc948bb4
> change-id: 20240922-msm-drop-unused-func-b9e76ad8e0ea
>
> Best regards,

-- 
Jani Nikula, Intel
