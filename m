Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FBA27B4E1;
	Thu,  8 May 2025 16:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746720564; cv=none; b=IirWV1djno0iYNAO2j2MkCcqBEe0vyrHZCdeVgjSFjmP6E8aYERHytBK7qUwt1REGfZ61atuS6cEJNoAnAz0b6hUV84FQqSrvbiiDyRYV+Aw8V3ZTwbYVnjPjHItY81Um4AGbL1D9InO00PPAxK8QhUkpBINSMhO/3zpDpCR8+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746720564; c=relaxed/simple;
	bh=wsZwt12hpJDt5R/mpLrrXe8j8xx7pqhVlf+2RkYHtY8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y2VO1r+FzPKhqWWV4M6H9r5rXOK5szyUVVtTjYcQVbIDJBapXaIoiOZ8+hhRbV3lthuD2VfOcihlzKI+80b3hk33dfWL84Wfda0tTj/Yi1hmKyY5IqvmwUSvax53E+7r1YYutH/dTAXF+MaOj94p7Sa2yuQ/6RP9ZCL8GKPDPe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LGDpVS4h; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LGDpVS4h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746720562; x=1778256562;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wsZwt12hpJDt5R/mpLrrXe8j8xx7pqhVlf+2RkYHtY8=;
  b=LGDpVS4hi8N0e7oUA7MEWR5LMHUCk6aBjsc3CeQUa2s+JGCHLfIu3LSD
   3s3xB0YM67BLqxX1B8ZK1vRtayKSiKfnHxJzhIgub3nASguvKke3yUkmP
   gZocX6hjrN0pcvJrQaB0Th5dy+cZ6KxMj9ILnlX5f92GwYtnImh58gtK4
   vncEPJvK31rJ0ooZJDmbl/jb2NKrW5JXQ9Zy111yMf5q7cBrwPhqLqJvJ
   hSDue9aI1MMqomEk5OEU6Wj34jk9pm4iakrbLYDPsSB6lOL0ZCx+1SVwR
   Dagx/6CbEMfDtD8ow6LPGtVovfKjqLxkU6LBICL0ZFPkD0pgwlPS12sd3
   w==;
X-CSE-ConnectionGUID: vdLSussCQ72okeH5ggKSWw==
X-CSE-MsgGUID: fk2P5yncQra0fA+tIHcsyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="58727569"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="58727569"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 09:09:19 -0700
X-CSE-ConnectionGUID: r1zEBk6sRe6jQIoYwucOkw==
X-CSE-MsgGUID: +yJaskG5RWisFXZyqdq0bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="141551065"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 May 2025 09:09:17 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uD3oB-000B8m-0m;
	Thu, 08 May 2025 16:09:15 +0000
Date: Fri, 9 May 2025 00:08:26 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Subject: [davidhildenbrand:pat 5/12] mm/damon/vaddr.c:312:6: error: call to
 undeclared function 'pmd_trans_huge'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202505082358.fDWiBcNw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux pat
head:   bd8eaecd3fc499ee12971c7e4e1522e59c979a77
commit: 86244f66bbc1c4202c7344c1df180beffefc3f4f [5/12] x86/mm/pat: remove old pfnmap tracking interface
config: um-randconfig-002-20250508 (https://download.01.org/0day-ci/archive/20250508/202505082358.fDWiBcNw-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250508/202505082358.fDWiBcNw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505082358.fDWiBcNw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/damon/vaddr.c:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/um/include/asm/cacheflush.h:4:
   In file included from arch/um/include/asm/tlbflush.h:9:
   In file included from include/linux/mm.h:31:
   include/linux/pgtable.h:1493:1: error: expected parameter declarator
    1493 | {
         | ^
   include/linux/pgtable.h:1493:1: error: expected ')'
   include/linux/pgtable.h:1492:41: note: to match this '('
    1492 | static inline int pfnmap_setup_cachemode(unsigned long pfn, unsigned long size,
         |                                         ^
   In file included from mm/damon/vaddr.c:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/um/include/asm/cacheflush.h:4:
   In file included from arch/um/include/asm/tlbflush.h:9:
   include/linux/mm.h:1898:9: error: call to undeclared function 'is_zero_pfn'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1898 |         return is_zero_pfn(page_to_pfn(page));
         |                ^
   In file included from mm/damon/vaddr.c:12:
   include/linux/mman.h:157:9: warning: division by zero is undefined [-Wdivision-by-zero]
     157 |                _calc_vm_trans(flags, MAP_SYNC,       VM_SYNC      ) |
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:135:21: note: expanded from macro '_calc_vm_trans'
     135 |    : ((x) & (bit1)) / ((bit1) / (bit2))))
         |                     ^ ~~~~~~~~~~~~~~~~~
   include/linux/mman.h:158:9: warning: division by zero is undefined [-Wdivision-by-zero]
     158 |                _calc_vm_trans(flags, MAP_STACK,      VM_NOHUGEPAGE) |
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:135:21: note: expanded from macro '_calc_vm_trans'
     135 |    : ((x) & (bit1)) / ((bit1) / (bit2))))
         |                     ^ ~~~~~~~~~~~~~~~~~
