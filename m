Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4370C39CD00;
	Fri,  4 Sep 2026 23:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788566233; cv=none; b=mRpTJ8tkrgXThmsf8XcX8YTCCPx/AMmbnOFEp7iH5xZ7NmsM2gSoq1JtF/LaLyAnTQMK53f1aE8rr2qveJ8/b08cRZS6Wl7t3aby4kUOR1wkFLqZ0IxUQFNHmYmh3s5+3KXJLpCDNkdLBDa+qARCwNZOd4+mf7ylaWsTC4nfxc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788566233; c=relaxed/simple;
	bh=r9ckDQDE0p2dAjnTfE+QjGOmK3vt26tCZcQ6Bc3j/fI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=un9zQSz0xk/QXwhESXSoUUhgtsUx+b1l2XwLy9Hmip/3wn/dDxqdgoJmOgvcbbWEZutoY9tWneGa87XmnmfZrZtmMvACVVBOfO6HE3BtPNoUWLPkgdxT67W5Fe/8BZ3mJXP0L/sEERzsDadR6HH7RRBpHzHTf/gW9DWIAK0AQaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DKw0uewt; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DKw0uewt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788566231; x=1820102231;
  h=date:from:to:cc:subject:message-id;
  bh=r9ckDQDE0p2dAjnTfE+QjGOmK3vt26tCZcQ6Bc3j/fI=;
  b=DKw0uewtlMx0xGPKHepTnaYJaISmcp553xbhU/hgkqJea6qEn8rFP51a
   HLpgt1BVDqrE1hTKo3dYWuOh9niYJ+gkjbdg74IrglnzHT8n48eK+2zve
   YKKCy3Rn/vOEpFPkEK/caHsqRghat8sGTVjwcsx6vLdJBJtlY5KW63V+t
   ibYl24g83Wh3Hruw+f+Vsni96qRuHHQlmitGWOkW64QhAF0KeikqX+meW
   vdTs+urpfve4GVQs/kYGWIPQNq55ddLSD4+yTgr7grFZLW2KEPQdX8xGY
   SQ7Oz6NURLr9eurbqmxDb29jw7n0skah75l8+coFMWGLE881FcINsLe1q
   Q==;
X-CSE-ConnectionGUID: eyJoTOrBTye8aVReqs0zqg==
X-CSE-MsgGUID: PIdcGzECTc+9Poj7giFGMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="89194890"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="89194890"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 16:57:11 -0700
X-CSE-ConnectionGUID: 1I5d4De7Sku6rX5eV55Y7A==
X-CSE-MsgGUID: tyGhmzQ2RqaJKd9fOmmNmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="293666145"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 04 Sep 2026 16:57:08 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2dmL-00000000AFy-3FAS;
	Fri, 04 Sep 2026 23:57:05 +0000
Date: Sat, 05 Sep 2026 07:56:12 +0800
From: kernel test robot <lkp@intel.com>
To: Golla Nagendra <nagendra.golla@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@nxp.com>
Subject: [vkoul-dmaengine:next 16/37]
 drivers/dma/xilinx/zynqmp_dma.c:1169:1: warning: unused label
 'err_disable_pm'
Message-ID: <202609050735.pdIYc1un-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
head:   256b61fdc708cfa34a84266a2c9bea64f44c534d
commit: 3f30db282c28cc35a502aa1cec34fb642854b057 [16/37] dmaengine: zynqmp_dma: Fix chan probe/remove error handling
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260905/202609050735.pdIYc1un-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 0edd1b088cc36b4faee80358c925a91e16006258)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260905/202609050735.pdIYc1un-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609050735.pdIYc1un-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma/xilinx/zynqmp_dma.c:1169:1: warning: unused label 'err_disable_pm' [-Wunused-label]
    1169 | err_disable_pm:
         | ^~~~~~~~~~~~~~~
   1 warning generated.


vim +/err_disable_pm +1169 drivers/dma/xilinx/zynqmp_dma.c

