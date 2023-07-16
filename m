Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C578187D;
	Sun, 16 Jul 2023 05:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689484818; x=1721020818;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=luZQ2urrYPZ4hFqGzBVpi9IYc+5dgHh/BvaDSxiuVQU=;
  b=PVc+7vr0aQZPHu9nvm7zt2e06zo1u4ruMBPXyepMMJiAkG6C3HbRBetG
   CB5ZiFb9Jn2UMYjHeGswlnJ4UtEs3dU/O327/VcfynF2y0lQjPUb5s9O2
   E6t9Oa9TDQ2/hVkSkQPm9kNIiDtsb15JWUkcpKKexICgFSHjVasRmiKiM
   RYG6InNjvqdERDqoDTcVMRBGYGca69PAUqTC+dmWIkZVEkN7NghtUBDzA
   sRTbkCzGtUpsD2lwVeKWO9ajHhwGH7FVviuLBl0Lmz7pQezae/G7XQNQk
   UL1JSukPxAaaJnzxUaJh4aDApUiImoXVy/DqQ5o46a42aPW3xw2fRDYJZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="396547005"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="396547005"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 22:20:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="788257645"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="788257645"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 15 Jul 2023 22:20:16 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKuB5-0008c9-0H;
	Sun, 16 Jul 2023 05:20:15 +0000
Date: Sun, 16 Jul 2023 13:19:20 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qais.yousef@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:sched-setscheduler-hide 2/6]
 kernel/rcu/tree_plugin.h:1192:21: warning: unused variable 'sp'
Message-ID: <202307161346.X85WQcih-lkp@intel.com>
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
commit: d8106d64bbf0e8d98e636ddda1524fae375c8cf5 [2/6] rcu: Use a new sched_set_rcu_fifo() to set gp kthread prio
config: i386-randconfig-r012-20230716 (https://download.01.org/0day-ci/archive/20230716/202307161346.X85WQcih-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230716/202307161346.X85WQcih-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307161346.X85WQcih-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/rcu/tree.c:5017:
>> kernel/rcu/tree_plugin.h:1192:21: warning: unused variable 'sp' [-Wunused-variable]
           struct sched_param sp;
                              ^
   1 warning generated.


vim +/sp +1192 kernel/rcu/tree_plugin.h

27f4d28057adf9 kernel/rcutree_plugin.h  Paul E. McKenney 2011-02-07  1183  
27f4d28057adf9 kernel/rcutree_plugin.h  Paul E. McKenney 2011-02-07  1184  /*
27f4d28057adf9 kernel/rcutree_plugin.h  Paul E. McKenney 2011-02-07  1185   * Create an RCU-boost kthread for the specified node if one does not
27f4d28057adf9 kernel/rcutree_plugin.h  Paul E. McKenney 2011-02-07  1186   * already exist.  We only create this kthread for preemptible RCU.
27f4d28057adf9 kernel/rcutree_plugin.h  Paul E. McKenney 2011-02-07  1187   */
3545832fc22e23 kernel/rcu/tree_plugin.h Byungchul Park   2019-07-01  1188  static void rcu_spawn_one_boost_kthread(struct rcu_node *rnp)
27f4d28057adf9 kernel/rcutree_plugin.h  Paul E. McKenney 2011-02-07  1189  {
27f4d28057adf9 kernel/rcutree_plugin.h  Paul E. McKenney 2011-02-07  1190  	unsigned long flags;
3ef5a1c3821ab6 kernel/rcu/tree_plugin.h Paul E. McKenney 2021-04-05  1191  	int rnp_index = rnp - rcu_get_root();
27f4d28057adf9 kernel/rcutree_plugin.h  Paul E. McKenney 2011-02-07 @1192  	struct sched_param sp;
27f4d28057adf9 kernel/rcutree_plugin.h  Paul E. McKenney 2011-02-07  1193  	struct task_struct *t;
27f4d28057adf9 kernel/rcutree_plugin.h  Paul E. McKenney 2011-02-07  1194  
218b957a6959a2 kernel/rcu/tree_plugin.h David Woodhouse  2021-12-08  1195  	mutex_lock(&rnp->boost_kthread_mutex);
3ef5a1c3821ab6 kernel/rcu/tree_plugin.h Paul E. McKenney 2021-04-05  1196  	if (rnp->boost_kthread_task || !rcu_scheduler_fully_active)
218b957a6959a2 kernel/rcu/tree_plugin.h David Woodhouse  2021-12-08  1197  		goto out;
3545832fc22e23 kernel/rcu/tree_plugin.h Byungchul Park   2019-07-01  1198  
27f4d28057adf9 kernel/rcutree_plugin.h  Paul E. McKenney 2011-02-07  1199  	t = kthread_create(rcu_boost_kthread, (void *)rnp,
5b61b0baa9e802 kernel/rcutree_plugin.h  Mike Galbraith   2011-08-19  1200  			   "rcub/%d", rnp_index);
3545832fc22e23 kernel/rcu/tree_plugin.h Byungchul Park   2019-07-01  1201  	if (WARN_ON_ONCE(IS_ERR(t)))
218b957a6959a2 kernel/rcu/tree_plugin.h David Woodhouse  2021-12-08  1202  		goto out;
3545832fc22e23 kernel/rcu/tree_plugin.h Byungchul Park   2019-07-01  1203  
2a67e741bbbc02 kernel/rcu/tree_plugin.h Peter Zijlstra   2015-10-08  1204  	raw_spin_lock_irqsave_rcu_node(rnp, flags);
27f4d28057adf9 kernel/rcutree_plugin.h  Paul E. McKenney 2011-02-07  1205  	rnp->boost_kthread_task = t;
67c583a7de3433 kernel/rcu/tree_plugin.h Boqun Feng       2015-12-29  1206  	raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
d8106d64bbf0e8 kernel/rcu/tree_plugin.h Qais Yousef      2020-07-23  1207  	rcu_set_gp_prio(t);
9a432736904d38 kernel/rcutree_plugin.h  Paul E. McKenney 2011-05-30  1208  	wake_up_process(t); /* get to TASK_INTERRUPTIBLE quickly. */
218b957a6959a2 kernel/rcu/tree_plugin.h David Woodhouse  2021-12-08  1209  
218b957a6959a2 kernel/rcu/tree_plugin.h David Woodhouse  2021-12-08  1210   out:
218b957a6959a2 kernel/rcu/tree_plugin.h David Woodhouse  2021-12-08  1211  	mutex_unlock(&rnp->boost_kthread_mutex);
27f4d28057adf9 kernel/rcutree_plugin.h  Paul E. McKenney 2011-02-07  1212  }
27f4d28057adf9 kernel/rcutree_plugin.h  Paul E. McKenney 2011-02-07  1213  

:::::: The code at line 1192 was first introduced by commit
:::::: 27f4d28057adf98750cf863c40baefb12f5b6d21 rcu: priority boosting for TREE_PREEMPT_RCU

:::::: TO: Paul E. McKenney <paul.mckenney@linaro.org>
:::::: CC: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
