Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87504085D;
	Sat,  5 Oct 2024 11:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728126850; cv=none; b=R0uQV+DnJNnB+zf5XEOvY2dKER6uhS56wKU7C1ya28LLLeTebI8EB/J4cJiGDE7jQZodf37TToMZhewzoP0rbenT8NTSKA+u7bU4/To3XZjQRQm4xu0REu90JlqDdlcZ8wFPZVQjEAma1NCoYntMjH3m7tBciIpdXvZirZG8Re8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728126850; c=relaxed/simple;
	bh=msxtdD3ixfxDDOEqLZMZVUEzdYeNGA/EjpvvsSeLvXw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nz1DhMs4dxVbAvZls0HymV7gyCqgxp/b3+BIUharu+WdIgx7QgGB9vb8a/87+RfLZqQEIoS33NGFZ3ax2XHCP4S8zoJwvHR+rE5AeaXl9Z87IeokPbJb18BAdqQazJYPLOPAbH6EZTqOz0i+gcMnrS0V6GpyUP/5DOggFFmZJGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TiYMXrO+; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TiYMXrO+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728126848; x=1759662848;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=msxtdD3ixfxDDOEqLZMZVUEzdYeNGA/EjpvvsSeLvXw=;
  b=TiYMXrO+USDO9YpcxYVorwE81UhLBKP9/KS8lPUpJ2deUrcAoZtcwc4K
   pG+k7wxcPdCaiNy9grdYSnTyR8nLCMVGUg/vplgPgRAatSvgQEbciNJYU
   5BFUX4tXhbdN9i1g2tiNLqUWoQMoOs/yYpLEDu53uqRGXgHTIUGBNFL3Z
   qVCQqCUKmwTjcFw1/GerF9n0rSPDe05SkB/cI9j7V9edSZqVwz+7YYTr8
   kiqcE9P9+UNH99u5T85xMz2KRCLr9X+5Pc8GjnO+crkj7VHRTs5+tFuK0
   C29N010Mx1WdCR+XgQzo1w8T/tgWWfPFag5r00lA5EUjLObqB6pi7MyBn
   g==;
X-CSE-ConnectionGUID: vs36EgySS66yaT/+maiHyA==
X-CSE-MsgGUID: mTZFIatXRsGVh9vRsRDjEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="27471186"
X-IronPort-AV: E=Sophos;i="6.11,180,1725346800"; 
   d="scan'208";a="27471186"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 04:14:08 -0700
X-CSE-ConnectionGUID: mZN8iP82SGq+IIrk2JESxw==
X-CSE-MsgGUID: NQaTG+5yR/iVgf4E6UaRyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,180,1725346800"; 
   d="scan'208";a="74963686"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 05 Oct 2024 04:14:06 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sx2jc-0002sw-1i;
	Sat, 05 Oct 2024 11:14:04 +0000
Date: Sat, 5 Oct 2024 19:13:53 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Vasant Hegde <vasant.hegde@amd.com>
Subject: [jgunthorpe:for-vasant 2/10] include/linux/iommu.h:1103:1: error:
 declaration of anonymous struct must be a definition
Message-ID: <202410051943.59KUI762-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux for-vasant
head:   8aa0df6ce0d35430baeac4ee5e0ea77f82cf2ead
commit: 9d7523756e213acff67f3b9264211becfbb5b7bb [2/10] iommu: Introduce iommu_paging_domain_alloc_flags()
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20241005/202410051943.59KUI762-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410051943.59KUI762-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410051943.59KUI762-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from kernel/fork.c:104:
>> include/linux/iommu.h:1103:1: error: declaration of anonymous struct must be a definition
    1103 | struct inline iommu_domain *iommu_paging_domain_alloc_flags(struct device *dev,
         | ^
>> include/linux/iommu.h:1103:1: warning: declaration does not declare anything [-Wmissing-declarations]
>> include/linux/iommu.h:1478:48: warning: declaration of 'struct msi_desc' will not be visible outside of this function [-Wvisibility]
    1478 | static inline int iommu_dma_prepare_msi(struct msi_desc *desc, phys_addr_t msi_addr)
         |                                                ^
   include/linux/iommu.h:1483:53: warning: declaration of 'struct msi_desc' will not be visible outside of this function [-Wvisibility]
    1483 | static inline void iommu_dma_compose_msi_msg(struct msi_desc *desc, struct msi_msg *msg)
         |                                                     ^
   3 warnings and 1 error generated.
--
   In file included from arch/x86/kernel/pci-dma.c:4:
>> include/linux/iommu.h:1103:1: error: declaration of anonymous struct must be a definition
    1103 | struct inline iommu_domain *iommu_paging_domain_alloc_flags(struct device *dev,
         | ^
>> include/linux/iommu.h:1103:1: warning: declaration does not declare anything [-Wmissing-declarations]
>> include/linux/iommu.h:1478:48: warning: declaration of 'struct msi_desc' will not be visible outside of this function [-Wvisibility]
    1478 | static inline int iommu_dma_prepare_msi(struct msi_desc *desc, phys_addr_t msi_addr)
         |                                                ^
   include/linux/iommu.h:1483:53: warning: declaration of 'struct msi_desc' will not be visible outside of this function [-Wvisibility]
    1483 | static inline void iommu_dma_compose_msi_msg(struct msi_desc *desc, struct msi_msg *msg)
         |                                                     ^
>> arch/x86/kernel/pci-dma.c:162:4: error: call to undeclared function 'iommu_set_default_passthrough'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     162 |                         iommu_set_default_passthrough(true);
         |                         ^
>> arch/x86/kernel/pci-dma.c:164:4: error: call to undeclared function 'iommu_set_default_translated'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     164 |                         iommu_set_default_translated(true);
         |                         ^
   3 warnings and 3 errors generated.
--
   In file included from drivers/base/platform.c:33:
>> include/linux/iommu.h:1103:1: error: declaration of anonymous struct must be a definition
    1103 | struct inline iommu_domain *iommu_paging_domain_alloc_flags(struct device *dev,
         | ^
>> include/linux/iommu.h:1103:1: warning: declaration does not declare anything [-Wmissing-declarations]
>> drivers/base/platform.c:1457:8: error: call to undeclared function 'iommu_device_use_default_domain'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1457 |         ret = iommu_device_use_default_domain(dev);
         |               ^
>> drivers/base/platform.c:1469:3: error: call to undeclared function 'iommu_device_unuse_default_domain'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1469 |                 iommu_device_unuse_default_domain(dev);
         |                 ^
   1 warning and 3 errors generated.


vim +1103 include/linux/iommu.h

  1102	
> 1103	struct inline iommu_domain *iommu_paging_domain_alloc_flags(struct device *dev,
  1104								    unsigned int flags)
  1105	{
  1106		return ERR_PTR(-ENODEV);
  1107	}
  1108	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
