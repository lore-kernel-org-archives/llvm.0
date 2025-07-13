Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8967F9;
	Sun, 13 Jul 2025 05:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752383465; cv=none; b=nN41OiwXUDRqIIBg93bQLn0IIF/SMlHMC3DIUKq6KM2kTd+h4RxQov85Uzm9k+qMbaxs5JpSJHyvCdhHsPTT2UQzj1b+nkJrs+38L72E5g6NUMxuJEwhkD5jzr2DltcDKaZnl0HqTxosDMwvGhxQlc5BvnSwEI4WTCSLkew+/0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752383465; c=relaxed/simple;
	bh=UpLPxFXKjZumdtV3OF0HZupz2osyJS8so4bX1t327CA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IXQdq87q60D/zAiASJMIGNIw/FFmA+4eKtU/VVjvA38UC+wlx2gOUS/vBb/rpAV6jwgXdHpGRm7JgjV6rmUGFHKQwPAQjUeJ2+yCYD8GJPGu2+PjZbo8KmUrMV+Vqx7ik5KwFQuZlDcf97+svHFqXcn8PmjtUwnww6uUBaxsX3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WwIm/cwQ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WwIm/cwQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752383463; x=1783919463;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UpLPxFXKjZumdtV3OF0HZupz2osyJS8so4bX1t327CA=;
  b=WwIm/cwQns2P7uQqtYKXSYWUvPn2NXk/lKRGG6xd2SjvUW9ocCDC242u
   7qVqdASJeRHhoOiM2BrX4n88wcHqdUyV15CN97xSzbDzszxtx0dA9gmlE
   qEiRauR0U5Bi1uGWWjM4yVjGkK5MzHFfezzwQpVZkZUhclreFB6QdbfTP
   ubvJoddbM2lRKI9QQefEh3Xg/3dW5m/YPXSp0zRk/1NOUEGJRlPv8sQwh
   fMpYvFA4v/SMeBeS81/tAVa/jaU+y/94zw38KerHIh1FmcGKYWXoNmxGz
   8/29J8mQcsx5iBe1Tinsb+RizhIZvhpV7vcPdkb1dbqCAp4qpBmhZ/6rl
   g==;
X-CSE-ConnectionGUID: ph08qo5zQzO5HrUqoI9qXA==
X-CSE-MsgGUID: tpQ0q2ftT3yGZJscCtAjug==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="53834396"
X-IronPort-AV: E=Sophos;i="6.16,308,1744095600"; 
   d="scan'208";a="53834396"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2025 22:11:02 -0700
X-CSE-ConnectionGUID: ZZz2MYoXTTWaQKAWxF6XPg==
X-CSE-MsgGUID: NlydcaN6TZSUCpvXjHDLCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,308,1744095600"; 
   d="scan'208";a="157220374"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 Jul 2025 22:11:01 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uaozK-0007th-2F;
	Sun, 13 Jul 2025 05:10:58 +0000
Date: Sun, 13 Jul 2025 13:10:27 +0800
From: kernel test robot <lkp@intel.com>
To: Pratap Nirujogi <pratap.nirujogi@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: [agd5f:kq_resets 2304/2346]
 drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c:174: warning: Function parameter or
 struct member 'dmabuf' not described in 'isp_user_buffer_alloc'
Message-ID: <202507131324.TKf4iSOn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git kq_resets
head:   524eebfdd4b30fd63ca774d7ea346bcf0e8e76b1
commit: 5cab8cc383a58877fa0fd9eb566e68b815500cdf [2304/2346] drm/amd/amdgpu: Add helper functions for isp buffers
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250713/202507131324.TKf4iSOn-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250713/202507131324.TKf4iSOn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507131324.TKf4iSOn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c:174: warning: Function parameter or struct member 'dmabuf' not described in 'isp_user_buffer_alloc'
>> drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c:174: warning: Excess function parameter 'dma_buf' description in 'isp_user_buffer_alloc'


vim +174 drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c

   153	
   154	/**
   155	 * isp_user_buffer_alloc - create user buffer object (BO) for isp
   156	 *
   157	 * @dev: isp device handle
   158	 * @dma_buf: DMABUF handle for isp buffer allocated in system memory
   159	 * @buf_obj: GPU buffer object handle to initialize
   160	 * @buf_addr: GPU addr of the pinned BO to initialize
   161	 *
   162	 * Imports isp DMABUF to allocate and pin a user BO for isp internal use. It does
   163	 * GART alloc to generate GPU addr for BO to make it accessible through the
   164	 * GART aperture for ISP HW.
   165	 *
   166	 * This function is exported to allow the V4L2 isp device external to drm device
   167	 * to create and access the isp user BO.
   168	 *
   169	 * Returns:
   170	 * 0 on success, negative error code otherwise.
   171	 */
   172	int isp_user_buffer_alloc(struct device *dev, void *dmabuf,
   173				  void **buf_obj, u64 *buf_addr)
 > 174	{
   175		struct platform_device *ispdev = to_platform_device(dev);
   176		const struct isp_platform_data *isp_pdata;
   177		struct amdgpu_device *adev;
   178		struct mfd_cell *mfd_cell;
   179		struct amdgpu_bo *bo;
   180		u64 gpu_addr;
   181		int ret;
   182	
   183		if (WARN_ON(!ispdev))
   184			return -ENODEV;
   185	
   186		if (WARN_ON(!buf_obj))
   187			return -EINVAL;
   188	
   189		if (WARN_ON(!buf_addr))
   190			return -EINVAL;
   191	
   192		mfd_cell = &ispdev->mfd_cell[0];
   193		if (!mfd_cell)
   194			return -ENODEV;
   195	
   196		isp_pdata = mfd_cell->platform_data;
   197		adev = isp_pdata->adev;
   198	
   199		ret = is_valid_isp_device(ispdev->dev.parent, adev->dev);
   200		if (ret)
   201			return ret;
   202	
   203		ret = amdgpu_bo_create_isp_user(adev, dmabuf,
   204						AMDGPU_GEM_DOMAIN_GTT, &bo, &gpu_addr);
   205		if (ret) {
   206			drm_err(&adev->ddev, "failed to alloc gart user buffer (%d)", ret);
   207			return ret;
   208		}
   209	
   210		*buf_obj = (void *)bo;
   211		*buf_addr = gpu_addr;
   212	
   213		return 0;
   214	}
   215	EXPORT_SYMBOL(isp_user_buffer_alloc);
   216	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
