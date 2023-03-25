Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC44364;
	Sat, 25 Mar 2023 10:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679740800; x=1711276800;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UecDB/p93q6PNdI5DglccO6QQISSb4qTC0ozdEidq8g=;
  b=HitGPw1RCBwaG1GBvvPLL2BPNJqSaRha20WROmXKqyXAqKk9icK9X12V
   dTfNoWlS3/9kcbCIAZV81m57DCn1Y/AeK//kb+cJVRTiPbpUdwglUwkSu
   nU7wU5JuC89HoS/Txt6lcwJiVSulDbcRQS0TB2d/VKfDzmgGw5nDo3g4E
   yB5DeeTr4nTrH+WZKBcp4FAFbI/BRhE4qmaG0k4TB4scJ6IxXDvs6RnSN
   BPUF7T/TCHSJTn3kw1zWndSHacPk6G1ZxcS6JdsMW/NGmg1CYROjoNg+6
   zJWPMgbcea3GH2gRdkx+va9mvx1YqmPT+6i8o/KelQ7LIrkuq8q/WcKAV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="323843700"
X-IronPort-AV: E=Sophos;i="5.98,290,1673942400"; 
   d="scan'208";a="323843700"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2023 03:40:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="682950370"
X-IronPort-AV: E=Sophos;i="5.98,290,1673942400"; 
   d="scan'208";a="682950370"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 25 Mar 2023 03:39:58 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pg1JW-000GDT-0j;
	Sat, 25 Mar 2023 10:39:58 +0000
Date: Sat, 25 Mar 2023 18:39:57 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arch@vger.kernel.org
Subject: [arnd-asm-generic:dma-sync-rework 7/22]
 arch/powerpc/mm/dma-noncoherent.c:91:59: error: must use 'enum' tag to refer
 to type 'dma_cache_op'
