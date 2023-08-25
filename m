Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980671FC9;
	Fri, 25 Aug 2023 08:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692953792; x=1724489792;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JCH43ctKr+8nrbOK2BXGW5bYASdd1r/s0AzuHw4giac=;
  b=akuKNB4Kts+ESeCD1VycEGCQeVp/LhiPrhXOydh+hGnMkVgLxyNbcEsw
   4RKzrbjVbbARAs5OtqZqC0g94XaHM8lqb87NPsdPFE3nFzBvwo7/k3C1s
   pO75pbNRCgCtPSdqyJY5p71gLDi8RqRoqeZTT+J0Mnc8sZPmnZEJXuv3N
   wUy677vJzykIDWz5QfKCQxU3rPDtX0oPaWRAY/XraPM7lfV8fozejM2Y1
   oExWszHeIexmOcU0TIj/GZyR1zSs5EqHRppWdhFLgF8gljDf7fdFQxpRg
   PTzwo8pZDe2ES+d6td5cLb2SGdC+xcaFRo/eNaSjSxtpVlUAN/NDpy1pE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="405669224"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="405669224"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 01:56:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="737408490"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="737408490"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 25 Aug 2023 01:56:29 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZScG-0003Mu-24;
	Fri, 25 Aug 2023 08:56:28 +0000
Date: Fri, 25 Aug 2023 16:55:39 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:dev.2023.08.22a 67/69]
 kernel/locking/qspinlock.c:691:29: error: redefinition of 'next_to_cpu_idx'
Message-ID: <202308251616.7HOmYRfg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2023.08.22a
head:   354957ec11dc80eac68c4b1e10c237d69adc1833
commit: 62532cfc5f2be5376f0eac431783c226c35e104f [67/69] EXP qspinlock: Dump full qnode structure
config: i386-buildonly-randconfig-001-20230825 (https://download.01.org/0day-ci/archive/20230825/202308251616.7HOmYRfg-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308251616.7HOmYRfg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308251616.7HOmYRfg-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/locking/qspinlock.c:730:102: warning: format specifies type 'unsigned long' but the argument has type 'unsigned int' [-Wformat]
                   __func__, _Q_TAIL_CPU_OFFSET, _Q_TAIL_IDX_MASK, _Q_TAIL_IDX_OFFSET, _Q_LOCKED_VAL, _Q_TAIL_OFFSET, sizeof(qval.tail));
                                                                                                                      ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:478:35: note: expanded from macro 'pr_alert'
           printk(KERN_ALERT pr_fmt(fmt), ##__VA_ARGS__)
                                    ~~~     ^~~~~~~~~~~
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   In file included from kernel/locking/qspinlock.c:779:
   kernel/locking/qspinlock_paravirt.h:298:7: warning: variable 'wait_early' set but not used [-Wunused-but-set-variable]
           bool wait_early;
                ^
   kernel/locking/qspinlock_paravirt.h:407:6: warning: variable 'waitcnt' set but not used [-Wunused-but-set-variable]
           int waitcnt = 0;
               ^
   kernel/locking/qspinlock_paravirt.h:493:1: warning: no previous prototype for function '__pv_queued_spin_unlock_slowpath' [-Wmissing-prototypes]
   __pv_queued_spin_unlock_slowpath(struct qspinlock *lock, u8 locked)
   ^
   kernel/locking/qspinlock_paravirt.h:492:22: note: declare 'static' if the function is not intended to be used outside of this translation unit
   __visible __lockfunc void
                        ^
                        static 
   In file included from kernel/locking/qspinlock.c:780:
   kernel/locking/qspinlock.c:660:19: error: redefinition of 'tail_to_cpu'
   static __pure int tail_to_cpu(u32 tail)
                     ^
   kernel/locking/qspinlock.c:660:19: note: previous definition is here
   static __pure int tail_to_cpu(u32 tail)
                     ^
   In file included from kernel/locking/qspinlock.c:780:
   kernel/locking/qspinlock.c:665:19: error: redefinition of 'tail_to_idx'
   static __pure int tail_to_idx(u32 tail)
                     ^
   kernel/locking/qspinlock.c:665:19: note: previous definition is here
   static __pure int tail_to_idx(u32 tail)
                     ^
   In file included from kernel/locking/qspinlock.c:780:
   kernel/locking/qspinlock.c:670:29: error: redefinition of 'next_to_prev'
   static struct mcs_spinlock *next_to_prev(struct mcs_spinlock *msp, int *cpup, int *idxp)
                               ^
   kernel/locking/qspinlock.c:670:29: note: previous definition is here
   static struct mcs_spinlock *next_to_prev(struct mcs_spinlock *msp, int *cpup, int *idxp)
                               ^
   In file included from kernel/locking/qspinlock.c:780:
>> kernel/locking/qspinlock.c:691:29: error: redefinition of 'next_to_cpu_idx'
   static struct mcs_spinlock *next_to_cpu_idx(struct mcs_spinlock *msp, int *cpup, int *idxp)
                               ^
   kernel/locking/qspinlock.c:691:29: note: previous definition is here
   static struct mcs_spinlock *next_to_cpu_idx(struct mcs_spinlock *msp, int *cpup, int *idxp)
                               ^
   In file included from kernel/locking/qspinlock.c:780:
   kernel/locking/qspinlock.c:712:6: error: redefinition of 'spinlock_dump'
   void spinlock_dump(spinlock_t *sp, bool full)
        ^
   kernel/locking/qspinlock.c:712:6: note: previous definition is here
   void spinlock_dump(spinlock_t *sp, bool full)
        ^
   In file included from kernel/locking/qspinlock.c:780:
   kernel/locking/qspinlock.c:730:102: warning: format specifies type 'unsigned long' but the argument has type 'unsigned int' [-Wformat]
                   __func__, _Q_TAIL_CPU_OFFSET, _Q_TAIL_IDX_MASK, _Q_TAIL_IDX_OFFSET, _Q_LOCKED_VAL, _Q_TAIL_OFFSET, sizeof(qval.tail));
                                                                                                                      ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:478:35: note: expanded from macro 'pr_alert'
           printk(KERN_ALERT pr_fmt(fmt), ##__VA_ARGS__)
                                    ~~~     ^~~~~~~~~~~
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   5 warnings and 5 errors generated.


vim +/next_to_cpu_idx +691 kernel/locking/qspinlock.c

   690	
 > 691	static struct mcs_spinlock *next_to_cpu_idx(struct mcs_spinlock *msp, int *cpup, int *idxp)
   692	{
   693		int cpu;
   694		int idx;
   695	
   696		for_each_possible_cpu(cpu) {
   697			struct qnode *qnp = per_cpu_ptr(&qnodes[0], cpu);
   698	
   699			for (idx = 0; idx < MAX_NODES; idx++) {
   700				if (&qnp[idx].mcs == msp) {
   701					*cpup = cpu;
   702					*idxp = idx;
   703					return &qnp[idx].mcs;
   704				}
   705			}
   706		}
   707		*cpup = -1;
   708		*idxp = -1;
   709		return NULL;
   710	}
   711	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
