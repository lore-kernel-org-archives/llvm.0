Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C8C4A1D;
	Sat, 25 Jan 2025 07:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737791433; cv=none; b=l5M2+VXAT/0/A2c/Sk87ySDLMmvRbnRCm8UAId1kDnETpN69M8zUSTu6zxixbp5KiiwYQRH/ZHTk9ypepjnKUHIdkiWnN0YvP/lEHf/pKg3OAmd/PxVCl9pXoTHe8jDR1lQgWzAcFdfmFONWtaiFt58ix/w3ftH41n6ndcMMaR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737791433; c=relaxed/simple;
	bh=BtySbS/8ACsHUX8CUsFFZO/zLD2dLUmD37Nz+ggjtCI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eKQhFlTiafLFET9pev9GF1LLmxRjrh4onXULIa5EzjYmx9Y8bzDmuvD/N+kpFqVviHNL40C156xehARC10v/2mCma6lQsjCF4Q69JCk//7kwTs79TmtK6HNL/qBK4QajDx7gxhbOvCI+j8MmyqvHXXa+sDsPVdKXDcq8GX1hiKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jPRH6E9n; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jPRH6E9n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737791432; x=1769327432;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BtySbS/8ACsHUX8CUsFFZO/zLD2dLUmD37Nz+ggjtCI=;
  b=jPRH6E9nsIL6DEzZvBygrEucpjTxGvtm38GH6VRHXNVFCzN+XtkxD+Wk
   nRwtrwMpw/D6930/jLzwHIHFM6uEwJg/QSkeHLW4+bvhxPLufO3fNB7cY
   XGPT7D9paGQagG9IRd5W8QfXfuGwvHWte9HC4FOIGJFZCUqu1K+blflnH
   5Xo/fSy09Y3KC5o1/T4vm2Jc0nTzGTsFs/0/h3tUbLN/0bqNplvyv6j2P
   5WvkWdpUThqb749Zq90J7MU+BpsyR2uICJ/lxBOix1FwH3mcsbncbym+w
   gJhlUNlwtew/U2OT9/3A8Q+yT8+jjDkv/7wpAEvlcbqtMmUmmkP+Jtltl
   g==;
X-CSE-ConnectionGUID: bt6eMS+4QO6myVjIS3VU4w==
X-CSE-MsgGUID: uGoxcoXDQpmZcR3SWzW1LA==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="60795446"
X-IronPort-AV: E=Sophos;i="6.13,233,1732608000"; 
   d="scan'208";a="60795446"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 23:50:31 -0800
X-CSE-ConnectionGUID: Q1JX8qZARF6jE6bxnazFfw==
X-CSE-MsgGUID: KYfKwv4iTGObmfgCwmSShw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,233,1732608000"; 
   d="scan'208";a="107954684"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 24 Jan 2025 23:50:29 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbavz-000dcR-1a;
	Sat, 25 Jan 2025 07:50:27 +0000
Date: Sat, 25 Jan 2025 15:49:32 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:device_private 11/12] mm/memory.c:730:2: error:
 use of undeclared identifier 'entry'
