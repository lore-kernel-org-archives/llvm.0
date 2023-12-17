Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356BF30129;
	Sun, 17 Dec 2023 22:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JR6T49FP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702851324; x=1734387324;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YxNSn00ipgU6pegZGjqPdtCsrvhfReFRfEBmXXS50nY=;
  b=JR6T49FPBEGRB5LIiTVn4YiEi2ltckuh0K9DUekSuP66kdvuNDbA0ZWI
   7mzEsEiZTdfGBUawwiDvw37erdqE6+v00gAUEip+ssDFiluYfTP46fItg
   7U9eau32yatk3+lJIoJQWRUlb+GJezOi+lOrgf1EnnBRDuqJH+oMQDrrA
   46aa7NWoPTD/otWCXwHwK/OKTYsjVcNq2TK/+V0TWVS/3/p8sRy/Jgwsc
   fYk1rfxrpeVXwaar4XI/2p9njvp8iBS8LkjWXHkdlm2/lP891ZQxTq0nq
   dPBnWS0RxApYeO7/PbywvpVfN4Y4ba+it70uqgSxls7PL7ubIgoMnEZ0F
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="16989763"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="16989763"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2023 14:15:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="841274077"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="841274077"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 17 Dec 2023 14:15:22 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEzPs-0003TC-0J;
	Sun, 17 Dec 2023 22:15:20 +0000
Date: Mon, 18 Dec 2023 06:14:34 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kmo@daterainc.com>
Subject: [bcachefs:header_cleanup 47/50]
 arch/mips/include/asm/spinlock.h:24:2: error: call to undeclared function
 'mmiowb'; ISO C99 and later do not support implicit function declarations
Message-ID: <202312180628.rX4TbmNf-lkp@intel.com>
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
commit: 5d70b2be493cb95b706948b380d142fe9e628e59 [47/50] thread_info, uaccess.h: Move HARDENED_USERCOPY to better location
config: mips-mtx1_defconfig (https://download.01.org/0day-ci/archive/20231218/202312180628.rX4TbmNf-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231218/202312180628.rX4TbmNf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312180628.rX4TbmNf-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/mips/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:15:
   In file included from include/linux/socket.h:8:
   In file included from include/linux/uio.h:9:
   In file included from include/linux/uaccess.h:9:
   In file included from include/linux/sched.h:2145:
   In file included from arch/mips/include/asm/spinlock.h:14:
   include/asm-generic/qspinlock_types.h:44:3: error: typedef redefinition with different types ('struct qspinlock' vs 'struct arch_spinlock_t')
   } arch_spinlock_t;
     ^
   include/linux/spinlock_types_up.h:25:20: note: previous definition is here
   typedef struct { } arch_spinlock_t;
                      ^
   In file included from arch/mips/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:15:
   In file included from include/linux/socket.h:8:
   In file included from include/linux/uio.h:9:
   In file included from include/linux/uaccess.h:9:
   In file included from include/linux/sched.h:2145:
   In file included from arch/mips/include/asm/spinlock.h:14:
   include/asm-generic/qspinlock_types.h:49:9: warning: '__ARCH_SPIN_LOCK_UNLOCKED' macro redefined [-Wmacro-redefined]
   #define __ARCH_SPIN_LOCK_UNLOCKED       { { .val = ATOMIC_INIT(0) } }
           ^
   include/linux/spinlock_types_up.h:27:9: note: previous definition is here
   #define __ARCH_SPIN_LOCK_UNLOCKED { }
           ^
   In file included from arch/mips/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:15:
   In file included from include/linux/socket.h:8:
   In file included from include/linux/uio.h:9:
   In file included from include/linux/uaccess.h:9:
   In file included from include/linux/sched.h:2145:
