Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFA829CA
	for <llvm@lists.linux.dev>; Tue,  1 Feb 2022 07:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643702009; x=1675238009;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=M9Mc+8MXZtRYongnYjn+zGcP24akD0fJx0uswZ97HOE=;
  b=USMGV6ZYkCE6VAda8OKHDVD+6vsXeulWq5SkVGdOd6syb8HVo2xkFg4B
   3MI5TF4fqldgXYfJBzXMbHWH8/U8vNZrXI5RUldqX4SxPHKem4WVoI0Ev
   Hgz3npMQBU0mmUIJ+lpAoIghR5lGyWSLDJJ3p9D3W1/6bLpq1yg76jKSo
   Bf98FACc5f1RI5xSr/jsi6piFt5uyqHxCkTd8LdsahO9Qz7LCucNst2cy
   hJQip3gPc08rBan3W09R4D7tn9a/iWIlGwMc5Hi4BDLagTyRMirb4UdGp
   xZ2yuR9y6A03sknHfAMLV3Rwvs8mHJ2c9kvBna+wRv65++HBN41Xj9eLA
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="247408749"
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; 
   d="scan'208";a="247408749"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2022 23:53:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; 
   d="scan'208";a="630318848"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 31 Jan 2022 23:53:27 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nEnyg-000Sza-EG; Tue, 01 Feb 2022 07:53:26 +0000
Date: Tue, 1 Feb 2022 15:52:42 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Carpenter <error27@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [linux-next:pending-fixes 164/228]
 drivers/gpu/drm/i915/i915_vma.c:451:4: error: use of undeclared identifier
 'ret'
