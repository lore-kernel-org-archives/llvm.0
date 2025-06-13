Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0F42E11B0;
	Fri, 13 Jun 2025 23:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749856291; cv=none; b=jtjz6uGEpI+oMkAQTbv8BAkHTyzALP1lvWqi1cZtfJT+UVDs64yRsheN3Fnu2irBdB/adZJgH1YI4BYow4ZNXwUbNcPkUbVwZhQEg2dA1QkssEvXqXXhocoaPYDHYH5NunqbZkSdrsmCW1uGagtQcBheRZ2ITL0UIqW0o4FtGfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749856291; c=relaxed/simple;
	bh=FxY7/kdKEzHKznKKU3qhwCuLktV47WJE9Jw9Q/2oESM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XyCUZKnLf+kEOjIBL+u0az4LhD4GAO/S/NOSw4EOAM4fx7WyzkSIE4VQ1M4Gd5tVzbZJvbsaDlaDNVg3kQ6+PYxLL5faTZEvwydyW+LDmnyVQWd/8lh8EttcJywth37WDuMAxCZMPou5cemxT+ZCwpQvQpHqFVJ3gaGBiKkmW3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=darsNk1t; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="darsNk1t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749856290; x=1781392290;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FxY7/kdKEzHKznKKU3qhwCuLktV47WJE9Jw9Q/2oESM=;
  b=darsNk1t6bdjW/w5ndmQP7fCG4b9yTrwPpCJI2a/hWiZ/7baQGdR99Dt
   1KnlO0JALwnmeUb2BCKajdsLccBPrn51BHXkShhHpOjDVfOzKcD6Yhovc
   uyaEs0pPkopKOld6n3NrE6SaXQnuX2g7I+ubrX/fX8Mzvm5bIGsopv+sw
   dTbIT12S1HdaAbdYGm8o5VKhj9URnKn3j+iOP5qX0FJVLq3jPYA6JWHBL
   0qIL3Hre7WnbHHNW3OOL4CKDRqYUOLpb6gQMbYgklJBCJIF8TrGPdRUaZ
   OZ6oCLj5KdhlXnKfttc1C3TdVBYsJAnkPX+CiixnNdqA2+q+U3mLq+dBQ
   A==;
X-CSE-ConnectionGUID: KbaaV2a2QaqFhXB+skPG0Q==
X-CSE-MsgGUID: h4eOAeJVQQSIfnTLiiEcJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="52175389"
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; 
   d="scan'208";a="52175389"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 16:11:29 -0700
X-CSE-ConnectionGUID: jeM5RL+XRLOplDXhZQifFQ==
X-CSE-MsgGUID: WQ2XIRD0Ts+ipmk2vEb1XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; 
   d="scan'208";a="151768682"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Jun 2025 16:11:27 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQDYT-000D4M-1U;
	Fri, 13 Jun 2025 23:11:25 +0000
Date: Sat, 14 Jun 2025 07:10:27 +0800
From: kernel test robot <lkp@intel.com>
To: Sunil Khatri <sunil.khatri@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: Re: [PATCH v1 2/2] amdgpu: add debugfs file for pt-base per client-id
Message-ID: <202506140646.VrFqwwXA-lkp@intel.com>
References: <20250613071537.701563-3-sunil.khatri@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613071537.701563-3-sunil.khatri@amd.com>

