Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29EEB22259A;
	Mon, 10 Mar 2025 08:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741594128; cv=none; b=TMmVYz+6AdGkNcBb2HM+7gaTVa91U4UuZvmgCS8qO5J9kWCTSesri8nEwCDIs4GhWEJJki8MI5YwDlXBIml0aDrORHcaSOxnzzXT7nPBYr6KOz0wgPisT3eusN12kmY9bsGcsDg0aUjnde/4odCbdFPYZGM3QuP6r/VPhCDyWsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741594128; c=relaxed/simple;
	bh=2zcIEDXS3aEXzD588IuLC3Ee8ZdLwX3i5YyI3u4wfLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mR1qXRt4cNcQgXJT6jyaGKvHlp0AKvrc21ZJj+akVK1+Zz2JTm8WO/7fLiUO+TMWoLvIYlAuJo4D8euKCV1zVv+LIxyKATDFZa7kSSZLRgFwraC102ntFBWw4VcrXsaNCiiZD5ekpWRBcJx6tbE9mdi8Mbi26XU4AvaXFT1unyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LehJXJn/; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LehJXJn/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741594126; x=1773130126;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2zcIEDXS3aEXzD588IuLC3Ee8ZdLwX3i5YyI3u4wfLw=;
  b=LehJXJn/vTWjjaEr9u8KL95FhLbWp3z4rxaevz2t9i3jCNOOBS9xBBw8
   JlPub+vhEKG0NOE3elWjxBqWbXjHEyqVRL37/hZ2zBPpq8XxbugqGxtgw
   U6MK4e6wj+zZ0sG2BGwjs0EFPJ1+EOkReotX0e9HkgXCAsZJhNrLF+yqm
   jTtK5CdSdBE72pa5aLgWzJhY0yAq2NgrjkkXF8qXO789k2TWvGPb2poho
   RGHl5Nu3uCRTV8WsksLuuvKK6jM0+rJp25IiEwTUuXZEw+FX5A1jC0hnJ
   m32YkT3ogC+CxnaurwO9jIwAYMI1HF2RIVBjb/iY+d/Y71Y8vn78N/7+v
   w==;
X-CSE-ConnectionGUID: y7PEbxjCQq2pMqhD/gtwSQ==
X-CSE-MsgGUID: 2JIfKnytSKW8FeExoq5FZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="42484444"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="42484444"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 01:08:46 -0700
X-CSE-ConnectionGUID: Qq2XDxOMQG6mt6MhcNKYfg==
X-CSE-MsgGUID: WDL6zCB8RE28uTO57J5AIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="120443152"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 10 Mar 2025 01:08:45 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trYBm-0003ya-0Z;
	Mon, 10 Mar 2025 08:08:42 +0000
Date: Mon, 10 Mar 2025 16:08:15 +0800
From: kernel test robot <lkp@intel.com>
To: Mina Almasry <almasrymina@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC net-next v1] page_pool: import Jesper's page_pool
 benchmark
Message-ID: <202503101512.rKBZoYNW-lkp@intel.com>
References: <20250309084118.3080950-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309084118.3080950-1-almasrymina@google.com>

Hi Mina,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 8ef890df4031121a94407c84659125cbccd3fdbe]

url:    https://github.com/intel-lab-lkp/linux/commits/Mina-Almasry/page_pool-import-Jesper-s-page_pool-benchmark/20250309-164215
base:   8ef890df4031121a94407c84659125cbccd3fdbe
patch link:    https://lore.kernel.org/r/20250309084118.3080950-1-almasrymina%40google.com
patch subject: [PATCH RFC net-next v1] page_pool: import Jesper's page_pool benchmark
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250310/202503101512.rKBZoYNW-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250310/202503101512.rKBZoYNW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503101512.rKBZoYNW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/bench/bench_page_pool_simple.c:10:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from lib/bench/bench_page_pool_simple.c:19:
>> lib/bench/time_bench.h:109:30: error: unknown register name '%rax' in asm
     109 |                      : "=r"(hi), "=r"(lo)::"%rax", "%rbx", "%rcx", "%rdx");
         |                                            ^
   lib/bench/time_bench.h:122:30: error: unknown register name '%rax' in asm
     122 |                      : "=r"(hi), "=r"(lo)::"%rax", "%rbx", "%rcx", "%rdx");
         |                                            ^
