Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C552F21
	for <llvm@lists.linux.dev>; Sun,  6 Feb 2022 21:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644183648; x=1675719648;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=JyaXasOYnbMHw2yA/fp88cf++V2EcbKTI2cCD9f8/do=;
  b=TYdqqpG50Os8jqqWA/jE/xandYYir76nu9r9flys92xENJrUy0ralZLb
   zf94U+cuP97tFxHkLWDJnVjQubb23rfJATHwlLoUwzAP/WD8AmZcVCegM
   +eQb5osSvt8gY4lqDFWuj9veT6PPf9CLz26Hj1Y8T/fdRf7Ku+gdNx1Yy
   xCdC+dPD/G8iv/+Qc7E13hK7a4n32m8qgB882Tfdk5o37/pPOEigoQStP
   hemCzODlR20G8/he0R1ycMtk1Ot3r4ZwPcCKebt7ZRXzl3FJtSVbtlirK
   stC+66U6BwRG4j7NsLH+VpFXtz2r+nSsYIfFEj0djeXh22c5M+iLT7o5l
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10249"; a="335012580"
X-IronPort-AV: E=Sophos;i="5.88,348,1635231600"; 
   d="scan'208";a="335012580"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2022 13:40:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,348,1635231600"; 
   d="scan'208";a="700258450"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 06 Feb 2022 13:40:46 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nGpH3-000alh-Sa; Sun, 06 Feb 2022 21:40:45 +0000
Date: Mon, 7 Feb 2022 05:40:16 +0800
From: kernel test robot <lkp@intel.com>
To: Marek Vasut <marex@denx.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH] drm: mxsfb: Simplify LCDIF clock handling
Message-ID: <202202070554.XjbmgTB8-lkp@intel.com>
References: <20220206185555.275768-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220206185555.275768-1-marex@denx.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Marek,

