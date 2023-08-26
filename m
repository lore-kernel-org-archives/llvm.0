Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B15517E4;
	Sat, 26 Aug 2023 08:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693037539; x=1724573539;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uplFwed50gSNvEb+r+gVQqYwbu8lAKw2kKbDurvyVEw=;
  b=Rb9Ir4N6nP9kN8gHNdtUr2WP+ruq1hoLjXyNGmyvlbx5B0Oqe1K3CHDR
   mpUXoiPIOv/QWUJusfUkZbO7rPaYGr0kq7AeKgdFl/qSE8e+h8RRjOu4i
   8TmiUC+Mpb2AfZmy89nGwVrPBUPQvavDsg2JKT6GIEyJXI8UR1M26342H
   6Biv+NYs3eU3/+ljrDRskCxHby+FN411D79x0+k+a3Ma1xWPd+mmC0ekt
   bJ7BsXJ1feEN9Yz2FzoPadtTI6RjRREpvW4lcEd7fehWM1Eit23YIBM0h
   0Hf2tmQ2whqHKFfi1/pwIhdChMnfYE7rKpXEaVaVS+51MDIS40DofH5Xm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="372261395"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="372261395"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2023 01:12:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="1068481569"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="1068481569"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 26 Aug 2023 01:12:15 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZoP0-0004Uu-1j;
	Sat, 26 Aug 2023 08:12:14 +0000
Date: Sat, 26 Aug 2023 16:12:01 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qais.yousef@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:sched-setscheduler-hide 2/9]
 kernel/rcu/rcutorture.c:3174:9: error: implicit declaration of function
 'rcu_get_gp_kthreads_prio' is invalid in C99
Message-ID: <202308261624.rsP2RxF8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux sched-setscheduler-hide
head:   e586c67baa1c537a793f135e324cc56df2b6585b
commit: 029b407f286d7bc9a7ace79c65483efa8ead8671 [2/9] rcu: Use a new sched_set_rcu_fifo() to set gp kthread prio
config: um-randconfig-r002-20230826 (https://download.01.org/0day-ci/archive/20230826/202308261624.rsP2RxF8-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308261624.rsP2RxF8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308261624.rsP2RxF8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/rcu/rcutorture.c:24:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from kernel/rcu/rcutorture.c:24:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from kernel/rcu/rcutorture.c:24:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   kernel/rcu/rcutorture.c:416:21: warning: variable 'ts' set but not used [-Wunused-but-set-variable]
           unsigned long long ts;
                              ^
   kernel/rcu/rcutorture.c:412:16: warning: variable 'started' set but not used [-Wunused-but-set-variable]
           unsigned long started;
                         ^
   kernel/rcu/rcutorture.c:413:16: warning: variable 'completed' set but not used [-Wunused-but-set-variable]
           unsigned long completed;
                         ^
   kernel/rcu/rcutorture.c:1967:21: warning: variable 'ts' set but not used [-Wunused-but-set-variable]
           unsigned long long ts;
                              ^
>> kernel/rcu/rcutorture.c:3174:9: error: implicit declaration of function 'rcu_get_gp_kthreads_prio' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           prio = rcu_get_gp_kthreads_prio();
                  ^
   16 warnings and 1 error generated.


vim +/rcu_get_gp_kthreads_prio +3174 kernel/rcu/rcutorture.c

fae4b54f28f034 kernel/rcutorture.c     Paul E. McKenney        2012-02-20  3163  
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3164) static bool rcu_torture_can_boost(void)
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3165) {
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3166) 	static int boost_warn_once;
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3167) 	int prio;
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3168) 
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3169) 	if (!(test_boost == 1 && cur_ops->can_boost) && test_boost != 2)
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3170) 		return false;
ea6d962e80b619 kernel/rcu/rcutorture.c Paul E. McKenney        2021-03-30  3171  	if (!cur_ops->start_gp_poll || !cur_ops->poll_gp_state)
5e59fba573e64c kernel/rcu/rcutorture.c Paul E. McKenney        2021-01-15  3172  		return false;
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3173) 
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19 @3174) 	prio = rcu_get_gp_kthreads_prio();
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3175) 	if (!prio)
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3176) 		return false;
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3177) 
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3178) 	if (prio < 2) {
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3179) 		if (boost_warn_once == 1)
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3180) 			return false;
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3181) 
bf5b64355a3ce4 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3182) 		pr_alert("%s: WARN: RCU kthread priority too low to test boosting.  Skipping RCU boost test. Try passing rcutree.kthread_prio > 1 on the kernel command line.\n", KBUILD_MODNAME);
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3183) 		boost_warn_once = 1;
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3184) 		return false;
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3185) 	}
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3186) 
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3187) 	return true;
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3188) }
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3189) 

:::::: The code at line 3174 was first introduced by commit
:::::: 4babd855fd6137f9792117eb73b096c221a49d3c rcutorture: Add support to detect if boost kthread prio is too low

:::::: TO: Joel Fernandes (Google) <joel@joelfernandes.org>
:::::: CC: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
