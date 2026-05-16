Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394161A681E;
	Sat, 16 May 2026 03:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778902397; cv=none; b=BeJ3YvCqP7fTLU/jEH0C3uK7FcV+PkqXAjsBChUx4EPKmZOid1ILKP0lddDG1yYn8zI3hwIULmA0UvQbVoslk8Sk1ZH9cy5NoIrgwliyiadjTRAxs2TUMnRLwte4UXS0Jm7sLxbem4b5M85MxmIvaOfkVJ+QLefIFGG99XqoTZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778902397; c=relaxed/simple;
	bh=J6QkQWcAP4Uh7NJdpHT3ihlcB7L9QSmkwCM2bn6LNjw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NZWojIqWkVi7Rs9atqJFU0ZG1MdvRamSP4T0NF3OCRXwVeCJEmOb7T35+W9t/luLTvmbcmFoOcCuXgyahe4icICOOjXm2hRGv1bHPxDvji/VtrOnOlaRSQEKgKj13u9SEXac0ajRhpZ8OOdVFDA88YvlLXkjKmRhAzTi/Grehlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=emeaDxZO; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="emeaDxZO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778902395; x=1810438395;
  h=date:from:to:cc:subject:message-id;
  bh=J6QkQWcAP4Uh7NJdpHT3ihlcB7L9QSmkwCM2bn6LNjw=;
  b=emeaDxZOz1az/AfiCbrwjAUQos8zmcsAZrZiept3h2bJOeEVz/8OFRXu
   W3qVbNC6/gcWTWxSGj9dOk+t84lpOsUTXhFvBzhlboRys2WEREVBUV5d+
   Wk13fw1PFO7NLd3+Vj2LXLrEcjACYEU0UWLazPR7PBslGf7tAB9awgg7u
   f27VzJmR9TWvJr+gkcQQlNjNAg0NM1+7NSDG79r3prnPqL1DIIyRzCnXP
   ybei9+YZlS8hJZGaoUyC/5ciMA+xULCdBEOSXOtKaKhcobc+N3ePrWWjo
   RIXLTt6Qbp+EYtVJ7BXBVSwkULpVw3HUZCR5MpXQMBFSl9BprNVDIrCbG
   A==;
X-CSE-ConnectionGUID: GkLrHpSrQf6vzeBYXhsP8w==
X-CSE-MsgGUID: SCYFs4pbSzSyfX7rOnbULg==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="102527695"
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="102527695"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 20:33:15 -0700
X-CSE-ConnectionGUID: VuO9vVz4TFCdCrdLBTlITg==
X-CSE-MsgGUID: 3QVwKYO/ROq05EBwsuCGnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="234436554"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 15 May 2026 20:33:13 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wO5m2-000000000Qr-3V2r;
	Sat, 16 May 2026 03:33:10 +0000
Date: Sat, 16 May 2026 11:32:25 +0800
From: kernel test robot <lkp@intel.com>
To: "Chen-Yu Tsai" <wens@csie.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [wens:sunxi-wip 21/29] drivers/mmc/host/sunxi-mmc.c:1517:4:
 error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202605161159.T5FePjlf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git sunxi-wip
head:   1cdb4d4846ffaddce6d648dbbfcdcca78f8a0bcc
commit: 2abb9ce9741414211f8e0a2e94cfbedc4f08e613 [21/29] WIP: mmc: sunxi: tuning
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260516/202605161159.T5FePjlf-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605161159.T5FePjlf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605161159.T5FePjlf-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/mmc/host/sunxi-mmc.c:1517:4: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1517 |                         FIELD_GET(GENMASK(23, 16), val),
         |                         ^
