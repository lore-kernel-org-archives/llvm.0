Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADBF12D8DD4;
	Mon, 12 Jan 2026 14:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768229609; cv=none; b=ZbouOXNKeFTeB5EWda+CRTD6lD8dT6XrSuEmCI6yKGWu1NjjvZeVko4LYIQFTPUUyBShKYbxxooac/DthTiXsbdMaHME7WsU66LnrAw3tHEUkN/hZ+oUpBYdBTCjin1DoIzgS0etmNRMltoPDswnT7iRdzBAecQTF1aRN6IotF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768229609; c=relaxed/simple;
	bh=o7nqUzvqQ9oJ4xLDTBcff1jYIEXkQK0Ts9/HV9dsjKw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nRLkTgqeEAXPJEf0s+uBTKu4k+d2aXlA55V9cKFFhqdSef9zFUt8822cNqjMpvEgw+ljtzdIuPwxc8VJ6KUrjKYCvZ7G3WE18IYviegY2BXWU3zbivjdBLlVQ493i6I19OYybMIQKGWLBZfwnYSqDuCcD4bNaj+7oYAdybBRetY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UTMb/XPx; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UTMb/XPx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768229607; x=1799765607;
  h=date:from:to:cc:subject:message-id;
  bh=o7nqUzvqQ9oJ4xLDTBcff1jYIEXkQK0Ts9/HV9dsjKw=;
  b=UTMb/XPxS+dKUzQ5OBFlPViOoVz3/z+XFV9yVGU6ChlQtPsfmZUz9F9z
   b3QxKY9uyXYD7p51K2q6C6n0kp/HiDPU/wGy/WlrABMkxPQKqC3Ri9GzH
   c713k6LOP+F43WnGS1f88EJghH8MlWgrZVt9NO8dNYTXVRznLIyPDQyDj
   HkEFm/D2EN97z3METyZ9wyjuXTTnLAhVErc6BKdCQ9/a04FW9MXw49Euy
   24FdkqAp6MoLatwTfdd6zZvw+p4gF5qOi6M0+JNH1v+kMWHTwDqTyYuQD
   cZ5LSvLoyIuBmyZrvEzD8E92yWpnypwiTq4chhry+k3yw8es71SIuvEH6
   g==;
X-CSE-ConnectionGUID: Amqc0cUISkG0aEOMMhLh3g==
X-CSE-MsgGUID: SDKN4jW/QA6OAZV7WEvWHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69554023"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="69554023"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 06:53:26 -0800
X-CSE-ConnectionGUID: N8zPr4KsSXqAvIW1PX3ZlA==
X-CSE-MsgGUID: ewnuJU4FQT+TXJsSncvJEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="209184746"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 Jan 2026 06:53:24 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfJIH-00000000DRs-41MW;
	Mon, 12 Jan 2026 14:53:21 +0000
Date: Mon, 12 Jan 2026 22:52:38 +0800
From: kernel test robot <lkp@intel.com>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dinguyen:remove_ocp_v4 2/4]
 drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c:625:9: error: no member
 named 'stmmac_ocp_rst' in 'struct socfpga_dwmac'; did you mean 'stmmac_rst'?