Message-ID: <202501251554.1DXJI1g3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux device_private
head:   1693aa537b530ade1b82a54169a772386b4b7af7
commit: 838bd156d6fb55c5fd169934f349829386bc28d7 [11/12] mm/memory: detect writability in restore_exclusive_pte() through can_change_pte_writable()
config: arm-randconfig-004-20250125 (https://download.01.org/0day-ci/archive/20250125/202501251554.1DXJI1g3-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 19306351a2c45e266fa11b41eb1362b20b6ca56d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250125/202501251554.1DXJI1g3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501251554.1DXJI1g3-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/memory.c:44:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
>> mm/memory.c:730:2: error: use of undeclared identifier 'entry'
     730 |         entry = pte_to_swp_entry(orig_pte);
         |         ^
>> mm/memory.c:737:25: error: too few arguments to function call, expected 2, have 1
     737 |                         pte = pte_mkwrite(pte);
         |                               ~~~~~~~~~~~    ^
   include/linux/pgtable.h:839:21: note: 'pte_mkwrite' declared here
     839 | static inline pte_t pte_mkwrite(pte_t pte, struct vm_area_struct *vma)
         |                     ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings and 2 errors generated.


vim +/entry +730 mm/memory.c

28093f9f34cede Gerald Schaefer   2016-04-28  717  
b756a3b5e7ead8 Alistair Popple   2021-06-30  718  static void restore_exclusive_pte(struct vm_area_struct *vma,
f7fd4c350285c7 David Hildenbrand 2025-01-22  719  		struct folio *folio, struct page *page, unsigned long address,
f7fd4c350285c7 David Hildenbrand 2025-01-22  720  		pte_t *ptep, pte_t orig_pte)
b756a3b5e7ead8 Alistair Popple   2021-06-30  721  {
b756a3b5e7ead8 Alistair Popple   2021-06-30  722  	pte_t pte;
b756a3b5e7ead8 Alistair Popple   2021-06-30  723  
f7fd4c350285c7 David Hildenbrand 2025-01-22  724  	VM_WARN_ON_FOLIO(!folio_test_locked(folio), folio);
f7fd4c350285c7 David Hildenbrand 2025-01-22  725  
b756a3b5e7ead8 Alistair Popple   2021-06-30  726  	pte = pte_mkold(mk_pte(page, READ_ONCE(vma->vm_page_prot)));
c33c794828f212 Ryan Roberts      2023-06-12  727  	if (pte_swp_soft_dirty(orig_pte))
b756a3b5e7ead8 Alistair Popple   2021-06-30  728  		pte = pte_mksoft_dirty(pte);
b756a3b5e7ead8 Alistair Popple   2021-06-30  729  
c33c794828f212 Ryan Roberts      2023-06-12 @730  	entry = pte_to_swp_entry(orig_pte);
c33c794828f212 Ryan Roberts      2023-06-12  731  	if (pte_swp_uffd_wp(orig_pte))
b756a3b5e7ead8 Alistair Popple   2021-06-30  732  		pte = pte_mkuffd_wp(pte);
838bd156d6fb55 David Hildenbrand 2025-01-24  733  
838bd156d6fb55 David Hildenbrand 2025-01-24  734  	if ((vma->vm_flags & VM_WRITE) &&
838bd156d6fb55 David Hildenbrand 2025-01-24  735  	    can_change_pte_writable(vma, address, pte)) {
838bd156d6fb55 David Hildenbrand 2025-01-24  736  		if (folio_test_dirty(folio))
838bd156d6fb55 David Hildenbrand 2025-01-24 @737  			pte = pte_mkwrite(pte);
838bd156d6fb55 David Hildenbrand 2025-01-24  738  		pte = pte_mkwrite(pte, vma);
838bd156d6fb55 David Hildenbrand 2025-01-24  739  	}
b756a3b5e7ead8 Alistair Popple   2021-06-30  740  
b832a354d787bf David Hildenbrand 2023-12-20  741  	VM_BUG_ON_FOLIO(pte_write(pte) && (!folio_test_anon(folio) &&
b832a354d787bf David Hildenbrand 2023-12-20  742  					   PageAnonExclusive(page)), folio);
1eba86c096e35e Pasha Tatashin    2022-01-14  743  	set_pte_at(vma->vm_mm, address, ptep, pte);
1eba86c096e35e Pasha Tatashin    2022-01-14  744  
b756a3b5e7ead8 Alistair Popple   2021-06-30  745  	/*
b756a3b5e7ead8 Alistair Popple   2021-06-30  746  	 * No need to invalidate - it was non-present before. However
b756a3b5e7ead8 Alistair Popple   2021-06-30  747  	 * secondary CPUs may have mappings that need invalidating.
b756a3b5e7ead8 Alistair Popple   2021-06-30  748  	 */
b756a3b5e7ead8 Alistair Popple   2021-06-30  749  	update_mmu_cache(vma, address, ptep);
b756a3b5e7ead8 Alistair Popple   2021-06-30  750  }
b756a3b5e7ead8 Alistair Popple   2021-06-30  751  

:::::: The code at line 730 was first introduced by commit
:::::: c33c794828f21217f72ce6fc140e0d34e0d56bff mm: ptep_get() conversion

:::::: TO: Ryan Roberts <ryan.roberts@arm.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
