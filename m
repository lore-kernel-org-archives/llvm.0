Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653BC15F40A;
	Sun, 21 Jul 2024 10:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721557340; cv=none; b=KjtCFWmTvJJyuN/gWwjXD8JKqqwAKJdmnJmAnVpgzqZAUWmlUvd0m1mMCiP8DLT1M6FQuasVS9LrBKYnIjyUoOSTBKcpUK3qY4A6XTlTe3EH0wBpO9kGPYr1uC/jt5u3Jj+fOTdJeeZEkZMGZIm6GNG2lGJrQIRIDpYSqVJ4ZxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721557340; c=relaxed/simple;
	bh=DYL+GBWe0Tvre9x1g4k/RZ4CPx/B70yiR3P1IyI5jwM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e8Dzl/fEfgl840AoQ+HiWetBA+JkZq/jLM02yqwV08XgTLuQDKvTlDlnbPFsr1k6SPfE3IxeB4hauqmv4elrddnGRVvdM8H7XyyaUqFoEd0h2l1NQD1VQPrfhJWWjEiQlKEEaPVKwxi3wyQles20XmG0ErNOW/5j3aQ246UzTNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FgFAE5dI; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FgFAE5dI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721557338; x=1753093338;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DYL+GBWe0Tvre9x1g4k/RZ4CPx/B70yiR3P1IyI5jwM=;
  b=FgFAE5dI3tyel2PKouxQx5BHb7VkU+qfjCHVtW6p1EngaaiAjtDdGjDP
   WbUvF69nj8KA1FtpuaEJ2cD6ud107nOpbIYWnBafspY0UP912rBRgGxSm
   fKGpmsx3gkirMEBhSLnSvLZb2couf/oFWIhfsohWsDyWn8AaMwx8jbs81
   bUUdAUQpyfBK5gUXZFa7YVclRT+HyG9mCXPKrRsEg1tDjNTkTgRHkJMew
   cS/zDJe4MpGmKuPBUXkwUDfJ3/yPtPBj/R2m5carXDYi7cC8OmB5JyxX/
   un7Ia40gm5TbzQ4Qaa70fRR/YxbzSCxAsQTesxm4S0tSs2mPyt2Yy5D17
   w==;
X-CSE-ConnectionGUID: sNsvc8VITmqZIKCmYsEhTQ==
X-CSE-MsgGUID: u4UktAkhSViVDgS52HEssQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11139"; a="19262135"
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="19262135"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2024 03:22:17 -0700
X-CSE-ConnectionGUID: kKPaF2K1RuCcpFeMn0BRAw==
X-CSE-MsgGUID: BMYUNFz6SdaI2LhEa2Txjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="51466098"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 21 Jul 2024 03:22:15 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVThk-000kBk-2E;
	Sun, 21 Jul 2024 10:22:12 +0000
Date: Sun, 21 Jul 2024 18:21:27 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 47/56] mm/damon/vaddr.c:307:6: error: call to
 undeclared function 'pmd_trans_huge'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202407211853.4RE1o37u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi SeongJae,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   c3004f235d68aa890660b532b04714a40abafd78
