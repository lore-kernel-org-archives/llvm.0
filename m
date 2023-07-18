Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F71C3FF4;
	Tue, 18 Jul 2023 19:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689708472; x=1721244472;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QoZqY/y7Bp6sw+3pt41tQa0bIrJRSwtTEXQqGh5O/BI=;
  b=PyQrQkb72OM8Md7s2CGWJrg0Au2X5VCK5SUJbZNiKmnTORBHEkfcB+0w
   lN3RUF7/QnfY8sLF1TO92XjJhsdb9ZjQDHCdHwwESdh6rZCVyBceosI0q
   RYkG2hpTLX0e+EdubN4VTO9hNaY1ae+7Dy8vJcC+4OZwWwyKx4+aEPNC+
   iBM1lnvzEuA8zkTAWXlHcgf4dk1rkC1Y1ny0F+ObOcPGNxs7lHDAtK6Sd
   7HRW4feDiqDD404bAdSdGOd06xguJ/WJLfgpQ/A2i5/UxevNa0Q8VD3qJ
   de4c48dPphYluFD2Akth5+nVOgHbKQF6lEwDwffbrnwVi2UjEJjL7Sm2p
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="432476631"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; 
   d="scan'208";a="432476631"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 12:27:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="753441664"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; 
   d="scan'208";a="753441664"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 18 Jul 2023 12:27:46 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLqMI-0003qj-0i;
	Tue, 18 Jul 2023 19:27:42 +0000
Date: Wed, 19 Jul 2023 03:27:28 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [arm:ktext-current 1/19] arch/arm64/mm/ptdump.c:44:4: error:
 statement expression not allowed at file scope
