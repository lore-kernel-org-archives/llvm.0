Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6848F30E844;
	Mon, 18 Aug 2025 10:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755512375; cv=none; b=MXJV8p6zi2kQqFtQTiHwFm0LR/yMV62xFyWq01VmroPtKBspics/NILxjR70+sfNtb/tBiFRoA5XU8KqW27mncQdoXH4N6/aGgz6yntuW8irlCAXTy3Dk52h7ra1iFNNe4LtEabSYDiPwUk744m6bm67cZ0UUrNfaIKjhF0L0xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755512375; c=relaxed/simple;
	bh=lZiiDjhlNsl+eM7oVIh7z93U9V6yzoNAKFATgG2dY5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=omvd/XS4t0OtEqWp0J/iNtNtv2LO16tL//DSdOwPBOrCyRY0zkFVEHMKpjFCggO+c9dWZ8uaLO9rGPQADIqM5Y/+zGfLFw0AN2ABnfPBTE/6C3DCRAVE/9MNtldh3CmvBlqnhfm7KLCJ918oJ5gl/O1mKpOZslYppuYF++aFNMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GavG6Q/9; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GavG6Q/9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755512373; x=1787048373;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lZiiDjhlNsl+eM7oVIh7z93U9V6yzoNAKFATgG2dY5Q=;
  b=GavG6Q/9Qhp3y2bm3k9WtrdOo2olK/7A9eNy8DhCLa83StZedaLeSQjn
   rqlZvkxenU5ytOkIpIRdVbQlW1YaJN034/uc5y1hDWsUh306qJXqKOSE9
   dY0444TxF5lSbjKcBCSpifHeSRRE7BHvmGDlTjTXlM2lvNyPgCXDI+cpm
   7mpfQjb0z5FdklxMOp8hPp+IkrbzbK2+WfrDyN1t1uVqWW3tzPkNzVb1F
   pHJyGKudzubW9uOxV0pJchCjxZTGyWp6Wm47DOWkU/UtvwdrCEipCyIz9
   57wphrwz0nrtJwazkISOZfXARSZ+4+s2GJzUZ+X92es08kX1k+5kod2bW
   A==;
X-CSE-ConnectionGUID: /i0HWWYeSKaKQn97jOLhhw==
X-CSE-MsgGUID: q8AfEzxTSty01GHu7KS78Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="80312630"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="80312630"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 03:19:33 -0700
X-CSE-ConnectionGUID: gM3778k1SOyC1UpJ9uDsug==
X-CSE-MsgGUID: uqegUku6SaaCpn2qnljGsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="204703381"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 18 Aug 2025 03:19:31 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unwxJ-000E99-1Z;
	Mon, 18 Aug 2025 10:19:27 +0000
Date: Mon, 18 Aug 2025 18:17:13 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-new 166/188] arch/arm/mm/flush.c:307:41: error:
 incompatible pointer types passing 'memdesc_flags_t *' to parameter of type
 'volatile unsigned long *'
