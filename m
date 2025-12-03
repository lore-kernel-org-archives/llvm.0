Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FC82D7D59;
	Wed,  3 Dec 2025 13:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764769299; cv=none; b=Ydf4yddq7C/V7cFRrU9rP2o5BR2h/Li+tjKzsYu/8QP5p5uIeHJEBQBio5QvFwc84YNdl71gLoqGvK/kxGKfzh5LmIeMNLGnSnkYCjRyKGDvjM3Qhm1bTk5lXpxm3sLsW9LmeVkPu6+fRnW129TwMwogb7GfVdTl5A5ZL38kYws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764769299; c=relaxed/simple;
	bh=E/g3wInh/DFFiwFYxFmgRXPAmGOr+na4KqgR0X1Lyp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ezXZwKMp33svzQhJBPywgsagUiDh89iKDwe+bnJHOoqixxJ+Gv41GbuynofMPVwVZAGFrEAMSpcwPwM77xJIdC2jHrk9iMOx+bA9dKmLQwCo/cmlJrHzVGOoEs9isUyHvS/jiKYkbxsp4wE3cVB4AFiBYEUYg8ImxuyfIhjqoKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lR3tsP7C; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lR3tsP7C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764769298; x=1796305298;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E/g3wInh/DFFiwFYxFmgRXPAmGOr+na4KqgR0X1Lyp8=;
  b=lR3tsP7CSl4uGXOu0XusNhK3/V6crCUbbxKahPuKOIGDO5euOp1TRbai
   gNcuzKgr4knUeQSmBhAkWpA3x0hGIQDmaoGtYoUAH130oQgCyyMs+aBYk
   hNIweqlNpaU5Z7GYpQE2rSyTPARtWYbV11KdE3XDG/BHWbRdjfO+vG0qK
   GinB6UZPj0p60oKDBYkDRzapn+WXZTd0XO76D8I1UTQiNST2fvzTGvUot
   nt0p9mDFPh6/gbi2JMHYgqnuQbuvZISyf/YAlNM03jB6U8pGLD3Ywsj6b
   lvcIxPz2LC9cXRrlH4BsOcDoJXqKpaeGEniteWBRbWwF23q9h1gCWyRWO
   g==;
X-CSE-ConnectionGUID: BJxD0sCoQY2A/Mmy50heTA==
X-CSE-MsgGUID: eJoqWQXcShCzyoGkO67/JA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="77869278"
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; 
   d="scan'208";a="77869278"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 05:41:38 -0800
X-CSE-ConnectionGUID: 4HIVObFaQn+K4UOVG1Ot2A==
X-CSE-MsgGUID: hJ44hkv6SZ6djC0YoNEG+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; 
   d="scan'208";a="194576523"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 03 Dec 2025 05:41:36 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQn6r-00000000B1V-49UM;
	Wed, 03 Dec 2025 13:41:33 +0000
Date: Wed, 3 Dec 2025 21:40:52 +0800
From: kernel test robot <lkp@intel.com>
To: Nico Pache <npache@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v13 mm-new 07/16] khugepaged: introduce
 collapse_max_ptes_none helper function
Message-ID: <202512032107.44KoCA71-lkp@intel.com>
References: <20251201174627.23295-8-npache@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201174627.23295-8-npache@redhat.com>

Hi Nico,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on next-20251203]
[cannot apply to linus/master v6.18]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nico-Pache/khugepaged-rename-hpage_collapse_-to-collapse_/20251202-015150
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20251201174627.23295-8-npache%40redhat.com
patch subject: [PATCH v13 mm-new 07/16] khugepaged: introduce collapse_max_ptes_none helper function
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251203/202512032107.44KoCA71-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512032107.44KoCA71-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512032107.44KoCA71-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/khugepaged.c:593:6: warning: variable '_pte' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     593 |         if (max_ptes_none == -EINVAL)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/khugepaged.c:724:25: note: uninitialized use occurs here
     724 |         release_pte_pages(pte, _pte, compound_pagelist);
         |                                ^~~~
   mm/khugepaged.c:593:2: note: remove the 'if' if its condition is always false
     593 |         if (max_ptes_none == -EINVAL)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     594 |                 goto out;
         |                 ~~~~~~~~
   mm/khugepaged.c:588:13: note: initialize the variable '_pte' to silence this warning
     588 |         pte_t *_pte;
         |                    ^
         |                     = NULL
   1 warning generated.


