Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8331A3081CB;
	Tue, 16 Sep 2025 13:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758028938; cv=none; b=QMhmbya6ZmojdapBQQL/IfVto6YLGrxtNksLV7T3CmsvJe+lnuTT6QuiaqIbalIp3DhHNjzrhhiyAI4HMIZIkEhgxy8zYwxHYwofALuh4P0vYerjzxJQxGer+Ag+KxeKvlubtS9+6o37iBer5mDWganwIw/EkNojtNOgiSI2/jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758028938; c=relaxed/simple;
	bh=esU8SfftAdrmtyWNXeoRiuHCs68NAyHn2UND2qwYJj4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rSKKgKjdnqdY6alyslG16X/2ELLcgoaoZwxdhedA5eYvdiMB2+ZHb6ursM4PoVXGNQbcIvavBLkkKcDixH3HQZ15SnW92O7ajE3PAEXlblmAMShz/YdzNlE1sG7En7cL/mgLRJBtvukvdhKRw+4V86o/plnkY3A8GvTXUgArHP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VAL1s8mF; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VAL1s8mF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758028936; x=1789564936;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=esU8SfftAdrmtyWNXeoRiuHCs68NAyHn2UND2qwYJj4=;
  b=VAL1s8mF8RMB/Rn4EN9hdZyPIhqrpm+cW+i1rmL+3pDH+bN0Ssl9jAtj
   35tJGhcxqZ8Gu7iAo5PN99kCDeJ3GXPrOkD+Hzhv//pud4KdEUvRV7j5c
   VxBqBa8AgFKBcTnCGoaLnz/NjTQJffk3kn07jtztgdEmzfspKE5GsnH2v
   f4Khl0w0C/APYrpvaJ+JuUTWbN//ga4JS0S7edVRiBgIRu+J5EUe8coWf
   kkiYJR/UQb8id4R3JTIN2py3NMefA1aUjXmpAfZoWM0YtM7vQxcWPSp1h
   pG+0+MPDpjNWUBwzY+Eik7tsBn6Fq4ImXZjt7qNbFgZxQVDxpuWtadAVU
   w==;
X-CSE-ConnectionGUID: 4Y5hI41LRAifobz4OM7sOQ==
X-CSE-MsgGUID: Ei/iwC3YScGk+hc0v/YdEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="60418179"
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="60418179"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 06:22:13 -0700
X-CSE-ConnectionGUID: 8OnvZDXsSvWRW0bQ5oUBlA==
X-CSE-MsgGUID: QYJ87xceQs+dO32ouPOM/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="175719200"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 16 Sep 2025 06:22:05 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyVdD-0000K7-00;
	Tue, 16 Sep 2025 13:22:03 +0000
Date: Tue, 16 Sep 2025 21:21:43 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Donald Dutile <ddutile@redhat.com>
Subject: [jgunthorpe:pcie_switch_groups 7/13] drivers/iommu/iommu.c:1512:27:
 error: variable has incomplete type 'struct pci_reachable_set'
