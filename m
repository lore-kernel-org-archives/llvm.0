Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354C11DED58;
	Tue,  7 Jan 2025 12:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736251298; cv=none; b=H7QrzHFfWtwOejUxofZf4oZMUKI1wJknwD6p4xob6gXhTkgHwTEJd7y+Tlz35IDl2jtL3nCaA0/2RC6bHIvBkbaiRrBot11LyBvbRvnVNvUpQr4b6OZy+NpqP02FjRSFPvdByAXLOUbPdo63kFLR1RYRZmD3+HHDNEDgWNnbask=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736251298; c=relaxed/simple;
	bh=1xxYm8+Lma6Xb19NLtXLlSEWYgo5SCk2wTJS4fLJ5r4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fk0ciZA2WtPvkIo3Z47Ly2Teg35sUUVAc8H4IDz1jBxf64JGpEFsH1PDZVPNobOeX+YysXRhOkYgEnst5QVFKvH/NTewXsjNfnSNdnGCI849J0fy/Cgh7dbt5QQSDGp39Bj3xQIddPdlGfrFGtgZcmPXDNpFCJS+kDwSaE6ywRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OjD+N38t; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OjD+N38t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736251295; x=1767787295;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=1xxYm8+Lma6Xb19NLtXLlSEWYgo5SCk2wTJS4fLJ5r4=;
  b=OjD+N38t9YRQd0Fb7pvl1mkuW2+JV2h3cGT2WKJ0tGEoLLvWv0AqeFaO
   roWhmuxc2AHBBJap6XfSZeYoT8ug1WQwJS3+v+Vt5YbxywCsTG1Tl7t0k
   VQVvwaXepTP/T5mlBl1Gme82sIvgf97BZK19LB0SJHhbdxVGLNqfHwXuJ
   ky+uFThILpqL8bPkZvJy6M8wLeEgxk2NlAFh+I1WRfrdP/KeDJlJHbrRZ
   zhcrBtnZF5Yj2F4gJMIjnEqlM37D+6hgLUU6iTzciJwbV3oi3C/4gKH2u
   QEJecZJltzaVxNuw7c99/dRW21mV+S6If54Jgh8yl5IX++W65txvpZ/Qc
   Q==;
X-CSE-ConnectionGUID: gkprirPPQxqSk8rw232ahw==
X-CSE-MsgGUID: 7Dd2fwqDT2uI+MIWoy+f2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="36587177"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; 
   d="scan'208";a="36587177"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 04:01:28 -0800
X-CSE-ConnectionGUID: kQPkRcf8SE2/HJm0gq9L6A==
X-CSE-MsgGUID: LwMeN8N9QQu8VAuX6xM6wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="140087113"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 07 Jan 2025 04:01:27 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tV8Gx-000Edf-2X;
	Tue, 07 Jan 2025 12:01:23 +0000
Date: Tue, 7 Jan 2025 20:00:50 +0800
From: kernel test robot <lkp@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Maxime Ripard <mripard@kernel.org>,
	Friedrich Vock <friedrich.vock@gmx.de>
Subject: [mripard:cgroup-dmem-drm 3/4] drivers/gpu/drm/ttm/ttm_bo.c:461:2:
 warning: variable 'ret' is used uninitialized whenever 'if' condition is
 true
