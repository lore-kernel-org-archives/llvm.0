Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508AD11C8F;
	Mon,  8 May 2023 11:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683543702; x=1715079702;
  h=date:from:cc:subject:message-id:mime-version;
  bh=DBnF8Nor69jt9Lkx7YK8DJIju8ez8eNfqWcccEQBF6g=;
  b=jQz58tYloJCKNwhuYUIbQsN61pV+vEb5oGY3EbMQhpN+zCwxMGdadE9g
   3l+09NdGQ8KSBFBH8cK2wVGWkR6fnJ3sTfyiLyWbhKnghif8hXYIvtJap
   1USjF+bjwpM4VV1fHJ7MQZOzHbXb3nxNptC7AHwWAWoBAZbahcom6Wtg7
   E6TCxFMUKJobA6f4dcl00R/FPJ4W0W1GF8ps0DwYtvqkhpS0odAwKyD8c
   CzW2fgvB5duZHg8a/ulFKikaO/3HEMYYTcXYZTZ2PdjvL1b224J9d3bhG
   h4wNosWo21lQ7dL3wRkAlvTgeDAoounPPnoaDu2Yi8Ad+gS/EnMyR2LH0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="351778580"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="351778580"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 04:01:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="676019840"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="676019840"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 08 May 2023 04:01:31 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvycU-0001Cj-26;
	Mon, 08 May 2023 11:01:30 +0000
Date: Mon, 8 May 2023 19:00:52 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: intel_idle_ibrs+0x11d: call to
 ftrace_likely_update() leaves .noinstr.text section
Message-ID: <202305081859.1iquMYan-lkp@intel.com>
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
CC: Ingo Molnar <mingo@kernel.org>

