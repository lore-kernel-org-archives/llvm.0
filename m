Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2C1CA6F;
	Tue, 30 Apr 2024 22:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714516802; cv=none; b=h5D26IJWJ+QaIN+7lf/8bAP1rqJZaU3p09wqnwGCNRvCupL/xMpLpnG/drzVga0QGUmo4wAQP/dvQ+VNV28KRYj1N0apt2oKgrJIJNP9IjYRyL548WRY6BopgEX8pILPZuQkGCyqLAfXNR/m/ej5GufNWszvdnDD1a3L9eQ52ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714516802; c=relaxed/simple;
	bh=Jv4SOnW54rko3wPIa7Bsmfm/wHYKwlBtotz9xWJXC08=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UCxk+um4xgGqyGXpBsOsIWyTYPGB9vmp6hKWXdBjJw24npO5B8slLgjch85V9zDOBEWfMwxrNFlHk8po5GZNGT4WHLWtMVfDOwzzWgOdIXPtjTcZqDi9gImwNURy43OIWJTwgGheaCst6m7wsGfLA2WgRjOa7hZpinInjoYfulU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hZjHAKBz; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hZjHAKBz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714516800; x=1746052800;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jv4SOnW54rko3wPIa7Bsmfm/wHYKwlBtotz9xWJXC08=;
  b=hZjHAKBzDqZBDzv9W8GGOrgzzS5SjyARj3XOc+z9OXbm44H/p7ztJvj5
   osvqjQ7n8uCO9S6yeHlMr5ubV3Uy+oD7CnaNH2379A8UPpyaZkpv+KQf1
   H20pP5GdO6HUSRvnkTqTi5RhGiVY1TL7q7ivqaeZGclGLcaCCOspbPRxL
   KJuP+uQc9G5mRqcaizbp34J1Yh/FkIImmY/dBMZaW1ruHo8qky3UpNCtO
   60HMFHdMvyJMUfnwAzExqsImByVLvLn2lt5HwRItAVioNfvqvHzXS/M3c
   WJ4ltk3EQYkQ0HSu4tFNHtQCsLigwi8JpXiplyWG7S8O/P4X6JEOqN2nQ
   w==;
X-CSE-ConnectionGUID: a6GqnLE8TJiF/hlnfOmFhQ==
X-CSE-MsgGUID: Bv2rpyxDTX61GTVEkJig+g==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="10470023"
X-IronPort-AV: E=Sophos;i="6.07,243,1708416000"; 
   d="scan'208";a="10470023"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2024 15:39:59 -0700
X-CSE-ConnectionGUID: oQ5C+Y2ET4KMH6qCAVThgQ==
X-CSE-MsgGUID: 1h2OEPMTQsC3s+Ki7kRWCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,243,1708416000"; 
   d="scan'208";a="31325918"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 30 Apr 2024 15:39:58 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1w8h-0008el-2n;
	Tue, 30 Apr 2024 22:39:55 +0000
Date: Wed, 1 May 2024 06:39:42 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:dma-split-v1 4/17] arch/powerpc/include/asm/pci.h:49:42:
 warning: declaration of 'struct dma_map_ops' will not be visible outside of
 this function
Message-ID: <202405010612.RhFViKjr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dma-split-v1
head:   b66ed91ccee0e8e645a07f54f0e39fe9ff4f03c9
commit: c9054c6f609d4d89977171559cd16e48e5fdb8b8 [4/17] dma-mapping: check if IOVA can be used
config: powerpc-randconfig-001-20240501 (https://download.01.org/0day-ci/archive/20240501/202405010612.RhFViKjr-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240501/202405010612.RhFViKjr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405010612.RhFViKjr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/dma/direct.c:10:
   In file included from include/linux/dma-map-ops.h:12:
   In file included from include/linux/pci.h:2106:
>> arch/powerpc/include/asm/pci.h:49:42: warning: declaration of 'struct dma_map_ops' will not be visible outside of this function [-Wvisibility]
   void __init set_pci_dma_ops(const struct dma_map_ops *dma_ops);
                                            ^
   1 warning generated.
--
   In file included from kernel/dma/mapping.c:11:
   In file included from include/linux/dma-map-ops.h:12:
   In file included from include/linux/pci.h:2106:
>> arch/powerpc/include/asm/pci.h:49:42: warning: declaration of 'struct dma_map_ops' will not be visible outside of this function [-Wvisibility]
   void __init set_pci_dma_ops(const struct dma_map_ops *dma_ops);
                                            ^
   kernel/dma/mapping.c:877:6: error: call to undeclared function 'cc_platform_has'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           if (cc_platform_has(CC_ATTR_MEM_ENCRYPT)) {
               ^
   kernel/dma/mapping.c:877:22: error: use of undeclared identifier 'CC_ATTR_MEM_ENCRYPT'
           if (cc_platform_has(CC_ATTR_MEM_ENCRYPT)) {
                               ^
   1 warning and 2 errors generated.


vim +49 arch/powerpc/include/asm/pci.h

^1da177e4c3f41 include/asm-ppc64/pci.h        Linus Torvalds 2005-04-16  47  
4fc665b88a79a4 arch/powerpc/include/asm/pci.h Becky Bruce    2008-09-12  48  #ifdef CONFIG_PCI
d276960d9296b6 arch/powerpc/include/asm/pci.h Nick Child     2021-12-16 @49  void __init set_pci_dma_ops(const struct dma_map_ops *dma_ops);
4fc665b88a79a4 arch/powerpc/include/asm/pci.h Becky Bruce    2008-09-12  50  #else	/* CONFIG_PCI */
4fc665b88a79a4 arch/powerpc/include/asm/pci.h Becky Bruce    2008-09-12  51  #define set_pci_dma_ops(d)
4fc665b88a79a4 arch/powerpc/include/asm/pci.h Becky Bruce    2008-09-12  52  #endif
4fc665b88a79a4 arch/powerpc/include/asm/pci.h Becky Bruce    2008-09-12  53  

:::::: The code at line 49 was first introduced by commit
:::::: d276960d9296b6a9074795fe60a513abf8474e35 powerpc/kernel: Add __init attribute to eligible functions

:::::: TO: Nick Child <nick.child@ibm.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
