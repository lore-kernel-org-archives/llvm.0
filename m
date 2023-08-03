Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95514182C8;
	Thu,  3 Aug 2023 16:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691078802; x=1722614802;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DG9Y45RNneVu4QHF9W0OWIKbu/3N01mIMdkmk/Wb1XI=;
  b=FnjajfwS2d6sv4mhbamUzQMTTtyI4wIh9HNga8nhGWJIhCvJ8EMccou3
   YIAF9pHoLsi1zx50oDjfhivj/ZdbtV+xiG/uzbK2/3o01zFRnLqawXjGg
   BozEMEe6bG0/fvin7LTVQxR/HxFwKv0inlQtpcLR5WUojeTiUJhHct629
   7QxjKuFJv2ooVy0+5fCCJwMizK4fst+Axif4W7s3yEaNlBye7fPRg1h6v
   /D+QsnDgjvm3ion6avW/PPitbxR2t0jGLCcwEnHPf1hb5WaOPLpSXVjyC
   wpqoAxayyODFV9lVO2ouUHl4EMPb+3310Uvjz9klXBwS5iYcWVQOZpOGo
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="349512538"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="scan'208";a="349512538"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 09:03:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="723255385"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="scan'208";a="723255385"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 03 Aug 2023 09:03:42 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRand-0002DJ-2i;
	Thu, 03 Aug 2023 16:03:41 +0000
Date: Fri, 4 Aug 2023 00:03:28 +0800
From: kernel test robot <lkp@intel.com>
To: Guo Ren <guoren@linux.alibaba.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [csky-linux:sg2042-master-qspinlock-64ilp32_v4 28/70]
 drivers/gpu/drm/drm_lock.c:75:10: error: passing 'typeof ((__ai_ptr))' (aka
 'volatile unsigned int *') to parameter of type 'void *' discards qualifiers
