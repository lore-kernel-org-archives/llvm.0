Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC23D29E;
	Wed, 24 Apr 2024 08:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713948490; cv=none; b=UO2ldLvaQKc0R92L6iu2N6AdlhR8SRO/ovv2TpuV98cgIPSEJezkswJC8jV/CCL95OtVr8/I1nqsHpLgpG+aGir6OpcrTQue2vx3xVB4fkSFyFcpQ2EasU5ezbz1zehrtFmlLLIR7xaHpPRKf5OyyZMpr2lPfDsFjgo09lGNc8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713948490; c=relaxed/simple;
	bh=/HL+4X8IY/eI5FKsmvT5diYov9GFrAkewSdOL7fSnMY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kpOLAXYCOC/bs7KI8KNkcjY3yvFYCRMuy804/XMmmcoDeopZr3ra5V/BdeElS5NEtj2Xswpdo2Yr0TXstN/ZuRAM14NU8drj6hO+0Jpq9z/DSYZUIZAT+LHyESlMiPuAVhJs8yKDNbzEZDxxnkirMkjMxDJTNtdGhkUhRmeHfjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zf2vywFD; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zf2vywFD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713948489; x=1745484489;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/HL+4X8IY/eI5FKsmvT5diYov9GFrAkewSdOL7fSnMY=;
  b=Zf2vywFDEJZM9/rEdiaN4n45AHyP6eE7q9z7pz1+lENhtvy76sqCfHMe
   I1ZjAMqfgyIssbJKkHCHt1KLR9dvGg7StDPaT46w1v5kiXymNh7kiHtYr
   Z6ixVcGr/wGMM2fQ0NcmtkBH37AsQJ6tUcZXhMNNmKJ2rSGyoz5mO0cWs
   Jka3gQugDw3Nxcd4XkZaRYqXZy+dPvrGz/1TDdlIPrHos5IiBbMF0UbC6
   gzufFIzyzmDEAylL9fvIKG0XArylsge21XP/8bqHXogXXFnAQqSjem6V+
   Gbwal9vbnQBiX9CZw7gxnx1Q8k4ZaX0Vn8Z1siDL+2rIkOswewfhz5Uig
   Q==;
X-CSE-ConnectionGUID: n9E7N3DLSLyYPoKDL/cTnw==
X-CSE-MsgGUID: YhxOKRJlTsO6NyweBka9bg==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="20718968"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="20718968"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 01:48:08 -0700
X-CSE-ConnectionGUID: NghPjNJPS/yVTxPy1UJn5Q==
X-CSE-MsgGUID: vxcJ7/l+Tx6/tsoP1Iv2hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="25164798"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 24 Apr 2024 01:48:06 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzYIN-00012u-29;
	Wed, 24 Apr 2024 08:48:03 +0000
Date: Wed, 24 Apr 2024 16:47:55 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:20240423-lbs-clean 20/20] mm/truncate.c:242:18: error:
 incompatible pointer types passing 'struct folio *' to parameter of type
 'struct page *'
Message-ID: <202404241603.wgkgvYng-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git 20240423-lbs-clean
head:   5df9e5b00d5e43e2ba445ab1099df2eab8ab4162
commit: 5df9e5b00d5e43e2ba445ab1099df2eab8ab4162 [20/20] mm: split a folio in minimum folio order chunks
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20240424/202404241603.wgkgvYng-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240424/202404241603.wgkgvYng-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404241603.wgkgvYng-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/truncate.c:12:
   In file included from include/linux/backing-dev.h:16:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/arm/include/asm/cacheflush.h:10:
   In file included from include/linux/mm.h:2210:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> mm/truncate.c:242:18: error: incompatible pointer types passing 'struct folio *' to parameter of type 'struct page *' [-Werror,-Wincompatible-pointer-types]
     242 |         if (split_folio(folio) == 0)
         |                         ^~~~~
   include/linux/huge_mm.h:90:44: note: expanded from macro 'split_folio'
      90 | #define split_folio(f) split_folio_to_list(f, NULL)
         |                                            ^
   include/linux/huge_mm.h:438:52: note: passing argument to parameter 'page' here
     438 | static inline int split_folio_to_list(struct page *page, struct list_head *list)
         |                                                    ^
   1 warning and 1 error generated.
--
   In file included from mm/vmscan.c:15:
   In file included from include/linux/mm.h:2210:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/vmscan.c:30:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   mm/vmscan.c:381:51: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     381 |                         size += zone_page_state(zone, NR_ZONE_LRU_BASE + lru);
         |                                                       ~~~~~~~~~~~~~~~~ ^ ~~~
