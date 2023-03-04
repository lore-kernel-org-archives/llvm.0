Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9561023D1;
	Sat,  4 Mar 2023 13:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677936776; x=1709472776;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D8qIkQ/BcQYRIHp3dnYN93wDFfeGEb6SYjPyN+KPe7o=;
  b=jGAVx/IQ7Hg7OKf4s/5y101103VJ1T5cV7k37uc+xWwCYotbwNYKqEcu
   rjem33yH1mnSWQdmLlBTpbPtT/8HKty8+TcYM4KeX3RvJr2ZD7xhhx6Uq
   QAPUOQh82Qnrx6gsQeRWFAvunC8M1DZG61S/prICLAh32JoOVhF1Mg/0a
   /rXEr8rgVz4QsoNIRQNHiNH1fDYfRmr5ouwWnwtl1iAejVp4KJpHfLv7S
   fHSW5NHNt6nKvEzdQDebWR1+UE08NN3AuhdqAb0fgleFeHdG17ljiy/ym
   kaV4Jiy+VjoB9fee0wigGFWRAwQJvssBpSrXF/poDoYOklpMmsUhHnOkM
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="362859103"
X-IronPort-AV: E=Sophos;i="5.98,233,1673942400"; 
   d="scan'208";a="362859103"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2023 05:32:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="677977832"
X-IronPort-AV: E=Sophos;i="5.98,233,1673942400"; 
   d="scan'208";a="677977832"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 04 Mar 2023 05:32:54 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYS0L-0002Bk-2l;
	Sat, 04 Mar 2023 13:32:53 +0000
Date: Sat, 4 Mar 2023 21:32:14 +0800
From: kernel test robot <lkp@intel.com>
To: Marcelo Tosatti <mtosatti@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 129/143] mm/vmstat.c:907:9: error: call to
 '__compiletime_assert_291' declared with 'error' attribute: BUILD_BUG failed
