Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B271581E5;
	Sun,  9 Feb 2025 11:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739099445; cv=none; b=ahlQpktM9Wn3GlIR4H3kXUyWLp7mMd5vXkPoyEKR/sI0IJRp1+bPrQd3vhHfLBlh8zM2gExiNokiatd5oEAF55xFhEvyHNzdIbWBVJ5i1KeFhmOnczq9uQbyBtrI9NLSIRnoXb+abFphrElikhRePmnntj5fMlX/YS79lhEsOvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739099445; c=relaxed/simple;
	bh=4NiVTNFIHSpPDTlv8tSDBApypvv4f5G01JQq4hHPa4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ezg0nk7yiO6Hslf//aTtLIV7FSFHt2kGjxrdAM8C7f6a2or8155lzhLGV9HbY5EuRSAFlx103+EU7wQQvXKklZ6qHV2uVLXjpTBXNoCbliOlrkpJMQuTqwMGCc+zwldS9lD9CJVLqtx4Pr/o/iHmBUKZ0Bs83G9snC/1rTq0gVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f6wMCNzm; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f6wMCNzm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739099442; x=1770635442;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4NiVTNFIHSpPDTlv8tSDBApypvv4f5G01JQq4hHPa4Q=;
  b=f6wMCNzmUuc6gUxU9fz1ZunJsgw544m/NBLasvrXrdy4l2DKSOxEZ+Mc
   gPmQLGr8/AK8w5hnnuLg51wsy22r24wIV1JQ2Eb7YF3E5du9TQxdreVmn
   VGPl4iMlPIvAV9SooSbY4zR/MjWo+CIB16Y+j5HkNND91gL+ARD73DkWj
   6T3kWqs+uRz7PUu/EdeXm/PjN0N/YA4XCaIWdCCD3owyZkfUf8kjYmH8k
   kgPa1n1VeCJJknsPSfCW7fa8yvvUPF2/ujTFK8vR3bEVRXgYR+DdaJA5C
   m0IexAsVHsE397E+jKUJIQu5wzHrJRQ3flvEfBDVcvV27mM8J51GnVnxo
   w==;
X-CSE-ConnectionGUID: A0Tqx+esSoG54S83CV4fqA==
X-CSE-MsgGUID: on84ALvmSlOiFSl7X61vCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51122345"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="51122345"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 03:10:41 -0800
X-CSE-ConnectionGUID: pW+MREdKTHWbgeONhJZhTQ==
X-CSE-MsgGUID: pAlKW7H9R+eDDRbiNZzcXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,272,1732608000"; 
   d="scan'208";a="112171802"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 Feb 2025 03:10:34 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1th5Cq-0011Nr-0Y;
	Sun, 09 Feb 2025 11:10:32 +0000
Date: Sun, 9 Feb 2025 19:09:47 +0800
From: kernel test robot <lkp@intel.com>
To: Philipp Stanner <phasta@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Lucas Stach <l.stach@pengutronix.de>,
	Russell King <linux+etnaviv@armlinux.org.uk>,
	Christian Gmeiner <christian.gmeiner@gmail.com>,
	Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Qiang Yu <yuq825@gmail.com>, Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Melissa Wen <mwen@igalia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3] drm/sched: Use struct for drm_sched_init() params
Message-ID: <202502091818.k02Duy1J-lkp@intel.com>
References: <20250207110248.19435-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207110248.19435-2-phasta@kernel.org>

Hi Philipp,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on linus/master v6.14-rc1 next-20250207]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Philipp-Stanner/drm-sched-Use-struct-for-drm_sched_init-params/20250207-190432
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250207110248.19435-2-phasta%40kernel.org
patch subject: [PATCH v3] drm/sched: Use struct for drm_sched_init() params
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250209/202502091818.k02Duy1J-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250209/202502091818.k02Duy1J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502091818.k02Duy1J-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/accel/amdxdna/aie2_ctx.c:8:
   In file included from include/drm/drm_gem.h:42:
   In file included from include/drm/drm_vma_manager.h:27:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/accel/amdxdna/aie2_ctx.c:576:42: error: too many arguments to function call, expected 2, have 11
     576 |         ret = drm_sched_init(sched, &sched_ops, NULL, DRM_SCHED_PRIORITY_COUNT,
         |               ~~~~~~~~~~~~~~                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     577 |                              HWCTX_MAX_CMDS, 0, msecs_to_jiffies(HWCTX_MAX_TIMEOUT),
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     578 |                              NULL, NULL, hwctx->name, xdna->ddev.dev);
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^
   include/drm/gpu_scheduler.h:587:5: note: 'drm_sched_init' declared here
     587 | int drm_sched_init(struct drm_gpu_scheduler *sched,
         |     ^              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     588 |                    const struct drm_sched_init_args *args);
         |                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   3 warnings and 1 error generated.


