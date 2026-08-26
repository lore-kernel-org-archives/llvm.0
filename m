Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEDA3B1B3;
	Wed, 26 Aug 2026 00:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787704001; cv=none; b=geRiHLrICULt94VYFde74E0lzJhB9w4TR0Us/ZuCEY3fzxkY8QTaKPTLHAIOSDn2iLUrb8EZ86rLYbj4vflB5/5/fvqmiIjrw4FdI5Lb/aT9Y75Ji/xKeWT86LsdHkpRM5dCaO9Debuuv+wmaJCOxAhAcW+bi/AZ8rYrwaZkJvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787704001; c=relaxed/simple;
	bh=VmkZKO6G4uXvWJqeWlDh2L9nscTXtqv4u5I6weDsYdA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=n5JPOhWFMD23Ho1Kr4ujg1yVfcZ9AjNcZbhMpabFXPw1KCdavpynnY/xxn+Dt1/UJgcN6ngDhZ9RdlCv4b+0CFXY2S43pR4qBw7vPKq4uGOSxWx9CNqRGw+vzy2wswnBhcXps0RJ86zBfK4NlKf52sUJi8vVZI3r7A8o7C+GU/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MC6gqwG+; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MC6gqwG+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787703999; x=1819239999;
  h=date:from:to:cc:subject:message-id;
  bh=VmkZKO6G4uXvWJqeWlDh2L9nscTXtqv4u5I6weDsYdA=;
  b=MC6gqwG+AMqkAGs8FuHdNmikGVaPkiklXODTrbvna33sjkaWlmAGdiMO
   VJa5HdzHYJxJL9bIU02KA61B/kX5Oh1UeDeYoZUD74M7DT4TeYmLlNejz
   vk4iZ2/H2fLkpCipYPsio/h1o3XCNqhZTh2l1aEMZ3LmmwXOTvSp4zZnt
   RGZ6kr3NhBAukk+eBpF1B6JQ6cbwY0bH4b1AAhTZ4XhmyRoZbHrfmExcA
   h4QO0O5Swd8b/7fmgJ2kXVnKt4Pt+yvrXMaiUgxj7ROIx7Dnqr6XCOGJK
   aiEmu+wQWSWv9shji4x3kS3nCAIQQoYa52Wycckqw+t9e9Zq0shywQMSu
   w==;
X-CSE-ConnectionGUID: zyqpH3owTo+gHr/Sm1/jkQ==
X-CSE-MsgGUID: HEtIGgVZSSmEd+tOIjEmNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="99704139"
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; 
   d="scan'208";a="99704139"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 17:26:38 -0700
X-CSE-ConnectionGUID: jWvj5mVbTjKngKRa7MJgrw==
X-CSE-MsgGUID: AJ2YnYwWSJKSXwmKMlO6IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; 
   d="scan'208";a="264815672"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 25 Aug 2026 17:26:37 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wz1TO-000000006e1-2DCe;
	Wed, 26 Aug 2026 00:26:34 +0000
Date: Wed, 26 Aug 2026 08:26:19 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/020-dart 4/20]
 drivers/iommu/apple-dart.c:851:40: warning: shift count >= width of type
