Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE584631;
	Sun,  4 Feb 2024 00:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707005118; cv=none; b=YYyMFFhRQzU4sI7eIJOKsNtWMAhjopNxTZzFb3wicPNKlaIbunIiZeNfmfi3HDKG3TNn07uu37ikxyAiVwWV4zW6a/IOa+vu3pB2z//GdLRYbPq9u06Eh3VmCh5cBuA544X44r4ZVwRZdc0yQouD4NfUldQfSU0vW96l+TBvEIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707005118; c=relaxed/simple;
	bh=j6Shh9h2iVrn1teM8FE2HjnaOQMQ3eFDK7hqmlro6IE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UwbNnq1gaD6Q3hDb96HyeNIbZhPZF624MvVBajMwOEdUTfci4P+7DxDLhovpPRPMwDjW2vZx6Y+qQAuvloRUpTRH13EKRvya77xxSp34y9HFVvgXduT/50zoAFQRJ/DzcyGLuxy40QBPf1lsBGFQenxkHpcVGad3CznTuuyiOBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cbvR/whm; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cbvR/whm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707005116; x=1738541116;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=j6Shh9h2iVrn1teM8FE2HjnaOQMQ3eFDK7hqmlro6IE=;
  b=cbvR/whm4EP0qNuepnfFfQqyn8+NFYXPtYrW8iFy4q37G+7dzKXiqKUL
   5xz/yDsg74SgafoqXJ/09Qv7LvwT0+BmnEPpuy1/Q/jSyJ23wU/esb9zo
   8Pl1gySJ/gw51e5tsmb4irGv5BX2D8sx0CDrm3POIrZGy/pec8vz56Jq6
   ZM8ct1KHCWKfI0MO1dDQfi/x8KtbECgpY5tGlr75AOLBtAWz9P3TUvhz0
   mSS4Hc3/9anA18gUApLEq1yrIq9M9O/bOl49xMxur/+fOBn6PajoZSAQc
   6JRVzckFSdN2gr/mr3cP94TPRv9ne1IcDTKWWIFsIgW14Qh40pHyw958G
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="4151718"
X-IronPort-AV: E=Sophos;i="6.05,241,1701158400"; 
   d="scan'208";a="4151718"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2024 16:05:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,241,1701158400"; 
   d="scan'208";a="396027"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 03 Feb 2024 16:05:12 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWQ0U-0005la-1I;
	Sun, 04 Feb 2024 00:05:10 +0000
Date: Sun, 4 Feb 2024 08:04:37 +0800
From: kernel test robot <lkp@intel.com>
To: Valentin Schneider <vschneid@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 5/5] sched/fair: Assert user/kernel/total nr
 invariants
Message-ID: <202402040702.ytDsOZ2e-lkp@intel.com>
References: <20240202080920.3337862-6-vschneid@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240202080920.3337862-6-vschneid@redhat.com>

