Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33F7186601;
	Mon,  2 Sep 2024 08:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725264053; cv=none; b=RALg0prtcKeUbEJzn5bKoAsNUqc7zKpJO0OO0GU0yNun+ZQH2feD6QbjK6eM8M9eNiLB4dj0SaVAXwT31YulnmTs0ksFQDNjBvdX4I63MW3UMPBkGWwbUizSM2sOMfma7BD/kz9OTppI/y3CBdNy6U4S/horRttEPo1E6BlaWrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725264053; c=relaxed/simple;
	bh=NvqryvRKitI7M9N3k9MKG0f4pp7CV7M8z5GOIxJpEkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QEhHskx9WTbnGAZ88hdtG10c9Q481nd4tia3JUFMjglQp+LyUr3ZHbZ+gqQy/YEu7BtGN8EhG1elgyN8S6+iSnbLINF6+uURzf7BwXszI8eduVeQvwve1Rn/KEsEDKNt2DmhaA9ejicLcTqYWu5GMUq+A7FYLDCCbIxDFgsp9Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EXy6sYyS; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EXy6sYyS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725264051; x=1756800051;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NvqryvRKitI7M9N3k9MKG0f4pp7CV7M8z5GOIxJpEkQ=;
  b=EXy6sYySeLRnMUiw43rFwBvyLrM9mUp7XzGF50M9YodgL8g4paPozFC5
   iC14gMEHXtw61DKiHD2q5eJcge81wFPQzTOKBIv4u+ud9C6D0moiQTWDG
   9Ax0b7hBXTiQlfFHQF0MAwFOKbIrL3wXyDhMf8SyIeERKFfZWXDj1PWIP
   IYA20FMxWj2lckd0NCibpB07n/MfYSSXu0f8Akk1MQvJykpOFJ3s7nLST
   LN49EJpNs+pYfMtYtVyeEj0UX6Xm0rnwDNolYSSAMF3k86ycBSvZdEd+f
   4vFYii2oUFJapmzHJVs4CB/7CQYSYoDHwYmftn+J9I2UzlLv0OL2/KvaH
   w==;
X-CSE-ConnectionGUID: XWNHAuYRTSSX2aXZbj7WDQ==
X-CSE-MsgGUID: 7SXt/9DhSBO570VVIwmVsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="23993242"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="23993242"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 01:00:49 -0700
X-CSE-ConnectionGUID: h7XGiwDMQCOS53dh7Oa5vw==
X-CSE-MsgGUID: 1Uis6S7hT+K4SjTXVKVu4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="69344742"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 02 Sep 2024 01:00:47 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sl1zR-0005HA-1s;
	Mon, 02 Sep 2024 08:00:45 +0000
Date: Mon, 2 Sep 2024 16:00:05 +0800
From: kernel test robot <lkp@intel.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 5/5] sched/fair: Add push task callback for EAS
Message-ID: <202409021537.6ml3xfzW-lkp@intel.com>
References: <20240830130309.2141697-6-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830130309.2141697-6-vincent.guittot@linaro.org>

