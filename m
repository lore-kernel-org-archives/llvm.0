Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78D449F77;
	Sun, 17 Dec 2023 22:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="krtpe8Wz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702851327; x=1734387327;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rGWK7ItDJxsI4BB2PRCv0zBMBcaUdcWa0pmP2pytiGA=;
  b=krtpe8WzLTBX10cHYhMmZZ+CjBYbEgcIMeO8OKRRfL6LWbYpEJsR7KdM
   insUB4kvCPDNFRg5CadWPlWCZB5Oz3rM6gXMnO6MxLjiTe69q8UE4GXr8
   2Gv+x3TXOvjXybzKWn20MZf4lYAYrboin9fP37NTLdPneYZDYvpfVE966
   ggg5kQBuduGYdWSlqINFAMJKrk840l/msvPY844LhfM5w4oPRwVngDTgU
   pK/xxR1nffAxAwE8hUIQ0Ej+XcNn3OrjR/6pytQja/XIf2kTyB9yEx/hW
   tjEiuUNGCdei7gcFcVC/eJl6zW6E4yvW1cWFuGVARsMW3/M4WeicQcIuF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="16989765"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="16989765"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2023 14:15:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="841274076"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="841274076"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 17 Dec 2023 14:15:22 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEzPs-0003TA-0F;
	Sun, 17 Dec 2023 22:15:20 +0000
Date: Mon, 18 Dec 2023 06:14:36 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kmo@daterainc.com>
Subject: [bcachefs:header_cleanup 32/50] include/linux/spinlock_up.h:62:9:
 warning: 'arch_spin_is_locked' macro redefined
Message-ID: <202312180626.rQyO4MTA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git header_cleanup
head:   7288b19e061b7aa3f46f685e9944af128f10ffd5
commit: 631d67d0997ba8606f0d3702de9d986a95429bfe [32/50] ipc: Kill bogus dependency on spinlock.h
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20231218/202312180626.rQyO4MTA-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project a418be96de7872f6058207c695ef4698cb1dbb93)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231218/202312180626.rQyO4MTA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312180626.rQyO4MTA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/um/kernel/asm-offsets.c:1:
   In file included from arch/x86/um/shared/sysdep/kernel-offsets.h:3:
   In file included from include/linux/sched.h:2142:
   In file included from arch/x86/include/asm/spinlock.h:27:
   In file included from arch/x86/include/asm/qspinlock.h:7:
   include/asm-generic/qspinlock_types.h:44:3: error: typedef redefinition with different types ('struct qspinlock' vs 'struct arch_spinlock_t')
      44 | } arch_spinlock_t;
         |   ^
   include/linux/spinlock_types_up.h:25:20: note: previous definition is here
      25 | typedef struct { } arch_spinlock_t;
         |                    ^
   In file included from arch/um/kernel/asm-offsets.c:1:
   In file included from arch/x86/um/shared/sysdep/kernel-offsets.h:3:
   In file included from include/linux/sched.h:2142:
   In file included from arch/x86/include/asm/spinlock.h:27:
   In file included from arch/x86/include/asm/qspinlock.h:7:
   include/asm-generic/qspinlock_types.h:49:9: warning: '__ARCH_SPIN_LOCK_UNLOCKED' macro redefined [-Wmacro-redefined]
      49 | #define __ARCH_SPIN_LOCK_UNLOCKED       { { .val = ATOMIC_INIT(0) } }
         |         ^
   include/linux/spinlock_types_up.h:27:9: note: previous definition is here
      27 | #define __ARCH_SPIN_LOCK_UNLOCKED { }
         |         ^
   In file included from arch/um/kernel/asm-offsets.c:1:
   In file included from arch/x86/um/shared/sysdep/kernel-offsets.h:3:
   In file included from include/linux/sched.h:2142:
   In file included from arch/x86/include/asm/spinlock.h:43:
   In file included from arch/x86/include/asm/qrwlock.h:5:
   include/asm-generic/qrwlock_types.h:27:3: error: typedef redefinition with different types ('struct qrwlock' vs 'struct arch_rwlock_t')
      27 | } arch_rwlock_t;
         |   ^
   include/linux/spinlock_types_up.h:33:3: note: previous definition is here
      33 | } arch_rwlock_t;
         |   ^
   In file included from arch/um/kernel/asm-offsets.c:1:
   In file included from arch/x86/um/shared/sysdep/kernel-offsets.h:3:
   In file included from include/linux/sched.h:2142:
   In file included from arch/x86/include/asm/spinlock.h:43:
   In file included from arch/x86/include/asm/qrwlock.h:5:
   include/asm-generic/qrwlock_types.h:29:9: warning: '__ARCH_RW_LOCK_UNLOCKED' macro redefined [-Wmacro-redefined]
      29 | #define __ARCH_RW_LOCK_UNLOCKED {               \
         |         ^
   include/linux/spinlock_types_up.h:35:9: note: previous definition is here
      35 | #define __ARCH_RW_LOCK_UNLOCKED { }
         |         ^
   In file included from arch/um/kernel/asm-offsets.c:1:
   In file included from arch/x86/um/shared/sysdep/kernel-offsets.h:3:
   In file included from include/linux/sched.h:2142:
   In file included from arch/x86/include/asm/spinlock.h:43:
   In file included from arch/x86/include/asm/qrwlock.h:6:
   include/asm-generic/qrwlock.h:132:29: error: incompatible pointer types passing 'arch_spinlock_t *' to parameter of type 'struct qspinlock *' [-Werror,-Wincompatible-pointer-types]
     132 |         return arch_spin_is_locked(&lock->wait_lock);
         |                                    ^~~~~~~~~~~~~~~~
   include/asm-generic/qspinlock.h:143:55: note: expanded from macro 'arch_spin_is_locked'
     143 | #define arch_spin_is_locked(l)          queued_spin_is_locked(l)
         |                                                               ^
   include/asm-generic/qspinlock.h:51:68: note: passing argument to parameter 'lock' here
      51 | static __always_inline int queued_spin_is_locked(struct qspinlock *lock)
         |                                                                    ^
   In file included from arch/um/kernel/asm-offsets.c:1:
   In file included from arch/x86/um/shared/sysdep/kernel-offsets.h:5:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:97:
