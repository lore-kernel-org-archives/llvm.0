Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245FE638;
	Thu, 17 Aug 2023 04:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692244899; x=1723780899;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=orVqou8RyBF/Hmy5cAD+RICU/TZw/A7JeuM+47uj380=;
  b=L1YEj8tcGZtWmYKtjvCMH8Nyplr0BUZTArDa/0uB+SqRIJl0O21gYg6F
   KRoWbAajC5ejR9t7hxu+NEtQWJxs5bgtLRwXASloFxq1vSpi5pt7mX4YF
   pXtjdWWU7yNIBi4abGDt7WsKnJ2qUKxTD+aDGuyxoYXdrMVfU9xtDtzD9
   xwK9gO7sqBGZwdhfYiPn8f/TXDr8D/nb1WZt0LdXEjXMgJ33eMbxlqeS3
   EP+X94R9sV+B2OduPZM4+MAxbtSUzye2w465w9a3Al4GL4Byd7PifAE58
   A1B3k8d2ffQ9IcaQ8NjX1sprrMmo1kldDMSclzzfO1QYEbmF3dU7wYXyR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="353021972"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="353021972"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 21:01:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="763878114"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="763878114"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 16 Aug 2023 21:01:12 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWUC7-0000m9-17;
	Thu, 17 Aug 2023 04:01:11 +0000
Date: Thu, 17 Aug 2023 12:01:04 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.5-rc1 142/148]
 drivers/perf/resctrl_pmu.c:77:42: error: incompatible integer to pointer
 conversion passing 'int' to parameter of type 'void *'
Message-ID: <202308171157.znEnrYHC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.5-rc1
head:   3feae02a8f8cf9aca5d7d1915ea1e026c9d3d8ec
commit: 6f03509946c70fd34341fe086038e2135d65d0a1 [142/148] drivers/perf: Add PMU to support reading resctrl counters via perf
config: i386-randconfig-r002-20230817 (https://download.01.org/0day-ci/archive/20230817/202308171157.znEnrYHC-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308171157.znEnrYHC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308171157.znEnrYHC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/perf/resctrl_pmu.c:77:42: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'void *' [-Wint-conversion]
           resctrl_arch_mon_ctx_free(r, event_num, hwc->idx);
                                                   ^~~~~~~~
   arch/x86/include/asm/resctrl.h:213:17: note: passing argument to parameter 'ctx' here
                                                void *ctx) { };
                                                      ^
>> drivers/perf/resctrl_pmu.c:147:11: error: incompatible pointer to integer conversion assigning to 'int' from 'void *' [-Wint-conversion]
           hwc->idx = resctrl_arch_mon_ctx_alloc_no_wait(r, event_num);
                    ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/resctrl_pmu.c:186:28: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'void *' [-Wint-conversion]
                                                event_num, &now, hwc->idx);
                                                                 ^~~~~~~~
   include/linux/resctrl.h:430:23: note: passing argument to parameter 'arch_mon_ctx' here
                              u64 *val, void *arch_mon_ctx);
                                              ^
   3 errors generated.


vim +77 drivers/perf/resctrl_pmu.c

    66	
    67	static void resctrl_pmu_event_destroy(struct perf_event *event)
    68	{
    69		struct hw_perf_event *hwc = &event->hw;
    70		u16 event_num = get_event(event);
    71		struct rdt_resource *r;
    72	
    73		r = resctrl_event_get_resource(event_num);
    74		if (!r)
    75			return;
    76	
  > 77		resctrl_arch_mon_ctx_free(r, event_num, hwc->idx);
    78	}
    79	
    80	static int resctrl_pmu_event_init(struct perf_event *event)
    81	{
    82		struct hw_perf_event *hwc = &event->hw;
    83		struct resctrl_pmu *resctrl_pmu = to_resctrl_pmu(event->pmu);
    84		struct device *dev = resctrl_pmu->dev;
    85		struct perf_event *sibling;
    86		struct rdt_resource *r;
    87		struct rdt_domain *d;
    88		u16 event_num, domain_id;
    89		u32 closid, rmid;
    90		int err;
    91		u64 id;
    92	
    93		if (event->attr.type != event->pmu->type)
    94			return -ENOENT;
    95	
    96		if (is_sampling_event(event) || event->attach_state & PERF_ATTACH_TASK)
    97			return -EOPNOTSUPP;
    98	
    99		if (event->cpu < 0) {
   100			dev_dbg(dev, "Per-task mode not supported\n");
   101			return -EOPNOTSUPP;
   102		}
   103	
   104		/* Verify specified event is supported on this PMU */
   105		event_num = get_event(event);
   106		if (!resctrl_event_supported(event_num)) {
   107			dev_dbg(dev, "Invalid event %d for this PMU\n", event_num);
   108			return -EINVAL;
   109		}
   110	
   111		/* Verify the resctrl group currently exists */
   112		id = get_resctrl_id(event);
   113		err = resctrl_id_decode(id, &closid, &rmid);
   114		if (err)
   115			return err;
   116	
   117		/* Sanity check we have a resource and domain for this event */
   118		r = resctrl_event_get_resource(event_num);
   119		if (!r)
   120			return -EINVAL;
   121	
   122		domain_id = get_domain(event);
   123		cpus_read_lock();
   124		d = resctrl_arch_find_domain(r, domain_id);
   125		if (!d || WARN_ON_ONCE(cpumask_empty(&d->cpu_mask))) {
   126			cpus_read_unlock();
   127			return -EINVAL;
   128		}
   129	
   130		/* This must run on one of the domain's CPUs */
   131		event->cpu = cpumask_any(&d->cpu_mask);
   132		cpus_read_unlock();
   133	
   134		if (!is_software_event(event->group_leader)) {
   135			if (event->group_leader->pmu != event->pmu)
   136				return -EINVAL;
   137		}
   138	
   139		/* Don't allow groups with other PMUs, except for s/w events */
   140		for_each_sibling_event(sibling, event->group_leader) {
   141			if (is_software_event(sibling))
   142				continue;
   143			if (sibling->pmu != event->pmu)
   144				return -EINVAL;
   145		}
   146	
 > 147		hwc->idx = resctrl_arch_mon_ctx_alloc_no_wait(r, event_num);
   148		if (hwc->idx == -ENOSPC)
   149			return -ENOSPC;
   150		event->destroy = resctrl_pmu_event_destroy;
   151		local64_set(&hwc->prev_count, 0);
   152		local64_set(&event->count, 0);
   153	
   154		return err;
   155	}
   156	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
