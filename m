Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0CC1E0DEA;
	Tue, 16 Sep 2025 19:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758049546; cv=none; b=IE1mA8BCQEzcaewUiE27TJv988/4hvHniVc2hU4bJXByImlYT1xKZjnnW/lIGLdHYlqZb41AYOTxHor8FW6Pz+g8mUij2dbabAk3zUB0pMZDkZr7xrTM07v/w+bQB3PVvphMPWm3FKrcBRrKghhmoGy1c4qS4sN9JH+5HWPyvKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758049546; c=relaxed/simple;
	bh=BfDdP84L5xOmBhKa86Q1DbJ54jiRq+ZZaP+DmO78rVA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PyQIjROm0QOJ/ZZqbvXx/QLBK6omhMEl0dN3A0rAlRia9SJu8wfLKSnQp0AVR8e5B5uYWNQIEGwvhu5FFjFHjEINAh1OkRFLN+MgP6RnbSKM4BVdCxTxZNjWYOwaas1Qk2sAZHu14s34lyQraRp+nF/rFXqD0hlZE1/hpOd1Gsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BzDELeGm; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BzDELeGm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758049544; x=1789585544;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BfDdP84L5xOmBhKa86Q1DbJ54jiRq+ZZaP+DmO78rVA=;
  b=BzDELeGmo9ZXr67rPEEtHtNzr0fOaGAKdIf94Vlw6T+p7tuC1C3zuRtx
   mcO3qJrDCtlV6UEGyNqdzYdjjhpsP9GDngBViyWcMHU3bfCOCDnPYS2m/
   S83RcI6Qqg6m3vG7oKFkSconwWqEugMJJXZVZzdmV5v+vYGE8Fe76n/Sf
   VnXT6ss/4WlodBnoO5qAu8Cu5IR3IFVHvUVOfV1t3mFFGCfYakhsw+aOR
   bYBa/7ZmwPkU5rhiomRy3hoX8ffFL1MtvmmL1OD67BtYMzcK7El4yRmE9
   gt/t9oKRF6oxr/XY2hmTsNq13y8uRtwm730/UvDLpYturFoybCwnbprct
   g==;
X-CSE-ConnectionGUID: 96BgmGnVTZiU21DNs+Yrxw==
X-CSE-MsgGUID: NmZYIdPaQBq8BHNukfGPBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="47921199"
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="47921199"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 12:05:43 -0700
X-CSE-ConnectionGUID: YgES6+EkRxqgVYdBzBbcgA==
X-CSE-MsgGUID: xtgg/fNuTtK2TqLibQVciw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="180286255"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 Sep 2025 12:05:42 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyazk-0000ff-0s;
	Tue, 16 Sep 2025 19:05:40 +0000
Date: Wed, 17 Sep 2025 03:04:58 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:dmabuf-vfio 32/42] drivers/xen/swiotlb-xen.c:215:34:
 error: use of undeclared identifier 'dma_addr'; did you mean 'dev_addr'?
