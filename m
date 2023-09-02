Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E952F28;
	Sat,  2 Sep 2023 12:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693658243; x=1725194243;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vBzAo+/rwZPYvNUcrrsEMj738VWAnVVhjWh6EdlUbgU=;
  b=NwQSkob78E8258eJQrDIR7svOtBVZIzXe6PrF1Hcf/1d5Axrqvw4Mcq6
   S89vGiKovT+Jc6pj3WjwD45Gi3EQ2jZKcCd80Ed+BAp8SPktJnonZNMip
   BTedB+tEnXo8v3vKwRg7V1ylJpkuokuXAGYDmCWFYbTjuIC+DsDi9YSVV
   Hcj230PvLQo7ymxyMIDo1kmxWGYDJ/78L3hxdmOxr49pUIp/6yqkLGmhf
   8+kRoBuu+uE2dScTvVafWQ+Hsa1qYHd+XdON9JfOLPSvzTWf8PHX3tjSl
   agcT2r2NgkCy8b1E/WOvnTR4n0/Qlz3t3An4AuJA+DmE0GfNY9ZXv8SSe
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="361391759"
X-IronPort-AV: E=Sophos;i="6.02,222,1688454000"; 
   d="scan'208";a="361391759"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2023 05:37:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="830400259"
X-IronPort-AV: E=Sophos;i="6.02,222,1688454000"; 
   d="scan'208";a="830400259"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 02 Sep 2023 05:37:20 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcPsM-0002L5-15;
	Sat, 02 Sep 2023 12:37:18 +0000
Date: Sat, 2 Sep 2023 20:37:10 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 68/68]
 drivers/phy/realtek/phy-rtk-usb2.c:1016:28: error: incomplete definition of
 type 'struct platform_device'
Message-ID: <202309022034.aLl2ewhQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   9ece0c059fa7600e46d8e2deecc2fa1bd86cde7e
commit: 9ece0c059fa7600e46d8e2deecc2fa1bd86cde7e [68/68] of: header cleanups
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230902/202309022034.aLl2ewhQ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230902/202309022034.aLl2ewhQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309022034.aLl2ewhQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/phy/realtek/phy-rtk-usb2.c:1016:28: error: incomplete definition of type 'struct platform_device'
    1016 |         struct device *dev = &pdev->dev;
         |                               ~~~~^
   include/linux/usb/hcd.h:468:8: note: forward declaration of 'struct platform_device'
     468 | struct platform_device;
         |        ^
   drivers/phy/realtek/phy-rtk-usb2.c:1032:24: error: incomplete definition of type 'struct platform_device'
    1032 |         rtk_phy->dev                    = &pdev->dev;
         |                                            ~~~~^
   include/linux/usb/hcd.h:468:8: note: forward declaration of 'struct platform_device'
     468 | struct platform_device;
         |        ^
>> drivers/phy/realtek/phy-rtk-usb2.c:1047:2: error: call to undeclared function 'platform_set_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1047 |         platform_set_drvdata(pdev, rtk_phy);
         |         ^
   drivers/phy/realtek/phy-rtk-usb2.c:1047:2: note: did you mean 'regulator_set_drvdata'?
   include/linux/regulator/consumer.h:318:6: note: 'regulator_set_drvdata' declared here
     318 | void regulator_set_drvdata(struct regulator *regulator, void *data);
         |      ^
>> drivers/phy/realtek/phy-rtk-usb2.c:1072:28: error: call to undeclared function 'platform_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1072 |         struct rtk_phy *rtk_phy = platform_get_drvdata(pdev);
         |                                   ^
   drivers/phy/realtek/phy-rtk-usb2.c:1072:28: note: did you mean 'regulator_get_drvdata'?
   include/linux/regulator/consumer.h:317:7: note: 'regulator_get_drvdata' declared here
     317 | void *regulator_get_drvdata(struct regulator *regulator);
         |       ^
