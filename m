Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9ED5357D01;
	Tue, 12 May 2026 20:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778618168; cv=none; b=XVw7II1R7lbanYS/hUYr6k5Dr0iKtBWn6PUrXc0YhcNEpQuWz5+e+rZrgmF5Yws7xzBaXvEqgFvUrexodeRsKX+YoKddmew1Q3gNgsRj5t0qL/A034ld9nDHn1hrm3hxGhPcV184c7RK/5TfR99GDhZmat6e/wHvWLNlFBpIpjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778618168; c=relaxed/simple;
	bh=MAQUfWCGat2CdlNNO+7QVDQAfSUxmX4SIYSgFexdvHg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Aia6JtveVCXHzasctvxbOYPPLaJn35tlq20ExVDhG6y0NepfxLvluEIruEKSpRTMJ6tCbIB7kSf08EzYplEArA8YehPbbx8tRSbbGAJYVg4r+8ewVjVkMdslenwoZnaL5ygywTP7QaQUaobm+LU6Y/1x7fLkwupLswGiXfcRREs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b7FahFTf; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b7FahFTf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778618167; x=1810154167;
  h=date:from:to:cc:subject:message-id;
  bh=MAQUfWCGat2CdlNNO+7QVDQAfSUxmX4SIYSgFexdvHg=;
  b=b7FahFTfPYiWgJElVhYLae/sxt7DJhtZYvQIj8O1jV3MQUhV3xldDRBF
   K4lkIZ44vOE4jNAr6L+E401bdT74hQAlQDWYYFn4mXvrpRb4id7HIFH7R
   wEf3EWuuciJHFAkczH0CpEEGOVM9UFbWxgoeT5XfhIZruF91lZR+661jW
   ESy2TLGWLbVuBX2SzDhDV0klL8LgPApECtUXAR/BygH6pujW5ta5LuWF2
   hiTJqvUsKPoH3YpIe0NhjgR8KfD8lEONH20OaTyXKuZQoGzBNGpn72pGi
   qHse3EeXE5A6Xno/S7zvEFeMsZTcD/5f9hr7ZsQibZbZJVNraMP6iB3HK
   w==;
X-CSE-ConnectionGUID: BY9NB0z8SumkmCqPi+TR3w==
X-CSE-MsgGUID: +BpmFOgnQU+0/vJE97i0kA==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="82107083"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="82107083"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 13:36:06 -0700
X-CSE-ConnectionGUID: P/j+gx4GRGiYnAJ9XpPdmw==
X-CSE-MsgGUID: Sx2cr8hpTVSeJDlu/GLL2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="233406535"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 May 2026 13:36:04 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMtph-000000002mf-3U1C;
	Tue, 12 May 2026 20:36:01 +0000
Date: Wed, 13 May 2026 04:35:37 +0800
From: kernel test robot <lkp@intel.com>
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Felix Fietkau <nbd@nbd.name>
Subject: [nbd168-wireless:mt76 5/5]
 drivers/net/wireless/mediatek/mt76/mt7921/pci.c:347:6: warning: variable
 'dev' is used uninitialized whenever 'if' condition is true
