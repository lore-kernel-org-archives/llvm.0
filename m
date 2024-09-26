Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74A2C125;
	Thu, 26 Sep 2024 01:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727315571; cv=none; b=QmwkW0a3Lt5Fd1lG/tERDGWg5z6/q+iXmJ3djtVzxbalEUBI4a52J8ipstn0M7tD8jQrXEP8NHSvIdJbhUqxd6VCGB1lyxrVSQtcNyw8uCpH1AXvS1XWP3eESG+AKPp9miWQ4lWwB+CWgNoAaoUcS6S3oZgB1bdzZSoP5ClFWlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727315571; c=relaxed/simple;
	bh=1XDKTN87rJiLCRBaAQdGIlhar7o0IVLqFLhz55xUX9I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IjZrXW7G032KScSzVAmM/oVXshtGgEWThaaO0bhBDK12WBTq52NSeBlXc7ZJAuXjAdRjxEnmvLWaW673ZUEhTxehRBpzfogrbDRQd+5mO9FFN6sjO+45ae/EcXyZzt8iBDOPtrbNclk/e/1BV3enGSALscAGgdveAOOyObX3Mic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nZNIfaTk; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nZNIfaTk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727315570; x=1758851570;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1XDKTN87rJiLCRBaAQdGIlhar7o0IVLqFLhz55xUX9I=;
  b=nZNIfaTk3tpeyCgrcyoZF0bz1duPyXL3yyms0trOaSUTBFX318SHAOeC
   RAknNl2zOzLvfeMljOVY4ipjS/CwuHqu9vThAJPV/pJ1lboo9d0TlS8mr
   ZO8sUoNW/EFECp5iDjEUJ9JGTb6RjsEEf78F/grvXu0xE6oJ47+Zhfgyo
   +3t7pK1df+ZNhwUEuUO+wiO82N3ANSjobcyCnGEIJCIDctfprVRezsasw
   UJACjZ8evVBqR4BV6aqd6c386ghbtvlQuTJ2tHhIybkykVw3B8D7/Z321
   tM+2rmbHkt5NCkZ1UkfXo1HKDFOk1qzXw5eJT3j1pQfImAm4QWic8f7Gx
   A==;
X-CSE-ConnectionGUID: H78YaJjWQveJDXmnCaNkfQ==
X-CSE-MsgGUID: 43n3hfyDRL6UXKLTt1AmuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="14015127"
X-IronPort-AV: E=Sophos;i="6.10,259,1719903600"; 
   d="scan'208";a="14015127"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 18:52:49 -0700
X-CSE-ConnectionGUID: hPt5lHl2RLecmtoD0D2suw==
X-CSE-MsgGUID: i0FOnL8mR3eEtcxGOop9Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,259,1719903600"; 
   d="scan'208";a="72271619"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 25 Sep 2024 18:52:47 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stdgS-000K7Z-1r;
	Thu, 26 Sep 2024 01:52:44 +0000
Date: Thu, 26 Sep 2024 09:52:27 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mark:perf/overflow 1/3] drivers/perf/arm_xscale_pmu.c:490:2: error:
 use of undeclared identifier 'regs'
