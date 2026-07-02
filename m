Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4124B3C65F2;
	Thu,  2 Jul 2026 09:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782983994; cv=none; b=KyTKjhf+R+Y3yBQWTxkuvHz8eQUfITw9fCJ01I40XF3PdMyj3j/I4dAU5aR+bm4Y0YVqne/u0pfyHwaSf++RMyzi4jtJlQuLyuVqi8D0aMzvQZCwt35zdq7nqx3QW1nD16aPn0s4BAwDkXWeYNcMjpUZNzphf41SDlE33lTaRQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782983994; c=relaxed/simple;
	bh=7RNyh7pjBSpect1XcycrFnoCcOpfQSBeZZfTbSrvCzA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FnPTiGXxaLxnWs+fvAV51jGPnujlsXHpm9aID1vs2PrPd52Ry7foE85vwepfp2zQ9TugKBckF127DyAF0Opo6HtFj0gGwuyCKU/DLc+5+XNlTIgfjtmmdYTnxiHDf7JLZ2fYd0vAxLzY8eGw0y5al+NF6hnxH3ani/5fQY+BjyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b0gyR95M; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b0gyR95M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782983993; x=1814519993;
  h=date:from:to:cc:subject:message-id;
  bh=7RNyh7pjBSpect1XcycrFnoCcOpfQSBeZZfTbSrvCzA=;
  b=b0gyR95M2EdgADYWtwViCuwgLeuCloBURHaLlyeETcuJF/QGEAWc7mbK
   nxSjRJ2RMlqOUYl4JGUoCseLXUxiqbI+qFQzPkJwxB9+WM57EYdJv5pPf
   owgDzTOlDSvh8iIUjNRInbysxrNMBBfThzGCBCbQLMEvjhaeS1JBct+8Q
   JIzgRPLwUIjPILilKIBDQoWqnFPB9f9JPAlhk6ArVXT4N/Aa9YeVCQEku
   UaOS9tLU53ISNXy3JRjpaK1V4qi592kjRb7SmcR59Zco9r+5JhDh7E+/F
   q2ugIMeIThWPWo8jerbIFD57Hyb4FPAHsJRZzHP8l7FUQtOPHBNdZ+fZj
   Q==;
X-CSE-ConnectionGUID: I02H20FgRPy3jzTIHAFChQ==
X-CSE-MsgGUID: V4/jbYxhQvCNBjhjsmQwkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="109281565"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="109281565"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 02:19:52 -0700
X-CSE-ConnectionGUID: Nx3m5UVtQGa06OLCDavw5w==
X-CSE-MsgGUID: xXzD611sTcuYBcBYqk9YYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="248359800"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 02 Jul 2026 02:19:50 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfDaF-00000000Aao-2xve;
	Thu, 02 Jul 2026 09:19:47 +0000
Date: Thu, 02 Jul 2026 17:18:06 +0800
From: kernel test robot <lkp@intel.com>
To: "Harry Yoo (Oracle)" <harry@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [harry:kmalloc-no-objext-rfc-v1r2 3/3] mm/internal.h:838:26:
 warning: implicit conversion from 'unsigned long long' to 'u32' (aka
 'unsigned int') changes value from 17179869184 to 0
