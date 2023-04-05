Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32213ECD;
	Wed,  5 Apr 2023 11:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680695774; x=1712231774;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ANZCLi5l5qsYFLdw5XACQuEzqZXmwZeLscIOZ2nD8Gc=;
  b=UagGbLtsY5920XldVyRUPOFbimcciC6gelLXfBBb/dVWvkpr1eE4ZnYI
   c0E7ZTYG0emFAh7Q8CKrAoagK37x54lfA8cygqbQ3eZAue9OvMy8HLPI1
   ZkG2uQs69H746K0J8aLyTkOcE+n5H6hZAf+DZftJbBwQrJ7STmL2m7pgK
   3J1EBsexmDTg9GEa6DoIyiRc1Nf6lFSN/G/TnJ/IdjEn/YsNXGXIn0avu
   wZBC1BhCKYhX2Kh6tKobjOKF03b9cnTEEZsTBuKfRMnnOj9Mrud7AxTWH
   1+vzgZ7GTRur8DzpOUCFRcn0bkyW6+BhaIZpftDte3phlt81LySKNAQDi
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="405209308"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="405209308"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2023 04:56:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="932828627"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="932828627"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 05 Apr 2023 04:56:11 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pk1kI-000QVm-2W;
	Wed, 05 Apr 2023 11:56:10 +0000
Date: Wed, 5 Apr 2023 19:55:33 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:core/softirq 8/8] kernel/rcu/tree_nocb.h:954:18:
 error: too few arguments to function call, expected 2, have 1
