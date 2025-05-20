Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F7D21019C;
	Tue, 20 May 2025 10:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747735402; cv=none; b=Ae4wTjmuEf0ANkzduLVcIdxDkApaO1GFSIxavKkpW6mlDJpVuZd63bpIRX7I/FV/9MRiPktE+UhKvupJQ4bDFJLlmsh1pkxu0wMu71yPVMXFPPQiWNF7nB6OxIWQzh2LKSz6sDfE6RuEuqGVo2SO7y8aOQWXONoV/K+e9vXlNvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747735402; c=relaxed/simple;
	bh=7eqoc+veGPgqqU3GikScty5vCdbPEVkg1xlxjWedrMA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aDTaMS5Dw7pBEUM1PVqTHKqwb7ALJ473+F52dA/Npw0Uq06us/2db+EzpVomoUZwbeQhR8ys4e1pX3HJRLwr8busSTotVWOsAAWaJq314S3JJOaFmoZ+xVLfcfaJ53R5XCcHYdBX8bZdwVCqW+OpSLEwvjm9aD/65CG+5vMNGsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jJI7BClL; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jJI7BClL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747735400; x=1779271400;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7eqoc+veGPgqqU3GikScty5vCdbPEVkg1xlxjWedrMA=;
  b=jJI7BClLBJblqRAcX35yRTo3eRFalWzJpyhnShSIHPcBvT2uN3FS4uTP
   tsdZKzrL+KaDKRR9P6TfAWKto2SAXjj/LlKVg3WkitBu1M4f6QEoE/xhA
   H113nA73fMk/7nYBvB8Aed0jqjlQlUOo2jb6afnB/21S9lvGiTqw7uofS
   Yh9/Jzpqj/bZW7hNwf3cP0y+GgsYdYTNYwvN09x+3ktXaoVre4i2gxnU6
   1K5LKDBElewss+iSubRZfE/kCBtity52qjEEWaRZwbWa9wYClGVfcXASV
   GulPRFVf+iWYNKK2Dp0s15j/oUUdyZ5VjYnpfYb6OEtKxUwlUb2TcfvNE
   g==;
X-CSE-ConnectionGUID: D3JjfugrRdm+EhWicvOF2A==
X-CSE-MsgGUID: QJFEauksSeGps4XZz4h34w==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49563309"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="49563309"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 03:03:20 -0700
X-CSE-ConnectionGUID: ORDMWo8bQxur4KHHDjENag==
X-CSE-MsgGUID: Sdgc2swOReGV8J2Aw96+Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="144897042"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 20 May 2025 03:03:18 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHJoa-000MPs-1Q;
	Tue, 20 May 2025 10:03:16 +0000
Date: Tue, 20 May 2025 18:02:29 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:migration 18/22] mm/vmscan.c:1653:36: error: call
 to undeclared function '__folio_test_movable'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202505201714.DV7tq1ks-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux migration