vim +593 mm/khugepaged.c

   580	
   581	static int __collapse_huge_page_isolate(struct vm_area_struct *vma,
   582			unsigned long start_addr, pte_t *pte, struct collapse_control *cc,
   583			unsigned int order, struct list_head *compound_pagelist)
   584	{
   585		struct page *page = NULL;
   586		struct folio *folio = NULL;
   587		unsigned long addr = start_addr;
   588		pte_t *_pte;
   589		int none_or_zero = 0, shared = 0, result = SCAN_FAIL, referenced = 0;
   590		const unsigned long nr_pages = 1UL << order;
   591		int max_ptes_none = collapse_max_ptes_none(order, !cc->is_khugepaged);
   592	
 > 593		if (max_ptes_none == -EINVAL)
   594			goto out;
   595	
   596		for (_pte = pte; _pte < pte + nr_pages;
   597		     _pte++, addr += PAGE_SIZE) {
   598			pte_t pteval = ptep_get(_pte);
   599			if (pte_none_or_zero(pteval)) {
   600				++none_or_zero;
   601				if (!userfaultfd_armed(vma) &&
   602				    (!cc->is_khugepaged ||
   603				     none_or_zero <= max_ptes_none)) {
   604					continue;
   605				} else {
   606					result = SCAN_EXCEED_NONE_PTE;
   607					count_vm_event(THP_SCAN_EXCEED_NONE_PTE);
   608					goto out;
   609				}
   610			}
   611			if (!pte_present(pteval)) {
   612				result = SCAN_PTE_NON_PRESENT;
   613				goto out;
   614			}
   615			if (pte_uffd_wp(pteval)) {
   616				result = SCAN_PTE_UFFD_WP;
   617				goto out;
   618			}
   619			page = vm_normal_page(vma, addr, pteval);
   620			if (unlikely(!page) || unlikely(is_zone_device_page(page))) {
   621				result = SCAN_PAGE_NULL;
   622				goto out;
   623			}
   624	
   625			folio = page_folio(page);
   626			VM_BUG_ON_FOLIO(!folio_test_anon(folio), folio);
   627	
   628			/* See collapse_scan_pmd(). */
   629			if (folio_maybe_mapped_shared(folio)) {
   630				++shared;
   631				/*
   632				 * TODO: Support shared pages without leading to further
   633				 * mTHP collapses. Currently bringing in new pages via
   634				 * shared may cause a future higher order collapse on a
   635				 * rescan of the same range.
   636				 */
   637				if (is_mthp_order(order) || (cc->is_khugepaged &&
   638				    shared > khugepaged_max_ptes_shared)) {
   639					result = SCAN_EXCEED_SHARED_PTE;
   640					count_vm_event(THP_SCAN_EXCEED_SHARED_PTE);
   641					goto out;
   642				}
   643			}
   644	
   645			if (folio_test_large(folio)) {
   646				struct folio *f;
   647	
   648				/*
   649				 * Check if we have dealt with the compound page
   650				 * already
   651				 */
   652				list_for_each_entry(f, compound_pagelist, lru) {
   653					if (folio == f)
   654						goto next;
   655				}
   656			}
   657	
   658			/*
   659			 * We can do it before folio_isolate_lru because the
   660			 * folio can't be freed from under us. NOTE: PG_lock
   661			 * is needed to serialize against split_huge_page
   662			 * when invoked from the VM.
   663			 */
   664			if (!folio_trylock(folio)) {
   665				result = SCAN_PAGE_LOCK;
   666				goto out;
   667			}
   668	
   669			/*
   670			 * Check if the page has any GUP (or other external) pins.
   671			 *
   672			 * The page table that maps the page has been already unlinked
   673			 * from the page table tree and this process cannot get
   674			 * an additional pin on the page.
   675			 *
   676			 * New pins can come later if the page is shared across fork,
   677			 * but not from this process. The other process cannot write to
   678			 * the page, only trigger CoW.
   679			 */
   680			if (folio_expected_ref_count(folio) != folio_ref_count(folio)) {
   681				folio_unlock(folio);
   682				result = SCAN_PAGE_COUNT;
   683				goto out;
   684			}
   685	
   686			/*
   687			 * Isolate the page to avoid collapsing an hugepage
   688			 * currently in use by the VM.
   689			 */
   690			if (!folio_isolate_lru(folio)) {
   691				folio_unlock(folio);
   692				result = SCAN_DEL_PAGE_LRU;
   693				goto out;
   694			}
   695			node_stat_mod_folio(folio,
   696					NR_ISOLATED_ANON + folio_is_file_lru(folio),
   697					folio_nr_pages(folio));
   698			VM_BUG_ON_FOLIO(!folio_test_locked(folio), folio);
   699			VM_BUG_ON_FOLIO(folio_test_lru(folio), folio);
   700	
   701			if (folio_test_large(folio))
   702				list_add_tail(&folio->lru, compound_pagelist);
   703	next:
   704			/*
   705			 * If collapse was initiated by khugepaged, check that there is
   706			 * enough young pte to justify collapsing the page
   707			 */
   708			if (cc->is_khugepaged &&
   709			    (pte_young(pteval) || folio_test_young(folio) ||
   710			     folio_test_referenced(folio) ||
   711			     mmu_notifier_test_young(vma->vm_mm, addr)))
   712				referenced++;
   713		}
   714	
   715		if (unlikely(cc->is_khugepaged && !referenced)) {
   716			result = SCAN_LACK_REFERENCED_PAGE;
   717		} else {
   718			result = SCAN_SUCCEED;
   719			trace_mm_collapse_huge_page_isolate(folio, none_or_zero,
   720							    referenced, result);
   721			return result;
   722		}
   723	out:
   724		release_pte_pages(pte, _pte, compound_pagelist);
   725		trace_mm_collapse_huge_page_isolate(folio, none_or_zero,
   726						    referenced, result);
   727		return result;
   728	}
   729	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
