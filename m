Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9900A2253FD;
	Fri, 16 May 2025 06:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747376593; cv=none; b=b5GE3jh+kNbQYJuUYEf6ALDtkUngELwWxJqOekNdSnKn1iolmt++nepN56hyeQcybB2MJvLhhU7LXzKnad1Wh26Sc4EtWjmTRCS9/3Ung3FZ8i8hsgGnh61bddUCtE7jMNX8vClEgTqAOo9FVFjrTo8ejAH87lQmyDMTsJPfbhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747376593; c=relaxed/simple;
	bh=LeJ/Ga2L1x/wpcLtOMeGqGT6n+8HJ0WUg1poUE8iIZM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C/X6l/Rxr4/Jax1Q5xGpdpGtxw6drqhIN/79J63295R+k9zAMeVpgzhcREP0jjgOArlPaNY1odygdYMyy5EOP6rnWNIRQtdz48SzMQ/IuuvrDYGBdz42YLz8XGsrcVsamCDqaLOOnKnX/G19s3CObAnLKCdn6FTdWzhBvrc4HHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c+lBj+rF; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c+lBj+rF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747376591; x=1778912591;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LeJ/Ga2L1x/wpcLtOMeGqGT6n+8HJ0WUg1poUE8iIZM=;
  b=c+lBj+rFv89FGwOwOUQvB2dkB2c3YEAvs07skf5LOVdBQZ9Ju/R6XgQN
   dxG8RFZq/GEFG4HNGCgdJWDf7P6C6YYoNP8aioP0RqERc6NTJ2aAR3s0i
   FVNGgzhOZpFOSv2h0cZ/Hy/CLft3jVCWL3gG783OhW6ZFW4sVlPifKQ+Z
   A80NlRALKiG/cw4QtcgcwR2+bHgIedq1PkBwivfXmeXVpIu6huZyX/TWY
   kUP08l1hIHTNsG1BUTYO2Ap8zTRIfoZyf+pCayKaTKylF3cffs0SDM6h2
   53ChWB9SeClGHAA2JrFlKY4UNauemhPHZWBTl1Ae4hKuZmKIrFPfGyZ0C
   g==;
X-CSE-ConnectionGUID: AlZA++HsSeCsATMA/IjKBA==
X-CSE-MsgGUID: K+fmfjBnQHW05/4Ot+N0jQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="71842967"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="71842967"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 23:23:09 -0700
X-CSE-ConnectionGUID: MKGKdoqjRUOLtOnUnpAPRw==
X-CSE-MsgGUID: PthARFJ2RrmD9NgqBDUnAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="139482064"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 May 2025 23:23:08 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFoTJ-000J2X-21;
	Fri, 16 May 2025 06:23:05 +0000
Date: Fri, 16 May 2025 14:23:00 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:migration 22/22]
 drivers/media/platform/qcom/iris/iris_probe.c:259:35: warning: implicit
 conversion from 'unsigned long long' to 'unsigned long' changes value from
 18446744073709551615 to 4294967295
