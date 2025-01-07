Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2D813AA35;
	Tue,  7 Jan 2025 03:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736220290; cv=none; b=T/NDngtyCaUS9SsDRTS3qpxK8HlAdQTxn/gJDaOF+Vc/pvZ2MVHzboLy4e06u/8l70PvRN2ohZVu/n77gwWiNU85BOYgYOInuN52rDnhuOfSSXQchZhRDfDIxeKQdYbtRk9Vo6BoHs7WKn40KBOO3hGGbFfs+zVYomavoh8r1PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736220290; c=relaxed/simple;
	bh=VhaJ+WKPJ8M5XPwTnkUCfauA4bU/exGPflvODp8cjfA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a9d7XFDJNujI1wyodUp8IpC2CUvTR8EyxiUvE7Ocd3QH1BnwEFGsS46OO894/Ydb38j2m5OVWII4pMq+ITH16iPxpjF0J/Gek8ZUg369y6EUPNnGxx4lFRYr93Onj5qU4+PJehtxD3EHjTI5ZjbFg0FxFl12nmdtFX/8j7s6QPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ViiS1w2u; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ViiS1w2u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736220286; x=1767756286;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VhaJ+WKPJ8M5XPwTnkUCfauA4bU/exGPflvODp8cjfA=;
  b=ViiS1w2uEndtBIm8kttVimVcZTuD+EGodLlHSzqNXqgfAvR1c1ooZzed
   0KG6AmcryIOWmEM71YaOJ17DVoGrKs7CpRavZn/HJtnyRBhiq4gv4oGNp
   AgQKZqkEQu9mH4hJPJiz26/oadvPDLr9evYTw/zEa8/fp+KIi8t1WHwbn
   5We3rvjACO9m+fCTFafuA5x5Xuj05zGRMQ+aMXy21IDpaksSQ8mLa4Mfl
   tTZs/YOf/WjG2Rrabz7aoN+bwMa5pnpBKj+BVHYRf/y75/RBYphAz/QjV
   yamI3KzaRPlfYRqUwdXMhj215PFVbIGsVnmq3GoOEdorpMhHPqkdr4rP6
   w==;
X-CSE-ConnectionGUID: WLnXmHFpTiClnX7Kin25lA==
X-CSE-MsgGUID: tJnDHZRwT3GXApEV2Wdw5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="36080795"
X-IronPort-AV: E=Sophos;i="6.12,294,1728975600"; 
   d="scan'208";a="36080795"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 19:24:46 -0800
X-CSE-ConnectionGUID: rCufYbkFT7uFws6CfDtbBg==
X-CSE-MsgGUID: aGavQgiGQ6OIXvKIu+0Y+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,294,1728975600"; 
   d="scan'208";a="133486831"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 06 Jan 2025 19:24:44 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tV0Cw-000EBG-1j;
	Tue, 07 Jan 2025 03:24:42 +0000
Date: Tue, 7 Jan 2025 11:24:31 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Gregory Price <gourry@gourry.net>
Subject: [gourryinverse:gourry_pagecache 5/6] include/linux/migrate.h:159:5:
 warning: no previous prototype for function 'migrate_misplaced_folio_batch'
