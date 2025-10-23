Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9871730AD08;
	Thu, 23 Oct 2025 11:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761218618; cv=none; b=e4zT6B5tK7zyk2ym8cZ5H/vteqIsUuxcfkjU9DMQLHfZA5pEoYpIc7Z56emtd826dnqeCsUJ1wBdRV8jlGhXCV1/cWJH+hpP+tr1hBAT35qPSOxv1+DzXH6g8vz4QgSMfoKzMtIwrzmjkyNbW1XcpdBERHf66Pya5OllMpIF4BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761218618; c=relaxed/simple;
	bh=5QsQYqJCse259VNKPF5CMpHmn8pDTev548T22qaQDyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jMPgYtd7yMenXZMlldfOsH6qO96sp6AQrSoJeO8wMqOg5TPVSxOAIC4I6UqDdsohVhuezx6u61g5m7MATvInkL9b4wNmr9Q0YNj87EmLes+lVP9z+0nhzG1MK0jiVIOtafZglaGIFqzTdGRRqmlREpZhqBpXug08/1IdmLaOSBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KNRtXBA+; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KNRtXBA+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761218615; x=1792754615;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5QsQYqJCse259VNKPF5CMpHmn8pDTev548T22qaQDyY=;
  b=KNRtXBA+NJjM7/oZ8hoo4KG7LxlSLxD1BwlXVTp1abAz0+S0jTyWqxp8
   P1ZJllD23OM1hp3PkW/a5lvx4ZtwSSmUq/NDbqZwBKPjC+tHNVzP9+Ewj
   eVPilrV10PhKvT7QBg4WiKxnUeYaDcoKk5/yR3jTPZoGS3clf2QVrW96D
   lwwnY8n1V9rFQ14oMQipbeH6jDCon1XLXomJgNIjrrDO/jyDXL3qwBB0R
   c3q++X03JTc2SYf9t2WyVBasy6/kP8KuHzGCRhTY1+LRTmrSCKKV+jJ1O
   UemVP5kJDfRTC4RnpupBiqFds0y2Soq+/Qzf6CC/dkIecMzIGTaVGiC9g
   A==;
X-CSE-ConnectionGUID: XsrifxXkRrOJ3eTABm73Ng==
X-CSE-MsgGUID: 3gf6MM2dR3KhnmMNPdFIOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74821716"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="74821716"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 04:23:34 -0700
X-CSE-ConnectionGUID: Jnj4tt4ZS/uatVlTRV6HRw==
X-CSE-MsgGUID: Djlhs9kQSNmB2tdZN95QhA==
X-Ironport-Invalid-End-Of-Message: True
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="184061898"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 23 Oct 2025 04:23:33 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBtPn-000DOh-0m;
	Thu, 23 Oct 2025 11:23:31 +0000
Date: Thu, 23 Oct 2025 19:23:29 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 05/14] dma-buf: inline spinlock for fence protection
Message-ID: <202510231935.rbMkv8BF-lkp@intel.com>
References: <20251023040800.970283-6-matthew.brost@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023040800.970283-6-matthew.brost@intel.com>

