Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E90E551;
	Fri, 14 Jul 2023 14:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689344800; x=1720880800;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=s+uM6m0STNQf/xL8HeSAD1siphjqcfSzv0Jn8rdDnRg=;
  b=bUX9T47fcpUSUnwuLAIEjoeOZK8wuhO/d1bLQ+qEAgNeCNcCdX8Qubhz
   1+jil2ukBdg6ISJJJ85ti3aAWl11icvP8jJRSjuYSwTTseeMjpl9H7g/s
   zjaIsX0+7u3moUZT3S/bCypxG/gut9Jc5CZksc2FKhjwekyt+qAoFVDRK
   kenbAQj9FvCSAb/x/5yvavZoxr9FpUEB5gpwRs0HgMwkwNcM9ijggjf0h
   kEimEs7PyCX5K1fu4bfxr/V+jjPcoHXhkAx4H/glend+aqDoP24ELA2r6
   XwD4svhRwzFOp6Gsldr/lmURN94Qz0+AzKaBWNpZyvRxdAzWeCnmg9T4I
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="368125224"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; 
   d="scan'208";a="368125224"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2023 07:26:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="699686748"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; 
   d="scan'208";a="699686748"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 14 Jul 2023 07:26:38 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKJki-0007VJ-2l;
	Fri, 14 Jul 2023 14:26:36 +0000
Date: Fri, 14 Jul 2023 22:26:12 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 102/102] drivers/usb/musb/da8xx.c:566:15: error:
 incompatible integer to pointer conversion assigning to 'struct
 fwnode_handle *' from 'int'
