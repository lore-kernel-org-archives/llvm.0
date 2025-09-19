Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF6C86347;
	Fri, 19 Sep 2025 11:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758281610; cv=none; b=EDk1mz4scb4yfnipN4068jsoMlcPiSUu4DxMP2YT076PcZtOYpN1zCsb3EjPDZDEX5ciD3qm3l4c/tWF/40ECRWZ5KY/EDpgo56uqC7inlmpUNFVkrP2HNrIK47VU0Jc8KrOntgFk/nK2VLc7Dec2dNWUz3DHLDh/VIvioQFdso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758281610; c=relaxed/simple;
	bh=1icPsy5sdniii3lbwXoS/HgyrK2nObNHPdYSMb66u2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OKfCiGG4WsppZWYXJclavyPnfoBQs1iPAMWa/LJh7MyCEpnKdLpgEFM+dQF9/f7WmR5FneYfnuKpn1E/Or9rPF4D3O+f6qSHUj7ZgByaRPnBGtjyEsH/we2ARoVhRhtR3NbV7CAnyqtVQGkYkMkZnjLUZRNuE/7vmxYW5RD1KiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=exBS7Swb; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="exBS7Swb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758281608; x=1789817608;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1icPsy5sdniii3lbwXoS/HgyrK2nObNHPdYSMb66u2I=;
  b=exBS7SwbATHF+FsZIKkjjbMfxmfkar5tp+GEp1T9G2xog5KrKFX3sUF8
   +GP/JOWl8EeT4eEiPOQmaKMfY4CeACUVYEtRf3sFPq7L58j5OwfOf1pbZ
   VFA7A7fwYq7+eaGdpzy11Rqj77hKo9pIvThceZpsJjgb/29lzratGOxP1
   7DsetUT5Vidz3ivGa1PMntWc55vjCYeseOzSUeD4FPe0HFsWR0dtCMAFT
   hsxk2V+FVHyapHk+6iE17TSg6rt/kaVdfYZjjfyM3iakLr7E7sLIGljIv
   lQLa/vIbwMLZ0LmBNfW/tqm0JxIWbTqrqTSEUcTmxwDVs8M1nkQgVcYZD
   w==;
X-CSE-ConnectionGUID: g8OVmdIpSBmK3oyMVS0otg==
X-CSE-MsgGUID: yEWaTJCMRrKOuSkTmKJaWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="83229904"
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; 
   d="scan'208";a="83229904"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 04:33:28 -0700
X-CSE-ConnectionGUID: Ib36PjkKR2WKopPvZCIEGw==
X-CSE-MsgGUID: BH+45s+hRgWhDR7l7bKqig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; 
   d="scan'208";a="175372302"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 19 Sep 2025 04:33:26 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzZMh-0004Ft-1t;
	Fri, 19 Sep 2025 11:33:23 +0000
