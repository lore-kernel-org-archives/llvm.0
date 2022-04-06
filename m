Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CACC3226
	for <llvm@lists.linux.dev>; Wed,  6 Apr 2022 21:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649279867; x=1680815867;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e7NB/jyDh6ObkyNkaCVTmiqVbgN7jMbRu+evRCIN1VM=;
  b=DQBSux2AfWmV5m7ZqoVVlEwHV2TRP/ZN9+F+OBoMFh3NRIoggrYm5Dgs
   Ox2e1i8haRJJ9XeVNGY7muBVKwqs53lwXh6ffzz3L5TRaTNLiqW/RsxkT
   o1EYmQrHzGqnJztP7GbJb+gS/3rHK8+P1lMdYtmFm5QqJXa3HiHKbciHl
   acslfVcygZb+96ISread/LdPVK0YvVtG8/fxe5XlCI1WwBcYNY32jEsSD
   5E8wHTO5kxAeBkqRAUNFJTEVbu/P30i+9VUos2yOEjP+l5EedRa7SMNjV
   3s7BaukK0lYCtvX2SWkZcBj8ebocmIymvyDwvFY3hs7hCARP4EMnK8QeD
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10309"; a="259992526"
X-IronPort-AV: E=Sophos;i="5.90,240,1643702400"; 
   d="scan'208";a="259992526"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2022 14:17:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,240,1643702400"; 
   d="scan'208";a="524642907"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 06 Apr 2022 14:17:45 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ncD28-0004m1-7k;
	Wed, 06 Apr 2022 21:17:44 +0000
Date: Thu, 7 Apr 2022 05:16:58 +0800
From: kernel test robot <lkp@intel.com>
To: Jiaqi Yan <jiaqiyan@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC v2 1/2] mm: khugepaged: recover from poisoned anonymous
 memory
Message-ID: <202204070554.j055zHGv-lkp@intel.com>
References: <20220405205146.411595-2-jiaqiyan@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220405205146.411595-2-jiaqiyan@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Jiaqi,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on v5.17]
[cannot apply to hnaz-mm/master linus/master v5.18-rc1 next-20220406]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiaqi-Yan/Memory-poison-recovery-in-khugepaged-collapsing/20220406-045440
base:    f443e374ae131c168a065ea1748feac6b2e76613
config: arm64-randconfig-r036-20220406 (https://download.01.org/0day-ci/archive/20220407/202204070554.j055zHGv-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b07d0979e7ff20d7d541af666d822d66b566)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/e2c6963af941ef8a75c397d2c911113d59bfef75
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jiaqi-Yan/Memory-poison-recovery-in-khugepaged-collapsing/20220406-045440
        git checkout e2c6963af941ef8a75c397d2c911113d59bfef75
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> mm/khugepaged.c:785:8: error: implicit declaration of function 'copy_highpage_mc' [-Werror,-Wimplicit-function-declaration]
                           if (copy_highpage_mc(page, src_page)) {
                               ^
   mm/khugepaged.c:785:8: note: did you mean 'copy_highpage'?
   arch/arm64/include/asm/page.h:29:6: note: 'copy_highpage' declared here
   void copy_highpage(struct page *to, struct page *from);
        ^
   1 error generated.


vim +/copy_highpage_mc +785 mm/khugepaged.c

   742	
   743	/*
   744	 * __collapse_huge_page_copy - attempts to copy memory contents from normal
   745	 * pages to a hugepage. Cleanup the normal pages if copy succeeds;
   746	 * otherwise restore the original pmd page table. Returns true if copy
   747	 * succeeds, otherwise returns false.
   748	 *
   749	 * @pte: starting of the PTEs to copy from
   750	 * @page: the new hugepage to copy contents to
   751	 * @pmd: pointer to the new hugepage's PMD
   752	 * @rollback: the original normal PTEs' PMD
   753	 * @address: starting address to copy
   754	 * @pte_ptl: lock on normal pages' PTEs
   755	 * @compound_pagelist: list that stores compound pages
   756	 */
   757	static bool __collapse_huge_page_copy(pte_t *pte,
   758					struct page *page,
   759					pmd_t *pmd,
   760					pmd_t rollback,
   761					struct vm_area_struct *vma,
   762					unsigned long address,
   763					spinlock_t *pte_ptl,
   764					struct list_head *compound_pagelist)
   765	{
   766		struct page *src_page, *tmp;
   767		pte_t *_pte;
   768		pte_t pteval;
   769		unsigned long _address;
   770		spinlock_t *pmd_ptl;
   771		bool copy_succeeded = true;
   772	
   773		/*
   774		 * Copying pages' contents is subject to memory poison at any iteration.
   775		 */
   776		for (_pte = pte, _address = address;
   777				_pte < pte + HPAGE_PMD_NR;
   778				_pte++, page++, _address += PAGE_SIZE) {
   779			pteval = *_pte;
   780	
   781			if (pte_none(pteval) || is_zero_pfn(pte_pfn(pteval)))
   782				clear_user_highpage(page, address);
   783			else {
   784				src_page = pte_page(pteval);
 > 785				if (copy_highpage_mc(page, src_page)) {
   786					copy_succeeded = false;
   787					break;
   788				}
   789			}
   790		}
   791	
   792		if (!copy_succeeded) {
   793			/*
   794			 * Copying failed, re-establish the regular PMD that
   795			 * points to regular page table. Since PTEs are still
   796			 * isolated and locked, acquiring anon_vma_lock is unnecessary.
   797			 */
   798			pmd_ptl = pmd_lock(vma->vm_mm, pmd);
   799			pmd_populate(vma->vm_mm, pmd, pmd_pgtable(rollback));
   800			spin_unlock(pmd_ptl);
   801		}
   802	
   803		for (_pte = pte, _address = address; _pte < pte + HPAGE_PMD_NR;
   804				_pte++, _address += PAGE_SIZE) {
   805			pteval = *_pte;
   806			if (pte_none(pteval) || is_zero_pfn(pte_pfn(pteval))) {
   807				if (copy_succeeded) {
   808					add_mm_counter(vma->vm_mm, MM_ANONPAGES, 1);
   809					if (is_zero_pfn(pte_pfn(pteval))) {
   810						/*
   811						 * ptl mostly unnecessary.
   812						 */
   813						spin_lock(pte_ptl);
   814						pte_clear(vma->vm_mm, _address, _pte);
   815						spin_unlock(pte_ptl);
   816					}
   817				}
   818			} else {
   819				src_page = pte_page(pteval);
   820				if (!PageCompound(src_page))
   821					release_pte_page(src_page);
   822	
   823				if (copy_succeeded) {
   824					/*
   825					 * ptl mostly unnecessary, but preempt has to
   826					 * be disabled to update the per-cpu stats
   827					 * inside page_remove_rmap().
   828					 */
   829					spin_lock(pte_ptl);
   830					pte_clear(vma->vm_mm, _address, _pte);
   831					page_remove_rmap(src_page, false);
   832					spin_unlock(pte_ptl);
   833					free_page_and_swap_cache(src_page);
   834				}
   835			}
   836		}
   837	
   838		list_for_each_entry_safe(src_page, tmp, compound_pagelist, lru) {
   839			list_del(&src_page->lru);
   840			release_pte_page(src_page);
   841		}
   842	
   843		return copy_succeeded;
   844	}
   845	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
