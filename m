Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582B836EA84;
	Tue, 18 Aug 2026 19:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787081787; cv=none; b=Q3C8i7gvC6RhqTVe74k/PIre5h787agv4RWj1jCNxElLZ1r2fbBZdV1OMS7x5d8z86eoM50UA58mXJ1OLCZtiDz/IphEHANP6yLFm8OHvdLSK07giz/QuLV3GYfYtriqbW729EBJ3ZVV8cC8GL2Z4zrHEDoN0we+Wls466T7cxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787081787; c=relaxed/simple;
	bh=kCyDKeZu+b6XVo1Hc7m/UioKP3Yi+sS28kzE7Uf2SZ0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=evwKkW4hFxIeCaLM32GT1DTjqvdLZesJJ21cCAdcvQbl4TRKBC1W971zbwBDEMnl+mWVESEtfOMPKbmDnBhJqxkZpZ1QK1hOhItgTK80tW4YlVTqOJhhuXjEwMkaLpE2EGqUei7YWHXQXStqdVDC+Tr8/7kLJq3viva1GC2QaNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YNaQUxGg; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YNaQUxGg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787081784; x=1818617784;
  h=date:from:to:cc:subject:message-id;
  bh=kCyDKeZu+b6XVo1Hc7m/UioKP3Yi+sS28kzE7Uf2SZ0=;
  b=YNaQUxGgwx16bLQNvwsWNhalfGcFOv7FvlsvgvDjWcBAQDdeS37qnOYa
   CCNtYc6WzN3PStpAgNXLE98gR/QU0tjcQuRTfAiB3KvSC1y5KrAAIDWae
   BP6hFc4I7K45NMHbp7F24ZDqVFGl599zsSHMJZ0uCFhwtERbyRD2+b9x/
   aEOQOnkST1M5K9E4byuuTiv4iyculBZCaB0TYtwfnqz+B4TmG0hYpvNBT
   RfBu4FzCvHR6SvV8J9ic0BCL/NrqPfL/JJJ5bT3R0O/5A2zuTDN2GKuTj
   WnWGVjLOhiBV2fIFBV77p+o/hN7lu8fvMb9+f+1JE3f4AZn7ZYR/G6so+
   w==;
X-CSE-ConnectionGUID: fCbQflJhQki6OV+bB8i9wA==
X-CSE-MsgGUID: 1Q+AZJXPQd21j5d7W7q9kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="113128785"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="113128785"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 12:36:23 -0700
X-CSE-ConnectionGUID: a5A//rhiSjK6IR4M19CWrA==
X-CSE-MsgGUID: zBTEXkX6TwiSUGHGG5cLEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="270513268"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 18 Aug 2026 12:36:22 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwPbf-00000000eX4-1Fhv;
	Tue, 18 Aug 2026 19:36:19 +0000
Date: Wed, 19 Aug 2026 03:35:48 +0800
From: kernel test robot <lkp@intel.com>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [kas:collapse/rfc-v1 27/76] mm/collapse.c:302:29: error:
 call to undeclared function 'folio_test_young'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202608190330.FdsN6Kj3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git collapse/rfc-v1
