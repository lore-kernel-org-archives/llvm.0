Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E23913700;
	Fri, 14 Jul 2023 12:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689336228; x=1720872228;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JsgHXv3cfAB85r9ISOluj/yevys1pI9guTagMR00yhc=;
  b=bPcdIKq0lgPdRDA9hYuWWSopC8hzR2LC+4TlZtf3dkDk59vEWXeq7t+3
   jeSe2qEe0oM4VRbTuoNqewug5NhxdyaGGS4zkBoNmze44HnUzWrYMqCEV
   vapSchSiUjajufwxkxaPVNTZ6LaBIgksNVXbm0+SyoJ+IagBqEH/ZwCfl
   Wu2iWSFgvlpvcBPjLHUzHtBf1DYkxw1wsZzyjg4hwNVyeyIrNLHvTbETI
   6LhKWaQ3PCGy60ifnzHO19fVQiXk8tfP1lOYEUoL8L47rfvrkdZdMED3x
   iF0x2sOGVbmV2hZAia5wtvZyj8po9h6RWKvK2bbVchT3jDN1hg7ZcNXp8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="345772610"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; 
   d="scan'208";a="345772610"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2023 05:02:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="725687360"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; 
   d="scan'208";a="725687360"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 14 Jul 2023 05:02:32 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKHVI-0007QH-0K;
	Fri, 14 Jul 2023 12:02:32 +0000
Date: Fri, 14 Jul 2023 20:01:46 +0800
From: kernel test robot <lkp@intel.com>
To: Henning Schild <henning.schild@siemens.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>
Subject: [pdx86-platform-drivers-x86:platform-drivers-x86-simatic-ipc 3/7]
 drivers/platform/x86/simatic-ipc-batt.c:152:5: warning: no previous
 prototype for function 'simatic_ipc_batt_remove'
Message-ID: <202307141920.qk4FY4D6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git platform-drivers-x86-simatic-ipc
head:   161c6512536100ae4919032ef6f1132621794e01
commit: ad90535e51415fb636054649b5894447a984496e [3/7] platform/x86: simatic-ipc: add CMOS battery monitoring
config: i386-randconfig-r021-20230714 (https://download.01.org/0day-ci/archive/20230714/202307141920.qk4FY4D6-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307141920.qk4FY4D6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307141920.qk4FY4D6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/x86/simatic-ipc-batt.c:152:5: warning: no previous prototype for function 'simatic_ipc_batt_remove' [-Wmissing-prototypes]
   int simatic_ipc_batt_remove(struct platform_device *pdev, struct gpiod_lookup_table *table)
       ^
   drivers/platform/x86/simatic-ipc-batt.c:152:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int simatic_ipc_batt_remove(struct platform_device *pdev, struct gpiod_lookup_table *table)
   ^
   static 
>> drivers/platform/x86/simatic-ipc-batt.c:159:5: warning: no previous prototype for function 'simatic_ipc_batt_probe' [-Wmissing-prototypes]
   int simatic_ipc_batt_probe(struct platform_device *pdev, struct gpiod_lookup_table *table)
       ^
   drivers/platform/x86/simatic-ipc-batt.c:159:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int simatic_ipc_batt_probe(struct platform_device *pdev, struct gpiod_lookup_table *table)
   ^
   static 
   2 warnings generated.


vim +/simatic_ipc_batt_remove +152 drivers/platform/x86/simatic-ipc-batt.c

   151	
 > 152	int simatic_ipc_batt_remove(struct platform_device *pdev, struct gpiod_lookup_table *table)
   153	{
   154		gpiod_remove_lookup_table(table);
   155		return 0;
   156	}
   157	EXPORT_SYMBOL_GPL(simatic_ipc_batt_remove);
   158	
 > 159	int simatic_ipc_batt_probe(struct platform_device *pdev, struct gpiod_lookup_table *table)
   160	{
   161		struct simatic_ipc_platform *plat;
   162		struct device *dev = &pdev->dev;
   163		struct device *hwmon_dev;
   164		int err;
   165	
   166		plat = pdev->dev.platform_data;
   167		priv.devmode = plat->devmode;
   168	
   169		switch (priv.devmode) {
   170		case SIMATIC_IPC_DEVICE_127E:
   171		case SIMATIC_IPC_DEVICE_227G:
   172		case SIMATIC_IPC_DEVICE_BX_39A:
   173		case SIMATIC_IPC_DEVICE_BX_21A:
   174			table->dev_id = dev_name(dev);
   175			gpiod_add_lookup_table(table);
   176			break;
   177		case SIMATIC_IPC_DEVICE_227E:
   178			goto nogpio;
   179		default:
   180			return -ENODEV;
   181		}
   182	
   183		priv.gpios[0] = devm_gpiod_get_index(dev, "CMOSBattery empty", 0, GPIOD_IN);
   184		if (IS_ERR(priv.gpios[0])) {
   185			err = PTR_ERR(priv.gpios[0]);
   186			priv.gpios[0] = NULL;
   187			goto out;
   188		}
   189		priv.gpios[1] = devm_gpiod_get_index(dev, "CMOSBattery low", 1, GPIOD_IN);
   190		if (IS_ERR(priv.gpios[1])) {
   191			err = PTR_ERR(priv.gpios[1]);
   192			priv.gpios[1] = NULL;
   193			goto out;
   194		}
   195	
   196		if (table->table[2].key) {
   197			priv.gpios[2] = devm_gpiod_get_index(dev, "CMOSBattery meter", 2, GPIOD_OUT_HIGH);
   198			if (IS_ERR(priv.gpios[2])) {
   199				err = PTR_ERR(priv.gpios[1]);
   200				priv.gpios[2] = NULL;
   201				goto out;
   202			}
   203		} else {
   204			priv.gpios[2] = NULL;
   205		}
   206	
   207	nogpio:
   208		hwmon_dev = devm_hwmon_device_register_with_info(dev, KBUILD_MODNAME,
   209								 &priv,
   210								 &simatic_ipc_batt_chip_info,
   211								 NULL);
   212		if (IS_ERR(hwmon_dev)) {
   213			err = PTR_ERR(hwmon_dev);
   214			goto out;
   215		}
   216	
   217		/* warn about aging battery even if userspace never reads hwmon */
   218		simatic_ipc_batt_read_value(dev);
   219	
   220		return 0;
   221	out:
   222		simatic_ipc_batt_remove(pdev, table);
   223	
   224		return err;
   225	}
   226	EXPORT_SYMBOL_GPL(simatic_ipc_batt_probe);
   227	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
