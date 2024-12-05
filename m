Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0662119;
	Thu,  5 Dec 2024 04:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733373339; cv=none; b=EJGKakulHKBbGl4lmjJSGI5AUoVegypNKHyf5bl1HJPnTXgympr1QNfEca1siPJ5FGsat2NndQYOeXATXwc//aU8qheVK6LKoqgtMCx9i0M+S8LbMydwGdHL/jHUcbU8FmkWkEnzuonkX6uTlZwdfm1UTg6xQOjEqe/c60iQna8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733373339; c=relaxed/simple;
	bh=YJLuSWlKXsp5PArq37cSpwXznXtH+Dp/EPn1ijws56g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JgyFOs9hpaKl2iu75X/vIt9BliiuPE3O8M+3zteyKs9MwzjyoI/ycNngBqLGK0PFzRmp/HKDInjy5nir7LGfoxGCATG0koBWahW2CXALSFZ5z0AAsOHJ4BOapv9kIlgbZnIzmZLoA6ZNNuf7Sno4qXQE9CtNRClD9hT54QcUl+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OGkot9Eh; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OGkot9Eh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733373338; x=1764909338;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YJLuSWlKXsp5PArq37cSpwXznXtH+Dp/EPn1ijws56g=;
  b=OGkot9Ehi3AhSCK2ZlQbUNH0MII85ZSnILBqZLYgovPycab+1Ke4on1F
   vYz9BvRbWItYiURR0JnDqjLg3Pp6DanyxE4vu16cOGkds2+hXbxnx0+71
   cStJ08AO2Rpk0JmcJZPPm4z3MdocKQZqNyFuyFj61t3vhJhMTwMefaC/Y
   R/SPE77zbddwLN2HA5ou+0LzQkA79QOjCeTU3CFy3J8KM6qmMd1bHf7wU
   C85+QKHQiqhZ/Mtg+KxO5GPkWQxpM8Iqlahs33o5LPGCl3SLJ10tjCnC1
   27f8yMQgX4uqNaPKox2yktgc1ZEi2Rz3bkvSDekc7Q7WGIq9SXpKZySDQ
   A==;
X-CSE-ConnectionGUID: RLkQoX9hRYOzA4ChFYyxFQ==
X-CSE-MsgGUID: 72Xu0828R2epAzu5Vy0Ozw==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="37332316"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="37332316"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 20:35:37 -0800
X-CSE-ConnectionGUID: Al/vxB16RmaBIFnJc5IXtA==
X-CSE-MsgGUID: aAvwhhuVR2evXM/SrTZgog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="98433245"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 04 Dec 2024 20:35:36 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJ3aP-0003mz-2B;
	Thu, 05 Dec 2024 04:35:33 +0000
Date: Thu, 5 Dec 2024 12:34:51 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:for-nicolin 2/3] drivers/iommu/dma-iommu.c:1811:23:
 error: call to undeclared function 'msi_desc_to_dev'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202412051216.fEjzk4X5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux for-nicolin
