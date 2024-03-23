Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EFBD53B;
	Sat, 23 Mar 2024 10:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711188599; cv=none; b=o6Bz2VYakmls0Bs+9NFvW7xlXTYDFjJ4gg2A0nkTr/d8iQ0+TF0HCNbbZNEFBTvTesL6swAClR2lBwX2FigjNgGzenT9BMTqslnX6BoZpIf5vDI7wbwbrSxTMiqeGjeY/XDnVIc/A9NXoa+BNVJ/7K/ITIHTsXYig62hlrw/9dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711188599; c=relaxed/simple;
	bh=Fm7xp7XxXqvT58SGW7ti8QBL3U9yJ6IgdAe86QVQ9Kk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vu31uZGZb6bGY2s5z4au1lkiMHy0E77BT8Xiwpk0dGVYLIO2INTigkUr6fcXixbCJy+srYuVdS4DnznOV5uSXf1ZfyqXDFsonAo/VuILrv9GxdzWqqHCBkuUEF9CveGQFCJaquYn2sYEhq0WRrRcL66HW3Kge5hztmrk90Z6uHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VjewOFrr; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VjewOFrr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711188597; x=1742724597;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fm7xp7XxXqvT58SGW7ti8QBL3U9yJ6IgdAe86QVQ9Kk=;
  b=VjewOFrrqc1/DnV3n3elrD8TBf9aDfMzHDa6Z17iov6vI12eAyhf/3iz
   NDfbmdn8zieDZJWONwVt5k3byCmYq4ZTPFkjbwh7yzmrTV13xhruhfI4P
   6gCXDYq00VlYLR032r0jgapDWfNIwPR7r2sA7uVK8EAm6QEN14+IHAl14
   I/2zDBX7NwT/9cfRw+JtkD3769ZCue1f7nFEbkp5hmT68cdtVa+OV3QKM
   jdlDXR04rK0O6ZN/fiee/jssiYmpgAo5cZIi9CSu8kkkYhgx8Cpuc5kaF
   vVMx5F3FMufxrbqMQaSLvp7j9dEbIkapKSoM7ksLYp98AtbETjvT+2AxG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="6096704"
X-IronPort-AV: E=Sophos;i="6.07,148,1708416000"; 
   d="scan'208";a="6096704"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2024 03:09:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,148,1708416000"; 
   d="scan'208";a="15216398"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 23 Mar 2024 03:09:54 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnyK0-000L3D-0e;
	Sat, 23 Mar 2024 10:09:52 +0000
Date: Sat, 23 Mar 2024 18:08:56 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [broonie-misc:arm64-gcs 48/48] mm/huge_memory.c:2607:43: warning:
 format specifies type 'unsigned long' but the argument has type 'struct
 vm_area_struct *'
Message-ID: <202403231831.dN6KExBQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git arm64-gcs
head:   64bdef3832272bcbfafd7ff13aa1113fb12c8612
commit: 64bdef3832272bcbfafd7ff13aa1113fb12c8612 [48/48] DEBUG
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240323/202403231831.dN6KExBQ-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 23de3862dce582ce91c1aa914467d982cb1a73b4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240323/202403231831.dN6KExBQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403231831.dN6KExBQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/huge_memory.c:8:
   In file included from include/linux/mm.h:2198:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from mm/huge_memory.c:19:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
