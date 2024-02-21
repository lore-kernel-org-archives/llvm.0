Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1388D82D9E;
	Wed, 21 Feb 2024 17:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708535497; cv=none; b=IY4B2yJ6mDPrwhFgpbT5EXHFAgfRn/vZ2zBGmzSgfbwK8z459fvqjNQNXGxt7Ms4Ipi49cMInDLC9PkPYKTBAjAqRDLGJh4fsSsAHpi83Yrtz+pReAkhWjOwUfBFu+sxHvsiSyD79G04Qbj/9ZZ/QvKxxftGh4e1wWaFxhbs2eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708535497; c=relaxed/simple;
	bh=uoBSPXOBAtKGd2ft9+rqc9sxOJIJ/lXmeHJWJyv5NxY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qwD2m/9VmCVY52dOfwZ5Erp3Wn0FMYZ4HU8+6sitU/REj6Y4xRyBj9cZoSBGJkkPQxTtm5tHuudjmHKUie4PJZOvrua73DZrGBt7dT4i2u3Ez5VS1Pmti7i+GA+SHOiL4yCF7LGU8lq8nAJxK3ssy92nATfUWpBvyV/z5zx1cUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kYHP90Px; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kYHP90Px"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708535495; x=1740071495;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uoBSPXOBAtKGd2ft9+rqc9sxOJIJ/lXmeHJWJyv5NxY=;
  b=kYHP90PxwJbfPWKC8rLheWQJqFGG1+f0ayofkm5nJQyi8JSCQHdpQJDV
   MYgcIWa/k2getJ6kVM76zOIaRqIFgX5CybGFK/7H5OshewcTfIBnZIHb2
   EtoniiH6I/4ffoxd6JzlfSpn07nm/ivfsBLzNCqc43JmXK/r2atzO0fhC
   B5UUvFZ/BHL/fBQbxx+4ZuQhrjs7rlxLkFb5aQGVzf0AUYMDurFu2sX+Q
   ojI1IfzT3MThBfJA7AC5KAV8kZgmdtVR5kSVQ9yZtAtqBsp72rW2f/MCD
   BamPeml4fAHKQZngT5ItOz3A2QIY2zsu7dFUKG8t5hT2OKONJWeAa+bqb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="13330063"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="13330063"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 09:11:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="36217977"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 21 Feb 2024 09:11:33 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rcq7r-0005X0-2w;
	Wed, 21 Feb 2024 17:11:22 +0000
Date: Thu, 22 Feb 2024 01:08:33 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [alobakin:idpf-libie 11/51] include/net/page_pool/helpers.h:416:2:
 error: call to undeclared function 'dma_check_sync'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202402220122.C8QLXl9Z-lkp@intel.com>
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
config: um-x86_64_defconfig (https://download.01.org/0day-ci/archive/20240222/202402220122.C8QLXl9Z-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240222/202402220122.C8QLXl9Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402220122.C8QLXl9Z-lkp@intel.com/

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
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from net/core/skbuff.c:41:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from net/core/skbuff.c:41:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   In file included from net/core/skbuff.c:43:
   In file included from include/linux/inet.h:42:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   include/linux/dma-mapping.h:389:2: error: call to undeclared function '__dma_sync_single_for_cpu'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           __dma_sync_single_for_cpu(dev, addr + offset, size, dir);
           ^
   include/linux/dma-mapping.h:389:2: note: did you mean 'dma_sync_single_for_cpu'?
   include/linux/dma-mapping.h:235:20: note: 'dma_sync_single_for_cpu' declared here
   static inline void dma_sync_single_for_cpu(struct device *dev, dma_addr_t addr,
                      ^
   include/linux/dma-mapping.h:397:2: error: call to undeclared function '__dma_sync_single_for_device'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           __dma_sync_single_for_device(dev, addr + offset, size, dir);
           ^
   include/linux/dma-mapping.h:397:2: note: did you mean 'dma_sync_single_for_device'?
   include/linux/dma-mapping.h:239:20: note: 'dma_sync_single_for_device' declared here
   static inline void dma_sync_single_for_device(struct device *dev,
                      ^
   In file included from net/core/skbuff.c:77:
>> include/net/page_pool/helpers.h:416:2: error: call to undeclared function 'dma_check_sync'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           dma_sync_single_range_for_cpu(pool->p.dev,
           ^
   include/linux/dma-mapping.h:401:2: note: expanded from macro 'dma_sync_single_range_for_cpu'
           dma_check_sync(__dma_sync_single_range_for_cpu, d, a, o, s, r)
           ^
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
