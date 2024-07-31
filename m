Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76751AC45E;
	Wed, 31 Jul 2024 11:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722424116; cv=none; b=IZMqeOgOf+x7y02pS324DSV2yA1z/pk49CCWpMesezsQG6nUuebEfM9MZ78jokjv1Jf4jBO9qJlyQwlQxQOd366Vdi6LeGI7FemFKXdeyZNwZRrvRf9eiBeLtmop0U24bpOnBgr+X4yUjagRVvc+kTTmkaHZTwvW4PbpuIH7kYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722424116; c=relaxed/simple;
	bh=y6qtanyWx1TVB15oV56gSWj6AB1wvopY4H9QetVaFiU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jEQF/Irsn4ZkcJV2WNyKE+fTrxsJAAZmXtZsXfL7AjHrgiG2mrOlb8erLyPGbBlli4P6iOCnVUEVlMn1P6hKC30iSazcoe4OMfDhgj+w0eMa3PBfv5hBZqjpuXanC32lR7/VvKx/wR7rhhClPtQKwq1l+h6tL13AiQ2Rdd4XRuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YR04M4Mx; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YR04M4Mx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722424114; x=1753960114;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y6qtanyWx1TVB15oV56gSWj6AB1wvopY4H9QetVaFiU=;
  b=YR04M4MxmbZ03xKiUI3r3jwFYFae1bXClUKeVj+7UfzmrFfyKibLmG5i
   v9HqYRnsdqfUTz08yLuHREg+WGSDRoZfIHUBLemiTD7CaTv5myQoIiOMX
   ghyjvorEwsOQX3/8ItRlJBPeOIp1xfvpcMm0JP70NzQ4WdsSNv6np+smv
   qEB7+zUDdvrQGTqQwHn9TsdaKgV5qZonQLc2HsZ8ddjE8WpVBvN4ZIDwj
   6jDtyGPH+7HZXP6lxDJUtubr6xVGI2ZCBcX5SSEaHyYiGlDo/Tjm8I2Kz
   u5Rw1fl5lnuZ6PVm+sZ5BZIE1/8VrTT04Z0uRG0Pz4KaEejlf3vMLS0QU
   A==;
X-CSE-ConnectionGUID: 0iJzEJPCTe+hMBmXrZsLAA==
X-CSE-MsgGUID: A+hBJGmCSgG6/rxFhVM13g==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="23209717"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="23209717"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 04:08:33 -0700
X-CSE-ConnectionGUID: b2iUf6cURBiww5U/ulDjEg==
X-CSE-MsgGUID: V2EH8PrmRImrsIlBY+kvNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="54707962"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 31 Jul 2024 04:08:32 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZ7C2-000uAQ-0U;
	Wed, 31 Jul 2024 11:08:30 +0000
Date: Wed, 31 Jul 2024 19:08:04 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/api-cleanups 36/36] drivers/soc/ti/knav_dma.c:605:11:
 warning: unused variable 'len'
