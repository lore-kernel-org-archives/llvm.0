Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBBD3D6A
	for <llvm@lists.linux.dev>; Thu, 17 Feb 2022 19:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645127283; x=1676663283;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qTtkFq2coxen7O/toH2iFhWHUoYOLSfaGvGEa2a3ndo=;
  b=LAa3H0CT90i/Si3ewXJto/u3vgpjp3z6vxWhqsauSE8pH+rkqae8ngZz
   LdvNq8o005YyyUCL4pjE25ZCO4RJ03VbiYaZecFix5Dnu3Ios7AymudBB
   MaqN5gcpEGw2fWFdvR/hE6hUJTQqFmoA8qSX8QgUNovlaV5H8wE7OcumR
   LkAj4NKjlDkvWjHVfkB5a6b3gFuJE8/H0vqIbAF65ABgkw6+6OPSwDitb
   6fnRbaN2AHw3LqVSfYXxGOEiHErMoiOtEY+rUgJdbqwBAtVPrfd4Od7oz
   MHxfRMA8pMdc9WVpLU7hQyyK4TII7VYr/iJRjnO7AsFaoi7xVE9Mx9Hyw
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="250701234"
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; 
   d="scan'208";a="250701234"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2022 11:48:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; 
   d="scan'208";a="637327784"
Received: from lkp-server01.sh.intel.com (HELO 6f05bf9e3301) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 17 Feb 2022 11:48:02 -0800
Received: from kbuild by 6f05bf9e3301 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nKmkz-0000XM-Ar; Thu, 17 Feb 2022 19:48:01 +0000
Date: Fri, 18 Feb 2022 03:47:48 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-nvme@lists.infradead.org
Subject: [linux-nvme:swiotlb-init-cleanup 8/11]
 arch/x86/kernel/pci-dma.c:94:35: error: use of undeclared identifier
 'x86_swiotlb_flags'; did you mean 'x86_power_flags'?
Message-ID: <202202180341.LKRIvHrs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://git.infradead.org/nvme.git swiotlb-init-cleanup
head:   2cfb7ec6b2292ac81243cacda06a2ca79b06f2c2
commit: 563c044b3b3c098f73df34a500203b45cd6708b0 [8/11] swiotlb: make the swiotlb_init interface more useful
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20220218/202202180341.LKRIvHrs-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add linux-nvme git://git.infradead.org/nvme.git
        git fetch --no-tags linux-nvme swiotlb-init-cleanup
        git checkout 563c044b3b3c098f73df34a500203b45cd6708b0
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/x86/kernel/pci-dma.c:94:35: error: use of undeclared identifier 'x86_swiotlb_flags'; did you mean 'x86_power_flags'?
           swiotlb_init(x86_swiotlb_enable, x86_swiotlb_flags);
                                            ^~~~~~~~~~~~~~~~~
                                            x86_power_flags
   arch/x86/include/asm/cpufeature.h:39:27: note: 'x86_power_flags' declared here
   extern const char * const x86_power_flags[32];
                             ^
   1 error generated.


vim +94 arch/x86/kernel/pci-dma.c

    86	
    87	void __init pci_iommu_alloc(void)
    88	{
    89		pci_swiotlb_detect_4gb();
    90		gart_iommu_hole_init();
    91		amd_iommu_detect();
    92		detect_intel_iommu();
    93	
  > 94		swiotlb_init(x86_swiotlb_enable, x86_swiotlb_flags);
    95	}
    96	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
