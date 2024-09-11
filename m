Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE871B7917;
	Wed, 11 Sep 2024 20:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726086027; cv=none; b=o/OML/IGUPaD4Bba5HSJg27KfQfh2iGQ/VT8tTxOnmxHRpXMPaU9qaQVPduPUGqkLh+vBA2J3cE2oAZ55vozQifqgzOExoNW6pi3tZoXrBqvrr4+Ci3weQ7Vcq8SgtXZxQED79a7uTkKV/1sLvx1TC/jL/5qaNdU+YpgtRMEISY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726086027; c=relaxed/simple;
	bh=wHyoVIPpAR0jrjQbG5PpAGM3dgRTn11n3tGF54A8vQI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OgkCSZYwLa1IfiSb+byNqiGKvjpLQCx9TZvt6JDFJEzrm8delgR2+rewIz9UrxEwm3hHbHdLkNmm3b7FFi6SA8zUw0IQ4S5nu/gUWSIcy3NVBRpXQNp5dP2q84+oKIiNxT9wPmjs2TCxUx6vYr3h9mckmlBsj/AfwaMFNb5X5Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Egm+5LTc; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Egm+5LTc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726086025; x=1757622025;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wHyoVIPpAR0jrjQbG5PpAGM3dgRTn11n3tGF54A8vQI=;
  b=Egm+5LTciaBzkThREwLelK+1PmPSl9RM2tCn/7Cx+IrSLfeOdtdAUPIq
   IAmOGyo/rH2hnBtd1tx/1UxyUJmOKt4EtvLj3pP+OztErTkYBaFBvI3Na
   FJNeA0yXoZlX1eqJ6k4VbWaXnPwlmcD+Lz7t3J2pS2ivnPR9thvqYW1qx
   iK0j8c+bl8flPxeFw5awLjyhbDPdUr2fae944r66UfpBKY5SnvzVFSJKo
   zfM7BmyIp80zsMLB+/b2C/VbpB/Ns3BEn2+V04Fw8RcNkK+Ip7UoaIqa2
   QUmClXIKtAUJEXrdbDTVZ6NcbB+Scaz8dnL1NZxU8Uhq1ZnF91dFVblbt
   A==;
X-CSE-ConnectionGUID: YUQTx3zOR4aQujo8tHQiIQ==
X-CSE-MsgGUID: 2Wi+zLNjSR2qHeaDysZzYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="25069177"
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; 
   d="scan'208";a="25069177"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 13:20:16 -0700
X-CSE-ConnectionGUID: KOqTCO1qT3+5UoHWDVjGcw==
X-CSE-MsgGUID: C+SREGTOQEu78PUreKYEWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; 
   d="scan'208";a="98179291"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Sep 2024 13:20:14 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soToy-00046C-1c;
	Wed, 11 Sep 2024 20:20:12 +0000
Date: Thu, 12 Sep 2024 04:19:48 +0800
From: kernel test robot <lkp@intel.com>
To: Marek Maslanka <mmaslanka@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Hans de Goede <hdegoede@redhat.com>
Subject: [linux-next:master 9586/11210]
 drivers/platform/x86/intel/pmc/core.c:1501:3: error: call to undeclared
 function 'acpi_pmtmr_register_suspend_resume_callback'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202409120421.uRV5boAk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   32ffa5373540a8d1c06619f52d019c6cdc948bb4