Message-ID: <202303251834.xlyWtsTh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git dma-sync-rework
head:   985cd64f3b17b82468e68c6269e09a5556d3720e
commit: a0183b361d4212de180444305367f20ad14f89fd [7/22] powerpc: dma-mapping: split out cache operation logic
config: powerpc-obs600_defconfig (https://download.01.org/0day-ci/archive/20230325/202303251834.xlyWtsTh-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git/commit/?id=a0183b361d4212de180444305367f20ad14f89fd
        git remote add arnd-asm-generic https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git
        git fetch --no-tags arnd-asm-generic dma-sync-rework
        git checkout a0183b361d4212de180444305367f20ad14f89fd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303251834.xlyWtsTh-lkp@intel.com/

All errors (new ones prefixed by >>):

   __do_insb
   ^
   arch/powerpc/include/asm/io.h:577:56: note: expanded from macro '__do_insb'
   #define __do_insb(p, b, n)      readsb((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/powerpc/mm/dma-noncoherent.c:12:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:640:
   arch/powerpc/include/asm/io-defs.h:45:1: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insw, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:637:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:186:1: note: expanded from here
   __do_insw
   ^
   arch/powerpc/include/asm/io.h:578:56: note: expanded from macro '__do_insw'
   #define __do_insw(p, b, n)      readsw((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/powerpc/mm/dma-noncoherent.c:12:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:640:
   arch/powerpc/include/asm/io-defs.h:47:1: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:637:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:188:1: note: expanded from here
   __do_insl
   ^
   arch/powerpc/include/asm/io.h:579:56: note: expanded from macro '__do_insl'
   #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/powerpc/mm/dma-noncoherent.c:12:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:640:
   arch/powerpc/include/asm/io-defs.h:49:1: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:637:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:190:1: note: expanded from here
   __do_outsb
   ^
   arch/powerpc/include/asm/io.h:580:58: note: expanded from macro '__do_outsb'
   #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/powerpc/mm/dma-noncoherent.c:12:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:640:
   arch/powerpc/include/asm/io-defs.h:51:1: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:637:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:192:1: note: expanded from here
   __do_outsw
   ^
   arch/powerpc/include/asm/io.h:581:58: note: expanded from macro '__do_outsw'
   #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/powerpc/mm/dma-noncoherent.c:12:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:640:
   arch/powerpc/include/asm/io-defs.h:53:1: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:637:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:194:1: note: expanded from here
   __do_outsl
   ^
   arch/powerpc/include/asm/io.h:582:58: note: expanded from macro '__do_outsl'
   #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
>> arch/powerpc/mm/dma-noncoherent.c:91:59: error: must use 'enum' tag to refer to type 'dma_cache_op'
   static void __dma_phys_op(phys_addr_t paddr, size_t size, dma_cache_op op)
                                                             ^
                                                             enum 
   arch/powerpc/mm/dma-noncoherent.c:107:10: error: use of undeclared identifier 'direction'
           switch (direction) {
                   ^
>> arch/powerpc/mm/dma-noncoherent.c:115:8: error: use of undeclared identifier 'start'; did you mean 'short'?
                   if ((start | end) & (L1_CACHE_BYTES - 1))
                        ^~~~~
                        short
   arch/powerpc/mm/dma-noncoherent.c:115:8: error: expected expression
   arch/powerpc/mm/dma-noncoherent.c:116:18: error: use of undeclared identifier 'start'
                           __dma_phys_op(start, end, DMA_CACHE_FLUSH);
                                         ^
>> arch/powerpc/mm/dma-noncoherent.c:116:25: error: use of undeclared identifier 'end'
                           __dma_phys_op(start, end, DMA_CACHE_FLUSH);
                                                ^
   arch/powerpc/mm/dma-noncoherent.c:118:18: error: use of undeclared identifier 'start'
                           __dma_phys_op(start, end, DMA_CACHE_INVAL);
                                         ^
   arch/powerpc/mm/dma-noncoherent.c:118:25: error: use of undeclared identifier 'end'
                           __dma_phys_op(start, end, DMA_CACHE_INVAL);
                                                ^
   arch/powerpc/mm/dma-noncoherent.c:121:17: error: use of undeclared identifier 'start'
                   __dma_phys_op(start, end, DMA_CACHE_CLEAN);
                                 ^
   arch/powerpc/mm/dma-noncoherent.c:121:24: error: use of undeclared identifier 'end'
                   __dma_phys_op(start, end, DMA_CACHE_CLEAN);
                                        ^
   arch/powerpc/mm/dma-noncoherent.c:124:17: error: use of undeclared identifier 'start'
                   __dma_phys_op(start, end, DMA_CACHE_FLUSH);
                                 ^
   arch/powerpc/mm/dma-noncoherent.c:124:24: error: use of undeclared identifier 'end'
                   __dma_phys_op(start, end, DMA_CACHE_FLUSH);
                                        ^
   arch/powerpc/mm/dma-noncoherent.c:132:10: error: use of undeclared identifier 'direction'
           switch (direction) {
                   ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +91 arch/powerpc/mm/dma-noncoherent.c

    86	
    87	/*
    88	 * __dma_phys_op makes memory consistent. identical to __dma_op, but
    89	 * takes a phys_addr_t instead of a virtual address
    90	 */
  > 91	static void __dma_phys_op(phys_addr_t paddr, size_t size, dma_cache_op op)
    92	{
    93		struct page *page = pfn_to_page(paddr >> PAGE_SHIFT);
    94		unsigned offset = paddr & ~PAGE_MASK;
    95	
    96	#ifdef CONFIG_HIGHMEM
    97		__dma_highmem_op(page, offset, size, op);
    98	#else
    99		unsigned long start = (unsigned long)page_address(page) + offset;
   100		__dma_op((void *)start, size, op);
   101	#endif
   102	}
   103	
   104	void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
   105			enum dma_data_direction dir)
   106	{
   107		switch (direction) {
   108		case DMA_NONE:
   109			BUG();
   110		case DMA_FROM_DEVICE:
   111			/*
   112			 * invalidate only when cache-line aligned otherwise there is
   113			 * the potential for discarding uncommitted data from the cache
   114			 */
 > 115			if ((start | end) & (L1_CACHE_BYTES - 1))
 > 116				__dma_phys_op(start, end, DMA_CACHE_FLUSH);
   117			else
   118				__dma_phys_op(start, end, DMA_CACHE_INVAL);
   119			break;
   120		case DMA_TO_DEVICE:		/* writeback only */
   121			__dma_phys_op(start, end, DMA_CACHE_CLEAN);
   122			break;
   123		case DMA_BIDIRECTIONAL:	/* writeback and invalidate */
   124			__dma_phys_op(start, end, DMA_CACHE_FLUSH);
   125			break;
   126		}
   127	}
   128	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
