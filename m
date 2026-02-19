Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF39A19D08F;
	Thu, 19 Feb 2026 00:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771461258; cv=none; b=pL8awkzxCvp1TzK1LwBQZbEa4jpcvTGERvJ2F38AEEsPLCuLAB4VGwgahLfJ5dTa7VLbU/LJK5IsiGLUTbEiSz0xBJJ/D9fd6Ph6zMopUJI/aGkL6X3lU1THb80q3lc/Gd3ZXZf89IqUGjIC2B1iumM1maYD6tm7slqmc+ldxeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771461258; c=relaxed/simple;
	bh=HJfGCaO5OfU/R40hC7JD/wbaD9+BAJFq7KzySAehU4k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GpyGnSzuCpMhcJ3yYU4LhEJAiimMRHVGGqtDd2dLFrcv+JcUQu2/TjXs5K+9HT+Fpv6ld9/7QBfZztEYNDKEjEli7cSS1OJW/8mPbBEM5yxXvlkb2zmVfla3lWnZroIjsoAaka1oZ1e2ZHEsb4ihj96U4WA1arbE5TAopIyo5pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VUeA58Ls; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VUeA58Ls"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771461257; x=1802997257;
  h=date:from:to:cc:subject:message-id;
  bh=HJfGCaO5OfU/R40hC7JD/wbaD9+BAJFq7KzySAehU4k=;
  b=VUeA58Ls7P+dRnrPXSRwRBnFrLq1J5XIDH3dZL0mrCwmiY4s0PFF2pAu
   I+25rjoKSQprAoLCPxZhNXsxRIEdGo5VWE1EnYWgJtnrhonTB/tXqZ/bp
   nD2W6GXXm9Juqgb6Tc3sXkXOZhh0Xp8l8Nha0+fDvWVPCbGb5f0DPPQQU
   qPJaRfmzb/nMm2BoCuoPUUKQl4lzB3d1cXLbteQFpMyjVLFabDuLA3SYi
   CTiXEpecOZ7WoflsO+SNA8KVuxzIaHNJP7+mk5kWK9G3zOVLPot1xmwpE
   FnMypvPYKfzmjG1XCLj4EOp0SWVyJgvj0bbPKo2kQge21HZcX0+Bhj1n7
   Q==;
X-CSE-ConnectionGUID: cqYtVBYSSDOuDW0213mq/g==
X-CSE-MsgGUID: 3klVGEwMRtuU6N8Y3KpNgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72435040"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="72435040"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 16:34:16 -0800
X-CSE-ConnectionGUID: 6+Xlbbl6QbaTrGFfYzhffw==
X-CSE-MsgGUID: lnqiGPyBQiil4B6mXLekIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="252056767"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Feb 2026 16:34:15 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsrzg-000000012pm-0FV7;
	Thu, 19 Feb 2026 00:34:12 +0000
Date: Thu, 19 Feb 2026 08:33:23 +0800
From: kernel test robot <lkp@intel.com>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [kas:pte_size 26/27] mm/memory.c:5259:44: error: too many
 arguments to function call, expected 3, have 4
