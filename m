Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78FC10ED;
	Wed, 25 Jan 2023 03:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674618658; x=1706154658;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WlITzMLXAJb5LEtS7r5Vqa7jd0uNLLzQhVA6Dksr/Xs=;
  b=CIWaslDlfnJLcz301DqE5bvGVskvm29m+D1/pPjoigO2g+6cD71jZ/7w
   pBcxWeFGTAfowu8Tnj9X59iQOvDHeyDk379cN0VDDswE+F6oX+v/J2kvH
   xwo7QCdCCme6KAW2ixi/9Ozi7cL9gfAi0evU9jAUss1TGZakXxhhQ5qXD
   291dwA64u/vshiLRnj0b2ABLR2R9/DxIbcAXfzTCrpB/3BNGuThJFxJND
   uDsVOZKY1k1W7KO3SSbMoGVhcAM0vuxpRt92c4WLoU059nsoJOsfeKmGC
   zfEiogEvhHFTJdwG0fwz/2rk5n4g8hcWlpQVKUcnSB+1J8uqX/4Gr2pny
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="412707438"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; 
   d="scan'208";a="412707438"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 19:50:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="725730280"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; 
   d="scan'208";a="725730280"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 24 Jan 2023 19:50:37 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKWo0-00071A-1N;
	Wed, 25 Jan 2023 03:50:36 +0000
Date: Wed, 25 Jan 2023 11:49:58 +0800
From: kernel test robot <lkp@intel.com>
To: Mel Gorman <mgorman@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mel:mm-fixfastmigrate-v1r3 4/6] mm/compaction.c:2458:22: error:
 call to '__compiletime_assert_367' declared with 'error' attribute:
 BUILD_BUG failed
