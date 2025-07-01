Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230631CA81;
	Tue,  1 Jul 2025 21:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751404581; cv=none; b=iTVQqWl8RFovktsNo73ntRIwNKdpAqRBZJOmGh238yza01v1twjbWbmJCqMyRQpxy35YXSOdNtvAQj0LSjuFtyNUdnNJ8krojrZJO/USmqNNjgOsChUl2t4JUKRYU8U1zwIjhc9ENk5c3SBbrTOKUMeRWAgb7acjJB/ML0Vlbrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751404581; c=relaxed/simple;
	bh=ep8GUgf72M6KOxzHfGZnQ5fblx6RT2lj3YJWgkmV7ac=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LDV4Er60DlPeOQ8PmS6LHKCNN5hy/DGMDUw2nRamYWKctUnWU0+Y4AzhvJ9MJL/UYDiUZ2ZlX9tzxFZvAKOBu4KVi7P4pAM9PpabRceoBbllAH2AuugpoDnJMzz31Ys+wVyflPRr7fxepdQzZyms5/5QJ6+r27ztAMUKhvt7Fi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DvDF/xc6; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DvDF/xc6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751404580; x=1782940580;
  h=date:from:cc:subject:message-id:mime-version;
  bh=ep8GUgf72M6KOxzHfGZnQ5fblx6RT2lj3YJWgkmV7ac=;
  b=DvDF/xc6ft+0nQfqw045GT0o4Ruuqf5NnmhrN04ZWigvy55NLg3zLsmv
   ZvymHNpHTUiGFPqjnMoCvyC4cbMIW9AjcHSnyj1W53LJXSieoI05GYPfU
   06pCttxu3+nP6KaMlA2BFWH5WzuTKPrgqd7jaAh2nvyjOhhBG2ZDTg2ew
   h4zi3dcz9PsDWlni+0s8uRg5JRS0VZFWHJ/XKNNfsTKmLOH7oJHYG/uy+
   hnPanGYpBwbWXoAw176W7g7Dz0mMQbnxLJRadueMXTXB0ZuDCD+F6FceF
   daNh6uprKPEBQt9RoGOQCtmun80c5MG5xNvznfYbE5vtvzk2Xwo6oKbBa
   g==;
X-CSE-ConnectionGUID: lRKhZUTwSwix+f3KSWZr4g==
X-CSE-MsgGUID: 6cx30M7cQNyfHdXs8AT12w==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53550868"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="53550868"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 14:16:20 -0700
X-CSE-ConnectionGUID: fP8INlnWSVeOikdzsx6JQg==
X-CSE-MsgGUID: nPjHQKtUTveE9xqaG7fM0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="153285731"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 01 Jul 2025 14:16:18 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWiKu-000afa-0e;
	Tue, 01 Jul 2025 21:16:16 +0000
Date: Wed, 2 Jul 2025 05:15:21 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [android-common:android15-6.6-2024-09 44/44]
 include/linux/mm_inline.h:46:41: warning: arithmetic between different
 enumeration types ('enum node_stat_item' and 'enum lru_list')
