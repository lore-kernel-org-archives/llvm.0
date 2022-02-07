Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B38C2F2C
	for <llvm@lists.linux.dev>; Mon,  7 Feb 2022 23:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644275761; x=1675811761;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LpbdMOw/ynDpNQZaG/JaQqdPYIwPqFYDZVB+UUWy8CA=;
  b=fs7McX5nDYQAk9OpEVHIQ+5wYlxIjAlLi3cdGRhW4fy257B6ag3UCZGb
   LiV+oOapDjCP/SWFN79YqBQ0UalWyjDhWVNpKlUPe5sF0rmSXtV6S9cLj
   qHqfPd5GGnWOMubVptBe9MOPHufB4JrUDjmkqynTOA4KIz+UtNqPD+7sR
   Qic9tzZzax150U+NMaV6GcX+1ETnXIce7KdK4gfxqj4FjiAhA2lNMB1mq
   v38kVX9XFpxPG958zHz5kj1Ijy+SUs/nuktWaIJxlliC83NuaUVzJQVCC
   sbvmWHgB3FXirgwn0XoLalfv/9JMOsLFe6ZA+1/1eShiWhbI+PwcdI95p
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="236233258"
X-IronPort-AV: E=Sophos;i="5.88,351,1635231600"; 
   d="scan'208";a="236233258"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2022 15:16:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,351,1635231600"; 
   d="scan'208";a="525316153"
Received: from lkp-server01.sh.intel.com (HELO 9dd77a123018) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 07 Feb 2022 15:15:59 -0800
Received: from kbuild by 9dd77a123018 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nHDEl-00015R-8f; Mon, 07 Feb 2022 23:15:59 +0000
Date: Tue, 8 Feb 2022 07:15:46 +0800
From: kernel test robot <lkp@intel.com>
To: Li-hao Kuo <lhjeff911@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH next] spi: Modify irq request position and modify
 parameters
Message-ID: <202202080613.XIxdHpD0-lkp@intel.com>
References: <a94e3b123773fe303221d2bd2e4ce36ffa905a1c.1644198957.git.lhjeff911@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a94e3b123773fe303221d2bd2e4ce36ffa905a1c.1644198957.git.lhjeff911@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Li-hao,

I love your patch! Perhaps something to improve:

[auto build test WARNING on next-20220204]

