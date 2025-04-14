Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414E91A2387;
	Mon, 14 Apr 2025 05:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744610174; cv=none; b=VxrC72GD2ogKERh4bYazXi4ETowH4wmx1R9ItBXj6K50nRY0OQKKPv44sAaOAL0Fu2LfDlE9xOgK8KDCPmn5mDg3ozt338yt7Sdz5+okvxiKaazSiBEXxCJCue2fsTD9/CmDs9ZPEMmmlTJk4hpqYSh3OE+M1HzGIM3xlMejE/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744610174; c=relaxed/simple;
	bh=aN+se3juJWpOoPjwJKvEJXa/NbCfClXnP+JKkgfR6kY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bqW3gpfXFrl/nkg0RXhN28UeACqCtIAn01gngi+pAl+is9DiLycjlEN5pVUIIYH0jFVt8wPqhK/on3o7OsxVxnwMSr5fB5Y4G6st2U49XWnnW0Ii575Nfbt/0rGosjUfR8SBuAsFlAhfblGYVHFcCKg2fex4Tixq89W4YSOItVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JTJRYo/1; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JTJRYo/1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744610173; x=1776146173;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aN+se3juJWpOoPjwJKvEJXa/NbCfClXnP+JKkgfR6kY=;
  b=JTJRYo/1HnIbGrcFxXPeO3aYmt9Ok9lYqLUykqBO/CjbMHixa0KjNzRb
   gO3IWVpSYJvdL8lmbuJ4Y+B9kEznpCCXvMInn3/QYeuwAUlCpzeqjNTvy
   JRxmJT/NOyFqUuVtjB8fLcMGwVkx5dUp888Vl8LOa1I4KeS9gzzKFCb/A
   v3zOultOyPUFHRvdUtlXRQOdl5nrB+sRsmBkE2XJIMf7U2Btt47q+GgzO
   zv3yh4zD/VA8wEo/6vUf8/JqzW47ovCqo8XRwXMRI6wWS2DJAizVHLFVT
   5PMKpGYA4I6sjvrAPz4bmVKPwCL/5tmtA+2QqIvHP30BfvBndHkL67coT
   g==;
X-CSE-ConnectionGUID: lXiPfYRKRqqgxQXuhTxe4g==
X-CSE-MsgGUID: HMDgvqOSQJu45bCDvsa8tA==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="57434689"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="57434689"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 22:56:10 -0700
X-CSE-ConnectionGUID: lkqkkRvMSK6XWpLowF7NHA==
X-CSE-MsgGUID: w+7GtSTLSOaHlNzi/OzgVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="134563204"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Apr 2025 22:56:08 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u4Cne-000Dll-05;
	Mon, 14 Apr 2025 05:56:06 +0000
Date: Mon, 14 Apr 2025 13:55:52 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:migration 16/16] mm/compaction.c:468:46: warning:
 declaration of 'struct compact_control' will not be visible outside of this
 function
