Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A09C2F2F;
	Mon, 10 Jul 2023 14:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688999542; x=1720535542;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qkmQ7uxLesxRm8yhapbzJP62jeJlkwtrmAPlBlB6a3c=;
  b=GkhUHU6y0pa0zyr5dwvLAwsM2E8q1WmABqDraxbpIxWyITm2S3JYWwSq
   lE7NlI+ptKlCc4lhUKeHecMjn7sHKQelW6YKMtJenDH54LgulnLAOZ0GF
   qBX4bOKXZZWnhpp/EgnlygQi4NcCLPq+hIznf1baG3AYtGqMGqPXdaufW
   9WDZ5MkdK+ACYC2bfeY+s3i45Wjk/cXxDvXIGCqmv4UG6QapA/4r1JMN6
   W/ck3KHjiEwKvHwCFrRFspJZQ5OtYpOTJRZmqS2/QE7aPiwgVX6u/Wqud
   KanfeV9DmQwg+S1KOQZ4B8DgItu6Hw2IDxS6o9gEUZ7P4THWk/+W+jUOY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="349161116"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="349161116"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 07:32:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="1051371547"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="1051371547"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 10 Jul 2023 07:32:18 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qIrw1-0003lA-3D;
	Mon, 10 Jul 2023 14:32:17 +0000
Date: Mon, 10 Jul 2023 22:31:29 +0800
From: kernel test robot <lkp@intel.com>
To: Aaron Lu <aaron.lu@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [aaronlu:delay_update_tg_load_avg 2/2] kernel/sched/fair.c:4143:11:
 error: no member named 'prop_removed_sum' in 'struct cfs_rq'
