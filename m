Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97EE48CFC;
	Sat, 18 May 2024 20:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716064613; cv=none; b=kndAr2uJcqUDL/AOIlNKzA1GgBmf+o8lexo6ZTXnHw2gfgZDxWp1ogdgacu6g1KW7A6MQ7xOYvqkH/fzti2J/Fwlq8rvRW1WdeoPGsTj6ZS5icWcessDp9r0yb0KiMplrKqz2q1m9sc5VGgL5JRSE9vwlxAczTAUJL9kSKoJLUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716064613; c=relaxed/simple;
	bh=PeWOLlAssIzrLGcBPfQ9Uu3NZ5ZDaG7HRZS39fppu/o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cF3IkCrgnDs0BfczLAE7xQ5PUuK/eb2fgvNOAqFboB9h5HFxG48xKJBxoS7B78HHcfXKDXgONxa2XnyLhQ7A3e1Eos+tvrVwL2wjU/US33ffwo6ENrvrIvKftnE6T7GwUpl17znAWNtUTzT7EhBLXx44D1SuzJSAteUB76Xlqqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AekbcSwK; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AekbcSwK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716064612; x=1747600612;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PeWOLlAssIzrLGcBPfQ9Uu3NZ5ZDaG7HRZS39fppu/o=;
  b=AekbcSwKOfzHke6artabDv6giBqRxIyE7p1aMIe3DIVBXW8gcFzOrnfJ
   A5RxOmtsuscOWajaEunmBSkIUYdvrpOSAgrrbNA+jNBGiUEcAGsYIT3DI
   lYfB50Row+95v3sVTEw0klWIsCsInQcsuk7Dh/C8VNQwbT2R5gFFo3iEt
   k2weB29qHTFbXj4vtgeC4OZA0YkOwlUmcP9Ix506buluAcS8TStJF3/0v
   cLa115GvCaUgiIqE4sO9uP8OQ30HC6m3DkGFoeR5Bu0BL8iaoIOs15hDZ
   1XF9IxEG+vF/2bmPFuOncoeP0WSTeVCrtEbf9KLlPEf4mhNUisg7XXVqq
   g==;
X-CSE-ConnectionGUID: HAwwty7dQo2pnxehgg2+JA==
X-CSE-MsgGUID: bd331P+bTcWPpK4wfK6FNw==
X-IronPort-AV: E=McAfee;i="6600,9927,11076"; a="12078118"
X-IronPort-AV: E=Sophos;i="6.08,171,1712646000"; 
   d="scan'208";a="12078118"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2024 13:36:51 -0700
X-CSE-ConnectionGUID: vzCjt9JVSa2zdVN7GcQPdw==
X-CSE-MsgGUID: 5wfYg/oBQyW9q5EhHvENMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,171,1712646000"; 
   d="scan'208";a="55352002"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 18 May 2024 13:36:50 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8QnP-0002bg-2e;
	Sat, 18 May 2024 20:36:47 +0000
Date: Sun, 19 May 2024 04:36:45 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/virt_enable_less_sucky 4/5]
 arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:6443:10: error: use of
 undeclared identifier 'kvm_usage_count'; did you mean 'set_page_count'?
Message-ID: <202405190405.ceRSiCwy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/virt_enable_less_sucky
head:   371a6c885b7bffb276ebf0a7e660d2702b1555e7
commit: b9f6ab5e571d77c7cc35dd6f4642677fdc6e8bc3 [4/5] KVM: Add a module param to allow enabled virtualization when KVM is loaded
config: powerpc64-randconfig-003-20240518 (https://download.01.org/0day-ci/archive/20240519/202405190405.ceRSiCwy-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240519/202405190405.ceRSiCwy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405190405.ceRSiCwy-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:6443:10: error: use of undeclared identifier 'kvm_usage_count'; did you mean 'set_page_count'?
                   BUG_ON(kvm_usage_count);
                          ^~~~~~~~~~~~~~~
                          set_page_count
   include/asm-generic/bug.h:166:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                               ^
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/page_ref.h:97:20: note: 'set_page_count' declared here
   static inline void set_page_count(struct page *page, int v)
                      ^
   1 error generated.


vim +6443 arch/powerpc/kvm/../../../virt/kvm/kvm_main.c

  6429	
  6430	void kvm_exit(void)
  6431	{
  6432		int cpu;
  6433	
  6434		/*
  6435		 * Note, unregistering /dev/kvm doesn't strictly need to come first,
  6436		 * fops_get(), a.k.a. try_module_get(), prevents acquiring references
  6437		 * to KVM while the module is being stopped.
  6438		 */
  6439		misc_deregister(&kvm_dev);
  6440	
  6441		if (enable_virt_at_load) {
  6442			kvm_disable_virtualization();
> 6443			BUG_ON(kvm_usage_count);
  6444		}
  6445	
  6446		debugfs_remove_recursive(kvm_debugfs_dir);
  6447		for_each_possible_cpu(cpu)
  6448			free_cpumask_var(per_cpu(cpu_kick_mask, cpu));
  6449		kmem_cache_destroy(kvm_vcpu_cache);
  6450		kvm_vfio_ops_exit();
  6451		kvm_async_pf_deinit();
  6452		kvm_irqfd_exit();
  6453	}
  6454	EXPORT_SYMBOL_GPL(kvm_exit);
  6455	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
