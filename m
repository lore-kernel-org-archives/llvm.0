Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574B213702;
	Fri, 14 Jul 2023 11:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689334894; x=1720870894;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OOKQcl9NKaw2zDoTPhmmc4UbUnFs7NL9PkYQFLBdVkA=;
  b=kcdbxTxaKRQjwf3FYo4LxVm8/8HrKYHlIImb8n0OEVXNGrzgo/Bpwb7w
   En4YKVVoJwBqPuKwO+aypuc9vYLc/up0fVB7oHmQCgBhcLBMXaMNMphkY
   wf0ChW+W84YfFIGoLo0iO4dxPWxvL/fFh8vTnzpn4flnfLuWFO8eWZQrB
   HR7N5GuuMeZgaoCTpKdp4zPtziwxid10L+hvpZfwfrGxJuEeSqz/lK3hj
   F9bAi10aJo71+4iGYyc8g6rFx8gKH3TYGnJ2CebhxNCvN5W7kXWPn6h12
   GXZxknvTATj7728AKrbIhWHn+7ngq/i24xIlpqoHPovCPgWW7zeeSZ3Lc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="345768321"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; 
   d="scan'208";a="345768321"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2023 04:41:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="725682132"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; 
   d="scan'208";a="725682132"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 14 Jul 2023 04:41:31 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKHAw-0007PJ-25;
	Fri, 14 Jul 2023 11:41:30 +0000
Date: Fri, 14 Jul 2023 19:41:30 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [arm:ktext-current 1/19] arch/arm64/kernel/kaslr.c:32:6: warning:
 comparison of distinct pointer types ('typeof ((2147483648U)) *' (aka
 'unsigned int *') and 'typeof (((1UL) << ((14 - 3) * (4 - (4 - 3)) + 3))) *'
 (aka 'unsigned long *'))
