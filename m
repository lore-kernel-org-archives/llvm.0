Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2998A21578A;
	Thu,  9 Jan 2025 10:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736417818; cv=none; b=rRrZZUxIJIy726lJT0q/7wctaUjBSsTzZSrgCEPTo8iUo8uvnMZ7bEv8CvZBBwIQI5hxL4xpy5RAD+kf4TugAEcLxp3ouI4joyBdQ+Si4axgIi1D9bx9nOqLbr1BUO5tVFjWXtpv0t0jgqNYLbyUhQoefl5yxrIDZbVYUWqFjkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736417818; c=relaxed/simple;
	bh=sCPyUObJsKqn30iTA3fiV094fe1yE6BSISkqhHSB0UM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MYhbAjeZAJFLvTcKuMS0o6oQlO9/OXBII3wIOlCra4OvAPJnB807MyxUDZ4Hlp+T2lJ/ILAMKcZq3/r198yumgg7x4KugeR1a3fO2w6kCV1OcVm+/Ydnl7f0JLe8wMUV7SPr37LskcEhPY6/ppqdql5q6AwrXKq/o9vlEH6kPjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TKKadJEP; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TKKadJEP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736417816; x=1767953816;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sCPyUObJsKqn30iTA3fiV094fe1yE6BSISkqhHSB0UM=;
  b=TKKadJEPuprvvop5FLk6ui0uMrQ+ivbjPZ3T7tnlcS0YlCKaS6Y6qNqK
   pLDR+ctSegUWQ8TVRmIXL1J0bwVMcn+9X7GN0xn7R0iE9K9lF7gp4hfHa
   ktuaX7n3l50FIE5YVf5rBcn96CsSynfwb9hed0rcyEwYZiUcdNvLTEOzq
   BL0pu9IlImpusGv1zZKxpeMihWq7eaz4M7qJzSoV+XtFa25koKgcQd1Kp
   B5S9C/HZuBgEr/wE1QFzQKN1+4KSlHU8piult2rhd+5skHWjMhLe4RmQ0
   aaLGYhCHWUrXJwgxiAEk+p8nESxG4dfSi09OlztFWfdbIXgVP5s6TblUX
   w==;
X-CSE-ConnectionGUID: t2i4/ThHRByoOtd7JdBULA==
X-CSE-MsgGUID: VVYdtqz9QWy1af9+XThcIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="35895556"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="35895556"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 02:16:55 -0800
X-CSE-ConnectionGUID: b6y6Yn+2RZmbGj6DWFyJ5w==
X-CSE-MsgGUID: pPuMJ/FMQ7iDepUhdO9Ldg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="108350026"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Jan 2025 02:16:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVpas-000HMX-1l;
	Thu, 09 Jan 2025 10:16:50 +0000
Date: Thu, 9 Jan 2025 18:16:10 +0800
From: kernel test robot <lkp@intel.com>
To: Alistair Popple <apopple@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 6964/7509]
 arch/powerpc/mm/book3s64/hugetlbpage.c:77:35: error: use of undeclared
 identifier '_PAGE_DEVMAP'
