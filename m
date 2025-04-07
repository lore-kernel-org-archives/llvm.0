Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1257C188734;
	Mon,  7 Apr 2025 12:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744030540; cv=none; b=rsq09JQuASVVmUP1I9/ZObz3Ot9yZHrAAROka+QOuJdhn5asqtkGSNELeLcbZmmiFWCrb/xp0nZiWYGwO9X0vi+n2SMDJbyKo8y0MbdnoeMavTjs94+IiA74TQVJ89XNHWZ+QoYNaAk44gWWSOGdr5wKiDGHQvF8hveV4yf4Nn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744030540; c=relaxed/simple;
	bh=WCmJrz8osogIt5rUss0E3LihcfFtLWbd82JDej/GyL4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HIdLXFzRZ81LDDMO8NjlRV+v4cKaKZBuxhaoy0LTWBeBiaJBBSKpADtqHM0Qe93OPr45bERKGbgxUtxr0yXda83aWOsqIYb0ueOiN9i4QI38RyPoPMaDqPtDeS5kLnvM8tIbSPDGeymV6MQTxfzWO+icHMhUQIFuBlKamhMEHGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ns411kz8; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ns411kz8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744030538; x=1775566538;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WCmJrz8osogIt5rUss0E3LihcfFtLWbd82JDej/GyL4=;
  b=Ns411kz8EFA1qPTseQzn4cGMJDDWjWn+TlgljcOuLc+V2ksuwjaFeEmK
   +HLlfNMnDCHOjoyd6LKoPdxekCGPSd7ZqQHex4N6hF42mH03AzQSiPPiM
   odTHgTwM9xgsLIdJgky/pd+dR7W2M944r6zYncGoFBcAsPcAqYEyBotQb
   aLhjnhqG0N1uGspApplCgCNuL8Vt6uPNtboarsMlc3kO9LMNzDIP1P4mM
   yxnSnVJZ7xbJ0POXwWEzhqq9vj6VYG3AYdebfX9sa9D5BEjKj6N9pQRMB
   YGoSq9V3xJuxvMvE7ZlTxXBxQMf4d4sgf5aYD0JMqQVUV0J518OU5kHGT
   Q==;
X-CSE-ConnectionGUID: w+71MG83TIe4gDGBQaK2Ww==
X-CSE-MsgGUID: RxYu3n2FRTe+E1D39fxBUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45303855"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="45303855"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 05:55:37 -0700
X-CSE-ConnectionGUID: +FFaFX6+RNKjtpO9OLNrNQ==
X-CSE-MsgGUID: 6UGchre9QV+8OYb5HJmoLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="127929303"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 Apr 2025 05:55:37 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1m0j-0003P5-0O;
	Mon, 07 Apr 2025 12:55:33 +0000
Date: Mon, 7 Apr 2025 20:55:29 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mike Rapoport <rppt@kernel.org>
Subject: [rppt:x86/initmem_init 1/1] arch/x86/mm/numa.c:172:3: error: call to
 undeclared function 'set_apicid_to_node'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202504072048.fRQ7N8Kk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git x86/initmem_init
