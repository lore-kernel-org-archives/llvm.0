Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1411FA6
	for <llvm@lists.linux.dev>; Sat, 30 Apr 2022 13:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651324136; x=1682860136;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v+FrIAWtw1nKPpwoZOsK89KN2KVuLHBlJX1dIjZsb+E=;
  b=P53j1uFvusal4Ok0XsjtvZ0HWNS5pavZa7vedIirQTztQaQIpLgrenSC
   rS4R5jicsGHgUDJZzZOoKlTydeRnvaXPtLyWpL2q9Tivrif26yHL6wSbt
   AGfvENQX9LsJYLDRBhtQhX/sajL0y8fmyBcs6rlEzdEAu8xR/0IpzZTtr
   aOVFLc3A0zmTD6GK9d7ai5u8SXqW3dzw9F7qfY3ESc8Ot269P74FjZN4h
   bQQO+CkUqisIEIO5yKvlABLIFJWeGdej8NnJzbjXAhPLMXfg5/msFcH+o
   tIPxNdKNFLX90WXiUMZ1R5HMI5s4bSKOe+UrDfUAnzauq+5wmEuDy7Tw6
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10332"; a="329838597"
X-IronPort-AV: E=Sophos;i="5.91,188,1647327600"; 
   d="scan'208";a="329838597"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2022 06:08:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,188,1647327600"; 
   d="scan'208";a="597815981"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 30 Apr 2022 06:08:52 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nkmqC-0007FL-0o;
	Sat, 30 Apr 2022 13:08:52 +0000
Date: Sat, 30 Apr 2022 21:08:06 +0800
From: kernel test robot <lkp@intel.com>
To: Guo Ren <guoren@linux.alibaba.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [ammarfaizi2-block:palmer/linux/riscv-compat 20/20]
 arch/riscv/kernel/compat_signal.c:198:5: warning: no previous prototype for
 function 'compat_setup_rt_frame'
Message-ID: <202204302108.jfVPwbXj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block palmer/linux/riscv-compat
head:   e2009fdf858d6fe01f0b24e35d8347fc8da3210f
commit: e2009fdf858d6fe01f0b24e35d8347fc8da3210f [20/20] riscv: compat: Add COMPAT Kbuild skeletal support
config: riscv-randconfig-r042-20220428 (https://download.01.org/0day-ci/archive/20220430/202204302108.jfVPwbXj-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 400775649969b9baf3bc2a510266e7912bb16ae9)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/ammarfaizi2/linux-block/commit/e2009fdf858d6fe01f0b24e35d8347fc8da3210f
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block palmer/linux/riscv-compat
        git checkout e2009fdf858d6fe01f0b24e35d8347fc8da3210f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kernel/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/riscv/kernel/compat_signal.c:198:5: warning: no previous prototype for function 'compat_setup_rt_frame' [-Wmissing-prototypes]
   int compat_setup_rt_frame(struct ksignal *ksig, sigset_t *set,
       ^
   arch/riscv/kernel/compat_signal.c:198:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int compat_setup_rt_frame(struct ksignal *ksig, sigset_t *set,
   ^
   static 
   1 warning generated.


vim +/compat_setup_rt_frame +198 arch/riscv/kernel/compat_signal.c

44be29735fe706 Guo Ren 2022-04-05  197  
44be29735fe706 Guo Ren 2022-04-05 @198  int compat_setup_rt_frame(struct ksignal *ksig, sigset_t *set,
44be29735fe706 Guo Ren 2022-04-05  199  	struct pt_regs *regs)
44be29735fe706 Guo Ren 2022-04-05  200  {
44be29735fe706 Guo Ren 2022-04-05  201  	struct compat_rt_sigframe __user *frame;
44be29735fe706 Guo Ren 2022-04-05  202  	long err = 0;
44be29735fe706 Guo Ren 2022-04-05  203  
44be29735fe706 Guo Ren 2022-04-05  204  	frame = compat_get_sigframe(ksig, regs, sizeof(*frame));
44be29735fe706 Guo Ren 2022-04-05  205  	if (!access_ok(frame, sizeof(*frame)))
44be29735fe706 Guo Ren 2022-04-05  206  		return -EFAULT;
44be29735fe706 Guo Ren 2022-04-05  207  
44be29735fe706 Guo Ren 2022-04-05  208  	err |= copy_siginfo_to_user32(&frame->info, &ksig->info);
44be29735fe706 Guo Ren 2022-04-05  209  
44be29735fe706 Guo Ren 2022-04-05  210  	/* Create the ucontext. */
44be29735fe706 Guo Ren 2022-04-05  211  	err |= __put_user(0, &frame->uc.uc_flags);
44be29735fe706 Guo Ren 2022-04-05  212  	err |= __put_user(NULL, &frame->uc.uc_link);
44be29735fe706 Guo Ren 2022-04-05  213  	err |= __compat_save_altstack(&frame->uc.uc_stack, regs->sp);
44be29735fe706 Guo Ren 2022-04-05  214  	err |= compat_setup_sigcontext(frame, regs);
44be29735fe706 Guo Ren 2022-04-05  215  	err |= __copy_to_user(&frame->uc.uc_sigmask, set, sizeof(*set));
44be29735fe706 Guo Ren 2022-04-05  216  	if (err)
44be29735fe706 Guo Ren 2022-04-05  217  		return -EFAULT;
44be29735fe706 Guo Ren 2022-04-05  218  
44be29735fe706 Guo Ren 2022-04-05  219  	regs->ra = (unsigned long)COMPAT_VDSO_SYMBOL(
44be29735fe706 Guo Ren 2022-04-05  220  			current->mm->context.vdso, rt_sigreturn);
44be29735fe706 Guo Ren 2022-04-05  221  
44be29735fe706 Guo Ren 2022-04-05  222  	/*
44be29735fe706 Guo Ren 2022-04-05  223  	 * Set up registers for signal handler.
44be29735fe706 Guo Ren 2022-04-05  224  	 * Registers that we don't modify keep the value they had from
44be29735fe706 Guo Ren 2022-04-05  225  	 * user-space at the time we took the signal.
44be29735fe706 Guo Ren 2022-04-05  226  	 * We always pass siginfo and mcontext, regardless of SA_SIGINFO,
44be29735fe706 Guo Ren 2022-04-05  227  	 * since some things rely on this (e.g. glibc's debug/segfault.c).
44be29735fe706 Guo Ren 2022-04-05  228  	 */
44be29735fe706 Guo Ren 2022-04-05  229  	regs->epc = (unsigned long)ksig->ka.sa.sa_handler;
44be29735fe706 Guo Ren 2022-04-05  230  	regs->sp = (unsigned long)frame;
44be29735fe706 Guo Ren 2022-04-05  231  	regs->a0 = ksig->sig;                     /* a0: signal number */
44be29735fe706 Guo Ren 2022-04-05  232  	regs->a1 = (unsigned long)(&frame->info); /* a1: siginfo pointer */
44be29735fe706 Guo Ren 2022-04-05  233  	regs->a2 = (unsigned long)(&frame->uc);   /* a2: ucontext pointer */
44be29735fe706 Guo Ren 2022-04-05  234  

:::::: The code at line 198 was first introduced by commit
:::::: 44be29735fe7065c7d32d1d2cc26b68487ac07b6 riscv: compat: signal: Add rt_frame implementation

:::::: TO: Guo Ren <guoren@linux.alibaba.com>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
