Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6BB179;
	Sun,  3 Sep 2023 00:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693700499; x=1725236499;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j9Cwf65/bahYNo5Vsyk9vEN4nmDbDCRA52H9Gz1GaMM=;
  b=oCPfsU1rrniVSHba7kt/V6PBjF2DM4U3VFlY/xUh3HFihVujnsiVX1e2
   0IPaknru2c7Ni7H4yFFeBKfJx3wcZJ5pV6W3VLankVJPR6entU2WnMpCu
   psw4/62OlnNiCTVkzgErPZH50mowovxjA4fkGi7d9QxFr3itX3SHOZeKQ
   UZBL8c4jmK7XBhbsW5tfuO36cISXSTEFKUHDp4N6keKXV8HO9cmXwL4cQ
   fN9bwUh1HWj/bB59CdVjoi6qy6by7VQqNXam1PP+45/chDIw9x3LUCFdM
   jiMq1o/IE1SpGjdkU8iOnE0J+8YYO3BPkdYzaGPr1yP5lxUEjjyEJsqU6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="462776662"
X-IronPort-AV: E=Sophos;i="6.02,223,1688454000"; 
   d="scan'208";a="462776662"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2023 17:21:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="769598810"
X-IronPort-AV: E=Sophos;i="6.02,223,1688454000"; 
   d="scan'208";a="769598810"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 02 Sep 2023 17:21:36 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcaru-0002jL-0D;
	Sun, 03 Sep 2023 00:21:34 +0000
Date: Sun, 3 Sep 2023 08:21:23 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:generalized-misfit-lb-old 11/13]
 kernel/sched/fair.c:8921:65: error: too many arguments to function call,
 expected 3, have 4
