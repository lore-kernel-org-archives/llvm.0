Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15752C85
	for <llvm@lists.linux.dev>; Sat, 30 Oct 2021 06:07:26 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10152"; a="231065173"
X-IronPort-AV: E=Sophos;i="5.87,194,1631602800"; 
   d="gz'50?scan'50,208,50";a="231065173"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2021 23:07:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,194,1631602800"; 
   d="gz'50?scan'50,208,50";a="666056389"
Received: from lkp-server02.sh.intel.com (HELO c20d8bc80006) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 29 Oct 2021 23:07:23 -0700
Received: from kbuild by c20d8bc80006 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mghWU-00016y-Fd; Sat, 30 Oct 2021 06:07:22 +0000
Date: Sat, 30 Oct 2021 14:07:05 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Cercueil <paul@crapouillou.net>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RESEND PATCH v3 1/6] drm/ingenic: Simplify code by using
 hwdescs array
Message-ID: <202110301447.lLL7322n-lkp@intel.com>
References: <20211026181240.213806-2-paul@crapouillou.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="YZ5djTAD1cGYuMQK"
Content-Disposition: inline
In-Reply-To: <20211026181240.213806-2-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)


--YZ5djTAD1cGYuMQK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Paul,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-tip/drm-tip drm-exynos/exynos-drm-next tegra-drm/drm/tegra/for-next v5.15-rc7 next-20211029]
[cannot apply to airlied/drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Paul-Cercueil/drm-ingenic-Various-improvements-v3/20211027-021609
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
config: riscv-randconfig-r042-20211028 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5db7568a6a1fcb408eb8988abdaff2a225a8eb72)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/416c9e16345aeccf28137b77b471077c0d07df27
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Paul-Cercueil/drm-ingenic-Various-improvements-v3/20211027-021609
        git checkout 416c9e16345aeccf28137b77b471077c0d07df27
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=riscv 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/ingenic/ingenic-drm-drv.c:1134:42: warning: variable 'dma_hwdesc_phys_f0' is uninitialized when used here [-Wuninitialized]
           regmap_write(priv->map, JZ_REG_LCD_DA0, dma_hwdesc_phys_f0);
                                                   ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ingenic/ingenic-drm-drv.c:894:31: note: initialize the variable 'dma_hwdesc_phys_f0' to silence this warning
           dma_addr_t dma_hwdesc_phys_f0, dma_hwdesc_phys_f1;
                                        ^
                                         = 0
>> drivers/gpu/drm/ingenic/ingenic-drm-drv.c:1135:42: warning: variable 'dma_hwdesc_phys_f1' is uninitialized when used here [-Wuninitialized]
           regmap_write(priv->map, JZ_REG_LCD_DA1, dma_hwdesc_phys_f1);
                                                   ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ingenic/ingenic-drm-drv.c:894:51: note: initialize the variable 'dma_hwdesc_phys_f1' to silence this warning
           dma_addr_t dma_hwdesc_phys_f0, dma_hwdesc_phys_f1;
                                                            ^
                                                             = 0
   2 warnings generated.


vim +/dma_hwdesc_phys_f0 +1134 drivers/gpu/drm/ingenic/ingenic-drm-drv.c