Message-ID: <202608260806.OK7fHjwY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/020-dart
head:   45b2aa771c5241177bad6c3f1777bb34871aa5ef
commit: 679ee8da9f5f0497de57348d1c60a8a856f411b2 [4/20] iommu: apple-dart: Support specifying the DMA aperture in the DT
config: i386-buildonly-randconfig-001-20260826 (https://download.01.org/0day-ci/archive/20260826/202608260806.OK7fHjwY-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260826/202608260806.OK7fHjwY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608260806.OK7fHjwY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/apple-dart.c:851:40: warning: shift count >= width of type [-Wshift-count-overflow]
     851 |                 dma_min = ((dma_addr_t)args->args[1] << 32) | args->args[2];
         |                                                      ^  ~~
   drivers/iommu/apple-dart.c:852:48: warning: shift count >= width of type [-Wshift-count-overflow]
     852 |                 dma_addr_t size = ((dma_addr_t)args->args[3] << 32) | args->args[4];
         |                                                              ^  ~~
   2 warnings generated.


vim +851 drivers/iommu/apple-dart.c

   831	
   832	static int apple_dart_of_xlate(struct device *dev,
   833				       const struct of_phandle_args *args)
   834	{
   835		struct apple_dart_master_cfg *cfg = dev_iommu_priv_get(dev);
   836		struct platform_device *iommu_pdev = of_find_device_by_node(args->np);
   837		struct apple_dart *dart = platform_get_drvdata(iommu_pdev);
   838		struct apple_dart *cfg_dart;
   839		dma_addr_t dma_max = DMA_BIT_MASK(dart->ias);
   840		dma_addr_t dma_min = 0;
   841		int i, sid;
   842	
   843		put_device(&iommu_pdev->dev);
   844	
   845		if (args->args_count != 1 && args->args_count != 5)
   846			return -EINVAL;
   847	
   848		sid = args->args[0];
   849	
   850		if (args->args_count == 5) {
 > 851			dma_min = ((dma_addr_t)args->args[1] << 32) | args->args[2];
   852			dma_addr_t size = ((dma_addr_t)args->args[3] << 32) | args->args[4];
   853			if (!(IS_ALIGNED(dma_min, dart->pgsize) || !IS_ALIGNED(size, dart->pgsize))) {
   854				dev_err(dev, "Unaligned DMA window %pad..%pad for page size 0x%x\n",
   855					&dma_min, &size, dart->pgsize);
   856				return -EINVAL;
   857			}
   858			dma_max = dma_min + size - 1;
   859			/*
   860			 * Ensure that the DMA window does not exceed the dart's ias.
   861			 */
   862			if ((dma_min ^ dma_max) & ~DMA_BIT_MASK(dart->ias)) {
   863				dev_err(dev, "Invalid DMA window for ias=%d\n",
   864					dart->ias);
   865				return -EINVAL;
   866			}
   867		}
   868	
   869		if (!cfg) {
   870			cfg = kzalloc_obj(*cfg);
   871			if (!cfg)
   872				return -ENOMEM;
   873			/* Will be ANDed with DART capabilities */
   874			cfg->supports_bypass = true;
   875			/* Will be merged with other DARTs to the to fully overlapping range. */
   876			cfg->dma_min = dma_min;
   877			cfg->dma_max = dma_max;
   878		} else {
   879			if (dma_min >= cfg->dma_max || cfg->dma_min >= dma_max) {
   880				dev_err(dev, "non-overlapping DMA windows: %pad..%pad, "
   881					"%pad..%pad\n", &dma_min, &dma_max,
   882					&cfg->dma_min, &cfg->dma_max);
   883				return -EINVAL;
   884			}
   885			cfg->dma_min = max(dma_min, cfg->dma_min);
   886			cfg->dma_max = min(dma_max, cfg->dma_max);
   887		}
   888		dev_iommu_priv_set(dev, cfg);
   889	
   890		cfg_dart = cfg->stream_maps[0].dart;
   891		if (cfg_dart) {
   892			if (cfg_dart->pgsize != dart->pgsize)
   893				return -EINVAL;
   894			if (cfg_dart->ias != dart->ias)
   895				return -EINVAL;
   896		}
   897	
   898		cfg->supports_bypass &= dart->supports_bypass;
   899	
   900		for (i = 0; i < MAX_DARTS_PER_DEVICE; ++i) {
   901			if (cfg->stream_maps[i].dart == dart) {
   902				set_bit(sid, cfg->stream_maps[i].sidmap);
   903				return 0;
   904			}
   905		}
   906		for (i = 0; i < MAX_DARTS_PER_DEVICE; ++i) {
   907			if (!cfg->stream_maps[i].dart) {
   908				cfg->stream_maps[i].dart = dart;
   909				set_bit(sid, cfg->stream_maps[i].sidmap);
   910				return 0;
   911			}
   912		}
   913	
   914		return -EINVAL;
   915	}
   916	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
