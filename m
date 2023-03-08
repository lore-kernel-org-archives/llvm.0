Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FCA28F3;
	Wed,  8 Mar 2023 10:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678272225; x=1709808225;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6PAjEEH6aHboGRjcTHYeBaoka6VaI2t8EjBrN4Cmajg=;
  b=c6ifvw1osigfFeAC8yD0jl8oeUqIb+hWPQzxd3h+8yi/n6oWuDB7i+AH
   9/HqYxWuYoAueULFW9G3ji0j7r2iUSSAgUFLEkoP3Zrzv1mklj0wZWVoF
   OY4qHKXz4VzbORgMz/iKnQ1j5NvgGemq/2jA7ilsjr4ylZSD8MDaVB8UJ
   eg7GjezTzHjiSttiR1eh+TKckU1oEMyoUe5nps+6dWQe7aSphrYnosxCA
   FpVWbQupNybX2qBlKkhN6j6fHKfrtfRuBpCgj5NBvjj9EotMhJMav3Nmg
   75Mrg3F9gkz7u0UonyqHrKpvlxRuYHmdym/6wl5SsffBKNusuKMQuGYsb
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="316522939"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; 
   d="scan'208";a="316522939"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 02:43:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="765957661"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; 
   d="scan'208";a="765957661"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 08 Mar 2023 02:43:43 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZrGo-00024f-2x;
	Wed, 08 Mar 2023 10:43:42 +0000
Date: Wed, 8 Mar 2023 18:43:28 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Jun <chenjun102@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC] mm/slub: Reduce memory consumption in extreme scenarios
Message-ID: <202303081804.A6mbhXOo-lkp@intel.com>
References: <20230307082811.120774-1-chenjun102@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230307082811.120774-1-chenjun102@huawei.com>

