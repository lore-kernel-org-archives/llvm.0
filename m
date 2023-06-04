Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E0723A5;
	Sun,  4 Jun 2023 14:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685890430; x=1717426430;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bv22rcWPOB8ne9o3z6fajxBtYFUjYsqHFVOlhmtGjU8=;
  b=i+cOrAUqNbcw8upriT5QnVUTzFDy7jMK0scclfi0k/fqnsfVuqeUqLMR
   32QFA30HpTlQGk3sz+VMlQkTJkYPlGtSGW905blLzOGgsix/l5PwT8Or7
   YWFKOLkh4Yp5zkvULda/OrhdO4KDnFWwBTdOxVCcx8vItB2dIKZ/fc/yo
   3L3MBjAqSjhl2+nRW44HQcqqIcVzkzBEEhUqkiMjmJEOMKnKdhZz6U+ng
   U7EHY/0tm2DxSMyMZIrhHCMCETFLxMvW1t80FRJLCS/3Wrzlf56oaW6ZD
   PIgqW1lcq+8T1ISLn+yHLafopLzO5WDYh2k2Lz7f3ndxpwiKOUJt1xnd6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="345781926"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="345781926"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2023 07:53:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="702501156"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="702501156"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 04 Jun 2023 07:53:49 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q5p76-0002vX-0W;
	Sun, 04 Jun 2023 14:53:48 +0000
Date: Sun, 4 Jun 2023 22:53:21 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/220-tso 3/4] arch/arm64/kernel/process.c:695:3:
 error: call to undeclared function 'arch_prctl_mem_model_set'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202306042258.xAYNc9Fd-lkp@intel.com>
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
config: arm64-randconfig-r012-20230604 (https://download.01.org/0day-ci/archive/20230604/202306042258.xAYNc9Fd-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 4faf3aaf28226a4e950c103a14f6fc1d1fdabb1b)
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

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306042258.xAYNc9Fd-lkp@intel.com/

All errors (new ones prefixed by >>):

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
>> arch/arm64/kernel/process.c:695:3: error: call to undeclared function 'arch_prctl_mem_model_set'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   arch_prctl_mem_model_set(current, PR_SET_MEM_MODEL_DEFAULT);
                   ^
   arch/arm64/kernel/process.c:695:3: note: did you mean 'arch_prctl_spec_ctrl_set'?
   include/linux/nospec.h:69:5: note: 'arch_prctl_spec_ctrl_set' declared here
   int arch_prctl_spec_ctrl_set(struct task_struct *task, unsigned long which,
       ^
   4 errors generated.


vim +/arch_prctl_mem_model_set +695 arch/arm64/kernel/process.c

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
