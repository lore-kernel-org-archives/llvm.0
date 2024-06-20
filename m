Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC4C3A1CD;
	Thu, 20 Jun 2024 21:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718917770; cv=none; b=AXIDQIOjcB2OrLG3CJDqgQtopncFLnlsGBFJ77E3KT3iZIWKFeMkOf49ZxnMySXXGWk/5TqLNG87yhf700m71F8iZNeyWv7ixhffhjhk8UlQkx22+bvk/mch6HPOKxT9w8knTn2Nxq8E43aoq6SnGpOiu6bARId0JFHdc7ga/Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718917770; c=relaxed/simple;
	bh=Z1hYb94ZrLXrjuax7iikV4f6ZnGj+mKCssljLTGXnfc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bcn9QFFHfAXhaIwCcJmUuAcTQ2/VQDfSj1DFpTeOTLh8zl0VqvfFrnOjmZ5V8GTav5LPlJHAKWaU2t+x/TpepVy986xJCUPUYdluKCJSf8bpjibt+hz+WF4SzhugQj+cAg3b9c2RcE6Ooj12MB3pNGDFRCXEjf69jDGElmNiH0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PkkqG6Lr; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PkkqG6Lr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718917769; x=1750453769;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z1hYb94ZrLXrjuax7iikV4f6ZnGj+mKCssljLTGXnfc=;
  b=PkkqG6Lrby6D54AyUmGf7cADqVrlD21kiZYeutLBgIP8uKJCJvY/vQlP
   6xW/RbYQ6aQWDQ2ltofODqGRcgkURHOYycvX4Dw+8UTXmy5VZlhFrsCMD
   gHY851TOdnsI1iuTYptmnlZNy39WK1iJAb4bw/SiTS8vPSl42jp0mRkzQ
   /EFwgnuD9R/PNECRu5oyGTJLGVgdmuTh0LopmElMNOULMJMOevYu98qnx
   Hz9q2W3Vj9zMeSd9c73u6mbZ4NdX9HjuCMxGB3JdKbhU1R1QgqgDHUqqI
   bU5KWlKePLyezNzso8A0+bDHbfY+vZqfib0YMz042YH9juTVyD/PV/ZM8
   Q==;
X-CSE-ConnectionGUID: Aa3/kmDoSgyp4H+OHvfUpg==
X-CSE-MsgGUID: mX2j2GoZTu+SHM19htE/2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="27066042"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="27066042"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 14:09:28 -0700
X-CSE-ConnectionGUID: HuG04tLKQvyb3VObEymj1A==
X-CSE-MsgGUID: FEMXBJUnRw20Q9jJ3sC4OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="42459373"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 20 Jun 2024 14:09:26 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKP24-0007x4-0N;
	Thu, 20 Jun 2024 21:09:24 +0000
Date: Fri, 21 Jun 2024 05:09:17 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:migrate_misplaced 3/11] mm/pagewalk.c:891:7:
 error: call to undeclared function 'is_pmd_migration_entry'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202406210423.oa4m2rjB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux migrate_misplaced
