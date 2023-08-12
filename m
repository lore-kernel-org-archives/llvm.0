Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A27D2F50;
	Sat, 12 Aug 2023 15:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691855359; x=1723391359;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tTABRcv81uFbmI35ADBvNrjhz262CVRsWM+2d4MdWG0=;
  b=b9U9w5RbK0PQjG/SgVumRfvQE4xxcY8wacXGsafINbO2xby7HhkDopXV
   Gm+Ud6K1Qf04OBQ1krGAPIUmcqH44VlFs2eqAl6Tn+w776tKxyCzW/dm4
   FVXYpHJfuRF2ksWDVBC23+++gWYpzzGb18y/QuftAenKTVaHw6+ayEZCC
   el0uTbrG8K0lak66JH/PLy3SSVAxhZFXQfW3SmrSEWWqyOhjwapLv3c95
   2XE1mMVr4PmX/f3PR+pMUxnVYe/Qh9vzvIAiutZcgvhrEdJdLJZMz2TMi
   IPYLHR2Z8GSVJcHTIAJiqsng4DTdz6Gy5qPz/HxJJv8bAJwaBFjh6t5Ul
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="458204647"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="458204647"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2023 08:49:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="979510165"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="979510165"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 12 Aug 2023 08:49:17 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUqrc-0008eO-1r;
	Sat, 12 Aug 2023 15:49:16 +0000
Date: Sat, 12 Aug 2023 23:48:29 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linyunsheng:net-next-pp_frag_v6 1/6]
 include/net/page_pool/helpers.h:85:21: error: call to undeclared function
 'dma_get_cache_alignment'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202308122347.fr2yxHcl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gestionlin/linux.git net-next-pp_frag_v6
head:   1cd274e52745845b2178cd8f8b6c35266778ff1b
commit: a687eb04bd354fbc130ad9a3170e59b425d496b6 [1/6] page_pool: frag API support for 32-bit arch with 64-bit DMA
config: hexagon-randconfig-r041-20230812 (https://download.01.org/0day-ci/archive/20230812/202308122347.fr2yxHcl-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308122347.fr2yxHcl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308122347.fr2yxHcl-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/core/page_pool.c:13:
>> include/net/page_pool/helpers.h:85:21: error: call to undeclared function 'dma_get_cache_alignment'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      85 |         size = ALIGN(size, dma_get_cache_alignment());
         |                            ^
   In file included from net/core/page_pool.c:14:
   In file included from include/net/xdp.h:10:
   In file included from include/linux/filter.h:9:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from net/core/page_pool.c:14:
   In file included from include/net/xdp.h:10:
   In file included from include/linux/filter.h:9:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from net/core/page_pool.c:14:
   In file included from include/net/xdp.h:10:
   In file included from include/linux/filter.h:9:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from net/core/page_pool.c:14:
   In file included from include/net/xdp.h:10:
   In file included from include/linux/filter.h:12:
   In file included from include/linux/skbuff.h:28:
   include/linux/dma-mapping.h:548:19: error: static declaration of 'dma_get_cache_alignment' follows non-static declaration
     548 | static inline int dma_get_cache_alignment(void)
         |                   ^
   include/net/page_pool/helpers.h:85:21: note: previous implicit declaration is here
      85 |         size = ALIGN(size, dma_get_cache_alignment());
         |                            ^
   net/core/page_pool.c:747:3: error: expected ')'
     747 |                 return NULL;
         |                 ^
   net/core/page_pool.c:746:5: note: to match this '('
     746 |         if (WARN_ON(!(pool->p.flags & PP_FLAG_PAGE_FRAG))
         |            ^
   6 warnings and 3 errors generated.


vim +/dma_get_cache_alignment +85 include/net/page_pool/helpers.h

    78	
    79	static inline struct page *page_pool_alloc_frag(struct page_pool *pool,
    80							unsigned int *offset,
    81							unsigned int size, gfp_t gfp)
    82	{
    83		unsigned int max_size = PAGE_SIZE << pool->p.order;
    84	
  > 85		size = ALIGN(size, dma_get_cache_alignment());
    86	
    87		if (WARN_ON(size > max_size))
    88			return NULL;
    89	
    90		/* Don't allow page splitting and allocate one big frag
    91		 * for 32-bit arch with 64-bit DMA, corresponding to
    92		 * the checking in page_pool_is_last_frag().
    93		 */
    94		if (PAGE_POOL_DMA_USE_PP_FRAG_COUNT) {
    95			*offset = 0;
    96			return page_pool_alloc_pages(pool, gfp);
    97		}
    98	
    99		return __page_pool_alloc_frag(pool, offset, size, gfp);
   100	}
   101	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
