Received: from mgamail.intel.com (unknown [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F9B18B09;
	Mon, 31 Jul 2023 15:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690818729; x=1722354729;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AwCgaiRga4ynR0erDPniE2tCSXBThldfTvVmZoD7fI8=;
  b=igXyJ7pRfIsIzkijGsNK+ZLzATCz+Z1PyEg8osz2OP6+6EIUNmMXU+Y0
   xAbWncFJKsrLOVIgQeuKqQZ1yJBIhrUBtzODMhxvM44t+V8hdFtKQaKyE
   LswbHeMTG7oXpbygB1LR7WpQN8peiXI9ExwZGlNJhBmn0ek5it7FSKegG
   2bD3NYMAyNaSL2O7+fuiTX6wy7f5181bqVgTyIBtK1en/MJtCNW1V0wa4
   fgrB9lWAaTEYaHcwddBbpbesD4GDD/g/E40IqCnVY8zISqPz5duE5/qqc
   PllA5+9sNEaZuc59aM6+R+HuU06fqhxem8CAx8I+1sZgc/pkgAvUA3Gov
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="353979545"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; 
   d="scan'208";a="353979545"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2023 08:52:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="798283466"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; 
   d="scan'208";a="798283466"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 31 Jul 2023 08:52:06 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQVBm-0005Cl-01;
	Mon, 31 Jul 2023 15:52:06 +0000
Date: Mon, 31 Jul 2023 23:52:02 +0800
From: kernel test robot <lkp@intel.com>
To: "xingtong.wu" <xingtong.wu@siemens.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>
Subject: [pdx86-platform-drivers-x86:platform-drivers-x86-simatic-ipc 13/14]
 drivers/platform/x86/siemens/simatic-ipc.c:132:42: warning: use of logical
 '||' with constant operand
Message-ID: <202307312322.Aa8upHWK-lkp@intel.com>
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
commit: b8af77951941e943434a76ef40fdc372bf95030e [13/14] platform/x86/siemens: simatic-ipc: add new models BX-56A/BX-59A
config: i386-randconfig-i011-20230731 (https://download.01.org/0day-ci/archive/20230731/202307312322.Aa8upHWK-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230731/202307312322.Aa8upHWK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307312322.Aa8upHWK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/x86/siemens/simatic-ipc.c:132:42: warning: use of logical '||' with constant operand [-Wconstant-logical-operand]
                   if (ledmode == SIMATIC_IPC_DEVICE_227G || SIMATIC_IPC_DEVICE_BX_59A)
                                                          ^  ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/siemens/simatic-ipc.c:132:42: note: use '|' for a bitwise operation
                   if (ledmode == SIMATIC_IPC_DEVICE_227G || SIMATIC_IPC_DEVICE_BX_59A)
                                                          ^~
                                                          |
   1 warning generated.


vim +132 drivers/platform/x86/siemens/simatic-ipc.c

    88	
    89	static int register_platform_devices(u32 station_id)
    90	{
    91		u8 ledmode = SIMATIC_IPC_DEVICE_NONE;
    92		u8 wdtmode = SIMATIC_IPC_DEVICE_NONE;
    93		u8 battmode = SIMATIC_IPC_DEVICE_NONE;
    94		char *pdevname;
    95		int i;
    96	
    97		for (i = 0; i < ARRAY_SIZE(device_modes); i++) {
    98			if (device_modes[i].station_id == station_id) {
    99				ledmode = device_modes[i].led_mode;
   100				wdtmode = device_modes[i].wdt_mode;
   101				battmode = device_modes[i].batt_mode;
   102				break;
   103			}
   104		}
   105	
   106		if (battmode != SIMATIC_IPC_DEVICE_NONE) {
   107			pdevname = KBUILD_MODNAME "_batt";
   108			if (battmode == SIMATIC_IPC_DEVICE_127E)
   109				pdevname = KBUILD_MODNAME "_batt_apollolake";
   110			if (battmode == SIMATIC_IPC_DEVICE_BX_21A)
   111				pdevname = KBUILD_MODNAME "_batt_elkhartlake";
   112			if (battmode == SIMATIC_IPC_DEVICE_227G ||
   113			    battmode == SIMATIC_IPC_DEVICE_BX_39A ||
   114			    battmode == SIMATIC_IPC_DEVICE_BX_59A)
   115				pdevname = KBUILD_MODNAME "_batt_f7188x";
   116			platform_data.devmode = battmode;
   117			ipc_batt_platform_device =
   118				platform_device_register_data(NULL, pdevname,
   119					PLATFORM_DEVID_NONE, &platform_data,
   120					sizeof(struct simatic_ipc_platform));
   121			if (IS_ERR(ipc_batt_platform_device))
   122				return PTR_ERR(ipc_batt_platform_device);
   123	
   124			pr_debug("device=%s created\n",
   125				 ipc_batt_platform_device->name);
   126		}
   127	
   128		if (ledmode != SIMATIC_IPC_DEVICE_NONE) {
   129			pdevname = KBUILD_MODNAME "_leds";
   130			if (ledmode == SIMATIC_IPC_DEVICE_127E)
   131				pdevname = KBUILD_MODNAME "_leds_gpio_apollolake";
 > 132			if (ledmode == SIMATIC_IPC_DEVICE_227G || SIMATIC_IPC_DEVICE_BX_59A)
   133				pdevname = KBUILD_MODNAME "_leds_gpio_f7188x";
   134			if (ledmode == SIMATIC_IPC_DEVICE_BX_21A)
   135				pdevname = KBUILD_MODNAME "_leds_gpio_elkhartlake";
   136			platform_data.devmode = ledmode;
   137			ipc_led_platform_device =
   138				platform_device_register_data(NULL,
   139					pdevname, PLATFORM_DEVID_NONE,
   140					&platform_data,
   141					sizeof(struct simatic_ipc_platform));
   142			if (IS_ERR(ipc_led_platform_device))
   143				return PTR_ERR(ipc_led_platform_device);
   144	
   145			pr_debug("device=%s created\n",
   146				 ipc_led_platform_device->name);
   147		}
   148	
   149		if (wdtmode != SIMATIC_IPC_DEVICE_NONE) {
   150			platform_data.devmode = wdtmode;
   151			ipc_wdt_platform_device =
   152				platform_device_register_data(NULL,
   153					KBUILD_MODNAME "_wdt", PLATFORM_DEVID_NONE,
   154					&platform_data,
   155					sizeof(struct simatic_ipc_platform));
   156			if (IS_ERR(ipc_wdt_platform_device))
   157				return PTR_ERR(ipc_wdt_platform_device);
   158	
   159			pr_debug("device=%s created\n",
   160				 ipc_wdt_platform_device->name);
   161		}
   162	
   163		if (ledmode == SIMATIC_IPC_DEVICE_NONE &&
   164		    wdtmode == SIMATIC_IPC_DEVICE_NONE &&
   165		    battmode == SIMATIC_IPC_DEVICE_NONE) {
   166			pr_warn("unsupported IPC detected, station id=%08x\n",
   167				station_id);
   168			return -EINVAL;
   169		}
   170	
   171		return 0;
   172	}
   173	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