>> mm/vmscan.c:1213:30: error: incompatible pointer types passing 'struct folio *' to parameter of type 'struct page *' [-Werror,-Wincompatible-pointer-types]
    1213 |                                             split_folio_to_list(folio,
         |                                                                 ^~~~~
   include/linux/huge_mm.h:438:52: note: passing argument to parameter 'page' here
     438 | static inline int split_folio_to_list(struct page *page, struct list_head *list)
         |                                                    ^
   mm/vmscan.c:1221:30: error: incompatible pointer types passing 'struct folio *' to parameter of type 'struct page *' [-Werror,-Wincompatible-pointer-types]
    1221 |                                         if (split_folio_to_list(folio,
         |                                                                 ^~~~~
   include/linux/huge_mm.h:438:52: note: passing argument to parameter 'page' here
     438 | static inline int split_folio_to_list(struct page *page, struct list_head *list)
         |                                                    ^
   mm/vmscan.c:1235:28: error: incompatible pointer types passing 'struct folio *' to parameter of type 'struct page *' [-Werror,-Wincompatible-pointer-types]
    1235 |                         if (split_folio_to_list(folio, folio_list))
         |                                                 ^~~~~
   include/linux/huge_mm.h:438:52: note: passing argument to parameter 'page' here
     438 | static inline int split_folio_to_list(struct page *page, struct list_head *list)
         |                                                    ^
   mm/vmscan.c:1694:4: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    1694 |                         __count_zid_vm_events(PGSCAN_SKIP, zid, nr_skipped[zid]);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:135:34: note: expanded from macro '__count_zid_vm_events'
     135 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   mm/vmscan.c:2201:51: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
    2201 |         inactive = lruvec_page_state(lruvec, NR_LRU_BASE + inactive_lru);
         |                                              ~~~~~~~~~~~ ^ ~~~~~~~~~~~~
   mm/vmscan.c:2202:49: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
    2202 |         active = lruvec_page_state(lruvec, NR_LRU_BASE + active_lru);
         |                                            ~~~~~~~~~~~ ^ ~~~~~~~~~~
   mm/vmscan.c:6207:3: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    6207 |                 __count_zid_vm_events(ALLOCSTALL, sc->reclaim_idx, 1);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:135:34: note: expanded from macro '__count_zid_vm_events'
     135 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   8 warnings and 3 errors generated.


vim +242 mm/truncate.c

750b4987b0cd4d Nicholas Piggin         2009-09-16  198  
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  199) /*
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  200)  * Handle partial folios.  The folio may be entirely within the
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  201)  * range if a split has raced with us.  If not, we zero the part of the
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  202)  * folio that's within the [start, end] range, and then split the folio if
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  203)  * it's large.  split_page_range() will discard pages which now lie beyond
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  204)  * i_size, and we rely on the caller to discard pages which lie within a
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  205)  * newly created hole.
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  206)  *
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  207)  * Returns false if splitting failed so the caller can avoid
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  208)  * discarding the entire folio which is stubbornly unsplit.
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  209)  */
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  210) bool truncate_inode_partial_folio(struct folio *folio, loff_t start, loff_t end)
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  211) {
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  212) 	loff_t pos = folio_pos(folio);
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  213) 	unsigned int offset, length;
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  214) 
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  215) 	if (pos < start)
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  216) 		offset = start - pos;
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  217) 	else
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  218) 		offset = 0;
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  219) 	length = folio_size(folio);
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  220) 	if (pos + length <= (u64)end)
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  221) 		length = length - offset;
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  222) 	else
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  223) 		length = end + 1 - pos - offset;
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  224) 
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  225) 	folio_wait_writeback(folio);
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  226) 	if (length == folio_size(folio)) {
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  227) 		truncate_inode_folio(folio->mapping, folio);
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  228) 		return true;
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  229) 	}
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  230) 
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  231) 	/*
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  232) 	 * We may be zeroing pages we're about to discard, but it avoids
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  233) 	 * doing a complex calculation here, and then doing the zeroing
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  234) 	 * anyway if the page split fails.
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  235) 	 */
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  236) 	folio_zero_range(folio, offset, length);
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  237) 
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  238) 	if (folio_has_private(folio))
5ad6b2bdaaea71 Matthew Wilcox (Oracle  2022-02-09  239) 		folio_invalidate(folio, offset, length);
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  240) 	if (!folio_test_large(folio))
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  241) 		return true;
d788f5b374c2ba Matthew Wilcox (Oracle  2022-09-02 @242) 	if (split_folio(folio) == 0)
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  243) 		return true;
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  244) 	if (folio_test_dirty(folio))
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  245) 		return false;
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  246) 	truncate_inode_folio(folio->mapping, folio);
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  247) 	return true;
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  248) }
b9a8a4195c7d3a Matthew Wilcox (Oracle  2020-05-27  249) 

:::::: The code at line 242 was first introduced by commit
:::::: d788f5b374c2ba204fed57e39acf2452acc24812 mm: add split_folio()

:::::: TO: Matthew Wilcox (Oracle) <willy@infradead.org>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
