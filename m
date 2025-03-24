Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065A16125;
	Mon, 24 Mar 2025 23:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742857382; cv=none; b=SsDLCikAy8xmxnWpwAj5zYPKyzjpkRSb8xjbjhJ64lCLjmPCNIfaxX+CkXr3Py6BLsiY9EtgeLVQDfj+xFfsQcjl2yYTKabBDkA/pbF5BzOwz/eE6UPtl5LHO7xVuXaSKURjzqY96T7Bva6tsRUVuMvLAwWsy0Aany7QUsLDnBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742857382; c=relaxed/simple;
	bh=/iI5Uz09BsIRqiamc+/wOJr/RpOW2qkQfdP6cBNZwM0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OvuTZluviEBV6E4geY2DvdFoep2IysidqAYUlM2FfP0811JytSUgAlZbyGJW6qQYF1uSJZO7YBpiH7mAHQHBqOz0K7mbfuVf9888UNakt/Tg6HeRfohOIqt7Jyel2LhuM/K8lbh9t99Y86OxRWDA0HSPMWfBVaV3mzcoMRLnrXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VX2OJ/3Z; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VX2OJ/3Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742857381; x=1774393381;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/iI5Uz09BsIRqiamc+/wOJr/RpOW2qkQfdP6cBNZwM0=;
  b=VX2OJ/3Z7YAcbWf5UbNYQ5NwbnKPRdpZzrs0R21q3jfR5/9dLunu4pDh
   FpPPv3UcAqPBqP4oCsjccMsqcMAl00bY4vje2QFIPbYC2ne2wm9yQN3W7
   fVIftybOOwVmD7c02VQ8CWp9iDNOQ9KXFNZUwxqAP8PTyMsn7imdZX31c
   SdBXcEDSCPg37nkhmXLGBIx3zPU8dRPCMf2kiQnntyNuxppZsfuL4kQ77
   A1y16ofikzrca+5DFf99cRbPdE4nq00b9699NcYLEKqC1tnwb/kFHjJAC
   jv6KQrlC850LScSoEiJJiZ7hvGkG0j4gt96ztMSmqxPweyoS0uTD6OQs1
   A==;
X-CSE-ConnectionGUID: eHY7kqSwRWG/pJ3p09xjmg==
X-CSE-MsgGUID: qiTJMlOzTfK9udyTp6s0ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="55081879"
X-IronPort-AV: E=Sophos;i="6.14,273,1736841600"; 
   d="scan'208";a="55081879"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2025 16:03:00 -0700
X-CSE-ConnectionGUID: xfSjay1tSUmlgFqc7BbX9A==
X-CSE-MsgGUID: mJA7r2tQQim1N5y9ZbTMdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,273,1736841600"; 
   d="scan'208";a="125130157"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 24 Mar 2025 16:02:58 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twqop-000409-2H;
	Mon, 24 Mar 2025 23:02:55 +0000
Date: Tue, 25 Mar 2025 07:02:26 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:latency_debug 83/84]
 include/asm-generic/pgalloc.h:21:26: error: call to undeclared function
 'pagetable_alloc_noprof'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202503250702.svWeQpn1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs latency_debug
