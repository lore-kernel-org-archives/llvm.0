Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BA79450;
	Sun, 15 Dec 2024 05:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734240791; cv=none; b=n0/e3XmV2+/FB+qA+Nw6W8JTjydToyGtgpMumpEDZXwboYJWdqFf2Ka85dJ7CDxABo5ORTLuyd2gPCFksOWIMQ3h1BmPWHYQRhq9DuAQnnRhtUuREZjYNmQxxTwsrd79pX2Tz8Xw2Bape6ypSVLIOKO+jP+7qCK4yygzS0jPw/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734240791; c=relaxed/simple;
	bh=+fY9hEPSKJmOpv8MMFl4MGi9GJjNk1kJJuxIOhFcZ+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PRydwd5Gf1c5ChE5DOvvz016r9x/7S9Z9UCMExo3nBmqhPySngABM82ANaMbg2KsW6zHu6qVUH9/NTIbbJ8iFckMyWsJi8vcWzvCgdH4hjO/JK0YJ+GR0SiZs7m7MGDIgIf1OQssSr0+kLXePs3MnzOBMhsTtK80EZ/Lusn1xZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=goTKoz3y; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="goTKoz3y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734240788; x=1765776788;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+fY9hEPSKJmOpv8MMFl4MGi9GJjNk1kJJuxIOhFcZ+s=;
  b=goTKoz3yKTt6kRx4m0U57AK2L2KuVO8u6Hpfj9FrpguHIN6YJojCIGj9
   OIU6GlXxp23s9yQeblo5y1g2rqjN+sDiAh9H1lU4rUCuV1JyPk1mZFYPN
   /rjidzOiZqLmDyA96z3STjJX7aLbY51VRx1VnQFrma9d6sjo/ue5/p0C5
   gGloiyUzNroTMCepdAA2YI4DwcaV34fGJ26DuFD5zfdhpWSjaSnOrGKxs
   6PEGGYRjfj6MoOJgeflqOVFNP/K4QvQD0UcQAA805TiEIoznlFjo894Yx
   X6IU84wLCzGIPtDJGaHRbxF1v2Kp6f5cE+3Kbr+vFqBXWswa+nTAyJgEo
   A==;
X-CSE-ConnectionGUID: gl7zwOPvQtyKngY5FyMuNQ==
X-CSE-MsgGUID: 1ZiTVybGTS+Z4BPtyreJEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="22236792"
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; 
   d="scan'208";a="22236792"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 21:33:07 -0800
X-CSE-ConnectionGUID: jx8Wunj5QrGej9qdFuAyEw==
X-CSE-MsgGUID: arxHAJamRTuuU+XVW7hbIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="127889575"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 Dec 2024 21:33:05 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMhFW-000DSU-2o;
	Sun, 15 Dec 2024 05:33:02 +0000
Date: Sun, 15 Dec 2024 13:32:25 +0800
From: kernel test robot <lkp@intel.com>
To: yangge1116@126.com, akpm@linux-foundation.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	21cnbao@gmail.com, david@redhat.com, baolin.wang@linux.alibaba.com,
	vbabka@suse.cz, liuzixing@hygon.cn, yangge <yangge1116@126.com>
Subject: Re: [PATCH V2] mm, compaction: don't use ALLOC_CMA in long term GUP
 flow
