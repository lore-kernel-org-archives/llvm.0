Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5A61E2858;
	Wed,  7 May 2025 05:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746596994; cv=none; b=Kh/hK3EO50xDffgXgbjPt56wXwUbLMfpXK7riTGMX0c5V5XgtSTu779WSDaN4qtf6O7j46lX4bOkoBaUHlpGpGzm4chq+UR6dmMOJF/iHIikAgI63ZqDPkcq1m2OobSURnDVLK9RNUO970yOQZGyZKtJVE6Bmjj/ES3Vt/S76Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746596994; c=relaxed/simple;
	bh=fyNjLH30/VVg++4MZ+U6QT+Rw9l1gOvWyMZn1HsRfU4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SR4nm508WPBVz2biLGQ+9AthXKvsYUpK0fDK1a3gejVnTsbtmq3v5hiij8NsuCuJ0Kug1JXLFj5omkQQUoWMfmyKqAdFi/6M4UANmINh9LTESE6nl4/pGJv3Exlwff7s7PencVZcA6hqiDAtUdlvIJhvNExFk72+g+ehQRB0/wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WZ6WH0oM; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WZ6WH0oM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746596990; x=1778132990;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fyNjLH30/VVg++4MZ+U6QT+Rw9l1gOvWyMZn1HsRfU4=;
  b=WZ6WH0oMN+FXPrCy5H0CbcKmJKwEoKkjI2ZirxL2LmNAbL2iK+j5MKGH
   r5AR0V9zw18Ir+7p+qEd0tqyQYwelG+5aWNoSbj3/kFC7X0ymLdeOFVB8
   R3p8wHkom7L0wfrkvxNxY7gF5J81Mzd9ilfn9MxLaM/KGOO7dlwoO1lG5
   koanSAD1Fg9lcpaZaDVM8aKpLye4E7+cUR6egFXWzvSV80IUzqc2bdE2U
   F/SXxDcrt0PLSIzG63zsr3bw6venQ+sAAWyTMbujpe1JiQrDF2/TD0oPV
   wu2R8Lw8b1BYlHguDKABebmHyRkAKdvziA86WKWpkMd2fCJkcgJ11vS1h
   A==;
X-CSE-ConnectionGUID: f7nr7S5ARk2EjBm+R7I66Q==
X-CSE-MsgGUID: nbWpRFs1QxC9GFXV2LbTaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="58936907"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="58936907"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 22:49:50 -0700
X-CSE-ConnectionGUID: neAKTc/nTEOA3EfR+ovImA==
X-CSE-MsgGUID: 8IgeiwU9Q/KYETHYASAGzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="136368900"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 06 May 2025 22:49:48 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCXf8-00077f-2i;
	Wed, 07 May 2025 05:49:46 +0000
Date: Wed, 7 May 2025 13:49:27 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [kees:dev/v6.15-rc3+/cb-ptr 3/3] kernel/dma/swiotlb.c:639:20:
 warning: shift count >= width of type
