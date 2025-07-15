Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEE0F9C1;
	Tue, 15 Jul 2025 00:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752540828; cv=none; b=kTodzsiwyP4HFRZB/u8+55miKM13RvfWMGc50ci1ryv/KV8c7lmhTAuGDqSsF8Zara89pYKAV7f6uWMt64ChD1G5NruvKUeiMs5V7nxxm3R2ktvt1bsD9J/Tn9t2LB86xNgCjoO+z16+8ZlrLnEXLS5B3Y1Sva5gXNNdWOrSA2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752540828; c=relaxed/simple;
	bh=UpFR44Wra6kXZ8rGAAZ0feXypfrgNBlUZhPw50/Mu7c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AUswCayud+msNIS++J0DABoet7VHHgYCEc4hG4BXGlCY0XigtH5Z+CEsffZE4SVRauIA3qFNX+K861grZp6AihR6qAx2NxyKieNLaDpPouoZkwnJyx9COnMzChtgdvqIAZft1vvJmLe9qHDlWRB3TZ3SGq15S7/dX3o169fxCzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ku3P98g2; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ku3P98g2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752540827; x=1784076827;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UpFR44Wra6kXZ8rGAAZ0feXypfrgNBlUZhPw50/Mu7c=;
  b=ku3P98g2/dKdsvMUr9YLfIi35OXSPDv6X1IuYEoS2IRIQFb9R8rJaIO/
   4WT6nkrxBQt2mxmE3E+4Gw6wIwgXEiWVzcRlonkFWUguuH3CqbbgLc4ek
   fAm6/ixR2jiHgOuv0BDxoDJ2GwBBCDE33MQxhPReBbFUA9dV1YfBRlpIL
   etmKnHiQdEahyU41NSgEYLz28TE+F5Smor/J1JVH/h/PH3fpezA+X8UdZ
   tozJCxglseOGeqA4xLdRw7Vs/u1hoKUNWvUM8KnbxfXxUvpuSfxHfottY
   MF14Bsgdm6b/hrrmSMEJIjpJXkq9geYMlsJNTdxdD3uETf3A4Q4YC874/
   w==;
X-CSE-ConnectionGUID: TWqlG/MvTH6tSzi68Iyz9w==
X-CSE-MsgGUID: xRuFeqmOQhqDmxpWqKBZ9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="58515412"
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="58515412"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 17:53:46 -0700
X-CSE-ConnectionGUID: HjzmXGC3RF2OM8jUeOgM3g==
X-CSE-MsgGUID: dK4TXdFFQJG9kemY4z9rQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="157798092"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 Jul 2025 17:53:44 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubTvR-0009UZ-2Z;
	Tue, 15 Jul 2025 00:53:41 +0000
Date: Tue, 15 Jul 2025 08:52:45 +0800
From: kernel test robot <lkp@intel.com>
To: Mel Gorman <mgorman@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mel:sched-preemptnext-v1r8 2/2] kernel/sched/fair.c:8925:2:
 warning: unannotated fall-through between switch labels
