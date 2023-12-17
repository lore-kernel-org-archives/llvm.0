Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73D4EA9;
	Sun, 17 Dec 2023 02:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZwpsrCEH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702779977; x=1734315977;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bkd7N1KJ6SMLlqcZf0/vJbUBxKan7USRw/ozKWsIhtM=;
  b=ZwpsrCEHChX2C6b3smigRkXdkNuIq7oJdm8eGu3aivB5CpSzgd8lvBnQ
   9g3b3EQR8/9SScsWpXoZuKYoBmzNYCDA+URnn7slIrxNQhMo/Q1VqEHgP
   pNA4QX7O8/sJFXFxiLFhjyIhCuUPKMlbPAub/hr/XqFRe6MsKdiHVxryo
   DMZY605ki19ZW/71vU1dfyZwmHnXJxOX/66rU28u10JwWpZ2VdqY23n/u
   0cpkdd4Fq88IRz9QzCtsXOzmQ61Of7bZBEgByLELOKLW5/8tHo1+yKPBM
   sdgZuqVTUI2AJYytk59fXjnFlNHebv2zgJKgYNRO8blSaa41wVyx9arYl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="426529149"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="426529149"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 18:26:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="865827627"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="865827627"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Dec 2023 18:26:14 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEgr6-0002WL-0s;
	Sun, 17 Dec 2023 02:26:12 +0000
Date: Sun, 17 Dec 2023 10:26:03 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kmo@daterainc.com>
Subject: [bcachefs:header_cleanup 32/50]
 include/asm-generic/qspinlock_types.h:44:3: error: typedef redefinition with
 different types ('struct qspinlock' vs 'struct arch_spinlock_t')
Message-ID: <202312171005.IecBW1bY-lkp@intel.com>
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
config: i386-buildonly-randconfig-003-20231217 (https://download.01.org/0day-ci/archive/20231217/202312171005.IecBW1bY-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312171005.IecBW1bY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312171005.IecBW1bY-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

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
>> include/asm-generic/qspinlock_types.h:44:3: error: typedef redefinition with different types ('struct qspinlock' vs 'struct arch_spinlock_t')
   } arch_spinlock_t;
     ^
   include/linux/spinlock_types_up.h:19:3: note: previous definition is here
   } arch_spinlock_t;
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
>> include/asm-generic/qspinlock_types.h:49:9: warning: '__ARCH_SPIN_LOCK_UNLOCKED' macro redefined [-Wmacro-redefined]
   #define __ARCH_SPIN_LOCK_UNLOCKED       { { .val = ATOMIC_INIT(0) } }
           ^
   include/linux/spinlock_types_up.h:21:9: note: previous definition is here
   #define __ARCH_SPIN_LOCK_UNLOCKED { 1 }
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
>> include/asm-generic/qspinlock.h:143:9: warning: 'arch_spin_is_locked' macro redefined [-Wmacro-redefined]
   #define arch_spin_is_locked(l)          queued_spin_is_locked(l)
           ^
   include/linux/spinlock_up.h:27:9: note: previous definition is here
   #define arch_spin_is_locked(x)          ((x)->slock == 0)
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
>> include/asm-generic/qspinlock.h:144:9: warning: 'arch_spin_is_contended' macro redefined [-Wmacro-redefined]
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
   In file included from arch/x86/include/asm/spinlock.h:43:
   In file included from arch/x86/include/asm/qrwlock.h:5:
>> include/asm-generic/qrwlock_types.h:27:3: error: typedef redefinition with different types ('struct qrwlock' vs 'struct arch_rwlock_t')
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
>> include/asm-generic/qrwlock_types.h:29:9: warning: '__ARCH_RW_LOCK_UNLOCKED' macro redefined [-Wmacro-redefined]
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
>> include/asm-generic/qrwlock.h:132:29: error: incompatible pointer types passing 'arch_spinlock_t *' to parameter of type 'struct qspinlock *' [-Werror,-Wincompatible-pointer-types]
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
   In file included from include/linux/xarray.h:19:
   In file included from include/linux/sched/mm.h:7:
   In file included from include/linux/sched.h:2142:
   In file included from arch/x86/include/asm/spinlock.h:43:
   In file included from arch/x86/include/asm/qrwlock.h:6:
