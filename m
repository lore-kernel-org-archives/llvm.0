Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFCFA3D;
	Sun, 17 Dec 2023 03:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WnclW4pt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702782560; x=1734318560;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cFdyRgTjptEYW9FgPsb1OOMFS36IKrMCOtPrmDjG/Qo=;
  b=WnclW4pt1sInSZTFXQpvtU5sq21UNjqXklbxkb2rkyVN+9qegLTx9dD8
   ieiAZpNRmqswu+Hn809zgUYudHuttIGA+K7rvlO4iZZSnfm4aRtiwte35
   G5NhbfsHH8UxvJq/ECmtW6b/mX2+/w70JRZO50+7oA4P5/0IdYDw/rl+J
   yWLEzdMjTd7Gicj6LrZzbzdDfmu85lbVf1dib43mSMIWlgf0lIwhhAm1h
   nVBV0CC/wRTzXNfB3bPRs6+NpM2WEUK2Is8OSyuQ+Gf7E5hLqVQgg/uWV
   9dDmpeyG+tcazbL2E9NZoixDXXXnEvqB30+WhIlbj7OLQWZKNicBxZP7t
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="398184636"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="398184636"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 19:09:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="1022376187"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="1022376187"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 16 Dec 2023 19:09:15 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEhWj-0002YO-1A;
	Sun, 17 Dec 2023 03:09:13 +0000
Date: Sun, 17 Dec 2023 11:08:19 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kmo@daterainc.com>
Subject: [bcachefs:header_cleanup 32/50]
 include/asm-generic/qspinlock.h:146:9: warning: 'arch_spin_lock' macro
 redefined
Message-ID: <202312171121.BN7oAaCB-lkp@intel.com>
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
config: i386-buildonly-randconfig-004-20231217 (https://download.01.org/0day-ci/archive/20231217/202312171121.BN7oAaCB-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312171121.BN7oAaCB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312171121.BN7oAaCB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:21:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:16:
   In file included from include/linux/kernfs.h:12:
   In file included from include/linux/idr.h:15:
   In file included from include/linux/radix-tree.h:21:
   In file included from include/linux/xarray.h:19:
   In file included from include/linux/sched/mm.h:7:
   In file included from include/linux/sched.h:2142:
   In file included from arch/x86/include/asm/spinlock.h:27:
   In file included from arch/x86/include/asm/qspinlock.h:7:
   include/asm-generic/qspinlock_types.h:44:3: error: typedef redefinition with different types ('struct qspinlock' vs 'struct arch_spinlock_t')
   } arch_spinlock_t;
     ^
   include/linux/spinlock_types_up.h:25:20: note: previous definition is here
   typedef struct { } arch_spinlock_t;
                      ^
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:21:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:16:
   In file included from include/linux/kernfs.h:12:
   In file included from include/linux/idr.h:15:
   In file included from include/linux/radix-tree.h:21:
   In file included from include/linux/xarray.h:19:
   In file included from include/linux/sched/mm.h:7:
   In file included from include/linux/sched.h:2142:
   In file included from arch/x86/include/asm/spinlock.h:27:
   In file included from arch/x86/include/asm/qspinlock.h:7:
   include/asm-generic/qspinlock_types.h:49:9: warning: '__ARCH_SPIN_LOCK_UNLOCKED' macro redefined [-Wmacro-redefined]
   #define __ARCH_SPIN_LOCK_UNLOCKED       { { .val = ATOMIC_INIT(0) } }
           ^
   include/linux/spinlock_types_up.h:27:9: note: previous definition is here
   #define __ARCH_SPIN_LOCK_UNLOCKED { }
           ^
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:21:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:16:
   In file included from include/linux/kernfs.h:12:
   In file included from include/linux/idr.h:15:
   In file included from include/linux/radix-tree.h:21:
   In file included from include/linux/xarray.h:19:
   In file included from include/linux/sched/mm.h:7:
   In file included from include/linux/sched.h:2142:
   In file included from arch/x86/include/asm/spinlock.h:27:
   In file included from arch/x86/include/asm/qspinlock.h:107:
   include/asm-generic/qspinlock.h:143:9: warning: 'arch_spin_is_locked' macro redefined [-Wmacro-redefined]
   #define arch_spin_is_locked(l)          queued_spin_is_locked(l)
           ^
   include/linux/spinlock_up.h:62:9: note: previous definition is here
   #define arch_spin_is_locked(lock)       ((void)(lock), 0)
           ^
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:21:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:16:
   In file included from include/linux/kernfs.h:12:
   In file included from include/linux/idr.h:15:
   In file included from include/linux/radix-tree.h:21:
   In file included from include/linux/xarray.h:19:
   In file included from include/linux/sched/mm.h:7:
   In file included from include/linux/sched.h:2142:
   In file included from arch/x86/include/asm/spinlock.h:27:
   In file included from arch/x86/include/asm/qspinlock.h:107:
   include/asm-generic/qspinlock.h:144:9: warning: 'arch_spin_is_contended' macro redefined [-Wmacro-redefined]
   #define arch_spin_is_contended(l)       queued_spin_is_contended(l)
           ^
   include/linux/spinlock_up.h:69:9: note: previous definition is here
   #define arch_spin_is_contended(lock)    (((void)(lock), 0))
           ^
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:21:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:16:
   In file included from include/linux/kernfs.h:12:
   In file included from include/linux/idr.h:15:
   In file included from include/linux/radix-tree.h:21:
   In file included from include/linux/xarray.h:19:
   In file included from include/linux/sched/mm.h:7:
   In file included from include/linux/sched.h:2142:
   In file included from arch/x86/include/asm/spinlock.h:27:
   In file included from arch/x86/include/asm/qspinlock.h:107:
