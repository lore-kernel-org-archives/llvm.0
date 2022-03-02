Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115BD33CA
	for <llvm@lists.linux.dev>; Wed,  2 Mar 2022 23:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646262721; x=1677798721;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LMWdww3gKVSvMPGl0y+W3jt1a4ZtdGZp8Jk/8TdBtFs=;
  b=MtlzyVWPUMMp/D8NYuP669Htj1/ZO15XninGHN1y/nY+Gk54HTznYSZN
   /79tooxZtGLpfMZqumg6neUDJGS2MVgZAHsQoiq1TUlE4+lWA673Pw/uB
   4o7sSKtZOc4cWL3qrZ2FikZROUv6lePsLxz5svT8FcROo93fud+5PRH7/
   s2m0bGnIQF/JokIVOrwCge2bxRQ4vKIX/OXsVorOq/wU7yGDcwT+4yPGN
   tQy9/poKbdITj8SvJwLcbOZHGcKwbNRD38E+rjP/2Iv4UXipSHbISjdnU
   2fBkE2AS90SPfixM6ruczWADVY7sFhNAKVvaPM8bDX6+84T84zs76Fckg
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="237038478"
X-IronPort-AV: E=Sophos;i="5.90,150,1643702400"; 
   d="scan'208";a="237038478"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2022 15:12:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,150,1643702400"; 
   d="scan'208";a="493719715"
Received: from lkp-server02.sh.intel.com (HELO e9605edfa585) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 02 Mar 2022 15:11:59 -0800
Received: from kbuild by e9605edfa585 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nPY8U-00023E-F7; Wed, 02 Mar 2022 23:11:58 +0000
Date: Thu, 3 Mar 2022 07:11:12 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [frederic-dynticks:rcu/context-tracking 13/19]
 kernel/context_tracking.c:91:4: error: implicit declaration of function
 'rcu_irq_work_resched'
Message-ID: <202203030735.RQy2zusl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git rcu/context-tracking
head:   e4eaff86ec91c1cbde9a113cf5232dac9f897337
commit: 5cb63f8df32ee1a43ca46337d6c8554a27d44165 [13/19] rcu/context-tracking: Move deferred nocb resched to context tracking
config: x86_64-randconfig-a001 (https://download.01.org/0day-ci/archive/20220303/202203030735.RQy2zusl-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git/commit/?id=5cb63f8df32ee1a43ca46337d6c8554a27d44165
        git remote add frederic-dynticks https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git
        git fetch --no-tags frederic-dynticks rcu/context-tracking
        git checkout 5cb63f8df32ee1a43ca46337d6c8554a27d44165
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> kernel/context_tracking.c:91:4: error: implicit declaration of function 'rcu_irq_work_resched' [-Werror,-Wimplicit-function-declaration]
                           rcu_irq_work_resched();
                           ^
   1 error generated.


vim +/rcu_irq_work_resched +91 kernel/context_tracking.c

    51	
    52	/**
    53	 * __ct_user_enter - Inform the context tracking that the CPU is going
    54	 *		     to enter user or guest space mode.
    55	 *
    56	 * This function must be called right before we switch from the kernel
    57	 * to user or guest space, when it's guaranteed the remaining kernel
    58	 * instructions to execute won't use any RCU read side critical section
    59	 * because this function sets RCU in extended quiescent state.
    60	 */
    61	void noinstr __ct_user_enter(enum ctx_state state)
    62	{
    63		lockdep_assert_irqs_disabled();
    64	
    65		/* Kernel threads aren't supposed to go to userspace */
    66		WARN_ON_ONCE(!current->mm);
    67	
    68		if (!context_tracking_recursion_enter())
    69			return;
    70	
    71		if ( __this_cpu_read(context_tracking.state) != state) {
    72			if (__this_cpu_read(context_tracking.active)) {
    73				/*
    74				 * At this stage, only low level arch entry code remains and
    75				 * then we'll run in userspace. We can assume there won't be
    76				 * any RCU read-side critical section until the next call to
    77				 * user_exit() or ct_irq_enter(). Let's remove RCU's dependency
    78				 * on the tick.
    79				 */
    80				if (state == CONTEXT_USER) {
    81					instrumentation_begin();
    82					trace_user_enter(0);
    83					vtime_user_enter(current);
    84					instrumentation_end();
    85				}
    86				/*
    87				 * Other than generic entry implementation, we may be past the last
    88				 * rescheduling opportunity in the entry code. Trigger a self IPI
    89				 * that will fire and reschedule once we resume in user/guest mode.
    90				 */
  > 91				rcu_irq_work_resched();
    92				rcu_user_enter();
    93			}
    94			/*
    95			 * Even if context tracking is disabled on this CPU, because it's outside
    96			 * the full dynticks mask for example, we still have to keep track of the
    97			 * context transitions and states to prevent inconsistency on those of
    98			 * other CPUs.
    99			 * If a task triggers an exception in userspace, sleep on the exception
   100			 * handler and then migrate to another CPU, that new CPU must know where
   101			 * the exception returns by the time we call exception_exit().
   102			 * This information can only be provided by the previous CPU when it called
   103			 * exception_enter().
   104			 * OTOH we can spare the calls to vtime and RCU when context_tracking.active
   105			 * is false because we know that CPU is not tickless.
   106			 */
   107			__this_cpu_write(context_tracking.state, state);
   108		}
   109		context_tracking_recursion_exit();
   110	}
   111	EXPORT_SYMBOL_GPL(__ct_user_enter);
   112	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
