Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC59114F125;
	Sat, 29 Nov 2025 02:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764381887; cv=none; b=khS6eARnAdvuledgizj2mBoMt1lHA5JMBsnHSA8CB3tj4s8VvTxuFbcfOzp7jHqPdsWeSOYSxda5BK6eIsOQ2zQt98KFgzsVRLF2A+PPCNbeXuU6FHnTqLHEQ66j44ZWjHhNiGRpeBHCkVpGt7Wtzz9oZewEPsOlmJidaeArWcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764381887; c=relaxed/simple;
	bh=VROoY/BOTrLXT6qEJDZMwUJjhqkH0hDoAxJYBEgcZ38=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LiGtvKtyjM4zr9gdiOeatdTjQEUkztJEo5iQ0X10O7biYDZntaJVFO7fyUQCDk6qNxSIFx12Eh8osSANaq+yXNQE9Hf5/JAHRbVWoYzhPvM3v76fq9AzbpTQ+nx9Kk6wi91TbKSdtm2eURyWYlRuIVKgHb66WG0N8OAWhnSzjTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BrdeYBOE; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BrdeYBOE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764381886; x=1795917886;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VROoY/BOTrLXT6qEJDZMwUJjhqkH0hDoAxJYBEgcZ38=;
  b=BrdeYBOEGuv7MBYyUz3ctR4oJR23H9UUCB8a/Hmc1BPUhGOi0MAcd66O
   oBsOR+GsFL6CVnoCVzwLSJK2e9i6sCtv+Ndx9As4Y14ULrU3H4RVHm//V
   C3+8bVneEtkXs+jaIGG3l7hsyHTKOv63qEGh0P4WuWi7zC4/a75dNe+4x
   muqaIQXJKwrwRUXQ23Xthc5ywDUqbqlCivOsV71+NHXOPC6GO3D7r/un1
   h2TOH7nJrny/m8g907omySfPG/7vADRdHYS2ulGbb7h2w9Z53IsaZsYaA
   T889iJ0VR1plS3IRhu9RFudtOz3VhzQjJ5Tm/mkEETeKXngzyJcJnVpeb
   g==;
X-CSE-ConnectionGUID: KACQzfrvSr2yss3oxxifjw==
X-CSE-MsgGUID: aMTWEwbLTkiJ3Z5aWOE0ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="77870177"
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="77870177"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 18:04:46 -0800
X-CSE-ConnectionGUID: U8gzwpDVReu9upitdF5ytw==
X-CSE-MsgGUID: CmGEHZOyQXGc8RgDA0Z/Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="194001916"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 28 Nov 2025 18:04:44 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPAKH-000000006sx-25us;
	Sat, 29 Nov 2025 02:04:41 +0000
Date: Sat, 29 Nov 2025 10:03:59 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/flat 21/22] kernel/sched/fair.c:8944:8: error:
 use of undeclared identifier 'nse'; did you mean 'se'?
Message-ID: <202511291025.or3848gb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/flat
head:   589908814e69e3b1a5f3c00003d3746b1865cc30
commit: c68619a24fa5fc6ad3e7edac3a04b8bb6cca02a3 [21/22] sched: Remove sched_class::pick_next_task()
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20251129/202511291025.or3848gb-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b3428bb966f1de8aa48375ffee0eba04ede133b7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251129/202511291025.or3848gb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511291025.or3848gb-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/fair.c:8870:28: error: static declaration of 'pick_task_fair' follows non-static declaration
    8870 | static struct task_struct *pick_task_fair(struct rq *rq, struct rq_flags *rf)
         |                            ^
   kernel/sched/sched.h:2687:28: note: previous declaration is here
    2687 | extern struct task_struct *pick_task_fair(struct rq *rq, struct rq_flags *rf);
         |                            ^
