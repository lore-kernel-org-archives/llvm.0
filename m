Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C7E37164;
	Tue, 24 Oct 2023 15:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BGW1avot"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698161471; x=1729697471;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uMybm0MT19D1OQjDqmtXh8TrK4t5yVz7glRZddnJakg=;
  b=BGW1avotrkIWaukvu4p3vL7An7PPPDiX2JncDRs9+4TjbUciQytLVjQG
   bFwgNOIM9H3/UDgiCrTvqiynPyQz/11JOdMzdCFHbZo1LJlUU7BBz/nDl
   2uTOz3+NRFZPXEOi9NfzlL/ydbafwBK89C6HrnDaqSAm5IiQENGii4uUq
   871/VIXXJoorwwID6jxUzIj2S+UK3+y0Pmd3FL+GWFpZHMPL+Cj/Fwo9h
   7alB5r2SiDqT4tii1amtZuvo7VdkJkoCA3dQnLowf8kH2AMzmP6FYcVfw
   Ltfll5/jVAnKe7BZwFlmOLyjQKNirqvWpLJYuZPHxzRFmtgKFDVH3xKb6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="418215786"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; 
   d="scan'208";a="418215786"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 08:23:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="824326795"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; 
   d="scan'208";a="824326795"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 24 Oct 2023 08:23:07 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvJFI-0007xd-2U;
	Tue, 24 Oct 2023 15:23:04 +0000
Date: Tue, 24 Oct 2023 23:22:55 +0800
From: kernel test robot <lkp@intel.com>
To: chengming.zhou@linux.dev
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 6/7] slub: Delay freezing of partial slabs
Message-ID: <202310242306.AvWAQtIn-lkp@intel.com>
References: <20231024093345.3676493-7-chengming.zhou@linux.dev>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231024093345.3676493-7-chengming.zhou@linux.dev>

Hi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on vbabka-slab/for-next]
[also build test ERROR on linus/master v6.6-rc7 next-20231024]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/chengming-zhou-linux-dev/slub-Keep-track-of-whether-slub-is-on-the-per-node-partial-list/20231024-173519
base:   git://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git for-next
patch link:    https://lore.kernel.org/r/20231024093345.3676493-7-chengming.zhou%40linux.dev
patch subject: [RFC PATCH v3 6/7] slub: Delay freezing of partial slabs
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20231024/202310242306.AvWAQtIn-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231024/202310242306.AvWAQtIn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310242306.AvWAQtIn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/slub.c:14:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from mm/slub.c:14:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from mm/slub.c:14:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   mm/slub.c:2235:15: warning: variable 'partial_slabs' set but not used [-Wunused-but-set-variable]
    2235 |         unsigned int partial_slabs = 0;
         |                      ^
>> mm/slub.c:3177:10: error: no member named 'next' in 'struct slab'
    3177 |                         slab->next = NULL;
         |                         ~~~~  ^
>> mm/slub.c:3178:4: error: call to undeclared function '__unfreeze_partials'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3178 |                         __unfreeze_partials(s, slab);
         |                         ^
   mm/slub.c:3178:4: note: did you mean 'unfreeze_partials'?
   mm/slub.c:2676:20: note: 'unfreeze_partials' declared here
    2676 | static inline void unfreeze_partials(struct kmem_cache *s) { }
         |                    ^
   13 warnings and 2 errors generated.


