Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB4A4A3C;
	Thu,  1 May 2025 04:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746074932; cv=none; b=FtdvJw9u3/x9VnQI4FY1kxP5t0U9g/BZydXOGWznIiH+OUlim7XFD/5FIO+4G7g2Ik/P6SNJnROqAQtFpnftMzdn2krwrH5rR1yiP8ZXdT1GLq0eMIan8llsBvAZB4bm/7E2clOziA1Birrn1hW7p6uA7Y7/JuyZkDF5iXqXyyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746074932; c=relaxed/simple;
	bh=5+aFCGN9TB7JY5KX5yGLtqrOMpZk6lqFKaV399kXqus=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AS/yxl/UAg9HJDod5ynI+Nzje7BJbjejcgLntZSl/B3sS0hjRSPjIdMWW6ZMN85pZCQdhVisuFfU2U1nLlUvQG+LlF773ZZvc2H++DdquztPy0DVALfoRle7KFbdvqGuWJghaGFKIqn0NR4SSTrJB/CB+22cZyfNlCJDJZTNFDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j+K+Lk5P; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j+K+Lk5P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746074930; x=1777610930;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5+aFCGN9TB7JY5KX5yGLtqrOMpZk6lqFKaV399kXqus=;
  b=j+K+Lk5PKzogCbHjVKlYAJ4MnkoQ5WPKulXiJkSdiwS9THsi2qWRoZIB
   4vLb5dS89F9j0EYrbe+8W3h6fbV72w5paGmP/TaXw78k/0382DHdt5O5f
   hgBSe7/Jc7+IWBcj68SyPGKDAQeg/phygZd5fHH2MOCimXq70dOvBVhoA
   a28TlZQyC1mC2+ZIfkz82p++J5JM0waLk6Re5kw17obi+fEEue/CZScQT
   tqZVoIsRKsAy69sEgB26H15hVBqYeeq86p62dG2oRIGRQ46jDNJ3noXU2
   +0bClvZiIn8xPckGmuKtaBB57Nu0jGv/sW08Ill7RUodV/UQ6C/3+67Ta
   A==;
X-CSE-ConnectionGUID: c0JA6lpsRtGLcsWEdLdBwA==
X-CSE-MsgGUID: viXhHATiRlO/4q6l3JE2+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="58737848"
X-IronPort-AV: E=Sophos;i="6.15,253,1739865600"; 
   d="scan'208";a="58737848"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 21:48:49 -0700
X-CSE-ConnectionGUID: F/01aXNnSl2NiGAbAKVA6Q==
X-CSE-MsgGUID: MkSyn08WTiqDjsJLTtKZSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,253,1739865600"; 
   d="scan'208";a="171538080"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 30 Apr 2025 21:48:48 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uALqn-0003yF-07;
	Thu, 01 May 2025 04:48:45 +0000
Date: Thu, 1 May 2025 12:47:45 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 13/21]
 drivers/net/ethernet/airoha/airoha_npu.c:430:65: error: expected ';' after
 expression
