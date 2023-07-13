Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5478F1EA9B;
	Thu, 13 Jul 2023 15:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689262142; x=1720798142;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aL3XVLCfiA9cw5MT4HYq/9sWq9N7qWBvyWh5Vs2xKUQ=;
  b=ZJvtyiEEcfsxURKnNud/jURi+MHgAkyBSNeQwS/qGfmlNoYzF5FfGwrd
   gmvY7YBxDYspTLl3a9EAH57zhmDmGGmN2CcP/Mzdcc23VnCpRnLDzNrvD
   +dG8F+FDoTyEa91MQIlN/qZyXQz5dxyif2gZ5fL6q58mW6ANOVVZfjO1h
   CM+2jgg495MT9l8KkgIWaptd84RnUVtDxrLqbrf93vtkxJmIGtB9t7T3b
   fI4pL25YNMhO+W7XA6RpkbwLXRydKSKXhAxTrxrdBjVPZ45hEDgz6//8a
   8Oyg7swomKU91/VZGBPt5G5ZA+0iOqe5IF6f7W4Uo3YRpdO6BqaAnnqqU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="364090614"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; 
   d="scan'208";a="364090614"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 08:29:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="725335191"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; 
   d="scan'208";a="725335191"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 13 Jul 2023 08:28:59 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJyFX-0006iA-0x;
	Thu, 13 Jul 2023 15:28:59 +0000
