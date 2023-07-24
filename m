Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679506130;
	Mon, 24 Jul 2023 12:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690201011; x=1721737011;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/yCgYWugwZcmU/Vjv02eG/3q28h/5fG7I6jpRGI0IRA=;
  b=HUANAYrscb3DsCBx2Z1TfrsTpy6YHz/X9WgBiZF8CPuL2CW7bCIyVhOv
   n9k+/e3yi0q17GTBN9jqIEimKQyAPxsaxNlI+Fghq8o/Dszz4/YXhLV//
   Mq2POzVdqzpuWgbU+vaB6s6CpxZFWVi8FBln/uxdtmMFLjK17C09lrpCL
   Qc0X7MCqapdNwymneVMoPy/sVA4wbeYfl1kgX61qv8KicCWMSv5MdK+Sv
   W3yGzDthAiOccvF9Y5Wwb1MnmUftPGRc3X+bRB05YezaJt4tfng4PwTrP
   H5BXh9y2bVmsVbMERGz6sK6obf2PTmk6NeKWFseX66auq+AoS2GUI7oFT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="357422109"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="357422109"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2023 05:16:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="790943015"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="790943015"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 24 Jul 2023 05:16:49 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNuRu-0009iO-0l;
	Mon, 24 Jul 2023 12:14:52 +0000
Date: Mon, 24 Jul 2023 20:13:25 +0800
From: kernel test robot <lkp@intel.com>
To: Guo Ren <guoren@linux.alibaba.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [csky-linux:sg2042-master-qspinlock-64ilp32_v3 27/42]
 mm/percpu.c:3112:19: warning: format specifies type 'unsigned long' but the
 argument has type 'unsigned long long'
