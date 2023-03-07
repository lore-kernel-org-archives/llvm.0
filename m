Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7E7366;
	Tue,  7 Mar 2023 04:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678164833; x=1709700833;
  h=date:from:cc:subject:message-id:mime-version;
  bh=XnWZ8/E+NbIUqonoBEUYKLBTBzyAmoUjiTQD74jp1hU=;
  b=FTY/3lhkAIOzzVt+764ilNen6rOuITj3qo4stVySqNzzZbtaGOopsMpW
   pU5GqBns0Hm6dge2aQYRu7z3j/k9iNLdprL+E/ytmFlV1gglEFAS+iH5W
   hkCIFc42rLmBLrjtZ7t3FZN0KucHdLwLfy9xovu7Vz9ciOvD/jfXgHurM
   LiaDRhEUiQtPqJWvkGZukSxmdm74LmPDOTvPQBiBGqAglahf4PRbX2Ib8
   6y+92Rg90IF79qw2ehDpehOUOPzfFPCIdkzL/IJlV0PGoCZS0KU/mWnPa
   HCK7U+s2AEb6hgQwD+RQ9EtDuJzvQai+o674+q9QR/jbNDfWFKcloY0xA
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="333231057"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="333231057"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 20:53:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="800271336"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="800271336"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 06 Mar 2023 20:53:51 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZPKg-0000yF-1H;
	Tue, 07 Mar 2023 04:53:50 +0000
Date: Tue, 7 Mar 2023 12:53:28 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: poll_idle+0x49: call to
 ftrace_likely_update() leaves .noinstr.text section
