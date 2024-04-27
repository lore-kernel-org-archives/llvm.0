Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5CB41A89;
	Sat, 27 Apr 2024 07:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714204471; cv=none; b=HYNiNwCW3ceA47UUv/aH6mgU3Yw3jDGQvVLBuAliMNYpxNqZFIyMhEXzwFOSw1eIbH0y/EeFvqt4hghrE1NAmoFVT+XweS5lapk4g2yrhMrHgShBEZlmMDsmizMhD28VmPAZEzxTl7cpIUMYnam0WdZW7eInE2AqqPupJR6nD14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714204471; c=relaxed/simple;
	bh=1ZAdBwzXABGTrwj8FBWHohS1Ohmev1wRz/PycBaSBJw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VPun2nb9fHSrVjPFGAf4wGrL8bYxCqADwpCY3D+LqgHnRU+wy/o0M9FxFlJBB3fQyVqw3nttSEUabKKXQy44dzMALGlqzuJNEY78ZbrWRhl1my4zPVCc6ohLp7k/T5JrigMcfy2CGnXo3SUI813Vq4vn4JqAoFufzWGaHAtIDbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VMatWt0P; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VMatWt0P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714204470; x=1745740470;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1ZAdBwzXABGTrwj8FBWHohS1Ohmev1wRz/PycBaSBJw=;
  b=VMatWt0PLZwkRKqIFWuGndXQSCWNrNBklE2T+QIy3hQ0xm0YuyW3HhVl
   1+hruyU3wvQWxXqNCRHF7TF0kGsO5TWPkAhxRMgZD67RivGg7mSdw1AG9
   A6Wfh5R8BDUKpWEoIFSyKzseO1P7Qg49DrTWpP1VGfRwlLIYmvmKCv9pm
   USIbk9ipPmERwDbVu82cNluFQTZKSIt8kPn+jGUjAWgwT6MFJaLgumkND
   wQoNKzOCTNh1J1IFTfBARvDxfzOmtEUJbWLvwft9AwuT4YaFIZwlV1mIX
   Fg9MZ1eEl6K+RWMSU90Gkr6/Tomb8rQYbt6q1p26hLEM5cLE6GOWY3O5b
   w==;
X-CSE-ConnectionGUID: 5ehb9kHzSpedJDwVt+XNWg==
X-CSE-MsgGUID: NGusNXzzQZiMWN1cbfh/AQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="9771095"
X-IronPort-AV: E=Sophos;i="6.07,235,1708416000"; 
   d="scan'208";a="9771095"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2024 00:54:29 -0700
X-CSE-ConnectionGUID: EAmA3dFkT6KOFkebgz/bIA==
X-CSE-MsgGUID: LlTnjt+pRrGdbsxpefAMgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,235,1708416000"; 
   d="scan'208";a="26136623"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 27 Apr 2024 00:54:27 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0ct6-0004la-1P;
	Sat, 27 Apr 2024 07:54:24 +0000
Date: Sat, 27 Apr 2024 15:54:08 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	David Hildenbrand <david@redhat.com>
Subject: [akpm-mm:mm-unstable 457/479] arch/s390/kernel/uv.c:196:13: error:
 call to undeclared function 'page_mapping'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202404271523.VI3HNl2M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   e9efed1822aa2651d4970ee333ac8441557f9e33
commit: d3559f806797472fd2e79145cd1df9a524728ea0 [457/479] mm: remove page_mapping()
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240427/202404271523.VI3HNl2M-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240427/202404271523.VI3HNl2M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404271523.VI3HNl2M-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/kernel/uv.c:14:
   In file included from include/linux/memblock.h:12:
   In file included from include/linux/mm.h:2258:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/s390/kernel/uv.c:14:
   In file included from include/linux/memblock.h:13:
   In file included from arch/s390/include/asm/dma.h:5:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from arch/s390/kernel/uv.c:14:
   In file included from include/linux/memblock.h:13:
   In file included from arch/s390/include/asm/dma.h:5:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from arch/s390/kernel/uv.c:14:
   In file included from include/linux/memblock.h:13:
   In file included from arch/s390/include/asm/dma.h:5:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> arch/s390/kernel/uv.c:196:13: error: call to undeclared function 'page_mapping'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     196 |         } else if (page_mapping(page)) {
         |                    ^
   arch/s390/kernel/uv.c:196:13: note: did you mean 'page_mapped'?
   include/linux/mm.h:1299:20: note: 'page_mapped' declared here
    1299 | static inline bool page_mapped(const struct page *page)
         |                    ^
   17 warnings and 1 error generated.


vim +/page_mapping +196 arch/s390/kernel/uv.c

380d97bd02fca7 Claudio Imbrenda 2021-09-20  182  
214d9bbcd3a672 Claudio Imbrenda 2020-01-21  183  /*
214d9bbcd3a672 Claudio Imbrenda 2020-01-21  184   * Calculate the expected ref_count for a page that would otherwise have no
214d9bbcd3a672 Claudio Imbrenda 2020-01-21  185   * further pins. This was cribbed from similar functions in other places in
214d9bbcd3a672 Claudio Imbrenda 2020-01-21  186   * the kernel, but with some slight modifications. We know that a secure
214d9bbcd3a672 Claudio Imbrenda 2020-01-21  187   * page can not be a huge page for example.
214d9bbcd3a672 Claudio Imbrenda 2020-01-21  188   */
214d9bbcd3a672 Claudio Imbrenda 2020-01-21  189  static int expected_page_refs(struct page *page)
214d9bbcd3a672 Claudio Imbrenda 2020-01-21  190  {
214d9bbcd3a672 Claudio Imbrenda 2020-01-21  191  	int res;
214d9bbcd3a672 Claudio Imbrenda 2020-01-21  192  
214d9bbcd3a672 Claudio Imbrenda 2020-01-21  193  	res = page_mapcount(page);
214d9bbcd3a672 Claudio Imbrenda 2020-01-21  194  	if (PageSwapCache(page)) {
214d9bbcd3a672 Claudio Imbrenda 2020-01-21  195  		res++;
214d9bbcd3a672 Claudio Imbrenda 2020-01-21 @196  	} else if (page_mapping(page)) {
214d9bbcd3a672 Claudio Imbrenda 2020-01-21  197  		res++;
214d9bbcd3a672 Claudio Imbrenda 2020-01-21  198  		if (page_has_private(page))
214d9bbcd3a672 Claudio Imbrenda 2020-01-21  199  			res++;
214d9bbcd3a672 Claudio Imbrenda 2020-01-21  200  	}
214d9bbcd3a672 Claudio Imbrenda 2020-01-21  201  	return res;
214d9bbcd3a672 Claudio Imbrenda 2020-01-21  202  }
214d9bbcd3a672 Claudio Imbrenda 2020-01-21  203  

:::::: The code at line 196 was first introduced by commit
:::::: 214d9bbcd3a67230b932f6cea83c078ab34d9e70 s390/mm: provide memory management functions for protected KVM guests

:::::: TO: Claudio Imbrenda <imbrenda@linux.ibm.com>
:::::: CC: Christian Borntraeger <borntraeger@de.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
