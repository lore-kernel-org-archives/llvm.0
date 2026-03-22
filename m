Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A65426ADC;
	Sun, 22 Mar 2026 14:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774190839; cv=none; b=YDUl9w0Xbz6gnRAE6NvSH9oQXkoYtvOoYXAguprtLWqHV1KoOWp83X1jO9cNKMVf0VA0infS8T2FUiRvjPM4caV73+Fqop4NZS6HMnYpl68fcF03sEjgEAe1lOnf/cNdo/K57anW16HzD7iukj6P+7hFz2RtArq39HG+tLBGaPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774190839; c=relaxed/simple;
	bh=0rPM/QFpeItLYgRc1VGdoRBYgTiw8+4jXGQZSkq5dbE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hwtT9sro8nXnhmDRG8yDEZZsYP1Vy/7eTxJq6F4GG0Yx3KGlwpQ8wo+8wN3hctP8UntmEE5e4N9DPN9VeOCE8krw8PgQyS0Pficy5UgfMlb0fIKklea/MaIcZ/IPo0NAqIcQEuEsaRD0Iz2Jnv9q6DqEDr+aFJFuKeln4OJpakM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j8reqjwU; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j8reqjwU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774190837; x=1805726837;
  h=date:from:to:cc:subject:message-id;
  bh=0rPM/QFpeItLYgRc1VGdoRBYgTiw8+4jXGQZSkq5dbE=;
  b=j8reqjwU3Ihq/p1z6qqwalsj+1a8mXGaZn3Vt2wNGZXTuZ6xKMMGdOEv
   7koi9VQEAfOK1UagtySP4wRCZGsPn1LFX8LWru7tkc1Vh7HpFU/R6phdV
   9HkK9k3Zoomq9dxoFEoj2JRV6WvHKj+7x5d2nQhk4AEN+r3mtKl7w6Cba
   y3oDavq6S6VrAzKUbcy0qq9UXcaj/fMbw0EiJcg6rlKjTeIN6seWpTZyX
   RL2i1q/FZdis+LkWixu1WdXDL8kwPLJyFmC6U3IIG/9AwwBgvwIBsMtQi
   aXTMUeB/R4xen++lx6KEaStrI01Z0FQrTEGJoNZQt4TzNe+w8PShXUgSm
   w==;
X-CSE-ConnectionGUID: xZPMQJjATBe0nfzHih/RBw==
X-CSE-MsgGUID: mhJd/piKQMO0oVeGA/OEXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="74229808"
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="74229808"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 07:47:16 -0700
X-CSE-ConnectionGUID: FIZ74FNISbWCdi1ea8E5VA==
X-CSE-MsgGUID: RDoPgZqlSu2mwXegPXcRpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="228505606"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 22 Mar 2026 07:47:14 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4K5A-000000002Ff-0TeX;
	Sun, 22 Mar 2026 14:47:12 +0000
Date: Sun, 22 Mar 2026 22:46:22 +0800
From: kernel test robot <lkp@intel.com>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [kas:pte_size 17/30] include/linux/mm.h:2269:9: error:
 expected ';' at end of declaration
