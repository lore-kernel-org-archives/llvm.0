Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C9E2798F8;
	Sun, 27 Sep 2026 04:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790482348; cv=none; b=sF50Atxhte4k9TiBcB+JYR6AQoEZB5/jwfFBeteevJpd7a+iECVmv3lhGrWVjhUW5bEvX4spaEC9AGWetUXBTQ7t2NKwY0GKABJQC3IYTSHo3Ka11ov3/RWtjKuj8cRNWjFX5/ed1vywShUDXXUCHi2e+swp+DnbsJz556pswi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790482348; c=relaxed/simple;
	bh=MXx4u0cb0q8Moz+IlqkNU35y6MrnD1oX5JcoYArAp6M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oomja2KQmRDqHCZJl3mOA3KkGF3hx9Gv8qOPWvFMi+DaqncATuRXwAg5acLD7QN2B4R4HsOyuETC1oGE2F3Gp3uTZDtwABezSBlDUZdv+qE4+/xKDhqQFAPrl+7dKexyUm3t7gLiqqOWwRx+//4crqCaH2O9Dw0mlCLyPI+p2Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l7b6hHWe; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l7b6hHWe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790482346; x=1822018346;
  h=date:from:to:cc:subject:message-id;
  bh=MXx4u0cb0q8Moz+IlqkNU35y6MrnD1oX5JcoYArAp6M=;
  b=l7b6hHWe8ghrQnCx/V8PHsyDItZGmcOeO6x2r/qBViSxCm/t+vgIrtpZ
   TJXQYy6r2clKxFbi84pPZ5ef4M+odlq2O3lSYsDBiektYQGlPcquRvlaT
   pgZCWdmrHP3itE094O2170gmak4RMoby3j7Pf1fG+v+C6fbO75FAz4cSQ
   RFYnoI4iASvL3BF17J0+0kkiaEEexRiubml7l82jdXjMLrYAwvmLhxAeA
   3xil2f6xll8V2OlT0ANGeIAEP0cBjWBG2hwjFRuynGI+iUSnmJvHpcu3p
   w81m61P0+HafyAFiwTQTxkfaKpOufkh7LfJCb6ufnV/mlQw1jgR+bZ6wh
   g==;
X-CSE-ConnectionGUID: 79ElbzizR92EZAwwlrEq8Q==
X-CSE-MsgGUID: nBFqT2XNS4mfLUTjrxIXag==
X-IronPort-AV: E=McAfee;i="6800,10657,11917"; a="116745389"
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="116745389"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2026 21:12:25 -0700
X-CSE-ConnectionGUID: MXh+rbWzSSy9SjMINzrKOw==
X-CSE-MsgGUID: R7Idw+hcT9qZ1At9P2tubQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="274246679"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 26 Sep 2026 21:12:24 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAgFQ-000000000Qv-295Y;
	Sun, 27 Sep 2026 04:12:20 +0000
Date: Sun, 27 Sep 2026 06:11:35 +0200
From: kernel test robot <lkp@intel.com>
To: Hajime Tazaki <thehajime@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Johannes Berg <johannes.berg@intel.com>,
 Ricardo Koller <ricarkol@google.com>
Subject: [linux-next:master 9572/10910] drivers/pci/pci.c:4137:2:
 error: call to undeclared function 'vunmap_range'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202609270632.WSdFLSK0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f5f84daefcd92d7a630066635ecea1433ed5eac7
commit: 626ff2b34dbb7679b798f7a4962a8b3def695045 [9572/10910] um: allow deselecting CONFIG_MMU
config: um-randconfig-2001-20260927 (https://download.01.org/0day-ci/archive/20260927/202609270632.WSdFLSK0-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260927/202609270632.WSdFLSK0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609270632.WSdFLSK0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/pci/pci.c:16:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> drivers/pci/pci.c:4137:2: error: call to undeclared function 'vunmap_range'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    4137 |         vunmap_range(vaddr, vaddr + resource_size(res));
         |         ^
   1 warning and 1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PCI
   Depends on [n]: HAVE_PCI [=y] && MMU [=n]
   Selected by [y]:
   - FORCE_PCI [=y]
   WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS_OF
   Depends on [n]: PM_GENERIC_DOMAINS [=y] && OF [=n]
   Selected by [y]:
   - COMMON_CLK_MT8173_MFGTOP [=y] && COMMON_CLK [=y] && (ARCH_MEDIATEK || COMPILE_TEST [=y]) && COMMON_CLK_MT8173 [=y] && PM [=y]


vim +/vunmap_range +4137 drivers/pci/pci.c

8b921acfeffdb0 Liviu Dudau     2014-09-29  4123  
4d3f13845957a8 Sinan Kaya      2016-06-10  4124  /**
4d3f13845957a8 Sinan Kaya      2016-06-10  4125   * pci_unmap_iospace - Unmap the memory mapped I/O space
4d3f13845957a8 Sinan Kaya      2016-06-10  4126   * @res: resource to be unmapped
4d3f13845957a8 Sinan Kaya      2016-06-10  4127   *
74356addc0b32e Bjorn Helgaas   2019-01-09  4128   * Unmap the CPU virtual address @res from virtual address space.  Only
74356addc0b32e Bjorn Helgaas   2019-01-09  4129   * architectures that have memory mapped IO functions defined (and the
74356addc0b32e Bjorn Helgaas   2019-01-09  4130   * PCI_IOBASE value defined) should call this function.
4d3f13845957a8 Sinan Kaya      2016-06-10  4131   */
4d3f13845957a8 Sinan Kaya      2016-06-10  4132  void pci_unmap_iospace(struct resource *res)
4d3f13845957a8 Sinan Kaya      2016-06-10  4133  {
8fe743b5eba0ab Arnd Bergmann   2025-04-23  4134  #if defined(PCI_IOBASE)
4d3f13845957a8 Sinan Kaya      2016-06-10  4135  	unsigned long vaddr = (unsigned long)PCI_IOBASE + res->start;
4d3f13845957a8 Sinan Kaya      2016-06-10  4136  
4ad0ae8c64ac8f Nicholas Piggin 2021-04-29 @4137  	vunmap_range(vaddr, vaddr + resource_size(res));
4d3f13845957a8 Sinan Kaya      2016-06-10  4138  #endif
4d3f13845957a8 Sinan Kaya      2016-06-10  4139  }
f90b0875463e45 Brian Norris    2017-03-09  4140  EXPORT_SYMBOL(pci_unmap_iospace);
4d3f13845957a8 Sinan Kaya      2016-06-10  4141  

:::::: The code at line 4137 was first introduced by commit
:::::: 4ad0ae8c64ac8f81a3651bca11be7c3cb086df80 mm/vmalloc: remove unmap_kernel_range

:::::: TO: Nicholas Piggin <npiggin@gmail.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