vim +3177 mm/slub.c

  3040	
  3041	/*
  3042	 * Slow path. The lockless freelist is empty or we need to perform
  3043	 * debugging duties.
  3044	 *
  3045	 * Processing is still very fast if new objects have been freed to the
  3046	 * regular freelist. In that case we simply take over the regular freelist
  3047	 * as the lockless freelist and zap the regular freelist.
  3048	 *
  3049	 * If that is not working then we fall back to the partial lists. We take the
  3050	 * first element of the freelist as the object to allocate now and move the
  3051	 * rest of the freelist to the lockless freelist.
  3052	 *
  3053	 * And if we were unable to get a new slab from the partial slab lists then
  3054	 * we need to allocate a new slab. This is the slowest path since it involves
  3055	 * a call to the page allocator and the setup of a new slab.
  3056	 *
  3057	 * Version of __slab_alloc to use when we know that preemption is
  3058	 * already disabled (which is the case for bulk allocation).
  3059	 */
  3060	static void *___slab_alloc(struct kmem_cache *s, gfp_t gfpflags, int node,
  3061				  unsigned long addr, struct kmem_cache_cpu *c, unsigned int orig_size)
  3062	{
  3063		void *freelist;
  3064		struct slab *slab;
  3065		unsigned long flags;
  3066		struct partial_context pc;
  3067	
  3068		stat(s, ALLOC_SLOWPATH);
  3069	
  3070	reread_slab:
  3071	
  3072		slab = READ_ONCE(c->slab);
  3073		if (!slab) {
  3074			/*
  3075			 * if the node is not online or has no normal memory, just
  3076			 * ignore the node constraint
  3077			 */
  3078			if (unlikely(node != NUMA_NO_NODE &&
  3079				     !node_isset(node, slab_nodes)))
  3080				node = NUMA_NO_NODE;
  3081			goto new_slab;
  3082		}
  3083	
  3084		if (unlikely(!node_match(slab, node))) {
  3085			/*
  3086			 * same as above but node_match() being false already
  3087			 * implies node != NUMA_NO_NODE
  3088			 */
  3089			if (!node_isset(node, slab_nodes)) {
  3090				node = NUMA_NO_NODE;
  3091			} else {
  3092				stat(s, ALLOC_NODE_MISMATCH);
  3093				goto deactivate_slab;
  3094			}
  3095		}
  3096	
  3097		/*
  3098		 * By rights, we should be searching for a slab page that was
  3099		 * PFMEMALLOC but right now, we are losing the pfmemalloc
  3100		 * information when the page leaves the per-cpu allocator
  3101		 */
  3102		if (unlikely(!pfmemalloc_match(slab, gfpflags)))
  3103			goto deactivate_slab;
  3104	
  3105		/* must check again c->slab in case we got preempted and it changed */
  3106		local_lock_irqsave(&s->cpu_slab->lock, flags);
  3107		if (unlikely(slab != c->slab)) {
  3108			local_unlock_irqrestore(&s->cpu_slab->lock, flags);
  3109			goto reread_slab;
  3110		}
  3111		freelist = c->freelist;
  3112		if (freelist)
  3113			goto load_freelist;
  3114	
  3115		freelist = get_freelist(s, slab);
  3116	
  3117		if (!freelist) {
  3118			c->slab = NULL;
  3119			c->tid = next_tid(c->tid);
  3120			local_unlock_irqrestore(&s->cpu_slab->lock, flags);
  3121			stat(s, DEACTIVATE_BYPASS);
  3122			goto new_slab;
  3123		}
  3124	
  3125		stat(s, ALLOC_REFILL);
  3126	
  3127	load_freelist:
  3128	
  3129		lockdep_assert_held(this_cpu_ptr(&s->cpu_slab->lock));
  3130	
  3131		/*
  3132		 * freelist is pointing to the list of objects to be used.
  3133		 * slab is pointing to the slab from which the objects are obtained.
  3134		 * That slab must be frozen for per cpu allocations to work.
  3135		 */
  3136		VM_BUG_ON(!c->slab->frozen);
  3137		c->freelist = get_freepointer(s, freelist);
  3138		c->tid = next_tid(c->tid);
  3139		local_unlock_irqrestore(&s->cpu_slab->lock, flags);
  3140		return freelist;
  3141	
  3142	deactivate_slab:
  3143	
  3144		local_lock_irqsave(&s->cpu_slab->lock, flags);
  3145		if (slab != c->slab) {
  3146			local_unlock_irqrestore(&s->cpu_slab->lock, flags);
  3147			goto reread_slab;
  3148		}
  3149		freelist = c->freelist;
  3150		c->slab = NULL;
  3151		c->freelist = NULL;
  3152		c->tid = next_tid(c->tid);
  3153		local_unlock_irqrestore(&s->cpu_slab->lock, flags);
  3154		deactivate_slab(s, slab, freelist);
  3155	
  3156	new_slab:
  3157	
  3158		while (slub_percpu_partial(c)) {
  3159			local_lock_irqsave(&s->cpu_slab->lock, flags);
  3160			if (unlikely(c->slab)) {
  3161				local_unlock_irqrestore(&s->cpu_slab->lock, flags);
  3162				goto reread_slab;
  3163			}
  3164			if (unlikely(!slub_percpu_partial(c))) {
  3165				local_unlock_irqrestore(&s->cpu_slab->lock, flags);
  3166				/* we were preempted and partial list got empty */
  3167				goto new_objects;
  3168			}
  3169	
  3170			slab = slub_percpu_partial(c);
  3171			slub_set_percpu_partial(c, slab);
  3172			local_unlock_irqrestore(&s->cpu_slab->lock, flags);
  3173			stat(s, CPU_PARTIAL_ALLOC);
  3174	
  3175			if (unlikely(!node_match(slab, node) ||
  3176				     !pfmemalloc_match(slab, gfpflags))) {
> 3177				slab->next = NULL;
> 3178				__unfreeze_partials(s, slab);
  3179				continue;
  3180			}
  3181	
  3182			freelist = freeze_slab(s, slab);
  3183			goto retry_load_slab;
  3184		}
  3185	
  3186	new_objects:
  3187	
  3188		pc.flags = gfpflags;
  3189		pc.orig_size = orig_size;
  3190		slab = get_partial(s, node, &pc);
  3191		if (slab) {
  3192			if (kmem_cache_debug(s)) {
  3193				freelist = pc.object;
  3194				/*
  3195				 * For debug caches here we had to go through
  3196				 * alloc_single_from_partial() so just store the
  3197				 * tracking info and return the object.
  3198				 */
  3199				if (s->flags & SLAB_STORE_USER)
  3200					set_track(s, freelist, TRACK_ALLOC, addr);
  3201	
  3202				return freelist;
  3203			}
  3204	
  3205			freelist = freeze_slab(s, slab);
  3206			goto retry_load_slab;
  3207		}
  3208	
  3209		slub_put_cpu_ptr(s->cpu_slab);
  3210		slab = new_slab(s, gfpflags, node);
  3211		c = slub_get_cpu_ptr(s->cpu_slab);
  3212	
  3213		if (unlikely(!slab)) {
  3214			slab_out_of_memory(s, gfpflags, node);
  3215			return NULL;
  3216		}
  3217	
  3218		stat(s, ALLOC_SLAB);
  3219	
  3220		if (kmem_cache_debug(s)) {
  3221			freelist = alloc_single_from_new_slab(s, slab, orig_size);
  3222	
  3223			if (unlikely(!freelist))
  3224				goto new_objects;
  3225	
  3226			if (s->flags & SLAB_STORE_USER)
  3227				set_track(s, freelist, TRACK_ALLOC, addr);
  3228	
  3229			return freelist;
  3230		}
  3231	
  3232		/*
  3233		 * No other reference to the slab yet so we can
  3234		 * muck around with it freely without cmpxchg
  3235		 */
  3236		freelist = slab->freelist;
  3237		slab->freelist = NULL;
  3238		slab->inuse = slab->objects;
  3239		slab->frozen = 1;
  3240	
  3241		inc_slabs_node(s, slab_nid(slab), slab->objects);
  3242	
  3243		if (unlikely(!pfmemalloc_match(slab, gfpflags))) {
  3244			/*
  3245			 * For !pfmemalloc_match() case we don't load freelist so that
  3246			 * we don't make further mismatched allocations easier.
  3247			 */
  3248			deactivate_slab(s, slab, get_freepointer(s, freelist));
  3249			return freelist;
  3250		}
  3251	
  3252	retry_load_slab:
  3253	
  3254		local_lock_irqsave(&s->cpu_slab->lock, flags);
  3255		if (unlikely(c->slab)) {
  3256			void *flush_freelist = c->freelist;
  3257			struct slab *flush_slab = c->slab;
  3258	
  3259			c->slab = NULL;
  3260			c->freelist = NULL;
  3261			c->tid = next_tid(c->tid);
  3262	
  3263			local_unlock_irqrestore(&s->cpu_slab->lock, flags);
  3264	
  3265			deactivate_slab(s, flush_slab, flush_freelist);
  3266	
  3267			stat(s, CPUSLAB_FLUSH);
  3268	
  3269			goto retry_load_slab;
  3270		}
  3271		c->slab = slab;
  3272	
  3273		goto load_freelist;
  3274	}
  3275	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
