Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718DC29B0;
	Thu,  2 Mar 2023 13:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677765509; x=1709301509;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6uHg9EaYBY9rlbJLA2VJr0PEKNhI/2azbn3IzMCX6V8=;
  b=UO8TWEUy63QisaMq63N4tAQZ0WxFyo9FrsRRbgJFcQK1zBWr42yrMaXB
   UdTq1m++Ki1feyfC4MER4GIIFZsrxsxv4FSod85R2p+HpUHbCZ8oJEzrX
   /X/vre4VbSWXAH2MAcA1PUqe8l4Vvu3muxNMF9s4enzjAB+VTabxdgm0m
   GbKkFCc+Bh4S8McvDWT1MZirNnQSLrDowfM3QVkFXfDuF5DVNfQwUMikX
   dRfeH6MOsrB49W3Rdb6UenVUfjoptAf9tFW4FczrBrtgwBDRfz71K2U/x
   nfrlPv4JrlZ+A92v+kmGTfF7twC1u9AJ9rBxjcyqKPn0eNHnOYB1i5AWE
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="397290252"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; 
   d="scan'208";a="397290252"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2023 05:58:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="798834243"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; 
   d="scan'208";a="798834243"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 02 Mar 2023 05:58:15 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXjRm-0000Vk-2r;
	Thu, 02 Mar 2023 13:58:14 +0000
Date: Thu, 2 Mar 2023 21:57:22 +0800
From: kernel test robot <lkp@intel.com>
To: Zaid Al-Bassam <zalbassam@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 8/8] ARM: mach-virt: Select PMUv3 driver by default
Message-ID: <202303022135.fYKzAEbH-lkp@intel.com>
References: <20230126204444.2204061-9-zalbassam@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230126204444.2204061-9-zalbassam@google.com>

Hi Zaid,

I love your patch! Yet something to improve:

