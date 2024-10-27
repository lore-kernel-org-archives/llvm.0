Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB30018130D;
	Sun, 27 Oct 2024 21:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730064528; cv=none; b=iaKZf12cA7XC5UcXFYqjfvr+OOY2HMdJ2WmRHGTArvvexa52kqwPlxK6cHPtpAAa5lWbXodiix0Hq+4BK0b4O3KbYL0J7E2XuFtELDVCVK15wtl1oHGCfT7u3fd3WdSTBi9yBP4WlT56xPdElGeu1St8/HqWVWQnOKnzIpAGi4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730064528; c=relaxed/simple;
	bh=wvyuEniFuEGNVmlid3sUoxjJQ2N8PeWN7dBJQKmQcPI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WxOoEUsHvMrRssqqI3k+IMfx+nLTVTzTZj63Kh7zV406oa4cNCfaJEljGy5sdsGGiycUK77pXb3B4RaTIT+3Y/ADh9lQ+vl2l/RQp5YC0EEtYaYqpLeXb6N4a9Q18LilyDIBecsZBe8ZSlK5VxiLb/pEVN2DQiLCAKZ6+s2g2/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N3Nuv2Xg; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N3Nuv2Xg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730064525; x=1761600525;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wvyuEniFuEGNVmlid3sUoxjJQ2N8PeWN7dBJQKmQcPI=;
  b=N3Nuv2XgBn4ltsYPCDk5Kss7QrEySUTIaF5J3Gjxl4/80HmKdqBaCXNM
   2I5cFZCJpBto434Pv4aokYqV31pR7PCTlJj3xJLHIA7MYSvvrC0nxq4so
   ND04/Nw5U/UrzxsdzTDudIrf6wGKJCbNs7TOn1wPtoDCM3YCAxNv2wvtv
   jIPvIDu4Jm8dBlcpQ6fJOPk3yElrVK3WIAU44U6n5xS11EizQmeDemBsF
   8P+mtJuCe6qnfDxaNvRVFMAQXFwweBLs7xURWn4oLY73afET8uxnvWqLm
   K5GBXHEmzuDOkAh2ZKqDcihU4i+KfetLszMUtgR68qnytCunOakbZs+OX
   g==;
X-CSE-ConnectionGUID: Kl3w25hhS8Gqzt8cdpFEug==
X-CSE-MsgGUID: 2fC6MrdwTlKeCDwIVXsmFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52215312"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="52215312"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2024 14:28:45 -0700
X-CSE-ConnectionGUID: yfKe8mytS+us57BSdDhyKg==
X-CSE-MsgGUID: lfS1RMMtTT+l35WDOroaNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,237,1725346800"; 
   d="scan'208";a="104754183"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 27 Oct 2024 14:28:43 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5AoT-000b0W-1z;
	Sun, 27 Oct 2024 21:28:41 +0000
Date: Mon, 28 Oct 2024 05:28:29 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linyunsheng:mpmc 1/1] mm/page_frag_test.c:448:46: warning: variable
 'start' is uninitialized when used here
Message-ID: <202410280506.sLOvwhVO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gestionlin/linux.git mpmc
head:   ec46c0c4fe8ec793a5b918d5996fca2097581589
commit: ec46c0c4fe8ec793a5b918d5996fca2097581589 [1/1] mm: page_frag: add a test module for page_frag
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241028/202410280506.sLOvwhVO-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241028/202410280506.sLOvwhVO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410280506.sLOvwhVO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/page_frag_test.c:9:
   In file included from include/linux/mm.h:2213:
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
>> mm/page_frag_test.c:448:46: warning: variable 'start' is uninitialized when used here [-Wuninitialized]
     448 |         duration = (u64)ktime_us_delta(ktime_get(), start);
         |                                                     ^~~~~
   mm/page_frag_test.c:390:15: note: initialize the variable 'start' to silence this warning
     390 |         ktime_t start;
         |                      ^
         |                       = 0
   5 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]


vim +/start +448 mm/page_frag_test.c

   386	
   387	static int __init page_frag_test_init(void)
   388	{
   389		struct task_struct *tsk;
   390		ktime_t start;
   391		u64 duration;
   392		int cpu, ret;
   393	
   394		if (!cpumask_available(pop_cpumask)) {
   395			if (!alloc_cpumask_var(&pop_cpumask, GFP_KERNEL)) {
   396				ret = -ENOMEM;
   397				goto err_cpumask;
   398			}
   399	
   400			cpumask_copy(pop_cpumask, cpu_online_mask);
   401		}
   402	
   403		if (!cpumask_available(push_cpumask)) {
   404			if (!alloc_cpumask_var(&push_cpumask, GFP_KERNEL)) {
   405				ret = -ENOMEM;
   406				goto err_cpumask;
   407			}
   408	
   409			cpumask_copy(push_cpumask, cpu_online_mask);
   410		}
   411	
   412		if (!cpumask_subset(pop_cpumask, cpu_online_mask) ||
   413		    !cpumask_subset(push_cpumask, cpu_online_mask)) {
   414			ret = -EINVAL;
   415			goto err_cpumask;
   416		}
   417	
   418		ret = objpool_init(&ptr_pool, nr_objs, GFP_KERNEL);
   419		if (ret)
   420			goto err_cpumask;
   421	
   422		atomic_set(&nthreads, 0);
   423		init_completion(&wait);
   424	
   425		for_each_cpu(cpu, push_cpumask) {
   426			tsk = kthread_create_on_cpu(page_frag_push_thread, &ptr_pool,
   427						    cpu, "push.*%u");
   428			if (IS_ERR(tsk))
   429				break;
   430	
   431			wake_up_process(tsk);
   432			atomic_inc(&nthreads);
   433		}
   434	
   435		for_each_cpu(cpu, pop_cpumask) {
   436			tsk = kthread_create_on_cpu(page_frag_pop_thread, &ptr_pool,
   437						    cpu, "pop.*%u");
   438			if (IS_ERR(tsk))
   439				break;
   440	
   441			wake_up_process(tsk);
   442			atomic_inc(&nthreads);
   443		}
   444	
   445		pr_info("waiting for test to complete\n");
   446		wait_for_completion(&wait);
   447	
 > 448		duration = (u64)ktime_us_delta(ktime_get(), start);
   449		pr_info("%d of iterations for testing took: %lluus\n", nr_test,
   450			duration);
   451	
   452		objpool_free(&ptr_pool);
   453		return -EAGAIN;
   454	
   455	err_cpumask:
   456		if (cpumask_available(pop_cpumask))
   457			free_cpumask_var(pop_cpumask);
   458	
   459		if (cpumask_available(push_cpumask))
   460			free_cpumask_var(push_cpumask);
   461	
   462		return ret;
   463	}
   464	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
