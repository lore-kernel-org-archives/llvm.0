Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C879E770E0;
	Thu,  9 May 2024 22:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715292990; cv=none; b=s3i9GCTVa50TR0W5JbOdz+XycT6WXSjwQQ2UhYoLnDQ/Ihmvrq6eqY466bzcCWhy6BmvsquGUeq9PQYk8cnn0mh1dJGRp4osMd6ddDLVlcPUSQyt+3iT9bj89xDm5fJZZFYPFpi29l/JD8lqp0oQBx3wi5fbEfsgMej6mR7f4rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715292990; c=relaxed/simple;
	bh=pmVbM8yvf2EuXF5GylGgoQJ6vF/jqpQyHulx1jG4gT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s67ifgJ1yVGc0pGMcBvFov0Jd/c3PsWbEb7lhADqDIsQhrDcZ6VSpy+hq7kOnE5Gt9qOjKlbpjTZNMZT/7bkV1ZskHolWDmlUIQNT7fuwh0NoPccpQTmgHnzA8Dp7kNLwtNRmXMsIRX67+7kpYX+Dj/yqvvsfxCaVViFRO3AHfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ed3vt2ul; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ed3vt2ul"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715292989; x=1746828989;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pmVbM8yvf2EuXF5GylGgoQJ6vF/jqpQyHulx1jG4gT8=;
  b=ed3vt2ulK+xArNEJDaji20CdE20MMuzSA4OpquZXwPClhWPaMvB0FiyA
   WiTunM7sfTiCrp+j0f82GWUYNhRpnj676u9q51sNOyK2prNWsORU5hcvI
   j8CPsyNw1H2weIEw44Lf3FFiFHsAiK0LGEL1mQq0CeVFd6ySetCFzpxmL
   o2KL06Pe293XoJagUnCueY8+oaTI+mCz+Qq0tjYTARi72CQPpX/Q7lXdY
   mzr/qFotMVCWu9Hi8vbLDWFbUOygny2G0d8Yg3a6qbNIAXJJ7ePMufiZU
   w6TnUwLHHL/txY/y0lRP0Pu12KngOTFtaz6vyah6SusiJGwfcUw9R5S14
   w==;
X-CSE-ConnectionGUID: 9yETg0sdS0+jW+woXU/qFw==
X-CSE-MsgGUID: jq/1n32QRHmN/vewzftYnA==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11377579"
X-IronPort-AV: E=Sophos;i="6.08,149,1712646000"; 
   d="scan'208";a="11377579"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 15:16:28 -0700
X-CSE-ConnectionGUID: 3a+iarZ2TfyYjfHS3desbA==
X-CSE-MsgGUID: J66GH+Q/Q76cirTkMOI5sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,149,1712646000"; 
   d="scan'208";a="33930441"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 May 2024 15:16:26 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5C3s-0005Qf-0e;
	Thu, 09 May 2024 22:16:24 +0000
Date: Fri, 10 May 2024 06:16:20 +0800
From: kernel test robot <lkp@intel.com>
To: Hongyan Xia <hongyan.xia2@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 6/6] Propagate negative bias
Message-ID: <202405100609.722jdfri-lkp@intel.com>
References: <f60a29ac1af5098e0d37d426aec27db05d5d43e1.1715082714.git.hongyan.xia2@arm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f60a29ac1af5098e0d37d426aec27db05d5d43e1.1715082714.git.hongyan.xia2@arm.com>

Hi Hongyan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on tip/master next-20240509]
[cannot apply to rafael-pm/linux-next rafael-pm/bleeding-edge linus/master tip/auto-latest peterz-queue/sched/core v6.9-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hongyan-Xia/Revert-sched-uclamp-Set-max_spare_cap_cpu-even-if-max_spare_cap-is-0/20240507-205300
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/f60a29ac1af5098e0d37d426aec27db05d5d43e1.1715082714.git.hongyan.xia2%40arm.com
patch subject: [RFC PATCH v3 6/6] Propagate negative bias
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20240510/202405100609.722jdfri-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project b910bebc300dafb30569cecc3017b446ea8eafa0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240510/202405100609.722jdfri-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405100609.722jdfri-lkp@intel.com/

All errors (new ones prefixed by >>):

     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   In file included from kernel/sched/fair.c:54:
   kernel/sched/sched.h:3065:27: error: no member named 'avg' in 'struct cfs_rq'
    3065 |         return READ_ONCE(rq->cfs.avg.util_avg);
         |                          ~~~~~~~ ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:417:38: note: expanded from macro '__native_word'
     417 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
         |                                             ^
   include/linux/compiler_types.h:449:22: note: expanded from macro 'compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:437:23: note: expanded from macro '_compiletime_assert'
     437 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:429:9: note: expanded from macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   In file included from kernel/sched/fair.c:54:
   kernel/sched/sched.h:3065:27: error: no member named 'avg' in 'struct cfs_rq'
    3065 |         return READ_ONCE(rq->cfs.avg.util_avg);
         |                          ~~~~~~~ ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:48: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                                       ^
   include/linux/compiler_types.h:449:22: note: expanded from macro 'compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:437:23: note: expanded from macro '_compiletime_assert'
     437 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:429:9: note: expanded from macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   In file included from kernel/sched/fair.c:54:
   kernel/sched/sched.h:3065:27: error: no member named 'avg' in 'struct cfs_rq'
    3065 |         return READ_ONCE(rq->cfs.avg.util_avg);
         |                          ~~~~~~~ ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                  ^
   include/linux/compiler_types.h:405:13: note: expanded from macro '__unqual_scalar_typeof'
     405 |                 _Generic((x),                                           \
         |                           ^
   In file included from kernel/sched/fair.c:54:
   kernel/sched/sched.h:3065:27: error: no member named 'avg' in 'struct cfs_rq'
    3065 |         return READ_ONCE(rq->cfs.avg.util_avg);
         |                          ~~~~~~~ ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                  ^
   include/linux/compiler_types.h:412:15: note: expanded from macro '__unqual_scalar_typeof'
     412 |                          default: (x)))
         |                                    ^
   In file included from kernel/sched/fair.c:54:
   kernel/sched/sched.h:3065:27: error: no member named 'avg' in 'struct cfs_rq'
    3065 |         return READ_ONCE(rq->cfs.avg.util_avg);
         |                          ~~~~~~~ ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:72: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   In file included from kernel/sched/fair.c:54:
   kernel/sched/sched.h:3065:9: error: returning 'void' from a function with incompatible result type 'unsigned long'
    3065 |         return READ_ONCE(rq->cfs.avg.util_avg);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:47:28: note: expanded from macro 'READ_ONCE'
      47 | #define READ_ONCE(x)                                                    \
         |                                                                         ^
      48 | ({                                                                      \
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      50 |         __READ_ONCE(x);                                                 \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      51 | })
         | ~~
   kernel/sched/fair.c:6795:29: error: no member named 'avg' in 'struct cfs_rq'
    6795 |         util_bias_enqueue(&rq->cfs.avg, p);
         |                            ~~~~~~~ ^
   kernel/sched/fair.c:6889:29: error: no member named 'avg' in 'struct cfs_rq'
    6889 |         util_bias_dequeue(&rq->cfs.avg, p);
         |                            ~~~~~~~ ^
