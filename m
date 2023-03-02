Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3AE10780;
	Thu,  2 Mar 2023 23:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677800628; x=1709336628;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=us6D/P+l0sDMAJV0FVuYZNVAUzD8CTCHpv2ArKcDLvA=;
  b=gXvEOhASOucGzSgXSa2TG7/lWhHuW3Lpqvl70G1/f/qO9+/6hcQB3SdS
   dfEIKShfU3xKILNo6ghjjbX2vZmXzkULMCwZemjAfIbAlFLZ2RokYcNj6
   E4lRQ5MfteNjTpLwlANG64cAzwYZ2iAo4AsGIKUt7BlXyy3PZw2OhHMAG
   qf0BhIBorjypUMLnd5ye6bf6NMnjCBCYsQYtisk04TcIQxrib2QD6/wID
   m0bFczOti24HiRwv0sk02ecKFz8s/XJTgl8j6cbwWM+2Vb8JN8L6875eg
   hcJImind5U2AeTm6wsjmYvQjDcbgjwCycFajE9zpDz1kDVdWtaYWErh5P
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="362484742"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; 
   d="scan'208";a="362484742"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2023 15:43:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="707600003"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; 
   d="scan'208";a="707600003"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 02 Mar 2023 15:43:41 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXsaK-0000za-0w;
	Thu, 02 Mar 2023 23:43:40 +0000
Date: Fri, 3 Mar 2023 07:43:38 +0800
From: kernel test robot <lkp@intel.com>
To: Georgi Djakov <djakov@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [djakov-icc:iommu-map 2/2] drivers/iommu/dma-iommu.c:1544:33:
 warning: unused variable 'iommu_dma_ops'
Message-ID: <202303030711.Z6MMVJgs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djakov/icc.git iommu-map
head:   e2620c92a19b9e64162ce85e924a6adc5af285e2
commit: e2620c92a19b9e64162ce85e924a6adc5af285e2 [2/2] dma-mapping: Replace indirect functions calls to improve performance
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20230303/202303030711.Z6MMVJgs-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/djakov/icc.git/commit/?id=e2620c92a19b9e64162ce85e924a6adc5af285e2
        git remote add djakov-icc https://git.kernel.org/pub/scm/linux/kernel/git/djakov/icc.git
        git fetch --no-tags djakov-icc iommu-map
        git checkout e2620c92a19b9e64162ce85e924a6adc5af285e2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/iommu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303030711.Z6MMVJgs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/dma-iommu.c:1544:33: warning: unused variable 'iommu_dma_ops' [-Wunused-const-variable]
   static const struct dma_map_ops iommu_dma_ops = {
                                   ^
   1 warning generated.


vim +/iommu_dma_ops +1544 drivers/iommu/dma-iommu.c

6d9870b7e5def24 John Garry        2022-07-14  1543  
06d60728ff5c017 Christoph Hellwig 2019-05-20 @1544  static const struct dma_map_ops iommu_dma_ops = {
30280eee2db10ed Logan Gunthorpe   2022-07-08  1545  	.flags			= DMA_F_PCI_P2PDMA_SUPPORTED,
06d60728ff5c017 Christoph Hellwig 2019-05-20  1546  	.alloc			= iommu_dma_alloc,
06d60728ff5c017 Christoph Hellwig 2019-05-20  1547  	.free			= iommu_dma_free,
efa70f2fdc842e6 Christoph Hellwig 2020-09-01  1548  	.alloc_pages		= dma_common_alloc_pages,
efa70f2fdc842e6 Christoph Hellwig 2020-09-01  1549  	.free_pages		= dma_common_free_pages,
e817ee5f2f95ca5 Christoph Hellwig 2021-01-28  1550  	.alloc_noncontiguous	= iommu_dma_alloc_noncontiguous,
e817ee5f2f95ca5 Christoph Hellwig 2021-01-28  1551  	.free_noncontiguous	= iommu_dma_free_noncontiguous,
06d60728ff5c017 Christoph Hellwig 2019-05-20  1552  	.mmap			= iommu_dma_mmap,
06d60728ff5c017 Christoph Hellwig 2019-05-20  1553  	.get_sgtable		= iommu_dma_get_sgtable,
06d60728ff5c017 Christoph Hellwig 2019-05-20  1554  	.map_page		= iommu_dma_map_page,
06d60728ff5c017 Christoph Hellwig 2019-05-20  1555  	.unmap_page		= iommu_dma_unmap_page,
06d60728ff5c017 Christoph Hellwig 2019-05-20  1556  	.map_sg			= iommu_dma_map_sg,
06d60728ff5c017 Christoph Hellwig 2019-05-20  1557  	.unmap_sg		= iommu_dma_unmap_sg,
06d60728ff5c017 Christoph Hellwig 2019-05-20  1558  	.sync_single_for_cpu	= iommu_dma_sync_single_for_cpu,
06d60728ff5c017 Christoph Hellwig 2019-05-20  1559  	.sync_single_for_device	= iommu_dma_sync_single_for_device,
06d60728ff5c017 Christoph Hellwig 2019-05-20  1560  	.sync_sg_for_cpu	= iommu_dma_sync_sg_for_cpu,
06d60728ff5c017 Christoph Hellwig 2019-05-20  1561  	.sync_sg_for_device	= iommu_dma_sync_sg_for_device,
06d60728ff5c017 Christoph Hellwig 2019-05-20  1562  	.map_resource		= iommu_dma_map_resource,
06d60728ff5c017 Christoph Hellwig 2019-05-20  1563  	.unmap_resource		= iommu_dma_unmap_resource,
158a6d3ce3bcfcd Yoshihiro Shimoda 2019-08-28  1564  	.get_merge_boundary	= iommu_dma_get_merge_boundary,
6d9870b7e5def24 John Garry        2022-07-14  1565  	.opt_mapping_size	= iommu_dma_opt_mapping_size,
06d60728ff5c017 Christoph Hellwig 2019-05-20  1566  };
06d60728ff5c017 Christoph Hellwig 2019-05-20  1567  

:::::: The code at line 1544 was first introduced by commit
:::::: 06d60728ff5c01795ac0bad66a5c42e3e78dcb6b iommu/dma: move the arm64 wrappers to common code

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
