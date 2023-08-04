Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE431BEF2;
	Fri,  4 Aug 2023 18:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691173430; x=1722709430;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GW0TyDddHAK0Kcz+xQUxve6r2tMCScXalKtjToOQkqc=;
  b=imCjH9IVkqH//tWd+m+NlWD7o1DFAUWl3B0C7Zv9HX3Bwhs/fY7DwDB5
   k9rLvgLkIkAEsv0TT3R8DogADGw0fowWWB21tYnKKY1p3JI1QsyHUvpj/
   kXwnfTJe3xxE1iktpKRArYBlwBcSuMIg6WykOPtLu9Tmo/nrjahLA94kX
   O9UlWzBXwtnuizbBHQF3q3d6M8aMUIW7h5V3LreLTGwd0140zkBxMjStR
   gAqnftZvZWLSF/fM4GfqdV28V5Ck1UvL/kOnDo6ntDTfzQS6/8JFMMF7L
   cDw9zG5F6J/UDZabckWk1rVurKZZjaYgmPDuCmO1B+aZuRmyBx07C+sbf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="434066484"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="434066484"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 11:23:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="759675762"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="759675762"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 04 Aug 2023 11:23:44 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRzSh-00032L-1w;
	Fri, 04 Aug 2023 18:23:43 +0000
Date: Sat, 5 Aug 2023 02:23:36 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/topo-full 134/149]
 arch/x86/include/asm/apic.h:196:20: error: redefinition of
 'topology_apply_cmdline_limits_early'
Message-ID: <202308050241.kWZol13h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/topo-full
head:   e3c8d0478a9b26ce42ad1bdc0c9e70abecf6f1ee
commit: 26b8ede3134771a5fedb9478e0d1af4d8040a6cd [134/149] x86/cpu/topology: Rework possible CPU management
config: i386-randconfig-i004-20230802 (https://download.01.org/0day-ci/archive/20230805/202308050241.kWZol13h-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230805/202308050241.kWZol13h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308050241.kWZol13h-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/irq_32.c:23:
>> arch/x86/include/asm/apic.h:196:20: error: redefinition of 'topology_apply_cmdline_limits_early'
   static inline void topology_apply_cmdline_limits_early(void) { }
                      ^
   arch/x86/include/asm/topology.h:208:20: note: previous definition is here
   static inline void topology_apply_cmdline_limits_early(void) { }
                      ^
   1 error generated.
--
   In file included from arch/x86/kernel/paravirt.c:29:
>> arch/x86/include/asm/apic.h:196:20: error: redefinition of 'topology_apply_cmdline_limits_early'
   static inline void topology_apply_cmdline_limits_early(void) { }
                      ^
   arch/x86/include/asm/topology.h:208:20: note: previous definition is here
   static inline void topology_apply_cmdline_limits_early(void) { }
                      ^
   arch/x86/kernel/paravirt.c:76:13: warning: no previous prototype for function 'native_pv_lock_init' [-Wmissing-prototypes]
   void __init native_pv_lock_init(void)
               ^
   arch/x86/kernel/paravirt.c:76:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init native_pv_lock_init(void)
   ^
   static 
   arch/x86/kernel/paravirt.c:299:4: warning: cast from 'void (*)(struct mmu_gather *, struct page *)' to 'void (*)(struct mmu_gather *, void *)' converts to incompatible function type [-Wcast-function-type-strict]
                           (void (*)(struct mmu_gather *, void *))tlb_remove_page,
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings and 1 error generated.
--
   In file included from arch/x86/kernel/kvmclock.c:10:
>> arch/x86/include/asm/apic.h:196:20: error: redefinition of 'topology_apply_cmdline_limits_early'
   static inline void topology_apply_cmdline_limits_early(void) { }
                      ^
   arch/x86/include/asm/topology.h:208:20: note: previous definition is here
   static inline void topology_apply_cmdline_limits_early(void) { }
                      ^
   In file included from arch/x86/kernel/kvmclock.c:16:
   In file included from include/linux/mm.h:1007:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
                   return (set->sig[3] | set->sig[2] |
                           ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/x86/kernel/kvmclock.c:16:
   In file included from include/linux/mm.h:1007:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
                   return (set->sig[3] | set->sig[2] |
                                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/x86/kernel/kvmclock.c:16:
   In file included from include/linux/mm.h:1007:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:113:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
                   return  (set1->sig[3] == set2->sig[3]) &&
                            ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/x86/kernel/kvmclock.c:16:
   In file included from include/linux/mm.h:1007:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:113:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
                   return  (set1->sig[3] == set2->sig[3]) &&
                                            ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/x86/kernel/kvmclock.c:16:
   In file included from include/linux/mm.h:1007:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
                           (set1->sig[2] == set2->sig[2]) &&
                            ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/x86/kernel/kvmclock.c:16:
   In file included from include/linux/mm.h:1007:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
                           (set1->sig[2] == set2->sig[2]) &&
                                            ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/x86/kernel/kvmclock.c:16:
   In file included from include/linux/mm.h:1007:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:156:1: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
   _SIG_SET_BINOP(sigorsets, _sig_or)
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:137:8: note: expanded from macro '_SIG_SET_BINOP'
                   a3 = a->sig[3]; a2 = a->sig[2];                         \
                        ^      ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/x86/kernel/kvmclock.c:16:


vim +/topology_apply_cmdline_limits_early +196 arch/x86/include/asm/apic.h

   181	
   182	#else /* !CONFIG_X86_LOCAL_APIC */
   183	static inline void lapic_shutdown(void) { }
   184	#define local_apic_timer_c2_ok		1
   185	static inline void init_apic_mappings(void) { }
   186	static inline void disable_local_APIC(void) { }
   187	# define setup_boot_APIC_clock x86_init_noop
   188	# define setup_secondary_APIC_clock x86_init_noop
   189	static inline void lapic_update_tsc_freq(void) { }
   190	static inline void init_bsp_APIC(void) { }
   191	static inline void apic_intr_mode_select(void) { }
   192	static inline void apic_intr_mode_init(void) { }
   193	static inline void lapic_assign_system_vectors(void) { }
   194	static inline void lapic_assign_legacy_vector(unsigned int i, bool r) { }
   195	static inline bool apic_needs_pit(void) { return true; }
 > 196	static inline void topology_apply_cmdline_limits_early(void) { }
   197	static inline void topology_init_possible_cpus(void) { }
   198	#endif /* !CONFIG_X86_LOCAL_APIC */
   199	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
