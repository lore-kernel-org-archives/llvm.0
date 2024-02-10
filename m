Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5FE23B9;
	Sat, 10 Feb 2024 03:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707534306; cv=none; b=eqZQ50iyPgVju+J/XCQidrM0Z19Z/Z6FsPXr00dvHBxdwlEsT/d4ed2C4KQyEqGpdIhDH0vu0Aq6+JuWYW6dmk44N3n25vkaTgfrN0jYnWpCNCdlaKBxcSHAZm3IkVVVY4pwLN8boW+29eAx85BWeiOr0SQQPikXus/NLdrunEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707534306; c=relaxed/simple;
	bh=Wp/c6MLnkyuLOrKc8Us59a9RMebO7T44GwPJbgIan+4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vFa0gRO+i17sm5MoPWtlx/c6Z4/FM3dkKgqQB6AzjOUIH3HxudXOM39h0VtwOt0ymeMiN22ZLJ2znz7ZTz/b6+5ieIpB881ePowbyZWCXZXWKYqZZcfRmquifctQzMHD/0p5hc6Sls86Nu/Hi1DpYiQGv3yAckGen3/Cw17Lt4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dxqo4XJT; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dxqo4XJT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707534304; x=1739070304;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wp/c6MLnkyuLOrKc8Us59a9RMebO7T44GwPJbgIan+4=;
  b=Dxqo4XJTL2JSUsTpE/MWpTlxgReNTPo6hzk11taC6/isJ31rzeVgQybO
   YhqW9N8o4AOdq+rTqpKpq89H+MC7K8bnWbLMqlt7XpSi76pYPqgbrT0dW
   bzQYzOvQs8gWPtesI27YAt6XZUCQfm3ekinm9l55jfHxVDww5z6XK2VHm
   35ygmWMm3H1U01owTSI7P7SXYxyZlzQVAgq8IrTYWA8FfCERekIah3TXw
   aIysy6Y0CfsihoDaq0VGBN30yE0s4zYZneScptgje8M902SxaKuRXexz6
   tdoSFEIW2Emv/ZI+vbcH9vEnCi42i8BzCPGNADjkaO8zZIE1fKL3VHwtv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="12181935"
X-IronPort-AV: E=Sophos;i="6.05,258,1701158400"; 
   d="scan'208";a="12181935"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 19:05:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,258,1701158400"; 
   d="scan'208";a="39541571"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 09 Feb 2024 19:04:59 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYdfl-0005IM-1L;
	Sat, 10 Feb 2024 03:04:57 +0000
Date: Sat, 10 Feb 2024 11:04:39 +0800
From: kernel test robot <lkp@intel.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Pavel Machek <pavel@denx.de>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [cip:linux-5.10.y-cip 43/56] drivers/cache/ax45mp_cache.c:141:6:
 warning: no previous prototype for function 'arch_sync_dma_for_device'
Message-ID: <202402101053.wMnRgYch-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-5.10.y-cip
head:   a624abaa85d7f3ff289eb2e257db5c4485d11d18
commit: 2656f92bc7dc5ac286595c8eac040828c2f180af [43/56] cache: ax45mp_cache: Add non coherent support
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240210/202402101053.wMnRgYch-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7dd790db8b77c4a833c06632e903dc4f13877a64)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240210/202402101053.wMnRgYch-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402101053.wMnRgYch-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/cache/ax45mp_cache.c:9:
   In file included from include/linux/of_address.h:7:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:80:
   include/asm-generic/io.h:464:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     464 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:477:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     477 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:36:59: note: expanded from macro '__le16_to_cpu'
      36 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/cache/ax45mp_cache.c:9:
   In file included from include/linux/of_address.h:7:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:80:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     490 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from macro '__le32_to_cpu'
      34 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/cache/ax45mp_cache.c:9:
   In file included from include/linux/of_address.h:7:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:80:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     501 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     511 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     521 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:609:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     609 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:617:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     617 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:625:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     625 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:634:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     634 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:643:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     643 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:652:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     652 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   drivers/cache/ax45mp_cache.c:70:3: error: implicit declaration of function 'csr_write' [-Werror,-Wimplicit-function-declaration]
      70 |                 csr_write(AX45MP_CCTL_REG_UCCTLBEGINADDR_NUM, start);
         |                 ^
>> drivers/cache/ax45mp_cache.c:141:6: warning: no previous prototype for function 'arch_sync_dma_for_device' [-Wmissing-prototypes]
     141 | void arch_sync_dma_for_device(phys_addr_t paddr,
         |      ^
   drivers/cache/ax45mp_cache.c:141:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     141 | void arch_sync_dma_for_device(phys_addr_t paddr,
         | ^
         | static 
>> drivers/cache/ax45mp_cache.c:165:6: warning: no previous prototype for function 'arch_sync_dma_for_cpu' [-Wmissing-prototypes]
     165 | void arch_sync_dma_for_cpu(phys_addr_t paddr,
         |      ^
   drivers/cache/ax45mp_cache.c:165:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     165 | void arch_sync_dma_for_cpu(phys_addr_t paddr,
         | ^
         | static 
>> drivers/cache/ax45mp_cache.c:183:6: warning: no previous prototype for function 'arch_setup_dma_ops' [-Wmissing-prototypes]
     183 | void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
         |      ^
   drivers/cache/ax45mp_cache.c:183:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     183 | void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
         | ^
         | static 
   15 warnings and 1 error generated.


vim +/arch_sync_dma_for_device +141 drivers/cache/ax45mp_cache.c

   140	
 > 141	void arch_sync_dma_for_device(phys_addr_t paddr,
   142				      size_t size, enum dma_data_direction dir)
   143	{
   144		switch (dir) {
   145		case DMA_TO_DEVICE:
   146			ax45mp_dma_cache_wback(paddr, size);
   147			break;
   148	
   149		case DMA_FROM_DEVICE:
   150			fallthrough;
   151	
   152		case DMA_BIDIRECTIONAL:
   153			/* Skip the invalidate here if it's done later */
   154			if (IS_ENABLED(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU))
   155				ax45mp_dma_cache_wback(paddr, size);
   156			else
   157				ax45mp_dma_cache_wback_inv(paddr, size);
   158			break;
   159	
   160		default:
   161			break;
   162		}
   163	}
   164	
 > 165	void arch_sync_dma_for_cpu(phys_addr_t paddr,
   166				   size_t size, enum dma_data_direction dir)
   167	{
   168		switch (dir) {
   169		case DMA_TO_DEVICE:
   170			break;
   171	
   172		case DMA_FROM_DEVICE:
   173		case DMA_BIDIRECTIONAL:
   174			/* FROM_DEVICE invalidate needed if speculative CPU prefetch only */
   175			ax45mp_dma_cache_inv(paddr, size);
   176			break;
   177	
   178		default:
   179			break;
   180		}
   181	}
   182	
 > 183	void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
   184				const struct iommu_ops *iommu, bool coherent)
   185	{
   186		dev->dma_coherent = coherent;
   187	}
   188	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
