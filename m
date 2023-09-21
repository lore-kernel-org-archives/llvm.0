Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8332E19467;
	Thu, 21 Sep 2023 21:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695331362; x=1726867362;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jhQLho1TErJRlBh/xQfl84Jgd3wYDnOZiZosjkVsil0=;
  b=F6LluF4Yu2PDSEm3XBuWmrMi3kUykIAj4zcFpwtvUHrKF5X+POq34DeZ
   SZSLaGWF2g+u3bZsHBI0aJG+8RZDm+ktNHP28rYGTarPOVN01ALksqpkq
   uTbiQ5123CLRsHMJ5Y5m4xqTL0HcP+ecx7smm0oyeABhopalhDmFggzGG
   KuDn3dqJChvPusfcA1+GU1RMqovRfKfpZal/MuRHx8H8qIKYbWqVtkQ0u
   p+Hmqm2CmkrQ5ppey7cJ2Z1Tz+4rVk52eccgaHg2eFMcCyX6t6Dg1sfYt
   gAjsM8UkL4WYr22R159h7XcrVxBXpScWRcOX0fsxTfSQbaV+q50kZWP6V
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="447147955"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; 
   d="scan'208";a="447147955"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 14:22:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="750562579"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; 
   d="scan'208";a="750562579"
Received: from lkp-server02.sh.intel.com (HELO b77866e22201) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 21 Sep 2023 14:22:38 -0700
Received: from kbuild by b77866e22201 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjR84-0000QH-16;
	Thu, 21 Sep 2023 21:22:32 +0000
Date: Fri, 22 Sep 2023 05:21:36 +0800
From: kernel test robot <lkp@intel.com>
To: Nhat Pham <nphamcs@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/2] zswap: shrinks zswap pool based on memory pressure
Message-ID: <202309220529.KnhhHX5x-lkp@intel.com>
References: <20230919171447.2712746-3-nphamcs@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230919171447.2712746-3-nphamcs@gmail.com>

Hi Nhat,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.6-rc2]
[cannot apply to akpm-mm/mm-everything next-20230921]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nhat-Pham/zswap-make-shrinking-memcg-aware/20230920-011604
base:   linus/master
patch link:    https://lore.kernel.org/r/20230919171447.2712746-3-nphamcs%40gmail.com
patch subject: [PATCH v2 2/2] zswap: shrinks zswap pool based on memory pressure
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230922/202309220529.KnhhHX5x-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230922/202309220529.KnhhHX5x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309220529.KnhhHX5x-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/zswap.c:520:38: error: no member named 'private_data' in 'struct shrinker'
           struct zswap_pool *pool = shrinker->private_data;
                                     ~~~~~~~~  ^
   mm/zswap.c:552:38: error: no member named 'private_data' in 'struct shrinker'
           struct zswap_pool *pool = shrinker->private_data;
                                     ~~~~~~~~  ^
>> mm/zswap.c:592:3: error: call to undeclared function 'shrinker_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   shrinker_alloc(SHRINKER_NUMA_AWARE | SHRINKER_MEMCG_AWARE, "mm-zswap");
                   ^
>> mm/zswap.c:591:17: error: incompatible integer to pointer conversion assigning to 'struct shrinker *' from 'int' [-Wint-conversion]
           pool->shrinker =
                          ^
   mm/zswap.c:596:18: error: no member named 'private_data' in 'struct shrinker'
           pool->shrinker->private_data = pool;
           ~~~~~~~~~~~~~~  ^
>> mm/zswap.c:1004:2: error: call to undeclared function 'shrinker_register'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           shrinker_register(pool->shrinker);
           ^
   mm/zswap.c:1004:2: note: did you mean 'driver_register'?
   include/linux/device/driver.h:125:18: note: 'driver_register' declared here
   int __must_check driver_register(struct device_driver *drv);
                    ^
>> mm/zswap.c:1012:2: error: call to undeclared function 'shrinker_free'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           shrinker_free(pool->shrinker);
           ^
   mm/zswap.c:1070:2: error: call to undeclared function 'shrinker_free'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           shrinker_free(pool->shrinker);
           ^
   8 errors generated.


