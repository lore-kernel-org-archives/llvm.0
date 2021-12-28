Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473422C80
	for <llvm@lists.linux.dev>; Tue, 28 Dec 2021 18:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640717142; x=1672253142;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fGYv5mgtvdW9kjOwwWT2K4cBBnwt6DpPEhDNG75IPw0=;
  b=O89pLlvOwDhb1l4pKLR/N9cj8cbJ4uYdC+4w1Q43BdTApOhM42uucrtB
   6XCd/sUtPMjzXwDTd37uB21FEg5uQ2qcZtHVFqL3KdKri3/mbkPNTpW8x
   LU9GD4sM1NSlDyaisy3ie99lbSPw/7giC0VmtfivQXxYBwJsLFjyzA6lw
   gm6RtAeI0HmtwTzgCPa2O+SH9wiDNhlOOg6xeG8EewxcbRrZEs6vqKwx0
   iu/udunY5SRp1xup0FRGAnhSDrBsmLtm20rS7kMT9oB4E0by6AIvLWYa+
   cUgq9Mih9d7hM9OQ3ThibMMr31j6X/0Gsh6RKyOaz75fyQCMPZCihTXMV
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10211"; a="265638582"
X-IronPort-AV: E=Sophos;i="5.88,242,1635231600"; 
   d="scan'208";a="265638582"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2021 10:45:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,242,1635231600"; 
   d="scan'208";a="468202030"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 28 Dec 2021 10:45:22 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n2HTN-0007wY-Cb; Tue, 28 Dec 2021 18:45:21 +0000
Date: Wed, 29 Dec 2021 02:45:07 +0800
From: kernel test robot <lkp@intel.com>
To: Guo Ren <guoren@linux.alibaba.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [csky-linux:riscv_compat_v2 17/17]
 arch/riscv/kernel/compat_signal.c:199:5: warning: no previous prototype for
 function 'compat_setup_rt_frame'
Message-ID: <202112290250.xtdytZe1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Guo,

First bad commit (maybe != root cause):

tree:   https://github.com/c-sky/csky-linux riscv_compat_v2
head:   750f87086bdd630f80b9bc3581bc3f329ef20f53
commit: 750f87086bdd630f80b9bc3581bc3f329ef20f53 [17/17] riscv: compat: Add COMPAT Kbuild skeletal support
config: riscv-buildonly-randconfig-r002-20211228 (https://download.01.org/0day-ci/archive/20211229/202112290250.xtdytZe1-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 7171af744543433ac75b232eb7dfdaef7efd4d7a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/c-sky/csky-linux/commit/750f87086bdd630f80b9bc3581bc3f329ef20f53
        git remote add csky-linux https://github.com/c-sky/csky-linux
        git fetch --no-tags csky-linux riscv_compat_v2
        git checkout 750f87086bdd630f80b9bc3581bc3f329ef20f53
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kernel/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/riscv/kernel/compat_signal.c:199:5: warning: no previous prototype for function 'compat_setup_rt_frame' [-Wmissing-prototypes]
   int compat_setup_rt_frame(struct ksignal *ksig, sigset_t *set,
       ^
   arch/riscv/kernel/compat_signal.c:199:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int compat_setup_rt_frame(struct ksignal *ksig, sigset_t *set,
   ^
   static 
   1 warning generated.


vim +/compat_setup_rt_frame +199 arch/riscv/kernel/compat_signal.c

520279d27c28fd Guo Ren 2021-12-13  198  
520279d27c28fd Guo Ren 2021-12-13 @199  int compat_setup_rt_frame(struct ksignal *ksig, sigset_t *set,
520279d27c28fd Guo Ren 2021-12-13  200  	struct pt_regs *regs)
520279d27c28fd Guo Ren 2021-12-13  201  {
520279d27c28fd Guo Ren 2021-12-13  202  	struct compat_rt_sigframe __user *frame;
520279d27c28fd Guo Ren 2021-12-13  203  	long err = 0;
520279d27c28fd Guo Ren 2021-12-13  204  
520279d27c28fd Guo Ren 2021-12-13  205  	frame = compat_get_sigframe(ksig, regs, sizeof(*frame));
520279d27c28fd Guo Ren 2021-12-13  206  	if (!access_ok(frame, sizeof(*frame)))
520279d27c28fd Guo Ren 2021-12-13  207  		return -EFAULT;
520279d27c28fd Guo Ren 2021-12-13  208  
520279d27c28fd Guo Ren 2021-12-13  209  	err |= copy_siginfo_to_user32(&frame->info, &ksig->info);
520279d27c28fd Guo Ren 2021-12-13  210  
520279d27c28fd Guo Ren 2021-12-13  211  	/* Create the ucontext. */
520279d27c28fd Guo Ren 2021-12-13  212  	err |= __put_user(0, &frame->uc.uc_flags);
520279d27c28fd Guo Ren 2021-12-13  213  	err |= __put_user(NULL, &frame->uc.uc_link);
520279d27c28fd Guo Ren 2021-12-13  214  	err |= __compat_save_altstack(&frame->uc.uc_stack, regs->sp);
520279d27c28fd Guo Ren 2021-12-13  215  	err |= compat_setup_sigcontext(frame, regs);
520279d27c28fd Guo Ren 2021-12-13  216  	err |= __copy_to_user(&frame->uc.uc_sigmask, set, sizeof(*set));
520279d27c28fd Guo Ren 2021-12-13  217  	if (err)
520279d27c28fd Guo Ren 2021-12-13  218  		return -EFAULT;
520279d27c28fd Guo Ren 2021-12-13  219  
520279d27c28fd Guo Ren 2021-12-13  220  	regs->ra = (unsigned long)COMPAT_VDSO_SYMBOL(
520279d27c28fd Guo Ren 2021-12-13  221  			current->mm->context.vdso, rt_sigreturn);
520279d27c28fd Guo Ren 2021-12-13  222  
520279d27c28fd Guo Ren 2021-12-13  223  	/*
520279d27c28fd Guo Ren 2021-12-13  224  	 * Set up registers for signal handler.
520279d27c28fd Guo Ren 2021-12-13  225  	 * Registers that we don't modify keep the value they had from
520279d27c28fd Guo Ren 2021-12-13  226  	 * user-space at the time we took the signal.
520279d27c28fd Guo Ren 2021-12-13  227  	 * We always pass siginfo and mcontext, regardless of SA_SIGINFO,
520279d27c28fd Guo Ren 2021-12-13  228  	 * since some things rely on this (e.g. glibc's debug/segfault.c).
520279d27c28fd Guo Ren 2021-12-13  229  	 */
520279d27c28fd Guo Ren 2021-12-13  230  	regs->epc = (unsigned long)ksig->ka.sa.sa_handler;
520279d27c28fd Guo Ren 2021-12-13  231  	regs->sp = (unsigned long)frame;
520279d27c28fd Guo Ren 2021-12-13  232  	regs->a0 = ksig->sig;                     /* a0: signal number */
520279d27c28fd Guo Ren 2021-12-13  233  	regs->a1 = (unsigned long)(&frame->info); /* a1: siginfo pointer */
520279d27c28fd Guo Ren 2021-12-13  234  	regs->a2 = (unsigned long)(&frame->uc);   /* a2: ucontext pointer */
520279d27c28fd Guo Ren 2021-12-13  235  

:::::: The code at line 199 was first introduced by commit
:::::: 520279d27c28fd0bcabaef85d9c71cb592da21c2 riscv: compat: signal: Add rt_frame implementation

:::::: TO: Guo Ren <guoren@linux.alibaba.com>
:::::: CC: Guo Ren <guoren@linux.alibaba.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