Hi Valentin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on tip/core/entry tip/master linus/master v6.8-rc2 next-20240202]
[cannot apply to tip/auto-latest]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Valentin-Schneider/sched-fair-Only-throttle-CFS-tasks-on-return-to-userspace/20240202-162620
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20240202080920.3337862-6-vschneid%40redhat.com
patch subject: [RFC PATCH v2 5/5] sched/fair: Assert user/kernel/total nr invariants
config: arm-randconfig-002-20240203 (https://download.01.org/0day-ci/archive/20240204/202402040702.ytDsOZ2e-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240204/202402040702.ytDsOZ2e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402040702.ytDsOZ2e-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/fair.c:6969:53: error: no member named 'throttle_pending' in 'struct cfs_rq'
                   if (kernel_task || (!throttle_pending && !cfs_rq->throttle_pending))
                                                             ~~~~~~  ^
   kernel/sched/fair.c:6974:12: error: no member named 'h_user_running' in 'struct cfs_rq'; did you mean 'h_nr_running'?
                           cfs_rq->h_user_running++;
                                   ^~~~~~~~~~~~~~
                                   h_nr_running
   kernel/sched/sched.h:563:16: note: 'h_nr_running' declared here
           unsigned int            h_nr_running;      /* SCHED_{NORMAL,BATCH,IDLE} */
                                   ^
   kernel/sched/fair.c:6976:31: error: no member named 'throttle_pending' in 'struct cfs_rq'
                   throttle_pending |= cfs_rq->throttle_pending;
                                       ~~~~~~  ^
>> kernel/sched/fair.c:6982:3: error: call to undeclared function 'assert_cfs_rq_counts'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   assert_cfs_rq_counts(cfs_rq);
                   ^
   kernel/sched/fair.c:6998:3: error: call to undeclared function 'assert_cfs_rq_counts'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   assert_cfs_rq_counts(cfs_rq);
                   ^
   kernel/sched/fair.c:7000:53: error: no member named 'throttle_pending' in 'struct cfs_rq'
                   if (kernel_task || (!throttle_pending && !cfs_rq->throttle_pending))
                                                             ~~~~~~  ^
   kernel/sched/fair.c:7005:12: error: no member named 'h_user_running' in 'struct cfs_rq'; did you mean 'h_nr_running'?
                           cfs_rq->h_user_running++;
                                   ^~~~~~~~~~~~~~
                                   h_nr_running
   kernel/sched/sched.h:563:16: note: 'h_nr_running' declared here
           unsigned int            h_nr_running;      /* SCHED_{NORMAL,BATCH,IDLE} */
                                   ^
   kernel/sched/fair.c:7007:31: error: no member named 'throttle_pending' in 'struct cfs_rq'
                   throttle_pending |= cfs_rq->throttle_pending;
                                       ~~~~~~  ^
   kernel/sched/fair.c:7046:3: error: call to undeclared function 'unthrottle_on_enqueue'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   unthrottle_on_enqueue(p);
                   ^
   kernel/sched/fair.c:7063:40: error: no member named 'kernel_node' in 'struct sched_entity'
           bool kernel_task = !list_empty(&p->se.kernel_node);
                                           ~~~~~ ^
   kernel/sched/fair.c:7073:53: error: no member named 'throttle_pending' in 'struct cfs_rq'
                   if (kernel_task || (!throttle_pending && !cfs_rq->throttle_pending))
                                                             ~~~~~~  ^
   kernel/sched/fair.c:7078:12: error: no member named 'h_user_running' in 'struct cfs_rq'; did you mean 'h_nr_running'?
                           cfs_rq->h_user_running--;
                                   ^~~~~~~~~~~~~~
                                   h_nr_running
   kernel/sched/sched.h:563:16: note: 'h_nr_running' declared here
           unsigned int            h_nr_running;      /* SCHED_{NORMAL,BATCH,IDLE} */
                                   ^
   kernel/sched/fair.c:7080:31: error: no member named 'throttle_pending' in 'struct cfs_rq'
                   throttle_pending |= cfs_rq->throttle_pending;
                                       ~~~~~~  ^
   kernel/sched/fair.c:7086:3: error: call to undeclared function 'assert_cfs_rq_counts'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   assert_cfs_rq_counts(cfs_rq);
                   ^
   kernel/sched/fair.c:7115:53: error: no member named 'throttle_pending' in 'struct cfs_rq'
                   if (kernel_task || (!throttle_pending && !cfs_rq->throttle_pending))
                                                             ~~~~~~  ^
   kernel/sched/fair.c:7120:12: error: no member named 'h_user_running' in 'struct cfs_rq'; did you mean 'h_nr_running'?
                           cfs_rq->h_user_running--;
                                   ^~~~~~~~~~~~~~
                                   h_nr_running
   kernel/sched/sched.h:563:16: note: 'h_nr_running' declared here
           unsigned int            h_nr_running;      /* SCHED_{NORMAL,BATCH,IDLE} */
                                   ^
   kernel/sched/fair.c:7122:31: error: no member named 'throttle_pending' in 'struct cfs_rq'
                   throttle_pending |= cfs_rq->throttle_pending;
                                       ~~~~~~  ^
   kernel/sched/fair.c:7128:3: error: call to undeclared function 'assert_cfs_rq_counts'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   assert_cfs_rq_counts(cfs_rq);
                   ^
   kernel/sched/fair.c:13465:6: warning: no previous prototype for function 'free_fair_sched_group' [-Wmissing-prototypes]
   void free_fair_sched_group(struct task_group *tg) { }
        ^
   kernel/sched/fair.c:13465:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void free_fair_sched_group(struct task_group *tg) { }
   ^
   static 
   kernel/sched/fair.c:13467:5: warning: no previous prototype for function 'alloc_fair_sched_group' [-Wmissing-prototypes]
   int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
       ^
   kernel/sched/fair.c:13467:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
   ^
   static 
   kernel/sched/fair.c:13472:6: warning: no previous prototype for function 'online_fair_sched_group' [-Wmissing-prototypes]
   void online_fair_sched_group(struct task_group *tg) { }
        ^
   kernel/sched/fair.c:13472:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void online_fair_sched_group(struct task_group *tg) { }
   ^
   static 
   kernel/sched/fair.c:13474:6: warning: no previous prototype for function 'unregister_fair_sched_group' [-Wmissing-prototypes]
   void unregister_fair_sched_group(struct task_group *tg) { }
        ^
   kernel/sched/fair.c:13474:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void unregister_fair_sched_group(struct task_group *tg) { }
   ^
   static 
   4 warnings and 18 errors generated.


vim +/assert_cfs_rq_counts +6982 kernel/sched/fair.c

  6930	
  6931	/*
  6932	 * The enqueue_task method is called before nr_running is
  6933	 * increased. Here we update the fair scheduling stats and
  6934	 * then put the task into the rbtree:
  6935	 */
  6936	static void
  6937	enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
  6938	{
  6939		struct cfs_rq *cfs_rq;
  6940		struct sched_entity *se = &p->se;
  6941		int idle_h_nr_running = task_has_idle_policy(p);
  6942		int task_new = !(flags & ENQUEUE_WAKEUP);
  6943		bool kernel_task = is_kernel_task(p);
  6944		bool throttle_pending = false;
  6945	
  6946		/*
  6947		 * The code below (indirectly) updates schedutil which looks at
  6948		 * the cfs_rq utilization to select a frequency.
  6949		 * Let's add the task's estimated utilization to the cfs_rq's
  6950		 * estimated utilization, before we update schedutil.
  6951		 */
  6952		util_est_enqueue(&rq->cfs, p);
  6953	
  6954		/*
  6955		 * If in_iowait is set, the code below may not trigger any cpufreq
  6956		 * utilization updates, so do it here explicitly with the IOWAIT flag
  6957		 * passed.
  6958		 */
  6959		if (p->in_iowait)
  6960			cpufreq_update_util(rq, SCHED_CPUFREQ_IOWAIT);
  6961	
  6962		for_each_sched_entity(se) {
  6963			if (se->on_rq)
  6964				break;
  6965			cfs_rq = cfs_rq_of(se);
  6966			enqueue_entity(cfs_rq, se, flags);
  6967	
  6968	
  6969			if (kernel_task || (!throttle_pending && !cfs_rq->throttle_pending))
  6970				cfs_rq->h_nr_running++;
  6971			if (kernel_task)
  6972				enqueue_kernel(cfs_rq, se, 1);
  6973			else if (!throttle_pending)
  6974				cfs_rq->h_user_running++;
  6975	
  6976			throttle_pending |= cfs_rq->throttle_pending;
  6977	
  6978			cfs_rq->idle_h_nr_running += idle_h_nr_running;
  6979			if (cfs_rq_is_idle(cfs_rq))
  6980				idle_h_nr_running = 1;
  6981	
> 6982			assert_cfs_rq_counts(cfs_rq);
  6983	
  6984			/* end evaluation on encountering a throttled cfs_rq */
  6985			if (cfs_rq_throttled(cfs_rq))
  6986				goto enqueue_throttle;
  6987	
  6988			flags = ENQUEUE_WAKEUP;
  6989		}
  6990	
  6991		for_each_sched_entity(se) {
  6992			cfs_rq = cfs_rq_of(se);
  6993	
  6994			update_load_avg(cfs_rq, se, UPDATE_TG);
  6995			se_update_runnable(se);
  6996			update_cfs_group(se);
  6997	
  6998			assert_cfs_rq_counts(cfs_rq);
  6999	
  7000			if (kernel_task || (!throttle_pending && !cfs_rq->throttle_pending))
  7001				cfs_rq->h_nr_running++;
  7002			if (kernel_task)
  7003				enqueue_kernel(cfs_rq, se, 1);
  7004			else if (!throttle_pending)
  7005				cfs_rq->h_user_running++;
  7006	
  7007			throttle_pending |= cfs_rq->throttle_pending;
  7008	
  7009			cfs_rq->idle_h_nr_running += idle_h_nr_running;
  7010			if (cfs_rq_is_idle(cfs_rq))
  7011				idle_h_nr_running = 1;
  7012	
  7013			assert_cfs_rq_counts(cfs_rq);
  7014	
  7015			/* end evaluation on encountering a throttled cfs_rq */
  7016			if (cfs_rq_throttled(cfs_rq))
  7017				goto enqueue_throttle;
  7018		}
  7019	
  7020		/* At this point se is NULL and we are at root level*/
  7021		add_nr_running(rq, 1);
  7022	
  7023		/*
  7024		 * Since new tasks are assigned an initial util_avg equal to
  7025		 * half of the spare capacity of their CPU, tiny tasks have the
  7026		 * ability to cross the overutilized threshold, which will
  7027		 * result in the load balancer ruining all the task placement
  7028		 * done by EAS. As a way to mitigate that effect, do not account
  7029		 * for the first enqueue operation of new tasks during the
  7030		 * overutilized flag detection.
  7031		 *
  7032		 * A better way of solving this problem would be to wait for
  7033		 * the PELT signals of tasks to converge before taking them
  7034		 * into account, but that is not straightforward to implement,
  7035		 * and the following generally works well enough in practice.
  7036		 */
  7037		if (!task_new)
  7038			update_overutilized_status(rq);
  7039	
  7040	enqueue_throttle:
  7041		assert_list_leaf_cfs_rq(rq);
  7042	
  7043		hrtick_update(rq);
  7044	
  7045		if (kernel_task)
  7046			unthrottle_on_enqueue(p);
  7047	}
  7048	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
