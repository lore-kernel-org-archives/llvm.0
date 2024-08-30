Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912E314D2B5;
	Fri, 30 Aug 2024 19:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725047137; cv=none; b=il4/qFkLm/jgFXzjtU9YKIjKqBamQu2qPOaWgrK9UKCNhouqhRd0YrQ3qkIIA2GwhEmtwd4QauBLzwvvfQ/Tzov4trMfGI3HN5HH4dNQU0aE885Fh0XUe+eOFneB6Q9vjJhV0f9xj+BRO34dOAWwZEzbcL/RuNXfviFzmddqiZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725047137; c=relaxed/simple;
	bh=SD344OCCD7LX+LnQktBzXM0IesSTX5xz4IYqA0W677o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BKeCiZY81VDVO/FkPfSUZxE9W4zXpauojMriQKZ3khfBFU3CnYE6GM3ZtM2CS4yCIQ+NWkSy7A+0RIKnrBbgwai8WWuydCyLfogrP4zPvUd2keTLT+gJReBSKH4mkX7o97YiWHKr14vicCsuXcZFjY3Lm4Fwue8r+k9u/NC+u8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l3o0VwO4; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l3o0VwO4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725047135; x=1756583135;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SD344OCCD7LX+LnQktBzXM0IesSTX5xz4IYqA0W677o=;
  b=l3o0VwO4q4Y2rcnpxbQOZ9qUL0c2YiUQstGkImHVek/bhYDVq+iemkOM
   yJw/SPJOFcK1hGeMnD0KOSMkNeRnrvDsjXkzf0FzLdBXh6aaIu7QuJD6j
   TojkdwfTamkfyWeN/yfecrigrzf/OPSVdaG4Jzpm5Gfk69DBEA7AAsSew
   j6YhpRKgvw0w2TjLKefSuTnBjhN3uScIoHux5VuWBtDV0cHKHeH4fYeg5
   HKinn2lQetyCkB+L+EAPtHh62jaR4oDjDVynL7noUjjuD3LliSNr1uI7E
   hc+xcNALEa7rRAe1qrRdmffYVsmUzLO4nM5StR/hEi6XYOF7yHrYl3qL5
   Q==;
X-CSE-ConnectionGUID: LgvTlU4HSF2QIv1JXUZ4sA==
X-CSE-MsgGUID: og6l8CY9QfG4czsPYgx95A==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="27580607"
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; 
   d="scan'208";a="27580607"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 12:45:34 -0700
X-CSE-ConnectionGUID: zp9lMq2ST3O6xTGC07iISw==
X-CSE-MsgGUID: wV7XJOQOREmCNteBPmCicQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; 
   d="scan'208";a="68881756"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 30 Aug 2024 12:45:33 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sk7Yp-00020J-0l;
	Fri, 30 Aug 2024 19:45:31 +0000
Date: Sat, 31 Aug 2024 03:44:51 +0800
From: kernel test robot <lkp@intel.com>
To: Yang Ruibin <11162571@vivo.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>
Subject: [broonie-misc:spi-6.12 23/30] drivers/spi/spi-pxa2xx-pci.c:149:15:
 warning: variable 'dma_dev' is uninitialized when used here
Message-ID: <202408310358.XuRCuDQE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git spi-6.12
head:   e3de1d8deb9f6429356eb81118aa1601c8a5a1b6
commit: 8a0ec8c2d736961ff556e9d331decda9048fe0f1 [23/30] spi: Insert the missing pci_dev_put()before return
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240831/202408310358.XuRCuDQE-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240831/202408310358.XuRCuDQE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408310358.XuRCuDQE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/spi/spi-pxa2xx-pci.c:149:15: warning: variable 'dma_dev' is uninitialized when used here [-Wuninitialized]
     149 |                 pci_dev_put(dma_dev);
         |                             ^~~~~~~
   drivers/spi/spi-pxa2xx-pci.c:99:25: note: initialize the variable 'dma_dev' to silence this warning
      99 |         struct pci_dev *dma_dev;
         |                                ^
         |                                 = NULL
   drivers/spi/spi-pxa2xx-pci.c:227:15: warning: variable 'dma_dev' is uninitialized when used here [-Wuninitialized]
     227 |                 pci_dev_put(dma_dev);
         |                             ^~~~~~~
   drivers/spi/spi-pxa2xx-pci.c:197:25: note: initialize the variable 'dma_dev' to silence this warning
     197 |         struct pci_dev *dma_dev;
         |                                ^
         |                                 = NULL
   2 warnings generated.