Hi Peter,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ac9a78681b921877518763ba0e89202254349d1b
commit: e4df1511e1f4bcaa0d590aa7bbffe8bbbd6dfb49 cpuidle, sched: Remove instrumentation from TIF_{POLLING_NRFLAG,NEED_RESCHED}
date:   4 months ago
config: x86_64-buildonly-randconfig-r002-20230508 (https://download.01.org/0day-ci/archive/20230508/202305081859.1iquMYan-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e4df1511e1f4bcaa0d590aa7bbffe8bbbd6dfb49
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e4df1511e1f4bcaa0d590aa7bbffe8bbbd6dfb49
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305081859.1iquMYan-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: sync_regs+0x20: call to memcpy() leaves .noinstr.text section
   vmlinux.o: warning: objtool: vc_switch_off_ist+0x8f: call to memcpy() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret+0x82: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: noist_exc_debug+0x3b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi+0x32: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: poke_int3_handler+0x37: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __sev_es_ist_exit+0x46: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __sev_get_ghcb+0x20: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __sev_put_ghcb+0x1f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: kernel_exc_vmm_communication+0xbc: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: enter_from_user_mode+0x2f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode+0x3d: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare+0x2f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter_from_user_mode+0x2f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_enter+0x36: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_exit+0x2b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_exit_state+0x40: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_nmi_enter+0x43: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_enter_state+0x43: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_idle_enter+0x19: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_exit+0x5b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_idle_exit+0x39: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_enter+0x42: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __ct_user_enter+0x3f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: context_tracking_recursion_enter+0x35: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __ct_user_exit+0x7a: call to __kasan_check_write() leaves .noinstr.text section
   vmlinux.o: warning: objtool: check_preemption_disabled+0x37: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mwait_idle+0x29: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_processor_ffh_cstate_enter+0xef: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: intel_idle+0xd7: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: intel_idle_s2idle+0xe7: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: intel_idle_irq+0xd9: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: intel_idle_ibrs+0x11d: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: intel_idle_xstate+0xdf: call to ftrace_likely_update() leaves .noinstr.text section


objdump-func vmlinux.o intel_idle_ibrs:
0000 0000000000000640 <intel_idle_ibrs>:
0000  640:	55                   	push   %rbp
0001  641:	41 57                	push   %r15
0003  643:	41 56                	push   %r14
0005  645:	41 55                	push   %r13
0007  647:	41 54                	push   %r12
0009  649:	53                   	push   %rbx
000a  64a:	41 89 d5             	mov    %edx,%r13d
000d  64d:	48 89 f3             	mov    %rsi,%rbx
0010  650:	e9 d3 00 00 00       	jmp    728 <intel_idle_ibrs+0xe8>
0015  655:	e8 00 00 00 00       	call   65a <intel_idle_ibrs+0x1a>	656: R_X86_64_PLT32	spec_ctrl_current-0x4
001a  65a:	49 89 c6             	mov    %rax,%r14
001d  65d:	b9 48 00 00 00       	mov    $0x48,%ecx
0022  662:	31 c0                	xor    %eax,%eax
0024  664:	31 d2                	xor    %edx,%edx
0026  666:	0f 30                	wrmsr
0028  668:	41 b4 01             	mov    $0x1,%r12b
002b  66b:	49 63 c5             	movslq %r13d,%rax
002e  66e:	48 6b c0 68          	imul   $0x68,%rax,%rax
0032  672:	44 0f b6 7c 03 5b    	movzbl 0x5b(%rbx,%rax,1),%r15d
0038  678:	e9 00 00 00 00       	jmp    67d <intel_idle_ibrs+0x3d>	679: R_X86_64_PLT32	.altinstr_aux+0xbf0
003d  67d:	e9 00 00 00 00       	jmp    682 <intel_idle_ibrs+0x42>	67e: R_X86_64_PLT32	.altinstr_aux+0xc02
0042  682:	0f ae f0             	mfence
0045  685:	65 48 8b 04 25 00 00 00 00 	mov    %gs:0x0,%rax	68a: R_X86_64_32S	pcpu_hot
004e  68e:	0f ae 38             	clflush (%rax)
0051  691:	0f ae f0             	mfence
0054  694:	65 48 8b 1c 25 00 00 00 00 	mov    %gs:0x0,%rbx	699: R_X86_64_32S	pcpu_hot
005d  69d:	48 89 d8             	mov    %rbx,%rax
0060  6a0:	31 c9                	xor    %ecx,%ecx
0062  6a2:	31 d2                	xor    %edx,%edx
0064  6a4:	0f 01 c8             	monitor %rax,%ecx,%edx
0067  6a7:	48 8b 2b             	mov    (%rbx),%rbp
006a  6aa:	83 e5 08             	and    $0x8,%ebp
006d  6ad:	48 c1 ed 03          	shr    $0x3,%rbp
0071  6b1:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	6b4: R_X86_64_32S	_ftrace_annotated_branch+0x76d70
0078  6b8:	89 ee                	mov    %ebp,%esi
007a  6ba:	31 d2                	xor    %edx,%edx
007c  6bc:	31 c9                	xor    %ecx,%ecx
007e  6be:	e8 00 00 00 00       	call   6c3 <intel_idle_ibrs+0x83>	6bf: R_X86_64_PLT32	ftrace_likely_update-0x4
0083  6c3:	48 85 ed             	test   %rbp,%rbp
0086  6c6:	75 14                	jne    6dc <intel_idle_ibrs+0x9c>
0088  6c8:	eb 07                	jmp    6d1 <intel_idle_ibrs+0x91>
008a  6ca:	0f 00 2d 00 00 00 00 	verw   0x0(%rip)        # 6d1 <intel_idle_ibrs+0x91>	6cd: R_X86_64_PC32	.rodata+0x86507c
0091  6d1:	b9 01 00 00 00       	mov    $0x1,%ecx
0096  6d6:	4c 89 f8             	mov    %r15,%rax
0099  6d9:	0f 01 c9             	mwait  %eax,%ecx
009c  6dc:	65 48 8b 04 25 00 00 00 00 	mov    %gs:0x0,%rax	6e1: R_X86_64_32S	pcpu_hot
00a5  6e5:	f0 80 63 02 df       	lock andb $0xdf,0x2(%rbx)
00aa  6ea:	f0 83 44 24 fc 00    	lock addl $0x0,-0x4(%rsp)
00b0  6f0:	48 f7 03 08 00 00 00 	testq  $0x8,(%rbx)
00b7  6f7:	74 0b                	je     704 <intel_idle_ibrs+0xc4>
00b9  6f9:	65 81 25 00 00 00 00 ff ff ff 7f 	andl   $0x7fffffff,%gs:0x0(%rip)        # 704 <intel_idle_ibrs+0xc4>	6fc: R_X86_64_PC32	pcpu_hot
00c4  704:	45 84 e4             	test   %r12b,%r12b
00c7  707:	74 11                	je     71a <intel_idle_ibrs+0xda>
00c9  709:	4c 89 f2             	mov    %r14,%rdx
00cc  70c:	48 c1 ea 20          	shr    $0x20,%rdx
00d0  710:	b9 48 00 00 00       	mov    $0x48,%ecx
00d5  715:	44 89 f0             	mov    %r14d,%eax
00d8  718:	0f 30                	wrmsr
00da  71a:	44 89 e8             	mov    %r13d,%eax
00dd  71d:	5b                   	pop    %rbx
00de  71e:	41 5c                	pop    %r12
00e0  720:	41 5d                	pop    %r13
00e2  722:	41 5e                	pop    %r14
00e4  724:	41 5f                	pop    %r15
00e6  726:	5d                   	pop    %rbp
00e7  727:	c3                   	ret
00e8  728:	45 31 e4             	xor    %r12d,%r12d
00eb  72b:	e8 00 00 00 00       	call   730 <intel_idle_ibrs+0xf0>	72c: R_X86_64_PLT32	spec_ctrl_current-0x4
00f0  730:	49 89 c6             	mov    %rax,%r14
00f3  733:	e9 33 ff ff ff       	jmp    66b <intel_idle_ibrs+0x2b>
00f8  738:	65 48 8b 1c 25 00 00 00 00 	mov    %gs:0x0,%rbx	73d: R_X86_64_32S	pcpu_hot
0101  741:	f0 80 4b 02 20       	lock orb $0x20,0x2(%rbx)
0106  746:	48 8b 2b             	mov    (%rbx),%rbp
0109  749:	83 e5 08             	and    $0x8,%ebp
010c  74c:	48 c1 ed 03          	shr    $0x3,%rbp
0110  750:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	753: R_X86_64_32S	_ftrace_annotated_branch+0x76d40
0117  757:	89 ee                	mov    %ebp,%esi
0119  759:	31 d2                	xor    %edx,%edx
011b  75b:	31 c9                	xor    %ecx,%ecx
011d  75d:	e8 00 00 00 00       	call   762 <intel_idle_ibrs+0x122>	75e: R_X86_64_PLT32	ftrace_likely_update-0x4
0122  762:	48 85 ed             	test   %rbp,%rbp
0125  765:	0f 85 71 ff ff ff    	jne    6dc <intel_idle_ibrs+0x9c>
012b  76b:	e9 0d ff ff ff       	jmp    67d <intel_idle_ibrs+0x3d>
0130  770:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
013a  77a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