>> drivers/mmc/host/sunxi-mmc.c:1517:4: warning: format specifies type 'unsigned long' but the argument has type 'int' [-Wformat]
    1516 |                 dev_info(&pdev->dev, "host version: %lu.%lu.%lu\n",
         |                                                     ~~~
         |                                                     %d
    1517 |                         FIELD_GET(GENMASK(23, 16), val),
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:160:67: note: expanded from macro 'dev_info'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                  ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   drivers/mmc/host/sunxi-mmc.c:1518:4: warning: format specifies type 'unsigned long' but the argument has type 'int' [-Wformat]
    1516 |                 dev_info(&pdev->dev, "host version: %lu.%lu.%lu\n",
         |                                                         ~~~
         |                                                         %d
    1517 |                         FIELD_GET(GENMASK(23, 16), val),
    1518 |                         FIELD_GET(GENMASK(15, 8), val),
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:160:67: note: expanded from macro 'dev_info'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                  ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   drivers/mmc/host/sunxi-mmc.c:1519:4: warning: format specifies type 'unsigned long' but the argument has type 'int' [-Wformat]
    1516 |                 dev_info(&pdev->dev, "host version: %lu.%lu.%lu\n",
         |                                                             ~~~
         |                                                             %d
    1517 |                         FIELD_GET(GENMASK(23, 16), val),
    1518 |                         FIELD_GET(GENMASK(15, 8), val),
    1519 |                         FIELD_GET(GENMASK(7, 0), val));
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:160:67: note: expanded from macro 'dev_info'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                  ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   3 warnings and 1 error generated.


vim +/FIELD_GET +1517 drivers/mmc/host/sunxi-mmc.c

  1414	
  1415	static int sunxi_mmc_probe(struct platform_device *pdev)
  1416	{
  1417		struct sunxi_mmc_host *host;
  1418		struct mmc_host *mmc;
  1419		u32 val;
  1420		int ret;
  1421	
  1422		mmc = devm_mmc_alloc_host(&pdev->dev, sizeof(*host));
  1423		if (!mmc)
  1424			return dev_err_probe(&pdev->dev, -ENOMEM,
  1425					     "mmc alloc host failed\n");
  1426		platform_set_drvdata(pdev, mmc);
  1427	
  1428		host = mmc_priv(mmc);
  1429		host->dev = &pdev->dev;
  1430		host->mmc = mmc;
  1431		spin_lock_init(&host->lock);
  1432	
  1433		ret = sunxi_mmc_resource_request(host, pdev);
  1434		if (ret)
  1435			return ret;
  1436	
  1437		host->sg_cpu = dma_alloc_coherent(&pdev->dev, PAGE_SIZE,
  1438						  &host->sg_dma, GFP_KERNEL);
  1439		if (!host->sg_cpu)
  1440			return dev_err_probe(&pdev->dev, -ENOMEM,
  1441					     "Failed to allocate DMA descriptor mem\n");
  1442	
  1443		if (host->cfg->ccu_has_timings_switch) {
  1444			/*
  1445			 * Supports both old and new timing modes.
  1446			 * Try setting the clk to new timing mode.
  1447			 */
  1448			sunxi_ccu_set_mmc_timing_mode(host->clk_mmc, true);
  1449	
  1450			/* And check the result */
  1451			ret = sunxi_ccu_get_mmc_timing_mode(host->clk_mmc);
  1452			if (ret < 0) {
  1453				/*
  1454				 * For whatever reason we were not able to get
  1455				 * the current active mode. Default to old mode.
  1456				 */
  1457				dev_warn(&pdev->dev, "MMC clk timing mode unknown\n");
  1458				host->use_new_timings = false;
  1459			} else {
  1460				host->use_new_timings = !!ret;
  1461			}
  1462		} else if (host->cfg->needs_new_timings) {
  1463			/* Supports new timing mode only */
  1464			host->use_new_timings = true;
  1465		}
  1466	
  1467		mmc->ops		= &sunxi_mmc_ops;
  1468		mmc->max_blk_count	= 8192;
  1469		mmc->max_blk_size	= 4096;
  1470		mmc->max_segs		= PAGE_SIZE / sizeof(struct sunxi_idma_des);
  1471		mmc->max_seg_size	= (1 << host->cfg->idma_des_size_bits);
  1472		mmc->max_req_size	= mmc->max_seg_size * mmc->max_segs;
  1473		/* 400kHz ~ 52MHz */
  1474		mmc->f_min		=   400000;
  1475		mmc->f_max		= 52000000;
  1476		mmc->caps	       |= MMC_CAP_MMC_HIGHSPEED | MMC_CAP_SD_HIGHSPEED |
  1477					  MMC_CAP_SDIO_IRQ;
  1478	
  1479		/*
  1480		 * Some H5 devices do not have signal traces precise enough to
  1481		 * use HS DDR mode for their eMMC chips.
  1482		 *
  1483		 * We still enable HS DDR modes for all the other controller
  1484		 * variants that support them.
  1485		 */
  1486		if ((host->cfg->clk_delays || host->use_new_timings) &&
  1487		    !of_device_is_compatible(pdev->dev.of_node,
  1488					     "allwinner,sun50i-h5-emmc"))
  1489			mmc->caps      |= MMC_CAP_1_8V_DDR | MMC_CAP_3_3V_DDR;
  1490	
  1491		ret = mmc_of_parse(mmc);
  1492		if (ret)
  1493			goto error_free_dma;
  1494	
  1495		/*
  1496		 * If we don't support delay chains in the SoC, we can't use any
  1497		 * of the higher speed modes. Mask them out in case the device
  1498		 * tree specifies the properties for them, which gets added to
  1499		 * the caps by mmc_of_parse() above.
  1500		 */
  1501		if (!(host->cfg->clk_delays || host->use_new_timings)) {
  1502			mmc->caps &= ~(MMC_CAP_3_3V_DDR | MMC_CAP_1_8V_DDR |
  1503				       MMC_CAP_1_2V_DDR | MMC_CAP_UHS);
  1504			mmc->caps2 &= ~MMC_CAP2_HS200;
  1505		}
  1506	
  1507		/* TODO: This driver doesn't support HS400 mode yet */
  1508		mmc->caps2 &= ~MMC_CAP2_HS400;
  1509	
  1510		ret = sunxi_mmc_init_host(host);
  1511		if (ret)
  1512			goto error_free_dma;
  1513	
  1514		val = mmc_readl(host, REG_VER_SMCV) & SDXC_VER_MASK;
  1515		if (val)
  1516			dev_info(&pdev->dev, "host version: %lu.%lu.%lu\n",
> 1517				FIELD_GET(GENMASK(23, 16), val),
  1518				FIELD_GET(GENMASK(15, 8), val),
  1519				FIELD_GET(GENMASK(7, 0), val));
  1520	
  1521		pm_runtime_set_active(&pdev->dev);
  1522		pm_runtime_set_autosuspend_delay(&pdev->dev, 50);
  1523		pm_runtime_use_autosuspend(&pdev->dev);
  1524		pm_runtime_enable(&pdev->dev);
  1525	
  1526		ret = mmc_add_host(mmc);
  1527		if (ret)
  1528			goto error_free_dma;
  1529	
  1530		dev_info(&pdev->dev, "initialized, max. request size: %u KB%s\n",
  1531			 mmc->max_req_size >> 10,
  1532			 host->use_new_timings ? ", uses new timings mode" : "");
  1533	
  1534		return 0;
  1535	
  1536	error_free_dma:
  1537		dma_free_coherent(&pdev->dev, PAGE_SIZE, host->sg_cpu, host->sg_dma);
  1538		return ret;
  1539	}
  1540	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