I love your patch! Yet something to improve:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on next-20220204]
[cannot apply to drm-intel/for-linux-next drm-tip/drm-tip drm-exynos/exynos-drm-next tegra-drm/drm/tegra/for-next airlied/drm-next v5.17-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Marek-Vasut/drm-mxsfb-Simplify-LCDIF-clock-handling/20220207-025717
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: riscv-randconfig-r031-20220207 (https://download.01.org/0day-ci/archive/20220207/202202070554.XjbmgTB8-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6daaf5a44925592c764c59219b0024ee06317028)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/7e48d24c5ec466eddb1bfbb6f39daaf061d2a84b
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Marek-Vasut/drm-mxsfb-Simplify-LCDIF-clock-handling/20220207-025717
        git checkout 7e48d24c5ec466eddb1bfbb6f39daaf061d2a84b
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/gpu/drm/mxsfb/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/mxsfb/mxsfb_drv.c:263:8: error: use of undeclared label 'err_vblank'
                   goto err_vblank;
                        ^
   1 error generated.


vim +/err_vblank +263 drivers/gpu/drm/mxsfb/mxsfb_drv.c

5fc40f41c137cc Thomas Zimmermann 2021-08-03  189  
c6ddee8220bf8a Laurent Pinchart  2020-07-27  190  static int mxsfb_load(struct drm_device *drm,
c6ddee8220bf8a Laurent Pinchart  2020-07-27  191  		      const struct mxsfb_devdata *devdata)
45d59d704080cc Marek Vasut       2016-08-18  192  {
45d59d704080cc Marek Vasut       2016-08-18  193  	struct platform_device *pdev = to_platform_device(drm->dev);
45d59d704080cc Marek Vasut       2016-08-18  194  	struct mxsfb_drm_private *mxsfb;
45d59d704080cc Marek Vasut       2016-08-18  195  	struct resource *res;
45d59d704080cc Marek Vasut       2016-08-18  196  	int ret;
45d59d704080cc Marek Vasut       2016-08-18  197  
45d59d704080cc Marek Vasut       2016-08-18  198  	mxsfb = devm_kzalloc(&pdev->dev, sizeof(*mxsfb), GFP_KERNEL);
45d59d704080cc Marek Vasut       2016-08-18  199  	if (!mxsfb)
45d59d704080cc Marek Vasut       2016-08-18  200  		return -ENOMEM;
45d59d704080cc Marek Vasut       2016-08-18  201  
c42001e357f7de Laurent Pinchart  2020-07-27  202  	mxsfb->drm = drm;
45d59d704080cc Marek Vasut       2016-08-18  203  	drm->dev_private = mxsfb;
c6ddee8220bf8a Laurent Pinchart  2020-07-27  204  	mxsfb->devdata = devdata;
45d59d704080cc Marek Vasut       2016-08-18  205  
45d59d704080cc Marek Vasut       2016-08-18  206  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
45d59d704080cc Marek Vasut       2016-08-18  207  	mxsfb->base = devm_ioremap_resource(drm->dev, res);
45d59d704080cc Marek Vasut       2016-08-18  208  	if (IS_ERR(mxsfb->base))
45d59d704080cc Marek Vasut       2016-08-18  209  		return PTR_ERR(mxsfb->base);
45d59d704080cc Marek Vasut       2016-08-18  210  
45d59d704080cc Marek Vasut       2016-08-18  211  	mxsfb->clk = devm_clk_get(drm->dev, NULL);
45d59d704080cc Marek Vasut       2016-08-18  212  	if (IS_ERR(mxsfb->clk))
45d59d704080cc Marek Vasut       2016-08-18  213  		return PTR_ERR(mxsfb->clk);
45d59d704080cc Marek Vasut       2016-08-18  214  
7e48d24c5ec466 Marek Vasut       2022-02-06  215  	mxsfb->clk_axi = devm_clk_get_optional(drm->dev, "axi");
45d59d704080cc Marek Vasut       2016-08-18  216  	if (IS_ERR(mxsfb->clk_axi))
7e48d24c5ec466 Marek Vasut       2022-02-06  217  		return PTR_ERR(mxsfb->clk_axi);
45d59d704080cc Marek Vasut       2016-08-18  218  
7e48d24c5ec466 Marek Vasut       2022-02-06  219  	mxsfb->clk_disp_axi = devm_clk_get_optional(drm->dev, "disp_axi");
45d59d704080cc Marek Vasut       2016-08-18  220  	if (IS_ERR(mxsfb->clk_disp_axi))
7e48d24c5ec466 Marek Vasut       2022-02-06  221  		return PTR_ERR(mxsfb->clk_disp_axi);
45d59d704080cc Marek Vasut       2016-08-18  222  
45d59d704080cc Marek Vasut       2016-08-18  223  	ret = dma_set_mask_and_coherent(drm->dev, DMA_BIT_MASK(32));
45d59d704080cc Marek Vasut       2016-08-18  224  	if (ret)
45d59d704080cc Marek Vasut       2016-08-18  225  		return ret;
45d59d704080cc Marek Vasut       2016-08-18  226  
45d59d704080cc Marek Vasut       2016-08-18  227  	/* Modeset init */
45d59d704080cc Marek Vasut       2016-08-18  228  	drm_mode_config_init(drm);
45d59d704080cc Marek Vasut       2016-08-18  229  
ae1ed009328193 Laurent Pinchart  2020-07-27  230  	ret = mxsfb_kms_init(mxsfb);
45d59d704080cc Marek Vasut       2016-08-18  231  	if (ret < 0) {
ae1ed009328193 Laurent Pinchart  2020-07-27  232  		dev_err(drm->dev, "Failed to initialize KMS pipeline\n");
7e48d24c5ec466 Marek Vasut       2022-02-06  233  		return ret;
45d59d704080cc Marek Vasut       2016-08-18  234  	}
45d59d704080cc Marek Vasut       2016-08-18  235  
b9f5937680a8f1 Laurent Pinchart  2020-07-27  236  	ret = drm_vblank_init(drm, drm->mode_config.num_crtc);
b9f5937680a8f1 Laurent Pinchart  2020-07-27  237  	if (ret < 0) {
b9f5937680a8f1 Laurent Pinchart  2020-07-27  238  		dev_err(drm->dev, "Failed to initialise vblank\n");
7e48d24c5ec466 Marek Vasut       2022-02-06  239  		return ret;
b9f5937680a8f1 Laurent Pinchart  2020-07-27  240  	}
b9f5937680a8f1 Laurent Pinchart  2020-07-27  241  
b9f5937680a8f1 Laurent Pinchart  2020-07-27  242  	/* Start with vertical blanking interrupt reporting disabled. */
b9f5937680a8f1 Laurent Pinchart  2020-07-27  243  	drm_crtc_vblank_off(&mxsfb->crtc);
b9f5937680a8f1 Laurent Pinchart  2020-07-27  244  
c42001e357f7de Laurent Pinchart  2020-07-27  245  	ret = mxsfb_attach_bridge(mxsfb);
45d59d704080cc Marek Vasut       2016-08-18  246  	if (ret) {
ee46d16d2e40be Guido Günther     2020-12-15  247  		if (ret != -EPROBE_DEFER)
d02340436695cb Robert Chiras     2019-08-29  248  			dev_err(drm->dev, "Cannot connect bridge: %d\n", ret);
7e48d24c5ec466 Marek Vasut       2022-02-06  249  		return ret;
45d59d704080cc Marek Vasut       2016-08-18  250  	}
45d59d704080cc Marek Vasut       2016-08-18  251  
45d59d704080cc Marek Vasut       2016-08-18  252  	drm->mode_config.min_width	= MXSFB_MIN_XRES;
45d59d704080cc Marek Vasut       2016-08-18  253  	drm->mode_config.min_height	= MXSFB_MIN_YRES;
45d59d704080cc Marek Vasut       2016-08-18  254  	drm->mode_config.max_width	= MXSFB_MAX_XRES;
45d59d704080cc Marek Vasut       2016-08-18  255  	drm->mode_config.max_height	= MXSFB_MAX_YRES;
45d59d704080cc Marek Vasut       2016-08-18  256  	drm->mode_config.funcs		= &mxsfb_mode_config_funcs;
9f19fd3bd894d6 Leonard Crestez   2018-09-17  257  	drm->mode_config.helper_private	= &mxsfb_mode_config_helpers;
45d59d704080cc Marek Vasut       2016-08-18  258  
45d59d704080cc Marek Vasut       2016-08-18  259  	drm_mode_config_reset(drm);
45d59d704080cc Marek Vasut       2016-08-18  260  
5fc40f41c137cc Thomas Zimmermann 2021-08-03  261  	ret = platform_get_irq(pdev, 0);
5fc40f41c137cc Thomas Zimmermann 2021-08-03  262  	if (ret < 0)
5fc40f41c137cc Thomas Zimmermann 2021-08-03 @263  		goto err_vblank;
5fc40f41c137cc Thomas Zimmermann 2021-08-03  264  	mxsfb->irq = ret;
5fc40f41c137cc Thomas Zimmermann 2021-08-03  265  
5fc40f41c137cc Thomas Zimmermann 2021-08-03  266  	ret = mxsfb_irq_install(drm, mxsfb->irq);
45d59d704080cc Marek Vasut       2016-08-18  267  	if (ret < 0) {
45d59d704080cc Marek Vasut       2016-08-18  268  		dev_err(drm->dev, "Failed to install IRQ handler\n");
7e48d24c5ec466 Marek Vasut       2022-02-06  269  		return ret;
45d59d704080cc Marek Vasut       2016-08-18  270  	}
45d59d704080cc Marek Vasut       2016-08-18  271  
45d59d704080cc Marek Vasut       2016-08-18  272  	drm_kms_helper_poll_init(drm);
45d59d704080cc Marek Vasut       2016-08-18  273  
45d59d704080cc Marek Vasut       2016-08-18  274  	platform_set_drvdata(pdev, drm);
45d59d704080cc Marek Vasut       2016-08-18  275  
45d59d704080cc Marek Vasut       2016-08-18  276  	drm_helper_hpd_irq_event(drm);
45d59d704080cc Marek Vasut       2016-08-18  277  
7e48d24c5ec466 Marek Vasut       2022-02-06  278  	pm_runtime_enable(drm->dev);
45d59d704080cc Marek Vasut       2016-08-18  279  
7e48d24c5ec466 Marek Vasut       2022-02-06  280  	return 0;
45d59d704080cc Marek Vasut       2016-08-18  281  }
45d59d704080cc Marek Vasut       2016-08-18  282  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
