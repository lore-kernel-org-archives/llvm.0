Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C1D26281;
	Thu, 25 Jul 2024 12:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721911270; cv=none; b=YCjLxEcQb7rTDsaHypbl1a5kpATNaabKp4Iv8cN6OqSMIjFFTve3uTZa7HP3ggN+fhkUCR9E/X8z56c3ODS1YnH0qzfPLdCr4awOswZmIu6GT1YZRLIwe485AfmK7CoI4M7GkAVagA8ZfDBcIUxOYmB2NxGfDaN1ljpVk9wwVM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721911270; c=relaxed/simple;
	bh=2MKN1FsSFj9sgDjJoFwFQbah1pBhvztARZ+XvzMCYsc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pTzW3fdrMJZNb/5Gg4jz3rPF3o7cxG0RznkLzkDoUwZS91JydPq8HPwp5jm2HEzvdUqxbW/su0aPSHtvTBYoXkpGqsV0NpDqAyBuU+Buz4qJO96OBuFF5xo3xBzaFuw5YonPdessBGoS0RSWmPphGj6ymNWyIlooq7lY0Jghnms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zb0gwxEr; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zb0gwxEr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721911268; x=1753447268;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2MKN1FsSFj9sgDjJoFwFQbah1pBhvztARZ+XvzMCYsc=;
  b=Zb0gwxEruBU2Gyeyuxm6mJDxBpA98Px8YZ7+lWyKv2tieWchzLZU61YF
   b6aw8dJsehWmMWbv1t9fo69Ru6PCD5Orl55YpG5RSz8yYgVo+DMxFIXlI
   jn3tCj5E63fQ4BKs2qXka8vg64l/ob+pDMi/EZLf7FaQqXU+HbvRzaGcv
   8zBK27JmBv/jGnQAKaQMTo2zSMV64aZyLRWYbsu3rFtuZbrN6x8iiMMVL
   vRRcCuSDDaizIEGLD8d0TUTKzGAPKFn8r8ypA21bnT26oRQyTcv4iS4r5
   g4y0hGf8O5tMvr8f21SL7PI42Tll2h0qz0UxlDXrcaK5DiXzyo0F4zoA1
   g==;
X-CSE-ConnectionGUID: BxY6TIJhSleRNKrTLUxeqw==
X-CSE-MsgGUID: Gas4UCeRRxSEzIHomHx1aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19601381"
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; 
   d="scan'208";a="19601381"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2024 05:41:07 -0700
X-CSE-ConnectionGUID: 0Fo3sUJKTm+fDKj07yaU0w==
X-CSE-MsgGUID: GKdXoYpoTNaYwr4tdUOGiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; 
   d="scan'208";a="53531963"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 25 Jul 2024 05:41:06 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWxmI-000o6m-1v;
	Thu, 25 Jul 2024 12:41:02 +0000
Date: Thu, 25 Jul 2024 20:40:36 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:rust/panthor-6.10 9/10]
 drivers/gpu/drm/panthor/panthor_drv.c:749:5: error: no previous prototype
 for function '_panthor_ioctl_dev_query'
Message-ID: <202407252021.cDiTaF6q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git rust/panthor-6.10
head:   8d146622f07c7965de15d20b04e0d92bcaa50d87
commit: 1bd8126e54589ff493836d6dc93b829ba99211f4 [9/10] drm/panthor: Add rust driver stub
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240725/202407252021.cDiTaF6q-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240725/202407252021.cDiTaF6q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407252021.cDiTaF6q-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/panthor/panthor_drv.c:749:5: error: no previous prototype for function '_panthor_ioctl_dev_query' [-Werror,-Wmissing-prototypes]
     749 | int _panthor_ioctl_dev_query(struct panthor_device *ptdev, struct drm_panthor_dev_query *args)
         |     ^
   drivers/gpu/drm/panthor/panthor_drv.c:749:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     749 | int _panthor_ioctl_dev_query(struct panthor_device *ptdev, struct drm_panthor_dev_query *args)
         | ^
         | static 
>> drivers/gpu/drm/panthor/panthor_drv.c:778:5: error: no previous prototype for function 'panthor_ioctl_dev_query' [-Werror,-Wmissing-prototypes]
     778 | int panthor_ioctl_dev_query(struct drm_device *ddev, void *data, struct drm_file *file)
         |     ^
   drivers/gpu/drm/panthor/panthor_drv.c:778:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     778 | int panthor_ioctl_dev_query(struct drm_device *ddev, void *data, struct drm_file *file)
         | ^
         | static 
