Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943F81F63E3;
	Fri, 17 Jan 2025 04:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737088792; cv=none; b=YyA6eEVrTd/p3yj8tyQ4XPOMPaNfQnS0Oj77qypPgymq+jO4dN/xQBVrz0tC9/H6Y2X7qKUgzaC3UgikA++zTDMKRog1uG4ePIv3gIqg6Kad6r+h5qYMqCw+pK4CzjJ627MhDTc9Z0ot/YKnKlP8xSljeYuhHrg03v/ixPt3XM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737088792; c=relaxed/simple;
	bh=Yq04w1KpQmtTEiwJFNnSESv/dxmj9ez4/jtlgPi5b2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A0NYSqtwRXDiiqeUqUEy39TL5/8tXFY0aZwOUxCWC1U0l92NcChRErjcpL7aXeEMv1dOUVaksZsrrJ3LMmMEMF7WbkCNpRhY8TwZ/1LP2XQeBvVJLybLHBR9UGclPd3O8MM7TTDPGZjY2jzF6HfFFQ0duuSOUvBx5Gq2mbxcBc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZJB0jYU/; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZJB0jYU/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737088791; x=1768624791;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Yq04w1KpQmtTEiwJFNnSESv/dxmj9ez4/jtlgPi5b2k=;
  b=ZJB0jYU/l6Pmeu7zLiGJ4FQo2Cf5le/f0z0WFkWbq+wgCgUkUaIrdRWf
   H9xCnVm3TUtzB0v9telxRx3zjVLxOB+VG6ZOCB2v1GJ0hY95M81xNqVRp
   B6fCMgys0P/iCVawMvAEHdJUUt+M+pKkELNiS5t1G7qiSd8ve0uV+eRQA
   4+DLC/6PqK6i98hOl8rYuGH1+A+J2MgzL0ueR7uR7U6Aua/uOAYOJ3eol
   o5XKHMYeJb96PO9qcny/qbnuHB4vfWmx4A/acKrLO95Vms9vDhfOp67IU
   kGmPrM93dMKgnKKydSPNlx3X/w4Z/GzUFmxA3u/jhXZa/CpiFF+6hYD17
   Q==;
X-CSE-ConnectionGUID: CthNgtf+Rz+xHEAZA7huRQ==
X-CSE-MsgGUID: 4BxEsyCTTpmCpGHSIdhIGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="37389789"
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; 
   d="scan'208";a="37389789"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 20:39:49 -0800
X-CSE-ConnectionGUID: ssDAASl2QUiBuioM/by4mg==
X-CSE-MsgGUID: /PI7NoGcTaSGycMArZW86g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105542357"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 16 Jan 2025 20:39:47 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYe91-000Skd-26;
	Fri, 17 Jan 2025 04:39:43 +0000
Date: Fri, 17 Jan 2025 12:39:35 +0800
From: kernel test robot <lkp@intel.com>
To: Wupeng Ma <mawupeng1@huawei.com>, akpm@linux-foundation.org,
	david@redhat.com, osalvador@suse.de, nao.horiguchi@gmail.com,
	linmiaohe@huawei.com, mhocko@suse.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	mawupeng1@huawei.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] mm: memory-failure: update ttu flag inside
 unmap_poisoned_folio
Message-ID: <202501171201.GNMkmauO-lkp@intel.com>
References: <20250116061657.227027-2-mawupeng1@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116061657.227027-2-mawupeng1@huawei.com>

