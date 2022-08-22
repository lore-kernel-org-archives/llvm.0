Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55802580
	for <llvm@lists.linux.dev>; Mon, 22 Aug 2022 16:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661187535; x=1692723535;
  h=date:from:cc:subject:message-id:mime-version;
  bh=C5DzUB6gRXHPjXc7P4unvWNhv7xkQgdYDBgOWNtq+4k=;
  b=RVXAOda7XTMZkmIdVVPq1NEQ49ggefMWX0QcvI04bvpydJk8Q63IOLSZ
   UrYqMWO0p1YK5n0vCnTy0RIRquEItIv6S8ar/3wJ+Xs+qcsNztsI9FMzj
   dXX0zRgm4atVR7q71aucrgTNO978QhhgOqKG5ibPvnRgX+kVMXhbQHehp
   HodyaLEoeW/NOGE0WFgaSY7wQ/Z3kEIxOvIU2PQbif/MTqOA544SmVANu
   B9UPPJ9MfmrBC/YJaOvwGP5hcgEDoY0D53z2Kh526hhrHvZSA8GI4F/3i
   lgMIJMI51vtjJNczduav/oY7a2EweMizSwTCBJvMVxWfeFlxldy74+Etd
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="276497338"
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; 
   d="scan'208";a="276497338"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2022 09:58:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; 
   d="scan'208";a="559822583"
Received: from lkp-server01.sh.intel.com (HELO dd9b29378baa) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 22 Aug 2022 09:58:54 -0700
Received: from kbuild by dd9b29378baa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oQAlJ-0000UH-24;
	Mon, 22 Aug 2022 16:58:53 +0000
Date: Tue, 23 Aug 2022 00:58:13 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x5f: relocation to
 !ENDBR: machine_kexec_prepare+0x49c
