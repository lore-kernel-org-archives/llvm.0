Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8687F;
	Sun,  3 Sep 2023 04:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693714425; x=1725250425;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hO4+GpU7gjMqt16YCjeaGqSeKGZh9XCZPAXBLn+0UAc=;
  b=HxBMxrCBRiZXbpePb4wo7PKOJUdemaDdbqvt2/xkOkWXa0u6vr8bJw6F
   d3Wl/tKCZG6Kvy9HN1ri+L3NMutZw/ZFxQN+HQ1GW9toGmxP2+2X86xh9
   k/WGbMILi/7uIuajmDWB0CWfF9asRXvjCtzhmuRY/8RyUotJuJ6YIU7v6
   umge1A3CXZclkU8jYsfqfJBgMTcP3lt7Pz1/0thzEse/hyxgh2KNHpDYE
   BODhRhPBzAlcPbZ+RCpGHQZFRPJsJC1JPfvUH8uIynIIusofcvsPTmMkd
   s5DvV84MYVDfy8am6r66mReMqrfbP2q1+NAjw3pjaF/NtDu2akvWy8S5k
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="376352497"
X-IronPort-AV: E=Sophos;i="6.02,223,1688454000"; 
   d="scan'208";a="376352497"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2023 21:13:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="914133740"
X-IronPort-AV: E=Sophos;i="6.02,223,1688454000"; 
   d="scan'208";a="914133740"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 02 Sep 2023 21:13:42 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qceUW-0002sj-1e;
	Sun, 03 Sep 2023 04:13:40 +0000
Date: Sun, 3 Sep 2023 12:12:40 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:uclamp-max-aggregation 2/2]
 kernel/sched/cpufreq_schedutil.c:285:10: error: call to undeclared function
 'uclamp_util_with'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202309031224.6sucWvg7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux uclamp-max-aggregation
head:   1c5e789f50e8f3bce19ec226e1971186ab7d35c6
commit: 1c5e789f50e8f3bce19ec226e1971186ab7d35c6 [2/2] sched/uclamp: Remove rq max aggregation
config: i386-buildonly-randconfig-004-20230903 (https://download.01.org/0day-ci/archive/20230903/202309031224.6sucWvg7-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230903/202309031224.6sucWvg7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309031224.6sucWvg7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:69:
>> kernel/sched/cpufreq_schedutil.c:285:10: error: call to undeclared function 'uclamp_util_with'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           boost = uclamp_util_with(boost, cpu_rq(sg_cpu->cpu)->curr);
                   ^
   kernel/sched/cpufreq_schedutil.c:285:10: note: did you mean 'uclamp_rq_util_with'?
   kernel/sched/sched.h:3029:15: note: 'uclamp_rq_util_with' declared here
   unsigned long uclamp_rq_util_with(struct rq *rq, unsigned long util,
                 ^
   1 error generated.


vim +/uclamp_util_with +285 kernel/sched/cpufreq_schedutil.c

   235	
   236	/**
   237	 * sugov_iowait_apply() - Apply the IO boost to a CPU.
   238	 * @sg_cpu: the sugov data for the cpu to boost
   239	 * @time: the update time from the caller
   240	 * @max_cap: the max CPU capacity
   241	 *
   242	 * A CPU running a task which woken up after an IO operation can have its
   243	 * utilization boosted to speed up the completion of those IO operations.
   244	 * The IO boost value is increased each time a task wakes up from IO, in
   245	 * sugov_iowait_apply(), and it's instead decreased by this function,
   246	 * each time an increase has not been requested (!iowait_boost_pending).
   247	 *
   248	 * A CPU which also appears to have been idle for at least one tick has also
   249	 * its IO boost utilization reset.
   250	 *
   251	 * This mechanism is designed to boost high frequently IO waiting tasks, while
   252	 * being more conservative on tasks which does sporadic IO operations.
   253	 */
   254	static void sugov_iowait_apply(struct sugov_cpu *sg_cpu, u64 time,
   255				       unsigned long max_cap)
   256	{
   257		unsigned long boost;
   258	
   259		/* No boost currently required */
   260		if (!sg_cpu->iowait_boost)
   261			return;
   262	
   263		/* Reset boost if the CPU appears to have been idle enough */
   264		if (sugov_iowait_reset(sg_cpu, time, false))
   265			return;
   266	
   267		if (!sg_cpu->iowait_boost_pending) {
   268			/*
   269			 * No boost pending; reduce the boost value.
   270			 */
   271			sg_cpu->iowait_boost >>= 1;
   272			if (sg_cpu->iowait_boost < IOWAIT_BOOST_MIN) {
   273				sg_cpu->iowait_boost = 0;
   274				return;
   275			}
   276		}
   277	
   278		sg_cpu->iowait_boost_pending = false;
   279	
   280		/*
   281		 * sg_cpu->util is already in capacity scale; convert iowait_boost
   282		 * into the same scale so we can compare.
   283		 */
   284		boost = (sg_cpu->iowait_boost * max_cap) >> SCHED_CAPACITY_SHIFT;
 > 285		boost = uclamp_util_with(boost, cpu_rq(sg_cpu->cpu)->curr);
   286		if (sg_cpu->util < boost)
   287			sg_cpu->util = boost;
   288	}
   289	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
