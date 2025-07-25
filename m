Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB07223DFB;
	Fri, 25 Jul 2025 02:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753410160; cv=none; b=P5WbUNG1oY/wD0zheY/fjeexZKsE8LZUr+ViAiVb53IlUAyXCVkQx8t8G2Thc3KiAiDWU77d24kJDrdzbvM0Qi89SemoPy3rOI1Y0NdOBnZN+BDXYGhbBlbFrM/M7y6DzFOfkayaIQw7May2wc4G7DIXS/9z1G+23HuRaQ8geOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753410160; c=relaxed/simple;
	bh=psH3SNcYx4sNWsvciYOU+gOveBWb4N1s/HEOPTUMr+g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J0Txnu+shTmsU60rSbL5OMbrZZRnR3mHTjJ5ReBTbrg31zC7T1/RqkyHBdMSVzkSP3f5eaYshlXxwIWiQbv6zvoDHJyoyy/5WGGzgJwFwzqO9YHzfeWV3zVVwXScBsOVMib2rnFxa4+7Wmwbn+1gAULfKZ/bDHgnIbwE2aZJEg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B0rdrUJI; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B0rdrUJI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753410158; x=1784946158;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=psH3SNcYx4sNWsvciYOU+gOveBWb4N1s/HEOPTUMr+g=;
  b=B0rdrUJIBYLj9ocXBBTlgVAm1pb8iiYpsFZjmbqazHD6GvdSUgQBgmYt
   dmnXU1kO+jZ5BLCIfeLQFzZDSibDXxM1evt6jFA1LZk0Og6YXtgVSFi53
   ZV4r6pyldlpXVOXbT+l/xkun+qldt3lV62dFoujVuxosEUTQiWHpQWXgt
   sliWSndlkAkVSL5wyMB9TsuOookfSLXzZ7CEOVw+eLuGvZWqqkdkCSkZX
   uT4/BoR3X2yDJoZh+Q5XpvPcUppsiRJJGnlvKxzVauOwVi0BVcbZBDmtO
   X7r2K8Rk/6p6P7AJPoHdWCUpDAbidaRXwXiChrDQPQ9wtzysXbe/VoLJL
   w==;
X-CSE-ConnectionGUID: PLIWlEFFRFeNv3sOkKrF5Q==
X-CSE-MsgGUID: V1cPvH+cTruHZhVtQfbFyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55679663"
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; 
   d="scan'208";a="55679663"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2025 19:22:38 -0700
X-CSE-ConnectionGUID: HM+J0VdrRa2bnW03OFb5tA==
X-CSE-MsgGUID: TOWVWvUeRIuCcOaL9UJIrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; 
   d="scan'208";a="184252446"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa002.fm.intel.com with ESMTP; 24 Jul 2025 19:22:36 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uf84w-00007H-0Y;
	Fri, 25 Jul 2025 02:22:34 +0000
Date: Fri, 25 Jul 2025 04:22:29 +0200
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Rob Clark <robin.clark@oss.qualcomm.com>
Subject: [linux-next:master 6314/12139] drivers/gpu/drm/msm/msm_gem.c:107:47:
 error: incomplete definition of type 'struct msm_kms'
Message-ID: <202507250408.fzggiElx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9ee814bd78e315e4551223ca7548dd3f6bdcf1ae
commit: 98290b0a7d605431480e63ccdb6a118a21a0866c [6314/12139] drm/msm: make it possible to disable KMS-related code.
config: arm-randconfig-2002-20250725 (https://download.01.org/0day-ci/archive/20250725/202507250408.fzggiElx-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b4edd827e4f71c2a0fcb13f79de7eae4545f0aea)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250725/202507250408.fzggiElx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507250408.fzggiElx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/msm/msm_gem.c:107:47: error: incomplete definition of type 'struct msm_kms'
     107 |         msm_gem_lock_vm_and_obj(&exec, obj, priv->kms->vm);
         |                                             ~~~~~~~~~^
   drivers/gpu/drm/msm/msm_drv.h:43:8: note: forward declaration of 'struct msm_kms'
      43 | struct msm_kms;
         |        ^
   drivers/gpu/drm/msm/msm_gem.c:108:32: error: incomplete definition of type 'struct msm_kms'
     108 |         put_iova_spaces(obj, priv->kms->vm, true, "vma_put");
         |                              ~~~~~~~~~^
   drivers/gpu/drm/msm/msm_drv.h:43:8: note: forward declaration of 'struct msm_kms'
      43 | struct msm_kms;
         |        ^
   drivers/gpu/drm/msm/msm_gem.c:669:32: error: incomplete definition of type 'struct msm_kms'
     669 |         return priv->kms && (priv->kms->vm == vm);
         |                              ~~~~~~~~~^
   drivers/gpu/drm/msm/msm_drv.h:43:8: note: forward declaration of 'struct msm_kms'
      43 | struct msm_kms;
         |        ^
   3 errors generated.


vim +107 drivers/gpu/drm/msm/msm_gem.c

3bebfd53af0f7c Rob Clark 2025-06-29   95  
3bebfd53af0f7c Rob Clark 2025-06-29   96  void msm_gem_vma_put(struct drm_gem_object *obj)
3bebfd53af0f7c Rob Clark 2025-06-29   97  {
3bebfd53af0f7c Rob Clark 2025-06-29   98  	struct msm_drm_private *priv = obj->dev->dev_private;
3bebfd53af0f7c Rob Clark 2025-06-29   99  	struct drm_exec exec;
3bebfd53af0f7c Rob Clark 2025-06-29  100  
3bebfd53af0f7c Rob Clark 2025-06-29  101  	if (atomic_dec_return(&to_msm_bo(obj)->vma_ref))
3bebfd53af0f7c Rob Clark 2025-06-29  102  		return;
3bebfd53af0f7c Rob Clark 2025-06-29  103  
3bebfd53af0f7c Rob Clark 2025-06-29  104  	if (!priv->kms)
3bebfd53af0f7c Rob Clark 2025-06-29  105  		return;
3bebfd53af0f7c Rob Clark 2025-06-29  106  
3bebfd53af0f7c Rob Clark 2025-06-29 @107  	msm_gem_lock_vm_and_obj(&exec, obj, priv->kms->vm);
3bebfd53af0f7c Rob Clark 2025-06-29  108  	put_iova_spaces(obj, priv->kms->vm, true, "vma_put");
fe4952b5f27cca Rob Clark 2025-06-29  109  	drm_exec_fini(&exec);     /* drop locks */
204226de27c3a6 Rob Clark 2024-03-01  110  }
204226de27c3a6 Rob Clark 2024-03-01  111  

:::::: The code at line 107 was first introduced by commit
:::::: 3bebfd53af0f7c8ea55094ba7b8b8b907024bb7b drm/msm: Defer VMA unmap for fb unpins

:::::: TO: Rob Clark <robin.clark@oss.qualcomm.com>
:::::: CC: Rob Clark <robin.clark@oss.qualcomm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
