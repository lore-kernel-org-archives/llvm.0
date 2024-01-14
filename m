Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C7B20EB;
	Sun, 14 Jan 2024 12:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Aa1eFj45"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705234821; x=1736770821;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SHbITFGvcDSL+7IKqurrJohLwhzcp59/WyW/CVRvhA8=;
  b=Aa1eFj45aol6tobC6fTHkQIZ0UObEmDco3e6Z6ydkoJgaDvj6GgrPSHc
   QNe9Ba4LwH6XAvsOE9Og3yMb75aXbgnNlueSBvyqm7P6nrUQowehlwWrI
   6vC2RPvqeyVUMVJgZEpDvS91G4Hv0uoLGkgHkkQKM4CPPO7rKhYvLSkfI
   ybN3TouZm/+k+HZeLLOiAo379G4OzmgQtj7hrwHUYC8lsZxlcdx+UH6t8
   giknPlV5JjmcGVMRvmwXpFdezQHlT43BqhUEFy3IFfTzFi2P1bpVy/csW
   C4W0ufo7uz5e+nHMjosRwjzXt5SPn4ClXXioeD4fNraV9ql/HC4yz1KdV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="463739813"
X-IronPort-AV: E=Sophos;i="6.04,194,1695711600"; 
   d="scan'208";a="463739813"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2024 04:20:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,194,1695711600"; 
   d="scan'208";a="31869960"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 14 Jan 2024 04:20:18 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOzTL-000BUW-2L;
	Sun, 14 Jan 2024 12:20:15 +0000
Date: Sun, 14 Jan 2024 20:20:04 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [alobakin:idpf-libie 11/51] include/net/page_pool/helpers.h:416:2:
 error: call to undeclared function 'dma_check_sync'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202401142006.nfdPD6zi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux idpf-libie
head:   29cca1ea6c555a8b97694e38f18926da7969dcfe
commit: 366859db976ac1f430583a7ce8a1c4e9e63d589f [11/51] page_pool: add DMA-sync-for-CPU inline helper
config: um-randconfig-001-20240114 (https://download.01.org/0day-ci/archive/20240114/202401142006.nfdPD6zi-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 9bde5becb44ea071f5e1fa1f5d4071dc8788b18c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240114/202401142006.nfdPD6zi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401142006.nfdPD6zi-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/core/skbuff.c:41:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from net/core/skbuff.c:41:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from net/core/skbuff.c:41:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   In file included from net/core/skbuff.c:43:
   In file included from include/linux/inet.h:42:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   include/linux/dma-mapping.h:389:2: error: call to undeclared function '__dma_sync_single_for_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     389 |         __dma_sync_single_for_cpu(dev, addr + offset, size, dir);
         |         ^
   include/linux/dma-mapping.h:389:2: note: did you mean 'dma_sync_single_for_cpu'?
   include/linux/dma-mapping.h:235:20: note: 'dma_sync_single_for_cpu' declared here
     235 | static inline void dma_sync_single_for_cpu(struct device *dev, dma_addr_t addr,
         |                    ^
   include/linux/dma-mapping.h:397:2: error: call to undeclared function '__dma_sync_single_for_device'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     397 |         __dma_sync_single_for_device(dev, addr + offset, size, dir);
         |         ^
   include/linux/dma-mapping.h:397:2: note: did you mean 'dma_sync_single_for_device'?
   include/linux/dma-mapping.h:239:20: note: 'dma_sync_single_for_device' declared here
     239 | static inline void dma_sync_single_for_device(struct device *dev,
         |                    ^
   In file included from net/core/skbuff.c:77:
>> include/net/page_pool/helpers.h:416:2: error: call to undeclared function 'dma_check_sync'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     416 |         dma_sync_single_range_for_cpu(pool->p.dev,
         |         ^
   include/linux/dma-mapping.h:401:2: note: expanded from macro 'dma_sync_single_range_for_cpu'
     401 |         dma_check_sync(__dma_sync_single_range_for_cpu, d, a, o, s, r)
         |         ^
   12 warnings and 3 errors generated.


vim +/dma_check_sync +416 include/net/page_pool/helpers.h

   399	
   400	/**
   401	 * page_pool_dma_sync_for_cpu - sync Rx page for CPU after it's written by HW
   402	 * @pool: &page_pool the @page belongs to
   403	 * @page: page to sync
   404	 * @offset: offset from page start to "hard" start if using PP frags
   405	 * @dma_sync_size: size of the data written to the page
   406	 *
   407	 * Can be used as a shorthand to sync Rx pages before accessing them in the
   408	 * driver. Caller must ensure the pool was created with ``PP_FLAG_DMA_MAP``.
   409	 * Note that this version performs DMA sync unconditionally, even if the
   410	 * associated PP doesn't perform sync-for-device.
   411	 */
   412	static inline void page_pool_dma_sync_for_cpu(const struct page_pool *pool,
   413						      const struct page *page,
   414						      u32 offset, u32 dma_sync_size)
   415	{
 > 416		dma_sync_single_range_for_cpu(pool->p.dev,
   417					      page_pool_get_dma_addr(page),
   418					      offset + pool->p.offset, dma_sync_size,
   419					      page_pool_get_dma_dir(pool));
   420	}
   421	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
