Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C537629;
	Sat,  9 Sep 2023 02:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694228383; x=1725764383;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eoAh4FRyFCmlNfQSDpXibokVv+trgIJxbZyi22/s6Go=;
  b=dwG0py4gxuFEo1OCkwuk+cAGx3RBQtKQvNvPYFQkPHCQ5H6Td/U1wey+
   oiHgjaLt0XhvsiBbVPcM49lcpgFZ5oWt5LlsMCyhCGXahQ877XRr09d25
   hl5E2EXJYy9M2MBCtLYwVeJqNw9PRy1Gx6tOL4zu2HG/Sw3+oE83dhiPE
   gFhEFGNXhEHryYQmO/BsjDy/8E+D8KMiSrhfMNDSVP+5jd39nhhrnHlyD
   L1nSfffHIo5AkgJlp3EfmuGfRhOYpZn96hddf4j08m04hXuErEFFCTSMM
   H7H6Xheyd5r2ZnijmNw8wMRup64TXdgwi9KrPo2CJBc3q2iF6s+xDmsro
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="464159124"
X-IronPort-AV: E=Sophos;i="6.02,238,1688454000"; 
   d="scan'208";a="464159124"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2023 19:59:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="866320036"
X-IronPort-AV: E=Sophos;i="6.02,238,1688454000"; 
   d="scan'208";a="866320036"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 08 Sep 2023 19:59:41 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeoCB-0002rW-03;
	Sat, 09 Sep 2023 02:59:39 +0000
Date: Sat, 9 Sep 2023 10:59:12 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [rt-devel:linux-6.5.y-rt-rebase 21/89] kernel/softirq.c:658:40:
 error: call to undeclared function 'local_pending_timers'; ISO C99 and later
 do not support implicit function declarations
Message-ID: <202309091041.Dj6oDUu8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git linux-6.5.y-rt-rebase
head:   c6fcf37a5a805382cef13fc285bbbc18b2bf7180
commit: a48154df8446e20778f71023444fb15deeddf607 [21/89] softirq: Use a dedicated thread for timer wakeups.
config: i386-randconfig-005-20230909 (https://download.01.org/0day-ci/archive/20230909/202309091041.Dj6oDUu8-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230909/202309091041.Dj6oDUu8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309091041.Dj6oDUu8-lkp@intel.com/

Note: the rt-devel/linux-6.5.y-rt-rebase HEAD c6fcf37a5a805382cef13fc285bbbc18b2bf7180 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> kernel/softirq.c:658:40: error: call to undeclared function 'local_pending_timers'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   if (IS_ENABLED(CONFIG_PREEMPT_RT) && local_pending_timers())
                                                        ^
   1 error generated.


vim +/local_pending_timers +658 kernel/softirq.c

   644	
   645	static inline void __irq_exit_rcu(void)
   646	{
   647	#ifndef __ARCH_IRQ_EXIT_IRQS_DISABLED
   648		local_irq_disable();
   649	#else
   650		lockdep_assert_irqs_disabled();
   651	#endif
   652		account_hardirq_exit(current);
   653		preempt_count_sub(HARDIRQ_OFFSET);
   654		if (!in_interrupt()) {
   655			if (local_softirq_pending())
   656				invoke_softirq();
   657	
 > 658			if (IS_ENABLED(CONFIG_PREEMPT_RT) && local_pending_timers())
   659				wake_timersd();
   660		}
   661	
   662		tick_irq_exit();
   663	}
   664	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