Message-ID: <202307190325.EARjPrng-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git ktext-current
head:   49e3458967802a6981190b5a1fa9fd66dbf58f8c
commit: 631e7c45f5d4cf043cd236a921c341e3dd9f1909 [1/19] arm64: place kernel in its own L0 page table entry
config: arm64-randconfig-r014-20230718 (https://download.01.org/0day-ci/archive/20230719/202307190325.EARjPrng-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307190325.EARjPrng-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307190325.EARjPrng-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> mm/util.c:629:39: warning: comparison of distinct pointer types ('typeof ((2147483648U)) *' (aka 'unsigned int *') and 'typeof (((1UL) << ((14 - 3) * (4 - (4 - 3)) + 3))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
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
>> mm/percpu.c:3110:21: warning: comparison of distinct pointer types ('typeof ((2147483648U)) *' (aka 'unsigned int *') and 'typeof (((1UL) << ((14 - 3) * (4 - (4 - 3)) + 3))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
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
   mm/percpu.c:3112:19: warning: comparison of distinct pointer types ('typeof ((2147483648U)) *' (aka 'unsigned int *') and 'typeof (((1UL) << ((14 - 3) * (4 - (4 - 3)) + 3))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
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
>> mm/vmalloc.c:82:17: warning: comparison of distinct pointer types ('typeof ((2147483648U)) *' (aka 'unsigned int *') and 'typeof (((1UL) << ((14 - 3) * (4 - (4 - 3)) + 3))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
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
   mm/vmalloc.c:2000:10: warning: comparison of distinct pointer types ('typeof ((2147483648U)) *' (aka 'unsigned int *') and 'typeof (((1UL) << ((14 - 3) * (4 - (4 - 3)) + 3))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
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
   mm/vmalloc.c:2040:6: warning: comparison of distinct pointer types ('typeof ((2147483648U)) *' (aka 'unsigned int *') and 'typeof (((1UL) << ((14 - 3) * (4 - (4 - 3)) + 3))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
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
           __builtin_choose_expr(__safe_cmp(x, y), \
                                 ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
                   (__typecheck(x, y) && __no_side_effects(x, y))
                    ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
           (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
                      ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   mm/vmalloc.c:2346:16: warning: comparison of distinct pointer types ('typeof ((2147483648U)) *' (aka 'unsigned int *') and 'typeof (((1UL) << ((14 - 3) * (4 - (4 - 3)) + 3))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
           BUG_ON(addr < VMALLOC_START);
           ~~~~~~~~~~~~~~^~~~~~~~~~~~~~
   arch/arm64/include/asm/pgtable.h:24:25: note: expanded from macro 'VMALLOC_START'
   #define VMALLOC_START           (MODULES_END + PGDIR_SIZE)
                                    ^
   arch/arm64/include/asm/memory.h:48:23: note: expanded from macro 'MODULES_END'
   #define MODULES_END             (KIMAGE_VADDR)
                                    ^
   arch/arm64/include/asm/memory.h:47:6: note: expanded from macro 'KIMAGE_VADDR'
                                    max(MODULES_VSIZE, PGDIR_SIZE))
                                    ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
           (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
                                     ^
   include/asm-generic/bug.h:163:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                      ~~~~~~~~~^~~~~~~~~~
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   mm/vmalloc.c:2396:5: warning: comparison of distinct pointer types ('typeof ((2147483648U)) *' (aka 'unsigned int *') and 'typeof (((1UL) << ((14 - 3) * (4 - (4 - 3)) + 3))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
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
--
>> arch/arm64/mm/ptdump.c:44:4: warning: comparison of distinct pointer types ('typeof ((2147483648U)) *' (aka 'unsigned int *') and 'typeof (((1UL) << ((14 - 3) * (4 - (4 - 3)) + 3))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
           { MODULES_VADDR,                "Modules start" },
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
>> arch/arm64/mm/ptdump.c:44:4: error: statement expression not allowed at file scope
   arch/arm64/include/asm/memory.h:49:25: note: expanded from macro 'MODULES_VADDR'
   #define MODULES_VADDR           (MODULES_END - MODULES_VSIZE)
                                    ^
   arch/arm64/include/asm/memory.h:48:23: note: expanded from macro 'MODULES_END'
   #define MODULES_END             (KIMAGE_VADDR)
                                    ^
   arch/arm64/include/asm/memory.h:47:6: note: expanded from macro 'KIMAGE_VADDR'
                                    max(MODULES_VSIZE, PGDIR_SIZE))
                                    ^
   include/linux/minmax.h:74:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:30:50: note: expanded from macro '__cmp_once'
   #define __cmp_once(x, y, unique_x, unique_y, op) ({     \
                                                    ^
   arch/arm64/mm/ptdump.c:45:4: warning: comparison of distinct pointer types ('typeof ((2147483648U)) *' (aka 'unsigned int *') and 'typeof (((1UL) << ((14 - 3) * (4 - (4 - 3)) + 3))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
           { MODULES_END,                  "Modules end" },
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
   arch/arm64/mm/ptdump.c:45:4: error: statement expression not allowed at file scope
   arch/arm64/include/asm/memory.h:48:23: note: expanded from macro 'MODULES_END'
   #define MODULES_END             (KIMAGE_VADDR)
                                    ^
   arch/arm64/include/asm/memory.h:47:6: note: expanded from macro 'KIMAGE_VADDR'
                                    max(MODULES_VSIZE, PGDIR_SIZE))
                                    ^
   include/linux/minmax.h:74:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:30:50: note: expanded from macro '__cmp_once'
   #define __cmp_once(x, y, unique_x, unique_y, op) ({     \
                                                    ^
   arch/arm64/mm/ptdump.c:46:4: warning: comparison of distinct pointer types ('typeof ((2147483648U)) *' (aka 'unsigned int *') and 'typeof (((1UL) << ((14 - 3) * (4 - (4 - 3)) + 3))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
           { VMALLOC_START,                "vmalloc() area" },
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
   arch/arm64/mm/ptdump.c:46:4: error: statement expression not allowed at file scope
   arch/arm64/include/asm/pgtable.h:24:25: note: expanded from macro 'VMALLOC_START'
   #define VMALLOC_START           (MODULES_END + PGDIR_SIZE)
                                    ^
   arch/arm64/include/asm/memory.h:48:23: note: expanded from macro 'MODULES_END'
   #define MODULES_END             (KIMAGE_VADDR)
                                    ^
   arch/arm64/include/asm/memory.h:47:6: note: expanded from macro 'KIMAGE_VADDR'
                                    max(MODULES_VSIZE, PGDIR_SIZE))
                                    ^
   include/linux/minmax.h:74:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:30:50: note: expanded from macro '__cmp_once'
   #define __cmp_once(x, y, unique_x, unique_y, op) ({     \
                                                    ^
   3 warnings and 3 errors generated.
--
>> arch/arm64/kernel/setup.c:421:31: warning: comparison of distinct pointer types ('typeof ((2147483648U)) *' (aka 'unsigned int *') and 'typeof (((1UL) << ((14 - 3) * (4 - (4 - 3)) + 3))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
           const unsigned long offset = kaslr_offset();
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
   arch/arm64/kernel/setup.c:425:13: warning: comparison of distinct pointer types ('typeof ((2147483648U)) *' (aka 'unsigned int *') and 'typeof (((1UL) << ((14 - 3) * (4 - (4 - 3)) + 3))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
                            offset, KIMAGE_VADDR);
                                    ^~~~~~~~~~~~
   include/linux/printk.h:468:35: note: expanded from macro 'pr_emerg'
           printk(KERN_EMERG pr_fmt(fmt), ##__VA_ARGS__)
                                            ^~~~~~~~~~~
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
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
   2 warnings generated.
..


vim +44 arch/arm64/mm/ptdump.c

99426e5e8c9f11 arch/arm64/mm/dump.c   Steve Capper     2019-08-07  36  
99426e5e8c9f11 arch/arm64/mm/dump.c   Steve Capper     2019-08-07  37  static struct addr_marker address_markers[] = {
14c127c957c1c6 arch/arm64/mm/dump.c   Steve Capper     2019-08-07  38  	{ PAGE_OFFSET,			"Linear Mapping start" },
77ad4ce69321ab arch/arm64/mm/dump.c   Mark Rutland     2019-08-14  39  	{ 0 /* PAGE_END */,		"Linear Mapping end" },
0fea6e9af889f1 arch/arm64/mm/ptdump.c Andrey Konovalov 2020-12-22  40  #if defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)
99426e5e8c9f11 arch/arm64/mm/dump.c   Steve Capper     2019-08-07  41  	{ 0 /* KASAN_SHADOW_START */,	"Kasan shadow start" },
d8fc68a04d2ffa arch/arm64/mm/dump.c   Ard Biesheuvel   2016-04-22  42  	{ KASAN_SHADOW_END,		"Kasan shadow end" },
d8fc68a04d2ffa arch/arm64/mm/dump.c   Ard Biesheuvel   2016-04-22  43  #endif
f9040773b7bbbd arch/arm64/mm/dump.c   Ard Biesheuvel   2016-02-16 @44  	{ MODULES_VADDR,		"Modules start" },
f9040773b7bbbd arch/arm64/mm/dump.c   Ard Biesheuvel   2016-02-16  45  	{ MODULES_END,			"Modules end" },
4733c7c79e8c46 arch/arm64/mm/dump.c   Will Deacon      2018-09-05  46  	{ VMALLOC_START,		"vmalloc() area" },
4733c7c79e8c46 arch/arm64/mm/dump.c   Will Deacon      2018-09-05  47  	{ VMALLOC_END,			"vmalloc() end" },
32f5b6995f790a arch/arm64/mm/ptdump.c Mark Rutland     2023-04-06  48  	{ FIXADDR_TOT_START,		"Fixmap start" },
c9465b4ec37a68 arch/arm64/mm/dump.c   Laura Abbott     2014-11-26  49  	{ FIXADDR_TOP,			"Fixmap end" },
aa03c428e67881 arch/arm64/mm/dump.c   Mark Rutland     2015-01-22  50  	{ PCI_IO_START,			"PCI I/O start" },
aa03c428e67881 arch/arm64/mm/dump.c   Mark Rutland     2015-01-22  51  	{ PCI_IO_END,			"PCI I/O end" },
c8f8cca483aa3e arch/arm64/mm/dump.c   Ard Biesheuvel   2016-04-22  52  	{ VMEMMAP_START,		"vmemmap start" },
c8f8cca483aa3e arch/arm64/mm/dump.c   Ard Biesheuvel   2016-04-22  53  	{ VMEMMAP_START + VMEMMAP_SIZE,	"vmemmap end" },
c9465b4ec37a68 arch/arm64/mm/dump.c   Laura Abbott     2014-11-26  54  	{ -1,				NULL },
c9465b4ec37a68 arch/arm64/mm/dump.c   Laura Abbott     2014-11-26  55  };
c9465b4ec37a68 arch/arm64/mm/dump.c   Laura Abbott     2014-11-26  56  

:::::: The code at line 44 was first introduced by commit
:::::: f9040773b7bbbd9e98eb6184a263512a7cfc133f arm64: move kernel image to base of vmalloc area

:::::: TO: Ard Biesheuvel <ard.biesheuvel@linaro.org>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
