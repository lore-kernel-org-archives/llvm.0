Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A6E805;
	Wed, 31 May 2023 18:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685558570; x=1717094570;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I3BvlvjyOr+rtYJ0KX6lxgCWrWTw0o2Nm5WFL6FLaNg=;
  b=g/HPJFCCHlNzOTzOnFwf/M2p7b2g83FBq4/YVfiCmn9WNz/YOiV0E+cB
   ktxyLbljDzkd7OyEk75tVTR6a54Y7gCrpO6SxaLCa7iUydv5lurpMcEPP
   uCL2eTnbbFq8v+W8+FTLSnFXWlL+oTb588kuPC9yTTEYwGDGqKE89WNAa
   ytn1uFZjQbbFv8k1HOb8Mbx/HtlnAwd2wGl2Fygl5VSsa4agl0q7+HwiS
   fTb7m0mTD6HjpV6JePehiAfikcGqalUVyIOD/A8kKEDTEtN60tfWGltIY
   Tt2PhKxvSV22jpMxRI/KSXc2a9zXoS4VZkcdRTdZFShfNUjTsTvIXQQXk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="357719332"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="357719332"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 11:42:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="740080920"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="740080920"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 31 May 2023 11:42:36 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4QmJ-0001Xf-1d;
	Wed, 31 May 2023 18:42:35 +0000
Date: Thu, 1 Jun 2023 02:41:58 +0800
From: kernel test robot <lkp@intel.com>
To: Song Liu <song@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mike Rapoport <rppt@kernel.org>
Subject: [rppt:perm_alloc/v0 9/13] arch/x86/kernel/ftrace.c:418:44: warning:
 variable 'npages' is uninitialized when used here
