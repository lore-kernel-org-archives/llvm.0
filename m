Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F8A38D3E0;
	Tue, 14 Jul 2026 12:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784030599; cv=none; b=PLnZSDSyrKj7ePBarQlYPi4Nm0Vt+hPujPzLJ0hxBKjNpVIRGpYexy734+cpfqpZee2BDzmiP73iIgDdVsU0RjkqOB1pLS7sQJnfVUHWm3QMr3EjW642hh1Usk66/AXWZn51puca5FYlAASvfS9CjkgvS5fucoJUcFLtscWS3A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784030599; c=relaxed/simple;
	bh=yPXzGXrlMBlFsvgWTxIdJ2RO/Qu0nGNJycckS51pV8A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nCymMs5jjtlKq0s85PN0R6FY+gKfzLtmS79mH//P0eixe2DhjztZvOe394CfXYp6aZyhLHHMKhz3xzN2sfiSQMGl9bI9kEP7OA/VgIfGkLN7ZOWFinJr4rDW3ZWi9U9+hX48CA95GSOLEnPUSfpk9+bm29bKtEbeQJrnRoQav2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DhKTT1ZN; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DhKTT1ZN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784030595; x=1815566595;
  h=date:from:to:cc:subject:message-id;
  bh=yPXzGXrlMBlFsvgWTxIdJ2RO/Qu0nGNJycckS51pV8A=;
  b=DhKTT1ZNDowxO4XIKmbTeaxQqL4IrSay8+CjILBRfunp2zjegS7Gqcwd
   nAjxmCFvbqugVPlQG1Q3xLKVejJIMWk4vV8+a6n/dwBcbgGPKkL5vikeC
   lNzhk05uDYLaHzUUhGck8wfhfBZoWVU3VyckOm9hbI+GOQzH1tAsCSVJ+
   PTsha7MKH1jf1fWNpvDwD/nGNEGMBFYMidzHpR783xdm4af6rjKxRSYMl
   JTLgDm2gjF1hDjAYxePHQmLyEeSrJRDrqksSL8uUWuzLmqGkXTuyuNZQw
   a1lh4ANaNRwenWJDwYZZem1vb3sJiv2T2/9Ej/ynWx9ilyJvsHwa7PH+N
   Q==;
X-CSE-ConnectionGUID: gw8FBwKQSYmHVteJ+UQEXQ==
X-CSE-MsgGUID: teVxfOxuQKGbqzNBera0ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="110197024"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="110197024"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 05:03:14 -0700
X-CSE-ConnectionGUID: cRIzMZcrSOScpeK6Cuorxw==
X-CSE-MsgGUID: Uz61meS/TKKs+xvCMAI1Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="254090929"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 14 Jul 2026 05:03:12 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wjbqv-000000003z3-3qTu;
	Tue, 14 Jul 2026 12:03:09 +0000
Date: Tue, 14 Jul 2026 14:02:45 +0200
From: kernel test robot <lkp@intel.com>
To: Shivank Garg <shivankg@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: mm/rmap.c:2522:7: error: call to undeclared function
 'huge_pte_dirty'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202607141439.zBAJhYoU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Shivank-Garg/mm-rmap-Add-batched-version-of-folio_try_share_anon_rmap_pte/20260712-154356
head:   f8b98e18fdb1e935473b34c81c54112651ac2e3d
commit: b1567f49975671161a4df476e9068bda9c3df9ae mm/rmap: split try_to_migrate_hugetlb_one() out of try_to_migrate_one()
date:   2 days ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260714/202607141439.zBAJhYoU-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260714/202607141439.zBAJhYoU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607141439.zBAJhYoU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/rmap.c:2522:7: error: call to undeclared function 'huge_pte_dirty'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2522 |                 if (huge_pte_dirty(pteval))
         |                     ^
   1 error generated.


