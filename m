Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8659F1FAA;
	Fri, 12 Jul 2024 01:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720746122; cv=none; b=qi3PqQv3Co7Abm/KiQ8sUrBZVn2A3ghPW7hDj5KMKDc31TxW26FB+II3NCadVbUNdq+Q05lox1v6qMHo6k8NG9HkmKVeJoBHLaSUP0m0/fBv9J1WrLiKaYDZDoM1ylFmIGJoSJDnLt7d+YMHKOlUtRr1GtgByhHz9GxB/4J8W/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720746122; c=relaxed/simple;
	bh=vkv2J7faUJ4JeLTPv5DKXkaFbPnMufbDBouqFyQChg8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i57FLEzMTShM3DAiyoq/f8wsmoW7B5BILAdxJGHp70DB5GX8GaOnMIGHimKSO9nFjHsfSA2NiTQnEwKUD7gDw+mAjFxPO4umV6je/NrTIk0dVIRww6M7hh8akJ6N/Wp+WbU7MUHnCnhzJWI+zGuuDoI1rrDXtNruPoRXCI2P63Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NNUo8zcv; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NNUo8zcv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720746121; x=1752282121;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vkv2J7faUJ4JeLTPv5DKXkaFbPnMufbDBouqFyQChg8=;
  b=NNUo8zcvR+1pNFZ/FEIw12TaZQVYatxoyjvnEguEmOg79jJBOKar3qsQ
   VgW1gg1FvZuzFAV577gozMIpZHXwNiQzReZWVVLOrmrEsABER7XzOouI6
   H2qirFQcHMNAn7W1BaFf0oTCKfm40I5p9HwUfKa4x2+UcOvA20oZXox/F
   lbkKYZKPH2xExyqoBDQDeTTITVFutprgO5s/pHdr3XQMhbO5E3RxPbqis
   vi46ktw04/xU4ftwcewgA0FQafJpnXHV89yxB44DdVePTGZ4MTu32j1Qv
   u+X9n6v0HbSLb6uFdJrZIC4SIfQ0U6YtKNNWN/iLfWY4JX6m40cgyDsHC
   Q==;
X-CSE-ConnectionGUID: 5jXiw3vFRqijQ2gFCqBSSQ==
X-CSE-MsgGUID: QapuGuOkQZK9CjfS/e51SA==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="17879493"
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; 
   d="scan'208";a="17879493"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 18:02:00 -0700
X-CSE-ConnectionGUID: XNfXK21JSZGWuhoRC8j5dA==
X-CSE-MsgGUID: no0HYzoSRyCdp0KI5hwKZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; 
   d="scan'208";a="53583109"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Jul 2024 18:01:58 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sS4fc-000a9K-0N;
	Fri, 12 Jul 2024 01:01:56 +0000
Date: Fri, 12 Jul 2024 09:01:41 +0800
From: kernel test robot <lkp@intel.com>
To: "Jason A. Donenfeld" <zx2c4@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, zx2c4@kernel.org
Subject: [crng-random:jd/pte_dirty 2/3] mm/vmscan.c:3398:24: error: use of
 undeclared identifier 'vma'
Message-ID: <202407120843.5884Zib6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/crng/random.git jd/pte_dirty
head:   9c32583226a971efbfbaf93ab5199cc3532ba696
commit: 601bf66c49eee8c687a0efe9ecfed04dda417d4f [2/3] mm: re-add pte_dirty() with vma argument
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240712/202407120843.5884Zib6-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240712/202407120843.5884Zib6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407120843.5884Zib6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/vmscan.c:15:
   In file included from include/linux/mm.h:2263:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
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
   mm/vmscan.c:1712:4: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    1712 |                         __count_zid_vm_events(PGSCAN_SKIP, zid, nr_skipped[zid]);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:135:34: note: expanded from macro '__count_zid_vm_events'
     135 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   mm/vmscan.c:2217:51: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
    2217 |         inactive = lruvec_page_state(lruvec, NR_LRU_BASE + inactive_lru);
         |                                              ~~~~~~~~~~~ ^ ~~~~~~~~~~~~
   mm/vmscan.c:2218:49: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
    2218 |         active = lruvec_page_state(lruvec, NR_LRU_BASE + active_lru);
         |                                            ~~~~~~~~~~~ ^ ~~~~~~~~~~
