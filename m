Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0333A2F45;
	Mon, 13 Mar 2023 16:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678726594; x=1710262594;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zD13Ckz6EK9mreFo9v1e3TxNTwk0HugqznginmxynRg=;
  b=EXM5IfYhl1kHVKzwrDA568lT53HkhwPpWWLc1bp6mBHog5irOfUJQd3I
   eunXKMKrRVKDFrzcQbBTm4+OzxwFXE3lyed+258HTLBTC98xZpAfZU8ub
   Mpg6yhMlXooKcZI4xbCH1x2aQHYmF305QVx/sdBan5zCR+u08UrQam0A3
   0kEJCgZ3g+lI8Q2Siau5Sn7FD5yA9tWWKbmG50Lk9oArcQ+REZuVfNU5C
   AXJEHzq8Rkevm+PCE6m/z7sAXY+PIFEc2kD1cSOyzsN2El0HAU7BvIdRO
   CgPwDdXdOnQ4nBb/99HPA/iftKnffz5qheaaehueZC6R4Nf1p8+wNrzMM
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="399792966"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; 
   d="scan'208";a="399792966"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 09:56:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="924572275"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; 
   d="scan'208";a="924572275"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 13 Mar 2023 09:56:32 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pblTL-0005uS-2V;
	Mon, 13 Mar 2023 16:56:31 +0000
Date: Tue, 14 Mar 2023 00:55:54 +0800
From: kernel test robot <lkp@intel.com>
To: Yin Fengwei <fengwei.yin@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 1/5] rmap: move hugetlb try_to_unmap to dedicated
 function
Message-ID: <202303140016.q8dVJMP2-lkp@intel.com>
References: <20230313124526.1207490-2-fengwei.yin@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230313124526.1207490-2-fengwei.yin@intel.com>

Hi Yin,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.3-rc2 next-20230310]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yin-Fengwei/rmap-move-hugetlb-try_to_unmap-to-dedicated-function/20230313-204656
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230313124526.1207490-2-fengwei.yin%40intel.com
patch subject: [PATCH v4 1/5] rmap: move hugetlb try_to_unmap to dedicated function
config: arm-buildonly-randconfig-r001-20230312 (https://download.01.org/0day-ci/archive/20230314/202303140016.q8dVJMP2-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/c43d03caaff9b0b9a869fd2a9b8beed7bc833f2a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yin-Fengwei/rmap-move-hugetlb-try_to_unmap-to-dedicated-function/20230313-204656
        git checkout c43d03caaff9b0b9a869fd2a9b8beed7bc833f2a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303140016.q8dVJMP2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/rmap.c:1513:6: error: call to undeclared function 'huge_pte_dirty'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           if (huge_pte_dirty(pteval))
               ^
   1 error generated.


vim +/huge_pte_dirty +1513 mm/rmap.c

  1443	
  1444	static bool try_to_unmap_one_hugetlb(struct folio *folio,
  1445			struct vm_area_struct *vma, struct mmu_notifier_range range,
  1446			struct page_vma_mapped_walk pvmw, unsigned long address,
  1447			enum ttu_flags flags)
  1448	{
  1449		struct mm_struct *mm = vma->vm_mm;
  1450		pte_t pteval;
  1451		bool ret = true, anon = folio_test_anon(folio);
  1452	
  1453		/*
  1454		 * The try_to_unmap() is only passed a hugetlb page
  1455		 * in the case where the hugetlb page is poisoned.
  1456		 */
  1457		VM_BUG_ON_FOLIO(!folio_test_hwpoison(folio), folio);
  1458		/*
  1459		 * huge_pmd_unshare may unmap an entire PMD page.
  1460		 * There is no way of knowing exactly which PMDs may
  1461		 * be cached for this mm, so we must flush them all.
  1462		 * start/end were already adjusted in caller
  1463		 * (try_to_unmap_one) to cover this range.
  1464		 */
  1465		flush_cache_range(vma, range.start, range.end);
  1466	
  1467		/*
  1468		 * To call huge_pmd_unshare, i_mmap_rwsem must be
  1469		 * held in write mode.  Caller needs to explicitly
  1470		 * do this outside rmap routines.
  1471		 *
  1472		 * We also must hold hugetlb vma_lock in write mode.
  1473		 * Lock order dictates acquiring vma_lock BEFORE
  1474		 * i_mmap_rwsem.  We can only try lock here and fail
  1475		 * if unsuccessful.
  1476		 */
  1477		if (!anon) {
  1478			VM_BUG_ON(!(flags & TTU_RMAP_LOCKED));
  1479			if (!hugetlb_vma_trylock_write(vma)) {
  1480				ret = false;
  1481				goto out;
  1482			}
  1483			if (huge_pmd_unshare(mm, vma, address, pvmw.pte)) {
  1484				hugetlb_vma_unlock_write(vma);
  1485				flush_tlb_range(vma,
  1486						range.start, range.end);
  1487				mmu_notifier_invalidate_range(mm,
  1488						range.start, range.end);
  1489				/*
  1490				 * The ref count of the PMD page was
  1491				 * dropped which is part of the way map
  1492				 * counting is done for shared PMDs.
  1493				 * Return 'true' here.  When there is
  1494				 * no other sharing, huge_pmd_unshare
  1495				 * returns false and we will unmap the
  1496				 * actual page and drop map count
  1497				 * to zero.
  1498				 */
  1499				goto out;
  1500			}
  1501			hugetlb_vma_unlock_write(vma);
  1502		}
  1503		pteval = huge_ptep_clear_flush(vma, address, pvmw.pte);
  1504	
  1505		/*
  1506		 * Now the pte is cleared. If this pte was uffd-wp armed,
  1507		 * we may want to replace a none pte with a marker pte if
  1508		 * it's file-backed, so we don't lose the tracking info.
  1509		 */
  1510		pte_install_uffd_wp_if_needed(vma, address, pvmw.pte, pteval);
  1511	
  1512		/* Set the dirty flag on the folio now the pte is gone. */
> 1513		if (huge_pte_dirty(pteval))
  1514			folio_mark_dirty(folio);
  1515	
  1516		/* Update high watermark before we lower rss */
  1517		update_hiwater_rss(mm);
  1518	
  1519		/* Poisoned hugetlb folio with TTU_HWPOISON always cleared in flags */
  1520		pteval = swp_entry_to_pte(make_hwpoison_entry(&folio->page));
  1521		set_huge_pte_at(mm, address, pvmw.pte, pteval);
  1522		hugetlb_count_sub(folio_nr_pages(folio), mm);
  1523	
  1524		/*
  1525		 * No need to call mmu_notifier_invalidate_range() it has be
  1526		 * done above for all cases requiring it to happen under page
  1527		 * table lock before mmu_notifier_invalidate_range_end()
  1528		 *
  1529		 * See Documentation/mm/mmu_notifier.rst
  1530		 */
  1531		page_remove_rmap(&folio->page, vma, true);
  1532		/* No VM_LOCKED set in vma->vm_flags for hugetlb. So not
  1533		 * necessary to call mlock_drain_local().
  1534		 */
  1535		folio_put(folio);
  1536	
  1537	out:
  1538		return ret;
  1539	}
  1540	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
