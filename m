Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E9A17984;
	Thu, 21 Dec 2023 07:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ak8lWz6a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703143526; x=1734679526;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nyXtCzjM0iPTI76/DRuxiOaXxBfUAxw8rgYqHkZXzH0=;
  b=Ak8lWz6ay3dQnoF4vcw0lwyAewFsW3SMjrTRRIwQgtzcneYncMU8Z66V
   AB/Qbb2dY/ESo4tXSenFrl+jWma0umE+02H362VrQg/KVQx2bfVxGNpVG
   WJ3TfbbVlcEZHxGqqnvEAyN9DojZRx2Eq1jycEY1R4r5CIsbMBMlu7AOz
   btVwedaqm2r8olC5C8vRGmU/rXsBuMfUCpueYtFP1tStDc88r0tCQJObi
   qXZGg7qtN0h45uQJK0tz2B6ZhmtAH8kNDzdQaHMUSI/Qx9PZ5YnU3l7J6
   99gpedlRhDTzsHQ9t8VxYRmfBHnfJCvehIkUxZ75PlrOxwCK7XE77Kish
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="462377704"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="462377704"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 23:25:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="18593915"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 20 Dec 2023 23:25:17 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGDQg-000856-2K;
	Thu, 21 Dec 2023 07:25:14 +0000
Date: Thu, 21 Dec 2023 15:24:38 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.7-rc2 106/110]
 drivers/perf/arm-cmn.c:2458:19: warning: incompatible integer to pointer
 conversion passing 'int' to parameter of type 'const void *'
Message-ID: <202312211544.AKL4Cr1q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.7-rc2
head:   b530deed244d9b45f3bce3cccde91f6ed0ebf7ea
commit: af8184da77bf79023a968bab12ad78de7f7311f1 [106/110] perf/arm-cmn: Stop claiming all the resources
config: arm64-randconfig-003-20231221 (https://download.01.org/0day-ci/archive/20231221/202312211544.AKL4Cr1q-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231221/202312211544.AKL4Cr1q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312211544.AKL4Cr1q-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/perf/arm-cmn.c:2458:19: warning: incompatible integer to pointer conversion passing 'int' to parameter of type 'const void *' [-Wint-conversion]
                           return PTR_ERR(-EINVAL);
                                          ^~~~~~~
   include/linux/err.h:49:61: note: passing argument to parameter 'ptr' here
   static inline long __must_check PTR_ERR(__force const void *ptr)
                                                               ^
   1 warning generated.


vim +2458 drivers/perf/arm-cmn.c

  2429	
  2430	static int arm_cmn_probe(struct platform_device *pdev)
  2431	{
  2432		struct arm_cmn *cmn;
  2433		const char *name;
  2434		static atomic_t id;
  2435		struct resource *cfg;
  2436		int err, rootnode, this_id;
  2437	
  2438		cmn = devm_kzalloc(&pdev->dev, sizeof(*cmn), GFP_KERNEL);
  2439		if (!cmn)
  2440			return -ENOMEM;
  2441	
  2442		cmn->dev = &pdev->dev;
  2443		cmn->part = (unsigned long)device_get_match_data(cmn->dev);
  2444		platform_set_drvdata(pdev, cmn);
  2445	
  2446		if (cmn->part == PART_CMN600 && has_acpi_companion(cmn->dev)) {
  2447			rootnode = arm_cmn600_acpi_probe(pdev, cmn);
  2448		} else {
  2449			rootnode = 0;
  2450	
  2451			/*
  2452			 * Avoid registering resources as the PMUs registers are
  2453			 * scattered through CMN, and may appear either side of
  2454			 * registers for other 'devices'. (e.g. the MPAM MSC controls).
  2455			 */
  2456			cfg = platform_get_resource(pdev, IORESOURCE_MEM, 0);
  2457			if (!cfg)
> 2458				return PTR_ERR(-EINVAL);
  2459			cmn->base = devm_ioremap(&pdev->dev, cfg->start, resource_size(cfg));
  2460			if (IS_ERR(cmn->base))
  2461				return PTR_ERR(cmn->base);
  2462			if (cmn->part == PART_CMN600)
  2463				rootnode = arm_cmn600_of_probe(pdev->dev.of_node);
  2464		}
  2465		if (rootnode < 0)
  2466			return rootnode;
  2467	
  2468		err = arm_cmn_discover(cmn, rootnode);
  2469		if (err)
  2470			return err;
  2471	
  2472		err = arm_cmn_init_dtcs(cmn);
  2473		if (err)
  2474			return err;
  2475	
  2476		err = arm_cmn_init_irqs(cmn);
  2477		if (err)
  2478			return err;
  2479	
  2480		cmn->cpu = cpumask_local_spread(0, dev_to_node(cmn->dev));
  2481		cmn->pmu = (struct pmu) {
  2482			.module = THIS_MODULE,
  2483			.attr_groups = arm_cmn_attr_groups,
  2484			.capabilities = PERF_PMU_CAP_NO_EXCLUDE,
  2485			.task_ctx_nr = perf_invalid_context,
  2486			.pmu_enable = arm_cmn_pmu_enable,
  2487			.pmu_disable = arm_cmn_pmu_disable,
  2488			.event_init = arm_cmn_event_init,
  2489			.add = arm_cmn_event_add,
  2490			.del = arm_cmn_event_del,
  2491			.start = arm_cmn_event_start,
  2492			.stop = arm_cmn_event_stop,
  2493			.read = arm_cmn_event_read,
  2494			.start_txn = arm_cmn_start_txn,
  2495			.commit_txn = arm_cmn_commit_txn,
  2496			.cancel_txn = arm_cmn_end_txn,
  2497		};
  2498	
  2499		this_id = atomic_fetch_inc(&id);
  2500		name = devm_kasprintf(cmn->dev, GFP_KERNEL, "arm_cmn_%d", this_id);
  2501		if (!name)
  2502			return -ENOMEM;
  2503	
  2504		err = cpuhp_state_add_instance(arm_cmn_hp_state, &cmn->cpuhp_node);
  2505		if (err)
  2506			return err;
  2507	
  2508		err = perf_pmu_register(&cmn->pmu, name, -1);
  2509		if (err)
  2510			cpuhp_state_remove_instance_nocalls(arm_cmn_hp_state, &cmn->cpuhp_node);
  2511		else
  2512			arm_cmn_debugfs_init(cmn, this_id);
  2513	
  2514		return err;
  2515	}
  2516	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
