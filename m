Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1E82D2383;
	Mon, 13 Oct 2025 17:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760375100; cv=none; b=fNmrp1FaB22KywwoCJBF5ejVhZ93WeKKlvtPbKYociwfF3QD2nt4gtYXTNpZjKr4/Fxg3HtFyEIWRqYA8e8mHdUf0tR35KBJIYZ9mjJOa+rRN6S840scig0vCuHD1+Rb5pdEHNA/vCDsKO3FvyQK8QVkBn2J430H7lLVy1Ti6LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760375100; c=relaxed/simple;
	bh=/taaVzlfbYrSFt/9WuLeBRfhN/FLkp74TvhX9fD0ank=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l4zipnqmLcWlAnLmTc3itfifbVIIb5PaTDaqAqYI+51IwVIBAGIyHEjH2zluVGhfPb656ZgsWvWRiLjcGVnJvrMzhM2zEBU2ijzpXgW2kFd1E8CgGTjCB/4cysszzpB7JGwnjhtwCr5Nl131vOEUUAs2TCk4bfjQTIdJcqlYTM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c85XmqUC; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c85XmqUC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760375097; x=1791911097;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/taaVzlfbYrSFt/9WuLeBRfhN/FLkp74TvhX9fD0ank=;
  b=c85XmqUCPb3cVL2tavYfh969EgsXjDQICKPN65phJEzVN8KIfWpgdQ62
   glU/UZMQpjD5uzX/lXyCfa0lmBjmmQkSfhtQgSo49YrbodDZIct/7uMGv
   pWDpt1aSZ7ehczqKatOhaip7nNv6ATDuR6LxDiUA4Q9eQiaZdHLea5aR9
   ihp/y/0878cYR+eYfAMKqCpbiXvU6ggwTjrFOWxQr+BH1JaRE3pnxJHSh
   5dOIlHKkPVziPCKR9YvyXgkmymW0XbnP8a3hoq4tlOFd19cxUrB0Ysqfs
   3CmXbHhxuAiYr8SLjvdoelvQu3R4QpnG1SktM2OfpWEU3nLQsrXLwLJ2b
   g==;
X-CSE-ConnectionGUID: g98rNFc4TOOtBGHquTV0rw==
X-CSE-MsgGUID: rNAdflplQsCPRekAAnKjfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="72782975"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; 
   d="scan'208";a="72782975"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 10:04:49 -0700
X-CSE-ConnectionGUID: TK6zYFZrTxKynHREOqk1Zg==
X-CSE-MsgGUID: b+KG3zrMRDiAVoIegbSD9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; 
   d="scan'208";a="182091419"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 13 Oct 2025 10:04:48 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8LyX-0001tT-1c;
	Mon, 13 Oct 2025 17:04:45 +0000
Date: Tue, 14 Oct 2025 01:04:15 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/cleanup-pick 21/23]
 kernel/sched/fair.c:12903:33: error: passing 'const struct sched_class *' to
 parameter of type 'struct sched_class *' discards qualifiers
