Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5B92F26
	for <llvm@lists.linux.dev>; Fri,  4 Feb 2022 01:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643938247; x=1675474247;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mMHtbZE5U2aP9MLb6KVxAJHGWudjKq0dCZ1hhHE/noQ=;
  b=Rb+p1n1936CjFYygf/4qWWmCURHt7rev0ADj4QGAXOWkeA7TpqmbYF+9
   zPpjo7Uuqa0Q0ccrr/selex0oubdqoFLWxam8/KOI+JL3Z5fPVFFuxMkC
   oaxhfpYTGLfCfvZh65hBslp/xyU9TW0IQGolOWcUgiL6wFOSwjkX4Emgw
   ZORD2/N2H4acXLblwubUhi2hIsDqRdA9id+xz+mNhjb+na/On8AT78nck
   7/HxqHz1ttYyGR2svcW4Bv9qe+1pged2MuVpYyKuyjTV/wBGHW5jEhKs5
   Lcz+UpkpoqTg4TVsSk4iah6BaESYj6L47cmBZ0NMQe3RGvDArm7gKH9G5
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10247"; a="309036117"
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; 
   d="scan'208";a="309036117"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2022 17:30:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; 
   d="scan'208";a="771970104"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 03 Feb 2022 17:30:45 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nFnQy-000Wup-JV; Fri, 04 Feb 2022 01:30:44 +0000