Message-ID: <202501091855.AAxlhUYD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6ecd20965bdc21b265a0671ccf36d9ad8043f5ab
commit: c0c3319917dbc5837ff0ade264d56b8e2934c099 [6964/7509] mm: remove devmap related functions and page table bits
config: powerpc64-randconfig-002-20250109 (https://download.01.org/0day-ci/archive/20250109/202501091855.AAxlhUYD-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 096551537b2a747a3387726ca618ceeb3950e9bc)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250109/202501091855.AAxlhUYD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501091855.AAxlhUYD-lkp@intel.com/

Note: the linux-next/master HEAD 6ecd20965bdc21b265a0671ccf36d9ad8043f5ab builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> arch/powerpc/mm/book3s64/hugetlbpage.c:77:35: error: use of undeclared identifier '_PAGE_DEVMAP'
      77 |         if (old_pte & (H_PAGE_THP_HUGE | _PAGE_DEVMAP))
         |                                          ^
   1 error generated.


vim +/_PAGE_DEVMAP +77 arch/powerpc/mm/book3s64/hugetlbpage.c

c5710cd20735037 arch/powerpc/mm/book3s64/hash_hugetlbpage.c Christophe Leroy       2019-04-26   18  
387e220a2e5e630 arch/powerpc/mm/book3s64/hugetlbpage.c      Nicholas Piggin        2021-12-02   19  #ifdef CONFIG_PPC_64S_HASH_MMU
883a3e523672ebb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26   20  int __hash_page_huge(unsigned long ea, unsigned long access, unsigned long vsid,
aefa5688c070727 arch/powerpc/mm/hugetlbpage-hash64.c        Aneesh Kumar K.V       2014-12-04   21  		     pte_t *ptep, unsigned long trap, unsigned long flags,
aefa5688c070727 arch/powerpc/mm/hugetlbpage-hash64.c        Aneesh Kumar K.V       2014-12-04   22  		     int ssize, unsigned int shift, unsigned int mmu_psize)
883a3e523672ebb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26   23  {
bf9a95f9a6481bc arch/powerpc/mm/hugetlbpage-hash64.c        Ram Pai                2017-11-06   24  	real_pte_t rpte;
5524a27d39b6877 arch/powerpc/mm/hugetlbpage-hash64.c        Aneesh Kumar K.V       2012-09-10   25  	unsigned long vpn;
883a3e523672ebb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26   26  	unsigned long old_pte, new_pte;
8132cf115efc3b3 arch/powerpc/mm/hugetlbpage-hash64.c        Qian Cai               2019-02-27   27  	unsigned long rflags, pa;
ff31e105464d8c8 arch/powerpc/mm/hugetlbpage-hash64.c        Aneesh Kumar K.V       2018-02-11   28  	long slot, offset;
883a3e523672ebb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26   29  
883a3e523672ebb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26   30  	BUG_ON(shift != mmu_psize_defs[mmu_psize].shift);
883a3e523672ebb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26   31  
883a3e523672ebb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26   32  	/* Search the Linux page table for a match with va */
5524a27d39b6877 arch/powerpc/mm/hugetlbpage-hash64.c        Aneesh Kumar K.V       2012-09-10   33  	vpn = hpt_vpn(ea, vsid, ssize);
883a3e523672ebb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26   34  
47d99948eee48a8 arch/powerpc/mm/book3s64/hash_hugetlbpage.c Christophe Leroy       2019-03-29   35  	/*
47d99948eee48a8 arch/powerpc/mm/book3s64/hash_hugetlbpage.c Christophe Leroy       2019-03-29   36  	 * At this point, we have a pte (old_pte) which can be used to build
883a3e523672ebb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26   37  	 * or update an HPTE. There are 2 cases:
883a3e523672ebb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26   38  	 *
883a3e523672ebb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26   39  	 * 1. There is a valid (present) pte with no associated HPTE (this is
883a3e523672ebb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26   40  	 *	the most common case)
883a3e523672ebb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26   41  	 * 2. There is a valid (present) pte with an associated HPTE. The
883a3e523672ebb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26   42  	 *	current values of the pp bits in the HPTE prevent access
883a3e523672ebb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26   43  	 *	because we are doing software DIRTY bit management and the
883a3e523672ebb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26   44  	 *	page is currently not DIRTY.
883a3e523672ebb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26   45  	 */
883a3e523672ebb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26   46  
883a3e523672ebb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26   47  
883a3e523672ebb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26   48  	do {
883a3e523672ebb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26   49  		old_pte = pte_val(*ptep);
171aa2caaad16ed arch/powerpc/mm/hugetlbpage-hash64.c        Benjamin Herrenschmidt 2010-07-23   50  		/* If PTE busy, retry the access */
945537df7a107e0 arch/powerpc/mm/hugetlbpage-hash64.c        Aneesh Kumar K.V       2016-04-29   51  		if (unlikely(old_pte & H_PAGE_BUSY))
171aa2caaad16ed arch/powerpc/mm/hugetlbpage-hash64.c        Benjamin Herrenschmidt 2010-07-23   52  			return 0;
171aa2caaad16ed arch/powerpc/mm/hugetlbpage-hash64.c        Benjamin Herrenschmidt 2010-07-23   53  		/* If PTE permissions don't match, take page fault */
ac29c64089b74d1 arch/powerpc/mm/hugetlbpage-hash64.c        Aneesh Kumar K.V       2016-04-29   54  		if (unlikely(!check_pte_access(access, old_pte)))
171aa2caaad16ed arch/powerpc/mm/hugetlbpage-hash64.c        Benjamin Herrenschmidt 2010-07-23   55  			return 1;
57fb15c32f4f6a4 arch/powerpc/mm/book3s64/hugetlbpage.c      Christophe Leroy       2024-07-02   56  		/*
57fb15c32f4f6a4 arch/powerpc/mm/book3s64/hugetlbpage.c      Christophe Leroy       2024-07-02   57  		 * If hash-4k, hugepages use seeral contiguous PxD entries
57fb15c32f4f6a4 arch/powerpc/mm/book3s64/hugetlbpage.c      Christophe Leroy       2024-07-02   58  		 * so bail out and let mm make the page young or dirty
57fb15c32f4f6a4 arch/powerpc/mm/book3s64/hugetlbpage.c      Christophe Leroy       2024-07-02   59  		 */
57fb15c32f4f6a4 arch/powerpc/mm/book3s64/hugetlbpage.c      Christophe Leroy       2024-07-02   60  		if (IS_ENABLED(CONFIG_PPC_4K_PAGES)) {
57fb15c32f4f6a4 arch/powerpc/mm/book3s64/hugetlbpage.c      Christophe Leroy       2024-07-02   61  			if (!(old_pte & _PAGE_ACCESSED))
57fb15c32f4f6a4 arch/powerpc/mm/book3s64/hugetlbpage.c      Christophe Leroy       2024-07-02   62  				return 1;
57fb15c32f4f6a4 arch/powerpc/mm/book3s64/hugetlbpage.c      Christophe Leroy       2024-07-02   63  			if ((access & _PAGE_WRITE) && !(old_pte & _PAGE_DIRTY))
57fb15c32f4f6a4 arch/powerpc/mm/book3s64/hugetlbpage.c      Christophe Leroy       2024-07-02   64  				return 1;
57fb15c32f4f6a4 arch/powerpc/mm/book3s64/hugetlbpage.c      Christophe Leroy       2024-07-02   65  		}
ac29c64089b74d1 arch/powerpc/mm/hugetlbpage-hash64.c        Aneesh Kumar K.V       2016-04-29   66  
47d99948eee48a8 arch/powerpc/mm/book3s64/hash_hugetlbpage.c Christophe Leroy       2019-03-29   67  		/*
47d99948eee48a8 arch/powerpc/mm/book3s64/hash_hugetlbpage.c Christophe Leroy       2019-03-29   68  		 * Try to lock the PTE, add ACCESSED and DIRTY if it was
47d99948eee48a8 arch/powerpc/mm/book3s64/hash_hugetlbpage.c Christophe Leroy       2019-03-29   69  		 * a write access
47d99948eee48a8 arch/powerpc/mm/book3s64/hash_hugetlbpage.c Christophe Leroy       2019-03-29   70  		 */
945537df7a107e0 arch/powerpc/mm/hugetlbpage-hash64.c        Aneesh Kumar K.V       2016-04-29   71  		new_pte = old_pte | H_PAGE_BUSY | _PAGE_ACCESSED;
c7d54842deb1fa3 arch/powerpc/mm/hugetlbpage-hash64.c        Aneesh Kumar K.V       2016-04-29   72  		if (access & _PAGE_WRITE)
171aa2caaad16ed arch/powerpc/mm/hugetlbpage-hash64.c        Benjamin Herrenschmidt 2010-07-23   73  			new_pte |= _PAGE_DIRTY;
3910a7f485e1222 arch/powerpc/mm/hugetlbpage-hash64.c        Michael Ellerman       2016-04-29   74  	} while(!pte_xchg(ptep, __pte(old_pte), __pte(new_pte)));
3910a7f485e1222 arch/powerpc/mm/hugetlbpage-hash64.c        Michael Ellerman       2016-04-29   75  
75646c480fdeffb arch/powerpc/mm/hugetlbpage-hash64.c        Aneesh Kumar K.V       2018-09-20   76  	/* Make sure this is a hugetlb entry */
75646c480fdeffb arch/powerpc/mm/hugetlbpage-hash64.c        Aneesh Kumar K.V       2018-09-20  @77  	if (old_pte & (H_PAGE_THP_HUGE | _PAGE_DEVMAP))
75646c480fdeffb arch/powerpc/mm/hugetlbpage-hash64.c        Aneesh Kumar K.V       2018-09-20   78  		return 0;
75646c480fdeffb arch/powerpc/mm/hugetlbpage-hash64.c        Aneesh Kumar K.V       2018-09-20   79  
d94b827e89dc3f9 arch/powerpc/mm/book3s64/hash_hugetlbpage.c Aneesh Kumar K.V       2020-11-27   80  	rflags = htab_convert_pte_flags(new_pte, flags);
ff31e105464d8c8 arch/powerpc/mm/hugetlbpage-hash64.c        Aneesh Kumar K.V       2018-02-11   81  	if (unlikely(mmu_psize == MMU_PAGE_16G))
ff31e105464d8c8 arch/powerpc/mm/hugetlbpage-hash64.c        Aneesh Kumar K.V       2018-02-11   82  		offset = PTRS_PER_PUD;
ff31e105464d8c8 arch/powerpc/mm/hugetlbpage-hash64.c        Aneesh Kumar K.V       2018-02-11   83  	else
ff31e105464d8c8 arch/powerpc/mm/hugetlbpage-hash64.c        Aneesh Kumar K.V       2018-02-11   84  		offset = PTRS_PER_PMD;
ff31e105464d8c8 arch/powerpc/mm/hugetlbpage-hash64.c        Aneesh Kumar K.V       2018-02-11   85  	rpte = __real_pte(__pte(old_pte), ptep, offset);
883a3e523672ebb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26   86  
883a3e523672ebb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26   87  	if (!cpu_has_feature(CPU_FTR_COHERENT_ICACHE))
47d99948eee48a8 arch/powerpc/mm/book3s64/hash_hugetlbpage.c Christophe Leroy       2019-03-29   88  		/*
47d99948eee48a8 arch/powerpc/mm/book3s64/hash_hugetlbpage.c Christophe Leroy       2019-03-29   89  		 * No CPU has hugepages but lacks no execute, so we
47d99948eee48a8 arch/powerpc/mm/book3s64/hash_hugetlbpage.c Christophe Leroy       2019-03-29   90  		 * don't need to worry about that case
47d99948eee48a8 arch/powerpc/mm/book3s64/hash_hugetlbpage.c Christophe Leroy       2019-03-29   91  		 */
0895ecda79428df arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26   92  		rflags = hash_page_do_lazy_icache(rflags, __pte(old_pte), trap);
883a3e523672ebb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26   93  
883a3e523672ebb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26   94  	/* Check if pte already has an hpte (case 2) */
945537df7a107e0 arch/powerpc/mm/hugetlbpage-hash64.c        Aneesh Kumar K.V       2016-04-29   95  	if (unlikely(old_pte & H_PAGE_HASHPTE)) {
883a3e523672ebb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26   96  		/* There MIGHT be an HPTE for this pte */
bf9a95f9a6481bc arch/powerpc/mm/hugetlbpage-hash64.c        Ram Pai                2017-11-06   97  		unsigned long gslot;
883a3e523672ebb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26   98  
bf9a95f9a6481bc arch/powerpc/mm/hugetlbpage-hash64.c        Ram Pai                2017-11-06   99  		gslot = pte_get_hash_gslot(vpn, shift, ssize, rpte, 0);
bf9a95f9a6481bc arch/powerpc/mm/hugetlbpage-hash64.c        Ram Pai                2017-11-06  100  		if (mmu_hash_ops.hpte_updatepp(gslot, rflags, vpn, mmu_psize,
aefa5688c070727 arch/powerpc/mm/hugetlbpage-hash64.c        Aneesh Kumar K.V       2014-12-04  101  					       mmu_psize, ssize, flags) == -1)
883a3e523672ebb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26  102  			old_pte &= ~_PAGE_HPTEFLAGS;
883a3e523672ebb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26  103  	}
883a3e523672ebb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26  104  
945537df7a107e0 arch/powerpc/mm/hugetlbpage-hash64.c        Aneesh Kumar K.V       2016-04-29  105  	if (likely(!(old_pte & H_PAGE_HASHPTE))) {
5524a27d39b6877 arch/powerpc/mm/hugetlbpage-hash64.c        Aneesh Kumar K.V       2012-09-10  106  		unsigned long hash = hpt_hash(vpn, shift, ssize);
883a3e523672ebb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26  107  
883a3e523672ebb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26  108  		pa = pte_pfn(__pte(old_pte)) << PAGE_SHIFT;
883a3e523672ebb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26  109  
883a3e523672ebb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26  110  		/* clear HPTE slot informations in new PTE */
945537df7a107e0 arch/powerpc/mm/hugetlbpage-hash64.c        Aneesh Kumar K.V       2016-04-29  111  		new_pte = (new_pte & ~_PAGE_HPTEFLAGS) | H_PAGE_HASHPTE;
bf680d51605662a arch/powerpc/mm/hugetlbpage-hash64.c        Aneesh Kumar K.V       2015-12-01  112  
b170bd3de6a7f6f arch/powerpc/mm/hugetlbpage-hash64.c        Li Zhong               2013-04-15  113  		slot = hpte_insert_repeating(hash, vpn, pa, rflags, 0,
883a3e523672ebb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26  114  					     mmu_psize, ssize);
883a3e523672ebb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26  115  
b1623e7eb280f85 arch/powerpc/mm/hugetlbpage-hash64.c        Anton Blanchard        2010-07-14  116  		/*
b1623e7eb280f85 arch/powerpc/mm/hugetlbpage-hash64.c        Anton Blanchard        2010-07-14  117  		 * Hypervisor failure. Restore old pte and return -1
b1623e7eb280f85 arch/powerpc/mm/hugetlbpage-hash64.c        Anton Blanchard        2010-07-14  118  		 * similar to __hash_page_*
b1623e7eb280f85 arch/powerpc/mm/hugetlbpage-hash64.c        Anton Blanchard        2010-07-14  119  		 */
b1623e7eb280f85 arch/powerpc/mm/hugetlbpage-hash64.c        Anton Blanchard        2010-07-14  120  		if (unlikely(slot == -2)) {
b1623e7eb280f85 arch/powerpc/mm/hugetlbpage-hash64.c        Anton Blanchard        2010-07-14  121  			*ptep = __pte(old_pte);
4b8692c022a4b14 arch/powerpc/mm/hugetlbpage-hash64.c        Benjamin Herrenschmidt 2010-07-23  122  			hash_failure_debug(ea, access, vsid, trap, ssize,
d8139ebf8596a1e arch/powerpc/mm/hugetlbpage-hash64.c        Aneesh Kumar K.V       2013-04-28  123  					   mmu_psize, mmu_psize, old_pte);
171aa2caaad16ed arch/powerpc/mm/hugetlbpage-hash64.c        Benjamin Herrenschmidt 2010-07-23  124  			return -1;
b1623e7eb280f85 arch/powerpc/mm/hugetlbpage-hash64.c        Anton Blanchard        2010-07-14  125  		}
883a3e523672ebb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26  126  
ff31e105464d8c8 arch/powerpc/mm/hugetlbpage-hash64.c        Aneesh Kumar K.V       2018-02-11  127  		new_pte |= pte_set_hidx(ptep, rpte, 0, slot, offset);
883a3e523672ebb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26  128  	}
883a3e523672ebb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26  129  
883a3e523672ebb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26  130  	/*
883a3e523672ebb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26  131  	 * No need to use ldarx/stdcx here
883a3e523672ebb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26  132  	 */
945537df7a107e0 arch/powerpc/mm/hugetlbpage-hash64.c        Aneesh Kumar K.V       2016-04-29  133  	*ptep = __pte(new_pte & ~H_PAGE_BUSY);
171aa2caaad16ed arch/powerpc/mm/hugetlbpage-hash64.c        Benjamin Herrenschmidt 2010-07-23  134  	return 0;
883a3e523672ebb arch/powerpc/mm/hugetlbpage-hash64.c        David Gibson           2009-10-26  135  }
387e220a2e5e630 arch/powerpc/mm/book3s64/hugetlbpage.c      Nicholas Piggin        2021-12-02  136  #endif
8ef5cbde6dafce8 arch/powerpc/mm/hugetlbpage-hash64.c        Aneesh Kumar K.V       2019-03-05  137  

:::::: The code at line 77 was first introduced by commit
:::::: 75646c480fdeffbc246e9d45f29721ab5569f921 arch/powerpc/mm/hash: validate the pte entries before handling the hash fault

:::::: TO: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
