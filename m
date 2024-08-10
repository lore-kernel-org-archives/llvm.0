Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD1B22083;
	Sat, 10 Aug 2024 20:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723322217; cv=none; b=dVjvRlKPSIO4AdEKPfV1UXrfoFljE5SxHsvtOFlaOBMKYCLPVLjoPiKsogc5C9lMRvRGZSZ1FsKr76+Z8S3OIsAvKKYbmyedoAgicC4v1aMPPLJh99T/2w/SV7bsbEv8ylkpDy8lR26VjtLUhyEjljeO9a4PcaoM5SZixWXNGyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723322217; c=relaxed/simple;
	bh=PTOJcH7pH3ih4Hd0fwChpy8C1RPFYOVZo486bSHNO1U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=esYCj832MpvgDUdGCEMWysFGo2lecdsDfTN7SMDRb8pfXEk/Qggiy6fwW7cdWnwkOkYXt60GNAt2PnCKE1DcqI0SDA8tEYc8V2AfvYGZarX4u0uP+NTBm31j+ofrU43SSh7mYrxd2AwgbYmHLR+aHglgn9ClcqUhp00a5eCiGPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JaJdFwiM; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JaJdFwiM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723322216; x=1754858216;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PTOJcH7pH3ih4Hd0fwChpy8C1RPFYOVZo486bSHNO1U=;
  b=JaJdFwiMW0qqpcY32Jdwxjpuiy6mRHCaBo/BeeR1wlya09qlT1RL1Eyc
   MUHWPgM0nd7KyzefqXTdRvwp/QHfV0YA+/UFhZvPO5Sti52wDY2Socadr
   D2mvvORWJADnappZIdLxTDSyvG9mVbe3ui6s6b6N7qt/1AY4kP0xGUvRg
   QN9xKqCvRGcVrwztLAANYwzZIhspMJFsFQ6v7qtzeDs7WgReAdVd3tJyc
   wpFTe36TgHD/yGGgFNJxI3+jRSWDgdq6NlWvCt0CjQ5HwIxyRpip+zN2C
   jL61xQuCuGEAZTK7V4WL7/uZIxgMvsCLDOuWpE2btd+KDZyRRA76EJ18O
   Q==;
X-CSE-ConnectionGUID: /wdYPUVvTpG7t/LSECB/Bw==
X-CSE-MsgGUID: bOq/qidsQT6Bv4TreVYBnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11160"; a="25241578"
X-IronPort-AV: E=Sophos;i="6.09,279,1716274800"; 
   d="scan'208";a="25241578"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2024 13:36:55 -0700
X-CSE-ConnectionGUID: O7I0MMzjRfG2PnO4b2dmzw==
X-CSE-MsgGUID: nN4TB/0wSbKbMgJePJuHwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,279,1716274800"; 
   d="scan'208";a="57954580"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 10 Aug 2024 13:36:53 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scspX-000AH5-1k;
	Sat, 10 Aug 2024 20:36:51 +0000
Date: Sun, 11 Aug 2024 04:36:48 +0800
From: kernel test robot <lkp@intel.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [chunkuang-hu:mediatek-cmdq11 3/5]
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c:317:54: error: member
 reference base type 'struct cmdq_client *' is not a structure or union
Message-ID: <202408110426.qXOFX95X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git mediatek-cmdq11
head:   e9ea7ca7912d1950de8e4427d644379321a1dbcb
commit: e049aa93ad2a983301a86570199d254379732d2d [3/5] media: platform: mtk-mdp3: Get fine-grain control of cmdq_pkt_finalize()
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240811/202408110426.qXOFX95X-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240811/202408110426.qXOFX95X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408110426.qXOFX95X-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c:317:54: error: member reference base type 'struct cmdq_client *' is not a structure or union
     317 |         mdp->cmdq_shift_pa = cmdq_get_shift_pa(mdp->cmdq_clt->chan);
         |                                                ~~~~~~~~~~~~~^ ~~~~
   drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c:323:46: warning: implicit conversion from 'unsigned long long' to 'unsigned int' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
     323 |         vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~             ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:40: note: expanded from macro 'DMA_BIT_MASK'
      77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                        ^~~~~
   1 warning and 1 error generated.


