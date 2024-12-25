Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C43913B2A5;
	Wed, 25 Dec 2024 18:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735150673; cv=none; b=oVm3aWgcjE3Bd8D7IRvxwVFYHA0Mhq27e36j9AbIQsEtSoTwRUBddJ8k/nb+0gGoHV7DPEoWYLCPGiwIED2sEncmkST/RJ56i4CGoy8cIkrg3333uVIwxqK1gI9tm7OgRt3kNy76GgQIjAKLcyHV2Qt0bfH5Mjw13UtyI/F2aQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735150673; c=relaxed/simple;
	bh=O87NdZ7ftAaeOhqfrhxZbFf55Gkq8PSH+xdtYjXJNGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oNihpYHYXmLG+pw0fcSGy7YmegzzvnqsyXYxmPoNRJhZDIus0r+LK4gomicdtRmDAlhDUJQKDs85Mt2gU81FkwlweVeaLtJp8wLpDwRwlIaVm+vOAN3pSsZlTrefGP5sjJvIovX8ZGjVMyMaHRHxgKNwcHEw/3i6SnU1eGJvMPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aOAqKv0u; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aOAqKv0u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735150671; x=1766686671;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O87NdZ7ftAaeOhqfrhxZbFf55Gkq8PSH+xdtYjXJNGQ=;
  b=aOAqKv0uDnOwBoCQlOyqZYxzp/r4YdtNsWlZLzY+hf+3uneX0YBXW4my
   skWAu3BZDbmrUWOZhwPJu08XCAKZ14/CcIcoORatf64OVp4VRxbzm3byb
   zI/bQ4yW9kxRFav9QPKhojXtsRo8cO52yRrYAXBa+WX/lhgJnrmsp+hdG
   WyL1UPM0IGgZBsVE1h9fs4VORXRGoT15BmVwXtalcH6J6mr608heezNvp
   llMrTKYzngHLJaFbPyjXJYCCmfuPNd0hLjbBo/D+e52oxbQBf5wpwpWg9
   TldDh+D/U7vxnmZk6EdiaDG/yQFXl1xDmcJyf6hUBV/MpKid05s46ZL+i
   Q==;
X-CSE-ConnectionGUID: MU6zaJGPTSqMZt0USUJD1A==
X-CSE-MsgGUID: 31UKTG7QTCyOYh27CH13Bg==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="46963649"
X-IronPort-AV: E=Sophos;i="6.12,264,1728975600"; 
   d="scan'208";a="46963649"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2024 10:17:49 -0800
X-CSE-ConnectionGUID: 1NcqmMnTQsydH1QrPx9Rew==
X-CSE-MsgGUID: AGonPbgERJC59uFt4C4mRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="104834464"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 25 Dec 2024 10:17:48 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQVx3-00024H-0a;
	Wed, 25 Dec 2024 18:17:45 +0000
Date: Thu, 26 Dec 2024 02:17:30 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 243/244] kernel/sched/core.c:4223:21:
 error: invalid output size for constraint '+q'
Message-ID: <202412260230.yEiwArnA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   ee700aec23eddf1b8416272cead7550a8b6398a8
commit: a31d023910a734e2aeabbee70c13858632ed16ff [243/244] trace_sched_wakeup_backtrace
config: i386-buildonly-randconfig-001-20241226 (https://download.01.org/0day-ci/archive/20241226/202412260230.yEiwArnA-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241226/202412260230.yEiwArnA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412260230.yEiwArnA-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/core.c:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> kernel/sched/core.c:4223:21: error: invalid output size for constraint '+q'
    4223 |             (sleep_start = xchg(&p->sleep_timestamp, 0)))
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
   1 warning and 1 error generated.


