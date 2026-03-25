Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8118B2E401;
	Wed, 25 Mar 2026 05:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774416252; cv=none; b=ady+V3Um7yhciW8frkdMP6HfQCl0e2koLRv6dagmHuTqxLeVa3AsnFqqIo7Z5SqW9PO79VBeT8K+RSZ9GySp+qAFutlcndfTJlw65Bzm9CbDmG7p7lwJgd2/qUr/88sMn05LY8NI+jG4WLJGSEIhR5yMXL/gaB//g/ZR1nFW7Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774416252; c=relaxed/simple;
	bh=DQrJC7dyBQ9LgVoCAfL8W6FvWRvjfLA74pprv2ClgI4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=baKeZuQGBB3nWT3yiyDx0epyu1GakeSBMQFkMWGK/W7whDVzSyYbc6E04kfA0UCQtTzman8wWZzpFgY7Q86ANpYppZY+Sn/cX7SGLjU/wfjemKYgJWEYZ+eUXLDMQPc1Z3sd7zYqTa7zY7pjwFWclVugI8+96NjDiMJO2yetejU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FuUS/rDQ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FuUS/rDQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774416251; x=1805952251;
  h=date:from:to:cc:subject:message-id;
  bh=DQrJC7dyBQ9LgVoCAfL8W6FvWRvjfLA74pprv2ClgI4=;
  b=FuUS/rDQqBHm6OU1yeE7FPAorLsLMvehZuqyKCVCTktTFagcdyCCWwh3
   irxotIc0V4FMykjLIsXXaTBPkWJXXiXh1298XDYWZ2qWix7mTfnI3QZA1
   tbS1up8+HEC49czAmf+d9Hf5FMsO66gIDqOIE1zatQn9vAm8exe1DZLZN
   bIJtRGfhv81pCyQg+ES9pQshIMNQfME92Dke+rotS2V2qMPwLlF6zGrbE
   hzOPdsOrlIk13eig4cxLg5qJ2CRb0Jzp27hSirY0sqehCskPtlE6pymym
   h3qPIULVbkaRoQzcpLjMr27bsnWCNqx++fEcVpRK+uxMxfnLbstdHH3LY
   Q==;
X-CSE-ConnectionGUID: R5kETE26SoWDcWfsTwKxGg==
X-CSE-MsgGUID: SHzKz/VhSuSx3WLvumeqyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75333115"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="75333115"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 22:24:10 -0700
X-CSE-ConnectionGUID: 7cdP0t8cRjO0giEige8+mA==
X-CSE-MsgGUID: +cdNCMBXQUS9SH1SIz5a+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="226211092"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 24 Mar 2026 22:24:07 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5Giq-000000006Ej-3sFb;
	Wed, 25 Mar 2026 05:24:04 +0000
Date: Wed, 25 Mar 2026 13:23:37 +0800
From: kernel test robot <lkp@intel.com>
To: Chengkaitao <chengkaitao@kylinos.cn>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-stable 72/140] arch/sparc/mm/init_64.c:2582:16:
 error: call to undeclared function 'vmemmap_pgd_populate'; ISO C99 and later
 do not support implicit function declarations
