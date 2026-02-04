Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B8D3AE6F5;
	Wed,  4 Feb 2026 11:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770205222; cv=none; b=cOML6CvBNF4tlmBg+857fddcei3AEfpBI61PxbE91YOjLiDtq0QNii6hsjbLKfFlbx4BJfCoy5HotGrgvAXMGEWEHkiw6CkJJh2C+yS+rfZ8NLVUprLGPbzJ/4Z34syol0+3XukbGgoAaT5ZcpZ0P6NCiyDcGIThkLGtLuklXUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770205222; c=relaxed/simple;
	bh=aHZOysDVuDrQ4RbIHKTpDkNCExrvMH7LJkcIiGvbFH8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Bc3DbKn7EyOBLVpDskF0ANzjxDUsn37dEk/L4DV/cJ1+JX8Nl/v9HOSAlvt7lQQNJqDAEEhX2gYJoKF+0uFFWVvOkJZ2H+hrfzsEnzRp17XGNfYLkqY1L+hCkss83hgKCD3RKCzDKRjttXnYoebNnxxszyNcw1aB+S7zeusuOkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D9dMzcIe; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D9dMzcIe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770205222; x=1801741222;
  h=date:from:to:cc:subject:message-id;
  bh=aHZOysDVuDrQ4RbIHKTpDkNCExrvMH7LJkcIiGvbFH8=;
  b=D9dMzcIec9mteiDktym0MVmdvDyHe7kX1kBXloF7PLSn3K5reLreujS1
   Fm5KBXkmufOCFruN7j9ZFnpqfikYgJRJLushqX1OIgHkBgg5TVK++PzJ2
   gCbd++WQF92iHkuYIz4YNzkAGpkaoBf6cH4xHF1XsffGlB5+IKd74M5zk
   9Vf8BHIpx/6BxvxNZlhANsZ4HVvUsTW7dWIJQnLi9iq9dzl4wA9jSLTsg
   xXkql8eAD0qdRCju4QH3/ZrOYxZGWWrhyWOm+oE56OnzriRsCqoUNbXuR
   I6As81PGF8xBemp1mQ8Dv148yzCrRXGfqwnK0Ec4NaOenT0YakRFLV8J0
   Q==;
X-CSE-ConnectionGUID: szS79cybSQ6I9ppIDNAk5A==
X-CSE-MsgGUID: gxgkeR76T96FH3qOGVZ7yA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="82022013"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="82022013"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 03:40:21 -0800
X-CSE-ConnectionGUID: rP+iyO4uRsW9Zu+cJMqtrw==
X-CSE-MsgGUID: EIY1twswRWSvdOcwJO2AJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="214677188"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 04 Feb 2026 03:40:19 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnbF2-00000000hkO-3QEM;
	Wed, 04 Feb 2026 11:40:16 +0000
Date: Wed, 04 Feb 2026 19:39:27 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:trace_sched_wakeup_backtrace 322/322]
 kernel/sched/core.c:4229:21: error: invalid output size for constraint '+q'