commit: 06463781fa1457eb6fb892eb36da7be303933de6 [47/56] mm/damon/Kconfig: select DAMON modules to test when test config is set
config: riscv-randconfig-001-20240721 (https://download.01.org/0day-ci/archive/20240721/202407211853.4RE1o37u-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad154281230d83ee551e12d5be48bb956ef47ed3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240721/202407211853.4RE1o37u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407211853.4RE1o37u-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:744:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     744 |         insb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:104:53: note: expanded from macro 'insb'
     104 | #define insb(addr, buffer, count) __insb(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from mm/damon/vaddr.c:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:752:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     752 |         insw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:105:53: note: expanded from macro 'insw'
     105 | #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from mm/damon/vaddr.c:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:760:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     760 |         insl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:106:53: note: expanded from macro 'insl'
     106 | #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from mm/damon/vaddr.c:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:769:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     769 |         outsb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:118:55: note: expanded from macro 'outsb'
     118 | #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from mm/damon/vaddr.c:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:778:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     778 |         outsw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:119:55: note: expanded from macro 'outsw'
     119 | #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from mm/damon/vaddr.c:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:787:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     787 |         outsl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:120:55: note: expanded from macro 'outsl'
     120 | #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from mm/damon/vaddr.c:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:1115:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1115 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> mm/damon/vaddr.c:307:6: error: call to undeclared function 'pmd_trans_huge'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     307 |         if (pmd_trans_huge(pmdp_get(pmd))) {
         |             ^
>> mm/damon/vaddr.c:307:21: error: call to undeclared function 'pmdp_get'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     307 |         if (pmd_trans_huge(pmdp_get(pmd))) {
         |                            ^
   mm/damon/vaddr.c:309:8: error: assigning to 'pmd_t' from incompatible type 'int'
     309 |                 pmde = pmdp_get(pmd);
         |                      ^ ~~~~~~~~~~~~~
>> mm/damon/vaddr.c:311:8: error: call to undeclared function 'pmd_present'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     311 |                 if (!pmd_present(pmde)) {
         |                      ^
>> mm/damon/vaddr.c:329:7: error: call to undeclared function 'pte_present'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     329 |         if (!pte_present(ptep_get(pte)))
         |              ^
>> mm/damon/vaddr.c:329:19: error: call to undeclared function 'ptep_get'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     329 |         if (!pte_present(ptep_get(pte)))
         |                          ^
>> mm/damon/vaddr.c:333:2: error: call to undeclared function 'pte_unmap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     333 |         pte_unmap_unlock(pte, ptl);
         |         ^
   include/linux/mm.h:2987:2: note: expanded from macro 'pte_unmap_unlock'
    2987 |         pte_unmap(pte);                                 \
         |         ^
   mm/damon/vaddr.c:484:10: error: call to undeclared function 'ptep_get'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     484 |         ptent = ptep_get(pte);
         |                 ^
>> mm/damon/vaddr.c:484:8: error: assigning to 'pte_t' from incompatible type 'int'
     484 |         ptent = ptep_get(pte);
         |               ^ ~~~~~~~~~~~~~
   mm/damon/vaddr.c:485:7: error: call to undeclared function 'pte_present'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     485 |         if (!pte_present(ptent))
         |              ^
>> mm/damon/vaddr.c:487:26: error: call to undeclared function 'pte_pfn'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     487 |         folio = damon_get_folio(pte_pfn(ptent));
         |                                 ^
>> mm/damon/vaddr.c:490:6: error: call to undeclared function 'pte_young'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     490 |         if (pte_young(ptent) || !folio_test_idle(folio) ||
         |             ^
   mm/damon/vaddr.c:496:2: error: call to undeclared function 'pte_unmap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     496 |         pte_unmap_unlock(pte, ptl);
         |         ^
   include/linux/mm.h:2987:2: note: expanded from macro 'pte_unmap_unlock'
    2987 |         pte_unmap(pte);                                 \
         |         ^
   14 warnings and 13 errors generated.
--
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:744:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     744 |         insb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:104:53: note: expanded from macro 'insb'
     104 | #define insb(addr, buffer, count) __insb(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from mm/damon/ops-common.c:10:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:752:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     752 |         insw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:105:53: note: expanded from macro 'insw'
     105 | #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from mm/damon/ops-common.c:10:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:760:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     760 |         insl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:106:53: note: expanded from macro 'insl'
     106 | #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from mm/damon/ops-common.c:10:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:769:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     769 |         outsb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:118:55: note: expanded from macro 'outsb'
     118 | #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from mm/damon/ops-common.c:10:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:778:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     778 |         outsw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:119:55: note: expanded from macro 'outsw'
     119 | #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from mm/damon/ops-common.c:10:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:787:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     787 |         outsl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:120:55: note: expanded from macro 'outsl'
     120 | #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from mm/damon/ops-common.c:10:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:1115:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1115 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> mm/damon/ops-common.c:42:40: error: call to undeclared function 'pte_pfn'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      42 |         struct folio *folio = damon_get_folio(pte_pfn(ptep_get(pte)));
         |                                               ^
>> mm/damon/ops-common.c:42:48: error: call to undeclared function 'ptep_get'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      42 |         struct folio *folio = damon_get_folio(pte_pfn(ptep_get(pte)));
         |                                                       ^
>> mm/damon/ops-common.c:47:6: error: call to undeclared function 'ptep_test_and_clear_young'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      47 |         if (ptep_clear_young_notify(vma, addr, pte))
         |             ^
   include/linux/mmu_notifier.h:648:33: note: expanded from macro 'ptep_clear_young_notify'
     648 | #define ptep_clear_young_notify ptep_test_and_clear_young
         |                                 ^
   14 warnings and 3 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DAMON_VADDR
   Depends on [n]: DAMON [=y] && MMU [=n]
   Selected by [y]:
   - DAMON_VADDR_KUNIT_TEST [=y] && KUNIT [=y]
   WARNING: unmet direct dependencies detected for DAMON_DBGFS
   Depends on [n]: DAMON_DBGFS_DEPRECATED [=n]
   Selected by [y]:
   - DAMON_DBGFS_KUNIT_TEST [=y] && KUNIT [=y]


vim +/pmd_trans_huge +307 mm/damon/vaddr.c

3f49584b262cf8 SeongJae Park      2021-09-07  299  
3f49584b262cf8 SeongJae Park      2021-09-07  300  static int damon_mkold_pmd_entry(pmd_t *pmd, unsigned long addr,
3f49584b262cf8 SeongJae Park      2021-09-07  301  		unsigned long next, struct mm_walk *walk)
3f49584b262cf8 SeongJae Park      2021-09-07  302  {
3f49584b262cf8 SeongJae Park      2021-09-07  303  	pte_t *pte;
e7ee3f9791f560 Levi Yun           2023-07-28  304  	pmd_t pmde;
3f49584b262cf8 SeongJae Park      2021-09-07  305  	spinlock_t *ptl;
3f49584b262cf8 SeongJae Park      2021-09-07  306  
e7ee3f9791f560 Levi Yun           2023-07-28 @307  	if (pmd_trans_huge(pmdp_get(pmd))) {
3f49584b262cf8 SeongJae Park      2021-09-07  308  		ptl = pmd_lock(walk->mm, pmd);
e7ee3f9791f560 Levi Yun           2023-07-28  309  		pmde = pmdp_get(pmd);
e7ee3f9791f560 Levi Yun           2023-07-28  310  
e7ee3f9791f560 Levi Yun           2023-07-28 @311  		if (!pmd_present(pmde)) {
c8b9aff419303e Baolin Wang        2022-08-18  312  			spin_unlock(ptl);
c8b9aff419303e Baolin Wang        2022-08-18  313  			return 0;
c8b9aff419303e Baolin Wang        2022-08-18  314  		}
c8b9aff419303e Baolin Wang        2022-08-18  315  
e7ee3f9791f560 Levi Yun           2023-07-28  316  		if (pmd_trans_huge(pmde)) {
c11d34fa139e4b Ryan Roberts       2023-06-02  317  			damon_pmdp_mkold(pmd, walk->vma, addr);
3f49584b262cf8 SeongJae Park      2021-09-07  318  			spin_unlock(ptl);
3f49584b262cf8 SeongJae Park      2021-09-07  319  			return 0;
3f49584b262cf8 SeongJae Park      2021-09-07  320  		}
3f49584b262cf8 SeongJae Park      2021-09-07  321  		spin_unlock(ptl);
3f49584b262cf8 SeongJae Park      2021-09-07  322  	}
3f49584b262cf8 SeongJae Park      2021-09-07  323  
3f49584b262cf8 SeongJae Park      2021-09-07  324  	pte = pte_offset_map_lock(walk->mm, pmd, addr, &ptl);
7780d04046a228 Hugh Dickins       2023-06-08  325  	if (!pte) {
7780d04046a228 Hugh Dickins       2023-06-08  326  		walk->action = ACTION_AGAIN;
7780d04046a228 Hugh Dickins       2023-06-08  327  		return 0;
7780d04046a228 Hugh Dickins       2023-06-08  328  	}
c33c794828f212 Ryan Roberts       2023-06-12 @329  	if (!pte_present(ptep_get(pte)))
3f49584b262cf8 SeongJae Park      2021-09-07  330  		goto out;
c11d34fa139e4b Ryan Roberts       2023-06-02  331  	damon_ptep_mkold(pte, walk->vma, addr);
3f49584b262cf8 SeongJae Park      2021-09-07  332  out:
3f49584b262cf8 SeongJae Park      2021-09-07 @333  	pte_unmap_unlock(pte, ptl);
3f49584b262cf8 SeongJae Park      2021-09-07  334  	return 0;
3f49584b262cf8 SeongJae Park      2021-09-07  335  }
3f49584b262cf8 SeongJae Park      2021-09-07  336  
49f4203aae06ba Baolin Wang        2022-01-14  337  #ifdef CONFIG_HUGETLB_PAGE
49f4203aae06ba Baolin Wang        2022-01-14  338  static void damon_hugetlb_mkold(pte_t *pte, struct mm_struct *mm,
49f4203aae06ba Baolin Wang        2022-01-14  339  				struct vm_area_struct *vma, unsigned long addr)
49f4203aae06ba Baolin Wang        2022-01-14  340  {
49f4203aae06ba Baolin Wang        2022-01-14  341  	bool referenced = false;
e6c0c03245b14d Christophe Leroy   2024-07-02  342  	pte_t entry = huge_ptep_get(mm, addr, pte);
6b7cea90c82e10 Kefeng Wang        2022-12-30  343  	struct folio *folio = pfn_folio(pte_pfn(entry));
935d4f0c6dc8b3 Ryan Roberts       2023-09-22  344  	unsigned long psize = huge_page_size(hstate_vma(vma));
49f4203aae06ba Baolin Wang        2022-01-14  345  
6b7cea90c82e10 Kefeng Wang        2022-12-30  346  	folio_get(folio);
49f4203aae06ba Baolin Wang        2022-01-14  347  
49f4203aae06ba Baolin Wang        2022-01-14  348  	if (pte_young(entry)) {
49f4203aae06ba Baolin Wang        2022-01-14  349  		referenced = true;
49f4203aae06ba Baolin Wang        2022-01-14  350  		entry = pte_mkold(entry);
935d4f0c6dc8b3 Ryan Roberts       2023-09-22  351  		set_huge_pte_at(mm, addr, pte, entry, psize);
49f4203aae06ba Baolin Wang        2022-01-14  352  	}
49f4203aae06ba Baolin Wang        2022-01-14  353  
49f4203aae06ba Baolin Wang        2022-01-14  354  #ifdef CONFIG_MMU_NOTIFIER
49f4203aae06ba Baolin Wang        2022-01-14  355  	if (mmu_notifier_clear_young(mm, addr,
49f4203aae06ba Baolin Wang        2022-01-14  356  				     addr + huge_page_size(hstate_vma(vma))))
49f4203aae06ba Baolin Wang        2022-01-14  357  		referenced = true;
49f4203aae06ba Baolin Wang        2022-01-14  358  #endif /* CONFIG_MMU_NOTIFIER */
49f4203aae06ba Baolin Wang        2022-01-14  359  
49f4203aae06ba Baolin Wang        2022-01-14  360  	if (referenced)
6b7cea90c82e10 Kefeng Wang        2022-12-30  361  		folio_set_young(folio);
49f4203aae06ba Baolin Wang        2022-01-14  362  
6b7cea90c82e10 Kefeng Wang        2022-12-30  363  	folio_set_idle(folio);
6b7cea90c82e10 Kefeng Wang        2022-12-30  364  	folio_put(folio);
49f4203aae06ba Baolin Wang        2022-01-14  365  }
49f4203aae06ba Baolin Wang        2022-01-14  366  
49f4203aae06ba Baolin Wang        2022-01-14  367  static int damon_mkold_hugetlb_entry(pte_t *pte, unsigned long hmask,
49f4203aae06ba Baolin Wang        2022-01-14  368  				     unsigned long addr, unsigned long end,
49f4203aae06ba Baolin Wang        2022-01-14  369  				     struct mm_walk *walk)
49f4203aae06ba Baolin Wang        2022-01-14  370  {
49f4203aae06ba Baolin Wang        2022-01-14  371  	struct hstate *h = hstate_vma(walk->vma);
49f4203aae06ba Baolin Wang        2022-01-14  372  	spinlock_t *ptl;
49f4203aae06ba Baolin Wang        2022-01-14  373  	pte_t entry;
49f4203aae06ba Baolin Wang        2022-01-14  374  
49f4203aae06ba Baolin Wang        2022-01-14  375  	ptl = huge_pte_lock(h, walk->mm, pte);
e6c0c03245b14d Christophe Leroy   2024-07-02  376  	entry = huge_ptep_get(walk->mm, addr, pte);
49f4203aae06ba Baolin Wang        2022-01-14  377  	if (!pte_present(entry))
49f4203aae06ba Baolin Wang        2022-01-14  378  		goto out;
49f4203aae06ba Baolin Wang        2022-01-14  379  
49f4203aae06ba Baolin Wang        2022-01-14  380  	damon_hugetlb_mkold(pte, walk->mm, walk->vma, addr);
49f4203aae06ba Baolin Wang        2022-01-14  381  
49f4203aae06ba Baolin Wang        2022-01-14  382  out:
49f4203aae06ba Baolin Wang        2022-01-14  383  	spin_unlock(ptl);
49f4203aae06ba Baolin Wang        2022-01-14  384  	return 0;
49f4203aae06ba Baolin Wang        2022-01-14  385  }
49f4203aae06ba Baolin Wang        2022-01-14  386  #else
49f4203aae06ba Baolin Wang        2022-01-14  387  #define damon_mkold_hugetlb_entry NULL
49f4203aae06ba Baolin Wang        2022-01-14  388  #endif /* CONFIG_HUGETLB_PAGE */
49f4203aae06ba Baolin Wang        2022-01-14  389  
199b50f4c9485c Rikard Falkeborn   2021-11-05  390  static const struct mm_walk_ops damon_mkold_ops = {
3f49584b262cf8 SeongJae Park      2021-09-07  391  	.pmd_entry = damon_mkold_pmd_entry,
49f4203aae06ba Baolin Wang        2022-01-14  392  	.hugetlb_entry = damon_mkold_hugetlb_entry,
49b0638502da09 Suren Baghdasaryan 2023-08-04  393  	.walk_lock = PGWALK_RDLOCK,
3f49584b262cf8 SeongJae Park      2021-09-07  394  };
3f49584b262cf8 SeongJae Park      2021-09-07  395  
3f49584b262cf8 SeongJae Park      2021-09-07  396  static void damon_va_mkold(struct mm_struct *mm, unsigned long addr)
3f49584b262cf8 SeongJae Park      2021-09-07  397  {
3f49584b262cf8 SeongJae Park      2021-09-07  398  	mmap_read_lock(mm);
3f49584b262cf8 SeongJae Park      2021-09-07  399  	walk_page_range(mm, addr, addr + 1, &damon_mkold_ops, NULL);
3f49584b262cf8 SeongJae Park      2021-09-07  400  	mmap_read_unlock(mm);
3f49584b262cf8 SeongJae Park      2021-09-07  401  }
3f49584b262cf8 SeongJae Park      2021-09-07  402  
3f49584b262cf8 SeongJae Park      2021-09-07  403  /*
3f49584b262cf8 SeongJae Park      2021-09-07  404   * Functions for the access checking of the regions
3f49584b262cf8 SeongJae Park      2021-09-07  405   */
3f49584b262cf8 SeongJae Park      2021-09-07  406  
8ef4d5caa66d62 Kaixu Xia          2022-09-13  407  static void __damon_va_prepare_access_check(struct mm_struct *mm,
8ef4d5caa66d62 Kaixu Xia          2022-09-13  408  					struct damon_region *r)
3f49584b262cf8 SeongJae Park      2021-09-07  409  {
3f49584b262cf8 SeongJae Park      2021-09-07  410  	r->sampling_addr = damon_rand(r->ar.start, r->ar.end);
3f49584b262cf8 SeongJae Park      2021-09-07  411  
3f49584b262cf8 SeongJae Park      2021-09-07  412  	damon_va_mkold(mm, r->sampling_addr);
3f49584b262cf8 SeongJae Park      2021-09-07  413  }
3f49584b262cf8 SeongJae Park      2021-09-07  414  
cdeed009f3bcee Xin Hao            2022-01-14  415  static void damon_va_prepare_access_checks(struct damon_ctx *ctx)
3f49584b262cf8 SeongJae Park      2021-09-07  416  {
3f49584b262cf8 SeongJae Park      2021-09-07  417  	struct damon_target *t;
3f49584b262cf8 SeongJae Park      2021-09-07  418  	struct mm_struct *mm;
3f49584b262cf8 SeongJae Park      2021-09-07  419  	struct damon_region *r;
3f49584b262cf8 SeongJae Park      2021-09-07  420  
3f49584b262cf8 SeongJae Park      2021-09-07  421  	damon_for_each_target(t, ctx) {
3f49584b262cf8 SeongJae Park      2021-09-07  422  		mm = damon_get_mm(t);
3f49584b262cf8 SeongJae Park      2021-09-07  423  		if (!mm)
3f49584b262cf8 SeongJae Park      2021-09-07  424  			continue;
3f49584b262cf8 SeongJae Park      2021-09-07  425  		damon_for_each_region(r, t)
8ef4d5caa66d62 Kaixu Xia          2022-09-13  426  			__damon_va_prepare_access_check(mm, r);
3f49584b262cf8 SeongJae Park      2021-09-07  427  		mmput(mm);
3f49584b262cf8 SeongJae Park      2021-09-07  428  	}
3f49584b262cf8 SeongJae Park      2021-09-07  429  }
3f49584b262cf8 SeongJae Park      2021-09-07  430  
3f49584b262cf8 SeongJae Park      2021-09-07  431  struct damon_young_walk_private {
fc8c7d2380ab7d SeongJae Park      2023-01-09  432  	/* size of the folio for the access checked virtual memory address */
fc8c7d2380ab7d SeongJae Park      2023-01-09  433  	unsigned long *folio_sz;
3f49584b262cf8 SeongJae Park      2021-09-07  434  	bool young;
3f49584b262cf8 SeongJae Park      2021-09-07  435  };
3f49584b262cf8 SeongJae Park      2021-09-07  436  
3f49584b262cf8 SeongJae Park      2021-09-07  437  static int damon_young_pmd_entry(pmd_t *pmd, unsigned long addr,
3f49584b262cf8 SeongJae Park      2021-09-07  438  		unsigned long next, struct mm_walk *walk)
3f49584b262cf8 SeongJae Park      2021-09-07  439  {
3f49584b262cf8 SeongJae Park      2021-09-07  440  	pte_t *pte;
c33c794828f212 Ryan Roberts       2023-06-12  441  	pte_t ptent;
3f49584b262cf8 SeongJae Park      2021-09-07  442  	spinlock_t *ptl;
dc1b78665b37ec Kefeng Wang        2022-12-30  443  	struct folio *folio;
3f49584b262cf8 SeongJae Park      2021-09-07  444  	struct damon_young_walk_private *priv = walk->private;
3f49584b262cf8 SeongJae Park      2021-09-07  445  
3f49584b262cf8 SeongJae Park      2021-09-07  446  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
e7ee3f9791f560 Levi Yun           2023-07-28  447  	if (pmd_trans_huge(pmdp_get(pmd))) {
e7ee3f9791f560 Levi Yun           2023-07-28  448  		pmd_t pmde;
e7ee3f9791f560 Levi Yun           2023-07-28  449  
3f49584b262cf8 SeongJae Park      2021-09-07  450  		ptl = pmd_lock(walk->mm, pmd);
e7ee3f9791f560 Levi Yun           2023-07-28  451  		pmde = pmdp_get(pmd);
e7ee3f9791f560 Levi Yun           2023-07-28  452  
e7ee3f9791f560 Levi Yun           2023-07-28  453  		if (!pmd_present(pmde)) {
c8b9aff419303e Baolin Wang        2022-08-18  454  			spin_unlock(ptl);
c8b9aff419303e Baolin Wang        2022-08-18  455  			return 0;
c8b9aff419303e Baolin Wang        2022-08-18  456  		}
c8b9aff419303e Baolin Wang        2022-08-18  457  
e7ee3f9791f560 Levi Yun           2023-07-28  458  		if (!pmd_trans_huge(pmde)) {
3f49584b262cf8 SeongJae Park      2021-09-07  459  			spin_unlock(ptl);
3f49584b262cf8 SeongJae Park      2021-09-07  460  			goto regular_page;
3f49584b262cf8 SeongJae Park      2021-09-07  461  		}
e7ee3f9791f560 Levi Yun           2023-07-28  462  		folio = damon_get_folio(pmd_pfn(pmde));
dc1b78665b37ec Kefeng Wang        2022-12-30  463  		if (!folio)
3f49584b262cf8 SeongJae Park      2021-09-07  464  			goto huge_out;
e7ee3f9791f560 Levi Yun           2023-07-28  465  		if (pmd_young(pmde) || !folio_test_idle(folio) ||
3f49584b262cf8 SeongJae Park      2021-09-07  466  					mmu_notifier_test_young(walk->mm,
7477d7560cb2c7 SeongJae Park      2023-01-09  467  						addr))
3f49584b262cf8 SeongJae Park      2021-09-07  468  			priv->young = true;
7477d7560cb2c7 SeongJae Park      2023-01-09  469  		*priv->folio_sz = HPAGE_PMD_SIZE;
dc1b78665b37ec Kefeng Wang        2022-12-30  470  		folio_put(folio);
3f49584b262cf8 SeongJae Park      2021-09-07  471  huge_out:
3f49584b262cf8 SeongJae Park      2021-09-07  472  		spin_unlock(ptl);
3f49584b262cf8 SeongJae Park      2021-09-07  473  		return 0;
3f49584b262cf8 SeongJae Park      2021-09-07  474  	}
3f49584b262cf8 SeongJae Park      2021-09-07  475  
3f49584b262cf8 SeongJae Park      2021-09-07  476  regular_page:
3f49584b262cf8 SeongJae Park      2021-09-07  477  #endif	/* CONFIG_TRANSPARENT_HUGEPAGE */
3f49584b262cf8 SeongJae Park      2021-09-07  478  
3f49584b262cf8 SeongJae Park      2021-09-07  479  	pte = pte_offset_map_lock(walk->mm, pmd, addr, &ptl);
7780d04046a228 Hugh Dickins       2023-06-08  480  	if (!pte) {
7780d04046a228 Hugh Dickins       2023-06-08  481  		walk->action = ACTION_AGAIN;
7780d04046a228 Hugh Dickins       2023-06-08  482  		return 0;
7780d04046a228 Hugh Dickins       2023-06-08  483  	}
c33c794828f212 Ryan Roberts       2023-06-12 @484  	ptent = ptep_get(pte);
c33c794828f212 Ryan Roberts       2023-06-12  485  	if (!pte_present(ptent))
3f49584b262cf8 SeongJae Park      2021-09-07  486  		goto out;
c33c794828f212 Ryan Roberts       2023-06-12 @487  	folio = damon_get_folio(pte_pfn(ptent));
dc1b78665b37ec Kefeng Wang        2022-12-30  488  	if (!folio)
3f49584b262cf8 SeongJae Park      2021-09-07  489  		goto out;
c33c794828f212 Ryan Roberts       2023-06-12 @490  	if (pte_young(ptent) || !folio_test_idle(folio) ||
7477d7560cb2c7 SeongJae Park      2023-01-09  491  			mmu_notifier_test_young(walk->mm, addr))
3f49584b262cf8 SeongJae Park      2021-09-07  492  		priv->young = true;
7477d7560cb2c7 SeongJae Park      2023-01-09  493  	*priv->folio_sz = folio_size(folio);
dc1b78665b37ec Kefeng Wang        2022-12-30  494  	folio_put(folio);
3f49584b262cf8 SeongJae Park      2021-09-07  495  out:
3f49584b262cf8 SeongJae Park      2021-09-07  496  	pte_unmap_unlock(pte, ptl);
3f49584b262cf8 SeongJae Park      2021-09-07  497  	return 0;
3f49584b262cf8 SeongJae Park      2021-09-07  498  }
3f49584b262cf8 SeongJae Park      2021-09-07  499  

:::::: The code at line 307 was first introduced by commit
:::::: e7ee3f9791f5601fc032b222a70a02b9798784be damon: use pmdp_get instead of drectly dereferencing pmd

:::::: TO: Levi Yun <ppbuk5246@gmail.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
