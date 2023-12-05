Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70915675B7;
	Tue,  5 Dec 2023 18:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j5KBuyU6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701802279; x=1733338279;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fZNR1CyqzLwqAW2vpNNRQc7vOketK762r7iyvvzImOk=;
  b=j5KBuyU6JqDmTEZMbw5DVvf8ctZwl/d0iRqtz5dxbpbcoyVkJrr7lb6D
   LwxlC62g+7Zvcw+Rb9D1fW8LF4TnfobkYZf9OaaFUOXID4Z31kRim9++u
   rLgPAFdSKVbqI+R6mCkSDf8Z2rRIpnkrCHnpVwSSMr0lpHJvzVB0Ot6Hy
   NLG3A6zzwBo9gtUKevR9dbPA3vm49nJ6B++DgAFStD1KbHCeu55WEZdIB
   kCvHyuDy5xrgSAeN03kwKhQHGm/+rza6d/xC7r8F54RX8BKCQkCCg5gwV
   dpx8WpXRnIW/VERSbi205dS1JoILz5/XUbvpCBCjfVVP0t4vFi1tWqaZo
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="460433513"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="460433513"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 10:51:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="774726518"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="774726518"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 05 Dec 2023 10:51:14 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAaVk-0009Zl-0n;
	Tue, 05 Dec 2023 18:51:12 +0000
Date: Wed, 6 Dec 2023 02:50:12 +0800
From: kernel test robot <lkp@intel.com>
To: Valentin Schneider <vschneid@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/2] sched/fair: Only throttle CFS tasks on return to
 userspace
Message-ID: <202312060204.DzviMIAg-lkp@intel.com>
References: <20231130161245.3894682-2-vschneid@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231130161245.3894682-2-vschneid@redhat.com>

