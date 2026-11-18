Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794998260;
	b=SKARM86dwfjpz4GJzqyKIAoj7PjiqKm9DTg/nz4o+fDQtgJ/eKStcUYy7ev8UU9hXUr2
	 z5MObUOSMl8kCvV9q2h2YW9Va2H77bV5IEWTM4MCNNsh1HPyeiZk2F4+2ygR9vaYvFMEO
	 5QgtziJU7HQ1xQwLw7DoX+5ABuMlcGYNRGCquEawhRw2viGTjezgsr4RoUWgEYP/MeCOF
	 Fcq6rQcA3q3BMgHtq1/kWlji5inI81bhT9oAZfAhvKp4CvHSQfXHUpP50rNcwU6+FK+s2
	 u+FIwjqwTK7F/kWxsdttoWxZS1dh6MS76lmAtw8JrpsS9gjMIE2TeifGOOeVXTjcA2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998260;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=lNUe9D0tAvTXbSeXT4QdQdAtKhb2ErmRf9u/Zj1eqV4=;
	b=Y+n3j/IVZyKGAowOaPkb2aWbinifqX5S+7hN6LSlFxzzcQvkHQ3SNdMrebbvmSBqpUpE
	 Eb4F1VOt8YltTqjF/g9x8YWu2M0oHZi18grWhZNNd0yvKenvfqYX9kgi5HtpImBxQIaIU
	 fSHq/gRMiIMigvfeRBdCFFr3RrfHBv+/zWzp8epr12DEFKqx0yc1AM9ITLD19ldTuZcvl
	 Ox4nMiy5W6NimQPccaUEimAe1CHQ2hqiLY4QAg41rxf+iCtFxWiemD4wCLi9SFATyidU2
	 0oxTHmAHL5ghfDJHoVH0yKafnnGTsJ2dfq2e457NoY8ToGUR3PpMG2pdtVBp3d+kBPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IcqymisB;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E17606A31C;
	Wed, 18 Nov 2026 10:37:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13E17606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IcqymisB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794998259; x=1826534259;
  h=date:from:to:cc:subject:message-id;
  bh=OUE3SY7pM9LftOSaq19Eift+RAvxn90/c1v7e4CjF+4=;
  b=IcqymisBHn1K8pztjqHZusqdbHzFWJZ2uK+eoQ/todMzSC5X7JL0heng
   xHw+FQoNFLRGhTpAcq1rp8kTEHNBGcXftKrsbJ1akjYjIIjoSIvy6WL3X
   wJs+ivXArIW18XubCWwqRFLRWuNTsFtnZTl05qlvt3bbM2W1NF2wvlPOf
   S8O/A+v9HU7hlsJg8FJCiXsUl+aYngl2RF3br16NDEsMXX8m+A3vH+Xuh
   CgVCYLpOCmd6PIUX/PHK2ZgW3ml4gzvQwPxgK5sCUB91TB4FsQPGRiAjI
   m5e8DEsR6+VHC54Zwo4mq7GdQmac+hYVP+DXOF45f7pWnNyjmY0f3zUPg
   A==;
X-CSE-ConnectionGUID: 7ByE/F4fT9iieKqWxBP2lg==
X-CSE-MsgGUID: ExA4Mn9lQ3eeAavg1HM5ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3689476"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3689476"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 02:37:39 -0800
X-CSE-ConnectionGUID: ByNqyMsFRvqKXvmdFBwhlQ==
X-CSE-MsgGUID: +Iw0iMLCR+2tmofKsN267A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10445549"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 18 Nov 2026 02:37:37 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTd2k-000000003Ni-1V0I;
	Wed, 18 Nov 2026 10:37:34 +0000
Date: Wed, 18 Nov 2026 11:36:38 +0100
From: kernel test robot <lkp@intel.com>
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Anup Patel <anup@brainfault.org>, Nutty Liu <nutty.liu@hotmail.com>
Subject: [avpatel:riscv_trace_acpi_support_v1 41/110]
 drivers/iommu/iommufd/driver.c:445:28: warning: result of comparison of
 constant 4503599627370495 with expression of type 'unsigned int' is always
 false
