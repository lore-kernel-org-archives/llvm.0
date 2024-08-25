Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB28B647;
	Sun, 25 Aug 2024 06:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724569110; cv=none; b=J4C0pBabpBIs82VzYgIguTdEroBU8XWyDTS5PPPnWRgukV5YYK+99RaY7PP9i6/cO1o/i6ntVO5e9oM9J8pwXqbAj0ycECBUp+bYRD7iJUuvJMsVGmDiflsgwS2e7OviRQv5z/BDwoH/PmWwOO3FxiGi6w0AIVY255ExOeLgV8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724569110; c=relaxed/simple;
	bh=hWZIUc+n+wwXBKW2P7TusX12Frv2fm2aeXdsw5wwlhA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KstaomIPhBv+GxybuflHoFyn0OcYhpzuNe1rPTxG5+4KMc0tS/zbQVPM00XlxudaoWCbJUR5owptFEzrvd3FzppfNGRvZq/M015cSTZ0EW3LgZzqpv+wP65nvWyEGr9jIRRYxCWqRCgemGxzV73oaIcg6PVo20OP31KQZ267Zjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W/GXuI7/; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W/GXuI7/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724569109; x=1756105109;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=hWZIUc+n+wwXBKW2P7TusX12Frv2fm2aeXdsw5wwlhA=;
  b=W/GXuI7/3wCkvMcfjygN2mXDgmgDU1cWJjJZAFURENpHyj4PyniPUUcb
   NUwhC26Zq1k6apnMn/PcR3IxOv9cVnWN2XBZtik9lRnIxvFJlwQ2a+cXL
   Yz7RF0tnn9t8kZn+3tbsNHJr3ZTml+CS0mvg2dutoQvk7459YHC7Cu0NY
   GP4aFT9k6SGbzqedEG8Cx3BICY9VyG699gmZdEvxO11M7xYBbK0Dcnze9
   fsIS55b+L7wcdXnpuI5aGp0fNk/wsDyK8cBxsTU3iEso/+zQGyeoDpXZH
   ztVJeZGqAli3KsQ6Q04o74LLRkURq74SAu/oXyWsQi63qyCJQc6GFqmI7
   w==;
X-CSE-ConnectionGUID: 4o6LRm65SG+cfwd49bN9Vg==
X-CSE-MsgGUID: uAXygsH6TtiJ3wC0+x6YBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11173"; a="26767487"
X-IronPort-AV: E=Sophos;i="6.10,174,1719903600"; 
   d="scan'208";a="26767487"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2024 23:58:28 -0700
X-CSE-ConnectionGUID: dhNZKUhNTx2dWsuNOEIysw==
X-CSE-MsgGUID: jM7WxWoTQBayTbBb10h1Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,174,1719903600"; 
   d="scan'208";a="62906946"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 24 Aug 2024 23:58:26 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1si7Ch-000F0p-1H;
	Sun, 25 Aug 2024 06:58:23 +0000
Date: Sun, 25 Aug 2024 14:57:45 +0800
From: kernel test robot <lkp@intel.com>
To: Xiaogang Chen <xiaogang.chen@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Infrastructure <z1.linuxinfra@amd.com>,
	"Xiaogang.Chen" <Xiaogang.Chen@amd.com>,
	Philip Yang <Philip.Yang@amd.com>
Subject: [agd5f:amd-staging-drm-next 1/2]
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2781: warning: Function parameter or
 struct member 'ts' not described in 'amdgpu_vm_handle_fault'
