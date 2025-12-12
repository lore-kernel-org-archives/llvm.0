Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4EC30100A;
	Fri, 12 Dec 2025 18:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765563502; cv=none; b=ibwD8Bg9dox6wOGgAgTxtC+718ct8eNrYYM++dg86hY6QYaz6O25Z9Fh8nFKluNoCYBtdGI7vm+pj347RntbZaOmrBxN30MwV2Vu1MhjJmIc7/hZALsngwul1qFmbO/aiurDw3zmfCMF2CPlnAUTuzxV5W47BsK3aqFMo1XXT30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765563502; c=relaxed/simple;
	bh=vgieZJf5PSmYMquJr8+2DHc3P1z56z+BK7Nb9LuuUMg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mjkJZjz5k+PwoSNsogT6efjMES5qkjnyRGBQFMJiOOGeBUVWAs7Q+iatNjxtRrkdvZsFwsG5PxsxrXBNEJoIwoP3moHCm4FwCZ5l879HMuVUdR7jSarZTyuJcInMBKrqnEXpueokEb952R3nvfsjPC+VJlHe5AcoI5zA4/78Eo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HL+JYMaj; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HL+JYMaj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765563500; x=1797099500;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vgieZJf5PSmYMquJr8+2DHc3P1z56z+BK7Nb9LuuUMg=;
  b=HL+JYMajT7DnNS0ztUxrQwu7O/tapnwivQj0gu6OCSf4ofb7CSkloDlD
   PatBm0KJppQSovx4KsQKO5ovFRugJTV7aWQ8UOrfThv7Xr7hCbrkzLwly
   AV9/KM+q4JUKJ/s7dduD0GMK9LVBgtfQpfPwXQMcOEBrGZ2cwdg/NdI55
   gtXs6IHPPKJiSDuF7SeQ4RWGKguokiQE13EmvraLkCVDTiKQxuyNE7TcX
   pjZOgSxQXX5D/GPV224E5UxTE2/R+lxq5BlkJnTOdP/5DsSq+I/x03EI8
   8zRvwYqYcLjHt1FKorA4bxMOO0JAg57SjwTZ7eAS7xcCoNampJB54CFq3
   w==;
X-CSE-ConnectionGUID: q3CIMHyFR/mO7GkMfpMKCA==
X-CSE-MsgGUID: MkCMRauCTduNw8PEDQmCUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="79028775"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="79028775"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 10:18:18 -0800
X-CSE-ConnectionGUID: pUsD5irNS7S9lEorp0ltDQ==
X-CSE-MsgGUID: s4dryQk2Tz+tTiSSGqnEgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="196225883"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Dec 2025 10:18:17 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU7iX-000000006QE-33Ne;
	Fri, 12 Dec 2025 18:18:13 +0000
Date: Sat, 13 Dec 2025 02:17:51 +0800
From: kernel test robot <lkp@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Matthew Brost <matthew.brost@intel.com>
Subject: drivers/gpu/drm/drm_pagemap.c:459:21: warning: parameter 'addr' set
 but not used
Message-ID: <202512130251.w5A5gybr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   187d0801404f415f22c0b31531982c7ea97fa341
commit: ddeda6136038b4b313bb6f9b44f2d363e1233814 drm/pagemap: Allocate folios when possible
date:   4 months ago
config: x86_64-randconfig-003-20251212 (https://download.01.org/0day-ci/archive/20251213/202512130251.w5A5gybr-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512130251.w5A5gybr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512130251.w5A5gybr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_pagemap.c:459:21: warning: parameter 'addr' set but not used [-Wunused-but-set-parameter]
     459 |                                                 unsigned long addr)
         |                                                               ^
   1 warning generated.


vim +/addr +459 drivers/gpu/drm/drm_pagemap.c