>> include/linux/spinlock_up.h:62:9: warning: 'arch_spin_is_locked' macro redefined [-Wmacro-redefined]
      62 | #define arch_spin_is_locked(lock)       ((void)(lock), 0)
         |         ^
   include/asm-generic/qspinlock.h:143:9: note: previous definition is here
     143 | #define arch_spin_is_locked(l)          queued_spin_is_locked(l)
         |         ^
   In file included from arch/um/kernel/asm-offsets.c:1:
   In file included from arch/x86/um/shared/sysdep/kernel-offsets.h:5:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:97:
>> include/linux/spinlock_up.h:64:10: warning: 'arch_spin_lock' macro redefined [-Wmacro-redefined]
      64 | # define arch_spin_lock(lock)           do { barrier(); (void)(lock); } while (0)
         |          ^
   include/asm-generic/qspinlock.h:146:9: note: previous definition is here
     146 | #define arch_spin_lock(l)               queued_spin_lock(l)
         |         ^
   In file included from arch/um/kernel/asm-offsets.c:1:
   In file included from arch/x86/um/shared/sysdep/kernel-offsets.h:5:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:97:
>> include/linux/spinlock_up.h:65:10: warning: 'arch_spin_unlock' macro redefined [-Wmacro-redefined]
      65 | # define arch_spin_unlock(lock) do { barrier(); (void)(lock); } while (0)
         |          ^
   include/asm-generic/qspinlock.h:148:9: note: previous definition is here
     148 | #define arch_spin_unlock(l)             queued_spin_unlock(l)
         |         ^
   In file included from arch/um/kernel/asm-offsets.c:1:
   In file included from arch/x86/um/shared/sysdep/kernel-offsets.h:5:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:97:
>> include/linux/spinlock_up.h:66:10: warning: 'arch_spin_trylock' macro redefined [-Wmacro-redefined]
      66 | # define arch_spin_trylock(lock)        ({ barrier(); (void)(lock); 1; })
         |          ^
   include/asm-generic/qspinlock.h:147:9: note: previous definition is here
     147 | #define arch_spin_trylock(l)            queued_spin_trylock(l)
         |         ^
   In file included from arch/um/kernel/asm-offsets.c:1:
   In file included from arch/x86/um/shared/sysdep/kernel-offsets.h:5:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:97:
