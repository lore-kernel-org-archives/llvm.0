Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9E217993;
	Sat, 17 Jan 2026 14:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768658884; cv=none; b=rj8Wr1UT9kMKazcu/DRkEJU3co9wBLRrtcuLEGsy8dDYk6HJ7g+wal/FOEJtZUZWVbZvl2wu7V6MJQu7chhqPVt9mIr02OWHNj2UZlSJqhe5OMtnJMq1YyI6XVZP3t56tC/QpvOGMhQfbiM5cp2oMXs6yVw9TUYfTnBlon6DFOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768658884; c=relaxed/simple;
	bh=UNQQkhucoIwrOSQc7Uf+/TLKG3t3rSi02MytNnHmeyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WX+M94k0koc3D+TeNSPKhDX3qNN1Ozss9zIRzlmoJ8NmzXm5MVQsPSA1WJLnrLm8QvhBKXLD2iJderapr1T8WPPqF8gB0+7Dw8roOirezlMHfKlTTngq/OdYXCreELX+IJ8qhN/6eml/UsqTEas8JNZxa9EkCA13ESe/wQXYBvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TkRxPF9L; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TkRxPF9L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768658883; x=1800194883;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UNQQkhucoIwrOSQc7Uf+/TLKG3t3rSi02MytNnHmeyA=;
  b=TkRxPF9LCTj/w0AOa/NtMFflRfq2JTXLG9KkoolYmo/o9WusHcP0RIX2
   yBZtdfr4MUvoE9S7hIlAJ+tGU4stV9NrpEgXO7rHpA8lxqurcF4uKT6eq
   ZIfvma+caKRSMEiXiPpDc3R42YcJp6Yab7rleypuI7T4thHJvZeEEqSe6
   vqDNugZV2elxLnWsPLPzuzUVr7/gnc+QYJV3aNFVxhI01mxl7c2QWCiaQ
   F+rUsOqg1WkPHz7cd3Uup3uRsKyvI4RKmQGHA76+xdsRbN6zu1iLgEI/i
   sGCRaDcozyf9G+XjRuCrYTkoO9/MJVwvwT1y+7qyAiqPrikFt7/Vffsrs
   Q==;
X-CSE-ConnectionGUID: iP++7WMUS5C+CC6yn6pGwQ==
X-CSE-MsgGUID: TOw3dr4MSQ6trpEt32IA3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="69680728"
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="69680728"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 06:08:02 -0800
X-CSE-ConnectionGUID: rXEYbE9WSwatosKW6StfTQ==
X-CSE-MsgGUID: 6CecPWbzTwiRXRuw1MRZ+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="236164033"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 17 Jan 2026 06:08:00 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vh6y5-00000000LuO-1XCx;
	Sat, 17 Jan 2026 14:07:57 +0000
