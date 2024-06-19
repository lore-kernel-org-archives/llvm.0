Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB2D55882;
	Wed, 19 Jun 2024 02:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718764361; cv=none; b=HMH5vZ6tNsZ2u24E+y3NpLYKEQ2GKCXwfXoKgs5LbgmxT64fF1qu2ZN9GMK3iH6YjaHC0U8oqHyiMVAqZTVenbuIFCL+aHENLXb7bYwbWoKP8WUTey2/R0N53++1AsJchc+kapFi9SHbeM937Y1L5zRZT5vXPoR0b577yYugO+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718764361; c=relaxed/simple;
	bh=xSjJyRcAmfQwegy04ePRYrEszJqE6K4JSDiplSHQCE8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gDThW2vyaRXzFHbxbx7RFLl8PCulP3Pe3Gog2F09s5iFgfb4CEJlcDy52eZ9/HjoJmxPAzGUd++ZfqH0aS1xuTbO9icChNwDVgD97AzreL89tHktEqcvPtzud9JlDsQudRrC229TRm3JaXHhqeF2JAp2CFA0jSsGRhd0zoU7zC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ipRM8Kbk; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ipRM8Kbk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718764359; x=1750300359;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xSjJyRcAmfQwegy04ePRYrEszJqE6K4JSDiplSHQCE8=;
  b=ipRM8KbkOPXNg1o+oiLYLIZpbdB92u6+ca0vNf86Bmvjh8xRtoqPqqrZ
   bXHPgKGyt/ecfFdrl2kpoLXDR5NU7qBWtxTCOyochHqwI1yi6BUjeEfPw
   b6S1k+m+E9mNZc3PLrbXfdTcNuJqrSRA5mWJY3nv73Vs3de/JSc5Yrf0Z
   NI8ftRoC+mwZw2aM7oYg7PTf5UaDo81htUKTpuZJzkakJBr0eNbCqt2wH
   akqGcfobH1LK48B++8HDf1VUv6RTEDW8D7CZtWkfY5mA4nbrbnSspHhxj
   3GCDqJ9hn+uSaruxE8Frdnfd+c6TEKvO3cfEfbsqo8fNS7SgqiHv30HqG
   g==;
X-CSE-ConnectionGUID: 8P/TJ2HNTLitnc/0WN+LOA==
X-CSE-MsgGUID: yNRXV038REWc52zyDDYeMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="15442685"
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; 
   d="scan'208";a="15442685"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2024 19:32:38 -0700
X-CSE-ConnectionGUID: uxlq60ofSkOWEXl0LSG/OA==
X-CSE-MsgGUID: gS3ZNGZrQG2BC4jRdIxg3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; 
   d="scan'208";a="41890406"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Jun 2024 19:32:37 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJl7i-0006BS-2z;
	Wed, 19 Jun 2024 02:32:34 +0000
Date: Wed, 19 Jun 2024 10:32:12 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:rmap_id 10/10] mm/internal.h:659:2: error: call to
 undeclared function '__folio_prep_large_mapcount'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202406191000.EqmfjbTD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux rmap_id
