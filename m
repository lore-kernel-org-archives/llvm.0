Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C35036C598;
	Mon, 29 Jun 2026 11:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782733495; cv=none; b=FeUYhbjsuGYP1yyF51bhkfmuH1xV7igPYDophpBPWhNyXdSKOt9V1KDY70HuWVYdQPRc33W2CwErZ12Fn73gya8IiPa2oDOo0Eb9sfYDUN2KMSLc0peBTg6iRNqdmIMRUl5FfkP10FlBfp8AIIF4fau5dCjrRVMDSPSGT3iis5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782733495; c=relaxed/simple;
	bh=YCo79FR63SB46/8lCUaYNtHCoprlN8Ok2dEtEtIT2s4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=D0HqBaAvyt9OfmM4f+pLls/KtYiCr4cwaoxe8DP11Efb0ZH7QhZ3UPig8CjHIFY8bG+jCLaN3cGaUfYddCdD6qnGmHwTgT4cWGUBl+v6vDdxnH/wdDn90toWDA34Wx5yOCDnYsJfSl/nKtOhQx4SznIC8ed6/hfKWL6ZtSPglWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G0hqR03g; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G0hqR03g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782733494; x=1814269494;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YCo79FR63SB46/8lCUaYNtHCoprlN8Ok2dEtEtIT2s4=;
  b=G0hqR03gFJJnpJqx3Qffb6qLHTt6McNmHxbH1Iuwdm6O7xLpL9KN0VKA
   JO1L8f8FK1fD74WZdiSMDRgURSuG/Xm7qb5IbSz1i8W+hwF6vbmfQFxqF
   ZzZAyLwFxNFp4lJ2/JZlPtKRP+hFKG1KQlCJCRL4dnJuvZpsy6VXo/b04
   iV+MYeZIkFHhoR4MkAC/Q5x1hl0OJvc8vVNVeXtp23+XHJRoIWUjT3ZpO
   +CnFoZ37a6uVKiaENWUUTVKTUzYJ/WZWpPbexqvViLBtqHVTpGCDnPsTx
   zWBH2+GKTFb1uuZPt1hEi3aI3+A3uaQaeXpr6+gSFRMoFiw7qWwV33SUW
   g==;
X-CSE-ConnectionGUID: NRgR3e+vROqnyhcvgULHqA==
X-CSE-MsgGUID: 5JYW1l7nTzmnmheKeKaxjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="83449881"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="83449881"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 04:44:51 -0700
X-CSE-ConnectionGUID: RG6QfoPdTICmRieuFUy+gg==
X-CSE-MsgGUID: AXelzUquQoW0/rt0w522mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="245575623"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 29 Jun 2026 04:44:42 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weAPo-000000007MD-0Q3X;
	Mon, 29 Jun 2026 11:44:40 +0000
Date: Mon, 29 Jun 2026 19:44:32 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/hrtimer-header-dependencies 6/11]
 arch/powerpc/include/asm/ptrace.h:376:20: error: use of undeclared identifier
 'THREAD_SIZE'
