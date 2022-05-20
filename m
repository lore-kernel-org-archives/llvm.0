Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BFB15A2
	for <llvm@lists.linux.dev>; Fri, 20 May 2022 00:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653006053; x=1684542053;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=98iWXTy+7QEmlwum/A3orH9QjkbQGJL5U60eOWEOWzA=;
  b=QbOUMGJjRDIUPlQJLLGYzYJUNtUGbyhDJSCWAhNt+06m7on4SKklAfXF
   pAr6kYxbbcmN1tXZiPjY/w0VhPeAamXWdxAT94iTjgbjCqxjWeyGL05Nx
   7h+RrK3NJ9ljGfFXBxqein9emYKLEEAA4CPrj0Mrq5X/Yt1hhtbhK52ls
   c5g1nNpFn6IP11M/kInb31yOl+yC32AbLlQoYnBsmCJiuCRUTmGkU61Cp
   17Hh3Z78XR8CFF+lBmOXutpNrMGgMWIz1QiLfyW+tbVN3XkibpKV6UyNl
   cW52nKYixGUTq5IgyXyktrkbipNQnZyWMRbxh9am4ZcF4KYs9Z3IDaQtR
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10352"; a="272394409"
X-IronPort-AV: E=Sophos;i="5.91,238,1647327600"; 
   d="scan'208";a="272394409"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2022 17:20:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,238,1647327600"; 
   d="scan'208";a="899038195"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 19 May 2022 17:20:48 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nrqNs-000456-2e;
	Fri, 20 May 2022 00:20:48 +0000
Date: Fri, 20 May 2022 08:20:31 +0800
From: kernel test robot <lkp@intel.com>
To: Chih-En Lin <shiyn.lin@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH 4/6] mm: Add COW PTE fallback function
Message-ID: <202205200816.ZhOASVVs-lkp@intel.com>
References: <20220519183127.3909598-5-shiyn.lin@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220519183127.3909598-5-shiyn.lin@gmail.com>

Hi Chih-En,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on tip/sched/core]
[also build test ERROR on soc/for-next linus/master v5.18-rc7 next-20220519]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Chih-En-Lin/Introduce-Copy-On-Write-to-Page-Table/20220520-023243
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git 734387ec2f9d77b00276042b1fa7c95f48ee879d
config: arm-shannon_defconfig (https://download.01.org/0day-ci/archive/20220520/202205200816.ZhOASVVs-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e00cbbec06c08dc616a0d52a20f678b8fbd4e304)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/e4e2e178c5a43b37925972bc0eab9976d41d35c7
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Chih-En-Lin/Introduce-Copy-On-Write-to-Page-Table/20220520-023243
        git checkout e4e2e178c5a43b37925972bc0eab9976d41d35c7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   mm/memory.c:1007:9: warning: variable 'orig_ptep' set but not used [-Wunused-but-set-variable]
           pte_t *orig_ptep, *ptep;
                  ^
>> mm/memory.c:4616:8: error: call to undeclared function 'pmd_mkwrite'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           new = pmd_mkwrite(*pmd);
                 ^
>> mm/memory.c:4617:2: error: call to undeclared function 'set_pmd_at'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           set_pmd_at(mm, addr, pmd, new);
           ^
   mm/memory.c:4617:2: note: did you mean 'set_pte_at'?
   arch/arm/include/asm/pgtable.h:225:6: note: 'set_pte_at' declared here
   void set_pte_at(struct mm_struct *mm, unsigned long addr,
        ^
   mm/memory.c:4592:6: warning: no previous prototype for function 'cow_pte_fallback' [-Wmissing-prototypes]
   void cow_pte_fallback(struct vm_area_struct *vma, pmd_t *pmd,
        ^
   mm/memory.c:4592:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void cow_pte_fallback(struct vm_area_struct *vma, pmd_t *pmd,
   ^
   static 
   2 warnings and 2 errors generated.


vim +/pmd_mkwrite +4616 mm/memory.c

  4584	
  4585	/* COW PTE fallback to normal PTE:
  4586	 * - two state here
  4587	 *   - After break child :   [parent, rss=1, ref=1, write=NO , owner=parent]
  4588	 *                        to [parent, rss=1, ref=1, write=YES, owner=NULL  ]
  4589	 *   - After break parent:   [child , rss=0, ref=1, write=NO , owner=NULL  ]
  4590	 *                        to [child , rss=1, ref=1, write=YES, owner=NULL  ]
  4591	 */
  4592	void cow_pte_fallback(struct vm_area_struct *vma, pmd_t *pmd,
  4593			unsigned long addr)
  4594	{
  4595		struct mm_struct *mm = vma->vm_mm;
  4596		unsigned long start, end;
  4597		pmd_t new;
  4598	
  4599		BUG_ON(pmd_write(*pmd));
  4600	
  4601		start = addr & PMD_MASK;
  4602		end = (addr + PMD_SIZE) & PMD_MASK;
  4603	
  4604		/* If pmd is not owner, it needs to increase the rss.
  4605		 * Since only the owner has the RSS state for the COW PTE.
  4606		 */
  4607		if (!cow_pte_owner_is_same(pmd, pmd)) {
  4608			cow_pte_rss(mm, vma, pmd, start, end, true /* inc */);
  4609			mm_inc_nr_ptes(mm);
  4610			smp_wmb();
  4611			pmd_populate(mm, pmd, pmd_page(*pmd));
  4612		}
  4613	
  4614		/* Reuse the pte page */
  4615		set_cow_pte_owner(pmd, NULL);
> 4616		new = pmd_mkwrite(*pmd);
> 4617		set_pmd_at(mm, addr, pmd, new);
  4618	
  4619		BUG_ON(!pmd_write(*pmd));
  4620		BUG_ON(pmd_page(*pmd)->cow_pte_owner);
  4621	}
  4622	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
