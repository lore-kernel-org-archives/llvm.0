Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A1C208A8;
	Wed, 27 Mar 2024 02:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711505775; cv=none; b=iNVjTOxKoaGnTARdDj8G6fbJxxuX9Sc8sg/5Q54e40ZXf4rGlSG7VWdxw47i7AwjjXvplkkQ1AZBA6d3YvGrwDgxRKyRtou8OG+2zsH2TktYLIbufji826DW36WhERetpvR8syVkjHDta47H1x/j225uGoOcv1Q/pfU9elqNEC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711505775; c=relaxed/simple;
	bh=vm7OO2/ApIxgDc0soY89iJM1k0/dgNziNC79x6KgZvY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zk8o63YpGqpJi7ytRGugjgMuh8fRFs4itWch9XpzCSfW9PLh6ZZyek+q0SYErwQU4jeJS91v2e+/hs0fpyMBr71P+6HIB6MKG+UkLhw6JBCae4rTD1RQU7L1bpLFQs31k8fCTJ5PaeJH/+Hw8QIpCE0NSuJgh+owetz1GI8D3rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y+ie21Mp; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y+ie21Mp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711505773; x=1743041773;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vm7OO2/ApIxgDc0soY89iJM1k0/dgNziNC79x6KgZvY=;
  b=Y+ie21Mp7wrlcnIGgn0wexd4K7+atAwKZ7Y4y0JSI/KEYX7iZDGBc1sO
   ebxiaWI9bZuTXeINGo1zZG2Q9fevnZqC8yRdkdsOAda4E17+Yx3zKGlIW
   v9+mS3r+rfou0Qz3vh3xx9kMN7wXHnkC3fjAPd78P1YjDv/1a0MlXTYtZ
   dCEipqAbKYM80x907b+7fCP+LCX2NXQIWXr1nbItZvGoE3FIdxBEkeXtP
   zavAgSyI8Ck0TGA7XIa0a1s35Jr+5jvU0QEPVwhyuPKYVwiwVZoQwlV1x
   lTOu/uKoJeMSlqX3CZdqrTzUeReLalgiBhO/C4CCVCCeI+LPHj1ks3Nor
   Q==;
X-CSE-ConnectionGUID: EFH9ExPOT7mISDJxSMLohQ==
X-CSE-MsgGUID: RK2Rw3KsTFKDYvbNkhBgFQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="24077795"
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="24077795"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 19:16:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="16799308"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 26 Mar 2024 19:16:10 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpIpj-0000e2-2r;
	Wed, 27 Mar 2024 02:16:07 +0000
Date: Wed, 27 Mar 2024 10:15:24 +0800
From: kernel test robot <lkp@intel.com>
To: David Lechner <dlechner@baylibre.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:filepKh54x 2/4] drivers/spi/spi-pxa2xx.c:947:22:
 warning: unused variable 'message'
