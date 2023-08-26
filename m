Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2305581E;
	Sat, 26 Aug 2023 06:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693030121; x=1724566121;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=neAxyf2cHVtg9QQF5swpcndy7EY6M9t8T21MbiT31Bs=;
  b=jXtttgQmYINRGupOe72QgFQHbIr8PT8cyTJP4MNLPaDa/8emSs9iM7+S
   ZlKqAgD4Ta1Oz2x2Zjcr3RuBoeTbPPIQmsvZ+yCWvTbNJ6Rj7+DF2+KFC
   Es8ZJmA9nBHNceTY+/zXYww3FVyWlVQ/UM5rKCfvRXCwmhV8L1nBcHafB
   VDbLzINv/wEPvFDisfGslBOmLD54zb1Y4Fk2DMWN+Tq6bnmmp2ZCHp+R5
   //RQoN7IX4Bi/sbSh11cndCsvVxjWMl1lkIvGBvZxG3asNTOQxDWBHBbO
   V5LeST+DvH4aJcPunaJgojEyf+/+8ify173I6E29WWaqsJfw5JgTuuiFw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="438793981"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="438793981"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 23:08:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="803171577"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="803171577"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 25 Aug 2023 23:08:38 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZmSS-0004PL-17;
	Sat, 26 Aug 2023 06:07:51 +0000
Date: Sat, 26 Aug 2023 14:06:52 +0800
From: kernel test robot <lkp@intel.com>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [esmil:jh7110 69/80]
 drivers/pci/controller/plda/pcie-microchip-host.c:865:32: warning: cast from
 'void (*)(struct clk *)' to 'void (*)(void *)' converts to incompatible
 function type
Message-ID: <202308261443.sh83JGV7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux jh7110
head:   6a2688d7878cc6ba3ca037cac91659a45c1f3c0e
commit: fa90a1aea29df94923ba7e58cdc94e954ff0da1b [69/80] PCI: microchip: Move pcie-microchip-host.c to plda directory
config: arm64-randconfig-r011-20230826 (https://download.01.org/0day-ci/archive/20230826/202308261443.sh83JGV7-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308261443.sh83JGV7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308261443.sh83JGV7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/controller/plda/pcie-microchip-host.c:865:32: warning: cast from 'void (*)(struct clk *)' to 'void (*)(void *)' converts to incompatible function type [-Wcast-function-type-strict]
     865 |         devm_add_action_or_reset(dev, (void (*) (void *))clk_disable_unprepare,
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:381:38: note: expanded from macro 'devm_add_action_or_reset'
     381 |         __devm_add_action_or_reset(release, action, data, #action)
         |                                             ^~~~~~
   1 warning generated.


vim +865 drivers/pci/controller/plda/pcie-microchip-host.c

6f15a9c9f94133 drivers/pci/controller/pcie-microchip-host.c Daire McNamara 2021-01-25  849  
6f15a9c9f94133 drivers/pci/controller/pcie-microchip-host.c Daire McNamara 2021-01-25  850  static inline struct clk *mc_pcie_init_clk(struct device *dev, const char *id)
6f15a9c9f94133 drivers/pci/controller/pcie-microchip-host.c Daire McNamara 2021-01-25  851  {
6f15a9c9f94133 drivers/pci/controller/pcie-microchip-host.c Daire McNamara 2021-01-25  852  	struct clk *clk;
6f15a9c9f94133 drivers/pci/controller/pcie-microchip-host.c Daire McNamara 2021-01-25  853  	int ret;
6f15a9c9f94133 drivers/pci/controller/pcie-microchip-host.c Daire McNamara 2021-01-25  854  
6f15a9c9f94133 drivers/pci/controller/pcie-microchip-host.c Daire McNamara 2021-01-25  855  	clk = devm_clk_get_optional(dev, id);
6f15a9c9f94133 drivers/pci/controller/pcie-microchip-host.c Daire McNamara 2021-01-25  856  	if (IS_ERR(clk))
6f15a9c9f94133 drivers/pci/controller/pcie-microchip-host.c Daire McNamara 2021-01-25  857  		return clk;
6f15a9c9f94133 drivers/pci/controller/pcie-microchip-host.c Daire McNamara 2021-01-25  858  	if (!clk)
6f15a9c9f94133 drivers/pci/controller/pcie-microchip-host.c Daire McNamara 2021-01-25  859  		return clk;
6f15a9c9f94133 drivers/pci/controller/pcie-microchip-host.c Daire McNamara 2021-01-25  860  
6f15a9c9f94133 drivers/pci/controller/pcie-microchip-host.c Daire McNamara 2021-01-25  861  	ret = clk_prepare_enable(clk);
6f15a9c9f94133 drivers/pci/controller/pcie-microchip-host.c Daire McNamara 2021-01-25  862  	if (ret)
6f15a9c9f94133 drivers/pci/controller/pcie-microchip-host.c Daire McNamara 2021-01-25  863  		return ERR_PTR(ret);
6f15a9c9f94133 drivers/pci/controller/pcie-microchip-host.c Daire McNamara 2021-01-25  864  
6f15a9c9f94133 drivers/pci/controller/pcie-microchip-host.c Daire McNamara 2021-01-25 @865  	devm_add_action_or_reset(dev, (void (*) (void *))clk_disable_unprepare,
6f15a9c9f94133 drivers/pci/controller/pcie-microchip-host.c Daire McNamara 2021-01-25  866  				 clk);
6f15a9c9f94133 drivers/pci/controller/pcie-microchip-host.c Daire McNamara 2021-01-25  867  
6f15a9c9f94133 drivers/pci/controller/pcie-microchip-host.c Daire McNamara 2021-01-25  868  	return clk;
6f15a9c9f94133 drivers/pci/controller/pcie-microchip-host.c Daire McNamara 2021-01-25  869  }
6f15a9c9f94133 drivers/pci/controller/pcie-microchip-host.c Daire McNamara 2021-01-25  870  

:::::: The code at line 865 was first introduced by commit
:::::: 6f15a9c9f94133bee0d861a4bf25e10aaa95219d PCI: microchip: Add Microchip PolarFire PCIe controller driver

:::::: TO: Daire McNamara <daire.mcnamara@microchip.com>
:::::: CC: Bjorn Helgaas <bhelgaas@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
