Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14EF17D2;
	Thu, 18 Apr 2024 23:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713483514; cv=none; b=ciLsZU85+qOyKhGYm5LVlLNpDtHQ1Z4IUQNaaRZ1ZGsQ1oO/ZQ9YJZBEDaSZzGlep5e6xeUNu7lurtk3d5oBrzf4fuazYg/5DQQ6xtbeSrjk/9xuh/tx0aU7BZ/NbVKXeUJzR5gMd474wj/BBR9zWI2DD0wMYlbe4G5JbhcCzdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713483514; c=relaxed/simple;
	bh=GwjurnCKl9aSSf18+hehiajo6nGZGAjvBv/PEYO/Jmw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LaCdqx07utQxl3z/at/eAG69dL2kYrNtoEqyLAVujHnngryIdDHPEaaLAkS8jm8+y1sRVOWk9AMiVCoxd6M+pYZBIh7SeR9sPrTTFwhQlr1Ze/TbzCyjbOtDq4Xak3eK4TNHDukJjQ30V2ADXcy8tsCjNBcJTiiWrDKwKHG9+OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WF7ccoSN; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WF7ccoSN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713483513; x=1745019513;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GwjurnCKl9aSSf18+hehiajo6nGZGAjvBv/PEYO/Jmw=;
  b=WF7ccoSNtmzJweFx1039c1OlVag3YjBULiw3EU9/gC0OcltlRQGg67vw
   2R4wOb66MRX7N1ziP63XtnAFqtePas3u+QNFZjyHxu1EdjmEI/pq0fXw/
   IYNLUQFozXT07zhAOtL6wZtqIozUz5PNT0OU5QEtpIdrX6P7LVoXRpi+g
   9bmVlUuRSc/9VM6a5I0Ll9rhzuxe+00R4YSn/z9h1IlU5SJQfF7ugHbmY
   YSC5dKDtjn9xZ1o4N1lE3eSFmBFZTKXuvsS2dAV6+YdBSacPeqG0OEmK6
   Xh6bWDn2xi6j+cUfHH+bXMxqC00WlX5WVwZSE1RpK4j78OUUXqBi6SELF
   A==;
X-CSE-ConnectionGUID: GvGV0mY9TnS9v4RiPxD0+Q==
X-CSE-MsgGUID: UhlqNN/YSP2C5XB/cKn6NQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="8991524"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="8991524"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 16:38:32 -0700
X-CSE-ConnectionGUID: tnWT0bqPRaaZgTcFnMONxQ==
X-CSE-MsgGUID: VGKSCAJuR3S5eBoJHei0kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="23223015"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 18 Apr 2024 16:38:31 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxbKm-0009Lo-1S;
	Thu, 18 Apr 2024 23:38:28 +0000
Date: Fri, 19 Apr 2024 07:37:40 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jfern:sched/dlserver.update_h_nr 1/1] kernel/sched/fair.c:5119:3:
 error: call to undeclared function 'update_h_nr_running'; ISO C99 and later
 do not support implicit function declarations
Message-ID: <202404190740.QqnroHiW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git sched/dlserver.update_h_nr
head:   4e843586ff1b3b77e5244d0128facac6330490a4
commit: 4e843586ff1b3b77e5244d0128facac6330490a4 [1/1] Prototype: Update h_nr_running from single place to stop/start dl server
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240419/202404190740.QqnroHiW-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7089c359a3845323f6f30c44a47dd901f2edfe63)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240419/202404190740.QqnroHiW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404190740.QqnroHiW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/fair.c:23:
   In file included from kernel/sched/sched.h:41:
   In file included from include/linux/blkdev.h:8:
   In file included from include/linux/genhd.h:16:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/mm.h:1613:
   include/linux/vmstat.h:450:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     450 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from kernel/sched/fair.c:23:
   kernel/sched/sched.h:1772:15: warning: cast from 'void (*)(struct rq *)' to 'void (*)(struct callback_head *)' converts to incompatible function type [-Wcast-function-type-strict]
    1772 |         head->func = (void (*)(struct callback_head *))func;
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/fair.c:5119:3: error: call to undeclared function 'update_h_nr_running'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    5119 |                 update_h_nr_running(qcfs_rq, -1 * task_delta);
         |                 ^
   kernel/sched/fair.c:5141:3: error: call to undeclared function 'update_h_nr_running'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    5141 |                 update_h_nr_running(qcfs_rq, -1 * task_delta);
         |                 ^
   kernel/sched/fair.c:5198:3: error: call to undeclared function 'update_h_nr_running'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    5198 |                 update_h_nr_running(qcfs_rq, task_delta);
         |                 ^
   kernel/sched/fair.c:5215:3: error: call to undeclared function 'update_h_nr_running'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    5215 |                 update_h_nr_running(qcfs_rq, task_delta);
         |                 ^
   kernel/sched/fair.c:5830:13: error: static declaration of 'update_h_nr_running' follows non-static declaration
    5830 | static void update_h_nr_running(struct cfs_rq *cfs_rq, int delta)
         |             ^
   kernel/sched/fair.c:5119:3: note: previous implicit declaration is here
    5119 |                 update_h_nr_running(qcfs_rq, -1 * task_delta);
         |                 ^
   2 warnings and 5 errors generated.