Message-ID: <202202011539.ovkZEMAZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git pending-fixes
head:   a7fc3604a297400b1140adf29cc29de7bf17e4f3
commit: 2e872d87cbf2cd02dca570ee187cf35567576a70 [164/228] drm/i915: delete shadow "ret" variable
config: i386-randconfig-a011-20220131 (https://download.01.org/0day-ci/archive/20220201/202202011539.ovkZEMAZ-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 2cdbaca3943a4d6259119f185656328bd3805b68)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=2e872d87cbf2cd02dca570ee187cf35567576a70
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next pending-fixes
        git checkout 2e872d87cbf2cd02dca570ee187cf35567576a70
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

Note: the linux-next/pending-fixes HEAD a7fc3604a297400b1140adf29cc29de7bf17e4f3 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/i915_vma.c:451:4: error: use of undeclared identifier 'ret'
                           ret = i915_gem_object_wait_moving_fence(vma->obj, true);
                           ^
   drivers/gpu/drm/i915/i915_vma.c:452:8: error: use of undeclared identifier 'ret'
                           if (ret)
                               ^
   drivers/gpu/drm/i915/i915_vma.c:453:12: error: use of undeclared identifier 'ret'
                                   return ret;
                                          ^
   3 errors generated.


vim +/ret +451 drivers/gpu/drm/i915/i915_vma.c

f6c466b84cfa78 Maarten Lankhorst      2021-11-22  376  
b42fe9ca0a1e2b Joonas Lahtinen        2016-11-11  377  /**
b42fe9ca0a1e2b Joonas Lahtinen        2016-11-11  378   * i915_vma_bind - Sets up PTEs for an VMA in it's corresponding address space.
b42fe9ca0a1e2b Joonas Lahtinen        2016-11-11  379   * @vma: VMA to map
b42fe9ca0a1e2b Joonas Lahtinen        2016-11-11  380   * @cache_level: mapping cache level
b42fe9ca0a1e2b Joonas Lahtinen        2016-11-11  381   * @flags: flags like global or local mapping
2850748ef8763a Chris Wilson           2019-10-04  382   * @work: preallocated worker for allocating and binding the PTE
b42fe9ca0a1e2b Joonas Lahtinen        2016-11-11  383   *
b42fe9ca0a1e2b Joonas Lahtinen        2016-11-11  384   * DMA addresses are taken from the scatter-gather table of this object (or of
b42fe9ca0a1e2b Joonas Lahtinen        2016-11-11  385   * this VMA in case of non-default GGTT views) and PTE entries set up.
b42fe9ca0a1e2b Joonas Lahtinen        2016-11-11  386   * Note that DMA addresses are also the only part of the SG table we care about.
b42fe9ca0a1e2b Joonas Lahtinen        2016-11-11  387   */
2850748ef8763a Chris Wilson           2019-10-04  388  int i915_vma_bind(struct i915_vma *vma,
2850748ef8763a Chris Wilson           2019-10-04  389  		  enum i915_cache_level cache_level,
2850748ef8763a Chris Wilson           2019-10-04  390  		  u32 flags,
2850748ef8763a Chris Wilson           2019-10-04  391  		  struct i915_vma_work *work)
b42fe9ca0a1e2b Joonas Lahtinen        2016-11-11  392  {
b42fe9ca0a1e2b Joonas Lahtinen        2016-11-11  393  	u32 bind_flags;
b42fe9ca0a1e2b Joonas Lahtinen        2016-11-11  394  	u32 vma_flags;
b42fe9ca0a1e2b Joonas Lahtinen        2016-11-11  395  
c2ea703dcafccf Thomas Hellström       2021-12-21  396  	lockdep_assert_held(&vma->vm->mutex);
aa149431279166 Chris Wilson           2017-02-25  397  	GEM_BUG_ON(!drm_mm_node_allocated(&vma->node));
aa149431279166 Chris Wilson           2017-02-25  398  	GEM_BUG_ON(vma->size > vma->node.size);
aa149431279166 Chris Wilson           2017-02-25  399  
bbb8a9d7e000c9 Tvrtko Ursulin         2018-10-12  400  	if (GEM_DEBUG_WARN_ON(range_overflows(vma->node.start,
aa149431279166 Chris Wilson           2017-02-25  401  					      vma->node.size,
aa149431279166 Chris Wilson           2017-02-25  402  					      vma->vm->total)))
aa149431279166 Chris Wilson           2017-02-25  403  		return -ENODEV;
aa149431279166 Chris Wilson           2017-02-25  404  
bbb8a9d7e000c9 Tvrtko Ursulin         2018-10-12  405  	if (GEM_DEBUG_WARN_ON(!flags))
b42fe9ca0a1e2b Joonas Lahtinen        2016-11-11  406  		return -EINVAL;
b42fe9ca0a1e2b Joonas Lahtinen        2016-11-11  407  
2850748ef8763a Chris Wilson           2019-10-04  408  	bind_flags = flags;
2850748ef8763a Chris Wilson           2019-10-04  409  	bind_flags &= I915_VMA_GLOBAL_BIND | I915_VMA_LOCAL_BIND;
b42fe9ca0a1e2b Joonas Lahtinen        2016-11-11  410  
4dd2fbbfb532d0 Chris Wilson           2019-09-11  411  	vma_flags = atomic_read(&vma->flags);
4dd2fbbfb532d0 Chris Wilson           2019-09-11  412  	vma_flags &= I915_VMA_GLOBAL_BIND | I915_VMA_LOCAL_BIND;
aedbe0a1af585e Chris Wilson           2020-05-21  413  
b42fe9ca0a1e2b Joonas Lahtinen        2016-11-11  414  	bind_flags &= ~vma_flags;
b42fe9ca0a1e2b Joonas Lahtinen        2016-11-11  415  	if (bind_flags == 0)
b42fe9ca0a1e2b Joonas Lahtinen        2016-11-11  416  		return 0;
b42fe9ca0a1e2b Joonas Lahtinen        2016-11-11  417  
0b4d1f0e936e5c Maarten Lankhorst      2021-12-16  418  	GEM_BUG_ON(!atomic_read(&vma->pages_count));
fa3f46afd38cec Matthew Auld           2017-10-06  419  
6146e6da5c9617 Daniele Ceraolo Spurio 2017-01-20  420  	trace_i915_vma_bind(vma, bind_flags);
aedbe0a1af585e Chris Wilson           2020-05-21  421  	if (work && bind_flags & vma->vm->bind_async_flags) {
e3793468b4660a Chris Wilson           2020-01-30  422  		struct dma_fence *prev;
e3793468b4660a Chris Wilson           2020-01-30  423  
2850748ef8763a Chris Wilson           2019-10-04  424  		work->vma = vma;
2850748ef8763a Chris Wilson           2019-10-04  425  		work->cache_level = cache_level;
12b07256c22399 Chris Wilson           2020-07-03  426  		work->flags = bind_flags;
2850748ef8763a Chris Wilson           2019-10-04  427  
2850748ef8763a Chris Wilson           2019-10-04  428  		/*
2850748ef8763a Chris Wilson           2019-10-04  429  		 * Note we only want to chain up to the migration fence on
2850748ef8763a Chris Wilson           2019-10-04  430  		 * the pages (not the object itself). As we don't track that,
2850748ef8763a Chris Wilson           2019-10-04  431  		 * yet, we have to use the exclusive fence instead.
2850748ef8763a Chris Wilson           2019-10-04  432  		 *
2850748ef8763a Chris Wilson           2019-10-04  433  		 * Also note that we do not want to track the async vma as
2850748ef8763a Chris Wilson           2019-10-04  434  		 * part of the obj->resv->excl_fence as it only affects
2850748ef8763a Chris Wilson           2019-10-04  435  		 * execution and not content or object's backing store lifetime.
2850748ef8763a Chris Wilson           2019-10-04  436  		 */
e3793468b4660a Chris Wilson           2020-01-30  437  		prev = i915_active_set_exclusive(&vma->active, &work->base.dma);
30ca04e16cbeea Chris Wilson           2020-02-03  438  		if (prev) {
e3793468b4660a Chris Wilson           2020-01-30  439  			__i915_sw_fence_await_dma_fence(&work->base.chain,
e3793468b4660a Chris Wilson           2020-01-30  440  							prev,
e3793468b4660a Chris Wilson           2020-01-30  441  							&work->cb);
30ca04e16cbeea Chris Wilson           2020-02-03  442  			dma_fence_put(prev);
30ca04e16cbeea Chris Wilson           2020-02-03  443  		}
e3793468b4660a Chris Wilson           2020-01-30  444  
2850748ef8763a Chris Wilson           2019-10-04  445  		work->base.dma.error = 0; /* enable the queue_work() */
2850748ef8763a Chris Wilson           2019-10-04  446  
2850748ef8763a Chris Wilson           2019-10-04  447  		__i915_gem_object_pin_pages(vma->obj);
537457a979a02a Chris Wilson           2020-11-02  448  		work->pinned = i915_gem_object_get(vma->obj);
2850748ef8763a Chris Wilson           2019-10-04  449  	} else {
f6c466b84cfa78 Maarten Lankhorst      2021-11-22  450  		if (vma->obj) {
f6c466b84cfa78 Maarten Lankhorst      2021-11-22 @451  			ret = i915_gem_object_wait_moving_fence(vma->obj, true);
f6c466b84cfa78 Maarten Lankhorst      2021-11-22  452  			if (ret)
f6c466b84cfa78 Maarten Lankhorst      2021-11-22  453  				return ret;
f6c466b84cfa78 Maarten Lankhorst      2021-11-22  454  		}
cd0452aa2a0d14 Chris Wilson           2020-07-29  455  		vma->ops->bind_vma(vma->vm, NULL, vma, cache_level, bind_flags);
2850748ef8763a Chris Wilson           2019-10-04  456  	}
b42fe9ca0a1e2b Joonas Lahtinen        2016-11-11  457  
7938d61591d333 Tvrtko Ursulin         2021-10-19  458  	if (vma->obj)
7938d61591d333 Tvrtko Ursulin         2021-10-19  459  		set_bit(I915_BO_WAS_BOUND_BIT, &vma->obj->flags);
7938d61591d333 Tvrtko Ursulin         2021-10-19  460  
4dd2fbbfb532d0 Chris Wilson           2019-09-11  461  	atomic_or(bind_flags, &vma->flags);
b42fe9ca0a1e2b Joonas Lahtinen        2016-11-11  462  	return 0;
b42fe9ca0a1e2b Joonas Lahtinen        2016-11-11  463  }
b42fe9ca0a1e2b Joonas Lahtinen        2016-11-11  464  

:::::: The code at line 451 was first introduced by commit
:::::: f6c466b84cfa78807b7f71b8adeaf209b4deb72f drm/i915: Add support for moving fence waiting

:::::: TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
:::::: CC: Thomas Hellström <thomas.hellstrom@linux.intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
