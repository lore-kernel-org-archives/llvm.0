Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD3138DF9;
	Sun, 21 Jan 2024 22:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705875812; cv=none; b=dRONv8Faair+m2S5G8O3hi1h5Z6fwOl1GVQ918K9qqyKmglrpS8XBl2EsywCAbTQWynD8613+jP0qSSHy4Ml/b9xLjAqRDodFFNACVctC5yHx+Aw5HRUU2U28k5C9Ib/3liBvmn2druR4ZXu4/XQVcH/bSc1FDfutzv0+Bg7sMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705875812; c=relaxed/simple;
	bh=izgEGdMRNIWyWPLmsmJ97SmrEjJr0MCsrIdr4iIil4o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OoBQcE81qFgZS7LiIE79zhrwFTPPpcToyH3RBD8zpyldXps+kG++ajzeUBRXjSjbK5KjkzaIINAg3dzTgu/Gi5FwGhg89f2AnfAhxChvS5+RD+XQPAm/G8RljRULP/lI70Vrk9G7WdD3HBRWLDAxaFbCERKvWBbAE+QXavJlA88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fOnPMqme; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fOnPMqme"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705875810; x=1737411810;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=izgEGdMRNIWyWPLmsmJ97SmrEjJr0MCsrIdr4iIil4o=;
  b=fOnPMqmejyWMB5QPYukJkgVOmMu1TXZ8Dqge3qQelmQxxrQIu3QHr4dM
   yMQbZVpetLh+AObnjlNqzcO+UDfqC/j65kaBCeCylu52zwfQnSLjPZ53E
   GLviUBDUa4bge0xnf+pVTZWlITjEFkc/mbW6UmfJCGKPxacPOBKcgJmZy
   1gZIrhtcxk60BMyVbvbDomEuqxzZskQDEqjzn5YJCOfLQE6URWW3OxQnN
   /VXVkANovb2DS9dSdx/wMMQ/x9PXzGwQPj+LhIwzJKMjIs8deLpR67Tti
   M0gGNcEDOsI81dxDK7lxDbPzevu3hsq9dzw3O/SaK/heDYFek+i3rkBFY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="7826123"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="7826123"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2024 14:23:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="1032415328"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="1032415328"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 21 Jan 2024 14:23:28 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRgDt-0006DI-24;
	Sun, 21 Jan 2024 22:23:25 +0000
Date: Mon, 22 Jan 2024 06:22:34 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:uclamp-max-aggregation 13/13]
 kernel/sched/core.c:4904:7: error: call to undeclared function
 '__ignore_task_perf'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202401220601.YvBaICmR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux uclamp-max-aggregation
head:   a29c26f9317cede0f3141904d910d3125f8a82ea
commit: a29c26f9317cede0f3141904d910d3125f8a82ea [13/13] sched: Make iowait boost per task
config: i386-buildonly-randconfig-004-20240122 (https://download.01.org/0day-ci/archive/20240122/202401220601.YvBaICmR-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240122/202401220601.YvBaICmR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401220601.YvBaICmR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/core.c:4904:7: error: call to undeclared function '__ignore_task_perf'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    4904 |                 if (__ignore_task_perf(current))
         |                     ^
>> kernel/sched/core.c:4908:16: error: call to undeclared function '__uclamp_eff_value'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    4908 |                 uclamp_min = __uclamp_eff_value(current, UCLAMP_MIN);
         |                              ^
   kernel/sched/core.c:4908:16: note: did you mean 'uclamp_eff_value'?
   kernel/sched/sched.h:3071:29: note: 'uclamp_eff_value' declared here
    3071 | static inline unsigned long uclamp_eff_value(struct task_struct *p,
         |                             ^
   2 errors generated.


vim +/__ignore_task_perf +4904 kernel/sched/core.c

  4877	
  4878	static inline void update_cpufreq_ctx_switch(struct rq *rq)
  4879	{
  4880		if (unlikely(current->sched_class == &stop_sched_class))
  4881			return;
  4882	
  4883		if (unlikely(current->sched_class == &idle_sched_class))
  4884			return;
  4885	
  4886		if (unlikely(task_has_idle_policy(current)))
  4887			return;
  4888	
  4889		if (likely(fair_policy(current->policy))) {
  4890			unsigned long uclamp_min, uclamp_max;
  4891			unsigned long rq_util;
  4892	
  4893			/*
  4894			 * Allow cpufreq updates once for every update_load_avg() decay.
  4895			 */
  4896			if (rq->cfs.decayed) {
  4897				rq->cfs.decayed = false;
  4898				goto force_update;
  4899			}
  4900	
  4901			if (current->in_iowait)
  4902				goto force_update;
  4903	
> 4904			if (__ignore_task_perf(current))
  4905				return;
  4906	
  4907			/* Force an update if perf hints are required to be applied */
> 4908			uclamp_min = __uclamp_eff_value(current, UCLAMP_MIN);
  4909			uclamp_max = __uclamp_eff_value(current, UCLAMP_MAX);
  4910			rq_util = rq->cfs.avg.util_avg;
  4911	
  4912			if (uclamp_min > rq_util || uclamp_max < rq_util)
  4913				goto force_update;
  4914	
  4915			return;
  4916		}
  4917	
  4918		/* RT and DL should always send a freq update */
  4919	
  4920		/* XXX ignore updates for sugov worker thread */
  4921	
  4922	force_update:
  4923	
  4924		/*
  4925		 * Request freq update after __balance_callbacks to take into account
  4926		 * any changes to rq.
  4927		 */
  4928		cpufreq_update_util(rq, 0);
  4929	}
  4930	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
