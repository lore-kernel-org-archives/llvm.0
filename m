Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03EC037D;
	Sat, 27 May 2023 01:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685152251; x=1716688251;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QROev6y9tThZJG8LiEBJMv6lN7++6W+EIgx81AqOb5Q=;
  b=dzog8RHJ2E7T07qGFAb1FeMHDQJc2E4mrKl9jhnfAz5ouOWpdwukUntE
   GHqb8nCcYWsS31kwTEMA+0mkB4GdBocdOj9t6A5uJty31HHIFR44Y6+mQ
   heYyZ/43Pkw2DMN0I4y5Cbwz0RbSZWA47QqxSaLTmCv4jv7q29ZSQzQR2
   fjjdOKqDBc8fyOq5fGSvw7jNGJAsbUqdCgCBETrdDv0RmKr8284lsc61D
   2MB0YNb49Aof40MpL8NqLDsKqS7PgipWW6TgGIKeOJe7f15ygJrYK06+W
   jnAImJCSEC5ip9f/i3rEPy1rbwUK8g+gK3wiHPskcsFaYVqrG7c8iSiB9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="382596614"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; 
   d="scan'208";a="382596614"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 18:50:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="770494806"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; 
   d="scan'208";a="770494806"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 26 May 2023 18:50:49 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2j4y-000Ji6-2W;
	Sat, 27 May 2023 01:50:48 +0000
Date: Sat, 27 May 2023 09:50:28 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mike Rapoport <rppt@kernel.org>
Subject: [rppt:unmapped-alloc/rfc-v2 1/3] mm/unmapped-alloc.c:150:14:
 warning: no previous prototype for function 'unmapped_pages_alloc'
Message-ID: <202305270935.G4Pfcajm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git unmapped-alloc/rfc-v2
head:   e55ecf7bdeeb7ef51b93089d7926303e8259641a
commit: c4d7927daa7a7ecd012b341e96b4d22b415c7189 [1/3] mm: intorduce unmapped_alloc()
config: x86_64-randconfig-x062-20230526 (https://download.01.org/0day-ci/archive/20230527/202305270935.G4Pfcajm-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git/commit/?id=c4d7927daa7a7ecd012b341e96b4d22b415c7189
        git remote add rppt https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git
        git fetch --no-tags rppt unmapped-alloc/rfc-v2
        git checkout c4d7927daa7a7ecd012b341e96b4d22b415c7189
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305270935.G4Pfcajm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/unmapped-alloc.c:150:14: warning: no previous prototype for function 'unmapped_pages_alloc' [-Wmissing-prototypes]
   struct page *unmapped_pages_alloc(gfp_t gfp, int order)
                ^
   mm/unmapped-alloc.c:150:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct page *unmapped_pages_alloc(gfp_t gfp, int order)
   ^
   static 
>> mm/unmapped-alloc.c:198:6: warning: no previous prototype for function 'unmapped_pages_free' [-Wmissing-prototypes]
   void unmapped_pages_free(struct page *page, int order)
        ^
   mm/unmapped-alloc.c:198:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void unmapped_pages_free(struct page *page, int order)
   ^
   static 
   2 warnings generated.


vim +/unmapped_pages_alloc +150 mm/unmapped-alloc.c

   149	
 > 150	struct page *unmapped_pages_alloc(gfp_t gfp, int order)
   151	{
   152	
   153		int cache_order = PMD_ORDER;
   154		struct page *page;
   155	
   156		page = __rmqueue_smallest(order);
   157		if (page)
   158			goto out;
   159	
   160		while (cache_order >= order) {
   161			page = alloc_pages(gfp, cache_order);
   162			if (page)
   163				break;
   164			cache_order--;
   165		}
   166	
   167		if (page) {
   168			unsigned long addr = (unsigned long)page_address(page);
   169			unsigned long nr_pages = (1 << order);
   170			unsigned long size = PAGE_SIZE * nr_pages;
   171	
   172			/* FIXME: set_direct_map_invalid_noflush may fail */
   173			for (int i = 0; i < nr_pages; i++)
   174				set_direct_map_invalid_noflush(page + i);
   175	
   176			flush_tlb_kernel_range(addr, addr + size);
   177	
   178			/*
   179			 * FIXME: have this under lock so that allocation running
   180			 * in parallel won't steal all pages from the newly cached
   181			 * ones
   182			 */
   183			__free_one_page(page, cache_order, true);
   184			page = __rmqueue_smallest(order);
   185	
   186		}
   187	
   188	out:
   189		if (page) {
   190			/* FIXME: __prep_new_page() expects page count of 0 */
   191			set_page_count(page, 0);
   192			post_alloc_hook(page, order, GFP_KERNEL);
   193		}
   194	
   195		return page;
   196	}
   197	
 > 198	void unmapped_pages_free(struct page *page, int order)
   199	{
   200		__free_one_page(page, order, false);
   201	}
   202	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