Message-ID: <202303071249.fRJeUukz-lkp@intel.com>
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
commit: 4d627628d7584f3d3add1d53342d0f01aa878e04 cpuidle: Fix poll_idle() noinstr annotation
date:   5 weeks ago
config: x86_64-randconfig-a011-20230306 (https://download.01.org/0day-ci/archive/20230307/202303071249.fRJeUukz-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=4d627628d7584f3d3add1d53342d0f01aa878e04
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 4d627628d7584f3d3add1d53342d0f01aa878e04
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303071249.fRJeUukz-lkp@intel.com/

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
   vmlinux.o: warning: objtool: local_clock+0x53: call to ftrace_likely_update() leaves .noinstr.text section
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
>> vmlinux.o: warning: objtool: poll_idle+0x49: call to ftrace_likely_update() leaves .noinstr.text section


objdump-func vmlinux.o poll_idle:
0000 0000000000000b30 <poll_idle>:
0000  b30:	f3 0f 1e fa          	endbr64
0004  b34:	55                   	push   %rbp
0005  b35:	41 57                	push   %r15
0007  b37:	41 56                	push   %r14
0009  b39:	41 55                	push   %r13
000b  b3b:	41 54                	push   %r12
000d  b3d:	53                   	push   %rbx
000e  b3e:	50                   	push   %rax
000f  b3f:	89 54 24 04          	mov    %edx,0x4(%rsp)
0013  b43:	49 89 f5             	mov    %rsi,%r13
0016  b46:	49 89 ff             	mov    %rdi,%r15
0019  b49:	e8 00 00 00 00       	call   b4e <poll_idle+0x1e>	b4a: R_X86_64_PLT32	local_clock-0x4
001e  b4e:	41 80 27 fb          	andb   $0xfb,(%r15)
0022  b52:	49 89 c4             	mov    %rax,%r12
0025  b55:	fb                   	sti
0026  b56:	48 8b 1c 25 00 00 00 00 	mov    0x0,%rbx	b5a: R_X86_64_32S	pcpu_hot
002e  b5e:	80 4b 02 20          	orb    $0x20,0x2(%rbx)
0032  b62:	48 8b 2b             	mov    (%rbx),%rbp
0035  b65:	83 e5 08             	and    $0x8,%ebp
0038  b68:	48 c1 ed 03          	shr    $0x3,%rbp
003c  b6c:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	b6f: R_X86_64_32S	_ftrace_annotated_branch+0x124560
0043  b73:	89 ee                	mov    %ebp,%esi
0045  b75:	31 d2                	xor    %edx,%edx
0047  b77:	31 c9                	xor    %ecx,%ecx
0049  b79:	e8 00 00 00 00       	call   b7e <poll_idle+0x4e>	b7a: R_X86_64_PLT32	ftrace_likely_update-0x4
004e  b7e:	48 85 ed             	test   %rbp,%rbp
0051  b81:	75 6c                	jne    bef <poll_idle+0xbf>
0053  b83:	4c 89 ef             	mov    %r13,%rdi
0056  b86:	4c 89 fe             	mov    %r15,%rsi
0059  b89:	e8 00 00 00 00       	call   b8e <poll_idle+0x5e>	b8a: R_X86_64_PLT32	cpuidle_poll_time-0x4
005e  b8e:	49 89 c5             	mov    %rax,%r13
0061  b91:	48 8b 2b             	mov    (%rbx),%rbp
0064  b94:	83 e5 08             	and    $0x8,%ebp
0067  b97:	48 c1 ed 03          	shr    $0x3,%rbp
006b  b9b:	45 31 f6             	xor    %r14d,%r14d
006e  b9e:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	ba1: R_X86_64_32S	_ftrace_annotated_branch+0x124590
0075  ba5:	89 ee                	mov    %ebp,%esi
0077  ba7:	31 d2                	xor    %edx,%edx
0079  ba9:	31 c9                	xor    %ecx,%ecx
007b  bab:	e8 00 00 00 00       	call   bb0 <poll_idle+0x80>	bac: R_X86_64_PLT32	ftrace_likely_update-0x4
0080  bb0:	48 85 ed             	test   %rbp,%rbp
0083  bb3:	75 3a                	jne    bef <poll_idle+0xbf>
0085  bb5:	f3 90                	pause
0087  bb7:	41 81 fe c7 00 00 00 	cmp    $0xc7,%r14d
008e  bbe:	77 05                	ja     bc5 <poll_idle+0x95>
0090  bc0:	41 ff c6             	inc    %r14d
0093  bc3:	eb 10                	jmp    bd5 <poll_idle+0xa5>
0095  bc5:	e8 00 00 00 00       	call   bca <poll_idle+0x9a>	bc6: R_X86_64_PLT32	local_clock-0x4
009a  bca:	4c 29 e0             	sub    %r12,%rax
009d  bcd:	45 31 f6             	xor    %r14d,%r14d
00a0  bd0:	4c 39 e8             	cmp    %r13,%rax
00a3  bd3:	77 16                	ja     beb <poll_idle+0xbb>
00a5  bd5:	48 8b 2b             	mov    (%rbx),%rbp
00a8  bd8:	83 e5 08             	and    $0x8,%ebp
00ab  bdb:	48 89 ee             	mov    %rbp,%rsi
00ae  bde:	48 c1 ee 03          	shr    $0x3,%rsi
00b2  be2:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	be5: R_X86_64_32S	_ftrace_annotated_branch+0x124590
00b9  be9:	eb bc                	jmp    ba7 <poll_idle+0x77>
00bb  beb:	41 80 0f 04          	orb    $0x4,(%r15)
00bf  bef:	fa                   	cli
00c0  bf0:	80 63 02 df          	andb   $0xdf,0x2(%rbx)
00c4  bf4:	48 f7 03 08 00 00 00 	testq  $0x8,(%rbx)
00cb  bfb:	74 0a                	je     c07 <poll_idle+0xd7>
00cd  bfd:	81 25 00 00 00 00 ff ff ff 7f 	andl   $0x7fffffff,0x0(%rip)        # c07 <poll_idle+0xd7>	bff: R_X86_64_PC32	pcpu_hot
00d7  c07:	8b 44 24 04          	mov    0x4(%rsp),%eax
00db  c0b:	48 83 c4 08          	add    $0x8,%rsp
00df  c0f:	5b                   	pop    %rbx
00e0  c10:	41 5c                	pop    %r12
00e2  c12:	41 5d                	pop    %r13
00e4  c14:	41 5e                	pop    %r14
00e6  c16:	41 5f                	pop    %r15
00e8  c18:	5d                   	pop    %rbp
00e9  c19:	c3                   	ret

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