[auto build test ERROR on arm64/for-next/core]
[also build test ERROR on arm/for-next arm/fixes tip/perf/core acme/perf/core linus/master v6.2 next-20230302]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zaid-Al-Bassam/arm64-perf-Move-PMUv3-driver-to-drivers-perf/20230128-160421
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20230126204444.2204061-9-zalbassam%40google.com
patch subject: [PATCH 8/8] ARM: mach-virt: Select PMUv3 driver by default
config: arm-randconfig-r032-20230302 (https://download.01.org/0day-ci/archive/20230302/202303022135.fYKzAEbH-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/c0aef6cbbc82a25004ef6064dfd4e13ec4d06150
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Zaid-Al-Bassam/arm64-perf-Move-PMUv3-driver-to-drivers-perf/20230128-160421
        git checkout c0aef6cbbc82a25004ef6064dfd4e13ec4d06150
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303022135.fYKzAEbH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/perf/arm_pmuv3.c:44:2: error: use of undeclared identifier 'PERF_MAP_ALL_UNSUPPORTED'
           PERF_MAP_ALL_UNSUPPORTED,
           ^
>> drivers/perf/arm_pmuv3.c:59:2: error: use of undeclared identifier 'PERF_CACHE_MAP_ALL_UNSUPPORTED'
           PERF_CACHE_MAP_ALL_UNSUPPORTED,
           ^
>> drivers/perf/arm_pmuv3.c:61:3: error: call to undeclared function 'C'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           [C(L1D)][C(OP_READ)][C(RESULT_ACCESS)]  = ARMV8_PMUV3_PERFCTR_L1D_CACHE,
            ^
>> drivers/perf/arm_pmuv3.c:61:5: error: use of undeclared identifier 'L1D'
           [C(L1D)][C(OP_READ)][C(RESULT_ACCESS)]  = ARMV8_PMUV3_PERFCTR_L1D_CACHE,
              ^
>> drivers/perf/arm_pmuv3.c:61:13: error: use of undeclared identifier 'OP_READ'
           [C(L1D)][C(OP_READ)][C(RESULT_ACCESS)]  = ARMV8_PMUV3_PERFCTR_L1D_CACHE,
                      ^
>> drivers/perf/arm_pmuv3.c:61:25: error: use of undeclared identifier 'RESULT_ACCESS'
           [C(L1D)][C(OP_READ)][C(RESULT_ACCESS)]  = ARMV8_PMUV3_PERFCTR_L1D_CACHE,
                                  ^
   drivers/perf/arm_pmuv3.c:62:5: error: use of undeclared identifier 'L1D'
           [C(L1D)][C(OP_READ)][C(RESULT_MISS)]    = ARMV8_PMUV3_PERFCTR_L1D_CACHE_REFILL,
              ^
   drivers/perf/arm_pmuv3.c:62:13: error: use of undeclared identifier 'OP_READ'
           [C(L1D)][C(OP_READ)][C(RESULT_MISS)]    = ARMV8_PMUV3_PERFCTR_L1D_CACHE_REFILL,
                      ^
>> drivers/perf/arm_pmuv3.c:62:25: error: use of undeclared identifier 'RESULT_MISS'
           [C(L1D)][C(OP_READ)][C(RESULT_MISS)]    = ARMV8_PMUV3_PERFCTR_L1D_CACHE_REFILL,
                                  ^
>> drivers/perf/arm_pmuv3.c:64:5: error: use of undeclared identifier 'L1I'
           [C(L1I)][C(OP_READ)][C(RESULT_ACCESS)]  = ARMV8_PMUV3_PERFCTR_L1I_CACHE,
              ^
   drivers/perf/arm_pmuv3.c:64:13: error: use of undeclared identifier 'OP_READ'
           [C(L1I)][C(OP_READ)][C(RESULT_ACCESS)]  = ARMV8_PMUV3_PERFCTR_L1I_CACHE,
                      ^
   drivers/perf/arm_pmuv3.c:64:25: error: use of undeclared identifier 'RESULT_ACCESS'
           [C(L1I)][C(OP_READ)][C(RESULT_ACCESS)]  = ARMV8_PMUV3_PERFCTR_L1I_CACHE,
                                  ^
   drivers/perf/arm_pmuv3.c:65:5: error: use of undeclared identifier 'L1I'
           [C(L1I)][C(OP_READ)][C(RESULT_MISS)]    = ARMV8_PMUV3_PERFCTR_L1I_CACHE_REFILL,
              ^
   drivers/perf/arm_pmuv3.c:65:13: error: use of undeclared identifier 'OP_READ'
           [C(L1I)][C(OP_READ)][C(RESULT_MISS)]    = ARMV8_PMUV3_PERFCTR_L1I_CACHE_REFILL,
                      ^
   drivers/perf/arm_pmuv3.c:65:25: error: use of undeclared identifier 'RESULT_MISS'
           [C(L1I)][C(OP_READ)][C(RESULT_MISS)]    = ARMV8_PMUV3_PERFCTR_L1I_CACHE_REFILL,
                                  ^
>> drivers/perf/arm_pmuv3.c:67:5: error: use of undeclared identifier 'DTLB'
           [C(DTLB)][C(OP_READ)][C(RESULT_MISS)]   = ARMV8_PMUV3_PERFCTR_L1D_TLB_REFILL,
              ^
   drivers/perf/arm_pmuv3.c:67:14: error: use of undeclared identifier 'OP_READ'
           [C(DTLB)][C(OP_READ)][C(RESULT_MISS)]   = ARMV8_PMUV3_PERFCTR_L1D_TLB_REFILL,
                       ^
   drivers/perf/arm_pmuv3.c:67:26: error: use of undeclared identifier 'RESULT_MISS'
           [C(DTLB)][C(OP_READ)][C(RESULT_MISS)]   = ARMV8_PMUV3_PERFCTR_L1D_TLB_REFILL,
                                   ^
   drivers/perf/arm_pmuv3.c:68:5: error: use of undeclared identifier 'DTLB'
           [C(DTLB)][C(OP_READ)][C(RESULT_ACCESS)] = ARMV8_PMUV3_PERFCTR_L1D_TLB,
              ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARM_PMUV3
   Depends on [n]: PERF_EVENTS [=y] && HW_PERF_EVENTS [=n] && (ARM [=y] && CPU_V7 [=y] || ARM64)
   Selected by [y]:
   - ARCH_VIRT [=y] && ARCH_MULTI_V7 [=y] && PERF_EVENTS [=y]


vim +/PERF_MAP_ALL_UNSUPPORTED +44 drivers/perf/arm_pmuv3.c

62a4dda9d63a10 arch/arm64/kernel/perf_event.c Mark Rutland  2015-10-02  37  
236b9b91cd1255 arch/arm64/kernel/perf_event.c Jeremy Linton 2016-09-14  38  /*
236b9b91cd1255 arch/arm64/kernel/perf_event.c Jeremy Linton 2016-09-14  39   * ARMv8 Architectural defined events, not all of these may
342e53bd8548e0 arch/arm64/kernel/perf_event.c Will Deacon   2018-10-05  40   * be supported on any given implementation. Unsupported events will
342e53bd8548e0 arch/arm64/kernel/perf_event.c Will Deacon   2018-10-05  41   * be disabled at run-time based on the PMCEID registers.
236b9b91cd1255 arch/arm64/kernel/perf_event.c Jeremy Linton 2016-09-14  42   */
030896885ade0a arch/arm64/kernel/perf_event.c Will Deacon   2012-03-05  43  static const unsigned armv8_pmuv3_perf_map[PERF_COUNT_HW_MAX] = {
ae2fb7ece973f0 arch/arm64/kernel/perf_event.c Mark Rutland  2015-07-21 @44  	PERF_MAP_ALL_UNSUPPORTED,
03598fdbc9deae arch/arm64/kernel/perf_event.c Ashok Kumar   2016-04-21  45  	[PERF_COUNT_HW_CPU_CYCLES]		= ARMV8_PMUV3_PERFCTR_CPU_CYCLES,
03598fdbc9deae arch/arm64/kernel/perf_event.c Ashok Kumar   2016-04-21  46  	[PERF_COUNT_HW_INSTRUCTIONS]		= ARMV8_PMUV3_PERFCTR_INST_RETIRED,
03598fdbc9deae arch/arm64/kernel/perf_event.c Ashok Kumar   2016-04-21  47  	[PERF_COUNT_HW_CACHE_REFERENCES]	= ARMV8_PMUV3_PERFCTR_L1D_CACHE,
03598fdbc9deae arch/arm64/kernel/perf_event.c Ashok Kumar   2016-04-21  48  	[PERF_COUNT_HW_CACHE_MISSES]		= ARMV8_PMUV3_PERFCTR_L1D_CACHE_REFILL,
236b9b91cd1255 arch/arm64/kernel/perf_event.c Jeremy Linton 2016-09-14  49  	[PERF_COUNT_HW_BRANCH_INSTRUCTIONS]	= ARMV8_PMUV3_PERFCTR_PC_WRITE_RETIRED,
03598fdbc9deae arch/arm64/kernel/perf_event.c Ashok Kumar   2016-04-21  50  	[PERF_COUNT_HW_BRANCH_MISSES]		= ARMV8_PMUV3_PERFCTR_BR_MIS_PRED,
236b9b91cd1255 arch/arm64/kernel/perf_event.c Jeremy Linton 2016-09-14  51  	[PERF_COUNT_HW_BUS_CYCLES]		= ARMV8_PMUV3_PERFCTR_BUS_CYCLES,
236b9b91cd1255 arch/arm64/kernel/perf_event.c Jeremy Linton 2016-09-14  52  	[PERF_COUNT_HW_STALLED_CYCLES_FRONTEND]	= ARMV8_PMUV3_PERFCTR_STALL_FRONTEND,
236b9b91cd1255 arch/arm64/kernel/perf_event.c Jeremy Linton 2016-09-14  53  	[PERF_COUNT_HW_STALLED_CYCLES_BACKEND]	= ARMV8_PMUV3_PERFCTR_STALL_BACKEND,
030896885ade0a arch/arm64/kernel/perf_event.c Will Deacon   2012-03-05  54  };
030896885ade0a arch/arm64/kernel/perf_event.c Will Deacon   2012-03-05  55  
030896885ade0a arch/arm64/kernel/perf_event.c Will Deacon   2012-03-05  56  static const unsigned armv8_pmuv3_perf_cache_map[PERF_COUNT_HW_CACHE_MAX]
030896885ade0a arch/arm64/kernel/perf_event.c Will Deacon   2012-03-05  57  						[PERF_COUNT_HW_CACHE_OP_MAX]
030896885ade0a arch/arm64/kernel/perf_event.c Will Deacon   2012-03-05  58  						[PERF_COUNT_HW_CACHE_RESULT_MAX] = {
ae2fb7ece973f0 arch/arm64/kernel/perf_event.c Mark Rutland  2015-07-21 @59  	PERF_CACHE_MAP_ALL_UNSUPPORTED,
ae2fb7ece973f0 arch/arm64/kernel/perf_event.c Mark Rutland  2015-07-21  60  
03598fdbc9deae arch/arm64/kernel/perf_event.c Ashok Kumar   2016-04-21 @61  	[C(L1D)][C(OP_READ)][C(RESULT_ACCESS)]	= ARMV8_PMUV3_PERFCTR_L1D_CACHE,
03598fdbc9deae arch/arm64/kernel/perf_event.c Ashok Kumar   2016-04-21 @62  	[C(L1D)][C(OP_READ)][C(RESULT_MISS)]	= ARMV8_PMUV3_PERFCTR_L1D_CACHE_REFILL,
ae2fb7ece973f0 arch/arm64/kernel/perf_event.c Mark Rutland  2015-07-21  63  
236b9b91cd1255 arch/arm64/kernel/perf_event.c Jeremy Linton 2016-09-14 @64  	[C(L1I)][C(OP_READ)][C(RESULT_ACCESS)]	= ARMV8_PMUV3_PERFCTR_L1I_CACHE,
236b9b91cd1255 arch/arm64/kernel/perf_event.c Jeremy Linton 2016-09-14  65  	[C(L1I)][C(OP_READ)][C(RESULT_MISS)]	= ARMV8_PMUV3_PERFCTR_L1I_CACHE_REFILL,
236b9b91cd1255 arch/arm64/kernel/perf_event.c Jeremy Linton 2016-09-14  66  
236b9b91cd1255 arch/arm64/kernel/perf_event.c Jeremy Linton 2016-09-14 @67  	[C(DTLB)][C(OP_READ)][C(RESULT_MISS)]	= ARMV8_PMUV3_PERFCTR_L1D_TLB_REFILL,
236b9b91cd1255 arch/arm64/kernel/perf_event.c Jeremy Linton 2016-09-14  68  	[C(DTLB)][C(OP_READ)][C(RESULT_ACCESS)]	= ARMV8_PMUV3_PERFCTR_L1D_TLB,
236b9b91cd1255 arch/arm64/kernel/perf_event.c Jeremy Linton 2016-09-14  69  
236b9b91cd1255 arch/arm64/kernel/perf_event.c Jeremy Linton 2016-09-14  70  	[C(ITLB)][C(OP_READ)][C(RESULT_MISS)]	= ARMV8_PMUV3_PERFCTR_L1I_TLB_REFILL,
236b9b91cd1255 arch/arm64/kernel/perf_event.c Jeremy Linton 2016-09-14  71  	[C(ITLB)][C(OP_READ)][C(RESULT_ACCESS)]	= ARMV8_PMUV3_PERFCTR_L1I_TLB,
236b9b91cd1255 arch/arm64/kernel/perf_event.c Jeremy Linton 2016-09-14  72  
ffdbd3d83553be arch/arm64/kernel/perf_event.c Leo Yan       2020-08-11  73  	[C(LL)][C(OP_READ)][C(RESULT_MISS)]	= ARMV8_PMUV3_PERFCTR_LL_CACHE_MISS_RD,
ffdbd3d83553be arch/arm64/kernel/perf_event.c Leo Yan       2020-08-11  74  	[C(LL)][C(OP_READ)][C(RESULT_ACCESS)]	= ARMV8_PMUV3_PERFCTR_LL_CACHE_RD,
ffdbd3d83553be arch/arm64/kernel/perf_event.c Leo Yan       2020-08-11  75  
03598fdbc9deae arch/arm64/kernel/perf_event.c Ashok Kumar   2016-04-21  76  	[C(BPU)][C(OP_READ)][C(RESULT_ACCESS)]	= ARMV8_PMUV3_PERFCTR_BR_PRED,
03598fdbc9deae arch/arm64/kernel/perf_event.c Ashok Kumar   2016-04-21  77  	[C(BPU)][C(OP_READ)][C(RESULT_MISS)]	= ARMV8_PMUV3_PERFCTR_BR_MIS_PRED,
030896885ade0a arch/arm64/kernel/perf_event.c Will Deacon   2012-03-05  78  };
030896885ade0a arch/arm64/kernel/perf_event.c Will Deacon   2012-03-05  79  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
