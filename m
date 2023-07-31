Received: from mgamail.intel.com (unknown [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C24D8BEE;
	Mon, 31 Jul 2023 16:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690821356; x=1722357356;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RmJodSjWcULdIZak6XtsS/mpAC+QhImXei7PEr63LRw=;
  b=WbHFCXFQdirdH6vVNkOgUWz73A2nhM3xes3YtMGdzuCzbrwH57ES3S9J
   0QJOikHWMYghHCmVciVyZe9MY7A7y4uv1pY1lCNikyYaEubcIEryuhYTd
   8003b+sKZJo7qj7kk3iJGqXHakgpmXfkVrJflhgYyWxwGSCtnqx5k4NWu
   sagCIqOefpyVDo+QE7VW7LXreqxfxEq4DsIKpZI1v1xKvukJdCxc0Ttnf
   OlqLcbsM/bUgnHlDJu+1JT7uqjUiG+bI7tmw7c1eotdVOFF9pBne2wb4C
   9tTQr1huXhDfBHfZRtPmTJYNynuol/mf988F9forhjnRC74cOLLUsLKlN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="353997271"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; 
   d="scan'208";a="353997271"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2023 09:33:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="757987742"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; 
   d="scan'208";a="757987742"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 31 Jul 2023 09:33:37 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQVpv-0005EN-2o;
	Mon, 31 Jul 2023 16:33:35 +0000
Date: Tue, 1 Aug 2023 00:32:44 +0800
From: kernel test robot <lkp@intel.com>
To: "xingtong.wu" <xingtong.wu@siemens.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>
Subject: [pdx86-platform-drivers-x86:platform-drivers-x86-simatic-ipc 14/14]
 drivers/platform/x86/siemens/simatic-ipc-batt.c:197:49: warning: use of
 logical '||' with constant operand
Message-ID: <202308010001.BGYCSQrl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git platform-drivers-x86-simatic-ipc
head:   c56beff2037549c951042d178de75e535818a98a
commit: c56beff2037549c951042d178de75e535818a98a [14/14] platform/x86/siemens: simatic-ipc-batt: add support for module BX-59A
config: i386-randconfig-i011-20230731 (https://download.01.org/0day-ci/archive/20230801/202308010001.BGYCSQrl-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230801/202308010001.BGYCSQrl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308010001.BGYCSQrl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/x86/siemens/simatic-ipc-batt.c:197:49: warning: use of logical '||' with constant operand [-Wconstant-logical-operand]
                   if (priv.devmode == SIMATIC_IPC_DEVICE_BX_21A || SIMATIC_IPC_DEVICE_BX_59A)
                                                                 ^  ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/siemens/simatic-ipc-batt.c:197:49: note: use '|' for a bitwise operation
                   if (priv.devmode == SIMATIC_IPC_DEVICE_BX_21A || SIMATIC_IPC_DEVICE_BX_59A)
                                                                 ^~
                                                                 |
   1 warning generated.


vim +197 drivers/platform/x86/siemens/simatic-ipc-batt.c

   155	
   156	int simatic_ipc_batt_probe(struct platform_device *pdev, struct gpiod_lookup_table *table)
   157	{
   158		struct simatic_ipc_platform *plat;
   159		struct device *dev = &pdev->dev;
   160		struct device *hwmon_dev;
   161		unsigned long flags;
   162		int err;
   163	
   164		plat = pdev->dev.platform_data;
   165		priv.devmode = plat->devmode;
   166	
   167		switch (priv.devmode) {
   168		case SIMATIC_IPC_DEVICE_127E:
   169		case SIMATIC_IPC_DEVICE_227G:
   170		case SIMATIC_IPC_DEVICE_BX_39A:
   171		case SIMATIC_IPC_DEVICE_BX_21A:
   172		case SIMATIC_IPC_DEVICE_BX_59A:
   173			table->dev_id = dev_name(dev);
   174			gpiod_add_lookup_table(table);
   175			break;
   176		case SIMATIC_IPC_DEVICE_227E:
   177			goto nogpio;
   178		default:
   179			return -ENODEV;
   180		}
   181	
   182		priv.gpios[0] = devm_gpiod_get_index(dev, "CMOSBattery empty", 0, GPIOD_IN);
   183		if (IS_ERR(priv.gpios[0])) {
   184			err = PTR_ERR(priv.gpios[0]);
   185			priv.gpios[0] = NULL;
   186			goto out;
   187		}
   188		priv.gpios[1] = devm_gpiod_get_index(dev, "CMOSBattery low", 1, GPIOD_IN);
   189		if (IS_ERR(priv.gpios[1])) {
   190			err = PTR_ERR(priv.gpios[1]);
   191			priv.gpios[1] = NULL;
   192			goto out;
   193		}
   194	
   195		if (table->table[2].key) {
   196			flags = GPIOD_OUT_HIGH;
 > 197			if (priv.devmode == SIMATIC_IPC_DEVICE_BX_21A || SIMATIC_IPC_DEVICE_BX_59A)
   198				flags = GPIOD_OUT_LOW;
   199			priv.gpios[2] = devm_gpiod_get_index(dev, "CMOSBattery meter", 2, flags);
   200			if (IS_ERR(priv.gpios[2])) {
   201				err = PTR_ERR(priv.gpios[1]);
   202				priv.gpios[2] = NULL;
   203				goto out;
   204			}
   205		} else {
   206			priv.gpios[2] = NULL;
   207		}
   208	
   209	nogpio:
   210		hwmon_dev = devm_hwmon_device_register_with_info(dev, KBUILD_MODNAME,
   211								 &priv,
   212								 &simatic_ipc_batt_chip_info,
   213								 NULL);
   214		if (IS_ERR(hwmon_dev)) {
   215			err = PTR_ERR(hwmon_dev);
   216			goto out;
   217		}
   218	
   219		/* warn about aging battery even if userspace never reads hwmon */
   220		simatic_ipc_batt_read_value(dev);
   221	
   222		return 0;
   223	out:
   224		simatic_ipc_batt_remove(pdev, table);
   225	
   226		return err;
   227	}
   228	EXPORT_SYMBOL_GPL(simatic_ipc_batt_probe);
   229	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
