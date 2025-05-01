Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2ACFC2ED;
	Thu,  1 May 2025 01:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746062273; cv=none; b=X0KX4P03xHHXO4M5E7Uxrinlz5IagAhv2b//GQpQMOICLKjQspcaueQltMqB0sqkzRuMnh3+2QNo7PFqFTA7jJFsqQs+IyF3re/MMVabJdVi0fx33OKl+7HRoX2ED9tPRi6AGqKSAGT82SgXiCF3OjjpVtpFiZ/WM6Mzv/wy4XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746062273; c=relaxed/simple;
	bh=taJJhelh08weuP+5uKJFnU5FDSSKTnAEkdxA0B/R8uA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e2o16ls2NxbxT5XjYzbMc7l4tqSYg7oDo7CDKxmWvOYWNFbTdnHDY3h/aA9MljO3MrkQK8MIZLsWpXq41oqwGNRJ/tcUSA45sOYNARdB9iu+hEAzPZh6yVXfwHwiDpe3wcp0qHzqpdspOfxJCys6Xt8DJa9MfmTb/RamJccNJ9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F6yXHU66; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F6yXHU66"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746062271; x=1777598271;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=taJJhelh08weuP+5uKJFnU5FDSSKTnAEkdxA0B/R8uA=;
  b=F6yXHU66eP8kXHHiR9rA3W3q94Fr1sV8umCeepqMdJI+rLAe3v9yVBe4
   PJXmOSnPLkRf7S0b5iODxT1uFAM/wpK5eAMcCMsFD/Zm747nqRsm7pNWz
   lZQpgMtmnGuseAqEliMs2UwceK2RiraB0E8cgg1VOkunKNt2tZifVc9MV
   yqlkCHKG3tFcDNqGtI6Oms51MGIM5fQTuigMdQzCfD/ON1lAMG2XyD2Bz
   XgNT9e3yM91upCTjKlUKVwerQSngWr0nCbbbSRxWxCKSabFt7F/FQ01P/
   rP+IVy+i3m3yIsgpVz2Q3bvqHyIrej7SLmBMr5wsLhCC5Wo1syOC2ffvS
   Q==;
X-CSE-ConnectionGUID: CpX8truhTXyF6Zt+hkZZ4w==
X-CSE-MsgGUID: MopbfzgVTrSZVLIitEeMGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="47649937"
X-IronPort-AV: E=Sophos;i="6.15,253,1739865600"; 
   d="scan'208";a="47649937"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 18:17:50 -0700
X-CSE-ConnectionGUID: RvRSmK6QSlqbg7js984fGw==
X-CSE-MsgGUID: XbT3VfqoTjitnePNWzX4Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,253,1739865600"; 
   d="scan'208";a="134019502"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 30 Apr 2025 18:17:49 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAIYc-0003sb-0d;
	Thu, 01 May 2025 01:17:46 +0000
Date: Thu, 1 May 2025 09:17:16 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 21/21] drivers/spi/spi-stm32-ospi.c:828:60:
 error: incompatible pointer types passing 'struct resource **' to parameter
 of type 'struct resource *'; remove &
Message-ID: <202505010952.VuIgscLk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   3474fc53f28d0824c7020ddffc8559e8302f7415
commit: 3474fc53f28d0824c7020ddffc8559e8302f7415 [21/21] spi: Use of_reserved_mem_region_to_resource() for "memory-region"
config: hexagon-randconfig-001-20250501 (https://download.01.org/0day-ci/archive/20250501/202505010952.VuIgscLk-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250501/202505010952.VuIgscLk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505010952.VuIgscLk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/spi/spi-stm32-ospi.c:828:60: error: incompatible pointer types passing 'struct resource **' to parameter of type 'struct resource *'; remove & [-Werror,-Wincompatible-pointer-types]
     828 |         ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
         |                                                                   ^~~~
   include/linux/of_reserved_mem.h:44:47: note: passing argument to parameter 'res' here
      44 |                                        unsigned int idx, struct resource *res);
         |                                                                           ^
