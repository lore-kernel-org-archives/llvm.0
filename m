Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8366E622;
	Mon, 27 Mar 2023 03:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679888644; x=1711424644;
  h=date:from:cc:subject:message-id:mime-version;
  bh=GQTgmM4Xb832yVBSVCyEVJDNRzrg9kfGPctLBLAgA0E=;
  b=dk914gWMn2amCtjBdx6srR4329oEwErDe7oVCl2Gac0vAPS/1tNAgDeX
   /oR8oP38XQ8xBUZkgEuo7XkRSZsgfslaTSUNs/bQk6aH4Graayenlrc64
   jE5s8vpSzS14hoqtjEh7gsdqs+FbI3JdMJbFZQA/UCRRBh4KkZS5dcAXq
   iGr1/Uu1mFKeiO6Pd55dOA6jiZwXcSB4QOzjhZX/IY7efBCtKIakMCA/v
   LXfIsSV894bXXrdldil1YV4sVkWIqGYw92x9sEZhjjSsOcDm0DvsBljEW
   VoVUH7gSwy86TKBiQ1NeG6ScA9cnzXQ1LH9Mxw2NxliUH1F6ZD/JN7XT2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="328609743"
X-IronPort-AV: E=Sophos;i="5.98,293,1673942400"; 
   d="scan'208";a="328609743"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2023 20:44:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="715919394"
X-IronPort-AV: E=Sophos;i="5.98,293,1673942400"; 
   d="scan'208";a="715919394"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 26 Mar 2023 20:44:02 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pgdm6-000HWo-11;
	Mon, 27 Mar 2023 03:44:02 +0000
Date: Mon, 27 Mar 2023 11:43:08 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: __ct_user_enter+0x33: call to
 ftrace_likely_update() leaves .noinstr.text section