Message-ID: <202505011210.wdGfu0Ii-lkp@intel.com>
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
commit: 187439642c68be0ad8084f0156064c4fa443225c [13/21] net: Use of_reserved_mem_region_to_resource{_byname}() for "memory-region"
config: i386-buildonly-randconfig-003-20250501 (https://download.01.org/0day-ci/archive/20250501/202505011210.wdGfu0Ii-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250501/202505011210.wdGfu0Ii-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505011210.wdGfu0Ii-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/airoha/airoha_npu.c:430:65: error: expected ';' after expression
     430 |         err = of_reserved_mem_region_to_resource(dev->of_node, 0, &res)
         |                                                                        ^
         |                                                                        ;
>> drivers/net/ethernet/airoha/airoha_npu.c:465:43: error: use of undeclared identifier 'rmem'
     465 |         err = airoha_npu_run_firmware(dev, base, rmem);
         |                                                  ^
   2 errors generated.


vim +430 drivers/net/ethernet/airoha/airoha_npu.c

   403	
   404	static int airoha_npu_probe(struct platform_device *pdev)
   405	{
   406		struct device *dev = &pdev->dev;
   407		struct airoha_npu *npu;
   408		struct resource res;
   409		void __iomem *base;
   410		int i, irq, err;
   411	
   412		base = devm_platform_ioremap_resource(pdev, 0);
   413		if (IS_ERR(base))
   414			return PTR_ERR(base);
   415	
   416		npu = devm_kzalloc(dev, sizeof(*npu), GFP_KERNEL);
   417		if (!npu)
   418			return -ENOMEM;
   419	
   420		npu->dev = dev;
   421		npu->ops.ppe_init = airoha_npu_ppe_init;
   422		npu->ops.ppe_deinit = airoha_npu_ppe_deinit;
   423		npu->ops.ppe_flush_sram_entries = airoha_npu_ppe_flush_sram_entries;
   424		npu->ops.ppe_foe_commit_entry = airoha_npu_foe_commit_entry;
   425	
   426		npu->regmap = devm_regmap_init_mmio(dev, base, &regmap_config);
   427		if (IS_ERR(npu->regmap))
   428			return PTR_ERR(npu->regmap);
   429	
 > 430		err = of_reserved_mem_region_to_resource(dev->of_node, 0, &res)
   431		if (err)
   432			return err;
   433	
   434		irq = platform_get_irq(pdev, 0);
   435		if (irq < 0)
   436			return irq;
   437	
   438		err = devm_request_irq(dev, irq, airoha_npu_mbox_handler,
   439				       IRQF_SHARED, "airoha-npu-mbox", npu);
   440		if (err)
   441			return err;
   442	
   443		for (i = 0; i < ARRAY_SIZE(npu->cores); i++) {
   444			struct airoha_npu_core *core = &npu->cores[i];
   445	
   446			spin_lock_init(&core->lock);
   447			core->npu = npu;
   448	
   449			irq = platform_get_irq(pdev, i + 1);
   450			if (irq < 0)
   451				return irq;
   452	
   453			err = devm_request_irq(dev, irq, airoha_npu_wdt_handler,
   454					       IRQF_SHARED, "airoha-npu-wdt", core);
   455			if (err)
   456				return err;
   457	
   458			INIT_WORK(&core->wdt_work, airoha_npu_wdt_work);
   459		}
   460	
   461		err = dma_set_coherent_mask(dev, DMA_BIT_MASK(32));
   462		if (err)
   463			return err;
   464	
 > 465		err = airoha_npu_run_firmware(dev, base, rmem);
   466		if (err)
   467			return dev_err_probe(dev, err, "failed to run npu firmware\n");
   468	
   469		regmap_write(npu->regmap, REG_CR_NPU_MIB(10),
   470			     res.start + NPU_EN7581_FIRMWARE_RV32_MAX_SIZE);
   471		regmap_write(npu->regmap, REG_CR_NPU_MIB(11), 0x40000); /* SRAM 256K */
   472		regmap_write(npu->regmap, REG_CR_NPU_MIB(12), 0);
   473		regmap_write(npu->regmap, REG_CR_NPU_MIB(21), 1);
   474		msleep(100);
   475	
   476		/* setting booting address */
   477		for (i = 0; i < NPU_NUM_CORES; i++)
   478			regmap_write(npu->regmap, REG_CR_BOOT_BASE(i), res.start);
   479		usleep_range(1000, 2000);
   480	
   481		/* enable NPU cores */
   482		/* do not start core3 since it is used for WiFi offloading */
   483		regmap_write(npu->regmap, REG_CR_BOOT_CONFIG, 0xf7);
   484		regmap_write(npu->regmap, REG_CR_BOOT_TRIGGER, 0x1);
   485		msleep(100);
   486	
   487		platform_set_drvdata(pdev, npu);
   488	
   489		return 0;
   490	}
   491	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
