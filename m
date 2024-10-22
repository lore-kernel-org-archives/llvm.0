Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F90154426;
	Tue, 22 Oct 2024 10:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729594476; cv=none; b=cHqtipCMtxTSmWgdfusvvmlXrwXhQ3l62Tb4/SbS+NiY7gywZzqJARChKPkAJY9osfyzNO3TYBKMjB1OlWSjmnUxGgp34SaGR0Ok/sHCTT6AMXr9NrfdTT1bZK1+X3HsDkHvAFXqY4SEN2ES8rv9uEhMRoBOs5aEJGwneXdz/gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729594476; c=relaxed/simple;
	bh=BfsXnKhdgJzMKG/7b6rB43K6MAL7dLyNXcY3ypxj5yE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qf3djc9cOd1K9eiYyO8iG2Av804WbAij3dN2lNc6C8uhkfCs7/4trfIzQc/IIVYfw+3468eYprazDpLX5g+6aXOAVn2kHZwuOe/7M/TNMrVocRXd4i74pSZSR3eWEDzGvo8VEe7kpkhmWEyyGXBwa7SHqvhu4QwqIJ/Q3dXxsos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e+5C8gIS; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e+5C8gIS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729594475; x=1761130475;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BfsXnKhdgJzMKG/7b6rB43K6MAL7dLyNXcY3ypxj5yE=;
  b=e+5C8gISesknWn6ZPUO0cNlYwzmVpyTlW7VqWJ+66NyYCwXrE4z7qk9I
   ja89hDzB7EdVQeNfIIAZGe2Lj83SuJBZo52lfab+CA6oaR319h2NZuQDr
   QCk6qdejGeNhF09vlDAUoDWBHDeLZPD1haCCd9ap3IgvRP9nt+u2zYFdJ
   9ebVFDQQKbswo55Wu8EEWnzt63dcbbCaB6x2Rri2OTyDGv2hsn7Gouqa+
   sEx7UbiDaeLYeRM9FCEoaDsVpupWF3esR9LIfhsz59PsIwIBf95oitIH5
   YaMD10dRf7O8Uh5ukic9cBEBe93+JmPJEtDwR6XwVPClQoJK7x6R6WfYb
   g==;
X-CSE-ConnectionGUID: 37KX8sHvQfSFg/mdX8FYlw==
X-CSE-MsgGUID: HE3gHss+TNSR4z+uopchRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="28576113"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="28576113"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 03:54:34 -0700
X-CSE-ConnectionGUID: NdOLb1o0RbW1+aP4lKu0SA==
X-CSE-MsgGUID: 9TAyYRUXTaGr2WKKDRezrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="79392636"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 22 Oct 2024 03:54:32 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3CX0-000TSU-0B;
	Tue, 22 Oct 2024 10:54:30 +0000
Date: Tue, 22 Oct 2024 18:54:14 +0800
From: kernel test robot <lkp@intel.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>,
	dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 4/5] drm/xe/bo: Create new dma_addr array for dmabuf
 BOs associated with VFs
Message-ID: <202410221832.R04DR21j-lkp@intel.com>
References: <20241021052236.1820329-5-vivek.kasireddy@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021052236.1820329-5-vivek.kasireddy@intel.com>