head:   28522f2898f6be45285b138912245f743d2118b5
commit: d7bf123ba843ca74ae36377c58b495264fdb3dbd [10/10] rmap_id
config: arm-randconfig-003-20240619 (https://download.01.org/0day-ci/archive/20240619/202406191000.EqmfjbTD-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 78ee473784e5ef6f0b19ce4cb111fb6e4d23c6b2)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240619/202406191000.EqmfjbTD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406191000.EqmfjbTD-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/vmscan.c:15:
   In file included from include/linux/mm.h:2258:
   include/linux/vmstat.h:498:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     498 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/vmscan.c:30:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   In file included from mm/vmscan.c:67:
>> mm/internal.h:659:2: error: call to undeclared function '__folio_prep_large_mapcount'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     659 |         __folio_prep_large_mapcount(folio, order);
         |         ^
   mm/internal.h:659:2: note: did you mean 'folio_large_mapcount'?
   include/linux/mm.h:1237:19: note: 'folio_large_mapcount' declared here
    1237 | static inline int folio_large_mapcount(const struct folio *folio)
         |                   ^
   mm/vmscan.c:401:51: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     401 |                         size += zone_page_state(zone, NR_ZONE_LRU_BASE + lru);
         |                                                       ~~~~~~~~~~~~~~~~ ^ ~~~
   mm/vmscan.c:1729:4: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    1729 |                         __count_zid_vm_events(PGSCAN_SKIP, zid, nr_skipped[zid]);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:119:34: note: expanded from macro '__count_zid_vm_events'
     119 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   mm/vmscan.c:2232:51: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
    2232 |         inactive = lruvec_page_state(lruvec, NR_LRU_BASE + inactive_lru);
         |                                              ~~~~~~~~~~~ ^ ~~~~~~~~~~~~
   mm/vmscan.c:2233:49: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
    2233 |         active = lruvec_page_state(lruvec, NR_LRU_BASE + active_lru);
         |                                            ~~~~~~~~~~~ ^ ~~~~~~~~~~
   mm/vmscan.c:6259:3: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    6259 |                 __count_zid_vm_events(ALLOCSTALL, sc->reclaim_idx, 1);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:119:34: note: expanded from macro '__count_zid_vm_events'
     119 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   8 warnings and 1 error generated.
--
   In file included from mm/list_lru.c:10:
   In file included from include/linux/mm.h:2258:
   include/linux/vmstat.h:498:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     498 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/list_lru.c:16:
>> mm/internal.h:659:2: error: call to undeclared function '__folio_prep_large_mapcount'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     659 |         __folio_prep_large_mapcount(folio, order);
         |         ^
   mm/internal.h:659:2: note: did you mean 'folio_large_mapcount'?
   include/linux/mm.h:1237:19: note: 'folio_large_mapcount' declared here
    1237 | static inline int folio_large_mapcount(const struct folio *folio)
         |                   ^
   1 warning and 1 error generated.
--
   In file included from mm/workingset.c:8:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2258:
   include/linux/vmstat.h:498:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     498 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/workingset.c:9:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   In file included from mm/workingset.c:19:
>> mm/internal.h:659:2: error: call to undeclared function '__folio_prep_large_mapcount'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     659 |         __folio_prep_large_mapcount(folio, order);
         |         ^
   mm/internal.h:659:2: note: did you mean 'folio_large_mapcount'?
   include/linux/mm.h:1237:19: note: 'folio_large_mapcount' declared here
    1237 | static inline int folio_large_mapcount(const struct folio *folio)
         |                   ^
   3 warnings and 1 error generated.
--
   In file included from mm/page_alloc.c:19:
   In file included from include/linux/mm.h:2258:
   include/linux/vmstat.h:498:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     498 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/page_alloc.c:44:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   In file included from mm/page_alloc.c:59:
>> mm/internal.h:659:2: error: call to undeclared function '__folio_prep_large_mapcount'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     659 |         __folio_prep_large_mapcount(folio, order);
         |         ^
   mm/internal.h:659:2: note: did you mean 'folio_large_mapcount'?
   include/linux/mm.h:1237:19: note: 'folio_large_mapcount' declared here
    1237 | static inline int folio_large_mapcount(const struct folio *folio)
         |                   ^
>> mm/page_alloc.c:1072:4: error: call to undeclared function '__folio_undo_large_mapcount'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1072 |                         __folio_undo_large_mapcount(page_folio(page));
         |                         ^
   mm/page_alloc.c:1072:4: note: did you mean '__folio_undo_large_rmappable'?
   mm/internal.h:625:6: note: '__folio_undo_large_rmappable' declared here
     625 | void __folio_undo_large_rmappable(struct folio *folio);
         |      ^
   mm/page_alloc.c:2930:2: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    2930 |         __count_zid_vm_events(PGALLOC, page_zonenum(page), 1 << order);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:119:34: note: expanded from macro '__count_zid_vm_events'
     119 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   mm/page_alloc.c:3047:3: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    3047 |                 __count_zid_vm_events(PGALLOC, page_zonenum(page), 1 << order);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:119:34: note: expanded from macro '__count_zid_vm_events'
     119 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   mm/page_alloc.c:4688:2: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    4688 |         __count_zid_vm_events(PGALLOC, zone_idx(zone), nr_account);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:119:34: note: expanded from macro '__count_zid_vm_events'
     119 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   6 warnings and 2 errors generated.


vim +/__folio_prep_large_mapcount +659 mm/internal.h

   650	
   651	static inline void prep_compound_head(struct page *page, unsigned int order)
   652	{
   653		struct folio *folio = (struct folio *)page;
   654	
   655		folio_set_order(folio, order);
   656		atomic_set(&folio->_pincount, 0);
   657		if (order > 1)
   658			INIT_LIST_HEAD(&folio->_deferred_list);
 > 659		__folio_prep_large_mapcount(folio, order);
   660	}
   661	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