Message-ID: <202505071332.v3AUBVsw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git dev/v6.15-rc3+/cb-ptr
head:   342a3b133d248d5a5f71587958eb26bea9901814
commit: 342a3b133d248d5a5f71587958eb26bea9901814 [3/3] [WIP] iov annotation
config: s390-randconfig-002-20250502 (https://download.01.org/0day-ci/archive/20250507/202505071332.v3AUBVsw-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071332.v3AUBVsw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071332.v3AUBVsw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:165:
   include/linux/compat.h:454:10: warning: array index 7 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:454:42: warning: array index 6 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                                                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:454:53: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                                                            ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/dma/swiotlb.c:27:
   In file included from include/linux/dma-direct.h:9:
   In file included from include/linux/dma-mapping.h:5:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:165:
   include/linux/compat.h:456:22: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                             ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/dma/swiotlb.c:27:
   In file included from include/linux/dma-direct.h:9:
   In file included from include/linux/dma-mapping.h:5:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:165:
   include/linux/compat.h:456:10: warning: array index 5 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:456:42: warning: array index 4 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                                                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:456:53: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                                                            ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/dma/swiotlb.c:27:
   In file included from include/linux/dma-direct.h:9:
   In file included from include/linux/dma-mapping.h:5:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:165:
   include/linux/compat.h:458:22: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     458 |         case 2: v.sig[3] = (set->sig[1] >> 32); v.sig[2] = set->sig[1];
         |                             ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/dma/swiotlb.c:27:
   In file included from include/linux/dma-direct.h:9:
   In file included from include/linux/dma-mapping.h:5:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:165:
   include/linux/compat.h:458:10: warning: array index 3 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     458 |         case 2: v.sig[3] = (set->sig[1] >> 32); v.sig[2] = set->sig[1];
         |                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:458:42: warning: array index 2 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     458 |         case 2: v.sig[3] = (set->sig[1] >> 32); v.sig[2] = set->sig[1];
         |                                                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:458:53: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     458 |         case 2: v.sig[3] = (set->sig[1] >> 32); v.sig[2] = set->sig[1];
         |                                                            ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
>> kernel/dma/swiotlb.c:639:20: warning: shift count >= width of type [-Wshift-count-overflow]
     638 |                 if (IS_ENABLED(CONFIG_ZONE_DMA32) &&
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     639 |                     phys_limit < DMA_BIT_MASK(64) &&
         |                     ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
     640 |                     !(gfp & (__GFP_DMA32 | __GFP_DMA)))
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:73:54: note: expanded from macro 'DMA_BIT_MASK'
      73 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:57:52: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
>> kernel/dma/swiotlb.c:639:20: warning: shift count >= width of type [-Wshift-count-overflow]
     638 |                 if (IS_ENABLED(CONFIG_ZONE_DMA32) &&
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     639 |                     phys_limit < DMA_BIT_MASK(64) &&
         |                     ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
     640 |                     !(gfp & (__GFP_DMA32 | __GFP_DMA)))
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:73:54: note: expanded from macro 'DMA_BIT_MASK'
      73 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:57:61: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
>> kernel/dma/swiotlb.c:639:20: warning: shift count >= width of type [-Wshift-count-overflow]
     638 |                 if (IS_ENABLED(CONFIG_ZONE_DMA32) &&
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     639 |                     phys_limit < DMA_BIT_MASK(64) &&
         |                     ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
     640 |                     !(gfp & (__GFP_DMA32 | __GFP_DMA)))
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:73:54: note: expanded from macro 'DMA_BIT_MASK'
      73 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:57:86: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                     ~~~~~~~~~~~~~~~~~^~~~~
   include/linux/compiler.h:68:3: note: expanded from macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   15 warnings and 2 errors generated.


vim +639 kernel/dma/swiotlb.c

79636caad3618e Petr Tesarik    2023-08-01  602  
79636caad3618e Petr Tesarik    2023-08-01  603  /**
79636caad3618e Petr Tesarik    2023-08-01  604   * swiotlb_alloc_tlb() - allocate a dynamic IO TLB buffer
79636caad3618e Petr Tesarik    2023-08-01  605   * @dev:	Device for which a memory pool is allocated.
79636caad3618e Petr Tesarik    2023-08-01  606   * @bytes:	Size of the buffer.
79636caad3618e Petr Tesarik    2023-08-01  607   * @phys_limit:	Maximum allowed physical address of the buffer.
79636caad3618e Petr Tesarik    2023-08-01  608   * @gfp:	GFP flags for the allocation.
79636caad3618e Petr Tesarik    2023-08-01  609   *
79636caad3618e Petr Tesarik    2023-08-01  610   * Return: Allocated pages, or %NULL on allocation failure.
79636caad3618e Petr Tesarik    2023-08-01  611   */
79636caad3618e Petr Tesarik    2023-08-01  612  static struct page *swiotlb_alloc_tlb(struct device *dev, size_t bytes,
79636caad3618e Petr Tesarik    2023-08-01  613  		u64 phys_limit, gfp_t gfp)
79636caad3618e Petr Tesarik    2023-08-01  614  {
79636caad3618e Petr Tesarik    2023-08-01  615  	struct page *page;
79636caad3618e Petr Tesarik    2023-08-01  616  
79636caad3618e Petr Tesarik    2023-08-01  617  	/*
79636caad3618e Petr Tesarik    2023-08-01  618  	 * Allocate from the atomic pools if memory is encrypted and
79636caad3618e Petr Tesarik    2023-08-01  619  	 * the allocation is atomic, because decrypting may block.
79636caad3618e Petr Tesarik    2023-08-01  620  	 */
79636caad3618e Petr Tesarik    2023-08-01  621  	if (!gfpflags_allow_blocking(gfp) && dev && force_dma_unencrypted(dev)) {
79636caad3618e Petr Tesarik    2023-08-01  622  		void *vaddr;
79636caad3618e Petr Tesarik    2023-08-01  623  
79636caad3618e Petr Tesarik    2023-08-01  624  		if (!IS_ENABLED(CONFIG_DMA_COHERENT_POOL))
79636caad3618e Petr Tesarik    2023-08-01  625  			return NULL;
79636caad3618e Petr Tesarik    2023-08-01  626  
79636caad3618e Petr Tesarik    2023-08-01  627  		return dma_alloc_from_pool(dev, bytes, &vaddr, gfp,
79636caad3618e Petr Tesarik    2023-08-01  628  					   dma_coherent_ok);
79636caad3618e Petr Tesarik    2023-08-01  629  	}
79636caad3618e Petr Tesarik    2023-08-01  630  
79636caad3618e Petr Tesarik    2023-08-01  631  	gfp &= ~GFP_ZONEMASK;
ba0fb44aed4769 Catalin Marinas 2024-08-11  632  	if (phys_limit <= zone_dma_limit)
79636caad3618e Petr Tesarik    2023-08-01  633  		gfp |= __GFP_DMA;
79636caad3618e Petr Tesarik    2023-08-01  634  	else if (phys_limit <= DMA_BIT_MASK(32))
79636caad3618e Petr Tesarik    2023-08-01  635  		gfp |= __GFP_DMA32;
79636caad3618e Petr Tesarik    2023-08-01  636  
a5e3b127455d07 Petr Tesarik    2023-11-02  637  	while (IS_ERR(page = alloc_dma_pages(gfp, bytes, phys_limit))) {
79636caad3618e Petr Tesarik    2023-08-01  638  		if (IS_ENABLED(CONFIG_ZONE_DMA32) &&
79636caad3618e Petr Tesarik    2023-08-01 @639  		    phys_limit < DMA_BIT_MASK(64) &&
79636caad3618e Petr Tesarik    2023-08-01  640  		    !(gfp & (__GFP_DMA32 | __GFP_DMA)))
79636caad3618e Petr Tesarik    2023-08-01  641  			gfp |= __GFP_DMA32;
79636caad3618e Petr Tesarik    2023-08-01  642  		else if (IS_ENABLED(CONFIG_ZONE_DMA) &&
79636caad3618e Petr Tesarik    2023-08-01  643  			 !(gfp & __GFP_DMA))
79636caad3618e Petr Tesarik    2023-08-01  644  			gfp = (gfp & ~__GFP_DMA32) | __GFP_DMA;
79636caad3618e Petr Tesarik    2023-08-01  645  		else
79636caad3618e Petr Tesarik    2023-08-01  646  			return NULL;
79636caad3618e Petr Tesarik    2023-08-01  647  	}
79636caad3618e Petr Tesarik    2023-08-01  648  
79636caad3618e Petr Tesarik    2023-08-01  649  	return page;
79636caad3618e Petr Tesarik    2023-08-01  650  }
79636caad3618e Petr Tesarik    2023-08-01  651  

:::::: The code at line 639 was first introduced by commit
:::::: 79636caad3618e2b38457f6e298c9b31ba82b489 swiotlb: if swiotlb is full, fall back to a transient memory pool

:::::: TO: Petr Tesarik <petr.tesarik.ext@huawei.com>
:::::: CC: Christoph Hellwig <hch@lst.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