Message-ID: <202304051913.H2SgzUHR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git core/softirq
head:   699a5cde1ff88fe951e546e174de96b274eb6d48
commit: 699a5cde1ff88fe951e546e174de96b274eb6d48 [8/8] softirq,rcu: Use softirq_needs_break()
config: riscv-randconfig-r032-20230403 (https://download.01.org/0day-ci/archive/20230405/202304051913.H2SgzUHR-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=699a5cde1ff88fe951e546e174de96b274eb6d48
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue core/softirq
        git checkout 699a5cde1ff88fe951e546e174de96b274eb6d48
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304051913.H2SgzUHR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/rcu/tree.c:4937:
>> kernel/rcu/tree_nocb.h:954:18: error: too few arguments to function call, expected 2, have 1
           rcu_do_batch(rdp);
           ~~~~~~~~~~~~    ^
   kernel/rcu/tree.c:2046:13: note: 'rcu_do_batch' declared here
   static void rcu_do_batch(struct softirq_action *h, struct rcu_data *rdp)
               ^
   1 error generated.


vim +954 kernel/rcu/tree_nocb.h

dfcb27540213e80 Frederic Weisbecker 2021-05-19  917  
dfcb27540213e80 Frederic Weisbecker 2021-05-19  918  /*
dfcb27540213e80 Frederic Weisbecker 2021-05-19  919   * Invoke any ready callbacks from the corresponding no-CBs CPU,
dfcb27540213e80 Frederic Weisbecker 2021-05-19  920   * then, if there are no more, wait for more to appear.
dfcb27540213e80 Frederic Weisbecker 2021-05-19  921   */
dfcb27540213e80 Frederic Weisbecker 2021-05-19  922  static void nocb_cb_wait(struct rcu_data *rdp)
dfcb27540213e80 Frederic Weisbecker 2021-05-19  923  {
dfcb27540213e80 Frederic Weisbecker 2021-05-19  924  	struct rcu_segcblist *cblist = &rdp->cblist;
dfcb27540213e80 Frederic Weisbecker 2021-05-19  925  	unsigned long cur_gp_seq;
dfcb27540213e80 Frederic Weisbecker 2021-05-19  926  	unsigned long flags;
dfcb27540213e80 Frederic Weisbecker 2021-05-19  927  	bool needwake_state = false;
dfcb27540213e80 Frederic Weisbecker 2021-05-19  928  	bool needwake_gp = false;
dfcb27540213e80 Frederic Weisbecker 2021-05-19  929  	bool can_sleep = true;
dfcb27540213e80 Frederic Weisbecker 2021-05-19  930  	struct rcu_node *rnp = rdp->mynode;
dfcb27540213e80 Frederic Weisbecker 2021-05-19  931  
8d9703964697340 Frederic Weisbecker 2021-11-23  932  	do {
8d9703964697340 Frederic Weisbecker 2021-11-23  933  		swait_event_interruptible_exclusive(rdp->nocb_cb_wq,
8d9703964697340 Frederic Weisbecker 2021-11-23  934  						    nocb_cb_wait_cond(rdp));
8d9703964697340 Frederic Weisbecker 2021-11-23  935  
8d9703964697340 Frederic Weisbecker 2021-11-23  936  		// VVV Ensure CB invocation follows _sleep test.
8d9703964697340 Frederic Weisbecker 2021-11-23  937  		if (smp_load_acquire(&rdp->nocb_cb_sleep)) { // ^^^
8d9703964697340 Frederic Weisbecker 2021-11-23  938  			WARN_ON(signal_pending(current));
8d9703964697340 Frederic Weisbecker 2021-11-23  939  			trace_rcu_nocb_wake(rcu_state.name, rdp->cpu, TPS("WokeEmpty"));
8d9703964697340 Frederic Weisbecker 2021-11-23  940  		}
8d9703964697340 Frederic Weisbecker 2021-11-23  941  	} while (!nocb_cb_can_run(rdp));
8d9703964697340 Frederic Weisbecker 2021-11-23  942  
8d9703964697340 Frederic Weisbecker 2021-11-23  943  
dfcb27540213e80 Frederic Weisbecker 2021-05-19  944  	local_irq_save(flags);
dfcb27540213e80 Frederic Weisbecker 2021-05-19  945  	rcu_momentary_dyntick_idle();
dfcb27540213e80 Frederic Weisbecker 2021-05-19  946  	local_irq_restore(flags);
dfcb27540213e80 Frederic Weisbecker 2021-05-19  947  	/*
dfcb27540213e80 Frederic Weisbecker 2021-05-19  948  	 * Disable BH to provide the expected environment.  Also, when
dfcb27540213e80 Frederic Weisbecker 2021-05-19  949  	 * transitioning to/from NOCB mode, a self-requeuing callback might
dfcb27540213e80 Frederic Weisbecker 2021-05-19  950  	 * be invoked from softirq.  A short grace period could cause both
dfcb27540213e80 Frederic Weisbecker 2021-05-19  951  	 * instances of this callback would execute concurrently.
dfcb27540213e80 Frederic Weisbecker 2021-05-19  952  	 */
dfcb27540213e80 Frederic Weisbecker 2021-05-19  953  	local_bh_disable();
dfcb27540213e80 Frederic Weisbecker 2021-05-19 @954  	rcu_do_batch(rdp);
dfcb27540213e80 Frederic Weisbecker 2021-05-19  955  	local_bh_enable();
dfcb27540213e80 Frederic Weisbecker 2021-05-19  956  	lockdep_assert_irqs_enabled();
dfcb27540213e80 Frederic Weisbecker 2021-05-19  957  	rcu_nocb_lock_irqsave(rdp, flags);
dfcb27540213e80 Frederic Weisbecker 2021-05-19  958  	if (rcu_segcblist_nextgp(cblist, &cur_gp_seq) &&
dfcb27540213e80 Frederic Weisbecker 2021-05-19  959  	    rcu_seq_done(&rnp->gp_seq, cur_gp_seq) &&
dfcb27540213e80 Frederic Weisbecker 2021-05-19  960  	    raw_spin_trylock_rcu_node(rnp)) { /* irqs already disabled. */
dfcb27540213e80 Frederic Weisbecker 2021-05-19  961  		needwake_gp = rcu_advance_cbs(rdp->mynode, rdp);
dfcb27540213e80 Frederic Weisbecker 2021-05-19  962  		raw_spin_unlock_rcu_node(rnp); /* irqs remain disabled. */
dfcb27540213e80 Frederic Weisbecker 2021-05-19  963  	}
dfcb27540213e80 Frederic Weisbecker 2021-05-19  964  
dfcb27540213e80 Frederic Weisbecker 2021-05-19  965  	if (rcu_segcblist_test_flags(cblist, SEGCBLIST_OFFLOADED)) {
dfcb27540213e80 Frederic Weisbecker 2021-05-19  966  		if (!rcu_segcblist_test_flags(cblist, SEGCBLIST_KTHREAD_CB)) {
dfcb27540213e80 Frederic Weisbecker 2021-05-19  967  			rcu_segcblist_set_flags(cblist, SEGCBLIST_KTHREAD_CB);
dfcb27540213e80 Frederic Weisbecker 2021-05-19  968  			if (rcu_segcblist_test_flags(cblist, SEGCBLIST_KTHREAD_GP))
dfcb27540213e80 Frederic Weisbecker 2021-05-19  969  				needwake_state = true;
dfcb27540213e80 Frederic Weisbecker 2021-05-19  970  		}
dfcb27540213e80 Frederic Weisbecker 2021-05-19  971  		if (rcu_segcblist_ready_cbs(cblist))
dfcb27540213e80 Frederic Weisbecker 2021-05-19  972  			can_sleep = false;
dfcb27540213e80 Frederic Weisbecker 2021-05-19  973  	} else {
dfcb27540213e80 Frederic Weisbecker 2021-05-19  974  		/*
dfcb27540213e80 Frederic Weisbecker 2021-05-19  975  		 * De-offloading. Clear our flag and notify the de-offload worker.
dfcb27540213e80 Frederic Weisbecker 2021-05-19  976  		 * We won't touch the callbacks and keep sleeping until we ever
dfcb27540213e80 Frederic Weisbecker 2021-05-19  977  		 * get re-offloaded.
dfcb27540213e80 Frederic Weisbecker 2021-05-19  978  		 */
dfcb27540213e80 Frederic Weisbecker 2021-05-19  979  		WARN_ON_ONCE(!rcu_segcblist_test_flags(cblist, SEGCBLIST_KTHREAD_CB));
dfcb27540213e80 Frederic Weisbecker 2021-05-19  980  		rcu_segcblist_clear_flags(cblist, SEGCBLIST_KTHREAD_CB);
dfcb27540213e80 Frederic Weisbecker 2021-05-19  981  		if (!rcu_segcblist_test_flags(cblist, SEGCBLIST_KTHREAD_GP))
dfcb27540213e80 Frederic Weisbecker 2021-05-19  982  			needwake_state = true;
dfcb27540213e80 Frederic Weisbecker 2021-05-19  983  	}
dfcb27540213e80 Frederic Weisbecker 2021-05-19  984  
dfcb27540213e80 Frederic Weisbecker 2021-05-19  985  	WRITE_ONCE(rdp->nocb_cb_sleep, can_sleep);
dfcb27540213e80 Frederic Weisbecker 2021-05-19  986  
dfcb27540213e80 Frederic Weisbecker 2021-05-19  987  	if (rdp->nocb_cb_sleep)
dfcb27540213e80 Frederic Weisbecker 2021-05-19  988  		trace_rcu_nocb_wake(rcu_state.name, rdp->cpu, TPS("CBSleep"));
dfcb27540213e80 Frederic Weisbecker 2021-05-19  989  
dfcb27540213e80 Frederic Weisbecker 2021-05-19  990  	rcu_nocb_unlock_irqrestore(rdp, flags);
dfcb27540213e80 Frederic Weisbecker 2021-05-19  991  	if (needwake_gp)
dfcb27540213e80 Frederic Weisbecker 2021-05-19  992  		rcu_gp_kthread_wake();
dfcb27540213e80 Frederic Weisbecker 2021-05-19  993  
dfcb27540213e80 Frederic Weisbecker 2021-05-19  994  	if (needwake_state)
dfcb27540213e80 Frederic Weisbecker 2021-05-19  995  		swake_up_one(&rdp->nocb_state_wq);
dfcb27540213e80 Frederic Weisbecker 2021-05-19  996  }
dfcb27540213e80 Frederic Weisbecker 2021-05-19  997  

:::::: The code at line 954 was first introduced by commit
:::::: dfcb27540213e8061ecffacd4bd8ed54a310a7b0 rcu/nocb: Start moving nocb code to its own plugin file

:::::: TO: Frederic Weisbecker <frederic@kernel.org>
:::::: CC: Paul E. McKenney <paulmck@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