head:   3cb1246117612eea7427990a681167665d573c5b
commit: df51097eb85022ebeee826550b5af38af7f3e124 [18/22] mm: stop using page->mapping for non-folio migration
config: hexagon-defconfig (https://download.01.org/0day-ci/archive/20250520/202505201714.DV7tq1ks-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250520/202505201714.DV7tq1ks-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505201714.DV7tq1ks-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/vmscan.c:1653:36: error: call to undeclared function '__folio_test_movable'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1653 |                     !folio_test_dirty(folio) && !__folio_test_movable(folio) &&
         |                                                  ^
   1 error generated.


vim +/__folio_test_movable +1653 mm/vmscan.c

^1da177e4c3f41 Linus Torvalds          2005-04-16  1637  
730ec8c01a2bd6 Maninder Singh          2020-06-03  1638  unsigned int reclaim_clean_pages_from_list(struct zone *zone,
b8cecb9376b9d3 Matthew Wilcox (Oracle  2022-06-17  1639) 					   struct list_head *folio_list)
02c6de8d757cb3 Minchan Kim             2012-10-08  1640  {
02c6de8d757cb3 Minchan Kim             2012-10-08  1641  	struct scan_control sc = {
02c6de8d757cb3 Minchan Kim             2012-10-08  1642  		.gfp_mask = GFP_KERNEL,
02c6de8d757cb3 Minchan Kim             2012-10-08  1643  		.may_unmap = 1,
02c6de8d757cb3 Minchan Kim             2012-10-08  1644  	};
1f318a9b0dc399 Jaewon Kim              2020-06-03  1645  	struct reclaim_stat stat;
730ec8c01a2bd6 Maninder Singh          2020-06-03  1646  	unsigned int nr_reclaimed;
b8cecb9376b9d3 Matthew Wilcox (Oracle  2022-06-17  1647) 	struct folio *folio, *next;
b8cecb9376b9d3 Matthew Wilcox (Oracle  2022-06-17  1648) 	LIST_HEAD(clean_folios);
2d2b8d2b67713d Yu Zhao                 2021-06-30  1649  	unsigned int noreclaim_flag;
02c6de8d757cb3 Minchan Kim             2012-10-08  1650  
b8cecb9376b9d3 Matthew Wilcox (Oracle  2022-06-17  1651) 	list_for_each_entry_safe(folio, next, folio_list, lru) {
b8cecb9376b9d3 Matthew Wilcox (Oracle  2022-06-17  1652) 		if (!folio_test_hugetlb(folio) && folio_is_file_lru(folio) &&
b8cecb9376b9d3 Matthew Wilcox (Oracle  2022-06-17 @1653) 		    !folio_test_dirty(folio) && !__folio_test_movable(folio) &&
b8cecb9376b9d3 Matthew Wilcox (Oracle  2022-06-17  1654) 		    !folio_test_unevictable(folio)) {
b8cecb9376b9d3 Matthew Wilcox (Oracle  2022-06-17  1655) 			folio_clear_active(folio);
b8cecb9376b9d3 Matthew Wilcox (Oracle  2022-06-17  1656) 			list_move(&folio->lru, &clean_folios);
02c6de8d757cb3 Minchan Kim             2012-10-08  1657  		}
02c6de8d757cb3 Minchan Kim             2012-10-08  1658  	}
02c6de8d757cb3 Minchan Kim             2012-10-08  1659  
2d2b8d2b67713d Yu Zhao                 2021-06-30  1660  	/*
2d2b8d2b67713d Yu Zhao                 2021-06-30  1661  	 * We should be safe here since we are only dealing with file pages and
2d2b8d2b67713d Yu Zhao                 2021-06-30  1662  	 * we are not kswapd and therefore cannot write dirty file pages. But
2d2b8d2b67713d Yu Zhao                 2021-06-30  1663  	 * call memalloc_noreclaim_save() anyway, just in case these conditions
2d2b8d2b67713d Yu Zhao                 2021-06-30  1664  	 * change in the future.
2d2b8d2b67713d Yu Zhao                 2021-06-30  1665  	 */
2d2b8d2b67713d Yu Zhao                 2021-06-30  1666  	noreclaim_flag = memalloc_noreclaim_save();
49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  1667) 	nr_reclaimed = shrink_folio_list(&clean_folios, zone->zone_pgdat, &sc,
7d709f49babc28 Gregory Price           2025-04-24  1668  					&stat, true, NULL);
2d2b8d2b67713d Yu Zhao                 2021-06-30  1669  	memalloc_noreclaim_restore(noreclaim_flag);
2d2b8d2b67713d Yu Zhao                 2021-06-30  1670  
b8cecb9376b9d3 Matthew Wilcox (Oracle  2022-06-17  1671) 	list_splice(&clean_folios, folio_list);
2da9f6305f306f Nicholas Piggin         2020-11-13  1672  	mod_node_page_state(zone->zone_pgdat, NR_ISOLATED_FILE,
2da9f6305f306f Nicholas Piggin         2020-11-13  1673  			    -(long)nr_reclaimed);
1f318a9b0dc399 Jaewon Kim              2020-06-03  1674  	/*
1f318a9b0dc399 Jaewon Kim              2020-06-03  1675  	 * Since lazyfree pages are isolated from file LRU from the beginning,
1f318a9b0dc399 Jaewon Kim              2020-06-03  1676  	 * they will rotate back to anonymous LRU in the end if it failed to
1f318a9b0dc399 Jaewon Kim              2020-06-03  1677  	 * discard so isolated count will be mismatched.
1f318a9b0dc399 Jaewon Kim              2020-06-03  1678  	 * Compensate the isolated count for both LRU lists.
1f318a9b0dc399 Jaewon Kim              2020-06-03  1679  	 */
1f318a9b0dc399 Jaewon Kim              2020-06-03  1680  	mod_node_page_state(zone->zone_pgdat, NR_ISOLATED_ANON,
1f318a9b0dc399 Jaewon Kim              2020-06-03  1681  			    stat.nr_lazyfree_fail);
1f318a9b0dc399 Jaewon Kim              2020-06-03  1682  	mod_node_page_state(zone->zone_pgdat, NR_ISOLATED_FILE,
2da9f6305f306f Nicholas Piggin         2020-11-13  1683  			    -(long)stat.nr_lazyfree_fail);
1f318a9b0dc399 Jaewon Kim              2020-06-03  1684  	return nr_reclaimed;
02c6de8d757cb3 Minchan Kim             2012-10-08  1685  }
02c6de8d757cb3 Minchan Kim             2012-10-08  1686  

:::::: The code at line 1653 was first introduced by commit
:::::: b8cecb9376b9d3031cf62b476a0db087b6b01072 mm/vmscan: convert reclaim_clean_pages_from_list() to folios

:::::: TO: Matthew Wilcox (Oracle) <willy@infradead.org>
:::::: CC: akpm <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