64c6f7da8c2cab Kedareswara rao Appana 2017-12-07  1077  
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1078  /**
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1079   * zynqmp_dma_probe - Driver probe function
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1080   * @pdev: Pointer to the platform_device structure
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1081   *
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1082   * Return: '0' on success and failure value on error
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1083   */
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1084  static int zynqmp_dma_probe(struct platform_device *pdev)
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1085  {
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1086  	struct zynqmp_dma_device *zdev;
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1087  	struct dma_device *p;
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1088  	int ret;
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1089  
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1090  	zdev = devm_kzalloc(&pdev->dev, sizeof(*zdev), GFP_KERNEL);
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1091  	if (!zdev)
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1092  		return -ENOMEM;
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1093  
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1094  	zdev->dev = &pdev->dev;
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1095  	INIT_LIST_HEAD(&zdev->common.channels);
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1096  
e9f92b99990551 Harini Katakam         2023-03-16  1097  	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(44));
e9f92b99990551 Harini Katakam         2023-03-16  1098  	if (ret) {
e9f92b99990551 Harini Katakam         2023-03-16  1099  		dev_err(&pdev->dev, "DMA not available for address range\n");
e9f92b99990551 Harini Katakam         2023-03-16  1100  		return ret;
e9f92b99990551 Harini Katakam         2023-03-16  1101  	}
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1102  	dma_cap_set(DMA_MEMCPY, zdev->common.cap_mask);
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1103  
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1104  	p = &zdev->common;
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1105  	p->device_prep_dma_memcpy = zynqmp_dma_prep_memcpy;
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1106  	p->device_terminate_all = zynqmp_dma_device_terminate_all;
f2b816a1dfb8b4 Swati Agarwal          2022-09-15  1107  	p->device_synchronize = zynqmp_dma_synchronize;
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1108  	p->device_issue_pending = zynqmp_dma_issue_pending;
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1109  	p->device_alloc_chan_resources = zynqmp_dma_alloc_chan_resources;
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1110  	p->device_free_chan_resources = zynqmp_dma_free_chan_resources;
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1111  	p->device_tx_status = dma_cookie_status;
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1112  	p->device_config = zynqmp_dma_device_config;
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1113  	p->dev = &pdev->dev;
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1114  
64c6f7da8c2cab Kedareswara rao Appana 2017-12-07  1115  	zdev->clk_main = devm_clk_get(&pdev->dev, "clk_main");
5637abaab994a9 Michael Tretter        2021-08-26  1116  	if (IS_ERR(zdev->clk_main))
5637abaab994a9 Michael Tretter        2021-08-26  1117  		return dev_err_probe(&pdev->dev, PTR_ERR(zdev->clk_main),
5637abaab994a9 Michael Tretter        2021-08-26  1118  				     "main clock not found.\n");
64c6f7da8c2cab Kedareswara rao Appana 2017-12-07  1119  
64c6f7da8c2cab Kedareswara rao Appana 2017-12-07  1120  	zdev->clk_apb = devm_clk_get(&pdev->dev, "clk_apb");
5637abaab994a9 Michael Tretter        2021-08-26  1121  	if (IS_ERR(zdev->clk_apb))
5637abaab994a9 Michael Tretter        2021-08-26  1122  		return dev_err_probe(&pdev->dev, PTR_ERR(zdev->clk_apb),
5637abaab994a9 Michael Tretter        2021-08-26  1123  				     "apb clock not found.\n");
64c6f7da8c2cab Kedareswara rao Appana 2017-12-07  1124  
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1125  	platform_set_drvdata(pdev, zdev);
64c6f7da8c2cab Kedareswara rao Appana 2017-12-07  1126  	pm_runtime_set_autosuspend_delay(zdev->dev, ZDMA_PM_TIMEOUT);
64c6f7da8c2cab Kedareswara rao Appana 2017-12-07  1127  	pm_runtime_use_autosuspend(zdev->dev);
64c6f7da8c2cab Kedareswara rao Appana 2017-12-07  1128  	pm_runtime_enable(zdev->dev);
517a710ac8fe9c Radhey Shyam Pandey    2022-05-10  1129  	ret = pm_runtime_resume_and_get(zdev->dev);
517a710ac8fe9c Radhey Shyam Pandey    2022-05-10  1130  	if (ret < 0) {
517a710ac8fe9c Radhey Shyam Pandey    2022-05-10  1131  		dev_err(&pdev->dev, "device wakeup failed.\n");
517a710ac8fe9c Radhey Shyam Pandey    2022-05-10  1132  		pm_runtime_disable(zdev->dev);
517a710ac8fe9c Radhey Shyam Pandey    2022-05-10  1133  	}
64c6f7da8c2cab Kedareswara rao Appana 2017-12-07  1134  	if (!pm_runtime_enabled(zdev->dev)) {
64c6f7da8c2cab Kedareswara rao Appana 2017-12-07  1135  		ret = zynqmp_dma_runtime_resume(zdev->dev);
64c6f7da8c2cab Kedareswara rao Appana 2017-12-07  1136  		if (ret)
64c6f7da8c2cab Kedareswara rao Appana 2017-12-07  1137  			return ret;
64c6f7da8c2cab Kedareswara rao Appana 2017-12-07  1138  	}
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1139  
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1140  	ret = zynqmp_dma_chan_probe(zdev, pdev);
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1141  	if (ret) {
5637abaab994a9 Michael Tretter        2021-08-26  1142  		dev_err_probe(&pdev->dev, ret, "Probing channel failed\n");
3f30db282c28cc Golla Nagendra         2026-08-14  1143  		goto free_chan_resources;
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1144  	}
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1145  
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1146  	p->dst_addr_widths = BIT(zdev->chan->bus_width / 8);
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1147  	p->src_addr_widths = BIT(zdev->chan->bus_width / 8);
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1148  
9126518e0439bc Shravya Kumbham        2022-05-10  1149  	ret = dma_async_device_register(&zdev->common);
9126518e0439bc Shravya Kumbham        2022-05-10  1150  	if (ret) {
9126518e0439bc Shravya Kumbham        2022-05-10  1151  		dev_err(zdev->dev, "failed to register the dma device\n");
9126518e0439bc Shravya Kumbham        2022-05-10  1152  		goto free_chan_resources;
9126518e0439bc Shravya Kumbham        2022-05-10  1153  	}
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1154  
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1155  	ret = of_dma_controller_register(pdev->dev.of_node,
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1156  					 of_zynqmp_dma_xlate, zdev);
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1157  	if (ret) {
5637abaab994a9 Michael Tretter        2021-08-26  1158  		dev_err_probe(&pdev->dev, ret, "Unable to register DMA to DT\n");
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1159  		dma_async_device_unregister(&zdev->common);
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1160  		goto free_chan_resources;
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1161  	}
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1162  
64c6f7da8c2cab Kedareswara rao Appana 2017-12-07  1163  	pm_runtime_put_sync_autosuspend(zdev->dev);
64c6f7da8c2cab Kedareswara rao Appana 2017-12-07  1164  
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1165  	return 0;
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1166  
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1167  free_chan_resources:
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1168  	zynqmp_dma_chan_remove(zdev->chan);
64c6f7da8c2cab Kedareswara rao Appana 2017-12-07 @1169  err_disable_pm:
64c6f7da8c2cab Kedareswara rao Appana 2017-12-07  1170  	if (!pm_runtime_enabled(zdev->dev))
64c6f7da8c2cab Kedareswara rao Appana 2017-12-07  1171  		zynqmp_dma_runtime_suspend(zdev->dev);
64c6f7da8c2cab Kedareswara rao Appana 2017-12-07  1172  	pm_runtime_disable(zdev->dev);
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1173  	return ret;
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1174  }
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1175  

:::::: The code at line 1169 was first introduced by commit
:::::: 64c6f7da8c2cab6bcf9c04b2eb8ea9afca31c186 dmaengine: zynqmp_dma: Add runtime pm support

:::::: TO: Kedareswara rao Appana <appana.durga.rao@xilinx.com>
:::::: CC: Vinod Koul <vinod.koul@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
