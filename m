Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE653D8E;
	Thu, 28 Dec 2023 05:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="leMcDOfQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703740775; x=1735276775;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fjzv33XZnTp/hjoEz1NbDHsqkwJlpvQsmcq1xLwrCy4=;
  b=leMcDOfQe9twVBPZdgz+PAMsAHbagZ9ovAFoPABFRRMihP6v8VqjZ4AK
   Q0iiByGoJrm1JRa2CMbmV80SdswEG0xXjBpaIJWIh53WzYQHRggupsMne
   haIPLK07YT7Sv3tMCceEF+yTnZ+gNBWdSqKbidln6r3lRGKx4W9grmr8g
   WLYFnWegcprQzlvMMV6TxupSvZTckm5JjEf1q+uFrq04q1LWJeuKVmXVG
   GAbn87CLswGL6KezBal6d59aOQSHq0M0ajJjPWlqLdezA16FJ8AwqlUzs
   SHL6Duojzs+UubPSTLkZkY/FWod6t/EV0cau2w8lLzKOFkoi7O9uRDXjP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="482692893"
X-IronPort-AV: E=Sophos;i="6.04,311,1695711600"; 
   d="scan'208";a="482692893"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2023 21:19:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="754643982"
X-IronPort-AV: E=Sophos;i="6.04,311,1695711600"; 
   d="scan'208";a="754643982"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 27 Dec 2023 21:19:26 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rIinj-000G85-36;
	Thu, 28 Dec 2023 05:19:23 +0000
Date: Thu, 28 Dec 2023 13:18:31 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:timers/core 6/11] kernel/cpu.c:2214:22: error:
 use of undeclared identifier 'tick_cpu_dying'
