Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DEC2C9D
	for <llvm@lists.linux.dev>; Wed, 12 Jan 2022 22:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642027162; x=1673563162;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gamCH+QnbIIN76B/rDAS3NJYC/KWISvw8MjbuUTsI/A=;
  b=jb5CZ0BpfuuK5XqSt6c5N2UsKJAd1U1KFnygLMGQupmNYXDn+4gh3e1Y
   r5ihOE7rrAvKeGscVX/0zs907ONxw+vMsKKp/J1YpPatn4ICaAYPYTL0t
   iDYI6OoAccMmT/jJ6/JU/v9Xt8srehd8kqSoYvestlLsDKETplpejzHzl
   4bfKxJUcNJFsXs83VTO1h7czS1Bimst3N0rOGYj5cI5Lt92tqwCzxPTS4
   zVUXYFdVpdACFWrSZodvF2Fc6cczfbK+q7J2hR/NHeVGzYthiHT9HhUKZ
   njQ/wPq890kwaUU+qSXqA5rQGFxvA8e5rZ8GaG9rscHLiIasW2h1uyuay
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="307218062"
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; 
   d="scan'208";a="307218062"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2022 14:39:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; 
   d="scan'208";a="558880062"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 12 Jan 2022 14:39:20 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n7mH2-0006V6-5A; Wed, 12 Jan 2022 22:39:20 +0000
Date: Thu, 13 Jan 2022 06:38:53 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mingo-tip:sched/headers 1117/2382] mm/workingset.c:590:53: error:
 incompatible function pointer types passing 'enum lru_status (struct
 list_head *, struct list_lru_one *, spinlock_t *, void *)' (aka 'enum
 lru_status (struct list_head *, struct list_lru_one *, struct spinlock *,
 void *)') t...
Message-ID: <202201130624.YrrhRIcl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git sched/headers
head:   1a880941a087613ed42f77001229edfcf75ea8a5
commit: d5182ee55730b8b315527a8f308c7cb6e4f4d569 [1117/2382] headers/deps: Add header dependencies to .c files: <linux/list_lru_api.h>
config: i386-randconfig-a014-20220109 (https://download.01.org/0day-ci/archive/20220113/202201130624.YrrhRIcl-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 244dd2913a43a200f5a6544d424cdc37b771028b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git/commit/?id=d5182ee55730b8b315527a8f308c7cb6e4f4d569
        git remote add mingo-tip git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git
        git fetch --no-tags mingo-tip sched/headers
        git checkout d5182ee55730b8b315527a8f308c7cb6e4f4d569
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

Note: the mingo-tip/sched/headers HEAD 1a880941a087613ed42f77001229edfcf75ea8a5 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from mm/list_lru.c:8:
   In file included from include/linux/list_lru_api.h:1:
>> include/linux/list_lru.h:42:2: error: unknown type name 'spinlock_t'
           spinlock_t              lock;
           ^
   include/linux/list_lru.h:63:14: warning: declaration of 'struct lock_class_key' will not be visible outside of this function [-Wvisibility]
                       struct lock_class_key *key, struct shrinker *shrinker);
                              ^
   include/linux/list_lru.h:142:30: error: unknown type name 'spinlock_t'
                   struct list_lru_one *list, spinlock_t *lock, void *cb_arg);
                                              ^
   mm/list_lru.c:571:5: error: conflicting types for '__list_lru_init'
   int __list_lru_init(struct list_lru *lru, bool memcg_aware,
       ^
   include/linux/list_lru.h:62:5: note: previous declaration is here
   int __list_lru_init(struct list_lru *lru, bool memcg_aware,
       ^
   1 warning and 3 errors generated.
--
   In file included from mm/workingset.c:8:
   In file included from include/linux/list_lru_api.h:1:
>> include/linux/list_lru.h:42:2: error: unknown type name 'spinlock_t'
           spinlock_t              lock;
           ^
   include/linux/list_lru.h:63:14: warning: declaration of 'struct lock_class_key' will not be visible outside of this function [-Wvisibility]
                       struct lock_class_key *key, struct shrinker *shrinker);
                              ^
   include/linux/list_lru.h:142:30: error: unknown type name 'spinlock_t'
                   struct list_lru_one *list, spinlock_t *lock, void *cb_arg);
                                              ^
