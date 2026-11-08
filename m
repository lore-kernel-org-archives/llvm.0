Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794165058;
	b=NNAcv0pAb0TXbGqOB1TbPfXvXqcMQXQNBPEYnSrn3W2IHLocZMf4Vaqb7xts2wxdAPhJ
	 n70GTCeoUcQAgg+/2++fWajNcB6+PLM3hQXwfjSc/W1a2XGo5AuCThjhLaIjpzbaELP16
	 7UVztBSz03SdWWgwMuR/JrGEATvVNtL+LFh8QgOeITRmPKmPAGrO4IYXGlKVd2Aihoag3
	 C9nDI97NEDNaDyp6tCOBBmB7Ap9P5XqQTO2Tsmp27dlzQpBVwdt5GmXJL1yDwlRIJ8SJS
	 AXH9a3XcKRS4Wc6ixo/orMDak41cbW2UL6JEMP5aTUSxjlifSM78r5sJdipTTGxEn4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794165058;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=OBmOVOeuu0b1KfIQVTMKWXDAk0ymYuFhnsDI6xXEjCM=;
	b=Hf2cqdOisf5Q+Vl+qbt7qe6cWBDnvWUT1/ejZTjd7uKfAaZit36rG6q8C3lGoTAEZEiR
	 9Ju+SVKKKZEiHfG2zclr4eAVwLbiHXmxttQIeHCIwz+2WzeT6rlVYZmvOOkqvtDtwelEU
	 7bBLqRDVldzydqagGFl/SRX4eqMXBRqiRbN0y/f3X17cm3FBI/PjsjUGxNa5G9sm62SgT
	 QWa+IaB5MD1w1m/Dw4VrUVIHpGkhsP8Mc28yXReP7cIQbWQePPKluV6VW9escwirohBJE
	 D2GIc1+2L9yXvqhTPY484h0eUZpaJLSXncs8aMVNVnrw71lQ45hxNqdlvDtOx+7kZ8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MrDA07y1;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E317606A323;
	Sun,  8 Nov 2026 19:10:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E317606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MrDA07y1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794165058; x=1825701058;
  h=date:from:to:cc:subject:message-id;
  bh=Ja8SnQXiSvHF5W1Pur+70P8425HjTVDljPM4MgA2fF4=;
  b=MrDA07y19Ni62W/fo/QL8CMSSRBNSbp7JHODetLdpI+R3o/zAXag82QJ
   6AfG6o20agIPNviT8qRJ8wc6M3SslbWHOKOUnsLOPtePRjLKhMH+R7gMH
   l0C0rkCJIae+UjF4Xayo/su/mWQJRzKkUScK6eYZgmFPUxGBFgtRU6SKs
   DypsdwywOoHmwU0FJK9flQ5Jh/dmTQX54/tz4cGoaAGLlOprufZwN+tUX
   sKF0UYnchrgjuyGs66+OE06M8WduJJ+gT/c/SxeshcwKiLCVdu9mTOyNF
   LL+slTHDMelopzyeY4G/Ke4Xs/0Xy/3lS0WHKaKVoJLJZJgSm9jW+QK1W
   A==;
X-CSE-ConnectionGUID: Ir3gPvb+QtGecd/cSDgDPw==
X-CSE-MsgGUID: i6e9dK4PTSq3lv4UPdYdOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2779828"
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="2779828"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 11:10:55 -0800
X-CSE-ConnectionGUID: z/C3EhySQlykEvr5M4KwGg==
X-CSE-MsgGUID: I4PnGzzwQUqG1U/BY0dKYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="7578758"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 08 Nov 2026 11:10:53 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQ8Hz-00000000BfR-09HJ;
	Sun, 08 Nov 2026 19:10:51 +0000
Date: Sun, 08 Nov 2026 20:10:39 +0100
From: kernel test robot <lkp@intel.com>
To: Vikram Singh <vikram.singh3@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Anup Patel <anup@brainfault.org>,
 Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
Subject: [avpatel:riscv_sbi_watchdog_v1 94/98]
 include/linux/perf/riscv_pmu.h:153:49: warning: declaration of 'struct
 cpu_hw_events' will not be visible outside of this function
