Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB7B28EA
	for <llvm@lists.linux.dev>; Mon,  8 Aug 2022 12:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659961105; x=1691497105;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Wd2pPvLYSC64iyI20sY6Z7jVRe5JMeJOBmd2jQh+WO4=;
  b=KnbOAQz29J6FHGGdIcn451PzypqoIjjVt8QWdFL1iYEwF0GhrQITd6t7
   QmBHfU5MIppbU5VZYX2R+2mJz3DvBw8AaTSe2BDy+CAnDLpY5QCEnJqK7
   CA6yO27p/E6vizOMM5JoxHAg80S+/4MQ4BOauQ7f1LXR+HS/fGJQ1Jrz0
   N+y9SiYoueXq1DAoMWIppazZpa3Iq7CXL0/Z979/ugaU72WbQOAHFKgRq
   qCOt9PG0qU7zTDqF1bHMCIfZ8sWp8xuxXT1CSGWaLThLOue7zpS0pJ5Pu
   FtbPnR/QZ8NM7GR+he9g3XyMPOYwOUNqDpAPFuB+Vl6/Fpb0Pa+0KiEJ2
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10432"; a="291355976"
X-IronPort-AV: E=Sophos;i="5.93,222,1654585200"; 
   d="scan'208";a="291355976"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2022 05:18:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,222,1654585200"; 
   d="scan'208";a="632869289"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 08 Aug 2022 05:18:23 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oL1iB-000MHB-17;
	Mon, 08 Aug 2022 12:18:23 +0000
Date: Mon, 8 Aug 2022 20:17:32 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [peterz-queue:sched/idle 15/37] vmlinux.o: warning: objtool:
 rcu_idle_enter+0x39: call to ftrace_likely_update() leaves .noinstr.text
 section
Message-ID: <202208082021.0ANdsRTq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/idle
head:   769b3ef979a1016d45e34b71df278f51ae32271d
commit: 78ac8fb445441a053323ad3f259a0dd6b3fa0605 [15/37] rcu: Fix rcu_idle_exit()
config: x86_64-randconfig-a014-20220808 (https://download.01.org/0day-ci/archive/20220808/202208082021.0ANdsRTq-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e2cc5a3c07cbc2412e851a7283c1841f520)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=78ac8fb445441a053323ad3f259a0dd6b3fa0605
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue sched/idle
        git checkout 78ac8fb445441a053323ad3f259a0dd6b3fa0605
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: kvm_spurious_fault+0x1c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: vmx_update_host_rsp+0x31: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __rdgsbase_inactive+0x39: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __wrgsbase_inactive+0x3e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: sync_regs+0x24: call to memcpy() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret+0x36: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: noist_exc_debug+0x54: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi+0x33: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: poke_int3_handler+0x56: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_machine_check+0xbe: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_machine_check+0x54: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_check_crashing_cpu+0x2e: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: rcu_idle_enter+0x39: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_eqs_enter+0x41: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_dynticks_eqs_enter+0x1e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_irq_exit+0x39: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: rcu_idle_exit+0x39: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_eqs_exit+0x3f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_nmi_enter+0x38: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_dynticks_eqs_exit+0x1e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_irq_enter+0x39: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: enter_from_user_mode+0x5e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode+0x67: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare+0x5e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter_from_user_mode+0x5e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_exit+0x43: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_enter+0x48: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_exit+0x5f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __context_tracking_enter+0x32: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: context_tracking_recursion_enter+0x43: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_idle_enter+0x63: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_idle_enter_s2idle+0x84: call to acpi_idle_do_entry() leaves .noinstr.text section


objdump-func vmlinux.o rcu_idle_enter:
0000 0000000000006530 <rcu_idle_enter>:
0000     6530:	55                   	push   %rbp
0001     6531:	48 89 e5             	mov    %rsp,%rbp
0004     6534:	53                   	push   %rbx
0005     6535:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0(%rip)        # 653c <rcu_idle_enter+0xc>	6537: R_X86_64_PC32	debug_locks-0x5
000c     653c:	74 0b                	je     6549 <rcu_idle_enter+0x19>
000e     653e:	65 8b 05 00 00 00 00 	mov    %gs:0x0(%rip),%eax        # 6545 <rcu_idle_enter+0x15>	6541: R_X86_64_PC32	lockdep_recursion-0x4
0015     6545:	85 c0                	test   %eax,%eax
0017     6547:	74 04                	je     654d <rcu_idle_enter+0x1d>
0019     6549:	31 c0                	xor    %eax,%eax
001b     654b:	eb 0c                	jmp    6559 <rcu_idle_enter+0x29>
001d     654d:	65 8b 05 00 00 00 00 	mov    %gs:0x0(%rip),%eax        # 6554 <rcu_idle_enter+0x24>	6550: R_X86_64_PC32	hardirqs_enabled-0x4
0024     6554:	85 c0                	test   %eax,%eax
0026     6556:	0f 95 c0             	setne  %al
0029     6559:	0f b6 d8             	movzbl %al,%ebx
002c     655c:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	655f: R_X86_64_32S	_ftrace_annotated_branch+0x408f0
0033     6563:	89 de                	mov    %ebx,%esi
0035     6565:	31 d2                	xor    %edx,%edx
0037     6567:	31 c9                	xor    %ecx,%ecx
0039     6569:	e8 00 00 00 00       	call   656e <rcu_idle_enter+0x3e>	656a: R_X86_64_PLT32	ftrace_likely_update-0x4
003e     656e:	84 db                	test   %bl,%bl
0040     6570:	74 04                	je     6576 <rcu_idle_enter+0x46>
0042     6572:	90                   	nop
0043     6573:	0f 0b                	ud2    
0045     6575:	90                   	nop
0046     6576:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	6579: R_X86_64_32S	_ftrace_annotated_branch+0x40920
004d     657d:	89 de                	mov    %ebx,%esi
004f     657f:	31 d2                	xor    %edx,%edx
0051     6581:	31 c9                	xor    %ecx,%ecx
0053     6583:	e8 00 00 00 00       	call   6588 <rcu_idle_enter+0x58>	6584: R_X86_64_PLT32	ftrace_likely_update-0x4
0058     6588:	e8 03 00 00 00       	call   6590 <rcu_eqs_enter>
005d     658d:	5b                   	pop    %rbx
005e     658e:	5d                   	pop    %rbp
005f     658f:	c3                   	ret    

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
