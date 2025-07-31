Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2652512DE;
	Thu, 31 Jul 2025 22:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754000321; cv=none; b=qRa7Kv3amLcCuBuWLuWCXhsihR+bBYQoXwD46vt5wVO1CPyEacI9ssdJRpACnbBdzWUrCZHliBzZGbtyF2qScnazXWniN53xSXhvQqouRx8J18zcpUXzjfrFvcxf3DFMw+HQihIJAjHlwlmOGZ3wm4Vylbzsa5utcKX3ltQZTAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754000321; c=relaxed/simple;
	bh=pHMi4VYatgE/qiZLmAohLvX7F3Zv1OyV7orRiQvjn9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E8CVJmOFSr5jDU80hIKLV0vMN5Z/IYrcVo+qCOG50IzfXqlfcpLjQ7tQzDR2czWtb3QDda6jkxFm5r4+fH/AOJxgm7A5bciAqiexkASSgiePOQEk04WvPfSEjmLVGN6/7Jt0x8y5ybh+PkvhEIGoQa4ievjMP2Exs2iZ2IGUWlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B+Z7fmkY; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B+Z7fmkY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754000320; x=1785536320;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pHMi4VYatgE/qiZLmAohLvX7F3Zv1OyV7orRiQvjn9c=;
  b=B+Z7fmkYtR/HTx0wIkrnm5Ljzx5mOwT8s15CTq2eKkoUcZw2+YgzulNB
   AynHTrWam+oinA8nf6WuQ8FK/1Ix8Ake/xPmKbZRJAxPXSgudljK7AxIc
   XOeOGQK5TqsRHSbdsFm0C6dpdJl1XlWUGCrfpgXFWW4kBvO+tUpp59yXN
   az6XFVu1T46B6Npes1sWPH1gII1L4LjJuHC3XXdbrNOiadKN6djUitna3
   xqZrDkg9PwBM3Fop56AUVgLEl5o0lYauJilRi8HbloCHe0rxqFMMKzTlf
   6IiYBOa8L7/YHoiBr8VsWYq8NXoCEUs3pvsWaPKpyCExFz08AfJ1E7PfN
   Q==;
X-CSE-ConnectionGUID: N/7xgEKKRK6SbQfAPbXGUQ==
X-CSE-MsgGUID: 4i5R0U3ERtqoJQLTIsS8pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="66909720"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="66909720"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 15:18:38 -0700
X-CSE-ConnectionGUID: 4syWzXHVQI2z27qKApGbUg==
X-CSE-MsgGUID: wZ90N51cSeCWpwopaWYX4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="163731559"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 31 Jul 2025 15:18:37 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhbbe-00048O-0z;
	Thu, 31 Jul 2025 22:18:34 +0000
Date: Fri, 1 Aug 2025 06:18:00 +0800
From: kernel test robot <lkp@intel.com>
To: Philipp Zabel <philipp.zabel@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 2/6] drm/amdgpu: don't wake up the GPU when opening
 the device
Message-ID: <202508010626.uE8CD8uK-lkp@intel.com>
References: <20250731-b4-dont-wake-next-v1-2-e51bdc347fa3@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250731-b4-dont-wake-next-v1-2-e51bdc347fa3@gmail.com>

Hi Philipp,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 6ac55eab4fc41e0ea80f9064945e4340f13d8b5c]

