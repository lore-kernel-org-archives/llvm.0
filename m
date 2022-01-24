Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F291F29CA
	for <llvm@lists.linux.dev>; Mon, 24 Jan 2022 15:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643038376; x=1674574376;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/N7wfLow10MDvZWbjcrnYxRRIYUPADVRbu5mKH8flZs=;
  b=LlpggDa7V6ImqW1HzycMnut/At88u2EM8WgPeQ1MpwZNrDeSm8/l3VKq
   m5+8LYhesSW1wTzLCpuX3UOFA9lWLxAyk9UZjTt/IELGB/64RnIikIqwz
   tjmSs5Xam4gBrINXgE3t8aAhhsmGoB91WfmeERLhS+p90gHKawxNu5krt
   LxNLOMKxI6sBrq1iat58Cano3xXQ+r5QCl2Mhv2yc6gnbjBWh5fHjqiMg
   se8ZnpvdKmwzvjmhEQgckfV7PGcLp5C5FfWXaPGWPhngBNt8mqcLvKhHA
   JVc9Fx7n5PRhXYyuESf2bITSPq/6jIXKOWkIOKcQ5SzATqOZKtZ+MHJoc
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="233430651"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="233430651"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2022 07:32:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="479114879"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 24 Jan 2022 07:32:52 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nC1Ku-000IWh-1I; Mon, 24 Jan 2022 15:32:52 +0000
Date: Mon, 24 Jan 2022 23:32:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jinyang He <hejinyang@loongson.cn>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: arch/mips/kernel/relocate.c:41:12: warning: no previous prototype
 for function 'plat_post_relocation'
