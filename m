Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C6580C02;
	Sat, 20 Sep 2025 14:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758379332; cv=none; b=J9KihnNN+kamRKI8DTSu2ZAev4/YXCgc0GOX9MOIobkzVbhnza6zSGLP3/izBxlathdT+pjijaQJhgt+lwFCWIMGchqhN+YTh91DJG5/yWDEHLPfx1B0dJINvzqsjB69EKFKfVoDdcCb4npAPKBYdqUPjwv6l4rW/0J7dH9uob4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758379332; c=relaxed/simple;
	bh=mYEMBMY00zG8bw7SRkHiUSAmc6oUqyQZi0XqD7c7Phs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VkTDhZPPNfII4jMtu/GjQm4w8X9yllnxGyN9yrKiFQoPcNmidTYLpu018vOr5sWTrlRHeZLe9cWxjLlMBB5KyJ+GXMYCUHrWYLTsC369WqNPL6MnyVyNA/y8ruw4RQOk2iKpj5tGsAWx9dw3kWPMswGx2jFctkvDhGr/gK2MfOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kFOkuahB; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kFOkuahB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758379332; x=1789915332;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mYEMBMY00zG8bw7SRkHiUSAmc6oUqyQZi0XqD7c7Phs=;
  b=kFOkuahBFOlbhMGpQheu+JA61FQle+3Vq+nuRwGtufvXmpfsTi9/mYJv
   ZyUEzq2N1Dy6+X1YBUlkiiQHugCn4OBCgD1ElCOGYdylkJ6V4jmgkAVB4
   VOvTzLZ5Vs+Bp+QJNlBRwr0VVbEiLIW5ieqBGDWZnIfZGXtgdN479NZHP
   8ZF8rMwDEeR0Ey1fOqaP2szu5JmWURv7o6srWhAohoo86DeeMwvzh4Zwk
   YC8YC/oCxOhu3VKO7F9GnRiFR8nQiAwG5gPgiN9hz/muN/2DX8O/O8BBK
   2lK9K3SdR5Vmn8UtNyZ/qsvVEt2LqYbDXwH7sOiyyerWge3PGldlMNjV4
   w==;
X-CSE-ConnectionGUID: +WqR0VAARO6vXuzVqrYnmg==
X-CSE-MsgGUID: XzBzD74qT5mVlaKgHiNNgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11559"; a="72131526"
X-IronPort-AV: E=Sophos;i="6.18,281,1751266800"; 
   d="scan'208";a="72131526"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2025 07:42:11 -0700
X-CSE-ConnectionGUID: G0MuOP/TSMqQsW5gXH8ukg==
X-CSE-MsgGUID: 46w8oVIuTPqFBpu6EoKOlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,281,1751266800"; 
   d="scan'208";a="176131374"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 20 Sep 2025 07:42:07 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzymq-0005O3-0u;
	Sat, 20 Sep 2025 14:42:04 +0000
Date: Sat, 20 Sep 2025 22:41:48 +0800
From: kernel test robot <lkp@intel.com>
To: Joshua Hahn <joshua.hahnjy@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Johannes Weiner <hannes@cmpxchg.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Chris Mason <chris.mason@fusionio.com>,
	Kiryl Shutsemau <kirill@shutemov.name>,
	Brendan Jackman <jackmanb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@suse.cz>, Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 4/4] mm/page_alloc: Batch page freeing in
 free_frozen_page_commit
Message-ID: <202509202221.bpQxfR5E-lkp@intel.com>
References: <20250919195223.1560636-5-joshua.hahnjy@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919195223.1560636-5-joshua.hahnjy@gmail.com>

Hi Joshua,

kernel test robot noticed the following build errors:

[auto build test ERROR on 097a6c336d0080725c626fda118ecfec448acd0f]

