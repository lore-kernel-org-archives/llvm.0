Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53F42F28
	for <llvm@lists.linux.dev>; Mon,  7 Feb 2022 14:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644244053; x=1675780053;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IaRhJb/4483DB5UGQjNfvVUj2hindG4knDJnqwvrS7U=;
  b=MTYOKC+Y+EtzPhSQlahY/Cww6xpo/bIRb4ynpsDcOzsaqu0HrYNS6GrX
   lOAfXO6mAl7wFYogzcWzbtYm/CWW92IAhlpNU3507V8mQvKRfQwlKt5YM
   6OuvVBMz7/MX9jjSc4+nvQIPvXpjFxAdKOPJnU+VdKjxdTkYGoJFVX1d0
   RkZ5EBzgB1Ys6eTUIpq5HLAc6ZCSYa5FI+115ic4azVgc+ZWHdxNlGbjb
   4BMaiN2vTS8/HqbUoQ1DDHTvf3084b9/hglFB42wyz/6VO95LyUFcZCto
   KETDZF0l2BEhaQsRnAJVPefTdH1sCrEqaWNhr7rln4KxVdBj4bcD2Dtqk
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="247561202"
X-IronPort-AV: E=Sophos;i="5.88,350,1635231600"; 
   d="scan'208";a="247561202"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2022 06:27:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,350,1635231600"; 
   d="scan'208";a="525151374"