head:   bd176ff969fbde282f5e3335fe3e45e341427941
commit: a415e1f10898f9cb706c57814655cfe578cd8374 [83/84] sched_wakeup_backtrace debugfs
config: hexagon-randconfig-001-20250325 (https://download.01.org/0day-ci/archive/20250325/202503250702.svWeQpn1-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250325/202503250702.svWeQpn1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503250702.svWeQpn1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/timestats_bt.c:6:
   In file included from include/linux/mmu_context.h:5:
   In file included from arch/hexagon/include/asm/mmu_context.h:15:
   In file included from arch/hexagon/include/asm/pgalloc.h:14:
>> include/asm-generic/pgalloc.h:21:26: error: call to undeclared function 'pagetable_alloc_noprof'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           struct ptdesc *ptdesc = pagetable_alloc_noprof(GFP_PGTABLE_KERNEL &
                                   ^
>> include/asm-generic/pgalloc.h:21:17: error: incompatible integer to pointer conversion initializing 'struct ptdesc *' with an expression of type 'int' [-Wint-conversion]
           struct ptdesc *ptdesc = pagetable_alloc_noprof(GFP_PGTABLE_KERNEL &
                          ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/asm-generic/pgalloc.h:26:9: error: call to undeclared function 'ptdesc_address'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           return ptdesc_address(ptdesc);
                  ^
>> include/asm-generic/pgalloc.h:26:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'pte_t *' [-Wint-conversion]
           return ptdesc_address(ptdesc);
                  ^~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/pgalloc.h:51:2: error: call to undeclared function 'pagetable_free'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           pagetable_free(virt_to_ptdesc(pte));
           ^
>> include/asm-generic/pgalloc.h:51:17: error: call to undeclared function 'virt_to_ptdesc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           pagetable_free(virt_to_ptdesc(pte));
                          ^
   include/asm-generic/pgalloc.h:51:17: note: did you mean 'irq_to_desc'?
   include/linux/irqnr.h:10:25: note: 'irq_to_desc' declared here
   extern struct irq_desc *irq_to_desc(unsigned int irq);
                           ^
   In file included from kernel/sched/timestats_bt.c:6:
   In file included from include/linux/mmu_context.h:5:
   In file included from arch/hexagon/include/asm/mmu_context.h:15:
   In file included from arch/hexagon/include/asm/pgalloc.h:14:
   include/asm-generic/pgalloc.h:70:11: error: call to undeclared function 'pagetable_alloc_noprof'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           ptdesc = pagetable_alloc_noprof(gfp, 0);
                    ^
   include/asm-generic/pgalloc.h:70:9: error: incompatible integer to pointer conversion assigning to 'struct ptdesc *' from 'int' [-Wint-conversion]
           ptdesc = pagetable_alloc_noprof(gfp, 0);
                  ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/pgalloc.h:73:7: error: call to undeclared function 'pagetable_pte_ctor'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           if (!pagetable_pte_ctor(ptdesc)) {
                ^
   include/asm-generic/pgalloc.h:74:3: error: call to undeclared function 'pagetable_free'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   pagetable_free(ptdesc);
                   ^
   include/asm-generic/pgalloc.h:112:2: error: call to undeclared function 'pagetable_dtor_free'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           pagetable_dtor_free(ptdesc);
           ^
   include/asm-generic/pgalloc.h:270:11: error: call to undeclared function 'pagetable_alloc_noprof'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           ptdesc = pagetable_alloc_noprof(gfp, order);
                    ^
   include/asm-generic/pgalloc.h:270:9: error: incompatible integer to pointer conversion assigning to 'struct ptdesc *' from 'int' [-Wint-conversion]
           ptdesc = pagetable_alloc_noprof(gfp, order);
                  ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/pgalloc.h:274:2: error: call to undeclared function 'pagetable_pgd_ctor'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           pagetable_pgd_ctor(ptdesc);
           ^
   include/asm-generic/pgalloc.h:275:9: error: call to undeclared function 'ptdesc_address'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           return ptdesc_address(ptdesc);
                  ^
   include/asm-generic/pgalloc.h:275:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'pgd_t *' [-Wint-conversion]
           return ptdesc_address(ptdesc);
                  ^~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/pgalloc.h:281:26: error: call to undeclared function 'virt_to_ptdesc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           struct ptdesc *ptdesc = virt_to_ptdesc(pgd);
                                   ^
   include/asm-generic/pgalloc.h:281:17: error: incompatible integer to pointer conversion initializing 'struct ptdesc *' with an expression of type 'int' [-Wint-conversion]
           struct ptdesc *ptdesc = virt_to_ptdesc(pgd);
                          ^        ~~~~~~~~~~~~~~~~~~~
   include/asm-generic/pgalloc.h:284:2: error: call to undeclared function 'pagetable_dtor_free'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           pagetable_dtor_free(ptdesc);
           ^
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
c787ae5b391496 Vishal Moola (Oracle  2023-08-07 @26) 	return ptdesc_address(ptdesc);
5fba4af4456b5d Mike Rapoport         2019-07-11  27  }
2c321f3f70bc28 Suren Baghdasaryan    2024-04-14  28  #define __pte_alloc_one_kernel(...)	alloc_hooks(__pte_alloc_one_kernel_noprof(__VA_ARGS__))
5fba4af4456b5d Mike Rapoport         2019-07-11  29  
5fba4af4456b5d Mike Rapoport         2019-07-11  30  #ifndef __HAVE_ARCH_PTE_ALLOC_ONE_KERNEL
5fba4af4456b5d Mike Rapoport         2019-07-11  31  /**
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  32)  * pte_alloc_one_kernel - allocate memory for a PTE-level kernel page table
5fba4af4456b5d Mike Rapoport         2019-07-11  33   * @mm: the mm_struct of the current context
5fba4af4456b5d Mike Rapoport         2019-07-11  34   *
5fba4af4456b5d Mike Rapoport         2019-07-11  35   * Return: pointer to the allocated memory or %NULL on error
5fba4af4456b5d Mike Rapoport         2019-07-11  36   */
2c321f3f70bc28 Suren Baghdasaryan    2024-04-14  37  static inline pte_t *pte_alloc_one_kernel_noprof(struct mm_struct *mm)
5fba4af4456b5d Mike Rapoport         2019-07-11  38  {
2c321f3f70bc28 Suren Baghdasaryan    2024-04-14  39  	return __pte_alloc_one_kernel_noprof(mm);
5fba4af4456b5d Mike Rapoport         2019-07-11  40  }
2c321f3f70bc28 Suren Baghdasaryan    2024-04-14  41  #define pte_alloc_one_kernel(...)	alloc_hooks(pte_alloc_one_kernel_noprof(__VA_ARGS__))
5fba4af4456b5d Mike Rapoport         2019-07-11  42  #endif
5fba4af4456b5d Mike Rapoport         2019-07-11  43  
5fba4af4456b5d Mike Rapoport         2019-07-11  44  /**
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  45)  * pte_free_kernel - free PTE-level kernel page table memory
5fba4af4456b5d Mike Rapoport         2019-07-11  46   * @mm: the mm_struct of the current context
5fba4af4456b5d Mike Rapoport         2019-07-11  47   * @pte: pointer to the memory containing the page table
5fba4af4456b5d Mike Rapoport         2019-07-11  48   */
5fba4af4456b5d Mike Rapoport         2019-07-11  49  static inline void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
5fba4af4456b5d Mike Rapoport         2019-07-11  50  {
c787ae5b391496 Vishal Moola (Oracle  2023-08-07 @51) 	pagetable_free(virt_to_ptdesc(pte));
5fba4af4456b5d Mike Rapoport         2019-07-11  52  }
5fba4af4456b5d Mike Rapoport         2019-07-11  53  

:::::: The code at line 21 was first introduced by commit
:::::: 2c321f3f70bc284510598f712b702ce8d60c4d14 mm: change inlined allocation helpers to account at the call site

:::::: TO: Suren Baghdasaryan <surenb@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
