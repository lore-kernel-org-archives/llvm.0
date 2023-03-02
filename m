Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0285BEC4;
	Thu,  2 Mar 2023 03:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677726468; x=1709262468;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mi8EyxOleUBYQsh39IBQExGcDalTazRk8aIJNk+jABs=;
  b=MDsWYeHuw+/llaE6f4g6NOMxIaHh1NlbOMlDj72ae5cu8EqKhDobbT+g
   8N8FV9buqnr6mzgdwhq5GzKjOQFLmlIuOQ4OZKAfQCJx3/JV+YDq7E6pv
   r55Nu+m85AV5kWiaFA78yZpAaQ5274w8VwGoF7HZkMf05Zk2CbXT8Avou
   xJWtRh9N6NWc9PFLGTjBquaWmCrgfDNcCelzUUs/7YLz8v23TAhXN/ffi
   5ll6P7z0tXfMiLNg+pLWasTk8uS5IptYV007sprgZPn37LBpxfffbvoFj
   xholnLv/6VI4ipZ2KDReufmf2K7m6PsYLO6e2uPO3hnHCnXEbHP5r60dD
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="336098999"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="336098999"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 19:07:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="1003934648"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="1003934648"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 01 Mar 2023 19:06:58 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXZHV-000082-0g;
	Thu, 02 Mar 2023 03:06:57 +0000
Date: Thu, 2 Mar 2023 11:06:50 +0800
From: kernel test robot <lkp@intel.com>
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	0day robot <lkp@intel.com>, Dave Jiang <dave.jiang@intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: drivers/gpu/drm/exynos/exynos_drm_dma.c:54:35: warning: implicit
 conversion from 'unsigned long long' to 'unsigned int' changes value from
 18446744073709551615 to 4294967295
