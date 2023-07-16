Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E690F139C;
	Sun, 16 Jul 2023 04:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689482836; x=1721018836;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uudQobKX2qD9wGpxYslTz23AYiVfW6ysv85OVooJk2A=;
  b=PzL0AUM/C8GxEOUeEz/6tUvdiB5hxRmtOmWh7nWTwCV0qBjBa0UUyyBB
   /2yCQsz5ZkTZWA+QnFFPVYMowvZE3Hbe02/RgC4FjSZ37+5pmNpe/Mh1+
   Ti8K1iSrxkb9JnAGpwin9i2s4GwX4CSEiSIHeP21fL7f/vverX0sMjzt0
   DLr3JQlFTUQYZPpfoW2cJbG20T1qX9XtIEG9cYMtrw59Y+3br77kvJrRB
   b5uTvB3gu7PsV53N9DevZc+hWDlyv5QhDy6QNuk2kgOKOa8v1Wn16C/eM
   uh/yoaIhnmloWKKkfUilFgFXBaBmOWKjEEphYAMB2dd3GFBlW3iw3I2tE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="429487359"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="429487359"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 21:47:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="716784218"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="716784218"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 15 Jul 2023 21:47:14 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKtf8-0008aH-0L;
	Sun, 16 Jul 2023 04:47:14 +0000
Date: Sun, 16 Jul 2023 12:46:29 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:dvfs-headroom 2/3] kernel/sched/core.c:7444:10: error:
 call to undeclared function 'apply_dvfs_headroom'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202307161240.pE6xFO5i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux dvfs-headroom
head:   6f38251e9113f09e2935accd9bc3a246b5a02992
commit: 5d6a3f139ecaddd7c31548036b8163002d9efb98 [2/3] sched: cpufreq: Fix apply_dvfs_headroom() escaping uclamp_max
config: i386-randconfig-i012-20230716 (https://download.01.org/0day-ci/archive/20230716/202307161240.pE6xFO5i-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230716/202307161240.pE6xFO5i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307161240.pE6xFO5i-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/core.c:7444:10: error: call to undeclared function 'apply_dvfs_headroom'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   util = apply_dvfs_headroom(util);
                          ^
   kernel/sched/core.c:7482:36: error: call to undeclared function 'apply_dvfs_headroom'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           util += type ==  FREQUENCY_UTIL ? apply_dvfs_headroom(irq) : irq;
                                             ^
   2 errors generated.


vim +/apply_dvfs_headroom +7444 kernel/sched/core.c

  7385	
  7386	#ifdef CONFIG_SMP
  7387	/*
  7388	 * This function computes an effective utilization for the given CPU, to be
  7389	 * used for frequency selection given the linear relation: f = u * f_max.
  7390	 *
  7391	 * The scheduler tracks the following metrics:
  7392	 *
  7393	 *   cpu_util_{cfs,rt,dl,irq}()
  7394	 *   cpu_bw_dl()
  7395	 *
  7396	 * Where the cfs,rt and dl util numbers are tracked with the same metric and
  7397	 * synchronized windows and are thus directly comparable.
  7398	 *
  7399	 * The cfs,rt,dl utilization are the running times measured with rq->clock_task
  7400	 * which excludes things like IRQ and steal-time. These latter are then accrued
  7401	 * in the irq utilization.
  7402	 *
  7403	 * The DL bandwidth number otoh is not a measured metric but a value computed
  7404	 * based on the task model parameters and gives the minimal utilization
  7405	 * required to meet deadlines.
  7406	 */
  7407	unsigned long effective_cpu_util(int cpu, unsigned long util_cfs,
  7408					 enum cpu_util_type type,
  7409					 struct task_struct *p)
  7410	{
  7411		unsigned long dl_util, util, irq, max;
  7412		struct rq *rq = cpu_rq(cpu);
  7413	
  7414		max = arch_scale_cpu_capacity(cpu);
  7415	
  7416		if (!uclamp_is_used() &&
  7417		    type == FREQUENCY_UTIL && rt_rq_is_runnable(&rq->rt)) {
  7418			return max;
  7419		}
  7420	
  7421		/*
  7422		 * Early check to see if IRQ/steal time saturates the CPU, can be
  7423		 * because of inaccuracies in how we track these -- see
  7424		 * update_irq_load_avg().
  7425		 */
  7426		irq = cpu_util_irq(rq);
  7427		if (unlikely(irq >= max))
  7428			return max;
  7429	
  7430		/*
  7431		 * Because the time spend on RT/DL tasks is visible as 'lost' time to
  7432		 * CFS tasks and we use the same metric to track the effective
  7433		 * utilization (PELT windows are synchronized) we can directly add them
  7434		 * to obtain the CPU's actual utilization.
  7435		 *
  7436		 * CFS and RT utilization can be boosted or capped, depending on
  7437		 * utilization clamp constraints requested by currently RUNNABLE
  7438		 * tasks.
  7439		 * When there are no CFS RUNNABLE tasks, clamps are released and
  7440		 * frequency will be gracefully reduced with the utilization decay.
  7441		 */
  7442		util = util_cfs + cpu_util_rt(rq);
  7443		if (type == FREQUENCY_UTIL) {
> 7444			util = apply_dvfs_headroom(util);
  7445			util = uclamp_rq_util_with(rq, util, p);
  7446		}
  7447	
  7448		dl_util = cpu_util_dl(rq);
  7449	
  7450		/*
  7451		 * For frequency selection we do not make cpu_util_dl() a permanent part
  7452		 * of this sum because we want to use cpu_bw_dl() later on, but we need
  7453		 * to check if the CFS+RT+DL sum is saturated (ie. no idle time) such
  7454		 * that we select f_max when there is no idle time.
  7455		 *
  7456		 * NOTE: numerical errors or stop class might cause us to not quite hit
  7457		 * saturation when we should -- something for later.
  7458		 */
  7459		if (util + dl_util >= max)
  7460			return max;
  7461	
  7462		/*
  7463		 * OTOH, for energy computation we need the estimated running time, so
  7464		 * include util_dl and ignore dl_bw.
  7465		 */
  7466		if (type == ENERGY_UTIL)
  7467			util += dl_util;
  7468	
  7469		/*
  7470		 * There is still idle time; further improve the number by using the
  7471		 * irq metric. Because IRQ/steal time is hidden from the task clock we
  7472		 * need to scale the task numbers:
  7473		 *
  7474		 *              max - irq
  7475		 *   U' = irq + --------- * U
  7476		 *                 max
  7477		 *
  7478		 * We only need to apply dvfs headroom to irq part since the util part
  7479		 * already had it applied.
  7480		 */
  7481		util = scale_irq_capacity(util, irq, max);
  7482		util += type ==  FREQUENCY_UTIL ? apply_dvfs_headroom(irq) : irq;
  7483	
  7484		/*
  7485		 * Bandwidth required by DEADLINE must always be granted while, for
  7486		 * FAIR and RT, we use blocked utilization of IDLE CPUs as a mechanism
  7487		 * to gracefully reduce the frequency when no tasks show up for longer
  7488		 * periods of time.
  7489		 *
  7490		 * Ideally we would like to set bw_dl as min/guaranteed freq and util +
  7491		 * bw_dl as requested freq. However, cpufreq is not yet ready for such
  7492		 * an interface. So, we only do the latter for now.
  7493		 */
  7494		if (type == FREQUENCY_UTIL)
  7495			util += apply_dvfs_headroom(cpu_bw_dl(rq));
  7496	
  7497		return min(max, util);
  7498	}
  7499	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
