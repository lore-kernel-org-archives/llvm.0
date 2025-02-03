Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB79F1CA9C;
	Mon,  3 Feb 2025 04:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738556612; cv=none; b=er7dHCuS4kb4yaLKE+j31xXh8j9oRbE8O+hEgmQVYJNhJ8+FfWPom2RguDsNWP4lNTZaahtgwH8KiCsoyvLmw24013KjWY+NFHYj27+8471TGA+fGKrEIUiR1yzE81Ka8X2NnS4Zpu5STJUr6ppgaVCuFb5dvI9kCAemuzW1aBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738556612; c=relaxed/simple;
	bh=INR7liZmUg0UteWYRNv6KLbui39k810bZpBXp/3fSAg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sClQcQEDpYRqxiPmSXesGRqVr8Qpg2h/ZzBPM2/Db8K0RppMRNsKiHuEpCxDmL7e9j/AoqOXOrD/n8WCeMUQ9BZ9C4gE7uPNWsd8eHhTcXUyIozyb32KNVIt6j3Pq+mEVGWf5JChUhvyorMe+tb5imadjUtg8guJLdBYd6v3r8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UJjoID3X; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UJjoID3X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738556609; x=1770092609;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=INR7liZmUg0UteWYRNv6KLbui39k810bZpBXp/3fSAg=;
  b=UJjoID3XBsyAjLT4IMGKTtpv9CmGOy2yt9BP2sDX6HAWcyvrxY+jG2N5
   fratSQH2P2bB+Zj+eUcrtXENgXjNsxms84yZ3nIamCcKZPYPIIVvwx+zX
   WptEp2CNmYZt8teyN1WvwkV3p4s/x/MKgrd4QQczaOLRw7uF60NlgB0ny
   K3dfu5MMMDXVFk4qGVZi5YpGsDUJMhmcIeIQs31KzRH/wEuL2Xhcmg6Js
   9/niCX0r1uzYl9vULdj4n5aegVJcM3rQVGHthF+OypL7SCZQFhpDdrhD9
   HRHFFfFO3lCPpO3L9ZODlfOnwOxMP/vxjjXXzdaZRbe5gNuKedyN1uPjY
   A==;
X-CSE-ConnectionGUID: 1oWKDYpwSEOYEqDwYNjkOg==
X-CSE-MsgGUID: QEKwtBeKTNGDuof7712S9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39139843"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="39139843"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2025 20:23:29 -0800
X-CSE-ConnectionGUID: ArjAWVncQo+xyfWCRyEPIg==
X-CSE-MsgGUID: 3smekIz/S6Km5myX8gaRvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="141054009"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 02 Feb 2025 20:23:27 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tenzY-000qU3-2d;
	Mon, 03 Feb 2025 04:23:24 +0000
Date: Mon, 3 Feb 2025 12:22:50 +0800
From: kernel test robot <lkp@intel.com>
To: David Lechner <dlechner@baylibre.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Nuno Sa <nuno.sa@analog.com>
Subject: [broonie-ci:v7_20250113_dlechner_spi_axi_spi_engine_add_offload_support
 7/7] drivers/spi/spi-axi-spi-engine.c:981:4: error: call to undeclared
 function 'FIELD_GET'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202502031224.wvHipe06-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v7_20250113_dlechner_spi_axi_spi_engine_add_offload_support
