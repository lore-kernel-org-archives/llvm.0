Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794204883;
	b=MDkAHi52d8tweAt9npIzi4lovIrBKxStD9A0af3CunyhjiPK2WjyhvNUV8IFOAAoWKcb
	 K21gYs9vfDpclcDx044RvQlokLS1gpUn9Yk/jABwKMhdrP7fbobHrUOagzCpBCwmH+Quc
	 iGtPxKwpeLrNQjQhTPmdD+1+pkdTIh9pi4cATPJjOpunMFr53CNhfUISR0Sq8qiUy3Ols
	 /7Pfr9seudflTA+dxfe6KGort4R06iPna+SioLJ/tmPKo3BSBlFc1lxDzLGuwuMAwRkQl
	 XrmzTeDXyRdcAyXRL2kwFZ+SOcViQ+idBK8AQaMCQWZDs4YR/ck4POfikpSkFO7h5zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794204883;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Yq6fm90zyBh35dPgkHdlaUry16t4AFhxwtgIpcQnqDw=;
	b=vYnpyQzWg72VyYZxg4Q+/xaXmZ7y49wfLxYg45Z0Q4Kit3IxeWOQezApa/pk9sY8ESuk
	 g1x2DpgPiYMjEMvMwy2U0zSo3CrC+OLR3nL2sEmBII3/IgghxdTgJXAlIIOxei8dfChOq
	 Q1b5FSLcvkYBTcvBG2iluCKFks4iOB17mCnzhuYFd2V4utiEO6LzeYMy5PzD/uoLHEMSz
	 HH1rVciTmNpjF8LuE6hYj83iBlEyUWDIs7pxww5zW+BFRSvJJsEdjcgMMFAKy1wDY2OWD
	 ggKJ7vvFWt0zK0MlZ8xSRD28yavh8tQZxw471QUgJ+6zYjx+JeaPDr8+4vKObaGnnQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VmFf7zdD;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AB2606A31C;
	Mon,  9 Nov 2026 06:14:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86AB2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VmFf7zdD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794204881; x=1825740881;
  h=date:from:to:cc:subject:message-id;
  bh=RUxPa83DhGOa8uX5NTt/M+3+a5MHotjjwt3ZLAiPkFk=;
  b=VmFf7zdDKNdk93inVhbihS6A/QvUOvXBJMyVhFn5l0CZRi372Mizl4hM
   5MNuKx8He/KpvKgi6zVCQ1yPbJWT9tc+BxeDsJZHzSF2O+H89zN72F2QH
   V75b7V9tfroFw3Y7wGIYmlWfbQT9u79hhhMngU5hMY1fqeebevtbX6uWv
   hae66uikGzJRhrl3d2SAl3f65Qsoo1R7lPgjs8GylZedErwpImbA1aMGV
   YQppgPoH94QR1vpy5lXkSPZojgGgBEf6WDbEJPc4Ths+Q8V9vL/gJFvlo
   3EXNllbL6mhAKAGbBOgwlQwL/QpY4kgftg/CvV8I5wHs5ogUoe1j1+l4t
   g==;
X-CSE-ConnectionGUID: r+BBNlWmRbui2WzFey1Ihg==
X-CSE-MsgGUID: s+sMUVNfTYygb58mVHTRNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="3012773"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="3012773"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 22:14:39 -0800
X-CSE-ConnectionGUID: +/AzPuqyRzGQn1dEAJn+1w==
X-CSE-MsgGUID: ku7s7HgsTX2hv9e8UzXvWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="7671890"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 08 Nov 2026 22:14:37 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQIeI-00000000u0l-0esk;
	Mon, 09 Nov 2026 06:14:34 +0000
Date: Mon, 09 Nov 2026 14:13:46 +0800
From: kernel test robot <lkp@intel.com>
To: Zhipeng Wang <zhipeng.wang_1@nxp.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, x86@kernel.org,
 Thomas Gleixner <tglx@kernel.org>, Frank Li <Frank.Li@nxp.com>
Subject: [tip:irq/drivers 7/11]
 drivers/irqchip/irq-imx-irqsteer.c:269:1: warning: unused label 'out'