>> kernel/sched/fair.c:8944:8: error: use of undeclared identifier 'nse'; did you mean 'se'?
    8944 |                     !nse || cfs_rq->h_curr)
         |                      ^~~
         |                      se
   kernel/sched/fair.c:8932:23: note: 'se' declared here
    8932 |         struct sched_entity *se = &prev->se;
         |                              ^
   kernel/sched/fair.c:8944:23: error: no member named 'h_curr' in 'struct cfs_rq'
    8944 |                     !nse || cfs_rq->h_curr)
         |                             ~~~~~~  ^
   kernel/sched/fair.c:13484:24: error: no member named 'h_curr' in 'struct cfs_rq'
    13484 |                     first && cfs_rq->h_curr)
          |                              ~~~~~~  ^
   kernel/sched/fair.c:13824:21: error: use of undeclared identifier 'pick_next_task_fair'; did you mean 'set_next_task_fair'?
    13824 |         .pick_next_task         = pick_next_task_fair,
          |                                   ^~~~~~~~~~~~~~~~~~~
          |                                   set_next_task_fair
   kernel/sched/fair.c:13476:13: note: 'set_next_task_fair' declared here
    13476 | static void set_next_task_fair(struct rq *rq, struct task_struct *p, bool first)
          |             ^
   kernel/sched/fair.c:13824:3: error: field designator 'pick_next_task' does not refer to any field in type 'const struct sched_class'; did you mean 'set_next_task'?
    13824 |         .pick_next_task         = pick_next_task_fair,
          |          ^~~~~~~~~~~~~~
          |          set_next_task
   kernel/sched/sched.h:2481:9: note: 'set_next_task' declared here
    2481 |         void (*set_next_task)(struct rq *rq, struct task_struct *p, bool first);
         |                ^
   kernel/sched/fair.c:13826:28: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
    13826 |         .set_next_task          = set_next_task_fair,
          |                                   ^~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:13824:21: note: previous initialization is here
    13824 |         .pick_next_task         = pick_next_task_fair,
          |                                   ^~~~~~~~~~~~~~~~~~~
   1 warning and 6 errors generated.


vim +8944 kernel/sched/fair.c

  8869	
> 8870	static struct task_struct *pick_task_fair(struct rq *rq, struct rq_flags *rf)
  8871	{
  8872		struct sched_entity *se;
  8873		struct cfs_rq *cfs_rq;
  8874		struct task_struct *p;
  8875		bool throttled;
  8876		int new_tasks;
  8877	
  8878	again:
  8879		cfs_rq = &rq->cfs;
  8880		if (!cfs_rq->nr_queued)
  8881			goto idle;
  8882	
  8883		throttled = false;
  8884	
  8885		do {
  8886			/* Might not have done put_prev_entity() */
  8887			if (cfs_rq->curr && cfs_rq->curr->on_rq)
  8888				update_curr(cfs_rq);
  8889	
  8890			throttled |= check_cfs_rq_runtime(cfs_rq);
  8891	
  8892			se = pick_next_entity(rq, cfs_rq);
  8893			if (!se)
  8894				goto again;
  8895			cfs_rq = group_cfs_rq(se);
  8896		} while (cfs_rq);
  8897	
  8898		p = task_of(se);
  8899		if (unlikely(throttled))
  8900			task_throttle_setup_work(p);
  8901		return p;
  8902	
  8903	idle:
  8904		new_tasks = sched_balance_newidle(rq, rf);
  8905		if (new_tasks < 0)
  8906			return RETRY_TASK;
  8907		if (new_tasks > 0)
  8908			goto again;
  8909		return NULL;
  8910	}
  8911	
  8912	static struct task_struct *
  8913	fair_server_pick_task(struct sched_dl_entity *dl_se, struct rq_flags *rf)
  8914	{
  8915		return pick_task_fair(dl_se->rq, rf);
  8916	}
  8917	
  8918	void fair_server_init(struct rq *rq)
  8919	{
  8920		struct sched_dl_entity *dl_se = &rq->fair_server;
  8921	
  8922		init_dl_entity(dl_se);
  8923	
  8924		dl_server_init(dl_se, rq, fair_server_pick_task);
  8925	}
  8926	
  8927	/*
  8928	 * Account for a descheduled task:
  8929	 */
  8930	static void put_prev_task_fair(struct rq *rq, struct task_struct *prev, struct task_struct *next)
  8931	{
  8932		struct sched_entity *se = &prev->se;
  8933		struct cfs_rq *cfs_rq;
  8934	#ifdef CONFIG_FAIR_GROUP_SCHED
  8935		struct sched_entity *nse = NULL;
  8936	
  8937		if (next && next->sched_class == &fair_sched_class)
  8938			nse = &next->se;
  8939	#endif
  8940	
  8941		while (se) {
  8942			cfs_rq = cfs_rq_of(se);
  8943			if (!IS_ENABLED(CONFIG_FAIR_GROUP_SCHED) ||
> 8944			    !nse || cfs_rq->h_curr)
  8945				put_prev_entity(cfs_rq, se);
  8946	#ifdef CONFIG_FAIR_GROUP_SCHED
  8947			if (nse) {
  8948				if (is_same_group(se, nse))
  8949					break;
  8950				if (nse->depth >= se->depth)
  8951					nse = parent_entity(nse);
  8952				if (nse->depth > se->depth)
  8953					continue;
  8954			}
  8955	#endif
  8956			se = parent_entity(se);
  8957		}
  8958	}
  8959	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
