Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D01F15C5;
	Sat, 20 Jan 2024 03:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705719868; cv=none; b=Fu/HSHRcKAWCxj2wMKCgcgRy4BAWlR0ZE7gGrG+Cp/OpSvPAEBr7amT6h4qPrR5xeLjum5/Vy3tLVxZ6Pxgf3WO34Fr1sGPe5z52UfaVbB5RFv9vtaT3zFQd3ycEMM0uFOwnoZ/hKQBfCiM5II6VE2tAyW5mQsnil4zgmV0JTG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705719868; c=relaxed/simple;
	bh=2xghqmRSUY67HTCbE1la3y9TSEue/pja+Ah46sIs47Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eQ5BMvjnw4ZwCJ2c6Ud1MbT1YZbaqf+WSqXp6aGKcIdh/VZ3FKS0I7XHWv7ypZLcXZGr2Jka2cihJKzs/oKE3RdutlI3e6+dl/cVORR3VgPIt89EvKKdt7UUd2o/CcR1LXlDBvVjwHMFl1c0/CIm30LaEeUsELXfOWQ3GktFJD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pv04dNrh; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pv04dNrh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705719866; x=1737255866;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2xghqmRSUY67HTCbE1la3y9TSEue/pja+Ah46sIs47Y=;
  b=Pv04dNrh4YVJ6yLYF8CfsQrr+Z88lxt7gVvuwYjIH/Sg0AFkj/rfG79f
   kwyH6f5BNq/xfE701XYGkfU8pDLRRHYgOirdHtXbomroTRGTW1/HnS6sW
   pH+39QFinA+VdZ2QAm70IC2cvShIpc2FU9Z7fhjx+FPCOarZLjG4Sw1TN
   82rExqJTBDoAdT+7uX1KgeOhG+s+pElFNP/l/pzKnrTO66swOsuL09sC8
   v+gY3jyTTrBxgxzWT6wcn9WTZGzmmbdNfp6srk6MqZtNtuc5lpyRtS31D
   6CXxBpv0b7d9nya7jNYCT79PvCm1vLEZVRNC8tCShuXw93lSqDrErXvvG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="801195"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="801195"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 19:04:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="27183735"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 19 Jan 2024 19:04:23 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rR1ef-0004fQ-2T;
	Sat, 20 Jan 2024 03:04:21 +0000
Date: Sat, 20 Jan 2024 11:04:03 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:rmap_batching 11/11]
 include/linux/pgtable.h:250:8: error: implicit declaration of function
 'ptep_get_and_clear_full' is invalid in C99
Message-ID: <202401201129.CtaytKvQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux rmap_batching
head:   c54f3b69b7a799efa06dbf58a60db9b3fac04111
commit: c54f3b69b7a799efa06dbf58a60db9b3fac04111 [11/11] mm/memory: optimize unmap/zap with PTE-mapped THP
config: arm64-randconfig-004-20240120 (https://download.01.org/0day-ci/archive/20240120/202401201129.CtaytKvQ-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240120/202401201129.CtaytKvQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401201129.CtaytKvQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kernel/asm-offsets.c:12:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/arm64/include/asm/hardirq.h:17:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/arm64/include/asm/io.h:12:
   include/linux/pgtable.h:218:38: error: use of undeclared identifier 'PFN_PTE_SHIFT'
           return __pte(pte_val(pte) + (1UL << PFN_PTE_SHIFT));
                                               ^
>> include/linux/pgtable.h:250:8: error: implicit declaration of function 'ptep_get_and_clear_full' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           pte = ptep_get_and_clear_full(mm, addr, ptep, full);
                 ^
   include/linux/pgtable.h:250:8: note: did you mean 'ptep_get_and_clear'?
   arch/arm64/include/asm/pgtable.h:951:21: note: 'ptep_get_and_clear' declared here
   static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
                       ^
   In file included from arch/arm64/kernel/asm-offsets.c:12:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/arm64/include/asm/hardirq.h:17:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/arm64/include/asm/io.h:12:
   include/linux/pgtable.h:250:6: error: assigning to 'pte_t' from incompatible type 'int'
           pte = ptep_get_and_clear_full(mm, addr, ptep, full);
               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pgtable.h:257:11: error: assigning to 'pte_t' from incompatible type 'int'
                   tmp_pte = ptep_get_and_clear_full(mm, addr, ptep, full);
                           ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pgtable.h:277:3: error: implicit declaration of function 'ptep_get_and_clear_full' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   ptep_get_and_clear_full(mm, addr, ptep, full);
                   ^
   include/linux/pgtable.h:617:21: error: static declaration of 'ptep_get_and_clear_full' follows non-static declaration
   static inline pte_t ptep_get_and_clear_full(struct mm_struct *mm,
                       ^
   include/linux/pgtable.h:250:8: note: previous implicit declaration is here
           pte = ptep_get_and_clear_full(mm, addr, ptep, full);
                 ^
   6 errors generated.
   make[3]: *** [scripts/Makefile.build:116: arch/arm64/kernel/asm-offsets.s] Error 1 shuffle=2382276736
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1191: prepare0] Error 2 shuffle=2382276736
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2 shuffle=2382276736
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2 shuffle=2382276736
   make: Target 'prepare' not remade because of errors.


vim +/ptep_get_and_clear_full +250 include/linux/pgtable.h

   235	
   236	#ifndef get_and_clear_full_ptes
   237	/*
   238	 * Will merge accessed/dirty bits from all PTEs and merge them into
   239	 * the first folio.
   240	 *
   241	 * Will not merge writable bits: the returned PTE might be R/O while some
   242	 * PTE might have been writable.
   243	 */
   244	static inline pte_t get_and_clear_full_ptes(struct mm_struct *mm,
   245			unsigned long addr, pte_t *ptep, unsigned int nr, int full)
   246	{
   247		pte_t tmp_pte;
   248		pte_t pte;
   249	
 > 250		pte = ptep_get_and_clear_full(mm, addr, ptep, full);
   251		if (--nr == 0)
   252			return pte;
   253		ptep++;
   254		addr += PAGE_SIZE;
   255	
   256		for (;;) {
   257			tmp_pte = ptep_get_and_clear_full(mm, addr, ptep, full);
   258			if (pte_dirty(tmp_pte))
   259				pte = pte_mkdirty(pte);
   260			if (pte_young(tmp_pte))
   261				pte = pte_mkyoung(pte);
   262			if (--nr == 0)
   263				break;
   264			ptep++;
   265			addr += PAGE_SIZE;
   266		}
   267	
   268		return pte;
   269	}
   270	#endif
   271	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
