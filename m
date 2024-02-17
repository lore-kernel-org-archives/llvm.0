Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71C6171D1;
	Sat, 17 Feb 2024 03:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708141332; cv=none; b=Z6e+u6T5YwvIBVxQNkCuRzLXsDkQpVtfqyZnDChIHYvgLlbib5FJTifmBZiSPd6jGy3k7K9F5L1q1py42/ZaEbmI5gIxPcxrAWL3YVRiAmBSlZ7EBWOBrpe9+L8HRR0Bep5myDcTz0HHjwG8VpX12rOnMv9H/wN/wVAypOuMyLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708141332; c=relaxed/simple;
	bh=K3nvd2AvR7JTKY7T0UDPEZVRPSQ1p/OBYiVqTExWezo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CzJvblJyRGa6cTneGRVy1eQiSVbN9OOWqjVy84pbiAQdGzKHRWVUL6Cp5abr5O++WWERawKPuP6+54KDumopKewY+K9hLccL8/SCK5GoCucGyet8uyiHT+l3CKHhxwcCC5OOeRv9xAoq/k4n9YklhO/QmeyGt71r6Ru4p9LBub8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L0U8+hNi; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L0U8+hNi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708141331; x=1739677331;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K3nvd2AvR7JTKY7T0UDPEZVRPSQ1p/OBYiVqTExWezo=;
  b=L0U8+hNim3wLxKxHEaT+mqtBDT/h82Y1I2sMYe3o0tOcPrvCAtd4u4L/
   G98k8FLQvW5aH2RjyYVjmCD+QVzRGrY8xWNObNEMWLKOoLrKrDHUcJLv7
   cpeKbXJ9cANZvV562+2bbMmeo14UZjCPX69iFIqU/iQN0xAvIW//cybsh
   VXYO3d6iLQvwI7GtQjU9zLgOA47Gy0v15YtZQ7gdi3XPGZzeSmdA9A7eC
   MzbVAxQpoYroyzjr2u5vmwY3vfdlRC2lAEECYB+yQyVDn+strEih4HWAI
   WSW4ZBZ/hP4/ZcmKteo5BekfjhotLoTFzFIJ6gj1PmMj6YWo+5ixCsBR4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10986"; a="13678198"
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="13678198"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2024 19:42:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="4397160"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 16 Feb 2024 19:42:08 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbBaX-0001nt-2K;
	Sat, 17 Feb 2024 03:42:05 +0000
Date: Sat, 17 Feb 2024 11:41:53 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [jic23-iio:testing 107/107] drivers/iio/adc/ti-ads1298.c:653:29:
 warning: variable 'ret' is uninitialized when used here
Message-ID: <202402171104.pciYOoXE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   fe214999d5778df2523dc6048a386fa57d700707
commit: fe214999d5778df2523dc6048a386fa57d700707 [107/107] iio: adc: ti-ads1298: Add driver
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20240217/202402171104.pciYOoXE-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 36adfec155de366d722f2bac8ff9162289dcf06c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240217/202402171104.pciYOoXE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402171104.pciYOoXE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iio/adc/ti-ads1298.c:16:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/iio/adc/ti-ads1298.c:16:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/iio/adc/ti-ads1298.c:16:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/iio/adc/ti-ads1298.c:653:29: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     653 |                 return dev_err_probe(dev, ret, "Cannot get reset GPIO\n");
         |                                           ^~~
   drivers/iio/adc/ti-ads1298.c:642:9: note: initialize the variable 'ret' to silence this warning
     642 |         int ret;
         |                ^
         |                 = 0
   7 warnings generated.


