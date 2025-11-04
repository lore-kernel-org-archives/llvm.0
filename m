Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0A82AC17;
	Tue,  4 Nov 2025 08:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762245068; cv=none; b=GbO3MZXT0+tHSr5JYdA2rDH6YVjUaMMOBxptNdoAlCPApBskz0jQ7Yw5rlIHf3ayqT/7s6oshqGkgMexMXMaAiHo7wPstjJkYEKznQcb3Is40oyU0eGBd+tA3UyUYEi7zpVeXhZL+Lj5WbJFDu0/O/HgQ3NVVvl0H1BLQ6Ou0Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762245068; c=relaxed/simple;
	bh=Ef6fQvVRICX2hZGnzpQkDMO3tf6sHTm4XXHGNfHXEDw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fAN5ja5kFvABUNRX7cUUXi9VSoNEX/WQPJSF5JR1c6+6Dmt4Gmy0Tb/c5O2obTonHIlCBgW6cHlLt1hagp9wMQ7KD6aYRJPT2ol0mesXm22wD+hA5i7S/+/JJD/AIgsAo5Ar9/ezycKxFyb1mlTc1km+tjbCU0SHIibQIOxDfkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iAIydG6D; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iAIydG6D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762245067; x=1793781067;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ef6fQvVRICX2hZGnzpQkDMO3tf6sHTm4XXHGNfHXEDw=;
  b=iAIydG6DB61/pDo7FOvBfwEiAVpIiKfYu4jt6UqvmsstCC1gl6VdGrSz
   AFpuv5Tzm8OtSTu/39TyBm89x5LkavkX15hXThv9w8oUrTXyPpD5BMZ5D
   Af4shJe1At8xnnWXdANDfzQhuVB3NQpdhRzQhBt/CsI/1GBB1tSQg8kDB
   DoenRb/r2Z91FiG2gTIanD734FKvou6v+AfPGwz8Fg+WbgA1OHtLAfhE4
   CPQYjKaqQHVar+69CPR5F94bF/JV0NPVH9ZmsPP7LaxkHmKGgoTxMk+Kx
   RuuMz5Ns+3fe8+6B8v9K+T4aJWJ7FEii9mlblSX9ZM5DkKc5OsHbxlhyL
   A==;
X-CSE-ConnectionGUID: FFBwgx+XRgSiFBwU0o7W8A==
X-CSE-MsgGUID: JufxBIKYTjea1/QFZaS5IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="64030354"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="64030354"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 00:31:06 -0800
X-CSE-ConnectionGUID: pK9UeBqaRDKxUXlnn83PYw==
X-CSE-MsgGUID: nijsr1+lQHqiCCr8tijY1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="186340634"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 04 Nov 2025 00:31:05 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGCRS-000R8I-2b;
	Tue, 04 Nov 2025 08:31:02 +0000
Date: Tue, 4 Nov 2025 16:30:08 +0800
From: kernel test robot <lkp@intel.com>
To: Yicong Yang <yangyicong@hisilicon.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Will Deacon <will@kernel.org>
Subject: [arm-perf:for-next/perf 1/8] drivers/perf/arm_pmu.c:932:17: error:
 call to undeclared function 'topology_core_has_smt'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202511041650.VXU1O1Zh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git for-next/perf
head:   989b40b7578a2be7b0388522d33d751b257d59d9
commit: c3d78c34ad009a7cce57ae5b5c93e1bd03bb31a3 [1/8] perf: arm_pmuv3: Don't use PMCCNTR_EL0 on SMT cores
config: arm-mv78xx0_defconfig (https://download.01.org/0day-ci/archive/20251104/202511041650.VXU1O1Zh-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511041650.VXU1O1Zh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511041650.VXU1O1Zh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/perf/arm_pmu.c:932:17: error: call to undeclared function 'topology_core_has_smt'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     932 |         pmu->has_smt = topology_core_has_smt(cpumask_first(&pmu->supported_cpus));
         |                        ^
   1 error generated.


vim +/topology_core_has_smt +932 drivers/perf/arm_pmu.c

   919	
   920	int armpmu_register(struct arm_pmu *pmu)
   921	{
   922		int ret;
   923	
   924		ret = cpu_pmu_init(pmu);
   925		if (ret)
   926			return ret;
   927	
   928		/*
   929		 * By this stage we know our supported CPUs on either DT/ACPI platforms,
   930		 * detect the SMT implementation.
   931		 */
 > 932		pmu->has_smt = topology_core_has_smt(cpumask_first(&pmu->supported_cpus));
   933	
   934		if (!pmu->set_event_filter)
   935			pmu->pmu.capabilities |= PERF_PMU_CAP_NO_EXCLUDE;
   936	
   937		ret = perf_pmu_register(&pmu->pmu, pmu->name, -1);
   938		if (ret)
   939			goto out_destroy;
   940	
   941		pr_info("enabled with %s PMU driver, %d (%*pb) counters available%s\n",
   942			pmu->name, bitmap_weight(pmu->cntr_mask, ARMPMU_MAX_HWEVENTS),
   943			ARMPMU_MAX_HWEVENTS, &pmu->cntr_mask,
   944			has_nmi ? ", using NMIs" : "");
   945	
   946		kvm_host_pmu_init(pmu);
   947	
   948		return 0;
   949	
   950	out_destroy:
   951		cpu_pmu_destroy(pmu);
   952		return ret;
   953	}
   954	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
