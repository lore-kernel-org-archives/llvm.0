Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6945F24DCEB;
	Fri, 19 Sep 2025 14:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758292968; cv=none; b=R0clsDP5l5cfqbBl6NGgemS118oTR90Mvx48Q/kXTcsD9O/F+rnGzcpqhMRgMMjTXhRS+PWIhzOF3b/3uVpLZVvQz9+uw2B+aoZkwpZhawTcJ2DG1w8BfvHg5oxQT4nkUyZicgTqUzcLoXhpZtKG7u5RBPZjk+h3skxPs7LbujY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758292968; c=relaxed/simple;
	bh=+/LjB8SK3DpDKa13CqktxPN9HGVmTW0yw3Yn0xjgIIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t+taCOUoXJdPceTpNhoBeqe9NmdyWx7yK9IekWp77B4XgrWJh/3eTo5txK7kHq7P3PqHzXu/Pf78evuOTN4YBCRbwC/d5Ty+l+FQXPszhihnD0WVgsbp6FiQX+myfkwyQFm/AO8evfwk8xCil4nVIjR0Ig1kUP4ZpL8FnjC8/mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HEjaz0me; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HEjaz0me"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758292966; x=1789828966;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=+/LjB8SK3DpDKa13CqktxPN9HGVmTW0yw3Yn0xjgIIg=;
  b=HEjaz0meZHZ2SRrnnuFBqqPXHzDGkqwS1pNtjuRxHaLFZD/7z5f1nHZh
   SxKRnIFfEud4VFpuaH2ZmsL7FOX8Os5XJWGmZu7QtWJwrvt3DGrUsUN2S
   8U8eb4CpQw/ZFkTO5hSslXtAEEeba3/CaIEY5zuPxo2fm7WDGuGGjXVaX
   rprjPdRlQGG4EGdIzkF3bxuiwtxgfRqbFFolS4/i858MJ2JJNNNOrGSLn
   TpgD6NNimJFypnwgLp6MhiVsHCNB1x0ma+9vsipA+hwh+0VNP+xfTuei3
   H+sPIjTwC17eIEoI218pcCSK7h2B6ScSBdygBHL38mXyFOHXxq6e1y1BO
   Q==;
X-CSE-ConnectionGUID: MHffBfgCTs+5j8Jv2L5sxg==
X-CSE-MsgGUID: lPzJtRNTQpiJuMigFS1D+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="63272150"
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="63272150"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 07:42:45 -0700
X-CSE-ConnectionGUID: pu1M48hpSpOskjFA3sSomQ==
X-CSE-MsgGUID: +Uq4WyUHTIyCJza3j29dBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="175103070"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 19 Sep 2025 07:42:43 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzcJs-0004N5-1p;
	Fri, 19 Sep 2025 14:42:40 +0000
Date: Fri, 19 Sep 2025 22:42:10 +0800
From: kernel test robot <lkp@intel.com>
To: Ryan.Wanner@microchip.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 25/31] clk: at91: sama5d4: switch to parent_hw and
 parent_data
