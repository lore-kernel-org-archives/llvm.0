Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE281E0DD8;
	Tue, 30 Sep 2025 07:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759218741; cv=none; b=e2ZMbYgW+O5SdaWKbYyysV6QhVlYKmXiBNDNruxk1EJVipZ4CsFwVihWGyTfKuVXr7asnA4HJNWfbupuoalL8JXgVd6cxXVXbTL/XLEsNaTvKRMFaAf+eTbyLbYxpFSeepO0zE0HUEkydl2ZNELGGx5Cs919VqOZ6edkoJLF4tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759218741; c=relaxed/simple;
	bh=0HhhLIfPpYTygeDXLs2suy16m91sdEYITMscrkwnOLw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C4/OWX+xpL0aPk+LA263ZfemS2Xs6n/1pF13KYv6qkdL2TsiwYV+YoFQb3RN8dk8l1P+kNXyVgz/Omd7FCL7yPsJwfltQNSk/SHmBAR1BQZDboCj+hBq6Qb5icxeXKP+vjRZPf33UO7mPJ3b4bYg9iZWXG6lBrs7DG9tfpOpoiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S6kK8Mqw; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S6kK8Mqw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759218740; x=1790754740;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0HhhLIfPpYTygeDXLs2suy16m91sdEYITMscrkwnOLw=;
  b=S6kK8MqwRfnDJ9cBfXPpQS/v0yHCsiFqgfeAjc292z7L9+oiJoY7Gu/m
   a6uQVvFzhzetp62pEDy5QcpIzPLfcZPcudamIL8e9GYLk9Lhq/F0WrrSu
   d5adAWK0O8ew1ujEYSyyoiavkQOLHKr2HD8M2HOoH2lQOXNQ/AAC9SX8g
   DDbXWG5Mmd/YITgg8u1vSdcRrenKA93vqvCB5wFLJ+56x+hCPFcVGJVGn
   xScDJKj7TReyFXfFnaXK3T3pd/wv1LqJq5LXLosw4VvYuy13SYSkbv/rn
   UL3nTar3kgDZpY9qSEkDbEAGm/XZOVi1waLrkTEvcud9MNlOxRAoEdxjt
   Q==;
X-CSE-ConnectionGUID: wZZ0QMmxRRmKrTif9HOVCA==
X-CSE-MsgGUID: 2T8mKU7sQxGuL8lM32SFSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="61511936"
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; 
   d="scan'208";a="61511936"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2025 00:52:20 -0700
X-CSE-ConnectionGUID: X7sR6eleQryUc9zJO63tyg==
X-CSE-MsgGUID: qcA+qOLATfyo0KPVPPk37g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; 
   d="scan'208";a="182874409"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 30 Sep 2025 00:52:18 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v3V9k-00011D-01;
	Tue, 30 Sep 2025 07:52:16 +0000
Date: Tue, 30 Sep 2025 15:51:55 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>
Subject: [jgunthorpe:for-nicolin 6/28] drivers/iommu/exynos-iommu.c:1049:65:
 error: too few arguments to function call, expected 3, have 2