Message-ID: <20261118113355.UnrCVHUq-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/avpatel/linux.git riscv_trace_acpi_support_v1
head:   d07ed174c556320cd195cf52564791f94027154c
commit: aec5f4d0efc3d8957d00479a79a3489b2eebcd9b [41/110] irqchip/riscv-imsic: Support IOMMU MSI address lists
config: riscv-randconfig-2001-20261118 (https://download.01.org/0day-ci/archive/20261118/20261118113355.UnrCVHUq-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 51d7f08b16b68285b1a400f413215b69f07a65e3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261118/20261118113355.UnrCVHUq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261118113355.UnrCVHUq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/iommufd/driver.c:445:28: warning: result of comparison of constant 4503599627370495 with expression of type 'unsigned int' is always false [-Wtautological-constant-out-of-range-compare]
     445 |         if (!nr_addrs || nr_addrs > SIZE_MAX / PAGE_SIZE)
         |                          ~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +445 drivers/iommu/iommufd/driver.c

8d0711b39587717 Andrew Jones 2026-09-25  421  
dde0a62fb11c017 Andrew Jones 2026-09-25  422  /*
dde0a62fb11c017 Andrew Jones 2026-09-25  423   * Called by the irq code if the platform translates the MSI addresses through the
dde0a62fb11c017 Andrew Jones 2026-09-25  424   * IOMMU. phys_addrs are the physical addresses of the MSI pages. iommufd will
dde0a62fb11c017 Andrew Jones 2026-09-25  425   * allocate contiguous fd global iovas for the physical pages that are the same on
dde0a62fb11c017 Andrew Jones 2026-09-25  426   * all domains and devices.
dde0a62fb11c017 Andrew Jones 2026-09-25  427   */
dde0a62fb11c017 Andrew Jones 2026-09-25  428  int iommufd_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
dde0a62fb11c017 Andrew Jones 2026-09-25  429  		   const phys_addr_t *phys_addrs, unsigned int nr_addrs, size_t granule)
ec031e1b35ded5a Nicolin Chen 2025-03-24  430  {
ec031e1b35ded5a Nicolin Chen 2025-03-24  431  	struct device *dev = msi_desc_to_dev(desc);
ec031e1b35ded5a Nicolin Chen 2025-03-24  432  	struct iommufd_hwpt_paging *hwpt_paging;
ec031e1b35ded5a Nicolin Chen 2025-03-24  433  	struct iommu_attach_handle *raw_handle;
ec031e1b35ded5a Nicolin Chen 2025-03-24  434  	struct iommufd_attach_handle *handle;
ec031e1b35ded5a Nicolin Chen 2025-03-24  435  	struct iommufd_sw_msi_map *msi_map;
ec031e1b35ded5a Nicolin Chen 2025-03-24  436  	struct iommufd_ctx *ictx;
bcb9505734cfe46 Andrew Jones 2026-09-25  437  	LIST_HEAD(new_msi_maps);
8d0711b39587717 Andrew Jones 2026-09-25  438  	struct list_head *msi_maps;
ec031e1b35ded5a Nicolin Chen 2025-03-24  439  	unsigned long iova;
8d0711b39587717 Andrew Jones 2026-09-25  440  	unsigned int i;
ec031e1b35ded5a Nicolin Chen 2025-03-24  441  	int rc;
ec031e1b35ded5a Nicolin Chen 2025-03-24  442  
8d0711b39587717 Andrew Jones 2026-09-25  443  	if (granule != PAGE_SIZE)
8d0711b39587717 Andrew Jones 2026-09-25  444  		return -EOPNOTSUPP;
8d0711b39587717 Andrew Jones 2026-09-25 @445  	if (!nr_addrs || nr_addrs > SIZE_MAX / PAGE_SIZE)
8d0711b39587717 Andrew Jones 2026-09-25  446  		return -EINVAL;
8d0711b39587717 Andrew Jones 2026-09-25  447  	for (i = 0; i < nr_addrs; i++)
8d0711b39587717 Andrew Jones 2026-09-25  448  		if (!IS_ALIGNED(phys_addrs[i], PAGE_SIZE))
8d0711b39587717 Andrew Jones 2026-09-25  449  			return -EINVAL;
8d0711b39587717 Andrew Jones 2026-09-25  450  
ec031e1b35ded5a Nicolin Chen 2025-03-24  451  	/*
ec031e1b35ded5a Nicolin Chen 2025-03-24  452  	 * It is safe to call iommu_attach_handle_get() here because the iommu
ec031e1b35ded5a Nicolin Chen 2025-03-24  453  	 * core code invokes this under the group mutex which also prevents any
ec031e1b35ded5a Nicolin Chen 2025-03-24  454  	 * change of the attach handle for the duration of this function.
ec031e1b35ded5a Nicolin Chen 2025-03-24  455  	 */
ec031e1b35ded5a Nicolin Chen 2025-03-24  456  	iommu_group_mutex_assert(dev);
ec031e1b35ded5a Nicolin Chen 2025-03-24  457  
ec031e1b35ded5a Nicolin Chen 2025-03-24  458  	raw_handle =
ec031e1b35ded5a Nicolin Chen 2025-03-24  459  		iommu_attach_handle_get(dev->iommu_group, IOMMU_NO_PASID, 0);
ec031e1b35ded5a Nicolin Chen 2025-03-24  460  	if (IS_ERR(raw_handle))
ec031e1b35ded5a Nicolin Chen 2025-03-24  461  		return 0;
ec031e1b35ded5a Nicolin Chen 2025-03-24  462  	hwpt_paging = find_hwpt_paging(domain->iommufd_hwpt);
ec031e1b35ded5a Nicolin Chen 2025-03-24  463  
ec031e1b35ded5a Nicolin Chen 2025-03-24  464  	handle = to_iommufd_handle(raw_handle);
ec031e1b35ded5a Nicolin Chen 2025-03-24  465  	/* No IOMMU_RESV_SW_MSI means no change to the msi_msg */
19f1ed2187db401 Andrew Jones 2026-09-25  466  	if (handle->idev->igroup->sw_msi_range.start == PHYS_ADDR_MAX)
ec031e1b35ded5a Nicolin Chen 2025-03-24  467  		return 0;
ec031e1b35ded5a Nicolin Chen 2025-03-24  468  
ec031e1b35ded5a Nicolin Chen 2025-03-24  469  	ictx = handle->idev->ictx;
ec031e1b35ded5a Nicolin Chen 2025-03-24  470  	guard(mutex)(&ictx->sw_msi_lock);
8d0711b39587717 Andrew Jones 2026-09-25  471  	msi_map = iommufd_sw_msi_get_map(ictx, phys_addrs, nr_addrs,
8d0711b39587717 Andrew Jones 2026-09-25  472  					 &handle->idev->igroup->sw_msi_range);
8d0711b39587717 Andrew Jones 2026-09-25  473  	if (msi_map) {
8d0711b39587717 Andrew Jones 2026-09-25  474  		msi_maps = &ictx->sw_msi_list;
8d0711b39587717 Andrew Jones 2026-09-25  475  	} else {
8d0711b39587717 Andrew Jones 2026-09-25  476  		msi_map = iommufd_sw_msi_alloc_map(ictx, phys_addrs, nr_addrs,
bcb9505734cfe46 Andrew Jones 2026-09-25  477  						   &handle->idev->igroup->sw_msi_range,
bcb9505734cfe46 Andrew Jones 2026-09-25  478  						   &new_msi_maps);
ec031e1b35ded5a Nicolin Chen 2025-03-24  479  		if (IS_ERR(msi_map))
ec031e1b35ded5a Nicolin Chen 2025-03-24  480  			return PTR_ERR(msi_map);
8d0711b39587717 Andrew Jones 2026-09-25  481  		msi_maps = &new_msi_maps;
8d0711b39587717 Andrew Jones 2026-09-25  482  	}
ec031e1b35ded5a Nicolin Chen 2025-03-24  483  
8989aec42f50fb3 Andrew Jones 2026-09-25  484  	rc = iommufd_sw_msi_maps_ensure(&handle->idev->igroup->required_sw_msi,
8d0711b39587717 Andrew Jones 2026-09-25  485  					msi_map->id + nr_addrs - 1);
8989aec42f50fb3 Andrew Jones 2026-09-25  486  	if (rc)
bcb9505734cfe46 Andrew Jones 2026-09-25  487  		goto err_free;
8989aec42f50fb3 Andrew Jones 2026-09-25  488  
8d0711b39587717 Andrew Jones 2026-09-25  489  	rc = __iommufd_sw_msi_install_range(ictx, hwpt_paging, msi_maps, msi_map, nr_addrs);
ec031e1b35ded5a Nicolin Chen 2025-03-24  490  	if (rc)
bcb9505734cfe46 Andrew Jones 2026-09-25  491  		goto err_free;
8d0711b39587717 Andrew Jones 2026-09-25  492  
8d0711b39587717 Andrew Jones 2026-09-25  493  	iommufd_sw_msi_set_required(handle->idev->igroup, msi_maps, msi_map, nr_addrs);
ec031e1b35ded5a Nicolin Chen 2025-03-24  494  
bcb9505734cfe46 Andrew Jones 2026-09-25  495  	if (!list_empty(&new_msi_maps)) {
bcb9505734cfe46 Andrew Jones 2026-09-25  496  		list_splice_tail_init(&new_msi_maps, &ictx->sw_msi_list);
8d0711b39587717 Andrew Jones 2026-09-25  497  		ictx->sw_msi_id += nr_addrs;
bcb9505734cfe46 Andrew Jones 2026-09-25  498  	}
bcb9505734cfe46 Andrew Jones 2026-09-25  499  
ec031e1b35ded5a Nicolin Chen 2025-03-24  500  	iova = msi_map->sw_msi_start + msi_map->pgoff * PAGE_SIZE;
ec031e1b35ded5a Nicolin Chen 2025-03-24  501  	msi_desc_set_iommu_msi_iova(desc, iova, PAGE_SHIFT);
ec031e1b35ded5a Nicolin Chen 2025-03-24  502  	return 0;
bcb9505734cfe46 Andrew Jones 2026-09-25  503  
bcb9505734cfe46 Andrew Jones 2026-09-25  504  err_free:
bcb9505734cfe46 Andrew Jones 2026-09-25  505  	while (!list_empty(&new_msi_maps)) {
bcb9505734cfe46 Andrew Jones 2026-09-25  506  		msi_map = list_first_entry(&new_msi_maps, typeof(*msi_map), sw_msi_item);
bcb9505734cfe46 Andrew Jones 2026-09-25  507  		list_del(&msi_map->sw_msi_item);
bcb9505734cfe46 Andrew Jones 2026-09-25  508  		kfree(msi_map);
bcb9505734cfe46 Andrew Jones 2026-09-25  509  	}
bcb9505734cfe46 Andrew Jones 2026-09-25  510  	return rc;
ec031e1b35ded5a Nicolin Chen 2025-03-24  511  }
8d0711b39587717 Andrew Jones 2026-09-25  512  

:::::: The code at line 445 was first introduced by commit
:::::: 8d0711b39587717e085ec90b822dd4bc4995dfcf iommufd: Prepare software MSI installation for address lists

:::::: TO: Andrew Jones <andrew.jones@oss.qualcomm.com>
:::::: CC: Anup Patel <anup@brainfault.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
