Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5054D19B;
	Tue,  7 Feb 2023 22:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675809940; x=1707345940;
  h=date:from:cc:subject:message-id:mime-version;
  bh=MqTJPMhZYhgpFcnXsOHuhJxEaetTnBbcRWftVaK0Ido=;
  b=jv3kr/qUFN/jyaZWLtP1+D/7ZGJoxD3qqi+vqdeRE51GkyzVDCxtvY2R
   HxU/DnD+ETDtBdWO2vtyzCpuVUhmZoTyGdECCbjr8reENdjtynez7rbhG
   keYdWNPjoJaXX/0k3U1Xa/StXKSqDZHNX+CorAppSME7P+JUCJ8yihSfh
   uFk4jucsPtxbJEAeieXJ1jbn59HVNnP+Y1pX5yiuyp8XwZfmMnku8R+Dk
   kqW82ISZ7HVxXTc6Y6nfYDGVMOi05z9j4x2ngVLxzmKEZdM6G5xiWvIOm
   2JKhi0+61nlUwnwkANKsUbH8q0QO+0FGQgO/FjWD0xpdAiLlN7vkaY9Rd
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="313292323"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="313292323"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 14:45:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="790970680"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="790970680"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 07 Feb 2023 14:45:38 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPWiX-0003wY-2p;
	Tue, 07 Feb 2023 22:45:37 +0000
Date: Wed, 8 Feb 2023 06:45:22 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [peterz-queue:sched/core-staging 8/10] vmlinux.o: warning: objtool:
 xen_sched_clock+0x47: call to ftrace_likely_update() leaves .noinstr.text
 section
Message-ID: <202302080626.KWtv757S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core-staging
head:   464fa8e861277b168333fb5de5d8a4cf609c84c7
commit: fc6d767f6e2b6efed02041f9f71a14d299aea58c [8/10] x86: Mark sched_clock() noinstr
config: x86_64-buildonly-randconfig-r006-20230206 (https://download.01.org/0day-ci/archive/20230208/202302080626.KWtv757S-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=fc6d767f6e2b6efed02041f9f71a14d299aea58c
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue sched/core-staging
        git checkout fc6d767f6e2b6efed02041f9f71a14d299aea58c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: xen_sched_clock+0x47: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __rdgsbase_inactive+0x34: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __wrgsbase_inactive+0x38: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret+0x98: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: noist_exc_debug+0x51: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi+0x33: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: poke_int3_handler+0x3c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: native_sched_clock+0x71: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_machine_check+0x63: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_machine_check+0x4d: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_check_crashing_cpu+0x2e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: pvclock_clocksource_read_nowd+0x80: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: enter_from_user_mode+0x43: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode+0x4d: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare+0x43: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter_from_user_mode+0x43: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_exit+0x3e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_enter+0x4b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_exit+0x5f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_exit_state+0x27: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_nmi_enter+0x34: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_enter_state+0x27: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_idle_enter+0x14: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_exit+0x47: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_enter+0x2d: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_irq_enter+0x34: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_irq_exit+0x34: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __ct_user_enter+0x4b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: context_tracking_recursion_enter+0x2d: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mwait_idle+0x2d: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_processor_ffh_cstate_enter+0xf4: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_idle_enter+0x49: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_idle_enter_s2idle+0x4b: call to ftrace_likely_update() leaves .noinstr.text section


objdump-func vmlinux.o xen_sched_clock:
0000 00000000000013c0 <xen_sched_clock>:
0000     13c0:	55                   	push   %rbp
0001     13c1:	48 89 e5             	mov    %rsp,%rbp
0004     13c4:	41 57                	push   %r15
0006     13c6:	41 56                	push   %r14
0008     13c8:	53                   	push   %rbx
0009     13c9:	65 ff 05 00 00 00 00 	incl   %gs:0x0(%rip)        # 13d0 <xen_sched_clock+0x10>	13cc: R_X86_64_PC32	pcpu_hot+0x4
0010     13d0:	65 48 8b 3d 00 00 00 00 	mov    %gs:0x0(%rip),%rdi        # 13d8 <xen_sched_clock+0x18>	13d4: R_X86_64_PC32	xen_vcpu-0x4
0018     13d8:	48 83 c7 20          	add    $0x20,%rdi
001c     13dc:	e8 00 00 00 00       	call   13e1 <xen_sched_clock+0x21>	13dd: R_X86_64_PLT32	pvclock_clocksource_read_nowd-0x4
0021     13e1:	4c 8b 35 00 00 00 00 	mov    0x0(%rip),%r14        # 13e8 <xen_sched_clock+0x28>	13e4: R_X86_64_PC32	.data..read_mostly+0x76c
0028     13e8:	31 f6                	xor    %esi,%esi
002a     13ea:	48 89 c3             	mov    %rax,%rbx
002d     13ed:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	13f0: R_X86_64_32S	_ftrace_annotated_branch+0x1110
0034     13f4:	65 ff 0d 00 00 00 00 	decl   %gs:0x0(%rip)        # 13fb <xen_sched_clock+0x3b>	13f7: R_X86_64_PC32	pcpu_hot+0x4
003b     13fb:	41 0f 95 c7          	setne  %r15b
003f     13ff:	40 0f 94 c6          	sete   %sil
0043     1403:	31 d2                	xor    %edx,%edx
0045     1405:	31 c9                	xor    %ecx,%ecx
0047     1407:	e8 00 00 00 00       	call   140c <xen_sched_clock+0x4c>	1408: R_X86_64_PLT32	ftrace_likely_update-0x4
004c     140c:	45 84 ff             	test   %r15b,%r15b
004f     140f:	75 05                	jne    1416 <xen_sched_clock+0x56>
0051     1411:	e8 00 00 00 00       	call   1416 <xen_sched_clock+0x56>	1412: R_X86_64_PLT32	__SCT__preempt_schedule_notrace-0x4
0056     1416:	4c 29 f3             	sub    %r14,%rbx
0059     1419:	48 89 d8             	mov    %rbx,%rax
005c     141c:	5b                   	pop    %rbx
005d     141d:	41 5e                	pop    %r14
005f     141f:	41 5f                	pop    %r15
0061     1421:	5d                   	pop    %rbp
0062     1422:	c3                   	ret
0063     1423:	cc                   	int3
0064     1424:	cc                   	int3
0065     1425:	cc                   	int3
0066     1426:	cc                   	int3
0067     1427:	cc                   	int3
0068     1428:	cc                   	int3
0069     1429:	cc                   	int3
006a     142a:	cc                   	int3
006b     142b:	cc                   	int3
006c     142c:	cc                   	int3
006d     142d:	cc                   	int3
006e     142e:	cc                   	int3
006f     142f:	cc                   	int3
0070     1430:	cc                   	int3
0071     1431:	cc                   	int3
0072     1432:	cc                   	int3
0073     1433:	cc                   	int3
0074     1434:	cc                   	int3
0075     1435:	cc                   	int3
0076     1436:	cc                   	int3
0077     1437:	cc                   	int3
0078     1438:	cc                   	int3
0079     1439:	cc                   	int3
007a     143a:	cc                   	int3
007b     143b:	cc                   	int3
007c     143c:	cc                   	int3
007d     143d:	cc                   	int3
007e     143e:	cc                   	int3
007f     143f:	cc                   	int3

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
