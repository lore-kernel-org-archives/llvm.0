Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D693017A30A;
	Wed, 27 May 2026 23:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779924845; cv=none; b=SFkqkzC30Suh3r/3ypQcJ9GqgUoMH1usU3gAioLdBRRXURt6QiXoFFIHFz+OH5fEhufWQzFkRlPIoPtCEWxZAS0RGvLNarLQPE4UhjKmMlQEy3gSxfJWNCWYDaaK8aEBehBD03hfr6TTsuh1cZzTJD9rN2aMXeokfN5gQAXJNg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779924845; c=relaxed/simple;
	bh=x4k2No1Ws5EWMDWg4vQ5Yet2V2QAXSLgRPhYfrLE3u8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QoniAD7i/uFYhfG7vewLRFD/k9AOQL5+ZE/pztfAC6F85KJdSFxs4CwE1NzJw8VllNRu5Ludq0XKpD1NFNbhLRSIDXLhOIFMWtbrnRz/hM0FBzr3aUYZlO3ybpvJRQZ41UIVP3n7d8TUeNKuf1H7YxYzjKEmxdJ4/wetU95IHa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PGPHOamJ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PGPHOamJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779924844; x=1811460844;
  h=date:from:to:cc:subject:message-id;
  bh=x4k2No1Ws5EWMDWg4vQ5Yet2V2QAXSLgRPhYfrLE3u8=;
  b=PGPHOamJsPptLYxZ4fjCwsuX+31RrqQgVmMqAMaZigP2N27H9AoDCbdc
   FLepuirzSRmS34I+JyTXxqkyL0LuLLmkGURnavdC+nilol4HLSCU/cRTU
   SRDqOcQYrZMZjjNPVaGRK8lZJw1FW0MMP0kucd3nI7AbNTkEnfa3sLnVu
   3oGlynoJs6tibA2yZ9/dCrVkw/X843anjYpBseI+j0rxSe5xs989aLIYz
   KPxbdWbtjF8e5o4pfSHEgVGI/JFPe2PieDwExAfHUu6FVLqlVTZu/Q5dR
   XAaI3ySXjzEFR36V0FawUhdqHcYuFSww4GIuGraaXU31Flhrijdvzyj/a
   g==;
X-CSE-ConnectionGUID: CpPzu6igTnaeUeL9g+xIbQ==
X-CSE-MsgGUID: 7vekkpCrSQ+x2OnlRWA69A==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="98186271"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; 
   d="scan'208";a="98186271"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 16:34:03 -0700
X-CSE-ConnectionGUID: CV6bHu/9QHmKzfzY2wLLDw==
X-CSE-MsgGUID: nokhU41ETgOu+2iEZ+gmOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; 
   d="scan'208";a="246665368"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 27 May 2026 16:34:02 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSNl9-0000000009h-1154;
	Wed, 27 May 2026 23:33:59 +0000
Date: Thu, 28 May 2026 01:33:40 +0200
From: kernel test robot <lkp@intel.com>
To: Ashwin Gundarapu <linuxuser509@zohomail.in>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: arch/x86/kernel/signal.c:261:3: error: call to undeclared
 function 'save_v86_state'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202605280112.7kamMgMy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Ashwin-Gundarapu/x86-vm86-Remove-deprecated-VM86-support/20260527-153401
head:   a2ce238b5c42884d12a9ad3e3dea7c6313dcb8bb
commit: a2ce238b5c42884d12a9ad3e3dea7c6313dcb8bb x86/vm86: Remove deprecated VM86 support
date:   16 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260528/202605280112.7kamMgMy-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260528/202605280112.7kamMgMy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605280112.7kamMgMy-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/signal.c:261:3: error: call to undeclared function 'save_v86_state'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     261 |                 save_v86_state((struct kernel_vm86_regs *) regs, VM86_SIGNAL);
         |                 ^
   1 error generated.
--
>> arch/x86/kernel/traps.c:289:9: error: call to undeclared function 'handle_vm86_trap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     289 |                         if (!handle_vm86_trap((struct kernel_vm86_regs *) regs,
         |                              ^