url:    https://github.com/intel-lab-lkp/linux/commits/Joshua-Hahn/mm-page_alloc-vmstat-Simplify-refresh_cpu_vm_stats-change-detection/20250920-035357
base:   097a6c336d0080725c626fda118ecfec448acd0f
patch link:    https://lore.kernel.org/r/20250919195223.1560636-5-joshua.hahnjy%40gmail.com
patch subject: [PATCH 4/4] mm/page_alloc: Batch page freeing in free_frozen_page_commit
config: x86_64-buildonly-randconfig-003-20250920 (https://download.01.org/0day-ci/archive/20250920/202509202221.bpQxfR5E-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250920/202509202221.bpQxfR5E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509202221.bpQxfR5E-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/page_alloc.c:2891:23: error: use of undeclared identifier 'UP_flags'
    2891 |                         pcp_trylock_finish(UP_flags);
         |                                            ^
>> mm/page_alloc.c:2891:23: error: use of undeclared identifier 'UP_flags'
   mm/page_alloc.c:2893:24: error: use of undeclared identifier 'UP_flags'
    2893 |                         pcp_trylock_prepare(UP_flags);
         |                                             ^
   mm/page_alloc.c:2893:24: error: use of undeclared identifier 'UP_flags'
   mm/page_alloc.c:2896:24: error: use of undeclared identifier 'UP_flags'
    2896 |                                 pcp_trylock_finish(UP_flags);
         |                                                    ^
   mm/page_alloc.c:2896:24: error: use of undeclared identifier 'UP_flags'
   6 errors generated.


vim +/UP_flags +2891 mm/page_alloc.c

  2823	
  2824	/*
  2825	 * Tune pcp alloc factor and adjust count & free_count. Free pages to bring the
  2826	 * pcp's watermarks below high.
  2827	 *
  2828	 * May return a freed pcp, if during page freeing the pcp spinlock cannot be
  2829	 * reacquired. Return true if pcp is locked, false otherwise.
  2830	 */
  2831	static bool free_frozen_page_commit(struct zone *zone,
  2832			struct per_cpu_pages *pcp, struct page *page, int migratetype,
  2833			unsigned int order, fpi_t fpi_flags)
  2834	{
  2835		int high, batch;
  2836		int to_free, to_free_batched;
  2837		int pindex;
  2838		bool free_high = false;
  2839	
  2840		/*
  2841		 * On freeing, reduce the number of pages that are batch allocated.
  2842		 * See nr_pcp_alloc() where alloc_factor is increased for subsequent
  2843		 * allocations.
  2844		 */
  2845		pcp->alloc_factor >>= 1;
  2846		__count_vm_events(PGFREE, 1 << order);
  2847		pindex = order_to_pindex(migratetype, order);
  2848		list_add(&page->pcp_list, &pcp->lists[pindex]);
  2849		pcp->count += 1 << order;
  2850	
  2851		batch = READ_ONCE(pcp->batch);
  2852		/*
  2853		 * As high-order pages other than THP's stored on PCP can contribute
  2854		 * to fragmentation, limit the number stored when PCP is heavily
  2855		 * freeing without allocation. The remainder after bulk freeing
  2856		 * stops will be drained from vmstat refresh context.
  2857		 */
  2858		if (order && order <= PAGE_ALLOC_COSTLY_ORDER) {
  2859			free_high = (pcp->free_count >= (batch + pcp->high_min / 2) &&
  2860				     (pcp->flags & PCPF_PREV_FREE_HIGH_ORDER) &&
  2861				     (!(pcp->flags & PCPF_FREE_HIGH_BATCH) ||
  2862				      pcp->count >= batch));
  2863			pcp->flags |= PCPF_PREV_FREE_HIGH_ORDER;
  2864		} else if (pcp->flags & PCPF_PREV_FREE_HIGH_ORDER) {
  2865			pcp->flags &= ~PCPF_PREV_FREE_HIGH_ORDER;
  2866		}
  2867		if (pcp->free_count < (batch << CONFIG_PCP_BATCH_SCALE_MAX))
  2868			pcp->free_count += (1 << order);
  2869	
  2870		if (unlikely(fpi_flags & FPI_TRYLOCK)) {
  2871			/*
  2872			 * Do not attempt to take a zone lock. Let pcp->count get
  2873			 * over high mark temporarily.
  2874			 */
  2875			return true;
  2876		}
  2877		high = nr_pcp_high(pcp, zone, batch, free_high);
  2878		to_free = nr_pcp_free(pcp, batch, high, free_high);
  2879		while (to_free > 0 && pcp->count >= high) {
  2880			to_free_batched = min(to_free, batch);
  2881			free_pcppages_bulk(zone, to_free_batched, pcp, pindex);
  2882			if (test_bit(ZONE_BELOW_HIGH, &zone->flags) &&
  2883			    zone_watermark_ok(zone, 0, high_wmark_pages(zone),
  2884					      ZONE_MOVABLE, 0))
  2885				clear_bit(ZONE_BELOW_HIGH, &zone->flags);
  2886	
  2887			high = nr_pcp_high(pcp, zone, batch, free_high);
  2888			to_free -= to_free_batched;
  2889			if (pcp->count >= high) {
  2890				pcp_spin_unlock(pcp);
> 2891				pcp_trylock_finish(UP_flags);
  2892	
  2893				pcp_trylock_prepare(UP_flags);
  2894				pcp = pcp_spin_trylock(zone->per_cpu_pageset);
  2895				if (!pcp) {
  2896					pcp_trylock_finish(UP_flags);
  2897					return false;
  2898				}
  2899			}
  2900		}
  2901	
  2902		return true;
  2903	}
  2904	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