Message-ID: <202611082022.lg1UA0Rn-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/avpatel/linux.git riscv_sbi_watchdog_v1
head:   929bf13433e242a3f255f463b2fb44633e102e0d
commit: b4cc5b9ca0cada8221e31b647640bbae515000a1 [94/98] riscv: pmu: Add driver for Control Transfer Records Ext
config: riscv-randconfig-2002-20261108 (https://download.01.org/0day-ci/archive/20261108/202611082022.lg1UA0Rn-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 0fa861dbbf46e5a75f621406fd91cb015d8754bf)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261108/202611082022.lg1UA0Rn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611082022.lg1UA0Rn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/riscv/kernel/asm-offsets.c:13:
   In file included from arch/riscv/include/asm/kvm_host.h:27:
   In file included from arch/riscv/include/asm/kvm_vcpu_pmu.h:12:
>> include/linux/perf/riscv_pmu.h:153:49: warning: declaration of 'struct cpu_hw_events' will not be visible outside of this function [-Wvisibility]
     153 | static inline void riscv_pmu_ctr_consume(struct cpu_hw_events *cpuc,
         |                                                 ^
>> include/linux/perf/riscv_pmu.h:155:76: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     155 | static inline void riscv_pmu_ctr_sched_task(struct perf_event_pmu_context *,
         |                                                                            ^
>> include/linux/perf/riscv_pmu.h:163:45: warning: declaration of 'struct riscv_pmu' will not be visible outside of this function [-Wvisibility]
     163 | static inline int riscv_pmu_ctr_init(struct riscv_pmu *riscv_pmu) { return 0; }
         |                                             ^
   include/linux/perf/riscv_pmu.h:164:48: warning: declaration of 'struct riscv_pmu' will not be visible outside of this function [-Wvisibility]
     164 | static inline void riscv_pmu_ctr_finish(struct riscv_pmu *riscv_pmu) { }
         |                                                ^
   include/linux/perf/riscv_pmu.h:157:13: warning: unused function 'riscv_pmu_ctr_add' [-Wunused-function]
     157 | static void riscv_pmu_ctr_add(struct perf_event *event) { }
         |             ^~~~~~~~~~~~~~~~~
   include/linux/perf/riscv_pmu.h:158:13: warning: unused function 'riscv_pmu_ctr_del' [-Wunused-function]
     158 | static void riscv_pmu_ctr_del(struct perf_event *event) { }
         |             ^~~~~~~~~~~~~~~~~
   6 warnings generated.
--
   In file included from arch/riscv/kernel/asm-offsets.c:13:
   In file included from arch/riscv/include/asm/kvm_host.h:27:
   In file included from arch/riscv/include/asm/kvm_vcpu_pmu.h:12:
>> include/linux/perf/riscv_pmu.h:153:49: warning: declaration of 'struct cpu_hw_events' will not be visible outside of this function [-Wvisibility]
     153 | static inline void riscv_pmu_ctr_consume(struct cpu_hw_events *cpuc,
         |                                                 ^
>> include/linux/perf/riscv_pmu.h:155:76: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     155 | static inline void riscv_pmu_ctr_sched_task(struct perf_event_pmu_context *,
         |                                                                            ^
>> include/linux/perf/riscv_pmu.h:163:45: warning: declaration of 'struct riscv_pmu' will not be visible outside of this function [-Wvisibility]
     163 | static inline int riscv_pmu_ctr_init(struct riscv_pmu *riscv_pmu) { return 0; }
         |                                             ^
   include/linux/perf/riscv_pmu.h:164:48: warning: declaration of 'struct riscv_pmu' will not be visible outside of this function [-Wvisibility]
     164 | static inline void riscv_pmu_ctr_finish(struct riscv_pmu *riscv_pmu) { }
         |                                                ^
   include/linux/perf/riscv_pmu.h:157:13: warning: unused function 'riscv_pmu_ctr_add' [-Wunused-function]
     157 | static void riscv_pmu_ctr_add(struct perf_event *event) { }
         |             ^~~~~~~~~~~~~~~~~
   include/linux/perf/riscv_pmu.h:158:13: warning: unused function 'riscv_pmu_ctr_del' [-Wunused-function]
     158 | static void riscv_pmu_ctr_del(struct perf_event *event) { }
         |             ^~~~~~~~~~~~~~~~~
   6 warnings generated.


vim +153 include/linux/perf/riscv_pmu.h

   151	
   152	static inline bool riscv_pmu_ctr_valid(struct perf_event *event) { return false; }
 > 153	static inline void riscv_pmu_ctr_consume(struct cpu_hw_events *cpuc,
   154						 struct perf_event *event) { }
 > 155	static inline void riscv_pmu_ctr_sched_task(struct perf_event_pmu_context *,
   156						    struct task_struct *task, bool sched_in) { }
   157	static void riscv_pmu_ctr_add(struct perf_event *event) { }
   158	static void riscv_pmu_ctr_del(struct perf_event *event) { }
   159	static inline void riscv_pmu_ctr_enable(struct perf_event *event) { }
   160	static inline void riscv_pmu_ctr_disable(struct perf_event *event) { }
   161	static inline void riscv_pmu_ctr_dying_cpu(void) { }
   162	static inline void riscv_pmu_ctr_starting_cpu(void) { }
 > 163	static inline int riscv_pmu_ctr_init(struct riscv_pmu *riscv_pmu) { return 0; }
   164	static inline void riscv_pmu_ctr_finish(struct riscv_pmu *riscv_pmu) { }
   165	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
