Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F5513D2B7;
	Thu,  1 Aug 2024 16:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722528702; cv=none; b=Po7hsgOoDGX18ywhJtZVDJNh8E9jVvvrs0sqUz/W1C0KL2/dn5f+C1S9p3qysgr75GHYvJOTrfUox30GQ0Dtwr+nT9KBDQcE0DwMDc8+/i1zMpfzi6NZD4l42PWHy6tiXJ1vRusJcnOW2jJDFQUASevXrnVoq/RFrfAa7qKM1BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722528702; c=relaxed/simple;
	bh=8LlYvuOu5YrgL4ybbf3NYzL7OemNdA/tps+6acBXxV0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KTgNbpe+q94LjiEp0/H5aND1mp7QDxf5kGV0o8sfkgsFBqUFG8yotl2qbZP1hY5zBW61zfefIZnYC1AyBBTl072LoMbRusb/EYgeyDR8HdqDGD9s6Bs7xl7m+s5KgrVtc4wuu+IzhH0AKtTjCZjQl/X7J6aUGVFfc4MMPN2lINk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fkyGm/iv; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fkyGm/iv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722528701; x=1754064701;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8LlYvuOu5YrgL4ybbf3NYzL7OemNdA/tps+6acBXxV0=;
  b=fkyGm/ivEm3bY3hWHEIZGxvmsf+qIiSsMiYpAXOsf71ORqvBp8kTCM5t
   z0ppPaSvPI1XoK7VI/Fowz4k1xby/ILiDTCeR+xa5vRFncCtHHg/TUlTr
   ZV2zpfd7N5/HfoOzvmSbsKQGqqV23EoFjvfiaubYNXYdNMji3WJs3mYOC
   rCsOaDaP8tsuA/opDFmT+Y+/XvFYQ24I+CLuuumuGdT4gKn78byvGuHFU
   sbkMnb9tx0nNZr9bxvVX9rY4EoIRYORVGlW4Udk0muILPGJtwHMWGc5hO
   rvddLVaveLsX06xm2Ay7Vq8atUs7S07wHI7cH/1xsOZra6/cwAEspXH8g
   A==;
X-CSE-ConnectionGUID: XGEQ4/WOTgCLucjMwh4IgQ==
X-CSE-MsgGUID: 2t67wR/wTJeWbvVZIdtdZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="20633628"
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; 
   d="scan'208";a="20633628"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 09:11:40 -0700
X-CSE-ConnectionGUID: HufqTKjvQBCPEAq5GjkBuA==
X-CSE-MsgGUID: GhIaCnVdQl20eC/366JMKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; 
   d="scan'208";a="55026404"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 01 Aug 2024 09:11:38 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZYOt-000vki-2Q;
	Thu, 01 Aug 2024 16:11:35 +0000
Date: Fri, 2 Aug 2024 00:11:04 +0800
From: kernel test robot <lkp@intel.com>
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Bjorn Andersson <andersson@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [qcom:clk-for-6.12 8/15] drivers/clk/qcom/camcc-sm8150.c:2141:29:
 error: incompatible pointer types passing 'struct platform_device *' to
 parameter of type 'struct device *'
Message-ID: <202408020044.PEGwUAFE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux clk-for-6.12
head:   802b83205519e4253b873bef5c095b147cd69dad
commit: ea73b7aceff69c4426c5d13bbdd785c5dc1e2960 [8/15] clk: qcom: Add camera clock controller driver for SM8150
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240802/202408020044.PEGwUAFE-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240802/202408020044.PEGwUAFE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408020044.PEGwUAFE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/qcom/camcc-sm8150.c:2141:29: error: incompatible pointer types passing 'struct platform_device *' to parameter of type 'struct device *' [-Werror,-Wincompatible-pointer-types]
    2141 |         ret = qcom_cc_really_probe(pdev, &cam_cc_sm8150_desc, regmap);
         |                                    ^~~~
   drivers/clk/qcom/common.h:72:48: note: passing argument to parameter 'dev' here
      72 | extern int qcom_cc_really_probe(struct device *dev,
         |                                                ^
   1 error generated.


vim +2141 drivers/clk/qcom/camcc-sm8150.c

  2112	
  2113	static int cam_cc_sm8150_probe(struct platform_device *pdev)
  2114	{
  2115		struct regmap *regmap;
  2116		int ret;
  2117	
  2118		ret = devm_pm_runtime_enable(&pdev->dev);
  2119		if (ret)
  2120			return ret;
  2121	
  2122		ret = pm_runtime_resume_and_get(&pdev->dev);
  2123		if (ret)
  2124			return ret;
  2125	
  2126		regmap = qcom_cc_map(pdev, &cam_cc_sm8150_desc);
  2127		if (IS_ERR(regmap)) {
  2128			pm_runtime_put(&pdev->dev);
  2129			return PTR_ERR(regmap);
  2130		}
  2131	
  2132		clk_trion_pll_configure(&cam_cc_pll0, regmap, &cam_cc_pll0_config);
  2133		clk_trion_pll_configure(&cam_cc_pll1, regmap, &cam_cc_pll1_config);
  2134		clk_regera_pll_configure(&cam_cc_pll2, regmap, &cam_cc_pll2_config);
  2135		clk_trion_pll_configure(&cam_cc_pll3, regmap, &cam_cc_pll3_config);
  2136		clk_trion_pll_configure(&cam_cc_pll4, regmap, &cam_cc_pll4_config);
  2137	
  2138		/* Keep the critical clock always-on */
  2139		qcom_branch_set_clk_en(regmap, 0xc1e4); /* cam_cc_gdsc_clk */
  2140	
> 2141		ret = qcom_cc_really_probe(pdev, &cam_cc_sm8150_desc, regmap);
  2142	
  2143		pm_runtime_put(&pdev->dev);
  2144	
  2145		return ret;
  2146	}
  2147	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