url:    https://github.com/intel-lab-lkp/linux/commits/Philipp-Zabel/drm-amdgpu-don-t-wake-up-the-GPU-for-some-IOCTLs/20250731-133938
base:   6ac55eab4fc41e0ea80f9064945e4340f13d8b5c
patch link:    https://lore.kernel.org/r/20250731-b4-dont-wake-next-v1-2-e51bdc347fa3%40gmail.com
patch subject: [PATCH RFC 2/6] drm/amdgpu: don't wake up the GPU when opening the device
config: x86_64-buildonly-randconfig-003-20250801 (https://download.01.org/0day-ci/archive/20250801/202508010626.uE8CD8uK-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250801/202508010626.uE8CD8uK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508010626.uE8CD8uK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c:1434:6: warning: variable 'r' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    1434 |         if (fpriv->initialized)
         |             ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c:1503:9: note: uninitialized use occurs here
    1503 |         return r;
         |                ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c:1434:2: note: remove the 'if' if its condition is always false
    1434 |         if (fpriv->initialized)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
    1435 |                 goto out_unlock;
         |                 ~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c:1431:7: note: initialize the variable 'r' to silence this warning
    1431 |         int r, pasid;
         |              ^
         |               = 0
   1 warning generated.


vim +1434 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c

  1426	
  1427	int amdgpu_driver_init_fpriv(struct drm_device *dev, struct drm_file *file_priv,
  1428				     struct amdgpu_fpriv *fpriv)
  1429	{
  1430		struct amdgpu_device *adev = drm_to_adev(dev);
  1431		int r, pasid;
  1432	
  1433		mutex_lock(&fpriv->init_lock);
> 1434		if (fpriv->initialized)
  1435			goto out_unlock;
  1436	
  1437		pasid = amdgpu_pasid_alloc(16);
  1438		if (pasid < 0) {
  1439			dev_warn(adev->dev, "No more PASIDs available!");
  1440			pasid = 0;
  1441		}
  1442	
  1443		r = amdgpu_xcp_open_device(adev, fpriv, file_priv);
  1444		if (r)
  1445			goto error_pasid;
  1446	
  1447		amdgpu_debugfs_vm_init(file_priv);
  1448	
  1449		r = amdgpu_vm_init(adev, &fpriv->vm, fpriv->xcp_id);
  1450		if (r)
  1451			goto error_pasid;
  1452	
  1453		r = amdgpu_vm_set_pasid(adev, &fpriv->vm, pasid);
  1454		if (r)
  1455			goto error_vm;
  1456	
  1457		fpriv->prt_va = amdgpu_vm_bo_add(adev, &fpriv->vm, NULL);
  1458		if (!fpriv->prt_va) {
  1459			r = -ENOMEM;
  1460			goto error_vm;
  1461		}
  1462	
  1463		if (adev->gfx.mcbp) {
  1464			uint64_t csa_addr = amdgpu_csa_vaddr(adev) & AMDGPU_GMC_HOLE_MASK;
  1465	
  1466			r = amdgpu_map_static_csa(adev, &fpriv->vm, adev->virt.csa_obj,
  1467							&fpriv->csa_va, csa_addr, AMDGPU_CSA_SIZE);
  1468			if (r)
  1469				goto error_vm;
  1470		}
  1471	
  1472		r = amdgpu_seq64_map(adev, &fpriv->vm, &fpriv->seq64_va);
  1473		if (r)
  1474			goto error_vm;
  1475	
  1476		mutex_init(&fpriv->bo_list_lock);
  1477		idr_init_base(&fpriv->bo_list_handles, 1);
  1478	
  1479		r = amdgpu_userq_mgr_init(&fpriv->userq_mgr, file_priv, adev);
  1480		if (r)
  1481			DRM_WARN("Can't setup usermode queues, use legacy workload submission only\n");
  1482	
  1483		r = amdgpu_eviction_fence_init(&fpriv->evf_mgr);
  1484		if (r)
  1485			goto error_vm;
  1486	
  1487		amdgpu_ctx_mgr_init(&fpriv->ctx_mgr, adev);
  1488	
  1489		fpriv->initialized = true;
  1490		goto out_unlock;
  1491	
  1492	error_vm:
  1493		amdgpu_vm_fini(adev, &fpriv->vm);
  1494	
  1495	error_pasid:
  1496		if (pasid) {
  1497			amdgpu_pasid_free(pasid);
  1498			amdgpu_vm_set_pasid(adev, &fpriv->vm, 0);
  1499		}
  1500	
  1501	out_unlock:
  1502		mutex_unlock(&fpriv->init_lock);
  1503		return r;
  1504	}
  1505	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