Hi Chen,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Jun/mm-slub-Reduce-memory-consumption-in-extreme-scenarios/20230307-163216
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230307082811.120774-1-chenjun102%40huawei.com
patch subject: [RFC] mm/slub: Reduce memory consumption in extreme scenarios
config: i386-randconfig-a013-20230306 (https://download.01.org/0day-ci/archive/20230308/202303081804.A6mbhXOo-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d00decb3ccc45b514f25df0d3775153a933ffaa9
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Chen-Jun/mm-slub-Reduce-memory-consumption-in-extreme-scenarios/20230307-163216
        git checkout d00decb3ccc45b514f25df0d3775153a933ffaa9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303081804.A6mbhXOo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/slub.c:3188:62: error: use of undeclared identifier 'try_thisnode'; did you mean 'try_thisndoe'?
           if (node != NUMA_NO_NODE && !(gfpflags & __GFP_THISNODE) && try_thisnode)
                                                                       ^~~~~~~~~~~~
                                                                       try_thisndoe
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^
   mm/slub.c:3072:6: note: 'try_thisndoe' declared here
           int try_thisndoe = 0;
               ^
>> mm/slub.c:3188:62: error: use of undeclared identifier 'try_thisnode'; did you mean 'try_thisndoe'?
           if (node != NUMA_NO_NODE && !(gfpflags & __GFP_THISNODE) && try_thisnode)
                                                                       ^~~~~~~~~~~~
                                                                       try_thisndoe
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^
   include/linux/compiler.h:58:61: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                               ^
   mm/slub.c:3072:6: note: 'try_thisndoe' declared here
           int try_thisndoe = 0;
               ^
>> mm/slub.c:3188:62: error: use of undeclared identifier 'try_thisnode'; did you mean 'try_thisndoe'?
           if (node != NUMA_NO_NODE && !(gfpflags & __GFP_THISNODE) && try_thisnode)
                                                                       ^~~~~~~~~~~~
                                                                       try_thisndoe
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                                        ^
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_value'
           (cond) ?                                        \
            ^
   mm/slub.c:3072:6: note: 'try_thisndoe' declared here
           int try_thisndoe = 0;
               ^
   mm/slub.c:3203:63: error: use of undeclared identifier 'try_thisnode'; did you mean 'try_thisndoe'?
                   if (node != NUMA_NO_NODE && !(gfpflags & __GFP_THISNODE) && try_thisnode) {
                                                                               ^~~~~~~~~~~~
                                                                               try_thisndoe
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^
   mm/slub.c:3072:6: note: 'try_thisndoe' declared here
           int try_thisndoe = 0;
               ^
   mm/slub.c:3203:63: error: use of undeclared identifier 'try_thisnode'; did you mean 'try_thisndoe'?
                   if (node != NUMA_NO_NODE && !(gfpflags & __GFP_THISNODE) && try_thisnode) {
                                                                               ^~~~~~~~~~~~
                                                                               try_thisndoe
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^
   include/linux/compiler.h:58:61: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                               ^
   mm/slub.c:3072:6: note: 'try_thisndoe' declared here
           int try_thisndoe = 0;
               ^
   mm/slub.c:3203:63: error: use of undeclared identifier 'try_thisnode'; did you mean 'try_thisndoe'?
                   if (node != NUMA_NO_NODE && !(gfpflags & __GFP_THISNODE) && try_thisnode) {
                                                                               ^~~~~~~~~~~~
                                                                               try_thisndoe
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                                        ^
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_value'
           (cond) ?                                        \
            ^
   mm/slub.c:3072:6: note: 'try_thisndoe' declared here
           int try_thisndoe = 0;
               ^
   mm/slub.c:3204:4: error: use of undeclared identifier 'try_thisnode'; did you mean 'try_thisndoe'?
                           try_thisnode = 0;
                           ^~~~~~~~~~~~
                           try_thisndoe
   mm/slub.c:3072:6: note: 'try_thisndoe' declared here
           int try_thisndoe = 0;
               ^
   7 errors generated.


vim +3188 mm/slub.c

  3045	
  3046	/*
  3047	 * Slow path. The lockless freelist is empty or we need to perform
  3048	 * debugging duties.
  3049	 *
  3050	 * Processing is still very fast if new objects have been freed to the
  3051	 * regular freelist. In that case we simply take over the regular freelist
  3052	 * as the lockless freelist and zap the regular freelist.
  3053	 *
  3054	 * If that is not working then we fall back to the partial lists. We take the
  3055	 * first element of the freelist as the object to allocate now and move the
  3056	 * rest of the freelist to the lockless freelist.
  3057	 *
  3058	 * And if we were unable to get a new slab from the partial slab lists then
  3059	 * we need to allocate a new slab. This is the slowest path since it involves
  3060	 * a call to the page allocator and the setup of a new slab.
  3061	 *
  3062	 * Version of __slab_alloc to use when we know that preemption is
  3063	 * already disabled (which is the case for bulk allocation).
  3064	 */
  3065	static void *___slab_alloc(struct kmem_cache *s, gfp_t gfpflags, int node,
  3066				  unsigned long addr, struct kmem_cache_cpu *c, unsigned int orig_size)
  3067	{
  3068		void *freelist;
  3069		struct slab *slab;
  3070		unsigned long flags;
  3071		struct partial_context pc;
  3072		int try_thisndoe = 0;
  3073	
  3074		stat(s, ALLOC_SLOWPATH);
  3075	
  3076	reread_slab:
  3077	
  3078		slab = READ_ONCE(c->slab);
  3079		if (!slab) {
  3080			/*
  3081			 * if the node is not online or has no normal memory, just
  3082			 * ignore the node constraint
  3083			 */
  3084			if (unlikely(node != NUMA_NO_NODE &&
  3085				     !node_isset(node, slab_nodes)))
  3086				node = NUMA_NO_NODE;
  3087			goto new_slab;
  3088		}
  3089	redo:
  3090	
  3091		if (unlikely(!node_match(slab, node))) {
  3092			/*
  3093			 * same as above but node_match() being false already
  3094			 * implies node != NUMA_NO_NODE
  3095			 */
  3096			if (!node_isset(node, slab_nodes)) {
  3097				node = NUMA_NO_NODE;
  3098			} else {
  3099				stat(s, ALLOC_NODE_MISMATCH);
  3100				goto deactivate_slab;
  3101			}
  3102		}
  3103	
  3104		/*
  3105		 * By rights, we should be searching for a slab page that was
  3106		 * PFMEMALLOC but right now, we are losing the pfmemalloc
  3107		 * information when the page leaves the per-cpu allocator
  3108		 */
  3109		if (unlikely(!pfmemalloc_match(slab, gfpflags)))
  3110			goto deactivate_slab;
  3111	
  3112		/* must check again c->slab in case we got preempted and it changed */
  3113		local_lock_irqsave(&s->cpu_slab->lock, flags);
  3114		if (unlikely(slab != c->slab)) {
  3115			local_unlock_irqrestore(&s->cpu_slab->lock, flags);
  3116			goto reread_slab;
  3117		}
  3118		freelist = c->freelist;
  3119		if (freelist)
  3120			goto load_freelist;
  3121	
  3122		freelist = get_freelist(s, slab);
  3123	
  3124		if (!freelist) {
  3125			c->slab = NULL;
  3126			c->tid = next_tid(c->tid);
  3127			local_unlock_irqrestore(&s->cpu_slab->lock, flags);
  3128			stat(s, DEACTIVATE_BYPASS);
  3129			goto new_slab;
  3130		}
  3131	
  3132		stat(s, ALLOC_REFILL);
  3133	
  3134	load_freelist:
  3135	
  3136		lockdep_assert_held(this_cpu_ptr(&s->cpu_slab->lock));
  3137	
  3138		/*
  3139		 * freelist is pointing to the list of objects to be used.
  3140		 * slab is pointing to the slab from which the objects are obtained.
  3141		 * That slab must be frozen for per cpu allocations to work.
  3142		 */
  3143		VM_BUG_ON(!c->slab->frozen);
  3144		c->freelist = get_freepointer(s, freelist);
  3145		c->tid = next_tid(c->tid);
  3146		local_unlock_irqrestore(&s->cpu_slab->lock, flags);
  3147		return freelist;
  3148	
  3149	deactivate_slab:
  3150	
  3151		local_lock_irqsave(&s->cpu_slab->lock, flags);
  3152		if (slab != c->slab) {
  3153			local_unlock_irqrestore(&s->cpu_slab->lock, flags);
  3154			goto reread_slab;
  3155		}
  3156		freelist = c->freelist;
  3157		c->slab = NULL;
  3158		c->freelist = NULL;
  3159		c->tid = next_tid(c->tid);
  3160		local_unlock_irqrestore(&s->cpu_slab->lock, flags);
  3161		deactivate_slab(s, slab, freelist);
  3162	
  3163	new_slab:
  3164	
  3165		if (slub_percpu_partial(c)) {
  3166			local_lock_irqsave(&s->cpu_slab->lock, flags);
  3167			if (unlikely(c->slab)) {
  3168				local_unlock_irqrestore(&s->cpu_slab->lock, flags);
  3169				goto reread_slab;
  3170			}
  3171			if (unlikely(!slub_percpu_partial(c))) {
  3172				local_unlock_irqrestore(&s->cpu_slab->lock, flags);
  3173				/* we were preempted and partial list got empty */
  3174				goto new_objects;
  3175			}
  3176	
  3177			slab = c->slab = slub_percpu_partial(c);
  3178			slub_set_percpu_partial(c, slab);
  3179			local_unlock_irqrestore(&s->cpu_slab->lock, flags);
  3180			stat(s, CPU_PARTIAL_ALLOC);
  3181			goto redo;
  3182		}
  3183	
  3184	new_objects:
  3185		pc.flags = gfpflags;
  3186	
  3187		/* Try to get page from specific node even if __GFP_THISNODE is not set */
> 3188		if (node != NUMA_NO_NODE && !(gfpflags & __GFP_THISNODE) && try_thisnode)
  3189				pc.flags |= __GFP_THISNODE;
  3190	
  3191		pc.slab = &slab;
  3192		pc.orig_size = orig_size;
  3193		freelist = get_partial(s, node, &pc);
  3194		if (freelist)
  3195			goto check_new_slab;
  3196	
  3197		slub_put_cpu_ptr(s->cpu_slab);
  3198		slab = new_slab(s, pc.flags, node);
  3199		c = slub_get_cpu_ptr(s->cpu_slab);
  3200	
  3201		if (unlikely(!slab)) {
  3202			/* Try to get page from any other node */
  3203			if (node != NUMA_NO_NODE && !(gfpflags & __GFP_THISNODE) && try_thisnode) {
  3204				try_thisnode = 0;
  3205				goto new_objects;
  3206			}
  3207	
  3208			slab_out_of_memory(s, gfpflags, node);
  3209			return NULL;
  3210		}
  3211	
  3212		stat(s, ALLOC_SLAB);
  3213	
  3214		if (kmem_cache_debug(s)) {
  3215			freelist = alloc_single_from_new_slab(s, slab, orig_size);
  3216	
  3217			if (unlikely(!freelist))
  3218				goto new_objects;
  3219	
  3220			if (s->flags & SLAB_STORE_USER)
  3221				set_track(s, freelist, TRACK_ALLOC, addr);
  3222	
  3223			return freelist;
  3224		}
  3225	
  3226		/*
  3227		 * No other reference to the slab yet so we can
  3228		 * muck around with it freely without cmpxchg
  3229		 */
  3230		freelist = slab->freelist;
  3231		slab->freelist = NULL;
  3232		slab->inuse = slab->objects;
  3233		slab->frozen = 1;
  3234	
  3235		inc_slabs_node(s, slab_nid(slab), slab->objects);
  3236	
  3237	check_new_slab:
  3238	
  3239		if (kmem_cache_debug(s)) {
  3240			/*
  3241			 * For debug caches here we had to go through
  3242			 * alloc_single_from_partial() so just store the tracking info
  3243			 * and return the object
  3244			 */
  3245			if (s->flags & SLAB_STORE_USER)
  3246				set_track(s, freelist, TRACK_ALLOC, addr);
  3247	
  3248			return freelist;
  3249		}
  3250	
  3251		if (unlikely(!pfmemalloc_match(slab, gfpflags))) {
  3252			/*
  3253			 * For !pfmemalloc_match() case we don't load freelist so that
  3254			 * we don't make further mismatched allocations easier.
  3255			 */
  3256			deactivate_slab(s, slab, get_freepointer(s, freelist));
  3257			return freelist;
  3258		}
  3259	
  3260	retry_load_slab:
  3261	
  3262		local_lock_irqsave(&s->cpu_slab->lock, flags);
  3263		if (unlikely(c->slab)) {
  3264			void *flush_freelist = c->freelist;
  3265			struct slab *flush_slab = c->slab;
  3266	
  3267			c->slab = NULL;
  3268			c->freelist = NULL;
  3269			c->tid = next_tid(c->tid);
  3270	
  3271			local_unlock_irqrestore(&s->cpu_slab->lock, flags);
  3272	
  3273			deactivate_slab(s, flush_slab, flush_freelist);
  3274	
  3275			stat(s, CPUSLAB_FLUSH);
  3276	
  3277			goto retry_load_slab;
  3278		}
  3279		c->slab = slab;
  3280	
  3281		goto load_freelist;
  3282	}
  3283	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