Message-ID: <202507020556.SLemvbia-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android15-6.6-2024-09
head:   f20ec5968458dc75eff21363f4ea28947c6e3800
commit: c40e60f00caf18bc382215c79651777eb40f5f9d [44/44] kbuild: Enable -Wenum-conversion by default
config: i386-buildonly-randconfig-001-20250702 (https://download.01.org/0day-ci/archive/20250702/202507020556.SLemvbia-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507020556.SLemvbia-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507020556.SLemvbia-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/page-writeback.c:20:
   In file included from include/linux/mm.h:2116:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/page-writeback.c:40:
>> include/linux/mm_inline.h:46:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      46 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
>> include/linux/mm_inline.h:48:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      48 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   3 warnings generated.
--
   In file included from mm/page_alloc.c:19:
   In file included from include/linux/mm.h:2116:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/page_alloc.c:43:
>> include/linux/mm_inline.h:46:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      46 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
>> include/linux/mm_inline.h:48:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      48 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   mm/page_alloc.c:2712:2: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    2712 |         __count_zid_vm_events(PGALLOC, page_zonenum(page), 1 << order);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:135:34: note: expanded from macro '__count_zid_vm_events'
     135 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   mm/page_alloc.c:2788:3: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    2788 |                 __count_zid_vm_events(PGALLOC, page_zonenum(page), 1 << order);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:135:34: note: expanded from macro '__count_zid_vm_events'
     135 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   mm/page_alloc.c:4415:2: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    4415 |         __count_zid_vm_events(PGALLOC, zone_idx(zone), nr_account);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:135:34: note: expanded from macro '__count_zid_vm_events'
     135 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   6 warnings generated.
--
   In file included from mm/compaction.c:12:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:20:
   In file included from include/linux/mm.h:2116:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/compaction.c:15:
>> include/linux/mm_inline.h:46:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      46 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
>> include/linux/mm_inline.h:48:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      48 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   mm/compaction.c:479:20: warning: unused function 'pageblock_skip_persistent' [-Wunused-function]
     479 | static inline bool pageblock_skip_persistent(struct page *page)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   mm/compaction.c:484:20: warning: unused function 'update_pageblock_skip' [-Wunused-function]
     484 | static inline void update_pageblock_skip(struct compact_control *cc,
         |                    ^~~~~~~~~~~~~~~~~~~~~
   5 warnings generated.
--
   In file included from mm/vmscan.c:15:
   In file included from include/linux/mm.h:2116:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/vmscan.c:30:
>> include/linux/mm_inline.h:46:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      46 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
>> include/linux/mm_inline.h:48:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      48 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   mm/vmscan.c:669:51: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     669 |                         size += zone_page_state(zone, NR_ZONE_LRU_BASE + lru);
         |                                                       ~~~~~~~~~~~~~~~~ ^ ~~~
   mm/vmscan.c:2386:4: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    2386 |                         __count_zid_vm_events(PGSCAN_SKIP, zid, nr_skipped[zid]);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:135:34: note: expanded from macro '__count_zid_vm_events'
     135 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   mm/vmscan.c:2893:51: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
    2893 |         inactive = lruvec_page_state(lruvec, NR_LRU_BASE + inactive_lru);
         |                                              ~~~~~~~~~~~ ^ ~~~~~~~~~~~~
   mm/vmscan.c:2894:49: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
    2894 |         active = lruvec_page_state(lruvec, NR_LRU_BASE + active_lru);
         |                                            ~~~~~~~~~~~ ^ ~~~~~~~~~~
   mm/vmscan.c:6818:3: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    6818 |                 __count_zid_vm_events(ALLOCSTALL, sc->reclaim_idx, 1);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:135:34: note: expanded from macro '__count_zid_vm_events'
     135 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   8 warnings generated.


vim +46 include/linux/mm_inline.h

b2e185384f53478 Rik van Riel            2008-10-18  36  
aa1b67903a19e02 Yu Zhao                 2022-09-18  37  static __always_inline void __update_lru_size(struct lruvec *lruvec,
599d0c954f91d06 Mel Gorman              2016-07-28  38  				enum lru_list lru, enum zone_type zid,
889a3747b3b7661 Matthew Wilcox (Oracle  2021-02-25  39) 				long nr_pages)
9d5e6a9f22311b0 Hugh Dickins            2016-05-19  40  {
599d0c954f91d06 Mel Gorman              2016-07-28  41  	struct pglist_data *pgdat = lruvec_pgdat(lruvec);
599d0c954f91d06 Mel Gorman              2016-07-28  42  
ec1c86b25f4bdd9 Yu Zhao                 2022-09-18  43  	lockdep_assert_held(&lruvec->lru_lock);
ec1c86b25f4bdd9 Yu Zhao                 2022-09-18  44  	WARN_ON_ONCE(nr_pages != (int)nr_pages);
ec1c86b25f4bdd9 Yu Zhao                 2022-09-18  45  
e0ee0e71078abbc Johannes Weiner         2019-05-13 @46  	__mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
71c799f4982d340 Minchan Kim             2016-07-28  47  	__mod_zone_page_state(&pgdat->node_zones[zid],
71c799f4982d340 Minchan Kim             2016-07-28 @48  				NR_ZONE_LRU_BASE + lru, nr_pages);
aa1b67903a19e02 Yu Zhao                 2022-09-18  49  }
aa1b67903a19e02 Yu Zhao                 2022-09-18  50  

:::::: The code at line 46 was first introduced by commit
:::::: e0ee0e71078abbcadd4cbc38fb8570551fccc103 mm: memcontrol: track LRU counts in the vmstats array

:::::: TO: Johannes Weiner <hannes@cmpxchg.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
