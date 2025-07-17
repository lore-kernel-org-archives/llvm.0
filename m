Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85213597A;
	Thu, 17 Jul 2025 13:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752760610; cv=none; b=TgFD5Vf+01CrFdmw+rIEBLOm6ugnKCdnk0CKCV0mNdTpkMTCSr/xDVcKMtK2eTV+rRS90cPLtYj6Mu38dUrGRy8M/IJ6pBtX7EvIb6OW5iQhbStAUWkKFqVW8JHU+cLDrr2th/w9wasFwf74hg+SHLtu4S3s1RMNbobLg5xMqNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752760610; c=relaxed/simple;
	bh=0snpe7qCWcEPIy3Z8zL6kjZ27wn0Cj1ydDamepuAW9s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ifQ7RowiH8Ezfy3BrlMEdgjzWJoVSdjGdyxiN6LtPbTOO5yp/dB5rfPpritrvxZ9z4JhLKE1mzaYvc2cVZNzqx3QThqWo/ffcwhPNIG4j8ML4Li2MtjjBHBjn2prUUAyNdCbsOI9/oY/diZjJad7ThvKi0iu6xaq4BhxAkwUDiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hkVKr1Vf; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hkVKr1Vf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752760608; x=1784296608;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0snpe7qCWcEPIy3Z8zL6kjZ27wn0Cj1ydDamepuAW9s=;
  b=hkVKr1VfLNseEXPh+BqULzhZchWz1czEL/awmy/psUw/UxCS59Vkzoez
   T16PJGf948I2ZTWSxBPukqcauS6NGnyD2RbKCkTVx4Kg4enL+Md3iz9QP
   6IY92MVkXJJ+NlSb+P0PuXBoWG0dRb4aHc8UpsJF3DMNIft4NkVEXgmx1
   MCtEnV5Hs4I645xDlb8G9GPD1slScE1DqGweT2XFykPeW/f7SEOW3oZrc
   0MfERdsh+J/KNAIn+ffF3pSb3ASEuY475bjEZtbLrINU1gp9zgpc9KBdY
   7PGXhbPSrJ0l1KbMBq/JWN7U5f2Gdjm4+l6Cli3IbY9MjHRq9DXEubDcA
   g==;
X-CSE-ConnectionGUID: il1Xn0M1QuaJf7rxd7APnA==
X-CSE-MsgGUID: Nm2JNmbFQ7mJS0BS8dYmEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="55184594"
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; 
   d="scan'208";a="55184594"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 06:56:47 -0700
X-CSE-ConnectionGUID: cKXp7eeNRA2YPB/lElHjmg==
X-CSE-MsgGUID: DCEXemPrRxSJpdDiJE91+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; 
   d="scan'208";a="158359634"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Jul 2025 06:56:45 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucP6J-000Dgx-2Y;
	Thu, 17 Jul 2025 13:56:43 +0000
Date: Thu, 17 Jul 2025 21:56:05 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:dmabuf-vfio 18/24] drivers/pci/p2pdma.c:272:16: error:
 too few arguments to function call, expected 2, have 1
