Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A574414;
	Wed,  7 May 2025 07:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746603107; cv=none; b=mCwDHX3CYoOObLM0/HDFrJhY/aCiMtIq6bhLBkpZWvuuCiLQN35ofGMww3rUjgiT8O3MDMB7BsbXhpXq/m6wIrq1zJv7kggirWOPUgkKlf454lS3RrSqayxYxRV5V2zT7cuj50Zn18UMphPcn7h9M98z1HbKzTPDMWDbqhzhDjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746603107; c=relaxed/simple;
	bh=FFuzi7T3c0I8IGg4qrObk2JgKXXJTMHod23upkgrbKo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fUCDkcTokaCKll64n/mAOF2WERAlMoCi4fXhZCF/OO/v7tXd4p4clUcND+gdqmNcBMhYxRhMKBwD1AEeAOPBvJGclvyeSyYc+bajCWTw+2GKhRIDWWscakO0gLKUkJnojG3ZwEX7GDjjDpZ22vCJbAKG9ua+NvHKc9fvEiD4lf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nZWJvvXp; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nZWJvvXp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746603105; x=1778139105;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FFuzi7T3c0I8IGg4qrObk2JgKXXJTMHod23upkgrbKo=;
  b=nZWJvvXpthnc35AV1xLJtRow2gfEc/LspRl3BSMI+Q29jKC8oxs9ZYVC
   wZEn3q0S805HNr5k1kjS4YU5+Nv5Woq5z/4cun2exo6o3jiA3QuxbHZ6t
   KVzTHSn/MHeOobqMCn68G7NzoCzf+u7/QqwjEx6N9GiZNKkJWeHUXy3TC
   h7ec0gPukJGphpj3TOvACqg8prUVaIB/zKMcwb7lrdKZYtMf8zcalFpLR
   JfNJxLscc/6az5yxqHUHVeqk0aH2coZhmU0f7vIY1OJQcNnYLyyug8vkY
   /TSa3g1k9nP1F+qvYFc8vAQndJdR64cE0pcZ/HX8yKyWOcBu/zlOVUL6I
   A==;
X-CSE-ConnectionGUID: GfWJj0fpSZyMJLPSgy6OYw==
X-CSE-MsgGUID: bQV5D4NdRZ+c4NiMWwvwDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="35944815"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="35944815"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 00:31:42 -0700
X-CSE-ConnectionGUID: dbd0VANxQyOjRZ4oDvVYSg==
X-CSE-MsgGUID: G8XAI6teS/ygnJbWvNGS1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="173064112"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 07 May 2025 00:31:40 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCZFi-0007JZ-1W;
	Wed, 07 May 2025 07:31:38 +0000
Date: Wed, 7 May 2025 15:31:13 +0800
From: kernel test robot <lkp@intel.com>
To: Xi Ruoyao <xry111@xry111.site>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [linux-next:master 3551/8679]
 arch/riscv/kernel/compat_signal.c:220:28: error: use of undeclared
 identifier 'compat__vdso_rt_sigreturn_offset'
