Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A701D88D7;
	Sun, 15 Feb 2026 00:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771116125; cv=none; b=AG1UmIFJW7duCqIk2Ae1aSlFYDrlUyvNmzq/PxE8geonjXg6TRc4ZIMu/erMHV/AJFbILyGtjFlEXB/7YhhgUfjYWEN12FtF+LRx9XIKKpj5vM9lkes1arZPxNqATvghHmb0AdT1sqp91kPU0wT8O1bJwB/TPfILOVY/Fi5AKwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771116125; c=relaxed/simple;
	bh=kEsnx+VVQ6rQffg1msdDxwnXf8UioDx2IdA1sZ3G8Hg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bRwmhXPKsnFbtKZdx2Y15FGBJyRoNW3bOrIazcCMtpkkkNc4YsGYimARGMLWw8SySLs5+GPl/oDS7Bn8sGcVasCSKJeMEGH1AyYyzNqC2NnumATbNBY2tThu63qdBDMJ7MNQfY5jOrdS8JZW5V9mZ2DV2lMDIatZOlPEwCK9R7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HCN6Ef/h; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HCN6Ef/h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771116122; x=1802652122;
  h=date:from:to:cc:subject:message-id;
  bh=kEsnx+VVQ6rQffg1msdDxwnXf8UioDx2IdA1sZ3G8Hg=;
  b=HCN6Ef/h5o3q5fL1ok5Jc9YiXB5DV3997fZ8NOuaDSZnJTBeZUJgtNX7
   pF3Es5Ph3N/VC17hseNecNhOVb+HTK8fjMlhDdIK6Dmr9LI3QDFzpYY1r
   vEYpZmgtxON5mmBeSqAR15aAn4PwAlD+GzoQ7LBppfHjKf13gitPDdVdA
   jS++Fo4gxQ2+3TnuMhgdYKreL402X2FQgWkGccgyf5uMErOBIUEPV6Khi
   c3UWU9UWWMcE0Af5fIzlqGkr9gnlnYWAmSFxG0oa5auIEWmfxu1pzxaO/
   lQ201IK2oy4Fsfq6eloEH2u0u+PPqeKdEkdlZ4i+8L84u2JovWEv+a2zW
   w==;
X-CSE-ConnectionGUID: zw+ivYwfSpGQ7OpGjCwMCQ==
X-CSE-MsgGUID: Feaesl6tRtGmMDOjtjBi8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11701"; a="89664789"
X-IronPort-AV: E=Sophos;i="6.21,291,1763452800"; 
   d="scan'208";a="89664789"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2026 16:42:02 -0800
X-CSE-ConnectionGUID: FiynNv4wRh6V/NfET+eSGg==
X-CSE-MsgGUID: 0RNlJjjGRx6wqxzT5MEBvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,291,1763452800"; 
   d="scan'208";a="217414308"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 14 Feb 2026 16:41:58 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrQCz-00000000x7Y-3Wdz;
	Sun, 15 Feb 2026 00:41:57 +0000
Date: Sun, 15 Feb 2026 08:41:36 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety-2026-02-13 7/85]
 include/linux/highmem.h:326:15: error: call to undeclared function
 'user_alloc_needs_zeroing'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202602150852.zbaoGSx1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/bvanassche/linux thread-safety-2026-02-13
