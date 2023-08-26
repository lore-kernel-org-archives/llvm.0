Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FB51C29;
	Sat, 26 Aug 2023 09:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693041988; x=1724577988;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QoRqAXyypzIZtNDTfW6EgjkVaOCSwTVW/Bwef7Q8bVc=;
  b=MP+LSkD+4eVZloWUKbl4GM4zJRKDM+FkY30XCMttJ4ushcbhDhPua8rJ
   gFluUojZbNDNyMUF2lDx/bRXcqYNNeSNopipmMTJ9RXxWMNhVBuztbbQ6
   kIpUEkvAztwmo9vldQcfV2GG4GzfB38TtEvqJ1fgm1CMQSFR/TVLaauE3
   mWlQ9Y8AK4hPMIZhyaRRI+kOab98ZYxjvvnm69suVPtX6VJqhRMHpRZdf
   hd38cp11YdvOSVAZZkjYZro+iAMSq9EyEn6ktFYRrdbSp1SpOLiMvDxk9
   E+gpCw39B2q1i+g9nsoJ9MPFqfbrO2pFcpI6z+RVUYtCwGxemDg4gRf/X
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="372264866"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="372264866"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2023 02:26:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="1068490919"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="1068490919"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 26 Aug 2023 02:26:26 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZpYn-0004YN-20;
	Sat, 26 Aug 2023 09:26:25 +0000
Date: Sat, 26 Aug 2023 17:25:29 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qais.yousef@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:sched-setscheduler-hide 8/9]
 kernel/rcu/rcutorture.c:2409:3: error: call to undeclared function
 'sched_setscheduler_nocheck'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202308261704.SSuhTI8n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux sched-setscheduler-hide