Message-ID: <202307242039.5EW71IFf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/c-sky/csky-linux sg2042-master-qspinlock-64ilp32_v3
head:   afe9d1bbe54feff432a2c25572304c06de598ec0
commit: eaf44797a7386e8df05f16729fc121f940397a5c [27/42] riscv: s64ilp32: Add MMU_SV39 mode support
config: riscv-randconfig-r042-20230724 (https://download.01.org/0day-ci/archive/20230724/202307242039.5EW71IFf-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230724/202307242039.5EW71IFf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307242039.5EW71IFf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/percpu.c:3112:19: warning: format specifies type 'unsigned long' but the argument has type 'unsigned long long' [-Wformat]
    3112 |                 pr_warn("max_distance=0x%lx too large for vmalloc space 0x%lx\n",
         |                                                                           ~~~
         |                                                                           %llx
    3113 |                                 max_distance, VMALLOC_TOTAL);
         |                                               ^~~~~~~~~~~~~
   include/linux/printk.h:508:37: note: expanded from macro 'pr_warn'
     508 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                                    ~~~     ^~~~~~~~~~~
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
     455 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   include/linux/vmalloc.h:284:23: note: expanded from macro 'VMALLOC_TOTAL'
     284 | #define VMALLOC_TOTAL (VMALLOC_END - VMALLOC_START)
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +3112 mm/percpu.c

3c9a024fde58b0 Tejun Heo       2010-09-09  3022  
3c9a024fde58b0 Tejun Heo       2010-09-09  3023  #if defined(BUILD_EMBED_FIRST_CHUNK)
66c3a75772247c Tejun Heo       2009-03-10  3024  /**
66c3a75772247c Tejun Heo       2009-03-10  3025   * pcpu_embed_first_chunk - embed the first percpu chunk into bootmem
66c3a75772247c Tejun Heo       2009-03-10  3026   * @reserved_size: the size of reserved percpu area in bytes
4ba6ce250e406b Tejun Heo       2010-06-27  3027   * @dyn_size: minimum free size for dynamic allocation in bytes
c8826dd538602d Tejun Heo       2009-08-14  3028   * @atom_size: allocation atom size
c8826dd538602d Tejun Heo       2009-08-14  3029   * @cpu_distance_fn: callback to determine distance between cpus, optional
1ca3fb3abd2b61 Kefeng Wang     2022-01-19  3030   * @cpu_to_nd_fn: callback to convert cpu to it's node, optional
66c3a75772247c Tejun Heo       2009-03-10  3031   *
66c3a75772247c Tejun Heo       2009-03-10  3032   * This is a helper to ease setting up embedded first percpu chunk and
66c3a75772247c Tejun Heo       2009-03-10  3033   * can be called where pcpu_setup_first_chunk() is expected.
66c3a75772247c Tejun Heo       2009-03-10  3034   *
66c3a75772247c Tejun Heo       2009-03-10  3035   * If this function is used to setup the first chunk, it is allocated
23f917169ef157 Kefeng Wang     2022-01-19  3036   * by calling pcpu_fc_alloc and used as-is without being mapped into
c8826dd538602d Tejun Heo       2009-08-14  3037   * vmalloc area.  Allocations are always whole multiples of @atom_size
c8826dd538602d Tejun Heo       2009-08-14  3038   * aligned to @atom_size.
c8826dd538602d Tejun Heo       2009-08-14  3039   *
c8826dd538602d Tejun Heo       2009-08-14  3040   * This enables the first chunk to piggy back on the linear physical
c8826dd538602d Tejun Heo       2009-08-14  3041   * mapping which often uses larger page size.  Please note that this
c8826dd538602d Tejun Heo       2009-08-14  3042   * can result in very sparse cpu->unit mapping on NUMA machines thus
c8826dd538602d Tejun Heo       2009-08-14  3043   * requiring large vmalloc address space.  Don't use this allocator if
c8826dd538602d Tejun Heo       2009-08-14  3044   * vmalloc space is not orders of magnitude larger than distances
c8826dd538602d Tejun Heo       2009-08-14  3045   * between node memory addresses (ie. 32bit NUMA machines).
66c3a75772247c Tejun Heo       2009-03-10  3046   *
4ba6ce250e406b Tejun Heo       2010-06-27  3047   * @dyn_size specifies the minimum dynamic area size.
66c3a75772247c Tejun Heo       2009-03-10  3048   *
66c3a75772247c Tejun Heo       2009-03-10  3049   * If the needed size is smaller than the minimum or specified unit
23f917169ef157 Kefeng Wang     2022-01-19  3050   * size, the leftover is returned using pcpu_fc_free.
66c3a75772247c Tejun Heo       2009-03-10  3051   *
66c3a75772247c Tejun Heo       2009-03-10  3052   * RETURNS:
fb435d5233f8b6 Tejun Heo       2009-08-14  3053   * 0 on success, -errno on failure.
66c3a75772247c Tejun Heo       2009-03-10  3054   */
4ba6ce250e406b Tejun Heo       2010-06-27  3055  int __init pcpu_embed_first_chunk(size_t reserved_size, size_t dyn_size,
c8826dd538602d Tejun Heo       2009-08-14  3056  				  size_t atom_size,
c8826dd538602d Tejun Heo       2009-08-14  3057  				  pcpu_fc_cpu_distance_fn_t cpu_distance_fn,
23f917169ef157 Kefeng Wang     2022-01-19  3058  				  pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn)
66c3a75772247c Tejun Heo       2009-03-10  3059  {
c8826dd538602d Tejun Heo       2009-08-14  3060  	void *base = (void *)ULONG_MAX;
c8826dd538602d Tejun Heo       2009-08-14  3061  	void **areas = NULL;
fd1e8a1fe2b54d Tejun Heo       2009-08-14  3062  	struct pcpu_alloc_info *ai;
93c76b6b2faaad zijun_hu        2016-10-05  3063  	size_t size_sum, areas_size;
93c76b6b2faaad zijun_hu        2016-10-05  3064  	unsigned long max_distance;
163fa23435cc9c Kefeng Wang     2019-07-03  3065  	int group, i, highest_group, rc = 0;
66c3a75772247c Tejun Heo       2009-03-10  3066  
c8826dd538602d Tejun Heo       2009-08-14  3067  	ai = pcpu_build_alloc_info(reserved_size, dyn_size, atom_size,
c8826dd538602d Tejun Heo       2009-08-14  3068  				   cpu_distance_fn);
fd1e8a1fe2b54d Tejun Heo       2009-08-14  3069  	if (IS_ERR(ai))
fd1e8a1fe2b54d Tejun Heo       2009-08-14  3070  		return PTR_ERR(ai);
66c3a75772247c Tejun Heo       2009-03-10  3071  
fd1e8a1fe2b54d Tejun Heo       2009-08-14  3072  	size_sum = ai->static_size + ai->reserved_size + ai->dyn_size;
c8826dd538602d Tejun Heo       2009-08-14  3073  	areas_size = PFN_ALIGN(ai->nr_groups * sizeof(void *));
fa8a7094ba1679 Tejun Heo       2009-06-22  3074  
26fb3dae0a1ec7 Mike Rapoport   2019-03-11  3075  	areas = memblock_alloc(areas_size, SMP_CACHE_BYTES);
c8826dd538602d Tejun Heo       2009-08-14  3076  	if (!areas) {
fb435d5233f8b6 Tejun Heo       2009-08-14  3077  		rc = -ENOMEM;
c8826dd538602d Tejun Heo       2009-08-14  3078  		goto out_free;
fa8a7094ba1679 Tejun Heo       2009-06-22  3079  	}
66c3a75772247c Tejun Heo       2009-03-10  3080  
9b7396624a7b50 zijun_hu        2016-10-05  3081  	/* allocate, copy and determine base address & max_distance */
9b7396624a7b50 zijun_hu        2016-10-05  3082  	highest_group = 0;
c8826dd538602d Tejun Heo       2009-08-14  3083  	for (group = 0; group < ai->nr_groups; group++) {
c8826dd538602d Tejun Heo       2009-08-14  3084  		struct pcpu_group_info *gi = &ai->groups[group];
c8826dd538602d Tejun Heo       2009-08-14  3085  		unsigned int cpu = NR_CPUS;
c8826dd538602d Tejun Heo       2009-08-14  3086  		void *ptr;
c8826dd538602d Tejun Heo       2009-08-14  3087  
c8826dd538602d Tejun Heo       2009-08-14  3088  		for (i = 0; i < gi->nr_units && cpu == NR_CPUS; i++)
c8826dd538602d Tejun Heo       2009-08-14  3089  			cpu = gi->cpu_map[i];
c8826dd538602d Tejun Heo       2009-08-14  3090  		BUG_ON(cpu == NR_CPUS);
c8826dd538602d Tejun Heo       2009-08-14  3091  
c8826dd538602d Tejun Heo       2009-08-14  3092  		/* allocate space for the whole group */
23f917169ef157 Kefeng Wang     2022-01-19  3093  		ptr = pcpu_fc_alloc(cpu, gi->nr_units * ai->unit_size, atom_size, cpu_to_nd_fn);
c8826dd538602d Tejun Heo       2009-08-14  3094  		if (!ptr) {
c8826dd538602d Tejun Heo       2009-08-14  3095  			rc = -ENOMEM;
c8826dd538602d Tejun Heo       2009-08-14  3096  			goto out_free_areas;
c8826dd538602d Tejun Heo       2009-08-14  3097  		}
f528f0b8e53d73 Catalin Marinas 2011-09-26  3098  		/* kmemleak tracks the percpu allocations separately */
a317ebccaa3609 Patrick Wang    2022-07-05  3099  		kmemleak_ignore_phys(__pa(ptr));
c8826dd538602d Tejun Heo       2009-08-14  3100  		areas[group] = ptr;
c8826dd538602d Tejun Heo       2009-08-14  3101  
c8826dd538602d Tejun Heo       2009-08-14  3102  		base = min(ptr, base);
9b7396624a7b50 zijun_hu        2016-10-05  3103  		if (ptr > areas[highest_group])
9b7396624a7b50 zijun_hu        2016-10-05  3104  			highest_group = group;
9b7396624a7b50 zijun_hu        2016-10-05  3105  	}
9b7396624a7b50 zijun_hu        2016-10-05  3106  	max_distance = areas[highest_group] - base;
9b7396624a7b50 zijun_hu        2016-10-05  3107  	max_distance += ai->unit_size * ai->groups[highest_group].nr_units;
9b7396624a7b50 zijun_hu        2016-10-05  3108  
9b7396624a7b50 zijun_hu        2016-10-05  3109  	/* warn if maximum distance is further than 75% of vmalloc space */
9b7396624a7b50 zijun_hu        2016-10-05  3110  	if (max_distance > VMALLOC_TOTAL * 3 / 4) {
9b7396624a7b50 zijun_hu        2016-10-05  3111  		pr_warn("max_distance=0x%lx too large for vmalloc space 0x%lx\n",
9b7396624a7b50 zijun_hu        2016-10-05 @3112  				max_distance, VMALLOC_TOTAL);
9b7396624a7b50 zijun_hu        2016-10-05  3113  #ifdef CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK
9b7396624a7b50 zijun_hu        2016-10-05  3114  		/* and fail if we have fallback */
9b7396624a7b50 zijun_hu        2016-10-05  3115  		rc = -EINVAL;
9b7396624a7b50 zijun_hu        2016-10-05  3116  		goto out_free_areas;
9b7396624a7b50 zijun_hu        2016-10-05  3117  #endif
42b64281453249 Tejun Heo       2012-04-27  3118  	}
42b64281453249 Tejun Heo       2012-04-27  3119  
42b64281453249 Tejun Heo       2012-04-27  3120  	/*
42b64281453249 Tejun Heo       2012-04-27  3121  	 * Copy data and free unused parts.  This should happen after all
42b64281453249 Tejun Heo       2012-04-27  3122  	 * allocations are complete; otherwise, we may end up with
42b64281453249 Tejun Heo       2012-04-27  3123  	 * overlapping groups.
42b64281453249 Tejun Heo       2012-04-27  3124  	 */
42b64281453249 Tejun Heo       2012-04-27  3125  	for (group = 0; group < ai->nr_groups; group++) {
42b64281453249 Tejun Heo       2012-04-27  3126  		struct pcpu_group_info *gi = &ai->groups[group];
42b64281453249 Tejun Heo       2012-04-27  3127  		void *ptr = areas[group];
66c3a75772247c Tejun Heo       2009-03-10  3128  
c8826dd538602d Tejun Heo       2009-08-14  3129  		for (i = 0; i < gi->nr_units; i++, ptr += ai->unit_size) {
c8826dd538602d Tejun Heo       2009-08-14  3130  			if (gi->cpu_map[i] == NR_CPUS) {
c8826dd538602d Tejun Heo       2009-08-14  3131  				/* unused unit, free whole */
23f917169ef157 Kefeng Wang     2022-01-19  3132  				pcpu_fc_free(ptr, ai->unit_size);
c8826dd538602d Tejun Heo       2009-08-14  3133  				continue;
c8826dd538602d Tejun Heo       2009-08-14  3134  			}
c8826dd538602d Tejun Heo       2009-08-14  3135  			/* copy and return the unused part */
fd1e8a1fe2b54d Tejun Heo       2009-08-14  3136  			memcpy(ptr, __per_cpu_load, ai->static_size);
23f917169ef157 Kefeng Wang     2022-01-19  3137  			pcpu_fc_free(ptr + size_sum, ai->unit_size - size_sum);
c8826dd538602d Tejun Heo       2009-08-14  3138  		}
66c3a75772247c Tejun Heo       2009-03-10  3139  	}
66c3a75772247c Tejun Heo       2009-03-10  3140  
c8826dd538602d Tejun Heo       2009-08-14  3141  	/* base address is now known, determine group base offsets */
6ea529a2037ce6 Tejun Heo       2009-09-24  3142  	for (group = 0; group < ai->nr_groups; group++) {
c8826dd538602d Tejun Heo       2009-08-14  3143  		ai->groups[group].base_offset = areas[group] - base;
6ea529a2037ce6 Tejun Heo       2009-09-24  3144  	}
c8826dd538602d Tejun Heo       2009-08-14  3145  
00206a69ee32f0 Matteo Croce    2019-03-18  3146  	pr_info("Embedded %zu pages/cpu s%zu r%zu d%zu u%zu\n",
00206a69ee32f0 Matteo Croce    2019-03-18  3147  		PFN_DOWN(size_sum), ai->static_size, ai->reserved_size,
fd1e8a1fe2b54d Tejun Heo       2009-08-14  3148  		ai->dyn_size, ai->unit_size);
66c3a75772247c Tejun Heo       2009-03-10  3149  
163fa23435cc9c Kefeng Wang     2019-07-03  3150  	pcpu_setup_first_chunk(ai, base);
c8826dd538602d Tejun Heo       2009-08-14  3151  	goto out_free;
c8826dd538602d Tejun Heo       2009-08-14  3152  
c8826dd538602d Tejun Heo       2009-08-14  3153  out_free_areas:
c8826dd538602d Tejun Heo       2009-08-14  3154  	for (group = 0; group < ai->nr_groups; group++)
f851c8d8583891 Michael Holzheu 2013-09-17  3155  		if (areas[group])
23f917169ef157 Kefeng Wang     2022-01-19  3156  			pcpu_fc_free(areas[group],
c8826dd538602d Tejun Heo       2009-08-14  3157  				ai->groups[group].nr_units * ai->unit_size);
c8826dd538602d Tejun Heo       2009-08-14  3158  out_free:
fd1e8a1fe2b54d Tejun Heo       2009-08-14  3159  	pcpu_free_alloc_info(ai);
c8826dd538602d Tejun Heo       2009-08-14  3160  	if (areas)
4421cca0a3e483 Mike Rapoport   2021-11-05  3161  		memblock_free(areas, areas_size);
fb435d5233f8b6 Tejun Heo       2009-08-14  3162  	return rc;
fa8a7094ba1679 Tejun Heo       2009-06-22  3163  }
3c9a024fde58b0 Tejun Heo       2010-09-09  3164  #endif /* BUILD_EMBED_FIRST_CHUNK */
d4b95f80399471 Tejun Heo       2009-07-04  3165  

:::::: The code at line 3112 was first introduced by commit
:::::: 9b7396624a7b503220d85428654634b60762f2b0 mm/percpu.c: fix potential memory leakage for pcpu_embed_first_chunk()

:::::: TO: zijun_hu <zijun_hu@htc.com>
:::::: CC: Tejun Heo <tj@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
