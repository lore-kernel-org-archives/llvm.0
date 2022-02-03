Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEE62F21
	for <llvm@lists.linux.dev>; Thu,  3 Feb 2022 00:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643847522; x=1675383522;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mV83UJkc92iQgaN65b2J37nZTUYlAv9XP70L9bz7t6s=;
  b=YPb6XLzQcF+54zJkqm1WLxZeriG7+4GuWz7uQFI0fmaijNCkKARxSHDG
   35IUnbqPxFdbo9xsqqHIeD0HKYU7U0tYRRayo0rwMLwsjtkZLUnIJ11Jx
   err3BU55JIrmE0c6OUz3TFb+ooQp+dCSjYt73Q4HB2L8eFfQe7U8MhkWG
   AaS0tic2tA6GEOR9Djandn1zsEjKc9YzoAfwzx90k9VRQx9Txe4fydUfu
   CN/HpJuSI6hfjiZhTeitrpgYwndNbmh9iMZj/EA75+yjstPo1t3+t7Lp8
   bfQ9rAlYSphG9kcIbRpPThmzayIoFc/a8BDffcBhP+tq5zODd+Q97gRgF
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10246"; a="334405310"
X-IronPort-AV: E=Sophos;i="5.88,338,1635231600"; 
   d="scan'208";a="334405310"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2022 16:18:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,338,1635231600"; 
   d="scan'208";a="583623153"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 02 Feb 2022 16:18:34 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nFPpa-000VJP-9A; Thu, 03 Feb 2022 00:18:34 +0000
Date: Thu, 3 Feb 2022 08:18:24 +0800
From: kernel test robot <lkp@intel.com>
To: Muchun Song <songmuchun@bytedance.com>, dan.j.williams@intel.com,
	willy@infradead.org, jack@suse.cz, viro@zeniv.linux.org.uk,
	akpm@linux-foundation.org, apopple@nvidia.com, shy828301@gmail.com,
	rcampbell@nvidia.com, hughd@google.com, xiyuyang19@fudan.edu.cn
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v2 3/6] mm: page_vma_mapped: support checking if a pfn is
 mapped into a vma
