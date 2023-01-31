Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BFF62D;
	Tue, 31 Jan 2023 03:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675134274; x=1706670274;
  h=date:from:cc:subject:message-id:mime-version;
  bh=K7k4V9ziyiPHEtmBVYm4bJh0+QahmBc2W9qwtRY0f4Q=;
  b=euD2R/FtrxWDWLUWChtXUe+IyrH9u2/tvxDw4GqUoeav6K9pelrnJzvt
   u2Eyf7b8PG0jB0MIbEKLww1buyfEuutJ/c8HMtZcUUWGdDvpv1VOjcUAB
   l32pXSvMEW6pbwAWuvzKcYway/W4ww2f42eGTCr5kVoA5Ri6qW5u8L9bA
   xVTbPjCRiHMtoVawkbf97aISBMwTf7eAj0BMjlibTE3w6rXfEuIvawJyn
   iguN3H6rwlHoxsORI5m9bbb/xKEe3cpDzd/KzL0lRqIlm9nrRA8sfGb0+
   V2Pvj4NGZ+cyFLeBk3fJeuCffLzL20n1nVWBV6by8Y9ZTN/CzGXDOuBEU
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="355061037"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="355061037"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 19:04:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="838192602"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="838192602"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 30 Jan 2023 19:04:31 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMgwh-00046I-02;
	Tue, 31 Jan 2023 03:04:31 +0000
Date: Tue, 31 Jan 2023 11:03:54 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [peterz-queue:sched/core-staging 9/10] vmlinux.o: warning: objtool:
 local_clock+0x63: call to ftrace_likely_update() leaves .noinstr.text
 section