Message-ID: <202605130432.S8Ozipm2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/nbd168/wireless mt76
head:   e9aeddfe98ebccd3761ac7dd316af4fb5de1c28a
commit: e9aeddfe98ebccd3761ac7dd316af4fb5de1c28a [5/5] wifi: mt76: mt7921: fix resource leak in probe error path
config: arm64-randconfig-002-20260513 (https://download.01.org/0day-ci/archive/20260513/202605130432.S8Ozipm2-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605130432.S8Ozipm2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605130432.S8Ozipm2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/mediatek/mt76/mt7921/pci.c:347:6: warning: variable 'dev' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     347 |         if (IS_ERR(regs)) {
         |             ^~~~~~~~~~~~
   drivers/net/wireless/mediatek/mt76/mt7921/pci.c:438:20: note: uninitialized use occurs here
     438 |         mt76_free_device(&dev->mt76);
         |                           ^~~
   drivers/net/wireless/mediatek/mt76/mt7921/pci.c:347:2: note: remove the 'if' if its condition is always false
     347 |         if (IS_ERR(regs)) {
         |         ^~~~~~~~~~~~~~~~~~~
     348 |                 ret = PTR_ERR(regs);
         |                 ~~~~~~~~~~~~~~~~~~~~
     349 |                 goto err_free_dev;
         |                 ~~~~~~~~~~~~~~~~~~
     350 |         }
         |         ~
   drivers/net/wireless/mediatek/mt76/mt7921/pci.c:302:24: note: initialize the variable 'dev' to silence this warning
     302 |         struct mt792x_dev *dev;
         |                               ^
         |                                = NULL
   1 warning generated.


vim +347 drivers/net/wireless/mediatek/mt76/mt7921/pci.c

   257	
   258	static int mt7921_pci_probe(struct pci_dev *pdev,
   259				    const struct pci_device_id *id)
   260	{
   261		static const struct mt76_driver_ops drv_ops = {
   262			/* txwi_size = txd size + txp size */
   263			.txwi_size = MT_TXD_SIZE + sizeof(struct mt76_connac_hw_txp),
   264			.drv_flags = MT_DRV_TXWI_NO_FREE | MT_DRV_HW_MGMT_TXQ |
   265				     MT_DRV_AMSDU_OFFLOAD,
   266			.survey_flags = SURVEY_INFO_TIME_TX |
   267					SURVEY_INFO_TIME_RX |
   268					SURVEY_INFO_TIME_BSS_RX,
   269			.token_size = MT7921_TOKEN_SIZE,
   270			.tx_prepare_skb = mt7921e_tx_prepare_skb,
   271			.tx_complete_skb = mt76_connac_tx_complete_skb,
   272			.rx_check = mt7921_rx_check,
   273			.rx_skb = mt7921_queue_rx_skb,
   274			.rx_poll_complete = mt792x_rx_poll_complete,
   275			.sta_add = mt7921_mac_sta_add,
   276			.sta_event = mt7921_mac_sta_event,
   277			.sta_remove = mt7921_mac_sta_remove,
   278			.update_survey = mt792x_update_channel,
   279			.set_channel = mt7921_set_channel,
   280		};
   281		static const struct mt792x_hif_ops mt7921_pcie_ops = {
   282			.init_reset = mt7921e_init_reset,
   283			.reset = mt7921e_mac_reset,
   284			.mcu_init = mt7921e_mcu_init,
   285			.drv_own = mt792xe_mcu_drv_pmctrl,
   286			.fw_own = mt792xe_mcu_fw_pmctrl,
   287		};
   288		static const struct mt792x_irq_map irq_map = {
   289			.host_irq_enable = MT_WFDMA0_HOST_INT_ENA,
   290			.tx = {
   291				.all_complete_mask = MT_INT_TX_DONE_ALL,
   292				.mcu_complete_mask = MT_INT_TX_DONE_MCU,
   293			},
   294			.rx = {
   295				.data_complete_mask = MT_INT_RX_DONE_DATA,
   296				.wm_complete_mask = MT_INT_RX_DONE_WM,
   297				.wm2_complete_mask = MT_INT_RX_DONE_WM2,
   298			},
   299		};
   300		struct ieee80211_ops *ops;
   301		struct mt76_bus_ops *bus_ops;
   302		struct mt792x_dev *dev;
   303		struct mt76_dev *mdev;
   304		void __iomem *regs;
   305		u16 cmd, chipid;
   306		u8 features;
   307		int ret;
   308	
   309		ret = pcim_enable_device(pdev);
   310		if (ret)
   311			return ret;
   312	
   313		pci_read_config_word(pdev, PCI_COMMAND, &cmd);
   314		if (!(cmd & PCI_COMMAND_MEMORY)) {
   315			cmd |= PCI_COMMAND_MEMORY;
   316			pci_write_config_word(pdev, PCI_COMMAND, cmd);
   317		}
   318		pci_set_master(pdev);
   319	
   320		ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_ALL_TYPES);
   321		if (ret < 0)
   322			return ret;
   323	
   324		ret = dma_set_mask(&pdev->dev, DMA_BIT_MASK(32));
   325		if (ret)
   326			goto err_free_pci_vec;
   327	
   328		if (mt7921_disable_aspm)
   329			mt76_pci_disable_aspm(pdev);
   330	
   331		ops = mt792x_get_mac80211_ops(&pdev->dev, &mt7921_ops,
   332					      (void *)id->driver_data, &features);
   333		if (!ops) {
   334			ret = -ENOMEM;
   335			goto err_free_pci_vec;
   336		}
   337	
   338		mdev = mt76_alloc_device(&pdev->dev, sizeof(*dev), ops, &drv_ops);
   339		if (!mdev) {
   340			ret = -ENOMEM;
   341			goto err_free_pci_vec;
   342		}
   343	
   344		pci_set_drvdata(pdev, mdev);
   345	
   346		regs =  pcim_iomap_region(pdev, 0, pci_name(pdev));
 > 347		if (IS_ERR(regs)) {
   348			ret = PTR_ERR(regs);
   349			goto err_free_dev;
   350		}
   351	
   352		dev = container_of(mdev, struct mt792x_dev, mt76);
   353		dev->fw_features = features;
   354		dev->hif_ops = &mt7921_pcie_ops;
   355		dev->irq_map = &irq_map;
   356		mt76_mmio_init(&dev->mt76, regs);
   357	
   358		if (id->device == 0x7902) {
   359			struct mt792x_irq_map *map;
   360	
   361			/* MT7902 needs a mutable copy because wm2_complete_mask differs */
   362			map = devm_kmemdup(&pdev->dev, &irq_map,
   363					   sizeof(irq_map), GFP_KERNEL);
   364			if (!map) {
   365				ret = -ENOMEM;
   366				goto err_free_dev;
   367			}
   368	
   369			map->rx.wm2_complete_mask = 0;
   370			dev->irq_map = map;
   371		}
   372	
   373		tasklet_init(&mdev->irq_tasklet, mt792x_irq_tasklet, (unsigned long)dev);
   374	
   375		dev->phy.dev = dev;
   376		dev->phy.mt76 = &dev->mt76.phy;
   377		dev->mt76.phy.priv = &dev->phy;
   378		dev->bus_ops = dev->mt76.bus;
   379		bus_ops = devm_kmemdup(dev->mt76.dev, dev->bus_ops, sizeof(*bus_ops),
   380				       GFP_KERNEL);
   381		if (!bus_ops) {
   382			ret = -ENOMEM;
   383			goto err_free_dev;
   384		}
   385	
   386		bus_ops->rr = mt7921_rr;
   387		bus_ops->wr = mt7921_wr;
   388		bus_ops->rmw = mt7921_rmw;
   389		dev->mt76.bus = bus_ops;
   390	
   391		if (!mt7921_disable_aspm && mt76_pci_aspm_supported(pdev))
   392			dev->aspm_supported = true;
   393	
   394		ret = mt792xe_mcu_fw_pmctrl(dev);
   395		if (ret)
   396			goto err_free_dev;
   397	
   398		ret = __mt792xe_mcu_drv_pmctrl(dev);
   399		if (ret)
   400			goto err_free_dev;
   401	
   402		chipid = mt7921_l1_rr(dev, MT_HW_CHIPID);
   403		if (chipid == 0x7961 && (mt7921_l1_rr(dev, MT_HW_BOUND) & BIT(7)))
   404			chipid = 0x7920;
   405		mdev->rev = (chipid << 16) |
   406			    (mt7921_l1_rr(dev, MT_HW_REV) & 0xff);
   407		dev_info(mdev->dev, "ASIC revision: %04x\n", mdev->rev);
   408	
   409		ret = mt792x_wfsys_reset(dev);
   410		if (ret)
   411			goto err_free_dev;
   412	
   413		mt76_wr(dev, irq_map.host_irq_enable, 0);
   414	
   415		mt76_wr(dev, MT_PCIE_MAC_INT_ENABLE, 0xff);
   416	
   417		ret = devm_request_irq(mdev->dev, pdev->irq, mt792x_irq_handler,
   418				       IRQF_SHARED, KBUILD_MODNAME, dev);
   419		if (ret)
   420			goto err_free_dev;
   421	
   422		ret = mt7921_dma_init(dev);
   423		if (ret)
   424			goto err_free_irq;
   425	
   426		ret = mt7921_register_device(dev);
   427		if (ret)
   428			goto err_free_irq;
   429	
   430		if (of_property_read_bool(dev->mt76.dev->of_node, "wakeup-source"))
   431			device_init_wakeup(dev->mt76.dev, true);
   432	
   433		return 0;
   434	
   435	err_free_irq:
   436		devm_free_irq(&pdev->dev, pdev->irq, dev);
   437	err_free_dev:
   438		mt76_free_device(&dev->mt76);
   439	err_free_pci_vec:
   440		pci_free_irq_vectors(pdev);
   441	
   442		return ret;
   443	}
   444	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