Message-ID: <202409260959.0FgHD18l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git perf/overflow
head:   06cbb8d243d9460a076f27bcd65e20f315ff8548
commit: 63eb790cce010268faf55e9844a7688bb9da6b1a [1/3] arm_pmu: centralise event overflow handling
config: arm-randconfig-004-20240926 (https://download.01.org/0day-ci/archive/20240926/202409260959.0FgHD18l-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7773243d9916f98ba0ffce0c3a960e4aa9f03e81)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240926/202409260959.0FgHD18l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409260959.0FgHD18l-lkp@intel.com/

All errors (new ones prefixed by >>):

         |                                             ^~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:41:31: note: expanded from macro 'CACHE_OP_UNSUPPORTED'
      41 | #define CACHE_OP_UNSUPPORTED            0xFFFF
         |                                         ^~~~~~
   drivers/perf/arm_xscale_pmu.c:74:41: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
      74 |         [C(L1D)][C(OP_READ)][C(RESULT_MISS)]    = XSCALE_PERFCTR_DCACHE_MISS,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/arm_xscale_pmu.c:71:2: note: previous initialization is here
      71 |         PERF_CACHE_MAP_ALL_UNSUPPORTED,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:49:31: note: expanded from macro 'PERF_CACHE_MAP_ALL_UNSUPPORTED'
      49 |                 [0 ... C(RESULT_MAX) - 1] = CACHE_OP_UNSUPPORTED,       \
         |                                             ^~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:41:31: note: expanded from macro 'CACHE_OP_UNSUPPORTED'
      41 | #define CACHE_OP_UNSUPPORTED            0xFFFF
         |                                         ^~~~~~
   drivers/perf/arm_xscale_pmu.c:75:44: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
      75 |         [C(L1D)][C(OP_WRITE)][C(RESULT_ACCESS)] = XSCALE_PERFCTR_DCACHE_ACCESS,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/arm_xscale_pmu.c:71:2: note: previous initialization is here
      71 |         PERF_CACHE_MAP_ALL_UNSUPPORTED,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:49:31: note: expanded from macro 'PERF_CACHE_MAP_ALL_UNSUPPORTED'
      49 |                 [0 ... C(RESULT_MAX) - 1] = CACHE_OP_UNSUPPORTED,       \
         |                                             ^~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:41:31: note: expanded from macro 'CACHE_OP_UNSUPPORTED'
      41 | #define CACHE_OP_UNSUPPORTED            0xFFFF
         |                                         ^~~~~~
   drivers/perf/arm_xscale_pmu.c:76:42: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
      76 |         [C(L1D)][C(OP_WRITE)][C(RESULT_MISS)]   = XSCALE_PERFCTR_DCACHE_MISS,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/arm_xscale_pmu.c:71:2: note: previous initialization is here
      71 |         PERF_CACHE_MAP_ALL_UNSUPPORTED,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:49:31: note: expanded from macro 'PERF_CACHE_MAP_ALL_UNSUPPORTED'
      49 |                 [0 ... C(RESULT_MAX) - 1] = CACHE_OP_UNSUPPORTED,       \
         |                                             ^~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:41:31: note: expanded from macro 'CACHE_OP_UNSUPPORTED'
      41 | #define CACHE_OP_UNSUPPORTED            0xFFFF
         |                                         ^~~~~~
   drivers/perf/arm_xscale_pmu.c:78:41: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
      78 |         [C(L1I)][C(OP_READ)][C(RESULT_MISS)]    = XSCALE_PERFCTR_ICACHE_MISS,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/arm_xscale_pmu.c:71:2: note: previous initialization is here
      71 |         PERF_CACHE_MAP_ALL_UNSUPPORTED,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:49:31: note: expanded from macro 'PERF_CACHE_MAP_ALL_UNSUPPORTED'
      49 |                 [0 ... C(RESULT_MAX) - 1] = CACHE_OP_UNSUPPORTED,       \
         |                                             ^~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:41:31: note: expanded from macro 'CACHE_OP_UNSUPPORTED'
      41 | #define CACHE_OP_UNSUPPORTED            0xFFFF
         |                                         ^~~~~~
   drivers/perf/arm_xscale_pmu.c:80:42: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
      80 |         [C(DTLB)][C(OP_READ)][C(RESULT_MISS)]   = XSCALE_PERFCTR_DTLB_MISS,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/arm_xscale_pmu.c:71:2: note: previous initialization is here
      71 |         PERF_CACHE_MAP_ALL_UNSUPPORTED,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:49:31: note: expanded from macro 'PERF_CACHE_MAP_ALL_UNSUPPORTED'
      49 |                 [0 ... C(RESULT_MAX) - 1] = CACHE_OP_UNSUPPORTED,       \
         |                                             ^~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:41:31: note: expanded from macro 'CACHE_OP_UNSUPPORTED'
      41 | #define CACHE_OP_UNSUPPORTED            0xFFFF
         |                                         ^~~~~~
   drivers/perf/arm_xscale_pmu.c:81:43: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
      81 |         [C(DTLB)][C(OP_WRITE)][C(RESULT_MISS)]  = XSCALE_PERFCTR_DTLB_MISS,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/arm_xscale_pmu.c:71:2: note: previous initialization is here
      71 |         PERF_CACHE_MAP_ALL_UNSUPPORTED,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:49:31: note: expanded from macro 'PERF_CACHE_MAP_ALL_UNSUPPORTED'
      49 |                 [0 ... C(RESULT_MAX) - 1] = CACHE_OP_UNSUPPORTED,       \
         |                                             ^~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:41:31: note: expanded from macro 'CACHE_OP_UNSUPPORTED'
      41 | #define CACHE_OP_UNSUPPORTED            0xFFFF
         |                                         ^~~~~~
   drivers/perf/arm_xscale_pmu.c:83:42: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
      83 |         [C(ITLB)][C(OP_READ)][C(RESULT_MISS)]   = XSCALE_PERFCTR_ITLB_MISS,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/arm_xscale_pmu.c:71:2: note: previous initialization is here
      71 |         PERF_CACHE_MAP_ALL_UNSUPPORTED,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:49:31: note: expanded from macro 'PERF_CACHE_MAP_ALL_UNSUPPORTED'
      49 |                 [0 ... C(RESULT_MAX) - 1] = CACHE_OP_UNSUPPORTED,       \
         |                                             ^~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:41:31: note: expanded from macro 'CACHE_OP_UNSUPPORTED'
      41 | #define CACHE_OP_UNSUPPORTED            0xFFFF
         |                                         ^~~~~~
   drivers/perf/arm_xscale_pmu.c:84:43: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
      84 |         [C(ITLB)][C(OP_WRITE)][C(RESULT_MISS)]  = XSCALE_PERFCTR_ITLB_MISS,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/arm_xscale_pmu.c:71:2: note: previous initialization is here
      71 |         PERF_CACHE_MAP_ALL_UNSUPPORTED,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:49:31: note: expanded from macro 'PERF_CACHE_MAP_ALL_UNSUPPORTED'
      49 |                 [0 ... C(RESULT_MAX) - 1] = CACHE_OP_UNSUPPORTED,       \
         |                                             ^~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:41:31: note: expanded from macro 'CACHE_OP_UNSUPPORTED'
      41 | #define CACHE_OP_UNSUPPORTED            0xFFFF
         |                                         ^~~~~~
>> drivers/perf/arm_xscale_pmu.c:490:2: error: use of undeclared identifier 'regs'
     490 |         regs = get_irq_regs();
         |         ^
   15 warnings and 1 error generated.


vim +/regs +490 drivers/perf/arm_xscale_pmu.c

43eab87828fee6 arch/arm/kernel/perf_event_xscale.c Will Deacon       2010-11-13  470  
43eab87828fee6 arch/arm/kernel/perf_event_xscale.c Will Deacon       2010-11-13  471  static irqreturn_t
0788f1e97324d8 arch/arm/kernel/perf_event_xscale.c Mark Rutland      2018-05-10  472  xscale2pmu_handle_irq(struct arm_pmu *cpu_pmu)
43eab87828fee6 arch/arm/kernel/perf_event_xscale.c Will Deacon       2010-11-13  473  {
43eab87828fee6 arch/arm/kernel/perf_event_xscale.c Will Deacon       2010-11-13  474  	unsigned long pmnc, of_flags;
11679250860700 arch/arm/kernel/perf_event_xscale.c Mark Rutland      2014-05-13  475  	struct pmu_hw_events *cpuc = this_cpu_ptr(cpu_pmu->hw_events);
43eab87828fee6 arch/arm/kernel/perf_event_xscale.c Will Deacon       2010-11-13  476  	int idx;
43eab87828fee6 arch/arm/kernel/perf_event_xscale.c Will Deacon       2010-11-13  477  
43eab87828fee6 arch/arm/kernel/perf_event_xscale.c Will Deacon       2010-11-13  478  	/* Disable the PMU. */
43eab87828fee6 arch/arm/kernel/perf_event_xscale.c Will Deacon       2010-11-13  479  	pmnc = xscale2pmu_read_pmnc();
43eab87828fee6 arch/arm/kernel/perf_event_xscale.c Will Deacon       2010-11-13  480  	xscale2pmu_write_pmnc(pmnc & ~XSCALE_PMU_ENABLE);
43eab87828fee6 arch/arm/kernel/perf_event_xscale.c Will Deacon       2010-11-13  481  
43eab87828fee6 arch/arm/kernel/perf_event_xscale.c Will Deacon       2010-11-13  482  	/* Check the overflow flag register. */
43eab87828fee6 arch/arm/kernel/perf_event_xscale.c Will Deacon       2010-11-13  483  	of_flags = xscale2pmu_read_overflow_flags();
43eab87828fee6 arch/arm/kernel/perf_event_xscale.c Will Deacon       2010-11-13  484  	if (!(of_flags & XSCALE2_OVERFLOWED_MASK))
43eab87828fee6 arch/arm/kernel/perf_event_xscale.c Will Deacon       2010-11-13  485  		return IRQ_NONE;
43eab87828fee6 arch/arm/kernel/perf_event_xscale.c Will Deacon       2010-11-13  486  
43eab87828fee6 arch/arm/kernel/perf_event_xscale.c Will Deacon       2010-11-13  487  	/* Clear the overflow bits. */
43eab87828fee6 arch/arm/kernel/perf_event_xscale.c Will Deacon       2010-11-13  488  	xscale2pmu_write_overflow_flags(of_flags);
43eab87828fee6 arch/arm/kernel/perf_event_xscale.c Will Deacon       2010-11-13  489  
43eab87828fee6 arch/arm/kernel/perf_event_xscale.c Will Deacon       2010-11-13 @490  	regs = get_irq_regs();
43eab87828fee6 arch/arm/kernel/perf_event_xscale.c Will Deacon       2010-11-13  491  
bf5ffc8c80e0cf drivers/perf/arm_xscale_pmu.c       Rob Herring (Arm  2024-07-31  492) 	for_each_set_bit(idx, cpu_pmu->cntr_mask, XSCALE2_NUM_COUNTERS) {
43eab87828fee6 arch/arm/kernel/perf_event_xscale.c Will Deacon       2010-11-13  493  		struct perf_event *event = cpuc->events[idx];
43eab87828fee6 arch/arm/kernel/perf_event_xscale.c Will Deacon       2010-11-13  494  
f6f5a30c834135 arch/arm/kernel/perf_event_xscale.c Will Deacon       2012-03-06  495  		if (!event)
f6f5a30c834135 arch/arm/kernel/perf_event_xscale.c Will Deacon       2012-03-06  496  			continue;
f6f5a30c834135 arch/arm/kernel/perf_event_xscale.c Will Deacon       2012-03-06  497  
3f31ae121348af arch/arm/kernel/perf_event_xscale.c Will Deacon       2012-03-06  498  		if (!xscale2_pmnc_counter_has_overflowed(of_flags, idx))
43eab87828fee6 arch/arm/kernel/perf_event_xscale.c Will Deacon       2010-11-13  499  			continue;
43eab87828fee6 arch/arm/kernel/perf_event_xscale.c Will Deacon       2010-11-13  500  
63eb790cce0102 drivers/perf/arm_xscale_pmu.c       Mark Rutland      2023-12-05  501  		armpmu_event_overflow(event);
43eab87828fee6 arch/arm/kernel/perf_event_xscale.c Will Deacon       2010-11-13  502  	}
43eab87828fee6 arch/arm/kernel/perf_event_xscale.c Will Deacon       2010-11-13  503  
43eab87828fee6 arch/arm/kernel/perf_event_xscale.c Will Deacon       2010-11-13  504  	irq_work_run();
43eab87828fee6 arch/arm/kernel/perf_event_xscale.c Will Deacon       2010-11-13  505  
43eab87828fee6 arch/arm/kernel/perf_event_xscale.c Will Deacon       2010-11-13  506  	/*
43eab87828fee6 arch/arm/kernel/perf_event_xscale.c Will Deacon       2010-11-13  507  	 * Re-enable the PMU.
43eab87828fee6 arch/arm/kernel/perf_event_xscale.c Will Deacon       2010-11-13  508  	 */
43eab87828fee6 arch/arm/kernel/perf_event_xscale.c Will Deacon       2010-11-13  509  	pmnc = xscale2pmu_read_pmnc() | XSCALE_PMU_ENABLE;
43eab87828fee6 arch/arm/kernel/perf_event_xscale.c Will Deacon       2010-11-13  510  	xscale2pmu_write_pmnc(pmnc);
43eab87828fee6 arch/arm/kernel/perf_event_xscale.c Will Deacon       2010-11-13  511  
43eab87828fee6 arch/arm/kernel/perf_event_xscale.c Will Deacon       2010-11-13  512  	return IRQ_HANDLED;
43eab87828fee6 arch/arm/kernel/perf_event_xscale.c Will Deacon       2010-11-13  513  }
43eab87828fee6 arch/arm/kernel/perf_event_xscale.c Will Deacon       2010-11-13  514  

:::::: The code at line 490 was first introduced by commit
:::::: 43eab87828fee65f89f4088736b2b7a187390a2f ARM: perf: separate PMU backends into multiple files

:::::: TO: Will Deacon <will.deacon@arm.com>
:::::: CC: Will Deacon <will.deacon@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
