Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218B1290E;
	Fri, 26 Jan 2024 05:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706247999; cv=none; b=eeJ2fpa8UmCs8+tfZrq922flDRk2kkcpsVSCsxfRGS8/qmzC5h75JkmOTNzbq/G5QxUuPVoBOGXbJ8uB/Rla8gtClySy+FmFxhyq72C7jqzREVNfFA9hu7SvpKL1EkWnHnlGxYDgzuQ9oVMkZHDTXBtt+0GUdpzUPL8+ene9i4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706247999; c=relaxed/simple;
	bh=izb6XGWP+V1eZT7Vp571i1YaosXP4HpyWgVbgUkIGOk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BdW5oiOmEmZm2lTgGOB0djtvr9zISlWJnjgu7Z0rsR2Jmq0wwDt+vh6I4FyT6NVp1he+00hyz0usuTJNIqHWTDezV3Q7y3ePX5B9//m7VeeeF2X/8u5YEfxCPAYsH5LFIeFMx4BMLdZfwoJ39SeuuI+go1PZXSFHx/AqQ13HZzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MdBux+s/; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MdBux+s/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706247997; x=1737783997;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=izb6XGWP+V1eZT7Vp571i1YaosXP4HpyWgVbgUkIGOk=;
  b=MdBux+s/astpDs1ZrCq411jLH0sXi+IZTIzybOkTRV8yV45qXCLqUY4f
   XS6Sl537+pEc0ul/Qz0s8pNVyD+YvbsDHBQDsAoaChJa6UvuewD/mLCXS
   uzPbBPJald68nPVf6c0d/wRW4pJZGdm/KWCZBviTmMI8JjMJw7jjjPclf
   giPjCF3b0PJBKSUWCV8fiObPSanMy4gBtUnXmxYrHipKTHTx/oaxLl1rg
   n9iROTAK2a9F23qcTPU+8vwJ6+nrDZQLwmfKCq/1byvBG+rFDvlubz7TC
   SGQ8opGMj7drePVhRJ/nlFfJi35z8qI12P69axxUaWudS6DaCls9EOD07
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="1319806"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="1319806"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 21:46:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="28729580"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 25 Jan 2024 21:46:35 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTF2t-0000jw-22;
	Fri, 26 Jan 2024 05:46:31 +0000
Date: Fri, 26 Jan 2024 13:46:20 +0800
From: kernel test robot <lkp@intel.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ambarus:gs101-spi-vv2 33/46] drivers/spi/spi-s3c64xx.c:200:
 warning: Excess struct member 'port_id' description in
 's3c64xx_spi_driver_data'