f86ad0ed620cb3 Matthew Brost   2025-06-19  435  
f86ad0ed620cb3 Matthew Brost   2025-06-19  436  /**
f86ad0ed620cb3 Matthew Brost   2025-06-19  437   * drm_pagemap_migrate_populate_ram_pfn() - Populate RAM PFNs for a VM area
f86ad0ed620cb3 Matthew Brost   2025-06-19  438   * @vas: Pointer to the VM area structure, can be NULL
f86ad0ed620cb3 Matthew Brost   2025-06-19  439   * @fault_page: Fault page
f86ad0ed620cb3 Matthew Brost   2025-06-19  440   * @npages: Number of pages to populate
f86ad0ed620cb3 Matthew Brost   2025-06-19  441   * @mpages: Number of pages to migrate
f86ad0ed620cb3 Matthew Brost   2025-06-19  442   * @src_mpfn: Source array of migrate PFNs
f86ad0ed620cb3 Matthew Brost   2025-06-19  443   * @mpfn: Array of migrate PFNs to populate
f86ad0ed620cb3 Matthew Brost   2025-06-19  444   * @addr: Start address for PFN allocation
f86ad0ed620cb3 Matthew Brost   2025-06-19  445   *
f86ad0ed620cb3 Matthew Brost   2025-06-19  446   * This function populates the RAM migrate page frame numbers (PFNs) for the
f86ad0ed620cb3 Matthew Brost   2025-06-19  447   * specified VM area structure. It allocates and locks pages in the VM area for
f86ad0ed620cb3 Matthew Brost   2025-06-19  448   * RAM usage. If vas is non-NULL use alloc_page_vma for allocation, if NULL use
f86ad0ed620cb3 Matthew Brost   2025-06-19  449   * alloc_page for allocation.
f86ad0ed620cb3 Matthew Brost   2025-06-19  450   *
f86ad0ed620cb3 Matthew Brost   2025-06-19  451   * Return: 0 on success, negative error code on failure.
f86ad0ed620cb3 Matthew Brost   2025-06-19  452   */
f86ad0ed620cb3 Matthew Brost   2025-06-19  453  static int drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
f86ad0ed620cb3 Matthew Brost   2025-06-19  454  						struct page *fault_page,
f86ad0ed620cb3 Matthew Brost   2025-06-19  455  						unsigned long npages,
f86ad0ed620cb3 Matthew Brost   2025-06-19  456  						unsigned long *mpages,
f86ad0ed620cb3 Matthew Brost   2025-06-19  457  						unsigned long *src_mpfn,
f86ad0ed620cb3 Matthew Brost   2025-06-19  458  						unsigned long *mpfn,
f86ad0ed620cb3 Matthew Brost   2025-06-19 @459  						unsigned long addr)
f86ad0ed620cb3 Matthew Brost   2025-06-19  460  {
f86ad0ed620cb3 Matthew Brost   2025-06-19  461  	unsigned long i;
f86ad0ed620cb3 Matthew Brost   2025-06-19  462  
ddeda6136038b4 Francois Dugast 2025-08-05  463  	for (i = 0; i < npages;) {
ddeda6136038b4 Francois Dugast 2025-08-05  464  		struct page *page = NULL, *src_page;
ddeda6136038b4 Francois Dugast 2025-08-05  465  		struct folio *folio;
ddeda6136038b4 Francois Dugast 2025-08-05  466  		unsigned int order = 0;
f86ad0ed620cb3 Matthew Brost   2025-06-19  467  
f86ad0ed620cb3 Matthew Brost   2025-06-19  468  		if (!(src_mpfn[i] & MIGRATE_PFN_MIGRATE))
ddeda6136038b4 Francois Dugast 2025-08-05  469  			goto next;
f86ad0ed620cb3 Matthew Brost   2025-06-19  470  
f86ad0ed620cb3 Matthew Brost   2025-06-19  471  		src_page = migrate_pfn_to_page(src_mpfn[i]);
f86ad0ed620cb3 Matthew Brost   2025-06-19  472  		if (!src_page)
ddeda6136038b4 Francois Dugast 2025-08-05  473  			goto next;
f86ad0ed620cb3 Matthew Brost   2025-06-19  474  
f86ad0ed620cb3 Matthew Brost   2025-06-19  475  		if (fault_page) {
f86ad0ed620cb3 Matthew Brost   2025-06-19  476  			if (src_page->zone_device_data !=
f86ad0ed620cb3 Matthew Brost   2025-06-19  477  			    fault_page->zone_device_data)
ddeda6136038b4 Francois Dugast 2025-08-05  478  				goto next;
f86ad0ed620cb3 Matthew Brost   2025-06-19  479  		}
f86ad0ed620cb3 Matthew Brost   2025-06-19  480  
ddeda6136038b4 Francois Dugast 2025-08-05  481  		order = folio_order(page_folio(src_page));
ddeda6136038b4 Francois Dugast 2025-08-05  482  
ddeda6136038b4 Francois Dugast 2025-08-05  483  		/* TODO: Support fallback to single pages if THP allocation fails */
f86ad0ed620cb3 Matthew Brost   2025-06-19  484  		if (vas)
ddeda6136038b4 Francois Dugast 2025-08-05  485  			folio = vma_alloc_folio(GFP_HIGHUSER, order, vas, addr);
f86ad0ed620cb3 Matthew Brost   2025-06-19  486  		else
ddeda6136038b4 Francois Dugast 2025-08-05  487  			folio = folio_alloc(GFP_HIGHUSER, order);
f86ad0ed620cb3 Matthew Brost   2025-06-19  488  
ddeda6136038b4 Francois Dugast 2025-08-05  489  		if (!folio)
f86ad0ed620cb3 Matthew Brost   2025-06-19  490  			goto free_pages;
f86ad0ed620cb3 Matthew Brost   2025-06-19  491  
ddeda6136038b4 Francois Dugast 2025-08-05  492  		page = folio_page(folio, 0);
f86ad0ed620cb3 Matthew Brost   2025-06-19  493  		mpfn[i] = migrate_pfn(page_to_pfn(page));
ddeda6136038b4 Francois Dugast 2025-08-05  494  
ddeda6136038b4 Francois Dugast 2025-08-05  495  next:
ddeda6136038b4 Francois Dugast 2025-08-05  496  		if (page)
ddeda6136038b4 Francois Dugast 2025-08-05  497  			addr += page_size(page);
ddeda6136038b4 Francois Dugast 2025-08-05  498  		else
ddeda6136038b4 Francois Dugast 2025-08-05  499  			addr += PAGE_SIZE;
ddeda6136038b4 Francois Dugast 2025-08-05  500  
ddeda6136038b4 Francois Dugast 2025-08-05  501  		i += NR_PAGES(order);
f86ad0ed620cb3 Matthew Brost   2025-06-19  502  	}
f86ad0ed620cb3 Matthew Brost   2025-06-19  503  
ddeda6136038b4 Francois Dugast 2025-08-05  504  	for (i = 0; i < npages;) {
f86ad0ed620cb3 Matthew Brost   2025-06-19  505  		struct page *page = migrate_pfn_to_page(mpfn[i]);
ddeda6136038b4 Francois Dugast 2025-08-05  506  		unsigned int order = 0;
f86ad0ed620cb3 Matthew Brost   2025-06-19  507  
f86ad0ed620cb3 Matthew Brost   2025-06-19  508  		if (!page)
ddeda6136038b4 Francois Dugast 2025-08-05  509  			goto next_lock;
ddeda6136038b4 Francois Dugast 2025-08-05  510  
ddeda6136038b4 Francois Dugast 2025-08-05  511  		WARN_ON_ONCE(!folio_trylock(page_folio(page)));
f86ad0ed620cb3 Matthew Brost   2025-06-19  512  
ddeda6136038b4 Francois Dugast 2025-08-05  513  		order = folio_order(page_folio(page));
ddeda6136038b4 Francois Dugast 2025-08-05  514  		*mpages += NR_PAGES(order);
ddeda6136038b4 Francois Dugast 2025-08-05  515  
ddeda6136038b4 Francois Dugast 2025-08-05  516  next_lock:
ddeda6136038b4 Francois Dugast 2025-08-05  517  		i += NR_PAGES(order);
f86ad0ed620cb3 Matthew Brost   2025-06-19  518  	}
f86ad0ed620cb3 Matthew Brost   2025-06-19  519  
f86ad0ed620cb3 Matthew Brost   2025-06-19  520  	return 0;
f86ad0ed620cb3 Matthew Brost   2025-06-19  521  
f86ad0ed620cb3 Matthew Brost   2025-06-19  522  free_pages:
ddeda6136038b4 Francois Dugast 2025-08-05  523  	for (i = 0; i < npages;) {
f86ad0ed620cb3 Matthew Brost   2025-06-19  524  		struct page *page = migrate_pfn_to_page(mpfn[i]);
ddeda6136038b4 Francois Dugast 2025-08-05  525  		unsigned int order = 0;
f86ad0ed620cb3 Matthew Brost   2025-06-19  526  
f86ad0ed620cb3 Matthew Brost   2025-06-19  527  		if (!page)
ddeda6136038b4 Francois Dugast 2025-08-05  528  			goto next_put;
f86ad0ed620cb3 Matthew Brost   2025-06-19  529  
f86ad0ed620cb3 Matthew Brost   2025-06-19  530  		put_page(page);
f86ad0ed620cb3 Matthew Brost   2025-06-19  531  		mpfn[i] = 0;
ddeda6136038b4 Francois Dugast 2025-08-05  532  
ddeda6136038b4 Francois Dugast 2025-08-05  533  		order = folio_order(page_folio(page));
ddeda6136038b4 Francois Dugast 2025-08-05  534  
ddeda6136038b4 Francois Dugast 2025-08-05  535  next_put:
ddeda6136038b4 Francois Dugast 2025-08-05  536  		i += NR_PAGES(order);
f86ad0ed620cb3 Matthew Brost   2025-06-19  537  	}
f86ad0ed620cb3 Matthew Brost   2025-06-19  538  	return -ENOMEM;
f86ad0ed620cb3 Matthew Brost   2025-06-19  539  }
f86ad0ed620cb3 Matthew Brost   2025-06-19  540  

:::::: The code at line 459 was first introduced by commit
:::::: f86ad0ed620cb3c91ec7d5468e93ac68d727539d drm/gpusvm, drm/pagemap: Move migration functionality to drm_pagemap

:::::: TO: Matthew Brost <matthew.brost@intel.com>
:::::: CC: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
