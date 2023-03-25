Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4905123AE;
	Sat, 25 Mar 2023 11:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679744463; x=1711280463;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/K9U/cCG+6dKEeJAeto2ft6pKKfZLJIjB3KEBLNBz+g=;
  b=ZsAuvK3Z+FHnYEO/U8cwm/hb+jrfG7Qu8PnQwmOG8jTDKzz7Jw9ID+qE
   Vbpc6gwcP7W30+AgYW+poBCC7OqpnN05NJ6oklbRsV/Kkge7fdXnUDsZQ
   1+fYB0O27RKWqmpRo/bfnUsULCt3qav3psBDH2FDH5HCleMqy+zu5p3LD
   VbqBVbSNEEn9DRQaobD8Xgps+ZFxh2AHmg2c9AeMvwQnt6Akeu0XdjtUw
   3bGVLNR5oqKrbJN35r49s/rV6RNEqsOnDuar0SwHrbRUWp6kPmHv9lot6
   yuZ07gQTx0Zfv1Igcu18lEFFd3nroVssLTrIZqTeqvx2Nof6QexJlMmOX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="337464116"
X-IronPort-AV: E=Sophos;i="5.98,290,1673942400"; 
   d="scan'208";a="337464116"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2023 04:41:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="752182260"
X-IronPort-AV: E=Sophos;i="5.98,290,1673942400"; 
   d="scan'208";a="752182260"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 25 Mar 2023 04:41:01 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pg2Ga-000GFr-2L;
	Sat, 25 Mar 2023 11:41:00 +0000
Date: Sat, 25 Mar 2023 19:40:45 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arch@vger.kernel.org
Subject: [arnd-asm-generic:dma-sync-rework 22/22]
 arch/hexagon/kernel/dma.c:19:27: error: use of undeclared identifier 'paddr'
Message-ID: <202303251901.qwqJQ37X-lkp@intel.com>
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
commit: 985cd64f3b17b82468e68c6269e09a5556d3720e [22/22] dma-mapping: replace custom code with generic implementation
config: hexagon-randconfig-r003-20230322 (https://download.01.org/0day-ci/archive/20230325/202303251901.qwqJQ37X-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git/commit/?id=985cd64f3b17b82468e68c6269e09a5556d3720e
        git remote add arnd-asm-generic https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git
        git fetch --no-tags arnd-asm-generic dma-sync-rework
        git checkout 985cd64f3b17b82468e68c6269e09a5556d3720e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303251901.qwqJQ37X-lkp@intel.com/

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
>> arch/hexagon/kernel/dma.c:24:2: error: call to undeclared function 'hexagon_flush_dcache_range'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
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
https://github.com/intel/lkp-tests
