Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5103163B7;
	Thu,  2 Feb 2023 13:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675344515; x=1706880515;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2Z7HaV7y38aU7ZgZO62NFEASFBPXU0484Rt4+r1sx5Q=;
  b=EIrh1+Shft4Y0P0iYJQMv2XwEB8tWLacYdHIYGvuofHZn798LTenzyUY
   CjzpStyxSKPFnw86b0cNoPyQbGYZT/tbLg7qU7zfd6jRZVq4+MmlZdJne
   nmwIOxR8lh3jMICtoGlf9W6EuWgkKxX8RT3KaG/ZnPuJM7ku0k4aDuf6u
   i8CIDynPGYnrt/RVdLWOpKVCDmxqEuIRmI0SlSJTGj5DK8n9525RtncM6
   efvyuqVB/AC4SkTx1GELd+oijGN0UeOTcwkDdNqqtmRYAiiPrfRV1HN5V
   xOASPR+a4T0R0DVeyrvD6tNTnNiCKn4EIk7RUbg2vuUZh5qL0lFKViFfy
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="355784515"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="355784515"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 05:28:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="642893156"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="642893156"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 02 Feb 2023 05:28:33 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNZdg-0006Xk-0m;
	Thu, 02 Feb 2023 13:28:32 +0000
Date: Thu, 2 Feb 2023 21:28:01 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jfern:sched/rt-throttle.feb2.2023 3/3] kernel/sched/rt.c:963:17:
 error: no member named 'tg' in 'struct rt_rq'
Message-ID: <202302022152.YmjwlMW8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git sched/rt-throttle.feb2.2023
head:   1bd3cc21bb61cc085f34fe3a493233bceb1994e0
commit: 1bd3cc21bb61cc085f34fe3a493233bceb1994e0 [3/3] sched/rt: Keep throttled rt_rqs on the runqueue
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230202/202302022152.YmjwlMW8-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/commit/?id=1bd3cc21bb61cc085f34fe3a493233bceb1994e0
        git remote add jfern https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
        git fetch --no-tags jfern sched/rt-throttle.feb2.2023
        git checkout 1bd3cc21bb61cc085f34fe3a493233bceb1994e0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:45:
>> kernel/sched/rt.c:963:17: error: no member named 'tg' in 'struct rt_rq'
                                           if (rt_rq->tg && rt_rq->tg->parent)
                                               ~~~~~  ^
   kernel/sched/rt.c:963:30: error: no member named 'tg' in 'struct rt_rq'
                                           if (rt_rq->tg && rt_rq->tg->parent)
                                                            ~~~~~  ^
   kernel/sched/rt.c:964:29: error: no member named 'tg' in 'struct rt_rq'
                                                   parent_rt_se = rt_rq->tg->parent->rt_se[i];
                                                                  ~~~~~  ^
   kernel/sched/rt.c:966:7: error: implicit declaration of function 'adjust_cg_throt_update' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                                                   adjust_cg_throt_update(parent_rt_se, false);
                                                   ^
   kernel/sched/rt.c:1101:28: error: no member named 'parent' in 'struct sched_rt_entity'
                                   if (!tbefore && rt_se->parent)
                                                   ~~~~~  ^
   kernel/sched/rt.c:1102:6: error: implicit declaration of function 'adjust_cg_throt_update' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                                           adjust_cg_throt_update(rt_se->parent, true);
                                           ^
   kernel/sched/rt.c:1102:36: error: no member named 'parent' in 'struct sched_rt_entity'
                                           adjust_cg_throt_update(rt_se->parent, true);
                                                                  ~~~~~  ^
   kernel/sched/rt.c:1331:13: error: static declaration of 'adjust_cg_throt_update' follows non-static declaration
   static void adjust_cg_throt_update(struct sched_rt_entity *rse, bool throt) { }
               ^
   kernel/sched/rt.c:966:7: note: previous implicit declaration is here
                                                   adjust_cg_throt_update(parent_rt_se, false);
                                                   ^
   kernel/sched/rt.c:1426:51: error: no member named 'parent' in 'struct sched_rt_entity'
           if (!tbefore && rt_rq_throttled(rt_rq) && rt_se->parent)
                                                     ~~~~~  ^
   kernel/sched/rt.c:1427:33: error: no member named 'parent' in 'struct sched_rt_entity'
                   adjust_cg_throt_update(rt_se->parent, true);
                                          ~~~~~  ^
   kernel/sched/rt.c:1572:52: error: no member named 'parent' in 'struct sched_rt_entity'
                   if (tbefore && !rt_rq_throttled(rt_rq) && rt_se->parent)
                                                             ~~~~~  ^
   kernel/sched/rt.c:1573:34: error: no member named 'parent' in 'struct sched_rt_entity'
                           adjust_cg_throt_update(rt_se->parent, false);
                                                  ~~~~~  ^
   12 errors generated.


