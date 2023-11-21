Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2A81CF9A;
	Tue, 21 Nov 2023 07:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BM0zDAa3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700550136; x=1732086136;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pJYZ1j71i4St9wQRuF3Og2ivToBkBIotpIMkRk/1i04=;
  b=BM0zDAa3QCf6UxJdDscV1A+bg8hMNpl5hkk+bXY/ye4KNINOQlyAJDRt
   kt9fzTVG25f8bQHsFtJ5/KJXLzzibT5f5S8TUMrXBJO155IyCu+qxvQki
   vBdCgPhTgkCr/puCehcec+TNPxSnZ9C/GiV+l458Gih6yQO7i5fmAIg25
   parZ2e2d1A8o3bRc3PtmnzLff0Nk9AFgO7NHAH9jKt20CLgiH6uB9agi0
   97RQgF3kVtL0bNoZd5f1UBysIB6zBfdVbrcKiXrYOHfcY6DKvbWGtRixE
   cpn56suYGh6RTbaeeT0Cm3v8aBLIMtGO/I3wyDvtWzjZZNz3GAWYrQxBw
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="371951483"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="371951483"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 23:02:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="7803212"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 20 Nov 2023 23:02:12 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5Klg-0007TJ-1E;
	Tue, 21 Nov 2023 07:01:59 +0000
Date: Tue, 21 Nov 2023 15:00:43 +0800
From: kernel test robot <lkp@intel.com>
To: Inki Dae <inki.dae@samsung.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [daeinki-drm-exynos:exynos-drm-fixes 2/2]
 drivers/gpu/drm/exynos/exynos_drm_dma.c:119:19: warning: incompatible
 integer to pointer conversion passing 'int' to parameter of type 'const void
 *'
Message-ID: <202311211403.ZKszRGRN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org:/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-fixes
head:   a30ba4bd7cdb5726d86a557c5df8df71c7bc7fad
commit: 9f6ed6faadde040e556880ade6881b3ad92861a3 [2/2] drm/exynos: fix a wrong error checking
config: arm-defconfig (https://download.01.org/0day-ci/archive/20231121/202311211403.ZKszRGRN-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231121/202311211403.ZKszRGRN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311211403.ZKszRGRN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/exynos/exynos_drm_dma.c:119:19: warning: incompatible integer to pointer conversion passing 'int' to parameter of type 'const void *' [-Wint-conversion]
                           return PTR_ERR(-ENODEV);
                                          ^~~~~~~
   include/linux/err.h:49:61: note: passing argument to parameter 'ptr' here
   static inline long __must_check PTR_ERR(__force const void *ptr)
                                                               ^
   1 warning generated.


vim +119 drivers/gpu/drm/exynos/exynos_drm_dma.c

    94	
    95	int exynos_drm_register_dma(struct drm_device *drm, struct device *dev,
    96				    void **dma_priv)
    97	{
    98		struct exynos_drm_private *priv = drm->dev_private;
    99	
   100		if (!priv->dma_dev) {
   101			priv->dma_dev = dev;
   102			DRM_INFO("Exynos DRM: using %s device for DMA mapping operations\n",
   103				 dev_name(dev));
   104		}
   105	
   106		if (!IS_ENABLED(CONFIG_EXYNOS_IOMMU))
   107			return 0;
   108	
   109		if (!priv->mapping) {
   110			void *mapping = NULL;
   111	
   112			if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU))
   113				mapping = arm_iommu_create_mapping(&platform_bus_type,
   114					EXYNOS_DEV_ADDR_START, EXYNOS_DEV_ADDR_SIZE);
   115			else if (IS_ENABLED(CONFIG_IOMMU_DMA))
   116				mapping = iommu_get_domain_for_dev(priv->dma_dev);
   117	
   118			if (!mapping)
 > 119				return PTR_ERR(-ENODEV);
   120			priv->mapping = mapping;
   121		}
   122	
   123		return drm_iommu_attach_device(drm, dev, dma_priv);
   124	}
   125	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
