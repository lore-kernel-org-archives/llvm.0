Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5772F26
	for <llvm@lists.linux.dev>; Tue,  8 Feb 2022 17:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644341036; x=1675877036;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Bry3aWD9TRbSoveX9496rnvNRFvlltHLTNzNL37BPLA=;
  b=m7e3YxScDQMqAqPyv9NywXBJDghWvqtU7AvIML/nG1+D6bYgHo6gttQN
   X0G9SKxYUdx4ERxXoULJm2X9ywEGdJr4TIlxdKONATikVmF7phGgz/g01
   qyH+gT9Vx6m2iewfE4ik0xM+ZcTEUEe1q1DtxSG4oJlMLPRWipDDm5eZr
   weEk7AL3qpuPSHv52Es59Th16DxHzSDpjWjvajcfIY5WdFQGUCiqMrYLN
   uEspu7nk/SyJE7/nYMkfWQfQOVCPOzjwHPUO+D5+s3lsrmK6F34GMaiSb
   G6Dngvsydh8N0qnm7MFhSouwntfaLeSh/RWh3zpL5ApLnlQbXtPMH99eU
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="232566709"
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; 
   d="scan'208";a="232566709"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2022 09:23:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; 
   d="scan'208";a="482013260"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 08 Feb 2022 09:23:54 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nHUDZ-0000VK-S2; Tue, 08 Feb 2022 17:23:53 +0000
Date: Wed, 9 Feb 2022 01:23:17 +0800
From: kernel test robot <lkp@intel.com>
To: Huang Ying <ying.huang@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH -V2] NUMA balancing: fix NUMA topology for systems
 with CPU-less nodes
