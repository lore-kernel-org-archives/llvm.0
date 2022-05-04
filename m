Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044467F
	for <llvm@lists.linux.dev>; Wed,  4 May 2022 13:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651671004; x=1683207004;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sX+J0MwknIbnksuzHZooP6jMEwBnbSZpjNN9Up+qAJg=;
  b=b8mFX9syHUeIlKtFktmLBFVkXKy52niOGPue46xAciZFOcnh9LWmhg1X
   OmKpFx8oMS5AOUH8MMAGjrqUmQC4VRXpOCzwc5+Xwxvfbrx9zDaCElAFJ
   vf8EAML8+N0bx2CsVGY8my0CbE6oBcZDTq5eAT8BAgXbOiZuD9g/8M1at
   FzZ+KJG2hGQ6vfa5AGDL9LpFpbpMUNS0LXEqDeqUybN4Hb0+rqdRh22ds
   8UUevO/CxJJLcMy8uqcLNvsNbKxpNig5wlvbTdX7BSzhrAr6y3QT9F+nU
   NGO0+7x8PVgIPfplzurIvQTmThpaMthiwbXnYL00E4xKq1pvkdsf/bInk
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10337"; a="354202709"
X-IronPort-AV: E=Sophos;i="5.91,198,1647327600"; 
   d="scan'208";a="354202709"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2022 06:30:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,198,1647327600"; 
   d="scan'208";a="734398598"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 04 May 2022 06:30:01 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nmF4q-000BQ3-UB;
	Wed, 04 May 2022 13:30:00 +0000
Date: Wed, 4 May 2022 21:29:14 +0800
From: kernel test robot <lkp@intel.com>
To: Byungchul Park <byungchul.park@lge.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH RFC v6 02/21] dept: Implement Dept(Dependency Tracker)
Message-ID: <202205042158.8iGx4fJj-lkp@intel.com>
References: <1651652269-15342-3-git-send-email-byungchul.park@lge.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1651652269-15342-3-git-send-email-byungchul.park@lge.com>