>> mm/workingset.c:590:53: error: incompatible function pointer types passing 'enum lru_status (struct list_head *, struct list_lru_one *, spinlock_t *, void *)' (aka 'enum lru_status (struct list_head *, struct list_lru_one *, struct spinlock *, void *)') to parameter of type 'list_lru_walk_cb' (aka 'enum lru_status (*)(struct list_head *, struct list_lru_one *, int *, void *)') [-Werror,-Wincompatible-function-pointer-types]
           return list_lru_shrink_walk_irq(&shadow_nodes, sc, shadow_lru_isolate,
                                                              ^~~~~~~~~~~~~~~~~~
   include/linux/list_lru.h:201:22: note: passing argument to parameter 'isolate' here
                            list_lru_walk_cb isolate, void *cb_arg)
                                             ^
>> mm/workingset.c:631:45: error: incompatible pointer types passing 'struct lock_class_key *' to parameter of type 'struct lock_class_key *' [-Werror,-Wincompatible-pointer-types]
           ret = __list_lru_init(&shadow_nodes, true, &shadow_nodes_key,
                                                      ^~~~~~~~~~~~~~~~~
   include/linux/list_lru.h:63:30: note: passing argument to parameter 'key' here
                       struct lock_class_key *key, struct shrinker *shrinker);
                                              ^
   1 warning and 4 errors generated.
--
   In file included from mm/vmscan.c:15:
   In file included from include/linux/list_lru_api.h:1:
>> include/linux/list_lru.h:42:2: error: unknown type name 'spinlock_t'
           spinlock_t              lock;
           ^
   include/linux/list_lru.h:63:14: warning: declaration of 'struct lock_class_key' will not be visible outside of this function [-Wvisibility]
                       struct lock_class_key *key, struct shrinker *shrinker);
                              ^
   include/linux/list_lru.h:142:30: error: unknown type name 'spinlock_t'
                   struct list_lru_one *list, spinlock_t *lock, void *cb_arg);
                                              ^
   1 warning and 2 errors generated.
--
   In file included from fs/dcache.c:18:
   In file included from include/linux/list_lru_api.h:1:
>> include/linux/list_lru.h:42:2: error: unknown type name 'spinlock_t'
           spinlock_t              lock;
           ^
   include/linux/list_lru.h:63:14: warning: declaration of 'struct lock_class_key' will not be visible outside of this function [-Wvisibility]
                       struct lock_class_key *key, struct shrinker *shrinker);
                              ^
   include/linux/list_lru.h:142:30: error: unknown type name 'spinlock_t'
                   struct list_lru_one *list, spinlock_t *lock, void *cb_arg);
                                              ^
   fs/dcache.c:1299:10: error: incompatible function pointer types passing 'enum lru_status (struct list_head *, struct list_lru_one *, spinlock_t *, void *)' (aka 'enum lru_status (struct list_head *, struct list_lru_one *, struct spinlock *, void *)') to parameter of type 'list_lru_walk_cb' (aka 'enum lru_status (*)(struct list_head *, struct list_lru_one *, int *, void *)') [-Werror,-Wincompatible-function-pointer-types]
                                        dentry_lru_isolate, &dispose);
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/list_lru.h:193:25: note: passing argument to parameter 'isolate' here
                        list_lru_walk_cb isolate, void *cb_arg)
                                         ^
   fs/dcache.c:1338:4: error: incompatible function pointer types passing 'enum lru_status (struct list_head *, struct list_lru_one *, spinlock_t *, void *)' (aka 'enum lru_status (struct list_head *, struct list_lru_one *, struct spinlock *, void *)') to parameter of type 'list_lru_walk_cb' (aka 'enum lru_status (*)(struct list_head *, struct list_lru_one *, int *, void *)') [-Werror,-Wincompatible-function-pointer-types]
                           dentry_lru_isolate_shrink, &dispose, 1024);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list_lru.h:208:54: note: passing argument to parameter 'isolate' here
   list_lru_walk(struct list_lru *lru, list_lru_walk_cb isolate,
                                                        ^
   1 warning and 4 errors generated.
--
   In file included from fs/inode.c:6:
   In file included from include/linux/list_lru_api.h:1:
>> include/linux/list_lru.h:42:2: error: unknown type name 'spinlock_t'
           spinlock_t              lock;
           ^
   include/linux/list_lru.h:63:14: warning: declaration of 'struct lock_class_key' will not be visible outside of this function [-Wvisibility]
                       struct lock_class_key *key, struct shrinker *shrinker);
                              ^
   include/linux/list_lru.h:142:30: error: unknown type name 'spinlock_t'
                   struct list_lru_one *list, spinlock_t *lock, void *cb_arg);
                                              ^
   fs/inode.c:831:10: error: incompatible function pointer types passing 'enum lru_status (struct list_head *, struct list_lru_one *, spinlock_t *, void *)' (aka 'enum lru_status (struct list_head *, struct list_lru_one *, struct spinlock *, void *)') to parameter of type 'list_lru_walk_cb' (aka 'enum lru_status (*)(struct list_head *, struct list_lru_one *, int *, void *)') [-Werror,-Wincompatible-function-pointer-types]
                                        inode_lru_isolate, &freeable);
                                        ^~~~~~~~~~~~~~~~~
   include/linux/list_lru.h:193:25: note: passing argument to parameter 'isolate' here
                        list_lru_walk_cb isolate, void *cb_arg)
                                         ^
   1 warning and 3 errors generated.
