Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A659C12FF81;
	Tue,  6 Feb 2024 13:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707227350; cv=none; b=pxFA6l3d3dHM1xdqUWWkOYj5Dm0yHLdKkveS86E39MFweELXoLcslfTljOqP9UnrL9qWtv+TeP3o5XfCXIXqjHJ1mPrQjRs+N64Kg6z1sVXm4YpxlXDzkbijPbeqjHIKt84VrEjPhFNBhaAo6V4R18a1k3KNZdv9XBwyrfF3XII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707227350; c=relaxed/simple;
	bh=bvSaPUV4snv+qsBG7fA47qWLnJl9VUssbtSwac73KPk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BauG8uhhmE0K5CFYvjDVzg3bTqQtivJW2lQ0RcEKHuaXE/htNu4B9XyPQ8YOwhVj2SM0yLSahHz7dqFHt4TWMRHyNDI8PE1YXHzBJpudrYLUWi6xWHQsyxcHHVcBk9+tF82d/9eJAqRVFemvOrowO8PJYGoGkVAbsY4lZzLHPt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nh6QhxPl; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nh6QhxPl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707227349; x=1738763349;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bvSaPUV4snv+qsBG7fA47qWLnJl9VUssbtSwac73KPk=;
  b=Nh6QhxPl3bxP0ErfCxCw/GDm3QM4stBeISQnrMAr7qrlhwNav+mRggSh
   4h3kk01p1+oGvFdCw0SMTGI4d7g9KZ4BIQixDsYxF4GtLObb+mP8sLjaA
   9t9abvL7EdlPMfrKFp6USjrxnHA6DEkWQ0jJ3t5Cskdm0PB+jFKXS+/4F
   eYkOZ+KU/Zp2gdJm3SNKobvAIQbyPtAzM59wjZiqQAmJL/Nw6K7CgS2Ug
   5CxM42Vvi5I3AWCi1JI19alb9P8LNguA6TXx3ShCtU7BsMC/VaESBXNzl
   XgiFo+SFM3qF2DfHO+W5KwMaFvH0oHEXsKlfZt6pfdmQRi+8bPRxLI2tt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="18169517"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="18169517"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 05:49:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="24265609"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Feb 2024 05:49:06 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXLou-0001RN-03;
	Tue, 06 Feb 2024 13:49:04 +0000
Date: Tue, 6 Feb 2024 21:48:46 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Chenyi Qiang <chenyi.qiang@intel.com>
Subject: [intel-tdx:kvm-upstream-workaround 327/376]
 arch/x86/kvm/../../../virt/kvm/kvm_main.c:6515:6: error: call to undeclared
 function 'kvm_gmem_fs_init'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202402062119.Ha0ml1xV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   e7a7b1f2a1c28403511e71538d30888c9e1425ef
