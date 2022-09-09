Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F93A622
	for <llvm@lists.linux.dev>; Fri,  9 Sep 2022 02:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662690946; x=1694226946;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=U1hSfds/0CHqbUVcqtbT2D1gvOsodINiriQZ+MVT87w=;
  b=PWtwK3NgcxMg5wjPFucv906UnyEHWX1h+sAMG+eKyk2wUmxYoeunQI77
   bmxlOspd6gcjQsZIOnqbhX9QyZAbcSu4sfCD4LzIfZlEVNBpTFQNUVVIO
   69YUUM8JaEkGsfLGwYvNo0t/SjwjtOwj5Q9B7P23KGGGq4Sww0UDEZk6W
   jaiyhgQbkYz2eSFExRSfnO0wNRSr29Mi/dMZjOus8ft6bVusSrZCUH/KI
   BHrWRvZ/VZ9xgH6q3v8Tszzewh3qS+KHyxbfePE26CMyJwyx30xFa7D0E
   BHuVFfKXOaWKpHZFyLH4U+r02NZQ5KSTXZnICY2+fe5THHCcBO9LvjgZx
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="277111458"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; 
   d="scan'208";a="277111458"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2022 19:35:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; 
   d="scan'208";a="592436885"
Received: from lkp-server02.sh.intel.com (HELO b2938d2e5c5a) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 08 Sep 2022 19:35:43 -0700
Received: from kbuild by b2938d2e5c5a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oWTrq-0000bb-1n;
	Fri, 09 Sep 2022 02:35:42 +0000
Date: Fri, 9 Sep 2022 10:35:17 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v1 19/19] powerpc: Remove impossible mmu_psize_defs[] on
 nohash
Message-ID: <202209091055.Tq3tkK5a-lkp@intel.com>
References: <304d1442c5caa276c87c2caa615fcb6eed96c30c.1662658653.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <304d1442c5caa276c87c2caa615fcb6eed96c30c.1662658653.git.christophe.leroy@csgroup.eu>

Hi Christophe,

I love your patch! Yet something to improve:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/topic/ppc-kvm linus/master v6.0-rc4 next-20220908]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christophe-Leroy/powerpc-Kconfig-Fix-non-existing-CONFIG_PPC_FSL_BOOKE/20220909-014729
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: powerpc-fsp2_defconfig (https://download.01.org/0day-ci/archive/20220909/202209091055.Tq3tkK5a-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 1546df49f5a6d09df78f569e4137ddb365a3e827)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/452a31e5ede29b8b06cd0db37bf68959ce3d753a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Christophe-Leroy/powerpc-Kconfig-Fix-non-existing-CONFIG_PPC_FSL_BOOKE/20220909-014729
        git checkout 452a31e5ede29b8b06cd0db37bf68959ce3d753a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   __do_insb
   ^
   arch/powerpc/include/asm/io.h:577:56: note: expanded from macro '__do_insb'
   #define __do_insb(p, b, n)      readsb((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/powerpc/mm/nohash/tlb.c:29:
   In file included from include/linux/highmem.h:11:
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
   <scratch space>:224:1: note: expanded from here
   __do_insw
   ^
   arch/powerpc/include/asm/io.h:578:56: note: expanded from macro '__do_insw'
   #define __do_insw(p, b, n)      readsw((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/powerpc/mm/nohash/tlb.c:29:
   In file included from include/linux/highmem.h:11:
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
   <scratch space>:226:1: note: expanded from here
   __do_insl
   ^
   arch/powerpc/include/asm/io.h:579:56: note: expanded from macro '__do_insl'
   #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/powerpc/mm/nohash/tlb.c:29:
   In file included from include/linux/highmem.h:11:
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
   <scratch space>:228:1: note: expanded from here
   __do_outsb
   ^
   arch/powerpc/include/asm/io.h:580:58: note: expanded from macro '__do_outsb'
   #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/powerpc/mm/nohash/tlb.c:29:
   In file included from include/linux/highmem.h:11:
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
   <scratch space>:230:1: note: expanded from here
   __do_outsw
   ^
   arch/powerpc/include/asm/io.h:581:58: note: expanded from macro '__do_outsw'
   #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/powerpc/mm/nohash/tlb.c:29:
   In file included from include/linux/highmem.h:11:
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
   <scratch space>:232:1: note: expanded from here
   __do_outsl
   ^
   arch/powerpc/include/asm/io.h:582:58: note: expanded from macro '__do_outsl'
   #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
>> arch/powerpc/mm/nohash/tlb.c:104:9: error: use of undeclared identifier 'mmu_psize_defs'
           return mmu_psize_defs[psize].enc;
                  ^
>> arch/powerpc/mm/nohash/tlb.c:106:2: error: #else without #if
   #else
    ^
>> arch/powerpc/mm/nohash/tlb.c:107:19: error: redefinition of 'mmu_get_tsize'
   static inline int mmu_get_tsize(int psize)
                     ^
   arch/powerpc/mm/nohash/tlb.c:102:19: note: previous definition is here
   static inline int mmu_get_tsize(int psize)
                     ^
>> arch/powerpc/mm/nohash/tlb.c:112:2: error: #endif without #if
   #endif /* CONFIG_PPC_E500 */
    ^
   arch/powerpc/mm/nohash/tlb.c:315:13: error: no previous prototype for function 'early_init_mmu_47x' [-Werror,-Wmissing-prototypes]
   void __init early_init_mmu_47x(void)
               ^
   arch/powerpc/mm/nohash/tlb.c:315:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init early_init_mmu_47x(void)
   ^
   static 
   11 errors generated.


vim +/mmu_psize_defs +104 arch/powerpc/mm/nohash/tlb.c

41151e77a4d96e arch/powerpc/mm/tlb_nohash.c Becky Bruce            2011-06-28  101  
25d21ad6e799cc arch/powerpc/mm/tlb_nohash.c Benjamin Herrenschmidt 2009-07-23  102  static inline int mmu_get_tsize(int psize)
25d21ad6e799cc arch/powerpc/mm/tlb_nohash.c Benjamin Herrenschmidt 2009-07-23  103  {
25d21ad6e799cc arch/powerpc/mm/tlb_nohash.c Benjamin Herrenschmidt 2009-07-23 @104  	return mmu_psize_defs[psize].enc;
25d21ad6e799cc arch/powerpc/mm/tlb_nohash.c Benjamin Herrenschmidt 2009-07-23  105  }
25d21ad6e799cc arch/powerpc/mm/tlb_nohash.c Benjamin Herrenschmidt 2009-07-23 @106  #else
25d21ad6e799cc arch/powerpc/mm/tlb_nohash.c Benjamin Herrenschmidt 2009-07-23 @107  static inline int mmu_get_tsize(int psize)
25d21ad6e799cc arch/powerpc/mm/tlb_nohash.c Benjamin Herrenschmidt 2009-07-23  108  {
25d21ad6e799cc arch/powerpc/mm/tlb_nohash.c Benjamin Herrenschmidt 2009-07-23  109  	/* This isn't used on !Book3E for now */
25d21ad6e799cc arch/powerpc/mm/tlb_nohash.c Benjamin Herrenschmidt 2009-07-23  110  	return 0;
25d21ad6e799cc arch/powerpc/mm/tlb_nohash.c Benjamin Herrenschmidt 2009-07-23  111  }
823ee1119f6e4c arch/powerpc/mm/nohash/tlb.c Christophe Leroy       2022-09-08 @112  #endif /* CONFIG_PPC_E500 */
25d21ad6e799cc arch/powerpc/mm/tlb_nohash.c Benjamin Herrenschmidt 2009-07-23  113  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