head:   efac4ce42bf9ea34a32d1563fe3370ee837a751f
commit: cb521dbfccdeb167af52e321f0396a75be2796a9 [27/76] mm/collapse: scan a table for what a collapse could use
config: i386-buildonly-randconfig-002-20260818 (https://download.01.org/0day-ci/archive/20260819/202608190330.FdsN6Kj3-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608190330.FdsN6Kj3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608190330.FdsN6Kj3-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/collapse.c:8:
   In file included from include/linux/leafops.h:11:
   include/linux/swapops.h:88:21: error: use of undeclared identifier 'MAX_SWAPFILES_SHIFT'
      88 |         ret.val = (type << SWP_TYPE_SHIFT) | (offset & SWP_OFFSET_MASK);
         |                            ^~~~~~~~~~~~~~
   include/linux/swapops.h:27:45: note: expanded from macro 'SWP_TYPE_SHIFT'
      27 | #define SWP_TYPE_SHIFT  (BITS_PER_XA_VALUE - MAX_SWAPFILES_SHIFT)
         |                                              ^~~~~~~~~~~~~~~~~~~
   include/linux/swapops.h:88:49: error: use of undeclared identifier 'MAX_SWAPFILES_SHIFT'
      88 |         ret.val = (type << SWP_TYPE_SHIFT) | (offset & SWP_OFFSET_MASK);
         |                                                        ^~~~~~~~~~~~~~~
   include/linux/swapops.h:28:34: note: expanded from macro 'SWP_OFFSET_MASK'
      28 | #define SWP_OFFSET_MASK ((1UL << SWP_TYPE_SHIFT) - 1)
         |                                  ^~~~~~~~~~~~~~
   include/linux/swapops.h:27:45: note: expanded from macro 'SWP_TYPE_SHIFT'
      27 | #define SWP_TYPE_SHIFT  (BITS_PER_XA_VALUE - MAX_SWAPFILES_SHIFT)
         |                                              ^~~~~~~~~~~~~~~~~~~
   include/linux/swapops.h:98:23: error: use of undeclared identifier 'MAX_SWAPFILES_SHIFT'
      98 |         return (entry.val >> SWP_TYPE_SHIFT);
         |                              ^~~~~~~~~~~~~~
   include/linux/swapops.h:27:45: note: expanded from macro 'SWP_TYPE_SHIFT'
      27 | #define SWP_TYPE_SHIFT  (BITS_PER_XA_VALUE - MAX_SWAPFILES_SHIFT)
         |                                              ^~~~~~~~~~~~~~~~~~~
   include/linux/swapops.h:107:21: error: use of undeclared identifier 'MAX_SWAPFILES_SHIFT'
     107 |         return entry.val & SWP_OFFSET_MASK;
         |                            ^~~~~~~~~~~~~~~
   include/linux/swapops.h:28:34: note: expanded from macro 'SWP_OFFSET_MASK'
      28 | #define SWP_OFFSET_MASK ((1UL << SWP_TYPE_SHIFT) - 1)
         |                                  ^~~~~~~~~~~~~~
   include/linux/swapops.h:27:45: note: expanded from macro 'SWP_TYPE_SHIFT'
      27 | #define SWP_TYPE_SHIFT  (BITS_PER_XA_VALUE - MAX_SWAPFILES_SHIFT)
         |                                              ^~~~~~~~~~~~~~~~~~~
   include/linux/swapops.h:173:19: error: use of undeclared identifier 'SWP_MIGRATION_READ'; did you mean 'THP_MIGRATION_FAIL'?
     173 |         return swp_entry(SWP_MIGRATION_READ, offset);
         |                          ^~~~~~~~~~~~~~~~~~
         |                          THP_MIGRATION_FAIL
   include/linux/vm_event_item.h:62:3: note: 'THP_MIGRATION_FAIL' declared here
      62 |                 THP_MIGRATION_FAIL,
         |                 ^
   In file included from mm/collapse.c:8:
   In file included from include/linux/leafops.h:11:
   include/linux/swapops.h:178:19: error: use of undeclared identifier 'SWP_MIGRATION_READ_EXCLUSIVE'
     178 |         return swp_entry(SWP_MIGRATION_READ_EXCLUSIVE, offset);
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/swapops.h:183:19: error: use of undeclared identifier 'SWP_MIGRATION_WRITE'
     183 |         return swp_entry(SWP_MIGRATION_WRITE, offset);
         |                          ^~~~~~~~~~~~~~~~~~~
   include/linux/swapops.h:204:26: error: use of undeclared identifier 'MAX_SWAPFILES_SHIFT'
     204 |                                  swp_offset(entry) | SWP_MIG_YOUNG);
         |                                                      ^~~~~~~~~~~~~
   include/linux/swapops.h:66:29: note: expanded from macro 'SWP_MIG_YOUNG'
      66 | #define SWP_MIG_YOUNG                   BIT(SWP_MIG_YOUNG_BIT)
         |                                             ^~~~~~~~~~~~~~~~~
   include/linux/swapops.h:62:29: note: expanded from macro 'SWP_MIG_YOUNG_BIT'
      62 | #define SWP_MIG_YOUNG_BIT               (SWP_PFN_BITS)
         |                                          ^~~~~~~~~~~~
   include/linux/swapops.h:40:11: note: expanded from macro 'SWP_PFN_BITS'
      40 |                                       SWP_TYPE_SHIFT)
         |                                       ^~~~~~~~~~~~~~
   include/linux/swapops.h:27:45: note: expanded from macro 'SWP_TYPE_SHIFT'
      27 | #define SWP_TYPE_SHIFT  (BITS_PER_XA_VALUE - MAX_SWAPFILES_SHIFT)
         |                                              ^~~~~~~~~~~~~~~~~~~
   include/linux/swapops.h:212:26: error: use of undeclared identifier 'MAX_SWAPFILES_SHIFT'
     212 |                                  swp_offset(entry) | SWP_MIG_DIRTY);
         |                                                      ^~~~~~~~~~~~~
   include/linux/swapops.h:67:29: note: expanded from macro 'SWP_MIG_DIRTY'
      67 | #define SWP_MIG_DIRTY                   BIT(SWP_MIG_DIRTY_BIT)
         |                                             ^~~~~~~~~~~~~~~~~
   include/linux/swapops.h:63:29: note: expanded from macro 'SWP_MIG_DIRTY_BIT'
      63 | #define SWP_MIG_DIRTY_BIT               (SWP_PFN_BITS + 1)
         |                                          ^~~~~~~~~~~~
   include/linux/swapops.h:40:11: note: expanded from macro 'SWP_PFN_BITS'
      40 |                                       SWP_TYPE_SHIFT)
         |                                       ^~~~~~~~~~~~~~
   include/linux/swapops.h:27:45: note: expanded from macro 'SWP_TYPE_SHIFT'
      27 | #define SWP_TYPE_SHIFT  (BITS_PER_XA_VALUE - MAX_SWAPFILES_SHIFT)
         |                                              ^~~~~~~~~~~~~~~~~~~
   include/linux/swapops.h:260:19: error: use of undeclared identifier 'SWP_HWPOISON'; did you mean 'FOLL_HWPOISON'?
     260 |         return swp_entry(SWP_HWPOISON, page_to_pfn(page));
         |                          ^~~~~~~~~~~~
         |                          FOLL_HWPOISON
   include/linux/mm_types.h:1904:2: note: 'FOLL_HWPOISON' declared here
    1904 |         FOLL_HWPOISON = 1 << 6,
         |         ^
   In file included from mm/collapse.c:8:
   In file included from include/linux/leafops.h:11:
   include/linux/swapops.h:265:28: error: use of undeclared identifier 'SWP_HWPOISON'; did you mean 'FOLL_HWPOISON'?
     265 |         return swp_type(entry) == SWP_HWPOISON;
         |                                   ^~~~~~~~~~~~
         |                                   FOLL_HWPOISON
   include/linux/mm_types.h:1904:2: note: 'FOLL_HWPOISON' declared here
    1904 |         FOLL_HWPOISON = 1 << 6,
         |         ^
   In file included from mm/collapse.c:8:
   In file included from include/linux/leafops.h:11:
   include/linux/swapops.h:304:19: error: use of undeclared identifier 'SWP_PTE_MARKER'
     304 |         return swp_entry(SWP_PTE_MARKER, marker);
         |                          ^~~~~~~~~~~~~~
