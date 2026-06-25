Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1692772E;
	Thu, 25 Jun 2026 00:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782345951; cv=none; b=bjYcJTCyz91EJ2aTP9K6ga0NME3TB+RhxDSkWk7lrvYRQr2A+GVR6JwLaZUSEnIqQEH+J8Q0/LqSMDPVrmDGdmk91E/GgVQLIKb7ReF/OJZ8WhAdtN14wXIahFaP8ngYC5ZWDg/HeQqXidLwun1fuyIkv5VfYsDxz9CCec/yH3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782345951; c=relaxed/simple;
	bh=gpECKjrw6VQyU0vLaOV/Jkkr0/OL439SvPUww6iOXCw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OUXBxzTZFTdjEyO5PUmZao84DWbE8GWffGaojHkH9lLs+e+XqlLn4r6rD2TbnUKFsQAltYZiQd0qEYUh5vdK1VCZX8O2Q86d69B4xkAmeZUYeQRJrhzOw42pewkbTG2MppnPz/kV4h0FgI1v+7KXHdsz/InracIFr+uWgfHIveo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nqYPAPPi; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nqYPAPPi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782345949; x=1813881949;
  h=date:from:to:cc:subject:message-id;
  bh=gpECKjrw6VQyU0vLaOV/Jkkr0/OL439SvPUww6iOXCw=;
  b=nqYPAPPitROPssgwbALep8QGyQq5M1KFtWxuQcAa7/zwarocSQaZT3Lp
   eF+TtADRRregXFiGN+CGtQLhoZBpMV2DJcOR9a84vDr4wnoVsuHpx+yW4
   Mck8i51kfzaLz6DN0VEjtIWdybotRmhKk3Sxg5j5YwroJwuM3SrUoTpw3
   0bxRBOwHJGzLNVLGEpRaj9NqLIED/J5YmY0hDK+tr4kHXUVWmN2XiJEFV
   GJBtlW3LG2zuuu828Qt7WLeGX8M1VW8Ye0SEi+SIWkLrhweRLPi3cCroV
   dqzmfMqZKlsIgMmP/5onMNhZItrgtrHx/5FHzI0ohZpglSsSgSz+MBNsa
   Q==;
X-CSE-ConnectionGUID: N6YMV/vkS5KGFhezL+Rrgw==
X-CSE-MsgGUID: AyuurW56RFaOfcU0ROrLnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="100669831"
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="100669831"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 17:05:48 -0700
X-CSE-ConnectionGUID: uAwxuz9qTQSUAXPk4lrn6w==
X-CSE-MsgGUID: NcWAgEsmTpyRudA3oyD7TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="255004677"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 24 Jun 2026 17:05:46 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcXbE-000000003m1-18Wx;
	Thu, 25 Jun 2026 00:05:44 +0000
Date: Thu, 25 Jun 2026 08:04:45 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [trace:trace/fixes 1/2] kernel/torture.c:665:3: error: call
 to undeclared function 'tracing_off'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202606250752.nfAGUJol-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace trace/fixes
