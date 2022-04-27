Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5CE80C
	for <llvm@lists.linux.dev>; Wed, 27 Apr 2022 09:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651052200; x=1682588200;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fk8Yes/AHHg9ZQbQlKb+2tNG+tE6888tyUeW4YajyiY=;
  b=Q+lvnrwnM6loDURRjGgJ1UCC17MSvZ1Yl9DHaS3hLKBjnKd1PgH0zVDl
   USKK+LdpU+6qvqxuM/buWgPXL4dcYXkSkzi3CyicYdF0crzB4nIeZMUON
   mGlNISgj2GTaXlFSESu0RGT5cmxmF9mbV2ZjwPOtAOcitjIqP7bFZ8v5/
   VL33ly0uthIB/yxO4tSJRV5L6xVV9jg+iSxijfDWbB/qHCFm01GCVOcY0
   k2sIpC/J7Q2NQ67TdgxcoOzvEQzdDra61KGx9zVsAshO3hIDrh/5XOuqp
   AvXW7fw9G27JQmPkRYDfaiF1PVzUIaHKGLhbEDFFFKStJ/Jhj6amutsdD
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="265684789"
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; 
   d="scan'208";a="265684789"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2022 02:36:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; 
   d="scan'208";a="807951067"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 27 Apr 2022 02:36:36 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nje67-0004Yq-Ka;
	Wed, 27 Apr 2022 09:36:35 +0000
Date: Wed, 27 Apr 2022 17:36:08 +0800
From: kernel test robot <lkp@intel.com>
To: Xu Yu <xuyu@linux.alibaba.com>, linux-mm@kvack.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	akpm@linux-foundation.org, naoya.horiguchi@nec.com,
	shy828301@gmail.com
Subject: Re: [PATCH 2/2] mm/huge_memory: do not overkill when splitting
 huge_zero_page
Message-ID: <202204271706.mGX6CwrT-lkp@intel.com>
References: <d4fab301a5debd792527696add16132f53a80cc9.1651039624.git.xuyu@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d4fab301a5debd792527696add16132f53a80cc9.1651039624.git.xuyu@linux.alibaba.com>

