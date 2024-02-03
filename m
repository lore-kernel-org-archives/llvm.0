Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FEE5EE68;
	Sat,  3 Feb 2024 19:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706989586; cv=none; b=k6s8VsM9JFgPnfWBEBFDX5cRWktipi7qmotQyyzLNGPoM8MCfQuNe9ZXivhK/b2UruB5OI8VOe4z2qf4zxgrUfhlV5gcwV7TywISYGHLzYd3wOpYbhb9sUQNj34U65x3GcrLFQNqHhC4+PmxVfNwQnnItfWywVqsRHUPorIszTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706989586; c=relaxed/simple;
	bh=We5QQ5schqbsJFgDRL9Qa6uTRTsL4v6uzmiChTWmBz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A85faj9F3iuvfVV8sEhz8ED0HVbEMmELu0pGddMz6u2OAF35Z3E8jyd3cWnGpPf3TuaIi7tIdUIl5MBekgH0GdXn1bcfbUncZLQaK4riyMeh+sDn5BqikVV4lvHNPcOOJFxkfg9Ape1zcwqZ1+ILXRDrVJjoj1o0NNhCrIT9BXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KLU6ZEWe; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KLU6ZEWe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706989585; x=1738525585;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=We5QQ5schqbsJFgDRL9Qa6uTRTsL4v6uzmiChTWmBz8=;
  b=KLU6ZEWeo1HP9hH3HWSq/txW43P0o2XROvgZo9pQfd5egc7w5yWLZfUq
   EwHsnSoLzsUUnUg4/CnhXXeyBEL7DPWjlrBWRRSB5yb6zAnf+8q9/AnXd
   rLfFA77FnPiqPCDJQkvdF9LyuoQIHmhN5IB3kGsslYOQpGNq4R/TD4b4p
   Bs5kAcWmRcDH64ashUdc/9/OAxMxkvry5tQkYtZ9tF8j3yiRrXYmA1qZb
   3aLsZd9FGjN6UWmVaasIl2LMrxdR8hBrJjvLAyeWmd9wVBdPAZDFe4zxP
   QdX6UDLxP55z0einWocLi/5ecVByo1ZAqi8k2KzaATeIof2+en9vagITA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="17750700"
X-IronPort-AV: E=Sophos;i="6.05,241,1701158400"; 
   d="scan'208";a="17750700"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2024 11:46:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,241,1701158400"; 
   d="scan'208";a="31153350"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 03 Feb 2024 11:46:23 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWLxz-0005XC-2G;
	Sat, 03 Feb 2024 19:46:19 +0000
Date: Sun, 4 Feb 2024 03:45:32 +0800
From: kernel test robot <lkp@intel.com>
To: Valentin Schneider <vschneid@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 1/5] sched/fair: Only throttle CFS tasks on return
 to userspace
