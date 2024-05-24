Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD19D3A1DC;
	Fri, 24 May 2024 18:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716575866; cv=none; b=K5U7BXQX/lFUTGTKovbDRgR0FbKCshv/DDhW2zzSkKrF7PnQpWYxZSjENgmZkRXWuPz98CuNyhipcYgT2dmDH18laqoIQdoiNSV6WdxilGfJJ6qRwH6bvEWNZMlRGkJPjQxXPo5h+yE+tLQ1GoASnBYhxFAy+q/t9i2n3IxxILk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716575866; c=relaxed/simple;
	bh=Jq9MbFtjZyImQcGGJi5sO2Y9JBJQH7iQOO4CAJHvsNM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RJO37if43qvnPr0FvBO4UbL98Qt6TcuWWEYRgoXiE7Z7vlF27Cflj4eMFa2ioSRoq+W/mXDZVTm0yZyleVVpJIAX1I48Rd1BXASb2B22MGFrzIXS5Kq6qld2hIXyZov6SQcaszXc5QSI9MAIR9WFcrXwbkxq18HtAFF/ALJGRCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JVcfiOxQ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JVcfiOxQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716575865; x=1748111865;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jq9MbFtjZyImQcGGJi5sO2Y9JBJQH7iQOO4CAJHvsNM=;
  b=JVcfiOxQGsrlvXMNQUAt6qYRC8F1Lule/oI/SW3S0e9VAL7Vjqkuw7D7
   P5pug1eBexwhSGpLL617Bj3YQCUuCGFS8xyDA+h5vsZIowwD7GKtxalo1
   Z0+RuJXhYquSYc/xsJpzYu7xFaAXiLjvb8Bze7IhSZm7eob9RyFGC2PuD
   HAFkg7SnbXXb56Xd7gBIPkweJWUsKyIFcCjFxkw8o7PQ+i3jWUPXjpCGV
   44Z79N5KFulrjAVNk6tFh0IbotMupSNvGuFK0/EK98hQ7rGIHS0sCJx1D
   t4ojHLkcXgrNZJQHujg+Aa6b4f3sG1DFQM74TAQNtg14TjhPW9XBibGMf
   A==;
X-CSE-ConnectionGUID: lOluMbJzQvi3d+G9+XZFtA==
X-CSE-MsgGUID: 6ctMpKsUSZS/5ttofcyj1Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="13088211"
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; 
   d="scan'208";a="13088211"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 11:37:44 -0700
X-CSE-ConnectionGUID: L8xXEyz0RNWHGPY2MR0s1w==
X-CSE-MsgGUID: UiXIvQG5QpylQMDMnU0NKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; 
   d="scan'208";a="34121123"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 24 May 2024 11:37:43 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAZnQ-0005nN-2T;
	Fri, 24 May 2024 18:37:40 +0000
Date: Sat, 25 May 2024 02:36:00 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:uclamp-max-aggregation 13/13]
 kernel/sched/core.c:4914:7: error: call to undeclared function
 '__ignore_task_perf'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202405250221.lh024Bjm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux uclamp-max-aggregation
head:   3173a853e6c16e1dcb09d392ef1e9b5a06448696
commit: 3173a853e6c16e1dcb09d392ef1e9b5a06448696 [13/13] sched: Make iowait boost per task
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20240525/202405250221.lh024Bjm-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7aa382fd7257d9bd4f7fc50bb7078a3c26a1628c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240525/202405250221.lh024Bjm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405250221.lh024Bjm-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/core.c:9:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/arm/include/asm/cacheflush.h:10:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   kernel/sched/core.c:4906:24: error: no member named 'decayed' in 'struct cfs_rq'
    4906 |                 if (unlikely(rq->cfs.decayed)) {
         |                              ~~~~~~~ ^
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   kernel/sched/core.c:4907:12: error: no member named 'decayed' in 'struct cfs_rq'
    4907 |                         rq->cfs.decayed = false;
         |                         ~~~~~~~ ^
>> kernel/sched/core.c:4914:7: error: call to undeclared function '__ignore_task_perf'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    4914 |                 if (__ignore_task_perf(current))
         |                     ^
>> kernel/sched/core.c:4918:16: error: call to undeclared function '__uclamp_eff_value'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    4918 |                 uclamp_min = __uclamp_eff_value(current, UCLAMP_MIN);
         |                              ^
   kernel/sched/core.c:4918:16: note: did you mean 'uclamp_eff_value'?
   kernel/sched/sched.h:3099:29: note: 'uclamp_eff_value' declared here
    3099 | static inline unsigned long uclamp_eff_value(struct task_struct *p,
         |                             ^
   kernel/sched/core.c:4920:21: error: no member named 'avg' in 'struct cfs_rq'
    4920 |                 rq_util = rq->cfs.avg.util_avg;
         |                           ~~~~~~~ ^
   1 warning and 5 errors generated.


vim +/__ignore_task_perf +4914 kernel/sched/core.c

  4887	
  4888	static inline void update_cpufreq_ctx_switch(struct rq *rq)
  4889	{
  4890		if (unlikely(current->sched_class == &stop_sched_class))
  4891			return;
  4892	
  4893		if (unlikely(current->sched_class == &idle_sched_class))
  4894			return;
  4895	
  4896		if (unlikely(task_has_idle_policy(current)))
  4897			return;
  4898	
  4899		if (likely(fair_policy(current->policy))) {
  4900			unsigned long uclamp_min, uclamp_max;
  4901			unsigned long rq_util;
  4902	
  4903			/*
  4904			 * Allow cpufreq updates once for every update_load_avg() decay.
  4905			 */
  4906			if (unlikely(rq->cfs.decayed)) {
  4907				rq->cfs.decayed = false;
  4908				goto force_update;
  4909			}
  4910	
  4911			if (unlikely(current->in_iowait))
  4912				goto force_update;
  4913	
> 4914			if (__ignore_task_perf(current))
  4915				return;
  4916	
  4917			/* Force an update if perf hints are required to be applied */
> 4918			uclamp_min = __uclamp_eff_value(current, UCLAMP_MIN);
  4919			uclamp_max = __uclamp_eff_value(current, UCLAMP_MAX);
  4920			rq_util = rq->cfs.avg.util_avg;
  4921	
  4922			if (uclamp_min > rq_util || uclamp_max < rq_util)
  4923				goto force_update;
  4924	
  4925			return;
  4926		}
  4927	
  4928		/* RT and DL should always send a freq update */
  4929	
  4930		/* XXX ignore updates for sugov worker thread */
  4931	
  4932	force_update:
  4933	
  4934		/*
  4935		 * Request freq update after __balance_callbacks to take into account
  4936		 * any changes to rq.
  4937		 */
  4938		cpufreq_update_util(rq, 0);
  4939	}
  4940	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
