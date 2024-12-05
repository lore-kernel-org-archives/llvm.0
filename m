Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DD6193;
	Thu,  5 Dec 2024 03:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733369586; cv=none; b=Uj9D1W+BjktwJcNTJtIjL/ly01YcnmV7YTwNWKebNleS5QP1T0af/IZyrRa9ZPVZtq5quMJBaf9IfaAj2eKB3nJV2kOK5FlUBw3togV2/7kghkxb7mAsOuKr/3fuZ8p3KBb47nYID8eMyNagmP+fcu8OFWX4veBTtq/N+5zAhOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733369586; c=relaxed/simple;
	bh=oqfb1IBF3kOL1oS8VEYHyenvAf5wr2SPCSsm8Kw7dNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kQmGc9EZvXW0AicrQYY0eVtk0TC44gxGJ8ClAsnnuMrAbItDWVX+quB8nzNNe8xK4g1mD+LJMOXGuW5HBIkgFyO/v8ctuXe3MyikRuJuq9k12742Cp3By2RtWlnBkSqwB2OITt7dlSDyswDcRwNahhkBvYr699XislXIgjYd7VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TKvC76Q4; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TKvC76Q4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733369584; x=1764905584;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oqfb1IBF3kOL1oS8VEYHyenvAf5wr2SPCSsm8Kw7dNY=;
  b=TKvC76Q4vX0K7QzrE4Vm0LR8cH6w9o1cfwlX0jF4M83nGSAsvwqFxmvx
   8rbUnWB4mEZhjVLVGj/qwRtRx2qPYN+QM2xDGzgYBsSHhWu1NGjGr1Ebt
   E2Sq4ckwwhH9NkmLIGMCExzMWKt7kIJIS1ZZaMtHMY8hJzco72SxxkkjA
   VSsYvPoN/1O4Icln2AODk/ePrgbu0MQ7JcGjF8Qk0LTTeClMPxYiLS8OP
   fZory+Ey7wacGeCLqQaefUOWEE41KLhFCVUWjV4PnGHoCsqoc6LryOQeK
   8bTFXYZiH2tUtX5uFkiPQDnLzoBsoiAIVoUqydJYYeyYw/+BgqYa17mvU
   w==;
X-CSE-ConnectionGUID: iqyoRNefQKGGdITxt/UMDg==
X-CSE-MsgGUID: vCGhRKkWS6uY94Ddn3xTVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33546112"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="33546112"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 19:33:04 -0800
X-CSE-ConnectionGUID: fGP8O5YDTDu6uUU7c+Vumw==
X-CSE-MsgGUID: /RthLQKMRtGyboQ0y4yiPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="99042794"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 04 Dec 2024 19:33:02 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJ2bs-0003kN-0x;
	Thu, 05 Dec 2024 03:33:00 +0000
Date: Thu, 5 Dec 2024 11:32:11 +0800
From: kernel test robot <lkp@intel.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 01/14] drivers/perf: apple_m1: Refactor event
 select/filter configuration
Message-ID: <202412051149.fwutWibd-lkp@intel.com>
References: <20241203193220.1070811-2-oliver.upton@linux.dev>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203193220.1070811-2-oliver.upton@linux.dev>

Hi Oliver,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 40384c840ea1944d7c5a392e8975ed088ecf0b37]

