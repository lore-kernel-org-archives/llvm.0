Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212EB13B791;
	Wed,  5 Feb 2025 13:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738762733; cv=none; b=djK0S6bjXVD6L30YFq7zYXqcsN01btIKBzIc/UPGxVZtldl6g5U6FCkmE9i27M+QUfAuhWcFq73wXlSFq0o6V5UKjNqCuVRB78yk3sao/tDdc9A3JE3CW7JXDfPUgn/O3ytIeLzIJBQ7xPL87biFIZ/tjJO2MRh956+UpfgzAyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738762733; c=relaxed/simple;
	bh=Avk/u6bvKMSpOClKleWIwTslUCu5zbEHYFJ4Bh8qqgk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uHahBhfw5w7rQWW5xZwcqT+KIFTT1zq3vJk0dBmBEZ45T3xkajEYtX5A3hDlwNku8pWBEZzPpC8Ux0E8Lzb3tyykewAADc8Er/EpyK33KRdFSUegHGxecYf77Nhu83120Lzwit+WqIPAODVwWS/z6AkGaezEyzQZw1exzXh8RhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W64MS0sg; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W64MS0sg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738762731; x=1770298731;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Avk/u6bvKMSpOClKleWIwTslUCu5zbEHYFJ4Bh8qqgk=;
  b=W64MS0sgCTdefqIL2+zTJMPetKn30lju+khadw2FClzVU7ORPi6bdsZc
   HuK0cZ5kdttLfB17qR92uzoeF+PeYXL6GOKt976he07/gCGYtULiSLf7D
   /Q/PEUtZR8uEu9asoNJ6FfxwkE92chnU0YDZlpjIW7fkoPbQWk4Zln58G
   enoo+EEpRf2pDu2v9kz6DEoC9rfcE/AsxeV9vmD7L9W6HWq6i+pMXWIYC
   LE6IJljoLglCjxFGFC8iUkOyBZOTn3A0v+ZWXScZr6FASvWpz5NUzWxrs
   J0Pppd1IWiLHdGOEMk663sQulk736bCAjhH5XsL+XVl6K7qtvNgl074nD
   w==;
X-CSE-ConnectionGUID: o5Ldgw1sT/KO+H+kiY6B4g==
X-CSE-MsgGUID: HHvc39kvTNigpqv5JrzYHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="42162975"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="42162975"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 05:38:50 -0800
X-CSE-ConnectionGUID: Oz+aLeDmQ5KGO8vHSyNV/Q==
X-CSE-MsgGUID: rJ3swRokRRGCi6FLCCAIkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="111084135"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Feb 2025 05:35:41 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tffZ4-000tvD-2y;
	Wed, 05 Feb 2025 13:35:38 +0000
Date: Wed, 5 Feb 2025 21:34:59 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	devel@driverdev.osuosl.org
Subject: [driver-core:faux_bus 3/6] drivers/usb/musb/sunxi.c:764:16: error:
 incompatible pointer types assigning to 'struct platform_device *' from
 'struct faux_device *'
Message-ID: <202502052123.w24RxZ2r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git faux_bus
head:   f18e2d21ac0290209c516f14151bbb8df602b73f
commit: b9313848b0afacf2f24760d74b901f5895b13ea0 [3/6] USB: phy: convert usb_phy_generic logic to use a faux device
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250205/202502052123.w24RxZ2r-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250205/202502052123.w24RxZ2r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502052123.w24RxZ2r-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/usb/musb/sunxi.c:764:16: error: incompatible pointer types assigning to 'struct platform_device *' from 'struct faux_device *' [-Werror,-Wincompatible-pointer-types]
     764 |         glue->usb_phy = usb_phy_generic_register();
         |                       ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/usb/musb/sunxi.c:801:29: error: incompatible pointer types passing 'struct platform_device *' to parameter of type 'struct faux_device *' [-Werror,-Wincompatible-pointer-types]
     801 |         usb_phy_generic_unregister(glue->usb_phy);
         |                                    ^~~~~~~~~~~~~
   include/linux/usb/usb_phy_generic.h:11:53: note: passing argument to parameter here
      11 | void usb_phy_generic_unregister(struct faux_device *);
         |                                                     ^
   drivers/usb/musb/sunxi.c:811:29: error: incompatible pointer types passing 'struct platform_device *' to parameter of type 'struct faux_device *' [-Werror,-Wincompatible-pointer-types]
     811 |         usb_phy_generic_unregister(usb_phy);
         |                                    ^~~~~~~
   include/linux/usb/usb_phy_generic.h:11:53: note: passing argument to parameter here
      11 | void usb_phy_generic_unregister(struct faux_device *);
         |                                                     ^
   3 errors generated.


