Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E4A17730;
	Sun, 26 May 2024 16:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716739551; cv=none; b=PgqC6/0mUN4MDn0uVNrRANHF95lmnpgHkluRHtCI1QJEppss+oKcz/xPRbKLMBI/mc4Syjlwkwbp4a51CeaF+Eq43HFESwvyk8CGlHFAwdr2GMGT0Uz9YGNpSzNyUlFXbD6krKO8mzbJhl74PBS0uB09PLQPzFa70z4M+pH9wIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716739551; c=relaxed/simple;
	bh=mif/vMqIDh6FminA4nV/Y4rw8Hb8hr1kW0sI6Y9V3hA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TGKxNbrYVx+gFBB9HzZFzjwMixF+wa2FIsf5Qao4Ywcq7G7gIL5O8lsddcu+QquagJno7PGSX3wUY00EaSyLJSE/qIfPTvMSth8fPAAs9Jj2nyre682F9P8WsBZTj9BEgy4Uca2IGAgXunZxKOtrxqVXO6ljZm1hS1P2U1gsxsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=moW1Maro; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="moW1Maro"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716739549; x=1748275549;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mif/vMqIDh6FminA4nV/Y4rw8Hb8hr1kW0sI6Y9V3hA=;
  b=moW1MaroJAOmDrr69Xmxx1e4SOly+2z6LnDEAueCC6+dTucxmiHBb7Q4
   0oaZFJb5I2R52yaHXqM0T1QSEl4g4yazhL2RWdxQo6KUYIGs+SFkq29zA
   0w7SkFyn93z4wNw0SvHxuqK1q+0RSaLc6WJ2U7oepHzPgRx176M0UAX7B
   Kjh74oqcYA1G8+YD3WZ0O2krwyZtqbQ77dMaYlYsO377HPGlq9rqkQdTC
   XsPTpt3G3AfXRUkFIzWPQVi18RTvCz89FpQYDNtOiynh2VPn5HO6nNQsP
   omHA/8SBxouqzyn9q8jQkpV0X1JJn/ocWYV0/9IujtXzJ9T+jsHdjkbLm
   Q==;
X-CSE-ConnectionGUID: PsWJmrUMQ/OZCqaUeTaqTA==
X-CSE-MsgGUID: U2oxbgoxR6me8uDsA85v7w==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="16845894"
X-IronPort-AV: E=Sophos;i="6.08,190,1712646000"; 
   d="scan'208";a="16845894"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2024 09:05:48 -0700
X-CSE-ConnectionGUID: uRV4F06BSwiqDPCckvwC6Q==
X-CSE-MsgGUID: TpvThkNNR1iiuEhk+w0vkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,190,1712646000"; 
   d="scan'208";a="34413876"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 26 May 2024 09:05:48 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sBGNU-0008A9-2L;
	Sun, 26 May 2024 16:05:44 +0000
Date: Mon, 27 May 2024 00:05:15 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 03/16] mm: Provide mm_struct and address to
 huge_ptep_get()
Message-ID: <202405262352.N5XmCPBz-lkp@intel.com>
References: <fbba60d762faad40ebb959bf9517c5c22301f69e.1716714720.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fbba60d762faad40ebb959bf9517c5c22301f69e.1716714720.git.christophe.leroy@csgroup.eu>