Message-ID: <202509192225.r2Bnob9N-lkp@intel.com>
References: <9fcc028fd62aa2f1a79b0d6bc4fb08c3637c1646.1758226719.git.Ryan.Wanner@microchip.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9fcc028fd62aa2f1a79b0d6bc4fb08c3637c1646.1758226719.git.Ryan.Wanner@microchip.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on linus/master v6.17-rc6 next-20250918]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Wanner-microchip-com/clk-at91-pmc-add-macros-for-clk_parent_data/20250919-052314
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/9fcc028fd62aa2f1a79b0d6bc4fb08c3637c1646.1758226719.git.Ryan.Wanner%40microchip.com
patch subject: [PATCH v4 25/31] clk: at91: sama5d4: switch to parent_hw and parent_data
config: arm-defconfig (https://download.01.org/0day-ci/archive/20250919/202509192225.r2Bnob9N-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7c861bcedf61607b6c087380ac711eb7ff918ca6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250919/202509192225.r2Bnob9N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509192225.r2Bnob9N-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/at91/sama5d4.c:177:13: warning: variable 'hw' is uninitialized when used here [-Wuninitialized]
     177 |         if (IS_ERR(hw))
         |                    ^~
   drivers/clk/at91/sama5d4.c:133:41: note: initialize the variable 'hw' to silence this warning
     133 |         struct clk_hw *smdck_hw, *usbck_hw, *hw;
         |                                                ^
         |                                                 = NULL
   1 warning generated.


vim +/hw +177 drivers/clk/at91/sama5d4.c

084b696bb509d5 Alexandre Belloni 2018-10-16  128  
084b696bb509d5 Alexandre Belloni 2018-10-16  129  static void __init sama5d4_pmc_setup(struct device_node *np)
084b696bb509d5 Alexandre Belloni 2018-10-16  130  {
f6ef3768385be3 Claudiu Beznea    2025-09-18  131  	struct clk_hw *main_rc_hw, *main_osc_hw, *mainck_hw;
f6ef3768385be3 Claudiu Beznea    2025-09-18  132  	const char *slow_clk_name, *main_xtal_name;
f6ef3768385be3 Claudiu Beznea    2025-09-18  133  	struct clk_hw *smdck_hw, *usbck_hw, *hw;
084b696bb509d5 Alexandre Belloni 2018-10-16  134  	struct clk_range range = CLK_RANGE(0, 0);
f6ef3768385be3 Claudiu Beznea    2025-09-18  135  	struct clk_parent_data parent_data[5];
084b696bb509d5 Alexandre Belloni 2018-10-16  136  	struct pmc_data *sama5d4_pmc;
084b696bb509d5 Alexandre Belloni 2018-10-16  137  	struct regmap *regmap;
084b696bb509d5 Alexandre Belloni 2018-10-16  138  	int i;
084b696bb509d5 Alexandre Belloni 2018-10-16  139  	bool bypass;
084b696bb509d5 Alexandre Belloni 2018-10-16  140  
084b696bb509d5 Alexandre Belloni 2018-10-16  141  	i = of_property_match_string(np, "clock-names", "slow_clk");
084b696bb509d5 Alexandre Belloni 2018-10-16  142  	if (i < 0)
084b696bb509d5 Alexandre Belloni 2018-10-16  143  		return;
084b696bb509d5 Alexandre Belloni 2018-10-16  144  
f6ef3768385be3 Claudiu Beznea    2025-09-18  145  	slow_clk_name = of_clk_get_parent_name(np, i);
084b696bb509d5 Alexandre Belloni 2018-10-16  146  
084b696bb509d5 Alexandre Belloni 2018-10-16  147  	i = of_property_match_string(np, "clock-names", "main_xtal");
084b696bb509d5 Alexandre Belloni 2018-10-16  148  	if (i < 0)
084b696bb509d5 Alexandre Belloni 2018-10-16  149  		return;
f6ef3768385be3 Claudiu Beznea    2025-09-18  150  	main_xtal_name = of_clk_get_parent_name(np, i);
084b696bb509d5 Alexandre Belloni 2018-10-16  151  
6956eb33abb5de Alexandre Belloni 2019-11-28  152  	regmap = device_node_to_regmap(np);
084b696bb509d5 Alexandre Belloni 2018-10-16  153  	if (IS_ERR(regmap))
084b696bb509d5 Alexandre Belloni 2018-10-16  154  		return;
084b696bb509d5 Alexandre Belloni 2018-10-16  155  
03a1ee1dad0e39 Michał Mirosław   2020-05-05  156  	sama5d4_pmc = pmc_data_allocate(PMC_PLLACK + 1,
084b696bb509d5 Alexandre Belloni 2018-10-16  157  					nck(sama5d4_systemck),
99767cd4406fd6 Michał Mirosław   2020-05-05  158  					nck(sama5d4_periph32ck), 0, 3);
084b696bb509d5 Alexandre Belloni 2018-10-16  159  	if (!sama5d4_pmc)
084b696bb509d5 Alexandre Belloni 2018-10-16  160  		return;
084b696bb509d5 Alexandre Belloni 2018-10-16  161  
f6ef3768385be3 Claudiu Beznea    2025-09-18  162  	main_rc_hw = at91_clk_register_main_rc_osc(regmap, "main_rc_osc", 12000000,
084b696bb509d5 Alexandre Belloni 2018-10-16  163  						   100000000);
f6ef3768385be3 Claudiu Beznea    2025-09-18  164  	if (IS_ERR(main_rc_hw))
084b696bb509d5 Alexandre Belloni 2018-10-16  165  		goto err_free;
084b696bb509d5 Alexandre Belloni 2018-10-16  166  
084b696bb509d5 Alexandre Belloni 2018-10-16  167  	bypass = of_property_read_bool(np, "atmel,osc-bypass");
084b696bb509d5 Alexandre Belloni 2018-10-16  168  
f6ef3768385be3 Claudiu Beznea    2025-09-18  169  	main_osc_hw = at91_clk_register_main_osc(regmap, "main_osc", NULL,
f6ef3768385be3 Claudiu Beznea    2025-09-18  170  						 &AT91_CLK_PD_NAME(main_xtal_name), bypass);
f6ef3768385be3 Claudiu Beznea    2025-09-18  171  	if (IS_ERR(main_osc_hw))
084b696bb509d5 Alexandre Belloni 2018-10-16  172  		goto err_free;
084b696bb509d5 Alexandre Belloni 2018-10-16  173  
f6ef3768385be3 Claudiu Beznea    2025-09-18  174  	parent_data[0] = AT91_CLK_PD_HW(main_rc_hw);
f6ef3768385be3 Claudiu Beznea    2025-09-18  175  	parent_data[1] = AT91_CLK_PD_HW(main_osc_hw);
f6ef3768385be3 Claudiu Beznea    2025-09-18  176  	mainck_hw = at91_clk_register_sam9x5_main(regmap, "mainck", NULL, parent_data, 2);
084b696bb509d5 Alexandre Belloni 2018-10-16 @177  	if (IS_ERR(hw))
084b696bb509d5 Alexandre Belloni 2018-10-16  178  		goto err_free;
084b696bb509d5 Alexandre Belloni 2018-10-16  179  
f6ef3768385be3 Claudiu Beznea    2025-09-18  180  	hw = at91_clk_register_pll(regmap, "pllack", NULL, &AT91_CLK_PD_HW(mainck_hw), 0,
084b696bb509d5 Alexandre Belloni 2018-10-16  181  				   &sama5d3_pll_layout, &plla_characteristics);
084b696bb509d5 Alexandre Belloni 2018-10-16  182  	if (IS_ERR(hw))
084b696bb509d5 Alexandre Belloni 2018-10-16  183  		goto err_free;
084b696bb509d5 Alexandre Belloni 2018-10-16  184  
f6ef3768385be3 Claudiu Beznea    2025-09-18  185  	hw = at91_clk_register_plldiv(regmap, "plladivck", NULL, &AT91_CLK_PD_HW(hw));
084b696bb509d5 Alexandre Belloni 2018-10-16  186  	if (IS_ERR(hw))
084b696bb509d5 Alexandre Belloni 2018-10-16  187  		goto err_free;
084b696bb509d5 Alexandre Belloni 2018-10-16  188  
03a1ee1dad0e39 Michał Mirosław   2020-05-05  189  	sama5d4_pmc->chws[PMC_PLLACK] = hw;
03a1ee1dad0e39 Michał Mirosław   2020-05-05  190  
f6ef3768385be3 Claudiu Beznea    2025-09-18  191  	hw = at91_clk_register_utmi(regmap, NULL, "utmick", NULL, &AT91_CLK_PD_HW(mainck_hw));
084b696bb509d5 Alexandre Belloni 2018-10-16  192  	if (IS_ERR(hw))
084b696bb509d5 Alexandre Belloni 2018-10-16  193  		goto err_free;
084b696bb509d5 Alexandre Belloni 2018-10-16  194  
084b696bb509d5 Alexandre Belloni 2018-10-16  195  	sama5d4_pmc->chws[PMC_UTMI] = hw;
084b696bb509d5 Alexandre Belloni 2018-10-16  196  
f6ef3768385be3 Claudiu Beznea    2025-09-18  197  	parent_data[0] = AT91_CLK_PD_NAME(slow_clk_name);
f6ef3768385be3 Claudiu Beznea    2025-09-18  198  	parent_data[1] = AT91_CLK_PD_HW(mainck_hw);
f6ef3768385be3 Claudiu Beznea    2025-09-18  199  	parent_data[2] = AT91_CLK_PD_HW(sama5d4_pmc->chws[PMC_PLLACK]);
f6ef3768385be3 Claudiu Beznea    2025-09-18  200  	parent_data[3] = AT91_CLK_PD_HW(sama5d4_pmc->chws[PMC_UTMI]);
7a110b9107ed8f Claudiu Beznea    2020-11-19  201  	hw = at91_clk_register_master_pres(regmap, "masterck_pres", 4,
f6ef3768385be3 Claudiu Beznea    2025-09-18  202  					   NULL, parent_data,
7a110b9107ed8f Claudiu Beznea    2020-11-19  203  					   &at91sam9x5_master_layout,
8e842f02af7e2f Claudiu Beznea    2022-02-03  204  					   &mck_characteristics, &mck_lock);
7a110b9107ed8f Claudiu Beznea    2020-11-19  205  	if (IS_ERR(hw))
7a110b9107ed8f Claudiu Beznea    2020-11-19  206  		goto err_free;
7a110b9107ed8f Claudiu Beznea    2020-11-19  207  
f6ef3768385be3 Claudiu Beznea    2025-09-18  208  	hw = at91_clk_register_master_div(regmap, "masterck_div", NULL, &AT91_CLK_PD_HW(hw),
084b696bb509d5 Alexandre Belloni 2018-10-16  209  					  &at91sam9x5_master_layout,
7a110b9107ed8f Claudiu Beznea    2020-11-19  210  					  &mck_characteristics, &mck_lock,
7029db09b2025f Claudiu Beznea    2021-10-11  211  					  CLK_SET_RATE_GATE, 0);
084b696bb509d5 Alexandre Belloni 2018-10-16  212  	if (IS_ERR(hw))
084b696bb509d5 Alexandre Belloni 2018-10-16  213  		goto err_free;
084b696bb509d5 Alexandre Belloni 2018-10-16  214  
084b696bb509d5 Alexandre Belloni 2018-10-16  215  	sama5d4_pmc->chws[PMC_MCK] = hw;
084b696bb509d5 Alexandre Belloni 2018-10-16  216  
f6ef3768385be3 Claudiu Beznea    2025-09-18  217  	hw = at91_clk_register_h32mx(regmap, "h32mxck", NULL,
f6ef3768385be3 Claudiu Beznea    2025-09-18  218  				     &AT91_CLK_PD_HW(sama5d4_pmc->chws[PMC_MCK]));
084b696bb509d5 Alexandre Belloni 2018-10-16  219  	if (IS_ERR(hw))
084b696bb509d5 Alexandre Belloni 2018-10-16  220  		goto err_free;
084b696bb509d5 Alexandre Belloni 2018-10-16  221  
084b696bb509d5 Alexandre Belloni 2018-10-16  222  	sama5d4_pmc->chws[PMC_MCK2] = hw;
084b696bb509d5 Alexandre Belloni 2018-10-16  223  
f6ef3768385be3 Claudiu Beznea    2025-09-18  224  	parent_data[0] = AT91_CLK_PD_HW(sama5d4_pmc->chws[PMC_PLLACK]);
f6ef3768385be3 Claudiu Beznea    2025-09-18  225  	parent_data[1] = AT91_CLK_PD_HW(sama5d4_pmc->chws[PMC_UTMI]);
f6ef3768385be3 Claudiu Beznea    2025-09-18  226  	usbck_hw = at91sam9x5_clk_register_usb(regmap, "usbck", NULL, parent_data, 2);
f6ef3768385be3 Claudiu Beznea    2025-09-18  227  	if (IS_ERR(usbck_hw))
084b696bb509d5 Alexandre Belloni 2018-10-16  228  		goto err_free;
084b696bb509d5 Alexandre Belloni 2018-10-16  229  
f6ef3768385be3 Claudiu Beznea    2025-09-18  230  	parent_data[0] = AT91_CLK_PD_HW(sama5d4_pmc->chws[PMC_PLLACK]);
f6ef3768385be3 Claudiu Beznea    2025-09-18  231  	parent_data[1] = AT91_CLK_PD_HW(sama5d4_pmc->chws[PMC_UTMI]);
f6ef3768385be3 Claudiu Beznea    2025-09-18  232  	smdck_hw = at91sam9x5_clk_register_smd(regmap, "smdclk", NULL, parent_data, 2);
f6ef3768385be3 Claudiu Beznea    2025-09-18  233  	if (IS_ERR(smdck_hw))
084b696bb509d5 Alexandre Belloni 2018-10-16  234  		goto err_free;
084b696bb509d5 Alexandre Belloni 2018-10-16  235  
f6ef3768385be3 Claudiu Beznea    2025-09-18  236  	parent_data[0] = AT91_CLK_PD_NAME(slow_clk_name);
f6ef3768385be3 Claudiu Beznea    2025-09-18  237  	parent_data[1] = AT91_CLK_PD_HW(mainck_hw);
f6ef3768385be3 Claudiu Beznea    2025-09-18  238  	parent_data[2] = AT91_CLK_PD_HW(sama5d4_pmc->chws[PMC_PLLACK]);
f6ef3768385be3 Claudiu Beznea    2025-09-18  239  	parent_data[3] = AT91_CLK_PD_HW(sama5d4_pmc->chws[PMC_UTMI]);
f6ef3768385be3 Claudiu Beznea    2025-09-18  240  	parent_data[4] = AT91_CLK_PD_HW(sama5d4_pmc->chws[PMC_MCK]);
084b696bb509d5 Alexandre Belloni 2018-10-16  241  	for (i = 0; i < 3; i++) {
084b696bb509d5 Alexandre Belloni 2018-10-16  242  		char name[6];
084b696bb509d5 Alexandre Belloni 2018-10-16  243  
084b696bb509d5 Alexandre Belloni 2018-10-16  244  		snprintf(name, sizeof(name), "prog%d", i);
084b696bb509d5 Alexandre Belloni 2018-10-16  245  
084b696bb509d5 Alexandre Belloni 2018-10-16  246  		hw = at91_clk_register_programmable(regmap, name,
f6ef3768385be3 Claudiu Beznea    2025-09-18  247  						    NULL, parent_data, 5, i,
c57aaaa28cf1a1 Claudiu Beznea    2020-07-22  248  						    &at91sam9x5_programmable_layout,
c57aaaa28cf1a1 Claudiu Beznea    2020-07-22  249  						    NULL);
084b696bb509d5 Alexandre Belloni 2018-10-16  250  		if (IS_ERR(hw))
084b696bb509d5 Alexandre Belloni 2018-10-16  251  			goto err_free;
99767cd4406fd6 Michał Mirosław   2020-05-05  252  
99767cd4406fd6 Michał Mirosław   2020-05-05  253  		sama5d4_pmc->pchws[i] = hw;
084b696bb509d5 Alexandre Belloni 2018-10-16  254  	}
084b696bb509d5 Alexandre Belloni 2018-10-16  255  
f6ef3768385be3 Claudiu Beznea    2025-09-18  256  	/* Set systemck parent hws. */
f6ef3768385be3 Claudiu Beznea    2025-09-18  257  	sama5d4_systemck[0].parent_hw = sama5d4_pmc->chws[PMC_MCK];
f6ef3768385be3 Claudiu Beznea    2025-09-18  258  	sama5d4_systemck[1].parent_hw = sama5d4_pmc->chws[PMC_MCK];
f6ef3768385be3 Claudiu Beznea    2025-09-18  259  	sama5d4_systemck[2].parent_hw = smdck_hw;
f6ef3768385be3 Claudiu Beznea    2025-09-18  260  	sama5d4_systemck[3].parent_hw = usbck_hw;
f6ef3768385be3 Claudiu Beznea    2025-09-18  261  	sama5d4_systemck[4].parent_hw = usbck_hw;
f6ef3768385be3 Claudiu Beznea    2025-09-18  262  	sama5d4_systemck[5].parent_hw = sama5d4_pmc->pchws[0];
f6ef3768385be3 Claudiu Beznea    2025-09-18  263  	sama5d4_systemck[6].parent_hw = sama5d4_pmc->pchws[1];
f6ef3768385be3 Claudiu Beznea    2025-09-18  264  	sama5d4_systemck[7].parent_hw = sama5d4_pmc->pchws[2];
084b696bb509d5 Alexandre Belloni 2018-10-16  265  	for (i = 0; i < ARRAY_SIZE(sama5d4_systemck); i++) {
f6ef3768385be3 Claudiu Beznea    2025-09-18  266  		hw = at91_clk_register_system(regmap, sama5d4_systemck[i].n, NULL,
f6ef3768385be3 Claudiu Beznea    2025-09-18  267  					      &AT91_CLK_PD_HW(sama5d4_systemck[i].parent_hw),
68b3b6f1773d2d Claudiu Beznea    2022-12-08  268  					      sama5d4_systemck[i].id,
68b3b6f1773d2d Claudiu Beznea    2022-12-08  269  					      sama5d4_systemck[i].flags);
084b696bb509d5 Alexandre Belloni 2018-10-16  270  		if (IS_ERR(hw))
084b696bb509d5 Alexandre Belloni 2018-10-16  271  			goto err_free;
084b696bb509d5 Alexandre Belloni 2018-10-16  272  
084b696bb509d5 Alexandre Belloni 2018-10-16  273  		sama5d4_pmc->shws[sama5d4_systemck[i].id] = hw;
084b696bb509d5 Alexandre Belloni 2018-10-16  274  	}
084b696bb509d5 Alexandre Belloni 2018-10-16  275  
084b696bb509d5 Alexandre Belloni 2018-10-16  276  	for (i = 0; i < ARRAY_SIZE(sama5d4_periphck); i++) {
084b696bb509d5 Alexandre Belloni 2018-10-16  277  		hw = at91_clk_register_sam9x5_peripheral(regmap, &pmc_pcr_lock,
cb4f4949b1c76f Alexandre Belloni 2019-04-02  278  							 &sama5d4_pcr_layout,
084b696bb509d5 Alexandre Belloni 2018-10-16  279  							 sama5d4_periphck[i].n,
f6ef3768385be3 Claudiu Beznea    2025-09-18  280  							 NULL,
f6ef3768385be3 Claudiu Beznea    2025-09-18  281  							 &AT91_CLK_PD_HW(sama5d4_pmc->chws[PMC_MCK]),
084b696bb509d5 Alexandre Belloni 2018-10-16  282  							 sama5d4_periphck[i].id,
68b3b6f1773d2d Claudiu Beznea    2022-12-08  283  							 &range, INT_MIN,
68b3b6f1773d2d Claudiu Beznea    2022-12-08  284  							 sama5d4_periphck[i].flags);
084b696bb509d5 Alexandre Belloni 2018-10-16  285  		if (IS_ERR(hw))
084b696bb509d5 Alexandre Belloni 2018-10-16  286  			goto err_free;
084b696bb509d5 Alexandre Belloni 2018-10-16  287  
084b696bb509d5 Alexandre Belloni 2018-10-16  288  		sama5d4_pmc->phws[sama5d4_periphck[i].id] = hw;
084b696bb509d5 Alexandre Belloni 2018-10-16  289  	}
084b696bb509d5 Alexandre Belloni 2018-10-16  290  
084b696bb509d5 Alexandre Belloni 2018-10-16  291  	for (i = 0; i < ARRAY_SIZE(sama5d4_periph32ck); i++) {
084b696bb509d5 Alexandre Belloni 2018-10-16  292  		hw = at91_clk_register_sam9x5_peripheral(regmap, &pmc_pcr_lock,
cb4f4949b1c76f Alexandre Belloni 2019-04-02  293  							 &sama5d4_pcr_layout,
084b696bb509d5 Alexandre Belloni 2018-10-16  294  							 sama5d4_periph32ck[i].n,
f6ef3768385be3 Claudiu Beznea    2025-09-18  295  							 NULL,
f6ef3768385be3 Claudiu Beznea    2025-09-18  296  							 &AT91_CLK_PD_HW(sama5d4_pmc->chws[PMC_MCK2]),
084b696bb509d5 Alexandre Belloni 2018-10-16  297  							 sama5d4_periph32ck[i].id,
68b3b6f1773d2d Claudiu Beznea    2022-12-08  298  							 &range, INT_MIN, 0);
084b696bb509d5 Alexandre Belloni 2018-10-16  299  		if (IS_ERR(hw))
084b696bb509d5 Alexandre Belloni 2018-10-16  300  			goto err_free;
084b696bb509d5 Alexandre Belloni 2018-10-16  301  
084b696bb509d5 Alexandre Belloni 2018-10-16  302  		sama5d4_pmc->phws[sama5d4_periph32ck[i].id] = hw;
084b696bb509d5 Alexandre Belloni 2018-10-16  303  	}
084b696bb509d5 Alexandre Belloni 2018-10-16  304  
084b696bb509d5 Alexandre Belloni 2018-10-16  305  	of_clk_add_hw_provider(np, of_clk_hw_pmc_get, sama5d4_pmc);
084b696bb509d5 Alexandre Belloni 2018-10-16  306  
084b696bb509d5 Alexandre Belloni 2018-10-16  307  	return;
084b696bb509d5 Alexandre Belloni 2018-10-16  308  
084b696bb509d5 Alexandre Belloni 2018-10-16  309  err_free:
7425f246f725e5 Michał Mirosław   2020-05-05  310  	kfree(sama5d4_pmc);
084b696bb509d5 Alexandre Belloni 2018-10-16  311  }
428d97e18594bc Tudor Ambarus     2021-02-03  312  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