Message-ID: <202510140047.VQ0KDdgl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/cleanup-pick
head:   a85bb9c58a6293b7823fff6c715026bad24d3fff
commit: 3e92434695a42323aaa6b1d6a78245f1c31b3421 [21/23] sched: Detect per-class runqueue changes
config: riscv-randconfig-002-20251013 (https://download.01.org/0day-ci/archive/20251014/202510140047.VQ0KDdgl-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 39f292ffa13d7ca0d1edff27ac8fd55024bb4d19)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251014/202510140047.VQ0KDdgl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510140047.VQ0KDdgl-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/fair.c:28:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:838:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     838 |         insb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:108:53: note: expanded from macro 'insb'
     108 | #define insb(addr, buffer, count) __insb(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from kernel/sched/fair.c:28:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:846:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     846 |         insw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:109:53: note: expanded from macro 'insw'
     109 | #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from kernel/sched/fair.c:28:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:854:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     854 |         insl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:110:53: note: expanded from macro 'insl'
     110 | #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from kernel/sched/fair.c:28:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:863:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     863 |         outsb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:122:55: note: expanded from macro 'outsb'
     122 | #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from kernel/sched/fair.c:28:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:872:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     872 |         outsw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:123:55: note: expanded from macro 'outsw'
     123 | #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from kernel/sched/fair.c:28:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:881:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     881 |         outsl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:124:55: note: expanded from macro 'outsl'
     124 | #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from kernel/sched/fair.c:28:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> kernel/sched/fair.c:12903:33: error: passing 'const struct sched_class *' to parameter of type 'struct sched_class *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
    12903 |         if (rq_modified_above(this_rq, &fair_sched_class))
          |                                        ^~~~~~~~~~~~~~~~~
   kernel/sched/sched.h:2593:73: note: passing argument to parameter 'class' here
    2593 | static inline bool rq_modified_above(struct rq *rq, struct sched_class *class)
         |                                                                         ^
   7 warnings and 1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARCH_HAS_ELF_CORE_EFLAGS
   Depends on [n]: BINFMT_ELF [=n] && ELF_CORE [=n]
   Selected by [y]:
   - RISCV [=y]


vim +12903 kernel/sched/fair.c

 12781	
 12782	/*
 12783	 * sched_balance_newidle is called by schedule() if this_cpu is about to become
 12784	 * idle. Attempts to pull tasks from other CPUs.
 12785	 *
 12786	 * Returns:
 12787	 *   < 0 - we released the lock and there are !fair tasks present
 12788	 *     0 - failed, no new tasks
 12789	 *   > 0 - success, new (fair) tasks present
 12790	 */
 12791	static int sched_balance_newidle(struct rq *this_rq, struct rq_flags *rf)
 12792	{
 12793		unsigned long next_balance = jiffies + HZ;
 12794		int this_cpu = this_rq->cpu;
 12795		int continue_balancing = 1;
 12796		u64 t0, t1, curr_cost = 0;
 12797		struct sched_domain *sd;
 12798		int pulled_task = 0;
 12799	
 12800		update_misfit_status(NULL, this_rq);
 12801	
 12802		/*
 12803		 * There is a task waiting to run. No need to search for one.
 12804		 * Return 0; the task will be enqueued when switching to idle.
 12805		 */
 12806		if (this_rq->ttwu_pending)
 12807			return 0;
 12808	
 12809		/*
 12810		 * We must set idle_stamp _before_ calling sched_balance_rq()
 12811		 * for CPU_NEWLY_IDLE, such that we measure the this duration
 12812		 * as idle time.
 12813		 */
 12814		this_rq->idle_stamp = rq_clock(this_rq);
 12815	
 12816		/*
 12817		 * Do not pull tasks towards !active CPUs...
 12818		 */
 12819		if (!cpu_active(this_cpu))
 12820			return 0;
 12821	
 12822		/*
 12823		 * This is OK, because current is on_cpu, which avoids it being picked
 12824		 * for load-balance and preemption/IRQs are still disabled avoiding
 12825		 * further scheduler activity on it and we're being very careful to
 12826		 * re-start the picking loop.
 12827		 */
 12828		rq_unpin_lock(this_rq, rf);
 12829	
 12830		rcu_read_lock();
 12831		sd = rcu_dereference_check_sched_domain(this_rq->sd);
 12832	
 12833		if (!get_rd_overloaded(this_rq->rd) ||
 12834		    (sd && this_rq->avg_idle < sd->max_newidle_lb_cost)) {
 12835	
 12836			if (sd)
 12837				update_next_balance(sd, &next_balance);
 12838			rcu_read_unlock();
 12839	
 12840			goto out;
 12841		}
 12842		rcu_read_unlock();
 12843	
 12844		rq_modified_clear(this_rq);
 12845		raw_spin_rq_unlock(this_rq);
 12846	
 12847		t0 = sched_clock_cpu(this_cpu);
 12848		sched_balance_update_blocked_averages(this_cpu);
 12849	
 12850		rcu_read_lock();
 12851		for_each_domain(this_cpu, sd) {
 12852			u64 domain_cost;
 12853	
 12854			update_next_balance(sd, &next_balance);
 12855	
 12856			if (this_rq->avg_idle < curr_cost + sd->max_newidle_lb_cost)
 12857				break;
 12858	
 12859			if (sd->flags & SD_BALANCE_NEWIDLE) {
 12860	
 12861				pulled_task = sched_balance_rq(this_cpu, this_rq,
 12862							   sd, CPU_NEWLY_IDLE,
 12863							   &continue_balancing);
 12864	
 12865				t1 = sched_clock_cpu(this_cpu);
 12866				domain_cost = t1 - t0;
 12867				curr_cost += domain_cost;
 12868				t0 = t1;
 12869	
 12870				/*
 12871				 * Failing newidle means it is not effective;
 12872				 * bump the cost so we end up doing less of it.
 12873				 */
 12874				if (!pulled_task)
 12875					domain_cost = (3 * sd->max_newidle_lb_cost) / 2;
 12876	
 12877				update_newidle_cost(sd, domain_cost);
 12878			}
 12879	
 12880			/*
 12881			 * Stop searching for tasks to pull if there are
 12882			 * now runnable tasks on this rq.
 12883			 */
 12884			if (pulled_task || !continue_balancing)
 12885				break;
 12886		}
 12887		rcu_read_unlock();
 12888	
 12889		raw_spin_rq_lock(this_rq);
 12890	
 12891		if (curr_cost > this_rq->max_idle_balance_cost)
 12892			this_rq->max_idle_balance_cost = curr_cost;
 12893	
 12894		/*
 12895		 * While browsing the domains, we released the rq lock, a task could
 12896		 * have been enqueued in the meantime. Since we're not going idle,
 12897		 * pretend we pulled a task.
 12898		 */
 12899		if (this_rq->cfs.h_nr_queued && !pulled_task)
 12900			pulled_task = 1;
 12901	
 12902		/* If a higher prio class was modified, restart the pick */
 12903		if (rq_modified_above(this_rq, &fair_sched_class))
 12904			pulled_task = -1;
 12905	
 12906	out:
 12907		/* Move the next balance forward */
 12908		if (time_after(this_rq->next_balance, next_balance))
 12909			this_rq->next_balance = next_balance;
 12910	
 12911		if (pulled_task)
 12912			this_rq->idle_stamp = 0;
 12913		else
 12914			nohz_newidle_balance(this_rq);
 12915	
 12916		rq_repin_lock(this_rq, rf);
 12917	
 12918		return pulled_task;
 12919	}
 12920	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