Message-ID: <202606291901.71u54RnN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/hrtimer-header-dependencies
head:   e7540d8e6298bea30315e7fd29f5da9400aa6e9b
commit: d24aaca1864c88c09969af091d9e73559f47f5dd [6/11] percpu
config: powerpc64-randconfig-001 (https://download.01.org/0day-ci/archive/20260629/202606291901.71u54RnN-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260629/202606291901.71u54RnN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606291901.71u54RnN-lkp@intel.com/

All errors (new ones prefixed by >>):

   WARN /zdci/src/lkp/lib/log.sh:131:in `log_warn': /opt/cross/rustc-1.96.0-bindgen-0.72.1 doesn't exist
     from /zdci/src/kernel-tests/lib/debug.sh:164: kbuild_log_warn
     from /zdci/src/kernel-tests/lib/kbuild.sh:3371: export_rust_path
     from /zdci/src/kernel-tests/lib/kbuild.sh:3361: export_compiler_path
     from /zdci/src/kernel-tests/lib/kbuild.sh:3840: invoke_make
     from /zdci/src/kernel-tests/lib/kbuild.sh:4022: make
     from /zdci/src/kernel-tests/common.sh:202: redirect_error_to_screen
     from /zdci/src/kernel-tests/common.sh:210: redirect_command_errors
     from /zdci/src/kernel-tests/lib/kbuild.sh:5680: make_prepare
     from /zdci/src/kernel-tests/lib/kbuild.sh:5909: test_kernel_build
     from /zdci/src/kernel-tests/lib/builder/base.sh:442: builder_execute_build
     from /zdci/src/kernel-tests/lib/kbuild.sh:6419: compile_one_config
     from /zdci/src/kernel-tests/lib/builder/base.sh:88: builder_compile
     from /zdci/src/kernel-tests/bisect-test-build-error.sh:101: main
   In file included from arch/powerpc/kernel/asm-offsets.c:13:
   In file included from include/linux/compat.h:14:
   In file included from include/linux/sem.h:5:
   In file included from include/uapi/linux/sem.h:5:
   In file included from include/linux/ipc.h:7:
   In file included from include/linux/rhashtable-types.h:12:
   In file included from include/linux/alloc_tag.h:11:
   In file included from include/linux/preempt.h:79:
   In file included from arch/powerpc/include/asm/preempt.h:5:
   In file included from include/asm-generic/preempt.h:5:
   In file included from include/linux/thread_info.h:23:
   In file included from arch/powerpc/include/asm/current.h:13:
   In file included from arch/powerpc/include/asm/paca.h:18:
   In file included from arch/powerpc/include/asm/mmu.h:398:
   In file included from arch/powerpc/include/asm/nohash/mmu.h:10:
   In file included from arch/powerpc/include/asm/nohash/mmu-e500.h:318:
   In file included from arch/powerpc/include/asm/percpu.h:28:
   In file included from include/asm-generic/percpu.h:8:
   In file included from include/linux/irqflags.h:18:
   In file included from arch/powerpc/include/asm/irqflags.h:12:
   In file included from arch/powerpc/include/asm/hw_irq.h:12:
>> arch/powerpc/include/asm/ptrace.h:376:20: error: use of undeclared identifier 'THREAD_SIZE'
     376 |         return ((addr & ~(THREAD_SIZE - 1))  ==
         |                           ^
   arch/powerpc/include/asm/ptrace.h:377:35: error: use of undeclared identifier 'THREAD_SIZE'
     377 |                 (kernel_stack_pointer(regs) & ~(THREAD_SIZE - 1)));
         |                                                 ^
   In file included from arch/powerpc/kernel/asm-offsets.c:13:
   In file included from include/linux/compat.h:14:
   In file included from include/linux/sem.h:5:
   In file included from include/uapi/linux/sem.h:5:
   In file included from include/linux/ipc.h:7:
   In file included from include/linux/rhashtable-types.h:12:
   In file included from include/linux/alloc_tag.h:11:
   In file included from include/linux/preempt.h:79:
   In file included from arch/powerpc/include/asm/preempt.h:5:
   In file included from include/asm-generic/preempt.h:5:
   In file included from include/linux/thread_info.h:23:
   In file included from arch/powerpc/include/asm/current.h:13:
   In file included from arch/powerpc/include/asm/paca.h:18:
   In file included from arch/powerpc/include/asm/mmu.h:398:
   In file included from arch/powerpc/include/asm/nohash/mmu.h:10:
   In file included from arch/powerpc/include/asm/nohash/mmu-e500.h:318:
   In file included from arch/powerpc/include/asm/percpu.h:28:
   In file included from include/asm-generic/percpu.h:8:
   In file included from include/linux/irqflags.h:18:
   In file included from arch/powerpc/include/asm/irqflags.h:12:
>> arch/powerpc/include/asm/hw_irq.h:123:10: error: offsetof of incomplete type 'struct paca_struct'
     123 |                 : "i" (offsetof(struct paca_struct, irq_soft_mask)));
         |                        ^        ~~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^                  ~~~~
   arch/powerpc/include/asm/hw_irq.h:123:26: note: forward declaration of 'struct paca_struct'
     123 |                 : "i" (offsetof(struct paca_struct, irq_soft_mask)));
         |                                        ^
   arch/powerpc/include/asm/hw_irq.h:156:10: error: offsetof of incomplete type 'struct paca_struct'
     156 |                   "i" (offsetof(struct paca_struct, irq_soft_mask))
         |                        ^        ~~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^                  ~~~~
   arch/powerpc/include/asm/hw_irq.h:156:26: note: forward declaration of 'struct paca_struct'
     156 |                   "i" (offsetof(struct paca_struct, irq_soft_mask))
         |                                        ^
>> arch/powerpc/include/asm/hw_irq.h:228:2: error: call to undeclared function 'get_paca'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     228 |         get_paca()->irq_happened |= PACA_IRQ_PMI;
         |         ^
>> arch/powerpc/include/asm/hw_irq.h:228:14: error: member reference type 'int' is not a pointer
     228 |         get_paca()->irq_happened |= PACA_IRQ_PMI;
         |         ~~~~~~~~~~  ^
   arch/powerpc/include/asm/hw_irq.h:240:2: error: call to undeclared function 'get_paca'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     240 |         get_paca()->irq_happened &= ~PACA_IRQ_PMI;
         |         ^
   arch/powerpc/include/asm/hw_irq.h:240:14: error: member reference type 'int' is not a pointer
     240 |         get_paca()->irq_happened &= ~PACA_IRQ_PMI;
         |         ~~~~~~~~~~  ^
   arch/powerpc/include/asm/hw_irq.h:249:6: error: call to undeclared function 'get_paca'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     249 |         if (get_paca()->irq_happened & PACA_IRQ_PMI)
         |             ^
   arch/powerpc/include/asm/hw_irq.h:249:18: error: member reference type 'int' is not a pointer
     249 |         if (get_paca()->irq_happened & PACA_IRQ_PMI)
         |             ~~~~~~~~~~  ^
   arch/powerpc/include/asm/hw_irq.h:323:28: error: call to undeclared function 'get_paca'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     323 |         return __lazy_irq_pending(get_paca()->irq_happened);
         |                                   ^
   arch/powerpc/include/asm/hw_irq.h:323:40: error: member reference type 'int' is not a pointer
     323 |         return __lazy_irq_pending(get_paca()->irq_happened);
         |                                   ~~~~~~~~~~  ^
>> arch/powerpc/include/asm/hw_irq.h:333:28: error: use of undeclared identifier 'local_paca'
     333 |         return __lazy_irq_pending(local_paca->irq_happened);
         |                                   ^
   arch/powerpc/include/asm/hw_irq.h:349:13: error: call to undeclared function 'get_paca'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     349 |                 WARN_ON(!(get_paca()->irq_happened & PACA_IRQ_HARD_DIS));
         |                           ^
   arch/powerpc/include/asm/hw_irq.h:349:25: error: member reference type 'int' is not a pointer
     349 |                 WARN_ON(!(get_paca()->irq_happened & PACA_IRQ_HARD_DIS));
         |                           ~~~~~~~~~~  ^
   arch/powerpc/include/asm/bug.h:88:25: note: expanded from macro 'WARN_ON'
      88 |         int __ret_warn_on = !!(x);                              \
         |                                ^
   In file included from arch/powerpc/kernel/asm-offsets.c:13:
   In file included from include/linux/compat.h:14:
   In file included from include/linux/sem.h:5:
   In file included from include/uapi/linux/sem.h:5:
   In file included from include/linux/ipc.h:7:
   In file included from include/linux/rhashtable-types.h:12:
   In file included from include/linux/alloc_tag.h:11:
   In file included from include/linux/preempt.h:79:
   In file included from arch/powerpc/include/asm/preempt.h:5:
   In file included from include/asm-generic/preempt.h:5:
   In file included from include/linux/thread_info.h:23:
   In file included from arch/powerpc/include/asm/current.h:13:
   In file included from arch/powerpc/include/asm/paca.h:18:
   In file included from arch/powerpc/include/asm/mmu.h:398:
   In file included from arch/powerpc/include/asm/nohash/mmu.h:10:
   In file included from arch/powerpc/include/asm/nohash/mmu-e500.h:318:
   In file included from arch/powerpc/include/asm/percpu.h:28:
   In file included from include/asm-generic/percpu.h:8:
   In file included from include/linux/irqflags.h:18:
   In file included from arch/powerpc/include/asm/irqflags.h:12:
   arch/powerpc/include/asm/hw_irq.h:374:6: error: call to undeclared function 'get_paca'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     374 |         if (get_paca()->irq_happened & PACA_IRQ_MUST_HARD_MASK)
         |             ^
   arch/powerpc/include/asm/hw_irq.h:374:18: error: member reference type 'int' is not a pointer
     374 |         if (get_paca()->irq_happened & PACA_IRQ_MUST_HARD_MASK)
         |             ~~~~~~~~~~  ^
   arch/powerpc/include/asm/hw_irq.h:392:2: error: call to undeclared function 'get_paca'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     392 |         get_paca()->irq_happened &= ~PACA_IRQ_HARD_DIS;
         |         ^
   arch/powerpc/include/asm/hw_irq.h:392:14: error: member reference type 'int' is not a pointer
     392 |         get_paca()->irq_happened &= ~PACA_IRQ_HARD_DIS;
         |         ~~~~~~~~~~  ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
   make[3]: *** [scripts/Makefile.build:184: arch/powerpc/kernel/asm-offsets.s] Error 1 shuffle=1756506566
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1405: prepare0] Error 2 shuffle=1756506566
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=1756506566
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=1756506566
   make: Target 'prepare' not remade because of errors.


vim +/THREAD_SIZE +376 arch/powerpc/include/asm/ptrace.h

359e4284a3f37a Mahesh Salgaonkar 2010-04-07  363  
359e4284a3f37a Mahesh Salgaonkar 2010-04-07  364  /**
359e4284a3f37a Mahesh Salgaonkar 2010-04-07  365   * regs_within_kernel_stack() - check the address in the stack
359e4284a3f37a Mahesh Salgaonkar 2010-04-07  366   * @regs:      pt_regs which contains kernel stack pointer.
359e4284a3f37a Mahesh Salgaonkar 2010-04-07  367   * @addr:      address which is checked.
359e4284a3f37a Mahesh Salgaonkar 2010-04-07  368   *
359e4284a3f37a Mahesh Salgaonkar 2010-04-07  369   * regs_within_kernel_stack() checks @addr is within the kernel stack page(s).
359e4284a3f37a Mahesh Salgaonkar 2010-04-07  370   * If @addr is within the kernel stack, it returns true. If not, returns false.
359e4284a3f37a Mahesh Salgaonkar 2010-04-07  371   */
359e4284a3f37a Mahesh Salgaonkar 2010-04-07  372  
359e4284a3f37a Mahesh Salgaonkar 2010-04-07  373  static inline bool regs_within_kernel_stack(struct pt_regs *regs,
359e4284a3f37a Mahesh Salgaonkar 2010-04-07  374  						unsigned long addr)
359e4284a3f37a Mahesh Salgaonkar 2010-04-07  375  {
359e4284a3f37a Mahesh Salgaonkar 2010-04-07 @376  	return ((addr & ~(THREAD_SIZE - 1))  ==
359e4284a3f37a Mahesh Salgaonkar 2010-04-07  377  		(kernel_stack_pointer(regs) & ~(THREAD_SIZE - 1)));
359e4284a3f37a Mahesh Salgaonkar 2010-04-07  378  }
359e4284a3f37a Mahesh Salgaonkar 2010-04-07  379  

:::::: The code at line 376 was first introduced by commit
:::::: 359e4284a3f37aba7fd06d993863de2509d86f54 powerpc: Add kprobe-based event tracer

:::::: TO: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>
:::::: CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
