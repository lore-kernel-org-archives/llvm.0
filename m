Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7C22DFF19;
	Wed, 28 Jan 2026 11:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769600857; cv=none; b=OKzYaFCA7SiH6drQvfCRuQjkUanMJiFAmQaYZK++fTDtoZHgUA4ZZM2aWOqn4CHDVObChXJiuYlrMrnI+pYhmSCTkHVaEjMGaT27yKnpVohEuigNQzBVLdNJjWATqm1GSbRnlucBhN6PWf/kYJpz2xPK+Kya+5CufiEuejVsmDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769600857; c=relaxed/simple;
	bh=t3xe/TUUKzvOE5jq7nSNPtv2xipMejDwS/Fg4eBpsQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H+y7FQXwNJ6bqMkqE+37cx5+VjzY6s/vIS12aKQuyf1VsqWOG7QWqi4yeM+Wme7pGhJarcEUHJiRCEcoQ+xnb7+ouNnXYG3CFVq/vt0AN8zrECuYBvQCALRC9Or0dttcFiRamCZmsGQzWAR4/5yPfK/4vnL9tzCgqaSqF10OZjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=djyF5M3o; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="djyF5M3o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769600856; x=1801136856;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=t3xe/TUUKzvOE5jq7nSNPtv2xipMejDwS/Fg4eBpsQk=;
  b=djyF5M3o1iCxYjn3aViQRZsqySvjaICqSEOkEd+37Q0GHQAji/jncWuP
   nT72TTTDvJggkQzHC5nbFHwyW7hwfp/REBrTlPDJ8XYquS3/AW8XZN417
   Z3OKd8rmtao04V+BsF2JUoKXwEc9c80a3lgKTFc0KeHEU0LAYqdFVl9jM
   eykV4NYbkETmGHAze7CqezDQ2KFRjZb5ncm9DByf4A0F/oIHSkNoA9LcU
   5CwBvLMt2M/dx8q2TVGJeThK+BiF1uLNuiysv8ZC8JTDbeuGyEN80JH7w
   ASQUxSGcDW6mBtEmXmDcDpTCwXtL14Bn4HHPf/TDhkiikHo8qIBFGFOJf
   g==;
X-CSE-ConnectionGUID: bnncKemISWCVtuwZv4onjA==
X-CSE-MsgGUID: vOWdo3qNSQyKkBAKrOgbpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="93467605"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="93467605"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 03:47:35 -0800
X-CSE-ConnectionGUID: F23FKklHRLmbbZP3ooeq5w==
X-CSE-MsgGUID: v7fLClSKSrSiPcO51Alw2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="239499886"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 28 Jan 2026 03:47:34 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vl41D-00000000Zd6-3qMn;
	Wed, 28 Jan 2026 11:47:31 +0000
Date: Wed, 28 Jan 2026 19:46:50 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 09/11] drm/xe: Drop BO dma-resv lock during SVM
 migrate-to-device
Message-ID: <202601281948.nDN28R3t-lkp@intel.com>
References: <20260128004841.2436896-10-matthew.brost@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260128004841.2436896-10-matthew.brost@intel.com>

