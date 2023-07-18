Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D2D17AA4;
	Tue, 18 Jul 2023 22:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689718507; x=1721254507;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GnZQbLef0GOYPycY7Kp85dY+3EmJMFdLocAu/s/xAik=;
  b=YmlERay7HBFKeScELG3yqIcaVhEM7+Cq/l3k7ZsJkAAvmFzYGhwaApb8
   ilOto+XBpKmlolxvuVy9dUTqnuXayKV8lTE9BtAHo01fa7KFNR1kqEwGb
   klZ5XlUvzEoJuk5b++FTPnpltNjEYe+X89ICQGrlz2SMfUfyuPC5kNqKI
   LMTr2YtjXlLkUjFuqyfDi2apxxAvsB1+jH+ulTe9+BTS91vXl4XUMxLg0
   vB8OlmLy+xCyk3j/VxE9VELi9q00ByzRAe5S3Q1FSZPxLhXnfkGz6029N
   Y9nCkVJJ8hnuLZzNnEMZwGwkiB1NI329NRINGV7R0urroesuBCMx0uomo
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="368968939"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; 
   d="scan'208";a="368968939"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 15:15:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="867248178"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 18 Jul 2023 15:15:05 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLsyG-0003vF-1E;
	Tue, 18 Jul 2023 22:15:04 +0000
Date: Wed, 19 Jul 2023 06:14:15 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [arm:ktext-current 1/19] arch/arm64/mm/kasan_init.c:248:2: error:
 call to '__compiletime_assert_418' declared with 'error' attribute:
 BUILD_BUG_ON failed: VMALLOC_START != MODULES_END
