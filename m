Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D600C17B425;
	Sat, 17 Jan 2026 16:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768666331; cv=none; b=c+dUIRP+hG7BsBto6cuhe9CErJrNeQ0EIV5NIxVHzDCoMW1f73jY1cfPBabsQ008wTuzFg6Gn8DHYbTCKQXWiTQLiOKjPNOa272Q28VZLeaa6VTQ436/fvZGhBYTshToPScxvAGf4pc3mumSTcn6ObfolxgO2k6elnazfROJDtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768666331; c=relaxed/simple;
	bh=nUVFMlgDt3rYq1U7Q/3nbA/V1zbyev5slZvp+OEjhzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p5IjYbdFUI1B9CR8YEDcYdGpHz5QMhvenH9wdFysaHLx6A/pOInOY32XLJjgvmES70Op9RK6Fd0F2W/cx1tbZdYiUdW4xiCEsHYwVhSgN1cHaGypfZh854JCeimN5yXWdENEVNTC8zSOMJMv4Eitu59z92cc6V+vbr1C8wF5CLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BIGO572o; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BIGO572o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768666329; x=1800202329;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nUVFMlgDt3rYq1U7Q/3nbA/V1zbyev5slZvp+OEjhzQ=;
  b=BIGO572ob3YgyltHI4joy/J0Xalqu1sPbn5EvIE4whdVPEEGSMaBvSqp
   rOi8dfCYhxb3jn7ZVCj5hGWoTM1yjdMwpwP3zbGGrc64J3PyaxGxf5OhG
   PkYOuZANX5wv0H97cLDFn54EtvGbrTUP6zxadot7xfrWU7AzH6H1M4PVk
   PnDnY2Ck2EDIiJsF7gfgZLkl55tu79GmZ83iG6Qd5yM1P1Ypd7ynWYKXT
   Cx/G27R533EWZLNrS5IMyo2lxuPeScFjQd4HFhyA0hnmp6zoyG3dRPYF8
   RRQeK2ghc3iQHL4Ke/Haox9bVSRVMWP/5+JVAugKn1qbzySaLEbQft6eO
   Q==;
X-CSE-ConnectionGUID: 5iBKSO2NTQm1a0dtgpJiUg==
X-CSE-MsgGUID: N7igiOfoTPm9LZTH9QQLWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="95422606"
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="95422606"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 08:12:08 -0800
X-CSE-ConnectionGUID: f5/RDhgoSyGkozYT6LnDpg==
X-CSE-MsgGUID: PjA1PF3DRYu0BJ1HkqtxXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="205289521"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Jan 2026 08:12:06 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vh8uB-00000000M12-2knN;
	Sat, 17 Jan 2026 16:12:03 +0000
Date: Sun, 18 Jan 2026 00:11:52 +0800
From: kernel test robot <lkp@intel.com>
To: ryan.wanner@microchip.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 11/31] clk: at91: clk-usb: add support for
 clk_parent_data
