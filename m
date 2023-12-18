Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41D08470;
	Mon, 18 Dec 2023 18:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IWdh2Qv2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702924360; x=1734460360;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9LXLs53ZO/hdu3REij6BOjNsJuzfTFrKLjP+tibiCsk=;
  b=IWdh2Qv2lV+mpy3t95hp6KQi04750ozeoHAvMdY4EWY40AChlAz3/BSM
   JCeLRMPZgoPs5J9hzM63WQRPpb1embzwrMCQ1bTCitdt195gd+DBk4NxZ
   BWLPzPCAneZ4KQRsI2qDQir22R9eDGBqiugfYiOJsX7UbrysuLkH95qYJ
   IGA4X4wBsC8WjZZJGUs/sURo9mfw5eSOIBZr5DRNlrr9DyRXrDeGXlgcy
   hkRkNEN5yYpgW0sDIfRWk7hSue5Y7vmPhfOYTnjl0WcwJJbR7H5TjMlkD
   BwWdLeJRRRkosN1+cz3fVmCc2APUQMkSNib2XVHCrt/XL9XnvClRJeATn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="8997107"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; 
   d="scan'208";a="8997107"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 10:32:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="841574672"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; 
   d="scan'208";a="841574672"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 18 Dec 2023 10:32:37 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFIPq-0004Qd-1f;
	Mon, 18 Dec 2023 18:32:34 +0000
Date: Tue, 19 Dec 2023 02:31:54 +0800
From: kernel test robot <lkp@intel.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linus Walleij <linus.walleij@linaro.org>,
	Kees Cook <keescook@chromium.org>
Subject: [arm-integrator:b4/arm32-lpae-pan 7/7] arch/arm/mm/fault.c:286:62:
 error: call to undeclared function 'uaccess_disabled'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202312190216.MoaEEHEJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/arm32-lpae-pan
