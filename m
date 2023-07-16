Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B32187B;
	Sun, 16 Jul 2023 04:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689483499; x=1721019499;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o3Nx/f4kUwQc04Vvi8jHCUr1NFUIspVsyHVhDNs0COc=;
  b=kr1Md0npNnMN2o/fxcJwvszB+KDd7BYrmHDOvKzkk14ZDmBlm5gFdJIe
   IChVsGcjeUPOIxIW5aJqTi4S/DK7SfOzFWn5moGJO9Dbm3EyAFv99OHKx
   i/g/erpJG/a4ZF02BYQ1YHi7uAIWvL5PcfCjZMKt/uLTz4/lC8qxgnEJU
   4K2yLUC3ear6IHVu+7dUd4iAW3oHmM3xWdqOFdRb7nA3xkk4yqjVlYVwe
   B9oMyCn1hfGWKxlqpdzePTbsdUtiWNiObGfi8GSucS7kUt/Iue1R1Hsmx
   GsjT9EUqKvQD0KGHV0zauYHOx+yU5d2HuFhKkrcS7fnVmRr4V2Kij7sBz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="368371602"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="368371602"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 21:58:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="722832797"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="722832797"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 15 Jul 2023 21:58:15 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKtpm-0008b3-1U;
	Sun, 16 Jul 2023 04:58:14 +0000
Date: Sun, 16 Jul 2023 12:58:04 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qais.yousef@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:sched-setscheduler-hide 2/6]
 kernel/rcu/rcutorture.c:3174:9: error: call to undeclared function
 'rcu_get_gp_kthreads_prio'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202307161225.2ZiyNfWo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux sched-setscheduler-hide
head:   40f87f6acda90270ee3eb284cbd13a8751ac4e61
commit: d8106d64bbf0e8d98e636ddda1524fae375c8cf5 [2/6] rcu: Use a new sched_set_rcu_fifo() to set gp kthread prio
config: hexagon-randconfig-r045-20230716 (https://download.01.org/0day-ci/archive/20230716/202307161225.2ZiyNfWo-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230716/202307161225.2ZiyNfWo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307161225.2ZiyNfWo-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/rcu/rcutorture.c:24:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from kernel/rcu/rcutorture.c:24:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from kernel/rcu/rcutorture.c:24:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   kernel/rcu/rcutorture.c:412:16: warning: variable 'started' set but not used [-Wunused-but-set-variable]
     412 |         unsigned long started;
         |                       ^
   kernel/rcu/rcutorture.c:413:16: warning: variable 'completed' set but not used [-Wunused-but-set-variable]
     413 |         unsigned long completed;
         |                       ^
   kernel/rcu/rcutorture.c:416:21: warning: variable 'ts' set but not used [-Wunused-but-set-variable]
     416 |         unsigned long long ts;
         |                            ^
   kernel/rcu/rcutorture.c:1967:21: warning: variable 'ts' set but not used [-Wunused-but-set-variable]
    1967 |         unsigned long long ts;
         |                            ^
>> kernel/rcu/rcutorture.c:3174:9: error: call to undeclared function 'rcu_get_gp_kthreads_prio'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3174 |         prio = rcu_get_gp_kthreads_prio();
         |                ^
   10 warnings and 1 error generated.


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
