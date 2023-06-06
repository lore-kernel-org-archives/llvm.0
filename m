Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4760237B8F;
	Tue,  6 Jun 2023 13:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686057698; x=1717593698;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JzaKWKBaMvCpfS4tpOcT6H+Cg33RruoKY0+hHBCurZg=;
  b=FZvEkRpmOh2xL+FXN5pkyTLR3oxsEqR/3dro3gNwl30xRZLO/u1BauQf
   Kio7J0jQ3KHFrifAAElrL+n1gczN34kuT2sQjxixt7GvqZzsxGo+9Ip5A
   BaAlilMmbu/j0KADc6s9CAk2HveB3lz7Ea9zJ2s1OnrXy0rRmsZZNAhiY
   6ZbODHj9O8WiXljaWhrvN4R7Acw2mjdKDTHQmzxVdg5XgQCNzP2oQ8+Ed
   NCoLM7+d8zTlgDrIBeygyZA2YnxEPMSOKlZVKlGbr3Vm86Hj9OPw/FmWz
   IakLAERuNeuep2vDfHNqlZzEHYFrrcMI9C56MP6IezVziF3haGiKMAdMG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="420213543"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; 
   d="scan'208";a="420213543"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2023 06:18:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="703158959"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; 
   d="scan'208";a="703158959"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 06 Jun 2023 06:18:27 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6WZu-0005HO-0x;
	Tue, 06 Jun 2023 13:18:26 +0000
Date: Tue, 6 Jun 2023 21:18:08 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:core/guards 4/7] kernel/sched/sched.h:2797:1: error:
 type specifier missing, defaults to 'int'
