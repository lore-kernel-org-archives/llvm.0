Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EF615A5;
	Wed, 24 Jan 2024 01:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706060751; cv=none; b=uQu1eOnpInjQFxoKromcG3CnGS+kKhqNwfEmJVJlV4WtmDuHvuBKrnQiFUFW8r8sQAnxqDs3fxJJgcfP+F18+2cL7Nb3RZEWgRHXSQadBeKgRCRzT9ZLGn60dVZKwRbXHxLYhAojD1XUDJhf6FubWrUxlHHXSkQKGGwA+tOG1T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706060751; c=relaxed/simple;
	bh=qBkV4p7qBpyj6TypQhBmbEdy6zIsZ7TSODEI3Pe1oEo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YNlAo1iNSYlIK9FelfRPqxifhHN5dE3kDRaZ13J4QU2zbxHeuZXH8HnZQ0OkF21Q3nW6EQHIamJLvZL7UY3Ykd7xM8vkphWspSL1f9prxhzi8ZpoOEJpQY50NyAnAqcxzmmnxILh5lFVqrdQhgyN/fQ1T4xmpuTvKaY0ceLNJiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gMQELn3B; arc=none smtp.client-ip=192.55.52.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gMQELn3B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706060749; x=1737596749;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qBkV4p7qBpyj6TypQhBmbEdy6zIsZ7TSODEI3Pe1oEo=;
  b=gMQELn3BqoaXCCSQLT5IXQOorknivtEAKljHE2XoKZ4X8K6Mk7lC0mP9
   LrXtwcfdmRX2LikGYnbCNJ6D56wMGn9HuXaKwDcWgf2lyAVUnRGoZwmOS
   vEI62SlYn7W2lSDYVB8UC65/bfkHL0w/4Hau32tV4YN+dOAHqpxn+7v6V
   iwztDQVpn/9cpvhDs9IpQxkfJoXVyoBaVcynZ5l8XP/xhJMpgJtg/DQSh
   Gh7TKgPMigrxXdfajW/sMJZB/51yi83RZE1OxG8N8TJI2JuFKe8FDeMK4
   dqt2bLMcskzhyxFGFHWPMZneXXAwtmfP/392jhyqHjtIrOGBijy5Rp1q+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="400575041"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="400575041"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 17:45:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="1764436"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 23 Jan 2024 17:45:46 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSSKl-0007mL-2S;
	Wed, 24 Jan 2024 01:45:43 +0000
Date: Wed, 24 Jan 2024 09:44:53 +0800
From: kernel test robot <lkp@intel.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ambarus:gs101-spi 57/59] drivers/spi/spi-s3c64xx.c:457:6: error:
 call to undeclared function 'iowrite16_32_rep'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202401240904.hUMAFi3Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ambarus/linux-0day gs101-spi