>> include/linux/spinlock_up.h:69:9: warning: 'arch_spin_is_contended' macro redefined [-Wmacro-redefined]
      69 | #define arch_spin_is_contended(lock)    (((void)(lock), 0))
         |         ^
   include/asm-generic/qspinlock.h:144:9: note: previous definition is here
     144 | #define arch_spin_is_contended(l)       queued_spin_is_contended(l)
         |         ^
   In file included from arch/um/kernel/asm-offsets.c:1:
   In file included from arch/x86/um/shared/sysdep/kernel-offsets.h:5:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:12:
>> include/linux/maple_tree.h:621:3: warning: excess elements in struct initializer [-Wexcess-initializers]
     621 |                 spin_lock_init(&mt->ma_lock);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:344:13: note: expanded from macro 'spin_lock_init'
     344 |         *(_lock) = __SPIN_LOCK_UNLOCKED(_lock); \
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_types.h:41:15: note: expanded from macro '__SPIN_LOCK_UNLOCKED'
      41 |         (spinlock_t) __SPIN_LOCK_INITIALIZER(lockname)
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_types.h:38:15: note: expanded from macro '__SPIN_LOCK_INITIALIZER'
      38 |         { { .rlock = ___SPIN_LOCK_INITIALIZER(lockname) } }
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_types.h:33:14: note: expanded from macro '___SPIN_LOCK_INITIALIZER'
      33 |         .raw_lock = __ARCH_SPIN_LOCK_UNLOCKED,  \
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/qspinlock_types.h:49:37: note: expanded from macro '__ARCH_SPIN_LOCK_UNLOCKED'
      49 | #define __ARCH_SPIN_LOCK_UNLOCKED       { { .val = ATOMIC_INIT(0) } }
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/um/kernel/asm-offsets.c:1:
   arch/x86/um/shared/sysdep/kernel-offsets.h:9:6: warning: no previous prototype for function 'foo' [-Wmissing-prototypes]
       9 | void foo(void)
         |      ^
   arch/x86/um/shared/sysdep/kernel-offsets.h:9:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
       9 | void foo(void)
         | ^
         | static 
   9 warnings and 3 errors generated.
   make[3]: *** [scripts/Makefile.build:116: arch/um/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1191: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/arch_spin_is_locked +62 include/linux/spinlock_up.h

fb1c8f93d869b34 Ingo Molnar     2005-09-10  60  
fb1c8f93d869b34 Ingo Molnar     2005-09-10  61  #else /* DEBUG_SPINLOCK */
0199c4e68d1f028 Thomas Gleixner 2009-12-02 @62  #define arch_spin_is_locked(lock)	((void)(lock), 0)
0a0fca9d832b704 Viresh Kumar    2013-06-04  63  /* for sched/core.c and kernel_lock.c: */
386afc91144b36b Linus Torvalds  2013-04-09 @64  # define arch_spin_lock(lock)		do { barrier(); (void)(lock); } while (0)
386afc91144b36b Linus Torvalds  2013-04-09 @65  # define arch_spin_unlock(lock)	do { barrier(); (void)(lock); } while (0)
386afc91144b36b Linus Torvalds  2013-04-09 @66  # define arch_spin_trylock(lock)	({ barrier(); (void)(lock); 1; })
fb1c8f93d869b34 Ingo Molnar     2005-09-10  67  #endif /* DEBUG_SPINLOCK */
fb1c8f93d869b34 Ingo Molnar     2005-09-10  68  
0199c4e68d1f028 Thomas Gleixner 2009-12-02 @69  #define arch_spin_is_contended(lock)	(((void)(lock), 0))
95c354fe9f7d6de Nicholas Piggin 2008-01-30  70  

:::::: The code at line 62 was first introduced by commit
:::::: 0199c4e68d1f02894bdefe4b5d9e9ee4aedd8d62 locking: Convert __raw_spin* functions to arch_spin*

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