Message-ID: <202505161457.qR0dXT17-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux migration
head:   3cb1246117612eea7427990a681167665d573c5b
commit: 3cb1246117612eea7427990a681167665d573c5b [22/22] mm: rename PAGE_MAPPING_* to FOLIO_MAPPING_*
config: hexagon-randconfig-001-20250516 (https://download.01.org/0day-ci/archive/20250516/202505161457.qR0dXT17-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250516/202505161457.qR0dXT17-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505161457.qR0dXT17-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/platform/qcom/iris/iris_probe.c:14:
   In file included from drivers/media/platform/qcom/iris/iris_core.h:11:
   In file included from include/media/v4l2-device.h:12:
   In file included from include/media/media-device.h:16:
   In file included from include/linux/pci.h:2697:
   In file included from include/linux/dma-mapping.h:8:
   In file included from include/linux/scatterlist.h:8:
   include/linux/mm.h:2159:47: error: use of undeclared identifier 'PAGE_MAPPING_FLAGS'
    2159 |         } else if (!((unsigned long)folio->mapping & PAGE_MAPPING_FLAGS)) {
         |                                                      ^
   drivers/media/platform/qcom/iris/iris_probe.c:258:35: warning: implicit conversion from 'unsigned long long' to 'unsigned int' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
     258 |         dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
         |         ~~~~~~~~~~~~~~~~~~~~             ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:73:40: note: expanded from macro 'DMA_BIT_MASK'
      73 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                        ^~~~~
>> drivers/media/platform/qcom/iris/iris_probe.c:259:35: warning: implicit conversion from 'unsigned long long' to 'unsigned long' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
     259 |         dma_set_seg_boundary(&pdev->dev, DMA_BIT_MASK(32));
         |         ~~~~~~~~~~~~~~~~~~~~             ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:73:40: note: expanded from macro 'DMA_BIT_MASK'
      73 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                        ^~~~~
   2 warnings and 1 error generated.


vim +259 drivers/media/platform/qcom/iris/iris_probe.c

fb583a214337a5 Dikshita Agarwal 2025-02-07  191  
38506cb7e8d25a Dikshita Agarwal 2025-02-07  192  static int iris_probe(struct platform_device *pdev)
38506cb7e8d25a Dikshita Agarwal 2025-02-07  193  {
38506cb7e8d25a Dikshita Agarwal 2025-02-07  194  	struct device *dev = &pdev->dev;
38506cb7e8d25a Dikshita Agarwal 2025-02-07  195  	struct iris_core *core;
d7378f84e94e14 Dikshita Agarwal 2025-02-07  196  	u64 dma_mask;
38506cb7e8d25a Dikshita Agarwal 2025-02-07  197  	int ret;
38506cb7e8d25a Dikshita Agarwal 2025-02-07  198  
38506cb7e8d25a Dikshita Agarwal 2025-02-07  199  	core = devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
38506cb7e8d25a Dikshita Agarwal 2025-02-07  200  	if (!core)
38506cb7e8d25a Dikshita Agarwal 2025-02-07  201  		return -ENOMEM;
38506cb7e8d25a Dikshita Agarwal 2025-02-07  202  	core->dev = dev;
38506cb7e8d25a Dikshita Agarwal 2025-02-07  203  
d7378f84e94e14 Dikshita Agarwal 2025-02-07  204  	core->state = IRIS_CORE_DEINIT;
d7378f84e94e14 Dikshita Agarwal 2025-02-07  205  	mutex_init(&core->lock);
fb583a214337a5 Dikshita Agarwal 2025-02-07  206  	init_completion(&core->core_init_done);
fb583a214337a5 Dikshita Agarwal 2025-02-07  207  
fb583a214337a5 Dikshita Agarwal 2025-02-07  208  	core->response_packet = devm_kzalloc(core->dev, IFACEQ_CORE_PKT_SIZE, GFP_KERNEL);
fb583a214337a5 Dikshita Agarwal 2025-02-07  209  	if (!core->response_packet)
fb583a214337a5 Dikshita Agarwal 2025-02-07  210  		return -ENOMEM;
fb583a214337a5 Dikshita Agarwal 2025-02-07  211  
38fc8beaba55e0 Dikshita Agarwal 2025-02-07  212  	INIT_LIST_HEAD(&core->instances);
fb583a214337a5 Dikshita Agarwal 2025-02-07  213  	INIT_DELAYED_WORK(&core->sys_error_handler, iris_sys_error_handler);
d7378f84e94e14 Dikshita Agarwal 2025-02-07  214  
38506cb7e8d25a Dikshita Agarwal 2025-02-07  215  	core->reg_base = devm_platform_ioremap_resource(pdev, 0);
38506cb7e8d25a Dikshita Agarwal 2025-02-07  216  	if (IS_ERR(core->reg_base))
38506cb7e8d25a Dikshita Agarwal 2025-02-07  217  		return PTR_ERR(core->reg_base);
38506cb7e8d25a Dikshita Agarwal 2025-02-07  218  
38506cb7e8d25a Dikshita Agarwal 2025-02-07  219  	core->irq = platform_get_irq(pdev, 0);
38506cb7e8d25a Dikshita Agarwal 2025-02-07  220  	if (core->irq < 0)
38506cb7e8d25a Dikshita Agarwal 2025-02-07  221  		return core->irq;
38506cb7e8d25a Dikshita Agarwal 2025-02-07  222  
38506cb7e8d25a Dikshita Agarwal 2025-02-07  223  	core->iris_platform_data = of_device_get_match_data(core->dev);
38506cb7e8d25a Dikshita Agarwal 2025-02-07  224  
fb583a214337a5 Dikshita Agarwal 2025-02-07  225  	ret = devm_request_threaded_irq(core->dev, core->irq, iris_hfi_isr,
fb583a214337a5 Dikshita Agarwal 2025-02-07  226  					iris_hfi_isr_handler, IRQF_TRIGGER_HIGH, "iris", core);
fb583a214337a5 Dikshita Agarwal 2025-02-07  227  	if (ret)
fb583a214337a5 Dikshita Agarwal 2025-02-07  228  		return ret;
fb583a214337a5 Dikshita Agarwal 2025-02-07  229  
fb583a214337a5 Dikshita Agarwal 2025-02-07  230  	disable_irq_nosync(core->irq);
fb583a214337a5 Dikshita Agarwal 2025-02-07  231  
fa186c97e3d293 Dikshita Agarwal 2025-02-07  232  	iris_init_ops(core);
fb583a214337a5 Dikshita Agarwal 2025-02-07  233  	core->iris_platform_data->init_hfi_command_ops(core);
fb583a214337a5 Dikshita Agarwal 2025-02-07  234  	core->iris_platform_data->init_hfi_response_ops(core);
fb583a214337a5 Dikshita Agarwal 2025-02-07  235  
38506cb7e8d25a Dikshita Agarwal 2025-02-07  236  	ret = iris_init_resources(core);
38506cb7e8d25a Dikshita Agarwal 2025-02-07  237  	if (ret)
38506cb7e8d25a Dikshita Agarwal 2025-02-07  238  		return ret;
38506cb7e8d25a Dikshita Agarwal 2025-02-07  239  
33be1dde17e3e8 Dikshita Agarwal 2025-02-07  240  	iris_session_init_caps(core);
33be1dde17e3e8 Dikshita Agarwal 2025-02-07  241  
38506cb7e8d25a Dikshita Agarwal 2025-02-07  242  	ret = v4l2_device_register(dev, &core->v4l2_dev);
38506cb7e8d25a Dikshita Agarwal 2025-02-07  243  	if (ret)
38506cb7e8d25a Dikshita Agarwal 2025-02-07  244  		return ret;
38506cb7e8d25a Dikshita Agarwal 2025-02-07  245  
38506cb7e8d25a Dikshita Agarwal 2025-02-07  246  	ret = iris_register_video_device(core);
38506cb7e8d25a Dikshita Agarwal 2025-02-07  247  	if (ret)
38506cb7e8d25a Dikshita Agarwal 2025-02-07  248  		goto err_v4l2_unreg;
38506cb7e8d25a Dikshita Agarwal 2025-02-07  249  
38506cb7e8d25a Dikshita Agarwal 2025-02-07  250  	platform_set_drvdata(pdev, core);
38506cb7e8d25a Dikshita Agarwal 2025-02-07  251  
d7378f84e94e14 Dikshita Agarwal 2025-02-07  252  	dma_mask = core->iris_platform_data->dma_mask;
d7378f84e94e14 Dikshita Agarwal 2025-02-07  253  
d7378f84e94e14 Dikshita Agarwal 2025-02-07  254  	ret = dma_set_mask_and_coherent(dev, dma_mask);
d7378f84e94e14 Dikshita Agarwal 2025-02-07  255  	if (ret)
d7378f84e94e14 Dikshita Agarwal 2025-02-07  256  		goto err_vdev_unreg;
d7378f84e94e14 Dikshita Agarwal 2025-02-07  257  
d7378f84e94e14 Dikshita Agarwal 2025-02-07 @258  	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
d7378f84e94e14 Dikshita Agarwal 2025-02-07 @259  	dma_set_seg_boundary(&pdev->dev, DMA_BIT_MASK(32));
d7378f84e94e14 Dikshita Agarwal 2025-02-07  260  
bb8a95aa038e09 Dikshita Agarwal 2025-02-07  261  	pm_runtime_set_autosuspend_delay(core->dev, AUTOSUSPEND_DELAY_VALUE);
bb8a95aa038e09 Dikshita Agarwal 2025-02-07  262  	pm_runtime_use_autosuspend(core->dev);
bb8a95aa038e09 Dikshita Agarwal 2025-02-07  263  	ret = devm_pm_runtime_enable(core->dev);
bb8a95aa038e09 Dikshita Agarwal 2025-02-07  264  	if (ret)
bb8a95aa038e09 Dikshita Agarwal 2025-02-07  265  		goto err_vdev_unreg;
bb8a95aa038e09 Dikshita Agarwal 2025-02-07  266  
38506cb7e8d25a Dikshita Agarwal 2025-02-07  267  	return 0;
38506cb7e8d25a Dikshita Agarwal 2025-02-07  268  
d7378f84e94e14 Dikshita Agarwal 2025-02-07  269  err_vdev_unreg:
d7378f84e94e14 Dikshita Agarwal 2025-02-07  270  	video_unregister_device(core->vdev_dec);
38506cb7e8d25a Dikshita Agarwal 2025-02-07  271  err_v4l2_unreg:
38506cb7e8d25a Dikshita Agarwal 2025-02-07  272  	v4l2_device_unregister(&core->v4l2_dev);
38506cb7e8d25a Dikshita Agarwal 2025-02-07  273  
38506cb7e8d25a Dikshita Agarwal 2025-02-07  274  	return ret;
38506cb7e8d25a Dikshita Agarwal 2025-02-07  275  }
38506cb7e8d25a Dikshita Agarwal 2025-02-07  276  

:::::: The code at line 259 was first introduced by commit
:::::: d7378f84e94e14998b3469dcc0d8ce609d049ccc media: iris: introduce iris core state management with shared queues

:::::: TO: Dikshita Agarwal <quic_dikshita@quicinc.com>
:::::: CC: Hans Verkuil <hverkuil@xs4all.nl>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