Message-ID: <202611091438.4MIapT02-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/drivers
head:   0c0da722d7839e5250999416404d4a4055afb300
commit: 54ac29cd11115edd9f72f17aa4551658735f919d [7/11] irqchip/imx-irqsteer: Let devres own the clock
config: arm-defconfig (https://download.01.org/0day-ci/archive/20261109/202611091438.4MIapT02-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project fc9576e3b179738d99c5babe5cd9d6c1f883e0db)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261109/202611091438.4MIapT02-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611091438.4MIapT02-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/irqchip/irq-imx-irqsteer.c:269:1: warning: unused label 'out' [-Wunused-label]
     269 | out:
         | ^~~~
   1 warning generated.


vim +/out +269 drivers/irqchip/irq-imx-irqsteer.c

0136afa08967f6e Lucas Stach           2018-12-17  178  
0136afa08967f6e Lucas Stach           2018-12-17  179  static int imx_irqsteer_probe(struct platform_device *pdev)
0136afa08967f6e Lucas Stach           2018-12-17  180  {
0136afa08967f6e Lucas Stach           2018-12-17  181  	struct device_node *np = pdev->dev.of_node;
0136afa08967f6e Lucas Stach           2018-12-17  182  	struct irqsteer_data *data;
28528fca4908142 Aisheng Dong          2019-02-20  183  	u32 irqs_num;
28528fca4908142 Aisheng Dong          2019-02-20  184  	int i, ret;
0136afa08967f6e Lucas Stach           2018-12-17  185  
0136afa08967f6e Lucas Stach           2018-12-17  186  	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
0136afa08967f6e Lucas Stach           2018-12-17  187  	if (!data)
0136afa08967f6e Lucas Stach           2018-12-17  188  		return -ENOMEM;
0136afa08967f6e Lucas Stach           2018-12-17  189  
33b1c47d1fc0b5f Shenwei Wang          2024-07-03  190  	data->dev = &pdev->dev;
358b9d248a026d7 Anson Huang           2019-04-01  191  	data->regs = devm_platform_ioremap_resource(pdev, 0);
0136afa08967f6e Lucas Stach           2018-12-17  192  	if (IS_ERR(data->regs)) {
0136afa08967f6e Lucas Stach           2018-12-17  193  		dev_err(&pdev->dev, "failed to initialize reg\n");
0136afa08967f6e Lucas Stach           2018-12-17  194  		return PTR_ERR(data->regs);
0136afa08967f6e Lucas Stach           2018-12-17  195  	}
0136afa08967f6e Lucas Stach           2018-12-17  196  
54ac29cd11115ed Zhipeng Wang          2026-11-04  197  	data->ipg_clk = devm_clk_get_enabled(&pdev->dev, "ipg");
e0c45b107fc94c5 Anson Huang           2020-08-11  198  	if (IS_ERR(data->ipg_clk))
e0c45b107fc94c5 Anson Huang           2020-08-11  199  		return dev_err_probe(&pdev->dev, PTR_ERR(data->ipg_clk),
e0c45b107fc94c5 Anson Huang           2020-08-11  200  				     "failed to get ipg clk\n");
0136afa08967f6e Lucas Stach           2018-12-17  201  
0136afa08967f6e Lucas Stach           2018-12-17  202  	raw_spin_lock_init(&data->lock);
0136afa08967f6e Lucas Stach           2018-12-17  203  
7d3a5eb78e3614b Arnd Bergmann         2019-03-04  204  	ret = of_property_read_u32(np, "fsl,num-irqs", &irqs_num);
7d3a5eb78e3614b Arnd Bergmann         2019-03-04  205  	if (ret)
7d3a5eb78e3614b Arnd Bergmann         2019-03-04  206  		return ret;
7d3a5eb78e3614b Arnd Bergmann         2019-03-04  207  	ret = of_property_read_u32(np, "fsl,channel", &data->channel);
7d3a5eb78e3614b Arnd Bergmann         2019-03-04  208  	if (ret)
7d3a5eb78e3614b Arnd Bergmann         2019-03-04  209  		return ret;
0136afa08967f6e Lucas Stach           2018-12-17  210  
5e72917802dd65a Ciprian Marian Costea 2026-03-11  211  	data->devtype_data = device_get_match_data(&pdev->dev);
5e72917802dd65a Ciprian Marian Costea 2026-03-11  212  	if (!data->devtype_data)
5e72917802dd65a Ciprian Marian Costea 2026-03-11  213  		return dev_err_probe(&pdev->dev, -ENODEV, "failed to match device data\n");
5e72917802dd65a Ciprian Marian Costea 2026-03-11  214  
28528fca4908142 Aisheng Dong          2019-02-20  215  	/*
28528fca4908142 Aisheng Dong          2019-02-20  216  	 * There is one output irq for each group of 64 inputs.
28528fca4908142 Aisheng Dong          2019-02-20  217  	 * One register bit map can represent 32 input interrupts.
28528fca4908142 Aisheng Dong          2019-02-20  218  	 */
28528fca4908142 Aisheng Dong          2019-02-20  219  	data->irq_count = DIV_ROUND_UP(irqs_num, 64);
28528fca4908142 Aisheng Dong          2019-02-20  220  	data->reg_num = irqs_num / 32;
f99f3c4acaff0df Fabio Estevam         2026-11-04  221  	if (!data->irq_count || data->irq_count > CHAN_MAX_OUTPUT_INT)
f99f3c4acaff0df Fabio Estevam         2026-11-04  222  		return -EINVAL;
deb904e45b4e325 Aisheng Dong          2019-02-20  223  
4730d2233311d86 Lucas Stach           2022-04-06  224  	if (IS_ENABLED(CONFIG_PM)) {
0136afa08967f6e Lucas Stach           2018-12-17  225  		data->saved_reg = devm_kzalloc(&pdev->dev,
deb904e45b4e325 Aisheng Dong          2019-02-20  226  					sizeof(u32) * data->reg_num,
0136afa08967f6e Lucas Stach           2018-12-17  227  					GFP_KERNEL);
0136afa08967f6e Lucas Stach           2018-12-17  228  		if (!data->saved_reg)
0136afa08967f6e Lucas Stach           2018-12-17  229  			return -ENOMEM;
0136afa08967f6e Lucas Stach           2018-12-17  230  	}
0136afa08967f6e Lucas Stach           2018-12-17  231  
0136afa08967f6e Lucas Stach           2018-12-17  232  	/* steer all IRQs into configured channel */
5e72917802dd65a Ciprian Marian Costea 2026-03-11  233  	if (irqsteer_has_chanctrl(data->devtype_data))
0136afa08967f6e Lucas Stach           2018-12-17  234  		writel_relaxed(BIT(data->channel), data->regs + CHANCTRL);
0136afa08967f6e Lucas Stach           2018-12-17  235  
f98835ded6dcbb9 Zhipeng Wang          2026-11-04  236  	/*
f98835ded6dcbb9 Zhipeng Wang          2026-11-04  237  	 * Mask all interrupts before wiring up the chained handlers. CHANMASK
f98835ded6dcbb9 Zhipeng Wang          2026-11-04  238  	 * has inverted polarity (a set bit enables the interrupt), so writing
f98835ded6dcbb9 Zhipeng Wang          2026-11-04  239  	 * zero masks the source.
f98835ded6dcbb9 Zhipeng Wang          2026-11-04  240  	 */
f98835ded6dcbb9 Zhipeng Wang          2026-11-04  241  	for (i = 0; i < data->reg_num; i++)
f98835ded6dcbb9 Zhipeng Wang          2026-11-04  242  		writel_relaxed(0, data->regs + CHANMASK(i, data->reg_num));
f98835ded6dcbb9 Zhipeng Wang          2026-11-04  243  
95cb660c28dcecf Zhipeng Wang          2026-11-04  244  	platform_set_drvdata(pdev, data);
95cb660c28dcecf Zhipeng Wang          2026-11-04  245  
95cb660c28dcecf Zhipeng Wang          2026-11-04  246  	ret = devm_pm_runtime_set_active_enabled(&pdev->dev);
95cb660c28dcecf Zhipeng Wang          2026-11-04  247  	if (ret)
54ac29cd11115ed Zhipeng Wang          2026-11-04  248  		return ret;
95cb660c28dcecf Zhipeng Wang          2026-11-04  249  
93174c05dd2e9b0 Jiri Slaby (SUSE      2025-06-11  250) 	data->domain = irq_domain_create_linear(dev_fwnode(&pdev->dev), data->reg_num * 32,
0136afa08967f6e Lucas Stach           2018-12-17  251  						&imx_irqsteer_domain_ops, data);
0136afa08967f6e Lucas Stach           2018-12-17  252  	if (!data->domain) {
0136afa08967f6e Lucas Stach           2018-12-17  253  		dev_err(&pdev->dev, "failed to create IRQ domain\n");
54ac29cd11115ed Zhipeng Wang          2026-11-04  254  		return -ENOMEM;
0136afa08967f6e Lucas Stach           2018-12-17  255  	}
4730d2233311d86 Lucas Stach           2022-04-06  256  	irq_domain_set_pm_device(data->domain, &pdev->dev);
0136afa08967f6e Lucas Stach           2018-12-17  257  
28528fca4908142 Aisheng Dong          2019-02-20  258  	for (i = 0; i < data->irq_count; i++) {
28528fca4908142 Aisheng Dong          2019-02-20  259  		data->irq[i] = irq_of_parse_and_map(np, i);
7db5fd6b751fbca Shengjiu Wang         2025-03-05  260  		if (!data->irq[i])
7db5fd6b751fbca Shengjiu Wang         2025-03-05  261  			break;
28528fca4908142 Aisheng Dong          2019-02-20  262  
28528fca4908142 Aisheng Dong          2019-02-20  263  		irq_set_chained_handler_and_data(data->irq[i],
28528fca4908142 Aisheng Dong          2019-02-20  264  						 imx_irqsteer_irq_handler,
0136afa08967f6e Lucas Stach           2018-12-17  265  						 data);
28528fca4908142 Aisheng Dong          2019-02-20  266  	}
0136afa08967f6e Lucas Stach           2018-12-17  267  
0136afa08967f6e Lucas Stach           2018-12-17  268  	return 0;
28528fca4908142 Aisheng Dong          2019-02-20 @269  out:
28528fca4908142 Aisheng Dong          2019-02-20  270  	clk_disable_unprepare(data->ipg_clk);
28528fca4908142 Aisheng Dong          2019-02-20  271  	return ret;
0136afa08967f6e Lucas Stach           2018-12-17  272  }
0136afa08967f6e Lucas Stach           2018-12-17  273  

:::::: The code at line 269 was first introduced by commit
:::::: 28528fca4908142bd1a3247956cba56c9c667d71 irqchip/imx-irqsteer: Add multi output interrupts support

:::::: TO: Aisheng Dong <aisheng.dong@nxp.com>
:::::: CC: Marc Zyngier <marc.zyngier@arm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