Message-ID: <202307102204.1L3sMyyo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/aaronlu/linux.git delay_update_tg_load_avg
head:   f68fadd88cde403b3c510d9039de52131a7d68e1
commit: f68fadd88cde403b3c510d9039de52131a7d68e1 [2/2] sched/fair: delay update_tg_load_avg() for cfs_rq's removed load
config: i386-randconfig-i012-20230710 (https://download.01.org/0day-ci/archive/20230710/202307102204.1L3sMyyo-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230710/202307102204.1L3sMyyo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307102204.1L3sMyyo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/fair.c:4143:11: error: no member named 'prop_removed_sum' in 'struct cfs_rq'
                   cfs_rq->prop_removed_sum +=
                   ~~~~~~  ^
   kernel/sched/fair.c:6195:6: warning: no previous prototype for function 'init_cfs_bandwidth' [-Wmissing-prototypes]
   void init_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
        ^
   kernel/sched/fair.c:6195:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void init_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
   ^
   static 
   kernel/sched/fair.c:12073:6: warning: no previous prototype for function 'task_vruntime_update' [-Wmissing-prototypes]
   void task_vruntime_update(struct rq *rq, struct task_struct *p, bool in_fi)
        ^
   kernel/sched/fair.c:12073:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void task_vruntime_update(struct rq *rq, struct task_struct *p, bool in_fi)
   ^
   static 
   kernel/sched/fair.c:12695:6: warning: no previous prototype for function 'free_fair_sched_group' [-Wmissing-prototypes]
   void free_fair_sched_group(struct task_group *tg) { }
        ^
   kernel/sched/fair.c:12695:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void free_fair_sched_group(struct task_group *tg) { }
   ^
   static 
   kernel/sched/fair.c:12697:5: warning: no previous prototype for function 'alloc_fair_sched_group' [-Wmissing-prototypes]
   int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
       ^
   kernel/sched/fair.c:12697:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
   ^
   static 
   kernel/sched/fair.c:12702:6: warning: no previous prototype for function 'online_fair_sched_group' [-Wmissing-prototypes]
   void online_fair_sched_group(struct task_group *tg) { }
        ^
   kernel/sched/fair.c:12702:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void online_fair_sched_group(struct task_group *tg) { }
   ^
   static 
   kernel/sched/fair.c:12704:6: warning: no previous prototype for function 'unregister_fair_sched_group' [-Wmissing-prototypes]
   void unregister_fair_sched_group(struct task_group *tg) { }
        ^
   kernel/sched/fair.c:12704:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void unregister_fair_sched_group(struct task_group *tg) { }
   ^
   static 
   6 warnings and 1 error generated.


vim +4143 kernel/sched/fair.c

  4076	
  4077	/**
  4078	 * update_cfs_rq_load_avg - update the cfs_rq's load/util averages
  4079	 * @now: current time, as per cfs_rq_clock_pelt()
  4080	 * @cfs_rq: cfs_rq to update
  4081	 *
  4082	 * The cfs_rq avg is the direct sum of all its entities (blocked and runnable)
  4083	 * avg. The immediate corollary is that all (fair) tasks must be attached.
  4084	 *
  4085	 * cfs_rq->avg is used for task_h_load() and update_cfs_share() for example.
  4086	 *
  4087	 * Return: true if the load decayed or we removed load.
  4088	 *
  4089	 * Since both these conditions indicate a changed cfs_rq->avg.load we should
  4090	 * call update_tg_load_avg() when this function returns true.
  4091	 */
  4092	static inline int
  4093	update_cfs_rq_load_avg(u64 now, struct cfs_rq *cfs_rq)
  4094	{
  4095		unsigned long removed_load = 0, removed_util = 0, removed_runnable = 0;
  4096		struct sched_avg *sa = &cfs_rq->avg;
  4097		int decayed = 0;
  4098	
  4099		if (cfs_rq->removed.nr) {
  4100			unsigned long r;
  4101			u32 divider = get_pelt_divider(&cfs_rq->avg);
  4102	
  4103			raw_spin_lock(&cfs_rq->removed.lock);
  4104			swap(cfs_rq->removed.util_avg, removed_util);
  4105			swap(cfs_rq->removed.load_avg, removed_load);
  4106			swap(cfs_rq->removed.runnable_avg, removed_runnable);
  4107			cfs_rq->removed.nr = 0;
  4108			raw_spin_unlock(&cfs_rq->removed.lock);
  4109	
  4110			r = removed_load;
  4111			sub_positive(&sa->load_avg, r);
  4112			sub_positive(&sa->load_sum, r * divider);
  4113			/* See sa->util_sum below */
  4114			sa->load_sum = max_t(u32, sa->load_sum, sa->load_avg * PELT_MIN_DIVIDER);
  4115	
  4116			r = removed_util;
  4117			sub_positive(&sa->util_avg, r);
  4118			sub_positive(&sa->util_sum, r * divider);
  4119			/*
  4120			 * Because of rounding, se->util_sum might ends up being +1 more than
  4121			 * cfs->util_sum. Although this is not a problem by itself, detaching
  4122			 * a lot of tasks with the rounding problem between 2 updates of
  4123			 * util_avg (~1ms) can make cfs->util_sum becoming null whereas
  4124			 * cfs_util_avg is not.
  4125			 * Check that util_sum is still above its lower bound for the new
  4126			 * util_avg. Given that period_contrib might have moved since the last
  4127			 * sync, we are only sure that util_sum must be above or equal to
  4128			 *    util_avg * minimum possible divider
  4129			 */
  4130			sa->util_sum = max_t(u32, sa->util_sum, sa->util_avg * PELT_MIN_DIVIDER);
  4131	
  4132			r = removed_runnable;
  4133			sub_positive(&sa->runnable_avg, r);
  4134			sub_positive(&sa->runnable_sum, r * divider);
  4135			/* See sa->util_sum above */
  4136			sa->runnable_sum = max_t(u32, sa->runnable_sum,
  4137						      sa->runnable_avg * PELT_MIN_DIVIDER);
  4138	
  4139			/*
  4140			 * removed_runnable is the unweighted version of removed_load so we
  4141			 * can use it to estimate removed_load_sum.
  4142			 */
> 4143			cfs_rq->prop_removed_sum +=
  4144				-(long)(removed_runnable * divider) >> SCHED_CAPACITY_SHIFT;
  4145		}
  4146	
  4147		decayed = __update_load_avg_cfs_rq(now, cfs_rq);
  4148		u64_u32_store_copy(sa->last_update_time,
  4149				   cfs_rq->last_update_time_copy,
  4150				   sa->last_update_time);
  4151		return decayed;
  4152	}
  4153	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