Message-ID: <202408251419.vgZHg3GV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-next
head:   fed45ffd5106832217713ee29acd0fdd2ea76ecd
commit: 490fc21fe97c1739e4e551a41fa36ca5669cefbb [1/2] drm/amdkfd: Change kfd/svm page fault drain handling
config: i386-buildonly-randconfig-002-20240825 (https://download.01.org/0day-ci/archive/20240825/202408251419.vgZHg3GV-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240825/202408251419.vgZHg3GV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408251419.vgZHg3GV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2781: warning: Function parameter or struct member 'ts' not described in 'amdgpu_vm_handle_fault'


vim +2781 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c

2aa37bf58838fd Andrey Grodzovsky    2018-06-28  2764  
ec671737f8edfb Christian König      2018-12-07  2765  /**
ec671737f8edfb Christian König      2018-12-07  2766   * amdgpu_vm_handle_fault - graceful handling of VM faults.
ec671737f8edfb Christian König      2018-12-07  2767   * @adev: amdgpu device pointer
ec671737f8edfb Christian König      2018-12-07  2768   * @pasid: PASID of the VM
f5fe7edfd6ce62 Mukul Joshi          2022-09-30  2769   * @vmid: VMID, only used for GFX 9.4.3.
f5fe7edfd6ce62 Mukul Joshi          2022-09-30  2770   * @node_id: Node_id received in IH cookie. Only applicable for
f5fe7edfd6ce62 Mukul Joshi          2022-09-30  2771   *           GFX 9.4.3.
ec671737f8edfb Christian König      2018-12-07  2772   * @addr: Address of the fault
ff891a2e6431f7 Philip Yang          2021-08-15  2773   * @write_fault: true is write fault, false is read fault
ec671737f8edfb Christian König      2018-12-07  2774   *
ec671737f8edfb Christian König      2018-12-07  2775   * Try to gracefully handle a VM fault. Return true if the fault was handled and
ec671737f8edfb Christian König      2018-12-07  2776   * shouldn't be reported any more.
ec671737f8edfb Christian König      2018-12-07  2777   */
c7b6bac9c72c5f Fenghua Yu           2020-09-15  2778  bool amdgpu_vm_handle_fault(struct amdgpu_device *adev, u32 pasid,
490fc21fe97c17 Xiaogang Chen        2024-08-23  2779  			    u32 vmid, u32 node_id, uint64_t addr, uint64_t ts,
5fb34bd9cf9e24 Alex Sierra          2022-05-24  2780  			    bool write_fault)
ec671737f8edfb Christian König      2018-12-07 @2781  {
ea53af8a59c89b Alex Sierra          2020-05-11  2782  	bool is_compute_context = false;
ec671737f8edfb Christian König      2018-12-07  2783  	struct amdgpu_bo *root;
d760895d55cd7a Felix Kuehling       2021-06-14  2784  	unsigned long irqflags;
ec671737f8edfb Christian König      2018-12-07  2785  	uint64_t value, flags;
ec671737f8edfb Christian König      2018-12-07  2786  	struct amdgpu_vm *vm;
2b665c3735b318 Philip Yang          2021-04-01  2787  	int r;
ec671737f8edfb Christian König      2018-12-07  2788  
dcb388eddb5f1b Nirmoy Das           2021-06-28  2789  	xa_lock_irqsave(&adev->vm_manager.pasids, irqflags);
dcb388eddb5f1b Nirmoy Das           2021-06-28  2790  	vm = xa_load(&adev->vm_manager.pasids, pasid);
ea53af8a59c89b Alex Sierra          2020-05-11  2791  	if (vm) {
391629bdfcb901 Nirmoy Das           2021-06-15  2792  		root = amdgpu_bo_ref(vm->root.bo);
ea53af8a59c89b Alex Sierra          2020-05-11  2793  		is_compute_context = vm->is_compute_context;
ea53af8a59c89b Alex Sierra          2020-05-11  2794  	} else {
ec671737f8edfb Christian König      2018-12-07  2795  		root = NULL;
ea53af8a59c89b Alex Sierra          2020-05-11  2796  	}
dcb388eddb5f1b Nirmoy Das           2021-06-28  2797  	xa_unlock_irqrestore(&adev->vm_manager.pasids, irqflags);
ec671737f8edfb Christian König      2018-12-07  2798  
ec671737f8edfb Christian König      2018-12-07  2799  	if (!root)
ec671737f8edfb Christian König      2018-12-07  2800  		return false;
ec671737f8edfb Christian König      2018-12-07  2801  
ea53af8a59c89b Alex Sierra          2020-05-11  2802  	addr /= AMDGPU_GPU_PAGE_SIZE;
ea53af8a59c89b Alex Sierra          2020-05-11  2803  
f5fe7edfd6ce62 Mukul Joshi          2022-09-30  2804  	if (is_compute_context && !svm_range_restore_pages(adev, pasid, vmid,
490fc21fe97c17 Xiaogang Chen        2024-08-23  2805  	    node_id, addr, ts, write_fault)) {
ea53af8a59c89b Alex Sierra          2020-05-11  2806  		amdgpu_bo_unref(&root);
ea53af8a59c89b Alex Sierra          2020-05-11  2807  		return true;
ea53af8a59c89b Alex Sierra          2020-05-11  2808  	}
ea53af8a59c89b Alex Sierra          2020-05-11  2809  
ec671737f8edfb Christian König      2018-12-07  2810  	r = amdgpu_bo_reserve(root, true);
ec671737f8edfb Christian König      2018-12-07  2811  	if (r)
ec671737f8edfb Christian König      2018-12-07  2812  		goto error_unref;
ec671737f8edfb Christian König      2018-12-07  2813  
ec671737f8edfb Christian König      2018-12-07  2814  	/* Double check that the VM still exists */
dcb388eddb5f1b Nirmoy Das           2021-06-28  2815  	xa_lock_irqsave(&adev->vm_manager.pasids, irqflags);
dcb388eddb5f1b Nirmoy Das           2021-06-28  2816  	vm = xa_load(&adev->vm_manager.pasids, pasid);
391629bdfcb901 Nirmoy Das           2021-06-15  2817  	if (vm && vm->root.bo != root)
ec671737f8edfb Christian König      2018-12-07  2818  		vm = NULL;
dcb388eddb5f1b Nirmoy Das           2021-06-28  2819  	xa_unlock_irqrestore(&adev->vm_manager.pasids, irqflags);
ec671737f8edfb Christian König      2018-12-07  2820  	if (!vm)
ec671737f8edfb Christian König      2018-12-07  2821  		goto error_unlock;
ec671737f8edfb Christian König      2018-12-07  2822  
ec671737f8edfb Christian König      2018-12-07  2823  	flags = AMDGPU_PTE_VALID | AMDGPU_PTE_SNOOPED |
ec671737f8edfb Christian König      2018-12-07  2824  		AMDGPU_PTE_SYSTEM;
ec671737f8edfb Christian König      2018-12-07  2825  
ea53af8a59c89b Alex Sierra          2020-05-11  2826  	if (is_compute_context) {
b4672c8a84beba Alex Sierra          2019-11-18  2827  		/* Intentionally setting invalid PTE flag
b4672c8a84beba Alex Sierra          2019-11-18  2828  		 * combination to force a no-retry-fault
b4672c8a84beba Alex Sierra          2019-11-18  2829  		 */
e77673d14f2cec Mukul Joshi          2023-06-09  2830  		flags = AMDGPU_VM_NORETRY_FLAGS;
b4672c8a84beba Alex Sierra          2019-11-18  2831  		value = 0;
b4672c8a84beba Alex Sierra          2019-11-18  2832  	} else if (amdgpu_vm_fault_stop == AMDGPU_VM_FAULT_STOP_NEVER) {
ec671737f8edfb Christian König      2018-12-07  2833  		/* Redirect the access to the dummy page */
ec671737f8edfb Christian König      2018-12-07  2834  		value = adev->dummy_page_addr;
ec671737f8edfb Christian König      2018-12-07  2835  		flags |= AMDGPU_PTE_EXECUTABLE | AMDGPU_PTE_READABLE |
ec671737f8edfb Christian König      2018-12-07  2836  			AMDGPU_PTE_WRITEABLE;
b4672c8a84beba Alex Sierra          2019-11-18  2837  
ec671737f8edfb Christian König      2018-12-07  2838  	} else {
ec671737f8edfb Christian König      2018-12-07  2839  		/* Let the hw retry silently on the PTE */
ec671737f8edfb Christian König      2018-12-07  2840  		value = 0;
ec671737f8edfb Christian König      2018-12-07  2841  	}
ec671737f8edfb Christian König      2018-12-07  2842  
c8d4c18bfbc4ab Christian König      2021-11-16  2843  	r = dma_resv_reserve_fences(root->tbo.base.resv, 1);
2b665c3735b318 Philip Yang          2021-04-01  2844  	if (r) {
2b665c3735b318 Philip Yang          2021-04-01  2845  		pr_debug("failed %d to reserve fence slot\n", r);
2b665c3735b318 Philip Yang          2021-04-01  2846  		goto error_unlock;
2b665c3735b318 Philip Yang          2021-04-01  2847  	}
2b665c3735b318 Philip Yang          2021-04-01  2848  
142262a1c02ad4 David Francis        2023-10-12  2849  	r = amdgpu_vm_update_range(adev, vm, true, false, false, false,
142262a1c02ad4 David Francis        2023-10-12  2850  				   NULL, addr, addr, flags, value, 0, NULL, NULL, NULL);
ec671737f8edfb Christian König      2018-12-07  2851  	if (r)
ec671737f8edfb Christian König      2018-12-07  2852  		goto error_unlock;
ec671737f8edfb Christian König      2018-12-07  2853  
ec671737f8edfb Christian König      2018-12-07  2854  	r = amdgpu_vm_update_pdes(adev, vm, true);
ec671737f8edfb Christian König      2018-12-07  2855  
ec671737f8edfb Christian König      2018-12-07  2856  error_unlock:
ec671737f8edfb Christian König      2018-12-07  2857  	amdgpu_bo_unreserve(root);
ec671737f8edfb Christian König      2018-12-07  2858  	if (r < 0)
2b665c3735b318 Philip Yang          2021-04-01  2859  		DRM_ERROR("Can't handle page fault (%d)\n", r);
ec671737f8edfb Christian König      2018-12-07  2860  
ec671737f8edfb Christian König      2018-12-07  2861  error_unref:
ec671737f8edfb Christian König      2018-12-07  2862  	amdgpu_bo_unref(&root);
ec671737f8edfb Christian König      2018-12-07  2863  
ec671737f8edfb Christian König      2018-12-07  2864  	return false;
ec671737f8edfb Christian König      2018-12-07  2865  }
ff72bc40317079 Mihir Bhogilal Patel 2020-10-08  2866  

:::::: The code at line 2781 was first introduced by commit
:::::: ec671737f8edfb8edf246afd425fdbed35284b23 drm/amdgpu: add graceful VM fault handling v3

:::::: TO: Christian König <christian.koenig@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
