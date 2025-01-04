Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C7719AD89;
	Sat,  4 Jan 2025 11:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735990178; cv=none; b=Z42AD2E/cIA1ILvmXo4UBJ0dt6eDxr0JQSJrPArWFIILkFlRk9yW7QCUUZcvc5C/9hZ+ioaC8yw1komZXi+J1zKWscosjkIYuCCRcexYqlfJyakEtP7oWviuoUGeeENdvJRWRkTJdApI8iswwjF4tGgX7/pL/BhGvFvpXdUPnH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735990178; c=relaxed/simple;
	bh=O9e5wiW1yLi7F+o3o0lqnCbhSuiSTuSEbgt//a05WEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QZwVESbsACjBprW8lq1gCRVYa+Sq7dek9mzwK3mQ6ASqEkTN4QwkA6tGqqkeKnbuVT0KUgQBlvR1Qick0QkgjTL/OSTSReCm7hV+J3PIW33IfL7s8UGaybA40jQKty3RHaZkutfJt2IpB8uIC+LV2kofb6ZmSaPXtjEmpO70iyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z47ZoaWk; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z47ZoaWk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735990177; x=1767526177;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O9e5wiW1yLi7F+o3o0lqnCbhSuiSTuSEbgt//a05WEQ=;
  b=Z47ZoaWkSJFhw2AshkmFy92Ykeumpp5JwnPgvQPSfQ3pXTEO9bsVpa66
   W7UQ6a6oeb9mHMsGN1q2pxNB4Qw4wJwh3Wb6eMaFF/lO0X6uneEiivtAS
   er5x0dRbeZqdiqFv3WCBmUF8n1NjzhesG+xUVbNyhs6r5f2QB5q1Vu5u7
   2oPRqEz4+d8UH6JbzXkMnurErMpav8ifXyJwBCVAGXXakPq6xu3AKoa9N
   D3cth6T/TrVluHKo2kf+yOnPuK//+8NLW84BDvwn5g6WOzrRFLcb2hWmP
   g3vNErbTk6kYrVxwNdzIcShT8OlfIyCHMroUyJc8yar9XCcv8SHqcDNAv
   g==;
X-CSE-ConnectionGUID: s/xf06CJTm+aVY74TdiTkQ==
X-CSE-MsgGUID: 4QbqDDtnR7uVl3GTS1f0cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="36088846"
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; 
   d="scan'208";a="36088846"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2025 03:29:36 -0800
X-CSE-ConnectionGUID: jBZErxqVSmW1tQUPDzNn8Q==
X-CSE-MsgGUID: B1kwv7fMRbWxHQJW49Yaig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; 
   d="scan'208";a="106856287"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Jan 2025 03:29:33 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tU2LT-000Asd-0p;
	Sat, 04 Jan 2025 11:29:31 +0000
Date: Sat, 4 Jan 2025 19:28:46 +0800
From: kernel test robot <lkp@intel.com>
To: yangge1116@126.com, akpm@linux-foundation.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, 21cnbao@gmail.com, david@redhat.com,
	baolin.wang@linux.alibaba.com, hannes@cmpxchg.org,
	liuzixing@hygon.cn, yangge <yangge1116@126.com>
Subject: Re: [PATCH] mm: compaction: skip memory compaction when there are
 not enough migratable pages
Message-ID: <202501041908.jDpLhAgL-lkp@intel.com>
References: <1735981122-2085-1-git-send-email-yangge1116@126.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1735981122-2085-1-git-send-email-yangge1116@126.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/yangge1116-126-com/mm-compaction-skip-memory-compaction-when-there-are-not-enough-migratable-pages/20250104-170112
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/1735981122-2085-1-git-send-email-yangge1116%40126.com
patch subject: [PATCH] mm: compaction: skip memory compaction when there are not enough migratable pages
config: i386-buildonly-randconfig-001-20250104 (https://download.01.org/0day-ci/archive/20250104/202501041908.jDpLhAgL-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250104/202501041908.jDpLhAgL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501041908.jDpLhAgL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/compaction.c:15:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
>> mm/compaction.c:2386:13: warning: unused variable 'pgdat' [-Wunused-variable]
    2386 |         pg_data_t *pgdat = zone->zone_pgdat;
         |                    ^~~~~
   3 warnings generated.


vim +/pgdat +2386 mm/compaction.c

  2381	
  2382	static bool __compaction_suitable(struct zone *zone, int order,
  2383					  int highest_zoneidx,
  2384					  unsigned long wmark_target)
  2385	{
> 2386		pg_data_t *pgdat = zone->zone_pgdat;
  2387		unsigned long sum, nr_pinned;
  2388		unsigned long watermark;
  2389	
  2390		sum = node_page_state(pgdat, NR_INACTIVE_FILE) +
  2391			node_page_state(pgdat, NR_INACTIVE_ANON) +
  2392			node_page_state(pgdat, NR_ACTIVE_FILE) +
  2393			node_page_state(pgdat, NR_ACTIVE_ANON);
  2394	
  2395		nr_pinned = node_page_state(pgdat, NR_FOLL_PIN_ACQUIRED) -
  2396			node_page_state(pgdat, NR_FOLL_PIN_RELEASED);
  2397	
  2398		/*
  2399		 * Gup-pinned pages are non-migratable. After subtracting these pages,
  2400		 * we need to check if the remaining pages are sufficient for memory
  2401		 * compaction.
  2402		 */
  2403		if ((sum - nr_pinned) < (1 << order))
  2404			return false;
  2405	
  2406		/*
  2407		 * Watermarks for order-0 must be met for compaction to be able to
  2408		 * isolate free pages for migration targets. This means that the
  2409		 * watermark and alloc_flags have to match, or be more pessimistic than
  2410		 * the check in __isolate_free_page(). We don't use the direct
  2411		 * compactor's alloc_flags, as they are not relevant for freepage
  2412		 * isolation. We however do use the direct compactor's highest_zoneidx
  2413		 * to skip over zones where lowmem reserves would prevent allocation
  2414		 * even if compaction succeeds.
  2415		 * For costly orders, we require low watermark instead of min for
  2416		 * compaction to proceed to increase its chances.
  2417		 * ALLOC_CMA is used, as pages in CMA pageblocks are considered
  2418		 * suitable migration targets
  2419		 */
  2420		watermark = (order > PAGE_ALLOC_COSTLY_ORDER) ?
  2421					low_wmark_pages(zone) : min_wmark_pages(zone);
  2422		watermark += compact_gap(order);
  2423		return __zone_watermark_ok(zone, 0, watermark, highest_zoneidx,
  2424					   ALLOC_CMA, wmark_target);
  2425	}
  2426	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