Hi Xu,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on hnaz-mm/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Xu-Yu/mm-memory-failure-rework-fix-on-huge_zero_page-splitting/20220427-141253
base:   https://github.com/hnaz/linux-mm master
config: i386-randconfig-a003-20220425 (https://download.01.org/0day-ci/archive/20220427/202204271706.mGX6CwrT-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcfdc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/988ec6e274e00e5706be7590a4a39427fbe856b1
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Xu-Yu/mm-memory-failure-rework-fix-on-huge_zero_page-splitting/20220427-141253
        git checkout 988ec6e274e00e5706be7590a4a39427fbe856b1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> mm/huge_memory.c:2553:2: error: statement requires expression of scalar type ('void' invalid)
           if (VM_WARN_ON_ONCE_PAGE(is_huge_zero_page(head), head))
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +2553 mm/huge_memory.c

  2519	
  2520	/*
  2521	 * This function splits huge page into normal pages. @page can point to any
  2522	 * subpage of huge page to split. Split doesn't change the position of @page.
  2523	 *
  2524	 * Only caller must hold pin on the @page, otherwise split fails with -EBUSY.
  2525	 * The huge page must be locked.
  2526	 *
  2527	 * If @list is null, tail pages will be added to LRU list, otherwise, to @list.
  2528	 *
  2529	 * Both head page and tail pages will inherit mapping, flags, and so on from
  2530	 * the hugepage.
  2531	 *
  2532	 * GUP pin and PG_locked transferred to @page. Rest subpages can be freed if
  2533	 * they are not mapped.
  2534	 *
  2535	 * Returns 0 if the hugepage is split successfully.
  2536	 * Returns -EBUSY if the page is pinned or if anon_vma disappeared from under
  2537	 * us.
  2538	 */
  2539	int split_huge_page_to_list(struct page *page, struct list_head *list)
  2540	{
  2541		struct folio *folio = page_folio(page);
  2542		struct page *head = &folio->page;
  2543		struct deferred_split *ds_queue = get_deferred_split_queue(head);
  2544		XA_STATE(xas, &head->mapping->i_pages, head->index);
  2545		struct anon_vma *anon_vma = NULL;
  2546		struct address_space *mapping = NULL;
  2547		int extra_pins, ret;
  2548		pgoff_t end;
  2549	
  2550		VM_BUG_ON_PAGE(!PageLocked(head), head);
  2551		VM_BUG_ON_PAGE(!PageCompound(head), head);
  2552	
> 2553		if (VM_WARN_ON_ONCE_PAGE(is_huge_zero_page(head), head))
  2554			return -EBUSY;
  2555	
  2556		if (PageWriteback(head))
  2557			return -EBUSY;
  2558	
  2559		if (PageAnon(head)) {
  2560			/*
  2561			 * The caller does not necessarily hold an mmap_lock that would
  2562			 * prevent the anon_vma disappearing so we first we take a
  2563			 * reference to it and then lock the anon_vma for write. This
  2564			 * is similar to folio_lock_anon_vma_read except the write lock
  2565			 * is taken to serialise against parallel split or collapse
  2566			 * operations.
  2567			 */
  2568			anon_vma = page_get_anon_vma(head);
  2569			if (!anon_vma) {
  2570				ret = -EBUSY;
  2571				goto out;
  2572			}
  2573			end = -1;
  2574			mapping = NULL;
  2575			anon_vma_lock_write(anon_vma);
  2576		} else {
  2577			mapping = head->mapping;
  2578	
  2579			/* Truncated ? */
  2580			if (!mapping) {
  2581				ret = -EBUSY;
  2582				goto out;
  2583			}
  2584	
  2585			xas_split_alloc(&xas, head, compound_order(head),
  2586					mapping_gfp_mask(mapping) & GFP_RECLAIM_MASK);
  2587			if (xas_error(&xas)) {
  2588				ret = xas_error(&xas);
  2589				goto out;
  2590			}
  2591	
  2592			anon_vma = NULL;
  2593			i_mmap_lock_read(mapping);
  2594	
  2595			/*
  2596			 *__split_huge_page() may need to trim off pages beyond EOF:
  2597			 * but on 32-bit, i_size_read() takes an irq-unsafe seqlock,
  2598			 * which cannot be nested inside the page tree lock. So note
  2599			 * end now: i_size itself may be changed at any moment, but
  2600			 * head page lock is good enough to serialize the trimming.
  2601			 */
  2602			end = DIV_ROUND_UP(i_size_read(mapping->host), PAGE_SIZE);
  2603			if (shmem_mapping(mapping))
  2604				end = shmem_fallocend(mapping->host, end);
  2605		}
  2606	
  2607		/*
  2608		 * Racy check if we can split the page, before unmap_page() will
  2609		 * split PMDs
  2610		 */
  2611		if (!can_split_folio(folio, &extra_pins)) {
  2612			ret = -EBUSY;
  2613			goto out_unlock;
  2614		}
  2615	
  2616		unmap_page(head);
  2617	
  2618		/* block interrupt reentry in xa_lock and spinlock */
  2619		local_irq_disable();
  2620		if (mapping) {
  2621			/*
  2622			 * Check if the head page is present in page cache.
  2623			 * We assume all tail are present too, if head is there.
  2624			 */
  2625			xas_lock(&xas);
  2626			xas_reset(&xas);
  2627			if (xas_load(&xas) != head)
  2628				goto fail;
  2629		}
  2630	
  2631		/* Prevent deferred_split_scan() touching ->_refcount */
  2632		spin_lock(&ds_queue->split_queue_lock);
  2633		if (page_ref_freeze(head, 1 + extra_pins)) {
  2634			if (!list_empty(page_deferred_list(head))) {
  2635				ds_queue->split_queue_len--;
  2636				list_del(page_deferred_list(head));
  2637			}
  2638			spin_unlock(&ds_queue->split_queue_lock);
  2639			if (mapping) {
  2640				int nr = thp_nr_pages(head);
  2641	
  2642				xas_split(&xas, head, thp_order(head));
  2643				if (PageSwapBacked(head)) {
  2644					__mod_lruvec_page_state(head, NR_SHMEM_THPS,
  2645								-nr);
  2646				} else {
  2647					__mod_lruvec_page_state(head, NR_FILE_THPS,
  2648								-nr);
  2649					filemap_nr_thps_dec(mapping);
  2650				}
  2651			}
  2652	
  2653			__split_huge_page(page, list, end);
  2654			ret = 0;
  2655		} else {
  2656			spin_unlock(&ds_queue->split_queue_lock);
  2657	fail:
  2658			if (mapping)
  2659				xas_unlock(&xas);
  2660			local_irq_enable();
  2661			remap_page(folio, folio_nr_pages(folio));
  2662			ret = -EBUSY;
  2663		}
  2664	
  2665	out_unlock:
  2666		if (anon_vma) {
  2667			anon_vma_unlock_write(anon_vma);
  2668			put_anon_vma(anon_vma);
  2669		}
  2670		if (mapping)
  2671			i_mmap_unlock_read(mapping);
  2672	out:
  2673		/* Free any memory we didn't use */
  2674		xas_nomem(&xas, 0);
  2675		count_vm_event(!ret ? THP_SPLIT_PAGE : THP_SPLIT_PAGE_FAILED);
  2676		return ret;
  2677	}
  2678	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
