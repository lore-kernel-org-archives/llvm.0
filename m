Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC18C3224;
	Sat, 18 Mar 2023 17:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679160894; x=1710696894;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=svVCHPCHrv1TJgEVathoks385vboqfPXDZNkXTPpQg4=;
  b=C+2bnRRJO8pKLbtOHLhQDH0fj+SuHSm90VIoXHiI/+ArAYTIvnct0YmC
   4KApodfU/WoiZGdtCreX22WTgbzPFyqY6yTAvlydrDbDAsEEzokzYR6cy
   myocR7Ulv+o5HijX/lIrHUsQ6uJ30jMc1YmGxJWU2Kyq1ZQhLH6Asv5q/
   0rM0xR0sMb+m8uhNBIP7GUV1j5tjgH5d/PmFA4H/I+SVe9btx+uH1YGVe
   xvyWjq9l+7nB0OsWQ83q6Rz/HYddv/CUR6IxBZC8sg15aVgDavUhvrPwA
   WWQxHyqebvhseJg4vhY1WkjVcTok8oGTBb7SebJbuzZxfoaefeSdEyRf2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="338470224"
X-IronPort-AV: E=Sophos;i="5.98,272,1673942400"; 
   d="scan'208";a="338470224"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 10:34:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="683005109"
X-IronPort-AV: E=Sophos;i="5.98,272,1673942400"; 
   d="scan'208";a="683005109"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 18 Mar 2023 10:34:50 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdaS9-000ABK-2O;
	Sat, 18 Mar 2023 17:34:49 +0000
Date: Sun, 19 Mar 2023 01:33:57 +0800
From: kernel test robot <lkp@intel.com>
To: Marian Cichy <m.cichy@pengutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: [linux-next:master 3041/4413]
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c:411:11: error: call to undeclared
 function 'devm_drm_of_get_bridge'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202303190142.TjYYpbba-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6f08c1de13a9403341c18b66638a05588b2663ce
