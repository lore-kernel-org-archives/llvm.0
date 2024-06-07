Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF7315530A;
	Fri,  7 Jun 2024 21:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717795188; cv=none; b=AgHN6r1GzUpCKn0SiA28hdubiIVHEu+JBJsb/CLT1Ewp9cMlFuBrsWUe+RRx1/+++cAz4y/Bh2CDQHv2QAHizIgZM5nr3+Hww4rriBF8MAJcj81d2jHwN7J2cgimRaRrqB6bkNgkJdMSfIigmRP/4tdmtKpt1AIvoJZ2l9nY+88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717795188; c=relaxed/simple;
	bh=s2aI44wVd1CJDWkqcDTUmApPXxyk0qEpOWi1AdNmrA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uCIWZzqVotXdptVJ3NrOZWMNAfQExEQ176VYUeRYmlmG/O9e5ManJJMgp/tH+jhm4Q8gi5wOAFsjWO633/lrvcHWo//SmV82SvGSks4aYq9nJ+NPtU87oPm8B/baMEkvTQa6VCssKcFUqiFgXKVduziT7CJzdgCLNJ8yfcT2CKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jlJAds6y; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jlJAds6y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717795187; x=1749331187;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=s2aI44wVd1CJDWkqcDTUmApPXxyk0qEpOWi1AdNmrA8=;
  b=jlJAds6yOiSgMXzp80NSZrTuzaSTrokOgO+B77BI6l4LTt9InzpwC4xf
   SiNADiRIIAgpJoVJuCjhswfg565T3aWK0LelwLi3gJ3SxRMZKvkeyTuVt
   6633iGAIBCE5TUkxPbe7Ogu4KuzuuS9cfX2EDlhLQwRQGkgk6YECZ5oyU
   kCo12hZbxTv88wXgr5h2cOwScl0JikGdM/UHyOp0xHnfP3dLW8Of4Pet4
   8QxDwULRGgoEGt9uOE0S/09j2n1aiDjaXYJmRTTdkbxPg3o72c1CrQSEk
   bdTAaV0Zhb8Qc0PYAHkN90F7k8kNWr9sGAf5MmRB717ycUajK5IQug+W+
   A==;
X-CSE-ConnectionGUID: SwgandONTLimCuuY0yf6qw==
X-CSE-MsgGUID: JynR74YCSGy3SRKHxE60HA==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25938667"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="25938667"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 14:19:45 -0700
X-CSE-ConnectionGUID: tpwul/+WTp6YXJDTUVkS+Q==
X-CSE-MsgGUID: juTZVeT8Q2CreAhrn+lrNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="69621041"
Received: from lkp-server01.sh.intel.com (HELO 472b94a103a1) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 Jun 2024 14:19:43 -0700
Received: from kbuild by 472b94a103a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFgzt-0000Y6-1g;
	Fri, 07 Jun 2024 21:19:41 +0000
Date: Sat, 8 Jun 2024 05:19:36 +0800
From: kernel test robot <lkp@intel.com>
To: mhkelley58@gmail.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 1/1] swiotlb: Reduce calls to swiotlb_find_pool()
Message-ID: <202406080445.0MtAsiAU-lkp@intel.com>
References: <20240607031421.182589-1-mhklinux@outlook.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240607031421.182589-1-mhklinux@outlook.com>

