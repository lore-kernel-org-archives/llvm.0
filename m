Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26343C3F71;
	Wed, 19 Aug 2026 07:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787123204; cv=none; b=uYDDdK0VCzQlSDKvh+F0FTqhKecL4RRZKS5jkujY2MzixxcOr1T5bG4aSTMKXcSFoM+8vsq4WyW8aaNdvwDZOL7L/RF0FWXq5efcFnvGuVSutdYiH/0yyrVIJjkI7gCuJoE4qLLsYl0CIoGzWwBh8Asy7R6QOAqU5GfB7Gzpcc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787123204; c=relaxed/simple;
	bh=xWfaUd9a24JhhoccizH2F/KfZl/ds4RKHEYN8ztF6Ks=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VcjCTXzbGpxuxdyMCAx1Mc4tQsn4LFlx++veUle9XjsQBBh18oUcXrTDBeS9+nyaemXM/NHp4nnnXAyoz8YOMq+54hZcoLtizJlShfXJX/OGd/NfLYzeaTVIdAo7rhTjK2dQmwP9D13xjZX1QR7ZGJUppaChQEzyipPvTGsWVBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FwcT7/f8; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FwcT7/f8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787123202; x=1818659202;
  h=date:from:to:cc:subject:message-id;
  bh=xWfaUd9a24JhhoccizH2F/KfZl/ds4RKHEYN8ztF6Ks=;
  b=FwcT7/f8uIFLvPaFIyyib4R1PE7RwwCHyo+QZ/cjletxotONeQ3IaSiI
   WB/z0CCunxAa9dBE5Bc61x1l/q4CIwsIAcle9P5DZgpxVLvyV/zog/vG8
   ILcHoVgPcUMGDr5ZzV/iFQKY/HRebmSQswox5Jz/VUI4mOI+HUNp55RS6
   YcUFCGXYnwO11uOjH7IkeNFtA5J5Let30PuW3k8S28ve+y7zWfo6FaTil
   anhNuviCmDaX6/sGqhat5u+lgEoyO24hBkFefyQkKMm48jM5YftiFCwva
   23vDaN6t2+JqWumJ06gbmzd4Lh0pgadH3m+RelCK7RJnWpsqh9JWKFhpd
   Q==;
X-CSE-ConnectionGUID: 3OsMPi5QRi6sKPwjjXqrBA==
X-CSE-MsgGUID: +F4lsVMaSniduJ76sQ7rPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="87484008"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="87484008"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 00:06:41 -0700
X-CSE-ConnectionGUID: tnnkDsS1T4+IXfx8hSv1kw==
X-CSE-MsgGUID: +VozZRxqRuW/iWXBUGuMaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="266078132"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 19 Aug 2026 00:06:39 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwaNg-00000000exm-3joc;
	Wed, 19 Aug 2026 07:06:36 +0000
Date: Wed, 19 Aug 2026 15:05:37 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:board-remove 200/200]
 drivers/mmc/host/sdhci-pxav2.c:305:6: warning: variable 'pdata' is used
 uninitialized whenever 'if' condition is false
