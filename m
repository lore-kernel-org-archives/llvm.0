Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39DC2307486;
	Tue, 23 Sep 2025 11:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758628717; cv=none; b=SsPHwFVAeO1zM8ZkZOEDJl2sAaImp/ECBugB4VN0cGUQn6hrDWJzYlFblO5cRV/wSM/w2WpSzw1Cdz/rnMUlN+hmnd+D3Ky7fdtuLVm+eR1ORtQI/2fNPb6jBhlYakEupvDalbHkqW3yjHMqaxJMZz/2EFtEODvauC4HyO35Zks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758628717; c=relaxed/simple;
	bh=zMPW66FKTbKKPdV4oFeTJxBusw7bLjHAut4hJG4p7Us=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PtF2OR3NYOYjY3lglx1ScNjfOxw+VcQoH+VZrjcx8itnxm/L8H4p3WIs6MzqxZEeX1IgAiumtqGg80o2gNycpxTTLl/8uEEm6/IONVIIFJH20B1uO67A/MJeaEL8Btbm7jeezvcWNdv98T+zqItuhcXy4RYG8WD7elGPomgBPhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LWfV9CeU; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LWfV9CeU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758628716; x=1790164716;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zMPW66FKTbKKPdV4oFeTJxBusw7bLjHAut4hJG4p7Us=;
  b=LWfV9CeUqZR9ien+cfNDHPULoFcBWdm0CMn5ptNROBNZrcyT8Voox4wq
   wGEBdoxeMGS6Vpsbctso8OMdqU74V/cAOgkUzfaZo/cjh+fxG4ckDqw6r
   ZXXMO1k7WdrRdBQVnbNPQNERa9ImwoIBfJPeyAl5BU9ENrZke6PvdHlB7
   WYTsWGF+bewOLPZ3fqCw+qaQat7ZsDE9WH84W+gBiEtPK7mkowPFyRfxr
   91lkgxCYs32P3qW7iNDZ2yUWWLgcBqQv9SF6zSMIuKz3z1m5ljsCUL+BZ
   hzHQDS8M0z08xBEMNJEdEbImSJu/0bacHiwk7OJyg2xpqNdfFGAX/a72q
   w==;
X-CSE-ConnectionGUID: RAKAs+tUS5ej+KgPwJUiMA==
X-CSE-MsgGUID: Vg9uZHuwRR2X4pKgmDvX2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60821854"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60821854"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 04:58:35 -0700
X-CSE-ConnectionGUID: pMkZTk7zSaKcJVouJLauew==
X-CSE-MsgGUID: 2NkmV4lAQl6YAuolTFZBmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="180748920"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 23 Sep 2025 04:58:33 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v11fB-00035J-1M;
	Tue, 23 Sep 2025 11:58:30 +0000
Date: Tue, 23 Sep 2025 19:57:51 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/hrtick 7/8] kernel/entry/common.c:37:4: error:
 call to undeclared function '_hrtimer_rearm'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202509231940.pkubooQX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/hrtick
head:   79e3a84fb16dde35ecd797c2d4c5a7bd07968036
commit: e5f4125a3fb167024f87c3b938902b3c94fef198 [7/8] entry,hrtimer: Push reprogramming timers into the interrupt return path
config: i386-buildonly-randconfig-002-20250923 (https://download.01.org/0day-ci/archive/20250923/202509231940.pkubooQX-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250923/202509231940.pkubooQX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509231940.pkubooQX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/entry/common.c:37:4: error: call to undeclared function '_hrtimer_rearm'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      37 |                         _hrtimer_rearm();
         |                         ^
   kernel/entry/common.c:37:4: note: did you mean 'hrtimer_rearm'?
   include/linux/hrtimer.h:197:20: note: 'hrtimer_rearm' declared here
     197 | static inline void hrtimer_rearm(void) { }
         |                    ^
   1 error generated.


vim +/_hrtimer_rearm +37 kernel/entry/common.c

    14	
    15	/**
    16	 * exit_to_user_mode_loop - do any pending work before leaving to user space
    17	 * @regs:	Pointer to pt_regs on entry stack
    18	 * @ti_work:	TIF work flags as read by the caller
    19	 */
    20	__always_inline unsigned long exit_to_user_mode_loop(struct pt_regs *regs,
    21							     unsigned long ti_work)
    22	{
    23		/*
    24		 * Before returning to user space ensure that all pending work
    25		 * items have been completed.
    26		 */
    27		while (ti_work & EXIT_TO_USER_MODE_WORK) {
    28	
    29			/*
    30			 * If hrtimer need re-arming, do so before enabling IRQs,
    31			 * except when a reschedule is needed, in that case schedule()
    32			 * will do this.
    33			 */
    34			if ((ti_work & (_TIF_NEED_RESCHED |
    35					_TIF_NEED_RESCHED_LAZY |
    36					_TIF_HRTIMER_REARM)) == _TIF_HRTIMER_REARM)
  > 37				_hrtimer_rearm();
    38	
    39			local_irq_enable_exit_to_user(ti_work);
    40	
    41			if (ti_work & (_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY))
    42				schedule();
    43	
    44			if (ti_work & _TIF_UPROBE)
    45				uprobe_notify_resume(regs);
    46	
    47			if (ti_work & _TIF_PATCH_PENDING)
    48				klp_update_patch_state(current);
    49	
    50			if (ti_work & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL))
    51				arch_do_signal_or_restart(regs);
    52	
    53			if (ti_work & _TIF_NOTIFY_RESUME)
    54				resume_user_mode_work(regs);
    55	
    56			/* Architecture specific TIF work */
    57			arch_exit_to_user_mode_work(regs, ti_work);
    58	
    59			/*
    60			 * Disable interrupts and reevaluate the work flags as they
    61			 * might have changed while interrupts and preemption was
    62			 * enabled above.
    63			 */
    64			local_irq_disable_exit_to_user();
    65	
    66			/* Check if any of the above work has queued a deferred wakeup */
    67			tick_nohz_user_enter_prepare();
    68	
    69			ti_work = read_thread_flags();
    70		}
    71	
    72		/* Return the latest work state for arch_exit_to_user_mode() */
    73		return ti_work;
    74	}
    75	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
