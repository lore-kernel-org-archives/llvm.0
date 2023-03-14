Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B9CA939;
	Tue, 14 Mar 2023 20:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678825193; x=1710361193;
  h=date:from:cc:subject:message-id:mime-version;
  bh=JEl8/wy2qK43TQiL3vCHxD70iC1PEEU3+qSfQGppEjk=;
  b=dcsf/RS21S2t7kxPuTkEHneqTSnfViC4zm7xF4/bCiWc1g8cZPZCkW1g
   s5nxUd0iFKATU94u8CvAgEsdk2MYdYA4wIFu8c7LkphKxry68i3nHWTZp
   vsWskhEK/zb4DKGfO64unUc2XwkpefTcuVskfvm+9z3+DHXrrZShjl1wq
   502QvHxaocj4xx4X8vCT2kdJ61WEE/4rxrhN6YUxIEy2AdBSKOjPsU1Lm
   r/aISTc97WFQDunkoBZmE1iYepiJR26S/yQTvCXxAIl8h/yJVTrbt3vRQ
   17gL3/nHA3fKSBzIhDYZgW2/EoWdrsBXSh+s/XqSJzC171Ts5x6sifnlc
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="339075169"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="339075169"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 13:19:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="629181740"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="629181740"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 14 Mar 2023 13:19:50 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcB7e-0007Ae-1A;
	Tue, 14 Mar 2023 20:19:50 +0000
Date: Wed, 15 Mar 2023 04:19:23 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: ct_nmi_enter+0x39: call to
 ftrace_likely_update() leaves .noinstr.text section
Message-ID: <202303150410.ASd9qnyb-lkp@intel.com>
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

