Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE680170A37;
	Fri, 27 Sep 2024 03:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727408699; cv=none; b=PqhdjoSTRQFAPza/1bgF5RPFCZGg/p15EEt7BdjiUmzdsyyBFVWONfDCuBQ9ix1otRDFon0iNcCK/9/Hnb8aes9TSB3S5L8AmgPNUgXK4auPh9GLqPFE1/2us4/0fUFdB5zqZtkT8BkD0z+k++A35ajv6g0RzEHPG1E9A22t/JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727408699; c=relaxed/simple;
	bh=LyyGxfM15jMWTWmjmp82DRiHX2PxCeTdRJFBBvRkxTo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=raW8+0jE7+ov2V2Meqw927giqckJIBOtMGZwUXM/yxns/z3WrD6qb7H2mQOcjv5dQnF+cA/2CJXq5KDKNfYyYBQTttCi4jDzzEuaHF4WwE1gNFQD67IX0YaBSo7oFXMDatF7oceXVIG6WWuydqoDO5egBGK2jVHS82knxAbgJ1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GonwliGl; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GonwliGl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727408697; x=1758944697;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LyyGxfM15jMWTWmjmp82DRiHX2PxCeTdRJFBBvRkxTo=;
  b=GonwliGlTTsNw2j0CZg4yESKyY7vuUx0aej+7S9vgk5m7Vu6tF93fj2V
   0xsQNzbE4EOni3lMObEmYhjSI+HGuNx3AigNCHWFhFYfR79pZZYD1fPdY
   fOC8IckdrJ07gFM/Cow9ckAFdI3ohvWpp9nc7N9m76GK6AXDTai5SiwuD
   1VVOp1IEEMwLFzHAyPhc981C/FB82809iN3PNDw53g/tVALrW/rVT0ER3
   EY41bistyQY1cLN4QgYQ78jFdb/TE+foBdOYfzqBT97166AYkE3XTz886
   GRwqViAN1E7ntTXzzb3Og7hxy0W41k0Yhm5OIfqhZgQOUGsP0TNv8LFCa
   A==;
X-CSE-ConnectionGUID: osAnlPHTSpCoFjOPYKMFrg==
X-CSE-MsgGUID: uVY764pWSbaaG8AiaVIzfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="37902469"
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="37902469"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 20:44:55 -0700
X-CSE-ConnectionGUID: oMU9thDCQ5areyMjp7Z1mw==
X-CSE-MsgGUID: 4SUY57npRzuEb4wQs6W64w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="76902768"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 Sep 2024 20:44:53 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1su1uV-000LQZ-0R;
	Fri, 27 Sep 2024 03:44:51 +0000
Date: Fri, 27 Sep 2024 11:44:46 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel@sholland.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: [esmil:d1-6.11.y 46/47] drivers/iommu/iommu.c:1739:17: error: static
 assertion failed due to requirement '!(1 && 1)':
 !(IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU) && IS_ENABLED(CONFIG_IOMMU_DMA))
Message-ID: <202409271127.PcxwlMWk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux d1-6.11.y
head:   d99b769766ff1b1ced32d8d279d28e581e02fa9d
commit: 52b502637f663a122417fde5416982e137148c64 [46/47] iommu/sun50i: Ensure the IOMMU can be used for DMA
config: arm-randconfig-004-20240927 (https://download.01.org/0day-ci/archive/20240927/202409271127.PcxwlMWk-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7773243d9916f98ba0ffce0c3a960e4aa9f03e81)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409271127.PcxwlMWk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409271127.PcxwlMWk-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/iommu/iommu.c:9:
   In file included from include/linux/amba/bus.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2232:
   include/linux/vmstat.h:517:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/iommu/iommu.c:1739:17: error: static assertion failed due to requirement '!(1 && 1)': !(IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU) && IS_ENABLED(CONFIG_IOMMU_DMA))
    1739 |                 static_assert(!(IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU) &&
         |                 ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1740 |                                 IS_ENABLED(CONFIG_IOMMU_DMA)));
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   1 warning and 1 error generated.