Message-ID: <202202090152.0LoawqhI-lkp@intel.com>
References: <20220208122322.604285-1-ying.huang@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220208122322.604285-1-ying.huang@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Huang,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on tip/sched/core]
[also build test ERROR on linux/master linus/master v5.17-rc3 next-20220208]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Huang-Ying/NUMA-balancing-fix-NUMA-topology-for-systems-with-CPU-less-nodes/20220208-212402
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git c8eaf6ac76f40f6c59fc7d056e2e08c4a57ea9c7
config: hexagon-randconfig-r045-20220208 (https://download.01.org/0day-ci/archive/20220209/202202090152.0LoawqhI-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e8bff9ae54a55b4dbfeb6ba55f723abbd81bf494)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/ed82092e509333870d756fc8e53d816885922fc4
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Huang-Ying/NUMA-balancing-fix-NUMA-topology-for-systems-with-CPU-less-nodes/20220208-212402
        git checkout ed82092e509333870d756fc8e53d816885922fc4
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash kernel/sched/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   kernel/sched/core.c:3454:6: warning: no previous prototype for function 'sched_set_stop_task' [-Wmissing-prototypes]
   void sched_set_stop_task(int cpu, struct task_struct *stop)
        ^
   kernel/sched/core.c:3454:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void sched_set_stop_task(int cpu, struct task_struct *stop)
   ^
   static 
>> kernel/sched/core.c:9055:3: error: implicit declaration of function 'sched_reinit_numa' [-Werror,-Wimplicit-function-declaration]
                   sched_reinit_numa(true, cpu);
                   ^
   kernel/sched/core.c:9055:3: note: did you mean 'sched_init_numa'?
   kernel/sched/sched.h:1671:20: note: 'sched_init_numa' declared here
   static inline void sched_init_numa(void) { }
                      ^
   kernel/sched/core.c:9134:2: error: implicit declaration of function 'sched_reinit_numa' [-Werror,-Wimplicit-function-declaration]
           sched_reinit_numa(false, cpu);
           ^
>> kernel/sched/core.c:9241:18: error: too many arguments to function call, expected 0, have 1
           sched_init_numa(NUMA_NO_NODE);
           ~~~~~~~~~~~~~~~ ^~~~~~~~~~~~
   include/linux/numa.h:14:22: note: expanded from macro 'NUMA_NO_NODE'
   #define NUMA_NO_NODE    (-1)
                           ^~~~
   kernel/sched/sched.h:1671:20: note: 'sched_init_numa' declared here
   static inline void sched_init_numa(void) { }
                      ^
   1 warning and 3 errors generated.


vim +/sched_reinit_numa +9055 kernel/sched/core.c

  9033	
  9034	int sched_cpu_activate(unsigned int cpu)
  9035	{
  9036		struct rq *rq = cpu_rq(cpu);
  9037		struct rq_flags rf;
  9038	
  9039		/*
  9040		 * Clear the balance_push callback and prepare to schedule
  9041		 * regular tasks.
  9042		 */
  9043		balance_push_set(cpu, false);
  9044	
  9045	#ifdef CONFIG_SCHED_SMT
  9046		/*
  9047		 * When going up, increment the number of cores with SMT present.
  9048		 */
  9049		if (cpumask_weight(cpu_smt_mask(cpu)) == 2)
  9050			static_branch_inc_cpuslocked(&sched_smt_present);
  9051	#endif
  9052		set_cpu_active(cpu, true);
  9053	
  9054		if (sched_smp_initialized) {
> 9055			sched_reinit_numa(true, cpu);
  9056			sched_domains_numa_masks_set(cpu);
  9057			cpuset_cpu_active();
  9058		}
  9059	
  9060		/*
  9061		 * Put the rq online, if not already. This happens:
  9062		 *
  9063		 * 1) In the early boot process, because we build the real domains
  9064		 *    after all CPUs have been brought up.
  9065		 *
  9066		 * 2) At runtime, if cpuset_cpu_active() fails to rebuild the
  9067		 *    domains.
  9068		 */
  9069		rq_lock_irqsave(rq, &rf);
  9070		if (rq->rd) {
  9071			BUG_ON(!cpumask_test_cpu(cpu, rq->rd->span));
  9072			set_rq_online(rq);
  9073		}
  9074		rq_unlock_irqrestore(rq, &rf);
  9075	
  9076		return 0;
  9077	}
  9078	
  9079	int sched_cpu_deactivate(unsigned int cpu)
  9080	{
  9081		struct rq *rq = cpu_rq(cpu);
  9082		struct rq_flags rf;
  9083		int ret;
  9084	
  9085		/*
  9086		 * Remove CPU from nohz.idle_cpus_mask to prevent participating in
  9087		 * load balancing when not active
  9088		 */
  9089		nohz_balance_exit_idle(rq);
  9090	
  9091		set_cpu_active(cpu, false);
  9092	
  9093		/*
  9094		 * From this point forward, this CPU will refuse to run any task that
  9095		 * is not: migrate_disable() or KTHREAD_IS_PER_CPU, and will actively
  9096		 * push those tasks away until this gets cleared, see
  9097		 * sched_cpu_dying().
  9098		 */
  9099		balance_push_set(cpu, true);
  9100	
  9101		/*
  9102		 * We've cleared cpu_active_mask / set balance_push, wait for all
  9103		 * preempt-disabled and RCU users of this state to go away such that
  9104		 * all new such users will observe it.
  9105		 *
  9106		 * Specifically, we rely on ttwu to no longer target this CPU, see
  9107		 * ttwu_queue_cond() and is_cpu_allowed().
  9108		 *
  9109		 * Do sync before park smpboot threads to take care the rcu boost case.
  9110		 */
  9111		synchronize_rcu();
  9112	
  9113		rq_lock_irqsave(rq, &rf);
  9114		if (rq->rd) {
  9115			update_rq_clock(rq);
  9116			BUG_ON(!cpumask_test_cpu(cpu, rq->rd->span));
  9117			set_rq_offline(rq);
  9118		}
  9119		rq_unlock_irqrestore(rq, &rf);
  9120	
  9121	#ifdef CONFIG_SCHED_SMT
  9122		/*
  9123		 * When going down, decrement the number of cores with SMT present.
  9124		 */
  9125		if (cpumask_weight(cpu_smt_mask(cpu)) == 2)
  9126			static_branch_dec_cpuslocked(&sched_smt_present);
  9127	
  9128		sched_core_cpu_deactivate(cpu);
  9129	#endif
  9130	
  9131		if (!sched_smp_initialized)
  9132			return 0;
  9133	
  9134		sched_reinit_numa(false, cpu);
  9135		ret = cpuset_cpu_inactive(cpu);
  9136		if (ret) {
  9137			balance_push_set(cpu, false);
  9138			set_cpu_active(cpu, true);
  9139			return ret;
  9140		}
  9141		sched_domains_numa_masks_clear(cpu);
  9142		return 0;
  9143	}
  9144	
  9145	static void sched_rq_cpu_starting(unsigned int cpu)
  9146	{
  9147		struct rq *rq = cpu_rq(cpu);
  9148	
  9149		rq->calc_load_update = calc_load_update;
  9150		update_max_interval();
  9151	}
  9152	
  9153	int sched_cpu_starting(unsigned int cpu)
  9154	{
  9155		sched_core_cpu_starting(cpu);
  9156		sched_rq_cpu_starting(cpu);
  9157		sched_tick_start(cpu);
  9158		return 0;
  9159	}
  9160	
  9161	#ifdef CONFIG_HOTPLUG_CPU
  9162	
  9163	/*
  9164	 * Invoked immediately before the stopper thread is invoked to bring the
  9165	 * CPU down completely. At this point all per CPU kthreads except the
  9166	 * hotplug thread (current) and the stopper thread (inactive) have been
  9167	 * either parked or have been unbound from the outgoing CPU. Ensure that
  9168	 * any of those which might be on the way out are gone.
  9169	 *
  9170	 * If after this point a bound task is being woken on this CPU then the
  9171	 * responsible hotplug callback has failed to do it's job.
  9172	 * sched_cpu_dying() will catch it with the appropriate fireworks.
  9173	 */
  9174	int sched_cpu_wait_empty(unsigned int cpu)
  9175	{
  9176		balance_hotplug_wait();
  9177		return 0;
  9178	}
  9179	
  9180	/*
  9181	 * Since this CPU is going 'away' for a while, fold any nr_active delta we
  9182	 * might have. Called from the CPU stopper task after ensuring that the
  9183	 * stopper is the last running task on the CPU, so nr_active count is
  9184	 * stable. We need to take the teardown thread which is calling this into
  9185	 * account, so we hand in adjust = 1 to the load calculation.
  9186	 *
  9187	 * Also see the comment "Global load-average calculations".
  9188	 */
  9189	static void calc_load_migrate(struct rq *rq)
  9190	{
  9191		long delta = calc_load_fold_active(rq, 1);
  9192	
  9193		if (delta)
  9194			atomic_long_add(delta, &calc_load_tasks);
  9195	}
  9196	
  9197	static void dump_rq_tasks(struct rq *rq, const char *loglvl)
  9198	{
  9199		struct task_struct *g, *p;
  9200		int cpu = cpu_of(rq);
  9201	
  9202		lockdep_assert_rq_held(rq);
  9203	
  9204		printk("%sCPU%d enqueued tasks (%u total):\n", loglvl, cpu, rq->nr_running);
  9205		for_each_process_thread(g, p) {
  9206			if (task_cpu(p) != cpu)
  9207				continue;
  9208	
  9209			if (!task_on_rq_queued(p))
  9210				continue;
  9211	
  9212			printk("%s\tpid: %d, name: %s\n", loglvl, p->pid, p->comm);
  9213		}
  9214	}
  9215	
  9216	int sched_cpu_dying(unsigned int cpu)
  9217	{
  9218		struct rq *rq = cpu_rq(cpu);
  9219		struct rq_flags rf;
  9220	
  9221		/* Handle pending wakeups and then migrate everything off */
  9222		sched_tick_stop(cpu);
  9223	
  9224		rq_lock_irqsave(rq, &rf);
  9225		if (rq->nr_running != 1 || rq_has_pinned_tasks(rq)) {
  9226			WARN(true, "Dying CPU not properly vacated!");
  9227			dump_rq_tasks(rq, KERN_WARNING);
  9228		}
  9229		rq_unlock_irqrestore(rq, &rf);
  9230	
  9231		calc_load_migrate(rq);
  9232		update_max_interval();
  9233		hrtick_clear(rq);
  9234		sched_core_cpu_dying(cpu);
  9235		return 0;
  9236	}
  9237	#endif
  9238	
  9239	void __init sched_init_smp(void)
  9240	{
> 9241		sched_init_numa(NUMA_NO_NODE);
  9242	
  9243		/*
  9244		 * There's no userspace yet to cause hotplug operations; hence all the
  9245		 * CPU masks are stable and all blatant races in the below code cannot
  9246		 * happen.
  9247		 */
  9248		mutex_lock(&sched_domains_mutex);
  9249		sched_init_domains(cpu_active_mask);
  9250		mutex_unlock(&sched_domains_mutex);
  9251	
  9252		/* Move init over to a non-isolated CPU */
  9253		if (set_cpus_allowed_ptr(current, housekeeping_cpumask(HK_FLAG_DOMAIN)) < 0)
  9254			BUG();
  9255		current->flags &= ~PF_NO_SETAFFINITY;
  9256		sched_init_granularity();
  9257	
  9258		init_sched_rt_class();
  9259		init_sched_dl_class();
  9260	
  9261		sched_smp_initialized = true;
  9262	}
  9263	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
