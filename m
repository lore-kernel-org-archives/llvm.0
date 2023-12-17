Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A87495C6;
	Sun, 17 Dec 2023 21:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NuHWDSy5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702850091; x=1734386091;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hssu0Y7/YLj2c9t72LNFJ3UuInss5c28opc1TYufYBs=;
  b=NuHWDSy5AlhqJu2p+6abwFwenJi8X+AILlOfUok0EELft78iXcSsRvGp
   qqXrgdP4SVibV4k0BT18Yv2k0GUXDVPIO2pFwVYZtPKO3dNg7w4UDqGBp
   t5XBpu2RUof6e+vR3m3XN+8yOl36YxLne0XTi6Hyfpr8vgoMrqHcBJiqP
   S+7zEuCc1u5prSxswUFRkFWBqYO0cWKQ2yYUU2Pnbw/Hk+2EKMYiamqPY
   lRFyfxWZVs00omfIt9ZVuuAx1kZaD4xuM0PyDLw4GT1zYrzGVTQinEkTf
   QVqNWZGPWad59BT6hv4vqGm46WFMrHURGZJAbRI/TPaUZrAvsrNBEiUBq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="392603612"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="392603612"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2023 13:54:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="809604903"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="809604903"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 17 Dec 2023 13:54:48 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEz5y-0003Rq-2P;
	Sun, 17 Dec 2023 21:54:46 +0000
Date: Mon, 18 Dec 2023 05:53:58 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kmo@daterainc.com>
Subject: [bcachefs:header_cleanup 50/50] include/linux/sched.h:1775:7: error:
 implicit declaration of function 'cpumask_test_cpu' is invalid in C99
Message-ID: <202312180536.V2R0cTQw-lkp@intel.com>
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
commit: 7288b19e061b7aa3f46f685e9944af128f10ffd5 [50/50] Kill sched.h dependency on rcupdate.h
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20231218/202312180536.V2R0cTQw-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231218/202312180536.V2R0cTQw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312180536.V2R0cTQw-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/um/user-offsets.c:17:6: warning: no previous prototype for function 'foo' [-Wmissing-prototypes]
   void foo(void)
        ^
   arch/x86/um/user-offsets.c:17:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void foo(void)
   ^
   static 
   1 warning generated.
   In file included from arch/um/kernel/asm-offsets.c:1:
   In file included from arch/x86/um/shared/sysdep/kernel-offsets.h:3:
   include/linux/sched.h:554:3: error: redefinition of '____cacheline_aligned' with a different type: 'struct sched_statistics' vs 'struct sched_avg'
   } ____cacheline_aligned;
     ^
   include/linux/sched.h:512:3: note: previous definition is here
   } ____cacheline_aligned;
     ^
   include/linux/sched.h:841:8: error: unknown type name 'cpumask_t'
           const cpumask_t                 *cpus_ptr;
                 ^
   include/linux/sched.h:842:2: error: unknown type name 'cpumask_t'
           cpumask_t                       *user_cpus_ptr;
           ^
   include/linux/sched.h:843:2: error: unknown type name 'cpumask_t'
           cpumask_t                       cpus_mask;
           ^
   include/linux/sched.h:1559:24: error: field has incomplete type 'struct thread_struct'
           struct thread_struct            thread;
                                           ^
   include/linux/sched.h:1559:9: note: forward declaration of 'struct thread_struct'
           struct thread_struct            thread;
                  ^
   include/linux/sched.h:1747:51: warning: declaration of 'struct cpumask' will not be visible outside of this function [-Wvisibility]
   extern int cpuset_cpumask_can_shrink(const struct cpumask *cur, const struct cpumask *trial);
                                                     ^
   include/linux/sched.h:1770:76: warning: declaration of 'struct cpumask' will not be visible outside of this function [-Wvisibility]
   static inline void do_set_cpus_allowed(struct task_struct *p, const struct cpumask *new_mask)
                                                                              ^
   include/linux/sched.h:1773:76: warning: declaration of 'struct cpumask' will not be visible outside of this function [-Wvisibility]
   static inline int set_cpus_allowed_ptr(struct task_struct *p, const struct cpumask *new_mask)
                                                                              ^
