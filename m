Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9E633120E;
	Thu, 12 Feb 2026 21:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770932419; cv=none; b=f9GBKwwP7RaBNIVEjUW3Je9Y+T5aYQo0PI5cHkWx6k4abYUCGE+6j0vfFs0qSDFG8oti5Uc18dJrwuwc8bw8zn1Aj6TrNfPvgDXDtxJt3K0TsJEvE8U8RDp/jGAKQrVg4jMrBTLaYrv+My/iyxuNo3VTICS0aXYKNS6Ehki9Zd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770932419; c=relaxed/simple;
	bh=9Bebr0rxB9kRmStJVmkIGzES7bCZTVxPlqb0tZlq93M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VOKV6mcVECQS8GahvAovWIPOoodyrc/zRqUpEF2aJnpjCGj/JpGt2bj/0Oqv6QXrntohd/6XlLN4XmvpV588LECbldgkdteblnlCO/Mr04etF8JvJeDnGJ0SvIr6o9XS171oFdqFR3stsq+J2mpkDxBrER/TqukWZ1ga8bMHdic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hDkUgUsM; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hDkUgUsM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770932418; x=1802468418;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9Bebr0rxB9kRmStJVmkIGzES7bCZTVxPlqb0tZlq93M=;
  b=hDkUgUsMnrmJ2jolIm5CFtkIftoC55qep4Fw/8p7qmp8kAEzEx+q3ulH
   feL6+8vJC/hVRvKzg1N9FMffO4SoiDMhKSBVWdBA+A4ihyXRfL/qGAvbI
   NnndkxdHt3AWSpKksgLLu24TZztt9kHNFR2IDb1xeMWLP+3DLKQt7Hdwb
   oGRdRz9UPiR8QXfWNBEP1x9LSX4jdxsBfWSCK7yvPcAIqYIxsiLjDLk3E
   HPNLLRP7+Mj3UOjQdFi9uB5X/Aa0mNykpXTsueTgEp05SrCOqNbiFjhES
   4KMmeKiQ9YzQlWRR0qIDLwFLbecsbiRNAuzyYDYPtdfgjb/lHY40ORi1M
   A==;
X-CSE-ConnectionGUID: lgVOzV3US9+LoRTmugV4QQ==
X-CSE-MsgGUID: tUvKNf2hQm+/QGy65bc6vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="75965624"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; 
   d="scan'208";a="75965624"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 13:40:15 -0800
X-CSE-ConnectionGUID: 4JQEJXBmTdukQ67CHQnXwQ==
X-CSE-MsgGUID: YAtiI7ZFQrmN4ZKdA+mMTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; 
   d="scan'208";a="216878747"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Feb 2026 13:40:13 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqePz-00000000tbI-0uyx;
	Thu, 12 Feb 2026 21:40:11 +0000
Date: Fri, 13 Feb 2026 05:40:04 +0800
From: kernel test robot <lkp@intel.com>
To: Usama Arif <usama.arif@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 2/2] mm: thp: add THP_SPLIT_PMD_PTE_ALLOC_FAILED counter
Message-ID: <202602130506.7Tm8CJkW-lkp@intel.com>
References: <20260211125507.4175026-3-usama.arif@linux.dev>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211125507.4175026-3-usama.arif@linux.dev>

Hi Usama,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.19 next-20260212]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Usama-Arif/mm-thp-allocate-PTE-page-tables-lazily-at-split-time/20260211-205726
base:   linus/master
patch link:    https://lore.kernel.org/r/20260211125507.4175026-3-usama.arif%40linux.dev
patch subject: [RFC 2/2] mm: thp: add THP_SPLIT_PMD_PTE_ALLOC_FAILED counter
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260213/202602130506.7Tm8CJkW-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260213/202602130506.7Tm8CJkW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602130506.7Tm8CJkW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/rmap.c:1961:21: error: use of undeclared identifier 'THP_SPLIT_PMD_PTE_ALLOC_FAILED'
    1961 |                                         count_vm_event(THP_SPLIT_PMD_PTE_ALLOC_FAILED);
         |                                                        ^
   mm/rmap.c:2364:21: error: use of undeclared identifier 'THP_SPLIT_PMD_PTE_ALLOC_FAILED'
    2364 |                                         count_vm_event(THP_SPLIT_PMD_PTE_ALLOC_FAILED);
         |                                                        ^
   2 errors generated.