>> arch/x86/kernel/traps.c:927:3: error: call to undeclared function 'handle_vm86_fault'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     927 |                 handle_vm86_fault((struct kernel_vm86_regs *) regs, error_code);
         |                 ^
   arch/x86/kernel/traps.c:927:3: note: did you mean 'handle_mm_fault'?
   include/linux/mm.h:3144:19: note: 'handle_mm_fault' declared here
    3144 | extern vm_fault_t handle_mm_fault(struct vm_area_struct *vma,
         |                   ^
   arch/x86/kernel/traps.c:1347:3: error: call to undeclared function 'handle_vm86_trap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1347 |                 handle_vm86_trap((struct kernel_vm86_regs *)regs, 0, X86_TRAP_DB);
         |                 ^
   3 errors generated.


vim +/save_v86_state +261 arch/x86/kernel/signal.c

1d13024e624d0e arch/x86/kernel/signal_32.c Hiroshi Shimamoto   2008-09-05  253  
a610d6e672d6d3 arch/x86/kernel/signal.c    Al Viro             2012-05-21  254  static void
235b80226b986d arch/x86/kernel/signal.c    Al Viro             2012-11-09  255  handle_signal(struct ksignal *ksig, struct pt_regs *regs)
^1da177e4c3f41 arch/i386/kernel/signal.c   Linus Torvalds      2005-04-16  256  {
fd0f86b66425bd arch/x86/kernel/signal.c    Oleg Nesterov       2015-04-16  257  	bool stepping, failed;
e3bfa3859936da arch/x86/kernel/signal.c    Ingo Molnar         2025-04-09  258  	struct fpu *fpu = x86_task_fpu(current);
fd0f86b66425bd arch/x86/kernel/signal.c    Oleg Nesterov       2015-04-16  259  
5ed92a8ab71f88 arch/x86/kernel/signal.c    Brian Gerst         2015-07-29  260  	if (v8086_mode(regs))
5ed92a8ab71f88 arch/x86/kernel/signal.c    Brian Gerst         2015-07-29 @261  		save_v86_state((struct kernel_vm86_regs *) regs, VM86_SIGNAL);
5ed92a8ab71f88 arch/x86/kernel/signal.c    Brian Gerst         2015-07-29  262  
^1da177e4c3f41 arch/i386/kernel/signal.c   Linus Torvalds      2005-04-16  263  	/* Are we from a system call? */
9ddcb87b9218de arch/x86/kernel/signal.c    H. Peter Anvin      2021-05-10  264  	if (syscall_get_nr(current, regs) != -1) {
^1da177e4c3f41 arch/i386/kernel/signal.c   Linus Torvalds      2005-04-16  265  		/* If so, check system call restarting.. */
bb57925f505783 arch/x86/kernel/signal_32.c Hiroshi Shimamoto   2008-09-05  266  		switch (syscall_get_error(current, regs)) {
^1da177e4c3f41 arch/i386/kernel/signal.c   Linus Torvalds      2005-04-16  267  		case -ERESTART_RESTARTBLOCK:
^1da177e4c3f41 arch/i386/kernel/signal.c   Linus Torvalds      2005-04-16  268  		case -ERESTARTNOHAND:
65ea5b03499035 arch/x86/kernel/signal_32.c H. Peter Anvin      2008-01-30  269  			regs->ax = -EINTR;
^1da177e4c3f41 arch/i386/kernel/signal.c   Linus Torvalds      2005-04-16  270  			break;
^1da177e4c3f41 arch/i386/kernel/signal.c   Linus Torvalds      2005-04-16  271  
^1da177e4c3f41 arch/i386/kernel/signal.c   Linus Torvalds      2005-04-16  272  		case -ERESTARTSYS:
235b80226b986d arch/x86/kernel/signal.c    Al Viro             2012-11-09  273  			if (!(ksig->ka.sa.sa_flags & SA_RESTART)) {
65ea5b03499035 arch/x86/kernel/signal_32.c H. Peter Anvin      2008-01-30  274  				regs->ax = -EINTR;
^1da177e4c3f41 arch/i386/kernel/signal.c   Linus Torvalds      2005-04-16  275  				break;
^1da177e4c3f41 arch/i386/kernel/signal.c   Linus Torvalds      2005-04-16  276  			}
df561f6688fef7 arch/x86/kernel/signal.c    Gustavo A. R. Silva 2020-08-23  277  			fallthrough;
^1da177e4c3f41 arch/i386/kernel/signal.c   Linus Torvalds      2005-04-16  278  		case -ERESTARTNOINTR:
65ea5b03499035 arch/x86/kernel/signal_32.c H. Peter Anvin      2008-01-30  279  			regs->ax = regs->orig_ax;
65ea5b03499035 arch/x86/kernel/signal_32.c H. Peter Anvin      2008-01-30  280  			regs->ip -= 2;
ac66f3fd89ee20 arch/x86/kernel/signal_32.c Harvey Harrison     2008-02-08  281  			break;
^1da177e4c3f41 arch/i386/kernel/signal.c   Linus Torvalds      2005-04-16  282  		}
^1da177e4c3f41 arch/i386/kernel/signal.c   Linus Torvalds      2005-04-16  283  	}
^1da177e4c3f41 arch/i386/kernel/signal.c   Linus Torvalds      2005-04-16  284  
^1da177e4c3f41 arch/i386/kernel/signal.c   Linus Torvalds      2005-04-16  285  	/*
fd0f86b66425bd arch/x86/kernel/signal.c    Oleg Nesterov       2015-04-16  286  	 * If TF is set due to a debugger (TIF_FORCED_TF), clear TF now
fd0f86b66425bd arch/x86/kernel/signal.c    Oleg Nesterov       2015-04-16  287  	 * so that register information in the sigcontext is correct and
fd0f86b66425bd arch/x86/kernel/signal.c    Oleg Nesterov       2015-04-16  288  	 * then notify the tracer before entering the signal handler.
^1da177e4c3f41 arch/i386/kernel/signal.c   Linus Torvalds      2005-04-16  289  	 */
fd0f86b66425bd arch/x86/kernel/signal.c    Oleg Nesterov       2015-04-16  290  	stepping = test_thread_flag(TIF_SINGLESTEP);
fd0f86b66425bd arch/x86/kernel/signal.c    Oleg Nesterov       2015-04-16  291  	if (stepping)
fd0f86b66425bd arch/x86/kernel/signal.c    Oleg Nesterov       2015-04-16  292  		user_disable_single_step(current);
^1da177e4c3f41 arch/i386/kernel/signal.c   Linus Torvalds      2005-04-16  293  
235b80226b986d arch/x86/kernel/signal.c    Al Viro             2012-11-09  294  	failed = (setup_rt_frame(ksig, regs) < 0);
235b80226b986d arch/x86/kernel/signal.c    Al Viro             2012-11-09  295  	if (!failed) {
8b9c5ff380aa4f arch/x86/kernel/signal_32.c Roland McGrath      2008-04-19  296  		/*
8b9c5ff380aa4f arch/x86/kernel/signal_32.c Roland McGrath      2008-04-19  297  		 * Clear the direction flag as per the ABI for function entry.
ddd40da4ccbabd arch/x86/kernel/signal.c    Jiri Olsa           2013-05-01  298  		 *
24cda10996f542 arch/x86/kernel/signal.c    Jiri Olsa           2013-05-01  299  		 * Clear RF when entering the signal handler, because
24cda10996f542 arch/x86/kernel/signal.c    Jiri Olsa           2013-05-01  300  		 * it might disable possible debug exception from the
24cda10996f542 arch/x86/kernel/signal.c    Jiri Olsa           2013-05-01  301  		 * signal handler.
ddd40da4ccbabd arch/x86/kernel/signal.c    Jiri Olsa           2013-05-01  302  		 *
fd0f86b66425bd arch/x86/kernel/signal.c    Oleg Nesterov       2015-04-16  303  		 * Clear TF for the case when it wasn't set by debugger to
fd0f86b66425bd arch/x86/kernel/signal.c    Oleg Nesterov       2015-04-16  304  		 * avoid the recursive send_sigtrap() in SIGTRAP handler.
8b9c5ff380aa4f arch/x86/kernel/signal_32.c Roland McGrath      2008-04-19  305  		 */
ddd40da4ccbabd arch/x86/kernel/signal.c    Jiri Olsa           2013-05-01  306  		regs->flags &= ~(X86_EFLAGS_DF|X86_EFLAGS_RF|X86_EFLAGS_TF);
66463db4fc5605 arch/x86/kernel/signal.c    Oleg Nesterov       2014-09-02  307  		/*
66463db4fc5605 arch/x86/kernel/signal.c    Oleg Nesterov       2014-09-02  308  		 * Ensure the signal handler starts with the new fpu state.
66463db4fc5605 arch/x86/kernel/signal.c    Oleg Nesterov       2014-09-02  309  		 */
b860eb8dce5906 arch/x86/kernel/signal.c    Fenghua Yu          2020-05-12  310  		fpu__clear_user_states(fpu);
235b80226b986d arch/x86/kernel/signal.c    Al Viro             2012-11-09  311  	}
fd0f86b66425bd arch/x86/kernel/signal.c    Oleg Nesterov       2015-04-16  312  	signal_setup_done(failed, ksig, stepping);
^1da177e4c3f41 arch/i386/kernel/signal.c   Linus Torvalds      2005-04-16  313  }
^1da177e4c3f41 arch/i386/kernel/signal.c   Linus Torvalds      2005-04-16  314  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
