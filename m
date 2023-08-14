Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA4ADDB7;
	Mon, 14 Aug 2023 21:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692047197; x=1723583197;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iCAM5WAlM+uX3YGhKqt/g3tXabqXXOAyhD2ZvQBHxyQ=;
  b=ayK90qs33Q/5+JiKhWgnIG4qSFJP246VeJjjMiulH1JjU9q8Udr8+1mc
   c5NpZsnnS8tbxCN+0SjdktDucv0MuLkWWh78Ory1A/muIynE5Bt9qrIQl
   UMufSJciYcdqa6Wm9l2bgM7OPbOKNhwyK4bC3isDHB5qqp2Zgsrq0ScPp
   ecBAycYWVvBkn0ApspC2Yt+vpY2C/k4eyBX7dgrCTtyS7N7vRa4XgJdVB
   YFMvjJCH7qTY2UPZgUFoyb53Z/k/m4P9LYh/iZFdt3pNIXU7y3rQ1FGTU
   ArZyn/NQ9QL8+zA/y19FbrB6cg7v2E8ZjsC8l8n23Io3am5yWTPyGg+os
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="374909106"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="374909106"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 14:06:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="803590961"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="803590961"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 14 Aug 2023 14:06:35 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVelm-0000Pz-0Y;
	Mon, 14 Aug 2023 21:06:34 +0000
Date: Tue, 15 Aug 2023 05:06:03 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [arm:for-next 4/4] arch/arm/vfp/vfpmodule.c:324:13: error: static
 declaration of 'VFP_bounce' follows non-static declaration
