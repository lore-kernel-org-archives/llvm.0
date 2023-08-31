Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39AB257D;
	Thu, 31 Aug 2023 14:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693493096; x=1725029096;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y3b2+mOa4cBTEe21dDDp8uT5ILKyG+3QLV1QxLBMWYw=;
  b=LaneJtHzluGkcn84PoMzenJvcQBFW8nFDnyk2SEMOY2xK00tEMV8Rkfq
   xZ2E/0mHyjjlwf73q+s33lBOB2744/6nlQkGWMwkc/U2/fYhsqZXeO+Gx
   WL5QRQSMzLoGJ0LQYVJHN7azwGVlZs7DZQo5pPDJTYtsoXo8bl+TYWPwX
   BFGFzRfazGJoTf+wZb8+uJMTp71cLlqdeN/GRGu2OYJY4GoxbU0wpEgoF
   8uw8v+9Iw9m00PCsNxymxXY7qEY4CrQYyr+Vn0h2awvJxn0Yja5ewxrWk
   XdHozpaw1RGkRfeyYI+D1x6JKETbIFVPYZjHI/yQEgi++Khy3CAbVovNK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="442357771"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="442357771"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 07:44:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="1070339313"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="1070339313"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 31 Aug 2023 07:44:53 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbiuh-0000Fk-0M;
	Thu, 31 Aug 2023 14:44:51 +0000
Date: Thu, 31 Aug 2023 22:44:13 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 7/7] drivers/soc/apple/mailbox.c:304:33: error:
 incomplete definition of type 'struct platform_device'
Message-ID: <202308312219.5Bwuz49E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   2f859c7b504dbff5d4770187e5416610db4625e3
commit: 2f859c7b504dbff5d4770187e5416610db4625e3 [7/7] of: header cleanups
config: arm64-randconfig-r026-20230831 (https://download.01.org/0day-ci/archive/20230831/202308312219.5Bwuz49E-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308312219.5Bwuz49E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308312219.5Bwuz49E-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/apple/mailbox.c:300:9: error: call to undeclared function 'platform_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           mbox = platform_get_drvdata(pdev);
                  ^
>> drivers/soc/apple/mailbox.c:300:7: error: incompatible integer to pointer conversion assigning to 'struct apple_mbox *' from 'int' [-Wint-conversion]
           mbox = platform_get_drvdata(pdev);
                ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/soc/apple/mailbox.c:304:33: error: incomplete definition of type 'struct platform_device'
           if (!device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_CONSUMER))
                                      ~~~~^
   include/linux/of_platform.h:12:8: note: forward declaration of 'struct platform_device'
   struct platform_device;
          ^
   drivers/soc/apple/mailbox.c:328:28: error: incomplete definition of type 'struct platform_device'
           struct device *dev = &pdev->dev;
                                 ~~~~^
   include/linux/of_platform.h:12:8: note: forward declaration of 'struct platform_device'
   struct platform_device;
          ^
   drivers/soc/apple/mailbox.c:334:19: error: incomplete definition of type 'struct platform_device'
           mbox->dev = &pdev->dev;
                        ~~~~^
   include/linux/of_platform.h:12:8: note: forward declaration of 'struct platform_device'
   struct platform_device;
          ^
