Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1697E0E3;
	Sat, 17 Feb 2024 18:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708195325; cv=none; b=TgMdz33nPc9fOgPPtbY2GQDbjzF5ZBabTNUohzvsx0HUkkA0Ufc72UEouj53qxeywh27KBpsDuu01rx320cve/xLxZTHUA9CLVNtbBILv7a2PTD4E3fy1EPMFVdlau613mGfQys/14rc5zREwPR1IFpgIg5sxFJzJUaIy6cqJ38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708195325; c=relaxed/simple;
	bh=mWardUOGWKUFxdUNZGCnQyy01Z2a4EbDqCGLIrYFD7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sga9ZLa9em+4T1w5dpTs/nRlUE3LfUEbM0bLmz8PBOAPTRhnOV9I54loVoM5EDKVT0hNwgsYmgOahCwOCEJE+SSbbGPp8MzXKe+CbGBjVGmL2DXZBd9qnaY/2lDqlQ7yiUOMduGQaxsZHLGQHosTCtH0/pqIp4i7+RpZR0Mw3DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G6AiHWIq; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G6AiHWIq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708195324; x=1739731324;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mWardUOGWKUFxdUNZGCnQyy01Z2a4EbDqCGLIrYFD7o=;
  b=G6AiHWIqlQwdrUU8Kp/AlvQbP4AeZZM8ojMzwJ91hjcechgaUGoA8J7W
   Rv3HbQt1+xH+4I60m3y+K6ibdUYDynxQDlBJpaX8j1puivIta5kvbkrMJ
   5GOt9QSZ0elNj88ExcMrUe3LDt2bh1EjuPf22O1IaUFQLtNwqgiNRMOSV
   UvMQZMDvkCe0LR/eg+FQa+CqD7NUAEm1hGyzn+yVAq1q+sNgW+cGBfaLz
   PWrDCSgaSZJA5qoAUkNx8o+Cj72vSrJrR1jqKJxFvdMau7aWW3W/hwXm6
   D88Pb+HC7x83FSuYDUpBpf15uvrT+meoV8n5sE1RdE49dq1wGp/AAH1UZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10987"; a="2439605"
X-IronPort-AV: E=Sophos;i="6.06,167,1705392000"; 
   d="scan'208";a="2439605"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2024 10:42:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,167,1705392000"; 
   d="scan'208";a="4475782"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 17 Feb 2024 10:41:59 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbPdM-0002Ow-1e;
	Sat, 17 Feb 2024 18:41:56 +0000
Date: Sun, 18 Feb 2024 02:41:41 +0800
From: kernel test robot <lkp@intel.com>
To: Yang Xiwen via B4 Relay <devnull+forbidden405.outlook.com@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 2/4] clk: hisilicon: add CRG driver for Hi3798MV200
 SoC
Message-ID: <202402180201.nL8HDrod-lkp@intel.com>
References: <20240216-clk-mv200-v1-2-a29ace29e636@outlook.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240216-clk-mv200-v1-2-a29ace29e636@outlook.com>

Hi Yang,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 8d3dea210042f54b952b481838c1e7dfc4ec751d]