Date: Fri, 4 Feb 2022 09:30:15 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>, linux-mm@kvack.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Muchun Song <songmuchun@bytedance.com>
Subject: Re: [PATCH 2/2] mm: Convert page_vma_mapped_walk to work on PFNs
Message-ID: <202202040625.ZAq9Op2f-lkp@intel.com>
References: <20220203171904.609984-2-willy@infradead.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220203171904.609984-2-willy@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi "Matthew,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on tip/perf/core v5.17-rc2 next-20220203]
[cannot apply to hnaz-mm/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Matthew-Wilcox-Oracle/mm-Add-pvmw_set_page/20220204-012111
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git c36c04c2e132fc39f6b658bf607aed4425427fd7
config: riscv-randconfig-r042-20220131 (https://download.01.org/0day-ci/archive/20220204/202202040625.ZAq9Op2f-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a73e4ce6a59b01f0e37037761c1e6889d539d233)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/4a5a2cece4c5d9ac56322c6828efbea7fcd2e480
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Matthew-Wilcox-Oracle/mm-Add-pvmw_set_page/20220204-012111
        git checkout 4a5a2cece4c5d9ac56322c6828efbea7fcd2e480
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> mm/page_vma_mapped.c:245:27: error: call to __compiletime_assert_255 declared with 'error' attribute: BUILD_BUG failed
                               (pvmw->nr_pages >= HPAGE_PMD_NR)) {
                                                  ^
   include/linux/huge_mm.h:105:26: note: expanded from macro 'HPAGE_PMD_NR'
   #define HPAGE_PMD_NR (1<<HPAGE_PMD_ORDER)
                            ^
   include/linux/huge_mm.h:104:26: note: expanded from macro 'HPAGE_PMD_ORDER'
   #define HPAGE_PMD_ORDER (HPAGE_PMD_SHIFT-PAGE_SHIFT)
                            ^
   include/linux/huge_mm.h:331:28: note: expanded from macro 'HPAGE_PMD_SHIFT'
   #define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
                              ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:327:4: note: expanded from macro '__compiletime_assert'
                           prefix ## suffix();                             \
                           ^
   <scratch space>:161:1: note: expanded from here
   __compiletime_assert_255
   ^
   1 error generated.


vim +/error +245 mm/page_vma_mapped.c

   126	
   127	/**
   128	 * page_vma_mapped_walk - check if @pvmw->pfn is mapped in @pvmw->vma at
   129	 * @pvmw->address
   130	 * @pvmw: pointer to struct page_vma_mapped_walk. page, vma, address and flags
   131	 * must be set. pmd, pte and ptl must be NULL.
   132	 *
   133	 * Returns true if the page is mapped in the vma. @pvmw->pmd and @pvmw->pte point
   134	 * to relevant page table entries. @pvmw->ptl is locked. @pvmw->address is
   135	 * adjusted if needed (for PTE-mapped THPs).
   136	 *
   137	 * If @pvmw->pmd is set but @pvmw->pte is not, you have found PMD-mapped page
   138	 * (usually THP). For PTE-mapped THP, you should run page_vma_mapped_walk() in
   139	 * a loop to find all PTEs that map the THP.
   140	 *
   141	 * For HugeTLB pages, @pvmw->pte is set to the relevant page table entry
   142	 * regardless of which page table level the page is mapped at. @pvmw->pmd is
   143	 * NULL.
   144	 *
   145	 * Returns false if there are no more page table entries for the page in
   146	 * the vma. @pvmw->ptl is unlocked and @pvmw->pte is unmapped.
   147	 *
   148	 * If you need to stop the walk before page_vma_mapped_walk() returned false,
   149	 * use page_vma_mapped_walk_done(). It will do the housekeeping.
   150	 */
   151	bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
   152	{
   153		struct vm_area_struct *vma = pvmw->vma;
   154		struct mm_struct *mm = vma->vm_mm;
   155		unsigned long end;
   156		pgd_t *pgd;
   157		p4d_t *p4d;
   158		pud_t *pud;
   159		pmd_t pmde;
   160	
   161		/* The only possible pmd mapping has been handled on last iteration */
   162		if (pvmw->pmd && !pvmw->pte)
   163			return not_found(pvmw);
   164	
   165		if (unlikely(is_vm_hugetlb_page(vma))) {
   166			unsigned long size = pvmw->nr_pages * PAGE_SIZE;
   167			/* The only possible mapping was handled on last iteration */
   168			if (pvmw->pte)
   169				return not_found(pvmw);
   170	
   171			/* when pud is not present, pte will be NULL */
   172			pvmw->pte = huge_pte_offset(mm, pvmw->address, size);
   173			if (!pvmw->pte)
   174				return false;
   175	
   176			pvmw->ptl = huge_pte_lockptr(size_to_hstate(size), mm,
   177							pvmw->pte);
   178			spin_lock(pvmw->ptl);
   179			if (!check_pte(pvmw))
   180				return not_found(pvmw);
   181			return true;
   182		}
   183	
   184		end = vma_address_end(pvmw);
   185		if (pvmw->pte)
   186			goto next_pte;
   187	restart:
   188		do {
   189			pgd = pgd_offset(mm, pvmw->address);
   190			if (!pgd_present(*pgd)) {
   191				step_forward(pvmw, PGDIR_SIZE);
   192				continue;
   193			}
   194			p4d = p4d_offset(pgd, pvmw->address);
   195			if (!p4d_present(*p4d)) {
   196				step_forward(pvmw, P4D_SIZE);
   197				continue;
   198			}
   199			pud = pud_offset(p4d, pvmw->address);
   200			if (!pud_present(*pud)) {
   201				step_forward(pvmw, PUD_SIZE);
   202				continue;
   203			}
   204	
   205			pvmw->pmd = pmd_offset(pud, pvmw->address);
   206			/*
   207			 * Make sure the pmd value isn't cached in a register by the
   208			 * compiler and used as a stale value after we've observed a
   209			 * subsequent update.
   210			 */
   211			pmde = READ_ONCE(*pvmw->pmd);
   212	
   213			if (pmd_trans_huge(pmde) || is_pmd_migration_entry(pmde)) {
   214				pvmw->ptl = pmd_lock(mm, pvmw->pmd);
   215				pmde = *pvmw->pmd;
   216				if (likely(pmd_trans_huge(pmde))) {
   217					if (pvmw->flags & PVMW_MIGRATION)
   218						return not_found(pvmw);
   219					if (!check_pmd(pmd_pfn(pmde), pvmw))
   220						return not_found(pvmw);
   221					return true;
   222				}
   223				if (!pmd_present(pmde)) {
   224					swp_entry_t entry;
   225	
   226					if (!thp_migration_supported() ||
   227					    !(pvmw->flags & PVMW_MIGRATION))
   228						return not_found(pvmw);
   229					entry = pmd_to_swp_entry(pmde);
   230					if (!is_migration_entry(entry) ||
   231					    !check_pmd(swp_offset(entry), pvmw))
   232						return not_found(pvmw);
   233					return true;
   234				}
   235				/* THP pmd was split under us: handle on pte level */
   236				spin_unlock(pvmw->ptl);
   237				pvmw->ptl = NULL;
   238			} else if (!pmd_present(pmde)) {
   239				/*
   240				 * If PVMW_SYNC, take and drop THP pmd lock so that we
   241				 * cannot return prematurely, while zap_huge_pmd() has
   242				 * cleared *pmd but not decremented compound_mapcount().
   243				 */
   244				if ((pvmw->flags & PVMW_SYNC) &&
 > 245				    (pvmw->nr_pages >= HPAGE_PMD_NR)) {
   246					spinlock_t *ptl = pmd_lock(mm, pvmw->pmd);
   247	
   248					spin_unlock(ptl);
   249				}
   250				step_forward(pvmw, PMD_SIZE);
   251				continue;
   252			}
   253			if (!map_pte(pvmw))
   254				goto next_pte;
   255	this_pte:
   256			if (check_pte(pvmw))
   257				return true;
   258	next_pte:
   259			do {
   260				pvmw->address += PAGE_SIZE;
   261				if (pvmw->address >= end)
   262					return not_found(pvmw);
   263				/* Did we cross page table boundary? */
   264				if ((pvmw->address & (PMD_SIZE - PAGE_SIZE)) == 0) {
   265					if (pvmw->ptl) {
   266						spin_unlock(pvmw->ptl);
   267						pvmw->ptl = NULL;
   268					}
   269					pte_unmap(pvmw->pte);
   270					pvmw->pte = NULL;
   271					goto restart;
   272				}
   273				pvmw->pte++;
   274				if ((pvmw->flags & PVMW_SYNC) && !pvmw->ptl) {
   275					pvmw->ptl = pte_lockptr(mm, pvmw->pmd);
   276					spin_lock(pvmw->ptl);
   277				}
   278			} while (pte_none(*pvmw->pte));
   279	
   280			if (!pvmw->ptl) {
   281				pvmw->ptl = pte_lockptr(mm, pvmw->pmd);
   282				spin_lock(pvmw->ptl);
   283			}
   284			goto this_pte;
   285		} while (pvmw->address < end);
   286	
   287		return false;
   288	}
   289	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
