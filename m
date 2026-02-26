Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5DC3E9587;
	Thu, 26 Feb 2026 15:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772118679; cv=none; b=AF5chmv/rx9aAhqphoAPaZMcRkCXt0BWZp+XvRnE90+ndG0bE0NzPmB2NjcVBSfy287j6HLZt68tvBSqyGEuBq6/9WS3LHnLGPX7GEzMOiXaXtkKqmjusa6mKBY7QmWorJyWeprRPLlhoNyOQmhTKXHNUnp2JkXXS7tjvP0dMYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772118679; c=relaxed/simple;
	bh=Ck54SdmWLU81QLsPhIJUyneNmd/sUc+wBFT3c06mU68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z6RCVaC6tGM18nRKPeVtJ/eL15CQ9+lmVghTuO7rBwuT+CEyw4Wi5LjtWViAIgIxl6ZSBzaRS8vLzc+v99w4Xq//yxSbSjED8nkBLcjMEcDc9v+9CeZZpL/jYf1JZ4NCSA7otAs5vwUC5uSokmzh26hMXH4aI4Rws4WbVzx+gMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lEWNjDGl; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lEWNjDGl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772118676; x=1803654676;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ck54SdmWLU81QLsPhIJUyneNmd/sUc+wBFT3c06mU68=;
  b=lEWNjDGl7qX8TsxJqAHizEDH02QhtEEdeyRQYA6my7QWrkwLanZC5vpa
   xrCFGH+a7769efEIsdRK7jBIfW73l2/h6Rxa5ldNnseZ6/gZ2E9PVX49J
   qqPrxz3ndDPT+fJa/7f9ktSP4aT3V+kCDLcdD3Olov+h767qBdjq5LNHj
   /Rn+dh+4WGuZd906xplkVINfFGcAJFUbsgfYbhlrZK8EhAgXpdjyYbv/e
   uZYT6KZevy8bvJMsaMbzKpKIvfsG3vbhmJFGv57RQyGTJ03rs02F26E01
   UZVw49p53j40I7gN7Petmf3UBpdDwM8qxKu9ApE4XwY9m4TkWt/K0dD2j
   g==;
X-CSE-ConnectionGUID: /tfR7rURSUa/VPHa3PuCAg==
X-CSE-MsgGUID: mSUAKk0QSHiAjtlGp2L2Ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="76791486"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="76791486"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 07:11:16 -0800
X-CSE-ConnectionGUID: FF2adU37Qt60gIXC5L5feg==
X-CSE-MsgGUID: NDan7y29QXinZtnYM37Zsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="221213164"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 26 Feb 2026 07:11:12 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvd0g-000000009Xr-1dSn;
	Thu, 26 Feb 2026 15:10:45 +0000
Date: Thu, 26 Feb 2026 23:10:10 +0800
From: kernel test robot <lkp@intel.com>
To: Usama Arif <usama.arif@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v2 16/21] mm: thp: add THP_SPLIT_PMD_FAILED counter
Message-ID: <202602262304.dAJZ9uRD-lkp@intel.com>
References: <20260226113233.3987674-17-usama.arif@linux.dev>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226113233.3987674-17-usama.arif@linux.dev>

Hi Usama,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Usama-Arif/mm-thp-make-split_huge_pmd-functions-return-int-for-error-propagation/20260226-193910
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260226113233.3987674-17-usama.arif%40linux.dev
patch subject: [RFC v2 16/21] mm: thp: add THP_SPLIT_PMD_FAILED counter
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260226/202602262304.dAJZ9uRD-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260226/202602262304.dAJZ9uRD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602262304.dAJZ9uRD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/rmap.c:2073:21: error: use of undeclared identifier 'THP_SPLIT_PMD_FAILED'
    2073 |                                         count_vm_event(THP_SPLIT_PMD_FAILED);
         |                                                        ^
   mm/rmap.c:2476:21: error: use of undeclared identifier 'THP_SPLIT_PMD_FAILED'
    2476 |                                         count_vm_event(THP_SPLIT_PMD_FAILED);
         |                                                        ^
   2 errors generated.