Message-ID: <202307142247.53nywzDz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   75186f928a91b0ae83e5861463a9d7fb73c3b381
commit: 12ab54b71f2e2260eb95666739f04d2a64c67e5c [102/102] WIP: Remove of.h include from headers
config: arm-davinci_all_defconfig (https://download.01.org/0day-ci/archive/20230714/202307142247.53nywzDz-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307142247.53nywzDz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307142247.53nywzDz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/usb/musb/da8xx.c:566:17: error: call to undeclared function 'of_fwnode_handle'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     566 |         pinfo.fwnode = of_fwnode_handle(np);
         |                        ^
>> drivers/usb/musb/da8xx.c:566:15: error: incompatible integer to pointer conversion assigning to 'struct fwnode_handle *' from 'int' [-Wint-conversion]
     566 |         pinfo.fwnode = of_fwnode_handle(np);
         |                      ^ ~~~~~~~~~~~~~~~~~~~~
>> drivers/usb/musb/da8xx.c:631:21: error: call to undeclared function 'of_match_ptr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     631 |                 .of_match_table = of_match_ptr(da8xx_id_table),
         |                                   ^
>> drivers/usb/musb/da8xx.c:631:21: error: incompatible integer to pointer conversion initializing 'const struct of_device_id *' with an expression of type 'int' [-Wint-conversion]
     631 |                 .of_match_table = of_match_ptr(da8xx_id_table),
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/usb/musb/da8xx.c:631:21: error: initializer element is not a compile-time constant
     631 |                 .of_match_table = of_match_ptr(da8xx_id_table),
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   5 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PINCTRL_SINGLE
   Depends on [n]: PINCTRL [=n] && OF [=y] && HAS_IOMEM [=y]
   Selected by [y]:
   - ARCH_DAVINCI [=y] && ARCH_MULTI_V5 [=y] && CPU_LITTLE_ENDIAN [=y]


vim +566 drivers/usb/musb/da8xx.c

d6299b6efbf66c Alexandre Bailon 2017-04-16  507  
41ac7b3ab7fe1d Bill Pemberton   2012-11-19  508  static int da8xx_probe(struct platform_device *pdev)
8ceae51ed5d173 Felipe Balbi     2010-12-02  509  {
c1a7d67c190134 Jingoo Han       2013-07-30  510  	struct musb_hdrc_platform_data	*pdata = dev_get_platdata(&pdev->dev);
e6480faa1067af Felipe Balbi     2010-12-02  511  	struct da8xx_glue		*glue;
af3848757204a1 Russell King     2013-09-20  512  	struct platform_device_info	pinfo;
0349176120aa30 Felipe Balbi     2010-12-02  513  	struct clk			*clk;
35bd67b2e566e4 Petr Kulhavy     2016-11-21  514  	struct device_node		*np = pdev->dev.of_node;
d458fe9a71a147 David Lechner    2016-09-12  515  	int				ret;
0349176120aa30 Felipe Balbi     2010-12-02  516  
d458fe9a71a147 David Lechner    2016-09-12  517  	glue = devm_kzalloc(&pdev->dev, sizeof(*glue), GFP_KERNEL);
92c0c4905b651e Wolfram Sang     2016-08-25  518  	if (!glue)
d458fe9a71a147 David Lechner    2016-09-12  519  		return -ENOMEM;
e6480faa1067af Felipe Balbi     2010-12-02  520  
985583a696e0a3 David Lechner    2018-01-06  521  	clk = devm_clk_get(&pdev->dev, NULL);
0349176120aa30 Felipe Balbi     2010-12-02  522  	if (IS_ERR(clk)) {
0349176120aa30 Felipe Balbi     2010-12-02  523  		dev_err(&pdev->dev, "failed to get clock\n");
d458fe9a71a147 David Lechner    2016-09-12  524  		return PTR_ERR(clk);
0349176120aa30 Felipe Balbi     2010-12-02  525  	}
0349176120aa30 Felipe Balbi     2010-12-02  526  
947c49afe41fca David Lechner    2016-09-12  527  	glue->phy = devm_phy_get(&pdev->dev, "usb-phy");
92150ca664e957 Yang Yingliang   2022-09-27  528  	if (IS_ERR(glue->phy))
92150ca664e957 Yang Yingliang   2022-09-27  529  		return dev_err_probe(&pdev->dev, PTR_ERR(glue->phy),
92150ca664e957 Yang Yingliang   2022-09-27  530  				     "failed to get phy\n");
0349176120aa30 Felipe Balbi     2010-12-02  531  
e6480faa1067af Felipe Balbi     2010-12-02  532  	glue->dev			= &pdev->dev;
0349176120aa30 Felipe Balbi     2010-12-02  533  	glue->clk			= clk;
e6480faa1067af Felipe Balbi     2010-12-02  534  
35bd67b2e566e4 Petr Kulhavy     2016-11-21  535  	if (IS_ENABLED(CONFIG_OF) && np) {
35bd67b2e566e4 Petr Kulhavy     2016-11-21  536  		pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
35bd67b2e566e4 Petr Kulhavy     2016-11-21  537  		if (!pdata)
35bd67b2e566e4 Petr Kulhavy     2016-11-21  538  			return -ENOMEM;
35bd67b2e566e4 Petr Kulhavy     2016-11-21  539  
35bd67b2e566e4 Petr Kulhavy     2016-11-21  540  		pdata->config	= &da8xx_config;
35bd67b2e566e4 Petr Kulhavy     2016-11-21  541  		pdata->mode	= musb_get_mode(&pdev->dev);
35bd67b2e566e4 Petr Kulhavy     2016-11-21  542  		pdata->power	= get_vbus_power(&pdev->dev);
35bd67b2e566e4 Petr Kulhavy     2016-11-21  543  	}
35bd67b2e566e4 Petr Kulhavy     2016-11-21  544  
f7ec94370f417f Felipe Balbi     2010-12-02  545  	pdata->platform_ops		= &da8xx_ops;
f7ec94370f417f Felipe Balbi     2010-12-02  546  
947c49afe41fca David Lechner    2016-09-12  547  	glue->usb_phy = usb_phy_generic_register();
984f3be5910c64 Arnd Bergmann    2016-09-22  548  	ret = PTR_ERR_OR_ZERO(glue->usb_phy);
984f3be5910c64 Arnd Bergmann    2016-09-22  549  	if (ret) {
947c49afe41fca David Lechner    2016-09-12  550  		dev_err(&pdev->dev, "failed to register usb_phy\n");
984f3be5910c64 Arnd Bergmann    2016-09-22  551  		return ret;
2f36ff6915c6c0 Felipe Balbi     2014-04-16  552  	}
e6480faa1067af Felipe Balbi     2010-12-02  553  	platform_set_drvdata(pdev, glue);
8ceae51ed5d173 Felipe Balbi     2010-12-02  554  
d6299b6efbf66c Alexandre Bailon 2017-04-16  555  	ret = of_platform_populate(pdev->dev.of_node, NULL,
d6299b6efbf66c Alexandre Bailon 2017-04-16  556  				   da8xx_auxdata_lookup, &pdev->dev);
d6299b6efbf66c Alexandre Bailon 2017-04-16  557  	if (ret)
d6299b6efbf66c Alexandre Bailon 2017-04-16  558  		return ret;
d6299b6efbf66c Alexandre Bailon 2017-04-16  559  
af3848757204a1 Russell King     2013-09-20  560  	pinfo = da8xx_dev_info;
af3848757204a1 Russell King     2013-09-20  561  	pinfo.parent = &pdev->dev;
9879c81b680795 Rob Herring      2021-12-15  562  	pinfo.res = pdev->resource;
9879c81b680795 Rob Herring      2021-12-15  563  	pinfo.num_res = pdev->num_resources;
af3848757204a1 Russell King     2013-09-20  564  	pinfo.data = pdata;
af3848757204a1 Russell King     2013-09-20  565  	pinfo.size_data = sizeof(*pdata);
cf081d009c4476 Rob Herring      2021-12-15 @566  	pinfo.fwnode = of_fwnode_handle(np);
cf081d009c4476 Rob Herring      2021-12-15  567  	pinfo.of_node_reused = true;
af3848757204a1 Russell King     2013-09-20  568  
984f3be5910c64 Arnd Bergmann    2016-09-22  569  	glue->musb = platform_device_register_full(&pinfo);
984f3be5910c64 Arnd Bergmann    2016-09-22  570  	ret = PTR_ERR_OR_ZERO(glue->musb);
984f3be5910c64 Arnd Bergmann    2016-09-22  571  	if (ret) {
af3848757204a1 Russell King     2013-09-20  572  		dev_err(&pdev->dev, "failed to register musb device: %d\n", ret);
947c49afe41fca David Lechner    2016-09-12  573  		usb_phy_generic_unregister(glue->usb_phy);
8ceae51ed5d173 Felipe Balbi     2010-12-02  574  	}
8ceae51ed5d173 Felipe Balbi     2010-12-02  575  
984f3be5910c64 Arnd Bergmann    2016-09-22  576  	return ret;
8ceae51ed5d173 Felipe Balbi     2010-12-02  577  }
8ceae51ed5d173 Felipe Balbi     2010-12-02  578  
a9042796f9d006 Uwe Kleine-König 2023-04-05  579  static void da8xx_remove(struct platform_device *pdev)
8ceae51ed5d173 Felipe Balbi     2010-12-02  580  {
e6480faa1067af Felipe Balbi     2010-12-02  581  	struct da8xx_glue		*glue = platform_get_drvdata(pdev);
8ceae51ed5d173 Felipe Balbi     2010-12-02  582  
b59e906c57403d Wei Yongjun      2012-10-23  583  	platform_device_unregister(glue->musb);
947c49afe41fca David Lechner    2016-09-12  584  	usb_phy_generic_unregister(glue->usb_phy);
8ceae51ed5d173 Felipe Balbi     2010-12-02  585  }
8ceae51ed5d173 Felipe Balbi     2010-12-02  586  
71f5a0ad9e82c1 Alexandre Bailon 2017-02-01  587  #ifdef CONFIG_PM_SLEEP
71f5a0ad9e82c1 Alexandre Bailon 2017-02-01  588  static int da8xx_suspend(struct device *dev)
71f5a0ad9e82c1 Alexandre Bailon 2017-02-01  589  {
71f5a0ad9e82c1 Alexandre Bailon 2017-02-01  590  	int ret;
71f5a0ad9e82c1 Alexandre Bailon 2017-02-01  591  	struct da8xx_glue *glue = dev_get_drvdata(dev);
71f5a0ad9e82c1 Alexandre Bailon 2017-02-01  592  
71f5a0ad9e82c1 Alexandre Bailon 2017-02-01  593  	ret = phy_power_off(glue->phy);
71f5a0ad9e82c1 Alexandre Bailon 2017-02-01  594  	if (ret)
71f5a0ad9e82c1 Alexandre Bailon 2017-02-01  595  		return ret;
71f5a0ad9e82c1 Alexandre Bailon 2017-02-01  596  	clk_disable_unprepare(glue->clk);
71f5a0ad9e82c1 Alexandre Bailon 2017-02-01  597  
71f5a0ad9e82c1 Alexandre Bailon 2017-02-01  598  	return 0;
71f5a0ad9e82c1 Alexandre Bailon 2017-02-01  599  }
71f5a0ad9e82c1 Alexandre Bailon 2017-02-01  600  
71f5a0ad9e82c1 Alexandre Bailon 2017-02-01  601  static int da8xx_resume(struct device *dev)
71f5a0ad9e82c1 Alexandre Bailon 2017-02-01  602  {
71f5a0ad9e82c1 Alexandre Bailon 2017-02-01  603  	int ret;
71f5a0ad9e82c1 Alexandre Bailon 2017-02-01  604  	struct da8xx_glue *glue = dev_get_drvdata(dev);
71f5a0ad9e82c1 Alexandre Bailon 2017-02-01  605  
71f5a0ad9e82c1 Alexandre Bailon 2017-02-01  606  	ret = clk_prepare_enable(glue->clk);
71f5a0ad9e82c1 Alexandre Bailon 2017-02-01  607  	if (ret)
71f5a0ad9e82c1 Alexandre Bailon 2017-02-01  608  		return ret;
71f5a0ad9e82c1 Alexandre Bailon 2017-02-01  609  	return phy_power_on(glue->phy);
71f5a0ad9e82c1 Alexandre Bailon 2017-02-01  610  }
71f5a0ad9e82c1 Alexandre Bailon 2017-02-01  611  #endif
71f5a0ad9e82c1 Alexandre Bailon 2017-02-01  612  
71f5a0ad9e82c1 Alexandre Bailon 2017-02-01  613  static SIMPLE_DEV_PM_OPS(da8xx_pm_ops, da8xx_suspend, da8xx_resume);
71f5a0ad9e82c1 Alexandre Bailon 2017-02-01  614  
35bd67b2e566e4 Petr Kulhavy     2016-11-21  615  #ifdef CONFIG_OF
35bd67b2e566e4 Petr Kulhavy     2016-11-21  616  static const struct of_device_id da8xx_id_table[] = {
35bd67b2e566e4 Petr Kulhavy     2016-11-21  617  	{
35bd67b2e566e4 Petr Kulhavy     2016-11-21  618  		.compatible = "ti,da830-musb",
35bd67b2e566e4 Petr Kulhavy     2016-11-21  619  	},
35bd67b2e566e4 Petr Kulhavy     2016-11-21  620  	{},
35bd67b2e566e4 Petr Kulhavy     2016-11-21  621  };
35bd67b2e566e4 Petr Kulhavy     2016-11-21  622  MODULE_DEVICE_TABLE(of, da8xx_id_table);
35bd67b2e566e4 Petr Kulhavy     2016-11-21  623  #endif
35bd67b2e566e4 Petr Kulhavy     2016-11-21  624  
8ceae51ed5d173 Felipe Balbi     2010-12-02  625  static struct platform_driver da8xx_driver = {
e9e8c85e693101 Felipe Balbi     2012-01-26  626  	.probe		= da8xx_probe,
a9042796f9d006 Uwe Kleine-König 2023-04-05  627  	.remove_new	= da8xx_remove,
8ceae51ed5d173 Felipe Balbi     2010-12-02  628  	.driver		= {
8ceae51ed5d173 Felipe Balbi     2010-12-02  629  		.name	= "musb-da8xx",
71f5a0ad9e82c1 Alexandre Bailon 2017-02-01  630  		.pm = &da8xx_pm_ops,
35bd67b2e566e4 Petr Kulhavy     2016-11-21 @631  		.of_match_table = of_match_ptr(da8xx_id_table),
8ceae51ed5d173 Felipe Balbi     2010-12-02  632  	},
8ceae51ed5d173 Felipe Balbi     2010-12-02  633  };
8ceae51ed5d173 Felipe Balbi     2010-12-02  634  

:::::: The code at line 566 was first introduced by commit
:::::: cf081d009c447647c6b36aced535ca427dbebe72 usb: musb: Set the DT node on the child device

:::::: TO: Rob Herring <robh@kernel.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
