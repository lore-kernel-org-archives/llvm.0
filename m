Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DE3199B8;
	Wed,  2 Oct 2024 08:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727857269; cv=none; b=ihUOwVrp+IRtgmt2oz7rG+WELoxsghJg/J2ulURcW1Jc7H1DsyprzIly381o6Xn2m3b6IsYne5s+wbnY8CFh5KQxCvq9NNW2EEwgRmbBqPcuz2PVpZiOvGFH5GDZK5dS28F2F9AbKDdIVA4dfTRUJtq0NAcd0tDWTVROQg72aQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727857269; c=relaxed/simple;
	bh=tRUOkXa7WISA7GqnntfRHw5+JFkHrYA0Q7K9SLcvMuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RzNqvpaQr7WgQQPry8Xkh69OLBWFMeOI3JS0I6NMRnojdO3HXLT0KQ9CXpQjbLw7HLrikXPT0U8N8S7a1SwEEV31hSwc+pLuOV1OdVtKLsD5WP5gHDpUVqMgxNGKWkYKTTTT+76yuf0/Q80IJla0v3cUKcxGfFBTH4X2ilKLaIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K3dX6dBj; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K3dX6dBj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727857267; x=1759393267;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tRUOkXa7WISA7GqnntfRHw5+JFkHrYA0Q7K9SLcvMuQ=;
  b=K3dX6dBjDeMJFdxjs07Nv4jupbfxQ7vtY4eC+3XhJBHdHHhivqecnDwy
   pHMtpvC4XOtN83RR9OIWdXmRfKb4wN/GhwqNgzZ6FvYkK8RrzDFEGgFWc
   PR0ow+b7MGymDx8kyd/FEkpkQlHHAmGkYwVd59eeKRBMvbfE09MdkIZUB
   7qpqtLw9lTfxlRiIL71B7WePlj8tG3mu7b9IQSFZW+eQdrnWIF/7R6OuZ
   LBiA5zV3SSLlxmdcmgmDa+O+FFvKTgcuizScarEGkfwth4fMzj9MtPfwe
   LczFUyDzHtred2Ikp6+qauDBirwYr2yEf+tD/8e3gTufVNxK5TUfGDCHB
   w==;
X-CSE-ConnectionGUID: qPTwE5PqROm2+u2/Ewj++Q==
X-CSE-MsgGUID: jbf7GJYySRGa54AMpFBg4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="44476267"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="44476267"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 01:21:06 -0700
X-CSE-ConnectionGUID: 7eEP6YncRCG17hcgYTnEew==
X-CSE-MsgGUID: UdmfP1YzR7i/l5wfqvmSpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="78903386"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 02 Oct 2024 01:21:05 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svubW-000Rnf-2B;
	Wed, 02 Oct 2024 08:21:02 +0000
Date: Wed, 2 Oct 2024 16:20:49 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:for-arm-ci 1/1] drivers/perf/arm_pmuv3.c:773:6: error:
 implicit declaration of function 'is_pmuv3p9' is invalid in C99
