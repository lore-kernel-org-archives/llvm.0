Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C5615A0
	for <llvm@lists.linux.dev>; Tue,  9 Aug 2022 00:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660004318; x=1691540318;
  h=date:from:cc:subject:message-id:mime-version;
  bh=O5y6KJxFxsNs8pbwm3DV4ISHJgQljpE0yhjXL0xmt58=;
  b=R5jpfY+I9EgnuFbpuGxgRgV/NxRLsdUoxm4eBl1Pb5WNv6gFuNwGYWJq
   ftb7MfQXrpXw8f5gN9TKlLHdcbNhF67vXSDaByO/yo59uotFZm+suFtXM
   VKKXEG8jHSC8iN7N3nE9hmgaLe4iz4TsfsuYkGxyIAXtK8jZDWD9NFqXE
   jxzBG7McxIewrPgVrog3ohRAMT7sOlIre2Vdbk4TwXHa3XGpDpWwpPC4y
   SbcLnLwmisUiBlPW38fkh/gVa6g6VdmFXncb8pPSh4ndOkk9JyYZ9+jqh
   aUOHwUKoWqny5dB6zYM1GHBv+qzGb3OfjiRxsyz7DeUPGQe0uVwLVdUxK
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10433"; a="289476967"
X-IronPort-AV: E=Sophos;i="5.93,223,1654585200"; 
   d="scan'208";a="289476967"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2022 17:18:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,223,1654585200"; 
   d="scan'208";a="633118488"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 08 Aug 2022 17:18:36 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oLCx9-000MbV-1t;
	Tue, 09 Aug 2022 00:18:35 +0000
Date: Tue, 9 Aug 2022 08:17:53 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: __ct_user_enter+0x2f: call to
 ftrace_likely_update() leaves .noinstr.text section