Message-ID: <202602190834.L51d4mfI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git pte_size
head:   1903e57e83c0c0526b0ee193ce32e6aac90863af
commit: 7b50e42cc205cb7ea83bd812494786d350612fe7 [26/27] tmp
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260219/202602190834.L51d4mfI-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e86750b29fa0ff207cd43213d66dabe565417638)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260219/202602190834.L51d4mfI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602190834.L51d4mfI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/memory.c:5259:44: error: too many arguments to function call, expected 3, have 4
    5259 |         folio_add_file_rmap_pmd(folio, page, vma, haddr);
         |         ~~~~~~~~~~~~~~~~~~~~~~~                   ^~~~~
   include/linux/rmap.h:493:6: note: 'folio_add_file_rmap_pmd' declared here
     493 | void folio_add_file_rmap_pmd(struct folio *, struct page *,
         |      ^                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     494 |                 struct vm_area_struct *);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +5259 mm/memory.c

  5204	
  5205	vm_fault_t do_set_pmd(struct vm_fault *vmf, struct folio *folio, struct page *page)
  5206	{
  5207		struct vm_area_struct *vma = vmf->vma;
  5208		bool write = vmf->flags & FAULT_FLAG_WRITE;
  5209		unsigned long haddr = vmf->address & HPAGE_PMD_MASK;
  5210		pmd_t entry;
  5211		vm_fault_t ret = VM_FAULT_FALLBACK;
  5212	
  5213		/*
  5214		 * It is too late to allocate a small folio, we already have a large
  5215		 * folio in the pagecache: especially s390 KVM cannot tolerate any
  5216		 * PMD mappings, but PTE-mapped THP are fine. So let's simply refuse any
  5217		 * PMD mappings if THPs are disabled.
  5218		 */
  5219		if (thp_disabled_by_hw() || vma_thp_disabled(vma, vma->vm_flags))
  5220			return ret;
  5221	
  5222		if (!thp_vma_suitable_order(vma, haddr, PMD_ORDER))
  5223			return ret;
  5224	
  5225		if (folio_order(folio) != HPAGE_PMD_ORDER)
  5226			return ret;
  5227		page = &folio->page;
  5228	
  5229		/*
  5230		 * Just backoff if any subpage of a THP is corrupted otherwise
  5231		 * the corrupted page may mapped by PMD silently to escape the
  5232		 * check.  This kind of THP just can be PTE mapped.  Access to
  5233		 * the corrupted subpage should trigger SIGBUS as expected.
  5234		 */
  5235		if (unlikely(folio_test_has_hwpoisoned(folio)))
  5236			return ret;
  5237	
  5238		/*
  5239		 * Archs like ppc64 need additional space to store information
  5240		 * related to pte entry. Use the preallocated table for that.
  5241		 */
  5242		if (arch_needs_pgtable_deposit() && !vmf->prealloc_pte) {
  5243			vmf->prealloc_pte = pte_alloc_one(vma->vm_mm);
  5244			if (!vmf->prealloc_pte)
  5245				return VM_FAULT_OOM;
  5246		}
  5247	
  5248		vmf->ptl = pmd_lock(vma->vm_mm, vmf->pmd);
  5249		if (unlikely(!pmd_none(*vmf->pmd)))
  5250			goto out;
  5251	
  5252		flush_icache_pages(vma, page, HPAGE_PMD_NR);
  5253	
  5254		entry = folio_mk_pmd(folio, vma->vm_page_prot);
  5255		if (write)
  5256			entry = maybe_pmd_mkwrite(pmd_mkdirty(entry), vma);
  5257	
  5258		add_mm_counter(vma->vm_mm, mm_counter_file(folio), HPAGE_PMD_NR);
> 5259		folio_add_file_rmap_pmd(folio, page, vma, haddr);
  5260	
  5261		/*
  5262		 * deposit and withdraw with pmd lock held
  5263		 */
  5264		if (arch_needs_pgtable_deposit())
  5265			deposit_prealloc_pte(vmf);
  5266	
  5267		set_pmd_at(vma->vm_mm, haddr, vmf->pmd, entry);
  5268	
  5269		update_mmu_cache_pmd(vma, haddr, vmf->pmd);
  5270	
  5271		/* fault is handled */
  5272		ret = 0;
  5273		count_vm_event(THP_FILE_MAPPED);
  5274	out:
  5275		spin_unlock(vmf->ptl);
  5276		return ret;
  5277	}
  5278	#else
  5279	vm_fault_t do_set_pmd(struct vm_fault *vmf, struct folio *folio, struct page *page)
  5280	{
  5281		return VM_FAULT_FALLBACK;
  5282	}
  5283	#endif
  5284	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