Hi Vincent,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on peterz-queue/sched/core next-20240830]
[cannot apply to linus/master v6.11-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vincent-Guittot/sched-fair-Filter-false-overloaded_group-case-for-EAS/20240830-210826
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20240830130309.2141697-6-vincent.guittot%40linaro.org
patch subject: [RFC PATCH 5/5] sched/fair: Add push task callback for EAS
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20240902/202409021537.6ml3xfzW-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240902/202409021537.6ml3xfzW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409021537.6ml3xfzW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/fair.c:28:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from kernel/sched/fair.c:28:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from kernel/sched/fair.c:28:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> kernel/sched/fair.c:13225:2: error: call to undeclared function 'check_misfit_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    13225 |         check_misfit_cpu(curr, rq);
          |         ^
>> kernel/sched/fair.c:13417:27: error: no member named 'pushable_tasks' in 'struct cfs_rq'
    13417 |         plist_head_init(&cfs_rq->pushable_tasks);
          |                          ~~~~~~  ^
   12 warnings and 2 errors generated.


vim +/check_misfit_cpu +13225 kernel/sched/fair.c

 13198	
 13199	/*
 13200	 * scheduler tick hitting a task of our scheduling class.
 13201	 *
 13202	 * NOTE: This function can be called remotely by the tick offload that
 13203	 * goes along full dynticks. Therefore no local assumption can be made
 13204	 * and everything must be accessed through the @rq and @curr passed in
 13205	 * parameters.
 13206	 */
 13207	static void task_tick_fair(struct rq *rq, struct task_struct *curr, int queued)
 13208	{
 13209		struct cfs_rq *cfs_rq;
 13210		struct sched_entity *se = &curr->se;
 13211	
 13212		for_each_sched_entity(se) {
 13213			cfs_rq = cfs_rq_of(se);
 13214			entity_tick(cfs_rq, se, queued);
 13215		}
 13216	
 13217		if (static_branch_unlikely(&sched_numa_balancing))
 13218			task_tick_numa(rq, curr);
 13219	
 13220		update_misfit_status(curr, rq);
 13221		check_update_overutilized_status(task_rq(curr));
 13222	
 13223		task_tick_core(rq, curr);
 13224	
 13225		check_misfit_cpu(curr, rq);
 13226	}
 13227	
 13228	/*
 13229	 * called on fork with the child task as argument from the parent's context
 13230	 *  - child not yet on the tasklist
 13231	 *  - preemption disabled
 13232	 */
 13233	static void task_fork_fair(struct task_struct *p)
 13234	{
 13235		set_task_max_allowed_capacity(p);
 13236	}
 13237	
 13238	/*
 13239	 * Priority of the task has changed. Check to see if we preempt
 13240	 * the current task.
 13241	 */
 13242	static void
 13243	prio_changed_fair(struct rq *rq, struct task_struct *p, int oldprio)
 13244	{
 13245		if (!task_on_rq_queued(p))
 13246			return;
 13247	
 13248		if (rq->cfs.nr_running == 1)
 13249			return;
 13250	
 13251		/*
 13252		 * Reschedule if we are currently running on this runqueue and
 13253		 * our priority decreased, or if we are not currently running on
 13254		 * this runqueue and our priority is higher than the current's
 13255		 */
 13256		if (task_current(rq, p)) {
 13257			if (p->prio > oldprio)
 13258				resched_curr(rq);
 13259		} else
 13260			wakeup_preempt(rq, p, 0);
 13261	}
 13262	
 13263	#ifdef CONFIG_FAIR_GROUP_SCHED
 13264	/*
 13265	 * Propagate the changes of the sched_entity across the tg tree to make it
 13266	 * visible to the root
 13267	 */
 13268	static void propagate_entity_cfs_rq(struct sched_entity *se)
 13269	{
 13270		struct cfs_rq *cfs_rq = cfs_rq_of(se);
 13271	
 13272		if (cfs_rq_throttled(cfs_rq))
 13273			return;
 13274	
 13275		if (!throttled_hierarchy(cfs_rq))
 13276			list_add_leaf_cfs_rq(cfs_rq);
 13277	
 13278		/* Start to propagate at parent */
 13279		se = se->parent;
 13280	
 13281		for_each_sched_entity(se) {
 13282			cfs_rq = cfs_rq_of(se);
 13283	
 13284			update_load_avg(cfs_rq, se, UPDATE_TG);
 13285	
 13286			if (cfs_rq_throttled(cfs_rq))
 13287				break;
 13288	
 13289			if (!throttled_hierarchy(cfs_rq))
 13290				list_add_leaf_cfs_rq(cfs_rq);
 13291		}
 13292	}
 13293	#else
 13294	static void propagate_entity_cfs_rq(struct sched_entity *se) { }
 13295	#endif
 13296	
 13297	static void detach_entity_cfs_rq(struct sched_entity *se)
 13298	{
 13299		struct cfs_rq *cfs_rq = cfs_rq_of(se);
 13300	
 13301	#ifdef CONFIG_SMP
 13302		/*
 13303		 * In case the task sched_avg hasn't been attached:
 13304		 * - A forked task which hasn't been woken up by wake_up_new_task().
 13305		 * - A task which has been woken up by try_to_wake_up() but is
 13306		 *   waiting for actually being woken up by sched_ttwu_pending().
 13307		 */
 13308		if (!se->avg.last_update_time)
 13309			return;
 13310	#endif
 13311	
 13312		/* Catch up with the cfs_rq and remove our load when we leave */
 13313		update_load_avg(cfs_rq, se, 0);
 13314		detach_entity_load_avg(cfs_rq, se);
 13315		update_tg_load_avg(cfs_rq);
 13316		propagate_entity_cfs_rq(se);
 13317	}
 13318	
 13319	static void attach_entity_cfs_rq(struct sched_entity *se)
 13320	{
 13321		struct cfs_rq *cfs_rq = cfs_rq_of(se);
 13322	
 13323		/* Synchronize entity with its cfs_rq */
 13324		update_load_avg(cfs_rq, se, sched_feat(ATTACH_AGE_LOAD) ? 0 : SKIP_AGE_LOAD);
 13325		attach_entity_load_avg(cfs_rq, se);
 13326		update_tg_load_avg(cfs_rq);
 13327		propagate_entity_cfs_rq(se);
 13328	}
 13329	
 13330	static void detach_task_cfs_rq(struct task_struct *p)
 13331	{
 13332		struct sched_entity *se = &p->se;
 13333	
 13334		detach_entity_cfs_rq(se);
 13335	}
 13336	
 13337	static void attach_task_cfs_rq(struct task_struct *p)
 13338	{
 13339		struct sched_entity *se = &p->se;
 13340	
 13341		attach_entity_cfs_rq(se);
 13342	}
 13343	
 13344	static void switched_from_fair(struct rq *rq, struct task_struct *p)
 13345	{
 13346		detach_task_cfs_rq(p);
 13347		/*
 13348		 * Since this is called after changing class, this is a little weird
 13349		 * and we cannot use DEQUEUE_DELAYED.
 13350		 */
 13351		if (p->se.sched_delayed) {
 13352			dequeue_task(rq, p, DEQUEUE_NOCLOCK | DEQUEUE_SLEEP);
 13353			p->se.sched_delayed = 0;
 13354			p->se.rel_deadline = 0;
 13355			if (sched_feat(DELAY_ZERO) && p->se.vlag > 0)
 13356				p->se.vlag = 0;
 13357		}
 13358	}
 13359	
 13360	static void switched_to_fair(struct rq *rq, struct task_struct *p)
 13361	{
 13362		SCHED_WARN_ON(p->se.sched_delayed);
 13363	
 13364		attach_task_cfs_rq(p);
 13365	
 13366		set_task_max_allowed_capacity(p);
 13367	
 13368		if (task_on_rq_queued(p)) {
 13369			/*
 13370			 * We were most likely switched from sched_rt, so
 13371			 * kick off the schedule if running, otherwise just see
 13372			 * if we can still preempt the current task.
 13373			 */
 13374			if (task_current(rq, p))
 13375				resched_curr(rq);
 13376			else
 13377				wakeup_preempt(rq, p, 0);
 13378		}
 13379	}
 13380	
 13381	/* Account for a task changing its policy or group.
 13382	 *
 13383	 * This routine is mostly called to set cfs_rq->curr field when a task
 13384	 * migrates between groups/classes.
 13385	 */
 13386	static void set_next_task_fair(struct rq *rq, struct task_struct *p, bool first)
 13387	{
 13388		struct sched_entity *se = &p->se;
 13389	
 13390	#ifdef CONFIG_SMP
 13391		if (task_on_rq_queued(p)) {
 13392			/*
 13393			 * Move the next running task to the front of the list, so our
 13394			 * cfs_tasks list becomes MRU one.
 13395			 */
 13396			list_move(&se->group_node, &rq->cfs_tasks);
 13397		}
 13398	#endif
 13399	
 13400		for_each_sched_entity(se) {
 13401			struct cfs_rq *cfs_rq = cfs_rq_of(se);
 13402	
 13403			set_next_entity(cfs_rq, se);
 13404			/* ensure bandwidth has been allocated on our new cfs_rq */
 13405			account_cfs_rq_runtime(cfs_rq, 0);
 13406		}
 13407	
 13408		if (!first)
 13409			return;
 13410	
 13411		SCHED_WARN_ON(se->sched_delayed);
 13412	}
 13413	
 13414	void init_cfs_rq(struct cfs_rq *cfs_rq)
 13415	{
 13416		cfs_rq->tasks_timeline = RB_ROOT_CACHED;
 13417		plist_head_init(&cfs_rq->pushable_tasks);
 13418		cfs_rq->min_vruntime = (u64)(-(1LL << 20));
 13419	#ifdef CONFIG_SMP
 13420		raw_spin_lock_init(&cfs_rq->removed.lock);
 13421	#endif
 13422	}
 13423	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
