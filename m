Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCA7182A1;
	Wed, 20 Mar 2024 05:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710913804; cv=none; b=cE2BVy7oUs4ePT+mEReHUdsLWQ3BCdJVCYxYT7MpDv/UVCJlVbeCW+1wG7ZDtAZWP2WiwNn/bV2g1rN6ArFjl8h+kWeTyJn2CIAaq44kRWr4U7OeTOf6kfOQMpq7Gxzrevt9yVxI99CwmSBoG8AUaV7/S97Tguih+UbVDSUY4n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710913804; c=relaxed/simple;
	bh=EYFmhq8QUBZm43CCsmyp66e5PhSdVUFJzUoaBjh+xnM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=buYmgBIGLFQ/+23UsgsL+66Nklh7AiQpChcJbG6b3KsFHYc4PvE6sZB7klbpMxI5jCHXRK8B5wzDW2qneoJAJG3X/uQ0bD0+XhEvGMSMJw7IThF8SHQ/E4GLNqkTHk8m9Q59T0krQXrE3Jjf2PFo5nzXeSk8AoAp/2cbej6XKOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hp8fsBCB; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hp8fsBCB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710913802; x=1742449802;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EYFmhq8QUBZm43CCsmyp66e5PhSdVUFJzUoaBjh+xnM=;
  b=hp8fsBCB6VyUdJyfyUQPMlMIJ1r8Pncz73WMWGeSYVjFnlqc3Srx5gbl
   cD/VcHHjpaAEdGqmxlrcMb2/kbjA2nTvgsDnO8JMomcswqrxPnqUhAf4+
   +cbjzd3m/tNiNwa4VHCwTg3IwzlYbE9YGeDg3V+Pr4VN0zePEYHnTUPim
   +eeuXBdn0FJoDHxonaxaDUAGVoTCEBY7D5X6k/Zag2H5qwu4fxHDLfwhU
   UwKrG18pcPA/VEiIQh0sqaGLbLPXy5WckOrGvV+9XlxbXBH2R9sGBv/ry
   bIMPSqEegjMPVad9dfVJf0wd2ebmC4wlyboercJrSoS4nXrmqQFrLm6pM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="6028065"
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000"; 
   d="scan'208";a="6028065"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 22:50:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000"; 
   d="scan'208";a="14463361"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 19 Mar 2024 22:50:00 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rmopp-000INj-2P;
	Wed, 20 Mar 2024 05:49:57 +0000
Date: Wed, 20 Mar 2024 13:49:55 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linyunsheng:page_frag_cache_prototype 74/78]
 mm/page_frag_alloc.c:92:11: error: invalid application of 'typeof' to
 bit-field
Message-ID: <202403201343.c6ZxdQkJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gestionlin/linux.git page_frag_cache_prototype
head:   7315604eb1d087836123bc9670d2be420a42d37f
commit: 6235640ae08dd66d5f64292e2ccedfcf7c564678 [74/78] mm/page_alloc: reuse existing bit field for pfmemalloc
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20240320/202403201343.c6ZxdQkJ-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8f68022f8e6e54d1aeae4ed301f5a015963089b7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240320/202403201343.c6ZxdQkJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403201343.c6ZxdQkJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/page_frag_alloc.c:17:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> mm/page_frag_alloc.c:92:11: error: invalid application of 'typeof' to bit-field
      92 |         offset = ALIGN(nc->offset, -align_mask);
         |                  ^
   include/linux/align.h:8:22: note: expanded from macro 'ALIGN'
       8 | #define ALIGN(x, a)             __ALIGN_KERNEL((x), (a))
         |                                 ^
   include/uapi/linux/const.h:31:65: note: expanded from macro '__ALIGN_KERNEL'
      31 | #define __ALIGN_KERNEL(x, a)            __ALIGN_KERNEL_MASK(x, (__typeof__(x))(a) - 1)
         |                                                                           ^
>> mm/page_frag_alloc.c:92:11: error: invalid application of 'typeof' to bit-field
   include/linux/align.h:8:22: note: expanded from macro 'ALIGN'
       8 | #define ALIGN(x, a)             __ALIGN_KERNEL((x), (a))
         |                                 ^
   include/uapi/linux/const.h:31:65: note: expanded from macro '__ALIGN_KERNEL'
      31 | #define __ALIGN_KERNEL(x, a)            __ALIGN_KERNEL_MASK(x, (__typeof__(x))(a) - 1)
         |                                                                           ^
   5 warnings and 2 errors generated.