>> mm/vmscan.c:3398:24: error: use of undeclared identifier 'vma'
    3398 |                 if (pte_dirty(ptent, vma) && !folio_test_dirty(folio) &&
         |                                      ^
   mm/vmscan.c:4401:4: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    4401 |                         __count_zid_vm_events(PGSCAN_SKIP, zone, skipped_zone);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:135:34: note: expanded from macro '__count_zid_vm_events'
     135 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   mm/vmscan.c:6223:3: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    6223 |                 __count_zid_vm_events(ALLOCSTALL, sc->reclaim_idx, 1);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:135:34: note: expanded from macro '__count_zid_vm_events'
     135 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   13 warnings and 1 error generated.


vim +/vma +3398 mm/vmscan.c

  3345	
  3346	static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
  3347				   struct mm_walk *args)
  3348	{
  3349		int i;
  3350		pte_t *pte;
  3351		spinlock_t *ptl;
  3352		unsigned long addr;
  3353		int total = 0;
  3354		int young = 0;
  3355		struct lru_gen_mm_walk *walk = args->private;
  3356		struct mem_cgroup *memcg = lruvec_memcg(walk->lruvec);
  3357		struct pglist_data *pgdat = lruvec_pgdat(walk->lruvec);
  3358		DEFINE_MAX_SEQ(walk->lruvec);
  3359		int old_gen, new_gen = lru_gen_from_seq(max_seq);
  3360	
  3361		pte = pte_offset_map_nolock(args->mm, pmd, start & PMD_MASK, &ptl);
  3362		if (!pte)
  3363			return false;
  3364		if (!spin_trylock(ptl)) {
  3365			pte_unmap(pte);
  3366			return false;
  3367		}
  3368	
  3369		arch_enter_lazy_mmu_mode();
  3370	restart:
  3371		for (i = pte_index(start), addr = start; addr != end; i++, addr += PAGE_SIZE) {
  3372			unsigned long pfn;
  3373			struct folio *folio;
  3374			pte_t ptent = ptep_get(pte + i);
  3375	
  3376			total++;
  3377			walk->mm_stats[MM_LEAF_TOTAL]++;
  3378	
  3379			pfn = get_pte_pfn(ptent, args->vma, addr);
  3380			if (pfn == -1)
  3381				continue;
  3382	
  3383			if (!pte_young(ptent)) {
  3384				walk->mm_stats[MM_LEAF_OLD]++;
  3385				continue;
  3386			}
  3387	
  3388			folio = get_pfn_folio(pfn, memcg, pgdat, walk->can_swap);
  3389			if (!folio)
  3390				continue;
  3391	
  3392			if (!ptep_test_and_clear_young(args->vma, addr, pte + i))
  3393				VM_WARN_ON_ONCE(true);
  3394	
  3395			young++;
  3396			walk->mm_stats[MM_LEAF_YOUNG]++;
  3397	
> 3398			if (pte_dirty(ptent, vma) && !folio_test_dirty(folio) &&
  3399			    !(folio_test_anon(folio) && folio_test_swapbacked(folio) &&
  3400			      !folio_test_swapcache(folio)))
  3401				folio_mark_dirty(folio);
  3402	
  3403			old_gen = folio_update_gen(folio, new_gen);
  3404			if (old_gen >= 0 && old_gen != new_gen)
  3405				update_batch_size(walk, folio, old_gen, new_gen);
  3406		}
  3407	
  3408		if (i < PTRS_PER_PTE && get_next_vma(PMD_MASK, PAGE_SIZE, args, &start, &end))
  3409			goto restart;
  3410	
  3411		arch_leave_lazy_mmu_mode();
  3412		pte_unmap_unlock(pte, ptl);
  3413	
  3414		return suitable_to_scan(total, young);
  3415	}
  3416	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
