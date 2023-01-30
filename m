Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE6A746A;
	Mon, 30 Jan 2023 19:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675105341; x=1706641341;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o/Fi4ON9DbW8xf/M36MJtHLcM8afCwYtNSUUB8rmGQ0=;
  b=nDZdNWM84w+jpjijvDavWXx7EMgWb9IPVmTiunj0smlSTrPDDOXEFnK5
   bqGhEg5YM9JD/lQhUQNxQmJQ8JFe0yBRLn4rpRg9OnNHEcJGMtfE/KEph
   cJKwiJaWl7CkVc8ubdVnzRmPHYEtlwrgAQ3NMAiZ7wnEHZCCnNnvfBfXN
   nqFDY9m1jp3CUAW7oGxJ/9FV753POJivD8XsC1EYZzzVx9pWqnMgVz8kX
   pf4QAD1hPfCZ6MALdFFaJHysaKDi1KCNYAkwk4RvhqkS3fJ2tTdp+GWKQ
   /n22HQxVoK8nWqyPjdv823BaZMYmab0zi9Go2vYorbATFr8vSLrMTfYFq
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="327666601"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; 
   d="scan'208";a="327666601"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 11:02:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="727602350"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; 
   d="scan'208";a="727602350"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 30 Jan 2023 11:02:17 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMZQ0-0003qC-2E;
	Mon, 30 Jan 2023 19:02:16 +0000
Date: Tue, 31 Jan 2023 03:01:40 +0800
From: kernel test robot <lkp@intel.com>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Thierry Reding <treding@nvidia.com>
Subject: [linux-next:master 7468/9183] drivers/gpu/host1x/dev.c:520:6:
 warning: variable 'syncpt_irq' is uninitialized when used here