commit: e86c8186d03a6ba018e881ed45f0962ad553e861 [9586/11210] platform/x86:intel/pmc: Enable the ACPI PM Timer to be turned off when suspended
config: x86_64-buildonly-randconfig-001-20240912 (https://download.01.org/0day-ci/archive/20240912/202409120421.uRV5boAk-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240912/202409120421.uRV5boAk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409120421.uRV5boAk-lkp@intel.com/

Note: the linux-next/master HEAD 32ffa5373540a8d1c06619f52d019c6cdc948bb4 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> drivers/platform/x86/intel/pmc/core.c:1501:3: error: call to undeclared function 'acpi_pmtmr_register_suspend_resume_callback'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1501 |                 acpi_pmtmr_register_suspend_resume_callback(pmc_core_acpi_pm_timer_suspend_resume,
         |                 ^
>> drivers/platform/x86/intel/pmc/core.c:1517:3: error: call to undeclared function 'acpi_pmtmr_unregister_suspend_resume_callback'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1517 |                 acpi_pmtmr_unregister_suspend_resume_callback();
         |                 ^
   2 errors generated.


vim +/acpi_pmtmr_register_suspend_resume_callback +1501 drivers/platform/x86/intel/pmc/core.c

  1433	
  1434	static int pmc_core_probe(struct platform_device *pdev)
  1435	{
  1436		static bool device_initialized;
  1437		struct pmc_dev *pmcdev;
  1438		const struct x86_cpu_id *cpu_id;
  1439		int (*core_init)(struct pmc_dev *pmcdev);
  1440		const struct pmc_reg_map *map;
  1441		struct pmc *primary_pmc;
  1442		int ret;
  1443	
  1444		if (device_initialized)
  1445			return -ENODEV;
  1446	
  1447		pmcdev = devm_kzalloc(&pdev->dev, sizeof(*pmcdev), GFP_KERNEL);
  1448		if (!pmcdev)
  1449			return -ENOMEM;
  1450	
  1451		pmcdev->crystal_freq = pmc_core_get_crystal_freq();
  1452	
  1453		platform_set_drvdata(pdev, pmcdev);
  1454		pmcdev->pdev = pdev;
  1455	
  1456		cpu_id = x86_match_cpu(intel_pmc_core_ids);
  1457		if (!cpu_id)
  1458			return -ENODEV;
  1459	
  1460		core_init = (int (*)(struct pmc_dev *))cpu_id->driver_data;
  1461	
  1462		/* Primary PMC */
  1463		primary_pmc = devm_kzalloc(&pdev->dev, sizeof(*primary_pmc), GFP_KERNEL);
  1464		if (!primary_pmc)
  1465			return -ENOMEM;
  1466		pmcdev->pmcs[PMC_IDX_MAIN] = primary_pmc;
  1467	
  1468		/* The last element in msr_map is empty */
  1469		pmcdev->num_of_pkgc = ARRAY_SIZE(msr_map) - 1;
  1470		pmcdev->pkgc_res_cnt = devm_kcalloc(&pdev->dev,
  1471						    pmcdev->num_of_pkgc,
  1472						    sizeof(*pmcdev->pkgc_res_cnt),
  1473						    GFP_KERNEL);
  1474		if (!pmcdev->pkgc_res_cnt)
  1475			return -ENOMEM;
  1476	
  1477		/*
  1478		 * Coffee Lake has CPU ID of Kaby Lake and Cannon Lake PCH. So here
  1479		 * Sunrisepoint PCH regmap can't be used. Use Cannon Lake PCH regmap
  1480		 * in this case.
  1481		 */
  1482		if (core_init == spt_core_init && !pci_dev_present(pmc_pci_ids))
  1483			core_init = cnp_core_init;
  1484	
  1485		mutex_init(&pmcdev->lock);
  1486		ret = core_init(pmcdev);
  1487		if (ret) {
  1488			pmc_core_clean_structure(pdev);
  1489			return ret;
  1490		}
  1491	
  1492		pmcdev->pmc_xram_read_bit = pmc_core_check_read_lock_bit(primary_pmc);
  1493		pmc_core_do_dmi_quirks(primary_pmc);
  1494	
  1495		pmc_core_dbgfs_register(pmcdev);
  1496		pm_report_max_hw_sleep(FIELD_MAX(SLP_S0_RES_COUNTER_MASK) *
  1497				       pmc_core_adjust_slp_s0_step(primary_pmc, 1));
  1498	
  1499		map = primary_pmc->map;
  1500		if (map->acpi_pm_tmr_ctl_offset)
> 1501			acpi_pmtmr_register_suspend_resume_callback(pmc_core_acpi_pm_timer_suspend_resume,
  1502								 pmcdev);
  1503	
  1504		device_initialized = true;
  1505		dev_info(&pdev->dev, " initialized\n");
  1506	
  1507		return 0;
  1508	}
  1509	
  1510	static void pmc_core_remove(struct platform_device *pdev)
  1511	{
  1512		struct pmc_dev *pmcdev = platform_get_drvdata(pdev);
  1513		const struct pmc *pmc = pmcdev->pmcs[PMC_IDX_MAIN];
  1514		const struct pmc_reg_map *map = pmc->map;
  1515	
  1516		if (map->acpi_pm_tmr_ctl_offset)
> 1517			acpi_pmtmr_unregister_suspend_resume_callback();
  1518	
  1519		pmc_core_dbgfs_unregister(pmcdev);
  1520		pmc_core_clean_structure(pdev);
  1521	}
  1522	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
