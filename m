Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E272716408;
	Tue, 20 Jun 2023 22:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687299343; x=1718835343;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NA7DftGC9XFnIkHIH6XGKmuxsF8FZV+luD4GkWhFQCE=;
  b=FUZiaQmnjK2chpwLJ0RE4vPrIut44QscV2Xnv8kBi3KrGI4/t9QkTeeR
   wHZXocDhK7Uku7sR7pC+vf3GooORBQ7kbA2i43PK1oV2H+evUq/UA1We1
   3JPc/RV+joKGToTxi8wADa6tSbbiI4EngktKT/UdtfNq2V1xXAeSVOCvE
   tQMNq16kaS851QYzEjm2HcBDOOc0K2PZPnadLIJBv5tac7hz1U4Avsvm0
   5ZLimRQJVj8GAymWS3cEQHjxH5PoYJMAKpJ7ldgORaEHw88Ahv8RZAko2
   Ttfdyrq0Q6yrFkz82GiKwEU49An5OZ/qzvPxYU2mBZJlvVwxy8HMvdqIf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="362540001"
X-IronPort-AV: E=Sophos;i="6.00,258,1681196400"; 
   d="scan'208";a="362540001"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 15:15:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="838388045"
X-IronPort-AV: E=Sophos;i="6.00,258,1681196400"; 
   d="scan'208";a="838388045"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 20 Jun 2023 15:15:41 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBjdU-0006Hw-1s;
	Tue, 20 Jun 2023 22:15:40 +0000
Date: Wed, 21 Jun 2023 06:15:38 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [esmil:jh7100-dmapool 19/39] arch/hexagon/kernel/dma.c:19:27: error:
 use of undeclared identifier 'paddr'
Message-ID: <202306210649.a442doRp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux jh7100-dmapool
head:   41d6f3f3b3698aab55a40592597677c448a7093a
commit: 801f1883c4bb70cc8c7725b85e220adc36a77a94 [19/39] dma-mapping: replace custom code with generic implementation
config: hexagon-randconfig-r011-20230620 (https://download.01.org/0day-ci/archive/20230621/202306210649.a442doRp-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230621/202306210649.a442doRp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306210649.a442doRp-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/hexagon/kernel/dma.c:8:
   In file included from include/linux/dma-map-ops.h:9:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from arch/hexagon/kernel/dma.c:8:
   In file included from include/linux/dma-map-ops.h:9:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from arch/hexagon/kernel/dma.c:8:
   In file included from include/linux/dma-map-ops.h:9:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> arch/hexagon/kernel/dma.c:19:27: error: use of undeclared identifier 'paddr'
           hexagon_inv_dcache_range(paddr, paddr + size);
                                    ^
   arch/hexagon/kernel/dma.c:19:34: error: use of undeclared identifier 'paddr'
           hexagon_inv_dcache_range(paddr, paddr + size);
                                           ^
>> arch/hexagon/kernel/dma.c:24:2: error: call to undeclared function 'hexagon_flush_dcache_range'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           hexagon_flush_dcache_range(paddr, paddr + size);
           ^
   arch/hexagon/kernel/dma.c:24:2: note: did you mean 'hexagon_clean_dcache_range'?
   arch/hexagon/include/asm/cacheflush.h:75:13: note: 'hexagon_clean_dcache_range' declared here
   extern void hexagon_clean_dcache_range(unsigned long start, unsigned long end);
               ^
   arch/hexagon/kernel/dma.c:24:29: error: use of undeclared identifier 'paddr'
           hexagon_flush_dcache_range(paddr, paddr + size);
                                      ^
   arch/hexagon/kernel/dma.c:24:36: error: use of undeclared identifier 'paddr'
           hexagon_flush_dcache_range(paddr, paddr + size);
                                             ^
   6 warnings and 5 errors generated.


vim +/paddr +19 arch/hexagon/kernel/dma.c

    16	
    17	static inline void arch_dma_cache_inv(phys_addr_t start, size_t size)
    18	{
  > 19		hexagon_inv_dcache_range(paddr, paddr + size);
    20	}
    21	
    22	static inline void arch_dma_cache_wback_inv(phys_addr_t start, size_t size)
    23	{
  > 24		hexagon_flush_dcache_range(paddr, paddr + size);
    25	}
    26	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