Message-ID: <202402040329.OcEA18Jz-lkp@intel.com>
References: <20240202080920.3337862-2-vschneid@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240202080920.3337862-2-vschneid@redhat.com>

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
patch link:    https://lore.kernel.org/r/20240202080920.3337862-2-vschneid%40redhat.com
patch subject: [RFC PATCH v2 1/5] sched/fair: Only throttle CFS tasks on return to userspace
config: arm-randconfig-002-20240203 (https://download.01.org/0day-ci/archive/20240204/202402040329.OcEA18Jz-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240204/202402040329.OcEA18Jz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402040329.OcEA18Jz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/fair.c:6937:3: error: call to undeclared function 'unthrottle_on_enqueue'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   unthrottle_on_enqueue(p);
                   ^
   kernel/sched/fair.c:6954:40: error: no member named 'kernel_node' in 'struct sched_entity'
           bool kernel_task = !list_empty(&p->se.kernel_node);
                                           ~~~~~ ^
   kernel/sched/fair.c:13312:6: warning: no previous prototype for function 'free_fair_sched_group' [-Wmissing-prototypes]
   void free_fair_sched_group(struct task_group *tg) { }
        ^
   kernel/sched/fair.c:13312:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void free_fair_sched_group(struct task_group *tg) { }
   ^
   static 
   kernel/sched/fair.c:13314:5: warning: no previous prototype for function 'alloc_fair_sched_group' [-Wmissing-prototypes]
   int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
       ^
   kernel/sched/fair.c:13314:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
   ^
   static 
   kernel/sched/fair.c:13319:6: warning: no previous prototype for function 'online_fair_sched_group' [-Wmissing-prototypes]
   void online_fair_sched_group(struct task_group *tg) { }
        ^
   kernel/sched/fair.c:13319:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void online_fair_sched_group(struct task_group *tg) { }
   ^
   static 
   kernel/sched/fair.c:13321:6: warning: no previous prototype for function 'unregister_fair_sched_group' [-Wmissing-prototypes]
   void unregister_fair_sched_group(struct task_group *tg) { }
        ^
   kernel/sched/fair.c:13321:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void unregister_fair_sched_group(struct task_group *tg) { }
   ^
   static 
   4 warnings and 2 errors generated.


vim +/unthrottle_on_enqueue +6937 kernel/sched/fair.c

  6839	
  6840	/*
  6841	 * The enqueue_task method is called before nr_running is
  6842	 * increased. Here we update the fair scheduling stats and
  6843	 * then put the task into the rbtree:
  6844	 */
  6845	static void
  6846	enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
  6847	{
  6848		struct cfs_rq *cfs_rq;
  6849		struct sched_entity *se = &p->se;
  6850		int idle_h_nr_running = task_has_idle_policy(p);
  6851		int task_new = !(flags & ENQUEUE_WAKEUP);
  6852		bool kernel_task = is_kernel_task(p);
  6853	
  6854		/*
  6855		 * The code below (indirectly) updates schedutil which looks at
  6856		 * the cfs_rq utilization to select a frequency.
  6857		 * Let's add the task's estimated utilization to the cfs_rq's
  6858		 * estimated utilization, before we update schedutil.
  6859		 */
  6860		util_est_enqueue(&rq->cfs, p);
  6861	
  6862		/*
  6863		 * If in_iowait is set, the code below may not trigger any cpufreq
  6864		 * utilization updates, so do it here explicitly with the IOWAIT flag
  6865		 * passed.
  6866		 */
  6867		if (p->in_iowait)
  6868			cpufreq_update_util(rq, SCHED_CPUFREQ_IOWAIT);
  6869	
  6870		for_each_sched_entity(se) {
  6871			if (se->on_rq)
  6872				break;
  6873			cfs_rq = cfs_rq_of(se);
  6874			enqueue_entity(cfs_rq, se, flags);
  6875	
  6876			cfs_rq->h_nr_running++;
  6877			cfs_rq->idle_h_nr_running += idle_h_nr_running;
  6878	
  6879			if (cfs_rq_is_idle(cfs_rq))
  6880				idle_h_nr_running = 1;
  6881			if (kernel_task)
  6882				enqueue_kernel(cfs_rq, se, 1);
  6883	
  6884			/* end evaluation on encountering a throttled cfs_rq */
  6885			if (cfs_rq_throttled(cfs_rq))
  6886				goto enqueue_throttle;
  6887	
  6888			flags = ENQUEUE_WAKEUP;
  6889		}
  6890	
  6891		for_each_sched_entity(se) {
  6892			cfs_rq = cfs_rq_of(se);
  6893	
  6894			update_load_avg(cfs_rq, se, UPDATE_TG);
  6895			se_update_runnable(se);
  6896			update_cfs_group(se);
  6897	
  6898			cfs_rq->h_nr_running++;
  6899			cfs_rq->idle_h_nr_running += idle_h_nr_running;
  6900	
  6901			if (cfs_rq_is_idle(cfs_rq))
  6902				idle_h_nr_running = 1;
  6903			if (kernel_task)
  6904				enqueue_kernel(cfs_rq, se, 1);
  6905	
  6906			/* end evaluation on encountering a throttled cfs_rq */
  6907			if (cfs_rq_throttled(cfs_rq))
  6908				goto enqueue_throttle;
  6909		}
  6910	
  6911		/* At this point se is NULL and we are at root level*/
  6912		add_nr_running(rq, 1);
  6913	
  6914		/*
  6915		 * Since new tasks are assigned an initial util_avg equal to
  6916		 * half of the spare capacity of their CPU, tiny tasks have the
  6917		 * ability to cross the overutilized threshold, which will
  6918		 * result in the load balancer ruining all the task placement
  6919		 * done by EAS. As a way to mitigate that effect, do not account
  6920		 * for the first enqueue operation of new tasks during the
  6921		 * overutilized flag detection.
  6922		 *
  6923		 * A better way of solving this problem would be to wait for
  6924		 * the PELT signals of tasks to converge before taking them
  6925		 * into account, but that is not straightforward to implement,
  6926		 * and the following generally works well enough in practice.
  6927		 */
  6928		if (!task_new)
  6929			update_overutilized_status(rq);
  6930	
  6931	enqueue_throttle:
  6932		assert_list_leaf_cfs_rq(rq);
  6933	
  6934		hrtick_update(rq);
  6935	
  6936		if (kernel_task)
> 6937			unthrottle_on_enqueue(p);
  6938	}
  6939	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
