Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D498D259499;
	Fri, 20 Dec 2024 10:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734689891; cv=none; b=jGSbUpZhxP0yByDfoZh/7N5MJfm3qAj4hLroMg9OQUEpjSCMYX71Mnfx2GWjpjuweyPCbjr7ExvrwtuNBwOSZXKck5IODyaoXy7fKPvmnLfmV4OsgLrpsCBRqsH++Vd+wPAb8VICrKMoWj/F4sN6zRp0u6FC7ZwWmjkVF+XYOsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734689891; c=relaxed/simple;
	bh=7hpB+GYR0gvpYDZnjP0453dc4dqzBBTZet1ls1VwAYA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V/0juKIAdP2pppv5BxyiH2sSTGK5GtG9vqgCFmbTdHP/LnSrlR/lr0q0t+qWVL23g6Djj+IfQSPkSQHlE9m1TzgXqRVyIp+Wgp6/GAWYXOkqcle6hZwUJRtpGU/gwpGM0bb9ieF3Nz1UxPA+q/uC0DjUAxyAkC7w1kfATeOoeow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GnnR9JvW; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GnnR9JvW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734689889; x=1766225889;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7hpB+GYR0gvpYDZnjP0453dc4dqzBBTZet1ls1VwAYA=;
  b=GnnR9JvWaFKV/261SCO/BiRlD6WrPHG8Yk+briig7zZT8xRuAkmdg1/a
   x5lJVF6Toa5qNKXg3FyR5MsXLKYKuuXWBrJHdyyh3z3MOmReRP7LN6Z36
   niErSCC24CyCVWXBwKr8wMxp1gHg54MgAiQkFjFO25Y81JU898N7YloJB
   Ya79VKnERo1J3p18V5jkaWv4XBXjSyEv3vmUjD2kXEGbRm6H7sln7Oyim
   6FoLBucbwX6VIkUfzh3x8txbhWVvElR0ScCVAFxh3ntFn+e18eDvOQvGN
   iSX0IxD7I2HuRSIklejQ8ZrJbjoKR2TY5w0V+tCCRp06SaRAwPkWgKIzA
   w==;
X-CSE-ConnectionGUID: LznGk76/TCOxBtnXTH3sLQ==
X-CSE-MsgGUID: Ac2kIVGmS1uqlK/TM1M3ZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="46616455"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="46616455"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 02:18:09 -0800
X-CSE-ConnectionGUID: MsZqWA+PQ9WnIXvFkS44kg==
X-CSE-MsgGUID: iV8arkHQSfGjqVxwbVXP+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="99296728"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 20 Dec 2024 02:18:07 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOa56-000137-1R;
	Fri, 20 Dec 2024 10:18:04 +0000
Date: Fri, 20 Dec 2024 18:17:09 +0800
From: kernel test robot <lkp@intel.com>
To: yangge <yangge1116@126.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 253/254] include/linux/hugetlb.h:1063:5:
 warning: no previous prototype for function 'replace_free_hugepage_folios'
Message-ID: <202412201800.vhgfNG83-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   5555a83c82d66729e4abaf16ae28d6bd81f9a64a
commit: fba5261e0039dcf4de077fd12ea9ae2501d92b88 [253/254] mm: replace free hugepage folios after migration
config: i386-buildonly-randconfig-004-20241220 (https://download.01.org/0day-ci/archive/20241220/202412201800.vhgfNG83-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241220/202412201800.vhgfNG83-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412201800.vhgfNG83-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/mincore.c:19:
>> include/linux/hugetlb.h:1063:5: warning: no previous prototype for function 'replace_free_hugepage_folios' [-Wmissing-prototypes]
    1063 | int replace_free_hugepage_folios(unsigned long start_pfn, unsigned long end_pfn)
         |     ^
   include/linux/hugetlb.h:1063:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1063 | int replace_free_hugepage_folios(unsigned long start_pfn, unsigned long end_pfn)
         | ^
         | static 
   1 warning generated.
--
   In file included from mm/pagewalk.c:5:
>> include/linux/hugetlb.h:1063:5: warning: no previous prototype for function 'replace_free_hugepage_folios' [-Wmissing-prototypes]
    1063 | int replace_free_hugepage_folios(unsigned long start_pfn, unsigned long end_pfn)
         |     ^
   include/linux/hugetlb.h:1063:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1063 | int replace_free_hugepage_folios(unsigned long start_pfn, unsigned long end_pfn)
         | ^
         | static 
   In file included from mm/pagewalk.c:12:
   In file included from mm/internal.h:13:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   3 warnings generated.
--
   In file included from mm/vmalloc.c:41:
>> include/linux/hugetlb.h:1063:5: warning: no previous prototype for function 'replace_free_hugepage_folios' [-Wmissing-prototypes]
    1063 | int replace_free_hugepage_folios(unsigned long start_pfn, unsigned long end_pfn)
         |     ^
   include/linux/hugetlb.h:1063:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1063 | int replace_free_hugepage_folios(unsigned long start_pfn, unsigned long end_pfn)
         | ^
         | static 
   In file included from mm/vmalloc.c:50:
   In file included from mm/internal.h:13:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   mm/vmalloc.c:1938:20: warning: unused function 'setup_vmalloc_vm' [-Wunused-function]
    1938 | static inline void setup_vmalloc_vm(struct vm_struct *vm,
         |                    ^~~~~~~~~~~~~~~~
   4 warnings generated.
--
   In file included from mm/mremap.c:12:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   In file included from mm/mremap.c:13:
>> include/linux/hugetlb.h:1063:5: warning: no previous prototype for function 'replace_free_hugepage_folios' [-Wmissing-prototypes]
    1063 | int replace_free_hugepage_folios(unsigned long start_pfn, unsigned long end_pfn)
         |     ^
   include/linux/hugetlb.h:1063:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1063 | int replace_free_hugepage_folios(unsigned long start_pfn, unsigned long end_pfn)
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
   In file included from include/linux/migrate.h:8:
>> include/linux/hugetlb.h:1063:5: warning: no previous prototype for function 'replace_free_hugepage_folios' [-Wmissing-prototypes]
    1063 | int replace_free_hugepage_folios(unsigned long start_pfn, unsigned long end_pfn)
         |     ^
   include/linux/hugetlb.h:1063:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1063 | int replace_free_hugepage_folios(unsigned long start_pfn, unsigned long end_pfn)
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
   In file included from mm/vmscan.c:30:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   In file included from mm/vmscan.c:42:
   In file included from include/linux/migrate.h:8:
>> include/linux/hugetlb.h:1063:5: warning: no previous prototype for function 'replace_free_hugepage_folios' [-Wmissing-prototypes]
    1063 | int replace_free_hugepage_folios(unsigned long start_pfn, unsigned long end_pfn)
         |     ^
   include/linux/hugetlb.h:1063:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1063 | int replace_free_hugepage_folios(unsigned long start_pfn, unsigned long end_pfn)
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
   mm/vmscan.c:6239:3: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    6239 |                 __count_zid_vm_events(ALLOCSTALL, sc->reclaim_idx, 1);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:139:34: note: expanded from macro '__count_zid_vm_events'
     139 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   8 warnings generated.


vim +/replace_free_hugepage_folios +1063 include/linux/hugetlb.h

  1062	
> 1063	int replace_free_hugepage_folios(unsigned long start_pfn, unsigned long end_pfn)
  1064	{
  1065		return 0;
  1066	}
  1067	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
