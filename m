Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE07111B5;
	Wed,  6 Sep 2023 22:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694039109; x=1725575109;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KXE66XenPbPqaOJsFLRh+8PBKICY4cLiQOh/pJIkGUg=;
  b=dz0dQQ7ygE4qgWkBnTzRs4P0yJJijaXOs4xUmNTCF5wIc+bBtvbksZXh
   R/NQm69EsXGxXgNuynqRe7EpSNcthlDNJDhf03IjiYwQCtBgd3Af+PhBx
   0dA3hFSNkHlttwUImQGSXZZXdGzrKiKjzM6uDoC3jhF9piMmlf+/ckO6y
   Xy55h5NwjmjIOomnOh670/6NrQz5KIL4ugwmsdG00ETiSxCt97f084NI4
   tya6zuFw6o1ZHfq/IqX8vu9ELm44JmwCexaoUKM8jQ+/9xpfDs6Bon3Fi
   u/UVlD/qAEZzZU5KK5c/FrBqul7c7Qsy50c/w6a1nMNXurWlUb6FwLgP5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="441185987"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="441185987"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 15:25:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="718443692"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="718443692"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 06 Sep 2023 15:25:06 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qe0xM-0000dp-2F;
	Wed, 06 Sep 2023 22:25:04 +0000
Date: Thu, 7 Sep 2023 06:24:27 +0800
From: kernel test robot <lkp@intel.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] sched: Implement adaptative rate limiting of
 task migrations
Message-ID: <202309070647.wAce8rJl-lkp@intel.com>
References: <20230905171105.1005672-3-mathieu.desnoyers@efficios.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230905171105.1005672-3-mathieu.desnoyers@efficios.com>

Hi Mathieu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on linus/master next-20230906]
[cannot apply to v6.5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mathieu-Desnoyers/sched-Rate-limit-migrations-to-1-per-2ms-per-task/20230906-030116
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20230905171105.1005672-3-mathieu.desnoyers%40efficios.com
patch subject: [RFC PATCH 2/2] sched: Implement adaptative rate limiting of task migrations
config: arm64-randconfig-r023-20230906 (https://download.01.org/0day-ci/archive/20230907/202309070647.wAce8rJl-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309070647.wAce8rJl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309070647.wAce8rJl-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/fair.c:702:6: warning: no previous prototype for function 'update_entity_lag' [-Wmissing-prototypes]
   void update_entity_lag(struct cfs_rq *cfs_rq, struct sched_entity *se)
        ^
   kernel/sched/fair.c:702:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void update_entity_lag(struct cfs_rq *cfs_rq, struct sched_entity *se)
   ^
   static 
   kernel/sched/fair.c:6348:6: warning: no previous prototype for function 'init_cfs_bandwidth' [-Wmissing-prototypes]
   void init_cfs_bandwidth(struct cfs_bandwidth *cfs_b, struct cfs_bandwidth *parent) {}
        ^
   kernel/sched/fair.c:6348:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void init_cfs_bandwidth(struct cfs_bandwidth *cfs_b, struct cfs_bandwidth *parent) {}
   ^
   static 
>> kernel/sched/fair.c:7956:8: error: implicit declaration of function 'sched_clock_stable' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   if (!sched_clock_stable())
                        ^
   kernel/sched/fair.c:7956:8: note: did you mean 'sched_clock_tick'?
   include/linux/sched/clock.h:36:20: note: 'sched_clock_tick' declared here
   static inline void sched_clock_tick(void)
                      ^
   kernel/sched/fair.c:7959:8: error: implicit declaration of function 'sched_clock_stable' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   if (!sched_clock_stable())
                        ^
   kernel/sched/fair.c:12831:6: warning: no previous prototype for function 'free_fair_sched_group' [-Wmissing-prototypes]
   void free_fair_sched_group(struct task_group *tg) { }
        ^
   kernel/sched/fair.c:12831:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void free_fair_sched_group(struct task_group *tg) { }
   ^
   static 
   kernel/sched/fair.c:12833:5: warning: no previous prototype for function 'alloc_fair_sched_group' [-Wmissing-prototypes]
   int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
       ^
   kernel/sched/fair.c:12833:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
   ^
   static 
   kernel/sched/fair.c:12838:6: warning: no previous prototype for function 'online_fair_sched_group' [-Wmissing-prototypes]
   void online_fair_sched_group(struct task_group *tg) { }
        ^
   kernel/sched/fair.c:12838:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void online_fair_sched_group(struct task_group *tg) { }
   ^
   static 
   kernel/sched/fair.c:12840:6: warning: no previous prototype for function 'unregister_fair_sched_group' [-Wmissing-prototypes]
   void unregister_fair_sched_group(struct task_group *tg) { }
        ^
   kernel/sched/fair.c:12840:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void unregister_fair_sched_group(struct task_group *tg) { }
   ^
   static 
   6 warnings and 2 errors generated.


vim +/sched_clock_stable +7956 kernel/sched/fair.c

  7946	
  7947	static void migrate_task_ratelimit_fair(struct task_struct *p, int new_cpu)
  7948	{
  7949		struct sched_entity *se = &p->se;
  7950		u64 now;
  7951	
  7952		/* Rate limit task migration. */
  7953		now = sched_clock_cpu(task_cpu(p));
  7954		if (now < se->next_migration_time) {
  7955			se->nr_migrations_per_window++;
> 7956			if (!sched_clock_stable())
  7957				se->next_migration_time += sched_clock_cpu(new_cpu) - now;
  7958		} else {
  7959			if (!sched_clock_stable())
  7960				now = sched_clock_cpu(new_cpu);
  7961			se->next_migration_time = now + SCHED_MIGRATION_RATELIMIT_WINDOW;
  7962			if (se->nr_migrations_per_window >= se->quota_migrations_per_window)
  7963				se->quota_migrations_per_window = max(1, se->quota_migrations_per_window >> 1);
  7964			else
  7965				se->quota_migrations_per_window =
  7966					min(SCHED_MIGRATION_QUOTA,
  7967					    se->quota_migrations_per_window + SCHED_MIGRATION_QUOTA_REPLENISH);
  7968			se->nr_migrations_per_window = 1;
  7969		}
  7970	}
  7971	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
