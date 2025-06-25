Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45EFB287254;
	Wed, 25 Jun 2025 23:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750895870; cv=none; b=dfHE9h03hbFt/2LRoI78ZdbMUS00isoI27CEbl9zLKHehVq51h6ps+v4hTCP1/xrqnxWOesqW8sKrxxHQyI60JQ7fl5T1JD7Giim+nhUcIoor8NCUGJW6J2v8KQgQouKtla40q7KDoc0RuQeQh6wtwZc61i62EaBqp6MJ4ds7kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750895870; c=relaxed/simple;
	bh=CkcCjk8IzsSvEHOxb9mbqVNqkfQ5haY3GvAwzUt4bxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JpixEna3vtHzcuaUggocV1uz+a1z93DoOBcrrk6j93fYDC7fdMnaS+0ipI5zzZbs+5wX6ES1mg5ecMcWmZwkIs+WCugGq2aY6Q5VkTgtGgKzLQ+P0y0bUCJWnIIhKuPflJvx4pqzBPdU9UeO70iKB1tEzcFakFhCQtAXtIZDvQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HzSmAflt; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HzSmAflt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750895870; x=1782431870;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CkcCjk8IzsSvEHOxb9mbqVNqkfQ5haY3GvAwzUt4bxI=;
  b=HzSmAfltf96jMG9khhH3n1Aho+H0o++BCVsJU2y4Yz/0WQQktWob5WDm
   I/BMc3BbPFYftKIfOByCbm6FDJblxk5ewYXdQbYB31gqPY+3lSNmI7om8
   cra09OfUaV6NQ1Jn0gwNk8Bq1MvwezEKwJjEqQzk1wenjw5yoZnZk/gQi
   LrTjaE7ATjCwPIUKNvgqCwhnBvholPP9jPhPzWgNO2A+iAzLF2MaTWGHp
   4Mo2sPIP6IRtUrPNXv7xzDm102/c9LTaEICBecHQSES3hinShLIhjbvzn
   asZmQiNmG+FSsx8p3h4kOA9h7Z/hjAwVd8/QVUwDl4+uP2aao33OsvrwT
   A==;
X-CSE-ConnectionGUID: +3dsEzUPQcmJzWYJUzd9hA==
X-CSE-MsgGUID: Cxuw/qwGTIGPUDa4QkvyRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="64616241"
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; 
   d="scan'208";a="64616241"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 16:57:49 -0700
X-CSE-ConnectionGUID: Gy7XcTc0Sc2uOSE6wWY0hg==
X-CSE-MsgGUID: RulosnoFTIGOmowOtTQoQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; 
   d="scan'208";a="152884623"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 25 Jun 2025 16:57:45 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUZzr-000TYQ-0F;
	Wed, 25 Jun 2025 23:57:43 +0000
Date: Thu, 26 Jun 2025 07:56:46 +0800
From: kernel test robot <lkp@intel.com>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v5 03/14] drm/msm: Use the central UBWC config database
Message-ID: <202506260718.HOiyc0Mm-lkp@intel.com>
References: <20250625-topic-ubwc_central-v5-3-e256d18219e2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-topic-ubwc_central-v5-3-e256d18219e2@oss.qualcomm.com>

Hi Konrad,

kernel test robot noticed the following build errors:

[auto build test ERROR on 2ae2aaafb21454f4781c30734959cf223ab486ef]

url:    https://github.com/intel-lab-lkp/linux/commits/Konrad-Dybcio/soc-qcom-Add-UBWC-config-provider/20250625-211253
base:   2ae2aaafb21454f4781c30734959cf223ab486ef
patch link:    https://lore.kernel.org/r/20250625-topic-ubwc_central-v5-3-e256d18219e2%40oss.qualcomm.com
patch subject: [PATCH v5 03/14] drm/msm: Use the central UBWC config database
config: arm-randconfig-002-20250626 (https://download.01.org/0day-ci/archive/20250626/202506260718.HOiyc0Mm-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250626/202506260718.HOiyc0Mm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506260718.HOiyc0Mm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/qcom/ubwc_config.c:230:34: error: redefinition of 'qcom_ubwc_config_get_data'
     230 | const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
         |                                  ^
   include/linux/soc/qcom/ubwc.h:59:48: note: previous definition is here
      59 | static inline const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
         |                                                ^
   1 error generated.


vim +/qcom_ubwc_config_get_data +230 drivers/soc/qcom/ubwc_config.c

892fee0dfae7022 Konrad Dybcio 2025-06-25  229  
892fee0dfae7022 Konrad Dybcio 2025-06-25 @230  const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