url:    https://github.com/0day-ci/linux/commits/Li-hao-Kuo/spi-Modify-irq-request-position-and-modify-parameters/20220207-095850
base:    ef6b35306dd8f15a7e5e5a2532e665917a43c5d9
config: x86_64-buildonly-randconfig-r001-20220207 (https://download.01.org/0day-ci/archive/20220208/202202080613.XIxdHpD0-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0d8850ae2cae85d49bea6ae0799fa41c7202c05c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/5c25f7d844a49fd90f5f830136a1423a51dfa3e6
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Li-hao-Kuo/spi-Modify-irq-request-position-and-modify-parameters/20220207-095850
        git checkout 5c25f7d844a49fd90f5f830136a1423a51dfa3e6
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/spi/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/spi/spi-sunplus-sp7021.c:405:2: warning: variable 'ret' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
           default:
           ^~~~~~~
   drivers/spi/spi-sunplus-sp7021.c:414:9: note: uninitialized use occurs here
           return ret;
                  ^~~
   drivers/spi/spi-sunplus-sp7021.c:378:15: note: initialize the variable 'ret' to silence this warning
           int mode, ret;
                        ^
                         = 0
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OMAP_GPMC
   Depends on MEMORY && OF_ADDRESS
   Selected by
   - MTD_NAND_OMAP2 && MTD && MTD_RAW_NAND && (ARCH_OMAP2PLUS || ARCH_KEYSTONE || ARCH_K3 || COMPILE_TEST && HAS_IOMEM


vim +/ret +405 drivers/spi/spi-sunplus-sp7021.c

f62ca4e2a86303 Li-hao Kuo 2022-01-18  372  
f62ca4e2a86303 Li-hao Kuo 2022-01-18  373  static int sp7021_spi_slave_transfer_one(struct spi_controller *ctlr, struct spi_device *spi,
f62ca4e2a86303 Li-hao Kuo 2022-01-18  374  				       struct spi_transfer *xfer)
f62ca4e2a86303 Li-hao Kuo 2022-01-18  375  {
f62ca4e2a86303 Li-hao Kuo 2022-01-18  376  	struct sp7021_spi_ctlr *pspim = spi_master_get_devdata(ctlr);
f62ca4e2a86303 Li-hao Kuo 2022-01-18  377  	struct device *dev = pspim->dev;
5c25f7d844a49f Li-hao Kuo 2022-02-07  378  	int mode, ret;
f62ca4e2a86303 Li-hao Kuo 2022-01-18  379  
f62ca4e2a86303 Li-hao Kuo 2022-01-18  380  	mode = SP7021_SPI_IDLE;
f62ca4e2a86303 Li-hao Kuo 2022-01-18  381  	if (xfer->tx_buf && xfer->rx_buf) {
f62ca4e2a86303 Li-hao Kuo 2022-01-18  382  		dev_dbg(&ctlr->dev, "%s() wrong command\n", __func__);
5c25f7d844a49f Li-hao Kuo 2022-02-07  383  		return -EINVAL;
f62ca4e2a86303 Li-hao Kuo 2022-01-18  384  	} else if (xfer->tx_buf) {
f62ca4e2a86303 Li-hao Kuo 2022-01-18  385  		xfer->tx_dma = dma_map_single(dev, (void *)xfer->tx_buf,
f62ca4e2a86303 Li-hao Kuo 2022-01-18  386  					      xfer->len, DMA_TO_DEVICE);
f62ca4e2a86303 Li-hao Kuo 2022-01-18  387  		if (dma_mapping_error(dev, xfer->tx_dma))
f62ca4e2a86303 Li-hao Kuo 2022-01-18  388  			return -ENOMEM;
f62ca4e2a86303 Li-hao Kuo 2022-01-18  389  		mode = SP7021_SLAVE_WRITE;
f62ca4e2a86303 Li-hao Kuo 2022-01-18  390  	} else if (xfer->rx_buf) {
f62ca4e2a86303 Li-hao Kuo 2022-01-18  391  		xfer->rx_dma = dma_map_single(dev, xfer->rx_buf, xfer->len,
f62ca4e2a86303 Li-hao Kuo 2022-01-18  392  					      DMA_FROM_DEVICE);
f62ca4e2a86303 Li-hao Kuo 2022-01-18  393  		if (dma_mapping_error(dev, xfer->rx_dma))
f62ca4e2a86303 Li-hao Kuo 2022-01-18  394  			return -ENOMEM;
f62ca4e2a86303 Li-hao Kuo 2022-01-18  395  		mode = SP7021_SLAVE_READ;
f62ca4e2a86303 Li-hao Kuo 2022-01-18  396  	}
f62ca4e2a86303 Li-hao Kuo 2022-01-18  397  
f62ca4e2a86303 Li-hao Kuo 2022-01-18  398  	switch (mode) {
f62ca4e2a86303 Li-hao Kuo 2022-01-18  399  	case SP7021_SLAVE_WRITE:
f62ca4e2a86303 Li-hao Kuo 2022-01-18  400  		ret = sp7021_spi_slave_tx(spi, xfer);
f62ca4e2a86303 Li-hao Kuo 2022-01-18  401  		break;
f62ca4e2a86303 Li-hao Kuo 2022-01-18  402  	case SP7021_SLAVE_READ:
f62ca4e2a86303 Li-hao Kuo 2022-01-18  403  		ret = sp7021_spi_slave_rx(spi, xfer);
f62ca4e2a86303 Li-hao Kuo 2022-01-18  404  		break;
f62ca4e2a86303 Li-hao Kuo 2022-01-18 @405  	default:
f62ca4e2a86303 Li-hao Kuo 2022-01-18  406  		break;
f62ca4e2a86303 Li-hao Kuo 2022-01-18  407  	}
f62ca4e2a86303 Li-hao Kuo 2022-01-18  408  	if (xfer->tx_buf)
f62ca4e2a86303 Li-hao Kuo 2022-01-18  409  		dma_unmap_single(dev, xfer->tx_dma, xfer->len, DMA_TO_DEVICE);
f62ca4e2a86303 Li-hao Kuo 2022-01-18  410  	if (xfer->rx_buf)
f62ca4e2a86303 Li-hao Kuo 2022-01-18  411  		dma_unmap_single(dev, xfer->rx_dma, xfer->len, DMA_FROM_DEVICE);
f62ca4e2a86303 Li-hao Kuo 2022-01-18  412  
f62ca4e2a86303 Li-hao Kuo 2022-01-18  413  	spi_finalize_current_transfer(ctlr);
f62ca4e2a86303 Li-hao Kuo 2022-01-18  414  	return ret;
f62ca4e2a86303 Li-hao Kuo 2022-01-18  415  }
f62ca4e2a86303 Li-hao Kuo 2022-01-18  416  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
