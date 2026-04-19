Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259E91BC2A;
	Sun, 19 Apr 2026 13:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776604611; cv=none; b=ahZ3Nxw/HZlej09vXs88c2l1k6ym8eFVYOdWVFhTlQo5ioIIyjUHdIv/sedn5Ivwh9iErSHWXtriPfcInN9KGghmcUpQZXVv0rrPbj70xpLLESGFDDnL3HwPpfHWe7Gyde5sPTlqo6muHmYPncN67FLU3PlFBmZhFy9qwL0cPaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776604611; c=relaxed/simple;
	bh=TpH64KHp6fEx5WGQeJEfULzoNTVeRxkhXEE8Ut+HrnU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=m6Wj8KzHExNle7iyhDGAGd8RneM0E8myZ+Wz7Sc6vei+7Vm5mgmDwXJf1qRfMz1mNCNDcjI/C+hmTDxlHR5+VJCYXQRMBodxWAJhuHd2kUr6IJ3Pz2MuX4xldZueJn7Yasjea3/Z01RbbhCGrgM4c5z30r2uhgu+ZuYYf9lRFQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=goZDpbhJ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="goZDpbhJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776604609; x=1808140609;
  h=date:from:to:cc:subject:message-id;
  bh=TpH64KHp6fEx5WGQeJEfULzoNTVeRxkhXEE8Ut+HrnU=;
  b=goZDpbhJy+ZXcAT+srnCOJb9xPqdzKWn8XMq4QOgchbdSi5eqDUIaWW7
   uXmGcfV0JSdwMpA7TIV4oekhGK2HcfS2ThL6hope/4E2xJyQbPRpV1tNe
   49qaqNmDXc+6j1DYm+/C+OYWP1PklLxo2uf4swc2EoLegbpUDCgg3vEw9
   Y0Ug7HAS0PrLWctbZSTkaMbXwXsW1FEUhhipJ3U5CfQWQpar43YRDTt1p
   0WrNZwSlsAx51+cURQ0MGZW5ZTx8lZjIRaavzSuXMsMz5W7BZ7XFP0nmk
   cLxfzjGRenz9obf6UetAI8XLCl+be7g2WS/WIiOAV4DldNckOdMN2yNKg
   Q==;
X-CSE-ConnectionGUID: CK6+fKSFRDqlRH98OVMsaA==
X-CSE-MsgGUID: +vsnWUA2Rf2J6Lidi2Ycpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="100199034"
X-IronPort-AV: E=Sophos;i="6.23,188,1770624000"; 
   d="scan'208";a="100199034"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2026 06:16:48 -0700
X-CSE-ConnectionGUID: MqLAgRguSzmsw8ABku6INw==
X-CSE-MsgGUID: HJola3k9RHyFw6UeZ6fsLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,188,1770624000"; 
   d="scan'208";a="228806155"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 19 Apr 2026 06:16:47 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wES0y-000000001zF-2Gmd;
	Sun, 19 Apr 2026 13:16:44 +0000
Date: Sun, 19 Apr 2026 15:15:44 +0200
From: kernel test robot <lkp@intel.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: kernel/dma/direct.c:204:37: error: use of undeclared
 identifier 'DMA_ATTR_CC_DECRYPTED'