Message-ID: <202208230057.wOFQFef9-lkp@intel.com>
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
CC: Borislav Petkov <bp@suse.de>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Josh Poimboeuf <jpoimboe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1c23f9e627a7b412978b4e852793c5e3c3efc555
commit: 0b53c374b9eff2255a386f1f1cfb9a928e52a5ae x86/retpoline: Use -mfunction-return
date:   8 weeks ago
config: x86_64-randconfig-a006-20220822 (https://download.01.org/0day-ci/archive/20220823/202208230057.wOFQFef9-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0b53c374b9eff2255a386f1f1cfb9a928e52a5ae
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 0b53c374b9eff2255a386f1f1cfb9a928e52a5ae
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: __ubsan_handle_shift_out_of_bounds+0xab: call to __x86_return_thunk() with UACCESS enabled
   vmlinux.o: warning: objtool: copy_mc_fragile_handle_tail+0x55: call to __x86_return_thunk() with UACCESS enabled
   vmlinux.o: warning: objtool: do_syscall_64+0x8b: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __rdgsbase_inactive+0x3b: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __wrgsbase_inactive+0x42: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_divide_error+0x64: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_overflow+0x5d: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_control_protection+0xba: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_invalid_op+0x4e: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: handle_bug+0x69: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_coproc_segment_overrun+0x5d: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_invalid_tss+0x65: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_segment_not_present+0x65: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_stack_segment+0x65: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_alignment_check+0xe7: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_bounds+0xde: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_general_protection+0x2bb: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_int3+0x7e: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: sync_regs+0x38: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret+0x2d: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_debug+0x126: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: noist_exc_debug+0x12e: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_coprocessor_error+0x3b: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_simd_coprocessor_error+0x3b: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_spurious_interrupt_bug+0x26: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_device_not_available+0x106: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: common_interrupt+0x65: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: sysvec_x86_platform_ipi+0x57: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: sysvec_kvm_posted_intr_ipi+0x8e: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: sysvec_kvm_posted_intr_wakeup_ipi+0x54: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: sysvec_kvm_posted_intr_nested_ipi+0x8e: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: sysvec_thermal+0x54: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: get_stack_info_noinstr+0x10a: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: in_task_stack+0x49: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: in_entry_stack+0x62: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi+0x126: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: default_do_nmi+0x105: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: sysvec_irq_work+0x54: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: poke_int3_handler+0xfa: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_rdmsrl+0x51: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_gather_info+0x5d: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_read_aux+0xfe: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_wrmsrl+0x4e: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_machine_check+0x5b1: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: unexpected_machine_check+0x1e: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: quirk_skylake_repmov+0x7d: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_panic+0x5d: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_start+0x114: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_end+0x123: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_machine_check+0x8f: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: noist_exc_machine_check+0x67: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_timed_out+0x78: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_check_crashing_cpu+0x65: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_severity+0x2b: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_severity_amd+0x85: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_severity_intel+0x10d: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: error_context+0x7c: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: sysvec_reboot+0x76: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: sysvec_reschedule_ipi+0x15b: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: sysvec_call_function+0x54: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: sysvec_call_function_single+0x54: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: sysvec_apic_timer_interrupt+0x57: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: spurious_interrupt+0x62: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: sysvec_spurious_apic_interrupt+0x54: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: sysvec_error_interrupt+0x54: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: sysvec_irq_move_cleanup+0x54: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: kvm_read_and_reset_apf_flags+0x2a: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __kvm_handle_async_pf+0x91: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: sysvec_kvm_asyncpf_interrupt+0x57: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_page_fault+0xbc: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: get_cpu_entry_area+0x24: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: warn_bogus_irq_restore+0x16: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: lockdep_hardirqs_on+0xb7: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: lockdep_hardirqs_off+0x95: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: lock_is_held_type+0x139: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: look_up_lock_class+0xec: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: match_held_lock+0x88: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: debug_lockdep_rcu_enabled+0x33: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_dynticks_inc+0x23: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_eqs_enter+0x108: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_nmi_exit+0xfc: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_dynticks_eqs_enter+0x17: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_irq_exit+0x2f: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_eqs_exit+0xf3: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_nmi_enter+0xf1: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_dynticks_eqs_exit+0x17: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_irq_enter+0x2f: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: enter_from_user_mode+0x94: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode+0x17b: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare+0x9c: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exit_to_user_mode+0x2d: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_exit_to_user_mode+0x99: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter_from_user_mode+0x94: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_exit_to_user_mode+0x34: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter+0x4f: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_exit+0x3c: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_enter+0x83: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_exit+0x78: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __ktime_get_real_seconds+0x10: call to __x86_return_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ibt_selftest+0x1e: sibling call from callable instruction with modified stack frame
>> vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x5f: relocation to !ENDBR: machine_kexec_prepare+0x49c


objdump-func vmlinux.o set_ftrace_ops_ro:
0000 00000000000d65fb <set_ftrace_ops_ro>:
0000    d65fb:	f3 0f 1e fa          	endbr64
0004    d65ff:	55                   	push   %rbp
0005    d6600:	48 89 e5             	mov    %rsp,%rbp
0008    d6603:	41 57                	push   %r15
000a    d6605:	41 56                	push   %r14
000c    d6607:	41 55                	push   %r13
000e    d6609:	41 54                	push   %r12
0010    d660b:	53                   	push   %rbx
0011    d660c:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	d660f: R_X86_64_32S	ftrace_ops_list
0018    d6613:	48 c1 e8 03          	shr    $0x3,%rax
001c    d6617:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0026    d6621:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
002a    d6625:	74 0c                	je     d6633 <set_ftrace_ops_ro+0x38>
002c    d6627:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	d662a: R_X86_64_32S	ftrace_ops_list
0033    d662e:	e8 00 00 00 00       	call   d6633 <set_ftrace_ops_ro+0x38>	d662f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0038    d6633:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # d663a <set_ftrace_ops_ro+0x3f>	d6636: R_X86_64_PC32	ftrace_ops_list-0x4
003f    d663a:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	d663d: R_X86_64_32S	ftrace_regs_caller
0046    d6641:	48 f7 d8             	neg    %rax
0049    d6644:	4c 8d 2c 05 00 00 00 00 	lea    0x0(,%rax,1),%r13	d6648: R_X86_64_32S	ftrace_regs_caller_end+0x1008
0051    d664c:	49 c1 ed 0c          	shr    $0xc,%r13
0055    d6650:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	d6653: R_X86_64_32S	ftrace_caller
005c    d6657:	48 f7 d8             	neg    %rax
005f    d665a:	4c 8d 24 05 00 00 00 00 	lea    0x0(,%rax,1),%r12	d665e: R_X86_64_32S	ftrace_caller_end+0x1008
0067    d6662:	49 c1 ec 0c          	shr    $0xc,%r12
006b    d6666:	4c 8d 73 10          	lea    0x10(%rbx),%r14
006f    d666a:	4c 89 f0             	mov    %r14,%rax
0072    d666d:	48 c1 e8 03          	shr    $0x3,%rax
0076    d6671:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0080    d667b:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
0084    d667f:	74 08                	je     d6689 <set_ftrace_ops_ro+0x8e>
0086    d6681:	4c 89 f7             	mov    %r14,%rdi
0089    d6684:	e8 00 00 00 00       	call   d6689 <set_ftrace_ops_ro+0x8e>	d6685: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
008e    d6689:	4d 8b 3e             	mov    (%r14),%r15
0091    d668c:	41 0f ba e7 0b       	bt     $0xb,%r15d
0096    d6691:	73 39                	jae    d66cc <set_ftrace_ops_ro+0xd1>
0098    d6693:	4c 8d b3 70 01 00 00 	lea    0x170(%rbx),%r14
009f    d669a:	4c 89 f0             	mov    %r14,%rax
00a2    d669d:	48 c1 e8 03          	shr    $0x3,%rax
00a6    d66a1:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
00b0    d66ab:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
00b4    d66af:	74 08                	je     d66b9 <set_ftrace_ops_ro+0xbe>
00b6    d66b1:	4c 89 f7             	mov    %r14,%rdi
00b9    d66b4:	e8 00 00 00 00       	call   d66b9 <set_ftrace_ops_ro+0xbe>	d66b5: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
00be    d66b9:	41 f6 c7 04          	test   $0x4,%r15b
00c2    d66bd:	49 8b 3e             	mov    (%r14),%rdi
00c5    d66c0:	44 89 ee             	mov    %r13d,%esi
00c8    d66c3:	41 0f 44 f4          	cmove  %r12d,%esi
00cc    d66c7:	e8 00 00 00 00       	call   d66cc <set_ftrace_ops_ro+0xd1>	d66c8: R_X86_64_PLT32	set_memory_ro-0x4
00d1    d66cc:	48 83 c3 08          	add    $0x8,%rbx
00d5    d66d0:	48 89 d8             	mov    %rbx,%rax
00d8    d66d3:	48 c1 e8 03          	shr    $0x3,%rax
00dc    d66d7:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
00e6    d66e1:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
00ea    d66e5:	74 08                	je     d66ef <set_ftrace_ops_ro+0xf4>
00ec    d66e7:	48 89 df             	mov    %rbx,%rdi
00ef    d66ea:	e8 00 00 00 00       	call   d66ef <set_ftrace_ops_ro+0xf4>	d66eb: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
00f4    d66ef:	48 8b 1b             	mov    (%rbx),%rbx
00f7    d66f2:	48 85 db             	test   %rbx,%rbx
00fa    d66f5:	74 10                	je     d6707 <set_ftrace_ops_ro+0x10c>
00fc    d66f7:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	d66fa: R_X86_64_32S	ftrace_list_end
0103    d66fe:	48 39 c3             	cmp    %rax,%rbx
0106    d6701:	0f 85 5f ff ff ff    	jne    d6666 <set_ftrace_ops_ro+0x6b>
010c    d6707:	5b                   	pop    %rbx
010d    d6708:	41 5c                	pop    %r12
010f    d670a:	41 5d                	pop    %r13
0111    d670c:	41 5e                	pop    %r14
0113    d670e:	41 5f                	pop    %r15
0115    d6710:	5d                   	pop    %rbp
0116    d6711:	31 c0                	xor    %eax,%eax
0118    d6713:	31 c9                	xor    %ecx,%ecx
011a    d6715:	31 ff                	xor    %edi,%edi
011c    d6717:	31 f6                	xor    %esi,%esi
011e    d6719:	e9 00 00 00 00       	jmp    d671e <arch_ftrace_update_trampoline>	d671a: R_X86_64_PLT32	__x86_return_thunk-0x4

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