Message-ID: <202301310227.SeMvYeta-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ae0c77e1bc6963c67c6c09e8c72959fcb1ed8d5f
commit: 625d4ffb438cacc9b1ebaa48748cdc7171587cdc [7468/9183] gpu: host1x: Rewrite syncpoint interrupt handling
config: arm64-randconfig-r011-20230129 (https://download.01.org/0day-ci/archive/20230131/202301310227.SeMvYeta-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=625d4ffb438cacc9b1ebaa48748cdc7171587cdc
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 625d4ffb438cacc9b1ebaa48748cdc7171587cdc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/host1x/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/host1x/dev.c:520:6: warning: variable 'syncpt_irq' is uninitialized when used here [-Wuninitialized]
           if (syncpt_irq < 0)
               ^~~~~~~~~~
   drivers/gpu/host1x/dev.c:490:16: note: initialize the variable 'syncpt_irq' to silence this warning
           int syncpt_irq;
                         ^
                          = 0
   1 warning generated.


vim +/syncpt_irq +520 drivers/gpu/host1x/dev.c

6b6776e2ab8ac7 Dmitry Osipenko     2021-12-01  486  
754716874389cc Terje Bergstrom     2013-03-22  487  static int host1x_probe(struct platform_device *pdev)
754716874389cc Terje Bergstrom     2013-03-22  488  {
754716874389cc Terje Bergstrom     2013-03-22  489  	struct host1x *host;
754716874389cc Terje Bergstrom     2013-03-22  490  	int syncpt_irq;
754716874389cc Terje Bergstrom     2013-03-22  491  	int err;
754716874389cc Terje Bergstrom     2013-03-22  492  
6a341fdff16e13 Thierry Reding      2017-08-21  493  	host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
6a341fdff16e13 Thierry Reding      2017-08-21  494  	if (!host)
6a341fdff16e13 Thierry Reding      2017-08-21  495  		return -ENOMEM;
6a341fdff16e13 Thierry Reding      2017-08-21  496  
6a341fdff16e13 Thierry Reding      2017-08-21  497  	host->info = of_device_get_match_data(&pdev->dev);
754716874389cc Terje Bergstrom     2013-03-22  498  
f1b53c4e2c08cb Mikko Perttunen     2017-09-05  499  	if (host->info->has_hypervisor) {
97dea367d8dab9 Mikko Perttunen     2022-06-27  500  		host->regs = devm_platform_ioremap_resource_byname(pdev, "vm");
97dea367d8dab9 Mikko Perttunen     2022-06-27  501  		if (IS_ERR(host->regs))
97dea367d8dab9 Mikko Perttunen     2022-06-27  502  			return PTR_ERR(host->regs);
f1b53c4e2c08cb Mikko Perttunen     2017-09-05  503  
97dea367d8dab9 Mikko Perttunen     2022-06-27  504  		host->hv_regs = devm_platform_ioremap_resource_byname(pdev, "hypervisor");
97dea367d8dab9 Mikko Perttunen     2022-06-27  505  		if (IS_ERR(host->hv_regs))
97dea367d8dab9 Mikko Perttunen     2022-06-27  506  			return PTR_ERR(host->hv_regs);
97dea367d8dab9 Mikko Perttunen     2022-06-27  507  
97dea367d8dab9 Mikko Perttunen     2022-06-27  508  		if (host->info->has_common) {
97dea367d8dab9 Mikko Perttunen     2022-06-27  509  			host->common_regs = devm_platform_ioremap_resource_byname(pdev, "common");
97dea367d8dab9 Mikko Perttunen     2022-06-27  510  			if (IS_ERR(host->common_regs))
97dea367d8dab9 Mikko Perttunen     2022-06-27  511  				return PTR_ERR(host->common_regs);
f1b53c4e2c08cb Mikko Perttunen     2017-09-05  512  		}
f1b53c4e2c08cb Mikko Perttunen     2017-09-05  513  	} else {
97dea367d8dab9 Mikko Perttunen     2022-06-27  514  		host->regs = devm_platform_ioremap_resource(pdev, 0);
97dea367d8dab9 Mikko Perttunen     2022-06-27  515  		if (IS_ERR(host->regs))
97dea367d8dab9 Mikko Perttunen     2022-06-27  516  			return PTR_ERR(host->regs);
f1b53c4e2c08cb Mikko Perttunen     2017-09-05  517  	}
754716874389cc Terje Bergstrom     2013-03-22  518  
625d4ffb438cac Mikko Perttunen     2023-01-19  519  	host->syncpt_irq = platform_get_irq(pdev, 0);
033ccdb7f6b117 YueHaibing          2019-11-02 @520  	if (syncpt_irq < 0)
7b2c63de20080c Gustavo A. R. Silva 2017-08-08  521  		return syncpt_irq;
754716874389cc Terje Bergstrom     2013-03-22  522  
776dc38403676f Thierry Reding      2013-10-14  523  	mutex_init(&host->devices_lock);
776dc38403676f Thierry Reding      2013-10-14  524  	INIT_LIST_HEAD(&host->devices);
776dc38403676f Thierry Reding      2013-10-14  525  	INIT_LIST_HEAD(&host->list);
754716874389cc Terje Bergstrom     2013-03-22  526  	host->dev = &pdev->dev;
754716874389cc Terje Bergstrom     2013-03-22  527  
754716874389cc Terje Bergstrom     2013-03-22  528  	/* set common host1x device data */
754716874389cc Terje Bergstrom     2013-03-22  529  	platform_set_drvdata(pdev, host);
754716874389cc Terje Bergstrom     2013-03-22  530  
d98914ebc2af45 Thierry Reding      2019-09-09  531  	host->dev->dma_parms = &host->dma_parms;
d98914ebc2af45 Thierry Reding      2019-09-09  532  	dma_set_max_seg_size(host->dev, UINT_MAX);
d98914ebc2af45 Thierry Reding      2019-09-09  533  
754716874389cc Terje Bergstrom     2013-03-22  534  	if (host->info->init) {
754716874389cc Terje Bergstrom     2013-03-22  535  		err = host->info->init(host);
754716874389cc Terje Bergstrom     2013-03-22  536  		if (err)
754716874389cc Terje Bergstrom     2013-03-22  537  			return err;
754716874389cc Terje Bergstrom     2013-03-22  538  	}
754716874389cc Terje Bergstrom     2013-03-22  539  
754716874389cc Terje Bergstrom     2013-03-22  540  	host->clk = devm_clk_get(&pdev->dev, NULL);
754716874389cc Terje Bergstrom     2013-03-22  541  	if (IS_ERR(host->clk)) {
754716874389cc Terje Bergstrom     2013-03-22  542  		err = PTR_ERR(host->clk);
4bb923e8075f3a Thierry Reding      2019-06-04  543  
4bb923e8075f3a Thierry Reding      2019-06-04  544  		if (err != -EPROBE_DEFER)
4bb923e8075f3a Thierry Reding      2019-06-04  545  			dev_err(&pdev->dev, "failed to get clock: %d\n", err);
4bb923e8075f3a Thierry Reding      2019-06-04  546  
754716874389cc Terje Bergstrom     2013-03-22  547  		return err;
754716874389cc Terje Bergstrom     2013-03-22  548  	}
754716874389cc Terje Bergstrom     2013-03-22  549  
6b6776e2ab8ac7 Dmitry Osipenko     2021-12-01  550  	err = host1x_get_resets(host);
6b6776e2ab8ac7 Dmitry Osipenko     2021-12-01  551  	if (err)
b386c6b73ac6c2 Thierry Reding      2017-03-21  552  		return err;
af1cbfb9bf0fe0 Thierry Reding      2019-10-28  553  
e5d5db1a79a592 Christophe JAILLET  2021-11-07  554  	host1x_bo_cache_init(&host->cache);
e5d5db1a79a592 Christophe JAILLET  2021-11-07  555  
06867a362de08f Thierry Reding      2019-10-28  556  	err = host1x_iommu_init(host);
06867a362de08f Thierry Reding      2019-10-28  557  	if (err < 0) {
06867a362de08f Thierry Reding      2019-10-28  558  		dev_err(&pdev->dev, "failed to setup IOMMU: %d\n", err);
e5d5db1a79a592 Christophe JAILLET  2021-11-07  559  		goto destroy_cache;
404bfb78daf3be Mikko Perttunen     2016-12-14  560  	}
404bfb78daf3be Mikko Perttunen     2016-12-14  561  
8474b02531c488 Mikko Perttunen     2017-06-15  562  	err = host1x_channel_list_init(&host->channel_list,
8474b02531c488 Mikko Perttunen     2017-06-15  563  				       host->info->nb_channels);
6579324a41cc41 Terje Bergstrom     2013-03-22  564  	if (err) {
6579324a41cc41 Terje Bergstrom     2013-03-22  565  		dev_err(&pdev->dev, "failed to initialize channel list\n");
06867a362de08f Thierry Reding      2019-10-28  566  		goto iommu_exit;
6579324a41cc41 Terje Bergstrom     2013-03-22  567  	}
6579324a41cc41 Terje Bergstrom     2013-03-22  568  
8aa5bcb6161206 Mikko Perttunen     2022-06-27  569  	err = host1x_memory_context_list_init(host);
8aa5bcb6161206 Mikko Perttunen     2022-06-27  570  	if (err) {
8aa5bcb6161206 Mikko Perttunen     2022-06-27  571  		dev_err(&pdev->dev, "failed to initialize context list\n");
8aa5bcb6161206 Mikko Perttunen     2022-06-27  572  		goto free_channels;
8aa5bcb6161206 Mikko Perttunen     2022-06-27  573  	}
8aa5bcb6161206 Mikko Perttunen     2022-06-27  574  
754716874389cc Terje Bergstrom     2013-03-22  575  	err = host1x_syncpt_init(host);
754716874389cc Terje Bergstrom     2013-03-22  576  	if (err) {
754716874389cc Terje Bergstrom     2013-03-22  577  		dev_err(&pdev->dev, "failed to initialize syncpts\n");
8aa5bcb6161206 Mikko Perttunen     2022-06-27  578  		goto free_contexts;
754716874389cc Terje Bergstrom     2013-03-22  579  	}
754716874389cc Terje Bergstrom     2013-03-22  580  
625d4ffb438cac Mikko Perttunen     2023-01-19  581  	err = host1x_intr_init(host);
7ede0b0bf3e259 Terje Bergstrom     2013-03-22  582  	if (err) {
7ede0b0bf3e259 Terje Bergstrom     2013-03-22  583  		dev_err(&pdev->dev, "failed to initialize interrupts\n");
06867a362de08f Thierry Reding      2019-10-28  584  		goto deinit_syncpt;
7ede0b0bf3e259 Terje Bergstrom     2013-03-22  585  	}
7ede0b0bf3e259 Terje Bergstrom     2013-03-22  586  
6b6776e2ab8ac7 Dmitry Osipenko     2021-12-01  587  	pm_runtime_enable(&pdev->dev);
6236451d83a720 Terje Bergstrom     2013-03-22  588  
6b6776e2ab8ac7 Dmitry Osipenko     2021-12-01  589  	err = devm_tegra_core_dev_init_opp_table_common(&pdev->dev);
6b6776e2ab8ac7 Dmitry Osipenko     2021-12-01  590  	if (err)
6b6776e2ab8ac7 Dmitry Osipenko     2021-12-01  591  		goto pm_disable;
6b6776e2ab8ac7 Dmitry Osipenko     2021-12-01  592  
6b6776e2ab8ac7 Dmitry Osipenko     2021-12-01  593  	/* the driver's code isn't ready yet for the dynamic RPM */
6b6776e2ab8ac7 Dmitry Osipenko     2021-12-01  594  	err = pm_runtime_resume_and_get(&pdev->dev);
6b6776e2ab8ac7 Dmitry Osipenko     2021-12-01  595  	if (err)
6b6776e2ab8ac7 Dmitry Osipenko     2021-12-01  596  		goto pm_disable;
6b6776e2ab8ac7 Dmitry Osipenko     2021-12-01  597  
6b6776e2ab8ac7 Dmitry Osipenko     2021-12-01  598  	host1x_debug_init(host);
6841482b82e5ba Thierry Reding      2019-02-01  599  
776dc38403676f Thierry Reding      2013-10-14  600  	err = host1x_register(host);
776dc38403676f Thierry Reding      2013-10-14  601  	if (err < 0)
109be8b23fb2ec Christophe JAILLET  2020-04-26  602  		goto deinit_debugfs;
692e6d7be80992 Terje Bergstrom     2013-03-22  603  
ca2030d56bb7b7 Thierry Reding      2020-06-12  604  	err = devm_of_platform_populate(&pdev->dev);
ca2030d56bb7b7 Thierry Reding      2020-06-12  605  	if (err < 0)
ca2030d56bb7b7 Thierry Reding      2020-06-12  606  		goto unregister;
ca2030d56bb7b7 Thierry Reding      2020-06-12  607  
754716874389cc Terje Bergstrom     2013-03-22  608  	return 0;
7ede0b0bf3e259 Terje Bergstrom     2013-03-22  609  
ca2030d56bb7b7 Thierry Reding      2020-06-12  610  unregister:
ca2030d56bb7b7 Thierry Reding      2020-06-12  611  	host1x_unregister(host);
109be8b23fb2ec Christophe JAILLET  2020-04-26  612  deinit_debugfs:
109be8b23fb2ec Christophe JAILLET  2020-04-26  613  	host1x_debug_deinit(host);
6b6776e2ab8ac7 Dmitry Osipenko     2021-12-01  614  
6b6776e2ab8ac7 Dmitry Osipenko     2021-12-01  615  	pm_runtime_put_sync_suspend(&pdev->dev);
6b6776e2ab8ac7 Dmitry Osipenko     2021-12-01  616  pm_disable:
6b6776e2ab8ac7 Dmitry Osipenko     2021-12-01  617  	pm_runtime_disable(&pdev->dev);
6b6776e2ab8ac7 Dmitry Osipenko     2021-12-01  618  
776dc38403676f Thierry Reding      2013-10-14  619  	host1x_intr_deinit(host);
06867a362de08f Thierry Reding      2019-10-28  620  deinit_syncpt:
7ede0b0bf3e259 Terje Bergstrom     2013-03-22  621  	host1x_syncpt_deinit(host);
8aa5bcb6161206 Mikko Perttunen     2022-06-27  622  free_contexts:
8aa5bcb6161206 Mikko Perttunen     2022-06-27  623  	host1x_memory_context_list_free(&host->context_list);
06867a362de08f Thierry Reding      2019-10-28  624  free_channels:
8474b02531c488 Mikko Perttunen     2017-06-15  625  	host1x_channel_list_free(&host->channel_list);
06867a362de08f Thierry Reding      2019-10-28  626  iommu_exit:
06867a362de08f Thierry Reding      2019-10-28  627  	host1x_iommu_exit(host);
e5d5db1a79a592 Christophe JAILLET  2021-11-07  628  destroy_cache:
e5d5db1a79a592 Christophe JAILLET  2021-11-07  629  	host1x_bo_cache_destroy(&host->cache);
404bfb78daf3be Mikko Perttunen     2016-12-14  630  
7ede0b0bf3e259 Terje Bergstrom     2013-03-22  631  	return err;
754716874389cc Terje Bergstrom     2013-03-22  632  }
754716874389cc Terje Bergstrom     2013-03-22  633  

:::::: The code at line 520 was first introduced by commit
:::::: 033ccdb7f6b11701623507339646013b4ce389d3 gpu: host1x: Remove dev_err() on platform_get_irq() failure

:::::: TO: YueHaibing <yuehaibing@huawei.com>
:::::: CC: Thierry Reding <treding@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
