Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA77EA1;
	Sat, 12 Aug 2023 02:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691808303; x=1723344303;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=19v3zaR/R42x9KUdyekK6wggLHlvloniLGaAy/6x6fM=;
  b=TeUDE8guXcs52LoqQ4Vv9GburfKPL/bRRayL5UPwagz1xRiJmWzLumZr
   Uobj7LyG2DvsU0GM5KbWEiK+RD7ub09ZjgUHdWUX2FY+EoBrx1bJAccrd
   uiDZhRuwLcxmEYMtsMeNmzU0+eIyuQJ8nit26c+/hjRm2E4AQWwdWnEh/
   rVtmcJniYGNB8Cl0Mtl3tGPGJIVKiRun1HLxpKW66/SzVk5D6Vhcrpjlm
   pVv02Q7tAzDBY5IkojaGzSxdxc2YTtpn9FjctFwauKGgKm4cpFZzOz3uU
   pN2dA8ApkRnQgPBzQWQuwuKovAhvjm/g5IAVrD7IZsdNNQGBE0zZXBuXB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="458167831"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="458167831"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 19:45:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="762380106"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="762380106"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 11 Aug 2023 19:45:00 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUecd-0008Cu-34;
	Sat, 12 Aug 2023 02:44:59 +0000
Date: Sat, 12 Aug 2023 10:44:55 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davejiang:cxl-ide 15/24]
 drivers/staging/media/rkvdec/rkvdec.c:1035:46: warning: implicit conversion
 from 'unsigned long long' to 'unsigned int' changes value from
 18446744073709551615 to 4294967295
Message-ID: <202308121025.P9XAT2bj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davejiang/linux.git cxl-ide
head:   5e3487a17fbf6e33d8ddd60444073ff0bc59b35e
commit: 6908950a8afc72c0e7e4131658994a3cd384c95c [15/24] pci: Add basic support for discovery of IDE on PCIe device
config: mips-randconfig-r034-20230812 (https://download.01.org/0day-ci/archive/20230812/202308121025.P9XAT2bj-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308121025.P9XAT2bj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308121025.P9XAT2bj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/staging/media/rkvdec/rkvdec.c:23:
   In file included from include/media/v4l2-mem2mem.h:16:
   In file included from include/media/videobuf2-v4l2.h:16:
   In file included from include/media/videobuf2-core.h:20:
   In file included from include/media/media-request.h:20:
   In file included from include/media/media-device.h:16:
   include/linux/pci.h:352:12: warning: declaration of 'enum pci_ide_stream_type' will not be visible outside of this function [-Wvisibility]
     352 |                                          enum pci_ide_stream_type type)
         |                                               ^
   include/linux/pci.h:352:32: error: variable has incomplete type 'enum pci_ide_stream_type'
     352 |                                          enum pci_ide_stream_type type)
         |                                                                   ^
   include/linux/pci.h:352:12: note: forward declaration of 'enum pci_ide_stream_type'
     352 |                                          enum pci_ide_stream_type type)
         |                                               ^
>> drivers/staging/media/rkvdec/rkvdec.c:1035:46: warning: implicit conversion from 'unsigned long long' to 'unsigned int' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
    1035 |         vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~             ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:40: note: expanded from macro 'DMA_BIT_MASK'
      77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                        ^~~~~
   2 warnings and 1 error generated.


vim +1035 drivers/staging/media/rkvdec/rkvdec.c

