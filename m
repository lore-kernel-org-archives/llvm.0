Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0241D221F;
	Wed,  4 Sep 2024 11:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725450676; cv=none; b=W2TEGVw2GfSKEOeLldYuTfNBw7Yjcu+Fj8oT3jWmxYQns9wvt5CP7wT4LipFUQ6iRnKAdGnITisHFVwAPoy/QL2qRmxbFx9WAtbLMxyFv5BhfpLRx1YHdoZaEJoNNGnmHj7lJ7iZHtVSlNEPRGSjFT10RSFwARFv+cxrJwdHuk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725450676; c=relaxed/simple;
	bh=mhvDv83fUvlG0cQcDPPbM7mplZGVm4T7Ax6vDiwUhj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ukN4Nx4Gq0X5dHSj6jWeEjOoHwITb6A2UwMCXL5kUUEw7ZjnLEe3o0pKmtlYWjgA7fnU1pqemiLAx+R2TPFi50Q49A8CKQtCBUxvE6qEhqr0lKHLsIGrPQLWNK6ut4hE9l38rMhezNkRlYx//aKnGchcRl+CPA4mbs03EHWb8+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HWdTIK/A; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HWdTIK/A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725450674; x=1756986674;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mhvDv83fUvlG0cQcDPPbM7mplZGVm4T7Ax6vDiwUhj4=;
  b=HWdTIK/AcP0jHZ0f/4oQHxR9C9AQgHtfABKk1tTMkvOcvCZE1ob5ZRIG
   FU2ClecYc9Eu7bM+e7zfg723AWJI3WR5+rKbdP7S9tzJT5X+VWgnPzJpR
   DszXjVAaYB95u1YYyu/kLy++6j+Hu3CLskyp+PW3vYhAp5FzpTmtA8n0b
   oQQnCsjsUaz8VGHoKN0ERCK9nqEGXuuOPGBzOANoeQqjp7kat6SIz23ST
   LmrUvSGgXrXGR0HN/u6GsA0Nzyg02WmE5y216jr2K1+9mjuZvfqmPv3Pb
   6MMKY7Hdd8t8zBN7eLtwTlMtUisnZK4kMTh75FK9lEDhbuhg0LxuKuDbV
   A==;
X-CSE-ConnectionGUID: V1Fc/f1xSpyp5x1BezeSRw==
X-CSE-MsgGUID: ehZNQg54QH+UaKBoo3vx2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="35466284"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="35466284"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 04:51:14 -0700
X-CSE-ConnectionGUID: 18+KqW5IQcqJSNRThSKdLw==
X-CSE-MsgGUID: CpGFRzsKQFyyGQGoWy5zNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="95976479"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 04 Sep 2024 04:51:11 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sloXU-0007vj-2R;
	Wed, 04 Sep 2024 11:51:08 +0000
Date: Wed, 4 Sep 2024 19:50:09 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Bruel <christian.bruel@foss.st.com>, vkoul@kernel.org,
	kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, p.zabel@pengutronix.de
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	fabrice.gasnier@foss.st.com,
	Christian Bruel <christian.bruel@foss.st.com>
Subject: Re: [PATCH v5 2/5] phy: stm32: Add support for STM32MP25 COMBOPHY.
Message-ID: <202409041913.v0xzfcJ2-lkp@intel.com>
References: <20240903121303.2953150-3-christian.bruel@foss.st.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903121303.2953150-3-christian.bruel@foss.st.com>

Hi Christian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on atorgue-stm32/stm32-next]
[also build test WARNING on robh/for-next linus/master v6.11-rc6 next-20240904]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Bruel/dt-bindings-phy-Add-STM32MP25-COMBOPHY-bindings/20240903-201737
base:   https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git stm32-next
patch link:    https://lore.kernel.org/r/20240903121303.2953150-3-christian.bruel%40foss.st.com
patch subject: [PATCH v5 2/5] phy: stm32: Add support for STM32MP25 COMBOPHY.
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240904/202409041913.v0xzfcJ2-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240904/202409041913.v0xzfcJ2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409041913.v0xzfcJ2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/phy/st/phy-stm32-combophy.c:524:10: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     524 |                 return ret;
         |                        ^~~
   drivers/phy/st/phy-stm32-combophy.c:509:9: note: initialize the variable 'ret' to silence this warning
     509 |         int ret, irq;
         |                ^
         |                 = 0
   1 warning generated.


vim +/ret +524 drivers/phy/st/phy-stm32-combophy.c

   503	
   504	static int stm32_combophy_probe(struct platform_device *pdev)
   505	{
   506		struct stm32_combophy *combophy;
   507		struct device *dev = &pdev->dev;
   508		struct phy_provider *phy_provider;
   509		int ret, irq;
   510	
   511		combophy = devm_kzalloc(dev, sizeof(*combophy), GFP_KERNEL);
   512		if (!combophy)
   513			return -ENOMEM;
   514	
   515		combophy->dev = dev;
   516	
   517		dev_set_drvdata(dev, combophy);
   518	
   519		combophy->base = devm_platform_ioremap_resource(pdev, 0);
   520		if (IS_ERR(combophy->base))
   521			return PTR_ERR(combophy->base);
   522	
   523		if (stm32_combophy_get_clocks(combophy))
 > 524			return ret;
   525	
   526		combophy->phy_reset = devm_reset_control_get(dev, "phy");
   527		if (IS_ERR(combophy->phy_reset))
   528			return dev_err_probe(dev, PTR_ERR(combophy->phy_reset),
   529					     "Failed to get PHY reset\n");
   530	
   531		combophy->regmap = syscon_regmap_lookup_by_compatible("st,stm32mp25-syscfg");
   532		if (IS_ERR(combophy->regmap))
   533			return dev_err_probe(dev, PTR_ERR(combophy->regmap),
   534					     "No syscfg specified\n");
   535	
   536		combophy->phy = devm_phy_create(dev, NULL, &stm32_combophy_phy_data);
   537		if (IS_ERR(combophy->phy))
   538			return dev_err_probe(dev, PTR_ERR(combophy->phy),
   539					     "failed to create PCIe/USB3 ComboPHY\n");
   540	
   541		if (device_property_read_bool(dev, "wakeup-source")) {
   542			irq = platform_get_irq(pdev, 0);
   543			if (irq < 0)
   544				return dev_err_probe(dev, irq, "failed to get IRQ\n");
   545			combophy->irq_wakeup = irq;
   546	
   547			ret = devm_request_threaded_irq(dev, combophy->irq_wakeup, NULL,
   548							stm32_combophy_irq_wakeup_handler, IRQF_ONESHOT,
   549							NULL, NULL);
   550			if (ret)
   551				return dev_err_probe(dev, ret, "unable to request wake IRQ %d\n",
   552							 combophy->irq_wakeup);
   553		}
   554	
   555		ret = devm_pm_runtime_enable(dev);
   556		if (ret)
   557			return dev_err_probe(dev, ret, "Failed to enable pm runtime\n");
   558	
   559		phy_set_drvdata(combophy->phy, combophy);
   560	
   561		phy_provider = devm_of_phy_provider_register(dev, stm32_combophy_xlate);
   562	
   563		return PTR_ERR_OR_ZERO(phy_provider);
   564	}
   565	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