head:   72369b14a80d69f90a9541b4f416e8736e8636f8
commit: 72369b14a80d69f90a9541b4f416e8736e8636f8 [7/7] spi: axi-spi-engine: implement offload support
config: i386-buildonly-randconfig-003-20250203 (https://download.01.org/0day-ci/archive/20250203/202502031224.wvHipe06-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250203/202502031224.wvHipe06-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502031224.wvHipe06-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/spi/spi-axi-spi-engine.c:981:4: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     981 |                         FIELD_GET(SPI_ENGINE_SPI_OFFLOAD_MEM_WIDTH_CMD, sizes);
         |                         ^
   1 error generated.


vim +/FIELD_GET +981 drivers/spi/spi-axi-spi-engine.c

   894	
   895	static int spi_engine_probe(struct platform_device *pdev)
   896	{
   897		struct spi_engine *spi_engine;
   898		struct spi_controller *host;
   899		unsigned int version;
   900		int irq, ret;
   901	
   902		irq = platform_get_irq(pdev, 0);
   903		if (irq < 0)
   904			return irq;
   905	
   906		host = devm_spi_alloc_host(&pdev->dev, sizeof(*spi_engine));
   907		if (!host)
   908			return -ENOMEM;
   909	
   910		spi_engine = spi_controller_get_devdata(host);
   911	
   912		spin_lock_init(&spi_engine->lock);
   913		init_completion(&spi_engine->msg_complete);
   914	
   915		/*
   916		 * REVISIT: for now, all SPI Engines only have one offload. In the
   917		 * future, this should be read from a memory mapped register to
   918		 * determine the number of offloads enabled at HDL compile time. For
   919		 * now, we can tell if an offload is present if there is a trigger
   920		 * source wired up to it.
   921		 */
   922		if (device_property_present(&pdev->dev, "trigger-sources")) {
   923			struct spi_engine_offload *priv;
   924	
   925			spi_engine->offload =
   926				devm_spi_offload_alloc(&pdev->dev,
   927						       sizeof(struct spi_engine_offload));
   928			if (IS_ERR(spi_engine->offload))
   929				return PTR_ERR(spi_engine->offload);
   930	
   931			priv = spi_engine->offload->priv;
   932			priv->spi_engine = spi_engine;
   933			priv->offload_num = 0;
   934	
   935			spi_engine->offload->ops = &spi_engine_offload_ops;
   936			spi_engine->offload_caps = SPI_OFFLOAD_CAP_TRIGGER;
   937	
   938			if (device_property_match_string(&pdev->dev, "dma-names", "offload0-rx") >= 0) {
   939				spi_engine->offload_caps |= SPI_OFFLOAD_CAP_RX_STREAM_DMA;
   940				spi_engine->offload->xfer_flags |= SPI_OFFLOAD_XFER_RX_STREAM;
   941			}
   942	
   943			if (device_property_match_string(&pdev->dev, "dma-names", "offload0-tx") >= 0) {
   944				spi_engine->offload_caps |= SPI_OFFLOAD_CAP_TX_STREAM_DMA;
   945				spi_engine->offload->xfer_flags |= SPI_OFFLOAD_XFER_TX_STREAM;
   946			} else {
   947				/*
   948				 * HDL compile option to enable TX DMA stream also disables
   949				 * the SDO memory, so can't do both at the same time.
   950				 */
   951				spi_engine->offload_caps |= SPI_OFFLOAD_CAP_TX_STATIC_DATA;
   952			}
   953		}
   954	
   955		spi_engine->clk = devm_clk_get_enabled(&pdev->dev, "s_axi_aclk");
   956		if (IS_ERR(spi_engine->clk))
   957			return PTR_ERR(spi_engine->clk);
   958	
   959		spi_engine->ref_clk = devm_clk_get_enabled(&pdev->dev, "spi_clk");
   960		if (IS_ERR(spi_engine->ref_clk))
   961			return PTR_ERR(spi_engine->ref_clk);
   962	
   963		spi_engine->base = devm_platform_ioremap_resource(pdev, 0);
   964		if (IS_ERR(spi_engine->base))
   965			return PTR_ERR(spi_engine->base);
   966	
   967		version = readl(spi_engine->base + ADI_AXI_REG_VERSION);
   968		if (ADI_AXI_PCORE_VER_MAJOR(version) != 1) {
   969			dev_err(&pdev->dev, "Unsupported peripheral version %u.%u.%u\n",
   970				ADI_AXI_PCORE_VER_MAJOR(version),
   971				ADI_AXI_PCORE_VER_MINOR(version),
   972				ADI_AXI_PCORE_VER_PATCH(version));
   973			return -ENODEV;
   974		}
   975	
   976		if (ADI_AXI_PCORE_VER_MINOR(version) >= 1) {
   977			unsigned int sizes = readl(spi_engine->base +
   978					SPI_ENGINE_REG_OFFLOAD_MEM_ADDR_WIDTH);
   979	
   980			spi_engine->offload_ctrl_mem_size = 1 <<
 > 981				FIELD_GET(SPI_ENGINE_SPI_OFFLOAD_MEM_WIDTH_CMD, sizes);
   982			spi_engine->offload_sdo_mem_size = 1 <<
   983				FIELD_GET(SPI_ENGINE_SPI_OFFLOAD_MEM_WIDTH_SDO, sizes);
   984		} else {
   985			spi_engine->offload_ctrl_mem_size = SPI_ENGINE_OFFLOAD_CMD_FIFO_SIZE;
   986			spi_engine->offload_sdo_mem_size = SPI_ENGINE_OFFLOAD_SDO_FIFO_SIZE;
   987		}
   988	
   989		writel_relaxed(0x00, spi_engine->base + SPI_ENGINE_REG_RESET);
   990		writel_relaxed(0xff, spi_engine->base + SPI_ENGINE_REG_INT_PENDING);
   991		writel_relaxed(0x00, spi_engine->base + SPI_ENGINE_REG_INT_ENABLE);
   992	
   993		ret = devm_add_action_or_reset(&pdev->dev, spi_engine_release_hw,
   994					       spi_engine);
   995		if (ret)
   996			return ret;
   997	
   998		ret = devm_request_irq(&pdev->dev, irq, spi_engine_irq, 0, pdev->name,
   999				       host);
  1000		if (ret)
  1001			return ret;
  1002	
  1003		host->dev.of_node = pdev->dev.of_node;
  1004		host->mode_bits = SPI_CPOL | SPI_CPHA | SPI_3WIRE;
  1005		host->bits_per_word_mask = SPI_BPW_RANGE_MASK(1, 32);
  1006		host->max_speed_hz = clk_get_rate(spi_engine->ref_clk) / 2;
  1007		host->transfer_one_message = spi_engine_transfer_one_message;
  1008		host->optimize_message = spi_engine_optimize_message;
  1009		host->unoptimize_message = spi_engine_unoptimize_message;
  1010		host->get_offload = spi_engine_get_offload;
  1011		host->put_offload = spi_engine_put_offload;
  1012		host->num_chipselect = 8;
  1013	
  1014		/* Some features depend of the IP core version. */
  1015		if (ADI_AXI_PCORE_VER_MAJOR(version) >= 1) {
  1016			if (ADI_AXI_PCORE_VER_MINOR(version) >= 2) {
  1017				host->mode_bits |= SPI_CS_HIGH;
  1018				host->setup = spi_engine_setup;
  1019			}
  1020			if (ADI_AXI_PCORE_VER_MINOR(version) >= 3)
  1021				host->mode_bits |= SPI_MOSI_IDLE_LOW | SPI_MOSI_IDLE_HIGH;
  1022		}
  1023	
  1024		if (host->max_speed_hz == 0)
  1025			return dev_err_probe(&pdev->dev, -EINVAL, "spi_clk rate is 0");
  1026	
  1027		return devm_spi_register_controller(&pdev->dev, host);
  1028	}
  1029	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