Message-ID: <202501071904.2ZS4kmtn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git cgroup-dmem-drm
head:   aa4f9d7f77836d5a48daaa99479c2603e9a548ed
commit: 6627b2708ea9f8e3e3c2e6ee8d5d4bb277edad96 [3/4] drm/ttm: Handle cgroup based eviction in TTM
config: i386-buildonly-randconfig-002-20250107 (https://download.01.org/0day-ci/archive/20250107/202501071904.2ZS4kmtn-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250107/202501071904.2ZS4kmtn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501071904.2ZS4kmtn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/ttm/ttm_bo.c:461:2: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     461 |         if (!ttm_bo_get_unless_zero(bo))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:28: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:57:30: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ttm/ttm_bo.c:486:9: note: uninitialized use occurs here
     486 |         return ret;
         |                ^~~
   drivers/gpu/drm/ttm/ttm_bo.c:461:2: note: remove the 'if' if its condition is always false
     461 |         if (!ttm_bo_get_unless_zero(bo))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     462 |                 goto out_no_ref;
         |                 ~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:23: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                       ^
   drivers/gpu/drm/ttm/ttm_bo.c:451:9: note: initialize the variable 'ret' to silence this warning
     451 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.
--
>> drivers/gpu/drm/ttm/ttm_bo.c:1097: warning: Function parameter or struct member 'hit_low' not described in 'ttm_bo_swapout_walk'
>> drivers/gpu/drm/ttm/ttm_bo.c:1097: warning: Function parameter or struct member 'evict_low' not described in 'ttm_bo_swapout_walk'


vim +461 drivers/gpu/drm/ttm/ttm_bo.c

a2ab19fed9d1dc Christian König   2016-08-30  435  
3756310e9fe1e0 Thomas Hellström  2024-07-05  436  /**
3756310e9fe1e0 Thomas Hellström  2024-07-05  437   * ttm_bo_evict_first() - Evict the first bo on the manager's LRU list.
3756310e9fe1e0 Thomas Hellström  2024-07-05  438   * @bdev: The ttm device.
3756310e9fe1e0 Thomas Hellström  2024-07-05  439   * @man: The manager whose bo to evict.
3756310e9fe1e0 Thomas Hellström  2024-07-05  440   * @ctx: The TTM operation ctx governing the eviction.
d5769ba315d8ff Roger He          2017-12-21  441   *
3756310e9fe1e0 Thomas Hellström  2024-07-05  442   * Return: 0 if successful or the resource disappeared. Negative error code on error.
d5769ba315d8ff Roger He          2017-12-21  443   */
3756310e9fe1e0 Thomas Hellström  2024-07-05  444  int ttm_bo_evict_first(struct ttm_device *bdev, struct ttm_resource_manager *man,
3756310e9fe1e0 Thomas Hellström  2024-07-05  445  		       struct ttm_operation_ctx *ctx)
d5769ba315d8ff Roger He          2017-12-21  446  {
3756310e9fe1e0 Thomas Hellström  2024-07-05  447  	struct ttm_resource_cursor cursor;
3756310e9fe1e0 Thomas Hellström  2024-07-05  448  	struct ttm_buffer_object *bo;
3756310e9fe1e0 Thomas Hellström  2024-07-05  449  	struct ttm_resource *res;
3756310e9fe1e0 Thomas Hellström  2024-07-05  450  	unsigned int mem_type;
6627b2708ea9f8 Maarten Lankhorst 2024-12-04  451  	int ret;
d5769ba315d8ff Roger He          2017-12-21  452  
3756310e9fe1e0 Thomas Hellström  2024-07-05  453  	spin_lock(&bdev->lru_lock);
3756310e9fe1e0 Thomas Hellström  2024-07-05  454  	res = ttm_resource_manager_first(man, &cursor);
3756310e9fe1e0 Thomas Hellström  2024-07-05  455  	ttm_resource_cursor_fini(&cursor);
3756310e9fe1e0 Thomas Hellström  2024-07-05  456  	if (!res) {
3756310e9fe1e0 Thomas Hellström  2024-07-05  457  		ret = -ENOENT;
3756310e9fe1e0 Thomas Hellström  2024-07-05  458  		goto out_no_ref;
a2848d08742c8e Christian König   2023-07-07  459  	}
3756310e9fe1e0 Thomas Hellström  2024-07-05  460  	bo = res->bo;
3756310e9fe1e0 Thomas Hellström  2024-07-05 @461  	if (!ttm_bo_get_unless_zero(bo))
3756310e9fe1e0 Thomas Hellström  2024-07-05  462  		goto out_no_ref;
3756310e9fe1e0 Thomas Hellström  2024-07-05  463  	mem_type = res->mem_type;
3756310e9fe1e0 Thomas Hellström  2024-07-05  464  	spin_unlock(&bdev->lru_lock);
3756310e9fe1e0 Thomas Hellström  2024-07-05  465  	ret = ttm_bo_reserve(bo, ctx->interruptible, ctx->no_wait_gpu, NULL);
3756310e9fe1e0 Thomas Hellström  2024-07-05  466  	if (ret)
3756310e9fe1e0 Thomas Hellström  2024-07-05  467  		goto out_no_lock;
3756310e9fe1e0 Thomas Hellström  2024-07-05  468  	if (!bo->resource || bo->resource->mem_type != mem_type)
3756310e9fe1e0 Thomas Hellström  2024-07-05  469  		goto out_bo_moved;
a2848d08742c8e Christian König   2023-07-07  470  
3756310e9fe1e0 Thomas Hellström  2024-07-05  471  	if (bo->deleted) {
3756310e9fe1e0 Thomas Hellström  2024-07-05  472  		ret = ttm_bo_wait_ctx(bo, ctx);
3756310e9fe1e0 Thomas Hellström  2024-07-05  473  		if (!ret)
3756310e9fe1e0 Thomas Hellström  2024-07-05  474  			ttm_bo_cleanup_memtype_use(bo);
d5769ba315d8ff Roger He          2017-12-21  475  	} else {
3756310e9fe1e0 Thomas Hellström  2024-07-05  476  		ret = ttm_bo_evict(bo, ctx);
d5769ba315d8ff Roger He          2017-12-21  477  	}
3756310e9fe1e0 Thomas Hellström  2024-07-05  478  out_bo_moved:
abb50d67adf3f0 Thomas Hellström  2021-06-02  479  	dma_resv_unlock(bo->base.resv);
3756310e9fe1e0 Thomas Hellström  2024-07-05  480  out_no_lock:
3756310e9fe1e0 Thomas Hellström  2024-07-05  481  	ttm_bo_put(bo);
3756310e9fe1e0 Thomas Hellström  2024-07-05  482  	return ret;
abb50d67adf3f0 Thomas Hellström  2021-06-02  483  
3756310e9fe1e0 Thomas Hellström  2024-07-05  484  out_no_ref:
3756310e9fe1e0 Thomas Hellström  2024-07-05  485  	spin_unlock(&bdev->lru_lock);
d5769ba315d8ff Roger He          2017-12-21  486  	return ret;
d5769ba315d8ff Roger He          2017-12-21  487  }
d5769ba315d8ff Roger He          2017-12-21  488  

:::::: The code at line 461 was first introduced by commit
:::::: 3756310e9fe1e0182adac89cedaa98c0eea66675 drm/ttm: Use the LRU walker for eviction

:::::: TO: Thomas Hellström <thomas.hellstrom@linux.intel.com>
:::::: CC: Christian König <christian.koenig@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
