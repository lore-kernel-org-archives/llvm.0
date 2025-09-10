Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0842D31D385;
	Wed, 10 Sep 2025 10:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757500447; cv=none; b=SD2NeVPhhAgG4Fu+PwbPSkFVQ+QxNV/baL+05wPTqd1ejACmZcF/xAtqv3ZS3N3F+2110QcoA3iDJ2oJSMDdpZqnqxtY3NK0yN+zHXWINNkKQJXO2MZ+FybPI6FxTM9JbxPTEedd1lOewX4peLUuP6pPnXRBMHREaTsNoE3zs0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757500447; c=relaxed/simple;
	bh=oxsqFwNRVlg7M0UO9AkBCpySyGr1+81AzSEPZrdn848=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HQui82dMpkGeQhJeAXtHytRdqeuJbgqhWmhJwQLrsv+TDBoAZ9b5XHz3MOsyZsicqGGHX/PJvFMq5+zW003BogggoOAcfMhp7L8QePlc9yBwVHXlNl9rlNHxnKyzraUAmFsISAjdfWIAc05Wc4DgKgJ3agjnVcDky2r75+viLtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hl0zOANl; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hl0zOANl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757500445; x=1789036445;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oxsqFwNRVlg7M0UO9AkBCpySyGr1+81AzSEPZrdn848=;
  b=Hl0zOANl8OdQehfsHh1muEHbRGmLMo1QT9sKYI+bQR4QrFY67o2wfZCA
   j8/LN6dOmaAA1C6UouL6p03WVubKvg//GT20qR0O26L+3fH6kmuSx6SNc
   813kPYETq6KAsPJgSH/fpzG/Ds+hjpycv88AbjS61diK/74nrVRVy0L5j
   ivuDjx6z2AiGU9B64Hhzwp61qTZ40wh4mTSVujsO/lxH6t20ltLLNy/nN
   IqfZoqFzlg1umUtdTKfeBRoHK/inS1aKr8bnkIOXMHq5k38MsWrJmi/bf
   Mw3lpy7l96TKRbxZlQTTzbiKPeAm3uJsxTWvQClzGJDAi8vdWYevHSixg
   g==;
X-CSE-ConnectionGUID: sl53WV8kRAOXt4au/TVL0g==
X-CSE-MsgGUID: csiGNxrAQcuFjviOGgTN0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59727753"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="59727753"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 03:34:05 -0700
X-CSE-ConnectionGUID: 9+8SA4x8Ssi+AR34/1p90g==
X-CSE-MsgGUID: 9QB4/o4gSTaHg4nhp68t+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; 
   d="scan'208";a="174145857"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Sep 2025 03:34:03 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwI9I-0005pv-22;
	Wed, 10 Sep 2025 10:34:00 +0000
Date: Wed, 10 Sep 2025 18:33:23 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	intel-xe@lists.freedesktop.org,
	Matthew Brost <matthew.brost@intel.com>
Subject: [drm-xe:drm-xe-next 11/13] drivers/gpu/drm/xe/xe_migrate.c:422:3:
 error: cannot jump from this indirect goto statement to one of its possible
 targets