Message-ID: <202308150547.m54XHV12-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git for-next
head:   f493fedcc3016e46ecbf7ab9490ba4762723efab
commit: f493fedcc3016e46ecbf7ab9490ba4762723efab [4/4] Merge branch 'devel-stable' into for-next
config: arm-milbeaut_m10v_defconfig (https://download.01.org/0day-ci/archive/20230815/202308150547.m54XHV12-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230815/202308150547.m54XHV12-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308150547.m54XHV12-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm/vfp/vfpmodule.c:324:13: error: static declaration of 'VFP_bounce' follows non-static declaration
   static void VFP_bounce(u32 trigger, u32 fpexc, struct pt_regs *regs)
               ^
   arch/arm/include/asm/vfp.h:105:6: note: previous declaration is here
   void VFP_bounce(u32 trigger, u32 fpexc, struct pt_regs *regs);
        ^
   1 error generated.


vim +/VFP_bounce +324 arch/arm/vfp/vfpmodule.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  320  
^1da177e4c3f41 Linus Torvalds  2005-04-16  321  /*
^1da177e4c3f41 Linus Torvalds  2005-04-16  322   * Package up a bounce condition.
^1da177e4c3f41 Linus Torvalds  2005-04-16  323   */
4708fb041346fa Ard Biesheuvel  2023-03-16 @324  static void VFP_bounce(u32 trigger, u32 fpexc, struct pt_regs *regs)
^1da177e4c3f41 Linus Torvalds  2005-04-16  325  {
c98929c07a01c9 Catalin Marinas 2007-11-22  326  	u32 fpscr, orig_fpscr, fpsid, exceptions;
^1da177e4c3f41 Linus Torvalds  2005-04-16  327  
^1da177e4c3f41 Linus Torvalds  2005-04-16  328  	pr_debug("VFP: bounce: trigger %08x fpexc %08x\n", trigger, fpexc);
^1da177e4c3f41 Linus Torvalds  2005-04-16  329  
^1da177e4c3f41 Linus Torvalds  2005-04-16  330  	/*
c98929c07a01c9 Catalin Marinas 2007-11-22  331  	 * At this point, FPEXC can have the following configuration:
c98929c07a01c9 Catalin Marinas 2007-11-22  332  	 *
c98929c07a01c9 Catalin Marinas 2007-11-22  333  	 *  EX DEX IXE
c98929c07a01c9 Catalin Marinas 2007-11-22  334  	 *  0   1   x   - synchronous exception
c98929c07a01c9 Catalin Marinas 2007-11-22  335  	 *  1   x   0   - asynchronous exception
c98929c07a01c9 Catalin Marinas 2007-11-22  336  	 *  1   x   1   - sychronous on VFP subarch 1 and asynchronous on later
c98929c07a01c9 Catalin Marinas 2007-11-22  337  	 *  0   0   1   - synchronous on VFP9 (non-standard subarch 1
c98929c07a01c9 Catalin Marinas 2007-11-22  338  	 *                implementation), undefined otherwise
c98929c07a01c9 Catalin Marinas 2007-11-22  339  	 *
c98929c07a01c9 Catalin Marinas 2007-11-22  340  	 * Clear various bits and enable access to the VFP so we can
c98929c07a01c9 Catalin Marinas 2007-11-22  341  	 * handle the bounce.
^1da177e4c3f41 Linus Torvalds  2005-04-16  342  	 */
c98929c07a01c9 Catalin Marinas 2007-11-22  343  	fmxr(FPEXC, fpexc & ~(FPEXC_EX|FPEXC_DEX|FPEXC_FP2V|FPEXC_VV|FPEXC_TRAP_MASK));
^1da177e4c3f41 Linus Torvalds  2005-04-16  344  
c98929c07a01c9 Catalin Marinas 2007-11-22  345  	fpsid = fmrx(FPSID);
^1da177e4c3f41 Linus Torvalds  2005-04-16  346  	orig_fpscr = fpscr = fmrx(FPSCR);
^1da177e4c3f41 Linus Torvalds  2005-04-16  347  
^1da177e4c3f41 Linus Torvalds  2005-04-16  348  	/*
c98929c07a01c9 Catalin Marinas 2007-11-22  349  	 * Check for the special VFP subarch 1 and FPSCR.IXE bit case
c98929c07a01c9 Catalin Marinas 2007-11-22  350  	 */
c98929c07a01c9 Catalin Marinas 2007-11-22  351  	if ((fpsid & FPSID_ARCH_MASK) == (1 << FPSID_ARCH_BIT)
c98929c07a01c9 Catalin Marinas 2007-11-22  352  	    && (fpscr & FPSCR_IXE)) {
c98929c07a01c9 Catalin Marinas 2007-11-22  353  		/*
c98929c07a01c9 Catalin Marinas 2007-11-22  354  		 * Synchronous exception, emulate the trigger instruction
^1da177e4c3f41 Linus Torvalds  2005-04-16  355  		 */
^1da177e4c3f41 Linus Torvalds  2005-04-16  356  		goto emulate;
^1da177e4c3f41 Linus Torvalds  2005-04-16  357  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  358  
c98929c07a01c9 Catalin Marinas 2007-11-22  359  	if (fpexc & FPEXC_EX) {
c98929c07a01c9 Catalin Marinas 2007-11-22  360  		/*
c98929c07a01c9 Catalin Marinas 2007-11-22  361  		 * Asynchronous exception. The instruction is read from FPINST
c98929c07a01c9 Catalin Marinas 2007-11-22  362  		 * and the interrupted instruction has to be restarted.
c98929c07a01c9 Catalin Marinas 2007-11-22  363  		 */
c98929c07a01c9 Catalin Marinas 2007-11-22  364  		trigger = fmrx(FPINST);
c98929c07a01c9 Catalin Marinas 2007-11-22  365  		regs->ARM_pc -= 4;
c98929c07a01c9 Catalin Marinas 2007-11-22  366  	} else if (!(fpexc & FPEXC_DEX)) {
c98929c07a01c9 Catalin Marinas 2007-11-22  367  		/*
c98929c07a01c9 Catalin Marinas 2007-11-22  368  		 * Illegal combination of bits. It can be caused by an
c98929c07a01c9 Catalin Marinas 2007-11-22  369  		 * unallocated VFP instruction but with FPSCR.IXE set and not
c98929c07a01c9 Catalin Marinas 2007-11-22  370  		 * on VFP subarch 1.
c98929c07a01c9 Catalin Marinas 2007-11-22  371  		 */
c98929c07a01c9 Catalin Marinas 2007-11-22  372  		 vfp_raise_exceptions(VFP_EXCEPTION_ERROR, trigger, fpscr, regs);
4708fb041346fa Ard Biesheuvel  2023-03-16  373  		return;
c98929c07a01c9 Catalin Marinas 2007-11-22  374  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  375  
^1da177e4c3f41 Linus Torvalds  2005-04-16  376  	/*
c98929c07a01c9 Catalin Marinas 2007-11-22  377  	 * Modify fpscr to indicate the number of iterations remaining.
c98929c07a01c9 Catalin Marinas 2007-11-22  378  	 * If FPEXC.EX is 0, FPEXC.DEX is 1 and the FPEXC.VV bit indicates
c98929c07a01c9 Catalin Marinas 2007-11-22  379  	 * whether FPEXC.VECITR or FPSCR.LEN is used.
^1da177e4c3f41 Linus Torvalds  2005-04-16  380  	 */
c98929c07a01c9 Catalin Marinas 2007-11-22  381  	if (fpexc & (FPEXC_EX | FPEXC_VV)) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  382  		u32 len;
^1da177e4c3f41 Linus Torvalds  2005-04-16  383  
^1da177e4c3f41 Linus Torvalds  2005-04-16  384  		len = fpexc + (1 << FPEXC_LENGTH_BIT);
^1da177e4c3f41 Linus Torvalds  2005-04-16  385  
^1da177e4c3f41 Linus Torvalds  2005-04-16  386  		fpscr &= ~FPSCR_LENGTH_MASK;
^1da177e4c3f41 Linus Torvalds  2005-04-16  387  		fpscr |= (len & FPEXC_LENGTH_MASK) << (FPSCR_LENGTH_BIT - FPEXC_LENGTH_BIT);
^1da177e4c3f41 Linus Torvalds  2005-04-16  388  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  389  
^1da177e4c3f41 Linus Torvalds  2005-04-16  390  	/*
^1da177e4c3f41 Linus Torvalds  2005-04-16  391  	 * Handle the first FP instruction.  We used to take note of the
^1da177e4c3f41 Linus Torvalds  2005-04-16  392  	 * FPEXC bounce reason, but this appears to be unreliable.
^1da177e4c3f41 Linus Torvalds  2005-04-16  393  	 * Emulate the bounced instruction instead.
^1da177e4c3f41 Linus Torvalds  2005-04-16  394  	 */
c98929c07a01c9 Catalin Marinas 2007-11-22  395  	exceptions = vfp_emulate_instruction(trigger, fpscr, regs);
^1da177e4c3f41 Linus Torvalds  2005-04-16  396  	if (exceptions)
c98929c07a01c9 Catalin Marinas 2007-11-22  397  		vfp_raise_exceptions(exceptions, trigger, orig_fpscr, regs);
^1da177e4c3f41 Linus Torvalds  2005-04-16  398  
^1da177e4c3f41 Linus Torvalds  2005-04-16  399  	/*
c98929c07a01c9 Catalin Marinas 2007-11-22  400  	 * If there isn't a second FP instruction, exit now. Note that
c98929c07a01c9 Catalin Marinas 2007-11-22  401  	 * the FPEXC.FP2V bit is valid only if FPEXC.EX is 1.
^1da177e4c3f41 Linus Torvalds  2005-04-16  402  	 */
5e4ba617c1b584 Russell King    2013-02-25  403  	if ((fpexc & (FPEXC_EX | FPEXC_FP2V)) != (FPEXC_EX | FPEXC_FP2V))
4708fb041346fa Ard Biesheuvel  2023-03-16  404  		return;
^1da177e4c3f41 Linus Torvalds  2005-04-16  405  
^1da177e4c3f41 Linus Torvalds  2005-04-16  406  	/*
^1da177e4c3f41 Linus Torvalds  2005-04-16  407  	 * The barrier() here prevents fpinst2 being read
^1da177e4c3f41 Linus Torvalds  2005-04-16  408  	 * before the condition above.
^1da177e4c3f41 Linus Torvalds  2005-04-16  409  	 */
^1da177e4c3f41 Linus Torvalds  2005-04-16  410  	barrier();
^1da177e4c3f41 Linus Torvalds  2005-04-16  411  	trigger = fmrx(FPINST2);
^1da177e4c3f41 Linus Torvalds  2005-04-16  412  
^1da177e4c3f41 Linus Torvalds  2005-04-16  413   emulate:
c98929c07a01c9 Catalin Marinas 2007-11-22  414  	exceptions = vfp_emulate_instruction(trigger, orig_fpscr, regs);
^1da177e4c3f41 Linus Torvalds  2005-04-16  415  	if (exceptions)
^1da177e4c3f41 Linus Torvalds  2005-04-16  416  		vfp_raise_exceptions(exceptions, trigger, orig_fpscr, regs);
^1da177e4c3f41 Linus Torvalds  2005-04-16  417  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  418  

:::::: The code at line 324 was first introduced by commit
:::::: 4708fb041346fa9cc6745dafb8c248a3e2f1075b ARM: vfp: Reimplement VFP exception entry in C code

:::::: TO: Ard Biesheuvel <ardb@kernel.org>
:::::: CC: Ard Biesheuvel <ardb@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