>> drivers/gpu/drm/panthor/panthor_drv.c:787:5: error: no previous prototype for function '_panthor_ioctl_vm_create' [-Werror,-Wmissing-prototypes]
     787 | int _panthor_ioctl_vm_create(struct panthor_device *ptdev, struct drm_panthor_vm_create *args,
         |     ^
   drivers/gpu/drm/panthor/panthor_drv.c:787:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     787 | int _panthor_ioctl_vm_create(struct panthor_device *ptdev, struct drm_panthor_vm_create *args,
         | ^
         | static 
>> drivers/gpu/drm/panthor/panthor_drv.c:806:5: error: no previous prototype for function 'panthor_ioctl_vm_create' [-Werror,-Wmissing-prototypes]
     806 | int panthor_ioctl_vm_create(struct drm_device *ddev, void *data,
         |     ^
   drivers/gpu/drm/panthor/panthor_drv.c:806:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     806 | int panthor_ioctl_vm_create(struct drm_device *ddev, void *data,
         | ^
         | static 
>> drivers/gpu/drm/panthor/panthor_drv.c:888:5: error: no previous prototype for function 'panthor_group_submit' [-Werror,-Wmissing-prototypes]
     888 | int panthor_group_submit(struct drm_device *ddev, struct drm_panthor_group_submit *args,
         |     ^
   drivers/gpu/drm/panthor/panthor_drv.c:888:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     888 | int panthor_group_submit(struct drm_device *ddev, struct drm_panthor_group_submit *args,
         | ^
         | static 
>> drivers/gpu/drm/panthor/panthor_drv.c:1010:5: error: no previous prototype for function '_panthor_group_create' [-Werror,-Wmissing-prototypes]
    1010 | int _panthor_group_create(struct drm_panthor_group_create *args,
         |     ^
   drivers/gpu/drm/panthor/panthor_drv.c:1010:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1010 | int _panthor_group_create(struct drm_panthor_group_create *args,
         | ^
         | static 
>> drivers/gpu/drm/panthor/panthor_drv.c:1048:5: error: no previous prototype for function 'panthor_tiler_heap_create' [-Werror,-Wmissing-prototypes]
    1048 | int panthor_tiler_heap_create(struct panthor_file *pfile,
         |     ^
   drivers/gpu/drm/panthor/panthor_drv.c:1048:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1048 | int panthor_tiler_heap_create(struct panthor_file *pfile,
         | ^
         | static 
>> drivers/gpu/drm/panthor/panthor_drv.c:1096:5: error: no previous prototype for function 'panthor_tiler_heap_destroy' [-Werror,-Wmissing-prototypes]
    1096 | int panthor_tiler_heap_destroy(struct panthor_file *pfile,
         |     ^
   drivers/gpu/drm/panthor/panthor_drv.c:1096:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1096 | int panthor_tiler_heap_destroy(struct panthor_file *pfile,
         | ^
         | static 
>> drivers/gpu/drm/panthor/panthor_drv.c:1131:5: error: no previous prototype for function 'panthor_ioctl_vm_bind_async' [-Werror,-Wmissing-prototypes]
    1131 | int panthor_ioctl_vm_bind_async(struct drm_panthor_vm_bind *args,
         |     ^
   drivers/gpu/drm/panthor/panthor_drv.c:1131:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1131 | int panthor_ioctl_vm_bind_async(struct drm_panthor_vm_bind *args,
         | ^
         | static 
>> drivers/gpu/drm/panthor/panthor_drv.c:1199:5: error: no previous prototype for function 'panthor_ioctl_vm_bind_sync' [-Werror,-Wmissing-prototypes]
    1199 | int panthor_ioctl_vm_bind_sync(struct drm_panthor_vm_bind *args,
         |     ^
   drivers/gpu/drm/panthor/panthor_drv.c:1199:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1199 | int panthor_ioctl_vm_bind_sync(struct drm_panthor_vm_bind *args,
         | ^
         | static 
   drivers/gpu/drm/panthor/panthor_drv.c:1272:1: error: no previous prototype for function '_panthor_open' [-Werror,-Wmissing-prototypes]
    1272 | _panthor_open(struct panthor_device *ptdev, struct drm_file *file)
         | ^
   drivers/gpu/drm/panthor/panthor_drv.c:1271:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1271 | int
         | ^
         | static 
   11 errors generated.


vim +/_panthor_ioctl_dev_query +749 drivers/gpu/drm/panthor/panthor_drv.c

   748	
 > 749	int _panthor_ioctl_dev_query(struct panthor_device *ptdev, struct drm_panthor_dev_query *args)
   750	{
   751		if (!args->pointer) {
   752			switch (args->type) {
   753			case DRM_PANTHOR_DEV_QUERY_GPU_INFO:
   754				args->size = sizeof(ptdev->gpu_info);
   755				return 0;
   756	
   757			case DRM_PANTHOR_DEV_QUERY_CSIF_INFO:
   758				args->size = sizeof(ptdev->csif_info);
   759				return 0;
   760	
   761			default:
   762				return -EINVAL;
   763			}
   764		}
   765	
   766		switch (args->type) {
   767		case DRM_PANTHOR_DEV_QUERY_GPU_INFO:
   768			return PANTHOR_UOBJ_SET(args->pointer, args->size, ptdev->gpu_info);
   769	
   770		case DRM_PANTHOR_DEV_QUERY_CSIF_INFO:
   771			return PANTHOR_UOBJ_SET(args->pointer, args->size, ptdev->csif_info);
   772	
   773		default:
   774			return -EINVAL;
   775		}
   776	}
   777	
 > 778	int panthor_ioctl_dev_query(struct drm_device *ddev, void *data, struct drm_file *file)
   779	{
   780		struct panthor_file *pfile = file->driver_priv;
   781	
   782		return _panthor_ioctl_dev_query(pfile->ptdev, data);
   783	}
   784	
   785	#define PANTHOR_VM_CREATE_FLAGS			0
   786	
 > 787	int _panthor_ioctl_vm_create(struct panthor_device *ptdev, struct drm_panthor_vm_create *args,
   788				    const struct drm_file *file)
   789	{
   790		struct panthor_file *pfile = file->driver_priv;
   791		int cookie, ret;
   792	
   793		if (!drm_dev_enter(ptdev->base, &cookie))
   794			return -ENODEV;
   795	
   796		ret = panthor_vm_pool_create_vm(ptdev, pfile->vms,  args);
   797		if (ret >= 0) {
   798			args->id = ret;
   799			ret = 0;
   800		}
   801	
   802		drm_dev_exit(cookie);
   803		return ret;
   804	}
   805	
 > 806	int panthor_ioctl_vm_create(struct drm_device *ddev, void *data,
   807				    struct drm_file *file)
   808	{
   809		struct panthor_file *pfile = file->driver_priv;
   810	
   811		return _panthor_ioctl_vm_create(pfile->ptdev, data, file);
   812	}
   813	
   814	static int panthor_ioctl_vm_destroy(struct drm_device *ddev, void *data,
   815					    struct drm_file *file)
   816	{
   817		struct panthor_file *pfile = file->driver_priv;
   818		struct drm_panthor_vm_destroy *args = data;
   819	
   820		if (args->pad)
   821			return -EINVAL;
   822	
   823		return panthor_vm_pool_destroy_vm(pfile->vms, args->id);
   824	}
   825	
   826	#define PANTHOR_BO_FLAGS		DRM_PANTHOR_BO_NO_MMAP
   827	
   828	static int panthor_ioctl_bo_create(struct drm_device *ddev, void *data,
   829					   struct drm_file *file)
   830	{
   831		struct panthor_file *pfile = file->driver_priv;
   832		struct drm_panthor_bo_create *args = data;
   833		struct panthor_vm *vm = NULL;
   834		int cookie, ret;
   835	
   836		if (!drm_dev_enter(ddev, &cookie))
   837			return -ENODEV;
   838	
   839		if (!args->size || args->pad ||
   840		    (args->flags & ~PANTHOR_BO_FLAGS)) {
   841			ret = -EINVAL;
   842			goto out_dev_exit;
   843		}
   844	
   845		if (args->exclusive_vm_id) {
   846			vm = panthor_vm_pool_get_vm(pfile->vms, args->exclusive_vm_id);
   847			if (!vm) {
   848				ret = -EINVAL;
   849				goto out_dev_exit;
   850			}
   851		}
   852	
   853		ret = panthor_gem_create_with_handle(file, ddev, vm, &args->size,
   854						     args->flags, &args->handle);
   855	
   856		panthor_vm_put(vm);
   857	
   858	out_dev_exit:
   859		drm_dev_exit(cookie);
   860		return ret;
   861	}
   862	
   863	static int panthor_ioctl_bo_mmap_offset(struct drm_device *ddev, void *data,
   864						struct drm_file *file)
   865	{
   866		struct drm_panthor_bo_mmap_offset *args = data;
   867		struct drm_gem_object *obj;
   868		int ret;
   869	
   870		if (args->pad)
   871			return -EINVAL;
   872	
   873		obj = drm_gem_object_lookup(file, args->handle);
   874		if (!obj)
   875			return -ENOENT;
   876	
   877		ret = drm_gem_create_mmap_offset(obj);
   878		if (ret)
   879			goto out;
   880	
   881		args->offset = drm_vma_node_offset_addr(&obj->vma_node);
   882	
   883	out:
   884		drm_gem_object_put(obj);
   885		return ret;
   886	}
   887	
 > 888	int panthor_group_submit(struct drm_device *ddev, struct drm_panthor_group_submit *args,
   889				 struct drm_file *file)
   890	{
   891		struct panthor_file *pfile = file->driver_priv;
   892		struct drm_panthor_queue_submit *jobs_args;
   893		struct panthor_submit_ctx ctx;
   894		int ret = 0, cookie;
   895	
   896		if (args->pad)
   897			return -EINVAL;
   898	
   899		if (!drm_dev_enter(ddev, &cookie))
   900			return -ENODEV;
   901	
   902		ret = PANTHOR_UOBJ_GET_ARRAY(jobs_args, &args->queue_submits);
   903		if (ret)
   904			goto out_dev_exit;
   905	
   906		ret = panthor_submit_ctx_init(&ctx, file, args->queue_submits.count);
   907		if (ret)
   908			goto out_free_jobs_args;
   909	
   910		/* Create jobs and attach sync operations */
   911		for (u32 i = 0; i < args->queue_submits.count; i++) {
   912			const struct drm_panthor_queue_submit *qsubmit = &jobs_args[i];
   913			struct drm_sched_job *job;
   914	
   915			job = panthor_job_create(pfile, args->group_handle, qsubmit);
   916			if (IS_ERR(job)) {
   917				ret = PTR_ERR(job);
   918				goto out_cleanup_submit_ctx;
   919			}
   920	
   921			ret = panthor_submit_ctx_add_job(&ctx, i, job, &qsubmit->syncs);
   922			if (ret)
   923				goto out_cleanup_submit_ctx;
   924		}
   925	
   926		/*
   927		 * Collect signal operations on all jobs, such that each job can pick
   928		 * from it for its dependencies and update the fence to signal when the
   929		 * job is submitted.
   930		 */
   931		ret = panthor_submit_ctx_collect_jobs_signal_ops(&ctx);
   932		if (ret)
   933			goto out_cleanup_submit_ctx;
   934	
   935		/*
   936		 * We acquire/prepare revs on all jobs before proceeding with the
   937		 * dependency registration.
   938		 *
   939		 * This is solving two problems:
   940		 * 1. drm_sched_job_arm() and drm_sched_entity_push_job() must be
   941		 *    protected by a lock to make sure no concurrent access to the same
   942		 *    entity get interleaved, which would mess up with the fence seqno
   943		 *    ordering. Luckily, one of the resv being acquired is the VM resv,
   944		 *    and a scheduling entity is only bound to a single VM. As soon as
   945		 *    we acquire the VM resv, we should be safe.
   946		 * 2. Jobs might depend on fences that were issued by previous jobs in
   947		 *    the same batch, so we can't add dependencies on all jobs before
   948		 *    arming previous jobs and registering the fence to the signal
   949		 *    array, otherwise we might miss dependencies, or point to an
   950		 *    outdated fence.
   951		 */
   952		if (args->queue_submits.count > 0) {
   953			/* All jobs target the same group, so they also point to the same VM. */
   954			struct panthor_vm *vm = panthor_job_vm(ctx.jobs[0].job);
   955	
   956			drm_exec_until_all_locked(&ctx.exec) {
   957				ret = panthor_vm_prepare_mapped_bos_resvs(&ctx.exec, vm,
   958									  args->queue_submits.count);
   959			}
   960	
   961			if (ret)
   962				goto out_cleanup_submit_ctx;
   963		}
   964	
   965		/*
   966		 * Now that resvs are locked/prepared, we can iterate over each job to
   967		 * add the dependencies, arm the job fence, register the job fence to
   968		 * the signal array.
   969		 */
   970		ret = panthor_submit_ctx_add_deps_and_arm_jobs(&ctx);
   971		if (ret)
   972			goto out_cleanup_submit_ctx;
   973	
   974		/* Nothing can fail after that point, so we can make our job fences
   975		 * visible to the outside world. Push jobs and set the job fences to
   976		 * the resv slots we reserved.  This also pushes the fences to the
   977		 * syncobjs that are part of the signal array.
   978		 */
   979		panthor_submit_ctx_push_jobs(&ctx, panthor_job_update_resvs);
   980	
   981	out_cleanup_submit_ctx:
   982		panthor_submit_ctx_cleanup(&ctx, panthor_job_put);
   983	
   984	out_free_jobs_args:
   985		kvfree(jobs_args);
   986	
   987	out_dev_exit:
   988		drm_dev_exit(cookie);
   989		return ret;
   990	}
   991	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