Message-ID: <202307141950.7xmwTuH7-lkp@intel.com>
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
config: arm64-randconfig-r025-20230714 (https://download.01.org/0day-ci/archive/20230714/202307141950.7xmwTuH7-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307141950.7xmwTuH7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307141950.7xmwTuH7-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> lib/test_debug_virtual.c:27:15: warning: comparison of distinct pointer types ('typeof ((2147483648U)) *' (aka 'unsigned int *') and 'typeof (((1UL) << ((14 - 3) * (4 - (4 - 3)) + 3))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
      27 |         va = (void *)VMALLOC_START;
         |                      ^~~~~~~~~~~~~
   arch/arm64/include/asm/pgtable.h:24:25: note: expanded from macro 'VMALLOC_START'
      24 | #define VMALLOC_START           (MODULES_END + PGDIR_SIZE)
         |                                  ^~~~~~~~~~~
   arch/arm64/include/asm/memory.h:48:23: note: expanded from macro 'MODULES_END'
      48 | #define MODULES_END             (KIMAGE_VADDR)
         |                                  ^~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:47:6: note: expanded from macro 'KIMAGE_VADDR'
      47 |                                  max(MODULES_VSIZE, PGDIR_SIZE))
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
      36 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
      26 |                 (__typecheck(x, y) && __no_side_effects(x, y))
         |                  ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
      20 |         (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                    ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   1 warning generated.
--
>> kernel/kcov.c:190:8: warning: comparison of distinct pointer types ('typeof ((2147483648U)) *' (aka 'unsigned int *') and 'typeof (((1UL) << ((14 - 3) * (4 - (4 - 3)) + 3))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
     190 |         ip -= kaslr_offset();
         |               ^~~~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:203:56: note: expanded from macro 'kaslr_offset'
     203 | #define kaslr_offset()  ((unsigned long)(kimage_vaddr - KIMAGE_VADDR))
         |                                                         ^~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:47:6: note: expanded from macro 'KIMAGE_VADDR'
      47 |                                  max(MODULES_VSIZE, PGDIR_SIZE))
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:74:19: note: expanded from macro 'max'
      74 | #define max(x, y)       __careful_cmp(x, y, >)
         |                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
      36 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
      26 |                 (__typecheck(x, y) && __no_side_effects(x, y))
         |                  ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
      20 |         (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                    ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   kernel/kcov.c:630:29: warning: result of comparison of constant 1152921504606846975 with expression of type '__u32' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
     630 |                 if (remote_arg->area_size > LONG_MAX / sizeof(unsigned long))
         |                     ~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.
--
>> kernel/fork.c:310:10: warning: comparison of distinct pointer types ('typeof ((2147483648U)) *' (aka 'unsigned int *') and 'typeof (((1UL) << ((14 - 3) * (4 - (4 - 3)) + 3))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
     310 |                                      VMALLOC_START, VMALLOC_END,
         |                                      ^~~~~~~~~~~~~
   arch/arm64/include/asm/pgtable.h:24:25: note: expanded from macro 'VMALLOC_START'
      24 | #define VMALLOC_START           (MODULES_END + PGDIR_SIZE)
         |                                  ^~~~~~~~~~~
   arch/arm64/include/asm/memory.h:48:23: note: expanded from macro 'MODULES_END'
      48 | #define MODULES_END             (KIMAGE_VADDR)
         |                                  ^~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:47:6: note: expanded from macro 'KIMAGE_VADDR'
      47 |                                  max(MODULES_VSIZE, PGDIR_SIZE))
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
      36 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
      26 |                 (__typecheck(x, y) && __no_side_effects(x, y))
         |                  ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
      20 |         (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                    ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   1 warning generated.
--
>> arch/arm64/mm/ptdump.c:44:4: warning: comparison of distinct pointer types ('typeof ((2147483648U)) *' (aka 'unsigned int *') and 'typeof (((1UL) << ((14 - 3) * (4 - (4 - 3)) + 3))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
      44 |         { MODULES_VADDR,                "Modules start" },
         |           ^~~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:49:25: note: expanded from macro 'MODULES_VADDR'
      49 | #define MODULES_VADDR           (MODULES_END - MODULES_VSIZE)
         |                                  ^~~~~~~~~~~
   arch/arm64/include/asm/memory.h:48:23: note: expanded from macro 'MODULES_END'
      48 | #define MODULES_END             (KIMAGE_VADDR)
         |                                  ^~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:47:6: note: expanded from macro 'KIMAGE_VADDR'
      47 |                                  max(MODULES_VSIZE, PGDIR_SIZE))
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
      36 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
      26 |                 (__typecheck(x, y) && __no_side_effects(x, y))
         |                  ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
      20 |         (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                    ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
>> arch/arm64/mm/ptdump.c:44:4: error: statement expression not allowed at file scope
   arch/arm64/include/asm/memory.h:49:25: note: expanded from macro 'MODULES_VADDR'
      49 | #define MODULES_VADDR           (MODULES_END - MODULES_VSIZE)
         |                                  ^
   arch/arm64/include/asm/memory.h:48:23: note: expanded from macro 'MODULES_END'
      48 | #define MODULES_END             (KIMAGE_VADDR)
         |                                  ^
   arch/arm64/include/asm/memory.h:47:6: note: expanded from macro 'KIMAGE_VADDR'
      47 |                                  max(MODULES_VSIZE, PGDIR_SIZE))
         |                                  ^
   include/linux/minmax.h:74:19: note: expanded from macro 'max'
      74 | #define max(x, y)       __careful_cmp(x, y, >)
         |                         ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
      38 |                 __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
         |                 ^
   include/linux/minmax.h:30:50: note: expanded from macro '__cmp_once'
      30 | #define __cmp_once(x, y, unique_x, unique_y, op) ({     \
         |                                                  ^
   arch/arm64/mm/ptdump.c:45:4: warning: comparison of distinct pointer types ('typeof ((2147483648U)) *' (aka 'unsigned int *') and 'typeof (((1UL) << ((14 - 3) * (4 - (4 - 3)) + 3))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
      45 |         { MODULES_END,                  "Modules end" },
         |           ^~~~~~~~~~~
   arch/arm64/include/asm/memory.h:48:23: note: expanded from macro 'MODULES_END'
      48 | #define MODULES_END             (KIMAGE_VADDR)
         |                                  ^~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:47:6: note: expanded from macro 'KIMAGE_VADDR'
      47 |                                  max(MODULES_VSIZE, PGDIR_SIZE))
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:74:19: note: expanded from macro 'max'
      74 | #define max(x, y)       __careful_cmp(x, y, >)
         |                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
      36 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
      26 |                 (__typecheck(x, y) && __no_side_effects(x, y))
         |                  ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
      20 |         (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                    ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   arch/arm64/mm/ptdump.c:45:4: error: statement expression not allowed at file scope
   arch/arm64/include/asm/memory.h:48:23: note: expanded from macro 'MODULES_END'
      48 | #define MODULES_END             (KIMAGE_VADDR)
         |                                  ^
   arch/arm64/include/asm/memory.h:47:6: note: expanded from macro 'KIMAGE_VADDR'
      47 |                                  max(MODULES_VSIZE, PGDIR_SIZE))
         |                                  ^
   include/linux/minmax.h:74:19: note: expanded from macro 'max'
      74 | #define max(x, y)       __careful_cmp(x, y, >)
         |                         ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
      38 |                 __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
         |                 ^
   include/linux/minmax.h:30:50: note: expanded from macro '__cmp_once'
      30 | #define __cmp_once(x, y, unique_x, unique_y, op) ({     \
         |                                                  ^
   arch/arm64/mm/ptdump.c:46:4: warning: comparison of distinct pointer types ('typeof ((2147483648U)) *' (aka 'unsigned int *') and 'typeof (((1UL) << ((14 - 3) * (4 - (4 - 3)) + 3))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
      46 |         { VMALLOC_START,                "vmalloc() area" },
         |           ^~~~~~~~~~~~~
   arch/arm64/include/asm/pgtable.h:24:25: note: expanded from macro 'VMALLOC_START'
      24 | #define VMALLOC_START           (MODULES_END + PGDIR_SIZE)
         |                                  ^~~~~~~~~~~
   arch/arm64/include/asm/memory.h:48:23: note: expanded from macro 'MODULES_END'
      48 | #define MODULES_END             (KIMAGE_VADDR)
         |                                  ^~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:47:6: note: expanded from macro 'KIMAGE_VADDR'
      47 |                                  max(MODULES_VSIZE, PGDIR_SIZE))
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
      36 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
      26 |                 (__typecheck(x, y) && __no_side_effects(x, y))
         |                  ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
      20 |         (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                    ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   arch/arm64/mm/ptdump.c:46:4: error: statement expression not allowed at file scope
   arch/arm64/include/asm/pgtable.h:24:25: note: expanded from macro 'VMALLOC_START'
      24 | #define VMALLOC_START           (MODULES_END + PGDIR_SIZE)
         |                                  ^
   arch/arm64/include/asm/memory.h:48:23: note: expanded from macro 'MODULES_END'
      48 | #define MODULES_END             (KIMAGE_VADDR)
         |                                  ^
   arch/arm64/include/asm/memory.h:47:6: note: expanded from macro 'KIMAGE_VADDR'
      47 |                                  max(MODULES_VSIZE, PGDIR_SIZE))
         |                                  ^
   include/linux/minmax.h:74:19: note: expanded from macro 'max'
      74 | #define max(x, y)       __careful_cmp(x, y, >)
         |                         ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
      38 |                 __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
         |                 ^
   include/linux/minmax.h:30:50: note: expanded from macro '__cmp_once'
      30 | #define __cmp_once(x, y, unique_x, unique_y, op) ({     \
         |                                                  ^
   3 warnings and 3 errors generated.
--
>> arch/arm64/kernel/kaslr.c:32:6: warning: comparison of distinct pointer types ('typeof ((2147483648U)) *' (aka 'unsigned int *') and 'typeof (((1UL) << ((14 - 3) * (4 - (4 - 3)) + 3))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
      32 |         if (kaslr_offset() < MIN_KIMG_ALIGN) {
         |             ^~~~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:203:56: note: expanded from macro 'kaslr_offset'
     203 | #define kaslr_offset()  ((unsigned long)(kimage_vaddr - KIMAGE_VADDR))
         |                                                         ^~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:47:6: note: expanded from macro 'KIMAGE_VADDR'
      47 |                                  max(MODULES_VSIZE, PGDIR_SIZE))
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:74:19: note: expanded from macro 'max'
      74 | #define max(x, y)       __careful_cmp(x, y, >)
         |                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
      36 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
      26 |                 (__typecheck(x, y) && __no_side_effects(x, y))
         |                  ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
      20 |         (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                    ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   1 warning generated.
--
>> drivers/md/dm-stats.c:91:25: warning: comparison of distinct pointer types ('typeof ((2147483648U)) *' (aka 'unsigned int *') and 'typeof (((1UL) << ((14 - 3) * (4 - (4 - 3)) + 3))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
      91 |         if (a > (VMALLOC_END - VMALLOC_START) / DM_STATS_VMALLOC_FACTOR)
         |                                ^~~~~~~~~~~~~
   arch/arm64/include/asm/pgtable.h:24:25: note: expanded from macro 'VMALLOC_START'
      24 | #define VMALLOC_START           (MODULES_END + PGDIR_SIZE)
         |                                  ^~~~~~~~~~~
   arch/arm64/include/asm/memory.h:48:23: note: expanded from macro 'MODULES_END'
      48 | #define MODULES_END             (KIMAGE_VADDR)
         |                                  ^~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:47:6: note: expanded from macro 'KIMAGE_VADDR'
      47 |                                  max(MODULES_VSIZE, PGDIR_SIZE))
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
      36 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
      26 |                 (__typecheck(x, y) && __no_side_effects(x, y))
         |                  ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
      20 |         (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                    ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   1 warning generated.
--
>> drivers/md/dm-bufio.c:2842:22: warning: comparison of distinct pointer types ('typeof ((2147483648U)) *' (aka 'unsigned int *') and 'typeof (((1UL) << ((14 - 3) * (4 - (4 - 3)) + 3))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
    2842 |         if (mem > mult_frac(VMALLOC_TOTAL, DM_BUFIO_VMALLOC_PERCENT, 100))
         |                   ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmalloc.h:284:38: note: expanded from macro 'VMALLOC_TOTAL'
     284 | #define VMALLOC_TOTAL (VMALLOC_END - VMALLOC_START)
         |                                      ^
   arch/arm64/include/asm/pgtable.h:24:25: note: expanded from macro 'VMALLOC_START'
      24 | #define VMALLOC_START           (MODULES_END + PGDIR_SIZE)
         |                                  ^
   arch/arm64/include/asm/memory.h:48:23: note: expanded from macro 'MODULES_END'
      48 | #define MODULES_END             (KIMAGE_VADDR)
         |                                  ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
      26 |                 (__typecheck(x, y) && __no_side_effects(x, y))
         |                  ^
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
      20 |         (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                                   ^
   include/linux/math.h:124:9: note: expanded from macro 'mult_frac'
     124 |         typeof(x) x_ = (x);     \
         |                ^
>> drivers/md/dm-bufio.c:2842:22: warning: comparison of distinct pointer types ('typeof ((2147483648U)) *' (aka 'unsigned int *') and 'typeof (((1UL) << ((14 - 3) * (4 - (4 - 3)) + 3))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
    2842 |         if (mem > mult_frac(VMALLOC_TOTAL, DM_BUFIO_VMALLOC_PERCENT, 100))
         |                   ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmalloc.h:284:38: note: expanded from macro 'VMALLOC_TOTAL'
     284 | #define VMALLOC_TOTAL (VMALLOC_END - VMALLOC_START)
         |                                      ^
   arch/arm64/include/asm/pgtable.h:24:25: note: expanded from macro 'VMALLOC_START'
      24 | #define VMALLOC_START           (MODULES_END + PGDIR_SIZE)
         |                                  ^
   arch/arm64/include/asm/memory.h:48:23: note: expanded from macro 'MODULES_END'
      48 | #define MODULES_END             (KIMAGE_VADDR)
         |                                  ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
      26 |                 (__typecheck(x, y) && __no_side_effects(x, y))
         |                  ^
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
      20 |         (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                                   ^
   include/linux/math.h:124:18: note: expanded from macro 'mult_frac'
     124 |         typeof(x) x_ = (x);     \
         |                         ^
   drivers/md/dm-bufio.c:2843:19: warning: comparison of distinct pointer types ('typeof ((2147483648U)) *' (aka 'unsigned int *') and 'typeof (((1UL) << ((14 - 3) * (4 - (4 - 3)) + 3))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
    2843 |                 mem = mult_frac(VMALLOC_TOTAL, DM_BUFIO_VMALLOC_PERCENT, 100);
         |                       ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmalloc.h:284:38: note: expanded from macro 'VMALLOC_TOTAL'
     284 | #define VMALLOC_TOTAL (VMALLOC_END - VMALLOC_START)
         |                                      ^
   arch/arm64/include/asm/pgtable.h:24:25: note: expanded from macro 'VMALLOC_START'
      24 | #define VMALLOC_START           (MODULES_END + PGDIR_SIZE)
         |                                  ^
   arch/arm64/include/asm/memory.h:48:23: note: expanded from macro 'MODULES_END'
      48 | #define MODULES_END             (KIMAGE_VADDR)
         |                                  ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
      26 |                 (__typecheck(x, y) && __no_side_effects(x, y))
         |                  ^
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
      20 |         (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                                   ^
   include/linux/math.h:124:9: note: expanded from macro 'mult_frac'
     124 |         typeof(x) x_ = (x);     \
         |                ^
   drivers/md/dm-bufio.c:2843:19: warning: comparison of distinct pointer types ('typeof ((2147483648U)) *' (aka 'unsigned int *') and 'typeof (((1UL) << ((14 - 3) * (4 - (4 - 3)) + 3))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
    2843 |                 mem = mult_frac(VMALLOC_TOTAL, DM_BUFIO_VMALLOC_PERCENT, 100);
         |                       ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmalloc.h:284:38: note: expanded from macro 'VMALLOC_TOTAL'
     284 | #define VMALLOC_TOTAL (VMALLOC_END - VMALLOC_START)
         |                                      ^
   arch/arm64/include/asm/pgtable.h:24:25: note: expanded from macro 'VMALLOC_START'
      24 | #define VMALLOC_START           (MODULES_END + PGDIR_SIZE)
         |                                  ^
   arch/arm64/include/asm/memory.h:48:23: note: expanded from macro 'MODULES_END'
      48 | #define MODULES_END             (KIMAGE_VADDR)
         |                                  ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
      26 |                 (__typecheck(x, y) && __no_side_effects(x, y))
         |                  ^
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
      20 |         (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                                   ^
   include/linux/math.h:124:18: note: expanded from macro 'mult_frac'
     124 |         typeof(x) x_ = (x);     \
         |                         ^
   4 warnings generated.
..


vim +32 arch/arm64/kernel/kaslr.c

fc5a89f75d2aad Ard Biesheuvel 2022-06-24  17  
6e13b6b923b35a Mark Rutland   2023-05-30  18  void __init kaslr_init(void)
6e13b6b923b35a Mark Rutland   2023-05-30  19  {
0ddc312b7c7304 Marc Zyngier   2023-06-09  20  	if (cpuid_feature_extract_unsigned_field(arm64_sw_feature_override.val &
0ddc312b7c7304 Marc Zyngier   2023-06-09  21  						 arm64_sw_feature_override.mask,
0ddc312b7c7304 Marc Zyngier   2023-06-09  22  						 ARM64_SW_FEATURE_OVERRIDE_NOKASLR)) {
fc5a89f75d2aad Ard Biesheuvel 2022-06-24  23  		pr_info("KASLR disabled on command line\n");
6e13b6b923b35a Mark Rutland   2023-05-30  24  		return;
fc5a89f75d2aad Ard Biesheuvel 2022-06-24  25  	}
fc5a89f75d2aad Ard Biesheuvel 2022-06-24  26  
f80fb3a3d50843 Ard Biesheuvel 2016-01-26  27  	/*
6e13b6b923b35a Mark Rutland   2023-05-30  28  	 * The KASLR offset modulo MIN_KIMG_ALIGN is taken from the physical
6e13b6b923b35a Mark Rutland   2023-05-30  29  	 * placement of the image rather than from the seed, so a displacement
6e13b6b923b35a Mark Rutland   2023-05-30  30  	 * of less than MIN_KIMG_ALIGN means that no seed was provided.
f80fb3a3d50843 Ard Biesheuvel 2016-01-26  31  	 */
6e13b6b923b35a Mark Rutland   2023-05-30 @32  	if (kaslr_offset() < MIN_KIMG_ALIGN) {

:::::: The code at line 32 was first introduced by commit
:::::: 6e13b6b923b35a965d128a40ef0c5d9dd101e603 arm64: kaslr: split kaslr/module initialization

:::::: TO: Mark Rutland <mark.rutland@arm.com>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
