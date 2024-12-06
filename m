Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D695F18B09;
	Fri,  6 Dec 2024 05:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733464142; cv=none; b=q2j7ZHftoqMKuXmiCQbsZANG5VHwiKy/vb3cpM4v8eERhI2f6jZmwMQYvzqyXWQiHuKfKyDAJHEIBulp55HLxtcB8X0sVROHRVFG4sR8BjPahTKrjfFWtziVm0wJOAJrP+D3zU2UcD6u5pO08n5G06GxhJ1UrI0Ay+Q7zfItKXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733464142; c=relaxed/simple;
	bh=E3ayomosilyDrGtBMNJbLAT6n6Lo0y8Rr90cf2wKQgY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PzQmSKrpnZ8Ksp4htWxAQC5Ynab0mI6s4jcBhiMiiTKTCS0AXAUu2Md7TUEilYBxohkoswHbRiFkGMZJ2xclEdI2kuqcNGFsL8pKr6FjsJEh3V5mi5z3bKMXNR1MRe/9aCkRQdwHG+yWjiXTouJqfAGVOsUFIIYfdXZK+1iDpuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KkaKkDrU; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KkaKkDrU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733464141; x=1765000141;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E3ayomosilyDrGtBMNJbLAT6n6Lo0y8Rr90cf2wKQgY=;
  b=KkaKkDrUgYfRwcZ8pEzvFgd9FCXU0qNI606FFuezF1cZC0pl6MJSWZo7
   QhtQZxLQfBBuaIq4VsR2njOb6IBc1/acidGy4YBMPjEnkzE1Y8ug+yoZu
   UwLz1L2rBX8wd0LqUU3b0ElbkEYSngVDlWIodjivK6TlgmJLFSeAuF3UO
   YOBQA0E7UwkcxKcnoOzhOQIUCNwZdkMYTsIYCr7nO8a08G8EjaTquUw56
   UPxmj2YZDhI9Y3m7/cZaRakANvNOLWkvxGEx9iaT6N7C+KxVNkjHidFN3
   mQYFMQgGFrwuCCTcRogjhLUaMZjmm8y6cj0HuP3AWC1+fCVMPItTsx/et
   A==;
X-CSE-ConnectionGUID: 5X2aBQs8SJ2iE1pa0GGp0w==
X-CSE-MsgGUID: 6N/Tcrn5TdWlcRDOekJliw==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="33955747"
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="33955747"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 21:48:56 -0800
X-CSE-ConnectionGUID: AM975iG8TiqF8dxspPwtfA==
X-CSE-MsgGUID: rzyXA9fNTS+GlSL+fq98BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="94186423"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 05 Dec 2024 21:48:52 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJRCp-0000jw-0t;
	Fri, 06 Dec 2024 05:48:47 +0000
Date: Fri, 6 Dec 2024 13:48:20 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:arm/brbe 21/21] drivers/perf/arm_pmuv3.c:1125:16: error: too
 few arguments to function call, single argument 'arm_pmu' was not specified
