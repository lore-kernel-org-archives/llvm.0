Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A109D29CA
	for <llvm@lists.linux.dev>; Tue, 25 Jan 2022 15:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643123076; x=1674659076;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e9A93UC/dJD7ewAkOFphtxg6M0gOaQQcac80dgWkwqg=;
  b=hwD61m44tnFlGDpGceEB6ar8VQ/yQqG6doy830Nq2rqL9XpwHbGu6kqJ
   RJklrZAcBf4m+tRK/CRigbjeJ9kDjefEG/D8LcluJ80TMOVo3gPBLf885
   ajqaXsCUed/OwJXM0UtAv7MPpep5mtm4MT/8s82UhCDcTD85tl+5QgYqc
   xzHMb/h3YJ2L24VVIYa4EYkly8wZsG5lFij1718BMEJ8hhNKjehI1HkHm
   J2L+rXDzUVHcBpYkRIvU454lMD9Cwu9Yl4i8GCwb6FErzEj0wmSp1elvb
   FUbYhtbdGS3k6Qhs0mrW1/LpRMOyi0CbK6HR8yn4hz8/rivlwRgjXrbJH
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="243916711"
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600"; 
   d="scan'208";a="243916711"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2022 07:04:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600"; 
   d="scan'208";a="563063737"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 25 Jan 2022 07:04:01 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nCNMW-000K37-G2; Tue, 25 Jan 2022 15:04:00 +0000
Date: Tue, 25 Jan 2022 23:03:45 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [davidhildenbrand:reuse_swap_page 6/10] mm/khugepaged.c:686:8:
 error: implicit declaration of function 'PageKSM'
