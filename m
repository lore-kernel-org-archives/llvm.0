Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F097F
	for <llvm@lists.linux.dev>; Tue,  3 May 2022 17:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651598602; x=1683134602;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ef4T+no/iI7o6wwX/7V02MZ3KP+/jnxftN+hnxSles0=;
  b=g21XeNWfz0aOBmZdvI+KH543F6/8oRobCmMl9DbCNHUbhAbX9EhIV5YI
   /Ka5RzZTW00ImkmDtPiH8usSTnnl7fApj8N9NcCKcjhfd/vD1EtN1s1rP
   ysCsdwyC4E7urcnP4D45XvVGVzA73o8L2klxdcP9zdTvaM/0RTsOWYbDG
   B6BgdGKlb4RdmXIijGUyoKApk2g6VaJyy52zmOSdYIIWEn2ZpQ2M8wRtM
   YAAnGD5RDhfG2WCwb9yxgiYoedQ1qK3w/s+4DAIGtxeZ7Qor5sJW/DxvG
   1uSZBZy3faF3dL/wFkntDq5GrgTVhirRRR5y7QhOVaTEdAMGUo0x1QA0I
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="266381894"
X-IronPort-AV: E=Sophos;i="5.91,195,1647327600"; 
   d="scan'208";a="266381894"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2022 10:23:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,195,1647327600"; 
   d="scan'208";a="547699540"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 03 May 2022 10:23:19 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nlwF4-000AeV-NL;
	Tue, 03 May 2022 17:23:18 +0000
Date: Wed, 4 May 2022 01:22:52 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 7459/8237] mm/shmem.c:2354:8: warning: variable
 'page' is uninitialized when used here