Message-ID: <202603222223.z0rhzy0Y-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git pte_size
head:   3ecd2bc82d7d0382233099de8d07616df26745c4
commit: 28dbc88fd3353ba1e303dbfbd351218964beef77 [17/30] mm: Update memory model macros to support PTE_SIZE units
config: arm-randconfig-004-20260322 (https://download.01.org/0day-ci/archive/20260322/202603222223.z0rhzy0Y-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 4abb927bacf37f18f6359a41639a6d1b3bffffb5)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260322/202603222223.z0rhzy0Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603222223.z0rhzy0Y-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm/kernel/asm-offsets.c:14:
>> include/linux/mm.h:2269:9: error: expected ';' at end of declaration
    2269 |         return page_to_pfn(&folio->page);
         |                ^
   include/asm-generic/memory_model.h:81:21: note: expanded from macro 'page_to_pfn'
      81 | #define page_to_pfn __page_to_pfn
         |                     ^
   include/asm-generic/memory_model.h:62:16: note: expanded from macro '__page_to_pfn'
      62 |         unsigned logn __ret;                                            \
         |                       ^
   In file included from arch/arm/kernel/asm-offsets.c:14:
>> include/linux/mm.h:2269:9: error: use of undeclared identifier '__ret'
    2269 |         return page_to_pfn(&folio->page);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:81:21: note: expanded from macro 'page_to_pfn'
      81 | #define page_to_pfn __page_to_pfn
         |                     ^
   include/asm-generic/memory_model.h:63:2: note: expanded from macro '__page_to_pfn'
      63 |         __ret = (unsigned long)(__pg -                                  \
         |         ^~~~~
   In file included from arch/arm/kernel/asm-offsets.c:14:
>> include/linux/mm.h:2269:9: error: use of undeclared identifier '__ret'
    2269 |         return page_to_pfn(&folio->page);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:81:21: note: expanded from macro 'page_to_pfn'
      81 | #define page_to_pfn __page_to_pfn
         |                     ^
   include/asm-generic/memory_model.h:65:16: note: expanded from macro '__page_to_pfn'
      65 |         PAGES_TO_PTES(__ret)                                            \
         |                       ^~~~~
   In file included from arch/arm/kernel/asm-offsets.c:14:
   include/linux/mm.h:2290:17: error: expected ';' at end of declaration
    2290 |         return pfn_pte(page_to_pfn(page) + off, pgprot);
         |                        ^
   include/asm-generic/memory_model.h:81:21: note: expanded from macro 'page_to_pfn'
      81 | #define page_to_pfn __page_to_pfn
         |                     ^
   include/asm-generic/memory_model.h:62:16: note: expanded from macro '__page_to_pfn'
      62 |         unsigned logn __ret;                                            \
         |                       ^
   In file included from arch/arm/kernel/asm-offsets.c:14:
   include/linux/mm.h:2290:17: error: use of undeclared identifier '__ret'
    2290 |         return pfn_pte(page_to_pfn(page) + off, pgprot);
         |                        ^~~~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:81:21: note: expanded from macro 'page_to_pfn'
      81 | #define page_to_pfn __page_to_pfn
         |                     ^
   include/asm-generic/memory_model.h:63:2: note: expanded from macro '__page_to_pfn'
      63 |         __ret = (unsigned long)(__pg -                                  \
         |         ^~~~~
   In file included from arch/arm/kernel/asm-offsets.c:14:
   include/linux/mm.h:2290:17: error: use of undeclared identifier '__ret'
    2290 |         return pfn_pte(page_to_pfn(page) + off, pgprot);
         |                        ^~~~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:81:21: note: expanded from macro 'page_to_pfn'
      81 | #define page_to_pfn __page_to_pfn
         |                     ^
   include/asm-generic/memory_model.h:65:16: note: expanded from macro '__page_to_pfn'
      65 |         PAGES_TO_PTES(__ret)                                            \
         |                       ^~~~~
   In file included from arch/arm/kernel/asm-offsets.c:14:
   include/linux/mm.h:2433:21: error: expected ';' at end of declaration
    2433 |         return is_zero_pfn(page_to_pfn(page));
         |                            ^
   include/asm-generic/memory_model.h:81:21: note: expanded from macro 'page_to_pfn'
      81 | #define page_to_pfn __page_to_pfn
         |                     ^
   include/asm-generic/memory_model.h:62:16: note: expanded from macro '__page_to_pfn'
      62 |         unsigned logn __ret;                                            \
         |                       ^
   In file included from arch/arm/kernel/asm-offsets.c:14:
   include/linux/mm.h:2433:21: error: use of undeclared identifier '__ret'
    2433 |         return is_zero_pfn(page_to_pfn(page));
         |                            ^~~~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:81:21: note: expanded from macro 'page_to_pfn'
      81 | #define page_to_pfn __page_to_pfn
         |                     ^
   include/asm-generic/memory_model.h:63:2: note: expanded from macro '__page_to_pfn'
      63 |         __ret = (unsigned long)(__pg -                                  \
         |         ^~~~~
   In file included from arch/arm/kernel/asm-offsets.c:14:
   include/linux/mm.h:2433:21: error: use of undeclared identifier '__ret'
    2433 |         return is_zero_pfn(page_to_pfn(page));
         |                            ^~~~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:81:21: note: expanded from macro 'page_to_pfn'
      81 | #define page_to_pfn __page_to_pfn
         |                     ^
   include/asm-generic/memory_model.h:65:16: note: expanded from macro '__page_to_pfn'
      65 |         PAGES_TO_PTES(__ret)                                            \
         |                       ^~~~~
   In file included from arch/arm/kernel/asm-offsets.c:14:
   include/linux/mm.h:2766:9: error: expected ';' at end of declaration
    2766 |         return page_to_virt(page);
         |                ^
   include/linux/mm.h:121:39: note: expanded from macro 'page_to_virt'
     121 | #define page_to_virt(x) __va(PFN_PHYS(page_to_pfn(x)))
         |                                       ^
   include/asm-generic/memory_model.h:81:21: note: expanded from macro 'page_to_pfn'
      81 | #define page_to_pfn __page_to_pfn
         |                     ^
   include/asm-generic/memory_model.h:62:16: note: expanded from macro '__page_to_pfn'
      62 |         unsigned logn __ret;                                            \
         |                       ^
   In file included from arch/arm/kernel/asm-offsets.c:14:
   include/linux/mm.h:2766:9: error: use of undeclared identifier '__ret'
    2766 |         return page_to_virt(page);
         |                ^~~~~~~~~~~~~~~~~~
   include/linux/mm.h:121:39: note: expanded from macro 'page_to_virt'
     121 | #define page_to_virt(x) __va(PFN_PHYS(page_to_pfn(x)))
         |                                       ^~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:81:21: note: expanded from macro 'page_to_pfn'
      81 | #define page_to_pfn __page_to_pfn
         |                     ^
   include/asm-generic/memory_model.h:63:2: note: expanded from macro '__page_to_pfn'
      63 |         __ret = (unsigned long)(__pg -                                  \
         |         ^~~~~
   In file included from arch/arm/kernel/asm-offsets.c:14:
   include/linux/mm.h:2766:9: error: use of undeclared identifier '__ret'
    2766 |         return page_to_virt(page);
         |                ^~~~~~~~~~~~~~~~~~
   include/linux/mm.h:121:39: note: expanded from macro 'page_to_virt'
     121 | #define page_to_virt(x) __va(PFN_PHYS(page_to_pfn(x)))
         |                                       ^~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:81:21: note: expanded from macro 'page_to_pfn'
      81 | #define page_to_pfn __page_to_pfn
         |                     ^
   include/asm-generic/memory_model.h:65:16: note: expanded from macro '__page_to_pfn'
      65 |         PAGES_TO_PTES(__ret)                                            \
         |                       ^~~~~
   In file included from arch/arm/kernel/asm-offsets.c:15:
   In file included from include/linux/dma-mapping.h:8:
>> include/linux/scatterlist.h:412:9: error: expected ';' at end of declaration
     412 |         return page_to_phys(sg_page(sg)) + sg->offset;
         |                ^
   include/asm-generic/memory_model.h:93:37: note: expanded from macro 'page_to_phys'
      93 | #define page_to_phys(page)      PFN_PHYS(page_to_pfn(page))
         |                                          ^
   include/asm-generic/memory_model.h:81:21: note: expanded from macro 'page_to_pfn'
      81 | #define page_to_pfn __page_to_pfn
         |                     ^
   include/asm-generic/memory_model.h:62:16: note: expanded from macro '__page_to_pfn'
      62 |         unsigned logn __ret;                                            \
         |                       ^
   In file included from arch/arm/kernel/asm-offsets.c:15:
   In file included from include/linux/dma-mapping.h:8:
>> include/linux/scatterlist.h:412:9: error: use of undeclared identifier '__ret'
     412 |         return page_to_phys(sg_page(sg)) + sg->offset;
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:93:37: note: expanded from macro 'page_to_phys'
      93 | #define page_to_phys(page)      PFN_PHYS(page_to_pfn(page))
         |                                          ^~~~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:81:21: note: expanded from macro 'page_to_pfn'
      81 | #define page_to_pfn __page_to_pfn
         |                     ^
   include/asm-generic/memory_model.h:63:2: note: expanded from macro '__page_to_pfn'
      63 |         __ret = (unsigned long)(__pg -                                  \
         |         ^~~~~
   In file included from arch/arm/kernel/asm-offsets.c:15:
   In file included from include/linux/dma-mapping.h:8:
>> include/linux/scatterlist.h:412:9: error: use of undeclared identifier '__ret'
     412 |         return page_to_phys(sg_page(sg)) + sg->offset;
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:93:37: note: expanded from macro 'page_to_phys'
      93 | #define page_to_phys(page)      PFN_PHYS(page_to_pfn(page))
         |                                          ^~~~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:81:21: note: expanded from macro 'page_to_pfn'
      81 | #define page_to_pfn __page_to_pfn
         |                     ^
   include/asm-generic/memory_model.h:65:16: note: expanded from macro '__page_to_pfn'
      65 |         PAGES_TO_PTES(__ret)                                            \
         |                       ^~~~~
   15 errors generated.
   make[3]: *** [scripts/Makefile.build:184: arch/arm/kernel/asm-offsets.s] Error 1 shuffle=2486654988
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1333: prepare0] Error 2 shuffle=2486654988
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=2486654988
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=2486654988
   make: Target 'prepare' not remade because of errors.


vim +2269 include/linux/mm.h

d41dee369bff3b Andy Whitcroft          2005-06-23  2257  
bf6bd276b374d4 Matthew Wilcox (Oracle  2021-05-07  2258) /**
bf6bd276b374d4 Matthew Wilcox (Oracle  2021-05-07  2259)  * folio_pfn - Return the Page Frame Number of a folio.
bf6bd276b374d4 Matthew Wilcox (Oracle  2021-05-07  2260)  * @folio: The folio.
bf6bd276b374d4 Matthew Wilcox (Oracle  2021-05-07  2261)  *
bf6bd276b374d4 Matthew Wilcox (Oracle  2021-05-07  2262)  * A folio may contain multiple pages.  The pages have consecutive
bf6bd276b374d4 Matthew Wilcox (Oracle  2021-05-07  2263)  * Page Frame Numbers.
bf6bd276b374d4 Matthew Wilcox (Oracle  2021-05-07  2264)  *
bf6bd276b374d4 Matthew Wilcox (Oracle  2021-05-07  2265)  * Return: The Page Frame Number of the first page in the folio.
bf6bd276b374d4 Matthew Wilcox (Oracle  2021-05-07  2266)  */
f7470591f8db1a Matthew Wilcox (Oracle  2024-10-05  2267) static inline unsigned long folio_pfn(const struct folio *folio)
bf6bd276b374d4 Matthew Wilcox (Oracle  2021-05-07  2268) {
bf6bd276b374d4 Matthew Wilcox (Oracle  2021-05-07 @2269) 	return page_to_pfn(&folio->page);
bf6bd276b374d4 Matthew Wilcox (Oracle  2021-05-07  2270) }
bf6bd276b374d4 Matthew Wilcox (Oracle  2021-05-07  2271) 

:::::: The code at line 2269 was first introduced by commit
:::::: bf6bd276b374d44f6e7146d52aa6097eb91384a3 mm: Add folio_pfn()

:::::: TO: Matthew Wilcox (Oracle) <willy@infradead.org>
:::::: CC: Matthew Wilcox (Oracle) <willy@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
