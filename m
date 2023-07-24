Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCD2E574;
	Mon, 24 Jul 2023 17:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690220667; x=1721756667;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=21B8a1DKHnPPhSwL8p6Af8ZZSteY2H56eVoLseCKKEc=;
  b=W8UP9VgkfbMMADDr3RhjbkMlyfOGI3D8DtGAeh9+sO63d3h/olJug3tn
   M2aikBZCvQtcD/wLrWmMBN2nuIIc5cAesRkXvWZTBNHwcGkAJp+tU1hFK
   4ECDBmzWrlVYWSOEZCiY/p1JFWr1hNoqobnjDNed6dbKEhScPdkX/y71n
   OH8kMpdbq4uJE+4sf3HwQExsi81pYQSMlzJFN/WMxPAq2fIpGM45bO2xn
   A43Gj1cwrHLW0QU+3B7lCplulZDgn2v0+tuIV5YTgxzXYFisfKnFUZQ98
   C5dLQZvMOEy1863NJFZkkBVcHeseyyMhc008GAw+arnppeIQrTAELSf2S
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="364969533"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="364969533"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2023 10:44:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="849720096"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="849720096"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 24 Jul 2023 10:44:23 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNzbb-0009vS-0I;
	Mon, 24 Jul 2023 17:44:23 +0000
Date: Tue, 25 Jul 2023 01:44:00 +0800
From: kernel test robot <lkp@intel.com>
To: Usama Arif <usama.arif@bytedance.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 2/4] mm/memblock: Add hugepage_size member to struct
 memblock_region
Message-ID: <202307250135.1cG4zZN4-lkp@intel.com>
References: <20230724134644.1299963-3-usama.arif@bytedance.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230724134644.1299963-3-usama.arif@bytedance.com>

Hi Usama,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Usama-Arif/mm-hugetlb-Skip-prep-of-tail-pages-when-HVO-is-enabled/20230724-214832
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230724134644.1299963-3-usama.arif%40bytedance.com
patch subject: [RFC 2/4] mm/memblock: Add hugepage_size member to struct memblock_region
config: riscv-randconfig-r042-20230724 (https://download.01.org/0day-ci/archive/20230725/202307250135.1cG4zZN4-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230725/202307250135.1cG4zZN4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307250135.1cG4zZN4-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> mm/cma.c:350:37: error: too few arguments to function call, expected 7, have 6
     350 |                         addr = memblock_alloc_range_nid(size, alignment,
         |                                ~~~~~~~~~~~~~~~~~~~~~~~~
     351 |                                         highmem_start, limit, nid, true);
         |                                                                        ^
   include/linux/memblock.h:402:13: note: 'memblock_alloc_range_nid' declared here
     402 | phys_addr_t memblock_alloc_range_nid(phys_addr_t size,
         |             ^
   1 error generated.
--
>> mm/memblock.c:869:21: warning: no previous prototype for function 'memblock_reserve_huge' [-Wmissing-prototypes]
     869 | int __init_memblock memblock_reserve_huge(phys_addr_t base, phys_addr_t size,
         |                     ^
   mm/memblock.c:869:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     869 | int __init_memblock memblock_reserve_huge(phys_addr_t base, phys_addr_t size,
         | ^
         | static 
   1 warning generated.


vim +350 mm/cma.c

df2ff39e78da74d Roman Gushchin   2021-02-25  341  
148aa87e4f631e9 Levi Yun         2023-01-18  342  		/*
148aa87e4f631e9 Levi Yun         2023-01-18  343  		 * All pages in the reserved area must come from the same zone.
148aa87e4f631e9 Levi Yun         2023-01-18  344  		 * If the requested region crosses the low/high memory boundary,
148aa87e4f631e9 Levi Yun         2023-01-18  345  		 * try allocating from high memory first and fall back to low
148aa87e4f631e9 Levi Yun         2023-01-18  346  		 * memory in case of failure.
148aa87e4f631e9 Levi Yun         2023-01-18  347  		 */
148aa87e4f631e9 Levi Yun         2023-01-18  348  		if (!addr && base < highmem_start && limit > highmem_start) {
148aa87e4f631e9 Levi Yun         2023-01-18  349  			addr = memblock_alloc_range_nid(size, alignment,
148aa87e4f631e9 Levi Yun         2023-01-18 @350  					highmem_start, limit, nid, true);
148aa87e4f631e9 Levi Yun         2023-01-18  351  			limit = highmem_start;
148aa87e4f631e9 Levi Yun         2023-01-18  352  		}
148aa87e4f631e9 Levi Yun         2023-01-18  353  
16195ddd4ebcc10 Laurent Pinchart 2014-10-24  354  		if (!addr) {
8676af1ff2d28e6 Aslan Bakirov    2020-04-10  355  			addr = memblock_alloc_range_nid(size, alignment, base,
7a3e1836a1ea68e Usama Arif       2023-07-24  356  					limit, nid, true, 0);
a254129e8686bff Joonsoo Kim      2014-08-06  357  			if (!addr) {
a254129e8686bff Joonsoo Kim      2014-08-06  358  				ret = -ENOMEM;
a254129e8686bff Joonsoo Kim      2014-08-06  359  				goto err;
a254129e8686bff Joonsoo Kim      2014-08-06  360  			}
a254129e8686bff Joonsoo Kim      2014-08-06  361  		}
a254129e8686bff Joonsoo Kim      2014-08-06  362  
620951e2745750d Thierry Reding   2014-12-12  363  		/*
620951e2745750d Thierry Reding   2014-12-12  364  		 * kmemleak scans/reads tracked objects for pointers to other
620951e2745750d Thierry Reding   2014-12-12  365  		 * objects but this address isn't mapped and accessible
620951e2745750d Thierry Reding   2014-12-12  366  		 */
9099daed9c6991a Catalin Marinas  2016-10-11  367  		kmemleak_ignore_phys(addr);
16195ddd4ebcc10 Laurent Pinchart 2014-10-24  368  		base = addr;
16195ddd4ebcc10 Laurent Pinchart 2014-10-24  369  	}
16195ddd4ebcc10 Laurent Pinchart 2014-10-24  370  
f318dd083c8128c Laura Abbott     2017-04-18  371  	ret = cma_init_reserved_mem(base, size, order_per_bit, name, res_cma);
de9e14eebf33a60 Marek Szyprowski 2014-10-13  372  	if (ret)
0d3bd18a5efd660 Peng Fan         2019-03-05  373  		goto free_mem;
a254129e8686bff Joonsoo Kim      2014-08-06  374  
56fa4f609badbe4 Laurent Pinchart 2014-10-24  375  	pr_info("Reserved %ld MiB at %pa\n", (unsigned long)size / SZ_1M,
56fa4f609badbe4 Laurent Pinchart 2014-10-24  376  		&base);
a254129e8686bff Joonsoo Kim      2014-08-06  377  	return 0;
a254129e8686bff Joonsoo Kim      2014-08-06  378  
0d3bd18a5efd660 Peng Fan         2019-03-05  379  free_mem:
3ecc68349bbab6b Mike Rapoport    2021-11-05  380  	memblock_phys_free(base, size);
a254129e8686bff Joonsoo Kim      2014-08-06  381  err:
0de9d2ebe590f92 Joonsoo Kim      2014-08-06  382  	pr_err("Failed to reserve %ld MiB\n", (unsigned long)size / SZ_1M);
a254129e8686bff Joonsoo Kim      2014-08-06  383  	return ret;
a254129e8686bff Joonsoo Kim      2014-08-06  384  }
a254129e8686bff Joonsoo Kim      2014-08-06  385  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
