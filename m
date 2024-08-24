Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEDC17ADF0;
	Sat, 24 Aug 2024 15:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724512514; cv=none; b=d3B6FAzy40Xf0aP1OZU7pzUghGNig83e8rRO+b5ofOkc5dc8zgJJHYnDE5OFCZDi+Cbq4arbweLtyF9EAtHjaeKSmqmD+Bu/TR2Bc7l9jvBuEXcBbinMnQMa+puRcFJrA1nGy+QFYmkMsESr8jDMa6eda8HLaCBOs7UW/z6dj9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724512514; c=relaxed/simple;
	bh=NicyyiMcd9HEoDW7MAWCI8DVBTruke1Py8vjTw1MPhA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ortL65o2Rqeh0pa4dr1VmmUPLemSlYGCXKgaj/yMp+cQ7J8TxaJEdtFykIPpRstbTJlctyGy+N5YqccZVwtWJo1ZE6uukS3sThVkvmByeQYXHxDIkh4prpeIaIf4olKxyt0RIlRl9MUiUYYUyfjfqXY1I9QqBurcKjODGooR6/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d8C3hNS1; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d8C3hNS1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724512512; x=1756048512;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NicyyiMcd9HEoDW7MAWCI8DVBTruke1Py8vjTw1MPhA=;
  b=d8C3hNS1TNo762JiAUQNs3vAS4WIjqll7srOzia62BM9QWeDtrF/4lOT
   4+ad9tloftZFjAlZwG6VtlBYvUHP2j5KfQd78CPWFyxGGLV7hdCSMApl5
   o0tlAjyQ2HoqIfmoTxiwFAtNouovU1MkqIhQdRx6mi4AYurS7jC1K2SNG
   g5BBAedRUNLON5boua3UEkzTAaJt6u0gViMUSF8aapKL3xECn924UlGjz
   c5yfGpo4ZW9ysWlODw4Sf81o+ew/GI+5ES7T0Yj+xgXtbTj0sKFitun9O
   EzsHgtudnWU3u+N/m3N4yZ2BXSyqDKYxX7KYg6GxwTWDZbqrgK7UQb3P+
   w==;
X-CSE-ConnectionGUID: LxxJdyW6RmC5QMkNV3AndA==
X-CSE-MsgGUID: +A8IOC4IT+qZaIKVCdJYPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11173"; a="34395862"
X-IronPort-AV: E=Sophos;i="6.10,173,1719903600"; 
   d="scan'208";a="34395862"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2024 08:15:08 -0700
X-CSE-ConnectionGUID: 7YbP17hZSSOoOE1qPIjQyA==
X-CSE-MsgGUID: ENWhByTkRH+YJKb2VM3ZEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,173,1719903600"; 
   d="scan'208";a="67022624"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 24 Aug 2024 08:15:07 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shsTo-000EYX-0s;
	Sat, 24 Aug 2024 15:15:04 +0000
Date: Sat, 24 Aug 2024 23:14:17 +0800
From: kernel test robot <lkp@intel.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Subject: [akpm-mm:mm-unstable 357/379] mm/vma.h:114:19: error: use of
 undeclared identifier 'USER_PGTABLES_CEILING'
Message-ID: <202408242348.uGvgH9tt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   b659edec079c90012cf8d05624e312d1062b8b87
commit: ca39aca8db2d78ff82356defba75d14ce78a67b9 [357/379] mm/vma: track start and end for munmap in vma_munmap_struct
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20240824/202408242348.uGvgH9tt-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 08e5a1de8227512d4774a534b91cb2353cef6284)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240824/202408242348.uGvgH9tt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408242348.uGvgH9tt-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/filemap.c:15:
   In file included from include/linux/dax.h:6:
   In file included from include/linux/mm.h:2198:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/filemap.c:52:
   In file included from mm/internal.h:13:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   In file included from mm/filemap.c:52:
   In file included from mm/internal.h:22:
>> mm/vma.h:114:19: error: use of undeclared identifier 'USER_PGTABLES_CEILING'
     114 |         vms->unmap_end = USER_PGTABLES_CEILING;
         |                          ^
   3 warnings and 1 error generated.
--
   In file included from mm/vmscan.c:15:
   In file included from include/linux/mm.h:2198:
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
   In file included from mm/vmscan.c:67:
   In file included from mm/internal.h:22:
