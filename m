Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EF629B0;
	Thu, 23 Jan 2025 06:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737614289; cv=none; b=ngwrMoQs7yK/OQWk1D8kDxxqh/7CIPwqay2YjLAtVhscMewFvwh51a7MQ6BP2wtsl7dhEhqlIJMYPFCSLEEXvbqvnFVMfFftZ5dbfgdl8pyG6srm+7Vt/1hc8ma+N7VOptAv+RL5fM7JJrAwp7osuZ2g1NJy7IDWpjiDU5NmMqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737614289; c=relaxed/simple;
	bh=SNpzAVgA9I+Fvuau/Wu42L3NPJEpEIfSuuSoF/Q5iVI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pwixccvsMQNTEVvipsH6pU+rdin920vIq2qKQzPpr1daczPQWPt54jUjDg/IIgLnlfqXvFRDmYYhi7Wsebj2AJLkg83ov5VJow8200St8mbdz9b7UuWdE2SdxCGMaPZ90I1v5SeLGUSn7IfJ0k99uEb4slwTjHSq5SL5BemUITA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jeMOdOIl; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jeMOdOIl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737614286; x=1769150286;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SNpzAVgA9I+Fvuau/Wu42L3NPJEpEIfSuuSoF/Q5iVI=;
  b=jeMOdOIlfSj85Ztc2peiJBN9WLiW7Vf7ItTDRSMmYvM0KtfwZxjamYmi
   I9Bs8ShXUfxs0CUwDVEn24uqE1sbWTXiJPhB0RFVc07Yys1BynNYyBiYk
   gCO90wQSIJNh3JBS+GMAfrv4el3NAu1Vgaee3JnElB3vzx7z+CZX3PJJG
   9vygohkLx+Rgc39rB68Dl90MTbS3KC9AgB+PFRIgubGgXkA/6MlgEop1c
   6mN+GV7EHnbtGQcp+O4hnf+bRKRt1a8Efu3I6zAjjjqzvQugDtGOxkwpG
   pDVpu3g1mhPlsyAlrlcBX8b8J957GQWGOHvTZX0V3cy3WewfD0IG5sUZK
   w==;
X-CSE-ConnectionGUID: 3snigaLzTb+B/+CRvoniTg==
X-CSE-MsgGUID: tO3DQ3rGRcmAYNcGUb9FaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="38015433"
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; 
   d="scan'208";a="38015433"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 22:38:05 -0800
X-CSE-ConnectionGUID: +ZvZTvORRQGPsTJ5c7iMTA==
X-CSE-MsgGUID: QMKrxETxTEODRDnX57s96Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; 
   d="scan'208";a="107186908"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 22 Jan 2025 22:38:04 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taqqo-000aqD-08;
	Thu, 23 Jan 2025 06:38:02 +0000
Date: Thu, 23 Jan 2025 14:37:49 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 305/305]
 include/asm-generic/pgalloc.h:21:26: error: call to undeclared function
 'pagetable_alloc_noprof'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202501231434.zVsQc6J9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   9f73221be57f43a312dec7cdbd8ae087006f8676
