Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FDF24394A;
	Sat,  8 Feb 2025 22:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739052553; cv=none; b=hYp8rBQdSYxYKPJ0uYTpAfuRCOLDdUIkLxn570hOX9xs00RT9276Cp2b1SxRjpGcwvnaAUefAvgkPxlnvsEdMg9QKbpQpM9Y3etQMRv2n1CbcXk57L3bzThjm/QFu1TROW3PRxrL9g3Dqj9BZhLRpVOrGhjN6STtrdy7tMjeJy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739052553; c=relaxed/simple;
	bh=UV9sDrgln9zZpxrpQLq98uvGtaUJc/WhUme5y5Ae+vQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gMlAY33QpTjkVIlzok1p7r2k6UWzLrK0yn42Kc4mLTSVOVm/PK1HB2obW1S8SYNUQ5VQS/jAW7K1IfNfuMH2OPxTXNPDoIDanSC6ljdpMQibIlr/NF1K5VRjAb7RQS+jtXTsPXweKMr3CoH5Gis9sD01bjYyKMmv17EdoPhlsks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EFuxLY9c; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EFuxLY9c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739052550; x=1770588550;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UV9sDrgln9zZpxrpQLq98uvGtaUJc/WhUme5y5Ae+vQ=;
  b=EFuxLY9c7KWujUxYINg8zxo41bWoXD0tNX06Hkzt6D+p3evhBeG9FoIx
   TQ4+7NG5tEk4hg8ZbHIkiRL7oFXGSHG56PnCE/uESjcvGB/42WM8t3hza
   oH34cBBFU1Qg/dhXTHyuaqWZFUNOsvwKJJy/hcpJ61VncgkQug4M33uqa
   2msAymk0j8YRf8eJmnNBBL0sS9KLirZjKOF8XhK6NUbproPDggKA9JXnr
   U43df1464uyssMomo9ITUI9RLwG5A7/7ChU2CTdYnTfWjfeQVpWbqCaJO
   mBdRneXkRHxOBRfDTpHePfDnd+Vad1jakUjU/N+kl6BYO2Kg/W74WGxi0
   w==;
X-CSE-ConnectionGUID: d8A4sEUmSj6kUhyD8rWT5w==
X-CSE-MsgGUID: EJsrhewISnaf2jfiZWt3RQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="43330786"
X-IronPort-AV: E=Sophos;i="6.13,271,1732608000"; 
   d="scan'208";a="43330786"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 14:09:09 -0800
X-CSE-ConnectionGUID: pRSQ97laQymrPrpxHEHMEw==
X-CSE-MsgGUID: ywoP/0QwSwWyHxoH92sxzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,271,1732608000"; 
   d="scan'208";a="116882761"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 Feb 2025 14:09:08 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgt0c-0010h5-1C;
	Sat, 08 Feb 2025 22:09:06 +0000
Date: Sun, 9 Feb 2025 06:08:26 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:time_stats_sched 63/63]
 include/asm-generic/pgalloc.h:112:2: error: call to undeclared function
 'pagetable_dtor_free'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202502090524.WcPTOmwj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs time_stats_sched
