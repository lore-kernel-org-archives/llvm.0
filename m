Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86D71988A;
	Fri,  4 Aug 2023 20:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691180810; x=1722716810;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mzFj7DMB6qO5hXlGmHLr9mVJ+RiapoBOl5YW1+GILh4=;
  b=UrfAIXMbXVBr7I5fo0TMgnNm8rjVgqmRrmLGzLgRximeNOVkSDRD1+qS
   IePQsjblq2ocjBSLFaTFWbO8v0URP1NV1pyULIpykfTqKSD1cn2y+qLQP
   RF6ihoNyenByddvy/txbDytgQFRTMJpcNtk5KuM8n+xXJpu5raNFCLIpF
   SX+7XArJt6q0vcOg+jsKP/r9FeEXgdwtso1FeIm3ZGrMe0k0xVZhxAQCC
   9Lkaev1VbeFnEN7kF+rIuwpY9NJqgJ7mgK+ocfRyI/9XK/2pF1N5O9Tw9
   eMqLBHp6LSfNxFbKewNw3lwnwVmVB1NzFZ50N8Cu3k8jdesz8hXtEocOF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="456617915"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="456617915"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 13:26:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="733402807"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="733402807"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 04 Aug 2023 13:26:46 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qS1Nl-00035I-1V;
	Fri, 04 Aug 2023 20:26:45 +0000
Date: Sat, 5 Aug 2023 04:26:32 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/topo-full 142/149]
 arch/x86/include/asm/topology.h:205:19: error: redefinition of
 'topology_phys_to_logical_pkg'
Message-ID: <202308050412.HWWFdVJB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/topo-full
head:   ef76f58d8b34b1c6af83139c7d7cbf2a53c50bf2
commit: dbef13142df070d1598f85df56f0f1879bf50fff [142/149] x86/cpu/topology: Use topology logical mapping mechanism
config: x86_64-randconfig-x013-20230802 (https://download.01.org/0day-ci/archive/20230805/202308050412.HWWFdVJB-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230805/202308050412.HWWFdVJB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308050412.HWWFdVJB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:8:
   In file included from include/linux/topology.h:36:
>> arch/x86/include/asm/topology.h:205:19: error: redefinition of 'topology_phys_to_logical_pkg'
   static inline int topology_phys_to_logical_pkg(unsigned int pkg) { return 0; }
                     ^
   arch/x86/include/asm/topology.h:161:19: note: previous definition is here
   static inline int topology_phys_to_logical_pkg(unsigned int pkg)
                     ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
                   return (set->sig[3] | set->sig[2] |
                           ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
                   return (set->sig[3] | set->sig[2] |
                                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
                           set->sig[1] | set->sig[0]) == 0;
                           ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:100:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
                   return (set->sig[1] | set->sig[0]) == 0;
                           ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:113:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
                   return  (set1->sig[3] == set2->sig[3]) &&
                            ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:113:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
                   return  (set1->sig[3] == set2->sig[3]) &&
                                            ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:


vim +/topology_phys_to_logical_pkg +205 arch/x86/include/asm/topology.h

fae50c56bf5c4d arch/x86/include/asm/topology.h Thomas Gleixner 2023-07-26  203  
f54d4434c281f3 arch/x86/include/asm/topology.h Thomas Gleixner 2023-05-12  204  #else /* CONFIG_SMP */
1f12e32f4cd524 arch/x86/include/asm/topology.h Thomas Gleixner 2016-02-22 @205  static inline int topology_phys_to_logical_pkg(unsigned int pkg) { return 0; }
70b8301f6b8f7b arch/x86/include/asm/topology.h Andi Kleen      2016-05-19  206  static inline int topology_max_smt_threads(void) { return 1; }
6a4d2657e048f0 arch/x86/include/asm/topology.h Thomas Gleixner 2018-05-29  207  static inline bool topology_is_primary_thread(unsigned int cpu) { return true; }
f048c399e0f749 arch/x86/include/asm/topology.h Thomas Gleixner 2018-06-21  208  static inline bool topology_smt_supported(void) { return false; }
324469c2f4cec1 arch/x86/include/asm/topology.h Thomas Gleixner 2023-07-12  209  static inline unsigned int topology_amd_nodes_per_pkg(void) { return 0; };
fae50c56bf5c4d arch/x86/include/asm/topology.h Thomas Gleixner 2023-07-26  210  static inline void topology_apply_cmdline_limits_early(void) { }
f54d4434c281f3 arch/x86/include/asm/topology.h Thomas Gleixner 2023-05-12  211  #endif /* !CONFIG_SMP */
3367e56f26a3a8 include/asm-x86/topology.h      Thomas Gleixner 2008-01-30  212  

:::::: The code at line 205 was first introduced by commit
:::::: 1f12e32f4cd5243ae46d8b933181be0d022c6793 x86/topology: Create logical package id

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
