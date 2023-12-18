Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6E842361;
	Mon, 18 Dec 2023 21:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DWvHkq7q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702935085; x=1734471085;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T0ebq3M+6nTEASPOxTbmsNuohChZajlQrKv+k3EERJ8=;
  b=DWvHkq7qnoU2PXjOP2o+RMr/uMP+IKmJL4O3wHhMnH+yZMuI81LDg+v5
   uB5kkiAQS0CInKqyickch+hu4xO2YI35bXSJVYo2vsIvAiI+zft+WN7Xg
   lfxS/xNLzdNboN87NK8zTYrSp4k5bUcCrSNWPNpscdi1YBL4PoijxUS3o
   o4lrztf6YAlKN2epkhAgXPWw+gim9wKX6tc0WX1cehJ+DB/hQ0aN2hzcS
   +b0lFlBqvbK9ZAwW8edxGCSlHpswhH6u1eWVg/OqQazhSjldQB7xYCIzq
   CHp0F+V2EDOJZYryA7tdQ2X08rvJNRKd8FnMD3V76SnYZoQfjlLhU0zwr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="459905549"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; 
   d="scan'208";a="459905549"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 13:31:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="804660238"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; 
   d="scan'208";a="804660238"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 18 Dec 2023 13:31:20 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFLCn-0004Xt-0L;
	Mon, 18 Dec 2023 21:31:17 +0000
Date: Tue, 19 Dec 2023 05:30:53 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kmo@daterainc.com>
Subject: [bcachefs:header_cleanup 44/49]
 arch/powerpc/kernel/interrupt.c:275:2: error: call to undeclared function
 'rseq_syscall'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202312190514.VSErOFgG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git header_cleanup
head:   0e034194a81f95ba6377786660a88f5403fcbf19
commit: 1b622ac62853a6a2053ea97898b55014e0c25ea0 [44/49] rseq: Split out rseq.h from sched.h
config: powerpc-tqm5200_defconfig (https://download.01.org/0day-ci/archive/20231219/202312190514.VSErOFgG-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231219/202312190514.VSErOFgG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312190514.VSErOFgG-lkp@intel.com/

All errors (new ones prefixed by >>):

   __do_insb
   ^
   arch/powerpc/include/asm/io.h:609:56: note: expanded from macro '__do_insb'
   #define __do_insb(p, b, n)      readsb((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/powerpc/kernel/interrupt.c:11:
   In file included from arch/powerpc/include/asm/interrupt.h:70:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:672:
   arch/powerpc/include/asm/io-defs.h:45:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insw, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:669:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:9:1: note: expanded from here
   __do_insw
   ^
   arch/powerpc/include/asm/io.h:610:56: note: expanded from macro '__do_insw'
   #define __do_insw(p, b, n)      readsw((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/powerpc/kernel/interrupt.c:11:
   In file included from arch/powerpc/include/asm/interrupt.h:70:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:672:
   arch/powerpc/include/asm/io-defs.h:47:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:669:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:11:1: note: expanded from here
   __do_insl
   ^
   arch/powerpc/include/asm/io.h:611:56: note: expanded from macro '__do_insl'
   #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/powerpc/kernel/interrupt.c:11:
   In file included from arch/powerpc/include/asm/interrupt.h:70:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:672:
   arch/powerpc/include/asm/io-defs.h:49:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:669:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:13:1: note: expanded from here
   __do_outsb
   ^
   arch/powerpc/include/asm/io.h:612:58: note: expanded from macro '__do_outsb'
   #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/powerpc/kernel/interrupt.c:11:
   In file included from arch/powerpc/include/asm/interrupt.h:70:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:672:
   arch/powerpc/include/asm/io-defs.h:51:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:669:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:15:1: note: expanded from here
   __do_outsw
   ^
   arch/powerpc/include/asm/io.h:613:58: note: expanded from macro '__do_outsw'
   #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/powerpc/kernel/interrupt.c:11:
   In file included from arch/powerpc/include/asm/interrupt.h:70:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:672:
   arch/powerpc/include/asm/io-defs.h:53:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:669:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:17:1: note: expanded from here
   __do_outsl
   ^
   arch/powerpc/include/asm/io.h:614:58: note: expanded from macro '__do_outsl'
   #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
>> arch/powerpc/kernel/interrupt.c:275:2: error: call to undeclared function 'rseq_syscall'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           rseq_syscall(regs);
           ^
   6 warnings and 1 error generated.


vim +/rseq_syscall +275 arch/powerpc/kernel/interrupt.c

6cc0c16d82f889 arch/powerpc/kernel/syscall_64.c Nicholas Piggin  2020-02-26  250  
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  251  /*
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  252   * This should be called after a syscall returns, with r3 the return value
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  253   * from the syscall. If this function returns non-zero, the system call
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  254   * exit assembly should additionally load all GPR registers and CTR and XER
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  255   * from the interrupt frame.
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  256   *
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  257   * The function graph tracer can not trace the return side of this function,
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  258   * because RI=0 and soft mask state is "unreconciled", so it is marked notrace.
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  259   */
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  260  notrace unsigned long syscall_exit_prepare(unsigned long r3,
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  261  					   struct pt_regs *regs,
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  262  					   long scv)
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  263  {
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  264  	unsigned long ti_flags;
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  265  	unsigned long ret = 0;
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  266  	bool is_not_scv = !IS_ENABLED(CONFIG_PPC_BOOK3S_64) || !scv;
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  267  
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  268  	CT_WARN_ON(ct_state() == CONTEXT_USER);
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  269  
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  270  	kuap_assert_locked();
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  271  
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  272  	regs->result = r3;
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  273  
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  274  	/* Check whether the syscall is issued inside a restartable sequence */
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18 @275  	rseq_syscall(regs);
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  276  
985faa78687de6 arch/powerpc/kernel/interrupt.c  Mark Rutland     2021-11-29  277  	ti_flags = read_thread_flags();
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  278  
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  279  	if (unlikely(r3 >= (unsigned long)-MAX_ERRNO) && is_not_scv) {
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  280  		if (likely(!(ti_flags & (_TIF_NOERROR | _TIF_RESTOREALL)))) {
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  281  			r3 = -r3;
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  282  			regs->ccr |= 0x10000000; /* Set SO bit in CR */
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  283  		}
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  284  	}
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  285  
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  286  	if (unlikely(ti_flags & _TIF_PERSYSCALL_MASK)) {
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  287  		if (ti_flags & _TIF_RESTOREALL)
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  288  			ret = _TIF_RESTOREALL;
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  289  		else
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  290  			regs->gpr[3] = r3;
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  291  		clear_bits(_TIF_PERSYSCALL_MASK, &current_thread_info()->flags);
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  292  	} else {
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  293  		regs->gpr[3] = r3;
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  294  	}
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  295  
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  296  	if (unlikely(ti_flags & _TIF_SYSCALL_DOTRACE)) {
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  297  		do_syscall_trace_leave(regs);
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  298  		ret |= _TIF_RESTOREALL;
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  299  	}
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  300  
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  301  	local_irq_disable();
f84aa284947f32 arch/powerpc/kernel/interrupt.c  Christophe Leroy 2021-06-18  302  	ret = interrupt_exit_user_prepare_main(ret, regs);
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  303  

:::::: The code at line 275 was first introduced by commit
:::::: 13799748b957bc5659f97c036224b0f4b42172e2 powerpc/64: use interrupt restart table to speed up return from interrupt

:::::: TO: Nicholas Piggin <npiggin@gmail.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