>> mm/collapse.c:302:29: error: call to undeclared function 'folio_test_young'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     302 |                     (pte_young(pteval) || folio_test_young(folio) ||
         |                                           ^
   13 errors generated.


vim +/folio_test_young +302 mm/collapse.c

   102	
   103	/*
   104	 * Scan the PTEs between @start and @end and record what a collapse could use: a
   105	 * bit in cc->eligible_ptes for every PTE that may be a source.  Returns
   106	 * SCAN_SUCCEED when every PTE in the range qualified, otherwise the reason one
   107	 * did not, and narrows cc->select_orders to what is still worth trying here.
   108	 */
   109	static enum scan_result collapse_scan_table(struct vm_area_struct *vma,
   110						    pmd_t *pmd, unsigned long start,
   111						    unsigned long end,
   112						    struct collapse_control *cc)
   113	{
   114		const unsigned long pmd_addr = start & HPAGE_PMD_MASK;
   115		unsigned int max_ptes_none, max_ptes_swap, max_ptes_shared;
   116		int none_or_zero = 0, shared = 0, referenced = 0, unmapped = 0;
   117		enum scan_result result, pmd_result = SCAN_SUCCEED;
   118		unsigned int first_offset;
   119		unsigned long addr;
   120		pte_t *pte;
   121		int i;
   122	
   123		max_ptes_none = collapse_max_ptes_none(cc, vma, HPAGE_PMD_ORDER);
   124		max_ptes_swap = collapse_max_ptes_swap(cc, HPAGE_PMD_ORDER);
   125		max_ptes_shared = collapse_max_ptes_shared(cc, HPAGE_PMD_ORDER);
   126	
   127		/*
   128		 * No page table lock: what this builds is advice, and the freeze settles
   129		 * every question it asks by re-reading the table under the lock and
   130		 * freezing each source to the count it expects.  A racy read can only
   131		 * cost a candidate that the freeze then refuses, or miss one that the
   132		 * next pass finds.  What it buys is that a fault in this range does not
   133		 * wait for a scan of the whole table.
   134		 *
   135		 * pte_offset_map() holds rcu_read_lock() until pte_unmap(), which is
   136		 * what keeps the table itself from being freed underneath the walk;
   137		 * mmap_lock keeps the VMA attached, without which free_pgtables() could
   138		 * free it without waiting for RCU at all.  Nothing below here sleeps.
   139		 */
   140		pte = pte_offset_map(pmd, start);
   141		if (!pte) {
   142			cc->progress++;
   143			result = SCAN_NO_PTE_TABLE;
   144			goto out_no_table;
   145		}
   146	
   147		/*
   148		 * The bitmap and the selection offsets stay relative to the table:
   149		 * natural-alignment math needs the table-absolute position, not the
   150		 * position within an arbitrarily placed VMA.
   151		 */
   152		first_offset = (start - pmd_addr) >> PAGE_SHIFT;
   153		for (i = first_offset, addr = start; addr < end;
   154		     i++, addr += PAGE_SIZE) {
   155			pte_t pteval = ptep_get(pte + (i - first_offset));
   156			struct folio *folio;
   157			struct page *page;
   158			int node;
   159	
   160			cc->progress++;
   161	
   162			if (pte_none_or_zero(pteval)) {
   163				if (++none_or_zero > max_ptes_none &&
   164				    pmd_result == SCAN_SUCCEED) {
   165					pmd_result = SCAN_EXCEED_NONE_PTE;
   166					count_vm_event(THP_SCAN_EXCEED_NONE_PTE);
   167					count_mthp_stat(HPAGE_PMD_ORDER,
   168							MTHP_STAT_COLLAPSE_EXCEED_NONE);
   169				}
   170				continue;
   171			}
   172			if (!pte_present(pteval)) {
   173				unmapped++;
   174				if (collapse_exceeds_limit(unmapped, max_ptes_swap,
   175							   start, end)) {
   176					result = SCAN_EXCEED_SWAP_PTE;
   177					count_vm_event(THP_SCAN_EXCEED_SWAP_PTE);
   178					count_mthp_stat(HPAGE_PMD_ORDER,
   179							MTHP_STAT_COLLAPSE_EXCEED_SWAP);
   180					goto out_table_refused;
   181				}
   182				/* Swap entries armed with uffd-wp are refused too */
   183				if (pte_swp_uffd_any(pteval) &&
   184				    pmd_result == SCAN_SUCCEED)
   185					pmd_result = SCAN_PTE_UFFD;
   186				continue;
   187			}
   188			if (pte_uffd(pteval)) {
   189				/*
   190				 * The huge PMD could be marked write protected when any
   191				 * of the small ones is, but that could deliver
   192				 * userfaults outside the registered range.  Keep it
   193				 * simple and refuse the PTE.
   194				 */
   195				if (pmd_result == SCAN_SUCCEED)
   196					pmd_result = SCAN_PTE_UFFD;
   197				continue;
   198			}
   199	
   200			page = vm_normal_page(vma, addr, pteval);
   201			if (unlikely(!page) || unlikely(is_zone_device_page(page))) {
   202				if (pmd_result == SCAN_SUCCEED)
   203					pmd_result = SCAN_PAGE_NULL;
   204				continue;
   205			}
   206			folio = page_folio(page);
   207	
   208			/*
   209			 * A VM_DROPPABLE VMA keeps the lazyfree property across the
   210			 * collapse, so there is nothing to preserve by skipping.
   211			 */
   212			if (cc->policy.skip_lazyfree &&
   213			    !(vma->vm_flags & VM_DROPPABLE) &&
   214			    folio_test_lazyfree(folio) && !pte_dirty(pteval)) {
   215				if (pmd_result == SCAN_SUCCEED)
   216					pmd_result = SCAN_PAGE_LAZYFREE;
   217				continue;
   218			}
   219	
   220			if (!folio_test_anon(folio)) {
   221				if (pmd_result == SCAN_SUCCEED)
   222					pmd_result = SCAN_PAGE_ANON;
   223				continue;
   224			}
   225	
   226			/*
   227			 * A page counts as shared if any part of its folio is, which
   228			 * bounds the cost of CoW-breaking rather than the count of it:
   229			 * collapse_faultin() unshares on !PageAnonExclusive(), a broader
   230			 * test -- a page whose fork co-mapper has exited is
   231			 * single-mapped, so not counted here, yet stays non-exclusive
   232			 * until a write reuses it.  Those are the cheap ones, reused in
   233			 * place.  A page that has to be copied is one this test catches,
   234			 * so the limit does bound the copying it is there to bound.
   235			 */
   236			if (folio_maybe_mapped_shared(folio)) {
   237				shared++;
   238				if (collapse_exceeds_limit(shared, max_ptes_shared,
   239							   start, end)) {
   240					result = SCAN_EXCEED_SHARED_PTE;
   241					count_vm_event(THP_SCAN_EXCEED_SHARED_PTE);
   242					count_mthp_stat(HPAGE_PMD_ORDER,
   243							MTHP_STAT_COLLAPSE_EXCEED_SHARED);
   244					goto out_table_refused;
   245				}
   246			}
   247	
   248			/*
   249			 * Which node the sources are on decides where the destination is
   250			 * allocated: the one with the most of them wins.
   251			 */
   252			node = folio_nid(folio);
   253			if (collapse_scan_abort(node, cc)) {
   254				result = SCAN_SCAN_ABORT;
   255				goto out_table_refused;
   256			}
   257			cc->node_load[node]++;
   258	
   259			/*
   260			 * Usually a folio somebody else is already isolating, whose
   261			 * reference the freeze would refuse anyway.  Not exact: one
   262			 * still on a per-CPU add batch reads the same, and the freeze
   263			 * drains those before it starts.
   264			 */
   265			if (!folio_test_lru(folio)) {
   266				if (pmd_result == SCAN_SUCCEED)
   267					pmd_result = SCAN_PAGE_LRU;
   268				continue;
   269			}
   270			if (folio_test_locked(folio)) {
   271				if (pmd_result == SCAN_SUCCEED)
   272					pmd_result = SCAN_PAGE_LOCK;
   273				continue;
   274			}
   275	
   276			/*
   277			 * A folio whose reference count its mappings do not account for
   278			 * -- a GUP pin, say -- is refused by the freeze, not here.
   279			 * folio_expected_ref_count() wants a folio that cannot change
   280			 * order while it is read, and this walk holds no page table lock
   281			 * and no folio lock, so a folio splitting underneath it would
   282			 * have the count read for the wrong size.  A reference of our
   283			 * own would not help: it stops the folio being freed, not split.
   284			 *
   285			 * So leave it to the freeze, which reads the table under the
   286			 * lock and settles the question by freezing each source to the
   287			 * count it expects.  What it costs is a window selected here and
   288			 * refused there.
   289			 */
   290	
   291			/*
   292			 * Every check passed: this PTE can be a collapse source.  The
   293			 * bit is set last, so a disqualified PTE leaves it clear.
   294			 */
   295			__set_bit(i, cc->eligible_ptes);
   296	
   297			/*
   298			 * Whether a range has to look used at all is the caller's
   299			 * policy, so only a caller that asks gathers the evidence.
   300			 */
   301			if (cc->policy.require_referenced &&
 > 302			    (pte_young(pteval) || folio_test_young(folio) ||
   303			     folio_test_referenced(folio) ||
   304			     mmu_notifier_test_young(vma->vm_mm, addr)))
   305				referenced++;
   306		}
   307	
   308		if (cc->policy.require_referenced &&
   309		    (!referenced || (unmapped && referenced < HPAGE_PMD_NR / 2)))
   310			result = SCAN_LACK_REFERENCED_PAGE;
   311		else
   312			result = pmd_result;
   313		pte_unmap(pte);
   314		goto out;
   315	
   316	out_table_refused:
   317		/*
   318		 * The table is refused as a unit -- a limit the whole range exceeds, or
   319		 * pages on nodes too distant for one folio to serve them all -- so no
   320		 * window inside it is eligible either.
   321		 */
   322		pte_unmap(pte);
   323	out_no_table:
   324		cc->select_orders = 0;
   325	out:
   326		/*
   327		 * A PMD candidate needs the whole table, so anything that disqualified a
   328		 * single PTE rules it out.  Smaller windows that avoid the offending
   329		 * PTEs are still collapsible, so drop just that order and leave the rest
   330		 * to selection -- dropping it also lowers the order selection roots its
   331		 * windows at.  MADV_COLLAPSE has no other order enabled, so it is left
   332		 * with none.
   333		 */
   334		if (result != SCAN_SUCCEED)
   335			cc->select_orders &= ~BIT(HPAGE_PMD_ORDER);
   336	
   337		return result;
   338	}
   339	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
