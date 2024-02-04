Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2164621A0B;
	Sun,  4 Feb 2024 11:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707046950; cv=none; b=l/D7sUM10W9nwLRBnMwisaYXXzwo7qvxSZpl5TCHjQdM0jNftIHRQ9+oUwEQNw21Y7+eAH7NjYf0sT3QtMY3TTJS0LoSjk2nEk9CuloQsmwBTvzDWNb8CvpJhmmZHy1XjcQB0Yjjn3cv+Cvb/bG55pB3pcQCcphR0LDwouskCFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707046950; c=relaxed/simple;
	bh=pofC3jp2b9hh6FrMZhPrwCfnxoRqVSOOZuHliZyl42I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=teKwqQ2aCeIn2JmVPfM/wFgmvL3xj/KVq/2/HmUVCklJtGrdXUwu7xah9aNrYAqIr0yMM71LvxftRdYMUfkyOGLoqNnGTJs25cIGrKGy8yWW8Z/sUZ59ck2gV4O3Pf2BwnPwOK8b1WN0rRrWuiDhrw5yB+ym/uaKPBKCFzh2ciE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=geCDEAr4; arc=none smtp.client-ip=192.55.52.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="geCDEAr4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707046948; x=1738582948;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pofC3jp2b9hh6FrMZhPrwCfnxoRqVSOOZuHliZyl42I=;
  b=geCDEAr4L8YD37L6Z8SHymJC0llOiNwGPEEUlxx2AeOrJ24SCSf/Vg4o
   mK7CzDHPiq79I4U8LZSV3fGdstcVDT7IJbWuT7XLVgvUtRLegQXDI4POM
   17eQ87PNkyMaeffsr/fTEHNmW1jehCTlnpSsABY0boZUoduFtKFkeCRDi
   4JENoJ28xm8o3X6Ke83p30Piy0n/oOQEMDNmyGkhkMgWpyqWTKG31WJDd
   KlW4cKJ0w75TFaXKUrf6/iNyGBoEwiTdrjY7nlf7UXDyIA9arY0dvO2Rp
   E2iqhottCT4/Mjr/G5NC2Slbmbld/Qpvl01hD9Kry4N+V/cgRoqrzeR3X
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="435522416"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="435522416"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2024 03:42:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="812942"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 04 Feb 2024 03:42:26 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWatD-0006IQ-0l;
	Sun, 04 Feb 2024 11:42:23 +0000
Date: Sun, 4 Feb 2024 19:42:16 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:uclamp-max-aggregation 14/14]
 kernel/sched/core.c:4904:7: error: call to undeclared function
 '__ignore_task_perf'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202402041934.sAUpTAtM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux uclamp-max-aggregation
head:   05441ef50df2e5195435b09974271f382d8f946d
commit: 05441ef50df2e5195435b09974271f382d8f946d [14/14] sched: Make iowait boost per task
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20240204/202402041934.sAUpTAtM-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240204/202402041934.sAUpTAtM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402041934.sAUpTAtM-lkp@intel.com/

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
  4896			if (unlikely(rq->cfs.decayed)) {
  4897				rq->cfs.decayed = false;
  4898				goto force_update;
  4899			}
  4900	
  4901			if (unlikely(current->in_iowait))
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
