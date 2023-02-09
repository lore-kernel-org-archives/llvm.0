Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DEDA92C;
	Thu,  9 Feb 2023 19:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675972622; x=1707508622;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tROrFmF+zriAgHJRj28ywgfa6TyIAUP8bNygvgdnw1A=;
  b=TWIn5F0km5haOb6kHVULZwZYcR06QThnfzzXBFm8XZ3wa3Xfyybk2Nu6
   2komqCFcSyH2AeyOvZzPoidx1BCshSm0a/eH+WftIjmn2UDPwC5FZyUf0
   5VOdNRSIxHlaqofNQn5rsHgaMlf0qP12n0lX2YsYRadwVRVARgal6dxWX
   BZKtMwLZhAA3zXlF9uq2ZgGpN50/jCYPqUtFcK9bX+o7ki2pGqQqdzT4e
   +pqwH2JkARJyRnhYwMYUngUgnXCMb99kEcDcHMPCf8MuO4l6rMu8S7gQN
   hFKO8YrXZA70CETMRlQA7Fg3sLEQHUXtMVHPnEwzdxD1xzekPPKhO0QCo
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="327920871"
X-IronPort-AV: E=Sophos;i="5.97,284,1669104000"; 
   d="scan'208";a="327920871"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 11:57:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="996671978"
X-IronPort-AV: E=Sophos;i="5.97,284,1669104000"; 
   d="scan'208";a="996671978"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 09 Feb 2023 11:56:58 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQD2P-0005HO-1Z;
	Thu, 09 Feb 2023 19:56:57 +0000
Date: Fri, 10 Feb 2023 03:56:17 +0800
From: kernel test robot <lkp@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 1/3] dma-fence: Track explicit waiters
Message-ID: <202302100337.79MCCrCk-lkp@intel.com>
References: <20230209154315.468682-2-tvrtko.ursulin@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230209154315.468682-2-tvrtko.ursulin@linux.intel.com>