>> lib/bench/time_bench.h:188:46: error: invalid input constraint 'c' in asm
     188 |         asm volatile("rdpmc" : "=d" (d), "=a" (a) : "c" (in) : "memory");
         |                                                     ^
>> lib/bench/time_bench.h:216:9: error: call to undeclared function 'rdmsrl_safe'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     216 |         return rdmsrl_safe(MSR_IA32_PCM0, msr_result);
         |                ^
   3 warnings and 4 errors generated.
--
   In file included from lib/bench/time_bench.c:9:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> lib/bench/time_bench.c:11:10: fatal error: 'linux/time_bench.h' file not found
      11 | #include <linux/time_bench.h>
         |          ^~~~~~~~~~~~~~~~~~~~
   3 warnings and 1 error generated.


vim +109 lib/bench/time_bench.h

    74	
    75	/*
    76	 * Below TSC assembler code is not compatible with other archs, and
    77	 * can also fail on guests if cpu-flags are not correct.
    78	 *
    79	 * The way TSC reading is used, many iterations, does not require as
    80	 * high accuracy as described below (in Intel Doc #324264).
    81	 *
    82	 * Considering changing to use get_cycles() (#include <asm/timex.h>).
    83	 */
    84	
    85	/** TSC (Time-Stamp Counter) based **
    86	 * Recommend reading, to understand details of reading TSC accurately:
    87	 *  Intel Doc #324264, "How to Benchmark Code Execution Times on Intel"
    88	 *
    89	 * Consider getting exclusive ownership of CPU by using:
    90	 *   unsigned long flags;
    91	 *   preempt_disable();
    92	 *   raw_local_irq_save(flags);
    93	 *   _your_code_
    94	 *   raw_local_irq_restore(flags);
    95	 *   preempt_enable();
    96	 *
    97	 * Clobbered registers: "%rax", "%rbx", "%rcx", "%rdx"
    98	 *  RDTSC only change "%rax" and "%rdx" but
    99	 *  CPUID clears the high 32-bits of all (rax/rbx/rcx/rdx)
   100	 */
   101	static __always_inline uint64_t tsc_start_clock(void)
   102	{
   103		/* See: Intel Doc #324264 */
   104		unsigned hi, lo;
   105		asm volatile("CPUID\n\t"
   106			     "RDTSC\n\t"
   107			     "mov %%edx, %0\n\t"
   108			     "mov %%eax, %1\n\t"
 > 109			     : "=r"(hi), "=r"(lo)::"%rax", "%rbx", "%rcx", "%rdx");
   110		//FIXME: on 32bit use clobbered %eax + %edx
   111		return ((uint64_t)lo) | (((uint64_t)hi) << 32);
   112	}
   113	
   114	static __always_inline uint64_t tsc_stop_clock(void)
   115	{
   116		/* See: Intel Doc #324264 */
   117		unsigned hi, lo;
   118		asm volatile("RDTSCP\n\t"
   119			     "mov %%edx, %0\n\t"
   120			     "mov %%eax, %1\n\t"
   121			     "CPUID\n\t"
   122			     : "=r"(hi), "=r"(lo)::"%rax", "%rbx", "%rcx", "%rdx");
   123		return ((uint64_t)lo) | (((uint64_t)hi) << 32);
   124	}
   125	
   126	/* Notes for RDTSC and RDTSCP
   127	 *
   128	 * Hannes found out that __builtin_ia32_rdtsc and
   129	 * __builtin_ia32_rdtscp are undocumented available in gcc, so there
   130	 * is no need to write inline assembler functions for them any more.
   131	 *
   132	 *  unsigned long long __builtin_ia32_rdtscp(unsigned int *foo);
   133	 *   (where foo is set to: numa_node << 12 | cpu)
   134	 *    and
   135	 *  unsigned long long __builtin_ia32_rdtsc(void);
   136	 *
   137	 * Above we combine the calls with CPUID, thus I don't see how this is
   138	 * directly appreciable.
   139	 */
   140	
   141	/*
   142	inline uint64_t rdtsc(void)
   143	{
   144		uint32_t low, high;
   145		asm volatile("rdtsc" : "=a" (low), "=d" (high));
   146		return low  | (((uint64_t )high ) << 32);
   147	}
   148	*/
   149	
   150	/** Wall-clock based **
   151	 *
   152	 * use: getnstimeofday()
   153	 *  getnstimeofday(&rec->ts_start);
   154	 *  getnstimeofday(&rec->ts_stop);
   155	 *
   156	 * API changed see: Documentation/core-api/timekeeping.rst
   157	 *  https://www.kernel.org/doc/html/latest/core-api/timekeeping.html#c.getnstimeofday
   158	 *
   159	 * We should instead use: ktime_get_real_ts64() is a direct
   160	 *  replacement, but consider using monotonic time (ktime_get_ts64())
   161	 *  and/or a ktime_t based interface (ktime_get()/ktime_get_real()).
   162	 */
   163	
   164	/** PMU (Performance Monitor Unit) based **
   165	 *
   166	 * Needed for calculating: Instructions Per Cycle (IPC)
   167	 * - The IPC number tell how efficient the CPU pipelining were
   168	 */
   169	//lookup: perf_event_create_kernel_counter()
   170	
   171	bool time_bench_PMU_config(bool enable);
   172	
   173	/* Raw reading via rdpmc() using fixed counters
   174	 *
   175	 * From: https://github.com/andikleen/simple-pmu
   176	 */
   177	enum {
   178		FIXED_SELECT = (1U << 30), /* == 0x40000000 */
   179		FIXED_INST_RETIRED_ANY      = 0,
   180		FIXED_CPU_CLK_UNHALTED_CORE = 1,
   181		FIXED_CPU_CLK_UNHALTED_REF  = 2,
   182	};
   183	
   184	static __always_inline unsigned long long p_rdpmc(unsigned in)
   185	{
   186		unsigned d, a;
   187	
 > 188		asm volatile("rdpmc" : "=d" (d), "=a" (a) : "c" (in) : "memory");
   189		return ((unsigned long long)d << 32) | a;
   190	}
   191	
   192	/* These PMU counter needs to be enabled, but I don't have the
   193	 * configure code implemented.  My current hack is running:
   194	 *  sudo perf stat -e cycles:k -e instructions:k insmod lib/ring_queue_test.ko
   195	 */
   196	/* Reading all pipelined instruction */
   197	static __always_inline unsigned long long pmc_inst(void)
   198	{
   199		return p_rdpmc(FIXED_SELECT | FIXED_INST_RETIRED_ANY);
   200	}
   201	
   202	/* Reading CPU clock cycles */
   203	static __always_inline unsigned long long pmc_clk(void)
   204	{
   205		return p_rdpmc(FIXED_SELECT | FIXED_CPU_CLK_UNHALTED_CORE);
   206	}
   207	
   208	/* Raw reading via MSR rdmsr() is likely wrong
   209	 * FIXME: How can I know which raw MSR registers are conf for what?
   210	 */
   211	#define MSR_IA32_PCM0 0x400000C1 /* PERFCTR0 */
   212	#define MSR_IA32_PCM1 0x400000C2 /* PERFCTR1 */
   213	#define MSR_IA32_PCM2 0x400000C3
   214	static inline uint64_t msr_inst(unsigned long long *msr_result)
   215	{
 > 216		return rdmsrl_safe(MSR_IA32_PCM0, msr_result);
   217	}
   218	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