vim +317 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c

   221	
   222	static int mdp_probe(struct platform_device *pdev)
   223	{
   224		struct device *dev = &pdev->dev;
   225		struct mdp_dev *mdp;
   226		struct platform_device *mm_pdev;
   227		struct resource *res;
   228		int ret, i, mutex_id;
   229	
   230		mdp = kzalloc(sizeof(*mdp), GFP_KERNEL);
   231		if (!mdp) {
   232			ret = -ENOMEM;
   233			goto err_return;
   234		}
   235	
   236		mdp->pdev = pdev;
   237		mdp->mdp_data = of_device_get_match_data(&pdev->dev);
   238	
   239		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
   240		if (res->start != mdp->mdp_data->mdp_con_res) {
   241			platform_set_drvdata(pdev, mdp);
   242			goto success_return;
   243		}
   244	
   245		ret = mdp_mm_subsys_deploy(mdp, MDP_INFRA_MMSYS);
   246		if (ret)
   247			goto err_destroy_device;
   248	
   249		ret = mdp_mm_subsys_deploy(mdp, MDP_INFRA_MUTEX);
   250		if (ret)
   251			goto err_destroy_device;
   252	
   253		for (i = 0; i < mdp->mdp_data->pipe_info_len; i++) {
   254			enum mdp_mm_subsys_id idx;
   255			struct mtk_mutex **m;
   256	
   257			idx = mdp->mdp_data->pipe_info[i].sub_id;
   258			mutex_id = mdp->mdp_data->pipe_info[i].mutex_id;
   259			m = &mdp->mm_subsys[idx].mdp_mutex[mutex_id];
   260	
   261			if (!IS_ERR_OR_NULL(*m))
   262				continue;
   263	
   264			*m = mtk_mutex_get(mdp->mm_subsys[idx].mutex);
   265			if (IS_ERR(*m)) {
   266				ret = PTR_ERR(*m);
   267				goto err_free_mutex;
   268			}
   269		}
   270	
   271		ret = mdp_comp_config(mdp);
   272		if (ret) {
   273			dev_err(dev, "Failed to config mdp components\n");
   274			goto err_free_mutex;
   275		}
   276	
   277		mdp->job_wq = alloc_workqueue(MDP_MODULE_NAME, WQ_FREEZABLE, 0);
   278		if (!mdp->job_wq) {
   279			dev_err(dev, "Unable to create job workqueue\n");
   280			ret = -ENOMEM;
   281			goto err_deinit_comp;
   282		}
   283	
   284		mdp->clock_wq = alloc_workqueue(MDP_MODULE_NAME "-clock", WQ_FREEZABLE,
   285						0);
   286		if (!mdp->clock_wq) {
   287			dev_err(dev, "Unable to create clock workqueue\n");
   288			ret = -ENOMEM;
   289			goto err_destroy_job_wq;
   290		}
   291	
   292		mdp->scp = scp_get(pdev);
   293		if (!mdp->scp) {
   294			mm_pdev = __get_pdev_by_id(pdev, NULL, MDP_INFRA_SCP);
   295			if (WARN_ON(!mm_pdev)) {
   296				dev_err(&pdev->dev, "Could not get scp device\n");
   297				ret = -ENODEV;
   298				goto err_destroy_clock_wq;
   299			}
   300			mdp->scp = platform_get_drvdata(mm_pdev);
   301		}
   302	
   303		mdp->rproc_handle = scp_get_rproc(mdp->scp);
   304		dev_dbg(&pdev->dev, "MDP rproc_handle: %pK", mdp->rproc_handle);
   305	
   306		mutex_init(&mdp->vpu_lock);
   307		mutex_init(&mdp->m2m_lock);
   308	
   309		for (i = 0; i < mdp->mdp_data->pp_used; i++) {
   310			mdp->cmdq_clt[i] = cmdq_mbox_create(dev, i);
   311			if (IS_ERR(mdp->cmdq_clt[i])) {
   312				ret = PTR_ERR(mdp->cmdq_clt[i]);
   313				goto err_mbox_destroy;
   314			}
   315		}
   316	
 > 317		mdp->cmdq_shift_pa = cmdq_get_shift_pa(mdp->cmdq_clt->chan);
   318	
   319		init_waitqueue_head(&mdp->callback_wq);
   320		ida_init(&mdp->mdp_ida);
   321		platform_set_drvdata(pdev, mdp);
   322	
   323		vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
   324	
   325		ret = v4l2_device_register(dev, &mdp->v4l2_dev);
   326		if (ret) {
   327			dev_err(dev, "Failed to register v4l2 device\n");
   328			ret = -EINVAL;
   329			goto err_mbox_destroy;
   330		}
   331	
   332		ret = mdp_m2m_device_register(mdp);
   333		if (ret) {
   334			v4l2_err(&mdp->v4l2_dev, "Failed to register m2m device\n");
   335			goto err_unregister_device;
   336		}
   337	
   338	success_return:
   339		dev_dbg(dev, "mdp-%d registered successfully\n", pdev->id);
   340		return 0;
   341	
   342	err_unregister_device:
   343		v4l2_device_unregister(&mdp->v4l2_dev);
   344	err_mbox_destroy:
   345		while (--i >= 0)
   346			cmdq_mbox_destroy(mdp->cmdq_clt[i]);
   347		scp_put(mdp->scp);
   348	err_destroy_clock_wq:
   349		destroy_workqueue(mdp->clock_wq);
   350	err_destroy_job_wq:
   351		destroy_workqueue(mdp->job_wq);
   352	err_deinit_comp:
   353		mdp_comp_destroy(mdp);
   354	err_free_mutex:
   355		for (i = 0; i < mdp->mdp_data->pipe_info_len; i++) {
   356			enum mdp_mm_subsys_id idx;
   357			struct mtk_mutex *m;
   358	
   359			idx = mdp->mdp_data->pipe_info[i].sub_id;
   360			mutex_id = mdp->mdp_data->pipe_info[i].mutex_id;
   361			m = mdp->mm_subsys[idx].mdp_mutex[mutex_id];
   362			if (!IS_ERR_OR_NULL(m))
   363				mtk_mutex_put(m);
   364		}
   365	err_destroy_device:
   366		kfree(mdp);
   367	err_return:
   368		dev_dbg(dev, "Errno %d\n", ret);
   369		return ret;
   370	}
   371	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
