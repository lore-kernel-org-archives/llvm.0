Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8CB1C2D
	for <llvm@lists.linux.dev>; Sat,  6 Aug 2022 17:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659805505; x=1691341505;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qOI4ofz8SpEXhi/X1eBtnKtGxpMQiZF2DRWvhoMMWuU=;
  b=RuA/6yWrzFeWDH6LHX0w4/h8Cv9rkxReVnMcHc8erisbRkBnDWk9yiBZ
   pRR0P/yEwiJhr5FRB4T+Nlon7QT2EwFoqFloG54coWtly4+TJWchK9KCZ
   9G/MPXd+8ve3epIZ+bKdPWTw/ws/2ISxHgpmHVi0MrRxRNhI1fsyK7NZ/
   hfHcNCEyvAebZKjwEuTAv9BAa+NfKSogvzfP459jFycQVeuYkztkR0j2k
   aV7YIl0kFbBtZCHdHbf9SrO20yNGtP6Oj7UYXD9FTqPzc3j+LGli24HDp
   pR5AoMlIm/g6vGaeBBsErJV/zT7hEHLOLudvrPZplVNTcN1bnbvryp9B+
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10431"; a="291608221"
X-IronPort-AV: E=Sophos;i="5.93,217,1654585200"; 
   d="scan'208";a="291608221"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2022 10:05:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,217,1654585200"; 
   d="scan'208";a="632367541"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 06 Aug 2022 10:05:04 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oKNEV-000KXz-1q;
	Sat, 06 Aug 2022 17:05:03 +0000
Date: Sun, 7 Aug 2022 01:04:19 +0800
From: kernel test robot <lkp@intel.com>
To: lizhe.67@bytedance.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC] page_ext: move up page_ext_init() to catch early page
 allocation if DEFERRED_STRUCT_PAGE_INIT is n
Message-ID: <202208070052.YzUh9Au5-lkp@intel.com>
References: <20220804065515.85794-1-lizhe.67@bytedance.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220804065515.85794-1-lizhe.67@bytedance.com>

Hi,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v5.19 next-20220805]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/lizhe-67-bytedance-com/page_ext-move-up-page_ext_init-to-catch-early-page-allocation-if-DEFERRED_STRUCT_PAGE_INIT-is-n/20220804-145549
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
config: s390-randconfig-r044-20220804 (https://download.01.org/0day-ci/archive/20220807/202208070052.YzUh9Au5-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 26dd42705c2af0b8f6e5d6cdb32c9bd5ed9524eb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/af113104b15444bd5cc6dedfbd60530ff24c4c75
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review lizhe-67-bytedance-com/page_ext-move-up-page_ext_init-to-catch-early-page-allocation-if-DEFERRED_STRUCT_PAGE_INIT-is-n/20220804-145549
        git checkout af113104b15444bd5cc6dedfbd60530ff24c4c75
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from init/main.c:29:
   In file included from include/linux/memblock.h:13:
   In file included from arch/s390/include/asm/dma.h:5:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:464:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:477:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from init/main.c:29:
   In file included from include/linux/memblock.h:13:
   In file included from arch/s390/include/asm/dma.h:5:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from init/main.c:29:
   In file included from include/linux/memblock.h:13:
   In file included from arch/s390/include/asm/dma.h:5:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:609:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:617:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:625:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:634:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:643:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:652:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   init/main.c:772:20: warning: no previous prototype for function 'arch_post_acpi_subsys_init' [-Wmissing-prototypes]
   void __init __weak arch_post_acpi_subsys_init(void) { }
                      ^
   init/main.c:772:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init __weak arch_post_acpi_subsys_init(void) { }
   ^
   static 
   init/main.c:784:20: warning: no previous prototype for function 'mem_encrypt_init' [-Wmissing-prototypes]
   void __init __weak mem_encrypt_init(void) { }
                      ^
   init/main.c:784:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init __weak mem_encrypt_init(void) { }
   ^
   static 
   init/main.c:786:20: warning: no previous prototype for function 'poking_init' [-Wmissing-prototypes]
   void __init __weak poking_init(void) { }
                      ^
   init/main.c:786:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init __weak poking_init(void) { }
   ^
   static 
>> init/main.c:850:2: error: call to undeclared function 'page_ext_init_early'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           page_ext_init_early();
           ^
   init/main.c:850:2: note: did you mean 'page_ext_init_late'?
   include/linux/page_ext.h:103:20: note: 'page_ext_init_late' declared here
   static inline void page_ext_init_late(void)
                      ^
   15 warnings and 1 error generated.


vim +/page_ext_init_early +850 init/main.c

   827	
   828	/*
   829	 * Set up kernel memory allocators
   830	 */
   831	static void __init mm_init(void)
   832	{
   833		/*
   834		 * page_ext requires contiguous pages,
   835		 * bigger than MAX_ORDER unless SPARSEMEM.
   836		 */
   837		page_ext_init_flatmem();
   838		init_mem_debugging_and_hardening();
   839		kfence_alloc_pool();
   840		report_meminit();
   841		stack_depot_early_init();
   842		mem_init();
   843		mem_init_print_info();
   844		kmem_cache_init();
   845		/*
   846		 * page_owner must be initialized after buddy is ready, and also after
   847		 * slab is ready so that stack_depot_init() works properly
   848		 */
   849		page_ext_init_flatmem_late();
 > 850		page_ext_init_early();
   851		kmemleak_init();
   852		pgtable_init();
   853		debug_objects_mem_init();
   854		vmalloc_init();
   855		/* Should be run before the first non-init thread is created */
   856		init_espfix_bsp();
   857		/* Should be run after espfix64 is set up. */
   858		pti_init();
   859	}
   860	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