Message-ID: <202412151325.svvh8EAB-lkp@intel.com>
References: <1734157420-31110-1-git-send-email-yangge1116@126.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1734157420-31110-1-git-send-email-yangge1116@126.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/yangge1116-126-com/mm-compaction-don-t-use-ALLOC_CMA-in-long-term-GUP-flow/20241214-142453
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/1734157420-31110-1-git-send-email-yangge1116%40126.com
patch subject: [PATCH V2] mm, compaction: don't use ALLOC_CMA in long term GUP flow
config: arm-randconfig-001-20241215 (https://download.01.org/0day-ci/archive/20241215/202412151325.svvh8EAB-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 2dc22615fd46ab2566d0f26d5ba234ab12dc4bf8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241215/202412151325.svvh8EAB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412151325.svvh8EAB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/vmscan.c:30:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
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
>> mm/vmscan.c:5822:61: error: too many arguments to function call, expected 3, have 4
    5822 |                 if (compaction_suitable(zone, sc->order, sc->reclaim_idx, 0))
         |                     ~~~~~~~~~~~~~~~~~~~                                   ^
   include/linux/compaction.h:111:20: note: 'compaction_suitable' declared here
     111 | static inline bool compaction_suitable(struct zone *zone, int order,
         |                    ^                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     112 |                                                       int highest_zoneidx)
         |                                                       ~~~~~~~~~~~~~~~~~~~
   mm/vmscan.c:6050:61: error: too many arguments to function call, expected 3, have 4
    6050 |         if (!compaction_suitable(zone, sc->order, sc->reclaim_idx, 0))
         |              ~~~~~~~~~~~~~~~~~~~                                   ^
   include/linux/compaction.h:111:20: note: 'compaction_suitable' declared here
     111 | static inline bool compaction_suitable(struct zone *zone, int order,
         |                    ^                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     112 |                                                       int highest_zoneidx)
         |                                                       ~~~~~~~~~~~~~~~~~~~
   mm/vmscan.c:6239:3: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    6239 |                 __count_zid_vm_events(ALLOCSTALL, sc->reclaim_idx, 1);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:139:34: note: expanded from macro '__count_zid_vm_events'
     139 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   7 warnings and 2 errors generated.


vim +5822 mm/vmscan.c

  5778	
  5779	/*
  5780	 * Reclaim/compaction is used for high-order allocation requests. It reclaims
  5781	 * order-0 pages before compacting the zone. should_continue_reclaim() returns
  5782	 * true if more pages should be reclaimed such that when the page allocator
  5783	 * calls try_to_compact_pages() that it will have enough free pages to succeed.
  5784	 * It will give up earlier than that if there is difficulty reclaiming pages.
  5785	 */
  5786	static inline bool should_continue_reclaim(struct pglist_data *pgdat,
  5787						unsigned long nr_reclaimed,
  5788						struct scan_control *sc)
  5789	{
  5790		unsigned long pages_for_compaction;
  5791		unsigned long inactive_lru_pages;
  5792		int z;
  5793	
  5794		/* If not in reclaim/compaction mode, stop */
  5795		if (!in_reclaim_compaction(sc))
  5796			return false;
  5797	
  5798		/*
  5799		 * Stop if we failed to reclaim any pages from the last SWAP_CLUSTER_MAX
  5800		 * number of pages that were scanned. This will return to the caller
  5801		 * with the risk reclaim/compaction and the resulting allocation attempt
  5802		 * fails. In the past we have tried harder for __GFP_RETRY_MAYFAIL
  5803		 * allocations through requiring that the full LRU list has been scanned
  5804		 * first, by assuming that zero delta of sc->nr_scanned means full LRU
  5805		 * scan, but that approximation was wrong, and there were corner cases
  5806		 * where always a non-zero amount of pages were scanned.
  5807		 */
  5808		if (!nr_reclaimed)
  5809			return false;
  5810	
  5811		/* If compaction would go ahead or the allocation would succeed, stop */
  5812		for (z = 0; z <= sc->reclaim_idx; z++) {
  5813			struct zone *zone = &pgdat->node_zones[z];
  5814			if (!managed_zone(zone))
  5815				continue;
  5816	
  5817			/* Allocation can already succeed, nothing to do */
  5818			if (zone_watermark_ok(zone, sc->order, min_wmark_pages(zone),
  5819					      sc->reclaim_idx, 0))
  5820				return false;
  5821	
> 5822			if (compaction_suitable(zone, sc->order, sc->reclaim_idx, 0))
  5823				return false;
  5824		}
  5825	
  5826		/*
  5827		 * If we have not reclaimed enough pages for compaction and the
  5828		 * inactive lists are large enough, continue reclaiming
  5829		 */
  5830		pages_for_compaction = compact_gap(sc->order);
  5831		inactive_lru_pages = node_page_state(pgdat, NR_INACTIVE_FILE);
  5832		if (can_reclaim_anon_pages(NULL, pgdat->node_id, sc))
  5833			inactive_lru_pages += node_page_state(pgdat, NR_INACTIVE_ANON);
  5834	
  5835		return inactive_lru_pages > pages_for_compaction;
  5836	}
  5837	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