>> kernel/sched/fair.c:6890:2: error: call to undeclared function 'propagate_negative_bias'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    6890 |         propagate_negative_bias(p);
         |         ^
   1 warning and 12 errors generated.


vim +/propagate_negative_bias +6890 kernel/sched/fair.c

  6823	
  6824	/*
  6825	 * The dequeue_task method is called before nr_running is
  6826	 * decreased. We remove the task from the rbtree and
  6827	 * update the fair scheduling stats:
  6828	 */
  6829	static void dequeue_task_fair(struct rq *rq, struct task_struct *p, int flags)
  6830	{
  6831		struct cfs_rq *cfs_rq;
  6832		struct sched_entity *se = &p->se;
  6833		int task_sleep = flags & DEQUEUE_SLEEP;
  6834		int idle_h_nr_running = task_has_idle_policy(p);
  6835		bool was_sched_idle = sched_idle_rq(rq);
  6836	
  6837		util_est_dequeue(&rq->cfs, p);
  6838	
  6839		for_each_sched_entity(se) {
  6840			cfs_rq = cfs_rq_of(se);
  6841			dequeue_entity(cfs_rq, se, flags);
  6842	
  6843			cfs_rq->h_nr_running--;
  6844			cfs_rq->idle_h_nr_running -= idle_h_nr_running;
  6845	
  6846			if (cfs_rq_is_idle(cfs_rq))
  6847				idle_h_nr_running = 1;
  6848	
  6849			/* end evaluation on encountering a throttled cfs_rq */
  6850			if (cfs_rq_throttled(cfs_rq))
  6851				goto dequeue_throttle;
  6852	
  6853			/* Don't dequeue parent if it has other entities besides us */
  6854			if (cfs_rq->load.weight) {
  6855				/* Avoid re-evaluating load for this entity: */
  6856				se = parent_entity(se);
  6857				/*
  6858				 * Bias pick_next to pick a task from this cfs_rq, as
  6859				 * p is sleeping when it is within its sched_slice.
  6860				 */
  6861				if (task_sleep && se && !throttled_hierarchy(cfs_rq))
  6862					set_next_buddy(se);
  6863				break;
  6864			}
  6865			flags |= DEQUEUE_SLEEP;
  6866		}
  6867	
  6868		for_each_sched_entity(se) {
  6869			cfs_rq = cfs_rq_of(se);
  6870	
  6871			update_load_avg(cfs_rq, se, UPDATE_TG);
  6872			se_update_runnable(se);
  6873			update_cfs_group(se);
  6874	
  6875			cfs_rq->h_nr_running--;
  6876			cfs_rq->idle_h_nr_running -= idle_h_nr_running;
  6877	
  6878			if (cfs_rq_is_idle(cfs_rq))
  6879				idle_h_nr_running = 1;
  6880	
  6881			/* end evaluation on encountering a throttled cfs_rq */
  6882			if (cfs_rq_throttled(cfs_rq))
  6883				goto dequeue_throttle;
  6884	
  6885		}
  6886	
  6887		/* At this point se is NULL and we are at root level*/
  6888		sub_nr_running(rq, 1);
  6889		util_bias_dequeue(&rq->cfs.avg, p);
> 6890		propagate_negative_bias(p);
  6891		/* XXX: We should skip the update above and only do it once here. */
  6892		cpufreq_update_util(rq, 0);
  6893	
  6894		/* balance early to pull high priority tasks */
  6895		if (unlikely(!was_sched_idle && sched_idle_rq(rq)))
  6896			rq->next_balance = jiffies;
  6897	
  6898	dequeue_throttle:
  6899		util_est_update(&rq->cfs, p, task_sleep);
  6900		hrtick_update(rq);
  6901	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
