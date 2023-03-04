Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0CD1FD0;
	Sat,  4 Mar 2023 10:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677927473; x=1709463473;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u9LmhFrB2C+wIdFEwivTKoH0ORm6v/cdDTeQBE6KDho=;
  b=YCUwL01CeUGGL6p2PNHJQNRxD01FcdEruJ7mO9dEJmzIAfirPjrHmKlF
   nM9p35dlmTdCKhU90jWnIcOvbbLGlC1CUqBhQ7RnG1w3ymtJI5vOvBVOk
   BjPG9cOhjovmfV4cClyqToWxPhMElXp24ivPBUzTy5FE2kuSaw6BBgAd7
   kJAaWRPAOs1MCgxJyhenjEBUZwD6XwaxLif87uLdNkee/AWBieS6w2bvi
   5S1GOeOis4ZM/SDvXdqPsSqFLPLL13RHspnPxU0BD7GUQmX6jCfeTZVV+
   EkTSH0tsJTv6OoRJJ1r5Fvz1kMhkXVdvvFO5qNvfsgm4sKHSm49RNbKhv
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="323554932"
X-IronPort-AV: E=Sophos;i="5.98,233,1673942400"; 
   d="scan'208";a="323554932"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2023 02:57:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="739787810"
X-IronPort-AV: E=Sophos;i="5.98,233,1673942400"; 
   d="scan'208";a="739787810"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 04 Mar 2023 02:57:50 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYPaI-00026G-0F;
	Sat, 04 Mar 2023 10:57:50 +0000
Date: Sat, 4 Mar 2023 18:57:43 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/1] mm/khugepaged: fix vm_lock/i_mmap_rwsem inversion in
 retract_page_tables
Message-ID: <202303041842.Cv8cTjlL-lkp@intel.com>
References: <20230303213250.3555716-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230303213250.3555716-1-surenb@google.com>

Hi Suren,

I love your patch! Yet something to improve:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan/mm-khugepaged-fix-vm_lock-i_mmap_rwsem-inversion-in-retract_page_tables/20230304-053401
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230303213250.3555716-1-surenb%40google.com
patch subject: [PATCH 1/1] mm/khugepaged: fix vm_lock/i_mmap_rwsem inversion in retract_page_tables
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20230304/202303041842.Cv8cTjlL-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/338d2ee433a0559b3c6c3966b8d4ffe55e8dc6c9
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Suren-Baghdasaryan/mm-khugepaged-fix-vm_lock-i_mmap_rwsem-inversion-in-retract_page_tables/20230304-053401
        git checkout 338d2ee433a0559b3c6c3966b8d4ffe55e8dc6c9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303041842.Cv8cTjlL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/khugepaged.c:1799:9: error: implicit declaration of function 'vma_try_start_write' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                           if (!vma_try_start_write(vma))
                                ^
   mm/khugepaged.c:1799:9: note: did you mean 'vma_start_write'?
   include/linux/mm.h:742:20: note: 'vma_start_write' declared here
   static inline void vma_start_write(struct vm_area_struct *vma) {}
                      ^
   1 error generated.