Message-ID: <202303042137.LlGpydJ8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   df3ae4347aff9be1e9763ffa3b1015fca348bfbd
commit: 676a3befc9bac1179f6a160ffe059c11e831a32c [129/143] mm/vmstat: use xchg in cpu_vm_stats_fold
config: riscv-randconfig-r016-20230302 (https://download.01.org/0day-ci/archive/20230304/202303042137.LlGpydJ8-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?id=676a3befc9bac1179f6a160ffe059c11e831a32c
        git remote add akpm-mm https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git
        git fetch --no-tags akpm-mm mm-unstable
        git checkout 676a3befc9bac1179f6a160ffe059c11e831a32c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303042137.LlGpydJ8-lkp@intel.com/

All errors (new ones prefixed by >>):

                                            ~~~~~~~~~~ ^
   In file included from mm/vmstat.c:26:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:751:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           insw(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:105:53: note: expanded from macro 'insw'
   #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
                                            ~~~~~~~~~~ ^
   In file included from mm/vmstat.c:26:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:759:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           insl(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:106:53: note: expanded from macro 'insl'
   #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
                                            ~~~~~~~~~~ ^
   In file included from mm/vmstat.c:26:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:768:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           outsb(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:118:55: note: expanded from macro 'outsb'
   #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
                                              ~~~~~~~~~~ ^
   In file included from mm/vmstat.c:26:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:777:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           outsw(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:119:55: note: expanded from macro 'outsw'
   #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
                                              ~~~~~~~~~~ ^
   In file included from mm/vmstat.c:26:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:786:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           outsl(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:120:55: note: expanded from macro 'outsl'
   #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
                                              ~~~~~~~~~~ ^
   In file included from mm/vmstat.c:26:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:1134:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
                                                     ~~~~~~~~~~ ^
>> mm/vmstat.c:907:9: error: call to '__compiletime_assert_291' declared with 'error' attribute: BUILD_BUG failed
                                   v = xchg(&pzstats->vm_stat_diff[i], 0);
                                       ^
   include/linux/atomic/atomic-instrumented.h:1886:2: note: expanded from macro 'xchg'
           arch_xchg(__ai_ptr, __VA_ARGS__); \
           ^
   arch/riscv/include/asm/cmpxchg.h:146:23: note: expanded from macro 'arch_xchg'
           (__typeof__(*(ptr))) __xchg((ptr), _x_, sizeof(*(ptr)));        \
                                ^
   arch/riscv/include/asm/cmpxchg.h:138:3: note: expanded from macro '__xchg'
                   BUILD_BUG();                                            \
                   ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:387:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:380:4: note: expanded from macro '__compiletime_assert'
                           prefix ## suffix();                             \
                           ^
   <scratch space>:3:1: note: expanded from here
   __compiletime_assert_291
   ^
   mm/vmstat.c:933:9: error: call to '__compiletime_assert_292' declared with 'error' attribute: BUILD_BUG failed
                                   v = xchg(&p->vm_node_stat_diff[i], 0);
                                       ^
   include/linux/atomic/atomic-instrumented.h:1886:2: note: expanded from macro 'xchg'
           arch_xchg(__ai_ptr, __VA_ARGS__); \
           ^
   arch/riscv/include/asm/cmpxchg.h:146:23: note: expanded from macro 'arch_xchg'
           (__typeof__(*(ptr))) __xchg((ptr), _x_, sizeof(*(ptr)));        \
                                ^
   arch/riscv/include/asm/cmpxchg.h:138:3: note: expanded from macro '__xchg'
                   BUILD_BUG();                                            \
                   ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:387:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:380:4: note: expanded from macro '__compiletime_assert'
                           prefix ## suffix();                             \
                           ^
   <scratch space>:7:1: note: expanded from here
   __compiletime_assert_292
   ^
   13 warnings and 2 errors generated.


vim +907 mm/vmstat.c

   884	
   885	/*
   886	 * Fold the data for a cpu into the global array.
   887	 * There cannot be any access by the offline cpu and therefore
   888	 * synchronization is simplified.
   889	 */
   890	void cpu_vm_stats_fold(int cpu)
   891	{
   892		struct pglist_data *pgdat;
   893		struct zone *zone;
   894		int i;
   895		int global_zone_diff[NR_VM_ZONE_STAT_ITEMS] = { 0, };
   896		int global_node_diff[NR_VM_NODE_STAT_ITEMS] = { 0, };
   897	
   898		for_each_populated_zone(zone) {
   899			struct per_cpu_zonestat *pzstats;
   900	
   901			pzstats = per_cpu_ptr(zone->per_cpu_zonestats, cpu);
   902	
   903			for (i = 0; i < NR_VM_ZONE_STAT_ITEMS; i++) {
   904				if (pzstats->vm_stat_diff[i]) {
   905					int v;
   906	
 > 907					v = xchg(&pzstats->vm_stat_diff[i], 0);
   908					atomic_long_add(v, &zone->vm_stat[i]);
   909					global_zone_diff[i] += v;
   910				}
   911			}
   912	#ifdef CONFIG_NUMA
   913			for (i = 0; i < NR_VM_NUMA_EVENT_ITEMS; i++) {
   914				if (pzstats->vm_numa_event[i]) {
   915					unsigned long v;
   916	
   917					v = xchg(&pzstats->vm_numa_event[i], 0);
   918					zone_numa_event_add(v, zone, i);
   919				}
   920			}
   921	#endif
   922		}
   923	
   924		for_each_online_pgdat(pgdat) {
   925			struct per_cpu_nodestat *p;
   926	
   927			p = per_cpu_ptr(pgdat->per_cpu_nodestats, cpu);
   928	
   929			for (i = 0; i < NR_VM_NODE_STAT_ITEMS; i++)
   930				if (p->vm_node_stat_diff[i]) {
   931					int v;
   932	
   933					v = xchg(&p->vm_node_stat_diff[i], 0);
   934					atomic_long_add(v, &pgdat->vm_stat[i]);
   935					global_node_diff[i] += v;
   936				}
   937		}
   938	
   939		fold_diff(global_zone_diff, global_node_diff);
   940	}
   941	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