>> mm/vma.h:114:19: error: use of undeclared identifier 'USER_PGTABLES_CEILING'
     114 |         vms->unmap_end = USER_PGTABLES_CEILING;
         |                          ^
   mm/vmscan.c:401:51: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     401 |                         size += zone_page_state(zone, NR_ZONE_LRU_BASE + lru);
         |                                                       ~~~~~~~~~~~~~~~~ ^ ~~~
   mm/vmscan.c:1730:4: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    1730 |                         __count_zid_vm_events(PGSCAN_SKIP, zid, nr_skipped[zid]);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:139:34: note: expanded from macro '__count_zid_vm_events'
     139 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   mm/vmscan.c:2235:51: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
    2235 |         inactive = lruvec_page_state(lruvec, NR_LRU_BASE + inactive_lru);
         |                                              ~~~~~~~~~~~ ^ ~~~~~~~~~~~~
   mm/vmscan.c:2236:49: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
    2236 |         active = lruvec_page_state(lruvec, NR_LRU_BASE + active_lru);
         |                                            ~~~~~~~~~~~ ^ ~~~~~~~~~~
   mm/vmscan.c:6251:3: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    6251 |                 __count_zid_vm_events(ALLOCSTALL, sc->reclaim_idx, 1);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:139:34: note: expanded from macro '__count_zid_vm_events'
     139 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   8 warnings and 1 error generated.
--
   In file included from mm/page_alloc.c:19:
   In file included from include/linux/mm.h:2198:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/page_alloc.c:44:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   In file included from mm/page_alloc.c:59:
   In file included from mm/internal.h:22:
>> mm/vma.h:114:19: error: use of undeclared identifier 'USER_PGTABLES_CEILING'
     114 |         vms->unmap_end = USER_PGTABLES_CEILING;
         |                          ^
   mm/page_alloc.c:2892:2: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    2892 |         __count_zid_vm_events(PGALLOC, page_zonenum(page), 1 << order);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:139:34: note: expanded from macro '__count_zid_vm_events'
     139 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   mm/page_alloc.c:3009:3: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    3009 |                 __count_zid_vm_events(PGALLOC, page_zonenum(page), 1 << order);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:139:34: note: expanded from macro '__count_zid_vm_events'
     139 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   mm/page_alloc.c:4651:2: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    4651 |         __count_zid_vm_events(PGALLOC, zone_idx(zone), nr_account);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:139:34: note: expanded from macro '__count_zid_vm_events'
     139 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   6 warnings and 1 error generated.


vim +/USER_PGTABLES_CEILING +114 mm/vma.h

    67	
    68	/* Required for do_brk_flags(). */
    69	void init_vma_prep(struct vma_prepare *vp,
    70			   struct vm_area_struct *vma);
    71	
    72	/* Required for do_brk_flags(). */
    73	void vma_complete(struct vma_prepare *vp,
    74			  struct vma_iterator *vmi, struct mm_struct *mm);
    75	
    76	int vma_expand(struct vma_iterator *vmi, struct vm_area_struct *vma,
    77		       unsigned long start, unsigned long end, pgoff_t pgoff,
    78		       struct vm_area_struct *next);
    79	
    80	int vma_shrink(struct vma_iterator *vmi, struct vm_area_struct *vma,
    81		       unsigned long start, unsigned long end, pgoff_t pgoff);
    82	
    83	/*
    84	 * init_vma_munmap() - Initializer wrapper for vma_munmap_struct
    85	 * @vms: The vma munmap struct
    86	 * @vmi: The vma iterator
    87	 * @vma: The first vm_area_struct to munmap
    88	 * @start: The aligned start address to munmap
    89	 * @end: The aligned end address to munmap
    90	 * @uf: The userfaultfd list_head
    91	 * @unlock: Unlock after the operation.  Only unlocked on success
    92	 */
    93	static inline void init_vma_munmap(struct vma_munmap_struct *vms,
    94			struct vma_iterator *vmi, struct vm_area_struct *vma,
    95			unsigned long start, unsigned long end, struct list_head *uf,
    96			bool unlock)
    97	{
    98		vms->vmi = vmi;
    99		vms->vma = vma;
   100		if (vma) {
   101			vms->mm = vma->vm_mm;
   102			vms->start = start;
   103			vms->end = end;
   104		} else {
   105			vms->mm = NULL;
   106			vms->start = vms->end = 0;
   107		}
   108		vms->unlock = unlock;
   109		vms->uf = uf;
   110		vms->vma_count = 0;
   111		vms->nr_pages = vms->locked_vm = vms->nr_accounted = 0;
   112		vms->exec_vm = vms->stack_vm = vms->data_vm = 0;
   113		vms->unmap_start = FIRST_USER_ADDRESS;
 > 114		vms->unmap_end = USER_PGTABLES_CEILING;
   115	}
   116	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