Message-ID: <202412061343.k45SlH84-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git arm/brbe
head:   fa9b8a09d450379420af38cd2daf4a7dd247fd63
commit: fa9b8a09d450379420af38cd2daf4a7dd247fd63 [21/21] arm_pmuv3: Just disable brbe on reset
config: arm64-randconfig-003 (https://download.01.org/0day-ci/archive/20241206/202412061343.k45SlH84-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241206/202412061343.k45SlH84-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412061343.k45SlH84-lkp@intel.com/

All errors (new ones prefixed by >>):

                                                                   ^~~~~~
   drivers/perf/arm_pmuv3.c:142:2: note: previous initialization is here
           PERF_CACHE_MAP_ALL_UNSUPPORTED,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:49:31: note: expanded from macro 'PERF_CACHE_MAP_ALL_UNSUPPORTED'
                   [0 ... C(RESULT_MAX) - 1] = CACHE_OP_UNSUPPORTED,       \
                                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:41:31: note: expanded from macro 'CACHE_OP_UNSUPPORTED'
   #define CACHE_OP_UNSUPPORTED            0xFFFF
                                           ^~~~~~
   drivers/perf/arm_pmuv3.c:149:44: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [C(DTLB)][C(OP_READ)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_L1D_TLB_RD,
                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:134:44: note: expanded from macro 'ARMV8_IMPDEF_PERFCTR_L1D_TLB_RD'
   #define ARMV8_IMPDEF_PERFCTR_L1D_TLB_RD                         0x004E
                                                                   ^~~~~~
   drivers/perf/arm_pmuv3.c:142:2: note: previous initialization is here
           PERF_CACHE_MAP_ALL_UNSUPPORTED,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:49:31: note: expanded from macro 'PERF_CACHE_MAP_ALL_UNSUPPORTED'
                   [0 ... C(RESULT_MAX) - 1] = CACHE_OP_UNSUPPORTED,       \
                                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:41:31: note: expanded from macro 'CACHE_OP_UNSUPPORTED'
   #define CACHE_OP_UNSUPPORTED            0xFFFF
                                           ^~~~~~
   drivers/perf/arm_pmuv3.c:150:45: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [C(DTLB)][C(OP_WRITE)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_L1D_TLB_WR,
                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:135:44: note: expanded from macro 'ARMV8_IMPDEF_PERFCTR_L1D_TLB_WR'
   #define ARMV8_IMPDEF_PERFCTR_L1D_TLB_WR                         0x004F
                                                                   ^~~~~~
   drivers/perf/arm_pmuv3.c:142:2: note: previous initialization is here
           PERF_CACHE_MAP_ALL_UNSUPPORTED,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:49:31: note: expanded from macro 'PERF_CACHE_MAP_ALL_UNSUPPORTED'
                   [0 ... C(RESULT_MAX) - 1] = CACHE_OP_UNSUPPORTED,       \
                                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:41:31: note: expanded from macro 'CACHE_OP_UNSUPPORTED'
   #define CACHE_OP_UNSUPPORTED            0xFFFF
                                           ^~~~~~
   drivers/perf/arm_pmuv3.c:151:42: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [C(DTLB)][C(OP_READ)][C(RESULT_MISS)]   = ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_RD,
                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:132:50: note: expanded from macro 'ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_RD'
   #define ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_RD                  0x004C
                                                                   ^~~~~~
   drivers/perf/arm_pmuv3.c:142:2: note: previous initialization is here
           PERF_CACHE_MAP_ALL_UNSUPPORTED,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:49:31: note: expanded from macro 'PERF_CACHE_MAP_ALL_UNSUPPORTED'
                   [0 ... C(RESULT_MAX) - 1] = CACHE_OP_UNSUPPORTED,       \
                                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:41:31: note: expanded from macro 'CACHE_OP_UNSUPPORTED'
   #define CACHE_OP_UNSUPPORTED            0xFFFF
                                           ^~~~~~
   drivers/perf/arm_pmuv3.c:152:43: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [C(DTLB)][C(OP_WRITE)][C(RESULT_MISS)]  = ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_WR,
                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:133:50: note: expanded from macro 'ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_WR'
   #define ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_WR                  0x004D
                                                                   ^~~~~~
   drivers/perf/arm_pmuv3.c:142:2: note: previous initialization is here
           PERF_CACHE_MAP_ALL_UNSUPPORTED,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:49:31: note: expanded from macro 'PERF_CACHE_MAP_ALL_UNSUPPORTED'
                   [0 ... C(RESULT_MAX) - 1] = CACHE_OP_UNSUPPORTED,       \
                                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:41:31: note: expanded from macro 'CACHE_OP_UNSUPPORTED'
   #define CACHE_OP_UNSUPPORTED            0xFFFF
                                           ^~~~~~
   drivers/perf/arm_pmuv3.c:154:44: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [C(NODE)][C(OP_READ)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_RD,
                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:149:46: note: expanded from macro 'ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_RD'
   #define ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_RD                      0x0060
                                                                   ^~~~~~
   drivers/perf/arm_pmuv3.c:142:2: note: previous initialization is here
           PERF_CACHE_MAP_ALL_UNSUPPORTED,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:49:31: note: expanded from macro 'PERF_CACHE_MAP_ALL_UNSUPPORTED'
                   [0 ... C(RESULT_MAX) - 1] = CACHE_OP_UNSUPPORTED,       \
                                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:41:31: note: expanded from macro 'CACHE_OP_UNSUPPORTED'
   #define CACHE_OP_UNSUPPORTED            0xFFFF
                                           ^~~~~~
   drivers/perf/arm_pmuv3.c:155:45: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [C(NODE)][C(OP_WRITE)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_WR,
                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:150:46: note: expanded from macro 'ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_WR'
   #define ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_WR                      0x0061
                                                                   ^~~~~~
   drivers/perf/arm_pmuv3.c:142:2: note: previous initialization is here
           PERF_CACHE_MAP_ALL_UNSUPPORTED,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:49:31: note: expanded from macro 'PERF_CACHE_MAP_ALL_UNSUPPORTED'
                   [0 ... C(RESULT_MAX) - 1] = CACHE_OP_UNSUPPORTED,       \
                                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:41:31: note: expanded from macro 'CACHE_OP_UNSUPPORTED'
   #define CACHE_OP_UNSUPPORTED            0xFFFF
                                           ^~~~~~
>> drivers/perf/arm_pmuv3.c:1125:16: error: too few arguments to function call, single argument 'arm_pmu' was not specified
                   brbe_disable();
                   ~~~~~~~~~~~~ ^
   drivers/perf/arm_brbe.h:19:6: note: 'brbe_disable' declared here
   void brbe_disable(struct arm_pmu *arm_pmu);
        ^
   55 warnings and 1 error generated.


vim +/arm_pmu +1125 drivers/perf/arm_pmuv3.c

  1097	
  1098	static void armv8pmu_reset(void *info)
  1099	{
  1100		struct arm_pmu *cpu_pmu = (struct arm_pmu *)info;
  1101		u64 pmcr, mask;
  1102	
  1103		bitmap_to_arr64(&mask, cpu_pmu->cntr_mask, ARMPMU_MAX_HWEVENTS);
  1104	
  1105		/* The counter and interrupt enable registers are unknown at reset. */
  1106		armv8pmu_disable_counter(mask);
  1107		armv8pmu_disable_intens(mask);
  1108	
  1109		/* Clear the counters we flip at guest entry/exit */
  1110		kvm_clr_pmu_events(mask);
  1111	
  1112		/*
  1113		 * Initialize & Reset PMNC. Request overflow interrupt for
  1114		 * 64 bit cycle counter but cheat in armv8pmu_write_counter().
  1115		 */
  1116		pmcr = ARMV8_PMU_PMCR_P | ARMV8_PMU_PMCR_C | ARMV8_PMU_PMCR_LC;
  1117	
  1118		/* Enable long event counter support where available */
  1119		if (armv8pmu_has_long_event(cpu_pmu))
  1120			pmcr |= ARMV8_PMU_PMCR_LP;
  1121	
  1122		armv8pmu_pmcr_write(pmcr);
  1123	
  1124		if (cpu_pmu->num_branch_records > 0)
> 1125			brbe_disable();
  1126	}
  1127	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
