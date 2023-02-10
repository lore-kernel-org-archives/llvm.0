Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946002FAF;
	Fri, 10 Feb 2023 22:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676066811; x=1707602811;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O9P1w/QZ33+RMAO4CSX0SlUzZLoKmRK673LUORk0R28=;
  b=kcRMIUkBkXqIDht/kKWEcfp+yIh+52XADIQAa5cNUCplthC5EwZ53yUa
   KhyRtSRyO0GrfDVEzdT2rlrN07V2qkKC1KSd5+0JRLcKKkp2MCTli0i/I
   vetln5CFnIg60Hc7aA5gEJp5VZUciPmkhsK/PMCPhb2fH1h59mA3MHVxD
   GunP+SFdW3+n9LFvBpC9wdmt0cdsgffZn6KrQd8RumYYIqBLaVnErUoYF
   sEwDaUb9TFMsxgG3NMzYdJS/yxslmAAC9v0WfB4osBz35ACyYhdmPaQ9U
   sX++kHmvYVuvBBW70sX9VaaMyzm/3IjvsSHWi1g5GfMSD+PcGwyyX1/gV
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="330547281"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="330547281"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 14:06:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="842156341"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="842156341"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 10 Feb 2023 14:06:48 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQbXb-00064b-2h;
	Fri, 10 Feb 2023 22:06:47 +0000
Date: Sat, 11 Feb 2023 06:05:48 +0800
From: kernel test robot <lkp@intel.com>
To: Vadim Pasternak <vadimp@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Michael Shych <michaelsh@nvidia.com>
Subject: [pdx86-platform-drivers-x86:review-hans 87/95]
 drivers/platform/x86/mlx-platform.c:6121:6: warning: variable 'i' is used
 uninitialized whenever 'if' condition is true
Message-ID: <202302110540.FZjgLSkT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-hans
head:   3d2b74966d612002ad6618c9b0b75c5ef871edf9
commit: cbf3f15f51c5a73cb039ff5f60bceb8ea4562dd2 [87/95] platform: mellanox: Split logic in init and exit flow
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20230211/202302110540.FZjgLSkT-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/commit/?id=cbf3f15f51c5a73cb039ff5f60bceb8ea4562dd2
        git remote add pdx86-platform-drivers-x86 https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git
        git fetch --no-tags pdx86-platform-drivers-x86 review-hans
        git checkout cbf3f15f51c5a73cb039ff5f60bceb8ea4562dd2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/platform/x86/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302110540.FZjgLSkT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/x86/mlx-platform.c:6121:6: warning: variable 'i' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (err)
               ^~~
   drivers/platform/x86/mlx-platform.c:6140:11: note: uninitialized use occurs here
           while (--i >= 0)
                    ^
   drivers/platform/x86/mlx-platform.c:6121:2: note: remove the 'if' if its condition is always false
           if (err)
           ^~~~~~~~
   drivers/platform/x86/mlx-platform.c:6062:7: note: initialize the variable 'i' to silence this warning
           int i, err;
                ^
                 = 0
   1 warning generated.


vim +6121 drivers/platform/x86/mlx-platform.c

