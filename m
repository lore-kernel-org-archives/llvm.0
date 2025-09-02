Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476F442065;
	Tue,  2 Sep 2025 12:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756815717; cv=none; b=iFMEPtBjsjXRLzjtc1542O2aaSHbFa3bEk4Y5cfx2GmCTiTn2vba8JWCoNmAOAKMDjGU4miMe+EOQkkWIQsmCrTg0vIiZBx9ziedo4jQY/FJexE+YptkzPJ6K78kgRUsluXlrz208U4jLBiP3u3B9ZxDZqyebNCOnfhC3Y3PJHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756815717; c=relaxed/simple;
	bh=jIfgoxS+ycbv8ODOPvXhcs50ic/4jXs/oOX8iLGdUPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=svJL5LIan7IoYAxzytXl2gUxnVrV8QMha59IePg1hNCnDlcP8wsYI9wlYYsGQSrPf03c4yqcH5Q0n8KQ22DehfS9deDlXrsBNuoZXSCYBJK061Jqnc3Kqw1w6KZWXwfNz8iD981wWpyjfGMJ5u+t5u93N7on+FedInge8f0x2zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kVf0hsb9; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kVf0hsb9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756815715; x=1788351715;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jIfgoxS+ycbv8ODOPvXhcs50ic/4jXs/oOX8iLGdUPo=;
  b=kVf0hsb9wwFljkqHT1ZznZa3IAvdka1mTxbFniguDcfcAq2pWOfnVvbv
   QO70s9nA5kv/NflJ5WCx/xreKoW7HlJTnaRKoyveqVM9f5tmXyL6aEpXS
   a81anM+7krzNwawA005Ps1VujOPfMO+/KV0F9jn4JhMm/SqkaVeRGLPdf
   olx+vzQEoovIJ3+3FVsTrJvPazXcrEnemXvPELilEeS8bPJlzfqNVawZL
   6Er+sjeQMPkxAg1TqhIy1ljC9Ow17CwncQRcH+8AXBxbMHeGFFRx4/JpQ
   gHBnUHTmp7wDa+LfxryBLRkLcmOq3hHIUhpuV2rTpPTfviljrxGwyrTru
   A==;
X-CSE-ConnectionGUID: PvLF+VGhTh6mCh0nJdDW/Q==
X-CSE-MsgGUID: 2GwTBt+fTRSSCG6Vj8Dd3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="59022926"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="59022926"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 05:21:53 -0700
X-CSE-ConnectionGUID: 2iFQg7u+QAqGAqL4vpJb1g==
X-CSE-MsgGUID: dpHk/SKLQKC8iqFz7MKcvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="171229754"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 02 Sep 2025 05:21:52 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utQ10-0001yB-1m;
	Tue, 02 Sep 2025 12:21:38 +0000
Date: Tue, 2 Sep 2025 20:20:29 +0800
From: kernel test robot <lkp@intel.com>
To: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] mm: show_mem: show number of zspages in show_free_areas
Message-ID: <202509022038.Yh6ZuTfU-lkp@intel.com>
References: <20250901183729.3900578-1-cascardo@igalia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901183729.3900578-1-cascardo@igalia.com>