Date: Thu, 13 Jul 2023 23:28:47 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [rmk-arm:ktext-current 1/19] kernel/scs.c:46:40: warning: comparison
 of distinct pointer types ('typeof ((2147483648U)) *' (aka 'unsigned int *')
 and 'typeof (((1UL) << ((16 - 3) * (4 - (4 - 2)) + 3))) *' (aka 'unsigned
 long *'))
Message-ID: <202307132335.xdlOMkMP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm ktext-current
head:   1085162f4939fd1d436ba6ec27b54c707a2a7c47
commit: b392b426ad1dad14b1f13a984fef3f8e082b58e6 [1/19] arm64: place kernel in its own L0 page table entry
config: arm64-randconfig-r032-20230713 (https://download.01.org/0day-ci/archive/20230713/202307132335.xdlOMkMP-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20230713/202307132335.xdlOMkMP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307132335.xdlOMkMP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/scs.c:46:40: warning: comparison of distinct pointer types ('typeof ((2147483648U)) *' (aka 'unsigned int *') and 'typeof (((1UL) << ((16 - 3) * (4 - (4 - 2)) + 3))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
           s = __vmalloc_node_range(SCS_SIZE, 1, VMALLOC_START, VMALLOC_END,
                                                 ^~~~~~~~~~~~~
   arch/arm64/include/asm/pgtable.h:24:25: note: expanded from macro 'VMALLOC_START'
   #define VMALLOC_START           (MODULES_END + PGDIR_SIZE)
                                    ^~~~~~~~~~~
   arch/arm64/include/asm/memory.h:48:23: note: expanded from macro 'MODULES_END'
   #define MODULES_END             (KIMAGE_VADDR)
                                    ^~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:47:6: note: expanded from macro 'KIMAGE_VADDR'
                                    max(MODULES_VSIZE, PGDIR_SIZE))
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__safe_cmp(x, y), \
                                 ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
                   (__typecheck(x, y) && __no_side_effects(x, y))
                    ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
           (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
                      ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   1 warning generated.
--
>> mm/percpu.c:3110:21: warning: comparison of distinct pointer types ('typeof ((2147483648U)) *' (aka 'unsigned int *') and 'typeof (((1UL) << ((16 - 3) * (4 - (4 - 2)) + 3))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
           if (max_distance > VMALLOC_TOTAL * 3 / 4) {
                              ^~~~~~~~~~~~~
   include/linux/vmalloc.h:284:38: note: expanded from macro 'VMALLOC_TOTAL'
   #define VMALLOC_TOTAL (VMALLOC_END - VMALLOC_START)
                                        ^~~~~~~~~~~~~
   arch/arm64/include/asm/pgtable.h:24:25: note: expanded from macro 'VMALLOC_START'
   #define VMALLOC_START           (MODULES_END + PGDIR_SIZE)
                                    ^~~~~~~~~~~
   arch/arm64/include/asm/memory.h:48:23: note: expanded from macro 'MODULES_END'
   #define MODULES_END             (KIMAGE_VADDR)
                                    ^~~~~~~~~~~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__safe_cmp(x, y), \
                                 ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
                   (__typecheck(x, y) && __no_side_effects(x, y))
                    ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
           (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
                      ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   mm/percpu.c:3112:19: warning: comparison of distinct pointer types ('typeof ((2147483648U)) *' (aka 'unsigned int *') and 'typeof (((1UL) << ((16 - 3) * (4 - (4 - 2)) + 3))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
                                   max_distance, VMALLOC_TOTAL);
                                                 ^~~~~~~~~~~~~
   include/linux/printk.h:508:37: note: expanded from macro 'pr_warn'
           printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
                                              ^~~~~~~~~~~
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__safe_cmp(x, y), \
                                 ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
                   (__typecheck(x, y) && __no_side_effects(x, y))
                    ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
           (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
                      ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   2 warnings generated.
--
>> mm/vmalloc.c:82:17: warning: comparison of distinct pointer types ('typeof ((2147483648U)) *' (aka 'unsigned int *') and 'typeof (((1UL) << ((16 - 3) * (4 - (4 - 2)) + 3))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
           return addr >= VMALLOC_START && addr < VMALLOC_END;
                          ^~~~~~~~~~~~~
   arch/arm64/include/asm/pgtable.h:24:25: note: expanded from macro 'VMALLOC_START'
   #define VMALLOC_START           (MODULES_END + PGDIR_SIZE)
                                    ^~~~~~~~~~~
   arch/arm64/include/asm/memory.h:48:23: note: expanded from macro 'MODULES_END'
   #define MODULES_END             (KIMAGE_VADDR)
                                    ^~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:47:6: note: expanded from macro 'KIMAGE_VADDR'
                                    max(MODULES_VSIZE, PGDIR_SIZE))
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__safe_cmp(x, y), \
                                 ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
                   (__typecheck(x, y) && __no_side_effects(x, y))
                    ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
           (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
                      ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   mm/vmalloc.c:647:14: warning: comparison of distinct pointer types ('typeof ((2147483648U)) *' (aka 'unsigned int *') and 'typeof (((1UL) << ((16 - 3) * (4 - (4 - 2)) + 3))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
           if (addr >= MODULES_VADDR && addr < MODULES_END)
                       ^~~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:49:25: note: expanded from macro 'MODULES_VADDR'
   #define MODULES_VADDR           (MODULES_END - MODULES_VSIZE)
                                    ^~~~~~~~~~~
   arch/arm64/include/asm/memory.h:48:23: note: expanded from macro 'MODULES_END'
   #define MODULES_END             (KIMAGE_VADDR)
                                    ^~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:47:6: note: expanded from macro 'KIMAGE_VADDR'
                                    max(MODULES_VSIZE, PGDIR_SIZE))
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__safe_cmp(x, y), \
                                 ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
                   (__typecheck(x, y) && __no_side_effects(x, y))
                    ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
           (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
                      ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   mm/vmalloc.c:647:38: warning: comparison of distinct pointer types ('typeof ((2147483648U)) *' (aka 'unsigned int *') and 'typeof (((1UL) << ((16 - 3) * (4 - (4 - 2)) + 3))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
           if (addr >= MODULES_VADDR && addr < MODULES_END)
                                               ^~~~~~~~~~~
   arch/arm64/include/asm/memory.h:48:23: note: expanded from macro 'MODULES_END'
   #define MODULES_END             (KIMAGE_VADDR)
                                    ^~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:47:6: note: expanded from macro 'KIMAGE_VADDR'
                                    max(MODULES_VSIZE, PGDIR_SIZE))
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:74:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__safe_cmp(x, y), \
                                 ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
                   (__typecheck(x, y) && __no_side_effects(x, y))
                    ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
           (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
                      ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   mm/vmalloc.c:2000:10: warning: comparison of distinct pointer types ('typeof ((2147483648U)) *' (aka 'unsigned int *') and 'typeof (((1UL) << ((16 - 3) * (4 - (4 - 2)) + 3))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
           addr -= VMALLOC_START & ~(VMAP_BLOCK_SIZE-1);
                   ^~~~~~~~~~~~~
   arch/arm64/include/asm/pgtable.h:24:25: note: expanded from macro 'VMALLOC_START'
   #define VMALLOC_START           (MODULES_END + PGDIR_SIZE)
                                    ^~~~~~~~~~~
   arch/arm64/include/asm/memory.h:48:23: note: expanded from macro 'MODULES_END'
   #define MODULES_END             (KIMAGE_VADDR)
                                    ^~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:47:6: note: expanded from macro 'KIMAGE_VADDR'
                                    max(MODULES_VSIZE, PGDIR_SIZE))
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__safe_cmp(x, y), \
                                 ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
                   (__typecheck(x, y) && __no_side_effects(x, y))
                    ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
           (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
                      ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   mm/vmalloc.c:2040:6: warning: comparison of distinct pointer types ('typeof ((2147483648U)) *' (aka 'unsigned int *') and 'typeof (((1UL) << ((16 - 3) * (4 - (4 - 2)) + 3))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
                                           VMALLOC_START, VMALLOC_END,
                                           ^~~~~~~~~~~~~
   arch/arm64/include/asm/pgtable.h:24:25: note: expanded from macro 'VMALLOC_START'
   #define VMALLOC_START           (MODULES_END + PGDIR_SIZE)
                                    ^~~~~~~~~~~
   arch/arm64/include/asm/memory.h:48:23: note: expanded from macro 'MODULES_END'
   #define MODULES_END             (KIMAGE_VADDR)
                                    ^~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:47:6: note: expanded from macro 'KIMAGE_VADDR'
                                    max(MODULES_VSIZE, PGDIR_SIZE))
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
--
>> mm/util.c:629:39: warning: comparison of distinct pointer types ('typeof ((2147483648U)) *' (aka 'unsigned int *') and 'typeof (((1UL) << ((16 - 3) * (4 - (4 - 2)) + 3))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
           return __vmalloc_node_range(size, 1, VMALLOC_START, VMALLOC_END,
                                                ^~~~~~~~~~~~~
   arch/arm64/include/asm/pgtable.h:24:25: note: expanded from macro 'VMALLOC_START'
   #define VMALLOC_START           (MODULES_END + PGDIR_SIZE)
                                    ^~~~~~~~~~~
   arch/arm64/include/asm/memory.h:48:23: note: expanded from macro 'MODULES_END'
   #define MODULES_END             (KIMAGE_VADDR)
                                    ^~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:47:6: note: expanded from macro 'KIMAGE_VADDR'
                                    max(MODULES_VSIZE, PGDIR_SIZE))
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__safe_cmp(x, y), \
                                 ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
                   (__typecheck(x, y) && __no_side_effects(x, y))
                    ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
           (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
                      ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   1 warning generated.
--
>> arch/arm64/mm/kasan_init.c:225:54: warning: comparison of distinct pointer types ('typeof ((2147483648U)) *' (aka 'unsigned int *') and 'typeof (((1UL) << ((16 - 3) * (4 - (4 - 2)) + 3))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
           mod_shadow_start = (u64)kasan_mem_to_shadow((void *)MODULES_VADDR);
                                                               ^~~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:49:25: note: expanded from macro 'MODULES_VADDR'
   #define MODULES_VADDR           (MODULES_END - MODULES_VSIZE)
                                    ^~~~~~~~~~~
   arch/arm64/include/asm/memory.h:48:23: note: expanded from macro 'MODULES_END'
   #define MODULES_END             (KIMAGE_VADDR)
                                    ^~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:47:6: note: expanded from macro 'KIMAGE_VADDR'
                                    max(MODULES_VSIZE, PGDIR_SIZE))
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__safe_cmp(x, y), \
                                 ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
                   (__typecheck(x, y) && __no_side_effects(x, y))
                    ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
           (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
                      ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   arch/arm64/mm/kasan_init.c:248:15: warning: comparison of distinct pointer types ('typeof ((2147483648U)) *' (aka 'unsigned int *') and 'typeof (((1UL) << ((16 - 3) * (4 - (4 - 2)) + 3))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
           BUILD_BUG_ON(VMALLOC_START != MODULES_END);
           ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/pgtable.h:24:25: note: expanded from macro 'VMALLOC_START'
   #define VMALLOC_START           (MODULES_END + PGDIR_SIZE)
                                    ^
   arch/arm64/include/asm/memory.h:48:23: note: expanded from macro 'MODULES_END'
   #define MODULES_END             (KIMAGE_VADDR)
                                    ^
   arch/arm64/include/asm/memory.h:47:6: note: expanded from macro 'KIMAGE_VADDR'
                                    max(MODULES_VSIZE, PGDIR_SIZE))
                                    ^
   note: (skipping 6 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:397:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:385:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:377:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   arch/arm64/mm/kasan_init.c:248:32: warning: comparison of distinct pointer types ('typeof ((2147483648U)) *' (aka 'unsigned int *') and 'typeof (((1UL) << ((16 - 3) * (4 - (4 - 2)) + 3))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
           BUILD_BUG_ON(VMALLOC_START != MODULES_END);
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:48:23: note: expanded from macro 'MODULES_END'
   #define MODULES_END             (KIMAGE_VADDR)
                                    ^
   arch/arm64/include/asm/memory.h:47:6: note: expanded from macro 'KIMAGE_VADDR'
                                    max(MODULES_VSIZE, PGDIR_SIZE))
                                    ^
   include/linux/minmax.h:74:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ^
   note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:397:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:385:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:377:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   arch/arm64/mm/kasan_init.c:248:2: error: call to __compiletime_assert_425 declared with 'error' attribute: BUILD_BUG_ON failed: VMALLOC_START != MODULES_END
           BUILD_BUG_ON(VMALLOC_START != MODULES_END);
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:397:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:385:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:378:4: note: expanded from macro '__compiletime_assert'
                           prefix ## suffix();                             \
                           ^
   <scratch space>:92:1: note: expanded from here
   __compiletime_assert_425
   ^
   3 warnings and 1 error generated.
--
>> arch/arm64/kernel/crash_core.c:24:57: warning: comparison of distinct pointer types ('typeof ((2147483648U)) *' (aka 'unsigned int *') and 'typeof (((1UL) << ((16 - 3) * (4 - (4 - 2)) + 3))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
           vmcoreinfo_append_str("NUMBER(MODULES_VADDR)=0x%lx\n", MODULES_VADDR);
                                                                  ^~~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:49:25: note: expanded from macro 'MODULES_VADDR'
   #define MODULES_VADDR           (MODULES_END - MODULES_VSIZE)
                                    ^~~~~~~~~~~
   arch/arm64/include/asm/memory.h:48:23: note: expanded from macro 'MODULES_END'
   #define MODULES_END             (KIMAGE_VADDR)
                                    ^~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:47:6: note: expanded from macro 'KIMAGE_VADDR'
                                    max(MODULES_VSIZE, PGDIR_SIZE))
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__safe_cmp(x, y), \
                                 ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
                   (__typecheck(x, y) && __no_side_effects(x, y))
                    ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
           (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
                      ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   arch/arm64/kernel/crash_core.c:25:55: warning: comparison of distinct pointer types ('typeof ((2147483648U)) *' (aka 'unsigned int *') and 'typeof (((1UL) << ((16 - 3) * (4 - (4 - 2)) + 3))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
           vmcoreinfo_append_str("NUMBER(MODULES_END)=0x%lx\n", MODULES_END);
                                                                ^~~~~~~~~~~
   arch/arm64/include/asm/memory.h:48:23: note: expanded from macro 'MODULES_END'
   #define MODULES_END             (KIMAGE_VADDR)
                                    ^~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:47:6: note: expanded from macro 'KIMAGE_VADDR'
                                    max(MODULES_VSIZE, PGDIR_SIZE))
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:74:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__safe_cmp(x, y), \
                                 ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
                   (__typecheck(x, y) && __no_side_effects(x, y))
                    ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
           (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
                      ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   arch/arm64/kernel/crash_core.c:26:57: warning: comparison of distinct pointer types ('typeof ((2147483648U)) *' (aka 'unsigned int *') and 'typeof (((1UL) << ((16 - 3) * (4 - (4 - 2)) + 3))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
           vmcoreinfo_append_str("NUMBER(VMALLOC_START)=0x%lx\n", VMALLOC_START);
                                                                  ^~~~~~~~~~~~~
   arch/arm64/include/asm/pgtable.h:24:25: note: expanded from macro 'VMALLOC_START'
   #define VMALLOC_START           (MODULES_END + PGDIR_SIZE)
                                    ^~~~~~~~~~~
   arch/arm64/include/asm/memory.h:48:23: note: expanded from macro 'MODULES_END'
   #define MODULES_END             (KIMAGE_VADDR)
                                    ^~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:47:6: note: expanded from macro 'KIMAGE_VADDR'
                                    max(MODULES_VSIZE, PGDIR_SIZE))
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__safe_cmp(x, y), \
                                 ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
                   (__typecheck(x, y) && __no_side_effects(x, y))
                    ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
           (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
                      ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   arch/arm64/kernel/crash_core.c:36:46: warning: comparison of distinct pointer types ('typeof ((2147483648U)) *' (aka 'unsigned int *') and 'typeof (((1UL) << ((16 - 3) * (4 - (4 - 2)) + 3))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
           vmcoreinfo_append_str("KERNELOFFSET=%lx\n", kaslr_offset());
                                                       ^~~~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:203:56: note: expanded from macro 'kaslr_offset'
   #define kaslr_offset()  ((unsigned long)(kimage_vaddr - KIMAGE_VADDR))
                                                           ^~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:47:6: note: expanded from macro 'KIMAGE_VADDR'
                                    max(MODULES_VSIZE, PGDIR_SIZE))
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:74:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__safe_cmp(x, y), \
                                 ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
                   (__typecheck(x, y) && __no_side_effects(x, y))
                    ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
           (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
                      ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   4 warnings generated.
..


vim +46 kernel/scs.c

a2abe7cbd8fe2d Sami Tolvanen    2020-11-30  30  
a2abe7cbd8fe2d Sami Tolvanen    2020-11-30  31  static void *__scs_alloc(int node)
a2abe7cbd8fe2d Sami Tolvanen    2020-11-30  32  {
a2abe7cbd8fe2d Sami Tolvanen    2020-11-30  33  	int i;
a2abe7cbd8fe2d Sami Tolvanen    2020-11-30  34  	void *s;
a2abe7cbd8fe2d Sami Tolvanen    2020-11-30  35  
a2abe7cbd8fe2d Sami Tolvanen    2020-11-30  36  	for (i = 0; i < NR_CACHED_SCS; i++) {
a2abe7cbd8fe2d Sami Tolvanen    2020-11-30  37  		s = this_cpu_xchg(scs_cache[i], NULL);
a2abe7cbd8fe2d Sami Tolvanen    2020-11-30  38  		if (s) {
f6e39794f4b6da Andrey Konovalov 2022-03-24  39  			s = kasan_unpoison_vmalloc(s, SCS_SIZE,
f6e39794f4b6da Andrey Konovalov 2022-03-24  40  						   KASAN_VMALLOC_PROT_NORMAL);
a2abe7cbd8fe2d Sami Tolvanen    2020-11-30  41  			memset(s, 0, SCS_SIZE);
f6e39794f4b6da Andrey Konovalov 2022-03-24  42  			goto out;
a2abe7cbd8fe2d Sami Tolvanen    2020-11-30  43  		}
a2abe7cbd8fe2d Sami Tolvanen    2020-11-30  44  	}
a2abe7cbd8fe2d Sami Tolvanen    2020-11-30  45  
f6e39794f4b6da Andrey Konovalov 2022-03-24 @46  	s = __vmalloc_node_range(SCS_SIZE, 1, VMALLOC_START, VMALLOC_END,
a2abe7cbd8fe2d Sami Tolvanen    2020-11-30  47  				    GFP_SCS, PAGE_KERNEL, 0, node,
a2abe7cbd8fe2d Sami Tolvanen    2020-11-30  48  				    __builtin_return_address(0));
f6e39794f4b6da Andrey Konovalov 2022-03-24  49  
f6e39794f4b6da Andrey Konovalov 2022-03-24  50  out:
f6e39794f4b6da Andrey Konovalov 2022-03-24  51  	return kasan_reset_tag(s);
a2abe7cbd8fe2d Sami Tolvanen    2020-11-30  52  }
a2abe7cbd8fe2d Sami Tolvanen    2020-11-30  53  

:::::: The code at line 46 was first introduced by commit
:::::: f6e39794f4b6da7ca9b77f2f9ad11fd6f0ac83e5 kasan, vmalloc: only tag normal vmalloc allocations

:::::: TO: Andrey Konovalov <andreyknvl@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
