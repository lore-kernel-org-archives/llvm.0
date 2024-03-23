Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F2247F7A;
	Sat, 23 Mar 2024 17:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711214713; cv=none; b=AiFiG/w/vhGa14WeYqtUu6KcEpCj8FVzml0TID9N3NFGgQbEnZHYd8WXYfYWP3YSIdVUk/Sc3Z3V/jFdlrmSVPYQOCYGF7x0pEnCxCgiiHtQACwquUrmrfCD/TzrwLlNkoURQ8PX6wRPKPDvg57cH9vveE3YoYN68VHilevecHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711214713; c=relaxed/simple;
	bh=hviwBbuUr8hjaMvZWjLfwOXvR7XIaZxob1bgRLPS9ig=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Px3/AqDZSR5C2wRqY5JMN9novEBQ6W4aV/fFifcfHlTN9g6n9MnQtkTkBh+xRGmwXPGtlFmG1REiNl3hu+TWkCUiqqeVzeXxgsoX0TxA7N2t50qlWJZB5QwI2H09bSwEDC1KOz6iFlVu7hJiyMy8Zn0PnbY/+9FG2BxsVB4SY4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Udm8pLac; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Udm8pLac"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711214712; x=1742750712;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hviwBbuUr8hjaMvZWjLfwOXvR7XIaZxob1bgRLPS9ig=;
  b=Udm8pLac3CTA9dzN7B+sPDRZ22IxuatbzPjZqglPm/rLJL3U3wP461NZ
   bIDyD1SYOx6srSZhhA85y4W3BqtT/+7Fdv1YPmZfux5HbJnam0V+7Xm2A
   /hdXzCBksxhmRtbbdp79JyUt04e06JUH3rniaICbd2NApbGbLJzJsRiWR
   ipZmbSnTxcj38RDxDScIjqAbKdWeIVAvpyi/dj09sK9DzGd8L/R70/bDQ
   hZ3/ENiOsSnfvcmCtAm4bI6QriBfptgPrrilFlARzHmkuI5ECuLLhngC3
   LYO7S4VGsVaV+SNAcjRkKVRuZbrCwJKc3Y8DAwmv4e5r4Xk6/BK/CcAoY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11022"; a="17395657"
X-IronPort-AV: E=Sophos;i="6.07,149,1708416000"; 
   d="scan'208";a="17395657"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2024 10:25:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,149,1708416000"; 
   d="scan'208";a="52658717"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 23 Mar 2024 10:25:09 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ro57C-000LMX-25;
	Sat, 23 Mar 2024 17:25:06 +0000
Date: Sun, 24 Mar 2024 01:24:25 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Xu <peterx@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [akpm-mm:mm-unstable 115/141] mm/gup.c:536:22: error: call to
 undeclared function 'pud_pfn'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202403240112.kHKVSfCL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   af520f81c51001f7ccdf0579fc73df282b26292d
