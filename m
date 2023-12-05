Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807C6405D3;
	Tue,  5 Dec 2023 23:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cRBM0zet"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701819306; x=1733355306;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q1Ro+uJdPYPP7GHlP970a2IwYcDn5FDdLVSOC+XE8vo=;
  b=cRBM0zet/XSkDrqt4ffhGHGw8DhDeK2tp6B4fSy+vBMYTPbfR7m1OjwA
   DBCqZ5QqUfZGDVT0R9MUYOb3GEWlOP4ngAtFk7p4/Ik+0fLx158o6oyD5
   amoMx+P6TWa8RpSdq3mFoVMCpJLLrUp878qoaN17GhrAFkOfDRygxShx5
   lYoRsMRmqYMjp2tRf/A0TVU9rIbMjabP/13uWIIlhwM+iOUq59ZbNDFPw
   +EowAZSoLa7snuNtKxwqDH2lRvSGAhfZN26OwEm5pdHGaxWeL6vuIBnTa
   HAKAYs5EGX9XhgAN9sXCPbjO0bjq+A00ExYLDHLjGfHtHenEX1KQlwmMS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="374157360"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="374157360"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 15:35:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="914974629"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="914974629"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 05 Dec 2023 15:35:01 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAewM-0009sQ-32;
	Tue, 05 Dec 2023 23:34:58 +0000
Date: Wed, 6 Dec 2023 07:34:47 +0800
From: kernel test robot <lkp@intel.com>
To: Boris Brezillon <bbrezillon@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 12/14] drm/panthor: Allow driver compilation
Message-ID: <202312060755.OMcP3qSq-lkp@intel.com>
References: <20231204173313.2098733-13-boris.brezillon@collabora.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204173313.2098733-13-boris.brezillon@collabora.com>

Hi Boris,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.7-rc4 next-20231205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Boris-Brezillon/drm-panthor-Add-GPU-register-definitions/20231205-023301
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231204173313.2098733-13-boris.brezillon%40collabora.com
patch subject: [PATCH v3 12/14] drm/panthor: Allow driver compilation
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20231206/202312060755.OMcP3qSq-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312060755.OMcP3qSq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312060755.OMcP3qSq-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/gpu/drm/panthor/panthor_mmu.c:1019:8: error: assigning to 'bool' (aka '_Bool') from incompatible type 'void'
    1019 |         unpin = drm_gpuvm_bo_put(vm_bo);
         |               ^ ~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/panthor/panthor_mmu.c:2167:4: error: field designator 'alloc' does not refer to any field in type 'struct io_pgtable_cfg'
    2167 |                 .alloc          = alloc_pt,
         |                 ~^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/panthor/panthor_mmu.c:2168:4: error: field designator 'free' does not refer to any field in type 'struct io_pgtable_cfg'
    2168 |                 .free           = free_pt,
         |                 ~^~~~~~~~~~~~~~~~~~~~~~~~
   3 errors generated.
--
>> drivers/gpu/drm/panthor/panthor_sched.c:1966:6: warning: variable 'csg_mod_mask' set but not used [-Wunused-but-set-variable]
    1966 |         u32 csg_mod_mask = 0, free_csg_slots = 0;
         |             ^
   1 warning generated.


vim +2167 drivers/gpu/drm/panthor/panthor_mmu.c