Message-ID: <202301311002.f22hJ1vG-lkp@intel.com>
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
commit: 8fa36b65741cddd0cc83f285bdedba46415fc5a9 [9/10] sched/clock: Make local_clock() noinstr
config: x86_64-randconfig-r013-20230130 (https://download.01.org/0day-ci/archive/20230131/202301311002.f22hJ1vG-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=8fa36b65741cddd0cc83f285bdedba46415fc5a9
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue sched/core-staging
        git checkout 8fa36b65741cddd0cc83f285bdedba46415fc5a9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: ftrace_likely_update+0x67b: call to __stack_chk_fail() with UACCESS enabled
   vmlinux.o: warning: objtool: __asan_memset+0x34: call to __memset() with UACCESS enabled
   vmlinux.o: warning: objtool: __asan_memmove+0x54: call to __memmove() with UACCESS enabled
   vmlinux.o: warning: objtool: __asan_memcpy+0x54: call to __memcpy() with UACCESS enabled
   vmlinux.o: warning: objtool: kvm_spurious_fault+0x1c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __rdgsbase_inactive+0x35: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __wrgsbase_inactive+0x39: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret+0x8b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: noist_exc_debug+0x53: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi+0x33: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: poke_int3_handler+0x3b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: native_sched_clock+0x7c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_machine_check+0x5a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_start+0x74: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_machine_check+0x5a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_check_crashing_cpu+0x28: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: pvclock_clocksource_read_nowd+0x8c: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: local_clock+0x63: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: enter_from_user_mode+0x3a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode+0x45: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare+0x3a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter_from_user_mode+0x3a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_exit+0x42: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_enter+0x47: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_exit+0x5a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_exit_state+0x2e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_nmi_enter+0x40: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_enter_state+0x31: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_idle_enter+0x3c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_exit+0x3f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_enter+0x4c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_irq_enter+0x39: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_irq_exit+0x39: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mwait_idle+0x2d: call to ftrace_likely_update() leaves .noinstr.text section


objdump-func vmlinux.o local_clock:
0000 0000000000004480 <local_clock>:
0000     4480:	f3 0f 1e fa          	endbr64
0004     4484:	55                   	push   %rbp
0005     4485:	41 57                	push   %r15
0007     4487:	41 56                	push   %r14
0009     4489:	41 54                	push   %r12
000b     448b:	53                   	push   %rbx
000c     448c:	eb 1b                	jmp    44a9 <local_clock+0x29>
000e     448e:	e8 00 00 00 00       	call   4493 <local_clock+0x13>	448f: R_X86_64_PLT32	sched_clock-0x4
0013     4493:	48 89 c3             	mov    %rax,%rbx
0016     4496:	48 03 1d 00 00 00 00 	add    0x0(%rip),%rbx        # 449d <local_clock+0x1d>	4499: R_X86_64_PC32	__sched_clock_offset-0x4
001d     449d:	48 89 d8             	mov    %rbx,%rax
0020     44a0:	5b                   	pop    %rbx
0021     44a1:	41 5c                	pop    %r12
0023     44a3:	41 5e                	pop    %r14
0025     44a5:	41 5f                	pop    %r15
0027     44a7:	5d                   	pop    %rbp
0028     44a8:	c3                   	ret
0029     44a9:	f3 0f 1e fa          	endbr64
002d     44ad:	65 ff 05 00 00 00 00 	incl   %gs:0x0(%rip)        # 44b4 <local_clock+0x34>	44b0: R_X86_64_PC32	pcpu_hot+0x4
0034     44b4:	49 c7 c7 00 00 00 00 	mov    $0x0,%r15	44b7: R_X86_64_32S	.data..percpu..shared_aligned+0x16c0
003b     44bb:	65 4c 03 3d 00 00 00 00 	add    %gs:0x0(%rip),%r15        # 44c3 <local_clock+0x43>	44bf: R_X86_64_PC32	this_cpu_off-0x4
0043     44c3:	45 31 e4             	xor    %r12d,%r12d
0046     44c6:	e8 00 00 00 00       	call   44cb <local_clock+0x4b>	44c7: R_X86_64_PLT32	sched_clock-0x4
004b     44cb:	49 89 c6             	mov    %rax,%r14
004e     44ce:	4d 2b 37             	sub    (%r15),%r14
0051     44d1:	4c 89 f6             	mov    %r14,%rsi
0054     44d4:	48 c1 ee 3f          	shr    $0x3f,%rsi
0058     44d8:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	44db: R_X86_64_32S	_ftrace_annotated_branch+0x46aa0
005f     44df:	31 d2                	xor    %edx,%edx
0061     44e1:	31 c9                	xor    %ecx,%ecx
0063     44e3:	e8 00 00 00 00       	call   44e8 <local_clock+0x68>	44e4: R_X86_64_PLT32	ftrace_likely_update-0x4
0068     44e8:	4d 85 f6             	test   %r14,%r14
006b     44eb:	4d 0f 48 f4          	cmovs  %r12,%r14
006f     44ef:	49 8b 4f 08          	mov    0x8(%r15),%rcx
0073     44f3:	49 8b 47 10          	mov    0x10(%r15),%rax
0077     44f7:	48 8b 15 00 00 00 00 	mov    0x0(%rip),%rdx        # 44fe <local_clock+0x7e>	44fa: R_X86_64_PC32	.data..read_mostly+0x1344
007e     44fe:	48 8d 1c 0a          	lea    (%rdx,%rcx,1),%rbx
0082     4502:	49 01 de             	add    %rbx,%r14
0085     4505:	48 89 de             	mov    %rbx,%rsi
0088     4508:	48 29 c6             	sub    %rax,%rsi
008b     450b:	48 85 f6             	test   %rsi,%rsi
008e     450e:	48 0f 4e d8          	cmovle %rax,%rbx
0092     4512:	48 01 d1             	add    %rdx,%rcx
0095     4515:	48 81 c1 40 42 0f 00 	add    $0xf4240,%rcx
009c     451c:	48 89 c2             	mov    %rax,%rdx
009f     451f:	48 29 ca             	sub    %rcx,%rdx
00a2     4522:	48 85 d2             	test   %rdx,%rdx
00a5     4525:	48 0f 4f c8          	cmovg  %rax,%rcx
00a9     4529:	4c 89 f2             	mov    %r14,%rdx
00ac     452c:	48 29 da             	sub    %rbx,%rdx
00af     452f:	48 85 d2             	test   %rdx,%rdx
00b2     4532:	49 0f 4f de          	cmovg  %r14,%rbx
00b6     4536:	48 39 cb             	cmp    %rcx,%rbx
00b9     4539:	48 0f 49 d9          	cmovns %rcx,%rbx
00bd     453d:	31 ed                	xor    %ebp,%ebp
00bf     453f:	31 f6                	xor    %esi,%esi
00c1     4541:	f0 49 0f b1 5f 10    	lock cmpxchg %rbx,0x10(%r15)
00c7     4547:	41 0f 95 c6          	setne  %r14b
00cb     454b:	40 0f 94 c5          	sete   %bpl
00cf     454f:	40 0f 95 c6          	setne  %sil
00d3     4553:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	4556: R_X86_64_32S	_ftrace_annotated_branch+0x46ad0
00da     455a:	31 d2                	xor    %edx,%edx
00dc     455c:	31 c9                	xor    %ecx,%ecx
00de     455e:	e8 00 00 00 00       	call   4563 <local_clock+0xe3>	455f: R_X86_64_PLT32	ftrace_likely_update-0x4
00e3     4563:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	4566: R_X86_64_32S	_ftrace_annotated_branch+0x46b00
00ea     456a:	89 ee                	mov    %ebp,%esi
00ec     456c:	ba 01 00 00 00       	mov    $0x1,%edx
00f1     4571:	31 c9                	xor    %ecx,%ecx
00f3     4573:	e8 00 00 00 00       	call   4578 <local_clock+0xf8>	4574: R_X86_64_PLT32	ftrace_likely_update-0x4
00f8     4578:	45 84 f6             	test   %r14b,%r14b
00fb     457b:	0f 85 45 ff ff ff    	jne    44c6 <local_clock+0x46>
0101     4581:	65 ff 0d 00 00 00 00 	decl   %gs:0x0(%rip)        # 4588 <local_clock+0x108>	4584: R_X86_64_PC32	pcpu_hot+0x4
0108     4588:	e9 10 ff ff ff       	jmp    449d <local_clock+0x1d>
010d     458d:	cc                   	int3
010e     458e:	cc                   	int3
010f     458f:	cc                   	int3
0110     4590:	cc                   	int3
0111     4591:	cc                   	int3
0112     4592:	cc                   	int3
0113     4593:	cc                   	int3
0114     4594:	cc                   	int3
0115     4595:	cc                   	int3
0116     4596:	cc                   	int3
0117     4597:	cc                   	int3
0118     4598:	cc                   	int3
0119     4599:	cc                   	int3
011a     459a:	cc                   	int3
011b     459b:	cc                   	int3
011c     459c:	cc                   	int3
011d     459d:	cc                   	int3
011e     459e:	cc                   	int3
011f     459f:	cc                   	int3
0120     45a0:	cc                   	int3
0121     45a1:	cc                   	int3
0122     45a2:	cc                   	int3
0123     45a3:	cc                   	int3
0124     45a4:	cc                   	int3
0125     45a5:	cc                   	int3
0126     45a6:	cc                   	int3
0127     45a7:	cc                   	int3
0128     45a8:	cc                   	int3
0129     45a9:	cc                   	int3
012a     45aa:	cc                   	int3
012b     45ab:	cc                   	int3
012c     45ac:	cc                   	int3
012d     45ad:	cc                   	int3
012e     45ae:	cc                   	int3
012f     45af:	cc                   	int3
0130     45b0:	cc                   	int3
0131     45b1:	cc                   	int3
0132     45b2:	cc                   	int3
0133     45b3:	cc                   	int3
0134     45b4:	cc                   	int3
0135     45b5:	cc                   	int3
0136     45b6:	cc                   	int3
0137     45b7:	cc                   	int3
0138     45b8:	cc                   	int3
0139     45b9:	cc                   	int3
013a     45ba:	cc                   	int3
013b     45bb:	cc                   	int3
013c     45bc:	cc                   	int3
013d     45bd:	cc                   	int3
013e     45be:	cc                   	int3
013f     45bf:	cc                   	int3

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