Message-ID: <202201242332.W7XuI6gI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Jinyang,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dd81e1c7d5fb126e5fbc5c9e334d7b3ec29a16a0
commit: a307a4ce9ecd2e23c71318201330d9d648b3f818 MIPS: Loongson64: Add KASLR support
date:   1 year, 2 months ago
config: mips-randconfig-c004-20220120 (https://download.01.org/0day-ci/archive/20220124/202201242332.W7XuI6gI-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f7b7138a62648f4019c55e4671682af1f851f295)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a307a4ce9ecd2e23c71318201330d9d648b3f818
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout a307a4ce9ecd2e23c71318201330d9d648b3f818
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash arch/mips/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/preempt.h:5:
   In file included from include/linux/thread_info.h:38:
   In file included from arch/mips/include/asm/thread_info.h:16:
   In file included from arch/mips/include/asm/processor.h:14:
   In file included from include/linux/atomic.h:7:
   arch/mips/include/asm/atomic.h:257:1: warning: converting the result of '<<' to a boolean always evaluates to true [-Wtautological-constant-compare]
   ATOMIC_SIP_OP(atomic, int, subu, ll, sc)
   ^
   arch/mips/include/asm/atomic.h:251:7: note: expanded from macro 'ATOMIC_SIP_OP'
           if (!__SYNC_loongson3_war)                                      \
                ^
   arch/mips/include/asm/sync.h:147:34: note: expanded from macro '__SYNC_loongson3_war'
   # define __SYNC_loongson3_war   (1 << 31)
                                      ^
   In file included from arch/mips/kernel/relocate.c:12:
   In file included from arch/mips/include/asm/cacheflush.h:13:
   In file included from include/linux/mm.h:10:
   In file included from include/linux/gfp.h:6:
   In file included from include/linux/mmzone.h:8:
   In file included from include/linux/spinlock.h:51:
   In file included from include/linux/preempt.h:78:
   In file included from ./arch/mips/include/generated/asm/preempt.h:1:
   In file included from include/asm-generic/preempt.h:5:
   In file included from include/linux/thread_info.h:38:
   In file included from arch/mips/include/asm/thread_info.h:16:
   In file included from arch/mips/include/asm/processor.h:14:
   In file included from include/linux/atomic.h:7:
   arch/mips/include/asm/atomic.h:261:1: warning: converting the result of '<<' to a boolean always evaluates to true [-Wtautological-constant-compare]
   ATOMIC_SIP_OP(atomic64, s64, dsubu, lld, scd)
   ^
   arch/mips/include/asm/atomic.h:251:7: note: expanded from macro 'ATOMIC_SIP_OP'
           if (!__SYNC_loongson3_war)                                      \
                ^
   arch/mips/include/asm/sync.h:147:34: note: expanded from macro '__SYNC_loongson3_war'
   # define __SYNC_loongson3_war   (1 << 31)
                                      ^
   In file included from arch/mips/kernel/relocate.c:12:
   In file included from arch/mips/include/asm/cacheflush.h:13:
   In file included from include/linux/mm.h:10:
   In file included from include/linux/gfp.h:6:
   In file included from include/linux/mmzone.h:8:
   In file included from include/linux/spinlock.h:59:
   In file included from include/linux/lockdep.h:14:
   In file included from include/linux/smp.h:15:
   In file included from include/linux/smp_types.h:5:
   include/linux/llist.h:222:9: warning: converting the result of '<<' to a boolean always evaluates to true [-Wtautological-constant-compare]
           return xchg(&head->first, NULL);
                  ^
   arch/mips/include/asm/cmpxchg.h:102:7: note: expanded from macro 'xchg'
           if (!__SYNC_loongson3_war)                                      \
                ^
   arch/mips/include/asm/sync.h:147:34: note: expanded from macro '__SYNC_loongson3_war'
   # define __SYNC_loongson3_war   (1 << 31)
                                      ^
   In file included from arch/mips/kernel/relocate.c:12:
   In file included from arch/mips/include/asm/cacheflush.h:13:
   In file included from include/linux/mm.h:10:
   In file included from include/linux/gfp.h:6:
   In file included from include/linux/mmzone.h:8:
   In file included from include/linux/spinlock.h:59:
   In file included from include/linux/lockdep.h:27:
   include/linux/debug_locks.h:17:9: warning: converting the result of '<<' to a boolean always evaluates to true [-Wtautological-constant-compare]
           return xchg(&debug_locks, 0);
                  ^
   arch/mips/include/asm/cmpxchg.h:102:7: note: expanded from macro 'xchg'
           if (!__SYNC_loongson3_war)                                      \
                ^
   arch/mips/include/asm/sync.h:147:34: note: expanded from macro '__SYNC_loongson3_war'
   # define __SYNC_loongson3_war   (1 << 31)
                                      ^
   In file included from arch/mips/kernel/relocate.c:12:
   In file included from arch/mips/include/asm/cacheflush.h:13:
   In file included from include/linux/mm.h:33:
   In file included from include/linux/pgtable.h:6:
   arch/mips/include/asm/pgtable.h:200:3: warning: converting the result of '<<' to a boolean always evaluates to true [-Wtautological-constant-compare]
                   cmpxchg64(&buddy->pte, 0, _PAGE_GLOBAL);
                   ^
   arch/mips/include/asm/cmpxchg.h:220:2: note: expanded from macro 'cmpxchg64'
           cmpxchg((ptr), (o), (n));                                       \
           ^
   arch/mips/include/asm/cmpxchg.h:194:7: note: expanded from macro 'cmpxchg'
           if (!__SYNC_loongson3_war)                                      \
                ^
   arch/mips/include/asm/sync.h:147:34: note: expanded from macro '__SYNC_loongson3_war'
   # define __SYNC_loongson3_war   (1 << 31)
                                      ^
   In file included from arch/mips/kernel/relocate.c:12:
   In file included from arch/mips/include/asm/cacheflush.h:13:
   In file included from include/linux/mm.h:33:
   In file included from include/linux/pgtable.h:6:
   arch/mips/include/asm/pgtable.h:200:3: warning: converting the result of '<<' to a boolean always evaluates to true [-Wtautological-constant-compare]
   arch/mips/include/asm/cmpxchg.h:220:2: note: expanded from macro 'cmpxchg64'
           cmpxchg((ptr), (o), (n));                                       \
           ^
   arch/mips/include/asm/cmpxchg.h:204:7: note: expanded from macro 'cmpxchg'
           if (!__SYNC_loongson3_war)                                      \
                ^
   arch/mips/include/asm/sync.h:147:34: note: expanded from macro '__SYNC_loongson3_war'
   # define __SYNC_loongson3_war   (1 << 31)
                                      ^
>> arch/mips/kernel/relocate.c:41:12: warning: no previous prototype for function 'plat_post_relocation' [-Wmissing-prototypes]
   int __weak plat_post_relocation(long offset)
              ^
   arch/mips/kernel/relocate.c:41:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __weak plat_post_relocation(long offset)
   ^
   static 
   arch/mips/kernel/relocate.c:135:12: warning: no previous prototype for function 'do_relocations' [-Wmissing-prototypes]
   int __init do_relocations(void *kbase_old, void *kbase_new, long offset)
              ^
   arch/mips/kernel/relocate.c:135:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __init do_relocations(void *kbase_old, void *kbase_new, long offset)
   ^
   static 
>> arch/mips/kernel/relocate.c:304:14: warning: no previous prototype for function 'relocate_kernel' [-Wmissing-prototypes]
   void *__init relocate_kernel(void)
                ^
   arch/mips/kernel/relocate.c:304:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void *__init relocate_kernel(void)
   ^
   static 
   arch/mips/kernel/relocate.c:415:6: warning: no previous prototype for function 'show_kernel_relocation' [-Wmissing-prototypes]
   void show_kernel_relocation(const char *level)
        ^
   arch/mips/kernel/relocate.c:415:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void show_kernel_relocation(const char *level)
   ^
   static 
   16 warnings generated.


vim +/plat_post_relocation +41 arch/mips/kernel/relocate.c

4c9fff362261d6 Marcin Nowakowski 2016-11-23  35  
8cc709d7d4f013 Steven J. Hill    2016-12-09  36  /*
8cc709d7d4f013 Steven J. Hill    2016-12-09  37   * This function may be defined for a platform to perform any post-relocation
8cc709d7d4f013 Steven J. Hill    2016-12-09  38   * fixup necessary.
8cc709d7d4f013 Steven J. Hill    2016-12-09  39   * Return non-zero to abort relocation
8cc709d7d4f013 Steven J. Hill    2016-12-09  40   */
8cc709d7d4f013 Steven J. Hill    2016-12-09 @41  int __weak plat_post_relocation(long offset)
8cc709d7d4f013 Steven J. Hill    2016-12-09  42  {
8cc709d7d4f013 Steven J. Hill    2016-12-09  43  	return 0;
8cc709d7d4f013 Steven J. Hill    2016-12-09  44  }
8cc709d7d4f013 Steven J. Hill    2016-12-09  45  

:::::: The code at line 41 was first introduced by commit
:::::: 8cc709d7d4f013f51d38ceb2e3c8c82d230cf457 MIPS: Relocatable: Provide plat_post_relocation hook

:::::: TO: Steven J. Hill <Steven.Hill@cavium.com>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