head:   9cbc3d9806d31abda2718ceac587ddee3a04849b
commit: b48f507ce7b25e1903d4a7330d9ad6171ba4feed [1/2] tracing: Move non-trace_printk prototypes into trace_controls.h
config: x86_64-randconfig-072-20260625 (https://download.01.org/0day-ci/archive/20260625/202606250752.nfAGUJol-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260625/202606250752.nfAGUJol-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606250752.nfAGUJol-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/torture.c:665:3: error: call to undeclared function 'tracing_off'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     665 |                 rcu_ftrace_dump(DUMP_ALL);
         |                 ^
   kernel/rcu/rcu.h:337:3: note: expanded from macro 'rcu_ftrace_dump'
     337 |                 tracing_off(); \
         |                 ^
>> kernel/torture.c:665:3: error: call to undeclared function 'ftrace_dump'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   kernel/rcu/rcu.h:339:3: note: expanded from macro 'rcu_ftrace_dump'
     339 |                 ftrace_dump(oops_dump_mode); \
         |                 ^
>> kernel/torture.c:665:19: error: use of undeclared identifier 'DUMP_ALL'
     665 |                 rcu_ftrace_dump(DUMP_ALL);
         |                                 ^~~~~~~~
   3 errors generated.
--
>> kernel/rcu/rcuscale.c:609:5: error: call to undeclared function 'tracing_off'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     609 |                                 rcu_ftrace_dump(DUMP_ALL);
         |                                 ^
   kernel/rcu/rcu.h:337:3: note: expanded from macro 'rcu_ftrace_dump'
     337 |                 tracing_off(); \
         |                 ^
>> kernel/rcu/rcuscale.c:609:5: error: call to undeclared function 'ftrace_dump'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   kernel/rcu/rcu.h:339:3: note: expanded from macro 'rcu_ftrace_dump'
     339 |                 ftrace_dump(oops_dump_mode); \
         |                 ^
>> kernel/rcu/rcuscale.c:609:21: error: use of undeclared identifier 'DUMP_ALL'
     609 |                                 rcu_ftrace_dump(DUMP_ALL);
         |                                                 ^~~~~~~~
   3 errors generated.


vim +/tracing_off +665 kernel/torture.c

b5daa8f3b3b2b0 Paul E. McKenney 2014-01-30  629  
e991dbc0770b01 Paul E. McKenney 2014-01-31  630  /*
e991dbc0770b01 Paul E. McKenney 2014-01-31  631   * Cause the torture test to shutdown the system after the test has
e991dbc0770b01 Paul E. McKenney 2014-01-31  632   * run for the time specified by the shutdown_secs parameter.
e991dbc0770b01 Paul E. McKenney 2014-01-31  633   */
e991dbc0770b01 Paul E. McKenney 2014-01-31  634  static int torture_shutdown(void *arg)
e991dbc0770b01 Paul E. McKenney 2014-01-31  635  {
31257c3c8b7307 Paul E. McKenney 2016-06-18  636  	ktime_t ktime_snap;
e991dbc0770b01 Paul E. McKenney 2014-01-31  637  
e991dbc0770b01 Paul E. McKenney 2014-01-31  638  	VERBOSE_TOROUT_STRING("torture_shutdown task started");
31257c3c8b7307 Paul E. McKenney 2016-06-18  639  	ktime_snap = ktime_get();
31257c3c8b7307 Paul E. McKenney 2016-06-18  640  	while (ktime_before(ktime_snap, shutdown_time) &&
e991dbc0770b01 Paul E. McKenney 2014-01-31  641  	       !torture_must_stop()) {
e991dbc0770b01 Paul E. McKenney 2014-01-31  642  		if (verbose)
e991dbc0770b01 Paul E. McKenney 2014-01-31  643  			pr_alert("%s" TORTURE_FLAG
31257c3c8b7307 Paul E. McKenney 2016-06-18  644  				 "torture_shutdown task: %llu ms remaining\n",
31257c3c8b7307 Paul E. McKenney 2016-06-18  645  				 torture_type,
31257c3c8b7307 Paul E. McKenney 2016-06-18  646  				 ktime_ms_delta(shutdown_time, ktime_snap));
31257c3c8b7307 Paul E. McKenney 2016-06-18  647  		set_current_state(TASK_INTERRUPTIBLE);
31257c3c8b7307 Paul E. McKenney 2016-06-18  648  		schedule_hrtimeout(&shutdown_time, HRTIMER_MODE_ABS);
31257c3c8b7307 Paul E. McKenney 2016-06-18  649  		ktime_snap = ktime_get();
e991dbc0770b01 Paul E. McKenney 2014-01-31  650  	}
e991dbc0770b01 Paul E. McKenney 2014-01-31  651  	if (torture_must_stop()) {
7fafaac5b9ce22 Paul E. McKenney 2014-01-31  652  		torture_kthread_stopping("torture_shutdown");
e991dbc0770b01 Paul E. McKenney 2014-01-31  653  		return 0;
e991dbc0770b01 Paul E. McKenney 2014-01-31  654  	}
e991dbc0770b01 Paul E. McKenney 2014-01-31  655  
e991dbc0770b01 Paul E. McKenney 2014-01-31  656  	/* OK, shut down the system. */
e991dbc0770b01 Paul E. McKenney 2014-01-31  657  
e991dbc0770b01 Paul E. McKenney 2014-01-31  658  	VERBOSE_TOROUT_STRING("torture_shutdown task shutting down system");
e991dbc0770b01 Paul E. McKenney 2014-01-31  659  	shutdown_task = NULL;	/* Avoid self-kill deadlock. */
f881825a73543e Paul E. McKenney 2014-02-07  660  	if (torture_shutdown_hook)
f881825a73543e Paul E. McKenney 2014-02-07  661  		torture_shutdown_hook();
f881825a73543e Paul E. McKenney 2014-02-07  662  	else
f881825a73543e Paul E. McKenney 2014-02-07  663  		VERBOSE_TOROUT_STRING("No torture_shutdown_hook(), skipping.");
2102ad290af061 Paul E. McKenney 2020-06-16  664  	if (ftrace_dump_at_shutdown)
dac95906003fec Paul E. McKenney 2017-10-04 @665  		rcu_ftrace_dump(DUMP_ALL);
e991dbc0770b01 Paul E. McKenney 2014-01-31  666  	kernel_power_off();	/* Shut down the system. */
e991dbc0770b01 Paul E. McKenney 2014-01-31  667  	return 0;
e991dbc0770b01 Paul E. McKenney 2014-01-31  668  }
e991dbc0770b01 Paul E. McKenney 2014-01-31  669  

:::::: The code at line 665 was first introduced by commit
:::::: dac95906003fec1b4801115830cc14ec61c74960 torture: Suppress CPU stall warnings during shutdown ftrace dump

:::::: TO: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
:::::: CC: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