>> mm/huge_memory.c:2607:43: warning: format specifies type 'unsigned long' but the argument has type 'struct vm_area_struct *' [-Wformat]
    2607 |                                 pr_crit("MAKE ONE %lx %d %d %d %d\n", vma,
         |                                                   ~~~                 ^~~
   include/linux/printk.h:488:34: note: expanded from macro 'pr_crit'
     488 |         printk(KERN_CRIT pr_fmt(fmt), ##__VA_ARGS__)
         |                                 ~~~     ^~~~~~~~~~~
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
     455 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   8 warnings generated.


vim +2607 mm/huge_memory.c

  2422	
  2423	static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
  2424			unsigned long haddr, bool freeze)
  2425	{
  2426		struct mm_struct *mm = vma->vm_mm;
  2427		struct folio *folio;
  2428		struct page *page;
  2429		pgtable_t pgtable;
  2430		pmd_t old_pmd, _pmd;
  2431		bool young, write, soft_dirty, pmd_migration = false, uffd_wp = false;
  2432		bool anon_exclusive = false, dirty = false;
  2433		unsigned long addr;
  2434		pte_t *pte;
  2435		int i;
  2436	
  2437		VM_BUG_ON(haddr & ~HPAGE_PMD_MASK);
  2438		VM_BUG_ON_VMA(vma->vm_start > haddr, vma);
  2439		VM_BUG_ON_VMA(vma->vm_end < haddr + HPAGE_PMD_SIZE, vma);
  2440		VM_BUG_ON(!is_pmd_migration_entry(*pmd) && !pmd_trans_huge(*pmd)
  2441					&& !pmd_devmap(*pmd));
  2442	
  2443		count_vm_event(THP_SPLIT_PMD);
  2444	
  2445		if (!vma_is_anonymous(vma)) {
  2446			old_pmd = pmdp_huge_clear_flush(vma, haddr, pmd);
  2447			/*
  2448			 * We are going to unmap this huge page. So
  2449			 * just go ahead and zap it
  2450			 */
  2451			if (arch_needs_pgtable_deposit())
  2452				zap_deposited_table(mm, pmd);
  2453			if (vma_is_special_huge(vma))
  2454				return;
  2455			if (unlikely(is_pmd_migration_entry(old_pmd))) {
  2456				swp_entry_t entry;
  2457	
  2458				entry = pmd_to_swp_entry(old_pmd);
  2459				page = pfn_swap_entry_to_page(entry);
  2460			} else {
  2461				page = pmd_page(old_pmd);
  2462				folio = page_folio(page);
  2463				if (!folio_test_dirty(folio) && pmd_dirty(old_pmd))
  2464					folio_mark_dirty(folio);
  2465				if (!folio_test_referenced(folio) && pmd_young(old_pmd))
  2466					folio_set_referenced(folio);
  2467				folio_remove_rmap_pmd(folio, page, vma);
  2468				folio_put(folio);
  2469			}
  2470			add_mm_counter(mm, mm_counter_file(page), -HPAGE_PMD_NR);
  2471			return;
  2472		}
  2473	
  2474		if (is_huge_zero_pmd(*pmd)) {
  2475			/*
  2476			 * FIXME: Do we want to invalidate secondary mmu by calling
  2477			 * mmu_notifier_arch_invalidate_secondary_tlbs() see comments below
  2478			 * inside __split_huge_pmd() ?
  2479			 *
  2480			 * We are going from a zero huge page write protected to zero
  2481			 * small page also write protected so it does not seems useful
  2482			 * to invalidate secondary mmu at this time.
  2483			 */
  2484			if (vma->vm_flags & VM_SHADOW_STACK)
  2485				pr_crit("SPLIT ZERO\n");
  2486			return __split_huge_zero_page_pmd(vma, haddr, pmd);
  2487		}
  2488	
  2489		/*
  2490		 * Up to this point the pmd is present and huge and userland has the
  2491		 * whole access to the hugepage during the split (which happens in
  2492		 * place). If we overwrite the pmd with the not-huge version pointing
  2493		 * to the pte here (which of course we could if all CPUs were bug
  2494		 * free), userland could trigger a small page size TLB miss on the
  2495		 * small sized TLB while the hugepage TLB entry is still established in
  2496		 * the huge TLB. Some CPU doesn't like that.
  2497		 * See http://support.amd.com/TechDocs/41322_10h_Rev_Gd.pdf, Erratum
  2498		 * 383 on page 105. Intel should be safe but is also warns that it's
  2499		 * only safe if the permission and cache attributes of the two entries
  2500		 * loaded in the two TLB is identical (which should be the case here).
  2501		 * But it is generally safer to never allow small and huge TLB entries
  2502		 * for the same virtual address to be loaded simultaneously. So instead
  2503		 * of doing "pmd_populate(); flush_pmd_tlb_range();" we first mark the
  2504		 * current pmd notpresent (atomically because here the pmd_trans_huge
  2505		 * must remain set at all times on the pmd until the split is complete
  2506		 * for this pmd), then we flush the SMP TLB and finally we write the
  2507		 * non-huge version of the pmd entry with pmd_populate.
  2508		 */
  2509		old_pmd = pmdp_invalidate(vma, haddr, pmd);
  2510	
  2511		pmd_migration = is_pmd_migration_entry(old_pmd);
  2512		if (unlikely(pmd_migration)) {
  2513			swp_entry_t entry;
  2514	
  2515			entry = pmd_to_swp_entry(old_pmd);
  2516			page = pfn_swap_entry_to_page(entry);
  2517			write = is_writable_migration_entry(entry);
  2518			if (PageAnon(page))
  2519				anon_exclusive = is_readable_exclusive_migration_entry(entry);
  2520			young = is_migration_entry_young(entry);
  2521			dirty = is_migration_entry_dirty(entry);
  2522			soft_dirty = pmd_swp_soft_dirty(old_pmd);
  2523			uffd_wp = pmd_swp_uffd_wp(old_pmd);
  2524		} else {
  2525			page = pmd_page(old_pmd);
  2526			folio = page_folio(page);
  2527			if (pmd_dirty(old_pmd)) {
  2528				dirty = true;
  2529				folio_set_dirty(folio);
  2530			}
  2531			write = pmd_write(old_pmd);
  2532			young = pmd_young(old_pmd);
  2533			soft_dirty = pmd_soft_dirty(old_pmd);
  2534			uffd_wp = pmd_uffd_wp(old_pmd);
  2535	
  2536			VM_WARN_ON_FOLIO(!folio_ref_count(folio), folio);
  2537			VM_WARN_ON_FOLIO(!folio_test_anon(folio), folio);
  2538	
  2539			/*
  2540			 * Without "freeze", we'll simply split the PMD, propagating the
  2541			 * PageAnonExclusive() flag for each PTE by setting it for
  2542			 * each subpage -- no need to (temporarily) clear.
  2543			 *
  2544			 * With "freeze" we want to replace mapped pages by
  2545			 * migration entries right away. This is only possible if we
  2546			 * managed to clear PageAnonExclusive() -- see
  2547			 * set_pmd_migration_entry().
  2548			 *
  2549			 * In case we cannot clear PageAnonExclusive(), split the PMD
  2550			 * only and let try_to_migrate_one() fail later.
  2551			 *
  2552			 * See folio_try_share_anon_rmap_pmd(): invalidate PMD first.
  2553			 */
  2554			anon_exclusive = PageAnonExclusive(page);
  2555			if (freeze && anon_exclusive &&
  2556			    folio_try_share_anon_rmap_pmd(folio, page))
  2557				freeze = false;
  2558			if (!freeze) {
  2559				rmap_t rmap_flags = RMAP_NONE;
  2560	
  2561				folio_ref_add(folio, HPAGE_PMD_NR - 1);
  2562				if (anon_exclusive)
  2563					rmap_flags |= RMAP_EXCLUSIVE;
  2564				folio_add_anon_rmap_ptes(folio, page, HPAGE_PMD_NR,
  2565							 vma, haddr, rmap_flags);
  2566			}
  2567		}
  2568	
  2569		/*
  2570		 * Withdraw the table only after we mark the pmd entry invalid.
  2571		 * This's critical for some architectures (Power).
  2572		 */
  2573		pgtable = pgtable_trans_huge_withdraw(mm, pmd);
  2574		pmd_populate(mm, &_pmd, pgtable);
  2575	
  2576		pte = pte_offset_map(&_pmd, haddr);
  2577		VM_BUG_ON(!pte);
  2578		for (i = 0, addr = haddr; i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE) {
  2579			pte_t entry;
  2580			/*
  2581			 * Note that NUMA hinting access restrictions are not
  2582			 * transferred to avoid any possibility of altering
  2583			 * permissions across VMAs.
  2584			 */
  2585			if (freeze || pmd_migration) {
  2586				swp_entry_t swp_entry;
  2587				if (write)
  2588					swp_entry = make_writable_migration_entry(
  2589								page_to_pfn(page + i));
  2590				else if (anon_exclusive)
  2591					swp_entry = make_readable_exclusive_migration_entry(
  2592								page_to_pfn(page + i));
  2593				else
  2594					swp_entry = make_readable_migration_entry(
  2595								page_to_pfn(page + i));
  2596				if (young)
  2597					swp_entry = make_migration_entry_young(swp_entry);
  2598				if (dirty)
  2599					swp_entry = make_migration_entry_dirty(swp_entry);
  2600				entry = swp_entry_to_pte(swp_entry);
  2601				if (soft_dirty)
  2602					entry = pte_swp_mksoft_dirty(entry);
  2603				if (uffd_wp)
  2604					entry = pte_swp_mkuffd_wp(entry);
  2605			} else {
  2606				if (false && vma->vm_flags & VM_SHADOW_STACK)
> 2607					pr_crit("MAKE ONE %lx %d %d %d %d\n", vma,
  2608						write, young, dirty, soft_dirty);
  2609				entry = mk_pte(page + i, READ_ONCE(vma->vm_page_prot));
  2610				if (write)
  2611					entry = pte_mkwrite(entry, vma);
  2612				if (!young)
  2613					entry = pte_mkold(entry);
  2614				/* NOTE: this may set soft-dirty too on some archs */
  2615				if (dirty)
  2616					entry = pte_mkdirty(entry);
  2617				if (soft_dirty)
  2618					entry = pte_mksoft_dirty(entry);
  2619				if (uffd_wp)
  2620					entry = pte_mkuffd_wp(entry);
  2621			}
  2622			VM_BUG_ON(!pte_none(ptep_get(pte)));
  2623			set_pte_at(mm, addr, pte, entry);
  2624			pte++;
  2625		}
  2626		pte_unmap(pte - 1);
  2627	
  2628		if (!pmd_migration)
  2629			folio_remove_rmap_pmd(folio, page, vma);
  2630		if (freeze)
  2631			put_page(page);
  2632	
  2633		smp_wmb(); /* make pte visible before pmd */
  2634		pmd_populate(mm, pmd, pgtable);
  2635	}
  2636	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
