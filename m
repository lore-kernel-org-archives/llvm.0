Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFC822E9EC;
	Fri, 20 Dec 2024 17:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734715980; cv=none; b=I6CgBDTO5KyV7Kd3rV7CV7KRfn0yHQUWUnUQw0fd2nrY7ZZnWXvEJqSKajyVN9UARgJS4DhLa3sIKzq/7yI42TAkuUi3LjTj2x3elRZQfV0NAxc6rFiUimLFvXnlJddxv3aBTYBgriZcglbGJSxoe1YKBEqhpGlRE/NaUyHwsXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734715980; c=relaxed/simple;
	bh=GTjFQmNWB89cUXmolLY98ISR1SUmZ353sAwVpVGzu40=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pcn6Jd81QUa3WHsIHGB4J3wAGNnUCKSm4LkfulQQHHFZ54g/7fp7PFdTKYfeX/rx9Az/hywKSEmEpK3cdqaJ5UMBfeZuLElhXgrUGhLAtDGDgVCSIOmkgeTM+Iwg6w2BzNcE0L5eA9b5qOwwEwqE0QeZorfX9VwQrs4aW6DQqcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FVQTT7xo; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FVQTT7xo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734715978; x=1766251978;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GTjFQmNWB89cUXmolLY98ISR1SUmZ353sAwVpVGzu40=;
  b=FVQTT7xoHxmrR1C+/VvBdi/DsoH1pC0pK13rMvDmZ7FFm9mp4Iyonf7N
   k8g12IOtuUkys3T7XgWz9oY9i0zGlKkVoq1Ab+GUy3eElHtdyJmlO69Jg
   Rp46suAMSOaYlnt9c0v0T6WG8NVAExQ8ePzDstQd5Lkde+xtKactAXsNN
   jXF7/AzhHutE/rbrwnF+EneiFlprgJEvdo+sxak1ZuQRkIGdjp7Qa0JqP
   19HaRYOtaWXVBir0p55hEp8Nr6tyRKVwXzxI1OvU9FcbXANjMOIjgs+3n
   uGGoAImvWAHqqFGwauwbBrta6EephhMfdyavMGPbVZKzGQpFjN59D8KJT
   A==;
X-CSE-ConnectionGUID: e4IWbLjQRBCPaW0Q2jAD/Q==
X-CSE-MsgGUID: 3xRzqo3MTG63o/FJo0DJWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="35436418"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="35436418"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 09:32:55 -0800
X-CSE-ConnectionGUID: 04IV399hRoaEYb5nU8SAjQ==
X-CSE-MsgGUID: LkNTnJoBSHikMo+2uWshIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103552813"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 20 Dec 2024 09:32:53 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOgrr-0001UB-2O;
	Fri, 20 Dec 2024 17:32:51 +0000
Date: Sat, 21 Dec 2024 01:32:44 +0800
From: kernel test robot <lkp@intel.com>
To: Hao Jia <jiahao1@lixiang.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:sched/core 43/43] kernel/sched/fair.c:9407:43: error:
 no member named 'nr_running' in 'struct cfs_rq'
Message-ID: <202412210109.DRENUSxN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
head:   9eca7eecba70c32720d1fab922aa6d7ec5dfb6c1
commit: 9eca7eecba70c32720d1fab922aa6d7ec5dfb6c1 [43/43] sched/core: Prioritize migrating eligible tasks in sched_balance_rq()
config: x86_64-buildonly-randconfig-002-20241220 (https://download.01.org/0day-ci/archive/20241221/202412210109.DRENUSxN-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412210109.DRENUSxN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412210109.DRENUSxN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/fair.c:25:
   In file included from include/linux/hugetlb_inline.h:7:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/fair.c:9407:43: error: no member named 'nr_running' in 'struct cfs_rq'
    9407 |         if (sched_feat(PLACE_LAG) && dst_cfs_rq->nr_running &&
         |                                      ~~~~~~~~~~  ^
   4 warnings and 1 error generated.


vim +9407 kernel/sched/fair.c

  9389	
  9390	/*
  9391	 * Check whether the task is ineligible on the destination cpu
  9392	 *
  9393	 * When the PLACE_LAG scheduling feature is enabled and
  9394	 * dst_cfs_rq->nr_running is greater than 1, if the task
  9395	 * is ineligible, it will also be ineligible when
  9396	 * it is migrated to the destination cpu.
  9397	 */
  9398	static inline int task_is_ineligible_on_dst_cpu(struct task_struct *p, int dest_cpu)
  9399	{
  9400		struct cfs_rq *dst_cfs_rq;
  9401	
  9402	#if CONFIG_FAIR_GROUP_SCHED
  9403		dst_cfs_rq = task_group(p)->cfs_rq[dest_cpu];
  9404	#else
  9405		dst_cfs_rq = &cpu_rq(dest_cpu)->cfs;
  9406	#endif
> 9407		if (sched_feat(PLACE_LAG) && dst_cfs_rq->nr_running &&
  9408		    !entity_eligible(task_cfs_rq(p), &p->se))
  9409			return 1;
  9410	
  9411		return 0;
  9412	}
  9413	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
