Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94AE7C;
	Thu,  4 May 2023 20:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683233274; x=1714769274;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WHvmAzclGpkNr2GfZZrjAph1ZhCiMlHNdHf08Mk+fRo=;
  b=WlBZQDE1/ND91t0cp6KZnvTMvb+hP+zqTWMnlGWuYIhx825yWhsq+139
   IbvFHeG6gq2NsK1lRq3kmW/CG63lagHhl1E7D4E049xP+yz5CsCAtbiQZ
   rWdACl2V3RByzPTosFOfsWLCiOalct02Fb3X+oKaiURTjtKdCeA+7/3Ek
   PLcLRLGucVKXlvAwr7A3lbOFbeJaOhE1FD50gxOgYmlcY5M51Q2E6leQ/
   kLEvyqbfYAS8TGC4yUrmAMzQkaKZXqFjbd9xX3dZgh2CdU1PD4/28dzn/
   n6KCy9Vz1RFMshZf1UfX3BbzibNuB9pib21vRKuL7zqLsekV5Evzjn2JU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="328678356"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; 
   d="scan'208";a="328678356"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2023 13:47:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="674712011"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; 
   d="scan'208";a="674712011"
Received: from lkp-server01.sh.intel.com (HELO 64cf2984a3fe) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 04 May 2023 13:47:52 -0700
Received: from kbuild by 64cf2984a3fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pufrj-00008O-1x;
	Thu, 04 May 2023 20:47:51 +0000
Date: Fri, 5 May 2023 04:47:50 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl-qtg 6/28]
 drivers/media/platform/samsung/exynos-gsc/gsc-core.c:1187:39: warning:
 implicit conversion from 'unsigned long long' to 'unsigned int' changes
 value from 18446744073709551615 to 4294967295
Message-ID: <202305050417.iiZwuIEC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl-qtg
head:   c09d294a320a41a687ff2881bc080bf7d9ee5ce2
commit: 3b181c164ce7143634146318f11b43524d5850bf [6/28] acpi: tables: Add CDAT table parsing support
config: riscv-randconfig-r025-20230503 (https://download.01.org/0day-ci/archive/20230505/202305050417.iiZwuIEC-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b1465cd49efcbc114a75220b153f5a055ce7911f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git/commit/?id=3b181c164ce7143634146318f11b43524d5850bf
        git remote add djiang https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git
        git fetch --no-tags djiang cxl-qtg
        git checkout 3b181c164ce7143634146318f11b43524d5850bf
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/media/platform/samsung/exynos-gsc/ drivers/media/platform/samsung/s5p-g2d/ drivers/media/platform/samsung/s5p-mfc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305050417.iiZwuIEC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/platform/samsung/exynos-gsc/gsc-core.c:26:
   In file included from drivers/media/platform/samsung/exynos-gsc/gsc-core.h:22:
   In file included from include/media/v4l2-device.h:13:
   In file included from include/media/v4l2-subdev.h:15:
   In file included from include/media/v4l2-common.h:105:
   In file included from include/linux/i2c.h:13:
   include/linux/acpi.h:1529:3: error: unknown type name 'acpi_tbl_entry_handler_arg'
                   acpi_tbl_entry_handler_arg handler, void *arg,
                   ^
>> drivers/media/platform/samsung/exynos-gsc/gsc-core.c:1187:39: warning: implicit conversion from 'unsigned long long' to 'unsigned int' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
           vb2_dma_contig_set_max_seg_size(dev, DMA_BIT_MASK(32));
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~      ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:76:40: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                          ^~~~~
   1 warning and 1 error generated.
--
   In file included from drivers/media/platform/samsung/s5p-g2d/g2d.c:20:
   In file included from include/media/v4l2-device.h:13:
   In file included from include/media/v4l2-subdev.h:15:
   In file included from include/media/v4l2-common.h:105:
   In file included from include/linux/i2c.h:13:
   include/linux/acpi.h:1529:3: error: unknown type name 'acpi_tbl_entry_handler_arg'
                   acpi_tbl_entry_handler_arg handler, void *arg,
                   ^
>> drivers/media/platform/samsung/s5p-g2d/g2d.c:679:46: warning: implicit conversion from 'unsigned long long' to 'unsigned int' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
           vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~             ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:76:40: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                          ^~~~~
   1 warning and 1 error generated.
--
   In file included from drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c:24:
   In file included from drivers/media/platform/samsung/s5p-mfc/s5p_mfc_common.h:18:
   In file included from include/media/v4l2-device.h:13:
   In file included from include/media/v4l2-subdev.h:15:
   In file included from include/media/v4l2-common.h:105:
   In file included from include/linux/i2c.h:13:
   include/linux/acpi.h:1529:3: error: unknown type name 'acpi_tbl_entry_handler_arg'
                   acpi_tbl_entry_handler_arg handler, void *arg,
                   ^
>> drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c:1183:6: warning: implicit conversion from 'unsigned long long' to 'unsigned int' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
                                           DMA_BIT_MASK(32));
                                           ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:76:40: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                          ^~~~~
   drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c:1185:6: warning: implicit conversion from 'unsigned long long' to 'unsigned int' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
                                           DMA_BIT_MASK(32));
                                           ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:76:40: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                          ^~~~~
   drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c:1241:39: warning: implicit conversion from 'unsigned long long' to 'unsigned int' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
           vb2_dma_contig_set_max_seg_size(dev, DMA_BIT_MASK(32));
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~      ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:76:40: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                          ^~~~~
   3 warnings and 1 error generated.