head:   0c333c0e63067147be55c63597ddae4cecfe7927
commit: 0c333c0e63067147be55c63597ddae4cecfe7927 [7/7] ARM: Implement privileged no-access using TTBR0 page table walks disabling
config: arm-milbeaut_m10v_defconfig (https://download.01.org/0day-ci/archive/20231219/202312190216.MoaEEHEJ-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231219/202312190216.MoaEEHEJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312190216.MoaEEHEJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm/mm/fault.c:286:62: error: call to undeclared function 'uaccess_disabled'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           if (IS_ENABLED(CONFIG_CPU_TTBR0_PAN) && !user_mode(regs) && uaccess_disabled(regs))
                                                                       ^
   1 error generated.


vim +/uaccess_disabled +286 arch/arm/mm/fault.c

   237	
   238	static int __kprobes
   239	do_page_fault(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
   240	{
   241		struct mm_struct *mm = current->mm;
   242		struct vm_area_struct *vma;
   243		int sig, code;
   244		vm_fault_t fault;
   245		unsigned int flags = FAULT_FLAG_DEFAULT;
   246		unsigned long vm_flags = VM_ACCESS_FLAGS;
   247	
   248		if (kprobe_page_fault(regs, fsr))
   249			return 0;
   250	
   251	
   252		/* Enable interrupts if they were enabled in the parent context. */
   253		if (interrupts_enabled(regs))
   254			local_irq_enable();
   255	
   256		/*
   257		 * If we're in an interrupt or have no user
   258		 * context, we must not take the fault..
   259		 */
   260		if (faulthandler_disabled() || !mm)
   261			goto no_context;
   262	
   263		if (user_mode(regs))
   264			flags |= FAULT_FLAG_USER;
   265	
   266		if (is_write_fault(fsr)) {
   267			flags |= FAULT_FLAG_WRITE;
   268			vm_flags = VM_WRITE;
   269		}
   270	
   271		if (fsr & FSR_LNX_PF) {
   272			vm_flags = VM_EXEC;
   273	
   274			if (is_permission_fault(fsr) && !user_mode(regs))
   275				die_kernel_fault("execution of memory",
   276						 mm, addr, fsr, regs);
   277		}
   278	
   279		perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, addr);
   280	
   281		/*
   282		 * Privileged access aborts with CONFIG_CPU_TTBR0_PAN enabled are
   283		 * routed via the translation fault mechanism. Check whether uaccess
   284		 * is disabled while in kernel mode.
   285		 */
 > 286		if (IS_ENABLED(CONFIG_CPU_TTBR0_PAN) && !user_mode(regs) && uaccess_disabled(regs))
   287			goto no_context;
   288	
   289	retry:
   290		vma = lock_mm_and_find_vma(mm, addr, regs);
   291		if (unlikely(!vma)) {
   292			fault = VM_FAULT_BADMAP;
   293			goto bad_area;
   294		}
   295	
   296		/*
   297		 * ok, we have a good vm_area for this memory access, check the
   298		 * permissions on the VMA allow for the fault which occurred.
   299		 */
   300		if (!(vma->vm_flags & vm_flags))
   301			fault = VM_FAULT_BADACCESS;
   302		else
   303			fault = handle_mm_fault(vma, addr & PAGE_MASK, flags, regs);
   304	
   305		/* If we need to retry but a fatal signal is pending, handle the
   306		 * signal first. We do not need to release the mmap_lock because
   307		 * it would already be released in __lock_page_or_retry in
   308		 * mm/filemap.c. */
   309		if (fault_signal_pending(fault, regs)) {
   310			if (!user_mode(regs))
   311				goto no_context;
   312			return 0;
   313		}
   314	
   315		/* The fault is fully completed (including releasing mmap lock) */
   316		if (fault & VM_FAULT_COMPLETED)
   317			return 0;
   318	
   319		if (!(fault & VM_FAULT_ERROR)) {
   320			if (fault & VM_FAULT_RETRY) {
   321				flags |= FAULT_FLAG_TRIED;
   322				goto retry;
   323			}
   324		}
   325	
   326		mmap_read_unlock(mm);
   327	
   328		/*
   329		 * Handle the "normal" case first - VM_FAULT_MAJOR
   330		 */
   331		if (likely(!(fault & (VM_FAULT_ERROR | VM_FAULT_BADMAP | VM_FAULT_BADACCESS))))
   332			return 0;
   333	
   334	bad_area:
   335		/*
   336		 * If we are in kernel mode at this point, we
   337		 * have no context to handle this fault with.
   338		 */
   339		if (!user_mode(regs))
   340			goto no_context;
   341	
   342		if (fault & VM_FAULT_OOM) {
   343			/*
   344			 * We ran out of memory, call the OOM killer, and return to
   345			 * userspace (which will retry the fault, or kill us if we
   346			 * got oom-killed)
   347			 */
   348			pagefault_out_of_memory();
   349			return 0;
   350		}
   351	
   352		if (fault & VM_FAULT_SIGBUS) {
   353			/*
   354			 * We had some memory, but were unable to
   355			 * successfully fix up this page fault.
   356			 */
   357			sig = SIGBUS;
   358			code = BUS_ADRERR;
   359		} else {
   360			/*
   361			 * Something tried to access memory that
   362			 * isn't in our memory map..
   363			 */
   364			sig = SIGSEGV;
   365			code = fault == VM_FAULT_BADACCESS ?
   366				SEGV_ACCERR : SEGV_MAPERR;
   367		}
   368	
   369		__do_user_fault(addr, fsr, sig, code, regs);
   370		return 0;
   371	
   372	no_context:
   373		__do_kernel_fault(mm, addr, fsr, regs);
   374		return 0;
   375	}
   376	#else					/* CONFIG_MMU */
   377	static int
   378	do_page_fault(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
   379	{
   380		return 0;
   381	}
   382	#endif					/* CONFIG_MMU */
   383	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