Message-ID: <202301251136.V0KLjuuI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mel/linux.git mm-fixfastmigrate-v1r3
head:   bad57d562978769033e88e1efd661cd6006b5729
commit: 8dc717db28f87afd91006d8dc4d22fb73b8ff089 [4/6] mm, compaction: Finish pageblocks on complete migration failure
config: mips-loongson2k_defconfig (https://download.01.org/0day-ci/archive/20230125/202301251136.V0KLjuuI-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips64el-linux-gnuabi64
        # https://git.kernel.org/pub/scm/linux/kernel/git/mel/linux.git/commit/?id=8dc717db28f87afd91006d8dc4d22fb73b8ff089
        git remote add mel https://git.kernel.org/pub/scm/linux/kernel/git/mel/linux.git
        git fetch --no-tags mel mm-fixfastmigrate-v1r3
        git checkout 8dc717db28f87afd91006d8dc4d22fb73b8ff089
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> mm/compaction.c:2458:22: error: call to '__compiletime_assert_367' declared with 'error' attribute: BUILD_BUG failed
                                   if (cc->order == HUGETLB_PAGE_ORDER)
                                                    ^
   arch/mips/include/asm/page.h:70:30: note: expanded from macro 'HUGETLB_PAGE_ORDER'
   #define HUGETLB_PAGE_ORDER      ({BUILD_BUG(); 0; })
                                     ^
   include/linux/build_bug.h:59:21: note: expanded from macro 'BUILD_BUG'
   #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
                       ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:346:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:339:4: note: expanded from macro '__compiletime_assert'
                           prefix ## suffix();                             \
                           ^
   <scratch space>:68:1: note: expanded from here
   __compiletime_assert_367
   ^
   1 error generated.


vim +2458 mm/compaction.c

  2294	
  2295	static enum compact_result
  2296	compact_zone(struct compact_control *cc, struct capture_control *capc)
  2297	{
  2298		enum compact_result ret;
  2299		unsigned long start_pfn = cc->zone->zone_start_pfn;
  2300		unsigned long end_pfn = zone_end_pfn(cc->zone);
  2301		unsigned long last_migrated_pfn;
  2302		const bool sync = cc->mode != MIGRATE_ASYNC;
  2303		bool update_cached;
  2304		unsigned int nr_succeeded = 0;
  2305	
  2306		/*
  2307		 * These counters track activities during zone compaction.  Initialize
  2308		 * them before compacting a new zone.
  2309		 */
  2310		cc->total_migrate_scanned = 0;
  2311		cc->total_free_scanned = 0;
  2312		cc->nr_migratepages = 0;
  2313		cc->nr_freepages = 0;
  2314		INIT_LIST_HEAD(&cc->freepages);
  2315		INIT_LIST_HEAD(&cc->migratepages);
  2316	
  2317		cc->migratetype = gfp_migratetype(cc->gfp_mask);
  2318		ret = compaction_suitable(cc->zone, cc->order, cc->alloc_flags,
  2319								cc->highest_zoneidx);
  2320		/* Compaction is likely to fail */
  2321		if (ret == COMPACT_SUCCESS || ret == COMPACT_SKIPPED)
  2322			return ret;
  2323	
  2324		/* huh, compaction_suitable is returning something unexpected */
  2325		VM_BUG_ON(ret != COMPACT_CONTINUE);
  2326	
  2327		/*
  2328		 * Clear pageblock skip if there were failures recently and compaction
  2329		 * is about to be retried after being deferred.
  2330		 */
  2331		if (compaction_restarting(cc->zone, cc->order))
  2332			__reset_isolation_suitable(cc->zone);
  2333	
  2334		/*
  2335		 * Setup to move all movable pages to the end of the zone. Used cached
  2336		 * information on where the scanners should start (unless we explicitly
  2337		 * want to compact the whole zone), but check that it is initialised
  2338		 * by ensuring the values are within zone boundaries.
  2339		 */
  2340		cc->fast_start_pfn = 0;
  2341		if (cc->whole_zone) {
  2342			cc->migrate_pfn = start_pfn;
  2343			cc->free_pfn = pageblock_start_pfn(end_pfn - 1);
  2344		} else {
  2345			cc->migrate_pfn = cc->zone->compact_cached_migrate_pfn[sync];
  2346			cc->free_pfn = cc->zone->compact_cached_free_pfn;
  2347			if (cc->free_pfn < start_pfn || cc->free_pfn >= end_pfn) {
  2348				cc->free_pfn = pageblock_start_pfn(end_pfn - 1);
  2349				cc->zone->compact_cached_free_pfn = cc->free_pfn;
  2350			}
  2351			if (cc->migrate_pfn < start_pfn || cc->migrate_pfn >= end_pfn) {
  2352				cc->migrate_pfn = start_pfn;
  2353				cc->zone->compact_cached_migrate_pfn[0] = cc->migrate_pfn;
  2354				cc->zone->compact_cached_migrate_pfn[1] = cc->migrate_pfn;
  2355			}
  2356	
  2357			if (cc->migrate_pfn <= cc->zone->compact_init_migrate_pfn)
  2358				cc->whole_zone = true;
  2359		}
  2360	
  2361		last_migrated_pfn = 0;
  2362	
  2363		/*
  2364		 * Migrate has separate cached PFNs for ASYNC and SYNC* migration on
  2365		 * the basis that some migrations will fail in ASYNC mode. However,
  2366		 * if the cached PFNs match and pageblocks are skipped due to having
  2367		 * no isolation candidates, then the sync state does not matter.
  2368		 * Until a pageblock with isolation candidates is found, keep the
  2369		 * cached PFNs in sync to avoid revisiting the same blocks.
  2370		 */
  2371		update_cached = !sync &&
  2372			cc->zone->compact_cached_migrate_pfn[0] == cc->zone->compact_cached_migrate_pfn[1];
  2373	
  2374		trace_mm_compaction_begin(cc, start_pfn, end_pfn, sync);
  2375	
  2376		/* lru_add_drain_all could be expensive with involving other CPUs */
  2377		lru_add_drain();
  2378	
  2379		while ((ret = compact_finished(cc)) == COMPACT_CONTINUE) {
  2380			int err;
  2381			unsigned long iteration_start_pfn = cc->migrate_pfn;
  2382	
  2383			/*
  2384			 * Avoid multiple rescans of the same pageblock which can
  2385			 * happen if a page cannot be isolated (dirty/writeback in
  2386			 * async mode) or if the migrated pages are being allocated
  2387			 * before the pageblock is cleared.  The first rescan will
  2388			 * capture the entire pageblock for migration. If it fails,
  2389			 * it'll be marked skip and scanning will proceed as normal.
  2390			 */
  2391			cc->finish_pageblock = false;
  2392			if (pageblock_start_pfn(last_migrated_pfn) ==
  2393			    pageblock_start_pfn(iteration_start_pfn)) {
  2394				cc->finish_pageblock = true;
  2395			}
  2396	
  2397	rescan:
  2398			switch (isolate_migratepages(cc)) {
  2399			case ISOLATE_ABORT:
  2400				ret = COMPACT_CONTENDED;
  2401				putback_movable_pages(&cc->migratepages);
  2402				cc->nr_migratepages = 0;
  2403				goto out;
  2404			case ISOLATE_NONE:
  2405				if (update_cached) {
  2406					cc->zone->compact_cached_migrate_pfn[1] =
  2407						cc->zone->compact_cached_migrate_pfn[0];
  2408				}
  2409	
  2410				/*
  2411				 * We haven't isolated and migrated anything, but
  2412				 * there might still be unflushed migrations from
  2413				 * previous cc->order aligned block.
  2414				 */
  2415				goto check_drain;
  2416			case ISOLATE_SUCCESS:
  2417				update_cached = false;
  2418				last_migrated_pfn = iteration_start_pfn;
  2419			}
  2420	
  2421			err = migrate_pages(&cc->migratepages, compaction_alloc,
  2422					compaction_free, (unsigned long)cc, cc->mode,
  2423					MR_COMPACTION, &nr_succeeded);
  2424	
  2425			trace_mm_compaction_migratepages(cc, nr_succeeded);
  2426	
  2427			/* All pages were either migrated or will be released */
  2428			cc->nr_migratepages = 0;
  2429			if (err) {
  2430				putback_movable_pages(&cc->migratepages);
  2431				/*
  2432				 * migrate_pages() may return -ENOMEM when scanners meet
  2433				 * and we want compact_finished() to detect it
  2434				 */
  2435				if (err == -ENOMEM && !compact_scanners_met(cc)) {
  2436					ret = COMPACT_CONTENDED;
  2437					goto out;
  2438				}
  2439				/*
  2440				 * If an ASYNC or SYNC_LIGHT fails to migrate a page
  2441				 * within the current order-aligned block, scan the
  2442				 * remainder of the pageblock. This will mark the
  2443				 * pageblock "skip" to avoid rescanning in the near
  2444				 * future. This will isolate more pages than necessary
  2445				 * for the request but avoid loops due to
  2446				 * fast_find_migrateblock revisiting blocks that were
  2447				 * recently partially scanned.
  2448				 */
  2449				if (cc->direct_compaction && !cc->finish_pageblock &&
  2450							(cc->mode < MIGRATE_SYNC)) {
  2451					cc->finish_pageblock = true;
  2452	
  2453					/*
  2454					 * Draining pcplists does not help THP if
  2455					 * any page failed to migrate. Even after
  2456					 * drain, the pageblock will not be free.
  2457					 */
> 2458					if (cc->order == HUGETLB_PAGE_ORDER)
  2459						last_migrated_pfn = 0;
  2460	
  2461					goto rescan;
  2462				}
  2463			}
  2464	
  2465			/* Stop if a page has been captured */
  2466			if (capc && capc->page) {
  2467				ret = COMPACT_SUCCESS;
  2468				break;
  2469			}
  2470	
  2471	check_drain:
  2472			/*
  2473			 * Has the migration scanner moved away from the previous
  2474			 * cc->order aligned block where we migrated from? If yes,
  2475			 * flush the pages that were freed, so that they can merge and
  2476			 * compact_finished() can detect immediately if allocation
  2477			 * would succeed.
  2478			 */
  2479			if (cc->order > 0 && last_migrated_pfn) {
  2480				unsigned long current_block_start =
  2481					block_start_pfn(cc->migrate_pfn, cc->order);
  2482	
  2483				if (last_migrated_pfn < current_block_start) {
  2484					lru_add_drain_cpu_zone(cc->zone);
  2485					/* No more flushing until we migrate again */
  2486					last_migrated_pfn = 0;
  2487				}
  2488			}
  2489		}
  2490	
  2491	out:
  2492		/*
  2493		 * Release free pages and update where the free scanner should restart,
  2494		 * so we don't leave any returned pages behind in the next attempt.
  2495		 */
  2496		if (cc->nr_freepages > 0) {
  2497			unsigned long free_pfn = release_freepages(&cc->freepages);
  2498	
  2499			cc->nr_freepages = 0;
  2500			VM_BUG_ON(free_pfn == 0);
  2501			/* The cached pfn is always the first in a pageblock */
  2502			free_pfn = pageblock_start_pfn(free_pfn);
  2503			/*
  2504			 * Only go back, not forward. The cached pfn might have been
  2505			 * already reset to zone end in compact_finished()
  2506			 */
  2507			if (free_pfn > cc->zone->compact_cached_free_pfn)
  2508				cc->zone->compact_cached_free_pfn = free_pfn;
  2509		}
  2510	
  2511		count_compact_events(COMPACTMIGRATE_SCANNED, cc->total_migrate_scanned);
  2512		count_compact_events(COMPACTFREE_SCANNED, cc->total_free_scanned);
  2513	
  2514		trace_mm_compaction_end(cc, start_pfn, end_pfn, sync, ret);
  2515	
  2516		return ret;
  2517	}
  2518	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
