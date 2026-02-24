Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7B5243951;
	Tue, 24 Feb 2026 05:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771911487; cv=none; b=uFfOpIjCCfxEy/T4xSKJuIx2fvfLWx+386M36BxJkzAuqcQm4sunjLz8iKzAmJ3g5qUagL+N6uQ5X5SDx4ivISC4UeovjelY7WMZL8muTW+q1Ih8JkvAT0ZXhdRb5+nMapOU8bHjQ3ATPU82M46mcTTw/gP+PpzB4TosvSOUCes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771911487; c=relaxed/simple;
	bh=Gqh9h962tgOQ1b8PCMfKkACvzOt8QaLVHfKRkkH1KhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uG5/olUJZuFHYCvBcywHIrHuVjqNl6DbVvVO9sD4rFx0Jr9sBoCMXE7SN8UbpAsCSL4eHiH91D6xEszsAuamB1MgoHjXNxUG3Jh1+9/d0StySt7QFszaKehOJ5dEn43gV/XUTj4B5MrLBRpg5dSdB1yLbKx2mEE2BvqBrrHZuRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TSeIMEFO; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TSeIMEFO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771911486; x=1803447486;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Gqh9h962tgOQ1b8PCMfKkACvzOt8QaLVHfKRkkH1KhI=;
  b=TSeIMEFOMoza1AAEfmSyAqZ4TUlWW/heZRGfXOYKF7whCL0x/PKM6oCv
   T+79I5mzSvwK581skF8ZmXHch6bJC+Eq2M/l4m3icaX+jqRaK7UTzQsXs
   /4MtVWAGD6G8OVgjFXR3w6/mbBmIovGKQdF1sNnX+4Ujr8+9tYvHxAnVq
   aOMwBK9KC8xBw3eFSWan/JpkJpzJQ3hRBaVAm40c3anTy2Bcxk3wg3nJy
   HSeMPUWC/H4hqOcql8qodYmfoKM68KCGuVT8fascvYdse/NseYyL4wwYK
   TizyPnhNwyhf9nZ7xu1QZq+58niK1NXjinSegpgOVyVe1+ib4KR2RXJ4o
   g==;
X-CSE-ConnectionGUID: VejSGv5pQjavUkgdn/83PA==
X-CSE-MsgGUID: k5kM8MbNQxazk59nUEuCug==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72624043"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="72624043"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 21:38:06 -0800
X-CSE-ConnectionGUID: AKz6VfjLSZCFIWJfjjB47Q==
X-CSE-MsgGUID: kUfqaoNaQymZFOT/ObPYJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="220318830"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 23 Feb 2026 21:38:05 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vul7K-000000001S1-27jD;
	Tue, 24 Feb 2026 05:37:57 +0000
Date: Tue, 24 Feb 2026 13:36:59 +0800
From: kernel test robot <lkp@intel.com>
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 5/6] mm/memcontrol, page_counter: Make memory.low
 tier-aware
Message-ID: <202602241310.PE1e03sT-lkp@intel.com>
References: <20260223223830.586018-6-joshua.hahnjy@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223223830.586018-6-joshua.hahnjy@gmail.com>

Hi Joshua,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Joshua-Hahn/mm-page_counter-Introduce-tiered-memory-awareness-to-page_counter/20260224-073845
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260223223830.586018-6-joshua.hahnjy%40gmail.com
patch subject: [RFC PATCH 5/6] mm/memcontrol, page_counter: Make memory.low tier-aware
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260224/202602241310.PE1e03sT-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260224/202602241310.PE1e03sT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602241310.PE1e03sT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/vmscan.c:6003:6: error: use of undeclared identifier 'tier_aware_memcg_limits'
    6003 |                                         tier_aware_memcg_limits && toptier)) {
         |                                         ^
   1 error generated.


vim +/tier_aware_memcg_limits +6003 mm/vmscan.c

  5957	
  5958	static void shrink_node_memcgs(pg_data_t *pgdat, struct scan_control *sc)
  5959	{
  5960		struct mem_cgroup *target_memcg = sc->target_mem_cgroup;
  5961		struct mem_cgroup_reclaim_cookie reclaim = {
  5962			.pgdat = pgdat,
  5963		};
  5964		struct mem_cgroup_reclaim_cookie *partial = &reclaim;
  5965		struct mem_cgroup *memcg;
  5966		bool toptier = node_is_toptier(pgdat->node_id);
  5967	
  5968		/*
  5969		 * In most cases, direct reclaimers can do partial walks
  5970		 * through the cgroup tree, using an iterator state that
  5971		 * persists across invocations. This strikes a balance between
  5972		 * fairness and allocation latency.
  5973		 *
  5974		 * For kswapd, reliable forward progress is more important
  5975		 * than a quick return to idle. Always do full walks.
  5976		 */
  5977		if (current_is_kswapd() || sc->memcg_full_walk)
  5978			partial = NULL;
  5979	
  5980		memcg = mem_cgroup_iter(target_memcg, NULL, partial);
  5981		do {
  5982			struct lruvec *lruvec = mem_cgroup_lruvec(memcg, pgdat);
  5983			unsigned long reclaimed;
  5984			unsigned long scanned;
  5985	
  5986			/*
  5987			 * This loop can become CPU-bound when target memcgs
  5988			 * aren't eligible for reclaim - either because they
  5989			 * don't have any reclaimable pages, or because their
  5990			 * memory is explicitly protected. Avoid soft lockups.
  5991			 */
  5992			cond_resched();
  5993	
  5994			mem_cgroup_calculate_protection(target_memcg, memcg, toptier);
  5995	
  5996			if (mem_cgroup_below_min(target_memcg, memcg)) {
  5997				/*
  5998				 * Hard protection.
  5999				 * If there is no reclaimable memory, OOM.
  6000				 */
  6001				continue;
  6002			} else if (mem_cgroup_below_low(target_memcg, memcg,
> 6003						tier_aware_memcg_limits && toptier)) {
  6004				/*
  6005				 * Soft protection.
  6006				 * Respect the protection only as long as
  6007				 * there is an unprotected supply
  6008				 * of reclaimable memory from other cgroups.
  6009				 */
  6010				if (!sc->memcg_low_reclaim) {
  6011					sc->memcg_low_skipped = 1;
  6012					continue;
  6013				}
  6014				memcg_memory_event(memcg, MEMCG_LOW);
  6015			}
  6016	
  6017			reclaimed = sc->nr_reclaimed;
  6018			scanned = sc->nr_scanned;
  6019	
  6020			shrink_lruvec(lruvec, sc);
  6021	
  6022			shrink_slab(sc->gfp_mask, pgdat->node_id, memcg,
  6023				    sc->priority);
  6024	
  6025			/* Record the group's reclaim efficiency */
  6026			if (!sc->proactive)
  6027				vmpressure(sc->gfp_mask, memcg, false,
  6028					   sc->nr_scanned - scanned,
  6029					   sc->nr_reclaimed - reclaimed);
  6030	
  6031			/* If partial walks are allowed, bail once goal is reached */
  6032			if (partial && sc->nr_reclaimed >= sc->nr_to_reclaim) {
  6033				mem_cgroup_iter_break(target_memcg, memcg);
  6034				break;
  6035			}
  6036		} while ((memcg = mem_cgroup_iter(target_memcg, memcg, partial)));
  6037	}
  6038	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