vim +/update_h_nr_running +5119 kernel/sched/fair.c

  5070	
  5071	static bool throttle_cfs_rq(struct cfs_rq *cfs_rq)
  5072	{
  5073		struct rq *rq = rq_of(cfs_rq);
  5074		struct cfs_bandwidth *cfs_b = tg_cfs_bandwidth(cfs_rq->tg);
  5075		struct sched_entity *se;
  5076		long task_delta, idle_task_delta, dequeue = 1;
  5077	
  5078		raw_spin_lock(&cfs_b->lock);
  5079		/* This will start the period timer if necessary */
  5080		if (__assign_cfs_rq_runtime(cfs_b, cfs_rq, 1)) {
  5081			/*
  5082			 * We have raced with bandwidth becoming available, and if we
  5083			 * actually throttled the timer might not unthrottle us for an
  5084			 * entire period. We additionally needed to make sure that any
  5085			 * subsequent check_cfs_rq_runtime calls agree not to throttle
  5086			 * us, as we may commit to do cfs put_prev+pick_next, so we ask
  5087			 * for 1ns of runtime rather than just check cfs_b.
  5088			 */
  5089			dequeue = 0;
  5090		} else {
  5091			list_add_tail_rcu(&cfs_rq->throttled_list,
  5092					  &cfs_b->throttled_cfs_rq);
  5093		}
  5094		raw_spin_unlock(&cfs_b->lock);
  5095	
  5096		if (!dequeue)
  5097			return false;  /* Throttle no longer required. */
  5098	
  5099		se = cfs_rq->tg->se[cpu_of(rq_of(cfs_rq))];
  5100	
  5101		/* freeze hierarchy runnable averages while throttled */
  5102		rcu_read_lock();
  5103		walk_tg_tree_from(cfs_rq->tg, tg_throttle_down, tg_nop, (void *)rq);
  5104		rcu_read_unlock();
  5105	
  5106		task_delta = cfs_rq->h_nr_running;
  5107		idle_task_delta = cfs_rq->idle_h_nr_running;
  5108		for_each_sched_entity(se) {
  5109			struct cfs_rq *qcfs_rq = cfs_rq_of(se);
  5110			/* throttled entity or throttle-on-deactivate */
  5111			if (!se->on_rq)
  5112				goto done;
  5113	
  5114			dequeue_entity(qcfs_rq, se, DEQUEUE_SLEEP);
  5115	
  5116			if (cfs_rq_is_idle(group_cfs_rq(se)))
  5117				idle_task_delta = cfs_rq->h_nr_running;
  5118	
> 5119			update_h_nr_running(qcfs_rq, -1 * task_delta);
  5120			qcfs_rq->idle_h_nr_running -= idle_task_delta;
  5121	
  5122			if (qcfs_rq->load.weight) {
  5123				/* Avoid re-evaluating load for this entity: */
  5124				se = parent_entity(se);
  5125				break;
  5126			}
  5127		}
  5128	
  5129		for_each_sched_entity(se) {
  5130			struct cfs_rq *qcfs_rq = cfs_rq_of(se);
  5131			/* throttled entity or throttle-on-deactivate */
  5132			if (!se->on_rq)
  5133				goto done;
  5134	
  5135			update_load_avg(qcfs_rq, se, 0);
  5136			se_update_runnable(se);
  5137	
  5138			if (cfs_rq_is_idle(group_cfs_rq(se)))
  5139				idle_task_delta = cfs_rq->h_nr_running;
  5140	
  5141			update_h_nr_running(qcfs_rq, -1 * task_delta);
  5142			qcfs_rq->idle_h_nr_running -= idle_task_delta;
  5143		}
  5144	
  5145		/* At this point se is NULL and we are at root level*/
  5146		sub_nr_running(rq, task_delta);
  5147	
  5148	done:
  5149		/*
  5150		 * Note: distribution will already see us throttled via the
  5151		 * throttled-list.  rq->lock protects completion.
  5152		 */
  5153		cfs_rq->throttled = 1;
  5154		cfs_rq->throttled_clock = rq_clock(rq);
  5155		return true;
  5156	}
  5157	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
