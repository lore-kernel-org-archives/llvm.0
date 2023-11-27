Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E703714E;
	Mon, 27 Nov 2023 17:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y15kz/Q+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701105526; x=1732641526;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IeWgMNYJbeQkrdFCwUKq5pjzWu7XROofYR8g0Wh0qeQ=;
  b=Y15kz/Q+lFiQox3cmzFUsYrXQ5hX8hQUgo7pMWIQd324XS3X0Cu0DUIS
   2qUQESi9ZyIj1L0n7vx1ix0wHv082YyWw/rrG6SEyq/B1wcZy4jgQCF22
   ZwNRhJ66Ftl3ge3wWYi6aNXQkJobxascSNHkfzJgN0uu0QGQazyW6jNwU
   SpKQMeE9O52ebqs/o48h5jmM7GkgUHTO/Xm0uUELgZmuB7XITCrMAZxyf
   0SMJReqckt46qclZphm+WymBLc0kaKBwQivjZBIjz1e1oyq11T4dBV09s
   yyDi9vb29LalYaEfogI7JcFyl/xuux7UpPkD+12/qavFIWjDbf1dFb3C/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="383136135"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="383136135"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 09:18:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="718096243"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="718096243"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 27 Nov 2023 09:18:44 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7fFq-0006Us-0V;
	Mon, 27 Nov 2023 17:18:42 +0000
Date: Tue, 28 Nov 2023 01:18:35 +0800
From: kernel test robot <lkp@intel.com>
To: Peng Liu <pngliu@hotmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	frederic@kernel.org, tglx@linutronix.de, mingo@kernel.org,
	linux-kernel@vger.kernel.org, liupeng17@lenovo.com
Subject: Re: [PATCH 1/2] tick/nohz: Remove duplicate between
 tick_nohz_switch_to_nohz() and tick_setup_sched_timer()
Message-ID: <202311272337.qYKX6cSh-lkp@intel.com>
References: <TYCP286MB21464B3653B956AF71806931C6BDA@TYCP286MB2146.JPNP286.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYCP286MB21464B3653B956AF71806931C6BDA@TYCP286MB2146.JPNP286.PROD.OUTLOOK.COM>

