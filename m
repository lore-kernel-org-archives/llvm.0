Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305331C37;
	Sun, 16 Jul 2023 04:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689482839; x=1721018839;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N/aNl5xqovnGMpV4fJwRl/afwBeuo9WX3pgXK0UBpCY=;
  b=KHCwITuzAfxa2lbFQ6EghLdQckBa0fxBYBasFLdYR7G2Vyv6c78jhkUo
   wU5o4qTO7jISI1TioqZ1k84ItNfIg5Tfx90NNHPSZ0fGMxWD3Q0ZBZiVy
   Vu82B/mXi9MxCsXB7Yaw3ZTWQFnSCDgs5+4F2wx3quHg7Un89oSLQxYiD
   Dgyt7sV0O8RHx/vLYKSc5z+S+IxGFDxoLf3BQGwqzyTJRADNwFAoA13AO
   fO7yMmBU6z56CP5pxiDp21j1Ypz7Bp/Fy3u2YLsIDkLcImVrKMQU3fO3l
   YD+/BE4Izck74D4uKnznaovZw9PlhgXC2JmipCDOIS7E/UQ3YGlg058az
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="429487360"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="429487360"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 21:47:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="716784219"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="716784219"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 15 Jul 2023 21:47:14 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKtf8-0008aP-0U;
	Sun, 16 Jul 2023 04:47:14 +0000
Date: Sun, 16 Jul 2023 12:46:31 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qais.yousef@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:sched-setscheduler-hide 6/6]
 kernel/rcu/tree_nocb.h:1514:4: error: call to undeclared function
 'sched_setscheduler_nocheck'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202307161208.r6MoWyol-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux sched-setscheduler-hide
