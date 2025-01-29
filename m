Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C533F190072;
	Wed, 29 Jan 2025 08:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738138777; cv=none; b=eSBHpvK2lmo5PeaPORMl0E2r2xLp7gORs7RsJ6Ms+tuMTkslFMbOTJuCxyNkG8JYlulyyO4L9q1nZrDpQkm56Ss2rD1Gb/4iQkRCKrhZaL8UV8rfnmRqsjVAlBFA/OSWYlC637ZmgEl3Wy1BXVcz3BfC3aUHWhXy6y0lpS5NvRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738138777; c=relaxed/simple;
	bh=ICSlWXGrLcjz7oos7aXj90z/WkA/0dcXFNnVmIYTYPk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t/I9zRaZrXbl6RaCrju2VqSgHip4IrrOLcHL4ZvDP0DPgFgoE4Myhf0IL3n9gMbrZjuWohbH1ulX4k24SeV2AL6xBj+LvgvW2NINaCS0esCXX48VtQ0O95kYRCUobUaCgNt57vCcIBUbOdszoPKyRK8loYTfOqOkqz6KRYGBy28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nmnW8HAc; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nmnW8HAc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738138776; x=1769674776;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ICSlWXGrLcjz7oos7aXj90z/WkA/0dcXFNnVmIYTYPk=;
  b=nmnW8HAcAFSLQ2aWO8H59MCfUDplZ4hH41/q5UExokwsG48n/AdN7yxI
   0aL67vW59nQiZQel+nDM1BUINscJqRtfDLoJZAzced9sSnxFASUPBkwFD
   bUlo0KZILRZGopc1/VT+z3lhC2VAMuA400qz0Qvz///ufyYxJ/YZ0BTra
   LfdZ4jFjihGZkV4okCTpEUXCd39naaCPvyaUoWSOfg3Wwf+GOUE0PpvaF
   BWeRqyzbRwLlEP+dmxg7/OruXeZ30amON0ifKXqn2UTfieIJOcNJd+xlP
   6K2QeW5VxHNCEFhLMfNpQv5G4UNiF7RU+KINB+o5xPg/GhWVtSiSI3ptO
   g==;
X-CSE-ConnectionGUID: DA2CYCM5R7GttuCw6xc7nA==
X-CSE-MsgGUID: jTVk3/CwRDuNjmL76zQ3BA==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38545727"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; 
   d="scan'208";a="38545727"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 00:19:35 -0800
X-CSE-ConnectionGUID: gfznwO0/SAmXZsTxnsZxTA==
X-CSE-MsgGUID: pfnwO8kPStWz/f/5enr5xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114094360"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 29 Jan 2025 00:19:34 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1td3IJ-000il9-0b;
	Wed, 29 Jan 2025 08:19:31 +0000
Date: Wed, 29 Jan 2025 16:18:56 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pages 6/20] drivers/iommu/iommu-pages.c:38:40:
 error: use of undeclared identifier 'NR_IOMMU_PAGES'; did you mean
 'NR_MEMMAP_PAGES'?
Message-ID: <202501291628.UWEGyLaJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_pages
head:   470a82a6588cba1a19210a78a710620a15b6019b
commit: 6c72aac62af905e9c969c12aa399d8bed4b4d033 [6/20] iommu/pages: De-inline the substantial functions
config: hexagon-randconfig-002-20250129 (https://download.01.org/0day-ci/archive/20250129/202501291628.UWEGyLaJ-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 19306351a2c45e266fa11b41eb1362b20b6ca56d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250129/202501291628.UWEGyLaJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501291628.UWEGyLaJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iommu/iommu-pages.c:38:40: error: use of undeclared identifier 'NR_IOMMU_PAGES'; did you mean 'NR_MEMMAP_PAGES'?
      38 |         mod_node_page_state(page_pgdat(page), NR_IOMMU_PAGES, pgcnt);
         |                                               ^~~~~~~~~~~~~~
         |                                               NR_MEMMAP_PAGES
   include/linux/vmstat.h:42:2: note: 'NR_MEMMAP_PAGES' declared here
      42 |         NR_MEMMAP_PAGES,        /* page metadata allocated through buddy allocator */
         |         ^
   drivers/iommu/iommu-pages.c:38:40: warning: implicit conversion from enumeration type 'enum vm_stat_item' to different enumeration type 'enum node_stat_item' [-Wenum-conversion]
      38 |         mod_node_page_state(page_pgdat(page), NR_IOMMU_PAGES, pgcnt);
         |         ~~~~~~~~~~~~~~~~~~~                   ^~~~~~~~~~~~~~
   drivers/iommu/iommu-pages.c:50:40: error: use of undeclared identifier 'NR_IOMMU_PAGES'; did you mean 'NR_MEMMAP_PAGES'?
      50 |         mod_node_page_state(page_pgdat(page), NR_IOMMU_PAGES, -pgcnt);
         |                                               ^~~~~~~~~~~~~~
         |                                               NR_MEMMAP_PAGES
   include/linux/vmstat.h:42:2: note: 'NR_MEMMAP_PAGES' declared here
      42 |         NR_MEMMAP_PAGES,        /* page metadata allocated through buddy allocator */
         |         ^
   drivers/iommu/iommu-pages.c:50:40: warning: implicit conversion from enumeration type 'enum vm_stat_item' to different enumeration type 'enum node_stat_item' [-Wenum-conversion]
      50 |         mod_node_page_state(page_pgdat(page), NR_IOMMU_PAGES, -pgcnt);
         |         ~~~~~~~~~~~~~~~~~~~                   ^~~~~~~~~~~~~~
   2 warnings and 2 errors generated.


vim +38 drivers/iommu/iommu-pages.c

     9	
    10	/**
    11	 * iommu_alloc_pages_node - Allocate a zeroed page of a given order from
    12	 *                          specific NUMA node
    13	 * @nid: memory NUMA node id
    14	 * @gfp: buddy allocator flags
    15	 * @order: page order
    16	 *
    17	 * Returns the virtual address of the allocated page. The page must be
    18	 * freed either by calling iommu_free_page() or via iommu_put_pages_list().
    19	 */
    20	void *iommu_alloc_pages_node(int nid, gfp_t gfp, unsigned int order)
    21	{
    22		const unsigned long pgcnt = 1UL << order;
    23		struct page *page;
    24	
    25		page = alloc_pages_node(nid, gfp | __GFP_ZERO | __GFP_COMP, order);
    26		if (unlikely(!page))
    27			return NULL;
    28	
    29		/*
    30		 * All page allocations that should be reported to as "iommu-pagetables"
    31		 * to userspace must use one of the functions below. This includes
    32		 * allocations of page-tables and other per-iommu_domain configuration
    33		 * structures.
    34		 *
    35		 * This is necessary for the proper accounting as IOMMU state can be
    36		 * rather large, i.e. multiple gigabytes in size.
    37		 */
  > 38		mod_node_page_state(page_pgdat(page), NR_IOMMU_PAGES, pgcnt);
    39		mod_lruvec_page_state(page, NR_SECONDARY_PAGETABLE, pgcnt);
    40	
    41		return page_address(page);
    42	}
    43	EXPORT_SYMBOL_GPL(iommu_alloc_pages_node);
    44	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