--
   In file included from fs/gfs2/quota.c:38:
   In file included from include/linux/list_lru_api.h:1:
>> include/linux/list_lru.h:42:2: error: unknown type name 'spinlock_t'
           spinlock_t              lock;
           ^
   include/linux/list_lru.h:63:14: warning: declaration of 'struct lock_class_key' will not be visible outside of this function [-Wvisibility]
                       struct lock_class_key *key, struct shrinker *shrinker);
                              ^
   include/linux/list_lru.h:142:30: error: unknown type name 'spinlock_t'
                   struct list_lru_one *list, spinlock_t *lock, void *cb_arg);
                                              ^
>> fs/gfs2/quota.c:182:10: error: incompatible function pointer types passing 'enum lru_status (struct list_head *, struct list_lru_one *, spinlock_t *, void *)' (aka 'enum lru_status (struct list_head *, struct list_lru_one *, struct spinlock *, void *)') to parameter of type 'list_lru_walk_cb' (aka 'enum lru_status (*)(struct list_head *, struct list_lru_one *, int *, void *)') [-Werror,-Wincompatible-function-pointer-types]
                                        gfs2_qd_isolate, &dispose);
                                        ^~~~~~~~~~~~~~~
   include/linux/list_lru.h:193:25: note: passing argument to parameter 'isolate' here
                        list_lru_walk_cb isolate, void *cb_arg)
                                         ^
   1 warning and 3 errors generated.


vim +590 mm/workingset.c