0170f616f496fc drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2023-02-08  6059  
cbf3f15f51c5a7 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2023-02-08  6060  static int mlxplat_post_init(struct mlxplat_priv *priv)
58cbbee2391ce3 arch/x86/platform/mellanox/mlx-platform.c Vadim Pasternak 2016-09-22  6061  {
cbf3f15f51c5a7 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2023-02-08  6062  	int i, err;
58cbbee2391ce3 arch/x86/platform/mellanox/mlx-platform.c Vadim Pasternak 2016-09-22  6063  
6b266e91a0715d drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2019-06-23  6064  	/* Add hotplug driver */
e05d6b658fcd98 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2022-07-11  6065  	if (mlxplat_hotplug) {
6b266e91a0715d drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2019-06-23  6066  		mlxplat_hotplug->regmap = priv->regmap;
e05d6b658fcd98 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2022-07-11  6067  		priv->pdev_hotplug =
e05d6b658fcd98 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2022-07-11  6068  		platform_device_register_resndata(&mlxplat_dev->dev,
e05d6b658fcd98 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2022-07-11  6069  						  "mlxreg-hotplug", PLATFORM_DEVID_NONE,
0170f616f496fc drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2023-02-08  6070  						  priv->hotplug_resources,
0170f616f496fc drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2023-02-08  6071  						  priv->hotplug_resources_size,
afc4715901f0dc drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2016-10-27  6072  						  mlxplat_hotplug, sizeof(*mlxplat_hotplug));
afc4715901f0dc drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2016-10-27  6073  		if (IS_ERR(priv->pdev_hotplug)) {
afc4715901f0dc drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2016-10-27  6074  			err = PTR_ERR(priv->pdev_hotplug);
cbf3f15f51c5a7 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2023-02-08  6075  			goto fail_platform_hotplug_register;
e05d6b658fcd98 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2022-07-11  6076  		}
8871f5e4234112 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2018-06-17  6077  	}
8871f5e4234112 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2018-06-17  6078  
1189456b1cce36 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2018-05-07  6079  	/* Add LED driver. */
e05d6b658fcd98 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2022-07-11  6080  	if (mlxplat_led) {
6b266e91a0715d drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2019-06-23  6081  		mlxplat_led->regmap = priv->regmap;
e05d6b658fcd98 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2022-07-11  6082  		priv->pdev_led =
e05d6b658fcd98 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2022-07-11  6083  		platform_device_register_resndata(&mlxplat_dev->dev, "leds-mlxreg",
e05d6b658fcd98 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2022-07-11  6084  						  PLATFORM_DEVID_NONE, NULL, 0, mlxplat_led,
e05d6b658fcd98 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2022-07-11  6085  						  sizeof(*mlxplat_led));
1189456b1cce36 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2018-05-07  6086  		if (IS_ERR(priv->pdev_led)) {
1189456b1cce36 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2018-05-07  6087  			err = PTR_ERR(priv->pdev_led);
cbf3f15f51c5a7 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2023-02-08  6088  			goto fail_platform_leds_register;
1189456b1cce36 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2018-05-07  6089  		}
e05d6b658fcd98 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2022-07-11  6090  	}
1189456b1cce36 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2018-05-07  6091  
8871f5e4234112 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2018-06-17  6092  	/* Add registers io access driver. */
8871f5e4234112 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2018-06-17  6093  	if (mlxplat_regs_io) {
6b266e91a0715d drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2019-06-23  6094  		mlxplat_regs_io->regmap = priv->regmap;
e05d6b658fcd98 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2022-07-11  6095  		priv->pdev_io_regs = platform_device_register_resndata(&mlxplat_dev->dev,
e05d6b658fcd98 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2022-07-11  6096  								       "mlxreg-io",
e05d6b658fcd98 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2022-07-11  6097  								       PLATFORM_DEVID_NONE, NULL,
e05d6b658fcd98 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2022-07-11  6098  								       0, mlxplat_regs_io,
8871f5e4234112 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2018-06-17  6099  								       sizeof(*mlxplat_regs_io));
8871f5e4234112 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2018-06-17  6100  		if (IS_ERR(priv->pdev_io_regs)) {
8871f5e4234112 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2018-06-17  6101  			err = PTR_ERR(priv->pdev_io_regs);
cbf3f15f51c5a7 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2023-02-08  6102  			goto fail_platform_io_register;
8871f5e4234112 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2018-06-17  6103  		}
8871f5e4234112 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2018-06-17  6104  	}
8871f5e4234112 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2018-06-17  6105  
0378123c580091 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2018-07-26  6106  	/* Add FAN driver. */
0378123c580091 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2018-07-26  6107  	if (mlxplat_fan) {
6b266e91a0715d drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2019-06-23  6108  		mlxplat_fan->regmap = priv->regmap;
7bf8a14dedaf9a drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2022-07-11  6109  		priv->pdev_fan = platform_device_register_resndata(&mlxplat_dev->dev, "mlxreg-fan",
0378123c580091 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2018-07-26  6110  								   PLATFORM_DEVID_NONE, NULL, 0,
0378123c580091 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2018-07-26  6111  								   mlxplat_fan,
0378123c580091 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2018-07-26  6112  								   sizeof(*mlxplat_fan));
207da7128a6d61 drivers/platform/x86/mlx-platform.c       Wei Yongjun     2018-08-08  6113  		if (IS_ERR(priv->pdev_fan)) {
207da7128a6d61 drivers/platform/x86/mlx-platform.c       Wei Yongjun     2018-08-08  6114  			err = PTR_ERR(priv->pdev_fan);
cbf3f15f51c5a7 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2023-02-08  6115  			goto fail_platform_fan_register;
0378123c580091 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2018-07-26  6116  		}
0378123c580091 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2018-07-26  6117  	}
0378123c580091 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2018-07-26  6118  
9b9f2f5416ef24 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2019-03-18  6119  	/* Add WD drivers. */
7772b993fd96dc drivers/platform/x86/mlx-platform.c       Michael Shych   2020-05-04  6120  	err = mlxplat_mlxcpld_check_wd_capability(priv->regmap);
7772b993fd96dc drivers/platform/x86/mlx-platform.c       Michael Shych   2020-05-04 @6121  	if (err)
7772b993fd96dc drivers/platform/x86/mlx-platform.c       Michael Shych   2020-05-04  6122  		goto fail_platform_wd_register;
cbf3f15f51c5a7 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2023-02-08  6123  	for (i = 0; i < MLXPLAT_CPLD_WD_MAX_DEVS; i++) {
cbf3f15f51c5a7 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2023-02-08  6124  		if (mlxplat_wd_data[i]) {
cbf3f15f51c5a7 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2023-02-08  6125  			mlxplat_wd_data[i]->regmap = priv->regmap;
cbf3f15f51c5a7 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2023-02-08  6126  			priv->pdev_wd[i] =
cbf3f15f51c5a7 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2023-02-08  6127  				platform_device_register_resndata(&mlxplat_dev->dev, "mlx-wdt", i,
cbf3f15f51c5a7 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2023-02-08  6128  								  NULL, 0, mlxplat_wd_data[i],
cbf3f15f51c5a7 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2023-02-08  6129  								  sizeof(*mlxplat_wd_data[i]));
cbf3f15f51c5a7 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2023-02-08  6130  			if (IS_ERR(priv->pdev_wd[i])) {
cbf3f15f51c5a7 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2023-02-08  6131  				err = PTR_ERR(priv->pdev_wd[i]);
9b9f2f5416ef24 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2019-03-18  6132  				goto fail_platform_wd_register;
9b9f2f5416ef24 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2019-03-18  6133  			}
9b9f2f5416ef24 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2019-03-18  6134  		}
9b9f2f5416ef24 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2019-03-18  6135  	}
9b9f2f5416ef24 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2019-03-18  6136  
58cbbee2391ce3 arch/x86/platform/mellanox/mlx-platform.c Vadim Pasternak 2016-09-22  6137  	return 0;
58cbbee2391ce3 arch/x86/platform/mellanox/mlx-platform.c Vadim Pasternak 2016-09-22  6138  
9b9f2f5416ef24 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2019-03-18  6139  fail_platform_wd_register:
cbf3f15f51c5a7 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2023-02-08  6140  	while (--i >= 0)
cbf3f15f51c5a7 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2023-02-08  6141  		platform_device_unregister(priv->pdev_wd[i]);
cbf3f15f51c5a7 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2023-02-08  6142  fail_platform_fan_register:
8871f5e4234112 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2018-06-17  6143  	if (mlxplat_regs_io)
8871f5e4234112 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2018-06-17  6144  		platform_device_unregister(priv->pdev_io_regs);
cbf3f15f51c5a7 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2023-02-08  6145  fail_platform_io_register:
e05d6b658fcd98 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2022-07-11  6146  	if (mlxplat_led)
1189456b1cce36 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2018-05-07  6147  		platform_device_unregister(priv->pdev_led);
cbf3f15f51c5a7 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2023-02-08  6148  fail_platform_leds_register:
e05d6b658fcd98 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2022-07-11  6149  	if (mlxplat_hotplug)
4726098bcc4cf0 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2018-01-31  6150  		platform_device_unregister(priv->pdev_hotplug);
cbf3f15f51c5a7 drivers/platform/x86/mlx-platform.c       Vadim Pasternak 2023-02-08  6151  fail_platform_hotplug_register:
58cbbee2391ce3 arch/x86/platform/mellanox/mlx-platform.c Vadim Pasternak 2016-09-22  6152  	return err;
58cbbee2391ce3 arch/x86/platform/mellanox/mlx-platform.c Vadim Pasternak 2016-09-22  6153  }
58cbbee2391ce3 arch/x86/platform/mellanox/mlx-platform.c Vadim Pasternak 2016-09-22  6154  

:::::: The code at line 6121 was first introduced by commit
:::::: 7772b993fd96dc8f776356b1d5e18a4df7e68268 platform/x86: mlx-platform: support new watchdog type with longer timeout

:::::: TO: Michael Shych <michaelsh@mellanox.com>
:::::: CC: Wim Van Sebroeck <wim@linux-watchdog.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
