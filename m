Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91AF21C07CB;
	Fri, 20 Dec 2024 10:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734689892; cv=none; b=DSSPUeQEijBq78jJHMBy/ArIm8YDmaw1zgc6xVCVZHe8JA0UPRHC8LFebA1h5HwZMwMQjlcgwehu2V1GlSIm8/IHdSm8q6T6mq3jtrUPawThOAe0HFiPqCZqDu699EKR0ZBRgAJ7PVQM+ZHH8qcyyXw12UU2uGQoaE64F7bU740=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734689892; c=relaxed/simple;
	bh=7FZLs9QL22IobFCIjlvsTZNIs7Km2zj7SpXmFUHLSBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DxrS8NswhOkdcrJp9VXyoD/kKiEXjdsUn/e5CKEUM+z77LgF2yM0EMKf8IOk922G1ZYCn8J3XNmBO3pakvlIGm3NyvGGSiqczlW3X8Nqnhl4Oj39hXEyHjExO3g3GrboRwzgU9Vd1zILq1voXX9gBX0ryQKOhePj/pHEmu6KDPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i7F3E5+U; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i7F3E5+U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734689890; x=1766225890;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7FZLs9QL22IobFCIjlvsTZNIs7Km2zj7SpXmFUHLSBM=;
  b=i7F3E5+UOb0OKbiWxf6o10TdRk/ctHm77tzzw4oCxYk0ZvWmKnqnTULi
   wzMZN/HscZT8KWHFdgKujHySUZhUM3nnskG9g+o6F6WOFqs/FW9vBVehQ
   /KYisFu+0uKWWUTXFcNbux6mTKUoFor6hG5QFCDhsxLd5XdcL3FlvxCDP
   9enE1n+jh5kDJ8Qy0oPFNTztfGRD+05hS3LPGR/D45ROonBmMtCpm7Wa4
   /tJRT6tkI2w3CKirLJIwOmi91nJlo93u6LofFafYL6F9NDdG4Uh5+ZdOD
   XjMzUHWtmRmxi0/sb7PjZyxGe1owl2Deqzsgb90f7Qb5qXFWLF/j0Eq6E
   Q==;
X-CSE-ConnectionGUID: vMm40pDpR2WuZJIWYC07/w==
X-CSE-MsgGUID: B9A8iO3ySdOFvfXxgBvjhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="35382650"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="35382650"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 02:18:10 -0800
X-CSE-ConnectionGUID: nQnsxaB6QoGnOv+p+mUqtw==
X-CSE-MsgGUID: o7iH34gKT6+GS/eOz0DI9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="98949137"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 20 Dec 2024 02:18:07 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOa56-000135-1N;
	Fri, 20 Dec 2024 10:18:04 +0000
Date: Fri, 20 Dec 2024 18:17:14 +0800
From: kernel test robot <lkp@intel.com>
To: Donet Tom <donettom@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Zi Yan <ziy@nvidia.com>, David Hildenbrand <david@redhat.com>,
	shuah Khan <shuah@kernel.org>, Dev Jain <dev.jain@arm.com>
Subject: Re: [PATCH] mm: migration :shared anonymous migration test is failing
Message-ID: <202412201828.3GvmHte5-lkp@intel.com>
References: <20241219124717.4907-1-donettom@linux.ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219124717.4907-1-donettom@linux.ibm.com>

