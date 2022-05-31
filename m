Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499A420F1
	for <llvm@lists.linux.dev>; Tue, 31 May 2022 06:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653978121; x=1685514121;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OJB59SHnQ9L5ybsWDFMb1uJ4a6XSHniBIWBBViBGNbo=;
  b=OxlG60p82rSaiFbM1bZJYZK1NsFEagGrTVoyk4Wcu1LaONeFJTCXajvS
   KOVSj5O+8CJqIx0zRu+e7AirDV4H95CeMtPygJzwcQTMlaaq7rdUYCGAT
   EmBcsY89zAg+DUJ6jb8zPTK0v/PW34jrFC1atuuwt8lSZxWHC7S9AwOkd
   jVX7xTC7nW9cl6sxuIO++MrNNcPVBVEJOMJ2yMO+lEBsuP5yX8J8A4CcU
   dyRAGgUYkFkdb9KkY/kyTfiJcPUkw8+bCZvkrzQlVXgQZbcC/Bh1NUqqq
   agkzocAnSDs+inD19hfzy3kEigf3YrigDhDUEs5wM5HA53W/OidIWHKad
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10363"; a="255026757"
X-IronPort-AV: E=Sophos;i="5.91,264,1647327600"; 
   d="scan'208";a="255026757"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2022 23:22:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,264,1647327600"; 
   d="scan'208";a="611690143"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 30 May 2022 23:21:59 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nvvGQ-0002Py-Aw;
	Tue, 31 May 2022 06:21:58 +0000
Date: Tue, 31 May 2022 14:21:12 +0800
From: kernel test robot <lkp@intel.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC] mm/page_isolation: Fix an infinite loop in
 isolate_single_pageblock()
Message-ID: <202205311448.NLkd29GM-lkp@intel.com>
References: <20220530115027.123341-1-anshuman.khandual@arm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220530115027.123341-1-anshuman.khandual@arm.com>

