Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0A923BB
	for <llvm@lists.linux.dev>; Mon,  8 Aug 2022 07:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659943337; x=1691479337;
  h=date:from:cc:subject:message-id:mime-version;
  bh=tOl1ra4pkgQBLO0+1tHo4LkA6WPfk6kSBJ3M/3Qh7Fg=;
  b=H9VpIvz2rhOlXnrI3yqB2aDGlPLDSiapQTOWuS1jeXPJgb63ha/MUrRB
   CfRdZrsokqkkHfm6OTQJ9H5PF+sKGq6f8USPJgOTLsmGNKl93Q++a/oZa
   rumAQqRYdjfa/9mwwi+dqKZPePC+gtV2PgSZRE7+5wd/ob2rrqGyR5RSM
   GyJ5su2j/OYdXpvtzqe0BUrQPSPGfKQU6e1348ALK1d/cI8OVI/auCrcd
   ArNjOnUNsQTShaPewVVXVbspoytPcl1WLY+8xDqO7h9yv/A10hsJ9xvRU
   CmFIF8FFhdwFcChCym9Ht/nD6+sL84nGiWibG0+CXooTaiGhnTRCGvURJ
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10432"; a="289282367"
X-IronPort-AV: E=Sophos;i="5.93,221,1654585200"; 
   d="scan'208";a="289282367"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2022 00:22:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,221,1654585200"; 
   d="scan'208";a="663821399"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 08 Aug 2022 00:22:15 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oKx5b-000M3B-02;
	Mon, 08 Aug 2022 07:22:15 +0000
Date: Mon, 8 Aug 2022 15:21:59 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [peterz-queue:sched/idle 13/37] vmlinux.o: warning: objtool:
 acpi_idle_enter+0x63: call to ftrace_likely_update() leaves .noinstr.text
 section