vim +1187 drivers/media/platform/samsung/exynos-gsc/gsc-core.c

89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang         2012-07-31  1104  
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang         2012-07-31  1105  static int gsc_probe(struct platform_device *pdev)
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang         2012-07-31  1106  {
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang         2012-07-31  1107  	struct gsc_dev *gsc;
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang         2012-07-31  1108  	struct device *dev = &pdev->dev;
aa7929f5954ce7 drivers/media/platform/exynos-gsc/gsc-core.c Marek Szyprowski      2016-11-09  1109  	const struct gsc_driverdata *drv_data = of_device_get_match_data(dev);
8e12c61cb15e88 drivers/media/platform/exynos-gsc/gsc-core.c Lad Prabhakar         2022-01-11  1110  	int irq;
aff093d4bbca91 drivers/media/platform/exynos-gsc/gsc-core.c Arnd Bergmann         2016-04-26  1111  	int ret;
92955ea0baf431 drivers/media/platform/exynos-gsc/gsc-core.c Marek Szyprowski      2016-11-09  1112  	int i;
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang         2012-07-31  1113  
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang         2012-07-31  1114  	gsc = devm_kzalloc(dev, sizeof(struct gsc_dev), GFP_KERNEL);
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang         2012-07-31  1115  	if (!gsc)
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang         2012-07-31  1116  		return -ENOMEM;
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang         2012-07-31  1117  
aff093d4bbca91 drivers/media/platform/exynos-gsc/gsc-core.c Arnd Bergmann         2016-04-26  1118  	ret = of_alias_get_id(pdev->dev.of_node, "gsc");
aff093d4bbca91 drivers/media/platform/exynos-gsc/gsc-core.c Arnd Bergmann         2016-04-26  1119  	if (ret < 0)
aff093d4bbca91 drivers/media/platform/exynos-gsc/gsc-core.c Arnd Bergmann         2016-04-26  1120  		return ret;
aff093d4bbca91 drivers/media/platform/exynos-gsc/gsc-core.c Arnd Bergmann         2016-04-26  1121  
a2640560a0e006 drivers/media/platform/exynos-gsc/gsc-core.c Hoegeun Kwon          2017-09-13  1122  	if (drv_data == &gsc_v_100_drvdata)
a2640560a0e006 drivers/media/platform/exynos-gsc/gsc-core.c Hoegeun Kwon          2017-09-13  1123  		dev_info(dev, "compatible 'exynos5-gsc' is deprecated\n");
a2640560a0e006 drivers/media/platform/exynos-gsc/gsc-core.c Hoegeun Kwon          2017-09-13  1124  
aff093d4bbca91 drivers/media/platform/exynos-gsc/gsc-core.c Arnd Bergmann         2016-04-26  1125  	gsc->id = ret;
26a7ed9c18193d drivers/media/platform/exynos-gsc/gsc-core.c Mauro Carvalho Chehab 2016-04-13  1126  	if (gsc->id >= drv_data->num_entities) {
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang         2012-07-31  1127  		dev_err(dev, "Invalid platform device id: %d\n", gsc->id);
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang         2012-07-31  1128  		return -EINVAL;
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang         2012-07-31  1129  	}
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang         2012-07-31  1130  
92955ea0baf431 drivers/media/platform/exynos-gsc/gsc-core.c Marek Szyprowski      2016-11-09  1131  	gsc->num_clocks = drv_data->num_clocks;
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang         2012-07-31  1132  	gsc->variant = drv_data->variant[gsc->id];
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang         2012-07-31  1133  	gsc->pdev = pdev;
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang         2012-07-31  1134  
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang         2012-07-31  1135  	init_waitqueue_head(&gsc->irq_queue);
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang         2012-07-31  1136  	spin_lock_init(&gsc->slock);
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang         2012-07-31  1137  	mutex_init(&gsc->lock);
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang         2012-07-31  1138  
d9bd707c9de3d4 drivers/media/platform/exynos-gsc/gsc-core.c Cai Huoqing           2021-09-01  1139  	gsc->regs = devm_platform_ioremap_resource(pdev, 0);
f23999eccb5f1b drivers/media/platform/exynos-gsc/gsc-core.c Thierry Reding        2013-01-21  1140  	if (IS_ERR(gsc->regs))
f23999eccb5f1b drivers/media/platform/exynos-gsc/gsc-core.c Thierry Reding        2013-01-21  1141  		return PTR_ERR(gsc->regs);
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang         2012-07-31  1142  
8e12c61cb15e88 drivers/media/platform/exynos-gsc/gsc-core.c Lad Prabhakar         2022-01-11  1143  	irq = platform_get_irq(pdev, 0);
8e12c61cb15e88 drivers/media/platform/exynos-gsc/gsc-core.c Lad Prabhakar         2022-01-11  1144  	if (irq < 0)
8e12c61cb15e88 drivers/media/platform/exynos-gsc/gsc-core.c Lad Prabhakar         2022-01-11  1145  		return irq;
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang         2012-07-31  1146  
92955ea0baf431 drivers/media/platform/exynos-gsc/gsc-core.c Marek Szyprowski      2016-11-09  1147  	for (i = 0; i < gsc->num_clocks; i++) {
92955ea0baf431 drivers/media/platform/exynos-gsc/gsc-core.c Marek Szyprowski      2016-11-09  1148  		gsc->clock[i] = devm_clk_get(dev, drv_data->clk_names[i]);
92955ea0baf431 drivers/media/platform/exynos-gsc/gsc-core.c Marek Szyprowski      2016-11-09  1149  		if (IS_ERR(gsc->clock[i])) {
92955ea0baf431 drivers/media/platform/exynos-gsc/gsc-core.c Marek Szyprowski      2016-11-09  1150  			dev_err(dev, "failed to get clock: %s\n",
92955ea0baf431 drivers/media/platform/exynos-gsc/gsc-core.c Marek Szyprowski      2016-11-09  1151  				drv_data->clk_names[i]);
92955ea0baf431 drivers/media/platform/exynos-gsc/gsc-core.c Marek Szyprowski      2016-11-09  1152  			return PTR_ERR(gsc->clock[i]);
92955ea0baf431 drivers/media/platform/exynos-gsc/gsc-core.c Marek Szyprowski      2016-11-09  1153  		}
d83db90456d5d1 drivers/media/platform/exynos-gsc/gsc-core.c Ulf Hansson           2016-11-09  1154  	}
d83db90456d5d1 drivers/media/platform/exynos-gsc/gsc-core.c Ulf Hansson           2016-11-09  1155  
92955ea0baf431 drivers/media/platform/exynos-gsc/gsc-core.c Marek Szyprowski      2016-11-09  1156  	for (i = 0; i < gsc->num_clocks; i++) {
92955ea0baf431 drivers/media/platform/exynos-gsc/gsc-core.c Marek Szyprowski      2016-11-09  1157  		ret = clk_prepare_enable(gsc->clock[i]);
d83db90456d5d1 drivers/media/platform/exynos-gsc/gsc-core.c Ulf Hansson           2016-11-09  1158  		if (ret) {
92955ea0baf431 drivers/media/platform/exynos-gsc/gsc-core.c Marek Szyprowski      2016-11-09  1159  			dev_err(dev, "clock prepare failed for clock: %s\n",
92955ea0baf431 drivers/media/platform/exynos-gsc/gsc-core.c Marek Szyprowski      2016-11-09  1160  				drv_data->clk_names[i]);
92955ea0baf431 drivers/media/platform/exynos-gsc/gsc-core.c Marek Szyprowski      2016-11-09  1161  			while (--i >= 0)
92955ea0baf431 drivers/media/platform/exynos-gsc/gsc-core.c Marek Szyprowski      2016-11-09  1162  				clk_disable_unprepare(gsc->clock[i]);
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang         2012-07-31  1163  			return ret;
d83db90456d5d1 drivers/media/platform/exynos-gsc/gsc-core.c Ulf Hansson           2016-11-09  1164  		}
92955ea0baf431 drivers/media/platform/exynos-gsc/gsc-core.c Marek Szyprowski      2016-11-09  1165  	}
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang         2012-07-31  1166  
8e12c61cb15e88 drivers/media/platform/exynos-gsc/gsc-core.c Lad Prabhakar         2022-01-11  1167  	ret = devm_request_irq(dev, irq, gsc_irq_handler,
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang         2012-07-31  1168  			       0, pdev->name, gsc);
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang         2012-07-31  1169  	if (ret) {
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang         2012-07-31  1170  		dev_err(dev, "failed to install irq (%d)\n", ret);
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang         2012-07-31  1171  		goto err_clk;
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang         2012-07-31  1172  	}
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang         2012-07-31  1173  
d0b1c313499699 drivers/media/platform/exynos-gsc/gsc-core.c Arun Kumar K          2013-07-26  1174  	ret = v4l2_device_register(dev, &gsc->v4l2_dev);
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang         2012-07-31  1175  	if (ret)
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang         2012-07-31  1176  		goto err_clk;
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang         2012-07-31  1177  
d0b1c313499699 drivers/media/platform/exynos-gsc/gsc-core.c Arun Kumar K          2013-07-26  1178  	ret = gsc_register_m2m_device(gsc);
d0b1c313499699 drivers/media/platform/exynos-gsc/gsc-core.c Arun Kumar K          2013-07-26  1179  	if (ret)
d0b1c313499699 drivers/media/platform/exynos-gsc/gsc-core.c Arun Kumar K          2013-07-26  1180  		goto err_v4l2;
d0b1c313499699 drivers/media/platform/exynos-gsc/gsc-core.c Arun Kumar K          2013-07-26  1181  
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang         2012-07-31  1182  	platform_set_drvdata(pdev, gsc);
15f90ab57acc31 drivers/media/platform/exynos-gsc/gsc-core.c Ulf Hansson           2016-11-09  1183  
15f90ab57acc31 drivers/media/platform/exynos-gsc/gsc-core.c Ulf Hansson           2016-11-09  1184  	gsc_hw_set_sw_reset(gsc);
15f90ab57acc31 drivers/media/platform/exynos-gsc/gsc-core.c Ulf Hansson           2016-11-09  1185  	gsc_wait_reset(gsc);
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang         2012-07-31  1186  
712b617e5e1a90 drivers/media/platform/exynos-gsc/gsc-core.c Marek Szyprowski      2016-05-24 @1187  	vb2_dma_contig_set_max_seg_size(dev, DMA_BIT_MASK(32));
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang         2012-07-31  1188  
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang         2012-07-31  1189  	dev_dbg(dev, "gsc-%d registered successfully\n", gsc->id);
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang         2012-07-31  1190  
15f90ab57acc31 drivers/media/platform/exynos-gsc/gsc-core.c Ulf Hansson           2016-11-09  1191  	pm_runtime_set_active(dev);
15f90ab57acc31 drivers/media/platform/exynos-gsc/gsc-core.c Ulf Hansson           2016-11-09  1192  	pm_runtime_enable(dev);
15f90ab57acc31 drivers/media/platform/exynos-gsc/gsc-core.c Ulf Hansson           2016-11-09  1193  
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang         2012-07-31  1194  	return 0;
c781e4a565a679 drivers/media/platform/exynos-gsc/gsc-core.c Hans Verkuil          2016-02-15  1195  
d0b1c313499699 drivers/media/platform/exynos-gsc/gsc-core.c Arun Kumar K          2013-07-26  1196  err_v4l2:
d0b1c313499699 drivers/media/platform/exynos-gsc/gsc-core.c Arun Kumar K          2013-07-26  1197  	v4l2_device_unregister(&gsc->v4l2_dev);
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang         2012-07-31  1198  err_clk:
92955ea0baf431 drivers/media/platform/exynos-gsc/gsc-core.c Marek Szyprowski      2016-11-09  1199  	for (i = gsc->num_clocks - 1; i >= 0; i--)
92955ea0baf431 drivers/media/platform/exynos-gsc/gsc-core.c Marek Szyprowski      2016-11-09  1200  		clk_disable_unprepare(gsc->clock[i]);
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang         2012-07-31  1201  	return ret;
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang         2012-07-31  1202  }
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang         2012-07-31  1203  

:::::: The code at line 1187 was first introduced by commit
:::::: 712b617e5e1a9084917c5f6ab1ccb1456b722f51 media: set proper max seg size for devices on Exynos SoCs

:::::: TO: Marek Szyprowski <m.szyprowski@samsung.com>
:::::: CC: Sylwester Nawrocki <s.nawrocki@samsung.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