vim +520 mm/zswap.c

   510	
   511	/*********************************
   512	* shrinker functions
   513	**********************************/
   514	static enum lru_status shrink_memcg_cb(struct list_head *item, struct list_lru_one *l,
   515					       spinlock_t *lock, void *arg);
   516	
   517	static unsigned long zswap_shrinker_scan(struct shrinker *shrinker,
   518			struct shrink_control *sc)
   519	{
 > 520		struct zswap_pool *pool = shrinker->private_data;
   521		unsigned long shrink_ret, nr_zswap_protected, flags,
   522			lru_size = list_lru_shrink_count(&pool->list_lru, sc);
   523		struct lruvec *lruvec = mem_cgroup_lruvec(sc->memcg, NODE_DATA(sc->nid));
   524		bool encountered_page_in_swapcache = false;
   525	
   526		spin_lock_irqsave(&lruvec->lru_lock, flags);
   527		nr_zswap_protected = lruvec->nr_zswap_protected;
   528		spin_unlock_irqrestore(&lruvec->lru_lock, flags);
   529	
   530		/*
   531		 * Abort if the shrinker is disabled or if we are shrinking into the
   532		 * protected region.
   533		 */
   534		if (!is_shrinker_enabled(sc->memcg) ||
   535				nr_zswap_protected >= lru_size - sc->nr_to_scan) {
   536			sc->nr_scanned = 0;
   537			return SHRINK_STOP;
   538		}
   539	
   540		shrink_ret = list_lru_shrink_walk(&pool->list_lru, sc, &shrink_memcg_cb,
   541			&encountered_page_in_swapcache);
   542	
   543		if (encountered_page_in_swapcache)
   544			return SHRINK_STOP;
   545	
   546		return shrink_ret ? shrink_ret : SHRINK_STOP;
   547	}
   548	
   549	static unsigned long zswap_shrinker_count(struct shrinker *shrinker,
   550			struct shrink_control *sc)
   551	{
   552		struct zswap_pool *pool = shrinker->private_data;
   553		struct mem_cgroup *memcg = sc->memcg;
   554		struct lruvec *lruvec = mem_cgroup_lruvec(memcg, NODE_DATA(sc->nid));
   555		unsigned long nr_backing, nr_stored, nr_freeable, flags;
   556	
   557	#ifdef CONFIG_MEMCG_KMEM
   558		cgroup_rstat_flush(memcg->css.cgroup);
   559		nr_backing = memcg_page_state(memcg, MEMCG_ZSWAP_B) >> PAGE_SHIFT;
   560		nr_stored = memcg_page_state(memcg, MEMCG_ZSWAPPED);
   561	#else
   562		/* use pool stats instead of memcg stats */
   563		nr_backing = get_zswap_pool_size(pool) >> PAGE_SHIFT;
   564		nr_stored = atomic_read(&pool->nr_stored);
   565	#endif
   566	
   567		if (!is_shrinker_enabled(memcg) || !nr_stored)
   568			return 0;
   569	
   570		nr_freeable = list_lru_shrink_count(&pool->list_lru, sc);
   571		/*
   572		 * Subtract the lru size by an estimate of the number of pages
   573		 * that should be protected.
   574		 */
   575		spin_lock_irqsave(&lruvec->lru_lock, flags);
   576		nr_freeable = nr_freeable > lruvec->nr_zswap_protected ?
   577			nr_freeable - lruvec->nr_zswap_protected : 0;
   578		spin_unlock_irqrestore(&lruvec->lru_lock, flags);
   579	
   580		/*
   581		 * Scale the number of freeable pages by the memory saving factor.
   582		 * This ensures that the better zswap compresses memory, the fewer
   583		 * pages we will evict to swap (as it will otherwise incur IO for
   584		 * relatively small memory saving).
   585		 */
   586		return mult_frac(nr_freeable, nr_backing, nr_stored);
   587	}
   588	
   589	static void zswap_alloc_shrinker(struct zswap_pool *pool)
   590	{
 > 591		pool->shrinker =
 > 592			shrinker_alloc(SHRINKER_NUMA_AWARE | SHRINKER_MEMCG_AWARE, "mm-zswap");
   593		if (!pool->shrinker)
   594			return;
   595	
   596		pool->shrinker->private_data = pool;
   597		pool->shrinker->scan_objects = zswap_shrinker_scan;
   598		pool->shrinker->count_objects = zswap_shrinker_count;
   599		pool->shrinker->batch = 0;
   600		pool->shrinker->seeks = DEFAULT_SEEKS;
   601	}
   602	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
