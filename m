Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE5B311C05;
	Fri, 12 Dec 2025 10:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765535813; cv=none; b=u4sECKrKIyafEWE5kcpowsLJxPTJyor+VcthbQtB1GwObQy5FmoTVEsT9DqpaTHyXLcVKmDLnpxZDWbnFPpWf+m3e0dInBcnUmA42Y9QN/tO0WVdPxfixKa5cBp7cMlUqV4YxYHq3iGNRuKUbOaRa3Y8HOYPzz26wfGvI0qxxfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765535813; c=relaxed/simple;
	bh=ZQX9lVtOUJoGNEM1pUVVXtSW7GhB7li/jlql0GO4K18=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=be772zifq59dc9siQnTxG2WggVvjClu0x0DF/Y14fbrwZTQp4i3wv0uRmTaAqZbXAWbG2EkhntJ27WATLl0jZxW4qVi9SWRDrP2YWgthluV/vbu20dxTc6vMzmZOIePChFkSzawvaEnNZnWEQDBeWFOgUQZzZpKUgBCuAfsq79c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dUVNAI+8; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dUVNAI+8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765535812; x=1797071812;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZQX9lVtOUJoGNEM1pUVVXtSW7GhB7li/jlql0GO4K18=;
  b=dUVNAI+850fAYsgseV+HU93kneD6rRFAhw9OLaD1nInGa6A8t1kwLvqH
   oMOVMI0fbgGpO+f19HP5ooXiZTY+yU24yQtg8FPmjfpWMj0dKTywgmuqU
   WXqQAvH4kx8R73kPU7LMxYHUT+34tMnrR9i9P/27D8BnUgvco4F5AqpBq
   NzD1XmRIm221cRxmwDbF/KCunCnMIjGvq6fnO4Shg+pjamOKQsXS3iG9e
   BJOD6VB5F5YX+gx244YVY4w0jqqgW5DD52w0hzBBDeqEqtL0wcJoZklwX
   ZICCtWvkKQzrinTNdqFR8mzfzzh9AF5sxk/WmRYHjMJjDzJhWkpNAAkLg
   g==;
X-CSE-ConnectionGUID: CU/Tw6E+STyaYbq3u5ALjg==
X-CSE-MsgGUID: 8VFJVw7qQci06Od0SMy4Bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="93002408"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="93002408"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 02:36:49 -0800
X-CSE-ConnectionGUID: VxfrFFmbQC2qUGZAjkQCuQ==
X-CSE-MsgGUID: X4oGMQYNTuu5MXwKqmD7OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="197110498"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Dec 2025 02:36:47 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU0Vw-000000005wL-3GKZ;
	Fri, 12 Dec 2025 10:36:44 +0000
Date: Fri, 12 Dec 2025 18:36:32 +0800
From: kernel test robot <lkp@intel.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>
Subject: drivers/perf/apple_m1_cpu_pmu.c:405:5: warning: variable 'evt' set
 but not used
