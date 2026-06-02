Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A548272803;
	Tue,  2 Jun 2026 00:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780358964; cv=none; b=S/vAYUZPY85xa9JiZecc/XtOtP2P7fq+uNS0B96i2BMQrMvsYEO07HXNORshSIUyu3wlSko4LCpvBqF32m/BZgsUtrq2lJZ9EOyoMYDlps11yC2FsJ56JZOSB56KP5lG4DC2BLEJU4NNUkbjzdwoWrTb3I6D0r535KU6wAcvB2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780358964; c=relaxed/simple;
	bh=Bz6Fy7Qpw4BBfVIEeQiqcZBmvtQtm30OfSuuLglM7oE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GUy8gdBiHwf5M/THwTuB4re1+kQzHaj7LCSjmju2wNzcVKdbYN25lU/9Y1+laWerGiVkiM5dmY0V3lGVLvP9ExAv8fNw5BF6vF6szg+BuUhqcvcGMuCusLKJhs7Dy2HuN7lNsL8xmet3QNGxhfDN9twR5rXseL/qNUPQ0z7DaQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T5TPd24R; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T5TPd24R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780358964; x=1811894964;
  h=date:from:to:cc:subject:message-id;
  bh=Bz6Fy7Qpw4BBfVIEeQiqcZBmvtQtm30OfSuuLglM7oE=;
  b=T5TPd24RF5P8UmZbWh3CYZAHn5OGN/+A97UTNQ9hWEBRupIC3v2GCTpD
   MBDDIFDIp7WVAdpD7ZOo678wn3g26qiWQEbpJcVSP8Ga+X/up6WMll3xT
   FcZm0IIx4AIwvT2wh0v7fjXckZolCvv+x8bb/C3c7Xp63UcAUVc00iAOn
   YIS+w33EfSsNStevmxS29HafCshs07YbDrRnDdd0BmpYhAp2l/RYYcyJ5
   Qox9mgGDhExvCKpXlY/R+YRuWaZk1KLqfgF6W+3FQjP+Jx4NyAD9z5or+
   D8ZkeihI96+fY6+wfie48prSw7SUawbpD+crVOE4Z8wRQwH2D7fz2va/p
   w==;
X-CSE-ConnectionGUID: 9XpiBQGhRDC/yWMnUkH3mQ==
X-CSE-MsgGUID: DchjZMRgR/2xN9L+paSlfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81029251"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="81029251"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 17:09:23 -0700
X-CSE-ConnectionGUID: 0tZPo9EUQf6+52EwkHfo4A==
X-CSE-MsgGUID: x/YF//9eSGm6b70PWkB88A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="242690349"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 01 Jun 2026 17:09:21 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUCh4-000000001gv-2wny;
	Tue, 02 Jun 2026 00:09:18 +0000
Date: Tue, 02 Jun 2026 02:08:35 +0200
From: kernel test robot <lkp@intel.com>
To: Pranjal Shrivastava <praan@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: drivers/iommu/amd/iommu.c:2483:6: warning: variable
 'dev_data' is used uninitialized whenever 'if' condition is true