Message-ID: <202407311827.C7LCJF8w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/api-cleanups
head:   55dff5ffdb04a96e8f78fc4708ffa4701b509a0c
commit: 55dff5ffdb04a96e8f78fc4708ffa4701b509a0c [36/36] More DT api cleanups
config: arm-randconfig-003-20240731 (https://download.01.org/0day-ci/archive/20240731/202407311827.C7LCJF8w-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project ccae7b461be339e717d02f99ac857cf0bc7d17fc)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240731/202407311827.C7LCJF8w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407311827.C7LCJF8w-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/soc/ti/knav_dma.c:15:
   In file included from include/linux/of_dma.h:14:
   In file included from include/linux/dmaengine.h:12:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/soc/ti/knav_dma.c:605:11: warning: unused variable 'len' [-Wunused-variable]
     605 |         int ret, len, num_chan = 0;
         |                  ^~~
   2 warnings generated.


vim +/len +605 drivers/soc/ti/knav_dma.c

88139ed0305835 Santosh Shilimkar 2014-03-30  599  
88139ed0305835 Santosh Shilimkar 2014-03-30  600  static int dma_init(struct device_node *cloud, struct device_node *dma_node)
88139ed0305835 Santosh Shilimkar 2014-03-30  601  {
88139ed0305835 Santosh Shilimkar 2014-03-30  602  	unsigned max_tx_chan, max_rx_chan, max_rx_flow, max_tx_sched;
88139ed0305835 Santosh Shilimkar 2014-03-30  603  	struct device_node *node = dma_node;
88139ed0305835 Santosh Shilimkar 2014-03-30  604  	struct knav_dma_device *dma;
88139ed0305835 Santosh Shilimkar 2014-03-30 @605  	int ret, len, num_chan = 0;
88139ed0305835 Santosh Shilimkar 2014-03-30  606  	resource_size_t size;
88139ed0305835 Santosh Shilimkar 2014-03-30  607  	u32 timeout;
88139ed0305835 Santosh Shilimkar 2014-03-30  608  	u32 i;
88139ed0305835 Santosh Shilimkar 2014-03-30  609  
88139ed0305835 Santosh Shilimkar 2014-03-30  610  	dma = devm_kzalloc(kdev->dev, sizeof(*dma), GFP_KERNEL);
88139ed0305835 Santosh Shilimkar 2014-03-30  611  	if (!dma) {
88139ed0305835 Santosh Shilimkar 2014-03-30  612  		dev_err(kdev->dev, "could not allocate driver mem\n");
88139ed0305835 Santosh Shilimkar 2014-03-30  613  		return -ENOMEM;
88139ed0305835 Santosh Shilimkar 2014-03-30  614  	}
88139ed0305835 Santosh Shilimkar 2014-03-30  615  	INIT_LIST_HEAD(&dma->list);
88139ed0305835 Santosh Shilimkar 2014-03-30  616  	INIT_LIST_HEAD(&dma->chan_list);
88139ed0305835 Santosh Shilimkar 2014-03-30  617  
55dff5ffdb04a9 Rob Herring (Arm  2024-07-30  618) 	ret = of_property_read_variable_u32_array(cloud, "ti,navigator-cloud-address",
55dff5ffdb04a9 Rob Herring (Arm  2024-07-30  619) 						  dma->qm_base_address, 1, DMA_MAX_QMS);
55dff5ffdb04a9 Rob Herring (Arm  2024-07-30  620) 	if (ret < 0) {
88139ed0305835 Santosh Shilimkar 2014-03-30  621  		dev_err(kdev->dev, "invalid navigator cloud addresses\n");
88139ed0305835 Santosh Shilimkar 2014-03-30  622  		return -ENODEV;
88139ed0305835 Santosh Shilimkar 2014-03-30  623  	}
55dff5ffdb04a9 Rob Herring (Arm  2024-07-30  624) 	dma->logical_queue_managers = ret;
88139ed0305835 Santosh Shilimkar 2014-03-30  625  
88139ed0305835 Santosh Shilimkar 2014-03-30  626  	dma->reg_global	 = pktdma_get_regs(dma, node, 0, &size);
1bb0b8b195d821 Miaoqian Lin      2021-12-14  627  	if (IS_ERR(dma->reg_global))
1bb0b8b195d821 Miaoqian Lin      2021-12-14  628  		return PTR_ERR(dma->reg_global);
88139ed0305835 Santosh Shilimkar 2014-03-30  629  	if (size < sizeof(struct reg_global)) {
88139ed0305835 Santosh Shilimkar 2014-03-30  630  		dev_err(kdev->dev, "bad size %pa for global regs\n", &size);
88139ed0305835 Santosh Shilimkar 2014-03-30  631  		return -ENODEV;
88139ed0305835 Santosh Shilimkar 2014-03-30  632  	}
88139ed0305835 Santosh Shilimkar 2014-03-30  633  
88139ed0305835 Santosh Shilimkar 2014-03-30  634  	dma->reg_tx_chan = pktdma_get_regs(dma, node, 1, &size);
1bb0b8b195d821 Miaoqian Lin      2021-12-14  635  	if (IS_ERR(dma->reg_tx_chan))
1bb0b8b195d821 Miaoqian Lin      2021-12-14  636  		return PTR_ERR(dma->reg_tx_chan);
88139ed0305835 Santosh Shilimkar 2014-03-30  637  
88139ed0305835 Santosh Shilimkar 2014-03-30  638  	max_tx_chan = size / sizeof(struct reg_chan);
88139ed0305835 Santosh Shilimkar 2014-03-30  639  	dma->reg_rx_chan = pktdma_get_regs(dma, node, 2, &size);
1bb0b8b195d821 Miaoqian Lin      2021-12-14  640  	if (IS_ERR(dma->reg_rx_chan))
1bb0b8b195d821 Miaoqian Lin      2021-12-14  641  		return PTR_ERR(dma->reg_rx_chan);
88139ed0305835 Santosh Shilimkar 2014-03-30  642  
88139ed0305835 Santosh Shilimkar 2014-03-30  643  	max_rx_chan = size / sizeof(struct reg_chan);
88139ed0305835 Santosh Shilimkar 2014-03-30  644  	dma->reg_tx_sched = pktdma_get_regs(dma, node, 3, &size);
1bb0b8b195d821 Miaoqian Lin      2021-12-14  645  	if (IS_ERR(dma->reg_tx_sched))
1bb0b8b195d821 Miaoqian Lin      2021-12-14  646  		return PTR_ERR(dma->reg_tx_sched);
88139ed0305835 Santosh Shilimkar 2014-03-30  647  
88139ed0305835 Santosh Shilimkar 2014-03-30  648  	max_tx_sched = size / sizeof(struct reg_tx_sched);
88139ed0305835 Santosh Shilimkar 2014-03-30  649  	dma->reg_rx_flow = pktdma_get_regs(dma, node, 4, &size);
1bb0b8b195d821 Miaoqian Lin      2021-12-14  650  	if (IS_ERR(dma->reg_rx_flow))
1bb0b8b195d821 Miaoqian Lin      2021-12-14  651  		return PTR_ERR(dma->reg_rx_flow);
88139ed0305835 Santosh Shilimkar 2014-03-30  652  
88139ed0305835 Santosh Shilimkar 2014-03-30  653  	max_rx_flow = size / sizeof(struct reg_rx_flow);
88139ed0305835 Santosh Shilimkar 2014-03-30  654  	dma->rx_priority = DMA_PRIO_DEFAULT;
88139ed0305835 Santosh Shilimkar 2014-03-30  655  	dma->tx_priority = DMA_PRIO_DEFAULT;
88139ed0305835 Santosh Shilimkar 2014-03-30  656  
82e46bf7178094 Rob Herring       2023-03-10  657  	dma->enable_all	= of_property_read_bool(node, "ti,enable-all");
82e46bf7178094 Rob Herring       2023-03-10  658  	dma->loopback	= of_property_read_bool(node, "ti,loop-back");
88139ed0305835 Santosh Shilimkar 2014-03-30  659  
88139ed0305835 Santosh Shilimkar 2014-03-30  660  	ret = of_property_read_u32(node, "ti,rx-retry-timeout", &timeout);
88139ed0305835 Santosh Shilimkar 2014-03-30  661  	if (ret < 0) {
88139ed0305835 Santosh Shilimkar 2014-03-30  662  		dev_dbg(kdev->dev, "unspecified rx timeout using value %d\n",
88139ed0305835 Santosh Shilimkar 2014-03-30  663  			DMA_RX_TIMEOUT_DEFAULT);
88139ed0305835 Santosh Shilimkar 2014-03-30  664  		timeout = DMA_RX_TIMEOUT_DEFAULT;
88139ed0305835 Santosh Shilimkar 2014-03-30  665  	}
88139ed0305835 Santosh Shilimkar 2014-03-30  666  
88139ed0305835 Santosh Shilimkar 2014-03-30  667  	dma->rx_timeout = timeout;
88139ed0305835 Santosh Shilimkar 2014-03-30  668  	dma->max_rx_chan = max_rx_chan;
88139ed0305835 Santosh Shilimkar 2014-03-30  669  	dma->max_rx_flow = max_rx_flow;
88139ed0305835 Santosh Shilimkar 2014-03-30  670  	dma->max_tx_chan = min(max_tx_chan, max_tx_sched);
88139ed0305835 Santosh Shilimkar 2014-03-30  671  	atomic_set(&dma->ref_count, 0);
88139ed0305835 Santosh Shilimkar 2014-03-30  672  	strcpy(dma->name, node->name);
88139ed0305835 Santosh Shilimkar 2014-03-30  673  	spin_lock_init(&dma->lock);
88139ed0305835 Santosh Shilimkar 2014-03-30  674  
88139ed0305835 Santosh Shilimkar 2014-03-30  675  	for (i = 0; i < dma->max_tx_chan; i++) {
88139ed0305835 Santosh Shilimkar 2014-03-30  676  		if (pktdma_init_chan(dma, DMA_MEM_TO_DEV, i) >= 0)
88139ed0305835 Santosh Shilimkar 2014-03-30  677  			num_chan++;
88139ed0305835 Santosh Shilimkar 2014-03-30  678  	}
88139ed0305835 Santosh Shilimkar 2014-03-30  679  
88139ed0305835 Santosh Shilimkar 2014-03-30  680  	for (i = 0; i < dma->max_rx_flow; i++) {
88139ed0305835 Santosh Shilimkar 2014-03-30  681  		if (pktdma_init_chan(dma, DMA_DEV_TO_MEM, i) >= 0)
88139ed0305835 Santosh Shilimkar 2014-03-30  682  			num_chan++;
88139ed0305835 Santosh Shilimkar 2014-03-30  683  	}
88139ed0305835 Santosh Shilimkar 2014-03-30  684  
88139ed0305835 Santosh Shilimkar 2014-03-30  685  	list_add_tail(&dma->list, &kdev->list);
88139ed0305835 Santosh Shilimkar 2014-03-30  686  
88139ed0305835 Santosh Shilimkar 2014-03-30  687  	/*
88139ed0305835 Santosh Shilimkar 2014-03-30  688  	 * For DSP software usecases or userpace transport software, setup all
88139ed0305835 Santosh Shilimkar 2014-03-30  689  	 * the DMA hardware resources.
88139ed0305835 Santosh Shilimkar 2014-03-30  690  	 */
88139ed0305835 Santosh Shilimkar 2014-03-30  691  	if (dma->enable_all) {
88139ed0305835 Santosh Shilimkar 2014-03-30  692  		atomic_inc(&dma->ref_count);
88139ed0305835 Santosh Shilimkar 2014-03-30  693  		knav_dma_hw_init(dma);
88139ed0305835 Santosh Shilimkar 2014-03-30  694  		dma_hw_enable_all(dma);
88139ed0305835 Santosh Shilimkar 2014-03-30  695  	}
88139ed0305835 Santosh Shilimkar 2014-03-30  696  
88139ed0305835 Santosh Shilimkar 2014-03-30  697  	dev_info(kdev->dev, "DMA %s registered %d logical channels, flows %d, tx chans: %d, rx chans: %d%s\n",
88139ed0305835 Santosh Shilimkar 2014-03-30  698  		dma->name, num_chan, dma->max_rx_flow,
88139ed0305835 Santosh Shilimkar 2014-03-30  699  		dma->max_tx_chan, dma->max_rx_chan,
88139ed0305835 Santosh Shilimkar 2014-03-30  700  		dma->loopback ? ", loopback" : "");
88139ed0305835 Santosh Shilimkar 2014-03-30  701  
88139ed0305835 Santosh Shilimkar 2014-03-30  702  	return 0;
88139ed0305835 Santosh Shilimkar 2014-03-30  703  }
88139ed0305835 Santosh Shilimkar 2014-03-30  704  

:::::: The code at line 605 was first introduced by commit
:::::: 88139ed030583557751e279968e13e892ae10825 soc: ti: add Keystone Navigator DMA support

:::::: TO: Santosh Shilimkar <santosh.shilimkar@ti.com>
:::::: CC: Santosh Shilimkar <santosh.shilimkar@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
