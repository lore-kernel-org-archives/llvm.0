Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8E98493;
	Fri, 23 Aug 2024 06:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724393303; cv=none; b=fgqifrQBGesr9I8uJuhJR55KMlXon+DgWUnojCZQee/UY6eibC4SpQF5szm5MwcyZdFKE+YfWUbCk6kJx7kXls6atx1CSP9s8IJctvz/JgaTyHbwNehRv/zXj7KukTSLh/7MX0R83nbSLBIxWor7v4y4sXsr0yobkjzzHxml4+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724393303; c=relaxed/simple;
	bh=nuW7tx4/IjV89ImKwJ1avhhAsAKVlzWLrgNRGKrLFSw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xw3Z3uNiqT+sHkp1PlQanhr1X+LZU5IWEqXJuSnD3yasWzwe2M3PW53Mmv5oLU/gjS0joDXynUL8TaXH62tSYqUvzVa7OwgdMd53XMtstM+0cNYpPkWG03HIpRImvYZow74NnCZvdGhgJsh6UxJASfBTT4trdFSkY7Rx0A4VAnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OGDfojq3; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OGDfojq3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724393301; x=1755929301;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nuW7tx4/IjV89ImKwJ1avhhAsAKVlzWLrgNRGKrLFSw=;
  b=OGDfojq36xrOnRqKM/2pxZL+uLWCS1YfLzefTJNbIBJEStKpX9KLrykQ
   F40IhUs8Jog/MoYSP9+3zaXW1wi/wULdzYmgy12zPtT3SXWPDzHoc3D9i
   nsRpqfQ2rX//vHsEmbnUsXn0Qcr/Gr2XSroCl0z9Pp8jBBb35V8JSRaiA
   8oUqaYn4rL/bV4P3xqvF9AhinjevzY3iA3vU/pbgGUJAMQGOlM8JCu0aU
   gDuWJJGpkB2P1ljAbfaI+DbZ43bTCVMTYWpcVyTYzspiJDXsy2xs8AR+c
   lORrjtnJqpawKdxpHUsYQfsbTtYXqVWavrKSgmRNCj5gOOA/Jy8Fbo9nP
   Q==;
X-CSE-ConnectionGUID: wcZJn5NLQOeapXqi383pGg==
X-CSE-MsgGUID: V5PnXyQaSPKEmyvlYXd3OA==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="23026894"
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; 
   d="scan'208";a="23026894"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 23:08:21 -0700
X-CSE-ConnectionGUID: X20f1s04R+eY2+169eaa9A==
X-CSE-MsgGUID: Q0gprOw5S3i07VzErslJ8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; 
   d="scan'208";a="66521739"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 22 Aug 2024 23:08:20 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shNT7-000DXM-0j;
	Fri, 23 Aug 2024 06:08:17 +0000
Date: Fri, 23 Aug 2024 14:08:00 +0800
From: kernel test robot <lkp@intel.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:file5cJeP2 19/22] drivers/spi/spi-stm32-qspi.c:787:20:
 warning: variable 'res' is uninitialized when used here