Message-ID: <202606020253.RoYlNZBh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Pranjal-Shrivastava/iommu-amd-Clear-aliases-before-setting-the-rlookup_table-to-NULL/20260601-215359
head:   93f2b68d12c1ba701844fead3e671ac1a9edf4ee
commit: d0ab5cc828d000ab8fa0387a75d426d77b315b9c iommu/amd: Fix Use-After-Free in non-fatal probe error path
date:   10 hours ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260602/202606020253.RoYlNZBh-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260602/202606020253.RoYlNZBh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606020253.RoYlNZBh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/amd/iommu.c:2483:6: warning: variable 'dev_data' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    2483 |         if (ret) {
         |             ^~~
   drivers/iommu/amd/iommu.c:2525:6: note: uninitialized use occurs here
    2525 |         if (dev_data) {
         |             ^~~~~~~~
   drivers/iommu/amd/iommu.c:2483:2: note: remove the 'if' if its condition is always false
    2483 |         if (ret) {
         |         ^~~~~~~~~~
    2484 |                 dev_err(dev, "Failed to initialize - trying to proceed anyway\n");
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2485 |                 iommu_dev = ERR_PTR(ret);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~
    2486 |                 goto err_deinit;
         |                 ~~~~~~~~~~~~~~~~
    2487 |         }
         |         ~
   drivers/iommu/amd/iommu.c:2465:33: note: initialize the variable 'dev_data' to silence this warning
    2465 |         struct iommu_dev_data *dev_data;
         |                                        ^
         |                                         = NULL
   1 warning generated.


vim +2483 drivers/iommu/amd/iommu.c

e275a2a0fc9e21 arch/x86/kernel/amd_iommu.c Joerg Roedel           2008-12-10  2460  
dce8d6964ebdb3 drivers/iommu/amd_iommu.c   Joerg Roedel           2020-04-29  2461  static struct iommu_device *amd_iommu_probe_device(struct device *dev)
15898bbcb48fc8 arch/x86/kernel/amd_iommu.c Joerg Roedel           2009-11-24  2462  {
dce8d6964ebdb3 drivers/iommu/amd_iommu.c   Joerg Roedel           2020-04-29  2463  	struct iommu_device *iommu_dev;
e275a2a0fc9e21 arch/x86/kernel/amd_iommu.c Joerg Roedel           2008-12-10  2464  	struct amd_iommu *iommu;
a0c47f233e683e drivers/iommu/amd/iommu.c   Vasant Hegde           2024-04-18  2465  	struct iommu_dev_data *dev_data;
8b71c9bf4df829 drivers/iommu/amd/iommu.c   Suravee Suthikulpanit  2022-07-06  2466  	int ret;
e275a2a0fc9e21 arch/x86/kernel/amd_iommu.c Joerg Roedel           2008-12-10  2467  
57bd2c24ba1673 drivers/iommu/amd_iommu.c   Joerg Roedel           2020-04-29  2468  	if (!check_device(dev))
dce8d6964ebdb3 drivers/iommu/amd_iommu.c   Joerg Roedel           2020-04-29  2469  		return ERR_PTR(-ENODEV);
e275a2a0fc9e21 arch/x86/kernel/amd_iommu.c Joerg Roedel           2008-12-10  2470  
8b71c9bf4df829 drivers/iommu/amd/iommu.c   Suravee Suthikulpanit  2022-07-06  2471  	iommu = rlookup_amd_iommu(dev);
8b71c9bf4df829 drivers/iommu/amd/iommu.c   Suravee Suthikulpanit  2022-07-06  2472  	if (!iommu)
8b71c9bf4df829 drivers/iommu/amd/iommu.c   Suravee Suthikulpanit  2022-07-06  2473  		return ERR_PTR(-ENODEV);
e275a2a0fc9e21 arch/x86/kernel/amd_iommu.c Joerg Roedel           2008-12-10  2474  
cbc040081fdf7d drivers/iommu/amd/iommu.c   Robin Murphy           2022-08-15  2475  	/* Not registered yet? */
cbc040081fdf7d drivers/iommu/amd/iommu.c   Robin Murphy           2022-08-15  2476  	if (!iommu->iommu.ops)
cbc040081fdf7d drivers/iommu/amd/iommu.c   Robin Murphy           2022-08-15  2477  		return ERR_PTR(-ENODEV);
cbc040081fdf7d drivers/iommu/amd/iommu.c   Robin Murphy           2022-08-15  2478  
05a0542b456e13 drivers/iommu/amd_iommu.c   Joerg Roedel           2020-05-27  2479  	if (dev_iommu_priv_get(dev))
dce8d6964ebdb3 drivers/iommu/amd_iommu.c   Joerg Roedel           2020-04-29  2480  		return &iommu->iommu;
dce8d6964ebdb3 drivers/iommu/amd_iommu.c   Joerg Roedel           2020-04-29  2481  
99fc4ac3d2978c drivers/iommu/amd/iommu.c   Suravee Suthikulpanit  2022-07-06  2482  	ret = iommu_init_device(iommu, dev);
4d58b8a6de6b8c drivers/iommu/amd_iommu.c   Joerg Roedel           2015-06-11 @2483  	if (ret) {
5f226da1b1d706 drivers/iommu/amd_iommu.c   Bjorn Helgaas          2019-02-08  2484  		dev_err(dev, "Failed to initialize - trying to proceed anyway\n");
dce8d6964ebdb3 drivers/iommu/amd_iommu.c   Joerg Roedel           2020-04-29  2485  		iommu_dev = ERR_PTR(ret);
244221e10f5f3b drivers/iommu/amd/iommu.c   Pranjal Shrivastava    2026-06-01  2486  		goto err_deinit;
293aa9ec694e63 drivers/iommu/amd/iommu.c   Vasant Hegde           2024-08-28  2487  	}
293aa9ec694e63 drivers/iommu/amd/iommu.c   Vasant Hegde           2024-08-28  2488  
2b2c6aa63824c6 drivers/iommu/amd/iommu.c   Thomas Gleixner        2020-08-26  2489  	amd_iommu_set_pci_msi_domain(dev, iommu);
dce8d6964ebdb3 drivers/iommu/amd_iommu.c   Joerg Roedel           2020-04-29  2490  	iommu_dev = &iommu->iommu;
657cbb6b6cba0f arch/x86/kernel/amd_iommu.c Joerg Roedel           2009-11-23  2491  
a0c47f233e683e drivers/iommu/amd/iommu.c   Vasant Hegde           2024-04-18  2492  	/*
a0c47f233e683e drivers/iommu/amd/iommu.c   Vasant Hegde           2024-04-18  2493  	 * If IOMMU and device supports PASID then it will contain max
a0c47f233e683e drivers/iommu/amd/iommu.c   Vasant Hegde           2024-04-18  2494  	 * supported PASIDs, else it will be zero.
a0c47f233e683e drivers/iommu/amd/iommu.c   Vasant Hegde           2024-04-18  2495  	 */
a0c47f233e683e drivers/iommu/amd/iommu.c   Vasant Hegde           2024-04-18  2496  	dev_data = dev_iommu_priv_get(dev);
a0c47f233e683e drivers/iommu/amd/iommu.c   Vasant Hegde           2024-04-18  2497  	if (amd_iommu_pasid_supported() && dev_is_pci(dev) &&
a0c47f233e683e drivers/iommu/amd/iommu.c   Vasant Hegde           2024-04-18  2498  	    pdev_pasid_supported(dev_data)) {
a0c47f233e683e drivers/iommu/amd/iommu.c   Vasant Hegde           2024-04-18  2499  		dev_data->max_pasids = min_t(u32, iommu->iommu.max_pasids,
a0c47f233e683e drivers/iommu/amd/iommu.c   Vasant Hegde           2024-04-18  2500  					     pci_max_pasids(to_pci_dev(dev)));
a0c47f233e683e drivers/iommu/amd/iommu.c   Vasant Hegde           2024-04-18  2501  	}
a0c47f233e683e drivers/iommu/amd/iommu.c   Vasant Hegde           2024-04-18  2502  
7e5516e6096124 drivers/iommu/amd/iommu.c   Ankit Soni             2025-06-04  2503  	if (amd_iommu_pgtable == PD_MODE_NONE) {
7e5516e6096124 drivers/iommu/amd/iommu.c   Ankit Soni             2025-06-04  2504  		pr_warn_once("%s: DMA translation not supported by iommu.\n",
7e5516e6096124 drivers/iommu/amd/iommu.c   Ankit Soni             2025-06-04  2505  			     __func__);
7e5516e6096124 drivers/iommu/amd/iommu.c   Ankit Soni             2025-06-04  2506  		iommu_dev = ERR_PTR(-ENODEV);
7e5516e6096124 drivers/iommu/amd/iommu.c   Ankit Soni             2025-06-04  2507  		goto out_err;
7e5516e6096124 drivers/iommu/amd/iommu.c   Ankit Soni             2025-06-04  2508  	}
7e5516e6096124 drivers/iommu/amd/iommu.c   Ankit Soni             2025-06-04  2509  
dce8d6964ebdb3 drivers/iommu/amd_iommu.c   Joerg Roedel           2020-04-29  2510  	iommu_completion_wait(iommu);
2c9195e9902970 drivers/iommu/amd_iommu.c   Joerg Roedel           2012-07-19  2511  
19e5cc156cbc32 drivers/iommu/amd/iommu.c   Kishon Vijay Abraham I 2025-03-07  2512  	if (FEATURE_NUM_INT_REMAP_SUP_2K(amd_iommu_efr2))
19e5cc156cbc32 drivers/iommu/amd/iommu.c   Kishon Vijay Abraham I 2025-03-07  2513  		dev_data->max_irqs = MAX_IRQS_PER_TABLE_2K;
19e5cc156cbc32 drivers/iommu/amd/iommu.c   Kishon Vijay Abraham I 2025-03-07  2514  	else
19e5cc156cbc32 drivers/iommu/amd/iommu.c   Kishon Vijay Abraham I 2025-03-07  2515  		dev_data->max_irqs = MAX_IRQS_PER_TABLE_512;
19e5cc156cbc32 drivers/iommu/amd/iommu.c   Kishon Vijay Abraham I 2025-03-07  2516  
6c17c7d5936e6a drivers/iommu/amd/iommu.c   Jason Gunthorpe        2024-08-07  2517  	if (dev_is_pci(dev))
6c17c7d5936e6a drivers/iommu/amd/iommu.c   Jason Gunthorpe        2024-08-07  2518  		pci_prepare_ats(to_pci_dev(dev), PAGE_SHIFT);
6c17c7d5936e6a drivers/iommu/amd/iommu.c   Jason Gunthorpe        2024-08-07  2519  
244221e10f5f3b drivers/iommu/amd/iommu.c   Pranjal Shrivastava    2026-06-01  2520  	return iommu_dev;
244221e10f5f3b drivers/iommu/amd/iommu.c   Pranjal Shrivastava    2026-06-01  2521  
244221e10f5f3b drivers/iommu/amd/iommu.c   Pranjal Shrivastava    2026-06-01  2522  err_deinit:
244221e10f5f3b drivers/iommu/amd/iommu.c   Pranjal Shrivastava    2026-06-01  2523  	iommu_ignore_device(iommu, dev);
3222b6de514527 drivers/iommu/amd/iommu.c   Vasant Hegde           2026-01-16  2524  out_err:
d0ab5cc828d000 drivers/iommu/amd/iommu.c   Pranjal Shrivastava    2026-06-01  2525  	if (dev_data) {
d0ab5cc828d000 drivers/iommu/amd/iommu.c   Pranjal Shrivastava    2026-06-01  2526  		amd_iommu_clear_device_dte(iommu, dev_data);
d0ab5cc828d000 drivers/iommu/amd/iommu.c   Pranjal Shrivastava    2026-06-01  2527  		dev_data->dev = NULL;
d0ab5cc828d000 drivers/iommu/amd/iommu.c   Pranjal Shrivastava    2026-06-01  2528  	}
d0ab5cc828d000 drivers/iommu/amd/iommu.c   Pranjal Shrivastava    2026-06-01  2529  
dce8d6964ebdb3 drivers/iommu/amd_iommu.c   Joerg Roedel           2020-04-29  2530  	return iommu_dev;
dce8d6964ebdb3 drivers/iommu/amd_iommu.c   Joerg Roedel           2020-04-29  2531  }
1ac4cbbc5eb56d arch/x86/kernel/amd_iommu.c Joerg Roedel           2008-12-10  2532  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
