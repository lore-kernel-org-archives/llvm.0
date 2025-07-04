Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307AA2E3707;
	Fri,  4 Jul 2025 17:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751649624; cv=none; b=id5ae0A5GHpLRUkx6xRZ7TYfpXBWRmLfTRJc68mfgp2a84761IAaRFd9qRFSLS7K0OANc7ElHfjT03bhge4obQIj9mEzz23hIhYwnipZT1vJi/BNXwJral42dceyH4/FJ8ietYHqFhLmCB3NBlI1OVdJMyir2u9uXyA48J8fRZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751649624; c=relaxed/simple;
	bh=bE6gummSO2D3J2PJzBtbYTyogO9npbyQrEoHVbzIIh8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OUYusPdQ+oBDQ7EAK4L+xKa4JJ/1xthLf8Wjh42nyRzWIPmoO16416B+3p273PUruEnkJQAaD9gLma5+jlwq4bJdPYZSV0QCHw5NHsLbwzYQt3Kr1PmldbgFovzJ+xMGV5lVJBC0nqBXbbBHXI1Q5nI0iaXVj5Rw28pj7IhY/Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LjB0MnQB; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LjB0MnQB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751649622; x=1783185622;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bE6gummSO2D3J2PJzBtbYTyogO9npbyQrEoHVbzIIh8=;
  b=LjB0MnQBKCVzYvHxZoT6RM7EPsdKJox+N4eHu9RgaFey+EDGpz0X9OHM
   sRI1i1GIMr/2/12DAm2367FHJUtnna2Hl1DqPsbpTZun90y3YoBaJUvGj
   Mlq04fpdofmt1oDMF3EMqFwAXPcyHFHJk6Yu2dvY0yDl+ApDjnjdV6Y23
   GiABjthoabH36BFxrOihF358htg7Uv6OEyKAprtOghbujut28LngpDU0c
   lpHTR9EatWMIf5u5Adj9qHz+WgFhWZipeLPd09+VchYUcK4211uQZZXTl
   fcBcjsWzBeLrYhhYjRbETV1wo/IRv1H+do6gV1kzV7OSTU7jVu57RUWG2
   Q==;
X-CSE-ConnectionGUID: MWhHVNs7TlGqc33pL8JqzA==
X-CSE-MsgGUID: BRdnJq40Qg6PeybFaz87mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="64234010"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; 
   d="scan'208";a="64234010"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 10:20:21 -0700
X-CSE-ConnectionGUID: 9hG1rjjaSE6z6JONcfLraw==
X-CSE-MsgGUID: Jjm05TemSUqMjotRukAcwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; 
   d="scan'208";a="155257456"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 04 Jul 2025 10:20:20 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXk5C-0003wh-1J;
	Fri, 04 Jul 2025 17:20:18 +0000
Date: Sat, 5 Jul 2025 01:20:11 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:pcie_switch_groups 7/14] drivers/iommu/iommu.c:1496:34:
 error: no member named 'physfn' in 'struct pci_dev'
Message-ID: <202507050149.QgS8GqjY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux pcie_switch_groups
head:   c23052fdba89409253fa50d8c115d423fb86dc15
commit: 760a9df75c1c830329e23a99e70f92c59c11c355 [7/14] iommu: Check SRIOV PF/VFs as though they are MFDs
config: x86_64-buildonly-randconfig-003-20250704 (https://download.01.org/0day-ci/archive/20250705/202507050149.QgS8GqjY-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250705/202507050149.QgS8GqjY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507050149.QgS8GqjY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iommu/iommu.c:1496:34: error: no member named 'physfn' in 'struct pci_dev'
    1496 |                 if (piter->is_virtfn && piter->physfn == pdev &&
         |                                         ~~~~~  ^
   1 error generated.


vim +1496 drivers/iommu/iommu.c

  1468	
  1469	/*
  1470	 * SRIOV acts like a MFD and each PF/VF has an ACS capability. When we reach a
  1471	 * VF the VF can use a unique group or re-use the group of the PF depending on
  1472	 * the ACS flags of the entire VF/PF. If the PF is already part of some MFD or
  1473	 * alias group then it
  1474	 */
  1475	static struct iommu_group *pci_get_sriov_group(struct pci_dev *pdev)
  1476	{
  1477		struct pci_dev *piter = NULL;
  1478		struct iommu_group *group;
  1479	
  1480		if (!pdev->is_virtfn)
  1481			return NULL;
  1482	
  1483		pdev = pci_physfn(pdev);
  1484	
  1485		group = iommu_group_get(&pdev->dev);
  1486		if (WARN_ON(!group))
  1487			return ERR_PTR(-EINVAL);
  1488	
  1489		if (group->bus_data & BUS_DATA_PCI_NON_ISOLATED)
  1490			return group;
  1491	
  1492		if (!pci_acs_enabled(pdev, PCI_ACS_ISOLATED))
  1493			return group;
  1494	
  1495		for_each_pci_dev(piter)
> 1496			if (piter->is_virtfn && piter->physfn == pdev &&
  1497			    !pci_acs_enabled(pdev, PCI_ACS_ISOLATED))
  1498				return group;
  1499	
  1500		iommu_group_put(group);
  1501		return NULL;
  1502	}
  1503	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