Received: from lkp-server01.sh.intel.com (HELO 9dd77a123018) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 07 Feb 2022 06:27:31 -0800
Received: from kbuild by 9dd77a123018 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nH4zK-0000bm-TM; Mon, 07 Feb 2022 14:27:30 +0000
Date: Mon, 7 Feb 2022 22:26:53 +0800
From: kernel test robot <lkp@intel.com>
To: NeilBrown <neilb@suse.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH 01/21] MM: create new mm/swap.h header file.
Message-ID: <202202072219.lW7FXue8-lkp@intel.com>
References: <164420916109.29374.8959231877111146366.stgit@noble.brown>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <164420916109.29374.8959231877111146366.stgit@noble.brown>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi NeilBrown,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on trondmy-nfs/linux-next]
[also build test ERROR on hnaz-mm/master cifs/for-next linus/master v5.17-rc3 next-20220207]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/NeilBrown/Repair-SWAP-over_NFS/20220207-125206
base:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
config: x86_64-randconfig-a002-20220207 (https://download.01.org/0day-ci/archive/20220207/202202072219.lW7FXue8-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0d8850ae2cae85d49bea6ae0799fa41c7202c05c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/06d2bcb84187037252a0f764881ab51965e931ea
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review NeilBrown/Repair-SWAP-over_NFS/20220207-125206
        git checkout 06d2bcb84187037252a0f764881ab51965e931ea
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> mm/huge_memory.c:2423:16: error: implicit declaration of function 'swap_address_space' [-Werror,-Wimplicit-function-declaration]
                   swap_cache = swap_address_space(entry);
                                ^
   mm/huge_memory.c:2423:14: warning: incompatible integer to pointer conversion assigning to 'struct address_space *' from 'int' [-Wint-conversion]
                   swap_cache = swap_address_space(entry);
                              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +/swap_address_space +2423 mm/huge_memory.c

e9b61f19858a5d Kirill A. Shutemov      2016-01-15  2404  
baa355fd331424 Kirill A. Shutemov      2016-07-26  2405  static void __split_huge_page(struct page *page, struct list_head *list,
b6769834aac1d4 Alex Shi                2020-12-15  2406  		pgoff_t end)
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  2407  {
e809c3fedeeb80 Matthew Wilcox (Oracle  2021-06-28  2408) 	struct folio *folio = page_folio(page);
e809c3fedeeb80 Matthew Wilcox (Oracle  2021-06-28  2409) 	struct page *head = &folio->page;
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  2410  	struct lruvec *lruvec;
4101196b19d7f9 Matthew Wilcox (Oracle  2019-09-23  2411) 	struct address_space *swap_cache = NULL;
4101196b19d7f9 Matthew Wilcox (Oracle  2019-09-23  2412) 	unsigned long offset = 0;
8cce54756806e5 Kirill A. Shutemov      2020-10-15  2413  	unsigned int nr = thp_nr_pages(head);
8df651c7059e79 Kirill A. Shutemov      2016-03-15  2414  	int i;
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  2415  
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  2416  	/* complete memcg works before add pages to LRU */
be6c8982e4ab9a Zhou Guanghui           2021-03-12  2417  	split_page_memcg(head, nr);
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  2418  
4101196b19d7f9 Matthew Wilcox (Oracle  2019-09-23  2419) 	if (PageAnon(head) && PageSwapCache(head)) {
4101196b19d7f9 Matthew Wilcox (Oracle  2019-09-23  2420) 		swp_entry_t entry = { .val = page_private(head) };
4101196b19d7f9 Matthew Wilcox (Oracle  2019-09-23  2421) 
4101196b19d7f9 Matthew Wilcox (Oracle  2019-09-23  2422) 		offset = swp_offset(entry);
4101196b19d7f9 Matthew Wilcox (Oracle  2019-09-23 @2423) 		swap_cache = swap_address_space(entry);
4101196b19d7f9 Matthew Wilcox (Oracle  2019-09-23  2424) 		xa_lock(&swap_cache->i_pages);
4101196b19d7f9 Matthew Wilcox (Oracle  2019-09-23  2425) 	}
4101196b19d7f9 Matthew Wilcox (Oracle  2019-09-23  2426) 
f0953a1bbaca71 Ingo Molnar             2021-05-06  2427  	/* lock lru list/PageCompound, ref frozen by page_ref_freeze */
e809c3fedeeb80 Matthew Wilcox (Oracle  2021-06-28  2428) 	lruvec = folio_lruvec_lock(folio);
b6769834aac1d4 Alex Shi                2020-12-15  2429  
eac96c3efdb593 Yang Shi                2021-10-28  2430  	ClearPageHasHWPoisoned(head);
eac96c3efdb593 Yang Shi                2021-10-28  2431  
8cce54756806e5 Kirill A. Shutemov      2020-10-15  2432  	for (i = nr - 1; i >= 1; i--) {
8df651c7059e79 Kirill A. Shutemov      2016-03-15  2433  		__split_huge_page_tail(head, i, lruvec, list);
d144bf6205342a Hugh Dickins            2021-09-02  2434  		/* Some pages can be beyond EOF: drop them from page cache */
baa355fd331424 Kirill A. Shutemov      2016-07-26  2435  		if (head[i].index >= end) {
2d077d4b59924a Hugh Dickins            2018-06-01  2436  			ClearPageDirty(head + i);
baa355fd331424 Kirill A. Shutemov      2016-07-26  2437  			__delete_from_page_cache(head + i, NULL);
d144bf6205342a Hugh Dickins            2021-09-02  2438  			if (shmem_mapping(head->mapping))
800d8c63b2e989 Kirill A. Shutemov      2016-07-26  2439  				shmem_uncharge(head->mapping->host, 1);
baa355fd331424 Kirill A. Shutemov      2016-07-26  2440  			put_page(head + i);
4101196b19d7f9 Matthew Wilcox (Oracle  2019-09-23  2441) 		} else if (!PageAnon(page)) {
4101196b19d7f9 Matthew Wilcox (Oracle  2019-09-23  2442) 			__xa_store(&head->mapping->i_pages, head[i].index,
4101196b19d7f9 Matthew Wilcox (Oracle  2019-09-23  2443) 					head + i, 0);
4101196b19d7f9 Matthew Wilcox (Oracle  2019-09-23  2444) 		} else if (swap_cache) {
4101196b19d7f9 Matthew Wilcox (Oracle  2019-09-23  2445) 			__xa_store(&swap_cache->i_pages, offset + i,
4101196b19d7f9 Matthew Wilcox (Oracle  2019-09-23  2446) 					head + i, 0);
baa355fd331424 Kirill A. Shutemov      2016-07-26  2447  		}
baa355fd331424 Kirill A. Shutemov      2016-07-26  2448  	}
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  2449  
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  2450  	ClearPageCompound(head);
6168d0da2b479c Alex Shi                2020-12-15  2451  	unlock_page_lruvec(lruvec);
b6769834aac1d4 Alex Shi                2020-12-15  2452  	/* Caller disabled irqs, so they are still disabled here */
f7da677bc6e720 Vlastimil Babka         2019-08-24  2453  
8cce54756806e5 Kirill A. Shutemov      2020-10-15  2454  	split_page_owner(head, nr);
f7da677bc6e720 Vlastimil Babka         2019-08-24  2455  
baa355fd331424 Kirill A. Shutemov      2016-07-26  2456  	/* See comment in __split_huge_page_tail() */
baa355fd331424 Kirill A. Shutemov      2016-07-26  2457  	if (PageAnon(head)) {
aa5dc07f70c50a Matthew Wilcox          2017-12-04  2458  		/* Additional pin to swap cache */
4101196b19d7f9 Matthew Wilcox (Oracle  2019-09-23  2459) 		if (PageSwapCache(head)) {
38d8b4e6bdc872 Huang Ying              2017-07-06  2460  			page_ref_add(head, 2);
4101196b19d7f9 Matthew Wilcox (Oracle  2019-09-23  2461) 			xa_unlock(&swap_cache->i_pages);
4101196b19d7f9 Matthew Wilcox (Oracle  2019-09-23  2462) 		} else {
baa355fd331424 Kirill A. Shutemov      2016-07-26  2463  			page_ref_inc(head);
4101196b19d7f9 Matthew Wilcox (Oracle  2019-09-23  2464) 		}
baa355fd331424 Kirill A. Shutemov      2016-07-26  2465  	} else {
aa5dc07f70c50a Matthew Wilcox          2017-12-04  2466  		/* Additional pin to page cache */
baa355fd331424 Kirill A. Shutemov      2016-07-26  2467  		page_ref_add(head, 2);
b93b016313b3ba Matthew Wilcox          2018-04-10  2468  		xa_unlock(&head->mapping->i_pages);
baa355fd331424 Kirill A. Shutemov      2016-07-26  2469  	}
b6769834aac1d4 Alex Shi                2020-12-15  2470  	local_irq_enable();
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  2471  
8cce54756806e5 Kirill A. Shutemov      2020-10-15  2472  	remap_page(head, nr);
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  2473  
c4f9c701f9b442 Huang Ying              2020-10-15  2474  	if (PageSwapCache(head)) {
c4f9c701f9b442 Huang Ying              2020-10-15  2475  		swp_entry_t entry = { .val = page_private(head) };
c4f9c701f9b442 Huang Ying              2020-10-15  2476  
c4f9c701f9b442 Huang Ying              2020-10-15  2477  		split_swap_cluster(entry);
c4f9c701f9b442 Huang Ying              2020-10-15  2478  	}
c4f9c701f9b442 Huang Ying              2020-10-15  2479  
8cce54756806e5 Kirill A. Shutemov      2020-10-15  2480  	for (i = 0; i < nr; i++) {
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  2481  		struct page *subpage = head + i;
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  2482  		if (subpage == page)
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  2483  			continue;
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  2484  		unlock_page(subpage);
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  2485  
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  2486  		/*
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  2487  		 * Subpages may be freed if there wasn't any mapping
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  2488  		 * like if add_to_swap() is running on a lru page that
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  2489  		 * had its mapping zapped. And freeing these pages
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  2490  		 * requires taking the lru_lock so we do the put_page
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  2491  		 * of the tail pages after the split is complete.
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  2492  		 */
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  2493  		put_page(subpage);
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  2494  	}
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  2495  }
e9b61f19858a5d Kirill A. Shutemov      2016-01-15  2496  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