Hi Frederic,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4979bf8668255a67449714653314662fbc7e5bdb
commit: c33ef43a359001415032665dfcd433979c462b71 rcu/context-tracking: Remove unused and/or unecessary middle functions
date:   8 months ago
config: x86_64-randconfig-k001-20230313 (https://download.01.org/0day-ci/archive/20230315/202303150410.ASd9qnyb-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c33ef43a359001415032665dfcd433979c462b71
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout c33ef43a359001415032665dfcd433979c462b71
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303150410.ASd9qnyb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: __rdgsbase_inactive+0x35: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __wrgsbase_inactive+0x39: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret+0x87: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: noist_exc_debug+0x4e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi+0x2f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: poke_int3_handler+0x4e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_machine_check+0x56: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_start+0x6b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_machine_check+0x4e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_check_crashing_cpu+0x28: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: enter_from_user_mode+0x4a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode+0x55: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare+0x4a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter_from_user_mode+0x4a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_exit+0x3e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_enter+0x43: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_exit+0x5c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_dynticks_eqs_enter+0x2e: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: ct_nmi_enter+0x39: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_dynticks_eqs_exit+0x29: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: ct_idle_enter+0x38: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_eqs_enter+0x3c: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: ct_idle_exit+0x43: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_eqs_exit+0x4a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_irq_enter+0x35: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_irq_exit+0x35: call to ftrace_likely_update() leaves .noinstr.text section


objdump-func vmlinux.o ct_nmi_enter:
0000 00000000000044aa <ct_nmi_enter>:
0000     44aa:	41 57                	push   %r15
0002     44ac:	41 56                	push   %r14
0004     44ae:	41 54                	push   %r12
0006     44b0:	53                   	push   %rbx
0007     44b1:	49 c7 c7 00 00 00 00 	mov    $0x0,%r15	44b4: R_X86_64_32S	context_tracking
000e     44b8:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	44bb: R_X86_64_32S	context_tracking
0015     44bf:	65 4c 03 35 00 00 00 00 	add    %gs:0x0(%rip),%r14        # 44c7 <ct_nmi_enter+0x1d>	44c3: R_X86_64_PC32	this_cpu_off-0x4
001d     44c7:	65 4c 8b 25 00 00 00 00 	mov    %gs:0x0(%rip),%r12        # 44cf <ct_nmi_enter+0x25>	44cb: R_X86_64_PC32	context_tracking+0xc
0025     44cf:	4c 89 e3             	mov    %r12,%rbx
0028     44d2:	48 c1 eb 3f          	shr    $0x3f,%rbx
002c     44d6:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	44d9: R_X86_64_32S	_ftrace_annotated_branch+0x47670
0033     44dd:	89 de                	mov    %ebx,%esi
0035     44df:	31 d2                	xor    %edx,%edx
0037     44e1:	31 c9                	xor    %ecx,%ecx
0039     44e3:	e8 00 00 00 00       	call   44e8 <ct_nmi_enter+0x3e>	44e4: R_X86_64_PLT32	ftrace_likely_update-0x4
003e     44e8:	4d 85 e4             	test   %r12,%r12
0041     44eb:	79 04                	jns    44f1 <ct_nmi_enter+0x47>
0043     44ed:	90                   	nop
0044     44ee:	0f 0b                	ud2
0046     44f0:	90                   	nop
0047     44f1:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	44f4: R_X86_64_32S	_ftrace_annotated_branch+0x476a0
004e     44f8:	89 de                	mov    %ebx,%esi
0050     44fa:	31 d2                	xor    %edx,%edx
0052     44fc:	31 c9                	xor    %ecx,%ecx
0054     44fe:	e8 00 00 00 00       	call   4503 <ct_nmi_enter+0x59>	44ff: R_X86_64_PLT32	ftrace_likely_update-0x4
0059     4503:	65 4c 03 3d 00 00 00 00 	add    %gs:0x0(%rip),%r15        # 450b <ct_nmi_enter+0x61>	4507: R_X86_64_PC32	this_cpu_off-0x4
0061     450b:	41 8b 0f             	mov    (%r15),%ecx
0064     450e:	65 8b 05 00 00 00 00 	mov    %gs:0x0(%rip),%eax        # 4515 <ct_nmi_enter+0x6b>	4511: R_X86_64_PC32	__preempt_count-0x4
006b     4515:	f6 c1 01             	test   $0x1,%cl
006e     4518:	75 0d                	jne    4527 <ct_nmi_enter+0x7d>
0070     451a:	e8 49 00 00 00       	call   4568 <rcu_dynticks_eqs_exit>
0075     451f:	90                   	nop
0076     4520:	b8 01 00 00 00       	mov    $0x1,%eax
007b     4525:	eb 10                	jmp    4537 <ct_nmi_enter+0x8d>
007d     4527:	a9 00 00 f0 00       	test   $0xf00000,%eax
0082     452c:	74 03                	je     4531 <ct_nmi_enter+0x87>
0084     452e:	90                   	nop
0085     452f:	eb 01                	jmp    4532 <ct_nmi_enter+0x88>
0087     4531:	90                   	nop
0088     4532:	b8 02 00 00 00       	mov    $0x2,%eax
008d     4537:	65 48 8b 0d 00 00 00 00 	mov    %gs:0x0(%rip),%rcx        # 453f <ct_nmi_enter+0x95>	453b: R_X86_64_PC32	context_tracking+0xc
0095     453f:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	4542: R_X86_64_32S	context_tracking
009c     4546:	65 48 03 0d 00 00 00 00 	add    %gs:0x0(%rip),%rcx        # 454e <ct_nmi_enter+0xa4>	454a: R_X86_64_PC32	this_cpu_off-0x4
00a4     454e:	8b 09                	mov    (%rcx),%ecx
00a6     4550:	90                   	nop
00a7     4551:	65 48 8b 0d 00 00 00 00 	mov    %gs:0x0(%rip),%rcx        # 4559 <ct_nmi_enter+0xaf>	4555: R_X86_64_PC32	context_tracking+0xc
00af     4559:	48 01 c1             	add    %rax,%rcx
00b2     455c:	49 89 4e 10          	mov    %rcx,0x10(%r14)
00b6     4560:	5b                   	pop    %rbx
00b7     4561:	41 5c                	pop    %r12
00b9     4563:	41 5e                	pop    %r14
00bb     4565:	41 5f                	pop    %r15
00bd     4567:	c3                   	ret

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
