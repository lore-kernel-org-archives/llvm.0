Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E600C1FBC92;
	Thu,  4 Dec 2025 05:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764827755; cv=none; b=DFg64nQro5z2xYsQWVGUhV+XOAb1xoKN5znyIa+6wTnWwgPDWRyLntss7087szqjehPxE7f/5Liimw6PPO2vCzUid6o9idp9YRByMNgBDFB7C0Rt8/17fENIiqyPFyC3pcGcqiC0Q5gusd65vLqWnZQnEeorAESzHnUAub2Qfck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764827755; c=relaxed/simple;
	bh=opH+YP4Sv9nSGcUPmQnt0fYSXNrsfTVkE+MNkAOOBjA=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ttPzDvnWKSvEqys9fQR5Ty3SN0uxxk2ch13KcYNj2uP4a7FW6SrZPrza1wj/FyEI7iGG7li+KAuSl7ZyS+qJHutIez25mw+U8y7tlJlAka0MEVA+8WFwAeqI2hBSWm+N4JqXYk4AAxB4Vp0Gdxj/DTlFyclhZXbTtq66ThsMmgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QhRj+z0H; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QhRj+z0H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764827754; x=1796363754;
  h=date:from:cc:subject:message-id:mime-version;
  bh=opH+YP4Sv9nSGcUPmQnt0fYSXNrsfTVkE+MNkAOOBjA=;
  b=QhRj+z0HIJYl8Pmzxxy70Ju9cCgyNY3yrsjl9KAebT/zxLB1KDVBsafa
   B5PKgzHwpkFOIAlSRxEMh16eAYfIMJpRr4/FcWwQRHSz0jG/bsAIuWywv
   2hF5hRRGLuSqDWgaD4ksAuEvWvlZncOdHy7gmfODY+VPVdng0myR8ApIS
   5Ahi6+Kaqb9TabGjHA+PcNHgbZ1N7C4ZA9oRz70mVWIC3/OpXB02QAKhx
   R+LIyf6hlsF+zQV9siPFQyZmInmsktjMFTt+klmhZJS0PiYyVfFlft/wm
   w6oRVwHHIh/u5D0I3yfbDnu7p7ibjHePOdFbskd3a97zigjZfV1BEpnc2
   Q==;
X-CSE-ConnectionGUID: q1nDXeEdSRe0FBDQ/8J/8w==
X-CSE-MsgGUID: DI2juIoUQsSaXc9JrgU2dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="92317175"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="92317175"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 21:55:53 -0800
X-CSE-ConnectionGUID: UOXwLNZ+Q3eR5iyOPY8ktw==
X-CSE-MsgGUID: IXdsKBlTQXSj1bBDyaWqkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="195000420"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 03 Dec 2025 21:55:52 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vR2Jh-00000000DVF-1YF8;
	Thu, 04 Dec 2025 05:55:49 +0000
Date: Thu, 4 Dec 2025 13:55:30 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [driver-core:driver-core-testing 1/1] rust/helpers/pci.c:36:2:
 error: call to undeclared function 'pci_free_irq_vectors'; ISO C99 and later
 do not support implicit function declarations
Message-ID: <202512041312.RzmYhovr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: devel@driverdev.osuosl.org
TO: Danilo Krummrich <dakr@kernel.org>
CC: Alice Ryhl <aliceryhl@google.com>
CC: Joel Fernandes <joelagnelf@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git driver-core-testing
head:   473b9f331718267815649cd93801da832200db71
commit: 473b9f331718267815649cd93801da832200db71 [1/1] rust: pci: fix build failure when CONFIG_PCI_MSI is disabled
config: um-randconfig-002-20251204 (https://download.01.org/0day-ci/archive/20251204/202512041312.RzmYhovr-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 734a912d0f025559fcf76bde9aaaeb0383c1625a)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251204/202512041312.RzmYhovr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512041312.RzmYhovr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> rust/helpers/pci.c:36:2: error: call to undeclared function 'pci_free_irq_vectors'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>> Unable to generate bindings: clang diagnosed error: rust/helpers/pci.c:36:2: error: call to undeclared function 'pci_free_irq_vectors'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
--
   make[3]: *** [rust/Makefile:384: rust/bindings/bindings_helpers_generated.rs] Error 1 shuffle=1269886895
   make[3]: *** Deleting file 'rust/bindings/bindings_helpers_generated.rs'
   In file included from rust/helpers/helpers.c:40:
>> rust/helpers/pci.c:36:2: error: call to undeclared function 'pci_free_irq_vectors'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   36 |         pci_free_irq_vectors(dev);
   |         ^
   rust/helpers/pci.c:36:2: note: did you mean 'pci_alloc_irq_vectors'?
   include/linux/pci.h:2161:1: note: 'pci_alloc_irq_vectors' declared here
   2161 | pci_alloc_irq_vectors(struct pci_dev *dev, unsigned int min_vecs,
   | ^
   1 error generated.
   make[3]: *** [rust/Makefile:495: rust/helpers/helpers.o] Error 1 shuffle=1269886895
   make[3]: Target 'rust/' not remade because of errors.
   make[2]: *** [Makefile:1286: prepare] Error 2 shuffle=1269886895
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=1269886895
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=1269886895
   make: Target 'prepare' not remade because of errors.


vim +/pci_free_irq_vectors +36 rust/helpers/pci.c

    33	
    34	void rust_helper_pci_free_irq_vectors(struct pci_dev *dev)
    35	{
  > 36		pci_free_irq_vectors(dev);
    37	}
    38	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
