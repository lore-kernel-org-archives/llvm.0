Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8041F94C;
	Wed,  4 Dec 2024 10:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733308726; cv=none; b=ISGsoxDFOfhxfJ3HiA0zOdUWPFpzDHTYvmxevN6Ok0IjBhX3mMVmJJq327jJQ98sxVfoI7wlYG1leCIbKu7Y6LRgJStGaYRj1Mv7jfe1Hy0OwQiVRuT6NxLTnBdyhaTQ0dhAGZtHxefOCSOqjDqZ/kDwUMUg5tzOYZRj0Bi3MWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733308726; c=relaxed/simple;
	bh=4A93VKF8wZSwYmljmqxwUDGoMCxkXY26HmpdzbugSww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JRe70ebNrUsZwB4Ey8TFa/MFjAqzYbsbc/vj9zV0wcwxCSPT0hxOLIpIEdIofLjczbjBepMZQYfiLVWyhyt3pj6DFCZA67d0ipKTLr3/Xt+JH0zpjdL1mpzlT2pB1pkMZ4LuL3jpJMSK2fdnHlgQgBjneLZExa/lD0O+Dc+Vhfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EWjuAcWA; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EWjuAcWA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733308725; x=1764844725;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4A93VKF8wZSwYmljmqxwUDGoMCxkXY26HmpdzbugSww=;
  b=EWjuAcWA9IVHfRmsOLDFv8e6FzOlH3v/yObh+fwt+DRSjecqLR61hGix
   fetd6u9E7RIYvflHo/BPxZTjLp3o9V0OrhEYWMwhk0ZxCm3R9oiDaFgiD
   0aMrDu22aEcvel0/nxXqQImMF8g4l6pdcAdpH62iXLF0DUpWgy1Kfgwp7
   aGBk9L5c0ScUdUVdk/xu7awF6qGnGa3IOPLNsAfKYI4/nSUdsO8ia7p1l
   DCxFMqULdJ7oLvsoPvabpNhi0PJX2WrqjF301vRdqlFmhWk8mTTjvWeri
   xKaXhwwHA4Z1pWXwQ5OLSgoSmA4G+xAj0Gyw2kV4qzJu5OK6MyUdBgmqD
   w==;
X-CSE-ConnectionGUID: wM11FM1NR0Ss9PTRdiM9oQ==
X-CSE-MsgGUID: EB5twRfYTIG1+LOPFlS4rQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="33714570"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="33714570"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 02:38:42 -0800
X-CSE-ConnectionGUID: JFFXuDNWTpmJCsBuzTtEMA==
X-CSE-MsgGUID: clcbAxGQQ0aLuhQQJQr7WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="94557586"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 04 Dec 2024 02:38:41 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tImm7-0002tF-1O;
	Wed, 04 Dec 2024 10:38:32 +0000
Date: Wed, 4 Dec 2024 18:38:28 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Ridong <chenridong@huaweicloud.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 1/2] mm: vmascan: add find_folios_written_back()
 helper
Message-ID: <202412041806.UwnFZEnn-lkp@intel.com>
References: <20241204040158.2768519-2-chenridong@huaweicloud.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204040158.2768519-2-chenridong@huaweicloud.com>

Hi Chen,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Ridong/mm-vmascan-add-find_folios_written_back-helper/20241204-123817
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20241204040158.2768519-2-chenridong%40huaweicloud.com
patch subject: [RFC PATCH v3 1/2] mm: vmascan: add find_folios_written_back() helper
config: powerpc-mpc885_ads_defconfig (https://download.01.org/0day-ci/archive/20241204/202412041806.UwnFZEnn-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241204/202412041806.UwnFZEnn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412041806.UwnFZEnn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/vmscan.c:15:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/vmscan.c:30:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
>> mm/vmscan.c:318:50: error: use of undeclared identifier 'LRU_REFS_FLAGS'
     318 |                                 set_mask_bits(&folio->flags, LRU_REFS_MASK | LRU_REFS_FLAGS,
         |                                                                              ^
   mm/vmscan.c:451:51: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     451 |                         size += zone_page_state(zone, NR_ZONE_LRU_BASE + lru);
         |                                                       ~~~~~~~~~~~~~~~~ ^ ~~~
   mm/vmscan.c:1783:4: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    1783 |                         __count_zid_vm_events(PGSCAN_SKIP, zid, nr_skipped[zid]);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:139:34: note: expanded from macro '__count_zid_vm_events'
     139 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   mm/vmscan.c:2289:51: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
    2289 |         inactive = lruvec_page_state(lruvec, NR_LRU_BASE + inactive_lru);
         |                                              ~~~~~~~~~~~ ^ ~~~~~~~~~~~~
   mm/vmscan.c:2290:49: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
    2290 |         active = lruvec_page_state(lruvec, NR_LRU_BASE + active_lru);
         |                                            ~~~~~~~~~~~ ^ ~~~~~~~~~~
   mm/vmscan.c:6294:3: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    6294 |                 __count_zid_vm_events(ALLOCSTALL, sc->reclaim_idx, 1);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:139:34: note: expanded from macro '__count_zid_vm_events'
     139 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   8 warnings and 1 error generated.


vim +/LRU_REFS_FLAGS +318 mm/vmscan.c

   285	
   286	/**
   287	 * find_folios_written_back - Find and move the written back folios to a new list.
   288	 * @list: filios list
   289	 * @clean: the written back folios list
   290	 * @skip: whether skip to move the written back folios to clean list.
   291	 */
   292	static inline void find_folios_written_back(struct list_head *list,
   293			struct list_head *clean, bool skip)
   294	{
   295		struct folio *folio;
   296		struct folio *next;
   297	
   298		list_for_each_entry_safe_reverse(folio, next, list, lru) {
   299			if (!folio_evictable(folio)) {
   300				list_del(&folio->lru);
   301				folio_putback_lru(folio);
   302				continue;
   303			}
   304	
   305			if (folio_test_reclaim(folio) &&
   306			    (folio_test_dirty(folio) || folio_test_writeback(folio))) {
   307				/* restore LRU_REFS_FLAGS cleared by isolate_folio() */
   308				if (lru_gen_enabled() && folio_test_workingset(folio))
   309					folio_set_referenced(folio);
   310				continue;
   311			}
   312	
   313			if (skip || folio_test_active(folio) || folio_test_referenced(folio) ||
   314			    folio_mapped(folio) || folio_test_locked(folio) ||
   315			    folio_test_dirty(folio) || folio_test_writeback(folio)) {
   316				/* don't add rejected folios to the oldest generation */
   317				if (lru_gen_enabled())
 > 318					set_mask_bits(&folio->flags, LRU_REFS_MASK | LRU_REFS_FLAGS,
   319						      BIT(PG_active));
   320				continue;
   321			}
   322	
   323			/* retry folios that may have missed folio_rotate_reclaimable() */
   324			list_move(&folio->lru, clean);
   325		}
   326	}
   327	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
