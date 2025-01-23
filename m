Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B3E20CCDE;
	Thu, 23 Jan 2025 09:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737625848; cv=none; b=Z/04DgVP5kFmeSROXmjwWMJJwVcmD5ZRIqHNDf1ayKinWbFaeShUof8JbwifPzk8WjL9WmQm0JPWHHtFtp1N+mzWdZ+tmmz6p9cXb2aaepPvj4UtJY4GOH4dOoxhOYB2Pe1JnCKtbETcRyXLAi+iquQAhsXGZmiSLze1waw3dkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737625848; c=relaxed/simple;
	bh=b5MlBPeiyA+d8Ppy6QT5Y56YPb3pLd35Sd/BOvoGeic=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dml/ma0tP2ajjgMe5JS+8bfyiP5+9TmR9ETbETnNxKsVo1sZrOFztaolA885IhWX4nwwkslF3oN7Ekia0uczsdVWow4SciLlTl018XSOmuekhOb7TK0w8UBP75QR9EA5ZJvUEE5F0m3vCmzo3n4PEGFkraSb/6DYPhBlnZ4hipI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VcZ2OTpY; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VcZ2OTpY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737625846; x=1769161846;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b5MlBPeiyA+d8Ppy6QT5Y56YPb3pLd35Sd/BOvoGeic=;
  b=VcZ2OTpYp9zcffW/1bJaIqymDvo0LxJOTGUaid9JoAx9nup6AoGYeB4g
   cYWlSYcYimXzoocTC5f9c1hgFxo4pD8OX7wSrKaIL3ao32hz3Tc7n4/3G
   PpooLRIuT3vmFPsRqoinZusBpK9/kmR5I48ZGWQ/t5VCryrDHBZkbREIB
   8u2uYIhfc/I9ihdqQNJR1XpwGPKV7OaebIszGnm2Iuvgzv0FaEAFQdb4Q
   U28K55oWtEP8avL5RKOfAsCLVNdC1x+tAH2gOthRWg+SyexPQ2nMnkwnN
   sYVFIV/xXuoZ5fWkmbqOwdLHm7O4StESNPCUrQT+vlureEOOrDUT+tVDG
   g==;
X-CSE-ConnectionGUID: UPEQSb51RtaOhmmXSK5a+Q==
X-CSE-MsgGUID: /l+ksZSNRiuheZkpkutrLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="55531192"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="55531192"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 01:50:45 -0800
X-CSE-ConnectionGUID: ZYl2KCV3Smu3GdlIUMYJUA==
X-CSE-MsgGUID: 9w9cxZUmS9KwiqRd/uf9yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="112381811"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 23 Jan 2025 01:50:44 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tatrG-000b07-0A;
	Thu, 23 Jan 2025 09:50:42 +0000
Date: Thu, 23 Jan 2025 17:50:07 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 304/305] kernel/sched/core.c:4218:21:
 error: instruction requires the following: RV64I Base Instruction Set
