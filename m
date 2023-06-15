Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28691625;
	Thu, 15 Jun 2023 03:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686800811; x=1718336811;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WIiPAbrQ0w8uU3ZJFYZCiKo8+/sRF2obIzCIft7wiZc=;
  b=KAIw06wq73nYPwTlN+de47xz8bBcIH4w7SaXJufknSfylZXPxY7p2H2n
   wORpeyTyHTNZBcqvqYt99MapBjRjyYAJfuzx8g1/on4lAg182wnW2lcsT
   s3xcWkhOfPxNHm8U1LR4sdS0PBHeA7EIxNBstHfAl4e7twgYqTl/c37eK
   8q0Vp6DagzMORFT8B2skO0ZjlfN2JbAtwMyOY46hJG/suUHqkA2yp629j
   7twVq1LahEzQIttHooRx65fWAyBpas8c8mtJ4p7JLr+HT9EHjfeLWdG4K
   JLGpdvWlJ6Gb16v/CoT6K3oQIfgHPWsyTJ+R5BGwuNRxDHqGJv1Om8+TI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="387220337"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; 
   d="scan'208";a="387220337"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2023 20:46:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="825084312"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; 
   d="scan'208";a="825084312"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 14 Jun 2023 20:46:49 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9dwe-0001Ny-1Y;
	Thu, 15 Jun 2023 03:46:48 +0000
Date: Thu, 15 Jun 2023 11:46:42 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/220-tso 3/4] arch/arm64/kernel/process.c:695:3:
 error: implicit declaration of function 'arch_prctl_mem_model_set' is
 invalid in C99