Message-ID: <202501071136.MXhN3C8N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gourryinverse/linux gourry_pagecache
head:   0b481ba53a1ea6337129cbe63f9234a748df4843
commit: 853ef17ea1577e0a625e695acd45250f2610f004 [5/6] migrate: implement migrate_misplaced_folio_batch
config: i386-buildonly-randconfig-003-20250107 (https://download.01.org/0day-ci/archive/20250107/202501071136.MXhN3C8N-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250107/202501071136.MXhN3C8N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501071136.MXhN3C8N-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/zsmalloc.c:47:
>> include/linux/migrate.h:159:5: warning: no previous prototype for function 'migrate_misplaced_folio_batch' [-Wmissing-prototypes]
     159 | int migrate_misplaced_folio_batch(struct list_head *foliolist, int node)
         |     ^
   include/linux/migrate.h:159:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     159 | int migrate_misplaced_folio_batch(struct list_head *foliolist, int node)
         | ^
         | static 
   mm/zsmalloc.c:455:20: warning: function 'is_first_zpdesc' is not needed and will not be emitted [-Wunneeded-internal-declaration]
     455 | static inline bool is_first_zpdesc(struct zpdesc *zpdesc)
         |                    ^~~~~~~~~~~~~~~
   2 warnings generated.
--
   In file included from mm/compaction.c:13:
>> include/linux/migrate.h:159:5: warning: no previous prototype for function 'migrate_misplaced_folio_batch' [-Wmissing-prototypes]
     159 | int migrate_misplaced_folio_batch(struct list_head *foliolist, int node)
         |     ^
   include/linux/migrate.h:159:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     159 | int migrate_misplaced_folio_batch(struct list_head *foliolist, int node)
         | ^
         | static 
   In file included from mm/compaction.c:15:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   3 warnings generated.
--
   In file included from mm/vmscan.c:30:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   In file included from mm/vmscan.c:42:
>> include/linux/migrate.h:159:5: warning: no previous prototype for function 'migrate_misplaced_folio_batch' [-Wmissing-prototypes]
     159 | int migrate_misplaced_folio_batch(struct list_head *foliolist, int node)
         |     ^
   include/linux/migrate.h:159:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     159 | int migrate_misplaced_folio_batch(struct list_head *foliolist, int node)
         | ^
         | static 
   mm/vmscan.c:409:51: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     409 |                         size += zone_page_state(zone, NR_ZONE_LRU_BASE + lru);
         |                                                       ~~~~~~~~~~~~~~~~ ^ ~~~
   mm/vmscan.c:1773:4: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    1773 |                         __count_zid_vm_events(PGSCAN_SKIP, zid, nr_skipped[zid]);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:139:34: note: expanded from macro '__count_zid_vm_events'
     139 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   mm/vmscan.c:2279:51: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
    2279 |         inactive = lruvec_page_state(lruvec, NR_LRU_BASE + inactive_lru);
         |                                              ~~~~~~~~~~~ ^ ~~~~~~~~~~~~
   mm/vmscan.c:2280:49: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
    2280 |         active = lruvec_page_state(lruvec, NR_LRU_BASE + active_lru);
         |                                            ~~~~~~~~~~~ ^ ~~~~~~~~~~
   mm/vmscan.c:6292:3: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    6292 |                 __count_zid_vm_events(ALLOCSTALL, sc->reclaim_idx, 1);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:139:34: note: expanded from macro '__count_zid_vm_events'
     139 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   8 warnings generated.
--
   In file included from mm/memory.c:44:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   In file included from mm/memory.c:67:
>> include/linux/migrate.h:159:5: warning: no previous prototype for function 'migrate_misplaced_folio_batch' [-Wmissing-prototypes]
     159 | int migrate_misplaced_folio_batch(struct list_head *foliolist, int node)
         |     ^
   include/linux/migrate.h:159:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     159 | int migrate_misplaced_folio_batch(struct list_head *foliolist, int node)
         | ^
         | static 
   3 warnings generated.
--
   In file included from mm/page_alloc.c:44:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   In file included from mm/page_alloc.c:46:
>> include/linux/migrate.h:159:5: warning: no previous prototype for function 'migrate_misplaced_folio_batch' [-Wmissing-prototypes]
     159 | int migrate_misplaced_folio_batch(struct list_head *foliolist, int node)
         |     ^
   include/linux/migrate.h:159:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     159 | int migrate_misplaced_folio_batch(struct list_head *foliolist, int node)
         | ^
         | static 
   mm/page_alloc.c:2933:2: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    2933 |         __count_zid_vm_events(PGALLOC, page_zonenum(page), 1 << order);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:139:34: note: expanded from macro '__count_zid_vm_events'
     139 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   mm/page_alloc.c:3050:3: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    3050 |                 __count_zid_vm_events(PGALLOC, page_zonenum(page), 1 << order);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:139:34: note: expanded from macro '__count_zid_vm_events'
     139 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   mm/page_alloc.c:4692:2: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    4692 |         __count_zid_vm_events(PGALLOC, zone_idx(zone), nr_account);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:139:34: note: expanded from macro '__count_zid_vm_events'
     139 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   6 warnings generated.
--
   In file included from fs/btrfs/disk-io.c:13:
>> include/linux/migrate.h:159:5: warning: no previous prototype for function 'migrate_misplaced_folio_batch' [-Wmissing-prototypes]
     159 | int migrate_misplaced_folio_batch(struct list_head *foliolist, int node)
         |     ^
   include/linux/migrate.h:159:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     159 | int migrate_misplaced_folio_batch(struct list_head *foliolist, int node)
         | ^
         | static 
   1 warning generated.
--
   In file included from zsmalloc.c:47:
>> include/linux/migrate.h:159:5: warning: no previous prototype for function 'migrate_misplaced_folio_batch' [-Wmissing-prototypes]
     159 | int migrate_misplaced_folio_batch(struct list_head *foliolist, int node)
         |     ^
   include/linux/migrate.h:159:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     159 | int migrate_misplaced_folio_batch(struct list_head *foliolist, int node)
         | ^
         | static 
   zsmalloc.c:455:20: warning: function 'is_first_zpdesc' is not needed and will not be emitted [-Wunneeded-internal-declaration]
     455 | static inline bool is_first_zpdesc(struct zpdesc *zpdesc)
         |                    ^~~~~~~~~~~~~~~
   2 warnings generated.


vim +/migrate_misplaced_folio_batch +159 include/linux/migrate.h

   143	
   144	#ifdef CONFIG_NUMA_BALANCING
   145	int migrate_misplaced_folio_prepare(struct folio *folio,
   146			struct vm_area_struct *vma, int node);
   147	int migrate_misplaced_folio(struct folio *folio, int node);
   148	int migrate_misplaced_folio_batch(struct list_head *foliolist, int node);
   149	#else
   150	static inline int migrate_misplaced_folio_prepare(struct folio *folio,
   151			struct vm_area_struct *vma, int node)
   152	{
   153		return -EAGAIN; /* can't migrate now */
   154	}
   155	static inline int migrate_misplaced_folio(struct folio *folio, int node)
   156	{
   157		return -EAGAIN; /* can't migrate now */
   158	}
 > 159	int migrate_misplaced_folio_batch(struct list_head *foliolist, int node)
   160	{
   161		return -EAGAIN; /* can't migrate now */
   162	}
   163	#endif /* CONFIG_NUMA_BALANCING */
   164	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
