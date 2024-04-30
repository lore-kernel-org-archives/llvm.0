Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8975017BB20;
	Tue, 30 Apr 2024 17:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714498183; cv=none; b=gILYOYCtaZbAK82pTtyNBITI1dap7U2vDM5cuWMKwRofpsoYR0WAZcIo/q9v7PIU2RJ4POFG+OrJpjAEIyo0ZbbCrQG5BTGOaVT95FkC4UCILmeiCCgtcc3WuseZQU6eDY+v5iHRa/FKftHWCUN/HVOzUmgTKZP6HSW89kGxL5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714498183; c=relaxed/simple;
	bh=orxKLZR0CCKUujHwsBdumTZSkA8TqQp12PelGygXCm0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BNw//QP+9K9N0I3anqDRSefEeycm2mlfLeDKXaSSIh6zk88tQk3FD/3lhfWqZ+UEFkrFkZos1/C0IPjOLwNppguAWThMdPqTuFrsGmkT2nd30SitHotFeeL/5+1oJ5y7fDttl3uXujnZ8OxeTQF0ztnVyyOvLMEpvD9whMmxVxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HwssCmfR; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HwssCmfR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714498181; x=1746034181;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=orxKLZR0CCKUujHwsBdumTZSkA8TqQp12PelGygXCm0=;
  b=HwssCmfRwXEF8qhkGd4B064Jpwsfm8tpt5X52hbppEI7dJF9TSXp0z9u
   KagrPl7f0D6apkHNJU39lzHn9sp5jqACh8bnw3AzYVuqCLzRZfpnlMwib
   sVNko3UFenLPzZirP3icyH/yrr6wI0MXpo78LHUeMSjX1Oj5Exo9WFyv6
   Gpm+XXTjEwucGqbS0Nr6D9gXdM7cVVy302VtdC/K5+2/pmmNZi1GhGNZ+
   CSORKQJOH4QpT8DFwCgqd21b0k8wkhszVwea/xMjhr5qAHO3WneRoaRp9
   5KvQA5E2Ok50265mxYyT/iqtTBonulqmnHLpaTphHvnxhwn1QsxjgHA6J
   w==;
X-CSE-ConnectionGUID: YDlkG5XXSJWyVLN0iU/JOw==
X-CSE-MsgGUID: Mdg1B/Y+R2qNxCVwOkM79A==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="10069452"
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; 
   d="scan'208";a="10069452"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2024 10:29:40 -0700
X-CSE-ConnectionGUID: a7uqFK6OQy+SVrRhZIHQww==
X-CSE-MsgGUID: 2jOSoe7eQTS8cJT/liXvZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; 
   d="scan'208";a="31333847"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 30 Apr 2024 10:29:40 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1rIP-0008QV-00;
	Tue, 30 Apr 2024 17:29:37 +0000
Date: Wed, 1 May 2024 01:29:34 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:dma-split-v1 17/17] drivers/vfio/pci/mlx5/cmd.c:368:22:
 error: use of undeclared identifier 'page_list'
Message-ID: <202405010138.kzo9DCkJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dma-split-v1
head:   b66ed91ccee0e8e645a07f54f0e39fe9ff4f03c9
commit: b66ed91ccee0e8e645a07f54f0e39fe9ff4f03c9 [17/17] vfio/mlx5: Convert vfio to use DMA link API
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240501/202405010138.kzo9DCkJ-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240501/202405010138.kzo9DCkJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405010138.kzo9DCkJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/vfio/pci/mlx5/cmd.h:10:
   In file included from include/linux/vfio_pci_core.h:12:
   In file included from include/linux/pci.h:37:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2210:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/vfio/pci/mlx5/cmd.c:6:
   In file included from drivers/vfio/pci/mlx5/cmd.h:10:
   In file included from include/linux/vfio_pci_core.h:12:
   In file included from include/linux/pci.h:39:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/vfio/pci/mlx5/cmd.c:6:
   In file included from drivers/vfio/pci/mlx5/cmd.h:10:
   In file included from include/linux/vfio_pci_core.h:12:
   In file included from include/linux/pci.h:39:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/vfio/pci/mlx5/cmd.c:6:
   In file included from drivers/vfio/pci/mlx5/cmd.h:10:
   In file included from include/linux/vfio_pci_core.h:12:
   In file included from include/linux/pci.h:39:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/vfio/pci/mlx5/cmd.c:368:22: error: use of undeclared identifier 'page_list'
     368 |         dma_get_memory_type(page_list[0], &type);
         |                             ^