Message-ID: <202601180003.rwQnjX4y-lkp@intel.com>
References: <37dfe16abee98a6b768fbb3b82c0b8cd23bb6e44.1768512290.git.ryan.wanner@microchip.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37dfe16abee98a6b768fbb3b82c0b8cd23bb6e44.1768512290.git.ryan.wanner@microchip.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on linus/master v6.19-rc5 next-20260116]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/ryan-wanner-microchip-com/clk-at91-pmc-add-macros-for-clk_parent_data/20260117-041915
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/37dfe16abee98a6b768fbb3b82c0b8cd23bb6e44.1768512290.git.ryan.wanner%40microchip.com
patch subject: [PATCH v5 11/31] clk: at91: clk-usb: add support for clk_parent_data
config: arm-defconfig (https://download.01.org/0day-ci/archive/20260118/202601180003.rwQnjX4y-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260118/202601180003.rwQnjX4y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601180003.rwQnjX4y-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/at91/sama7d65.c:1181:5: warning: variable 'parent_rate' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
    1181 |                                 default:
         |                                 ^~~~~~~
   drivers/clk/at91/sama7d65.c:1186:10: note: uninitialized use occurs here
    1186 |                                 if (!parent_rate)
         |                                      ^~~~~~~~~~~
   drivers/clk/at91/sama7d65.c:1160:29: note: initialize the variable 'parent_rate' to silence this warning
    1160 |                         unsigned long parent_rate;
         |                                                  ^
         |                                                   = 0
   1 warning generated.


vim +/parent_rate +1181 drivers/clk/at91/sama7d65.c

9a497710cab941 Ryan Wanner    2024-12-20  1093  
9a497710cab941 Ryan Wanner    2024-12-20  1094  static void __init sama7d65_pmc_setup(struct device_node *np)
9a497710cab941 Ryan Wanner    2024-12-20  1095  {
36f7c6691d15fe Claudiu Beznea 2026-01-16  1096  	const char *main_xtal_name, *md_slck_name, *td_slck_name;
9a497710cab941 Ryan Wanner    2024-12-20  1097  	struct pmc_data *sama7d65_pmc;
9a497710cab941 Ryan Wanner    2024-12-20  1098  	void **alloc_mem = NULL;
9a497710cab941 Ryan Wanner    2024-12-20  1099  	int alloc_mem_size = 0;
9a497710cab941 Ryan Wanner    2024-12-20  1100  	struct regmap *regmap;
10ef68033226d6 Claudiu Beznea 2026-01-16  1101  	struct clk_hw *hw, *main_rc_hw, *main_osc_hw, *usbck_hw;
e21b06b05c1f1c Claudiu Beznea 2026-01-16  1102  	struct clk_parent_data parent_data[10];
9a497710cab941 Ryan Wanner    2024-12-20  1103  	bool bypass;
9a497710cab941 Ryan Wanner    2024-12-20  1104  	int i, j;
9a497710cab941 Ryan Wanner    2024-12-20  1105  
724192a3529cea Claudiu Beznea 2026-01-16  1106  	i = of_property_match_string(np, "clock-names", "main_xtal");
724192a3529cea Claudiu Beznea 2026-01-16  1107  	if (i < 0)
724192a3529cea Claudiu Beznea 2026-01-16  1108  		return;
724192a3529cea Claudiu Beznea 2026-01-16  1109  	main_xtal_name = of_clk_get_parent_name(np, i);
724192a3529cea Claudiu Beznea 2026-01-16  1110  
36f7c6691d15fe Claudiu Beznea 2026-01-16  1111  	i = of_property_match_string(np, "clock-names", "td_slck");
36f7c6691d15fe Claudiu Beznea 2026-01-16  1112  	if (i < 0)
36f7c6691d15fe Claudiu Beznea 2026-01-16  1113  		return;
36f7c6691d15fe Claudiu Beznea 2026-01-16  1114  	td_slck_name = of_clk_get_parent_name(np, i);
9a497710cab941 Ryan Wanner    2024-12-20  1115  
36f7c6691d15fe Claudiu Beznea 2026-01-16  1116  	i = of_property_match_string(np, "clock-names", "md_slck");
36f7c6691d15fe Claudiu Beznea 2026-01-16  1117  	if (i < 0)
9a497710cab941 Ryan Wanner    2024-12-20  1118  		return;
36f7c6691d15fe Claudiu Beznea 2026-01-16  1119  	md_slck_name = of_clk_get_parent_name(np, i);
9a497710cab941 Ryan Wanner    2024-12-20  1120  
9a497710cab941 Ryan Wanner    2024-12-20  1121  	regmap = device_node_to_regmap(np);
9a497710cab941 Ryan Wanner    2024-12-20  1122  	if (IS_ERR(regmap))
9a497710cab941 Ryan Wanner    2024-12-20  1123  		return;
9a497710cab941 Ryan Wanner    2024-12-20  1124  
9a497710cab941 Ryan Wanner    2024-12-20  1125  	sama7d65_pmc = pmc_data_allocate(PMC_INDEX_MAX,
9a497710cab941 Ryan Wanner    2024-12-20  1126  					 nck(sama7d65_systemck),
9a497710cab941 Ryan Wanner    2024-12-20  1127  					 nck(sama7d65_periphck),
9a497710cab941 Ryan Wanner    2024-12-20  1128  					 nck(sama7d65_gck), 8);
9a497710cab941 Ryan Wanner    2024-12-20  1129  	if (!sama7d65_pmc)
9a497710cab941 Ryan Wanner    2024-12-20  1130  		return;
9a497710cab941 Ryan Wanner    2024-12-20  1131  
9a497710cab941 Ryan Wanner    2024-12-20  1132  	alloc_mem = kmalloc(sizeof(void *) *
9a497710cab941 Ryan Wanner    2024-12-20  1133  			    (ARRAY_SIZE(sama7d65_mckx) + ARRAY_SIZE(sama7d65_gck)),
9a497710cab941 Ryan Wanner    2024-12-20  1134  			    GFP_KERNEL);
9a497710cab941 Ryan Wanner    2024-12-20  1135  	if (!alloc_mem)
9a497710cab941 Ryan Wanner    2024-12-20  1136  		goto err_free;
9a497710cab941 Ryan Wanner    2024-12-20  1137  
9a497710cab941 Ryan Wanner    2024-12-20  1138  	main_rc_hw = at91_clk_register_main_rc_osc(regmap, "main_rc_osc", 12000000,
9a497710cab941 Ryan Wanner    2024-12-20  1139  						   50000000);
9a497710cab941 Ryan Wanner    2024-12-20  1140  	if (IS_ERR(main_rc_hw))
9a497710cab941 Ryan Wanner    2024-12-20  1141  		goto err_free;
9a497710cab941 Ryan Wanner    2024-12-20  1142  
9a497710cab941 Ryan Wanner    2024-12-20  1143  	bypass = of_property_read_bool(np, "atmel,osc-bypass");
9a497710cab941 Ryan Wanner    2024-12-20  1144  
9a497710cab941 Ryan Wanner    2024-12-20  1145  	main_osc_hw = at91_clk_register_main_osc(regmap, "main_osc", NULL,
724192a3529cea Claudiu Beznea 2026-01-16  1146  						 &AT91_CLK_PD_NAME(main_xtal_name), bypass);
9a497710cab941 Ryan Wanner    2024-12-20  1147  	if (IS_ERR(main_osc_hw))
9a497710cab941 Ryan Wanner    2024-12-20  1148  		goto err_free;
9a497710cab941 Ryan Wanner    2024-12-20  1149  
3be2fbeed6c10f Claudiu Beznea 2026-01-16  1150  	parent_data[0] = AT91_CLK_PD_HW(main_rc_hw);
3be2fbeed6c10f Claudiu Beznea 2026-01-16  1151  	parent_data[1] = AT91_CLK_PD_HW(main_osc_hw);
3be2fbeed6c10f Claudiu Beznea 2026-01-16  1152  	hw = at91_clk_register_sam9x5_main(regmap, "mainck", NULL, parent_data, 2);
9a497710cab941 Ryan Wanner    2024-12-20  1153  	if (IS_ERR(hw))
9a497710cab941 Ryan Wanner    2024-12-20  1154  		goto err_free;
9a497710cab941 Ryan Wanner    2024-12-20  1155  
9a497710cab941 Ryan Wanner    2024-12-20  1156  	sama7d65_pmc->chws[PMC_MAIN] = hw;
9a497710cab941 Ryan Wanner    2024-12-20  1157  
9a497710cab941 Ryan Wanner    2024-12-20  1158  	for (i = 0; i < PLL_ID_MAX; i++) {
9a497710cab941 Ryan Wanner    2024-12-20  1159  		for (j = 0; j < PLL_COMPID_MAX; j++) {
724192a3529cea Claudiu Beznea 2026-01-16  1160  			unsigned long parent_rate;
9a497710cab941 Ryan Wanner    2024-12-20  1161  
9a497710cab941 Ryan Wanner    2024-12-20  1162  			if (!sama7d65_plls[i][j].n)
9a497710cab941 Ryan Wanner    2024-12-20  1163  				continue;
9a497710cab941 Ryan Wanner    2024-12-20  1164  
9a497710cab941 Ryan Wanner    2024-12-20  1165  			switch (sama7d65_plls[i][j].t) {
9a497710cab941 Ryan Wanner    2024-12-20  1166  			case PLL_TYPE_FRAC:
9a497710cab941 Ryan Wanner    2024-12-20  1167  				switch (sama7d65_plls[i][j].p) {
9a497710cab941 Ryan Wanner    2024-12-20  1168  				case SAMA7D65_PLL_PARENT_MAINCK:
3be2fbeed6c10f Claudiu Beznea 2026-01-16  1169  					parent_data[0] = AT91_CLK_PD_NAME("mainck");
10ef68033226d6 Claudiu Beznea 2026-01-16  1170  					parent_rate = clk_hw_get_rate(sama7d65_pmc->chws[PMC_MAIN]);
9a497710cab941 Ryan Wanner    2024-12-20  1171  					break;
9a497710cab941 Ryan Wanner    2024-12-20  1172  				case SAMA7D65_PLL_PARENT_MAIN_XTAL:
10ef68033226d6 Claudiu Beznea 2026-01-16  1173  					struct clk *main_xtal;
10ef68033226d6 Claudiu Beznea 2026-01-16  1174  					main_xtal = of_clk_get_by_name(np, main_xtal_name);
10ef68033226d6 Claudiu Beznea 2026-01-16  1175  					if (IS_ERR(main_xtal))
10ef68033226d6 Claudiu Beznea 2026-01-16  1176  						goto err_free;
3be2fbeed6c10f Claudiu Beznea 2026-01-16  1177  					parent_data[0] = AT91_CLK_PD_NAME(main_xtal_name);
10ef68033226d6 Claudiu Beznea 2026-01-16  1178  					parent_rate = clk_get_rate(main_xtal);
10ef68033226d6 Claudiu Beznea 2026-01-16  1179  					clk_put(main_xtal);
9a497710cab941 Ryan Wanner    2024-12-20  1180  					break;
9a497710cab941 Ryan Wanner    2024-12-20 @1181  				default:
9a497710cab941 Ryan Wanner    2024-12-20  1182  					/* Should not happen. */
9a497710cab941 Ryan Wanner    2024-12-20  1183  					break;
9a497710cab941 Ryan Wanner    2024-12-20  1184  				}
10ef68033226d6 Claudiu Beznea 2026-01-16  1185  
724192a3529cea Claudiu Beznea 2026-01-16  1186  				if (!parent_rate)
724192a3529cea Claudiu Beznea 2026-01-16  1187  					return;
9a497710cab941 Ryan Wanner    2024-12-20  1188  
9a497710cab941 Ryan Wanner    2024-12-20  1189  				hw = sam9x60_clk_register_frac_pll(regmap,
9a497710cab941 Ryan Wanner    2024-12-20  1190  					&pmc_pll_lock, sama7d65_plls[i][j].n,
3be2fbeed6c10f Claudiu Beznea 2026-01-16  1191  					parent_data, parent_rate, i,
9a497710cab941 Ryan Wanner    2024-12-20  1192  					sama7d65_plls[i][j].c,
9a497710cab941 Ryan Wanner    2024-12-20  1193  					sama7d65_plls[i][j].l,
9a497710cab941 Ryan Wanner    2024-12-20  1194  					sama7d65_plls[i][j].f);
9a497710cab941 Ryan Wanner    2024-12-20  1195  				break;
9a497710cab941 Ryan Wanner    2024-12-20  1196  
9a497710cab941 Ryan Wanner    2024-12-20  1197  			case PLL_TYPE_DIV:
9a497710cab941 Ryan Wanner    2024-12-20  1198  				hw = sam9x60_clk_register_div_pll(regmap,
9a497710cab941 Ryan Wanner    2024-12-20  1199  					&pmc_pll_lock, sama7d65_plls[i][j].n,
9a497710cab941 Ryan Wanner    2024-12-20  1200  					NULL, sama7d65_plls[i][0].hw, i,
9a497710cab941 Ryan Wanner    2024-12-20  1201  					sama7d65_plls[i][j].c,
9a497710cab941 Ryan Wanner    2024-12-20  1202  					sama7d65_plls[i][j].l,
9a497710cab941 Ryan Wanner    2024-12-20  1203  					sama7d65_plls[i][j].f,
9a497710cab941 Ryan Wanner    2024-12-20  1204  					sama7d65_plls[i][j].safe_div);
9a497710cab941 Ryan Wanner    2024-12-20  1205  				break;
9a497710cab941 Ryan Wanner    2024-12-20  1206  
9a497710cab941 Ryan Wanner    2024-12-20  1207  			default:
9a497710cab941 Ryan Wanner    2024-12-20  1208  				continue;
9a497710cab941 Ryan Wanner    2024-12-20  1209  			}
9a497710cab941 Ryan Wanner    2024-12-20  1210  
9a497710cab941 Ryan Wanner    2024-12-20  1211  			if (IS_ERR(hw))
9a497710cab941 Ryan Wanner    2024-12-20  1212  				goto err_free;
9a497710cab941 Ryan Wanner    2024-12-20  1213  
9a497710cab941 Ryan Wanner    2024-12-20  1214  			sama7d65_plls[i][j].hw = hw;
9a497710cab941 Ryan Wanner    2024-12-20  1215  			if (sama7d65_plls[i][j].eid)
9a497710cab941 Ryan Wanner    2024-12-20  1216  				sama7d65_pmc->chws[sama7d65_plls[i][j].eid] = hw;
9a497710cab941 Ryan Wanner    2024-12-20  1217  		}
9a497710cab941 Ryan Wanner    2024-12-20  1218  	}
9a497710cab941 Ryan Wanner    2024-12-20  1219  
9a497710cab941 Ryan Wanner    2024-12-20  1220  	hw = at91_clk_register_master_div(regmap, "mck0", NULL,
e21b06b05c1f1c Claudiu Beznea 2026-01-16  1221  					  &AT91_CLK_PD_HW(sama7d65_plls[PLL_ID_CPU][1].hw),
9a497710cab941 Ryan Wanner    2024-12-20  1222  					  &mck0_layout, &mck0_characteristics,
9a497710cab941 Ryan Wanner    2024-12-20  1223  					  &pmc_mck0_lock, CLK_GET_RATE_NOCACHE, 5);
9a497710cab941 Ryan Wanner    2024-12-20  1224  	if (IS_ERR(hw))
9a497710cab941 Ryan Wanner    2024-12-20  1225  		goto err_free;
9a497710cab941 Ryan Wanner    2024-12-20  1226  
9a497710cab941 Ryan Wanner    2024-12-20  1227  	sama7d65_pmc->chws[PMC_MCK] = hw;
9a497710cab941 Ryan Wanner    2024-12-20  1228  	sama7d65_mckx[PCK_PARENT_HW_MCK0].hw = hw;
9a497710cab941 Ryan Wanner    2024-12-20  1229  
36f7c6691d15fe Claudiu Beznea 2026-01-16  1230  	parent_data[0] = AT91_CLK_PD_NAME(md_slck_name);
36f7c6691d15fe Claudiu Beznea 2026-01-16  1231  	parent_data[1] = AT91_CLK_PD_NAME(td_slck_name);
e21b06b05c1f1c Claudiu Beznea 2026-01-16  1232  	parent_data[2] = AT91_CLK_PD_HW(sama7d65_pmc->chws[PMC_MAIN]);
9a497710cab941 Ryan Wanner    2024-12-20  1233  	for (i = PCK_PARENT_HW_MCK1; i < ARRAY_SIZE(sama7d65_mckx); i++) {
9a497710cab941 Ryan Wanner    2024-12-20  1234  		u8 num_parents = 3 + sama7d65_mckx[i].ep_count;
9a497710cab941 Ryan Wanner    2024-12-20  1235  		u32 *mux_table;
9a497710cab941 Ryan Wanner    2024-12-20  1236  
9a497710cab941 Ryan Wanner    2024-12-20  1237  		mux_table = kmalloc_array(num_parents, sizeof(*mux_table),
9a497710cab941 Ryan Wanner    2024-12-20  1238  					  GFP_KERNEL);
9a497710cab941 Ryan Wanner    2024-12-20  1239  		if (!mux_table)
9a497710cab941 Ryan Wanner    2024-12-20  1240  			goto err_free;
9a497710cab941 Ryan Wanner    2024-12-20  1241  
9a497710cab941 Ryan Wanner    2024-12-20  1242  		alloc_mem[alloc_mem_size++] = mux_table;
9a497710cab941 Ryan Wanner    2024-12-20  1243  
9a497710cab941 Ryan Wanner    2024-12-20  1244  		PMC_INIT_TABLE(mux_table, 3);
9a497710cab941 Ryan Wanner    2024-12-20  1245  		PMC_FILL_TABLE(&mux_table[3], sama7d65_mckx[i].ep_mux_table,
9a497710cab941 Ryan Wanner    2024-12-20  1246  			       sama7d65_mckx[i].ep_count);
9a497710cab941 Ryan Wanner    2024-12-20  1247  		for (j = 0; j < sama7d65_mckx[i].ep_count; j++) {
9a497710cab941 Ryan Wanner    2024-12-20  1248  			u8 pll_id = sama7d65_mckx[i].ep[j].pll_id;
9a497710cab941 Ryan Wanner    2024-12-20  1249  			u8 pll_compid = sama7d65_mckx[i].ep[j].pll_compid;
9a497710cab941 Ryan Wanner    2024-12-20  1250  
e21b06b05c1f1c Claudiu Beznea 2026-01-16  1251  			parent_data[3 + j] = AT91_CLK_PD_HW(sama7d65_plls[pll_id][pll_compid].hw);
9a497710cab941 Ryan Wanner    2024-12-20  1252  		}
9a497710cab941 Ryan Wanner    2024-12-20  1253  
9a497710cab941 Ryan Wanner    2024-12-20  1254  		hw = at91_clk_sama7g5_register_master(regmap, sama7d65_mckx[i].n,
e21b06b05c1f1c Claudiu Beznea 2026-01-16  1255  						      num_parents, NULL, parent_data,
9a497710cab941 Ryan Wanner    2024-12-20  1256  						      mux_table, &pmc_mckX_lock,
9a497710cab941 Ryan Wanner    2024-12-20  1257  						      sama7d65_mckx[i].id,
9a497710cab941 Ryan Wanner    2024-12-20  1258  						      sama7d65_mckx[i].c,
9a497710cab941 Ryan Wanner    2024-12-20  1259  						      sama7d65_mckx[i].ep_chg_id);
9a497710cab941 Ryan Wanner    2024-12-20  1260  
9a497710cab941 Ryan Wanner    2024-12-20  1261  		if (IS_ERR(hw))
9a497710cab941 Ryan Wanner    2024-12-20  1262  			goto err_free;
9a497710cab941 Ryan Wanner    2024-12-20  1263  
9a497710cab941 Ryan Wanner    2024-12-20  1264  		sama7d65_mckx[i].hw = hw;
9a497710cab941 Ryan Wanner    2024-12-20  1265  		if (sama7d65_mckx[i].eid)
9a497710cab941 Ryan Wanner    2024-12-20  1266  			sama7d65_pmc->chws[sama7d65_mckx[i].eid] = hw;
9a497710cab941 Ryan Wanner    2024-12-20  1267  	}
9a497710cab941 Ryan Wanner    2024-12-20  1268  
10ef68033226d6 Claudiu Beznea 2026-01-16  1269  	parent_data[0] = AT91_CLK_PD_HW(sama7d65_plls[PLL_ID_SYS][PLL_COMPID_DIV0].hw);
10ef68033226d6 Claudiu Beznea 2026-01-16  1270  	parent_data[1] = AT91_CLK_PD_HW(sama7d65_plls[PLL_ID_USB][PLL_COMPID_DIV0].hw);
10ef68033226d6 Claudiu Beznea 2026-01-16  1271  	parent_data[2] = AT91_CLK_PD_HW(main_osc_hw);
10ef68033226d6 Claudiu Beznea 2026-01-16  1272  	usbck_hw = sam9x60_clk_register_usb(regmap, "usbck", NULL, parent_data, 3);
10ef68033226d6 Claudiu Beznea 2026-01-16  1273  	if (IS_ERR(usbck_hw))
9a497710cab941 Ryan Wanner    2024-12-20  1274  		goto err_free;
9a497710cab941 Ryan Wanner    2024-12-20  1275  
36f7c6691d15fe Claudiu Beznea 2026-01-16  1276  	parent_data[0] = AT91_CLK_PD_NAME(md_slck_name);
36f7c6691d15fe Claudiu Beznea 2026-01-16  1277  	parent_data[1] = AT91_CLK_PD_NAME(td_slck_name);
f103bfb3028314 Claudiu Beznea 2026-01-16  1278  	parent_data[2] = AT91_CLK_PD_HW(sama7d65_pmc->chws[PMC_MAIN]);
f103bfb3028314 Claudiu Beznea 2026-01-16  1279  	parent_data[3] = AT91_CLK_PD_HW(sama7d65_plls[PLL_ID_SYS][PLL_COMPID_DIV0].hw);
f103bfb3028314 Claudiu Beznea 2026-01-16  1280  	parent_data[4] = AT91_CLK_PD_HW(sama7d65_plls[PLL_ID_DDR][PLL_COMPID_DIV0].hw);
f103bfb3028314 Claudiu Beznea 2026-01-16  1281  	parent_data[5] = AT91_CLK_PD_HW(sama7d65_plls[PLL_ID_GPU][PLL_COMPID_DIV0].hw);
f103bfb3028314 Claudiu Beznea 2026-01-16  1282  	parent_data[6] = AT91_CLK_PD_HW(sama7d65_plls[PLL_ID_BAUD][PLL_COMPID_DIV0].hw);
f103bfb3028314 Claudiu Beznea 2026-01-16  1283  	parent_data[7] = AT91_CLK_PD_HW(sama7d65_plls[PLL_ID_AUDIO][PLL_COMPID_DIV0].hw);
f103bfb3028314 Claudiu Beznea 2026-01-16  1284  	parent_data[8] = AT91_CLK_PD_HW(sama7d65_plls[PLL_ID_ETH][PLL_COMPID_DIV0].hw);
9a497710cab941 Ryan Wanner    2024-12-20  1285  
9a497710cab941 Ryan Wanner    2024-12-20  1286  	for (i = 0; i < 8; i++) {
9a497710cab941 Ryan Wanner    2024-12-20  1287  		char name[6];
9a497710cab941 Ryan Wanner    2024-12-20  1288  
9a497710cab941 Ryan Wanner    2024-12-20  1289  		snprintf(name, sizeof(name), "prog%d", i);
9a497710cab941 Ryan Wanner    2024-12-20  1290  
f103bfb3028314 Claudiu Beznea 2026-01-16  1291  		hw = at91_clk_register_programmable(regmap, name, NULL, parent_data,
9a497710cab941 Ryan Wanner    2024-12-20  1292  						    9, i,
9a497710cab941 Ryan Wanner    2024-12-20  1293  						    &programmable_layout,
9a497710cab941 Ryan Wanner    2024-12-20  1294  						    sama7d65_prog_mux_table);
9a497710cab941 Ryan Wanner    2024-12-20  1295  		if (IS_ERR(hw))
9a497710cab941 Ryan Wanner    2024-12-20  1296  			goto err_free;
9a497710cab941 Ryan Wanner    2024-12-20  1297  
9a497710cab941 Ryan Wanner    2024-12-20  1298  		sama7d65_pmc->pchws[i] = hw;
9a497710cab941 Ryan Wanner    2024-12-20  1299  	}
9a497710cab941 Ryan Wanner    2024-12-20  1300  
9a497710cab941 Ryan Wanner    2024-12-20  1301  	for (i = 0; i < ARRAY_SIZE(sama7d65_systemck); i++) {
9a497710cab941 Ryan Wanner    2024-12-20  1302  		hw = at91_clk_register_system(regmap, sama7d65_systemck[i].n,
9a497710cab941 Ryan Wanner    2024-12-20  1303  					      sama7d65_systemck[i].p, NULL,
9a497710cab941 Ryan Wanner    2024-12-20  1304  					      sama7d65_systemck[i].id, 0);
9a497710cab941 Ryan Wanner    2024-12-20  1305  		if (IS_ERR(hw))
9a497710cab941 Ryan Wanner    2024-12-20  1306  			goto err_free;
9a497710cab941 Ryan Wanner    2024-12-20  1307  
9a497710cab941 Ryan Wanner    2024-12-20  1308  		sama7d65_pmc->shws[sama7d65_systemck[i].id] = hw;
9a497710cab941 Ryan Wanner    2024-12-20  1309  	}
9a497710cab941 Ryan Wanner    2024-12-20  1310  
9a497710cab941 Ryan Wanner    2024-12-20  1311  	for (i = 0; i < ARRAY_SIZE(sama7d65_periphck); i++) {
9a497710cab941 Ryan Wanner    2024-12-20  1312  		hw = at91_clk_register_sam9x5_peripheral(regmap, &pmc_pcr_lock,
9a497710cab941 Ryan Wanner    2024-12-20  1313  							 &sama7d65_pcr_layout,
9a497710cab941 Ryan Wanner    2024-12-20  1314  							 sama7d65_periphck[i].n,
9a497710cab941 Ryan Wanner    2024-12-20  1315  							 NULL,
b095a111ee8546 Claudiu Beznea 2026-01-16  1316  							 &AT91_CLK_PD_HW(sama7d65_mckx[sama7d65_periphck[i].p].hw),
9a497710cab941 Ryan Wanner    2024-12-20  1317  							 sama7d65_periphck[i].id,
9a497710cab941 Ryan Wanner    2024-12-20  1318  							 &sama7d65_periphck[i].r,
9a497710cab941 Ryan Wanner    2024-12-20  1319  							 sama7d65_periphck[i].chgp ? 0 :
9a497710cab941 Ryan Wanner    2024-12-20  1320  							 INT_MIN, 0);
9a497710cab941 Ryan Wanner    2024-12-20  1321  		if (IS_ERR(hw))
9a497710cab941 Ryan Wanner    2024-12-20  1322  			goto err_free;
9a497710cab941 Ryan Wanner    2024-12-20  1323  
9a497710cab941 Ryan Wanner    2024-12-20  1324  		sama7d65_pmc->phws[sama7d65_periphck[i].id] = hw;
9a497710cab941 Ryan Wanner    2024-12-20  1325  	}
9a497710cab941 Ryan Wanner    2024-12-20  1326  
36f7c6691d15fe Claudiu Beznea 2026-01-16  1327  	parent_data[0] = AT91_CLK_PD_NAME(md_slck_name);
36f7c6691d15fe Claudiu Beznea 2026-01-16  1328  	parent_data[1] = AT91_CLK_PD_NAME(td_slck_name);
36f7c6691d15fe Claudiu Beznea 2026-01-16  1329  	parent_data[2] = AT91_CLK_PD_HW(sama7d65_pmc->chws[PMC_MAIN]);
36f7c6691d15fe Claudiu Beznea 2026-01-16  1330  	parent_data[3] = AT91_CLK_PD_HW(sama7d65_pmc->chws[PMC_MCK1]);
9a497710cab941 Ryan Wanner    2024-12-20  1331  	for (i = 0; i < ARRAY_SIZE(sama7d65_gck); i++) {
9a497710cab941 Ryan Wanner    2024-12-20  1332  		u8 num_parents = 4 + sama7d65_gck[i].pp_count;
9a497710cab941 Ryan Wanner    2024-12-20  1333  		u32 *mux_table;
9a497710cab941 Ryan Wanner    2024-12-20  1334  
9a497710cab941 Ryan Wanner    2024-12-20  1335  		mux_table = kmalloc_array(num_parents, sizeof(*mux_table),
9a497710cab941 Ryan Wanner    2024-12-20  1336  					  GFP_KERNEL);
9a497710cab941 Ryan Wanner    2024-12-20  1337  		if (!mux_table)
9a497710cab941 Ryan Wanner    2024-12-20  1338  			goto err_free;
9a497710cab941 Ryan Wanner    2024-12-20  1339  
9a497710cab941 Ryan Wanner    2024-12-20  1340  		alloc_mem[alloc_mem_size++] = mux_table;
9a497710cab941 Ryan Wanner    2024-12-20  1341  
9a497710cab941 Ryan Wanner    2024-12-20  1342  		PMC_INIT_TABLE(mux_table, 4);
9a497710cab941 Ryan Wanner    2024-12-20  1343  		PMC_FILL_TABLE(&mux_table[4], sama7d65_gck[i].pp_mux_table,
9a497710cab941 Ryan Wanner    2024-12-20  1344  			       sama7d65_gck[i].pp_count);
9a497710cab941 Ryan Wanner    2024-12-20  1345  		for (j = 0; j < sama7d65_gck[i].pp_count; j++) {
9a497710cab941 Ryan Wanner    2024-12-20  1346  			u8 pll_id = sama7d65_gck[i].pp[j].pll_id;
9a497710cab941 Ryan Wanner    2024-12-20  1347  			u8 pll_compid = sama7d65_gck[i].pp[j].pll_compid;
9a497710cab941 Ryan Wanner    2024-12-20  1348  
36f7c6691d15fe Claudiu Beznea 2026-01-16  1349  			parent_data[4 + j] = AT91_CLK_PD_HW(sama7d65_plls[pll_id][pll_compid].hw);
9a497710cab941 Ryan Wanner    2024-12-20  1350  		}
9a497710cab941 Ryan Wanner    2024-12-20  1351  
9a497710cab941 Ryan Wanner    2024-12-20  1352  		hw = at91_clk_register_generated(regmap, &pmc_pcr_lock,
9a497710cab941 Ryan Wanner    2024-12-20  1353  						 &sama7d65_pcr_layout,
9a497710cab941 Ryan Wanner    2024-12-20  1354  						 sama7d65_gck[i].n, NULL,
36f7c6691d15fe Claudiu Beznea 2026-01-16  1355  						 parent_data, mux_table,
9a497710cab941 Ryan Wanner    2024-12-20  1356  						 num_parents,
9a497710cab941 Ryan Wanner    2024-12-20  1357  						 sama7d65_gck[i].id,
9a497710cab941 Ryan Wanner    2024-12-20  1358  						 &sama7d65_gck[i].r,
9a497710cab941 Ryan Wanner    2024-12-20  1359  						 sama7d65_gck[i].pp_chg_id);
9a497710cab941 Ryan Wanner    2024-12-20  1360  		if (IS_ERR(hw))
9a497710cab941 Ryan Wanner    2024-12-20  1361  			goto err_free;
9a497710cab941 Ryan Wanner    2024-12-20  1362  
9a497710cab941 Ryan Wanner    2024-12-20  1363  		sama7d65_pmc->ghws[sama7d65_gck[i].id] = hw;
9a497710cab941 Ryan Wanner    2024-12-20  1364  	}
9a497710cab941 Ryan Wanner    2024-12-20  1365  
9a497710cab941 Ryan Wanner    2024-12-20  1366  	of_clk_add_hw_provider(np, of_clk_hw_pmc_get, sama7d65_pmc);
9a497710cab941 Ryan Wanner    2024-12-20  1367  	kfree(alloc_mem);
9a497710cab941 Ryan Wanner    2024-12-20  1368  
9a497710cab941 Ryan Wanner    2024-12-20  1369  	return;
9a497710cab941 Ryan Wanner    2024-12-20  1370  
9a497710cab941 Ryan Wanner    2024-12-20  1371  err_free:
9a497710cab941 Ryan Wanner    2024-12-20  1372  	if (alloc_mem) {
9a497710cab941 Ryan Wanner    2024-12-20  1373  		for (i = 0; i < alloc_mem_size; i++)
9a497710cab941 Ryan Wanner    2024-12-20  1374  			kfree(alloc_mem[i]);
9a497710cab941 Ryan Wanner    2024-12-20  1375  		kfree(alloc_mem);
9a497710cab941 Ryan Wanner    2024-12-20  1376  	}
9a497710cab941 Ryan Wanner    2024-12-20  1377  
9a497710cab941 Ryan Wanner    2024-12-20  1378  	kfree(sama7d65_pmc);
9a497710cab941 Ryan Wanner    2024-12-20  1379  }
9a497710cab941 Ryan Wanner    2024-12-20  1380  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
