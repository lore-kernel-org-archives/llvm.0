Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D5B7C;
	Mon, 24 Apr 2023 04:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682310042; x=1713846042;
  h=date:from:cc:subject:message-id:mime-version;
  bh=yW6kFfttMJiqIfN8yN7kDT3N4o8hTOhcLtfdwzk16yQ=;
  b=FlT9I/o1EHCF+cR+EDmFgCKXozo97vEYOZSbaI+h4faBaGRPd033ES9t
   w7u2kNIY43r19dynVSRDW9se8Y2QD6bDjCRTIzPblPSOsjRPD2yr3PoLK
   P7/qm/8xuA+UJFKj1WtVQuLfT9D0A/dn6EUU/RfuQnBZSnhgusOnWk2hk
   UxQ+hfIVIXourZk55MHTcAvxNZa/dU7No1GBdqQQ6mYKAyDmKIwPdVM/n
   gKYJLnnVBWIzXEucx9h4HtE1yCH+/yBn0gvqRDm/E4Hs8HQpfunLYg+YD
   9fsYSakb/Q1xmXQ/atSC/RV8JFq3KiSFiEfmIbtyCQ9Wh3bCIwlZSsR1f
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="374300564"
X-IronPort-AV: E=Sophos;i="5.99,221,1677571200"; 
   d="scan'208";a="374300564"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2023 21:20:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="725545662"
X-IronPort-AV: E=Sophos;i="5.99,221,1677571200"; 
   d="scan'208";a="725545662"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 23 Apr 2023 21:20:40 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqngt-000iGi-2F;
	Mon, 24 Apr 2023 04:20:39 +0000
Date: Mon, 24 Apr 2023 12:19:52 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: ct_irq_enter+0x35: call to
 ftrace_likely_update() leaves .noinstr.text section
Message-ID: <202304241253.Ktu9jZA6-lkp@intel.com>
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
head:   457391b0380335d5e9a5babdec90ac53928b23b4
commit: 3864caafe7c66f01b188ffccb6a4215f3bf56292 rcu/context-tracking: Remove rcu_irq_enter/exit()
date:   10 months ago
config: x86_64-randconfig-a001-20230424 (https://download.01.org/0day-ci/archive/20230424/202304241253.Ktu9jZA6-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3864caafe7c66f01b188ffccb6a4215f3bf56292
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 3864caafe7c66f01b188ffccb6a4215f3bf56292
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304241253.Ktu9jZA6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: kvm_spurious_fault+0x18: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: vmx_update_host_rsp+0x2b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: vmx_vcpu_enter_exit+0x177: call to do_trace_write_msr() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __rdgsbase_inactive+0x35: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __wrgsbase_inactive+0x39: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret+0x32: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: noist_exc_debug+0x4e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi+0x2f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: poke_int3_handler+0x4e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_machine_check+0xd2: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_machine_check+0x4e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_check_crashing_cpu+0x28: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_idle_enter+0x46: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_eqs_enter+0x42: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_user_enter+0x35: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_dynticks_eqs_enter+0x2e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_idle_exit+0x57: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_eqs_exit+0x4b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_nmi_enter+0x2f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_dynticks_eqs_exit+0x35: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: enter_from_user_mode+0x58: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode+0x5e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare+0x58: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter_from_user_mode+0x58: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_exit+0x3e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_enter+0x43: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_exit+0x5c: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: ct_irq_enter+0x35: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: ct_irq_exit+0x35: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __ct_user_enter+0x2f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: context_tracking_recursion_enter+0x3b: call to ftrace_likely_update() leaves .noinstr.text section


objdump-func vmlinux.o ct_irq_enter:
0000 00000000000065c0 <ct_irq_enter>:
0000     65c0:	53                   	push   %rbx
0001     65c1:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0(%rip)        # 65c8 <ct_irq_enter+0x8>	65c3: R_X86_64_PC32	debug_locks-0x5
0008     65c8:	74 0b                	je     65d5 <ct_irq_enter+0x15>
000a     65ca:	65 8b 05 00 00 00 00 	mov    %gs:0x0(%rip),%eax        # 65d1 <ct_irq_enter+0x11>	65cd: R_X86_64_PC32	lockdep_recursion-0x4
0011     65d1:	85 c0                	test   %eax,%eax
0013     65d3:	74 04                	je     65d9 <ct_irq_enter+0x19>
0015     65d5:	31 c0                	xor    %eax,%eax
0017     65d7:	eb 0c                	jmp    65e5 <ct_irq_enter+0x25>
0019     65d9:	65 8b 05 00 00 00 00 	mov    %gs:0x0(%rip),%eax        # 65e0 <ct_irq_enter+0x20>	65dc: R_X86_64_PC32	hardirqs_enabled-0x4
0020     65e0:	85 c0                	test   %eax,%eax
0022     65e2:	0f 95 c0             	setne  %al
0025     65e5:	0f b6 d8             	movzbl %al,%ebx
0028     65e8:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	65eb: R_X86_64_32S	_ftrace_annotated_branch+0x65430
002f     65ef:	89 de                	mov    %ebx,%esi
0031     65f1:	31 d2                	xor    %edx,%edx
0033     65f3:	31 c9                	xor    %ecx,%ecx
0035     65f5:	e8 00 00 00 00       	call   65fa <ct_irq_enter+0x3a>	65f6: R_X86_64_PLT32	ftrace_likely_update-0x4
003a     65fa:	84 db                	test   %bl,%bl
003c     65fc:	74 04                	je     6602 <ct_irq_enter+0x42>
003e     65fe:	90                   	nop
003f     65ff:	0f 0b                	ud2
0041     6601:	90                   	nop
0042     6602:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	6605: R_X86_64_32S	_ftrace_annotated_branch+0x65460
0049     6609:	89 de                	mov    %ebx,%esi
004b     660b:	31 d2                	xor    %edx,%edx
004d     660d:	31 c9                	xor    %ecx,%ecx
004f     660f:	e8 00 00 00 00       	call   6614 <ct_irq_enter+0x54>	6610: R_X86_64_PLT32	ftrace_likely_update-0x4
0054     6614:	5b                   	pop    %rbx
0055     6615:	e9 00 00 00 00       	jmp    661a <ct_irq_enter+0x5a>	6616: R_X86_64_PLT32	ct_nmi_enter-0x4
005a     661a:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
0064     6624:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
006e     662e:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
0078     6638:	0f 1f 84 00 00 00 00 00 	nopl   0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
