Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2756417FFF;
	Thu, 20 Jul 2023 12:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689855876; x=1721391876;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AyTxTTouK3hICjEUq14bm34kxNG0zme5xOXb1JIMzc8=;
  b=Ym/oG0v7WVP49UF7zJcmyvsDGMtAy3Aoxc24fDrEHkT5v6OHpXPl8L3m
   zi2NREPZXEulechTnHEB4sRXLLxLgU/N4TI9LysasvokGP+CjEZybz++q
   2VE1yYKfTEvH2Cz4SbYi9+enzmYZrrBLe4EwznQmQIqZb3YA495O690ym
   RbKeW73tSxexSAw4f+rjU9lH4rgREYXFaeum0d/KZAlpe3DWSMb6gzBrm
   RRo1vUmIsVKxVLVTkXRGZ+nByCvgYNk0A8sVZ4gTMAYenPgZdPkQP4pkq
   Lm8C0KKAyedRkLvE+GOrFGHOKTHLFxHhgCUV+kk+gdwsoHV5bPJ0XlVSO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="364171834"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; 
   d="scan'208";a="364171834"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 05:24:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="794463968"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; 
   d="scan'208";a="794463968"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 20 Jul 2023 05:24:33 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMShs-00064v-1h;
	Thu, 20 Jul 2023 12:24:32 +0000
Date: Thu, 20 Jul 2023 20:24:29 +0800
From: kernel test robot <lkp@intel.com>
To: "Kenan.Liu" <Kenan.Liu@linux.alibaba.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/2] sched/fair: Adjust CFS loadbalance for machine
 with qemu native CPU topology.
Message-ID: <202307202059.uEdqRmsr-lkp@intel.com>
References: <1689842053-5291-2-git-send-email-Kenan.Liu@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1689842053-5291-2-git-send-email-Kenan.Liu@linux.alibaba.com>

Hi Kenan.Liu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on linus/master v6.5-rc2 next-20230720]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kenan-Liu/sched-fair-Adjust-CFS-loadbalance-for-machine-with-qemu-native-CPU-topology/20230720-170238
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/1689842053-5291-2-git-send-email-Kenan.Liu%40linux.alibaba.com
patch subject: [RFC PATCH 1/2] sched/fair: Adjust CFS loadbalance for machine with qemu native CPU topology.
config: hexagon-randconfig-r036-20230720 (https://download.01.org/0day-ci/archive/20230720/202307202059.uEdqRmsr-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230720/202307202059.uEdqRmsr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307202059.uEdqRmsr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/fair.c:28:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from kernel/sched/fair.c:28:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from kernel/sched/fair.c:28:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> kernel/sched/fair.c:149:35: error: call to undeclared function 'cpu_smt_mask'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     149 |         const struct cpumask *smt_mask = cpu_smt_mask(cpu);
         |                                          ^
   kernel/sched/fair.c:149:35: note: did you mean 'cpu_cpu_mask'?
   include/linux/topology.h:243:37: note: 'cpu_cpu_mask' declared here
     243 | static inline const struct cpumask *cpu_cpu_mask(int cpu)
         |                                     ^
>> kernel/sched/fair.c:149:24: error: incompatible integer to pointer conversion initializing 'const struct cpumask *' with an expression of type 'int' [-Wint-conversion]
     149 |         const struct cpumask *smt_mask = cpu_smt_mask(cpu);
         |                               ^          ~~~~~~~~~~~~~~~~~
>> kernel/sched/fair.c:158:2: error: member reference type 'int' is not a pointer
     158 |         for_each_cpu(sibling, cpu_smt_mask(cpu)) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:282:24: note: expanded from macro 'for_each_cpu'
     282 |         for_each_set_bit(cpu, cpumask_bits(mask), small_cpumask_bits)
         |         ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:28:39: note: expanded from macro 'cpumask_bits'
      28 | #define cpumask_bits(maskp) ((maskp)->bits)
         |                                       ^
   include/linux/find.h:559:41: note: expanded from macro 'for_each_set_bit'
     559 |         for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
         |                                                ^~~~
   kernel/sched/fair.c:6243:6: warning: no previous prototype for function 'init_cfs_bandwidth' [-Wmissing-prototypes]
    6243 | void init_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
         |      ^
   kernel/sched/fair.c:6243:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    6243 | void init_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
         | ^
         | static 
   kernel/sched/fair.c:12868:6: warning: no previous prototype for function 'free_fair_sched_group' [-Wmissing-prototypes]
    12868 | void free_fair_sched_group(struct task_group *tg) { }
          |      ^
   kernel/sched/fair.c:12868:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    12868 | void free_fair_sched_group(struct task_group *tg) { }
          | ^
          | static 
   kernel/sched/fair.c:12870:5: warning: no previous prototype for function 'alloc_fair_sched_group' [-Wmissing-prototypes]
    12870 | int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
          |     ^
   kernel/sched/fair.c:12870:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    12870 | int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
          | ^
          | static 
   kernel/sched/fair.c:12875:6: warning: no previous prototype for function 'online_fair_sched_group' [-Wmissing-prototypes]
    12875 | void online_fair_sched_group(struct task_group *tg) { }
          |      ^
   kernel/sched/fair.c:12875:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    12875 | void online_fair_sched_group(struct task_group *tg) { }
          | ^
          | static 
   kernel/sched/fair.c:12877:6: warning: no previous prototype for function 'unregister_fair_sched_group' [-Wmissing-prototypes]
    12877 | void unregister_fair_sched_group(struct task_group *tg) { }
          |      ^
   kernel/sched/fair.c:12877:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    12877 | void unregister_fair_sched_group(struct task_group *tg) { }
          | ^
          | static 
   11 warnings and 3 errors generated.


vim +/cpu_smt_mask +149 kernel/sched/fair.c

   144	
   145	#ifdef CONFIG_SMP
   146	static void explore_core_smp_topology(void)
   147	{
   148		int cpu = smp_processor_id(), sibling;
 > 149		const struct cpumask *smt_mask = cpu_smt_mask(cpu);
   150	
   151		if (nr_cpu_ids <= 2)
   152			return;
   153	
   154		smt_nr_cpu = cpumask_weight(smt_mask);
   155		if (smt_nr_cpu < 2)
   156			return;
   157	
 > 158		for_each_cpu(sibling, cpu_smt_mask(cpu)) {
   159			if (cpu == sibling)
   160				continue;
   161			if (abs(cpu - sibling) == 1)
   162				smt_neighbour_topo = true;
   163		}
   164	}
   165	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
