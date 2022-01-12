Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3B1168
	for <llvm@lists.linux.dev>; Wed, 12 Jan 2022 19:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642016711; x=1673552711;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6Nr856CzweZgLjYOyN6xqJlDm0/JwT6zQu0ziqtwM1I=;
  b=RgfiTp1ELZvqXzCtkQqq73tZwPqhcyjiuC76uhHFUQ5GiPWKPCUHcixs
   /qvhqSgWNBQyQK0vYSDa1e4JcEyM0nHopuzWbE16BaX3IQZ5KdhPT47tL
   vsxXVGRekdSvlwCMc5wjNc6CQIr21HxFSMMByOy8rm9Af/bPa/91YcARS
   fLOA84qaNcXMQS4m4c3veUNJw/ZDKZANOIWY6PrARVajhLtU4sj6qGAGr
   BkJuG76j5gzpmzbNYPDKMV+1xF2LjO8j0gh8vNJ0a5hF22H0DpuccBgFq
   hf5PqHb2wWDatpgk6bRIYs5o0K7vla2M/9C0rhyX6/L4O0UzVmO91pZy0
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="307188552"
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; 
   d="scan'208";a="307188552"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2022 11:45:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; 
   d="scan'208";a="475037708"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 12 Jan 2022 11:45:10 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n7jYT-0006JR-IE; Wed, 12 Jan 2022 19:45:09 +0000
Date: Thu, 13 Jan 2022 03:44:36 +0800
From: kernel test robot <lkp@intel.com>
To: Vincent Donnefort <vincent.donnefort@arm.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v2 6/7] sched/fair: Remove task_util from effective
 utilization in feec()