Hi Matthew,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip linus/master v6.18-rc2 next-20251023]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Brost/dma-buf-cleanup-dma_fence_describe/20251023-121819
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20251023040800.970283-6-matthew.brost%40intel.com
patch subject: [RFC PATCH 05/14] dma-buf: inline spinlock for fence protection
config: i386-buildonly-randconfig-002-20251023 (https://download.01.org/0day-ci/archive/20251023/202510231935.rbMkv8BF-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510231935.rbMkv8BF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510231935.rbMkv8BF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/i915_active.c:1048:27: error: no member named 'lock' in 'struct dma_fence'
    1048 |         spin_lock_irqsave(fence->lock, flags);
         |                           ~~~~~  ^
   include/linux/spinlock.h:381:39: note: expanded from macro 'spin_lock_irqsave'
     381 |         raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
         |                                              ^~~~
   include/linux/spinlock.h:244:34: note: expanded from macro 'raw_spin_lock_irqsave'
     244 |                 flags = _raw_spin_lock_irqsave(lock);   \
         |                                                ^~~~
   drivers/gpu/drm/i915/i915_active.c:1050:26: error: no member named 'lock' in 'struct dma_fence'
    1050 |                 spin_lock_nested(prev->lock, SINGLE_DEPTH_NESTING);
         |                                  ~~~~  ^
   include/linux/spinlock.h:366:38: note: expanded from macro 'spin_lock_nested'
     366 |         raw_spin_lock_nested(spinlock_check(lock), subclass);   \
         |                                             ^~~~
   include/linux/spinlock.h:221:24: note: expanded from macro 'raw_spin_lock_nested'
     221 |         _raw_spin_lock_nested(lock, subclass)
         |                               ^~~~
   drivers/gpu/drm/i915/i915_active.c:1064:22: error: no member named 'lock' in 'struct dma_fence'
    1064 |                         spin_unlock(prev->lock);
         |                                     ~~~~  ^
   drivers/gpu/drm/i915/i915_active.c:1067:33: error: no member named 'lock' in 'struct dma_fence'
    1067 |                 spin_unlock_irqrestore(fence->lock, flags);
         |                                        ~~~~~  ^
   drivers/gpu/drm/i915/i915_active.c:1072:28: error: no member named 'lock' in 'struct dma_fence'
    1072 |                 spin_lock_irqsave(fence->lock, flags);
         |                                   ~~~~~  ^
   include/linux/spinlock.h:381:39: note: expanded from macro 'spin_lock_irqsave'
     381 |         raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
         |                                              ^~~~
   include/linux/spinlock.h:244:34: note: expanded from macro 'raw_spin_lock_irqsave'
     244 |                 flags = _raw_spin_lock_irqsave(lock);   \
         |                                                ^~~~
   drivers/gpu/drm/i915/i915_active.c:1074:27: error: no member named 'lock' in 'struct dma_fence'
    1074 |                         spin_lock_nested(prev->lock, SINGLE_DEPTH_NESTING);
         |                                          ~~~~  ^
   include/linux/spinlock.h:366:38: note: expanded from macro 'spin_lock_nested'
     366 |         raw_spin_lock_nested(spinlock_check(lock), subclass);   \
         |                                             ^~~~
   include/linux/spinlock.h:221:24: note: expanded from macro 'raw_spin_lock_nested'
     221 |         _raw_spin_lock_nested(lock, subclass)
         |                               ^~~~
   drivers/gpu/drm/i915/i915_active.c:1091:21: error: no member named 'lock' in 'struct dma_fence'
    1091 |                 spin_unlock(prev->lock); /* serialise with prev->cb_list */
         |                             ~~~~  ^
   drivers/gpu/drm/i915/i915_active.c:1094:32: error: no member named 'lock' in 'struct dma_fence'
    1094 |         spin_unlock_irqrestore(fence->lock, flags);
         |                                ~~~~~  ^
   8 errors generated.
--
>> drivers/gpu/drm/i915/gt/intel_breadcrumbs.c:149:29: error: no member named 'lock' in 'struct dma_fence'
     149 |         lockdep_assert_held(fence->lock);
         |                             ~~~~~  ^
   include/linux/lockdep.h:285:33: note: expanded from macro 'lockdep_assert_held'
     285 |         lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
         |                                        ^
   include/linux/lockdep.h:252:47: note: expanded from macro 'lockdep_is_held'
     252 | #define lockdep_is_held(lock)           lock_is_held(&(lock)->dep_map)
         |                                                        ^~~~
   include/linux/lockdep.h:279:32: note: expanded from macro 'lockdep_assert'
     279 |         do { WARN_ON(debug_locks && !(cond)); } while (0)
         |                                       ^~~~
   include/asm-generic/bug.h:171:25: note: expanded from macro 'WARN_ON'
     171 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   1 error generated.


vim +1048 drivers/gpu/drm/i915/i915_active.c

ce476c80b8bfa8 Chris Wilson       2019-06-14   994  
b1e3177bd1d8f4 Chris Wilson       2019-10-04   995  /*
b1e3177bd1d8f4 Chris Wilson       2019-10-04   996   * __i915_active_fence_set: Update the last active fence along its timeline
b1e3177bd1d8f4 Chris Wilson       2019-10-04   997   * @active: the active tracker
b1e3177bd1d8f4 Chris Wilson       2019-10-04   998   * @fence: the new fence (under construction)
b1e3177bd1d8f4 Chris Wilson       2019-10-04   999   *
b1e3177bd1d8f4 Chris Wilson       2019-10-04  1000   * Records the new @fence as the last active fence along its timeline in
b1e3177bd1d8f4 Chris Wilson       2019-10-04  1001   * this active tracker, moving the tracking callbacks from the previous
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1002   * fence onto this one. Gets and returns a reference to the previous fence
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1003   * (if not already completed), which the caller must put after making sure
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1004   * that it is executed before the new fence. To ensure that the order of
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1005   * fences within the timeline of the i915_active_fence is understood, it
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1006   * should be locked by the caller.
b1e3177bd1d8f4 Chris Wilson       2019-10-04  1007   */
b1e3177bd1d8f4 Chris Wilson       2019-10-04  1008  struct dma_fence *
b1e3177bd1d8f4 Chris Wilson       2019-10-04  1009  __i915_active_fence_set(struct i915_active_fence *active,
b1e3177bd1d8f4 Chris Wilson       2019-10-04  1010  			struct dma_fence *fence)
b1e3177bd1d8f4 Chris Wilson       2019-10-04  1011  {
b1e3177bd1d8f4 Chris Wilson       2019-10-04  1012  	struct dma_fence *prev;
b1e3177bd1d8f4 Chris Wilson       2019-10-04  1013  	unsigned long flags;
b1e3177bd1d8f4 Chris Wilson       2019-10-04  1014  
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1015  	/*
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1016  	 * In case of fences embedded in i915_requests, their memory is
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1017  	 * SLAB_FAILSAFE_BY_RCU, then it can be reused right after release
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1018  	 * by new requests.  Then, there is a risk of passing back a pointer
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1019  	 * to a new, completely unrelated fence that reuses the same memory
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1020  	 * while tracked under a different active tracker.  Combined with i915
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1021  	 * perf open/close operations that build await dependencies between
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1022  	 * engine kernel context requests and user requests from different
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1023  	 * timelines, this can lead to dependency loops and infinite waits.
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1024  	 *
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1025  	 * As a countermeasure, we try to get a reference to the active->fence
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1026  	 * first, so if we succeed and pass it back to our user then it is not
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1027  	 * released and potentially reused by an unrelated request before the
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1028  	 * user has a chance to set up an await dependency on it.
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1029  	 */
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1030  	prev = i915_active_fence_get(active);
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1031  	if (fence == prev)
df9f85d8582ebd Chris Wilson       2019-11-27  1032  		return fence;
df9f85d8582ebd Chris Wilson       2019-11-27  1033  
b1e3177bd1d8f4 Chris Wilson       2019-10-04  1034  	GEM_BUG_ON(test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags));
b1e3177bd1d8f4 Chris Wilson       2019-10-04  1035  
df9f85d8582ebd Chris Wilson       2019-11-27  1036  	/*
df9f85d8582ebd Chris Wilson       2019-11-27  1037  	 * Consider that we have two threads arriving (A and B), with
df9f85d8582ebd Chris Wilson       2019-11-27  1038  	 * C already resident as the active->fence.
df9f85d8582ebd Chris Wilson       2019-11-27  1039  	 *
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1040  	 * Both A and B have got a reference to C or NULL, depending on the
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1041  	 * timing of the interrupt handler.  Let's assume that if A has got C
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1042  	 * then it has locked C first (before B).
df9f85d8582ebd Chris Wilson       2019-11-27  1043  	 *
df9f85d8582ebd Chris Wilson       2019-11-27  1044  	 * Note the strong ordering of the timeline also provides consistent
df9f85d8582ebd Chris Wilson       2019-11-27  1045  	 * nesting rules for the fence->lock; the inner lock is always the
df9f85d8582ebd Chris Wilson       2019-11-27  1046  	 * older lock.
df9f85d8582ebd Chris Wilson       2019-11-27  1047  	 */
df9f85d8582ebd Chris Wilson       2019-11-27 @1048  	spin_lock_irqsave(fence->lock, flags);
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1049  	if (prev)
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1050  		spin_lock_nested(prev->lock, SINGLE_DEPTH_NESTING);
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1051  
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1052  	/*
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1053  	 * A does the cmpxchg first, and so it sees C or NULL, as before, or
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1054  	 * something else, depending on the timing of other threads and/or
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1055  	 * interrupt handler.  If not the same as before then A unlocks C if
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1056  	 * applicable and retries, starting from an attempt to get a new
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1057  	 * active->fence.  Meanwhile, B follows the same path as A.
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1058  	 * Once A succeeds with cmpxch, B fails again, retires, gets A from
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1059  	 * active->fence, locks it as soon as A completes, and possibly
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1060  	 * succeeds with cmpxchg.
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1061  	 */
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1062  	while (cmpxchg(__active_fence_slot(active), prev, fence) != prev) {
b1e3177bd1d8f4 Chris Wilson       2019-10-04  1063  		if (prev) {
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1064  			spin_unlock(prev->lock);
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1065  			dma_fence_put(prev);
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1066  		}
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1067  		spin_unlock_irqrestore(fence->lock, flags);
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1068  
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1069  		prev = i915_active_fence_get(active);
b1e3177bd1d8f4 Chris Wilson       2019-10-04  1070  		GEM_BUG_ON(prev == fence);
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1071  
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1072  		spin_lock_irqsave(fence->lock, flags);
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1073  		if (prev)
b1e3177bd1d8f4 Chris Wilson       2019-10-04  1074  			spin_lock_nested(prev->lock, SINGLE_DEPTH_NESTING);
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1075  	}
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1076  
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1077  	/*
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1078  	 * If prev is NULL then the previous fence must have been signaled
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1079  	 * and we know that we are first on the timeline.  If it is still
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1080  	 * present then, having the lock on that fence already acquired, we
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1081  	 * serialise with the interrupt handler, in the process of removing it
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1082  	 * from any future interrupt callback.  A will then wait on C before
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1083  	 * executing (if present).
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1084  	 *
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1085  	 * As B is second, it sees A as the previous fence and so waits for
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1086  	 * it to complete its transition and takes over the occupancy for
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1087  	 * itself -- remembering that it needs to wait on A before executing.
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1088  	 */
946e047a3d88d4 Janusz Krzysztofik 2023-07-20  1089  	if (prev) {
b1e3177bd1d8f4 Chris Wilson       2019-10-04  1090  		__list_del_entry(&active->cb.node);
b1e3177bd1d8f4 Chris Wilson       2019-10-04  1091  		spin_unlock(prev->lock); /* serialise with prev->cb_list */
b1e3177bd1d8f4 Chris Wilson       2019-10-04  1092  	}
b1e3177bd1d8f4 Chris Wilson       2019-10-04  1093  	list_add_tail(&active->cb.node, &fence->cb_list);
b1e3177bd1d8f4 Chris Wilson       2019-10-04  1094  	spin_unlock_irqrestore(fence->lock, flags);
b1e3177bd1d8f4 Chris Wilson       2019-10-04  1095  
b1e3177bd1d8f4 Chris Wilson       2019-10-04  1096  	return prev;
b1e3177bd1d8f4 Chris Wilson       2019-10-04  1097  }
b1e3177bd1d8f4 Chris Wilson       2019-10-04  1098  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