vim +/ret +653 drivers/iio/adc/ti-ads1298.c

   635	
   636	static int ads1298_probe(struct spi_device *spi)
   637	{
   638		struct ads1298_private *priv;
   639		struct iio_dev *indio_dev;
   640		struct device *dev = &spi->dev;
   641		struct gpio_desc *reset_gpio;
   642		int ret;
   643	
   644		indio_dev = devm_iio_device_alloc(dev, sizeof(*priv));
   645		if (!indio_dev)
   646			return -ENOMEM;
   647	
   648		priv = iio_priv(indio_dev);
   649	
   650		/* Reset to be asserted before enabling clock and power */
   651		reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
   652		if (IS_ERR(reset_gpio))
 > 653			return dev_err_probe(dev, ret, "Cannot get reset GPIO\n");
   654	
   655		/* VREF can be supplied externally, otherwise use internal reference */
   656		priv->reg_vref = devm_regulator_get_optional(dev, "vref");
   657		if (IS_ERR(priv->reg_vref)) {
   658			if (PTR_ERR(priv->reg_vref) != -ENODEV)
   659				return dev_err_probe(dev, PTR_ERR(priv->reg_avdd),
   660						     "Failed to get vref regulator\n");
   661	
   662			priv->reg_vref = NULL;
   663		} else {
   664			ret = regulator_enable(priv->reg_vref);
   665			if (ret)
   666				return ret;
   667	
   668			ret = devm_add_action_or_reset(dev, ads1298_reg_disable, priv->reg_vref);
   669			if (ret)
   670				return ret;
   671		}
   672	
   673		priv->clk = devm_clk_get_optional_enabled(dev, "clk");
   674		if (IS_ERR(priv->clk))
   675			return dev_err_probe(dev, PTR_ERR(priv->clk), "Failed to get clk\n");
   676	
   677		priv->reg_avdd = devm_regulator_get(dev, "avdd");
   678		if (IS_ERR(priv->reg_avdd))
   679			return dev_err_probe(dev, PTR_ERR(priv->reg_avdd),
   680					     "Failed to get avdd regulator\n");
   681	
   682		ret = regulator_enable(priv->reg_avdd);
   683		if (ret)
   684			return dev_err_probe(dev, ret, "Failed to enable avdd regulator\n");
   685	
   686		ret = devm_add_action_or_reset(dev, ads1298_reg_disable, priv->reg_avdd);
   687		if (ret)
   688			return ret;
   689	
   690		priv->spi = spi;
   691		init_completion(&priv->completion);
   692		spin_lock_init(&priv->irq_busy_lock);
   693		priv->regmap = devm_regmap_init(dev, NULL, priv, &ads1298_regmap_config);
   694		if (IS_ERR(priv->regmap))
   695			return PTR_ERR(priv->regmap);
   696	
   697		indio_dev->modes = INDIO_DIRECT_MODE | INDIO_BUFFER_SOFTWARE;
   698		indio_dev->channels = ads1298_channels;
   699		indio_dev->info = &ads1298_info;
   700	
   701		if (reset_gpio) {
   702			/*
   703			 * Deassert reset now that clock and power are active.
   704			 * Minimum reset pulsewidth is 2 clock cycles.
   705			 */
   706			fsleep(ADS1298_CLOCKS_TO_USECS(2));
   707			gpiod_set_value_cansleep(reset_gpio, 0);
   708		} else {
   709			ret = ads1298_write_cmd(priv, ADS1298_CMD_RESET);
   710			if (ret)
   711				return dev_err_probe(dev, ret, "RESET failed\n");
   712		}
   713		/* Wait 18 clock cycles for reset command to complete */
   714		fsleep(ADS1298_CLOCKS_TO_USECS(18));
   715	
   716		ret = ads1298_init(indio_dev);
   717		if (ret)
   718			return dev_err_probe(dev, ret, "Init failed\n");
   719	
   720		priv->tx_buffer[0] = ADS1298_CMD_RDATA;
   721		priv->rdata_xfer.tx_buf = priv->tx_buffer;
   722		priv->rdata_xfer.rx_buf = priv->rx_buffer;
   723		priv->rdata_xfer.len = ADS1298_SPI_RDATA_BUFFER_SIZE(indio_dev->num_channels);
   724		/* Must keep CS low for 4 clocks */
   725		priv->rdata_xfer.delay.value = 2;
   726		priv->rdata_xfer.delay.unit = SPI_DELAY_UNIT_USECS;
   727		spi_message_init_with_transfers(&priv->rdata_msg, &priv->rdata_xfer, 1);
   728		priv->rdata_msg.complete = &ads1298_rdata_complete;
   729		priv->rdata_msg.context = indio_dev;
   730	
   731		ret = devm_request_irq(dev, spi->irq, &ads1298_interrupt,
   732				       IRQF_TRIGGER_FALLING, indio_dev->name,
   733				       indio_dev);
   734		if (ret)
   735			return ret;
   736	
   737		ret = devm_iio_kfifo_buffer_setup(dev, indio_dev, &ads1298_setup_ops);
   738		if (ret)
   739			return ret;
   740	
   741		return devm_iio_device_register(dev, indio_dev);
   742	}
   743	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