Message-ID: <202202030744.TkknA58x-lkp@intel.com>
References: <20220202143307.96282-4-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220202143307.96282-4-songmuchun@bytedance.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Muchun,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on hnaz-mm/master v5.17-rc2 next-20220202]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Muchun-Song/Fix-some-bugs-related-to-ramp-and-dax/20220202-223615
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 9f7fb8de5d9bac17b6392a14af40baf555d9129b
config: i386-randconfig-a014-20220131 (https://download.01.org/0day-ci/archive/20220203/202202030744.TkknA58x-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 6b1e844b69f15bb7dffaf9365cd2b355d2eb7579)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/64a64c01138fd43f8d9ac17a47c813b55231c325
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Muchun-Song/Fix-some-bugs-related-to-ramp-and-dax/20220202-223615
        git checkout 64a64c01138fd43f8d9ac17a47c813b55231c325
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> mm/page_vma_mapped.c:165:16: warning: variable 'pfn' set but not used [-Wunused-but-set-variable]
           unsigned long pfn;
                         ^
   1 warning generated.


vim +/pfn +165 mm/page_vma_mapped.c

   135	
   136	/**
   137	 * page_vma_mapped_walk - check if @pvmw->page or @pvmw->pfn is mapped in
   138	 * @pvmw->vma at @pvmw->address
   139	 * @pvmw: pointer to struct page_vma_mapped_walk. page (or pfn and nr and
   140	 * index), vma, address and flags must be set. pmd, pte and ptl must be NULL.
   141	 *
   142	 * Returns true if the page or pfn is mapped in the vma. @pvmw->pmd and
   143	 * @pvmw->pte point to relevant page table entries. @pvmw->ptl is locked.
   144	 * @pvmw->address is adjusted if needed (for PTE-mapped THPs).
   145	 *
   146	 * If @pvmw->pmd is set but @pvmw->pte is not, you have found PMD-mapped page
   147	 * (usually THP or Huge DEVMAP). For PMD-mapped page, you should run
   148	 * page_vma_mapped_walk() in a loop to find all PTEs that map the huge page.
   149	 *
   150	 * For HugeTLB pages, @pvmw->pte is set to the relevant page table entry
   151	 * regardless of which page table level the page is mapped at. @pvmw->pmd is
   152	 * NULL.
   153	 *
   154	 * Returns false if there are no more page table entries for the page or pfn in
   155	 * the vma. @pvmw->ptl is unlocked and @pvmw->pte is unmapped.
   156	 *
   157	 * If you need to stop the walk before page_vma_mapped_walk() returned false,
   158	 * use page_vma_mapped_walk_done(). It will do the housekeeping.
   159	 */
   160	bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
   161	{
   162		struct mm_struct *mm = pvmw->vma->vm_mm;
   163		struct page *page = NULL;
   164		unsigned long end;
 > 165		unsigned long pfn;
   166		pgd_t *pgd;
   167		p4d_t *p4d;
   168		pud_t *pud;
   169		pmd_t pmde;
   170	
   171		/* The only possible pmd mapping has been handled on last iteration */
   172		if (pvmw->pmd && !pvmw->pte)
   173			return not_found(pvmw);
   174	
   175		if (!(pvmw->flags & PVMW_PFN_WALK))
   176			page = pvmw->page;
   177		pfn = page ? page_to_pfn(page) : pvmw->pfn;
   178	
   179		if (unlikely(page && PageHuge(page))) {
   180			/* The only possible mapping was handled on last iteration */
   181			if (pvmw->pte)
   182				return not_found(pvmw);
   183	
   184			/* when pud is not present, pte will be NULL */
   185			pvmw->pte = huge_pte_offset(mm, pvmw->address, page_size(page));
   186			if (!pvmw->pte)
   187				return false;
   188	
   189			pvmw->ptl = huge_pte_lockptr(page_hstate(page), mm, pvmw->pte);
   190			spin_lock(pvmw->ptl);
   191			if (!check_pte(pvmw))
   192				return not_found(pvmw);
   193			return true;
   194		}
   195	
   196		/*
   197		 * Seek to next pte only makes sense for THP.
   198		 * But more important than that optimization, is to filter out
   199		 * any PageKsm page: whose page->index misleads vma_address()
   200		 * and vma_address_end() to disaster.
   201		 */
   202		if (page)
   203			end = PageTransCompound(page) ?
   204			      vma_address_end(page, pvmw->vma) :
   205			      pvmw->address + PAGE_SIZE;
   206		else
   207			end = vma_pgoff_address_end(pvmw->index, pvmw->nr, pvmw->vma);
   208	
   209		if (pvmw->pte)
   210			goto next_pte;
   211	restart:
   212		do {
   213			pgd = pgd_offset(mm, pvmw->address);
   214			if (!pgd_present(*pgd)) {
   215				step_forward(pvmw, PGDIR_SIZE);
   216				continue;
   217			}
   218			p4d = p4d_offset(pgd, pvmw->address);
   219			if (!p4d_present(*p4d)) {
   220				step_forward(pvmw, P4D_SIZE);
   221				continue;
   222			}
   223			pud = pud_offset(p4d, pvmw->address);
   224			if (!pud_present(*pud)) {
   225				step_forward(pvmw, PUD_SIZE);
   226				continue;
   227			}
   228	
   229			pvmw->pmd = pmd_offset(pud, pvmw->address);
   230			/*
   231			 * Make sure the pmd value isn't cached in a register by the
   232			 * compiler and used as a stale value after we've observed a
   233			 * subsequent update.
   234			 */
   235			pmde = READ_ONCE(*pvmw->pmd);
   236	#ifdef CONFIG_TRANSPARENT_HUGEPAGE
   237			if (pmd_leaf(pmde) || is_pmd_migration_entry(pmde)) {
   238				pvmw->ptl = pmd_lock(mm, pvmw->pmd);
   239				pmde = *pvmw->pmd;
   240				if (likely(pmd_leaf(pmde))) {
   241					if (pvmw->flags & PVMW_MIGRATION)
   242						return not_found(pvmw);
   243					if (pmd_pfn(pmde) != pfn)
   244						return not_found(pvmw);
   245					return true;
   246				}
   247				if (!pmd_present(pmde)) {
   248					swp_entry_t entry;
   249	
   250					if (!thp_migration_supported() ||
   251					    !(pvmw->flags & PVMW_MIGRATION))
   252						return not_found(pvmw);
   253					entry = pmd_to_swp_entry(pmde);
   254					if (!is_migration_entry(entry) ||
   255					    pfn_swap_entry_to_pfn(entry) != pfn)
   256						return not_found(pvmw);
   257					return true;
   258				}
   259				/* THP pmd was split under us: handle on pte level */
   260				spin_unlock(pvmw->ptl);
   261				pvmw->ptl = NULL;
   262			} else
   263	#endif
   264			if (!pmd_present(pmde)) {
   265				/*
   266				 * If PVMW_SYNC, take and drop THP pmd lock so that we
   267				 * cannot return prematurely, while zap_huge_pmd() has
   268				 * cleared *pmd but not decremented compound_mapcount().
   269				 */
   270				if ((pvmw->flags & PVMW_SYNC) && page &&
   271				    PageTransCompound(page)) {
   272					spinlock_t *ptl = pmd_lock(mm, pvmw->pmd);
   273	
   274					spin_unlock(ptl);
   275				}
   276				step_forward(pvmw, PMD_SIZE);
   277				continue;
   278			}
   279			if (!map_pte(pvmw))
   280				goto next_pte;
   281	this_pte:
   282			if (check_pte(pvmw))
   283				return true;
   284	next_pte:
   285			do {
   286				pvmw->address += PAGE_SIZE;
   287				if (pvmw->address >= end)
   288					return not_found(pvmw);
   289				/* Did we cross page table boundary? */
   290				if ((pvmw->address & (PMD_SIZE - PAGE_SIZE)) == 0) {
   291					if (pvmw->ptl) {
   292						spin_unlock(pvmw->ptl);
   293						pvmw->ptl = NULL;
   294					}
   295					pte_unmap(pvmw->pte);
   296					pvmw->pte = NULL;
   297					goto restart;
   298				}
   299				pvmw->pte++;
   300				if ((pvmw->flags & PVMW_SYNC) && !pvmw->ptl) {
   301					pvmw->ptl = pte_lockptr(mm, pvmw->pmd);
   302					spin_lock(pvmw->ptl);
   303				}
   304			} while (pte_none(*pvmw->pte));
   305	
   306			if (!pvmw->ptl) {
   307				pvmw->ptl = pte_lockptr(mm, pvmw->pmd);
   308				spin_lock(pvmw->ptl);
   309			}
   310			goto this_pte;
   311		} while (pvmw->address < end);
   312	
   313		return false;
   314	}
   315	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