Message-ID: <202509101853.nDmyxTEM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   844150c255c94230aec41f88db8e2875cb97439e
commit: 59eabff2a3524d7f3bf6c24890cd197c4c116fcb [11/13] drm/xe: Convert xe_bo_create_pin_map() for exhaustive eviction
config: loongarch-randconfig-001-20250910 (https://download.01.org/0day-ci/archive/20250910/202509101853.nDmyxTEM-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250910/202509101853.nDmyxTEM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509101853.nDmyxTEM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/xe/xe_migrate.c:422:3: error: cannot jump from this indirect goto statement to one of its possible targets
     422 |                 drm_exec_retry_on_contention(&exec);
         |                 ^
   include/drm/drm_exec.h:123:4: note: expanded from macro 'drm_exec_retry_on_contention'
     123 |                         goto *__drm_exec_retry_ptr;             \
         |                         ^
   drivers/gpu/drm/xe/xe_migrate.c:465:2: note: possible target of indirect goto statement
     465 |         might_lock(&m->job_mutex);
         |         ^
   include/linux/lockdep.h:552:51: note: expanded from macro 'might_lock'
     552 |         lock_acquire(&(lock)->dep_map, 0, 0, 0, 1, NULL, _THIS_IP_);    \
         |                                                          ^
   include/linux/instruction_pointer.h:10:41: note: expanded from macro '_THIS_IP_'
      10 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&&__here; })
         |                                         ^
   drivers/gpu/drm/xe/xe_migrate.c:420:2: note: jump exits scope of variable with __attribute__((cleanup))
     420 |         xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_val_flags) {}, err) {
         |         ^
   drivers/gpu/drm/xe/xe_validation.h:189:2: note: expanded from macro 'xe_validation_guard'
     189 |         scoped_guard(xe_validation, _ctx, _val, _exec, _flags, _ret) \
         |         ^
   include/linux/cleanup.h:429:2: note: expanded from macro 'scoped_guard'
     429 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^
   include/linux/cleanup.h:420:20: note: expanded from macro '__scoped_guard'
     420 |         for (CLASS(_name, scope)(args);                                 \
         |                           ^
   drivers/gpu/drm/xe/xe_migrate.c:465:2: note: jump enters a statement expression
     465 |         might_lock(&m->job_mutex);
         |         ^
   include/linux/lockdep.h:552:51: note: expanded from macro 'might_lock'
     552 |         lock_acquire(&(lock)->dep_map, 0, 0, 0, 1, NULL, _THIS_IP_);    \
         |                                                          ^
   include/linux/instruction_pointer.h:10:20: note: expanded from macro '_THIS_IP_'
      10 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&&__here; })
         |                    ^
>> drivers/gpu/drm/xe/xe_migrate.c:422:3: error: cannot jump from this indirect goto statement to one of its possible targets
     422 |                 drm_exec_retry_on_contention(&exec);
         |                 ^
   include/drm/drm_exec.h:123:4: note: expanded from macro 'drm_exec_retry_on_contention'
     123 |                         goto *__drm_exec_retry_ptr;             \
         |                         ^
   drivers/gpu/drm/xe/xe_migrate.c:465:2: note: possible target of indirect goto statement
     465 |         might_lock(&m->job_mutex);
         |         ^
   include/linux/lockdep.h:553:33: note: expanded from macro 'might_lock'
     553 |         lock_release(&(lock)->dep_map, _THIS_IP_);                      \
         |                                        ^
   include/linux/instruction_pointer.h:10:41: note: expanded from macro '_THIS_IP_'
      10 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&&__here; })
         |                                         ^
   drivers/gpu/drm/xe/xe_migrate.c:420:2: note: jump exits scope of variable with __attribute__((cleanup))
     420 |         xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_val_flags) {}, err) {
         |         ^
   drivers/gpu/drm/xe/xe_validation.h:189:2: note: expanded from macro 'xe_validation_guard'
     189 |         scoped_guard(xe_validation, _ctx, _val, _exec, _flags, _ret) \
         |         ^
   include/linux/cleanup.h:429:2: note: expanded from macro 'scoped_guard'
     429 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^
   include/linux/cleanup.h:420:20: note: expanded from macro '__scoped_guard'
     420 |         for (CLASS(_name, scope)(args);                                 \
         |                           ^
   drivers/gpu/drm/xe/xe_migrate.c:465:2: note: jump enters a statement expression
     465 |         might_lock(&m->job_mutex);
         |         ^
   include/linux/lockdep.h:553:33: note: expanded from macro 'might_lock'
     553 |         lock_release(&(lock)->dep_map, _THIS_IP_);                      \
         |                                        ^
   include/linux/instruction_pointer.h:10:20: note: expanded from macro '_THIS_IP_'
      10 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&&__here; })
         |                    ^
   2 errors generated.