Message-ID: <202607021730.dIjpsiXL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/harry/linux.git kmalloc-no-objext-rfc-v1r2
head:   a734609d2f387a9e682d352e9f28599744cc300b
commit: a734609d2f387a9e682d352e9f28599744cc300b [3/3] mm/slab: prevent unbounded recursion in free path with new kmalloc type
config: x86_64-randconfig-016-20260702 (https://download.01.org/0day-ci/archive/20260702/202607021730.dIjpsiXL-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607021730.dIjpsiXL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607021730.dIjpsiXL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/slub.c:23:
   mm/slab.h:397:10: error: use of undeclared identifier 'KMALLOC_NO_OBJ_EXT'
     397 |                 type = KMALLOC_NO_OBJ_EXT;
         |                        ^~~~~~~~~~~~~~~~~~
   In file included from mm/slub.c:55:
>> mm/internal.h:838:26: warning: implicit conversion from 'unsigned long long' to 'u32' (aka 'unsigned int') changes value from 17179869184 to 0 [-Wconstant-conversion]
     838 |         VM_WARN_ON_ONCE(order > MAX_FOLIO_ORDER);
         |                                 ^~~~~~~~~~~~~~~
   include/linux/mmzone.h:85:33: note: expanded from macro 'MAX_FOLIO_ORDER'
      85 | #define MAX_FOLIO_ORDER         (ilog2(SZ_16G) - PAGE_SHIFT)
         |                                  ~~~~~~^~~~~~~
   include/linux/sizes.h:56:19: note: expanded from macro 'SZ_16G'
      56 | #define SZ_16G                          _AC(0x400000000, ULL)
         |                                         ^~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/const.h:21:18: note: expanded from macro '_AC'
      21 | #define _AC(X,Y)        __AC(X,Y)
         |                         ^~~~~~~~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/log2.h:162:14: note: expanded from macro 'ilog2'
     162 |         __ilog2_u32(n) :                \
         |         ~~~~~~~~~~~ ^
   include/linux/mmdebug.h:123:50: note: expanded from macro 'VM_WARN_ON_ONCE'
     123 | #define VM_WARN_ON_ONCE(cond) (void)WARN_ON_ONCE(cond)
         |                                                  ^~~~
   include/asm-generic/bug.h:120:25: note: expanded from macro 'WARN_ON_ONCE'
     120 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   1 warning and 1 error generated.


vim +838 mm/internal.h

904d58578fce531 Kefeng Wang             2023-05-16  822  
3c605096d315821 Joonsoo Kim             2014-11-13  823  extern int __isolate_free_page(struct page *page, unsigned int order);
624f58d8f463967 Alexander Duyck         2020-04-06  824  extern void __putback_isolated_page(struct page *page, unsigned int order,
624f58d8f463967 Alexander Duyck         2020-04-06  825  				    int mt);
58e3e5265484a1b Shengming Hu            2025-12-29  826  extern void memblock_free_pages(unsigned long pfn, unsigned int order);
13c526540b31693 David Hildenbrand       2024-06-07  827  extern void __free_pages_core(struct page *page, unsigned int order,
13c526540b31693 David Hildenbrand       2024-06-07  828  		enum meminit_context context);
9420f89db2dd611 Mike Rapoport (IBM      2023-03-21  829) 
1e3be4856f49d55 Tarun Sahu              2023-06-12  830  /*
1e3be4856f49d55 Tarun Sahu              2023-06-12  831   * This will have no effect, other than possibly generating a warning, if the
1e3be4856f49d55 Tarun Sahu              2023-06-12  832   * caller passes in a non-large folio.
1e3be4856f49d55 Tarun Sahu              2023-06-12  833   */
1e3be4856f49d55 Tarun Sahu              2023-06-12  834  static inline void folio_set_order(struct folio *folio, unsigned int order)
1e3be4856f49d55 Tarun Sahu              2023-06-12  835  {
1e3be4856f49d55 Tarun Sahu              2023-06-12  836  	if (WARN_ON_ONCE(!order || !folio_test_large(folio)))
1e3be4856f49d55 Tarun Sahu              2023-06-12  837  		return;
99132d24d76511f David Hildenbrand       2025-09-01 @838  	VM_WARN_ON_ONCE(order > MAX_FOLIO_ORDER);
1e3be4856f49d55 Tarun Sahu              2023-06-12  839  
ebc1baf5c9b46c2 Matthew Wilcox (Oracle  2023-08-16  840) 	folio->_flags_1 = (folio->_flags_1 & ~0xffUL) | order;
4996fc547f5b49f David Hildenbrand       2025-03-03  841  #ifdef NR_PAGES_IN_LARGE_FOLIO
4996fc547f5b49f David Hildenbrand       2025-03-03  842  	folio->_nr_pages = 1U << order;
1e3be4856f49d55 Tarun Sahu              2023-06-12  843  #endif
1e3be4856f49d55 Tarun Sahu              2023-06-12  844  }
1e3be4856f49d55 Tarun Sahu              2023-06-12  845  

:::::: The code at line 838 was first introduced by commit
:::::: 99132d24d76511f0f6ded2e25448765b632794aa mm: sanity-check maximum folio size in folio_set_order()

:::::: TO: David Hildenbrand <david@redhat.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
