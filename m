Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149771E4A1;
	Wed,  1 May 2024 08:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714552707; cv=none; b=nYUj5HSYjWrhz2gXqwqY3s2x3DNHl6Y/H/uE2f9mmI7o8rsR4x4kbmP4/c9mmpP9jGroLTfHwPqGUIUknN386w+3QSC1cQDm8ZUYe4+z5GW+dg8azkOuepv2KN1562nivVkjMxq/3QYsCylI358FMo4pxIbSXHbgybyaWhl3IvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714552707; c=relaxed/simple;
	bh=AjdYoQnDUjy7C9O4SawU4Hc+7hzGFNmBNyjfD6tCKD4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=icYutCCS9p32D6FIqs4pdP+MvoEJN72o8Fa/tYwgdm0v2L7nPYPvV7631LdhmRGlYWFJRPzFr5ka1WDAt7CMoJ7fiNC3t5FwuopZbAk55+2i2Tcb/iZRBeH05d9m29ZX2Ooy4nLZv8vBHbIfnun1SOGZfhp57iGIJi+A9mXvydQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k8DdrK6j; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k8DdrK6j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714552705; x=1746088705;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AjdYoQnDUjy7C9O4SawU4Hc+7hzGFNmBNyjfD6tCKD4=;
  b=k8DdrK6jNIlkWapE2ybVRegv+/MzMx9MTm9zmrb6Lrda3dNjI1knHryM
   FiMlzu61/8YZALKNPADizH4pBigMAMothH+1opBS/wM1kbtvC4HqjOrIe
   9Rd1R+nM8v7KQyNsBwPjsSstPq1VYxz4lOG3ROJa8nAmYwLQTw63NOsC8
   Yda2xvxaIThgjnbsxirpAz1wNNmVd3X6tULjnqDUuDbdPCdFF569yEusy
   DsKlYWChlopkhFJquWJL/QcK9t+PzyTUxpMziMz1DTtxZpRTjACd3bA7D
   Vm+/4HLcGMl1Pjf8ztBqnYyuXy5BwuOLid9+4xxQ1PDSn5bJHdrSfKyce
   g==;
X-CSE-ConnectionGUID: sBXAO0LYQHatK/swXMr5ug==
X-CSE-MsgGUID: haO3Xf8HRUeeidrWfitsVg==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="20964808"
X-IronPort-AV: E=Sophos;i="6.07,244,1708416000"; 
   d="scan'208";a="20964808"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2024 01:38:24 -0700
X-CSE-ConnectionGUID: 1sHLMtMaRVqwrn0HJak6xg==
X-CSE-MsgGUID: MN3lloTFQCODpuvLJeIGZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,244,1708416000"; 
   d="scan'208";a="31520710"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 01 May 2024 01:38:22 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s25Tn-0009F2-2d;
	Wed, 01 May 2024 08:38:19 +0000
Date: Wed, 1 May 2024 16:38:09 +0800
From: kernel test robot <lkp@intel.com>
To: Lance Yang <ioworker0@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 9311/9709] mm/rmap.c:1651:27: error: call to
 '__compiletime_assert_333' declared with 'error' attribute: BUILD_BUG failed
Message-ID: <202405011624.KzqucHwp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d04466706db5e241ee026f17b5f920e50dee26b5
commit: 34d66beb14bdedb5c12733f2fd2498634dd1fd91 [9311/9709] mm/rmap: integrate PMD-mapped folio splitting into pagewalk loop
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20240501/202405011624.KzqucHwp-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240501/202405011624.KzqucHwp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405011624.KzqucHwp-lkp@intel.com/

Note: the linux-next/master HEAD d04466706db5e241ee026f17b5f920e50dee26b5 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from mm/rmap.c:56:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/rmap.c:77:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
>> mm/rmap.c:1651:27: error: call to '__compiletime_assert_333' declared with 'error' attribute: BUILD_BUG failed
    1651 |                 range.start = address & HPAGE_PMD_MASK;
         |                                         ^
   include/linux/huge_mm.h:103:27: note: expanded from macro 'HPAGE_PMD_MASK'
     103 | #define HPAGE_PMD_MASK  (~(HPAGE_PMD_SIZE - 1))
         |                            ^
   include/linux/huge_mm.h:104:34: note: expanded from macro 'HPAGE_PMD_SIZE'
     104 | #define HPAGE_PMD_SIZE  ((1UL) << HPAGE_PMD_SHIFT)
         |                                   ^
   include/linux/huge_mm.h:97:28: note: expanded from macro 'HPAGE_PMD_SHIFT'
      97 | #define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
         |                            ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:448:2: note: expanded from macro '_compiletime_assert'
     448 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:441:4: note: expanded from macro '__compiletime_assert'
     441 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:140:1: note: expanded from here
     140 | __compiletime_assert_333
         | ^
   3 warnings and 1 error generated.


