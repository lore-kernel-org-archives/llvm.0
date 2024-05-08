Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FA56A33F;
	Wed,  8 May 2024 13:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715173774; cv=none; b=h1ZS/YsIInOvTSs7U7hNapLtU3wYhjZbrAfsaJ1JUxypr4XII9xPsTXtxZTSmGS73JNSCk6chzFCSd1bmQMVZH+XkuKxp2Yyqt2cWGVbDtN07uGQVfuIALh+Xk9jeeUMsI2MdncDTDq2OzTX39Tr40iB7vbf3vsr4cG13jz9rHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715173774; c=relaxed/simple;
	bh=7Srr5aldngBkhL3D0GTzy3jmTKIqCFssJbQWYhN5LKo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=faPCEhnqovEoUfr45poGQ/R1k/SLbmllx692fVVLkNvQNrRxJIDleSbkHDtvb1+BdpyFsFvlvhPSMMotKjUQBnrwIg+9efHkrW3GVgyToKS4yWuaNBXu+BFBKx1ByOO3OegHCcJ8TuCBfCnRhgcA3/H9PwYOt/D3cB2W3Tk5cDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DhQvmMov; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DhQvmMov"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715173772; x=1746709772;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7Srr5aldngBkhL3D0GTzy3jmTKIqCFssJbQWYhN5LKo=;
  b=DhQvmMov8NS4GKKkbtW/R/aP73gXs0vzGV8fDQLGivADxuG9JJD+eKO0
   RUypPJn9/5SjheHyPBi54PdDlR27858W1/w/HF96LKxWKaWraNS6x1KtW
   4J/njySL9JlmZHvtBxhznt8jn6sSQ6NDMdaGOBQ5Zg0FDbWw/6lJKinSH
   cvrYJvUyG0kW38sxjT8bV0RTegY2TGwBIjpz3BcalOdxwP3u+uwWrzuHA
   8qMs8H0UFJZ8l95mX1R+7lSHXMiED4XR3U/5PxLPnNqnWN1bW5S4Ap/R6
   ddZlGclHAjjbb0HPZ3j1lyYP4wFXKPNbPTFaubt507+3ZrQlOCESvV7L8
   w==;
X-CSE-ConnectionGUID: eVhuJtkTT+uMIDlJzfzgGw==
X-CSE-MsgGUID: RUXkO25cSWerBBMF6TlQUg==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="21702157"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="21702157"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 06:09:32 -0700
X-CSE-ConnectionGUID: lGcVO2vYSJCzQnG+elj/vg==
X-CSE-MsgGUID: RRh0bGaqRlaf9DInaAZHLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="28815756"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 08 May 2024 06:09:30 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4h32-0003Qw-0u;
	Wed, 08 May 2024 13:09:28 +0000
Date: Wed, 8 May 2024 21:09:27 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mike Rapoport <rppt@kernel.org>
Subject: [rppt:execmem/x86-rox/rfc-v2 22/26] mm/execmem.c:54:24: error: use
 of undeclared identifier 'PMD_SIZE'
