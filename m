Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E3B23C6;
	Sun,  4 Jun 2023 14:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685887244; x=1717423244;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1R5svHdBoVb/5Xj0dzt6ySEAujV5v2nEOuHBZ2KiB3Q=;
  b=XV0YjgXl+O/U2HbRwPqPdY2wTlWOUoY/p+x24sA3mOWSSdU9BruQw7yB
   aPio6mIQIB3OIhs1AfJwatFY3OIjQvsCBdzYm3DQkQ96mlN+p6XFb4Wa1
   +06yy+ma6M/etrkie/c9J6VLoA+pWN9zHL7DCubZCZCEf2KsoghVP+EG+
   D7A63WHRft5KaSlz4xtPj7xjwchg+VWIT0EfwNAvUCdvwkVM/kbxsUnny
   FL2r2NdM1NLqiAxeyeZXazpCy2BKH2bjG7IpKNvChpWA5pdAAzHQ+4WOL
   Bqnajc2N2pQa2TJuXmX4t1B8D/MiuZxEY4Pc2w64fn9UDez4dQ+pLO6YE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="358629983"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="358629983"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2023 07:00:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="832522614"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="832522614"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 04 Jun 2023 07:00:42 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q5oHh-0002nv-2m;
	Sun, 04 Jun 2023 14:00:41 +0000
Date: Sun, 4 Jun 2023 22:00:14 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/220-tso 1/4] arch/arm64/kernel/process.c:378:14:
 error: no member named 'actlr' in 'struct thread_struct'
Message-ID: <202306042103.Qj1L3nOJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/220-tso
head:   38015ad2af19088e66e0c81f7efd5a8b51814026
commit: 1d9d900b53057adf79ba22257f2bd551bf5dfed7 [1/4] arm64: Introduce scaffolding to add ACTLR_EL1 to thread state
config: arm64-randconfig-r012-20230604 (https://download.01.org/0day-ci/archive/20230604/202306042103.Qj1L3nOJ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 4faf3aaf28226a4e950c103a14f6fc1d1fdabb1b)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/AsahiLinux/linux/commit/1d9d900b53057adf79ba22257f2bd551bf5dfed7
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/220-tso
        git checkout 1d9d900b53057adf79ba22257f2bd551bf5dfed7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306042103.Qj1L3nOJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/kernel/process.c:378:14: error: no member named 'actlr' in 'struct thread_struct'
                           p->thread.actlr = read_sysreg(actlr_el1);
                           ~~~~~~~~~ ^
   arch/arm64/kernel/process.c:531:18: error: no member named 'actlr' in 'struct thread_struct'
           current->thread.actlr = read_sysreg(actlr_el1);
           ~~~~~~~~~~~~~~~ ^
   arch/arm64/kernel/process.c:532:28: error: no member named 'actlr' in 'struct thread_struct'
           write_sysreg(next->thread.actlr, actlr_el1);
                        ~~~~~~~~~~~~ ^
   arch/arm64/include/asm/sysreg.h:832:20: note: expanded from macro 'write_sysreg'
           u64 __val = (u64)(v);                                   \
                             ^
   3 errors generated.


vim +378 arch/arm64/kernel/process.c

   344	
   345	int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
   346	{
   347		unsigned long clone_flags = args->flags;
   348		unsigned long stack_start = args->stack;
   349		unsigned long tls = args->tls;
   350		struct pt_regs *childregs = task_pt_regs(p);
   351	
   352		memset(&p->thread.cpu_context, 0, sizeof(struct cpu_context));
   353	
   354		/*
   355		 * In case p was allocated the same task_struct pointer as some
   356		 * other recently-exited task, make sure p is disassociated from
   357		 * any cpu that may have run that now-exited task recently.
   358		 * Otherwise we could erroneously skip reloading the FPSIMD
   359		 * registers for p.
   360		 */
   361		fpsimd_flush_task_state(p);
   362	
   363		ptrauth_thread_init_kernel(p);
   364	
   365		if (likely(!args->fn)) {
   366			*childregs = *current_pt_regs();
   367			childregs->regs[0] = 0;
   368	
   369			/*
   370			 * Read the current TLS pointer from tpidr_el0 as it may be
   371			 * out-of-sync with the saved value.
   372			 */
   373			*task_user_tls(p) = read_sysreg(tpidr_el0);
   374			if (system_supports_tpidr2())
   375				p->thread.tpidr2_el0 = read_sysreg_s(SYS_TPIDR2_EL0);
   376	
   377			if (system_has_actlr_state())
 > 378				p->thread.actlr = read_sysreg(actlr_el1);
   379	
   380			if (stack_start) {
   381				if (is_compat_thread(task_thread_info(p)))
   382					childregs->compat_sp = stack_start;
   383				else
   384					childregs->sp = stack_start;
   385			}
   386	
   387			/*
   388			 * If a TLS pointer was passed to clone, use it for the new
   389			 * thread.  We also reset TPIDR2 if it's in use.
   390			 */
   391			if (clone_flags & CLONE_SETTLS) {
   392				p->thread.uw.tp_value = tls;
   393				p->thread.tpidr2_el0 = 0;
   394			}
   395		} else {
   396			/*
   397			 * A kthread has no context to ERET to, so ensure any buggy
   398			 * ERET is treated as an illegal exception return.
   399			 *
   400			 * When a user task is created from a kthread, childregs will
   401			 * be initialized by start_thread() or start_compat_thread().
   402			 */
   403			memset(childregs, 0, sizeof(struct pt_regs));
   404			childregs->pstate = PSR_MODE_EL1h | PSR_IL_BIT;
   405	
   406			p->thread.cpu_context.x19 = (unsigned long)args->fn;
   407			p->thread.cpu_context.x20 = (unsigned long)args->fn_arg;
   408		}
   409		p->thread.cpu_context.pc = (unsigned long)ret_from_fork;
   410		p->thread.cpu_context.sp = (unsigned long)childregs;
   411		/*
   412		 * For the benefit of the unwinder, set up childregs->stackframe
   413		 * as the final frame for the new task.
   414		 */
   415		p->thread.cpu_context.fp = (unsigned long)childregs->stackframe;
   416	
   417		ptrace_hw_copy_thread(p);
   418	
   419		return 0;
   420	}
   421	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