vim +/THP_SPLIT_PMD_PTE_ALLOC_FAILED +1961 mm/rmap.c

  1849	
  1850	/*
  1851	 * @arg: enum ttu_flags will be passed to this argument
  1852	 */
  1853	static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
  1854			     unsigned long address, void *arg)
  1855	{
  1856		struct mm_struct *mm = vma->vm_mm;
  1857		DEFINE_FOLIO_VMA_WALK(pvmw, folio, vma, address, 0);
  1858		bool anon_exclusive, ret = true;
  1859		pte_t pteval;
  1860		struct page *subpage;
  1861		struct mmu_notifier_range range;
  1862		enum ttu_flags flags = (enum ttu_flags)(long)arg;
  1863		unsigned long nr_pages = 1, end_addr;
  1864		unsigned long pfn;
  1865		unsigned long hsz = 0;
  1866		int ptes = 0;
  1867		pgtable_t prealloc_pte = NULL;
  1868	
  1869		/*
  1870		 * When racing against e.g. zap_pte_range() on another cpu,
  1871		 * in between its ptep_get_and_clear_full() and folio_remove_rmap_*(),
  1872		 * try_to_unmap() may return before page_mapped() has become false,
  1873		 * if page table locking is skipped: use TTU_SYNC to wait for that.
  1874		 */
  1875		if (flags & TTU_SYNC)
  1876			pvmw.flags = PVMW_SYNC;
  1877	
  1878		/*
  1879		 * For THP, we have to assume the worse case ie pmd for invalidation.
  1880		 * For hugetlb, it could be much worse if we need to do pud
  1881		 * invalidation in the case of pmd sharing.
  1882		 *
  1883		 * Note that the folio can not be freed in this function as call of
  1884		 * try_to_unmap() must hold a reference on the folio.
  1885		 */
  1886		range.end = vma_address_end(&pvmw);
  1887		mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, vma->vm_mm,
  1888					address, range.end);
  1889		if (folio_test_hugetlb(folio)) {
  1890			/*
  1891			 * If sharing is possible, start and end will be adjusted
  1892			 * accordingly.
  1893			 */
  1894			adjust_range_if_pmd_sharing_possible(vma, &range.start,
  1895							     &range.end);
  1896	
  1897			/* We need the huge page size for set_huge_pte_at() */
  1898			hsz = huge_page_size(hstate_vma(vma));
  1899		}
  1900		mmu_notifier_invalidate_range_start(&range);
  1901	
  1902		if ((flags & TTU_SPLIT_HUGE_PMD) && vma_is_anonymous(vma) &&
  1903		    !arch_needs_pgtable_deposit())
  1904			prealloc_pte = pte_alloc_one(mm);
  1905	
  1906		while (page_vma_mapped_walk(&pvmw)) {
  1907			/*
  1908			 * If the folio is in an mlock()d vma, we must not swap it out.
  1909			 */
  1910			if (!(flags & TTU_IGNORE_MLOCK) &&
  1911			    (vma->vm_flags & VM_LOCKED)) {
  1912				ptes++;
  1913	
  1914				/*
  1915				 * Set 'ret' to indicate the page cannot be unmapped.
  1916				 *
  1917				 * Do not jump to walk_abort immediately as additional
  1918				 * iteration might be required to detect fully mapped
  1919				 * folio an mlock it.
  1920				 */
  1921				ret = false;
  1922	
  1923				/* Only mlock fully mapped pages */
  1924				if (pvmw.pte && ptes != pvmw.nr_pages)
  1925					continue;
  1926	
  1927				/*
  1928				 * All PTEs must be protected by page table lock in
  1929				 * order to mlock the page.
  1930				 *
  1931				 * If page table boundary has been cross, current ptl
  1932				 * only protect part of ptes.
  1933				 */
  1934				if (pvmw.flags & PVMW_PGTABLE_CROSSED)
  1935					goto walk_done;
  1936	
  1937				/* Restore the mlock which got missed */
  1938				mlock_vma_folio(folio, vma);
  1939				goto walk_done;
  1940			}
  1941	
  1942			if (!pvmw.pte) {
  1943				if (folio_test_anon(folio) && !folio_test_swapbacked(folio)) {
  1944					if (unmap_huge_pmd_locked(vma, pvmw.address, pvmw.pmd, folio))
  1945						goto walk_done;
  1946					/*
  1947					 * unmap_huge_pmd_locked has either already marked
  1948					 * the folio as swap-backed or decided to retain it
  1949					 * due to GUP or speculative references.
  1950					 */
  1951					goto walk_abort;
  1952				}
  1953	
  1954				if (flags & TTU_SPLIT_HUGE_PMD) {
  1955					pgtable_t pgtable = prealloc_pte;
  1956	
  1957					prealloc_pte = NULL;
  1958	
  1959					if (!arch_needs_pgtable_deposit() && !pgtable &&
  1960					    vma_is_anonymous(vma)) {
> 1961						count_vm_event(THP_SPLIT_PMD_PTE_ALLOC_FAILED);
  1962						page_vma_mapped_walk_done(&pvmw);
  1963						ret = false;
  1964						break;
  1965					}
  1966					/*
  1967					 * We temporarily have to drop the PTL and
  1968					 * restart so we can process the PTE-mapped THP.
  1969					 */
  1970					split_huge_pmd_locked(vma, pvmw.address,
  1971							      pvmw.pmd, false, pgtable);
  1972					flags &= ~TTU_SPLIT_HUGE_PMD;
  1973					page_vma_mapped_walk_restart(&pvmw);
  1974					continue;
  1975				}
  1976			}
  1977	
  1978			/* Unexpected PMD-mapped THP? */
  1979			VM_BUG_ON_FOLIO(!pvmw.pte, folio);
  1980	
  1981			/*
  1982			 * Handle PFN swap PTEs, such as device-exclusive ones, that
  1983			 * actually map pages.
  1984			 */
  1985			pteval = ptep_get(pvmw.pte);
  1986			if (likely(pte_present(pteval))) {
  1987				pfn = pte_pfn(pteval);
  1988			} else {
  1989				const softleaf_t entry = softleaf_from_pte(pteval);
  1990	
  1991				pfn = softleaf_to_pfn(entry);
  1992				VM_WARN_ON_FOLIO(folio_test_hugetlb(folio), folio);
  1993			}
  1994	
  1995			subpage = folio_page(folio, pfn - folio_pfn(folio));
  1996			address = pvmw.address;
  1997			anon_exclusive = folio_test_anon(folio) &&
  1998					 PageAnonExclusive(subpage);
  1999	
  2000			if (folio_test_hugetlb(folio)) {
  2001				bool anon = folio_test_anon(folio);
  2002	
  2003				/*
  2004				 * The try_to_unmap() is only passed a hugetlb page
  2005				 * in the case where the hugetlb page is poisoned.
  2006				 */
  2007				VM_BUG_ON_PAGE(!PageHWPoison(subpage), subpage);
  2008				/*
  2009				 * huge_pmd_unshare may unmap an entire PMD page.
  2010				 * There is no way of knowing exactly which PMDs may
  2011				 * be cached for this mm, so we must flush them all.
  2012				 * start/end were already adjusted above to cover this
  2013				 * range.
  2014				 */
  2015				flush_cache_range(vma, range.start, range.end);
  2016	
  2017				/*
  2018				 * To call huge_pmd_unshare, i_mmap_rwsem must be
  2019				 * held in write mode.  Caller needs to explicitly
  2020				 * do this outside rmap routines.
  2021				 *
  2022				 * We also must hold hugetlb vma_lock in write mode.
  2023				 * Lock order dictates acquiring vma_lock BEFORE
  2024				 * i_mmap_rwsem.  We can only try lock here and fail
  2025				 * if unsuccessful.
  2026				 */
  2027				if (!anon) {
  2028					struct mmu_gather tlb;
  2029	
  2030					VM_BUG_ON(!(flags & TTU_RMAP_LOCKED));
  2031					if (!hugetlb_vma_trylock_write(vma))
  2032						goto walk_abort;
  2033	
  2034					tlb_gather_mmu_vma(&tlb, vma);
  2035					if (huge_pmd_unshare(&tlb, vma, address, pvmw.pte)) {
  2036						hugetlb_vma_unlock_write(vma);
  2037						huge_pmd_unshare_flush(&tlb, vma);
  2038						tlb_finish_mmu(&tlb);
  2039						/*
  2040						 * The PMD table was unmapped,
  2041						 * consequently unmapping the folio.
  2042						 */
  2043						goto walk_done;
  2044					}
  2045					hugetlb_vma_unlock_write(vma);
  2046					tlb_finish_mmu(&tlb);
  2047				}
  2048				pteval = huge_ptep_clear_flush(vma, address, pvmw.pte);
  2049				if (pte_dirty(pteval))
  2050					folio_mark_dirty(folio);
  2051			} else if (likely(pte_present(pteval))) {
  2052				nr_pages = folio_unmap_pte_batch(folio, &pvmw, flags, pteval);
  2053				end_addr = address + nr_pages * PAGE_SIZE;
  2054				flush_cache_range(vma, address, end_addr);
  2055	
  2056				/* Nuke the page table entry. */
  2057				pteval = get_and_clear_ptes(mm, address, pvmw.pte, nr_pages);
  2058				/*
  2059				 * We clear the PTE but do not flush so potentially
  2060				 * a remote CPU could still be writing to the folio.
  2061				 * If the entry was previously clean then the
  2062				 * architecture must guarantee that a clear->dirty
  2063				 * transition on a cached TLB entry is written through
  2064				 * and traps if the PTE is unmapped.
  2065				 */
  2066				if (should_defer_flush(mm, flags))
  2067					set_tlb_ubc_flush_pending(mm, pteval, address, end_addr);
  2068				else
  2069					flush_tlb_range(vma, address, end_addr);
  2070				if (pte_dirty(pteval))
  2071					folio_mark_dirty(folio);
  2072			} else {
  2073				pte_clear(mm, address, pvmw.pte);
  2074			}
  2075	
  2076			/*
  2077			 * Now the pte is cleared. If this pte was uffd-wp armed,
  2078			 * we may want to replace a none pte with a marker pte if
  2079			 * it's file-backed, so we don't lose the tracking info.
  2080			 */
  2081			pte_install_uffd_wp_if_needed(vma, address, pvmw.pte, pteval);
  2082	
  2083			/* Update high watermark before we lower rss */
  2084			update_hiwater_rss(mm);
  2085	
  2086			if (PageHWPoison(subpage) && (flags & TTU_HWPOISON)) {
  2087				pteval = swp_entry_to_pte(make_hwpoison_entry(subpage));
  2088				if (folio_test_hugetlb(folio)) {
  2089					hugetlb_count_sub(folio_nr_pages(folio), mm);
  2090					set_huge_pte_at(mm, address, pvmw.pte, pteval,
  2091							hsz);
  2092				} else {
  2093					dec_mm_counter(mm, mm_counter(folio));
  2094					set_pte_at(mm, address, pvmw.pte, pteval);
  2095				}
  2096			} else if (likely(pte_present(pteval)) && pte_unused(pteval) &&
  2097				   !userfaultfd_armed(vma)) {
  2098				/*
  2099				 * The guest indicated that the page content is of no
  2100				 * interest anymore. Simply discard the pte, vmscan
  2101				 * will take care of the rest.
  2102				 * A future reference will then fault in a new zero
  2103				 * page. When userfaultfd is active, we must not drop
  2104				 * this page though, as its main user (postcopy
  2105				 * migration) will not expect userfaults on already
  2106				 * copied pages.
  2107				 */
  2108				dec_mm_counter(mm, mm_counter(folio));
  2109			} else if (folio_test_anon(folio)) {
  2110				swp_entry_t entry = page_swap_entry(subpage);
  2111				pte_t swp_pte;
  2112				/*
  2113				 * Store the swap location in the pte.
  2114				 * See handle_pte_fault() ...
  2115				 */
  2116				if (unlikely(folio_test_swapbacked(folio) !=
  2117						folio_test_swapcache(folio))) {
  2118					WARN_ON_ONCE(1);
  2119					goto walk_abort;
  2120				}
  2121	
  2122				/* MADV_FREE page check */
  2123				if (!folio_test_swapbacked(folio)) {
  2124					int ref_count, map_count;
  2125	
  2126					/*
  2127					 * Synchronize with gup_pte_range():
  2128					 * - clear PTE; barrier; read refcount
  2129					 * - inc refcount; barrier; read PTE
  2130					 */
  2131					smp_mb();
  2132	
  2133					ref_count = folio_ref_count(folio);
  2134					map_count = folio_mapcount(folio);
  2135	
  2136					/*
  2137					 * Order reads for page refcount and dirty flag
  2138					 * (see comments in __remove_mapping()).
  2139					 */
  2140					smp_rmb();
  2141	
  2142					if (folio_test_dirty(folio) && !(vma->vm_flags & VM_DROPPABLE)) {
  2143						/*
  2144						 * redirtied either using the page table or a previously
  2145						 * obtained GUP reference.
  2146						 */
  2147						set_ptes(mm, address, pvmw.pte, pteval, nr_pages);
  2148						folio_set_swapbacked(folio);
  2149						goto walk_abort;
  2150					} else if (ref_count != 1 + map_count) {
  2151						/*
  2152						 * Additional reference. Could be a GUP reference or any
  2153						 * speculative reference. GUP users must mark the folio
  2154						 * dirty if there was a modification. This folio cannot be
  2155						 * reclaimed right now either way, so act just like nothing
  2156						 * happened.
  2157						 * We'll come back here later and detect if the folio was
  2158						 * dirtied when the additional reference is gone.
  2159						 */
  2160						set_ptes(mm, address, pvmw.pte, pteval, nr_pages);
  2161						goto walk_abort;
  2162					}
  2163					add_mm_counter(mm, MM_ANONPAGES, -nr_pages);
  2164					goto discard;
  2165				}
  2166	
  2167				if (swap_duplicate(entry) < 0) {
  2168					set_pte_at(mm, address, pvmw.pte, pteval);
  2169					goto walk_abort;
  2170				}
  2171	
  2172				/*
  2173				 * arch_unmap_one() is expected to be a NOP on
  2174				 * architectures where we could have PFN swap PTEs,
  2175				 * so we'll not check/care.
  2176				 */
  2177				if (arch_unmap_one(mm, vma, address, pteval) < 0) {
  2178					swap_free(entry);
  2179					set_pte_at(mm, address, pvmw.pte, pteval);
  2180					goto walk_abort;
  2181				}
  2182	
  2183				/* See folio_try_share_anon_rmap(): clear PTE first. */
  2184				if (anon_exclusive &&
  2185				    folio_try_share_anon_rmap_pte(folio, subpage)) {
  2186					swap_free(entry);
  2187					set_pte_at(mm, address, pvmw.pte, pteval);
  2188					goto walk_abort;
  2189				}
  2190				if (list_empty(&mm->mmlist)) {
  2191					spin_lock(&mmlist_lock);
  2192					if (list_empty(&mm->mmlist))
  2193						list_add(&mm->mmlist, &init_mm.mmlist);
  2194					spin_unlock(&mmlist_lock);
  2195				}
  2196				dec_mm_counter(mm, MM_ANONPAGES);
  2197				inc_mm_counter(mm, MM_SWAPENTS);
  2198				swp_pte = swp_entry_to_pte(entry);
  2199				if (anon_exclusive)
  2200					swp_pte = pte_swp_mkexclusive(swp_pte);
  2201				if (likely(pte_present(pteval))) {
  2202					if (pte_soft_dirty(pteval))
  2203						swp_pte = pte_swp_mksoft_dirty(swp_pte);
  2204					if (pte_uffd_wp(pteval))
  2205						swp_pte = pte_swp_mkuffd_wp(swp_pte);
  2206				} else {
  2207					if (pte_swp_soft_dirty(pteval))
  2208						swp_pte = pte_swp_mksoft_dirty(swp_pte);
  2209					if (pte_swp_uffd_wp(pteval))
  2210						swp_pte = pte_swp_mkuffd_wp(swp_pte);
  2211				}
  2212				set_pte_at(mm, address, pvmw.pte, swp_pte);
  2213			} else {
  2214				/*
  2215				 * This is a locked file-backed folio,
  2216				 * so it cannot be removed from the page
  2217				 * cache and replaced by a new folio before
  2218				 * mmu_notifier_invalidate_range_end, so no
  2219				 * concurrent thread might update its page table
  2220				 * to point at a new folio while a device is
  2221				 * still using this folio.
  2222				 *
  2223				 * See Documentation/mm/mmu_notifier.rst
  2224				 */
  2225				dec_mm_counter(mm, mm_counter_file(folio));
  2226			}
  2227	discard:
  2228			if (unlikely(folio_test_hugetlb(folio))) {
  2229				hugetlb_remove_rmap(folio);
  2230			} else {
  2231				folio_remove_rmap_ptes(folio, subpage, nr_pages, vma);
  2232			}
  2233			if (vma->vm_flags & VM_LOCKED)
  2234				mlock_drain_local();
  2235			folio_put_refs(folio, nr_pages);
  2236	
  2237			/*
  2238			 * If we are sure that we batched the entire folio and cleared
  2239			 * all PTEs, we can just optimize and stop right here.
  2240			 */
  2241			if (nr_pages == folio_nr_pages(folio))
  2242				goto walk_done;
  2243			continue;
  2244	walk_abort:
  2245			ret = false;
  2246	walk_done:
  2247			page_vma_mapped_walk_done(&pvmw);
  2248			break;
  2249		}
  2250	
  2251		if (prealloc_pte)
  2252			pte_free(mm, prealloc_pte);
  2253	
  2254		mmu_notifier_invalidate_range_end(&range);
  2255	
  2256		return ret;
  2257	}
  2258	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