Message-ID: <202504141311.zXyCQoDS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux migration
head:   07b1b56f4f50e3b2ce6818d9ca0fbdbcd138d66f
commit: 07b1b56f4f50e3b2ce6818d9ca0fbdbcd138d66f [16/16] tmp
config: arm-randconfig-001-20250414 (https://download.01.org/0day-ci/archive/20250414/202504141311.zXyCQoDS-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250414/202504141311.zXyCQoDS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504141311.zXyCQoDS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/compaction.c:468:46: warning: declaration of 'struct compact_control' will not be visible outside of this function [-Wvisibility]
     468 | static inline bool isolation_suitable(struct compact_control *cc,
         |                                              ^
   mm/compaction.c:479:49: warning: declaration of 'struct compact_control' will not be visible outside of this function [-Wvisibility]
     479 | static inline void update_pageblock_skip(struct compact_control *cc,
         |                                                 ^
   mm/compaction.c:484:42: warning: declaration of 'struct compact_control' will not be visible outside of this function [-Wvisibility]
     484 | static void update_cached_migrate(struct compact_control *cc, unsigned long pfn)
         |                                          ^
   mm/compaction.c:488:38: warning: declaration of 'struct compact_control' will not be visible outside of this function [-Wvisibility]
     488 | static bool test_and_set_skip(struct compact_control *cc, struct page *page)
         |                                      ^
   mm/compaction.c:504:14: warning: declaration of 'struct compact_control' will not be visible outside of this function [-Wvisibility]
     504 |                                                 struct compact_control *cc)
         |                                                        ^
   mm/compaction.c:508:8: error: incomplete definition of type 'struct compact_control'
     508 |         if (cc->mode == MIGRATE_ASYNC && !cc->contended) {
         |             ~~^
   mm/compaction.c:504:14: note: forward declaration of 'struct compact_control'
     504 |                                                 struct compact_control *cc)
         |                                                        ^
   mm/compaction.c:508:38: error: incomplete definition of type 'struct compact_control'
     508 |         if (cc->mode == MIGRATE_ASYNC && !cc->contended) {
         |                                           ~~^
   mm/compaction.c:504:14: note: forward declaration of 'struct compact_control'
     504 |                                                 struct compact_control *cc)
         |                                                        ^
   mm/compaction.c:512:5: error: incomplete definition of type 'struct compact_control'
     512 |                 cc->contended = true;
         |                 ~~^
   mm/compaction.c:504:14: note: forward declaration of 'struct compact_control'
     504 |                                                 struct compact_control *cc)
         |                                                        ^
   mm/compaction.c:532:45: warning: declaration of 'struct compact_control' will not be visible outside of this function [-Wvisibility]
     532 |                 unsigned long flags, bool *locked, struct compact_control *cc)
         |                                                           ^
   mm/compaction.c:540:5: error: incomplete definition of type 'struct compact_control'
     540 |                 cc->contended = true;
         |                 ~~^
   mm/compaction.c:532:45: note: forward declaration of 'struct compact_control'
     532 |                 unsigned long flags, bool *locked, struct compact_control *cc)
         |                                                           ^
   mm/compaction.c:554:53: warning: declaration of 'struct compact_control' will not be visible outside of this function [-Wvisibility]
     554 | static unsigned long isolate_freepages_block(struct compact_control *cc,
         |                                                     ^
   mm/compaction.c:584:41: error: incomplete definition of type 'struct compact_control'
     584 |                     && compact_unlock_should_abort(&cc->zone->lock, flags,
         |                                                     ~~^
   mm/compaction.c:554:53: note: forward declaration of 'struct compact_control'
     554 | static unsigned long isolate_freepages_block(struct compact_control *cc,
         |                                                     ^
   mm/compaction.c:614:37: error: incomplete definition of type 'struct compact_control'
     614 |                         locked = compact_lock_irqsave(&cc->zone->lock,
         |                                                        ~~^
   mm/compaction.c:554:53: note: forward declaration of 'struct compact_control'
     554 | static unsigned long isolate_freepages_block(struct compact_control *cc,
         |                                                     ^
   mm/compaction.c:631:5: error: incomplete definition of type 'struct compact_control'
     631 |                 cc->nr_freepages += isolated;
         |                 ~~^
   mm/compaction.c:554:53: note: forward declaration of 'struct compact_control'
     554 | static unsigned long isolate_freepages_block(struct compact_control *cc,
         |                                                     ^
   mm/compaction.c:634:20: error: incomplete definition of type 'struct compact_control'
     634 |                 if (!strict && cc->nr_migratepages <= cc->nr_freepages) {
         |                                ~~^
   mm/compaction.c:554:53: note: forward declaration of 'struct compact_control'
     554 | static unsigned long isolate_freepages_block(struct compact_control *cc,
         |                                                     ^
   mm/compaction.c:634:43: error: incomplete definition of type 'struct compact_control'
     634 |                 if (!strict && cc->nr_migratepages <= cc->nr_freepages) {
         |                                                       ~~^
   mm/compaction.c:554:53: note: forward declaration of 'struct compact_control'
     554 | static unsigned long isolate_freepages_block(struct compact_control *cc,
         |                                                     ^
   mm/compaction.c:650:29: error: incomplete definition of type 'struct compact_control'
     650 |                 spin_unlock_irqrestore(&cc->zone->lock, flags);
         |                                         ~~^
   mm/compaction.c:554:53: note: forward declaration of 'struct compact_control'
     554 | static unsigned long isolate_freepages_block(struct compact_control *cc,
         |                                                     ^
   mm/compaction.c:658:2: error: call to undeclared function 'trace_mm_compaction_isolate_freepages'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     658 |         trace_mm_compaction_isolate_freepages(*start_pfn, blockpfn,
         |         ^
   mm/compaction.c:672:4: error: incomplete definition of type 'struct compact_control'
     672 |         cc->total_free_scanned += nr_scanned;
         |         ~~^
   mm/compaction.c:554:53: note: forward declaration of 'struct compact_control'
     554 | static unsigned long isolate_freepages_block(struct compact_control *cc,
         |                                                     ^
   mm/compaction.c:693:32: warning: declaration of 'struct compact_control' will not be visible outside of this function [-Wvisibility]
     693 | isolate_freepages_range(struct compact_control *cc,
         |                                ^
   mm/compaction.c:700:21: error: incomplete definition of type 'struct compact_control'
     700 |                 INIT_LIST_HEAD(&cc->freepages[order]);
         |                                 ~~^
   mm/compaction.c:693:32: note: forward declaration of 'struct compact_control'
     693 | isolate_freepages_range(struct compact_control *cc,
         |                                ^
   mm/compaction.c:704:26: error: incomplete definition of type 'struct compact_control'
     704 |         if (block_start_pfn < cc->zone->zone_start_pfn)
         |                               ~~^
   mm/compaction.c:693:32: note: forward declaration of 'struct compact_control'
     693 | isolate_freepages_range(struct compact_control *cc,
         |                                ^
   mm/compaction.c:705:23: error: incomplete definition of type 'struct compact_control'
     705 |                 block_start_pfn = cc->zone->zone_start_pfn;
         |                                   ~~^
   mm/compaction.c:693:32: note: forward declaration of 'struct compact_control'
     693 | isolate_freepages_range(struct compact_control *cc,
         |                                ^
   mm/compaction.c:727:23: error: incomplete definition of type 'struct compact_control'
     727 |                                         block_end_pfn, cc->zone))
         |                                                        ~~^
   mm/compaction.c:693:32: note: forward declaration of 'struct compact_control'
     693 | isolate_freepages_range(struct compact_control *cc,
         |                                ^
   mm/compaction.c:731:23: error: incomplete definition of type 'struct compact_control'
     731 |                                         block_end_pfn, cc->freepages, 0, true);
         |                                                        ~~^
   mm/compaction.c:693:32: note: forward declaration of 'struct compact_control'
     693 | isolate_freepages_range(struct compact_control *cc,
         |                                ^
   mm/compaction.c:750:3: error: call to undeclared function 'release_free_list'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     750 |                 release_free_list(cc->freepages);
         |                 ^
   mm/compaction.c:750:23: error: incomplete definition of type 'struct compact_control'
     750 |                 release_free_list(cc->freepages);
         |                                   ~~^
   mm/compaction.c:693:32: note: forward declaration of 'struct compact_control'
     693 | isolate_freepages_range(struct compact_control *cc,
         |                                ^
>> mm/compaction.c:693:1: warning: no previous prototype for function 'isolate_freepages_range' [-Wmissing-prototypes]
     693 | isolate_freepages_range(struct compact_control *cc,
         | ^
   mm/compaction.c:692:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     692 | unsigned long
         | ^
         | static 
   mm/compaction.c:759:38: warning: declaration of 'struct compact_control' will not be visible outside of this function [-Wvisibility]
     759 | static bool too_many_isolated(struct compact_control *cc)
         |                                      ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   10 warnings and 20 errors generated.


vim +468 mm/compaction.c

e380bebe477154 Mel Gorman      2019-03-05  449  
bb13ffeb9f6bfe Mel Gorman      2012-10-08  450  /*
bb13ffeb9f6bfe Mel Gorman      2012-10-08  451   * If no pages were isolated then mark this pageblock to be skipped in the
62997027ca5b3d Mel Gorman      2012-10-08  452   * future. The information is later cleared by __reset_isolation_suitable().
bb13ffeb9f6bfe Mel Gorman      2012-10-08  453   */
c89511ab2f8fe2 Mel Gorman      2012-10-08  454  static void update_pageblock_skip(struct compact_control *cc,
d097a6f6352254 Mel Gorman      2019-03-05  455  			struct page *page, unsigned long pfn)
bb13ffeb9f6bfe Mel Gorman      2012-10-08  456  {
c89511ab2f8fe2 Mel Gorman      2012-10-08  457  	struct zone *zone = cc->zone;
6815bf3f233e0b Joonsoo Kim     2013-12-18  458  
2583d6713267a4 Vlastimil Babka 2017-11-17  459  	if (cc->no_set_skip_hint)
6815bf3f233e0b Joonsoo Kim     2013-12-18  460  		return;
6815bf3f233e0b Joonsoo Kim     2013-12-18  461  
bb13ffeb9f6bfe Mel Gorman      2012-10-08  462  	set_pageblock_skip(page);
c89511ab2f8fe2 Mel Gorman      2012-10-08  463  
35979ef3393110 David Rientjes  2014-06-04  464  	if (pfn < zone->compact_cached_free_pfn)
c89511ab2f8fe2 Mel Gorman      2012-10-08  465  		zone->compact_cached_free_pfn = pfn;
c89511ab2f8fe2 Mel Gorman      2012-10-08  466  }
bb13ffeb9f6bfe Mel Gorman      2012-10-08  467  #else
bb13ffeb9f6bfe Mel Gorman      2012-10-08 @468  static inline bool isolation_suitable(struct compact_control *cc,
bb13ffeb9f6bfe Mel Gorman      2012-10-08  469  					struct page *page)
bb13ffeb9f6bfe Mel Gorman      2012-10-08  470  {
bb13ffeb9f6bfe Mel Gorman      2012-10-08  471  	return true;
bb13ffeb9f6bfe Mel Gorman      2012-10-08  472  }
bb13ffeb9f6bfe Mel Gorman      2012-10-08  473  

:::::: The code at line 468 was first introduced by commit
:::::: bb13ffeb9f6bfeb301443994dfbf29f91117dfb3 mm: compaction: cache if a pageblock was scanned and no pages were isolated

:::::: TO: Mel Gorman <mgorman@suse.de>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