>> include/linux/sched.h:1775:7: error: implicit declaration of function 'cpumask_test_cpu' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           if (!cpumask_test_cpu(0, new_mask))
                ^
   include/linux/sched.h:1790:78: warning: declaration of 'struct cpumask' will not be visible outside of this function [-Wvisibility]
   static inline int dl_task_check_affinity(struct task_struct *p, const struct cpumask *mask)
                                                                                ^
   In file included from arch/um/kernel/asm-offsets.c:1:
   In file included from arch/x86/um/shared/sysdep/kernel-offsets.h:3:
   In file included from include/linux/sched.h:2138:
   In file included from arch/x86/include/asm/spinlock.h:27:
   In file included from arch/x86/include/asm/qspinlock.h:7:
   include/asm-generic/qspinlock_types.h:44:3: error: typedef redefinition with different types ('struct qspinlock' vs 'struct arch_spinlock_t')
   } arch_spinlock_t;
     ^
   include/linux/spinlock_types_up.h:25:20: note: previous definition is here
   typedef struct { } arch_spinlock_t;
                      ^
   In file included from arch/um/kernel/asm-offsets.c:1:
   In file included from arch/x86/um/shared/sysdep/kernel-offsets.h:3:
   In file included from include/linux/sched.h:2138:
   In file included from arch/x86/include/asm/spinlock.h:27:
   In file included from arch/x86/include/asm/qspinlock.h:7:
   include/asm-generic/qspinlock_types.h:49:9: warning: '__ARCH_SPIN_LOCK_UNLOCKED' macro redefined [-Wmacro-redefined]
   #define __ARCH_SPIN_LOCK_UNLOCKED       { { .val = ATOMIC_INIT(0) } }
           ^
   include/linux/spinlock_types_up.h:27:9: note: previous definition is here
   #define __ARCH_SPIN_LOCK_UNLOCKED { }
           ^
   In file included from arch/um/kernel/asm-offsets.c:1:
   In file included from arch/x86/um/shared/sysdep/kernel-offsets.h:3:
   In file included from include/linux/sched.h:2138:
   In file included from arch/x86/include/asm/spinlock.h:43:
   In file included from arch/x86/include/asm/qrwlock.h:5:
   include/asm-generic/qrwlock_types.h:27:3: error: typedef redefinition with different types ('struct qrwlock' vs 'struct arch_rwlock_t')
   } arch_rwlock_t;
     ^
   include/linux/spinlock_types_up.h:33:3: note: previous definition is here
   } arch_rwlock_t;
     ^
   In file included from arch/um/kernel/asm-offsets.c:1:
   In file included from arch/x86/um/shared/sysdep/kernel-offsets.h:3:
   In file included from include/linux/sched.h:2138:
   In file included from arch/x86/include/asm/spinlock.h:43:
   In file included from arch/x86/include/asm/qrwlock.h:5:
   include/asm-generic/qrwlock_types.h:29:9: warning: '__ARCH_RW_LOCK_UNLOCKED' macro redefined [-Wmacro-redefined]
   #define __ARCH_RW_LOCK_UNLOCKED {               \
           ^
   include/linux/spinlock_types_up.h:35:9: note: previous definition is here
   #define __ARCH_RW_LOCK_UNLOCKED { }
           ^
   In file included from arch/um/kernel/asm-offsets.c:1:
   In file included from arch/x86/um/shared/sysdep/kernel-offsets.h:3:
   In file included from include/linux/sched.h:2138:
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
   In file included from arch/um/kernel/asm-offsets.c:1:
   In file included from arch/x86/um/shared/sysdep/kernel-offsets.h:3:
   include/linux/sched.h:2155:55: warning: declaration of 'struct cpumask' will not be visible outside of this function [-Wvisibility]
   extern long sched_setaffinity(pid_t pid, const struct cpumask *new_mask);
                                                         ^
   include/linux/sched.h:2156:49: warning: declaration of 'struct cpumask' will not be visible outside of this function [-Wvisibility]
   extern long sched_getaffinity(pid_t pid, struct cpumask *mask);
                                                   ^
   In file included from arch/um/kernel/asm-offsets.c:1:
   In file included from arch/x86/um/shared/sysdep/kernel-offsets.h:5:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:63:
   In file included from include/linux/lockdep.h:14:
   In file included from include/linux/smp.h:13:
   include/linux/cpumask.h:500:29: error: static declaration of 'cpumask_test_cpu' follows non-static declaration
   static __always_inline bool cpumask_test_cpu(int cpu, const struct cpumask *cpumask)
                               ^
   include/linux/sched.h:1775:7: note: previous implicit declaration is here
           if (!cpumask_test_cpu(0, new_mask))
                ^
   In file included from arch/um/kernel/asm-offsets.c:1:
   In file included from arch/x86/um/shared/sysdep/kernel-offsets.h:5:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:97:
   include/linux/spinlock_up.h:62:9: warning: 'arch_spin_is_locked' macro redefined [-Wmacro-redefined]
   #define arch_spin_is_locked(lock)       ((void)(lock), 0)
           ^
   include/asm-generic/qspinlock.h:143:9: note: previous definition is here
   #define arch_spin_is_locked(l)          queued_spin_is_locked(l)
           ^
   In file included from arch/um/kernel/asm-offsets.c:1:
   In file included from arch/x86/um/shared/sysdep/kernel-offsets.h:5:
   In file included from include/linux/crypto.h:15:


vim +/cpumask_test_cpu +1775 include/linux/sched.h