Message-ID: <202501231731.ilVCHONr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   9f73221be57f43a312dec7cdbd8ae087006f8676
commit: 6d3b02750c6ee287c5d230ad44e5ef92c33c1343 [304/305] trace_sched_wakeup_backtrace
config: riscv-randconfig-002-20250123 (https://download.01.org/0day-ci/archive/20250123/202501231731.ilVCHONr-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project c23f2417dc5f6dc371afb07af5627ec2a9d373a0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250123/202501231731.ilVCHONr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501231731.ilVCHONr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/core.c:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/riscv/include/asm/cacheflush.h:9:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:6558:20: warning: unused function 'sched_core_cpu_deactivate' [-Wunused-function]
    6558 | static inline void sched_core_cpu_deactivate(unsigned int cpu) {}
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/core.c:4218:21: error: instruction requires the following: RV64I Base Instruction Set
    4218 |             (sleep_start = xchg(&p->sleep_timestamp, 0)))
         |                            ^
   include/linux/atomic/atomic-instrumented.h:4758:2: note: expanded from macro 'xchg'
    4758 |         raw_xchg(__ai_ptr, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:12:18: note: expanded from macro 'raw_xchg'
      12 | #define raw_xchg arch_xchg
         |                  ^
   arch/riscv/include/asm/cmpxchg.h:108:37: note: expanded from macro 'arch_xchg'
     108 |         _arch_xchg(ptr, x, ".rl", ".aqrl", "", RISCV_FULL_BARRIER, "")
         |                                            ^
   <inline asm>:1:3: note: instantiated into assembly here
       1 |                 amoswap.d.aqrl a1, a0, 0(a1)
         |                 ^
   5 warnings and 1 error generated.


vim +4218 kernel/sched/core.c

  4062	
  4063	/*
  4064	 * Notes on Program-Order guarantees on SMP systems.
  4065	 *
  4066	 *  MIGRATION
  4067	 *
  4068	 * The basic program-order guarantee on SMP systems is that when a task [t]
  4069	 * migrates, all its activity on its old CPU [c0] happens-before any subsequent
  4070	 * execution on its new CPU [c1].
  4071	 *
  4072	 * For migration (of runnable tasks) this is provided by the following means:
  4073	 *
  4074	 *  A) UNLOCK of the rq(c0)->lock scheduling out task t
  4075	 *  B) migration for t is required to synchronize *both* rq(c0)->lock and
  4076	 *     rq(c1)->lock (if not at the same time, then in that order).
  4077	 *  C) LOCK of the rq(c1)->lock scheduling in task
  4078	 *
  4079	 * Release/acquire chaining guarantees that B happens after A and C after B.
  4080	 * Note: the CPU doing B need not be c0 or c1
  4081	 *
  4082	 * Example:
  4083	 *
  4084	 *   CPU0            CPU1            CPU2
  4085	 *
  4086	 *   LOCK rq(0)->lock
  4087	 *   sched-out X
  4088	 *   sched-in Y
  4089	 *   UNLOCK rq(0)->lock
  4090	 *
  4091	 *                                   LOCK rq(0)->lock // orders against CPU0
  4092	 *                                   dequeue X
  4093	 *                                   UNLOCK rq(0)->lock
  4094	 *
  4095	 *                                   LOCK rq(1)->lock
  4096	 *                                   enqueue X
  4097	 *                                   UNLOCK rq(1)->lock
  4098	 *
  4099	 *                   LOCK rq(1)->lock // orders against CPU2
  4100	 *                   sched-out Z
  4101	 *                   sched-in X
  4102	 *                   UNLOCK rq(1)->lock
  4103	 *
  4104	 *
  4105	 *  BLOCKING -- aka. SLEEP + WAKEUP
  4106	 *
  4107	 * For blocking we (obviously) need to provide the same guarantee as for
  4108	 * migration. However the means are completely different as there is no lock
  4109	 * chain to provide order. Instead we do:
  4110	 *
  4111	 *   1) smp_store_release(X->on_cpu, 0)   -- finish_task()
  4112	 *   2) smp_cond_load_acquire(!X->on_cpu) -- try_to_wake_up()
  4113	 *
  4114	 * Example:
  4115	 *
  4116	 *   CPU0 (schedule)  CPU1 (try_to_wake_up) CPU2 (schedule)
  4117	 *
  4118	 *   LOCK rq(0)->lock LOCK X->pi_lock
  4119	 *   dequeue X
  4120	 *   sched-out X
  4121	 *   smp_store_release(X->on_cpu, 0);
  4122	 *
  4123	 *                    smp_cond_load_acquire(&X->on_cpu, !VAL);
  4124	 *                    X->state = WAKING
  4125	 *                    set_task_cpu(X,2)
  4126	 *
  4127	 *                    LOCK rq(2)->lock
  4128	 *                    enqueue X
  4129	 *                    X->state = RUNNING
  4130	 *                    UNLOCK rq(2)->lock
  4131	 *
  4132	 *                                          LOCK rq(2)->lock // orders against CPU1
  4133	 *                                          sched-out Z
  4134	 *                                          sched-in X
  4135	 *                                          UNLOCK rq(2)->lock
  4136	 *
  4137	 *                    UNLOCK X->pi_lock
  4138	 *   UNLOCK rq(0)->lock
  4139	 *
  4140	 *
  4141	 * However, for wakeups there is a second guarantee we must provide, namely we
  4142	 * must ensure that CONDITION=1 done by the caller can not be reordered with
  4143	 * accesses to the task state; see try_to_wake_up() and set_current_state().
  4144	 */
  4145	
  4146	/**
  4147	 * try_to_wake_up - wake up a thread
  4148	 * @p: the thread to be awakened
  4149	 * @state: the mask of task states that can be woken
  4150	 * @wake_flags: wake modifier flags (WF_*)
  4151	 *
  4152	 * Conceptually does:
  4153	 *
  4154	 *   If (@state & @p->state) @p->state = TASK_RUNNING.
  4155	 *
  4156	 * If the task was not queued/runnable, also place it back on a runqueue.
  4157	 *
  4158	 * This function is atomic against schedule() which would dequeue the task.
  4159	 *
  4160	 * It issues a full memory barrier before accessing @p->state, see the comment
  4161	 * with set_current_state().
  4162	 *
  4163	 * Uses p->pi_lock to serialize against concurrent wake-ups.
  4164	 *
  4165	 * Relies on p->pi_lock stabilizing:
  4166	 *  - p->sched_class
  4167	 *  - p->cpus_ptr
  4168	 *  - p->sched_task_group
  4169	 * in order to do migration, see its use of select_task_rq()/set_task_cpu().
  4170	 *
  4171	 * Tries really hard to only take one task_rq(p)->lock for performance.
  4172	 * Takes rq->lock in:
  4173	 *  - ttwu_runnable()    -- old rq, unavoidable, see comment there;
  4174	 *  - ttwu_queue()       -- new rq, for enqueue of the task;
  4175	 *  - psi_ttwu_dequeue() -- much sadness :-( accounting will kill us.
  4176	 *
  4177	 * As a consequence we race really badly with just about everything. See the
  4178	 * many memory barriers and their comments for details.
  4179	 *
  4180	 * Return: %true if @p->state changes (an actual wakeup was done),
  4181	 *	   %false otherwise.
  4182	 */
  4183	int try_to_wake_up(struct task_struct *p, unsigned int state, int wake_flags)
  4184	{
  4185		guard(preempt)();
  4186		int cpu, success = 0;
  4187	
  4188		wake_flags |= WF_TTWU;
  4189	
  4190		if (p == current) {
  4191			/*
  4192			 * We're waking current, this means 'p->on_rq' and 'task_cpu(p)
  4193			 * == smp_processor_id()'. Together this means we can special
  4194			 * case the whole 'p->on_rq && ttwu_runnable()' case below
  4195			 * without taking any locks.
  4196			 *
  4197			 * Specifically, given current runs ttwu() we must be before
  4198			 * schedule()'s block_task(), as such this must not observe
  4199			 * sched_delayed.
  4200			 *
  4201			 * In particular:
  4202			 *  - we rely on Program-Order guarantees for all the ordering,
  4203			 *  - we're serialized against set_special_state() by virtue of
  4204			 *    it disabling IRQs (this allows not taking ->pi_lock).
  4205			 */
  4206			SCHED_WARN_ON(p->se.sched_delayed);
  4207			if (!ttwu_state_match(p, state, &success))
  4208				goto out;
  4209	
  4210			trace_sched_waking(p);
  4211			ttwu_do_wakeup(p);
  4212			goto out;
  4213		}
  4214	
  4215		u64 sleep_start;
  4216		if (p->sleep_timestamp &&
  4217		    trace_sched_wakeup_backtrace_enabled() &&
> 4218		    (sleep_start = xchg(&p->sleep_timestamp, 0)))
  4219			do_trace_sched_wakeup_backtrace(p, sleep_start);
  4220	
  4221		/*
  4222		 * If we are going to wake up a thread waiting for CONDITION we
  4223		 * need to ensure that CONDITION=1 done by the caller can not be
  4224		 * reordered with p->state check below. This pairs with smp_store_mb()
  4225		 * in set_current_state() that the waiting thread does.
  4226		 */
  4227		scoped_guard (raw_spinlock_irqsave, &p->pi_lock) {
  4228			smp_mb__after_spinlock();
  4229			if (!ttwu_state_match(p, state, &success))
  4230				break;
  4231	
  4232			trace_sched_waking(p);
  4233	
  4234			/*
  4235			 * Ensure we load p->on_rq _after_ p->state, otherwise it would
  4236			 * be possible to, falsely, observe p->on_rq == 0 and get stuck
  4237			 * in smp_cond_load_acquire() below.
  4238			 *
  4239			 * sched_ttwu_pending()			try_to_wake_up()
  4240			 *   STORE p->on_rq = 1			  LOAD p->state
  4241			 *   UNLOCK rq->lock
  4242			 *
  4243			 * __schedule() (switch to task 'p')
  4244			 *   LOCK rq->lock			  smp_rmb();
  4245			 *   smp_mb__after_spinlock();
  4246			 *   UNLOCK rq->lock
  4247			 *
  4248			 * [task p]
  4249			 *   STORE p->state = UNINTERRUPTIBLE	  LOAD p->on_rq
  4250			 *
  4251			 * Pairs with the LOCK+smp_mb__after_spinlock() on rq->lock in
  4252			 * __schedule().  See the comment for smp_mb__after_spinlock().
  4253			 *
  4254			 * A similar smp_rmb() lives in __task_needs_rq_lock().
  4255			 */
  4256			smp_rmb();
  4257			if (READ_ONCE(p->on_rq) && ttwu_runnable(p, wake_flags))
  4258				break;
  4259	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
