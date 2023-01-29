Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3682C80;
	Sun, 29 Jan 2023 18:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675017023; x=1706553023;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JNRfGT7oyes/pRTIdRHiu7aWV7ZTscmwGeCTvxd/cw4=;
  b=Q1UbS35TJJtnlH0J00FOR46KlA82Q6jHTcGVLAIQExaaBml2c6yLMUlV
   LFWeF4CGTsq0lJovrC8wtxAC9+vryBLCbOfLnKCy+aAsidLVstvpvjsf/
   IThq1TjZ1T/pT4YOs9Jet0TVwgM+1WHaztXopgv6JKmNYfDg3GQdQCrpM
   +mVMHg2A1KaI+m5/FNfE46gSSEO6xxLoQVW/IpZ5XFyeCigN5irWtztKM
   U77+pA2zeRmbetJSfqVfFuyL3/cANwCg8PFc5nO31HTcOFsZn1fx9Et/M
   qZtsp6g/C4+8OgyuMv3E6++lPlHMlqRKd3UE/mgwJRUyhEooifCMZ/YJk
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="389800528"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="389800528"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2023 10:30:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="696167983"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="696167983"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 29 Jan 2023 10:30:20 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMCRX-000315-1u;
	Sun, 29 Jan 2023 18:30:19 +0000
Date: Mon, 30 Jan 2023 02:29:26 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:uclamp-spare-capacity-fixes 4/6]
 kernel/sched/fair.c:7459:11: error: unterminated function-like macro
 invocation
Message-ID: <202301300213.GrzU0wjj-lkp@intel.com>
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
config: s390-randconfig-r044-20230129 (https://download.01.org/0day-ci/archive/20230130/202301300213.GrzU0wjj-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/qais-yousef/linux/commit/eb7cae7d9708a8bd005b137d0a6b3532e286686b
        git remote add qais-yousef https://github.com/qais-yousef/linux
        git fetch --no-tags qais-yousef uclamp-spare-capacity-fixes
        git checkout eb7cae7d9708a8bd005b137d0a6b3532e286686b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from kernel/sched/fair.c:38:
   In file included from include/linux/sched/isolation.h:6:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from kernel/sched/fair.c:38:
   In file included from include/linux/sched/isolation.h:6:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from kernel/sched/fair.c:38:
   In file included from include/linux/sched/isolation.h:6:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> kernel/sched/fair.c:7459:11: error: unterminated function-like macro invocation
                           } else if ((fits > max_fits) ||
                                  ^
   include/linux/compiler.h:56:9: note: macro 'if' defined here
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
           ^
>> kernel/sched/fair.c:12689:2: error: expected expression
   }
    ^
