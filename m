Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AD25258;
	Tue,  4 Jul 2023 09:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688463588; x=1719999588;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cGoilicKKWCzNGAv5TP2RtXi6HPdPHNsSxlwkHoVaQo=;
  b=A+8dGOOyCQVvwco+MnhOgWvN50WPVu4+pK5AE9NcK13K6/AVYV+kxeW+
   E0Xiodg5G4+XGfzYmADCiB2+BXKazwYanMP4kqsEZrH1w6vSBUDUOnM36
   DNBeuX2nuo/QPDwLuOSrEFLS9JKextT6aUi7MNTZsXSd9bFU7v5PCiTqa
   w/ZMSwuotk28exjsB87AMUQCbrf/saHvn2LBgWzofoyEr7NDznxtyvA/s
   MzB7gTaaWLCmSzwkP4Jhlyf6mqMP1UKrQmEDr5oRzDtJqiIYXfJMRPmMy
   xbI9dav2R6ndJXClaSNAXUWY/QuzzWgBSDCJzOxsBslhOWKLfeENBgVnc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="393828293"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="393828293"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2023 02:39:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="788801761"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="788801761"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 04 Jul 2023 02:39:45 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGcVc-000IAd-0a;
	Tue, 04 Jul 2023 09:39:44 +0000
Date: Tue, 4 Jul 2023 17:38:58 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 13019/13166] arch/arm64/mm/fault.c:624:2: error:
 use of undeclared identifier 'vma'
