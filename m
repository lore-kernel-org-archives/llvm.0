Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0311097B;
	Tue,  8 Aug 2023 13:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691500381; x=1723036381;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R14eUOJNlfzrsN2RP/Lfrkg2AOCKW/Urf1D7/yTtpiw=;
  b=FK/LIrwKOTA5i/PDt48VJnYGQWLivkcSCge7xU7OEc9qBPpGxZw+iIWQ
   l8WEUDkdt9XOz/mONBELjmWLSN5t3PVFauLBK7BVpFc9bSELGpXPiYlwc
   7UiYUPgRqxQwLIzz08TM4OEoFUV2GV88CBozHgOUqzueBCagvbbg8Km3n
   mkIP7YFvxLs8mf4yuH4Tyk5b4Cx54EQ2Xn4eKk7nkmWvUcfIyqMbno4ZF
   eT0XEhXGl+eoNbNWebX02Yxj76wrQ6PmNAGJpd6ucL7MT9hZIBmImMKJc
   nBtcoALJt8g+KBUCmD3wdjuQI//020ZlnA5n5lnBj36AM2pSSX4/ZHC9U
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="374491593"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="374491593"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 06:13:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="977856608"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="977856608"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 08 Aug 2023 06:12:58 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTMW9-0005MS-2g;
	Tue, 08 Aug 2023 13:12:57 +0000
Date: Tue, 8 Aug 2023 21:12:16 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, linux-mm@kvack.org
Subject: [vbabka:slub-percpu-caches-v1 2/5] mm/slub.c:3568:12: error: call to
 undeclared function 'alloc_from_pca'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202308082130.CSS5uQs2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git slub-percpu-caches-v1
head:   23793c9cd4b2fc31144dba68dd67554b8e4308e9
commit: 88f3fc9382220fb76fbd700a74cce623dadf8138 [2/5] mm, slub: add opt-in slub_percpu_array
config: hexagon-randconfig-r016-20230808 (https://download.01.org/0day-ci/archive/20230808/202308082130.CSS5uQs2-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230808/202308082130.CSS5uQs2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308082130.CSS5uQs2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/slub.c:14:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
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
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
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
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   mm/slub.c:2351:15: warning: variable 'partial_slabs' set but not used [-Wunused-but-set-variable]
    2351 |         unsigned int partial_slabs = 0;
         |                      ^
>> mm/slub.c:3568:12: error: call to undeclared function 'alloc_from_pca'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3568 |                 object = alloc_from_pca(s);
         |                          ^
>> mm/slub.c:3568:10: error: incompatible integer to pointer conversion assigning to 'void *' from 'int' [-Wint-conversion]
    3568 |                 object = alloc_from_pca(s);
         |                        ^ ~~~~~~~~~~~~~~~~~
   7 warnings and 2 errors generated.


vim +/alloc_from_pca +3568 mm/slub.c

  3541	
  3542	/*
  3543	 * Inlined fastpath so that allocation functions (kmalloc, kmem_cache_alloc)
  3544	 * have the fastpath folded into their functions. So no function call
  3545	 * overhead for requests that can be satisfied on the fastpath.
  3546	 *
  3547	 * The fastpath works by first checking if the lockless freelist can be used.
  3548	 * If not then __slab_alloc is called for slow processing.
  3549	 *
  3550	 * Otherwise we can simply pick the next object from the lockless free list.
  3551	 */
  3552	static __fastpath_inline void *slab_alloc_node(struct kmem_cache *s, struct list_lru *lru,
  3553			gfp_t gfpflags, int node, unsigned long addr, size_t orig_size)
  3554	{
  3555		void *object;
  3556		struct obj_cgroup *objcg = NULL;
  3557		bool init = false;
  3558	
  3559		s = slab_pre_alloc_hook(s, lru, &objcg, 1, gfpflags);
  3560		if (!s)
  3561			return NULL;
  3562	
  3563		object = kfence_alloc(s, orig_size, gfpflags);
  3564		if (unlikely(object))
  3565			goto out;
  3566	
  3567		if (s->cpu_array)
> 3568			object = alloc_from_pca(s);
  3569	
  3570		if (!object)
  3571			object = __slab_alloc_node(s, gfpflags, node, addr, orig_size);
  3572	
  3573		maybe_wipe_obj_freeptr(s, object);
  3574		init = slab_want_init_on_alloc(gfpflags, s);
  3575	
  3576	out:
  3577		/*
  3578		 * When init equals 'true', like for kzalloc() family, only
  3579		 * @orig_size bytes might be zeroed instead of s->object_size
  3580		 */
  3581		slab_post_alloc_hook(s, objcg, gfpflags, 1, &object, init, orig_size);
  3582	
  3583		return object;
  3584	}
  3585	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
