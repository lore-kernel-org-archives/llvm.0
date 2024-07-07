Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BF0EDC;
	Sun,  7 Jul 2024 15:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720365701; cv=none; b=usi8r02NhnCqSOxGP0+ge0psMCGHaxLPKHIzuBDWHfqM2aWs0+etJnrzHlaKq53a1MFKY9Vw6UXQv/0ImChFMPGwK63Wpk7jxNVTPj18OxaBfBslb36OIMdi12qgIM094e1txekiMwJWmp3Y32BvpuvJ5BqW3kZywdyud9Hz99A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720365701; c=relaxed/simple;
	bh=+ljliBX5k1jokWhX0ybalM/DGnAzoOVpNUDv/josXrA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cZ/ON/2HET2pnu1kER4mv+FTofW2s08YSjfNfwRw8x641Tqum6ovwq99W63IXfr1yPEuT9+KIqh3lOP2bhzxPgTd2qJci6N8AONE4iPr4eijSRHmyt6ocGbsf+vBLiHXq3rsComjnHs9xodzcuut0+vvptj7/OcVwbf73No3Vws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iQsFPAOj; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iQsFPAOj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720365700; x=1751901700;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+ljliBX5k1jokWhX0ybalM/DGnAzoOVpNUDv/josXrA=;
  b=iQsFPAOjyE8ShATcF9wyj9L12J9n3v8tTtnQIvsj2bClNFZOE/hpQ3FP
   SZIGnHvp/LLEQNNI0kDR7QBVeyypnoiRRT7Ghh9Co2guC05mSQgND0/YZ
   RpWKuZAmp01IWlCX4GUKScHjbm8EZ1Kk4H/xuEa04NYOEb8z6wH+yU/ib
   cQfKjhzUlfzIKM0s29srtIizNCU2cInhOffUns8iM2iWhw9cYRnUxn7C6
   Ph90vbosox8wQUQSv8TLh0Fhfyhu19bWo5aDM7LLkJl3ds/PcKRFr0GeT
   TrzBU4JxIrGWVB685wdpJCKmfitv3PprBDHGu5XlZ+2vOqOiFvw9wLtI5
   Q==;
X-CSE-ConnectionGUID: Ne8KjXxMRNy8PP70NnuELA==
X-CSE-MsgGUID: vRbWy3chRAiId0DXaHQDJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="17405868"
X-IronPort-AV: E=Sophos;i="6.09,190,1716274800"; 
   d="scan'208";a="17405868"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2024 08:21:39 -0700
X-CSE-ConnectionGUID: 92DDdoQATcSe0NhMQKJJEg==
X-CSE-MsgGUID: dpOWJ5ZhTRKWbU/FLAcEQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,190,1716274800"; 
   d="scan'208";a="51894781"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 07 Jul 2024 08:21:36 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQThm-000V2U-0x;
	Sun, 07 Jul 2024 15:21:34 +0000
Date: Sun, 7 Jul 2024 23:20:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: [linux-next:master 7766/10451]
 drivers/clk/qcom/camcc-sm8650.c:3573:29: error: incompatible pointer types
 passing 'struct device *' to parameter of type 'struct platform_device *'
Message-ID: <202407072331.baglL4Sd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0b58e108042b0ed28a71cd7edf5175999955b233
commit: 09ea421652a832083ea380a72addf383965f3682 [7766/10451] clk: qcom: camcc-sm8650: Add SM8650 camera clock controller driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240707/202407072331.baglL4Sd-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240707/202407072331.baglL4Sd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407072331.baglL4Sd-lkp@intel.com/

Note: the linux-next/master HEAD 0b58e108042b0ed28a71cd7edf5175999955b233 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> drivers/clk/qcom/camcc-sm8650.c:3573:29: error: incompatible pointer types passing 'struct device *' to parameter of type 'struct platform_device *' [-Werror,-Wincompatible-pointer-types]
    3573 |         ret = qcom_cc_really_probe(&pdev->dev, &cam_cc_sm8650_desc, regmap);
         |                                    ^~~~~~~~~~
   drivers/clk/qcom/common.h:63:57: note: passing argument to parameter 'pdev' here
      63 | extern int qcom_cc_really_probe(struct platform_device *pdev,
         |                                                         ^
   1 error generated.


vim +3573 drivers/clk/qcom/camcc-sm8650.c

  3535	
  3536	static int cam_cc_sm8650_probe(struct platform_device *pdev)
  3537	{
  3538		struct regmap *regmap;
  3539		int ret;
  3540	
  3541		ret = devm_pm_runtime_enable(&pdev->dev);
  3542		if (ret)
  3543			return ret;
  3544	
  3545		ret = pm_runtime_resume_and_get(&pdev->dev);
  3546		if (ret)
  3547			return ret;
  3548	
  3549		regmap = qcom_cc_map(pdev, &cam_cc_sm8650_desc);
  3550		if (IS_ERR(regmap)) {
  3551			pm_runtime_put(&pdev->dev);
  3552			return PTR_ERR(regmap);
  3553		}
  3554	
  3555		clk_lucid_ole_pll_configure(&cam_cc_pll0, regmap, &cam_cc_pll0_config);
  3556		clk_lucid_ole_pll_configure(&cam_cc_pll1, regmap, &cam_cc_pll1_config);
  3557		clk_rivian_evo_pll_configure(&cam_cc_pll2, regmap, &cam_cc_pll2_config);
  3558		clk_lucid_ole_pll_configure(&cam_cc_pll3, regmap, &cam_cc_pll3_config);
  3559		clk_lucid_ole_pll_configure(&cam_cc_pll4, regmap, &cam_cc_pll4_config);
  3560		clk_lucid_ole_pll_configure(&cam_cc_pll5, regmap, &cam_cc_pll5_config);
  3561		clk_lucid_ole_pll_configure(&cam_cc_pll6, regmap, &cam_cc_pll6_config);
  3562		clk_lucid_ole_pll_configure(&cam_cc_pll7, regmap, &cam_cc_pll7_config);
  3563		clk_lucid_ole_pll_configure(&cam_cc_pll8, regmap, &cam_cc_pll8_config);
  3564		clk_lucid_ole_pll_configure(&cam_cc_pll9, regmap, &cam_cc_pll9_config);
  3565		clk_lucid_ole_pll_configure(&cam_cc_pll10, regmap, &cam_cc_pll10_config);
  3566	
  3567		/* Keep clocks always enabled */
  3568		qcom_branch_set_clk_en(regmap, 0x13318); /* CAM_CC_DRV_AHB_CLK */
  3569		qcom_branch_set_clk_en(regmap, 0x13314); /* CAM_CC_DRV_XO_CLK */
  3570		qcom_branch_set_clk_en(regmap, 0x132ec); /* CAM_CC_GDSC_CLK */
  3571		qcom_branch_set_clk_en(regmap, 0x13308); /* CAM_CC_SLEEP_CLK */
  3572	
> 3573		ret = qcom_cc_really_probe(&pdev->dev, &cam_cc_sm8650_desc, regmap);
  3574	
  3575		pm_runtime_put(&pdev->dev);
  3576	
  3577		return ret;
  3578	}
  3579	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