vim +/THP_SPLIT_PMD_FAILED +2073 mm/rmap.c

  1961	
  1962	/*
  1963	 * @arg: enum ttu_flags will be passed to this argument
  1964	 */
  1965	static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
  1966			     unsigned long address, void *arg)
  1967	{
  1968		struct mm_struct *mm = vma->vm_mm;
  1969		DEFINE_FOLIO_VMA_WALK(pvmw, folio, vma, address, 0);
  1970		bool anon_exclusive, ret = true;
  1971		pte_t pteval;
  1972		struct page *subpage;
  1973		struct mmu_notifier_range range;
  1974		enum ttu_flags flags = (enum ttu_flags)(long)arg;
  1975		unsigned long nr_pages = 1, end_addr;
  1976		unsigned long pfn;
  1977		unsigned long hsz = 0;
  1978		int ptes = 0;
  1979		pgtable_t prealloc_pte = NULL;
  1980	
  1981		/*
  1982		 * When racing against e.g. zap_pte_range() on another cpu,
  1983		 * in between its ptep_get_and_clear_full() and folio_remove_rmap_*(),
  1984		 * try_to_unmap() may return before page_mapped() has become false,
  1985		 * if page table locking is skipped: use TTU_SYNC to wait for that.
  1986		 */
  1987		if (flags & TTU_SYNC)
  1988			pvmw.flags = PVMW_SYNC;
  1989	
  1990		/*
  1991		 * For THP, we have to assume the worse case ie pmd for invalidation.
  1992		 * For hugetlb, it could be much worse if we need to do pud
  1993		 * invalidation in the case of pmd sharing.
  1994		 *
  1995		 * Note that the folio can not be freed in this function as call of
  1996		 * try_to_unmap() must hold a reference on the folio.
  1997		 */
  1998		range.end = vma_address_end(&pvmw);
  1999		mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, vma->vm_mm,
  2000					address, range.end);
  2001		if (folio_test_hugetlb(folio)) {
  2002			/*
  2003			 * If sharing is possible, start and end will be adjusted
  2004			 * accordingly.
  2005			 */
  2006			adjust_range_if_pmd_sharing_possible(vma, &range.start,
  2007							     &range.end);
  2008	
  2009			/* We need the huge page size for set_huge_pte_at() */
  2010			hsz = huge_page_size(hstate_vma(vma));
  2011		}
  2012		mmu_notifier_invalidate_range_start(&range);
  2013	
  2014		if ((flags & TTU_SPLIT_HUGE_PMD) && vma_is_anonymous(vma) &&
  2015		    !arch_needs_pgtable_deposit())
  2016			prealloc_pte = pte_alloc_one(mm);
  2017	
  2018		while (page_vma_mapped_walk(&pvmw)) {
  2019			/*
  2020			 * If the folio is in an mlock()d vma, we must not swap it out.
  2021			 */
  2022			if (!(flags & TTU_IGNORE_MLOCK) &&
  2023			    (vma->vm_flags & VM_LOCKED)) {
  2024				ptes++;
  2025	
  2026				/*
  2027				 * Set 'ret' to indicate the page cannot be unmapped.
  2028				 *
  2029				 * Do not jump to walk_abort immediately as additional
  2030				 * iteration might be required to detect fully mapped
  2031				 * folio an mlock it.
  2032				 */
  2033				ret = false;
  2034	
  2035				/* Only mlock fully mapped pages */
  2036				if (pvmw.pte && ptes != pvmw.nr_pages)
  2037					continue;
  2038	
  2039				/*
  2040				 * All PTEs must be protected by page table lock in
  2041				 * order to mlock the page.
  2042				 *
  2043				 * If page table boundary has been cross, current ptl
  2044				 * only protect part of ptes.
  2045				 */
  2046				if (pvmw.flags & PVMW_PGTABLE_CROSSED)
  2047					goto walk_done;
  2048	
  2049				/* Restore the mlock which got missed */
  2050				mlock_vma_folio(folio, vma);
  2051				goto walk_done;
  2052			}
  2053	
  2054			if (!pvmw.pte) {
  2055				if (folio_test_lazyfree(folio)) {
  2056					if (unmap_huge_pmd_locked(vma, pvmw.address, pvmw.pmd, folio))
  2057						goto walk_done;
  2058					/*
  2059					 * unmap_huge_pmd_locked has either already marked
  2060					 * the folio as swap-backed or decided to retain it
  2061					 * due to GUP or speculative references.
  2062					 */
  2063					goto walk_abort;
  2064				}
  2065	
  2066				if (flags & TTU_SPLIT_HUGE_PMD) {
  2067					pgtable_t pgtable = prealloc_pte;
  2068	
  2069					prealloc_pte = NULL;
  2070	
  2071					if (!arch_needs_pgtable_deposit() && !pgtable &&
  2072					    vma_is_anonymous(vma)) {
> 2073						count_vm_event(THP_SPLIT_PMD_FAILED);
  2074						page_vma_mapped_walk_done(&pvmw);
  2075						ret = false;
  2076						break;
  2077					}
  2078					/*
  2079					 * We temporarily have to drop the PTL and
  2080					 * restart so we can process the PTE-mapped THP.
  2081					 */
  2082					split_huge_pmd_locked(vma, pvmw.address,
  2083							      pvmw.pmd, false, pgtable);
  2084					flags &= ~TTU_SPLIT_HUGE_PMD;
  2085					page_vma_mapped_walk_restart(&pvmw);
  2086					continue;
  2087				}
  2088			}
  2089	
  2090			/* Unexpected PMD-mapped THP? */
  2091			VM_BUG_ON_FOLIO(!pvmw.pte, folio);
  2092	
  2093			/*
  2094			 * Handle PFN swap PTEs, such as device-exclusive ones, that
  2095			 * actually map pages.
  2096			 */
  2097			pteval = ptep_get(pvmw.pte);
  2098			if (likely(pte_present(pteval))) {
  2099				pfn = pte_pfn(pteval);
  2100			} else {
  2101				const softleaf_t entry = softleaf_from_pte(pteval);
  2102	
  2103				pfn = softleaf_to_pfn(entry);
  2104				VM_WARN_ON_FOLIO(folio_test_hugetlb(folio), folio);
  2105			}
  2106	
  2107			subpage = folio_page(folio, pfn - folio_pfn(folio));
  2108			address = pvmw.address;
  2109			anon_exclusive = folio_test_anon(folio) &&
  2110					 PageAnonExclusive(subpage);
  2111	
  2112			if (folio_test_hugetlb(folio)) {
  2113				bool anon = folio_test_anon(folio);
  2114	
  2115				/*
  2116				 * The try_to_unmap() is only passed a hugetlb page
  2117				 * in the case where the hugetlb page is poisoned.
  2118				 */
  2119				VM_BUG_ON_PAGE(!PageHWPoison(subpage), subpage);
  2120				/*
  2121				 * huge_pmd_unshare may unmap an entire PMD page.
  2122				 * There is no way of knowing exactly which PMDs may
  2123				 * be cached for this mm, so we must flush them all.
  2124				 * start/end were already adjusted above to cover this
  2125				 * range.
  2126				 */
  2127				flush_cache_range(vma, range.start, range.end);
  2128	
  2129				/*
  2130				 * To call huge_pmd_unshare, i_mmap_rwsem must be
  2131				 * held in write mode.  Caller needs to explicitly
  2132				 * do this outside rmap routines.
  2133				 *
  2134				 * We also must hold hugetlb vma_lock in write mode.
  2135				 * Lock order dictates acquiring vma_lock BEFORE
  2136				 * i_mmap_rwsem.  We can only try lock here and fail
  2137				 * if unsuccessful.
  2138				 */
  2139				if (!anon) {
  2140					struct mmu_gather tlb;
  2141	
  2142					VM_BUG_ON(!(flags & TTU_RMAP_LOCKED));
  2143					if (!hugetlb_vma_trylock_write(vma))
  2144						goto walk_abort;
  2145	
  2146					tlb_gather_mmu_vma(&tlb, vma);
  2147					if (huge_pmd_unshare(&tlb, vma, address, pvmw.pte)) {
  2148						hugetlb_vma_unlock_write(vma);
  2149						huge_pmd_unshare_flush(&tlb, vma);
  2150						tlb_finish_mmu(&tlb);
  2151						/*
  2152						 * The PMD table was unmapped,
  2153						 * consequently unmapping the folio.
  2154						 */
  2155						goto walk_done;
  2156					}
  2157					hugetlb_vma_unlock_write(vma);
  2158					tlb_finish_mmu(&tlb);
  2159				}
  2160				pteval = huge_ptep_clear_flush(vma, address, pvmw.pte);
  2161				if (pte_dirty(pteval))
  2162					folio_mark_dirty(folio);
  2163			} else if (likely(pte_present(pteval))) {
  2164				nr_pages = folio_unmap_pte_batch(folio, &pvmw, flags, pteval);
  2165				end_addr = address + nr_pages * PAGE_SIZE;
  2166				flush_cache_range(vma, address, end_addr);
  2167	
  2168				/* Nuke the page table entry. */
  2169				pteval = get_and_clear_ptes(mm, address, pvmw.pte, nr_pages);
  2170				/*
  2171				 * We clear the PTE but do not flush so potentially
  2172				 * a remote CPU could still be writing to the folio.
  2173				 * If the entry was previously clean then the
  2174				 * architecture must guarantee that a clear->dirty
  2175				 * transition on a cached TLB entry is written through
  2176				 * and traps if the PTE is unmapped.
  2177				 */
  2178				if (should_defer_flush(mm, flags))
  2179					set_tlb_ubc_flush_pending(mm, pteval, address, end_addr);
  2180				else
  2181					flush_tlb_range(vma, address, end_addr);
  2182				if (pte_dirty(pteval))
  2183					folio_mark_dirty(folio);
  2184			} else {
  2185				pte_clear(mm, address, pvmw.pte);
  2186			}
  2187	
  2188			/*
  2189			 * Now the pte is cleared. If this pte was uffd-wp armed,
  2190			 * we may want to replace a none pte with a marker pte if
  2191			 * it's file-backed, so we don't lose the tracking info.
  2192			 */
  2193			pte_install_uffd_wp_if_needed(vma, address, pvmw.pte, pteval);
  2194	
  2195			/* Update high watermark before we lower rss */
  2196			update_hiwater_rss(mm);
  2197	
  2198			if (PageHWPoison(subpage) && (flags & TTU_HWPOISON)) {
  2199				pteval = swp_entry_to_pte(make_hwpoison_entry(subpage));
  2200				if (folio_test_hugetlb(folio)) {
  2201					hugetlb_count_sub(folio_nr_pages(folio), mm);
  2202					set_huge_pte_at(mm, address, pvmw.pte, pteval,
  2203							hsz);
  2204				} else {
  2205					dec_mm_counter(mm, mm_counter(folio));
  2206					set_pte_at(mm, address, pvmw.pte, pteval);
  2207				}
  2208			} else if (likely(pte_present(pteval)) && pte_unused(pteval) &&
  2209				   !userfaultfd_armed(vma)) {
  2210				/*
  2211				 * The guest indicated that the page content is of no
  2212				 * interest anymore. Simply discard the pte, vmscan
  2213				 * will take care of the rest.
  2214				 * A future reference will then fault in a new zero
  2215				 * page. When userfaultfd is active, we must not drop
  2216				 * this page though, as its main user (postcopy
  2217				 * migration) will not expect userfaults on already
  2218				 * copied pages.
  2219				 */
  2220				dec_mm_counter(mm, mm_counter(folio));
  2221			} else if (folio_test_anon(folio)) {
  2222				swp_entry_t entry = page_swap_entry(subpage);
  2223				pte_t swp_pte;
  2224				/*
  2225				 * Store the swap location in the pte.
  2226				 * See handle_pte_fault() ...
  2227				 */
  2228				if (unlikely(folio_test_swapbacked(folio) !=
  2229						folio_test_swapcache(folio))) {
  2230					WARN_ON_ONCE(1);
  2231					goto walk_abort;
  2232				}
  2233	
  2234				/* MADV_FREE page check */
  2235				if (!folio_test_swapbacked(folio)) {
  2236					int ref_count, map_count;
  2237	
  2238					/*
  2239					 * Synchronize with gup_pte_range():
  2240					 * - clear PTE; barrier; read refcount
  2241					 * - inc refcount; barrier; read PTE
  2242					 */
  2243					smp_mb();
  2244	
  2245					ref_count = folio_ref_count(folio);
  2246					map_count = folio_mapcount(folio);
  2247	
  2248					/*
  2249					 * Order reads for page refcount and dirty flag
  2250					 * (see comments in __remove_mapping()).
  2251					 */
  2252					smp_rmb();
  2253	
  2254					if (folio_test_dirty(folio) && !(vma->vm_flags & VM_DROPPABLE)) {
  2255						/*
  2256						 * redirtied either using the page table or a previously
  2257						 * obtained GUP reference.
  2258						 */
  2259						set_ptes(mm, address, pvmw.pte, pteval, nr_pages);
  2260						folio_set_swapbacked(folio);
  2261						goto walk_abort;
  2262					} else if (ref_count != 1 + map_count) {
  2263						/*
  2264						 * Additional reference. Could be a GUP reference or any
  2265						 * speculative reference. GUP users must mark the folio
  2266						 * dirty if there was a modification. This folio cannot be
  2267						 * reclaimed right now either way, so act just like nothing
  2268						 * happened.
  2269						 * We'll come back here later and detect if the folio was
  2270						 * dirtied when the additional reference is gone.
  2271						 */
  2272						set_ptes(mm, address, pvmw.pte, pteval, nr_pages);
  2273						goto walk_abort;
  2274					}
  2275					add_mm_counter(mm, MM_ANONPAGES, -nr_pages);
  2276					goto discard;
  2277				}
  2278	
  2279				if (folio_dup_swap(folio, subpage) < 0) {
  2280					set_pte_at(mm, address, pvmw.pte, pteval);
  2281					goto walk_abort;
  2282				}
  2283	
  2284				/*
  2285				 * arch_unmap_one() is expected to be a NOP on
  2286				 * architectures where we could have PFN swap PTEs,
  2287				 * so we'll not check/care.
  2288				 */
  2289				if (arch_unmap_one(mm, vma, address, pteval) < 0) {
  2290					folio_put_swap(folio, subpage);
  2291					set_pte_at(mm, address, pvmw.pte, pteval);
  2292					goto walk_abort;
  2293				}
  2294	
  2295				/* See folio_try_share_anon_rmap(): clear PTE first. */
  2296				if (anon_exclusive &&
  2297				    folio_try_share_anon_rmap_pte(folio, subpage)) {
  2298					folio_put_swap(folio, subpage);
  2299					set_pte_at(mm, address, pvmw.pte, pteval);
  2300					goto walk_abort;
  2301				}
  2302				if (list_empty(&mm->mmlist)) {
  2303					spin_lock(&mmlist_lock);
  2304					if (list_empty(&mm->mmlist))
  2305						list_add(&mm->mmlist, &init_mm.mmlist);
  2306					spin_unlock(&mmlist_lock);
  2307				}
  2308				dec_mm_counter(mm, MM_ANONPAGES);
  2309				inc_mm_counter(mm, MM_SWAPENTS);
  2310				swp_pte = swp_entry_to_pte(entry);
  2311				if (anon_exclusive)
  2312					swp_pte = pte_swp_mkexclusive(swp_pte);
  2313				if (likely(pte_present(pteval))) {
  2314					if (pte_soft_dirty(pteval))
  2315						swp_pte = pte_swp_mksoft_dirty(swp_pte);
  2316					if (pte_uffd_wp(pteval))
  2317						swp_pte = pte_swp_mkuffd_wp(swp_pte);
  2318				} else {
  2319					if (pte_swp_soft_dirty(pteval))
  2320						swp_pte = pte_swp_mksoft_dirty(swp_pte);
  2321					if (pte_swp_uffd_wp(pteval))
  2322						swp_pte = pte_swp_mkuffd_wp(swp_pte);
  2323				}
  2324				set_pte_at(mm, address, pvmw.pte, swp_pte);
  2325			} else {
  2326				/*
  2327				 * This is a locked file-backed folio,
  2328				 * so it cannot be removed from the page
  2329				 * cache and replaced by a new folio before
  2330				 * mmu_notifier_invalidate_range_end, so no
  2331				 * concurrent thread might update its page table
  2332				 * to point at a new folio while a device is
  2333				 * still using this folio.
  2334				 *
  2335				 * See Documentation/mm/mmu_notifier.rst
  2336				 */
  2337				add_mm_counter(mm, mm_counter_file(folio), -nr_pages);
  2338			}
  2339	discard:
  2340			if (unlikely(folio_test_hugetlb(folio))) {
  2341				hugetlb_remove_rmap(folio);
  2342			} else {
  2343				folio_remove_rmap_ptes(folio, subpage, nr_pages, vma);
  2344			}
  2345			if (vma->vm_flags & VM_LOCKED)
  2346				mlock_drain_local();
  2347			folio_put_refs(folio, nr_pages);
  2348	
  2349			/*
  2350			 * If we are sure that we batched the entire folio and cleared
  2351			 * all PTEs, we can just optimize and stop right here.
  2352			 */
  2353			if (nr_pages == folio_nr_pages(folio))
  2354				goto walk_done;
  2355			continue;
  2356	walk_abort:
  2357			ret = false;
  2358	walk_done:
  2359			page_vma_mapped_walk_done(&pvmw);
  2360			break;
  2361		}
  2362	
  2363		if (prealloc_pte)
  2364			pte_free(mm, prealloc_pte);
  2365	
  2366		mmu_notifier_invalidate_range_end(&range);
  2367	
  2368		return ret;
  2369	}
  2370	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
