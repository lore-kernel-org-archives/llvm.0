Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46ECD7F4;
	Wed,  1 Feb 2023 05:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675228388; x=1706764388;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i0uvury/WhOsSmUWQ1olIoxBiZbPWf1bDjR16X2ZbCU=;
  b=nrWu3JfK3QW6saCPvM7MVBCTeZQw/GDp9TuZ8PM2jDzlhzfEWQXNU9z+
   V0Itmwptq+7HWcPU77d4i47yb5LKAqcJkosyj1wJwbrOD95qsCYzY4bcW
   mHae/Pm2Id5nF9fgcXnQD6drCzXIfH1SJXTPWI+RuYi09Byyr62sUDyOU
   SaIhFxfGQ5KLCD0gs30NFps8VQdwK3JwRvv3+xtboqUnYcYm3RGHd0hhx
   6UlPx6hQc9XEigpPm71WZMi+OtUmI3OfkgTI5uH8oQLl9NSjATSjszhMN
   2kZy12vewrPRU9bXOLRvA8nO2lXmVltHBVBZfEB5irdgvMwrdxG0Uw1Cs
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="308388564"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="308388564"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 21:13:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="642259882"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="642259882"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 31 Jan 2023 21:13:05 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pN5Qe-000568-2h;
	Wed, 01 Feb 2023 05:13:04 +0000
Date: Wed, 1 Feb 2023 13:12:39 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jfern:sched/rt-throttle.jan31 3/3] kernel/sched/rt.c:1092:28:
 error: no member named 'parent' in 'struct sched_rt_entity'
Message-ID: <202302011314.K2Ht9UsR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git sched/rt-throttle.jan31
head:   963d18b2596e81d74b3abe1730572d6d2ae6a595
commit: a0977d3c9221b1872073fc4b1756ca0c3b9f464b [3/3] sched/rt: Keep throttled rt_rqs on the runqueue
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230201/202302011314.K2Ht9UsR-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/commit/?id=a0977d3c9221b1872073fc4b1756ca0c3b9f464b
        git remote add jfern https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
        git fetch --no-tags jfern sched/rt-throttle.jan31
        git checkout a0977d3c9221b1872073fc4b1756ca0c3b9f464b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:45:
>> kernel/sched/rt.c:1092:28: error: no member named 'parent' in 'struct sched_rt_entity'
                                   if (!tbefore && rt_se->parent)
                                                   ~~~~~  ^
>> kernel/sched/rt.c:1093:6: error: implicit declaration of function 'adjust_cg_throt_update' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                                           adjust_cg_throt_update(rt_se->parent, true);
                                           ^
   kernel/sched/rt.c:1093:36: error: no member named 'parent' in 'struct sched_rt_entity'
                                           adjust_cg_throt_update(rt_se->parent, true);
                                                                  ~~~~~  ^
   kernel/sched/rt.c:1341:13: error: static declaration of 'adjust_cg_throt_update' follows non-static declaration
   static void adjust_cg_throt_update(struct sched_rt_entity *rt_se, bool throt)
               ^
   kernel/sched/rt.c:1093:6: note: previous implicit declaration is here
                                           adjust_cg_throt_update(rt_se->parent, true);
                                           ^
   kernel/sched/rt.c:1346:22: error: no member named 'parent' in 'struct sched_rt_entity'
           if (!myq || !rt_se->parent)
                        ~~~~~  ^
   kernel/sched/rt.c:1349:17: error: no member named 'parent' in 'struct sched_rt_entity'
           rt_se = rt_se->parent;
                   ~~~~~  ^
>> kernel/sched/rt.c:1358:11: error: no member named 'nr_cg_throttled' in 'struct rt_rq'; did you mean 'rt_cg_throttled'?
                           rt_rq->nr_cg_throttled++;
                                  ^~~~~~~~~~~~~~~
                                  rt_cg_throttled
   kernel/sched/sched.h:687:8: note: 'rt_cg_throttled' declared here
           int                     rt_cg_throttled;
                                   ^
   In file included from kernel/sched/build_policy.c:45:
   kernel/sched/rt.c:1360:11: error: no member named 'nr_cg_throttled' in 'struct rt_rq'; did you mean 'rt_cg_throttled'?
                           rt_rq->nr_cg_throttled--;
                                  ^~~~~~~~~~~~~~~
                                  rt_cg_throttled
   kernel/sched/sched.h:687:8: note: 'rt_cg_throttled' declared here
           int                     rt_cg_throttled;
                                   ^
   In file included from kernel/sched/build_policy.c:45:
   kernel/sched/rt.c:1379:2: error: must use 'struct' tag to refer to type 'rt_rq'
           rt_rq->rt_se_running--;
           ^
           struct 
   kernel/sched/rt.c:1379:7: error: expected identifier or '('
           rt_rq->rt_se_running--;
                ^
   10 errors generated.


vim +1092 kernel/sched/rt.c

  1042	
  1043	/*
  1044	 * Update the current task's runtime statistics. Skip current tasks that
  1045	 * are not in our scheduling class.
  1046	 */
  1047	static void update_curr_rt(struct rq *rq)
  1048	{
  1049		struct task_struct *curr = rq->curr;
  1050		struct sched_rt_entity *rt_se = &curr->rt;
  1051		u64 delta_exec;
  1052		u64 now;
  1053	
  1054		if (curr->sched_class != &rt_sched_class)
  1055			return;
  1056	
  1057		now = rq_clock_task(rq);
  1058		delta_exec = now - curr->se.exec_start;
  1059		if (unlikely((s64)delta_exec <= 0))
  1060			return;
  1061	
  1062		schedstat_set(curr->stats.exec_max,
  1063			      max(curr->stats.exec_max, delta_exec));
  1064	
  1065		trace_sched_stat_runtime(curr, delta_exec, 0);
  1066	
  1067		update_current_exec_runtime(curr, now, delta_exec);
  1068	
  1069		if (!rt_bandwidth_enabled())
  1070			return;
  1071	
  1072		for_each_sched_rt_entity(rt_se) {
  1073			struct rt_rq *rt_rq = rt_rq_of_se(rt_se);
  1074			int exceeded;
  1075	
  1076			if (sched_rt_runtime(rt_rq) != RUNTIME_INF) {
  1077				bool tbefore;
  1078				raw_spin_lock(&rt_rq->rt_runtime_lock);
  1079				tbefore = rt_rq_throttled(rt_rq);
  1080	
  1081				rt_rq->rt_time += delta_exec;
  1082				exceeded = sched_rt_runtime_exceeded(rt_rq);
  1083				if (exceeded) {
  1084					resched_curr(rq);
  1085	
  1086					/*
  1087					 * Whenever reasons of our parent group's
  1088					 * throttling change (bw ran out here), we have
  1089					 * to adjust grandparent's cg throttling state
  1090					 * and so forth. @rt_se can be a task or group.
  1091					 */
> 1092					if (!tbefore && rt_se->parent)
> 1093						adjust_cg_throt_update(rt_se->parent, true);
  1094				}
  1095	
  1096				raw_spin_unlock(&rt_rq->rt_runtime_lock);
  1097				if (exceeded)
  1098					do_start_rt_bandwidth(sched_rt_bandwidth(rt_rq));
  1099			}
  1100		}
  1101	}
  1102	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
