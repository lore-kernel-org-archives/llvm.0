Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260D3398;
	Fri, 18 Aug 2023 02:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692326664; x=1723862664;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OErw6GHgHsHZi7xRNQ7tWTyOfucxQ8W+VBeF++w/CDA=;
  b=P/irq7p1jFTv6f979y92c8tuQwvtbDrsju4h6+XJZCM038YEOGvmRmB5
   XqPbiienrQuzWZ0gEvFBn+fWLy1eVNowtDWAJf0wJv72PpkEyiAgEuIWr
   w8y/0mi/L41SnwP1n8ikxOEi2GcZFOPakt3pb2TzRi5GlUgelL0QQtlJt
   5TneKxrxl7A1Inj7mblW7Rzrt5ZcKDBnkdFCQOKVCsBgv5VNziqw0N7QA
   HzdyHUHM9G8oSglyN2AEIMW3FjXSDwP06kDvbQ59sNY4+l0942wB14Ngc
   pQD43JKntd+CQ6BpOsjQYQTDsBzyXKfC8iw1Dc1gZKe5kp911PZb1X5e8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="376752335"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="376752335"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 19:44:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="981459300"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="981459300"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 17 Aug 2023 19:44:20 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWpTH-000214-2e;
	Fri, 18 Aug 2023 02:44:19 +0000
Date: Fri, 18 Aug 2023 10:43:20 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-6.1.y 5966/8698] kernel/time/tick-broadcast.c:1022:
 warning: Function parameter or member 'from_periodic' not described in
 'tick_broadcast_setup_oneshot'