449dd6984d0e47 Johannes Weiner           2014-04-03  585  
449dd6984d0e47 Johannes Weiner           2014-04-03  586  static unsigned long scan_shadow_nodes(struct shrinker *shrinker,
449dd6984d0e47 Johannes Weiner           2014-04-03  587  				       struct shrink_control *sc)
449dd6984d0e47 Johannes Weiner           2014-04-03  588  {
b93b016313b3ba Matthew Wilcox            2018-04-10  589  	/* list_lru lock nests inside the IRQ-safe i_pages lock */
6b51e88199ca4f Sebastian Andrzej Siewior 2018-08-17 @590  	return list_lru_shrink_walk_irq(&shadow_nodes, sc, shadow_lru_isolate,
6b51e88199ca4f Sebastian Andrzej Siewior 2018-08-17  591  					NULL);
449dd6984d0e47 Johannes Weiner           2014-04-03  592  }
449dd6984d0e47 Johannes Weiner           2014-04-03  593  
449dd6984d0e47 Johannes Weiner           2014-04-03  594  static struct shrinker workingset_shadow_shrinker = {
449dd6984d0e47 Johannes Weiner           2014-04-03  595  	.count_objects = count_shadow_nodes,
449dd6984d0e47 Johannes Weiner           2014-04-03  596  	.scan_objects = scan_shadow_nodes,
4b85afbdacd290 Johannes Weiner           2018-10-26  597  	.seeks = 0, /* ->count reports only fully expendable nodes */
0a6b76dd23fa08 Vladimir Davydov          2016-03-17  598  	.flags = SHRINKER_NUMA_AWARE | SHRINKER_MEMCG_AWARE,
449dd6984d0e47 Johannes Weiner           2014-04-03  599  };
449dd6984d0e47 Johannes Weiner           2014-04-03  600  
449dd6984d0e47 Johannes Weiner           2014-04-03  601  /*
449dd6984d0e47 Johannes Weiner           2014-04-03  602   * Our list_lru->lock is IRQ-safe as it nests inside the IRQ-safe
b93b016313b3ba Matthew Wilcox            2018-04-10  603   * i_pages lock.
449dd6984d0e47 Johannes Weiner           2014-04-03  604   */
449dd6984d0e47 Johannes Weiner           2014-04-03  605  static struct lock_class_key shadow_nodes_key;
449dd6984d0e47 Johannes Weiner           2014-04-03  606  
449dd6984d0e47 Johannes Weiner           2014-04-03  607  static int __init workingset_init(void)
449dd6984d0e47 Johannes Weiner           2014-04-03  608  {
612e44939c3c77 Johannes Weiner           2016-03-15  609  	unsigned int timestamp_bits;
612e44939c3c77 Johannes Weiner           2016-03-15  610  	unsigned int max_order;
449dd6984d0e47 Johannes Weiner           2014-04-03  611  	int ret;
449dd6984d0e47 Johannes Weiner           2014-04-03  612  
612e44939c3c77 Johannes Weiner           2016-03-15  613  	BUILD_BUG_ON(BITS_PER_LONG < EVICTION_SHIFT);
612e44939c3c77 Johannes Weiner           2016-03-15  614  	/*
612e44939c3c77 Johannes Weiner           2016-03-15  615  	 * Calculate the eviction bucket size to cover the longest
612e44939c3c77 Johannes Weiner           2016-03-15  616  	 * actionable refault distance, which is currently half of
612e44939c3c77 Johannes Weiner           2016-03-15  617  	 * memory (totalram_pages/2). However, memory hotplug may add
612e44939c3c77 Johannes Weiner           2016-03-15  618  	 * some more pages at runtime, so keep working with up to
612e44939c3c77 Johannes Weiner           2016-03-15  619  	 * double the initial memory by using totalram_pages as-is.
612e44939c3c77 Johannes Weiner           2016-03-15  620  	 */
612e44939c3c77 Johannes Weiner           2016-03-15  621  	timestamp_bits = BITS_PER_LONG - EVICTION_SHIFT;
ca79b0c211af63 Arun KS                   2018-12-28  622  	max_order = fls_long(totalram_pages() - 1);
612e44939c3c77 Johannes Weiner           2016-03-15  623  	if (max_order > timestamp_bits)
612e44939c3c77 Johannes Weiner           2016-03-15  624  		bucket_order = max_order - timestamp_bits;
d3d36c4b5c5fbd Anton Blanchard           2016-07-14  625  	pr_info("workingset: timestamp_bits=%d max_order=%d bucket_order=%u\n",
612e44939c3c77 Johannes Weiner           2016-03-15  626  	       timestamp_bits, max_order, bucket_order);
612e44939c3c77 Johannes Weiner           2016-03-15  627  
39887653aab4cf Kirill Tkhai              2018-08-17  628  	ret = prealloc_shrinker(&workingset_shadow_shrinker);
449dd6984d0e47 Johannes Weiner           2014-04-03  629  	if (ret)
449dd6984d0e47 Johannes Weiner           2014-04-03  630  		goto err;
c92e8e10cafeaa Kirill Tkhai              2018-08-17 @631  	ret = __list_lru_init(&shadow_nodes, true, &shadow_nodes_key,

:::::: The code at line 590 was first introduced by commit
:::::: 6b51e88199ca4f75ff647eff28efd30bfcb08dc4 mm/list_lru: introduce list_lru_shrink_walk_irq()

:::::: TO: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