Hi Matthew,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on drm/drm-next drm-tip/drm-tip next-20260127]
[cannot apply to drm-misc/drm-misc-next daeinki-drm-exynos/exynos-drm-next drm-i915/for-linux-next drm-i915/for-linux-next-fixes linus/master v6.19-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Brost/drm-pagemap-Add-helper-to-access-zone_device_data/20260128-085843
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20260128004841.2436896-10-matthew.brost%40intel.com
patch subject: [RFC PATCH v3 09/11] drm/xe: Drop BO dma-resv lock during SVM migrate-to-device
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260128/202601281948.nDN28R3t-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601281948.nDN28R3t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601281948.nDN28R3t-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/xe/xe_svm.c:1048:2: warning: variable 'bo' is used uninitialized whenever '||' condition is false [-Wsometimes-uninitialized]
    1048 |         xe_validation_guard(&vctx, &xe->val, &exec, (struct xe_val_flags) {}, err) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_validation.h:189:2: note: expanded from macro 'xe_validation_guard'
     189 |         scoped_guard(xe_validation, _ctx, _val, _exec, _flags, &_ret) \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:442:2: note: expanded from macro 'scoped_guard'
     442 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:434:7: note: expanded from macro '__scoped_guard'
     434 |              __guard_ptr(_name)(&scope) || !__is_cond_ptr(_name);       \
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:416:28: note: expanded from macro '__guard_ptr'
     416 | #define __guard_ptr(_name) class_##_name##_lock_ptr
         |                            ^
   <scratch space>:25:1: note: expanded from here
      25 | class_xe_validation_lock_ptr
         | ^
   drivers/gpu/drm/xe/xe_svm.c:1090:39: note: uninitialized use occurs here
    1090 |         err = drm_pagemap_migrate_to_devmem(&bo->devmem_allocation, mm,
         |                                              ^~
   drivers/gpu/drm/xe/xe_svm.c:1048:2: note: remove the '||' if its condition is always true
    1048 |         xe_validation_guard(&vctx, &xe->val, &exec, (struct xe_val_flags) {}, err) {
         |         ^
   drivers/gpu/drm/xe/xe_validation.h:189:2: note: expanded from macro 'xe_validation_guard'
     189 |         scoped_guard(xe_validation, _ctx, _val, _exec, _flags, &_ret) \
         |         ^
   include/linux/cleanup.h:442:2: note: expanded from macro 'scoped_guard'
     442 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^
   include/linux/cleanup.h:434:7: note: expanded from macro '__scoped_guard'
     434 |              __guard_ptr(_name)(&scope) || !__is_cond_ptr(_name);       \
         |              ^
   include/linux/cleanup.h:416:28: note: expanded from macro '__guard_ptr'
     416 | #define __guard_ptr(_name) class_##_name##_lock_ptr
         |                            ^
   <scratch space>:25:1: note: expanded from here
      25 | class_xe_validation_lock_ptr
         | ^
   drivers/gpu/drm/xe/xe_svm.c:1040:18: note: initialize the variable 'bo' to silence this warning
    1040 |         struct xe_bo *bo;
         |                         ^
         |                          = NULL
   1 warning generated.


vim +1048 drivers/gpu/drm/xe/xe_svm.c

c904d4e2d73216 Himal Prasad Ghimiray 2025-05-13  1020  
f86ad0ed620cb3 Matthew Brost         2025-06-19  1021  #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
b5870168783168 Thomas Hellström      2025-06-19  1022  static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
b5870168783168 Thomas Hellström      2025-06-19  1023  				      unsigned long start, unsigned long end,
b5870168783168 Thomas Hellström      2025-06-19  1024  				      struct mm_struct *mm,
b5870168783168 Thomas Hellström      2025-06-19  1025  				      unsigned long timeslice_ms)
2f118c949160d1 Matthew Brost         2025-03-05  1026  {
8a52f4d9b1efc9 Thomas Hellström      2025-12-19  1027  	struct xe_pagemap *xpagemap = container_of(dpagemap, typeof(*xpagemap), dpagemap);
75af93b3f5d0ab Thomas Hellström      2025-12-19  1028  	struct drm_pagemap_migrate_details mdetails = {
75af93b3f5d0ab Thomas Hellström      2025-12-19  1029  		.timeslice_ms = timeslice_ms,
75af93b3f5d0ab Thomas Hellström      2025-12-19  1030  		.source_peer_migrates = 1,
75af93b3f5d0ab Thomas Hellström      2025-12-19  1031  	};
8a52f4d9b1efc9 Thomas Hellström      2025-12-19  1032  	struct xe_vram_region *vr = xe_pagemap_to_vr(xpagemap);
16b5ad31952476 Thomas Hellström      2025-12-19  1033  	struct dma_fence *pre_migrate_fence = NULL;
4b0a5f5ce7849a Piotr Piórkowski      2025-07-14  1034  	struct xe_device *xe = vr->xe;
b5870168783168 Thomas Hellström      2025-06-19  1035  	struct device *dev = xe->drm.dev;
2f118c949160d1 Matthew Brost         2025-03-05  1036  	struct drm_buddy_block *block;
1710cd5c8c1bac Thomas Hellström      2025-09-08  1037  	struct xe_validation_ctx vctx;
2f118c949160d1 Matthew Brost         2025-03-05  1038  	struct list_head *blocks;
1710cd5c8c1bac Thomas Hellström      2025-09-08  1039  	struct drm_exec exec;
2f118c949160d1 Matthew Brost         2025-03-05  1040  	struct xe_bo *bo;
1710cd5c8c1bac Thomas Hellström      2025-09-08  1041  	int err = 0, idx;
f86ad0ed620cb3 Matthew Brost         2025-06-19  1042  
b5870168783168 Thomas Hellström      2025-06-19  1043  	if (!drm_dev_enter(&xe->drm, &idx))
b5870168783168 Thomas Hellström      2025-06-19  1044  		return -ENODEV;
d92eabb370ceb1 Matthew Brost         2025-03-05  1045  
b5870168783168 Thomas Hellström      2025-06-19  1046  	xe_pm_runtime_get(xe);
2f118c949160d1 Matthew Brost         2025-03-05  1047  
1710cd5c8c1bac Thomas Hellström      2025-09-08 @1048  	xe_validation_guard(&vctx, &xe->val, &exec, (struct xe_val_flags) {}, err) {
1710cd5c8c1bac Thomas Hellström      2025-09-08  1049  		bo = xe_bo_create_locked(xe, NULL, NULL, end - start,
2f118c949160d1 Matthew Brost         2025-03-05  1050  					 ttm_bo_type_device,
4b0a5f5ce7849a Piotr Piórkowski      2025-07-14  1051  					 (IS_DGFX(xe) ? XE_BO_FLAG_VRAM(vr) : XE_BO_FLAG_SYSTEM) |
1710cd5c8c1bac Thomas Hellström      2025-09-08  1052  					 XE_BO_FLAG_CPU_ADDR_MIRROR, &exec);
1710cd5c8c1bac Thomas Hellström      2025-09-08  1053  		drm_exec_retry_on_contention(&exec);
2f118c949160d1 Matthew Brost         2025-03-05  1054  		if (IS_ERR(bo)) {
2f118c949160d1 Matthew Brost         2025-03-05  1055  			err = PTR_ERR(bo);
1710cd5c8c1bac Thomas Hellström      2025-09-08  1056  			xe_validation_retry_on_oom(&vctx, &err);
1710cd5c8c1bac Thomas Hellström      2025-09-08  1057  			break;
2f118c949160d1 Matthew Brost         2025-03-05  1058  		}
2f118c949160d1 Matthew Brost         2025-03-05  1059  
16b5ad31952476 Thomas Hellström      2025-12-19  1060  		/* Ensure that any clearing or async eviction will complete before migration. */
16b5ad31952476 Thomas Hellström      2025-12-19  1061  		if (!dma_resv_test_signaled(bo->ttm.base.resv, DMA_RESV_USAGE_KERNEL)) {
16b5ad31952476 Thomas Hellström      2025-12-19  1062  			err = dma_resv_get_singleton(bo->ttm.base.resv, DMA_RESV_USAGE_KERNEL,
16b5ad31952476 Thomas Hellström      2025-12-19  1063  						     &pre_migrate_fence);
16b5ad31952476 Thomas Hellström      2025-12-19  1064  			if (err)
16b5ad31952476 Thomas Hellström      2025-12-19  1065  				dma_resv_wait_timeout(bo->ttm.base.resv, DMA_RESV_USAGE_KERNEL,
16b5ad31952476 Thomas Hellström      2025-12-19  1066  						      false, MAX_SCHEDULE_TIMEOUT);
16b5ad31952476 Thomas Hellström      2025-12-19  1067  			else if (pre_migrate_fence)
16b5ad31952476 Thomas Hellström      2025-12-19  1068  				dma_fence_enable_sw_signaling(pre_migrate_fence);
16b5ad31952476 Thomas Hellström      2025-12-19  1069  		}
16b5ad31952476 Thomas Hellström      2025-12-19  1070  
b5870168783168 Thomas Hellström      2025-06-19  1071  		drm_pagemap_devmem_init(&bo->devmem_allocation, dev, mm,
16b5ad31952476 Thomas Hellström      2025-12-19  1072  					&dpagemap_devmem_ops, dpagemap, end - start,
16b5ad31952476 Thomas Hellström      2025-12-19  1073  					pre_migrate_fence);
2f118c949160d1 Matthew Brost         2025-03-05  1074  
2f118c949160d1 Matthew Brost         2025-03-05  1075  		blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
2f118c949160d1 Matthew Brost         2025-03-05  1076  		list_for_each_entry(block, blocks, link)
2f118c949160d1 Matthew Brost         2025-03-05  1077  			block->private = vr;
2f118c949160d1 Matthew Brost         2025-03-05  1078  
c9db07cab766b6 Thomas Hellström      2025-03-26  1079  		xe_bo_get(bo);
06ede36b0000e3 Matthew Brost         2026-01-27  1080  		/* Guard against eviction */
06ede36b0000e3 Matthew Brost         2026-01-27  1081  		ttm_bo_pin(&bo->ttm);
b5870168783168 Thomas Hellström      2025-06-19  1082  
b5870168783168 Thomas Hellström      2025-06-19  1083  		/* Ensure the device has a pm ref while there are device pages active. */
b5870168783168 Thomas Hellström      2025-06-19  1084  		xe_pm_runtime_get_noresume(xe);
06ede36b0000e3 Matthew Brost         2026-01-27  1085  		xe_bo_unlock(bo);
06ede36b0000e3 Matthew Brost         2026-01-27  1086  
06ede36b0000e3 Matthew Brost         2026-01-27  1087  	}
06ede36b0000e3 Matthew Brost         2026-01-27  1088  
75af93b3f5d0ab Thomas Hellström      2025-12-19  1089  	/* Consumes the devmem allocation ref. */
b5870168783168 Thomas Hellström      2025-06-19  1090  	err = drm_pagemap_migrate_to_devmem(&bo->devmem_allocation, mm,
75af93b3f5d0ab Thomas Hellström      2025-12-19  1091  					    start, end, &mdetails);
06ede36b0000e3 Matthew Brost         2026-01-27  1092  
06ede36b0000e3 Matthew Brost         2026-01-27  1093  	xe_bo_lock(bo, false);
06ede36b0000e3 Matthew Brost         2026-01-27  1094  	ttm_bo_unpin(&bo->ttm);
06ede36b0000e3 Matthew Brost         2026-01-27  1095  	ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
c9db07cab766b6 Thomas Hellström      2025-03-26  1096  	xe_bo_unlock(bo);
06ede36b0000e3 Matthew Brost         2026-01-27  1097  
c9db07cab766b6 Thomas Hellström      2025-03-26  1098  	xe_bo_put(bo);
06ede36b0000e3 Matthew Brost         2026-01-27  1099  
b5870168783168 Thomas Hellström      2025-06-19  1100  	xe_pm_runtime_put(xe);
b5870168783168 Thomas Hellström      2025-06-19  1101  	drm_dev_exit(idx);
2f118c949160d1 Matthew Brost         2025-03-05  1102  
2f118c949160d1 Matthew Brost         2025-03-05  1103  	return err;
2f118c949160d1 Matthew Brost         2025-03-05  1104  }
6c55404d4f7306 Thomas Hellström      2025-03-26  1105  #endif
6c55404d4f7306 Thomas Hellström      2025-03-26  1106  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