Hi Thadeu,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Thadeu-Lima-de-Souza-Cascardo/mm-show_mem-show-number-of-zspages-in-show_free_areas/20250902-023852
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250901183729.3900578-1-cascardo%40igalia.com
patch subject: [PATCH] mm: show_mem: show number of zspages in show_free_areas
config: i386-buildonly-randconfig-004-20250902 (https://download.01.org/0day-ci/archive/20250902/202509022038.Yh6ZuTfU-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250902/202509022038.Yh6ZuTfU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509022038.Yh6ZuTfU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/show_mem.c:336:28: error: use of undeclared identifier 'NR_ZSPAGES'; did you mean 'NR_STATS'?
     336 |                         K(zone_page_state(zone, NR_ZSPAGES)),
         |                                                 ^~~~~~~~~~
         |                                                 NR_STATS
   include/linux/printk.h:512:60: note: expanded from macro 'printk'
     512 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                            ^
   include/linux/printk.h:484:19: note: expanded from macro 'printk_index_wrap'
     484 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^
   mm/internal.h:560:16: note: expanded from macro 'K'
     560 | #define K(x) ((x) << (PAGE_SHIFT-10))
         |                ^
   include/linux/kernel_stat.h:33:2: note: 'NR_STATS' declared here
      33 |         NR_STATS,
         |         ^
   mm/show_mem.c:336:28: warning: implicit conversion from enumeration type 'enum cpu_usage_stat' to different enumeration type 'enum zone_stat_item' [-Wenum-conversion]
     336 |                         K(zone_page_state(zone, NR_ZSPAGES)),
         |                           ~~~~~~~~~~~~~~~       ^~~~~~~~~~
   include/linux/printk.h:512:60: note: expanded from macro 'printk'
     512 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                            ^~~~~~~~~~~
   include/linux/printk.h:484:19: note: expanded from macro 'printk_index_wrap'
     484 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   mm/internal.h:560:16: note: expanded from macro 'K'
     560 | #define K(x) ((x) << (PAGE_SHIFT-10))
         |                ^
   1 warning and 1 error generated.


vim +336 mm/show_mem.c

   170	
   171	/*
   172	 * Show free area list (used inside shift_scroll-lock stuff)
   173	 * We also calculate the percentage fragmentation. We do this by counting the
   174	 * memory on each free list with the exception of the first item on the list.
   175	 *
   176	 * Bits in @filter:
   177	 * SHOW_MEM_FILTER_NODES: suppress nodes that are not allowed by current's
   178	 *   cpuset.
   179	 */
   180	static void show_free_areas(unsigned int filter, nodemask_t *nodemask, int max_zone_idx)
   181	{
   182		unsigned long free_pcp = 0;
   183		int cpu, nid;
   184		struct zone *zone;
   185		pg_data_t *pgdat;
   186	
   187		for_each_populated_zone(zone) {
   188			if (zone_idx(zone) > max_zone_idx)
   189				continue;
   190			if (show_mem_node_skip(filter, zone_to_nid(zone), nodemask))
   191				continue;
   192	
   193			for_each_online_cpu(cpu)
   194				free_pcp += per_cpu_ptr(zone->per_cpu_pageset, cpu)->count;
   195		}
   196	
   197		printk("active_anon:%lu inactive_anon:%lu isolated_anon:%lu\n"
   198			" active_file:%lu inactive_file:%lu isolated_file:%lu\n"
   199			" unevictable:%lu dirty:%lu writeback:%lu\n"
   200			" slab_reclaimable:%lu slab_unreclaimable:%lu\n"
   201			" mapped:%lu shmem:%lu pagetables:%lu\n"
   202			" sec_pagetables:%lu bounce:%lu\n"
   203			" kernel_misc_reclaimable:%lu\n"
   204			" free:%lu free_pcp:%lu free_cma:%lu\n",
   205			global_node_page_state(NR_ACTIVE_ANON),
   206			global_node_page_state(NR_INACTIVE_ANON),
   207			global_node_page_state(NR_ISOLATED_ANON),
   208			global_node_page_state(NR_ACTIVE_FILE),
   209			global_node_page_state(NR_INACTIVE_FILE),
   210			global_node_page_state(NR_ISOLATED_FILE),
   211			global_node_page_state(NR_UNEVICTABLE),
   212			global_node_page_state(NR_FILE_DIRTY),
   213			global_node_page_state(NR_WRITEBACK),
   214			global_node_page_state_pages(NR_SLAB_RECLAIMABLE_B),
   215			global_node_page_state_pages(NR_SLAB_UNRECLAIMABLE_B),
   216			global_node_page_state(NR_FILE_MAPPED),
   217			global_node_page_state(NR_SHMEM),
   218			global_node_page_state(NR_PAGETABLE),
   219			global_node_page_state(NR_SECONDARY_PAGETABLE),
   220			0UL,
   221			global_node_page_state(NR_KERNEL_MISC_RECLAIMABLE),
   222			global_zone_page_state(NR_FREE_PAGES),
   223			free_pcp,
   224			global_zone_page_state(NR_FREE_CMA_PAGES));
   225	
   226		for_each_online_pgdat(pgdat) {
   227			if (show_mem_node_skip(filter, pgdat->node_id, nodemask))
   228				continue;
   229			if (!node_has_managed_zones(pgdat, max_zone_idx))
   230				continue;
   231	
   232			printk("Node %d"
   233				" active_anon:%lukB"
   234				" inactive_anon:%lukB"
   235				" active_file:%lukB"
   236				" inactive_file:%lukB"
   237				" unevictable:%lukB"
   238				" isolated(anon):%lukB"
   239				" isolated(file):%lukB"
   240				" mapped:%lukB"
   241				" dirty:%lukB"
   242				" writeback:%lukB"
   243				" shmem:%lukB"
   244	#ifdef CONFIG_TRANSPARENT_HUGEPAGE
   245				" shmem_thp:%lukB"
   246				" shmem_pmdmapped:%lukB"
   247				" anon_thp:%lukB"
   248	#endif
   249				" kernel_stack:%lukB"
   250	#ifdef CONFIG_SHADOW_CALL_STACK
   251				" shadow_call_stack:%lukB"
   252	#endif
   253				" pagetables:%lukB"
   254				" sec_pagetables:%lukB"
   255				" all_unreclaimable? %s"
   256				" Balloon:%lukB"
   257				"\n",
   258				pgdat->node_id,
   259				K(node_page_state(pgdat, NR_ACTIVE_ANON)),
   260				K(node_page_state(pgdat, NR_INACTIVE_ANON)),
   261				K(node_page_state(pgdat, NR_ACTIVE_FILE)),
   262				K(node_page_state(pgdat, NR_INACTIVE_FILE)),
   263				K(node_page_state(pgdat, NR_UNEVICTABLE)),
   264				K(node_page_state(pgdat, NR_ISOLATED_ANON)),
   265				K(node_page_state(pgdat, NR_ISOLATED_FILE)),
   266				K(node_page_state(pgdat, NR_FILE_MAPPED)),
   267				K(node_page_state(pgdat, NR_FILE_DIRTY)),
   268				K(node_page_state(pgdat, NR_WRITEBACK)),
   269				K(node_page_state(pgdat, NR_SHMEM)),
   270	#ifdef CONFIG_TRANSPARENT_HUGEPAGE
   271				K(node_page_state(pgdat, NR_SHMEM_THPS)),
   272				K(node_page_state(pgdat, NR_SHMEM_PMDMAPPED)),
   273				K(node_page_state(pgdat, NR_ANON_THPS)),
   274	#endif
   275				node_page_state(pgdat, NR_KERNEL_STACK_KB),
   276	#ifdef CONFIG_SHADOW_CALL_STACK
   277				node_page_state(pgdat, NR_KERNEL_SCS_KB),
   278	#endif
   279				K(node_page_state(pgdat, NR_PAGETABLE)),
   280				K(node_page_state(pgdat, NR_SECONDARY_PAGETABLE)),
   281				str_yes_no(pgdat->kswapd_failures >= MAX_RECLAIM_RETRIES),
   282				K(node_page_state(pgdat, NR_BALLOON_PAGES)));
   283		}
   284	
   285		for_each_populated_zone(zone) {
   286			int i;
   287	
   288			if (zone_idx(zone) > max_zone_idx)
   289				continue;
   290			if (show_mem_node_skip(filter, zone_to_nid(zone), nodemask))
   291				continue;
   292	
   293			free_pcp = 0;
   294			for_each_online_cpu(cpu)
   295				free_pcp += per_cpu_ptr(zone->per_cpu_pageset, cpu)->count;
   296	
   297			show_node(zone);
   298			printk(KERN_CONT
   299				"%s"
   300				" free:%lukB"
   301				" boost:%lukB"
   302				" min:%lukB"
   303				" low:%lukB"
   304				" high:%lukB"
   305				" reserved_highatomic:%luKB"
   306				" free_highatomic:%luKB"
   307				" active_anon:%lukB"
   308				" inactive_anon:%lukB"
   309				" active_file:%lukB"
   310				" inactive_file:%lukB"
   311				" unevictable:%lukB"
   312				" writepending:%lukB"
   313				" zspages:%lukB"
   314				" present:%lukB"
   315				" managed:%lukB"
   316				" mlocked:%lukB"
   317				" bounce:%lukB"
   318				" free_pcp:%lukB"
   319				" local_pcp:%ukB"
   320				" free_cma:%lukB"
   321				"\n",
   322				zone->name,
   323				K(zone_page_state(zone, NR_FREE_PAGES)),
   324				K(zone->watermark_boost),
   325				K(min_wmark_pages(zone)),
   326				K(low_wmark_pages(zone)),
   327				K(high_wmark_pages(zone)),
   328				K(zone->nr_reserved_highatomic),
   329				K(zone->nr_free_highatomic),
   330				K(zone_page_state(zone, NR_ZONE_ACTIVE_ANON)),
   331				K(zone_page_state(zone, NR_ZONE_INACTIVE_ANON)),
   332				K(zone_page_state(zone, NR_ZONE_ACTIVE_FILE)),
   333				K(zone_page_state(zone, NR_ZONE_INACTIVE_FILE)),
   334				K(zone_page_state(zone, NR_ZONE_UNEVICTABLE)),
   335				K(zone_page_state(zone, NR_ZONE_WRITE_PENDING)),
 > 336				K(zone_page_state(zone, NR_ZSPAGES)),
   337				K(zone->present_pages),
   338				K(zone_managed_pages(zone)),
   339				K(zone_page_state(zone, NR_MLOCK)),
   340				0UL,
   341				K(free_pcp),
   342				K(this_cpu_read(zone->per_cpu_pageset->count)),
   343				K(zone_page_state(zone, NR_FREE_CMA_PAGES)));
   344			printk("lowmem_reserve[]:");
   345			for (i = 0; i < MAX_NR_ZONES; i++)
   346				printk(KERN_CONT " %ld", zone->lowmem_reserve[i]);
   347			printk(KERN_CONT "\n");
   348		}
   349	
   350		for_each_populated_zone(zone) {
   351			unsigned int order;
   352			unsigned long nr[NR_PAGE_ORDERS], flags, total = 0;
   353			unsigned char types[NR_PAGE_ORDERS];
   354	
   355			if (zone_idx(zone) > max_zone_idx)
   356				continue;
   357			if (show_mem_node_skip(filter, zone_to_nid(zone), nodemask))
   358				continue;
   359			show_node(zone);
   360			printk(KERN_CONT "%s: ", zone->name);
   361	
   362			spin_lock_irqsave(&zone->lock, flags);
   363			for (order = 0; order < NR_PAGE_ORDERS; order++) {
   364				struct free_area *area = &zone->free_area[order];
   365				int type;
   366	
   367				nr[order] = area->nr_free;
   368				total += nr[order] << order;
   369	
   370				types[order] = 0;
   371				for (type = 0; type < MIGRATE_TYPES; type++) {
   372					if (!free_area_empty(area, type))
   373						types[order] |= 1 << type;
   374				}
   375			}
   376			spin_unlock_irqrestore(&zone->lock, flags);
   377			for (order = 0; order < NR_PAGE_ORDERS; order++) {
   378				printk(KERN_CONT "%lu*%lukB ",
   379				       nr[order], K(1UL) << order);
   380				if (nr[order])
   381					show_migration_types(types[order]);
   382			}
   383			printk(KERN_CONT "= %lukB\n", K(total));
   384		}
   385	
   386		for_each_online_node(nid) {
   387			if (show_mem_node_skip(filter, nid, nodemask))
   388				continue;
   389			hugetlb_show_meminfo_node(nid);
   390		}
   391	
   392		printk("%ld total pagecache pages\n", global_node_page_state(NR_FILE_PAGES));
   393	
   394		show_swap_cache_info();
   395	}
   396	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