commit: c87e859cdeb5d106cb861326e3135c606d61f88d [3041/4413] drm/imx/lcdc: Implement DRM driver for imx25
config: mips-randconfig-r001-20230319 (https://download.01.org/0day-ci/archive/20230319/202303190142.TjYYpbba-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=c87e859cdeb5d106cb861326e3135c606d61f88d
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout c87e859cdeb5d106cb861326e3135c606d61f88d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303190142.TjYYpbba-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/imx/lcdc/imx-lcdc.c:411:11: error: call to undeclared function 'devm_drm_of_get_bridge'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
                    ^
>> drivers/gpu/drm/imx/lcdc/imx-lcdc.c:411:9: error: incompatible integer to pointer conversion assigning to 'struct drm_bridge *' from 'int' [-Wint-conversion]
           bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
                  ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/imx/lcdc/imx-lcdc.c:449:8: error: call to undeclared function 'drm_bridge_attach'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           ret = drm_bridge_attach(&lcdc->pipe.encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
                 ^
>> drivers/gpu/drm/imx/lcdc/imx-lcdc.c:449:61: error: use of undeclared identifier 'DRM_BRIDGE_ATTACH_NO_CONNECTOR'
           ret = drm_bridge_attach(&lcdc->pipe.encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
                                                                      ^
   4 errors generated.


vim +/devm_drm_of_get_bridge +411 drivers/gpu/drm/imx/lcdc/imx-lcdc.c

   390	
   391	static int imx_lcdc_probe(struct platform_device *pdev)
   392	{
   393		struct imx_lcdc *lcdc;
   394		struct drm_device *drm;
   395		struct drm_bridge *bridge;
   396		int irq;
   397		int ret;
   398		struct device *dev = &pdev->dev;
   399	
   400		lcdc = devm_drm_dev_alloc(dev, &imx_lcdc_drm_driver,
   401					  struct imx_lcdc, drm);
   402		if (!lcdc)
   403			return -ENOMEM;
   404	
   405		drm = &lcdc->drm;
   406	
   407		lcdc->base = devm_platform_ioremap_resource(pdev, 0);
   408		if (IS_ERR(lcdc->base))
   409			return dev_err_probe(dev, PTR_ERR(lcdc->base), "Cannot get IO memory\n");
   410	
 > 411		bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
   412		if (IS_ERR(bridge))
   413			return dev_err_probe(dev, PTR_ERR(bridge), "Failed to find bridge\n");
   414	
   415		/* Get Clocks */
   416		lcdc->clk_ipg = devm_clk_get(dev, "ipg");
   417		if (IS_ERR(lcdc->clk_ipg))
   418			return dev_err_probe(dev, PTR_ERR(lcdc->clk_ipg), "Failed to get %s clk\n", "ipg");
   419	
   420		lcdc->clk_ahb = devm_clk_get(dev, "ahb");
   421		if (IS_ERR(lcdc->clk_ahb))
   422			return dev_err_probe(dev, PTR_ERR(lcdc->clk_ahb), "Failed to get %s clk\n", "ahb");
   423	
   424		lcdc->clk_per = devm_clk_get(dev, "per");
   425		if (IS_ERR(lcdc->clk_per))
   426			return dev_err_probe(dev, PTR_ERR(lcdc->clk_per), "Failed to get %s clk\n", "per");
   427	
   428		ret = dma_set_mask_and_coherent(drm->dev, DMA_BIT_MASK(32));
   429		if (ret)
   430			return dev_err_probe(dev, ret, "Cannot set DMA Mask\n");
   431	
   432		/* Modeset init */
   433		ret = drmm_mode_config_init(drm);
   434		if (ret)
   435			return dev_err_probe(dev, ret, "Cannot initialize mode configuration structure\n");
   436	
   437		/* CRTC, Plane, Encoder */
   438		ret = drm_simple_display_pipe_init(drm, &lcdc->pipe,
   439						   &imx_lcdc_pipe_funcs,
   440						   imx_lcdc_formats,
   441						   ARRAY_SIZE(imx_lcdc_formats), NULL, NULL);
   442		if (ret < 0)
   443			return dev_err_probe(drm->dev, ret, "Cannot setup simple display pipe\n");
   444	
   445		ret = drm_vblank_init(drm, drm->mode_config.num_crtc);
   446		if (ret < 0)
   447			return dev_err_probe(drm->dev, ret, "Failed to initialize vblank\n");
   448	
 > 449		ret = drm_bridge_attach(&lcdc->pipe.encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
   450		if (ret)
   451			return dev_err_probe(drm->dev, ret, "Cannot attach bridge\n");
   452	
   453		lcdc->connector = drm_bridge_connector_init(drm, &lcdc->pipe.encoder);
   454		if (IS_ERR(lcdc->connector))
   455			return dev_err_probe(drm->dev, PTR_ERR(lcdc->connector), "Cannot init bridge connector\n");
   456	
   457		drm_connector_attach_encoder(lcdc->connector, &lcdc->pipe.encoder);
   458	
   459		/*
   460		 * The LCDC controller does not have an enable bit. The
   461		 * controller starts directly when the clocks are enabled.
   462		 * If the clocks are enabled when the controller is not yet
   463		 * programmed with proper register values (enabled at the
   464		 * bootloader, for example) then it just goes into some undefined
   465		 * state.
   466		 * To avoid this issue, let's enable and disable LCDC IPG,
   467		 * PER and AHB clock so that we force some kind of 'reset'
   468		 * to the LCDC block.
   469		 */
   470	
   471		ret = clk_prepare_enable(lcdc->clk_ipg);
   472		if (ret)
   473			return dev_err_probe(dev, ret, "Cannot enable ipg clock\n");
   474		clk_disable_unprepare(lcdc->clk_ipg);
   475	
   476		ret = clk_prepare_enable(lcdc->clk_per);
   477		if (ret)
   478			return dev_err_probe(dev, ret, "Cannot enable per clock\n");
   479		clk_disable_unprepare(lcdc->clk_per);
   480	
   481		ret = clk_prepare_enable(lcdc->clk_ahb);
   482		if (ret)
   483			return dev_err_probe(dev, ret, "Cannot enable ahb clock\n");
   484		clk_disable_unprepare(lcdc->clk_ahb);
   485	
   486		drm->mode_config.min_width = LCDC_MIN_XRES;
   487		drm->mode_config.max_width = LCDC_MAX_XRES;
   488		drm->mode_config.min_height = LCDC_MIN_YRES;
   489		drm->mode_config.max_height = LCDC_MAX_YRES;
   490		drm->mode_config.preferred_depth = 16;
   491		drm->mode_config.funcs = &imx_lcdc_mode_config_funcs;
   492		drm->mode_config.helper_private = &imx_lcdc_mode_config_helpers;
   493	
   494		drm_mode_config_reset(drm);
   495	
   496		irq = platform_get_irq(pdev, 0);
   497		if (irq < 0) {
   498			ret = irq;
   499			return ret;
   500		}
   501	
   502		ret = devm_request_irq(dev, irq, imx_lcdc_irq_handler, 0, "imx-lcdc", lcdc);
   503		if (ret < 0)
   504			return dev_err_probe(drm->dev, ret, "Failed to install IRQ handler\n");
   505	
   506		platform_set_drvdata(pdev, drm);
   507	
   508		ret = drm_dev_register(&lcdc->drm, 0);
   509		if (ret)
   510			return dev_err_probe(dev, ret, "Cannot register device\n");
   511	
   512		drm_fbdev_generic_setup(drm, 0);
   513	
   514		return 0;
   515	}
   516	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