Hi Vivek,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip linus/master v6.12-rc4 next-20241021]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vivek-Kasireddy/PCI-P2PDMA-Don-t-enforce-ACS-check-for-functions-of-same-device/20241021-134804
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20241021052236.1820329-5-vivek.kasireddy%40intel.com
patch subject: [PATCH v2 4/5] drm/xe/bo: Create new dma_addr array for dmabuf BOs associated with VFs
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241022/202410221832.R04DR21j-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241022/202410221832.R04DR21j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410221832.R04DR21j-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/xe/xe_bo.c:591:15: error: subscript of pointer to incomplete type 'struct drm_pagemap_dma_addr'
     591 |                 bo->dma_addr[i] = drm_pagemap_dma_addr_encode(addr,
         |                 ~~~~~~~~~~~~^
   drivers/gpu/drm/xe/xe_bo_types.h:78:9: note: forward declaration of 'struct drm_pagemap_dma_addr'
      78 |         struct drm_pagemap_dma_addr *dma_addr;
         |                ^
>> drivers/gpu/drm/xe/xe_bo.c:591:21: error: call to undeclared function 'drm_pagemap_dma_addr_encode'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     591 |                 bo->dma_addr[i] = drm_pagemap_dma_addr_encode(addr,
         |                                   ^
>> drivers/gpu/drm/xe/xe_bo.c:592:7: error: use of undeclared identifier 'DRM_INTERCONNECT_DRIVER'
     592 |                                                 DRM_INTERCONNECT_DRIVER,
         |                                                 ^
>> drivers/gpu/drm/xe/xe_bo.c:626:48: error: invalid application of 'sizeof' to an incomplete type 'struct drm_pagemap_dma_addr'
     626 |         bo->dma_addr = kmalloc_array(sg->nents, sizeof(*bo->dma_addr),
         |                                                       ^~~~~~~~~~~~~~~
   include/linux/slab.h:925:63: note: expanded from macro 'kmalloc_array'
     925 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                                                  ^~~~~~~~~~~
   include/linux/alloc_tag.h:210:31: note: expanded from macro 'alloc_hooks'
     210 |         alloc_hooks_tag(&_alloc_tag, _do_alloc);                        \
         |                                      ^~~~~~~~~
   include/linux/alloc_tag.h:202:9: note: expanded from macro 'alloc_hooks_tag'
     202 |         typeof(_do_alloc) _res = _do_alloc;                             \
         |                ^~~~~~~~~
   drivers/gpu/drm/xe/xe_bo_types.h:78:9: note: forward declaration of 'struct drm_pagemap_dma_addr'
      78 |         struct drm_pagemap_dma_addr *dma_addr;
         |                ^
>> drivers/gpu/drm/xe/xe_bo.c:626:48: error: invalid application of 'sizeof' to an incomplete type 'struct drm_pagemap_dma_addr'
     626 |         bo->dma_addr = kmalloc_array(sg->nents, sizeof(*bo->dma_addr),
         |                                                       ^~~~~~~~~~~~~~~
   include/linux/slab.h:925:63: note: expanded from macro 'kmalloc_array'
     925 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                                                  ^~~~~~~~~~~
   include/linux/alloc_tag.h:210:31: note: expanded from macro 'alloc_hooks'
     210 |         alloc_hooks_tag(&_alloc_tag, _do_alloc);                        \
         |                                      ^~~~~~~~~
   include/linux/alloc_tag.h:202:27: note: expanded from macro 'alloc_hooks_tag'
     202 |         typeof(_do_alloc) _res = _do_alloc;                             \
         |                                  ^~~~~~~~~
   drivers/gpu/drm/xe/xe_bo_types.h:78:9: note: forward declaration of 'struct drm_pagemap_dma_addr'
      78 |         struct drm_pagemap_dma_addr *dma_addr;
         |                ^
   5 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]


vim +591 drivers/gpu/drm/xe/xe_bo.c

   570	
   571	
   572	static void xe_bo_translate_iova_to_dpa(struct iommu_domain *domain,
   573						struct xe_bo *bo, struct sg_table *sg,
   574						resource_size_t io_start, int vfid)
   575	{
   576		struct xe_device *xe = xe_bo_device(bo);
   577		struct xe_gt *gt = xe_root_mmio_gt(xe);
   578		struct scatterlist *sgl;
   579		struct xe_bo *lmem_bo;
   580		phys_addr_t phys;
   581		dma_addr_t addr;
   582		u64 offset, i;
   583	
   584		lmem_bo = xe_gt_sriov_pf_config_get_lmem_obj(gt, ++vfid);
   585	
   586		for_each_sgtable_dma_sg(sg, sgl, i) {
   587			phys = iommu_iova_to_phys(domain, sg_dma_address(sgl));
   588			offset = phys - io_start;
   589			addr = xe_bo_addr(lmem_bo, offset, sg_dma_len(sgl));
   590	
 > 591			bo->dma_addr[i] = drm_pagemap_dma_addr_encode(addr,
 > 592							DRM_INTERCONNECT_DRIVER,
   593							get_order(sg_dma_len(sgl)),
   594							DMA_BIDIRECTIONAL);
   595		}
   596	}
   597	
   598	static int xe_bo_sg_to_dma_addr_array(struct sg_table *sg, struct xe_bo *bo)
   599	{
   600		struct xe_device *xe = xe_bo_device(bo);
   601		struct iommu_domain *domain;
   602		resource_size_t io_start;
   603		struct pci_dev *pdev;
   604		phys_addr_t phys;
   605		int vfid;
   606	
   607		if (!IS_SRIOV_PF(xe))
   608			return 0;
   609	
   610		domain = iommu_get_domain_for_dev(xe->drm.dev);
   611		if (!domain)
   612			return 0;
   613	
   614		phys = iommu_iova_to_phys(domain, sg_dma_address(sg->sgl));
   615		if (page_is_ram(PFN_DOWN(phys)))
   616			return 0;
   617	
   618		pdev = xe_find_vf_dev(xe, phys);
   619		if (!pdev)
   620			return 0;
   621	
   622		vfid = pci_iov_vf_id(pdev);
   623		if (vfid < 0)
   624			return 0;
   625	
 > 626		bo->dma_addr = kmalloc_array(sg->nents, sizeof(*bo->dma_addr),
   627					     GFP_KERNEL);
   628		if (!bo->dma_addr)
   629			return -ENOMEM;
   630	
   631		bo->is_devmem_external = true;
   632		io_start = pci_resource_start(pdev, LMEM_BAR);
   633		xe_bo_translate_iova_to_dpa(domain, bo, sg, io_start, vfid);
   634	
   635		return 0;
   636	}
   637	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