>> mm/damon/vaddr.c:312:6: error: call to undeclared function 'pmd_trans_huge'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     312 |         if (pmd_trans_huge(pmdp_get(pmd))) {
         |             ^
   2 warnings and 4 errors generated.


vim +/pmd_trans_huge +312 mm/damon/vaddr.c

3f49584b262cf8 SeongJae Park 2021-09-07  304  
3f49584b262cf8 SeongJae Park 2021-09-07  305  static int damon_mkold_pmd_entry(pmd_t *pmd, unsigned long addr,
3f49584b262cf8 SeongJae Park 2021-09-07  306  		unsigned long next, struct mm_walk *walk)
3f49584b262cf8 SeongJae Park 2021-09-07  307  {
3f49584b262cf8 SeongJae Park 2021-09-07  308  	pte_t *pte;
e7ee3f9791f560 Levi Yun      2023-07-28  309  	pmd_t pmde;
3f49584b262cf8 SeongJae Park 2021-09-07  310  	spinlock_t *ptl;
3f49584b262cf8 SeongJae Park 2021-09-07  311  
e7ee3f9791f560 Levi Yun      2023-07-28 @312  	if (pmd_trans_huge(pmdp_get(pmd))) {
3f49584b262cf8 SeongJae Park 2021-09-07  313  		ptl = pmd_lock(walk->mm, pmd);
e7ee3f9791f560 Levi Yun      2023-07-28  314  		pmde = pmdp_get(pmd);
e7ee3f9791f560 Levi Yun      2023-07-28  315  
e7ee3f9791f560 Levi Yun      2023-07-28  316  		if (!pmd_present(pmde)) {
c8b9aff419303e Baolin Wang   2022-08-18  317  			spin_unlock(ptl);
c8b9aff419303e Baolin Wang   2022-08-18  318  			return 0;
c8b9aff419303e Baolin Wang   2022-08-18  319  		}
c8b9aff419303e Baolin Wang   2022-08-18  320  
e7ee3f9791f560 Levi Yun      2023-07-28  321  		if (pmd_trans_huge(pmde)) {
c11d34fa139e4b Ryan Roberts  2023-06-02  322  			damon_pmdp_mkold(pmd, walk->vma, addr);
3f49584b262cf8 SeongJae Park 2021-09-07  323  			spin_unlock(ptl);
3f49584b262cf8 SeongJae Park 2021-09-07  324  			return 0;
3f49584b262cf8 SeongJae Park 2021-09-07  325  		}
3f49584b262cf8 SeongJae Park 2021-09-07  326  		spin_unlock(ptl);
3f49584b262cf8 SeongJae Park 2021-09-07  327  	}
3f49584b262cf8 SeongJae Park 2021-09-07  328  
3f49584b262cf8 SeongJae Park 2021-09-07  329  	pte = pte_offset_map_lock(walk->mm, pmd, addr, &ptl);
7780d04046a228 Hugh Dickins  2023-06-08  330  	if (!pte) {
7780d04046a228 Hugh Dickins  2023-06-08  331  		walk->action = ACTION_AGAIN;
7780d04046a228 Hugh Dickins  2023-06-08  332  		return 0;
7780d04046a228 Hugh Dickins  2023-06-08  333  	}
c33c794828f212 Ryan Roberts  2023-06-12  334  	if (!pte_present(ptep_get(pte)))
3f49584b262cf8 SeongJae Park 2021-09-07  335  		goto out;
c11d34fa139e4b Ryan Roberts  2023-06-02  336  	damon_ptep_mkold(pte, walk->vma, addr);
3f49584b262cf8 SeongJae Park 2021-09-07  337  out:
3f49584b262cf8 SeongJae Park 2021-09-07  338  	pte_unmap_unlock(pte, ptl);
3f49584b262cf8 SeongJae Park 2021-09-07  339  	return 0;
3f49584b262cf8 SeongJae Park 2021-09-07  340  }
3f49584b262cf8 SeongJae Park 2021-09-07  341  

:::::: The code at line 312 was first introduced by commit
:::::: e7ee3f9791f5601fc032b222a70a02b9798784be damon: use pmdp_get instead of drectly dereferencing pmd

:::::: TO: Levi Yun <ppbuk5246@gmail.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
