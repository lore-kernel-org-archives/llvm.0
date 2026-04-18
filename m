Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2831A355F2D;
	Sat, 18 Apr 2026 10:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776509758; cv=none; b=X2ER+zLVsNimh+06G8jmpN78XxSPtOKpFdnAIoKHcyt88S7vuOhs3UaqvuC+ny0ALm7UtdMba4kKc7BPB9kBIagk1i3Gjpex0jiUoT5+6V70FkTnIfkfT+qp0jHQhpbvByjAVT1n7pIqd04u1yLlKE8dS3+EKqLJjPuiMQ1+bpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776509758; c=relaxed/simple;
	bh=NpUYADwwj2olN1Aw0+Bltd+342Bh6H0raLMRiibBz80=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NL5Waf4G333uWifoIo2bmbt8RV5kv4sI39+5nO8Jo3vq3gj8xvGAUhUoPuz5L05uJPdESS2wztebu+1GU1vg7HWML6jahcnpYT4nTljoCQWUs2oJbazucAEZ0jjfwPO8fGWcFscHUEEQoE4JIUJZlEt9wLOwMbqqTd1jEmhaVkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gNzAW2L3; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gNzAW2L3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776509756; x=1808045756;
  h=date:from:to:cc:subject:message-id;
  bh=NpUYADwwj2olN1Aw0+Bltd+342Bh6H0raLMRiibBz80=;
  b=gNzAW2L3t+8HfBrpE/cRY+LcduvXmRMpyhcF4I9GxLKA/QZ0FCD16KZD
   zao5HaItxTyQPnZDJSHwD6flf4X8TqaEGtXqrjLrI6Q3f20eAf1V4B/FM
   uCMMbSaB3+5y2SZZwyz2Bb4l4Iw1wQj6wzLXhCjeTKUGkNO5rmnA45GfY
   C5xC/xY3rp6WJfkw4f0Z86AZiV/oTZ0/Os6ObBKbKD/mmRWy8DxD0a6GO
   5nR86T3k9xRhFNlJ8QtczEvpXQJTpKt/s8W24UzzP6Y5lJFk0Z3oY2X4q
   yxLcxlfN8vZJqI65IfoBHel+x6xeSVIPTabJfqn0ucZeKPXwR4HpdsxBf
   A==;
X-CSE-ConnectionGUID: beMawlXvRFmc3EVh/XHB1Q==
X-CSE-MsgGUID: RBt12m47TbirHXSF+2pPnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="88883845"
X-IronPort-AV: E=Sophos;i="6.23,186,1770624000"; 
   d="scan'208";a="88883845"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2026 03:55:55 -0700
X-CSE-ConnectionGUID: W/igQUInTeaHoDPReu4Nuw==
X-CSE-MsgGUID: Kj6pWWTLRa6qpXUxoxcYMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,186,1770624000"; 
   d="scan'208";a="233009484"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 18 Apr 2026 03:55:53 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wE3L5-000000001BA-22UR;
	Sat, 18 Apr 2026 10:55:51 +0000
Date: Sat, 18 Apr 2026 18:55:42 +0800
From: kernel test robot <lkp@intel.com>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [kas:uffd/rfc-v2 3/7] mm/memory.c:6347:7: error: call to
 undeclared function 'userfaultfd_rwp'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202604181821.IQDdBaRk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git uffd/rfc-v2