Message-ID: <202201130354.S8Z1unuB-lkp@intel.com>
References: <20220112161230.836326-7-vincent.donnefort@arm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220112161230.836326-7-vincent.donnefort@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Vincent,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tip/sched/core]
[also build test WARNING on next-20220112]
[cannot apply to rafael-pm/linux-next rafael-pm/thermal v5.16]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Vincent-Donnefort/feec-energy-margin-removal/20220113-002104
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git 82762d2af31a60081162890983a83499c9c7dd74
config: hexagon-randconfig-r045-20220112 (https://download.01.org/0day-ci/archive/20220113/202201130354.S8Z1unuB-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 244dd2913a43a200f5a6544d424cdc37b771028b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/ce70047d014b32af0102fca5681c1e8aebc4b7ae
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Vincent-Donnefort/feec-energy-margin-removal/20220113-002104
        git checkout ce70047d014b32af0102fca5681c1e8aebc4b7ae
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash kernel/sched/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/sched/fair.c:6738:4: warning: variable 'pd_cap' is uninitialized when used here [-Wuninitialized]
                           pd_cap += cpu_thermal_cap;
                           ^~~~~~
   kernel/sched/fair.c:6693:58: note: initialize the variable 'pd_cap' to silence this warning
           unsigned long busy_time, tsk_busy_time, max_util, pd_cap;
                                                                   ^
                                                                    = 0
   1 warning generated.


vim +/pd_cap +6738 kernel/sched/fair.c

  6649	
  6650	/*
  6651	 * find_energy_efficient_cpu(): Find most energy-efficient target CPU for the
  6652	 * waking task. find_energy_efficient_cpu() looks for the CPU with maximum
  6653	 * spare capacity in each performance domain and uses it as a potential
  6654	 * candidate to execute the task. Then, it uses the Energy Model to figure
  6655	 * out which of the CPU candidates is the most energy-efficient.
  6656	 *
  6657	 * The rationale for this heuristic is as follows. In a performance domain,
  6658	 * all the most energy efficient CPU candidates (according to the Energy
  6659	 * Model) are those for which we'll request a low frequency. When there are
  6660	 * several CPUs for which the frequency request will be the same, we don't
  6661	 * have enough data to break the tie between them, because the Energy Model
  6662	 * only includes active power costs. With this model, if we assume that
  6663	 * frequency requests follow utilization (e.g. using schedutil), the CPU with
  6664	 * the maximum spare capacity in a performance domain is guaranteed to be among
  6665	 * the best candidates of the performance domain.
  6666	 *
  6667	 * In practice, it could be preferable from an energy standpoint to pack
  6668	 * small tasks on a CPU in order to let other CPUs go in deeper idle states,
  6669	 * but that could also hurt our chances to go cluster idle, and we have no
  6670	 * ways to tell with the current Energy Model if this is actually a good
  6671	 * idea or not. So, find_energy_efficient_cpu() basically favors
  6672	 * cluster-packing, and spreading inside a cluster. That should at least be
  6673	 * a good thing for latency, and this is consistent with the idea that most
  6674	 * of the energy savings of EAS come from the asymmetry of the system, and
  6675	 * not so much from breaking the tie between identical CPUs. That's also the
  6676	 * reason why EAS is enabled in the topology code only for systems where
  6677	 * SD_ASYM_CPUCAPACITY is set.
  6678	 *
  6679	 * NOTE: Forkees are not accepted in the energy-aware wake-up path because
  6680	 * they don't have any useful utilization data yet and it's not possible to
  6681	 * forecast their impact on energy consumption. Consequently, they will be
  6682	 * placed by find_idlest_cpu() on the least loaded CPU, which might turn out
  6683	 * to be energy-inefficient in some use-cases. The alternative would be to
  6684	 * bias new tasks towards specific types of CPUs first, or to try to infer
  6685	 * their util_avg from the parent task, but those heuristics could hurt
  6686	 * other use-cases too. So, until someone finds a better way to solve this,
  6687	 * let's keep things simple by re-using the existing slow path.
  6688	 */
  6689	static int find_energy_efficient_cpu(struct task_struct *p, int prev_cpu)
  6690	{
  6691		struct cpumask *cpus = this_cpu_cpumask_var_ptr(select_rq_mask);
  6692		unsigned long prev_delta = ULONG_MAX, best_delta = ULONG_MAX;
  6693		unsigned long busy_time, tsk_busy_time, max_util, pd_cap;
  6694		struct root_domain *rd = cpu_rq(smp_processor_id())->rd;
  6695		int cpu, best_energy_cpu = prev_cpu, target = -1;
  6696		unsigned long cpu_cap, cpu_thermal_cap, util;
  6697		unsigned long base_energy = 0;
  6698		struct sched_domain *sd;
  6699		struct perf_domain *pd;
  6700	
  6701		rcu_read_lock();
  6702		pd = rcu_dereference(rd->pd);
  6703		if (!pd || READ_ONCE(rd->overutilized))
  6704			goto unlock;
  6705	
  6706		/*
  6707		 * Energy-aware wake-up happens on the lowest sched_domain starting
  6708		 * from sd_asym_cpucapacity spanning over this_cpu and prev_cpu.
  6709		 */
  6710		sd = rcu_dereference(*this_cpu_ptr(&sd_asym_cpucapacity));
  6711		while (sd && !cpumask_test_cpu(prev_cpu, sched_domain_span(sd)))
  6712			sd = sd->parent;
  6713		if (!sd)
  6714			goto unlock;
  6715	
  6716		target = prev_cpu;
  6717	
  6718		sync_entity_load_avg(&p->se);
  6719		if (!task_util_est(p))
  6720			goto unlock;
  6721	
  6722		tsk_busy_time = get_task_busy_time(p, prev_cpu);
  6723	
  6724		for (; pd; pd = pd->next) {
  6725			unsigned long cur_delta, spare_cap, max_spare_cap = 0;
  6726			bool compute_prev_delta = false;
  6727			unsigned long base_energy_pd;
  6728			int max_spare_cap_cpu = -1;
  6729	
  6730			cpumask_and(cpus, perf_domain_span(pd), cpu_online_mask);
  6731	
  6732			/* Account thermal pressure for the energy estimation */
  6733			cpu = cpumask_first(cpus);
  6734			cpu_thermal_cap = arch_scale_cpu_capacity(cpu);
  6735			cpu_thermal_cap -= arch_scale_thermal_pressure(cpu);
  6736	
  6737			for_each_cpu(cpu, cpus) {
> 6738				pd_cap += cpu_thermal_cap;
  6739	
  6740				if (!cpumask_test_cpu(cpu, sched_domain_span(sd)))
  6741					continue;
  6742	
  6743				if (!cpumask_test_cpu(cpu, p->cpus_ptr))
  6744					continue;
  6745	
  6746				util = cpu_util_next(cpu, p, cpu);
  6747				cpu_cap = capacity_of(cpu);
  6748				spare_cap = cpu_cap;
  6749				lsub_positive(&spare_cap, util);
  6750	
  6751				/*
  6752				 * Skip CPUs that cannot satisfy the capacity request.
  6753				 * IOW, placing the task there would make the CPU
  6754				 * overutilized. Take uclamp into account to see how
  6755				 * much capacity we can get out of the CPU; this is
  6756				 * aligned with sched_cpu_util().
  6757				 */
  6758				util = uclamp_rq_util_with(cpu_rq(cpu), util, p);
  6759				if (!fits_capacity(util, cpu_cap))
  6760					continue;
  6761	
  6762				if (cpu == prev_cpu) {
  6763					/* Always use prev_cpu as a candidate. */
  6764					compute_prev_delta = true;
  6765				} else if (spare_cap > max_spare_cap) {
  6766					/*
  6767					 * Find the CPU with the maximum spare capacity
  6768					 * in the performance domain.
  6769					 */
  6770					max_spare_cap = spare_cap;
  6771					max_spare_cap_cpu = cpu;
  6772				}
  6773			}
  6774	
  6775			if (max_spare_cap_cpu < 0 && !compute_prev_delta)
  6776				continue;
  6777	
  6778			/* Compute the 'base' energy of the pd, without @p */
  6779			busy_time = get_pd_busy_time(p, cpus, pd_cap);
  6780			max_util = get_pd_max_util(p, -1, cpus, cpu_thermal_cap);
  6781			base_energy_pd = compute_energy(pd, max_util, busy_time,
  6782							cpu_thermal_cap);
  6783			base_energy += base_energy_pd;
  6784	
  6785			/* Take task into account for the next energy computations */
  6786			busy_time = min(pd_cap, busy_time + tsk_busy_time);
  6787	
  6788			/* Evaluate the energy impact of using prev_cpu. */
  6789			if (compute_prev_delta) {
  6790				max_util = get_pd_max_util(p, prev_cpu, cpus,
  6791							   cpu_thermal_cap);
  6792				prev_delta = compute_energy(pd, max_util, busy_time,
  6793							    cpu_thermal_cap);
  6794				if (prev_delta < base_energy_pd)
  6795					goto unlock;
  6796				prev_delta -= base_energy_pd;
  6797				best_delta = min(best_delta, prev_delta);
  6798			}
  6799	
  6800			/* Evaluate the energy impact of using max_spare_cap_cpu. */
  6801			if (max_spare_cap_cpu >= 0) {
  6802				max_util = get_pd_max_util(p, max_spare_cap_cpu, cpus,
  6803							   cpu_thermal_cap);
  6804				cur_delta = compute_energy(pd, max_util, busy_time,
  6805							   cpu_thermal_cap);
  6806				if (cur_delta < base_energy_pd)
  6807					goto unlock;
  6808				cur_delta -= base_energy_pd;
  6809				if (cur_delta < best_delta) {
  6810					best_delta = cur_delta;
  6811					best_energy_cpu = max_spare_cap_cpu;
  6812				}
  6813			}
  6814		}
  6815		rcu_read_unlock();
  6816	
  6817		/*
  6818		 * Pick the best CPU if prev_cpu cannot be used, or if it saves at
  6819		 * least 6% of the energy used by prev_cpu.
  6820		 */
  6821		if ((prev_delta == ULONG_MAX) ||
  6822		    (prev_delta - best_delta) > ((prev_delta + base_energy) >> 4))
  6823			target = best_energy_cpu;
  6824	
  6825		return target;
  6826	
  6827	unlock:
  6828		rcu_read_unlock();
  6829	
  6830		return target;
  6831	}
  6832	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
