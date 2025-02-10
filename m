Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82290225A2F;
	Mon, 10 Feb 2025 12:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739190739; cv=none; b=gLaMm+yVVY7JpftCBXEyuv3Yf5kBEh+sk9RgK+U1vMecXwHTk+Ix2mh230qK07ObrSANdWF96ySkVAznc4+Hi5jviWm81ejdfMAbgGf4LBf4iCtsdS9CL4oSqf+f7liRXIgnZkl1n45FpBEmL1FCIqrQtiMab4jHnbQg5BeRL5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739190739; c=relaxed/simple;
	bh=pqO6Qxvbsv+4kYRysubWhB7OwajdKx15TkyPcvnHrUc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YwWqIXaVQ3ck3MVl+bokwazsR1LqsRNulfRPb+AE3t4yPTxbDBWmiB7Lvwk+z/08Zh/INnnF++r1tYPqXDpbGbVaP8dIuH1Uq/4G3jjU27UOHGja3Rh3AwM09mLNrRNpnlmlBkdEsjT9j7l9CORrJjqAc1eHATUoDWLckbBZcls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WEP9dCb8; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WEP9dCb8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739190737; x=1770726737;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pqO6Qxvbsv+4kYRysubWhB7OwajdKx15TkyPcvnHrUc=;
  b=WEP9dCb8+zSJ/lu7pgTNc/qprP9cuuGY+wXQt0xSmt4r05mKP61Lg7Gi
   VTqg4nAzDlqjgLPuMul4w2jC530KpeA1HUrRlCREQHpbZtsPl5wKev5y1
   ObVwG7EM/0rEdsyjp9JvzGV8zAGE0B4kPwH2jAl3HCRk2RlLgUnBVkPQs
   pqNPqgeuX+QRIMnjkREMU/krT3QpGkirt1fb7iiGG8nhZLVw0B6mhNy0N
   aaPx0hK6eRD8aJrlHeBjqiBzGAx3KlVw2CMBip1bPywxxH4tpRqYs0zps
   e5x4ne5Xw+pZ4h+kZpuNHXNj7mX0TmewsJusMI7i0PG01DGrHxyws8Gcx
   A==;
X-CSE-ConnectionGUID: ffvpbt4LRMmmyDTG3OZmXA==
X-CSE-MsgGUID: O4cAas7+RqiA06veEGSepQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="43428137"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="43428137"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 04:32:16 -0800
X-CSE-ConnectionGUID: inX1EuMhRwikjwx5gc8fRQ==
X-CSE-MsgGUID: oq13K/7BSea63svyn5iOZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="112121353"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Feb 2025 04:32:15 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thSxP-0012kB-2B;
	Mon, 10 Feb 2025 12:32:11 +0000
Date: Mon, 10 Feb 2025 20:31:45 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:kvm-arm64/pmu-includes 15/15]
 drivers/perf/arm_pmu.c:932:2: error: call to undeclared function
 'kvm_host_pmu_init'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202502102059.w8qrGKZn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/pmu-includes
head:   7f3348d6c8577e4e729279ef30f5e9013cf9fbd5
commit: 7f3348d6c8577e4e729279ef30f5e9013cf9fbd5 [15/15] PMU include cleanup
config: arm-bcm2835_defconfig (https://download.01.org/0day-ci/archive/20250210/202502102059.w8qrGKZn-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250210/202502102059.w8qrGKZn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502102059.w8qrGKZn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/perf/arm_pmu.c:932:2: error: call to undeclared function 'kvm_host_pmu_init'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           kvm_host_pmu_init(pmu);
           ^
   1 error generated.


vim +/kvm_host_pmu_init +932 drivers/perf/arm_pmu.c

2681f0184276d7 Mark Rutland      2017-03-10  911  
74a2b3ea2d8c6c Mark Rutland      2017-04-11  912  int armpmu_register(struct arm_pmu *pmu)
74a2b3ea2d8c6c Mark Rutland      2017-04-11  913  {
74a2b3ea2d8c6c Mark Rutland      2017-04-11  914  	int ret;
74a2b3ea2d8c6c Mark Rutland      2017-04-11  915  
74a2b3ea2d8c6c Mark Rutland      2017-04-11  916  	ret = cpu_pmu_init(pmu);
74a2b3ea2d8c6c Mark Rutland      2017-04-11  917  	if (ret)
74a2b3ea2d8c6c Mark Rutland      2017-04-11  918  		return ret;
74a2b3ea2d8c6c Mark Rutland      2017-04-11  919  
1d899c0e9bc2a1 Andrew Murray     2019-01-10  920  	if (!pmu->set_event_filter)
1d899c0e9bc2a1 Andrew Murray     2019-01-10  921  		pmu->pmu.capabilities |= PERF_PMU_CAP_NO_EXCLUDE;
1d899c0e9bc2a1 Andrew Murray     2019-01-10  922  
74a2b3ea2d8c6c Mark Rutland      2017-04-11  923  	ret = perf_pmu_register(&pmu->pmu, pmu->name, -1);
74a2b3ea2d8c6c Mark Rutland      2017-04-11  924  	if (ret)
74a2b3ea2d8c6c Mark Rutland      2017-04-11  925  		goto out_destroy;
74a2b3ea2d8c6c Mark Rutland      2017-04-11  926  
bf5ffc8c80e0cf Rob Herring (Arm  2024-07-31  927) 	pr_info("enabled with %s PMU driver, %d (%*pb) counters available%s\n",
bf5ffc8c80e0cf Rob Herring (Arm  2024-07-31  928) 		pmu->name, bitmap_weight(pmu->cntr_mask, ARMPMU_MAX_HWEVENTS),
bf5ffc8c80e0cf Rob Herring (Arm  2024-07-31  929) 		ARMPMU_MAX_HWEVENTS, &pmu->cntr_mask,
d8f6267f7ce5dc Julien Thierry    2020-09-24  930  		has_nmi ? ", using NMIs" : "");
74a2b3ea2d8c6c Mark Rutland      2017-04-11  931  
e840f42a499257 Marc Zyngier      2021-09-19 @932  	kvm_host_pmu_init(pmu);
e840f42a499257 Marc Zyngier      2021-09-19  933  
74a2b3ea2d8c6c Mark Rutland      2017-04-11  934  	return 0;
74a2b3ea2d8c6c Mark Rutland      2017-04-11  935  
74a2b3ea2d8c6c Mark Rutland      2017-04-11  936  out_destroy:
74a2b3ea2d8c6c Mark Rutland      2017-04-11  937  	cpu_pmu_destroy(pmu);
74a2b3ea2d8c6c Mark Rutland      2017-04-11  938  	return ret;
74a2b3ea2d8c6c Mark Rutland      2017-04-11  939  }
74a2b3ea2d8c6c Mark Rutland      2017-04-11  940  

:::::: The code at line 932 was first introduced by commit
:::::: e840f42a49925707fca90e6c7a4095118fdb8c4d KVM: arm64: Fix PMU probe ordering

:::::: TO: Marc Zyngier <maz@kernel.org>
:::::: CC: Marc Zyngier <maz@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