Message-ID: <202509301553.ut1mpgEo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux for-nicolin
head:   88dcad1e4861f296ede23d6aa870ccedb3033a8b
commit: 90e9f86265413466c1c30d8749fc0a86ced9f5b9 [6/28] iommu: Pass in old domain to attach_dev callback functions
config: arm64-randconfig-002-20250930 (https://download.01.org/0day-ci/archive/20250930/202509301553.ut1mpgEo-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 39f292ffa13d7ca0d1edff27ac8fd55024bb4d19)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250930/202509301553.ut1mpgEo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509301553.ut1mpgEo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iommu/exynos-iommu.c:1049:65: error: too few arguments to function call, expected 3, have 2
    1049 |         err = exynos_iommu_identity_attach(&exynos_identity_domain, dev);
         |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~                             ^
   drivers/iommu/exynos-iommu.c:986:12: note: 'exynos_iommu_identity_attach' declared here
     986 | static int exynos_iommu_identity_attach(struct iommu_domain *identity_domain,
         |            ^                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     987 |                                         struct device *dev,
         |                                         ~~~~~~~~~~~~~~~~~~~
     988 |                                         struct iommu_domain *old)
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/exynos-iommu.c:1434:67: error: too few arguments to function call, expected 3, have 2
    1434 |         WARN_ON(exynos_iommu_identity_attach(&exynos_identity_domain, dev));
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~                             ^
   drivers/iommu/exynos-iommu.c:986:12: note: 'exynos_iommu_identity_attach' declared here
     986 | static int exynos_iommu_identity_attach(struct iommu_domain *identity_domain,
         |            ^                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     987 |                                         struct device *dev,
         |                                         ~~~~~~~~~~~~~~~~~~~
     988 |                                         struct iommu_domain *old)
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +1049 drivers/iommu/exynos-iommu.c

b3d14960e629f9 Jason Gunthorpe  2023-09-13  1037  
bfa004893c55ea Marek Szyprowski 2015-05-19  1038  static int exynos_iommu_attach_device(struct iommu_domain *iommu_domain,
90e9f862654134 Nicolin Chen     2025-08-04  1039  				      struct device *dev,
90e9f862654134 Nicolin Chen     2025-08-04  1040  				      struct iommu_domain *old)
2a96536e77b43c KyongHo Cho      2012-05-12  1041  {
bfa004893c55ea Marek Szyprowski 2015-05-19  1042  	struct exynos_iommu_domain *domain = to_exynos_domain(iommu_domain);
0f45b04da18305 Joerg Roedel     2020-06-25  1043  	struct exynos_iommu_owner *owner = dev_iommu_priv_get(dev);
469acebe4a6890 Marek Szyprowski 2015-05-19  1044  	struct sysmmu_drvdata *data;
bfa004893c55ea Marek Szyprowski 2015-05-19  1045  	phys_addr_t pagetable = virt_to_phys(domain->pgtable);
2a96536e77b43c KyongHo Cho      2012-05-12  1046  	unsigned long flags;
b3d14960e629f9 Jason Gunthorpe  2023-09-13  1047  	int err;
2a96536e77b43c KyongHo Cho      2012-05-12  1048  
b3d14960e629f9 Jason Gunthorpe  2023-09-13 @1049  	err = exynos_iommu_identity_attach(&exynos_identity_domain, dev);
b3d14960e629f9 Jason Gunthorpe  2023-09-13  1050  	if (err)
b3d14960e629f9 Jason Gunthorpe  2023-09-13  1051  		return err;
5fa61cbff16224 Marek Szyprowski 2016-02-18  1052  
9b265536c27116 Marek Szyprowski 2016-11-14  1053  	mutex_lock(&owner->rpm_lock);
9b265536c27116 Marek Szyprowski 2016-11-14  1054  
e11723000f1641 Marek Szyprowski 2016-11-14  1055  	spin_lock_irqsave(&domain->lock, flags);
1b092054368478 Marek Szyprowski 2015-05-19  1056  	list_for_each_entry(data, &owner->controllers, owner_node) {
e11723000f1641 Marek Szyprowski 2016-11-14  1057  		spin_lock(&data->lock);
47a574fffca102 Marek Szyprowski 2016-11-14  1058  		data->pgtable = pagetable;
47a574fffca102 Marek Szyprowski 2016-11-14  1059  		data->domain = domain;
bfa004893c55ea Marek Szyprowski 2015-05-19  1060  		list_add_tail(&data->domain_node, &domain->clients);
e11723000f1641 Marek Szyprowski 2016-11-14  1061  		spin_unlock(&data->lock);
e11723000f1641 Marek Szyprowski 2016-11-14  1062  	}
e11723000f1641 Marek Szyprowski 2016-11-14  1063  	owner->domain = iommu_domain;
bfa004893c55ea Marek Szyprowski 2015-05-19  1064  	spin_unlock_irqrestore(&domain->lock, flags);
e11723000f1641 Marek Szyprowski 2016-11-14  1065  
e11723000f1641 Marek Szyprowski 2016-11-14  1066  	list_for_each_entry(data, &owner->controllers, owner_node) {
9b265536c27116 Marek Szyprowski 2016-11-14  1067  		pm_runtime_get_noresume(data->sysmmu);
9b265536c27116 Marek Szyprowski 2016-11-14  1068  		if (pm_runtime_active(data->sysmmu))
e11723000f1641 Marek Szyprowski 2016-11-14  1069  			__sysmmu_enable(data);
9b265536c27116 Marek Szyprowski 2016-11-14  1070  		pm_runtime_put(data->sysmmu);
9b265536c27116 Marek Szyprowski 2016-11-14  1071  	}
9b265536c27116 Marek Szyprowski 2016-11-14  1072  
9b265536c27116 Marek Szyprowski 2016-11-14  1073  	mutex_unlock(&owner->rpm_lock);
9b265536c27116 Marek Szyprowski 2016-11-14  1074  
b0d4c861a99d00 Marek Szyprowski 2016-11-14  1075  	dev_dbg(dev, "%s: Attached IOMMU with pgtable %pa\n", __func__,
b0d4c861a99d00 Marek Szyprowski 2016-11-14  1076  		&pagetable);
7222e8db2d5061 Cho KyongHo      2014-05-12  1077  
b0d4c861a99d00 Marek Szyprowski 2016-11-14  1078  	return 0;
2a96536e77b43c KyongHo Cho      2012-05-12  1079  }
2a96536e77b43c KyongHo Cho      2012-05-12  1080  

:::::: The code at line 1049 was first introduced by commit
:::::: b3d14960e629f9ee8c82f8feb211ae43e1cb3246 iommu/exynos: Implement an IDENTITY domain

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