Hi Valentin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on tip/master linus/master v6.7-rc4 next-20231205]
[cannot apply to tip/auto-latest]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Valentin-Schneider/sched-fair-Only-throttle-CFS-tasks-on-return-to-userspace/20231201-001908
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20231130161245.3894682-2-vschneid%40redhat.com
patch subject: [RFC PATCH 1/2] sched/fair: Only throttle CFS tasks on return to userspace
config: arm-randconfig-002-20231202 (https://download.01.org/0day-ci/archive/20231206/202312060204.DzviMIAg-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312060204.DzviMIAg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312060204.DzviMIAg-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/fair.c:8575:30: error: no member named 'in_throttle_limbo' in 'struct cfs_rq'
    8575 |         if (unlikely(cfs_rq_of(se)->in_throttle_limbo && !task_has_throttle_work(p)))
         |                      ~~~~~~~~~~~~~  ^
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   kernel/sched/fair.c:8575:52: error: call to undeclared function 'task_has_throttle_work'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    8575 |         if (unlikely(cfs_rq_of(se)->in_throttle_limbo && !task_has_throttle_work(p)))
         |                                                           ^
   kernel/sched/fair.c:8575:52: note: did you mean 'init_cfs_throttle_work'?
   kernel/sched/sched.h:2457:13: note: 'init_cfs_throttle_work' declared here
    2457 | extern void init_cfs_throttle_work(struct task_struct *p);
         |             ^
>> kernel/sched/fair.c:8576:24: error: no member named 'sched_throttle_work' in 'struct task_struct'
    8576 |                 task_work_add(p, &p->sched_throttle_work, TWA_RESUME);
         |                                   ~  ^
   kernel/sched/fair.c:13197:6: warning: no previous prototype for function 'free_fair_sched_group' [-Wmissing-prototypes]
    13197 | void free_fair_sched_group(struct task_group *tg) { }
          |      ^
   kernel/sched/fair.c:13197:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    13197 | void free_fair_sched_group(struct task_group *tg) { }
          | ^
          | static 
   kernel/sched/fair.c:13199:5: warning: no previous prototype for function 'alloc_fair_sched_group' [-Wmissing-prototypes]
    13199 | int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
          |     ^
   kernel/sched/fair.c:13199:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    13199 | int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
          | ^
          | static 
   kernel/sched/fair.c:13204:6: warning: no previous prototype for function 'online_fair_sched_group' [-Wmissing-prototypes]
    13204 | void online_fair_sched_group(struct task_group *tg) { }
          |      ^
   kernel/sched/fair.c:13204:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    13204 | void online_fair_sched_group(struct task_group *tg) { }
          | ^
          | static 
   kernel/sched/fair.c:13206:6: warning: no previous prototype for function 'unregister_fair_sched_group' [-Wmissing-prototypes]
    13206 | void unregister_fair_sched_group(struct task_group *tg) { }
          |      ^
   kernel/sched/fair.c:13206:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    13206 | void unregister_fair_sched_group(struct task_group *tg) { }
          | ^
          | static 
   4 warnings and 3 errors generated.


vim +8576 kernel/sched/fair.c

  8471	
  8472	struct task_struct *
  8473	pick_next_task_fair(struct rq *rq, struct task_struct *prev, struct rq_flags *rf)
  8474	{
  8475		struct cfs_rq *cfs_rq = &rq->cfs;
  8476		struct sched_entity *se;
  8477		struct task_struct *p;
  8478		int new_tasks;
  8479	
  8480	again:
  8481		if (!sched_fair_runnable(rq))
  8482			goto idle;
  8483	
  8484	#ifdef CONFIG_FAIR_GROUP_SCHED
  8485		if (!prev || prev->sched_class != &fair_sched_class)
  8486			goto simple;
  8487	
  8488		/*
  8489		 * Because of the set_next_buddy() in dequeue_task_fair() it is rather
  8490		 * likely that a next task is from the same cgroup as the current.
  8491		 *
  8492		 * Therefore attempt to avoid putting and setting the entire cgroup
  8493		 * hierarchy, only change the part that actually changes.
  8494		 */
  8495	
  8496		do {
  8497			struct sched_entity *curr = cfs_rq->curr;
  8498	
  8499			/*
  8500			 * Since we got here without doing put_prev_entity() we also
  8501			 * have to consider cfs_rq->curr. If it is still a runnable
  8502			 * entity, update_curr() will update its vruntime, otherwise
  8503			 * forget we've ever seen it.
  8504			 */
  8505			if (curr) {
  8506				if (curr->on_rq)
  8507					update_curr(cfs_rq);
  8508				else
  8509					curr = NULL;
  8510	
  8511				/*
  8512				 * This call to check_cfs_rq_runtime() will do the
  8513				 * throttle and dequeue its entity in the parent(s).
  8514				 * Therefore the nr_running test will indeed
  8515				 * be correct.
  8516				 */
  8517				if (unlikely(check_cfs_rq_runtime(cfs_rq))) {
  8518					cfs_rq = &rq->cfs;
  8519	
  8520					if (!cfs_rq->nr_running)
  8521						goto idle;
  8522	
  8523					goto simple;
  8524				}
  8525			}
  8526	
  8527			se = pick_next_entity(cfs_rq);
  8528			cfs_rq = group_cfs_rq(se);
  8529		} while (cfs_rq);
  8530	
  8531		p = task_of(se);
  8532	
  8533		if (unlikely(cfs_rq_of(se)->in_throttle_limbo && !task_has_throttle_work(p)))
  8534			task_work_add(p, &p->sched_throttle_work, TWA_RESUME);
  8535		/*
  8536		 * Since we haven't yet done put_prev_entity and if the selected task
  8537		 * is a different task than we started out with, try and touch the
  8538		 * least amount of cfs_rqs.
  8539		 */
  8540		if (prev != p) {
  8541			struct sched_entity *pse = &prev->se;
  8542	
  8543			while (!(cfs_rq = is_same_group(se, pse))) {
  8544				int se_depth = se->depth;
  8545				int pse_depth = pse->depth;
  8546	
  8547				if (se_depth <= pse_depth) {
  8548					put_prev_entity(cfs_rq_of(pse), pse);
  8549					pse = parent_entity(pse);
  8550				}
  8551				if (se_depth >= pse_depth) {
  8552					set_next_entity(cfs_rq_of(se), se);
  8553					se = parent_entity(se);
  8554				}
  8555			}
  8556	
  8557			put_prev_entity(cfs_rq, pse);
  8558			set_next_entity(cfs_rq, se);
  8559		}
  8560	
  8561		goto done;
  8562	simple:
  8563	#endif
  8564		if (prev)
  8565			put_prev_task(rq, prev);
  8566	
  8567		do {
  8568			se = pick_next_entity(cfs_rq);
  8569			set_next_entity(cfs_rq, se);
  8570			cfs_rq = group_cfs_rq(se);
  8571		} while (cfs_rq);
  8572	
  8573		p = task_of(se);
  8574	
  8575		if (unlikely(cfs_rq_of(se)->in_throttle_limbo && !task_has_throttle_work(p)))
> 8576			task_work_add(p, &p->sched_throttle_work, TWA_RESUME);
  8577	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