Message-ID: <202307041730.YLC0ZwhK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Suren,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1c6f93977947dbba1fc4d250c4eb8a7d4cfdecf1
commit: 1e72a0774792199f0a39d6f2c1dc1cfa32fcffcd [13019/13166] mm: disable CONFIG_PER_VMA_LOCK by default until its fixed
config: arm64-randconfig-r023-20230703 (https://download.01.org/0day-ci/archive/20230704/202307041730.YLC0ZwhK-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230704/202307041730.YLC0ZwhK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307041730.YLC0ZwhK-lkp@intel.com/

Note: the linux-next/master HEAD 1c6f93977947dbba1fc4d250c4eb8a7d4cfdecf1 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> arch/arm64/mm/fault.c:624:2: error: use of undeclared identifier 'vma'
     624 |         vma = lock_mm_and_find_vma(mm, addr, regs);
         |         ^
   arch/arm64/mm/fault.c:625:16: error: use of undeclared identifier 'vma'; did you mean 'vmap'?
     625 |         if (unlikely(!vma)) {
         |                       ^~~
         |                       vmap
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/vmalloc.h:164:14: note: 'vmap' declared here
     164 | extern void *vmap(struct page **pages, unsigned int count,
         |              ^
   arch/arm64/mm/fault.c:625:16: warning: address of function 'vmap' will always evaluate to 'true' [-Wpointer-bool-conversion]
     625 |         if (unlikely(!vma)) {
         |                      ~^~~
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   arch/arm64/mm/fault.c:625:16: note: prefix with the address-of operator to silence this warning
     625 |         if (unlikely(!vma)) {
         |                       ^
         |                       &
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   arch/arm64/mm/fault.c:630:30: error: use of undeclared identifier 'vma'; did you mean 'vmap'?
     630 |         fault = __do_page_fault(mm, vma, addr, mm_flags, vm_flags, regs);
         |                                     ^~~
         |                                     vmap
   include/linux/vmalloc.h:164:14: note: 'vmap' declared here
     164 | extern void *vmap(struct page **pages, unsigned int count,
         |              ^
   1 warning and 3 errors generated.


vim +/vma +624 arch/arm64/mm/fault.c

ae870a68b5d13d Linus Torvalds      2023-06-15  622  
1d18c47c735e8a Catalin Marinas     2012-03-05  623  retry:
ae870a68b5d13d Linus Torvalds      2023-06-15 @624  	vma = lock_mm_and_find_vma(mm, addr, regs);
ae870a68b5d13d Linus Torvalds      2023-06-15  625  	if (unlikely(!vma)) {
ae870a68b5d13d Linus Torvalds      2023-06-15  626  		fault = VM_FAULT_BADMAP;
ae870a68b5d13d Linus Torvalds      2023-06-15  627  		goto done;
1d18c47c735e8a Catalin Marinas     2012-03-05  628  	}
1d18c47c735e8a Catalin Marinas     2012-03-05  629  
ae870a68b5d13d Linus Torvalds      2023-06-15  630  	fault = __do_page_fault(mm, vma, addr, mm_flags, vm_flags, regs);
1d18c47c735e8a Catalin Marinas     2012-03-05  631  
b502f038f2ffc9 Peter Xu            2020-04-01  632  	/* Quick path to respond to signals */
b502f038f2ffc9 Peter Xu            2020-04-01  633  	if (fault_signal_pending(fault, regs)) {
289d07a2dc6c6b Mark Rutland        2017-07-11  634  		if (!user_mode(regs))
289d07a2dc6c6b Mark Rutland        2017-07-11  635  			goto no_context;
1d18c47c735e8a Catalin Marinas     2012-03-05  636  		return 0;
289d07a2dc6c6b Mark Rutland        2017-07-11  637  	}
1d18c47c735e8a Catalin Marinas     2012-03-05  638  
d92725256b4f22 Peter Xu            2022-05-30  639  	/* The fault is fully completed (including releasing mmap lock) */
d92725256b4f22 Peter Xu            2022-05-30  640  	if (fault & VM_FAULT_COMPLETED)
d92725256b4f22 Peter Xu            2022-05-30  641  		return 0;
d92725256b4f22 Peter Xu            2022-05-30  642  
b502f038f2ffc9 Peter Xu            2020-04-01  643  	if (fault & VM_FAULT_RETRY) {
569ba74a7ba69f Mark Salyzyn        2015-09-21  644  		mm_flags |= FAULT_FLAG_TRIED;
1d18c47c735e8a Catalin Marinas     2012-03-05  645  		goto retry;
1d18c47c735e8a Catalin Marinas     2012-03-05  646  	}
d8ed45c5dcd455 Michel Lespinasse   2020-06-08  647  	mmap_read_unlock(mm);
1d18c47c735e8a Catalin Marinas     2012-03-05  648  
cd7f176aea5f59 Suren Baghdasaryan  2023-02-27  649  done:
1d18c47c735e8a Catalin Marinas     2012-03-05  650  	/*
0e3a9026396cd7 Punit Agrawal       2017-06-08  651  	 * Handle the "normal" (no error) case first.
1d18c47c735e8a Catalin Marinas     2012-03-05  652  	 */
1d18c47c735e8a Catalin Marinas     2012-03-05  653  	if (likely(!(fault & (VM_FAULT_ERROR | VM_FAULT_BADMAP |
6a1bb025d28e10 Peter Xu            2020-08-11  654  			      VM_FAULT_BADACCESS))))
1d18c47c735e8a Catalin Marinas     2012-03-05  655  		return 0;
1d18c47c735e8a Catalin Marinas     2012-03-05  656  
871341023c771a Johannes Weiner     2013-09-12  657  	/*
871341023c771a Johannes Weiner     2013-09-12  658  	 * If we are in kernel mode at this point, we have no context to
871341023c771a Johannes Weiner     2013-09-12  659  	 * handle this fault with.
871341023c771a Johannes Weiner     2013-09-12  660  	 */
871341023c771a Johannes Weiner     2013-09-12  661  	if (!user_mode(regs))
871341023c771a Johannes Weiner     2013-09-12  662  		goto no_context;
871341023c771a Johannes Weiner     2013-09-12  663  
1d18c47c735e8a Catalin Marinas     2012-03-05  664  	if (fault & VM_FAULT_OOM) {
1d18c47c735e8a Catalin Marinas     2012-03-05  665  		/*
1d18c47c735e8a Catalin Marinas     2012-03-05  666  		 * We ran out of memory, call the OOM killer, and return to
1d18c47c735e8a Catalin Marinas     2012-03-05  667  		 * userspace (which will retry the fault, or kill us if we got
1d18c47c735e8a Catalin Marinas     2012-03-05  668  		 * oom-killed).
1d18c47c735e8a Catalin Marinas     2012-03-05  669  		 */
1d18c47c735e8a Catalin Marinas     2012-03-05  670  		pagefault_out_of_memory();
1d18c47c735e8a Catalin Marinas     2012-03-05  671  		return 0;
1d18c47c735e8a Catalin Marinas     2012-03-05  672  	}
1d18c47c735e8a Catalin Marinas     2012-03-05  673  
2d2837fab5fada Eric W. Biederman   2018-09-22  674  	inf = esr_to_fault_info(esr);
559d8d91a89cc2 Eric W. Biederman   2018-09-22  675  	set_thread_esr(addr, esr);
1d18c47c735e8a Catalin Marinas     2012-03-05  676  	if (fault & VM_FAULT_SIGBUS) {
1d18c47c735e8a Catalin Marinas     2012-03-05  677  		/*
1d18c47c735e8a Catalin Marinas     2012-03-05  678  		 * We had some memory, but were unable to successfully fix up
1d18c47c735e8a Catalin Marinas     2012-03-05  679  		 * this page fault.
1d18c47c735e8a Catalin Marinas     2012-03-05  680  		 */
dceec3ff780767 Peter Collingbourne 2020-11-20  681  		arm64_force_sig_fault(SIGBUS, BUS_ADRERR, far, inf->name);
9ea3a9743cac4f Eric W. Biederman   2018-09-22  682  	} else if (fault & (VM_FAULT_HWPOISON_LARGE | VM_FAULT_HWPOISON)) {
9ea3a9743cac4f Eric W. Biederman   2018-09-22  683  		unsigned int lsb;
9ea3a9743cac4f Eric W. Biederman   2018-09-22  684  
9ea3a9743cac4f Eric W. Biederman   2018-09-22  685  		lsb = PAGE_SHIFT;
9ea3a9743cac4f Eric W. Biederman   2018-09-22  686  		if (fault & VM_FAULT_HWPOISON_LARGE)
9ea3a9743cac4f Eric W. Biederman   2018-09-22  687  			lsb = hstate_index_to_shift(VM_FAULT_GET_HINDEX(fault));
92ff0674f5d801 Will Deacon         2018-02-20  688  
dceec3ff780767 Peter Collingbourne 2020-11-20  689  		arm64_force_sig_mceerr(BUS_MCEERR_AR, far, lsb, inf->name);
1d18c47c735e8a Catalin Marinas     2012-03-05  690  	} else {
1d18c47c735e8a Catalin Marinas     2012-03-05  691  		/*
1d18c47c735e8a Catalin Marinas     2012-03-05  692  		 * Something tried to access memory that isn't in our memory
1d18c47c735e8a Catalin Marinas     2012-03-05  693  		 * map.
1d18c47c735e8a Catalin Marinas     2012-03-05  694  		 */
feca355b3d8eba Eric W. Biederman   2018-09-22  695  		arm64_force_sig_fault(SIGSEGV,
feca355b3d8eba Eric W. Biederman   2018-09-22  696  				      fault == VM_FAULT_BADACCESS ? SEGV_ACCERR : SEGV_MAPERR,
dceec3ff780767 Peter Collingbourne 2020-11-20  697  				      far, inf->name);
1d18c47c735e8a Catalin Marinas     2012-03-05  698  	}
1d18c47c735e8a Catalin Marinas     2012-03-05  699  
1d18c47c735e8a Catalin Marinas     2012-03-05  700  	return 0;
1d18c47c735e8a Catalin Marinas     2012-03-05  701  
1d18c47c735e8a Catalin Marinas     2012-03-05  702  no_context:
67ce16ec15ce9d Kristina Martsenko  2017-06-09  703  	__do_kernel_fault(addr, esr, regs);
1d18c47c735e8a Catalin Marinas     2012-03-05  704  	return 0;
1d18c47c735e8a Catalin Marinas     2012-03-05  705  }
1d18c47c735e8a Catalin Marinas     2012-03-05  706  

:::::: The code at line 624 was first introduced by commit
:::::: ae870a68b5d13d67cf4f18d47bb01ee3fee40acb arm64/mm: Convert to using lock_mm_and_find_vma()

:::::: TO: Linus Torvalds <torvalds@linux-foundation.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