Message-ID: <202512121812.rugQJJ4e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: 75ecffc361bbc85696c084f3d3c73eb207386e3f drivers/perf: apple_m1: Refactor event select/filter configuration
date:   9 months ago
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251212/202512121812.rugQJJ4e-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512121812.rugQJJ4e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512121812.rugQJJ4e-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |                                                                   ^~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:27:22: note: expanded from macro 'ONLY_2_4_6'
      27 | #define ONLY_2_4_6                      (BIT(2) | BIT(4) | BIT(6))
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:132:35: note: previous initialization is here
     132 |         [0 ... M1_PMU_PERFCTR_LAST]                             = ANY_BUT_0_1,
         |                                                                   ^~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:25:23: note: expanded from macro 'ANY_BUT_0_1'
      25 | #define ANY_BUT_0_1                     GENMASK(9, 2)
         |                                         ^~~~~~~~~~~~~
   include/linux/bits.h:34:2: note: expanded from macro 'GENMASK'
      34 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:163:35: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     163 |         [M1_PMU_PERFCTR_UNKNOWN_f8]                             = ONLY_2_TO_7,
         |                                                                   ^~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:26:23: note: expanded from macro 'ONLY_2_TO_7'
      26 | #define ONLY_2_TO_7                     GENMASK(7, 2)
         |                                         ^~~~~~~~~~~~~
   include/linux/bits.h:34:2: note: expanded from macro 'GENMASK'
      34 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:132:35: note: previous initialization is here
     132 |         [0 ... M1_PMU_PERFCTR_LAST]                             = ANY_BUT_0_1,
         |                                                                   ^~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:25:23: note: expanded from macro 'ANY_BUT_0_1'
      25 | #define ANY_BUT_0_1                     GENMASK(9, 2)
         |                                         ^~~~~~~~~~~~~
   include/linux/bits.h:34:2: note: expanded from macro 'GENMASK'
      34 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:164:35: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     164 |         [M1_PMU_PERFCTR_UNKNOWN_fd]                             = ONLY_2_4_6,
         |                                                                   ^~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:27:22: note: expanded from macro 'ONLY_2_4_6'
      27 | #define ONLY_2_4_6                      (BIT(2) | BIT(4) | BIT(6))
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:132:35: note: previous initialization is here
     132 |         [0 ... M1_PMU_PERFCTR_LAST]                             = ANY_BUT_0_1,
         |                                                                   ^~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:25:23: note: expanded from macro 'ANY_BUT_0_1'
      25 | #define ANY_BUT_0_1                     GENMASK(9, 2)
         |                                         ^~~~~~~~~~~~~
   include/linux/bits.h:34:2: note: expanded from macro 'GENMASK'
      34 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:169:32: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     169 |         [PERF_COUNT_HW_CPU_CYCLES]              = M1_PMU_PERFCTR_CORE_ACTIVE_CYCLE,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:168:2: note: previous initialization is here
     168 |         PERF_MAP_ALL_UNSUPPORTED,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:44:34: note: expanded from macro 'PERF_MAP_ALL_UNSUPPORTED'
      44 |         [0 ... PERF_COUNT_HW_MAX - 1] = HW_OP_UNSUPPORTED
         |                                         ^~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:39:28: note: expanded from macro 'HW_OP_UNSUPPORTED'
      39 | #define HW_OP_UNSUPPORTED               0xFFFF
         |                                         ^~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:170:34: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     170 |         [PERF_COUNT_HW_INSTRUCTIONS]            = M1_PMU_PERFCTR_INST_ALL,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:168:2: note: previous initialization is here
     168 |         PERF_MAP_ALL_UNSUPPORTED,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:44:34: note: expanded from macro 'PERF_MAP_ALL_UNSUPPORTED'
      44 |         [0 ... PERF_COUNT_HW_MAX - 1] = HW_OP_UNSUPPORTED
         |                                         ^~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:39:28: note: expanded from macro 'HW_OP_UNSUPPORTED'
      39 | #define HW_OP_UNSUPPORTED               0xFFFF
         |                                         ^~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:171:40: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     171 |         [PERF_COUNT_HW_BRANCH_INSTRUCTIONS]     = M1_PMU_PERFCTR_INST_BRANCH,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:168:2: note: previous initialization is here
     168 |         PERF_MAP_ALL_UNSUPPORTED,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:44:34: note: expanded from macro 'PERF_MAP_ALL_UNSUPPORTED'
      44 |         [0 ... PERF_COUNT_HW_MAX - 1] = HW_OP_UNSUPPORTED
         |                                         ^~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:39:28: note: expanded from macro 'HW_OP_UNSUPPORTED'
      39 | #define HW_OP_UNSUPPORTED               0xFFFF
         |                                         ^~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:172:35: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     172 |         [PERF_COUNT_HW_BRANCH_MISSES]           = M1_PMU_PERFCTR_BRANCH_MISPRED_NONSPEC,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:168:2: note: previous initialization is here
     168 |         PERF_MAP_ALL_UNSUPPORTED,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:44:34: note: expanded from macro 'PERF_MAP_ALL_UNSUPPORTED'
      44 |         [0 ... PERF_COUNT_HW_MAX - 1] = HW_OP_UNSUPPORTED
         |                                         ^~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:39:28: note: expanded from macro 'HW_OP_UNSUPPORTED'
      39 | #define HW_OP_UNSUPPORTED               0xFFFF
         |                                         ^~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:404:7: warning: variable 'user' set but not used [-Wunused-but-set-variable]
     404 |         bool user, kernel;
         |              ^
   drivers/perf/apple_m1_cpu_pmu.c:404:13: warning: variable 'kernel' set but not used [-Wunused-but-set-variable]
     404 |         bool user, kernel;
         |                    ^
>> drivers/perf/apple_m1_cpu_pmu.c:405:5: warning: variable 'evt' set but not used [-Wunused-but-set-variable]
     405 |         u8 evt;
         |            ^
   39 warnings generated.


vim +/evt +405 drivers/perf/apple_m1_cpu_pmu.c

75ecffc361bbc8 Oliver Upton 2025-03-05  400  
a639027a1be1d6 Marc Zyngier 2022-02-08  401  /* arm_pmu backend */
a639027a1be1d6 Marc Zyngier 2022-02-08  402  static void m1_pmu_enable_event(struct perf_event *event)
a639027a1be1d6 Marc Zyngier 2022-02-08  403  {
a639027a1be1d6 Marc Zyngier 2022-02-08  404  	bool user, kernel;
a639027a1be1d6 Marc Zyngier 2022-02-08 @405  	u8 evt;
a639027a1be1d6 Marc Zyngier 2022-02-08  406  
a639027a1be1d6 Marc Zyngier 2022-02-08  407  	evt = event->hw.config_base & M1_PMU_CFG_EVENT;
a639027a1be1d6 Marc Zyngier 2022-02-08  408  	user = event->hw.config_base & M1_PMU_CFG_COUNT_USER;
a639027a1be1d6 Marc Zyngier 2022-02-08  409  	kernel = event->hw.config_base & M1_PMU_CFG_COUNT_KERNEL;
a639027a1be1d6 Marc Zyngier 2022-02-08  410  
a639027a1be1d6 Marc Zyngier 2022-02-08  411  	m1_pmu_disable_counter_interrupt(event->hw.idx);
a639027a1be1d6 Marc Zyngier 2022-02-08  412  	m1_pmu_disable_counter(event->hw.idx);
a639027a1be1d6 Marc Zyngier 2022-02-08  413  	isb();
a639027a1be1d6 Marc Zyngier 2022-02-08  414  
75ecffc361bbc8 Oliver Upton 2025-03-05  415  	m1_pmu_configure_counter(event->hw.idx, event->hw.config_base);
a639027a1be1d6 Marc Zyngier 2022-02-08  416  	m1_pmu_enable_counter(event->hw.idx);
a639027a1be1d6 Marc Zyngier 2022-02-08  417  	m1_pmu_enable_counter_interrupt(event->hw.idx);
a639027a1be1d6 Marc Zyngier 2022-02-08  418  	isb();
a639027a1be1d6 Marc Zyngier 2022-02-08  419  }
a639027a1be1d6 Marc Zyngier 2022-02-08  420  

:::::: The code at line 405 was first introduced by commit
:::::: a639027a1be1d68437e1c2cac6ed16306c84ab3c drivers/perf: Add Apple icestorm/firestorm CPU PMU driver

:::::: TO: Marc Zyngier <maz@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