>> kernel/sched/fair.c:12689:2: error: expected '}'
   kernel/sched/fair.c:7413:27: note: to match this '{'
                   for_each_cpu(cpu, cpus) {
                                           ^
>> kernel/sched/fair.c:12689:2: error: expected '}'
   }
    ^
   kernel/sched/fair.c:7390:28: note: to match this '{'
           for (; pd; pd = pd->next) {
                                     ^
>> kernel/sched/fair.c:12689:2: error: expected '}'
   }
    ^
   kernel/sched/fair.c:7353:1: note: to match this '{'
   {
   ^
>> kernel/sched/fair.c:7370:8: error: use of undeclared label 'unlock'
                   goto unlock;
                        ^
   12 warnings and 6 errors generated.


vim +7459 kernel/sched/fair.c

390031e4c309c9 Quentin Perret            2018-12-03  7312  
732cd75b8c920d Quentin Perret            2018-12-03  7313  /*
732cd75b8c920d Quentin Perret            2018-12-03  7314   * find_energy_efficient_cpu(): Find most energy-efficient target CPU for the
732cd75b8c920d Quentin Perret            2018-12-03  7315   * waking task. find_energy_efficient_cpu() looks for the CPU with maximum
732cd75b8c920d Quentin Perret            2018-12-03  7316   * spare capacity in each performance domain and uses it as a potential
732cd75b8c920d Quentin Perret            2018-12-03  7317   * candidate to execute the task. Then, it uses the Energy Model to figure
732cd75b8c920d Quentin Perret            2018-12-03  7318   * out which of the CPU candidates is the most energy-efficient.
732cd75b8c920d Quentin Perret            2018-12-03  7319   *
732cd75b8c920d Quentin Perret            2018-12-03  7320   * The rationale for this heuristic is as follows. In a performance domain,
732cd75b8c920d Quentin Perret            2018-12-03  7321   * all the most energy efficient CPU candidates (according to the Energy
732cd75b8c920d Quentin Perret            2018-12-03  7322   * Model) are those for which we'll request a low frequency. When there are
732cd75b8c920d Quentin Perret            2018-12-03  7323   * several CPUs for which the frequency request will be the same, we don't
732cd75b8c920d Quentin Perret            2018-12-03  7324   * have enough data to break the tie between them, because the Energy Model
732cd75b8c920d Quentin Perret            2018-12-03  7325   * only includes active power costs. With this model, if we assume that
732cd75b8c920d Quentin Perret            2018-12-03  7326   * frequency requests follow utilization (e.g. using schedutil), the CPU with
732cd75b8c920d Quentin Perret            2018-12-03  7327   * the maximum spare capacity in a performance domain is guaranteed to be among
732cd75b8c920d Quentin Perret            2018-12-03  7328   * the best candidates of the performance domain.
732cd75b8c920d Quentin Perret            2018-12-03  7329   *
732cd75b8c920d Quentin Perret            2018-12-03  7330   * In practice, it could be preferable from an energy standpoint to pack
732cd75b8c920d Quentin Perret            2018-12-03  7331   * small tasks on a CPU in order to let other CPUs go in deeper idle states,
732cd75b8c920d Quentin Perret            2018-12-03  7332   * but that could also hurt our chances to go cluster idle, and we have no
732cd75b8c920d Quentin Perret            2018-12-03  7333   * ways to tell with the current Energy Model if this is actually a good
732cd75b8c920d Quentin Perret            2018-12-03  7334   * idea or not. So, find_energy_efficient_cpu() basically favors
732cd75b8c920d Quentin Perret            2018-12-03  7335   * cluster-packing, and spreading inside a cluster. That should at least be
732cd75b8c920d Quentin Perret            2018-12-03  7336   * a good thing for latency, and this is consistent with the idea that most
732cd75b8c920d Quentin Perret            2018-12-03  7337   * of the energy savings of EAS come from the asymmetry of the system, and
732cd75b8c920d Quentin Perret            2018-12-03  7338   * not so much from breaking the tie between identical CPUs. That's also the
732cd75b8c920d Quentin Perret            2018-12-03  7339   * reason why EAS is enabled in the topology code only for systems where
732cd75b8c920d Quentin Perret            2018-12-03  7340   * SD_ASYM_CPUCAPACITY is set.
732cd75b8c920d Quentin Perret            2018-12-03  7341   *
732cd75b8c920d Quentin Perret            2018-12-03  7342   * NOTE: Forkees are not accepted in the energy-aware wake-up path because
732cd75b8c920d Quentin Perret            2018-12-03  7343   * they don't have any useful utilization data yet and it's not possible to
732cd75b8c920d Quentin Perret            2018-12-03  7344   * forecast their impact on energy consumption. Consequently, they will be
732cd75b8c920d Quentin Perret            2018-12-03  7345   * placed by find_idlest_cpu() on the least loaded CPU, which might turn out
732cd75b8c920d Quentin Perret            2018-12-03  7346   * to be energy-inefficient in some use-cases. The alternative would be to
732cd75b8c920d Quentin Perret            2018-12-03  7347   * bias new tasks towards specific types of CPUs first, or to try to infer
732cd75b8c920d Quentin Perret            2018-12-03  7348   * their util_avg from the parent task, but those heuristics could hurt
732cd75b8c920d Quentin Perret            2018-12-03  7349   * other use-cases too. So, until someone finds a better way to solve this,
732cd75b8c920d Quentin Perret            2018-12-03  7350   * let's keep things simple by re-using the existing slow path.
732cd75b8c920d Quentin Perret            2018-12-03  7351   */
732cd75b8c920d Quentin Perret            2018-12-03  7352  static int find_energy_efficient_cpu(struct task_struct *p, int prev_cpu)
732cd75b8c920d Quentin Perret            2018-12-03  7353  {
9b340131a4bcf6 Dietmar Eggemann          2022-06-21  7354  	struct cpumask *cpus = this_cpu_cpumask_var_ptr(select_rq_mask);
eb92692b2544d3 Quentin Perret            2019-09-12  7355  	unsigned long prev_delta = ULONG_MAX, best_delta = ULONG_MAX;
244226035a1f9b Qais Yousef               2022-08-04  7356  	unsigned long p_util_min = uclamp_is_used() ? uclamp_eff_value(p, UCLAMP_MIN) : 0;
244226035a1f9b Qais Yousef               2022-08-04  7357  	unsigned long p_util_max = uclamp_is_used() ? uclamp_eff_value(p, UCLAMP_MAX) : 1024;
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7358  	struct root_domain *rd = this_rq()->rd;
b812fc9768e004 Vincent Donnefort         2022-06-21  7359  	int cpu, best_energy_cpu, target = -1;
7acf2d942472b3 Vincent Guittot           2023-01-19  7360  	int prev_fits = -1, best_fits = -1;
7acf2d942472b3 Vincent Guittot           2023-01-19  7361  	unsigned long best_thermal_cap = 0;
7acf2d942472b3 Vincent Guittot           2023-01-19  7362  	unsigned long prev_thermal_cap = 0;
732cd75b8c920d Quentin Perret            2018-12-03  7363  	struct sched_domain *sd;
eb92692b2544d3 Quentin Perret            2019-09-12  7364  	struct perf_domain *pd;
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7365  	struct energy_env eenv;
732cd75b8c920d Quentin Perret            2018-12-03  7366  
732cd75b8c920d Quentin Perret            2018-12-03  7367  	rcu_read_lock();
732cd75b8c920d Quentin Perret            2018-12-03  7368  	pd = rcu_dereference(rd->pd);
732cd75b8c920d Quentin Perret            2018-12-03  7369  	if (!pd || READ_ONCE(rd->overutilized))
619e090c8e409e Pierre Gondois            2021-05-04 @7370  		goto unlock;
732cd75b8c920d Quentin Perret            2018-12-03  7371  
732cd75b8c920d Quentin Perret            2018-12-03  7372  	/*
732cd75b8c920d Quentin Perret            2018-12-03  7373  	 * Energy-aware wake-up happens on the lowest sched_domain starting
732cd75b8c920d Quentin Perret            2018-12-03  7374  	 * from sd_asym_cpucapacity spanning over this_cpu and prev_cpu.
732cd75b8c920d Quentin Perret            2018-12-03  7375  	 */
732cd75b8c920d Quentin Perret            2018-12-03  7376  	sd = rcu_dereference(*this_cpu_ptr(&sd_asym_cpucapacity));
732cd75b8c920d Quentin Perret            2018-12-03  7377  	while (sd && !cpumask_test_cpu(prev_cpu, sched_domain_span(sd)))
732cd75b8c920d Quentin Perret            2018-12-03  7378  		sd = sd->parent;
732cd75b8c920d Quentin Perret            2018-12-03  7379  	if (!sd)
619e090c8e409e Pierre Gondois            2021-05-04  7380  		goto unlock;
619e090c8e409e Pierre Gondois            2021-05-04  7381  
619e090c8e409e Pierre Gondois            2021-05-04  7382  	target = prev_cpu;
732cd75b8c920d Quentin Perret            2018-12-03  7383  
732cd75b8c920d Quentin Perret            2018-12-03  7384  	sync_entity_load_avg(&p->se);
d81304bc619355 Qais Yousef               2022-08-04  7385  	if (!uclamp_task_util(p, p_util_min, p_util_max))
732cd75b8c920d Quentin Perret            2018-12-03  7386  		goto unlock;
732cd75b8c920d Quentin Perret            2018-12-03  7387  
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7388  	eenv_task_busy_time(&eenv, p, prev_cpu);
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7389  
732cd75b8c920d Quentin Perret            2018-12-03 @7390  	for (; pd; pd = pd->next) {
488699d3a341db Qais Yousef               2022-11-19  7391  		unsigned long util_min = p_util_min, util_max = p_util_max;
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7392  		unsigned long cpu_cap, cpu_thermal_cap, util;
eb7cae7d9708a8 Qais Yousef               2022-11-26  7393  		unsigned long cur_delta, max_spare_cap = -1UL;
244226035a1f9b Qais Yousef               2022-08-04  7394  		unsigned long rq_util_min, rq_util_max;
eb7cae7d9708a8 Qais Yousef               2022-11-26  7395  		unsigned long prev_spare_cap = -1UL;
732cd75b8c920d Quentin Perret            2018-12-03  7396  		int max_spare_cap_cpu = -1;
b812fc9768e004 Vincent Donnefort         2022-06-21  7397  		unsigned long base_energy;
7acf2d942472b3 Vincent Guittot           2023-01-19  7398  		int fits, max_fits = -1;
732cd75b8c920d Quentin Perret            2018-12-03  7399  
9b340131a4bcf6 Dietmar Eggemann          2022-06-21  7400  		cpumask_and(cpus, perf_domain_span(pd), cpu_online_mask);
9b340131a4bcf6 Dietmar Eggemann          2022-06-21  7401  
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7402  		if (cpumask_empty(cpus))
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7403  			continue;
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7404  
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7405  		/* Account thermal pressure for the energy estimation */
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7406  		cpu = cpumask_first(cpus);
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7407  		cpu_thermal_cap = arch_scale_cpu_capacity(cpu);
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7408  		cpu_thermal_cap -= arch_scale_thermal_pressure(cpu);
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7409  
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7410  		eenv.cpu_cap = cpu_thermal_cap;
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7411  		eenv.pd_cap = 0;
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7412  
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7413  		for_each_cpu(cpu, cpus) {
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7414  			eenv.pd_cap += cpu_thermal_cap;
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7415  
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7416  			if (!cpumask_test_cpu(cpu, sched_domain_span(sd)))
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7417  				continue;
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7418  
3bd3706251ee8a Sebastian Andrzej Siewior 2019-04-23  7419  			if (!cpumask_test_cpu(cpu, p->cpus_ptr))
732cd75b8c920d Quentin Perret            2018-12-03  7420  				continue;
732cd75b8c920d Quentin Perret            2018-12-03  7421  
732cd75b8c920d Quentin Perret            2018-12-03  7422  			util = cpu_util_next(cpu, p, cpu);
732cd75b8c920d Quentin Perret            2018-12-03  7423  			cpu_cap = capacity_of(cpu);
1d42509e475cdc Valentin Schneider        2019-12-11  7424  
1d42509e475cdc Valentin Schneider        2019-12-11  7425  			/*
1d42509e475cdc Valentin Schneider        2019-12-11  7426  			 * Skip CPUs that cannot satisfy the capacity request.
1d42509e475cdc Valentin Schneider        2019-12-11  7427  			 * IOW, placing the task there would make the CPU
1d42509e475cdc Valentin Schneider        2019-12-11  7428  			 * overutilized. Take uclamp into account to see how
1d42509e475cdc Valentin Schneider        2019-12-11  7429  			 * much capacity we can get out of the CPU; this is
a5418be9dffe70 Viresh Kumar              2020-12-08  7430  			 * aligned with sched_cpu_util().
1d42509e475cdc Valentin Schneider        2019-12-11  7431  			 */
244226035a1f9b Qais Yousef               2022-08-04  7432  			if (uclamp_is_used()) {
488699d3a341db Qais Yousef               2022-11-19  7433  				if (!uclamp_rq_is_idle(cpu_rq(cpu))) {
244226035a1f9b Qais Yousef               2022-08-04  7434  					/*
244226035a1f9b Qais Yousef               2022-08-04  7435  					 * Open code uclamp_rq_util_with() except for
244226035a1f9b Qais Yousef               2022-08-04  7436  					 * the clamp() part. Ie: apply max aggregation
244226035a1f9b Qais Yousef               2022-08-04  7437  					 * only. util_fits_cpu() logic requires to
244226035a1f9b Qais Yousef               2022-08-04  7438  					 * operate on non clamped util but must use the
244226035a1f9b Qais Yousef               2022-08-04  7439  					 * max-aggregated uclamp_{min, max}.
244226035a1f9b Qais Yousef               2022-08-04  7440  					 */
244226035a1f9b Qais Yousef               2022-08-04  7441  					rq_util_min = uclamp_rq_get(cpu_rq(cpu), UCLAMP_MIN);
244226035a1f9b Qais Yousef               2022-08-04  7442  					rq_util_max = uclamp_rq_get(cpu_rq(cpu), UCLAMP_MAX);
244226035a1f9b Qais Yousef               2022-08-04  7443  
244226035a1f9b Qais Yousef               2022-08-04  7444  					util_min = max(rq_util_min, p_util_min);
244226035a1f9b Qais Yousef               2022-08-04  7445  					util_max = max(rq_util_max, p_util_max);
244226035a1f9b Qais Yousef               2022-08-04  7446  				}
244226035a1f9b Qais Yousef               2022-08-04  7447  			}
7acf2d942472b3 Vincent Guittot           2023-01-19  7448  
7acf2d942472b3 Vincent Guittot           2023-01-19  7449  			fits = util_fits_cpu(util, util_min, util_max, cpu);
7acf2d942472b3 Vincent Guittot           2023-01-19  7450  			if (!fits)
732cd75b8c920d Quentin Perret            2018-12-03  7451  				continue;
732cd75b8c920d Quentin Perret            2018-12-03  7452  
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7453  			lsub_positive(&cpu_cap, util);
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7454  
732cd75b8c920d Quentin Perret            2018-12-03  7455  			if (cpu == prev_cpu) {
8d4c97c105ca07 Pierre Gondois            2021-05-04  7456  				/* Always use prev_cpu as a candidate. */
ad841e569f5c88 Pierre Gondois            2022-10-06  7457  				prev_spare_cap = cpu_cap;
7acf2d942472b3 Vincent Guittot           2023-01-19  7458  				prev_fits = fits;
7acf2d942472b3 Vincent Guittot           2023-01-19 @7459  			} else if ((fits > max_fits) ||
eb7cae7d9708a8 Qais Yousef               2022-11-26  7460  				   ((fits == max_fits) &&
eb7cae7d9708a8 Qais Yousef               2022-11-26  7461  				   (cpu_cap > max_spare_cap || max_spare_cap == -1UL) {
732cd75b8c920d Quentin Perret            2018-12-03  7462  				/*
8d4c97c105ca07 Pierre Gondois            2021-05-04  7463  				 * Find the CPU with the maximum spare capacity
ad841e569f5c88 Pierre Gondois            2022-10-06  7464  				 * among the remaining CPUs in the performance
ad841e569f5c88 Pierre Gondois            2022-10-06  7465  				 * domain.
732cd75b8c920d Quentin Perret            2018-12-03  7466  				 */
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7467  				max_spare_cap = cpu_cap;
732cd75b8c920d Quentin Perret            2018-12-03  7468  				max_spare_cap_cpu = cpu;
7acf2d942472b3 Vincent Guittot           2023-01-19  7469  				max_fits = fits;
732cd75b8c920d Quentin Perret            2018-12-03  7470  			}
732cd75b8c920d Quentin Perret            2018-12-03  7471  		}
732cd75b8c920d Quentin Perret            2018-12-03  7472  
eb7cae7d9708a8 Qais Yousef               2022-11-26  7473  		if (max_spare_cap_cpu < 0 && prev_spare_cap == -1UL)
8d4c97c105ca07 Pierre Gondois            2021-05-04  7474  			continue;
8d4c97c105ca07 Pierre Gondois            2021-05-04  7475  
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7476  		eenv_pd_busy_time(&eenv, cpus, p);
8d4c97c105ca07 Pierre Gondois            2021-05-04  7477  		/* Compute the 'base' energy of the pd, without @p */
b812fc9768e004 Vincent Donnefort         2022-06-21  7478  		base_energy = compute_energy(&eenv, pd, cpus, p, -1);
8d4c97c105ca07 Pierre Gondois            2021-05-04  7479  
8d4c97c105ca07 Pierre Gondois            2021-05-04  7480  		/* Evaluate the energy impact of using prev_cpu. */
eb7cae7d9708a8 Qais Yousef               2022-11-26  7481  		if (prev_spare_cap != -1UL) {
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7482  			prev_delta = compute_energy(&eenv, pd, cpus, p,
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7483  						    prev_cpu);
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7484  			/* CPU utilization has changed */
b812fc9768e004 Vincent Donnefort         2022-06-21  7485  			if (prev_delta < base_energy)
619e090c8e409e Pierre Gondois            2021-05-04  7486  				goto unlock;
b812fc9768e004 Vincent Donnefort         2022-06-21  7487  			prev_delta -= base_energy;
7acf2d942472b3 Vincent Guittot           2023-01-19  7488  			prev_thermal_cap = cpu_thermal_cap;
8d4c97c105ca07 Pierre Gondois            2021-05-04  7489  			best_delta = min(best_delta, prev_delta);
8d4c97c105ca07 Pierre Gondois            2021-05-04  7490  		}
8d4c97c105ca07 Pierre Gondois            2021-05-04  7491  
8d4c97c105ca07 Pierre Gondois            2021-05-04  7492  		/* Evaluate the energy impact of using max_spare_cap_cpu. */
eb7cae7d9708a8 Qais Yousef               2022-11-26  7493  		if (max_spare_cap_cpu >= 0 &&
eb7cae7d9708a8 Qais Yousef               2022-11-26  7494  		    (max_spare_cap > prev_spare_cap || prev_spare_cap == -1UL)) {
7acf2d942472b3 Vincent Guittot           2023-01-19  7495  			/* Current best energy cpu fits better */
7acf2d942472b3 Vincent Guittot           2023-01-19  7496  			if (max_fits < best_fits)
7acf2d942472b3 Vincent Guittot           2023-01-19  7497  				continue;
7acf2d942472b3 Vincent Guittot           2023-01-19  7498  
7acf2d942472b3 Vincent Guittot           2023-01-19  7499  			/*
7acf2d942472b3 Vincent Guittot           2023-01-19  7500  			 * Both don't fit performance hint (i.e. uclamp_min)
7acf2d942472b3 Vincent Guittot           2023-01-19  7501  			 * but best energy cpu has better capacity.
7acf2d942472b3 Vincent Guittot           2023-01-19  7502  			 */
7acf2d942472b3 Vincent Guittot           2023-01-19  7503  			if ((max_fits < 0) &&
7acf2d942472b3 Vincent Guittot           2023-01-19  7504  			    (cpu_thermal_cap <= best_thermal_cap))
7acf2d942472b3 Vincent Guittot           2023-01-19  7505  				continue;
7acf2d942472b3 Vincent Guittot           2023-01-19  7506  
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7507  			cur_delta = compute_energy(&eenv, pd, cpus, p,
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7508  						   max_spare_cap_cpu);
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7509  			/* CPU utilization has changed */
b812fc9768e004 Vincent Donnefort         2022-06-21  7510  			if (cur_delta < base_energy)
619e090c8e409e Pierre Gondois            2021-05-04  7511  				goto unlock;
b812fc9768e004 Vincent Donnefort         2022-06-21  7512  			cur_delta -= base_energy;
7acf2d942472b3 Vincent Guittot           2023-01-19  7513  
7acf2d942472b3 Vincent Guittot           2023-01-19  7514  			/*
7acf2d942472b3 Vincent Guittot           2023-01-19  7515  			 * Both fit for the task but best energy cpu has lower
7acf2d942472b3 Vincent Guittot           2023-01-19  7516  			 * energy impact.
7acf2d942472b3 Vincent Guittot           2023-01-19  7517  			 */
7acf2d942472b3 Vincent Guittot           2023-01-19  7518  			if ((max_fits > 0) && (best_fits > 0) &&
7acf2d942472b3 Vincent Guittot           2023-01-19  7519  			    (cur_delta >= best_delta))
7acf2d942472b3 Vincent Guittot           2023-01-19  7520  				continue;
7acf2d942472b3 Vincent Guittot           2023-01-19  7521  
eb92692b2544d3 Quentin Perret            2019-09-12  7522  			best_delta = cur_delta;
732cd75b8c920d Quentin Perret            2018-12-03  7523  			best_energy_cpu = max_spare_cap_cpu;
7acf2d942472b3 Vincent Guittot           2023-01-19  7524  			best_fits = max_fits;
7acf2d942472b3 Vincent Guittot           2023-01-19  7525  			best_thermal_cap = cpu_thermal_cap;
732cd75b8c920d Quentin Perret            2018-12-03  7526  		}
732cd75b8c920d Quentin Perret            2018-12-03  7527  	}
732cd75b8c920d Quentin Perret            2018-12-03  7528  	rcu_read_unlock();
732cd75b8c920d Quentin Perret            2018-12-03  7529  
7acf2d942472b3 Vincent Guittot           2023-01-19  7530  	if ((best_fits > prev_fits) ||
7acf2d942472b3 Vincent Guittot           2023-01-19  7531  	    ((best_fits > 0) && (best_delta < prev_delta)) ||
7acf2d942472b3 Vincent Guittot           2023-01-19  7532  	    ((best_fits < 0) && (best_thermal_cap > prev_thermal_cap)))
619e090c8e409e Pierre Gondois            2021-05-04  7533  		target = best_energy_cpu;
732cd75b8c920d Quentin Perret            2018-12-03  7534  
619e090c8e409e Pierre Gondois            2021-05-04  7535  	return target;
732cd75b8c920d Quentin Perret            2018-12-03  7536  
619e090c8e409e Pierre Gondois            2021-05-04  7537  unlock:
732cd75b8c920d Quentin Perret            2018-12-03  7538  	rcu_read_unlock();
732cd75b8c920d Quentin Perret            2018-12-03  7539  
619e090c8e409e Pierre Gondois            2021-05-04  7540  	return target;
732cd75b8c920d Quentin Perret            2018-12-03  7541  }
732cd75b8c920d Quentin Perret            2018-12-03  7542  

:::::: The code at line 7459 was first introduced by commit
:::::: 7acf2d942472b37258cfa361fbb6ee5320f92268 sched/fair: unlink misfit task from cpu overutilized

:::::: TO: Vincent Guittot <vincent.guittot@linaro.org>
:::::: CC: Qais Yousef <qyousef@layalina.io>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