Message-ID: <202509162131.7agRb6Ua-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux pcie_switch_groups
head:   359e58e015929f167700789bde9365e492d57b00
commit: 82200d264461e06d24e496a8b583e95995740170 [7/13] iommu: Compute iommu_groups properly for PCIe MFDs
config: i386-buildonly-randconfig-003-20250916 (https://download.01.org/0day-ci/archive/20250916/202509162131.7agRb6Ua-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250916/202509162131.7agRb6Ua-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509162131.7agRb6Ua-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/iommu/iommu.c:24:
   include/linux/pci.h:866:2: warning: '/*' within block comment [-Wcomment]
     866 |         /*
         |         ^
   include/linux/pci.h:871:2: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     871 |         PCIE_ISOLATED,
         |         ^
         |         int
   include/linux/pci.h:876:2: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     871 |         PCIE_ISOLATED,
         |         int
     872 |         /*
     873 |          * The switch's DSP's are not isolated from each other but are isolated
     874 |          * from the USP.
     875 |          */
     876 |         PCIE_SWITCH_DSP_NON_ISOLATED,
         |         ^
   include/linux/pci.h:878:2: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     871 |         PCIE_ISOLATED,
         |         int
     872 |         /*
     873 |          * The switch's DSP's are not isolated from each other but are isolated
     874 |          * from the USP.
     875 |          */
     876 |         PCIE_SWITCH_DSP_NON_ISOLATED,
     877 |         /* The above and the USP's MMIO is not isolated. */
     878 |         PCIE_NON_ISOLATED,
         |         ^
   include/linux/pci.h:884:2: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     871 |         PCIE_ISOLATED,
         |         int
     872 |         /*
     873 |          * The switch's DSP's are not isolated from each other but are isolated
     874 |          * from the USP.
     875 |          */
     876 |         PCIE_SWITCH_DSP_NON_ISOLATED,
     877 |         /* The above and the USP's MMIO is not isolated. */
     878 |         PCIE_NON_ISOLATED,
     879 |         /*
     880 |          * A PCI/PCI-X bus, no isolation. This is like
     881 |          * PCIE_SWITCH_DSP_NON_ISOLATED in that the upstream bridge is isolated
     882 |          * from the bus. The bus itself may also have a shared alias of devfn=0.
     883 |          */
     884 |         PCI_BUS_NON_ISOLATED,
         |         ^
   include/linux/pci.h:889:2: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     871 |         PCI_BRIDGE_NON_ISOLATED,
         |         ^
   include/linux/pci.h:889:25: error: expected ';' at end of declaration
     889 |         PCI_BRIDGE_NON_ISOLATED,
         |                                ^
         |                                ;
   include/linux/pci.h:890:1: error: extraneous closing brace ('}')
     890 | };
         | ^
   include/linux/pci.h:2099:32: warning: declaration of 'struct pci_reachable_set' will not be visible outside of this function [-Wvisibility]
    2099 |         struct pci_dev *start, struct pci_reachable_set *devfns,
         |                                       ^
   include/linux/pci.h:2103:38: error: incomplete result type 'enum pci_bus_isolation' in function definition
    2103 | static inline enum pci_bus_isolation pci_bus_isolated(struct pci_bus *bus)
         |                                      ^
   include/linux/pci.h:2103:20: note: forward declaration of 'enum pci_bus_isolation'
    2103 | static inline enum pci_bus_isolation pci_bus_isolated(struct pci_bus *bus)
         |                    ^
   include/linux/pci.h:2104:10: error: returning 'int' from a function with incompatible result type 'enum pci_bus_isolation'
    2104 | { return PCIE_NON_ISOLATED; }
         |          ^~~~~~~~~~~~~~~~~
>> drivers/iommu/iommu.c:1512:27: error: variable has incomplete type 'struct pci_reachable_set'
    1512 |         struct pci_reachable_set devfns;
         |                                  ^
   drivers/iommu/iommu.c:1512:9: note: forward declaration of 'struct pci_reachable_set'
    1512 |         struct pci_reachable_set devfns;
         |                ^
   2 warnings and 10 errors generated.


vim +1512 drivers/iommu/iommu.c

  1505	
  1506	/*
  1507	 * Return a group if the function has isolation restrictions related to
  1508	 * aliases or MFD ACS.
  1509	 */
  1510	static struct iommu_group *pci_get_function_group(struct pci_dev *pdev)
  1511	{
> 1512		struct pci_reachable_set devfns;
  1513		const unsigned int NR_DEVFNS = sizeof(devfns.devfns) * BITS_PER_BYTE;
  1514		unsigned int devfn;
  1515	
  1516		/*
  1517		 * Look for existing groups on device aliases and multi-function ACS. If
  1518		 * we alias another device or another device aliases us, use the same
  1519		 * group.
  1520		 *
  1521		 * pci_reachable_bus_set() should return the same bitmap if called for
  1522		 * any device in the set and we want all devices in the set to have the
  1523		 * same group.
  1524		 */
  1525		pci_reachable_bus_set(pdev, &devfns, pci_devs_are_same_group);
  1526		/* start is known to have iommu_group_get() == NULL */
  1527		__clear_bit(pdev->devfn, devfns.devfns);
  1528	
  1529		/*
  1530		 * When MFD functions are included in the set due to ACS we assume that
  1531		 * if ACS permits an internal loopback between functions it also permits
  1532		 * the loopback to go downstream if any function is a bridge.
  1533		 *
  1534		 * It is less clear what aliases mean when applied to a bridge. For now
  1535		 * be conservative and also propagate the group downstream.
  1536		 */
  1537		if (bitmap_empty(devfns.devfns, NR_DEVFNS))
  1538			return NULL;
  1539	
  1540		for_each_set_bit(devfn, devfns.devfns, NR_DEVFNS) {
  1541			struct iommu_group *group;
  1542			struct pci_dev *pdev_slot;
  1543	
  1544			pdev_slot = pci_get_slot(pdev->bus, devfn);
  1545			group = iommu_group_get(&pdev_slot->dev);
  1546			pci_dev_put(pdev_slot);
  1547			if (group) {
  1548				if (WARN_ON(!(group->bus_data &
  1549					      BUS_DATA_PCI_NON_ISOLATED)))
  1550					group->bus_data |= BUS_DATA_PCI_NON_ISOLATED;
  1551				return group;
  1552			}
  1553		}
  1554		return iommu_group_alloc_data(BUS_DATA_PCI_NON_ISOLATED);
  1555	}
  1556	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
