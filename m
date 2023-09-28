Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6373638BDA;
	Thu, 28 Sep 2023 14:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695911704; x=1727447704;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rGx4eNFy7/DW/3dBekwiYrctfxUen5DzGeweCvLwmak=;
  b=PnoEN+070wrpY0YicTL37WzHixhlZX5K94XJclHcNmG+d4PBU0uKGa3p
   YEXH0l425q9O9Md0RqQM3RZpV/JykX5BdvtJ4n5vDTf4o+Kgdsj1/MNUa
   ZUpK76kOkd9kdQnwcWpCWrwQqf6/vEMYls0qyBHU7deX2MQu3INsHy8bK
   nmNzKYn31uHbCnQGMWt1k7o/bySYKzTjWO7jqsJt1BNWs/1rdP8u7SWLk
   GVsycmjgkGgoG7CmCwKjIoXDnSIMBIEMjbFt5nmfG6Scl6fSwYxjTCh2T
   ExqG5nmXu0vz7oDdT4Cq1ZRLksBxTLvO0hhlyUFBvtP4qkyPwiWVcZULi
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="688229"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; 
   d="scan'208";a="688229"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 07:34:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="839886490"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; 
   d="scan'208";a="839886490"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 28 Sep 2023 07:34:55 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qls6O-0001YR-0Z;
	Thu, 28 Sep 2023 14:34:52 +0000
Date: Thu, 28 Sep 2023 22:33:44 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 8222/8507] fs/proc/task_mmu.c:2153:8: error: call
 to undeclared function 'pagemap_scan_is_interesting_page'; ISO C99 and later
 do not support implicit function declarations
Message-ID: <202309282239.G1uvQ61m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   719136e5c24768ebdf80b9daa53facebbdd377c3
commit: 825ebc8e4bf948e5ab9a7e34f882f57285328204 [8222/8507] fs/proc/task_mmu: hide unused pagemap_scan_backout_range() function
config: mips-allnoconfig (https://download.01.org/0day-ci/archive/20230928/202309282239.G1uvQ61m-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230928/202309282239.G1uvQ61m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309282239.G1uvQ61m-lkp@intel.com/

Note: the linux-next/master HEAD 719136e5c24768ebdf80b9daa53facebbdd377c3 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> fs/proc/task_mmu.c:2153:8: error: call to undeclared function 'pagemap_scan_is_interesting_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2153 |                 if (!pagemap_scan_is_interesting_page(categories, p))
         |                      ^
   fs/proc/task_mmu.c:2153:8: note: did you mean 'pagemap_scan_is_interesting_vma'?
   fs/proc/task_mmu.c:1972:13: note: 'pagemap_scan_is_interesting_vma' declared here
    1972 | static bool pagemap_scan_is_interesting_vma(unsigned long categories,
         |             ^
   fs/proc/task_mmu.c:2249:15: error: call to undeclared function 'pagemap_scan_is_interesting_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2249 |         if (!vma || !pagemap_scan_is_interesting_page(p->cur_vma_category, p))
         |                      ^
   2 errors generated.


vim +/pagemap_scan_is_interesting_page +2153 fs/proc/task_mmu.c

fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2121  
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2122  static int pagemap_scan_pmd_entry(pmd_t *pmd, unsigned long start,
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2123  				  unsigned long end, struct mm_walk *walk)
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2124  {
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2125  	struct pagemap_scan_private *p = walk->private;
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2126  	struct vm_area_struct *vma = walk->vma;
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2127  	unsigned long addr, flush_end = 0;
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2128  	pte_t *pte, *start_pte;
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2129  	spinlock_t *ptl;
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2130  	int ret;
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2131  
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2132  	arch_enter_lazy_mmu_mode();
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2133  
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2134  	ret = pagemap_scan_thp_entry(pmd, start, end, walk);
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2135  	if (ret != -ENOENT) {
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2136  		arch_leave_lazy_mmu_mode();
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2137  		return ret;
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2138  	}
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2139  
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2140  	ret = 0;
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2141  	start_pte = pte = pte_offset_map_lock(vma->vm_mm, pmd, start, &ptl);
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2142  	if (!pte) {
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2143  		arch_leave_lazy_mmu_mode();
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2144  		walk->action = ACTION_AGAIN;
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2145  		return 0;
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2146  	}
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2147  
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2148  	for (addr = start; addr != end; pte++, addr += PAGE_SIZE) {
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2149  		unsigned long categories = p->cur_vma_category |
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2150  					   pagemap_page_category(p, vma, addr, ptep_get(pte));
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2151  		unsigned long next = addr + PAGE_SIZE;
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2152  
fef1d15288b455 Muhammad Usama Anjum 2023-08-21 @2153  		if (!pagemap_scan_is_interesting_page(categories, p))
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2154  			continue;
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2155  
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2156  		ret = pagemap_scan_output(categories, p, addr, &next);
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2157  		if (next == addr)
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2158  			break;
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2159  
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2160  		if (~p->arg.flags & PM_SCAN_WP_MATCHING)
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2161  			continue;
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2162  		if (~categories & PAGE_IS_WRITTEN)
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2163  			continue;
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2164  
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2165  		make_uffd_wp_pte(vma, addr, pte);
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2166  		if (!flush_end)
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2167  			start = addr;
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2168  		flush_end = next;
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2169  	}
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2170  
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2171  	if (flush_end)
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2172  		flush_tlb_range(vma, start, addr);
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2173  
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2174  	pte_unmap_unlock(start_pte, ptl);
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2175  	arch_leave_lazy_mmu_mode();
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2176  
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2177  	cond_resched();
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2178  	return ret;
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2179  }
fef1d15288b455 Muhammad Usama Anjum 2023-08-21  2180  

:::::: The code at line 2153 was first introduced by commit
:::::: fef1d15288b455d957cdee6ebf8118b525872bde fs/proc/task_mmu: implement IOCTL to get and optionally clear info about PTEs

:::::: TO: Muhammad Usama Anjum <usama.anjum@collabora.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