Message-ID: <202505071542.jdBqsSPB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0a00723f4c2d0b273edd0737f236f103164a08eb
commit: 89079520cef65d6da1e864eab4464effe5396e23 [3551/8679] RISC-V: vDSO: Wire up getrandom() vDSO implementation
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20250507/202505071542.jdBqsSPB-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071542.jdBqsSPB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071542.jdBqsSPB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/kernel/compat_signal.c:220:28: error: use of undeclared identifier 'compat__vdso_rt_sigreturn_offset'
     220 |         regs->ra = (unsigned long)COMPAT_VDSO_SYMBOL(
         |                                   ^
   arch/riscv/include/asm/vdso.h:29:42: note: expanded from macro 'COMPAT_VDSO_SYMBOL'
      29 |         (void __user *)((unsigned long)(base) + compat__vdso_##name##_offset)
         |                                                 ^
   <scratch space>:315:1: note: expanded from here
     315 | compat__vdso_rt_sigreturn_offset
         | ^
   1 error generated.


vim +/compat__vdso_rt_sigreturn_offset +220 arch/riscv/kernel/compat_signal.c

7383ee05314be58 Guo Ren 2022-04-05  198  
7383ee05314be58 Guo Ren 2022-04-05  199  int compat_setup_rt_frame(struct ksignal *ksig, sigset_t *set,
7383ee05314be58 Guo Ren 2022-04-05  200  	struct pt_regs *regs)
7383ee05314be58 Guo Ren 2022-04-05  201  {
7383ee05314be58 Guo Ren 2022-04-05  202  	struct compat_rt_sigframe __user *frame;
7383ee05314be58 Guo Ren 2022-04-05  203  	long err = 0;
7383ee05314be58 Guo Ren 2022-04-05  204  
7383ee05314be58 Guo Ren 2022-04-05  205  	frame = compat_get_sigframe(ksig, regs, sizeof(*frame));
7383ee05314be58 Guo Ren 2022-04-05  206  	if (!access_ok(frame, sizeof(*frame)))
7383ee05314be58 Guo Ren 2022-04-05  207  		return -EFAULT;
7383ee05314be58 Guo Ren 2022-04-05  208  
7383ee05314be58 Guo Ren 2022-04-05  209  	err |= copy_siginfo_to_user32(&frame->info, &ksig->info);
7383ee05314be58 Guo Ren 2022-04-05  210  
7383ee05314be58 Guo Ren 2022-04-05  211  	/* Create the ucontext. */
7383ee05314be58 Guo Ren 2022-04-05  212  	err |= __put_user(0, &frame->uc.uc_flags);
7383ee05314be58 Guo Ren 2022-04-05  213  	err |= __put_user(NULL, &frame->uc.uc_link);
7383ee05314be58 Guo Ren 2022-04-05  214  	err |= __compat_save_altstack(&frame->uc.uc_stack, regs->sp);
7383ee05314be58 Guo Ren 2022-04-05  215  	err |= compat_setup_sigcontext(frame, regs);
7383ee05314be58 Guo Ren 2022-04-05  216  	err |= __copy_to_user(&frame->uc.uc_sigmask, set, sizeof(*set));
7383ee05314be58 Guo Ren 2022-04-05  217  	if (err)
7383ee05314be58 Guo Ren 2022-04-05  218  		return -EFAULT;
7383ee05314be58 Guo Ren 2022-04-05  219  
7383ee05314be58 Guo Ren 2022-04-05 @220  	regs->ra = (unsigned long)COMPAT_VDSO_SYMBOL(
7383ee05314be58 Guo Ren 2022-04-05  221  			current->mm->context.vdso, rt_sigreturn);
7383ee05314be58 Guo Ren 2022-04-05  222  
7383ee05314be58 Guo Ren 2022-04-05  223  	/*
7383ee05314be58 Guo Ren 2022-04-05  224  	 * Set up registers for signal handler.
7383ee05314be58 Guo Ren 2022-04-05  225  	 * Registers that we don't modify keep the value they had from
7383ee05314be58 Guo Ren 2022-04-05  226  	 * user-space at the time we took the signal.
7383ee05314be58 Guo Ren 2022-04-05  227  	 * We always pass siginfo and mcontext, regardless of SA_SIGINFO,
7383ee05314be58 Guo Ren 2022-04-05  228  	 * since some things rely on this (e.g. glibc's debug/segfault.c).
7383ee05314be58 Guo Ren 2022-04-05  229  	 */
7383ee05314be58 Guo Ren 2022-04-05  230  	regs->epc = (unsigned long)ksig->ka.sa.sa_handler;
7383ee05314be58 Guo Ren 2022-04-05  231  	regs->sp = (unsigned long)frame;
7383ee05314be58 Guo Ren 2022-04-05  232  	regs->a0 = ksig->sig;                     /* a0: signal number */
7383ee05314be58 Guo Ren 2022-04-05  233  	regs->a1 = (unsigned long)(&frame->info); /* a1: siginfo pointer */
7383ee05314be58 Guo Ren 2022-04-05  234  	regs->a2 = (unsigned long)(&frame->uc);   /* a2: ucontext pointer */
7383ee05314be58 Guo Ren 2022-04-05  235  

:::::: The code at line 220 was first introduced by commit
:::::: 7383ee05314be58f8f9f018ee0ac53bef3808aea riscv: compat: signal: Add rt_frame implementation

:::::: TO: Guo Ren <guoren@linux.alibaba.com>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
