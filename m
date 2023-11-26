Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC412F41;
	Sun, 26 Nov 2023 07:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gue/R9KD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700982495; x=1732518495;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=unHUxs53FMPW+Twu0EDsX59K3X8Xh/BxFcZEIanOl1Q=;
  b=Gue/R9KD85ruLTiqX/Iwf2cbBq8XiuaEJVkcIMTrtLiK6E/TuDZPaDGv
   dYLHx1e4S132fRwVLGE3GOeWrM7EHAL5HgJi7Q+T7Vh9tunFV4cPmB5HC
   C2BzLLxQ8lBd4r7VMTv89a95mRExGBD0rus+j42TR/Syoo1GEF0sNUgKs
   6FTgLNwiAb4cfF4jMDfuqTNZFuLObeYjr6u/bVQbn9AryoW9iQQo+0vFh
   rVV56ZpvuF19Wi6tHxB7lNr6LbIC6MDSt6dCgfzgcPBsBwropzqpendfr
   pkeB0860MMnjRawJXeqbYlNSQr6tFOTxFGtlh4ROHJeLpyr4nxs4XPNWs
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="14112969"
X-IronPort-AV: E=Sophos;i="6.04,228,1695711600"; 
   d="scan'208";a="14112969"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2023 23:08:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="885661401"
X-IronPort-AV: E=Sophos;i="6.04,228,1695711600"; 
   d="scan'208";a="885661401"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 25 Nov 2023 23:08:13 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r79FS-0004vm-2t;
	Sun, 26 Nov 2023 07:08:10 +0000
Date: Sun, 26 Nov 2023 15:07:09 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_fwspec 18/41] ld.lld: error: undefined symbol:
 of_iommu_get_resv_regions
Message-ID: <202311261317.ccc6Aan6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_fwspec
head:   49c7574491cc9c8e8f21a8e8acb635b0e0bdfd61
commit: 76d215d5fde4889841fc85d21211f08fc7623380 [18/41] iommu/of: Call of_iommu_get_resv_regions() directly
config: x86_64-buildonly-randconfig-002-20231126 (https://download.01.org/0day-ci/archive/20231126/202311261317.ccc6Aan6-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231126/202311261317.ccc6Aan6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311261317.ccc6Aan6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: of_iommu_get_resv_regions
   >>> referenced by dma-iommu.c
   >>>               drivers/iommu/dma-iommu.o:(iommu_dma_get_resv_regions) in archive vmlinux.a
   >>> referenced by virtio-iommu.c
   >>>               drivers/iommu/virtio-iommu.o:(viommu_get_resv_regions) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