vim +764 drivers/usb/musb/sunxi.c

c1fce66ecd271d Icenowy Zheng   2017-02-01  676  
744543c599c420 Hans de Goede   2015-07-08  677  static int sunxi_musb_probe(struct platform_device *pdev)
744543c599c420 Hans de Goede   2015-07-08  678  {
744543c599c420 Hans de Goede   2015-07-08  679  	struct musb_hdrc_platform_data	pdata;
744543c599c420 Hans de Goede   2015-07-08  680  	struct platform_device_info	pinfo;
744543c599c420 Hans de Goede   2015-07-08  681  	struct sunxi_glue		*glue;
744543c599c420 Hans de Goede   2015-07-08  682  	struct device_node		*np = pdev->dev.of_node;
196774960ba176 Andre Przywara  2023-02-01  683  	const struct sunxi_musb_cfg	*cfg;
744543c599c420 Hans de Goede   2015-07-08  684  	int ret;
744543c599c420 Hans de Goede   2015-07-08  685  
744543c599c420 Hans de Goede   2015-07-08  686  	if (!np) {
744543c599c420 Hans de Goede   2015-07-08  687  		dev_err(&pdev->dev, "Error no device tree node found\n");
744543c599c420 Hans de Goede   2015-07-08  688  		return -EINVAL;
744543c599c420 Hans de Goede   2015-07-08  689  	}
744543c599c420 Hans de Goede   2015-07-08  690  
7cba17ec9adc8c Hans de Goede   2016-09-12  691  	glue = devm_kzalloc(&pdev->dev, sizeof(*glue), GFP_KERNEL);
7cba17ec9adc8c Hans de Goede   2016-09-12  692  	if (!glue)
7cba17ec9adc8c Hans de Goede   2016-09-12  693  		return -ENOMEM;
7cba17ec9adc8c Hans de Goede   2016-09-12  694  
744543c599c420 Hans de Goede   2015-07-08  695  	memset(&pdata, 0, sizeof(pdata));
06e7114f0d8297 Heikki Krogerus 2015-09-21  696  	switch (usb_get_dr_mode(&pdev->dev)) {
744543c599c420 Hans de Goede   2015-07-08  697  #if defined CONFIG_USB_MUSB_DUAL_ROLE || defined CONFIG_USB_MUSB_HOST
744543c599c420 Hans de Goede   2015-07-08  698  	case USB_DR_MODE_HOST:
7ad76955c67b70 Bin Liu         2018-05-21  699  		pdata.mode = MUSB_HOST;
7cba17ec9adc8c Hans de Goede   2016-09-12  700  		glue->phy_mode = PHY_MODE_USB_HOST;
744543c599c420 Hans de Goede   2015-07-08  701  		break;
744543c599c420 Hans de Goede   2015-07-08  702  #endif
a1ca2c6b2924a6 Hans de Goede   2016-06-30  703  #if defined CONFIG_USB_MUSB_DUAL_ROLE || defined CONFIG_USB_MUSB_GADGET
a1ca2c6b2924a6 Hans de Goede   2016-06-30  704  	case USB_DR_MODE_PERIPHERAL:
7ad76955c67b70 Bin Liu         2018-05-21  705  		pdata.mode = MUSB_PERIPHERAL;
7cba17ec9adc8c Hans de Goede   2016-09-12  706  		glue->phy_mode = PHY_MODE_USB_DEVICE;
a1ca2c6b2924a6 Hans de Goede   2016-06-30  707  		break;
a1ca2c6b2924a6 Hans de Goede   2016-06-30  708  #endif
744543c599c420 Hans de Goede   2015-07-08  709  #ifdef CONFIG_USB_MUSB_DUAL_ROLE
744543c599c420 Hans de Goede   2015-07-08  710  	case USB_DR_MODE_OTG:
7ad76955c67b70 Bin Liu         2018-05-21  711  		pdata.mode = MUSB_OTG;
7cba17ec9adc8c Hans de Goede   2016-09-12  712  		glue->phy_mode = PHY_MODE_USB_OTG;
744543c599c420 Hans de Goede   2015-07-08  713  		break;
744543c599c420 Hans de Goede   2015-07-08  714  #endif
744543c599c420 Hans de Goede   2015-07-08  715  	default:
744543c599c420 Hans de Goede   2015-07-08  716  		dev_err(&pdev->dev, "Invalid or missing 'dr_mode' property\n");
744543c599c420 Hans de Goede   2015-07-08  717  		return -EINVAL;
744543c599c420 Hans de Goede   2015-07-08  718  	}
744543c599c420 Hans de Goede   2015-07-08  719  	pdata.platform_ops	= &sunxi_musb_ops;
196774960ba176 Andre Przywara  2023-02-01  720  
196774960ba176 Andre Przywara  2023-02-01  721  	cfg = of_device_get_match_data(&pdev->dev);
196774960ba176 Andre Przywara  2023-02-01  722  	if (!cfg)
196774960ba176 Andre Przywara  2023-02-01  723  		return -EINVAL;
196774960ba176 Andre Przywara  2023-02-01  724  
196774960ba176 Andre Przywara  2023-02-01  725  	pdata.config = cfg->hdrc_config;
744543c599c420 Hans de Goede   2015-07-08  726  
744543c599c420 Hans de Goede   2015-07-08  727  	glue->dev = &pdev->dev;
744543c599c420 Hans de Goede   2015-07-08  728  	INIT_WORK(&glue->work, sunxi_musb_work);
744543c599c420 Hans de Goede   2015-07-08  729  	glue->host_nb.notifier_call = sunxi_musb_host_notifier;
744543c599c420 Hans de Goede   2015-07-08  730  
196774960ba176 Andre Przywara  2023-02-01  731  	if (cfg->has_sram)
132e23775779cc Hans de Goede   2015-07-08  732  		set_bit(SUNXI_MUSB_FL_HAS_SRAM, &glue->flags);
132e23775779cc Hans de Goede   2015-07-08  733  
196774960ba176 Andre Przywara  2023-02-01  734  	if (cfg->has_reset)
132e23775779cc Hans de Goede   2015-07-08  735  		set_bit(SUNXI_MUSB_FL_HAS_RESET, &glue->flags);
132e23775779cc Hans de Goede   2015-07-08  736  
196774960ba176 Andre Przywara  2023-02-01  737  	if (cfg->no_configdata)
d91de093d94eca Hans de Goede   2015-07-08  738  		set_bit(SUNXI_MUSB_FL_NO_CONFIGDATA, &glue->flags);
d91de093d94eca Hans de Goede   2015-07-08  739  
744543c599c420 Hans de Goede   2015-07-08  740  	glue->clk = devm_clk_get(&pdev->dev, NULL);
744543c599c420 Hans de Goede   2015-07-08  741  	if (IS_ERR(glue->clk)) {
744543c599c420 Hans de Goede   2015-07-08  742  		dev_err(&pdev->dev, "Error getting clock: %ld\n",
744543c599c420 Hans de Goede   2015-07-08  743  			PTR_ERR(glue->clk));
744543c599c420 Hans de Goede   2015-07-08  744  		return PTR_ERR(glue->clk);
744543c599c420 Hans de Goede   2015-07-08  745  	}
744543c599c420 Hans de Goede   2015-07-08  746  
132e23775779cc Hans de Goede   2015-07-08  747  	if (test_bit(SUNXI_MUSB_FL_HAS_RESET, &glue->flags)) {
132e23775779cc Hans de Goede   2015-07-08  748  		glue->rst = devm_reset_control_get(&pdev->dev, NULL);
7a8275099361e2 Yang Yingliang  2022-09-27  749  		if (IS_ERR(glue->rst))
7a8275099361e2 Yang Yingliang  2022-09-27  750  			return dev_err_probe(&pdev->dev, PTR_ERR(glue->rst),
7a8275099361e2 Yang Yingliang  2022-09-27  751  					     "Error getting reset\n");
132e23775779cc Hans de Goede   2015-07-08  752  	}
132e23775779cc Hans de Goede   2015-07-08  753  
a1ca2c6b2924a6 Hans de Goede   2016-06-30  754  	glue->extcon = extcon_get_edev_by_phandle(&pdev->dev, 0);
7a8275099361e2 Yang Yingliang  2022-09-27  755  	if (IS_ERR(glue->extcon))
7a8275099361e2 Yang Yingliang  2022-09-27  756  		return dev_err_probe(&pdev->dev, PTR_ERR(glue->extcon),
7a8275099361e2 Yang Yingliang  2022-09-27  757  				     "Invalid or missing extcon\n");
a1ca2c6b2924a6 Hans de Goede   2016-06-30  758  
744543c599c420 Hans de Goede   2015-07-08  759  	glue->phy = devm_phy_get(&pdev->dev, "usb");
7a8275099361e2 Yang Yingliang  2022-09-27  760  	if (IS_ERR(glue->phy))
7a8275099361e2 Yang Yingliang  2022-09-27  761  		return dev_err_probe(&pdev->dev, PTR_ERR(glue->phy),
7a8275099361e2 Yang Yingliang  2022-09-27  762  				     "Error getting phy\n");
744543c599c420 Hans de Goede   2015-07-08  763  
744543c599c420 Hans de Goede   2015-07-08 @764  	glue->usb_phy = usb_phy_generic_register();
744543c599c420 Hans de Goede   2015-07-08  765  	if (IS_ERR(glue->usb_phy)) {
744543c599c420 Hans de Goede   2015-07-08  766  		dev_err(&pdev->dev, "Error registering usb-phy %ld\n",
744543c599c420 Hans de Goede   2015-07-08  767  			PTR_ERR(glue->usb_phy));
744543c599c420 Hans de Goede   2015-07-08  768  		return PTR_ERR(glue->usb_phy);
744543c599c420 Hans de Goede   2015-07-08  769  	}
744543c599c420 Hans de Goede   2015-07-08  770  
744543c599c420 Hans de Goede   2015-07-08  771  	glue->xceiv = devm_usb_get_phy(&pdev->dev, USB_PHY_TYPE_USB2);
744543c599c420 Hans de Goede   2015-07-08  772  	if (IS_ERR(glue->xceiv)) {
744543c599c420 Hans de Goede   2015-07-08  773  		ret = PTR_ERR(glue->xceiv);
744543c599c420 Hans de Goede   2015-07-08  774  		dev_err(&pdev->dev, "Error getting usb-phy %d\n", ret);
744543c599c420 Hans de Goede   2015-07-08  775  		goto err_unregister_usb_phy;
744543c599c420 Hans de Goede   2015-07-08  776  	}
744543c599c420 Hans de Goede   2015-07-08  777  
744543c599c420 Hans de Goede   2015-07-08  778  	platform_set_drvdata(pdev, glue);
744543c599c420 Hans de Goede   2015-07-08  779  
744543c599c420 Hans de Goede   2015-07-08  780  	memset(&pinfo, 0, sizeof(pinfo));
744543c599c420 Hans de Goede   2015-07-08  781  	pinfo.name	 = "musb-hdrc";
744543c599c420 Hans de Goede   2015-07-08  782  	pinfo.id	= PLATFORM_DEVID_AUTO;
744543c599c420 Hans de Goede   2015-07-08  783  	pinfo.parent	= &pdev->dev;
908f6fc3a14050 Mans Rullgard   2020-01-15  784  	pinfo.fwnode	= of_fwnode_handle(pdev->dev.of_node);
908f6fc3a14050 Mans Rullgard   2020-01-15  785  	pinfo.of_node_reused = true;
744543c599c420 Hans de Goede   2015-07-08  786  	pinfo.res	= pdev->resource;
744543c599c420 Hans de Goede   2015-07-08  787  	pinfo.num_res	= pdev->num_resources;
744543c599c420 Hans de Goede   2015-07-08  788  	pinfo.data	= &pdata;
744543c599c420 Hans de Goede   2015-07-08  789  	pinfo.size_data = sizeof(pdata);
744543c599c420 Hans de Goede   2015-07-08  790  
969a132723434f Hans de Goede   2016-06-14  791  	glue->musb_pdev = platform_device_register_full(&pinfo);
969a132723434f Hans de Goede   2016-06-14  792  	if (IS_ERR(glue->musb_pdev)) {
969a132723434f Hans de Goede   2016-06-14  793  		ret = PTR_ERR(glue->musb_pdev);
744543c599c420 Hans de Goede   2015-07-08  794  		dev_err(&pdev->dev, "Error registering musb dev: %d\n", ret);
744543c599c420 Hans de Goede   2015-07-08  795  		goto err_unregister_usb_phy;
744543c599c420 Hans de Goede   2015-07-08  796  	}
744543c599c420 Hans de Goede   2015-07-08  797  
744543c599c420 Hans de Goede   2015-07-08  798  	return 0;
744543c599c420 Hans de Goede   2015-07-08  799  
744543c599c420 Hans de Goede   2015-07-08  800  err_unregister_usb_phy:
744543c599c420 Hans de Goede   2015-07-08 @801  	usb_phy_generic_unregister(glue->usb_phy);
744543c599c420 Hans de Goede   2015-07-08  802  	return ret;
744543c599c420 Hans de Goede   2015-07-08  803  }
744543c599c420 Hans de Goede   2015-07-08  804  

:::::: The code at line 764 was first introduced by commit
:::::: 744543c599c420bcddca08cd2e2713b82a008328 usb: musb: sunxi: Add support for the Allwinner sunxi musb controller

:::::: TO: Hans de Goede <hdegoede@redhat.com>
:::::: CC: Felipe Balbi <balbi@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
