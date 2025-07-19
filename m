Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3A518C928;
	Sat, 19 Jul 2025 13:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752930319; cv=none; b=tiITx7CXTW+pV8lvYkJLUgq85O/DzpqF4NEq0sgRRksi2729sQQ0gJDmd1pXfjl/P4QTblCP3ZFu5hppoT5VsGaz7bqlorgzFzGnhke3IpSyL6sOLjVj0KChqwkXd7awzjPYjWPq65IUSgx4oT+EaWirsD7Pp+H9mlaZ13HRjnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752930319; c=relaxed/simple;
	bh=NkyI4leJIWYsTc7GfFyBh7KECObbpWL5JEhiHZlaRBY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MRtmvsiBgReTosrMBXCJIgcWj3WxdBpjFAcK0Fg+Cu+IGpbPBH3Sn1ueH1abXdbImkovO3hWUvF+ICWuOGYsZkG1XPENQDDhIluIkR3fsT3DRFjrrr1zpWzwtx28KlHm+vI4UYeY2/Losq9hkIFk52oDlp99GQQSPcAUc1lcqvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=REkk2cyf; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="REkk2cyf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752930317; x=1784466317;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NkyI4leJIWYsTc7GfFyBh7KECObbpWL5JEhiHZlaRBY=;
  b=REkk2cyfxw04yQ8e7uSQy88cWv3hSYgwM064ujAGyiomMn8inEhBZ//X
   NNBOotGDgZsrjTCrxwrAWIzyPVvNjOXy2BRVza9OEfSQ/x1NwUyOwt/wE
   QyjLdtUpvjPcd4GvY+wE+o3J03qwDyGLAWOxgTceoKM9V314SBw3gxtCo
   YjdE3LUxdjj4BPssl27jP72ZWuPjJtglHKJo7J1hRikiw/jY709sPg18c
   gD7CEUzr93Off4Wd7omPZh3KItsU1hMuwXWQg+aoRGF/Ak+3WCDxVFnkF
   UZmxiJgo5cxmtXC60EmHOH62caJEYKsd5YtbUNEM3mEehOaFKG8JKrGIM
   g==;
X-CSE-ConnectionGUID: 1w2ZiTDWTUieVzi9UDf2zA==
X-CSE-MsgGUID: oCN14M3BSRqa/qEN8JOJ1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11497"; a="66271952"
X-IronPort-AV: E=Sophos;i="6.16,324,1744095600"; 
   d="scan'208";a="66271952"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2025 06:05:17 -0700
X-CSE-ConnectionGUID: +Z5/pr21QYW5OoBmYHgRgw==
X-CSE-MsgGUID: U1rdy/+GRGSzvCV7G1V4+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,324,1744095600"; 
   d="scan'208";a="162673676"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 19 Jul 2025 06:05:15 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ud7FZ-000FVR-14;
	Sat, 19 Jul 2025 13:05:13 +0000
Date: Sat, 19 Jul 2025 21:05:04 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 52/104] mm/memory.c:6046:3: error: call to undeclared
 function 'damon_report_access'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202507192010.91NbXIjJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   587ffe894dbc4bdb791e375c50e446a32fba081a
