Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3567DBE45;
	Fri,  1 Sep 2023 12:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693572461; x=1725108461;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZnxaiAEwaxyvjMKb/NpzZ5LL+AnyfY9ymv4NVirPBGI=;
  b=fyQsFDfqTdmqdGV3+sQ0QNQNnKXtJuQV8JolR6D9rapKC3wEsU6Ip8yq
   86oGD6Ihj/7MS22tnI6pRC6/sP60MK09KMyQt1SLvGGC9gIGT5R+U633m
   qVaGNXemqO+LuIX1JdPh+FSQ9uaQQNNrwKbDdbIdquCJndSbOFQHfikZn
   nc73ywqr+sR4MOTU5WGYpjfOQJVet752PYugXiPn1nSLNL2inMaW18g/N
   FyHRQn/YjWYWtahcXmAe+xlRnXnOlEStWKcmxFkQ7ULfteyvM5J2rr1TX
   1fyabWLFwqSMi5AV+ekazY0eF6QgnDO5GmaRPLDgcj9bINV2X9d11PbMd
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="366437517"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="366437517"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 05:47:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="1070736876"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="1070736876"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 01 Sep 2023 05:47:38 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qc3Ym-0001IB-1G;
	Fri, 01 Sep 2023 12:47:36 +0000
Date: Fri, 1 Sep 2023 20:46:49 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 8/8] drivers/phy/realtek/phy-rtk-usb3.c:570:28:
 error: incomplete definition of type 'struct platform_device'
