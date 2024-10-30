Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE56383A2;
	Wed, 30 Oct 2024 00:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730249985; cv=none; b=ioCK/13Z47Doqu+EhG8fjO/fdD4Smt6PwxKOU+70DA//JgvwUFt7WwnNpiNs4TYmDsDz9zx15JEFiMfTtV7gk3reAe2xbVvo2hZFU1BTPacCROyk5LZBLon3ittpQEzKNJt1foQanyY4UwMweYBENbbH19QBhqq1YiDRBEDB8KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730249985; c=relaxed/simple;
	bh=CkfNHPdZ8Em68twMPV4BadtxlJ82QYihsPdOUY93riA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AByB0/RNvSSwDVYYuHr6VlWGgGV9aNFxwdfPpskMeyEazzyACfdtmMgYQpHTJUJwxkRaYnYiGJqxA5R05dlrOrIv/PYpbTkveItk5VC8YzhhLrP1aIyJlq30DG+sIa9M764F3If5Dpv/C+Y1CVcbLVAl1r+79nJFPzIFgELsn0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c7rmAmVB; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c7rmAmVB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730249982; x=1761785982;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CkfNHPdZ8Em68twMPV4BadtxlJ82QYihsPdOUY93riA=;
  b=c7rmAmVBYx/ZcztvBLCgNRrBAbyybdzSOVP+NcO6Mpi2OE8LmX+foxdI
   4Yzi+znpQQcqwLmMeCwhF0uql8jbFGrFmwBhKfYkR7Guz3cRD/l8aFX9W
   liRUnpiq+/5Dl7nANgzmbAMuouZr72+Z+OJi7F8WQsep1iIaMDgPrgvFu
   3Dp+L7M++ZDFEu9dDFGAXMZowsOVqzBcvztuztU6Wnnlu8K4/OAGgy6Bk
   upR+TIH9UZvm8mWpA6pO442A94ElqloAvliRwv8XwsYsPH6Dw0FBy2hf5
   +96fla8uYfjOFWTRyUdJNAb+y8i0TeE3c8ZcB7PGdJK6QQWmcM5JioC/k
   g==;
X-CSE-ConnectionGUID: Yb2vyHJGSXK7OYX3xMF4Tg==
X-CSE-MsgGUID: Nh4sCcdLQreSoVhpPr62Wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="33851842"
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; 
   d="scan'208";a="33851842"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 17:59:40 -0700
X-CSE-ConnectionGUID: p+lIIIKwQuCK5WXOuyYaZg==
X-CSE-MsgGUID: NvDsEtCkT5KCn42RR60Myw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; 
   d="scan'208";a="82058091"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 29 Oct 2024 17:59:38 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5x3g-000eLR-0z;
	Wed, 30 Oct 2024 00:59:36 +0000
Date: Wed, 30 Oct 2024 08:58:47 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Will Deacon <will@kernel.org>
Subject: [arm-perf:for-next/perf 6/12] drivers/perf/arm_pmuv3.c:779:3: error:
 implicit declaration of function 'write_pmuacr' is invalid in C99
Message-ID: <202410300801.nBNrLtSn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git for-next/perf
head:   9643aaa194737b1ad73f9da6e51fc63d1c7a864a
commit: 0bbff9ed81654d5f06bfca484681756ee407f924 [6/12] perf/arm_pmuv3: Add PMUv3.9 per counter EL0 access control
config: arm-randconfig-004-20241030 (https://download.01.org/0day-ci/archive/20241030/202410300801.nBNrLtSn-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241030/202410300801.nBNrLtSn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410300801.nBNrLtSn-lkp@intel.com/

Note: the arm-perf/for-next/perf HEAD 9643aaa194737b1ad73f9da6e51fc63d1c7a864a builds fine.
      It only hurts bisectability.

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
>> drivers/perf/arm_pmuv3.c:779:3: error: implicit declaration of function 'write_pmuacr' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   write_pmuacr(mask);
                   ^
   drivers/perf/arm_pmuv3.c:779:3: note: did you mean 'write_pmcr'?
   arch/arm/include/asm/arm_pmuv3.h:136:20: note: 'write_pmcr' declared here
   static inline void write_pmcr(u32 val)
                      ^
   55 warnings and 1 error generated.


vim +/write_pmuacr +779 drivers/perf/arm_pmuv3.c

   767	
   768	static void armv8pmu_enable_user_access(struct arm_pmu *cpu_pmu)
   769	{
   770		int i;
   771		struct pmu_hw_events *cpuc = this_cpu_ptr(cpu_pmu->hw_events);
   772	
   773		if (is_pmuv3p9(cpu_pmu->pmuver)) {
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
