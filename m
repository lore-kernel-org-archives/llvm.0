Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450F8222574;
	Thu,  5 Dec 2024 19:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733428030; cv=none; b=m+rdW6WTIf6v8mGTkun5Uvsp9HO3HqR+eNvPmhWJyiZaXGYT8AjXvhKE+UpGJ7sJE2saBuQIwHTswOscpxlcXsLnjzwXeZWXujmt6wercCHVNcDPNUWMd7Rlc6mmwcl1fadUBShEGrR1ZPrjhjUvAMrUxE1gEZeptqot03wljZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733428030; c=relaxed/simple;
	bh=QqlgZE8RlKz7xWmkcH5pd+rdj9sDEzNrROCTwezFM1o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mCOPcyVHtelh5lH0wcLbbCVC/nvQEcbvEoc/vc5gx9Hjn9aFOzjYsNCFn5q1udDbgYVtVAe0EUeoz7kX+7uErc7YXrtO47bmA33t8EJPVtjkINhsCOouzzwHEyRzNHGccBdOKLkSJCGnbAJe7axm/9GcziLychrpWQ9I6AT45PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FjsVlHTK; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FjsVlHTK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733428028; x=1764964028;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QqlgZE8RlKz7xWmkcH5pd+rdj9sDEzNrROCTwezFM1o=;
  b=FjsVlHTKByOYY2s0dzPqHoQyd9Gqo4XyNGLzuxq2SEOuQn7e5nvRsvlb
   L73pMCKyu1zR4T7kKBR5xd4QtNG5/IiQW1p7b2I/SRsEY56yetun99kVY
   iUnGhYYtnaW3fa/b3G/dPhePl1/1Kv0+kx6JZ8rXWFvqtjlNeTlWCgY5i
   vp4jkTXvXGf3EBIGJkivWT5tmNxAt9X2zSV3pjNS5k7zDwxUaGHUN7Fl7
   d3bqbeC8j+V8M2J/f5USKF9zsIBlgaHVwWv/3tz8jWUFIb+TZ8yrb9+Gk
   o1bGxqWggjEiToYZ2ur9AB54jkeJrwPqKGxPEJJTd+gxDPpVM35bOyp+E
   w==;
X-CSE-ConnectionGUID: SVthfW2sSmKkuJU+nHy07w==
X-CSE-MsgGUID: irqlieDmQWaU4SRJ96MvuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="33090598"
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; 
   d="scan'208";a="33090598"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 11:47:07 -0800
X-CSE-ConnectionGUID: bjCsJD1nRQqYgod01zmogg==
X-CSE-MsgGUID: TV8cOcFCT1mLqa+CYxqzEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; 
   d="scan'208";a="94011189"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 05 Dec 2024 11:47:07 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJHoV-0000Lf-27;
	Thu, 05 Dec 2024 19:47:03 +0000
Date: Fri, 6 Dec 2024 03:46:26 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:arm64-pa-simplify-v2 6/6] mm/zsmalloc.c:226:21: error: fields
 must have a constant size: 'variable length array in structure' extension
 will never be supported