head:   0e29e6b0fc354c5123d013751f75aedb565ffa86
commit: f4c17c72b6d21df5fa405ad0924fc298debd1b09 [2/3] iommu: Make iommu_dma_prepare/compose_msi() into a generic operation
config: arm64-randconfig-001-20241205 (https://download.01.org/0day-ci/archive/20241205/202412051216.fEjzk4X5-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412051216.fEjzk4X5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412051216.fEjzk4X5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iommu/dma-iommu.c:1811:23: error: call to undeclared function 'msi_desc_to_dev'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           struct device *dev = msi_desc_to_dev(desc);
                                ^
   drivers/iommu/dma-iommu.c:1811:17: error: incompatible integer to pointer conversion initializing 'struct device *' with an expression of type 'int' [-Wint-conversion]
           struct device *dev = msi_desc_to_dev(desc);
                          ^     ~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/dma-iommu.c:1815:7: error: incomplete definition of type 'struct msi_desc'
                   desc->iommu_cookie = NULL;
                   ~~~~^
   include/linux/irq.h:129:8: note: forward declaration of 'struct msi_desc'
   struct msi_desc;
          ^
>> drivers/iommu/dma-iommu.c:1821:14: error: call to undeclared function 'msi_desc_get_iommu_cookie'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   msi_page = msi_desc_get_iommu_cookie(desc);
                              ^
   drivers/iommu/dma-iommu.c:1821:12: error: incompatible integer to pointer conversion assigning to 'const struct iommu_dma_msi_page *' from 'int' [-Wint-conversion]
                   msi_page = msi_desc_get_iommu_cookie(desc);
                            ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/dma-iommu.c:1826:6: error: incomplete definition of type 'struct msi_msg'
                   msg->address_hi = upper_32_bits(msi_page->iova);
                   ~~~^
   include/linux/irq.h:29:8: note: forward declaration of 'struct msi_msg'
   struct msi_msg;
          ^
   drivers/iommu/dma-iommu.c:1827:6: error: incomplete definition of type 'struct msi_msg'
                   msg->address_lo &= cookie_msi_granule(domain->iova_cookie) - 1;
                   ~~~^
   include/linux/irq.h:29:8: note: forward declaration of 'struct msi_msg'
   struct msi_msg;
          ^
   drivers/iommu/dma-iommu.c:1828:6: error: incomplete definition of type 'struct msi_msg'
                   msg->address_lo += lower_32_bits(msi_page->iova);
                   ~~~^
   include/linux/irq.h:29:8: note: forward declaration of 'struct msi_msg'
   struct msi_msg;
          ^
>> drivers/iommu/dma-iommu.c:1835:2: error: call to undeclared function 'msi_desc_set_iommu_cookie'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           msi_desc_set_iommu_cookie(desc, msi_page);
           ^
   9 errors generated.


vim +/msi_desc_to_dev +1811 drivers/iommu/dma-iommu.c

44bb7e243bd4b4 Robin Murphy      2016-09-12  1807  
f4c17c72b6d21d Jason Gunthorpe   2024-12-03  1808  static int iommu_dma_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
f4c17c72b6d21d Jason Gunthorpe   2024-12-03  1809  			    phys_addr_t msi_addr, struct msi_msg *msg)
44bb7e243bd4b4 Robin Murphy      2016-09-12  1810  {
ece6e6f0218b77 Julien Grall      2019-05-01 @1811  	struct device *dev = msi_desc_to_dev(desc);
f4c17c72b6d21d Jason Gunthorpe   2024-12-03  1812  	const struct iommu_dma_msi_page *msi_page;
44bb7e243bd4b4 Robin Murphy      2016-09-12  1813  
f4c17c72b6d21d Jason Gunthorpe   2024-12-03  1814  	if (!domain->iova_cookie) {
ece6e6f0218b77 Julien Grall      2019-05-01  1815  		desc->iommu_cookie = NULL;
ece6e6f0218b77 Julien Grall      2019-05-01  1816  		return 0;
ece6e6f0218b77 Julien Grall      2019-05-01  1817  	}
44bb7e243bd4b4 Robin Murphy      2016-09-12  1818  
f4c17c72b6d21d Jason Gunthorpe   2024-12-03  1819  	/* Compose an already prepared mapping */
f4c17c72b6d21d Jason Gunthorpe   2024-12-03  1820  	if (msg) {
f4c17c72b6d21d Jason Gunthorpe   2024-12-03 @1821  		msi_page = msi_desc_get_iommu_cookie(desc);
44bb7e243bd4b4 Robin Murphy      2016-09-12  1822  
f4c17c72b6d21d Jason Gunthorpe   2024-12-03  1823  		if (!domain->iova_cookie || WARN_ON(!msi_page))
f4c17c72b6d21d Jason Gunthorpe   2024-12-03  1824  			return 0;
ece6e6f0218b77 Julien Grall      2019-05-01  1825  
f4c17c72b6d21d Jason Gunthorpe   2024-12-03  1826  		msg->address_hi = upper_32_bits(msi_page->iova);
f4c17c72b6d21d Jason Gunthorpe   2024-12-03  1827  		msg->address_lo &= cookie_msi_granule(domain->iova_cookie) - 1;
f4c17c72b6d21d Jason Gunthorpe   2024-12-03  1828  		msg->address_lo += lower_32_bits(msi_page->iova);
ece6e6f0218b77 Julien Grall      2019-05-01  1829  		return 0;
ece6e6f0218b77 Julien Grall      2019-05-01  1830  	}
ece6e6f0218b77 Julien Grall      2019-05-01  1831  
f4c17c72b6d21d Jason Gunthorpe   2024-12-03  1832  	iommu_group_mutex_assert(dev);
f4c17c72b6d21d Jason Gunthorpe   2024-12-03  1833  	msi_page = iommu_dma_get_msi_page(dev, msi_addr, domain);
ece6e6f0218b77 Julien Grall      2019-05-01  1834  
f4c17c72b6d21d Jason Gunthorpe   2024-12-03 @1835  	msi_desc_set_iommu_cookie(desc, msi_page);
ece6e6f0218b77 Julien Grall      2019-05-01  1836  
f4c17c72b6d21d Jason Gunthorpe   2024-12-03  1837  	if (!msi_page)
f4c17c72b6d21d Jason Gunthorpe   2024-12-03  1838  		return -ENOMEM;
f4c17c72b6d21d Jason Gunthorpe   2024-12-03  1839  	return 0;
44bb7e243bd4b4 Robin Murphy      2016-09-12  1840  }
06d60728ff5c01 Christoph Hellwig 2019-05-20  1841  

:::::: The code at line 1811 was first introduced by commit
:::::: ece6e6f0218b7777e650bf93728130ae6f4feb7d iommu/dma-iommu: Split iommu_dma_map_msi_msg() in two parts

:::::: TO: Julien Grall <julien.grall@arm.com>
:::::: CC: Marc Zyngier <marc.zyngier@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