Message-ID: <202608191406.FXxPSlmS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-remove
head:   c12d647b0229f4d75a2973c9b4e79f9b53406426
commit: c12d647b0229f4d75a2973c9b4e79f9b53406426 [200/200] remaining pdata removal
config: loongarch-randconfig-001-20260819 (https://download.01.org/0day-ci/archive/20260819/202608191406.FXxPSlmS-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 844a18e753e822736c9805ab779144b647a2c186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608191406.FXxPSlmS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608191406.FXxPSlmS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mmc/host/sdhci-pxav2.c:305:6: warning: variable 'pdata' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     305 |         if (variant)
         |             ^~~~~~~
   drivers/mmc/host/sdhci-pxav2.c:308:6: note: uninitialized use occurs here
     308 |         if (pdata->flags & PXA_FLAG_CARD_PERMANENT) {
         |             ^~~~~
   drivers/mmc/host/sdhci-pxav2.c:305:2: note: remove the 'if' if its condition is always true
     305 |         if (variant)
         |         ^~~~~~~~~~~~
     306 |                 pdata = pxav2_get_mmc_pdata(dev);
   drivers/mmc/host/sdhci-pxav2.c:273:34: note: initialize the variable 'pdata' to silence this warning
     273 |         struct sdhci_pxa_platdata *pdata;
         |                                         ^
         |                                          = NULL
   1 warning generated.


vim +305 drivers/mmc/host/sdhci-pxav2.c

b650352dd3df361 Chris Ball            2012-04-10  269  
c3be1efd41a97f9 Bill Pemberton        2012-11-19  270  static int sdhci_pxav2_probe(struct platform_device *pdev)
9f5d71e4a78a02f Zhangfei Gao          2011-06-08  271  {
9f5d71e4a78a02f Zhangfei Gao          2011-06-08  272  	struct sdhci_pltfm_host *pltfm_host;
c12d647b0229f4d Arnd Bergmann         2026-08-07  273  	struct sdhci_pxa_platdata *pdata;
f35ca223882aa6f Doug Brown            2023-01-16  274  	struct sdhci_pxav2_host *pxav2_host;
9f5d71e4a78a02f Zhangfei Gao          2011-06-08  275  	struct device *dev = &pdev->dev;
9f5d71e4a78a02f Zhangfei Gao          2011-06-08  276  	struct sdhci_host *host = NULL;
dfe9746aed2d126 Doug Brown            2023-01-16  277  	const struct sdhci_pxa_variant *variant;
b650352dd3df361 Chris Ball            2012-04-10  278  
e41c48b4bcb3cee Doug Brown            2023-01-16  279  	struct clk *clk, *clk_core;
9f5d71e4a78a02f Zhangfei Gao          2011-06-08  280  
f35ca223882aa6f Doug Brown            2023-01-16  281  	host = sdhci_pltfm_init(pdev, NULL, sizeof(*pxav2_host));
6a686c31324c9ef Sebastian Hesselbarth 2014-10-21  282  	if (IS_ERR(host))
9f5d71e4a78a02f Zhangfei Gao          2011-06-08  283  		return PTR_ERR(host);
6a686c31324c9ef Sebastian Hesselbarth 2014-10-21  284  
9f5d71e4a78a02f Zhangfei Gao          2011-06-08  285  	pltfm_host = sdhci_priv(host);
f35ca223882aa6f Doug Brown            2023-01-16  286  	pxav2_host = sdhci_pltfm_priv(pltfm_host);
9f5d71e4a78a02f Zhangfei Gao          2011-06-08  287  
c21f1b0dc6418e0 Adrian Hunter         2023-08-11  288  	clk = devm_clk_get_optional_enabled(dev, "io");
c21f1b0dc6418e0 Adrian Hunter         2023-08-11  289  	if (!clk)
c21f1b0dc6418e0 Adrian Hunter         2023-08-11  290  		clk = devm_clk_get_enabled(dev, NULL);
072f5e2c34a95bc Binbin Zhou           2025-06-07  291  	if (IS_ERR(clk))
072f5e2c34a95bc Binbin Zhou           2025-06-07  292  		return dev_err_probe(dev, PTR_ERR(clk), "failed to get io clock\n");
9f5d71e4a78a02f Zhangfei Gao          2011-06-08  293  	pltfm_host->clk = clk;
9f5d71e4a78a02f Zhangfei Gao          2011-06-08  294  
e41c48b4bcb3cee Doug Brown            2023-01-16  295  	clk_core = devm_clk_get_optional_enabled(dev, "core");
072f5e2c34a95bc Binbin Zhou           2025-06-07  296  	if (IS_ERR(clk_core))
072f5e2c34a95bc Binbin Zhou           2025-06-07  297  		return dev_err_probe(dev, PTR_ERR(clk_core),
072f5e2c34a95bc Binbin Zhou           2025-06-07  298  				     "failed to enable core clock\n");
e41c48b4bcb3cee Doug Brown            2023-01-16  299  
9f5d71e4a78a02f Zhangfei Gao          2011-06-08  300  	host->quirks = SDHCI_QUIRK_BROKEN_ADMA
9f5d71e4a78a02f Zhangfei Gao          2011-06-08  301  		| SDHCI_QUIRK_BROKEN_TIMEOUT_VAL
9f5d71e4a78a02f Zhangfei Gao          2011-06-08  302  		| SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN;
9f5d71e4a78a02f Zhangfei Gao          2011-06-08  303  
dfe9746aed2d126 Doug Brown            2023-01-16  304  	variant = of_device_get_match_data(dev);
dfe9746aed2d126 Doug Brown            2023-01-16 @305  	if (variant)
b650352dd3df361 Chris Ball            2012-04-10  306  		pdata = pxav2_get_mmc_pdata(dev);
dfe9746aed2d126 Doug Brown            2023-01-16  307  
9f5d71e4a78a02f Zhangfei Gao          2011-06-08  308  	if (pdata->flags & PXA_FLAG_CARD_PERMANENT) {
9f5d71e4a78a02f Zhangfei Gao          2011-06-08  309  		/* on-chip device */
9f5d71e4a78a02f Zhangfei Gao          2011-06-08  310  		host->quirks |= SDHCI_QUIRK_BROKEN_CARD_DETECTION;
9f5d71e4a78a02f Zhangfei Gao          2011-06-08  311  		host->mmc->caps |= MMC_CAP_NONREMOVABLE;
9f5d71e4a78a02f Zhangfei Gao          2011-06-08  312  	}
9f5d71e4a78a02f Zhangfei Gao          2011-06-08  313  
9f5d71e4a78a02f Zhangfei Gao          2011-06-08  314  	/* If slot design supports 8 bit data, indicate this to MMC. */
9f5d71e4a78a02f Zhangfei Gao          2011-06-08  315  	if (pdata->flags & PXA_FLAG_SD_8_BIT_CAPABLE_SLOT)
9f5d71e4a78a02f Zhangfei Gao          2011-06-08  316  		host->mmc->caps |= MMC_CAP_8_BIT_DATA;
9f5d71e4a78a02f Zhangfei Gao          2011-06-08  317  
dfe9746aed2d126 Doug Brown            2023-01-16  318  	host->quirks |= variant->extra_quirks;
dfe9746aed2d126 Doug Brown            2023-01-16  319  	host->ops = variant->ops;
9f5d71e4a78a02f Zhangfei Gao          2011-06-08  320  
f35ca223882aa6f Doug Brown            2023-01-16  321  	/* Set up optional pinctrl for PXA168 SDIO IRQ fix */
f35ca223882aa6f Doug Brown            2023-01-16  322  	pxav2_host->pinctrl = devm_pinctrl_get(dev);
f35ca223882aa6f Doug Brown            2023-01-16  323  	if (!IS_ERR(pxav2_host->pinctrl)) {
f35ca223882aa6f Doug Brown            2023-01-16  324  		pxav2_host->pins_cmd_gpio = pinctrl_lookup_state(pxav2_host->pinctrl,
f35ca223882aa6f Doug Brown            2023-01-16  325  								 "state_cmd_gpio");
f35ca223882aa6f Doug Brown            2023-01-16  326  		if (IS_ERR(pxav2_host->pins_cmd_gpio))
f35ca223882aa6f Doug Brown            2023-01-16  327  			pxav2_host->pins_cmd_gpio = NULL;
f35ca223882aa6f Doug Brown            2023-01-16  328  		pxav2_host->pins_default = pinctrl_lookup_state(pxav2_host->pinctrl,
f35ca223882aa6f Doug Brown            2023-01-16  329  								"default");
f35ca223882aa6f Doug Brown            2023-01-16  330  		if (IS_ERR(pxav2_host->pins_default))
f35ca223882aa6f Doug Brown            2023-01-16  331  			pxav2_host->pins_default = NULL;
f35ca223882aa6f Doug Brown            2023-01-16  332  	} else {
f35ca223882aa6f Doug Brown            2023-01-16  333  		pxav2_host->pinctrl = NULL;
f35ca223882aa6f Doug Brown            2023-01-16  334  	}
f35ca223882aa6f Doug Brown            2023-01-16  335  
072f5e2c34a95bc Binbin Zhou           2025-06-07  336  	return sdhci_add_host(host);
9f5d71e4a78a02f Zhangfei Gao          2011-06-08  337  }
9f5d71e4a78a02f Zhangfei Gao          2011-06-08  338  

:::::: The code at line 305 was first introduced by commit
:::::: dfe9746aed2d1267f00b880ae232170d7d9e4202 mmc: sdhci-pxav2: add initial support for PXA168 V1 controller

:::::: TO: Doug Brown <doug@schmorgal.com>
:::::: CC: Ulf Hansson <ulf.hansson@linaro.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
