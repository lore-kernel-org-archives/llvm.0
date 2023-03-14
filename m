Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6592565;
	Tue, 14 Mar 2023 07:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678777902; x=1710313902;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b0RM/JUYeukM56+WMN0VerqwwPJwHTFYvLnrABCjLQM=;
  b=fFcIMeleU0OyUdFwOe/g44fD4j4gy/qZSrYlXkiDJ3YHFMG2C+08tyRV
   t68bjvWCjAlq+Wl6AxYaPUkn/lW+Uu8WjTfojeBdx7oPshVPLrbO2t49c
   Wkm748LWmKf6R17x3C7KWhDcn9Ol2oK0tBZwiKDCYAcHxhxMG9YbUf6vL
   dqfR+mRdqhljywpJiwcVMuT28dQavyDBnvVRJNCPxhmmsMtFJ+l2h/Oge
   /XCT4Hsrrz7XB0k54AV/FXcDF13uP9RPhK1cVvm2U3SzGZCvRAgjrD4Ze
   597OwDR1/9u71Eh+Fg7TaHf45WLkx56DMhe9QAS7e/rIOXCIv2ztrE0kS
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="338893925"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="338893925"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 00:11:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="672228057"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="672228057"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 14 Mar 2023 00:11:22 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbyob-0006eW-3B;
	Tue, 14 Mar 2023 07:11:21 +0000
Date: Tue, 14 Mar 2023 15:10:24 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sasha Levin <sashal@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>
Subject: [linux-stable-rc:queue/5.10 67/74] drivers/pci/pci-driver.c:1297:2:
 error: implicit declaration of function 'pci_restore_standard_config'
Message-ID: <202303141554.HvEmVkNC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/5.10
head:   2e9a706c2ad072a55cca9dada43ca479f763b092
commit: 318310047942ab701d3777700b0bb1d134d018dc [67/74] PCI/PM: Define pci_restore_standard_config() only for CONFIG_PM_SLEEP
config: x86_64-randconfig-r014-20230313 (https://download.01.org/0day-ci/archive/20230314/202303141554.HvEmVkNC-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=318310047942ab701d3777700b0bb1d134d018dc
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/5.10
        git checkout 318310047942ab701d3777700b0bb1d134d018dc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303141554.HvEmVkNC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pci/pci-driver.c:1297:2: error: implicit declaration of function 'pci_restore_standard_config' [-Werror,-Wimplicit-function-declaration]
           pci_restore_standard_config(pci_dev);
           ^
   1 error generated.


vim +/pci_restore_standard_config +1297 drivers/pci/pci-driver.c

6cbf82148ff286 Rafael J. Wysocki 2010-02-17  1284  
6cbf82148ff286 Rafael J. Wysocki 2010-02-17  1285  static int pci_pm_runtime_resume(struct device *dev)
6cbf82148ff286 Rafael J. Wysocki 2010-02-17  1286  {
6cbf82148ff286 Rafael J. Wysocki 2010-02-17  1287  	struct pci_dev *pci_dev = to_pci_dev(dev);
6cbf82148ff286 Rafael J. Wysocki 2010-02-17  1288  	const struct dev_pm_ops *pm = dev->driver ? dev->driver->pm : NULL;
ad9001f2f41198 Mika Westerberg   2019-11-12  1289  	pci_power_t prev_state = pci_dev->current_state;
6da2f2ccfd2deb Bjorn Helgaas     2019-10-14  1290  	int error = 0;
6cbf82148ff286 Rafael J. Wysocki 2010-02-17  1291  
967577b062417b Huang Ying        2012-11-20  1292  	/*
5775b843a619b3 Rafael J. Wysocki 2018-03-03  1293  	 * Restoring config space is necessary even if the device is not bound
5775b843a619b3 Rafael J. Wysocki 2018-03-03  1294  	 * to a driver because although we left it in D0, it may have gone to
5775b843a619b3 Rafael J. Wysocki 2018-03-03  1295  	 * D3cold when the bridge above it runtime suspended.
967577b062417b Huang Ying        2012-11-20  1296  	 */
5775b843a619b3 Rafael J. Wysocki 2018-03-03 @1297  	pci_restore_standard_config(pci_dev);
5775b843a619b3 Rafael J. Wysocki 2018-03-03  1298  
967577b062417b Huang Ying        2012-11-20  1299  	if (!pci_dev->driver)
967577b062417b Huang Ying        2012-11-20  1300  		return 0;
967577b062417b Huang Ying        2012-11-20  1301  
db288c9c5f9db4 Rafael J. Wysocki 2012-07-05  1302  	pci_fixup_device(pci_fixup_resume_early, pci_dev);
f7b32a86e455b0 Bjorn Helgaas     2019-10-12  1303  	pci_pm_default_resume(pci_dev);
6cbf82148ff286 Rafael J. Wysocki 2010-02-17  1304  
ad9001f2f41198 Mika Westerberg   2019-11-12  1305  	if (prev_state == PCI_D3cold)
ad9001f2f41198 Mika Westerberg   2019-11-12  1306  		pci_bridge_wait_for_secondary_bus(pci_dev);
ad9001f2f41198 Mika Westerberg   2019-11-12  1307  
c5eb1190074cfb Jarkko Nikula     2018-10-23  1308  	if (pm && pm->runtime_resume)
6da2f2ccfd2deb Bjorn Helgaas     2019-10-14  1309  		error = pm->runtime_resume(dev);
448bd857d48e69 Huang Ying        2012-06-23  1310  
448bd857d48e69 Huang Ying        2012-06-23  1311  	pci_dev->runtime_d3cold = false;
448bd857d48e69 Huang Ying        2012-06-23  1312  
6da2f2ccfd2deb Bjorn Helgaas     2019-10-14  1313  	return error;
6cbf82148ff286 Rafael J. Wysocki 2010-02-17  1314  }
6cbf82148ff286 Rafael J. Wysocki 2010-02-17  1315  

:::::: The code at line 1297 was first introduced by commit
:::::: 5775b843a619b3c93f946e2b55a208d9f0f48b59 PCI: Restore config space on runtime resume despite being unbound

:::::: TO: Rafael J. Wysocki <rjw@rjwysocki.net>
:::::: CC: Lukas Wunner <lukas@wunner.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
