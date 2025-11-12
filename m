Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8919B29E11B;
	Wed, 12 Nov 2025 07:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762931844; cv=none; b=bH95Hsl15c/wbVMMd8U11Wq0MbO/oE5Hx/u7+7OI0A+14kE3qIgsWplCNx2oEr0/tXOx8sYigqj1ks5eD6OkYQTeSdQYeYqPxMNRuf42bK+w0+zDBly6pQ2u6HERgAXfFOAsZ24/+Sw82IL5OOxkCrG89tlYaoSHQbF8lLa7FSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762931844; c=relaxed/simple;
	bh=ThADv/o+f/LwA4iEibSefJTh6TXoB80TBI31bpQetc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MU0txZgzhj/4bQl7ibFXPRe2/oqWYo65icdzQbDuo5VnrakbZcr0lwLPK6jkt4CGcnKSYWY0RWfj2qjwFWKv3vRK5YKCIWvxo9p7gYBSVPrgrZdXjgw3LRAOr/k8m0dG//xMdOx57xhqZ4ddnyecfFBDrfT3XTI0FqjDDyp3pMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gplNYYOU; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gplNYYOU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762931842; x=1794467842;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ThADv/o+f/LwA4iEibSefJTh6TXoB80TBI31bpQetc8=;
  b=gplNYYOUW9sSeDHLz5LCiJe6pcu/VDreRPgakzFXwSf+k7NL9wJRnoTq
   wLq/3jrEaAsKObSlZbgaOrlrX9w1Oo2wssBxrN+4wROapcts7HZAPCGtu
   kIvGR3NMRqkr0tuV41f7RYmeFEB6qJG+b730ecaBqeK8W2jkK19A/GsJS
   53dfsI9ekn6yEbKj7hkhYF3WwT/wR6vOf5UgUnRg44NCtJRRGZ/Ct75OR
   Vs536jiy7si2FwBwMlwSjcrr/j+6vt7OhK3TlJHA8yEekF5wwR4IPON1i
   WwZWOmyrGa8hK54dObMac0zcvFzq5Ab1km6S7DihAeU8dV8FFYF4Rl2sR
   w==;
X-CSE-ConnectionGUID: szV+/sRvSamfz7qCZpgnOA==
X-CSE-MsgGUID: cOCo1IvUTcukTnFFtDYVIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="82620916"
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; 
   d="scan'208";a="82620916"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 23:17:21 -0800
X-CSE-ConnectionGUID: buGFCMIwQ1GZ7X6p2uCHpg==
X-CSE-MsgGUID: PEfeXc79TBOziaZaH3pZxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; 
   d="scan'208";a="189116038"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Nov 2025 23:17:18 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJ56R-0003x1-2U;
	Wed, 12 Nov 2025 07:17:15 +0000
Date: Wed, 12 Nov 2025 15:16:28 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	intel-xe@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
	apopple@nvidia.com, airlied@gmail.com,
	Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
	Matthew Brost <matthew.brost@intel.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH v2 11/17] drm/xe: Use the vma attibute drm_pagemap to
 select where to migrate
Message-ID: <202511121414.yVnBaDhb-lkp@intel.com>
References: <20251111164408.113070-12-thomas.hellstrom@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111164408.113070-12-thomas.hellstrom@linux.intel.com>

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on next-20251112]
[cannot apply to linus/master v6.18-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/drm-xe-svm-Fix-a-debug-printout/20251112-004643
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20251111164408.113070-12-thomas.hellstrom%40linux.intel.com
patch subject: [PATCH v2 11/17] drm/xe: Use the vma attibute drm_pagemap to select where to migrate
config: arm-randconfig-002-20251112 (https://download.01.org/0day-ci/archive/20251112/202511121414.yVnBaDhb-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 996639d6ebb86ff15a8c99b67f1c2e2117636ae7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251112/202511121414.yVnBaDhb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511121414.yVnBaDhb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/xe/xe_vm.c:2914:58: error: incompatible pointer to integer conversion passing 'struct drm_pagemap *' to parameter of type 'u32' (aka 'unsigned int') [-Wint-conversion]
    2914 |                 if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, dpagemap)) {
         |                                                                        ^~~~~~~~
   drivers/gpu/drm/xe/xe_svm.h:321:10: note: passing argument to parameter 'region' here
     321 |                                         u32 region)
         |                                             ^
   1 error generated.


vim +2914 drivers/gpu/drm/xe/xe_vm.c

  2889	
  2890	static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
  2891	{
  2892		bool devmem_possible = IS_DGFX(vm->xe) && IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
  2893		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
  2894		struct drm_pagemap *dpagemap = op->prefetch_range.dpagemap;
  2895		int err = 0;
  2896	
  2897		struct xe_svm_range *svm_range;
  2898		struct drm_gpusvm_ctx ctx = {};
  2899		unsigned long i;
  2900	
  2901		if (!xe_vma_is_cpu_addr_mirror(vma))
  2902			return 0;
  2903	
  2904		ctx.read_only = xe_vma_read_only(vma);
  2905		ctx.devmem_possible = devmem_possible;
  2906		ctx.check_pages_threshold = devmem_possible ? SZ_64K : 0;
  2907		ctx.device_private_page_owner = xe_svm_private_page_owner(vm, !dpagemap);
  2908	
  2909		/* TODO: Threading the migration */
  2910		xa_for_each(&op->prefetch_range.range, i, svm_range) {
  2911			if (!dpagemap)
  2912				xe_svm_range_migrate_to_smem(vm, svm_range);
  2913	
> 2914			if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, dpagemap)) {
  2915				err = xe_svm_alloc_vram(svm_range, &ctx, dpagemap);
  2916				if (err) {
  2917					drm_dbg(&vm->xe->drm, "VRAM allocation failed, retry from userspace, asid=%u, gpusvm=%p, errno=%pe\n",
  2918						vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
  2919					return -ENODATA;
  2920				}
  2921				xe_svm_range_debug(svm_range, "PREFETCH - RANGE MIGRATED TO VRAM");
  2922			}
  2923	
  2924			err = xe_svm_range_get_pages(vm, svm_range, &ctx);
  2925			if (err) {
  2926				drm_dbg(&vm->xe->drm, "Get pages failed, asid=%u, gpusvm=%p, errno=%pe\n",
  2927					vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
  2928				if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM)
  2929					err = -ENODATA;
  2930				return err;
  2931			}
  2932			xe_svm_range_debug(svm_range, "PREFETCH - RANGE GET PAGES DONE");
  2933		}
  2934	
  2935		return err;
  2936	}
  2937	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
