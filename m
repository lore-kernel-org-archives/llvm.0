Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C031433BE;
	Sat,  1 Feb 2025 09:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738403088; cv=none; b=Uqwy+bJHkfItpprohDAsO/qohr/BjsdoVtqBgZDRU8ZNRVlCbqSk5xYuEC8eDCCFreD/8PqojVXVkDY/QgELmFPitgHiWGlLdTfu5HZ1Q2sw858TA5716YxHR+i7EX8WHxkDYgi9gxfPhnVTN0YsrbhrOkTRe3QwgqlaroRXAx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738403088; c=relaxed/simple;
	bh=gwEMc8C38Dk0JAKfHRB2VYHUEOC+P8taUoFkYNs2th8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I3Kn/vaVnmAVqYxy9W09f7jg0z4t00RMYuOOmgdaucqsd72oSISVv7eyFI0jyU7+cBk7n83qSHgH11zCAv2c82JDXHaYjNDrAdmipmTFjr4kuX/Y7tfGtfTqaHLOpe1myeZv94hoR3+MhTyGYGgR9pipT7kA0YgHZFk4A1gOXU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i4csvrW+; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i4csvrW+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738403086; x=1769939086;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gwEMc8C38Dk0JAKfHRB2VYHUEOC+P8taUoFkYNs2th8=;
  b=i4csvrW+qjFkr1DPfs2ZHwD84Bo+9QYXgUygSXjhHivqg5k54M5gtULM
   M/HLfUq3E8XbubnN36sN5Vkw3ORLJR3LKbdQ/MrGFby88gzIyIn4s2d9M
   1bgKheCNeBtqZ5lk+DnoohO9UTsuyzdu7H1IUdfqmVUuUqujYNcthG6q7
   Qssy7LkrNk54I/tapdo/txJ1eXtfrWa51DtAgzM9U3FsJ9MIJ9GUJ3fL5
   ZwejRB2HIE/O9vBk0s3bqEYCsbTpLc1VVAsTo2oqBW/17meYVdBokUV88
   E3niBcymRxPjhgV0q8dlhSDdnp8LF7Rf+UV/Ihu7jBVqd674VMIfxNIdy
   A==;
X-CSE-ConnectionGUID: lX9o7FsqQnGN9xOYDyo1xA==
X-CSE-MsgGUID: HVCRgjK+Q32ZxRU7dfAK1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="50349539"
X-IronPort-AV: E=Sophos;i="6.13,251,1732608000"; 
   d="scan'208";a="50349539"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2025 01:44:45 -0800
X-CSE-ConnectionGUID: 9hzC9pUHRFq7YMdiN8bkSA==
X-CSE-MsgGUID: lmWSkPl1SO2HnxEDd93BiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,251,1732608000"; 
   d="scan'208";a="109670396"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 01 Feb 2025 01:44:42 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1teA3M-000nyB-2Z;
	Sat, 01 Feb 2025 09:44:40 +0000
Date: Sat, 1 Feb 2025 17:44:23 +0800
From: kernel test robot <lkp@intel.com>
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_defconfig_v1 59/71] kernel/iomem.c:12:25: error: call
 to undeclared function 'ioremap_prot'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202502011735.AvVTLWSn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_defconfig_v1
head:   151e6b62be87ee0e25a222878cbb915ea0a25a8a
commit: 59e1479f0e3cda391a9cb02cff086226ca15af76 [59/71] riscv: Define ioremap_cache for RISC-V
config: riscv-randconfig-001-20250201 (https://download.01.org/0day-ci/archive/20250201/202502011735.AvVTLWSn-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 355d0b186f178668b103068537e517f3d52ad639)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250201/202502011735.AvVTLWSn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502011735.AvVTLWSn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/iomem.c:4:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:139:
   include/asm-generic/io.h:804:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     804 |         insb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:107:53: note: expanded from macro 'insb'
     107 | #define insb(addr, buffer, count) __insb(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from kernel/iomem.c:4:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:139:
   include/asm-generic/io.h:812:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     812 |         insw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:108:53: note: expanded from macro 'insw'
     108 | #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from kernel/iomem.c:4:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:139:
   include/asm-generic/io.h:820:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     820 |         insl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:109:53: note: expanded from macro 'insl'
     109 | #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from kernel/iomem.c:4:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:139:
   include/asm-generic/io.h:829:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     829 |         outsb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:121:55: note: expanded from macro 'outsb'
     121 | #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from kernel/iomem.c:4:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:139:
   include/asm-generic/io.h:838:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     838 |         outsw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:122:55: note: expanded from macro 'outsw'
     122 | #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from kernel/iomem.c:4:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:139:
   include/asm-generic/io.h:847:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     847 |         outsl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:123:55: note: expanded from macro 'outsl'
     123 | #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from kernel/iomem.c:4:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:139:
   include/asm-generic/io.h:1175:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1175 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> kernel/iomem.c:12:25: error: call to undeclared function 'ioremap_prot'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      12 |         return (__force void *)ioremap_cache(offset, size);
         |                                ^
   arch/riscv/include/asm/io.h:34:19: note: expanded from macro 'ioremap_cache'
      34 |         ((__force void *)ioremap_prot((addr), (size), _PAGE_KERNEL))
         |                          ^
>> kernel/iomem.c:12:25: error: use of undeclared identifier '_PAGE_KERNEL'
   arch/riscv/include/asm/io.h:34:48: note: expanded from macro 'ioremap_cache'
      34 |         ((__force void *)ioremap_prot((addr), (size), _PAGE_KERNEL))
         |                                                       ^
   7 warnings and 2 errors generated.


vim +/ioremap_prot +12 kernel/iomem.c

5981690ddb8f72 Dan Williams  2018-03-29   7  
5981690ddb8f72 Dan Williams  2018-03-29   8  #ifndef arch_memremap_wb
5981690ddb8f72 Dan Williams  2018-03-29   9  static void *arch_memremap_wb(resource_size_t offset, unsigned long size)
5981690ddb8f72 Dan Williams  2018-03-29  10  {
68af05143fd4b4 Arnd Bergmann 2023-07-26  11  #ifdef ioremap_cache
5981690ddb8f72 Dan Williams  2018-03-29 @12  	return (__force void *)ioremap_cache(offset, size);
68af05143fd4b4 Arnd Bergmann 2023-07-26  13  #else
68af05143fd4b4 Arnd Bergmann 2023-07-26  14  	return (__force void *)ioremap(offset, size);
68af05143fd4b4 Arnd Bergmann 2023-07-26  15  #endif
5981690ddb8f72 Dan Williams  2018-03-29  16  }
5981690ddb8f72 Dan Williams  2018-03-29  17  #endif
5981690ddb8f72 Dan Williams  2018-03-29  18  

:::::: The code at line 12 was first introduced by commit
:::::: 5981690ddb8f72f9546a2d017a914cf56095fc1f memremap: split devm_memremap_pages() and memremap() infrastructure

:::::: TO: Dan Williams <dan.j.williams@intel.com>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
