Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050A61E7C03;
	Thu, 15 May 2025 21:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747343248; cv=none; b=caVxArpNC3iR9gTpVH74Zc0VwFlGd8NccE2fdu3YaOXRRR59Q6Nx21aUIbv5fHsU9gI4q26D1HEy8eBLWlzKJKfgZhDeqLPbuTGpuW6ob92kWANCU9PZZfjnpW8KroOK+dfq9JdFyacAQQrQWqpBgXYD22hS3wa7LSbW8aU1XZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747343248; c=relaxed/simple;
	bh=F1DZmTJmJeHrH0/syPtI2XbebqUW0IxtJqKSBpNegE8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WFGqqFYiWOzMr0ZC/1xri8qjydj8pLX3l+L9xOQTMSvLQ2oKzUzHBSIpX5sIr7QE9bYnwPRkw+r8o9pME0BLUHG4A2F/k04PtZ86CObOSJqK4LpyAOjuRhAlB/1hFoqPUTbEjGPoMix8dApZUKuQ2koNgYGOiwl2wthbwTbXobk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AJkLyDb4; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AJkLyDb4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747343246; x=1778879246;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F1DZmTJmJeHrH0/syPtI2XbebqUW0IxtJqKSBpNegE8=;
  b=AJkLyDb4Dv5CkGRRUm5gztV8xpbaujfMGTgMO1zB95RBzphjbIfuF4mv
   jQjMYfQxzZWniQx8FrVtDRX0/UoEXSC9haB3zaoFuvQHiJ/QQQTR4MKK3
   uTuilRS9rIQsBxd/XBigg5IkRJOmj8LAVnA9eGr0vnrOUpaa8tZ/M2IXZ
   cQ6kJ4aJqUrVFQQiiH/eU24F0H/DNi8WYCkNQtxtifpDMwZidoScUkL6F
   cjo0suAw+Ao+WsO8Ca6YWTi+C040Xmw8kMLYMDnctumLiJIBc206rJDo2
   2BwkAP6HIJ2Z4VRHTKFY/kpat5rw0ExBWMA1c257/wfIfmlEY7O9l959q
   w==;
X-CSE-ConnectionGUID: Y73rRK0dTeui4x8R7KMHVQ==
X-CSE-MsgGUID: pCwk+7uVRVamzj4Ic5i7sQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="53105023"
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
   d="scan'208";a="53105023"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 14:07:25 -0700
X-CSE-ConnectionGUID: qK5SWUIbTF+2dMiIskKOCg==
X-CSE-MsgGUID: to0aNyyLQBar3bJCbbfZ3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
   d="scan'208";a="143608517"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 May 2025 14:07:23 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFfnV-000IkF-1L;
	Thu, 15 May 2025 21:07:21 +0000
Date: Fri, 16 May 2025 05:07:09 +0800
From: kernel test robot <lkp@intel.com>
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_raid6_rvv_v5 58/68] kernel/iomem.c:13:25: error: call
 to undeclared function 'ioremap_prot'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202505160422.Ac5PTNaI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_raid6_rvv_v5
head:   9b85cdf2ad159e2a8ee78d62c6b423942917119e
commit: ba7f462ebad5b1808e7252e72258434fcf86109b [58/68] riscv: Define ioremap_cache for RISC-V
config: riscv-nommu_k210_defconfig (https://download.01.org/0day-ci/archive/20250516/202505160422.Ac5PTNaI-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250516/202505160422.Ac5PTNaI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505160422.Ac5PTNaI-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from kernel/iomem.c:4:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:139:
   include/asm-generic/io.h:804:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     804 |         insb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:107:53: note: expanded from macro 'insb'
     107 | #define insb(addr, buffer, count) __insb(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from kernel/iomem.c:4:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:139:
   include/asm-generic/io.h:812:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     812 |         insw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:108:53: note: expanded from macro 'insw'
     108 | #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from kernel/iomem.c:4:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:139:
   include/asm-generic/io.h:820:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     820 |         insl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:109:53: note: expanded from macro 'insl'
     109 | #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from kernel/iomem.c:4:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:139:
   include/asm-generic/io.h:829:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     829 |         outsb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:121:55: note: expanded from macro 'outsb'
     121 | #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from kernel/iomem.c:4:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:139:
   include/asm-generic/io.h:838:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     838 |         outsw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:122:55: note: expanded from macro 'outsw'
     122 | #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from kernel/iomem.c:4:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:139:
   include/asm-generic/io.h:847:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     847 |         outsl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:123:55: note: expanded from macro 'outsl'
     123 | #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from kernel/iomem.c:4:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:139:
   include/asm-generic/io.h:1175:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1175 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> kernel/iomem.c:13:25: error: call to undeclared function 'ioremap_prot'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      13 |         return (__force void *)ioremap_cache(offset, size);
         |                                ^
   arch/riscv/include/asm/io.h:34:19: note: expanded from macro 'ioremap_cache'
      34 |         ((__force void *)ioremap_prot((addr), (size), PAGE_KERNEL))
         |                          ^
>> kernel/iomem.c:13:25: warning: cast to 'void *' from smaller integer type 'int' [-Wint-to-void-pointer-cast]
      13 |         return (__force void *)ioremap_cache(offset, size);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:34:3: note: expanded from macro 'ioremap_cache'
      34 |         ((__force void *)ioremap_prot((addr), (size), PAGE_KERNEL))
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   8 warnings and 1 error generated.


vim +/ioremap_prot +13 kernel/iomem.c

5981690ddb8f72 Dan Williams       2018-03-29   7  
5981690ddb8f72 Dan Williams       2018-03-29   8  #ifndef arch_memremap_wb
a9ebcb88136ca8 Kirill A. Shutemov 2025-02-17   9  static void *arch_memremap_wb(resource_size_t offset, unsigned long size,
a9ebcb88136ca8 Kirill A. Shutemov 2025-02-17  10  			      unsigned long flags)
5981690ddb8f72 Dan Williams       2018-03-29  11  {
68af05143fd4b4 Arnd Bergmann      2023-07-26  12  #ifdef ioremap_cache
5981690ddb8f72 Dan Williams       2018-03-29 @13  	return (__force void *)ioremap_cache(offset, size);
68af05143fd4b4 Arnd Bergmann      2023-07-26  14  #else
68af05143fd4b4 Arnd Bergmann      2023-07-26  15  	return (__force void *)ioremap(offset, size);
68af05143fd4b4 Arnd Bergmann      2023-07-26  16  #endif
5981690ddb8f72 Dan Williams       2018-03-29  17  }
5981690ddb8f72 Dan Williams       2018-03-29  18  #endif
5981690ddb8f72 Dan Williams       2018-03-29  19  

:::::: The code at line 13 was first introduced by commit
:::::: 5981690ddb8f72f9546a2d017a914cf56095fc1f memremap: split devm_memremap_pages() and memremap() infrastructure

:::::: TO: Dan Williams <dan.j.williams@intel.com>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