>> include/asm-generic/qspinlock.h:146:9: warning: 'arch_spin_lock' macro redefined [-Wmacro-redefined]
   #define arch_spin_lock(l)               queued_spin_lock(l)
           ^
   include/linux/spinlock_up.h:64:10: note: previous definition is here
   # define arch_spin_lock(lock)           do { barrier(); (void)(lock); } while (0)
            ^
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:21:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:16:
   In file included from include/linux/kernfs.h:12:
   In file included from include/linux/idr.h:15:
   In file included from include/linux/radix-tree.h:21:
   In file included from include/linux/xarray.h:19:
   In file included from include/linux/sched/mm.h:7:
   In file included from include/linux/sched.h:2142:
   In file included from arch/x86/include/asm/spinlock.h:27:
   In file included from arch/x86/include/asm/qspinlock.h:107:
>> include/asm-generic/qspinlock.h:147:9: warning: 'arch_spin_trylock' macro redefined [-Wmacro-redefined]
   #define arch_spin_trylock(l)            queued_spin_trylock(l)
           ^
   include/linux/spinlock_up.h:66:10: note: previous definition is here
   # define arch_spin_trylock(lock)        ({ barrier(); (void)(lock); 1; })
            ^
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:21:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:16:
   In file included from include/linux/kernfs.h:12:
   In file included from include/linux/idr.h:15:
   In file included from include/linux/radix-tree.h:21:
   In file included from include/linux/xarray.h:19:
   In file included from include/linux/sched/mm.h:7:
   In file included from include/linux/sched.h:2142:
   In file included from arch/x86/include/asm/spinlock.h:27:
   In file included from arch/x86/include/asm/qspinlock.h:107:
>> include/asm-generic/qspinlock.h:148:9: warning: 'arch_spin_unlock' macro redefined [-Wmacro-redefined]
   #define arch_spin_unlock(l)             queued_spin_unlock(l)
           ^
   include/linux/spinlock_up.h:65:10: note: previous definition is here
   # define arch_spin_unlock(lock) do { barrier(); (void)(lock); } while (0)
            ^
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:21:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:16:
   In file included from include/linux/kernfs.h:12:
   In file included from include/linux/idr.h:15:
   In file included from include/linux/radix-tree.h:21:
   In file included from include/linux/xarray.h:19:
   In file included from include/linux/sched/mm.h:7:
   In file included from include/linux/sched.h:2142:
   In file included from arch/x86/include/asm/spinlock.h:43:
   In file included from arch/x86/include/asm/qrwlock.h:5:
   include/asm-generic/qrwlock_types.h:27:3: error: typedef redefinition with different types ('struct qrwlock' vs 'struct arch_rwlock_t')
   } arch_rwlock_t;
     ^
   include/linux/spinlock_types_up.h:33:3: note: previous definition is here
   } arch_rwlock_t;
     ^
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:21:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:16:
   In file included from include/linux/kernfs.h:12:
   In file included from include/linux/idr.h:15:
   In file included from include/linux/radix-tree.h:21:
   In file included from include/linux/xarray.h:19:
   In file included from include/linux/sched/mm.h:7:
   In file included from include/linux/sched.h:2142:
   In file included from arch/x86/include/asm/spinlock.h:43:
   In file included from arch/x86/include/asm/qrwlock.h:5:
   include/asm-generic/qrwlock_types.h:29:9: warning: '__ARCH_RW_LOCK_UNLOCKED' macro redefined [-Wmacro-redefined]
   #define __ARCH_RW_LOCK_UNLOCKED {               \
           ^
   include/linux/spinlock_types_up.h:35:9: note: previous definition is here
   #define __ARCH_RW_LOCK_UNLOCKED { }
           ^
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:21:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:16:
   In file included from include/linux/kernfs.h:12:
   In file included from include/linux/idr.h:15:
   In file included from include/linux/radix-tree.h:21:
   In file included from include/linux/xarray.h:19:
   In file included from include/linux/sched/mm.h:7:
   In file included from include/linux/sched.h:2142:
   In file included from arch/x86/include/asm/spinlock.h:43:
   In file included from arch/x86/include/asm/qrwlock.h:6:
   include/asm-generic/qrwlock.h:132:29: error: incompatible pointer types passing 'arch_spinlock_t *' to parameter of type 'struct qspinlock *' [-Werror,-Wincompatible-pointer-types]
           return arch_spin_is_locked(&lock->wait_lock);
                                      ^~~~~~~~~~~~~~~~
   include/asm-generic/qspinlock.h:143:55: note: expanded from macro 'arch_spin_is_locked'
   #define arch_spin_is_locked(l)          queued_spin_is_locked(l)
                                                                 ^
   include/asm-generic/qspinlock.h:51:68: note: passing argument to parameter 'lock' here
   static __always_inline int queued_spin_is_locked(struct qspinlock *lock)
                                                                      ^
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:21:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:16:
   In file included from include/linux/kernfs.h:12:
   In file included from include/linux/idr.h:15:
   In file included from include/linux/radix-tree.h:21:
