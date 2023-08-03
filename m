Received: from mgamail.intel.com (unknown [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966CC8F7C;
	Thu,  3 Aug 2023 11:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691061268; x=1722597268;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+fs5y237rfzb5uv6K2zteusiY+T4qeIug2Wogoh0utY=;
  b=O9VJE12BKVwgwKecrHQKVJq6koS8djVw1LKqLsS+edeCxMHuFAUy+KFk
   bPcPMCAA1omUnEFTdQ+A1NciJ7ePmstwk4qw00HZC334lrbT12li3N0Qj
   IfbIDIjKezhWOACuvE3RSIwPcNfbg5/UlgI0D3pvHS4dYWnDC1/lgmt8b
   9I6UaseBy1vOGI23lrmYhQUDdtxoYcD4Pln6idcxCYpYeSw6GgH6Lfv54
   CqZ9Zl5YQXRWBEwv+5mw8Xn2UIDlMOSuX72BGHBytg4JsmUgRUhBjgFnm
   BpeCufgtPi2O9JDwY8mmdZzrkvTAeW0P0r+WqrNNWAAKKcMBwhb3KQk3S
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="349436343"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="scan'208";a="349436343"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 04:14:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="903342561"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="scan'208";a="903342561"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 03 Aug 2023 04:14:24 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRWHf-00024J-07;
	Thu, 03 Aug 2023 11:14:23 +0000
Date: Thu, 3 Aug 2023 19:13:51 +0800
From: kernel test robot <lkp@intel.com>
To: Guo Ren <guoren@linux.alibaba.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [csky-linux:sg2042-master-qspinlock-64ilp32_v4 30/70]
 arch/riscv/kernel/setup.c:333:2: error: call to undeclared function
 'pv_qspinlock_init'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202308031910.EVcRQack-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Guo,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/c-sky/csky-linux sg2042-master-qspinlock-64ilp32_v4
head:   ee021e57ffe3195b6a3ac5fcb2d4353375d1f261
commit: 649c597d937299900198d6b54c954dc93d6b91b0 [30/70] RISC-V: paravirt: pvqspinlock: Add kconfig entry
config: riscv-randconfig-r021-20230731 (https://download.01.org/0day-ci/archive/20230803/202308031910.EVcRQack-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230803/202308031910.EVcRQack-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308031910.EVcRQack-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/kernel/setup.c:333:2: error: call to undeclared function 'pv_qspinlock_init'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     333 |         pv_qspinlock_init();
         |         ^
   1 error generated.
--
   arch/riscv/kernel/paravirt.c:109:12: warning: no previous prototype for function 'pv_time_init' [-Wmissing-prototypes]
     109 | int __init pv_time_init(void)
         |            ^
   arch/riscv/kernel/paravirt.c:109:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     109 | int __init pv_time_init(void)
         | ^
         | static 
   In file included from arch/riscv/kernel/paravirt.c:135:
   arch/riscv/include/asm/qspinlock_paravirt.h:5:37: warning: declaration of 'struct qspinlock' will not be visible outside of this function [-Wvisibility]
       5 | void __pv_queued_spin_unlock(struct qspinlock *lock);
         |                                     ^
   arch/riscv/kernel/paravirt.c:137:6: warning: no previous prototype for function 'pv_kick' [-Wmissing-prototypes]
     137 | void pv_kick(int cpu)
         |      ^
   arch/riscv/kernel/paravirt.c:137:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     137 | void pv_kick(int cpu)
         | ^
         | static 
   arch/riscv/kernel/paravirt.c:144:6: warning: no previous prototype for function 'pv_wait' [-Wmissing-prototypes]
     144 | void pv_wait(u8 *ptr, u8 val)
         |      ^
   arch/riscv/kernel/paravirt.c:144:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     144 | void pv_wait(u8 *ptr, u8 val)
         | ^
         | static 
   arch/riscv/kernel/paravirt.c:160:46: warning: declaration of 'struct qspinlock' will not be visible outside of this function [-Wvisibility]
     160 | static void native_queued_spin_unlock(struct qspinlock *lock)
         |                                              ^
>> arch/riscv/kernel/paravirt.c:162:25: error: incomplete definition of type 'struct qspinlock'
     162 |         smp_store_release(&lock->locked, 0);
         |                            ~~~~^
   include/asm-generic/barrier.h:196:34: note: expanded from macro 'smp_store_release'
     196 |         compiletime_assert_atomic_type(*p);                             \
         |                                         ^
   include/linux/compiler_types.h:400:35: note: expanded from macro 'compiletime_assert_atomic_type'
     400 |         compiletime_assert(__native_word(t),                            \
         |                                          ^
   include/linux/compiler_types.h:364:10: note: expanded from macro '__native_word'
     364 |         (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
         |                 ^
   include/linux/compiler_types.h:397:22: note: expanded from macro 'compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:385:23: note: expanded from macro '_compiletime_assert'
     385 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:377:9: note: expanded from macro '__compiletime_assert'
     377 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   arch/riscv/kernel/paravirt.c:160:46: note: forward declaration of 'struct qspinlock'
     160 | static void native_queued_spin_unlock(struct qspinlock *lock)
         |                                              ^
>> arch/riscv/kernel/paravirt.c:162:25: error: incomplete definition of type 'struct qspinlock'
     162 |         smp_store_release(&lock->locked, 0);
         |                            ~~~~^
   include/asm-generic/barrier.h:196:34: note: expanded from macro 'smp_store_release'
     196 |         compiletime_assert_atomic_type(*p);                             \
         |                                         ^
   include/linux/compiler_types.h:400:35: note: expanded from macro 'compiletime_assert_atomic_type'
     400 |         compiletime_assert(__native_word(t),                            \
         |                                          ^
   include/linux/compiler_types.h:364:39: note: expanded from macro '__native_word'
     364 |         (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
         |                                              ^
   include/linux/compiler_types.h:397:22: note: expanded from macro 'compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:385:23: note: expanded from macro '_compiletime_assert'
     385 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:377:9: note: expanded from macro '__compiletime_assert'
     377 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   arch/riscv/kernel/paravirt.c:160:46: note: forward declaration of 'struct qspinlock'
     160 | static void native_queued_spin_unlock(struct qspinlock *lock)
         |                                              ^
>> arch/riscv/kernel/paravirt.c:162:25: error: incomplete definition of type 'struct qspinlock'
     162 |         smp_store_release(&lock->locked, 0);
         |                            ~~~~^
   include/asm-generic/barrier.h:196:34: note: expanded from macro 'smp_store_release'
     196 |         compiletime_assert_atomic_type(*p);                             \
         |                                         ^
   include/linux/compiler_types.h:400:35: note: expanded from macro 'compiletime_assert_atomic_type'
     400 |         compiletime_assert(__native_word(t),                            \
         |                                          ^
   include/linux/compiler_types.h:365:10: note: expanded from macro '__native_word'
     365 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
         |                 ^
   include/linux/compiler_types.h:397:22: note: expanded from macro 'compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:385:23: note: expanded from macro '_compiletime_assert'
     385 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:377:9: note: expanded from macro '__compiletime_assert'
     377 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   arch/riscv/kernel/paravirt.c:160:46: note: forward declaration of 'struct qspinlock'
     160 | static void native_queued_spin_unlock(struct qspinlock *lock)
         |                                              ^
>> arch/riscv/kernel/paravirt.c:162:25: error: incomplete definition of type 'struct qspinlock'
     162 |         smp_store_release(&lock->locked, 0);
         |                            ~~~~^
   include/asm-generic/barrier.h:196:34: note: expanded from macro 'smp_store_release'
     196 |         compiletime_assert_atomic_type(*p);                             \
         |                                         ^
   include/linux/compiler_types.h:400:35: note: expanded from macro 'compiletime_assert_atomic_type'
     400 |         compiletime_assert(__native_word(t),                            \
         |                                          ^
   include/linux/compiler_types.h:365:38: note: expanded from macro '__native_word'
     365 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
         |                                             ^
   include/linux/compiler_types.h:397:22: note: expanded from macro 'compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:385:23: note: expanded from macro '_compiletime_assert'
     385 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:377:9: note: expanded from macro '__compiletime_assert'
     377 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   arch/riscv/kernel/paravirt.c:160:46: note: forward declaration of 'struct qspinlock'
     160 | static void native_queued_spin_unlock(struct qspinlock *lock)
         |                                              ^
>> arch/riscv/kernel/paravirt.c:162:25: error: incomplete definition of type 'struct qspinlock'
     162 |         smp_store_release(&lock->locked, 0);
         |                            ~~~~^
   include/asm-generic/barrier.h:198:14: note: expanded from macro 'smp_store_release'
     198 |         WRITE_ONCE(*p, v);                                              \
         |                     ^
   include/asm-generic/rwonce.h:62:33: note: expanded from macro 'WRITE_ONCE'
      62 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:397:22: note: expanded from macro 'compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:385:23: note: expanded from macro '_compiletime_assert'
     385 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:377:9: note: expanded from macro '__compiletime_assert'
     377 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   arch/riscv/kernel/paravirt.c:160:46: note: forward declaration of 'struct qspinlock'
     160 | static void native_queued_spin_unlock(struct qspinlock *lock)
         |                                              ^
>> arch/riscv/kernel/paravirt.c:162:25: error: incomplete definition of type 'struct qspinlock'
     162 |         smp_store_release(&lock->locked, 0);
         |                            ~~~~^
   include/asm-generic/barrier.h:198:14: note: expanded from macro 'smp_store_release'
     198 |         WRITE_ONCE(*p, v);                                              \
         |                     ^
   include/asm-generic/rwonce.h:62:33: note: expanded from macro 'WRITE_ONCE'
      62 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:397:22: note: expanded from macro 'compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:385:23: note: expanded from macro '_compiletime_assert'
     385 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:377:9: note: expanded from macro '__compiletime_assert'
     377 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   arch/riscv/kernel/paravirt.c:160:46: note: forward declaration of 'struct qspinlock'
     160 | static void native_queued_spin_unlock(struct qspinlock *lock)
         |                                              ^
>> arch/riscv/kernel/paravirt.c:162:25: error: incomplete definition of type 'struct qspinlock'
     162 |         smp_store_release(&lock->locked, 0);
         |                            ~~~~^
   include/asm-generic/barrier.h:198:14: note: expanded from macro 'smp_store_release'
     198 |         WRITE_ONCE(*p, v);                                              \
         |                     ^
   include/asm-generic/rwonce.h:62:33: note: expanded from macro 'WRITE_ONCE'
      62 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:397:22: note: expanded from macro 'compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:385:23: note: expanded from macro '_compiletime_assert'
     385 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:377:9: note: expanded from macro '__compiletime_assert'
     377 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   arch/riscv/kernel/paravirt.c:160:46: note: forward declaration of 'struct qspinlock'
     160 | static void native_queued_spin_unlock(struct qspinlock *lock)
         |                                              ^
>> arch/riscv/kernel/paravirt.c:162:25: error: incomplete definition of type 'struct qspinlock'
     162 |         smp_store_release(&lock->locked, 0);
         |                            ~~~~^
   include/asm-generic/barrier.h:198:14: note: expanded from macro 'smp_store_release'
     198 |         WRITE_ONCE(*p, v);                                              \
         |                     ^
   include/asm-generic/rwonce.h:62:33: note: expanded from macro 'WRITE_ONCE'
      62 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:397:22: note: expanded from macro 'compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:385:23: note: expanded from macro '_compiletime_assert'
     385 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:377:9: note: expanded from macro '__compiletime_assert'
     377 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   arch/riscv/kernel/paravirt.c:160:46: note: forward declaration of 'struct qspinlock'
     160 | static void native_queued_spin_unlock(struct qspinlock *lock)
         |                                              ^
>> arch/riscv/kernel/paravirt.c:162:25: error: incomplete definition of type 'struct qspinlock'
     162 |         smp_store_release(&lock->locked, 0);
         |                            ~~~~^
   include/asm-generic/barrier.h:198:14: note: expanded from macro 'smp_store_release'
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
   arch/riscv/kernel/paravirt.c:160:46: note: forward declaration of 'struct qspinlock'
     160 | static void native_queued_spin_unlock(struct qspinlock *lock)
         |                                              ^
>> arch/riscv/kernel/paravirt.c:162:25: error: incomplete definition of type 'struct qspinlock'
     162 |         smp_store_release(&lock->locked, 0);
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
   arch/riscv/kernel/paravirt.c:160:46: note: forward declaration of 'struct qspinlock'
     160 | static void native_queued_spin_unlock(struct qspinlock *lock)
         |                                              ^
>> arch/riscv/kernel/paravirt.c:162:25: error: incomplete definition of type 'struct qspinlock'
     162 |         smp_store_release(&lock->locked, 0);
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
   arch/riscv/kernel/paravirt.c:160:46: note: forward declaration of 'struct qspinlock'
     160 | static void native_queued_spin_unlock(struct qspinlock *lock)
         |                                              ^
>> arch/riscv/kernel/paravirt.c:165:50: error: use of undeclared identifier 'native_queued_spin_lock_slowpath'; did you mean '__SCK__pv_queued_spin_lock_slowpath'?
     165 | DEFINE_STATIC_CALL(pv_queued_spin_lock_slowpath, native_queued_spin_lock_slowpath);
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
   arch/riscv/kernel/paravirt.c:165:1: note: '__SCK__pv_queued_spin_lock_slowpath' declared here
     165 | DEFINE_STATIC_CALL(pv_queued_spin_lock_slowpath, native_queued_spin_lock_slowpath);
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
   <scratch space>:28:1: note: expanded from here
      28 | __SCK__pv_queued_spin_lock_slowpath
         | ^
   arch/riscv/kernel/paravirt.c:165:50: error: use of undeclared identifier 'native_queued_spin_lock_slowpath'
     165 | DEFINE_STATIC_CALL(pv_queued_spin_lock_slowpath, native_queued_spin_lock_slowpath);
         |                                                  ^
>> arch/riscv/kernel/paravirt.c:195:2: error: call to undeclared function '__pv_init_lock_hash'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     195 |         __pv_init_lock_hash();
         |         ^
>> arch/riscv/kernel/paravirt.c:197:51: error: use of undeclared identifier '__pv_queued_spin_lock_slowpath'
     197 |         static_call_update(pv_queued_spin_lock_slowpath, __pv_queued_spin_lock_slowpath);
         |                                                          ^
>> arch/riscv/kernel/paravirt.c:198:2: error: incompatible function pointer types initializing 'typeof (&__SCT__pv_queued_spin_unlock)' (aka 'void (*)(struct qspinlock *)') with an expression of type 'void (struct qspinlock *)' [-Wincompatible-function-pointer-types]
     198 |         static_call_update(pv_queued_spin_unlock, __pv_queued_spin_unlock);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:154:35: note: expanded from macro 'static_call_update'
     154 |         typeof(&STATIC_CALL_TRAMP(name)) __F = (func);                  \
         |                                          ^     ~~~~~~
   arch/riscv/kernel/paravirt.c:178:13: warning: no previous prototype for function 'pv_qspinlock_init' [-Wmissing-prototypes]
     178 | void __init pv_qspinlock_init(void)
         |             ^
   arch/riscv/kernel/paravirt.c:178:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     178 | void __init pv_qspinlock_init(void)
         | ^
         | static 
   6 warnings and 16 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PARAVIRT_SPINLOCKS
   Depends on [n]: PARAVIRT [=y] && SMP [=n]
   Selected by [y]:
   - PARAVIRT [=y] && RISCV_SBI [=y]


vim +/pv_qspinlock_init +333 arch/riscv/kernel/setup.c

f1e58583b9c7ce Atish Patra 2020-03-17  329  
5b3283ec604d33 Guo Ren     2023-07-27  330  void __init arch_cpu_finalize_init(void)
5b3283ec604d33 Guo Ren     2023-07-27  331  {
349f37f3d4ea50 Guo Ren     2023-07-31  332  #ifdef CONFIG_PARAVIRT_SPINLOCKS
349f37f3d4ea50 Guo Ren     2023-07-31 @333  	pv_qspinlock_init();
349f37f3d4ea50 Guo Ren     2023-07-31  334  #endif
5b3283ec604d33 Guo Ren     2023-07-27  335  	virt_spin_lock_init();
5b3283ec604d33 Guo Ren     2023-07-27  336  }
5b3283ec604d33 Guo Ren     2023-07-27  337  

:::::: The code at line 333 was first introduced by commit
:::::: 349f37f3d4ea507ce140d44a7fbee4c56994c95b RISC-V: paravirt: pvqspinlock: Add paravirt qspinlock skeleton

:::::: TO: Guo Ren <guoren@linux.alibaba.com>
:::::: CC: Guo Ren <guoren@linux.alibaba.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