head:   df897428b48d1590fc32fd3b6196e02ceed8e122
commit: 6e802b2866d27c8c88eb68bbcc9d94d26674d3b6 [57/59] spi: s3c64xx: add support for google,gs101-spi
config: i386-buildonly-randconfig-001-20240124 (https://download.01.org/0day-ci/archive/20240124/202401240904.hUMAFi3Y-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240124/202401240904.hUMAFi3Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401240904.hUMAFi3Y-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/spi/spi-s3c64xx.c:457:6: error: call to undeclared function 'iowrite16_32_rep'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     457 |                                         iowrite16_32_rep(regs + S3C64XX_SPI_TX_DATA,
         |                                         ^
>> drivers/spi/spi-s3c64xx.c:466:6: error: call to undeclared function 'iowrite8_32_rep'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     466 |                                         iowrite8_32_rep(regs + S3C64XX_SPI_TX_DATA,
         |                                         ^
   2 errors generated.


vim +/iowrite16_32_rep +457 drivers/spi/spi-s3c64xx.c

   415	
   416	static int s3c64xx_enable_datapath(struct s3c64xx_spi_driver_data *sdd,
   417					    struct spi_transfer *xfer, int dma_mode)
   418	{
   419		void __iomem *regs = sdd->regs;
   420		u32 modecfg, chcfg;
   421		int ret = 0;
   422	
   423		modecfg = readl(regs + S3C64XX_SPI_MODE_CFG);
   424		modecfg &= ~(S3C64XX_SPI_MODE_TXDMA_ON | S3C64XX_SPI_MODE_RXDMA_ON);
   425	
   426		chcfg = readl(regs + S3C64XX_SPI_CH_CFG);
   427		chcfg &= ~S3C64XX_SPI_CH_TXCH_ON;
   428	
   429		if (dma_mode) {
   430			chcfg &= ~S3C64XX_SPI_CH_RXCH_ON;
   431		} else {
   432			/* Always shift in data in FIFO, even if xfer is Tx only,
   433			 * this helps setting PCKT_CNT value for generating clocks
   434			 * as exactly needed.
   435			 */
   436			chcfg |= S3C64XX_SPI_CH_RXCH_ON;
   437			writel(((xfer->len * 8 / sdd->cur_bpw) & 0xffff)
   438						| S3C64XX_SPI_PACKET_CNT_EN,
   439						regs + S3C64XX_SPI_PACKET_CNT);
   440		}
   441	
   442		if (xfer->tx_buf != NULL) {
   443			sdd->state |= TXBUSY;
   444			chcfg |= S3C64XX_SPI_CH_TXCH_ON;
   445			if (dma_mode) {
   446				modecfg |= S3C64XX_SPI_MODE_TXDMA_ON;
   447				ret = s3c64xx_prepare_dma(&sdd->tx_dma, &xfer->tx_sg);
   448			} else {
   449				switch (sdd->cur_bpw) {
   450				case 32:
   451					iowrite32_rep(regs + S3C64XX_SPI_TX_DATA,
   452						xfer->tx_buf, xfer->len / 4);
   453					break;
   454				case 16:
   455					if (sdd->port_conf->quirks &
   456					    S3C64XX_SPI_GS1O1_32BIT_REG_IO_WIDTH)
 > 457						iowrite16_32_rep(regs + S3C64XX_SPI_TX_DATA,
   458								 xfer->tx_buf, xfer->len / 2);
   459					else
   460						iowrite16_rep(regs + S3C64XX_SPI_TX_DATA,
   461							      xfer->tx_buf, xfer->len / 2);
   462					break;
   463				default:
   464					if (sdd->port_conf->quirks &
   465					    S3C64XX_SPI_GS1O1_32BIT_REG_IO_WIDTH)
 > 466						iowrite8_32_rep(regs + S3C64XX_SPI_TX_DATA,
   467								xfer->tx_buf, xfer->len);
   468					else
   469						iowrite8_rep(regs + S3C64XX_SPI_TX_DATA,
   470							     xfer->tx_buf, xfer->len);
   471					break;
   472				}
   473			}
   474		}
   475	
   476		if (xfer->rx_buf != NULL) {
   477			sdd->state |= RXBUSY;
   478	
   479			if (sdd->port_conf->high_speed && sdd->cur_speed >= 30000000UL
   480						&& !(sdd->cur_mode & SPI_CPHA))
   481				chcfg |= S3C64XX_SPI_CH_HS_EN;
   482	
   483			if (dma_mode) {
   484				modecfg |= S3C64XX_SPI_MODE_RXDMA_ON;
   485				chcfg |= S3C64XX_SPI_CH_RXCH_ON;
   486				writel(((xfer->len * 8 / sdd->cur_bpw) & 0xffff)
   487						| S3C64XX_SPI_PACKET_CNT_EN,
   488						regs + S3C64XX_SPI_PACKET_CNT);
   489				ret = s3c64xx_prepare_dma(&sdd->rx_dma, &xfer->rx_sg);
   490			}
   491		}
   492	
   493		if (ret)
   494			return ret;
   495	
   496		writel(modecfg, regs + S3C64XX_SPI_MODE_CFG);
   497		writel(chcfg, regs + S3C64XX_SPI_CH_CFG);
   498	
   499		return 0;
   500	}
   501	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
