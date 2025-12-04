Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B497F34CDD;
	Thu,  4 Dec 2025 09:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764839040; cv=none; b=hmNQ08MEMpXnyf3i9s1R2NLsE7PxBTZjexjMdXgutV0Lo388gdUR7rXfpCs5qMahe9C3Zu5MqoTRF6R1JJ1a60887Rk1DEt5CTw+M4LhhxyzTdfaGN8CMDbxBpKsSz4oiNAdiMPI0W2MQePxOKYT0xijuHUt26LAZoECiWECulU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764839040; c=relaxed/simple;
	bh=W8KBr6d2G5p1HyPhV9nRN9SBg/hVa9FqfCIsXE359bQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TLbUVohGz42uF0ozkZ32mWowE4qImy1+jm7D5aNMg9kuqvLuJ8dTLoJmJfH8dBGOaBKjK4jNXOaCMN/FTNIBGoM4HFD9L4jldySy2a0rxUOEp/XXQtJpm9EUxnjNS6I6UdGgARaNFFs/VfNvblgDPzAqaBbe/fgAR31JgZ1iAWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hPiF3NaK; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hPiF3NaK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764839039; x=1796375039;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W8KBr6d2G5p1HyPhV9nRN9SBg/hVa9FqfCIsXE359bQ=;
  b=hPiF3NaKRwcdKW1do5UuSxw06S6zJvjFQEWWUrI95uo41JKR93+sdGix
   p9heymY0l6K8Au7qIJKqj7Sal/6Jq0SfY7esa8z103v0bn3qafvNmgIZs
   /EoPgZNTtTOKglHRR3O0znwwMh7SmQaDDBIJmGQtYvbr7hgNRe3L+QUQU
   WbarBHR7XRMyKmk/cd3sqEIXaBV8qBYsLubeWXL0p6knD3ZRhRDk9urcw
   DS9XP/2E2mernL5VhJ4r0JdcEAbnTmpnk/auMq8tCDtZTqUjF2QmqoAhw
   I1ZP56R2gXjgetZiFr6F9+qIUdC0AVs4beV7u7Go9dWRPLAxhOJMEKkC0
   Q==;
X-CSE-ConnectionGUID: kUWjCOzKT0ehQWcoZTFK/Q==
X-CSE-MsgGUID: 9p/uPUmISCKnhIbEJVadWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="70702217"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="70702217"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 01:03:58 -0800
X-CSE-ConnectionGUID: 0IaOcg72TAGSrKW/cnEcnw==
X-CSE-MsgGUID: Mg+VEl0dS32sMPaQaSZRcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="199880467"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Dec 2025 01:03:57 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vR5Fi-00000000Dbp-2axI;
	Thu, 04 Dec 2025 09:03:54 +0000
Date: Thu, 4 Dec 2025 17:03:06 +0800
From: kernel test robot <lkp@intel.com>
To: "Isaac J. Manjarres" <isaacmanjarres@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:renesas-android/v6.18-rc6-2025-12-01 1/1]
 include/asm-generic/pgalloc.h:21:26: error: call to undeclared function
 'pagetable_alloc_noprof'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202512041603.YlyZu496-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux renesas-android/v6.18-rc6-2025-12-01