Message-ID: <202309012048.xe4QC2gb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   a143793949161ccf952d0b50ee37e442cf8c02e9
commit: a143793949161ccf952d0b50ee37e442cf8c02e9 [8/8] of: header cleanups
config: x86_64-buildonly-randconfig-002-20230901 (https://download.01.org/0day-ci/archive/20230901/202309012048.xe4QC2gb-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309012048.xe4QC2gb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309012048.xe4QC2gb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/phy/realtek/phy-rtk-usb3.c:570:28: error: incomplete definition of type 'struct platform_device'
           struct device *dev = &pdev->dev;
                                 ~~~~^
   include/linux/usb/hcd.h:468:8: note: forward declaration of 'struct platform_device'
   struct platform_device;
          ^
   drivers/phy/realtek/phy-rtk-usb3.c:586:24: error: incomplete definition of type 'struct platform_device'
           rtk_phy->dev                    = &pdev->dev;
                                              ~~~~^
   include/linux/usb/hcd.h:468:8: note: forward declaration of 'struct platform_device'
   struct platform_device;
          ^
>> drivers/phy/realtek/phy-rtk-usb3.c:601:2: error: call to undeclared function 'platform_set_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           platform_set_drvdata(pdev, rtk_phy);
           ^
   drivers/phy/realtek/phy-rtk-usb3.c:601:2: note: did you mean 'regulator_set_drvdata'?
   include/linux/regulator/consumer.h:318:6: note: 'regulator_set_drvdata' declared here
   void regulator_set_drvdata(struct regulator *regulator, void *data);
        ^
>> drivers/phy/realtek/phy-rtk-usb3.c:625:28: error: call to undeclared function 'platform_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           struct rtk_phy *rtk_phy = platform_get_drvdata(pdev);
                                     ^
   drivers/phy/realtek/phy-rtk-usb3.c:625:28: note: did you mean 'regulator_get_drvdata'?
   include/linux/regulator/consumer.h:317:7: note: 'regulator_get_drvdata' declared here
   void *regulator_get_drvdata(struct regulator *regulator);
         ^
>> drivers/phy/realtek/phy-rtk-usb3.c:625:18: error: incompatible integer to pointer conversion initializing 'struct rtk_phy *' with an expression of type 'int' [-Wint-conversion]
           struct rtk_phy *rtk_phy = platform_get_drvdata(pdev);
                           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/phy/realtek/phy-rtk-usb3.c:753:31: error: variable has incomplete type 'struct platform_driver'
   static struct platform_driver rtk_usb3phy_driver = {
                                 ^
   drivers/phy/realtek/phy-rtk-usb3.c:753:15: note: forward declaration of 'struct platform_driver'
   static struct platform_driver rtk_usb3phy_driver = {
                 ^
>> drivers/phy/realtek/phy-rtk-usb3.c:762:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
   module_platform_driver(rtk_usb3phy_driver);
   ^
   int
>> drivers/phy/realtek/phy-rtk-usb3.c:762:24: error: a parameter list without types is only allowed in a function definition
   module_platform_driver(rtk_usb3phy_driver);
                          ^
   8 errors generated.
--
>> drivers/phy/realtek/phy-rtk-usb2.c:1016:28: error: incomplete definition of type 'struct platform_device'
           struct device *dev = &pdev->dev;
                                 ~~~~^
   include/linux/usb/hcd.h:468:8: note: forward declaration of 'struct platform_device'
   struct platform_device;
          ^
   drivers/phy/realtek/phy-rtk-usb2.c:1032:24: error: incomplete definition of type 'struct platform_device'
           rtk_phy->dev                    = &pdev->dev;
                                              ~~~~^
   include/linux/usb/hcd.h:468:8: note: forward declaration of 'struct platform_device'
   struct platform_device;
          ^
>> drivers/phy/realtek/phy-rtk-usb2.c:1047:2: error: call to undeclared function 'platform_set_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           platform_set_drvdata(pdev, rtk_phy);
           ^
   drivers/phy/realtek/phy-rtk-usb2.c:1047:2: note: did you mean 'regulator_set_drvdata'?
   include/linux/regulator/consumer.h:318:6: note: 'regulator_set_drvdata' declared here
   void regulator_set_drvdata(struct regulator *regulator, void *data);
        ^
>> drivers/phy/realtek/phy-rtk-usb2.c:1072:28: error: call to undeclared function 'platform_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           struct rtk_phy *rtk_phy = platform_get_drvdata(pdev);
                                     ^
   drivers/phy/realtek/phy-rtk-usb2.c:1072:28: note: did you mean 'regulator_get_drvdata'?
   include/linux/regulator/consumer.h:317:7: note: 'regulator_get_drvdata' declared here
   void *regulator_get_drvdata(struct regulator *regulator);
         ^
>> drivers/phy/realtek/phy-rtk-usb2.c:1072:18: error: incompatible integer to pointer conversion initializing 'struct rtk_phy *' with an expression of type 'int' [-Wint-conversion]
           struct rtk_phy *rtk_phy = platform_get_drvdata(pdev);
                           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/phy/realtek/phy-rtk-usb2.c:1317:31: error: variable has incomplete type 'struct platform_driver'
   static struct platform_driver rtk_usb2phy_driver = {
                                 ^
   drivers/phy/realtek/phy-rtk-usb2.c:1317:15: note: forward declaration of 'struct platform_driver'
   static struct platform_driver rtk_usb2phy_driver = {
                 ^
>> drivers/phy/realtek/phy-rtk-usb2.c:1326:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
   module_platform_driver(rtk_usb2phy_driver);
   ^
   int
>> drivers/phy/realtek/phy-rtk-usb2.c:1326:24: error: a parameter list without types is only allowed in a function definition
   module_platform_driver(rtk_usb2phy_driver);
                          ^
   8 errors generated.


vim +570 drivers/phy/realtek/phy-rtk-usb3.c

adda6e82a7de7d6 Stanley Chang 2023-07-25  566  
adda6e82a7de7d6 Stanley Chang 2023-07-25  567  static int rtk_usb3phy_probe(struct platform_device *pdev)
adda6e82a7de7d6 Stanley Chang 2023-07-25  568  {
adda6e82a7de7d6 Stanley Chang 2023-07-25  569  	struct rtk_phy *rtk_phy;
adda6e82a7de7d6 Stanley Chang 2023-07-25 @570  	struct device *dev = &pdev->dev;
adda6e82a7de7d6 Stanley Chang 2023-07-25  571  	struct phy *generic_phy;
adda6e82a7de7d6 Stanley Chang 2023-07-25  572  	struct phy_provider *phy_provider;
adda6e82a7de7d6 Stanley Chang 2023-07-25  573  	const struct phy_cfg *phy_cfg;
adda6e82a7de7d6 Stanley Chang 2023-07-25  574  	int ret;
adda6e82a7de7d6 Stanley Chang 2023-07-25  575  
adda6e82a7de7d6 Stanley Chang 2023-07-25  576  	phy_cfg = of_device_get_match_data(dev);
adda6e82a7de7d6 Stanley Chang 2023-07-25  577  	if (!phy_cfg) {
adda6e82a7de7d6 Stanley Chang 2023-07-25  578  		dev_err(dev, "phy config are not assigned!\n");
adda6e82a7de7d6 Stanley Chang 2023-07-25  579  		return -EINVAL;
adda6e82a7de7d6 Stanley Chang 2023-07-25  580  	}
adda6e82a7de7d6 Stanley Chang 2023-07-25  581  
adda6e82a7de7d6 Stanley Chang 2023-07-25  582  	rtk_phy = devm_kzalloc(dev, sizeof(*rtk_phy), GFP_KERNEL);
adda6e82a7de7d6 Stanley Chang 2023-07-25  583  	if (!rtk_phy)
adda6e82a7de7d6 Stanley Chang 2023-07-25  584  		return -ENOMEM;
adda6e82a7de7d6 Stanley Chang 2023-07-25  585  
adda6e82a7de7d6 Stanley Chang 2023-07-25  586  	rtk_phy->dev			= &pdev->dev;
adda6e82a7de7d6 Stanley Chang 2023-07-25  587  	rtk_phy->phy.dev		= rtk_phy->dev;
adda6e82a7de7d6 Stanley Chang 2023-07-25  588  	rtk_phy->phy.label		= "rtk-usb3phy";
adda6e82a7de7d6 Stanley Chang 2023-07-25  589  	rtk_phy->phy.notify_port_status = rtk_phy_notify_port_status;
adda6e82a7de7d6 Stanley Chang 2023-07-25  590  
adda6e82a7de7d6 Stanley Chang 2023-07-25  591  	rtk_phy->phy_cfg = devm_kzalloc(dev, sizeof(*phy_cfg), GFP_KERNEL);
adda6e82a7de7d6 Stanley Chang 2023-07-25  592  
adda6e82a7de7d6 Stanley Chang 2023-07-25  593  	memcpy(rtk_phy->phy_cfg, phy_cfg, sizeof(*phy_cfg));
adda6e82a7de7d6 Stanley Chang 2023-07-25  594  
adda6e82a7de7d6 Stanley Chang 2023-07-25  595  	rtk_phy->num_phy = 1;
adda6e82a7de7d6 Stanley Chang 2023-07-25  596  
adda6e82a7de7d6 Stanley Chang 2023-07-25  597  	ret = parse_phy_data(rtk_phy);
adda6e82a7de7d6 Stanley Chang 2023-07-25  598  	if (ret)
adda6e82a7de7d6 Stanley Chang 2023-07-25  599  		goto err;
adda6e82a7de7d6 Stanley Chang 2023-07-25  600  
adda6e82a7de7d6 Stanley Chang 2023-07-25 @601  	platform_set_drvdata(pdev, rtk_phy);
adda6e82a7de7d6 Stanley Chang 2023-07-25  602  
adda6e82a7de7d6 Stanley Chang 2023-07-25  603  	generic_phy = devm_phy_create(rtk_phy->dev, NULL, &ops);
adda6e82a7de7d6 Stanley Chang 2023-07-25  604  	if (IS_ERR(generic_phy))
adda6e82a7de7d6 Stanley Chang 2023-07-25  605  		return PTR_ERR(generic_phy);
adda6e82a7de7d6 Stanley Chang 2023-07-25  606  
adda6e82a7de7d6 Stanley Chang 2023-07-25  607  	phy_set_drvdata(generic_phy, rtk_phy);
adda6e82a7de7d6 Stanley Chang 2023-07-25  608  
adda6e82a7de7d6 Stanley Chang 2023-07-25  609  	phy_provider = devm_of_phy_provider_register(rtk_phy->dev, of_phy_simple_xlate);
adda6e82a7de7d6 Stanley Chang 2023-07-25  610  	if (IS_ERR(phy_provider))
adda6e82a7de7d6 Stanley Chang 2023-07-25  611  		return PTR_ERR(phy_provider);
adda6e82a7de7d6 Stanley Chang 2023-07-25  612  
adda6e82a7de7d6 Stanley Chang 2023-07-25  613  	ret = usb_add_phy_dev(&rtk_phy->phy);
adda6e82a7de7d6 Stanley Chang 2023-07-25  614  	if (ret)
adda6e82a7de7d6 Stanley Chang 2023-07-25  615  		goto err;
adda6e82a7de7d6 Stanley Chang 2023-07-25  616  
adda6e82a7de7d6 Stanley Chang 2023-07-25  617  	create_debug_files(rtk_phy);
adda6e82a7de7d6 Stanley Chang 2023-07-25  618  
adda6e82a7de7d6 Stanley Chang 2023-07-25  619  err:
adda6e82a7de7d6 Stanley Chang 2023-07-25  620  	return ret;
adda6e82a7de7d6 Stanley Chang 2023-07-25  621  }
adda6e82a7de7d6 Stanley Chang 2023-07-25  622  
adda6e82a7de7d6 Stanley Chang 2023-07-25  623  static void rtk_usb3phy_remove(struct platform_device *pdev)
adda6e82a7de7d6 Stanley Chang 2023-07-25  624  {
adda6e82a7de7d6 Stanley Chang 2023-07-25 @625  	struct rtk_phy *rtk_phy = platform_get_drvdata(pdev);
adda6e82a7de7d6 Stanley Chang 2023-07-25  626  
adda6e82a7de7d6 Stanley Chang 2023-07-25  627  	remove_debug_files(rtk_phy);
adda6e82a7de7d6 Stanley Chang 2023-07-25  628  
adda6e82a7de7d6 Stanley Chang 2023-07-25  629  	usb_remove_phy(&rtk_phy->phy);
adda6e82a7de7d6 Stanley Chang 2023-07-25  630  }
adda6e82a7de7d6 Stanley Chang 2023-07-25  631  
adda6e82a7de7d6 Stanley Chang 2023-07-25  632  static const struct phy_cfg rtd1295_phy_cfg = {
adda6e82a7de7d6 Stanley Chang 2023-07-25  633  	.param_size = MAX_USB_PHY_DATA_SIZE,
adda6e82a7de7d6 Stanley Chang 2023-07-25  634  	.param = {  [0] = {0x01, 0x4008},  [1] = {0x01, 0xe046},
adda6e82a7de7d6 Stanley Chang 2023-07-25  635  		    [2] = {0x02, 0x6046},  [3] = {0x03, 0x2779},
adda6e82a7de7d6 Stanley Chang 2023-07-25  636  		    [4] = {0x04, 0x72f5},  [5] = {0x05, 0x2ad3},
adda6e82a7de7d6 Stanley Chang 2023-07-25  637  		    [6] = {0x06, 0x000e},  [7] = {0x07, 0x2e00},
adda6e82a7de7d6 Stanley Chang 2023-07-25  638  		    [8] = {0x08, 0x3591},  [9] = {0x09, 0x525c},
adda6e82a7de7d6 Stanley Chang 2023-07-25  639  		   [10] = {0x0a, 0xa600}, [11] = {0x0b, 0xa904},
adda6e82a7de7d6 Stanley Chang 2023-07-25  640  		   [12] = {0x0c, 0xc000}, [13] = {0x0d, 0xef1c},
adda6e82a7de7d6 Stanley Chang 2023-07-25  641  		   [14] = {0x0e, 0x2000}, [15] = {0x0f, 0x0000},
adda6e82a7de7d6 Stanley Chang 2023-07-25  642  		   [16] = {0x10, 0x000c}, [17] = {0x11, 0x4c00},
adda6e82a7de7d6 Stanley Chang 2023-07-25  643  		   [18] = {0x12, 0xfc00}, [19] = {0x13, 0x0c81},
adda6e82a7de7d6 Stanley Chang 2023-07-25  644  		   [20] = {0x14, 0xde01}, [21] = {0x15, 0x0000},
adda6e82a7de7d6 Stanley Chang 2023-07-25  645  		   [22] = {0x16, 0x0000}, [23] = {0x17, 0x0000},
adda6e82a7de7d6 Stanley Chang 2023-07-25  646  		   [24] = {0x18, 0x0000}, [25] = {0x19, 0x4004},
adda6e82a7de7d6 Stanley Chang 2023-07-25  647  		   [26] = {0x1a, 0x1260}, [27] = {0x1b, 0xff00},
adda6e82a7de7d6 Stanley Chang 2023-07-25  648  		   [28] = {0x1c, 0xcb00}, [29] = {0x1d, 0xa03f},
adda6e82a7de7d6 Stanley Chang 2023-07-25  649  		   [30] = {0x1e, 0xc2e0}, [31] = {0x1f, 0x2807},
adda6e82a7de7d6 Stanley Chang 2023-07-25  650  		   [32] = {0x20, 0x947a}, [33] = {0x21, 0x88aa},
adda6e82a7de7d6 Stanley Chang 2023-07-25  651  		   [34] = {0x22, 0x0057}, [35] = {0x23, 0xab66},
adda6e82a7de7d6 Stanley Chang 2023-07-25  652  		   [36] = {0x24, 0x0800}, [37] = {0x25, 0x0000},
adda6e82a7de7d6 Stanley Chang 2023-07-25  653  		   [38] = {0x26, 0x040a}, [39] = {0x27, 0x01d6},
adda6e82a7de7d6 Stanley Chang 2023-07-25  654  		   [40] = {0x28, 0xf8c2}, [41] = {0x29, 0x3080},
adda6e82a7de7d6 Stanley Chang 2023-07-25  655  		   [42] = {0x2a, 0x3082}, [43] = {0x2b, 0x2078},
adda6e82a7de7d6 Stanley Chang 2023-07-25  656  		   [44] = {0x2c, 0xffff}, [45] = {0x2d, 0xffff},
adda6e82a7de7d6 Stanley Chang 2023-07-25  657  		   [46] = {0x2e, 0x0000}, [47] = {0x2f, 0x0040}, },
adda6e82a7de7d6 Stanley Chang 2023-07-25  658  	.check_efuse = false,
adda6e82a7de7d6 Stanley Chang 2023-07-25  659  	.do_toggle = true,
adda6e82a7de7d6 Stanley Chang 2023-07-25  660  	.do_toggle_once = false,
adda6e82a7de7d6 Stanley Chang 2023-07-25  661  	.use_default_parameter = false,
adda6e82a7de7d6 Stanley Chang 2023-07-25  662  	.check_rx_front_end_offset = false,
adda6e82a7de7d6 Stanley Chang 2023-07-25  663  };
adda6e82a7de7d6 Stanley Chang 2023-07-25  664  
adda6e82a7de7d6 Stanley Chang 2023-07-25  665  static const struct phy_cfg rtd1619_phy_cfg = {
adda6e82a7de7d6 Stanley Chang 2023-07-25  666  	.param_size = MAX_USB_PHY_DATA_SIZE,
adda6e82a7de7d6 Stanley Chang 2023-07-25  667  	.param = {  [8] = {0x08, 0x3591},
adda6e82a7de7d6 Stanley Chang 2023-07-25  668  		   [38] = {0x26, 0x840b},
adda6e82a7de7d6 Stanley Chang 2023-07-25  669  		   [40] = {0x28, 0xf842}, },
adda6e82a7de7d6 Stanley Chang 2023-07-25  670  	.check_efuse = false,
adda6e82a7de7d6 Stanley Chang 2023-07-25  671  	.do_toggle = true,
adda6e82a7de7d6 Stanley Chang 2023-07-25  672  	.do_toggle_once = false,
adda6e82a7de7d6 Stanley Chang 2023-07-25  673  	.use_default_parameter = false,
adda6e82a7de7d6 Stanley Chang 2023-07-25  674  	.check_rx_front_end_offset = false,
adda6e82a7de7d6 Stanley Chang 2023-07-25  675  };
adda6e82a7de7d6 Stanley Chang 2023-07-25  676  
adda6e82a7de7d6 Stanley Chang 2023-07-25  677  static const struct phy_cfg rtd1319_phy_cfg = {
adda6e82a7de7d6 Stanley Chang 2023-07-25  678  	.param_size = MAX_USB_PHY_DATA_SIZE,
adda6e82a7de7d6 Stanley Chang 2023-07-25  679  	.param = {  [1] = {0x01, 0xac86},
adda6e82a7de7d6 Stanley Chang 2023-07-25  680  		    [6] = {0x06, 0x0003},
adda6e82a7de7d6 Stanley Chang 2023-07-25  681  		    [9] = {0x09, 0x924c},
adda6e82a7de7d6 Stanley Chang 2023-07-25  682  		   [10] = {0x0a, 0xa608},
adda6e82a7de7d6 Stanley Chang 2023-07-25  683  		   [11] = {0x0b, 0xb905},
adda6e82a7de7d6 Stanley Chang 2023-07-25  684  		   [14] = {0x0e, 0x2010},
adda6e82a7de7d6 Stanley Chang 2023-07-25  685  		   [32] = {0x20, 0x705a},
adda6e82a7de7d6 Stanley Chang 2023-07-25  686  		   [33] = {0x21, 0xf645},
adda6e82a7de7d6 Stanley Chang 2023-07-25  687  		   [34] = {0x22, 0x0013},
adda6e82a7de7d6 Stanley Chang 2023-07-25  688  		   [35] = {0x23, 0xcb66},
adda6e82a7de7d6 Stanley Chang 2023-07-25  689  		   [41] = {0x29, 0xff00}, },
adda6e82a7de7d6 Stanley Chang 2023-07-25  690  	.check_efuse = true,
adda6e82a7de7d6 Stanley Chang 2023-07-25  691  	.do_toggle = true,
adda6e82a7de7d6 Stanley Chang 2023-07-25  692  	.do_toggle_once = false,
adda6e82a7de7d6 Stanley Chang 2023-07-25  693  	.use_default_parameter = false,
adda6e82a7de7d6 Stanley Chang 2023-07-25  694  	.check_rx_front_end_offset = false,
adda6e82a7de7d6 Stanley Chang 2023-07-25  695  };
adda6e82a7de7d6 Stanley Chang 2023-07-25  696  
adda6e82a7de7d6 Stanley Chang 2023-07-25  697  static const struct phy_cfg rtd1619b_phy_cfg = {
adda6e82a7de7d6 Stanley Chang 2023-07-25  698  	.param_size = MAX_USB_PHY_DATA_SIZE,
adda6e82a7de7d6 Stanley Chang 2023-07-25  699  	.param = {  [1] = {0x01, 0xac8c},
adda6e82a7de7d6 Stanley Chang 2023-07-25  700  		    [6] = {0x06, 0x0017},
adda6e82a7de7d6 Stanley Chang 2023-07-25  701  		    [9] = {0x09, 0x724c},
adda6e82a7de7d6 Stanley Chang 2023-07-25  702  		   [10] = {0x0a, 0xb610},
adda6e82a7de7d6 Stanley Chang 2023-07-25  703  		   [11] = {0x0b, 0xb90d},
adda6e82a7de7d6 Stanley Chang 2023-07-25  704  		   [13] = {0x0d, 0xef2a},
adda6e82a7de7d6 Stanley Chang 2023-07-25  705  		   [15] = {0x0f, 0x9050},
adda6e82a7de7d6 Stanley Chang 2023-07-25  706  		   [16] = {0x10, 0x000c},
adda6e82a7de7d6 Stanley Chang 2023-07-25  707  		   [32] = {0x20, 0x70ff},
adda6e82a7de7d6 Stanley Chang 2023-07-25  708  		   [34] = {0x22, 0x0013},
adda6e82a7de7d6 Stanley Chang 2023-07-25  709  		   [35] = {0x23, 0xdb66},
adda6e82a7de7d6 Stanley Chang 2023-07-25  710  		   [38] = {0x26, 0x8609},
adda6e82a7de7d6 Stanley Chang 2023-07-25  711  		   [41] = {0x29, 0xff13},
adda6e82a7de7d6 Stanley Chang 2023-07-25  712  		   [42] = {0x2a, 0x3070}, },
adda6e82a7de7d6 Stanley Chang 2023-07-25  713  	.check_efuse = true,
adda6e82a7de7d6 Stanley Chang 2023-07-25  714  	.do_toggle = false,
adda6e82a7de7d6 Stanley Chang 2023-07-25  715  	.do_toggle_once = true,
adda6e82a7de7d6 Stanley Chang 2023-07-25  716  	.use_default_parameter = false,
adda6e82a7de7d6 Stanley Chang 2023-07-25  717  	.check_rx_front_end_offset = false,
adda6e82a7de7d6 Stanley Chang 2023-07-25  718  };
adda6e82a7de7d6 Stanley Chang 2023-07-25  719  
adda6e82a7de7d6 Stanley Chang 2023-07-25  720  static const  struct phy_cfg rtd1319d_phy_cfg = {
adda6e82a7de7d6 Stanley Chang 2023-07-25  721  	.param_size = MAX_USB_PHY_DATA_SIZE,
adda6e82a7de7d6 Stanley Chang 2023-07-25  722  	.param = {  [1] = {0x01, 0xac89},
adda6e82a7de7d6 Stanley Chang 2023-07-25  723  		    [4] = {0x04, 0xf2f5},
adda6e82a7de7d6 Stanley Chang 2023-07-25  724  		    [6] = {0x06, 0x0017},
adda6e82a7de7d6 Stanley Chang 2023-07-25  725  		    [9] = {0x09, 0x424c},
adda6e82a7de7d6 Stanley Chang 2023-07-25  726  		   [10] = {0x0a, 0x9610},
adda6e82a7de7d6 Stanley Chang 2023-07-25  727  		   [11] = {0x0b, 0x9901},
adda6e82a7de7d6 Stanley Chang 2023-07-25  728  		   [12] = {0x0c, 0xf000},
adda6e82a7de7d6 Stanley Chang 2023-07-25  729  		   [13] = {0x0d, 0xef2a},
adda6e82a7de7d6 Stanley Chang 2023-07-25  730  		   [14] = {0x0e, 0x1000},
adda6e82a7de7d6 Stanley Chang 2023-07-25  731  		   [15] = {0x0f, 0x9050},
adda6e82a7de7d6 Stanley Chang 2023-07-25  732  		   [32] = {0x20, 0x7077},
adda6e82a7de7d6 Stanley Chang 2023-07-25  733  		   [35] = {0x23, 0x0b62},
adda6e82a7de7d6 Stanley Chang 2023-07-25  734  		   [37] = {0x25, 0x10ec},
adda6e82a7de7d6 Stanley Chang 2023-07-25  735  		   [42] = {0x2a, 0x3070}, },
adda6e82a7de7d6 Stanley Chang 2023-07-25  736  	.check_efuse = true,
adda6e82a7de7d6 Stanley Chang 2023-07-25  737  	.do_toggle = false,
adda6e82a7de7d6 Stanley Chang 2023-07-25  738  	.do_toggle_once = true,
adda6e82a7de7d6 Stanley Chang 2023-07-25  739  	.use_default_parameter = false,
adda6e82a7de7d6 Stanley Chang 2023-07-25  740  	.check_rx_front_end_offset = true,
adda6e82a7de7d6 Stanley Chang 2023-07-25  741  };
adda6e82a7de7d6 Stanley Chang 2023-07-25  742  
adda6e82a7de7d6 Stanley Chang 2023-07-25  743  static const struct of_device_id usbphy_rtk_dt_match[] = {
adda6e82a7de7d6 Stanley Chang 2023-07-25  744  	{ .compatible = "realtek,rtd1295-usb3phy", .data = &rtd1295_phy_cfg },
adda6e82a7de7d6 Stanley Chang 2023-07-25  745  	{ .compatible = "realtek,rtd1319-usb3phy", .data = &rtd1319_phy_cfg },
adda6e82a7de7d6 Stanley Chang 2023-07-25  746  	{ .compatible = "realtek,rtd1319d-usb3phy", .data = &rtd1319d_phy_cfg },
adda6e82a7de7d6 Stanley Chang 2023-07-25  747  	{ .compatible = "realtek,rtd1619-usb3phy", .data = &rtd1619_phy_cfg },
adda6e82a7de7d6 Stanley Chang 2023-07-25  748  	{ .compatible = "realtek,rtd1619b-usb3phy", .data = &rtd1619b_phy_cfg },
adda6e82a7de7d6 Stanley Chang 2023-07-25  749  	{},
adda6e82a7de7d6 Stanley Chang 2023-07-25  750  };
adda6e82a7de7d6 Stanley Chang 2023-07-25  751  MODULE_DEVICE_TABLE(of, usbphy_rtk_dt_match);
adda6e82a7de7d6 Stanley Chang 2023-07-25  752  
adda6e82a7de7d6 Stanley Chang 2023-07-25 @753  static struct platform_driver rtk_usb3phy_driver = {
adda6e82a7de7d6 Stanley Chang 2023-07-25  754  	.probe		= rtk_usb3phy_probe,
adda6e82a7de7d6 Stanley Chang 2023-07-25  755  	.remove_new	= rtk_usb3phy_remove,
adda6e82a7de7d6 Stanley Chang 2023-07-25  756  	.driver		= {
adda6e82a7de7d6 Stanley Chang 2023-07-25  757  		.name	= "rtk-usb3phy",
adda6e82a7de7d6 Stanley Chang 2023-07-25  758  		.of_match_table = usbphy_rtk_dt_match,
adda6e82a7de7d6 Stanley Chang 2023-07-25  759  	},
adda6e82a7de7d6 Stanley Chang 2023-07-25  760  };
adda6e82a7de7d6 Stanley Chang 2023-07-25  761  
adda6e82a7de7d6 Stanley Chang 2023-07-25 @762  module_platform_driver(rtk_usb3phy_driver);
adda6e82a7de7d6 Stanley Chang 2023-07-25  763  

:::::: The code at line 570 was first introduced by commit
:::::: adda6e82a7de7d6d478f6c8ef127f0ac51c510a1 phy: realtek: usb: Add driver for the Realtek SoC USB 3.0 PHY

:::::: TO: Stanley Chang <stanley_chang@realtek.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
