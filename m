Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8E829CA
	for <llvm@lists.linux.dev>; Wed, 12 Jan 2022 12:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641992087; x=1673528087;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X8xgmXfXJDAPbGDIn/c1H8LEXOrvZEbrkXl/cLoE8YE=;
  b=F6Uc/TvelnAEFG5IPxFcQrtpvF900Y9T/dNs5xhdt//3AItSBO9cI/C+
   e1fozD2vY9Prs1hcm5nGB6D2+eKK/BKAzLa6vBgZylZp50eB3Xi2KV48E
   t2E+GglE4SHdROw1Xw+7iuWKWaBRowGsdyFw6jUv80btuA0gsk1mCPWqY
   zNmuAlQazPiByVFjPIlwUNDWs1Qs6Mv1UfLvnAq2U7PHWnk9bZ+gna3im
   p7aZF+GgP0jvfXMaGNdmJaY0hW4JK97e2q+BxCkHJzn5cO3MNhr5VVqZS
   /woTGGosOBZlaYJDkMOn1AvuHa5TIVNM/Bh/4KIqUBDDV5GfsfgUzyEeW
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10224"; a="243926291"
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; 
   d="scan'208";a="243926291"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2022 04:54:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; 
   d="scan'208";a="691372169"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 12 Jan 2022 04:54:43 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n7d9H-0005oR-AW; Wed, 12 Jan 2022 12:54:43 +0000
Date: Wed, 12 Jan 2022 20:54:11 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>
Subject: drivers/gpu/drm/msm/msm_drv.c:513:19: warning: variable 'mdss' set
 but not used
