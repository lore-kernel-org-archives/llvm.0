Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C667611185;
	Wed,  2 Oct 2024 04:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727842431; cv=none; b=JLbnR/kHOZmGlUigGQFLXYT1CeIO7mF90gtzR631y0a5wt49+A0d7RdH/pQz13APwNxmHxpeff8BK0F9JqL9gClKEctSqWbOfyPHz8GcbhO7WrJr0Lulsyrx5ScBklpFuzmF2SDD7DVwhzByIPmE8qU203dIdSq3Q1xkr2OjtQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727842431; c=relaxed/simple;
	bh=xBbu+JE1achinjkMBdrbtOo19TCljQWycDb4ufo0hHY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ADaBzxdYdIP3Uvno+hBOfzAad1DWtO61+nIRRRscoXreivt+P+LmrCRmuqcEOSvj+dv8ZZVz70nD0C3C40rMKfjkFZWzKK4Fyb3NAt0gn8ihTv9ysjgOnyavg3b/BOY63c1Eyp16zoq59/Pmp72jLrzwk3vw/eQ4j9Sfo/jl+vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gdVw0m1J; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gdVw0m1J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727842429; x=1759378429;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xBbu+JE1achinjkMBdrbtOo19TCljQWycDb4ufo0hHY=;
  b=gdVw0m1JGMTigcqss7Gw+MGBDeWfXbszh+zloAuHC7MplvMDNM/M6ReE
   sM+tUF/H9RwEPXnJ8T8uSN0sBQyEBiXktIQF3FtWFId2TtScrvj3ePMQm
   vvHoFZAIXxTh/YOxd/6G/UGvGniO9TUJ7oyErfMOuMSVhsnY4fFGmjSpB
   w1qf5R5r3ep3qi7DzoEwk4ULX2TlYGUlK/fSzRj82yn/FKPiMAUiYhupg
   chMqF3O+oaWrImOSuk23zwfpWNXmgTiKbhvyhdQzwdS1RntSr7fa/Bqkr
   fpBikWrff0wR0ZROjUHRWf/HBFt/S712F5wfEKvJ901pHzl9nir+ivufM
   Q==;
X-CSE-ConnectionGUID: M34V8xCpSzqa0FbPuMjumQ==
X-CSE-MsgGUID: g4Ej+S9EQU6FJImGWS9wFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="26467084"
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="26467084"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 21:13:48 -0700
X-CSE-ConnectionGUID: BI6EFlDFSUu5QCZG6i8UDA==
X-CSE-MsgGUID: bl06WJfMQoe3QtwiJhhcWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="74202370"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 01 Oct 2024 21:13:46 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svqkC-000RXA-2E;
	Wed, 02 Oct 2024 04:13:44 +0000
Date: Wed, 2 Oct 2024 12:13:20 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mark:perf/overflow 2/3] drivers/perf/arm_pmuv3.c:721:3: error:
 implicit declaration of function 'write_pmovsset' is invalid in C99
