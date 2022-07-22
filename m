Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1830F15A4
	for <llvm@lists.linux.dev>; Fri, 22 Jul 2022 05:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658469444; x=1690005444;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Um0ffUX77L/N/JswSJjQanUKab3kt3+NmTAg6H3ENko=;
  b=l+5eE585HCJ4HpCxFvmv1fonjJro21IXe+o+qBY9S1iuDNwvEW/V6lM3
   O+JIsQbSAI74TkyuRowUiGmVfrFFlD3k5HcxHlea3kKkSVlQF59FtYC98
   QnNvmxEiNi/Grf1PyzTOr5D5nAOc+x8Tf1tMsQWjk1mLJZ7rL//IWXMZF
   /e5UJqqQtQzmPbN/U9YLiD7i/KAHBV+psKjeMNy2nSh0DED3/G2L6l/3h
   FhsL+uIbeL5idfbnwsN77LkAuAP78ezjS8MC5u98QLnWT17T5kwckkU5D
   hzv2zYeIQUYEitbExYV+NyZhGNYCrAlnfm0jNCPwIOkLsLu73yLoCqKof
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10415"; a="288412963"
X-IronPort-AV: E=Sophos;i="5.93,184,1654585200"; 
   d="scan'208";a="288412963"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2022 22:57:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,184,1654585200"; 
   d="scan'208";a="626432812"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 21 Jul 2022 22:57:21 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oElf7-00013E-0n;
	Fri, 22 Jul 2022 05:57:21 +0000
Date: Fri, 22 Jul 2022 13:56:58 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [arnd-playground:orion-pci-cleanup 3/5]
 arch/arm/plat-orion/pcie.c:301:2: error: call to undeclared function
 'pci_add_resource'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202207221319.pet6mCTR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git orion-pci-cleanup
head:   f154fdd063e0f8e231dbe3c06b03fbb1ec0ffb8c
commit: b8537f0e3f6c609d0d723bb8c098919b5f515d5d [3/5] ARM: orion: simplify PCI code
config: arm-randconfig-r021-20220718 (https://download.01.org/0day-ci/archive/20220722/202207221319.pet6mCTR-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0c1b32717bcffcf8edf95294e98933bd4c1e76ed)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git/commit/?id=b8537f0e3f6c609d0d723bb8c098919b5f515d5d
        git remote add arnd-playground https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git
        git fetch --no-tags arnd-playground orion-pci-cleanup
        git checkout b8537f0e3f6c609d0d723bb8c098919b5f515d5d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/arm/plat-orion/pcie.c:301:2: error: call to undeclared function 'pci_add_resource'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           pci_add_resource(&bridge->windows, &iomem_resource);
           ^
   arch/arm/plat-orion/pcie.c:301:2: note: did you mean 'pci_find_resource'?
   include/linux/pci.h:1844:32: note: 'pci_find_resource' declared here
   static inline struct resource *pci_find_resource(struct pci_dev *dev,
                                  ^
   arch/arm/plat-orion/pcie.c:347:26: error: use of undeclared identifier 'pci_common_swizzle'
                           bridge->swizzle_irq = pci_common_swizzle;
                                                 ^
>> arch/arm/plat-orion/pcie.c:349:10: error: call to undeclared function 'pci_host_probe'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                           ret = pci_host_probe(bridge);
                                 ^
   3 errors generated.


vim +/pci_add_resource +301 arch/arm/plat-orion/pcie.c

   295	
   296	static int orion_pci_init_resource(int nr, struct pci_host_bridge *bridge)
   297	{
   298		struct orion_pci_sys_data *sys = pci_host_bridge_priv(bridge);
   299		int ret;
   300	
 > 301		pci_add_resource(&bridge->windows, &iomem_resource);
   302	
   303		sys->io_res.start = (nr * SZ_64K) ?  : pcibios_min_io;
   304		sys->io_res.end = (nr + 1) * SZ_64K - 1;
   305		sys->io_res.flags = IORESOURCE_IO;
   306		sys->io_res.name = sys->io_res_name;
   307		sprintf(sys->io_res_name, "PCI%d I/O", nr);
   308	
   309		ret = request_resource(&ioport_resource, &sys->io_res);
   310		if (ret) {
   311			pr_err("PCI: unable to allocate I/O port region (%d)\n", ret);
   312			return ret;
   313		}
   314		pci_add_resource(&bridge->windows, &sys->io_res);
   315	
   316		return 0;
   317	}
   318	
   319	void orion_pci_probe(int nr_controllers,
   320		int (*setup)(int nr, struct pci_host_bridge *),
   321		int (*map_irq)(const struct pci_dev *dev, u8 slot, u8 pin))
   322	{
   323		int ret;
   324		int nr, busnr;
   325	
   326		pci_add_flags(PCI_REASSIGN_ALL_BUS);
   327	
   328		for (nr = busnr = 0; nr < nr_controllers; nr++) {
   329			struct pci_host_bridge *bridge;
   330	
   331			bridge = pci_alloc_host_bridge(
   332					sizeof(struct orion_pci_sys_data));
   333			if (WARN(!bridge, "PCI: unable to allocate bridge!"))
   334				break;
   335	
   336			bridge->busnr   = busnr;
   337			ret = setup(nr, bridge);
   338	
   339			if (ret > 0) {
   340				ret = orion_pci_init_resource(nr, bridge);
   341				if (ret)  {
   342					pci_free_host_bridge(bridge);
   343					break;
   344				}
   345	
   346				bridge->map_irq = map_irq;
   347				bridge->swizzle_irq = pci_common_swizzle;
   348	
 > 349				ret = pci_host_probe(bridge);

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
