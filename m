Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121027F
	for <llvm@lists.linux.dev>; Tue,  3 May 2022 18:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651601674; x=1683137674;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CkUbVgMn3QaLNmQO1nqEaaA73GKgcKzUSkDk3NSk0Fc=;
  b=k0bKEuBDanZYlERmYRE9ZyV3Z6sy7+yCxZ27EPE2WIx7U9SPCu664LgY
   Iv1DkyK9jKaX3cwupbGXfAermWklw2hXl8nBT/t5KtiXcSX5JTF8VLCxi
   qvl5sFUzUoILlVh4kYBM96U1FT1PC3wag4s5gmgg4xTdgSh47qH5yi59+
   r0tGj65GKpkGFx064Y48uolzNxcPkVvr1TEx4cA4VoIakggr6watg79yf
   klHoR5Qp67WIvTUS64eGE9WEfLDUJbzKvl6UIrheXrzp4CcWC9WPMOR9X
   aPSc57aW2Fr/NB6BogUip5BPV/nr7Do28x5PS/7PeKpANJy+iMKE6u+1u
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="330536562"
X-IronPort-AV: E=Sophos;i="5.91,195,1647327600"; 
   d="scan'208";a="330536562"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2022 11:14:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,195,1647327600"; 
   d="scan'208";a="547716592"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 03 May 2022 11:14:21 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nlx2S-000AhE-CX;
	Tue, 03 May 2022 18:14:20 +0000
Date: Wed, 4 May 2022 02:13:50 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 7462/8237] mm/shmem.c:1704:7: warning: variable
 'folio' is used uninitialized whenever 'if' condition is true