Message-ID: <202601122223.ntQbUJHy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git remove_ocp_v4
head:   304fdccabcccbd3edc8e12cac67521f0513191e7
commit: 3d0a0b1aae1ed39b4334accb26a51adc839fc150 [2/4] net: stmmac: socfpga: add call to assert/deassert ahb reset line
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260112/202601122223.ntQbUJHy-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260112/202601122223.ntQbUJHy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601122223.ntQbUJHy-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c:625:9: error: no member named 'stmmac_ocp_rst' in 'struct socfpga_dwmac'; did you mean 'stmmac_rst'?
     625 |         dwmac->stmmac_ocp_rst = devm_reset_control_get_optional(dev, "stmmaceth-ocp");
         |                ^~~~~~~~~~~~~~
         |                stmmac_rst
   drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c:66:24: note: 'stmmac_rst' declared here
      66 |         struct reset_control *stmmac_rst;
         |                               ^
   drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c:632:18: warning: missing terminating '"' character [-Winvalid-pp-token]
     632 |                         dev_warn(dev, "ocp reset is deprecated, please update your
         |                                       ^
   drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c:633:20: warning: missing terminating '"' character [-Winvalid-pp-token]
     633 |                                  device tree.\n");
         |                                                ^
>> drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c:632:4: error: unterminated function-like macro invocation
     632 |                         dev_warn(dev, "ocp reset is deprecated, please update your
         |                         ^
   include/linux/dev_printk.h:155:9: note: macro 'dev_warn' defined here
     155 | #define dev_warn(dev, fmt, ...) \
         |         ^
>> drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c:699:26: error: expected expression
     699 | MODULE_LICENSE("GPL v2");
         |                          ^
>> drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c:699:26: warning: misleading indentation; statement is not part of the previous 'if' [-Wmisleading-indentation]
   drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c:631:3: note: previous statement is here
     631 |                 if (ocp_rst)
         |                 ^
>> drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c:699:26: error: expected '}'
     699 | MODULE_LICENSE("GPL v2");
         |                          ^
   drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c:626:33: note: to match this '{'
     626 |         if (!plat_dat->stmmac_ahb_rst) {
         |                                        ^
>> drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c:699:26: error: expected '}'
     699 | MODULE_LICENSE("GPL v2");
         |                          ^
   drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c:598:1: note: to match this '{'
     598 | {
         | ^
   3 warnings and 5 errors generated.


vim +625 drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c

93d46ea3e984323 Rohan G Thomas        2025-11-01  596  
8880b6c849916a3 Joachim Eastwood      2015-07-29  597  static int socfpga_dwmac_probe(struct platform_device *pdev)
82732789e8e7fb1 Joachim Eastwood      2015-07-29  598  {
8880b6c849916a3 Joachim Eastwood      2015-07-29  599  	struct plat_stmmacenet_data *plat_dat;
8880b6c849916a3 Joachim Eastwood      2015-07-29  600  	struct stmmac_resources stmmac_res;
82732789e8e7fb1 Joachim Eastwood      2015-07-29  601  	struct device		*dev = &pdev->dev;
82732789e8e7fb1 Joachim Eastwood      2015-07-29  602  	int			ret;
82732789e8e7fb1 Joachim Eastwood      2015-07-29  603  	struct socfpga_dwmac	*dwmac;
3d0a0b1aae1ed39 Dinh Nguyen           2025-12-27  604  	struct reset_control	*ocp_rst;
40ae25505fe8346 Dinh Nguyen           2019-06-05  605  	const struct socfpga_dwmac_ops *ops;
40ae25505fe8346 Dinh Nguyen           2019-06-05  606  
40ae25505fe8346 Dinh Nguyen           2019-06-05  607  	ops = device_get_match_data(&pdev->dev);
40ae25505fe8346 Dinh Nguyen           2019-06-05  608  	if (!ops) {
40ae25505fe8346 Dinh Nguyen           2019-06-05  609  		dev_err(&pdev->dev, "no of match data provided\n");
40ae25505fe8346 Dinh Nguyen           2019-06-05  610  		return -EINVAL;
40ae25505fe8346 Dinh Nguyen           2019-06-05  611  	}
82732789e8e7fb1 Joachim Eastwood      2015-07-29  612  
8880b6c849916a3 Joachim Eastwood      2015-07-29  613  	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
8880b6c849916a3 Joachim Eastwood      2015-07-29  614  	if (ret)
8880b6c849916a3 Joachim Eastwood      2015-07-29  615  		return ret;
8880b6c849916a3 Joachim Eastwood      2015-07-29  616  
9086d3f2b5607f4 Jisheng Zhang         2023-09-16  617  	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
8880b6c849916a3 Joachim Eastwood      2015-07-29  618  	if (IS_ERR(plat_dat))
8880b6c849916a3 Joachim Eastwood      2015-07-29  619  		return PTR_ERR(plat_dat);
8880b6c849916a3 Joachim Eastwood      2015-07-29  620  
82732789e8e7fb1 Joachim Eastwood      2015-07-29  621  	dwmac = devm_kzalloc(dev, sizeof(*dwmac), GFP_KERNEL);
9086d3f2b5607f4 Jisheng Zhang         2023-09-16  622  	if (!dwmac)
9086d3f2b5607f4 Jisheng Zhang         2023-09-16  623  		return -ENOMEM;
82732789e8e7fb1 Joachim Eastwood      2015-07-29  624  
bc8a2d9bcbf1ca5 Dinh Nguyen           2018-06-19 @625  	dwmac->stmmac_ocp_rst = devm_reset_control_get_optional(dev, "stmmaceth-ocp");
3d0a0b1aae1ed39 Dinh Nguyen           2025-12-27  626  	if (!plat_dat->stmmac_ahb_rst) {
3d0a0b1aae1ed39 Dinh Nguyen           2025-12-27  627  		ocp_rst = devm_reset_control_get_optional(dev, "stmmaceth-ocp");
3d0a0b1aae1ed39 Dinh Nguyen           2025-12-27  628  		if (IS_ERR(ocp_rst))
3d0a0b1aae1ed39 Dinh Nguyen           2025-12-27  629  			return dev_err_probe(dev, PTR_ERR(ocp_rst),
3d0a0b1aae1ed39 Dinh Nguyen           2025-12-27  630  					     "failed to get ocp reset");
3d0a0b1aae1ed39 Dinh Nguyen           2025-12-27  631  		if (ocp_rst)
3d0a0b1aae1ed39 Dinh Nguyen           2025-12-27 @632  			dev_warn(dev, "ocp reset is deprecated, please update your
3d0a0b1aae1ed39 Dinh Nguyen           2025-12-27 @633  				 device tree.\n");
3d0a0b1aae1ed39 Dinh Nguyen           2025-12-27  634  		plat_dat->stmmac_ahb_rst = ocp_rst;
3d0a0b1aae1ed39 Dinh Nguyen           2025-12-27  635  	}
3d0a0b1aae1ed39 Dinh Nguyen           2025-12-27  636  
3d0a0b1aae1ed39 Dinh Nguyen           2025-12-27  637  	reset_control_deassert(plat_dat->stmmac_ahb_rst = ocp_rst);
bc8a2d9bcbf1ca5 Dinh Nguyen           2018-06-19  638  
82732789e8e7fb1 Joachim Eastwood      2015-07-29  639  	ret = socfpga_dwmac_parse_data(dwmac, dev);
82732789e8e7fb1 Joachim Eastwood      2015-07-29  640  	if (ret) {
82732789e8e7fb1 Joachim Eastwood      2015-07-29  641  		dev_err(dev, "Unable to parse OF data\n");
9086d3f2b5607f4 Jisheng Zhang         2023-09-16  642  		return ret;
82732789e8e7fb1 Joachim Eastwood      2015-07-29  643  	}
82732789e8e7fb1 Joachim Eastwood      2015-07-29  644  
9276bfc2df92c6c Russell King (Oracle  2025-04-17  645) 	/* The socfpga driver needs to control the stmmac reset to set the phy
9276bfc2df92c6c Russell King (Oracle  2025-04-17  646) 	 * mode. Create a copy of the core reset handle so it can be used by
9276bfc2df92c6c Russell King (Oracle  2025-04-17  647) 	 * the driver later.
9276bfc2df92c6c Russell King (Oracle  2025-04-17  648) 	 */
9276bfc2df92c6c Russell King (Oracle  2025-04-17  649) 	dwmac->stmmac_rst = plat_dat->stmmac_rst;
40ae25505fe8346 Dinh Nguyen           2019-06-05  650  	dwmac->ops = ops;
91255347bba9637 Russell King (Oracle  2025-04-17  651) 	dwmac->plat_dat = plat_dat;
9276bfc2df92c6c Russell King (Oracle  2025-04-17  652) 
8880b6c849916a3 Joachim Eastwood      2015-07-29  653  	plat_dat->bsp_priv = dwmac;
8880b6c849916a3 Joachim Eastwood      2015-07-29  654  	plat_dat->fix_mac_speed = socfpga_dwmac_fix_mac_speed;
6bf70d999aa90bc Russell King (Oracle  2025-04-17  655) 	plat_dat->init = socfpga_dwmac_init;
81b418a65657571 Russell King (Oracle  2024-05-13  656) 	plat_dat->pcs_init = socfpga_dwmac_pcs_init;
81b418a65657571 Russell King (Oracle  2024-05-13  657) 	plat_dat->pcs_exit = socfpga_dwmac_pcs_exit;
98a6d9f192d3214 Russell King (Oracle  2024-06-13  658) 	plat_dat->select_pcs = socfpga_dwmac_select_pcs;
82732789e8e7fb1 Joachim Eastwood      2015-07-29  659  
93d46ea3e984323 Rohan G Thomas        2025-11-01  660  	ops->setup_plat_dat(dwmac);
407618d66dba55e Maxime Chevallier     2024-11-22  661  
1dbefd578d8bd3b Russell King (Oracle  2025-04-17  662) 	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
8880b6c849916a3 Joachim Eastwood      2015-07-29  663  }
c7c52ae74f0bd3a Joachim Eastwood      2015-05-14  664  
40ae25505fe8346 Dinh Nguyen           2019-06-05  665  static const struct socfpga_dwmac_ops socfpga_gen5_ops = {
40ae25505fe8346 Dinh Nguyen           2019-06-05  666  	.set_phy_mode = socfpga_gen5_set_phy_mode,
93d46ea3e984323 Rohan G Thomas        2025-11-01  667  	.setup_plat_dat = socfpga_gen5_setup_plat_dat,
40ae25505fe8346 Dinh Nguyen           2019-06-05  668  };
40ae25505fe8346 Dinh Nguyen           2019-06-05  669  
40ae25505fe8346 Dinh Nguyen           2019-06-05  670  static const struct socfpga_dwmac_ops socfpga_gen10_ops = {
40ae25505fe8346 Dinh Nguyen           2019-06-05  671  	.set_phy_mode = socfpga_gen10_set_phy_mode,
93d46ea3e984323 Rohan G Thomas        2025-11-01  672  	.setup_plat_dat = socfpga_gen5_setup_plat_dat,
93d46ea3e984323 Rohan G Thomas        2025-11-01  673  };
93d46ea3e984323 Rohan G Thomas        2025-11-01  674  
93d46ea3e984323 Rohan G Thomas        2025-11-01  675  static const struct socfpga_dwmac_ops socfpga_agilex5_ops = {
93d46ea3e984323 Rohan G Thomas        2025-11-01  676  	.set_phy_mode = socfpga_gen10_set_phy_mode,
93d46ea3e984323 Rohan G Thomas        2025-11-01  677  	.setup_plat_dat = socfpga_agilex5_setup_plat_dat,
40ae25505fe8346 Dinh Nguyen           2019-06-05  678  };
40ae25505fe8346 Dinh Nguyen           2019-06-05  679  
c7c52ae74f0bd3a Joachim Eastwood      2015-05-14  680  static const struct of_device_id socfpga_dwmac_match[] = {
40ae25505fe8346 Dinh Nguyen           2019-06-05  681  	{ .compatible = "altr,socfpga-stmmac", .data = &socfpga_gen5_ops },
40ae25505fe8346 Dinh Nguyen           2019-06-05  682  	{ .compatible = "altr,socfpga-stmmac-a10-s10", .data = &socfpga_gen10_ops },
93d46ea3e984323 Rohan G Thomas        2025-11-01  683  	{ .compatible = "altr,socfpga-stmmac-agilex5", .data = &socfpga_agilex5_ops },
c7c52ae74f0bd3a Joachim Eastwood      2015-05-14  684  	{ }
c7c52ae74f0bd3a Joachim Eastwood      2015-05-14  685  };
c7c52ae74f0bd3a Joachim Eastwood      2015-05-14  686  MODULE_DEVICE_TABLE(of, socfpga_dwmac_match);
c7c52ae74f0bd3a Joachim Eastwood      2015-05-14  687  
c7c52ae74f0bd3a Joachim Eastwood      2015-05-14  688  static struct platform_driver socfpga_dwmac_driver = {
8880b6c849916a3 Joachim Eastwood      2015-07-29  689  	.probe  = socfpga_dwmac_probe,
c7c52ae74f0bd3a Joachim Eastwood      2015-05-14  690  	.driver = {
c7c52ae74f0bd3a Joachim Eastwood      2015-05-14  691  		.name           = "socfpga-dwmac",
6bf70d999aa90bc Russell King (Oracle  2025-04-17  692) 		.pm		= &stmmac_pltfr_pm_ops,
c7c52ae74f0bd3a Joachim Eastwood      2015-05-14  693  		.of_match_table = socfpga_dwmac_match,
c7c52ae74f0bd3a Joachim Eastwood      2015-05-14  694  	},
c7c52ae74f0bd3a Joachim Eastwood      2015-05-14  695  };
c7c52ae74f0bd3a Joachim Eastwood      2015-05-14  696  module_platform_driver(socfpga_dwmac_driver);
c7c52ae74f0bd3a Joachim Eastwood      2015-05-14  697  
23f487f70c73e31 Breno Leitao          2024-01-25  698  MODULE_DESCRIPTION("Altera SOC DWMAC Specific Glue layer");
c7c52ae74f0bd3a Joachim Eastwood      2015-05-14 @699  MODULE_LICENSE("GPL v2");

:::::: The code at line 625 was first introduced by commit
:::::: bc8a2d9bcbf1ca548b1deb315d14e1da81945bea net: stmmac: socfpga: add additional ocp reset line for Stratix10

:::::: TO: Dinh Nguyen <dinguyen@kernel.org>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