>> include/linux/xarray.h:380:2: warning: excess elements in struct initializer [-Wexcess-initializers]
           spin_lock_init(&xa->xa_lock);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:344:13: note: expanded from macro 'spin_lock_init'
           *(_lock) = __SPIN_LOCK_UNLOCKED(_lock); \
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_types.h:41:15: note: expanded from macro '__SPIN_LOCK_UNLOCKED'
           (spinlock_t) __SPIN_LOCK_INITIALIZER(lockname)
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_types.h:38:15: note: expanded from macro '__SPIN_LOCK_INITIALIZER'
           { { .rlock = ___SPIN_LOCK_INITIALIZER(lockname) } }
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_types.h:33:14: note: expanded from macro '___SPIN_LOCK_INITIALIZER'
           .raw_lock = __ARCH_SPIN_LOCK_UNLOCKED,  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/qspinlock_types.h:49:37: note: expanded from macro '__ARCH_SPIN_LOCK_UNLOCKED'
   #define __ARCH_SPIN_LOCK_UNLOCKED       { { .val = ATOMIC_INIT(0) } }
                                             ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:25:
>> include/linux/semaphore.h:40:28: warning: excess elements in struct initializer [-Wexcess-initializers]
           *sem = (struct semaphore) __SEMAPHORE_INITIALIZER(*sem, val);
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/semaphore.h:23:11: note: expanded from macro '__SEMAPHORE_INITIALIZER'
           .lock           = __RAW_SPIN_LOCK_UNLOCKED((name).lock),        \
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_types_raw.h:69:19: note: expanded from macro '__RAW_SPIN_LOCK_UNLOCKED'
           (raw_spinlock_t) __RAW_SPIN_LOCK_INITIALIZER(lockname)
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_types_raw.h:64:14: note: expanded from macro '__RAW_SPIN_LOCK_INITIALIZER'
           .raw_lock = __ARCH_SPIN_LOCK_UNLOCKED,  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/qspinlock_types.h:49:37: note: expanded from macro '__ARCH_SPIN_LOCK_UNLOCKED'
   #define __ARCH_SPIN_LOCK_UNLOCKED       { { .val = ATOMIC_INIT(0) } }
                                             ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
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
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
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
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
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
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
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
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
                           (set1->sig[2] == set2->sig[2]) &&
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
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
                           (set1->sig[2] == set2->sig[2]) &&
..


vim +/arch_spin_lock +146 include/asm-generic/qspinlock.h

2aa79af6426319 Peter Zijlstra (Intel  2015-04-24  138) 
a33fda35e3a765 Waiman Long            2015-04-24  139  /*
a33fda35e3a765 Waiman Long            2015-04-24  140   * Remapping spinlock architecture specific functions to the corresponding
a33fda35e3a765 Waiman Long            2015-04-24  141   * queued spinlock functions.
a33fda35e3a765 Waiman Long            2015-04-24  142   */
a33fda35e3a765 Waiman Long            2015-04-24  143  #define arch_spin_is_locked(l)		queued_spin_is_locked(l)
a33fda35e3a765 Waiman Long            2015-04-24  144  #define arch_spin_is_contended(l)	queued_spin_is_contended(l)
a33fda35e3a765 Waiman Long            2015-04-24  145  #define arch_spin_value_unlocked(l)	queued_spin_value_unlocked(l)
a33fda35e3a765 Waiman Long            2015-04-24 @146  #define arch_spin_lock(l)		queued_spin_lock(l)
a33fda35e3a765 Waiman Long            2015-04-24 @147  #define arch_spin_trylock(l)		queued_spin_trylock(l)
a33fda35e3a765 Waiman Long            2015-04-24 @148  #define arch_spin_unlock(l)		queued_spin_unlock(l)
a33fda35e3a765 Waiman Long            2015-04-24  149  

:::::: The code at line 146 was first introduced by commit
:::::: a33fda35e3a7655fb7df756ed67822afb5ed5e8d locking/qspinlock: Introduce a simple generic 4-byte queued spinlock

:::::: TO: Waiman Long <Waiman.Long@hp.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
