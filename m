Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D53610EE
	for <llvm@lists.linux.dev>; Sun,  8 May 2022 12:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652013771; x=1683549771;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PISSvFAzsKD+lyjl5XqjE5Itdppg+jIEMY+5PgsG0/Y=;
  b=SXTL+NpLT8wfcEviG7NHAWwXknzZjsREr12GcziZJe7le798d7stu0DC
   1+iqPJjuCUIYd0tUVs1G6vlMTKlVCfnHmw5kb3X+blNNDQkE7ScND9Vai
   BZntve+0vbplATTQKPmj8PsPrpdjlf9pGBVqVSxmfJy1rQp2nqMJhCvaY
   hhOYkQvA42Q7r3rPMeBTP98jz3H4UPpnJiIKhf3A1HSRSMgk1PfVILxiX
   9P78AtvzgSYdMGH5PSHzX5D0+g6w71gP5KKa3RSifmg9Y6Istn1w0ctK/
   aCOoBzFTQP1AfR5zKtp9/e5GvBUWbiPr8/zDGkx5iRy+mOJNPtbYm1LPy
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10340"; a="268474047"
X-IronPort-AV: E=Sophos;i="5.91,208,1647327600"; 
   d="scan'208";a="268474047"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2022 05:42:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,208,1647327600"; 
   d="scan'208";a="518772757"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 08 May 2022 05:42:49 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nngFM-000FTv-M0;
	Sun, 08 May 2022 12:42:48 +0000
Date: Sun, 8 May 2022 20:41:50 +0800
From: kernel test robot <lkp@intel.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH 3/3] mm/damon/vaddr: Change to use
 huge_ptep_get_access_flags()
Message-ID: <202205082037.kql6rnHD-lkp@intel.com>
References: <bfef01549847df7645bac0eacab74b4dde693e04.1651998586.git.baolin.wang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bfef01549847df7645bac0eacab74b4dde693e04.1651998586.git.baolin.wang@linux.alibaba.com>