head:   1cdf378b2096345dcb6cddabd16a16fb93bb6299
commit: 57e15cac22902c7324d90c148cdb109b9d2ff362 [3/11] mm/pagewalk: introduce folio_walk_start() + folio_walk_end()
config: i386-buildonly-randconfig-001-20240621 (https://download.01.org/0day-ci/archive/20240621/202406210423.oa4m2rjB-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240621/202406210423.oa4m2rjB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406210423.oa4m2rjB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/pagewalk.c:891:7: error: call to undeclared function 'is_pmd_migration_entry'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     891 |                            is_pmd_migration_entry(*pmd)) {
         |                            ^
>> mm/pagewalk.c:892:24: error: call to undeclared function 'pmd_to_swp_entry'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     892 |                         swp_entry_t entry = pmd_to_swp_entry(*pmd);
         |                                             ^
>> mm/pagewalk.c:892:16: error: initializing 'swp_entry_t' with an expression of incompatible type 'int'
     892 |                         swp_entry_t entry = pmd_to_swp_entry(*pmd);
         |                                     ^       ~~~~~~~~~~~~~~~~~~~~~~
>> mm/pagewalk.c:894:11: error: call to undeclared function 'pfn_swap_entry_to_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     894 |                         page = pfn_swap_entry_to_page(entry);
         |                                ^
>> mm/pagewalk.c:894:9: error: incompatible integer to pointer conversion assigning to 'struct page *' from 'int' [-Wint-conversion]
     894 |                         page = pfn_swap_entry_to_page(entry);
         |                              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/pagewalk.c:922:23: error: call to undeclared function 'pte_to_swp_entry'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     922 |                 swp_entry_t entry = pte_to_swp_entry(ptent);
         |                                     ^
   mm/pagewalk.c:922:15: error: initializing 'swp_entry_t' with an expression of incompatible type 'int'
     922 |                 swp_entry_t entry = pte_to_swp_entry(ptent);
         |                             ^       ~~~~~~~~~~~~~~~~~~~~~~~
>> mm/pagewalk.c:925:7: error: call to undeclared function 'is_migration_entry'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     925 |                     is_migration_entry(entry)) {
         |                     ^
   mm/pagewalk.c:926:11: error: call to undeclared function 'pfn_swap_entry_to_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     926 |                         page = pfn_swap_entry_to_page(entry);
         |                                ^
   mm/pagewalk.c:926:9: error: incompatible integer to pointer conversion assigning to 'struct page *' from 'int' [-Wint-conversion]
     926 |                         page = pfn_swap_entry_to_page(entry);
         |                              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   10 errors generated.


vim +/is_pmd_migration_entry +891 mm/pagewalk.c

   767	
   768	/*
   769	 * folio_walk_start - walk the page tables to a folio
   770	 * @vma: the VMA.
   771	 * @addr: the virtual address to use for the page table walk.
   772	 * @fw: filled with information on success.
   773	 *
   774	 * Walk the page tables and lookup a mapped folio.
   775	 *
   776	 * As default, returns only folios that are not special (e.g., not the
   777	 * zeropage) and never returns folios that are supposed to be ignored by the
   778	 * VM (e.g., VM_PFNMAP, weird devmap stuff) -- see vm_normal_page(). If
   779	 * requested, zeropages will be returned as well.
   780	 *
   781	 * As default, this function only considers present page table entries.
   782	 * If requested, it will also consider migration entries, but one has to
   783	 * be a bit careful, especially with large folios that might get concurrently
   784	 * split.
   785	 *
   786	 * Other entries are ignored and result in -ENOENT. Similarly if no suitable
   787	 * folio is mapped (e.g., zeropage without FW_ZEROPAGE), -ENOENT is returned.
   788	 * That is, -ENOENT might either indicate "there is nothing" or "there is
   789	 * nothing applicable we can return".
   790	 *
   791	 * On success, @fw is filled and the function returns the folio while the PTL
   792	 * is still held and folio_walk_end() must be called to clean up, like
   793	 * releasing any held locks. The returned folio must *not* be used after the
   794	 * call to folio_walk_end(), unless a short-term folio reference is taken before
   795	 * that call. Note that the folio may get unmapped immediately after calling
   796	 * folio_walk_end().
   797	 *
   798	 * This function must *not* be used as a naive replacement for
   799	 * get_user_pages() / pin_user_pages(), especially not to perform DMA or
   800	 * carelessly modify page content. This function may *only* be used to grab
   801	 * short-term folio references, never to grab long-term folio references.
   802	 *
   803	 * Using the page table entry pointers in @fw for reading or modifying the
   804	 * entry should be avoided where possible: however, for the purpose of
   805	 * temporarily clearing the entry or setting/clearing access/dirty bits,
   806	 * there might be valid use cases.
   807	 *
   808	 * The mmap lock must be held in read mode.
   809	 *
   810	 * Return: folio pointer on success. -ENOENT if no suitable folio was found and
   811	 * -EAGAIN on invalid inputs. Never returns 0.
   812	 */
   813	struct folio *folio_walk_start(struct vm_area_struct *vma, unsigned long addr,
   814			struct folio_walk *fw, folio_walk_flags_t flags)
   815	{
   816		enum folio_walk_level level;
   817		pte_t *pte = NULL, ptent;
   818		unsigned long offset = 0;
   819		bool writable = false;
   820		struct page *page;
   821		spinlock_t *ptl;
   822		void *entryp;
   823		pgd_t *pgd;
   824		p4d_t *p4d;
   825		pud_t *pud;
   826		pmd_t *pmd;
   827	
   828		mmap_assert_locked(vma->vm_mm);
   829	
   830		if (addr < vma->vm_start || addr >= vma->vm_end)
   831			return ERR_PTR(-EINVAL);
   832	
   833		if (is_vm_hugetlb_page(vma))
   834			return folio_walk_start_hugetlb(vma, addr, fw, flags);
   835	
   836		pgd = pgd_offset(vma->vm_mm, addr);
   837		if (pgd_none_or_clear_bad(pgd))
   838			return ERR_PTR(-ENOENT);
   839		p4d = p4d_offset(pgd, addr);
   840		if (p4d_none_or_clear_bad(p4d))
   841			return ERR_PTR(-ENOENT);
   842		pud = pud_offset(p4d, addr);
   843		if (pud_none_or_clear_bad(pud))
   844			return ERR_PTR(-ENOENT);
   845		if (pud_leaf(*pud)) {
   846			ptl = pud_lock(vma->vm_mm, pud);
   847	
   848			/*
   849			 * We might have raced with split_huge_pud() that could have
   850			 * zapped the page table. Note that we currently never replace
   851			 * a PUD leaf by a filled page table like we do for anonymous
   852			 * THPs.
   853			 */
   854			if (!pud_present(*pud) || !pud_leaf(*pud) || pud_devmap(*pud)) {
   855				spin_unlock(ptl);
   856				return ERR_PTR(-ENOENT);
   857			}
   858	
   859			entryp = pud;
   860			level = FW_LEVEL_PUD;
   861			page = pud_page(*pud);
   862			offset = addr & (PUD_SIZE - 1);
   863			writable = pud_write(*pud);
   864			goto found;
   865		}
   866		pmd = pmd_offset(pud, addr);
   867		if (pmd_none(*pmd))
   868			return ERR_PTR(-ENOENT);
   869	
   870		ptl = pmd_trans_huge_lock(pmd, vma);
   871		if (ptl) {
   872			if (pmd_none(*pmd)) {
   873				spin_unlock(ptl);
   874				return ERR_PTR(-ENOENT);
   875			}
   876	
   877			entryp = pmd;
   878			level = FW_LEVEL_PMD;
   879			if (pmd_present(*pmd)) {
   880				offset = addr & (PMD_SIZE - 1);
   881				writable = pmd_write(*pmd);
   882				page = vm_normal_page_pmd(vma, addr, *pmd);
   883				if (page) {
   884					goto found;
   885				} else if ((flags & FW_ZEROPAGE) &&
   886					    is_huge_zero_pmd(*pmd)) {
   887					page = pfn_to_page(pmd_pfn(*pmd));
   888					goto found;
   889				}
   890			} else if ((flags & FW_MIGRATION_ENTRIES) &&
 > 891				   is_pmd_migration_entry(*pmd)) {
 > 892				swp_entry_t entry = pmd_to_swp_entry(*pmd);
   893	
 > 894				page = pfn_swap_entry_to_page(entry);
   895				if (page) {
   896					offset = addr & (PMD_SIZE - 1);
   897					goto found;
   898				}
   899			}
   900			spin_unlock(ptl);
   901			return ERR_PTR(-ENOENT);
   902		}
   903	
   904		pte = pte_offset_map_lock(vma->vm_mm, pmd, addr, &ptl);
   905		if (!pte)
   906			return ERR_PTR(-ENOENT);
   907		entryp = pte;
   908		level = FW_LEVEL_PTE;
   909	
   910		ptent = ptep_get(pte);
   911		if (pte_present(ptent)) {
   912			page = vm_normal_page(vma, addr, ptent);
   913			writable = pte_write(ptent);
   914			if (page) {
   915				goto found;
   916			} else if ((flags & FW_ZEROPAGE) &&
   917				   is_zero_pfn(pte_pfn(ptent))) {
   918				page = pfn_to_page(pmd_pfn(*pmd));
   919				goto found;
   920			}
   921		} else if (!pte_none(ptent)) {
 > 922			swp_entry_t entry = pte_to_swp_entry(ptent);
   923	
   924			if ((flags & FW_MIGRATION_ENTRIES) &&
 > 925			    is_migration_entry(entry)) {
   926				page = pfn_swap_entry_to_page(entry);
   927				if (page) {
   928					offset = 0;
   929					goto found;
   930				}
   931			}
   932		}
   933		pte_unmap_unlock(pte, ptl);
   934		return ERR_PTR(-ENOENT);
   935	found:
   936		return fill_folio_walk(fw, page, offset, writable, vma, ptl, entryp,
   937				       level);
   938	}
   939	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