416c9e16345aec drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2021-10-26   879  
3b5b005ef7d9e2 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-08-27   880  static int ingenic_drm_bind(struct device *dev, bool has_components)
fc1acf317b0108 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16   881  {
fc1acf317b0108 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16   882  	struct platform_device *pdev = to_platform_device(dev);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   883  	const struct jz_soc_info *soc_info;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   884  	struct ingenic_drm *priv;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   885  	struct clk *parent_clk;
7b4957684e5d81 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2021-01-24   886  	struct drm_plane *primary;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   887  	struct drm_bridge *bridge;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   888  	struct drm_panel *panel;
c369cb27c267fe drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16   889  	struct drm_encoder *encoder;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   890  	struct drm_device *drm;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   891  	void __iomem *base;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   892  	long parent_rate;
c369cb27c267fe drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16   893  	unsigned int i, clone_mask = 0;
174d8e52a60f19 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-09-26   894  	dma_addr_t dma_hwdesc_phys_f0, dma_hwdesc_phys_f1;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   895  	int ret, irq;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   896  
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   897  	soc_info = of_device_get_match_data(dev);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   898  	if (!soc_info) {
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   899  		dev_err(dev, "Missing platform data\n");
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   900  		return -EINVAL;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   901  	}
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   902  
1677d31c226683 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-09-26   903  	if (IS_ENABLED(CONFIG_OF_RESERVED_MEM)) {
1677d31c226683 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-09-26   904  		ret = of_reserved_mem_device_init(dev);
1677d31c226683 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-09-26   905  
1677d31c226683 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-09-26   906  		if (ret && ret != -ENODEV)
1677d31c226683 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-09-26   907  			dev_warn(dev, "Failed to get reserved memory: %d\n", ret);
1677d31c226683 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-09-26   908  
1677d31c226683 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-09-26   909  		if (!ret) {
1677d31c226683 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-09-26   910  			ret = devm_add_action_or_reset(dev, ingenic_drm_release_rmem, dev);
1677d31c226683 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-09-26   911  			if (ret)
1677d31c226683 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-09-26   912  				return ret;
1677d31c226683 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-09-26   913  		}
1677d31c226683 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-09-26   914  	}
1677d31c226683 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-09-26   915  
37d8d81f019ac1 drivers/gpu/drm/ingenic/ingenic-drm.c     Daniel Vetter     2020-04-15   916  	priv = devm_drm_dev_alloc(dev, &ingenic_drm_driver_data,
37d8d81f019ac1 drivers/gpu/drm/ingenic/ingenic-drm.c     Daniel Vetter     2020-04-15   917  				  struct ingenic_drm, drm);
37d8d81f019ac1 drivers/gpu/drm/ingenic/ingenic-drm.c     Daniel Vetter     2020-04-15   918  	if (IS_ERR(priv))
37d8d81f019ac1 drivers/gpu/drm/ingenic/ingenic-drm.c     Daniel Vetter     2020-04-15   919  		return PTR_ERR(priv);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   920  
a7c909b7c037fa drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-12-10   921  	priv->soc_info = soc_info;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   922  	priv->dev = dev;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   923  	drm = &priv->drm;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   924  
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   925  	platform_set_drvdata(pdev, priv);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   926  
fe1cc102a381a9 drivers/gpu/drm/ingenic/ingenic-drm.c     Daniel Vetter     2020-03-23   927  	ret = drmm_mode_config_init(drm);
fe1cc102a381a9 drivers/gpu/drm/ingenic/ingenic-drm.c     Daniel Vetter     2020-03-23   928  	if (ret)
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   929  		return ret;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   930  
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   931  	drm->mode_config.min_width = 0;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   932  	drm->mode_config.min_height = 0;
a7c909b7c037fa drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-12-10   933  	drm->mode_config.max_width = soc_info->max_width;
96ea0ae692fe38 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-12-10   934  	drm->mode_config.max_height = 4095;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   935  	drm->mode_config.funcs = &ingenic_drm_mode_config_funcs;
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16   936  	drm->mode_config.helper_private = &ingenic_drm_mode_config_helpers;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   937  
ffa8aa00e9e589 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-27   938  	base = devm_platform_ioremap_resource(pdev, 0);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   939  	if (IS_ERR(base)) {
1f7596f4ad9b7f drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16   940  		dev_err(dev, "Failed to get memory resource\n");
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   941  		return PTR_ERR(base);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   942  	}
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   943  
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   944  	priv->map = devm_regmap_init_mmio(dev, base,
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   945  					  &ingenic_drm_regmap_config);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   946  	if (IS_ERR(priv->map)) {
1f7596f4ad9b7f drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16   947  		dev_err(dev, "Failed to create regmap\n");
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   948  		return PTR_ERR(priv->map);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   949  	}
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   950  
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   951  	irq = platform_get_irq(pdev, 0);
71c45008e2b0d6 drivers/gpu/drm/ingenic/ingenic-drm.c     Markus Elfring    2020-04-05   952  	if (irq < 0)
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   953  		return irq;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   954  
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   955  	if (soc_info->needs_dev_clk) {
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   956  		priv->lcd_clk = devm_clk_get(dev, "lcd");
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   957  		if (IS_ERR(priv->lcd_clk)) {
1f7596f4ad9b7f drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16   958  			dev_err(dev, "Failed to get lcd clock\n");
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   959  			return PTR_ERR(priv->lcd_clk);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   960  		}
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   961  	}
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   962  
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   963  	priv->pix_clk = devm_clk_get(dev, "lcd_pclk");
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   964  	if (IS_ERR(priv->pix_clk)) {
1f7596f4ad9b7f drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16   965  		dev_err(dev, "Failed to get pixel clock\n");
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   966  		return PTR_ERR(priv->pix_clk);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   967  	}
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   968  
174d8e52a60f19 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-09-26   969  	priv->dma_hwdescs = dmam_alloc_coherent(dev,
174d8e52a60f19 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-09-26   970  						sizeof(*priv->dma_hwdescs),
174d8e52a60f19 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-09-26   971  						&priv->dma_hwdescs_phys,
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   972  						GFP_KERNEL);
174d8e52a60f19 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-09-26   973  	if (!priv->dma_hwdescs)
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   974  		return -ENOMEM;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   975  
174d8e52a60f19 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-09-26   976  	/* Configure DMA hwdesc for foreground0 plane */
416c9e16345aec drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2021-10-26   977  	ingenic_drm_configure_hwdesc_plane(priv, 0);
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16   978  
174d8e52a60f19 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-09-26   979  	/* Configure DMA hwdesc for foreground1 plane */
416c9e16345aec drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2021-10-26   980  	ingenic_drm_configure_hwdesc_plane(priv, 1);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   981  
686d4b4b99afe7 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-09-27   982  	/* Configure DMA hwdesc for palette */
416c9e16345aec drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2021-10-26   983  	ingenic_drm_configure_hwdesc_palette(priv);
686d4b4b99afe7 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-09-27   984  
7b4957684e5d81 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2021-01-24   985  	primary = priv->soc_info->has_osd ? &priv->f1 : &priv->f0;
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16   986  
7b4957684e5d81 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2021-01-24   987  	drm_plane_helper_add(primary, &ingenic_drm_plane_helper_funcs);
7b4957684e5d81 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2021-01-24   988  
7b4957684e5d81 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2021-01-24   989  	ret = drm_universal_plane_init(drm, primary, 1,
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16   990  				       &ingenic_drm_primary_plane_funcs,
3d705fb0dc43a9 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-09-26   991  				       priv->soc_info->formats_f1,
3d705fb0dc43a9 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-09-26   992  				       priv->soc_info->num_formats_f1,
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   993  				       NULL, DRM_PLANE_TYPE_PRIMARY, NULL);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   994  	if (ret) {
fc1acf317b0108 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16   995  		dev_err(dev, "Failed to register plane: %i\n", ret);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   996  		return ret;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   997  	}
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03   998  
4a791cb6d34f42 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2021-05-23   999  	if (soc_info->map_noncoherent)
4a791cb6d34f42 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2021-05-23  1000  		drm_plane_enable_fb_damage_clips(&priv->f1);
4a791cb6d34f42 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2021-05-23  1001  
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1002  	drm_crtc_helper_add(&priv->crtc, &ingenic_drm_crtc_helper_funcs);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1003  
7b4957684e5d81 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2021-01-24  1004  	ret = drm_crtc_init_with_planes(drm, &priv->crtc, primary,
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1005  					NULL, &ingenic_drm_crtc_funcs, NULL);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1006  	if (ret) {
1f7596f4ad9b7f drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1007  		dev_err(dev, "Failed to init CRTC: %i\n", ret);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1008  		return ret;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1009  	}
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1010  
686d4b4b99afe7 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-09-27  1011  	drm_crtc_enable_color_mgmt(&priv->crtc, 0, false,
686d4b4b99afe7 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-09-27  1012  				   ARRAY_SIZE(priv->dma_hwdescs->palette));
686d4b4b99afe7 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-09-27  1013  
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1014  	if (soc_info->has_osd) {
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1015  		drm_plane_helper_add(&priv->f0,
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1016  				     &ingenic_drm_plane_helper_funcs);
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1017  
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1018  		ret = drm_universal_plane_init(drm, &priv->f0, 1,
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1019  					       &ingenic_drm_primary_plane_funcs,
3d705fb0dc43a9 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-09-26  1020  					       priv->soc_info->formats_f0,
3d705fb0dc43a9 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-09-26  1021  					       priv->soc_info->num_formats_f0,
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1022  					       NULL, DRM_PLANE_TYPE_OVERLAY,
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1023  					       NULL);
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1024  		if (ret) {
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1025  			dev_err(dev, "Failed to register overlay plane: %i\n",
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1026  				ret);
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1027  			return ret;
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1028  		}
fc1acf317b0108 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1029  
4a791cb6d34f42 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2021-05-23  1030  		if (soc_info->map_noncoherent)
4a791cb6d34f42 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2021-05-23  1031  			drm_plane_enable_fb_damage_clips(&priv->f0);
4a791cb6d34f42 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2021-05-23  1032  
3b5b005ef7d9e2 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-08-27  1033  		if (IS_ENABLED(CONFIG_DRM_INGENIC_IPU) && has_components) {
fc1acf317b0108 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1034  			ret = component_bind_all(dev, drm);
fc1acf317b0108 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1035  			if (ret) {
fc1acf317b0108 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1036  				if (ret != -EPROBE_DEFER)
fc1acf317b0108 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1037  					dev_err(dev, "Failed to bind components: %i\n", ret);
fc1acf317b0108 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1038  				return ret;
fc1acf317b0108 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1039  			}
fc1acf317b0108 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1040  
fc1acf317b0108 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1041  			ret = devm_add_action_or_reset(dev, ingenic_drm_unbind_all, priv);
fc1acf317b0108 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1042  			if (ret)
fc1acf317b0108 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1043  				return ret;
fc1acf317b0108 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1044  
fc1acf317b0108 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1045  			priv->ipu_plane = drm_plane_from_index(drm, 2);
fc1acf317b0108 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1046  			if (!priv->ipu_plane) {
fc1acf317b0108 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1047  				dev_err(dev, "Failed to retrieve IPU plane\n");
fc1acf317b0108 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1048  				return -EINVAL;
fc1acf317b0108 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1049  			}
fc1acf317b0108 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1050  		}
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1051  	}
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1052  
c369cb27c267fe drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1053  	for (i = 0; ; i++) {
c369cb27c267fe drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1054  		ret = drm_of_find_panel_or_bridge(dev->of_node, 0, i, &panel, &bridge);
c369cb27c267fe drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1055  		if (ret) {
c369cb27c267fe drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1056  			if (ret == -ENODEV)
c369cb27c267fe drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1057  				break; /* we're done */
c369cb27c267fe drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1058  			if (ret != -EPROBE_DEFER)
c369cb27c267fe drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1059  				dev_err(dev, "Failed to get bridge handle\n");
c369cb27c267fe drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1060  			return ret;
c369cb27c267fe drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1061  		}
c369cb27c267fe drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1062  
c369cb27c267fe drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1063  		if (panel)
c369cb27c267fe drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1064  			bridge = devm_drm_panel_bridge_add_typed(dev, panel,
c369cb27c267fe drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1065  								 DRM_MODE_CONNECTOR_DPI);
c369cb27c267fe drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1066  
e488b1023a4a4e drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2021-03-27  1067  		encoder = drmm_plain_encoder_alloc(drm, NULL, DRM_MODE_ENCODER_DPI, NULL);
e488b1023a4a4e drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2021-03-27  1068  		if (IS_ERR(encoder)) {
e488b1023a4a4e drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2021-03-27  1069  			ret = PTR_ERR(encoder);
e488b1023a4a4e drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2021-03-27  1070  			dev_err(dev, "Failed to init encoder: %d\n", ret);
e488b1023a4a4e drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2021-03-27  1071  			return ret;
e488b1023a4a4e drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2021-03-27  1072  		}
c369cb27c267fe drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1073  
c369cb27c267fe drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1074  		encoder->possible_crtcs = 1;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1075  
c369cb27c267fe drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1076  		drm_encoder_helper_add(encoder, &ingenic_drm_encoder_helper_funcs);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1077  
c369cb27c267fe drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1078  		ret = drm_bridge_attach(encoder, bridge, NULL, 0);
fb8d617f8fd64f drivers/gpu/drm/ingenic/ingenic-drm-drv.c Laurent Pinchart  2021-03-23  1079  		if (ret)
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1080  			return ret;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1081  	}
c369cb27c267fe drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1082  
c369cb27c267fe drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1083  	drm_for_each_encoder(encoder, drm) {
c369cb27c267fe drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1084  		clone_mask |= BIT(drm_encoder_index(encoder));
c369cb27c267fe drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1085  	}
c369cb27c267fe drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1086  
c369cb27c267fe drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1087  	drm_for_each_encoder(encoder, drm) {
c369cb27c267fe drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1088  		encoder->possible_clones = clone_mask;
c369cb27c267fe drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1089  	}
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1090  
613ba71619cfe0 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Thomas Zimmermann 2021-07-15  1091  	ret = devm_request_irq(dev, irq, ingenic_drm_irq_handler, 0, drm->driver->name, drm);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1092  	if (ret) {
1f7596f4ad9b7f drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1093  		dev_err(dev, "Unable to install IRQ handler\n");
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1094  		return ret;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1095  	}
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1096  
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1097  	ret = drm_vblank_init(drm, 1);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1098  	if (ret) {
1f7596f4ad9b7f drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1099  		dev_err(dev, "Failed calling drm_vblank_init()\n");
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1100  		return ret;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1101  	}
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1102  
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1103  	drm_mode_config_reset(drm);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1104  
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1105  	ret = clk_prepare_enable(priv->pix_clk);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1106  	if (ret) {
1f7596f4ad9b7f drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1107  		dev_err(dev, "Unable to start pixel clock\n");
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1108  		return ret;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1109  	}
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1110  
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1111  	if (priv->lcd_clk) {
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1112  		parent_clk = clk_get_parent(priv->lcd_clk);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1113  		parent_rate = clk_get_rate(parent_clk);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1114  
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1115  		/* LCD Device clock must be 3x the pixel clock for STN panels,
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1116  		 * or 1.5x the pixel clock for TFT panels. To avoid having to
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1117  		 * check for the LCD device clock everytime we do a mode change,
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1118  		 * we set the LCD device clock to the highest rate possible.
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1119  		 */
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1120  		ret = clk_set_rate(priv->lcd_clk, parent_rate);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1121  		if (ret) {
1f7596f4ad9b7f drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1122  			dev_err(dev, "Unable to set LCD clock rate\n");
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1123  			goto err_pixclk_disable;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1124  		}
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1125  
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1126  		ret = clk_prepare_enable(priv->lcd_clk);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1127  		if (ret) {
1f7596f4ad9b7f drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1128  			dev_err(dev, "Unable to start lcd clock\n");
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1129  			goto err_pixclk_disable;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1130  		}
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1131  	}
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1132  
e5507d2c01362b drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1133  	/* Set address of our DMA descriptor chain */
174d8e52a60f19 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-09-26 @1134  	regmap_write(priv->map, JZ_REG_LCD_DA0, dma_hwdesc_phys_f0);
174d8e52a60f19 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-09-26 @1135  	regmap_write(priv->map, JZ_REG_LCD_DA1, dma_hwdesc_phys_f1);
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1136  
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1137  	/* Enable OSD if available */
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1138  	if (soc_info->has_osd)
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1139  		regmap_write(priv->map, JZ_REG_LCD_OSDC, JZ_LCD_OSDC_OSDEN);
e5507d2c01362b drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1140  
33700f6f7d9f6b drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-09-26  1141  	mutex_init(&priv->clk_mutex);
33700f6f7d9f6b drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-09-26  1142  	priv->clock_nb.notifier_call = ingenic_drm_update_pixclk;
33700f6f7d9f6b drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-09-26  1143  
33700f6f7d9f6b drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-09-26  1144  	parent_clk = clk_get_parent(priv->pix_clk);
33700f6f7d9f6b drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-09-26  1145  	ret = clk_notifier_register(parent_clk, &priv->clock_nb);
33700f6f7d9f6b drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-09-26  1146  	if (ret) {
33700f6f7d9f6b drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-09-26  1147  		dev_err(dev, "Unable to register clock notifier\n");
33700f6f7d9f6b drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-09-26  1148  		goto err_devclk_disable;
33700f6f7d9f6b drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-09-26  1149  	}
33700f6f7d9f6b drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-09-26  1150  
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1151  	ret = drm_dev_register(drm, 0);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1152  	if (ret) {
1f7596f4ad9b7f drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-07-16  1153  		dev_err(dev, "Failed to register DRM driver\n");
33700f6f7d9f6b drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-09-26  1154  		goto err_clk_notifier_unregister;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1155  	}
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1156  
38d356c7fe7fd4 drivers/gpu/drm/ingenic/ingenic-drm.c     Thomas Zimmermann 2020-04-08  1157  	drm_fbdev_generic_setup(drm, 32);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1158  
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1159  	return 0;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1160  
33700f6f7d9f6b drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-09-26  1161  err_clk_notifier_unregister:
33700f6f7d9f6b drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     2020-09-26  1162  	clk_notifier_unregister(parent_clk, &priv->clock_nb);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1163  err_devclk_disable:
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1164  	if (priv->lcd_clk)
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1165  		clk_disable_unprepare(priv->lcd_clk);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1166  err_pixclk_disable:
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1167  	clk_disable_unprepare(priv->pix_clk);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1168  	return ret;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1169  }
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     2019-06-03  1170  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--YZ5djTAD1cGYuMQK
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
AA==

--YZ5djTAD1cGYuMQK--