Message-ID: <202401261322.aQB2fPuq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ambarus/linux-0day gs101-spi-vv2
head:   b148a8ab25375c3d984c42954bdb06e98a91ec8f
commit: e7936574c738273da7507a1867c878c950e05103 [33/46] spi: s3c64xx: drop dependency on of_alias where possible
config: i386-buildonly-randconfig-003-20240126 (https://download.01.org/0day-ci/archive/20240126/202401261322.aQB2fPuq-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240126/202401261322.aQB2fPuq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401261322.aQB2fPuq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/spi/spi-s3c64xx.c:200: warning: Excess struct member 'port_id' description in 's3c64xx_spi_driver_data'


vim +200 drivers/spi/spi-s3c64xx.c

a5238e360b715e drivers/spi/spi-s3c64xx.c Thomas Abraham      2012-07-13  159  
230d42d422e7b6 drivers/spi/spi_s3c64xx.c Jassi Brar          2009-11-30  160  /**
230d42d422e7b6 drivers/spi/spi_s3c64xx.c Jassi Brar          2009-11-30  161   * struct s3c64xx_spi_driver_data - Runtime info holder for SPI driver.
230d42d422e7b6 drivers/spi/spi_s3c64xx.c Jassi Brar          2009-11-30  162   * @clk: Pointer to the spi clock.
b0d5d6e5534034 drivers/spi/spi_s3c64xx.c Jassi Brar          2010-01-20  163   * @src_clk: Pointer to the clock used to generate SPI signals.
f4bc49eda254c6 drivers/spi/spi-s3c64xx.c Yang Yingliang      2023-08-18  164   * @ioclk: Pointer to the i/o clock between host and target
6b8d1e4739f41f drivers/spi/spi-s3c64xx.c Lee Jones           2020-07-17  165   * @pdev: Pointer to device's platform device data
f4bc49eda254c6 drivers/spi/spi-s3c64xx.c Yang Yingliang      2023-08-18  166   * @host: Pointer to the SPI Protocol host.
230d42d422e7b6 drivers/spi/spi_s3c64xx.c Jassi Brar          2009-11-30  167   * @cntrlr_info: Platform specific data for the controller this driver manages.
230d42d422e7b6 drivers/spi/spi_s3c64xx.c Jassi Brar          2009-11-30  168   * @lock: Controller specific lock.
230d42d422e7b6 drivers/spi/spi_s3c64xx.c Jassi Brar          2009-11-30  169   * @state: Set of FLAGS to indicate status.
230d42d422e7b6 drivers/spi/spi_s3c64xx.c Jassi Brar          2009-11-30  170   * @sfr_start: BUS address of SPI controller regs.
230d42d422e7b6 drivers/spi/spi_s3c64xx.c Jassi Brar          2009-11-30  171   * @regs: Pointer to ioremap'ed controller registers.
230d42d422e7b6 drivers/spi/spi_s3c64xx.c Jassi Brar          2009-11-30  172   * @xfer_completion: To indicate completion of xfer task.
230d42d422e7b6 drivers/spi/spi_s3c64xx.c Jassi Brar          2009-11-30  173   * @cur_mode: Stores the active configuration of the controller.
230d42d422e7b6 drivers/spi/spi_s3c64xx.c Jassi Brar          2009-11-30  174   * @cur_bpw: Stores the active bits per word settings.
6b8d1e4739f41f drivers/spi/spi-s3c64xx.c Lee Jones           2020-07-17  175   * @cur_speed: Current clock speed
6b8d1e4739f41f drivers/spi/spi-s3c64xx.c Lee Jones           2020-07-17  176   * @rx_dma: Local receive DMA data (e.g. chan and direction)
6b8d1e4739f41f drivers/spi/spi-s3c64xx.c Lee Jones           2020-07-17  177   * @tx_dma: Local transmit DMA data (e.g. chan and direction)
47cc22182f8dc4 drivers/spi/spi-s3c64xx.c Tudor Ambarus       2024-01-25  178   * @port_conf: Local SPI port configuration data
6b8d1e4739f41f drivers/spi/spi-s3c64xx.c Lee Jones           2020-07-17  179   * @port_id: Port identification number
8fea318bddfd93 drivers/spi/spi-s3c64xx.c Tudor Ambarus       2024-01-24  180   * @fifosize: size of the FIFO
230d42d422e7b6 drivers/spi/spi_s3c64xx.c Jassi Brar          2009-11-30  181   */
230d42d422e7b6 drivers/spi/spi_s3c64xx.c Jassi Brar          2009-11-30  182  struct s3c64xx_spi_driver_data {
230d42d422e7b6 drivers/spi/spi_s3c64xx.c Jassi Brar          2009-11-30  183  	void __iomem                    *regs;
230d42d422e7b6 drivers/spi/spi_s3c64xx.c Jassi Brar          2009-11-30  184  	struct clk                      *clk;
b0d5d6e5534034 drivers/spi/spi_s3c64xx.c Jassi Brar          2010-01-20  185  	struct clk                      *src_clk;
7990b00819e765 drivers/spi/spi-s3c64xx.c Andi Shyti          2016-07-12  186  	struct clk                      *ioclk;
230d42d422e7b6 drivers/spi/spi_s3c64xx.c Jassi Brar          2009-11-30  187  	struct platform_device          *pdev;
f4bc49eda254c6 drivers/spi/spi-s3c64xx.c Yang Yingliang      2023-08-18  188  	struct spi_controller           *host;
ad7de729c60380 drivers/spi/spi_s3c64xx.c Jassi Brar          2010-01-20  189  	struct s3c64xx_spi_info         *cntrlr_info;
230d42d422e7b6 drivers/spi/spi_s3c64xx.c Jassi Brar          2009-11-30  190  	spinlock_t                      lock;
230d42d422e7b6 drivers/spi/spi_s3c64xx.c Jassi Brar          2009-11-30  191  	unsigned long                   sfr_start;
230d42d422e7b6 drivers/spi/spi_s3c64xx.c Jassi Brar          2009-11-30  192  	struct completion               xfer_completion;
230d42d422e7b6 drivers/spi/spi_s3c64xx.c Jassi Brar          2009-11-30  193  	unsigned                        state;
230d42d422e7b6 drivers/spi/spi_s3c64xx.c Jassi Brar          2009-11-30  194  	unsigned                        cur_mode, cur_bpw;
230d42d422e7b6 drivers/spi/spi_s3c64xx.c Jassi Brar          2009-11-30  195  	unsigned                        cur_speed;
82ab8cd7ec3219 drivers/spi/spi-s3c64xx.c Boojin Kim          2011-09-02  196  	struct s3c64xx_spi_dma_data	rx_dma;
82ab8cd7ec3219 drivers/spi/spi-s3c64xx.c Boojin Kim          2011-09-02  197  	struct s3c64xx_spi_dma_data	tx_dma;
d6371415517700 drivers/spi/spi-s3c64xx.c Krzysztof Kozlowski 2021-04-14  198  	const struct s3c64xx_spi_port_config	*port_conf;
8fea318bddfd93 drivers/spi/spi-s3c64xx.c Tudor Ambarus       2024-01-24  199  	unsigned int			fifosize;
230d42d422e7b6 drivers/spi/spi_s3c64xx.c Jassi Brar          2009-11-30 @200  };
230d42d422e7b6 drivers/spi/spi_s3c64xx.c Jassi Brar          2009-11-30  201  

:::::: The code at line 200 was first introduced by commit
:::::: 230d42d422e7b69fc9b270f41c69e63b54572e26 spi: Add s3c64xx SPI Controller driver

:::::: TO: Jassi Brar <jassi.brar@samsung.com>
:::::: CC: Grant Likely <grant.likely@secretlab.ca>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