vim +576 drivers/accel/amdxdna/aie2_ctx.c

aac243092b707b Lizhi Hou 2024-11-18  514  
be462c97b7dfd2 Lizhi Hou 2024-11-18  515  int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
be462c97b7dfd2 Lizhi Hou 2024-11-18  516  {
be462c97b7dfd2 Lizhi Hou 2024-11-18  517  	struct amdxdna_client *client = hwctx->client;
be462c97b7dfd2 Lizhi Hou 2024-11-18  518  	struct amdxdna_dev *xdna = client->xdna;
aac243092b707b Lizhi Hou 2024-11-18  519  	struct drm_gpu_scheduler *sched;
be462c97b7dfd2 Lizhi Hou 2024-11-18  520  	struct amdxdna_hwctx_priv *priv;
ac49797c1815d4 Lizhi Hou 2024-11-18  521  	struct amdxdna_gem_obj *heap;
f4d7b8a6bc8c92 Lizhi Hou 2024-12-13  522  	struct amdxdna_dev_hdl *ndev;
aac243092b707b Lizhi Hou 2024-11-18  523  	int i, ret;
be462c97b7dfd2 Lizhi Hou 2024-11-18  524  
be462c97b7dfd2 Lizhi Hou 2024-11-18  525  	priv = kzalloc(sizeof(*hwctx->priv), GFP_KERNEL);
be462c97b7dfd2 Lizhi Hou 2024-11-18  526  	if (!priv)
be462c97b7dfd2 Lizhi Hou 2024-11-18  527  		return -ENOMEM;
be462c97b7dfd2 Lizhi Hou 2024-11-18  528  	hwctx->priv = priv;
be462c97b7dfd2 Lizhi Hou 2024-11-18  529  
ac49797c1815d4 Lizhi Hou 2024-11-18  530  	mutex_lock(&client->mm_lock);
ac49797c1815d4 Lizhi Hou 2024-11-18  531  	heap = client->dev_heap;
ac49797c1815d4 Lizhi Hou 2024-11-18  532  	if (!heap) {
ac49797c1815d4 Lizhi Hou 2024-11-18  533  		XDNA_ERR(xdna, "The client dev heap object not exist");
ac49797c1815d4 Lizhi Hou 2024-11-18  534  		mutex_unlock(&client->mm_lock);
ac49797c1815d4 Lizhi Hou 2024-11-18  535  		ret = -ENOENT;
ac49797c1815d4 Lizhi Hou 2024-11-18  536  		goto free_priv;
ac49797c1815d4 Lizhi Hou 2024-11-18  537  	}
ac49797c1815d4 Lizhi Hou 2024-11-18  538  	drm_gem_object_get(to_gobj(heap));
ac49797c1815d4 Lizhi Hou 2024-11-18  539  	mutex_unlock(&client->mm_lock);
ac49797c1815d4 Lizhi Hou 2024-11-18  540  	priv->heap = heap;
aac243092b707b Lizhi Hou 2024-11-18  541  	sema_init(&priv->job_sem, HWCTX_MAX_CMDS);
ac49797c1815d4 Lizhi Hou 2024-11-18  542  
ac49797c1815d4 Lizhi Hou 2024-11-18  543  	ret = amdxdna_gem_pin(heap);
ac49797c1815d4 Lizhi Hou 2024-11-18  544  	if (ret) {
ac49797c1815d4 Lizhi Hou 2024-11-18  545  		XDNA_ERR(xdna, "Dev heap pin failed, ret %d", ret);
ac49797c1815d4 Lizhi Hou 2024-11-18  546  		goto put_heap;
ac49797c1815d4 Lizhi Hou 2024-11-18  547  	}
ac49797c1815d4 Lizhi Hou 2024-11-18  548  
aac243092b707b Lizhi Hou 2024-11-18  549  	for (i = 0; i < ARRAY_SIZE(priv->cmd_buf); i++) {
aac243092b707b Lizhi Hou 2024-11-18  550  		struct amdxdna_gem_obj *abo;
aac243092b707b Lizhi Hou 2024-11-18  551  		struct amdxdna_drm_create_bo args = {
aac243092b707b Lizhi Hou 2024-11-18  552  			.flags = 0,
aac243092b707b Lizhi Hou 2024-11-18  553  			.type = AMDXDNA_BO_DEV,
aac243092b707b Lizhi Hou 2024-11-18  554  			.vaddr = 0,
aac243092b707b Lizhi Hou 2024-11-18  555  			.size = MAX_CHAIN_CMDBUF_SIZE,
aac243092b707b Lizhi Hou 2024-11-18  556  		};
aac243092b707b Lizhi Hou 2024-11-18  557  
aac243092b707b Lizhi Hou 2024-11-18  558  		abo = amdxdna_drm_alloc_dev_bo(&xdna->ddev, &args, client->filp, true);
aac243092b707b Lizhi Hou 2024-11-18  559  		if (IS_ERR(abo)) {
aac243092b707b Lizhi Hou 2024-11-18  560  			ret = PTR_ERR(abo);
aac243092b707b Lizhi Hou 2024-11-18  561  			goto free_cmd_bufs;
aac243092b707b Lizhi Hou 2024-11-18  562  		}
aac243092b707b Lizhi Hou 2024-11-18  563  
aac243092b707b Lizhi Hou 2024-11-18  564  		XDNA_DBG(xdna, "Command buf %d addr 0x%llx size 0x%lx",
aac243092b707b Lizhi Hou 2024-11-18  565  			 i, abo->mem.dev_addr, abo->mem.size);
aac243092b707b Lizhi Hou 2024-11-18  566  		priv->cmd_buf[i] = abo;
aac243092b707b Lizhi Hou 2024-11-18  567  	}
aac243092b707b Lizhi Hou 2024-11-18  568  
aac243092b707b Lizhi Hou 2024-11-18  569  	sched = &priv->sched;
aac243092b707b Lizhi Hou 2024-11-18  570  	mutex_init(&priv->io_lock);
aac243092b707b Lizhi Hou 2024-11-18  571  
aac243092b707b Lizhi Hou 2024-11-18  572  	fs_reclaim_acquire(GFP_KERNEL);
aac243092b707b Lizhi Hou 2024-11-18  573  	might_lock(&priv->io_lock);
aac243092b707b Lizhi Hou 2024-11-18  574  	fs_reclaim_release(GFP_KERNEL);
aac243092b707b Lizhi Hou 2024-11-18  575  
aac243092b707b Lizhi Hou 2024-11-18 @576  	ret = drm_sched_init(sched, &sched_ops, NULL, DRM_SCHED_PRIORITY_COUNT,
aac243092b707b Lizhi Hou 2024-11-18  577  			     HWCTX_MAX_CMDS, 0, msecs_to_jiffies(HWCTX_MAX_TIMEOUT),
aac243092b707b Lizhi Hou 2024-11-18  578  			     NULL, NULL, hwctx->name, xdna->ddev.dev);
aac243092b707b Lizhi Hou 2024-11-18  579  	if (ret) {
aac243092b707b Lizhi Hou 2024-11-18  580  		XDNA_ERR(xdna, "Failed to init DRM scheduler. ret %d", ret);
aac243092b707b Lizhi Hou 2024-11-18  581  		goto free_cmd_bufs;
aac243092b707b Lizhi Hou 2024-11-18  582  	}
aac243092b707b Lizhi Hou 2024-11-18  583  
aac243092b707b Lizhi Hou 2024-11-18  584  	ret = drm_sched_entity_init(&priv->entity, DRM_SCHED_PRIORITY_NORMAL,
aac243092b707b Lizhi Hou 2024-11-18  585  				    &sched, 1, NULL);
aac243092b707b Lizhi Hou 2024-11-18  586  	if (ret) {
aac243092b707b Lizhi Hou 2024-11-18  587  		XDNA_ERR(xdna, "Failed to initial sched entiry. ret %d", ret);
aac243092b707b Lizhi Hou 2024-11-18  588  		goto free_sched;
aac243092b707b Lizhi Hou 2024-11-18  589  	}
aac243092b707b Lizhi Hou 2024-11-18  590  
be462c97b7dfd2 Lizhi Hou 2024-11-18  591  	ret = aie2_hwctx_col_list(hwctx);
be462c97b7dfd2 Lizhi Hou 2024-11-18  592  	if (ret) {
be462c97b7dfd2 Lizhi Hou 2024-11-18  593  		XDNA_ERR(xdna, "Create col list failed, ret %d", ret);
aac243092b707b Lizhi Hou 2024-11-18  594  		goto free_entity;
be462c97b7dfd2 Lizhi Hou 2024-11-18  595  	}
be462c97b7dfd2 Lizhi Hou 2024-11-18  596  
be462c97b7dfd2 Lizhi Hou 2024-11-18  597  	ret = aie2_alloc_resource(hwctx);
be462c97b7dfd2 Lizhi Hou 2024-11-18  598  	if (ret) {
be462c97b7dfd2 Lizhi Hou 2024-11-18  599  		XDNA_ERR(xdna, "Alloc hw resource failed, ret %d", ret);
be462c97b7dfd2 Lizhi Hou 2024-11-18  600  		goto free_col_list;
be462c97b7dfd2 Lizhi Hou 2024-11-18  601  	}
be462c97b7dfd2 Lizhi Hou 2024-11-18  602  
ac49797c1815d4 Lizhi Hou 2024-11-18  603  	ret = aie2_map_host_buf(xdna->dev_handle, hwctx->fw_ctx_id,
ac49797c1815d4 Lizhi Hou 2024-11-18  604  				heap->mem.userptr, heap->mem.size);
ac49797c1815d4 Lizhi Hou 2024-11-18  605  	if (ret) {
ac49797c1815d4 Lizhi Hou 2024-11-18  606  		XDNA_ERR(xdna, "Map host buffer failed, ret %d", ret);
ac49797c1815d4 Lizhi Hou 2024-11-18  607  		goto release_resource;
ac49797c1815d4 Lizhi Hou 2024-11-18  608  	}
aac243092b707b Lizhi Hou 2024-11-18  609  
aac243092b707b Lizhi Hou 2024-11-18  610  	ret = aie2_ctx_syncobj_create(hwctx);
aac243092b707b Lizhi Hou 2024-11-18  611  	if (ret) {
aac243092b707b Lizhi Hou 2024-11-18  612  		XDNA_ERR(xdna, "Create syncobj failed, ret %d", ret);
aac243092b707b Lizhi Hou 2024-11-18  613  		goto release_resource;
aac243092b707b Lizhi Hou 2024-11-18  614  	}
aac243092b707b Lizhi Hou 2024-11-18  615  
be462c97b7dfd2 Lizhi Hou 2024-11-18  616  	hwctx->status = HWCTX_STAT_INIT;
f4d7b8a6bc8c92 Lizhi Hou 2024-12-13  617  	ndev = xdna->dev_handle;
f4d7b8a6bc8c92 Lizhi Hou 2024-12-13  618  	ndev->hwctx_num++;
be462c97b7dfd2 Lizhi Hou 2024-11-18  619  
be462c97b7dfd2 Lizhi Hou 2024-11-18  620  	XDNA_DBG(xdna, "hwctx %s init completed", hwctx->name);
be462c97b7dfd2 Lizhi Hou 2024-11-18  621  
be462c97b7dfd2 Lizhi Hou 2024-11-18  622  	return 0;
be462c97b7dfd2 Lizhi Hou 2024-11-18  623  
ac49797c1815d4 Lizhi Hou 2024-11-18  624  release_resource:
ac49797c1815d4 Lizhi Hou 2024-11-18  625  	aie2_release_resource(hwctx);
be462c97b7dfd2 Lizhi Hou 2024-11-18  626  free_col_list:
be462c97b7dfd2 Lizhi Hou 2024-11-18  627  	kfree(hwctx->col_list);
aac243092b707b Lizhi Hou 2024-11-18  628  free_entity:
aac243092b707b Lizhi Hou 2024-11-18  629  	drm_sched_entity_destroy(&priv->entity);
aac243092b707b Lizhi Hou 2024-11-18  630  free_sched:
aac243092b707b Lizhi Hou 2024-11-18  631  	drm_sched_fini(&priv->sched);
aac243092b707b Lizhi Hou 2024-11-18  632  free_cmd_bufs:
aac243092b707b Lizhi Hou 2024-11-18  633  	for (i = 0; i < ARRAY_SIZE(priv->cmd_buf); i++) {
aac243092b707b Lizhi Hou 2024-11-18  634  		if (!priv->cmd_buf[i])
aac243092b707b Lizhi Hou 2024-11-18  635  			continue;
aac243092b707b Lizhi Hou 2024-11-18  636  		drm_gem_object_put(to_gobj(priv->cmd_buf[i]));
aac243092b707b Lizhi Hou 2024-11-18  637  	}
ac49797c1815d4 Lizhi Hou 2024-11-18  638  	amdxdna_gem_unpin(heap);
ac49797c1815d4 Lizhi Hou 2024-11-18  639  put_heap:
ac49797c1815d4 Lizhi Hou 2024-11-18  640  	drm_gem_object_put(to_gobj(heap));
be462c97b7dfd2 Lizhi Hou 2024-11-18  641  free_priv:
be462c97b7dfd2 Lizhi Hou 2024-11-18  642  	kfree(priv);
be462c97b7dfd2 Lizhi Hou 2024-11-18  643  	return ret;
be462c97b7dfd2 Lizhi Hou 2024-11-18  644  }
be462c97b7dfd2 Lizhi Hou 2024-11-18  645  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