vim +/typeof +92 mm/page_frag_alloc.c

c8f66d331fd5a2 Yunsheng Lin 2023-12-01   91  
c8f66d331fd5a2 Yunsheng Lin 2023-12-01  @92  	offset = ALIGN(nc->offset, -align_mask);
c8f66d331fd5a2 Yunsheng Lin 2023-12-01   93  	if (unlikely(offset + fragsz > size)) {
e66f049407d1fc Yunsheng Lin 2024-03-16   94  		page = virt_to_page(nc->va);
e66f049407d1fc Yunsheng Lin 2024-03-16   95  
e66f049407d1fc Yunsheng Lin 2024-03-16   96  		if (!page_ref_sub_and_test(page, nc->pagecnt_bias))
e66f049407d1fc Yunsheng Lin 2024-03-16   97  			goto refill;
e66f049407d1fc Yunsheng Lin 2024-03-16   98  
e66f049407d1fc Yunsheng Lin 2024-03-16   99  		if (unlikely(nc->pfmemalloc)) {
e66f049407d1fc Yunsheng Lin 2024-03-16  100  			free_unref_page(page, compound_order(page));
e66f049407d1fc Yunsheng Lin 2024-03-16  101  			goto refill;
e66f049407d1fc Yunsheng Lin 2024-03-16  102  		}
e66f049407d1fc Yunsheng Lin 2024-03-16  103  
e66f049407d1fc Yunsheng Lin 2024-03-16  104  		/* OK, page count is 0, we can safely set it */
e66f049407d1fc Yunsheng Lin 2024-03-16  105  		set_page_count(page, PAGE_FRAG_CACHE_MAX_SIZE + 1);
e66f049407d1fc Yunsheng Lin 2024-03-16  106  
e66f049407d1fc Yunsheng Lin 2024-03-16  107  		/* reset page count bias and offset to start of new frag */
e66f049407d1fc Yunsheng Lin 2024-03-16  108  		nc->pagecnt_bias = PAGE_FRAG_CACHE_MAX_SIZE + 1;
c8f66d331fd5a2 Yunsheng Lin 2023-12-01  109  		offset = 0;
c8f66d331fd5a2 Yunsheng Lin 2023-12-01  110  		if (unlikely(fragsz > size)) {
e66f049407d1fc Yunsheng Lin 2024-03-16  111  			/*
e66f049407d1fc Yunsheng Lin 2024-03-16  112  			 * The caller is trying to allocate a fragment
e66f049407d1fc Yunsheng Lin 2024-03-16  113  			 * with fragsz > PAGE_SIZE but the cache isn't big
e66f049407d1fc Yunsheng Lin 2024-03-16  114  			 * enough to satisfy the request, this may
e66f049407d1fc Yunsheng Lin 2024-03-16  115  			 * happen in low memory conditions.
e66f049407d1fc Yunsheng Lin 2024-03-16  116  			 * We don't release the cache page because
e66f049407d1fc Yunsheng Lin 2024-03-16  117  			 * it could make memory pressure worse
e66f049407d1fc Yunsheng Lin 2024-03-16  118  			 * so we simply return NULL here.
e66f049407d1fc Yunsheng Lin 2024-03-16  119  			 */
e66f049407d1fc Yunsheng Lin 2024-03-16  120  			return NULL;
e66f049407d1fc Yunsheng Lin 2024-03-16  121  		}
e66f049407d1fc Yunsheng Lin 2024-03-16  122  	}
e66f049407d1fc Yunsheng Lin 2024-03-16  123  
e66f049407d1fc Yunsheng Lin 2024-03-16  124  	nc->pagecnt_bias--;
c8f66d331fd5a2 Yunsheng Lin 2023-12-01  125  	nc->offset = offset + fragsz;
e66f049407d1fc Yunsheng Lin 2024-03-16  126  
e66f049407d1fc Yunsheng Lin 2024-03-16  127  	return nc->va + offset;
e66f049407d1fc Yunsheng Lin 2024-03-16  128  }
e66f049407d1fc Yunsheng Lin 2024-03-16  129  EXPORT_SYMBOL(__page_frag_alloc_align);
e66f049407d1fc Yunsheng Lin 2024-03-16  130  

:::::: The code at line 92 was first introduced by commit
:::::: c8f66d331fd5a2c000f5c5aebe181c9def4e1f3a mm/page_alloc: use initial zero offset for page_frag_alloc_align()

:::::: TO: Yunsheng Lin <linyunsheng@huawei.com>
:::::: CC: Yunsheng Lin <linyunsheng@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