vim +1651 mm/rmap.c

  1613	
  1614	/*
  1615	 * @arg: enum ttu_flags will be passed to this argument
  1616	 */
  1617	static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
  1618			     unsigned long address, void *arg)
  1619	{
  1620		struct mm_struct *mm = vma->vm_mm;
  1621		DEFINE_FOLIO_VMA_WALK(pvmw, folio, vma, address, 0);
  1622		pte_t pteval;
  1623		struct page *subpage;
  1624		bool anon_exclusive, ret = true;
  1625		struct mmu_notifier_range range;
  1626		enum ttu_flags flags = (enum ttu_flags)(long)arg;
  1627		unsigned long pfn;
  1628		unsigned long hsz = 0;
  1629	
  1630		/*
  1631		 * When racing against e.g. zap_pte_range() on another cpu,
  1632		 * in between its ptep_get_and_clear_full() and folio_remove_rmap_*(),
  1633		 * try_to_unmap() may return before page_mapped() has become false,
  1634		 * if page table locking is skipped: use TTU_SYNC to wait for that.
  1635		 */
  1636		if (flags & TTU_SYNC)
  1637			pvmw.flags = PVMW_SYNC;
  1638	
  1639		/*
  1640		 * For THP, we have to assume the worse case ie pmd for invalidation.
  1641		 * For hugetlb, it could be much worse if we need to do pud
  1642		 * invalidation in the case of pmd sharing.
  1643		 *
  1644		 * Note that the folio can not be freed in this function as call of
  1645		 * try_to_unmap() must hold a reference on the folio.
  1646		 */
  1647		range.end = vma_address_end(&pvmw);
  1648		mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, vma->vm_mm,
  1649					address, range.end);
  1650		if (flags & TTU_SPLIT_HUGE_PMD) {
> 1651			range.start = address & HPAGE_PMD_MASK;
  1652			range.end = (address & HPAGE_PMD_MASK) + HPAGE_PMD_SIZE;
  1653		}
  1654		if (folio_test_hugetlb(folio)) {
  1655			/*
  1656			 * If sharing is possible, start and end will be adjusted
  1657			 * accordingly.
  1658			 */
  1659			adjust_range_if_pmd_sharing_possible(vma, &range.start,
  1660							     &range.end);
  1661	
  1662			/* We need the huge page size for set_huge_pte_at() */
  1663			hsz = huge_page_size(hstate_vma(vma));
  1664		}
  1665		mmu_notifier_invalidate_range_start(&range);
  1666	
  1667		while (page_vma_mapped_walk(&pvmw)) {
  1668			/*
  1669			 * If the folio is in an mlock()d vma, we must not swap it out.
  1670			 */
  1671			if (!(flags & TTU_IGNORE_MLOCK) &&
  1672			    (vma->vm_flags & VM_LOCKED)) {
  1673				/* Restore the mlock which got missed */
  1674				if (!folio_test_large(folio))
  1675					mlock_vma_folio(folio, vma);
  1676				goto walk_done_err;
  1677			}
  1678	
  1679			if (!pvmw.pte && (flags & TTU_SPLIT_HUGE_PMD)) {
  1680				/*
  1681				 * We temporarily have to drop the PTL and start once
  1682				 * again from that now-PTE-mapped page table.
  1683				 */
  1684				split_huge_pmd_locked(vma, range.start, pvmw.pmd, false,
  1685						      folio);
  1686				pvmw.pmd = NULL;
  1687				spin_unlock(pvmw.ptl);
  1688				flags &= ~TTU_SPLIT_HUGE_PMD;
  1689				continue;
  1690			}
  1691	
  1692			/* Unexpected PMD-mapped THP? */
  1693			VM_BUG_ON_FOLIO(!pvmw.pte, folio);
  1694	
  1695			pfn = pte_pfn(ptep_get(pvmw.pte));
  1696			subpage = folio_page(folio, pfn - folio_pfn(folio));
  1697			address = pvmw.address;
  1698			anon_exclusive = folio_test_anon(folio) &&
  1699					 PageAnonExclusive(subpage);
  1700	
  1701			if (folio_test_hugetlb(folio)) {
  1702				bool anon = folio_test_anon(folio);
  1703	
  1704				/*
  1705				 * The try_to_unmap() is only passed a hugetlb page
  1706				 * in the case where the hugetlb page is poisoned.
  1707				 */
  1708				VM_BUG_ON_PAGE(!PageHWPoison(subpage), subpage);
  1709				/*
  1710				 * huge_pmd_unshare may unmap an entire PMD page.
  1711				 * There is no way of knowing exactly which PMDs may
  1712				 * be cached for this mm, so we must flush them all.
  1713				 * start/end were already adjusted above to cover this
  1714				 * range.
  1715				 */
  1716				flush_cache_range(vma, range.start, range.end);
  1717	
  1718				/*
  1719				 * To call huge_pmd_unshare, i_mmap_rwsem must be
  1720				 * held in write mode.  Caller needs to explicitly
  1721				 * do this outside rmap routines.
  1722				 *
  1723				 * We also must hold hugetlb vma_lock in write mode.
  1724				 * Lock order dictates acquiring vma_lock BEFORE
  1725				 * i_mmap_rwsem.  We can only try lock here and fail
  1726				 * if unsuccessful.
  1727				 */
  1728				if (!anon) {
  1729					VM_BUG_ON(!(flags & TTU_RMAP_LOCKED));
  1730					if (!hugetlb_vma_trylock_write(vma))
  1731						goto walk_done_err;
  1732					if (huge_pmd_unshare(mm, vma, address, pvmw.pte)) {
  1733						hugetlb_vma_unlock_write(vma);
  1734						flush_tlb_range(vma,
  1735							range.start, range.end);
  1736						/*
  1737						 * The ref count of the PMD page was
  1738						 * dropped which is part of the way map
  1739						 * counting is done for shared PMDs.
  1740						 * Return 'true' here.  When there is
  1741						 * no other sharing, huge_pmd_unshare
  1742						 * returns false and we will unmap the
  1743						 * actual page and drop map count
  1744						 * to zero.
  1745						 */
  1746						goto walk_done;
  1747					}
  1748					hugetlb_vma_unlock_write(vma);
  1749				}
  1750				pteval = huge_ptep_clear_flush(vma, address, pvmw.pte);
  1751			} else {
  1752				flush_cache_page(vma, address, pfn);
  1753				/* Nuke the page table entry. */
  1754				if (should_defer_flush(mm, flags)) {
  1755					/*
  1756					 * We clear the PTE but do not flush so potentially
  1757					 * a remote CPU could still be writing to the folio.
  1758					 * If the entry was previously clean then the
  1759					 * architecture must guarantee that a clear->dirty
  1760					 * transition on a cached TLB entry is written through
  1761					 * and traps if the PTE is unmapped.
  1762					 */
  1763					pteval = ptep_get_and_clear(mm, address, pvmw.pte);
  1764	
  1765					set_tlb_ubc_flush_pending(mm, pteval, address);
  1766				} else {
  1767					pteval = ptep_clear_flush(vma, address, pvmw.pte);
  1768				}
  1769			}
  1770	
  1771			/*
  1772			 * Now the pte is cleared. If this pte was uffd-wp armed,
  1773			 * we may want to replace a none pte with a marker pte if
  1774			 * it's file-backed, so we don't lose the tracking info.
  1775			 */
  1776			pte_install_uffd_wp_if_needed(vma, address, pvmw.pte, pteval);
  1777	
  1778			/* Set the dirty flag on the folio now the pte is gone. */
  1779			if (pte_dirty(pteval))
  1780				folio_mark_dirty(folio);
  1781	
  1782			/* Update high watermark before we lower rss */
  1783			update_hiwater_rss(mm);
  1784	
  1785			if (PageHWPoison(subpage) && (flags & TTU_HWPOISON)) {
  1786				pteval = swp_entry_to_pte(make_hwpoison_entry(subpage));
  1787				if (folio_test_hugetlb(folio)) {
  1788					hugetlb_count_sub(folio_nr_pages(folio), mm);
  1789					set_huge_pte_at(mm, address, pvmw.pte, pteval,
  1790							hsz);
  1791				} else {
  1792					dec_mm_counter(mm, mm_counter(folio));
  1793					set_pte_at(mm, address, pvmw.pte, pteval);
  1794				}
  1795	
  1796			} else if (pte_unused(pteval) && !userfaultfd_armed(vma)) {
  1797				/*
  1798				 * The guest indicated that the page content is of no
  1799				 * interest anymore. Simply discard the pte, vmscan
  1800				 * will take care of the rest.
  1801				 * A future reference will then fault in a new zero
  1802				 * page. When userfaultfd is active, we must not drop
  1803				 * this page though, as its main user (postcopy
  1804				 * migration) will not expect userfaults on already
  1805				 * copied pages.
  1806				 */
  1807				dec_mm_counter(mm, mm_counter(folio));
  1808			} else if (folio_test_anon(folio)) {
  1809				swp_entry_t entry = page_swap_entry(subpage);
  1810				pte_t swp_pte;
  1811				/*
  1812				 * Store the swap location in the pte.
  1813				 * See handle_pte_fault() ...
  1814				 */
  1815				if (unlikely(folio_test_swapbacked(folio) !=
  1816						folio_test_swapcache(folio))) {
  1817					WARN_ON_ONCE(1);
  1818					goto walk_done_err;
  1819				}
  1820	
  1821				/* MADV_FREE page check */
  1822				if (!folio_test_swapbacked(folio)) {
  1823					int ref_count, map_count;
  1824	
  1825					/*
  1826					 * Synchronize with gup_pte_range():
  1827					 * - clear PTE; barrier; read refcount
  1828					 * - inc refcount; barrier; read PTE
  1829					 */
  1830					smp_mb();
  1831	
  1832					ref_count = folio_ref_count(folio);
  1833					map_count = folio_mapcount(folio);
  1834	
  1835					/*
  1836					 * Order reads for page refcount and dirty flag
  1837					 * (see comments in __remove_mapping()).
  1838					 */
  1839					smp_rmb();
  1840	
  1841					/*
  1842					 * The only page refs must be one from isolation
  1843					 * plus the rmap(s) (dropped by discard:).
  1844					 */
  1845					if (ref_count == 1 + map_count &&
  1846					    !folio_test_dirty(folio)) {
  1847						dec_mm_counter(mm, MM_ANONPAGES);
  1848						goto discard;
  1849					}
  1850	
  1851					/*
  1852					 * If the folio was redirtied, it cannot be
  1853					 * discarded. Remap the page to page table.
  1854					 */
  1855					set_pte_at(mm, address, pvmw.pte, pteval);
  1856					folio_set_swapbacked(folio);
  1857					goto walk_done_err;
  1858				}
  1859	
  1860				if (swap_duplicate(entry) < 0) {
  1861					set_pte_at(mm, address, pvmw.pte, pteval);
  1862					goto walk_done_err;
  1863				}
  1864				if (arch_unmap_one(mm, vma, address, pteval) < 0) {
  1865					swap_free(entry);
  1866					set_pte_at(mm, address, pvmw.pte, pteval);
  1867					goto walk_done_err;
  1868				}
  1869	
  1870				/* See folio_try_share_anon_rmap(): clear PTE first. */
  1871				if (anon_exclusive &&
  1872				    folio_try_share_anon_rmap_pte(folio, subpage)) {
  1873					swap_free(entry);
  1874					set_pte_at(mm, address, pvmw.pte, pteval);
  1875					goto walk_done_err;
  1876				}
  1877				if (list_empty(&mm->mmlist)) {
  1878					spin_lock(&mmlist_lock);
  1879					if (list_empty(&mm->mmlist))
  1880						list_add(&mm->mmlist, &init_mm.mmlist);
  1881					spin_unlock(&mmlist_lock);
  1882				}
  1883				dec_mm_counter(mm, MM_ANONPAGES);
  1884				inc_mm_counter(mm, MM_SWAPENTS);
  1885				swp_pte = swp_entry_to_pte(entry);
  1886				if (anon_exclusive)
  1887					swp_pte = pte_swp_mkexclusive(swp_pte);
  1888				if (pte_soft_dirty(pteval))
  1889					swp_pte = pte_swp_mksoft_dirty(swp_pte);
  1890				if (pte_uffd_wp(pteval))
  1891					swp_pte = pte_swp_mkuffd_wp(swp_pte);
  1892				set_pte_at(mm, address, pvmw.pte, swp_pte);
  1893			} else {
  1894				/*
  1895				 * This is a locked file-backed folio,
  1896				 * so it cannot be removed from the page
  1897				 * cache and replaced by a new folio before
  1898				 * mmu_notifier_invalidate_range_end, so no
  1899				 * concurrent thread might update its page table
  1900				 * to point at a new folio while a device is
  1901				 * still using this folio.
  1902				 *
  1903				 * See Documentation/mm/mmu_notifier.rst
  1904				 */
  1905				dec_mm_counter(mm, mm_counter_file(folio));
  1906			}
  1907	discard:
  1908			if (unlikely(folio_test_hugetlb(folio)))
  1909				hugetlb_remove_rmap(folio);
  1910			else
  1911				folio_remove_rmap_pte(folio, subpage, vma);
  1912			if (vma->vm_flags & VM_LOCKED)
  1913				mlock_drain_local();
  1914			folio_put(folio);
  1915			continue;
  1916	walk_done_err:
  1917			ret = false;
  1918	walk_done:
  1919			page_vma_mapped_walk_done(&pvmw);
  1920			break;
  1921		}
  1922	
  1923		mmu_notifier_invalidate_range_end(&range);
  1924	
  1925		return ret;
  1926	}
  1927	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