>> drivers/spi/spi-stm32-ospi.c:830:33: error: incompatible pointer types passing 'struct resource **' to parameter of type 'const struct resource *'; remove & [-Werror,-Wincompatible-pointer-types]
     830 |                 ospi->mm_size = resource_size(&res);
         |                                               ^~~~
   include/linux/ioport.h:289:68: note: passing argument to parameter 'res' here
     289 | static inline resource_size_t resource_size(const struct resource *res)
         |                                                                    ^
   drivers/spi/spi-stm32-ospi.c:831:46: error: incompatible pointer types passing 'struct resource **' to parameter of type 'const struct resource *'; remove & [-Werror,-Wincompatible-pointer-types]
     831 |                 ospi->mm_base = devm_ioremap_resource(dev, &res);
         |                                                            ^~~~
   include/linux/device/devres.h:101:80: note: passing argument to parameter 'res' here
     101 | void __iomem *devm_ioremap_resource(struct device *dev, const struct resource *res);
         |                                                                                ^
   drivers/spi/spi-stm32-ospi.c:775:23: warning: unused variable 'rmem' [-Wunused-variable]
     775 |         struct reserved_mem *rmem = NULL;
         |                              ^~~~
   drivers/spi/spi-stm32-ospi.c:776:22: warning: unused variable 'node' [-Wunused-variable]
     776 |         struct device_node *node;
         |                             ^~~~
   2 warnings and 3 errors generated.


vim +828 drivers/spi/spi-stm32-ospi.c

   769	
   770	static int stm32_ospi_get_resources(struct platform_device *pdev)
   771	{
   772		struct device *dev = &pdev->dev;
   773		struct stm32_ospi *ospi = platform_get_drvdata(pdev);
   774		struct resource *res;
   775		struct reserved_mem *rmem = NULL;
   776		struct device_node *node;
   777		int ret;
   778	
   779		ospi->regs_base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
   780		if (IS_ERR(ospi->regs_base))
   781			return PTR_ERR(ospi->regs_base);
   782	
   783		ospi->regs_phys_base = res->start;
   784	
   785		ospi->clk = devm_clk_get(dev, NULL);
   786		if (IS_ERR(ospi->clk))
   787			return dev_err_probe(dev, PTR_ERR(ospi->clk),
   788					     "Can't get clock\n");
   789	
   790		ospi->clk_rate = clk_get_rate(ospi->clk);
   791		if (!ospi->clk_rate) {
   792			dev_err(dev, "Invalid clock rate\n");
   793			return -EINVAL;
   794		}
   795	
   796		ospi->irq = platform_get_irq(pdev, 0);
   797		if (ospi->irq < 0)
   798			return ospi->irq;
   799	
   800		ret = devm_request_irq(dev, ospi->irq, stm32_ospi_irq, 0,
   801				       dev_name(dev), ospi);
   802		if (ret) {
   803			dev_err(dev, "Failed to request irq\n");
   804			return ret;
   805		}
   806	
   807		ospi->rstc = devm_reset_control_array_get_optional_exclusive(dev);
   808		if (IS_ERR(ospi->rstc))
   809			return dev_err_probe(dev, PTR_ERR(ospi->rstc),
   810					     "Can't get reset\n");
   811	
   812		ospi->dma_chrx = dma_request_chan(dev, "rx");
   813		if (IS_ERR(ospi->dma_chrx)) {
   814			ret = PTR_ERR(ospi->dma_chrx);
   815			ospi->dma_chrx = NULL;
   816			if (ret == -EPROBE_DEFER)
   817				goto err_dma;
   818		}
   819	
   820		ospi->dma_chtx = dma_request_chan(dev, "tx");
   821		if (IS_ERR(ospi->dma_chtx)) {
   822			ret = PTR_ERR(ospi->dma_chtx);
   823			ospi->dma_chtx = NULL;
   824			if (ret == -EPROBE_DEFER)
   825				goto err_dma;
   826		}
   827	
 > 828		ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
   829		if (!ret) {
 > 830			ospi->mm_size = resource_size(&res);
   831			ospi->mm_base = devm_ioremap_resource(dev, &res);
   832			if (!ospi->mm_base) {
   833				dev_err(dev, "unable to map memory region: %pR\n", &res);
   834				ret = -ENOMEM;
   835				goto err_dma;
   836			}
   837	
   838			if (ospi->mm_size > STM32_OSPI_MAX_MMAP_SZ) {
   839				dev_err(dev, "Memory map size outsize bounds\n");
   840				ret = -EINVAL;
   841				goto err_dma;
   842			}
   843		} else {
   844			dev_info(dev, "No memory-map region found\n");
   845		}
   846	
   847		init_completion(&ospi->data_completion);
   848		init_completion(&ospi->match_completion);
   849	
   850		return 0;
   851	
   852	err_dma:
   853		dev_info(dev, "Can't get all resources (%d)\n", ret);
   854	
   855		if (ospi->dma_chtx)
   856			dma_release_channel(ospi->dma_chtx);
   857		if (ospi->dma_chrx)
   858			dma_release_channel(ospi->dma_chrx);
   859	
   860		return ret;
   861	};
   862	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
