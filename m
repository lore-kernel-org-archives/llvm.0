Received: from mgamail.intel.com (unknown [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8397E;
	Thu,  3 Aug 2023 08:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691052612; x=1722588612;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xo+BtYz1l2jHM+aXI4JtWgAru/KYegNInV6TJjgCPfs=;
  b=A/zLPUWOLnB89Xpy6ohVHGi1L/CvmD9ulg6yiokcm6U6hvFWTUxwGxys
   iloqFOwU4M97tysDKuR+tpAO25dFOMyR5Cj3yBYq8HN2WeH/OnQQAXs+S
   LutlRPXmvtzi1jV1/gBKwTRnmew6tiCldOWtLr46Bk7rwxq7qwDpJ8m46
   Xj68ZjVttRX5tYb5JAyVgebE5oza7akOhxq/K5COttpVP9vecRoD8T+ZY
   zMR5X6QTjNkQmQ337dMm2Y3/zN0rx73W6sXxhd60n0mv8gdse/t+uMO9W
   O0/N2q1cEG8eSd7FaqlllEMhA/K723jVsq6yVFCPTQjUdigSLi3eWOOxt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="368716239"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="368716239"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 01:50:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="729494299"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="729494299"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 03 Aug 2023 01:50:08 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRU23-0001vD-0a;
	Thu, 03 Aug 2023 08:50:07 +0000
Date: Thu, 3 Aug 2023 16:49:21 +0800
From: kernel test robot <lkp@intel.com>
To: Guo Ren <guoren@linux.alibaba.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [csky-linux:sg2042-master-qspinlock-64ilp32_v4 33/70]
 arch/riscv/kernel/paravirt.c:217:1: warning: label at end of compound
 statement is a C2x extension
Message-ID: <202308031622.JbR3ks9g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/c-sky/csky-linux sg2042-master-qspinlock-64ilp32_v4
head:   ee021e57ffe3195b6a3ac5fcb2d4353375d1f261
commit: 1a5d5e8bddfe02062b37aaa76a89b0cd3c350d44 [33/70] locking/qspinlock: riscv: Add Compact NUMA-aware lock support
config: riscv-randconfig-r021-20230731 (https://download.01.org/0day-ci/archive/20230803/202308031622.JbR3ks9g-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230803/202308031622.JbR3ks9g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308031622.JbR3ks9g-lkp@intel.com/

All warnings (new ones prefixed by >>):

     198 |         WRITE_ONCE(*p, v);                                              \
         |                     ^
   include/asm-generic/rwonce.h:62:33: note: expanded from macro 'WRITE_ONCE'
      62 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:48: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                                       ^
   include/linux/compiler_types.h:397:22: note: expanded from macro 'compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:385:23: note: expanded from macro '_compiletime_assert'
     385 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:377:9: note: expanded from macro '__compiletime_assert'
     377 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   arch/riscv/kernel/paravirt.c:168:46: note: forward declaration of 'struct qspinlock'
     168 | static void native_queued_spin_unlock(struct qspinlock *lock)
         |                                              ^
   arch/riscv/kernel/paravirt.c:170:25: error: incomplete definition of type 'struct qspinlock'
     170 |         smp_store_release(&lock->locked, 0);
         |                            ~~~~^
   include/asm-generic/barrier.h:198:14: note: expanded from macro 'smp_store_release'
     198 |         WRITE_ONCE(*p, v);                                              \
         |                     ^
   include/asm-generic/rwonce.h:63:15: note: expanded from macro 'WRITE_ONCE'
      63 |         __WRITE_ONCE(x, val);                                           \
         |                      ^
   arch/riscv/include/asm/rwonce.h:12:20: note: expanded from macro '__WRITE_ONCE'
      12 |         *(volatile typeof(x) *)&(x) = (val);            \
         |                           ^
   arch/riscv/kernel/paravirt.c:168:46: note: forward declaration of 'struct qspinlock'
     168 | static void native_queued_spin_unlock(struct qspinlock *lock)
         |                                              ^
   arch/riscv/kernel/paravirt.c:170:25: error: incomplete definition of type 'struct qspinlock'
     170 |         smp_store_release(&lock->locked, 0);
         |                            ~~~~^
   include/asm-generic/barrier.h:198:14: note: expanded from macro 'smp_store_release'
     198 |         WRITE_ONCE(*p, v);                                              \
         |                     ^
   include/asm-generic/rwonce.h:63:15: note: expanded from macro 'WRITE_ONCE'
      63 |         __WRITE_ONCE(x, val);                                           \
         |                      ^
   arch/riscv/include/asm/rwonce.h:12:27: note: expanded from macro '__WRITE_ONCE'
      12 |         *(volatile typeof(x) *)&(x) = (val);            \
         |                                  ^
   arch/riscv/kernel/paravirt.c:168:46: note: forward declaration of 'struct qspinlock'
     168 | static void native_queued_spin_unlock(struct qspinlock *lock)
         |                                              ^
   arch/riscv/kernel/paravirt.c:173:50: error: use of undeclared identifier 'native_queued_spin_lock_slowpath'; did you mean '__SCK__pv_queued_spin_lock_slowpath'?
     173 | DEFINE_STATIC_CALL(pv_queued_spin_lock_slowpath, native_queued_spin_lock_slowpath);
         |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                  __SCK__pv_queued_spin_lock_slowpath
   include/linux/static_call.h:298:29: note: expanded from macro 'DEFINE_STATIC_CALL'
     298 |         __DEFINE_STATIC_CALL(name, _func, _func)
         |                                    ^
   include/linux/static_call.h:292:28: note: expanded from macro '__DEFINE_STATIC_CALL'
     292 |         DECLARE_STATIC_CALL(name, _func);                               \
         |                                   ^
   include/linux/static_call_types.h:39:16: note: expanded from macro 'DECLARE_STATIC_CALL'
      39 |         extern typeof(func) STATIC_CALL_TRAMP(name);
         |                       ^
   arch/riscv/kernel/paravirt.c:173:1: note: '__SCK__pv_queued_spin_lock_slowpath' declared here
     173 | DEFINE_STATIC_CALL(pv_queued_spin_lock_slowpath, native_queued_spin_lock_slowpath);
         | ^
   include/linux/static_call.h:298:2: note: expanded from macro 'DEFINE_STATIC_CALL'
     298 |         __DEFINE_STATIC_CALL(name, _func, _func)
         |         ^
   include/linux/static_call.h:292:2: note: expanded from macro '__DEFINE_STATIC_CALL'
     292 |         DECLARE_STATIC_CALL(name, _func);                               \
         |         ^
   include/linux/static_call_types.h:38:32: note: expanded from macro 'DECLARE_STATIC_CALL'
      38 |         extern struct static_call_key STATIC_CALL_KEY(name);            \
         |                                       ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:75:22: note: expanded from macro '__PASTE'
      75 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:74:23: note: expanded from macro '___PASTE'
      74 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:94:1: note: expanded from here
      94 | __SCK__pv_queued_spin_lock_slowpath
         | ^
   arch/riscv/kernel/paravirt.c:173:50: error: use of undeclared identifier 'native_queued_spin_lock_slowpath'
     173 | DEFINE_STATIC_CALL(pv_queued_spin_lock_slowpath, native_queued_spin_lock_slowpath);
         |                                                  ^
   arch/riscv/kernel/paravirt.c:205:2: error: call to undeclared function '__pv_init_lock_hash'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     205 |         __pv_init_lock_hash();
         |         ^
   arch/riscv/kernel/paravirt.c:207:51: error: use of undeclared identifier '__pv_queued_spin_lock_slowpath'
     207 |         static_call_update(pv_queued_spin_lock_slowpath, __pv_queued_spin_lock_slowpath);
         |                                                          ^
   arch/riscv/kernel/paravirt.c:208:2: error: incompatible function pointer types initializing 'typeof (&__SCT__pv_queued_spin_unlock)' (aka 'void (*)(struct qspinlock *)') with an expression of type 'void (struct qspinlock *)' [-Wincompatible-function-pointer-types]
     208 |         static_call_update(pv_queued_spin_unlock, __pv_queued_spin_unlock);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:154:35: note: expanded from macro 'static_call_update'
     154 |         typeof(&STATIC_CALL_TRAMP(name)) __F = (func);                  \
         |                                          ^     ~~~~~~
>> arch/riscv/kernel/paravirt.c:217:1: warning: label at end of compound statement is a C2x extension [-Wc2x-extensions]
     217 | }
         | ^
   arch/riscv/kernel/paravirt.c:186:13: warning: no previous prototype for function 'pv_qspinlock_init' [-Wmissing-prototypes]
     186 | void __init pv_qspinlock_init(void)
         |             ^
   arch/riscv/kernel/paravirt.c:186:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     186 | void __init pv_qspinlock_init(void)
         | ^
         | static 
   7 warnings and 16 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PARAVIRT_SPINLOCKS
   Depends on [n]: PARAVIRT [=y] && SMP [=n]
   Selected by [y]:
   - PARAVIRT [=y] && RISCV_SBI [=y]


vim +217 arch/riscv/kernel/paravirt.c

f493379c24b6fd0 Guo Ren 2023-07-31  185  
349f37f3d4ea507 Guo Ren 2023-07-31  186  void __init pv_qspinlock_init(void)
349f37f3d4ea507 Guo Ren 2023-07-31  187  {
f493379c24b6fd0 Guo Ren 2023-07-31  188  	if (nopvspin) {
f493379c24b6fd0 Guo Ren 2023-07-31  189  		pr_info("PV qspinlocks disabled\n");
f493379c24b6fd0 Guo Ren 2023-07-31  190  		return;
f493379c24b6fd0 Guo Ren 2023-07-31  191  	}
f493379c24b6fd0 Guo Ren 2023-07-31  192  
349f37f3d4ea507 Guo Ren 2023-07-31  193  	if (num_possible_cpus() == 1)
349f37f3d4ea507 Guo Ren 2023-07-31  194  		return;
349f37f3d4ea507 Guo Ren 2023-07-31  195  
1a5d5e8bddfe020 Guo Ren 2023-08-02  196  	if(sbi_get_firmware_id() != SBI_EXT_BASE_IMPL_ID_KVM) {
1a5d5e8bddfe020 Guo Ren 2023-08-02  197  		goto cna_qspinlock;
349f37f3d4ea507 Guo Ren 2023-07-31  198  		return;
1a5d5e8bddfe020 Guo Ren 2023-08-02  199  	}
349f37f3d4ea507 Guo Ren 2023-07-31  200  
635f853815bac81 Guo Ren 2023-08-01  201  	if (!sbi_probe_extension(SBI_EXT_PVLOCK))
635f853815bac81 Guo Ren 2023-08-01  202  		return;
635f853815bac81 Guo Ren 2023-08-01  203  
349f37f3d4ea507 Guo Ren 2023-07-31  204  	pr_info("PV qspinlocks enabled\n");
349f37f3d4ea507 Guo Ren 2023-07-31  205  	__pv_init_lock_hash();
349f37f3d4ea507 Guo Ren 2023-07-31  206  
349f37f3d4ea507 Guo Ren 2023-07-31  207  	static_call_update(pv_queued_spin_lock_slowpath, __pv_queued_spin_lock_slowpath);
349f37f3d4ea507 Guo Ren 2023-07-31  208  	static_call_update(pv_queued_spin_unlock, __pv_queued_spin_unlock);
1a5d5e8bddfe020 Guo Ren 2023-08-02  209  	return;
1a5d5e8bddfe020 Guo Ren 2023-08-02  210  
1a5d5e8bddfe020 Guo Ren 2023-08-02  211  cna_qspinlock:
1a5d5e8bddfe020 Guo Ren 2023-08-02  212  #ifdef CONFIG_NUMA_AWARE_SPINLOCKS
1a5d5e8bddfe020 Guo Ren 2023-08-02  213  	if (cna_configure_spin_lock_slowpath())
1a5d5e8bddfe020 Guo Ren 2023-08-02  214  		static_call_update(pv_queued_spin_lock_slowpath,
1a5d5e8bddfe020 Guo Ren 2023-08-02  215  					__cna_queued_spin_lock_slowpath);
1a5d5e8bddfe020 Guo Ren 2023-08-02  216  #endif
349f37f3d4ea507 Guo Ren 2023-07-31 @217  }

:::::: The code at line 217 was first introduced by commit
:::::: 349f37f3d4ea507ce140d44a7fbee4c56994c95b RISC-V: paravirt: pvqspinlock: Add paravirt qspinlock skeleton

:::::: TO: Guo Ren <guoren@linux.alibaba.com>
:::::: CC: Guo Ren <guoren@linux.alibaba.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