Message-ID: <202205040121.S0ILU2a8-lkp@intel.com>
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
commit: b0bb08b2d5f399369a906eff0287e64b531881d8 [7459/8237] mm/shmem: turn shmem_alloc_page() into shmem_alloc_folio()
config: x86_64-randconfig-a001 (https://download.01.org/0day-ci/archive/20220504/202205040121.S0ILU2a8-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 363b3a645a1e30011cc8da624f13dac5fd915628)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=b0bb08b2d5f399369a906eff0287e64b531881d8
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout b0bb08b2d5f399369a906eff0287e64b531881d8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> mm/shmem.c:2354:8: warning: variable 'page' is uninitialized when used here [-Wuninitialized]
                   if (!page)
                        ^~~~
   mm/shmem.c:2335:19: note: initialize the variable 'page' to silence this warning
           struct page *page;
                            ^
                             = NULL
   1 warning generated.


vim +/page +2354 mm/shmem.c

^1da177e4c3f41 Linus Torvalds          2005-04-16  2318  
3460f6e5c1ed94 Axel Rasmussen          2021-06-30  2319  #ifdef CONFIG_USERFAULTFD
3460f6e5c1ed94 Axel Rasmussen          2021-06-30  2320  int shmem_mfill_atomic_pte(struct mm_struct *dst_mm,
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2321  			   pmd_t *dst_pmd,
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2322  			   struct vm_area_struct *dst_vma,
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2323  			   unsigned long dst_addr,
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2324  			   unsigned long src_addr,
0b51a78cb242cd Peter Xu                2022-04-29  2325  			   bool zeropage, bool wp_copy,
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2326  			   struct page **pagep)
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2327  {
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2328  	struct inode *inode = file_inode(dst_vma->vm_file);
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2329  	struct shmem_inode_info *info = SHMEM_I(inode);
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2330  	struct address_space *mapping = inode->i_mapping;
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2331  	gfp_t gfp = mapping_gfp_mask(mapping);
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2332  	pgoff_t pgoff = linear_page_index(dst_vma, dst_addr);
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2333  	void *page_kaddr;
9a44f3462edc49 Matthew Wilcox (Oracle  2022-04-29  2334) 	struct folio *folio;
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2335  	struct page *page;
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2336  	int ret;
3460f6e5c1ed94 Axel Rasmussen          2021-06-30  2337  	pgoff_t max_off;
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2338  
7ed9d238c7dbb1 Axel Rasmussen          2021-05-14  2339  	if (!shmem_inode_acct_block(inode, 1)) {
7ed9d238c7dbb1 Axel Rasmussen          2021-05-14  2340  		/*
7ed9d238c7dbb1 Axel Rasmussen          2021-05-14  2341  		 * We may have got a page, returned -ENOENT triggering a retry,
7ed9d238c7dbb1 Axel Rasmussen          2021-05-14  2342  		 * and now we find ourselves with -ENOMEM. Release the page, to
7ed9d238c7dbb1 Axel Rasmussen          2021-05-14  2343  		 * avoid a BUG_ON in our caller.
7ed9d238c7dbb1 Axel Rasmussen          2021-05-14  2344  		 */
7ed9d238c7dbb1 Axel Rasmussen          2021-05-14  2345  		if (unlikely(*pagep)) {
7ed9d238c7dbb1 Axel Rasmussen          2021-05-14  2346  			put_page(*pagep);
7ed9d238c7dbb1 Axel Rasmussen          2021-05-14  2347  			*pagep = NULL;
7ed9d238c7dbb1 Axel Rasmussen          2021-05-14  2348  		}
7d64ae3ab648a9 Axel Rasmussen          2021-06-30  2349  		return -ENOMEM;
7ed9d238c7dbb1 Axel Rasmussen          2021-05-14  2350  	}
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2351  
cb658a453b9327 Andrea Arcangeli        2017-02-22  2352  	if (!*pagep) {
7d64ae3ab648a9 Axel Rasmussen          2021-06-30  2353  		ret = -ENOMEM;
4c27fe4c4c84f3 Mike Rapoport           2017-02-22 @2354  		if (!page)
0f0796945614b7 Mike Rapoport           2017-09-06  2355  			goto out_unacct_blocks;
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2356  
3460f6e5c1ed94 Axel Rasmussen          2021-06-30  2357  		if (!zeropage) {	/* COPY */
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2358  			page_kaddr = kmap_atomic(page);
8d10396342063c Mike Rapoport           2017-09-06  2359  			ret = copy_from_user(page_kaddr,
8d10396342063c Mike Rapoport           2017-09-06  2360  					     (const void __user *)src_addr,
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2361  					     PAGE_SIZE);
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2362  			kunmap_atomic(page_kaddr);
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2363  
c1e8d7c6a7a682 Michel Lespinasse       2020-06-08  2364  			/* fallback to copy_from_user outside mmap_lock */
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2365  			if (unlikely(ret)) {
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2366  				*pagep = page;
7d64ae3ab648a9 Axel Rasmussen          2021-06-30  2367  				ret = -ENOENT;
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2368  				/* don't free the page */
7d64ae3ab648a9 Axel Rasmussen          2021-06-30  2369  				goto out_unacct_blocks;
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2370  			}
19b482c29b6f38 Muchun Song             2022-03-22  2371  
19b482c29b6f38 Muchun Song             2022-03-22  2372  			flush_dcache_page(page);
3460f6e5c1ed94 Axel Rasmussen          2021-06-30  2373  		} else {		/* ZEROPAGE */
19b482c29b6f38 Muchun Song             2022-03-22  2374  			clear_user_highpage(page, dst_addr);
8d10396342063c Mike Rapoport           2017-09-06  2375  		}
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2376  	} else {
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2377  		page = *pagep;
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2378  		*pagep = NULL;
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2379  	}
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2380  
3460f6e5c1ed94 Axel Rasmussen          2021-06-30  2381  	VM_BUG_ON(PageLocked(page));
3460f6e5c1ed94 Axel Rasmussen          2021-06-30  2382  	VM_BUG_ON(PageSwapBacked(page));
9cc90c664a65f9 Andrea Arcangeli        2017-02-22  2383  	__SetPageLocked(page);
9cc90c664a65f9 Andrea Arcangeli        2017-02-22  2384  	__SetPageSwapBacked(page);
a425d3584e7e69 Andrea Arcangeli        2017-02-22  2385  	__SetPageUptodate(page);
9cc90c664a65f9 Andrea Arcangeli        2017-02-22  2386  
e2a50c1f64145a Andrea Arcangeli        2018-11-30  2387  	ret = -EFAULT;
e2a50c1f64145a Andrea Arcangeli        2018-11-30  2388  	max_off = DIV_ROUND_UP(i_size_read(inode), PAGE_SIZE);
3460f6e5c1ed94 Axel Rasmussen          2021-06-30  2389  	if (unlikely(pgoff >= max_off))
e2a50c1f64145a Andrea Arcangeli        2018-11-30  2390  		goto out_release;
e2a50c1f64145a Andrea Arcangeli        2018-11-30  2391  
9a44f3462edc49 Matthew Wilcox (Oracle  2022-04-29  2392) 	folio = page_folio(page);
9a44f3462edc49 Matthew Wilcox (Oracle  2022-04-29  2393) 	ret = shmem_add_to_page_cache(folio, mapping, pgoff, NULL,
3fea5a499d57de Johannes Weiner         2020-06-03  2394  				      gfp & GFP_RECLAIM_MASK, dst_mm);
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2395  	if (ret)
3fea5a499d57de Johannes Weiner         2020-06-03  2396  		goto out_release;
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2397  
7d64ae3ab648a9 Axel Rasmussen          2021-06-30  2398  	ret = mfill_atomic_install_pte(dst_mm, dst_pmd, dst_vma, dst_addr,
0b51a78cb242cd Peter Xu                2022-04-29  2399  				       page, true, wp_copy);
7d64ae3ab648a9 Axel Rasmussen          2021-06-30  2400  	if (ret)
7d64ae3ab648a9 Axel Rasmussen          2021-06-30  2401  		goto out_delete_from_cache;
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2402  
94b7cc01da5a3c Yang Shi                2020-04-20  2403  	spin_lock_irq(&info->lock);
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2404  	info->alloced++;
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2405  	inode->i_blocks += BLOCKS_PER_PAGE;
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2406  	shmem_recalc_inode(inode);
94b7cc01da5a3c Yang Shi                2020-04-20  2407  	spin_unlock_irq(&info->lock);
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2408  
e2a50c1f64145a Andrea Arcangeli        2018-11-30  2409  	unlock_page(page);
7d64ae3ab648a9 Axel Rasmussen          2021-06-30  2410  	return 0;
7d64ae3ab648a9 Axel Rasmussen          2021-06-30  2411  out_delete_from_cache:
e2a50c1f64145a Andrea Arcangeli        2018-11-30  2412  	delete_from_page_cache(page);
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2413  out_release:
9cc90c664a65f9 Andrea Arcangeli        2017-02-22  2414  	unlock_page(page);
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2415  	put_page(page);
4c27fe4c4c84f3 Mike Rapoport           2017-02-22  2416  out_unacct_blocks:
0f0796945614b7 Mike Rapoport           2017-09-06  2417  	shmem_inode_unacct_blocks(inode, 1);
7d64ae3ab648a9 Axel Rasmussen          2021-06-30  2418  	return ret;
8d10396342063c Mike Rapoport           2017-09-06  2419  }
3460f6e5c1ed94 Axel Rasmussen          2021-06-30  2420  #endif /* CONFIG_USERFAULTFD */
8d10396342063c Mike Rapoport           2017-09-06  2421  

:::::: The code at line 2354 was first introduced by commit
:::::: 4c27fe4c4c84f3afd504ecff2420cc1ad420d38e userfaultfd: shmem: add shmem_mcopy_atomic_pte for userfaultfd support

:::::: TO: Mike Rapoport <rppt@linux.vnet.ibm.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