Hi Donet,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Donet-Tom/mm-migration-shared-anonymous-migration-test-is-failing/20241219-204920
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20241219124717.4907-1-donettom%40linux.ibm.com
patch subject: [PATCH] mm: migration :shared anonymous migration test is failing
config: arm-randconfig-001-20241220 (https://download.01.org/0day-ci/archive/20241220/202412201828.3GvmHte5-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241220/202412201828.3GvmHte5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412201828.3GvmHte5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/rmap.c:69:
   In file included from include/linux/migrate.h:8:
   include/linux/hugetlb.h:1063:5: warning: no previous prototype for function 'replace_free_hugepage_folios' [-Wmissing-prototypes]
    1063 | int replace_free_hugepage_folios(unsigned long start_pfn, unsigned long end_pfn)
         |     ^
   include/linux/hugetlb.h:1063:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1063 | int replace_free_hugepage_folios(unsigned long start_pfn, unsigned long end_pfn)
         | ^
         | static 
   In file included from mm/rmap.c:76:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
>> mm/rmap.c:2157:13: error: call to undeclared function 'huge_ptep_get_and_clear'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2157 |                         pteval = huge_ptep_get_and_clear(mm, address, pvmw.pte);
         |                                  ^
   mm/rmap.c:2157:13: note: did you mean 'ptep_get_and_clear'?
   include/linux/pgtable.h:478:21: note: 'ptep_get_and_clear' declared here
     478 | static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
         |                     ^
>> mm/rmap.c:2326:5: error: call to undeclared function 'flush_hugetlb_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2326 |                                 flush_hugetlb_page(vma, address);
         |                                 ^
   mm/rmap.c:2326:5: note: did you mean 'is_vm_hugetlb_page'?
   include/linux/hugetlb_inline.h:16:20: note: 'is_vm_hugetlb_page' declared here
      16 | static inline bool is_vm_hugetlb_page(struct vm_area_struct *vma)
         |                    ^
   3 warnings and 2 errors generated.


vim +/huge_ptep_get_and_clear +2157 mm/rmap.c

  2081	
  2082			/* Unexpected PMD-mapped THP? */
  2083			VM_BUG_ON_FOLIO(!pvmw.pte, folio);
  2084	
  2085			pfn = pte_pfn(ptep_get(pvmw.pte));
  2086	
  2087			if (folio_is_zone_device(folio)) {
  2088				/*
  2089				 * Our PTE is a non-present device exclusive entry and
  2090				 * calculating the subpage as for the common case would
  2091				 * result in an invalid pointer.
  2092				 *
  2093				 * Since only PAGE_SIZE pages can currently be
  2094				 * migrated, just set it to page. This will need to be
  2095				 * changed when hugepage migrations to device private
  2096				 * memory are supported.
  2097				 */
  2098				VM_BUG_ON_FOLIO(folio_nr_pages(folio) > 1, folio);
  2099				subpage = &folio->page;
  2100			} else {
  2101				subpage = folio_page(folio, pfn - folio_pfn(folio));
  2102			}
  2103			address = pvmw.address;
  2104			anon_exclusive = folio_test_anon(folio) &&
  2105					 PageAnonExclusive(subpage);
  2106	
  2107			if (folio_test_hugetlb(folio)) {
  2108				bool anon = folio_test_anon(folio);
  2109	
  2110				/*
  2111				 * huge_pmd_unshare may unmap an entire PMD page.
  2112				 * There is no way of knowing exactly which PMDs may
  2113				 * be cached for this mm, so we must flush them all.
  2114				 * start/end were already adjusted above to cover this
  2115				 * range.
  2116				 */
  2117				flush_cache_range(vma, range.start, range.end);
  2118	
  2119				/*
  2120				 * To call huge_pmd_unshare, i_mmap_rwsem must be
  2121				 * held in write mode.  Caller needs to explicitly
  2122				 * do this outside rmap routines.
  2123				 *
  2124				 * We also must hold hugetlb vma_lock in write mode.
  2125				 * Lock order dictates acquiring vma_lock BEFORE
  2126				 * i_mmap_rwsem.  We can only try lock here and
  2127				 * fail if unsuccessful.
  2128				 */
  2129				if (!anon) {
  2130					VM_BUG_ON(!(flags & TTU_RMAP_LOCKED));
  2131					if (!hugetlb_vma_trylock_write(vma)) {
  2132						page_vma_mapped_walk_done(&pvmw);
  2133						ret = false;
  2134						break;
  2135					}
  2136					if (huge_pmd_unshare(mm, vma, address, pvmw.pte)) {
  2137						hugetlb_vma_unlock_write(vma);
  2138						flush_tlb_range(vma,
  2139							range.start, range.end);
  2140	
  2141						/*
  2142						 * The ref count of the PMD page was
  2143						 * dropped which is part of the way map
  2144						 * counting is done for shared PMDs.
  2145						 * Return 'true' here.  When there is
  2146						 * no other sharing, huge_pmd_unshare
  2147						 * returns false and we will unmap the
  2148						 * actual page and drop map count
  2149						 * to zero.
  2150						 */
  2151						page_vma_mapped_walk_done(&pvmw);
  2152						break;
  2153					}
  2154					hugetlb_vma_unlock_write(vma);
  2155				}
  2156				/* Nuke the hugetlb page table entry */
> 2157				pteval = huge_ptep_get_and_clear(mm, address, pvmw.pte);
  2158			} else {
  2159				flush_cache_page(vma, address, pfn);
  2160				/* Nuke the page table entry. */
  2161				if (should_defer_flush(mm, flags)) {
  2162					/*
  2163					 * We clear the PTE but do not flush so potentially
  2164					 * a remote CPU could still be writing to the folio.
  2165					 * If the entry was previously clean then the
  2166					 * architecture must guarantee that a clear->dirty
  2167					 * transition on a cached TLB entry is written through
  2168					 * and traps if the PTE is unmapped.
  2169					 */
  2170					pteval = ptep_get_and_clear(mm, address, pvmw.pte);
  2171	
  2172					set_tlb_ubc_flush_pending(mm, pteval, address);
  2173				} else {
  2174					pteval = ptep_get_and_clear(mm, address, pvmw.pte);
  2175				}
  2176			}
  2177	
  2178			/* Set the dirty flag on the folio now the pte is gone. */
  2179			if (pte_dirty(pteval))
  2180				folio_mark_dirty(folio);
  2181	
  2182			/* Update high watermark before we lower rss */
  2183			update_hiwater_rss(mm);
  2184	
  2185			if (folio_is_device_private(folio)) {
  2186				unsigned long pfn = folio_pfn(folio);
  2187				swp_entry_t entry;
  2188				pte_t swp_pte;
  2189	
  2190				if (anon_exclusive)
  2191					WARN_ON_ONCE(folio_try_share_anon_rmap_pte(folio,
  2192										   subpage));
  2193	
  2194				/*
  2195				 * Store the pfn of the page in a special migration
  2196				 * pte. do_swap_page() will wait until the migration
  2197				 * pte is removed and then restart fault handling.
  2198				 */
  2199				entry = pte_to_swp_entry(pteval);
  2200				if (is_writable_device_private_entry(entry))
  2201					entry = make_writable_migration_entry(pfn);
  2202				else if (anon_exclusive)
  2203					entry = make_readable_exclusive_migration_entry(pfn);
  2204				else
  2205					entry = make_readable_migration_entry(pfn);
  2206				swp_pte = swp_entry_to_pte(entry);
  2207	
  2208				/*
  2209				 * pteval maps a zone device page and is therefore
  2210				 * a swap pte.
  2211				 */
  2212				if (pte_swp_soft_dirty(pteval))
  2213					swp_pte = pte_swp_mksoft_dirty(swp_pte);
  2214				if (pte_swp_uffd_wp(pteval))
  2215					swp_pte = pte_swp_mkuffd_wp(swp_pte);
  2216				set_pte_at(mm, pvmw.address, pvmw.pte, swp_pte);
  2217				trace_set_migration_pte(pvmw.address, pte_val(swp_pte),
  2218							folio_order(folio));
  2219				/*
  2220				 * No need to invalidate here it will synchronize on
  2221				 * against the special swap migration pte.
  2222				 */
  2223			} else if (PageHWPoison(subpage)) {
  2224				pteval = swp_entry_to_pte(make_hwpoison_entry(subpage));
  2225				if (folio_test_hugetlb(folio)) {
  2226					hugetlb_count_sub(folio_nr_pages(folio), mm);
  2227					set_huge_pte_at(mm, address, pvmw.pte, pteval,
  2228							hsz);
  2229				} else {
  2230					dec_mm_counter(mm, mm_counter(folio));
  2231					set_pte_at(mm, address, pvmw.pte, pteval);
  2232				}
  2233	
  2234			} else if (pte_unused(pteval) && !userfaultfd_armed(vma)) {
  2235				/*
  2236				 * The guest indicated that the page content is of no
  2237				 * interest anymore. Simply discard the pte, vmscan
  2238				 * will take care of the rest.
  2239				 * A future reference will then fault in a new zero
  2240				 * page. When userfaultfd is active, we must not drop
  2241				 * this page though, as its main user (postcopy
  2242				 * migration) will not expect userfaults on already
  2243				 * copied pages.
  2244				 */
  2245				dec_mm_counter(mm, mm_counter(folio));
  2246			} else {
  2247				swp_entry_t entry;
  2248				pte_t swp_pte;
  2249	
  2250				if (arch_unmap_one(mm, vma, address, pteval) < 0) {
  2251					if (folio_test_hugetlb(folio))
  2252						set_huge_pte_at(mm, address, pvmw.pte,
  2253								pteval, hsz);
  2254					else
  2255						set_pte_at(mm, address, pvmw.pte, pteval);
  2256					ret = false;
  2257					page_vma_mapped_walk_done(&pvmw);
  2258					break;
  2259				}
  2260				VM_BUG_ON_PAGE(pte_write(pteval) && folio_test_anon(folio) &&
  2261					       !anon_exclusive, subpage);
  2262	
  2263				/* See folio_try_share_anon_rmap_pte(): clear PTE first. */
  2264				if (folio_test_hugetlb(folio)) {
  2265					if (anon_exclusive &&
  2266					    hugetlb_try_share_anon_rmap(folio)) {
  2267						set_huge_pte_at(mm, address, pvmw.pte,
  2268								pteval, hsz);
  2269						ret = false;
  2270						page_vma_mapped_walk_done(&pvmw);
  2271						break;
  2272					}
  2273				} else if (anon_exclusive &&
  2274					   folio_try_share_anon_rmap_pte(folio, subpage)) {
  2275					set_pte_at(mm, address, pvmw.pte, pteval);
  2276					ret = false;
  2277					page_vma_mapped_walk_done(&pvmw);
  2278					break;
  2279				}
  2280	
  2281				/*
  2282				 * Store the pfn of the page in a special migration
  2283				 * pte. do_swap_page() will wait until the migration
  2284				 * pte is removed and then restart fault handling.
  2285				 */
  2286				if (pte_write(pteval))
  2287					entry = make_writable_migration_entry(
  2288								page_to_pfn(subpage));
  2289				else if (anon_exclusive)
  2290					entry = make_readable_exclusive_migration_entry(
  2291								page_to_pfn(subpage));
  2292				else
  2293					entry = make_readable_migration_entry(
  2294								page_to_pfn(subpage));
  2295				if (pte_young(pteval))
  2296					entry = make_migration_entry_young(entry);
  2297				if (pte_dirty(pteval))
  2298					entry = make_migration_entry_dirty(entry);
  2299				swp_pte = swp_entry_to_pte(entry);
  2300				if (pte_soft_dirty(pteval))
  2301					swp_pte = pte_swp_mksoft_dirty(swp_pte);
  2302				if (pte_uffd_wp(pteval))
  2303					swp_pte = pte_swp_mkuffd_wp(swp_pte);
  2304				if (folio_test_hugetlb(folio))
  2305					set_huge_pte_at(mm, address, pvmw.pte, swp_pte,
  2306							hsz);
  2307				else
  2308					set_pte_at(mm, address, pvmw.pte, swp_pte);
  2309				trace_set_migration_pte(address, pte_val(swp_pte),
  2310							folio_order(folio));
  2311				/*
  2312				 * No need to invalidate here it will synchronize on
  2313				 * against the special swap migration pte.
  2314				 */
  2315			}
  2316	
  2317			if (unlikely(folio_test_hugetlb(folio)))
  2318				hugetlb_remove_rmap(folio);
  2319			else
  2320				folio_remove_rmap_pte(folio, subpage, vma);
  2321			if (vma->vm_flags & VM_LOCKED)
  2322				mlock_drain_local();
  2323	
  2324			if (!should_defer_flush(mm, flags)) {
  2325				if (folio_test_hugetlb(folio))
> 2326					flush_hugetlb_page(vma, address);
  2327				else
  2328					flush_tlb_page(vma, address);
  2329			}
  2330	
  2331			folio_put(folio);
  2332		}
  2333	
  2334		mmu_notifier_invalidate_range_end(&range);
  2335	
  2336		return ret;
  2337	}
  2338	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