>> include/asm-generic/qrwlock.h:139:9: warning: 'arch_read_lock' macro redefined [-Wmacro-redefined]
   #define arch_read_lock(l)               queued_read_lock(l)
           ^
   include/linux/spinlock_up.h:54:9: note: previous definition is here
   #define arch_read_lock(lock)            do { barrier(); (void)(lock); } while (0)
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
>> include/asm-generic/qrwlock.h:140:9: warning: 'arch_write_lock' macro redefined [-Wmacro-redefined]
   #define arch_write_lock(l)              queued_write_lock(l)
           ^
   include/linux/spinlock_up.h:55:9: note: previous definition is here
   #define arch_write_lock(lock)           do { barrier(); (void)(lock); } while (0)
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
>> include/asm-generic/qrwlock.h:141:9: warning: 'arch_read_trylock' macro redefined [-Wmacro-redefined]
   #define arch_read_trylock(l)            queued_read_trylock(l)
           ^
   include/linux/spinlock_up.h:56:9: note: previous definition is here
   #define arch_read_trylock(lock) ({ barrier(); (void)(lock); 1; })
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
>> include/asm-generic/qrwlock.h:142:9: warning: 'arch_write_trylock' macro redefined [-Wmacro-redefined]
   #define arch_write_trylock(l)           queued_write_trylock(l)
           ^
   include/linux/spinlock_up.h:57:9: note: previous definition is here
   #define arch_write_trylock(lock)        ({ barrier(); (void)(lock); 1; })
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
>> include/asm-generic/qrwlock.h:143:9: warning: 'arch_read_unlock' macro redefined [-Wmacro-redefined]
   #define arch_read_unlock(l)             queued_read_unlock(l)
           ^
   include/linux/spinlock_up.h:58:9: note: previous definition is here
   #define arch_read_unlock(lock)          do { barrier(); (void)(lock); } while (0)
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
>> include/asm-generic/qrwlock.h:144:9: warning: 'arch_write_unlock' macro redefined [-Wmacro-redefined]
   #define arch_write_unlock(l)            queued_write_unlock(l)
           ^
   include/linux/spinlock_up.h:59:9: note: previous definition is here
   #define arch_write_unlock(lock) do { barrier(); (void)(lock); } while (0)
           ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:25:
>> include/linux/semaphore.h:40:28: error: designator in initializer for scalar type 'volatile unsigned int'
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
   include/asm-generic/qspinlock_types.h:49:39: note: expanded from macro '__ARCH_SPIN_LOCK_UNLOCKED'
   #define __ARCH_SPIN_LOCK_UNLOCKED       { { .val = ATOMIC_INIT(0) } }
                                               ^~~~~~~~~~~~~~~~~~~~~
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


vim +44 include/asm-generic/qspinlock_types.h

a33fda35e3a7655 Waiman Long             2015-04-24  13  
a33fda35e3a7655 Waiman Long             2015-04-24  14  typedef struct qspinlock {
625e88be1f41b53 Will Deacon             2018-04-26  15  	union {
a33fda35e3a7655 Waiman Long             2015-04-24  16  		atomic_t val;
625e88be1f41b53 Will Deacon             2018-04-26  17  
625e88be1f41b53 Will Deacon             2018-04-26  18  		/*
625e88be1f41b53 Will Deacon             2018-04-26  19  		 * By using the whole 2nd least significant byte for the
625e88be1f41b53 Will Deacon             2018-04-26  20  		 * pending bit, we can allow better optimization of the lock
625e88be1f41b53 Will Deacon             2018-04-26  21  		 * acquisition for the pending bit holder.
625e88be1f41b53 Will Deacon             2018-04-26  22  		 */
625e88be1f41b53 Will Deacon             2018-04-26  23  #ifdef __LITTLE_ENDIAN
625e88be1f41b53 Will Deacon             2018-04-26  24  		struct {
625e88be1f41b53 Will Deacon             2018-04-26  25  			u8	locked;
625e88be1f41b53 Will Deacon             2018-04-26  26  			u8	pending;
625e88be1f41b53 Will Deacon             2018-04-26  27  		};
625e88be1f41b53 Will Deacon             2018-04-26  28  		struct {
625e88be1f41b53 Will Deacon             2018-04-26  29  			u16	locked_pending;
625e88be1f41b53 Will Deacon             2018-04-26  30  			u16	tail;
625e88be1f41b53 Will Deacon             2018-04-26  31  		};
625e88be1f41b53 Will Deacon             2018-04-26  32  #else
625e88be1f41b53 Will Deacon             2018-04-26  33  		struct {
625e88be1f41b53 Will Deacon             2018-04-26  34  			u16	tail;
625e88be1f41b53 Will Deacon             2018-04-26  35  			u16	locked_pending;
625e88be1f41b53 Will Deacon             2018-04-26  36  		};
625e88be1f41b53 Will Deacon             2018-04-26  37  		struct {
625e88be1f41b53 Will Deacon             2018-04-26  38  			u8	reserved[2];
625e88be1f41b53 Will Deacon             2018-04-26  39  			u8	pending;
625e88be1f41b53 Will Deacon             2018-04-26  40  			u8	locked;
625e88be1f41b53 Will Deacon             2018-04-26  41  		};
625e88be1f41b53 Will Deacon             2018-04-26  42  #endif
625e88be1f41b53 Will Deacon             2018-04-26  43  	};
a33fda35e3a7655 Waiman Long             2015-04-24 @44  } arch_spinlock_t;
a33fda35e3a7655 Waiman Long             2015-04-24  45  
b82e530290a0437 Dan Streetman           2016-02-19  46  /*
b82e530290a0437 Dan Streetman           2016-02-19  47   * Initializier
b82e530290a0437 Dan Streetman           2016-02-19  48   */
6cc65be4f6f2a71 Steven Rostedt (VMware  2018-06-21 @49) #define	__ARCH_SPIN_LOCK_UNLOCKED	{ { .val = ATOMIC_INIT(0) } }
b82e530290a0437 Dan Streetman           2016-02-19  50  

:::::: The code at line 44 was first introduced by commit
:::::: a33fda35e3a7655fb7df756ed67822afb5ed5e8d locking/qspinlock: Introduce a simple generic 4-byte queued spinlock

:::::: TO: Waiman Long <Waiman.Long@hp.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