Message-ID: <202509170329.YL4Xthwq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dmabuf-vfio
head:   887b59804850b679831fda6eba707cc1b1b077e0
commit: e6bbade3239e8025dd7c7bec3d639d05aa49ef2b [32/42] xen: swiotlb: Switch to physical address mapping callbacks
config: x86_64-buildonly-randconfig-002-20250916 (https://download.01.org/0day-ci/archive/20250917/202509170329.YL4Xthwq-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250917/202509170329.YL4Xthwq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509170329.YL4Xthwq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/xen/swiotlb-xen.c:215:34: error: use of undeclared identifier 'dma_addr'; did you mean 'dev_addr'?
     215 |                 if (unlikely(!dma_capable(dev, dma_addr, size, false))) {
         |                                                ^~~~~~~~
         |                                                dev_addr
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   drivers/xen/swiotlb-xen.c:210:13: note: 'dev_addr' declared here
     210 |         dma_addr_t dev_addr = xen_phys_to_dma(dev, phys);
         |                    ^
   drivers/xen/swiotlb-xen.c:219:6: error: use of undeclared identifier 'dma_addr'; did you mean 'dev_addr'?
     219 |                                 &dma_addr, size, *dev->dma_mask,
         |                                  ^~~~~~~~
         |                                  dev_addr
   include/linux/dev_printk.h:199:38: note: expanded from macro 'dev_err_once'
     199 |         dev_level_once(dev_err, dev, fmt, ##__VA_ARGS__)
         |                                             ^
   include/linux/dev_printk.h:181:25: note: expanded from macro 'dev_level_once'
     181 |                 dev_level(dev, fmt, ##__VA_ARGS__);                     \
         |                                       ^
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                        ^
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^
   drivers/xen/swiotlb-xen.c:210:13: note: 'dev_addr' declared here
     210 |         dma_addr_t dev_addr = xen_phys_to_dma(dev, phys);
         |                    ^
   2 errors generated.


vim +215 drivers/xen/swiotlb-xen.c

   197	
   198	/*
   199	 * Map a single buffer of the indicated size for DMA in streaming mode.  The
   200	 * physical address to use is returned.
   201	 *
   202	 * Once the device is given the dma address, the device owns this memory until
   203	 * either xen_swiotlb_unmap_phys or xen_swiotlb_dma_sync_single is performed.
   204	 */
   205	static dma_addr_t xen_swiotlb_map_phys(struct device *dev, phys_addr_t phys,
   206					size_t size, enum dma_data_direction dir,
   207					unsigned long attrs)
   208	{
   209		phys_addr_t map;
   210		dma_addr_t dev_addr = xen_phys_to_dma(dev, phys);
   211	
   212		BUG_ON(dir == DMA_NONE);
   213	
   214		if (attrs & DMA_ATTR_MMIO) {
 > 215			if (unlikely(!dma_capable(dev, dma_addr, size, false))) {
   216				dev_err_once(
   217					dev,
   218					"DMA addr %pad+%zu overflow (mask %llx, bus limit %llx).\n",
   219					&dma_addr, size, *dev->dma_mask,
   220					dev->bus_dma_limit);
   221				WARN_ON_ONCE(1);
   222				return DMA_MAPPING_ERROR;
   223			}
   224			return phys;
   225		}
   226	
   227		/*
   228		 * If the address happens to be in the device's DMA window,
   229		 * we can safely return the device addr and not worry about bounce
   230		 * buffering it.
   231		 */
   232		if (dma_capable(dev, dev_addr, size, true) &&
   233		    !dma_kmalloc_needs_bounce(dev, size, dir) &&
   234		    !range_straddles_page_boundary(phys, size) &&
   235			!xen_arch_need_swiotlb(dev, phys, dev_addr) &&
   236			!is_swiotlb_force_bounce(dev))
   237			goto done;
   238	
   239		/*
   240		 * Oh well, have to allocate and map a bounce buffer.
   241		 */
   242		trace_swiotlb_bounced(dev, dev_addr, size);
   243	
   244		map = swiotlb_tbl_map_single(dev, phys, size, 0, dir, attrs);
   245		if (map == (phys_addr_t)DMA_MAPPING_ERROR)
   246			return DMA_MAPPING_ERROR;
   247	
   248		phys = map;
   249		dev_addr = xen_phys_to_dma(dev, map);
   250	
   251		/*
   252		 * Ensure that the address returned is DMA'ble
   253		 */
   254		if (unlikely(!dma_capable(dev, dev_addr, size, true))) {
   255			__swiotlb_tbl_unmap_single(dev, map, size, dir,
   256					attrs | DMA_ATTR_SKIP_CPU_SYNC,
   257					swiotlb_find_pool(dev, map));
   258			return DMA_MAPPING_ERROR;
   259		}
   260	
   261	done:
   262		if (!dev_is_dma_coherent(dev) && !(attrs & DMA_ATTR_SKIP_CPU_SYNC)) {
   263			if (pfn_valid(PFN_DOWN(dma_to_phys(dev, dev_addr))))
   264				arch_sync_dma_for_device(phys, size, dir);
   265			else
   266				xen_dma_sync_for_device(dev, dev_addr, size, dir);
   267		}
   268		return dev_addr;
   269	}
   270	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