Hi Wupeng,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Wupeng-Ma/mm-memory-failure-update-ttu-flag-inside-unmap_poisoned_folio/20250116-142614
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250116061657.227027-2-mawupeng1%40huawei.com
patch subject: [PATCH v2 1/3] mm: memory-failure: update ttu flag inside unmap_poisoned_folio
config: s390-randconfig-002-20250117 (https://download.01.org/0day-ci/archive/20250117/202501171201.GNMkmauO-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project c23f2417dc5f6dc371afb07af5627ec2a9d373a0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250117/202501171201.GNMkmauO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501171201.GNMkmauO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/mprotect.c:12:
   In file included from include/linux/pagewalk.h:5:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from mm/mprotect.c:30:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   In file included from mm/mprotect.c:41:
>> mm/internal.h:1142:1: error: expected identifier or '('
    1142 | {
         | ^
   5 warnings and 1 error generated.
--
   In file included from mm/vmscan.c:15:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from mm/vmscan.c:30:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   In file included from mm/vmscan.c:68:
>> mm/internal.h:1142:1: error: expected identifier or '('
    1142 | {
         | ^
   mm/vmscan.c:409:51: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     409 |                         size += zone_page_state(zone, NR_ZONE_LRU_BASE + lru);
         |                                                       ~~~~~~~~~~~~~~~~ ^ ~~~
   mm/vmscan.c:1770:4: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    1770 |                         __count_zid_vm_events(PGSCAN_SKIP, zid, nr_skipped[zid]);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:139:34: note: expanded from macro '__count_zid_vm_events'
     139 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   mm/vmscan.c:2276:51: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
    2276 |         inactive = lruvec_page_state(lruvec, NR_LRU_BASE + inactive_lru);
         |                                              ~~~~~~~~~~~ ^ ~~~~~~~~~~~~
   mm/vmscan.c:2277:49: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
    2277 |         active = lruvec_page_state(lruvec, NR_LRU_BASE + active_lru);
         |                                            ~~~~~~~~~~~ ^ ~~~~~~~~~~
   mm/vmscan.c:6292:3: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    6292 |                 __count_zid_vm_events(ALLOCSTALL, sc->reclaim_idx, 1);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:139:34: note: expanded from macro '__count_zid_vm_events'
     139 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   10 warnings and 1 error generated.
--
   In file included from mm/page_alloc.c:19:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from mm/page_alloc.c:44:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   In file included from mm/page_alloc.c:59:
>> mm/internal.h:1142:1: error: expected identifier or '('
    1142 | {
         | ^
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
   mm/page_alloc.c:4683:2: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    4683 |         __count_zid_vm_events(PGALLOC, zone_idx(zone), nr_account);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:139:34: note: expanded from macro '__count_zid_vm_events'
     139 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   8 warnings and 1 error generated.


vim +1142 mm/internal.h

31d3d3484f9bd2 Wu Fengguang            2009-12-16  1121  
7c116f2b0dbac4 Wu Fengguang            2009-12-16  1122  extern u32 hwpoison_filter_dev_major;
7c116f2b0dbac4 Wu Fengguang            2009-12-16  1123  extern u32 hwpoison_filter_dev_minor;
478c5ffc0b5052 Wu Fengguang            2009-12-16  1124  extern u64 hwpoison_filter_flags_mask;
478c5ffc0b5052 Wu Fengguang            2009-12-16  1125  extern u64 hwpoison_filter_flags_value;
4fd466eb46a6a9 Andi Kleen              2009-12-16  1126  extern u64 hwpoison_filter_memcg;
1bfe5febe34d2b Haicheng Li             2009-12-16  1127  extern u32 hwpoison_filter_enable;
3a78f77fd1fb82 Miaohe Lin              2024-06-12  1128  #define MAGIC_HWPOISON	0x48575053U	/* HWPS */
3a78f77fd1fb82 Miaohe Lin              2024-06-12  1129  void SetPageHWPoisonTakenOff(struct page *page);
3a78f77fd1fb82 Miaohe Lin              2024-06-12  1130  void ClearPageHWPoisonTakenOff(struct page *page);
3a78f77fd1fb82 Miaohe Lin              2024-06-12  1131  bool take_page_off_buddy(struct page *page);
3a78f77fd1fb82 Miaohe Lin              2024-06-12  1132  bool put_page_back_buddy(struct page *page);
3a78f77fd1fb82 Miaohe Lin              2024-06-12  1133  struct task_struct *task_early_kill(struct task_struct *tsk, int force_early);
68158bfa3dbd4a Matthew Wilcox (Oracle  2024-10-05  1134) void add_to_kill_ksm(struct task_struct *tsk, const struct page *p,
3a78f77fd1fb82 Miaohe Lin              2024-06-12  1135  		     struct vm_area_struct *vma, struct list_head *to_kill,
3a78f77fd1fb82 Miaohe Lin              2024-06-12  1136  		     unsigned long ksm_addr);
68158bfa3dbd4a Matthew Wilcox (Oracle  2024-10-05  1137) unsigned long page_mapped_in_vma(const struct page *page,
68158bfa3dbd4a Matthew Wilcox (Oracle  2024-10-05  1138) 		struct vm_area_struct *vma);
eb36c5873b96e8 Al Viro                 2012-05-30  1139  
16038c4fffd802 Kefeng Wang             2024-08-27  1140  #else
2b5df10a15dc74 Ma Wupeng               2025-01-16  1141  static inline int unmap_poisoned_folio(struct folio *folio, unsigned long pfn, bool must_kill);
16038c4fffd802 Kefeng Wang             2024-08-27 @1142  {
2b5df10a15dc74 Ma Wupeng               2025-01-16  1143  	return -EBUSY;
16038c4fffd802 Kefeng Wang             2024-08-27  1144  }
16038c4fffd802 Kefeng Wang             2024-08-27  1145  #endif
16038c4fffd802 Kefeng Wang             2024-08-27  1146  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
