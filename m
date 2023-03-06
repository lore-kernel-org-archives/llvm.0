Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3AAD30D;
	Mon,  6 Mar 2023 22:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678142079; x=1709678079;
  h=date:from:cc:subject:message-id:mime-version;
  bh=kp9poVWO3ouURkmNy3XDZVN8FDuIv7uzUM+AQeLA02I=;
  b=DHIGHjVThWgDoDEwgbCiuu8PX8oo/3mVZSd2qiKIfNaITsN1Az8Et6vr
   kpfPNU2iZD8TUt+47UFfR3zL+MZjw9nshLRoObS8c5Mg2RXoHw0jlw3oT
   ITBNzB4ggrFXEuFV1mp3hoqxx1YcnGxPDHJTxaEoWm/EEsrsb3cD9mKnJ
   FUkNOW981uTQJpMoWcUXa0mQe6Zsf2kkJI28m2LNXX2oZ1N0OEKF2+qvw
   hV4OcAZxAyVxMo65B83yW06fVzxjWmeCz6ic9bOJ9erdOKZcbX2/1H7bM
   LGzoY+o/Gfyb1lw+qOlKnsC5N/UtWwm2WPOyZAst6xb34qSCSZANwlTWD
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="316095826"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="316095826"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 14:34:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="786441566"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="786441566"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 06 Mar 2023 14:34:37 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZJPh-0000h1-0I;
	Mon, 06 Mar 2023 22:34:37 +0000
Date: Tue, 7 Mar 2023 06:33:56 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: local_clock+0x53: call to
 ftrace_likely_update() leaves .noinstr.text section