Message-ID: <202507150807.0r5AqudU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mel/linux.git sched-preemptnext-v1r8
head:   9b54b70265f4d8c913fa8c5c85bbb241524f92f5
commit: 9b54b70265f4d8c913fa8c5c85bbb241524f92f5 [2/2] sched/fair: Reimplement NEXT_BUDDY to align with EEVDF goals
config: arm-randconfig-001-20250715 (https://download.01.org/0day-ci/archive/20250715/202507150807.0r5AqudU-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 16534d19bf50bde879a83f0ae62875e2c5120e64)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250715/202507150807.0r5AqudU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507150807.0r5AqudU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/fair.c:8925:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
    8925 |         case PREEMPT_BUDDY_RESCHED:
         |         ^
   kernel/sched/fair.c:8925:2: note: insert '__attribute__((fallthrough));' to silence this warning
    8925 |         case PREEMPT_BUDDY_RESCHED:
         |         ^
         |         __attribute__((fallthrough)); 
   kernel/sched/fair.c:8925:2: note: insert 'break;' to avoid fall-through
    8925 |         case PREEMPT_BUDDY_RESCHED:
         |         ^
         |         break; 
   kernel/sched/fair.c:484:20: warning: unused function 'list_del_leaf_cfs_rq' [-Wunused-function]
     484 | static inline void list_del_leaf_cfs_rq(struct cfs_rq *cfs_rq)
         |                    ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:505:19: warning: unused function 'tg_is_idle' [-Wunused-function]
     505 | static inline int tg_is_idle(struct task_group *tg)
         |                   ^~~~~~~~~~
   kernel/sched/fair.c:1491:20: warning: unused function 'is_core_idle' [-Wunused-function]
    1491 | static inline bool is_core_idle(int cpu)
         |                    ^~~~~~~~~~~~
   kernel/sched/fair.c:3768:20: warning: unused function 'account_numa_enqueue' [-Wunused-function]
    3768 | static inline void account_numa_enqueue(struct rq *rq, struct task_struct *p)
         |                    ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:3772:20: warning: unused function 'account_numa_dequeue' [-Wunused-function]
    3772 | static inline void account_numa_dequeue(struct rq *rq, struct task_struct *p)
         |                    ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:3776:20: warning: unused function 'update_scan_period' [-Wunused-function]
    3776 | static inline void update_scan_period(struct task_struct *p, int new_cpu)
         |                    ^~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:5236:20: warning: unused function 'cfs_rq_is_decayed' [-Wunused-function]
    5236 | static inline bool cfs_rq_is_decayed(struct cfs_rq *cfs_rq)
         |                    ^~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:5251:20: warning: unused function 'remove_entity_load_avg' [-Wunused-function]
    5251 | static inline void remove_entity_load_avg(struct sched_entity *se) {}
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:6820:20: warning: unused function 'sync_throttle' [-Wunused-function]
    6820 | static inline void sync_throttle(struct task_group *tg, int cpu) {}
         |                    ^~~~~~~~~~~~~
   kernel/sched/fair.c:6833:19: warning: unused function 'throttled_lb_pair' [-Wunused-function]
    6833 | static inline int throttled_lb_pair(struct task_group *tg,
         |                   ^~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:6844:37: warning: unused function 'tg_cfs_bandwidth' [-Wunused-function]
    6844 | static inline struct cfs_bandwidth *tg_cfs_bandwidth(struct task_group *tg)
         |                                     ^~~~~~~~~~~~~~~~
   kernel/sched/fair.c:6848:20: warning: unused function 'destroy_cfs_bandwidth' [-Wunused-function]
    6848 | static inline void destroy_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
         |                    ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:6849:20: warning: unused function 'update_runtime_enabled' [-Wunused-function]
    6849 | static inline void update_runtime_enabled(struct rq *rq) {}
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:6850:20: warning: unused function 'unthrottle_offline_cfs_rqs' [-Wunused-function]
    6850 | static inline void unthrottle_offline_cfs_rqs(struct rq *rq) {}
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:7279:28: warning: unused function 'cfs_h_nr_delayed' [-Wunused-function]
    7279 | static inline unsigned int cfs_h_nr_delayed(struct rq *rq)
         |                            ^~~~~~~~~~~~~~~~
   16 warnings generated.


vim +8925 kernel/sched/fair.c

  8835	
  8836	/*
  8837	 * Preempt the current task with a newly woken task if needed:
  8838	 */
  8839	static void check_preempt_wakeup_fair(struct rq *rq, struct task_struct *p, int wake_flags)
  8840	{
  8841		struct task_struct *donor = rq->donor;
  8842		struct sched_entity *se = &donor->se, *pse = &p->se;
  8843		struct cfs_rq *cfs_rq = task_cfs_rq(donor);
  8844		int cse_is_idle, pse_is_idle;
  8845		bool did_short;
  8846		s64 delta;
  8847	
  8848		if (unlikely(se == pse))
  8849			return;
  8850	
  8851		/*
  8852		 * This is possible from callers such as attach_tasks(), in which we
  8853		 * unconditionally wakeup_preempt() after an enqueue (which may have
  8854		 * lead to a throttle).  This both saves work and prevents false
  8855		 * next-buddy nomination below.
  8856		 */
  8857		if (unlikely(throttled_hierarchy(cfs_rq_of(pse))))
  8858			return;
  8859	
  8860		/*
  8861		 * We can come here with TIF_NEED_RESCHED already set from new task
  8862		 * wake up path.
  8863		 *
  8864		 * Note: this also catches the edge-case of curr being in a throttled
  8865		 * group (e.g. via set_curr_task), since update_curr() (in the
  8866		 * enqueue of curr) will have resulted in resched being set.  This
  8867		 * prevents us from potentially nominating it as a false LAST_BUDDY
  8868		 * below.
  8869		 */
  8870		if (test_tsk_need_resched(rq->curr))
  8871			return;
  8872	
  8873		if (!sched_feat(WAKEUP_PREEMPTION))
  8874			return;
  8875	
  8876		find_matching_se(&se, &pse);
  8877		WARN_ON_ONCE(!pse);
  8878	
  8879		cse_is_idle = se_is_idle(se);
  8880		pse_is_idle = se_is_idle(pse);
  8881	
  8882		/*
  8883		 * Preempt an idle entity in favor of a non-idle entity (and don't preempt
  8884		 * in the inverse case).
  8885		 */
  8886		if (cse_is_idle && !pse_is_idle) {
  8887			/*
  8888			 * When non-idle entity preempt an idle entity,
  8889			 * don't give idle entity slice protection.
  8890			 */
  8891			cancel_protect_slice(se);
  8892			goto preempt;
  8893		}
  8894	
  8895		if (cse_is_idle != pse_is_idle)
  8896			return;
  8897	
  8898		/*
  8899		 * BATCH and IDLE tasks do not preempt others.
  8900		 */
  8901		if (unlikely(!normal_policy(p->policy)))
  8902			return;
  8903	
  8904		cfs_rq = cfs_rq_of(se);
  8905		delta = rq_clock_task(rq) - se->exec_start;
  8906		update_curr(cfs_rq);
  8907		/*
  8908		 * If @p has a shorter slice than current and @p is eligible, override
  8909		 * current's slice protection in order to allow preemption.
  8910		 *
  8911		 * Note that even if @p does not turn out to be the most eligible
  8912		 * task at this moment, current's slice protection will be lost.
  8913		 */
  8914		did_short = do_preempt_short(cfs_rq, pse, se);
  8915		if (did_short)
  8916			cancel_protect_slice(se);
  8917	
  8918		switch (do_preempt_buddy(rq, cfs_rq, wake_flags, pse, se, delta, did_short)) {
  8919		case PREEMPT_BUDDY_NONE:
  8920			return;
  8921			break;
  8922		case PREEMPT_BUDDY_IMMEDIATE:
  8923			cancel_protect_slice(se);
  8924			;;
> 8925		case PREEMPT_BUDDY_RESCHED:
  8926			goto preempt;
  8927			break;
  8928		case PREEMPT_BUDDY_NEXT:
  8929			break;
  8930		}
  8931	
  8932		/*
  8933		 * If @p has become the most eligible task, force preemption.
  8934		 */
  8935		if (pick_eevdf(cfs_rq) == pse)
  8936			goto preempt;
  8937	
  8938		return;
  8939	
  8940	preempt:
  8941		resched_curr_lazy(rq);
  8942	}
  8943	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