head:   40f87f6acda90270ee3eb284cbd13a8751ac4e61
commit: 40f87f6acda90270ee3eb284cbd13a8751ac4e61 [6/6] sched: Make sched_set{scheduler, attr}() static
config: hexagon-randconfig-r036-20230716 (https://download.01.org/0day-ci/archive/20230716/202307161208.r6MoWyol-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230716/202307161208.r6MoWyol-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307161208.r6MoWyol-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/rcu/tree.c:26:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from kernel/rcu/tree.c:26:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from kernel/rcu/tree.c:26:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   In file included from kernel/rcu/tree.c:5016:
>> kernel/rcu/tree_nocb.h:1514:4: error: call to undeclared function 'sched_setscheduler_nocheck'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                           sched_setscheduler_nocheck(t, SCHED_FIFO, &sp);
                           ^
   kernel/rcu/tree_nocb.h:1525:3: error: call to undeclared function 'sched_setscheduler_nocheck'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   sched_setscheduler_nocheck(t, SCHED_FIFO, &sp);
                   ^
   6 warnings and 2 errors generated.
--
   In file included from kernel/rcu/rcutorture.c:24:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
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
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from kernel/rcu/rcutorture.c:24:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> kernel/rcu/rcutorture.c:2409:3: error: call to undeclared function 'sched_setscheduler_nocheck'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   sched_setscheduler_nocheck(t, SCHED_FIFO, &sp);
                   ^
   6 warnings and 1 error generated.


vim +/sched_setscheduler_nocheck +1514 kernel/rcu/tree_nocb.h

dfcb27540213e8 Frederic Weisbecker     2021-05-19  1481  
dfcb27540213e8 Frederic Weisbecker     2021-05-19  1482  /*
dfcb27540213e8 Frederic Weisbecker     2021-05-19  1483   * If the specified CPU is a no-CBs CPU that does not already have its
dfcb27540213e8 Frederic Weisbecker     2021-05-19  1484   * rcuo CB kthread, spawn it.  Additionally, if the rcuo GP kthread
dfcb27540213e8 Frederic Weisbecker     2021-05-19  1485   * for this CPU's group has not yet been created, spawn it as well.
dfcb27540213e8 Frederic Weisbecker     2021-05-19  1486   */
10d4703154a72f Frederic Weisbecker     2021-11-23  1487  static void rcu_spawn_cpu_nocb_kthread(int cpu)
dfcb27540213e8 Frederic Weisbecker     2021-05-19  1488  {
dfcb27540213e8 Frederic Weisbecker     2021-05-19  1489  	struct rcu_data *rdp = per_cpu_ptr(&rcu_data, cpu);
dfcb27540213e8 Frederic Weisbecker     2021-05-19  1490  	struct rcu_data *rdp_gp;
dfcb27540213e8 Frederic Weisbecker     2021-05-19  1491  	struct task_struct *t;
54577e23fa0791 Alison Chaiken          2022-01-11  1492  	struct sched_param sp;
dfcb27540213e8 Frederic Weisbecker     2021-05-19  1493  
8d2aaa9b7c290e Frederic Weisbecker     2022-02-14  1494  	if (!rcu_scheduler_fully_active || !rcu_state.nocb_is_setup)
10d4703154a72f Frederic Weisbecker     2021-11-23  1495  		return;
10d4703154a72f Frederic Weisbecker     2021-11-23  1496  
2cf4528d6dd6f5 Frederic Weisbecker     2021-11-23  1497  	/* If there already is an rcuo kthread, then nothing to do. */
2cf4528d6dd6f5 Frederic Weisbecker     2021-11-23  1498  	if (rdp->nocb_cb_kthread)
dfcb27540213e8 Frederic Weisbecker     2021-05-19  1499  		return;
dfcb27540213e8 Frederic Weisbecker     2021-05-19  1500  
dfcb27540213e8 Frederic Weisbecker     2021-05-19  1501  	/* If we didn't spawn the GP kthread first, reorganize! */
54577e23fa0791 Alison Chaiken          2022-01-11  1502  	sp.sched_priority = kthread_prio;
dfcb27540213e8 Frederic Weisbecker     2021-05-19  1503  	rdp_gp = rdp->nocb_gp_rdp;
02e3024175274e Neeraj Upadhyay         2021-12-11  1504  	mutex_lock(&rdp_gp->nocb_gp_kthread_mutex);
dfcb27540213e8 Frederic Weisbecker     2021-05-19  1505  	if (!rdp_gp->nocb_gp_kthread) {
dfcb27540213e8 Frederic Weisbecker     2021-05-19  1506  		t = kthread_run(rcu_nocb_gp_kthread, rdp_gp,
dfcb27540213e8 Frederic Weisbecker     2021-05-19  1507  				"rcuog/%d", rdp_gp->cpu);
02e3024175274e Neeraj Upadhyay         2021-12-11  1508  		if (WARN_ONCE(IS_ERR(t), "%s: Could not start rcuo GP kthread, OOM is now expected behavior\n", __func__)) {
02e3024175274e Neeraj Upadhyay         2021-12-11  1509  			mutex_unlock(&rdp_gp->nocb_gp_kthread_mutex);
3a5761dc025da4 Zqiang                  2022-04-19  1510  			goto end;
02e3024175274e Neeraj Upadhyay         2021-12-11  1511  		}
dfcb27540213e8 Frederic Weisbecker     2021-05-19  1512  		WRITE_ONCE(rdp_gp->nocb_gp_kthread, t);
54577e23fa0791 Alison Chaiken          2022-01-11  1513  		if (kthread_prio)
54577e23fa0791 Alison Chaiken          2022-01-11 @1514  			sched_setscheduler_nocheck(t, SCHED_FIFO, &sp);
dfcb27540213e8 Frederic Weisbecker     2021-05-19  1515  	}
02e3024175274e Neeraj Upadhyay         2021-12-11  1516  	mutex_unlock(&rdp_gp->nocb_gp_kthread_mutex);
dfcb27540213e8 Frederic Weisbecker     2021-05-19  1517  
dfcb27540213e8 Frederic Weisbecker     2021-05-19  1518  	/* Spawn the kthread for this CPU. */
dfcb27540213e8 Frederic Weisbecker     2021-05-19  1519  	t = kthread_run(rcu_nocb_cb_kthread, rdp,
dfcb27540213e8 Frederic Weisbecker     2021-05-19  1520  			"rcuo%c/%d", rcu_state.abbr, cpu);
dfcb27540213e8 Frederic Weisbecker     2021-05-19  1521  	if (WARN_ONCE(IS_ERR(t), "%s: Could not start rcuo CB kthread, OOM is now expected behavior\n", __func__))
3a5761dc025da4 Zqiang                  2022-04-19  1522  		goto end;
c8b16a65267e35 Alison Chaiken          2022-01-11  1523  
8f489b4da5278f Uladzislau Rezki (Sony  2022-05-11  1524) 	if (IS_ENABLED(CONFIG_RCU_NOCB_CPU_CB_BOOST) && kthread_prio)
c8b16a65267e35 Alison Chaiken          2022-01-11  1525  		sched_setscheduler_nocheck(t, SCHED_FIFO, &sp);
8f489b4da5278f Uladzislau Rezki (Sony  2022-05-11  1526) 
dfcb27540213e8 Frederic Weisbecker     2021-05-19  1527  	WRITE_ONCE(rdp->nocb_cb_kthread, t);
dfcb27540213e8 Frederic Weisbecker     2021-05-19  1528  	WRITE_ONCE(rdp->nocb_gp_kthread, rdp_gp->nocb_gp_kthread);
3a5761dc025da4 Zqiang                  2022-04-19  1529  	return;
3a5761dc025da4 Zqiang                  2022-04-19  1530  end:
3a5761dc025da4 Zqiang                  2022-04-19  1531  	mutex_lock(&rcu_state.barrier_mutex);
3a5761dc025da4 Zqiang                  2022-04-19  1532  	if (rcu_rdp_is_offloaded(rdp)) {
3a5761dc025da4 Zqiang                  2022-04-19  1533  		rcu_nocb_rdp_deoffload(rdp);
3a5761dc025da4 Zqiang                  2022-04-19  1534  		cpumask_clear_cpu(cpu, rcu_nocb_mask);
3a5761dc025da4 Zqiang                  2022-04-19  1535  	}
3a5761dc025da4 Zqiang                  2022-04-19  1536  	mutex_unlock(&rcu_state.barrier_mutex);
dfcb27540213e8 Frederic Weisbecker     2021-05-19  1537  }
dfcb27540213e8 Frederic Weisbecker     2021-05-19  1538  

:::::: The code at line 1514 was first introduced by commit
:::::: 54577e23fa0791599db1a3d86fc8e7a205d3da75 rcu: Make priority of grace-period thread consistent

:::::: TO: Alison Chaiken <achaiken@aurora.tech>
:::::: CC: Paul E. McKenney <paulmck@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
