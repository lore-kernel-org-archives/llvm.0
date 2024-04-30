Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA55417BB15;
	Tue, 30 Apr 2024 17:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714497582; cv=none; b=u4jCTZDF7B4f+e9giT0YJOUbd6TcxJI+m+IGkrro3ANRTRbk8JHCCCHxH/Lo3OWiP6Pl8DtkIG5RKopYRI5TpN3QoEuOdyzY5FFySwrcm4UAuuCLK3RFhJ8iKoVY0PPKZrgEvYAAW21eZG0VpHBMNHKzoraezFf2ivENGch6KHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714497582; c=relaxed/simple;
	bh=pLJYAxE2tCilx3vouXxgv2mqEXTMWFnXn7gMl1H3HNA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HhgV6MHxgEuM9rRC3Z6bTcG68PBriKVTOg4GR/wXjIPJTiQn4R/KGjlJh0hEN+Ut+kkYt0+QKLdjXWbRmrEzwdUH3oJj/ZQUeqJvGeuQ76agAPPy+ttL2WD5zmy0LZ8cuceQNqx/lRnXd7pOcRAHG+2gRAoM1j+zuaOFJsxXd3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OT8jQolW; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OT8jQolW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714497581; x=1746033581;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pLJYAxE2tCilx3vouXxgv2mqEXTMWFnXn7gMl1H3HNA=;
  b=OT8jQolW2LGCWvKmfL/TLb26Zxb2nf1tMbPQ6QMRGvB5p0TmXyoBat73
   Wos/mR+0w8N5XqoeDA3e0bL8B7WJgE6RPIn/8NXPorfvhfxw9ytAJwnS7
   G9qLKa8bMBdyRzkHKV0/pGnCussjPPic786BIYpUlMoBC+ml+KHtgbruR
   RN0OxhoIs+KKDXbEh/6L3j8ENO8gl/D4eKJ8u+hv/fBLdtIogSMtl6z3o
   NCvQN+YGv13JpZXHX4diUspXMKEXleDQiaaPFG2+0UL2Dop7MSeSuAJFz
   qhhBhVL3KoAocgfti1QsxEcsU8+i0FYJldPIZK4e+GzaYrnjNZdYf4mN6
   A==;
X-CSE-ConnectionGUID: Ss+zfjMIR1qYz0u7251usQ==
X-CSE-MsgGUID: VrHmAmGWQAG6QkSdtG55DQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="21369968"
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; 
   d="scan'208";a="21369968"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2024 10:19:40 -0700
X-CSE-ConnectionGUID: JcxZT10RSzSVeJR3/hnjNg==
X-CSE-MsgGUID: ncEzuZAOQ1mEJHajPH2RJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; 
   d="scan'208";a="26398678"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 30 Apr 2024 10:19:39 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1r8i-0008Q3-2O;
	Tue, 30 Apr 2024 17:19:36 +0000
Date: Wed, 1 May 2024 01:19:21 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:dma-split-v1 2/17] kernel/dma/mapping.c:877:6: error:
 call to undeclared function 'cc_platform_has'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202405010138.I3vo5Tp1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dma-split-v1
head:   b66ed91ccee0e8e645a07f54f0e39fe9ff4f03c9
commit: 0fb1156cba1b25b894e5374c15c3a4f81002c77b [2/17] dma-mapping: query DMA memory type
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20240501/202405010138.I3vo5Tp1-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240501/202405010138.I3vo5Tp1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405010138.I3vo5Tp1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/dma/mapping.c:8:
   In file included from include/linux/memblock.h:12:
   In file included from include/linux/mm.h:2210:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from kernel/dma/mapping.c:8:
   In file included from include/linux/memblock.h:13:
   In file included from arch/s390/include/asm/dma.h:5:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from kernel/dma/mapping.c:8:
   In file included from include/linux/memblock.h:13:
   In file included from arch/s390/include/asm/dma.h:5:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from kernel/dma/mapping.c:8:
   In file included from include/linux/memblock.h:13:
   In file included from arch/s390/include/asm/dma.h:5:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
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
>> kernel/dma/mapping.c:877:6: error: call to undeclared function 'cc_platform_has'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     877 |         if (cc_platform_has(CC_ATTR_MEM_ENCRYPT)) {
         |             ^
>> kernel/dma/mapping.c:877:22: error: use of undeclared identifier 'CC_ATTR_MEM_ENCRYPT'
     877 |         if (cc_platform_has(CC_ATTR_MEM_ENCRYPT)) {
         |                             ^
   13 warnings and 2 errors generated.


vim +/cc_platform_has +877 kernel/dma/mapping.c

   865	
   866	/**
   867	 * dma_get_memory_type - get the DMA memory type of a page supplied
   868	 * @page: page to check
   869	 * @type: memory type of that page
   870	 *
   871	 * Set the memory type related to struct page. Users of this API assume
   872	 * that whole buffer which is backed by the page has the same memory type.
   873	 */
   874	void dma_get_memory_type(struct page *page, struct dma_memory_type *type)
   875	{
   876		/* TODO: REwrite this check to rely on specific struct page flags */
 > 877		if (cc_platform_has(CC_ATTR_MEM_ENCRYPT)) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
