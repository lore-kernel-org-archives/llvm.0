Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF066309EFF;
	Fri,  8 May 2026 21:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778276465; cv=none; b=ChcRaI7O2QiCgy5LXlj8+rh5/vRH9rAPHlrZ37+vAUai4PKl/3ixQGbdDcvm/NZcazSOUTDZeyb2dkHvGEjTql2J5OYV0uhjsX12X2h90D8MBPQ+SxVJSUVTrJLcd+1c5gM0phHFgsraU4yKHdfa5Rp6cOdsFUrtqppRsraW7Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778276465; c=relaxed/simple;
	bh=dvuX5Vcgjm4UqxH/MI2RgUNN2CdX33bG5WXRaJpKYZA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iw4d69CFp/oH2UgMi6Ar+C+i/4l0idR/vpKNQNmYyXqiu2VGpiGWRJz7Xz/lVtS8A7PvEW+IbloYFn1TT9xz+nntZsAM0NQr+6pznHT2pR5l5YV+BMZl2ZLHVMI1uT6M/Frtsucv1Yb0LaPO4YEaz5fr1u5O3IHVfyA35jDT69o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h8QZRJ/y; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h8QZRJ/y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778276463; x=1809812463;
  h=date:from:to:cc:subject:message-id;
  bh=dvuX5Vcgjm4UqxH/MI2RgUNN2CdX33bG5WXRaJpKYZA=;
  b=h8QZRJ/y3tdYK627/H7XcnWunfAPfEEytTK8Olm28R9cubtGIcwSRxmL
   h7608PE9VCn6qVAglVIBCVUXtC+M7tgmejR6bjqgiKqDmRzyVX6nHZsem
   0KeBs8r2gnaZmftiLrcih2qeyS44UTAqUM1Xmdb9BZFg41bKJ085nQA2U
   mT7mvFUWBZ9O98bHFQH9N+OeTU6CunfsfouM20Jtfaf3/9BwgNlxoSzxn
   uoaTJDLaKUyOkulTZlEvL4bS0+nrB852mbufNJu3mN6W2OHEfuush8L5F
   It1s+wBP8u6OMMZv9j7T2ZROXbHCJ+MMX8CujQSetlcPoA81tq/KWg+2s
   g==;
X-CSE-ConnectionGUID: Fx+yrBP4RcivbLExkHf3DA==
X-CSE-MsgGUID: MtP/67osSeKC0cCt3GIWiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="79152690"
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; 
   d="scan'208";a="79152690"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 14:41:03 -0700
X-CSE-ConnectionGUID: oUDt50/QTS2uLiuzEtYENQ==
X-CSE-MsgGUID: 65qLmGhESkyVEXOISI9tHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; 
   d="scan'208";a="240856347"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 08 May 2026 14:41:01 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLSwM-000000007HF-2v5t;
	Fri, 08 May 2026 21:40:58 +0000
Date: Fri, 08 May 2026 23:40:06 +0200
From: kernel test robot <lkp@intel.com>
To: Oscar Salvador <osalvador@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: fs/proc/task_mmu.c:2065:6: error: call to undeclared
 function 'huge_pte_none'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202605082357.ji6iXTek-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Oscar-Salvador/mm-Add-softleaf_from_pud/20260427-233610
head:   a50a24d8da5140888004ac6386c0a0f6b4d0dd9a
commit: a50a24d8da5140888004ac6386c0a0f6b4d0dd9a mm: Make /proc/pid/pagemap use the new generic pagewalk API
date:   11 days ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260508/202605082357.ji6iXTek-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260508/202605082357.ji6iXTek-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605082357.ji6iXTek-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/proc/task_mmu.c:1139:17: warning: unused variable 'curr_addr' [-Wunused-variable]
    1139 |                 unsigned long curr_addr = ptw.curr_addr;
         |                               ^~~~~~~~~
