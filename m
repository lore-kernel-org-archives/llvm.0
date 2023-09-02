Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FFF17D5;
	Sat,  2 Sep 2023 03:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693624208; x=1725160208;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RQYMw3C5Ao+7QRxm40nkIsp0UEDewAvQ/88diMLzTus=;
  b=R/d9YsD5kF4rJDoUUp+lR101YUTZ1KNG9TMJts1e0RuyltuVVsIOWJHn
   ZWWHUb86rgx/7c0DgwD1ELZWm0UwpUy5GvSkbha1Uv7FiTSEBi2H5g3Ax
   VQueKUVNoMmkb9qyejkf9AGhrcQzNtqA4ESbmi3XccEO1CQ1nIQmr1p55
   y1BvELtzi1gNpwJCKhJyvhMTRQ5PVKSLpQxnT+z4tRnerqAtUCJDW0JBQ
   sGE6Db/REz70NOLxNhwptBOwIhpaCc7pppG0YllqCJM+t02ZKsqn52nVJ
   gU83PLsbHzS4I6qvRrgbTkR/jZKuImho4exAW1P/gO1wyyaGza1G7LEe8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="380133235"
X-IronPort-AV: E=Sophos;i="6.02,221,1688454000"; 
   d="scan'208";a="380133235"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 20:10:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="805652530"
X-IronPort-AV: E=Sophos;i="6.02,221,1688454000"; 
   d="scan'208";a="805652530"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 01 Sep 2023 20:10:04 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcH1O-0001ts-0X;
	Sat, 02 Sep 2023 03:10:02 +0000
Date: Sat, 2 Sep 2023 11:09:13 +0800
From: kernel test robot <lkp@intel.com>
To: Aaron Lu <aaron.lu@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [aaronlu:sis_profile 1/1] kernel/sched/fair.c:7127:28: warning:
 unknown attribute 'noipa' ignored
Message-ID: <202309021102.1PYSPEeh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/aaronlu/linux.git sis_profile
head:   fc546923e1057cfeec0069d46f12fdabcb0d31c9
commit: fc546923e1057cfeec0069d46f12fdabcb0d31c9 [1/1] profile select_idle_sibling()
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230902/202309021102.1PYSPEeh-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230902/202309021102.1PYSPEeh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309021102.1PYSPEeh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/fair.c:7127:28: warning: unknown attribute 'noipa' ignored [-Wunknown-attributes]
   static int __attribute__ ((noipa)) select_idle_sibling(struct task_struct *p, int prev, int target)
                              ^~~~~
   1 warning generated.


vim +/noipa +7127 kernel/sched/fair.c

  7123	
  7124	/*
  7125	 * Try and locate an idle core/thread in the LLC cache domain.
  7126	 */
> 7127	static int __attribute__ ((noipa)) select_idle_sibling(struct task_struct *p, int prev, int target)
  7128	{
  7129		bool has_idle_core = false;
  7130		struct sched_domain *sd;
  7131		unsigned long task_util, util_min, util_max;
  7132		int i, recent_used_cpu;
  7133	
  7134		/*
  7135		 * On asymmetric system, update task utilization because we will check
  7136		 * that the task fits with cpu's capacity.
  7137		 */
  7138		if (sched_asym_cpucap_active()) {
  7139			sync_entity_load_avg(&p->se);
  7140			task_util = task_util_est(p);
  7141			util_min = uclamp_eff_value(p, UCLAMP_MIN);
  7142			util_max = uclamp_eff_value(p, UCLAMP_MAX);
  7143		}
  7144	
  7145		/*
  7146		 * per-cpu select_rq_mask usage
  7147		 */
  7148		lockdep_assert_irqs_disabled();
  7149	
  7150		if ((available_idle_cpu(target) || sched_idle_cpu(target)) &&
  7151		    asym_fits_cpu(task_util, util_min, util_max, target))
  7152			return target | CPU_TARGET;
  7153	
  7154		/*
  7155		 * If the previous CPU is cache affine and idle, don't be stupid:
  7156		 */
  7157		if (prev != target && cpus_share_cache(prev, target) &&
  7158		    (available_idle_cpu(prev) || sched_idle_cpu(prev)) &&
  7159		    asym_fits_cpu(task_util, util_min, util_max, prev))
  7160			return prev | CPU_PREV;
  7161	
  7162		/*
  7163		 * Allow a per-cpu kthread to stack with the wakee if the
  7164		 * kworker thread and the tasks previous CPUs are the same.
  7165		 * The assumption is that the wakee queued work for the
  7166		 * per-cpu kthread that is now complete and the wakeup is
  7167		 * essentially a sync wakeup. An obvious example of this
  7168		 * pattern is IO completions.
  7169		 */
  7170		if (is_per_cpu_kthread(current) &&
  7171		    in_task() &&
  7172		    prev == smp_processor_id() &&
  7173		    this_rq()->nr_running <= 1 &&
  7174		    asym_fits_cpu(task_util, util_min, util_max, prev)) {
  7175			return prev;
  7176		}
  7177	
  7178		/* Check a recently used CPU as a potential idle candidate: */
  7179		recent_used_cpu = p->recent_used_cpu;
  7180		p->recent_used_cpu = prev;
  7181		if (recent_used_cpu != prev &&
  7182		    recent_used_cpu != target &&
  7183		    cpus_share_cache(recent_used_cpu, target) &&
  7184		    (available_idle_cpu(recent_used_cpu) || sched_idle_cpu(recent_used_cpu)) &&
  7185		    cpumask_test_cpu(p->recent_used_cpu, p->cpus_ptr) &&
  7186		    asym_fits_cpu(task_util, util_min, util_max, recent_used_cpu))
  7187			return recent_used_cpu | CPU_RECENT;
  7188	
  7189		/*
  7190		 * For asymmetric CPU capacity systems, our domain of interest is
  7191		 * sd_asym_cpucapacity rather than sd_llc.
  7192		 */
  7193		if (sched_asym_cpucap_active()) {
  7194			sd = rcu_dereference(per_cpu(sd_asym_cpucapacity, target));
  7195			/*
  7196			 * On an asymmetric CPU capacity system where an exclusive
  7197			 * cpuset defines a symmetric island (i.e. one unique
  7198			 * capacity_orig value through the cpuset), the key will be set
  7199			 * but the CPUs within that cpuset will not have a domain with
  7200			 * SD_ASYM_CPUCAPACITY. These should follow the usual symmetric
  7201			 * capacity path.
  7202			 */
  7203			if (sd) {
  7204				i = select_idle_capacity(p, sd, target);
  7205				return ((unsigned)i < nr_cpumask_bits) ? i : target;
  7206			}
  7207		}
  7208	
  7209		sd = rcu_dereference(per_cpu(sd_llc, target));
  7210		if (!sd)
  7211			return target;
  7212	
  7213		if (sched_smt_active()) {
  7214			has_idle_core = test_idle_cores(target);
  7215	
  7216			if (!has_idle_core && cpus_share_cache(prev, target)) {
  7217				i = select_idle_smt(p, prev);
  7218				if ((unsigned int)i < nr_cpumask_bits)
  7219					return i | CPU_IDLE_SMT;
  7220			}
  7221		}
  7222	
  7223		i = select_idle_cpu(p, sd, has_idle_core, target);
  7224		if ((unsigned)i < nr_cpumask_bits)
  7225			return i | CPU_IDLE_CPU;
  7226	
  7227		return target | CPU_FALLBACK;
  7228	}
  7229	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
