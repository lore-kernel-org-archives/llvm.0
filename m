Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE258488;
	Mon,  3 Nov 2025 06:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762152535; cv=none; b=ltpLgDtm8HlWUmZiKftUoJ3jhbQnS9+ln6/ztf6Vbg0tkznk6+3nRdHDIlgg7sZW0fM2ubfxTgoGkqK+jC7gE9Ps5OaiPmTQD7w2dqb5Jr0v1B3OiGLyGCBwEqQcVjbJtQ9Zs9hgDlXBNK6zCOwhBT7qNaRui4uZAevisTiapEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762152535; c=relaxed/simple;
	bh=uNdjJEk7TfP59NrZsy1PEUxF6dimab1gt9jgQ7FlmEU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HiDrJlMi9OWBYIjPiCWLdQchTkE5yoWAeuOEKoWmOntBfuTjR2HH+6XbVHT5UAJxTgQYUINtVxFqETDAJsdXvd8tzybRrnL2XUWS4mwS5RYmRHHT3M+fcasJOC+zNWYPqDGo78x0qv/aZstXAo3mEj8xyQWgvbMbhKw5bhuXU4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cbrI8zw8; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cbrI8zw8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762152533; x=1793688533;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uNdjJEk7TfP59NrZsy1PEUxF6dimab1gt9jgQ7FlmEU=;
  b=cbrI8zw86BVv/YdpG7IJccHktPThctUa4J0wWx3L9MBS57SYqQXy/kzj
   5cxbRFOd6jYh3lxQVgugFS1pKY+5JI0F/d/FfCH3Dpb4UaDthOVLAL/EU
   lcnf/Jr1PLj4O8gJx5yxuuoXEOr1TWVkQrgkJAdSXmBU0YVl0UPcpn/eR
   o651Ip9Vne1Dz910xWphOoNU5t/chvOerEVzaITh0oHM3W02o/WfP/NPV
   TWaYKOrAjw7FM6X3SoaDv2RiPsingWACbeDeIrjlMsbCsm9S77sYEZKm1
   B0iUly6svXjnl/4sEtyI5crVtpvsGGX8DEE/4KZ4R9lADdaCibxC5ZiAX
   Q==;
X-CSE-ConnectionGUID: lyI4LAAsQx2HxWirc+iS4g==
X-CSE-MsgGUID: TLrNzBD2QjaA+aT5jvNABQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="64109421"
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; 
   d="scan'208";a="64109421"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2025 22:48:53 -0800
X-CSE-ConnectionGUID: 9cFBXXNvQfiezGWLAfElhg==
X-CSE-MsgGUID: aXdt5RTUSLuBB9lk7X84iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; 
   d="scan'208";a="186076256"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 02 Nov 2025 22:48:52 -0800
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vFoMz-000000001ce-31WB;
	Mon, 03 Nov 2025 06:48:49 +0000