Message-ID: <202410021251.H7cGVZOx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git perf/overflow
head:   ea54acc0526c6ee4bbd111f57203bc23790ecfe5
commit: a04cfff6860a56b2b23b9731d83d2196d3414918 [2/3] arm_pmu: rework overflow handling
config: arm-randconfig-003-20241002 (https://download.01.org/0day-ci/archive/20241002/202410021251.H7cGVZOx-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410021251.H7cGVZOx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410021251.H7cGVZOx-lkp@intel.com/

All errors (new ones prefixed by >>):

                                                                   ^~~~~~
   drivers/perf/arm_pmuv3.c:139:2: note: previous initialization is here
           PERF_CACHE_MAP_ALL_UNSUPPORTED,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:49:31: note: expanded from macro 'PERF_CACHE_MAP_ALL_UNSUPPORTED'
                   [0 ... C(RESULT_MAX) - 1] = CACHE_OP_UNSUPPORTED,       \
                                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:41:31: note: expanded from macro 'CACHE_OP_UNSUPPORTED'
   #define CACHE_OP_UNSUPPORTED            0xFFFF
                                           ^~~~~~
   drivers/perf/arm_pmuv3.c:146:44: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [C(DTLB)][C(OP_READ)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_L1D_TLB_RD,
                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:134:44: note: expanded from macro 'ARMV8_IMPDEF_PERFCTR_L1D_TLB_RD'
   #define ARMV8_IMPDEF_PERFCTR_L1D_TLB_RD                         0x004E
                                                                   ^~~~~~
   drivers/perf/arm_pmuv3.c:139:2: note: previous initialization is here
           PERF_CACHE_MAP_ALL_UNSUPPORTED,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:49:31: note: expanded from macro 'PERF_CACHE_MAP_ALL_UNSUPPORTED'
                   [0 ... C(RESULT_MAX) - 1] = CACHE_OP_UNSUPPORTED,       \
                                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:41:31: note: expanded from macro 'CACHE_OP_UNSUPPORTED'
   #define CACHE_OP_UNSUPPORTED            0xFFFF
                                           ^~~~~~
   drivers/perf/arm_pmuv3.c:147:45: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [C(DTLB)][C(OP_WRITE)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_L1D_TLB_WR,
                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:135:44: note: expanded from macro 'ARMV8_IMPDEF_PERFCTR_L1D_TLB_WR'
   #define ARMV8_IMPDEF_PERFCTR_L1D_TLB_WR                         0x004F
                                                                   ^~~~~~
   drivers/perf/arm_pmuv3.c:139:2: note: previous initialization is here
           PERF_CACHE_MAP_ALL_UNSUPPORTED,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:49:31: note: expanded from macro 'PERF_CACHE_MAP_ALL_UNSUPPORTED'
                   [0 ... C(RESULT_MAX) - 1] = CACHE_OP_UNSUPPORTED,       \
                                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:41:31: note: expanded from macro 'CACHE_OP_UNSUPPORTED'
   #define CACHE_OP_UNSUPPORTED            0xFFFF
                                           ^~~~~~
   drivers/perf/arm_pmuv3.c:148:42: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [C(DTLB)][C(OP_READ)][C(RESULT_MISS)]   = ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_RD,
                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:132:50: note: expanded from macro 'ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_RD'
   #define ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_RD                  0x004C
                                                                   ^~~~~~
   drivers/perf/arm_pmuv3.c:139:2: note: previous initialization is here
           PERF_CACHE_MAP_ALL_UNSUPPORTED,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:49:31: note: expanded from macro 'PERF_CACHE_MAP_ALL_UNSUPPORTED'
                   [0 ... C(RESULT_MAX) - 1] = CACHE_OP_UNSUPPORTED,       \
                                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:41:31: note: expanded from macro 'CACHE_OP_UNSUPPORTED'
   #define CACHE_OP_UNSUPPORTED            0xFFFF
                                           ^~~~~~
   drivers/perf/arm_pmuv3.c:149:43: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [C(DTLB)][C(OP_WRITE)][C(RESULT_MISS)]  = ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_WR,
                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:133:50: note: expanded from macro 'ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_WR'
   #define ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_WR                  0x004D
                                                                   ^~~~~~
   drivers/perf/arm_pmuv3.c:139:2: note: previous initialization is here
           PERF_CACHE_MAP_ALL_UNSUPPORTED,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:49:31: note: expanded from macro 'PERF_CACHE_MAP_ALL_UNSUPPORTED'
                   [0 ... C(RESULT_MAX) - 1] = CACHE_OP_UNSUPPORTED,       \
                                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:41:31: note: expanded from macro 'CACHE_OP_UNSUPPORTED'
   #define CACHE_OP_UNSUPPORTED            0xFFFF
                                           ^~~~~~
   drivers/perf/arm_pmuv3.c:151:44: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [C(NODE)][C(OP_READ)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_RD,
                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:149:46: note: expanded from macro 'ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_RD'
   #define ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_RD                      0x0060
                                                                   ^~~~~~
   drivers/perf/arm_pmuv3.c:139:2: note: previous initialization is here
           PERF_CACHE_MAP_ALL_UNSUPPORTED,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:49:31: note: expanded from macro 'PERF_CACHE_MAP_ALL_UNSUPPORTED'
                   [0 ... C(RESULT_MAX) - 1] = CACHE_OP_UNSUPPORTED,       \
                                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:41:31: note: expanded from macro 'CACHE_OP_UNSUPPORTED'
   #define CACHE_OP_UNSUPPORTED            0xFFFF
                                           ^~~~~~
   drivers/perf/arm_pmuv3.c:152:45: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [C(NODE)][C(OP_WRITE)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_WR,
                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:150:46: note: expanded from macro 'ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_WR'
   #define ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_WR                      0x0061
                                                                   ^~~~~~
   drivers/perf/arm_pmuv3.c:139:2: note: previous initialization is here
           PERF_CACHE_MAP_ALL_UNSUPPORTED,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:49:31: note: expanded from macro 'PERF_CACHE_MAP_ALL_UNSUPPORTED'
                   [0 ... C(RESULT_MAX) - 1] = CACHE_OP_UNSUPPORTED,       \
                                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:41:31: note: expanded from macro 'CACHE_OP_UNSUPPORTED'
   #define CACHE_OP_UNSUPPORTED            0xFFFF
                                           ^~~~~~
>> drivers/perf/arm_pmuv3.c:721:3: error: implicit declaration of function 'write_pmovsset' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   write_pmovsset(BIT(event->hw.idx));
                   ^
   drivers/perf/arm_pmuv3.c:721:3: note: did you mean 'write_pmovsclr'?
   arch/arm/include/asm/arm_pmuv3.h:200:20: note: 'write_pmovsclr' declared here
   static inline void write_pmovsclr(u32 val)
                      ^
   55 warnings and 1 error generated.


vim +/write_pmovsset +721 drivers/perf/arm_pmuv3.c

   713	
   714	static void armv8pmu_enable_event_irq(struct perf_event *event)
   715	{
   716		armv8pmu_enable_intens(BIT(event->hw.idx));
   717	
   718		// TODO: explain why
   719		// TODO: explain no ISB
   720		if (local64_read(&event->hw.period_left) <= 0)
 > 721			write_pmovsset(BIT(event->hw.idx));
   722	}
   723	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