vim +422 drivers/gpu/drm/xe/xe_migrate.c

   396	
   397	/**
   398	 * xe_migrate_init() - Initialize a migrate context
   399	 * @m: The migration context
   400	 *
   401	 * Return: 0 if successful, negative error code on failure
   402	 */
   403	int xe_migrate_init(struct xe_migrate *m)
   404	{
   405		struct xe_tile *tile = m->tile;
   406		struct xe_gt *primary_gt = tile->primary_gt;
   407		struct xe_device *xe = tile_to_xe(tile);
   408		struct xe_validation_ctx ctx;
   409		struct drm_exec exec;
   410		struct xe_vm *vm;
   411		int err;
   412	
   413		/* Special layout, prepared below.. */
   414		vm = xe_vm_create(xe, XE_VM_FLAG_MIGRATION |
   415				  XE_VM_FLAG_SET_TILE_ID(tile), NULL);
   416		if (IS_ERR(vm))
   417			return PTR_ERR(vm);
   418	
   419		err = 0;
   420		xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_val_flags) {}, err) {
   421			err = xe_vm_drm_exec_lock(vm, &exec);
 > 422			drm_exec_retry_on_contention(&exec);
   423			err = xe_migrate_prepare_vm(tile, m, vm, &exec);
   424			drm_exec_retry_on_contention(&exec);
   425			xe_validation_retry_on_oom(&ctx, &err);
   426		}
   427		if (err)
   428			return err;
   429	
   430		if (xe->info.has_usm) {
   431			struct xe_hw_engine *hwe = xe_gt_hw_engine(primary_gt,
   432								   XE_ENGINE_CLASS_COPY,
   433								   primary_gt->usm.reserved_bcs_instance,
   434								   false);
   435			u32 logical_mask = xe_migrate_usm_logical_mask(primary_gt);
   436	
   437			if (!hwe || !logical_mask) {
   438				err = -EINVAL;
   439				goto err_out;
   440			}
   441	
   442			/*
   443			 * XXX: Currently only reserving 1 (likely slow) BCS instance on
   444			 * PVC, may want to revisit if performance is needed.
   445			 */
   446			m->q = xe_exec_queue_create(xe, vm, logical_mask, 1, hwe,
   447						    EXEC_QUEUE_FLAG_KERNEL |
   448						    EXEC_QUEUE_FLAG_PERMANENT |
   449						    EXEC_QUEUE_FLAG_HIGH_PRIORITY |
   450						    EXEC_QUEUE_FLAG_MIGRATE, 0);
   451		} else {
   452			m->q = xe_exec_queue_create_class(xe, primary_gt, vm,
   453							  XE_ENGINE_CLASS_COPY,
   454							  EXEC_QUEUE_FLAG_KERNEL |
   455							  EXEC_QUEUE_FLAG_PERMANENT |
   456							  EXEC_QUEUE_FLAG_MIGRATE, 0);
   457		}
   458		if (IS_ERR(m->q)) {
   459			err = PTR_ERR(m->q);
   460			goto err_out;
   461		}
   462	
   463		mutex_init(&m->job_mutex);
   464		fs_reclaim_acquire(GFP_KERNEL);
   465		might_lock(&m->job_mutex);
   466		fs_reclaim_release(GFP_KERNEL);
   467	
   468		err = devm_add_action_or_reset(xe->drm.dev, xe_migrate_fini, m);
   469		if (err)
   470			return err;
   471	
   472		if (IS_DGFX(xe)) {
   473			if (xe_migrate_needs_ccs_emit(xe))
   474				/* min chunk size corresponds to 4K of CCS Metadata */
   475				m->min_chunk_size = SZ_4K * SZ_64K /
   476					xe_device_ccs_bytes(xe, SZ_64K);
   477			else
   478				/* Somewhat arbitrary to avoid a huge amount of blits */
   479				m->min_chunk_size = SZ_64K;
   480			m->min_chunk_size = roundup_pow_of_two(m->min_chunk_size);
   481			drm_dbg(&xe->drm, "Migrate min chunk size is 0x%08llx\n",
   482				(unsigned long long)m->min_chunk_size);
   483		}
   484	
   485		return err;
   486	
   487	err_out:
   488		xe_vm_close_and_put(vm);
   489		return err;
   490	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