Message-ID: <202602041917.61TC95P2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs trace_sched_wakeup_backtrace
head:   a392e986a4b52a65ef06eeec24c4adabefd4b830
commit: a392e986a4b52a65ef06eeec24c4adabefd4b830 [322/322] trace_sched_wakeup_backtrace
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20260204/202602041917.61TC95P2-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260204/202602041917.61TC95P2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602041917.61TC95P2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/core.c:4229:21: error: invalid output size for constraint '+q'
    4229 |             (sleep_start = xchg(&p->sleep_timestamp, 0)))
         |                            ^
   include/linux/atomic/atomic-instrumented.h:4758:2: note: expanded from macro 'xchg'
    4758 |         raw_xchg(__ai_ptr, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:12:18: note: expanded from macro 'raw_xchg'
      12 | #define raw_xchg arch_xchg
         |                  ^
   arch/x86/include/asm/cmpxchg.h:78:27: note: expanded from macro 'arch_xchg'
      78 | #define arch_xchg(ptr, v)       __xchg_op((ptr), (v), xchg, "")
         |                                 ^
   arch/x86/include/asm/cmpxchg.h:48:19: note: expanded from macro '__xchg_op'
      48 |                                       : "+q" (__ret), "+m" (*(ptr))     \
         |                                               ^
   kernel/sched/core.c:7869:12: warning: array index -1 is before the beginning of the array [-Warray-bounds]
    7869 |                                        preempt_modes[preempt_dynamic_mode] : "undef",
         |                                        ^             ~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:7844:1: note: array 'preempt_modes' declared here
    7844 | const char *preempt_modes[] = {
         | ^
   1 warning and 1 error generated.


vim +4229 kernel/sched/core.c

  4073	
  4074	/*
  4075	 * Notes on Program-Order guarantees on SMP systems.
  4076	 *
  4077	 *  MIGRATION
  4078	 *
  4079	 * The basic program-order guarantee on SMP systems is that when a task [t]
  4080	 * migrates, all its activity on its old CPU [c0] happens-before any subsequent
  4081	 * execution on its new CPU [c1].
  4082	 *
  4083	 * For migration (of runnable tasks) this is provided by the following means:
  4084	 *
  4085	 *  A) UNLOCK of the rq(c0)->lock scheduling out task t
  4086	 *  B) migration for t is required to synchronize *both* rq(c0)->lock and
  4087	 *     rq(c1)->lock (if not at the same time, then in that order).
  4088	 *  C) LOCK of the rq(c1)->lock scheduling in task
  4089	 *
  4090	 * Release/acquire chaining guarantees that B happens after A and C after B.
  4091	 * Note: the CPU doing B need not be c0 or c1
  4092	 *
  4093	 * Example:
  4094	 *
  4095	 *   CPU0            CPU1            CPU2
  4096	 *
  4097	 *   LOCK rq(0)->lock
  4098	 *   sched-out X
  4099	 *   sched-in Y
  4100	 *   UNLOCK rq(0)->lock
  4101	 *
  4102	 *                                   LOCK rq(0)->lock // orders against CPU0
  4103	 *                                   dequeue X
  4104	 *                                   UNLOCK rq(0)->lock
  4105	 *
  4106	 *                                   LOCK rq(1)->lock
  4107	 *                                   enqueue X
  4108	 *                                   UNLOCK rq(1)->lock
  4109	 *
  4110	 *                   LOCK rq(1)->lock // orders against CPU2
  4111	 *                   sched-out Z
  4112	 *                   sched-in X
  4113	 *                   UNLOCK rq(1)->lock
  4114	 *
  4115	 *
  4116	 *  BLOCKING -- aka. SLEEP + WAKEUP
  4117	 *
  4118	 * For blocking we (obviously) need to provide the same guarantee as for
  4119	 * migration. However the means are completely different as there is no lock
  4120	 * chain to provide order. Instead we do:
  4121	 *
  4122	 *   1) smp_store_release(X->on_cpu, 0)   -- finish_task()
  4123	 *   2) smp_cond_load_acquire(!X->on_cpu) -- try_to_wake_up()
  4124	 *
  4125	 * Example:
  4126	 *
  4127	 *   CPU0 (schedule)  CPU1 (try_to_wake_up) CPU2 (schedule)
  4128	 *
  4129	 *   LOCK rq(0)->lock LOCK X->pi_lock
  4130	 *   dequeue X
  4131	 *   sched-out X
  4132	 *   smp_store_release(X->on_cpu, 0);
  4133	 *
  4134	 *                    smp_cond_load_acquire(&X->on_cpu, !VAL);
  4135	 *                    X->state = WAKING
  4136	 *                    set_task_cpu(X,2)
  4137	 *
  4138	 *                    LOCK rq(2)->lock
  4139	 *                    enqueue X
  4140	 *                    X->state = RUNNING
  4141	 *                    UNLOCK rq(2)->lock
  4142	 *
  4143	 *                                          LOCK rq(2)->lock // orders against CPU1
  4144	 *                                          sched-out Z
  4145	 *                                          sched-in X
  4146	 *                                          UNLOCK rq(2)->lock
  4147	 *
  4148	 *                    UNLOCK X->pi_lock
  4149	 *   UNLOCK rq(0)->lock
  4150	 *
  4151	 *
  4152	 * However, for wakeups there is a second guarantee we must provide, namely we
  4153	 * must ensure that CONDITION=1 done by the caller can not be reordered with
  4154	 * accesses to the task state; see try_to_wake_up() and set_current_state().
  4155	 */
  4156	
  4157	/**
  4158	 * try_to_wake_up - wake up a thread
  4159	 * @p: the thread to be awakened
  4160	 * @state: the mask of task states that can be woken
  4161	 * @wake_flags: wake modifier flags (WF_*)
  4162	 *
  4163	 * Conceptually does:
  4164	 *
  4165	 *   If (@state & @p->state) @p->state = TASK_RUNNING.
  4166	 *
  4167	 * If the task was not queued/runnable, also place it back on a runqueue.
  4168	 *
  4169	 * This function is atomic against schedule() which would dequeue the task.
  4170	 *
  4171	 * It issues a full memory barrier before accessing @p->state, see the comment
  4172	 * with set_current_state().
  4173	 *
  4174	 * Uses p->pi_lock to serialize against concurrent wake-ups.
  4175	 *
  4176	 * Relies on p->pi_lock stabilizing:
  4177	 *  - p->sched_class
  4178	 *  - p->cpus_ptr
  4179	 *  - p->sched_task_group
  4180	 * in order to do migration, see its use of select_task_rq()/set_task_cpu().
  4181	 *
  4182	 * Tries really hard to only take one task_rq(p)->lock for performance.
  4183	 * Takes rq->lock in:
  4184	 *  - ttwu_runnable()    -- old rq, unavoidable, see comment there;
  4185	 *  - ttwu_queue()       -- new rq, for enqueue of the task;
  4186	 *  - psi_ttwu_dequeue() -- much sadness :-( accounting will kill us.
  4187	 *
  4188	 * As a consequence we race really badly with just about everything. See the
  4189	 * many memory barriers and their comments for details.
  4190	 *
  4191	 * Return: %true if @p->state changes (an actual wakeup was done),
  4192	 *	   %false otherwise.
  4193	 */
  4194	int try_to_wake_up(struct task_struct *p, unsigned int state, int wake_flags)
  4195	{
  4196		guard(preempt)();
  4197		int cpu, success = 0;
  4198	
  4199		wake_flags |= WF_TTWU;
  4200	
  4201		if (p == current) {
  4202			/*
  4203			 * We're waking current, this means 'p->on_rq' and 'task_cpu(p)
  4204			 * == smp_processor_id()'. Together this means we can special
  4205			 * case the whole 'p->on_rq && ttwu_runnable()' case below
  4206			 * without taking any locks.
  4207			 *
  4208			 * Specifically, given current runs ttwu() we must be before
  4209			 * schedule()'s block_task(), as such this must not observe
  4210			 * sched_delayed.
  4211			 *
  4212			 * In particular:
  4213			 *  - we rely on Program-Order guarantees for all the ordering,
  4214			 *  - we're serialized against set_special_state() by virtue of
  4215			 *    it disabling IRQs (this allows not taking ->pi_lock).
  4216			 */
  4217			WARN_ON_ONCE(p->se.sched_delayed);
  4218			if (!ttwu_state_match(p, state, &success))
  4219				goto out;
  4220	
  4221			trace_sched_waking(p);
  4222			ttwu_do_wakeup(p);
  4223			goto out;
  4224		}
  4225	
  4226		u64 sleep_start;
  4227		if (p->sleep_timestamp &&
  4228		    trace_sched_wakeup_backtrace_enabled() &&
> 4229		    (sleep_start = xchg(&p->sleep_timestamp, 0)))
  4230			do_trace_sched_wakeup_backtrace(p, sleep_start);
  4231	
  4232		/*
  4233		 * If we are going to wake up a thread waiting for CONDITION we
  4234		 * need to ensure that CONDITION=1 done by the caller can not be
  4235		 * reordered with p->state check below. This pairs with smp_store_mb()
  4236		 * in set_current_state() that the waiting thread does.
  4237		 */
  4238		scoped_guard (raw_spinlock_irqsave, &p->pi_lock) {
  4239			smp_mb__after_spinlock();
  4240			if (!ttwu_state_match(p, state, &success))
  4241				break;
  4242	
  4243			trace_sched_waking(p);
  4244	
  4245			/*
  4246			 * Ensure we load p->on_rq _after_ p->state, otherwise it would
  4247			 * be possible to, falsely, observe p->on_rq == 0 and get stuck
  4248			 * in smp_cond_load_acquire() below.
  4249			 *
  4250			 * sched_ttwu_pending()			try_to_wake_up()
  4251			 *   STORE p->on_rq = 1			  LOAD p->state
  4252			 *   UNLOCK rq->lock
  4253			 *
  4254			 * __schedule() (switch to task 'p')
  4255			 *   LOCK rq->lock			  smp_rmb();
  4256			 *   smp_mb__after_spinlock();
  4257			 *   UNLOCK rq->lock
  4258			 *
  4259			 * [task p]
  4260			 *   STORE p->state = UNINTERRUPTIBLE	  LOAD p->on_rq
  4261			 *
  4262			 * Pairs with the LOCK+smp_mb__after_spinlock() on rq->lock in
  4263			 * __schedule().  See the comment for smp_mb__after_spinlock().
  4264			 *
  4265			 * A similar smp_rmb() lives in __task_needs_rq_lock().
  4266			 */
  4267			smp_rmb();
  4268			if (READ_ONCE(p->on_rq) && ttwu_runnable(p, wake_flags))
  4269				break;
  4270	
  4271			/*
  4272			 * Ensure we load p->on_cpu _after_ p->on_rq, otherwise it would be
  4273			 * possible to, falsely, observe p->on_cpu == 0.
  4274			 *
  4275			 * One must be running (->on_cpu == 1) in order to remove oneself
  4276			 * from the runqueue.
  4277			 *
  4278			 * __schedule() (switch to task 'p')	try_to_wake_up()
  4279			 *   STORE p->on_cpu = 1		  LOAD p->on_rq
  4280			 *   UNLOCK rq->lock
  4281			 *
  4282			 * __schedule() (put 'p' to sleep)
  4283			 *   LOCK rq->lock			  smp_rmb();
  4284			 *   smp_mb__after_spinlock();
  4285			 *   STORE p->on_rq = 0			  LOAD p->on_cpu
  4286			 *
  4287			 * Pairs with the LOCK+smp_mb__after_spinlock() on rq->lock in
  4288			 * __schedule().  See the comment for smp_mb__after_spinlock().
  4289			 *
  4290			 * Form a control-dep-acquire with p->on_rq == 0 above, to ensure
  4291			 * schedule()'s deactivate_task() has 'happened' and p will no longer
  4292			 * care about it's own p->state. See the comment in __schedule().
  4293			 */
  4294			smp_acquire__after_ctrl_dep();
  4295	
  4296			/*
  4297			 * We're doing the wakeup (@success == 1), they did a dequeue (p->on_rq
  4298			 * == 0), which means we need to do an enqueue, change p->state to
  4299			 * TASK_WAKING such that we can unlock p->pi_lock before doing the
  4300			 * enqueue, such as ttwu_queue_wakelist().
  4301			 */
  4302			WRITE_ONCE(p->__state, TASK_WAKING);
  4303	
  4304			/*
  4305			 * If the owning (remote) CPU is still in the middle of schedule() with
  4306			 * this task as prev, considering queueing p on the remote CPUs wake_list
  4307			 * which potentially sends an IPI instead of spinning on p->on_cpu to
  4308			 * let the waker make forward progress. This is safe because IRQs are
  4309			 * disabled and the IPI will deliver after on_cpu is cleared.
  4310			 *
  4311			 * Ensure we load task_cpu(p) after p->on_cpu:
  4312			 *
  4313			 * set_task_cpu(p, cpu);
  4314			 *   STORE p->cpu = @cpu
  4315			 * __schedule() (switch to task 'p')
  4316			 *   LOCK rq->lock
  4317			 *   smp_mb__after_spin_lock()		smp_cond_load_acquire(&p->on_cpu)
  4318			 *   STORE p->on_cpu = 1		LOAD p->cpu
  4319			 *
  4320			 * to ensure we observe the correct CPU on which the task is currently
  4321			 * scheduling.
  4322			 */
  4323			if (smp_load_acquire(&p->on_cpu) &&
  4324			    ttwu_queue_wakelist(p, task_cpu(p), wake_flags))
  4325				break;
  4326	
  4327			/*
  4328			 * If the owning (remote) CPU is still in the middle of schedule() with
  4329			 * this task as prev, wait until it's done referencing the task.
  4330			 *
  4331			 * Pairs with the smp_store_release() in finish_task().
  4332			 *
  4333			 * This ensures that tasks getting woken will be fully ordered against
  4334			 * their previous state and preserve Program Order.
  4335			 */
  4336			smp_cond_load_acquire(&p->on_cpu, !VAL);
  4337	
  4338			cpu = select_task_rq(p, p->wake_cpu, &wake_flags);
  4339			if (task_cpu(p) != cpu) {
  4340				if (p->in_iowait) {
  4341					delayacct_blkio_end(p);
  4342					atomic_dec(&task_rq(p)->nr_iowait);
  4343				}
  4344	
  4345				wake_flags |= WF_MIGRATED;
  4346				psi_ttwu_dequeue(p);
  4347				set_task_cpu(p, cpu);
  4348			}
  4349	
  4350			ttwu_queue(p, cpu, wake_flags);
  4351		}
  4352	out:
  4353		if (success)
  4354			ttwu_stat(p, task_cpu(p), wake_flags);
  4355	
  4356		return success;
  4357	}
  4358	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