Message-ID: <202308032302.dN849WQv-lkp@intel.com>
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
commit: 1ff8b01f77a24e9bf21d6189f8913393494a2bd8 [28/70] RISC-V: paravirt: pvqspinlock: Add xchg8 & cmpxchg_small support
config: riscv-randconfig-r042-20230731 (https://download.01.org/0day-ci/archive/20230803/202308032302.dN849WQv-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230803/202308032302.dN849WQv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308032302.dN849WQv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/drm_lock.c:75:10: error: passing 'typeof ((__ai_ptr))' (aka 'volatile unsigned int *') to parameter of type 'void *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
      75 |                 prev = cmpxchg(lock, old, new);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4746:2: note: expanded from macro 'cmpxchg'
    4746 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: expanded from macro 'raw_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^
   arch/riscv/include/asm/cmpxchg.h:452:23: note: expanded from macro 'arch_cmpxchg'
     452 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     453 |                                        _o_, _n_, sizeof(*(ptr)));       \
         |                                        ~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/cmpxchg.h:415:20: note: expanded from macro '__cmpxchg'
     415 |                         __cmpxchg_small(__ptr, (ulong)__old,            \
         |                                         ^~~~~
   arch/riscv/include/asm/cmpxchg.h:360:43: note: passing argument to parameter 'ptr' here
     360 | static inline ulong __cmpxchg_small(void *ptr, ulong old,
         |                                           ^
   drivers/gpu/drm/drm_lock.c:118:10: error: passing 'typeof ((__ai_ptr))' (aka 'volatile unsigned int *') to parameter of type 'void *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     118 |                 prev = cmpxchg(lock, old, new);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4746:2: note: expanded from macro 'cmpxchg'
    4746 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: expanded from macro 'raw_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^
   arch/riscv/include/asm/cmpxchg.h:452:23: note: expanded from macro 'arch_cmpxchg'
     452 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     453 |                                        _o_, _n_, sizeof(*(ptr)));       \
         |                                        ~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/cmpxchg.h:415:20: note: expanded from macro '__cmpxchg'
     415 |                         __cmpxchg_small(__ptr, (ulong)__old,            \
         |                                         ^~~~~
   arch/riscv/include/asm/cmpxchg.h:360:43: note: passing argument to parameter 'ptr' here
     360 | static inline ulong __cmpxchg_small(void *ptr, ulong old,
         |                                           ^
   drivers/gpu/drm/drm_lock.c:141:10: error: passing 'typeof ((__ai_ptr))' (aka 'volatile unsigned int *') to parameter of type 'void *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     141 |                 prev = cmpxchg(lock, old, new);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4746:2: note: expanded from macro 'cmpxchg'
    4746 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: expanded from macro 'raw_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^
   arch/riscv/include/asm/cmpxchg.h:452:23: note: expanded from macro 'arch_cmpxchg'
     452 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     453 |                                        _o_, _n_, sizeof(*(ptr)));       \
         |                                        ~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/cmpxchg.h:415:20: note: expanded from macro '__cmpxchg'
     415 |                         __cmpxchg_small(__ptr, (ulong)__old,            \
         |                                         ^~~~~
   arch/riscv/include/asm/cmpxchg.h:360:43: note: passing argument to parameter 'ptr' here
     360 | static inline ulong __cmpxchg_small(void *ptr, ulong old,
         |                                           ^
   drivers/gpu/drm/drm_lock.c:319:12: error: passing 'typeof ((__ai_ptr))' (aka 'volatile unsigned int *') to parameter of type 'void *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     319 |                                 prev = cmpxchg(lock, old, DRM_KERNEL_CONTEXT);
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4746:2: note: expanded from macro 'cmpxchg'
    4746 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: expanded from macro 'raw_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^
   arch/riscv/include/asm/cmpxchg.h:452:23: note: expanded from macro 'arch_cmpxchg'
     452 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     453 |                                        _o_, _n_, sizeof(*(ptr)));       \
         |                                        ~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/cmpxchg.h:415:20: note: expanded from macro '__cmpxchg'
     415 |                         __cmpxchg_small(__ptr, (ulong)__old,            \
         |                                         ^~~~~
   arch/riscv/include/asm/cmpxchg.h:360:43: note: passing argument to parameter 'ptr' here
     360 | static inline ulong __cmpxchg_small(void *ptr, ulong old,
         |                                           ^
   4 errors generated.


vim +75 drivers/gpu/drm/drm_lock.c

4ac5ec40ec7002 Daniel Vetter     2010-08-23  48  
bd50d4a2168370 Benjamin Gaignard 2020-03-06  49  /*
1a75a222f5ca10 Daniel Vetter     2016-06-14  50   * Take the heavyweight lock.
1a75a222f5ca10 Daniel Vetter     2016-06-14  51   *
1a75a222f5ca10 Daniel Vetter     2016-06-14  52   * \param lock lock pointer.
1a75a222f5ca10 Daniel Vetter     2016-06-14  53   * \param context locking context.
1a75a222f5ca10 Daniel Vetter     2016-06-14  54   * \return one if the lock is held, or zero otherwise.
1a75a222f5ca10 Daniel Vetter     2016-06-14  55   *
1a75a222f5ca10 Daniel Vetter     2016-06-14  56   * Attempt to mark the lock as held by the given context, via the \p cmpxchg instruction.
1a75a222f5ca10 Daniel Vetter     2016-06-14  57   */
1a75a222f5ca10 Daniel Vetter     2016-06-14  58  static
1a75a222f5ca10 Daniel Vetter     2016-06-14  59  int drm_lock_take(struct drm_lock_data *lock_data,
1a75a222f5ca10 Daniel Vetter     2016-06-14  60  		  unsigned int context)
1a75a222f5ca10 Daniel Vetter     2016-06-14  61  {
1a75a222f5ca10 Daniel Vetter     2016-06-14  62  	unsigned int old, new, prev;
1a75a222f5ca10 Daniel Vetter     2016-06-14  63  	volatile unsigned int *lock = &lock_data->hw_lock->lock;
1a75a222f5ca10 Daniel Vetter     2016-06-14  64  
1a75a222f5ca10 Daniel Vetter     2016-06-14  65  	spin_lock_bh(&lock_data->spinlock);
1a75a222f5ca10 Daniel Vetter     2016-06-14  66  	do {
1a75a222f5ca10 Daniel Vetter     2016-06-14  67  		old = *lock;
1a75a222f5ca10 Daniel Vetter     2016-06-14  68  		if (old & _DRM_LOCK_HELD)
1a75a222f5ca10 Daniel Vetter     2016-06-14  69  			new = old | _DRM_LOCK_CONT;
1a75a222f5ca10 Daniel Vetter     2016-06-14  70  		else {
1a75a222f5ca10 Daniel Vetter     2016-06-14  71  			new = context | _DRM_LOCK_HELD |
1a75a222f5ca10 Daniel Vetter     2016-06-14  72  				((lock_data->user_waiters + lock_data->kernel_waiters > 1) ?
1a75a222f5ca10 Daniel Vetter     2016-06-14  73  				 _DRM_LOCK_CONT : 0);
1a75a222f5ca10 Daniel Vetter     2016-06-14  74  		}
1a75a222f5ca10 Daniel Vetter     2016-06-14 @75  		prev = cmpxchg(lock, old, new);
1a75a222f5ca10 Daniel Vetter     2016-06-14  76  	} while (prev != old);
1a75a222f5ca10 Daniel Vetter     2016-06-14  77  	spin_unlock_bh(&lock_data->spinlock);
1a75a222f5ca10 Daniel Vetter     2016-06-14  78  
1a75a222f5ca10 Daniel Vetter     2016-06-14  79  	if (_DRM_LOCKING_CONTEXT(old) == context) {
1a75a222f5ca10 Daniel Vetter     2016-06-14  80  		if (old & _DRM_LOCK_HELD) {
1a75a222f5ca10 Daniel Vetter     2016-06-14  81  			if (context != DRM_KERNEL_CONTEXT) {
1a75a222f5ca10 Daniel Vetter     2016-06-14  82  				DRM_ERROR("%d holds heavyweight lock\n",
1a75a222f5ca10 Daniel Vetter     2016-06-14  83  					  context);
1a75a222f5ca10 Daniel Vetter     2016-06-14  84  			}
1a75a222f5ca10 Daniel Vetter     2016-06-14  85  			return 0;
1a75a222f5ca10 Daniel Vetter     2016-06-14  86  		}
1a75a222f5ca10 Daniel Vetter     2016-06-14  87  	}
1a75a222f5ca10 Daniel Vetter     2016-06-14  88  
1a75a222f5ca10 Daniel Vetter     2016-06-14  89  	if ((_DRM_LOCKING_CONTEXT(new)) == context && (new & _DRM_LOCK_HELD)) {
1a75a222f5ca10 Daniel Vetter     2016-06-14  90  		/* Have lock */
1a75a222f5ca10 Daniel Vetter     2016-06-14  91  		return 1;
1a75a222f5ca10 Daniel Vetter     2016-06-14  92  	}
1a75a222f5ca10 Daniel Vetter     2016-06-14  93  	return 0;
1a75a222f5ca10 Daniel Vetter     2016-06-14  94  }
1a75a222f5ca10 Daniel Vetter     2016-06-14  95  

:::::: The code at line 75 was first introduced by commit
:::::: 1a75a222f5ca1063249b5c92972d32dcc3c8966e drm: Hide hw.lock cleanup in filp->release better

:::::: TO: Daniel Vetter <daniel.vetter@ffwll.ch>
:::::: CC: Daniel Vetter <daniel.vetter@ffwll.ch>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