Message-ID: <202306010220.wZPmbp7W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git perm_alloc/v0
head:   a92ef5aa5306aeaadefc1625e1a48c6832aa0a26
commit: b99e562f2ff2ff567b283d6502986246ab698544 [9/13] x86: prepare to allocate exectuatble memory as ROX
config: x86_64-randconfig-a011-20230531 (https://download.01.org/0day-ci/archive/20230601/202306010220.wZPmbp7W-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git/commit/?id=b99e562f2ff2ff567b283d6502986246ab698544
        git remote add rppt https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git
        git fetch --no-tags rppt perm_alloc/v0
        git checkout b99e562f2ff2ff567b283d6502986246ab698544
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306010220.wZPmbp7W-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/ftrace.c:418:44: warning: variable 'npages' is uninitialized when used here [-Wuninitialized]
           set_memory_rox((unsigned long)trampoline, npages);
                                                     ^~~~~~
   arch/x86/kernel/ftrace.c:316:22: note: initialize the variable 'npages' to silence this warning
           unsigned long npages;
                               ^
                                = 0
   1 warning generated.


vim +/npages +418 arch/x86/kernel/ftrace.c

d2a68c4effd821 Steven Rostedt (VMware   2018-12-08  306) 
aec0be2d6e9f02 Steven Rostedt (Red Hat  2014-11-18  307) static unsigned long
aec0be2d6e9f02 Steven Rostedt (Red Hat  2014-11-18  308) create_trampoline(struct ftrace_ops *ops, unsigned int *tramp_size)
f3bea49115b21e Steven Rostedt (Red Hat  2014-07-02  309) {
f3bea49115b21e Steven Rostedt (Red Hat  2014-07-02  310) 	unsigned long start_offset;
f3bea49115b21e Steven Rostedt (Red Hat  2014-07-02  311) 	unsigned long end_offset;
f3bea49115b21e Steven Rostedt (Red Hat  2014-07-02  312) 	unsigned long op_offset;
768ae4406a5cab Peter Zijlstra           2019-08-26  313  	unsigned long call_offset;
fe58acefd5a66d Steven Rostedt (VMware   2020-04-22  314) 	unsigned long jmp_offset;
f3bea49115b21e Steven Rostedt (Red Hat  2014-07-02  315) 	unsigned long offset;
3c0dab44e22782 Nadav Amit               2019-04-25  316  	unsigned long npages;
f3bea49115b21e Steven Rostedt (Red Hat  2014-07-02  317) 	unsigned long size;
f3bea49115b21e Steven Rostedt (Red Hat  2014-07-02  318) 	unsigned long *ptr;
f3bea49115b21e Steven Rostedt (Red Hat  2014-07-02  319) 	void *trampoline;
ee3e2469b3463d Peter Zijlstra           2022-09-15  320  	void *ip, *dest;
f3bea49115b21e Steven Rostedt (Red Hat  2014-07-02  321) 	/* 48 8b 15 <offset> is movq <offset>(%rip), %rdx */
f3bea49115b21e Steven Rostedt (Red Hat  2014-07-02  322) 	unsigned const char op_ref[] = { 0x48, 0x8b, 0x15 };
e52fc2cf3f6628 Peter Zijlstra           2022-03-08  323  	unsigned const char retq[] = { RET_INSN_OPCODE, INT3_INSN_OPCODE };
f3bea49115b21e Steven Rostedt (Red Hat  2014-07-02  324) 	union ftrace_op_code_union op_ptr;
b99e562f2ff2ff Song Liu                 2023-05-25  325  	void *ret;
f3bea49115b21e Steven Rostedt (Red Hat  2014-07-02  326) 
f3bea49115b21e Steven Rostedt (Red Hat  2014-07-02  327) 	if (ops->flags & FTRACE_OPS_FL_SAVE_REGS) {
f3bea49115b21e Steven Rostedt (Red Hat  2014-07-02  328) 		start_offset = (unsigned long)ftrace_regs_caller;
f3bea49115b21e Steven Rostedt (Red Hat  2014-07-02  329) 		end_offset = (unsigned long)ftrace_regs_caller_end;
f3bea49115b21e Steven Rostedt (Red Hat  2014-07-02  330) 		op_offset = (unsigned long)ftrace_regs_caller_op_ptr;
768ae4406a5cab Peter Zijlstra           2019-08-26  331  		call_offset = (unsigned long)ftrace_regs_call;
fe58acefd5a66d Steven Rostedt (VMware   2020-04-22  332) 		jmp_offset = (unsigned long)ftrace_regs_caller_jmp;
f3bea49115b21e Steven Rostedt (Red Hat  2014-07-02  333) 	} else {
f3bea49115b21e Steven Rostedt (Red Hat  2014-07-02  334) 		start_offset = (unsigned long)ftrace_caller;
0298739b7983cf Peter Zijlstra           2020-04-01  335  		end_offset = (unsigned long)ftrace_caller_end;
f3bea49115b21e Steven Rostedt (Red Hat  2014-07-02  336) 		op_offset = (unsigned long)ftrace_caller_op_ptr;
768ae4406a5cab Peter Zijlstra           2019-08-26  337  		call_offset = (unsigned long)ftrace_call;
fe58acefd5a66d Steven Rostedt (VMware   2020-04-22  338) 		jmp_offset = 0;
f3bea49115b21e Steven Rostedt (Red Hat  2014-07-02  339) 	}
f3bea49115b21e Steven Rostedt (Red Hat  2014-07-02  340) 
f3bea49115b21e Steven Rostedt (Red Hat  2014-07-02  341) 	size = end_offset - start_offset;
f3bea49115b21e Steven Rostedt (Red Hat  2014-07-02  342) 
f3bea49115b21e Steven Rostedt (Red Hat  2014-07-02  343) 	/*
f3bea49115b21e Steven Rostedt (Red Hat  2014-07-02  344) 	 * Allocate enough size to store the ftrace_caller code,
d2a68c4effd821 Steven Rostedt (VMware   2018-12-08  345) 	 * the iret , as well as the address of the ftrace_ops this
d2a68c4effd821 Steven Rostedt (VMware   2018-12-08  346) 	 * trampoline is used for.
f3bea49115b21e Steven Rostedt (Red Hat  2014-07-02  347) 	 */
d2a68c4effd821 Steven Rostedt (VMware   2018-12-08  348) 	trampoline = alloc_tramp(size + RET_SIZE + sizeof(void *));
f3bea49115b21e Steven Rostedt (Red Hat  2014-07-02  349) 	if (!trampoline)
f3bea49115b21e Steven Rostedt (Red Hat  2014-07-02  350) 		return 0;
f3bea49115b21e Steven Rostedt (Red Hat  2014-07-02  351) 
d2a68c4effd821 Steven Rostedt (VMware   2018-12-08  352) 	*tramp_size = size + RET_SIZE + sizeof(void *);
aec0be2d6e9f02 Steven Rostedt (Red Hat  2014-11-18  353) 
f3bea49115b21e Steven Rostedt (Red Hat  2014-07-02  354) 	/* Copy ftrace_caller onto the trampoline memory */
b99e562f2ff2ff Song Liu                 2023-05-25  355  	ret = text_poke_copy(trampoline, (void *)start_offset, size);
b99e562f2ff2ff Song Liu                 2023-05-25  356  	if (WARN_ON(!ret))
d2a68c4effd821 Steven Rostedt (VMware   2018-12-08  357) 		goto fail;
f3bea49115b21e Steven Rostedt (Red Hat  2014-07-02  358) 
d2a68c4effd821 Steven Rostedt (VMware   2018-12-08  359) 	ip = trampoline + size;
1f001e9da6bbf4 Peter Zijlstra           2022-06-14  360  	if (cpu_feature_enabled(X86_FEATURE_RETHUNK))
770ae1b709528a Peter Zijlstra           2022-09-15  361  		__text_gen_insn(ip, JMP32_INSN_OPCODE, ip, x86_return_thunk, JMP32_INSN_SIZE);
1f001e9da6bbf4 Peter Zijlstra           2022-06-14  362  	else
b99e562f2ff2ff Song Liu                 2023-05-25  363  		text_poke_copy(ip, retq, sizeof(retq));
f3bea49115b21e Steven Rostedt (Red Hat  2014-07-02  364) 
fe58acefd5a66d Steven Rostedt (VMware   2020-04-22  365) 	/* No need to test direct calls on created trampolines */
fe58acefd5a66d Steven Rostedt (VMware   2020-04-22  366) 	if (ops->flags & FTRACE_OPS_FL_SAVE_REGS) {
fe58acefd5a66d Steven Rostedt (VMware   2020-04-22  367) 		/* NOP the jnz 1f; but make sure it's a 2 byte jnz */
fe58acefd5a66d Steven Rostedt (VMware   2020-04-22  368) 		ip = trampoline + (jmp_offset - start_offset);
fe58acefd5a66d Steven Rostedt (VMware   2020-04-22  369) 		if (WARN_ON(*(char *)ip != 0x75))
fe58acefd5a66d Steven Rostedt (VMware   2020-04-22  370) 			goto fail;
b99e562f2ff2ff Song Liu                 2023-05-25  371  		if (!text_poke_copy(ip, x86_nops[2], 2))
fe58acefd5a66d Steven Rostedt (VMware   2020-04-22  372) 			goto fail;
fe58acefd5a66d Steven Rostedt (VMware   2020-04-22  373) 	}
fe58acefd5a66d Steven Rostedt (VMware   2020-04-22  374) 
f3bea49115b21e Steven Rostedt (Red Hat  2014-07-02  375) 	/*
f3bea49115b21e Steven Rostedt (Red Hat  2014-07-02  376) 	 * The address of the ftrace_ops that is used for this trampoline
f3bea49115b21e Steven Rostedt (Red Hat  2014-07-02  377) 	 * is stored at the end of the trampoline. This will be used to
f3bea49115b21e Steven Rostedt (Red Hat  2014-07-02  378) 	 * load the third parameter for the callback. Basically, that
f3bea49115b21e Steven Rostedt (Red Hat  2014-07-02  379) 	 * location at the end of the trampoline takes the place of
f3bea49115b21e Steven Rostedt (Red Hat  2014-07-02  380) 	 * the global function_trace_op variable.
f3bea49115b21e Steven Rostedt (Red Hat  2014-07-02  381) 	 */
f3bea49115b21e Steven Rostedt (Red Hat  2014-07-02  382) 
d2a68c4effd821 Steven Rostedt (VMware   2018-12-08  383) 	ptr = (unsigned long *)(trampoline + size + RET_SIZE);
b99e562f2ff2ff Song Liu                 2023-05-25  384  	text_poke_copy(ptr, &ops, sizeof(unsigned long));
f3bea49115b21e Steven Rostedt (Red Hat  2014-07-02  385) 
f3bea49115b21e Steven Rostedt (Red Hat  2014-07-02  386) 	op_offset -= start_offset;
f3bea49115b21e Steven Rostedt (Red Hat  2014-07-02  387) 	memcpy(&op_ptr, trampoline + op_offset, OP_REF_SIZE);
f3bea49115b21e Steven Rostedt (Red Hat  2014-07-02  388) 
f3bea49115b21e Steven Rostedt (Red Hat  2014-07-02  389) 	/* Are we pointing to the reference? */
d2a68c4effd821 Steven Rostedt (VMware   2018-12-08  390) 	if (WARN_ON(memcmp(op_ptr.op, op_ref, 3) != 0))
d2a68c4effd821 Steven Rostedt (VMware   2018-12-08  391) 		goto fail;
f3bea49115b21e Steven Rostedt (Red Hat  2014-07-02  392) 
f3bea49115b21e Steven Rostedt (Red Hat  2014-07-02  393) 	/* Load the contents of ptr into the callback parameter */
f3bea49115b21e Steven Rostedt (Red Hat  2014-07-02  394) 	offset = (unsigned long)ptr;
f3bea49115b21e Steven Rostedt (Red Hat  2014-07-02  395) 	offset -= (unsigned long)trampoline + op_offset + OP_REF_SIZE;
f3bea49115b21e Steven Rostedt (Red Hat  2014-07-02  396) 
f3bea49115b21e Steven Rostedt (Red Hat  2014-07-02  397) 	op_ptr.offset = offset;
f3bea49115b21e Steven Rostedt (Red Hat  2014-07-02  398) 
f3bea49115b21e Steven Rostedt (Red Hat  2014-07-02  399) 	/* put in the new offset to the ftrace_ops */
b99e562f2ff2ff Song Liu                 2023-05-25  400  	text_poke_copy(trampoline + op_offset, &op_ptr, OP_REF_SIZE);
f3bea49115b21e Steven Rostedt (Red Hat  2014-07-02  401) 
768ae4406a5cab Peter Zijlstra           2019-08-26  402  	/* put in the call to the function */
768ae4406a5cab Peter Zijlstra           2019-08-26  403  	mutex_lock(&text_mutex);
768ae4406a5cab Peter Zijlstra           2019-08-26  404  	call_offset -= start_offset;
ee3e2469b3463d Peter Zijlstra           2022-09-15  405  	/*
ee3e2469b3463d Peter Zijlstra           2022-09-15  406  	 * No need to translate into a callthunk. The trampoline does
ee3e2469b3463d Peter Zijlstra           2022-09-15  407  	 * the depth accounting before the call already.
ee3e2469b3463d Peter Zijlstra           2022-09-15  408  	 */
ee3e2469b3463d Peter Zijlstra           2022-09-15  409  	dest = ftrace_ops_get_func(ops);
b99e562f2ff2ff Song Liu                 2023-05-25  410  	text_poke_copy_locked(trampoline + call_offset,
ee3e2469b3463d Peter Zijlstra           2022-09-15  411  	      text_gen_insn(CALL_INSN_OPCODE, trampoline + call_offset, dest),
b99e562f2ff2ff Song Liu                 2023-05-25  412  	      CALL_INSN_SIZE, false);
768ae4406a5cab Peter Zijlstra           2019-08-26  413  	mutex_unlock(&text_mutex);
768ae4406a5cab Peter Zijlstra           2019-08-26  414  
f3bea49115b21e Steven Rostedt (Red Hat  2014-07-02  415) 	/* ALLOC_TRAMP flags lets us know we created it */
f3bea49115b21e Steven Rostedt (Red Hat  2014-07-02  416) 	ops->flags |= FTRACE_OPS_FL_ALLOC_TRAMP;
f3bea49115b21e Steven Rostedt (Red Hat  2014-07-02  417) 
d48567c9a0d1e6 Peter Zijlstra           2022-10-26 @418  	set_memory_rox((unsigned long)trampoline, npages);
f3bea49115b21e Steven Rostedt (Red Hat  2014-07-02  419) 	return (unsigned long)trampoline;
d2a68c4effd821 Steven Rostedt (VMware   2018-12-08  420) fail:
7fdfe1e40b225b Rick Edgecombe           2019-04-25  421  	tramp_free(trampoline);
d2a68c4effd821 Steven Rostedt (VMware   2018-12-08  422) 	return 0;
f3bea49115b21e Steven Rostedt (Red Hat  2014-07-02  423) }
f3bea49115b21e Steven Rostedt (Red Hat  2014-07-02  424) 

:::::: The code at line 418 was first introduced by commit
:::::: d48567c9a0d1e605639f8a8705a61bbb55fb4e84 mm: Introduce set_memory_rox()

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Dave Hansen <dave.hansen@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