Message-ID: <202307190607.uzLCUxgD-lkp@intel.com>
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
config: arm64-randconfig-r026-20230718 (https://download.01.org/0day-ci/archive/20230719/202307190607.uzLCUxgD-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307190607.uzLCUxgD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307190607.uzLCUxgD-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

         |                                   ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:230:27: note: previous initialization is here
     230 |         [0 ... ESR_ELx_EC_MAX]  = kvm_handle_unknown_ec,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:238:23: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     238 |         [ESR_ELx_EC_HVC32]      = handle_hvc,
         |                                   ^~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:230:27: note: previous initialization is here
     230 |         [0 ... ESR_ELx_EC_MAX]  = kvm_handle_unknown_ec,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:239:23: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     239 |         [ESR_ELx_EC_SMC32]      = handle_smc,
         |                                   ^~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:230:27: note: previous initialization is here
     230 |         [0 ... ESR_ELx_EC_MAX]  = kvm_handle_unknown_ec,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:240:23: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     240 |         [ESR_ELx_EC_HVC64]      = handle_hvc,
         |                                   ^~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:230:27: note: previous initialization is here
     230 |         [0 ... ESR_ELx_EC_MAX]  = kvm_handle_unknown_ec,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:241:23: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     241 |         [ESR_ELx_EC_SMC64]      = handle_smc,
         |                                   ^~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:230:27: note: previous initialization is here
     230 |         [0 ... ESR_ELx_EC_MAX]  = kvm_handle_unknown_ec,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:242:23: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     242 |         [ESR_ELx_EC_SYS64]      = kvm_handle_sys_reg,
         |                                   ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:230:27: note: previous initialization is here
     230 |         [0 ... ESR_ELx_EC_MAX]  = kvm_handle_unknown_ec,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:243:21: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     243 |         [ESR_ELx_EC_SVE]        = handle_sve,
         |                                   ^~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:230:27: note: previous initialization is here
     230 |         [0 ... ESR_ELx_EC_MAX]  = kvm_handle_unknown_ec,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:244:22: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     244 |         [ESR_ELx_EC_ERET]       = kvm_handle_eret,
         |                                   ^~~~~~~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:230:27: note: previous initialization is here
     230 |         [0 ... ESR_ELx_EC_MAX]  = kvm_handle_unknown_ec,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:245:26: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     245 |         [ESR_ELx_EC_IABT_LOW]   = kvm_handle_guest_abort,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:230:27: note: previous initialization is here
     230 |         [0 ... ESR_ELx_EC_MAX]  = kvm_handle_unknown_ec,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:246:26: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     246 |         [ESR_ELx_EC_DABT_LOW]   = kvm_handle_guest_abort,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:230:27: note: previous initialization is here
     230 |         [0 ... ESR_ELx_EC_MAX]  = kvm_handle_unknown_ec,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:247:28: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     247 |         [ESR_ELx_EC_SOFTSTP_LOW]= kvm_handle_guest_debug,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:230:27: note: previous initialization is here
     230 |         [0 ... ESR_ELx_EC_MAX]  = kvm_handle_unknown_ec,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:248:28: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     248 |         [ESR_ELx_EC_WATCHPT_LOW]= kvm_handle_guest_debug,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:230:27: note: previous initialization is here
     230 |         [0 ... ESR_ELx_EC_MAX]  = kvm_handle_unknown_ec,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:249:28: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     249 |         [ESR_ELx_EC_BREAKPT_LOW]= kvm_handle_guest_debug,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:230:27: note: previous initialization is here
     230 |         [0 ... ESR_ELx_EC_MAX]  = kvm_handle_unknown_ec,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:250:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     250 |         [ESR_ELx_EC_BKPT32]     = kvm_handle_guest_debug,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:230:27: note: previous initialization is here
     230 |         [0 ... ESR_ELx_EC_MAX]  = kvm_handle_unknown_ec,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:251:23: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     251 |         [ESR_ELx_EC_BRK64]      = kvm_handle_guest_debug,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:230:27: note: previous initialization is here
     230 |         [0 ... ESR_ELx_EC_MAX]  = kvm_handle_unknown_ec,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:252:26: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     252 |         [ESR_ELx_EC_FP_ASIMD]   = handle_no_fpsimd,
         |                                   ^~~~~~~~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:230:27: note: previous initialization is here
     230 |         [0 ... ESR_ELx_EC_MAX]  = kvm_handle_unknown_ec,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:253:21: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     253 |         [ESR_ELx_EC_PAC]        = kvm_handle_ptrauth,
         |                                   ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:230:27: note: previous initialization is here
     230 |         [0 ... ESR_ELx_EC_MAX]  = kvm_handle_unknown_ec,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/handle_exit.c:364:33: warning: comparison of distinct pointer types ('typeof ((2147483648U)) *' (aka 'unsigned int *') and 'typeof (((1UL) << ((12 - 3) * (4 - (4 - 3)) + 3))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
     364 |         u64 hyp_offset = elr_in_kimg - kaslr_offset() - elr_virt;
         |                                        ^~~~~~~~~~~~~~
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
   arch/arm64/kvm/handle_exit.c:388:28: warning: comparison of distinct pointer types ('typeof ((2147483648U)) *' (aka 'unsigned int *') and 'typeof (((1UL) << ((12 - 3) * (4 - (4 - 3)) + 3))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
     388 |                                         (void *)(panic_addr + kaslr_offset()));
         |                                                               ^~~~~~~~~~~~~~
   include/linux/kvm_host.h:812:52: note: expanded from macro 'kvm_err'
     812 |         pr_err("kvm [%i]: " fmt, task_pid_nr(current), ## __VA_ARGS__)
         |                                                           ^~~~~~~~~~~
   include/linux/printk.h:498:33: note: expanded from macro 'pr_err'
     498 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                        ^~~~~~~~~~~
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
     455 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                            ^~~~~~~~~~~
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
      36 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
      26 |                 (__typecheck(x, y) && __no_side_effects(x, y))
         |                  ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
      20 |         (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                    ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:391:27: warning: comparison of distinct pointer types ('typeof ((2147483648U)) *' (aka 'unsigned int *') and 'typeof (((1UL) << ((12 - 3) * (4 - (4 - 3)) + 3))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
     391 |                                 (void *)(panic_addr + kaslr_offset()));
         |                                                       ^~~~~~~~~~~~~~
   include/linux/kvm_host.h:812:52: note: expanded from macro 'kvm_err'
     812 |         pr_err("kvm [%i]: " fmt, task_pid_nr(current), ## __VA_ARGS__)
         |                                                           ^~~~~~~~~~~
   include/linux/printk.h:498:33: note: expanded from macro 'pr_err'
     498 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                        ^~~~~~~~~~~
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
     455 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                            ^~~~~~~~~~~
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
      36 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
      26 |                 (__typecheck(x, y) && __no_side_effects(x, y))
         |                  ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
      20 |         (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                    ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   26 warnings generated.
--
>> arch/arm64/kvm/stacktrace.c:153:55: warning: comparison of distinct pointer types ('typeof ((2147483648U)) *' (aka 'unsigned int *') and 'typeof (((1UL) << ((12 - 3) * (4 - (4 - 3)) + 3))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
     153 |         kvm_err(" [<%016lx>] %pB\n", where, (void *)(where + kaslr_offset()));
         |                                                              ^~~~~~~~~~~~~~
   include/linux/kvm_host.h:812:52: note: expanded from macro 'kvm_err'
     812 |         pr_err("kvm [%i]: " fmt, task_pid_nr(current), ## __VA_ARGS__)
         |                                                           ^~~~~~~~~~~
   include/linux/printk.h:498:33: note: expanded from macro 'pr_err'
     498 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                        ^~~~~~~~~~~
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
     455 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                            ^~~~~~~~~~~
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
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
>> arch/arm64/mm/kasan_init.c:225:54: warning: comparison of distinct pointer types ('typeof ((2147483648U)) *' (aka 'unsigned int *') and 'typeof (((1UL) << ((12 - 3) * (4 - (4 - 3)) + 3))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
     225 |         mod_shadow_start = (u64)kasan_mem_to_shadow((void *)MODULES_VADDR);
         |                                                             ^~~~~~~~~~~~~
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
   arch/arm64/mm/kasan_init.c:248:15: warning: comparison of distinct pointer types ('typeof ((2147483648U)) *' (aka 'unsigned int *') and 'typeof (((1UL) << ((12 - 3) * (4 - (4 - 3)) + 3))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
     248 |         BUILD_BUG_ON(VMALLOC_START != MODULES_END);
         |         ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/pgtable.h:24:25: note: expanded from macro 'VMALLOC_START'
      24 | #define VMALLOC_START           (MODULES_END + PGDIR_SIZE)
         |                                  ^
   arch/arm64/include/asm/memory.h:48:23: note: expanded from macro 'MODULES_END'
      48 | #define MODULES_END             (KIMAGE_VADDR)
         |                                  ^
   arch/arm64/include/asm/memory.h:47:6: note: expanded from macro 'KIMAGE_VADDR'
      47 |                                  max(MODULES_VSIZE, PGDIR_SIZE))
         |                                  ^
   note: (skipping 6 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:397:22: note: expanded from macro 'compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:385:23: note: expanded from macro '_compiletime_assert'
     385 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:377:9: note: expanded from macro '__compiletime_assert'
     377 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   arch/arm64/mm/kasan_init.c:248:32: warning: comparison of distinct pointer types ('typeof ((2147483648U)) *' (aka 'unsigned int *') and 'typeof (((1UL) << ((12 - 3) * (4 - (4 - 3)) + 3))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
     248 |         BUILD_BUG_ON(VMALLOC_START != MODULES_END);
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:48:23: note: expanded from macro 'MODULES_END'
      48 | #define MODULES_END             (KIMAGE_VADDR)
         |                                  ^
   arch/arm64/include/asm/memory.h:47:6: note: expanded from macro 'KIMAGE_VADDR'
      47 |                                  max(MODULES_VSIZE, PGDIR_SIZE))
         |                                  ^
   include/linux/minmax.h:74:19: note: expanded from macro 'max'
      74 | #define max(x, y)       __careful_cmp(x, y, >)
         |                         ^
   note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:397:22: note: expanded from macro 'compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:385:23: note: expanded from macro '_compiletime_assert'
     385 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:377:9: note: expanded from macro '__compiletime_assert'
     377 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> arch/arm64/mm/kasan_init.c:248:2: error: call to '__compiletime_assert_418' declared with 'error' attribute: BUILD_BUG_ON failed: VMALLOC_START != MODULES_END
     248 |         BUILD_BUG_ON(VMALLOC_START != MODULES_END);
         |         ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:397:2: note: expanded from macro 'compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:385:2: note: expanded from macro '_compiletime_assert'
     385 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:378:4: note: expanded from macro '__compiletime_assert'
     378 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:3:1: note: expanded from here
       3 | __compiletime_assert_418
         | ^
   3 warnings and 1 error generated.
--
>> drivers/md/dm-bufio.c:2842:22: warning: comparison of distinct pointer types ('typeof ((2147483648U)) *' (aka 'unsigned int *') and 'typeof (((1UL) << ((12 - 3) * (4 - (4 - 3)) + 3))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
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
>> drivers/md/dm-bufio.c:2842:22: warning: comparison of distinct pointer types ('typeof ((2147483648U)) *' (aka 'unsigned int *') and 'typeof (((1UL) << ((12 - 3) * (4 - (4 - 3)) + 3))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
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
   drivers/md/dm-bufio.c:2843:19: warning: comparison of distinct pointer types ('typeof ((2147483648U)) *' (aka 'unsigned int *') and 'typeof (((1UL) << ((12 - 3) * (4 - (4 - 3)) + 3))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
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
   drivers/md/dm-bufio.c:2843:19: warning: comparison of distinct pointer types ('typeof ((2147483648U)) *' (aka 'unsigned int *') and 'typeof (((1UL) << ((12 - 3) * (4 - (4 - 3)) + 3))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
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


vim +248 arch/arm64/mm/kasan_init.c

39d114ddc68223 Andrey Ryabinin  2015-10-12  213  
afe6ef80dcecf2 Andrey Konovalov 2020-12-22  214  static void __init kasan_init_shadow(void)
39d114ddc68223 Andrey Ryabinin  2015-10-12  215  {
f9040773b7bbbd Ard Biesheuvel   2016-02-16  216  	u64 kimg_shadow_start, kimg_shadow_end;
55123afffe931a Mark Rutland     2023-05-30  217  	u64 mod_shadow_start;
9a0732efa77418 Lecopzer Chen    2021-03-24  218  	u64 vmalloc_shadow_end;
b10d6bca87204c Mike Rapoport    2020-10-13  219  	phys_addr_t pa_start, pa_end;
b10d6bca87204c Mike Rapoport    2020-10-13  220  	u64 i;
39d114ddc68223 Andrey Ryabinin  2015-10-12  221  
7d7b88ff5f8fd7 Lecopzer Chen    2021-03-24  222  	kimg_shadow_start = (u64)kasan_mem_to_shadow(KERNEL_START) & PAGE_MASK;
7d7b88ff5f8fd7 Lecopzer Chen    2021-03-24  223  	kimg_shadow_end = PAGE_ALIGN((u64)kasan_mem_to_shadow(KERNEL_END));
f9040773b7bbbd Ard Biesheuvel   2016-02-16  224  
f80fb3a3d50843 Ard Biesheuvel   2016-01-26 @225  	mod_shadow_start = (u64)kasan_mem_to_shadow((void *)MODULES_VADDR);
f80fb3a3d50843 Ard Biesheuvel   2016-01-26  226  
9a0732efa77418 Lecopzer Chen    2021-03-24  227  	vmalloc_shadow_end = (u64)kasan_mem_to_shadow((void *)VMALLOC_END);
9a0732efa77418 Lecopzer Chen    2021-03-24  228  
39d114ddc68223 Andrey Ryabinin  2015-10-12  229  	/*
39d114ddc68223 Andrey Ryabinin  2015-10-12  230  	 * We are going to perform proper setup of shadow memory.
0293c8ba807c86 Kyrylo Tkachov   2018-10-04  231  	 * At first we should unmap early shadow (clear_pgds() call below).
39d114ddc68223 Andrey Ryabinin  2015-10-12  232  	 * However, instrumented code couldn't execute without shadow memory.
39d114ddc68223 Andrey Ryabinin  2015-10-12  233  	 * tmp_pg_dir used to keep early shadow mapped until full shadow
39d114ddc68223 Andrey Ryabinin  2015-10-12  234  	 * setup will be finished.
39d114ddc68223 Andrey Ryabinin  2015-10-12  235  	 */
39d114ddc68223 Andrey Ryabinin  2015-10-12  236  	memcpy(tmp_pg_dir, swapper_pg_dir, sizeof(tmp_pg_dir));
c1a88e9124a499 Mark Rutland     2016-01-25  237  	dsb(ishst);
1682c45b920643 Ard Biesheuvel   2022-06-24  238  	cpu_replace_ttbr1(lm_alias(tmp_pg_dir), idmap_pg_dir);
39d114ddc68223 Andrey Ryabinin  2015-10-12  239  
39d114ddc68223 Andrey Ryabinin  2015-10-12  240  	clear_pgds(KASAN_SHADOW_START, KASAN_SHADOW_END);
39d114ddc68223 Andrey Ryabinin  2015-10-12  241  
e17d8025f07e4f Will Deacon      2017-11-15  242  	kasan_map_populate(kimg_shadow_start, kimg_shadow_end,
7d7b88ff5f8fd7 Lecopzer Chen    2021-03-24  243  			   early_pfn_to_nid(virt_to_pfn(lm_alias(KERNEL_START))));
f9040773b7bbbd Ard Biesheuvel   2016-02-16  244  
77ad4ce69321ab Mark Rutland     2019-08-14  245  	kasan_populate_early_shadow(kasan_mem_to_shadow((void *)PAGE_END),
f80fb3a3d50843 Ard Biesheuvel   2016-01-26  246  				   (void *)mod_shadow_start);
9a0732efa77418 Lecopzer Chen    2021-03-24  247  
9a0732efa77418 Lecopzer Chen    2021-03-24 @248  	BUILD_BUG_ON(VMALLOC_START != MODULES_END);
9a0732efa77418 Lecopzer Chen    2021-03-24  249  	kasan_populate_early_shadow((void *)vmalloc_shadow_end,
9a0732efa77418 Lecopzer Chen    2021-03-24  250  				    (void *)KASAN_SHADOW_END);
f80fb3a3d50843 Ard Biesheuvel   2016-01-26  251  
b10d6bca87204c Mike Rapoport    2020-10-13  252  	for_each_mem_range(i, &pa_start, &pa_end) {
b10d6bca87204c Mike Rapoport    2020-10-13  253  		void *start = (void *)__phys_to_virt(pa_start);
b10d6bca87204c Mike Rapoport    2020-10-13  254  		void *end = (void *)__phys_to_virt(pa_end);
39d114ddc68223 Andrey Ryabinin  2015-10-12  255  
39d114ddc68223 Andrey Ryabinin  2015-10-12  256  		if (start >= end)
39d114ddc68223 Andrey Ryabinin  2015-10-12  257  			break;
39d114ddc68223 Andrey Ryabinin  2015-10-12  258  
e17d8025f07e4f Will Deacon      2017-11-15  259  		kasan_map_populate((unsigned long)kasan_mem_to_shadow(start),
3f9ec80f7b22ec Andrey Ryabinin  2017-07-10  260  				   (unsigned long)kasan_mem_to_shadow(end),
800cb2e553d445 Mark Rutland     2018-04-16  261  				   early_pfn_to_nid(virt_to_pfn(start)));
39d114ddc68223 Andrey Ryabinin  2015-10-12  262  	}
39d114ddc68223 Andrey Ryabinin  2015-10-12  263  
7b1af9795773d7 Ard Biesheuvel   2016-01-11  264  	/*
9577dd74864877 Andrey Konovalov 2018-12-28  265  	 * KAsan may reuse the contents of kasan_early_shadow_pte directly,
9577dd74864877 Andrey Konovalov 2018-12-28  266  	 * so we should make sure that it maps the zero page read-only.
7b1af9795773d7 Ard Biesheuvel   2016-01-11  267  	 */
7b1af9795773d7 Ard Biesheuvel   2016-01-11  268  	for (i = 0; i < PTRS_PER_PTE; i++)
9577dd74864877 Andrey Konovalov 2018-12-28  269  		set_pte(&kasan_early_shadow_pte[i],
9577dd74864877 Andrey Konovalov 2018-12-28  270  			pfn_pte(sym_to_pfn(kasan_early_shadow_page),
9577dd74864877 Andrey Konovalov 2018-12-28  271  				PAGE_KERNEL_RO));
7b1af9795773d7 Ard Biesheuvel   2016-01-11  272  
080eb83f54cf5b Andrey Konovalov 2018-12-28  273  	memset(kasan_early_shadow_page, KASAN_SHADOW_INIT, PAGE_SIZE);
1682c45b920643 Ard Biesheuvel   2022-06-24  274  	cpu_replace_ttbr1(lm_alias(swapper_pg_dir), idmap_pg_dir);
afe6ef80dcecf2 Andrey Konovalov 2020-12-22  275  }
afe6ef80dcecf2 Andrey Konovalov 2020-12-22  276  

:::::: The code at line 248 was first introduced by commit
:::::: 9a0732efa77418fc85b1bdc5ddee619e62f59545 arm64: kasan: don't populate vmalloc area for CONFIG_KASAN_VMALLOC

:::::: TO: Lecopzer Chen <lecopzer.chen@mediatek.com>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