Message-ID: <202309030823.xGTnfK1x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux generalized-misfit-lb-old
head:   9a17cf573e09442fd259255332eb0c7ceebf6afe
commit: 3e5bd605fb5afe19c6b7f23eb180bd81cdf7a54b [11/13] sched/fair: Enable EAS in load balance
config: powerpc64-randconfig-r005-20230903 (https://download.01.org/0day-ci/archive/20230903/202309030823.xGTnfK1x-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230903/202309030823.xGTnfK1x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309030823.xGTnfK1x-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/fair.c:56:
   kernel/sched/sched.h:949:1: error: version control conflict marker in file
   <<<<<<< HEAD
   ^
   kernel/sched/sched.h:1151:1: error: version control conflict marker in file
   <<<<<<< HEAD
   ^
   kernel/sched/fair.c:702:6: warning: no previous prototype for function 'update_entity_lag' [-Wmissing-prototypes]
   void update_entity_lag(struct cfs_rq *cfs_rq, struct sched_entity *se)
        ^
   kernel/sched/fair.c:702:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void update_entity_lag(struct cfs_rq *cfs_rq, struct sched_entity *se)
   ^
   static 
   kernel/sched/fair.c:4855:6: error: unknown type name 'misfit_reason_t'
                                    misfit_reason_t *reason)
                                    ^
   kernel/sched/fair.c:4894:16: error: use of undeclared identifier 'DOWNMIGRATION'
                                           *reason = DOWNMIGRATION;
                                                     ^
   kernel/sched/fair.c:4905:13: error: use of undeclared identifier 'UPMIGRATION'
                   *reason = UPMIGRATION;
                             ^
   kernel/sched/fair.c:4912:2: error: use of undeclared identifier 'misfit_reason_t'
           misfit_reason_t reason;
           ^
   kernel/sched/fair.c:4917:30: error: use of undeclared identifier 'reason'
           if (!is_misfit_task(p, rq, &reason)) {
                                       ^
   kernel/sched/fair.c:4919:7: error: no member named 'misfit_reason' in 'struct rq'
                   rq->misfit_reason = -1;
                   ~~  ^
   kernel/sched/fair.c:4928:6: error: no member named 'misfit_reason' in 'struct rq'
           rq->misfit_reason = reason;
           ~~  ^
   kernel/sched/fair.c:4928:22: error: use of undeclared identifier 'reason'
           rq->misfit_reason = reason;
                               ^
>> kernel/sched/fair.c:8921:65: error: too many arguments to function call, expected 3, have 4
                                   int new_cpu = find_energy_efficient_cpu(p, env->src_cpu, 0, true);
                                                 ~~~~~~~~~~~~~~~~~~~~~~~~~                     ^~~~
   kernel/sched/fair.c:7724:12: note: 'find_energy_efficient_cpu' declared here
   static int find_energy_efficient_cpu(struct task_struct *p, int prev_cpu,
              ^
   kernel/sched/fair.c:9238:2: error: unknown type name 'misfit_reason_t'
           misfit_reason_t group_misfit_reason;
           ^
   kernel/sched/fair.c:9719:36: error: no member named 'misfit_reason' in 'struct rq'
                                   sgs->group_misfit_reason = rq->misfit_reason;
                                                              ~~  ^
   kernel/sched/fair.c:9785:35: error: use of undeclared identifier 'UPMIGRATION'
               (sgs->group_misfit_reason == UPMIGRATION) &&
                                            ^
   kernel/sched/fair.c:10000:3: error: use of undeclared identifier 'misfit_reason_t'
                   misfit_reason_t reason;
                   ^
   kernel/sched/fair.c:10021:35: error: use of undeclared identifier 'reason'
                       if (!is_misfit_task(p, rq, &reason)) {
                                                   ^
   kernel/sched/fair.c:10026:31: error: use of undeclared identifier 'reason'
                           sgs->group_misfit_reason = reason;
                                                      ^
   kernel/sched/fair.c:10822:11: error: no member named 'misfit_reason' in 'struct rq'
                       rq->misfit_reason == UPMIGRATION &&
                       ~~  ^
   kernel/sched/fair.c:10822:28: error: use of undeclared identifier 'UPMIGRATION'
                       rq->misfit_reason == UPMIGRATION &&
                                            ^
   kernel/sched/fair.c:12305:6: warning: no previous prototype for function 'task_vruntime_update' [-Wmissing-prototypes]
   void task_vruntime_update(struct rq *rq, struct task_struct *p, bool in_fi)
        ^
   kernel/sched/fair.c:12305:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void task_vruntime_update(struct rq *rq, struct task_struct *p, bool in_fi)
   ^
   static 
   2 warnings and 19 errors generated.


vim +8921 kernel/sched/fair.c

  8818	
  8819	/*
  8820	 * detach_tasks() -- tries to detach up to imbalance load/util/tasks from
  8821	 * busiest_rq, as part of a balancing operation within domain "sd".
  8822	 *
  8823	 * Returns number of detached tasks if successful and 0 otherwise.
  8824	 */
  8825	static int detach_tasks(struct lb_env *env)
  8826	{
  8827		struct list_head *tasks = &env->src_rq->cfs_tasks;
  8828		unsigned long util, load;
  8829		struct task_struct *p;
  8830		int detached = 0;
  8831	
  8832		lockdep_assert_rq_held(env->src_rq);
  8833	
  8834		/*
  8835		 * Source run queue has been emptied by another CPU, clear
  8836		 * LBF_ALL_PINNED flag as we will not test any task.
  8837		 */
  8838		if (env->src_rq->nr_running <= 1) {
  8839			env->flags &= ~LBF_ALL_PINNED;
  8840			return 0;
  8841		}
  8842	
  8843		if (env->imbalance <= 0)
  8844			return 0;
  8845	
  8846		while (!list_empty(tasks)) {
  8847			/*
  8848			 * We don't want to steal all, otherwise we may be treated likewise,
  8849			 * which could at worst lead to a livelock crash.
  8850			 */
  8851			if (env->idle != CPU_NOT_IDLE && env->src_rq->nr_running <= 1)
  8852				break;
  8853	
  8854			env->loop++;
  8855			/*
  8856			 * We've more or less seen every task there is, call it quits
  8857			 * unless we haven't found any movable task yet.
  8858			 */
  8859			if (env->loop > env->loop_max &&
  8860			    !(env->flags & LBF_ALL_PINNED))
  8861				break;
  8862	
  8863			/* take a breather every nr_migrate tasks */
  8864			if (env->loop > env->loop_break) {
  8865				env->loop_break += SCHED_NR_MIGRATE_BREAK;
  8866				env->flags |= LBF_NEED_BREAK;
  8867				break;
  8868			}
  8869	
  8870			p = list_last_entry(tasks, struct task_struct, se.group_node);
  8871	
  8872			if (!can_migrate_task(p, env))
  8873				goto next;
  8874	
  8875			switch (env->migration_type) {
  8876			case migrate_load:
  8877				/*
  8878				 * Depending of the number of CPUs and tasks and the
  8879				 * cgroup hierarchy, task_h_load() can return a null
  8880				 * value. Make sure that env->imbalance decreases
  8881				 * otherwise detach_tasks() will stop only after
  8882				 * detaching up to loop_max tasks.
  8883				 */
  8884				load = max_t(unsigned long, task_h_load(p), 1);
  8885	
  8886				if (sched_feat(LB_MIN) &&
  8887				    load < 16 && !env->sd->nr_balance_failed)
  8888					goto next;
  8889	
  8890				/*
  8891				 * Make sure that we don't migrate too much load.
  8892				 * Nevertheless, let relax the constraint if
  8893				 * scheduler fails to find a good waiting task to
  8894				 * migrate.
  8895				 */
  8896				if (shr_bound(load, env->sd->nr_balance_failed) > env->imbalance)
  8897					goto next;
  8898	
  8899				env->imbalance -= load;
  8900				break;
  8901	
  8902			case migrate_util:
  8903				util = task_util_est(p);
  8904	
  8905				if (util > env->imbalance)
  8906					goto next;
  8907	
  8908				env->imbalance -= util;
  8909				break;
  8910	
  8911			case migrate_task:
  8912				env->imbalance--;
  8913				break;
  8914	
  8915			case migrate_misfit:
  8916				/* This is not a misfit task */
  8917				if (!is_misfit_task(p, cpu_rq(env->src_cpu), NULL))
  8918					goto next;
  8919	
  8920				if (sched_energy_enabled()) {
> 8921					int new_cpu = find_energy_efficient_cpu(p, env->src_cpu, 0, true);
  8922					if (new_cpu != env->dst_cpu)
  8923						goto next;
  8924				}
  8925	
  8926				env->imbalance = 0;
  8927				break;
  8928			}
  8929	
  8930			detach_task(p, env);
  8931			list_add(&p->se.group_node, &env->tasks);
  8932	
  8933			detached++;
  8934	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