>> drivers/soc/apple/mailbox.c:339:15: error: call to undeclared function 'devm_platform_ioremap_resource'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           mbox->regs = devm_platform_ioremap_resource(pdev, 0);
                        ^
   drivers/soc/apple/mailbox.c:339:15: note: did you mean 'devm_ioremap_resource'?
   include/linux/device.h:353:15: note: 'devm_ioremap_resource' declared here
   void __iomem *devm_ioremap_resource(struct device *dev,
                 ^
>> drivers/soc/apple/mailbox.c:339:13: error: incompatible integer to pointer conversion assigning to 'void *' from 'int' [-Wint-conversion]
           mbox->regs = devm_platform_ioremap_resource(pdev, 0);
                      ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/soc/apple/mailbox.c:344:3: error: call to undeclared function 'platform_get_irq_byname'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   platform_get_irq_byname(pdev, "recv-not-empty");
                   ^
>> drivers/soc/apple/mailbox.c:380:2: error: call to undeclared function 'platform_set_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           platform_set_drvdata(pdev, mbox);
           ^
>> drivers/soc/apple/mailbox.c:425:31: error: variable has incomplete type 'struct platform_driver'
   static struct platform_driver apple_mbox_driver = {
                                 ^
   drivers/soc/apple/mailbox.c:425:15: note: forward declaration of 'struct platform_driver'
   static struct platform_driver apple_mbox_driver = {
                 ^
>> drivers/soc/apple/mailbox.c:432:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
   module_platform_driver(apple_mbox_driver);
   ^
   int
>> drivers/soc/apple/mailbox.c:432:24: error: a parameter list without types is only allowed in a function definition
   module_platform_driver(apple_mbox_driver);
                          ^
   12 errors generated.
--
>> drivers/watchdog/marvell_gti_wdt.c:265:15: error: call to undeclared function 'of_device_get_match_data'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           priv->data = of_device_get_match_data(dev);
                        ^
>> drivers/watchdog/marvell_gti_wdt.c:265:13: error: incompatible integer to pointer conversion assigning to 'const struct gti_match_data *' from 'int' [-Wint-conversion]
           priv->data = of_device_get_match_data(dev);
                      ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/watchdog/marvell_gti_wdt.c:270:8: error: call to undeclared function 'of_property_read_u32'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           err = of_property_read_u32(dev->of_node, "marvell,wdt-timer-index",
                 ^
   3 errors generated.


vim +304 drivers/soc/apple/mailbox.c

6fca0adc61cf25 Hector Martin 2023-03-14  281  
6fca0adc61cf25 Hector Martin 2023-03-14  282  struct apple_mbox *apple_mbox_get(struct device *dev, int index)
6fca0adc61cf25 Hector Martin 2023-03-14  283  {
6fca0adc61cf25 Hector Martin 2023-03-14  284  	struct of_phandle_args args;
6fca0adc61cf25 Hector Martin 2023-03-14  285  	struct platform_device *pdev;
6fca0adc61cf25 Hector Martin 2023-03-14  286  	struct apple_mbox *mbox;
6fca0adc61cf25 Hector Martin 2023-03-14  287  	int ret;
6fca0adc61cf25 Hector Martin 2023-03-14  288  
6fca0adc61cf25 Hector Martin 2023-03-14  289  	ret = of_parse_phandle_with_args(dev->of_node, "mboxes", "#mbox-cells",
6fca0adc61cf25 Hector Martin 2023-03-14  290  					 index, &args);
6fca0adc61cf25 Hector Martin 2023-03-14  291  	if (ret || !args.np)
6fca0adc61cf25 Hector Martin 2023-03-14  292  		return ERR_PTR(ret);
6fca0adc61cf25 Hector Martin 2023-03-14  293  
6fca0adc61cf25 Hector Martin 2023-03-14  294  	pdev = of_find_device_by_node(args.np);
6fca0adc61cf25 Hector Martin 2023-03-14  295  	of_node_put(args.np);
6fca0adc61cf25 Hector Martin 2023-03-14  296  
6fca0adc61cf25 Hector Martin 2023-03-14  297  	if (!pdev)
6fca0adc61cf25 Hector Martin 2023-03-14  298  		return ERR_PTR(EPROBE_DEFER);
6fca0adc61cf25 Hector Martin 2023-03-14  299  
6fca0adc61cf25 Hector Martin 2023-03-14 @300  	mbox = platform_get_drvdata(pdev);
6fca0adc61cf25 Hector Martin 2023-03-14  301  	if (!mbox)
6fca0adc61cf25 Hector Martin 2023-03-14  302  		return ERR_PTR(EPROBE_DEFER);
6fca0adc61cf25 Hector Martin 2023-03-14  303  
6fca0adc61cf25 Hector Martin 2023-03-14 @304  	if (!device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_CONSUMER))
6fca0adc61cf25 Hector Martin 2023-03-14  305  		return ERR_PTR(ENODEV);
6fca0adc61cf25 Hector Martin 2023-03-14  306  
6fca0adc61cf25 Hector Martin 2023-03-14  307  	return mbox;
6fca0adc61cf25 Hector Martin 2023-03-14  308  }
6fca0adc61cf25 Hector Martin 2023-03-14  309  EXPORT_SYMBOL(apple_mbox_get);
6fca0adc61cf25 Hector Martin 2023-03-14  310  
6fca0adc61cf25 Hector Martin 2023-03-14  311  struct apple_mbox *apple_mbox_get_byname(struct device *dev, const char *name)
6fca0adc61cf25 Hector Martin 2023-03-14  312  {
6fca0adc61cf25 Hector Martin 2023-03-14  313  	int index;
6fca0adc61cf25 Hector Martin 2023-03-14  314  
6fca0adc61cf25 Hector Martin 2023-03-14  315  	index = of_property_match_string(dev->of_node, "mbox-names", name);
6fca0adc61cf25 Hector Martin 2023-03-14  316  	if (index < 0)
6fca0adc61cf25 Hector Martin 2023-03-14  317  		return ERR_PTR(index);
6fca0adc61cf25 Hector Martin 2023-03-14  318  
6fca0adc61cf25 Hector Martin 2023-03-14  319  	return apple_mbox_get(dev, index);
6fca0adc61cf25 Hector Martin 2023-03-14  320  }
6fca0adc61cf25 Hector Martin 2023-03-14  321  EXPORT_SYMBOL(apple_mbox_get_byname);
6fca0adc61cf25 Hector Martin 2023-03-14  322  
6fca0adc61cf25 Hector Martin 2023-03-14  323  static int apple_mbox_probe(struct platform_device *pdev)
6fca0adc61cf25 Hector Martin 2023-03-14  324  {
6fca0adc61cf25 Hector Martin 2023-03-14  325  	int ret;
6fca0adc61cf25 Hector Martin 2023-03-14  326  	char *irqname;
6fca0adc61cf25 Hector Martin 2023-03-14  327  	struct apple_mbox *mbox;
6fca0adc61cf25 Hector Martin 2023-03-14  328  	struct device *dev = &pdev->dev;
6fca0adc61cf25 Hector Martin 2023-03-14  329  
6fca0adc61cf25 Hector Martin 2023-03-14  330  	mbox = devm_kzalloc(dev, sizeof(*mbox), GFP_KERNEL);
6fca0adc61cf25 Hector Martin 2023-03-14  331  	if (!mbox)
6fca0adc61cf25 Hector Martin 2023-03-14  332  		return -ENOMEM;
6fca0adc61cf25 Hector Martin 2023-03-14  333  
6fca0adc61cf25 Hector Martin 2023-03-14 @334  	mbox->dev = &pdev->dev;
6fca0adc61cf25 Hector Martin 2023-03-14  335  	mbox->hw = of_device_get_match_data(dev);
6fca0adc61cf25 Hector Martin 2023-03-14  336  	if (!mbox->hw)
6fca0adc61cf25 Hector Martin 2023-03-14  337  		return -EINVAL;
6fca0adc61cf25 Hector Martin 2023-03-14  338  
6fca0adc61cf25 Hector Martin 2023-03-14 @339  	mbox->regs = devm_platform_ioremap_resource(pdev, 0);
6fca0adc61cf25 Hector Martin 2023-03-14  340  	if (IS_ERR(mbox->regs))
6fca0adc61cf25 Hector Martin 2023-03-14  341  		return PTR_ERR(mbox->regs);
6fca0adc61cf25 Hector Martin 2023-03-14  342  
6fca0adc61cf25 Hector Martin 2023-03-14  343  	mbox->irq_recv_not_empty =
6fca0adc61cf25 Hector Martin 2023-03-14 @344  		platform_get_irq_byname(pdev, "recv-not-empty");
6fca0adc61cf25 Hector Martin 2023-03-14  345  	if (mbox->irq_recv_not_empty < 0)
6fca0adc61cf25 Hector Martin 2023-03-14  346  		return -ENODEV;
6fca0adc61cf25 Hector Martin 2023-03-14  347  
6fca0adc61cf25 Hector Martin 2023-03-14  348  	mbox->irq_send_empty = platform_get_irq_byname(pdev, "send-empty");
6fca0adc61cf25 Hector Martin 2023-03-14  349  	if (mbox->irq_send_empty < 0)
6fca0adc61cf25 Hector Martin 2023-03-14  350  		return -ENODEV;
6fca0adc61cf25 Hector Martin 2023-03-14  351  
6fca0adc61cf25 Hector Martin 2023-03-14  352  	spin_lock_init(&mbox->rx_lock);
6fca0adc61cf25 Hector Martin 2023-03-14  353  	spin_lock_init(&mbox->tx_lock);
6fca0adc61cf25 Hector Martin 2023-03-14  354  	init_completion(&mbox->tx_empty);
6fca0adc61cf25 Hector Martin 2023-03-14  355  
6fca0adc61cf25 Hector Martin 2023-03-14  356  	irqname = devm_kasprintf(dev, GFP_KERNEL, "%s-recv", dev_name(dev));
6fca0adc61cf25 Hector Martin 2023-03-14  357  	if (!irqname)
6fca0adc61cf25 Hector Martin 2023-03-14  358  		return -ENOMEM;
6fca0adc61cf25 Hector Martin 2023-03-14  359  
6fca0adc61cf25 Hector Martin 2023-03-14  360  	ret = devm_request_irq(dev, mbox->irq_recv_not_empty,
6fca0adc61cf25 Hector Martin 2023-03-14  361  			       apple_mbox_recv_irq,
6fca0adc61cf25 Hector Martin 2023-03-14  362  			       IRQF_NO_AUTOEN | IRQF_NO_SUSPEND, irqname, mbox);
6fca0adc61cf25 Hector Martin 2023-03-14  363  	if (ret)
6fca0adc61cf25 Hector Martin 2023-03-14  364  		return ret;
6fca0adc61cf25 Hector Martin 2023-03-14  365  
6fca0adc61cf25 Hector Martin 2023-03-14  366  	irqname = devm_kasprintf(dev, GFP_KERNEL, "%s-send", dev_name(dev));
6fca0adc61cf25 Hector Martin 2023-03-14  367  	if (!irqname)
6fca0adc61cf25 Hector Martin 2023-03-14  368  		return -ENOMEM;
6fca0adc61cf25 Hector Martin 2023-03-14  369  
6fca0adc61cf25 Hector Martin 2023-03-14  370  	ret = devm_request_irq(dev, mbox->irq_send_empty,
6fca0adc61cf25 Hector Martin 2023-03-14  371  			       apple_mbox_send_empty_irq,
6fca0adc61cf25 Hector Martin 2023-03-14  372  			       IRQF_NO_AUTOEN | IRQF_NO_SUSPEND, irqname, mbox);
6fca0adc61cf25 Hector Martin 2023-03-14  373  	if (ret)
6fca0adc61cf25 Hector Martin 2023-03-14  374  		return ret;
6fca0adc61cf25 Hector Martin 2023-03-14  375  
6fca0adc61cf25 Hector Martin 2023-03-14  376  	ret = devm_pm_runtime_enable(dev);
6fca0adc61cf25 Hector Martin 2023-03-14  377  	if (ret)
6fca0adc61cf25 Hector Martin 2023-03-14  378  		return ret;
6fca0adc61cf25 Hector Martin 2023-03-14  379  
6fca0adc61cf25 Hector Martin 2023-03-14 @380  	platform_set_drvdata(pdev, mbox);
6fca0adc61cf25 Hector Martin 2023-03-14  381  	return 0;
6fca0adc61cf25 Hector Martin 2023-03-14  382  }
6fca0adc61cf25 Hector Martin 2023-03-14  383  
6fca0adc61cf25 Hector Martin 2023-03-14  384  static const struct apple_mbox_hw apple_mbox_asc_hw = {
6fca0adc61cf25 Hector Martin 2023-03-14  385  	.control_full = APPLE_ASC_MBOX_CONTROL_FULL,
6fca0adc61cf25 Hector Martin 2023-03-14  386  	.control_empty = APPLE_ASC_MBOX_CONTROL_EMPTY,
6fca0adc61cf25 Hector Martin 2023-03-14  387  
6fca0adc61cf25 Hector Martin 2023-03-14  388  	.a2i_control = APPLE_ASC_MBOX_A2I_CONTROL,
6fca0adc61cf25 Hector Martin 2023-03-14  389  	.a2i_send0 = APPLE_ASC_MBOX_A2I_SEND0,
6fca0adc61cf25 Hector Martin 2023-03-14  390  	.a2i_send1 = APPLE_ASC_MBOX_A2I_SEND1,
6fca0adc61cf25 Hector Martin 2023-03-14  391  
6fca0adc61cf25 Hector Martin 2023-03-14  392  	.i2a_control = APPLE_ASC_MBOX_I2A_CONTROL,
6fca0adc61cf25 Hector Martin 2023-03-14  393  	.i2a_recv0 = APPLE_ASC_MBOX_I2A_RECV0,
6fca0adc61cf25 Hector Martin 2023-03-14  394  	.i2a_recv1 = APPLE_ASC_MBOX_I2A_RECV1,
6fca0adc61cf25 Hector Martin 2023-03-14  395  
6fca0adc61cf25 Hector Martin 2023-03-14  396  	.has_irq_controls = false,
6fca0adc61cf25 Hector Martin 2023-03-14  397  };
6fca0adc61cf25 Hector Martin 2023-03-14  398  
6fca0adc61cf25 Hector Martin 2023-03-14  399  static const struct apple_mbox_hw apple_mbox_m3_hw = {
6fca0adc61cf25 Hector Martin 2023-03-14  400  	.control_full = APPLE_M3_MBOX_CONTROL_FULL,
6fca0adc61cf25 Hector Martin 2023-03-14  401  	.control_empty = APPLE_M3_MBOX_CONTROL_EMPTY,
6fca0adc61cf25 Hector Martin 2023-03-14  402  
6fca0adc61cf25 Hector Martin 2023-03-14  403  	.a2i_control = APPLE_M3_MBOX_A2I_CONTROL,
6fca0adc61cf25 Hector Martin 2023-03-14  404  	.a2i_send0 = APPLE_M3_MBOX_A2I_SEND0,
6fca0adc61cf25 Hector Martin 2023-03-14  405  	.a2i_send1 = APPLE_M3_MBOX_A2I_SEND1,
6fca0adc61cf25 Hector Martin 2023-03-14  406  
6fca0adc61cf25 Hector Martin 2023-03-14  407  	.i2a_control = APPLE_M3_MBOX_I2A_CONTROL,
6fca0adc61cf25 Hector Martin 2023-03-14  408  	.i2a_recv0 = APPLE_M3_MBOX_I2A_RECV0,
6fca0adc61cf25 Hector Martin 2023-03-14  409  	.i2a_recv1 = APPLE_M3_MBOX_I2A_RECV1,
6fca0adc61cf25 Hector Martin 2023-03-14  410  
6fca0adc61cf25 Hector Martin 2023-03-14  411  	.has_irq_controls = true,
6fca0adc61cf25 Hector Martin 2023-03-14  412  	.irq_enable = APPLE_M3_MBOX_IRQ_ENABLE,
6fca0adc61cf25 Hector Martin 2023-03-14  413  	.irq_ack = APPLE_M3_MBOX_IRQ_ACK,
6fca0adc61cf25 Hector Martin 2023-03-14  414  	.irq_bit_recv_not_empty = APPLE_M3_MBOX_IRQ_I2A_NOT_EMPTY,
6fca0adc61cf25 Hector Martin 2023-03-14  415  	.irq_bit_send_empty = APPLE_M3_MBOX_IRQ_A2I_EMPTY,
6fca0adc61cf25 Hector Martin 2023-03-14  416  };
6fca0adc61cf25 Hector Martin 2023-03-14  417  
6fca0adc61cf25 Hector Martin 2023-03-14  418  static const struct of_device_id apple_mbox_of_match[] = {
6fca0adc61cf25 Hector Martin 2023-03-14  419  	{ .compatible = "apple,asc-mailbox-v4", .data = &apple_mbox_asc_hw },
6fca0adc61cf25 Hector Martin 2023-03-14  420  	{ .compatible = "apple,m3-mailbox-v2", .data = &apple_mbox_m3_hw },
6fca0adc61cf25 Hector Martin 2023-03-14  421  	{}
6fca0adc61cf25 Hector Martin 2023-03-14  422  };
6fca0adc61cf25 Hector Martin 2023-03-14  423  MODULE_DEVICE_TABLE(of, apple_mbox_of_match);
6fca0adc61cf25 Hector Martin 2023-03-14  424  
6fca0adc61cf25 Hector Martin 2023-03-14 @425  static struct platform_driver apple_mbox_driver = {
6fca0adc61cf25 Hector Martin 2023-03-14  426  	.driver = {
6fca0adc61cf25 Hector Martin 2023-03-14  427  		.name = "apple-mailbox",
6fca0adc61cf25 Hector Martin 2023-03-14  428  		.of_match_table = apple_mbox_of_match,
6fca0adc61cf25 Hector Martin 2023-03-14  429  	},
6fca0adc61cf25 Hector Martin 2023-03-14  430  	.probe = apple_mbox_probe,
6fca0adc61cf25 Hector Martin 2023-03-14  431  };
6fca0adc61cf25 Hector Martin 2023-03-14 @432  module_platform_driver(apple_mbox_driver);
6fca0adc61cf25 Hector Martin 2023-03-14  433  

:::::: The code at line 304 was first introduced by commit
:::::: 6fca0adc61cf25bd87d900b5e72491e854843de7 soc: apple: mailbox: Add ASC/M3 mailbox driver

:::::: TO: Hector Martin <marcan@marcan.st>
:::::: CC: Hector Martin <marcan@marcan.st>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
