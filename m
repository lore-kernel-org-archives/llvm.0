Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D92A925;
	Mon, 14 Aug 2023 22:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692053378; x=1723589378;
  h=date:from:cc:subject:message-id:mime-version;
  bh=qEYU9R7gdXibegVI2RIIskU+XjZ77w9K93hIVhXvw3g=;
  b=hL663HY2N4UKZNL8J0NAcL0jOFh9nhGyfAYHiOYOhar4tRg6BpwHSbxb
   s6CE2Hzt/1sVz7QkJHLADf7xyGJBKaf6ov9ILmoI39j3kyTL2bZiZFJgq
   vkd8lruhdJAnkgHAWALOii18NGou21bNLagoiU2JTX1Vhe5XDkiRWe65H
   2ms4wiubRH1mo0TwOQ15KTznrEOqhCf+31AHE45WME9WR+2QZgzFx6NaF
   RdEsOPabuFaqvpzqwo2jn2Y5TYMha+F2lfRqfkAEeJu/Y2jGJtQ+CgyFL
   YFT31iD+l6PUcmlPgpLS8wSZPAP7A9xQg1UPdg0JfBgO5icbCVYlpUOS8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="375882369"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="375882369"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 15:49:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="980178033"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="980178033"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 14 Aug 2023 15:49:37 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVgNU-0000U7-1N;
	Mon, 14 Aug 2023 22:49:36 +0000
Date: Tue, 15 Aug 2023 06:48:41 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x3e: relocation to
 !ENDBR: machine_kexec+0x8e