Hi Peng,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/timers/core]
[also build test ERROR on linus/master v6.7-rc3 next-20231127]
[cannot apply to tip/timers/nohz]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Peng-Liu/tick-nohz-Remove-duplicate-between-tick_nohz_lowres_handler-and-tick_nohz_highres_handler/20231127-163637
base:   tip/timers/core
patch link:    https://lore.kernel.org/r/TYCP286MB21464B3653B956AF71806931C6BDA%40TYCP286MB2146.JPNP286.PROD.OUTLOOK.COM
patch subject: [PATCH 1/2] tick/nohz: Remove duplicate between tick_nohz_switch_to_nohz() and tick_setup_sched_timer()
config: x86_64-randconfig-004-20231127 (https://download.01.org/0day-ci/archive/20231127/202311272337.qYKX6cSh-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231127/202311272337.qYKX6cSh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311272337.qYKX6cSh-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/time/tick-sched.c:1546:30: error: use of undeclared identifier 'tick_nohz_highres_handler'; did you mean 'tick_nohz_lowres_handler'?
                   ts->sched_timer.function = tick_nohz_highres_handler;
                                              ^~~~~~~~~~~~~~~~~~~~~~~~~
                                              tick_nohz_lowres_handler
   kernel/time/tick-sched.c:1395:13: note: 'tick_nohz_lowres_handler' declared here
   static void tick_nohz_lowres_handler(struct clock_event_device *dev)
               ^
>> kernel/time/tick-sched.c:1552:6: error: use of undeclared identifier 'sched_skew_tick'; did you mean 'scheduler_tick'?
           if (sched_skew_tick) {
               ^~~~~~~~~~~~~~~
               scheduler_tick
   include/linux/sched.h:294:13: note: 'scheduler_tick' declared here
   extern void scheduler_tick(void);
               ^
   2 errors generated.


vim +1552 kernel/time/tick-sched.c

62cf20b32aee4a Thomas Gleixner           2012-05-25  1533  
de667c3b095eed Peng Liu                  2023-11-27  1534  #if defined CONFIG_NO_HZ_COMMON || defined CONFIG_HIGH_RES_TIMERS
79bf2bb335b85d Thomas Gleixner           2007-02-16  1535  /**
79bf2bb335b85d Thomas Gleixner           2007-02-16  1536   * tick_setup_sched_timer - setup the tick emulation timer
79bf2bb335b85d Thomas Gleixner           2007-02-16  1537   */
de667c3b095eed Peng Liu                  2023-11-27  1538  void tick_setup_sched_timer(int mode)
79bf2bb335b85d Thomas Gleixner           2007-02-16  1539  {
22127e93c587af Christoph Lameter         2014-08-17  1540  	struct tick_sched *ts = this_cpu_ptr(&tick_cpu_sched);
79bf2bb335b85d Thomas Gleixner           2007-02-16  1541  	ktime_t now = ktime_get();
79bf2bb335b85d Thomas Gleixner           2007-02-16  1542  
6c774377359923 Ingo Molnar               2023-09-28  1543  	/* Emulate tick processing via per-CPU hrtimers: */
902a9f9c509053 Sebastian Andrzej Siewior 2019-07-26  1544  	hrtimer_init(&ts->sched_timer, CLOCK_MONOTONIC, HRTIMER_MODE_ABS_HARD);
de667c3b095eed Peng Liu                  2023-11-27  1545  	if (mode == NOHZ_MODE_HIGHRES)
dba428a678c726 Frederic Weisbecker       2023-09-12  1546  		ts->sched_timer.function = tick_nohz_highres_handler;
79bf2bb335b85d Thomas Gleixner           2007-02-16  1547  
0de7611a1031f2 Ingo Molnar               2016-07-01  1548  	/* Get the next period (per-CPU) */
cc584b213f252b Arjan van de Ven          2008-09-01  1549  	hrtimer_set_expires(&ts->sched_timer, tick_init_jiffy_update());
79bf2bb335b85d Thomas Gleixner           2007-02-16  1550  
6c774377359923 Ingo Molnar               2023-09-28  1551  	/* Offset the tick to avert 'jiffies_lock' contention. */
5307c9556bc17e Mike Galbraith            2012-05-08 @1552  	if (sched_skew_tick) {
b9965449164299 Thomas Gleixner           2020-11-17  1553  		u64 offset = TICK_NSEC >> 1;
5307c9556bc17e Mike Galbraith            2012-05-08  1554  		do_div(offset, num_possible_cpus());
5307c9556bc17e Mike Galbraith            2012-05-08  1555  		offset *= smp_processor_id();
5307c9556bc17e Mike Galbraith            2012-05-08  1556  		hrtimer_add_expires_ns(&ts->sched_timer, offset);
5307c9556bc17e Mike Galbraith            2012-05-08  1557  	}
5307c9556bc17e Mike Galbraith            2012-05-08  1558  
b9965449164299 Thomas Gleixner           2020-11-17  1559  	hrtimer_forward(&ts->sched_timer, now, TICK_NSEC);
de667c3b095eed Peng Liu                  2023-11-27  1560  	if (mode == NOHZ_MODE_HIGHRES)
902a9f9c509053 Sebastian Andrzej Siewior 2019-07-26  1561  		hrtimer_start_expires(&ts->sched_timer, HRTIMER_MODE_ABS_PINNED_HARD);
de667c3b095eed Peng Liu                  2023-11-27  1562  	else
de667c3b095eed Peng Liu                  2023-11-27  1563  		tick_program_event(hrtimer_get_expires(&ts->sched_timer), 1);
de667c3b095eed Peng Liu                  2023-11-27  1564  	tick_nohz_activate(ts, mode);
79bf2bb335b85d Thomas Gleixner           2007-02-16  1565  }
3c4fbe5e01d7e5 Miao Xie                  2008-08-20  1566  #endif /* HIGH_RES_TIMERS */
79bf2bb335b85d Thomas Gleixner           2007-02-16  1567  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