Message-ID: <202508181807.zhZF5TQ0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   dd1510cefdfec9dc3fa2bae40e0f16f1bf825567
commit: a2004477b3282318589bf43a786d952856adcaee [166/188] mm: introduce memdesc_flags_t
config: arm-randconfig-002-20250818 (https://download.01.org/0day-ci/archive/20250818/202508181807.zhZF5TQ0-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 93d24b6b7b148c47a2fa228a4ef31524fa1d9f3f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250818/202508181807.zhZF5TQ0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508181807.zhZF5TQ0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm/mm/flush.c:307:41: error: incompatible pointer types passing 'memdesc_flags_t *' to parameter of type 'volatile unsigned long *' [-Werror,-Wincompatible-pointer-types]
     307 |         if (!test_and_set_bit(PG_dcache_clean, &folio->flags))
         |                                                ^~~~~~~~~~~~~
   arch/arm/include/asm/bitops.h:194:66: note: expanded from macro 'test_and_set_bit'
     194 | #define test_and_set_bit(nr,p)          ATOMIC_BITOP(test_and_set_bit,nr,p)
         |                                                                          ^
   arch/arm/include/asm/bitops.h:183:52: note: expanded from macro 'ATOMIC_BITOP'
     183 |         (__builtin_constant_p(nr) ? ____atomic_##name(nr, p) : _##name(nr,p))
         |                                                           ^
   arch/arm/include/asm/bitops.h:73:71: note: passing argument to parameter 'p' here
      73 | ____atomic_test_and_set_bit(unsigned int bit, volatile unsigned long *p)
         |                                                                       ^
>> arch/arm/mm/flush.c:307:41: error: incompatible pointer types passing 'memdesc_flags_t *' to parameter of type 'volatile unsigned long *' [-Werror,-Wincompatible-pointer-types]
     307 |         if (!test_and_set_bit(PG_dcache_clean, &folio->flags))
         |                                                ^~~~~~~~~~~~~
   arch/arm/include/asm/bitops.h:194:66: note: expanded from macro 'test_and_set_bit'
     194 | #define test_and_set_bit(nr,p)          ATOMIC_BITOP(test_and_set_bit,nr,p)
         |                                                                          ^
   arch/arm/include/asm/bitops.h:183:68: note: expanded from macro 'ATOMIC_BITOP'
     183 |         (__builtin_constant_p(nr) ? ____atomic_##name(nr, p) : _##name(nr,p))
         |                                                                           ^
   arch/arm/include/asm/bitops.h:156:63: note: passing argument to parameter 'p' here
     156 | extern int _test_and_set_bit(int nr, volatile unsigned long * p);
         |                                                               ^
>> arch/arm/mm/flush.c:346:33: error: incompatible pointer types passing 'memdesc_flags_t *' to parameter of type 'const volatile unsigned long *' [-Werror,-Wincompatible-pointer-types]
     346 |                 if (test_bit(PG_dcache_clean, &folio->flags))
         |                                               ^~~~~~~~~~~~~
   include/linux/bitops.h:60:50: note: expanded from macro 'test_bit'
      60 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                                              ^~~~
   include/linux/bitops.h:47:17: note: expanded from macro 'bitop'
      47 |          const##op(nr, addr) : op(nr, addr))
         |                        ^~~~
   include/asm-generic/bitops/generic-non-atomic.h:166:64: note: passing argument to parameter 'addr' here
     166 | const_test_bit(unsigned long nr, const volatile unsigned long *addr)
         |                                                                ^
>> arch/arm/mm/flush.c:346:33: error: incompatible pointer types passing 'memdesc_flags_t *' to parameter of type 'const volatile unsigned long *' [-Werror,-Wincompatible-pointer-types]
     346 |                 if (test_bit(PG_dcache_clean, &folio->flags))
         |                                               ^~~~~~~~~~~~~
   include/linux/bitops.h:60:50: note: expanded from macro 'test_bit'
      60 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                                              ^~~~
   include/linux/bitops.h:47:32: note: expanded from macro 'bitop'
      47 |          const##op(nr, addr) : op(nr, addr))
         |                                       ^~~~
   include/asm-generic/bitops/generic-non-atomic.h:121:66: note: passing argument to parameter 'addr' here
     121 | generic_test_bit(unsigned long nr, const volatile unsigned long *addr)
         |                                                                  ^
   arch/arm/mm/flush.c:347:31: error: incompatible pointer types passing 'memdesc_flags_t *' to parameter of type 'volatile unsigned long *' [-Werror,-Wincompatible-pointer-types]
     347 |                         clear_bit(PG_dcache_clean, &folio->flags);
         |                                                    ^~~~~~~~~~~~~
   arch/arm/include/asm/bitops.h:192:53: note: expanded from macro 'clear_bit'
     192 | #define clear_bit(nr,p)                 ATOMIC_BITOP(clear_bit,nr,p)
         |                                                                   ^
   arch/arm/include/asm/bitops.h:183:52: note: expanded from macro 'ATOMIC_BITOP'
     183 |         (__builtin_constant_p(nr) ? ____atomic_##name(nr, p) : _##name(nr,p))
         |                                                           ^
   arch/arm/include/asm/bitops.h:48:83: note: passing argument to parameter 'p' here
      48 | static inline void ____atomic_clear_bit(unsigned int bit, volatile unsigned long *p)
         |                                                                                   ^
   arch/arm/mm/flush.c:347:31: error: incompatible pointer types passing 'memdesc_flags_t *' to parameter of type 'volatile unsigned long *' [-Werror,-Wincompatible-pointer-types]
     347 |                         clear_bit(PG_dcache_clean, &folio->flags);
         |                                                    ^~~~~~~~~~~~~
   arch/arm/include/asm/bitops.h:192:53: note: expanded from macro 'clear_bit'
     192 | #define clear_bit(nr,p)                 ATOMIC_BITOP(clear_bit,nr,p)
         |                                                                   ^
   arch/arm/include/asm/bitops.h:183:68: note: expanded from macro 'ATOMIC_BITOP'
     183 |         (__builtin_constant_p(nr) ? ____atomic_##name(nr, p) : _##name(nr,p))
         |                                                                           ^
   arch/arm/include/asm/bitops.h:154:57: note: passing argument to parameter 'p' here
     154 | extern void _clear_bit(int nr, volatile unsigned long * p);
         |                                                         ^
   arch/arm/mm/flush.c:355:30: error: incompatible pointer types passing 'memdesc_flags_t *' to parameter of type 'volatile unsigned long *' [-Werror,-Wincompatible-pointer-types]
     355 |                 clear_bit(PG_dcache_clean, &folio->flags);
         |                                            ^~~~~~~~~~~~~
   arch/arm/include/asm/bitops.h:192:53: note: expanded from macro 'clear_bit'
     192 | #define clear_bit(nr,p)                 ATOMIC_BITOP(clear_bit,nr,p)
         |                                                                   ^
   arch/arm/include/asm/bitops.h:183:52: note: expanded from macro 'ATOMIC_BITOP'
     183 |         (__builtin_constant_p(nr) ? ____atomic_##name(nr, p) : _##name(nr,p))
         |                                                           ^
   arch/arm/include/asm/bitops.h:48:83: note: passing argument to parameter 'p' here
      48 | static inline void ____atomic_clear_bit(unsigned int bit, volatile unsigned long *p)
         |                                                                                   ^
   arch/arm/mm/flush.c:355:30: error: incompatible pointer types passing 'memdesc_flags_t *' to parameter of type 'volatile unsigned long *' [-Werror,-Wincompatible-pointer-types]
     355 |                 clear_bit(PG_dcache_clean, &folio->flags);
         |                                            ^~~~~~~~~~~~~
   arch/arm/include/asm/bitops.h:192:53: note: expanded from macro 'clear_bit'
     192 | #define clear_bit(nr,p)                 ATOMIC_BITOP(clear_bit,nr,p)
         |                                                                   ^
   arch/arm/include/asm/bitops.h:183:68: note: expanded from macro 'ATOMIC_BITOP'
     183 |         (__builtin_constant_p(nr) ? ____atomic_##name(nr, p) : _##name(nr,p))
         |                                                                           ^
   arch/arm/include/asm/bitops.h:154:57: note: passing argument to parameter 'p' here
     154 | extern void _clear_bit(int nr, volatile unsigned long * p);
         |                                                         ^
   arch/arm/mm/flush.c:362:28: error: incompatible pointer types passing 'memdesc_flags_t *' to parameter of type 'volatile unsigned long *' [-Werror,-Wincompatible-pointer-types]
     362 |                 set_bit(PG_dcache_clean, &folio->flags);
         |                                          ^~~~~~~~~~~~~
   arch/arm/include/asm/bitops.h:191:49: note: expanded from macro 'set_bit'
     191 | #define set_bit(nr,p)                   ATOMIC_BITOP(set_bit,nr,p)
         |                                                                 ^
   arch/arm/include/asm/bitops.h:183:52: note: expanded from macro 'ATOMIC_BITOP'
     183 |         (__builtin_constant_p(nr) ? ____atomic_##name(nr, p) : _##name(nr,p))
         |                                                           ^
   arch/arm/include/asm/bitops.h:36:81: note: passing argument to parameter 'p' here
      36 | static inline void ____atomic_set_bit(unsigned int bit, volatile unsigned long *p)
         |                                                                                 ^
   arch/arm/mm/flush.c:362:28: error: incompatible pointer types passing 'memdesc_flags_t *' to parameter of type 'volatile unsigned long *' [-Werror,-Wincompatible-pointer-types]
     362 |                 set_bit(PG_dcache_clean, &folio->flags);
         |                                          ^~~~~~~~~~~~~
   arch/arm/include/asm/bitops.h:191:49: note: expanded from macro 'set_bit'
     191 | #define set_bit(nr,p)                   ATOMIC_BITOP(set_bit,nr,p)
         |                                                                 ^
   arch/arm/include/asm/bitops.h:183:68: note: expanded from macro 'ATOMIC_BITOP'
     183 |         (__builtin_constant_p(nr) ? ____atomic_##name(nr, p) : _##name(nr,p))
         |                                                                           ^
   arch/arm/include/asm/bitops.h:153:55: note: passing argument to parameter 'p' here
     153 | extern void _set_bit(int nr, volatile unsigned long * p);
         |                                                       ^
   10 errors generated.
--
>> arch/arm/mm/copypage-v6.c:76:41: error: incompatible pointer types passing 'memdesc_flags_t *' to parameter of type 'volatile unsigned long *' [-Werror,-Wincompatible-pointer-types]
      76 |         if (!test_and_set_bit(PG_dcache_clean, &src->flags))
         |                                                ^~~~~~~~~~~
   arch/arm/include/asm/bitops.h:194:66: note: expanded from macro 'test_and_set_bit'
     194 | #define test_and_set_bit(nr,p)          ATOMIC_BITOP(test_and_set_bit,nr,p)
         |                                                                          ^
   arch/arm/include/asm/bitops.h:183:52: note: expanded from macro 'ATOMIC_BITOP'
     183 |         (__builtin_constant_p(nr) ? ____atomic_##name(nr, p) : _##name(nr,p))
         |                                                           ^
   arch/arm/include/asm/bitops.h:73:71: note: passing argument to parameter 'p' here
      73 | ____atomic_test_and_set_bit(unsigned int bit, volatile unsigned long *p)
         |                                                                       ^
>> arch/arm/mm/copypage-v6.c:76:41: error: incompatible pointer types passing 'memdesc_flags_t *' to parameter of type 'volatile unsigned long *' [-Werror,-Wincompatible-pointer-types]
      76 |         if (!test_and_set_bit(PG_dcache_clean, &src->flags))
         |                                                ^~~~~~~~~~~
   arch/arm/include/asm/bitops.h:194:66: note: expanded from macro 'test_and_set_bit'
     194 | #define test_and_set_bit(nr,p)          ATOMIC_BITOP(test_and_set_bit,nr,p)
         |                                                                          ^
   arch/arm/include/asm/bitops.h:183:68: note: expanded from macro 'ATOMIC_BITOP'
     183 |         (__builtin_constant_p(nr) ? ____atomic_##name(nr, p) : _##name(nr,p))
         |                                                                           ^
   arch/arm/include/asm/bitops.h:156:63: note: passing argument to parameter 'p' here
     156 | extern int _test_and_set_bit(int nr, volatile unsigned long * p);
         |                                                               ^
   2 errors generated.
--
>> arch/arm/mm/dma-mapping.c:721:30: error: incompatible pointer types passing 'memdesc_flags_t *' to parameter of type 'volatile unsigned long *' [-Werror,-Wincompatible-pointer-types]
     721 |                                 set_bit(PG_dcache_clean, &folio->flags);
         |                                                          ^~~~~~~~~~~~~
   arch/arm/include/asm/bitops.h:191:49: note: expanded from macro 'set_bit'
     191 | #define set_bit(nr,p)                   ATOMIC_BITOP(set_bit,nr,p)
         |                                                                 ^
   arch/arm/include/asm/bitops.h:183:52: note: expanded from macro 'ATOMIC_BITOP'
     183 |         (__builtin_constant_p(nr) ? ____atomic_##name(nr, p) : _##name(nr,p))
         |                                                           ^
   arch/arm/include/asm/bitops.h:36:81: note: passing argument to parameter 'p' here
      36 | static inline void ____atomic_set_bit(unsigned int bit, volatile unsigned long *p)
         |                                                                                 ^
>> arch/arm/mm/dma-mapping.c:721:30: error: incompatible pointer types passing 'memdesc_flags_t *' to parameter of type 'volatile unsigned long *' [-Werror,-Wincompatible-pointer-types]
     721 |                                 set_bit(PG_dcache_clean, &folio->flags);
         |                                                          ^~~~~~~~~~~~~
   arch/arm/include/asm/bitops.h:191:49: note: expanded from macro 'set_bit'
     191 | #define set_bit(nr,p)                   ATOMIC_BITOP(set_bit,nr,p)
         |                                                                 ^
   arch/arm/include/asm/bitops.h:183:68: note: expanded from macro 'ATOMIC_BITOP'
     183 |         (__builtin_constant_p(nr) ? ____atomic_##name(nr, p) : _##name(nr,p))
         |                                                                           ^
   arch/arm/include/asm/bitops.h:153:55: note: passing argument to parameter 'p' here
     153 | extern void _set_bit(int nr, volatile unsigned long * p);
         |                                                       ^
   2 errors generated.


vim +307 arch/arm/mm/flush.c

^1da177e4c3f415 Linus Torvalds          2005-04-16  283  
6012191aa9c6fff Catalin Marinas         2010-09-13  284  #if __LINUX_ARM_ARCH__ >= 6
6012191aa9c6fff Catalin Marinas         2010-09-13  285  void __sync_icache_dcache(pte_t pteval)
6012191aa9c6fff Catalin Marinas         2010-09-13  286  {
6012191aa9c6fff Catalin Marinas         2010-09-13  287  	unsigned long pfn;
8b5989f33337172 Matthew Wilcox (Oracle  2023-08-02  288) 	struct folio *folio;
6012191aa9c6fff Catalin Marinas         2010-09-13  289  	struct address_space *mapping;
6012191aa9c6fff Catalin Marinas         2010-09-13  290  
6012191aa9c6fff Catalin Marinas         2010-09-13  291  	if (cache_is_vipt_nonaliasing() && !pte_exec(pteval))
6012191aa9c6fff Catalin Marinas         2010-09-13  292  		/* only flush non-aliasing VIPT caches for exec mappings */
6012191aa9c6fff Catalin Marinas         2010-09-13  293  		return;
6012191aa9c6fff Catalin Marinas         2010-09-13  294  	pfn = pte_pfn(pteval);
6012191aa9c6fff Catalin Marinas         2010-09-13  295  	if (!pfn_valid(pfn))
6012191aa9c6fff Catalin Marinas         2010-09-13  296  		return;
6012191aa9c6fff Catalin Marinas         2010-09-13  297  
8b5989f33337172 Matthew Wilcox (Oracle  2023-08-02  298) 	folio = page_folio(pfn_to_page(pfn));
0c66c6f4e21cb22 Yongqiang Liu           2024-03-07  299  	if (folio_test_reserved(folio))
0c66c6f4e21cb22 Yongqiang Liu           2024-03-07  300  		return;
0c66c6f4e21cb22 Yongqiang Liu           2024-03-07  301  
6012191aa9c6fff Catalin Marinas         2010-09-13  302  	if (cache_is_vipt_aliasing())
8b5989f33337172 Matthew Wilcox (Oracle  2023-08-02  303) 		mapping = folio_flush_mapping(folio);
6012191aa9c6fff Catalin Marinas         2010-09-13  304  	else
6012191aa9c6fff Catalin Marinas         2010-09-13  305  		mapping = NULL;
6012191aa9c6fff Catalin Marinas         2010-09-13  306  
8b5989f33337172 Matthew Wilcox (Oracle  2023-08-02 @307) 	if (!test_and_set_bit(PG_dcache_clean, &folio->flags))
8b5989f33337172 Matthew Wilcox (Oracle  2023-08-02  308) 		__flush_dcache_folio(mapping, folio);
8373dc38ca8d491 saeed bishara           2011-05-16  309  
8373dc38ca8d491 saeed bishara           2011-05-16  310  	if (pte_exec(pteval))
6012191aa9c6fff Catalin Marinas         2010-09-13  311  		__flush_icache_all();
6012191aa9c6fff Catalin Marinas         2010-09-13  312  }
6012191aa9c6fff Catalin Marinas         2010-09-13  313  #endif
6012191aa9c6fff Catalin Marinas         2010-09-13  314  
^1da177e4c3f415 Linus Torvalds          2005-04-16  315  /*
^1da177e4c3f415 Linus Torvalds          2005-04-16  316   * Ensure cache coherency between kernel mapping and userspace mapping
^1da177e4c3f415 Linus Torvalds          2005-04-16  317   * of this page.
^1da177e4c3f415 Linus Torvalds          2005-04-16  318   *
^1da177e4c3f415 Linus Torvalds          2005-04-16  319   * We have three cases to consider:
^1da177e4c3f415 Linus Torvalds          2005-04-16  320   *  - VIPT non-aliasing cache: fully coherent so nothing required.
^1da177e4c3f415 Linus Torvalds          2005-04-16  321   *  - VIVT: fully aliasing, so we need to handle every alias in our
^1da177e4c3f415 Linus Torvalds          2005-04-16  322   *          current VM view.
^1da177e4c3f415 Linus Torvalds          2005-04-16  323   *  - VIPT aliasing: need to handle one alias in our current VM view.
^1da177e4c3f415 Linus Torvalds          2005-04-16  324   *
^1da177e4c3f415 Linus Torvalds          2005-04-16  325   * If we need to handle aliasing:
^1da177e4c3f415 Linus Torvalds          2005-04-16  326   *  If the page only exists in the page cache and there are no user
^1da177e4c3f415 Linus Torvalds          2005-04-16  327   *  space mappings, we can be lazy and remember that we may have dirty
^1da177e4c3f415 Linus Torvalds          2005-04-16  328   *  kernel cache lines for later.  Otherwise, we assume we have
^1da177e4c3f415 Linus Torvalds          2005-04-16  329   *  aliasing mappings.
df2f5e721ed36e2 Russell King            2005-11-30  330   *
31bee4cf0e74e9c saeed bishara           2011-05-16  331   * Note that we disable the lazy flush for SMP configurations where
31bee4cf0e74e9c saeed bishara           2011-05-16  332   * the cache maintenance operations are not automatically broadcasted.
^1da177e4c3f415 Linus Torvalds          2005-04-16  333   */
8b5989f33337172 Matthew Wilcox (Oracle  2023-08-02  334) void flush_dcache_folio(struct folio *folio)
^1da177e4c3f415 Linus Torvalds          2005-04-16  335  {
421fe93cc4b06b2 Russell King            2009-10-25  336  	struct address_space *mapping;
421fe93cc4b06b2 Russell King            2009-10-25  337  
421fe93cc4b06b2 Russell King            2009-10-25  338  	/*
421fe93cc4b06b2 Russell King            2009-10-25  339  	 * The zero page is never written to, so never has any dirty
421fe93cc4b06b2 Russell King            2009-10-25  340  	 * cache lines, and therefore never needs to be flushed.
421fe93cc4b06b2 Russell King            2009-10-25  341  	 */
8b5989f33337172 Matthew Wilcox (Oracle  2023-08-02  342) 	if (is_zero_pfn(folio_pfn(folio)))
421fe93cc4b06b2 Russell King            2009-10-25  343  		return;
421fe93cc4b06b2 Russell King            2009-10-25  344  
00a19f3e25c0c40 Rabin Vincent           2016-11-08  345  	if (!cache_ops_need_broadcast() && cache_is_vipt_nonaliasing()) {
8b5989f33337172 Matthew Wilcox (Oracle  2023-08-02 @346) 		if (test_bit(PG_dcache_clean, &folio->flags))
8b5989f33337172 Matthew Wilcox (Oracle  2023-08-02  347) 			clear_bit(PG_dcache_clean, &folio->flags);
00a19f3e25c0c40 Rabin Vincent           2016-11-08  348  		return;
00a19f3e25c0c40 Rabin Vincent           2016-11-08  349  	}
00a19f3e25c0c40 Rabin Vincent           2016-11-08  350  
8b5989f33337172 Matthew Wilcox (Oracle  2023-08-02  351) 	mapping = folio_flush_mapping(folio);
^1da177e4c3f415 Linus Torvalds          2005-04-16  352  
85848dd7ab75fce Catalin Marinas         2010-09-13  353  	if (!cache_ops_need_broadcast() &&
8b5989f33337172 Matthew Wilcox (Oracle  2023-08-02  354) 	    mapping && !folio_mapped(folio))
8b5989f33337172 Matthew Wilcox (Oracle  2023-08-02  355) 		clear_bit(PG_dcache_clean, &folio->flags);
85848dd7ab75fce Catalin Marinas         2010-09-13  356  	else {
8b5989f33337172 Matthew Wilcox (Oracle  2023-08-02  357) 		__flush_dcache_folio(mapping, folio);
8830f04a092b47f Russell King            2005-06-20  358  		if (mapping && cache_is_vivt())
8b5989f33337172 Matthew Wilcox (Oracle  2023-08-02  359) 			__flush_dcache_aliases(mapping, folio);
826cbdaff29764b Catalin Marinas         2008-06-13  360  		else if (mapping)
826cbdaff29764b Catalin Marinas         2008-06-13  361  			__flush_icache_all();
8b5989f33337172 Matthew Wilcox (Oracle  2023-08-02  362) 		set_bit(PG_dcache_clean, &folio->flags);
8830f04a092b47f Russell King            2005-06-20  363  	}
^1da177e4c3f415 Linus Torvalds          2005-04-16  364  }
8b5989f33337172 Matthew Wilcox (Oracle  2023-08-02  365) EXPORT_SYMBOL(flush_dcache_folio);
6020dff09252e36 Russell King            2006-12-30  366  

:::::: The code at line 307 was first introduced by commit
:::::: 8b5989f3333717273d02ab87ba8781f72a6783ab arm: implement the new page table range API

:::::: TO: Matthew Wilcox (Oracle) <willy@infradead.org>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