907aed48f65efe Mel Gorman       2012-07-31  1746  
5eca1c10cbaa9c Ingo Molnar      2017-02-06 @1747  extern int cpuset_cpumask_can_shrink(const struct cpumask *cur, const struct cpumask *trial);
2ef269ef1ac006 Dietmar Eggemann 2023-05-08  1748  extern int task_can_attach(struct task_struct *p);
85989106feb734 Dietmar Eggemann 2023-05-08  1749  extern int dl_bw_alloc(int cpu, u64 dl_bw);
85989106feb734 Dietmar Eggemann 2023-05-08  1750  extern void dl_bw_free(int cpu, u64 dl_bw);
^1da177e4c3f41 Linus Torvalds   2005-04-16  1751  #ifdef CONFIG_SMP
ae89408341f59e Costa Shulyupin  2023-08-29  1752  
ae89408341f59e Costa Shulyupin  2023-08-29  1753  /* do_set_cpus_allowed() - consider using set_cpus_allowed_ptr() instead */
5eca1c10cbaa9c Ingo Molnar      2017-02-06  1754  extern void do_set_cpus_allowed(struct task_struct *p, const struct cpumask *new_mask);
ae89408341f59e Costa Shulyupin  2023-08-29  1755  
ae89408341f59e Costa Shulyupin  2023-08-29  1756  /**
ae89408341f59e Costa Shulyupin  2023-08-29  1757   * set_cpus_allowed_ptr - set CPU affinity mask of a task
ae89408341f59e Costa Shulyupin  2023-08-29  1758   * @p: the task
ae89408341f59e Costa Shulyupin  2023-08-29  1759   * @new_mask: CPU affinity mask
ae89408341f59e Costa Shulyupin  2023-08-29  1760   *
ae89408341f59e Costa Shulyupin  2023-08-29  1761   * Return: zero if successful, or a negative error code
ae89408341f59e Costa Shulyupin  2023-08-29  1762   */
5eca1c10cbaa9c Ingo Molnar      2017-02-06  1763  extern int set_cpus_allowed_ptr(struct task_struct *p, const struct cpumask *new_mask);
b90ca8badbd114 Will Deacon      2021-07-30  1764  extern int dup_user_cpus_ptr(struct task_struct *dst, struct task_struct *src, int node);
b90ca8badbd114 Will Deacon      2021-07-30  1765  extern void release_user_cpus_ptr(struct task_struct *p);
234b8ab6476c5e Will Deacon      2021-07-30  1766  extern int dl_task_check_affinity(struct task_struct *p, const struct cpumask *mask);
07ec77a1d4e825 Will Deacon      2021-07-30  1767  extern void force_compatible_cpus_allowed_ptr(struct task_struct *p);
07ec77a1d4e825 Will Deacon      2021-07-30  1768  extern void relax_compatible_cpus_allowed_ptr(struct task_struct *p);
^1da177e4c3f41 Linus Torvalds   2005-04-16  1769  #else
5eca1c10cbaa9c Ingo Molnar      2017-02-06  1770  static inline void do_set_cpus_allowed(struct task_struct *p, const struct cpumask *new_mask)
1e1b6c511d1b23 KOSAKI Motohiro  2011-05-19  1771  {
1e1b6c511d1b23 KOSAKI Motohiro  2011-05-19  1772  }
5eca1c10cbaa9c Ingo Molnar      2017-02-06  1773  static inline int set_cpus_allowed_ptr(struct task_struct *p, const struct cpumask *new_mask)
^1da177e4c3f41 Linus Torvalds   2005-04-16  1774  {
96f874e26428ab Rusty Russell    2008-11-25 @1775  	if (!cpumask_test_cpu(0, new_mask))
^1da177e4c3f41 Linus Torvalds   2005-04-16  1776  		return -EINVAL;
^1da177e4c3f41 Linus Torvalds   2005-04-16  1777  	return 0;
^1da177e4c3f41 Linus Torvalds   2005-04-16  1778  }
b90ca8badbd114 Will Deacon      2021-07-30  1779  static inline int dup_user_cpus_ptr(struct task_struct *dst, struct task_struct *src, int node)
b90ca8badbd114 Will Deacon      2021-07-30  1780  {
b90ca8badbd114 Will Deacon      2021-07-30  1781  	if (src->user_cpus_ptr)
b90ca8badbd114 Will Deacon      2021-07-30  1782  		return -EINVAL;
b90ca8badbd114 Will Deacon      2021-07-30  1783  	return 0;
b90ca8badbd114 Will Deacon      2021-07-30  1784  }
b90ca8badbd114 Will Deacon      2021-07-30  1785  static inline void release_user_cpus_ptr(struct task_struct *p)
b90ca8badbd114 Will Deacon      2021-07-30  1786  {
b90ca8badbd114 Will Deacon      2021-07-30  1787  	WARN_ON(p->user_cpus_ptr);
b90ca8badbd114 Will Deacon      2021-07-30  1788  }
234b8ab6476c5e Will Deacon      2021-07-30  1789  

:::::: The code at line 1775 was first introduced by commit
:::::: 96f874e26428ab5d2db681c100210c254775e154 sched: convert remaining old-style cpumask operators

:::::: TO: Rusty Russell <rusty@rustcorp.com.au>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