Message-ID: <202408231418.RS9DeHRU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git file5cJeP2
head:   bbdb9913983a8e0f5aa5b95b75fac9ad17c1e2b7
commit: 3415f0c34c0121dc2bb1fda6d79d5506fa055863 [19/22] spi: stm32-qspi: Simpify resource lookup
config: x86_64-buildonly-randconfig-004-20240823 (https://download.01.org/0day-ci/archive/20240823/202408231418.RS9DeHRU-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240823/202408231418.RS9DeHRU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408231418.RS9DeHRU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/spi/spi-stm32-qspi.c:787:20: warning: variable 'res' is uninitialized when used here [-Wuninitialized]
     787 |         qspi->phys_base = res->start;
         |                           ^~~
   drivers/spi/spi-stm32-qspi.c:773:22: note: initialize the variable 'res' to silence this warning
     773 |         struct resource *res;
         |                             ^
         |                              = NULL
   1 warning generated.


vim +/res +787 drivers/spi/spi-stm32-qspi.c

c530cd1d9d5e77 Ludovic Barre    2018-10-05  766  
c530cd1d9d5e77 Ludovic Barre    2018-10-05  767  static int stm32_qspi_probe(struct platform_device *pdev)
c530cd1d9d5e77 Ludovic Barre    2018-10-05  768  {
c530cd1d9d5e77 Ludovic Barre    2018-10-05  769  	struct device *dev = &pdev->dev;
c530cd1d9d5e77 Ludovic Barre    2018-10-05  770  	struct spi_controller *ctrl;
c530cd1d9d5e77 Ludovic Barre    2018-10-05  771  	struct reset_control *rstc;
c530cd1d9d5e77 Ludovic Barre    2018-10-05  772  	struct stm32_qspi *qspi;
c530cd1d9d5e77 Ludovic Barre    2018-10-05  773  	struct resource *res;
c530cd1d9d5e77 Ludovic Barre    2018-10-05  774  	int ret, irq;
c530cd1d9d5e77 Ludovic Barre    2018-10-05  775  
d9ea4bcf244d93 Yang Yingliang   2023-11-28  776  	ctrl = devm_spi_alloc_host(dev, sizeof(*qspi));
c530cd1d9d5e77 Ludovic Barre    2018-10-05  777  	if (!ctrl)
c530cd1d9d5e77 Ludovic Barre    2018-10-05  778  		return -ENOMEM;
c530cd1d9d5e77 Ludovic Barre    2018-10-05  779  
c530cd1d9d5e77 Ludovic Barre    2018-10-05  780  	qspi = spi_controller_get_devdata(ctrl);
a88eceb17ac7e8 Ludovic Barre    2019-03-25  781  	qspi->ctrl = ctrl;
c530cd1d9d5e77 Ludovic Barre    2018-10-05  782  
3415f0c34c0121 Jinjie Ruan      2024-08-20  783  	qspi->io_base = devm_platform_ioremap_resource_byname(pdev, "qspi");
e4d63473d3110a Patrice Chotard  2022-01-17  784  	if (IS_ERR(qspi->io_base))
e4d63473d3110a Patrice Chotard  2022-01-17  785  		return PTR_ERR(qspi->io_base);
c530cd1d9d5e77 Ludovic Barre    2018-10-05  786  
245308c6217027 Ludovic Barre    2019-03-25 @787  	qspi->phys_base = res->start;
245308c6217027 Ludovic Barre    2019-03-25  788  
3415f0c34c0121 Jinjie Ruan      2024-08-20  789  	qspi->mm_base = devm_platform_ioremap_resource_byname(pdev, "qspi_mm");
e4d63473d3110a Patrice Chotard  2022-01-17  790  	if (IS_ERR(qspi->mm_base))
e4d63473d3110a Patrice Chotard  2022-01-17  791  		return PTR_ERR(qspi->mm_base);
c530cd1d9d5e77 Ludovic Barre    2018-10-05  792  
c530cd1d9d5e77 Ludovic Barre    2018-10-05  793  	qspi->mm_size = resource_size(res);
e4d63473d3110a Patrice Chotard  2022-01-17  794  	if (qspi->mm_size > STM32_QSPI_MAX_MMAP_SZ)
e4d63473d3110a Patrice Chotard  2022-01-17  795  		return -EINVAL;
c530cd1d9d5e77 Ludovic Barre    2018-10-05  796  
c530cd1d9d5e77 Ludovic Barre    2018-10-05  797  	irq = platform_get_irq(pdev, 0);
e4d63473d3110a Patrice Chotard  2022-01-17  798  	if (irq < 0)
e4d63473d3110a Patrice Chotard  2022-01-17  799  		return irq;
4b562de4e227db Fabien Dessenne  2019-04-24  800  
c530cd1d9d5e77 Ludovic Barre    2018-10-05  801  	ret = devm_request_irq(dev, irq, stm32_qspi_irq, 0,
c530cd1d9d5e77 Ludovic Barre    2018-10-05  802  			       dev_name(dev), qspi);
c530cd1d9d5e77 Ludovic Barre    2018-10-05  803  	if (ret) {
c530cd1d9d5e77 Ludovic Barre    2018-10-05  804  		dev_err(dev, "failed to request irq\n");
e4d63473d3110a Patrice Chotard  2022-01-17  805  		return ret;
c530cd1d9d5e77 Ludovic Barre    2018-10-05  806  	}
c530cd1d9d5e77 Ludovic Barre    2018-10-05  807  
c530cd1d9d5e77 Ludovic Barre    2018-10-05  808  	init_completion(&qspi->data_completion);
86d1c6bbae3212 Patrice Chotard  2021-05-18  809  	init_completion(&qspi->match_completion);
c530cd1d9d5e77 Ludovic Barre    2018-10-05  810  
c530cd1d9d5e77 Ludovic Barre    2018-10-05  811  	qspi->clk = devm_clk_get(dev, NULL);
e4d63473d3110a Patrice Chotard  2022-01-17  812  	if (IS_ERR(qspi->clk))
e4d63473d3110a Patrice Chotard  2022-01-17  813  		return PTR_ERR(qspi->clk);
c530cd1d9d5e77 Ludovic Barre    2018-10-05  814  
c530cd1d9d5e77 Ludovic Barre    2018-10-05  815  	qspi->clk_rate = clk_get_rate(qspi->clk);
e4d63473d3110a Patrice Chotard  2022-01-17  816  	if (!qspi->clk_rate)
e4d63473d3110a Patrice Chotard  2022-01-17  817  		return -EINVAL;
c530cd1d9d5e77 Ludovic Barre    2018-10-05  818  
c530cd1d9d5e77 Ludovic Barre    2018-10-05  819  	ret = clk_prepare_enable(qspi->clk);
c530cd1d9d5e77 Ludovic Barre    2018-10-05  820  	if (ret) {
c530cd1d9d5e77 Ludovic Barre    2018-10-05  821  		dev_err(dev, "can not enable the clock\n");
e4d63473d3110a Patrice Chotard  2022-01-17  822  		return ret;
c530cd1d9d5e77 Ludovic Barre    2018-10-05  823  	}
c530cd1d9d5e77 Ludovic Barre    2018-10-05  824  
c530cd1d9d5e77 Ludovic Barre    2018-10-05  825  	rstc = devm_reset_control_get_exclusive(dev, NULL);
8196f7bcc2adf2 Etienne Carriere 2020-02-03  826  	if (IS_ERR(rstc)) {
8196f7bcc2adf2 Etienne Carriere 2020-02-03  827  		ret = PTR_ERR(rstc);
8196f7bcc2adf2 Etienne Carriere 2020-02-03  828  		if (ret == -EPROBE_DEFER)
35700e221b18fa Patrice Chotard  2020-06-16  829  			goto err_clk_disable;
8196f7bcc2adf2 Etienne Carriere 2020-02-03  830  	} else {
c530cd1d9d5e77 Ludovic Barre    2018-10-05  831  		reset_control_assert(rstc);
c530cd1d9d5e77 Ludovic Barre    2018-10-05  832  		udelay(2);
c530cd1d9d5e77 Ludovic Barre    2018-10-05  833  		reset_control_deassert(rstc);
c530cd1d9d5e77 Ludovic Barre    2018-10-05  834  	}
c530cd1d9d5e77 Ludovic Barre    2018-10-05  835  
c530cd1d9d5e77 Ludovic Barre    2018-10-05  836  	qspi->dev = dev;
c530cd1d9d5e77 Ludovic Barre    2018-10-05  837  	platform_set_drvdata(pdev, qspi);
658606ff4cf680 Peter Ujfalusi   2019-12-12  838  	ret = stm32_qspi_dma_setup(qspi);
658606ff4cf680 Peter Ujfalusi   2019-12-12  839  	if (ret)
35700e221b18fa Patrice Chotard  2020-06-16  840  		goto err_dma_free;
658606ff4cf680 Peter Ujfalusi   2019-12-12  841  
c530cd1d9d5e77 Ludovic Barre    2018-10-05  842  	mutex_init(&qspi->lock);
c530cd1d9d5e77 Ludovic Barre    2018-10-05  843  
a557fca630cc6d Patrice Chotard  2022-08-23  844  	ctrl->mode_bits = SPI_RX_DUAL | SPI_RX_QUAD | SPI_TX_OCTAL
a557fca630cc6d Patrice Chotard  2022-08-23  845  		| SPI_TX_DUAL | SPI_TX_QUAD | SPI_RX_OCTAL;
c530cd1d9d5e77 Ludovic Barre    2018-10-05  846  	ctrl->setup = stm32_qspi_setup;
c530cd1d9d5e77 Ludovic Barre    2018-10-05  847  	ctrl->bus_num = -1;
c530cd1d9d5e77 Ludovic Barre    2018-10-05  848  	ctrl->mem_ops = &stm32_qspi_mem_ops;
a557fca630cc6d Patrice Chotard  2022-08-23  849  	ctrl->use_gpio_descriptors = true;
a557fca630cc6d Patrice Chotard  2022-08-23  850  	ctrl->transfer_one_message = stm32_qspi_transfer_one_message;
c530cd1d9d5e77 Ludovic Barre    2018-10-05  851  	ctrl->num_chipselect = STM32_QSPI_MAX_NORCHIP;
c530cd1d9d5e77 Ludovic Barre    2018-10-05  852  	ctrl->dev.of_node = dev->of_node;
c530cd1d9d5e77 Ludovic Barre    2018-10-05  853  
9d282c17b023a9 Patrice Chotard  2020-04-17  854  	pm_runtime_set_autosuspend_delay(dev, STM32_AUTOSUSPEND_DELAY);
9d282c17b023a9 Patrice Chotard  2020-04-17  855  	pm_runtime_use_autosuspend(dev);
9d282c17b023a9 Patrice Chotard  2020-04-17  856  	pm_runtime_set_active(dev);
9d282c17b023a9 Patrice Chotard  2020-04-17  857  	pm_runtime_enable(dev);
9d282c17b023a9 Patrice Chotard  2020-04-17  858  	pm_runtime_get_noresume(dev);
9d282c17b023a9 Patrice Chotard  2020-04-17  859  
d9ea4bcf244d93 Yang Yingliang   2023-11-28  860  	ret = spi_register_controller(ctrl);
9d282c17b023a9 Patrice Chotard  2020-04-17  861  	if (ret)
35700e221b18fa Patrice Chotard  2020-06-16  862  		goto err_pm_runtime_free;
9d282c17b023a9 Patrice Chotard  2020-04-17  863  
9d282c17b023a9 Patrice Chotard  2020-04-17  864  	pm_runtime_mark_last_busy(dev);
9d282c17b023a9 Patrice Chotard  2020-04-17  865  	pm_runtime_put_autosuspend(dev);
9d282c17b023a9 Patrice Chotard  2020-04-17  866  
c530cd1d9d5e77 Ludovic Barre    2018-10-05  867  	return 0;
c530cd1d9d5e77 Ludovic Barre    2018-10-05  868  
35700e221b18fa Patrice Chotard  2020-06-16  869  err_pm_runtime_free:
35700e221b18fa Patrice Chotard  2020-06-16  870  	pm_runtime_get_sync(qspi->dev);
35700e221b18fa Patrice Chotard  2020-06-16  871  	/* disable qspi */
35700e221b18fa Patrice Chotard  2020-06-16  872  	writel_relaxed(0, qspi->io_base + QSPI_CR);
35700e221b18fa Patrice Chotard  2020-06-16  873  	mutex_destroy(&qspi->lock);
35700e221b18fa Patrice Chotard  2020-06-16  874  	pm_runtime_put_noidle(qspi->dev);
35700e221b18fa Patrice Chotard  2020-06-16  875  	pm_runtime_disable(qspi->dev);
35700e221b18fa Patrice Chotard  2020-06-16  876  	pm_runtime_set_suspended(qspi->dev);
35700e221b18fa Patrice Chotard  2020-06-16  877  	pm_runtime_dont_use_autosuspend(qspi->dev);
35700e221b18fa Patrice Chotard  2020-06-16  878  err_dma_free:
35700e221b18fa Patrice Chotard  2020-06-16  879  	stm32_qspi_dma_free(qspi);
35700e221b18fa Patrice Chotard  2020-06-16  880  err_clk_disable:
35700e221b18fa Patrice Chotard  2020-06-16  881  	clk_disable_unprepare(qspi->clk);
3c0af1dd2fe78a Patrice Chotard  2019-10-04  882  
c530cd1d9d5e77 Ludovic Barre    2018-10-05  883  	return ret;
c530cd1d9d5e77 Ludovic Barre    2018-10-05  884  }
c530cd1d9d5e77 Ludovic Barre    2018-10-05  885  

:::::: The code at line 787 was first introduced by commit
:::::: 245308c6217027c0d7fc8c3cf2bf95858c704d7b spi: stm32-qspi: add dma support

:::::: TO: Ludovic Barre <ludovic.barre@st.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
