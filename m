Received: from mgamail.intel.com (unknown [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5554C10946;
	Thu, 27 Jul 2023 08:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690445533; x=1721981533;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7pp6T/77kywCBngbY/3TOicHmUuENooeVcc07EjxAaA=;
  b=g4wJA9Q2xxGURtSrxEwCNyoRpGXFUky+wPs1nfamHpMbmh3sBfQiYQyt
   kezJTdS1P2jwME3/RBZ4Gm8wSd6aQHAt3LZrk+wjcZzDE5nsRrtVK5swy
   1h4ZkCk57fiamNOJr9ZNdzGyC6XsfM07Y7pjNGrIHBVLedf9O+6kM6Em1
   KAFijgUW8TFP6dXp4hLI3ak0osEIpbDkzcYe9MbDI2jZA2L7O15JtckJp
   2qhu/XSpkbtNr8Cb/Unnc5T0erHCzDiG3T/jZv1kHf9gXDf/oeiynBMHW
   xPbKEbr+e2Oeap/1fEXOqGXHFCcVa5o1gtW0blalS9bNN1A0b2AppEYZJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="348522469"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="348522469"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 01:11:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="726850167"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="726850167"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 27 Jul 2023 01:11:43 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOw5Y-00024r-12;
	Thu, 27 Jul 2023 08:11:22 +0000
Date: Thu, 27 Jul 2023 16:05:50 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>
Subject: arch/powerpc/mm/book3s64/pgtable.c:422:6: warning: no previous
 prototype for function 'arch_report_meminfo'
Message-ID: <202307271640.lJoABLx9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0a8db05b571ad5b8d5c8774a004c0424260a90bd
commit: ef104443bffa004f631729dfc924f0b84abbd602 procfs: consolidate arch_report_meminfo declaration
date:   2 months ago
config: powerpc-microwatt_defconfig (https://download.01.org/0day-ci/archive/20230727/202307271640.lJoABLx9-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230727/202307271640.lJoABLx9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307271640.lJoABLx9-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     674 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:155:1: note: expanded from here
     155 | __do_insb
         | ^
   arch/powerpc/include/asm/io.h:614:56: note: expanded from macro '__do_insb'
     614 | #define __do_insb(p, b, n)      readsb((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
         |                                        ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/powerpc/mm/book3s64/pgtable.c:8:
   In file included from include/linux/memblock.h:13:
   In file included from arch/powerpc/include/asm/dma.h:22:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:45:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      45 | DEF_PCI_AC_NORET(insw, (unsigned long p, void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      46 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     674 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:157:1: note: expanded from here
     157 | __do_insw
         | ^
   arch/powerpc/include/asm/io.h:615:56: note: expanded from macro '__do_insw'
     615 | #define __do_insw(p, b, n)      readsw((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
         |                                        ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/powerpc/mm/book3s64/pgtable.c:8:
   In file included from include/linux/memblock.h:13:
   In file included from arch/powerpc/include/asm/dma.h:22:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:47:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      47 | DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      48 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     674 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:159:1: note: expanded from here
     159 | __do_insl
         | ^
   arch/powerpc/include/asm/io.h:616:56: note: expanded from macro '__do_insl'
     616 | #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
         |                                        ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/powerpc/mm/book3s64/pgtable.c:8:
   In file included from include/linux/memblock.h:13:
   In file included from arch/powerpc/include/asm/dma.h:22:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:49:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      49 | DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      50 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     674 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:161:1: note: expanded from here
     161 | __do_outsb
         | ^
   arch/powerpc/include/asm/io.h:617:58: note: expanded from macro '__do_outsb'
     617 | #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
         |                                         ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/powerpc/mm/book3s64/pgtable.c:8:
   In file included from include/linux/memblock.h:13:
   In file included from arch/powerpc/include/asm/dma.h:22:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:51:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      51 | DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      52 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     674 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:163:1: note: expanded from here
     163 | __do_outsw
         | ^
   arch/powerpc/include/asm/io.h:618:58: note: expanded from macro '__do_outsw'
     618 | #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
         |                                         ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/powerpc/mm/book3s64/pgtable.c:8:
   In file included from include/linux/memblock.h:13:
   In file included from arch/powerpc/include/asm/dma.h:22:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:53:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      53 | DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      54 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     674 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:165:1: note: expanded from here
     165 | __do_outsl
         | ^
   arch/powerpc/include/asm/io.h:619:58: note: expanded from macro '__do_outsl'
     619 | #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
         |                                         ~~~~~~~~~~~~~~~~~~~~~^
>> arch/powerpc/mm/book3s64/pgtable.c:422:6: warning: no previous prototype for function 'arch_report_meminfo' [-Wmissing-prototypes]
     422 | void arch_report_meminfo(struct seq_file *m)
         |      ^
   arch/powerpc/mm/book3s64/pgtable.c:422:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     422 | void arch_report_meminfo(struct seq_file *m)
         | ^
         | static 
   arch/powerpc/mm/book3s64/pgtable.c:478:5: warning: no previous prototype for function 'pmd_move_must_withdraw' [-Wmissing-prototypes]
     478 | int pmd_move_must_withdraw(struct spinlock *new_pmd_ptl,
         |     ^
   arch/powerpc/mm/book3s64/pgtable.c:478:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     478 | int pmd_move_must_withdraw(struct spinlock *new_pmd_ptl,
         | ^
         | static 
   14 warnings generated.


vim +/arch_report_meminfo +422 arch/powerpc/mm/book3s64/pgtable.c

a2dc009afa9ae8 arch/powerpc/mm/pgtable-book3s64.c Aneesh Kumar K.V 2018-08-13  421  
a2dc009afa9ae8 arch/powerpc/mm/pgtable-book3s64.c Aneesh Kumar K.V 2018-08-13 @422  void arch_report_meminfo(struct seq_file *m)
a2dc009afa9ae8 arch/powerpc/mm/pgtable-book3s64.c Aneesh Kumar K.V 2018-08-13  423  {
a2dc009afa9ae8 arch/powerpc/mm/pgtable-book3s64.c Aneesh Kumar K.V 2018-08-13  424  	/*
a2dc009afa9ae8 arch/powerpc/mm/pgtable-book3s64.c Aneesh Kumar K.V 2018-08-13  425  	 * Hash maps the memory with one size mmu_linear_psize.
a2dc009afa9ae8 arch/powerpc/mm/pgtable-book3s64.c Aneesh Kumar K.V 2018-08-13  426  	 * So don't bother to print these on hash
a2dc009afa9ae8 arch/powerpc/mm/pgtable-book3s64.c Aneesh Kumar K.V 2018-08-13  427  	 */
a2dc009afa9ae8 arch/powerpc/mm/pgtable-book3s64.c Aneesh Kumar K.V 2018-08-13  428  	if (!radix_enabled())
a2dc009afa9ae8 arch/powerpc/mm/pgtable-book3s64.c Aneesh Kumar K.V 2018-08-13  429  		return;
a2dc009afa9ae8 arch/powerpc/mm/pgtable-book3s64.c Aneesh Kumar K.V 2018-08-13  430  	seq_printf(m, "DirectMap4k:    %8lu kB\n",
a2dc009afa9ae8 arch/powerpc/mm/pgtable-book3s64.c Aneesh Kumar K.V 2018-08-13  431  		   atomic_long_read(&direct_pages_count[MMU_PAGE_4K]) << 2);
a2dc009afa9ae8 arch/powerpc/mm/pgtable-book3s64.c Aneesh Kumar K.V 2018-08-13  432  	seq_printf(m, "DirectMap64k:    %8lu kB\n",
a2dc009afa9ae8 arch/powerpc/mm/pgtable-book3s64.c Aneesh Kumar K.V 2018-08-13  433  		   atomic_long_read(&direct_pages_count[MMU_PAGE_64K]) << 6);
a2dc009afa9ae8 arch/powerpc/mm/pgtable-book3s64.c Aneesh Kumar K.V 2018-08-13  434  	seq_printf(m, "DirectMap2M:    %8lu kB\n",
a2dc009afa9ae8 arch/powerpc/mm/pgtable-book3s64.c Aneesh Kumar K.V 2018-08-13  435  		   atomic_long_read(&direct_pages_count[MMU_PAGE_2M]) << 11);
a2dc009afa9ae8 arch/powerpc/mm/pgtable-book3s64.c Aneesh Kumar K.V 2018-08-13  436  	seq_printf(m, "DirectMap1G:    %8lu kB\n",
a2dc009afa9ae8 arch/powerpc/mm/pgtable-book3s64.c Aneesh Kumar K.V 2018-08-13  437  		   atomic_long_read(&direct_pages_count[MMU_PAGE_1G]) << 20);
a2dc009afa9ae8 arch/powerpc/mm/pgtable-book3s64.c Aneesh Kumar K.V 2018-08-13  438  }
a2dc009afa9ae8 arch/powerpc/mm/pgtable-book3s64.c Aneesh Kumar K.V 2018-08-13  439  #endif /* CONFIG_PROC_FS */
579b9239c1f386 arch/powerpc/mm/pgtable-book3s64.c Aneesh Kumar K.V 2019-01-23  440  

:::::: The code at line 422 was first introduced by commit
:::::: a2dc009afa9ae8b92305be7728676562a104cb40 powerpc/mm/book3s/radix: Add mapping statistics

:::::: TO: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