head:   4473ad8a570559afdf61aa4bb5350db1329e9735
commit: 4473ad8a570559afdf61aa4bb5350db1329e9735 [1/1] x86/mm: consolidate initmem_init()
config: x86_64-buildonly-randconfig-005-20250407 (https://download.01.org/0day-ci/archive/20250407/202504072048.fRQ7N8Kk-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250407/202504072048.fRQ7N8Kk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504072048.fRQ7N8Kk-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> arch/x86/mm/numa.c:50:5: warning: no previous prototype for function 'numa_cpu_node' [-Wmissing-prototypes]
      50 | int numa_cpu_node(int cpu)
         |     ^
   arch/x86/mm/numa.c:50:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      50 | int numa_cpu_node(int cpu)
         | ^
         | static 
>> arch/x86/mm/numa.c:68:6: warning: no previous prototype for function 'numa_set_node' [-Wmissing-prototypes]
      68 | void numa_set_node(int cpu, int node)
         |      ^
   arch/x86/mm/numa.c:68:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      68 | void numa_set_node(int cpu, int node)
         | ^
         | static 
>> arch/x86/mm/numa.c:90:6: warning: no previous prototype for function 'numa_clear_node' [-Wmissing-prototypes]
      90 | void numa_clear_node(int cpu)
         |      ^
   arch/x86/mm/numa.c:90:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      90 | void numa_clear_node(int cpu)
         | ^
         | static 
>> arch/x86/mm/numa.c:172:3: error: call to undeclared function 'set_apicid_to_node'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     172 |                 set_apicid_to_node(i, NUMA_NO_NODE);
         |                 ^
   arch/x86/mm/numa.c:211:14: error: use of undeclared identifier 'numa_nodes_parsed'; did you mean 'numa_node_id'?
     211 |         node_set(0, numa_nodes_parsed);
         |                     ^~~~~~~~~~~~~~~~~
         |                     numa_node_id
   include/linux/nodemask.h:127:50: note: expanded from macro 'node_set'
     127 | #define node_set(node, dst) __node_set((node), &(dst))
         |                                                  ^
   include/linux/topology.h:87:19: note: 'numa_node_id' declared here
      87 | static inline int numa_node_id(void)
         |                   ^
   arch/x86/mm/numa.c:211:2: error: incompatible pointer types passing 'int (*)(void)' to parameter of type 'volatile nodemask_t *' [-Werror,-Wincompatible-pointer-types]
     211 |         node_set(0, numa_nodes_parsed);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/nodemask.h:127:48: note: expanded from macro 'node_set'
     127 | #define node_set(node, dst) __node_set((node), &(dst))
         |                                                ^~~~~~
   include/linux/nodemask.h:128:71: note: passing argument to parameter 'dstp' here
     128 | static __always_inline void __node_set(int node, volatile nodemask_t *dstp)
         |                                                                       ^
>> arch/x86/mm/numa.c:255:13: warning: no previous prototype for function 'init_gi_nodes' [-Wmissing-prototypes]
     255 | void __init init_gi_nodes(void)
         |             ^
   arch/x86/mm/numa.c:255:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     255 | void __init init_gi_nodes(void)
         | ^
         | static 
>> arch/x86/mm/numa.c:287:13: warning: no previous prototype for function 'init_cpu_to_node' [-Wmissing-prototypes]
     287 | void __init init_cpu_to_node(void)
         |             ^
   arch/x86/mm/numa.c:287:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     287 | void __init init_cpu_to_node(void)
         | ^
         | static 
>> arch/x86/mm/numa.c:362:6: warning: no previous prototype for function 'debug_cpumask_set_cpu' [-Wmissing-prototypes]
     362 | void debug_cpumask_set_cpu(unsigned int cpu, int node, bool enable)
         |      ^
   arch/x86/mm/numa.c:362:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     362 | void debug_cpumask_set_cpu(unsigned int cpu, int node, bool enable)
         | ^
         | static 
   6 warnings and 3 errors generated.


vim +/set_apicid_to_node +172 arch/x86/mm/numa.c

bbc9e2f452d9c4 Tejun Heo                 2011-01-23   49  
148f9bb87745ed Paul Gortmaker            2013-06-18  @50  int numa_cpu_node(int cpu)
6bd262731bf755 Tejun Heo                 2011-05-02   51  {
4705243d237ab6 Thomas Gleixner           2023-08-14   52  	u32 apicid = early_per_cpu(x86_cpu_to_apicid, cpu);
6bd262731bf755 Tejun Heo                 2011-05-02   53  
6bd262731bf755 Tejun Heo                 2011-05-02   54  	if (apicid != BAD_APICID)
6bd262731bf755 Tejun Heo                 2011-05-02   55  		return __apicid_to_node[apicid];
6bd262731bf755 Tejun Heo                 2011-05-02   56  	return NUMA_NO_NODE;
6bd262731bf755 Tejun Heo                 2011-05-02   57  }
6bd262731bf755 Tejun Heo                 2011-05-02   58  
c032ef60d1aa9a Rusty Russell             2009-03-13   59  cpumask_var_t node_to_cpumask_map[MAX_NUMNODES];
71ee73e7222877 Rusty Russell             2009-03-13   60  EXPORT_SYMBOL(node_to_cpumask_map);
71ee73e7222877 Rusty Russell             2009-03-13   61  
645a79195f66eb Tejun Heo                 2011-01-23   62  /*
645a79195f66eb Tejun Heo                 2011-01-23   63   * Map cpu index to node index
645a79195f66eb Tejun Heo                 2011-01-23   64   */
645a79195f66eb Tejun Heo                 2011-01-23   65  DEFINE_EARLY_PER_CPU(int, x86_cpu_to_node_map, NUMA_NO_NODE);
645a79195f66eb Tejun Heo                 2011-01-23   66  EXPORT_EARLY_PER_CPU_SYMBOL(x86_cpu_to_node_map);
645a79195f66eb Tejun Heo                 2011-01-23   67  
e13fe8695c57fe Wen Congyang              2013-02-22  @68  void numa_set_node(int cpu, int node)
645a79195f66eb Tejun Heo                 2011-01-23   69  {
645a79195f66eb Tejun Heo                 2011-01-23   70  	int *cpu_to_node_map = early_per_cpu_ptr(x86_cpu_to_node_map);
645a79195f66eb Tejun Heo                 2011-01-23   71  
645a79195f66eb Tejun Heo                 2011-01-23   72  	/* early setting, no percpu area yet */
645a79195f66eb Tejun Heo                 2011-01-23   73  	if (cpu_to_node_map) {
645a79195f66eb Tejun Heo                 2011-01-23   74  		cpu_to_node_map[cpu] = node;
645a79195f66eb Tejun Heo                 2011-01-23   75  		return;
645a79195f66eb Tejun Heo                 2011-01-23   76  	}
645a79195f66eb Tejun Heo                 2011-01-23   77  
645a79195f66eb Tejun Heo                 2011-01-23   78  #ifdef CONFIG_DEBUG_PER_CPU_MAPS
645a79195f66eb Tejun Heo                 2011-01-23   79  	if (cpu >= nr_cpu_ids || !cpu_possible(cpu)) {
645a79195f66eb Tejun Heo                 2011-01-23   80  		printk(KERN_ERR "numa_set_node: invalid cpu# (%d)\n", cpu);
645a79195f66eb Tejun Heo                 2011-01-23   81  		dump_stack();
645a79195f66eb Tejun Heo                 2011-01-23   82  		return;
645a79195f66eb Tejun Heo                 2011-01-23   83  	}
645a79195f66eb Tejun Heo                 2011-01-23   84  #endif
645a79195f66eb Tejun Heo                 2011-01-23   85  	per_cpu(x86_cpu_to_node_map, cpu) = node;
645a79195f66eb Tejun Heo                 2011-01-23   86  
645a79195f66eb Tejun Heo                 2011-01-23   87  	set_cpu_numa_node(cpu, node);
645a79195f66eb Tejun Heo                 2011-01-23   88  }
645a79195f66eb Tejun Heo                 2011-01-23   89  
e13fe8695c57fe Wen Congyang              2013-02-22  @90  void numa_clear_node(int cpu)
645a79195f66eb Tejun Heo                 2011-01-23   91  {
645a79195f66eb Tejun Heo                 2011-01-23   92  	numa_set_node(cpu, NUMA_NO_NODE);
645a79195f66eb Tejun Heo                 2011-01-23   93  }
645a79195f66eb Tejun Heo                 2011-01-23   94  
71ee73e7222877 Rusty Russell             2009-03-13   95  /*
71ee73e7222877 Rusty Russell             2009-03-13   96   * Allocate node_to_cpumask_map based on number of available nodes
71ee73e7222877 Rusty Russell             2009-03-13   97   * Requires node_possible_map to be valid.
71ee73e7222877 Rusty Russell             2009-03-13   98   *
9512938b885304 Wanlong Gao               2012-01-12   99   * Note: cpumask_of_node() is not valid until after this is done.
71ee73e7222877 Rusty Russell             2009-03-13  100   * (Use CONFIG_DEBUG_PER_CPU_MAPS to check this.)
71ee73e7222877 Rusty Russell             2009-03-13  101   */
71ee73e7222877 Rusty Russell             2009-03-13  102  void __init setup_node_to_cpumask_map(void)
71ee73e7222877 Rusty Russell             2009-03-13  103  {
d2ad351e36e333 Cody P Schafer            2013-04-29  104  	unsigned int node;
71ee73e7222877 Rusty Russell             2009-03-13  105  
71ee73e7222877 Rusty Russell             2009-03-13  106  	/* setup nr_node_ids if not done yet */
d2ad351e36e333 Cody P Schafer            2013-04-29  107  	if (nr_node_ids == MAX_NUMNODES)
d2ad351e36e333 Cody P Schafer            2013-04-29  108  		setup_nr_node_ids();
71ee73e7222877 Rusty Russell             2009-03-13  109  
71ee73e7222877 Rusty Russell             2009-03-13  110  	/* allocate the map */
c032ef60d1aa9a Rusty Russell             2009-03-13  111  	for (node = 0; node < nr_node_ids; node++)
c032ef60d1aa9a Rusty Russell             2009-03-13  112  		alloc_bootmem_cpumask_var(&node_to_cpumask_map[node]);
71ee73e7222877 Rusty Russell             2009-03-13  113  
c032ef60d1aa9a Rusty Russell             2009-03-13  114  	/* cpumask_of_node() will now work */
b9726c26dc21b1 Alexey Dobriyan           2019-03-05  115  	pr_debug("Node to cpumask map for %u nodes\n", nr_node_ids);
71ee73e7222877 Rusty Russell             2009-03-13  116  }
71ee73e7222877 Rusty Russell             2009-03-13  117  
692d73d2f0f75e Mike Rapoport (Microsoft  2024-08-07  118) static int __init numa_register_nodes(void)
a4106eae650a4d Tejun Heo                 2011-05-02  119  {
692d73d2f0f75e Mike Rapoport (Microsoft  2024-08-07  120) 	int nid;
ff6c3d81f2e86b Liam Ni                   2023-10-26  121  
ff6c3d81f2e86b Liam Ni                   2023-10-26  122  	if (!memblock_validate_numa_coverage(SZ_1M))
a4106eae650a4d Tejun Heo                 2011-05-02  123  		return -EINVAL;
a4106eae650a4d Tejun Heo                 2011-05-02  124  
a4106eae650a4d Tejun Heo                 2011-05-02  125  	/* Finally register nodes. */
a4106eae650a4d Tejun Heo                 2011-05-02  126  	for_each_node_mask(nid, node_possible_map) {
77c1d0e7c580c9 Mike Rapoport (Microsoft  2024-08-07  127) 		unsigned long start_pfn, end_pfn;
a4106eae650a4d Tejun Heo                 2011-05-02  128  
77c1d0e7c580c9 Mike Rapoport (Microsoft  2024-08-07  129) 		/*
77c1d0e7c580c9 Mike Rapoport (Microsoft  2024-08-07  130) 		 * Note, get_pfn_range_for_nid() depends on
77c1d0e7c580c9 Mike Rapoport (Microsoft  2024-08-07  131) 		 * memblock_set_node() having already happened
77c1d0e7c580c9 Mike Rapoport (Microsoft  2024-08-07  132) 		 */
77c1d0e7c580c9 Mike Rapoport (Microsoft  2024-08-07  133) 		get_pfn_range_for_nid(nid, &start_pfn, &end_pfn);
77c1d0e7c580c9 Mike Rapoport (Microsoft  2024-08-07  134) 		if (start_pfn >= end_pfn)
8b375f64dcf45b Luiz Capitulino           2014-08-22  135  			continue;
8b375f64dcf45b Luiz Capitulino           2014-08-22  136  
8b375f64dcf45b Luiz Capitulino           2014-08-22  137  		alloc_node_data(nid);
3515863d9f29dd Mike Rapoport (Microsoft  2024-08-07  138) 		node_set_online(nid);
a4106eae650a4d Tejun Heo                 2011-05-02  139  	}
a4106eae650a4d Tejun Heo                 2011-05-02  140  
0608f70c78a384 Tejun Heo                 2011-07-14  141  	/* Dump memblock with node info and return. */
0608f70c78a384 Tejun Heo                 2011-07-14  142  	memblock_dump_all();
a4106eae650a4d Tejun Heo                 2011-05-02  143  	return 0;
a4106eae650a4d Tejun Heo                 2011-05-02  144  }
a4106eae650a4d Tejun Heo                 2011-05-02  145  
8db78cc4b4048e Tejun Heo                 2011-01-23  146  /*
8db78cc4b4048e Tejun Heo                 2011-01-23  147   * There are unfortunately some poorly designed mainboards around that
8db78cc4b4048e Tejun Heo                 2011-01-23  148   * only connect memory to a single CPU. This breaks the 1:1 cpu->node
8db78cc4b4048e Tejun Heo                 2011-01-23  149   * mapping. To avoid this fill in the mapping for all possible CPUs,
8db78cc4b4048e Tejun Heo                 2011-01-23  150   * as the number of CPUs is not known yet. We round robin the existing
8db78cc4b4048e Tejun Heo                 2011-01-23  151   * nodes.
8db78cc4b4048e Tejun Heo                 2011-01-23  152   */
752d4f372f90a2 Tejun Heo                 2011-05-02  153  static void __init numa_init_array(void)
8db78cc4b4048e Tejun Heo                 2011-01-23  154  {
8db78cc4b4048e Tejun Heo                 2011-01-23  155  	int rr, i;
8db78cc4b4048e Tejun Heo                 2011-01-23  156  
8db78cc4b4048e Tejun Heo                 2011-01-23  157  	rr = first_node(node_online_map);
8db78cc4b4048e Tejun Heo                 2011-01-23  158  	for (i = 0; i < nr_cpu_ids; i++) {
8db78cc4b4048e Tejun Heo                 2011-01-23  159  		if (early_cpu_to_node(i) != NUMA_NO_NODE)
8db78cc4b4048e Tejun Heo                 2011-01-23  160  			continue;
8db78cc4b4048e Tejun Heo                 2011-01-23  161  		numa_set_node(i, rr);
0edaf86cf1a6a9 Andrew Morton             2016-05-19  162  		rr = next_node_in(rr, node_online_map);
8db78cc4b4048e Tejun Heo                 2011-01-23  163  	}
8db78cc4b4048e Tejun Heo                 2011-01-23  164  }
8db78cc4b4048e Tejun Heo                 2011-01-23  165  
a4106eae650a4d Tejun Heo                 2011-05-02  166  static int __init numa_init(int (*init_func)(void))
a4106eae650a4d Tejun Heo                 2011-05-02  167  {
a4106eae650a4d Tejun Heo                 2011-05-02  168  	int i;
a4106eae650a4d Tejun Heo                 2011-05-02  169  	int ret;
a4106eae650a4d Tejun Heo                 2011-05-02  170  
a4106eae650a4d Tejun Heo                 2011-05-02  171  	for (i = 0; i < MAX_LOCAL_APIC; i++)
a4106eae650a4d Tejun Heo                 2011-05-02 @172  		set_apicid_to_node(i, NUMA_NO_NODE);
a4106eae650a4d Tejun Heo                 2011-05-02  173  
692d73d2f0f75e Mike Rapoport (Microsoft  2024-08-07  174) 	ret = numa_memblks_init(init_func, /* memblock_force_top_down */ true);
a4106eae650a4d Tejun Heo                 2011-05-02  175  	if (ret < 0)
a4106eae650a4d Tejun Heo                 2011-05-02  176  		return ret;
a4106eae650a4d Tejun Heo                 2011-05-02  177  
692d73d2f0f75e Mike Rapoport (Microsoft  2024-08-07  178) 	ret = numa_register_nodes();
a4106eae650a4d Tejun Heo                 2011-05-02  179  	if (ret < 0)
a4106eae650a4d Tejun Heo                 2011-05-02  180  		return ret;
a4106eae650a4d Tejun Heo                 2011-05-02  181  
a4106eae650a4d Tejun Heo                 2011-05-02  182  	for (i = 0; i < nr_cpu_ids; i++) {
a4106eae650a4d Tejun Heo                 2011-05-02  183  		int nid = early_cpu_to_node(i);
a4106eae650a4d Tejun Heo                 2011-05-02  184  
a4106eae650a4d Tejun Heo                 2011-05-02  185  		if (nid == NUMA_NO_NODE)
a4106eae650a4d Tejun Heo                 2011-05-02  186  			continue;
a4106eae650a4d Tejun Heo                 2011-05-02  187  		if (!node_online(nid))
a4106eae650a4d Tejun Heo                 2011-05-02  188  			numa_clear_node(i);
a4106eae650a4d Tejun Heo                 2011-05-02  189  	}
a4106eae650a4d Tejun Heo                 2011-05-02  190  	numa_init_array();
a0acda91728418 Tang Chen                 2014-01-21  191  
a4106eae650a4d Tejun Heo                 2011-05-02  192  	return 0;
a4106eae650a4d Tejun Heo                 2011-05-02  193  }
a4106eae650a4d Tejun Heo                 2011-05-02  194  
a4106eae650a4d Tejun Heo                 2011-05-02  195  /**
a4106eae650a4d Tejun Heo                 2011-05-02  196   * dummy_numa_init - Fallback dummy NUMA init
a4106eae650a4d Tejun Heo                 2011-05-02  197   *
a4106eae650a4d Tejun Heo                 2011-05-02  198   * Used if there's no underlying NUMA architecture, NUMA initialization
a4106eae650a4d Tejun Heo                 2011-05-02  199   * fails, or NUMA is disabled on the command line.
a4106eae650a4d Tejun Heo                 2011-05-02  200   *
a4106eae650a4d Tejun Heo                 2011-05-02  201   * Must online at least one node and add memory blocks that cover all
a4106eae650a4d Tejun Heo                 2011-05-02  202   * allowed memory.  This function must not fail.
a4106eae650a4d Tejun Heo                 2011-05-02  203   */
a4106eae650a4d Tejun Heo                 2011-05-02  204  static int __init dummy_numa_init(void)
a4106eae650a4d Tejun Heo                 2011-05-02  205  {
a4106eae650a4d Tejun Heo                 2011-05-02  206  	printk(KERN_INFO "%s\n",
a4106eae650a4d Tejun Heo                 2011-05-02  207  	       numa_off ? "NUMA turned off" : "No NUMA configuration found");
365811d6f9bd98 Bjorn Helgaas             2012-05-29  208  	printk(KERN_INFO "Faking a node at [mem %#018Lx-%#018Lx]\n",
365811d6f9bd98 Bjorn Helgaas             2012-05-29  209  	       0LLU, PFN_PHYS(max_pfn) - 1);
a4106eae650a4d Tejun Heo                 2011-05-02  210  
a4106eae650a4d Tejun Heo                 2011-05-02  211  	node_set(0, numa_nodes_parsed);
38f3e1ca24cc3e Tejun Heo                 2011-05-02  212  	numa_add_memblk(0, 0, PFN_PHYS(max_pfn));
a4106eae650a4d Tejun Heo                 2011-05-02  213  
a4106eae650a4d Tejun Heo                 2011-05-02  214  	return 0;
a4106eae650a4d Tejun Heo                 2011-05-02  215  }
a4106eae650a4d Tejun Heo                 2011-05-02  216  
a4106eae650a4d Tejun Heo                 2011-05-02  217  /**
a4106eae650a4d Tejun Heo                 2011-05-02  218   * x86_numa_init - Initialize NUMA
a4106eae650a4d Tejun Heo                 2011-05-02  219   *
a4106eae650a4d Tejun Heo                 2011-05-02  220   * Try each configured NUMA initialization method until one succeeds.  The
11a98f37a5c11f Cao jin                   2019-11-18  221   * last fallback is dummy single node config encompassing whole memory and
a4106eae650a4d Tejun Heo                 2011-05-02  222   * never fails.
a4106eae650a4d Tejun Heo                 2011-05-02  223   */
a4106eae650a4d Tejun Heo                 2011-05-02  224  void __init x86_numa_init(void)
a4106eae650a4d Tejun Heo                 2011-05-02  225  {
a4106eae650a4d Tejun Heo                 2011-05-02  226  	if (!numa_off) {
a4106eae650a4d Tejun Heo                 2011-05-02  227  #ifdef CONFIG_ACPI_NUMA
a4106eae650a4d Tejun Heo                 2011-05-02  228  		if (!numa_init(x86_acpi_numa_init))
a4106eae650a4d Tejun Heo                 2011-05-02  229  			return;
a4106eae650a4d Tejun Heo                 2011-05-02  230  #endif
a4106eae650a4d Tejun Heo                 2011-05-02  231  #ifdef CONFIG_AMD_NUMA
a4106eae650a4d Tejun Heo                 2011-05-02  232  		if (!numa_init(amd_numa_init))
a4106eae650a4d Tejun Heo                 2011-05-02  233  			return;
a4106eae650a4d Tejun Heo                 2011-05-02  234  #endif
0c436a58292d0c Saurabh Sengar            2023-08-25  235  		if (acpi_disabled && !numa_init(of_numa_init))
0c436a58292d0c Saurabh Sengar            2023-08-25  236  			return;
a4106eae650a4d Tejun Heo                 2011-05-02  237  	}
a4106eae650a4d Tejun Heo                 2011-05-02  238  
a4106eae650a4d Tejun Heo                 2011-05-02  239  	numa_init(dummy_numa_init);
a4106eae650a4d Tejun Heo                 2011-05-02  240  }
a4106eae650a4d Tejun Heo                 2011-05-02  241  
8db78cc4b4048e Tejun Heo                 2011-01-23  242  
73bf7382debb1a Jonathan Cameron          2020-09-30  243  /*
73bf7382debb1a Jonathan Cameron          2020-09-30  244   * A node may exist which has one or more Generic Initiators but no CPUs and no
73bf7382debb1a Jonathan Cameron          2020-09-30  245   * memory.
73bf7382debb1a Jonathan Cameron          2020-09-30  246   *
73bf7382debb1a Jonathan Cameron          2020-09-30  247   * This function must be called after init_cpu_to_node(), to ensure that any
73bf7382debb1a Jonathan Cameron          2020-09-30  248   * memoryless CPU nodes have already been brought online, and before the
73bf7382debb1a Jonathan Cameron          2020-09-30  249   * node_data[nid] is needed for zone list setup in build_all_zonelists().
73bf7382debb1a Jonathan Cameron          2020-09-30  250   *
73bf7382debb1a Jonathan Cameron          2020-09-30  251   * When this function is called, any nodes containing either memory and/or CPUs
73bf7382debb1a Jonathan Cameron          2020-09-30  252   * will already be online and there is no need to do anything extra, even if
73bf7382debb1a Jonathan Cameron          2020-09-30  253   * they also contain one or more Generic Initiators.
73bf7382debb1a Jonathan Cameron          2020-09-30  254   */
73bf7382debb1a Jonathan Cameron          2020-09-30 @255  void __init init_gi_nodes(void)
73bf7382debb1a Jonathan Cameron          2020-09-30  256  {
73bf7382debb1a Jonathan Cameron          2020-09-30  257  	int nid;
73bf7382debb1a Jonathan Cameron          2020-09-30  258  
1ca75fa7f19d69 Oscar Salvador            2022-03-22  259  	/*
1ca75fa7f19d69 Oscar Salvador            2022-03-22  260  	 * Exclude this node from
1ca75fa7f19d69 Oscar Salvador            2022-03-22  261  	 * bringup_nonboot_cpus
1ca75fa7f19d69 Oscar Salvador            2022-03-22  262  	 *  cpu_up
1ca75fa7f19d69 Oscar Salvador            2022-03-22  263  	 *   __try_online_node
1ca75fa7f19d69 Oscar Salvador            2022-03-22  264  	 *    register_one_node
1ca75fa7f19d69 Oscar Salvador            2022-03-22  265  	 * because node_subsys is not initialized yet.
1ca75fa7f19d69 Oscar Salvador            2022-03-22  266  	 * TODO remove dependency on node_online
1ca75fa7f19d69 Oscar Salvador            2022-03-22  267  	 */
73bf7382debb1a Jonathan Cameron          2020-09-30  268  	for_each_node_state(nid, N_GENERIC_INITIATOR)
73bf7382debb1a Jonathan Cameron          2020-09-30  269  		if (!node_online(nid))
1ca75fa7f19d69 Oscar Salvador            2022-03-22  270  			node_set_online(nid);
73bf7382debb1a Jonathan Cameron          2020-09-30  271  }
73bf7382debb1a Jonathan Cameron          2020-09-30  272  
8db78cc4b4048e Tejun Heo                 2011-01-23  273  /*
8db78cc4b4048e Tejun Heo                 2011-01-23  274   * Setup early cpu_to_node.
8db78cc4b4048e Tejun Heo                 2011-01-23  275   *
8db78cc4b4048e Tejun Heo                 2011-01-23  276   * Populate cpu_to_node[] only if x86_cpu_to_apicid[],
8db78cc4b4048e Tejun Heo                 2011-01-23  277   * and apicid_to_node[] tables have valid entries for a CPU.
8db78cc4b4048e Tejun Heo                 2011-01-23  278   * This means we skip cpu_to_node[] initialisation for NUMA
8db78cc4b4048e Tejun Heo                 2011-01-23  279   * emulation and faking node case (when running a kernel compiled
8db78cc4b4048e Tejun Heo                 2011-01-23  280   * for NUMA on a non NUMA box), which is OK as cpu_to_node[]
8db78cc4b4048e Tejun Heo                 2011-01-23  281   * is already initialized in a round robin manner at numa_init_array,
8db78cc4b4048e Tejun Heo                 2011-01-23  282   * prior to this call, and this initialization is good enough
8db78cc4b4048e Tejun Heo                 2011-01-23  283   * for the fake NUMA cases.
8db78cc4b4048e Tejun Heo                 2011-01-23  284   *
8db78cc4b4048e Tejun Heo                 2011-01-23  285   * Called before the per_cpu areas are setup.
8db78cc4b4048e Tejun Heo                 2011-01-23  286   */
8db78cc4b4048e Tejun Heo                 2011-01-23 @287  void __init init_cpu_to_node(void)
8db78cc4b4048e Tejun Heo                 2011-01-23  288  {
8db78cc4b4048e Tejun Heo                 2011-01-23  289  	int cpu;
4705243d237ab6 Thomas Gleixner           2023-08-14  290  	u32 *cpu_to_apicid = early_per_cpu_ptr(x86_cpu_to_apicid);
8db78cc4b4048e Tejun Heo                 2011-01-23  291  
8db78cc4b4048e Tejun Heo                 2011-01-23  292  	BUG_ON(cpu_to_apicid == NULL);
8db78cc4b4048e Tejun Heo                 2011-01-23  293  
8db78cc4b4048e Tejun Heo                 2011-01-23  294  	for_each_possible_cpu(cpu) {
8db78cc4b4048e Tejun Heo                 2011-01-23  295  		int node = numa_cpu_node(cpu);
8db78cc4b4048e Tejun Heo                 2011-01-23  296  
8db78cc4b4048e Tejun Heo                 2011-01-23  297  		if (node == NUMA_NO_NODE)
8db78cc4b4048e Tejun Heo                 2011-01-23  298  			continue;
2532fc318db0e1 Tang Chen                 2016-08-25  299  
1ca75fa7f19d69 Oscar Salvador            2022-03-22  300  		/*
1ca75fa7f19d69 Oscar Salvador            2022-03-22  301  		 * Exclude this node from
1ca75fa7f19d69 Oscar Salvador            2022-03-22  302  		 * bringup_nonboot_cpus
1ca75fa7f19d69 Oscar Salvador            2022-03-22  303  		 *  cpu_up
1ca75fa7f19d69 Oscar Salvador            2022-03-22  304  		 *   __try_online_node
1ca75fa7f19d69 Oscar Salvador            2022-03-22  305  		 *    register_one_node
1ca75fa7f19d69 Oscar Salvador            2022-03-22  306  		 * because node_subsys is not initialized yet.
1ca75fa7f19d69 Oscar Salvador            2022-03-22  307  		 * TODO remove dependency on node_online
1ca75fa7f19d69 Oscar Salvador            2022-03-22  308  		 */
8db78cc4b4048e Tejun Heo                 2011-01-23  309  		if (!node_online(node))
1ca75fa7f19d69 Oscar Salvador            2022-03-22  310  			node_set_online(node);
2532fc318db0e1 Tang Chen                 2016-08-25  311  
8db78cc4b4048e Tejun Heo                 2011-01-23  312  		numa_set_node(cpu, node);
8db78cc4b4048e Tejun Heo                 2011-01-23  313  	}
8db78cc4b4048e Tejun Heo                 2011-01-23  314  }
8db78cc4b4048e Tejun Heo                 2011-01-23  315  
de2d9445f16278 Tejun Heo                 2011-01-23  316  #ifndef CONFIG_DEBUG_PER_CPU_MAPS
de2d9445f16278 Tejun Heo                 2011-01-23  317  
de2d9445f16278 Tejun Heo                 2011-01-23  318  # ifndef CONFIG_NUMA_EMU
7a7152857d962a Mike Rapoport (Microsoft  2024-08-07  319) void numa_add_cpu(unsigned int cpu)
de2d9445f16278 Tejun Heo                 2011-01-23  320  {
de2d9445f16278 Tejun Heo                 2011-01-23  321  	cpumask_set_cpu(cpu, node_to_cpumask_map[early_cpu_to_node(cpu)]);
de2d9445f16278 Tejun Heo                 2011-01-23  322  }
de2d9445f16278 Tejun Heo                 2011-01-23  323  
7a7152857d962a Mike Rapoport (Microsoft  2024-08-07  324) void numa_remove_cpu(unsigned int cpu)
de2d9445f16278 Tejun Heo                 2011-01-23  325  {
de2d9445f16278 Tejun Heo                 2011-01-23  326  	cpumask_clear_cpu(cpu, node_to_cpumask_map[early_cpu_to_node(cpu)]);
de2d9445f16278 Tejun Heo                 2011-01-23  327  }
de2d9445f16278 Tejun Heo                 2011-01-23  328  # endif	/* !CONFIG_NUMA_EMU */
de2d9445f16278 Tejun Heo                 2011-01-23  329  
de2d9445f16278 Tejun Heo                 2011-01-23  330  #else	/* !CONFIG_DEBUG_PER_CPU_MAPS */
645a79195f66eb Tejun Heo                 2011-01-23  331  
645a79195f66eb Tejun Heo                 2011-01-23  332  int __cpu_to_node(int cpu)
645a79195f66eb Tejun Heo                 2011-01-23  333  {
645a79195f66eb Tejun Heo                 2011-01-23  334  	if (early_per_cpu_ptr(x86_cpu_to_node_map)) {
645a79195f66eb Tejun Heo                 2011-01-23  335  		printk(KERN_WARNING
645a79195f66eb Tejun Heo                 2011-01-23  336  			"cpu_to_node(%d): usage too early!\n", cpu);
645a79195f66eb Tejun Heo                 2011-01-23  337  		dump_stack();
645a79195f66eb Tejun Heo                 2011-01-23  338  		return early_per_cpu_ptr(x86_cpu_to_node_map)[cpu];
645a79195f66eb Tejun Heo                 2011-01-23  339  	}
645a79195f66eb Tejun Heo                 2011-01-23  340  	return per_cpu(x86_cpu_to_node_map, cpu);
645a79195f66eb Tejun Heo                 2011-01-23  341  }
645a79195f66eb Tejun Heo                 2011-01-23  342  EXPORT_SYMBOL(__cpu_to_node);
645a79195f66eb Tejun Heo                 2011-01-23  343  
645a79195f66eb Tejun Heo                 2011-01-23  344  /*
645a79195f66eb Tejun Heo                 2011-01-23  345   * Same function as cpu_to_node() but used if called before the
645a79195f66eb Tejun Heo                 2011-01-23  346   * per_cpu areas are setup.
645a79195f66eb Tejun Heo                 2011-01-23  347   */
645a79195f66eb Tejun Heo                 2011-01-23  348  int early_cpu_to_node(int cpu)
645a79195f66eb Tejun Heo                 2011-01-23  349  {
645a79195f66eb Tejun Heo                 2011-01-23  350  	if (early_per_cpu_ptr(x86_cpu_to_node_map))
645a79195f66eb Tejun Heo                 2011-01-23  351  		return early_per_cpu_ptr(x86_cpu_to_node_map)[cpu];
645a79195f66eb Tejun Heo                 2011-01-23  352  
645a79195f66eb Tejun Heo                 2011-01-23  353  	if (!cpu_possible(cpu)) {
645a79195f66eb Tejun Heo                 2011-01-23  354  		printk(KERN_WARNING
645a79195f66eb Tejun Heo                 2011-01-23  355  			"early_cpu_to_node(%d): no per_cpu area!\n", cpu);
645a79195f66eb Tejun Heo                 2011-01-23  356  		dump_stack();
645a79195f66eb Tejun Heo                 2011-01-23  357  		return NUMA_NO_NODE;
645a79195f66eb Tejun Heo                 2011-01-23  358  	}
645a79195f66eb Tejun Heo                 2011-01-23  359  	return per_cpu(x86_cpu_to_node_map, cpu);
645a79195f66eb Tejun Heo                 2011-01-23  360  }
645a79195f66eb Tejun Heo                 2011-01-23  361  
7a7152857d962a Mike Rapoport (Microsoft  2024-08-07 @362) void debug_cpumask_set_cpu(unsigned int cpu, int node, bool enable)
de2d9445f16278 Tejun Heo                 2011-01-23  363  {
de2d9445f16278 Tejun Heo                 2011-01-23  364  	struct cpumask *mask;
de2d9445f16278 Tejun Heo                 2011-01-23  365  
14392fd329eca9 David Rientjes            2011-02-07  366  	if (node == NUMA_NO_NODE) {
14392fd329eca9 David Rientjes            2011-02-07  367  		/* early_cpu_to_node() already emits a warning and trace */
7a6c6547825a23 David Rientjes            2011-04-20  368  		return;
14392fd329eca9 David Rientjes            2011-02-07  369  	}
de2d9445f16278 Tejun Heo                 2011-01-23  370  	mask = node_to_cpumask_map[node];
625395c4a0f477 Siddh Raman Pant          2022-07-31  371  	if (!cpumask_available(mask)) {
de2d9445f16278 Tejun Heo                 2011-01-23  372  		pr_err("node_to_cpumask_map[%i] NULL\n", node);
de2d9445f16278 Tejun Heo                 2011-01-23  373  		dump_stack();
7a6c6547825a23 David Rientjes            2011-04-20  374  		return;
de2d9445f16278 Tejun Heo                 2011-01-23  375  	}
de2d9445f16278 Tejun Heo                 2011-01-23  376  
7a6c6547825a23 David Rientjes            2011-04-20  377  	if (enable)
7a6c6547825a23 David Rientjes            2011-04-20  378  		cpumask_set_cpu(cpu, mask);
7a6c6547825a23 David Rientjes            2011-04-20  379  	else
7a6c6547825a23 David Rientjes            2011-04-20  380  		cpumask_clear_cpu(cpu, mask);
7a6c6547825a23 David Rientjes            2011-04-20  381  
bf58b4879c33b3 Tejun Heo                 2015-02-13  382  	printk(KERN_DEBUG "%s cpu %d node %d: mask now %*pbl\n",
de2d9445f16278 Tejun Heo                 2011-01-23  383  		enable ? "numa_add_cpu" : "numa_remove_cpu",
bf58b4879c33b3 Tejun Heo                 2015-02-13  384  		cpu, node, cpumask_pr_args(mask));
7a6c6547825a23 David Rientjes            2011-04-20  385  	return;
de2d9445f16278 Tejun Heo                 2011-01-23  386  }
de2d9445f16278 Tejun Heo                 2011-01-23  387  

:::::: The code at line 172 was first introduced by commit
:::::: a4106eae650a4d5d30fcdd36d998edfa5ccb0ec4 x86, NUMA: Move NUMA init logic from numa_64.c to numa.c

:::::: TO: Tejun Heo <tj@kernel.org>
:::::: CC: Tejun Heo <tj@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