bed8deda31e29cf Boris Brezillon 2023-12-04  2099  
bed8deda31e29cf Boris Brezillon 2023-12-04  2100  /**
bed8deda31e29cf Boris Brezillon 2023-12-04  2101   * panthor_vm_create() - Create a VM
bed8deda31e29cf Boris Brezillon 2023-12-04  2102   * @ptdev: Device.
bed8deda31e29cf Boris Brezillon 2023-12-04  2103   * @for_mcu: True if this is the FW MCU VM.
bed8deda31e29cf Boris Brezillon 2023-12-04  2104   * @kernel_va_start: Start of the range reserved for kernel BO mapping.
bed8deda31e29cf Boris Brezillon 2023-12-04  2105   * @kernel_va_size: Size of the range reserved for kernel BO mapping.
bed8deda31e29cf Boris Brezillon 2023-12-04  2106   * @auto_kernel_va_start: Start of the auto-VA kernel range.
bed8deda31e29cf Boris Brezillon 2023-12-04  2107   * @auto_kernel_va_size: Size of the auto-VA kernel range.
bed8deda31e29cf Boris Brezillon 2023-12-04  2108   *
bed8deda31e29cf Boris Brezillon 2023-12-04  2109   * Return: A valid pointer on success, an ERR_PTR() otherwise.
bed8deda31e29cf Boris Brezillon 2023-12-04  2110   */
bed8deda31e29cf Boris Brezillon 2023-12-04  2111  struct panthor_vm *
bed8deda31e29cf Boris Brezillon 2023-12-04  2112  panthor_vm_create(struct panthor_device *ptdev, bool for_mcu,
bed8deda31e29cf Boris Brezillon 2023-12-04  2113  		  u64 kernel_va_start, u64 kernel_va_size,
bed8deda31e29cf Boris Brezillon 2023-12-04  2114  		  u64 auto_kernel_va_start, u64 auto_kernel_va_size)
bed8deda31e29cf Boris Brezillon 2023-12-04  2115  {
bed8deda31e29cf Boris Brezillon 2023-12-04  2116  	u32 va_bits = GPU_MMU_FEATURES_VA_BITS(ptdev->gpu_info.mmu_features);
bed8deda31e29cf Boris Brezillon 2023-12-04  2117  	u32 pa_bits = GPU_MMU_FEATURES_PA_BITS(ptdev->gpu_info.mmu_features);
bed8deda31e29cf Boris Brezillon 2023-12-04  2118  	u64 full_va_range = 1ull << min_t(u32, va_bits, sizeof(unsigned long) * 8);
bed8deda31e29cf Boris Brezillon 2023-12-04  2119  	struct drm_gem_object *dummy_gem;
bed8deda31e29cf Boris Brezillon 2023-12-04  2120  	struct drm_gpu_scheduler *sched;
bed8deda31e29cf Boris Brezillon 2023-12-04  2121  	struct io_pgtable_cfg pgtbl_cfg;
bed8deda31e29cf Boris Brezillon 2023-12-04  2122  	u64 mair, min_va, va_range;
bed8deda31e29cf Boris Brezillon 2023-12-04  2123  	struct panthor_vm *vm;
bed8deda31e29cf Boris Brezillon 2023-12-04  2124  	int ret;
bed8deda31e29cf Boris Brezillon 2023-12-04  2125  
bed8deda31e29cf Boris Brezillon 2023-12-04  2126  	vm = kzalloc(sizeof(*vm), GFP_KERNEL);
bed8deda31e29cf Boris Brezillon 2023-12-04  2127  	if (!vm)
bed8deda31e29cf Boris Brezillon 2023-12-04  2128  		return ERR_PTR(-ENOMEM);
bed8deda31e29cf Boris Brezillon 2023-12-04  2129  
bed8deda31e29cf Boris Brezillon 2023-12-04  2130  	/* We allocate a dummy GEM for the VM. */
bed8deda31e29cf Boris Brezillon 2023-12-04  2131  	dummy_gem = drm_gpuvm_resv_object_alloc(&ptdev->base);
bed8deda31e29cf Boris Brezillon 2023-12-04  2132  	if (!dummy_gem) {
bed8deda31e29cf Boris Brezillon 2023-12-04  2133  		ret = -ENOMEM;
bed8deda31e29cf Boris Brezillon 2023-12-04  2134  		goto err_free_vm;
bed8deda31e29cf Boris Brezillon 2023-12-04  2135  	}
bed8deda31e29cf Boris Brezillon 2023-12-04  2136  
bed8deda31e29cf Boris Brezillon 2023-12-04  2137  	mutex_init(&vm->heaps.lock);
bed8deda31e29cf Boris Brezillon 2023-12-04  2138  	vm->for_mcu = for_mcu;
bed8deda31e29cf Boris Brezillon 2023-12-04  2139  	vm->ptdev = ptdev;
bed8deda31e29cf Boris Brezillon 2023-12-04  2140  	mutex_init(&vm->op_lock);
bed8deda31e29cf Boris Brezillon 2023-12-04  2141  
bed8deda31e29cf Boris Brezillon 2023-12-04  2142  	if (for_mcu) {
bed8deda31e29cf Boris Brezillon 2023-12-04  2143  		/* CSF MCU is a cortex M7, and can only address 4G */
bed8deda31e29cf Boris Brezillon 2023-12-04  2144  		min_va = 0;
bed8deda31e29cf Boris Brezillon 2023-12-04  2145  		va_range = SZ_4G;
bed8deda31e29cf Boris Brezillon 2023-12-04  2146  	} else {
bed8deda31e29cf Boris Brezillon 2023-12-04  2147  		min_va = 0;
bed8deda31e29cf Boris Brezillon 2023-12-04  2148  		va_range = full_va_range;
bed8deda31e29cf Boris Brezillon 2023-12-04  2149  	}
bed8deda31e29cf Boris Brezillon 2023-12-04  2150  
bed8deda31e29cf Boris Brezillon 2023-12-04  2151  	mutex_init(&vm->mm_lock);
bed8deda31e29cf Boris Brezillon 2023-12-04  2152  	drm_mm_init(&vm->mm, kernel_va_start, kernel_va_size);
bed8deda31e29cf Boris Brezillon 2023-12-04  2153  	vm->kernel_auto_va.start = auto_kernel_va_start;
bed8deda31e29cf Boris Brezillon 2023-12-04  2154  	vm->kernel_auto_va.end = vm->kernel_auto_va.start + auto_kernel_va_size - 1;
bed8deda31e29cf Boris Brezillon 2023-12-04  2155  
bed8deda31e29cf Boris Brezillon 2023-12-04  2156  	INIT_LIST_HEAD(&vm->node);
bed8deda31e29cf Boris Brezillon 2023-12-04  2157  	INIT_LIST_HEAD(&vm->as.lru_node);
bed8deda31e29cf Boris Brezillon 2023-12-04  2158  	vm->as.id = -1;
bed8deda31e29cf Boris Brezillon 2023-12-04  2159  
bed8deda31e29cf Boris Brezillon 2023-12-04  2160  	pgtbl_cfg = (struct io_pgtable_cfg) {
bed8deda31e29cf Boris Brezillon 2023-12-04  2161  		.pgsize_bitmap	= SZ_4K | SZ_2M,
bed8deda31e29cf Boris Brezillon 2023-12-04  2162  		.ias		= va_bits,
bed8deda31e29cf Boris Brezillon 2023-12-04  2163  		.oas		= pa_bits,
bed8deda31e29cf Boris Brezillon 2023-12-04  2164  		.coherent_walk	= ptdev->coherent,
bed8deda31e29cf Boris Brezillon 2023-12-04  2165  		.tlb		= &mmu_tlb_ops,
bed8deda31e29cf Boris Brezillon 2023-12-04  2166  		.iommu_dev	= ptdev->base.dev,
bed8deda31e29cf Boris Brezillon 2023-12-04 @2167  		.alloc		= alloc_pt,
bed8deda31e29cf Boris Brezillon 2023-12-04 @2168  		.free		= free_pt,
bed8deda31e29cf Boris Brezillon 2023-12-04  2169  	};
bed8deda31e29cf Boris Brezillon 2023-12-04  2170  
bed8deda31e29cf Boris Brezillon 2023-12-04  2171  	vm->pgtbl_ops = alloc_io_pgtable_ops(ARM_64_LPAE_S1, &pgtbl_cfg, vm);
bed8deda31e29cf Boris Brezillon 2023-12-04  2172  	if (!vm->pgtbl_ops) {
bed8deda31e29cf Boris Brezillon 2023-12-04  2173  		ret = -EINVAL;
bed8deda31e29cf Boris Brezillon 2023-12-04  2174  		goto err_mm_takedown;
bed8deda31e29cf Boris Brezillon 2023-12-04  2175  	}
bed8deda31e29cf Boris Brezillon 2023-12-04  2176  
bed8deda31e29cf Boris Brezillon 2023-12-04  2177  	/* Bind operations are synchronous for now, no timeout needed. */
bed8deda31e29cf Boris Brezillon 2023-12-04  2178  	ret = drm_sched_init(&vm->sched, &panthor_vm_bind_ops, ptdev->mmu->vm.wq,
bed8deda31e29cf Boris Brezillon 2023-12-04  2179  			     1, 1, 0,
bed8deda31e29cf Boris Brezillon 2023-12-04  2180  			     MAX_SCHEDULE_TIMEOUT, NULL, NULL,
bed8deda31e29cf Boris Brezillon 2023-12-04  2181  			     "panthor-vm-bind", ptdev->base.dev);
bed8deda31e29cf Boris Brezillon 2023-12-04  2182  	if (ret)
bed8deda31e29cf Boris Brezillon 2023-12-04  2183  		goto err_free_io_pgtable;
bed8deda31e29cf Boris Brezillon 2023-12-04  2184  
bed8deda31e29cf Boris Brezillon 2023-12-04  2185  	sched = &vm->sched;
bed8deda31e29cf Boris Brezillon 2023-12-04  2186  	ret = drm_sched_entity_init(&vm->entity, 0, &sched, 1, NULL);
bed8deda31e29cf Boris Brezillon 2023-12-04  2187  	if (ret)
bed8deda31e29cf Boris Brezillon 2023-12-04  2188  		goto err_sched_fini;
bed8deda31e29cf Boris Brezillon 2023-12-04  2189  
bed8deda31e29cf Boris Brezillon 2023-12-04  2190  	mair = io_pgtable_ops_to_pgtable(vm->pgtbl_ops)->cfg.arm_lpae_s1_cfg.mair;
bed8deda31e29cf Boris Brezillon 2023-12-04  2191  	vm->memattr = mair_to_memattr(mair);
bed8deda31e29cf Boris Brezillon 2023-12-04  2192  
bed8deda31e29cf Boris Brezillon 2023-12-04  2193  	mutex_lock(&ptdev->mmu->vm.lock);
bed8deda31e29cf Boris Brezillon 2023-12-04  2194  	list_add_tail(&vm->node, &ptdev->mmu->vm.list);
bed8deda31e29cf Boris Brezillon 2023-12-04  2195  
bed8deda31e29cf Boris Brezillon 2023-12-04  2196  	/* If a reset is in progress, stop the scheduler. */
bed8deda31e29cf Boris Brezillon 2023-12-04  2197  	if (ptdev->mmu->vm.reset_in_progress)
bed8deda31e29cf Boris Brezillon 2023-12-04  2198  		panthor_vm_stop(vm);
bed8deda31e29cf Boris Brezillon 2023-12-04  2199  	mutex_unlock(&ptdev->mmu->vm.lock);
bed8deda31e29cf Boris Brezillon 2023-12-04  2200  
bed8deda31e29cf Boris Brezillon 2023-12-04  2201  	/* We intentionally leave the reserved range to zero, because we want kernel VMAs
bed8deda31e29cf Boris Brezillon 2023-12-04  2202  	 * to be handled the same way user VMAs are.
bed8deda31e29cf Boris Brezillon 2023-12-04  2203  	 */
bed8deda31e29cf Boris Brezillon 2023-12-04  2204  	drm_gpuvm_init(&vm->base,
bed8deda31e29cf Boris Brezillon 2023-12-04  2205  		       for_mcu ? "panthor-MCU-VM" : "panthor-GPU-VM",
bed8deda31e29cf Boris Brezillon 2023-12-04  2206  		       0, &ptdev->base, dummy_gem, min_va, va_range, 0, 0,
bed8deda31e29cf Boris Brezillon 2023-12-04  2207  		       &panthor_gpuvm_ops);
bed8deda31e29cf Boris Brezillon 2023-12-04  2208  	drm_gem_object_put(dummy_gem);
bed8deda31e29cf Boris Brezillon 2023-12-04  2209  	return vm;
bed8deda31e29cf Boris Brezillon 2023-12-04  2210  
bed8deda31e29cf Boris Brezillon 2023-12-04  2211  err_sched_fini:
bed8deda31e29cf Boris Brezillon 2023-12-04  2212  	drm_sched_fini(&vm->sched);
bed8deda31e29cf Boris Brezillon 2023-12-04  2213  
bed8deda31e29cf Boris Brezillon 2023-12-04  2214  err_free_io_pgtable:
bed8deda31e29cf Boris Brezillon 2023-12-04  2215  	free_io_pgtable_ops(vm->pgtbl_ops);
bed8deda31e29cf Boris Brezillon 2023-12-04  2216  
bed8deda31e29cf Boris Brezillon 2023-12-04  2217  err_mm_takedown:
bed8deda31e29cf Boris Brezillon 2023-12-04  2218  	drm_mm_takedown(&vm->mm);
bed8deda31e29cf Boris Brezillon 2023-12-04  2219  	drm_gem_object_put(dummy_gem);
bed8deda31e29cf Boris Brezillon 2023-12-04  2220  
bed8deda31e29cf Boris Brezillon 2023-12-04  2221  err_free_vm:
bed8deda31e29cf Boris Brezillon 2023-12-04  2222  	kfree(vm);
bed8deda31e29cf Boris Brezillon 2023-12-04  2223  	return ERR_PTR(ret);
bed8deda31e29cf Boris Brezillon 2023-12-04  2224  }
bed8deda31e29cf Boris Brezillon 2023-12-04  2225  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