Date: Fri, 19 Sep 2025 19:33:13 +0800
From: kernel test robot <lkp@intel.com>
To: Ryan.Wanner@microchip.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 07/31] clk: at91: clk-utmi: use clk_parent_data
Message-ID: <202509191925.YQKu4crW-lkp@intel.com>
References: <87a3e3615345c975acc669207cd8bd9f849b0fb0.1758226719.git.Ryan.Wanner@microchip.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a3e3615345c975acc669207cd8bd9f849b0fb0.1758226719.git.Ryan.Wanner@microchip.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on linus/master v6.17-rc6 next-20250918]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Wanner-microchip-com/clk-at91-pmc-add-macros-for-clk_parent_data/20250919-052314
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/87a3e3615345c975acc669207cd8bd9f849b0fb0.1758226719.git.Ryan.Wanner%40microchip.com
patch subject: [PATCH v4 07/31] clk: at91: clk-utmi: use clk_parent_data
config: arm-defconfig (https://download.01.org/0day-ci/archive/20250919/202509191925.YQKu4crW-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7c861bcedf61607b6c087380ac711eb7ff918ca6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250919/202509191925.YQKu4crW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509191925.YQKu4crW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/at91/sama7g5.c:1052:5: warning: variable 'parent_rate' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
    1052 |                                 default:
         |                                 ^~~~~~~
   drivers/clk/at91/sama7g5.c:1057:10: note: uninitialized use occurs here
    1057 |                                 if (!parent_rate)
         |                                      ^~~~~~~~~~~
   drivers/clk/at91/sama7g5.c:1032:29: note: initialize the variable 'parent_rate' to silence this warning
    1032 |                         unsigned long parent_rate;
         |                                                  ^
         |                                                   = 0
   1 warning generated.


vim +/parent_rate +1052 drivers/clk/at91/sama7g5.c

cb783bbbcf54c3 Claudiu Beznea     2020-07-22   969  
cb783bbbcf54c3 Claudiu Beznea     2020-07-22   970  static void __init sama7g5_pmc_setup(struct device_node *np)
cb783bbbcf54c3 Claudiu Beznea     2020-07-22   971  {
791a97d80d9a36 Claudiu Beznea     2025-09-18   972  	const char *main_xtal_name;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22   973  	struct pmc_data *sama7g5_pmc;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22   974  	void **alloc_mem = NULL;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22   975  	int alloc_mem_size = 0;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22   976  	struct regmap *regmap;
b59c33dd08b90d Claudiu Beznea     2025-09-18   977  	struct clk_hw *hw, *main_rc_hw, *main_osc_hw;
de3383e993a588 Claudiu Beznea     2023-06-15   978  	struct clk_hw *td_slck_hw, *md_slck_hw;
b59c33dd08b90d Claudiu Beznea     2025-09-18   979  	struct clk_parent_data parent_data[2];
de3383e993a588 Claudiu Beznea     2023-06-15   980  	struct clk_hw *parent_hws[10];
b59c33dd08b90d Claudiu Beznea     2025-09-18   981  	struct clk *main_xtal;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22   982  	bool bypass;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22   983  	int i, j;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22   984  
de3383e993a588 Claudiu Beznea     2023-06-15   985  	td_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "td_slck"));
de3383e993a588 Claudiu Beznea     2023-06-15   986  	md_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "md_slck"));
791a97d80d9a36 Claudiu Beznea     2025-09-18   987  	i = of_property_match_string(np, "clock-names", "main_xtal");
cb783bbbcf54c3 Claudiu Beznea     2020-07-22   988  
791a97d80d9a36 Claudiu Beznea     2025-09-18   989  	if (!td_slck_hw || !md_slck_hw || !i)
cb783bbbcf54c3 Claudiu Beznea     2020-07-22   990  		return;
791a97d80d9a36 Claudiu Beznea     2025-09-18   991  	main_xtal_name = of_clk_get_parent_name(np, i);
cb783bbbcf54c3 Claudiu Beznea     2020-07-22   992  
cb783bbbcf54c3 Claudiu Beznea     2020-07-22   993  	regmap = device_node_to_regmap(np);
cb783bbbcf54c3 Claudiu Beznea     2020-07-22   994  	if (IS_ERR(regmap))
cb783bbbcf54c3 Claudiu Beznea     2020-07-22   995  		return;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22   996  
a5ab04af49434a Tudor Ambarus      2022-01-11   997  	sama7g5_pmc = pmc_data_allocate(PMC_MCK1 + 1,
cb783bbbcf54c3 Claudiu Beznea     2020-07-22   998  					nck(sama7g5_systemck),
cb783bbbcf54c3 Claudiu Beznea     2020-07-22   999  					nck(sama7g5_periphck),
91274497c79170 Claudiu Beznea     2020-11-19  1000  					nck(sama7g5_gck), 8);
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1001  	if (!sama7g5_pmc)
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1002  		return;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1003  
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1004  	alloc_mem = kmalloc(sizeof(void *) *
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1005  			    (ARRAY_SIZE(sama7g5_mckx) + ARRAY_SIZE(sama7g5_gck)),
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1006  			    GFP_KERNEL);
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1007  	if (!alloc_mem)
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1008  		goto err_free;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1009  
de3383e993a588 Claudiu Beznea     2023-06-15  1010  	main_rc_hw = at91_clk_register_main_rc_osc(regmap, "main_rc_osc", 12000000,
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1011  						   50000000);
de3383e993a588 Claudiu Beznea     2023-06-15  1012  	if (IS_ERR(main_rc_hw))
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1013  		goto err_free;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1014  
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1015  	bypass = of_property_read_bool(np, "atmel,osc-bypass");
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1016  
de3383e993a588 Claudiu Beznea     2023-06-15  1017  	main_osc_hw = at91_clk_register_main_osc(regmap, "main_osc", NULL,
791a97d80d9a36 Claudiu Beznea     2025-09-18  1018  						 &AT91_CLK_PD_NAME(main_xtal_name), bypass);
de3383e993a588 Claudiu Beznea     2023-06-15  1019  	if (IS_ERR(main_osc_hw))
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1020  		goto err_free;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1021  
83673ef8e106e6 Claudiu Beznea     2025-09-18  1022  	parent_data[0] = AT91_CLK_PD_HW(main_rc_hw);
83673ef8e106e6 Claudiu Beznea     2025-09-18  1023  	parent_data[1] = AT91_CLK_PD_HW(main_osc_hw);
83673ef8e106e6 Claudiu Beznea     2025-09-18  1024  	hw = at91_clk_register_sam9x5_main(regmap, "mainck", NULL, parent_data, 2);
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1025  	if (IS_ERR(hw))
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1026  		goto err_free;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1027  
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1028  	sama7g5_pmc->chws[PMC_MAIN] = hw;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1029  
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1030  	for (i = 0; i < PLL_ID_MAX; i++) {
2d6e9ee7cb3e79 Claudiu Beznea     2024-07-14  1031  		for (j = 0; j < PLL_COMPID_MAX; j++) {
791a97d80d9a36 Claudiu Beznea     2025-09-18  1032  			unsigned long parent_rate;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1033  
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1034  			if (!sama7g5_plls[i][j].n)
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1035  				continue;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1036  
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1037  			switch (sama7g5_plls[i][j].t) {
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1038  			case PLL_TYPE_FRAC:
de3383e993a588 Claudiu Beznea     2023-06-15  1039  				switch (sama7g5_plls[i][j].p) {
de3383e993a588 Claudiu Beznea     2023-06-15  1040  				case SAMA7G5_PLL_PARENT_MAINCK:
b59c33dd08b90d Claudiu Beznea     2025-09-18  1041  					parent_data[0] = AT91_CLK_PD_NAME("mainck");
b59c33dd08b90d Claudiu Beznea     2025-09-18  1042  					parent_rate = clk_hw_get_rate(sama7g5_pmc->chws[PMC_MAIN]);
de3383e993a588 Claudiu Beznea     2023-06-15  1043  					break;
de3383e993a588 Claudiu Beznea     2023-06-15  1044  				case SAMA7G5_PLL_PARENT_MAIN_XTAL:
b59c33dd08b90d Claudiu Beznea     2025-09-18  1045  					main_xtal = of_clk_get_by_name(np, main_xtal_name);
b59c33dd08b90d Claudiu Beznea     2025-09-18  1046  					if (IS_ERR(main_xtal))
b59c33dd08b90d Claudiu Beznea     2025-09-18  1047  						goto err_free;
b59c33dd08b90d Claudiu Beznea     2025-09-18  1048  					parent_data[0] = AT91_CLK_PD_NAME(main_xtal_name);
b59c33dd08b90d Claudiu Beznea     2025-09-18  1049  					parent_rate = clk_get_rate(main_xtal);
b59c33dd08b90d Claudiu Beznea     2025-09-18  1050  					clk_put(main_xtal);
de3383e993a588 Claudiu Beznea     2023-06-15  1051  					break;
de3383e993a588 Claudiu Beznea     2023-06-15 @1052  				default:
de3383e993a588 Claudiu Beznea     2023-06-15  1053  					/* Should not happen. */
de3383e993a588 Claudiu Beznea     2023-06-15  1054  					break;
de3383e993a588 Claudiu Beznea     2023-06-15  1055  				}
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1056  
791a97d80d9a36 Claudiu Beznea     2025-09-18  1057  				if (!parent_rate)
791a97d80d9a36 Claudiu Beznea     2025-09-18  1058  					return;
791a97d80d9a36 Claudiu Beznea     2025-09-18  1059  
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1060  				hw = sam9x60_clk_register_frac_pll(regmap,
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1061  					&pmc_pll_lock, sama7g5_plls[i][j].n,
83673ef8e106e6 Claudiu Beznea     2025-09-18  1062  					parent_data, parent_rate, i,
120d5d8b4614ee Claudiu Beznea     2020-11-19  1063  					sama7g5_plls[i][j].c,
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1064  					sama7g5_plls[i][j].l,
8dc4af8bef1274 Claudiu Beznea     2020-11-19  1065  					sama7g5_plls[i][j].f);
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1066  				break;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1067  
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1068  			case PLL_TYPE_DIV:
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1069  				hw = sam9x60_clk_register_div_pll(regmap,
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1070  					&pmc_pll_lock, sama7g5_plls[i][j].n,
de3383e993a588 Claudiu Beznea     2023-06-15  1071  					NULL, sama7g5_plls[i][0].hw, i,
120d5d8b4614ee Claudiu Beznea     2020-11-19  1072  					sama7g5_plls[i][j].c,
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1073  					sama7g5_plls[i][j].l,
1e229c21a47241 Claudiu Beznea     2021-10-11  1074  					sama7g5_plls[i][j].f,
1e229c21a47241 Claudiu Beznea     2021-10-11  1075  					sama7g5_plls[i][j].safe_div);
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1076  				break;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1077  
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1078  			default:
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1079  				continue;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1080  			}
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1081  
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1082  			if (IS_ERR(hw))
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1083  				goto err_free;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1084  
de3383e993a588 Claudiu Beznea     2023-06-15  1085  			sama7g5_plls[i][j].hw = hw;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1086  			if (sama7g5_plls[i][j].eid)
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1087  				sama7g5_pmc->chws[sama7g5_plls[i][j].eid] = hw;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1088  		}
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1089  	}
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1090  
de3383e993a588 Claudiu Beznea     2023-06-15  1091  	hw = at91_clk_register_master_div(regmap, "mck0", NULL,
de3383e993a588 Claudiu Beznea     2023-06-15  1092  					  sama7g5_plls[PLL_ID_CPU][1].hw,
7a110b9107ed8f Claudiu Beznea     2020-11-19  1093  					  &mck0_layout, &mck0_characteristics,
7029db09b2025f Claudiu Beznea     2021-10-11  1094  					  &pmc_mck0_lock, CLK_GET_RATE_NOCACHE, 5);
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1095  	if (IS_ERR(hw))
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1096  		goto err_free;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1097  
de3383e993a588 Claudiu Beznea     2023-06-15  1098  	sama7g5_mckx[PCK_PARENT_HW_MCK0].hw = sama7g5_pmc->chws[PMC_MCK] = hw;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1099  
de3383e993a588 Claudiu Beznea     2023-06-15  1100  	parent_hws[0] = md_slck_hw;
de3383e993a588 Claudiu Beznea     2023-06-15  1101  	parent_hws[1] = td_slck_hw;
de3383e993a588 Claudiu Beznea     2023-06-15  1102  	parent_hws[2] = sama7g5_pmc->chws[PMC_MAIN];
de3383e993a588 Claudiu Beznea     2023-06-15  1103  	for (i = PCK_PARENT_HW_MCK1; i < ARRAY_SIZE(sama7g5_mckx); i++) {
4011f03ee4756d Claudiu Beznea     2020-11-19  1104  		u8 num_parents = 3 + sama7g5_mckx[i].ep_count;
de3383e993a588 Claudiu Beznea     2023-06-15  1105  		struct clk_hw *tmp_parent_hws[8];
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1106  		u32 *mux_table;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1107  
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1108  		mux_table = kmalloc_array(num_parents, sizeof(*mux_table),
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1109  					  GFP_KERNEL);
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1110  		if (!mux_table)
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1111  			goto err_free;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1112  
5bf194adedb921 Varshini Rajendran 2024-07-29  1113  		PMC_INIT_TABLE(mux_table, 3);
5bf194adedb921 Varshini Rajendran 2024-07-29  1114  		PMC_FILL_TABLE(&mux_table[3], sama7g5_mckx[i].ep_mux_table,
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1115  			       sama7g5_mckx[i].ep_count);
de3383e993a588 Claudiu Beznea     2023-06-15  1116  		for (j = 0; j < sama7g5_mckx[i].ep_count; j++) {
de3383e993a588 Claudiu Beznea     2023-06-15  1117  			u8 pll_id = sama7g5_mckx[i].ep[j].pll_id;
de3383e993a588 Claudiu Beznea     2023-06-15  1118  			u8 pll_compid = sama7g5_mckx[i].ep[j].pll_compid;
de3383e993a588 Claudiu Beznea     2023-06-15  1119  
de3383e993a588 Claudiu Beznea     2023-06-15  1120  			tmp_parent_hws[j] = sama7g5_plls[pll_id][pll_compid].hw;
de3383e993a588 Claudiu Beznea     2023-06-15  1121  		}
5bf194adedb921 Varshini Rajendran 2024-07-29  1122  		PMC_FILL_TABLE(&parent_hws[3], tmp_parent_hws,
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1123  			       sama7g5_mckx[i].ep_count);
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1124  
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1125  		hw = at91_clk_sama7g5_register_master(regmap, sama7g5_mckx[i].n,
de3383e993a588 Claudiu Beznea     2023-06-15  1126  				   num_parents, NULL, parent_hws, mux_table,
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1127  				   &pmc_mckX_lock, sama7g5_mckx[i].id,
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1128  				   sama7g5_mckx[i].c,
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1129  				   sama7g5_mckx[i].ep_chg_id);
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1130  		if (IS_ERR(hw))
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1131  			goto err_free;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1132  
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1133  		alloc_mem[alloc_mem_size++] = mux_table;
a5ab04af49434a Tudor Ambarus      2022-01-11  1134  
de3383e993a588 Claudiu Beznea     2023-06-15  1135  		sama7g5_mckx[i].hw = hw;
a5ab04af49434a Tudor Ambarus      2022-01-11  1136  		if (sama7g5_mckx[i].eid)
a5ab04af49434a Tudor Ambarus      2022-01-11  1137  			sama7g5_pmc->chws[sama7g5_mckx[i].eid] = hw;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1138  	}
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1139  
b59c33dd08b90d Claudiu Beznea     2025-09-18  1140  	hw = at91_clk_sama7g5_register_utmi(regmap, "utmick", NULL,
b59c33dd08b90d Claudiu Beznea     2025-09-18  1141  					    &AT91_CLK_PD_NAME(main_xtal_name));
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1142  	if (IS_ERR(hw))
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1143  		goto err_free;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1144  
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1145  	sama7g5_pmc->chws[PMC_UTMI] = hw;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1146  
de3383e993a588 Claudiu Beznea     2023-06-15  1147  	parent_hws[0] = md_slck_hw;
de3383e993a588 Claudiu Beznea     2023-06-15  1148  	parent_hws[1] = td_slck_hw;
de3383e993a588 Claudiu Beznea     2023-06-15  1149  	parent_hws[2] = sama7g5_pmc->chws[PMC_MAIN];
de3383e993a588 Claudiu Beznea     2023-06-15  1150  	parent_hws[3] = sama7g5_plls[PLL_ID_SYS][PLL_COMPID_DIV0].hw;
de3383e993a588 Claudiu Beznea     2023-06-15  1151  	parent_hws[4] = sama7g5_plls[PLL_ID_DDR][PLL_COMPID_DIV0].hw;
de3383e993a588 Claudiu Beznea     2023-06-15  1152  	parent_hws[5] = sama7g5_plls[PLL_ID_IMG][PLL_COMPID_DIV0].hw;
de3383e993a588 Claudiu Beznea     2023-06-15  1153  	parent_hws[6] = sama7g5_plls[PLL_ID_BAUD][PLL_COMPID_DIV0].hw;
de3383e993a588 Claudiu Beznea     2023-06-15  1154  	parent_hws[7] = sama7g5_plls[PLL_ID_AUDIO][PLL_COMPID_DIV0].hw;
de3383e993a588 Claudiu Beznea     2023-06-15  1155  	parent_hws[8] = sama7g5_plls[PLL_ID_ETH][PLL_COMPID_DIV0].hw;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1156  	for (i = 0; i < 8; i++) {
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1157  		char name[6];
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1158  
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1159  		snprintf(name, sizeof(name), "prog%d", i);
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1160  
de3383e993a588 Claudiu Beznea     2023-06-15  1161  		hw = at91_clk_register_programmable(regmap, name, NULL, parent_hws,
de3383e993a588 Claudiu Beznea     2023-06-15  1162  						    9, i,
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1163  						    &programmable_layout,
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1164  						    sama7g5_prog_mux_table);
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1165  		if (IS_ERR(hw))
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1166  			goto err_free;
91274497c79170 Claudiu Beznea     2020-11-19  1167  
91274497c79170 Claudiu Beznea     2020-11-19  1168  		sama7g5_pmc->pchws[i] = hw;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1169  	}
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1170  
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1171  	for (i = 0; i < ARRAY_SIZE(sama7g5_systemck); i++) {
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1172  		hw = at91_clk_register_system(regmap, sama7g5_systemck[i].n,
de3383e993a588 Claudiu Beznea     2023-06-15  1173  					      NULL, sama7g5_pmc->pchws[i],
68b3b6f1773d2d Claudiu Beznea     2022-12-08  1174  					      sama7g5_systemck[i].id, 0);
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1175  		if (IS_ERR(hw))
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1176  			goto err_free;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1177  
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1178  		sama7g5_pmc->shws[sama7g5_systemck[i].id] = hw;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1179  	}
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1180  
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1181  	for (i = 0; i < ARRAY_SIZE(sama7g5_periphck); i++) {
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1182  		hw = at91_clk_register_sam9x5_peripheral(regmap, &pmc_pcr_lock,
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1183  						&sama7g5_pcr_layout,
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1184  						sama7g5_periphck[i].n,
de3383e993a588 Claudiu Beznea     2023-06-15  1185  						NULL,
58b31f8bee1381 Claudiu Beznea     2025-09-18  1186  						&AT91_CLK_PD_HW(sama7g5_mckx[sama7g5_periphck[i].p].hw),
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1187  						sama7g5_periphck[i].id,
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1188  						&sama7g5_periphck[i].r,
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1189  						sama7g5_periphck[i].chgp ? 0 :
68b3b6f1773d2d Claudiu Beznea     2022-12-08  1190  						INT_MIN, 0);
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1191  		if (IS_ERR(hw))
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1192  			goto err_free;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1193  
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1194  		sama7g5_pmc->phws[sama7g5_periphck[i].id] = hw;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1195  	}
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1196  
de3383e993a588 Claudiu Beznea     2023-06-15  1197  	parent_hws[0] = md_slck_hw;
de3383e993a588 Claudiu Beznea     2023-06-15  1198  	parent_hws[1] = td_slck_hw;
de3383e993a588 Claudiu Beznea     2023-06-15  1199  	parent_hws[2] = sama7g5_pmc->chws[PMC_MAIN];
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1200  	for (i = 0; i < ARRAY_SIZE(sama7g5_gck); i++) {
4011f03ee4756d Claudiu Beznea     2020-11-19  1201  		u8 num_parents = 3 + sama7g5_gck[i].pp_count;
de3383e993a588 Claudiu Beznea     2023-06-15  1202  		struct clk_hw *tmp_parent_hws[8];
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1203  		u32 *mux_table;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1204  
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1205  		mux_table = kmalloc_array(num_parents, sizeof(*mux_table),
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1206  					  GFP_KERNEL);
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1207  		if (!mux_table)
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1208  			goto err_free;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1209  
5bf194adedb921 Varshini Rajendran 2024-07-29  1210  		PMC_INIT_TABLE(mux_table, 3);
5bf194adedb921 Varshini Rajendran 2024-07-29  1211  		PMC_FILL_TABLE(&mux_table[3], sama7g5_gck[i].pp_mux_table,
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1212  			       sama7g5_gck[i].pp_count);
de3383e993a588 Claudiu Beznea     2023-06-15  1213  		for (j = 0; j < sama7g5_gck[i].pp_count; j++) {
de3383e993a588 Claudiu Beznea     2023-06-15  1214  			u8 pll_id = sama7g5_gck[i].pp[j].pll_id;
de3383e993a588 Claudiu Beznea     2023-06-15  1215  			u8 pll_compid = sama7g5_gck[i].pp[j].pll_compid;
de3383e993a588 Claudiu Beznea     2023-06-15  1216  
de3383e993a588 Claudiu Beznea     2023-06-15  1217  			tmp_parent_hws[j] = sama7g5_plls[pll_id][pll_compid].hw;
de3383e993a588 Claudiu Beznea     2023-06-15  1218  		}
5bf194adedb921 Varshini Rajendran 2024-07-29  1219  		PMC_FILL_TABLE(&parent_hws[3], tmp_parent_hws,
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1220  			       sama7g5_gck[i].pp_count);
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1221  
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1222  		hw = at91_clk_register_generated(regmap, &pmc_pcr_lock,
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1223  						 &sama7g5_pcr_layout,
de3383e993a588 Claudiu Beznea     2023-06-15  1224  						 sama7g5_gck[i].n, NULL,
de3383e993a588 Claudiu Beznea     2023-06-15  1225  						 parent_hws, mux_table,
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1226  						 num_parents,
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1227  						 sama7g5_gck[i].id,
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1228  						 &sama7g5_gck[i].r,
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1229  						 sama7g5_gck[i].pp_chg_id);
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1230  		if (IS_ERR(hw))
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1231  			goto err_free;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1232  
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1233  		sama7g5_pmc->ghws[sama7g5_gck[i].id] = hw;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1234  		alloc_mem[alloc_mem_size++] = mux_table;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1235  	}
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1236  
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1237  	of_clk_add_hw_provider(np, of_clk_hw_pmc_get, sama7g5_pmc);
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1238  
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1239  	return;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1240  
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1241  err_free:
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1242  	if (alloc_mem) {
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1243  		for (i = 0; i < alloc_mem_size; i++)
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1244  			kfree(alloc_mem[i]);
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1245  		kfree(alloc_mem);
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1246  	}
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1247  
91274497c79170 Claudiu Beznea     2020-11-19  1248  	kfree(sama7g5_pmc);
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1249  }
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1250  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
