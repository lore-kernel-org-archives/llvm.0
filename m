Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25EF219ED;
	Sat, 11 May 2024 20:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715457625; cv=none; b=OOWL1ETjUs73J6qX87L/FVSvANNQui5eQqzsGTGk2GsSJl8myjSZwuOl/vnTW6ngwKcbzWusmtDe8ScwUapRjA130SVQNapaTKF/9m6DQrit0d1U7i/IMu9x3U9/KapzRk68EXYFahmr0IrsdC1M82VskKpn5Zsg+bQAm8uTm2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715457625; c=relaxed/simple;
	bh=3jvkGdtrJXoy4Y8yeBy6oXcB3RSZl9DwVg11LvbE9EQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m4YKiGF5+z5oBha0wI/3/kNDpuVOCBAF9scruW3KTaCXyUaAfPVVkYeJ0pzTNWqA1EBPFMXtcqIWPk4Uxr9QHTtDSDrrSff/J3jt5uxIGQtuBrWOa0dRx8OG+umTvHPRhufyVCQ5sGpgx7s4WtWFRU9d+pd+9uixndRmy4VeflI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BTu64PNt; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BTu64PNt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715457624; x=1746993624;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3jvkGdtrJXoy4Y8yeBy6oXcB3RSZl9DwVg11LvbE9EQ=;
  b=BTu64PNtw0e+YD3tpwp+lLQPcPFr9onQJY+rKbLDeD/OOGmaOh2yvLDj
   Po+Yzb8bgjduujrIBHxkWjj7CetNDvK1zcaaaj69+AKMHjNHNSd4DmYLz
   eLzYXJLD1NSXanP26jINUmFeiWZtbvAIUp1fAbWpK7xi4xDEhharf5p5a
   exWR5RQ5nK7ODJwI/TgI5PPwAtRjDOidrHFaz++10xXsXdnXno7qYAtPu
   tpQ9pU/ncd9YT1PqWulTY1ApsagRLEoI45wslJA7ykbD5ZVIu95gThoHk
   n7PaVBXMlZ7Zfg3PxDuXOCaQJ8DF28QHAn4dRuD0uhYih2bvUf+a4d6Rf
   Q==;
X-CSE-ConnectionGUID: qUrbu5wLQyue0iqrO+DzCA==
X-CSE-MsgGUID: ZhJTnawVTuKQ/jY0crE/Tw==
X-IronPort-AV: E=McAfee;i="6600,9927,11070"; a="22037206"
X-IronPort-AV: E=Sophos;i="6.08,154,1712646000"; 
   d="scan'208";a="22037206"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2024 13:00:23 -0700
X-CSE-ConnectionGUID: 4Jg6KmMLTo+XAh+6FpKTaw==
X-CSE-MsgGUID: 1pEnVGpFSzqYEy3U/Pln9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,154,1712646000"; 
   d="scan'208";a="30020185"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 May 2024 13:00:22 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5stH-0007n9-2z;
	Sat, 11 May 2024 20:00:19 +0000
Date: Sun, 12 May 2024 03:59:30 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:improve-sched-cpufreq-interaction 1/1]
 kernel/sched/core.c:5169:17: error: incompatible pointer to integer
 conversion passing 'struct task_struct *' to parameter of type 'int'
Message-ID: <202405120337.tA7GEqCH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux improve-sched-cpufreq-interaction
head:   7cf8a5268d5386ece305e160647503114338282b
commit: 7cf8a5268d5386ece305e160647503114338282b [1/1] sched: Consolidate cpufreq updates
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20240512/202405120337.tA7GEqCH-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240512/202405120337.tA7GEqCH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405120337.tA7GEqCH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/core.c:5169:17: error: incompatible pointer to integer conversion passing 'struct task_struct *' to parameter of type 'int' [-Wint-conversion]
    5169 |                 if (rt_policy(prev)) {
         |                               ^~~~
   kernel/sched/sched.h:193:33: note: passing argument to parameter 'policy' here
     193 | static inline int rt_policy(int policy)
         |                                 ^
   1 error generated.


vim +5169 kernel/sched/core.c

  5136	
  5137	static inline void update_cpufreq_ctx_switch(struct rq *rq, struct task_struct *prev)
  5138	{
  5139	#ifdef CONFIG_CPU_FREQ
  5140		/*
  5141		 * RT and DL should always send a freq update. But we can do some
  5142		 * simple checks to avoid it when we know it's not necessary.
  5143		 *
  5144		 * iowait_boost will always trigger a freq update too.
  5145		 *
  5146		 * Fair tasks will only trigger an update if the root cfs_rq has
  5147		 * decayed.
  5148		 *
  5149		 * Everything else should do nothing.
  5150		 */
  5151		switch (current->policy) {
  5152		case SCHED_NORMAL:
  5153		case SCHED_BATCH:
  5154			if (unlikely(current->in_iowait)) {
  5155				cpufreq_update_util(rq, SCHED_CPUFREQ_IOWAIT | SCHED_CPUFREQ_FORCE_UPDATE);
  5156				return;
  5157			}
  5158	
  5159	#ifdef CONFIG_SMP
  5160			if (unlikely(rq->cfs.decayed)) {
  5161				rq->cfs.decayed = false;
  5162				cpufreq_update_util(rq, 0);
  5163				return;
  5164			}
  5165	#endif
  5166			return;
  5167		case SCHED_FIFO:
  5168		case SCHED_RR:
> 5169			if (rt_policy(prev)) {
  5170	#ifdef CONFIG_UCLAMP_TASK
  5171				unsigned long curr_uclamp_min = uclamp_eff_value(current, UCLAMP_MIN);
  5172				unsigned long prev_uclamp_min = uclamp_eff_value(prev, UCLAMP_MIN);
  5173	
  5174				if (curr_uclamp_min == prev_uclamp_min)
  5175	#endif
  5176					return;
  5177			}
  5178	#ifdef CONFIG_SMP
  5179			/* Stopper task masquerades as RT */
  5180			if (unlikely(current->sched_class == &stop_sched_class))
  5181				return;
  5182	#endif
  5183			cpufreq_update_util(rq, SCHED_CPUFREQ_FORCE_UPDATE);
  5184			return;
  5185		case SCHED_DEADLINE:
  5186			if (current->dl.flags & SCHED_FLAG_SUGOV) {
  5187				/* Ignore sugov kthreads, they're responding to our requests */
  5188				return;
  5189			}
  5190			cpufreq_update_util(rq, SCHED_CPUFREQ_FORCE_UPDATE);
  5191			return;
  5192		default:
  5193			return;
  5194		}
  5195	#endif
  5196	}
  5197	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
