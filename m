Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C4323750;
	Fri, 22 Dec 2023 15:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ttz4fOs4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703258932; x=1734794932;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sb+GDzekklYdB0ilXGUtY/XsLN/XS+w4MQjvFg62St4=;
  b=Ttz4fOs4FQ1N+TOHKUTMwp8GNtm3DrK1HpAC0s171lTwP8PpjOTtBC/Z
   Z+HBP86E20CcukWFh7He2kxE2PtW2BuehIoRJp4SPOVO15XtVy1Z8pyHf
   Lg277IIFX5okgH/uWNhPklODEffdqIuLW3SL/cm09LnZdzcBqo0CSgz6d
   YsRadnLyl9jEDPKMVcW6bEBsTNswzNaz5+CZC2vaCX+V/aXmRGwyOrvDZ
   XclbGUXbKtxyp02Q/2giXlxCEWFN+mMusGW93DKRal0R+kcxGN8GeKKtk
   wJ2j1hiXLkr6FMgEEX/AP7+8AZfftI1CshPZQDD3EgGbSAfvT858WURIn
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="14808693"
X-IronPort-AV: E=Sophos;i="6.04,296,1695711600"; 
   d="scan'208";a="14808693"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2023 07:28:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="726810717"
X-IronPort-AV: E=Sophos;i="6.04,296,1695711600"; 
   d="scan'208";a="726810717"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 22 Dec 2023 07:28:41 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGhS3-0009ar-1a;
	Fri, 22 Dec 2023 15:28:39 +0000
Date: Fri, 22 Dec 2023 23:28:28 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:zap-batching 43/50] include/linux/pgtable.h:220:3:
 error: call to undeclared function 'ptep_set_wrprotect'; ISO C99 and later
 do not support implicit function declarations
Message-ID: <202312222349.jeDbB6p5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux zap-batching
head:   a87ca0519e9108ec48b13a88d4a30a7756923d83
commit: 7ddc8bfc39055b1ed487d6639b4125e1c77a9e4b [43/50] mm/memory: optimize fork() with PTE-mapped THP
config: hexagon-allnoconfig (https://download.01.org/0day-ci/archive/20231222/202312222349.jeDbB6p5-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project d3ef86708241a3bee902615c190dead1638c4e09)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231222/202312222349.jeDbB6p5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312222349.jeDbB6p5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/hexagon/kernel/asm-offsets.c:15:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from arch/hexagon/kernel/asm-offsets.c:15:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from arch/hexagon/kernel/asm-offsets.c:15:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from arch/hexagon/kernel/asm-offsets.c:15:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   In file included from include/asm-generic/io.h:1048:
>> include/linux/pgtable.h:220:3: error: call to undeclared function 'ptep_set_wrprotect'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     220 |                 ptep_set_wrprotect(mm, addr, ptep);
         |                 ^
   include/linux/pgtable.h:220:3: note: did you mean 'pte_wrprotect'?
   arch/hexagon/include/asm/pgtable.h:296:21: note: 'pte_wrprotect' declared here
     296 | static inline pte_t pte_wrprotect(pte_t pte)
         |                     ^
   In file included from arch/hexagon/kernel/asm-offsets.c:15:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   In file included from include/asm-generic/io.h:1048:
   include/linux/pgtable.h:631:20: error: static declaration of 'ptep_set_wrprotect' follows non-static declaration
     631 | static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long address, pte_t *ptep)
         |                    ^
   include/linux/pgtable.h:220:3: note: previous implicit declaration is here
     220 |                 ptep_set_wrprotect(mm, addr, ptep);
         |                 ^
   6 warnings and 2 errors generated.
   make[3]: *** [scripts/Makefile.build:116: arch/hexagon/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1191: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/ptep_set_wrprotect +220 include/linux/pgtable.h

   214	
   215	#ifndef wrprotect_ptes
   216	static inline void wrprotect_ptes(struct mm_struct *mm, unsigned long addr,
   217			pte_t *ptep, unsigned int nr)
   218	{
   219		for (;;) {
 > 220			ptep_set_wrprotect(mm, addr, ptep);
   221			if (--nr == 0)
   222				break;
   223			ptep++;
   224			addr += PAGE_SIZE;
   225		}
   226	}
   227	#endif
   228	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