vim +/huge_pte_dirty +2522 mm/rmap.c

  2443	
  2444	/*
  2445	 * Replace the hugetlb page table mapping for folio with migration entries.
  2446	 *
  2447	 * @arg: enum ttu_flags will be passed to this argument.
  2448	 */
  2449	static bool try_to_migrate_hugetlb_one(struct folio *folio,
  2450			struct vm_area_struct *vma, unsigned long address, void *arg)
  2451	{
  2452		const unsigned long hsz = huge_page_size(hstate_vma(vma));
  2453		DEFINE_FOLIO_VMA_WALK(pvmw, folio, vma, address, 0);
  2454		enum ttu_flags flags = (enum ttu_flags)(long)arg;
  2455		bool anon_exclusive, writable, ret = true;
  2456		bool anon = folio_test_anon(folio);
  2457		struct mm_struct *mm = vma->vm_mm;
  2458		struct mmu_notifier_range range;
  2459		unsigned long pfn;
  2460		struct page *page;
  2461		pte_t pteval;
  2462	
  2463		range.end = vma_address_end(&pvmw);
  2464		mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, vma->vm_mm,
  2465					address, range.end);
  2466		/* If sharing is possible, start and end will be adjusted accordingly. */
  2467		adjust_range_if_pmd_sharing_possible(vma, &range.start, &range.end);
  2468		mmu_notifier_invalidate_range_start(&range);
  2469	
  2470		if (page_vma_mapped_walk(&pvmw)) {
  2471			address = pvmw.address;
  2472			pteval = huge_ptep_get(mm, address, pvmw.pte);
  2473			if (likely(pte_present(pteval)))
  2474				pfn = pte_pfn(pteval);
  2475			else
  2476				pfn = softleaf_to_pfn(softleaf_from_pte(pteval));
  2477	
  2478			page = folio_page(folio, pfn - folio_pfn(folio));
  2479			anon_exclusive = anon && PageAnonExclusive(page);
  2480	
  2481			/*
  2482			 * huge_pmd_unshare may unmap an entire PMD page. There is no
  2483			 * way of knowing exactly which PMDs may be cached for this mm,
  2484			 * so we must flush them all. start/end were already adjusted
  2485			 * above to cover this range.
  2486			 */
  2487			flush_cache_range(vma, range.start, range.end);
  2488	
  2489			/*
  2490			 * To call huge_pmd_unshare, i_mmap_rwsem must be held in write
  2491			 * mode. Caller needs to explicitly do this outside rmap
  2492			 * routines. We also must hold hugetlb vma_lock in write mode.
  2493			 * Lock order dictates acquiring vma_lock BEFORE i_mmap_rwsem.
  2494			 * We can only try lock here and fail if unsuccessful.
  2495			 */
  2496			if (!anon) {
  2497				struct mmu_gather tlb;
  2498	
  2499				VM_WARN_ON_ONCE(!(flags & TTU_RMAP_LOCKED));
  2500				if (!hugetlb_vma_trylock_write(vma)) {
  2501					ret = false;
  2502					goto walk_done;
  2503				}
  2504	
  2505				tlb_gather_mmu_vma(&tlb, vma);
  2506				if (huge_pmd_unshare(&tlb, vma, address, pvmw.pte)) {
  2507					hugetlb_vma_unlock_write(vma);
  2508					huge_pmd_unshare_flush(&tlb, vma);
  2509					tlb_finish_mmu(&tlb);
  2510					/*
  2511					 * The PMD table was unmapped,
  2512					 * consequently unmapping the folio.
  2513					 */
  2514					goto walk_done;
  2515				}
  2516				hugetlb_vma_unlock_write(vma);
  2517				tlb_finish_mmu(&tlb);
  2518			}
  2519	
  2520			/* Nuke the hugetlb page table entry */
  2521			pteval = huge_ptep_clear_flush(vma, address, pvmw.pte);
> 2522			if (huge_pte_dirty(pteval))
  2523				folio_mark_dirty(folio);
  2524			writable = pte_write(pteval);
  2525	
  2526			VM_WARN_ON_FOLIO(writable && anon && !anon_exclusive, folio);
  2527	
  2528			if (PageHWPoison(page)) {
  2529				pteval = swp_entry_to_pte(make_hwpoison_entry(page));
  2530				hugetlb_count_sub(folio_nr_pages(folio), mm);
  2531				set_huge_pte_at(mm, address, pvmw.pte, pteval, hsz);
  2532			} else if (likely(pte_present(pteval)) && pte_unused(pteval) &&
  2533				   !userfaultfd_armed(vma)) {
  2534				/*
  2535				 * The guest indicated that the page content is of no
  2536				 * interest anymore. Simply discard the pte, vmscan
  2537				 * will take care of the rest.
  2538				 */
  2539				dec_mm_counter(mm, mm_counter(folio));
  2540			} else {
  2541				pte_t swp_pte;
  2542	
  2543				/*
  2544				 * arch_unmap_one() is expected to be a NOP on
  2545				 * architectures where we could have PFN swap PTEs,
  2546				 * so we'll not check/care.
  2547				 */
  2548				if (arch_unmap_one(mm, vma, address, pteval) < 0) {
  2549					set_huge_pte_at(mm, address, pvmw.pte,
  2550							pteval, hsz);
  2551					ret = false;
  2552					goto walk_done;
  2553				}
  2554	
  2555				/* See folio_try_share_anon_rmap_pte(): clear PTE first. */
  2556				if (anon_exclusive &&
  2557				    hugetlb_try_share_anon_rmap(folio)) {
  2558					set_huge_pte_at(mm, address, pvmw.pte,
  2559							pteval, hsz);
  2560					ret = false;
  2561					goto walk_done;
  2562				}
  2563	
  2564				/*
  2565				 * Store the pfn of the page in a special migration
  2566				 * pte. do_swap_page() will wait until the migration
  2567				 * pte is removed and then restart fault handling.
  2568				 */
  2569				swp_pte = make_migration_swp_pte(page, pteval,
  2570								 writable, anon_exclusive);
  2571				set_huge_pte_at(mm, address, pvmw.pte, swp_pte, hsz);
  2572				trace_set_migration_pte(address, pte_val(swp_pte),
  2573							folio_order(folio));
  2574			}
  2575	
  2576			hugetlb_remove_rmap(folio);
  2577			if (vma->vm_flags & VM_LOCKED)
  2578				mlock_drain_local();
  2579			folio_put(folio);
  2580	walk_done:
  2581			page_vma_mapped_walk_done(&pvmw);
  2582		}
  2583	
  2584		mmu_notifier_invalidate_range_end(&range);
  2585	
  2586		return ret;
  2587	}
  2588	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