vim +/vma_try_start_write +1799 mm/khugepaged.c

  1736	
  1737	static int retract_page_tables(struct address_space *mapping, pgoff_t pgoff,
  1738				       struct mm_struct *target_mm,
  1739				       unsigned long target_addr, struct page *hpage,
  1740				       struct collapse_control *cc)
  1741	{
  1742		struct vm_area_struct *vma;
  1743		int target_result = SCAN_FAIL;
  1744	
  1745		i_mmap_lock_write(mapping);
  1746		vma_interval_tree_foreach(vma, &mapping->i_mmap, pgoff, pgoff) {
  1747			int result = SCAN_FAIL;
  1748			struct mm_struct *mm = NULL;
  1749			unsigned long addr = 0;
  1750			pmd_t *pmd;
  1751			bool is_target = false;
  1752	
  1753			/*
  1754			 * Check vma->anon_vma to exclude MAP_PRIVATE mappings that
  1755			 * got written to. These VMAs are likely not worth investing
  1756			 * mmap_write_lock(mm) as PMD-mapping is likely to be split
  1757			 * later.
  1758			 *
  1759			 * Note that vma->anon_vma check is racy: it can be set up after
  1760			 * the check but before we took mmap_lock by the fault path.
  1761			 * But page lock would prevent establishing any new ptes of the
  1762			 * page, so we are safe.
  1763			 *
  1764			 * An alternative would be drop the check, but check that page
  1765			 * table is clear before calling pmdp_collapse_flush() under
  1766			 * ptl. It has higher chance to recover THP for the VMA, but
  1767			 * has higher cost too. It would also probably require locking
  1768			 * the anon_vma.
  1769			 */
  1770			if (READ_ONCE(vma->anon_vma)) {
  1771				result = SCAN_PAGE_ANON;
  1772				goto next;
  1773			}
  1774			addr = vma->vm_start + ((pgoff - vma->vm_pgoff) << PAGE_SHIFT);
  1775			if (addr & ~HPAGE_PMD_MASK ||
  1776			    vma->vm_end < addr + HPAGE_PMD_SIZE) {
  1777				result = SCAN_VMA_CHECK;
  1778				goto next;
  1779			}
  1780			mm = vma->vm_mm;
  1781			is_target = mm == target_mm && addr == target_addr;
  1782			result = find_pmd_or_thp_or_none(mm, addr, &pmd);
  1783			if (result != SCAN_SUCCEED)
  1784				goto next;
  1785			/*
  1786			 * We need exclusive mmap_lock to retract page table.
  1787			 *
  1788			 * We use trylock due to lock inversion: we need to acquire
  1789			 * mmap_lock while holding page lock. Fault path does it in
  1790			 * reverse order. Trylock is a way to avoid deadlock.
  1791			 *
  1792			 * Also, it's not MADV_COLLAPSE's job to collapse other
  1793			 * mappings - let khugepaged take care of them later.
  1794			 */
  1795			result = SCAN_PTE_MAPPED_HUGEPAGE;
  1796			if ((cc->is_khugepaged || is_target) &&
  1797			    mmap_write_trylock(mm)) {
  1798				/* trylock for the same lock inversion as above */
> 1799				if (!vma_try_start_write(vma))
  1800					goto unlock_next;
  1801	
  1802				/*
  1803				 * Re-check whether we have an ->anon_vma, because
  1804				 * collapse_and_free_pmd() requires that either no
  1805				 * ->anon_vma exists or the anon_vma is locked.
  1806				 * We already checked ->anon_vma above, but that check
  1807				 * is racy because ->anon_vma can be populated under the
  1808				 * mmap lock in read mode.
  1809				 */
  1810				if (vma->anon_vma) {
  1811					result = SCAN_PAGE_ANON;
  1812					goto unlock_next;
  1813				}
  1814				/*
  1815				 * When a vma is registered with uffd-wp, we can't
  1816				 * recycle the pmd pgtable because there can be pte
  1817				 * markers installed.  Skip it only, so the rest mm/vma
  1818				 * can still have the same file mapped hugely, however
  1819				 * it'll always mapped in small page size for uffd-wp
  1820				 * registered ranges.
  1821				 */
  1822				if (hpage_collapse_test_exit(mm)) {
  1823					result = SCAN_ANY_PROCESS;
  1824					goto unlock_next;
  1825				}
  1826				if (userfaultfd_wp(vma)) {
  1827					result = SCAN_PTE_UFFD_WP;
  1828					goto unlock_next;
  1829				}
  1830				collapse_and_free_pmd(mm, vma, addr, pmd);
  1831				if (!cc->is_khugepaged && is_target)
  1832					result = set_huge_pmd(vma, addr, pmd, hpage);
  1833				else
  1834					result = SCAN_SUCCEED;
  1835	
  1836	unlock_next:
  1837				mmap_write_unlock(mm);
  1838				goto next;
  1839			}
  1840			/*
  1841			 * Calling context will handle target mm/addr. Otherwise, let
  1842			 * khugepaged try again later.
  1843			 */
  1844			if (!is_target) {
  1845				khugepaged_add_pte_mapped_thp(mm, addr);
  1846				continue;
  1847			}
  1848	next:
  1849			if (is_target)
  1850				target_result = result;
  1851		}
  1852		i_mmap_unlock_write(mapping);
  1853		return target_result;
  1854	}
  1855	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