Message-ID: <202604191535.HxHlMot2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Aneesh-Kumar-K-V-Arm/dma-direct-swiotlb-handle-swiotlb-alloc-free-outside-__dma_direct_alloc_pages/20260419-084811
head:   1ec4723e78165ffe91782f086757128a19077206
commit: 4545bb9fb24e19b4ae676415e931b6e9fb0df4f8 dma-direct: use DMA_ATTR_CC_DECRYPTED in alloc/free paths
date:   12 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260419/202604191535.HxHlMot2-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260419/202604191535.HxHlMot2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604191535.HxHlMot2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/dma/direct.c:204:37: error: use of undeclared identifier 'DMA_ATTR_CC_DECRYPTED'
     204 |         bool mark_mem_decrypt = !!(attrs & DMA_ATTR_CC_DECRYPTED);
         |                                            ^
   kernel/dma/direct.c:209:12: error: use of undeclared identifier 'DMA_ATTR_CC_DECRYPTED'
     209 |                 attrs |= DMA_ATTR_CC_DECRYPTED;
         |                          ^
   kernel/dma/direct.c:217:46: error: use of undeclared identifier 'DMA_ATTR_CC_DECRYPTED'
     217 |         if (((attrs & (DMA_ATTR_NO_KERNEL_MAPPING | DMA_ATTR_CC_DECRYPTED)) ==
         |                                                     ^
   kernel/dma/direct.c:252:25: error: use of undeclared identifier 'DMA_ATTR_CC_DECRYPTED'
     252 |         if ((remap || (attrs & DMA_ATTR_CC_DECRYPTED)) &&
         |                                ^
   kernel/dma/direct.c:326:39: error: use of undeclared identifier 'DMA_ATTR_CC_DECRYPTED'
     326 |         bool mark_mem_encrypted = !!(attrs & DMA_ATTR_CC_DECRYPTED);
         |                                              ^
   kernel/dma/direct.c:334:12: error: use of undeclared identifier 'DMA_ATTR_CC_DECRYPTED'
     334 |                 attrs |= DMA_ATTR_CC_DECRYPTED;
         |                          ^
   kernel/dma/direct.c:338:46: error: use of undeclared identifier 'DMA_ATTR_CC_DECRYPTED'
     338 |         if (((attrs & (DMA_ATTR_NO_KERNEL_MAPPING | DMA_ATTR_CC_DECRYPTED)) ==
         |                                                     ^
   kernel/dma/direct.c:387:12: error: use of undeclared identifier 'DMA_ATTR_CC_DECRYPTED'
     387 |                 attrs |= DMA_ATTR_CC_DECRYPTED;
         |                          ^
   kernel/dma/direct.c:389:15: error: use of undeclared identifier 'DMA_ATTR_CC_DECRYPTED'
     389 |         if ((attrs & DMA_ATTR_CC_DECRYPTED) && dma_direct_use_pool(dev, gfp))
         |                      ^
   9 errors generated.


vim +/DMA_ATTR_CC_DECRYPTED +204 kernel/dma/direct.c

   199	
   200	void *dma_direct_alloc(struct device *dev, size_t size,
   201			dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs)
   202	{
   203		bool remap = false, set_uncached = false;
 > 204		bool mark_mem_decrypt = !!(attrs & DMA_ATTR_CC_DECRYPTED);
   205		struct page *page;
   206		void *ret;
   207	
   208		if (force_dma_unencrypted(dev)) {
   209			attrs |= DMA_ATTR_CC_DECRYPTED;
   210			mark_mem_decrypt = true;
   211		}
   212	
   213		size = PAGE_ALIGN(size);
   214		if (attrs & DMA_ATTR_NO_WARN)
   215			gfp |= __GFP_NOWARN;
   216	
   217		if (((attrs & (DMA_ATTR_NO_KERNEL_MAPPING | DMA_ATTR_CC_DECRYPTED)) ==
   218		     DMA_ATTR_NO_KERNEL_MAPPING) && !is_swiotlb_for_alloc(dev))
   219			return dma_direct_alloc_no_mapping(dev, size, dma_handle, gfp);
   220	
   221		if (!dev_is_dma_coherent(dev)) {
   222			if (IS_ENABLED(CONFIG_ARCH_HAS_DMA_ALLOC) &&
   223			    !is_swiotlb_for_alloc(dev))
   224				return arch_dma_alloc(dev, size, dma_handle, gfp,
   225						      attrs);
   226	
   227			/*
   228			 * If there is a global pool, always allocate from it for
   229			 * non-coherent devices.
   230			 */
   231			if (IS_ENABLED(CONFIG_DMA_GLOBAL_POOL))
   232				return dma_alloc_from_global_coherent(dev, size,
   233						dma_handle);
   234	
   235			/*
   236			 * Otherwise we require the architecture to either be able to
   237			 * mark arbitrary parts of the kernel direct mapping uncached,
   238			 * or remapped it uncached.
   239			 */
   240			set_uncached = IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED);
   241			remap = IS_ENABLED(CONFIG_DMA_DIRECT_REMAP);
   242			if (!set_uncached && !remap) {
   243				pr_warn_once("coherent DMA allocations not supported on this platform.\n");
   244				return NULL;
   245			}
   246		}
   247	
   248		/*
   249		 * Remapping or decrypting memory may block, allocate the memory from
   250		 * the atomic pools instead if we aren't allowed block.
   251		 */
   252		if ((remap || (attrs & DMA_ATTR_CC_DECRYPTED)) &&
   253		    dma_direct_use_pool(dev, gfp))
   254			return dma_direct_alloc_from_pool(dev, size, dma_handle, gfp);
   255	
   256		if (is_swiotlb_for_alloc(dev)) {
   257			page = dma_direct_alloc_swiotlb(dev, size);
   258			if (page) {
   259				mark_mem_decrypt = false;
   260				goto setup_page;
   261			}
   262			return NULL;
   263		}
   264	
   265		/* we always manually zero the memory once we are done */
   266		page = __dma_direct_alloc_pages(dev, size, gfp & ~__GFP_ZERO, true);
   267		if (!page)
   268			return NULL;
   269	
   270	setup_page:
   271		/*
   272		 * dma_alloc_contiguous can return highmem pages depending on a
   273		 * combination the cma= arguments and per-arch setup.  These need to be
   274		 * remapped to return a kernel virtual address.
   275		 */
   276		if (PageHighMem(page)) {
   277			remap = true;
   278			set_uncached = false;
   279		}
   280	
   281		if (remap) {
   282			pgprot_t prot = dma_pgprot(dev, PAGE_KERNEL, attrs);
   283	
   284			if (force_dma_unencrypted(dev))
   285				prot = pgprot_decrypted(prot);
   286	
   287			/* remove any dirty cache lines on the kernel alias */
   288			arch_dma_prep_coherent(page, size);
   289	
   290			/* create a coherent mapping */
   291			ret = dma_common_contiguous_remap(page, size, prot,
   292					__builtin_return_address(0));
   293			if (!ret)
   294				goto out_free_pages;
   295		} else {
   296			ret = page_address(page);
   297			if (mark_mem_decrypt && dma_set_decrypted(dev, ret, size))
   298				goto out_leak_pages;
   299		}
   300	
   301		memset(ret, 0, size);
   302	
   303		if (set_uncached) {
   304			arch_dma_prep_coherent(page, size);
   305			ret = arch_dma_set_uncached(ret, size);
   306			if (IS_ERR(ret))
   307				goto out_encrypt_pages;
   308		}
   309	
   310		*dma_handle = phys_to_dma_direct(dev, page_to_phys(page));
   311		return ret;
   312	
   313	out_encrypt_pages:
   314		if (mark_mem_decrypt && dma_set_encrypted(dev, page_address(page), size))
   315			return NULL;
   316	out_free_pages:
   317		__dma_direct_free_pages(dev, page, size);
   318		return NULL;
   319	out_leak_pages:
   320		return NULL;
   321	}
   322	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
