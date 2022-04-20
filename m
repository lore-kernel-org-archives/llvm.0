Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018AA7A
	for <llvm@lists.linux.dev>; Wed, 20 Apr 2022 05:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650434231; x=1681970231;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CZ1JOJ+mMeulFOggpIddH8bXOC+ND2fBiLTwfYR+CQk=;
  b=S9KKVrPnfIvLIvnlvICJCKXCQ6pIdIwzF0UYDpUJJgytbKU3LJUwKIB1
   sB4TWcvLqHJ8GiHYnH0wrU8gUF4EqzeX/CFD6syxzEPBibgo/WdPvP+Tp
   n4DwBE1JAd9SXnMcFOpshmTHsMObPAXjc78WiaSjkFggbyILcCg0n19uS
   y++zZFTPmtcUYNq4sHDmae3hg16rJr+2NLOi9i1daOAlBFS/uHblfsE5v
   Zu03UdoVeOooB7HJwjVKRqAvdTUvtoDCcfVYwyMzTAoq2VvxIQzAxsexF
   pBSardv4LhQcA4KBPy8KzhaHyvnNGGhehRB/rGG/M35ZkrwKmk6ULsZvo
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="289050796"
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400"; 
   d="scan'208";a="289050796"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2022 22:57:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400"; 
   d="scan'208";a="727350040"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 19 Apr 2022 22:57:06 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nh3Kr-0006dF-NC;
	Wed, 20 Apr 2022 05:57:05 +0000
Date: Wed, 20 Apr 2022 13:56:34 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Xu <peterx@redhat.com>, Miaohe Lin <linmiaohe@huawei.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	akpm@linux-foundation.org, willy@infradead.org, vbabka@suse.cz,
	dhowells@redhat.com, neilb@suse.de, david@redhat.com,
	apopple@nvidia.com, surenb@google.com, minchan@kernel.org,
	sfr@canb.auug.org.au, rcampbell@nvidia.com, naoya.horiguchi@nec.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/swap: Fix lost swap bits in unuse_pte()
Message-ID: <202204201313.QYiDBRbL-lkp@intel.com>
References: <Yl8rZkhU/B0iE2ob@xz-m1.local>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yl8rZkhU/B0iE2ob@xz-m1.local>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Peter,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on hnaz-mm/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Xu/mm-swap-Fix-lost-swap-bits-in-unuse_pte/20220420-053845
base:   https://github.com/hnaz/linux-mm master
config: s390-randconfig-r023-20220420 (https://download.01.org/0day-ci/archive/20220420/202204201313.QYiDBRbL-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project bac6cd5bf85669e3376610cfc4c4f9ca015e7b9b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/355ac3eb45402f7aab25b76af029d4390af05238
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Peter-Xu/mm-swap-Fix-lost-swap-bits-in-unuse_pte/20220420-053845
        git checkout 355ac3eb45402f7aab25b76af029d4390af05238
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> mm/swapfile.c:1824:2: error: use of undeclared identifier 'new_pte'; did you mean 'newpte'?
           new_pte = pte_mkold(mk_pte(page, vma->vm_page_prot));
           ^~~~~~~
           newpte
   mm/swapfile.c:1786:14: note: 'newpte' declared here
           pte_t *pte, newpte;
                       ^
   mm/swapfile.c:1826:26: error: use of undeclared identifier 'new_pte'
                   pte = pte_mksoft_dirty(new_pte);
                                          ^
   mm/swapfile.c:1828:23: error: use of undeclared identifier 'new_pte'
                   pte = pte_mkuffd_wp(new_pte);
                                       ^
   mm/swapfile.c:1829:36: error: use of undeclared identifier 'new_pte'; did you mean 'newpte'?
           set_pte_at(vma->vm_mm, addr, pte, new_pte);
                                             ^~~~~~~
                                             newpte
   mm/swapfile.c:1786:14: note: 'newpte' declared here
           pte_t *pte, newpte;
                       ^
   4 errors generated.


vim +1824 mm/swapfile.c

  1775	
  1776	/*
  1777	 * No need to decide whether this PTE shares the swap entry with others,
  1778	 * just let do_wp_page work it out if a write is requested later - to
  1779	 * force COW, vm_page_prot omits write permission from any private vma.
  1780	 */
  1781	static int unuse_pte(struct vm_area_struct *vma, pmd_t *pmd,
  1782			unsigned long addr, swp_entry_t entry, struct page *page)
  1783	{
  1784		struct page *swapcache;
  1785		spinlock_t *ptl;
  1786		pte_t *pte, newpte;
  1787		int ret = 1;
  1788	
  1789		swapcache = page;
  1790		page = ksm_might_need_to_copy(page, vma, addr);
  1791		if (unlikely(!page))
  1792			return -ENOMEM;
  1793	
  1794		pte = pte_offset_map_lock(vma->vm_mm, pmd, addr, &ptl);
  1795		if (unlikely(!pte_same_as_swp(*pte, swp_entry_to_pte(entry)))) {
  1796			ret = 0;
  1797			goto out;
  1798		}
  1799	
  1800		/* See do_swap_page() */
  1801		BUG_ON(!PageAnon(page) && PageMappedToDisk(page));
  1802		BUG_ON(PageAnon(page) && PageAnonExclusive(page));
  1803	
  1804		dec_mm_counter(vma->vm_mm, MM_SWAPENTS);
  1805		inc_mm_counter(vma->vm_mm, MM_ANONPAGES);
  1806		get_page(page);
  1807		if (page == swapcache) {
  1808			rmap_t rmap_flags = RMAP_NONE;
  1809	
  1810			/*
  1811			 * See do_swap_page(): PageWriteback() would be problematic.
  1812			 * However, we do a wait_on_page_writeback() just before this
  1813			 * call and have the page locked.
  1814			 */
  1815			VM_BUG_ON_PAGE(PageWriteback(page), page);
  1816			if (pte_swp_exclusive(*pte))
  1817				rmap_flags |= RMAP_EXCLUSIVE;
  1818	
  1819			page_add_anon_rmap(page, vma, addr, rmap_flags);
  1820		} else { /* ksm created a completely new copy */
  1821			page_add_new_anon_rmap(page, vma, addr);
  1822			lru_cache_add_inactive_or_unevictable(page, vma);
  1823		}
> 1824		new_pte = pte_mkold(mk_pte(page, vma->vm_page_prot));
  1825		if (pte_swp_soft_dirty(*pte))
  1826			pte = pte_mksoft_dirty(new_pte);
  1827		if (pte_swp_uffd_wp(*pte))
  1828			pte = pte_mkuffd_wp(new_pte);
  1829		set_pte_at(vma->vm_mm, addr, pte, new_pte);
  1830		swap_free(entry);
  1831	out:
  1832		pte_unmap_unlock(pte, ptl);
  1833		if (page != swapcache) {
  1834			unlock_page(page);
  1835			put_page(page);
  1836		}
  1837		return ret;
  1838	}
  1839	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