vim +963 kernel/sched/rt.c

   902	
   903	static int do_sched_rt_period_timer(struct rt_bandwidth *rt_b, int overrun)
   904	{
   905		int i, idle = 1, throttled = 0;
   906		const struct cpumask *span;
   907	
   908		span = sched_rt_period_mask();
   909	#ifdef CONFIG_RT_GROUP_SCHED
   910		/*
   911		 * FIXME: isolated CPUs should really leave the root task group,
   912		 * whether they are isolcpus or were isolated via cpusets, lest
   913		 * the timer run on a CPU which does not service all runqueues,
   914		 * potentially leaving other CPUs indefinitely throttled.  If
   915		 * isolation is really required, the user will turn the throttle
   916		 * off to kill the perturbations it causes anyway.  Meanwhile,
   917		 * this maintains functionality for boot and/or troubleshooting.
   918		 */
   919		if (rt_b == &root_task_group.rt_bandwidth)
   920			span = cpu_online_mask;
   921	#endif
   922		for_each_cpu(i, span) {
   923			int enqueue = 0;
   924			struct rt_rq *rt_rq = sched_rt_period_rt_rq(rt_b, i);
   925			struct rq *rq = rq_of_rt_rq(rt_rq);
   926			struct rq_flags rf;
   927			int skip;
   928	
   929			/*
   930			 * When span == cpu_online_mask, taking each rq->lock
   931			 * can be time-consuming. Try to avoid it when possible.
   932			 */
   933			raw_spin_lock(&rt_rq->rt_runtime_lock);
   934			if (!sched_feat(RT_RUNTIME_SHARE) && rt_rq->rt_runtime != RUNTIME_INF)
   935				rt_rq->rt_runtime = rt_b->rt_runtime;
   936			skip = !rt_rq->rt_time && !rt_rq->rt_nr_running;
   937			raw_spin_unlock(&rt_rq->rt_runtime_lock);
   938			if (skip)
   939				continue;
   940	
   941			rq_lock(rq, &rf);
   942			update_rq_clock(rq);
   943	
   944			if (rt_rq->rt_time) {
   945				u64 runtime;
   946				struct sched_rt_entity *parent_rt_se = NULL;
   947	
   948				raw_spin_lock(&rt_rq->rt_runtime_lock);
   949				if (rt_rq->rt_bw_throttled)
   950					balance_runtime(rt_rq);
   951				runtime = rt_rq->rt_runtime;
   952				rt_rq->rt_time -= min(rt_rq->rt_time, overrun*runtime);
   953				if (rt_rq->rt_bw_throttled && rt_rq->rt_time < runtime) {
   954					bool tbefore = rt_rq_throttled(rt_rq);
   955					rt_rq->rt_bw_throttled = 0;
   956	
   957					/*
   958					 * If a prior rt_rq throttled status changed to unthrottled,
   959					 * adjust the parent information about throttled child groups.
   960					 */
   961					WARN_ON_ONCE (!tbefore && rt_rq_throttled(rt_rq));
   962					if (tbefore && !rt_rq_throttled(rt_rq)) {
 > 963						if (rt_rq->tg && rt_rq->tg->parent)
   964							parent_rt_se = rt_rq->tg->parent->rt_se[i];
   965						if (parent_rt_se)
   966							adjust_cg_throt_update(parent_rt_se, false);
   967					}
   968	
   969					/*
   970					 * When we're idle and a woken (rt) task is
   971					 * throttled check_preempt_curr() will set
   972					 * skip_update and the time between the wakeup
   973					 * and this unthrottle will get accounted as
   974					 * 'runtime'.
   975					 */
   976					if (rt_rq->rt_nr_running && rq->curr == rq->idle)
   977						rq_clock_cancel_skipupdate(rq);
   978				}
   979				if (rt_rq->rt_time || rt_rq->rt_nr_running)
   980					idle = 0;
   981				raw_spin_unlock(&rt_rq->rt_runtime_lock);
   982			} else if (rt_rq->rt_nr_running) {
   983				idle = 0;
   984			}
   985			if (rt_rq->rt_bw_throttled)
   986				throttled = 1;
   987	
   988			rq_unlock(rq, &rf);
   989		}
   990	
   991		if (!throttled && (!rt_bandwidth_enabled() || rt_b->rt_runtime == RUNTIME_INF))
   992			return 1;
   993	
   994		return idle;
   995	}
   996	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