Message-ID: <202303021035.rmJBGqQ4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel-lab-lkp/linux/commits/Jacob-Pan/iommu-vt-d-Implement-set-device-pasid-op-for-default-domain/20230302-085748
head:   c74778cec2a6f8e221346b6f52df8d28edbe875c
commit: eb22c2f3d7656d7579d8ae82fda767e6baa6105c iommu/ioasid: Rename INVALID_IOASID
date:   2 hours ago
config: powerpc-buildonly-randconfig-r002-20230302 (https://download.01.org/0day-ci/archive/20230302/202303021035.rmJBGqQ4-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/eb22c2f3d7656d7579d8ae82fda767e6baa6105c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jacob-Pan/iommu-vt-d-Implement-set-device-pasid-op-for-default-domain/20230302-085748
        git checkout eb22c2f3d7656d7579d8ae82fda767e6baa6105c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/gpu/drm/exynos/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303021035.rmJBGqQ4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/exynos/exynos_drm_dma.c:8:
   include/linux/iommu.h:196:20: error: redefinition of 'pasid_valid'
   static inline bool pasid_valid(ioasid_t ioasid)
                      ^
   include/linux/ioasid.h:74:20: note: previous definition is here
   static inline bool pasid_valid(ioasid_t ioasid)
                      ^
>> drivers/gpu/drm/exynos/exynos_drm_dma.c:54:35: warning: implicit conversion from 'unsigned long long' to 'unsigned int' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
           dma_set_max_seg_size(subdrv_dev, DMA_BIT_MASK(32));
           ~~~~~~~~~~~~~~~~~~~~             ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:76:40: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                          ^~~~~
   1 warning and 1 error generated.


vim +54 drivers/gpu/drm/exynos/exynos_drm_dma.c

67fbf3a3ef8443 Andrzej Hajda    2018-10-12  32  
67fbf3a3ef8443 Andrzej Hajda    2018-10-12  33  /*
67fbf3a3ef8443 Andrzej Hajda    2018-10-12  34   * drm_iommu_attach_device- attach device to iommu mapping
67fbf3a3ef8443 Andrzej Hajda    2018-10-12  35   *
67fbf3a3ef8443 Andrzej Hajda    2018-10-12  36   * @drm_dev: DRM device
67fbf3a3ef8443 Andrzej Hajda    2018-10-12  37   * @subdrv_dev: device to be attach
67fbf3a3ef8443 Andrzej Hajda    2018-10-12  38   *
67fbf3a3ef8443 Andrzej Hajda    2018-10-12  39   * This function should be called by sub drivers to attach it to iommu
67fbf3a3ef8443 Andrzej Hajda    2018-10-12  40   * mapping.
67fbf3a3ef8443 Andrzej Hajda    2018-10-12  41   */
67fbf3a3ef8443 Andrzej Hajda    2018-10-12  42  static int drm_iommu_attach_device(struct drm_device *drm_dev,
07dc3678bacc2a Marek Szyprowski 2020-03-09  43  				struct device *subdrv_dev, void **dma_priv)
67fbf3a3ef8443 Andrzej Hajda    2018-10-12  44  {
67fbf3a3ef8443 Andrzej Hajda    2018-10-12  45  	struct exynos_drm_private *priv = drm_dev->dev_private;
b9c633882de460 Marek Szyprowski 2020-06-01  46  	int ret = 0;
67fbf3a3ef8443 Andrzej Hajda    2018-10-12  47  
67fbf3a3ef8443 Andrzej Hajda    2018-10-12  48  	if (get_dma_ops(priv->dma_dev) != get_dma_ops(subdrv_dev)) {
6f83d20838c099 Inki Dae         2019-04-15  49  		DRM_DEV_ERROR(subdrv_dev, "Device %s lacks support for IOMMU\n",
67fbf3a3ef8443 Andrzej Hajda    2018-10-12  50  			  dev_name(subdrv_dev));
67fbf3a3ef8443 Andrzej Hajda    2018-10-12  51  		return -EINVAL;
67fbf3a3ef8443 Andrzej Hajda    2018-10-12  52  	}
67fbf3a3ef8443 Andrzej Hajda    2018-10-12  53  
ddfd4ab6bb0883 Marek Szyprowski 2020-07-07 @54  	dma_set_max_seg_size(subdrv_dev, DMA_BIT_MASK(32));
67fbf3a3ef8443 Andrzej Hajda    2018-10-12  55  	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)) {
07dc3678bacc2a Marek Szyprowski 2020-03-09  56  		/*
07dc3678bacc2a Marek Szyprowski 2020-03-09  57  		 * Keep the original DMA mapping of the sub-device and
07dc3678bacc2a Marek Szyprowski 2020-03-09  58  		 * restore it on Exynos DRM detach, otherwise the DMA
07dc3678bacc2a Marek Szyprowski 2020-03-09  59  		 * framework considers it as IOMMU-less during the next
07dc3678bacc2a Marek Szyprowski 2020-03-09  60  		 * probe (in case of deferred probe or modular build)
07dc3678bacc2a Marek Szyprowski 2020-03-09  61  		 */
07dc3678bacc2a Marek Szyprowski 2020-03-09  62  		*dma_priv = to_dma_iommu_mapping(subdrv_dev);
07dc3678bacc2a Marek Szyprowski 2020-03-09  63  		if (*dma_priv)
67fbf3a3ef8443 Andrzej Hajda    2018-10-12  64  			arm_iommu_detach_device(subdrv_dev);
67fbf3a3ef8443 Andrzej Hajda    2018-10-12  65  
67fbf3a3ef8443 Andrzej Hajda    2018-10-12  66  		ret = arm_iommu_attach_device(subdrv_dev, priv->mapping);
67fbf3a3ef8443 Andrzej Hajda    2018-10-12  67  	} else if (IS_ENABLED(CONFIG_IOMMU_DMA)) {
67fbf3a3ef8443 Andrzej Hajda    2018-10-12  68  		ret = iommu_attach_device(priv->mapping, subdrv_dev);
67fbf3a3ef8443 Andrzej Hajda    2018-10-12  69  	}
67fbf3a3ef8443 Andrzej Hajda    2018-10-12  70  
b9c633882de460 Marek Szyprowski 2020-06-01  71  	return ret;
67fbf3a3ef8443 Andrzej Hajda    2018-10-12  72  }
67fbf3a3ef8443 Andrzej Hajda    2018-10-12  73  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
