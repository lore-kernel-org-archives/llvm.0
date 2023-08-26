Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FDE1C29;
	Sat, 26 Aug 2023 08:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693040068; x=1724576068;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mxcVWrZwz/T6FGJmsCXt++J16Sl9ErWreUXWWde7/4A=;
  b=IL2cle1ke78BMmKBaUascc8eOd6oDl0UX4nkmVTEllJJhOx56ynkDkhn
   lTMGYJgM/FaVw7XZ9oLDoJ/2kTftN2MFy7OJT6B/yB7Jbd5+K9SJxHyxP
   qSut8hv2aFxotoNO4ICXsox6De1HlDtH0VkX+22f2VsXk+CRigFfvmWt0
   ov3qaF6Z62uUyjD7ZpSFbluCCUHaQjjcT1ii0APZll0Us8zlQmwL2SVYN
   bqSBcgwZ3Sf2DceaatSsXJ0Lj4K8p2hRxZuR/d6fgmVkPiJX/oPnkGiVm
   3TdEBzfiJysbZQ+03PwPkgKVm4A3vu+Q2RxT7MdkBp3fgZiM7ux4t29BJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="405854704"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="405854704"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2023 01:54:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="714589271"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="714589271"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 26 Aug 2023 01:54:25 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZp3o-0004Wl-2d;
	Sat, 26 Aug 2023 08:54:24 +0000
Date: Sat, 26 Aug 2023 16:54:00 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qais.yousef@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:sched-setscheduler-hide 8/9]
 kernel/rcu/rcutorture.c:2409:3: error: implicit declaration of function
 'sched_setscheduler_nocheck' is invalid in C99
Message-ID: <202308261649.tz4C0gBb-lkp@intel.com>
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
config: um-randconfig-r002-20230826 (https://download.01.org/0day-ci/archive/20230826/202308261649.tz4C0gBb-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308261649.tz4C0gBb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308261649.tz4C0gBb-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/rcu/rcutorture.c:24:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from kernel/rcu/rcutorture.c:24:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from kernel/rcu/rcutorture.c:24:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
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
   kernel/rcu/rcutorture.c:412:16: warning: variable 'started' set but not used [-Wunused-but-set-variable]
           unsigned long started;
                         ^
   kernel/rcu/rcutorture.c:416:21: warning: variable 'ts' set but not used [-Wunused-but-set-variable]
           unsigned long long ts;
                              ^
   kernel/rcu/rcutorture.c:413:16: warning: variable 'completed' set but not used [-Wunused-but-set-variable]
           unsigned long completed;
                         ^
   kernel/rcu/rcutorture.c:1967:21: warning: variable 'ts' set but not used [-Wunused-but-set-variable]
           unsigned long long ts;
                              ^
>> kernel/rcu/rcutorture.c:2409:3: error: implicit declaration of function 'sched_setscheduler_nocheck' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   sched_setscheduler_nocheck(t, SCHED_FIFO, &sp);
                   ^
   kernel/rcu/rcutorture.c:3174:9: error: implicit declaration of function 'rcu_get_gp_kthreads_prio' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           prio = rcu_get_gp_kthreads_prio();
                  ^
   16 warnings and 2 errors generated.


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