commit: 9f73221be57f43a312dec7cdbd8ae087006f8676 [305/305] sched_wakeup_backtrace debugfs
config: hexagon-randconfig-002-20250123 (https://download.01.org/0day-ci/archive/20250123/202501231434.zVsQc6J9-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project c23f2417dc5f6dc371afb07af5627ec2a9d373a0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250123/202501231434.zVsQc6J9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501231434.zVsQc6J9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/timestats_bt.c:6:
   In file included from include/linux/mmu_context.h:5:
   In file included from arch/hexagon/include/asm/mmu_context.h:15:
   In file included from arch/hexagon/include/asm/pgalloc.h:14:
>> include/asm-generic/pgalloc.h:21:26: error: call to undeclared function 'pagetable_alloc_noprof'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      21 |         struct ptdesc *ptdesc = pagetable_alloc_noprof(GFP_PGTABLE_KERNEL &
         |                                 ^
>> include/asm-generic/pgalloc.h:21:17: error: incompatible integer to pointer conversion initializing 'struct ptdesc *' with an expression of type 'int' [-Wint-conversion]
      21 |         struct ptdesc *ptdesc = pagetable_alloc_noprof(GFP_PGTABLE_KERNEL &
         |                        ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      22 |                         ~__GFP_HIGHMEM, 0);
         |                         ~~~~~~~~~~~~~~~~~~
>> include/asm-generic/pgalloc.h:26:9: error: call to undeclared function 'ptdesc_address'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      26 |         return ptdesc_address(ptdesc);
         |                ^
>> include/asm-generic/pgalloc.h:26:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'pte_t *' [-Wint-conversion]
      26 |         return ptdesc_address(ptdesc);
         |                ^~~~~~~~~~~~~~~~~~~~~~
>> include/asm-generic/pgalloc.h:51:2: error: call to undeclared function 'pagetable_free'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      51 |         pagetable_free(virt_to_ptdesc(pte));
         |         ^
>> include/asm-generic/pgalloc.h:51:17: error: call to undeclared function 'virt_to_ptdesc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
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
>> include/asm-generic/pgalloc.h:70:9: error: incompatible integer to pointer conversion assigning to 'struct ptdesc *' from 'int' [-Wint-conversion]
      70 |         ptdesc = pagetable_alloc_noprof(gfp, 0);
         |                ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/asm-generic/pgalloc.h:73:7: error: call to undeclared function 'pagetable_pte_ctor'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      73 |         if (!pagetable_pte_ctor(ptdesc)) {
         |              ^
   include/asm-generic/pgalloc.h:74:3: error: call to undeclared function 'pagetable_free'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      74 |                 pagetable_free(ptdesc);
         |                 ^
>> include/asm-generic/pgalloc.h:112:2: error: call to undeclared function 'pagetable_pte_dtor'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     112 |         pagetable_pte_dtor(ptdesc);
         |         ^
   include/asm-generic/pgalloc.h:113:2: error: call to undeclared function 'pagetable_free'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     113 |         pagetable_free(ptdesc);
         |         ^
   include/asm-generic/pgalloc.h:221:2: error: call to undeclared function 'pagetable_free'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     221 |         pagetable_free(virt_to_ptdesc(pgd));
         |         ^
   include/asm-generic/pgalloc.h:221:17: error: call to undeclared function 'virt_to_ptdesc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     221 |         pagetable_free(virt_to_ptdesc(pgd));
         |                        ^
   In file included from kernel/sched/timestats_bt.c:6:
   In file included from include/linux/mmu_context.h:5:
   In file included from arch/hexagon/include/asm/mmu_context.h:15:
>> arch/hexagon/include/asm/pgalloc.h:35:14: error: use of undeclared identifier 'swapper_pg_dir'
      35 |         memcpy(pgd, swapper_pg_dir, PTRS_PER_PGD*sizeof(pgd_t));
         |                     ^
>> arch/hexagon/include/asm/pgalloc.h:35:30: error: use of undeclared identifier 'PTRS_PER_PGD'
      35 |         memcpy(pgd, swapper_pg_dir, PTRS_PER_PGD*sizeof(pgd_t));
         |                                     ^
>> arch/hexagon/include/asm/pgalloc.h:44:55: error: unknown type name 'pmd_t'
      44 | static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd,
         |                                                       ^
>> arch/hexagon/include/asm/pgalloc.h:51:2: error: call to undeclared function 'set_pmd'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      51 |         set_pmd(pmd, __pmd(((unsigned long)page_to_pfn(pte) << PAGE_SHIFT) |
         |         ^
>> arch/hexagon/include/asm/pgalloc.h:51:15: error: call to undeclared function '__pmd'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      51 |         set_pmd(pmd, __pmd(((unsigned long)page_to_pfn(pte) << PAGE_SHIFT) |
         |                      ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +/pagetable_alloc_noprof +21 include/asm-generic/pgalloc.h

5fba4af4456b5d Mike Rapoport         2019-07-11    9  
5fba4af4456b5d Mike Rapoport         2019-07-11   10  /**
c787ae5b391496 Vishal Moola (Oracle  2023-08-07   11)  * __pte_alloc_one_kernel - allocate memory for a PTE-level kernel page table
5fba4af4456b5d Mike Rapoport         2019-07-11   12   * @mm: the mm_struct of the current context
5fba4af4456b5d Mike Rapoport         2019-07-11   13   *
5fba4af4456b5d Mike Rapoport         2019-07-11   14   * This function is intended for architectures that need
5fba4af4456b5d Mike Rapoport         2019-07-11   15   * anything beyond simple page allocation.
5fba4af4456b5d Mike Rapoport         2019-07-11   16   *
5fba4af4456b5d Mike Rapoport         2019-07-11   17   * Return: pointer to the allocated memory or %NULL on error
5fba4af4456b5d Mike Rapoport         2019-07-11   18   */
2c321f3f70bc28 Suren Baghdasaryan    2024-04-14   19  static inline pte_t *__pte_alloc_one_kernel_noprof(struct mm_struct *mm)
5fba4af4456b5d Mike Rapoport         2019-07-11   20  {
2c321f3f70bc28 Suren Baghdasaryan    2024-04-14  @21  	struct ptdesc *ptdesc = pagetable_alloc_noprof(GFP_PGTABLE_KERNEL &
c787ae5b391496 Vishal Moola (Oracle  2023-08-07   22) 			~__GFP_HIGHMEM, 0);
c787ae5b391496 Vishal Moola (Oracle  2023-08-07   23) 
c787ae5b391496 Vishal Moola (Oracle  2023-08-07   24) 	if (!ptdesc)
c787ae5b391496 Vishal Moola (Oracle  2023-08-07   25) 		return NULL;
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  @26) 	return ptdesc_address(ptdesc);
5fba4af4456b5d Mike Rapoport         2019-07-11   27  }
2c321f3f70bc28 Suren Baghdasaryan    2024-04-14   28  #define __pte_alloc_one_kernel(...)	alloc_hooks(__pte_alloc_one_kernel_noprof(__VA_ARGS__))
5fba4af4456b5d Mike Rapoport         2019-07-11   29  
5fba4af4456b5d Mike Rapoport         2019-07-11   30  #ifndef __HAVE_ARCH_PTE_ALLOC_ONE_KERNEL
5fba4af4456b5d Mike Rapoport         2019-07-11   31  /**
c787ae5b391496 Vishal Moola (Oracle  2023-08-07   32)  * pte_alloc_one_kernel - allocate memory for a PTE-level kernel page table
5fba4af4456b5d Mike Rapoport         2019-07-11   33   * @mm: the mm_struct of the current context
5fba4af4456b5d Mike Rapoport         2019-07-11   34   *
5fba4af4456b5d Mike Rapoport         2019-07-11   35   * Return: pointer to the allocated memory or %NULL on error
5fba4af4456b5d Mike Rapoport         2019-07-11   36   */
2c321f3f70bc28 Suren Baghdasaryan    2024-04-14   37  static inline pte_t *pte_alloc_one_kernel_noprof(struct mm_struct *mm)
5fba4af4456b5d Mike Rapoport         2019-07-11   38  {
2c321f3f70bc28 Suren Baghdasaryan    2024-04-14   39  	return __pte_alloc_one_kernel_noprof(mm);
5fba4af4456b5d Mike Rapoport         2019-07-11   40  }
2c321f3f70bc28 Suren Baghdasaryan    2024-04-14   41  #define pte_alloc_one_kernel(...)	alloc_hooks(pte_alloc_one_kernel_noprof(__VA_ARGS__))
5fba4af4456b5d Mike Rapoport         2019-07-11   42  #endif
5fba4af4456b5d Mike Rapoport         2019-07-11   43  
5fba4af4456b5d Mike Rapoport         2019-07-11   44  /**
c787ae5b391496 Vishal Moola (Oracle  2023-08-07   45)  * pte_free_kernel - free PTE-level kernel page table memory
5fba4af4456b5d Mike Rapoport         2019-07-11   46   * @mm: the mm_struct of the current context
5fba4af4456b5d Mike Rapoport         2019-07-11   47   * @pte: pointer to the memory containing the page table
5fba4af4456b5d Mike Rapoport         2019-07-11   48   */
5fba4af4456b5d Mike Rapoport         2019-07-11   49  static inline void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
5fba4af4456b5d Mike Rapoport         2019-07-11   50  {
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  @51) 	pagetable_free(virt_to_ptdesc(pte));
5fba4af4456b5d Mike Rapoport         2019-07-11   52  }
5fba4af4456b5d Mike Rapoport         2019-07-11   53  
5fba4af4456b5d Mike Rapoport         2019-07-11   54  /**
c787ae5b391496 Vishal Moola (Oracle  2023-08-07   55)  * __pte_alloc_one - allocate memory for a PTE-level user page table
5fba4af4456b5d Mike Rapoport         2019-07-11   56   * @mm: the mm_struct of the current context
5fba4af4456b5d Mike Rapoport         2019-07-11   57   * @gfp: GFP flags to use for the allocation
5fba4af4456b5d Mike Rapoport         2019-07-11   58   *
c787ae5b391496 Vishal Moola (Oracle  2023-08-07   59)  * Allocate memory for a page table and ptdesc and runs pagetable_pte_ctor().
5fba4af4456b5d Mike Rapoport         2019-07-11   60   *
5fba4af4456b5d Mike Rapoport         2019-07-11   61   * This function is intended for architectures that need
5fba4af4456b5d Mike Rapoport         2019-07-11   62   * anything beyond simple page allocation or must have custom GFP flags.
5fba4af4456b5d Mike Rapoport         2019-07-11   63   *
c787ae5b391496 Vishal Moola (Oracle  2023-08-07   64)  * Return: `struct page` referencing the ptdesc or %NULL on error
5fba4af4456b5d Mike Rapoport         2019-07-11   65   */
2c321f3f70bc28 Suren Baghdasaryan    2024-04-14   66  static inline pgtable_t __pte_alloc_one_noprof(struct mm_struct *mm, gfp_t gfp)
5fba4af4456b5d Mike Rapoport         2019-07-11   67  {
c787ae5b391496 Vishal Moola (Oracle  2023-08-07   68) 	struct ptdesc *ptdesc;
5fba4af4456b5d Mike Rapoport         2019-07-11   69  
2c321f3f70bc28 Suren Baghdasaryan    2024-04-14  @70  	ptdesc = pagetable_alloc_noprof(gfp, 0);
c787ae5b391496 Vishal Moola (Oracle  2023-08-07   71) 	if (!ptdesc)
5fba4af4456b5d Mike Rapoport         2019-07-11   72  		return NULL;
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  @73) 	if (!pagetable_pte_ctor(ptdesc)) {
c787ae5b391496 Vishal Moola (Oracle  2023-08-07   74) 		pagetable_free(ptdesc);
5fba4af4456b5d Mike Rapoport         2019-07-11   75  		return NULL;
5fba4af4456b5d Mike Rapoport         2019-07-11   76  	}
5fba4af4456b5d Mike Rapoport         2019-07-11   77  
c787ae5b391496 Vishal Moola (Oracle  2023-08-07   78) 	return ptdesc_page(ptdesc);
5fba4af4456b5d Mike Rapoport         2019-07-11   79  }
2c321f3f70bc28 Suren Baghdasaryan    2024-04-14   80  #define __pte_alloc_one(...)	alloc_hooks(__pte_alloc_one_noprof(__VA_ARGS__))
5fba4af4456b5d Mike Rapoport         2019-07-11   81  
5fba4af4456b5d Mike Rapoport         2019-07-11   82  #ifndef __HAVE_ARCH_PTE_ALLOC_ONE
5fba4af4456b5d Mike Rapoport         2019-07-11   83  /**
5fba4af4456b5d Mike Rapoport         2019-07-11   84   * pte_alloc_one - allocate a page for PTE-level user page table
5fba4af4456b5d Mike Rapoport         2019-07-11   85   * @mm: the mm_struct of the current context
5fba4af4456b5d Mike Rapoport         2019-07-11   86   *
c787ae5b391496 Vishal Moola (Oracle  2023-08-07   87)  * Allocate memory for a page table and ptdesc and runs pagetable_pte_ctor().
5fba4af4456b5d Mike Rapoport         2019-07-11   88   *
c787ae5b391496 Vishal Moola (Oracle  2023-08-07   89)  * Return: `struct page` referencing the ptdesc or %NULL on error
5fba4af4456b5d Mike Rapoport         2019-07-11   90   */
2c321f3f70bc28 Suren Baghdasaryan    2024-04-14   91  static inline pgtable_t pte_alloc_one_noprof(struct mm_struct *mm)
5fba4af4456b5d Mike Rapoport         2019-07-11   92  {
2c321f3f70bc28 Suren Baghdasaryan    2024-04-14   93  	return __pte_alloc_one_noprof(mm, GFP_PGTABLE_USER);
5fba4af4456b5d Mike Rapoport         2019-07-11   94  }
2c321f3f70bc28 Suren Baghdasaryan    2024-04-14   95  #define pte_alloc_one(...)	alloc_hooks(pte_alloc_one_noprof(__VA_ARGS__))
5c01b46bb6bb8f Arnd Bergmann         2009-05-13   96  #endif
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
c787ae5b391496 Vishal Moola (Oracle  2023-08-07 @112) 	pagetable_pte_dtor(ptdesc);
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  113) 	pagetable_free(ptdesc);
5fba4af4456b5d Mike Rapoport         2019-07-11  114  }
5fba4af4456b5d Mike Rapoport         2019-07-11  115  

:::::: The code at line 21 was first introduced by commit
:::::: 2c321f3f70bc284510598f712b702ce8d60c4d14 mm: change inlined allocation helpers to account at the call site

:::::: TO: Suren Baghdasaryan <surenb@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