Date: Sat, 17 Jan 2026 22:07:03 +0800
From: kernel test robot <lkp@intel.com>
To: ryan.wanner@microchip.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 07/31] clk: at91: clk-utmi: use clk_parent_data
Message-ID: <202601172145.T6n9Wbtp-lkp@intel.com>
References: <e7757e961b1ba514bcab3178ac65b4ee8040b80c.1768512290.git.ryan.wanner@microchip.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7757e961b1ba514bcab3178ac65b4ee8040b80c.1768512290.git.ryan.wanner@microchip.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on linus/master v6.19-rc5 next-20260116]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/ryan-wanner-microchip-com/clk-at91-pmc-add-macros-for-clk_parent_data/20260117-041915
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/e7757e961b1ba514bcab3178ac65b4ee8040b80c.1768512290.git.ryan.wanner%40microchip.com
patch subject: [PATCH v5 07/31] clk: at91: clk-utmi: use clk_parent_data
config: arm-defconfig (https://download.01.org/0day-ci/archive/20260117/202601172145.T6n9Wbtp-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601172145.T6n9Wbtp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601172145.T6n9Wbtp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/at91/sama7g5.c:1057:5: warning: variable 'parent_rate' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
    1057 |                                 default:
         |                                 ^~~~~~~
   drivers/clk/at91/sama7g5.c:1062:10: note: uninitialized use occurs here
    1062 |                                 if (!parent_rate)
         |                                      ^~~~~~~~~~~
   drivers/clk/at91/sama7g5.c:1036:29: note: initialize the variable 'parent_rate' to silence this warning
    1036 |                         unsigned long parent_rate;
         |                                                  ^
         |                                                   = 0
   1 warning generated.


vim +/parent_rate +1057 drivers/clk/at91/sama7g5.c

cb783bbbcf54c3 Claudiu Beznea     2020-07-22   971  
cb783bbbcf54c3 Claudiu Beznea     2020-07-22   972  static void __init sama7g5_pmc_setup(struct device_node *np)
cb783bbbcf54c3 Claudiu Beznea     2020-07-22   973  {
724192a3529cea Claudiu Beznea     2026-01-16   974  	const char *main_xtal_name;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22   975  	struct pmc_data *sama7g5_pmc;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22   976  	void **alloc_mem = NULL;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22   977  	int alloc_mem_size = 0;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22   978  	struct regmap *regmap;
25adc0e4a737dd Claudiu Beznea     2026-01-16   979  	struct clk_hw *hw, *main_rc_hw, *main_osc_hw;
de3383e993a588 Claudiu Beznea     2023-06-15   980  	struct clk_hw *td_slck_hw, *md_slck_hw;
3be2fbeed6c10f Claudiu Beznea     2026-01-16   981  	struct clk_parent_data parent_data[2];
de3383e993a588 Claudiu Beznea     2023-06-15   982  	struct clk_hw *parent_hws[10];
cb783bbbcf54c3 Claudiu Beznea     2020-07-22   983  	bool bypass;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22   984  	int i, j;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22   985  
724192a3529cea Claudiu Beznea     2026-01-16   986  	i = of_property_match_string(np, "clock-names", "main_xtal");
724192a3529cea Claudiu Beznea     2026-01-16   987  	if (i < 0)
724192a3529cea Claudiu Beznea     2026-01-16   988  		return;
724192a3529cea Claudiu Beznea     2026-01-16   989  	main_xtal_name = of_clk_get_parent_name(np, i);
724192a3529cea Claudiu Beznea     2026-01-16   990  
de3383e993a588 Claudiu Beznea     2023-06-15   991  	td_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "td_slck"));
de3383e993a588 Claudiu Beznea     2023-06-15   992  	md_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "md_slck"));
cb783bbbcf54c3 Claudiu Beznea     2020-07-22   993  
724192a3529cea Claudiu Beznea     2026-01-16   994  	if (!td_slck_hw || !md_slck_hw)
cb783bbbcf54c3 Claudiu Beznea     2020-07-22   995  		return;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22   996  
cb783bbbcf54c3 Claudiu Beznea     2020-07-22   997  	regmap = device_node_to_regmap(np);
cb783bbbcf54c3 Claudiu Beznea     2020-07-22   998  	if (IS_ERR(regmap))
cb783bbbcf54c3 Claudiu Beznea     2020-07-22   999  		return;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1000  
a5ab04af49434a Tudor Ambarus      2022-01-11  1001  	sama7g5_pmc = pmc_data_allocate(PMC_MCK1 + 1,
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1002  					nck(sama7g5_systemck),
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1003  					nck(sama7g5_periphck),
91274497c79170 Claudiu Beznea     2020-11-19  1004  					nck(sama7g5_gck), 8);
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1005  	if (!sama7g5_pmc)
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1006  		return;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1007  
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1008  	alloc_mem = kmalloc(sizeof(void *) *
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1009  			    (ARRAY_SIZE(sama7g5_mckx) + ARRAY_SIZE(sama7g5_gck)),
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1010  			    GFP_KERNEL);
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1011  	if (!alloc_mem)
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1012  		goto err_free;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1013  
de3383e993a588 Claudiu Beznea     2023-06-15  1014  	main_rc_hw = at91_clk_register_main_rc_osc(regmap, "main_rc_osc", 12000000,
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1015  						   50000000);
de3383e993a588 Claudiu Beznea     2023-06-15  1016  	if (IS_ERR(main_rc_hw))
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1017  		goto err_free;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1018  
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1019  	bypass = of_property_read_bool(np, "atmel,osc-bypass");
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1020  
de3383e993a588 Claudiu Beznea     2023-06-15  1021  	main_osc_hw = at91_clk_register_main_osc(regmap, "main_osc", NULL,
724192a3529cea Claudiu Beznea     2026-01-16  1022  						 &AT91_CLK_PD_NAME(main_xtal_name), bypass);
de3383e993a588 Claudiu Beznea     2023-06-15  1023  	if (IS_ERR(main_osc_hw))
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1024  		goto err_free;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1025  
3be2fbeed6c10f Claudiu Beznea     2026-01-16  1026  	parent_data[0] = AT91_CLK_PD_HW(main_rc_hw);
3be2fbeed6c10f Claudiu Beznea     2026-01-16  1027  	parent_data[1] = AT91_CLK_PD_HW(main_osc_hw);
3be2fbeed6c10f Claudiu Beznea     2026-01-16  1028  	hw = at91_clk_register_sam9x5_main(regmap, "mainck", NULL, parent_data, 2);
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1029  	if (IS_ERR(hw))
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1030  		goto err_free;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1031  
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1032  	sama7g5_pmc->chws[PMC_MAIN] = hw;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1033  
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1034  	for (i = 0; i < PLL_ID_MAX; i++) {
2d6e9ee7cb3e79 Claudiu Beznea     2024-07-14  1035  		for (j = 0; j < PLL_COMPID_MAX; j++) {
724192a3529cea Claudiu Beznea     2026-01-16  1036  			unsigned long parent_rate;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1037  
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1038  			if (!sama7g5_plls[i][j].n)
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1039  				continue;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1040  
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1041  			switch (sama7g5_plls[i][j].t) {
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1042  			case PLL_TYPE_FRAC:
de3383e993a588 Claudiu Beznea     2023-06-15  1043  				switch (sama7g5_plls[i][j].p) {
de3383e993a588 Claudiu Beznea     2023-06-15  1044  				case SAMA7G5_PLL_PARENT_MAINCK:
25adc0e4a737dd Claudiu Beznea     2026-01-16  1045  					parent_data[0] = AT91_CLK_PD_NAME("mainck");
25adc0e4a737dd Claudiu Beznea     2026-01-16  1046  					parent_rate = clk_hw_get_rate(sama7g5_pmc->chws[PMC_MAIN]);
de3383e993a588 Claudiu Beznea     2023-06-15  1047  					break;
de3383e993a588 Claudiu Beznea     2023-06-15  1048  				case SAMA7G5_PLL_PARENT_MAIN_XTAL:
25adc0e4a737dd Claudiu Beznea     2026-01-16  1049  					struct clk *main_xtal;
25adc0e4a737dd Claudiu Beznea     2026-01-16  1050  					main_xtal = of_clk_get_by_name(np, main_xtal_name);
25adc0e4a737dd Claudiu Beznea     2026-01-16  1051  					if (IS_ERR(main_xtal))
25adc0e4a737dd Claudiu Beznea     2026-01-16  1052  						goto err_free;
25adc0e4a737dd Claudiu Beznea     2026-01-16  1053  					parent_data[0] = AT91_CLK_PD_NAME(main_xtal_name);
25adc0e4a737dd Claudiu Beznea     2026-01-16  1054  					parent_rate = clk_get_rate(main_xtal);
25adc0e4a737dd Claudiu Beznea     2026-01-16  1055  					clk_put(main_xtal);
de3383e993a588 Claudiu Beznea     2023-06-15  1056  					break;
de3383e993a588 Claudiu Beznea     2023-06-15 @1057  				default:
de3383e993a588 Claudiu Beznea     2023-06-15  1058  					/* Should not happen. */
de3383e993a588 Claudiu Beznea     2023-06-15  1059  					break;
de3383e993a588 Claudiu Beznea     2023-06-15  1060  				}
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1061  
724192a3529cea Claudiu Beznea     2026-01-16  1062  				if (!parent_rate)
724192a3529cea Claudiu Beznea     2026-01-16  1063  					return;
724192a3529cea Claudiu Beznea     2026-01-16  1064  
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1065  				hw = sam9x60_clk_register_frac_pll(regmap,
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1066  					&pmc_pll_lock, sama7g5_plls[i][j].n,
3be2fbeed6c10f Claudiu Beznea     2026-01-16  1067  					parent_data, parent_rate, i,
120d5d8b4614ee Claudiu Beznea     2020-11-19  1068  					sama7g5_plls[i][j].c,
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1069  					sama7g5_plls[i][j].l,
8dc4af8bef1274 Claudiu Beznea     2020-11-19  1070  					sama7g5_plls[i][j].f);
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1071  				break;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1072  
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1073  			case PLL_TYPE_DIV:
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1074  				hw = sam9x60_clk_register_div_pll(regmap,
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1075  					&pmc_pll_lock, sama7g5_plls[i][j].n,
de3383e993a588 Claudiu Beznea     2023-06-15  1076  					NULL, sama7g5_plls[i][0].hw, i,
120d5d8b4614ee Claudiu Beznea     2020-11-19  1077  					sama7g5_plls[i][j].c,
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1078  					sama7g5_plls[i][j].l,
1e229c21a47241 Claudiu Beznea     2021-10-11  1079  					sama7g5_plls[i][j].f,
1e229c21a47241 Claudiu Beznea     2021-10-11  1080  					sama7g5_plls[i][j].safe_div);
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1081  				break;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1082  
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1083  			default:
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1084  				continue;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1085  			}
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1086  
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1087  			if (IS_ERR(hw))
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1088  				goto err_free;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1089  
de3383e993a588 Claudiu Beznea     2023-06-15  1090  			sama7g5_plls[i][j].hw = hw;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1091  			if (sama7g5_plls[i][j].eid)
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1092  				sama7g5_pmc->chws[sama7g5_plls[i][j].eid] = hw;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1093  		}
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1094  	}
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1095  
de3383e993a588 Claudiu Beznea     2023-06-15  1096  	hw = at91_clk_register_master_div(regmap, "mck0", NULL,
de3383e993a588 Claudiu Beznea     2023-06-15  1097  					  sama7g5_plls[PLL_ID_CPU][1].hw,
7a110b9107ed8f Claudiu Beznea     2020-11-19  1098  					  &mck0_layout, &mck0_characteristics,
7029db09b2025f Claudiu Beznea     2021-10-11  1099  					  &pmc_mck0_lock, CLK_GET_RATE_NOCACHE, 5);
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1100  	if (IS_ERR(hw))
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1101  		goto err_free;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1102  
de3383e993a588 Claudiu Beznea     2023-06-15  1103  	sama7g5_mckx[PCK_PARENT_HW_MCK0].hw = sama7g5_pmc->chws[PMC_MCK] = hw;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1104  
de3383e993a588 Claudiu Beznea     2023-06-15  1105  	parent_hws[0] = md_slck_hw;
de3383e993a588 Claudiu Beznea     2023-06-15  1106  	parent_hws[1] = td_slck_hw;
de3383e993a588 Claudiu Beznea     2023-06-15  1107  	parent_hws[2] = sama7g5_pmc->chws[PMC_MAIN];
de3383e993a588 Claudiu Beznea     2023-06-15  1108  	for (i = PCK_PARENT_HW_MCK1; i < ARRAY_SIZE(sama7g5_mckx); i++) {
4011f03ee4756d Claudiu Beznea     2020-11-19  1109  		u8 num_parents = 3 + sama7g5_mckx[i].ep_count;
de3383e993a588 Claudiu Beznea     2023-06-15  1110  		struct clk_hw *tmp_parent_hws[8];
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1111  		u32 *mux_table;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1112  
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1113  		mux_table = kmalloc_array(num_parents, sizeof(*mux_table),
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1114  					  GFP_KERNEL);
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1115  		if (!mux_table)
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1116  			goto err_free;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1117  
5bf194adedb921 Varshini Rajendran 2024-07-29  1118  		PMC_INIT_TABLE(mux_table, 3);
5bf194adedb921 Varshini Rajendran 2024-07-29  1119  		PMC_FILL_TABLE(&mux_table[3], sama7g5_mckx[i].ep_mux_table,
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1120  			       sama7g5_mckx[i].ep_count);
de3383e993a588 Claudiu Beznea     2023-06-15  1121  		for (j = 0; j < sama7g5_mckx[i].ep_count; j++) {
de3383e993a588 Claudiu Beznea     2023-06-15  1122  			u8 pll_id = sama7g5_mckx[i].ep[j].pll_id;
de3383e993a588 Claudiu Beznea     2023-06-15  1123  			u8 pll_compid = sama7g5_mckx[i].ep[j].pll_compid;
de3383e993a588 Claudiu Beznea     2023-06-15  1124  
de3383e993a588 Claudiu Beznea     2023-06-15  1125  			tmp_parent_hws[j] = sama7g5_plls[pll_id][pll_compid].hw;
de3383e993a588 Claudiu Beznea     2023-06-15  1126  		}
5bf194adedb921 Varshini Rajendran 2024-07-29  1127  		PMC_FILL_TABLE(&parent_hws[3], tmp_parent_hws,
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1128  			       sama7g5_mckx[i].ep_count);
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1129  
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1130  		hw = at91_clk_sama7g5_register_master(regmap, sama7g5_mckx[i].n,
de3383e993a588 Claudiu Beznea     2023-06-15  1131  				   num_parents, NULL, parent_hws, mux_table,
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1132  				   &pmc_mckX_lock, sama7g5_mckx[i].id,
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1133  				   sama7g5_mckx[i].c,
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1134  				   sama7g5_mckx[i].ep_chg_id);
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1135  		if (IS_ERR(hw))
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1136  			goto err_free;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1137  
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1138  		alloc_mem[alloc_mem_size++] = mux_table;
a5ab04af49434a Tudor Ambarus      2022-01-11  1139  
de3383e993a588 Claudiu Beznea     2023-06-15  1140  		sama7g5_mckx[i].hw = hw;
a5ab04af49434a Tudor Ambarus      2022-01-11  1141  		if (sama7g5_mckx[i].eid)
a5ab04af49434a Tudor Ambarus      2022-01-11  1142  			sama7g5_pmc->chws[sama7g5_mckx[i].eid] = hw;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1143  	}
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1144  
25adc0e4a737dd Claudiu Beznea     2026-01-16  1145  	hw = at91_clk_sama7g5_register_utmi(regmap, "utmick", NULL,
25adc0e4a737dd Claudiu Beznea     2026-01-16  1146  					    &AT91_CLK_PD_NAME(main_xtal_name));
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1147  	if (IS_ERR(hw))
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1148  		goto err_free;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1149  
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1150  	sama7g5_pmc->chws[PMC_UTMI] = hw;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1151  
de3383e993a588 Claudiu Beznea     2023-06-15  1152  	parent_hws[0] = md_slck_hw;
de3383e993a588 Claudiu Beznea     2023-06-15  1153  	parent_hws[1] = td_slck_hw;
de3383e993a588 Claudiu Beznea     2023-06-15  1154  	parent_hws[2] = sama7g5_pmc->chws[PMC_MAIN];
de3383e993a588 Claudiu Beznea     2023-06-15  1155  	parent_hws[3] = sama7g5_plls[PLL_ID_SYS][PLL_COMPID_DIV0].hw;
de3383e993a588 Claudiu Beznea     2023-06-15  1156  	parent_hws[4] = sama7g5_plls[PLL_ID_DDR][PLL_COMPID_DIV0].hw;
de3383e993a588 Claudiu Beznea     2023-06-15  1157  	parent_hws[5] = sama7g5_plls[PLL_ID_IMG][PLL_COMPID_DIV0].hw;
de3383e993a588 Claudiu Beznea     2023-06-15  1158  	parent_hws[6] = sama7g5_plls[PLL_ID_BAUD][PLL_COMPID_DIV0].hw;
de3383e993a588 Claudiu Beznea     2023-06-15  1159  	parent_hws[7] = sama7g5_plls[PLL_ID_AUDIO][PLL_COMPID_DIV0].hw;
de3383e993a588 Claudiu Beznea     2023-06-15  1160  	parent_hws[8] = sama7g5_plls[PLL_ID_ETH][PLL_COMPID_DIV0].hw;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1161  	for (i = 0; i < 8; i++) {
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1162  		char name[6];
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1163  
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1164  		snprintf(name, sizeof(name), "prog%d", i);
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1165  
de3383e993a588 Claudiu Beznea     2023-06-15  1166  		hw = at91_clk_register_programmable(regmap, name, NULL, parent_hws,
de3383e993a588 Claudiu Beznea     2023-06-15  1167  						    9, i,
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1168  						    &programmable_layout,
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1169  						    sama7g5_prog_mux_table);
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1170  		if (IS_ERR(hw))
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1171  			goto err_free;
91274497c79170 Claudiu Beznea     2020-11-19  1172  
91274497c79170 Claudiu Beznea     2020-11-19  1173  		sama7g5_pmc->pchws[i] = hw;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1174  	}
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1175  
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1176  	for (i = 0; i < ARRAY_SIZE(sama7g5_systemck); i++) {
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1177  		hw = at91_clk_register_system(regmap, sama7g5_systemck[i].n,
de3383e993a588 Claudiu Beznea     2023-06-15  1178  					      NULL, sama7g5_pmc->pchws[i],
68b3b6f1773d2d Claudiu Beznea     2022-12-08  1179  					      sama7g5_systemck[i].id, 0);
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1180  		if (IS_ERR(hw))
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1181  			goto err_free;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1182  
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1183  		sama7g5_pmc->shws[sama7g5_systemck[i].id] = hw;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1184  	}
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1185  
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1186  	for (i = 0; i < ARRAY_SIZE(sama7g5_periphck); i++) {
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1187  		hw = at91_clk_register_sam9x5_peripheral(regmap, &pmc_pcr_lock,
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1188  						&sama7g5_pcr_layout,
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1189  						sama7g5_periphck[i].n,
de3383e993a588 Claudiu Beznea     2023-06-15  1190  						NULL,
b095a111ee8546 Claudiu Beznea     2026-01-16  1191  						&AT91_CLK_PD_HW(sama7g5_mckx[sama7g5_periphck[i].p].hw),
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1192  						sama7g5_periphck[i].id,
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1193  						&sama7g5_periphck[i].r,
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1194  						sama7g5_periphck[i].chgp ? 0 :
68b3b6f1773d2d Claudiu Beznea     2022-12-08  1195  						INT_MIN, 0);
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1196  		if (IS_ERR(hw))
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1197  			goto err_free;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1198  
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1199  		sama7g5_pmc->phws[sama7g5_periphck[i].id] = hw;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1200  	}
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1201  
de3383e993a588 Claudiu Beznea     2023-06-15  1202  	parent_hws[0] = md_slck_hw;
de3383e993a588 Claudiu Beznea     2023-06-15  1203  	parent_hws[1] = td_slck_hw;
de3383e993a588 Claudiu Beznea     2023-06-15  1204  	parent_hws[2] = sama7g5_pmc->chws[PMC_MAIN];
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1205  	for (i = 0; i < ARRAY_SIZE(sama7g5_gck); i++) {
4011f03ee4756d Claudiu Beznea     2020-11-19  1206  		u8 num_parents = 3 + sama7g5_gck[i].pp_count;
de3383e993a588 Claudiu Beznea     2023-06-15  1207  		struct clk_hw *tmp_parent_hws[8];
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1208  		u32 *mux_table;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1209  
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1210  		mux_table = kmalloc_array(num_parents, sizeof(*mux_table),
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1211  					  GFP_KERNEL);
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1212  		if (!mux_table)
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1213  			goto err_free;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1214  
5bf194adedb921 Varshini Rajendran 2024-07-29  1215  		PMC_INIT_TABLE(mux_table, 3);
5bf194adedb921 Varshini Rajendran 2024-07-29  1216  		PMC_FILL_TABLE(&mux_table[3], sama7g5_gck[i].pp_mux_table,
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1217  			       sama7g5_gck[i].pp_count);
de3383e993a588 Claudiu Beznea     2023-06-15  1218  		for (j = 0; j < sama7g5_gck[i].pp_count; j++) {
de3383e993a588 Claudiu Beznea     2023-06-15  1219  			u8 pll_id = sama7g5_gck[i].pp[j].pll_id;
de3383e993a588 Claudiu Beznea     2023-06-15  1220  			u8 pll_compid = sama7g5_gck[i].pp[j].pll_compid;
de3383e993a588 Claudiu Beznea     2023-06-15  1221  
de3383e993a588 Claudiu Beznea     2023-06-15  1222  			tmp_parent_hws[j] = sama7g5_plls[pll_id][pll_compid].hw;
de3383e993a588 Claudiu Beznea     2023-06-15  1223  		}
5bf194adedb921 Varshini Rajendran 2024-07-29  1224  		PMC_FILL_TABLE(&parent_hws[3], tmp_parent_hws,
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1225  			       sama7g5_gck[i].pp_count);
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1226  
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1227  		hw = at91_clk_register_generated(regmap, &pmc_pcr_lock,
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1228  						 &sama7g5_pcr_layout,
de3383e993a588 Claudiu Beznea     2023-06-15  1229  						 sama7g5_gck[i].n, NULL,
de3383e993a588 Claudiu Beznea     2023-06-15  1230  						 parent_hws, mux_table,
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1231  						 num_parents,
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1232  						 sama7g5_gck[i].id,
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1233  						 &sama7g5_gck[i].r,
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1234  						 sama7g5_gck[i].pp_chg_id);
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1235  		if (IS_ERR(hw))
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1236  			goto err_free;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1237  
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1238  		sama7g5_pmc->ghws[sama7g5_gck[i].id] = hw;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1239  		alloc_mem[alloc_mem_size++] = mux_table;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1240  	}
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1241  
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1242  	of_clk_add_hw_provider(np, of_clk_hw_pmc_get, sama7g5_pmc);
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1243  
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1244  	return;
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1245  
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1246  err_free:
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1247  	if (alloc_mem) {
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1248  		for (i = 0; i < alloc_mem_size; i++)
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1249  			kfree(alloc_mem[i]);
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1250  		kfree(alloc_mem);
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1251  	}
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1252  
91274497c79170 Claudiu Beznea     2020-11-19  1253  	kfree(sama7g5_pmc);
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1254  }
cb783bbbcf54c3 Claudiu Beznea     2020-07-22  1255  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