Hi Byungchul,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on tip/sched/core]
[also build test WARNING on linux/master linus/master v5.18-rc5]
[cannot apply to tip/locking/core hnaz-mm/master next-20220504]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Byungchul-Park/DEPT-Dependency-Tracker/20220504-165133
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git 1a90bfd220201fbe050dfc15deaac20ca5f15638
config: x86_64-randconfig-a011-20220502 (https://download.01.org/0day-ci/archive/20220504/202205042158.8iGx4fJj-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 363b3a645a1e30011cc8da624f13dac5fd915628)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/8ab7541af4844f7183b42fa0bdab884e87c2b1b8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Byungchul-Park/DEPT-Dependency-Tracker/20220504-165133
        git checkout 8ab7541af4844f7183b42fa0bdab884e87c2b1b8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/locking/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/locking/lockdep.c:4247: warning: expecting prototype for lockdep_hardirqs_on_prepare(). Prototype was for __lockdep_hardirqs_on_prepare() instead


vim +4247 kernel/locking/lockdep.c

dd4e5d3ac4a76b kernel/lockdep.c         Peter Zijlstra 2011-06-21  4236  
c86e9b987cea3d kernel/locking/lockdep.c Peter Zijlstra 2020-03-18  4237  /**
c86e9b987cea3d kernel/locking/lockdep.c Peter Zijlstra 2020-03-18  4238   * lockdep_hardirqs_on_prepare - Prepare for enabling interrupts
c86e9b987cea3d kernel/locking/lockdep.c Peter Zijlstra 2020-03-18  4239   * @ip:		Caller address
c86e9b987cea3d kernel/locking/lockdep.c Peter Zijlstra 2020-03-18  4240   *
c86e9b987cea3d kernel/locking/lockdep.c Peter Zijlstra 2020-03-18  4241   * Invoked before a possible transition to RCU idle from exit to user or
c86e9b987cea3d kernel/locking/lockdep.c Peter Zijlstra 2020-03-18  4242   * guest mode. This ensures that all RCU operations are done before RCU
c86e9b987cea3d kernel/locking/lockdep.c Peter Zijlstra 2020-03-18  4243   * stops watching. After the RCU transition lockdep_hardirqs_on() has to be
c86e9b987cea3d kernel/locking/lockdep.c Peter Zijlstra 2020-03-18  4244   * invoked to set the final state.
c86e9b987cea3d kernel/locking/lockdep.c Peter Zijlstra 2020-03-18  4245   */
8ab7541af4844f kernel/locking/lockdep.c Byungchul Park 2022-05-04  4246  void __lockdep_hardirqs_on_prepare(unsigned long ip)
dd4e5d3ac4a76b kernel/lockdep.c         Peter Zijlstra 2011-06-21 @4247  {
859d069ee1ddd8 kernel/locking/lockdep.c Peter Zijlstra 2020-05-27  4248  	if (unlikely(!debug_locks))
859d069ee1ddd8 kernel/locking/lockdep.c Peter Zijlstra 2020-05-27  4249  		return;
859d069ee1ddd8 kernel/locking/lockdep.c Peter Zijlstra 2020-05-27  4250  
859d069ee1ddd8 kernel/locking/lockdep.c Peter Zijlstra 2020-05-27  4251  	/*
859d069ee1ddd8 kernel/locking/lockdep.c Peter Zijlstra 2020-05-27  4252  	 * NMIs do not (and cannot) track lock dependencies, nothing to do.
859d069ee1ddd8 kernel/locking/lockdep.c Peter Zijlstra 2020-05-27  4253  	 */
859d069ee1ddd8 kernel/locking/lockdep.c Peter Zijlstra 2020-05-27  4254  	if (unlikely(in_nmi()))
859d069ee1ddd8 kernel/locking/lockdep.c Peter Zijlstra 2020-05-27  4255  		return;
859d069ee1ddd8 kernel/locking/lockdep.c Peter Zijlstra 2020-05-27  4256  
f8e48a3dca060e kernel/locking/lockdep.c Peter Zijlstra 2020-10-22  4257  	if (unlikely(this_cpu_read(lockdep_recursion)))
dd4e5d3ac4a76b kernel/lockdep.c         Peter Zijlstra 2011-06-21  4258  		return;
dd4e5d3ac4a76b kernel/lockdep.c         Peter Zijlstra 2011-06-21  4259  
f9ad4a5f3f20be kernel/locking/lockdep.c Peter Zijlstra 2020-05-27  4260  	if (unlikely(lockdep_hardirqs_enabled())) {
7d36b26be0f3c6 kernel/lockdep.c         Peter Zijlstra 2011-07-26  4261  		/*
7d36b26be0f3c6 kernel/lockdep.c         Peter Zijlstra 2011-07-26  4262  		 * Neither irq nor preemption are disabled here
7d36b26be0f3c6 kernel/lockdep.c         Peter Zijlstra 2011-07-26  4263  		 * so this is racy by nature but losing one hit
7d36b26be0f3c6 kernel/lockdep.c         Peter Zijlstra 2011-07-26  4264  		 * in a stat is not a big deal.
7d36b26be0f3c6 kernel/lockdep.c         Peter Zijlstra 2011-07-26  4265  		 */
7d36b26be0f3c6 kernel/lockdep.c         Peter Zijlstra 2011-07-26  4266  		__debug_atomic_inc(redundant_hardirqs_on);
7d36b26be0f3c6 kernel/lockdep.c         Peter Zijlstra 2011-07-26  4267  		return;
7d36b26be0f3c6 kernel/lockdep.c         Peter Zijlstra 2011-07-26  4268  	}
7d36b26be0f3c6 kernel/lockdep.c         Peter Zijlstra 2011-07-26  4269  
0119fee449f501 kernel/lockdep.c         Peter Zijlstra 2011-09-02  4270  	/*
0119fee449f501 kernel/lockdep.c         Peter Zijlstra 2011-09-02  4271  	 * We're enabling irqs and according to our state above irqs weren't
0119fee449f501 kernel/lockdep.c         Peter Zijlstra 2011-09-02  4272  	 * already enabled, yet we find the hardware thinks they are in fact
0119fee449f501 kernel/lockdep.c         Peter Zijlstra 2011-09-02  4273  	 * enabled.. someone messed up their IRQ state tracing.
0119fee449f501 kernel/lockdep.c         Peter Zijlstra 2011-09-02  4274  	 */
dd4e5d3ac4a76b kernel/lockdep.c         Peter Zijlstra 2011-06-21  4275  	if (DEBUG_LOCKS_WARN_ON(!irqs_disabled()))
dd4e5d3ac4a76b kernel/lockdep.c         Peter Zijlstra 2011-06-21  4276  		return;
dd4e5d3ac4a76b kernel/lockdep.c         Peter Zijlstra 2011-06-21  4277  
0119fee449f501 kernel/lockdep.c         Peter Zijlstra 2011-09-02  4278  	/*
0119fee449f501 kernel/lockdep.c         Peter Zijlstra 2011-09-02  4279  	 * See the fine text that goes along with this variable definition.
0119fee449f501 kernel/lockdep.c         Peter Zijlstra 2011-09-02  4280  	 */
d671002be6bdd7 kernel/locking/lockdep.c zhengbin       2019-04-29  4281  	if (DEBUG_LOCKS_WARN_ON(early_boot_irqs_disabled))
7d36b26be0f3c6 kernel/lockdep.c         Peter Zijlstra 2011-07-26  4282  		return;
7d36b26be0f3c6 kernel/lockdep.c         Peter Zijlstra 2011-07-26  4283  
0119fee449f501 kernel/lockdep.c         Peter Zijlstra 2011-09-02  4284  	/*
0119fee449f501 kernel/lockdep.c         Peter Zijlstra 2011-09-02  4285  	 * Can't allow enabling interrupts while in an interrupt handler,
0119fee449f501 kernel/lockdep.c         Peter Zijlstra 2011-09-02  4286  	 * that's general bad form and such. Recursion, limited stack etc..
0119fee449f501 kernel/lockdep.c         Peter Zijlstra 2011-09-02  4287  	 */
f9ad4a5f3f20be kernel/locking/lockdep.c Peter Zijlstra 2020-05-27  4288  	if (DEBUG_LOCKS_WARN_ON(lockdep_hardirq_context()))
7d36b26be0f3c6 kernel/lockdep.c         Peter Zijlstra 2011-07-26  4289  		return;
7d36b26be0f3c6 kernel/lockdep.c         Peter Zijlstra 2011-07-26  4290  
c86e9b987cea3d kernel/locking/lockdep.c Peter Zijlstra 2020-03-18  4291  	current->hardirq_chain_key = current->curr_chain_key;
c86e9b987cea3d kernel/locking/lockdep.c Peter Zijlstra 2020-03-18  4292  
4d004099a668c4 kernel/locking/lockdep.c Peter Zijlstra 2020-10-02  4293  	lockdep_recursion_inc();
c86e9b987cea3d kernel/locking/lockdep.c Peter Zijlstra 2020-03-18  4294  	__trace_hardirqs_on_caller();
10476e6304222c kernel/locking/lockdep.c Peter Zijlstra 2020-03-13  4295  	lockdep_recursion_finish();
dd4e5d3ac4a76b kernel/lockdep.c         Peter Zijlstra 2011-06-21  4296  }
8ab7541af4844f kernel/locking/lockdep.c Byungchul Park 2022-05-04  4297  EXPORT_SYMBOL_GPL(__lockdep_hardirqs_on_prepare);
c86e9b987cea3d kernel/locking/lockdep.c Peter Zijlstra 2020-03-18  4298  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