Message-ID: <202412060342.UW8hjGgA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git arm64-pa-simplify-v2
head:   4ff764446e134bc58fc769d9b853e6a4a83b91bb
commit: bcfbf7864146aa0d5e9a75a4bddbb014f78f6af3 [6/6] arm64/mm: Drop configurable 48-bit physical address space limit
config: arm64-randconfig-003-20241206 (https://download.01.org/0day-ci/archive/20241206/202412060342.UW8hjGgA-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241206/202412060342.UW8hjGgA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412060342.UW8hjGgA-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from mm/zsmalloc.c:49:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/arm64/include/asm/cacheflush.h:11:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> mm/zsmalloc.c:226:32: warning: variable length array used [-Wvla]
     226 |         struct size_class *size_class[ZS_SIZE_CLASSES];
         |                                       ^~~~~~~~~~~~~~~
   mm/zsmalloc.c:148:59: note: expanded from macro 'ZS_SIZE_CLASSES'
     148 | #define ZS_SIZE_CLASSES (DIV_ROUND_UP(ZS_MAX_ALLOC_SIZE - ZS_MIN_ALLOC_SIZE, \
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
     149 |                                       ZS_SIZE_CLASS_DELTA) + 1)
         |                                       ~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/zsmalloc.c:130:52: note: expanded from macro 'ZS_MIN_ALLOC_SIZE'
     130 |         MAX(32, (ZS_MAX_PAGES_PER_ZSPAGE << PAGE_SHIFT >> OBJ_INDEX_BITS))
         |                                                           ^
   mm/zsmalloc.c:118:41: note: expanded from macro 'OBJ_INDEX_BITS'
     118 | #define OBJ_INDEX_BITS  (BITS_PER_LONG - _PFN_BITS)
         |                                          ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/minmax.h:330:30: note: expanded from macro 'MAX'
     330 | #define MAX(a,b) __cmp(max,a,b)
         |                              ^
   include/linux/minmax.h:90:45: note: expanded from macro '__cmp'
      90 | #define __cmp(op, x, y) ((x) __cmp_op_##op (y) ? (x) : (y))
         |                                             ^
   include/uapi/linux/const.h:51:40: note: expanded from macro '__KERNEL_DIV_ROUND_UP'
      51 | #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
         |                                        ^
>> mm/zsmalloc.c:226:21: error: fields must have a constant size: 'variable length array in structure' extension will never be supported
     226 |         struct size_class *size_class[ZS_SIZE_CLASSES];
         |                            ^
   5 warnings and 1 error generated.


vim +226 mm/zsmalloc.c

0959c63f11c3bbe drivers/staging/zsmalloc/zsmalloc-main.c Seth Jennings      2012-08-08  222  
0959c63f11c3bbe drivers/staging/zsmalloc/zsmalloc-main.c Seth Jennings      2012-08-08  223  struct zs_pool {
6f3526d6db7cbe8 mm/zsmalloc.c                            Sergey SENOZHATSKY 2015-11-06  224  	const char *name;
0f050d997e275cf mm/zsmalloc.c                            Ganesh Mahendran   2015-02-12  225  
cf8e0fedf0784ef mm/zsmalloc.c                            Jerome Marchand    2017-07-10 @226  	struct size_class *size_class[ZS_SIZE_CLASSES];
2e40e163a25af3b mm/zsmalloc.c                            Minchan Kim        2015-04-15  227  	struct kmem_cache *handle_cachep;
3783689a1aa82ef mm/zsmalloc.c                            Minchan Kim        2016-07-26  228  	struct kmem_cache *zspage_cachep;
0959c63f11c3bbe drivers/staging/zsmalloc/zsmalloc-main.c Seth Jennings      2012-08-08  229  
13de8933c96b455 mm/zsmalloc.c                            Minchan Kim        2014-10-09  230  	atomic_long_t pages_allocated;
0f050d997e275cf mm/zsmalloc.c                            Ganesh Mahendran   2015-02-12  231  
7d3f3938236b4bb mm/zsmalloc.c                            Sergey Senozhatsky 2015-09-08  232  	struct zs_pool_stats stats;
ab9d306d9c3bf64 mm/zsmalloc.c                            Sergey Senozhatsky 2015-09-08  233  
ab9d306d9c3bf64 mm/zsmalloc.c                            Sergey Senozhatsky 2015-09-08  234  	/* Compact classes */
c19b548b493455c mm/zsmalloc.c                            Qi Zheng           2023-09-11  235  	struct shrinker *shrinker;
93144ca35041b05 mm/zsmalloc.c                            Aliaksei Karaliou  2018-01-31  236  

:::::: The code at line 226 was first introduced by commit
:::::: cf8e0fedf0784ef4bc1889380b09eda295e3d109 mm/zsmalloc: simplify zs_max_alloc_size handling

:::::: TO: Jerome Marchand <jmarchan@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