>> arch/mips/include/asm/spinlock.h:24:2: error: call to undeclared function 'mmiowb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           mmiowb();
           ^
   In file included from arch/mips/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:15:
   In file included from include/linux/socket.h:8:
   In file included from include/linux/uio.h:9:
   In file included from include/linux/uaccess.h:9:
   In file included from include/linux/sched.h:2145:
   In file included from arch/mips/include/asm/spinlock.h:29:
   In file included from ./arch/mips/include/generated/asm/qrwlock.h:1:
   In file included from include/asm-generic/qrwlock.h:20:
   include/asm-generic/qrwlock_types.h:27:3: error: typedef redefinition with different types ('struct qrwlock' vs 'struct arch_rwlock_t')
   } arch_rwlock_t;
     ^
   include/linux/spinlock_types_up.h:33:3: note: previous definition is here
   } arch_rwlock_t;
     ^
   In file included from arch/mips/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:15:
   In file included from include/linux/socket.h:8:
   In file included from include/linux/uio.h:9:
   In file included from include/linux/uaccess.h:9:
   In file included from include/linux/sched.h:2145:
   In file included from arch/mips/include/asm/spinlock.h:29:
   In file included from ./arch/mips/include/generated/asm/qrwlock.h:1:
   In file included from include/asm-generic/qrwlock.h:20:
   include/asm-generic/qrwlock_types.h:29:9: warning: '__ARCH_RW_LOCK_UNLOCKED' macro redefined [-Wmacro-redefined]
   #define __ARCH_RW_LOCK_UNLOCKED {               \
           ^
   include/linux/spinlock_types_up.h:35:9: note: previous definition is here
   #define __ARCH_RW_LOCK_UNLOCKED { }
           ^
   In file included from arch/mips/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:15:
   In file included from include/linux/socket.h:8:
   In file included from include/linux/uio.h:9:
   In file included from include/linux/uaccess.h:9:
   In file included from include/linux/sched.h:2145:
   In file included from arch/mips/include/asm/spinlock.h:29:
   In file included from ./arch/mips/include/generated/asm/qrwlock.h:1:
   include/asm-generic/qrwlock.h:132:29: error: incompatible pointer types passing 'arch_spinlock_t *' to parameter of type 'struct qspinlock *' [-Werror,-Wincompatible-pointer-types]
           return arch_spin_is_locked(&lock->wait_lock);
                                      ^~~~~~~~~~~~~~~~
   include/asm-generic/qspinlock.h:143:55: note: expanded from macro 'arch_spin_is_locked'
   #define arch_spin_is_locked(l)          queued_spin_is_locked(l)
                                                                 ^
   include/asm-generic/qspinlock.h:51:68: note: passing argument to parameter 'lock' here
   static __always_inline int queued_spin_is_locked(struct qspinlock *lock)
                                                                      ^
   In file included from arch/mips/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:15:
   In file included from include/linux/socket.h:8:
   In file included from include/linux/uio.h:10:
   In file included from include/linux/mm_types.h:8:
   In file included from include/linux/kref.h:16:
   In file included from include/linux/spinlock.h:97:
   include/linux/spinlock_up.h:62:9: warning: 'arch_spin_is_locked' macro redefined [-Wmacro-redefined]
   #define arch_spin_is_locked(lock)       ((void)(lock), 0)
           ^
   include/asm-generic/qspinlock.h:143:9: note: previous definition is here
   #define arch_spin_is_locked(l)          queued_spin_is_locked(l)
           ^
   In file included from arch/mips/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:15:
   In file included from include/linux/socket.h:8:
   In file included from include/linux/uio.h:10:
   In file included from include/linux/mm_types.h:8:
   In file included from include/linux/kref.h:16:
   In file included from include/linux/spinlock.h:97:
   include/linux/spinlock_up.h:64:10: warning: 'arch_spin_lock' macro redefined [-Wmacro-redefined]
   # define arch_spin_lock(lock)           do { barrier(); (void)(lock); } while (0)
            ^
   include/asm-generic/qspinlock.h:146:9: note: previous definition is here
   #define arch_spin_lock(l)               queued_spin_lock(l)
           ^
   In file included from arch/mips/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:15:
   In file included from include/linux/socket.h:8:
   In file included from include/linux/uio.h:10:
   In file included from include/linux/mm_types.h:8:
   In file included from include/linux/kref.h:16:
   In file included from include/linux/spinlock.h:97:
   include/linux/spinlock_up.h:65:10: warning: 'arch_spin_unlock' macro redefined [-Wmacro-redefined]
   # define arch_spin_unlock(lock) do { barrier(); (void)(lock); } while (0)
            ^
   include/asm-generic/qspinlock.h:148:9: note: previous definition is here
   #define arch_spin_unlock(l)             queued_spin_unlock(l)
           ^
   In file included from arch/mips/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:15:
   In file included from include/linux/socket.h:8:
   In file included from include/linux/uio.h:10:
   In file included from include/linux/mm_types.h:8:
   In file included from include/linux/kref.h:16:
   In file included from include/linux/spinlock.h:97:
   include/linux/spinlock_up.h:66:10: warning: 'arch_spin_trylock' macro redefined [-Wmacro-redefined]
   # define arch_spin_trylock(lock)        ({ barrier(); (void)(lock); 1; })
            ^
   include/asm-generic/qspinlock.h:147:9: note: previous definition is here
   #define arch_spin_trylock(l)            queued_spin_trylock(l)


vim +/mmiowb +24 arch/mips/include/asm/spinlock.h

346e91ee090b07 Will Deacon 2019-02-22  15  
346e91ee090b07 Will Deacon 2019-02-22  16  #define	queued_spin_unlock queued_spin_unlock
346e91ee090b07 Will Deacon 2019-02-22  17  /**
346e91ee090b07 Will Deacon 2019-02-22  18   * queued_spin_unlock - release a queued spinlock
346e91ee090b07 Will Deacon 2019-02-22  19   * @lock : Pointer to queued spinlock structure
346e91ee090b07 Will Deacon 2019-02-22  20   */
346e91ee090b07 Will Deacon 2019-02-22  21  static inline void queued_spin_unlock(struct qspinlock *lock)
346e91ee090b07 Will Deacon 2019-02-22  22  {
346e91ee090b07 Will Deacon 2019-02-22  23  	/* This could be optimised with ARCH_HAS_MMIOWB */
346e91ee090b07 Will Deacon 2019-02-22 @24  	mmiowb();
346e91ee090b07 Will Deacon 2019-02-22  25  	smp_store_release(&lock->locked, 0);
346e91ee090b07 Will Deacon 2019-02-22  26  }
346e91ee090b07 Will Deacon 2019-02-22  27  

:::::: The code at line 24 was first introduced by commit
:::::: 346e91ee090b07da8d15e36bc3169ddea6968713 mips/mmiowb: Add unconditional mmiowb() to arch_spin_unlock()

:::::: TO: Will Deacon <will.deacon@arm.com>
:::::: CC: Will Deacon <will.deacon@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