commit: cd52442f08196fc17179dc9a95b097df531203b7 [52/104] mm/memory: report fault information to DAMON
config: i386-buildonly-randconfig-001-20250719 (https://download.01.org/0day-ci/archive/20250719/202507192010.91NbXIjJ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250719/202507192010.91NbXIjJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507192010.91NbXIjJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/memory.c:6046:3: error: call to undeclared function 'damon_report_access'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    6046 |                 damon_report_access(&access_report);
         |                 ^
   mm/memory.c:6176:5: error: call to undeclared function 'damon_report_access'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    6176 |                                 damon_report_access(&access_report);
         |                                 ^
   2 errors generated.


vim +/damon_report_access +6046 mm/memory.c

  5975	
  5976	/*
  5977	 * These routines also need to handle stuff like marking pages dirty
  5978	 * and/or accessed for architectures that don't do it in hardware (most
  5979	 * RISC architectures).  The early dirtying is also good on the i386.
  5980	 *
  5981	 * There is also a hook called "update_mmu_cache()" that architectures
  5982	 * with external mmu caches can use to update those (ie the Sparc or
  5983	 * PowerPC hashed page tables that act as extended TLBs).
  5984	 *
  5985	 * We enter with non-exclusive mmap_lock (to exclude vma changes, but allow
  5986	 * concurrent faults).
  5987	 *
  5988	 * The mmap_lock may have been released depending on flags and our return value.
  5989	 * See filemap_fault() and __folio_lock_or_retry().
  5990	 */
  5991	static vm_fault_t handle_pte_fault(struct vm_fault *vmf)
  5992	{
  5993		pte_t entry;
  5994		struct damon_access_report access_report = {
  5995			.addr = vmf->address,
  5996			.size = 1,
  5997			.nr_accesses = 1,
  5998		};
  5999	
  6000		if (unlikely(pmd_none(*vmf->pmd))) {
  6001			/*
  6002			 * Leave __pte_alloc() until later: because vm_ops->fault may
  6003			 * want to allocate huge page, and if we expose page table
  6004			 * for an instant, it will be difficult to retract from
  6005			 * concurrent faults and from rmap lookups.
  6006			 */
  6007			vmf->pte = NULL;
  6008			vmf->flags &= ~FAULT_FLAG_ORIG_PTE_VALID;
  6009		} else {
  6010			pmd_t dummy_pmdval;
  6011	
  6012			/*
  6013			 * A regular pmd is established and it can't morph into a huge
  6014			 * pmd by anon khugepaged, since that takes mmap_lock in write
  6015			 * mode; but shmem or file collapse to THP could still morph
  6016			 * it into a huge pmd: just retry later if so.
  6017			 *
  6018			 * Use the maywrite version to indicate that vmf->pte may be
  6019			 * modified, but since we will use pte_same() to detect the
  6020			 * change of the !pte_none() entry, there is no need to recheck
  6021			 * the pmdval. Here we chooes to pass a dummy variable instead
  6022			 * of NULL, which helps new user think about why this place is
  6023			 * special.
  6024			 */
  6025			vmf->pte = pte_offset_map_rw_nolock(vmf->vma->vm_mm, vmf->pmd,
  6026							    vmf->address, &dummy_pmdval,
  6027							    &vmf->ptl);
  6028			if (unlikely(!vmf->pte))
  6029				return 0;
  6030			vmf->orig_pte = ptep_get_lockless(vmf->pte);
  6031			vmf->flags |= FAULT_FLAG_ORIG_PTE_VALID;
  6032	
  6033			if (pte_none(vmf->orig_pte)) {
  6034				pte_unmap(vmf->pte);
  6035				vmf->pte = NULL;
  6036			}
  6037		}
  6038	
  6039		if (!vmf->pte)
  6040			return do_pte_missing(vmf);
  6041	
  6042		if (!pte_present(vmf->orig_pte))
  6043			return do_swap_page(vmf);
  6044	
  6045		if (pte_protnone(vmf->orig_pte) && vma_is_accessible(vmf->vma)) {
> 6046			damon_report_access(&access_report);
  6047			return do_numa_page(vmf);
  6048		}
  6049	
  6050		spin_lock(vmf->ptl);
  6051		entry = vmf->orig_pte;
  6052		if (unlikely(!pte_same(ptep_get(vmf->pte), entry))) {
  6053			update_mmu_tlb(vmf->vma, vmf->address, vmf->pte);
  6054			goto unlock;
  6055		}
  6056		if (vmf->flags & (FAULT_FLAG_WRITE|FAULT_FLAG_UNSHARE)) {
  6057			if (!pte_write(entry))
  6058				return do_wp_page(vmf);
  6059			else if (likely(vmf->flags & FAULT_FLAG_WRITE))
  6060				entry = pte_mkdirty(entry);
  6061		}
  6062		entry = pte_mkyoung(entry);
  6063		if (ptep_set_access_flags(vmf->vma, vmf->address, vmf->pte, entry,
  6064					vmf->flags & FAULT_FLAG_WRITE)) {
  6065			update_mmu_cache_range(vmf, vmf->vma, vmf->address,
  6066					vmf->pte, 1);
  6067		} else {
  6068			/* Skip spurious TLB flush for retried page fault */
  6069			if (vmf->flags & FAULT_FLAG_TRIED)
  6070				goto unlock;
  6071			/*
  6072			 * This is needed only for protection faults but the arch code
  6073			 * is not yet telling us if this is a protection fault or not.
  6074			 * This still avoids useless tlb flushes for .text page faults
  6075			 * with threads.
  6076			 */
  6077			if (vmf->flags & FAULT_FLAG_WRITE)
  6078				flush_tlb_fix_spurious_fault(vmf->vma, vmf->address,
  6079							     vmf->pte);
  6080		}
  6081	unlock:
  6082		pte_unmap_unlock(vmf->pte, vmf->ptl);
  6083		return 0;
  6084	}
  6085	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