head:   e586c67baa1c537a793f135e324cc56df2b6585b
commit: 66cbe87c50b34ba823e5542a7c699fcbe8663d5d [8/9] sched: Make sched_set{scheduler, attr}() static
config: i386-randconfig-r022-20230826 (https://download.01.org/0day-ci/archive/20230826/202308261704.SSuhTI8n-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308261704.SSuhTI8n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308261704.SSuhTI8n-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/rcu/rcutorture.c:2409:3: error: call to undeclared function 'sched_setscheduler_nocheck'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   sched_setscheduler_nocheck(t, SCHED_FIFO, &sp);
                   ^
   1 error generated.


vim +/sched_setscheduler_nocheck +2409 kernel/rcu/rcutorture.c

8e8be45e8e55da kernel/rcutorture.c     Paul E. McKenney          2010-09-02  2391  
0ffd374b2207a1 kernel/rcu/rcutorture.c Sebastian Andrzej Siewior 2016-08-18  2392  static int rcutorture_booster_init(unsigned int cpu)
8e8be45e8e55da kernel/rcutorture.c     Paul E. McKenney          2010-09-02  2393  {
8e8be45e8e55da kernel/rcutorture.c     Paul E. McKenney          2010-09-02  2394  	int retval;
8e8be45e8e55da kernel/rcutorture.c     Paul E. McKenney          2010-09-02  2395  
8e8be45e8e55da kernel/rcutorture.c     Paul E. McKenney          2010-09-02  2396  	if (boost_tasks[cpu] != NULL)
8e8be45e8e55da kernel/rcutorture.c     Paul E. McKenney          2010-09-02  2397  		return 0;  /* Already created, nothing more to do. */
8e8be45e8e55da kernel/rcutorture.c     Paul E. McKenney          2010-09-02  2398  
3002153a91a973 kernel/rcu/rcutorture.c Frederic Weisbecker       2022-06-10  2399  	// Testing RCU priority boosting requires rcutorture do
3002153a91a973 kernel/rcu/rcutorture.c Frederic Weisbecker       2022-06-10  2400  	// some serious abuse.  Counter this by running ksoftirqd
3002153a91a973 kernel/rcu/rcutorture.c Frederic Weisbecker       2022-06-10  2401  	// at higher priority.
3002153a91a973 kernel/rcu/rcutorture.c Frederic Weisbecker       2022-06-10  2402  	if (IS_BUILTIN(CONFIG_RCU_TORTURE_TEST)) {
3002153a91a973 kernel/rcu/rcutorture.c Frederic Weisbecker       2022-06-10  2403  		struct sched_param sp;
3002153a91a973 kernel/rcu/rcutorture.c Frederic Weisbecker       2022-06-10  2404  		struct task_struct *t;
3002153a91a973 kernel/rcu/rcutorture.c Frederic Weisbecker       2022-06-10  2405  
3002153a91a973 kernel/rcu/rcutorture.c Frederic Weisbecker       2022-06-10  2406  		t = per_cpu(ksoftirqd, cpu);
3002153a91a973 kernel/rcu/rcutorture.c Frederic Weisbecker       2022-06-10  2407  		WARN_ON_ONCE(!t);
3002153a91a973 kernel/rcu/rcutorture.c Frederic Weisbecker       2022-06-10  2408  		sp.sched_priority = 2;
3002153a91a973 kernel/rcu/rcutorture.c Frederic Weisbecker       2022-06-10 @2409  		sched_setscheduler_nocheck(t, SCHED_FIFO, &sp);
3002153a91a973 kernel/rcu/rcutorture.c Frederic Weisbecker       2022-06-10  2410  	}
3002153a91a973 kernel/rcu/rcutorture.c Frederic Weisbecker       2022-06-10  2411  
8e8be45e8e55da kernel/rcutorture.c     Paul E. McKenney          2010-09-02  2412  	/* Don't allow time recalculation while creating a new task. */
8e8be45e8e55da kernel/rcutorture.c     Paul E. McKenney          2010-09-02  2413  	mutex_lock(&boost_mutex);
450efca7182a51 kernel/rcu/rcutorture.c Joel Fernandes (Google    2018-06-10  2414) 	rcu_torture_disable_rt_throttle();
5ccf60f23d33af kernel/rcu/rcutorture.c Paul E. McKenney          2014-01-29  2415  	VERBOSE_TOROUT_STRING("Creating rcu_torture_boost task");
3b9cb4ba4b54ec kernel/rcu/rcutorture.c Cai Huoqing               2022-01-14  2416  	boost_tasks[cpu] = kthread_run_on_cpu(rcu_torture_boost, NULL,
3b9cb4ba4b54ec kernel/rcu/rcutorture.c Cai Huoqing               2022-01-14  2417  					      cpu, "rcu_torture_boost_%u");
8e8be45e8e55da kernel/rcutorture.c     Paul E. McKenney          2010-09-02  2418  	if (IS_ERR(boost_tasks[cpu])) {
8e8be45e8e55da kernel/rcutorture.c     Paul E. McKenney          2010-09-02  2419  		retval = PTR_ERR(boost_tasks[cpu]);
5ccf60f23d33af kernel/rcu/rcutorture.c Paul E. McKenney          2014-01-29  2420  		VERBOSE_TOROUT_STRING("rcu_torture_boost task create failed");
8e8be45e8e55da kernel/rcutorture.c     Paul E. McKenney          2010-09-02  2421  		n_rcu_torture_boost_ktrerror++;
8e8be45e8e55da kernel/rcutorture.c     Paul E. McKenney          2010-09-02  2422  		boost_tasks[cpu] = NULL;
8e8be45e8e55da kernel/rcutorture.c     Paul E. McKenney          2010-09-02  2423  		mutex_unlock(&boost_mutex);
8e8be45e8e55da kernel/rcutorture.c     Paul E. McKenney          2010-09-02  2424  		return retval;
8e8be45e8e55da kernel/rcutorture.c     Paul E. McKenney          2010-09-02  2425  	}
8e8be45e8e55da kernel/rcutorture.c     Paul E. McKenney          2010-09-02  2426  	mutex_unlock(&boost_mutex);
8e8be45e8e55da kernel/rcutorture.c     Paul E. McKenney          2010-09-02  2427  	return 0;
8e8be45e8e55da kernel/rcutorture.c     Paul E. McKenney          2010-09-02  2428  }
8e8be45e8e55da kernel/rcutorture.c     Paul E. McKenney          2010-09-02  2429  

:::::: The code at line 2409 was first introduced by commit
:::::: 3002153a91a9732a6d1d0bb95138593c7da15743 rcutorture: Fix ksoftirqd boosting timing and iteration

:::::: TO: Frederic Weisbecker <frederic@kernel.org>
:::::: CC: Paul E. McKenney <paulmck@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