Message-ID: <202603251338.grra8xt7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-stable
head:   e393ce79b3cf63c2810be882eb6e531a54f520f4
commit: e504282091c8e4dc4f945c89d9b44ac2e0bfe504 [72/140] mm: convert vmemmap_p?d_populate() to static functions
config: sparc64-randconfig-002-20260325 (https://download.01.org/0day-ci/archive/20260325/202603251338.grra8xt7-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603251338.grra8xt7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603251338.grra8xt7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/sparc/mm/init_64.c:2582:16: error: call to undeclared function 'vmemmap_pgd_populate'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2582 |                 pgd_t *pgd = vmemmap_pgd_populate(vstart, node);
         |                              ^
   arch/sparc/mm/init_64.c:2582:16: note: did you mean 'vmemmap_populate'?
   arch/sparc/mm/init_64.c:2565:15: note: 'vmemmap_populate' declared here
    2565 | int __meminit vmemmap_populate(unsigned long vstart, unsigned long vend,
         |               ^
>> arch/sparc/mm/init_64.c:2582:10: error: incompatible integer to pointer conversion initializing 'pgd_t *' with an expression of type 'int' [-Wint-conversion]
    2582 |                 pgd_t *pgd = vmemmap_pgd_populate(vstart, node);
         |                        ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/sparc/mm/init_64.c:2591:9: error: call to undeclared function 'vmemmap_p4d_populate'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2591 |                 p4d = vmemmap_p4d_populate(pgd, vstart, node);
         |                       ^
>> arch/sparc/mm/init_64.c:2591:7: error: incompatible integer to pointer conversion assigning to 'p4d_t *' from 'int' [-Wint-conversion]
    2591 |                 p4d = vmemmap_p4d_populate(pgd, vstart, node);
         |                     ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/sparc/mm/init_64.c:2595:9: error: call to undeclared function 'vmemmap_pud_populate'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2595 |                 pud = vmemmap_pud_populate(p4d, vstart, node);
         |                       ^
>> arch/sparc/mm/init_64.c:2595:7: error: incompatible integer to pointer conversion assigning to 'pud_t *' from 'int' [-Wint-conversion]
    2595 |                 pud = vmemmap_pud_populate(p4d, vstart, node);
         |                     ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   6 errors generated.


vim +/vmemmap_pgd_populate +2582 arch/sparc/mm/init_64.c

c4bce90ea2069e5 arch/sparc64/mm/init.c  David S. Miller   2006-02-11  2563  
46644c2477c5890 arch/sparc64/mm/init.c  David Miller      2007-10-16  2564  #ifdef CONFIG_SPARSEMEM_VMEMMAP
0aad818b2de455f arch/sparc/mm/init_64.c Johannes Weiner   2013-04-29 @2565  int __meminit vmemmap_populate(unsigned long vstart, unsigned long vend,
7b73d978a5d0d2a arch/sparc/mm/init_64.c Christoph Hellwig 2017-12-29  2566  			       int node, struct vmem_altmap *altmap)
46644c2477c5890 arch/sparc64/mm/init.c  David Miller      2007-10-16  2567  {
46644c2477c5890 arch/sparc64/mm/init.c  David Miller      2007-10-16  2568  	unsigned long pte_base;
46644c2477c5890 arch/sparc64/mm/init.c  David Miller      2007-10-16  2569  
46644c2477c5890 arch/sparc64/mm/init.c  David Miller      2007-10-16  2570  	pte_base = (_PAGE_VALID | _PAGE_SZ4MB_4U |
46644c2477c5890 arch/sparc64/mm/init.c  David Miller      2007-10-16  2571  		    _PAGE_CP_4U | _PAGE_CV_4U |
46644c2477c5890 arch/sparc64/mm/init.c  David Miller      2007-10-16  2572  		    _PAGE_P_4U | _PAGE_W_4U);
46644c2477c5890 arch/sparc64/mm/init.c  David Miller      2007-10-16  2573  	if (tlb_type == hypervisor)
46644c2477c5890 arch/sparc64/mm/init.c  David Miller      2007-10-16  2574  		pte_base = (_PAGE_VALID | _PAGE_SZ4MB_4V |
494e5b6faeda1d1 arch/sparc/mm/init_64.c Khalid Aziz       2015-05-27  2575  			    page_cache4v_flag | _PAGE_P_4V | _PAGE_W_4V);
46644c2477c5890 arch/sparc64/mm/init.c  David Miller      2007-10-16  2576  
c06240c7f5c39c8 arch/sparc/mm/init_64.c David S. Miller   2014-09-24  2577  	pte_base |= _PAGE_PMD_HUGE;
46644c2477c5890 arch/sparc64/mm/init.c  David Miller      2007-10-16  2578  
c06240c7f5c39c8 arch/sparc/mm/init_64.c David S. Miller   2014-09-24  2579  	vstart = vstart & PMD_MASK;
c06240c7f5c39c8 arch/sparc/mm/init_64.c David S. Miller   2014-09-24  2580  	vend = ALIGN(vend, PMD_SIZE);
c06240c7f5c39c8 arch/sparc/mm/init_64.c David S. Miller   2014-09-24  2581  	for (; vstart < vend; vstart += PMD_SIZE) {
df8ee578894ebb5 arch/sparc/mm/init_64.c Pavel Tatashin    2017-11-15 @2582  		pgd_t *pgd = vmemmap_pgd_populate(vstart, node);
c06240c7f5c39c8 arch/sparc/mm/init_64.c David S. Miller   2014-09-24  2583  		unsigned long pte;
5637bc504834045 arch/sparc/mm/init_64.c Mike Rapoport     2019-11-24  2584  		p4d_t *p4d;
c06240c7f5c39c8 arch/sparc/mm/init_64.c David S. Miller   2014-09-24  2585  		pud_t *pud;
c06240c7f5c39c8 arch/sparc/mm/init_64.c David S. Miller   2014-09-24  2586  		pmd_t *pmd;
46644c2477c5890 arch/sparc64/mm/init.c  David Miller      2007-10-16  2587  
df8ee578894ebb5 arch/sparc/mm/init_64.c Pavel Tatashin    2017-11-15  2588  		if (!pgd)
c06240c7f5c39c8 arch/sparc/mm/init_64.c David S. Miller   2014-09-24  2589  			return -ENOMEM;
c06240c7f5c39c8 arch/sparc/mm/init_64.c David S. Miller   2014-09-24  2590  
5637bc504834045 arch/sparc/mm/init_64.c Mike Rapoport     2019-11-24 @2591  		p4d = vmemmap_p4d_populate(pgd, vstart, node);
5637bc504834045 arch/sparc/mm/init_64.c Mike Rapoport     2019-11-24  2592  		if (!p4d)
5637bc504834045 arch/sparc/mm/init_64.c Mike Rapoport     2019-11-24  2593  			return -ENOMEM;
5637bc504834045 arch/sparc/mm/init_64.c Mike Rapoport     2019-11-24  2594  
5637bc504834045 arch/sparc/mm/init_64.c Mike Rapoport     2019-11-24 @2595  		pud = vmemmap_pud_populate(p4d, vstart, node);
df8ee578894ebb5 arch/sparc/mm/init_64.c Pavel Tatashin    2017-11-15  2596  		if (!pud)
c06240c7f5c39c8 arch/sparc/mm/init_64.c David S. Miller   2014-09-24  2597  			return -ENOMEM;
c06240c7f5c39c8 arch/sparc/mm/init_64.c David S. Miller   2014-09-24  2598  
c06240c7f5c39c8 arch/sparc/mm/init_64.c David S. Miller   2014-09-24  2599  		pmd = pmd_offset(pud, vstart);
c06240c7f5c39c8 arch/sparc/mm/init_64.c David S. Miller   2014-09-24  2600  		pte = pmd_val(*pmd);
c06240c7f5c39c8 arch/sparc/mm/init_64.c David S. Miller   2014-09-24  2601  		if (!(pte & _PAGE_VALID)) {
c06240c7f5c39c8 arch/sparc/mm/init_64.c David S. Miller   2014-09-24  2602  			void *block = vmemmap_alloc_block(PMD_SIZE, node);
c06240c7f5c39c8 arch/sparc/mm/init_64.c David S. Miller   2014-09-24  2603  
c06240c7f5c39c8 arch/sparc/mm/init_64.c David S. Miller   2014-09-24  2604  			if (!block)
c06240c7f5c39c8 arch/sparc/mm/init_64.c David S. Miller   2014-09-24  2605  				return -ENOMEM;
c06240c7f5c39c8 arch/sparc/mm/init_64.c David S. Miller   2014-09-24  2606  
c06240c7f5c39c8 arch/sparc/mm/init_64.c David S. Miller   2014-09-24  2607  			pmd_val(*pmd) = pte_base | __pa(block);
46644c2477c5890 arch/sparc64/mm/init.c  David Miller      2007-10-16  2608  		}
46644c2477c5890 arch/sparc64/mm/init.c  David Miller      2007-10-16  2609  	}
2856cc2e4d0852c arch/sparc/mm/init_64.c David S. Miller   2012-08-15  2610  
c06240c7f5c39c8 arch/sparc/mm/init_64.c David S. Miller   2014-09-24  2611  	return 0;
2856cc2e4d0852c arch/sparc/mm/init_64.c David S. Miller   2012-08-15  2612  }
46644c2477c5890 arch/sparc64/mm/init.c  David Miller      2007-10-16  2613  #endif /* CONFIG_SPARSEMEM_VMEMMAP */
46644c2477c5890 arch/sparc64/mm/init.c  David Miller      2007-10-16  2614  

:::::: The code at line 2582 was first introduced by commit
:::::: df8ee578894ebb591c2995cce422e6189c8bb757 sparc64: simplify vmemmap_populate

:::::: TO: Pavel Tatashin <pasha.tatashin@oracle.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