>> fs/proc/task_mmu.c:2065:6: error: call to undeclared function 'huge_pte_none'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2065 |         if (huge_pte_none(ptent)) {
         |             ^
   fs/proc/task_mmu.c:2065:6: note: did you mean 'huge_pte_lock'?
   include/linux/hugetlb.h:1308:27: note: 'huge_pte_lock' declared here
    1308 | static inline spinlock_t *huge_pte_lock(struct hstate *h,
         |                           ^
>> fs/proc/task_mmu.c:2079:3: error: call to undeclared function 'huge_ptep_modify_prot_commit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2079 |                 huge_ptep_modify_prot_commit(vma, addr, ptep, ptent,
         |                 ^
   fs/proc/task_mmu.c:2079:3: note: did you mean '__ptep_modify_prot_commit'?
   include/linux/pgtable.h:1542:20: note: '__ptep_modify_prot_commit' declared here
    1542 | static inline void __ptep_modify_prot_commit(struct vm_area_struct *vma,
         |                    ^
>> fs/proc/task_mmu.c:2080:11: error: call to undeclared function 'huge_pte_mkuffd_wp'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2080 |                                              huge_pte_mkuffd_wp(ptent));
         |                                              ^
   fs/proc/task_mmu.c:2080:11: note: did you mean 'pte_mkuffd_wp'?
   arch/x86/include/asm/pgtable.h:427:21: note: 'pte_mkuffd_wp' declared here
     427 | static inline pte_t pte_mkuffd_wp(pte_t pte)
         |                     ^
>> fs/proc/task_mmu.c:2432:8: error: call to undeclared function 'huge_pte_uffd_wp'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2432 |                 if (!huge_pte_uffd_wp(pte))
         |                      ^
   fs/proc/task_mmu.c:2624:5: error: call to undeclared function 'make_uffd_wp_pud'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2624 |                                 make_uffd_wp_pud(ptw.vma, curr_addr, ptw.pudp);
         |                                 ^
   fs/proc/task_mmu.c:2624:5: note: did you mean 'make_uffd_wp_pmd'?
   fs/proc/task_mmu.c:1892:13: note: 'make_uffd_wp_pmd' declared here
    1892 | static void make_uffd_wp_pmd(struct vm_area_struct *vma,
         |             ^
   1 warning and 5 errors generated.


vim +/huge_pte_none +2065 fs/proc/task_mmu.c

52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2057  
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2058  static void make_uffd_wp_huge_pte(struct vm_area_struct *vma,
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2059  				  unsigned long addr, pte_t *ptep,
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2060  				  pte_t ptent)
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2061  {
03bfbc3ad6e496 Lorenzo Stoakes      2025-11-10  2062  	const unsigned long psize = huge_page_size(hstate_vma(vma));
03bfbc3ad6e496 Lorenzo Stoakes      2025-11-10  2063  	softleaf_t entry;
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2064  
12f0cd393369d7 Lorenzo Stoakes      2025-11-27 @2065  	if (huge_pte_none(ptent)) {
03bfbc3ad6e496 Lorenzo Stoakes      2025-11-10  2066  		set_huge_pte_at(vma->vm_mm, addr, ptep,
03bfbc3ad6e496 Lorenzo Stoakes      2025-11-10  2067  				make_pte_marker(PTE_MARKER_UFFD_WP), psize);
12f0cd393369d7 Lorenzo Stoakes      2025-11-27  2068  		return;
12f0cd393369d7 Lorenzo Stoakes      2025-11-27  2069  	}
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2070  
03bfbc3ad6e496 Lorenzo Stoakes      2025-11-10  2071  	entry = softleaf_from_pte(ptent);
03bfbc3ad6e496 Lorenzo Stoakes      2025-11-10  2072  	if (softleaf_is_hwpoison(entry) || softleaf_is_marker(entry))
03bfbc3ad6e496 Lorenzo Stoakes      2025-11-10  2073  		return;
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2074  
03bfbc3ad6e496 Lorenzo Stoakes      2025-11-10  2075  	if (softleaf_is_migration(entry))
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2076  		set_huge_pte_at(vma->vm_mm, addr, ptep,
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2077  				pte_swp_mkuffd_wp(ptent), psize);
03bfbc3ad6e496 Lorenzo Stoakes      2025-11-10  2078  	else
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21 @2079  		huge_ptep_modify_prot_commit(vma, addr, ptep, ptent,
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21 @2080  					     huge_pte_mkuffd_wp(ptent));
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2081  }
52526ca7fdb905 Muhammad Usama Anjum 2023-08-21  2082  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