Message-ID: <202308181027.T3DacITg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-6.1.y
head:   6c44e13dc284f7f4db17706ca48fd016d6b3d49a
commit: a84b08314f441b1433cef6bd216c343e875e0ddc [5966/8698] tick/broadcast: Make broadcast device replacement work correctly
config: i386-randconfig-i001-20230817 (https://download.01.org/0day-ci/archive/20230818/202308181027.T3DacITg-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230818/202308181027.T3DacITg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308181027.T3DacITg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/time/tick-broadcast.c:1022: warning: Function parameter or member 'bc' not described in 'tick_broadcast_setup_oneshot'
>> kernel/time/tick-broadcast.c:1022: warning: Function parameter or member 'from_periodic' not described in 'tick_broadcast_setup_oneshot'


vim +1022 kernel/time/tick-broadcast.c

f73f64d5687192b Thomas Gleixner 2020-11-17  1016  
79bf2bb335b85db Thomas Gleixner 2007-02-16  1017  /**
8dce39c231af554 Li Zefan        2007-11-05  1018   * tick_broadcast_setup_oneshot - setup the broadcast device
79bf2bb335b85db Thomas Gleixner 2007-02-16  1019   */
a84b08314f441b1 Thomas Gleixner 2023-05-06  1020  static void tick_broadcast_setup_oneshot(struct clock_event_device *bc,
a84b08314f441b1 Thomas Gleixner 2023-05-06  1021  					 bool from_periodic)
79bf2bb335b85db Thomas Gleixner 2007-02-16 @1022  {
07f4beb0b5bbfaf Thomas Gleixner 2011-05-16  1023  	int cpu = smp_processor_id();
a84b08314f441b1 Thomas Gleixner 2023-05-06  1024  	ktime_t nexttick = 0;
07f4beb0b5bbfaf Thomas Gleixner 2011-05-16  1025  
c1a9eeb938b5433 Thomas Gleixner 2016-12-15  1026  	if (!bc)
c1a9eeb938b5433 Thomas Gleixner 2016-12-15  1027  		return;
c1a9eeb938b5433 Thomas Gleixner 2016-12-15  1028  
a84b08314f441b1 Thomas Gleixner 2023-05-06  1029  	/*
a84b08314f441b1 Thomas Gleixner 2023-05-06  1030  	 * When the broadcast device was switched to oneshot by the first
a84b08314f441b1 Thomas Gleixner 2023-05-06  1031  	 * CPU handling the NOHZ change, the other CPUs will reach this
a84b08314f441b1 Thomas Gleixner 2023-05-06  1032  	 * code via hrtimer_run_queues() -> tick_check_oneshot_change()
a84b08314f441b1 Thomas Gleixner 2023-05-06  1033  	 * too. Set up the broadcast device only once!
a84b08314f441b1 Thomas Gleixner 2023-05-06  1034  	 */
a84b08314f441b1 Thomas Gleixner 2023-05-06  1035  	if (bc->event_handler == tick_handle_oneshot_broadcast) {
a84b08314f441b1 Thomas Gleixner 2023-05-06  1036  		/*
a84b08314f441b1 Thomas Gleixner 2023-05-06  1037  		 * The CPU which switched from periodic to oneshot mode
a84b08314f441b1 Thomas Gleixner 2023-05-06  1038  		 * set the broadcast oneshot bit for all other CPUs which
a84b08314f441b1 Thomas Gleixner 2023-05-06  1039  		 * are in the general (periodic) broadcast mask to ensure
a84b08314f441b1 Thomas Gleixner 2023-05-06  1040  		 * that CPUs which wait for the periodic broadcast are
a84b08314f441b1 Thomas Gleixner 2023-05-06  1041  		 * woken up.
a84b08314f441b1 Thomas Gleixner 2023-05-06  1042  		 *
a84b08314f441b1 Thomas Gleixner 2023-05-06  1043  		 * Clear the bit for the local CPU as the set bit would
a84b08314f441b1 Thomas Gleixner 2023-05-06  1044  		 * prevent the first tick_broadcast_enter() after this CPU
a84b08314f441b1 Thomas Gleixner 2023-05-06  1045  		 * switched to oneshot state to program the broadcast
a84b08314f441b1 Thomas Gleixner 2023-05-06  1046  		 * device.
a84b08314f441b1 Thomas Gleixner 2023-05-06  1047  		 *
a84b08314f441b1 Thomas Gleixner 2023-05-06  1048  		 * This code can also be reached via tick_broadcast_control(),
a84b08314f441b1 Thomas Gleixner 2023-05-06  1049  		 * but this cannot avoid the tick_broadcast_clear_oneshot()
a84b08314f441b1 Thomas Gleixner 2023-05-06  1050  		 * as that would break the periodic to oneshot transition of
a84b08314f441b1 Thomas Gleixner 2023-05-06  1051  		 * secondary CPUs. But that's harmless as the below only
a84b08314f441b1 Thomas Gleixner 2023-05-06  1052  		 * clears already cleared bits.
a84b08314f441b1 Thomas Gleixner 2023-05-06  1053  		 */
a84b08314f441b1 Thomas Gleixner 2023-05-06  1054  		tick_broadcast_clear_oneshot(cpu);
a84b08314f441b1 Thomas Gleixner 2023-05-06  1055  		return;
a84b08314f441b1 Thomas Gleixner 2023-05-06  1056  	}
a84b08314f441b1 Thomas Gleixner 2023-05-06  1057  
7300711e8c6824f Thomas Gleixner 2008-09-06  1058  
79bf2bb335b85db Thomas Gleixner 2007-02-16  1059  	bc->event_handler = tick_handle_oneshot_broadcast;
a84b08314f441b1 Thomas Gleixner 2023-05-06  1060  	bc->next_event = KTIME_MAX;
7300711e8c6824f Thomas Gleixner 2008-09-06  1061  
7300711e8c6824f Thomas Gleixner 2008-09-06  1062  	/*
a84b08314f441b1 Thomas Gleixner 2023-05-06  1063  	 * When the tick mode is switched from periodic to oneshot it must
a84b08314f441b1 Thomas Gleixner 2023-05-06  1064  	 * be ensured that CPUs which are waiting for periodic broadcast
a84b08314f441b1 Thomas Gleixner 2023-05-06  1065  	 * get their wake-up at the next tick.  This is achieved by ORing
a84b08314f441b1 Thomas Gleixner 2023-05-06  1066  	 * tick_broadcast_mask into tick_broadcast_oneshot_mask.
a84b08314f441b1 Thomas Gleixner 2023-05-06  1067  	 *
a84b08314f441b1 Thomas Gleixner 2023-05-06  1068  	 * For other callers, e.g. broadcast device replacement,
a84b08314f441b1 Thomas Gleixner 2023-05-06  1069  	 * tick_broadcast_oneshot_mask must not be touched as this would
a84b08314f441b1 Thomas Gleixner 2023-05-06  1070  	 * set bits for CPUs which are already NOHZ, but not idle. Their
a84b08314f441b1 Thomas Gleixner 2023-05-06  1071  	 * next tick_broadcast_enter() would observe the bit set and fail
a84b08314f441b1 Thomas Gleixner 2023-05-06  1072  	 * to update the expiry time and the broadcast event device.
7300711e8c6824f Thomas Gleixner 2008-09-06  1073  	 */
a84b08314f441b1 Thomas Gleixner 2023-05-06  1074  	if (from_periodic) {
b352bc1cbc29134 Thomas Gleixner 2013-03-05  1075  		cpumask_copy(tmpmask, tick_broadcast_mask);
a84b08314f441b1 Thomas Gleixner 2023-05-06  1076  		/* Remove the local CPU as it is obviously not idle */
b352bc1cbc29134 Thomas Gleixner 2013-03-05  1077  		cpumask_clear_cpu(cpu, tmpmask);
a84b08314f441b1 Thomas Gleixner 2023-05-06  1078  		cpumask_or(tick_broadcast_oneshot_mask, tick_broadcast_oneshot_mask, tmpmask);
7300711e8c6824f Thomas Gleixner 2008-09-06  1079  
a84b08314f441b1 Thomas Gleixner 2023-05-06  1080  		/*
a84b08314f441b1 Thomas Gleixner 2023-05-06  1081  		 * Ensure that the oneshot broadcast handler will wake the
a84b08314f441b1 Thomas Gleixner 2023-05-06  1082  		 * CPUs which are still waiting for periodic broadcast.
a84b08314f441b1 Thomas Gleixner 2023-05-06  1083  		 */
a84b08314f441b1 Thomas Gleixner 2023-05-06  1084  		nexttick = tick_get_next_period();
a84b08314f441b1 Thomas Gleixner 2023-05-06  1085  		tick_broadcast_init_next_event(tmpmask, nexttick);
f73f64d5687192b Thomas Gleixner 2020-11-17  1086  
07f4beb0b5bbfaf Thomas Gleixner 2011-05-16  1087  		/*
a84b08314f441b1 Thomas Gleixner 2023-05-06  1088  		 * If the underlying broadcast clock event device is
a84b08314f441b1 Thomas Gleixner 2023-05-06  1089  		 * already in oneshot state, then there is nothing to do.
a84b08314f441b1 Thomas Gleixner 2023-05-06  1090  		 * The device was already armed for the next tick
a84b08314f441b1 Thomas Gleixner 2023-05-06  1091  		 * in tick_handle_broadcast_periodic()
07f4beb0b5bbfaf Thomas Gleixner 2011-05-16  1092  		 */
a84b08314f441b1 Thomas Gleixner 2023-05-06  1093  		if (clockevent_state_oneshot(bc))
a84b08314f441b1 Thomas Gleixner 2023-05-06  1094  			return;
79bf2bb335b85db Thomas Gleixner 2007-02-16  1095  	}
a84b08314f441b1 Thomas Gleixner 2023-05-06  1096  
a84b08314f441b1 Thomas Gleixner 2023-05-06  1097  	/*
a84b08314f441b1 Thomas Gleixner 2023-05-06  1098  	 * When switching from periodic to oneshot mode arm the broadcast
a84b08314f441b1 Thomas Gleixner 2023-05-06  1099  	 * device for the next tick.
a84b08314f441b1 Thomas Gleixner 2023-05-06  1100  	 *
a84b08314f441b1 Thomas Gleixner 2023-05-06  1101  	 * If the broadcast device has been replaced in oneshot mode and
a84b08314f441b1 Thomas Gleixner 2023-05-06  1102  	 * the oneshot broadcast mask is not empty, then arm it to expire
a84b08314f441b1 Thomas Gleixner 2023-05-06  1103  	 * immediately in order to reevaluate the next expiring timer.
a84b08314f441b1 Thomas Gleixner 2023-05-06  1104  	 * @nexttick is 0 and therefore in the past which will cause the
a84b08314f441b1 Thomas Gleixner 2023-05-06  1105  	 * clockevent code to force an event.
a84b08314f441b1 Thomas Gleixner 2023-05-06  1106  	 *
a84b08314f441b1 Thomas Gleixner 2023-05-06  1107  	 * For both cases the programming can be avoided when the oneshot
a84b08314f441b1 Thomas Gleixner 2023-05-06  1108  	 * broadcast mask is empty.
a84b08314f441b1 Thomas Gleixner 2023-05-06  1109  	 *
a84b08314f441b1 Thomas Gleixner 2023-05-06  1110  	 * tick_broadcast_set_event() implicitly switches the broadcast
a84b08314f441b1 Thomas Gleixner 2023-05-06  1111  	 * device to oneshot state.
a84b08314f441b1 Thomas Gleixner 2023-05-06  1112  	 */
a84b08314f441b1 Thomas Gleixner 2023-05-06  1113  	if (!cpumask_empty(tick_broadcast_oneshot_mask))
a84b08314f441b1 Thomas Gleixner 2023-05-06  1114  		tick_broadcast_set_event(bc, cpu, nexttick);
9c17bcda9910003 Thomas Gleixner 2008-09-03  1115  }
79bf2bb335b85db Thomas Gleixner 2007-02-16  1116  

:::::: The code at line 1022 was first introduced by commit
:::::: 79bf2bb335b85db25d27421c798595a2fa2a0e82 [PATCH] tick-management: dyntick / highres functionality

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