Message-ID: <202303070624.gAbTxNlg-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8ca09d5fa3549d142c2080a72a4c70ce389163cd
commit: 776f22913b8e50011004c6ae43004711dab7efa5 sched/clock: Make local_clock() noinstr
date:   5 weeks ago
config: x86_64-randconfig-a011-20230306 (https://download.01.org/0day-ci/archive/20230307/202303070624.gAbTxNlg-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=776f22913b8e50011004c6ae43004711dab7efa5
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 776f22913b8e50011004c6ae43004711dab7efa5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303070624.gAbTxNlg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: __asan_memset+0x34: call to __memset() with UACCESS enabled
   vmlinux.o: warning: objtool: __asan_memmove+0x54: call to __memmove() with UACCESS enabled
   vmlinux.o: warning: objtool: __asan_memcpy+0x54: call to __memcpy() with UACCESS enabled
   vmlinux.o: warning: objtool: __rdgsbase_inactive+0x33: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __wrgsbase_inactive+0x37: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret+0x89: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: noist_exc_debug+0x45: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi+0xc9: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: poke_int3_handler+0x3b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: native_sched_clock+0x68: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_machine_check+0x54: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_machine_check+0x59: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_check_crashing_cpu+0x10: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: pvclock_clocksource_read_nowd+0x8c: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: local_clock+0x53: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: enter_from_user_mode+0x48: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode+0x51: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare+0x48: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter_from_user_mode+0x48: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_exit+0x40: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_enter+0x44: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_exit+0x4d: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: tdx_safe_halt+0x2b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mwait_idle+0x2b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_processor_ffh_cstate_enter+0x120: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: intel_idle+0x102: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: intel_idle_s2idle+0x111: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: intel_idle_irq+0x104: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: intel_idle_ibrs+0x108: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: intel_idle_xstate+0x108: call to ftrace_likely_update() leaves .noinstr.text section


objdump-func vmlinux.o local_clock:
0000 00000000000036b0 <local_clock>:
0000     36b0:	f3 0f 1e fa          	endbr64
0004     36b4:	55                   	push   %rbp
0005     36b5:	41 57                	push   %r15
0007     36b7:	41 56                	push   %r14
0009     36b9:	53                   	push   %rbx
000a     36ba:	eb 19                	jmp    36d5 <local_clock+0x25>
000c     36bc:	e8 00 00 00 00       	call   36c1 <local_clock+0x11>	36bd: R_X86_64_PLT32	sched_clock-0x4
0011     36c1:	48 89 c3             	mov    %rax,%rbx
0014     36c4:	48 03 1d 00 00 00 00 	add    0x0(%rip),%rbx        # 36cb <local_clock+0x1b>	36c7: R_X86_64_PC32	__sched_clock_offset-0x4
001b     36cb:	48 89 d8             	mov    %rbx,%rax
001e     36ce:	5b                   	pop    %rbx
001f     36cf:	41 5e                	pop    %r14
0021     36d1:	41 5f                	pop    %r15
0023     36d3:	5d                   	pop    %rbp
0024     36d4:	c3                   	ret
0025     36d5:	f3 0f 1e fa          	endbr64
0029     36d9:	ff 05 00 00 00 00    	incl   0x0(%rip)        # 36df <local_clock+0x2f>	36db: R_X86_64_PC32	pcpu_hot+0x4
002f     36df:	45 31 ff             	xor    %r15d,%r15d
0032     36e2:	e8 00 00 00 00       	call   36e7 <local_clock+0x37>	36e3: R_X86_64_PLT32	sched_clock-0x4
0037     36e7:	49 89 c6             	mov    %rax,%r14
003a     36ea:	4c 2b 35 00 00 00 00 	sub    0x0(%rip),%r14        # 36f1 <local_clock+0x41>	36ed: R_X86_64_PC32	sched_clock_data-0x4
0041     36f1:	4c 89 f6             	mov    %r14,%rsi
0044     36f4:	48 c1 ee 3f          	shr    $0x3f,%rsi
0048     36f8:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	36fb: R_X86_64_32S	_ftrace_annotated_branch+0x28350
004f     36ff:	31 d2                	xor    %edx,%edx
0051     3701:	31 c9                	xor    %ecx,%ecx
0053     3703:	e8 00 00 00 00       	call   3708 <local_clock+0x58>	3704: R_X86_64_PLT32	ftrace_likely_update-0x4
0058     3708:	4d 85 f6             	test   %r14,%r14
005b     370b:	4d 0f 48 f7          	cmovs  %r15,%r14
005f     370f:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 3716 <local_clock+0x66>	3712: R_X86_64_PC32	sched_clock_data+0xc
0066     3716:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 371d <local_clock+0x6d>	3719: R_X86_64_PC32	sched_clock_data+0x4
006d     371d:	48 8b 15 00 00 00 00 	mov    0x0(%rip),%rdx        # 3724 <local_clock+0x74>	3720: R_X86_64_PC32	.data..read_mostly+0x2604
0074     3724:	48 8d 1c 0a          	lea    (%rdx,%rcx,1),%rbx
0078     3728:	49 01 de             	add    %rbx,%r14
007b     372b:	48 89 de             	mov    %rbx,%rsi
007e     372e:	48 29 c6             	sub    %rax,%rsi
0081     3731:	48 85 f6             	test   %rsi,%rsi
0084     3734:	48 0f 4e d8          	cmovle %rax,%rbx
0088     3738:	48 01 d1             	add    %rdx,%rcx
008b     373b:	48 81 c1 d5 dc 32 00 	add    $0x32dcd5,%rcx
0092     3742:	48 89 c2             	mov    %rax,%rdx
0095     3745:	48 29 ca             	sub    %rcx,%rdx
0098     3748:	48 85 d2             	test   %rdx,%rdx
009b     374b:	48 0f 4f c8          	cmovg  %rax,%rcx
009f     374f:	4c 89 f2             	mov    %r14,%rdx
00a2     3752:	48 29 da             	sub    %rbx,%rdx
00a5     3755:	48 85 d2             	test   %rdx,%rdx
00a8     3758:	49 0f 4f de          	cmovg  %r14,%rbx
00ac     375c:	48 39 cb             	cmp    %rcx,%rbx
00af     375f:	48 0f 49 d9          	cmovns %rcx,%rbx
00b3     3763:	31 ed                	xor    %ebp,%ebp
00b5     3765:	31 f6                	xor    %esi,%esi
00b7     3767:	48 0f b1 1d 00 00 00 00 	cmpxchg %rbx,0x0(%rip)        # 376f <local_clock+0xbf>	376b: R_X86_64_PC32	sched_clock_data+0xc
00bf     376f:	41 0f 95 c6          	setne  %r14b
00c3     3773:	40 0f 94 c5          	sete   %bpl
00c7     3777:	40 0f 95 c6          	setne  %sil
00cb     377b:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	377e: R_X86_64_32S	_ftrace_annotated_branch+0x28380
00d2     3782:	31 d2                	xor    %edx,%edx
00d4     3784:	31 c9                	xor    %ecx,%ecx
00d6     3786:	e8 00 00 00 00       	call   378b <local_clock+0xdb>	3787: R_X86_64_PLT32	ftrace_likely_update-0x4
00db     378b:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	378e: R_X86_64_32S	_ftrace_annotated_branch+0x283b0
00e2     3792:	89 ee                	mov    %ebp,%esi
00e4     3794:	ba 01 00 00 00       	mov    $0x1,%edx
00e9     3799:	31 c9                	xor    %ecx,%ecx
00eb     379b:	e8 00 00 00 00       	call   37a0 <local_clock+0xf0>	379c: R_X86_64_PLT32	ftrace_likely_update-0x4
00f0     37a0:	45 84 f6             	test   %r14b,%r14b
00f3     37a3:	0f 85 39 ff ff ff    	jne    36e2 <local_clock+0x32>
00f9     37a9:	ff 0d 00 00 00 00    	decl   0x0(%rip)        # 37af <local_clock+0xff>	37ab: R_X86_64_PC32	pcpu_hot+0x4
00ff     37af:	e9 17 ff ff ff       	jmp    36cb <local_clock+0x1b>
0104     37b4:	cc                   	int3
0105     37b5:	cc                   	int3
0106     37b6:	cc                   	int3
0107     37b7:	cc                   	int3
0108     37b8:	cc                   	int3
0109     37b9:	cc                   	int3
010a     37ba:	cc                   	int3
010b     37bb:	cc                   	int3
010c     37bc:	cc                   	int3
010d     37bd:	cc                   	int3
010e     37be:	cc                   	int3
010f     37bf:	cc                   	int3

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