url:    https://github.com/intel-lab-lkp/linux/commits/Yang-Xiwen-via-B4-Relay/dt-binding-clock-histb-clock-Add-missing-common-clock-and-Hi3798MV200-specific-clock-definition/20240216-193926
base:   8d3dea210042f54b952b481838c1e7dfc4ec751d
patch link:    https://lore.kernel.org/r/20240216-clk-mv200-v1-2-a29ace29e636%40outlook.com
patch subject: [PATCH RFC 2/4] clk: hisilicon: add CRG driver for Hi3798MV200 SoC
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240218/202402180201.nL8HDrod-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240218/202402180201.nL8HDrod-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402180201.nL8HDrod-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/hisilicon/crg-hi3798mv200.c:189:4: error: use of undeclared identifier 'HI3798MV200_USB3_REF_CLK'
           { HI3798MV200_USB3_REF_CLK, "clk_u3_ref", "125m",
             ^
>> drivers/clk/hisilicon/crg-hi3798mv200.c:229:5: error: invalid application of 'sizeof' to an incomplete type 'const struct hisi_gate_clock[]'
                                   ARRAY_SIZE(hi3798mv200_gate_clks),
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:32: note: expanded from macro 'ARRAY_SIZE'
   #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
                                  ^~~~~
   drivers/clk/hisilicon/crg-hi3798mv200.c:243:5: error: invalid application of 'sizeof' to an incomplete type 'const struct hisi_gate_clock[]'
                                   ARRAY_SIZE(hi3798mv200_gate_clks),
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:32: note: expanded from macro 'ARRAY_SIZE'
   #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
                                  ^~~~~
   drivers/clk/hisilicon/crg-hi3798mv200.c:263:5: error: invalid application of 'sizeof' to an incomplete type 'const struct hisi_gate_clock[]'
                                   ARRAY_SIZE(hi3798mv200_gate_clks),
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:32: note: expanded from macro 'ARRAY_SIZE'
   #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
                                  ^~~~~
   4 errors generated.


vim +/HI3798MV200_USB3_REF_CLK +189 drivers/clk/hisilicon/crg-hi3798mv200.c

   116	
   117	static const struct hisi_gate_clock hi3798mv200_gate_clks[] = {
   118		/* UART */
   119		{ HISTB_UART2_CLK, "clk_uart2", "75m",
   120			CLK_SET_RATE_PARENT, 0x68, 4, 0, },
   121		{ HISTB_UART3_CLK, "clk_uart3", "75m",
   122			CLK_SET_RATE_PARENT, 0x68, 6, 0, },
   123		/* I2C */
   124		{ HISTB_I2C0_CLK, "clk_i2c0", NULL,
   125			CLK_SET_RATE_PARENT, 0x6c, 4, 0, },
   126		{ HISTB_I2C1_CLK, "clk_i2c1", NULL,
   127			CLK_SET_RATE_PARENT, 0x6c, 8, 0, },
   128		{ HISTB_I2C2_CLK, "clk_i2c2", NULL,
   129			CLK_SET_RATE_PARENT, 0x6c, 12, 0, },
   130		/* SDIO */
   131		{ HISTB_SDIO0_BIU_CLK, "clk_sdio0_biu", "200m",
   132			CLK_SET_RATE_PARENT, 0x9c, 0, 0, },
   133		{ HISTB_SDIO0_CIU_CLK, "clk_sdio0_ciu", "sdio0_mux",
   134			CLK_SET_RATE_PARENT, 0x9c, 1, 0, },
   135		{ HISTB_SDIO1_BIU_CLK, "clk_sdio1_biu", "200m",
   136			CLK_SET_RATE_PARENT, 0x28c, 0, 0, },
   137		{ HISTB_SDIO1_CIU_CLK, "clk_sdio1_ciu", "sdio1_mux",
   138			CLK_SET_RATE_PARENT, 0x28c, 1, 0, },
   139		/* EMMC */
   140		{ HISTB_MMC_BIU_CLK, "clk_mmc_biu", "200m",
   141			CLK_SET_RATE_PARENT, 0xa0, 0, 0, },
   142		{ HISTB_MMC_CIU_CLK, "clk_mmc_ciu", "mmc_mux",
   143			CLK_SET_RATE_PARENT, 0xa0, 1, 0, },
   144		/* Ethernet */
   145		{ HI3798MV200_GMAC_CLK, "clk_gmac", NULL,
   146			CLK_SET_RATE_PARENT, 0xcc, 2, 0, },
   147		{ HI3798MV200_GMACIF_CLK, "clk_gmacif", NULL,
   148			CLK_SET_RATE_PARENT, 0xcc, 0, 0, },
   149		{ HI3798MV200_FEMAC_CLK, "clk_femac", NULL,
   150			CLK_SET_RATE_PARENT, 0xd0, 1, 0, },
   151		{ HI3798MV200_FEMACIF_CLK, "clk_femacif", NULL,
   152			CLK_SET_RATE_PARENT, 0xd0, 0, 0, },
   153		{ HI3798MV200_FEPHY_CLK, "clk_fephy", NULL,
   154			CLK_SET_RATE_PARENT, 0x388, 0, 0, },
   155		/* COMBPHY0 */
   156		{ HISTB_COMBPHY0_CLK, "clk_combphy0", "combphy0_mux",
   157			CLK_SET_RATE_PARENT, 0x188, 0, 0, },
   158		/* USB2 */
   159		{ HISTB_USB2_BUS_CLK, "clk_u2_bus", "clk_ahb",
   160			CLK_SET_RATE_PARENT, 0xb8, 0, 0, },
   161		{ HISTB_USB2_PHY_CLK, "clk_u2_phy", "60m",
   162			CLK_SET_RATE_PARENT, 0xb8, 4, 0, },
   163		{ HISTB_USB2_12M_CLK, "clk_u2_12m", "12m",
   164			CLK_SET_RATE_PARENT, 0xb8, 2, 0 },
   165		{ HISTB_USB2_48M_CLK, "clk_u2_48m", "48m",
   166			CLK_SET_RATE_PARENT, 0xb8, 1, 0 },
   167		{ HISTB_USB2_UTMI0_CLK, "clk_u2_utmi0", "60m",
   168			CLK_SET_RATE_PARENT, 0xb8, 5, 0 },
   169		{ HISTB_USB2_UTMI1_CLK, "clk_u2_utmi1", "60m",
   170			CLK_SET_RATE_PARENT, 0xb8, 6, 0 },
   171		{ HISTB_USB2_OTG_UTMI_CLK, "clk_u2_otg_utmi", "60m",
   172			CLK_SET_RATE_PARENT, 0xb8, 3, 0 },
   173		{ HISTB_USB2_PHY1_REF_CLK, "clk_u2_phy1_ref", "24m",
   174			CLK_SET_RATE_PARENT, 0xbc, 0, 0 },
   175		{ HISTB_USB2_PHY2_REF_CLK, "clk_u2_phy2_ref", "24m",
   176			CLK_SET_RATE_PARENT, 0xbc, 2, 0 },
   177		/* USB3 bus */
   178		{ HISTB_USB3_GM_CLK, "clk_u3_gm", "clk_ahb",
   179			CLK_SET_RATE_PARENT, 0xb0, 6, 0 },
   180		{ HISTB_USB3_GS_CLK, "clk_u3_gs", "clk_ahb",
   181			CLK_SET_RATE_PARENT, 0xb0, 5, 0 },
   182		{ HISTB_USB3_BUS_CLK, "clk_u3_bus", "clk_ahb",
   183			CLK_SET_RATE_PARENT, 0xb0, 0, 0 },
   184		/* USB3 ctrl */
   185		{ HISTB_USB3_SUSPEND_CLK, "clk_u3_suspend", NULL,
   186			CLK_SET_RATE_PARENT, 0xb0, 2, 0 },
   187		{ HISTB_USB3_PIPE_CLK, "clk_u3_pipe", NULL,
   188			CLK_SET_RATE_PARENT, 0xb0, 3, 0 },
 > 189		{ HI3798MV200_USB3_REF_CLK, "clk_u3_ref", "125m",
   190			CLK_SET_RATE_PARENT, 0xb0, 1, 0 },
   191		{ HISTB_USB3_UTMI_CLK, "clk_u3_utmi", "60m",
   192			CLK_SET_RATE_PARENT, 0xb0, 4, 0 },
   193		/* Watchdog */
   194		{ HISTB_WDG0_CLK, "clk_wdg0", "24m",
   195			CLK_SET_RATE_PARENT, 0x178, 0, 0 },
   196	};
   197	
   198	static struct hisi_clock_data *hi3798mv200_clk_register(
   199					struct platform_device *pdev)
   200	{
   201		struct hisi_clock_data *clk_data;
   202		int ret;
   203	
   204		clk_data = hisi_clk_alloc(pdev, HI3798MV200_CRG_NR_CLKS);
   205		if (!clk_data)
   206			return ERR_PTR(-ENOMEM);
   207	
   208		/* hisi_phase_clock is resource managed */
   209		ret = hisi_clk_register_phase(&pdev->dev,
   210					hi3798mv200_phase_clks,
   211					ARRAY_SIZE(hi3798mv200_phase_clks),
   212					clk_data);
   213		if (ret)
   214			return ERR_PTR(ret);
   215	
   216		ret = hisi_clk_register_fixed_rate(hi3798mv200_fixed_rate_clks,
   217					     ARRAY_SIZE(hi3798mv200_fixed_rate_clks),
   218					     clk_data);
   219		if (ret)
   220			return ERR_PTR(ret);
   221	
   222		ret = hisi_clk_register_mux(hi3798mv200_mux_clks,
   223					ARRAY_SIZE(hi3798mv200_mux_clks),
   224					clk_data);
   225		if (ret)
   226			goto unregister_fixed_rate;
   227	
   228		ret = hisi_clk_register_gate(hi3798mv200_gate_clks,
 > 229					ARRAY_SIZE(hi3798mv200_gate_clks),
   230					clk_data);
   231		if (ret)
   232			goto unregister_mux;
   233	
   234		ret = of_clk_add_provider(pdev->dev.of_node,
   235				of_clk_src_onecell_get, &clk_data->clk_data);
   236		if (ret)
   237			goto unregister_gate;
   238	
   239		return clk_data;
   240	
   241	unregister_gate:
   242		hisi_clk_unregister_gate(hi3798mv200_gate_clks,
   243					ARRAY_SIZE(hi3798mv200_gate_clks),
   244					clk_data);
   245	unregister_mux:
   246		hisi_clk_unregister_mux(hi3798mv200_mux_clks,
   247					ARRAY_SIZE(hi3798mv200_mux_clks),
   248					clk_data);
   249	unregister_fixed_rate:
   250		hisi_clk_unregister_fixed_rate(hi3798mv200_fixed_rate_clks,
   251					ARRAY_SIZE(hi3798mv200_fixed_rate_clks),
   252					clk_data);
   253		return ERR_PTR(ret);
   254	}
   255	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