Hi Baolin,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on arm64/for-next/core]
[also build test ERROR on arnd-asm-generic/master hnaz-mm/master linus/master v5.18-rc5 next-20220506]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Baolin-Wang/Introduce-new-huge_ptep_get_access_flags-interface/20220508-170027
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
config: s390-randconfig-r044-20220508 (https://download.01.org/0day-ci/archive/20220508/202205082037.kql6rnHD-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a385645b470e2d3a1534aae618ea56b31177639f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/4a6618c4db26ef143fd29f9ff2159fedd73ab733
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Baolin-Wang/Introduce-new-huge_ptep_get_access_flags-interface/20220508-170027
        git checkout 4a6618c4db26ef143fd29f9ff2159fedd73ab733
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> mm/damon/vaddr.c:402:16: error: call to undeclared function 'huge_ptep_get_access_flags'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           pte_t entry = huge_ptep_get_access_flags(pte,
                         ^
   mm/damon/vaddr.c:402:16: note: did you mean 'huge_ptep_set_access_flags'?
   arch/s390/include/asm/hugetlb.h:59:19: note: 'huge_ptep_set_access_flags' declared here
   static inline int huge_ptep_set_access_flags(struct vm_area_struct *vma,
                     ^
>> mm/damon/vaddr.c:402:8: error: initializing 'pte_t' with an expression of incompatible type 'int'
           pte_t entry = huge_ptep_get_access_flags(pte,
                 ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/damon/vaddr.c:560:10: error: call to undeclared function 'huge_ptep_get_access_flags'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           entry = huge_ptep_get_access_flags(pte, huge_page_size(h));
                   ^
>> mm/damon/vaddr.c:560:8: error: assigning to 'pte_t' from incompatible type 'int'
           entry = huge_ptep_get_access_flags(pte, huge_page_size(h));
                 ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from mm/damon/vaddr.c:763:
   In file included from mm/damon/vaddr-test.h:15:
   In file included from include/kunit/test.h:22:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:160:
   include/linux/compat.h:424:22: warning: array index 3 is past the end of the array (which contains 1 element) [-Warray-bounds]
           case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
                               ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from mm/damon/vaddr.c:763:
   In file included from mm/damon/vaddr-test.h:15:
   In file included from include/kunit/test.h:22:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:160:
   include/linux/compat.h:424:10: warning: array index 7 is past the end of the array (which contains 2 elements) [-Warray-bounds]
           case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
                   ^     ~
   include/linux/compat.h:131:2: note: array 'sig' declared here
           compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
           ^
   include/linux/compat.h:424:42: warning: array index 6 is past the end of the array (which contains 2 elements) [-Warray-bounds]
           case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
                                                   ^     ~
   include/linux/compat.h:131:2: note: array 'sig' declared here
           compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
           ^
   include/linux/compat.h:424:53: warning: array index 3 is past the end of the array (which contains 1 element) [-Warray-bounds]
           case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
                                                              ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from mm/damon/vaddr.c:763:
   In file included from mm/damon/vaddr-test.h:15:
   In file included from include/kunit/test.h:22:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:160:
   include/linux/compat.h:426:22: warning: array index 2 is past the end of the array (which contains 1 element) [-Warray-bounds]
           case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
                               ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from mm/damon/vaddr.c:763:
   In file included from mm/damon/vaddr-test.h:15:
   In file included from include/kunit/test.h:22:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:160:
   include/linux/compat.h:426:10: warning: array index 5 is past the end of the array (which contains 2 elements) [-Warray-bounds]
           case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
                   ^     ~
   include/linux/compat.h:131:2: note: array 'sig' declared here
           compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
           ^
   include/linux/compat.h:426:42: warning: array index 4 is past the end of the array (which contains 2 elements) [-Warray-bounds]
           case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
                                                   ^     ~
   include/linux/compat.h:131:2: note: array 'sig' declared here
           compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
           ^
   include/linux/compat.h:426:53: warning: array index 2 is past the end of the array (which contains 1 element) [-Warray-bounds]
           case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
                                                              ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from mm/damon/vaddr.c:763:
   In file included from mm/damon/vaddr-test.h:15:
   In file included from include/kunit/test.h:22:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:160:
   include/linux/compat.h:428:22: warning: array index 1 is past the end of the array (which contains 1 element) [-Warray-bounds]
           case 2: v.sig[3] = (set->sig[1] >> 32); v.sig[2] = set->sig[1];
                               ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from mm/damon/vaddr.c:763:
   In file included from mm/damon/vaddr-test.h:15:
   In file included from include/kunit/test.h:22:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:160:
   include/linux/compat.h:428:10: warning: array index 3 is past the end of the array (which contains 2 elements) [-Warray-bounds]
           case 2: v.sig[3] = (set->sig[1] >> 32); v.sig[2] = set->sig[1];
                   ^     ~
   include/linux/compat.h:131:2: note: array 'sig' declared here
           compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
           ^
   include/linux/compat.h:428:42: warning: array index 2 is past the end of the array (which contains 2 elements) [-Warray-bounds]
           case 2: v.sig[3] = (set->sig[1] >> 32); v.sig[2] = set->sig[1];


vim +/huge_ptep_get_access_flags +402 mm/damon/vaddr.c

   396	
   397	#ifdef CONFIG_HUGETLB_PAGE
   398	static void damon_hugetlb_mkold(pte_t *pte, struct mm_struct *mm,
   399					struct vm_area_struct *vma, unsigned long addr)
   400	{
   401		bool referenced = false;
 > 402		pte_t entry = huge_ptep_get_access_flags(pte,
   403						huge_page_size(hstate_vma(vma)));
   404		struct page *page = pte_page(entry);
   405	
   406		get_page(page);
   407	
   408		if (pte_young(entry)) {
   409			referenced = true;
   410			entry = pte_mkold(entry);
   411			huge_ptep_set_access_flags(vma, addr, pte, entry,
   412						   vma->vm_flags & VM_WRITE);
   413		}
   414	
   415	#ifdef CONFIG_MMU_NOTIFIER
   416		if (mmu_notifier_clear_young(mm, addr,
   417					     addr + huge_page_size(hstate_vma(vma))))
   418			referenced = true;
   419	#endif /* CONFIG_MMU_NOTIFIER */
   420	
   421		if (referenced)
   422			set_page_young(page);
   423	
   424		set_page_idle(page);
   425		put_page(page);
   426	}
   427	
   428	static int damon_mkold_hugetlb_entry(pte_t *pte, unsigned long hmask,
   429					     unsigned long addr, unsigned long end,
   430					     struct mm_walk *walk)
   431	{
   432		struct hstate *h = hstate_vma(walk->vma);
   433		spinlock_t *ptl;
   434		pte_t entry;
   435	
   436		ptl = huge_pte_lock(h, walk->mm, pte);
   437		entry = huge_ptep_get(pte);
   438		if (!pte_present(entry))
   439			goto out;
   440	
   441		damon_hugetlb_mkold(pte, walk->mm, walk->vma, addr);
   442	
   443	out:
   444		spin_unlock(ptl);
   445		return 0;
   446	}
   447	#else
   448	#define damon_mkold_hugetlb_entry NULL
   449	#endif /* CONFIG_HUGETLB_PAGE */
   450	
   451	static const struct mm_walk_ops damon_mkold_ops = {
   452		.pmd_entry = damon_mkold_pmd_entry,
   453		.hugetlb_entry = damon_mkold_hugetlb_entry,
   454	};
   455	
   456	static void damon_va_mkold(struct mm_struct *mm, unsigned long addr)
   457	{
   458		mmap_read_lock(mm);
   459		walk_page_range(mm, addr, addr + 1, &damon_mkold_ops, NULL);
   460		mmap_read_unlock(mm);
   461	}
   462	
   463	/*
   464	 * Functions for the access checking of the regions
   465	 */
   466	
   467	static void __damon_va_prepare_access_check(struct damon_ctx *ctx,
   468				struct mm_struct *mm, struct damon_region *r)
   469	{
   470		r->sampling_addr = damon_rand(r->ar.start, r->ar.end);
   471	
   472		damon_va_mkold(mm, r->sampling_addr);
   473	}
   474	
   475	static void damon_va_prepare_access_checks(struct damon_ctx *ctx)
   476	{
   477		struct damon_target *t;
   478		struct mm_struct *mm;
   479		struct damon_region *r;
   480	
   481		damon_for_each_target(t, ctx) {
   482			mm = damon_get_mm(t);
   483			if (!mm)
   484				continue;
   485			damon_for_each_region(r, t)
   486				__damon_va_prepare_access_check(ctx, mm, r);
   487			mmput(mm);
   488		}
   489	}
   490	
   491	struct damon_young_walk_private {
   492		unsigned long *page_sz;
   493		bool young;
   494	};
   495	
   496	static int damon_young_pmd_entry(pmd_t *pmd, unsigned long addr,
   497			unsigned long next, struct mm_walk *walk)
   498	{
   499		pte_t *pte;
   500		spinlock_t *ptl;
   501		struct page *page;
   502		struct damon_young_walk_private *priv = walk->private;
   503	
   504	#ifdef CONFIG_TRANSPARENT_HUGEPAGE
   505		if (pmd_huge(*pmd)) {
   506			ptl = pmd_lock(walk->mm, pmd);
   507			if (!pmd_huge(*pmd)) {
   508				spin_unlock(ptl);
   509				goto regular_page;
   510			}
   511			page = damon_get_page(pmd_pfn(*pmd));
   512			if (!page)
   513				goto huge_out;
   514			if (pmd_young(*pmd) || !page_is_idle(page) ||
   515						mmu_notifier_test_young(walk->mm,
   516							addr)) {
   517				*priv->page_sz = ((1UL) << HPAGE_PMD_SHIFT);
   518				priv->young = true;
   519			}
   520			put_page(page);
   521	huge_out:
   522			spin_unlock(ptl);
   523			return 0;
   524		}
   525	
   526	regular_page:
   527	#endif	/* CONFIG_TRANSPARENT_HUGEPAGE */
   528	
   529		if (pmd_none(*pmd) || unlikely(pmd_bad(*pmd)))
   530			return -EINVAL;
   531		pte = pte_offset_map_lock(walk->mm, pmd, addr, &ptl);
   532		if (!pte_present(*pte))
   533			goto out;
   534		page = damon_get_page(pte_pfn(*pte));
   535		if (!page)
   536			goto out;
   537		if (pte_young(*pte) || !page_is_idle(page) ||
   538				mmu_notifier_test_young(walk->mm, addr)) {
   539			*priv->page_sz = PAGE_SIZE;
   540			priv->young = true;
   541		}
   542		put_page(page);
   543	out:
   544		pte_unmap_unlock(pte, ptl);
   545		return 0;
   546	}
   547	
   548	#ifdef CONFIG_HUGETLB_PAGE
   549	static int damon_young_hugetlb_entry(pte_t *pte, unsigned long hmask,
   550					     unsigned long addr, unsigned long end,
   551					     struct mm_walk *walk)
   552	{
   553		struct damon_young_walk_private *priv = walk->private;
   554		struct hstate *h = hstate_vma(walk->vma);
   555		struct page *page;
   556		spinlock_t *ptl;
   557		pte_t entry;
   558	
   559		ptl = huge_pte_lock(h, walk->mm, pte);
 > 560		entry = huge_ptep_get_access_flags(pte, huge_page_size(h));
   561		if (!pte_present(entry))
   562			goto out;
   563	
   564		page = pte_page(entry);
   565		get_page(page);
   566	
   567		if (pte_young(entry) || !page_is_idle(page) ||
   568		    mmu_notifier_test_young(walk->mm, addr)) {
   569			*priv->page_sz = huge_page_size(h);
   570			priv->young = true;
   571		}
   572	
   573		put_page(page);
   574	
   575	out:
   576		spin_unlock(ptl);
   577		return 0;
   578	}
   579	#else
   580	#define damon_young_hugetlb_entry NULL
   581	#endif /* CONFIG_HUGETLB_PAGE */
   582	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
