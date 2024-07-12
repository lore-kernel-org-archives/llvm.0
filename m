Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B000B1BC3C;
	Fri, 12 Jul 2024 23:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720825675; cv=none; b=mPBwA2uHEzWgjxSk03pc+9RRtwV8ISb6YFh9bxuD2WSP3kH3MGRe+xsBb4xNPVrf8JOfzuE+72SyF7BDyh9Yt/nPviOm0gOoSplwkFVMBhvGXM+QXPT4QWSjkJt+0T9sy6ptXPI/5Oy0l94FxcZJNvzAwWapJGJ54EDnQIlwWmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720825675; c=relaxed/simple;
	bh=FlJzMkZUonaDBUYlMK8y3nTq3YsCaK08EgrMcWax4y8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fb+8Z8a/K8rN0+j9FO4Uak/fDt1Xy97rkJdLc+/rgnyzKPGcnvgzwco7K6KMSqdzucaPdlc/QwhssbQbHm10MRqMdQR6HdcQvWodMeDvvxueG946ovpbM+D4haoCB1Hnaxz9lyy15qST1v9KdIeBAoU/c6MkPhWcYVARq/b94e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=frDz4I6m; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="frDz4I6m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720825673; x=1752361673;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FlJzMkZUonaDBUYlMK8y3nTq3YsCaK08EgrMcWax4y8=;
  b=frDz4I6mHF7B34PG6Cb0ftTWugTze1Y1h6qlcZr29LEhysFWyTmGwLQM
   rtOMi0Ev7lKu5yACZW+9duOHrSHpQPdWOuIAUDQ9dPKi9M5wdQWMiPlE5
   Zfw2rhIE7FMp3WPMPZuylbVw1086UYjVPBIWvhhQlKp7Ck2g3ZjB59niR
   8mBusUXwFObrzztZvr5IQBLjqI7VfPw/cEZIhuLXsiEufkZCBuspZQS3G
   /JX10HIBGZOU+uC5A+4dcSk0EH9Oirdxph38WynvgGeYoauiQayrSjnty
   XnQnxmkm5HMu1yUifAz+9knc8yu7j7E9AQTJFgXLTU84zsiWEIo7bNBA1
   Q==;
X-CSE-ConnectionGUID: 2iH+Vx73TFOPN8qfA2hM1A==
X-CSE-MsgGUID: N+4A38AjTYmu1keyQcLf8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="29432882"
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; 
   d="scan'208";a="29432882"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2024 16:07:53 -0700
X-CSE-ConnectionGUID: Wvolja3yS7qTfD+GV7OWvQ==
X-CSE-MsgGUID: I08Aao9LQHGeNQ6lv7ndcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; 
   d="scan'208";a="49444965"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Jul 2024 16:07:52 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSPMj-000bQA-2V;
	Fri, 12 Jul 2024 23:07:49 +0000
Date: Sat, 13 Jul 2024 07:07:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pt 2/10]
 drivers/iommu/generic_pt/pt_alloc.c:56:42: error: use of undeclared
 identifier 'NR_IOMMU_PAGES'
Message-ID: <202407130736.0MFZvTRI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_pt
head:   262ff230b5cf17a8a573be8dbee522de7a36a87a
commit: 5082473c62fd387bdbf136fb1eef8c78b0dc1633 [2/10] genpt: Add an allocator for page table levels
config: um-randconfig-002-20240713 (https://download.01.org/0day-ci/archive/20240713/202407130736.0MFZvTRI-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240713/202407130736.0MFZvTRI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407130736.0MFZvTRI-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/iommu/generic_pt/pt_alloc.c:5:
   In file included from drivers/iommu/generic_pt/pt_alloc.h:9:
   In file included from include/linux/mm.h:2258:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/iommu/generic_pt/pt_alloc.c:56:42: error: use of undeclared identifier 'NR_IOMMU_PAGES'
      56 |         mod_node_page_state(folio_pgdat(folio), NR_IOMMU_PAGES, 1UL << order);
         |                                                 ^
   drivers/iommu/generic_pt/pt_alloc.c:72:43: error: use of undeclared identifier 'NR_IOMMU_PAGES'
      72 |                 mod_node_page_state(folio_pgdat(folio), NR_IOMMU_PAGES, -pgcnt);
         |                                                         ^
   1 warning and 2 errors generated.


vim +/NR_IOMMU_PAGES +56 drivers/iommu/generic_pt/pt_alloc.c

   > 5	#include "pt_alloc.h"
     6	
     7	#include <linux/mm.h>
     8	
     9	#define RADIX_MATCH(pg, rl)                        \
    10		static_assert(offsetof(struct page, pg) == \
    11			      offsetof(struct pt_radix_meta, rl))
    12	RADIX_MATCH(flags, __page_flags);
    13	RADIX_MATCH(rcu_head, rcu_head);	/* Ensure bit 0 is clear */
    14	RADIX_MATCH(mapping, __page_mapping);
    15	RADIX_MATCH(private, free_next);
    16	RADIX_MATCH(page_type, __page_type);
    17	RADIX_MATCH(_refcount, __page_refcount);
    18	#ifdef CONFIG_MEMCG
    19	RADIX_MATCH(memcg_data, memcg_data);
    20	#endif
    21	#undef RADIX_MATCH
    22	static_assert(sizeof(struct pt_radix_meta) <= sizeof(struct page));
    23	
    24	static inline struct folio *meta_to_folio(struct pt_radix_meta *meta)
    25	{
    26		return (struct folio *)meta;
    27	}
    28	
    29	void *pt_radix_alloc(struct pt_common *owner, int nid, size_t log2size,
    30			     gfp_t gfp)
    31	{
    32		struct pt_radix_meta *meta;
    33		unsigned int order = log2size - PAGE_SHIFT;
    34		struct folio *folio;
    35	
    36		/*
    37		 * FIXME we need to support sub page size tables, eg to allow a 4K table
    38		 * on a 64K kernel. This should be done by allocating extra memory
    39		 * per page and placing the pointer in the meta. The extra memory can
    40		 * contain the additional list heads and rcu's required.
    41		 */
    42		if (log2size < PAGE_SHIFT)
    43			order = 0;
    44	
    45		nid = NUMA_NO_NODE; // FIXME
    46		folio = (struct folio *)alloc_pages_node(
    47			nid, gfp | __GFP_ZERO | __GFP_COMP, order);
    48		if (!folio)
    49			return ERR_PTR(-ENOMEM);
    50	
    51		meta = folio_to_meta(folio);
    52		meta->owner = owner;
    53		meta->free_next = NULL;
    54		meta->log2size = log2size;
    55	
  > 56		mod_node_page_state(folio_pgdat(folio), NR_IOMMU_PAGES, 1UL << order);
    57		lruvec_stat_mod_folio(folio, NR_SECONDARY_PAGETABLE, 1UL << order);
    58	
    59		return folio_address(folio);
    60	}
    61	EXPORT_SYMBOL_NS_GPL(pt_radix_alloc, GENERIC_PT);
    62	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