commit: 529f3b89b7333564792458ca7be06f5bff258d23 [115/141] mm/gup: handle huge pud for follow_pud_mask()
config: powerpc-tqm8xx_defconfig (https://download.01.org/0day-ci/archive/20240324/202403240112.kHKVSfCL-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 23de3862dce582ce91c1aa914467d982cb1a73b4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240324/202403240112.kHKVSfCL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403240112.kHKVSfCL-lkp@intel.com/

All errors (new ones prefixed by >>):

     209 | __do_insw
         | ^
   arch/powerpc/include/asm/io.h:610:56: note: expanded from macro '__do_insw'
     610 | #define __do_insw(p, b, n)      readsw((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
         |                                        ~~~~~~~~~~~~~~~~~~~~~^
   In file included from mm/gup.c:9:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:672:
   arch/powerpc/include/asm/io-defs.h:47:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      47 | DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      48 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:669:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     669 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:211:1: note: expanded from here
     211 | __do_insl
         | ^
   arch/powerpc/include/asm/io.h:611:56: note: expanded from macro '__do_insl'
     611 | #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
         |                                        ~~~~~~~~~~~~~~~~~~~~~^
   In file included from mm/gup.c:9:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:672:
   arch/powerpc/include/asm/io-defs.h:49:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      49 | DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      50 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:669:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     669 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:213:1: note: expanded from here
     213 | __do_outsb
         | ^
   arch/powerpc/include/asm/io.h:612:58: note: expanded from macro '__do_outsb'
     612 | #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
         |                                         ~~~~~~~~~~~~~~~~~~~~~^
   In file included from mm/gup.c:9:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:672:
   arch/powerpc/include/asm/io-defs.h:51:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      51 | DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      52 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:669:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     669 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:215:1: note: expanded from here
     215 | __do_outsw
         | ^
   arch/powerpc/include/asm/io.h:613:58: note: expanded from macro '__do_outsw'
     613 | #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
         |                                         ~~~~~~~~~~~~~~~~~~~~~^
   In file included from mm/gup.c:9:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:672:
   arch/powerpc/include/asm/io-defs.h:53:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      53 | DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      54 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:669:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     669 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:217:1: note: expanded from here
     217 | __do_outsl
         | ^
   arch/powerpc/include/asm/io.h:614:58: note: expanded from macro '__do_outsl'
     614 | #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
         |                                         ~~~~~~~~~~~~~~~~~~~~~^
   In file included from mm/gup.c:19:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
>> mm/gup.c:536:22: error: call to undeclared function 'pud_pfn'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     536 |         unsigned long pfn = pud_pfn(pud);
         |                             ^
   mm/gup.c:536:22: note: did you mean 'pte_pfn'?
   arch/powerpc/include/asm/pgtable.h:60:29: note: 'pte_pfn' declared here
      60 | static inline unsigned long pte_pfn(pte_t pte)
         |                             ^
   9 warnings and 1 error generated.


vim +/pud_pfn +536 mm/gup.c

   527	
   528	#ifdef CONFIG_PGTABLE_HAS_HUGE_LEAVES
   529	static struct page *follow_huge_pud(struct vm_area_struct *vma,
   530					    unsigned long addr, pud_t *pudp,
   531					    int flags, struct follow_page_context *ctx)
   532	{
   533		struct mm_struct *mm = vma->vm_mm;
   534		struct page *page;
   535		pud_t pud = *pudp;
 > 536		unsigned long pfn = pud_pfn(pud);
   537		int ret;
   538	
   539		assert_spin_locked(pud_lockptr(mm, pudp));
   540	
   541		if ((flags & FOLL_WRITE) && !pud_write(pud))
   542			return NULL;
   543	
   544		if (!pud_present(pud))
   545			return NULL;
   546	
   547		pfn += (addr & ~PUD_MASK) >> PAGE_SHIFT;
   548	
   549		if (IS_ENABLED(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD) &&
   550		    pud_devmap(pud)) {
   551			/*
   552			 * device mapped pages can only be returned if the caller
   553			 * will manage the page reference count.
   554			 *
   555			 * At least one of FOLL_GET | FOLL_PIN must be set, so
   556			 * assert that here:
   557			 */
   558			if (!(flags & (FOLL_GET | FOLL_PIN)))
   559				return ERR_PTR(-EEXIST);
   560	
   561			if (flags & FOLL_TOUCH)
   562				touch_pud(vma, addr, pudp, flags & FOLL_WRITE);
   563	
   564			ctx->pgmap = get_dev_pagemap(pfn, ctx->pgmap);
   565			if (!ctx->pgmap)
   566				return ERR_PTR(-EFAULT);
   567		}
   568	
   569		page = pfn_to_page(pfn);
   570	
   571		if (!pud_devmap(pud) && !pud_write(pud) &&
   572		    gup_must_unshare(vma, flags, page))
   573			return ERR_PTR(-EMLINK);
   574	
   575		ret = try_grab_page(page, flags);
   576		if (ret)
   577			page = ERR_PTR(ret);
   578		else
   579			ctx->page_mask = HPAGE_PUD_NR - 1;
   580	
   581		return page;
   582	}
   583	#else  /* CONFIG_PGTABLE_HAS_HUGE_LEAVES */
   584	static struct page *follow_huge_pud(struct vm_area_struct *vma,
   585					    unsigned long addr, pud_t *pudp,
   586					    int flags, struct follow_page_context *ctx)
   587	{
   588		return NULL;
   589	}
   590	#endif	/* CONFIG_PGTABLE_HAS_HUGE_LEAVES */
   591	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