Hi Anshuman,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Anshuman-Khandual/mm-page_isolation-Fix-an-infinite-loop-in-isolate_single_pageblock/20220530-195220
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
config: x86_64-randconfig-a016 (https://download.01.org/0day-ci/archive/20220531/202205311448.NLkd29GM-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c825abd6b0198fb088d9752f556a70705bc99dfd)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/13632aee393de39b7f25b163df4d9fd6a29e4061
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Anshuman-Khandual/mm-page_isolation-Fix-an-infinite-loop-in-isolate_single_pageblock/20220530-195220
        git checkout 13632aee393de39b7f25b163df4d9fd6a29e4061
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> mm/page_isolation.c:388:18: warning: unused variable 'nr_pages' [-Wunused-variable]
                           unsigned long nr_pages = compound_nr(page);
                                         ^
>> mm/page_isolation.c:390:18: warning: unused variable 'head_pfn' [-Wunused-variable]
                           unsigned long head_pfn = page_to_pfn(head);
                                         ^
   2 warnings generated.


vim +/nr_pages +388 mm/page_isolation.c

a5d76b54a3f3a4 KAMEZAWA Hiroyuki 2007-10-16  281  
b2c9e2fbba3253 Zi Yan            2022-05-12  282  /**
b2c9e2fbba3253 Zi Yan            2022-05-12  283   * isolate_single_pageblock() -- tries to isolate a pageblock that might be
b2c9e2fbba3253 Zi Yan            2022-05-12  284   * within a free or in-use page.
b2c9e2fbba3253 Zi Yan            2022-05-12  285   * @boundary_pfn:		pageblock-aligned pfn that a page might cross
88ee134320b831 Zi Yan            2022-05-24  286   * @flags:			isolation flags
b2c9e2fbba3253 Zi Yan            2022-05-12  287   * @gfp_flags:			GFP flags used for migrating pages
b2c9e2fbba3253 Zi Yan            2022-05-12  288   * @isolate_before:	isolate the pageblock before the boundary_pfn
b2c9e2fbba3253 Zi Yan            2022-05-12  289   *
b2c9e2fbba3253 Zi Yan            2022-05-12  290   * Free and in-use pages can be as big as MAX_ORDER-1 and contain more than one
b2c9e2fbba3253 Zi Yan            2022-05-12  291   * pageblock. When not all pageblocks within a page are isolated at the same
b2c9e2fbba3253 Zi Yan            2022-05-12  292   * time, free page accounting can go wrong. For example, in the case of
b2c9e2fbba3253 Zi Yan            2022-05-12  293   * MAX_ORDER-1 = pageblock_order + 1, a MAX_ORDER-1 page has two pagelbocks.
b2c9e2fbba3253 Zi Yan            2022-05-12  294   * [         MAX_ORDER-1         ]
b2c9e2fbba3253 Zi Yan            2022-05-12  295   * [  pageblock0  |  pageblock1  ]
b2c9e2fbba3253 Zi Yan            2022-05-12  296   * When either pageblock is isolated, if it is a free page, the page is not
b2c9e2fbba3253 Zi Yan            2022-05-12  297   * split into separate migratetype lists, which is supposed to; if it is an
b2c9e2fbba3253 Zi Yan            2022-05-12  298   * in-use page and freed later, __free_one_page() does not split the free page
b2c9e2fbba3253 Zi Yan            2022-05-12  299   * either. The function handles this by splitting the free page or migrating
b2c9e2fbba3253 Zi Yan            2022-05-12  300   * the in-use page then splitting the free page.
b2c9e2fbba3253 Zi Yan            2022-05-12  301   */
88ee134320b831 Zi Yan            2022-05-24  302  static int isolate_single_pageblock(unsigned long boundary_pfn, int flags,
9b209e557d698f Zi Yan            2022-05-26  303  			gfp_t gfp_flags, bool isolate_before, bool skip_isolation)
b2c9e2fbba3253 Zi Yan            2022-05-12  304  {
b2c9e2fbba3253 Zi Yan            2022-05-12  305  	unsigned char saved_mt;
b2c9e2fbba3253 Zi Yan            2022-05-12  306  	unsigned long start_pfn;
b2c9e2fbba3253 Zi Yan            2022-05-12  307  	unsigned long isolate_pageblock;
b2c9e2fbba3253 Zi Yan            2022-05-12  308  	unsigned long pfn;
b2c9e2fbba3253 Zi Yan            2022-05-12  309  	struct zone *zone;
88ee134320b831 Zi Yan            2022-05-24  310  	int ret;
b2c9e2fbba3253 Zi Yan            2022-05-12  311  
b2c9e2fbba3253 Zi Yan            2022-05-12  312  	VM_BUG_ON(!IS_ALIGNED(boundary_pfn, pageblock_nr_pages));
b2c9e2fbba3253 Zi Yan            2022-05-12  313  
b2c9e2fbba3253 Zi Yan            2022-05-12  314  	if (isolate_before)
b2c9e2fbba3253 Zi Yan            2022-05-12  315  		isolate_pageblock = boundary_pfn - pageblock_nr_pages;
b2c9e2fbba3253 Zi Yan            2022-05-12  316  	else
b2c9e2fbba3253 Zi Yan            2022-05-12  317  		isolate_pageblock = boundary_pfn;
b2c9e2fbba3253 Zi Yan            2022-05-12  318  
b2c9e2fbba3253 Zi Yan            2022-05-12  319  	/*
b2c9e2fbba3253 Zi Yan            2022-05-12  320  	 * scan at the beginning of MAX_ORDER_NR_PAGES aligned range to avoid
b2c9e2fbba3253 Zi Yan            2022-05-12  321  	 * only isolating a subset of pageblocks from a bigger than pageblock
b2c9e2fbba3253 Zi Yan            2022-05-12  322  	 * free or in-use page. Also make sure all to-be-isolated pageblocks
b2c9e2fbba3253 Zi Yan            2022-05-12  323  	 * are within the same zone.
b2c9e2fbba3253 Zi Yan            2022-05-12  324  	 */
b2c9e2fbba3253 Zi Yan            2022-05-12  325  	zone  = page_zone(pfn_to_page(isolate_pageblock));
b2c9e2fbba3253 Zi Yan            2022-05-12  326  	start_pfn  = max(ALIGN_DOWN(isolate_pageblock, MAX_ORDER_NR_PAGES),
b2c9e2fbba3253 Zi Yan            2022-05-12  327  				      zone->zone_start_pfn);
b2c9e2fbba3253 Zi Yan            2022-05-12  328  
b2c9e2fbba3253 Zi Yan            2022-05-12  329  	saved_mt = get_pageblock_migratetype(pfn_to_page(isolate_pageblock));
9b209e557d698f Zi Yan            2022-05-26  330  
9b209e557d698f Zi Yan            2022-05-26  331  	if (skip_isolation)
9b209e557d698f Zi Yan            2022-05-26  332  		VM_BUG_ON(!is_migrate_isolate(saved_mt));
9b209e557d698f Zi Yan            2022-05-26  333  	else {
88ee134320b831 Zi Yan            2022-05-24  334  		ret = set_migratetype_isolate(pfn_to_page(isolate_pageblock), saved_mt, flags,
88ee134320b831 Zi Yan            2022-05-24  335  				isolate_pageblock, isolate_pageblock + pageblock_nr_pages);
88ee134320b831 Zi Yan            2022-05-24  336  
88ee134320b831 Zi Yan            2022-05-24  337  		if (ret)
88ee134320b831 Zi Yan            2022-05-24  338  			return ret;
9b209e557d698f Zi Yan            2022-05-26  339  	}
b2c9e2fbba3253 Zi Yan            2022-05-12  340  
b2c9e2fbba3253 Zi Yan            2022-05-12  341  	/*
b2c9e2fbba3253 Zi Yan            2022-05-12  342  	 * Bail out early when the to-be-isolated pageblock does not form
b2c9e2fbba3253 Zi Yan            2022-05-12  343  	 * a free or in-use page across boundary_pfn:
b2c9e2fbba3253 Zi Yan            2022-05-12  344  	 *
b2c9e2fbba3253 Zi Yan            2022-05-12  345  	 * 1. isolate before boundary_pfn: the page after is not online
b2c9e2fbba3253 Zi Yan            2022-05-12  346  	 * 2. isolate after boundary_pfn: the page before is not online
b2c9e2fbba3253 Zi Yan            2022-05-12  347  	 *
b2c9e2fbba3253 Zi Yan            2022-05-12  348  	 * This also ensures correctness. Without it, when isolate after
b2c9e2fbba3253 Zi Yan            2022-05-12  349  	 * boundary_pfn and [start_pfn, boundary_pfn) are not online,
b2c9e2fbba3253 Zi Yan            2022-05-12  350  	 * __first_valid_page() will return unexpected NULL in the for loop
b2c9e2fbba3253 Zi Yan            2022-05-12  351  	 * below.
b2c9e2fbba3253 Zi Yan            2022-05-12  352  	 */
b2c9e2fbba3253 Zi Yan            2022-05-12  353  	if (isolate_before) {
b2c9e2fbba3253 Zi Yan            2022-05-12  354  		if (!pfn_to_online_page(boundary_pfn))
b2c9e2fbba3253 Zi Yan            2022-05-12  355  			return 0;
b2c9e2fbba3253 Zi Yan            2022-05-12  356  	} else {
b2c9e2fbba3253 Zi Yan            2022-05-12  357  		if (!pfn_to_online_page(boundary_pfn - 1))
b2c9e2fbba3253 Zi Yan            2022-05-12  358  			return 0;
b2c9e2fbba3253 Zi Yan            2022-05-12  359  	}
b2c9e2fbba3253 Zi Yan            2022-05-12  360  
b2c9e2fbba3253 Zi Yan            2022-05-12  361  	for (pfn = start_pfn; pfn < boundary_pfn;) {
b2c9e2fbba3253 Zi Yan            2022-05-12  362  		struct page *page = __first_valid_page(pfn, boundary_pfn - pfn);
b2c9e2fbba3253 Zi Yan            2022-05-12  363  
b2c9e2fbba3253 Zi Yan            2022-05-12  364  		VM_BUG_ON(!page);
b2c9e2fbba3253 Zi Yan            2022-05-12  365  		pfn = page_to_pfn(page);
b2c9e2fbba3253 Zi Yan            2022-05-12  366  		/*
b2c9e2fbba3253 Zi Yan            2022-05-12  367  		 * start_pfn is MAX_ORDER_NR_PAGES aligned, if there is any
b2c9e2fbba3253 Zi Yan            2022-05-12  368  		 * free pages in [start_pfn, boundary_pfn), its head page will
b2c9e2fbba3253 Zi Yan            2022-05-12  369  		 * always be in the range.
b2c9e2fbba3253 Zi Yan            2022-05-12  370  		 */
b2c9e2fbba3253 Zi Yan            2022-05-12  371  		if (PageBuddy(page)) {
b2c9e2fbba3253 Zi Yan            2022-05-12  372  			int order = buddy_order(page);
b2c9e2fbba3253 Zi Yan            2022-05-12  373  
86d28b0709279c Zi Yan            2022-05-26  374  			if (pfn + (1UL << order) > boundary_pfn) {
86d28b0709279c Zi Yan            2022-05-26  375  				/* free page changed before split, check it again */
86d28b0709279c Zi Yan            2022-05-26  376  				if (split_free_page(page, order, boundary_pfn - pfn))
86d28b0709279c Zi Yan            2022-05-26  377  					continue;
86d28b0709279c Zi Yan            2022-05-26  378  			}
86d28b0709279c Zi Yan            2022-05-26  379  
86d28b0709279c Zi Yan            2022-05-26  380  			pfn += 1UL << order;
b2c9e2fbba3253 Zi Yan            2022-05-12  381  			continue;
b2c9e2fbba3253 Zi Yan            2022-05-12  382  		}
b2c9e2fbba3253 Zi Yan            2022-05-12  383  		/*
b2c9e2fbba3253 Zi Yan            2022-05-12  384  		 * migrate compound pages then let the free page handling code
b2c9e2fbba3253 Zi Yan            2022-05-12  385  		 * above do the rest. If migration is not possible, just fail.
b2c9e2fbba3253 Zi Yan            2022-05-12  386  		 */
b2c9e2fbba3253 Zi Yan            2022-05-12  387  		if (PageCompound(page)) {
b2c9e2fbba3253 Zi Yan            2022-05-12 @388  			unsigned long nr_pages = compound_nr(page);
b2c9e2fbba3253 Zi Yan            2022-05-12  389  			struct page *head = compound_head(page);
b2c9e2fbba3253 Zi Yan            2022-05-12 @390  			unsigned long head_pfn = page_to_pfn(head);
b2c9e2fbba3253 Zi Yan            2022-05-12  391  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