head:   d9b1e57f3b38d16fdd7177f3b9636dcbb4c749ed
commit: d9b1e57f3b38d16fdd7177f3b9636dcbb4c749ed [63/63] sched_wakeup_backtrace debugfs
config: hexagon-randconfig-002-20250209 (https://download.01.org/0day-ci/archive/20250209/202502090524.WcPTOmwj-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 6807164500e9920638e2ab0cdb4bf8321d24f8eb)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250209/202502090524.WcPTOmwj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502090524.WcPTOmwj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/timestats_bt.c:6:
   In file included from include/linux/mmu_context.h:5:
   In file included from arch/hexagon/include/asm/mmu_context.h:15:
   In file included from arch/hexagon/include/asm/pgalloc.h:14:
   include/asm-generic/pgalloc.h:21:26: error: call to undeclared function 'pagetable_alloc_noprof'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      21 |         struct ptdesc *ptdesc = pagetable_alloc_noprof(GFP_PGTABLE_KERNEL &
         |                                 ^
   include/asm-generic/pgalloc.h:21:17: error: incompatible integer to pointer conversion initializing 'struct ptdesc *' with an expression of type 'int' [-Wint-conversion]
      21 |         struct ptdesc *ptdesc = pagetable_alloc_noprof(GFP_PGTABLE_KERNEL &
         |                        ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      22 |                         ~__GFP_HIGHMEM, 0);
         |                         ~~~~~~~~~~~~~~~~~~
   include/asm-generic/pgalloc.h:26:9: error: call to undeclared function 'ptdesc_address'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      26 |         return ptdesc_address(ptdesc);
         |                ^
   include/asm-generic/pgalloc.h:26:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'pte_t *' [-Wint-conversion]
      26 |         return ptdesc_address(ptdesc);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/pgalloc.h:51:2: error: call to undeclared function 'pagetable_free'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      51 |         pagetable_free(virt_to_ptdesc(pte));
         |         ^
   include/asm-generic/pgalloc.h:51:17: error: call to undeclared function 'virt_to_ptdesc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      51 |         pagetable_free(virt_to_ptdesc(pte));
         |                        ^
   include/asm-generic/pgalloc.h:51:17: note: did you mean 'irq_to_desc'?
   include/linux/irqnr.h:10:25: note: 'irq_to_desc' declared here
      10 | extern struct irq_desc *irq_to_desc(unsigned int irq);
         |                         ^
   In file included from kernel/sched/timestats_bt.c:6:
   In file included from include/linux/mmu_context.h:5:
   In file included from arch/hexagon/include/asm/mmu_context.h:15:
   In file included from arch/hexagon/include/asm/pgalloc.h:14:
   include/asm-generic/pgalloc.h:70:11: error: call to undeclared function 'pagetable_alloc_noprof'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      70 |         ptdesc = pagetable_alloc_noprof(gfp, 0);
         |                  ^
   include/asm-generic/pgalloc.h:70:9: error: incompatible integer to pointer conversion assigning to 'struct ptdesc *' from 'int' [-Wint-conversion]
      70 |         ptdesc = pagetable_alloc_noprof(gfp, 0);
         |                ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/pgalloc.h:73:7: error: call to undeclared function 'pagetable_pte_ctor'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      73 |         if (!pagetable_pte_ctor(ptdesc)) {
         |              ^
   include/asm-generic/pgalloc.h:74:3: error: call to undeclared function 'pagetable_free'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      74 |                 pagetable_free(ptdesc);
         |                 ^
>> include/asm-generic/pgalloc.h:112:2: error: call to undeclared function 'pagetable_dtor_free'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     112 |         pagetable_dtor_free(ptdesc);
         |         ^
   include/asm-generic/pgalloc.h:270:11: error: call to undeclared function 'pagetable_alloc_noprof'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     270 |         ptdesc = pagetable_alloc_noprof(gfp, order);
         |                  ^
   include/asm-generic/pgalloc.h:270:9: error: incompatible integer to pointer conversion assigning to 'struct ptdesc *' from 'int' [-Wint-conversion]
     270 |         ptdesc = pagetable_alloc_noprof(gfp, order);
         |                ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/asm-generic/pgalloc.h:274:2: error: call to undeclared function 'pagetable_pgd_ctor'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     274 |         pagetable_pgd_ctor(ptdesc);
         |         ^
   include/asm-generic/pgalloc.h:275:9: error: call to undeclared function 'ptdesc_address'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     275 |         return ptdesc_address(ptdesc);
         |                ^
>> include/asm-generic/pgalloc.h:275:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'pgd_t *' [-Wint-conversion]
     275 |         return ptdesc_address(ptdesc);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/pgalloc.h:281:26: error: call to undeclared function 'virt_to_ptdesc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     281 |         struct ptdesc *ptdesc = virt_to_ptdesc(pgd);
         |                                 ^
   include/asm-generic/pgalloc.h:281:17: error: incompatible integer to pointer conversion initializing 'struct ptdesc *' with an expression of type 'int' [-Wint-conversion]
     281 |         struct ptdesc *ptdesc = virt_to_ptdesc(pgd);
         |                        ^        ~~~~~~~~~~~~~~~~~~~
   include/asm-generic/pgalloc.h:284:2: error: call to undeclared function 'pagetable_dtor_free'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     284 |         pagetable_dtor_free(ptdesc);
         |         ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +/pagetable_dtor_free +112 include/asm-generic/pgalloc.h

5c01b46bb6bb8f Arnd Bergmann         2009-05-13   97  
5fba4af4456b5d Mike Rapoport         2019-07-11   98  /*
5fba4af4456b5d Mike Rapoport         2019-07-11   99   * Should really implement gc for free page table pages. This could be
5fba4af4456b5d Mike Rapoport         2019-07-11  100   * done with a reference count in struct page.
5fba4af4456b5d Mike Rapoport         2019-07-11  101   */
5fba4af4456b5d Mike Rapoport         2019-07-11  102  
5fba4af4456b5d Mike Rapoport         2019-07-11  103  /**
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  104)  * pte_free - free PTE-level user page table memory
5fba4af4456b5d Mike Rapoport         2019-07-11  105   * @mm: the mm_struct of the current context
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  106)  * @pte_page: the `struct page` referencing the ptdesc
5fba4af4456b5d Mike Rapoport         2019-07-11  107   */
5fba4af4456b5d Mike Rapoport         2019-07-11  108  static inline void pte_free(struct mm_struct *mm, struct page *pte_page)
5fba4af4456b5d Mike Rapoport         2019-07-11  109  {
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  110) 	struct ptdesc *ptdesc = page_ptdesc(pte_page);
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  111) 
553e77529fb61e Qi Zheng              2025-01-08 @112  	pagetable_dtor_free(ptdesc);
5fba4af4456b5d Mike Rapoport         2019-07-11  113  }
5fba4af4456b5d Mike Rapoport         2019-07-11  114  
1355c31eeb7ea6 Mike Rapoport         2020-08-06  115  
1355c31eeb7ea6 Mike Rapoport         2020-08-06  116  #if CONFIG_PGTABLE_LEVELS > 2
1355c31eeb7ea6 Mike Rapoport         2020-08-06  117  
1355c31eeb7ea6 Mike Rapoport         2020-08-06  118  #ifndef __HAVE_ARCH_PMD_ALLOC_ONE
1355c31eeb7ea6 Mike Rapoport         2020-08-06  119  /**
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  120)  * pmd_alloc_one - allocate memory for a PMD-level page table
1355c31eeb7ea6 Mike Rapoport         2020-08-06  121   * @mm: the mm_struct of the current context
1355c31eeb7ea6 Mike Rapoport         2020-08-06  122   *
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  123)  * Allocate memory for a page table and ptdesc and runs pagetable_pmd_ctor().
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  124)  *
1355c31eeb7ea6 Mike Rapoport         2020-08-06  125   * Allocations use %GFP_PGTABLE_USER in user context and
1355c31eeb7ea6 Mike Rapoport         2020-08-06  126   * %GFP_PGTABLE_KERNEL in kernel context.
1355c31eeb7ea6 Mike Rapoport         2020-08-06  127   *
1355c31eeb7ea6 Mike Rapoport         2020-08-06  128   * Return: pointer to the allocated memory or %NULL on error
1355c31eeb7ea6 Mike Rapoport         2020-08-06  129   */
2c321f3f70bc28 Suren Baghdasaryan    2024-04-14  130  static inline pmd_t *pmd_alloc_one_noprof(struct mm_struct *mm, unsigned long addr)
1355c31eeb7ea6 Mike Rapoport         2020-08-06  131  {
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  132) 	struct ptdesc *ptdesc;
1355c31eeb7ea6 Mike Rapoport         2020-08-06  133  	gfp_t gfp = GFP_PGTABLE_USER;
1355c31eeb7ea6 Mike Rapoport         2020-08-06  134  
1355c31eeb7ea6 Mike Rapoport         2020-08-06  135  	if (mm == &init_mm)
1355c31eeb7ea6 Mike Rapoport         2020-08-06  136  		gfp = GFP_PGTABLE_KERNEL;
2c321f3f70bc28 Suren Baghdasaryan    2024-04-14  137  	ptdesc = pagetable_alloc_noprof(gfp, 0);
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  138) 	if (!ptdesc)
1355c31eeb7ea6 Mike Rapoport         2020-08-06  139  		return NULL;
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  140) 	if (!pagetable_pmd_ctor(ptdesc)) {
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  141) 		pagetable_free(ptdesc);
1355c31eeb7ea6 Mike Rapoport         2020-08-06  142  		return NULL;
1355c31eeb7ea6 Mike Rapoport         2020-08-06  143  	}
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  144) 	return ptdesc_address(ptdesc);
1355c31eeb7ea6 Mike Rapoport         2020-08-06  145  }
2c321f3f70bc28 Suren Baghdasaryan    2024-04-14  146  #define pmd_alloc_one(...)	alloc_hooks(pmd_alloc_one_noprof(__VA_ARGS__))
1355c31eeb7ea6 Mike Rapoport         2020-08-06  147  #endif
1355c31eeb7ea6 Mike Rapoport         2020-08-06  148  
1355c31eeb7ea6 Mike Rapoport         2020-08-06  149  #ifndef __HAVE_ARCH_PMD_FREE
1355c31eeb7ea6 Mike Rapoport         2020-08-06  150  static inline void pmd_free(struct mm_struct *mm, pmd_t *pmd)
1355c31eeb7ea6 Mike Rapoport         2020-08-06  151  {
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  152) 	struct ptdesc *ptdesc = virt_to_ptdesc(pmd);
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  153) 
1355c31eeb7ea6 Mike Rapoport         2020-08-06  154  	BUG_ON((unsigned long)pmd & (PAGE_SIZE-1));
553e77529fb61e Qi Zheng              2025-01-08  155  	pagetable_dtor_free(ptdesc);
1355c31eeb7ea6 Mike Rapoport         2020-08-06  156  }
1355c31eeb7ea6 Mike Rapoport         2020-08-06  157  #endif
1355c31eeb7ea6 Mike Rapoport         2020-08-06  158  
1355c31eeb7ea6 Mike Rapoport         2020-08-06  159  #endif /* CONFIG_PGTABLE_LEVELS > 2 */
1355c31eeb7ea6 Mike Rapoport         2020-08-06  160  
d9e8b929670b4f Mike Rapoport         2020-08-06  161  #if CONFIG_PGTABLE_LEVELS > 3
d9e8b929670b4f Mike Rapoport         2020-08-06  162  
2c321f3f70bc28 Suren Baghdasaryan    2024-04-14  163  static inline pud_t *__pud_alloc_one_noprof(struct mm_struct *mm, unsigned long addr)
60639f74c2f4fc Alexandre Ghiti       2021-12-06  164  {
60639f74c2f4fc Alexandre Ghiti       2021-12-06  165  	gfp_t gfp = GFP_PGTABLE_USER;
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  166) 	struct ptdesc *ptdesc;
60639f74c2f4fc Alexandre Ghiti       2021-12-06  167  
60639f74c2f4fc Alexandre Ghiti       2021-12-06  168  	if (mm == &init_mm)
60639f74c2f4fc Alexandre Ghiti       2021-12-06  169  		gfp = GFP_PGTABLE_KERNEL;
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  170) 	gfp &= ~__GFP_HIGHMEM;
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  171) 
2c321f3f70bc28 Suren Baghdasaryan    2024-04-14  172  	ptdesc = pagetable_alloc_noprof(gfp, 0);
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  173) 	if (!ptdesc)
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  174) 		return NULL;
55d2a0bd5eadaa Baolin Wang           2023-09-18  175  
55d2a0bd5eadaa Baolin Wang           2023-09-18  176  	pagetable_pud_ctor(ptdesc);
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  177) 	return ptdesc_address(ptdesc);
60639f74c2f4fc Alexandre Ghiti       2021-12-06  178  }
2c321f3f70bc28 Suren Baghdasaryan    2024-04-14  179  #define __pud_alloc_one(...)	alloc_hooks(__pud_alloc_one_noprof(__VA_ARGS__))
60639f74c2f4fc Alexandre Ghiti       2021-12-06  180  
9922c1deff915c Mike Rapoport         2020-08-14  181  #ifndef __HAVE_ARCH_PUD_ALLOC_ONE
d9e8b929670b4f Mike Rapoport         2020-08-06  182  /**
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  183)  * pud_alloc_one - allocate memory for a PUD-level page table
d9e8b929670b4f Mike Rapoport         2020-08-06  184   * @mm: the mm_struct of the current context
d9e8b929670b4f Mike Rapoport         2020-08-06  185   *
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  186)  * Allocate memory for a page table using %GFP_PGTABLE_USER for user context
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  187)  * and %GFP_PGTABLE_KERNEL for kernel context.
d9e8b929670b4f Mike Rapoport         2020-08-06  188   *
d9e8b929670b4f Mike Rapoport         2020-08-06  189   * Return: pointer to the allocated memory or %NULL on error
d9e8b929670b4f Mike Rapoport         2020-08-06  190   */
2c321f3f70bc28 Suren Baghdasaryan    2024-04-14  191  static inline pud_t *pud_alloc_one_noprof(struct mm_struct *mm, unsigned long addr)
d9e8b929670b4f Mike Rapoport         2020-08-06  192  {
2c321f3f70bc28 Suren Baghdasaryan    2024-04-14  193  	return __pud_alloc_one_noprof(mm, addr);
d9e8b929670b4f Mike Rapoport         2020-08-06  194  }
2c321f3f70bc28 Suren Baghdasaryan    2024-04-14  195  #define pud_alloc_one(...)	alloc_hooks(pud_alloc_one_noprof(__VA_ARGS__))
d9e8b929670b4f Mike Rapoport         2020-08-06  196  #endif
d9e8b929670b4f Mike Rapoport         2020-08-06  197  
60639f74c2f4fc Alexandre Ghiti       2021-12-06  198  static inline void __pud_free(struct mm_struct *mm, pud_t *pud)
d9e8b929670b4f Mike Rapoport         2020-08-06  199  {
55d2a0bd5eadaa Baolin Wang           2023-09-18  200  	struct ptdesc *ptdesc = virt_to_ptdesc(pud);
55d2a0bd5eadaa Baolin Wang           2023-09-18  201  
d9e8b929670b4f Mike Rapoport         2020-08-06  202  	BUG_ON((unsigned long)pud & (PAGE_SIZE-1));
553e77529fb61e Qi Zheng              2025-01-08  203  	pagetable_dtor_free(ptdesc);
d9e8b929670b4f Mike Rapoport         2020-08-06  204  }
d9e8b929670b4f Mike Rapoport         2020-08-06  205  
60639f74c2f4fc Alexandre Ghiti       2021-12-06  206  #ifndef __HAVE_ARCH_PUD_FREE
60639f74c2f4fc Alexandre Ghiti       2021-12-06  207  static inline void pud_free(struct mm_struct *mm, pud_t *pud)
60639f74c2f4fc Alexandre Ghiti       2021-12-06  208  {
60639f74c2f4fc Alexandre Ghiti       2021-12-06  209  	__pud_free(mm, pud);
60639f74c2f4fc Alexandre Ghiti       2021-12-06  210  }
60639f74c2f4fc Alexandre Ghiti       2021-12-06  211  #endif
60639f74c2f4fc Alexandre Ghiti       2021-12-06  212  
d9e8b929670b4f Mike Rapoport         2020-08-06  213  #endif /* CONFIG_PGTABLE_LEVELS > 3 */
d9e8b929670b4f Mike Rapoport         2020-08-06  214  
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  215  #if CONFIG_PGTABLE_LEVELS > 4
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  216  
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  217  static inline p4d_t *__p4d_alloc_one_noprof(struct mm_struct *mm, unsigned long addr)
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  218  {
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  219  	gfp_t gfp = GFP_PGTABLE_USER;
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  220  	struct ptdesc *ptdesc;
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  221  
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  222  	if (mm == &init_mm)
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  223  		gfp = GFP_PGTABLE_KERNEL;
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  224  	gfp &= ~__GFP_HIGHMEM;
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  225  
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  226  	ptdesc = pagetable_alloc_noprof(gfp, 0);
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  227  	if (!ptdesc)
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  228  		return NULL;
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  229  
5fcf5fa6121817 Qi Zheng              2025-01-08  230  	pagetable_p4d_ctor(ptdesc);
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  231  	return ptdesc_address(ptdesc);
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  232  }
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  233  #define __p4d_alloc_one(...)	alloc_hooks(__p4d_alloc_one_noprof(__VA_ARGS__))
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  234  
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  235  #ifndef __HAVE_ARCH_P4D_ALLOC_ONE
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  236  static inline p4d_t *p4d_alloc_one_noprof(struct mm_struct *mm, unsigned long addr)
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  237  {
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  238  	return __p4d_alloc_one_noprof(mm, addr);
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  239  }
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  240  #define p4d_alloc_one(...)	alloc_hooks(p4d_alloc_one_noprof(__VA_ARGS__))
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  241  #endif
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  242  
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  243  static inline void __p4d_free(struct mm_struct *mm, p4d_t *p4d)
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  244  {
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  245  	struct ptdesc *ptdesc = virt_to_ptdesc(p4d);
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  246  
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  247  	BUG_ON((unsigned long)p4d & (PAGE_SIZE-1));
553e77529fb61e Qi Zheng              2025-01-08  248  	pagetable_dtor_free(ptdesc);
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  249  }
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  250  
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  251  #ifndef __HAVE_ARCH_P4D_FREE
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  252  static inline void p4d_free(struct mm_struct *mm, p4d_t *p4d)
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  253  {
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  254  	if (!mm_p4d_folded(mm))
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  255  		__p4d_free(mm, p4d);
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  256  }
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  257  #endif
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  258  
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  259  #endif /* CONFIG_PGTABLE_LEVELS > 4 */
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  260  
a9b3c355c2e638 Kevin Brodsky         2025-01-03  261  static inline pgd_t *__pgd_alloc_noprof(struct mm_struct *mm, unsigned int order)
a9b3c355c2e638 Kevin Brodsky         2025-01-03  262  {
a9b3c355c2e638 Kevin Brodsky         2025-01-03  263  	gfp_t gfp = GFP_PGTABLE_USER;
a9b3c355c2e638 Kevin Brodsky         2025-01-03  264  	struct ptdesc *ptdesc;
a9b3c355c2e638 Kevin Brodsky         2025-01-03  265  
a9b3c355c2e638 Kevin Brodsky         2025-01-03  266  	if (mm == &init_mm)
a9b3c355c2e638 Kevin Brodsky         2025-01-03  267  		gfp = GFP_PGTABLE_KERNEL;
a9b3c355c2e638 Kevin Brodsky         2025-01-03  268  	gfp &= ~__GFP_HIGHMEM;
a9b3c355c2e638 Kevin Brodsky         2025-01-03  269  
a9b3c355c2e638 Kevin Brodsky         2025-01-03  270  	ptdesc = pagetable_alloc_noprof(gfp, order);
a9b3c355c2e638 Kevin Brodsky         2025-01-03  271  	if (!ptdesc)
a9b3c355c2e638 Kevin Brodsky         2025-01-03  272  		return NULL;
a9b3c355c2e638 Kevin Brodsky         2025-01-03  273  
d95936a2267c11 Kevin Brodsky         2025-01-03 @274  	pagetable_pgd_ctor(ptdesc);
a9b3c355c2e638 Kevin Brodsky         2025-01-03 @275  	return ptdesc_address(ptdesc);
a9b3c355c2e638 Kevin Brodsky         2025-01-03  276  }
a9b3c355c2e638 Kevin Brodsky         2025-01-03  277  #define __pgd_alloc(...)	alloc_hooks(__pgd_alloc_noprof(__VA_ARGS__))
a9b3c355c2e638 Kevin Brodsky         2025-01-03  278  

:::::: The code at line 112 was first introduced by commit
:::::: 553e77529fb61e5520b839a0ce412a46cba996e0 mm: pgtable: introduce generic pagetable_dtor_free()

:::::: TO: Qi Zheng <zhengqi.arch@bytedance.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
