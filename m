Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F2339AFD;
	Sun,  7 Apr 2024 17:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712511379; cv=none; b=b6T3Tyg9UtkmcK9qFRq5RNNu8vRmfzgabED0iVwwEjg99irqCg/uUCClDil5qS82krgGl1XCCad+5RwNBm2tKCbTcQVeVcB+7EdB+GNPaL57LS5vP6oNjQdoVv95dzkvRPZOt4uN5ZIOKlegqkR3FG15sTldgL3DvglPUoUsTLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712511379; c=relaxed/simple;
	bh=Di3bYVYiqQViMcIDOOunIKWECh+4o0RiAkw/K9cEMpA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=flMyzQnyIz/G8dfHd/ZJbwzu0Z/56uc2lv7vmV0L5qA9Jg/qvqMvXcsIhvX6gES69hqK73LNlTgCT2iTO7OoMyrclM+ideAJcGkjl+BEyxk4X5zAprDKApIQEK7x+KL3ItH0D73OHbzuEt/uWEWQU56OJezWeJZSaWVdbeVgII0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TKulg8d4; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TKulg8d4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712511377; x=1744047377;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Di3bYVYiqQViMcIDOOunIKWECh+4o0RiAkw/K9cEMpA=;
  b=TKulg8d4sYPy/cl2pHR040h7Yez/sumAUzOZmmZ0HfHX3Bm8IBMkabwf
   ilBEGxDefFy25eqBeDXoP4kVakXpvEA3VgO0YHjJl0hQMKyu+dJj2roMC
   NECS3pHaSnOHFqFhKkDWliGwnGWVavfvo7ezdx4kCwO2czHNv4G51vYWz
   Cykqhy2Cqztx/UgXibZ7c3Ne1NIl50ht6gtor/pQ1Ibw/L4rtjbpNNUAW
   XHEDDdDCRT7vqSPFzQL6FOGRe/hl6yS3XqcRUES00Jig/XzL+VJEMHeyC
   6iZh2rkj353Mlqpwm5tLz2XBwrRgKZNZrUfeujEI48L5vpX1K+/eP84CQ
   w==;
X-CSE-ConnectionGUID: 0eTbFFGYTRKe5BRyqTO3kQ==
X-CSE-MsgGUID: g4a7f3QiRGylDyw9eIe9bQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="25288012"
X-IronPort-AV: E=Sophos;i="6.07,185,1708416000"; 
   d="scan'208";a="25288012"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2024 10:36:16 -0700
X-CSE-ConnectionGUID: l114xhXUS5W6IVP/OHQzjQ==
X-CSE-MsgGUID: 9QF3lkKhTsaOij/DGyJP5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,185,1708416000"; 
   d="scan'208";a="42834619"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 Apr 2024 10:36:15 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtWRB-0004WI-0P;
	Sun, 07 Apr 2024 17:36:13 +0000
Date: Mon, 8 Apr 2024 01:35:55 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:uclamp-max-aggregation 11/13]
 kernel/sched/core.c:4877:7: error: call to undeclared function
 'ignore_task_perf'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202404080137.MLcZDEhs-lkp@intel.com>
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
commit: e3d0c229d3ce487080291ad232b68805d3c9f830 [11/13] sched/schedutil: Ignore perf requests for short running tasks
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20240408/202404080137.MLcZDEhs-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 233c030dcb18880d5f0a749573f11f96f35e76b8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240408/202404080137.MLcZDEhs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404080137.MLcZDEhs-lkp@intel.com/

Note: the qais-yousef/uclamp-max-aggregation HEAD 3173a853e6c16e1dcb09d392ef1e9b5a06448696 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from kernel/sched/core.c:9:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/arm/include/asm/cacheflush.h:10:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   kernel/sched/core.c:4869:24: error: no member named 'decayed' in 'struct cfs_rq'
    4869 |                 if (unlikely(rq->cfs.decayed)) {
         |                              ~~~~~~~ ^
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   kernel/sched/core.c:4870:12: error: no member named 'decayed' in 'struct cfs_rq'
    4870 |                         rq->cfs.decayed = false;
         |                         ~~~~~~~ ^
>> kernel/sched/core.c:4877:7: error: call to undeclared function 'ignore_task_perf'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    4877 |                 if (ignore_task_perf(current))
         |                     ^
   kernel/sched/core.c:4883:21: error: no member named 'avg' in 'struct cfs_rq'
    4883 |                 rq_util = rq->cfs.avg.util_avg;
         |                           ~~~~~~~ ^
   1 warning and 4 errors generated.


vim +/ignore_task_perf +4877 kernel/sched/core.c

  4850	
  4851	static inline void update_cpufreq_ctx_switch(struct rq *rq)
  4852	{
  4853		if (unlikely(current->sched_class == &stop_sched_class))
  4854			return;
  4855	
  4856		if (unlikely(current->sched_class == &idle_sched_class))
  4857			return;
  4858	
  4859		if (unlikely(task_has_idle_policy(current)))
  4860			return;
  4861	
  4862		if (likely(fair_policy(current->policy))) {
  4863			unsigned long uclamp_min, uclamp_max;
  4864			unsigned long rq_util;
  4865	
  4866			/*
  4867			 * Allow cpufreq updates once for every update_load_avg() decay.
  4868			 */
  4869			if (unlikely(rq->cfs.decayed)) {
  4870				rq->cfs.decayed = false;
  4871				goto force_update;
  4872			}
  4873	
  4874			if (unlikely(current->in_iowait))
  4875				goto force_update;
  4876	
> 4877			if (ignore_task_perf(current))
  4878				return;
  4879	
  4880			/* Force an update if perf hints are required to be applied */
  4881			uclamp_min = uclamp_eff_value(current, UCLAMP_MIN);
  4882			uclamp_max = uclamp_eff_value(current, UCLAMP_MAX);
  4883			rq_util = rq->cfs.avg.util_avg;
  4884	
  4885			if (uclamp_min > rq_util || uclamp_max < rq_util)
  4886				goto force_update;
  4887	
  4888			return;
  4889		}
  4890	
  4891		/* RT and DL should always send a freq update */
  4892	
  4893		/* XXX ignore updates for sugov worker thread */
  4894	
  4895	force_update:
  4896	
  4897		/*
  4898		 * Request freq update after __balance_callbacks to take into account
  4899		 * any changes to rq.
  4900		 */
  4901		cpufreq_update_util(rq, current->in_iowait ? SCHED_CPUFREQ_IOWAIT : 0);
  4902	}
  4903	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