Message-ID: <202303271143.eUG1UWi1-lkp@intel.com>
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
head:   197b6b60ae7bc51dd0814953c562833143b292aa
commit: 0ffc781a19ed3030c792ad1a0e44e6e047bb9adc context_tracking: Rename __context_tracking_enter/exit() to __ct_user_enter/exit()
date:   9 months ago
config: x86_64-randconfig-a016-20230327 (https://download.01.org/0day-ci/archive/20230327/202303271143.eUG1UWi1-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0ffc781a19ed3030c792ad1a0e44e6e047bb9adc
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 0ffc781a19ed3030c792ad1a0e44e6e047bb9adc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303271143.eUG1UWi1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: __rdgsbase_inactive+0x39: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __wrgsbase_inactive+0x3e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: sync_regs+0x24: call to memcpy() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret+0x7a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: noist_exc_debug+0x59: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi+0x31: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: poke_int3_handler+0x56: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_machine_check+0x49: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_start+0x68: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_machine_check+0x65: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_check_crashing_cpu+0x2e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_idle_enter+0x14: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_eqs_enter+0x41: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_dynticks_eqs_enter+0x1e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_irq_exit+0x39: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_idle_exit+0x3c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_eqs_exit+0x1b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_nmi_enter+0x38: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_dynticks_eqs_exit+0x1e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_irq_enter+0x39: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: enter_from_user_mode+0x50: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode+0x59: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare+0x50: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter_from_user_mode+0x50: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_exit+0x43: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_enter+0x49: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_exit+0x5f: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: __ct_user_enter+0x33: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: context_tracking_recursion_enter+0x42: call to ftrace_likely_update() leaves .noinstr.text section


objdump-func vmlinux.o __ct_user_enter:
0000 00000000000061a0 <__ct_user_enter>:
0000     61a0:	55                   	push   %rbp
0001     61a1:	48 89 e5             	mov    %rsp,%rbp
0004     61a4:	41 57                	push   %r15
0006     61a6:	41 56                	push   %r14
0008     61a8:	41 54                	push   %r12
000a     61aa:	53                   	push   %rbx
000b     61ab:	41 89 fe             	mov    %edi,%r14d
000e     61ae:	65 4c 8b 3c 25 00 00 00 00 	mov    %gs:0x0,%r15	61b3: R_X86_64_32S	current_task
0017     61b7:	4d 8b a7 a0 03 00 00 	mov    0x3a0(%r15),%r12
001e     61be:	31 db                	xor    %ebx,%ebx
0020     61c0:	4d 85 e4             	test   %r12,%r12
0023     61c3:	0f 94 c3             	sete   %bl
0026     61c6:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	61c9: R_X86_64_32S	_ftrace_annotated_branch+0x4e120
002d     61cd:	89 de                	mov    %ebx,%esi
002f     61cf:	31 d2                	xor    %edx,%edx
0031     61d1:	31 c9                	xor    %ecx,%ecx
0033     61d3:	e8 00 00 00 00       	call   61d8 <__ct_user_enter+0x38>	61d4: R_X86_64_PLT32	ftrace_likely_update-0x4
0038     61d8:	4d 85 e4             	test   %r12,%r12
003b     61db:	75 04                	jne    61e1 <__ct_user_enter+0x41>
003d     61dd:	90                   	nop
003e     61de:	0f 0b                	ud2
0040     61e0:	90                   	nop
0041     61e1:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	61e4: R_X86_64_32S	_ftrace_annotated_branch+0x4e150
0048     61e8:	89 de                	mov    %ebx,%esi
004a     61ea:	31 d2                	xor    %edx,%edx
004c     61ec:	31 c9                	xor    %ecx,%ecx
004e     61ee:	e8 00 00 00 00       	call   61f3 <__ct_user_enter+0x53>	61ef: R_X86_64_PLT32	ftrace_likely_update-0x4
0053     61f3:	e8 48 00 00 00       	call   6240 <context_tracking_recursion_enter>
0058     61f8:	84 c0                	test   %al,%al
005a     61fa:	74 3b                	je     6237 <__ct_user_enter+0x97>
005c     61fc:	65 8b 05 00 00 00 00 	mov    %gs:0x0(%rip),%eax        # 6203 <__ct_user_enter+0x63>	61ff: R_X86_64_PC32	context_tracking+0x4
0063     6203:	44 39 f0             	cmp    %r14d,%eax
0066     6206:	74 28                	je     6230 <__ct_user_enter+0x90>
0068     6208:	65 8a 05 00 00 00 00 	mov    %gs:0x0(%rip),%al        # 620f <__ct_user_enter+0x6f>	620b: R_X86_64_PC32	context_tracking-0x4
006f     620f:	41 83 fe 01          	cmp    $0x1,%r14d
0073     6213:	75 13                	jne    6228 <__ct_user_enter+0x88>
0075     6215:	84 c0                	test   %al,%al
0077     6217:	74 0f                	je     6228 <__ct_user_enter+0x88>
0079     6219:	90                   	nop
007a     621a:	e8 00 00 00 00       	call   621f <__ct_user_enter+0x7f>	621b: R_X86_64_PLT32	.text+0x56233c
007f     621f:	4c 89 ff             	mov    %r15,%rdi
0082     6222:	e8 00 00 00 00       	call   6227 <__ct_user_enter+0x87>	6223: R_X86_64_PLT32	vtime_user_enter-0x4
0087     6227:	90                   	nop
0088     6228:	65 44 89 35 00 00 00 00 	mov    %r14d,%gs:0x0(%rip)        # 6230 <__ct_user_enter+0x90>	622c: R_X86_64_PC32	context_tracking+0x4
0090     6230:	65 ff 0d 00 00 00 00 	decl   %gs:0x0(%rip)        # 6237 <__ct_user_enter+0x97>	6233: R_X86_64_PC32	context_tracking
0097     6237:	5b                   	pop    %rbx
0098     6238:	41 5c                	pop    %r12
009a     623a:	41 5e                	pop    %r14
009c     623c:	41 5f                	pop    %r15
009e     623e:	5d                   	pop    %rbp
009f     623f:	c3                   	ret

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