Message-ID: <202308150652.agTFCpwn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Mark Rutland <mark.rutland@arm.com>
CC: "Steven Rostedt (Google)" <rostedt@goodmis.org>
CC: Florent Revest <revest@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2ccdd1b13c591d306f0401d98dedc4bdcd02b421
commit: fee86a4ed536f4e521f3a4530242e152dd2a466b ftrace: selftest: remove broken trace_direct_tramp
date:   5 months ago
config: x86_64-randconfig-r012-20230814 (https://download.01.org/0day-ci/archive/20230815/202308150652.agTFCpwn-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230815/202308150652.agTFCpwn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308150652.agTFCpwn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: ftrace_likely_update+0x5b: call to __stack_chk_fail() with UACCESS enabled
   vmlinux.o: warning: objtool: ocfs2_validate_and_adjust_move_goal() falls through to next function ocfs2_move_extents()
   vmlinux.o: warning: objtool: __ocfs2_move_extents_range() falls through to next function ocfs2_lock_meta_allocator_move_extents()
   vmlinux.o: warning: objtool: amd_spi_master_transfer() falls through to next function amd_spi_max_transfer_size()
   vmlinux.o: warning: objtool: ipc_imem_run_state_worker() falls through to next function ipc_imem_startup_timer_cb()
   vmlinux.o: warning: objtool: __rdgsbase_inactive+0x33: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __wrgsbase_inactive+0x37: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret+0x98: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: noist_exc_debug+0x54: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi+0xd8: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: poke_int3_handler+0x3b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: native_sched_clock+0x78: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_machine_check+0x5b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_machine_check+0x66: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_check_crashing_cpu+0x1b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: kvm_clock_read+0x32: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: pvclock_clocksource_read_nowd+0x8a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: local_clock+0x4c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: enter_from_user_mode+0x45: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode+0x51: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare+0x45: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter_from_user_mode+0x45: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_exit+0x3f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_enter+0x45: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_exit+0x75: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_exit_state+0x17: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_nmi_enter+0x2e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_enter_state+0x17: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_idle_enter+0x14: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_exit+0x3b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_idle_exit+0x4d: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_enter+0x15: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_irq_enter+0x37: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_irq_exit+0x37: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __ct_user_enter+0x3e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: context_tracking_recursion_enter+0x4c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: check_preemption_disabled+0x33: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mwait_idle+0x2b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_processor_ffh_cstate_enter+0x76: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: intel_idle+0x76: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: intel_idle_s2idle+0x80: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: intel_idle_irq+0x77: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: intel_idle_ibrs+0x7b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: intel_idle_xstate+0x7b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_idle_enter+0x4c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_idle_enter_s2idle+0x54: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: poll_idle+0x4b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x28: relocation to !ENDBR: arch_kexec_apply_relocations_add+0x13
>> vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x3e: relocation to !ENDBR: machine_kexec+0x8e


objdump-func vmlinux.o set_ftrace_ops_ro:
0000 000000000006fa80 <set_ftrace_ops_ro>:
0000    6fa80:	f3 0f 1e fa          	endbr64
0004    6fa84:	41 57                	push   %r15
0006    6fa86:	41 56                	push   %r14
0008    6fa88:	41 54                	push   %r12
000a    6fa8a:	53                   	push   %rbx
000b    6fa8b:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 6fa92 <set_ftrace_ops_ro+0x12>	6fa8e: R_X86_64_PC32	ftrace_ops_list-0x4
0012    6fa92:	e8 00 00 00 00       	call   6fa97 <set_ftrace_ops_ro+0x17>	6fa93: R_X86_64_PLT32	debug_lockdep_rcu_enabled-0x4
0017    6fa97:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	6fa9a: R_X86_64_32S	ftrace_list_end
001e    6fa9e:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	6faa1: R_X86_64_32S	ftrace_regs_caller
0025    6faa5:	48 f7 d8             	neg    %rax
0028    6faa8:	4c 8d 3c 05 00 00 00 00 	lea    0x0(,%rax,1),%r15	6faac: R_X86_64_32S	ftrace_regs_caller_end+0x1008
0030    6fab0:	49 c1 ef 0c          	shr    $0xc,%r15
0034    6fab4:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	6fab7: R_X86_64_32S	ftrace_caller
003b    6fabb:	48 f7 d8             	neg    %rax
003e    6fabe:	4c 8d 24 05 00 00 00 00 	lea    0x0(,%rax,1),%r12	6fac2: R_X86_64_32S	ftrace_caller_end+0x1008
0046    6fac6:	49 c1 ec 0c          	shr    $0xc,%r12
004a    6faca:	48 8b 43 10          	mov    0x10(%rbx),%rax
004e    6face:	0f ba e0 0b          	bt     $0xb,%eax
0052    6fad2:	73 15                	jae    6fae9 <set_ftrace_ops_ro+0x69>
0054    6fad4:	a8 04                	test   $0x4,%al
0056    6fad6:	48 8b bb 80 01 00 00 	mov    0x180(%rbx),%rdi
005d    6fadd:	44 89 fe             	mov    %r15d,%esi
0060    6fae0:	41 0f 44 f4          	cmove  %r12d,%esi
0064    6fae4:	e8 00 00 00 00       	call   6fae9 <set_ftrace_ops_ro+0x69>	6fae5: R_X86_64_PLT32	set_memory_ro-0x4
0069    6fae9:	48 8b 5b 08          	mov    0x8(%rbx),%rbx
006d    6faed:	e8 00 00 00 00       	call   6faf2 <set_ftrace_ops_ro+0x72>	6faee: R_X86_64_PLT32	debug_lockdep_rcu_enabled-0x4
0072    6faf2:	31 f6                	xor    %esi,%esi
0074    6faf4:	48 85 db             	test   %rbx,%rbx
0077    6faf7:	40 0f 95 c6          	setne  %sil
007b    6fafb:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	6fafe: R_X86_64_32S	_ftrace_annotated_branch+0x125d0
0082    6fb02:	ba 01 00 00 00       	mov    $0x1,%edx
0087    6fb07:	31 c9                	xor    %ecx,%ecx
0089    6fb09:	e8 00 00 00 00       	call   6fb0e <set_ftrace_ops_ro+0x8e>	6fb0a: R_X86_64_PLT32	ftrace_likely_update-0x4
008e    6fb0e:	48 85 db             	test   %rbx,%rbx
0091    6fb11:	74 1e                	je     6fb31 <set_ftrace_ops_ro+0xb1>
0093    6fb13:	31 f6                	xor    %esi,%esi
0095    6fb15:	4c 39 f3             	cmp    %r14,%rbx
0098    6fb18:	40 0f 95 c6          	setne  %sil
009c    6fb1c:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	6fb1f: R_X86_64_32S	_ftrace_annotated_branch+0x12600
00a3    6fb23:	31 d2                	xor    %edx,%edx
00a5    6fb25:	31 c9                	xor    %ecx,%ecx
00a7    6fb27:	e8 00 00 00 00       	call   6fb2c <set_ftrace_ops_ro+0xac>	6fb28: R_X86_64_PLT32	ftrace_likely_update-0x4
00ac    6fb2c:	4c 39 f3             	cmp    %r14,%rbx
00af    6fb2f:	75 99                	jne    6faca <set_ftrace_ops_ro+0x4a>
00b1    6fb31:	5b                   	pop    %rbx
00b2    6fb32:	41 5c                	pop    %r12
00b4    6fb34:	41 5e                	pop    %r14
00b6    6fb36:	41 5f                	pop    %r15
00b8    6fb38:	c3                   	ret
00b9    6fb39:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