Message-ID: <202208090859.2gRYTGXq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Frederic Weisbecker <frederic@kernel.org>
CC: "Paul E. McKenney" <paulmck@kernel.org>
CC: Nicolas Saenz Julienne <nsaenzju@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5d5d353bed32dc3ea52e2619e0d1c60b17133b91
commit: 0ffc781a19ed3030c792ad1a0e44e6e047bb9adc context_tracking: Rename __context_tracking_enter/exit() to __ct_user_enter/exit()
date:   7 weeks ago
config: x86_64-randconfig-a014-20220808 (https://download.01.org/0day-ci/archive/20220809/202208090859.2gRYTGXq-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e2cc5a3c07cbc2412e851a7283c1841f520)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0ffc781a19ed3030c792ad1a0e44e6e047bb9adc
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 0ffc781a19ed3030c792ad1a0e44e6e047bb9adc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: kvm_spurious_fault+0x1c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: vmx_update_host_rsp+0x31: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: vmx_vcpu_enter_exit+0x1c3: call to do_trace_write_msr() leaves .noinstr.text section
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
   vmlinux.o: warning: objtool: rcu_idle_enter+0x14: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_eqs_enter+0x41: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_dynticks_eqs_enter+0x1e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_irq_exit+0x39: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_idle_exit+0x58: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_eqs_exit+0x1b: call to ftrace_likely_update() leaves .noinstr.text section
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
>> vmlinux.o: warning: objtool: __ct_user_enter+0x2f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: context_tracking_recursion_enter+0x43: call to ftrace_likely_update() leaves .noinstr.text section


objdump-func vmlinux.o __ct_user_enter:
0000 0000000000007d20 <__ct_user_enter>:
0000     7d20:	55                   	push   %rbp
0001     7d21:	48 89 e5             	mov    %rsp,%rbp
0004     7d24:	41 57                	push   %r15
0006     7d26:	41 56                	push   %r14
0008     7d28:	41 54                	push   %r12
000a     7d2a:	53                   	push   %rbx
000b     7d2b:	41 89 fe             	mov    %edi,%r14d
000e     7d2e:	65 4c 8b 3d 00 00 00 00 	mov    %gs:0x0(%rip),%r15        # 7d36 <__ct_user_enter+0x16>	7d32: R_X86_64_PC32	current_task-0x4
0016     7d36:	4d 8b a7 70 27 00 00 	mov    0x2770(%r15),%r12
001d     7d3d:	31 db                	xor    %ebx,%ebx
001f     7d3f:	4d 85 e4             	test   %r12,%r12
0022     7d42:	0f 94 c3             	sete   %bl
0025     7d45:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	7d48: R_X86_64_32S	_ftrace_annotated_branch+0x59670
002c     7d4c:	89 de                	mov    %ebx,%esi
002e     7d4e:	31 d2                	xor    %edx,%edx
0030     7d50:	31 c9                	xor    %ecx,%ecx
0032     7d52:	e8 00 00 00 00       	call   7d57 <__ct_user_enter+0x37>	7d53: R_X86_64_PLT32	ftrace_likely_update-0x4
0037     7d57:	4d 85 e4             	test   %r12,%r12
003a     7d5a:	75 04                	jne    7d60 <__ct_user_enter+0x40>
003c     7d5c:	90                   	nop
003d     7d5d:	0f 0b                	ud2    
003f     7d5f:	90                   	nop
0040     7d60:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	7d63: R_X86_64_32S	_ftrace_annotated_branch+0x596a0
0047     7d67:	89 de                	mov    %ebx,%esi
0049     7d69:	31 d2                	xor    %edx,%edx
004b     7d6b:	31 c9                	xor    %ecx,%ecx
004d     7d6d:	e8 00 00 00 00       	call   7d72 <__ct_user_enter+0x52>	7d6e: R_X86_64_PLT32	ftrace_likely_update-0x4
0052     7d72:	e8 49 00 00 00       	call   7dc0 <context_tracking_recursion_enter>
0057     7d77:	84 c0                	test   %al,%al
0059     7d79:	74 3b                	je     7db6 <__ct_user_enter+0x96>
005b     7d7b:	65 8b 05 00 00 00 00 	mov    %gs:0x0(%rip),%eax        # 7d82 <__ct_user_enter+0x62>	7d7e: R_X86_64_PC32	context_tracking+0x4
0062     7d82:	44 39 f0             	cmp    %r14d,%eax
0065     7d85:	74 28                	je     7daf <__ct_user_enter+0x8f>
0067     7d87:	65 8a 05 00 00 00 00 	mov    %gs:0x0(%rip),%al        # 7d8e <__ct_user_enter+0x6e>	7d8a: R_X86_64_PC32	context_tracking-0x4
006e     7d8e:	41 83 fe 01          	cmp    $0x1,%r14d
0072     7d92:	75 13                	jne    7da7 <__ct_user_enter+0x87>
0074     7d94:	84 c0                	test   %al,%al
0076     7d96:	74 0f                	je     7da7 <__ct_user_enter+0x87>
0078     7d98:	90                   	nop
0079     7d99:	e8 00 00 00 00       	call   7d9e <__ct_user_enter+0x7e>	7d9a: R_X86_64_PLT32	.text+0x7c53cc
007e     7d9e:	4c 89 ff             	mov    %r15,%rdi
0081     7da1:	e8 00 00 00 00       	call   7da6 <__ct_user_enter+0x86>	7da2: R_X86_64_PLT32	vtime_user_enter-0x4
0086     7da6:	90                   	nop
0087     7da7:	65 44 89 35 00 00 00 00 	mov    %r14d,%gs:0x0(%rip)        # 7daf <__ct_user_enter+0x8f>	7dab: R_X86_64_PC32	context_tracking+0x4
008f     7daf:	65 ff 0d 00 00 00 00 	decl   %gs:0x0(%rip)        # 7db6 <__ct_user_enter+0x96>	7db2: R_X86_64_PC32	context_tracking
0096     7db6:	5b                   	pop    %rbx
0097     7db7:	41 5c                	pop    %r12
0099     7db9:	41 5e                	pop    %r14
009b     7dbb:	41 5f                	pop    %r15
009d     7dbd:	5d                   	pop    %rbp
009e     7dbe:	c3                   	ret    
009f     7dbf:	90                   	nop

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