Hi Sunil,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-exynos/exynos-drm-next]
[also build test ERROR on linus/master drm/drm-next v6.16-rc1 next-20250613]
[cannot apply to drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sunil-Khatri/drm-add-debugfs-support-per-client-id/20250613-151800
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250613071537.701563-3-sunil.khatri%40amd.com
patch subject: [PATCH v1 2/2] amdgpu: add debugfs file for pt-base per client-id
config: arm64-randconfig-003-20250614 (https://download.01.org/0day-ci/archive/20250614/202506140646.VrFqwwXA-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250614/202506140646.VrFqwwXA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506140646.VrFqwwXA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2622:66: error: use of undeclared identifier 'amdgpu_pt_base_fops'; did you mean 'amdgpu_dmabuf_ops'?
    2622 |         debugfs_create_file("pt_base", 0444, file->debugfs_client, vm, &amdgpu_pt_base_fops);
         |                                                                         ^~~~~~~~~~~~~~~~~~~
         |                                                                         amdgpu_dmabuf_ops
   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.h:35:33: note: 'amdgpu_dmabuf_ops' declared here
      35 | extern const struct dma_buf_ops amdgpu_dmabuf_ops;
         |                                 ^
   1 error generated.


vim +2622 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c

  2532	
  2533	/**
  2534	 * amdgpu_vm_init - initialize a vm instance
  2535	 *
  2536	 * @adev: amdgpu_device pointer
  2537	 * @vm: requested vm
  2538	 * @xcp_id: GPU partition selection id
  2539	 *
  2540	 * Init @vm fields.
  2541	 *
  2542	 * Returns:
  2543	 * 0 for success, error for failure.
  2544	 */
  2545	int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm,
  2546			   int32_t xcp_id, struct drm_file *file)
  2547	{
  2548		struct amdgpu_bo *root_bo;
  2549		struct amdgpu_bo_vm *root;
  2550		int r, i;
  2551	
  2552		vm->va = RB_ROOT_CACHED;
  2553		for (i = 0; i < AMDGPU_MAX_VMHUBS; i++)
  2554			vm->reserved_vmid[i] = NULL;
  2555		INIT_LIST_HEAD(&vm->evicted);
  2556		INIT_LIST_HEAD(&vm->evicted_user);
  2557		INIT_LIST_HEAD(&vm->relocated);
  2558		INIT_LIST_HEAD(&vm->moved);
  2559		INIT_LIST_HEAD(&vm->idle);
  2560		INIT_LIST_HEAD(&vm->invalidated);
  2561		spin_lock_init(&vm->status_lock);
  2562		INIT_LIST_HEAD(&vm->freed);
  2563		INIT_LIST_HEAD(&vm->done);
  2564		INIT_KFIFO(vm->faults);
  2565	
  2566		r = amdgpu_vm_init_entities(adev, vm);
  2567		if (r)
  2568			return r;
  2569	
  2570		ttm_lru_bulk_move_init(&vm->lru_bulk_move);
  2571	
  2572		vm->is_compute_context = false;
  2573	
  2574		vm->use_cpu_for_update = !!(adev->vm_manager.vm_update_mode &
  2575					    AMDGPU_VM_USE_CPU_FOR_GFX);
  2576	
  2577		DRM_DEBUG_DRIVER("VM update mode is %s\n",
  2578				 vm->use_cpu_for_update ? "CPU" : "SDMA");
  2579		WARN_ONCE((vm->use_cpu_for_update &&
  2580			   !amdgpu_gmc_vram_full_visible(&adev->gmc)),
  2581			  "CPU update of VM recommended only for large BAR system\n");
  2582	
  2583		if (vm->use_cpu_for_update)
  2584			vm->update_funcs = &amdgpu_vm_cpu_funcs;
  2585		else
  2586			vm->update_funcs = &amdgpu_vm_sdma_funcs;
  2587	
  2588		vm->last_update = dma_fence_get_stub();
  2589		vm->last_unlocked = dma_fence_get_stub();
  2590		vm->last_tlb_flush = dma_fence_get_stub();
  2591		vm->generation = amdgpu_vm_generation(adev, NULL);
  2592	
  2593		mutex_init(&vm->eviction_lock);
  2594		vm->evicting = false;
  2595		vm->tlb_fence_context = dma_fence_context_alloc(1);
  2596	
  2597		r = amdgpu_vm_pt_create(adev, vm, adev->vm_manager.root_level,
  2598					false, &root, xcp_id);
  2599		if (r)
  2600			goto error_free_delayed;
  2601	
  2602		root_bo = amdgpu_bo_ref(&root->bo);
  2603		r = amdgpu_bo_reserve(root_bo, true);
  2604		if (r) {
  2605			amdgpu_bo_unref(&root_bo);
  2606			goto error_free_delayed;
  2607		}
  2608	
  2609		amdgpu_vm_bo_base_init(&vm->root, vm, root_bo);
  2610		r = dma_resv_reserve_fences(root_bo->tbo.base.resv, 1);
  2611		if (r)
  2612			goto error_free_root;
  2613	
  2614		r = amdgpu_vm_pt_clear(adev, vm, root, false);
  2615		if (r)
  2616			goto error_free_root;
  2617	
  2618		r = amdgpu_vm_create_task_info(vm);
  2619		if (r)
  2620			DRM_DEBUG("Failed to create task info for VM\n");
  2621	
> 2622		debugfs_create_file("pt_base", 0444, file->debugfs_client, vm, &amdgpu_pt_base_fops);
  2623		amdgpu_bo_unreserve(vm->root.bo);
  2624		amdgpu_bo_unref(&root_bo);
  2625	
  2626		return 0;
  2627	
  2628	error_free_root:
  2629		amdgpu_vm_pt_free_root(adev, vm);
  2630		amdgpu_bo_unreserve(vm->root.bo);
  2631		amdgpu_bo_unref(&root_bo);
  2632	
  2633	error_free_delayed:
  2634		dma_fence_put(vm->last_tlb_flush);
  2635		dma_fence_put(vm->last_unlocked);
  2636		ttm_lru_bulk_move_fini(&adev->mman.bdev, &vm->lru_bulk_move);
  2637		amdgpu_vm_fini_entities(vm);
  2638	
  2639		return r;
  2640	}
  2641	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
