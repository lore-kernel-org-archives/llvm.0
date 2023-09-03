Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8387F;
	Sun,  3 Sep 2023 03:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693711303; x=1725247303;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GTLKNDZASGiUieZv/5zKBOrkvlOuNe8vOQvcJfRp6wk=;
  b=cHaHbxchQz1CEMmLBhuN9LBSAE9zif18qq5t7qUc/CL6QpfW08a2sudg
   s+oQhPEp5LOFEgS8kurwmdtC+JpHCJqIhB7a5v6FJ5cDZxXIDsWyO2nvW
   DMdRXovp0ArZeJYJGJnLZWKLEGFiNMepHee7ij7AlRKzqHro2fdFfY58Q
   0IMd/xjxt8lUooyuigfVwYSnl7FYxugvN3/WzUDDe6jBZtb0qsO1k+dtv
   h+4VHLmjS6IKz//C26YXJXEW0Ub5BpTTBo8Cg9Qk8dQoj/v+5pcDxtpn3
   SagU+iQcU9LWmUBygxJq33bThBQ6fxB/7IwOdwxETPpZ5sE9MobtN0XWh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="440388912"
X-IronPort-AV: E=Sophos;i="6.02,223,1688454000"; 
   d="scan'208";a="440388912"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2023 20:21:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="743570797"
X-IronPort-AV: E=Sophos;i="6.02,223,1688454000"; 
   d="scan'208";a="743570797"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 02 Sep 2023 20:21:41 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcdgA-0002qN-3B;
	Sun, 03 Sep 2023 03:21:38 +0000
Date: Sun, 3 Sep 2023 11:21:05 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:uclamp-max-aggregation 2/2]
 kernel/sched/core.c:7115:10: error: call to undeclared function
 'uclamp_util_with'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202309031109.DNJnGquN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux uclamp-max-aggregation
head:   1c5e789f50e8f3bce19ec226e1971186ab7d35c6
commit: 1c5e789f50e8f3bce19ec226e1971186ab7d35c6 [2/2] sched/uclamp: Remove rq max aggregation
config: i386-buildonly-randconfig-003-20230903 (https://download.01.org/0day-ci/archive/20230903/202309031109.DNJnGquN-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230903/202309031109.DNJnGquN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309031109.DNJnGquN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/core.c:7115:10: error: call to undeclared function 'uclamp_util_with'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   util = uclamp_util_with(util, p);
                          ^
   kernel/sched/core.c:7115:10: note: did you mean 'uclamp_rq_util_with'?
   kernel/sched/sched.h:3029:15: note: 'uclamp_rq_util_with' declared here
   unsigned long uclamp_rq_util_with(struct rq *rq, unsigned long util,
                 ^
   1 error generated.


vim +/uclamp_util_with +7115 kernel/sched/core.c

  7056	
  7057	#ifdef CONFIG_SMP
  7058	/*
  7059	 * This function computes an effective utilization for the given CPU, to be
  7060	 * used for frequency selection given the linear relation: f = u * f_max.
  7061	 *
  7062	 * The scheduler tracks the following metrics:
  7063	 *
  7064	 *   cpu_util_{cfs,rt,dl,irq}()
  7065	 *   cpu_bw_dl()
  7066	 *
  7067	 * Where the cfs,rt and dl util numbers are tracked with the same metric and
  7068	 * synchronized windows and are thus directly comparable.
  7069	 *
  7070	 * The cfs,rt,dl utilization are the running times measured with rq->clock_task
  7071	 * which excludes things like IRQ and steal-time. These latter are then accrued
  7072	 * in the irq utilization.
  7073	 *
  7074	 * The DL bandwidth number otoh is not a measured metric but a value computed
  7075	 * based on the task model parameters and gives the minimal utilization
  7076	 * required to meet deadlines.
  7077	 */
  7078	unsigned long effective_cpu_util(int cpu, unsigned long util_cfs,
  7079					 enum cpu_util_type type,
  7080					 struct task_struct *p)
  7081	{
  7082		unsigned long dl_util, util, irq, max;
  7083		struct rq *rq = cpu_rq(cpu);
  7084	
  7085		max = arch_scale_cpu_capacity(cpu);
  7086	
  7087		if (!IS_ENABLED(CONFIG_UCLAMP_TASK) &&
  7088		    type == FREQUENCY_UTIL && rt_rq_is_runnable(&rq->rt)) {
  7089			return max;
  7090		}
  7091	
  7092		/*
  7093		 * Early check to see if IRQ/steal time saturates the CPU, can be
  7094		 * because of inaccuracies in how we track these -- see
  7095		 * update_irq_load_avg().
  7096		 */
  7097		irq = cpu_util_irq(rq);
  7098		if (unlikely(irq >= max))
  7099			return max;
  7100	
  7101		/*
  7102		 * Because the time spend on RT/DL tasks is visible as 'lost' time to
  7103		 * CFS tasks and we use the same metric to track the effective
  7104		 * utilization (PELT windows are synchronized) we can directly add them
  7105		 * to obtain the CPU's actual utilization.
  7106		 *
  7107		 * CFS and RT utilization can be boosted or capped, depending on
  7108		 * utilization clamp constraints requested by currently RUNNABLE
  7109		 * tasks.
  7110		 * When there are no CFS RUNNABLE tasks, clamps are released and
  7111		 * frequency will be gracefully reduced with the utilization decay.
  7112		 */
  7113		util = util_cfs + cpu_util_rt(rq);
  7114		if (type == FREQUENCY_UTIL)
> 7115			util = uclamp_util_with(util, p);
  7116	
  7117		dl_util = cpu_util_dl(rq);
  7118	
  7119		/*
  7120		 * For frequency selection we do not make cpu_util_dl() a permanent part
  7121		 * of this sum because we want to use cpu_bw_dl() later on, but we need
  7122		 * to check if the CFS+RT+DL sum is saturated (ie. no idle time) such
  7123		 * that we select f_max when there is no idle time.
  7124		 *
  7125		 * NOTE: numerical errors or stop class might cause us to not quite hit
  7126		 * saturation when we should -- something for later.
  7127		 */
  7128		if (util + dl_util >= max)
  7129			return max;
  7130	
  7131		/*
  7132		 * OTOH, for energy computation we need the estimated running time, so
  7133		 * include util_dl and ignore dl_bw.
  7134		 */
  7135		if (type == ENERGY_UTIL)
  7136			util += dl_util;
  7137	
  7138		/*
  7139		 * There is still idle time; further improve the number by using the
  7140		 * irq metric. Because IRQ/steal time is hidden from the task clock we
  7141		 * need to scale the task numbers:
  7142		 *
  7143		 *              max - irq
  7144		 *   U' = irq + --------- * U
  7145		 *                 max
  7146		 */
  7147		util = scale_irq_capacity(util, irq, max);
  7148		util += irq;
  7149	
  7150		/*
  7151		 * Bandwidth required by DEADLINE must always be granted while, for
  7152		 * FAIR and RT, we use blocked utilization of IDLE CPUs as a mechanism
  7153		 * to gracefully reduce the frequency when no tasks show up for longer
  7154		 * periods of time.
  7155		 *
  7156		 * Ideally we would like to set bw_dl as min/guaranteed freq and util +
  7157		 * bw_dl as requested freq. However, cpufreq is not yet ready for such
  7158		 * an interface. So, we only do the latter for now.
  7159		 */
  7160		if (type == FREQUENCY_UTIL)
  7161			util += cpu_bw_dl(rq);
  7162	
  7163		return min(max, util);
  7164	}
  7165	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