>> drivers/phy/realtek/phy-rtk-usb2.c:1072:18: error: incompatible integer to pointer conversion initializing 'struct rtk_phy *' with an expression of type 'int' [-Wint-conversion]
    1072 |         struct rtk_phy *rtk_phy = platform_get_drvdata(pdev);
         |                         ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/phy/realtek/phy-rtk-usb2.c:1317:31: error: variable has incomplete type 'struct platform_driver'
    1317 | static struct platform_driver rtk_usb2phy_driver = {
         |                               ^
   drivers/phy/realtek/phy-rtk-usb2.c:1317:15: note: forward declaration of 'struct platform_driver'
    1317 | static struct platform_driver rtk_usb2phy_driver = {
         |               ^
>> drivers/phy/realtek/phy-rtk-usb2.c:1326:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
    1326 | module_platform_driver(rtk_usb2phy_driver);
         | ^
         | int
>> drivers/phy/realtek/phy-rtk-usb2.c:1326:24: error: a parameter list without types is only allowed in a function definition
    1326 | module_platform_driver(rtk_usb2phy_driver);
         |                        ^
   8 errors generated.
--
>> drivers/phy/realtek/phy-rtk-usb3.c:570:28: error: incomplete definition of type 'struct platform_device'
     570 |         struct device *dev = &pdev->dev;
         |                               ~~~~^
   include/linux/usb/hcd.h:468:8: note: forward declaration of 'struct platform_device'
     468 | struct platform_device;
         |        ^
   drivers/phy/realtek/phy-rtk-usb3.c:586:24: error: incomplete definition of type 'struct platform_device'
     586 |         rtk_phy->dev                    = &pdev->dev;
         |                                            ~~~~^
   include/linux/usb/hcd.h:468:8: note: forward declaration of 'struct platform_device'
     468 | struct platform_device;
         |        ^
>> drivers/phy/realtek/phy-rtk-usb3.c:601:2: error: call to undeclared function 'platform_set_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     601 |         platform_set_drvdata(pdev, rtk_phy);
         |         ^
   drivers/phy/realtek/phy-rtk-usb3.c:601:2: note: did you mean 'regulator_set_drvdata'?
   include/linux/regulator/consumer.h:318:6: note: 'regulator_set_drvdata' declared here
     318 | void regulator_set_drvdata(struct regulator *regulator, void *data);
         |      ^
>> drivers/phy/realtek/phy-rtk-usb3.c:625:28: error: call to undeclared function 'platform_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     625 |         struct rtk_phy *rtk_phy = platform_get_drvdata(pdev);
         |                                   ^
   drivers/phy/realtek/phy-rtk-usb3.c:625:28: note: did you mean 'regulator_get_drvdata'?
   include/linux/regulator/consumer.h:317:7: note: 'regulator_get_drvdata' declared here
     317 | void *regulator_get_drvdata(struct regulator *regulator);
         |       ^
>> drivers/phy/realtek/phy-rtk-usb3.c:625:18: error: incompatible integer to pointer conversion initializing 'struct rtk_phy *' with an expression of type 'int' [-Wint-conversion]
     625 |         struct rtk_phy *rtk_phy = platform_get_drvdata(pdev);
         |                         ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/phy/realtek/phy-rtk-usb3.c:753:31: error: variable has incomplete type 'struct platform_driver'
     753 | static struct platform_driver rtk_usb3phy_driver = {
         |                               ^
   drivers/phy/realtek/phy-rtk-usb3.c:753:15: note: forward declaration of 'struct platform_driver'
     753 | static struct platform_driver rtk_usb3phy_driver = {
         |               ^
>> drivers/phy/realtek/phy-rtk-usb3.c:762:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     762 | module_platform_driver(rtk_usb3phy_driver);
         | ^
         | int
>> drivers/phy/realtek/phy-rtk-usb3.c:762:24: error: a parameter list without types is only allowed in a function definition
     762 | module_platform_driver(rtk_usb3phy_driver);
         |                        ^
   8 errors generated.


vim +1016 drivers/phy/realtek/phy-rtk-usb2.c

134e6d25f6bd060 Stanley Chang 2023-07-25  1012  
134e6d25f6bd060 Stanley Chang 2023-07-25  1013  static int rtk_usb2phy_probe(struct platform_device *pdev)
134e6d25f6bd060 Stanley Chang 2023-07-25  1014  {
134e6d25f6bd060 Stanley Chang 2023-07-25  1015  	struct rtk_phy *rtk_phy;
134e6d25f6bd060 Stanley Chang 2023-07-25 @1016  	struct device *dev = &pdev->dev;
134e6d25f6bd060 Stanley Chang 2023-07-25  1017  	struct phy *generic_phy;
134e6d25f6bd060 Stanley Chang 2023-07-25  1018  	struct phy_provider *phy_provider;
134e6d25f6bd060 Stanley Chang 2023-07-25  1019  	const struct phy_cfg *phy_cfg;
134e6d25f6bd060 Stanley Chang 2023-07-25  1020  	int ret = 0;
134e6d25f6bd060 Stanley Chang 2023-07-25  1021  
134e6d25f6bd060 Stanley Chang 2023-07-25  1022  	phy_cfg = of_device_get_match_data(dev);
134e6d25f6bd060 Stanley Chang 2023-07-25  1023  	if (!phy_cfg) {
134e6d25f6bd060 Stanley Chang 2023-07-25  1024  		dev_err(dev, "phy config are not assigned!\n");
134e6d25f6bd060 Stanley Chang 2023-07-25  1025  		return -EINVAL;
134e6d25f6bd060 Stanley Chang 2023-07-25  1026  	}
134e6d25f6bd060 Stanley Chang 2023-07-25  1027  
134e6d25f6bd060 Stanley Chang 2023-07-25  1028  	rtk_phy = devm_kzalloc(dev, sizeof(*rtk_phy), GFP_KERNEL);
134e6d25f6bd060 Stanley Chang 2023-07-25  1029  	if (!rtk_phy)
134e6d25f6bd060 Stanley Chang 2023-07-25  1030  		return -ENOMEM;
134e6d25f6bd060 Stanley Chang 2023-07-25  1031  
134e6d25f6bd060 Stanley Chang 2023-07-25  1032  	rtk_phy->dev			= &pdev->dev;
134e6d25f6bd060 Stanley Chang 2023-07-25  1033  	rtk_phy->phy.dev		= rtk_phy->dev;
134e6d25f6bd060 Stanley Chang 2023-07-25  1034  	rtk_phy->phy.label		= "rtk-usb2phy";
134e6d25f6bd060 Stanley Chang 2023-07-25  1035  	rtk_phy->phy.notify_port_status = rtk_phy_notify_port_status;
134e6d25f6bd060 Stanley Chang 2023-07-25  1036  
134e6d25f6bd060 Stanley Chang 2023-07-25  1037  	rtk_phy->phy_cfg = devm_kzalloc(dev, sizeof(*phy_cfg), GFP_KERNEL);
134e6d25f6bd060 Stanley Chang 2023-07-25  1038  
134e6d25f6bd060 Stanley Chang 2023-07-25  1039  	memcpy(rtk_phy->phy_cfg, phy_cfg, sizeof(*phy_cfg));
134e6d25f6bd060 Stanley Chang 2023-07-25  1040  
134e6d25f6bd060 Stanley Chang 2023-07-25  1041  	rtk_phy->num_phy = phy_cfg->num_phy;
134e6d25f6bd060 Stanley Chang 2023-07-25  1042  
134e6d25f6bd060 Stanley Chang 2023-07-25  1043  	ret = parse_phy_data(rtk_phy);
134e6d25f6bd060 Stanley Chang 2023-07-25  1044  	if (ret)
134e6d25f6bd060 Stanley Chang 2023-07-25  1045  		goto err;
134e6d25f6bd060 Stanley Chang 2023-07-25  1046  
134e6d25f6bd060 Stanley Chang 2023-07-25 @1047  	platform_set_drvdata(pdev, rtk_phy);
134e6d25f6bd060 Stanley Chang 2023-07-25  1048  
134e6d25f6bd060 Stanley Chang 2023-07-25  1049  	generic_phy = devm_phy_create(rtk_phy->dev, NULL, &ops);
134e6d25f6bd060 Stanley Chang 2023-07-25  1050  	if (IS_ERR(generic_phy))
134e6d25f6bd060 Stanley Chang 2023-07-25  1051  		return PTR_ERR(generic_phy);
134e6d25f6bd060 Stanley Chang 2023-07-25  1052  
134e6d25f6bd060 Stanley Chang 2023-07-25  1053  	phy_set_drvdata(generic_phy, rtk_phy);
134e6d25f6bd060 Stanley Chang 2023-07-25  1054  
134e6d25f6bd060 Stanley Chang 2023-07-25  1055  	phy_provider = devm_of_phy_provider_register(rtk_phy->dev,
134e6d25f6bd060 Stanley Chang 2023-07-25  1056  						     of_phy_simple_xlate);
134e6d25f6bd060 Stanley Chang 2023-07-25  1057  	if (IS_ERR(phy_provider))
134e6d25f6bd060 Stanley Chang 2023-07-25  1058  		return PTR_ERR(phy_provider);
134e6d25f6bd060 Stanley Chang 2023-07-25  1059  
134e6d25f6bd060 Stanley Chang 2023-07-25  1060  	ret = usb_add_phy_dev(&rtk_phy->phy);
134e6d25f6bd060 Stanley Chang 2023-07-25  1061  	if (ret)
134e6d25f6bd060 Stanley Chang 2023-07-25  1062  		goto err;
134e6d25f6bd060 Stanley Chang 2023-07-25  1063  
134e6d25f6bd060 Stanley Chang 2023-07-25  1064  	create_debug_files(rtk_phy);
134e6d25f6bd060 Stanley Chang 2023-07-25  1065  
134e6d25f6bd060 Stanley Chang 2023-07-25  1066  err:
134e6d25f6bd060 Stanley Chang 2023-07-25  1067  	return ret;
134e6d25f6bd060 Stanley Chang 2023-07-25  1068  }
134e6d25f6bd060 Stanley Chang 2023-07-25  1069  
134e6d25f6bd060 Stanley Chang 2023-07-25  1070  static void rtk_usb2phy_remove(struct platform_device *pdev)
134e6d25f6bd060 Stanley Chang 2023-07-25  1071  {
134e6d25f6bd060 Stanley Chang 2023-07-25 @1072  	struct rtk_phy *rtk_phy = platform_get_drvdata(pdev);
134e6d25f6bd060 Stanley Chang 2023-07-25  1073  
134e6d25f6bd060 Stanley Chang 2023-07-25  1074  	remove_debug_files(rtk_phy);
134e6d25f6bd060 Stanley Chang 2023-07-25  1075  
134e6d25f6bd060 Stanley Chang 2023-07-25  1076  	usb_remove_phy(&rtk_phy->phy);
134e6d25f6bd060 Stanley Chang 2023-07-25  1077  }
134e6d25f6bd060 Stanley Chang 2023-07-25  1078  

:::::: The code at line 1016 was first introduced by commit
:::::: 134e6d25f6bd06071e5aac0a7eefcea6f7713955 phy: realtek: usb: Add driver for the Realtek SoC USB 2.0 PHY

:::::: TO: Stanley Chang <stanley_chang@realtek.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