Message-ID: <202403271016.lsLThxJ9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git filepKh54x
head:   a283629ddd86c38aacfda153f0faa7f3bd4419a5
commit: 19466406f6c53ed369edf827f4f4af7ba805ca61 [2/4] spi: remove struct spi_message::is_dma_mapped
config: x86_64-randconfig-001-20240325 (https://download.01.org/0day-ci/archive/20240327/202403271016.lsLThxJ9-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240327/202403271016.lsLThxJ9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403271016.lsLThxJ9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/spi/spi-pxa2xx.c:947:22: warning: unused variable 'message' [-Wunused-variable]
     947 |         struct spi_message *message = controller->cur_msg;
         |                             ^~~~~~~
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_I915_DEBUG_GEM
   Depends on [n]: HAS_IOMEM [=y] && DRM_I915 [=y] && EXPERT [=y] && DRM_I915_WERROR [=n]
   Selected by [y]:
   - DRM_I915_DEBUG [=y] && HAS_IOMEM [=y] && DRM_I915 [=y] && EXPERT [=y] && !COMPILE_TEST [=n]


vim +/message +947 drivers/spi/spi-pxa2xx.c

b6ced294fb61418 drivers/spi/spi-pxa2xx.c Jarkko Nikula             2016-06-21   941  
51eea52d26d4939 drivers/spi/spi-pxa2xx.c Lubomir Rintel            2019-01-16   942  static int pxa2xx_spi_transfer_one(struct spi_controller *controller,
d5898e19c0d74cd drivers/spi/spi-pxa2xx.c Jarkko Nikula             2018-04-17   943  				   struct spi_device *spi,
d5898e19c0d74cd drivers/spi/spi-pxa2xx.c Jarkko Nikula             2018-04-17   944  				   struct spi_transfer *transfer)
e0c9905e87ac1bc drivers/spi/pxa2xx_spi.c Stephen Street            2006-03-07   945  {
51eea52d26d4939 drivers/spi/spi-pxa2xx.c Lubomir Rintel            2019-01-16   946  	struct driver_data *drv_data = spi_controller_get_devdata(controller);
51eea52d26d4939 drivers/spi/spi-pxa2xx.c Lubomir Rintel            2019-01-16  @947  	struct spi_message *message = controller->cur_msg;
20f4c379c39d54a drivers/spi/spi-pxa2xx.c Jarkko Nikula             2019-03-29   948  	struct chip_data *chip = spi_get_ctldata(spi);
96579a4e56bdecf drivers/spi/spi-pxa2xx.c Jarkko Nikula             2016-09-07   949  	u32 dma_thresh = chip->dma_threshold;
96579a4e56bdecf drivers/spi/spi-pxa2xx.c Jarkko Nikula             2016-09-07   950  	u32 dma_burst = chip->dma_burst_size;
96579a4e56bdecf drivers/spi/spi-pxa2xx.c Jarkko Nikula             2016-09-07   951  	u32 change_mask = pxa2xx_spi_get_ssrc1_change_mask(drv_data);
bffc967e93c7718 drivers/spi/spi-pxa2xx.c Jarkko Nikula             2016-09-07   952  	u32 clk_div;
bffc967e93c7718 drivers/spi/spi-pxa2xx.c Jarkko Nikula             2016-09-07   953  	u8 bits;
bffc967e93c7718 drivers/spi/spi-pxa2xx.c Jarkko Nikula             2016-09-07   954  	u32 speed;
9708c121c38fe86 drivers/spi/pxa2xx_spi.c Stephen Street            2006-03-28   955  	u32 cr0;
8d94cc50aa4f144 drivers/spi/pxa2xx_spi.c Stephen Street            2006-12-10   956  	u32 cr1;
7d1f1bf699efc9b drivers/spi/spi-pxa2xx.c Andy Shevchenko           2016-03-24   957  	int err;
b6ced294fb61418 drivers/spi/spi-pxa2xx.c Jarkko Nikula             2016-06-21   958  	int dma_mapped;
e0c9905e87ac1bc drivers/spi/pxa2xx_spi.c Stephen Street            2006-03-07   959  
cd7bed00340475e drivers/spi/spi-pxa2xx.c Mika Westerberg           2013-01-22   960  	/* Check if we can DMA this transfer */
b6ced294fb61418 drivers/spi/spi-pxa2xx.c Jarkko Nikula             2016-06-21   961  	if (transfer->len > MAX_DMA_LEN && chip->enable_dma) {
8083d6b812cac5e drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-17   962  		/* Warn ... we force this to PIO mode */
20f4c379c39d54a drivers/spi/spi-pxa2xx.c Jarkko Nikula             2019-03-29   963  		dev_warn_ratelimited(&spi->dev,
684a3ac720c3fd4 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-17   964  				     "DMA disabled for transfer length %u greater than %d\n",
684a3ac720c3fd4 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-17   965  				     transfer->len, MAX_DMA_LEN);
7e96445533ac3f4 drivers/spi/pxa2xx_spi.c Ned Forrester             2008-09-13   966  	}
7e96445533ac3f4 drivers/spi/pxa2xx_spi.c Ned Forrester             2008-09-13   967  
e0c9905e87ac1bc drivers/spi/pxa2xx_spi.c Stephen Street            2006-03-07   968  	/* Setup the transfer state based on the type of transfer */
cd7bed00340475e drivers/spi/spi-pxa2xx.c Mika Westerberg           2013-01-22   969  	if (pxa2xx_spi_flush(drv_data) == 0) {
748fbadf951a8b3 drivers/spi/spi-pxa2xx.c Jarkko Nikula             2019-03-29   970  		dev_err(&spi->dev, "Flush failed\n");
d5898e19c0d74cd drivers/spi/spi-pxa2xx.c Jarkko Nikula             2018-04-17   971  		return -EIO;
e0c9905e87ac1bc drivers/spi/pxa2xx_spi.c Stephen Street            2006-03-07   972  	}
e0c9905e87ac1bc drivers/spi/pxa2xx_spi.c Stephen Street            2006-03-07   973  	drv_data->tx = (void *)transfer->tx_buf;
e0c9905e87ac1bc drivers/spi/pxa2xx_spi.c Stephen Street            2006-03-07   974  	drv_data->tx_end = drv_data->tx + transfer->len;
e0c9905e87ac1bc drivers/spi/pxa2xx_spi.c Stephen Street            2006-03-07   975  	drv_data->rx = transfer->rx_buf;
e0c9905e87ac1bc drivers/spi/pxa2xx_spi.c Stephen Street            2006-03-07   976  	drv_data->rx_end = drv_data->rx + transfer->len;
9708c121c38fe86 drivers/spi/pxa2xx_spi.c Stephen Street            2006-03-28   977  
9708c121c38fe86 drivers/spi/pxa2xx_spi.c Stephen Street            2006-03-28   978  	/* Change speed and bit per word on a per transfer */
9708c121c38fe86 drivers/spi/pxa2xx_spi.c Stephen Street            2006-03-28   979  	bits = transfer->bits_per_word;
4f1474b3b786305 drivers/spi/spi-pxa2xx.c Jarkko Nikula             2015-09-15   980  	speed = transfer->speed_hz;
9708c121c38fe86 drivers/spi/pxa2xx_spi.c Stephen Street            2006-03-28   981  
d2c2f6a47633a36 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2015-10-22   982  	clk_div = pxa2xx_ssp_get_clk_div(drv_data, speed);
9708c121c38fe86 drivers/spi/pxa2xx_spi.c Stephen Street            2006-03-28   983  
9708c121c38fe86 drivers/spi/pxa2xx_spi.c Stephen Street            2006-03-28   984  	if (bits <= 8) {
9708c121c38fe86 drivers/spi/pxa2xx_spi.c Stephen Street            2006-03-28   985  		drv_data->n_bytes = 1;
44ec41b7f7831f9 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-11-22   986  		drv_data->read = drv_data->rx ? u8_reader : null_reader;
44ec41b7f7831f9 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-11-22   987  		drv_data->write = drv_data->tx ? u8_writer : null_writer;
9708c121c38fe86 drivers/spi/pxa2xx_spi.c Stephen Street            2006-03-28   988  	} else if (bits <= 16) {
9708c121c38fe86 drivers/spi/pxa2xx_spi.c Stephen Street            2006-03-28   989  		drv_data->n_bytes = 2;
44ec41b7f7831f9 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-11-22   990  		drv_data->read = drv_data->rx ? u16_reader : null_reader;
44ec41b7f7831f9 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-11-22   991  		drv_data->write = drv_data->tx ? u16_writer : null_writer;
9708c121c38fe86 drivers/spi/pxa2xx_spi.c Stephen Street            2006-03-28   992  	} else if (bits <= 32) {
9708c121c38fe86 drivers/spi/pxa2xx_spi.c Stephen Street            2006-03-28   993  		drv_data->n_bytes = 4;
44ec41b7f7831f9 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-11-22   994  		drv_data->read = drv_data->rx ? u32_reader : null_reader;
44ec41b7f7831f9 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-11-22   995  		drv_data->write = drv_data->tx ? u32_writer : null_writer;
9708c121c38fe86 drivers/spi/pxa2xx_spi.c Stephen Street            2006-03-28   996  	}
196b0e2cf2373f4 drivers/spi/spi-pxa2xx.c Jarkko Nikula             2015-09-15   997  	/*
8083d6b812cac5e drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-17   998  	 * If bits per word is changed in DMA mode, then must check
8083d6b812cac5e drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-17   999  	 * the thresholds and burst also.
196b0e2cf2373f4 drivers/spi/spi-pxa2xx.c Jarkko Nikula             2015-09-15  1000  	 */
8d94cc50aa4f144 drivers/spi/pxa2xx_spi.c Stephen Street            2006-12-10  1001  	if (chip->enable_dma) {
cd7bed00340475e drivers/spi/spi-pxa2xx.c Mika Westerberg           2013-01-22  1002  		if (pxa2xx_spi_set_dma_burst_and_threshold(chip,
20f4c379c39d54a drivers/spi/spi-pxa2xx.c Jarkko Nikula             2019-03-29  1003  						spi,
8d94cc50aa4f144 drivers/spi/pxa2xx_spi.c Stephen Street            2006-12-10  1004  						bits, &dma_burst,
8d94cc50aa4f144 drivers/spi/pxa2xx_spi.c Stephen Street            2006-12-10  1005  						&dma_thresh))
20f4c379c39d54a drivers/spi/spi-pxa2xx.c Jarkko Nikula             2019-03-29  1006  			dev_warn_ratelimited(&spi->dev,
8ae55af38817a0e drivers/spi/spi-pxa2xx.c Jarkko Nikula             2018-04-17  1007  					     "DMA burst size reduced to match bits_per_word\n");
8d94cc50aa4f144 drivers/spi/pxa2xx_spi.c Stephen Street            2006-12-10  1008  	}
9708c121c38fe86 drivers/spi/pxa2xx_spi.c Stephen Street            2006-03-28  1009  
51eea52d26d4939 drivers/spi/spi-pxa2xx.c Lubomir Rintel            2019-01-16  1010  	dma_mapped = controller->can_dma &&
20f4c379c39d54a drivers/spi/spi-pxa2xx.c Jarkko Nikula             2019-03-29  1011  		     controller->can_dma(controller, spi, transfer) &&
51eea52d26d4939 drivers/spi/spi-pxa2xx.c Lubomir Rintel            2019-01-16  1012  		     controller->cur_msg_mapped;
b6ced294fb61418 drivers/spi/spi-pxa2xx.c Jarkko Nikula             2016-06-21  1013  	if (dma_mapped) {
e0c9905e87ac1bc drivers/spi/pxa2xx_spi.c Stephen Street            2006-03-07  1014  
e0c9905e87ac1bc drivers/spi/pxa2xx_spi.c Stephen Street            2006-03-07  1015  		/* Ensure we have the correct interrupt handler */
cd7bed00340475e drivers/spi/spi-pxa2xx.c Mika Westerberg           2013-01-22  1016  		drv_data->transfer_handler = pxa2xx_spi_dma_transfer;
e0c9905e87ac1bc drivers/spi/pxa2xx_spi.c Stephen Street            2006-03-07  1017  
d5898e19c0d74cd drivers/spi/spi-pxa2xx.c Jarkko Nikula             2018-04-17  1018  		err = pxa2xx_spi_dma_prepare(drv_data, transfer);
d5898e19c0d74cd drivers/spi/spi-pxa2xx.c Jarkko Nikula             2018-04-17  1019  		if (err)
d5898e19c0d74cd drivers/spi/spi-pxa2xx.c Jarkko Nikula             2018-04-17  1020  			return err;
e0c9905e87ac1bc drivers/spi/pxa2xx_spi.c Stephen Street            2006-03-07  1021  
8d94cc50aa4f144 drivers/spi/pxa2xx_spi.c Stephen Street            2006-12-10  1022  		/* Clear status and start DMA engine */
8d94cc50aa4f144 drivers/spi/pxa2xx_spi.c Stephen Street            2006-12-10  1023  		cr1 = chip->cr1 | dma_thresh | drv_data->dma_cr1;
c039dd275e88989 drivers/spi/spi-pxa2xx.c Jarkko Nikula             2014-12-18  1024  		pxa2xx_spi_write(drv_data, SSSR, drv_data->clear_sr);
cd7bed00340475e drivers/spi/spi-pxa2xx.c Mika Westerberg           2013-01-22  1025  
cd7bed00340475e drivers/spi/spi-pxa2xx.c Mika Westerberg           2013-01-22  1026  		pxa2xx_spi_dma_start(drv_data);
e0c9905e87ac1bc drivers/spi/pxa2xx_spi.c Stephen Street            2006-03-07  1027  	} else {
e0c9905e87ac1bc drivers/spi/pxa2xx_spi.c Stephen Street            2006-03-07  1028  		/* Ensure we have the correct interrupt handler	*/
e0c9905e87ac1bc drivers/spi/pxa2xx_spi.c Stephen Street            2006-03-07  1029  		drv_data->transfer_handler = interrupt_transfer;
e0c9905e87ac1bc drivers/spi/pxa2xx_spi.c Stephen Street            2006-03-07  1030  
8d94cc50aa4f144 drivers/spi/pxa2xx_spi.c Stephen Street            2006-12-10  1031  		/* Clear status  */
8d94cc50aa4f144 drivers/spi/pxa2xx_spi.c Stephen Street            2006-12-10  1032  		cr1 = chip->cr1 | chip->threshold | drv_data->int_cr1;
2a8626a9e2d86d1 drivers/spi/pxa2xx_spi.c Sebastian Andrzej Siewior 2010-11-22  1033  		write_SSSR_CS(drv_data, drv_data->clear_sr);
8d94cc50aa4f144 drivers/spi/pxa2xx_spi.c Stephen Street            2006-12-10  1034  	}
8d94cc50aa4f144 drivers/spi/pxa2xx_spi.c Stephen Street            2006-12-10  1035  
ee03672d961bdac drivers/spi/spi-pxa2xx.c Jarkko Nikula             2016-01-26  1036  	/* NOTE:  PXA25x_SSP _could_ use external clocking ... */
ee03672d961bdac drivers/spi/spi-pxa2xx.c Jarkko Nikula             2016-01-26  1037  	cr0 = pxa2xx_configure_sscr0(drv_data, clk_div, bits);
ee03672d961bdac drivers/spi/spi-pxa2xx.c Jarkko Nikula             2016-01-26  1038  	if (!pxa25x_ssp_comp(drv_data))
20f4c379c39d54a drivers/spi/spi-pxa2xx.c Jarkko Nikula             2019-03-29  1039  		dev_dbg(&spi->dev, "%u Hz actual, %s\n",
51eea52d26d4939 drivers/spi/spi-pxa2xx.c Lubomir Rintel            2019-01-16  1040  			controller->max_speed_hz
ee03672d961bdac drivers/spi/spi-pxa2xx.c Jarkko Nikula             2016-01-26  1041  				/ (1 + ((cr0 & SSCR0_SCR(0xfff)) >> 8)),
b6ced294fb61418 drivers/spi/spi-pxa2xx.c Jarkko Nikula             2016-06-21  1042  			dma_mapped ? "DMA" : "PIO");
ee03672d961bdac drivers/spi/spi-pxa2xx.c Jarkko Nikula             2016-01-26  1043  	else
20f4c379c39d54a drivers/spi/spi-pxa2xx.c Jarkko Nikula             2019-03-29  1044  		dev_dbg(&spi->dev, "%u Hz actual, %s\n",
51eea52d26d4939 drivers/spi/spi-pxa2xx.c Lubomir Rintel            2019-01-16  1045  			controller->max_speed_hz / 2
ee03672d961bdac drivers/spi/spi-pxa2xx.c Jarkko Nikula             2016-01-26  1046  				/ (1 + ((cr0 & SSCR0_SCR(0x0ff)) >> 8)),
b6ced294fb61418 drivers/spi/spi-pxa2xx.c Jarkko Nikula             2016-06-21  1047  			dma_mapped ? "DMA" : "PIO");
ee03672d961bdac drivers/spi/spi-pxa2xx.c Jarkko Nikula             2016-01-26  1048  
a0d2642e9296882 drivers/spi/spi-pxa2xx.c Mika Westerberg           2013-01-22  1049  	if (is_lpss_ssp(drv_data)) {
1bed378c6b9116c drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-10  1050  		pxa2xx_spi_update(drv_data, SSIRF, GENMASK(7, 0), chip->lpss_rx_threshold);
1bed378c6b9116c drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-10  1051  		pxa2xx_spi_update(drv_data, SSITF, GENMASK(15, 0), chip->lpss_tx_threshold);
a0d2642e9296882 drivers/spi/spi-pxa2xx.c Mika Westerberg           2013-01-22  1052  	}
a0d2642e9296882 drivers/spi/spi-pxa2xx.c Mika Westerberg           2013-01-22  1053  
3fdb59cf10b020b drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-10  1054  	if (is_mrfld_ssp(drv_data)) {
70252440b2b6337 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-17  1055  		u32 mask = SFIFOTT_RFT | SFIFOTT_TFT;
3fdb59cf10b020b drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-10  1056  		u32 thresh = 0;
3fdb59cf10b020b drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-10  1057  
3fdb59cf10b020b drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-10  1058  		thresh |= SFIFOTT_RxThresh(chip->lpss_rx_threshold);
3fdb59cf10b020b drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-10  1059  		thresh |= SFIFOTT_TxThresh(chip->lpss_tx_threshold);
3fdb59cf10b020b drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-10  1060  
70252440b2b6337 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-17  1061  		pxa2xx_spi_update(drv_data, SFIFOTT, mask, thresh);
3fdb59cf10b020b drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-10  1062  	}
3fdb59cf10b020b drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-10  1063  
1bed378c6b9116c drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-10  1064  	if (is_quark_x1000_ssp(drv_data))
1bed378c6b9116c drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-10  1065  		pxa2xx_spi_update(drv_data, DDS_RATE, GENMASK(23, 0), chip->dds_rate);
e5262d0568dc9e1 drivers/spi/spi-pxa2xx.c Weike Chen                2014-11-26  1066  
0c8ccd8b267fc73 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-10  1067  	/* Stop the SSP */
0c8ccd8b267fc73 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-10  1068  	if (!is_mmp2_ssp(drv_data))
0c8ccd8b267fc73 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-10  1069  		pxa_ssp_disable(drv_data->ssp);
0c8ccd8b267fc73 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-10  1070  
0c8ccd8b267fc73 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-10  1071  	if (!pxa25x_ssp_comp(drv_data))
0c8ccd8b267fc73 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-10  1072  		pxa2xx_spi_write(drv_data, SSTO, chip->timeout);
0c8ccd8b267fc73 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-10  1073  
8083d6b812cac5e drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-17  1074  	/* First set CR1 without interrupt and service enables */
1bed378c6b9116c drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-10  1075  	pxa2xx_spi_update(drv_data, SSCR1, change_mask, cr1);
1bed378c6b9116c drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-10  1076  
8083d6b812cac5e drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-17  1077  	/* See if we need to reload the configuration registers */
1bed378c6b9116c drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-10  1078  	pxa2xx_spi_update(drv_data, SSCR0, GENMASK(31, 0), cr0);
b97c74bddce4e2c drivers/spi/pxa2xx_spi.c Ned Forrester             2008-02-23  1079  
0c8ccd8b267fc73 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-10  1080  	/* Restart the SSP */
0c8ccd8b267fc73 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-10  1081  	pxa_ssp_enable(drv_data->ssp);
0c8ccd8b267fc73 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-10  1082  
41c9884170c5401 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2020-02-27  1083  	if (is_mmp2_ssp(drv_data)) {
6d380132eaea536 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-10  1084  		u8 tx_level = read_SSSR_bits(drv_data, SSSR_TFL_MASK) >> 8;
82391856191878b drivers/spi/spi-pxa2xx.c Lubomir Rintel            2018-11-13  1085  
82391856191878b drivers/spi/spi-pxa2xx.c Lubomir Rintel            2018-11-13  1086  		if (tx_level) {
8083d6b812cac5e drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-17  1087  			/* On MMP2, flipping SSE doesn't to empty Tx FIFO. */
684a3ac720c3fd4 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-17  1088  			dev_warn(&spi->dev, "%u bytes of garbage in Tx FIFO!\n", tx_level);
82391856191878b drivers/spi/spi-pxa2xx.c Lubomir Rintel            2018-11-13  1089  			if (tx_level > transfer->len)
82391856191878b drivers/spi/spi-pxa2xx.c Lubomir Rintel            2018-11-13  1090  				tx_level = transfer->len;
82391856191878b drivers/spi/spi-pxa2xx.c Lubomir Rintel            2018-11-13  1091  			drv_data->tx += tx_level;
82391856191878b drivers/spi/spi-pxa2xx.c Lubomir Rintel            2018-11-13  1092  		}
82391856191878b drivers/spi/spi-pxa2xx.c Lubomir Rintel            2018-11-13  1093  	}
82391856191878b drivers/spi/spi-pxa2xx.c Lubomir Rintel            2018-11-13  1094  
60ba4431c8e8c13 drivers/spi/spi-pxa2xx.c Yang Yingliang            2023-08-18  1095  	if (spi_controller_is_target(controller)) {
ec93cb6f827b3e1 drivers/spi/spi-pxa2xx.c Lubomir Rintel            2018-11-13  1096  		while (drv_data->write(drv_data))
ec93cb6f827b3e1 drivers/spi/spi-pxa2xx.c Lubomir Rintel            2018-11-13  1097  			;
77d33897c68d567 drivers/spi/spi-pxa2xx.c Lubomir Rintel            2018-11-13  1098  		if (drv_data->gpiod_ready) {
77d33897c68d567 drivers/spi/spi-pxa2xx.c Lubomir Rintel            2018-11-13  1099  			gpiod_set_value(drv_data->gpiod_ready, 1);
77d33897c68d567 drivers/spi/spi-pxa2xx.c Lubomir Rintel            2018-11-13  1100  			udelay(1);
77d33897c68d567 drivers/spi/spi-pxa2xx.c Lubomir Rintel            2018-11-13  1101  			gpiod_set_value(drv_data->gpiod_ready, 0);
77d33897c68d567 drivers/spi/spi-pxa2xx.c Lubomir Rintel            2018-11-13  1102  		}
ec93cb6f827b3e1 drivers/spi/spi-pxa2xx.c Lubomir Rintel            2018-11-13  1103  	}
ec93cb6f827b3e1 drivers/spi/spi-pxa2xx.c Lubomir Rintel            2018-11-13  1104  
d5898e19c0d74cd drivers/spi/spi-pxa2xx.c Jarkko Nikula             2018-04-17  1105  	/*
d5898e19c0d74cd drivers/spi/spi-pxa2xx.c Jarkko Nikula             2018-04-17  1106  	 * Release the data by enabling service requests and interrupts,
8083d6b812cac5e drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-17  1107  	 * without changing any mode bits.
d5898e19c0d74cd drivers/spi/spi-pxa2xx.c Jarkko Nikula             2018-04-17  1108  	 */
c039dd275e88989 drivers/spi/spi-pxa2xx.c Jarkko Nikula             2014-12-18  1109  	pxa2xx_spi_write(drv_data, SSCR1, cr1);
d5898e19c0d74cd drivers/spi/spi-pxa2xx.c Jarkko Nikula             2018-04-17  1110  
d5898e19c0d74cd drivers/spi/spi-pxa2xx.c Jarkko Nikula             2018-04-17  1111  	return 1;
e0c9905e87ac1bc drivers/spi/pxa2xx_spi.c Stephen Street            2006-03-07  1112  }
e0c9905e87ac1bc drivers/spi/pxa2xx_spi.c Stephen Street            2006-03-07  1113  

:::::: The code at line 947 was first introduced by commit
:::::: 51eea52d26d4939b788b7244c28cf47e902b4c4c pxa2xx: replace spi_master with spi_controller

:::::: TO: Lubomir Rintel <lkundrak@v3.sk>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