>> drivers/vfio/pci/mlx5/cmd.c:374:2: error: use of undeclared identifier 'mtt'
     374 |         mtt = (__be64 *)MLX5_ADDR_OF(create_mkey_in, mkey_in, klm_pas_mtt);
         |         ^
   drivers/vfio/pci/mlx5/cmd.c:378:22: error: use of undeclared identifier 'mtt'
     378 |                 addr = be64_to_cpu(mtt[i]);
         |                                    ^
   include/linux/byteorder/generic.h:93:21: note: expanded from macro 'be64_to_cpu'
      93 | #define be64_to_cpu __be64_to_cpu
         |                     ^
>> drivers/vfio/pci/mlx5/cmd.c:534:3: error: use of undeclared identifier 'to_fill'
     534 |                 to_fill = min_t(unsigned int, to_alloc,
         |                 ^
   17 warnings and 4 errors generated.


vim +/page_list +368 drivers/vfio/pci/mlx5/cmd.c

   356	
   357	static void unregister_dma_pages(struct mlx5_core_dev *mdev, u32 npages,
   358					 u32 *mkey_in, struct dma_iova_attrs *iova)
   359	{
   360		struct dma_memory_type type = {};
   361		struct dma_iova_state state = {};
   362		dma_addr_t addr;
   363		bool use_iova;
   364		int i;
   365	
   366		WARN_ON_ONCE(iova->dir == DMA_NONE);
   367	
 > 368		dma_get_memory_type(page_list[0], &type);
   369		state.iova = iova;
   370		state.type = &type;
   371	
   372		use_iova = dma_can_use_iova(&state, PAGE_SIZE);
   373	
 > 374		mtt = (__be64 *)MLX5_ADDR_OF(create_mkey_in, mkey_in, klm_pas_mtt);
   375		if (use_iova)
   376			dma_start_range(&state, false);
   377		for (i = npages - 1; i >= 0; i--) {
   378			addr = be64_to_cpu(mtt[i]);
   379			if (use_iova)
   380				dma_unlink_range(&state, addr, PAGE_SIZE);
   381			else
   382				dma_unmap_page_attrs(iova->dev, addr, PAGE_SIZE,
   383						     iova->dir, iova->attrs);
   384		}
   385		if (use_iova)
   386			dma_end_range(&state, false);
   387		dma_free_iova(iova);
   388	}
   389	
   390	static int register_dma_pages(struct mlx5_core_dev *mdev, u32 npages,
   391				      struct page **page_list, u32 *mkey_in,
   392				      struct dma_iova_attrs *iova)
   393	{
   394		struct dma_memory_type type = {};
   395		struct dma_iova_state state = {};
   396		dma_addr_t addr;
   397		bool use_iova;
   398		__be64 *mtt;
   399		int i, err;
   400	
   401		WARN_ON_ONCE(iova->dir == DMA_NONE);
   402	
   403		iova->dev = mdev->device;
   404		iova->size = npages * PAGE_SIZE;
   405		err = dma_alloc_iova(iova);
   406		if (err)
   407			return err;
   408	
   409		/*
   410		 * All VFIO pages are of the same type, and it is enough
   411		 * to check one page only
   412		 */
   413		dma_get_memory_type(page_list[0], &type);
   414		state.iova = iova;
   415		state.type = &type;
   416	
   417		use_iova = dma_can_use_iova(&state, PAGE_SIZE);
   418	
   419		mtt = (__be64 *)MLX5_ADDR_OF(create_mkey_in, mkey_in, klm_pas_mtt);
   420		if (use_iova)
   421			dma_start_range(&state, true);
   422		for (i = 0; i < npages; i++) {
   423			if (use_iova)
   424				addr = dma_link_range(&state, page_list[i],
   425						      i * PAGE_SIZE, PAGE_SIZE);
   426			else
   427				addr = dma_map_page_attrs(iova->dev, page_list[i], 0,
   428							  PAGE_SIZE, iova->dir,
   429							  iova->attrs);
   430			if (dma_mapping_error(mdev->device, addr))
   431				goto error;
   432	
   433			*mtt++ = cpu_to_be64(addr);
   434		}
   435		if (use_iova)
   436			dma_end_range(&state, true);
   437	
   438		return 0;
   439	
   440	error:
   441		unregister_dma_pages(mdev, i, mkey_in, iova);
   442		return -ENOMEM;
   443	}
   444	
   445	static int mlx5vf_dma_data_buffer(struct mlx5_vhca_data_buffer *buf)
   446	{
   447		struct mlx5vf_pci_core_device *mvdev = buf->migf->mvdev;
   448		struct mlx5_core_dev *mdev = mvdev->mdev;
   449		int ret;
   450	
   451		lockdep_assert_held(&mvdev->state_mutex);
   452		if (mvdev->mdev_detach)
   453			return -ENOTCONN;
   454	
   455		if (buf->mkey_in || !buf->npages)
   456			return -EINVAL;
   457	
   458		buf->mkey_in = alloc_mkey_in(buf->npages, buf->migf->pdn);
   459		if (!buf->mkey_in)
   460			return -ENOMEM;
   461	
   462		ret = register_dma_pages(mdev, buf->npages, buf->page_list,
   463					 buf->mkey_in, &buf->iova);
   464		if (ret)
   465			goto err_register_dma;
   466	
   467		ret = create_mkey(mdev, buf->npages, buf->mkey_in, &buf->mkey);
   468		if (ret)
   469			goto err_create_mkey;
   470	
   471		return 0;
   472	
   473	err_create_mkey:
   474		unregister_dma_pages(mdev, buf->npages, buf->mkey_in, &buf->iova);
   475	err_register_dma:
   476		kvfree(buf->mkey_in);
   477		return ret;
   478	}
   479	
   480	static void free_page_list(u32 npages, struct page **page_list)
   481	{
   482		int i;
   483	
   484		/* Undo alloc_pages_bulk_array() */
   485		for (i = npages - 1; i >= 0; i--)
   486			__free_page(page_list[i]);
   487	
   488		kvfree(page_list);
   489	}
   490	
   491	void mlx5vf_free_data_buffer(struct mlx5_vhca_data_buffer *buf)
   492	{
   493		struct mlx5vf_pci_core_device *mvdev = buf->migf->mvdev;
   494		struct mlx5_core_dev *mdev = mvdev->mdev;
   495	
   496		lockdep_assert_held(&mvdev->state_mutex);
   497		WARN_ON(mvdev->mdev_detach);
   498	
   499		if (buf->mkey_in) {
   500			mlx5_core_destroy_mkey(mdev, buf->mkey);
   501			unregister_dma_pages(mdev, buf->npages, buf->mkey_in, &buf->iova);
   502			kvfree(buf->mkey_in);
   503		}
   504	
   505		free_page_list(buf->npages, buf->page_list);
   506		kfree(buf);
   507	}
   508	
   509	static int mlx5vf_add_migration_pages(struct mlx5_vhca_data_buffer *buf,
   510					      unsigned int npages)
   511	{
   512		unsigned int to_alloc = npages;
   513		size_t old_size, new_size;
   514		struct page **page_list;
   515		unsigned long filled;
   516	
   517		old_size = buf->npages * sizeof(*buf->page_list);
   518		new_size = old_size + to_alloc * sizeof(*buf->page_list);
   519		page_list = kvrealloc(buf->page_list, old_size, new_size,
   520				GFP_KERNEL_ACCOUNT | __GFP_ZERO);
   521		if (!page_list)
   522			return -ENOMEM;
   523	
   524		buf->page_list = page_list;
   525	
   526		do {
   527			filled = alloc_pages_bulk_array(GFP_KERNEL_ACCOUNT, to_alloc,
   528							buf->page_list + buf->npages);
   529			if (!filled)
   530				return -ENOMEM;
   531	
   532			to_alloc -= filled;
   533			buf->npages += filled;
 > 534			to_fill = min_t(unsigned int, to_alloc,
   535					PAGE_SIZE / sizeof(*buf->page_list));
   536		} while (to_alloc > 0);
   537	
   538		return 0;
   539	}
   540	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