Message-ID: <202507172149.FRPx4fN0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dmabuf-vfio
head:   8662d1e1cc127e6b95c53b1258f0364d6c53ce44
commit: e2eef194f5c392d9f15b0d20938dd640f106ac28 [18/24] PCI/P2PDMA: Separate global to device p2p initialization logic
config: x86_64-buildonly-randconfig-003-20250717 (https://download.01.org/0day-ci/archive/20250717/202507172149.FRPx4fN0-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250717/202507172149.FRPx4fN0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507172149.FRPx4fN0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/pci/p2pdma.c:14:
   include/linux/pci-p2pdma.h:30:8: error: must use 'struct' tag to refer to type 'p2pdma_provider'
      30 | static p2pdma_provider *pci_p2pdma_enable(struct pci_dev *pdev);
         |        ^
         |        struct 
>> drivers/pci/p2pdma.c:272:16: error: too few arguments to function call, expected 2, have 1
     272 |         devm_kfree(p2p);
         |         ~~~~~~~~~~    ^
   include/linux/device/devres.h:79:6: note: 'devm_kfree' declared here
      79 | void devm_kfree(struct device *dev, const void *p);
         |      ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pci/p2pdma.c:362:10: error: use of undeclared identifier 'free_pool'
     362 |                 return free_pool;
         |                        ^
>> drivers/pci/p2pdma.c:400:2: error: call to undeclared function 'sysfs_rmeove_group'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     400 |         sysfs_rmeove_group(&pdev->dev.kobj, &p2pmem_group);
         |         ^
   drivers/pci/p2pdma.c:400:2: note: did you mean 'sysfs_remove_group'?
   include/linux/sysfs.h:450:6: note: 'sysfs_remove_group' declared here
     450 | void sysfs_remove_group(struct kobject *kobj,
         |      ^
>> drivers/pci/p2pdma.c:401:19: error: use of undeclared identifier 'p2p'
     401 |         gen_pool_destroy(p2p->pool);
         |                          ^
   5 errors generated.


vim +272 drivers/pci/p2pdma.c

   240	
   241	/**
   242	 * pci_p2pdma_enable - Enable peer-to-peer DMA support for a PCI device
   243	 * @pdev: The PCI device to enable P2PDMA for
   244	 *
   245	 * This function initializes the peer-to-peer DMA infrastructure for a PCI
   246	 * device. It allocates and sets up the necessary data structures to support
   247	 * P2PDMA operations, including memory pools and mapping type tracking.
   248	 */
   249	struct p2pdma_provider *pci_p2pdma_enable(struct pci_dev *pdev)
   250	{
   251		struct pci_p2pdma *p2p;
   252		int ret;
   253	
   254		p2p = devm_kzalloc(&pdev->dev, sizeof(*p2p), GFP_KERNEL);
   255		if (!p2p)
   256			return ERR_PTR(-ENOMEM);
   257	
   258		xa_init(&p2p->map_types);
   259		p2p->mem.owner = &pdev->dev;
   260		/* On all p2p platforms bus_offset is the same fo all BARs */
   261		p2p->mem.bus_offset =
   262			pci_bus_address(pdev, 0) - pci_resource_start(pdev, 0);
   263	
   264		ret = devm_add_action_or_reset(&pdev->dev, pci_p2pdma_release, pdev);
   265		if (ret)
   266			goto out_p2p;
   267	
   268		rcu_assign_pointer(pdev->p2pdma, p2p);
   269		return &p2p->mem;
   270	
   271	out_p2p:
 > 272		devm_kfree(p2p);
   273		return ERR_PTR(ret);
   274	}
   275	EXPORT_SYMBOL_GPL(pci_p2pdma_enable);
   276	
   277	static int pci_p2pdma_setup_pool(struct pci_dev *pdev)
   278	{
   279		struct pci_p2pdma *p2pdma;
   280		int ret;
   281	
   282		p2pdma = rcu_dereference_protected(pdev->p2pdma, 1);
   283		if (p2pdma->pool)
   284			/* We already setup pools, do nothing, */
   285			return 0;
   286	
   287		p2pdma->pool = gen_pool_create(PAGE_SHIFT, dev_to_node(&pdev->dev));
   288		if (!p2pdma->pool)
   289			return -ENOMEM;
   290	
   291		ret = sysfs_create_group(&pdev->dev.kobj, &p2pmem_group);
   292		if (ret)
   293			goto out_pool_destroy;
   294	
   295		return 0;
   296	
   297	out_pool_destroy:
   298		gen_pool_destroy(p2pdma->pool);
   299		p2pdma->pool = NULL;
   300		return ret;
   301	}
   302	
   303	static void pci_p2pdma_unmap_mappings(void *data)
   304	{
   305		struct pci_p2pdma_pagemap *p2p_pgmap = data;
   306	
   307		/*
   308		 * Removing the alloc attribute from sysfs will call
   309		 * unmap_mapping_range() on the inode, teardown any existing userspace
   310		 * mappings and prevent new ones from being created.
   311		 */
   312		sysfs_remove_file_from_group(&p2p_pgmap->mem->owner->kobj,
   313					     &p2pmem_alloc_attr.attr,
   314					     p2pmem_group.name);
   315	}
   316	
   317	/**
   318	 * pci_p2pdma_add_resource - add memory for use as p2p memory
   319	 * @pdev: the device to add the memory to
   320	 * @bar: PCI BAR to add
   321	 * @size: size of the memory to add, may be zero to use the whole BAR
   322	 * @offset: offset into the PCI BAR
   323	 *
   324	 * The memory will be given ZONE_DEVICE struct pages so that it may
   325	 * be used with any DMA request.
   326	 */
   327	int pci_p2pdma_add_resource(struct pci_dev *pdev, int bar, size_t size,
   328				    u64 offset)
   329	{
   330		struct pci_p2pdma_pagemap *p2p_pgmap;
   331		struct p2pdma_provider *mem;
   332		struct dev_pagemap *pgmap;
   333		struct pci_p2pdma *p2pdma;
   334		void *addr;
   335		int error;
   336	
   337		if (!(pci_resource_flags(pdev, bar) & IORESOURCE_MEM))
   338			return -EINVAL;
   339	
   340		if (offset >= pci_resource_len(pdev, bar))
   341			return -EINVAL;
   342	
   343		if (!size)
   344			size = pci_resource_len(pdev, bar) - offset;
   345	
   346		if (size + offset > pci_resource_len(pdev, bar))
   347			return -EINVAL;
   348	
   349		p2pdma = rcu_dereference_protected(pdev->p2pdma, 1);
   350		if (!p2pdma) {
   351			mem = pci_p2pdma_enable(pdev);
   352			if (IS_ERR(mem))
   353				return PTR_ERR(mem);
   354	
   355			error = pci_p2pdma_setup_pool(pdev);
   356			if (error)
   357				return error;
   358		}
   359	
   360		p2p_pgmap = devm_kzalloc(&pdev->dev, sizeof(*p2p_pgmap), GFP_KERNEL);
   361		if (!p2p_pgmap)
 > 362			return free_pool;
   363	
   364		pgmap = &p2p_pgmap->pgmap;
   365		pgmap->range.start = pci_resource_start(pdev, bar) + offset;
   366		pgmap->range.end = pgmap->range.start + size - 1;
   367		pgmap->nr_range = 1;
   368		pgmap->type = MEMORY_DEVICE_PCI_P2PDMA;
   369		pgmap->ops = &p2pdma_pgmap_ops;
   370		p2p_pgmap->mem = mem;
   371	
   372		addr = devm_memremap_pages(&pdev->dev, pgmap);
   373		if (IS_ERR(addr)) {
   374			error = PTR_ERR(addr);
   375			goto pgmap_free;
   376		}
   377	
   378		error = devm_add_action_or_reset(&pdev->dev, pci_p2pdma_unmap_mappings,
   379						 p2p_pgmap);
   380		if (error)
   381			goto pages_free;
   382	
   383		error = gen_pool_add_owner(p2pdma->pool, (unsigned long)addr,
   384				pci_bus_address(pdev, bar) + offset,
   385				range_len(&pgmap->range), dev_to_node(&pdev->dev),
   386				&pgmap->ref);
   387		if (error)
   388			goto pages_free;
   389	
   390		pci_info(pdev, "added peer-to-peer DMA memory %#llx-%#llx\n",
   391			 pgmap->range.start, pgmap->range.end);
   392	
   393		return 0;
   394	
   395	pages_free:
   396		devm_memunmap_pages(&pdev->dev, pgmap);
   397	pgmap_free:
   398		devm_kfree(&pdev->dev, p2p_pgmap);
   399	free_pool:
 > 400		sysfs_rmeove_group(&pdev->dev.kobj, &p2pmem_group);
 > 401		gen_pool_destroy(p2p->pool);
   402		return error;
   403	}
   404	EXPORT_SYMBOL_GPL(pci_p2pdma_add_resource);
   405	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