commit: 935629ed9b34ef93513bf21707ab88c84ded03e4 [327/376] Revert "kvm: guestmem: do not use a file system"
config: i386-buildonly-randconfig-002-20240206 (https://download.01.org/0day-ci/archive/20240206/202402062119.Ha0ml1xV-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240206/202402062119.Ha0ml1xV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402062119.Ha0ml1xV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/../../../virt/kvm/kvm_main.c:6515:6: error: call to undeclared function 'kvm_gmem_fs_init'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    6515 |         r = kvm_gmem_fs_init();
         |             ^
   arch/x86/kvm/../../../virt/kvm/kvm_main.c:6515:6: note: did you mean 'kvm_gmem_init'?
   arch/x86/kvm/../../../virt/kvm/kvm_mm.h:49:20: note: 'kvm_gmem_init' declared here
      49 | static inline void kvm_gmem_init(struct module *module)
         |                    ^
>> arch/x86/kvm/../../../virt/kvm/kvm_main.c:6550:2: error: call to undeclared function 'kvm_gmem_fs_exit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    6550 |         kvm_gmem_fs_exit();
         |         ^
   arch/x86/kvm/../../../virt/kvm/kvm_main.c:6591:2: error: call to undeclared function 'kvm_gmem_fs_exit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    6591 |         kvm_gmem_fs_exit();
         |         ^
   3 errors generated.


vim +/kvm_gmem_fs_init +6515 arch/x86/kvm/../../../virt/kvm/kvm_main.c

  6483	
  6484		/* A kmem cache lets us meet the alignment requirements of fx_save. */
  6485		if (!vcpu_align)
  6486			vcpu_align = __alignof__(struct kvm_vcpu);
  6487		kvm_vcpu_cache =
  6488			kmem_cache_create_usercopy("kvm_vcpu", vcpu_size, vcpu_align,
  6489						   SLAB_ACCOUNT,
  6490						   offsetof(struct kvm_vcpu, arch),
  6491						   offsetofend(struct kvm_vcpu, stats_id)
  6492						   - offsetof(struct kvm_vcpu, arch),
  6493						   NULL);
  6494		if (!kvm_vcpu_cache) {
  6495			r = -ENOMEM;
  6496			goto err_vcpu_cache;
  6497		}
  6498	
  6499		for_each_possible_cpu(cpu) {
  6500			if (!alloc_cpumask_var_node(&per_cpu(cpu_kick_mask, cpu),
  6501						    GFP_KERNEL, cpu_to_node(cpu))) {
  6502				r = -ENOMEM;
  6503				goto err_cpu_kick_mask;
  6504			}
  6505		}
  6506	
  6507		r = kvm_irqfd_init();
  6508		if (r)
  6509			goto err_irqfd;
  6510	
  6511		r = kvm_async_pf_init();
  6512		if (r)
  6513			goto err_async_pf;
  6514	
> 6515		r = kvm_gmem_fs_init();
  6516		if (r)
  6517			goto err_gmem;
  6518	
  6519		kvm_chardev_ops.owner = module;
  6520		kvm_vm_fops.owner = module;
  6521		kvm_vcpu_fops.owner = module;
  6522		kvm_device_fops.owner = module;
  6523	
  6524		kvm_preempt_ops.sched_in = kvm_sched_in;
  6525		kvm_preempt_ops.sched_out = kvm_sched_out;
  6526	
  6527		kvm_init_debug();
  6528	
  6529		r = kvm_vfio_ops_init();
  6530		if (WARN_ON_ONCE(r))
  6531			goto err_vfio;
  6532	
  6533		kvm_gmem_init(module);
  6534	
  6535		/*
  6536		 * Registration _must_ be the very last thing done, as this exposes
  6537		 * /dev/kvm to userspace, i.e. all infrastructure must be setup!
  6538		 */
  6539		r = misc_register(&kvm_dev);
  6540		if (r) {
  6541			pr_err("kvm: misc device register failed\n");
  6542			goto err_register;
  6543		}
  6544	
  6545		return 0;
  6546	
  6547	err_register:
  6548		kvm_vfio_ops_exit();
  6549	err_vfio:
> 6550		kvm_gmem_fs_exit();
  6551	err_gmem:
  6552		kvm_async_pf_deinit();
  6553	err_async_pf:
  6554		kvm_irqfd_exit();
  6555	err_irqfd:
  6556	err_cpu_kick_mask:
  6557		for_each_possible_cpu(cpu)
  6558			free_cpumask_var(per_cpu(cpu_kick_mask, cpu));
  6559		kmem_cache_destroy(kvm_vcpu_cache);
  6560	err_vcpu_cache:
  6561	#ifdef CONFIG_KVM_GENERIC_HARDWARE_ENABLING
  6562		unregister_syscore_ops(&kvm_syscore_ops);
  6563		cpuhp_remove_state_nocalls(CPUHP_AP_KVM_ONLINE);
  6564	#endif
  6565		return r;
  6566	}
  6567	EXPORT_SYMBOL_GPL(kvm_init);
  6568	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