head:   9df6f95899e762009eb03fba18a18054a299ec34
commit: 06f8e52b34f38555bb820ac1cb1d9547a3c9c50a [1/1] ANDROID: GKI: Introduce GKI_HIDDEN_IOMMU_CONFIGS
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20251204/202512041603.YlyZu496-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251204/202512041603.YlyZu496-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512041603.YlyZu496-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/iommu/iommu-sva.c:5:
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
>> include/asm-generic/pgalloc.h:26:7: error: call to undeclared function 'pagetable_pte_ctor'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      26 |         if (!pagetable_pte_ctor(mm, ptdesc)) {
         |              ^
>> include/asm-generic/pgalloc.h:27:3: error: call to undeclared function 'pagetable_free'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      27 |                 pagetable_free(ptdesc);
         |                 ^
>> include/asm-generic/pgalloc.h:31:9: error: call to undeclared function 'ptdesc_address'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      31 |         return ptdesc_address(ptdesc);
         |                ^
>> include/asm-generic/pgalloc.h:31:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'pte_t *' [-Wint-conversion]
      31 |         return ptdesc_address(ptdesc);
         |                ^~~~~~~~~~~~~~~~~~~~~~
>> include/asm-generic/pgalloc.h:56:2: error: call to undeclared function 'pagetable_dtor_free'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      56 |         pagetable_dtor_free(virt_to_ptdesc(pte));
         |         ^
>> include/asm-generic/pgalloc.h:56:22: error: call to undeclared function 'virt_to_ptdesc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      56 |         pagetable_dtor_free(virt_to_ptdesc(pte));
         |                             ^
   include/asm-generic/pgalloc.h:56:22: note: did you mean 'irq_to_desc'?
   include/linux/irqnr.h:10:25: note: 'irq_to_desc' declared here
      10 | extern struct irq_desc *irq_to_desc(unsigned int irq);
         |                         ^
   In file included from drivers/iommu/iommu-sva.c:5:
   In file included from include/linux/mmu_context.h:5:
   In file included from arch/hexagon/include/asm/mmu_context.h:15:
   In file included from arch/hexagon/include/asm/pgalloc.h:14:
   include/asm-generic/pgalloc.h:75:11: error: call to undeclared function 'pagetable_alloc_noprof'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      75 |         ptdesc = pagetable_alloc_noprof(gfp, 0);
         |                  ^
>> include/asm-generic/pgalloc.h:75:9: error: incompatible integer to pointer conversion assigning to 'struct ptdesc *' from 'int' [-Wint-conversion]
      75 |         ptdesc = pagetable_alloc_noprof(gfp, 0);
         |                ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/pgalloc.h:78:7: error: call to undeclared function 'pagetable_pte_ctor'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      78 |         if (!pagetable_pte_ctor(mm, ptdesc)) {
         |              ^
   include/asm-generic/pgalloc.h:79:3: error: call to undeclared function 'pagetable_free'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      79 |                 pagetable_free(ptdesc);
         |                 ^
   include/asm-generic/pgalloc.h:117:2: error: call to undeclared function 'pagetable_dtor_free'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     117 |         pagetable_dtor_free(ptdesc);
         |         ^
   include/asm-generic/pgalloc.h:275:11: error: call to undeclared function 'pagetable_alloc_noprof'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     275 |         ptdesc = pagetable_alloc_noprof(gfp, order);
         |                  ^
   include/asm-generic/pgalloc.h:275:9: error: incompatible integer to pointer conversion assigning to 'struct ptdesc *' from 'int' [-Wint-conversion]
     275 |         ptdesc = pagetable_alloc_noprof(gfp, order);
         |                ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/asm-generic/pgalloc.h:279:2: error: call to undeclared function 'pagetable_pgd_ctor'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     279 |         pagetable_pgd_ctor(ptdesc);
         |         ^
   include/asm-generic/pgalloc.h:280:9: error: call to undeclared function 'ptdesc_address'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     280 |         return ptdesc_address(ptdesc);
         |                ^
>> include/asm-generic/pgalloc.h:280:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'pgd_t *' [-Wint-conversion]
     280 |         return ptdesc_address(ptdesc);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/pgalloc.h:286:26: error: call to undeclared function 'virt_to_ptdesc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     286 |         struct ptdesc *ptdesc = virt_to_ptdesc(pgd);
         |                                 ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +/pagetable_alloc_noprof +21 include/asm-generic/pgalloc.h

5fba4af4456b5d Mike Rapoport         2019-07-11   9  
5fba4af4456b5d Mike Rapoport         2019-07-11  10  /**
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  11)  * __pte_alloc_one_kernel - allocate memory for a PTE-level kernel page table
5fba4af4456b5d Mike Rapoport         2019-07-11  12   * @mm: the mm_struct of the current context
5fba4af4456b5d Mike Rapoport         2019-07-11  13   *
5fba4af4456b5d Mike Rapoport         2019-07-11  14   * This function is intended for architectures that need
5fba4af4456b5d Mike Rapoport         2019-07-11  15   * anything beyond simple page allocation.
5fba4af4456b5d Mike Rapoport         2019-07-11  16   *
5fba4af4456b5d Mike Rapoport         2019-07-11  17   * Return: pointer to the allocated memory or %NULL on error
5fba4af4456b5d Mike Rapoport         2019-07-11  18   */
2c321f3f70bc28 Suren Baghdasaryan    2024-04-14  19  static inline pte_t *__pte_alloc_one_kernel_noprof(struct mm_struct *mm)
5fba4af4456b5d Mike Rapoport         2019-07-11  20  {
2c321f3f70bc28 Suren Baghdasaryan    2024-04-14 @21  	struct ptdesc *ptdesc = pagetable_alloc_noprof(GFP_PGTABLE_KERNEL &
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  22) 			~__GFP_HIGHMEM, 0);
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  23) 
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  24) 	if (!ptdesc)
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  25) 		return NULL;
49f5996664201a Kevin Brodsky         2025-04-08 @26  	if (!pagetable_pte_ctor(mm, ptdesc)) {
49f5996664201a Kevin Brodsky         2025-04-08 @27  		pagetable_free(ptdesc);
49f5996664201a Kevin Brodsky         2025-04-08  28  		return NULL;
49f5996664201a Kevin Brodsky         2025-04-08  29  	}
49f5996664201a Kevin Brodsky         2025-04-08  30  
c787ae5b391496 Vishal Moola (Oracle  2023-08-07 @31) 	return ptdesc_address(ptdesc);
5fba4af4456b5d Mike Rapoport         2019-07-11  32  }
2c321f3f70bc28 Suren Baghdasaryan    2024-04-14  33  #define __pte_alloc_one_kernel(...)	alloc_hooks(__pte_alloc_one_kernel_noprof(__VA_ARGS__))
5fba4af4456b5d Mike Rapoport         2019-07-11  34  
5fba4af4456b5d Mike Rapoport         2019-07-11  35  #ifndef __HAVE_ARCH_PTE_ALLOC_ONE_KERNEL
5fba4af4456b5d Mike Rapoport         2019-07-11  36  /**
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  37)  * pte_alloc_one_kernel - allocate memory for a PTE-level kernel page table
5fba4af4456b5d Mike Rapoport         2019-07-11  38   * @mm: the mm_struct of the current context
5fba4af4456b5d Mike Rapoport         2019-07-11  39   *
5fba4af4456b5d Mike Rapoport         2019-07-11  40   * Return: pointer to the allocated memory or %NULL on error
5fba4af4456b5d Mike Rapoport         2019-07-11  41   */
2c321f3f70bc28 Suren Baghdasaryan    2024-04-14  42  static inline pte_t *pte_alloc_one_kernel_noprof(struct mm_struct *mm)
5fba4af4456b5d Mike Rapoport         2019-07-11  43  {
2c321f3f70bc28 Suren Baghdasaryan    2024-04-14  44  	return __pte_alloc_one_kernel_noprof(mm);
5fba4af4456b5d Mike Rapoport         2019-07-11  45  }
2c321f3f70bc28 Suren Baghdasaryan    2024-04-14  46  #define pte_alloc_one_kernel(...)	alloc_hooks(pte_alloc_one_kernel_noprof(__VA_ARGS__))
5fba4af4456b5d Mike Rapoport         2019-07-11  47  #endif
5fba4af4456b5d Mike Rapoport         2019-07-11  48  
5fba4af4456b5d Mike Rapoport         2019-07-11  49  /**
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  50)  * pte_free_kernel - free PTE-level kernel page table memory
5fba4af4456b5d Mike Rapoport         2019-07-11  51   * @mm: the mm_struct of the current context
5fba4af4456b5d Mike Rapoport         2019-07-11  52   * @pte: pointer to the memory containing the page table
5fba4af4456b5d Mike Rapoport         2019-07-11  53   */
5fba4af4456b5d Mike Rapoport         2019-07-11  54  static inline void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
5fba4af4456b5d Mike Rapoport         2019-07-11  55  {
49f5996664201a Kevin Brodsky         2025-04-08 @56  	pagetable_dtor_free(virt_to_ptdesc(pte));
5fba4af4456b5d Mike Rapoport         2019-07-11  57  }
5fba4af4456b5d Mike Rapoport         2019-07-11  58  
5fba4af4456b5d Mike Rapoport         2019-07-11  59  /**
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  60)  * __pte_alloc_one - allocate memory for a PTE-level user page table
5fba4af4456b5d Mike Rapoport         2019-07-11  61   * @mm: the mm_struct of the current context
5fba4af4456b5d Mike Rapoport         2019-07-11  62   * @gfp: GFP flags to use for the allocation
5fba4af4456b5d Mike Rapoport         2019-07-11  63   *
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  64)  * Allocate memory for a page table and ptdesc and runs pagetable_pte_ctor().
5fba4af4456b5d Mike Rapoport         2019-07-11  65   *
5fba4af4456b5d Mike Rapoport         2019-07-11  66   * This function is intended for architectures that need
5fba4af4456b5d Mike Rapoport         2019-07-11  67   * anything beyond simple page allocation or must have custom GFP flags.
5fba4af4456b5d Mike Rapoport         2019-07-11  68   *
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  69)  * Return: `struct page` referencing the ptdesc or %NULL on error
5fba4af4456b5d Mike Rapoport         2019-07-11  70   */
2c321f3f70bc28 Suren Baghdasaryan    2024-04-14  71  static inline pgtable_t __pte_alloc_one_noprof(struct mm_struct *mm, gfp_t gfp)
5fba4af4456b5d Mike Rapoport         2019-07-11  72  {
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  73) 	struct ptdesc *ptdesc;
5fba4af4456b5d Mike Rapoport         2019-07-11  74  
2c321f3f70bc28 Suren Baghdasaryan    2024-04-14 @75  	ptdesc = pagetable_alloc_noprof(gfp, 0);
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  76) 	if (!ptdesc)
5fba4af4456b5d Mike Rapoport         2019-07-11  77  		return NULL;
d82d3bf4115217 Kevin Brodsky         2025-04-08  78  	if (!pagetable_pte_ctor(mm, ptdesc)) {
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  79) 		pagetable_free(ptdesc);
5fba4af4456b5d Mike Rapoport         2019-07-11  80  		return NULL;
5fba4af4456b5d Mike Rapoport         2019-07-11  81  	}
5fba4af4456b5d Mike Rapoport         2019-07-11  82  
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  83) 	return ptdesc_page(ptdesc);
5fba4af4456b5d Mike Rapoport         2019-07-11  84  }
2c321f3f70bc28 Suren Baghdasaryan    2024-04-14  85  #define __pte_alloc_one(...)	alloc_hooks(__pte_alloc_one_noprof(__VA_ARGS__))
5fba4af4456b5d Mike Rapoport         2019-07-11  86  

:::::: The code at line 21 was first introduced by commit
:::::: 2c321f3f70bc284510598f712b702ce8d60c4d14 mm: change inlined allocation helpers to account at the call site

:::::: TO: Suren Baghdasaryan <surenb@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
