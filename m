Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F00633;
	Tue,  5 Sep 2023 03:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693883248; x=1725419248;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A34B1i7POrJjXLA8t/pF6ensF1tB1PO4+CDF7SIlFKw=;
  b=Nz2vbrS4uHonMuCvH8w8GbmRqf6m7F//cLjS3zJFx/4TDS2vMWhkU/Ep
   F79ud4PzCpzXuQewHHXuZJgBIWWY2lojX1ghn/M2rP01L8CK8BMfHn4L0
   QSinmREhcJAU8bzIjOXWl7Smv5VsapvyK03zfm09Zz9ycb2/wtkRX1TXu
   fakSaQrMCHg9zjKgklhafgHbpsaNuIoD5YkqB1Bgi0/0wHzlX5KgpuVuF
   EeZ+gA3tIu6XonOBcgL10WGOYYuHOL910+GZOQ4IUnoYOehgFmRCYRW4y
   w7p7oymYX6vqfHhOKQ4suBQEEhQ6B1zDQzRxD86W39vRqJovLUmTbtCfp
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="366918450"
X-IronPort-AV: E=Sophos;i="6.02,228,1688454000"; 
   d="scan'208";a="366918450"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 20:07:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="987661423"
X-IronPort-AV: E=Sophos;i="6.02,228,1688454000"; 
   d="scan'208";a="987661423"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 04 Sep 2023 20:07:25 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdMPT-0001Ar-0q;
	Tue, 05 Sep 2023 03:07:23 +0000
Date: Tue, 5 Sep 2023 11:07:06 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:uclamp-max-aggregation 2/2]
 kernel/sched/core.c:4930:24: error: too many arguments to function call,
 expected 0, have 1
Message-ID: <202309051015.quYZtfan-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux uclamp-max-aggregation
head:   034e0d339ff128022624302f1a331cdc59d10ee1
commit: 034e0d339ff128022624302f1a331cdc59d10ee1 [2/2] sched/uclamp: Remove rq max aggregation
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20230905/202309051015.quYZtfan-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230905/202309051015.quYZtfan-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309051015.quYZtfan-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/core.c:9:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from kernel/sched/core.c:9:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from kernel/sched/core.c:9:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
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
>> kernel/sched/core.c:4930:24: error: too many arguments to function call, expected 0, have 1
    4930 |         uclamp_context_switch(rq);
         |         ~~~~~~~~~~~~~~~~~~~~~ ^~
   kernel/sched/sched.h:3051:20: note: 'uclamp_context_switch' declared here
    3051 | static inline void uclamp_context_switch(void)
         |                    ^
   12 warnings and 1 error generated.


vim +4930 kernel/sched/core.c

  4869	
  4870	/**
  4871	 * finish_task_switch - clean up after a task-switch
  4872	 * @prev: the thread we just switched away from.
  4873	 *
  4874	 * finish_task_switch must be called after the context switch, paired
  4875	 * with a prepare_task_switch call before the context switch.
  4876	 * finish_task_switch will reconcile locking set up by prepare_task_switch,
  4877	 * and do any other architecture-specific cleanup actions.
  4878	 *
  4879	 * Note that we may have delayed dropping an mm in context_switch(). If
  4880	 * so, we finish that here outside of the runqueue lock. (Doing it
  4881	 * with the lock held can cause deadlocks; see schedule() for
  4882	 * details.)
  4883	 *
  4884	 * The context switch have flipped the stack from under us and restored the
  4885	 * local variables which were saved when this task called schedule() in the
  4886	 * past. prev == current is still correct but we need to recalculate this_rq
  4887	 * because prev may have moved to another CPU.
  4888	 */
  4889	static struct rq *finish_task_switch(struct task_struct *prev)
  4890		__releases(rq->lock)
  4891	{
  4892		struct rq *rq = this_rq();
  4893		struct mm_struct *mm = rq->prev_mm;
  4894		unsigned int prev_state;
  4895	
  4896		/*
  4897		 * The previous task will have left us with a preempt_count of 2
  4898		 * because it left us after:
  4899		 *
  4900		 *	schedule()
  4901		 *	  preempt_disable();			// 1
  4902		 *	  __schedule()
  4903		 *	    raw_spin_lock_irq(&rq->lock)	// 2
  4904		 *
  4905		 * Also, see FORK_PREEMPT_COUNT.
  4906		 */
  4907		if (WARN_ONCE(preempt_count() != 2*PREEMPT_DISABLE_OFFSET,
  4908			      "corrupted preempt_count: %s/%d/0x%x\n",
  4909			      current->comm, current->pid, preempt_count()))
  4910			preempt_count_set(FORK_PREEMPT_COUNT);
  4911	
  4912		rq->prev_mm = NULL;
  4913	
  4914		/*
  4915		 * A task struct has one reference for the use as "current".
  4916		 * If a task dies, then it sets TASK_DEAD in tsk->state and calls
  4917		 * schedule one last time. The schedule call will never return, and
  4918		 * the scheduled task must drop that reference.
  4919		 *
  4920		 * We must observe prev->state before clearing prev->on_cpu (in
  4921		 * finish_task), otherwise a concurrent wakeup can get prev
  4922		 * running on another CPU and we could rave with its RUNNING -> DEAD
  4923		 * transition, resulting in a double drop.
  4924		 */
  4925		prev_state = READ_ONCE(prev->__state);
  4926		vtime_task_switch(prev);
  4927		perf_event_task_sched_in(prev, current);
  4928		finish_task(prev);
  4929		tick_nohz_task_switch();
> 4930		uclamp_context_switch(rq);
  4931		finish_lock_switch(rq);
  4932		finish_arch_post_lock_switch();
  4933		kcov_finish_switch(current);
  4934		/*
  4935		 * kmap_local_sched_out() is invoked with rq::lock held and
  4936		 * interrupts disabled. There is no requirement for that, but the
  4937		 * sched out code does not have an interrupt enabled section.
  4938		 * Restoring the maps on sched in does not require interrupts being
  4939		 * disabled either.
  4940		 */
  4941		kmap_local_sched_in();
  4942	
  4943		fire_sched_in_preempt_notifiers(current);
  4944		/*
  4945		 * When switching through a kernel thread, the loop in
  4946		 * membarrier_{private,global}_expedited() may have observed that
  4947		 * kernel thread and not issued an IPI. It is therefore possible to
  4948		 * schedule between user->kernel->user threads without passing though
  4949		 * switch_mm(). Membarrier requires a barrier after storing to
  4950		 * rq->curr, before returning to userspace, so provide them here:
  4951		 *
  4952		 * - a full memory barrier for {PRIVATE,GLOBAL}_EXPEDITED, implicitly
  4953		 *   provided by mmdrop_lazy_tlb(),
  4954		 * - a sync_core for SYNC_CORE.
  4955		 */
  4956		if (mm) {
  4957			membarrier_mm_sync_core_before_usermode(mm);
  4958			mmdrop_lazy_tlb_sched(mm);
  4959		}
  4960	
  4961		if (unlikely(prev_state == TASK_DEAD)) {
  4962			if (prev->sched_class->task_dead)
  4963				prev->sched_class->task_dead(prev);
  4964	
  4965			/* Task is done with its stack. */
  4966			put_task_stack(prev);
  4967	
  4968			put_task_struct_rcu_user(prev);
  4969		}
  4970	
  4971		return rq;
  4972	}
  4973	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