cd33c830448baf Boris Brezillon 2020-04-04   996  
cd33c830448baf Boris Brezillon 2020-04-04   997  static int rkvdec_probe(struct platform_device *pdev)
cd33c830448baf Boris Brezillon 2020-04-04   998  {
cd33c830448baf Boris Brezillon 2020-04-04   999  	struct rkvdec_dev *rkvdec;
cd33c830448baf Boris Brezillon 2020-04-04  1000  	unsigned int i;
cd33c830448baf Boris Brezillon 2020-04-04  1001  	int ret, irq;
cd33c830448baf Boris Brezillon 2020-04-04  1002  
cd33c830448baf Boris Brezillon 2020-04-04  1003  	rkvdec = devm_kzalloc(&pdev->dev, sizeof(*rkvdec), GFP_KERNEL);
cd33c830448baf Boris Brezillon 2020-04-04  1004  	if (!rkvdec)
cd33c830448baf Boris Brezillon 2020-04-04  1005  		return -ENOMEM;
cd33c830448baf Boris Brezillon 2020-04-04  1006  
cd33c830448baf Boris Brezillon 2020-04-04  1007  	platform_set_drvdata(pdev, rkvdec);
cd33c830448baf Boris Brezillon 2020-04-04  1008  	rkvdec->dev = &pdev->dev;
cd33c830448baf Boris Brezillon 2020-04-04  1009  	mutex_init(&rkvdec->vdev_lock);
cd33c830448baf Boris Brezillon 2020-04-04  1010  	INIT_DELAYED_WORK(&rkvdec->watchdog_work, rkvdec_watchdog_func);
cd33c830448baf Boris Brezillon 2020-04-04  1011  
cd33c830448baf Boris Brezillon 2020-04-04  1012  	rkvdec->clocks = devm_kcalloc(&pdev->dev, ARRAY_SIZE(rkvdec_clk_names),
cd33c830448baf Boris Brezillon 2020-04-04  1013  				      sizeof(*rkvdec->clocks), GFP_KERNEL);
cd33c830448baf Boris Brezillon 2020-04-04  1014  	if (!rkvdec->clocks)
cd33c830448baf Boris Brezillon 2020-04-04  1015  		return -ENOMEM;
cd33c830448baf Boris Brezillon 2020-04-04  1016  
cd33c830448baf Boris Brezillon 2020-04-04  1017  	for (i = 0; i < ARRAY_SIZE(rkvdec_clk_names); i++)
cd33c830448baf Boris Brezillon 2020-04-04  1018  		rkvdec->clocks[i].id = rkvdec_clk_names[i];
cd33c830448baf Boris Brezillon 2020-04-04  1019  
cd33c830448baf Boris Brezillon 2020-04-04  1020  	ret = devm_clk_bulk_get(&pdev->dev, ARRAY_SIZE(rkvdec_clk_names),
cd33c830448baf Boris Brezillon 2020-04-04  1021  				rkvdec->clocks);
cd33c830448baf Boris Brezillon 2020-04-04  1022  	if (ret)
cd33c830448baf Boris Brezillon 2020-04-04  1023  		return ret;
cd33c830448baf Boris Brezillon 2020-04-04  1024  
5a3683d60e56f4 Cai Huoqing     2021-09-08  1025  	rkvdec->regs = devm_platform_ioremap_resource(pdev, 0);
cd33c830448baf Boris Brezillon 2020-04-04  1026  	if (IS_ERR(rkvdec->regs))
cd33c830448baf Boris Brezillon 2020-04-04  1027  		return PTR_ERR(rkvdec->regs);
cd33c830448baf Boris Brezillon 2020-04-04  1028  
cd33c830448baf Boris Brezillon 2020-04-04  1029  	ret = dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
cd33c830448baf Boris Brezillon 2020-04-04  1030  	if (ret) {
cd33c830448baf Boris Brezillon 2020-04-04  1031  		dev_err(&pdev->dev, "Could not set DMA coherent mask.\n");
cd33c830448baf Boris Brezillon 2020-04-04  1032  		return ret;
cd33c830448baf Boris Brezillon 2020-04-04  1033  	}
cd33c830448baf Boris Brezillon 2020-04-04  1034  
cd33c830448baf Boris Brezillon 2020-04-04 @1035  	vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
cd33c830448baf Boris Brezillon 2020-04-04  1036  
cd33c830448baf Boris Brezillon 2020-04-04  1037  	irq = platform_get_irq(pdev, 0);
121ca877c1e870 YueHaibing      2020-09-09  1038  	if (irq <= 0)
cd33c830448baf Boris Brezillon 2020-04-04  1039  		return -ENXIO;
cd33c830448baf Boris Brezillon 2020-04-04  1040  
cd33c830448baf Boris Brezillon 2020-04-04  1041  	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
cd33c830448baf Boris Brezillon 2020-04-04  1042  					rkvdec_irq_handler, IRQF_ONESHOT,
cd33c830448baf Boris Brezillon 2020-04-04  1043  					dev_name(&pdev->dev), rkvdec);
cd33c830448baf Boris Brezillon 2020-04-04  1044  	if (ret) {
cd33c830448baf Boris Brezillon 2020-04-04  1045  		dev_err(&pdev->dev, "Could not request vdec IRQ\n");
cd33c830448baf Boris Brezillon 2020-04-04  1046  		return ret;
cd33c830448baf Boris Brezillon 2020-04-04  1047  	}
cd33c830448baf Boris Brezillon 2020-04-04  1048  
cd33c830448baf Boris Brezillon 2020-04-04  1049  	pm_runtime_set_autosuspend_delay(&pdev->dev, 100);
cd33c830448baf Boris Brezillon 2020-04-04  1050  	pm_runtime_use_autosuspend(&pdev->dev);
cd33c830448baf Boris Brezillon 2020-04-04  1051  	pm_runtime_enable(&pdev->dev);
cd33c830448baf Boris Brezillon 2020-04-04  1052  
cd33c830448baf Boris Brezillon 2020-04-04  1053  	ret = rkvdec_v4l2_init(rkvdec);
cd33c830448baf Boris Brezillon 2020-04-04  1054  	if (ret)
cd33c830448baf Boris Brezillon 2020-04-04  1055  		goto err_disable_runtime_pm;
cd33c830448baf Boris Brezillon 2020-04-04  1056  
cd33c830448baf Boris Brezillon 2020-04-04  1057  	return 0;
cd33c830448baf Boris Brezillon 2020-04-04  1058  
cd33c830448baf Boris Brezillon 2020-04-04  1059  err_disable_runtime_pm:
cd33c830448baf Boris Brezillon 2020-04-04  1060  	pm_runtime_dont_use_autosuspend(&pdev->dev);
cd33c830448baf Boris Brezillon 2020-04-04  1061  	pm_runtime_disable(&pdev->dev);
cd33c830448baf Boris Brezillon 2020-04-04  1062  	return ret;
cd33c830448baf Boris Brezillon 2020-04-04  1063  }
cd33c830448baf Boris Brezillon 2020-04-04  1064  

:::::: The code at line 1035 was first introduced by commit
:::::: cd33c830448baf7b1e94da72eca069e3e1d050c9 media: rkvdec: Add the rkvdec driver

:::::: TO: Boris Brezillon <boris.brezillon@collabora.com>
:::::: CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
