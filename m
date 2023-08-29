Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA9C6AA9;
	Tue, 29 Aug 2023 22:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693348326; x=1724884326;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JOsWLsByVVGNL8tNplDa4L59+ISDHuJ4OaFQsILbVpw=;
  b=RT2KNEINEmMYBarssXiQ2IvrtE0RxFl8nY9ZNOJiEqv02agFLjoeRAie
   +jjIOZahCrAmBq7yiAGpNYABAbVdUIQg8wBk6D82BxW6rP9Km7NFcrmkQ
   KKromDklO7uNYvNs8xNBetsARIV1sfa79gQ2g4kXmbaTWWlajDw+Uv9Ay
   7JkAX8/8CV+1NmI+1G61nAOYzdhZ8s5CgLuRLURt40NFglSc63MZzfiiJ
   emn4z36j5s6/Pw9xvUP7neAxpbuKkfbUcSyoQn7qrcuYN6RFH1ahdyfUQ
   e0kzqWDAB53v5PIBzht3hikAG3AWBxpobe40x1/s5jYz97HCljVVEGprU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="372905008"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; 
   d="scan'208";a="372905008"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 15:32:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="912561973"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; 
   d="scan'208";a="912561973"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 29 Aug 2023 15:32:00 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qb7Ff-000995-3B;
	Tue, 29 Aug 2023 22:31:59 +0000
Date: Wed, 30 Aug 2023 06:31:35 +0800
From: kernel test robot <lkp@intel.com>
To: Vadim Pasternak <vadimp@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Michael Shych <michaelsh@nvidia.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [linux-next:master 11990/13297]
 drivers/platform/x86/mlx-platform.c:6204:8: error: call to undeclared
 function 'pci_request_region'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202308300642.mptI4L5U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ae782d4e2bf53b0b642ae860794f7a39470f995a
commit: 02daa222fbdd6afe52c25e5c2894d53946a4260d [11990/13297] platform: mellanox: Add initial support for PCIe based programming logic device
config: x86_64-buildonly-randconfig-001-20230830 (https://download.01.org/0day-ci/archive/20230830/202308300642.mptI4L5U-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230830/202308300642.mptI4L5U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308300642.mptI4L5U-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/platform/x86/mlx-platform.c:6204:8: error: call to undeclared function 'pci_request_region'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           err = pci_request_region(pci_dev, 0, res_name);
                 ^
   drivers/platform/x86/mlx-platform.c:6204:8: note: did you mean 'pci_request_regions'?
   include/linux/pci.h:1947:19: note: 'pci_request_regions' declared here
   static inline int pci_request_regions(struct pci_dev *dev, const char *res_name)
                     ^
   drivers/platform/x86/mlx-platform.c:6210:49: warning: shift count >= width of type [-Wshift-count-overflow]
           err = dma_set_mask_and_coherent(&pci_dev->dev, DMA_BIT_MASK(64));
                                                          ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                                        ^ ~~~
   1 warning and 1 error generated.


vim +/pci_request_region +6204 drivers/platform/x86/mlx-platform.c

  6185	
  6186	static int
  6187	mlxplat_pci_fpga_device_init(unsigned int device, const char *res_name, struct pci_dev **pci_bridge,
  6188				     void __iomem **pci_bridge_addr)
  6189	{
  6190		void __iomem *pci_mem_addr;
  6191		struct pci_dev *pci_dev;
  6192		int err;
  6193	
  6194		pci_dev = pci_get_device(PCI_VENDOR_ID_LATTICE, device, NULL);
  6195		if (!pci_dev)
  6196			return -ENODEV;
  6197	
  6198		err = pci_enable_device(pci_dev);
  6199		if (err) {
  6200			dev_err(&pci_dev->dev, "pci_enable_device failed with error %d\n", err);
  6201			goto fail_pci_enable_device;
  6202		}
  6203	
> 6204		err = pci_request_region(pci_dev, 0, res_name);
  6205		if (err) {
  6206			dev_err(&pci_dev->dev, "pci_request_regions failed with error %d\n", err);
  6207			goto fail_pci_request_regions;
  6208		}
  6209	
  6210		err = dma_set_mask_and_coherent(&pci_dev->dev, DMA_BIT_MASK(64));
  6211		if (err) {
  6212			err = dma_set_mask(&pci_dev->dev, DMA_BIT_MASK(32));
  6213			if (err) {
  6214				dev_err(&pci_dev->dev, "dma_set_mask failed with error %d\n", err);
  6215				goto fail_pci_set_dma_mask;
  6216			}
  6217		}
  6218	
  6219		pci_set_master(pci_dev);
  6220	
  6221		pci_mem_addr = devm_ioremap(&pci_dev->dev, pci_resource_start(pci_dev, 0),
  6222					    pci_resource_len(pci_dev, 0));
  6223		if (!pci_mem_addr) {
  6224			dev_err(&mlxplat_dev->dev, "ioremap failed\n");
  6225			err = -EIO;
  6226			goto fail_ioremap;
  6227		}
  6228	
  6229		*pci_bridge = pci_dev;
  6230		*pci_bridge_addr = pci_mem_addr;
  6231	
  6232		return 0;
  6233	
  6234	fail_ioremap:
  6235	fail_pci_set_dma_mask:
  6236		pci_release_regions(pci_dev);
  6237	fail_pci_request_regions:
  6238		pci_disable_device(pci_dev);
  6239	fail_pci_enable_device:
  6240		return err;
  6241	}
  6242	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