Message-ID: <202312281344.woLNgsmp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git timers/core
head:   853f95518ac9ba0370a1418edd728d2cc73c638e
commit: 2a549e1aca77faca676414e03099b8faa4048b50 [6/11] timers: Start centralizing tick related CPU hotplug operations
config: hexagon-randconfig-001-20231228 (https://download.01.org/0day-ci/archive/20231228/202312281344.woLNgsmp-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project d3ef86708241a3bee902615c190dead1638c4e09)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231228/202312281344.woLNgsmp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312281344.woLNgsmp-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from kernel/cpu.c:13:
   In file included from include/linux/sched/isolation.h:6:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from kernel/cpu.c:13:
   In file included from include/linux/sched/isolation.h:6:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from kernel/cpu.c:13:
   In file included from include/linux/sched/isolation.h:6:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> kernel/cpu.c:2214:22: error: use of undeclared identifier 'tick_cpu_dying'
    2214 |                 .teardown.single        = tick_cpu_dying,
         |                                           ^
>> kernel/cpu.c:2083:26: warning: tentative array definition assumed to have one element
    2083 | static struct cpuhp_step cpuhp_hp_states[] = {
         |                          ^
   7 warnings and 1 error generated.


vim +/tick_cpu_dying +2214 kernel/cpu.c

  2081	
  2082	/* Boot processor state steps */
> 2083	static struct cpuhp_step cpuhp_hp_states[] = {
  2084		[CPUHP_OFFLINE] = {
  2085			.name			= "offline",
  2086			.startup.single		= NULL,
  2087			.teardown.single	= NULL,
  2088		},
  2089	#ifdef CONFIG_SMP
  2090		[CPUHP_CREATE_THREADS]= {
  2091			.name			= "threads:prepare",
  2092			.startup.single		= smpboot_create_threads,
  2093			.teardown.single	= NULL,
  2094			.cant_stop		= true,
  2095		},
  2096		[CPUHP_PERF_PREPARE] = {
  2097			.name			= "perf:prepare",
  2098			.startup.single		= perf_event_init_cpu,
  2099			.teardown.single	= perf_event_exit_cpu,
  2100		},
  2101		[CPUHP_RANDOM_PREPARE] = {
  2102			.name			= "random:prepare",
  2103			.startup.single		= random_prepare_cpu,
  2104			.teardown.single	= NULL,
  2105		},
  2106		[CPUHP_WORKQUEUE_PREP] = {
  2107			.name			= "workqueue:prepare",
  2108			.startup.single		= workqueue_prepare_cpu,
  2109			.teardown.single	= NULL,
  2110		},
  2111		[CPUHP_HRTIMERS_PREPARE] = {
  2112			.name			= "hrtimers:prepare",
  2113			.startup.single		= hrtimers_prepare_cpu,
  2114			.teardown.single	= NULL,
  2115		},
  2116		[CPUHP_SMPCFD_PREPARE] = {
  2117			.name			= "smpcfd:prepare",
  2118			.startup.single		= smpcfd_prepare_cpu,
  2119			.teardown.single	= smpcfd_dead_cpu,
  2120		},
  2121		[CPUHP_RELAY_PREPARE] = {
  2122			.name			= "relay:prepare",
  2123			.startup.single		= relay_prepare_cpu,
  2124			.teardown.single	= NULL,
  2125		},
  2126		[CPUHP_SLAB_PREPARE] = {
  2127			.name			= "slab:prepare",
  2128			.startup.single		= slab_prepare_cpu,
  2129			.teardown.single	= slab_dead_cpu,
  2130		},
  2131		[CPUHP_RCUTREE_PREP] = {
  2132			.name			= "RCU/tree:prepare",
  2133			.startup.single		= rcutree_prepare_cpu,
  2134			.teardown.single	= rcutree_dead_cpu,
  2135		},
  2136		/*
  2137		 * On the tear-down path, timers_dead_cpu() must be invoked
  2138		 * before blk_mq_queue_reinit_notify() from notify_dead(),
  2139		 * otherwise a RCU stall occurs.
  2140		 */
  2141		[CPUHP_TIMERS_PREPARE] = {
  2142			.name			= "timers:prepare",
  2143			.startup.single		= timers_prepare_cpu,
  2144			.teardown.single	= timers_dead_cpu,
  2145		},
  2146	
  2147	#ifdef CONFIG_HOTPLUG_SPLIT_STARTUP
  2148		/*
  2149		 * Kicks the AP alive. AP will wait in cpuhp_ap_sync_alive() until
  2150		 * the next step will release it.
  2151		 */
  2152		[CPUHP_BP_KICK_AP] = {
  2153			.name			= "cpu:kick_ap",
  2154			.startup.single		= cpuhp_kick_ap_alive,
  2155		},
  2156	
  2157		/*
  2158		 * Waits for the AP to reach cpuhp_ap_sync_alive() and then
  2159		 * releases it for the complete bringup.
  2160		 */
  2161		[CPUHP_BRINGUP_CPU] = {
  2162			.name			= "cpu:bringup",
  2163			.startup.single		= cpuhp_bringup_ap,
  2164			.teardown.single	= finish_cpu,
  2165			.cant_stop		= true,
  2166		},
  2167	#else
  2168		/*
  2169		 * All-in-one CPU bringup state which includes the kick alive.
  2170		 */
  2171		[CPUHP_BRINGUP_CPU] = {
  2172			.name			= "cpu:bringup",
  2173			.startup.single		= bringup_cpu,
  2174			.teardown.single	= finish_cpu,
  2175			.cant_stop		= true,
  2176		},
  2177	#endif
  2178		/* Final state before CPU kills itself */
  2179		[CPUHP_AP_IDLE_DEAD] = {
  2180			.name			= "idle:dead",
  2181		},
  2182		/*
  2183		 * Last state before CPU enters the idle loop to die. Transient state
  2184		 * for synchronization.
  2185		 */
  2186		[CPUHP_AP_OFFLINE] = {
  2187			.name			= "ap:offline",
  2188			.cant_stop		= true,
  2189		},
  2190		/* First state is scheduler control. Interrupts are disabled */
  2191		[CPUHP_AP_SCHED_STARTING] = {
  2192			.name			= "sched:starting",
  2193			.startup.single		= sched_cpu_starting,
  2194			.teardown.single	= sched_cpu_dying,
  2195		},
  2196		[CPUHP_AP_RCUTREE_DYING] = {
  2197			.name			= "RCU/tree:dying",
  2198			.startup.single		= NULL,
  2199			.teardown.single	= rcutree_dying_cpu,
  2200		},
  2201		[CPUHP_AP_SMPCFD_DYING] = {
  2202			.name			= "smpcfd:dying",
  2203			.startup.single		= NULL,
  2204			.teardown.single	= smpcfd_dying_cpu,
  2205		},
  2206		[CPUHP_AP_HRTIMERS_DYING] = {
  2207			.name			= "hrtimers:dying",
  2208			.startup.single		= NULL,
  2209			.teardown.single	= hrtimers_cpu_dying,
  2210		},
  2211		[CPUHP_AP_TICK_DYING] = {
  2212			.name			= "tick:dying",
  2213			.startup.single		= NULL,
> 2214			.teardown.single	= tick_cpu_dying,
  2215		},
  2216		/* Entry state on starting. Interrupts enabled from here on. Transient
  2217		 * state for synchronsization */
  2218		[CPUHP_AP_ONLINE] = {
  2219			.name			= "ap:online",
  2220		},
  2221		/*
  2222		 * Handled on control processor until the plugged processor manages
  2223		 * this itself.
  2224		 */
  2225		[CPUHP_TEARDOWN_CPU] = {
  2226			.name			= "cpu:teardown",
  2227			.startup.single		= NULL,
  2228			.teardown.single	= takedown_cpu,
  2229			.cant_stop		= true,
  2230		},
  2231	
  2232		[CPUHP_AP_SCHED_WAIT_EMPTY] = {
  2233			.name			= "sched:waitempty",
  2234			.startup.single		= NULL,
  2235			.teardown.single	= sched_cpu_wait_empty,
  2236		},
  2237	
  2238		/* Handle smpboot threads park/unpark */
  2239		[CPUHP_AP_SMPBOOT_THREADS] = {
  2240			.name			= "smpboot/threads:online",
  2241			.startup.single		= smpboot_unpark_threads,
  2242			.teardown.single	= smpboot_park_threads,
  2243		},
  2244		[CPUHP_AP_IRQ_AFFINITY_ONLINE] = {
  2245			.name			= "irq/affinity:online",
  2246			.startup.single		= irq_affinity_online_cpu,
  2247			.teardown.single	= NULL,
  2248		},
  2249		[CPUHP_AP_PERF_ONLINE] = {
  2250			.name			= "perf:online",
  2251			.startup.single		= perf_event_init_cpu,
  2252			.teardown.single	= perf_event_exit_cpu,
  2253		},
  2254		[CPUHP_AP_WATCHDOG_ONLINE] = {
  2255			.name			= "lockup_detector:online",
  2256			.startup.single		= lockup_detector_online_cpu,
  2257			.teardown.single	= lockup_detector_offline_cpu,
  2258		},
  2259		[CPUHP_AP_WORKQUEUE_ONLINE] = {
  2260			.name			= "workqueue:online",
  2261			.startup.single		= workqueue_online_cpu,
  2262			.teardown.single	= workqueue_offline_cpu,
  2263		},
  2264		[CPUHP_AP_RANDOM_ONLINE] = {
  2265			.name			= "random:online",
  2266			.startup.single		= random_online_cpu,
  2267			.teardown.single	= NULL,
  2268		},
  2269		[CPUHP_AP_RCUTREE_ONLINE] = {
  2270			.name			= "RCU/tree:online",
  2271			.startup.single		= rcutree_online_cpu,
  2272			.teardown.single	= rcutree_offline_cpu,
  2273		},
  2274	#endif
  2275		/*
  2276		 * The dynamically registered state space is here
  2277		 */
  2278	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