Message-ID: <202205040210.LYv9gMu9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   44a2f39e611ac0bc1f17c288a583d7f2e5684aa7
commit: 2b58b3f33ba268c00aa7181e203c58fab6661751 [7462/8237] mm/shmem: convert shmem_swapin_page() to shmem_swapin_folio()
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20220504/202205040210.LYv9gMu9-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 363b3a645a1e30011cc8da624f13dac5fd915628)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=2b58b3f33ba268c00aa7181e203c58fab6661751
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 2b58b3f33ba268c00aa7181e203c58fab6661751
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> mm/shmem.c:1704:7: warning: variable 'folio' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
                   if (!page) {
                       ^~~~~
   mm/shmem.c:1761:6: note: uninitialized use occurs here
           if (folio) {
               ^~~~~
   mm/shmem.c:1704:3: note: remove the 'if' if its condition is always false
                   if (!page) {
                   ^~~~~~~~~~~~
   mm/shmem.c:1685:21: note: initialize the variable 'folio' to silence this warning
           struct folio *folio;
                              ^
                               = NULL
   1 warning generated.


vim +1704 mm/shmem.c

bde05d1ccd5126 Hugh Dickins            2012-05-29  1669  
^1da177e4c3f41 Linus Torvalds          2005-04-16  1670  /*
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1671   * Swap in the page pointed to by *pagep.
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1672   * Caller has to make sure that *pagep contains a valid swapped page.
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1673   * Returns 0 and the page in pagep if success. On failure, returns the
af44c12fe7c970 Randy Dunlap            2020-08-11  1674   * error code and NULL in *pagep.
^1da177e4c3f41 Linus Torvalds          2005-04-16  1675   */
2b58b3f33ba268 Matthew Wilcox (Oracle  2022-04-29  1676) static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
2b58b3f33ba268 Matthew Wilcox (Oracle  2022-04-29  1677) 			     struct folio **foliop, enum sgp_type sgp,
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1678  			     gfp_t gfp, struct vm_area_struct *vma,
2b7403035459c7 Souptick Joarder        2018-08-23  1679  			     vm_fault_t *fault_type)
^1da177e4c3f41 Linus Torvalds          2005-04-16  1680  {
^1da177e4c3f41 Linus Torvalds          2005-04-16  1681  	struct address_space *mapping = inode->i_mapping;
23f919d4ad0eb3 Arnd Bergmann           2016-12-12  1682  	struct shmem_inode_info *info = SHMEM_I(inode);
04f94e3fbe1afc Dan Schatzberg          2021-06-28  1683  	struct mm_struct *charge_mm = vma ? vma->vm_mm : NULL;
2b58b3f33ba268 Matthew Wilcox (Oracle  2022-04-29  1684) 	struct page *page;
9a44f3462edc49 Matthew Wilcox (Oracle  2022-04-29  1685) 	struct folio *folio;
^1da177e4c3f41 Linus Torvalds          2005-04-16  1686  	swp_entry_t swap;
^1da177e4c3f41 Linus Torvalds          2005-04-16  1687  	int error;
66d2f4d28cd030 Hugh Dickins            2014-07-02  1688  
2b58b3f33ba268 Matthew Wilcox (Oracle  2022-04-29  1689) 	VM_BUG_ON(!*foliop || !xa_is_value(*foliop));
2b58b3f33ba268 Matthew Wilcox (Oracle  2022-04-29  1690) 	swap = radix_to_swp_entry(*foliop);
2b58b3f33ba268 Matthew Wilcox (Oracle  2022-04-29  1691) 	*foliop = NULL;
^1da177e4c3f41 Linus Torvalds          2005-04-16  1692  
^1da177e4c3f41 Linus Torvalds          2005-04-16  1693  	/* Look it up and read it in.. */
ec560175c0b6fc Huang Ying              2017-09-06  1694  	page = lookup_swap_cache(swap, NULL, 0);
27ab700626f048 Hugh Dickins            2011-07-25  1695  	if (!page) {
9e18eb29356b7d Andres Lagar-Cavilla    2016-05-19  1696  		/* Or update major stats only when swapin succeeds?? */
9e18eb29356b7d Andres Lagar-Cavilla    2016-05-19  1697  		if (fault_type) {
68da9f055755ee Hugh Dickins            2011-07-25  1698  			*fault_type |= VM_FAULT_MAJOR;
9e18eb29356b7d Andres Lagar-Cavilla    2016-05-19  1699  			count_vm_event(PGMAJFAULT);
2262185c5b287f Roman Gushchin          2017-07-06  1700  			count_memcg_event_mm(charge_mm, PGMAJFAULT);
9e18eb29356b7d Andres Lagar-Cavilla    2016-05-19  1701  		}
9e18eb29356b7d Andres Lagar-Cavilla    2016-05-19  1702  		/* Here we actually start the io */
41ffe5d5ceef7f Hugh Dickins            2011-08-03  1703  		page = shmem_swapin(swap, gfp, info, index);
27ab700626f048 Hugh Dickins            2011-07-25 @1704  		if (!page) {
^1da177e4c3f41 Linus Torvalds          2005-04-16  1705  			error = -ENOMEM;
54af60421822bb Hugh Dickins            2011-08-03  1706  			goto failed;
^1da177e4c3f41 Linus Torvalds          2005-04-16  1707  		}
^1da177e4c3f41 Linus Torvalds          2005-04-16  1708  	}
2b58b3f33ba268 Matthew Wilcox (Oracle  2022-04-29  1709) 	folio = page_folio(page);
^1da177e4c3f41 Linus Torvalds          2005-04-16  1710  
^1da177e4c3f41 Linus Torvalds          2005-04-16  1711  	/* We have to do this with page locked to prevent races */
2b58b3f33ba268 Matthew Wilcox (Oracle  2022-04-29  1712) 	folio_lock(folio);
2b58b3f33ba268 Matthew Wilcox (Oracle  2022-04-29  1713) 	if (!folio_test_swapcache(folio) ||
2b58b3f33ba268 Matthew Wilcox (Oracle  2022-04-29  1714) 	    folio_swap_entry(folio).val != swap.val ||
d189922862e03c Hugh Dickins            2012-07-11  1715  	    !shmem_confirm_swap(mapping, index, swap)) {
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1716  		error = -EEXIST;
d189922862e03c Hugh Dickins            2012-07-11  1717  		goto unlock;
bde05d1ccd5126 Hugh Dickins            2012-05-29  1718  	}
2b58b3f33ba268 Matthew Wilcox (Oracle  2022-04-29  1719) 	if (!folio_test_uptodate(folio)) {
^1da177e4c3f41 Linus Torvalds          2005-04-16  1720  		error = -EIO;
54af60421822bb Hugh Dickins            2011-08-03  1721  		goto failed;
^1da177e4c3f41 Linus Torvalds          2005-04-16  1722  	}
2b58b3f33ba268 Matthew Wilcox (Oracle  2022-04-29  1723) 	folio_wait_writeback(folio);
^1da177e4c3f41 Linus Torvalds          2005-04-16  1724  
8a84802e2a2b1a Steven Price            2020-05-13  1725  	/*
8a84802e2a2b1a Steven Price            2020-05-13  1726  	 * Some architectures may have to restore extra metadata to the
2b58b3f33ba268 Matthew Wilcox (Oracle  2022-04-29  1727) 	 * folio after reading from swap.
8a84802e2a2b1a Steven Price            2020-05-13  1728  	 */
2b58b3f33ba268 Matthew Wilcox (Oracle  2022-04-29  1729) 	arch_swap_restore(swap, folio);
8a84802e2a2b1a Steven Price            2020-05-13  1730  
8d657a77c6fe46 Matthew Wilcox (Oracle  2022-04-29  1731) 	if (shmem_should_replace_folio(folio, gfp)) {
bde05d1ccd5126 Hugh Dickins            2012-05-29  1732  		error = shmem_replace_page(&page, gfp, info, index);
bde05d1ccd5126 Hugh Dickins            2012-05-29  1733  		if (error)
54af60421822bb Hugh Dickins            2011-08-03  1734  			goto failed;
^1da177e4c3f41 Linus Torvalds          2005-04-16  1735  	}
27ab700626f048 Hugh Dickins            2011-07-25  1736  
9a44f3462edc49 Matthew Wilcox (Oracle  2022-04-29  1737) 	error = shmem_add_to_page_cache(folio, mapping, index,
3fea5a499d57de Johannes Weiner         2020-06-03  1738  					swp_to_radix_entry(swap), gfp,
3fea5a499d57de Johannes Weiner         2020-06-03  1739  					charge_mm);
3fea5a499d57de Johannes Weiner         2020-06-03  1740  	if (error)
54af60421822bb Hugh Dickins            2011-08-03  1741  		goto failed;
00501b531c4723 Johannes Weiner         2014-08-08  1742  
4595ef88d13613 Kirill A. Shutemov      2016-07-26  1743  	spin_lock_irq(&info->lock);
285b2c4fdd69ea Hugh Dickins            2011-08-03  1744  	info->swapped--;
54af60421822bb Hugh Dickins            2011-08-03  1745  	shmem_recalc_inode(inode);
4595ef88d13613 Kirill A. Shutemov      2016-07-26  1746  	spin_unlock_irq(&info->lock);
54af60421822bb Hugh Dickins            2011-08-03  1747  
66d2f4d28cd030 Hugh Dickins            2014-07-02  1748  	if (sgp == SGP_WRITE)
2b58b3f33ba268 Matthew Wilcox (Oracle  2022-04-29  1749) 		folio_mark_accessed(folio);
66d2f4d28cd030 Hugh Dickins            2014-07-02  1750  
2b58b3f33ba268 Matthew Wilcox (Oracle  2022-04-29  1751) 	delete_from_swap_cache(&folio->page);
2b58b3f33ba268 Matthew Wilcox (Oracle  2022-04-29  1752) 	folio_mark_dirty(folio);
27ab700626f048 Hugh Dickins            2011-07-25  1753  	swap_free(swap);
27ab700626f048 Hugh Dickins            2011-07-25  1754  
2b58b3f33ba268 Matthew Wilcox (Oracle  2022-04-29  1755) 	*foliop = folio;
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1756  	return 0;
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1757  failed:
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1758  	if (!shmem_confirm_swap(mapping, index, swap))
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1759  		error = -EEXIST;
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1760  unlock:
2b58b3f33ba268 Matthew Wilcox (Oracle  2022-04-29  1761) 	if (folio) {
2b58b3f33ba268 Matthew Wilcox (Oracle  2022-04-29  1762) 		folio_unlock(folio);
2b58b3f33ba268 Matthew Wilcox (Oracle  2022-04-29  1763) 		folio_put(folio);
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1764  	}
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1765  
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1766  	return error;
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1767  }
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1768  

:::::: The code at line 1704 was first introduced by commit
:::::: 27ab700626f048407e9466d389a43c7d3aa45967 tmpfs: simplify filepage/swappage

:::::: TO: Hugh Dickins <hughd@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