url:    https://github.com/intel-lab-lkp/linux/commits/Oliver-Upton/drivers-perf-apple_m1-Refactor-event-select-filter-configuration/20241204-123047
base:   40384c840ea1944d7c5a392e8975ed088ecf0b37
patch link:    https://lore.kernel.org/r/20241203193220.1070811-2-oliver.upton%40linux.dev
patch subject: [RFC PATCH 01/14] drivers/perf: apple_m1: Refactor event select/filter configuration
config: arm64-randconfig-001-20241205 (https://download.01.org/0day-ci/archive/20241205/202412051149.fwutWibd-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412051149.fwutWibd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412051149.fwutWibd-lkp@intel.com/

All warnings (new ones prefixed by >>):

                                                                     ^~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:27:22: note: expanded from macro 'ONLY_2_4_6'
   #define ONLY_2_4_6                      (BIT(2) | BIT(4) | BIT(6))
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:132:35: note: previous initialization is here
           [0 ... M1_PMU_PERFCTR_LAST]                             = ANY_BUT_0_1,
                                                                     ^~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:25:23: note: expanded from macro 'ANY_BUT_0_1'
   #define ANY_BUT_0_1                     GENMASK(9, 2)
                                           ^~~~~~~~~~~~~
   include/linux/bits.h:35:2: note: expanded from macro 'GENMASK'
           (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:161:35: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [M1_PMU_PERFCTR_UNKNOWN_f6]                             = ONLY_2_4_6,
                                                                     ^~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:27:22: note: expanded from macro 'ONLY_2_4_6'
   #define ONLY_2_4_6                      (BIT(2) | BIT(4) | BIT(6))
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:132:35: note: previous initialization is here
           [0 ... M1_PMU_PERFCTR_LAST]                             = ANY_BUT_0_1,
                                                                     ^~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:25:23: note: expanded from macro 'ANY_BUT_0_1'
   #define ANY_BUT_0_1                     GENMASK(9, 2)
                                           ^~~~~~~~~~~~~
   include/linux/bits.h:35:2: note: expanded from macro 'GENMASK'
           (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:162:35: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [M1_PMU_PERFCTR_UNKNOWN_f7]                             = ONLY_2_4_6,
                                                                     ^~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:27:22: note: expanded from macro 'ONLY_2_4_6'
   #define ONLY_2_4_6                      (BIT(2) | BIT(4) | BIT(6))
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:132:35: note: previous initialization is here
           [0 ... M1_PMU_PERFCTR_LAST]                             = ANY_BUT_0_1,
                                                                     ^~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:25:23: note: expanded from macro 'ANY_BUT_0_1'
   #define ANY_BUT_0_1                     GENMASK(9, 2)
                                           ^~~~~~~~~~~~~
   include/linux/bits.h:35:2: note: expanded from macro 'GENMASK'
           (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:163:35: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [M1_PMU_PERFCTR_UNKNOWN_f8]                             = ONLY_2_TO_7,
                                                                     ^~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:26:23: note: expanded from macro 'ONLY_2_TO_7'
   #define ONLY_2_TO_7                     GENMASK(7, 2)
                                           ^~~~~~~~~~~~~
   include/linux/bits.h:35:2: note: expanded from macro 'GENMASK'
           (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:132:35: note: previous initialization is here
           [0 ... M1_PMU_PERFCTR_LAST]                             = ANY_BUT_0_1,
                                                                     ^~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:25:23: note: expanded from macro 'ANY_BUT_0_1'
   #define ANY_BUT_0_1                     GENMASK(9, 2)
                                           ^~~~~~~~~~~~~
   include/linux/bits.h:35:2: note: expanded from macro 'GENMASK'
           (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:164:35: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [M1_PMU_PERFCTR_UNKNOWN_fd]                             = ONLY_2_4_6,
                                                                     ^~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:27:22: note: expanded from macro 'ONLY_2_4_6'
   #define ONLY_2_4_6                      (BIT(2) | BIT(4) | BIT(6))
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:132:35: note: previous initialization is here
           [0 ... M1_PMU_PERFCTR_LAST]                             = ANY_BUT_0_1,
                                                                     ^~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:25:23: note: expanded from macro 'ANY_BUT_0_1'
   #define ANY_BUT_0_1                     GENMASK(9, 2)
                                           ^~~~~~~~~~~~~
   include/linux/bits.h:35:2: note: expanded from macro 'GENMASK'
           (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:169:32: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [PERF_COUNT_HW_CPU_CYCLES]              = M1_PMU_PERFCTR_CORE_ACTIVE_CYCLE,
                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:168:2: note: previous initialization is here
           PERF_MAP_ALL_UNSUPPORTED,
           ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:44:34: note: expanded from macro 'PERF_MAP_ALL_UNSUPPORTED'
           [0 ... PERF_COUNT_HW_MAX - 1] = HW_OP_UNSUPPORTED
                                           ^~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:39:28: note: expanded from macro 'HW_OP_UNSUPPORTED'
   #define HW_OP_UNSUPPORTED               0xFFFF
                                           ^~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:170:34: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [PERF_COUNT_HW_INSTRUCTIONS]            = M1_PMU_PERFCTR_INST_ALL,
                                                     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:168:2: note: previous initialization is here
           PERF_MAP_ALL_UNSUPPORTED,
           ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:44:34: note: expanded from macro 'PERF_MAP_ALL_UNSUPPORTED'
           [0 ... PERF_COUNT_HW_MAX - 1] = HW_OP_UNSUPPORTED
                                           ^~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:39:28: note: expanded from macro 'HW_OP_UNSUPPORTED'
   #define HW_OP_UNSUPPORTED               0xFFFF
                                           ^~~~~~
>> drivers/perf/apple_m1_cpu_pmu.c:402:13: warning: variable 'kernel' set but not used [-Wunused-but-set-variable]
           bool user, kernel;
                      ^
>> drivers/perf/apple_m1_cpu_pmu.c:402:7: warning: variable 'user' set but not used [-Wunused-but-set-variable]
           bool user, kernel;
                ^
>> drivers/perf/apple_m1_cpu_pmu.c:403:5: warning: variable 'evt' set but not used [-Wunused-but-set-variable]
           u8 evt;
              ^
   37 warnings generated.


vim +/kernel +402 drivers/perf/apple_m1_cpu_pmu.c

36f48213b772df Oliver Upton 2024-12-03  398  
a639027a1be1d6 Marc Zyngier 2022-02-08  399  /* arm_pmu backend */
a639027a1be1d6 Marc Zyngier 2022-02-08  400  static void m1_pmu_enable_event(struct perf_event *event)
a639027a1be1d6 Marc Zyngier 2022-02-08  401  {
a639027a1be1d6 Marc Zyngier 2022-02-08 @402  	bool user, kernel;
a639027a1be1d6 Marc Zyngier 2022-02-08 @403  	u8 evt;
a639027a1be1d6 Marc Zyngier 2022-02-08  404  
a639027a1be1d6 Marc Zyngier 2022-02-08  405  	evt = event->hw.config_base & M1_PMU_CFG_EVENT;
a639027a1be1d6 Marc Zyngier 2022-02-08  406  	user = event->hw.config_base & M1_PMU_CFG_COUNT_USER;
a639027a1be1d6 Marc Zyngier 2022-02-08  407  	kernel = event->hw.config_base & M1_PMU_CFG_COUNT_KERNEL;
a639027a1be1d6 Marc Zyngier 2022-02-08  408  
a639027a1be1d6 Marc Zyngier 2022-02-08  409  	m1_pmu_disable_counter_interrupt(event->hw.idx);
a639027a1be1d6 Marc Zyngier 2022-02-08  410  	m1_pmu_disable_counter(event->hw.idx);
a639027a1be1d6 Marc Zyngier 2022-02-08  411  	isb();
a639027a1be1d6 Marc Zyngier 2022-02-08  412  
36f48213b772df Oliver Upton 2024-12-03  413  	m1_pmu_configure_counter(event->hw.idx, event->hw.config_base);
a639027a1be1d6 Marc Zyngier 2022-02-08  414  	m1_pmu_enable_counter(event->hw.idx);
a639027a1be1d6 Marc Zyngier 2022-02-08  415  	m1_pmu_enable_counter_interrupt(event->hw.idx);
a639027a1be1d6 Marc Zyngier 2022-02-08  416  	isb();
a639027a1be1d6 Marc Zyngier 2022-02-08  417  }
a639027a1be1d6 Marc Zyngier 2022-02-08  418  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
