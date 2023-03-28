Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D03EBB;
	Tue, 28 Mar 2023 08:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679990517; x=1711526517;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UH+Wr48m351WkQAWtbDSqrwhUGVj/9aiRXCvMhzs1Qs=;
  b=JVKZbAIA+Or5F2iE6AxVNkJNGBfXLCoI2XqZY7OVkGYRL2G/NWWs041r
   L/cEJ26GGCr+5s7g7IjKEDKT0EsrG0WYv0hTCc/1L0wj6ABuFKNYpK0AX
   dnSekPwSyhJgaptbFLc0Qcw1D+ryyor629+t3L2Ii8lMf2GTTLcLkZM8W
   gYP4IBq0WxLodHt0B/9OQxM3PXaXU84k81Bp0liDNkRwETpjHU5byA1zh
   wCPuuW9L00zJqBTD9yJXv77Ic9E0mQP5fCARYljrDg73pr8JAF3hQ4UB7
   y5d0dcLbirvm4khA5tKpjY/zgIdfv8s5ewnUSEEq1o/naMy0HKmQxQwPm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="328958668"
X-IronPort-AV: E=Sophos;i="5.98,296,1673942400"; 
   d="scan'208";a="328958668"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 01:01:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="773046354"
X-IronPort-AV: E=Sophos;i="5.98,296,1673942400"; 
   d="scan'208";a="773046354"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 28 Mar 2023 01:01:54 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ph4HC-000INL-0e;
	Tue, 28 Mar 2023 08:01:54 +0000
Date: Tue, 28 Mar 2023 16:01:49 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Will Deacon <will@kernel.org>,
	Zaid Al-Bassam <zalbassam@google.com>
Subject: [linux-next:master 6577/7309] drivers/perf/arm_pmuv3.c:44:2: error:
 use of undeclared identifier 'PERF_MAP_ALL_UNSUPPORTED'
Message-ID: <202303281539.zzI4vpw1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Marc,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a6faf7ea9fcb7267d06116d4188947f26e00e57e
commit: 3b16f6268e660f15aed0bb97aefe87e893eb8882 [6577/7309] ARM: mach-virt: Select PMUv3 driver by default
config: arm-randconfig-r024-20230326 (https://download.01.org/0day-ci/archive/20230328/202303281539.zzI4vpw1-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=3b16f6268e660f15aed0bb97aefe87e893eb8882
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 3b16f6268e660f15aed0bb97aefe87e893eb8882
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/perf/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303281539.zzI4vpw1-lkp@intel.com/

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
236b9b91cd1255 arch/arm64/kernel/perf_event.c Jeremy Linton 2016-09-14 @65  	[C(L1I)][C(OP_READ)][C(RESULT_MISS)]	= ARMV8_PMUV3_PERFCTR_L1I_CACHE_REFILL,
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

:::::: The code at line 44 was first introduced by commit
:::::: ae2fb7ece973f0b285f41985f5de85c57df9bf5a arm64: perf: condense event number maps

:::::: TO: Mark Rutland <mark.rutland@arm.com>
:::::: CC: Will Deacon <will.deacon@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