Message-ID: <202405082149.P22IAtVv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git execmem/x86-rox/rfc-v2
head:   4558f82d6dd794c972d26cbbd6b2f9d5a18dc472
commit: 4955fdf4d8459ab94ae656dcb23f94c375388f21 [22/26] execmem: add support for cache of large ROX pages
config: arm-randconfig-002-20240508 (https://download.01.org/0day-ci/archive/20240508/202405082149.P22IAtVv-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 0ab4458df0688955620b72cc2c72a32dffad3615)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240508/202405082149.P22IAtVv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405082149.P22IAtVv-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/execmem.c:9:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> mm/execmem.c:54:24: error: use of undeclared identifier 'PMD_SIZE'
      54 |                 if (IS_ALIGNED(size, PMD_SIZE) && IS_ALIGNED(mas.index, PMD_SIZE)) {
         |                                      ^
   mm/execmem.c:54:59: error: use of undeclared identifier 'PMD_SIZE'
      54 |                 if (IS_ALIGNED(size, PMD_SIZE) && IS_ALIGNED(mas.index, PMD_SIZE)) {
         |                                                                         ^
   mm/execmem.c:88:11: error: use of undeclared identifier 'PMD_SIZE'
      88 |                 align = PMD_SIZE;
         |                         ^
   mm/execmem.c:228:30: error: use of undeclared identifier 'PMD_SIZE'
     228 |         alloc_size = round_up(size, PMD_SIZE);
         |                                     ^
   mm/execmem.c:244:2: error: call to undeclared function 'flush_tlb_kernel_range'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     244 |         flush_tlb_kernel_range(start, end);
         |         ^
>> mm/execmem.c:249:12: error: use of undeclared identifier 'PMD_SHIFT'
     249 |                                        PMD_SHIFT);
         |                                        ^
   1 warning and 6 errors generated.


vim +/PMD_SIZE +54 mm/execmem.c

   > 9	#include <linux/mm.h>
    10	#include <linux/mutex.h>
    11	#include <linux/vmalloc.h>
    12	#include <linux/execmem.h>
    13	#include <linux/maple_tree.h>
    14	#include <linux/moduleloader.h>
    15	#include <linux/text-patching.h>
    16	
    17	#include <asm/tlbflush.h>
    18	
    19	#include "internal.h"
    20	
    21	static struct execmem_info *execmem_info __ro_after_init;
    22	static struct execmem_info default_execmem_info __ro_after_init;
    23	
    24	struct execmem_cache {
    25		struct mutex mutex;
    26		struct maple_tree busy_areas;
    27		struct maple_tree free_areas;
    28	};
    29	
    30	static struct execmem_cache execmem_cache = {
    31		.mutex = __MUTEX_INITIALIZER(execmem_cache.mutex),
    32		.busy_areas = MTREE_INIT_EXT(busy_areas, MT_FLAGS_LOCK_EXTERN,
    33					     execmem_cache.mutex),
    34		.free_areas = MTREE_INIT_EXT(free_areas, MT_FLAGS_LOCK_EXTERN,
    35					     execmem_cache.mutex),
    36	};
    37	
    38	static void execmem_cache_clean(struct work_struct *work)
    39	{
    40		struct maple_tree *free_areas = &execmem_cache.free_areas;
    41		struct mutex *mutex = &execmem_cache.mutex;
    42		MA_STATE(mas, free_areas, 0, ULONG_MAX);
    43		void *area;
    44	
    45		mutex_lock(mutex);
    46		mas_for_each(&mas, area, ULONG_MAX) {
    47			size_t size;
    48	
    49			if (!xa_is_value(area))
    50				continue;
    51	
    52			size = xa_to_value(area);
    53	
  > 54			if (IS_ALIGNED(size, PMD_SIZE) && IS_ALIGNED(mas.index, PMD_SIZE)) {
    55				void *ptr = (void *)mas.index;
    56	
    57				mas_erase(&mas);
    58				vfree(ptr);
    59			}
    60		}
    61		mutex_unlock(mutex);
    62	}
    63	
    64	static DECLARE_WORK(execmem_cache_clean_work, execmem_cache_clean);
    65	
    66	static void execmem_fill_trapping_insns(void *ptr, size_t size, bool writable)
    67	{
    68		if (execmem_info->fill_trapping_insns)
    69			execmem_info->fill_trapping_insns(ptr, size, writable);
    70		else
    71			memset(ptr, 0, size);
    72	}
    73	
    74	static void *execmem_vmalloc(struct execmem_range *range, size_t size,
    75				     pgprot_t pgprot, unsigned long vm_flags)
    76	{
    77		bool kasan = range->flags & EXECMEM_KASAN_SHADOW;
    78		gfp_t gfp_flags = GFP_KERNEL | __GFP_NOWARN;
    79		unsigned int align = range->alignment;
    80		unsigned long start = range->start;
    81		unsigned long end = range->end;
    82		void *p;
    83	
    84		if (kasan)
    85			vm_flags |= VM_DEFER_KMEMLEAK;
    86	
    87		if (vm_flags & VM_ALLOW_HUGE_VMAP)
  > 88			align = PMD_SIZE;
    89	
    90		p = __vmalloc_node_range(size, align, start, end, gfp_flags, pgprot,
    91					 vm_flags, NUMA_NO_NODE,
    92					 __builtin_return_address(0));
    93		if (!p && range->fallback_start) {
    94			start = range->fallback_start;
    95			end = range->fallback_end;
    96			p = __vmalloc_node_range(size, align, start, end, gfp_flags,
    97						 pgprot, vm_flags, NUMA_NO_NODE,
    98						 __builtin_return_address(0));
    99		}
   100	
   101		if (!p) {
   102			pr_warn_ratelimited("execmem: unable to allocate memory\n");
   103			return NULL;
   104		}
   105	
   106		if (kasan && (kasan_alloc_module_shadow(p, size, GFP_KERNEL) < 0)) {
   107			vfree(p);
   108			return NULL;
   109		}
   110	
   111		return p;
   112	}
   113	
   114	static int execmem_cache_add(void *ptr, size_t size)
   115	{
   116		struct maple_tree *free_areas = &execmem_cache.free_areas;
   117		struct mutex *mutex = &execmem_cache.mutex;
   118		unsigned long addr = (unsigned long)ptr;
   119		MA_STATE(mas, free_areas, addr - 1, addr + 1);
   120		unsigned long lower, lower_size = 0;
   121		unsigned long upper, upper_size = 0;
   122		unsigned long area_size;
   123		void *area = NULL;
   124		int err;
   125	
   126		lower = addr;
   127		upper = addr + size - 1;
   128	
   129		mutex_lock(mutex);
   130		area = mas_walk(&mas);
   131		if (area && xa_is_value(area) && mas.last == addr - 1) {
   132			lower = mas.index;
   133			lower_size = xa_to_value(area);
   134		}
   135	
   136		area = mas_next(&mas, ULONG_MAX);
   137		if (area && xa_is_value(area) && mas.index == addr + size) {
   138			upper = mas.last;
   139			upper_size = xa_to_value(area);
   140		}
   141	
   142		mas_set_range(&mas, lower, upper);
   143		area_size = lower_size + upper_size + size;
   144		err = mas_store_gfp(&mas, xa_mk_value(area_size), GFP_KERNEL);
   145		mutex_unlock(mutex);
   146		if (err)
   147			return -ENOMEM;
   148	
   149		return 0;
   150	}
   151	
   152	static bool within_range(struct execmem_range *range, struct ma_state *mas,
   153				 size_t size)
   154	{
   155		unsigned long addr = mas->index;
   156	
   157		if (addr >= range->start && addr + size < range->end)
   158			return true;
   159	
   160		if (range->fallback_start &&
   161		    addr >= range->fallback_start && addr + size < range->fallback_end)
   162			return true;
   163	
   164		return false;
   165	}
   166	
   167	static void *__execmem_cache_alloc(struct execmem_range *range, size_t size)
   168	{
   169		struct maple_tree *free_areas = &execmem_cache.free_areas;
   170		struct maple_tree *busy_areas = &execmem_cache.busy_areas;
   171		MA_STATE(mas_free, free_areas, 0, ULONG_MAX);
   172		MA_STATE(mas_busy, busy_areas, 0, ULONG_MAX);
   173		struct mutex *mutex = &execmem_cache.mutex;
   174		unsigned long addr, last, area_size = 0;
   175		void *area, *ptr = NULL;
   176		int err;
   177	
   178		mutex_lock(mutex);
   179		mas_for_each(&mas_free, area, ULONG_MAX) {
   180			area_size = xa_to_value(area);
   181	
   182			if (area_size >= size && within_range(range, &mas_free, size))
   183				break;
   184		}
   185	
   186		if (area_size < size)
   187			goto out_unlock;
   188	
   189		addr = mas_free.index;
   190		last = mas_free.last;
   191	
   192		/* insert allocated size to busy_areas at range [addr, addr + size) */
   193		mas_set_range(&mas_busy, addr, addr + size - 1);
   194		err = mas_store_gfp(&mas_busy, xa_mk_value(size), GFP_KERNEL);
   195		if (err)
   196			goto out_unlock;
   197	
   198		mas_erase(&mas_free);
   199		if (area_size > size) {
   200			/*
   201			 * re-insert remaining free size to free_areas at range
   202			 * [addr + size, last]
   203			 */
   204			mas_set_range(&mas_free, addr + size, last);
   205			size = area_size - size;
   206			err = mas_store_gfp(&mas_free, xa_mk_value(size), GFP_KERNEL);
   207			if (err) {
   208				mas_erase(&mas_busy);
   209				goto out_unlock;
   210			}
   211		}
   212		ptr = (void *)addr;
   213	
   214	out_unlock:
   215		mutex_unlock(mutex);
   216		return ptr;
   217	}
   218	
   219	static int execmem_cache_populate(struct execmem_range *range, size_t size)
   220	{
   221		unsigned long vm_flags = VM_FLUSH_RESET_PERMS | VM_ALLOW_HUGE_VMAP;
   222		unsigned long start, end;
   223		struct vm_struct *vm;
   224		size_t alloc_size;
   225		int err = -ENOMEM;
   226		void *p;
   227	
   228		alloc_size = round_up(size, PMD_SIZE);
   229		p = execmem_vmalloc(range, alloc_size, PAGE_KERNEL, vm_flags);
   230		if (!p)
   231			return err;
   232	
   233		vm = find_vm_area(p);
   234		if (!vm)
   235			goto err_free_mem;
   236	
   237		/* fill memory with instructions that will trap */
   238		execmem_fill_trapping_insns(p, alloc_size, /* writable = */ true);
   239	
   240		start = (unsigned long)p;
   241		end = start + alloc_size;
   242	
   243		vunmap_range_noflush(start, end);
   244		flush_tlb_kernel_range(start, end);
   245	
   246		/* FIXME: handle direct map alias */
   247	
   248		err = vmap_pages_range_noflush(start, end, range->pgprot, vm->pages,
 > 249					       PMD_SHIFT);
   250		if (err)
   251			goto err_free_mem;
   252	
   253		err = execmem_cache_add(p, alloc_size);
   254		if (err)
   255			goto err_free_mem;
   256	
   257		return 0;
   258	
   259	err_free_mem:
   260		vfree(p);
   261		return err;
   262	}
   263	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