head:   b3d50cd353767e14c2bc42f6b49ec42114b0425f
commit: 564a4cd602be522e2844ccb8ebc2e9ac56b7a37b [7/85] mm/pgtable: Fix a build error
config: arm-defconfig (https://download.01.org/0day-ci/archive/20260215/202602150852.zbaoGSx1-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260215/202602150852.zbaoGSx1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602150852.zbaoGSx1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:31:
   In file included from include/linux/pgtable.h:123:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
>> arch/arm/include/asm/cacheflush.h:230:46: error: call to undeclared function 'PAGE_ALIGN'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     230 |                 __cpuc_flush_user_range(start & PAGE_MASK, PAGE_ALIGN(end),
         |                                                            ^
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:31:
   In file included from include/linux/pgtable.h:123:
   In file included from include/linux/highmem.h:14:
>> include/linux/highmem-internal.h:46:10: error: call to undeclared function 'page_address'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      46 |                 addr = page_address(page);
         |                        ^
>> include/linux/highmem-internal.h:46:8: error: incompatible integer to pointer conversion assigning to 'void *' from 'int' [-Wint-conversion]
      46 |                 addr = page_address(page);
         |                      ^ ~~~~~~~~~~~~~~~~~~
   include/linux/highmem-internal.h:79:10: error: call to undeclared function 'page_address'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      79 |                 return page_address(page);
         |                        ^
>> include/linux/highmem-internal.h:79:10: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'void *' [-Wint-conversion]
      79 |                 return page_address(page);
         |                        ^~~~~~~~~~~~~~~~~~
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:31:
   In file included from include/linux/pgtable.h:123:
>> include/linux/highmem.h:326:15: error: call to undeclared function 'user_alloc_needs_zeroing'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     326 |         if (folio && user_alloc_needs_zeroing())
         |                      ^
>> include/linux/highmem.h:502:28: error: call to undeclared function 'folio_size'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     502 |         VM_BUG_ON(dst_off + len > folio_size(dst_folio));
         |                                   ^
>> include/linux/highmem.h:511:27: error: call to undeclared function 'offset_in_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     511 |                     chunk > PAGE_SIZE - offset_in_page(dst_off))
         |                                         ^
   include/linux/highmem.h:577:27: error: call to undeclared function 'folio_size'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     577 |         VM_BUG_ON(offset + len > folio_size(folio));
         |                                  ^
   include/linux/highmem.h:584:27: error: call to undeclared function 'offset_in_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     584 |                     chunk > PAGE_SIZE - offset_in_page(offset))
         |                                         ^
   include/linux/highmem.h:605:27: error: call to undeclared function 'folio_size'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     605 |         VM_BUG_ON(offset + len > folio_size(folio));
         |                                  ^
   include/linux/highmem.h:612:27: error: call to undeclared function 'offset_in_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     612 |                     chunk > PAGE_SIZE - offset_in_page(offset))
         |                                         ^
   include/linux/highmem.h:642:15: error: call to undeclared function 'folio_size'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     642 |         size_t len = folio_size(folio) - offset;
         |                      ^
   include/linux/highmem.h:645:28: error: call to undeclared function 'offset_in_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     645 |                 size_t max = PAGE_SIZE - offset_in_page(offset);
         |                                          ^
   include/linux/highmem.h:680:27: error: call to undeclared function 'folio_size'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     680 |         VM_BUG_ON(offset + len > folio_size(folio));
         |                                  ^
   include/linux/highmem.h:683:28: error: call to undeclared function 'offset_in_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     683 |                 size_t max = PAGE_SIZE - offset_in_page(offset);
         |                                          ^
>> include/linux/highmem.h:716:18: error: call to undeclared function 'offset_in_folio'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     716 |         size_t offset = offset_in_folio(folio, pos);
         |                         ^
   include/linux/highmem.h:720:12: error: call to undeclared function 'offset_in_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     720 |                 offset = offset_in_page(offset);
         |                          ^
   include/linux/highmem.h:723:18: error: call to undeclared function 'folio_size'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     723 |                 len = min(len, folio_size(folio) - offset);
         |                                ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
   make[3]: *** [scripts/Makefile.build:184: arch/arm/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1333: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/user_alloc_needs_zeroing +326 include/linux/highmem.h

8d846b723e5723 Ankur Arora             2026-01-06  305  
6bc56a4d855303 Matthew Wilcox (Oracle  2023-01-16  306) #ifndef vma_alloc_zeroed_movable_folio
769848c03895b6 Mel Gorman              2007-07-17  307  /**
6bc56a4d855303 Matthew Wilcox (Oracle  2023-01-16  308)  * vma_alloc_zeroed_movable_folio - Allocate a zeroed page for a VMA.
6bc56a4d855303 Matthew Wilcox (Oracle  2023-01-16  309)  * @vma: The VMA the page is to be allocated for.
6bc56a4d855303 Matthew Wilcox (Oracle  2023-01-16  310)  * @vaddr: The virtual address the page will be inserted into.
769848c03895b6 Mel Gorman              2007-07-17  311   *
6bc56a4d855303 Matthew Wilcox (Oracle  2023-01-16  312)  * This function will allocate a page suitable for inserting into this
6bc56a4d855303 Matthew Wilcox (Oracle  2023-01-16  313)  * VMA at this virtual address.  It may be allocated from highmem or
6bc56a4d855303 Matthew Wilcox (Oracle  2023-01-16  314)  * the movable zone.  An architecture may provide its own implementation.
e7392b4eca84e8 Fabio M. De Francesco   2022-05-13  315   *
6bc56a4d855303 Matthew Wilcox (Oracle  2023-01-16  316)  * Return: A folio containing one allocated and zeroed page or NULL if
6bc56a4d855303 Matthew Wilcox (Oracle  2023-01-16  317)  * we are out of memory.
769848c03895b6 Mel Gorman              2007-07-17  318   */
6bc56a4d855303 Matthew Wilcox (Oracle  2023-01-16  319) static inline
6bc56a4d855303 Matthew Wilcox (Oracle  2023-01-16  320) struct folio *vma_alloc_zeroed_movable_folio(struct vm_area_struct *vma,
769848c03895b6 Mel Gorman              2007-07-17  321  				   unsigned long vaddr)
^1da177e4c3f41 Linus Torvalds          2005-04-16  322  {
c51a4f11e6d824 Zi Yan                  2024-12-09  323  	struct folio *folio;
c51a4f11e6d824 Zi Yan                  2024-12-09  324  
c51a4f11e6d824 Zi Yan                  2024-12-09  325  	folio = vma_alloc_folio(GFP_HIGHUSER_MOVABLE, 0, vma, vaddr);
c51a4f11e6d824 Zi Yan                  2024-12-09 @326  	if (folio && user_alloc_needs_zeroing())
c51a4f11e6d824 Zi Yan                  2024-12-09  327  		clear_user_highpage(&folio->page, vaddr);
c51a4f11e6d824 Zi Yan                  2024-12-09  328  
c51a4f11e6d824 Zi Yan                  2024-12-09  329  	return folio;
^1da177e4c3f41 Linus Torvalds          2005-04-16  330  }
^1da177e4c3f41 Linus Torvalds          2005-04-16  331  #endif
^1da177e4c3f41 Linus Torvalds          2005-04-16  332  
^1da177e4c3f41 Linus Torvalds          2005-04-16  333  static inline void clear_highpage(struct page *page)
^1da177e4c3f41 Linus Torvalds          2005-04-16  334  {
d2c20e51e3966b Ira Weiny               2021-11-05  335  	void *kaddr = kmap_local_page(page);
^1da177e4c3f41 Linus Torvalds          2005-04-16  336  	clear_page(kaddr);
d2c20e51e3966b Ira Weiny               2021-11-05  337  	kunmap_local(kaddr);
^1da177e4c3f41 Linus Torvalds          2005-04-16  338  }
^1da177e4c3f41 Linus Torvalds          2005-04-16  339  
d9da8f6cf55eec Andrey Konovalov        2022-06-09  340  static inline void clear_highpage_kasan_tagged(struct page *page)
d9da8f6cf55eec Andrey Konovalov        2022-06-09  341  {
16d91faf09be14 Peter Collingbourne     2023-02-16  342  	void *kaddr = kmap_local_page(page);
d9da8f6cf55eec Andrey Konovalov        2022-06-09  343  
16d91faf09be14 Peter Collingbourne     2023-02-16  344  	clear_page(kasan_reset_tag(kaddr));
16d91faf09be14 Peter Collingbourne     2023-02-16  345  	kunmap_local(kaddr);
d9da8f6cf55eec Andrey Konovalov        2022-06-09  346  }
d9da8f6cf55eec Andrey Konovalov        2022-06-09  347  
5bebe8de192649 Linus Torvalds          2025-11-18  348  #ifndef __HAVE_ARCH_TAG_CLEAR_HIGHPAGES
013bb59dbb7cf8 Peter Collingbourne     2021-06-02  349  
5bebe8de192649 Linus Torvalds          2025-11-18  350  /* Return false to let people know we did not initialize the pages */
5bebe8de192649 Linus Torvalds          2025-11-18  351  static inline bool tag_clear_highpages(struct page *page, int numpages)
013bb59dbb7cf8 Peter Collingbourne     2021-06-02  352  {
5bebe8de192649 Linus Torvalds          2025-11-18  353  	return false;
013bb59dbb7cf8 Peter Collingbourne     2021-06-02  354  }
013bb59dbb7cf8 Peter Collingbourne     2021-06-02  355  
013bb59dbb7cf8 Peter Collingbourne     2021-06-02  356  #endif
013bb59dbb7cf8 Peter Collingbourne     2021-06-02  357  
0060ef3b4e6dd1 Matthew Wilcox (Oracle  2020-12-14  358) /*
0060ef3b4e6dd1 Matthew Wilcox (Oracle  2020-12-14  359)  * If we pass in a base or tail page, we can zero up to PAGE_SIZE.
0060ef3b4e6dd1 Matthew Wilcox (Oracle  2020-12-14  360)  * If we pass in a head page, we can zero up to the size of the compound page.
0060ef3b4e6dd1 Matthew Wilcox (Oracle  2020-12-14  361)  */
c035713998700e Matthew Wilcox (Oracle  2021-11-05  362) #ifdef CONFIG_HIGHMEM
0060ef3b4e6dd1 Matthew Wilcox (Oracle  2020-12-14  363) void zero_user_segments(struct page *page, unsigned start1, unsigned end1,
0060ef3b4e6dd1 Matthew Wilcox (Oracle  2020-12-14  364) 		unsigned start2, unsigned end2);
c035713998700e Matthew Wilcox (Oracle  2021-11-05  365) #else
eebd2aa355692a Christoph Lameter       2008-02-04  366  static inline void zero_user_segments(struct page *page,
eebd2aa355692a Christoph Lameter       2008-02-04  367  		unsigned start1, unsigned end1,
eebd2aa355692a Christoph Lameter       2008-02-04  368  		unsigned start2, unsigned end2)
eebd2aa355692a Christoph Lameter       2008-02-04  369  {
d2c20e51e3966b Ira Weiny               2021-11-05  370  	void *kaddr = kmap_local_page(page);
0060ef3b4e6dd1 Matthew Wilcox (Oracle  2020-12-14  371) 	unsigned int i;
eebd2aa355692a Christoph Lameter       2008-02-04  372  
0060ef3b4e6dd1 Matthew Wilcox (Oracle  2020-12-14  373) 	BUG_ON(end1 > page_size(page) || end2 > page_size(page));
eebd2aa355692a Christoph Lameter       2008-02-04  374  
eebd2aa355692a Christoph Lameter       2008-02-04  375  	if (end1 > start1)
eebd2aa355692a Christoph Lameter       2008-02-04  376  		memset(kaddr + start1, 0, end1 - start1);
eebd2aa355692a Christoph Lameter       2008-02-04  377  
eebd2aa355692a Christoph Lameter       2008-02-04  378  	if (end2 > start2)
eebd2aa355692a Christoph Lameter       2008-02-04  379  		memset(kaddr + start2, 0, end2 - start2);
eebd2aa355692a Christoph Lameter       2008-02-04  380  
d2c20e51e3966b Ira Weiny               2021-11-05  381  	kunmap_local(kaddr);
0060ef3b4e6dd1 Matthew Wilcox (Oracle  2020-12-14  382) 	for (i = 0; i < compound_nr(page); i++)
0060ef3b4e6dd1 Matthew Wilcox (Oracle  2020-12-14  383) 		flush_dcache_page(page + i);
eebd2aa355692a Christoph Lameter       2008-02-04  384  }
c035713998700e Matthew Wilcox (Oracle  2021-11-05  385) #endif
eebd2aa355692a Christoph Lameter       2008-02-04  386  
eebd2aa355692a Christoph Lameter       2008-02-04  387  static inline void zero_user_segment(struct page *page,
eebd2aa355692a Christoph Lameter       2008-02-04  388  	unsigned start, unsigned end)
eebd2aa355692a Christoph Lameter       2008-02-04  389  {
eebd2aa355692a Christoph Lameter       2008-02-04  390  	zero_user_segments(page, start, end, 0, 0);
eebd2aa355692a Christoph Lameter       2008-02-04  391  }
eebd2aa355692a Christoph Lameter       2008-02-04  392  
77fff4ae2b7bba Atsushi Nemoto          2006-12-12  393  #ifndef __HAVE_ARCH_COPY_USER_HIGHPAGE
77fff4ae2b7bba Atsushi Nemoto          2006-12-12  394  
9de455b20705f3 Atsushi Nemoto          2006-12-12  395  static inline void copy_user_highpage(struct page *to, struct page *from,
9de455b20705f3 Atsushi Nemoto          2006-12-12  396  	unsigned long vaddr, struct vm_area_struct *vma)
^1da177e4c3f41 Linus Torvalds          2005-04-16  397  {
^1da177e4c3f41 Linus Torvalds          2005-04-16  398  	char *vfrom, *vto;
^1da177e4c3f41 Linus Torvalds          2005-04-16  399  
d2c20e51e3966b Ira Weiny               2021-11-05  400  	vfrom = kmap_local_page(from);
d2c20e51e3966b Ira Weiny               2021-11-05  401  	vto = kmap_local_page(to);
^1da177e4c3f41 Linus Torvalds          2005-04-16  402  	copy_user_page(vto, vfrom, vaddr, to);
b073d7f8aee4eb Alexander Potapenko     2022-09-15  403  	kmsan_unpoison_memory(page_address(to), PAGE_SIZE);
d2c20e51e3966b Ira Weiny               2021-11-05  404  	kunmap_local(vto);
d2c20e51e3966b Ira Weiny               2021-11-05  405  	kunmap_local(vfrom);
^1da177e4c3f41 Linus Torvalds          2005-04-16  406  }
^1da177e4c3f41 Linus Torvalds          2005-04-16  407  
77fff4ae2b7bba Atsushi Nemoto          2006-12-12  408  #endif
77fff4ae2b7bba Atsushi Nemoto          2006-12-12  409  
6efc7afb5cc984 Jiaqi Yan               2023-03-29  410  #ifndef __HAVE_ARCH_COPY_HIGHPAGE
6efc7afb5cc984 Jiaqi Yan               2023-03-29  411  
6efc7afb5cc984 Jiaqi Yan               2023-03-29  412  static inline void copy_highpage(struct page *to, struct page *from)
6efc7afb5cc984 Jiaqi Yan               2023-03-29  413  {
6efc7afb5cc984 Jiaqi Yan               2023-03-29  414  	char *vfrom, *vto;
6efc7afb5cc984 Jiaqi Yan               2023-03-29  415  
6efc7afb5cc984 Jiaqi Yan               2023-03-29  416  	vfrom = kmap_local_page(from);
6efc7afb5cc984 Jiaqi Yan               2023-03-29  417  	vto = kmap_local_page(to);
6efc7afb5cc984 Jiaqi Yan               2023-03-29  418  	copy_page(vto, vfrom);
6efc7afb5cc984 Jiaqi Yan               2023-03-29  419  	kmsan_copy_page_meta(to, from);
6efc7afb5cc984 Jiaqi Yan               2023-03-29  420  	kunmap_local(vto);
6efc7afb5cc984 Jiaqi Yan               2023-03-29  421  	kunmap_local(vfrom);
6efc7afb5cc984 Jiaqi Yan               2023-03-29  422  }
6efc7afb5cc984 Jiaqi Yan               2023-03-29  423  
6efc7afb5cc984 Jiaqi Yan               2023-03-29  424  #endif
6efc7afb5cc984 Jiaqi Yan               2023-03-29  425  
a873dfe1032a13 Tony Luck               2022-10-21  426  #ifdef copy_mc_to_kernel
6efc7afb5cc984 Jiaqi Yan               2023-03-29  427  /*
6efc7afb5cc984 Jiaqi Yan               2023-03-29  428   * If architecture supports machine check exception handling, define the
6efc7afb5cc984 Jiaqi Yan               2023-03-29  429   * #MC versions of copy_user_highpage and copy_highpage. They copy a memory
6efc7afb5cc984 Jiaqi Yan               2023-03-29  430   * page with #MC in source page (@from) handled, and return the number
6efc7afb5cc984 Jiaqi Yan               2023-03-29  431   * of bytes not copied if there was a #MC, otherwise 0 for success.
6efc7afb5cc984 Jiaqi Yan               2023-03-29  432   */
a873dfe1032a13 Tony Luck               2022-10-21  433  static inline int copy_mc_user_highpage(struct page *to, struct page *from,
a873dfe1032a13 Tony Luck               2022-10-21  434  					unsigned long vaddr, struct vm_area_struct *vma)
a873dfe1032a13 Tony Luck               2022-10-21  435  {
a873dfe1032a13 Tony Luck               2022-10-21  436  	unsigned long ret;
a873dfe1032a13 Tony Luck               2022-10-21  437  	char *vfrom, *vto;
a873dfe1032a13 Tony Luck               2022-10-21  438  
a873dfe1032a13 Tony Luck               2022-10-21  439  	vfrom = kmap_local_page(from);
a873dfe1032a13 Tony Luck               2022-10-21  440  	vto = kmap_local_page(to);
a873dfe1032a13 Tony Luck               2022-10-21  441  	ret = copy_mc_to_kernel(vto, vfrom, PAGE_SIZE);
a873dfe1032a13 Tony Luck               2022-10-21  442  	if (!ret)
a873dfe1032a13 Tony Luck               2022-10-21  443  		kmsan_unpoison_memory(page_address(to), PAGE_SIZE);
a873dfe1032a13 Tony Luck               2022-10-21  444  	kunmap_local(vto);
a873dfe1032a13 Tony Luck               2022-10-21  445  	kunmap_local(vfrom);
a873dfe1032a13 Tony Luck               2022-10-21  446  
28bdacbcb36d09 Kefeng Wang             2024-06-26  447  	if (ret)
28bdacbcb36d09 Kefeng Wang             2024-06-26  448  		memory_failure_queue(page_to_pfn(from), 0);
28bdacbcb36d09 Kefeng Wang             2024-06-26  449  
a873dfe1032a13 Tony Luck               2022-10-21  450  	return ret;
a873dfe1032a13 Tony Luck               2022-10-21  451  }
a873dfe1032a13 Tony Luck               2022-10-21  452  
6efc7afb5cc984 Jiaqi Yan               2023-03-29  453  static inline int copy_mc_highpage(struct page *to, struct page *from)
^1da177e4c3f41 Linus Torvalds          2005-04-16  454  {
6efc7afb5cc984 Jiaqi Yan               2023-03-29  455  	unsigned long ret;
^1da177e4c3f41 Linus Torvalds          2005-04-16  456  	char *vfrom, *vto;
^1da177e4c3f41 Linus Torvalds          2005-04-16  457  
d2c20e51e3966b Ira Weiny               2021-11-05  458  	vfrom = kmap_local_page(from);
d2c20e51e3966b Ira Weiny               2021-11-05  459  	vto = kmap_local_page(to);
6efc7afb5cc984 Jiaqi Yan               2023-03-29  460  	ret = copy_mc_to_kernel(vto, vfrom, PAGE_SIZE);
6efc7afb5cc984 Jiaqi Yan               2023-03-29  461  	if (!ret)
b073d7f8aee4eb Alexander Potapenko     2022-09-15  462  		kmsan_copy_page_meta(to, from);
d2c20e51e3966b Ira Weiny               2021-11-05  463  	kunmap_local(vto);
d2c20e51e3966b Ira Weiny               2021-11-05  464  	kunmap_local(vfrom);
6efc7afb5cc984 Jiaqi Yan               2023-03-29  465  
28bdacbcb36d09 Kefeng Wang             2024-06-26  466  	if (ret)
28bdacbcb36d09 Kefeng Wang             2024-06-26  467  		memory_failure_queue(page_to_pfn(from), 0);
28bdacbcb36d09 Kefeng Wang             2024-06-26  468  
6efc7afb5cc984 Jiaqi Yan               2023-03-29  469  	return ret;
6efc7afb5cc984 Jiaqi Yan               2023-03-29  470  }
6efc7afb5cc984 Jiaqi Yan               2023-03-29  471  #else
6efc7afb5cc984 Jiaqi Yan               2023-03-29  472  static inline int copy_mc_user_highpage(struct page *to, struct page *from,
6efc7afb5cc984 Jiaqi Yan               2023-03-29  473  					unsigned long vaddr, struct vm_area_struct *vma)
6efc7afb5cc984 Jiaqi Yan               2023-03-29  474  {
6efc7afb5cc984 Jiaqi Yan               2023-03-29  475  	copy_user_highpage(to, from, vaddr, vma);
6efc7afb5cc984 Jiaqi Yan               2023-03-29  476  	return 0;
^1da177e4c3f41 Linus Torvalds          2005-04-16  477  }
^1da177e4c3f41 Linus Torvalds          2005-04-16  478  
6efc7afb5cc984 Jiaqi Yan               2023-03-29  479  static inline int copy_mc_highpage(struct page *to, struct page *from)
6efc7afb5cc984 Jiaqi Yan               2023-03-29  480  {
6efc7afb5cc984 Jiaqi Yan               2023-03-29  481  	copy_highpage(to, from);
6efc7afb5cc984 Jiaqi Yan               2023-03-29  482  	return 0;
6efc7afb5cc984 Jiaqi Yan               2023-03-29  483  }
a4602b62d9fdea Khalid Aziz             2018-02-21  484  #endif
a4602b62d9fdea Khalid Aziz             2018-02-21  485  
6a0996db6879cf Ira Weiny               2021-02-09  486  static inline void memcpy_page(struct page *dst_page, size_t dst_off,
6a0996db6879cf Ira Weiny               2021-02-09  487  			       struct page *src_page, size_t src_off,
6a0996db6879cf Ira Weiny               2021-02-09  488  			       size_t len)
6a0996db6879cf Ira Weiny               2021-02-09  489  {
6a0996db6879cf Ira Weiny               2021-02-09  490  	char *dst = kmap_local_page(dst_page);
6a0996db6879cf Ira Weiny               2021-02-09  491  	char *src = kmap_local_page(src_page);
6a0996db6879cf Ira Weiny               2021-02-09  492  
ca18f6ea012bf3 Ira Weiny               2021-02-10  493  	VM_BUG_ON(dst_off + len > PAGE_SIZE || src_off + len > PAGE_SIZE);
6a0996db6879cf Ira Weiny               2021-02-09  494  	memcpy(dst + dst_off, src + src_off, len);
6a0996db6879cf Ira Weiny               2021-02-09  495  	kunmap_local(src);
6a0996db6879cf Ira Weiny               2021-02-09  496  	kunmap_local(dst);
6a0996db6879cf Ira Weiny               2021-02-09  497  }
6a0996db6879cf Ira Weiny               2021-02-09  498  
1313057c369bb4 Matthew Wilcox (Oracle  2025-03-31  499) static inline void memcpy_folio(struct folio *dst_folio, size_t dst_off,
1313057c369bb4 Matthew Wilcox (Oracle  2025-03-31  500) 		struct folio *src_folio, size_t src_off, size_t len)
1313057c369bb4 Matthew Wilcox (Oracle  2025-03-31  501) {
1313057c369bb4 Matthew Wilcox (Oracle  2025-03-31 @502) 	VM_BUG_ON(dst_off + len > folio_size(dst_folio));
1313057c369bb4 Matthew Wilcox (Oracle  2025-03-31  503) 	VM_BUG_ON(src_off + len > folio_size(src_folio));
1313057c369bb4 Matthew Wilcox (Oracle  2025-03-31  504) 
1313057c369bb4 Matthew Wilcox (Oracle  2025-03-31  505) 	do {
1313057c369bb4 Matthew Wilcox (Oracle  2025-03-31  506) 		char *dst = kmap_local_folio(dst_folio, dst_off);
1313057c369bb4 Matthew Wilcox (Oracle  2025-03-31  507) 		const char *src = kmap_local_folio(src_folio, src_off);
1313057c369bb4 Matthew Wilcox (Oracle  2025-03-31  508) 		size_t chunk = len;
1313057c369bb4 Matthew Wilcox (Oracle  2025-03-31  509) 
1313057c369bb4 Matthew Wilcox (Oracle  2025-03-31  510) 		if (folio_test_highmem(dst_folio) &&
1313057c369bb4 Matthew Wilcox (Oracle  2025-03-31 @511) 		    chunk > PAGE_SIZE - offset_in_page(dst_off))
1313057c369bb4 Matthew Wilcox (Oracle  2025-03-31  512) 			chunk = PAGE_SIZE - offset_in_page(dst_off);
1313057c369bb4 Matthew Wilcox (Oracle  2025-03-31  513) 		if (folio_test_highmem(src_folio) &&
1313057c369bb4 Matthew Wilcox (Oracle  2025-03-31  514) 		    chunk > PAGE_SIZE - offset_in_page(src_off))
1313057c369bb4 Matthew Wilcox (Oracle  2025-03-31  515) 			chunk = PAGE_SIZE - offset_in_page(src_off);
1313057c369bb4 Matthew Wilcox (Oracle  2025-03-31  516) 		memcpy(dst, src, chunk);
1313057c369bb4 Matthew Wilcox (Oracle  2025-03-31  517) 		kunmap_local(src);
1313057c369bb4 Matthew Wilcox (Oracle  2025-03-31  518) 		kunmap_local(dst);
1313057c369bb4 Matthew Wilcox (Oracle  2025-03-31  519) 
1313057c369bb4 Matthew Wilcox (Oracle  2025-03-31  520) 		dst_off += chunk;
1313057c369bb4 Matthew Wilcox (Oracle  2025-03-31  521) 		src_off += chunk;
1313057c369bb4 Matthew Wilcox (Oracle  2025-03-31  522) 		len -= chunk;
1313057c369bb4 Matthew Wilcox (Oracle  2025-03-31  523) 	} while (len > 0);
1313057c369bb4 Matthew Wilcox (Oracle  2025-03-31  524) }
1313057c369bb4 Matthew Wilcox (Oracle  2025-03-31  525) 

:::::: The code at line 326 was first introduced by commit
:::::: c51a4f11e6d8246590b5e64908c1ed84b33e8ba2 mm: use clear_user_(high)page() for arch with special user folio handling

:::::: TO: Zi Yan <ziy@nvidia.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
