Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F25417ABB;
	Sat, 22 Jul 2023 13:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690032851; x=1721568851;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SATxkDHWV3mR2UICKgXEOFAfkl6huPATkALEAUmODT0=;
  b=GgSrMl/ItHAiVXEpqXb2pltsu+DesA/g1taj3LqYMjW0Q75mOo/hdRVh
   UewUhDot7/NL+WiMirazbpHnHllFH9bsNzmmrpYZznyRuH4h0HtfJj9I6
   UR4jFmPCPIsRaEXK/xdPXEfQM26bOqByhgrwPTrFJJJlmrLcEz2vvrTGX
   uKRdyD1kxj+ctJbE97/uzVo+J2BmSEbMYqSsPF2M+J9MXV632LkPnQP4j
   i5dr1qHhdLt0q8gDHLlY20obvULteR4mxDoSpmCFIfwR1jbeY+f22J19r
   zgFviilQANIdPngbZKEov3wiEfBoWJX/m48Fef3fCaRRsH2Kq7YVkI0q1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="369864646"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="369864646"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2023 06:34:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="838885585"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="838885585"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 22 Jul 2023 06:34:09 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNCk2-0008LB-03;
	Sat, 22 Jul 2023 13:34:08 +0000
Date: Sat, 22 Jul 2023 21:33:38 +0800
From: kernel test robot <lkp@intel.com>
To: Guo Ren <guoren@linux.alibaba.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [csky-linux:sg2042-master-qspinlock-64ilp32_v3 27/42]
 mm/vmscan.c:4673:10: warning: comparison of distinct pointer types ('typeof
 (addr & (~(((1ULL) << 21) - 1))) *' (aka 'unsigned long long *') and 'typeof
 (pvmw->vma->vm_start) *' (aka 'unsigned long *'))
Message-ID: <202307222146.bm0VPSRQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/c-sky/csky-linux sg2042-master-qspinlock-64ilp32_v3
head:   7f9f76d36814ed6fcbca4c27a5d2ec3724c46add
commit: 255cb458b187d7958c7e9f27d8f831fee8be8c5d [27/42] riscv: s64ilp32: Add MMU_SV39 mode support
config: riscv-randconfig-r042-20230720 (https://download.01.org/0day-ci/archive/20230722/202307222146.bm0VPSRQ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230722/202307222146.bm0VPSRQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307222146.bm0VPSRQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/vmscan.c:4673:10: warning: comparison of distinct pointer types ('typeof (addr & (~(((1ULL) << 21) - 1))) *' (aka 'unsigned long long *') and 'typeof (pvmw->vma->vm_start) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
    4673 |         start = max(addr & PMD_MASK, pvmw->vma->vm_start);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:74:19: note: expanded from macro 'max'
      74 | #define max(x, y)       __careful_cmp(x, y, >)
         |                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
      36 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
      26 |                 (__typecheck(x, y) && __no_side_effects(x, y))
         |                  ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
      20 |         (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                    ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
>> mm/vmscan.c:4674:8: warning: comparison of distinct pointer types ('typeof (addr | ~(~(((1ULL) << 21) - 1))) *' (aka 'unsigned long long *') and 'typeof (pvmw->vma->vm_end - 1) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
    4674 |         end = min(addr | ~PMD_MASK, pvmw->vma->vm_end - 1) + 1;
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:67:19: note: expanded from macro 'min'
      67 | #define min(x, y)       __careful_cmp(x, y, <)
         |                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
      36 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
      26 |                 (__typecheck(x, y) && __no_side_effects(x, y))
         |                  ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
      20 |         (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                    ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   2 warnings generated.
--
>> mm/swap_state.c:760:10: warning: comparison of distinct pointer types ('typeof ((typeof (lpfn))__builtin_choose_expr(((!!(sizeof ((typeof (lpfn) *)1 == (typeof (((vma->vm_start) >> (12))) *)1))) && ((sizeof(int) == sizeof (*(8 ? ((void *)((long)(lpfn) * 0L)) : (int *)8))) && (sizeof(int) == sizeof (*(8 ? ((void *)((long)(((vma->vm_start) >> (12))) * 0L)) : (int *)8))))), ((lpfn) > (((vma->vm_start) >> (12))) ? (lpfn) : (((vma->vm_start) >> (12)))), ({
       typeof (lpfn) __UNIQUE_ID___x344 = (lpfn);
       typeof (((vma->vm_start) >> (12))) __UNIQUE_ID___y345 = (((vma->vm_start) >> (12)));
       ((__UNIQUE_ID___x344) > (__UNIQUE_ID___y345) ? (__UNIQUE_ID___x344) : (__UNIQUE_ID___y345));
   }))) *' (aka 'unsigned long *') and 'typeof (((faddr & (~(((1ULL) << 21) - 1))) >> (12))) *' (aka 'unsigned long long *')) [-Wcompare-distinct-pointer-types]
     760 |         start = max3(lpfn, PFN_DOWN(vma->vm_start),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     761 |                      PFN_DOWN(faddr & PMD_MASK));
         |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:90:23: note: expanded from macro 'max3'
      90 | #define max3(x, y, z) max((typeof(x))max(x, y), z)
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:74:19: note: expanded from macro 'max'
      74 | #define max(x, y)       __careful_cmp(x, y, >)
         |                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
      36 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
      26 |                 (__typecheck(x, y) && __no_side_effects(x, y))
         |                  ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
      20 |         (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                    ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
>> mm/swap_state.c:762:8: warning: comparison of distinct pointer types ('typeof ((typeof (rpfn))__builtin_choose_expr(((!!(sizeof ((typeof (rpfn) *)1 == (typeof (((vma->vm_end) >> (12))) *)1))) && ((sizeof(int) == sizeof (*(8 ? ((void *)((long)(rpfn) * 0L)) : (int *)8))) && (sizeof(int) == sizeof (*(8 ? ((void *)((long)(((vma->vm_end) >> (12))) * 0L)) : (int *)8))))), ((rpfn) < (((vma->vm_end) >> (12))) ? (rpfn) : (((vma->vm_end) >> (12)))), ({
       typeof (rpfn) __UNIQUE_ID___x348 = (rpfn);
       typeof (((vma->vm_end) >> (12))) __UNIQUE_ID___y349 = (((vma->vm_end) >> (12)));
       ((__UNIQUE_ID___x348) < (__UNIQUE_ID___y349) ? (__UNIQUE_ID___x348) : (__UNIQUE_ID___y349));
   }))) *' (aka 'unsigned long *') and 'typeof ((((faddr & (~(((1ULL) << 21) - 1))) + ((1ULL) << 21)) >> (12))) *' (aka 'unsigned long long *')) [-Wcompare-distinct-pointer-types]
     762 |         end = min3(rpfn, PFN_DOWN(vma->vm_end),
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     763 |                    PFN_DOWN((faddr & PMD_MASK) + PMD_SIZE));
         |                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:82:23: note: expanded from macro 'min3'
      82 | #define min3(x, y, z) min((typeof(x))min(x, y), z)
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:67:19: note: expanded from macro 'min'
      67 | #define min(x, y)       __careful_cmp(x, y, <)
         |                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
      36 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
      26 |                 (__typecheck(x, y) && __no_side_effects(x, y))
         |                  ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
      20 |         (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                    ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   2 warnings generated.


vim +4673 mm/vmscan.c

ac35a490237446b Yu Zhao                 2022-09-18  4636  
db19a43d9b3a887 T.J. Alumbaugh          2023-01-18  4637  /******************************************************************************
db19a43d9b3a887 T.J. Alumbaugh          2023-01-18  4638   *                          rmap/PT walk feedback
db19a43d9b3a887 T.J. Alumbaugh          2023-01-18  4639   ******************************************************************************/
db19a43d9b3a887 T.J. Alumbaugh          2023-01-18  4640  
018ee47f14893d5 Yu Zhao                 2022-09-18  4641  /*
49fd9b6df54e610 Matthew Wilcox (Oracle  2022-09-02  4642)  * This function exploits spatial locality when shrink_folio_list() walks the
bd74fdaea146029 Yu Zhao                 2022-09-18  4643   * rmap. It scans the adjacent PTEs of a young PTE and promotes hot pages. If
bd74fdaea146029 Yu Zhao                 2022-09-18  4644   * the scan was done cacheline efficiently, it adds the PMD entry pointing to
bd74fdaea146029 Yu Zhao                 2022-09-18  4645   * the PTE table to the Bloom filter. This forms a feedback loop between the
bd74fdaea146029 Yu Zhao                 2022-09-18  4646   * eviction and the aging.
018ee47f14893d5 Yu Zhao                 2022-09-18  4647   */
018ee47f14893d5 Yu Zhao                 2022-09-18  4648  void lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
018ee47f14893d5 Yu Zhao                 2022-09-18  4649  {
018ee47f14893d5 Yu Zhao                 2022-09-18  4650  	int i;
018ee47f14893d5 Yu Zhao                 2022-09-18  4651  	unsigned long start;
018ee47f14893d5 Yu Zhao                 2022-09-18  4652  	unsigned long end;
bd74fdaea146029 Yu Zhao                 2022-09-18  4653  	struct lru_gen_mm_walk *walk;
bd74fdaea146029 Yu Zhao                 2022-09-18  4654  	int young = 0;
abf086721a2f1e6 T.J. Alumbaugh          2023-01-18  4655  	pte_t *pte = pvmw->pte;
abf086721a2f1e6 T.J. Alumbaugh          2023-01-18  4656  	unsigned long addr = pvmw->address;
018ee47f14893d5 Yu Zhao                 2022-09-18  4657  	struct folio *folio = pfn_folio(pvmw->pfn);
018ee47f14893d5 Yu Zhao                 2022-09-18  4658  	struct mem_cgroup *memcg = folio_memcg(folio);
018ee47f14893d5 Yu Zhao                 2022-09-18  4659  	struct pglist_data *pgdat = folio_pgdat(folio);
018ee47f14893d5 Yu Zhao                 2022-09-18  4660  	struct lruvec *lruvec = mem_cgroup_lruvec(memcg, pgdat);
018ee47f14893d5 Yu Zhao                 2022-09-18  4661  	DEFINE_MAX_SEQ(lruvec);
018ee47f14893d5 Yu Zhao                 2022-09-18  4662  	int old_gen, new_gen = lru_gen_from_seq(max_seq);
018ee47f14893d5 Yu Zhao                 2022-09-18  4663  
018ee47f14893d5 Yu Zhao                 2022-09-18  4664  	lockdep_assert_held(pvmw->ptl);
018ee47f14893d5 Yu Zhao                 2022-09-18  4665  	VM_WARN_ON_ONCE_FOLIO(folio_test_lru(folio), folio);
018ee47f14893d5 Yu Zhao                 2022-09-18  4666  
018ee47f14893d5 Yu Zhao                 2022-09-18  4667  	if (spin_is_contended(pvmw->ptl))
018ee47f14893d5 Yu Zhao                 2022-09-18  4668  		return;
018ee47f14893d5 Yu Zhao                 2022-09-18  4669  
bd74fdaea146029 Yu Zhao                 2022-09-18  4670  	/* avoid taking the LRU lock under the PTL when possible */
bd74fdaea146029 Yu Zhao                 2022-09-18  4671  	walk = current->reclaim_state ? current->reclaim_state->mm_walk : NULL;
bd74fdaea146029 Yu Zhao                 2022-09-18  4672  
abf086721a2f1e6 T.J. Alumbaugh          2023-01-18 @4673  	start = max(addr & PMD_MASK, pvmw->vma->vm_start);
abf086721a2f1e6 T.J. Alumbaugh          2023-01-18 @4674  	end = min(addr | ~PMD_MASK, pvmw->vma->vm_end - 1) + 1;
018ee47f14893d5 Yu Zhao                 2022-09-18  4675  
018ee47f14893d5 Yu Zhao                 2022-09-18  4676  	if (end - start > MIN_LRU_BATCH * PAGE_SIZE) {
abf086721a2f1e6 T.J. Alumbaugh          2023-01-18  4677  		if (addr - start < MIN_LRU_BATCH * PAGE_SIZE / 2)
018ee47f14893d5 Yu Zhao                 2022-09-18  4678  			end = start + MIN_LRU_BATCH * PAGE_SIZE;
abf086721a2f1e6 T.J. Alumbaugh          2023-01-18  4679  		else if (end - addr < MIN_LRU_BATCH * PAGE_SIZE / 2)
018ee47f14893d5 Yu Zhao                 2022-09-18  4680  			start = end - MIN_LRU_BATCH * PAGE_SIZE;
018ee47f14893d5 Yu Zhao                 2022-09-18  4681  		else {
abf086721a2f1e6 T.J. Alumbaugh          2023-01-18  4682  			start = addr - MIN_LRU_BATCH * PAGE_SIZE / 2;
abf086721a2f1e6 T.J. Alumbaugh          2023-01-18  4683  			end = addr + MIN_LRU_BATCH * PAGE_SIZE / 2;
018ee47f14893d5 Yu Zhao                 2022-09-18  4684  		}
018ee47f14893d5 Yu Zhao                 2022-09-18  4685  	}
018ee47f14893d5 Yu Zhao                 2022-09-18  4686  
abf086721a2f1e6 T.J. Alumbaugh          2023-01-18  4687  	/* folio_update_gen() requires stable folio_memcg() */
abf086721a2f1e6 T.J. Alumbaugh          2023-01-18  4688  	if (!mem_cgroup_trylock_pages(memcg))
abf086721a2f1e6 T.J. Alumbaugh          2023-01-18  4689  		return;
018ee47f14893d5 Yu Zhao                 2022-09-18  4690  
018ee47f14893d5 Yu Zhao                 2022-09-18  4691  	arch_enter_lazy_mmu_mode();
018ee47f14893d5 Yu Zhao                 2022-09-18  4692  
abf086721a2f1e6 T.J. Alumbaugh          2023-01-18  4693  	pte -= (addr - start) / PAGE_SIZE;
abf086721a2f1e6 T.J. Alumbaugh          2023-01-18  4694  
018ee47f14893d5 Yu Zhao                 2022-09-18  4695  	for (i = 0, addr = start; addr != end; i++, addr += PAGE_SIZE) {
018ee47f14893d5 Yu Zhao                 2022-09-18  4696  		unsigned long pfn;
c33c794828f2121 Ryan Roberts            2023-06-12  4697  		pte_t ptent = ptep_get(pte + i);
018ee47f14893d5 Yu Zhao                 2022-09-18  4698  
c33c794828f2121 Ryan Roberts            2023-06-12  4699  		pfn = get_pte_pfn(ptent, pvmw->vma, addr);
018ee47f14893d5 Yu Zhao                 2022-09-18  4700  		if (pfn == -1)
018ee47f14893d5 Yu Zhao                 2022-09-18  4701  			continue;
018ee47f14893d5 Yu Zhao                 2022-09-18  4702  
c33c794828f2121 Ryan Roberts            2023-06-12  4703  		if (!pte_young(ptent))
018ee47f14893d5 Yu Zhao                 2022-09-18  4704  			continue;
018ee47f14893d5 Yu Zhao                 2022-09-18  4705  
bd74fdaea146029 Yu Zhao                 2022-09-18  4706  		folio = get_pfn_folio(pfn, memcg, pgdat, !walk || walk->can_swap);
018ee47f14893d5 Yu Zhao                 2022-09-18  4707  		if (!folio)
018ee47f14893d5 Yu Zhao                 2022-09-18  4708  			continue;
018ee47f14893d5 Yu Zhao                 2022-09-18  4709  
018ee47f14893d5 Yu Zhao                 2022-09-18  4710  		if (!ptep_test_and_clear_young(pvmw->vma, addr, pte + i))
018ee47f14893d5 Yu Zhao                 2022-09-18  4711  			VM_WARN_ON_ONCE(true);
018ee47f14893d5 Yu Zhao                 2022-09-18  4712  
bd74fdaea146029 Yu Zhao                 2022-09-18  4713  		young++;
bd74fdaea146029 Yu Zhao                 2022-09-18  4714  
c33c794828f2121 Ryan Roberts            2023-06-12  4715  		if (pte_dirty(ptent) && !folio_test_dirty(folio) &&
018ee47f14893d5 Yu Zhao                 2022-09-18  4716  		    !(folio_test_anon(folio) && folio_test_swapbacked(folio) &&
018ee47f14893d5 Yu Zhao                 2022-09-18  4717  		      !folio_test_swapcache(folio)))
018ee47f14893d5 Yu Zhao                 2022-09-18  4718  			folio_mark_dirty(folio);
018ee47f14893d5 Yu Zhao                 2022-09-18  4719  
abf086721a2f1e6 T.J. Alumbaugh          2023-01-18  4720  		if (walk) {
abf086721a2f1e6 T.J. Alumbaugh          2023-01-18  4721  			old_gen = folio_update_gen(folio, new_gen);
abf086721a2f1e6 T.J. Alumbaugh          2023-01-18  4722  			if (old_gen >= 0 && old_gen != new_gen)
abf086721a2f1e6 T.J. Alumbaugh          2023-01-18  4723  				update_batch_size(walk, folio, old_gen, new_gen);
abf086721a2f1e6 T.J. Alumbaugh          2023-01-18  4724  
abf086721a2f1e6 T.J. Alumbaugh          2023-01-18  4725  			continue;
abf086721a2f1e6 T.J. Alumbaugh          2023-01-18  4726  		}
abf086721a2f1e6 T.J. Alumbaugh          2023-01-18  4727  
018ee47f14893d5 Yu Zhao                 2022-09-18  4728  		old_gen = folio_lru_gen(folio);
018ee47f14893d5 Yu Zhao                 2022-09-18  4729  		if (old_gen < 0)
018ee47f14893d5 Yu Zhao                 2022-09-18  4730  			folio_set_referenced(folio);
018ee47f14893d5 Yu Zhao                 2022-09-18  4731  		else if (old_gen != new_gen)
abf086721a2f1e6 T.J. Alumbaugh          2023-01-18  4732  			folio_activate(folio);
018ee47f14893d5 Yu Zhao                 2022-09-18  4733  	}
018ee47f14893d5 Yu Zhao                 2022-09-18  4734  
018ee47f14893d5 Yu Zhao                 2022-09-18  4735  	arch_leave_lazy_mmu_mode();
abf086721a2f1e6 T.J. Alumbaugh          2023-01-18  4736  	mem_cgroup_unlock_pages();
018ee47f14893d5 Yu Zhao                 2022-09-18  4737  
bd74fdaea146029 Yu Zhao                 2022-09-18  4738  	/* feedback from rmap walkers to page table walkers */
bd74fdaea146029 Yu Zhao                 2022-09-18  4739  	if (suitable_to_scan(i, young))
bd74fdaea146029 Yu Zhao                 2022-09-18  4740  		update_bloom_filter(lruvec, max_seq, pvmw->pmd);
018ee47f14893d5 Yu Zhao                 2022-09-18  4741  }
018ee47f14893d5 Yu Zhao                 2022-09-18  4742  

:::::: The code at line 4673 was first introduced by commit
:::::: abf086721a2f1e6897c57796f7268df1b194c750 mm: multi-gen LRU: simplify lru_gen_look_around()

:::::: TO: T.J. Alumbaugh <talumbau@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
