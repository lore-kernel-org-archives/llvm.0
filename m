Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D575D8F52;
	Sun,  5 Nov 2023 09:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GaEnG/IX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699177484; x=1730713484;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WtHzqN+fqC8VXK9h5i2RuXzxLAbNA3Bl15/qpcp5th4=;
  b=GaEnG/IXnr3VLOug1AEJmHDf/1xNcZuGaO+QjsAS+fptOf9mTKp3VrHB
   VNmIMQmB9WsxnFEAMb2Y4752kKkDfWB/7j8TKIzlC2U3dRU4pMg4ZvNg3
   L7c+G6b9J0otiDO3xGaHjo26z09zXn6rWF4a016YiE/EvwnAK31+AmA2h
   OdKWarKXO2pUCuwVpRhTwgqg4Hy7OPFHiZSit6JHhCbwJAlG7Az8w/EyI
   wdCRmYULIuieDFXlw8FJzjDIWJKsbOqukILU49c16pPL1ZHGAcK9ugnxR
   Uiru7zoIkl2Itk9VDkvq4GJzYMGE89LDQyp1qdqGc4TCmaZDUTuXS2QzF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="392003159"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="392003159"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 01:44:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="827930583"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="827930583"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 05 Nov 2023 01:44:40 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzZgL-0005I3-3C;
	Sun, 05 Nov 2023 09:44:37 +0000
Date: Sun, 5 Nov 2023 17:43:08 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [niks:bounce-min 64/64] kernel/dma/swiotlb.c:1315:10: error: no
 member named 'transient' in 'struct io_tlb_pool'
Message-ID: <202311051739.kQ7Jn6qw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git bounce-min
head:   8cfc2dc53db5921e1ec417b1d0ae235ee4125cd6
commit: 8cfc2dc53db5921e1ec417b1d0ae235ee4125cd6 [64/64] DEBUG-swiotlb/pci: Make all PCI devices untrusted and add overrun test
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231105/202311051739.kQ7Jn6qw-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231105/202311051739.kQ7Jn6qw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311051739.kQ7Jn6qw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/dma/swiotlb.c:1315:10: error: no member named 'transient' in 'struct io_tlb_pool'
                           pool->transient, index, (u64)dma_get_min_align_mask(dev), (u64)orig_addr,
                           ~~~~  ^
   include/linux/printk.h:528:34: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
                                           ^~~~~~~~~~~
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   1 error generated.


vim +1315 kernel/dma/swiotlb.c

  1257	
  1258	phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
  1259			size_t mapping_size, size_t alloc_size,
  1260			unsigned int alloc_align_mask, enum dma_data_direction dir,
  1261			unsigned long attrs)
  1262	{
  1263		struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
  1264		unsigned int offset = swiotlb_align_offset(dev, orig_addr);
  1265		struct io_tlb_pool *pool;
  1266		unsigned int i;
  1267		int index;
  1268		phys_addr_t tlb_addr;
  1269	
  1270		if (!mem || !mem->nslabs) {
  1271			dev_warn_ratelimited(dev,
  1272				"Can not allocate SWIOTLB buffer earlier and can't now provide you with the DMA bounce buffer");
  1273			return (phys_addr_t)DMA_MAPPING_ERROR;
  1274		}
  1275	
  1276		if (cc_platform_has(CC_ATTR_MEM_ENCRYPT))
  1277			pr_warn_once("Memory encryption is active and system is using DMA bounce buffers\n");
  1278	
  1279		if (mapping_size > alloc_size) {
  1280			dev_warn_once(dev, "Invalid sizes (mapping: %zd bytes, alloc: %zd bytes)",
  1281				      mapping_size, alloc_size);
  1282			return (phys_addr_t)DMA_MAPPING_ERROR;
  1283		}
  1284	
  1285		index = swiotlb_find_slots(dev, orig_addr,
  1286					   alloc_size + offset, alloc_align_mask, &pool);
  1287		if (index == -1) {
  1288			if (!(attrs & DMA_ATTR_NO_WARN))
  1289				dev_warn_ratelimited(dev,
  1290		"swiotlb buffer is full (sz: %zd bytes), total %lu (slots), used %lu (slots)\n",
  1291					 alloc_size, mem->nslabs, mem_used(mem));
  1292			return (phys_addr_t)DMA_MAPPING_ERROR;
  1293		}
  1294	
  1295		/*
  1296		 * Save away the mapping from the original address to the DMA address.
  1297		 * This is needed when we sync the memory.  Then we sync the buffer if
  1298		 * needed.
  1299		 */
  1300		for (i = 0; i < nr_slots(alloc_size + offset); i++)
  1301			pool->slots[index + i].orig_addr = slot_addr(orig_addr, i);
  1302		tlb_addr = slot_addr(pool->start, index) + offset;
  1303	
  1304		if (tlb_addr + alloc_size > pool->end) {
  1305			pr_info("\n\ttransient:%i"
  1306				"\n\tindex:%i"
  1307				"\n\tdma_get_min_align_mask(dev):%llx"
  1308				"\n\torig_addr:%llx"
  1309				"\n\ttlb_addr=%llx"
  1310				"\n\tstart:%llx"
  1311				"\n\tend:%llx"
  1312				"\n\tpool_size:%zu"
  1313				"\n\talloc_size:%zu"
  1314				"\n\toffset:%u\n",
> 1315				pool->transient, index, (u64)dma_get_min_align_mask(dev), (u64)orig_addr,
  1316				(u64)tlb_addr, (u64)pool->start, (u64)pool->end,
  1317				(size_t)(pool->end - pool->start), alloc_size, offset);
  1318			return (phys_addr_t)DMA_MAPPING_ERROR;
  1319		}
  1320	
  1321		/*
  1322		 * When dir == DMA_FROM_DEVICE we could omit the copy from the orig
  1323		 * to the tlb buffer, if we knew for sure the device will
  1324		 * overwrite the entire current content. But we don't. Thus
  1325		 * unconditional bounce may prevent leaking swiotlb content (i.e.
  1326		 * kernel memory) to user-space.
  1327		 */
  1328		swiotlb_bounce(dev, tlb_addr, mapping_size, DMA_TO_DEVICE);
  1329		return tlb_addr;
  1330	}
  1331	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