head:   8f55f0ce2de130272cb80eee2434a185922b3340
commit: a5a0f28bfc37d5fb52d9268238be0f8280ca737c [3/7] userfaultfd: add UFFDIO_REGISTER_MODE_RWP
config: hexagon-allnoconfig (https://download.01.org/0day-ci/archive/20260418/202604181821.IQDdBaRk-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260418/202604181821.IQDdBaRk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604181821.IQDdBaRk-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> mm/memory.c:1485:26: warning: shift count >= width of type [-Wshift-count-overflow]
    1485 |         if (dst_vma->vm_flags & VM_COPY_ON_FORK)
         |                                 ^~~~~~~~~~~~~~~
   include/linux/mm.h:643:65: note: expanded from macro 'VM_COPY_ON_FORK'
     643 | #define VM_COPY_ON_FORK (VM_PFNMAP | VM_MIXEDMAP | VM_UFFD_WP | VM_UFFD_RWP | \
         |                                                                 ^~~~~~~~~~~
   include/linux/mm.h:501:21: note: expanded from macro 'VM_UFFD_RWP'
     501 | #define VM_UFFD_RWP     INIT_VM_FLAG(UFFD_RWP)
         |                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:402:28: note: expanded from macro 'INIT_VM_FLAG'
     402 | #define INIT_VM_FLAG(name) BIT((__force int) VMA_ ## name ## _BIT)
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
   mm/memory.c:6069:31: warning: shift count >= width of type [-Wshift-count-overflow]
    6069 |         return handle_userfault(vmf, VM_UFFD_RWP);
         |                                      ^~~~~~~~~~~
   include/linux/mm.h:501:21: note: expanded from macro 'VM_UFFD_RWP'
     501 | #define VM_UFFD_RWP     INIT_VM_FLAG(UFFD_RWP)
         |                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:402:28: note: expanded from macro 'INIT_VM_FLAG'
     402 | #define INIT_VM_FLAG(name) BIT((__force int) VMA_ ## name ## _BIT)
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
>> mm/memory.c:6347:7: error: call to undeclared function 'userfaultfd_rwp'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    6347 |                 if (userfaultfd_rwp(vmf->vma))
         |                     ^
   mm/memory.c:6347:7: note: did you mean 'userfaultfd_wp'?
   include/linux/userfaultfd_k.h:369:20: note: 'userfaultfd_wp' declared here
     369 | static inline bool userfaultfd_wp(struct vm_area_struct *vma)
         |                    ^
   mm/memory.c:6465:8: error: call to undeclared function 'userfaultfd_rwp'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    6465 |                         if (userfaultfd_rwp(vma))
         |                             ^
   2 warnings and 2 errors generated.


vim +/userfaultfd_rwp +6347 mm/memory.c

  6242	
  6243	/*
  6244	 * The page faults may be spurious because of the racy access to the
  6245	 * page table.  For example, a non-populated virtual page is accessed
  6246	 * on 2 CPUs simultaneously, thus the page faults are triggered on
  6247	 * both CPUs.  However, it's possible that one CPU (say CPU A) cannot
  6248	 * find the reason for the page fault if the other CPU (say CPU B) has
  6249	 * changed the page table before the PTE is checked on CPU A.  Most of
  6250	 * the time, the spurious page faults can be ignored safely.  However,
  6251	 * if the page fault is for the write access, it's possible that a
  6252	 * stale read-only TLB entry exists in the local CPU and needs to be
  6253	 * flushed on some architectures.  This is called the spurious page
  6254	 * fault fixing.
  6255	 *
  6256	 * Note: flush_tlb_fix_spurious_fault() is defined as flush_tlb_page()
  6257	 * by default and used as such on most architectures, while
  6258	 * flush_tlb_fix_spurious_fault_pmd() is defined as NOP by default and
  6259	 * used as such on most architectures.
  6260	 */
  6261	static void fix_spurious_fault(struct vm_fault *vmf,
  6262				       enum pgtable_level ptlevel)
  6263	{
  6264		/* Skip spurious TLB flush for retried page fault */
  6265		if (vmf->flags & FAULT_FLAG_TRIED)
  6266			return;
  6267		/*
  6268		 * This is needed only for protection faults but the arch code
  6269		 * is not yet telling us if this is a protection fault or not.
  6270		 * This still avoids useless tlb flushes for .text page faults
  6271		 * with threads.
  6272		 */
  6273		if (vmf->flags & FAULT_FLAG_WRITE) {
  6274			if (ptlevel == PGTABLE_LEVEL_PTE)
  6275				flush_tlb_fix_spurious_fault(vmf->vma, vmf->address,
  6276							     vmf->pte);
  6277			else
  6278				flush_tlb_fix_spurious_fault_pmd(vmf->vma, vmf->address,
  6279								 vmf->pmd);
  6280		}
  6281	}
  6282	/*
  6283	 * These routines also need to handle stuff like marking pages dirty
  6284	 * and/or accessed for architectures that don't do it in hardware (most
  6285	 * RISC architectures).  The early dirtying is also good on the i386.
  6286	 *
  6287	 * There is also a hook called "update_mmu_cache()" that architectures
  6288	 * with external mmu caches can use to update those (ie the Sparc or
  6289	 * PowerPC hashed page tables that act as extended TLBs).
  6290	 *
  6291	 * We enter with non-exclusive mmap_lock (to exclude vma changes, but allow
  6292	 * concurrent faults).
  6293	 *
  6294	 * The mmap_lock may have been released depending on flags and our return value.
  6295	 * See filemap_fault() and __folio_lock_or_retry().
  6296	 */
  6297	static vm_fault_t handle_pte_fault(struct vm_fault *vmf)
  6298	{
  6299		pte_t entry;
  6300	
  6301		if (unlikely(pmd_none(*vmf->pmd))) {
  6302			/*
  6303			 * Leave __pte_alloc() until later: because vm_ops->fault may
  6304			 * want to allocate huge page, and if we expose page table
  6305			 * for an instant, it will be difficult to retract from
  6306			 * concurrent faults and from rmap lookups.
  6307			 */
  6308			vmf->pte = NULL;
  6309			vmf->flags &= ~FAULT_FLAG_ORIG_PTE_VALID;
  6310		} else {
  6311			pmd_t dummy_pmdval;
  6312	
  6313			/*
  6314			 * A regular pmd is established and it can't morph into a huge
  6315			 * pmd by anon khugepaged, since that takes mmap_lock in write
  6316			 * mode; but shmem or file collapse to THP could still morph
  6317			 * it into a huge pmd: just retry later if so.
  6318			 *
  6319			 * Use the maywrite version to indicate that vmf->pte may be
  6320			 * modified, but since we will use pte_same() to detect the
  6321			 * change of the !pte_none() entry, there is no need to recheck
  6322			 * the pmdval. Here we choose to pass a dummy variable instead
  6323			 * of NULL, which helps new user think about why this place is
  6324			 * special.
  6325			 */
  6326			vmf->pte = pte_offset_map_rw_nolock(vmf->vma->vm_mm, vmf->pmd,
  6327							    vmf->address, &dummy_pmdval,
  6328							    &vmf->ptl);
  6329			if (unlikely(!vmf->pte))
  6330				return 0;
  6331			vmf->orig_pte = ptep_get_lockless(vmf->pte);
  6332			vmf->flags |= FAULT_FLAG_ORIG_PTE_VALID;
  6333	
  6334			if (pte_none(vmf->orig_pte)) {
  6335				pte_unmap(vmf->pte);
  6336				vmf->pte = NULL;
  6337			}
  6338		}
  6339	
  6340		if (!vmf->pte)
  6341			return do_pte_missing(vmf);
  6342	
  6343		if (!pte_present(vmf->orig_pte))
  6344			return do_swap_page(vmf);
  6345	
  6346		if (pte_protnone(vmf->orig_pte) && vma_is_accessible(vmf->vma)) {
> 6347			if (userfaultfd_rwp(vmf->vma))
  6348				return do_uffd_rwp(vmf);
  6349			return do_numa_page(vmf);
  6350		}
  6351	
  6352		spin_lock(vmf->ptl);
  6353		entry = vmf->orig_pte;
  6354		if (unlikely(!pte_same(ptep_get(vmf->pte), entry))) {
  6355			update_mmu_tlb(vmf->vma, vmf->address, vmf->pte);
  6356			goto unlock;
  6357		}
  6358		if (vmf->flags & (FAULT_FLAG_WRITE|FAULT_FLAG_UNSHARE)) {
  6359			if (!pte_write(entry))
  6360				return do_wp_page(vmf);
  6361			else if (likely(vmf->flags & FAULT_FLAG_WRITE))
  6362				entry = pte_mkdirty(entry);
  6363		}
  6364		entry = pte_mkyoung(entry);
  6365		if (ptep_set_access_flags(vmf->vma, vmf->address, vmf->pte, entry,
  6366					vmf->flags & FAULT_FLAG_WRITE))
  6367			update_mmu_cache_range(vmf, vmf->vma, vmf->address,
  6368					vmf->pte, 1);
  6369		else
  6370			fix_spurious_fault(vmf, PGTABLE_LEVEL_PTE);
  6371	unlock:
  6372		pte_unmap_unlock(vmf->pte, vmf->ptl);
  6373		return 0;
  6374	}
  6375	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
