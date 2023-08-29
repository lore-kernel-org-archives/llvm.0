Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DECA47;
	Tue, 29 Aug 2023 03:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693281477; x=1724817477;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JXvz1G+PL70Zf/0ESFnS2SjUdi9WeIih6TqdrqLGbhg=;
  b=PneIV0Ew2ZdkY3q18KowC2dQ9WABVIsIeBV5Y1yk1bH77TJzlw8S1M2W
   UV9f9Uc7CLC2gWoMDbhUhxpOys61fZWMCa+GjNIBG7rpAeox2unj2D5tc
   pAT+1xIl/CJFfCxwltayEyAiKkIepJd84GSaXY+wGPV3pYnsi5vKb2JUp
   aQL/ZiCM84TX0yyj5wjUBIcUbzmLxADTv1dseq+iDbbf+4oJs8tvSIKoY
   YQgtpeYgqLpUhyrf6rM+okzK5T6v6tCJ3G13qLw1ZulXm8hnMl6eC30e8
   kI/pcwauF05JKT3Pr/4qIzxYLOdx/q92czx0YBh66uHagsHoIfQ9OGfj3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="441615902"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="441615902"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 20:57:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="882158068"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 28 Aug 2023 20:58:00 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaprW-0008Md-1K;
	Tue, 29 Aug 2023 03:57:54 +0000
Date: Tue, 29 Aug 2023 11:57:10 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:rt-thermal-pressure 1/2] kernel/sched/rt.c:2650:27:
 error: no member named 'cpu' in 'struct rq'
Message-ID: <202308291114.rfyC49TR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux rt-thermal-pressure
head:   f9adf589d645dfda6f820165dafbc0f9d11747b4
commit: 6a44180bbdcfdd7281062d068cd85458f74c53e7 [1/2] sched/rt: Handle misfit RT task due to changed uclamp_min value
config: hexagon-randconfig-r026-20230829 (https://download.01.org/0day-ci/archive/20230829/202308291114.rfyC49TR-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230829/202308291114.rfyC49TR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308291114.rfyC49TR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:24:
   In file included from include/linux/livepatch.h:13:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
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
   In file included from kernel/sched/build_policy.c:24:
   In file included from include/linux/livepatch.h:13:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
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
   In file included from kernel/sched/build_policy.c:24:
   In file included from include/linux/livepatch.h:13:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
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
   In file included from kernel/sched/build_policy.c:45:
   kernel/sched/rt.c:2648:7: error: call to undeclared function 'rt_task_fits_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2648 |         if (!rt_task_fits_cpu(p, cpu_of(rq))) {
         |              ^
>> kernel/sched/rt.c:2650:27: error: no member named 'cpu' in 'struct rq'
    2650 |                 stop_one_cpu_nowait(rq->cpu, push_cpu_stop,
         |                                     ~~  ^
>> kernel/sched/rt.c:2650:32: error: use of undeclared identifier 'push_cpu_stop'
    2650 |                 stop_one_cpu_nowait(rq->cpu, push_cpu_stop,
         |                                              ^
>> kernel/sched/rt.c:2651:9: error: use of undeclared identifier 'push_task'
    2651 |                                     push_task, &rq->push_work);
         |                                     ^
   6 warnings and 4 errors generated.


vim +2650 kernel/sched/rt.c

  2630	
  2631	/*
  2632	 * scheduler tick hitting a task of our scheduling class.
  2633	 *
  2634	 * NOTE: This function can be called remotely by the tick offload that
  2635	 * goes along full dynticks. Therefore no local assumption can be made
  2636	 * and everything must be accessed through the @rq and @curr passed in
  2637	 * parameters.
  2638	 */
  2639	static void task_tick_rt(struct rq *rq, struct task_struct *p, int queued)
  2640	{
  2641		struct sched_rt_entity *rt_se = &p->rt;
  2642	
  2643		update_curr_rt(rq);
  2644		update_rt_rq_load_avg(rq_clock_pelt(rq), rq, 1);
  2645	
  2646		watchdog(rq, p);
  2647	
> 2648		if (!rt_task_fits_cpu(p, cpu_of(rq))) {
  2649			raw_spin_rq_unlock(rq);
> 2650			stop_one_cpu_nowait(rq->cpu, push_cpu_stop,
> 2651					    push_task, &rq->push_work);
  2652			raw_spin_rq_lock(rq);
  2653			return;
  2654		}
  2655	
  2656		/*
  2657		 * RR tasks need a special form of timeslice management.
  2658		 * FIFO tasks have no timeslices.
  2659		 */
  2660		if (p->policy != SCHED_RR)
  2661			return;
  2662	
  2663		if (--p->rt.time_slice)
  2664			return;
  2665	
  2666		p->rt.time_slice = sched_rr_timeslice;
  2667	
  2668		/*
  2669		 * Requeue to the end of queue if we (and all of our ancestors) are not
  2670		 * the only element on the queue
  2671		 */
  2672		for_each_sched_rt_entity(rt_se) {
  2673			if (rt_se->run_list.prev != rt_se->run_list.next) {
  2674				requeue_task_rt(rq, p, 0);
  2675				resched_curr(rq);
  2676				return;
  2677			}
  2678		}
  2679	}
  2680	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