Date: Mon, 3 Nov 2025 07:48:45 +0100
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Chao Yu <chao@kernel.org>
Subject: [chao:locking 5/5] kernel/locking/rwsem.c:1008:3: error: expected ')'
Message-ID: <202511030722.ZKzKgank-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git locking
head:   cbce0966b2c1f7cc06b410bac3d96ae003a7bc8a
commit: cbce0966b2c1f7cc06b410bac3d96ae003a7bc8a [5/5] rwsem: clean up code
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251103/202511030722.ZKzKgank-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251103/202511030722.ZKzKgank-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511030722.ZKzKgank-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/locking/rwsem.c:1008:3: error: expected ')'
    1008 |                 goto queue;
         |                 ^
   kernel/locking/rwsem.c:1005:5: note: to match this '('
    1005 |         if ((count & (RWSEM_WRITER_LOCKED | RWSEM_FLAG_HANDOFF)) ||
         |            ^
   1 error generated.


vim +1008 kernel/locking/rwsem.c

54c1ee4d614d528 Waiman Long    2022-03-22   988  
5dec94d4923683b Waiman Long    2019-05-20   989  /*
5dec94d4923683b Waiman Long    2019-05-20   990   * Wait for the read lock to be granted
5dec94d4923683b Waiman Long    2019-05-20   991   */
6cef7ff6e43cbdb Waiman Long    2019-05-20   992  static struct rw_semaphore __sched *
2f064a59a11ff9b Peter Zijlstra 2021-06-11   993  rwsem_down_read_slowpath(struct rw_semaphore *sem, long count, unsigned int state)
5dec94d4923683b Waiman Long    2019-05-20   994  {
617f3ef95177840 Waiman Long    2020-11-20   995  	long adjustment = -RWSEM_READER_BIAS;
2f06f702925b512 Waiman Long    2020-11-20   996  	long rcnt = (count >> RWSEM_READER_SHIFT);
5dec94d4923683b Waiman Long    2019-05-20   997  	struct rwsem_waiter waiter;
5dec94d4923683b Waiman Long    2019-05-20   998  	DEFINE_WAKE_Q(wake_q);
5dec94d4923683b Waiman Long    2019-05-20   999  
2f06f702925b512 Waiman Long    2020-11-20  1000  	/*
2f06f702925b512 Waiman Long    2020-11-20  1001  	 * To prevent a constant stream of readers from starving a sleeping
d566c78659eccf0 Waiman Long    2024-02-22  1002  	 * writer, don't attempt optimistic lock stealing if the lock is
d566c78659eccf0 Waiman Long    2024-02-22  1003  	 * very likely owned by readers.
2f06f702925b512 Waiman Long    2020-11-20  1004  	 */
cbce0966b2c1f7c Chao Yu        2025-10-31  1005  	if ((count & (RWSEM_WRITER_LOCKED | RWSEM_FLAG_HANDOFF)) ||
cbce0966b2c1f7c Chao Yu        2025-10-31  1006  	    ((atomic_long_read(&sem->owner) & RWSEM_READER_OWNED) &&
cbce0966b2c1f7c Chao Yu        2025-10-31  1007  	    (rcnt > 1))
2f06f702925b512 Waiman Long    2020-11-20 @1008  		goto queue;
2f06f702925b512 Waiman Long    2020-11-20  1009  
1a728dff855a318 Waiman Long    2020-11-20  1010  	/*
617f3ef95177840 Waiman Long    2020-11-20  1011  	 * Reader optimistic lock stealing.
1a728dff855a318 Waiman Long    2020-11-20  1012  	 */
1a728dff855a318 Waiman Long    2020-11-20  1013  	rwsem_set_reader_owned(sem);
1a728dff855a318 Waiman Long    2020-11-20  1014  	lockevent_inc(rwsem_rlock_steal);
5cfd92e12e13432 Waiman Long    2019-05-20  1015  
cf69482d62d996d Waiman Long    2019-05-20  1016  	/*
cbce0966b2c1f7c Chao Yu        2025-10-31  1017  	 * Wake up other readers in the wait queue if it is the first reader.
cf69482d62d996d Waiman Long    2019-05-20  1018  	 */
617f3ef95177840 Waiman Long    2020-11-20  1019  	if ((rcnt == 1) && (count & RWSEM_FLAG_WAITERS)) {
cf69482d62d996d Waiman Long    2019-05-20  1020  		raw_spin_lock_irq(&sem->wait_lock);
cf69482d62d996d Waiman Long    2019-05-20  1021  		if (!list_empty(&sem->wait_list))
cbce0966b2c1f7c Chao Yu        2025-10-31  1022  			rwsem_mark_wake(sem, RWSEM_WAKE_READ_OWNED, &wake_q);
cf69482d62d996d Waiman Long    2019-05-20  1023  		raw_spin_unlock_irq(&sem->wait_lock);
cf69482d62d996d Waiman Long    2019-05-20  1024  		wake_up_q(&wake_q);
cf69482d62d996d Waiman Long    2019-05-20  1025  	}
cf69482d62d996d Waiman Long    2019-05-20  1026  	return sem;
cf69482d62d996d Waiman Long    2019-05-20  1027  
cf69482d62d996d Waiman Long    2019-05-20  1028  queue:
5dec94d4923683b Waiman Long    2019-05-20  1029  	waiter.task = current;
5dec94d4923683b Waiman Long    2019-05-20  1030  	waiter.type = RWSEM_WAITING_FOR_READ;
4f23dbc1e657951 Waiman Long    2019-05-20  1031  	waiter.timeout = jiffies + RWSEM_WAIT_TIMEOUT;
6eebd5fb20838f5 Waiman Long    2022-06-22  1032  	waiter.handoff_set = false;
5dec94d4923683b Waiman Long    2019-05-20  1033  
5dec94d4923683b Waiman Long    2019-05-20  1034  	raw_spin_lock_irq(&sem->wait_lock);
5dec94d4923683b Waiman Long    2019-05-20  1035  	if (list_empty(&sem->wait_list)) {
5dec94d4923683b Waiman Long    2019-05-20  1036  		/*
5dec94d4923683b Waiman Long    2019-05-20  1037  		 * In case the wait queue is empty and the lock isn't owned
f9e21aa9e6fb113 Waiman Long    2022-03-22  1038  		 * by a writer, this reader can exit the slowpath and return
f9e21aa9e6fb113 Waiman Long    2022-03-22  1039  		 * immediately as its RWSEM_READER_BIAS has already been set
f9e21aa9e6fb113 Waiman Long    2022-03-22  1040  		 * in the count.
5dec94d4923683b Waiman Long    2019-05-20  1041  		 */
f9e21aa9e6fb113 Waiman Long    2022-03-22  1042  		if (!(atomic_long_read(&sem->count) & RWSEM_WRITER_MASK)) {
e1b98fa31664842 Jan Stancek    2019-07-18  1043  			/* Provide lock ACQUIRE */
e1b98fa31664842 Jan Stancek    2019-07-18  1044  			smp_acquire__after_ctrl_dep();
5dec94d4923683b Waiman Long    2019-05-20  1045  			raw_spin_unlock_irq(&sem->wait_lock);
5dec94d4923683b Waiman Long    2019-05-20  1046  			rwsem_set_reader_owned(sem);
5dec94d4923683b Waiman Long    2019-05-20  1047  			lockevent_inc(rwsem_rlock_fast);
5dec94d4923683b Waiman Long    2019-05-20  1048  			return sem;
5dec94d4923683b Waiman Long    2019-05-20  1049  		}
5dec94d4923683b Waiman Long    2019-05-20  1050  		adjustment += RWSEM_FLAG_WAITERS;
5dec94d4923683b Waiman Long    2019-05-20  1051  	}
d257cc8cb8d5355 Waiman Long    2021-11-15  1052  	rwsem_add_waiter(sem, &waiter);
5dec94d4923683b Waiman Long    2019-05-20  1053  
5dec94d4923683b Waiman Long    2019-05-20  1054  	/* we're now waiting on the lock, but no longer actively locking */
5dec94d4923683b Waiman Long    2019-05-20  1055  	count = atomic_long_add_return(adjustment, &sem->count);
5dec94d4923683b Waiman Long    2019-05-20  1056  
54c1ee4d614d528 Waiman Long    2022-03-22  1057  	rwsem_cond_wake_waiter(sem, count, &wake_q);
5dec94d4923683b Waiman Long    2019-05-20  1058  	raw_spin_unlock_irq(&sem->wait_lock);
54c1ee4d614d528 Waiman Long    2022-03-22  1059  
54c1ee4d614d528 Waiman Long    2022-03-22  1060  	if (!wake_q_empty(&wake_q))
5dec94d4923683b Waiman Long    2019-05-20  1061  		wake_up_q(&wake_q);
5dec94d4923683b Waiman Long    2019-05-20  1062  
ee042be16cb4551 Namhyung Kim   2022-03-22  1063  	trace_contention_begin(sem, LCB_F_READ);
77da18de55ac641 Lance Yang     2025-06-27  1064  	set_current_state(state);
77da18de55ac641 Lance Yang     2025-06-27  1065  
77da18de55ac641 Lance Yang     2025-06-27  1066  	if (state == TASK_UNINTERRUPTIBLE)
77da18de55ac641 Lance Yang     2025-06-27  1067  		hung_task_set_blocker(sem, BLOCKER_TYPE_RWSEM_READER);
ee042be16cb4551 Namhyung Kim   2022-03-22  1068  
5dec94d4923683b Waiman Long    2019-05-20  1069  	/* wait to be given the lock */
6ffddfb9e1de21c Peter Zijlstra 2019-07-18  1070  	for (;;) {
99143f82a255e7f Peter Zijlstra 2019-07-18  1071  		if (!smp_load_acquire(&waiter.task)) {
6ffddfb9e1de21c Peter Zijlstra 2019-07-18  1072  			/* Matches rwsem_mark_wake()'s smp_store_release(). */
5dec94d4923683b Waiman Long    2019-05-20  1073  			break;
99143f82a255e7f Peter Zijlstra 2019-07-18  1074  		}
5dec94d4923683b Waiman Long    2019-05-20  1075  		if (signal_pending_state(state, current)) {
5dec94d4923683b Waiman Long    2019-05-20  1076  			raw_spin_lock_irq(&sem->wait_lock);
5dec94d4923683b Waiman Long    2019-05-20  1077  			if (waiter.task)
5dec94d4923683b Waiman Long    2019-05-20  1078  				goto out_nolock;
5dec94d4923683b Waiman Long    2019-05-20  1079  			raw_spin_unlock_irq(&sem->wait_lock);
6ffddfb9e1de21c Peter Zijlstra 2019-07-18  1080  			/* Ordered by sem->wait_lock against rwsem_mark_wake(). */
5dec94d4923683b Waiman Long    2019-05-20  1081  			break;
5dec94d4923683b Waiman Long    2019-05-20  1082  		}
3f5245538a1964a Waiman Long    2023-01-25  1083  		schedule_preempt_disabled();
5dec94d4923683b Waiman Long    2019-05-20  1084  		lockevent_inc(rwsem_sleep_reader);
77da18de55ac641 Lance Yang     2025-06-27  1085  		set_current_state(state);
5dec94d4923683b Waiman Long    2019-05-20  1086  	}
5dec94d4923683b Waiman Long    2019-05-20  1087  
77da18de55ac641 Lance Yang     2025-06-27  1088  	if (state == TASK_UNINTERRUPTIBLE)
77da18de55ac641 Lance Yang     2025-06-27  1089  		hung_task_clear_blocker();
77da18de55ac641 Lance Yang     2025-06-27  1090  
5dec94d4923683b Waiman Long    2019-05-20  1091  	__set_current_state(TASK_RUNNING);
5dec94d4923683b Waiman Long    2019-05-20  1092  	lockevent_inc(rwsem_rlock);
ee042be16cb4551 Namhyung Kim   2022-03-22  1093  	trace_contention_end(sem, 0);
5dec94d4923683b Waiman Long    2019-05-20  1094  	return sem;
6ffddfb9e1de21c Peter Zijlstra 2019-07-18  1095  
5dec94d4923683b Waiman Long    2019-05-20  1096  out_nolock:
1ee326196c66583 Waiman Long    2022-03-22  1097  	rwsem_del_wake_waiter(sem, &waiter, &wake_q);
5dec94d4923683b Waiman Long    2019-05-20  1098  	__set_current_state(TASK_RUNNING);
5dec94d4923683b Waiman Long    2019-05-20  1099  	lockevent_inc(rwsem_rlock_fail);
ee042be16cb4551 Namhyung Kim   2022-03-22  1100  	trace_contention_end(sem, -EINTR);
5dec94d4923683b Waiman Long    2019-05-20  1101  	return ERR_PTR(-EINTR);
5dec94d4923683b Waiman Long    2019-05-20  1102  }
5dec94d4923683b Waiman Long    2019-05-20  1103  

:::::: The code at line 1008 was first introduced by commit
:::::: 2f06f702925b512a95b95dca3855549c047eef58 locking/rwsem: Prevent potential lock starvation

:::::: TO: Waiman Long <longman@redhat.com>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