Hi Tvrtko,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Tvrtko-Ursulin/dma-fence-Track-explicit-waiters/20230209-234523
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230209154315.468682-2-tvrtko.ursulin%40linux.intel.com
patch subject: [RFC 1/3] dma-fence: Track explicit waiters
config: i386-randconfig-a004 (https://download.01.org/0day-ci/archive/20230210/202302100337.79MCCrCk-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/871de6ff345b69a34f0cfe807395b6074b5a29ea
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Tvrtko-Ursulin/dma-fence-Track-explicit-waiters/20230209-234523
        git checkout 871de6ff345b69a34f0cfe807395b6074b5a29ea
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302100337.79MCCrCk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/gt/intel_engine_pm.c:221:3: error: call to __compiletime_assert_548 declared with 'error' attribute: BUILD_BUG_ON failed: sizeof(rq->duration) > sizeof(rq->submitq)
                   BUILD_BUG_ON(sizeof(rq->duration) > sizeof(rq->submitq));
                   ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:358:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:346:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:339:4: note: expanded from macro '__compiletime_assert'
                           prefix ## suffix();                             \
                           ^
   <scratch space>:134:1: note: expanded from here
   __compiletime_assert_548
   ^
   1 error generated.


vim +/error +221 drivers/gpu/drm/i915/gt/intel_engine_pm.c

5cba288466e9b2 Chris Wilson              2019-11-20  140  
79ffac8599c4d8 Chris Wilson              2019-04-24  141  static bool switch_to_kernel_context(struct intel_engine_cs *engine)
79ffac8599c4d8 Chris Wilson              2019-04-24  142  {
5cba288466e9b2 Chris Wilson              2019-11-20  143  	struct intel_context *ce = engine->kernel_context;
79ffac8599c4d8 Chris Wilson              2019-04-24  144  	struct i915_request *rq;
6dcb85a0ad9904 Chris Wilson              2019-08-23  145  	bool result = true;
79ffac8599c4d8 Chris Wilson              2019-04-24  146  
3633242927101b Matthew Brost             2021-10-14  147  	/*
3633242927101b Matthew Brost             2021-10-14  148  	 * This is execlist specific behaviour intended to ensure the GPU is
3633242927101b Matthew Brost             2021-10-14  149  	 * idle by switching to a known 'safe' context. With GuC submission, the
3633242927101b Matthew Brost             2021-10-14  150  	 * same idle guarantee is achieved by other means (disabling
3633242927101b Matthew Brost             2021-10-14  151  	 * scheduling). Further, switching to a 'safe' context has no effect
3633242927101b Matthew Brost             2021-10-14  152  	 * with GuC submission as the scheduler can just switch back again.
3633242927101b Matthew Brost             2021-10-14  153  	 *
3633242927101b Matthew Brost             2021-10-14  154  	 * FIXME: Move this backend scheduler specific behaviour into the
3633242927101b Matthew Brost             2021-10-14  155  	 * scheduler backend.
3633242927101b Matthew Brost             2021-10-14  156  	 */
3633242927101b Matthew Brost             2021-10-14  157  	if (intel_engine_uses_guc(engine))
3633242927101b Matthew Brost             2021-10-14  158  		return true;
3633242927101b Matthew Brost             2021-10-14  159  
45b152f752ea81 Chris Wilson              2019-12-29  160  	/* GPU is pointing to the void, as good as in the kernel context. */
45b152f752ea81 Chris Wilson              2019-12-29  161  	if (intel_gt_is_wedged(engine->gt))
45b152f752ea81 Chris Wilson              2019-12-29  162  		return true;
45b152f752ea81 Chris Wilson              2019-12-29  163  
e6ba76480299a0 Chris Wilson              2019-12-21  164  	GEM_BUG_ON(!intel_context_is_barrier(ce));
2a19abb006292d Chris Wilson              2020-07-14  165  	GEM_BUG_ON(ce->timeline->hwsp_ggtt != engine->status_page.vma);
e6ba76480299a0 Chris Wilson              2019-12-21  166  
79ffac8599c4d8 Chris Wilson              2019-04-24  167  	/* Already inside the kernel context, safe to power down. */
79ffac8599c4d8 Chris Wilson              2019-04-24  168  	if (engine->wakeref_serial == engine->serial)
79ffac8599c4d8 Chris Wilson              2019-04-24  169  		return true;
79ffac8599c4d8 Chris Wilson              2019-04-24  170  
79ffac8599c4d8 Chris Wilson              2019-04-24  171  	/*
79ffac8599c4d8 Chris Wilson              2019-04-24  172  	 * Note, we do this without taking the timeline->mutex. We cannot
79ffac8599c4d8 Chris Wilson              2019-04-24  173  	 * as we may be called while retiring the kernel context and so
79ffac8599c4d8 Chris Wilson              2019-04-24  174  	 * already underneath the timeline->mutex. Instead we rely on the
c34c5bca331adc Chris Wilson              2019-05-03  175  	 * exclusive property of the __engine_park that prevents anyone
79ffac8599c4d8 Chris Wilson              2019-04-24  176  	 * else from creating a request on this engine. This also requires
79ffac8599c4d8 Chris Wilson              2019-04-24  177  	 * that the ring is empty and we avoid any waits while constructing
79ffac8599c4d8 Chris Wilson              2019-04-24  178  	 * the context, as they assume protection by the timeline->mutex.
79ffac8599c4d8 Chris Wilson              2019-04-24  179  	 * This should hold true as we can only park the engine after
79ffac8599c4d8 Chris Wilson              2019-04-24  180  	 * retiring the last request, thus all rings should be empty and
79ffac8599c4d8 Chris Wilson              2019-04-24  181  	 * all timelines idle.
5cba288466e9b2 Chris Wilson              2019-11-20  182  	 *
5cba288466e9b2 Chris Wilson              2019-11-20  183  	 * For unlocking, there are 2 other parties and the GPU who have a
5cba288466e9b2 Chris Wilson              2019-11-20  184  	 * stake here.
5cba288466e9b2 Chris Wilson              2019-11-20  185  	 *
5cba288466e9b2 Chris Wilson              2019-11-20  186  	 * A new gpu user will be waiting on the engine-pm to start their
5cba288466e9b2 Chris Wilson              2019-11-20  187  	 * engine_unpark. New waiters are predicated on engine->wakeref.count
5cba288466e9b2 Chris Wilson              2019-11-20  188  	 * and so intel_wakeref_defer_park() acts like a mutex_unlock of the
5cba288466e9b2 Chris Wilson              2019-11-20  189  	 * engine->wakeref.
5cba288466e9b2 Chris Wilson              2019-11-20  190  	 *
5cba288466e9b2 Chris Wilson              2019-11-20  191  	 * The other party is intel_gt_retire_requests(), which is walking the
5cba288466e9b2 Chris Wilson              2019-11-20  192  	 * list of active timelines looking for completions. Meanwhile as soon
5cba288466e9b2 Chris Wilson              2019-11-20  193  	 * as we call __i915_request_queue(), the GPU may complete our request.
5cba288466e9b2 Chris Wilson              2019-11-20  194  	 * Ergo, if we put ourselves on the timelines.active_list
5cba288466e9b2 Chris Wilson              2019-11-20  195  	 * (se intel_timeline_enter()) before we increment the
5cba288466e9b2 Chris Wilson              2019-11-20  196  	 * engine->wakeref.count, we may see the request completion and retire
0d961c4610ff24 Chen Zhou                 2020-04-01  197  	 * it causing an underflow of the engine->wakeref.
79ffac8599c4d8 Chris Wilson              2019-04-24  198  	 */
bce45c2620e214 Sebastian Andrzej Siewior 2021-12-10  199  	set_bit(CONTEXT_IS_PARKING, &ce->flags);
5cba288466e9b2 Chris Wilson              2019-11-20  200  	GEM_BUG_ON(atomic_read(&ce->timeline->active_count) < 0);
6c69a45445af92 Chris Wilson              2019-08-16  201  
5cba288466e9b2 Chris Wilson              2019-11-20  202  	rq = __i915_request_create(ce, GFP_NOWAIT);
79ffac8599c4d8 Chris Wilson              2019-04-24  203  	if (IS_ERR(rq))
79ffac8599c4d8 Chris Wilson              2019-04-24  204  		/* Context switch failed, hope for the best! Maybe reset? */
6dcb85a0ad9904 Chris Wilson              2019-08-23  205  		goto out_unlock;
79ffac8599c4d8 Chris Wilson              2019-04-24  206  
79ffac8599c4d8 Chris Wilson              2019-04-24  207  	/* Check again on the next retirement. */
79ffac8599c4d8 Chris Wilson              2019-04-24  208  	engine->wakeref_serial = engine->serial + 1;
d8af05ff38ae7a Chris Wilson              2019-08-02  209  	i915_request_add_active_barriers(rq);
a79ca656b648e6 Chris Wilson              2019-08-13  210  
a79ca656b648e6 Chris Wilson              2019-08-13  211  	/* Install ourselves as a preemption barrier */
b5e8e954eb672e Chris Wilson              2019-10-21  212  	rq->sched.attr.priority = I915_PRIORITY_BARRIER;
b81e4d9b594188 Chris Wilson              2019-12-19  213  	if (likely(!__i915_request_commit(rq))) { /* engine should be idle! */
b81e4d9b594188 Chris Wilson              2019-12-19  214  		/*
b81e4d9b594188 Chris Wilson              2019-12-19  215  		 * Use an interrupt for precise measurement of duration,
b81e4d9b594188 Chris Wilson              2019-12-19  216  		 * otherwise we rely on someone else retiring all the requests
b81e4d9b594188 Chris Wilson              2019-12-19  217  		 * which may delay the signaling (i.e. we will likely wait
b81e4d9b594188 Chris Wilson              2019-12-19  218  		 * until the background request retirement running every
b81e4d9b594188 Chris Wilson              2019-12-19  219  		 * second or two).
b81e4d9b594188 Chris Wilson              2019-12-19  220  		 */
b81e4d9b594188 Chris Wilson              2019-12-19 @221  		BUILD_BUG_ON(sizeof(rq->duration) > sizeof(rq->submitq));
b81e4d9b594188 Chris Wilson              2019-12-19  222  		dma_fence_add_callback(&rq->fence, &rq->duration.cb, duration);
b81e4d9b594188 Chris Wilson              2019-12-19  223  		rq->duration.emitted = ktime_get();
b81e4d9b594188 Chris Wilson              2019-12-19  224  	}
79ffac8599c4d8 Chris Wilson              2019-04-24  225  
88a4655e75ac8f Chris Wilson              2019-11-25  226  	/* Expose ourselves to the world */
88a4655e75ac8f Chris Wilson              2019-11-25  227  	__queue_and_release_pm(rq, ce->timeline, engine);
5cba288466e9b2 Chris Wilson              2019-11-20  228  
6dcb85a0ad9904 Chris Wilson              2019-08-23  229  	result = false;
6dcb85a0ad9904 Chris Wilson              2019-08-23  230  out_unlock:
bce45c2620e214 Sebastian Andrzej Siewior 2021-12-10  231  	clear_bit(CONTEXT_IS_PARKING, &ce->flags);
6dcb85a0ad9904 Chris Wilson              2019-08-23  232  	return result;
79ffac8599c4d8 Chris Wilson              2019-04-24  233  }
79ffac8599c4d8 Chris Wilson              2019-04-24  234  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
