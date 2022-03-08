Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8474A8F
	for <llvm@lists.linux.dev>; Tue,  8 Mar 2022 16:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646755245; x=1678291245;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aFTJDJ6yKoaxFI6g8sPE9CQvYWqYMdAKSLo3OBtYCBs=;
  b=dwnYEkrFyPrhHXQ+kdoItp+h4t996CVJP/VmFxI6dgV74Ev0lQMQz6Im
   SQCVyDLZVhZ/A1fI5HBpuKm1vfNaYr+X+G3ZzWFo0Zp6AtAoWnK6G4V1I
   XBE/FCZ9Wg8CxZQyz10L194U4S/LfaCPwUFJqpqrVgGyhm7SUzr1Dh3m/
   Jy5AtZ42TpQHxo1+QLT19aKHyinNadefZluKgo8exI9UFKqiB2P7vZKg0
   ERJZV++FDlihj6CnRJ90BK4rGlBIXWyBISodapAgVLv+QpqmK+pVvTHEK
   ifmYyxEBtaUW0IJGzE5O2b1Gv88OYPGvCvalHfTPEsPEWojAwDmQ9biCa
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="234673926"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; 
   d="scan'208";a="234673926"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2022 08:00:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; 
   d="scan'208";a="632273708"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 08 Mar 2022 08:00:30 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nRcGD-0001eD-9O; Tue, 08 Mar 2022 16:00:29 +0000
Date: Wed, 9 Mar 2022 00:00:12 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org
Subject: [ammarfaizi2-block:paulmck/linux-rcu/dev 82/84]
 kernel/rcu/tree.c:2678:3: error: implicit declaration of function
 'rcu_tasks_classic_qs'
Message-ID: <202203082348.j9qeWzns-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/ammarfaizi2/linux-block paulmck/linux-rcu/dev
head:   fb8d1afe45bd6fcb50dff8bac4636725358fde94
commit: c8c42c80febd4e6d346f7f62958300eb8205aa31 [82/84] rcu-tasks: Make Tasks RCU account for userspace execution
config: arm-defconfig (https://download.01.org/0day-ci/archive/20220308/202203082348.j9qeWzns-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/ammarfaizi2/linux-block/commit/c8c42c80febd4e6d346f7f62958300eb8205aa31
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block paulmck/linux-rcu/dev
        git checkout c8c42c80febd4e6d346f7f62958300eb8205aa31
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> kernel/rcu/tree.c:2678:3: error: implicit declaration of function 'rcu_tasks_classic_qs' [-Werror,-Wimplicit-function-declaration]
                   rcu_tasks_classic_qs(current, false);
                   ^
   1 error generated.


vim +/rcu_tasks_classic_qs +2678 kernel/rcu/tree.c

  2644	
  2645	/*
  2646	 * This function is invoked from each scheduling-clock interrupt,
  2647	 * and checks to see if this CPU is in a non-context-switch quiescent
  2648	 * state, for example, user mode or idle loop.  It also schedules RCU
  2649	 * core processing.  If the current grace period has gone on too long,
  2650	 * it will ask the scheduler to manufacture a context switch for the sole
  2651	 * purpose of providing the needed quiescent state.
  2652	 */
  2653	void rcu_sched_clock_irq(int user)
  2654	{
  2655		unsigned long j;
  2656	
  2657		if (IS_ENABLED(CONFIG_PROVE_RCU)) {
  2658			j = jiffies;
  2659			WARN_ON_ONCE(time_before(j, __this_cpu_read(rcu_data.last_sched_clock)));
  2660			__this_cpu_write(rcu_data.last_sched_clock, j);
  2661		}
  2662		trace_rcu_utilization(TPS("Start scheduler-tick"));
  2663		lockdep_assert_irqs_disabled();
  2664		raw_cpu_inc(rcu_data.ticks_this_gp);
  2665		/* The load-acquire pairs with the store-release setting to true. */
  2666		if (smp_load_acquire(this_cpu_ptr(&rcu_data.rcu_urgent_qs))) {
  2667			/* Idle and userspace execution already are quiescent states. */
  2668			if (!rcu_is_cpu_rrupt_from_idle() && !user) {
  2669				set_tsk_need_resched(current);
  2670				set_preempt_need_resched();
  2671			}
  2672			__this_cpu_write(rcu_data.rcu_urgent_qs, false);
  2673		}
  2674		rcu_flavor_sched_clock_irq(user);
  2675		if (rcu_pending(user))
  2676			invoke_rcu_core();
  2677		if (user)
> 2678			rcu_tasks_classic_qs(current, false);
  2679		lockdep_assert_irqs_disabled();
  2680	
  2681		trace_rcu_utilization(TPS("End scheduler-tick"));
  2682	}
  2683	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