Message-ID: <202306151118.7h5k5TiS-lkp@intel.com>
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
commit: 4ab692b22440dd1d9203e939a10fb9d5919b54d8 [3/4] arm64: Implement PR_{GET,SET}_MEM_MODEL for always-TSO CPUs
config: arm64-randconfig-r031-20230612 (https://download.01.org/0day-ci/archive/20230615/202306151118.7h5k5TiS-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/AsahiLinux/linux/commit/4ab692b22440dd1d9203e939a10fb9d5919b54d8
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/220-tso
        git checkout 4ab692b22440dd1d9203e939a10fb9d5919b54d8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kernel/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306151118.7h5k5TiS-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> arch/arm64/kernel/cpufeature_impdef.c:11:6: warning: no previous prototype for function 'has_tso_fixed' [-Wmissing-prototypes]
   bool has_tso_fixed(const struct arm64_cpu_capabilities *entry, int scope)
        ^
   arch/arm64/kernel/cpufeature_impdef.c:11:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool has_tso_fixed(const struct arm64_cpu_capabilities *entry, int scope)
   ^
   static 
>> arch/arm64/kernel/cpufeature_impdef.c:36:13: warning: no previous prototype for function 'init_cpu_hwcaps_indirect_list_impdef' [-Wmissing-prototypes]
   void __init init_cpu_hwcaps_indirect_list_impdef(void)
               ^
   arch/arm64/kernel/cpufeature_impdef.c:36:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init init_cpu_hwcaps_indirect_list_impdef(void)
   ^
   static 
   2 warnings generated.
--
>> arch/arm64/kernel/cpufeature.c:952:1: warning: no previous prototype for function 'init_cpu_hwcaps_indirect_list_from_array' [-Wmissing-prototypes]
   init_cpu_hwcaps_indirect_list_from_array(const struct arm64_cpu_capabilities *caps)
   ^
   arch/arm64/kernel/cpufeature.c:951:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init
   ^
   static 
>> arch/arm64/kernel/cpufeature.c:1421:1: warning: no previous prototype for function 'feature_matches' [-Wmissing-prototypes]
   feature_matches(u64 reg, const struct arm64_cpu_capabilities *entry)
   ^
   arch/arm64/kernel/cpufeature.c:1420:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool
   ^
   static 
   2 warnings generated.
--
   arch/arm64/kernel/process.c:378:14: error: no member named 'actlr' in 'struct thread_struct'
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
>> arch/arm64/kernel/process.c:695:3: error: implicit declaration of function 'arch_prctl_mem_model_set' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   arch_prctl_mem_model_set(current, PR_SET_MEM_MODEL_DEFAULT);
                   ^
   arch/arm64/kernel/process.c:695:3: note: did you mean 'arch_prctl_spec_ctrl_set'?
   include/linux/nospec.h:69:5: note: 'arch_prctl_spec_ctrl_set' declared here
   int arch_prctl_spec_ctrl_set(struct task_struct *task, unsigned long which,
       ^
   4 errors generated.


vim +/arch_prctl_mem_model_set +695 arch/arm64/kernel/process.c

   521	
   522	/*
   523	 * IMPDEF control register ACTLR_EL1 handling. Some CPUs use this to
   524	 * expose features that can be controlled by userspace.
   525	 */
   526	static void actlr_thread_switch(struct task_struct *next)
   527	{
   528		if (!system_has_actlr_state())
   529			return;
   530	
 > 531		current->thread.actlr = read_sysreg(actlr_el1);
   532		write_sysreg(next->thread.actlr, actlr_el1);
   533	}
   534	
   535	#ifdef CONFIG_ARM64_MEMORY_MODEL_CONTROL
   536	int arch_prctl_mem_model_get(struct task_struct *t)
   537	{
   538		return PR_SET_MEM_MODEL_DEFAULT;
   539	}
   540	
   541	int arch_prctl_mem_model_set(struct task_struct *t, unsigned long val)
   542	{
   543		if (cpus_have_const_cap(ARM64_HAS_TSO_FIXED) &&
   544		    val == PR_SET_MEM_MODEL_TSO)
   545			return 0;
   546	
   547		if (val == PR_SET_MEM_MODEL_DEFAULT)
   548			return 0;
   549	
   550		return -EINVAL;
   551	}
   552	#endif
   553	
   554	/*
   555	 * Thread switching.
   556	 */
   557	__notrace_funcgraph __sched
   558	struct task_struct *__switch_to(struct task_struct *prev,
   559					struct task_struct *next)
   560	{
   561		struct task_struct *last;
   562	
   563		fpsimd_thread_switch(next);
   564		tls_thread_switch(next);
   565		hw_breakpoint_thread_switch(next);
   566		contextidr_thread_switch(next);
   567		entry_task_switch(next);
   568		ssbs_thread_switch(next);
   569		erratum_1418040_thread_switch(next);
   570		ptrauth_thread_switch_user(next);
   571		actlr_thread_switch(next);
   572	
   573		/*
   574		 * Complete any pending TLB or cache maintenance on this CPU in case
   575		 * the thread migrates to a different CPU.
   576		 * This full barrier is also required by the membarrier system
   577		 * call.
   578		 */
   579		dsb(ish);
   580	
   581		/*
   582		 * MTE thread switching must happen after the DSB above to ensure that
   583		 * any asynchronous tag check faults have been logged in the TFSR*_EL1
   584		 * registers.
   585		 */
   586		mte_thread_switch(next);
   587		/* avoid expensive SCTLR_EL1 accesses if no change */
   588		if (prev->thread.sctlr_user != next->thread.sctlr_user)
   589			update_sctlr_el1(next->thread.sctlr_user);
   590	
   591		/* the actual thread switch */
   592		last = cpu_switch_to(prev, next);
   593	
   594		return last;
   595	}
   596	
   597	struct wchan_info {
   598		unsigned long	pc;
   599		int		count;
   600	};
   601	
   602	static bool get_wchan_cb(void *arg, unsigned long pc)
   603	{
   604		struct wchan_info *wchan_info = arg;
   605	
   606		if (!in_sched_functions(pc)) {
   607			wchan_info->pc = pc;
   608			return false;
   609		}
   610		return wchan_info->count++ < 16;
   611	}
   612	
   613	unsigned long __get_wchan(struct task_struct *p)
   614	{
   615		struct wchan_info wchan_info = {
   616			.pc = 0,
   617			.count = 0,
   618		};
   619	
   620		if (!try_get_task_stack(p))
   621			return 0;
   622	
   623		arch_stack_walk(get_wchan_cb, &wchan_info, p, NULL);
   624	
   625		put_task_stack(p);
   626	
   627		return wchan_info.pc;
   628	}
   629	
   630	unsigned long arch_align_stack(unsigned long sp)
   631	{
   632		if (!(current->personality & ADDR_NO_RANDOMIZE) && randomize_va_space)
   633			sp -= get_random_u32_below(PAGE_SIZE);
   634		return sp & ~0xf;
   635	}
   636	
   637	#ifdef CONFIG_COMPAT
   638	int compat_elf_check_arch(const struct elf32_hdr *hdr)
   639	{
   640		if (!system_supports_32bit_el0())
   641			return false;
   642	
   643		if ((hdr)->e_machine != EM_ARM)
   644			return false;
   645	
   646		if (!((hdr)->e_flags & EF_ARM_EABI_MASK))
   647			return false;
   648	
   649		/*
   650		 * Prevent execve() of a 32-bit program from a deadline task
   651		 * if the restricted affinity mask would be inadmissible on an
   652		 * asymmetric system.
   653		 */
   654		return !static_branch_unlikely(&arm64_mismatched_32bit_el0) ||
   655		       !dl_task_check_affinity(current, system_32bit_el0_cpumask());
   656	}
   657	#endif
   658	
   659	/*
   660	 * Called from setup_new_exec() after (COMPAT_)SET_PERSONALITY.
   661	 */
   662	void arch_setup_new_exec(void)
   663	{
   664		unsigned long mmflags = 0;
   665	
   666		if (is_compat_task()) {
   667			mmflags = MMCF_AARCH32;
   668	
   669			/*
   670			 * Restrict the CPU affinity mask for a 32-bit task so that
   671			 * it contains only 32-bit-capable CPUs.
   672			 *
   673			 * From the perspective of the task, this looks similar to
   674			 * what would happen if the 64-bit-only CPUs were hot-unplugged
   675			 * at the point of execve(), although we try a bit harder to
   676			 * honour the cpuset hierarchy.
   677			 */
   678			if (static_branch_unlikely(&arm64_mismatched_32bit_el0))
   679				force_compatible_cpus_allowed_ptr(current);
   680		} else if (static_branch_unlikely(&arm64_mismatched_32bit_el0)) {
   681			relax_compatible_cpus_allowed_ptr(current);
   682		}
   683	
   684		current->mm->context.flags = mmflags;
   685		ptrauth_thread_init_user();
   686		mte_thread_init_user();
   687		erratum_1418040_new_exec();
   688	
   689		if (task_spec_ssb_noexec(current)) {
   690			arch_prctl_spec_ctrl_set(current, PR_SPEC_STORE_BYPASS,
   691						 PR_SPEC_ENABLE);
   692		}
   693	
   694		if (IS_ENABLED(CONFIG_ARM64_MEMORY_MODEL_CONTROL)) {
 > 695			arch_prctl_mem_model_set(current, PR_SET_MEM_MODEL_DEFAULT);
   696		}
   697	}
   698	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