vim +1739 drivers/iommu/iommu.c

59ddce4418da48 Jason Gunthorpe 2023-09-13  1718  
59ddce4418da48 Jason Gunthorpe 2023-09-13  1719  /*
59ddce4418da48 Jason Gunthorpe 2023-09-13  1720   * A target_type of 0 will select the best domain type. 0 can be returned in
59ddce4418da48 Jason Gunthorpe 2023-09-13  1721   * this case meaning the global default should be used.
59ddce4418da48 Jason Gunthorpe 2023-09-13  1722   */
8b4eb75ee50e6f Jason Gunthorpe 2023-05-11  1723  static int iommu_get_default_domain_type(struct iommu_group *group,
8b4eb75ee50e6f Jason Gunthorpe 2023-05-11  1724  					 int target_type)
deac0b3bed26bb Joerg Roedel    2020-04-29  1725  {
59ddce4418da48 Jason Gunthorpe 2023-09-13  1726  	struct device *untrusted = NULL;
8b4eb75ee50e6f Jason Gunthorpe 2023-05-11  1727  	struct group_device *gdev;
59ddce4418da48 Jason Gunthorpe 2023-09-13  1728  	int driver_type = 0;
deac0b3bed26bb Joerg Roedel    2020-04-29  1729  
8b4eb75ee50e6f Jason Gunthorpe 2023-05-11  1730  	lockdep_assert_held(&group->mutex);
deac0b3bed26bb Joerg Roedel    2020-04-29  1731  
e98befd010bd56 Jason Gunthorpe 2023-09-13  1732  	/*
e98befd010bd56 Jason Gunthorpe 2023-09-13  1733  	 * ARM32 drivers supporting CONFIG_ARM_DMA_USE_IOMMU can declare an
e98befd010bd56 Jason Gunthorpe 2023-09-13  1734  	 * identity_domain and it will automatically become their default
e98befd010bd56 Jason Gunthorpe 2023-09-13  1735  	 * domain. Later on ARM_DMA_USE_IOMMU will install its UNMANAGED domain.
98ac73f99bc44f Jason Gunthorpe 2023-09-13  1736  	 * Override the selection to IDENTITY.
e98befd010bd56 Jason Gunthorpe 2023-09-13  1737  	 */
98ac73f99bc44f Jason Gunthorpe 2023-09-13  1738  	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)) {
98ac73f99bc44f Jason Gunthorpe 2023-09-13 @1739  		static_assert(!(IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU) &&
98ac73f99bc44f Jason Gunthorpe 2023-09-13  1740  				IS_ENABLED(CONFIG_IOMMU_DMA)));
e98befd010bd56 Jason Gunthorpe 2023-09-13  1741  		driver_type = IOMMU_DOMAIN_IDENTITY;
98ac73f99bc44f Jason Gunthorpe 2023-09-13  1742  	}
e98befd010bd56 Jason Gunthorpe 2023-09-13  1743  
8b4eb75ee50e6f Jason Gunthorpe 2023-05-11  1744  	for_each_group_device(group, gdev) {
59ddce4418da48 Jason Gunthorpe 2023-09-13  1745  		driver_type = iommu_get_def_domain_type(group, gdev->dev,
59ddce4418da48 Jason Gunthorpe 2023-09-13  1746  							driver_type);
deac0b3bed26bb Joerg Roedel    2020-04-29  1747  
e98befd010bd56 Jason Gunthorpe 2023-09-13  1748  		if (dev_is_pci(gdev->dev) && to_pci_dev(gdev->dev)->untrusted) {
e98befd010bd56 Jason Gunthorpe 2023-09-13  1749  			/*
e98befd010bd56 Jason Gunthorpe 2023-09-13  1750  			 * No ARM32 using systems will set untrusted, it cannot
e98befd010bd56 Jason Gunthorpe 2023-09-13  1751  			 * work.
e98befd010bd56 Jason Gunthorpe 2023-09-13  1752  			 */
e98befd010bd56 Jason Gunthorpe 2023-09-13  1753  			if (WARN_ON(IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)))
8b4eb75ee50e6f Jason Gunthorpe 2023-05-11  1754  				return -1;
59ddce4418da48 Jason Gunthorpe 2023-09-13  1755  			untrusted = gdev->dev;
59ddce4418da48 Jason Gunthorpe 2023-09-13  1756  		}
deac0b3bed26bb Joerg Roedel    2020-04-29  1757  	}
deac0b3bed26bb Joerg Roedel    2020-04-29  1758  
0f6a90436a5771 Jason Gunthorpe 2023-10-03  1759  	/*
0f6a90436a5771 Jason Gunthorpe 2023-10-03  1760  	 * If the common dma ops are not selected in kconfig then we cannot use
0f6a90436a5771 Jason Gunthorpe 2023-10-03  1761  	 * IOMMU_DOMAIN_DMA at all. Force IDENTITY if nothing else has been
0f6a90436a5771 Jason Gunthorpe 2023-10-03  1762  	 * selected.
0f6a90436a5771 Jason Gunthorpe 2023-10-03  1763  	 */
0f6a90436a5771 Jason Gunthorpe 2023-10-03  1764  	if (!IS_ENABLED(CONFIG_IOMMU_DMA)) {
0f6a90436a5771 Jason Gunthorpe 2023-10-03  1765  		if (WARN_ON(driver_type == IOMMU_DOMAIN_DMA))
0f6a90436a5771 Jason Gunthorpe 2023-10-03  1766  			return -1;
0f6a90436a5771 Jason Gunthorpe 2023-10-03  1767  		if (!driver_type)
0f6a90436a5771 Jason Gunthorpe 2023-10-03  1768  			driver_type = IOMMU_DOMAIN_IDENTITY;
deac0b3bed26bb Joerg Roedel    2020-04-29  1769  	}
0f6a90436a5771 Jason Gunthorpe 2023-10-03  1770  
59ddce4418da48 Jason Gunthorpe 2023-09-13  1771  	if (untrusted) {
59ddce4418da48 Jason Gunthorpe 2023-09-13  1772  		if (driver_type && driver_type != IOMMU_DOMAIN_DMA) {
8b4eb75ee50e6f Jason Gunthorpe 2023-05-11  1773  			dev_err_ratelimited(
59ddce4418da48 Jason Gunthorpe 2023-09-13  1774  				untrusted,
59ddce4418da48 Jason Gunthorpe 2023-09-13  1775  				"Device is not trusted, but driver is overriding group %u to %s, refusing to probe.\n",
59ddce4418da48 Jason Gunthorpe 2023-09-13  1776  				group->id, iommu_domain_type_str(driver_type));
8b4eb75ee50e6f Jason Gunthorpe 2023-05-11  1777  			return -1;
deac0b3bed26bb Joerg Roedel    2020-04-29  1778  		}
59ddce4418da48 Jason Gunthorpe 2023-09-13  1779  		driver_type = IOMMU_DOMAIN_DMA;
deac0b3bed26bb Joerg Roedel    2020-04-29  1780  	}
59ddce4418da48 Jason Gunthorpe 2023-09-13  1781  
59ddce4418da48 Jason Gunthorpe 2023-09-13  1782  	if (target_type) {
59ddce4418da48 Jason Gunthorpe 2023-09-13  1783  		if (driver_type && target_type != driver_type)
59ddce4418da48 Jason Gunthorpe 2023-09-13  1784  			return -1;
59ddce4418da48 Jason Gunthorpe 2023-09-13  1785  		return target_type;
deac0b3bed26bb Joerg Roedel    2020-04-29  1786  	}
59ddce4418da48 Jason Gunthorpe 2023-09-13  1787  	return driver_type;
deac0b3bed26bb Joerg Roedel    2020-04-29  1788  }
deac0b3bed26bb Joerg Roedel    2020-04-29  1789  

:::::: The code at line 1739 was first introduced by commit
:::::: 98ac73f99bc44fba8a14252ffb0bad02459f7008 iommu: Require a default_domain for all iommu drivers

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