vim +/dma_dev +149 drivers/spi/spi-pxa2xx-pci.c

    94	
    95	static int lpss_spi_setup(struct pci_dev *dev, struct pxa2xx_spi_controller *c)
    96	{
    97		struct ssp_device *ssp = &c->ssp;
    98		struct dw_dma_slave *tx, *rx;
    99		struct pci_dev *dma_dev;
   100		int ret;
   101	
   102		switch (dev->device) {
   103		case PCI_DEVICE_ID_INTEL_BYT:
   104			ssp->type = LPSS_BYT_SSP;
   105			ssp->port_id = 0;
   106			c->tx_param = &byt_tx_param;
   107			c->rx_param = &byt_rx_param;
   108			break;
   109		case PCI_DEVICE_ID_INTEL_BSW0:
   110			ssp->type = LPSS_BSW_SSP;
   111			ssp->port_id = 0;
   112			c->tx_param = &bsw0_tx_param;
   113			c->rx_param = &bsw0_rx_param;
   114			break;
   115		case PCI_DEVICE_ID_INTEL_BSW1:
   116			ssp->type = LPSS_BSW_SSP;
   117			ssp->port_id = 1;
   118			c->tx_param = &bsw1_tx_param;
   119			c->rx_param = &bsw1_rx_param;
   120			break;
   121		case PCI_DEVICE_ID_INTEL_BSW2:
   122			ssp->type = LPSS_BSW_SSP;
   123			ssp->port_id = 2;
   124			c->tx_param = &bsw2_tx_param;
   125			c->rx_param = &bsw2_rx_param;
   126			break;
   127		case PCI_DEVICE_ID_INTEL_LPT0_0:
   128		case PCI_DEVICE_ID_INTEL_LPT1_0:
   129			ssp->type = LPSS_LPT_SSP;
   130			ssp->port_id = 0;
   131			c->tx_param = &lpt0_tx_param;
   132			c->rx_param = &lpt0_rx_param;
   133			break;
   134		case PCI_DEVICE_ID_INTEL_LPT0_1:
   135		case PCI_DEVICE_ID_INTEL_LPT1_1:
   136			ssp->type = LPSS_LPT_SSP;
   137			ssp->port_id = 1;
   138			c->tx_param = &lpt1_tx_param;
   139			c->rx_param = &lpt1_rx_param;
   140			break;
   141		default:
   142			return -ENODEV;
   143		}
   144	
   145		c->num_chipselect = 1;
   146	
   147		ret = pxa2xx_spi_pci_clk_register(dev, ssp, 50000000);
   148		if (ret) {
 > 149			pci_dev_put(dma_dev);
   150			return ret;
   151		}
   152	
   153		dma_dev = pci_get_slot(dev->bus, PCI_DEVFN(PCI_SLOT(dev->devfn), 0));
   154		ret = devm_add_action_or_reset(&dev->dev, lpss_dma_put_device, dma_dev);
   155		if (ret)
   156			return ret;
   157	
   158		tx = c->tx_param;
   159		tx->dma_dev = &dma_dev->dev;
   160		tx->m_master = 0;
   161		tx->p_master = 1;
   162	
   163		rx = c->rx_param;
   164		rx->dma_dev = &dma_dev->dev;
   165		rx->m_master = 0;
   166		rx->p_master = 1;
   167	
   168		c->dma_filter = lpss_dma_filter;
   169		c->dma_burst_size = 1;
   170		c->enable_dma = 1;
   171		return 0;
   172	}
   173	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