Message-ID: <202208081558.XW1Ddvrx-lkp@intel.com>
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
commit: b835027dddbdb862a767fe4e1f9e1ddd20f1ce6b [13/37] cpuidle: Fix rcu_idle_*() usage
config: x86_64-randconfig-a014-20220808 (https://download.01.org/0day-ci/archive/20220808/202208081558.XW1Ddvrx-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e2cc5a3c07cbc2412e851a7283c1841f520)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=b835027dddbdb862a767fe4e1f9e1ddd20f1ce6b
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue sched/idle
        git checkout b835027dddbdb862a767fe4e1f9e1ddd20f1ce6b
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
   vmlinux.o: warning: objtool: rcu_eqs_enter+0x41: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_dynticks_eqs_enter+0x1e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_irq_exit+0x39: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_eqs_exit+0x3f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_nmi_enter+0x38: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_dynticks_eqs_exit+0x1e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_irq_enter+0x39: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: enter_from_user_mode+0x5e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode+0x67: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare+0x5e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter_from_user_mode+0x5e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_exit+0x43: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_enter+0x45: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_exit+0x5f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __context_tracking_enter+0x32: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: context_tracking_recursion_enter+0x43: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: acpi_idle_enter+0x63: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_idle_enter_s2idle+0x84: call to acpi_idle_do_entry() leaves .noinstr.text section


objdump-func vmlinux.o acpi_idle_enter:
0000 0000000000008020 <acpi_idle_enter>:
0000     8020:	55                   	push   %rbp
0001     8021:	48 89 e5             	mov    %rsp,%rbp
0004     8024:	41 57                	push   %r15
0006     8026:	41 56                	push   %r14
0008     8028:	41 55                	push   %r13
000a     802a:	41 54                	push   %r12
000c     802c:	53                   	push   %rbx
000d     802d:	41 89 d6             	mov    %edx,%r14d
0010     8030:	49 89 f4             	mov    %rsi,%r12
0013     8033:	49 89 ff             	mov    %rdi,%r15
0016     8036:	48 63 da             	movslq %edx,%rbx
0019     8039:	83 fb 0b             	cmp    $0xb,%ebx
001c     803c:	0f 83 d8 00 00 00    	jae    811a <acpi_idle_enter+0xfa>
0022     8042:	4c 8d 2c dd 00 00 00 00 	lea    0x0(,%rbx,8),%r13	8046: R_X86_64_32S	.data..percpu+0x1d3500
002a     804a:	41 8b 5f 04          	mov    0x4(%r15),%ebx
002e     804e:	48 81 fb 00 20 00 00 	cmp    $0x2000,%rbx
0035     8055:	0f 83 d3 00 00 00    	jae    812e <acpi_idle_enter+0x10e>
003b     805b:	48 8b 04 dd 00 00 00 00 	mov    0x0(,%rbx,8),%rax	805f: R_X86_64_32S	__per_cpu_offset
0043     8063:	4e 8b 2c 28          	mov    (%rax,%r13,1),%r13
0047     8067:	65 48 8b 1d 00 00 00 00 	mov    %gs:0x0(%rip),%rbx        # 806f <acpi_idle_enter+0x4f>	806b: R_X86_64_PC32	processors-0x4
004f     806f:	31 f6                	xor    %esi,%esi
0051     8071:	48 85 db             	test   %rbx,%rbx
0054     8074:	40 0f 94 c6          	sete   %sil
0058     8078:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	807b: R_X86_64_32S	_ftrace_annotated_branch+0xb1120
005f     807f:	31 d2                	xor    %edx,%edx
0061     8081:	31 c9                	xor    %ecx,%ecx
0063     8083:	e8 00 00 00 00       	call   8088 <acpi_idle_enter+0x68>	8084: R_X86_64_PLT32	ftrace_likely_update-0x4
0068     8088:	48 85 db             	test   %rbx,%rbx
006b     808b:	74 63                	je     80f0 <acpi_idle_enter+0xd0>
006d     808d:	41 0f b6 45 01       	movzbl 0x1(%r13),%eax
0072     8092:	83 f8 01             	cmp    $0x1,%eax
0075     8095:	74 43                	je     80da <acpi_idle_enter+0xba>
0077     8097:	83 f8 03             	cmp    $0x3,%eax
007a     809a:	75 06                	jne    80a2 <acpi_idle_enter+0x82>
007c     809c:	f6 43 20 20          	testb  $0x20,0x20(%rbx)
0080     80a0:	75 56                	jne    80f8 <acpi_idle_enter+0xd8>
0082     80a2:	48 89 df             	mov    %rbx,%rdi
0085     80a5:	e8 00 00 00 00       	call   80aa <acpi_idle_enter+0x8a>	80a6: R_X86_64_PLT32	.text+0x135a71c
008a     80aa:	84 c0                	test   %al,%al
008c     80ac:	74 2c                	je     80da <acpi_idle_enter+0xba>
008e     80ae:	e8 00 00 00 00       	call   80b3 <acpi_idle_enter+0x93>	80af: R_X86_64_PLT32	.text+0x135a7ec
0093     80b3:	83 f8 02             	cmp    $0x2,%eax
0096     80b6:	72 22                	jb     80da <acpi_idle_enter+0xba>
0098     80b8:	41 8b 5f 04          	mov    0x4(%r15),%ebx
009c     80bc:	48 81 fb 00 20 00 00 	cmp    $0x2000,%rbx
00a3     80c3:	73 7d                	jae    8142 <acpi_idle_enter+0x122>
00a5     80c5:	48 8b 04 dd 00 00 00 00 	mov    0x0(,%rbx,8),%rax	80c9: R_X86_64_32S	__per_cpu_offset
00ad     80cd:	4c 8b a8 00 00 00 00 	mov    0x0(%rax),%r13	80d0: R_X86_64_32S	.data..percpu+0x1d3508
00b4     80d4:	41 be 01 00 00 00    	mov    $0x1,%r14d
00ba     80da:	41 80 7d 01 03       	cmpb   $0x3,0x1(%r13)
00bf     80df:	75 05                	jne    80e6 <acpi_idle_enter+0xc6>
00c1     80e1:	e9 00 00 00 00       	jmp    80e6 <acpi_idle_enter+0xc6>	80e2: R_X86_64_PLT32	.altinstr_aux+0x2ae0
00c6     80e6:	4c 89 ef             	mov    %r13,%rdi
00c9     80e9:	e8 00 00 00 00       	call   80ee <acpi_idle_enter+0xce>	80ea: R_X86_64_PLT32	.cpuidle.text+0x97c
00ce     80ee:	eb 1c                	jmp    810c <acpi_idle_enter+0xec>
00d0     80f0:	41 be ea ff ff ff    	mov    $0xffffffea,%r14d
00d6     80f6:	eb 14                	jmp    810c <acpi_idle_enter+0xec>
00d8     80f8:	4c 89 e7             	mov    %r12,%rdi
00db     80fb:	48 89 de             	mov    %rbx,%rsi
00de     80fe:	4c 89 ea             	mov    %r13,%rdx
00e1     8101:	44 89 f1             	mov    %r14d,%ecx
00e4     8104:	e8 47 01 00 00       	call   8250 <acpi_idle_enter_bm>
00e9     8109:	41 89 c6             	mov    %eax,%r14d
00ec     810c:	44 89 f0             	mov    %r14d,%eax
00ef     810f:	5b                   	pop    %rbx
00f0     8110:	41 5c                	pop    %r12
00f2     8112:	41 5d                	pop    %r13
00f4     8114:	41 5e                	pop    %r14
00f6     8116:	41 5f                	pop    %r15
00f8     8118:	5d                   	pop    %rbp
00f9     8119:	c3                   	ret    
00fa     811a:	44 89 f6             	mov    %r14d,%esi
00fd     811d:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	8120: R_X86_64_32S	.data+0x950540
0104     8124:	e8 00 00 00 00       	call   8129 <acpi_idle_enter+0x109>	8125: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
0109     8129:	e9 14 ff ff ff       	jmp    8042 <acpi_idle_enter+0x22>
010e     812e:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	8131: R_X86_64_32S	.data+0x950560
0115     8135:	48 89 de             	mov    %rbx,%rsi
0118     8138:	e8 00 00 00 00       	call   813d <acpi_idle_enter+0x11d>	8139: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
011d     813d:	e9 19 ff ff ff       	jmp    805b <acpi_idle_enter+0x3b>
0122     8142:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	8145: R_X86_64_32S	.data+0x950580
0129     8149:	48 89 de             	mov    %rbx,%rsi
012c     814c:	e8 00 00 00 00       	call   8151 <acpi_idle_enter+0x131>	814d: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
0131     8151:	e9 6f ff ff ff       	jmp    80c5 <acpi_idle_enter+0xa5>
0136     8156:	e8 00 00 00 00       	call   815b <acpi_idle_enter+0x13b>	8157: R_X86_64_PLT32	.text+0x135a84c
013b     815b:	eb 89                	jmp    80e6 <acpi_idle_enter+0xc6>
013d     815d:	0f 1f 00             	nopl   (%rax)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