Message-ID: <202201122007.iPxaC81J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   daadb3bd0e8d3e317e36bc2c1542e86c528665e5
commit: 2027e5b3413d73533c6853154d31bf70c8eea7e1 drm/msm: Initialize MDSS irq domain at probe time
date:   5 weeks ago
config: hexagon-randconfig-r045-20220112 (https://download.01.org/0day-ci/archive/20220112/202201122007.iPxaC81J-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 244dd2913a43a200f5a6544d424cdc37b771028b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2027e5b3413d73533c6853154d31bf70c8eea7e1
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 2027e5b3413d73533c6853154d31bf70c8eea7e1
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/gpu/drm/msm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/msm/msm_drv.c:513:19: warning: variable 'mdss' set but not used [-Wunused-but-set-variable]
           struct msm_mdss *mdss;
                            ^
   1 warning generated.


vim +/mdss +513 drivers/gpu/drm/msm/msm_drv.c

5bf9c0b614542d Rob Clark                  2015-03-03  506  
70a59dd82959f8 Daniel Vetter              2020-11-04  507  static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
5bf9c0b614542d Rob Clark                  2015-03-03  508  {
2b669875332fbd Archit Taneja              2016-05-02  509  	struct platform_device *pdev = to_platform_device(dev);
ec919e6e7146e0 AngeloGioacchino Del Regno 2021-12-01  510  	struct msm_drm_private *priv = dev_get_drvdata(dev);
2b669875332fbd Archit Taneja              2016-05-02  511  	struct drm_device *ddev;
5bf9c0b614542d Rob Clark                  2015-03-03  512  	struct msm_kms *kms;
bc3220be22577e Rajesh Yadav               2018-06-21 @513  	struct msm_mdss *mdss;
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  514  	int ret, i;
5bf9c0b614542d Rob Clark                  2015-03-03  515  
2b669875332fbd Archit Taneja              2016-05-02  516  	ddev = drm_dev_alloc(drv, dev);
0f2886057be322 Tom Gundersen              2016-09-21  517  	if (IS_ERR(ddev)) {
6a41da17e87dee Mamta Shukla               2018-10-20  518  		DRM_DEV_ERROR(dev, "failed to allocate drm_device\n");
0f2886057be322 Tom Gundersen              2016-09-21  519  		return PTR_ERR(ddev);
2b669875332fbd Archit Taneja              2016-05-02  520  	}
2b669875332fbd Archit Taneja              2016-05-02  521  	ddev->dev_private = priv;
68209390f11603 Rob Clark                  2016-05-17  522  	priv->dev = ddev;
5bf9c0b614542d Rob Clark                  2015-03-03  523  
bc3220be22577e Rajesh Yadav               2018-06-21  524  	mdss = priv->mdss;
bc3220be22577e Rajesh Yadav               2018-06-21  525  
5bf9c0b614542d Rob Clark                  2015-03-03  526  	priv->wq = alloc_ordered_workqueue("msm", 0);
1d2fa58e0dda33 Samuel Iglesias Gonsalvez  2021-06-07  527  	priv->hangcheck_period = DRM_MSM_HANGCHECK_DEFAULT_PERIOD;
5bf9c0b614542d Rob Clark                  2015-03-03  528  
6ed0897cd800c3 Rob Clark                  2021-03-31  529  	INIT_LIST_HEAD(&priv->objects);
6ed0897cd800c3 Rob Clark                  2021-03-31  530  	mutex_init(&priv->obj_lock);
6ed0897cd800c3 Rob Clark                  2021-03-31  531  
3edfa30f2340e6 Rob Clark                  2020-11-16  532  	INIT_LIST_HEAD(&priv->inactive_willneed);
3edfa30f2340e6 Rob Clark                  2020-11-16  533  	INIT_LIST_HEAD(&priv->inactive_dontneed);
64fcbde772c72a Rob Clark                  2021-04-05  534  	INIT_LIST_HEAD(&priv->inactive_unpinned);
d984457b31c4c5 Rob Clark                  2020-10-23  535  	mutex_init(&priv->mm_lock);
48e7f18392c66f Kristian H. Kristensen     2019-03-20  536  
d984457b31c4c5 Rob Clark                  2020-10-23  537  	/* Teach lockdep about lock ordering wrt. shrinker: */
d984457b31c4c5 Rob Clark                  2020-10-23  538  	fs_reclaim_acquire(GFP_KERNEL);
d984457b31c4c5 Rob Clark                  2020-10-23  539  	might_lock(&priv->mm_lock);
d984457b31c4c5 Rob Clark                  2020-10-23  540  	fs_reclaim_release(GFP_KERNEL);
5bf9c0b614542d Rob Clark                  2015-03-03  541  
2b669875332fbd Archit Taneja              2016-05-02  542  	drm_mode_config_init(ddev);
060530f1ea6740 Rob Clark                  2014-03-03  543  
d863f0c7b53628 Craig Tatlor               2020-12-30  544  	ret = msm_init_vram(ddev);
77050c3febb180 Jeykumar Sankaran          2018-06-27  545  	if (ret)
2027e5b3413d73 Dmitry Baryshkov           2021-12-01  546  		return ret;
060530f1ea6740 Rob Clark                  2014-03-03  547  
d863f0c7b53628 Craig Tatlor               2020-12-30  548  	/* Bind all our sub-components: */
d863f0c7b53628 Craig Tatlor               2020-12-30  549  	ret = component_bind_all(dev, ddev);
13f15565f7887a Rob Clark                  2015-05-07  550  	if (ret)
2027e5b3413d73 Dmitry Baryshkov           2021-12-01  551  		return ret;
13f15565f7887a Rob Clark                  2015-05-07  552  
d5653a994a665c Robin Murphy               2020-09-03  553  	dma_set_max_seg_size(dev, UINT_MAX);
db735fc4036bbe Sean Paul                  2020-01-21  554  
68209390f11603 Rob Clark                  2016-05-17  555  	msm_gem_shrinker_init(ddev);
68209390f11603 Rob Clark                  2016-05-17  556  
06c0dd96bfbba8 Rob Clark                  2013-11-30  557  	switch (get_mdp_ver(pdev)) {
aaded2e3a1f6b7 Jeykumar Sankaran          2018-06-27  558  	case KMS_MDP4:
2b669875332fbd Archit Taneja              2016-05-02  559  		kms = mdp4_kms_init(ddev);
0a6030d224d3a4 Archit Taneja              2016-05-08  560  		priv->kms = kms;
06c0dd96bfbba8 Rob Clark                  2013-11-30  561  		break;
aaded2e3a1f6b7 Jeykumar Sankaran          2018-06-27  562  	case KMS_MDP5:
392ae6e0efa5e2 Archit Taneja              2016-06-14  563  		kms = mdp5_kms_init(ddev);
06c0dd96bfbba8 Rob Clark                  2013-11-30  564  		break;
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  565  	case KMS_DPU:
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  566  		kms = dpu_kms_init(ddev);
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  567  		priv->kms = kms;
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  568  		break;
06c0dd96bfbba8 Rob Clark                  2013-11-30  569  	default:
e6f6d63ed14c20 Jonathan Marek             2018-12-04  570  		/* valid only for the dummy headless case, where of_node=NULL */
e6f6d63ed14c20 Jonathan Marek             2018-12-04  571  		WARN_ON(dev->of_node);
e6f6d63ed14c20 Jonathan Marek             2018-12-04  572  		kms = NULL;
06c0dd96bfbba8 Rob Clark                  2013-11-30  573  		break;
06c0dd96bfbba8 Rob Clark                  2013-11-30  574  	}
06c0dd96bfbba8 Rob Clark                  2013-11-30  575  
c8afe684c95cd1 Rob Clark                  2013-06-26  576  	if (IS_ERR(kms)) {
6a41da17e87dee Mamta Shukla               2018-10-20  577  		DRM_DEV_ERROR(dev, "failed to load kms\n");
e4826a94c74446 Thomas Meyer               2013-09-16  578  		ret = PTR_ERR(kms);
b2ccfdf1dde588 Jonathan Marek             2018-11-21  579  		priv->kms = NULL;
77050c3febb180 Jeykumar Sankaran          2018-06-27  580  		goto err_msm_uninit;
c8afe684c95cd1 Rob Clark                  2013-06-26  581  	}
c8afe684c95cd1 Rob Clark                  2013-06-26  582  
bb676df12b5e81 Jeykumar Sankaran          2018-06-11  583  	/* Enable normalization of plane zpos */
bb676df12b5e81 Jeykumar Sankaran          2018-06-11  584  	ddev->mode_config.normalize_zpos = true;
bb676df12b5e81 Jeykumar Sankaran          2018-06-11  585  
c8afe684c95cd1 Rob Clark                  2013-06-26  586  	if (kms) {
2d99ced787e3d0 Rob Clark                  2019-08-29  587  		kms->dev = ddev;
c8afe684c95cd1 Rob Clark                  2013-06-26  588  		ret = kms->funcs->hw_init(kms);
c8afe684c95cd1 Rob Clark                  2013-06-26  589  		if (ret) {
6a41da17e87dee Mamta Shukla               2018-10-20  590  			DRM_DEV_ERROR(dev, "kms hw init failed: %d\n", ret);
77050c3febb180 Jeykumar Sankaran          2018-06-27  591  			goto err_msm_uninit;
c8afe684c95cd1 Rob Clark                  2013-06-26  592  		}
c8afe684c95cd1 Rob Clark                  2013-06-26  593  	}
c8afe684c95cd1 Rob Clark                  2013-06-26  594  
2b669875332fbd Archit Taneja              2016-05-02  595  	ddev->mode_config.funcs = &mode_config_funcs;
d14659f5de7d28 Sean Paul                  2018-02-28  596  	ddev->mode_config.helper_private = &mode_config_helper_funcs;
c8afe684c95cd1 Rob Clark                  2013-06-26  597  
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  598  	for (i = 0; i < priv->num_crtcs; i++) {
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  599  		/* initialize event thread */
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  600  		priv->event_thread[i].crtc_id = priv->crtcs[i]->base.id;
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  601  		priv->event_thread[i].dev = ddev;
1041dee2178ffd Bernard                    2020-07-21  602  		priv->event_thread[i].worker = kthread_create_worker(0,
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  603  			"crtc_event:%d", priv->event_thread[i].crtc_id);
1041dee2178ffd Bernard                    2020-07-21  604  		if (IS_ERR(priv->event_thread[i].worker)) {
a1c9b1e3bdd6d8 Zhen Lei                   2021-05-08  605  			ret = PTR_ERR(priv->event_thread[i].worker);
4971f090aa7f6c Linus Torvalds             2018-12-25  606  			DRM_DEV_ERROR(dev, "failed to create crtc_event kthread\n");
bfddcfe155a2fe Wei Li                     2021-07-05  607  			ret = PTR_ERR(priv->event_thread[i].worker);
7f9743abaa79d3 Jeykumar Sankaran          2018-10-10  608  			goto err_msm_uninit;
7f9743abaa79d3 Jeykumar Sankaran          2018-10-10  609  		}
7f9743abaa79d3 Jeykumar Sankaran          2018-10-10  610  
6d2b84a4e5b954 Linus Torvalds             2020-08-06  611  		sched_set_fifo(priv->event_thread[i].worker->task);
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  612  	}
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  613  
2b669875332fbd Archit Taneja              2016-05-02  614  	ret = drm_vblank_init(ddev, priv->num_crtcs);
c8afe684c95cd1 Rob Clark                  2013-06-26  615  	if (ret < 0) {
6a41da17e87dee Mamta Shukla               2018-10-20  616  		DRM_DEV_ERROR(dev, "failed to initialize vblank\n");
77050c3febb180 Jeykumar Sankaran          2018-06-27  617  		goto err_msm_uninit;
c8afe684c95cd1 Rob Clark                  2013-06-26  618  	}
c8afe684c95cd1 Rob Clark                  2013-06-26  619  
a2b3a5571f386e Archit Taneja              2016-05-18  620  	if (kms) {
2b669875332fbd Archit Taneja              2016-05-02  621  		pm_runtime_get_sync(dev);
f026e431cf8611 Thomas Zimmermann          2021-08-03  622  		ret = msm_irq_install(ddev, kms->irq);
2b669875332fbd Archit Taneja              2016-05-02  623  		pm_runtime_put_sync(dev);
c8afe684c95cd1 Rob Clark                  2013-06-26  624  		if (ret < 0) {
6a41da17e87dee Mamta Shukla               2018-10-20  625  			DRM_DEV_ERROR(dev, "failed to install IRQ handler\n");
77050c3febb180 Jeykumar Sankaran          2018-06-27  626  			goto err_msm_uninit;
c8afe684c95cd1 Rob Clark                  2013-06-26  627  		}
a2b3a5571f386e Archit Taneja              2016-05-18  628  	}
c8afe684c95cd1 Rob Clark                  2013-06-26  629  
2b669875332fbd Archit Taneja              2016-05-02  630  	ret = drm_dev_register(ddev, 0);
2b669875332fbd Archit Taneja              2016-05-02  631  	if (ret)
77050c3febb180 Jeykumar Sankaran          2018-06-27  632  		goto err_msm_uninit;
2b669875332fbd Archit Taneja              2016-05-02  633  
6a7e0b0e9fb839 Fabio Estevam              2021-09-14  634  	if (kms) {
98659487b845c0 Abhinav Kumar              2021-04-16  635  		ret = msm_disp_snapshot_init(ddev);
98659487b845c0 Abhinav Kumar              2021-04-16  636  		if (ret)
98659487b845c0 Abhinav Kumar              2021-04-16  637  			DRM_DEV_ERROR(dev, "msm_disp_snapshot_init failed ret = %d\n", ret);
6a7e0b0e9fb839 Fabio Estevam              2021-09-14  638  	}
2b669875332fbd Archit Taneja              2016-05-02  639  	drm_mode_config_reset(ddev);
cf3a7e4ce08e68 Rob Clark                  2014-11-08  640  

:::::: The code at line 513 was first introduced by commit
:::::: bc3220be22577e199452edbb6a24a980a4ab5c73 drm/msm/mdp5: subclass msm_mdss for mdp5

:::::: TO: Rajesh Yadav <ryadav@codeaurora.org>
:::::: CC: Sean Paul <seanpaul@chromium.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