Hi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on joro-iommu/next]
[also build test ERROR on linus/master v6.10-rc2 next-20240607]
[cannot apply to xen-tip/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/mhkelley58-gmail-com/swiotlb-Reduce-calls-to-swiotlb_find_pool/20240607-114732
base:   https://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git next
patch link:    https://lore.kernel.org/r/20240607031421.182589-1-mhklinux%40outlook.com
patch subject: [RFC 1/1] swiotlb: Reduce calls to swiotlb_find_pool()
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240608/202406080445.0MtAsiAU-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240608/202406080445.0MtAsiAU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406080445.0MtAsiAU-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/dma/mapping.c:8:
   In file included from include/linux/memblock.h:12:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from kernel/dma/mapping.c:8:
   In file included from include/linux/memblock.h:13:
   In file included from arch/hexagon/include/asm/dma.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from kernel/dma/mapping.c:8:
   In file included from include/linux/memblock.h:13:
   In file included from arch/hexagon/include/asm/dma.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from kernel/dma/mapping.c:8:
   In file included from include/linux/memblock.h:13:
   In file included from arch/hexagon/include/asm/dma.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from kernel/dma/mapping.c:18:
>> kernel/dma/direct.h:64:3: error: call to undeclared function 'swiotlb_sync_single_for_device'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      64 |                 swiotlb_sync_single_for_device(dev, paddr, size, dir, pool);
         |                 ^
>> kernel/dma/direct.h:83:3: error: call to undeclared function 'swiotlb_sync_single_for_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      83 |                 swiotlb_sync_single_for_cpu(dev, paddr, size, dir, pool);
         |                 ^
>> kernel/dma/direct.h:99:10: error: call to undeclared function 'swiotlb_map'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      99 |                 return swiotlb_map(dev, phys, size, dir, attrs);
         |                        ^
   kernel/dma/direct.h:107:11: error: call to undeclared function 'swiotlb_map'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     107 |                         return swiotlb_map(dev, phys, size, dir, attrs);
         |                                ^
>> kernel/dma/direct.h:131:3: error: call to undeclared function 'swiotlb_tbl_unmap_single'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     131 |                 swiotlb_tbl_unmap_single(dev, phys, size, dir,
         |                 ^
   7 warnings and 5 errors generated.
--
   In file included from kernel/dma/direct.c:7:
   In file included from include/linux/memblock.h:12:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from kernel/dma/direct.c:7:
   In file included from include/linux/memblock.h:13:
   In file included from arch/hexagon/include/asm/dma.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from kernel/dma/direct.c:7:
   In file included from include/linux/memblock.h:13:
   In file included from arch/hexagon/include/asm/dma.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from kernel/dma/direct.c:7:
   In file included from include/linux/memblock.h:13:
   In file included from arch/hexagon/include/asm/dma.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from kernel/dma/direct.c:16:
>> kernel/dma/direct.h:64:3: error: call to undeclared function 'swiotlb_sync_single_for_device'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      64 |                 swiotlb_sync_single_for_device(dev, paddr, size, dir, pool);
         |                 ^
>> kernel/dma/direct.h:83:3: error: call to undeclared function 'swiotlb_sync_single_for_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      83 |                 swiotlb_sync_single_for_cpu(dev, paddr, size, dir, pool);
         |                 ^
>> kernel/dma/direct.h:99:10: error: call to undeclared function 'swiotlb_map'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      99 |                 return swiotlb_map(dev, phys, size, dir, attrs);
         |                        ^
   kernel/dma/direct.h:107:11: error: call to undeclared function 'swiotlb_map'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     107 |                         return swiotlb_map(dev, phys, size, dir, attrs);
         |                                ^
>> kernel/dma/direct.h:131:3: error: call to undeclared function 'swiotlb_tbl_unmap_single'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     131 |                 swiotlb_tbl_unmap_single(dev, phys, size, dir,
         |                 ^
   kernel/dma/direct.c:147:20: warning: shift count >= width of type [-Wshift-count-overflow]
     147 |                     phys_limit < DMA_BIT_MASK(64) &&
         |                                  ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
      77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
>> kernel/dma/direct.c:410:4: error: call to undeclared function 'swiotlb_sync_single_for_device'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     410 |                         swiotlb_sync_single_for_device(dev, paddr, sg->length,
         |                         ^
   8 warnings and 6 errors generated.


vim +/swiotlb_sync_single_for_device +64 kernel/dma/direct.h

    55	
    56	static inline void dma_direct_sync_single_for_device(struct device *dev,
    57			dma_addr_t addr, size_t size, enum dma_data_direction dir)
    58	{
    59		phys_addr_t paddr = dma_to_phys(dev, addr);
    60		struct io_tlb_pool *pool;
    61	
    62		pool = is_swiotlb_buffer(dev, paddr);
    63		if (unlikely(pool))
  > 64			swiotlb_sync_single_for_device(dev, paddr, size, dir, pool);
    65	
    66		if (!dev_is_dma_coherent(dev))
    67			arch_sync_dma_for_device(paddr, size, dir);
    68	}
    69	
    70	static inline void dma_direct_sync_single_for_cpu(struct device *dev,
    71			dma_addr_t addr, size_t size, enum dma_data_direction dir)
    72	{
    73		phys_addr_t paddr = dma_to_phys(dev, addr);
    74		struct io_tlb_pool *pool;
    75	
    76		if (!dev_is_dma_coherent(dev)) {
    77			arch_sync_dma_for_cpu(paddr, size, dir);
    78			arch_sync_dma_for_cpu_all();
    79		}
    80	
    81		pool = is_swiotlb_buffer(dev, paddr);
    82		if (unlikely(pool))
  > 83			swiotlb_sync_single_for_cpu(dev, paddr, size, dir, pool);
    84	
    85		if (dir == DMA_FROM_DEVICE)
    86			arch_dma_mark_clean(paddr, size);
    87	}
    88	
    89	static inline dma_addr_t dma_direct_map_page(struct device *dev,
    90			struct page *page, unsigned long offset, size_t size,
    91			enum dma_data_direction dir, unsigned long attrs)
    92	{
    93		phys_addr_t phys = page_to_phys(page) + offset;
    94		dma_addr_t dma_addr = phys_to_dma(dev, phys);
    95	
    96		if (is_swiotlb_force_bounce(dev)) {
    97			if (is_pci_p2pdma_page(page))
    98				return DMA_MAPPING_ERROR;
  > 99			return swiotlb_map(dev, phys, size, dir, attrs);
   100		}
   101	
   102		if (unlikely(!dma_capable(dev, dma_addr, size, true)) ||
   103		    dma_kmalloc_needs_bounce(dev, size, dir)) {
   104			if (is_pci_p2pdma_page(page))
   105				return DMA_MAPPING_ERROR;
   106			if (is_swiotlb_active(dev))
   107				return swiotlb_map(dev, phys, size, dir, attrs);
   108	
   109			dev_WARN_ONCE(dev, 1,
   110				     "DMA addr %pad+%zu overflow (mask %llx, bus limit %llx).\n",
   111				     &dma_addr, size, *dev->dma_mask, dev->bus_dma_limit);
   112			return DMA_MAPPING_ERROR;
   113		}
   114	
   115		if (!dev_is_dma_coherent(dev) && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
   116			arch_sync_dma_for_device(phys, size, dir);
   117		return dma_addr;
   118	}
   119	
   120	static inline void dma_direct_unmap_page(struct device *dev, dma_addr_t addr,
   121			size_t size, enum dma_data_direction dir, unsigned long attrs)
   122	{
   123		phys_addr_t phys = dma_to_phys(dev, addr);
   124		struct io_tlb_pool *pool;
   125	
   126		if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC))
   127			dma_direct_sync_single_for_cpu(dev, addr, size, dir);
   128	
   129		pool = is_swiotlb_buffer(dev, phys);
   130		if (unlikely(pool))
 > 131			swiotlb_tbl_unmap_single(dev, phys, size, dir,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