Message-ID: <202306062140.pWHpWA6H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git core/guards
head:   718ea1d26c96cdbfb623f89189b4eb3f0d48f889
commit: 80d892642a62e09af33f8c43ebcbf9f8918e214c [4/7] sched: Use fancy new guards
config: arm-randconfig-r035-20230606 (https://download.01.org/0day-ci/archive/20230606/202306062140.pWHpWA6H-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=80d892642a62e09af33f8c43ebcbf9f8918e214c
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue core/guards
        git checkout 80d892642a62e09af33f8c43ebcbf9f8918e214c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306062140.pWHpWA6H-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:34:
   kernel/sched/sched.h:2797:37: error: expected identifier
   DEFINE_LOCK_GUARD_2(double_rq_lock, struct rq,
                                       ^
>> kernel/sched/sched.h:2797:1: error: type specifier missing, defaults to 'int' [-Werror,-Wimplicit-int]
   DEFINE_LOCK_GUARD_2(double_rq_lock, struct rq,
   ^
>> kernel/sched/sched.h:2797:20: error: this function declaration is not a prototype [-Werror,-Wstrict-prototypes]
   DEFINE_LOCK_GUARD_2(double_rq_lock, struct rq,
                      ^
   kernel/sched/sched.h:2799:45: error: expected ';' after top level declarator
                       double_rq_unlock(_G->lock, _G->lock2))
                                                             ^
                                                             ;
   4 errors generated.
--
   In file included from kernel/sched/fair.c:55:
   kernel/sched/sched.h:2797:37: error: expected identifier
   DEFINE_LOCK_GUARD_2(double_rq_lock, struct rq,
                                       ^
>> kernel/sched/sched.h:2797:1: error: type specifier missing, defaults to 'int' [-Werror,-Wimplicit-int]
   DEFINE_LOCK_GUARD_2(double_rq_lock, struct rq,
   ^
>> kernel/sched/sched.h:2797:20: error: this function declaration is not a prototype [-Werror,-Wstrict-prototypes]
   DEFINE_LOCK_GUARD_2(double_rq_lock, struct rq,
                      ^
   kernel/sched/sched.h:2799:45: error: expected ';' after top level declarator
                       double_rq_unlock(_G->lock, _G->lock2))
                                                             ^
                                                             ;
   kernel/sched/fair.c:688:5: warning: no previous prototype for function 'sched_update_scaling' [-Wmissing-prototypes]
   int sched_update_scaling(void)
       ^
   kernel/sched/fair.c:688:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sched_update_scaling(void)
   ^
   static 
   1 warning and 4 errors generated.
--
   In file included from kernel/sched/core.c:86:
   kernel/sched/sched.h:2797:37: error: expected identifier
   DEFINE_LOCK_GUARD_2(double_rq_lock, struct rq,
                                       ^
>> kernel/sched/sched.h:2797:1: error: type specifier missing, defaults to 'int' [-Werror,-Wimplicit-int]
   DEFINE_LOCK_GUARD_2(double_rq_lock, struct rq,
   ^
>> kernel/sched/sched.h:2797:20: error: this function declaration is not a prototype [-Werror,-Wstrict-prototypes]
   DEFINE_LOCK_GUARD_2(double_rq_lock, struct rq,
                      ^
   kernel/sched/sched.h:2799:45: error: expected ';' after top level declarator
                       double_rq_unlock(_G->lock, _G->lock2))
                                                             ^
                                                             ;
   kernel/sched/core.c:8800:3: error: unknown type name 'guard_double_rq_lock_t'; did you mean 'guard_task_rq_lock_t'?
                   guard(double_rq_lock, rq, p_rq);
                   ^
   include/linux/guards.h:107:2: note: expanded from macro 'guard'
           named_guard(_guard, __UNIQUE_ID(guard), _var)
           ^
   include/linux/guards.h:104:2: note: expanded from macro 'named_guard'
           ptr_guard(_guard, _name) = guard_init(_guard, _var)
           ^
   include/linux/guards.h:83:2: note: expanded from macro 'ptr_guard'
           __ptr_guard(_guard, _name)                                      \
           ^
   include/linux/guards.h:73:2: note: expanded from macro '__ptr_guard'
           guard_##_guard##_t _name __cleanup(guard_##_guard##_cleanup)
           ^
   <scratch space>:36:1: note: expanded from here
   guard_double_rq_lock_t
   ^
   kernel/sched/sched.h:1633:1: note: 'guard_task_rq_lock_t' declared here
   DEFINE_LOCK_GUARD_1(task_rq_lock, struct task_struct,
   ^
   include/linux/guards.h:167:66: note: expanded from macro 'DEFINE_LOCK_GUARD_1'
   #define DEFINE_LOCK_GUARD_1(_guard, _type, _lock, _unlock, ...)         \
                                                                           ^
   include/linux/guards.h:143:3: note: expanded from macro '\
   __DEFINE_UNLOCK_GUARD'
   } guard_##_guard##_t;                                                   \
     ^
   <scratch space>:122:1: note: expanded from here
   guard_task_rq_lock_t
   ^
   kernel/sched/core.c:8800:3: error: use of undeclared identifier 'guard_double_rq_lock_cleanup'; did you mean 'guard_task_rq_lock_cleanup'?
                   guard(double_rq_lock, rq, p_rq);
                   ^
   include/linux/guards.h:107:2: note: expanded from macro 'guard'
           named_guard(_guard, __UNIQUE_ID(guard), _var)
           ^
   include/linux/guards.h:104:2: note: expanded from macro 'named_guard'
           ptr_guard(_guard, _name) = guard_init(_guard, _var)
           ^
   include/linux/guards.h:83:2: note: expanded from macro 'ptr_guard'
           __ptr_guard(_guard, _name)                                      \
           ^
   include/linux/guards.h:73:37: note: expanded from macro '__ptr_guard'
           guard_##_guard##_t _name __cleanup(guard_##_guard##_cleanup)
                                              ^
   <scratch space>:38:1: note: expanded from here
   guard_double_rq_lock_cleanup
   ^
   kernel/sched/sched.h:1633:1: note: 'guard_task_rq_lock_cleanup' declared here
   DEFINE_LOCK_GUARD_1(task_rq_lock, struct task_struct,
   ^
   include/linux/guards.h:167:66: note: expanded from macro 'DEFINE_LOCK_GUARD_1'
   #define DEFINE_LOCK_GUARD_1(_guard, _type, _lock, _unlock, ...)         \
                                                                           ^
   include/linux/guards.h:145:20: note: expanded from macro '\
   __DEFINE_UNLOCK_GUARD'
   static inline void guard_##_guard##_cleanup(guard_##_guard##_t *_G)     \
                      ^
   <scratch space>:2:1: note: expanded from here
   guard_task_rq_lock_cleanup
   ^
>> kernel/sched/core.c:8800:3: error: implicit declaration of function 'guard_double_rq_lock_init' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   guard(double_rq_lock, rq, p_rq);
                   ^
   include/linux/guards.h:107:2: note: expanded from macro 'guard'
           named_guard(_guard, __UNIQUE_ID(guard), _var)
           ^
   include/linux/guards.h:104:29: note: expanded from macro 'named_guard'
           ptr_guard(_guard, _name) = guard_init(_guard, _var)
                                      ^
   include/linux/guards.h:101:2: note: expanded from macro 'guard_init'
           guard_##_guard##_init(_var)
           ^
   <scratch space>:43:1: note: expanded from here
   guard_double_rq_lock_init
   ^
   kernel/sched/core.c:8800:3: note: did you mean 'guard_task_rq_lock_init'?
   include/linux/guards.h:107:2: note: expanded from macro 'guard'
           named_guard(_guard, __UNIQUE_ID(guard), _var)
           ^
   include/linux/guards.h:104:29: note: expanded from macro 'named_guard'
           ptr_guard(_guard, _name) = guard_init(_guard, _var)
                                      ^
   include/linux/guards.h:101:2: note: expanded from macro 'guard_init'
           guard_##_guard##_init(_var)
           ^
   <scratch space>:43:1: note: expanded from here
   guard_double_rq_lock_init
   ^
   kernel/sched/sched.h:1633:1: note: 'guard_task_rq_lock_init' declared here
   DEFINE_LOCK_GUARD_1(task_rq_lock, struct task_struct,
   ^
   include/linux/guards.h:168:61: note: expanded from macro 'DEFINE_LOCK_GUARD_1'
   __DEFINE_UNLOCK_GUARD(_guard, _type, _unlock, __VA_ARGS__)              \
                                                                           ^
   include/linux/guards.h:151:34: note: expanded from macro '\
   __DEFINE_LOCK_GUARD_1'
   static inline guard_##_guard##_t guard_##_guard##_init(_type *lock)     \
                                    ^
   <scratch space>:8:1: note: expanded from here
   guard_task_rq_lock_init
   ^
   kernel/sched/core.c:8800:3: error: initializing 'guard_task_rq_lock_t' with an expression of incompatible type 'int'
                   guard(double_rq_lock, rq, p_rq);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/guards.h:107:22: note: expanded from macro 'guard'
           named_guard(_guard, __UNIQUE_ID(guard), _var)
           ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler-clang.h:20:29: note: expanded from macro '__UNIQUE_ID'
   #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
                               ^
   include/linux/compiler_types.h:75:22: note: expanded from macro '__PASTE'
   #define __PASTE(a,b) ___PASTE(a,b)
                        ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/guards.h:104:20: note: expanded from macro 'named_guard'
           ptr_guard(_guard, _name) = guard_init(_guard, _var)
                             ^        ~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/guards.h:83:22: note: expanded from macro 'ptr_guard'
           __ptr_guard(_guard, _name)                                      \
                               ^
   include/linux/guards.h:73:21: note: expanded from macro '__ptr_guard'
           guard_##_guard##_t _name __cleanup(guard_##_guard##_cleanup)
                              ^
   kernel/sched/core.c:10666:35: error: redefinition of parameter 'cpus_read_lock'
   DEFINE_VOID_GUARD(cpus_read_lock, cpus_read_lock(), cpus_read_unlock())
                                     ^
   kernel/sched/core.c:10666:49: error: expected ')'
   DEFINE_VOID_GUARD(cpus_read_lock, cpus_read_lock(), cpus_read_unlock())
                                                   ^
   kernel/sched/core.c:10666:18: note: to match this '('
   DEFINE_VOID_GUARD(cpus_read_lock, cpus_read_lock(), cpus_read_unlock())
                    ^
   kernel/sched/core.c:10668:1: error: invalid storage class specifier in function declarator
   static int tg_set_cfs_bandwidth(struct task_group *tg, u64 period, u64 quota,
   ^
   kernel/sched/core.c:10668:12: error: parameter named 'tg_set_cfs_bandwidth' is missing
   static int tg_set_cfs_bandwidth(struct task_group *tg, u64 period, u64 quota,
              ^
   kernel/sched/core.c:10669:15: error: expected ';' at end of declaration
                                   u64 burst)
                                             ^
                                             ;
>> kernel/sched/core.c:10666:1: error: type specifier missing, defaults to 'int' [-Werror,-Wimplicit-int]
   DEFINE_VOID_GUARD(cpus_read_lock, cpus_read_lock(), cpus_read_unlock())
   ^
   kernel/sched/core.c:10672:33: error: use of undeclared identifier 'tg'
           struct cfs_bandwidth *cfs_b = &tg->cfs_bandwidth;
                                          ^
   kernel/sched/core.c:10674:6: error: use of undeclared identifier 'tg'
           if (tg == &root_task_group)
               ^
   kernel/sched/core.c:10682:6: error: use of undeclared identifier 'quota'
           if (quota < min_cfs_quota_period || period < min_cfs_quota_period)
               ^
   kernel/sched/core.c:10682:38: error: use of undeclared identifier 'period'
           if (quota < min_cfs_quota_period || period < min_cfs_quota_period)
                                               ^
   kernel/sched/core.c:10690:6: error: use of undeclared identifier 'period'
           if (period > max_cfs_quota_period)
               ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +/int +2797 kernel/sched/sched.h

  2796	
> 2797	DEFINE_LOCK_GUARD_2(double_rq_lock, struct rq,
  2798			    double_rq_lock(_G->lock, _G->lock2),
  2799			    double_rq_unlock(_G->lock, _G->lock2))
  2800	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
