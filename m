Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BE2182;
	Sun, 29 Jan 2023 18:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675017022; x=1706553022;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J/edoHyyrnNXO4lt2VGl45UhgRZ+2VH1J8JkDJN/KY4=;
  b=FjYHZo5Zoa1QTObjeSrrI/Dov0JGBbWDLcrzruUYffRvNGi6VMwtWSoL
   s7R5tz4WTlP2z0GlDbWvyzoYwqlh/Ea3iLxz7wb/fJQVRe6qiz5DFtceE
   dUKoqf1Ddfibjf1AbX9XEci4L4ZhvJGFrKgUBH/UK4I2uRQydZ3wDTvqa
   AbUQ1z+q+TVABbF3r4g82DoYZiYYfEghv8aYqacr9oUulZUFgEpf218O1
   RP0D6fqM05j5AubKYCNSSh9gN2Pg9hhXRFsODgfx/D5g6ndpma6vqop1Z
   QpmLM7p0TwbB9SQB0TuMYoDcWvbR1KDfSpOwnjHWgSAPK8UDRUpYmVIHS
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="413641315"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="413641315"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2023 10:30:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="727262454"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="727262454"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 29 Jan 2023 10:30:20 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMCRX-000313-1p;
	Sun, 29 Jan 2023 18:30:19 +0000
Date: Mon, 30 Jan 2023 02:29:25 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:uclamp-spare-capacity-fixes 4/6]
 kernel/sched/fair.c:7460:28: warning: '&&' within '||'
