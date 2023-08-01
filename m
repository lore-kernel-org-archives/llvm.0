Received: from mgamail.intel.com (unknown [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020E5200AC;
	Tue,  1 Aug 2023 18:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690916141; x=1722452141;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CocY8ZkpnNwdaNbns2su3V6ME6wKx7a5aoHMfOlxsng=;
  b=I+Y6urZgs90ZCRyGY6COVHHyAVl2LG92G0feIcIRxjh+RBmgZyZL5Cri
   DhvDEm4AyXVe7p8gaq3JseTsH+d6x+KqG9ZagLGEfP9EWcspLruzUNuVY
   0AsfQLbAvudSgrNFVhDGkGXdVhHsjqL5v6APUNei+hv7Y/MA3GLuBCXAB
   RaUAbjzSOyLiYFhugo8KmurChxPyq3JVtPPx+88kuWkLmgCtP3z/e2GYc
   ZLd7nukH16hYk54fRWxSvzPSAk+87huhYkOjYEhnpl4Vw0hQ9QPOBbxNq
   TZuPy6oMxo9Pfo1BptrQaoxdfKUEWvrIqaywz/Q+kBldwkrNH1iSQGLvv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="373026875"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="373026875"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 11:55:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="842841565"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="842841565"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 01 Aug 2023 11:55:38 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQuWw-0000X9-08;
	Tue, 01 Aug 2023 18:55:38 +0000
Date: Wed, 2 Aug 2023 02:54:46 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:timers/softirq-preemptible 1/6]
 kernel/softirq.c:535:2: error: call to undeclared function
 'reset_softirq_pending'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202308020252.e942kGTt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git timers/softirq-preemptible
head:   c233aee141ddb78d07b2f7311be38cfc286de654
commit: 0f12659dd62d91c765a711ed6cac3dca5786c620 [1/6] softirq: Turn set_softirq_pending() to reset_softirq_pending()
config: s390-randconfig-r044-20230731 (https://download.01.org/0day-ci/archive/20230802/202308020252.e942kGTt-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230802/202308020252.e942kGTt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308020252.e942kGTt-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/softirq.c:27:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from kernel/softirq.c:27:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from kernel/softirq.c:27:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> kernel/softirq.c:535:2: error: call to undeclared function 'reset_softirq_pending'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     535 |         reset_softirq_pending();
         |         ^
   12 warnings and 1 error generated.


vim +/reset_softirq_pending +535 kernel/softirq.c

   509	
   510	asmlinkage __visible void __softirq_entry __do_softirq(void)
   511	{
   512		unsigned long end = jiffies + MAX_SOFTIRQ_TIME;
   513		unsigned long old_flags = current->flags;
   514		int max_restart = MAX_SOFTIRQ_RESTART;
   515		struct softirq_action *h;
   516		bool in_hardirq;
   517		__u32 pending;
   518		int softirq_bit;
   519	
   520		/*
   521		 * Mask out PF_MEMALLOC as the current task context is borrowed for the
   522		 * softirq. A softirq handled, such as network RX, might set PF_MEMALLOC
   523		 * again if the socket is related to swapping.
   524		 */
   525		current->flags &= ~PF_MEMALLOC;
   526	
   527		pending = local_softirq_pending();
   528	
   529		softirq_handle_begin();
   530		in_hardirq = lockdep_softirq_start();
   531		account_softirq_enter(current);
   532	
   533	restart:
   534		/* Reset the pending bitmask before enabling irqs */
 > 535		reset_softirq_pending();
   536	
   537		local_irq_enable();
   538	
   539		h = softirq_vec;
   540	
   541		while ((softirq_bit = ffs(pending))) {
   542			unsigned int vec_nr;
   543			int prev_count;
   544	
   545			h += softirq_bit - 1;
   546	
   547			vec_nr = h - softirq_vec;
   548			prev_count = preempt_count();
   549	
   550			kstat_incr_softirqs_this_cpu(vec_nr);
   551	
   552			trace_softirq_entry(vec_nr);
   553			h->action(h);
   554			trace_softirq_exit(vec_nr);
   555			if (unlikely(prev_count != preempt_count())) {
   556				pr_err("huh, entered softirq %u %s %p with preempt_count %08x, exited with %08x?\n",
   557				       vec_nr, softirq_to_name[vec_nr], h->action,
   558				       prev_count, preempt_count());
   559				preempt_count_set(prev_count);
   560			}
   561			h++;
   562			pending >>= softirq_bit;
   563		}
   564	
   565		if (!IS_ENABLED(CONFIG_PREEMPT_RT) &&
   566		    __this_cpu_read(ksoftirqd) == current)
   567			rcu_softirq_qs();
   568	
   569		local_irq_disable();
   570	
   571		pending = local_softirq_pending();
   572		if (pending) {
   573			if (time_before(jiffies, end) && !need_resched() &&
   574			    --max_restart)
   575				goto restart;
   576	
   577			wakeup_softirqd();
   578		}
   579	
   580		account_softirq_exit(current);
   581		lockdep_softirq_end(in_hardirq);
   582		softirq_handle_end();
   583		current_restore_flags(old_flags, PF_MEMALLOC);
   584	}
   585	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