Message-ID: <202201252354.dFsFKZi4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://github.com/davidhildenbrand/linux reuse_swap_page
head:   09189ec334fe531619f81fa068bea808d80ad2cc
commit: a872bc92d703c5048a66505acae4480615a0d634 [6/10] mm/khugepaged: remove reuse_swap_page() usage
config: s390-buildonly-randconfig-r004-20220124 (https://download.01.org/0day-ci/archive/20220125/202201252354.dFsFKZi4-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 997e128e2a78f5a5434fc75997441ae1ee76f8a4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/davidhildenbrand/linux/commit/a872bc92d703c5048a66505acae4480615a0d634
        git remote add davidhildenbrand git://github.com/davidhildenbrand/linux
        git fetch --no-tags davidhildenbrand reuse_swap_page
        git checkout a872bc92d703c5048a66505acae4480615a0d634
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> mm/khugepaged.c:686:8: error: implicit declaration of function 'PageKSM' [-Werror,-Wimplicit-function-declaration]
                       (PageKSM(page) || !try_to_free_swap(page))) {
                        ^
   mm/khugepaged.c:686:8: note: did you mean 'PageKsm'?
   include/linux/page-flags.h:609:29: note: 'PageKsm' declared here
   static __always_inline bool PageKsm(struct page *page)
                               ^
   1 error generated.


vim +/PageKSM +686 mm/khugepaged.c

   600	
   601	static int __collapse_huge_page_isolate(struct vm_area_struct *vma,
   602						unsigned long address,
   603						pte_t *pte,
   604						struct list_head *compound_pagelist)
   605	{
   606		struct page *page = NULL;
   607		pte_t *_pte;
   608		int none_or_zero = 0, shared = 0, result = 0, referenced = 0;
   609		bool writable = false;
   610	
   611		for (_pte = pte; _pte < pte+HPAGE_PMD_NR;
   612		     _pte++, address += PAGE_SIZE) {
   613			pte_t pteval = *_pte;
   614			if (pte_none(pteval) || (pte_present(pteval) &&
   615					is_zero_pfn(pte_pfn(pteval)))) {
   616				if (!userfaultfd_armed(vma) &&
   617				    ++none_or_zero <= khugepaged_max_ptes_none) {
   618					continue;
   619				} else {
   620					result = SCAN_EXCEED_NONE_PTE;
   621					count_vm_event(THP_SCAN_EXCEED_NONE_PTE);
   622					goto out;
   623				}
   624			}
   625			if (!pte_present(pteval)) {
   626				result = SCAN_PTE_NON_PRESENT;
   627				goto out;
   628			}
   629			page = vm_normal_page(vma, address, pteval);
   630			if (unlikely(!page)) {
   631				result = SCAN_PAGE_NULL;
   632				goto out;
   633			}
   634	
   635			VM_BUG_ON_PAGE(!PageAnon(page), page);
   636	
   637			if (page_mapcount(page) > 1 &&
   638					++shared > khugepaged_max_ptes_shared) {
   639				result = SCAN_EXCEED_SHARED_PTE;
   640				count_vm_event(THP_SCAN_EXCEED_SHARED_PTE);
   641				goto out;
   642			}
   643	
   644			if (PageCompound(page)) {
   645				struct page *p;
   646				page = compound_head(page);
   647	
   648				/*
   649				 * Check if we have dealt with the compound page
   650				 * already
   651				 */
   652				list_for_each_entry(p, compound_pagelist, lru) {
   653					if (page == p)
   654						goto next;
   655				}
   656			}
   657	
   658			/*
   659			 * We can do it before isolate_lru_page because the
   660			 * page can't be freed from under us. NOTE: PG_lock
   661			 * is needed to serialize against split_huge_page
   662			 * when invoked from the VM.
   663			 */
   664			if (!trylock_page(page)) {
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
   680			if (!is_refcount_suitable(page)) {
   681				unlock_page(page);
   682				result = SCAN_PAGE_COUNT;
   683				goto out;
   684			}
   685			if (!pte_write(pteval) && PageSwapCache(page) &&
 > 686			    (PageKSM(page) || !try_to_free_swap(page))) {
   687				/*
   688				 * Page cannot be removed from the swapache.
   689				 * It cannot be collapsed into a THP.
   690				 */
   691				unlock_page(page);
   692				result = SCAN_SWAP_CACHE_PAGE;
   693				goto out;
   694			}
   695	
   696			/*
   697			 * Isolate the page to avoid collapsing an hugepage
   698			 * currently in use by the VM.
   699			 */
   700			if (isolate_lru_page(page)) {
   701				unlock_page(page);
   702				result = SCAN_DEL_PAGE_LRU;
   703				goto out;
   704			}
   705	
   706			/*
   707			 * We're holding the page lock and removed the page from the
   708			 * LRU. Once done copying, we'll unlock and readd to the
   709			 * LRU via release_pte_page(). The page cannot get added
   710			 * to the swapcache in the meantime.
   711			 */
   712			mod_node_page_state(page_pgdat(page),
   713					NR_ISOLATED_ANON + page_is_file_lru(page),
   714					compound_nr(page));
   715			VM_BUG_ON_PAGE(!PageLocked(page), page);
   716			VM_BUG_ON_PAGE(PageLRU(page), page);
   717	
   718			if (PageCompound(page))
   719				list_add_tail(&page->lru, compound_pagelist);
   720	next:
   721			/* There should be enough young pte to collapse the page */
   722			if (pte_young(pteval) ||
   723			    page_is_young(page) || PageReferenced(page) ||
   724			    mmu_notifier_test_young(vma->vm_mm, address))
   725				referenced++;
   726	
   727			if (pte_write(pteval))
   728				writable = true;
   729		}
   730	
   731		if (unlikely(!writable)) {
   732			result = SCAN_PAGE_RO;
   733		} else if (unlikely(!referenced)) {
   734			result = SCAN_LACK_REFERENCED_PAGE;
   735		} else {
   736			result = SCAN_SUCCEED;
   737			trace_mm_collapse_huge_page_isolate(page, none_or_zero,
   738							    referenced, writable, result);
   739			return 1;
   740		}
   741	out:
   742		release_pte_pages(pte, _pte, compound_pagelist);
   743		trace_mm_collapse_huge_page_isolate(page, none_or_zero,
   744						    referenced, writable, result);
   745		return 0;
   746	}
   747	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