Message-ID: <202301300236.utI2BPtE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux uclamp-spare-capacity-fixes
head:   a3ceff1a59cb681052ff29d3e21c89ec8927d620
commit: eb7cae7d9708a8bd005b137d0a6b3532e286686b [4/6] sched/uclamp: Set max_spare_cap_cpu even if max_spare_cap is 0
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230130/202301300236.utI2BPtE-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/qais-yousef/linux/commit/eb7cae7d9708a8bd005b137d0a6b3532e286686b
        git remote add qais-yousef https://github.com/qais-yousef/linux
        git fetch --no-tags qais-yousef uclamp-spare-capacity-fixes
        git checkout eb7cae7d9708a8bd005b137d0a6b3532e286686b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/sched/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   kernel/sched/fair.c:7461:59: error: expected ')'
                                      (cpu_cap > max_spare_cap || max_spare_cap == -1UL) {
                                                                                         ^
   kernel/sched/fair.c:7460:8: note: to match this '('
                                      ((fits == max_fits) &&
                                      ^
>> kernel/sched/fair.c:7460:28: warning: '&&' within '||' [-Wlogical-op-parentheses]
                                      ((fits == max_fits) &&
                                       ~~~~~~~~~~~~~~~~~~~^~
   kernel/sched/fair.c:7460:28: note: place parentheses around the '&&' expression to silence this warning
                                      ((fits == max_fits) &&
                                                          ^
                                       (
   kernel/sched/fair.c:7471:3: error: expected ')'
                   }
                   ^
   kernel/sched/fair.c:7459:14: note: to match this '('
                           } else if ((fits > max_fits) ||
                                     ^
   kernel/sched/fair.c:7471:3: error: expected statement
                   }
                   ^
   1 warning and 3 errors generated.


vim +7460 kernel/sched/fair.c

  7312	
  7313	/*
  7314	 * find_energy_efficient_cpu(): Find most energy-efficient target CPU for the
  7315	 * waking task. find_energy_efficient_cpu() looks for the CPU with maximum
  7316	 * spare capacity in each performance domain and uses it as a potential
  7317	 * candidate to execute the task. Then, it uses the Energy Model to figure
  7318	 * out which of the CPU candidates is the most energy-efficient.
  7319	 *
  7320	 * The rationale for this heuristic is as follows. In a performance domain,
  7321	 * all the most energy efficient CPU candidates (according to the Energy
  7322	 * Model) are those for which we'll request a low frequency. When there are
  7323	 * several CPUs for which the frequency request will be the same, we don't
  7324	 * have enough data to break the tie between them, because the Energy Model
  7325	 * only includes active power costs. With this model, if we assume that
  7326	 * frequency requests follow utilization (e.g. using schedutil), the CPU with
  7327	 * the maximum spare capacity in a performance domain is guaranteed to be among
  7328	 * the best candidates of the performance domain.
  7329	 *
  7330	 * In practice, it could be preferable from an energy standpoint to pack
  7331	 * small tasks on a CPU in order to let other CPUs go in deeper idle states,
  7332	 * but that could also hurt our chances to go cluster idle, and we have no
  7333	 * ways to tell with the current Energy Model if this is actually a good
  7334	 * idea or not. So, find_energy_efficient_cpu() basically favors
  7335	 * cluster-packing, and spreading inside a cluster. That should at least be
  7336	 * a good thing for latency, and this is consistent with the idea that most
  7337	 * of the energy savings of EAS come from the asymmetry of the system, and
  7338	 * not so much from breaking the tie between identical CPUs. That's also the
  7339	 * reason why EAS is enabled in the topology code only for systems where
  7340	 * SD_ASYM_CPUCAPACITY is set.
  7341	 *
  7342	 * NOTE: Forkees are not accepted in the energy-aware wake-up path because
  7343	 * they don't have any useful utilization data yet and it's not possible to
  7344	 * forecast their impact on energy consumption. Consequently, they will be
  7345	 * placed by find_idlest_cpu() on the least loaded CPU, which might turn out
  7346	 * to be energy-inefficient in some use-cases. The alternative would be to
  7347	 * bias new tasks towards specific types of CPUs first, or to try to infer
  7348	 * their util_avg from the parent task, but those heuristics could hurt
  7349	 * other use-cases too. So, until someone finds a better way to solve this,
  7350	 * let's keep things simple by re-using the existing slow path.
  7351	 */
  7352	static int find_energy_efficient_cpu(struct task_struct *p, int prev_cpu)
  7353	{
  7354		struct cpumask *cpus = this_cpu_cpumask_var_ptr(select_rq_mask);
  7355		unsigned long prev_delta = ULONG_MAX, best_delta = ULONG_MAX;
  7356		unsigned long p_util_min = uclamp_is_used() ? uclamp_eff_value(p, UCLAMP_MIN) : 0;
  7357		unsigned long p_util_max = uclamp_is_used() ? uclamp_eff_value(p, UCLAMP_MAX) : 1024;
  7358		struct root_domain *rd = this_rq()->rd;
  7359		int cpu, best_energy_cpu, target = -1;
  7360		int prev_fits = -1, best_fits = -1;
  7361		unsigned long best_thermal_cap = 0;
  7362		unsigned long prev_thermal_cap = 0;
  7363		struct sched_domain *sd;
  7364		struct perf_domain *pd;
  7365		struct energy_env eenv;
  7366	
  7367		rcu_read_lock();
  7368		pd = rcu_dereference(rd->pd);
  7369		if (!pd || READ_ONCE(rd->overutilized))
  7370			goto unlock;
  7371	
  7372		/*
  7373		 * Energy-aware wake-up happens on the lowest sched_domain starting
  7374		 * from sd_asym_cpucapacity spanning over this_cpu and prev_cpu.
  7375		 */
  7376		sd = rcu_dereference(*this_cpu_ptr(&sd_asym_cpucapacity));
  7377		while (sd && !cpumask_test_cpu(prev_cpu, sched_domain_span(sd)))
  7378			sd = sd->parent;
  7379		if (!sd)
  7380			goto unlock;
  7381	
  7382		target = prev_cpu;
  7383	
  7384		sync_entity_load_avg(&p->se);
  7385		if (!uclamp_task_util(p, p_util_min, p_util_max))
  7386			goto unlock;
  7387	
  7388		eenv_task_busy_time(&eenv, p, prev_cpu);
  7389	
  7390		for (; pd; pd = pd->next) {
  7391			unsigned long util_min = p_util_min, util_max = p_util_max;
  7392			unsigned long cpu_cap, cpu_thermal_cap, util;
  7393			unsigned long cur_delta, max_spare_cap = -1UL;
  7394			unsigned long rq_util_min, rq_util_max;
  7395			unsigned long prev_spare_cap = -1UL;
  7396			int max_spare_cap_cpu = -1;
  7397			unsigned long base_energy;
  7398			int fits, max_fits = -1;
  7399	
  7400			cpumask_and(cpus, perf_domain_span(pd), cpu_online_mask);
  7401	
  7402			if (cpumask_empty(cpus))
  7403				continue;
  7404	
  7405			/* Account thermal pressure for the energy estimation */
  7406			cpu = cpumask_first(cpus);
  7407			cpu_thermal_cap = arch_scale_cpu_capacity(cpu);
  7408			cpu_thermal_cap -= arch_scale_thermal_pressure(cpu);
  7409	
  7410			eenv.cpu_cap = cpu_thermal_cap;
  7411			eenv.pd_cap = 0;
  7412	
  7413			for_each_cpu(cpu, cpus) {
  7414				eenv.pd_cap += cpu_thermal_cap;
  7415	
  7416				if (!cpumask_test_cpu(cpu, sched_domain_span(sd)))
  7417					continue;
  7418	
  7419				if (!cpumask_test_cpu(cpu, p->cpus_ptr))
  7420					continue;
  7421	
  7422				util = cpu_util_next(cpu, p, cpu);
  7423				cpu_cap = capacity_of(cpu);
  7424	
  7425				/*
  7426				 * Skip CPUs that cannot satisfy the capacity request.
  7427				 * IOW, placing the task there would make the CPU
  7428				 * overutilized. Take uclamp into account to see how
  7429				 * much capacity we can get out of the CPU; this is
  7430				 * aligned with sched_cpu_util().
  7431				 */
  7432				if (uclamp_is_used()) {
  7433					if (!uclamp_rq_is_idle(cpu_rq(cpu))) {
  7434						/*
  7435						 * Open code uclamp_rq_util_with() except for
  7436						 * the clamp() part. Ie: apply max aggregation
  7437						 * only. util_fits_cpu() logic requires to
  7438						 * operate on non clamped util but must use the
  7439						 * max-aggregated uclamp_{min, max}.
  7440						 */
  7441						rq_util_min = uclamp_rq_get(cpu_rq(cpu), UCLAMP_MIN);
  7442						rq_util_max = uclamp_rq_get(cpu_rq(cpu), UCLAMP_MAX);
  7443	
  7444						util_min = max(rq_util_min, p_util_min);
  7445						util_max = max(rq_util_max, p_util_max);
  7446					}
  7447				}
  7448	
  7449				fits = util_fits_cpu(util, util_min, util_max, cpu);
  7450				if (!fits)
  7451					continue;
  7452	
  7453				lsub_positive(&cpu_cap, util);
  7454	
  7455				if (cpu == prev_cpu) {
  7456					/* Always use prev_cpu as a candidate. */
  7457					prev_spare_cap = cpu_cap;
  7458					prev_fits = fits;
  7459				} else if ((fits > max_fits) ||
> 7460					   ((fits == max_fits) &&
  7461					   (cpu_cap > max_spare_cap || max_spare_cap == -1UL) {
  7462					/*
  7463					 * Find the CPU with the maximum spare capacity
  7464					 * among the remaining CPUs in the performance
  7465					 * domain.
  7466					 */
  7467					max_spare_cap = cpu_cap;
  7468					max_spare_cap_cpu = cpu;
  7469					max_fits = fits;
  7470				}
  7471			}
  7472	
  7473			if (max_spare_cap_cpu < 0 && prev_spare_cap == -1UL)
  7474				continue;
  7475	
  7476			eenv_pd_busy_time(&eenv, cpus, p);
  7477			/* Compute the 'base' energy of the pd, without @p */
  7478			base_energy = compute_energy(&eenv, pd, cpus, p, -1);
  7479	
  7480			/* Evaluate the energy impact of using prev_cpu. */
  7481			if (prev_spare_cap != -1UL) {
  7482				prev_delta = compute_energy(&eenv, pd, cpus, p,
  7483							    prev_cpu);
  7484				/* CPU utilization has changed */
  7485				if (prev_delta < base_energy)
  7486					goto unlock;
  7487				prev_delta -= base_energy;
  7488				prev_thermal_cap = cpu_thermal_cap;
  7489				best_delta = min(best_delta, prev_delta);
  7490			}
  7491	
  7492			/* Evaluate the energy impact of using max_spare_cap_cpu. */
  7493			if (max_spare_cap_cpu >= 0 &&
  7494			    (max_spare_cap > prev_spare_cap || prev_spare_cap == -1UL)) {
  7495				/* Current best energy cpu fits better */
  7496				if (max_fits < best_fits)
  7497					continue;
  7498	
  7499				/*
  7500				 * Both don't fit performance hint (i.e. uclamp_min)
  7501				 * but best energy cpu has better capacity.
  7502				 */
  7503				if ((max_fits < 0) &&
  7504				    (cpu_thermal_cap <= best_thermal_cap))
  7505					continue;
  7506	
  7507				cur_delta = compute_energy(&eenv, pd, cpus, p,
  7508							   max_spare_cap_cpu);
  7509				/* CPU utilization has changed */
  7510				if (cur_delta < base_energy)
  7511					goto unlock;
  7512				cur_delta -= base_energy;
  7513	
  7514				/*
  7515				 * Both fit for the task but best energy cpu has lower
  7516				 * energy impact.
  7517				 */
  7518				if ((max_fits > 0) && (best_fits > 0) &&
  7519				    (cur_delta >= best_delta))
  7520					continue;
  7521	
  7522				best_delta = cur_delta;
  7523				best_energy_cpu = max_spare_cap_cpu;
  7524				best_fits = max_fits;
  7525				best_thermal_cap = cpu_thermal_cap;
  7526			}
  7527		}
  7528		rcu_read_unlock();
  7529	
  7530		if ((best_fits > prev_fits) ||
  7531		    ((best_fits > 0) && (best_delta < prev_delta)) ||
  7532		    ((best_fits < 0) && (best_thermal_cap > prev_thermal_cap)))
  7533			target = best_energy_cpu;
  7534	
  7535		return target;
  7536	
  7537	unlock:
  7538		rcu_read_unlock();
  7539	
  7540		return target;
  7541	}
  7542	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
