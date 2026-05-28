Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5A93B47EB;
	Thu, 28 May 2026 09:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779961519; cv=none; b=iYtUqttc8CUaS5AY8IP29s4jeAOGlI0XKusTncMblfrpNYbZO/XOHFAuvuH+CXsZIIBP3iQVsAmguKN16bgOV2/Fxb1FJ4/2GSZVYj6oheF2+MGdM89DVRoNGj/8ByuGSO9E3aOO+3kfPsdj7ymhwgGBbrIjKNXYxZGW0kWMK1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779961519; c=relaxed/simple;
	bh=aci1jsED6wdJdkNYfeQgZYAydVZuHi2F0wWGj7na3uY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CWHO7vgyTY+JX81IZRnssRCGty/PDEFjo2jQfWvIXKz0aC7hnHg04eGGyVjkWA3wvXCJtjqPqsiALYEQIAiW1vaijsorHHP90CU2cHrTNtlVkuneJ/oGEUlQE8rg+5FFa2Z9Lzsc7rx6WSHGq6Buje07gLnx8u0iW4+p39FHnZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cqUSMmLQ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cqUSMmLQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779961516; x=1811497516;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aci1jsED6wdJdkNYfeQgZYAydVZuHi2F0wWGj7na3uY=;
  b=cqUSMmLQU+Bsx9wDKMpLx7V+pX9fAl3Xr4sj+lKwx0dMJF2GQyZSkEu/
   MCMhg93h3JJUTuxiv3cFFzVIu3OoQ8+f1qetOvETXTGi5SBw6hIkVtN58
   /6e1lgrOKebowRX71MUJpSW+Ggnk50D52ELIpFFKWg3UryfVPgtUVwUTS
   QGcGOjYlF/RMw0qkKumFSuUEnSGOBsNvh8YUQykebdxmb8Eev4BUUO2t0
   VZsHjkIjvy4Qel5VEX0r333+iRbGm5TitBZJHe5lYtjNC8eUpcjK/v9NC
   XTLYXAio6fQZipB3hkW3K1bTudG1wYKertIlKSYMXjORfkuEVCie1rewI
   Q==;
X-CSE-ConnectionGUID: dYYHYkMpTiWil67XQ0DRfw==
X-CSE-MsgGUID: fA8homi3Qeq9e4zibpfARw==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="91109286"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="91109286"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 02:45:12 -0700
X-CSE-ConnectionGUID: 17Hz6Rr9RRCy19GfJbAVqA==
X-CSE-MsgGUID: zGThimueS5GwjWeZhZHQ2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="247452835"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 28 May 2026 02:45:09 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSXIY-000000005nA-10us;
	Thu, 28 May 2026 09:45:06 +0000
Date: Thu, 28 May 2026 17:44:39 +0800
From: kernel test robot <lkp@intel.com>
To: Ashwin Gundarapu <linuxuser509@zohomail.in>, tglx <tglx@kernel.org>,
	mingo <mingo@redhat.com>, bp <bp@alien8.de>, hpa <hpa@zytor.com>,
	x86 <x86@kernel.org>, "dave.hansen" <dave.hansen@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] x86/vm86: Remove deprecated VM86 support
Message-ID: <202605281705.9gRlhp1Y-lkp@intel.com>
References: <19e6858d9db.3a90532342003.5043853571553507480@zohomail.in>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19e6858d9db.3a90532342003.5043853571553507480@zohomail.in>

Hi Ashwin,

kernel test robot noticed the following build errors:

[auto build test ERROR on v7.1-rc5]
[also build test ERROR on linus/master next-20260527]
[cannot apply to tip/x86/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ashwin-Gundarapu/x86-vm86-Remove-deprecated-VM86-support/20260527-153401
base:   v7.1-rc5
patch link:    https://lore.kernel.org/r/19e6858d9db.3a90532342003.5043853571553507480%40zohomail.in
patch subject: [PATCH v2] x86/vm86: Remove deprecated VM86 support
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260528/202605281705.9gRlhp1Y-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260528/202605281705.9gRlhp1Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605281705.9gRlhp1Y-lkp@intel.com/

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

1d13024e624d0e2 arch/x86/kernel/signal_32.c Hiroshi Shimamoto   2008-09-05  253  
a610d6e672d6d37 arch/x86/kernel/signal.c    Al Viro             2012-05-21  254  static void
235b80226b986da arch/x86/kernel/signal.c    Al Viro             2012-11-09  255  handle_signal(struct ksignal *ksig, struct pt_regs *regs)
^1da177e4c3f415 arch/i386/kernel/signal.c   Linus Torvalds      2005-04-16  256  {
fd0f86b66425bd8 arch/x86/kernel/signal.c    Oleg Nesterov       2015-04-16  257  	bool stepping, failed;
e3bfa3859936da3 arch/x86/kernel/signal.c    Ingo Molnar         2025-04-09  258  	struct fpu *fpu = x86_task_fpu(current);
fd0f86b66425bd8 arch/x86/kernel/signal.c    Oleg Nesterov       2015-04-16  259  
5ed92a8ab71f886 arch/x86/kernel/signal.c    Brian Gerst         2015-07-29  260  	if (v8086_mode(regs))
5ed92a8ab71f886 arch/x86/kernel/signal.c    Brian Gerst         2015-07-29 @261  		save_v86_state((struct kernel_vm86_regs *) regs, VM86_SIGNAL);
5ed92a8ab71f886 arch/x86/kernel/signal.c    Brian Gerst         2015-07-29  262  
^1da177e4c3f415 arch/i386/kernel/signal.c   Linus Torvalds      2005-04-16  263  	/* Are we from a system call? */
9ddcb87b9218dec arch/x86/kernel/signal.c    H. Peter Anvin      2021-05-10  264  	if (syscall_get_nr(current, regs) != -1) {
^1da177e4c3f415 arch/i386/kernel/signal.c   Linus Torvalds      2005-04-16  265  		/* If so, check system call restarting.. */
bb57925f5057837 arch/x86/kernel/signal_32.c Hiroshi Shimamoto   2008-09-05  266  		switch (syscall_get_error(current, regs)) {
^1da177e4c3f415 arch/i386/kernel/signal.c   Linus Torvalds      2005-04-16  267  		case -ERESTART_RESTARTBLOCK:
^1da177e4c3f415 arch/i386/kernel/signal.c   Linus Torvalds      2005-04-16  268  		case -ERESTARTNOHAND:
65ea5b034990358 arch/x86/kernel/signal_32.c H. Peter Anvin      2008-01-30  269  			regs->ax = -EINTR;
^1da177e4c3f415 arch/i386/kernel/signal.c   Linus Torvalds      2005-04-16  270  			break;
^1da177e4c3f415 arch/i386/kernel/signal.c   Linus Torvalds      2005-04-16  271  
^1da177e4c3f415 arch/i386/kernel/signal.c   Linus Torvalds      2005-04-16  272  		case -ERESTARTSYS:
235b80226b986da arch/x86/kernel/signal.c    Al Viro             2012-11-09  273  			if (!(ksig->ka.sa.sa_flags & SA_RESTART)) {
65ea5b034990358 arch/x86/kernel/signal_32.c H. Peter Anvin      2008-01-30  274  				regs->ax = -EINTR;
^1da177e4c3f415 arch/i386/kernel/signal.c   Linus Torvalds      2005-04-16  275  				break;
^1da177e4c3f415 arch/i386/kernel/signal.c   Linus Torvalds      2005-04-16  276  			}
df561f6688fef77 arch/x86/kernel/signal.c    Gustavo A. R. Silva 2020-08-23  277  			fallthrough;
^1da177e4c3f415 arch/i386/kernel/signal.c   Linus Torvalds      2005-04-16  278  		case -ERESTARTNOINTR:
65ea5b034990358 arch/x86/kernel/signal_32.c H. Peter Anvin      2008-01-30  279  			regs->ax = regs->orig_ax;
65ea5b034990358 arch/x86/kernel/signal_32.c H. Peter Anvin      2008-01-30  280  			regs->ip -= 2;
ac66f3fd89ee20b arch/x86/kernel/signal_32.c Harvey Harrison     2008-02-08  281  			break;
^1da177e4c3f415 arch/i386/kernel/signal.c   Linus Torvalds      2005-04-16  282  		}
^1da177e4c3f415 arch/i386/kernel/signal.c   Linus Torvalds      2005-04-16  283  	}
^1da177e4c3f415 arch/i386/kernel/signal.c   Linus Torvalds      2005-04-16  284  
^1da177e4c3f415 arch/i386/kernel/signal.c   Linus Torvalds      2005-04-16  285  	/*
fd0f86b66425bd8 arch/x86/kernel/signal.c    Oleg Nesterov       2015-04-16  286  	 * If TF is set due to a debugger (TIF_FORCED_TF), clear TF now
fd0f86b66425bd8 arch/x86/kernel/signal.c    Oleg Nesterov       2015-04-16  287  	 * so that register information in the sigcontext is correct and
fd0f86b66425bd8 arch/x86/kernel/signal.c    Oleg Nesterov       2015-04-16  288  	 * then notify the tracer before entering the signal handler.
^1da177e4c3f415 arch/i386/kernel/signal.c   Linus Torvalds      2005-04-16  289  	 */
fd0f86b66425bd8 arch/x86/kernel/signal.c    Oleg Nesterov       2015-04-16  290  	stepping = test_thread_flag(TIF_SINGLESTEP);
fd0f86b66425bd8 arch/x86/kernel/signal.c    Oleg Nesterov       2015-04-16  291  	if (stepping)
fd0f86b66425bd8 arch/x86/kernel/signal.c    Oleg Nesterov       2015-04-16  292  		user_disable_single_step(current);
^1da177e4c3f415 arch/i386/kernel/signal.c   Linus Torvalds      2005-04-16  293  
235b80226b986da arch/x86/kernel/signal.c    Al Viro             2012-11-09  294  	failed = (setup_rt_frame(ksig, regs) < 0);
235b80226b986da arch/x86/kernel/signal.c    Al Viro             2012-11-09  295  	if (!failed) {
8b9c5ff380aa4f1 arch/x86/kernel/signal_32.c Roland McGrath      2008-04-19  296  		/*
8b9c5ff380aa4f1 arch/x86/kernel/signal_32.c Roland McGrath      2008-04-19  297  		 * Clear the direction flag as per the ABI for function entry.
ddd40da4ccbabdd arch/x86/kernel/signal.c    Jiri Olsa           2013-05-01  298  		 *
24cda10996f5420 arch/x86/kernel/signal.c    Jiri Olsa           2013-05-01  299  		 * Clear RF when entering the signal handler, because
24cda10996f5420 arch/x86/kernel/signal.c    Jiri Olsa           2013-05-01  300  		 * it might disable possible debug exception from the
24cda10996f5420 arch/x86/kernel/signal.c    Jiri Olsa           2013-05-01  301  		 * signal handler.
ddd40da4ccbabdd arch/x86/kernel/signal.c    Jiri Olsa           2013-05-01  302  		 *
fd0f86b66425bd8 arch/x86/kernel/signal.c    Oleg Nesterov       2015-04-16  303  		 * Clear TF for the case when it wasn't set by debugger to
fd0f86b66425bd8 arch/x86/kernel/signal.c    Oleg Nesterov       2015-04-16  304  		 * avoid the recursive send_sigtrap() in SIGTRAP handler.
8b9c5ff380aa4f1 arch/x86/kernel/signal_32.c Roland McGrath      2008-04-19  305  		 */
ddd40da4ccbabdd arch/x86/kernel/signal.c    Jiri Olsa           2013-05-01  306  		regs->flags &= ~(X86_EFLAGS_DF|X86_EFLAGS_RF|X86_EFLAGS_TF);
66463db4fc5605d arch/x86/kernel/signal.c    Oleg Nesterov       2014-09-02  307  		/*
66463db4fc5605d arch/x86/kernel/signal.c    Oleg Nesterov       2014-09-02  308  		 * Ensure the signal handler starts with the new fpu state.
66463db4fc5605d arch/x86/kernel/signal.c    Oleg Nesterov       2014-09-02  309  		 */
b860eb8dce5906b arch/x86/kernel/signal.c    Fenghua Yu          2020-05-12  310  		fpu__clear_user_states(fpu);
235b80226b986da arch/x86/kernel/signal.c    Al Viro             2012-11-09  311  	}
fd0f86b66425bd8 arch/x86/kernel/signal.c    Oleg Nesterov       2015-04-16  312  	signal_setup_done(failed, ksig, stepping);
^1da177e4c3f415 arch/i386/kernel/signal.c   Linus Torvalds      2005-04-16  313  }
^1da177e4c3f415 arch/i386/kernel/signal.c   Linus Torvalds      2005-04-16  314  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