Message-ID: <202410021603.39xH8Msj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-arm-ci
head:   55ba96936d039e7d6fb525e96b4f2780fe60e71a
commit: 55ba96936d039e7d6fb525e96b4f2780fe60e71a [1/1] perf/arm_pmuv3: Add support for PMUv3.9 per counter EL0 access control
config: arm-randconfig-003-20241002 (https://download.01.org/0day-ci/archive/20241002/202410021603.39xH8Msj-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410021603.39xH8Msj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410021603.39xH8Msj-lkp@intel.com/

All errors (new ones prefixed by >>):

                                                                   ^~~~~~
   drivers/perf/arm_pmuv3.c:140:2: note: previous initialization is here
           PERF_CACHE_MAP_ALL_UNSUPPORTED,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:49:31: note: expanded from macro 'PERF_CACHE_MAP_ALL_UNSUPPORTED'
                   [0 ... C(RESULT_MAX) - 1] = CACHE_OP_UNSUPPORTED,       \
                                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:41:31: note: expanded from macro 'CACHE_OP_UNSUPPORTED'
   #define CACHE_OP_UNSUPPORTED            0xFFFF
                                           ^~~~~~
   drivers/perf/arm_pmuv3.c:147:44: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [C(DTLB)][C(OP_READ)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_L1D_TLB_RD,
                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:134:44: note: expanded from macro 'ARMV8_IMPDEF_PERFCTR_L1D_TLB_RD'
   #define ARMV8_IMPDEF_PERFCTR_L1D_TLB_RD                         0x004E
                                                                   ^~~~~~
   drivers/perf/arm_pmuv3.c:140:2: note: previous initialization is here
           PERF_CACHE_MAP_ALL_UNSUPPORTED,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:49:31: note: expanded from macro 'PERF_CACHE_MAP_ALL_UNSUPPORTED'
                   [0 ... C(RESULT_MAX) - 1] = CACHE_OP_UNSUPPORTED,       \
                                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:41:31: note: expanded from macro 'CACHE_OP_UNSUPPORTED'
   #define CACHE_OP_UNSUPPORTED            0xFFFF
                                           ^~~~~~
   drivers/perf/arm_pmuv3.c:148:45: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [C(DTLB)][C(OP_WRITE)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_L1D_TLB_WR,
                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:135:44: note: expanded from macro 'ARMV8_IMPDEF_PERFCTR_L1D_TLB_WR'
   #define ARMV8_IMPDEF_PERFCTR_L1D_TLB_WR                         0x004F
                                                                   ^~~~~~
   drivers/perf/arm_pmuv3.c:140:2: note: previous initialization is here
           PERF_CACHE_MAP_ALL_UNSUPPORTED,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:49:31: note: expanded from macro 'PERF_CACHE_MAP_ALL_UNSUPPORTED'
                   [0 ... C(RESULT_MAX) - 1] = CACHE_OP_UNSUPPORTED,       \
                                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:41:31: note: expanded from macro 'CACHE_OP_UNSUPPORTED'
   #define CACHE_OP_UNSUPPORTED            0xFFFF
                                           ^~~~~~
   drivers/perf/arm_pmuv3.c:149:42: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [C(DTLB)][C(OP_READ)][C(RESULT_MISS)]   = ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_RD,
                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:132:50: note: expanded from macro 'ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_RD'
   #define ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_RD                  0x004C
                                                                   ^~~~~~
   drivers/perf/arm_pmuv3.c:140:2: note: previous initialization is here
           PERF_CACHE_MAP_ALL_UNSUPPORTED,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:49:31: note: expanded from macro 'PERF_CACHE_MAP_ALL_UNSUPPORTED'
                   [0 ... C(RESULT_MAX) - 1] = CACHE_OP_UNSUPPORTED,       \
                                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:41:31: note: expanded from macro 'CACHE_OP_UNSUPPORTED'
   #define CACHE_OP_UNSUPPORTED            0xFFFF
                                           ^~~~~~
   drivers/perf/arm_pmuv3.c:150:43: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [C(DTLB)][C(OP_WRITE)][C(RESULT_MISS)]  = ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_WR,
                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:133:50: note: expanded from macro 'ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_WR'
   #define ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_WR                  0x004D
                                                                   ^~~~~~
   drivers/perf/arm_pmuv3.c:140:2: note: previous initialization is here
           PERF_CACHE_MAP_ALL_UNSUPPORTED,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:49:31: note: expanded from macro 'PERF_CACHE_MAP_ALL_UNSUPPORTED'
                   [0 ... C(RESULT_MAX) - 1] = CACHE_OP_UNSUPPORTED,       \
                                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:41:31: note: expanded from macro 'CACHE_OP_UNSUPPORTED'
   #define CACHE_OP_UNSUPPORTED            0xFFFF
                                           ^~~~~~
   drivers/perf/arm_pmuv3.c:152:44: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [C(NODE)][C(OP_READ)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_RD,
                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:149:46: note: expanded from macro 'ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_RD'
   #define ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_RD                      0x0060
                                                                   ^~~~~~
   drivers/perf/arm_pmuv3.c:140:2: note: previous initialization is here
           PERF_CACHE_MAP_ALL_UNSUPPORTED,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:49:31: note: expanded from macro 'PERF_CACHE_MAP_ALL_UNSUPPORTED'
                   [0 ... C(RESULT_MAX) - 1] = CACHE_OP_UNSUPPORTED,       \
                                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:41:31: note: expanded from macro 'CACHE_OP_UNSUPPORTED'
   #define CACHE_OP_UNSUPPORTED            0xFFFF
                                           ^~~~~~
   drivers/perf/arm_pmuv3.c:153:45: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [C(NODE)][C(OP_WRITE)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_WR,
                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:150:46: note: expanded from macro 'ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_WR'
   #define ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_WR                      0x0061
                                                                   ^~~~~~
   drivers/perf/arm_pmuv3.c:140:2: note: previous initialization is here
           PERF_CACHE_MAP_ALL_UNSUPPORTED,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:49:31: note: expanded from macro 'PERF_CACHE_MAP_ALL_UNSUPPORTED'
                   [0 ... C(RESULT_MAX) - 1] = CACHE_OP_UNSUPPORTED,       \
                                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:41:31: note: expanded from macro 'CACHE_OP_UNSUPPORTED'
   #define CACHE_OP_UNSUPPORTED            0xFFFF
                                           ^~~~~~
>> drivers/perf/arm_pmuv3.c:773:6: error: implicit declaration of function 'is_pmuv3p9' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           if (is_pmuv3p9(cpu_pmu->pmuver)) {
               ^
>> drivers/perf/arm_pmuv3.c:779:3: error: implicit declaration of function 'write_pmuacr' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   write_pmuacr(mask);
                   ^
   drivers/perf/arm_pmuv3.c:779:3: note: did you mean 'write_pmcr'?
   arch/arm/include/asm/arm_pmuv3.h:136:20: note: 'write_pmcr' declared here
   static inline void write_pmcr(u32 val)
                      ^
   55 warnings and 2 errors generated.


vim +/is_pmuv3p9 +773 drivers/perf/arm_pmuv3.c

   767	
   768	static void armv8pmu_enable_user_access(struct arm_pmu *cpu_pmu)
   769	{
   770		int i;
   771		struct pmu_hw_events *cpuc = this_cpu_ptr(cpu_pmu->hw_events);
   772	
 > 773		if (is_pmuv3p9(cpu_pmu->pmuver)) {
   774			u64 mask = 0;
   775			for_each_set_bit(i, cpuc->used_mask, ARMPMU_MAX_HWEVENTS) {
   776				if (armv8pmu_event_has_user_read(cpuc->events[i]))
   777					mask |= BIT(i);
   778			}
 > 779			write_pmuacr(mask);
   780		} else {
   781			/* Clear any unused counters to avoid leaking their contents */
   782			for_each_andnot_bit(i, cpu_pmu->cntr_mask, cpuc->used_mask,
   783					    ARMPMU_MAX_HWEVENTS) {
   784				if (i == ARMV8_PMU_CYCLE_IDX)
   785					write_pmccntr(0);
   786				else if (i == ARMV8_PMU_INSTR_IDX)
   787					write_pmicntr(0);
   788				else
   789					armv8pmu_write_evcntr(i, 0);
   790			}
   791		}
   792	
   793		update_pmuserenr(ARMV8_PMU_USERENR_ER | ARMV8_PMU_USERENR_CR | ARMV8_PMU_USERENR_UEN);
   794	}
   795	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