vim +4223 kernel/sched/core.c

  4067	
  4068	/*
  4069	 * Notes on Program-Order guarantees on SMP systems.
  4070	 *
  4071	 *  MIGRATION
  4072	 *
  4073	 * The basic program-order guarantee on SMP systems is that when a task [t]
  4074	 * migrates, all its activity on its old CPU [c0] happens-before any subsequent
  4075	 * execution on its new CPU [c1].
  4076	 *
  4077	 * For migration (of runnable tasks) this is provided by the following means:
  4078	 *
  4079	 *  A) UNLOCK of the rq(c0)->lock scheduling out task t
  4080	 *  B) migration for t is required to synchronize *both* rq(c0)->lock and
  4081	 *     rq(c1)->lock (if not at the same time, then in that order).
  4082	 *  C) LOCK of the rq(c1)->lock scheduling in task
  4083	 *
  4084	 * Release/acquire chaining guarantees that B happens after A and C after B.
  4085	 * Note: the CPU doing B need not be c0 or c1
  4086	 *
  4087	 * Example:
  4088	 *
  4089	 *   CPU0            CPU1            CPU2
  4090	 *
  4091	 *   LOCK rq(0)->lock
  4092	 *   sched-out X
  4093	 *   sched-in Y
  4094	 *   UNLOCK rq(0)->lock
  4095	 *
  4096	 *                                   LOCK rq(0)->lock // orders against CPU0
  4097	 *                                   dequeue X
  4098	 *                                   UNLOCK rq(0)->lock
  4099	 *
  4100	 *                                   LOCK rq(1)->lock
  4101	 *                                   enqueue X
  4102	 *                                   UNLOCK rq(1)->lock
  4103	 *
  4104	 *                   LOCK rq(1)->lock // orders against CPU2
  4105	 *                   sched-out Z
  4106	 *                   sched-in X
  4107	 *                   UNLOCK rq(1)->lock
  4108	 *
  4109	 *
  4110	 *  BLOCKING -- aka. SLEEP + WAKEUP
  4111	 *
  4112	 * For blocking we (obviously) need to provide the same guarantee as for
  4113	 * migration. However the means are completely different as there is no lock
  4114	 * chain to provide order. Instead we do:
  4115	 *
  4116	 *   1) smp_store_release(X->on_cpu, 0)   -- finish_task()
  4117	 *   2) smp_cond_load_acquire(!X->on_cpu) -- try_to_wake_up()
  4118	 *
  4119	 * Example:
  4120	 *
  4121	 *   CPU0 (schedule)  CPU1 (try_to_wake_up) CPU2 (schedule)
  4122	 *
  4123	 *   LOCK rq(0)->lock LOCK X->pi_lock
  4124	 *   dequeue X
  4125	 *   sched-out X
  4126	 *   smp_store_release(X->on_cpu, 0);
  4127	 *
  4128	 *                    smp_cond_load_acquire(&X->on_cpu, !VAL);
  4129	 *                    X->state = WAKING
  4130	 *                    set_task_cpu(X,2)
  4131	 *
  4132	 *                    LOCK rq(2)->lock
  4133	 *                    enqueue X
  4134	 *                    X->state = RUNNING
  4135	 *                    UNLOCK rq(2)->lock
  4136	 *
  4137	 *                                          LOCK rq(2)->lock // orders against CPU1
  4138	 *                                          sched-out Z
  4139	 *                                          sched-in X
  4140	 *                                          UNLOCK rq(2)->lock
  4141	 *
  4142	 *                    UNLOCK X->pi_lock
  4143	 *   UNLOCK rq(0)->lock
  4144	 *
  4145	 *
  4146	 * However, for wakeups there is a second guarantee we must provide, namely we
  4147	 * must ensure that CONDITION=1 done by the caller can not be reordered with
  4148	 * accesses to the task state; see try_to_wake_up() and set_current_state().
  4149	 */
  4150	
  4151	/**
  4152	 * try_to_wake_up - wake up a thread
  4153	 * @p: the thread to be awakened
  4154	 * @state: the mask of task states that can be woken
  4155	 * @wake_flags: wake modifier flags (WF_*)
  4156	 *
  4157	 * Conceptually does:
  4158	 *
  4159	 *   If (@state & @p->state) @p->state = TASK_RUNNING.
  4160	 *
  4161	 * If the task was not queued/runnable, also place it back on a runqueue.
  4162	 *
  4163	 * This function is atomic against schedule() which would dequeue the task.
  4164	 *
  4165	 * It issues a full memory barrier before accessing @p->state, see the comment
  4166	 * with set_current_state().
  4167	 *
  4168	 * Uses p->pi_lock to serialize against concurrent wake-ups.
  4169	 *
  4170	 * Relies on p->pi_lock stabilizing:
  4171	 *  - p->sched_class
  4172	 *  - p->cpus_ptr
  4173	 *  - p->sched_task_group
  4174	 * in order to do migration, see its use of select_task_rq()/set_task_cpu().
  4175	 *
  4176	 * Tries really hard to only take one task_rq(p)->lock for performance.
  4177	 * Takes rq->lock in:
  4178	 *  - ttwu_runnable()    -- old rq, unavoidable, see comment there;
  4179	 *  - ttwu_queue()       -- new rq, for enqueue of the task;
  4180	 *  - psi_ttwu_dequeue() -- much sadness :-( accounting will kill us.
  4181	 *
  4182	 * As a consequence we race really badly with just about everything. See the
  4183	 * many memory barriers and their comments for details.
  4184	 *
  4185	 * Return: %true if @p->state changes (an actual wakeup was done),
  4186	 *	   %false otherwise.
  4187	 */
  4188	int try_to_wake_up(struct task_struct *p, unsigned int state, int wake_flags)
  4189	{
  4190		guard(preempt)();
  4191		int cpu, success = 0;
  4192	
  4193		wake_flags |= WF_TTWU;
  4194	
  4195		if (p == current) {
  4196			/*
  4197			 * We're waking current, this means 'p->on_rq' and 'task_cpu(p)
  4198			 * == smp_processor_id()'. Together this means we can special
  4199			 * case the whole 'p->on_rq && ttwu_runnable()' case below
  4200			 * without taking any locks.
  4201			 *
  4202			 * Specifically, given current runs ttwu() we must be before
  4203			 * schedule()'s block_task(), as such this must not observe
  4204			 * sched_delayed.
  4205			 *
  4206			 * In particular:
  4207			 *  - we rely on Program-Order guarantees for all the ordering,
  4208			 *  - we're serialized against set_special_state() by virtue of
  4209			 *    it disabling IRQs (this allows not taking ->pi_lock).
  4210			 */
  4211			SCHED_WARN_ON(p->se.sched_delayed);
  4212			if (!ttwu_state_match(p, state, &success))
  4213				goto out;
  4214	
  4215			trace_sched_waking(p);
  4216			ttwu_do_wakeup(p);
  4217			goto out;
  4218		}
  4219	
  4220		u64 sleep_start;
  4221		if (p->sleep_timestamp &&
  4222		    trace_sched_wakeup_backtrace_enabled() &&
> 4223		    (sleep_start = xchg(&p->sleep_timestamp, 0)))
  4224			do_trace_sched_wakeup_backtrace(p, sleep_start);
  4225	
  4226		/*
  4227		 * If we are going to wake up a thread waiting for CONDITION we
  4228		 * need to ensure that CONDITION=1 done by the caller can not be
  4229		 * reordered with p->state check below. This pairs with smp_store_mb()
  4230		 * in set_current_state() that the waiting thread does.
  4231		 */
  4232		scoped_guard (raw_spinlock_irqsave, &p->pi_lock) {
  4233			smp_mb__after_spinlock();
  4234			if (!ttwu_state_match(p, state, &success))
  4235				break;
  4236	
  4237			trace_sched_waking(p);
  4238	
  4239			/*
  4240			 * Ensure we load p->on_rq _after_ p->state, otherwise it would
  4241			 * be possible to, falsely, observe p->on_rq == 0 and get stuck
  4242			 * in smp_cond_load_acquire() below.
  4243			 *
  4244			 * sched_ttwu_pending()			try_to_wake_up()
  4245			 *   STORE p->on_rq = 1			  LOAD p->state
  4246			 *   UNLOCK rq->lock
  4247			 *
  4248			 * __schedule() (switch to task 'p')
  4249			 *   LOCK rq->lock			  smp_rmb();
  4250			 *   smp_mb__after_spinlock();
  4251			 *   UNLOCK rq->lock
  4252			 *
  4253			 * [task p]
  4254			 *   STORE p->state = UNINTERRUPTIBLE	  LOAD p->on_rq
  4255			 *
  4256			 * Pairs with the LOCK+smp_mb__after_spinlock() on rq->lock in
  4257			 * __schedule().  See the comment for smp_mb__after_spinlock().
  4258			 *
  4259			 * A similar smp_rmb() lives in __task_needs_rq_lock().
  4260			 */
  4261			smp_rmb();
  4262			if (READ_ONCE(p->on_rq) && ttwu_runnable(p, wake_flags))
  4263				break;
  4264	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