Hi Christophe,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes arm64/for-next/core v6.9]
[cannot apply to akpm-mm/mm-everything s390/features linus/master next-20240523]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christophe-Leroy/powerpc-64e-Remove-unused-IBM-HTW-code-SQUASHED/20240526-172511
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/fbba60d762faad40ebb959bf9517c5c22301f69e.1716714720.git.christophe.leroy%40csgroup.eu
patch subject: [RFC PATCH v3 03/16] mm: Provide mm_struct and address to huge_ptep_get()
config: i386-randconfig-003-20240526 (https://download.01.org/0day-ci/archive/20240526/202405262352.N5XmCPBz-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240526/202405262352.N5XmCPBz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405262352.N5XmCPBz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/hugetlb.c:6532:42: error: too many arguments to function call, expected 2, have 3
    6532 |                         migration_entry_wait_huge(vma, haddr, ptep);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~             ^~~~
   include/linux/swapops.h:361:20: note: 'migration_entry_wait_huge' declared here
     361 | static inline void migration_entry_wait_huge(struct vm_area_struct *vma,
         |                    ^                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~
     362 |                                         pte_t *pte) { }
         |                                         ~~~~~~~~~~
   mm/hugetlb.c:6692:36: error: use of undeclared identifier 'mm'
    6692 |                 if (!huge_pte_none(huge_ptep_get(mm, dst_addr, dst_pte))) {
         |                                                  ^
   mm/hugetlb.c:6829:42: error: use of undeclared identifier 'mm'
    6829 |         if (!huge_pte_none_mostly(huge_ptep_get(mm, dst_addr, dst_pte)))
         |                                                 ^
   3 errors generated.


vim +6532 mm/hugetlb.c

  6441	
  6442	vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
  6443				unsigned long address, unsigned int flags)
  6444	{
  6445		pte_t *ptep, entry;
  6446		spinlock_t *ptl;
  6447		vm_fault_t ret;
  6448		u32 hash;
  6449		struct folio *folio = NULL;
  6450		struct folio *pagecache_folio = NULL;
  6451		struct hstate *h = hstate_vma(vma);
  6452		struct address_space *mapping;
  6453		int need_wait_lock = 0;
  6454		unsigned long haddr = address & huge_page_mask(h);
  6455		struct vm_fault vmf = {
  6456			.vma = vma,
  6457			.address = haddr,
  6458			.real_address = address,
  6459			.flags = flags,
  6460			.pgoff = vma_hugecache_offset(h, vma, haddr),
  6461			/* TODO: Track hugetlb faults using vm_fault */
  6462	
  6463			/*
  6464			 * Some fields may not be initialized, be careful as it may
  6465			 * be hard to debug if called functions make assumptions
  6466			 */
  6467		};
  6468	
  6469		/*
  6470		 * Serialize hugepage allocation and instantiation, so that we don't
  6471		 * get spurious allocation failures if two CPUs race to instantiate
  6472		 * the same page in the page cache.
  6473		 */
  6474		mapping = vma->vm_file->f_mapping;
  6475		hash = hugetlb_fault_mutex_hash(mapping, vmf.pgoff);
  6476		mutex_lock(&hugetlb_fault_mutex_table[hash]);
  6477	
  6478		/*
  6479		 * Acquire vma lock before calling huge_pte_alloc and hold
  6480		 * until finished with ptep.  This prevents huge_pmd_unshare from
  6481		 * being called elsewhere and making the ptep no longer valid.
  6482		 */
  6483		hugetlb_vma_lock_read(vma);
  6484		ptep = huge_pte_alloc(mm, vma, haddr, huge_page_size(h));
  6485		if (!ptep) {
  6486			hugetlb_vma_unlock_read(vma);
  6487			mutex_unlock(&hugetlb_fault_mutex_table[hash]);
  6488			return VM_FAULT_OOM;
  6489		}
  6490	
  6491		entry = huge_ptep_get(mm, address, ptep);
  6492		if (huge_pte_none_mostly(entry)) {
  6493			if (is_pte_marker(entry)) {
  6494				pte_marker marker =
  6495					pte_marker_get(pte_to_swp_entry(entry));
  6496	
  6497				if (marker & PTE_MARKER_POISONED) {
  6498					ret = VM_FAULT_HWPOISON_LARGE;
  6499					goto out_mutex;
  6500				}
  6501			}
  6502	
  6503			/*
  6504			 * Other PTE markers should be handled the same way as none PTE.
  6505			 *
  6506			 * hugetlb_no_page will drop vma lock and hugetlb fault
  6507			 * mutex internally, which make us return immediately.
  6508			 */
  6509			return hugetlb_no_page(mm, vma, mapping, vmf.pgoff, address,
  6510						ptep, entry, flags, &vmf);
  6511		}
  6512	
  6513		ret = 0;
  6514	
  6515		/*
  6516		 * entry could be a migration/hwpoison entry at this point, so this
  6517		 * check prevents the kernel from going below assuming that we have
  6518		 * an active hugepage in pagecache. This goto expects the 2nd page
  6519		 * fault, and is_hugetlb_entry_(migration|hwpoisoned) check will
  6520		 * properly handle it.
  6521		 */
  6522		if (!pte_present(entry)) {
  6523			if (unlikely(is_hugetlb_entry_migration(entry))) {
  6524				/*
  6525				 * Release the hugetlb fault lock now, but retain
  6526				 * the vma lock, because it is needed to guard the
  6527				 * huge_pte_lockptr() later in
  6528				 * migration_entry_wait_huge(). The vma lock will
  6529				 * be released there.
  6530				 */
  6531				mutex_unlock(&hugetlb_fault_mutex_table[hash]);
> 6532				migration_entry_wait_huge(vma, haddr, ptep);
  6533				return 0;
  6534			} else if (unlikely(is_hugetlb_entry_hwpoisoned(entry)))
  6535				ret = VM_FAULT_HWPOISON_LARGE |
  6536				    VM_FAULT_SET_HINDEX(hstate_index(h));
  6537			goto out_mutex;
  6538		}
  6539	
  6540		/*
  6541		 * If we are going to COW/unshare the mapping later, we examine the
  6542		 * pending reservations for this page now. This will ensure that any
  6543		 * allocations necessary to record that reservation occur outside the
  6544		 * spinlock. Also lookup the pagecache page now as it is used to
  6545		 * determine if a reservation has been consumed.
  6546		 */
  6547		if ((flags & (FAULT_FLAG_WRITE|FAULT_FLAG_UNSHARE)) &&
  6548		    !(vma->vm_flags & VM_MAYSHARE) && !huge_pte_write(entry)) {
  6549			if (vma_needs_reservation(h, vma, haddr) < 0) {
  6550				ret = VM_FAULT_OOM;
  6551				goto out_mutex;
  6552			}
  6553			/* Just decrements count, does not deallocate */
  6554			vma_end_reservation(h, vma, haddr);
  6555	
  6556			pagecache_folio = filemap_lock_hugetlb_folio(h, mapping,
  6557								     vmf.pgoff);
  6558			if (IS_ERR(pagecache_folio))
  6559				pagecache_folio = NULL;
  6560		}
  6561	
  6562		ptl = huge_pte_lock(h, mm, ptep);
  6563	
  6564		/* Check for a racing update before calling hugetlb_wp() */
  6565		if (unlikely(!pte_same(entry, huge_ptep_get(mm, address, ptep))))
  6566			goto out_ptl;
  6567	
  6568		/* Handle userfault-wp first, before trying to lock more pages */
  6569		if (userfaultfd_wp(vma) && huge_pte_uffd_wp(huge_ptep_get(mm, address, ptep)) &&
  6570		    (flags & FAULT_FLAG_WRITE) && !huge_pte_write(entry)) {
  6571			if (!userfaultfd_wp_async(vma)) {
  6572				spin_unlock(ptl);
  6573				if (pagecache_folio) {
  6574					folio_unlock(pagecache_folio);
  6575					folio_put(pagecache_folio);
  6576				}
  6577				hugetlb_vma_unlock_read(vma);
  6578				mutex_unlock(&hugetlb_fault_mutex_table[hash]);
  6579				return handle_userfault(&vmf, VM_UFFD_WP);
  6580			}
  6581	
  6582			entry = huge_pte_clear_uffd_wp(entry);
  6583			set_huge_pte_at(mm, haddr, ptep, entry,
  6584					huge_page_size(hstate_vma(vma)));
  6585			/* Fallthrough to CoW */
  6586		}
  6587	
  6588		/*
  6589		 * hugetlb_wp() requires page locks of pte_page(entry) and
  6590		 * pagecache_folio, so here we need take the former one
  6591		 * when folio != pagecache_folio or !pagecache_folio.
  6592		 */
  6593		folio = page_folio(pte_page(entry));
  6594		if (folio != pagecache_folio)
  6595			if (!folio_trylock(folio)) {
  6596				need_wait_lock = 1;
  6597				goto out_ptl;
  6598			}
  6599	
  6600		folio_get(folio);
  6601	
  6602		if (flags & (FAULT_FLAG_WRITE|FAULT_FLAG_UNSHARE)) {
  6603			if (!huge_pte_write(entry)) {
  6604				ret = hugetlb_wp(mm, vma, address, ptep, flags,
  6605						 pagecache_folio, ptl, &vmf);
  6606				goto out_put_page;
  6607			} else if (likely(flags & FAULT_FLAG_WRITE)) {
  6608				entry = huge_pte_mkdirty(entry);
  6609			}
  6610		}
  6611		entry = pte_mkyoung(entry);
  6612		if (huge_ptep_set_access_flags(vma, haddr, ptep, entry,
  6613							flags & FAULT_FLAG_WRITE))
  6614			update_mmu_cache(vma, haddr, ptep);
  6615	out_put_page:
  6616		if (folio != pagecache_folio)
  6617			folio_unlock(folio);
  6618		folio_put(folio);
  6619	out_ptl:
  6620		spin_unlock(ptl);
  6621	
  6622		if (pagecache_folio) {
  6623			folio_unlock(pagecache_folio);
  6624			folio_put(pagecache_folio);
  6625		}
  6626	out_mutex:
  6627		hugetlb_vma_unlock_read(vma);
  6628		mutex_unlock(&hugetlb_fault_mutex_table[hash]);
  6629		/*
  6630		 * Generally it's safe to hold refcount during waiting page lock. But
  6631		 * here we just wait to defer the next page fault to avoid busy loop and
  6632		 * the page is not used after unlocked before returning from the current
  6633		 * page fault. So we are safe from accessing freed page, even if we wait
  6634		 * here without taking refcount.
  6635		 */
  6636		if (need_wait_lock)
  6637			folio_wait_locked(folio);
  6638		return ret;
  6639	}
  6640	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
