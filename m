Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40432187855;
	Sat, 28 Sep 2024 12:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727526388; cv=none; b=WVSSCtwiUI4pYPfKI3vaMLUzV3UBwMOT7BkQeTn6WuKPkInakn924PsY9ZNR8jYDJk/hJksHsIzG4hegsiAmeg8Ft1uWmMWvDfMrI84m/lhWpMHTnAbQS4Ts7W1aTsaHgNTwXSLTRuuvdbmSkwbVZW4H7EW8qjlW4FqnU8ASC8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727526388; c=relaxed/simple;
	bh=2kyTLnoEerTnSQhN6/ZFHcRYbc3uRPOorPiyDm7Y0rs=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V3BqByJd0AjNWF9n5zgvOLmzJcCTpdHUDElWpccownzIOXGfKa3aD0vfrOFCQlgD5+Rm2eGNB1X2ju4H9LcE4WKkJWLILgclKOPhrMmxow14I/qmHsmX4K+AOnin5GViu06iWj0IGgf+iVxlinYktldZA+4FRx7GQcQsq8fm0Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZhNTpJ4A; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZhNTpJ4A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727526380; x=1759062380;
  h=date:from:cc:subject:message-id:mime-version;
  bh=2kyTLnoEerTnSQhN6/ZFHcRYbc3uRPOorPiyDm7Y0rs=;
  b=ZhNTpJ4A7ikeTgP4WWvKPJg2bs4rcgYXgopYF4nq9XfpAmneIA77iiBT
   HThODBvzWJcmc0nfjZRb35eWeCDWB4RhnkHDHMIwO6zPMbPYsTz0ikFVV
   eaPXZGpB9dxyJHAoD8ESs2tas7R6PDP4UJnJ31c86O4fth81x/IDadcbJ
   SUgAFBoifNDkjXSOpL4SUgHj1+5yWp5246mym1mEahi/YoGRPLMU/zMzj
   mQ012GyK97HLTeaST7apb+16M4xi0FHaljzNR4542L5ATVCJ1Rc44EbF/
   ytGThszLPSsUhkEQboCPFDw4qR30n+fkLFpKaZ4e2o4oY8edDvVdaNClF
   w==;
X-CSE-ConnectionGUID: KpAmMKT4RmqeWFiGnOo7Ew==
X-CSE-MsgGUID: ZaXh2ADrTWC1nUFXsoNYCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="26174329"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="26174329"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 05:26:17 -0700
X-CSE-ConnectionGUID: 3z40fVqaQJyLz55yUdJLoA==
X-CSE-MsgGUID: GCsBNY9OQhGSNEasGJiILQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="72677338"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 28 Sep 2024 05:26:15 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suWWa-000NFf-0x;
	Sat, 28 Sep 2024 12:26:12 +0000
Date: Sat, 28 Sep 2024 20:25:47 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: shrink_node+0xda4: sibling call from
 callable instruction with modified stack frame
Message-ID: <202409282048.xqFDhEN7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Sean Christopherson <seanjc@google.com>
CC: "Borislav Petkov (AMD)" <bp@alien8.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ad46e8f95e931e113cb98253daf6d443ac244cde
commit: fe42754b94a42d08cf9501790afc25c4f6a5f631 cpu: Re-enable CPU mitigations by default for !X86 architectures
date:   5 months ago
config: x86_64-buildonly-randconfig-005-20240927 (https://download.01.org/0day-ci/archive/20240928/202409282048.xqFDhEN7-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409282048.xqFDhEN7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409282048.xqFDhEN7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: do_syscall_64+0x75: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fred_entry_from_user+0xd9: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fred_extint+0x41: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fred_hwexc+0x3b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fred_entry_from_kernel+0xd2: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret+0x7a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_debug_user+0x34: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi+0x43: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fred_exc_nmi+0x2d: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: poke_int3_handler+0x50: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: native_sched_clock+0x72: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: wait_for_cpus+0x23: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: local_clock_noinstr+0x74: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare+0x4a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter_from_user_mode+0x4a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_enter+0x45: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_exit+0x5f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_exit_state+0x20: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_nmi_enter+0x29: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_enter_state+0x20: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_idle_enter+0x10: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_exit+0x3a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_idle_exit+0x37: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_enter+0x26: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __ct_user_enter+0x38: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: context_tracking_recursion_enter+0x42: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mwait_idle+0x29: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_processor_ffh_cstate_enter+0x81: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_idle_enter+0x44: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_idle_enter_s2idle+0x4c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: poll_idle+0x48: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __x64_sys_waitid+0x3c6: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: futex_cmpxchg_value_locked+0xc5: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: futex_wake_op+0x497: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: __sanitizer_cov_trace_cmp1+0xf: call to write_comp_data.llvm.14491697770411999554() with UACCESS enabled
   vmlinux.o: warning: objtool: __sanitizer_cov_trace_cmp2+0x12: call to write_comp_data.llvm.14491697770411999554() with UACCESS enabled
   vmlinux.o: warning: objtool: __sanitizer_cov_trace_cmp4+0x12: call to write_comp_data.llvm.14491697770411999554() with UACCESS enabled
   vmlinux.o: warning: objtool: __sanitizer_cov_trace_cmp8+0xf: call to write_comp_data.llvm.14491697770411999554() with UACCESS enabled
   vmlinux.o: warning: objtool: __sanitizer_cov_trace_const_cmp1+0x12: call to write_comp_data.llvm.14491697770411999554() with UACCESS enabled
   vmlinux.o: warning: objtool: __sanitizer_cov_trace_const_cmp2+0x12: call to write_comp_data.llvm.14491697770411999554() with UACCESS enabled
   vmlinux.o: warning: objtool: __sanitizer_cov_trace_const_cmp4+0x12: call to write_comp_data.llvm.14491697770411999554() with UACCESS enabled
   vmlinux.o: warning: objtool: __sanitizer_cov_trace_const_cmp8+0xf: call to write_comp_data.llvm.14491697770411999554() with UACCESS enabled
   vmlinux.o: warning: objtool: __sanitizer_cov_trace_switch+0x50: call to write_comp_data.llvm.14491697770411999554() with UACCESS enabled
   vmlinux.o: warning: objtool: __rseq_handle_notify_resume+0xe84: call to __tsan_unaligned_read_write8() with UACCESS enabled
>> vmlinux.o: warning: objtool: shrink_node+0xda4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: fault_in_writeable+0x11b: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: fault_in_readable+0x11c: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: fillonedir+0x1d2: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: filldir+0x35a: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: filldir64+0x35a: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: __x64_sys_pselect6+0x123: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: do_sys_poll+0xd43: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: .text.jffs2_erase_pending_blocks: unexpected end of section
   vmlinux.o: warning: objtool: io_waitid_finish+0x111: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: copy_compat_iovec_from_user+0xde: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: copy_iovec_from_user+0xd4: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: check_zeroed_user+0x125: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: strncpy_from_user+0x24c: call to __tsan_unaligned_read_write8() with UACCESS enabled
   vmlinux.o: warning: objtool: strnlen_user+0x1fa: call to __tsan_unaligned_read_write8() with UACCESS enabled


objdump-func vmlinux.o shrink_node:
0000 0000000000000000 <shrink_node>:
0000        0:	e8 00 00 00 00       	call   5 <shrink_node+0x5>	1: R_X86_64_PLT32	__fentry__-0x4
0005        5:	55                   	push   %rbp
0006        6:	48 89 e5             	mov    %rsp,%rbp
0009        9:	41 57                	push   %r15
000b        b:	41 56                	push   %r14
000d        d:	41 55                	push   %r13
000f        f:	41 54                	push   %r12
0011       11:	53                   	push   %rbx
0012       12:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
0016       16:	48 8d a4 24 c0 fd ff ff 	lea    -0x240(%rsp),%rsp
001e       1e:	49 89 ff             	mov    %rdi,%r15
0021       21:	48 8b 7d 08          	mov    0x8(%rbp),%rdi
0025       25:	49 89 f6             	mov    %rsi,%r14
0028       28:	e8 00 00 00 00       	call   2d <shrink_node+0x2d>	29: R_X86_64_PLT32	__tsan_func_entry-0x4
002d       2d:	e8 00 00 00 00       	call   32 <shrink_node+0x32>	2e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0032       32:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 39 <shrink_node+0x39>	35: R_X86_64_PC32	_ftrace_branch+0x883b4
0039       39:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	3c: R_X86_64_32S	_ftrace_branch+0x883b8
0040       40:	48 ff c3             	inc    %rbx
0043       43:	e8 00 00 00 00       	call   48 <shrink_node+0x48>	44: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
0048       48:	49 8d 87 48 21 00 00 	lea    0x2148(%r15),%rax
004f       4f:	49 8d 8f e0 21 00 00 	lea    0x21e0(%r15),%rcx
0056       56:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 5d <shrink_node+0x5d>	59: R_X86_64_PC32	_ftrace_branch+0x883b4
005d       5d:	49 8d 7e 48          	lea    0x48(%r14),%rdi
0061       61:	49 8d 5e 40          	lea    0x40(%r14),%rbx
0065       65:	4d 8d af 98 21 00 00 	lea    0x2198(%r15),%r13
006c       6c:	4d 8d a7 e8 21 00 00 	lea    0x21e8(%r15),%r12
0073       73:	4c 89 7c 24 58       	mov    %r15,0x58(%rsp)
0078       78:	4c 89 74 24 08       	mov    %r14,0x8(%rsp)
007d       7d:	48 89 44 24 70       	mov    %rax,0x70(%rsp)
0082       82:	49 8d 46 18          	lea    0x18(%r14),%rax
0086       86:	4c 89 6c 24 68       	mov    %r13,0x68(%rsp)
008b       8b:	48 89 bc 24 98 00 00 00 	mov    %rdi,0x98(%rsp)
0093       93:	48 89 5c 24 60       	mov    %rbx,0x60(%rsp)
0098       98:	48 89 8c 24 68 01 00 00 	mov    %rcx,0x168(%rsp)
00a0       a0:	4c 89 a4 24 60 01 00 00 	mov    %r12,0x160(%rsp)
00a8       a8:	48 89 84 24 00 01 00 00 	mov    %rax,0x100(%rsp)
00b0       b0:	49 8d 46 20          	lea    0x20(%r14),%rax
00b4       b4:	48 89 84 24 f8 00 00 00 	mov    %rax,0xf8(%rsp)
00bc       bc:	49 8d 87 f8 21 00 00 	lea    0x21f8(%r15),%rax
00c3       c3:	48 89 84 24 58 01 00 00 	mov    %rax,0x158(%rsp)
00cb       cb:	49 8d 87 00 22 00 00 	lea    0x2200(%r15),%rax
00d2       d2:	48 89 84 24 50 01 00 00 	mov    %rax,0x150(%rsp)
00da       da:	49 8d 46 2c          	lea    0x2c(%r14),%rax
00de       de:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
00e3       e3:	49 8d 46 2d          	lea    0x2d(%r14),%rax
00e7       e7:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
00ec       ec:	49 8d 46 30          	lea    0x30(%r14),%rax
00f0       f0:	48 89 84 24 a8 00 00 00 	mov    %rax,0xa8(%rsp)
00f8       f8:	49 8d 87 10 1f 00 00 	lea    0x1f10(%r15),%rax
00ff       ff:	48 89 84 24 90 01 00 00 	mov    %rax,0x190(%rsp)
0107      107:	49 8d 87 c8 1e 00 00 	lea    0x1ec8(%r15),%rax
010e      10e:	48 89 84 24 80 01 00 00 	mov    %rax,0x180(%rsp)
0116      116:	49 8d 46 50          	lea    0x50(%r14),%rax
011a      11a:	48 89 84 24 90 00 00 00 	mov    %rax,0x90(%rsp)
0122      122:	49 8d 46 4c          	lea    0x4c(%r14),%rax
0126      126:	48 89 84 24 30 01 00 00 	mov    %rax,0x130(%rsp)
012e      12e:	49 8d 46 54          	lea    0x54(%r14),%rax
0132      132:	48 89 84 24 28 01 00 00 	mov    %rax,0x128(%rsp)
013a      13a:	49 8d 46 58          	lea    0x58(%r14),%rax
013e      13e:	48 89 84 24 20 01 00 00 	mov    %rax,0x120(%rsp)
0146      146:	49 8d 46 60          	lea    0x60(%r14),%rax
014a      14a:	48 89 84 24 88 00 00 00 	mov    %rax,0x88(%rsp)
0152      152:	49 8d 46 5c          	lea    0x5c(%r14),%rax
0156      156:	48 89 84 24 18 01 00 00 	mov    %rax,0x118(%rsp)
015e      15e:	49 8d 87 b8 1d 00 00 	lea    0x1db8(%r15),%rax
0165      165:	48 89 84 24 38 01 00 00 	mov    %rax,0x138(%rsp)
016d      16d:	49 8d 87 10 22 00 00 	lea    0x2210(%r15),%rax
0174      174:	48 89 84 24 e0 00 00 00 	mov    %rax,0xe0(%rsp)
017c      17c:	49 8d 87 08 22 00 00 	lea    0x2208(%r15),%rax
0183      183:	48 89 84 24 f0 00 00 00 	mov    %rax,0xf0(%rsp)
018b      18b:	49 8d 46 2b          	lea    0x2b(%r14),%rax
018f      18f:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
0194      194:	49 8d 87 80 00 00 00 	lea    0x80(%r15),%rax
019b      19b:	48 89 84 24 10 01 00 00 	mov    %rax,0x110(%rsp)
01a3      1a3:	49 8d 87 c8 06 00 00 	lea    0x6c8(%r15),%rax
01aa      1aa:	49 89 cf             	mov    %rcx,%r15
01ad      1ad:	48 89 84 24 70 01 00 00 	mov    %rax,0x170(%rsp)
01b5      1b5:	31 c0                	xor    %eax,%eax
01b7      1b7:	48 89 84 24 e8 00 00 00 	mov    %rax,0xe8(%rsp)
01bf      1bf:	ba 1c 00 00 00       	mov    $0x1c,%edx
01c4      1c4:	31 f6                	xor    %esi,%esi
01c6      1c6:	e8 00 00 00 00       	call   1cb <shrink_node+0x1cb>	1c7: R_X86_64_PLT32	__tsan_memset-0x4
01cb      1cb:	48 89 df             	mov    %rbx,%rdi
01ce      1ce:	e8 00 00 00 00       	call   1d3 <shrink_node+0x1d3>	1cf: R_X86_64_PLT32	__tsan_read8-0x4
01d3      1d3:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 1da <shrink_node+0x1da>	1d6: R_X86_64_PC32	_ftrace_branch+0x88484
01da      1da:	49 8b 46 40          	mov    0x40(%r14),%rax
01de      1de:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1e1: R_X86_64_32S	_ftrace_branch+0x88488
01e5      1e5:	48 89 84 24 08 01 00 00 	mov    %rax,0x108(%rsp)
01ed      1ed:	48 ff c3             	inc    %rbx
01f0      1f0:	e8 00 00 00 00       	call   1f5 <shrink_node+0x1f5>	1f1: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
01f5      1f5:	4c 89 ef             	mov    %r13,%rdi
01f8      1f8:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 1ff <shrink_node+0x1ff>	1fb: R_X86_64_PC32	_ftrace_branch+0x88484
01ff      1ff:	e8 00 00 00 00       	call   204 <shrink_node+0x204>	200: R_X86_64_PLT32	_raw_spin_lock_irq-0x4
0204      204:	4c 89 ff             	mov    %r15,%rdi
0207      207:	e8 00 00 00 00       	call   20c <shrink_node+0x20c>	208: R_X86_64_PLT32	__tsan_read8-0x4
020c      20c:	48 8b bc 24 00 01 00 00 	mov    0x100(%rsp),%rdi
0214      214:	49 8b 1f             	mov    (%r15),%rbx
0217      217:	e8 00 00 00 00       	call   21c <shrink_node+0x21c>	218: R_X86_64_PLT32	__tsan_write8-0x4
021c      21c:	4c 89 e7             	mov    %r12,%rdi
021f      21f:	49 89 5e 18          	mov    %rbx,0x18(%r14)
0223      223:	e8 00 00 00 00       	call   228 <shrink_node+0x228>	224: R_X86_64_PLT32	__tsan_read8-0x4
0228      228:	48 8b bc 24 f8 00 00 00 	mov    0xf8(%rsp),%rdi
0230      230:	49 8b 1c 24          	mov    (%r12),%rbx
0234      234:	e8 00 00 00 00       	call   239 <shrink_node+0x239>	235: R_X86_64_PLT32	__tsan_write8-0x4
0239      239:	4c 89 ef             	mov    %r13,%rdi
023c      23c:	49 89 5e 20          	mov    %rbx,0x20(%r14)
0240      240:	e8 00 00 00 00       	call   245 <shrink_node+0x245>	241: R_X86_64_PLT32	_raw_spin_unlock_irq-0x4
0245      245:	41 0f b6 5e 2a       	movzbl 0x2a(%r14),%ebx
024a      24a:	41 0f b7 46 28       	movzwl 0x28(%r14),%eax
024f      24f:	c1 e3 10             	shl    $0x10,%ebx
0252      252:	09 c3                	or     %eax,%ebx
0254      254:	f6 c3 04             	test   $0x4,%bl
0257      257:	75 6d                	jne    2c6 <shrink_node+0x2c6>
0259      259:	e8 00 00 00 00       	call   25e <shrink_node+0x25e>	25a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
025e      25e:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 265 <shrink_node+0x265>	261: R_X86_64_PC32	_ftrace_branch+0x88494
0265      265:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	268: R_X86_64_32S	_ftrace_branch+0x88498
026c      26c:	48 ff c3             	inc    %rbx
026f      26f:	e8 00 00 00 00       	call   274 <shrink_node+0x274>	270: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
0274      274:	be 08 00 00 00       	mov    $0x8,%esi
0279      279:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	27c: R_X86_64_32S	vm_node_stat+0x60
0280      280:	ba 04 00 00 00       	mov    $0x4,%edx
0285      285:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 28c <shrink_node+0x28c>	288: R_X86_64_PC32	_ftrace_branch+0x88494
028c      28c:	e8 00 00 00 00       	call   291 <shrink_node+0x291>	28d: R_X86_64_PLT32	__kcsan_check_access-0x4
0291      291:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	294: R_X86_64_32S	vm_node_stat+0x60
0298      298:	e8 00 00 00 00       	call   29d <shrink_node+0x29d>	299: R_X86_64_PLT32	__tsan_volatile_read8-0x4
029d      29d:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 2a4 <shrink_node+0x2a4>	2a0: R_X86_64_PC32	vm_node_stat+0x5c
02a4      2a4:	48 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%rdi
02ab      2ab:	48 89 de             	mov    %rbx,%rsi
02ae      2ae:	e8 00 00 00 00       	call   2b3 <shrink_node+0x2b3>	2af: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
02b3      2b3:	48 85 db             	test   %rbx,%rbx
02b6      2b6:	78 3d                	js     2f5 <shrink_node+0x2f5>
02b8      2b8:	e8 00 00 00 00       	call   2bd <shrink_node+0x2bd>	2b9: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
02bd      2bd:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	2c0: R_X86_64_32S	_ftrace_branch+0x877f8
02c4      2c4:	eb 3d                	jmp    303 <shrink_node+0x303>
02c6      2c6:	e8 00 00 00 00       	call   2cb <shrink_node+0x2cb>	2c7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
02cb      2cb:	4c 8b 35 00 00 00 00 	mov    0x0(%rip),%r14        # 2d2 <shrink_node+0x2d2>	2ce: R_X86_64_PC32	_ftrace_branch+0x8848c
02d2      2d2:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2d5: R_X86_64_32S	_ftrace_branch+0x88490
02d9      2d9:	49 ff c6             	inc    %r14
02dc      2dc:	e8 00 00 00 00       	call   2e1 <shrink_node+0x2e1>	2dd: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
02e1      2e1:	4c 89 35 00 00 00 00 	mov    %r14,0x0(%rip)        # 2e8 <shrink_node+0x2e8>	2e4: R_X86_64_PC32	_ftrace_branch+0x8848c
02e8      2e8:	83 cb 03             	or     $0x3,%ebx
02eb      2eb:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
02f0      2f0:	e9 e0 01 00 00       	jmp    4d5 <shrink_node+0x4d5>
02f5      2f5:	e8 00 00 00 00       	call   2fa <shrink_node+0x2fa>	2f6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
02fa      2fa:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	2fd: R_X86_64_32S	_ftrace_branch+0x87800
0301      301:	31 db                	xor    %ebx,%ebx
0303      303:	4d 8b 3e             	mov    (%r14),%r15
0306      306:	4c 89 f7             	mov    %r14,%rdi
0309      309:	49 ff c7             	inc    %r15
030c      30c:	e8 00 00 00 00       	call   311 <shrink_node+0x311>	30d: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
0311      311:	4d 89 3e             	mov    %r15,(%r14)
0314      314:	4c 8b b4 24 58 01 00 00 	mov    0x158(%rsp),%r14
031c      31c:	4c 89 f7             	mov    %r14,%rdi
031f      31f:	e8 00 00 00 00       	call   324 <shrink_node+0x324>	320: R_X86_64_PLT32	__tsan_read8-0x4
0324      324:	4d 8b 36             	mov    (%r14),%r14
0327      327:	48 89 df             	mov    %rbx,%rdi
032a      32a:	4c 89 f6             	mov    %r14,%rsi
032d      32d:	e8 00 00 00 00       	call   332 <shrink_node+0x332>	32e: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
0332      332:	4c 39 f3             	cmp    %r14,%rbx
0335      335:	75 12                	jne    349 <shrink_node+0x349>
0337      337:	31 ff                	xor    %edi,%edi
0339      339:	e8 00 00 00 00       	call   33e <shrink_node+0x33e>	33a: R_X86_64_PLT32	.text.inactive_is_low-0x4
033e      33e:	84 c0                	test   %al,%al
0340      340:	74 40                	je     382 <shrink_node+0x382>
0342      342:	e8 00 00 00 00       	call   347 <shrink_node+0x347>	343: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0347      347:	eb 05                	jmp    34e <shrink_node+0x34e>
0349      349:	e8 00 00 00 00       	call   34e <shrink_node+0x34e>	34a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
034e      34e:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 355 <shrink_node+0x355>	351: R_X86_64_PC32	_ftrace_branch+0x884a4
0355      355:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	358: R_X86_64_32S	_ftrace_branch+0x884a8
035c      35c:	48 ff c3             	inc    %rbx
035f      35f:	e8 00 00 00 00       	call   364 <shrink_node+0x364>	360: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
0364      364:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 36b <shrink_node+0x36b>	367: R_X86_64_PC32	_ftrace_branch+0x884a4
036b      36b:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
0370      370:	0f b6 42 2a          	movzbl 0x2a(%rdx),%eax
0374      374:	0f b7 4a 28          	movzwl 0x28(%rdx),%ecx
0378      378:	c1 e0 10             	shl    $0x10,%eax
037b      37b:	09 c8                	or     %ecx,%eax
037d      37d:	83 c8 01             	or     $0x1,%eax
0380      380:	eb 37                	jmp    3b9 <shrink_node+0x3b9>
0382      382:	e8 00 00 00 00       	call   387 <shrink_node+0x387>	383: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0387      387:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 38e <shrink_node+0x38e>	38a: R_X86_64_PC32	_ftrace_branch+0x8849c
038e      38e:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	391: R_X86_64_32S	_ftrace_branch+0x884a0
0395      395:	48 ff c3             	inc    %rbx
0398      398:	e8 00 00 00 00       	call   39d <shrink_node+0x39d>	399: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
039d      39d:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 3a4 <shrink_node+0x3a4>	3a0: R_X86_64_PC32	_ftrace_branch+0x8849c
03a4      3a4:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
03a9      3a9:	0f b6 42 2a          	movzbl 0x2a(%rdx),%eax
03ad      3ad:	0f b7 4a 28          	movzwl 0x28(%rdx),%ecx
03b1      3b1:	c1 e0 10             	shl    $0x10,%eax
03b4      3b4:	09 c8                	or     %ecx,%eax
03b6      3b6:	83 e0 fe             	and    $0xfffffffe,%eax
03b9      3b9:	66 89 42 28          	mov    %ax,0x28(%rdx)
03bd      3bd:	c1 e8 10             	shr    $0x10,%eax
03c0      3c0:	be 08 00 00 00       	mov    $0x8,%esi
03c5      3c5:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	3c8: R_X86_64_32S	vm_node_stat+0x68
03cc      3cc:	88 42 2a             	mov    %al,0x2a(%rdx)
03cf      3cf:	ba 04 00 00 00       	mov    $0x4,%edx
03d4      3d4:	e8 00 00 00 00       	call   3d9 <shrink_node+0x3d9>	3d5: R_X86_64_PLT32	__kcsan_check_access-0x4
03d9      3d9:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	3dc: R_X86_64_32S	vm_node_stat+0x68
03e0      3e0:	e8 00 00 00 00       	call   3e5 <shrink_node+0x3e5>	3e1: R_X86_64_PLT32	__tsan_volatile_read8-0x4
03e5      3e5:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 3ec <shrink_node+0x3ec>	3e8: R_X86_64_PC32	vm_node_stat+0x64
03ec      3ec:	48 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%rdi
03f3      3f3:	48 89 de             	mov    %rbx,%rsi
03f6      3f6:	e8 00 00 00 00       	call   3fb <shrink_node+0x3fb>	3f7: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
03fb      3fb:	48 85 db             	test   %rbx,%rbx
03fe      3fe:	78 0e                	js     40e <shrink_node+0x40e>
0400      400:	e8 00 00 00 00       	call   405 <shrink_node+0x405>	401: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0405      405:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	408: R_X86_64_32S	_ftrace_branch+0x877f8
040c      40c:	eb 0e                	jmp    41c <shrink_node+0x41c>
040e      40e:	e8 00 00 00 00       	call   413 <shrink_node+0x413>	40f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0413      413:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	416: R_X86_64_32S	_ftrace_branch+0x87800
041a      41a:	31 db                	xor    %ebx,%ebx
041c      41c:	4d 8b 3e             	mov    (%r14),%r15
041f      41f:	4c 89 f7             	mov    %r14,%rdi
0422      422:	49 ff c7             	inc    %r15
0425      425:	e8 00 00 00 00       	call   42a <shrink_node+0x42a>	426: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
042a      42a:	4d 89 3e             	mov    %r15,(%r14)
042d      42d:	4c 8b b4 24 50 01 00 00 	mov    0x150(%rsp),%r14
0435      435:	4c 89 f7             	mov    %r14,%rdi
0438      438:	e8 00 00 00 00       	call   43d <shrink_node+0x43d>	439: R_X86_64_PLT32	__tsan_read8-0x4
043d      43d:	4d 8b 36             	mov    (%r14),%r14
0440      440:	48 89 df             	mov    %rbx,%rdi
0443      443:	4c 89 f6             	mov    %r14,%rsi
0446      446:	e8 00 00 00 00       	call   44b <shrink_node+0x44b>	447: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
044b      44b:	4c 39 f3             	cmp    %r14,%rbx
044e      44e:	75 15                	jne    465 <shrink_node+0x465>
0450      450:	bf 02 00 00 00       	mov    $0x2,%edi
0455      455:	e8 00 00 00 00       	call   45a <shrink_node+0x45a>	456: R_X86_64_PLT32	.text.inactive_is_low-0x4
045a      45a:	84 c0                	test   %al,%al
045c      45c:	74 40                	je     49e <shrink_node+0x49e>
045e      45e:	e8 00 00 00 00       	call   463 <shrink_node+0x463>	45f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0463      463:	eb 05                	jmp    46a <shrink_node+0x46a>
0465      465:	e8 00 00 00 00       	call   46a <shrink_node+0x46a>	466: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
046a      46a:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 471 <shrink_node+0x471>	46d: R_X86_64_PC32	_ftrace_branch+0x884b4
0471      471:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	474: R_X86_64_32S	_ftrace_branch+0x884b8
0478      478:	48 ff c3             	inc    %rbx
047b      47b:	e8 00 00 00 00       	call   480 <shrink_node+0x480>	47c: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
0480      480:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 487 <shrink_node+0x487>	483: R_X86_64_PC32	_ftrace_branch+0x884b4
0487      487:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
048c      48c:	0f b6 59 2a          	movzbl 0x2a(%rcx),%ebx
0490      490:	0f b7 41 28          	movzwl 0x28(%rcx),%eax
0494      494:	c1 e3 10             	shl    $0x10,%ebx
0497      497:	09 c3                	or     %eax,%ebx
0499      499:	83 cb 02             	or     $0x2,%ebx
049c      49c:	eb 37                	jmp    4d5 <shrink_node+0x4d5>
049e      49e:	e8 00 00 00 00       	call   4a3 <shrink_node+0x4a3>	49f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
04a3      4a3:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 4aa <shrink_node+0x4aa>	4a6: R_X86_64_PC32	_ftrace_branch+0x884ac
04aa      4aa:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	4ad: R_X86_64_32S	_ftrace_branch+0x884b0
04b1      4b1:	48 ff c3             	inc    %rbx
04b4      4b4:	e8 00 00 00 00       	call   4b9 <shrink_node+0x4b9>	4b5: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
04b9      4b9:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 4c0 <shrink_node+0x4c0>	4bc: R_X86_64_PC32	_ftrace_branch+0x884ac
04c0      4c0:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
04c5      4c5:	0f b6 59 2a          	movzbl 0x2a(%rcx),%ebx
04c9      4c9:	0f b7 41 28          	movzwl 0x28(%rcx),%eax
04cd      4cd:	c1 e3 10             	shl    $0x10,%ebx
04d0      4d0:	09 c3                	or     %eax,%ebx
04d2      4d2:	83 e3 fd             	and    $0xfffffffd,%ebx
04d5      4d5:	66 89 59 28          	mov    %bx,0x28(%rcx)
04d9      4d9:	c1 eb 10             	shr    $0x10,%ebx
04dc      4dc:	be 08 00 00 00       	mov    $0x8,%esi
04e1      4e1:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	4e4: R_X86_64_32S	vm_node_stat+0x10
04e8      4e8:	ba 04 00 00 00       	mov    $0x4,%edx
04ed      4ed:	88 59 2a             	mov    %bl,0x2a(%rcx)
04f0      4f0:	e8 00 00 00 00       	call   4f5 <shrink_node+0x4f5>	4f1: R_X86_64_PLT32	__kcsan_check_access-0x4
04f5      4f5:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	4f8: R_X86_64_32S	vm_node_stat+0x10
04fc      4fc:	e8 00 00 00 00       	call   501 <shrink_node+0x501>	4fd: R_X86_64_PLT32	__tsan_volatile_read8-0x4
0501      501:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 508 <shrink_node+0x508>	504: R_X86_64_PC32	vm_node_stat+0xc
0508      508:	48 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%rdi
050f      50f:	48 89 de             	mov    %rbx,%rsi
0512      512:	e8 00 00 00 00       	call   517 <shrink_node+0x517>	513: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0517      517:	48 85 db             	test   %rbx,%rbx
051a      51a:	78 0e                	js     52a <shrink_node+0x52a>
051c      51c:	e8 00 00 00 00       	call   521 <shrink_node+0x521>	51d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0521      521:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	524: R_X86_64_32S	_ftrace_branch+0x877f8
0528      528:	eb 0e                	jmp    538 <shrink_node+0x538>
052a      52a:	e8 00 00 00 00       	call   52f <shrink_node+0x52f>	52b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
052f      52f:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	532: R_X86_64_32S	_ftrace_branch+0x87800
0536      536:	31 db                	xor    %ebx,%ebx
0538      538:	4d 8b 3e             	mov    (%r14),%r15
053b      53b:	4c 89 f7             	mov    %r14,%rdi
053e      53e:	49 ff c7             	inc    %r15
0541      541:	e8 00 00 00 00       	call   546 <shrink_node+0x546>	542: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
0546      546:	4d 89 3e             	mov    %r15,(%r14)
0549      549:	4c 8b 74 24 28       	mov    0x28(%rsp),%r14
054e      54e:	4c 89 f7             	mov    %r14,%rdi
0551      551:	e8 00 00 00 00       	call   556 <shrink_node+0x556>	552: R_X86_64_PLT32	__tsan_read1-0x4
0556      556:	49 0f be 06          	movsbq (%r14),%rax
055a      55a:	bf 40 00 00 00       	mov    $0x40,%edi
055f      55f:	41 89 c6             	mov    %eax,%r14d
0562      562:	4c 89 f6             	mov    %r14,%rsi
0565      565:	e8 00 00 00 00       	call   56a <shrink_node+0x56a>	566: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
056a      56a:	49 83 fe 3f          	cmp    $0x3f,%r14
056e      56e:	0f 87 b9 2c 00 00    	ja     322d <shrink_node+0x322d>
0574      574:	e8 00 00 00 00       	call   579 <shrink_node+0x579>	575: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0579      579:	49 89 df             	mov    %rbx,%r15
057c      57c:	44 89 f1             	mov    %r14d,%ecx
057f      57f:	31 ff                	xor    %edi,%edi
0581      581:	49 d3 ef             	shr    %cl,%r15
0584      584:	4c 89 fe             	mov    %r15,%rsi
0587      587:	e8 00 00 00 00       	call   58c <shrink_node+0x58c>	588: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
058c      58c:	4d 85 ff             	test   %r15,%r15
058f      58f:	74 14                	je     5a5 <shrink_node+0x5a5>
0591      591:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
0596      596:	0f b7 40 28          	movzwl 0x28(%rax),%eax
059a      59a:	a8 02                	test   $0x2,%al
059c      59c:	75 0e                	jne    5ac <shrink_node+0x5ac>
059e      59e:	e8 00 00 00 00       	call   5a3 <shrink_node+0x5a3>	59f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
05a3      5a3:	eb 0c                	jmp    5b1 <shrink_node+0x5b1>
05a5      5a5:	e8 00 00 00 00       	call   5aa <shrink_node+0x5aa>	5a6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
05aa      5aa:	eb 05                	jmp    5b1 <shrink_node+0x5b1>
05ac      5ac:	e8 00 00 00 00       	call   5b1 <shrink_node+0x5b1>	5ad: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
05b1      5b1:	4c 8b 74 24 28       	mov    0x28(%rsp),%r14
05b6      5b6:	4c 89 f7             	mov    %r14,%rdi
05b9      5b9:	e8 00 00 00 00       	call   5be <shrink_node+0x5be>	5ba: R_X86_64_PLT32	__tsan_read1-0x4
05be      5be:	49 0f be 06          	movsbq (%r14),%rax
05c2      5c2:	bf 40 00 00 00       	mov    $0x40,%edi
05c7      5c7:	41 89 c6             	mov    %eax,%r14d
05ca      5ca:	4c 89 f6             	mov    %r14,%rsi
05cd      5cd:	e8 00 00 00 00       	call   5d2 <shrink_node+0x5d2>	5ce: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
05d2      5d2:	49 83 fe 3f          	cmp    $0x3f,%r14
05d6      5d6:	0f 87 6d 2c 00 00    	ja     3249 <shrink_node+0x3249>
05dc      5dc:	e8 00 00 00 00       	call   5e1 <shrink_node+0x5e1>	5dd: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
05e1      5e1:	44 89 f1             	mov    %r14d,%ecx
05e4      5e4:	31 ff                	xor    %edi,%edi
05e6      5e6:	48 d3 eb             	shr    %cl,%rbx
05e9      5e9:	48 89 de             	mov    %rbx,%rsi
05ec      5ec:	e8 00 00 00 00       	call   5f1 <shrink_node+0x5f1>	5ed: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
05f1      5f1:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
05f6      5f6:	44 0f b6 70 2a       	movzbl 0x2a(%rax),%r14d
05fb      5fb:	0f b7 40 28          	movzwl 0x28(%rax),%eax
05ff      5ff:	41 c1 e6 10          	shl    $0x10,%r14d
0603      603:	41 09 c6             	or     %eax,%r14d
0606      606:	48 85 db             	test   %rbx,%rbx
0609      609:	74 35                	je     640 <shrink_node+0x640>
060b      60b:	44 89 f0             	mov    %r14d,%eax
060e      60e:	25 82 00 00 00       	and    $0x82,%eax
0613      613:	75 2b                	jne    640 <shrink_node+0x640>
0615      615:	e8 00 00 00 00       	call   61a <shrink_node+0x61a>	616: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
061a      61a:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 621 <shrink_node+0x621>	61d: R_X86_64_PC32	_ftrace_branch+0x884c4
0621      621:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	624: R_X86_64_32S	_ftrace_branch+0x884c8
0628      628:	48 ff c3             	inc    %rbx
062b      62b:	e8 00 00 00 00       	call   630 <shrink_node+0x630>	62c: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
0630      630:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 637 <shrink_node+0x637>	633: R_X86_64_PC32	_ftrace_branch+0x884c4
0637      637:	41 81 ce 00 40 00 00 	or     $0x4000,%r14d
063e      63e:	eb 29                	jmp    669 <shrink_node+0x669>
0640      640:	e8 00 00 00 00       	call   645 <shrink_node+0x645>	641: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0645      645:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 64c <shrink_node+0x64c>	648: R_X86_64_PC32	_ftrace_branch+0x884bc
064c      64c:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	64f: R_X86_64_32S	_ftrace_branch+0x884c0
0653      653:	48 ff c3             	inc    %rbx
0656      656:	e8 00 00 00 00       	call   65b <shrink_node+0x65b>	657: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
065b      65b:	41 81 e6 ff bf ff 00 	and    $0xffbfff,%r14d
0662      662:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 669 <shrink_node+0x669>	665: R_X86_64_PC32	_ftrace_branch+0x884bc
0669      669:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
066e      66e:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	671: R_X86_64_32S	_ftrace_branch+0x884d0
0675      675:	66 44 89 70 28       	mov    %r14w,0x28(%rax)
067a      67a:	41 c1 ee 10          	shr    $0x10,%r14d
067e      67e:	44 88 70 2a          	mov    %r14b,0x2a(%rax)
0682      682:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 689 <shrink_node+0x689>	685: R_X86_64_PC32	_ftrace_branch+0x884cc
0689      689:	48 ff c3             	inc    %rbx
068c      68c:	e8 00 00 00 00       	call   691 <shrink_node+0x691>	68d: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
0691      691:	be 08 00 00 00       	mov    $0x8,%esi
0696      696:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	699: R_X86_64_32S	vm_zone_stat
069d      69d:	ba 04 00 00 00       	mov    $0x4,%edx
06a2      6a2:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 6a9 <shrink_node+0x6a9>	6a5: R_X86_64_PC32	_ftrace_branch+0x884cc
06a9      6a9:	e8 00 00 00 00       	call   6ae <shrink_node+0x6ae>	6aa: R_X86_64_PLT32	__kcsan_check_access-0x4
06ae      6ae:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	6b1: R_X86_64_32S	vm_zone_stat
06b5      6b5:	e8 00 00 00 00       	call   6ba <shrink_node+0x6ba>	6b6: R_X86_64_PLT32	__tsan_volatile_read8-0x4
06ba      6ba:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 6c1 <shrink_node+0x6c1>	6bd: R_X86_64_PC32	vm_zone_stat-0x4
06c1      6c1:	48 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%rdi
06c8      6c8:	48 89 de             	mov    %rbx,%rsi
06cb      6cb:	e8 00 00 00 00       	call   6d0 <shrink_node+0x6d0>	6cc: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
06d0      6d0:	48 85 db             	test   %rbx,%rbx
06d3      6d3:	78 13                	js     6e8 <shrink_node+0x6e8>
06d5      6d5:	48 89 5c 24 10       	mov    %rbx,0x10(%rsp)
06da      6da:	e8 00 00 00 00       	call   6df <shrink_node+0x6df>	6db: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
06df      6df:	48 c7 c3 00 00 00 00 	mov    $0x0,%rbx	6e2: R_X86_64_32S	_ftrace_branch+0x884f8
06e6      6e6:	eb 13                	jmp    6fb <shrink_node+0x6fb>
06e8      6e8:	e8 00 00 00 00       	call   6ed <shrink_node+0x6ed>	6e9: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
06ed      6ed:	48 c7 c3 00 00 00 00 	mov    $0x0,%rbx	6f0: R_X86_64_32S	_ftrace_branch+0x88500
06f4      6f4:	31 c0                	xor    %eax,%eax
06f6      6f6:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
06fb      6fb:	4c 8b 33             	mov    (%rbx),%r14
06fe      6fe:	48 89 df             	mov    %rbx,%rdi
0701      701:	49 ff c6             	inc    %r14
0704      704:	e8 00 00 00 00       	call   709 <shrink_node+0x709>	705: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
0709      709:	be 08 00 00 00       	mov    $0x8,%esi
070e      70e:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	711: R_X86_64_32S	vm_node_stat+0x18
0715      715:	ba 04 00 00 00       	mov    $0x4,%edx
071a      71a:	4c 89 33             	mov    %r14,(%rbx)
071d      71d:	e8 00 00 00 00       	call   722 <shrink_node+0x722>	71e: R_X86_64_PLT32	__kcsan_check_access-0x4
0722      722:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	725: R_X86_64_32S	vm_node_stat+0x18
0729      729:	e8 00 00 00 00       	call   72e <shrink_node+0x72e>	72a: R_X86_64_PLT32	__tsan_volatile_read8-0x4
072e      72e:	4c 8b 35 00 00 00 00 	mov    0x0(%rip),%r14        # 735 <shrink_node+0x735>	731: R_X86_64_PC32	vm_node_stat+0x14
0735      735:	48 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%rdi
073c      73c:	4c 89 f6             	mov    %r14,%rsi
073f      73f:	e8 00 00 00 00       	call   744 <shrink_node+0x744>	740: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0744      744:	4d 85 f6             	test   %r14,%r14
0747      747:	78 0e                	js     757 <shrink_node+0x757>
0749      749:	e8 00 00 00 00       	call   74e <shrink_node+0x74e>	74a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
074e      74e:	48 c7 c3 00 00 00 00 	mov    $0x0,%rbx	751: R_X86_64_32S	_ftrace_branch+0x877f8
0755      755:	eb 0f                	jmp    766 <shrink_node+0x766>
0757      757:	e8 00 00 00 00       	call   75c <shrink_node+0x75c>	758: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
075c      75c:	48 c7 c3 00 00 00 00 	mov    $0x0,%rbx	75f: R_X86_64_32S	_ftrace_branch+0x87800
0763      763:	45 31 f6             	xor    %r14d,%r14d
0766      766:	4c 8b 3b             	mov    (%rbx),%r15
0769      769:	48 89 df             	mov    %rbx,%rdi
076c      76c:	49 ff c7             	inc    %r15
076f      76f:	e8 00 00 00 00       	call   774 <shrink_node+0x774>	770: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
0774      774:	be 08 00 00 00       	mov    $0x8,%esi
0779      779:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	77c: R_X86_64_32S	vm_node_stat+0x10
0780      780:	ba 04 00 00 00       	mov    $0x4,%edx
0785      785:	4c 89 3b             	mov    %r15,(%rbx)
0788      788:	e8 00 00 00 00       	call   78d <shrink_node+0x78d>	789: R_X86_64_PLT32	__kcsan_check_access-0x4
078d      78d:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	790: R_X86_64_32S	vm_node_stat+0x10
0794      794:	e8 00 00 00 00       	call   799 <shrink_node+0x799>	795: R_X86_64_PLT32	__tsan_volatile_read8-0x4
0799      799:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 7a0 <shrink_node+0x7a0>	79c: R_X86_64_PC32	vm_node_stat+0xc
07a0      7a0:	48 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%rdi
07a7      7a7:	48 89 de             	mov    %rbx,%rsi
07aa      7aa:	e8 00 00 00 00       	call   7af <shrink_node+0x7af>	7ab: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
07af      7af:	48 85 db             	test   %rbx,%rbx
07b2      7b2:	78 12                	js     7c6 <shrink_node+0x7c6>
07b4      7b4:	48 89 1c 24          	mov    %rbx,(%rsp)
07b8      7b8:	e8 00 00 00 00       	call   7bd <shrink_node+0x7bd>	7b9: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
07bd      7bd:	48 c7 c3 00 00 00 00 	mov    $0x0,%rbx	7c0: R_X86_64_32S	_ftrace_branch+0x877f8
07c4      7c4:	eb 12                	jmp    7d8 <shrink_node+0x7d8>
07c6      7c6:	e8 00 00 00 00       	call   7cb <shrink_node+0x7cb>	7c7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
07cb      7cb:	48 c7 c3 00 00 00 00 	mov    $0x0,%rbx	7ce: R_X86_64_32S	_ftrace_branch+0x87800
07d2      7d2:	31 c0                	xor    %eax,%eax
07d4      7d4:	48 89 04 24          	mov    %rax,(%rsp)
07d8      7d8:	4c 8b 3b             	mov    (%rbx),%r15
07db      7db:	48 89 df             	mov    %rbx,%rdi
07de      7de:	49 ff c7             	inc    %r15
07e1      7e1:	e8 00 00 00 00       	call   7e6 <shrink_node+0x7e6>	7e2: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
07e6      7e6:	4c 89 3b             	mov    %r15,(%rbx)
07e9      7e9:	41 bf 03 00 00 00    	mov    $0x3,%r15d
07ef      7ef:	4c 8b ac 24 10 01 00 00 	mov    0x110(%rsp),%r13
07f7      7f7:	45 31 e4             	xor    %r12d,%r12d
07fa      7fa:	be 08 00 00 00       	mov    $0x8,%esi
07ff      7ff:	4c 89 ef             	mov    %r13,%rdi
0802      802:	ba 04 00 00 00       	mov    $0x4,%edx
0807      807:	e8 00 00 00 00       	call   80c <shrink_node+0x80c>	808: R_X86_64_PLT32	__kcsan_check_access-0x4
080c      80c:	4c 89 ef             	mov    %r13,%rdi
080f      80f:	e8 00 00 00 00       	call   814 <shrink_node+0x814>	810: R_X86_64_PLT32	__tsan_volatile_read8-0x4
0814      814:	49 8b 5d 00          	mov    0x0(%r13),%rbx
0818      818:	31 ff                	xor    %edi,%edi
081a      81a:	48 89 de             	mov    %rbx,%rsi
081d      81d:	e8 00 00 00 00       	call   822 <shrink_node+0x822>	81e: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0822      822:	48 85 db             	test   %rbx,%rbx
0825      825:	74 3e                	je     865 <shrink_node+0x865>
0827      827:	e8 00 00 00 00       	call   82c <shrink_node+0x82c>	828: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
082c      82c:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 833 <shrink_node+0x833>	82f: R_X86_64_PC32	_ftrace_branch+0x884d4
0833      833:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	836: R_X86_64_32S	_ftrace_branch+0x884d8
083a      83a:	48 ff c3             	inc    %rbx
083d      83d:	e8 00 00 00 00       	call   842 <shrink_node+0x842>	83e: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
0842      842:	49 8d 7d 90          	lea    -0x70(%r13),%rdi
0846      846:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 84d <shrink_node+0x84d>	849: R_X86_64_PC32	_ftrace_branch+0x884d4
084d      84d:	e8 00 00 00 00       	call   852 <shrink_node+0x852>	84e: R_X86_64_PLT32	__tsan_read8-0x4
0852      852:	49 8d 7d a0          	lea    -0x60(%r13),%rdi
0856      856:	4d 03 65 90          	add    -0x70(%r13),%r12
085a      85a:	e8 00 00 00 00       	call   85f <shrink_node+0x85f>	85b: R_X86_64_PLT32	__tsan_read8-0x4
085f      85f:	4d 03 65 a0          	add    -0x60(%r13),%r12
0863      863:	eb 22                	jmp    887 <shrink_node+0x887>
0865      865:	e8 00 00 00 00       	call   86a <shrink_node+0x86a>	866: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
086a      86a:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 871 <shrink_node+0x871>	86d: R_X86_64_PC32	_ftrace_branch+0x884dc
0871      871:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	874: R_X86_64_32S	_ftrace_branch+0x884e0
0878      878:	48 ff c3             	inc    %rbx
087b      87b:	e8 00 00 00 00       	call   880 <shrink_node+0x880>	87c: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
0880      880:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 887 <shrink_node+0x887>	883: R_X86_64_PC32	_ftrace_branch+0x884dc
0887      887:	49 83 ef 01          	sub    $0x1,%r15
088b      88b:	72 11                	jb     89e <shrink_node+0x89e>
088d      88d:	e8 00 00 00 00       	call   892 <shrink_node+0x892>	88e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0892      892:	49 81 c5 40 07 00 00 	add    $0x740,%r13
0899      899:	e9 5c ff ff ff       	jmp    7fa <shrink_node+0x7fa>
089e      89e:	be 08 00 00 00       	mov    $0x8,%esi
08a3      8a3:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	8a6: R_X86_64_32S	vm_node_stat
08aa      8aa:	ba 04 00 00 00       	mov    $0x4,%edx
08af      8af:	e8 00 00 00 00       	call   8b4 <shrink_node+0x8b4>	8b0: R_X86_64_PLT32	__kcsan_check_access-0x4
08b4      8b4:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	8b7: R_X86_64_32S	vm_node_stat
08bb      8bb:	e8 00 00 00 00       	call   8c0 <shrink_node+0x8c0>	8bc: R_X86_64_PLT32	__tsan_volatile_read8-0x4
08c0      8c0:	4c 8b 2d 00 00 00 00 	mov    0x0(%rip),%r13        # 8c7 <shrink_node+0x8c7>	8c3: R_X86_64_PC32	vm_node_stat-0x4
08c7      8c7:	48 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%rdi
08ce      8ce:	4c 89 ee             	mov    %r13,%rsi
08d1      8d1:	e8 00 00 00 00       	call   8d6 <shrink_node+0x8d6>	8d2: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
08d6      8d6:	4d 85 ed             	test   %r13,%r13
08d9      8d9:	78 0e                	js     8e9 <shrink_node+0x8e9>
08db      8db:	e8 00 00 00 00       	call   8e0 <shrink_node+0x8e0>	8dc: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
08e0      8e0:	48 c7 c3 00 00 00 00 	mov    $0x0,%rbx	8e3: R_X86_64_32S	_ftrace_branch+0x877f8
08e7      8e7:	eb 0f                	jmp    8f8 <shrink_node+0x8f8>
08e9      8e9:	e8 00 00 00 00       	call   8ee <shrink_node+0x8ee>	8ea: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
08ee      8ee:	48 c7 c3 00 00 00 00 	mov    $0x0,%rbx	8f1: R_X86_64_32S	_ftrace_branch+0x87800
08f5      8f5:	45 31 ed             	xor    %r13d,%r13d
08f8      8f8:	4c 8b 3b             	mov    (%rbx),%r15
08fb      8fb:	48 89 df             	mov    %rbx,%rdi
08fe      8fe:	49 ff c7             	inc    %r15
0901      901:	e8 00 00 00 00       	call   906 <shrink_node+0x906>	902: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
0906      906:	4c 03 74 24 10       	add    0x10(%rsp),%r14
090b      90b:	4c 89 e6             	mov    %r12,%rsi
090e      90e:	4c 89 3b             	mov    %r15,(%rbx)
0911      911:	4c 03 34 24          	add    (%rsp),%r14
0915      915:	4c 89 f7             	mov    %r14,%rdi
0918      918:	e8 00 00 00 00       	call   91d <shrink_node+0x91d>	919: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
091d      91d:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
0922      922:	44 0f b6 78 2a       	movzbl 0x2a(%rax),%r15d
0927      927:	0f b7 40 28          	movzwl 0x28(%rax),%eax
092b      92b:	41 c1 e7 10          	shl    $0x10,%r15d
092f      92f:	41 09 c7             	or     %eax,%r15d
0932      932:	4d 39 e6             	cmp    %r12,%r14
0935      935:	77 53                	ja     98a <shrink_node+0x98a>
0937      937:	44 89 f8             	mov    %r15d,%eax
093a      93a:	83 e0 01             	and    $0x1,%eax
093d      93d:	75 4b                	jne    98a <shrink_node+0x98a>
093f      93f:	48 8b 5c 24 28       	mov    0x28(%rsp),%rbx
0944      944:	48 89 df             	mov    %rbx,%rdi
0947      947:	e8 00 00 00 00       	call   94c <shrink_node+0x94c>	948: R_X86_64_PLT32	__tsan_read1-0x4
094c      94c:	48 0f be 03          	movsbq (%rbx),%rax
0950      950:	bf 40 00 00 00       	mov    $0x40,%edi
0955      955:	89 c3                	mov    %eax,%ebx
0957      957:	48 89 de             	mov    %rbx,%rsi
095a      95a:	e8 00 00 00 00       	call   95f <shrink_node+0x95f>	95b: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
095f      95f:	48 83 fb 3f          	cmp    $0x3f,%rbx
0963      963:	0f 87 1a 29 00 00    	ja     3283 <shrink_node+0x3283>
0969      969:	e8 00 00 00 00       	call   96e <shrink_node+0x96e>	96a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
096e      96e:	89 d9                	mov    %ebx,%ecx
0970      970:	31 db                	xor    %ebx,%ebx
0972      972:	49 d3 ed             	shr    %cl,%r13
0975      975:	4d 85 ed             	test   %r13,%r13
0978      978:	4c 89 ee             	mov    %r13,%rsi
097b      97b:	0f 95 c3             	setne  %bl
097e      97e:	31 ff                	xor    %edi,%edi
0980      980:	e8 00 00 00 00       	call   985 <shrink_node+0x985>	981: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0985      985:	c1 e3 0f             	shl    $0xf,%ebx
0988      988:	eb 07                	jmp    991 <shrink_node+0x991>
098a      98a:	e8 00 00 00 00       	call   98f <shrink_node+0x98f>	98b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
098f      98f:	31 db                	xor    %ebx,%ebx
0991      991:	44 89 f8             	mov    %r15d,%eax
0994      994:	41 c1 ef 10          	shr    $0x10,%r15d
0998      998:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
099d      99d:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	9a0: R_X86_64_32S	.rodata.str1.1+0x19bacf
09a4      9a4:	be d6 16 00 00       	mov    $0x16d6,%esi
09a9      9a9:	31 d2                	xor    %edx,%edx
09ab      9ab:	25 ff 7f ff 00       	and    $0xff7fff,%eax
09b0      9b0:	45 88 7c 24 2a       	mov    %r15b,0x2a(%r12)
09b5      9b5:	09 d8                	or     %ebx,%eax
09b7      9b7:	66 41 89 44 24 28    	mov    %ax,0x28(%r12)
09bd      9bd:	e8 00 00 00 00       	call   9c2 <shrink_node+0x9c2>	9be: R_X86_64_PLT32	__might_resched-0x4
09c2      9c2:	e8 00 00 00 00       	call   9c7 <shrink_node+0x9c7>	9c3: R_X86_64_PLT32	__SCT__cond_resched-0x4
09c7      9c7:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 9ce <shrink_node+0x9ce>	9ca: R_X86_64_PC32	_ftrace_branch+0x88504
09ce      9ce:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	9d1: R_X86_64_32S	_ftrace_branch+0x88508
09d5      9d5:	48 ff c3             	inc    %rbx
09d8      9d8:	e8 00 00 00 00       	call   9dd <shrink_node+0x9dd>	9d9: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
09dd      9dd:	4c 8b 35 00 00 00 00 	mov    0x0(%rip),%r14        # 9e4 <shrink_node+0x9e4>	9e0: R_X86_64_PC32	_ftrace_branch+0x8850c
09e4      9e4:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	9e7: R_X86_64_32S	_ftrace_branch+0x88510
09eb      9eb:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 9f2 <shrink_node+0x9f2>	9ee: R_X86_64_PC32	_ftrace_branch+0x88504
09f2      9f2:	49 ff c6             	inc    %r14
09f5      9f5:	e8 00 00 00 00       	call   9fa <shrink_node+0x9fa>	9f6: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
09fa      9fa:	4c 89 e7             	mov    %r12,%rdi
09fd      9fd:	4c 89 35 00 00 00 00 	mov    %r14,0x0(%rip)        # a04 <shrink_node+0xa04>	a00: R_X86_64_PC32	_ftrace_branch+0x8850c
0a04      a04:	e8 00 00 00 00       	call   a09 <shrink_node+0xa09>	a05: R_X86_64_PLT32	__tsan_read8-0x4
0a09      a09:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # a10 <shrink_node+0xa10>	a0c: R_X86_64_PC32	_ftrace_branch+0x88524
0a10      a10:	49 8b 04 24          	mov    (%r12),%rax
0a14      a14:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	a17: R_X86_64_32S	_ftrace_branch+0x88528
0a1b      a1b:	48 89 84 24 88 01 00 00 	mov    %rax,0x188(%rsp)
0a23      a23:	48 ff c3             	inc    %rbx
0a26      a26:	e8 00 00 00 00       	call   a2b <shrink_node+0xa2b>	a27: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
0a2b      a2b:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	a2e: R_X86_64_32S	vm_swappiness
0a32      a32:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # a39 <shrink_node+0xa39>	a35: R_X86_64_PC32	_ftrace_branch+0x88524
0a39      a39:	e8 00 00 00 00       	call   a3e <shrink_node+0xa3e>	a3a: R_X86_64_PLT32	__tsan_volatile_read4-0x4
0a3e      a3e:	48 63 1d 00 00 00 00 	movslq 0x0(%rip),%rbx        # a45 <shrink_node+0xa45>	a41: R_X86_64_PC32	vm_swappiness-0x4
0a45      a45:	41 0f b7 44 24 28    	movzwl 0x28(%r12),%eax
0a4b      a4b:	a8 40                	test   $0x40,%al
0a4d      a4d:	75 0a                	jne    a59 <shrink_node+0xa59>
0a4f      a4f:	e8 00 00 00 00       	call   a54 <shrink_node+0xa54>	a50: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0a54      a54:	e9 1e 01 00 00       	jmp    b77 <shrink_node+0xb77>
0a59      a59:	be 08 00 00 00       	mov    $0x8,%esi
0a5e      a5e:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	a61: R_X86_64_32S	nr_swap_pages
0a65      a65:	ba 04 00 00 00       	mov    $0x4,%edx
0a6a      a6a:	e8 00 00 00 00       	call   a6f <shrink_node+0xa6f>	a6b: R_X86_64_PLT32	__kcsan_check_access-0x4
0a6f      a6f:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	a72: R_X86_64_32S	nr_swap_pages
0a76      a76:	e8 00 00 00 00       	call   a7b <shrink_node+0xa7b>	a77: R_X86_64_PLT32	__tsan_volatile_read8-0x4
0a7b      a7b:	4c 8b 35 00 00 00 00 	mov    0x0(%rip),%r14        # a82 <shrink_node+0xa82>	a7e: R_X86_64_PC32	nr_swap_pages-0x4
0a82      a82:	31 ff                	xor    %edi,%edi
0a84      a84:	4c 89 f6             	mov    %r14,%rsi
0a87      a87:	e8 00 00 00 00       	call   a8c <shrink_node+0xa8c>	a88: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0a8c      a8c:	4d 85 f6             	test   %r14,%r14
0a8f      a8f:	49 c7 c7 00 00 00 00 	mov    $0x0,%r15	a92: R_X86_64_32S	_ftrace_branch+0x877e8
0a96      a96:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	a99: R_X86_64_32S	_ftrace_branch+0x877f0
0a9d      a9d:	4c 0f 4f f8          	cmovg  %rax,%r15
0aa1      aa1:	4d 8b 27             	mov    (%r15),%r12
0aa4      aa4:	4c 89 ff             	mov    %r15,%rdi
0aa7      aa7:	49 ff c4             	inc    %r12
0aaa      aaa:	e8 00 00 00 00       	call   aaf <shrink_node+0xaaf>	aab: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
0aaf      aaf:	4d 85 f6             	test   %r14,%r14
0ab2      ab2:	4d 89 27             	mov    %r12,(%r15)
0ab5      ab5:	0f 8e b7 00 00 00    	jle    b72 <shrink_node+0xb72>
0abb      abb:	4c 8b 35 00 00 00 00 	mov    0x0(%rip),%r14        # ac2 <shrink_node+0xac2>	abe: R_X86_64_PC32	_ftrace_branch+0x8857c
0ac2      ac2:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	ac5: R_X86_64_32S	_ftrace_branch+0x88580
0ac9      ac9:	49 ff c6             	inc    %r14
0acc      acc:	e8 00 00 00 00       	call   ad1 <shrink_node+0xad1>	acd: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
0ad1      ad1:	4c 8b 3d 00 00 00 00 	mov    0x0(%rip),%r15        # ad8 <shrink_node+0xad8>	ad4: R_X86_64_PC32	_ftrace_branch+0x8858c
0ad8      ad8:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	adb: R_X86_64_32S	_ftrace_branch+0x88590
0adf      adf:	4c 89 35 00 00 00 00 	mov    %r14,0x0(%rip)        # ae6 <shrink_node+0xae6>	ae2: R_X86_64_PC32	_ftrace_branch+0x8857c
0ae6      ae6:	49 ff c7             	inc    %r15
0ae9      ae9:	e8 00 00 00 00       	call   aee <shrink_node+0xaee>	aea: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
0aee      aee:	4c 8b 74 24 28       	mov    0x28(%rsp),%r14
0af3      af3:	4c 89 3d 00 00 00 00 	mov    %r15,0x0(%rip)        # afa <shrink_node+0xafa>	af6: R_X86_64_PC32	_ftrace_branch+0x8858c
0afa      afa:	4c 89 f7             	mov    %r14,%rdi
0afd      afd:	e8 00 00 00 00       	call   b02 <shrink_node+0xb02>	afe: R_X86_64_PLT32	__tsan_read1-0x4
0b02      b02:	45 0f b6 36          	movzbl (%r14),%r14d
0b06      b06:	31 ff                	xor    %edi,%edi
0b08      b08:	44 89 f6             	mov    %r14d,%esi
0b0b      b0b:	e8 00 00 00 00       	call   b10 <shrink_node+0xb10>	b0c: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
0b10      b10:	31 ff                	xor    %edi,%edi
0b12      b12:	89 de                	mov    %ebx,%esi
0b14      b14:	e8 00 00 00 00       	call   b19 <shrink_node+0xb19>	b15: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0b19      b19:	31 ff                	xor    %edi,%edi
0b1b      b1b:	44 89 f6             	mov    %r14d,%esi
0b1e      b1e:	e8 00 00 00 00       	call   b23 <shrink_node+0xb23>	b1f: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
0b23      b23:	31 ff                	xor    %edi,%edi
0b25      b25:	89 de                	mov    %ebx,%esi
0b27      b27:	e8 00 00 00 00       	call   b2c <shrink_node+0xb2c>	b28: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0b2c      b2c:	45 85 f6             	test   %r14d,%r14d
0b2f      b2f:	4c 8b a4 24 00 01 00 00 	mov    0x100(%rsp),%r12
0b37      b37:	0f 85 06 1d 00 00    	jne    2843 <shrink_node+0x2843>
0b3d      b3d:	85 db                	test   %ebx,%ebx
0b3f      b3f:	0f 84 fe 1c 00 00    	je     2843 <shrink_node+0x2843>
0b45      b45:	e8 00 00 00 00       	call   b4a <shrink_node+0xb4a>	b46: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0b4a      b4a:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # b51 <shrink_node+0xb51>	b4d: R_X86_64_PC32	_ftrace_branch+0x8859c
0b51      b51:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	b54: R_X86_64_32S	_ftrace_branch+0x885a0
0b58      b58:	48 ff c3             	inc    %rbx
0b5b      b5b:	e8 00 00 00 00       	call   b60 <shrink_node+0xb60>	b5c: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
0b60      b60:	31 c0                	xor    %eax,%eax
0b62      b62:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # b69 <shrink_node+0xb69>	b65: R_X86_64_PC32	_ftrace_branch+0x8859c
0b69      b69:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
0b6e      b6e:	31 c0                	xor    %eax,%eax
0b70      b70:	eb 31                	jmp    ba3 <shrink_node+0xba3>
0b72      b72:	e8 00 00 00 00       	call   b77 <shrink_node+0xb77>	b73: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0b77      b77:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # b7e <shrink_node+0xb7e>	b7a: R_X86_64_PC32	_ftrace_branch+0x88584
0b7e      b7e:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	b81: R_X86_64_32S	_ftrace_branch+0x88588
0b85      b85:	48 ff c3             	inc    %rbx
0b88      b88:	e8 00 00 00 00       	call   b8d <shrink_node+0xb8d>	b89: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
0b8d      b8d:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # b94 <shrink_node+0xb94>	b90: R_X86_64_PC32	_ftrace_branch+0x88584
0b94      b94:	b8 03 00 00 00       	mov    $0x3,%eax
0b99      b99:	b9 01 00 00 00       	mov    $0x1,%ecx
0b9e      b9e:	48 89 4c 24 30       	mov    %rcx,0x30(%rsp)
0ba3      ba3:	31 c9                	xor    %ecx,%ecx
0ba5      ba5:	48 89 4c 24 50       	mov    %rcx,0x50(%rsp)
0baa      baa:	67 8d 00             	lea    (%eax),%eax
0bad      bad:	48 8b 8c 24 70 01 00 00 	mov    0x170(%rsp),%rcx
0bb5      bb5:	45 31 f6             	xor    %r14d,%r14d
0bb8      bb8:	48 8b 5c 24 38       	mov    0x38(%rsp),%rbx
0bbd      bbd:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
0bc2      bc2:	48 8b 04 c5 00 00 00 00 	mov    0x0(,%rax,8),%rax	bc6: R_X86_64_32S	.rodata.shrink_node
0bca      bca:	48 89 4c 24 78       	mov    %rcx,0x78(%rsp)
0bcf      bcf:	48 89 84 24 a0 00 00 00 	mov    %rax,0xa0(%rsp)
0bd7      bd7:	bf 01 00 00 00       	mov    $0x1,%edi
0bdc      bdc:	4c 89 f6             	mov    %r14,%rsi
0bdf      bdf:	4c 89 74 24 18       	mov    %r14,0x18(%rsp)
0be4      be4:	e8 00 00 00 00       	call   be9 <shrink_node+0xbe9>	be5: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0be9      be9:	48 89 df             	mov    %rbx,%rdi
0bec      bec:	e8 00 00 00 00       	call   bf1 <shrink_node+0xbf1>	bed: R_X86_64_PLT32	__tsan_read1-0x4
0bf1      bf1:	44 0f b6 33          	movzbl (%rbx),%r14d
0bf5      bf5:	31 ff                	xor    %edi,%edi
0bf7      bf7:	44 89 f6             	mov    %r14d,%esi
0bfa      bfa:	e8 00 00 00 00       	call   bff <shrink_node+0xbff>	bfb: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
0bff      bff:	45 84 f6             	test   %r14b,%r14b
0c02      c02:	0f 88 2e 01 00 00    	js     d36 <shrink_node+0xd36>
0c08      c08:	31 c0                	xor    %eax,%eax
0c0a      c0a:	48 8b 9c 24 10 01 00 00 	mov    0x110(%rsp),%rbx
0c12      c12:	4c 8b 7c 24 78       	mov    0x78(%rsp),%r15
0c17      c17:	48 89 04 24          	mov    %rax,(%rsp)
0c1b      c1b:	be 08 00 00 00       	mov    $0x8,%esi
0c20      c20:	48 89 df             	mov    %rbx,%rdi
0c23      c23:	ba 04 00 00 00       	mov    $0x4,%edx
0c28      c28:	e8 00 00 00 00       	call   c2d <shrink_node+0xc2d>	c29: R_X86_64_PLT32	__kcsan_check_access-0x4
0c2d      c2d:	48 89 df             	mov    %rbx,%rdi
0c30      c30:	e8 00 00 00 00       	call   c35 <shrink_node+0xc35>	c31: R_X86_64_PLT32	__tsan_volatile_read8-0x4
0c35      c35:	4c 8b 23             	mov    (%rbx),%r12
0c38      c38:	31 ff                	xor    %edi,%edi
0c3a      c3a:	4c 89 e6             	mov    %r12,%rsi
0c3d      c3d:	e8 00 00 00 00       	call   c42 <shrink_node+0xc42>	c3e: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0c42      c42:	4d 85 e4             	test   %r12,%r12
0c45      c45:	74 7e                	je     cc5 <shrink_node+0xcc5>
0c47      c47:	4c 8b 25 00 00 00 00 	mov    0x0(%rip),%r12        # c4e <shrink_node+0xc4e>	c4a: R_X86_64_PC32	_ftrace_branch+0x885dc
0c4e      c4e:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	c51: R_X86_64_32S	_ftrace_branch+0x885e0
0c55      c55:	49 ff c4             	inc    %r12
0c58      c58:	e8 00 00 00 00       	call   c5d <shrink_node+0xc5d>	c59: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
0c5d      c5d:	4c 8b 2d 00 00 00 00 	mov    0x0(%rip),%r13        # c64 <shrink_node+0xc64>	c60: R_X86_64_PC32	_ftrace_branch+0x885ec
0c64      c64:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	c67: R_X86_64_32S	_ftrace_branch+0x885f0
0c6b      c6b:	4c 89 25 00 00 00 00 	mov    %r12,0x0(%rip)        # c72 <shrink_node+0xc72>	c6e: R_X86_64_PC32	_ftrace_branch+0x885dc
0c72      c72:	49 ff c5             	inc    %r13
0c75      c75:	e8 00 00 00 00       	call   c7a <shrink_node+0xc7a>	c76: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
0c7a      c7a:	be 08 00 00 00       	mov    $0x8,%esi
0c7f      c7f:	4c 89 ff             	mov    %r15,%rdi
0c82      c82:	ba 04 00 00 00       	mov    $0x4,%edx
0c87      c87:	4c 89 2d 00 00 00 00 	mov    %r13,0x0(%rip)        # c8e <shrink_node+0xc8e>	c8a: R_X86_64_PC32	_ftrace_branch+0x885ec
0c8e      c8e:	e8 00 00 00 00       	call   c93 <shrink_node+0xc93>	c8f: R_X86_64_PLT32	__kcsan_check_access-0x4
0c93      c93:	4c 89 ff             	mov    %r15,%rdi
0c96      c96:	e8 00 00 00 00       	call   c9b <shrink_node+0xc9b>	c97: R_X86_64_PLT32	__tsan_volatile_read8-0x4
0c9b      c9b:	4c 89 7c 24 10       	mov    %r15,0x10(%rsp)
0ca0      ca0:	48 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%rdi
0ca7      ca7:	4d 8b 27             	mov    (%r15),%r12
0caa      caa:	4c 89 e6             	mov    %r12,%rsi
0cad      cad:	e8 00 00 00 00       	call   cb2 <shrink_node+0xcb2>	cae: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0cb2      cb2:	4d 85 e4             	test   %r12,%r12
0cb5      cb5:	78 32                	js     ce9 <shrink_node+0xce9>
0cb7      cb7:	e8 00 00 00 00       	call   cbc <shrink_node+0xcbc>	cb8: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0cbc      cbc:	49 c7 c5 00 00 00 00 	mov    $0x0,%r13	cbf: R_X86_64_32S	_ftrace_branch+0x885f8
0cc3      cc3:	eb 33                	jmp    cf8 <shrink_node+0xcf8>
0cc5      cc5:	e8 00 00 00 00       	call   cca <shrink_node+0xcca>	cc6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0cca      cca:	4c 8b 25 00 00 00 00 	mov    0x0(%rip),%r12        # cd1 <shrink_node+0xcd1>	ccd: R_X86_64_PC32	_ftrace_branch+0x885e4
0cd1      cd1:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	cd4: R_X86_64_32S	_ftrace_branch+0x885e8
0cd8      cd8:	49 ff c4             	inc    %r12
0cdb      cdb:	e8 00 00 00 00       	call   ce0 <shrink_node+0xce0>	cdc: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
0ce0      ce0:	4c 89 25 00 00 00 00 	mov    %r12,0x0(%rip)        # ce7 <shrink_node+0xce7>	ce3: R_X86_64_PC32	_ftrace_branch+0x885e4
0ce7      ce7:	eb 2b                	jmp    d14 <shrink_node+0xd14>
0ce9      ce9:	e8 00 00 00 00       	call   cee <shrink_node+0xcee>	cea: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0cee      cee:	49 c7 c5 00 00 00 00 	mov    $0x0,%r13	cf1: R_X86_64_32S	_ftrace_branch+0x88600
0cf5      cf5:	45 31 e4             	xor    %r12d,%r12d
0cf8      cf8:	4d 8b 7d 00          	mov    0x0(%r13),%r15
0cfc      cfc:	4c 89 ef             	mov    %r13,%rdi
0cff      cff:	49 ff c7             	inc    %r15
0d02      d02:	e8 00 00 00 00       	call   d07 <shrink_node+0xd07>	d03: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
0d07      d07:	4d 89 7d 00          	mov    %r15,0x0(%r13)
0d0b      d0b:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
0d10      d10:	4c 01 24 24          	add    %r12,(%rsp)
0d14      d14:	49 83 ee 01          	sub    $0x1,%r14
0d18      d18:	72 15                	jb     d2f <shrink_node+0xd2f>
0d1a      d1a:	e8 00 00 00 00       	call   d1f <shrink_node+0xd1f>	d1b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0d1f      d1f:	b8 40 07 00 00       	mov    $0x740,%eax
0d24      d24:	49 01 c7             	add    %rax,%r15
0d27      d27:	48 01 c3             	add    %rax,%rbx
0d2a      d2a:	e9 ec fe ff ff       	jmp    c1b <shrink_node+0xc1b>
0d2f      d2f:	e8 00 00 00 00       	call   d34 <shrink_node+0xd34>	d30: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0d34      d34:	eb 0b                	jmp    d41 <shrink_node+0xd41>
0d36      d36:	e8 00 00 00 00       	call   d3b <shrink_node+0xd3b>	d37: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0d3b      d3b:	31 c0                	xor    %eax,%eax
0d3d      d3d:	48 89 04 24          	mov    %rax,(%rsp)
0d41      d41:	48 8b 5c 24 28       	mov    0x28(%rsp),%rbx
0d46      d46:	48 89 df             	mov    %rbx,%rdi
0d49      d49:	e8 00 00 00 00       	call   d4e <shrink_node+0xd4e>	d4a: R_X86_64_PLT32	__tsan_read1-0x4
0d4e      d4e:	48 0f be 03          	movsbq (%rbx),%rax
0d52      d52:	bf 40 00 00 00       	mov    $0x40,%edi
0d57      d57:	89 c3                	mov    %eax,%ebx
0d59      d59:	48 89 de             	mov    %rbx,%rsi
0d5c      d5c:	e8 00 00 00 00       	call   d61 <shrink_node+0xd61>	d5d: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0d61      d61:	48 83 fb 3f          	cmp    $0x3f,%rbx
0d65      d65:	0f 87 22 01 00 00    	ja     e8d <shrink_node+0xe8d>
0d6b      d6b:	e8 00 00 00 00       	call   d70 <shrink_node+0xd70>	d6c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0d70      d70:	4c 8b 35 00 00 00 00 	mov    0x0(%rip),%r14        # d77 <shrink_node+0xd77>	d73: R_X86_64_PC32	_ftrace_branch+0x885c4
0d77      d77:	89 d9                	mov    %ebx,%ecx
0d79      d79:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	d7c: R_X86_64_32S	_ftrace_branch+0x885c8
0d80      d80:	48 d3 2c 24          	shrq   %cl,(%rsp)
0d84      d84:	49 ff c6             	inc    %r14
0d87      d87:	e8 00 00 00 00       	call   d8c <shrink_node+0xd8c>	d88: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
0d8c      d8c:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
0d91      d91:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	d94: R_X86_64_32S	.data.__sancov_gen_cov_switch_values.1209
0d98      d98:	4c 89 35 00 00 00 00 	mov    %r14,0x0(%rip)        # d9f <shrink_node+0xd9f>	d9b: R_X86_64_PC32	_ftrace_branch+0x885c4
0d9f      d9f:	e8 00 00 00 00       	call   da4 <shrink_node+0xda4>	da0: R_X86_64_PLT32	__sanitizer_cov_trace_switch-0x4
0da4      da4:	ff a4 24 a0 00 00 00 	jmp    *0xa0(%rsp)
0dab      dab:	e8 00 00 00 00       	call   db0 <shrink_node+0xdb0>	dac: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0db0      db0:	eb 7a                	jmp    e2c <shrink_node+0xe2c>
0db2      db2:	e8 00 00 00 00       	call   db7 <shrink_node+0xdb7>	db3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0db7      db7:	eb 05                	jmp    dbe <shrink_node+0xdbe>
0db9      db9:	e8 00 00 00 00       	call   dbe <shrink_node+0xdbe>	dba: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0dbe      dbe:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
0dc3      dc3:	31 db                	xor    %ebx,%ebx
0dc5      dc5:	4c 8b 74 24 30       	mov    0x30(%rsp),%r14
0dca      dca:	48 83 f8 02          	cmp    $0x2,%rax
0dce      dce:	44 89 f7             	mov    %r14d,%edi
0dd1      dd1:	0f 93 c3             	setae  %bl
0dd4      dd4:	89 de                	mov    %ebx,%esi
0dd6      dd6:	e8 00 00 00 00       	call   ddb <shrink_node+0xddb>	dd7: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
0ddb      ddb:	41 39 de             	cmp    %ebx,%r14d
0dde      dde:	75 24                	jne    e04 <shrink_node+0xe04>
0de0      de0:	e8 00 00 00 00       	call   de5 <shrink_node+0xde5>	de1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0de5      de5:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # dec <shrink_node+0xdec>	de8: R_X86_64_PC32	_ftrace_branch+0x885cc
0dec      dec:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	def: R_X86_64_32S	_ftrace_branch+0x885d0
0df3      df3:	48 ff c3             	inc    %rbx
0df6      df6:	e8 00 00 00 00       	call   dfb <shrink_node+0xdfb>	df7: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
0dfb      dfb:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # e02 <shrink_node+0xe02>	dfe: R_X86_64_PC32	_ftrace_branch+0x885cc
0e02      e02:	eb 28                	jmp    e2c <shrink_node+0xe2c>
0e04      e04:	e8 00 00 00 00       	call   e09 <shrink_node+0xe09>	e05: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0e09      e09:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # e10 <shrink_node+0xe10>	e0c: R_X86_64_PC32	_ftrace_branch+0x885d4
0e10      e10:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	e13: R_X86_64_32S	_ftrace_branch+0x885d8
0e17      e17:	48 ff c3             	inc    %rbx
0e1a      e1a:	e8 00 00 00 00       	call   e1f <shrink_node+0xe1f>	e1b: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
0e1f      e1f:	31 c0                	xor    %eax,%eax
0e21      e21:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # e28 <shrink_node+0xe28>	e24: R_X86_64_PC32	_ftrace_branch+0x885d4
0e28      e28:	48 89 04 24          	mov    %rax,(%rsp)
0e2c      e2c:	48 8b 5c 24 38       	mov    0x38(%rsp),%rbx
0e31      e31:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
0e36      e36:	eb 30                	jmp    e68 <shrink_node+0xe68>
0e38      e38:	31 db                	xor    %ebx,%ebx
0e3a      e3a:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
0e3f      e3f:	49 83 fe 02          	cmp    $0x2,%r14
0e43      e43:	0f 93 c3             	setae  %bl
0e46      e46:	e8 00 00 00 00       	call   e4b <shrink_node+0xe4b>	e47: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0e4b      e4b:	48 8b 04 24          	mov    (%rsp),%rax
0e4f      e4f:	31 d2                	xor    %edx,%edx
0e51      e51:	48 0f af 84 dc 00 02 00 00 	imul   0x200(%rsp,%rbx,8),%rax
0e5a      e5a:	48 f7 74 24 50       	divq   0x50(%rsp)
0e5f      e5f:	48 8b 5c 24 38       	mov    0x38(%rsp),%rbx
0e64      e64:	48 89 04 24          	mov    %rax,(%rsp)
0e68      e68:	48 8b 04 24          	mov    (%rsp),%rax
0e6c      e6c:	4a 89 84 f4 b0 00 00 00 	mov    %rax,0xb0(%rsp,%r14,8)
0e74      e74:	49 ff c6             	inc    %r14
0e77      e77:	49 83 fe 04          	cmp    $0x4,%r14
0e7b      e7b:	74 2d                	je     eaa <shrink_node+0xeaa>
0e7d      e7d:	e8 00 00 00 00       	call   e82 <shrink_node+0xe82>	e7e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0e82      e82:	48 83 44 24 78 08    	addq   $0x8,0x78(%rsp)
0e88      e88:	e9 4a fd ff ff       	jmp    bd7 <shrink_node+0xbd7>
0e8d      e8d:	e8 00 00 00 00       	call   e92 <shrink_node+0xe92>	e8e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0e92      e92:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	e95: R_X86_64_32S	.data..Lanon.bd2167bd7cc052698832bf453910f546.11
0e99      e99:	48 8b 34 24          	mov    (%rsp),%rsi
0e9d      e9d:	48 89 da             	mov    %rbx,%rdx
0ea0      ea0:	e8 00 00 00 00       	call   ea5 <shrink_node+0xea5>	ea1: R_X86_64_PLT32	__ubsan_handle_shift_out_of_bounds-0x4
0ea5      ea5:	e9 c6 fe ff ff       	jmp    d70 <shrink_node+0xd70>
0eaa      eaa:	ba 28 00 00 00       	mov    $0x28,%edx
0eaf      eaf:	48 8d bc 24 d0 01 00 00 	lea    0x1d0(%rsp),%rdi
0eb7      eb7:	48 8d b4 24 b0 00 00 00 	lea    0xb0(%rsp),%rsi
0ebf      ebf:	e8 00 00 00 00       	call   ec4 <shrink_node+0xec4>	ec0: R_X86_64_PLT32	__tsan_memcpy-0x4
0ec4      ec4:	65 4c 8b 34 25 00 00 00 00 	mov    %gs:0x0,%r14	ec9: R_X86_64_32S	pcpu_hot
0ecd      ecd:	49 8d 7e 2c          	lea    0x2c(%r14),%rdi
0ed1      ed1:	48 89 7c 24 18       	mov    %rdi,0x18(%rsp)
0ed6      ed6:	e8 00 00 00 00       	call   edb <shrink_node+0xedb>	ed7: R_X86_64_PLT32	__tsan_read4-0x4
0edb      edb:	41 8b 5e 2c          	mov    0x2c(%r14),%ebx
0edf      edf:	be 00 00 02 00       	mov    $0x20000,%esi
0ee4      ee4:	31 ff                	xor    %edi,%edi
0ee6      ee6:	21 de                	and    %ebx,%esi
0ee8      ee8:	e8 00 00 00 00       	call   eed <shrink_node+0xeed>	ee9: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0eed      eed:	b8 00 00 02 00       	mov    $0x20000,%eax
0ef2      ef2:	21 c3                	and    %eax,%ebx
0ef4      ef4:	75 2e                	jne    f24 <shrink_node+0xf24>
0ef6      ef6:	e8 00 00 00 00       	call   efb <shrink_node+0xefb>	ef7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0efb      efb:	48 8b 5c 24 28       	mov    0x28(%rsp),%rbx
0f00      f00:	48 89 df             	mov    %rbx,%rdi
0f03      f03:	e8 00 00 00 00       	call   f08 <shrink_node+0xf08>	f04: R_X86_64_PLT32	__tsan_read1-0x4
0f08      f08:	0f b6 33             	movzbl (%rbx),%esi
0f0b      f0b:	bf 0c 00 00 00       	mov    $0xc,%edi
0f10      f10:	83 fe 0c             	cmp    $0xc,%esi
0f13      f13:	0f 94 c0             	sete   %al
0f16      f16:	89 84 24 84 00 00 00 	mov    %eax,0x84(%rsp)
0f1d      f1d:	e8 00 00 00 00       	call   f22 <shrink_node+0xf22>	f1e: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
0f22      f22:	eb 10                	jmp    f34 <shrink_node+0xf34>
0f24      f24:	e8 00 00 00 00       	call   f29 <shrink_node+0xf29>	f25: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0f29      f29:	c7 84 24 84 00 00 00 00 00 00 00 	movl   $0x0,0x84(%rsp)
0f34      f34:	48 8d bc 24 00 02 00 00 	lea    0x200(%rsp),%rdi
0f3c      f3c:	4c 89 f3             	mov    %r14,%rbx
0f3f      f3f:	e8 00 00 00 00       	call   f44 <shrink_node+0xf44>	f40: R_X86_64_PLT32	blk_start_plug-0x4
0f44      f44:	31 ff                	xor    %edi,%edi
0f46      f46:	4c 89 f6             	mov    %r14,%rsi
0f49      f49:	4c 89 74 24 78       	mov    %r14,0x78(%rsp)
0f4e      f4e:	e8 00 00 00 00       	call   f53 <shrink_node+0xf53>	f4f: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0f53      f53:	49 8d 86 48 0d 00 00 	lea    0xd48(%r14),%rax
0f5a      f5a:	4c 89 b4 24 78 01 00 00 	mov    %r14,0x178(%rsp)
0f62      f62:	48 89 84 24 a0 00 00 00 	mov    %rax,0xa0(%rsp)
0f6a      f6a:	31 c0                	xor    %eax,%eax
0f6c      f6c:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
0f71      f71:	48 8b 9c 24 b0 00 00 00 	mov    0xb0(%rsp),%rbx
0f79      f79:	31 ff                	xor    %edi,%edi
0f7b      f7b:	48 89 de             	mov    %rbx,%rsi
0f7e      f7e:	e8 00 00 00 00       	call   f83 <shrink_node+0xf83>	f7f: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0f83      f83:	48 85 db             	test   %rbx,%rbx
0f86      f86:	74 07                	je     f8f <shrink_node+0xf8f>
0f88      f88:	e8 00 00 00 00       	call   f8d <shrink_node+0xf8d>	f89: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0f8d      f8d:	eb 3e                	jmp    fcd <shrink_node+0xfcd>
0f8f      f8f:	48 8b 9c 24 c8 00 00 00 	mov    0xc8(%rsp),%rbx
0f97      f97:	31 ff                	xor    %edi,%edi
0f99      f99:	48 89 de             	mov    %rbx,%rsi
0f9c      f9c:	e8 00 00 00 00       	call   fa1 <shrink_node+0xfa1>	f9d: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0fa1      fa1:	48 85 db             	test   %rbx,%rbx
0fa4      fa4:	74 07                	je     fad <shrink_node+0xfad>
0fa6      fa6:	e8 00 00 00 00       	call   fab <shrink_node+0xfab>	fa7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0fab      fab:	eb 20                	jmp    fcd <shrink_node+0xfcd>
0fad      fad:	48 8b 9c 24 c0 00 00 00 	mov    0xc0(%rsp),%rbx
0fb5      fb5:	31 ff                	xor    %edi,%edi
0fb7      fb7:	48 89 de             	mov    %rbx,%rsi
0fba      fba:	e8 00 00 00 00       	call   fbf <shrink_node+0xfbf>	fbb: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0fbf      fbf:	48 85 db             	test   %rbx,%rbx
0fc2      fc2:	0f 84 7d 14 00 00    	je     2445 <shrink_node+0x2445>
0fc8      fc8:	e8 00 00 00 00       	call   fcd <shrink_node+0xfcd>	fc9: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0fcd      fcd:	45 31 e4             	xor    %r12d,%r12d
0fd0      fd0:	4e 8b b4 e4 b0 00 00 00 	mov    0xb0(%rsp,%r12,8),%r14
0fd8      fd8:	31 ff                	xor    %edi,%edi
0fda      fda:	4c 89 f6             	mov    %r14,%rsi
0fdd      fdd:	e8 00 00 00 00       	call   fe2 <shrink_node+0xfe2>	fde: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0fe2      fe2:	4d 85 f6             	test   %r14,%r14
0fe5      fe5:	0f 84 c1 04 00 00    	je     14ac <shrink_node+0x14ac>
0feb      feb:	e8 00 00 00 00       	call   ff0 <shrink_node+0xff0>	fec: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0ff0      ff0:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # ff7 <shrink_node+0xff7>	ff3: R_X86_64_PC32	_ftrace_branch+0x88534
0ff7      ff7:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	ffa: R_X86_64_32S	_ftrace_branch+0x88538
0ffe      ffe:	48 ff c3             	inc    %rbx
1001     1001:	e8 00 00 00 00       	call   1006 <shrink_node+0x1006>	1002: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1006     1006:	49 83 fe 20          	cmp    $0x20,%r14
100a     100a:	b8 20 00 00 00       	mov    $0x20,%eax
100f     100f:	44 89 e6             	mov    %r12d,%esi
1012     1012:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 1019 <shrink_node+0x1019>	1015: R_X86_64_PC32	_ftrace_branch+0x88534
1019     1019:	49 0f 42 c6          	cmovb  %r14,%rax
101d     101d:	83 e6 01             	and    $0x1,%esi
1020     1020:	31 ff                	xor    %edi,%edi
1022     1022:	49 29 c6             	sub    %rax,%r14
1025     1025:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
102a     102a:	4e 89 b4 e4 b0 00 00 00 	mov    %r14,0xb0(%rsp,%r12,8)
1032     1032:	e8 00 00 00 00       	call   1037 <shrink_node+0x1037>	1033: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
1037     1037:	44 89 e0             	mov    %r12d,%eax
103a     103a:	83 e0 01             	and    $0x1,%eax
103d     103d:	0f 85 90 04 00 00    	jne    14d3 <shrink_node+0x14d3>
1043     1043:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 104a <shrink_node+0x104a>	1046: R_X86_64_PC32	_ftrace_branch+0x88604
104a     104a:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	104d: R_X86_64_32S	_ftrace_branch+0x88608
1051     1051:	48 ff c3             	inc    %rbx
1054     1054:	e8 00 00 00 00       	call   1059 <shrink_node+0x1059>	1055: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1059     1059:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 1060 <shrink_node+0x1060>	105c: R_X86_64_PC32	_ftrace_branch+0x88604
1060     1060:	48 8d 9c 24 40 01 00 00 	lea    0x140(%rsp),%rbx
1068     1068:	48 89 df             	mov    %rbx,%rdi
106b     106b:	e8 00 00 00 00       	call   1070 <shrink_node+0x1070>	106c: R_X86_64_PLT32	__tsan_write8-0x4
1070     1070:	bf 02 00 00 00       	mov    $0x2,%edi
1075     1075:	4c 89 e6             	mov    %r12,%rsi
1078     1078:	48 89 9c 24 40 01 00 00 	mov    %rbx,0x140(%rsp)
1080     1080:	48 89 9c 24 48 01 00 00 	mov    %rbx,0x148(%rsp)
1088     1088:	e8 00 00 00 00       	call   108d <shrink_node+0x108d>	1089: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
108d     108d:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
1092     1092:	49 83 fc 02          	cmp    $0x2,%r12
1096     1096:	48 89 df             	mov    %rbx,%rdi
1099     1099:	0f 94 44 24 50       	sete   0x50(%rsp)
109e     109e:	e8 00 00 00 00       	call   10a3 <shrink_node+0x10a3>	109f: R_X86_64_PLT32	__tsan_read4-0x4
10a3     10a3:	8b 1b                	mov    (%rbx),%ebx
10a5     10a5:	be 00 00 02 00       	mov    $0x20000,%esi
10aa     10aa:	31 ff                	xor    %edi,%edi
10ac     10ac:	21 de                	and    %ebx,%esi
10ae     10ae:	e8 00 00 00 00       	call   10b3 <shrink_node+0x10b3>	10af: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
10b3     10b3:	b8 00 00 02 00       	mov    $0x20000,%eax
10b8     10b8:	4c 89 24 24          	mov    %r12,(%rsp)
10bc     10bc:	21 c3                	and    %eax,%ebx
10be     10be:	0f 85 aa 04 00 00    	jne    156e <shrink_node+0x156e>
10c4     10c4:	e8 00 00 00 00       	call   10c9 <shrink_node+0x10c9>	10c5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
10c9     10c9:	c7 44 24 10 00 00 00 00 	movl   $0x0,0x10(%rsp)
10d1     10d1:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 10d8 <shrink_node+0x10d8>	10d4: R_X86_64_PC32	_ftrace_branch+0x8868c
10d8     10d8:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	10db: R_X86_64_32S	_ftrace_branch+0x88690
10df     10df:	48 ff c3             	inc    %rbx
10e2     10e2:	e8 00 00 00 00       	call   10e7 <shrink_node+0x10e7>	10e3: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
10e7     10e7:	4c 8b 35 00 00 00 00 	mov    0x0(%rip),%r14        # 10ee <shrink_node+0x10ee>	10ea: R_X86_64_PC32	_ftrace_branch+0x8869c
10ee     10ee:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	10f1: R_X86_64_32S	_ftrace_branch+0x886a0
10f5     10f5:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 10fc <shrink_node+0x10fc>	10f8: R_X86_64_PC32	_ftrace_branch+0x8868c
10fc     10fc:	49 ff c6             	inc    %r14
10ff     10ff:	e8 00 00 00 00       	call   1104 <shrink_node+0x1104>	1100: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1104     1104:	49 83 fc 02          	cmp    $0x2,%r12
1108     1108:	4c 89 35 00 00 00 00 	mov    %r14,0x0(%rip)        # 110f <shrink_node+0x110f>	110b: R_X86_64_PC32	_ftrace_branch+0x8869c
110f     110f:	75 6d                	jne    117e <shrink_node+0x117e>
1111     1111:	e8 00 00 00 00       	call   1116 <shrink_node+0x1116>	1112: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1116     1116:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 111d <shrink_node+0x111d>	1119: R_X86_64_PC32	_ftrace_branch+0x886ac
111d     111d:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1120: R_X86_64_32S	_ftrace_branch+0x886b0
1124     1124:	48 ff c3             	inc    %rbx
1127     1127:	e8 00 00 00 00       	call   112c <shrink_node+0x112c>	1128: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
112c     112c:	be 08 00 00 00       	mov    $0x8,%esi
1131     1131:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1134: R_X86_64_32S	vm_node_stat+0x10
1138     1138:	ba 04 00 00 00       	mov    $0x4,%edx
113d     113d:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 1144 <shrink_node+0x1144>	1140: R_X86_64_PC32	_ftrace_branch+0x886ac
1144     1144:	e8 00 00 00 00       	call   1149 <shrink_node+0x1149>	1145: R_X86_64_PLT32	__kcsan_check_access-0x4
1149     1149:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	114c: R_X86_64_32S	vm_node_stat+0x10
1150     1150:	e8 00 00 00 00       	call   1155 <shrink_node+0x1155>	1151: R_X86_64_PLT32	__tsan_volatile_read8-0x4
1155     1155:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 115c <shrink_node+0x115c>	1158: R_X86_64_PC32	vm_node_stat+0xc
115c     115c:	48 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%rdi
1163     1163:	48 89 de             	mov    %rbx,%rsi
1166     1166:	e8 00 00 00 00       	call   116b <shrink_node+0x116b>	1167: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
116b     116b:	48 85 db             	test   %rbx,%rbx
116e     116e:	78 7b                	js     11eb <shrink_node+0x11eb>
1170     1170:	e8 00 00 00 00       	call   1175 <shrink_node+0x1175>	1171: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1175     1175:	49 c7 c7 00 00 00 00 	mov    $0x0,%r15	1178: R_X86_64_32S	_ftrace_branch+0x877f8
117c     117c:	eb 7b                	jmp    11f9 <shrink_node+0x11f9>
117e     117e:	e8 00 00 00 00       	call   1183 <shrink_node+0x1183>	117f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1183     1183:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 118a <shrink_node+0x118a>	1186: R_X86_64_PC32	_ftrace_branch+0x886a4
118a     118a:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	118d: R_X86_64_32S	_ftrace_branch+0x886a8
1191     1191:	48 ff c3             	inc    %rbx
1194     1194:	e8 00 00 00 00       	call   1199 <shrink_node+0x1199>	1195: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1199     1199:	be 08 00 00 00       	mov    $0x8,%esi
119e     119e:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	11a1: R_X86_64_32S	vm_node_stat
11a5     11a5:	ba 04 00 00 00       	mov    $0x4,%edx
11aa     11aa:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 11b1 <shrink_node+0x11b1>	11ad: R_X86_64_PC32	_ftrace_branch+0x886a4
11b1     11b1:	e8 00 00 00 00       	call   11b6 <shrink_node+0x11b6>	11b2: R_X86_64_PLT32	__kcsan_check_access-0x4
11b6     11b6:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	11b9: R_X86_64_32S	vm_node_stat
11bd     11bd:	e8 00 00 00 00       	call   11c2 <shrink_node+0x11c2>	11be: R_X86_64_PLT32	__tsan_volatile_read8-0x4
11c2     11c2:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 11c9 <shrink_node+0x11c9>	11c5: R_X86_64_PC32	vm_node_stat-0x4
11c9     11c9:	48 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%rdi
11d0     11d0:	48 89 de             	mov    %rbx,%rsi
11d3     11d3:	e8 00 00 00 00       	call   11d8 <shrink_node+0x11d8>	11d4: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
11d8     11d8:	48 85 db             	test   %rbx,%rbx
11db     11db:	78 71                	js     124e <shrink_node+0x124e>
11dd     11dd:	e8 00 00 00 00       	call   11e2 <shrink_node+0x11e2>	11de: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
11e2     11e2:	49 c7 c7 00 00 00 00 	mov    $0x0,%r15	11e5: R_X86_64_32S	_ftrace_branch+0x877f8
11e9     11e9:	eb 71                	jmp    125c <shrink_node+0x125c>
11eb     11eb:	e8 00 00 00 00       	call   11f0 <shrink_node+0x11f0>	11ec: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
11f0     11f0:	49 c7 c7 00 00 00 00 	mov    $0x0,%r15	11f3: R_X86_64_32S	_ftrace_branch+0x87800
11f7     11f7:	31 db                	xor    %ebx,%ebx
11f9     11f9:	4d 8b 37             	mov    (%r15),%r14
11fc     11fc:	4c 89 ff             	mov    %r15,%rdi
11ff     11ff:	49 ff c6             	inc    %r14
1202     1202:	e8 00 00 00 00       	call   1207 <shrink_node+0x1207>	1203: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1207     1207:	be 08 00 00 00       	mov    $0x8,%esi
120c     120c:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	120f: R_X86_64_32S	vm_node_stat+0x40
1213     1213:	ba 04 00 00 00       	mov    $0x4,%edx
1218     1218:	4d 89 37             	mov    %r14,(%r15)
121b     121b:	e8 00 00 00 00       	call   1220 <shrink_node+0x1220>	121c: R_X86_64_PLT32	__kcsan_check_access-0x4
1220     1220:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1223: R_X86_64_32S	vm_node_stat+0x40
1227     1227:	e8 00 00 00 00       	call   122c <shrink_node+0x122c>	1228: R_X86_64_PLT32	__tsan_volatile_read8-0x4
122c     122c:	4c 8b 3d 00 00 00 00 	mov    0x0(%rip),%r15        # 1233 <shrink_node+0x1233>	122f: R_X86_64_PC32	vm_node_stat+0x3c
1233     1233:	48 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%rdi
123a     123a:	4c 89 fe             	mov    %r15,%rsi
123d     123d:	e8 00 00 00 00       	call   1242 <shrink_node+0x1242>	123e: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
1242     1242:	4d 85 ff             	test   %r15,%r15
1245     1245:	78 71                	js     12b8 <shrink_node+0x12b8>
1247     1247:	e8 00 00 00 00       	call   124c <shrink_node+0x124c>	1248: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
124c     124c:	eb 61                	jmp    12af <shrink_node+0x12af>
124e     124e:	e8 00 00 00 00       	call   1253 <shrink_node+0x1253>	124f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1253     1253:	49 c7 c7 00 00 00 00 	mov    $0x0,%r15	1256: R_X86_64_32S	_ftrace_branch+0x87800
125a     125a:	31 db                	xor    %ebx,%ebx
125c     125c:	4d 8b 37             	mov    (%r15),%r14
125f     125f:	4c 89 ff             	mov    %r15,%rdi
1262     1262:	49 ff c6             	inc    %r14
1265     1265:	e8 00 00 00 00       	call   126a <shrink_node+0x126a>	1266: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
126a     126a:	be 08 00 00 00       	mov    $0x8,%esi
126f     126f:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1272: R_X86_64_32S	vm_node_stat+0x38
1276     1276:	ba 04 00 00 00       	mov    $0x4,%edx
127b     127b:	4d 89 37             	mov    %r14,(%r15)
127e     127e:	e8 00 00 00 00       	call   1283 <shrink_node+0x1283>	127f: R_X86_64_PLT32	__kcsan_check_access-0x4
1283     1283:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1286: R_X86_64_32S	vm_node_stat+0x38
128a     128a:	e8 00 00 00 00       	call   128f <shrink_node+0x128f>	128b: R_X86_64_PLT32	__tsan_volatile_read8-0x4
128f     128f:	4c 8b 3d 00 00 00 00 	mov    0x0(%rip),%r15        # 1296 <shrink_node+0x1296>	1292: R_X86_64_PC32	vm_node_stat+0x34
1296     1296:	48 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%rdi
129d     129d:	4c 89 fe             	mov    %r15,%rsi
12a0     12a0:	e8 00 00 00 00       	call   12a5 <shrink_node+0x12a5>	12a1: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
12a5     12a5:	4d 85 ff             	test   %r15,%r15
12a8     12a8:	78 15                	js     12bf <shrink_node+0x12bf>
12aa     12aa:	e8 00 00 00 00       	call   12af <shrink_node+0x12af>	12ab: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
12af     12af:	49 c7 c5 00 00 00 00 	mov    $0x0,%r13	12b2: R_X86_64_32S	_ftrace_branch+0x877f8
12b6     12b6:	eb 16                	jmp    12ce <shrink_node+0x12ce>
12b8     12b8:	e8 00 00 00 00       	call   12bd <shrink_node+0x12bd>	12b9: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
12bd     12bd:	eb 05                	jmp    12c4 <shrink_node+0x12c4>
12bf     12bf:	e8 00 00 00 00       	call   12c4 <shrink_node+0x12c4>	12c0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
12c4     12c4:	49 c7 c5 00 00 00 00 	mov    $0x0,%r13	12c7: R_X86_64_32S	_ftrace_branch+0x87800
12cb     12cb:	45 31 ff             	xor    %r15d,%r15d
12ce     12ce:	4d 8b 75 00          	mov    0x0(%r13),%r14
12d2     12d2:	4c 89 ef             	mov    %r13,%rdi
12d5     12d5:	49 ff c6             	inc    %r14
12d8     12d8:	e8 00 00 00 00       	call   12dd <shrink_node+0x12dd>	12d9: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
12dd     12dd:	4d 89 75 00          	mov    %r14,0x0(%r13)
12e1     12e1:	4c 8b b4 24 a8 00 00 00 	mov    0xa8(%rsp),%r14
12e9     12e9:	4c 89 f7             	mov    %r14,%rdi
12ec     12ec:	e8 00 00 00 00       	call   12f1 <shrink_node+0x12f1>	12ed: R_X86_64_PLT32	__tsan_read4-0x4
12f1     12f1:	45 8b 2e             	mov    (%r14),%r13d
12f4     12f4:	41 bc c0 00 00 00    	mov    $0xc0,%r12d
12fa     12fa:	bf c0 00 00 00       	mov    $0xc0,%edi
12ff     12ff:	45 21 e5             	and    %r12d,%r13d
1302     1302:	44 89 ee             	mov    %r13d,%esi
1305     1305:	e8 00 00 00 00       	call   130a <shrink_node+0x130a>	1306: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
130a     130a:	49 89 de             	mov    %rbx,%r14
130d     130d:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	1310: R_X86_64_32S	_ftrace_branch+0x886c0
1314     1314:	49 c1 ee 03          	shr    $0x3,%r14
1318     1318:	45 39 e5             	cmp    %r12d,%r13d
131b     131b:	49 c7 c5 00 00 00 00 	mov    $0x0,%r13	131e: R_X86_64_32S	_ftrace_branch+0x886b8
1322     1322:	4c 0f 44 e8          	cmove  %rax,%r13
1326     1326:	4c 0f 45 f3          	cmovne %rbx,%r14
132a     132a:	4d 8b 65 00          	mov    0x0(%r13),%r12
132e     132e:	4c 89 ef             	mov    %r13,%rdi
1331     1331:	49 ff c4             	inc    %r12
1334     1334:	e8 00 00 00 00       	call   1339 <shrink_node+0x1339>	1335: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1339     1339:	4c 89 ff             	mov    %r15,%rdi
133c     133c:	4c 89 f6             	mov    %r14,%rsi
133f     133f:	4d 89 65 00          	mov    %r12,0x0(%r13)
1343     1343:	e8 00 00 00 00       	call   1348 <shrink_node+0x1348>	1344: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
1348     1348:	4d 39 f7             	cmp    %r14,%r15
134b     134b:	0f 86 5f 02 00 00    	jbe    15b0 <shrink_node+0x15b0>
1351     1351:	e8 00 00 00 00       	call   1356 <shrink_node+0x1356>	1352: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1356     1356:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 135d <shrink_node+0x135d>	1359: R_X86_64_PC32	_ftrace_branch+0x886c4
135d     135d:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1360: R_X86_64_32S	_ftrace_branch+0x886c8
1364     1364:	48 ff c3             	inc    %rbx
1367     1367:	e8 00 00 00 00       	call   136c <shrink_node+0x136c>	1368: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
136c     136c:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	136f: R_X86_64_32S	_ftrace_annotated_branch+0x78390
1373     1373:	be 01 00 00 00       	mov    $0x1,%esi
1378     1378:	31 d2                	xor    %edx,%edx
137a     137a:	31 c9                	xor    %ecx,%ecx
137c     137c:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 1383 <shrink_node+0x1383>	137f: R_X86_64_PC32	_ftrace_branch+0x886c4
1383     1383:	e8 00 00 00 00       	call   1388 <shrink_node+0x1388>	1384: R_X86_64_PLT32	ftrace_likely_update-0x4
1388     1388:	f6 44 24 10 01       	testb  $0x1,0x10(%rsp)
138d     138d:	4c 8b 24 24          	mov    (%rsp),%r12
1391     1391:	0f 85 98 02 00 00    	jne    162f <shrink_node+0x162f>
1397     1397:	e8 00 00 00 00       	call   139c <shrink_node+0x139c>	1398: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
139c     139c:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 13a3 <shrink_node+0x13a3>	139f: R_X86_64_PC32	_ftrace_branch+0x88624
13a3     13a3:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	13a6: R_X86_64_32S	_ftrace_branch+0x88628
13aa     13aa:	48 ff c3             	inc    %rbx
13ad     13ad:	e8 00 00 00 00       	call   13b2 <shrink_node+0x13b2>	13ae: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
13b2     13b2:	48 8b 7c 24 58       	mov    0x58(%rsp),%rdi
13b7     13b7:	be 01 00 00 00       	mov    $0x1,%esi
13bc     13bc:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 13c3 <shrink_node+0x13c3>	13bf: R_X86_64_PC32	_ftrace_branch+0x88624
13c3     13c3:	e8 00 00 00 00       	call   13c8 <shrink_node+0x13c8>	13c4: R_X86_64_PLT32	reclaim_throttle-0x4
13c8     13c8:	e8 00 00 00 00       	call   13cd <shrink_node+0x13cd>	13c9: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
13cd     13cd:	48 8b 5c 24 78       	mov    0x78(%rsp),%rbx
13d2     13d2:	be 08 00 00 00       	mov    $0x8,%esi
13d7     13d7:	ba 04 00 00 00       	mov    $0x4,%edx
13dc     13dc:	48 89 df             	mov    %rbx,%rdi
13df     13df:	e8 00 00 00 00       	call   13e4 <shrink_node+0x13e4>	13e0: R_X86_64_PLT32	__kcsan_check_access-0x4
13e4     13e4:	48 89 df             	mov    %rbx,%rdi
13e7     13e7:	e8 00 00 00 00       	call   13ec <shrink_node+0x13ec>	13e8: R_X86_64_PLT32	__tsan_volatile_read8-0x4
13ec     13ec:	4c 8b 33             	mov    (%rbx),%r14
13ef     13ef:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	13f2: R_X86_64_32S	_ftrace_annotated_branch+0x77a60
13f6     13f6:	31 d2                	xor    %edx,%edx
13f8     13f8:	31 c9                	xor    %ecx,%ecx
13fa     13fa:	44 89 f3             	mov    %r14d,%ebx
13fd     13fd:	c1 eb 02             	shr    $0x2,%ebx
1400     1400:	83 e3 01             	and    $0x1,%ebx
1403     1403:	89 de                	mov    %ebx,%esi
1405     1405:	e8 00 00 00 00       	call   140a <shrink_node+0x140a>	1406: R_X86_64_PLT32	ftrace_likely_update-0x4
140a     140a:	31 ff                	xor    %edi,%edi
140c     140c:	89 de                	mov    %ebx,%esi
140e     140e:	e8 00 00 00 00       	call   1413 <shrink_node+0x1413>	140f: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
1413     1413:	41 0f ba e6 02       	bt     $0x2,%r14d
1418     1418:	72 07                	jb     1421 <shrink_node+0x1421>
141a     141a:	e8 00 00 00 00       	call   141f <shrink_node+0x141f>	141b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
141f     141f:	eb 47                	jmp    1468 <shrink_node+0x1468>
1421     1421:	48 8b 9c 24 a0 00 00 00 	mov    0xa0(%rsp),%rbx
1429     1429:	48 89 df             	mov    %rbx,%rdi
142c     142c:	e8 00 00 00 00       	call   1431 <shrink_node+0x1431>	142d: R_X86_64_PLT32	__tsan_read8-0x4
1431     1431:	44 8b 33             	mov    (%rbx),%r14d
1434     1434:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1437: R_X86_64_32S	_ftrace_annotated_branch+0x77a90
143b     143b:	31 d2                	xor    %edx,%edx
143d     143d:	31 c9                	xor    %ecx,%ecx
143f     143f:	44 89 f3             	mov    %r14d,%ebx
1442     1442:	c1 eb 08             	shr    $0x8,%ebx
1445     1445:	83 e3 01             	and    $0x1,%ebx
1448     1448:	89 de                	mov    %ebx,%esi
144a     144a:	e8 00 00 00 00       	call   144f <shrink_node+0x144f>	144b: R_X86_64_PLT32	ftrace_likely_update-0x4
144f     144f:	31 ff                	xor    %edi,%edi
1451     1451:	89 de                	mov    %ebx,%esi
1453     1453:	e8 00 00 00 00       	call   1458 <shrink_node+0x1458>	1454: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
1458     1458:	41 0f ba e6 08       	bt     $0x8,%r14d
145d     145d:	0f 82 03 0a 00 00    	jb     1e66 <shrink_node+0x1e66>
1463     1463:	e8 00 00 00 00       	call   1468 <shrink_node+0x1468>	1464: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1468     1468:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 146f <shrink_node+0x146f>	146b: R_X86_64_PC32	_ftrace_branch+0x88634
146f     146f:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1472: R_X86_64_32S	_ftrace_branch+0x88638
1476     1476:	48 ff c3             	inc    %rbx
1479     1479:	e8 00 00 00 00       	call   147e <shrink_node+0x147e>	147a: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
147e     147e:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 1485 <shrink_node+0x1485>	1481: R_X86_64_PC32	_ftrace_branch+0x88634
1485     1485:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
148a     148a:	48 89 df             	mov    %rbx,%rdi
148d     148d:	e8 00 00 00 00       	call   1492 <shrink_node+0x1492>	148e: R_X86_64_PLT32	__tsan_read4-0x4
1492     1492:	f6 43 02 02          	testb  $0x2,0x2(%rbx)
1496     1496:	0f 85 bc 01 00 00    	jne    1658 <shrink_node+0x1658>
149c     149c:	e8 00 00 00 00       	call   14a1 <shrink_node+0x14a1>	149d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
14a1     14a1:	b0 01                	mov    $0x1,%al
14a3     14a3:	89 44 24 10          	mov    %eax,0x10(%rsp)
14a7     14a7:	e9 25 fc ff ff       	jmp    10d1 <shrink_node+0x10d1>
14ac     14ac:	e8 00 00 00 00       	call   14b1 <shrink_node+0x14b1>	14ad: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
14b1     14b1:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 14b8 <shrink_node+0x14b8>	14b4: R_X86_64_PC32	_ftrace_branch+0x8852c
14b8     14b8:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	14bb: R_X86_64_32S	_ftrace_branch+0x88530
14bf     14bf:	48 ff c3             	inc    %rbx
14c2     14c2:	e8 00 00 00 00       	call   14c7 <shrink_node+0x14c7>	14c3: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
14c7     14c7:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 14ce <shrink_node+0x14ce>	14ca: R_X86_64_PC32	_ftrace_branch+0x8852c
14ce     14ce:	e9 7c 09 00 00       	jmp    1e4f <shrink_node+0x1e4f>
14d3     14d3:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 14da <shrink_node+0x14da>	14d6: R_X86_64_PC32	_ftrace_branch+0x8860c
14da     14da:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	14dd: R_X86_64_32S	_ftrace_branch+0x88610
14e1     14e1:	48 ff c3             	inc    %rbx
14e4     14e4:	e8 00 00 00 00       	call   14e9 <shrink_node+0x14e9>	14e5: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
14e9     14e9:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 14f0 <shrink_node+0x14f0>	14ec: R_X86_64_PC32	_ftrace_branch+0x8860c
14f0     14f0:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
14f5     14f5:	bf 01 00 00 00       	mov    $0x1,%edi
14fa     14fa:	4c 89 e6             	mov    %r12,%rsi
14fd     14fd:	41 0f b6 5f 2a       	movzbl 0x2a(%r15),%ebx
1502     1502:	41 0f b7 47 28       	movzwl 0x28(%r15),%eax
1507     1507:	c1 e3 10             	shl    $0x10,%ebx
150a     150a:	09 c3                	or     %eax,%ebx
150c     150c:	e8 00 00 00 00       	call   1511 <shrink_node+0x1511>	150d: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
1511     1511:	49 83 fc 02          	cmp    $0x2,%r12
1515     1515:	41 be 01 00 00 00    	mov    $0x1,%r14d
151b     151b:	89 de                	mov    %ebx,%esi
151d     151d:	0f 93 c1             	setae  %cl
1520     1520:	31 ff                	xor    %edi,%edi
1522     1522:	41 d3 e6             	shl    %cl,%r14d
1525     1525:	44 21 f6             	and    %r14d,%esi
1528     1528:	e8 00 00 00 00       	call   152d <shrink_node+0x152d>	1529: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
152d     152d:	41 21 de             	and    %ebx,%r14d
1530     1530:	74 46                	je     1578 <shrink_node+0x1578>
1532     1532:	e8 00 00 00 00       	call   1537 <shrink_node+0x1537>	1533: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1537     1537:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 153e <shrink_node+0x153e>	153a: R_X86_64_PC32	_ftrace_branch+0x8861c
153e     153e:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1541: R_X86_64_32S	_ftrace_branch+0x88620
1545     1545:	48 ff c3             	inc    %rbx
1548     1548:	e8 00 00 00 00       	call   154d <shrink_node+0x154d>	1549: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
154d     154d:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
1552     1552:	48 8b 74 24 70       	mov    0x70(%rsp),%rsi
1557     1557:	4c 89 fa             	mov    %r15,%rdx
155a     155a:	44 89 e1             	mov    %r12d,%ecx
155d     155d:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 1564 <shrink_node+0x1564>	1560: R_X86_64_PC32	_ftrace_branch+0x8861c
1564     1564:	e8 00 00 00 00       	call   1569 <shrink_node+0x1569>	1565: R_X86_64_PLT32	.text.shrink_active_list-0x4
1569     1569:	e9 e3 00 00 00       	jmp    1651 <shrink_node+0x1651>
156e     156e:	e8 00 00 00 00       	call   1573 <shrink_node+0x1573>	156f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1573     1573:	e9 e5 00 00 00       	jmp    165d <shrink_node+0x165d>
1578     1578:	e8 00 00 00 00       	call   157d <shrink_node+0x157d>	1579: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
157d     157d:	4c 8b 35 00 00 00 00 	mov    0x0(%rip),%r14        # 1584 <shrink_node+0x1584>	1580: R_X86_64_PC32	_ftrace_branch+0x88614
1584     1584:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1587: R_X86_64_32S	_ftrace_branch+0x88618
158b     158b:	49 ff c6             	inc    %r14
158e     158e:	e8 00 00 00 00       	call   1593 <shrink_node+0x1593>	158f: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1593     1593:	89 d8                	mov    %ebx,%eax
1595     1595:	c1 eb 10             	shr    $0x10,%ebx
1598     1598:	4c 89 35 00 00 00 00 	mov    %r14,0x0(%rip)        # 159f <shrink_node+0x159f>	159b: R_X86_64_PC32	_ftrace_branch+0x88614
159f     159f:	83 c8 08             	or     $0x8,%eax
15a2     15a2:	41 88 5f 2a          	mov    %bl,0x2a(%r15)
15a6     15a6:	66 41 89 47 28       	mov    %ax,0x28(%r15)
15ab     15ab:	e9 a1 00 00 00       	jmp    1651 <shrink_node+0x1651>
15b0     15b0:	e8 00 00 00 00       	call   15b5 <shrink_node+0x15b5>	15b1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
15b5     15b5:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 15bc <shrink_node+0x15bc>	15b8: R_X86_64_PC32	_ftrace_branch+0x886cc
15bc     15bc:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	15bf: R_X86_64_32S	_ftrace_branch+0x886d0
15c3     15c3:	48 ff c3             	inc    %rbx
15c6     15c6:	e8 00 00 00 00       	call   15cb <shrink_node+0x15cb>	15c7: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
15cb     15cb:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 15d2 <shrink_node+0x15d2>	15ce: R_X86_64_PC32	_ftrace_branch+0x886cc
15d2     15d2:	48 8b 9c 24 90 01 00 00 	mov    0x190(%rsp),%rbx
15da     15da:	48 89 df             	mov    %rbx,%rdi
15dd     15dd:	e8 00 00 00 00       	call   15e2 <shrink_node+0x15e2>	15de: R_X86_64_PLT32	__tsan_volatile_read8-0x4
15e2     15e2:	48 8b 03             	mov    (%rbx),%rax
15e5     15e5:	4c 8b 24 24          	mov    (%rsp),%r12
15e9     15e9:	48 39 d8             	cmp    %rbx,%rax
15ec     15ec:	0f 84 9d 08 00 00    	je     1e8f <shrink_node+0x1e8f>
15f2     15f2:	e8 00 00 00 00       	call   15f7 <shrink_node+0x15f7>	15f3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
15f7     15f7:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 15fe <shrink_node+0x15fe>	15fa: R_X86_64_PC32	_ftrace_branch+0x886dc
15fe     15fe:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1601: R_X86_64_32S	_ftrace_branch+0x886e0
1605     1605:	48 ff c3             	inc    %rbx
1608     1608:	e8 00 00 00 00       	call   160d <shrink_node+0x160d>	1609: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
160d     160d:	48 8b bc 24 80 01 00 00 	mov    0x180(%rsp),%rdi
1615     1615:	be 03 00 00 00       	mov    $0x3,%esi
161a     161a:	ba 01 00 00 00       	mov    $0x1,%edx
161f     161f:	31 c9                	xor    %ecx,%ecx
1621     1621:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 1628 <shrink_node+0x1628>	1624: R_X86_64_PC32	_ftrace_branch+0x886dc
1628     1628:	e8 00 00 00 00       	call   162d <shrink_node+0x162d>	1629: R_X86_64_PLT32	__wake_up-0x4
162d     162d:	eb 4b                	jmp    167a <shrink_node+0x167a>
162f     162f:	e8 00 00 00 00       	call   1634 <shrink_node+0x1634>	1630: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1634     1634:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 163b <shrink_node+0x163b>	1637: R_X86_64_PC32	_ftrace_branch+0x8862c
163b     163b:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	163e: R_X86_64_32S	_ftrace_branch+0x88630
1642     1642:	48 ff c3             	inc    %rbx
1645     1645:	e8 00 00 00 00       	call   164a <shrink_node+0x164a>	1646: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
164a     164a:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 1651 <shrink_node+0x1651>	164d: R_X86_64_PC32	_ftrace_branch+0x8862c
1651     1651:	31 c0                	xor    %eax,%eax
1653     1653:	e9 f2 07 00 00       	jmp    1e4a <shrink_node+0x1e4a>
1658     1658:	e8 00 00 00 00       	call   165d <shrink_node+0x165d>	1659: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
165d     165d:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 1664 <shrink_node+0x1664>	1660: R_X86_64_PC32	_ftrace_branch+0x88694
1664     1664:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1667: R_X86_64_32S	_ftrace_branch+0x88698
166b     166b:	48 ff c3             	inc    %rbx
166e     166e:	e8 00 00 00 00       	call   1673 <shrink_node+0x1673>	166f: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1673     1673:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 167a <shrink_node+0x167a>	1676: R_X86_64_PC32	_ftrace_branch+0x88694
167a     167a:	45 31 ed             	xor    %r13d,%r13d
167d     167d:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1680: R_X86_64_32S	_ftrace_annotated_branch+0x78390
1684     1684:	49 83 fc 02          	cmp    $0x2,%r12
1688     1688:	41 0f 94 c5          	sete   %r13b
168c     168c:	31 f6                	xor    %esi,%esi
168e     168e:	31 d2                	xor    %edx,%edx
1690     1690:	31 c9                	xor    %ecx,%ecx
1692     1692:	e8 00 00 00 00       	call   1697 <shrink_node+0x1697>	1693: R_X86_64_PLT32	ftrace_likely_update-0x4
1697     1697:	e8 00 00 00 00       	call   169c <shrink_node+0x169c>	1698: R_X86_64_PLT32	lru_add_drain-0x4
169c     169c:	48 8b 7c 24 68       	mov    0x68(%rsp),%rdi
16a1     16a1:	e8 00 00 00 00       	call   16a6 <shrink_node+0x16a6>	16a2: R_X86_64_PLT32	_raw_spin_lock_irq-0x4
16a6     16a6:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
16ab     16ab:	48 8b 74 24 70       	mov    0x70(%rsp),%rsi
16b0     16b0:	48 8d 94 24 40 01 00 00 	lea    0x140(%rsp),%rdx
16b8     16b8:	48 8d 8c 24 98 01 00 00 	lea    0x198(%rsp),%rcx
16c0     16c0:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
16c5     16c5:	45 89 e1             	mov    %r12d,%r9d
16c8     16c8:	e8 00 00 00 00       	call   16cd <shrink_node+0x16cd>	16c9: R_X86_64_PLT32	.text.isolate_lru_folios-0x4
16cd     16cd:	41 83 c5 07          	add    $0x7,%r13d
16d1     16d1:	48 8b 7c 24 58       	mov    0x58(%rsp),%rdi
16d6     16d6:	48 89 c2             	mov    %rax,%rdx
16d9     16d9:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
16de     16de:	44 89 ee             	mov    %r13d,%esi
16e1     16e1:	e8 00 00 00 00       	call   16e6 <shrink_node+0x16e6>	16e2: R_X86_64_PLT32	__mod_node_page_state-0x4
16e6     16e6:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
16eb     16eb:	48 89 df             	mov    %rbx,%rdi
16ee     16ee:	e8 00 00 00 00       	call   16f3 <shrink_node+0x16f3>	16ef: R_X86_64_PLT32	__tsan_read4-0x4
16f3     16f3:	8b 1b                	mov    (%rbx),%ebx
16f5     16f5:	be 00 00 02 00       	mov    $0x20000,%esi
16fa     16fa:	31 ff                	xor    %edi,%edi
16fc     16fc:	21 de                	and    %ebx,%esi
16fe     16fe:	e8 00 00 00 00       	call   1703 <shrink_node+0x1703>	16ff: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
1703     1703:	b8 00 00 02 00       	mov    $0x20000,%eax
1708     1708:	21 c3                	and    %eax,%ebx
170a     170a:	75 30                	jne    173c <shrink_node+0x173c>
170c     170c:	e8 00 00 00 00       	call   1711 <shrink_node+0x1711>	170d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1711     1711:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 1718 <shrink_node+0x1718>	1714: R_X86_64_PC32	_ftrace_branch+0x87f7c
1718     1718:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	171b: R_X86_64_32S	_ftrace_branch+0x87f80
171f     171f:	48 ff c3             	inc    %rbx
1722     1722:	e8 00 00 00 00       	call   1727 <shrink_node+0x1727>	1723: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1727     1727:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 172e <shrink_node+0x172e>	172a: R_X86_64_PC32	_ftrace_branch+0x87f7c
172e     172e:	b8 1d 00 00 00       	mov    $0x1d,%eax
1733     1733:	48 c7 c3 00 00 00 00 	mov    $0x0,%rbx	1736: R_X86_64_32S	_ftrace_branch+0x87f90
173a     173a:	eb 11                	jmp    174d <shrink_node+0x174d>
173c     173c:	e8 00 00 00 00       	call   1741 <shrink_node+0x1741>	173d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1741     1741:	b8 1c 00 00 00       	mov    $0x1c,%eax
1746     1746:	48 c7 c3 00 00 00 00 	mov    $0x0,%rbx	1749: R_X86_64_32S	_ftrace_branch+0x87f88
174d     174d:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
1752     1752:	45 31 e4             	xor    %r12d,%r12d
1755     1755:	48 89 df             	mov    %rbx,%rdi
1758     1758:	4c 8b 3b             	mov    (%rbx),%r15
175b     175b:	48 83 3c 24 02       	cmpq   $0x2,(%rsp)
1760     1760:	41 0f 94 c4          	sete   %r12b
1764     1764:	49 ff c7             	inc    %r15
1767     1767:	e8 00 00 00 00       	call   176c <shrink_node+0x176c>	1768: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
176c     176c:	4c 8b 35 00 00 00 00 	mov    0x0(%rip),%r14        # 1773 <shrink_node+0x1773>	176f: R_X86_64_PC32	_ftrace_branch+0x88644
1773     1773:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1776: R_X86_64_32S	_ftrace_branch+0x88648
177a     177a:	4c 89 3b             	mov    %r15,(%rbx)
177d     177d:	49 ff c6             	inc    %r14
1780     1780:	e8 00 00 00 00       	call   1785 <shrink_node+0x1785>	1781: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1785     1785:	48 8b 9c 24 98 01 00 00 	mov    0x198(%rsp),%rbx
178d     178d:	48 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%rdi
1794     1794:	4c 89 35 00 00 00 00 	mov    %r14,0x0(%rip)        # 179b <shrink_node+0x179b>	1797: R_X86_64_PC32	_ftrace_branch+0x88644
179b     179b:	48 89 de             	mov    %rbx,%rsi
179e     179e:	e8 00 00 00 00       	call   17a3 <shrink_node+0x17a3>	179f: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
17a3     17a3:	bf 01 00 00 00       	mov    $0x1,%edi
17a8     17a8:	48 89 de             	mov    %rbx,%rsi
17ab     17ab:	e8 00 00 00 00       	call   17b0 <shrink_node+0x17b0>	17ac: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
17b0     17b0:	e8 00 00 00 00       	call   17b5 <shrink_node+0x17b5>	17b1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
17b5     17b5:	e8 00 00 00 00       	call   17ba <shrink_node+0x17ba>	17b6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
17ba     17ba:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
17bf     17bf:	65 48 01 1c c5 00 00 00 00 	add    %rbx,%gs:0x0(,%rax,8)	17c4: R_X86_64_32S	vm_event_states
17c8     17c8:	e8 00 00 00 00       	call   17cd <shrink_node+0x17cd>	17c9: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
17cd     17cd:	e8 00 00 00 00       	call   17d2 <shrink_node+0x17d2>	17ce: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
17d2     17d2:	48 89 5c 24 20       	mov    %rbx,0x20(%rsp)
17d7     17d7:	65 4a 01 1c e5 00 00 00 00 	add    %rbx,%gs:0x0(,%r12,8)	17dc: R_X86_64_32S	vm_event_states+0x100
17e0     17e0:	4c 8b 7c 24 68       	mov    0x68(%rsp),%r15
17e5     17e5:	4c 89 ff             	mov    %r15,%rdi
17e8     17e8:	e8 00 00 00 00       	call   17ed <shrink_node+0x17ed>	17e9: R_X86_64_PLT32	_raw_spin_unlock_irq-0x4
17ed     17ed:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
17f2     17f2:	31 ff                	xor    %edi,%edi
17f4     17f4:	48 89 de             	mov    %rbx,%rsi
17f7     17f7:	e8 00 00 00 00       	call   17fc <shrink_node+0x17fc>	17f8: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
17fc     17fc:	48 85 db             	test   %rbx,%rbx
17ff     17ff:	0f 84 cd 00 00 00    	je     18d2 <shrink_node+0x18d2>
1805     1805:	e8 00 00 00 00       	call   180a <shrink_node+0x180a>	1806: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
180a     180a:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 1811 <shrink_node+0x1811>	180d: R_X86_64_PC32	_ftrace_branch+0x8864c
1811     1811:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1814: R_X86_64_32S	_ftrace_branch+0x88650
1818     1818:	48 ff c3             	inc    %rbx
181b     181b:	e8 00 00 00 00       	call   1820 <shrink_node+0x1820>	181c: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1820     1820:	4c 8d a4 24 40 01 00 00 	lea    0x140(%rsp),%r12
1828     1828:	4c 8b 74 24 58       	mov    0x58(%rsp),%r14
182d     182d:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
1832     1832:	48 8d 8c 24 a4 01 00 00 	lea    0x1a4(%rsp),%rcx
183a     183a:	45 31 c0             	xor    %r8d,%r8d
183d     183d:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 1844 <shrink_node+0x1844>	1840: R_X86_64_PC32	_ftrace_branch+0x8864c
1844     1844:	4c 89 e7             	mov    %r12,%rdi
1847     1847:	4c 89 f6             	mov    %r14,%rsi
184a     184a:	e8 00 00 00 00       	call   184f <shrink_node+0x184f>	184b: R_X86_64_PLT32	.text.shrink_folio_list-0x4
184f     184f:	4c 89 ff             	mov    %r15,%rdi
1852     1852:	89 c3                	mov    %eax,%ebx
1854     1854:	e8 00 00 00 00       	call   1859 <shrink_node+0x1859>	1855: R_X86_64_PLT32	_raw_spin_lock_irq-0x4
1859     1859:	48 8b 7c 24 70       	mov    0x70(%rsp),%rdi
185e     185e:	4c 89 e6             	mov    %r12,%rsi
1861     1861:	e8 00 00 00 00       	call   1866 <shrink_node+0x1866>	1862: R_X86_64_PLT32	.text.move_folios_to_lru-0x4
1866     1866:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
186b     186b:	4c 89 f7             	mov    %r14,%rdi
186e     186e:	44 89 ee             	mov    %r13d,%esi
1871     1871:	48 f7 da             	neg    %rdx
1874     1874:	e8 00 00 00 00       	call   1879 <shrink_node+0x1879>	1875: R_X86_64_PLT32	__mod_node_page_state-0x4
1879     1879:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
187e     187e:	4c 89 f7             	mov    %r14,%rdi
1881     1881:	e8 00 00 00 00       	call   1886 <shrink_node+0x1886>	1882: R_X86_64_PLT32	__tsan_read4-0x4
1886     1886:	45 8b 36             	mov    (%r14),%r14d
1889     1889:	be 00 00 02 00       	mov    $0x20000,%esi
188e     188e:	31 ff                	xor    %edi,%edi
1890     1890:	44 21 f6             	and    %r14d,%esi
1893     1893:	e8 00 00 00 00       	call   1898 <shrink_node+0x1898>	1894: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
1898     1898:	b8 00 00 02 00       	mov    $0x20000,%eax
189d     189d:	41 21 c6             	and    %eax,%r14d
18a0     18a0:	75 5d                	jne    18ff <shrink_node+0x18ff>
18a2     18a2:	e8 00 00 00 00       	call   18a7 <shrink_node+0x18a7>	18a3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
18a7     18a7:	4c 8b 35 00 00 00 00 	mov    0x0(%rip),%r14        # 18ae <shrink_node+0x18ae>	18aa: R_X86_64_PC32	_ftrace_branch+0x87f7c
18ae     18ae:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	18b1: R_X86_64_32S	_ftrace_branch+0x87f80
18b5     18b5:	49 ff c6             	inc    %r14
18b8     18b8:	e8 00 00 00 00       	call   18bd <shrink_node+0x18bd>	18b9: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
18bd     18bd:	4c 89 35 00 00 00 00 	mov    %r14,0x0(%rip)        # 18c4 <shrink_node+0x18c4>	18c0: R_X86_64_PC32	_ftrace_branch+0x87f7c
18c4     18c4:	b8 1a 00 00 00       	mov    $0x1a,%eax
18c9     18c9:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	18cc: R_X86_64_32S	_ftrace_branch+0x87f90
18d0     18d0:	eb 3e                	jmp    1910 <shrink_node+0x1910>
18d2     18d2:	e8 00 00 00 00       	call   18d7 <shrink_node+0x18d7>	18d3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
18d7     18d7:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 18de <shrink_node+0x18de>	18da: R_X86_64_PC32	_ftrace_branch+0x88654
18de     18de:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	18e1: R_X86_64_32S	_ftrace_branch+0x88658
18e5     18e5:	48 ff c3             	inc    %rbx
18e8     18e8:	e8 00 00 00 00       	call   18ed <shrink_node+0x18ed>	18e9: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
18ed     18ed:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 18f4 <shrink_node+0x18f4>	18f0: R_X86_64_PC32	_ftrace_branch+0x88654
18f4     18f4:	31 c0                	xor    %eax,%eax
18f6     18f6:	4c 8b 24 24          	mov    (%rsp),%r12
18fa     18fa:	e9 4b 05 00 00       	jmp    1e4a <shrink_node+0x1e4a>
18ff     18ff:	e8 00 00 00 00       	call   1904 <shrink_node+0x1904>	1900: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1904     1904:	b8 19 00 00 00       	mov    $0x19,%eax
1909     1909:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	190c: R_X86_64_32S	_ftrace_branch+0x87f88
1910     1910:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
1915     1915:	48 8b 04 24          	mov    (%rsp),%rax
1919     1919:	45 31 ed             	xor    %r13d,%r13d
191c     191c:	4c 89 f7             	mov    %r14,%rdi
191f     191f:	4d 8b 3e             	mov    (%r14),%r15
1922     1922:	48 83 f8 02          	cmp    $0x2,%rax
1926     1926:	41 0f 94 c5          	sete   %r13b
192a     192a:	49 ff c7             	inc    %r15
192d     192d:	e8 00 00 00 00       	call   1932 <shrink_node+0x1932>	192e: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1932     1932:	4c 8b 25 00 00 00 00 	mov    0x0(%rip),%r12        # 1939 <shrink_node+0x1939>	1935: R_X86_64_PC32	_ftrace_branch+0x8865c
1939     1939:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	193c: R_X86_64_32S	_ftrace_branch+0x88660
1940     1940:	4d 89 3e             	mov    %r15,(%r14)
1943     1943:	49 ff c4             	inc    %r12
1946     1946:	e8 00 00 00 00       	call   194b <shrink_node+0x194b>	1947: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
194b     194b:	bf 01 00 00 00       	mov    $0x1,%edi
1950     1950:	89 de                	mov    %ebx,%esi
1952     1952:	4c 89 25 00 00 00 00 	mov    %r12,0x0(%rip)        # 1959 <shrink_node+0x1959>	1955: R_X86_64_PC32	_ftrace_branch+0x8865c
1959     1959:	41 89 de             	mov    %ebx,%r14d
195c     195c:	e8 00 00 00 00       	call   1961 <shrink_node+0x1961>	195d: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
1961     1961:	e8 00 00 00 00       	call   1966 <shrink_node+0x1966>	1962: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1966     1966:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
196b     196b:	65 4c 01 34 c5 00 00 00 00 	add    %r14,%gs:0x0(,%rax,8)	1970: R_X86_64_32S	vm_event_states
1974     1974:	e8 00 00 00 00       	call   1979 <shrink_node+0x1979>	1975: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1979     1979:	4c 89 74 24 48       	mov    %r14,0x48(%rsp)
197e     197e:	65 4e 01 34 ed 00 00 00 00 	add    %r14,%gs:0x0(,%r13,8)	1983: R_X86_64_32S	vm_event_states+0x110
1987     1987:	48 8b 7c 24 68       	mov    0x68(%rsp),%rdi
198c     198c:	e8 00 00 00 00       	call   1991 <shrink_node+0x1991>	198d: R_X86_64_PLT32	_raw_spin_unlock_irq-0x4
1991     1991:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
1996     1996:	8b 94 24 b8 01 00 00 	mov    0x1b8(%rsp),%edx
199d     199d:	48 8b 7c 24 70       	mov    0x70(%rsp),%rdi
19a2     19a2:	44 89 ee             	mov    %r13d,%esi
19a5     19a5:	89 c1                	mov    %eax,%ecx
19a7     19a7:	29 d9                	sub    %ebx,%ecx
19a9     19a9:	e8 00 00 00 00       	call   19ae <shrink_node+0x19ae>	19aa: R_X86_64_PLT32	lru_note_cost-0x4
19ae     19ae:	8b 9c 24 a8 01 00 00 	mov    0x1a8(%rsp),%ebx
19b5     19b5:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
19ba     19ba:	4c 89 e7             	mov    %r12,%rdi
19bd     19bd:	48 89 de             	mov    %rbx,%rsi
19c0     19c0:	e8 00 00 00 00       	call   19c5 <shrink_node+0x19c5>	19c1: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
19c5     19c5:	49 39 dc             	cmp    %rbx,%r12
19c8     19c8:	75 35                	jne    19ff <shrink_node+0x19ff>
19ca     19ca:	e8 00 00 00 00       	call   19cf <shrink_node+0x19cf>	19cb: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
19cf     19cf:	4c 8b 35 00 00 00 00 	mov    0x0(%rip),%r14        # 19d6 <shrink_node+0x19d6>	19d2: R_X86_64_PC32	_ftrace_branch+0x8866c
19d6     19d6:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	19d9: R_X86_64_32S	_ftrace_branch+0x88670
19dd     19dd:	49 ff c6             	inc    %r14
19e0     19e0:	e8 00 00 00 00       	call   19e5 <shrink_node+0x19e5>	19e1: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
19e5     19e5:	bf 01 00 00 00       	mov    $0x1,%edi
19ea     19ea:	4c 89 35 00 00 00 00 	mov    %r14,0x0(%rip)        # 19f1 <shrink_node+0x19f1>	19ed: R_X86_64_PC32	_ftrace_branch+0x8866c
19f1     19f1:	e8 00 00 00 00       	call   19f6 <shrink_node+0x19f6>	19f2: R_X86_64_PLT32	wakeup_flusher_threads-0x4
19f6     19f6:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	19f9: R_X86_64_32S	_ftrace_branch+0x88678
19fd     19fd:	eb 0c                	jmp    1a0b <shrink_node+0x1a0b>
19ff     19ff:	e8 00 00 00 00       	call   1a04 <shrink_node+0x1a04>	1a00: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1a04     1a04:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	1a07: R_X86_64_32S	_ftrace_branch+0x88668
1a0b     1a0b:	4d 8b 3e             	mov    (%r14),%r15
1a0e     1a0e:	4c 89 f7             	mov    %r14,%rdi
1a11     1a11:	45 31 ed             	xor    %r13d,%r13d
1a14     1a14:	49 ff c7             	inc    %r15
1a17     1a17:	e8 00 00 00 00       	call   1a1c <shrink_node+0x1a1c>	1a18: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1a1c     1a1c:	48 8d bc 24 a4 01 00 00 	lea    0x1a4(%rsp),%rdi
1a24     1a24:	4d 89 3e             	mov    %r15,(%r14)
1a27     1a27:	e8 00 00 00 00       	call   1a2c <shrink_node+0x1a2c>	1a28: R_X86_64_PLT32	__tsan_read4-0x4
1a2c     1a2c:	4c 8b bc 24 98 00 00 00 	mov    0x98(%rsp),%r15
1a34     1a34:	45 8b 37             	mov    (%r15),%r14d
1a37     1a37:	4c 89 ff             	mov    %r15,%rdi
1a3a     1a3a:	44 03 b4 24 a4 01 00 00 	add    0x1a4(%rsp),%r14d
1a42     1a42:	e8 00 00 00 00       	call   1a47 <shrink_node+0x1a47>	1a43: R_X86_64_PLT32	__tsan_read_write4-0x4
1a47     1a47:	45 89 37             	mov    %r14d,(%r15)
1a4a     1a4a:	4c 8b bc 24 90 00 00 00 	mov    0x90(%rsp),%r15
1a52     1a52:	45 8b 37             	mov    (%r15),%r14d
1a55     1a55:	4c 89 ff             	mov    %r15,%rdi
1a58     1a58:	44 03 b4 24 ac 01 00 00 	add    0x1ac(%rsp),%r14d
1a60     1a60:	e8 00 00 00 00       	call   1a65 <shrink_node+0x1a65>	1a61: R_X86_64_PLT32	__tsan_read_write4-0x4
1a65     1a65:	45 89 37             	mov    %r14d,(%r15)
1a68     1a68:	4c 8b b4 24 30 01 00 00 	mov    0x130(%rsp),%r14
1a70     1a70:	4c 89 f7             	mov    %r14,%rdi
1a73     1a73:	41 03 1e             	add    (%r14),%ebx
1a76     1a76:	e8 00 00 00 00       	call   1a7b <shrink_node+0x1a7b>	1a77: R_X86_64_PLT32	__tsan_read_write4-0x4
1a7b     1a7b:	41 89 1e             	mov    %ebx,(%r14)
1a7e     1a7e:	4c 8b b4 24 28 01 00 00 	mov    0x128(%rsp),%r14
1a86     1a86:	41 8b 1e             	mov    (%r14),%ebx
1a89     1a89:	4c 89 f7             	mov    %r14,%rdi
1a8c     1a8c:	03 9c 24 b0 01 00 00 	add    0x1b0(%rsp),%ebx
1a93     1a93:	e8 00 00 00 00       	call   1a98 <shrink_node+0x1a98>	1a94: R_X86_64_PLT32	__tsan_read_write4-0x4
1a98     1a98:	41 89 1e             	mov    %ebx,(%r14)
1a9b     1a9b:	4c 8b b4 24 20 01 00 00 	mov    0x120(%rsp),%r14
1aa3     1aa3:	41 8b 1e             	mov    (%r14),%ebx
1aa6     1aa6:	4c 89 f7             	mov    %r14,%rdi
1aa9     1aa9:	03 9c 24 b4 01 00 00 	add    0x1b4(%rsp),%ebx
1ab0     1ab0:	e8 00 00 00 00       	call   1ab5 <shrink_node+0x1ab5>	1ab1: R_X86_64_PLT32	__tsan_read_write4-0x4
1ab5     1ab5:	41 89 1e             	mov    %ebx,(%r14)
1ab8     1ab8:	4c 8b b4 24 88 00 00 00 	mov    0x88(%rsp),%r14
1ac0     1ac0:	41 8b 1e             	mov    (%r14),%ebx
1ac3     1ac3:	4c 89 f7             	mov    %r14,%rdi
1ac6     1ac6:	44 01 e3             	add    %r12d,%ebx
1ac9     1ac9:	e8 00 00 00 00       	call   1ace <shrink_node+0x1ace>	1aca: R_X86_64_PLT32	__tsan_read_write4-0x4
1ace     1ace:	4d 89 e7             	mov    %r12,%r15
1ad1     1ad1:	4c 8b 24 24          	mov    (%rsp),%r12
1ad5     1ad5:	41 89 1e             	mov    %ebx,(%r14)
1ad8     1ad8:	49 83 fc 02          	cmp    $0x2,%r12
1adc     1adc:	75 3d                	jne    1b1b <shrink_node+0x1b1b>
1ade     1ade:	e8 00 00 00 00       	call   1ae3 <shrink_node+0x1ae3>	1adf: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1ae3     1ae3:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 1aea <shrink_node+0x1aea>	1ae6: R_X86_64_PC32	_ftrace_branch+0x88684
1aea     1aea:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1aed: R_X86_64_32S	_ftrace_branch+0x88688
1af1     1af1:	48 ff c3             	inc    %rbx
1af4     1af4:	e8 00 00 00 00       	call   1af9 <shrink_node+0x1af9>	1af5: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1af9     1af9:	4c 8b b4 24 18 01 00 00 	mov    0x118(%rsp),%r14
1b01     1b01:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 1b08 <shrink_node+0x1b08>	1b04: R_X86_64_PC32	_ftrace_branch+0x88684
1b08     1b08:	41 8b 1e             	mov    (%r14),%ebx
1b0b     1b0b:	4c 89 f7             	mov    %r14,%rdi
1b0e     1b0e:	44 01 fb             	add    %r15d,%ebx
1b11     1b11:	e8 00 00 00 00       	call   1b16 <shrink_node+0x1b16>	1b12: R_X86_64_PLT32	__tsan_read_write4-0x4
1b16     1b16:	41 89 1e             	mov    %ebx,(%r14)
1b19     1b19:	eb 22                	jmp    1b3d <shrink_node+0x1b3d>
1b1b     1b1b:	e8 00 00 00 00       	call   1b20 <shrink_node+0x1b20>	1b1c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1b20     1b20:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 1b27 <shrink_node+0x1b27>	1b23: R_X86_64_PC32	_ftrace_branch+0x8867c
1b27     1b27:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1b2a: R_X86_64_32S	_ftrace_branch+0x88680
1b2e     1b2e:	48 ff c3             	inc    %rbx
1b31     1b31:	e8 00 00 00 00       	call   1b36 <shrink_node+0x1b36>	1b32: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1b36     1b36:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 1b3d <shrink_node+0x1b3d>	1b39: R_X86_64_PC32	_ftrace_branch+0x8867c
1b3d     1b3d:	48 8b 9c 24 38 01 00 00 	mov    0x138(%rsp),%rbx
1b45     1b45:	8a 44 24 50          	mov    0x50(%rsp),%al
1b49     1b49:	48 89 df             	mov    %rbx,%rdi
1b4c     1b4c:	41 88 c5             	mov    %al,%r13b
1b4f     1b4f:	e8 00 00 00 00       	call   1b54 <shrink_node+0x1b54>	1b50: R_X86_64_PLT32	__tsan_read4-0x4
1b54     1b54:	44 8b 33             	mov    (%rbx),%r14d
1b57     1b57:	48 8b 5c 24 28       	mov    0x28(%rsp),%rbx
1b5c     1b5c:	48 89 df             	mov    %rbx,%rdi
1b5f     1b5f:	e8 00 00 00 00       	call   1b64 <shrink_node+0x1b64>	1b60: R_X86_64_PLT32	__tsan_read1-0x4
1b64     1b64:	44 0f be 3b          	movsbl (%rbx),%r15d
1b68     1b68:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
1b6d     1b6d:	e8 00 00 00 00       	call   1b72 <shrink_node+0x1b72>	1b6e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1b72     1b72:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 1b79 <shrink_node+0x1b79>	1b75: R_X86_64_PC32	_ftrace_branch+0x888ac
1b79     1b79:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1b7c: R_X86_64_32S	_ftrace_branch+0x888b0
1b80     1b80:	48 ff c3             	inc    %rbx
1b83     1b83:	e8 00 00 00 00       	call   1b88 <shrink_node+0x1b88>	1b84: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1b88     1b88:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 1b8f <shrink_node+0x1b8f>	1b8b: R_X86_64_PC32	_ftrace_branch+0x888ac
1b8f     1b8f:	65 8b 1d 00 00 00 00 	mov    %gs:0x0(%rip),%ebx        # 1b96 <shrink_node+0x1b96>	1b92: R_X86_64_PC32	pcpu_hot+0x8
1b96     1b96:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1b99: R_X86_64_32S	nr_cpu_ids
1b9d     1b9d:	e8 00 00 00 00       	call   1ba2 <shrink_node+0x1ba2>	1b9e: R_X86_64_PLT32	__tsan_read4-0x4
1ba2     1ba2:	44 8b 3d 00 00 00 00 	mov    0x0(%rip),%r15d        # 1ba9 <shrink_node+0x1ba9>	1ba5: R_X86_64_PC32	nr_cpu_ids-0x4
1ba9     1ba9:	89 de                	mov    %ebx,%esi
1bab     1bab:	44 89 ff             	mov    %r15d,%edi
1bae     1bae:	e8 00 00 00 00       	call   1bb3 <shrink_node+0x1bb3>	1baf: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
1bb3     1bb3:	45 31 f6             	xor    %r14d,%r14d
1bb6     1bb6:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1bb9: R_X86_64_32S	_ftrace_annotated_branch+0x77c70
1bbd     1bbd:	41 39 df             	cmp    %ebx,%r15d
1bc0     1bc0:	41 0f 96 c6          	setbe  %r14b
1bc4     1bc4:	31 d2                	xor    %edx,%edx
1bc6     1bc6:	31 c9                	xor    %ecx,%ecx
1bc8     1bc8:	44 89 f6             	mov    %r14d,%esi
1bcb     1bcb:	e8 00 00 00 00       	call   1bd0 <shrink_node+0x1bd0>	1bcc: R_X86_64_PLT32	ftrace_likely_update-0x4
1bd0     1bd0:	41 39 df             	cmp    %ebx,%r15d
1bd3     1bd3:	77 28                	ja     1bfd <shrink_node+0x1bfd>
1bd5     1bd5:	e8 00 00 00 00       	call   1bda <shrink_node+0x1bda>	1bd6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1bda     1bda:	4c 8b 3d 00 00 00 00 	mov    0x0(%rip),%r15        # 1be1 <shrink_node+0x1be1>	1bdd: R_X86_64_PC32	_ftrace_branch+0x878cc
1be1     1be1:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1be4: R_X86_64_32S	_ftrace_branch+0x878d0
1be8     1be8:	49 ff c7             	inc    %r15
1beb     1beb:	e8 00 00 00 00       	call   1bf0 <shrink_node+0x1bf0>	1bec: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1bf0     1bf0:	4c 89 3d 00 00 00 00 	mov    %r15,0x0(%rip)        # 1bf7 <shrink_node+0x1bf7>	1bf3: R_X86_64_PC32	_ftrace_branch+0x878cc
1bf7     1bf7:	90                   	nop
1bf8     1bf8:	0f 0b                	ud2
1bfa     1bfa:	90                   	nop
1bfb     1bfb:	eb 22                	jmp    1c1f <shrink_node+0x1c1f>
1bfd     1bfd:	e8 00 00 00 00       	call   1c02 <shrink_node+0x1c02>	1bfe: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1c02     1c02:	4c 8b 3d 00 00 00 00 	mov    0x0(%rip),%r15        # 1c09 <shrink_node+0x1c09>	1c05: R_X86_64_PC32	_ftrace_branch+0x878c4
1c09     1c09:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1c0c: R_X86_64_32S	_ftrace_branch+0x878c8
1c10     1c10:	49 ff c7             	inc    %r15
1c13     1c13:	e8 00 00 00 00       	call   1c18 <shrink_node+0x1c18>	1c14: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1c18     1c18:	4c 89 3d 00 00 00 00 	mov    %r15,0x0(%rip)        # 1c1f <shrink_node+0x1c1f>	1c1b: R_X86_64_PC32	_ftrace_branch+0x878c4
1c1f     1c1f:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1c22: R_X86_64_32S	_ftrace_annotated_branch+0x77ca0
1c26     1c26:	44 89 f6             	mov    %r14d,%esi
1c29     1c29:	31 d2                	xor    %edx,%edx
1c2b     1c2b:	31 c9                	xor    %ecx,%ecx
1c2d     1c2d:	e8 00 00 00 00       	call   1c32 <shrink_node+0x1c32>	1c2e: R_X86_64_PLT32	ftrace_likely_update-0x4
1c32     1c32:	41 89 de             	mov    %ebx,%r14d
1c35     1c35:	c1 eb 06             	shr    $0x6,%ebx
1c38     1c38:	be 08 00 00 00       	mov    $0x8,%esi
1c3d     1c3d:	ba 04 00 00 00       	mov    $0x4,%edx
1c42     1c42:	48 8d 3c dd 00 00 00 00 	lea    0x0(,%rbx,8),%rdi	1c46: R_X86_64_32S	__cpu_online_mask
1c4a     1c4a:	e8 00 00 00 00       	call   1c4f <shrink_node+0x1c4f>	1c4b: R_X86_64_PLT32	__kcsan_check_access-0x4
1c4f     1c4f:	31 db                	xor    %ebx,%ebx
1c51     1c51:	bf 02 00 00 00       	mov    $0x2,%edi
1c56     1c56:	4c 0f a3 35 00 00 00 00 	bt     %r14,0x0(%rip)        # 1c5e <shrink_node+0x1c5e>	1c5a: R_X86_64_PC32	__cpu_online_mask-0x4
1c5e     1c5e:	0f 92 c3             	setb   %bl
1c61     1c61:	41 0f 93 c6          	setae  %r14b
1c65     1c65:	89 de                	mov    %ebx,%esi
1c67     1c67:	e8 00 00 00 00       	call   1c6c <shrink_node+0x1c6c>	1c68: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
1c6c     1c6c:	31 ff                	xor    %edi,%edi
1c6e     1c6e:	89 de                	mov    %ebx,%esi
1c70     1c70:	e8 00 00 00 00       	call   1c75 <shrink_node+0x1c75>	1c71: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
1c75     1c75:	45 84 f6             	test   %r14b,%r14b
1c78     1c78:	75 3a                	jne    1cb4 <shrink_node+0x1cb4>
1c7a     1c7a:	e8 00 00 00 00       	call   1c7f <shrink_node+0x1c7f>	1c7b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1c7f     1c7f:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 1c86 <shrink_node+0x1c86>	1c82: R_X86_64_PC32	_ftrace_branch+0x8890c
1c86     1c86:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1c89: R_X86_64_32S	_ftrace_branch+0x88910
1c8d     1c8d:	48 ff c3             	inc    %rbx
1c90     1c90:	e8 00 00 00 00       	call   1c95 <shrink_node+0x1c95>	1c91: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1c95     1c95:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 1c9c <shrink_node+0x1c9c>	1c98: R_X86_64_PC32	_ftrace_branch+0x8890c
1c9c     1c9c:	e8 00 00 00 00       	call   1ca1 <shrink_node+0x1ca1>	1c9d: R_X86_64_PLT32	rcu_is_watching-0x4
1ca1     1ca1:	41 89 c6             	mov    %eax,%r14d
1ca4     1ca4:	84 c0                	test   %al,%al
1ca6     1ca6:	74 33                	je     1cdb <shrink_node+0x1cdb>
1ca8     1ca8:	e8 00 00 00 00       	call   1cad <shrink_node+0x1cad>	1ca9: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1cad     1cad:	31 db                	xor    %ebx,%ebx
1caf     1caf:	45 31 ff             	xor    %r15d,%r15d
1cb2     1cb2:	eb 45                	jmp    1cf9 <shrink_node+0x1cf9>
1cb4     1cb4:	e8 00 00 00 00       	call   1cb9 <shrink_node+0x1cb9>	1cb5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1cb9     1cb9:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 1cc0 <shrink_node+0x1cc0>	1cbc: R_X86_64_PC32	_ftrace_branch+0x88904
1cc0     1cc0:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1cc3: R_X86_64_32S	_ftrace_branch+0x88908
1cc7     1cc7:	48 ff c3             	inc    %rbx
1cca     1cca:	e8 00 00 00 00       	call   1ccf <shrink_node+0x1ccf>	1ccb: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1ccf     1ccf:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 1cd6 <shrink_node+0x1cd6>	1cd2: R_X86_64_PC32	_ftrace_branch+0x88904
1cd6     1cd6:	e9 6a 01 00 00       	jmp    1e45 <shrink_node+0x1e45>
1cdb     1cdb:	e8 00 00 00 00       	call   1ce0 <shrink_node+0x1ce0>	1cdc: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1ce0     1ce0:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1ce3: R_X86_64_32S	.data.once+0x1cf
1ce7     1ce7:	e8 00 00 00 00       	call   1cec <shrink_node+0x1cec>	1ce8: R_X86_64_PLT32	__tsan_read1-0x4
1cec     1cec:	0f b6 1d 00 00 00 00 	movzbl 0x0(%rip),%ebx        # 1cf3 <shrink_node+0x1cf3>	1cef: R_X86_64_PC32	.data.once+0x1cb
1cf3     1cf3:	83 f3 01             	xor    $0x1,%ebx
1cf6     1cf6:	41 89 df             	mov    %ebx,%r15d
1cf9     1cf9:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1cfc: R_X86_64_32S	_ftrace_annotated_branch+0x78780
1d00     1d00:	89 de                	mov    %ebx,%esi
1d02     1d02:	31 d2                	xor    %edx,%edx
1d04     1d04:	31 c9                	xor    %ecx,%ecx
1d06     1d06:	e8 00 00 00 00       	call   1d0b <shrink_node+0x1d0b>	1d07: R_X86_64_PLT32	ftrace_likely_update-0x4
1d0b     1d0b:	45 84 ff             	test   %r15b,%r15b
1d0e     1d0e:	74 37                	je     1d47 <shrink_node+0x1d47>
1d10     1d10:	e8 00 00 00 00       	call   1d15 <shrink_node+0x1d15>	1d11: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1d15     1d15:	4c 8b 25 00 00 00 00 	mov    0x0(%rip),%r12        # 1d1c <shrink_node+0x1d1c>	1d18: R_X86_64_PC32	_ftrace_branch+0x8892c
1d1c     1d1c:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1d1f: R_X86_64_32S	_ftrace_branch+0x88930
1d23     1d23:	49 ff c4             	inc    %r12
1d26     1d26:	e8 00 00 00 00       	call   1d2b <shrink_node+0x1d2b>	1d27: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1d2b     1d2b:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1d2e: R_X86_64_32S	.data.once+0x1cf
1d32     1d32:	4c 89 25 00 00 00 00 	mov    %r12,0x0(%rip)        # 1d39 <shrink_node+0x1d39>	1d35: R_X86_64_PC32	_ftrace_branch+0x8892c
1d39     1d39:	e8 00 00 00 00       	call   1d3e <shrink_node+0x1d3e>	1d3a: R_X86_64_PLT32	__tsan_write1-0x4
1d3e     1d3e:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 1d45 <shrink_node+0x1d45>	1d40: R_X86_64_PC32	.data.once+0x1ca
1d45     1d45:	eb 22                	jmp    1d69 <shrink_node+0x1d69>
1d47     1d47:	e8 00 00 00 00       	call   1d4c <shrink_node+0x1d4c>	1d48: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1d4c     1d4c:	4c 8b 25 00 00 00 00 	mov    0x0(%rip),%r12        # 1d53 <shrink_node+0x1d53>	1d4f: R_X86_64_PC32	_ftrace_branch+0x88924
1d53     1d53:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1d56: R_X86_64_32S	_ftrace_branch+0x88928
1d5a     1d5a:	49 ff c4             	inc    %r12
1d5d     1d5d:	e8 00 00 00 00       	call   1d62 <shrink_node+0x1d62>	1d5e: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1d62     1d62:	4c 89 25 00 00 00 00 	mov    %r12,0x0(%rip)        # 1d69 <shrink_node+0x1d69>	1d65: R_X86_64_PC32	_ftrace_branch+0x88924
1d69     1d69:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1d6c: R_X86_64_32S	_ftrace_annotated_branch+0x787b0
1d70     1d70:	89 de                	mov    %ebx,%esi
1d72     1d72:	31 d2                	xor    %edx,%edx
1d74     1d74:	31 c9                	xor    %ecx,%ecx
1d76     1d76:	e8 00 00 00 00       	call   1d7b <shrink_node+0x1d7b>	1d77: R_X86_64_PLT32	ftrace_likely_update-0x4
1d7b     1d7b:	45 84 ff             	test   %r15b,%r15b
1d7e     1d7e:	4c 8b 24 24          	mov    (%rsp),%r12
1d82     1d82:	0f 84 83 00 00 00    	je     1e0b <shrink_node+0x1e0b>
1d88     1d88:	e8 00 00 00 00       	call   1d8d <shrink_node+0x1d8d>	1d89: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1d8d     1d8d:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 1d94 <shrink_node+0x1d94>	1d90: R_X86_64_PC32	_ftrace_branch+0x8891c
1d94     1d94:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1d97: R_X86_64_32S	_ftrace_branch+0x88920
1d9b     1d9b:	48 ff c3             	inc    %rbx
1d9e     1d9e:	e8 00 00 00 00       	call   1da3 <shrink_node+0x1da3>	1d9f: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1da3     1da3:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1da6: R_X86_64_32S	_ftrace_annotated_branch+0x787e0
1daa     1daa:	be 01 00 00 00       	mov    $0x1,%esi
1daf     1daf:	31 d2                	xor    %edx,%edx
1db1     1db1:	b9 01 00 00 00       	mov    $0x1,%ecx
1db6     1db6:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 1dbd <shrink_node+0x1dbd>	1db9: R_X86_64_PC32	_ftrace_branch+0x8891c
1dbd     1dbd:	e8 00 00 00 00       	call   1dc2 <shrink_node+0x1dc2>	1dbe: R_X86_64_PLT32	ftrace_likely_update-0x4
1dc2     1dc2:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 1dc9 <shrink_node+0x1dc9>	1dc5: R_X86_64_PC32	_ftrace_branch+0x88934
1dc9     1dc9:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1dcc: R_X86_64_32S	_ftrace_branch+0x88938
1dd0     1dd0:	48 ff c3             	inc    %rbx
1dd3     1dd3:	e8 00 00 00 00       	call   1dd8 <shrink_node+0x1dd8>	1dd4: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1dd8     1dd8:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 1ddf <shrink_node+0x1ddf>	1ddb: R_X86_64_PC32	_ftrace_branch+0x88934
1ddf     1ddf:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1de2: R_X86_64_32S	.rodata.str1.1+0x47fbb
1de6     1de6:	90                   	nop
1de7     1de7:	e8 00 00 00 00       	call   1dec <shrink_node+0x1dec>	1de8: R_X86_64_PLT32	__warn_printk-0x4
1dec     1dec:	90                   	nop
1ded     1ded:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1df0: R_X86_64_32S	_ftrace_annotated_branch+0x78810
1df4     1df4:	be 01 00 00 00       	mov    $0x1,%esi
1df9     1df9:	31 d2                	xor    %edx,%edx
1dfb     1dfb:	b9 01 00 00 00       	mov    $0x1,%ecx
1e00     1e00:	0f 0b                	ud2
1e02     1e02:	90                   	nop
1e03     1e03:	90                   	nop
1e04     1e04:	e8 00 00 00 00       	call   1e09 <shrink_node+0x1e09>	1e05: R_X86_64_PLT32	ftrace_likely_update-0x4
1e09     1e09:	eb 22                	jmp    1e2d <shrink_node+0x1e2d>
1e0b     1e0b:	e8 00 00 00 00       	call   1e10 <shrink_node+0x1e10>	1e0c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1e10     1e10:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 1e17 <shrink_node+0x1e17>	1e13: R_X86_64_PC32	_ftrace_branch+0x88914
1e17     1e17:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1e1a: R_X86_64_32S	_ftrace_branch+0x88918
1e1e     1e1e:	48 ff c3             	inc    %rbx
1e21     1e21:	e8 00 00 00 00       	call   1e26 <shrink_node+0x1e26>	1e22: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1e26     1e26:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 1e2d <shrink_node+0x1e2d>	1e29: R_X86_64_PC32	_ftrace_branch+0x88914
1e2d     1e2d:	41 80 f6 01          	xor    $0x1,%r14b
1e31     1e31:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1e34: R_X86_64_32S	_ftrace_annotated_branch+0x78840
1e38     1e38:	31 d2                	xor    %edx,%edx
1e3a     1e3a:	31 c9                	xor    %ecx,%ecx
1e3c     1e3c:	41 0f b6 f6          	movzbl %r14b,%esi
1e40     1e40:	e8 00 00 00 00       	call   1e45 <shrink_node+0x1e45>	1e41: R_X86_64_PLT32	ftrace_likely_update-0x4
1e45     1e45:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
1e4a     1e4a:	48 01 44 24 30       	add    %rax,0x30(%rsp)
1e4f     1e4f:	49 ff c4             	inc    %r12
1e52     1e52:	49 83 fc 04          	cmp    $0x4,%r12
1e56     1e56:	0f 84 7f 03 00 00    	je     21db <shrink_node+0x21db>
1e5c     1e5c:	e8 00 00 00 00       	call   1e61 <shrink_node+0x1e61>	1e5d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1e61     1e61:	e9 6a f1 ff ff       	jmp    fd0 <shrink_node+0xfd0>
1e66     1e66:	e8 00 00 00 00       	call   1e6b <shrink_node+0x1e6b>	1e67: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1e6b     1e6b:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 1e72 <shrink_node+0x1e72>	1e6e: R_X86_64_PC32	_ftrace_branch+0x8863c
1e72     1e72:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1e75: R_X86_64_32S	_ftrace_branch+0x88640
1e79     1e79:	48 ff c3             	inc    %rbx
1e7c     1e7c:	e8 00 00 00 00       	call   1e81 <shrink_node+0x1e81>	1e7d: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1e81     1e81:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 1e88 <shrink_node+0x1e88>	1e84: R_X86_64_PC32	_ftrace_branch+0x8863c
1e88     1e88:	b8 20 00 00 00       	mov    $0x20,%eax
1e8d     1e8d:	eb bb                	jmp    1e4a <shrink_node+0x1e4a>
1e8f     1e8f:	e8 00 00 00 00       	call   1e94 <shrink_node+0x1e94>	1e90: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1e94     1e94:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 1e9b <shrink_node+0x1e9b>	1e97: R_X86_64_PC32	_ftrace_branch+0x886d4
1e9b     1e9b:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1e9e: R_X86_64_32S	_ftrace_branch+0x886d8
1ea2     1ea2:	48 ff c3             	inc    %rbx
1ea5     1ea5:	e8 00 00 00 00       	call   1eaa <shrink_node+0x1eaa>	1ea6: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1eaa     1eaa:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 1eb1 <shrink_node+0x1eb1>	1ead: R_X86_64_PC32	_ftrace_branch+0x886d4
1eb1     1eb1:	e9 c4 f7 ff ff       	jmp    167a <shrink_node+0x167a>
1eb6     1eb6:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 1ebd <shrink_node+0x1ebd>	1eb9: R_X86_64_PC32	_ftrace_branch+0x888b4
1ebd     1ebd:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1ec0: R_X86_64_32S	_ftrace_branch+0x888b8
1ec4     1ec4:	45 89 f4             	mov    %r14d,%r12d
1ec7     1ec7:	4c 89 6c 24 10       	mov    %r13,0x10(%rsp)
1ecc     1ecc:	48 ff c3             	inc    %rbx
1ecf     1ecf:	e8 00 00 00 00       	call   1ed4 <shrink_node+0x1ed4>	1ed0: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1ed4     1ed4:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 1edb <shrink_node+0x1edb>	1ed7: R_X86_64_PC32	_ftrace_branch+0x888b4
1edb     1edb:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1ede: R_X86_64_32S	nr_cpu_ids
1ee2     1ee2:	65 8b 1d 00 00 00 00 	mov    %gs:0x0(%rip),%ebx        # 1ee9 <shrink_node+0x1ee9>	1ee5: R_X86_64_PC32	pcpu_hot+0x8
1ee9     1ee9:	e8 00 00 00 00       	call   1eee <shrink_node+0x1eee>	1eea: R_X86_64_PLT32	__tsan_read4-0x4
1eee     1eee:	44 8b 35 00 00 00 00 	mov    0x0(%rip),%r14d        # 1ef5 <shrink_node+0x1ef5>	1ef1: R_X86_64_PC32	nr_cpu_ids-0x4
1ef5     1ef5:	89 de                	mov    %ebx,%esi
1ef7     1ef7:	44 89 f7             	mov    %r14d,%edi
1efa     1efa:	e8 00 00 00 00       	call   1eff <shrink_node+0x1eff>	1efb: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
1eff     1eff:	45 31 ed             	xor    %r13d,%r13d
1f02     1f02:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1f05: R_X86_64_32S	_ftrace_annotated_branch+0x77c70
1f09     1f09:	41 39 de             	cmp    %ebx,%r14d
1f0c     1f0c:	41 0f 96 c5          	setbe  %r13b
1f10     1f10:	31 d2                	xor    %edx,%edx
1f12     1f12:	31 c9                	xor    %ecx,%ecx
1f14     1f14:	44 89 ee             	mov    %r13d,%esi
1f17     1f17:	e8 00 00 00 00       	call   1f1c <shrink_node+0x1f1c>	1f18: R_X86_64_PLT32	ftrace_likely_update-0x4
1f1c     1f1c:	41 39 de             	cmp    %ebx,%r14d
1f1f     1f1f:	77 28                	ja     1f49 <shrink_node+0x1f49>
1f21     1f21:	e8 00 00 00 00       	call   1f26 <shrink_node+0x1f26>	1f22: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1f26     1f26:	4c 8b 35 00 00 00 00 	mov    0x0(%rip),%r14        # 1f2d <shrink_node+0x1f2d>	1f29: R_X86_64_PC32	_ftrace_branch+0x878cc
1f2d     1f2d:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1f30: R_X86_64_32S	_ftrace_branch+0x878d0
1f34     1f34:	49 ff c6             	inc    %r14
1f37     1f37:	e8 00 00 00 00       	call   1f3c <shrink_node+0x1f3c>	1f38: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1f3c     1f3c:	4c 89 35 00 00 00 00 	mov    %r14,0x0(%rip)        # 1f43 <shrink_node+0x1f43>	1f3f: R_X86_64_PC32	_ftrace_branch+0x878cc
1f43     1f43:	90                   	nop
1f44     1f44:	0f 0b                	ud2
1f46     1f46:	90                   	nop
1f47     1f47:	eb 22                	jmp    1f6b <shrink_node+0x1f6b>
1f49     1f49:	e8 00 00 00 00       	call   1f4e <shrink_node+0x1f4e>	1f4a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1f4e     1f4e:	4c 8b 35 00 00 00 00 	mov    0x0(%rip),%r14        # 1f55 <shrink_node+0x1f55>	1f51: R_X86_64_PC32	_ftrace_branch+0x878c4
1f55     1f55:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1f58: R_X86_64_32S	_ftrace_branch+0x878c8
1f5c     1f5c:	49 ff c6             	inc    %r14
1f5f     1f5f:	e8 00 00 00 00       	call   1f64 <shrink_node+0x1f64>	1f60: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1f64     1f64:	4c 89 35 00 00 00 00 	mov    %r14,0x0(%rip)        # 1f6b <shrink_node+0x1f6b>	1f67: R_X86_64_PC32	_ftrace_branch+0x878c4
1f6b     1f6b:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1f6e: R_X86_64_32S	_ftrace_annotated_branch+0x77ca0
1f72     1f72:	44 89 ee             	mov    %r13d,%esi
1f75     1f75:	31 d2                	xor    %edx,%edx
1f77     1f77:	31 c9                	xor    %ecx,%ecx
1f79     1f79:	e8 00 00 00 00       	call   1f7e <shrink_node+0x1f7e>	1f7a: R_X86_64_PLT32	ftrace_likely_update-0x4
1f7e     1f7e:	41 89 de             	mov    %ebx,%r14d
1f81     1f81:	c1 eb 06             	shr    $0x6,%ebx
1f84     1f84:	be 08 00 00 00       	mov    $0x8,%esi
1f89     1f89:	ba 04 00 00 00       	mov    $0x4,%edx
1f8e     1f8e:	48 8d 3c dd 00 00 00 00 	lea    0x0(,%rbx,8),%rdi	1f92: R_X86_64_32S	__cpu_online_mask
1f96     1f96:	e8 00 00 00 00       	call   1f9b <shrink_node+0x1f9b>	1f97: R_X86_64_PLT32	__kcsan_check_access-0x4
1f9b     1f9b:	31 db                	xor    %ebx,%ebx
1f9d     1f9d:	bf 02 00 00 00       	mov    $0x2,%edi
1fa2     1fa2:	4c 0f a3 35 00 00 00 00 	bt     %r14,0x0(%rip)        # 1faa <shrink_node+0x1faa>	1fa6: R_X86_64_PC32	__cpu_online_mask-0x4
1faa     1faa:	0f 92 c3             	setb   %bl
1fad     1fad:	41 0f 93 c6          	setae  %r14b
1fb1     1fb1:	89 de                	mov    %ebx,%esi
1fb3     1fb3:	e8 00 00 00 00       	call   1fb8 <shrink_node+0x1fb8>	1fb4: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
1fb8     1fb8:	31 ff                	xor    %edi,%edi
1fba     1fba:	89 de                	mov    %ebx,%esi
1fbc     1fbc:	e8 00 00 00 00       	call   1fc1 <shrink_node+0x1fc1>	1fbd: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
1fc1     1fc1:	45 84 f6             	test   %r14b,%r14b
1fc4     1fc4:	0f 85 34 01 00 00    	jne    20fe <shrink_node+0x20fe>
1fca     1fca:	e8 00 00 00 00       	call   1fcf <shrink_node+0x1fcf>	1fcb: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1fcf     1fcf:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 1fd6 <shrink_node+0x1fd6>	1fd2: R_X86_64_PC32	_ftrace_branch+0x888bc
1fd6     1fd6:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1fd9: R_X86_64_32S	_ftrace_branch+0x888c0
1fdd     1fdd:	48 ff c3             	inc    %rbx
1fe0     1fe0:	e8 00 00 00 00       	call   1fe5 <shrink_node+0x1fe5>	1fe1: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1fe5     1fe5:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1fe8: R_X86_64_32S	_ftrace_annotated_branch+0x786c0
1fec     1fec:	31 f6                	xor    %esi,%esi
1fee     1fee:	31 d2                	xor    %edx,%edx
1ff0     1ff0:	b9 01 00 00 00       	mov    $0x1,%ecx
1ff5     1ff5:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 1ffc <shrink_node+0x1ffc>	1ff8: R_X86_64_PC32	_ftrace_branch+0x888bc
1ffc     1ffc:	e8 00 00 00 00       	call   2001 <shrink_node+0x2001>	1ffd: R_X86_64_PLT32	ftrace_likely_update-0x4
2001     2001:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 2008 <shrink_node+0x2008>	2004: R_X86_64_PC32	_ftrace_branch+0x888dc
2008     2008:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	200b: R_X86_64_32S	_ftrace_branch+0x888e0
200f     200f:	48 ff c3             	inc    %rbx
2012     2012:	e8 00 00 00 00       	call   2017 <shrink_node+0x2017>	2013: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
2017     2017:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	201a: R_X86_64_32S	_ftrace_annotated_branch+0x786f0
201e     201e:	31 f6                	xor    %esi,%esi
2020     2020:	31 d2                	xor    %edx,%edx
2022     2022:	b9 01 00 00 00       	mov    $0x1,%ecx
2027     2027:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 202e <shrink_node+0x202e>	202a: R_X86_64_PC32	_ftrace_branch+0x888dc
202e     202e:	e8 00 00 00 00       	call   2033 <shrink_node+0x2033>	202f: R_X86_64_PLT32	ftrace_likely_update-0x4
2033     2033:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 203a <shrink_node+0x203a>	2036: R_X86_64_PC32	_ftrace_branch+0x888d4
203a     203a:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	203d: R_X86_64_32S	_ftrace_branch+0x888d8
2041     2041:	48 ff c3             	inc    %rbx
2044     2044:	e8 00 00 00 00       	call   2049 <shrink_node+0x2049>	2045: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
2049     2049:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	204c: R_X86_64_32S	_ftrace_annotated_branch+0x78720
2050     2050:	31 f6                	xor    %esi,%esi
2052     2052:	31 d2                	xor    %edx,%edx
2054     2054:	b9 01 00 00 00       	mov    $0x1,%ecx
2059     2059:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 2060 <shrink_node+0x2060>	205c: R_X86_64_PC32	_ftrace_branch+0x888d4
2060     2060:	e8 00 00 00 00       	call   2065 <shrink_node+0x2065>	2061: R_X86_64_PLT32	ftrace_likely_update-0x4
2065     2065:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 206c <shrink_node+0x206c>	2068: R_X86_64_PC32	_ftrace_branch+0x888cc
206c     206c:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	206f: R_X86_64_32S	_ftrace_branch+0x888d0
2073     2073:	48 ff c3             	inc    %rbx
2076     2076:	e8 00 00 00 00       	call   207b <shrink_node+0x207b>	2077: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
207b     207b:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 2082 <shrink_node+0x2082>	207e: R_X86_64_PC32	_ftrace_branch+0x888cc
2082     2082:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2085: R_X86_64_32S	__tracepoint_mm_vmscan_lru_shrink_inactive+0x48
2089     2089:	65 ff 05 00 00 00 00 	incl   %gs:0x0(%rip)        # 2090 <shrink_node+0x2090>	208c: R_X86_64_PC32	pcpu_hot+0x4
2090     2090:	e8 00 00 00 00       	call   2095 <shrink_node+0x2095>	2091: R_X86_64_PLT32	__tsan_volatile_read8-0x4
2095     2095:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 209c <shrink_node+0x209c>	2098: R_X86_64_PC32	__tracepoint_mm_vmscan_lru_shrink_inactive+0x44
209c     209c:	48 85 db             	test   %rbx,%rbx
209f     209f:	0f 84 84 00 00 00    	je     2129 <shrink_node+0x2129>
20a5     20a5:	e8 00 00 00 00       	call   20aa <shrink_node+0x20aa>	20a6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
20aa     20aa:	4c 8b 35 00 00 00 00 	mov    0x0(%rip),%r14        # 20b1 <shrink_node+0x20b1>	20ad: R_X86_64_PC32	_ftrace_branch+0x888ec
20b1     20b1:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	20b4: R_X86_64_32S	_ftrace_branch+0x888f0
20b8     20b8:	49 ff c6             	inc    %r14
20bb     20bb:	e8 00 00 00 00       	call   20c0 <shrink_node+0x20c0>	20bc: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
20c0     20c0:	48 8d 7b 08          	lea    0x8(%rbx),%rdi
20c4     20c4:	4c 89 35 00 00 00 00 	mov    %r14,0x0(%rip)        # 20cb <shrink_node+0x20cb>	20c7: R_X86_64_PC32	_ftrace_branch+0x888ec
20cb     20cb:	e8 00 00 00 00       	call   20d0 <shrink_node+0x20d0>	20cc: R_X86_64_PLT32	__tsan_read8-0x4
20d0     20d0:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
20d5     20d5:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
20d9     20d9:	44 89 e6             	mov    %r12d,%esi
20dc     20dc:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
20e1     20e1:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
20e6     20e6:	4c 8d 84 24 a4 01 00 00 	lea    0x1a4(%rsp),%r8
20ee     20ee:	45 89 f9             	mov    %r15d,%r9d
20f1     20f1:	50                   	push   %rax
20f2     20f2:	e8 00 00 00 00       	call   20f7 <shrink_node+0x20f7>	20f3: R_X86_64_PLT32	__SCT__tp_func_mm_vmscan_lru_shrink_inactive-0x4
20f7     20f7:	48 8d 64 24 08       	lea    0x8(%rsp),%rsp
20fc     20fc:	eb 4d                	jmp    214b <shrink_node+0x214b>
20fe     20fe:	e8 00 00 00 00       	call   2103 <shrink_node+0x2103>	20ff: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2103     2103:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 210a <shrink_node+0x210a>	2106: R_X86_64_PC32	_ftrace_branch+0x888c4
210a     210a:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	210d: R_X86_64_32S	_ftrace_branch+0x888c8
2111     2111:	48 ff c3             	inc    %rbx
2114     2114:	e8 00 00 00 00       	call   2119 <shrink_node+0x2119>	2115: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
2119     2119:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 2120 <shrink_node+0x2120>	211c: R_X86_64_PC32	_ftrace_branch+0x888c4
2120     2120:	4c 8b 24 24          	mov    (%rsp),%r12
2124     2124:	e9 1c fd ff ff       	jmp    1e45 <shrink_node+0x1e45>
2129     2129:	e8 00 00 00 00       	call   212e <shrink_node+0x212e>	212a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
212e     212e:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 2135 <shrink_node+0x2135>	2131: R_X86_64_PC32	_ftrace_branch+0x888e4
2135     2135:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2138: R_X86_64_32S	_ftrace_branch+0x888e8
213c     213c:	48 ff c3             	inc    %rbx
213f     213f:	e8 00 00 00 00       	call   2144 <shrink_node+0x2144>	2140: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
2144     2144:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 214b <shrink_node+0x214b>	2147: R_X86_64_PC32	_ftrace_branch+0x888e4
214b     214b:	31 db                	xor    %ebx,%ebx
214d     214d:	bf 02 00 00 00       	mov    $0x2,%edi
2152     2152:	65 ff 0d 00 00 00 00 	decl   %gs:0x0(%rip)        # 2159 <shrink_node+0x2159>	2155: R_X86_64_PC32	pcpu_hot+0x4
2159     2159:	0f 94 c3             	sete   %bl
215c     215c:	41 0f 94 c6          	sete   %r14b
2160     2160:	89 de                	mov    %ebx,%esi
2162     2162:	e8 00 00 00 00       	call   2167 <shrink_node+0x2167>	2163: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
2167     2167:	31 ff                	xor    %edi,%edi
2169     2169:	89 de                	mov    %ebx,%esi
216b     216b:	e8 00 00 00 00       	call   2170 <shrink_node+0x2170>	216c: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
2170     2170:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2173: R_X86_64_32S	_ftrace_annotated_branch+0x78750
2177     2177:	89 de                	mov    %ebx,%esi
2179     2179:	31 d2                	xor    %edx,%edx
217b     217b:	31 c9                	xor    %ecx,%ecx
217d     217d:	e8 00 00 00 00       	call   2182 <shrink_node+0x2182>	217e: R_X86_64_PLT32	ftrace_likely_update-0x4
2182     2182:	45 84 f6             	test   %r14b,%r14b
2185     2185:	74 29                	je     21b0 <shrink_node+0x21b0>
2187     2187:	e8 00 00 00 00       	call   218c <shrink_node+0x218c>	2188: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
218c     218c:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 2193 <shrink_node+0x2193>	218f: R_X86_64_PC32	_ftrace_branch+0x888fc
2193     2193:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2196: R_X86_64_32S	_ftrace_branch+0x88900
219a     219a:	48 ff c3             	inc    %rbx
219d     219d:	e8 00 00 00 00       	call   21a2 <shrink_node+0x21a2>	219e: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
21a2     21a2:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 21a9 <shrink_node+0x21a9>	21a5: R_X86_64_PC32	_ftrace_branch+0x888fc
21a9     21a9:	e8 00 00 00 00       	call   21ae <shrink_node+0x21ae>	21aa: R_X86_64_PLT32	__SCT__preempt_schedule_notrace-0x4
21ae     21ae:	eb 22                	jmp    21d2 <shrink_node+0x21d2>
21b0     21b0:	e8 00 00 00 00       	call   21b5 <shrink_node+0x21b5>	21b1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
21b5     21b5:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 21bc <shrink_node+0x21bc>	21b8: R_X86_64_PC32	_ftrace_branch+0x888f4
21bc     21bc:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	21bf: R_X86_64_32S	_ftrace_branch+0x888f8
21c3     21c3:	48 ff c3             	inc    %rbx
21c6     21c6:	e8 00 00 00 00       	call   21cb <shrink_node+0x21cb>	21c7: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
21cb     21cb:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 21d2 <shrink_node+0x21d2>	21ce: R_X86_64_PC32	_ftrace_branch+0x888f4
21d2     21d2:	4c 8b 24 24          	mov    (%rsp),%r12
21d6     21d6:	e9 b4 f9 ff ff       	jmp    1b8f <shrink_node+0x1b8f>
21db     21db:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	21de: R_X86_64_32S	.rodata.str1.1+0x19bacf
21e2     21e2:	be 3c 16 00 00       	mov    $0x163c,%esi
21e7     21e7:	31 d2                	xor    %edx,%edx
21e9     21e9:	e8 00 00 00 00       	call   21ee <shrink_node+0x21ee>	21ea: R_X86_64_PLT32	__might_resched-0x4
21ee     21ee:	e8 00 00 00 00       	call   21f3 <shrink_node+0x21f3>	21ef: R_X86_64_PLT32	__SCT__cond_resched-0x4
21f3     21f3:	4c 8b 74 24 30       	mov    0x30(%rsp),%r14
21f8     21f8:	48 8b 9c 24 88 01 00 00 	mov    0x188(%rsp),%rbx
2200     2200:	4c 89 f7             	mov    %r14,%rdi
2203     2203:	48 89 de             	mov    %rbx,%rsi
2206     2206:	e8 00 00 00 00       	call   220b <shrink_node+0x220b>	2207: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
220b     220b:	49 39 de             	cmp    %rbx,%r14
220e     220e:	0f 92 c0             	setb   %al
2211     2211:	0a 84 24 84 00 00 00 	or     0x84(%rsp),%al
2218     2218:	3c 01                	cmp    $0x1,%al
221a     221a:	75 27                	jne    2243 <shrink_node+0x2243>
221c     221c:	e8 00 00 00 00       	call   2221 <shrink_node+0x2221>	221d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2221     2221:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 2228 <shrink_node+0x2228>	2224: R_X86_64_PC32	_ftrace_branch+0x88544
2228     2228:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	222b: R_X86_64_32S	_ftrace_branch+0x88548
222f     222f:	48 ff c3             	inc    %rbx
2232     2232:	e8 00 00 00 00       	call   2237 <shrink_node+0x2237>	2233: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
2237     2237:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 223e <shrink_node+0x223e>	223a: R_X86_64_PC32	_ftrace_branch+0x88544
223e     223e:	e9 2e ed ff ff       	jmp    f71 <shrink_node+0xf71>
2243     2243:	e8 00 00 00 00       	call   2248 <shrink_node+0x2248>	2244: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2248     2248:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 224f <shrink_node+0x224f>	224b: R_X86_64_PC32	_ftrace_branch+0x8853c
224f     224f:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2252: R_X86_64_32S	_ftrace_branch+0x88540
2256     2256:	48 ff c3             	inc    %rbx
2259     2259:	e8 00 00 00 00       	call   225e <shrink_node+0x225e>	225a: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
225e     225e:	4c 8b b4 24 c8 00 00 00 	mov    0xc8(%rsp),%r14
2266     2266:	4c 8b bc 24 c0 00 00 00 	mov    0xc0(%rsp),%r15
226e     226e:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 2275 <shrink_node+0x2275>	2271: R_X86_64_PC32	_ftrace_branch+0x8853c
2275     2275:	48 8b 9c 24 b8 00 00 00 	mov    0xb8(%rsp),%rbx
227d     227d:	31 ff                	xor    %edi,%edi
227f     227f:	4b 8d 34 3e          	lea    (%r14,%r15,1),%rsi
2283     2283:	48 03 9c 24 b0 00 00 00 	add    0xb0(%rsp),%rbx
228b     228b:	e8 00 00 00 00       	call   2290 <shrink_node+0x2290>	228c: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
2290     2290:	31 ff                	xor    %edi,%edi
2292     2292:	48 89 de             	mov    %rbx,%rsi
2295     2295:	e8 00 00 00 00       	call   229a <shrink_node+0x229a>	2296: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
229a     229a:	4d 01 fe             	add    %r15,%r14
229d     229d:	0f 84 7e 01 00 00    	je     2421 <shrink_node+0x2421>
22a3     22a3:	48 85 db             	test   %rbx,%rbx
22a6     22a6:	0f 84 75 01 00 00    	je     2421 <shrink_node+0x2421>
22ac     22ac:	e8 00 00 00 00       	call   22b1 <shrink_node+0x22b1>	22ad: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
22b1     22b1:	4c 8b 3d 00 00 00 00 	mov    0x0(%rip),%r15        # 22b8 <shrink_node+0x22b8>	22b4: R_X86_64_PC32	_ftrace_branch+0x8854c
22b8     22b8:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	22bb: R_X86_64_32S	_ftrace_branch+0x88550
22bf     22bf:	49 ff c7             	inc    %r15
22c2     22c2:	e8 00 00 00 00       	call   22c7 <shrink_node+0x22c7>	22c3: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
22c7     22c7:	4c 89 f7             	mov    %r14,%rdi
22ca     22ca:	48 89 de             	mov    %rbx,%rsi
22cd     22cd:	4c 89 3d 00 00 00 00 	mov    %r15,0x0(%rip)        # 22d4 <shrink_node+0x22d4>	22d0: R_X86_64_PC32	_ftrace_branch+0x8854c
22d4     22d4:	e8 00 00 00 00       	call   22d9 <shrink_node+0x22d9>	22d5: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
22d9     22d9:	49 39 de             	cmp    %rbx,%r14
22dc     22dc:	76 3d                	jbe    231b <shrink_node+0x231b>
22de     22de:	e8 00 00 00 00       	call   22e3 <shrink_node+0x22e3>	22df: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
22e3     22e3:	4c 8b 35 00 00 00 00 	mov    0x0(%rip),%r14        # 22ea <shrink_node+0x22ea>	22e6: R_X86_64_PC32	_ftrace_branch+0x88564
22ea     22ea:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	22ed: R_X86_64_32S	_ftrace_branch+0x88568
22f1     22f1:	49 ff c6             	inc    %r14
22f4     22f4:	e8 00 00 00 00       	call   22f9 <shrink_node+0x22f9>	22f5: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
22f9     22f9:	4c 89 35 00 00 00 00 	mov    %r14,0x0(%rip)        # 2300 <shrink_node+0x2300>	22fc: R_X86_64_PC32	_ftrace_branch+0x88564
2300     2300:	45 31 ed             	xor    %r13d,%r13d
2303     2303:	41 be 02 00 00 00    	mov    $0x2,%r14d
2309     2309:	4c 8b a4 24 d0 01 00 00 	mov    0x1d0(%rsp),%r12
2311     2311:	4c 8d bc 24 d8 01 00 00 	lea    0x1d8(%rsp),%r15
2319     2319:	eb 3e                	jmp    2359 <shrink_node+0x2359>
231b     231b:	e8 00 00 00 00       	call   2320 <shrink_node+0x2320>	231c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2320     2320:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 2327 <shrink_node+0x2327>	2323: R_X86_64_PC32	_ftrace_branch+0x8855c
2327     2327:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	232a: R_X86_64_32S	_ftrace_branch+0x88560
232e     232e:	48 ff c3             	inc    %rbx
2331     2331:	e8 00 00 00 00       	call   2336 <shrink_node+0x2336>	2332: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
2336     2336:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 233d <shrink_node+0x233d>	2339: R_X86_64_PC32	_ftrace_branch+0x8855c
233d     233d:	4c 89 f3             	mov    %r14,%rbx
2340     2340:	41 bd 02 00 00 00    	mov    $0x2,%r13d
2346     2346:	4c 8b a4 24 e0 01 00 00 	mov    0x1e0(%rsp),%r12
234e     234e:	4c 8d bc 24 e8 01 00 00 	lea    0x1e8(%rsp),%r15
2356     2356:	45 31 f6             	xor    %r14d,%r14d
2359     2359:	4c 89 ff             	mov    %r15,%rdi
235c     235c:	e8 00 00 00 00       	call   2361 <shrink_node+0x2361>	235d: R_X86_64_PLT32	__tsan_read8-0x4
2361     2361:	48 6b c3 64          	imul   $0x64,%rbx,%rax
2365     2365:	49 8b 0f             	mov    (%r15),%rcx
2368     2368:	31 d2                	xor    %edx,%edx
236a     236a:	42 8d 34 f5 00 00 00 00 	lea    0x0(,%r14,8),%esi
2372     2372:	45 31 c9             	xor    %r9d,%r9d
2375     2375:	46 8d 04 ed 08 00 00 00 	lea    0x8(,%r13,8),%r8d
237d     237d:	49 ba c3 f5 28 5c 8f c2 f5 28 	movabs $0x28f5c28f5c28f5c3,%r10
2387     2387:	49 8d 4c 0c 01       	lea    0x1(%r12,%rcx,1),%rcx
238c     238c:	48 f7 f1             	div    %rcx
238f     238f:	b9 64 00 00 00       	mov    $0x64,%ecx
2394     2394:	48 8b 94 34 d0 01 00 00 	mov    0x1d0(%rsp,%rsi,1),%rdx
239c     239c:	48 89 d7             	mov    %rdx,%rdi
239f     239f:	48 29 c1             	sub    %rax,%rcx
23a2     23a2:	42 8d 04 ed 00 00 00 00 	lea    0x0(,%r13,8),%eax
23aa     23aa:	48 0f af d1          	imul   %rcx,%rdx
23ae     23ae:	4c 89 8c 04 b0 00 00 00 	mov    %r9,0xb0(%rsp,%rax,1)
23b6     23b6:	4e 89 8c 04 b0 00 00 00 	mov    %r9,0xb0(%rsp,%r8,1)
23be     23be:	48 2b bc 34 b0 00 00 00 	sub    0xb0(%rsp,%rsi,1),%rdi
23c6     23c6:	48 c1 ea 02          	shr    $0x2,%rdx
23ca     23ca:	48 89 d0             	mov    %rdx,%rax
23cd     23cd:	49 f7 e2             	mul    %r10
23d0     23d0:	48 c1 ea 02          	shr    $0x2,%rdx
23d4     23d4:	48 29 fa             	sub    %rdi,%rdx
23d7     23d7:	42 8d 3c f5 08 00 00 00 	lea    0x8(,%r14,8),%edi
23df     23df:	4c 8b 84 3c d0 01 00 00 	mov    0x1d0(%rsp,%rdi,1),%r8
23e7     23e7:	49 0f 42 d1          	cmovb  %r9,%rdx
23eb     23eb:	49 0f af c8          	imul   %r8,%rcx
23ef     23ef:	48 89 94 34 b0 00 00 00 	mov    %rdx,0xb0(%rsp,%rsi,1)
23f7     23f7:	4c 2b 84 3c b0 00 00 00 	sub    0xb0(%rsp,%rdi,1),%r8
23ff     23ff:	48 c1 e9 02          	shr    $0x2,%rcx
2403     2403:	48 89 c8             	mov    %rcx,%rax
2406     2406:	49 f7 e2             	mul    %r10
2409     2409:	48 c1 ea 02          	shr    $0x2,%rdx
240d     240d:	4c 29 c2             	sub    %r8,%rdx
2410     2410:	49 0f 42 d1          	cmovb  %r9,%rdx
2414     2414:	48 89 94 3c b0 00 00 00 	mov    %rdx,0xb0(%rsp,%rdi,1)
241c     241c:	e9 50 eb ff ff       	jmp    f71 <shrink_node+0xf71>
2421     2421:	e8 00 00 00 00       	call   2426 <shrink_node+0x2426>	2422: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2426     2426:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 242d <shrink_node+0x242d>	2429: R_X86_64_PC32	_ftrace_branch+0x88554
242d     242d:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2430: R_X86_64_32S	_ftrace_branch+0x88558
2434     2434:	48 ff c3             	inc    %rbx
2437     2437:	e8 00 00 00 00       	call   243c <shrink_node+0x243c>	2438: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
243c     243c:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 2443 <shrink_node+0x2443>	243f: R_X86_64_PC32	_ftrace_branch+0x88554
2443     2443:	eb 05                	jmp    244a <shrink_node+0x244a>
2445     2445:	e8 00 00 00 00       	call   244a <shrink_node+0x244a>	2446: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
244a     244a:	48 8d bc 24 00 02 00 00 	lea    0x200(%rsp),%rdi
2452     2452:	48 8b 5c 24 60       	mov    0x60(%rsp),%rbx
2457     2457:	e8 00 00 00 00       	call   245c <shrink_node+0x245c>	2458: R_X86_64_PLT32	blk_finish_plug-0x4
245c     245c:	4c 8b 74 24 30       	mov    0x30(%rsp),%r14
2461     2461:	48 89 df             	mov    %rbx,%rdi
2464     2464:	4c 03 33             	add    (%rbx),%r14
2467     2467:	e8 00 00 00 00       	call   246c <shrink_node+0x246c>	2468: R_X86_64_PLT32	__tsan_read_write8-0x4
246c     246c:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	246f: R_X86_64_32S	total_swap_pages
2473     2473:	4c 89 33             	mov    %r14,(%rbx)
2476     2476:	e8 00 00 00 00       	call   247b <shrink_node+0x247b>	2477: R_X86_64_PLT32	__tsan_read8-0x4
247b     247b:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 2482 <shrink_node+0x2482>	247e: R_X86_64_PC32	total_swap_pages-0x4
2482     2482:	31 ff                	xor    %edi,%edi
2484     2484:	48 89 de             	mov    %rbx,%rsi
2487     2487:	e8 00 00 00 00       	call   248c <shrink_node+0x248c>	2488: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
248c     248c:	48 85 db             	test   %rbx,%rbx
248f     248f:	7e 6a                	jle    24fb <shrink_node+0x24fb>
2491     2491:	e8 00 00 00 00       	call   2496 <shrink_node+0x2496>	2492: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2496     2496:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 249d <shrink_node+0x249d>	2499: R_X86_64_PC32	_ftrace_branch+0x88944
249d     249d:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	24a0: R_X86_64_32S	_ftrace_branch+0x88948
24a4     24a4:	48 ff c3             	inc    %rbx
24a7     24a7:	e8 00 00 00 00       	call   24ac <shrink_node+0x24ac>	24a8: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
24ac     24ac:	31 ff                	xor    %edi,%edi
24ae     24ae:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 24b5 <shrink_node+0x24b5>	24b1: R_X86_64_PC32	_ftrace_branch+0x88944
24b5     24b5:	e8 00 00 00 00       	call   24ba <shrink_node+0x24ba>	24b6: R_X86_64_PLT32	.text.inactive_is_low-0x4
24ba     24ba:	84 c0                	test   %al,%al
24bc     24bc:	74 61                	je     251f <shrink_node+0x251f>
24be     24be:	e8 00 00 00 00       	call   24c3 <shrink_node+0x24c3>	24bf: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
24c3     24c3:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 24ca <shrink_node+0x24ca>	24c6: R_X86_64_PC32	_ftrace_branch+0x88574
24ca     24ca:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	24cd: R_X86_64_32S	_ftrace_branch+0x88578
24d1     24d1:	48 ff c3             	inc    %rbx
24d4     24d4:	e8 00 00 00 00       	call   24d9 <shrink_node+0x24d9>	24d5: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
24d9     24d9:	bf 20 00 00 00       	mov    $0x20,%edi
24de     24de:	48 8b 74 24 70       	mov    0x70(%rsp),%rsi
24e3     24e3:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
24e8     24e8:	b9 01 00 00 00       	mov    $0x1,%ecx
24ed     24ed:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 24f4 <shrink_node+0x24f4>	24f0: R_X86_64_PC32	_ftrace_branch+0x88574
24f4     24f4:	e8 00 00 00 00       	call   24f9 <shrink_node+0x24f9>	24f5: R_X86_64_PLT32	.text.shrink_active_list-0x4
24f9     24f9:	eb 46                	jmp    2541 <shrink_node+0x2541>
24fb     24fb:	e8 00 00 00 00       	call   2500 <shrink_node+0x2500>	24fc: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2500     2500:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 2507 <shrink_node+0x2507>	2503: R_X86_64_PC32	_ftrace_branch+0x8893c
2507     2507:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	250a: R_X86_64_32S	_ftrace_branch+0x88940
250e     250e:	48 ff c3             	inc    %rbx
2511     2511:	e8 00 00 00 00       	call   2516 <shrink_node+0x2516>	2512: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
2516     2516:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 251d <shrink_node+0x251d>	2519: R_X86_64_PC32	_ftrace_branch+0x8893c
251d     251d:	eb 05                	jmp    2524 <shrink_node+0x2524>
251f     251f:	e8 00 00 00 00       	call   2524 <shrink_node+0x2524>	2520: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2524     2524:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 252b <shrink_node+0x252b>	2527: R_X86_64_PC32	_ftrace_branch+0x8856c
252b     252b:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	252e: R_X86_64_32S	_ftrace_branch+0x88570
2532     2532:	48 ff c3             	inc    %rbx
2535     2535:	e8 00 00 00 00       	call   253a <shrink_node+0x253a>	2536: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
253a     253a:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 2541 <shrink_node+0x2541>	253d: R_X86_64_PC32	_ftrace_branch+0x8856c
2541     2541:	48 8b bc 24 a8 00 00 00 	mov    0xa8(%rsp),%rdi
2549     2549:	e8 00 00 00 00       	call   254e <shrink_node+0x254e>	254a: R_X86_64_PLT32	__tsan_read4-0x4
254e     254e:	4c 8b b4 24 38 01 00 00 	mov    0x138(%rsp),%r14
2556     2556:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
255b     255b:	4c 89 f7             	mov    %r14,%rdi
255e     255e:	41 8b 5c 24 30       	mov    0x30(%r12),%ebx
2563     2563:	e8 00 00 00 00       	call   2568 <shrink_node+0x2568>	2564: R_X86_64_PLT32	__tsan_read4-0x4
2568     2568:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
256d     256d:	45 8b 36             	mov    (%r14),%r14d
2570     2570:	e8 00 00 00 00       	call   2575 <shrink_node+0x2575>	2571: R_X86_64_PLT32	__tsan_read1-0x4
2575     2575:	41 0f be 4c 24 2c    	movsbl 0x2c(%r12),%ecx
257b     257b:	89 df                	mov    %ebx,%edi
257d     257d:	44 89 f6             	mov    %r14d,%esi
2580     2580:	31 d2                	xor    %edx,%edx
2582     2582:	e8 00 00 00 00       	call   2587 <shrink_node+0x2587>	2583: R_X86_64_PLT32	shrink_slab-0x4
2587     2587:	45 0f b6 74 24 2a    	movzbl 0x2a(%r12),%r14d
258d     258d:	41 0f b7 44 24 28    	movzwl 0x28(%r12),%eax
2593     2593:	41 c1 e6 10          	shl    $0x10,%r14d
2597     2597:	41 09 c6             	or     %eax,%r14d
259a     259a:	e8 00 00 00 00       	call   259f <shrink_node+0x259f>	259b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
259f     259f:	41 81 e6 00 02 00 00 	and    $0x200,%r14d
25a6     25a6:	48 c7 c3 00 00 00 00 	mov    $0x0,%rbx	25a9: R_X86_64_32S	_ftrace_branch+0x88518
25ad     25ad:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	25b0: R_X86_64_32S	_ftrace_branch+0x88520
25b4     25b4:	48 0f 44 d8          	cmove  %rax,%rbx
25b8     25b8:	4c 8b 3b             	mov    (%rbx),%r15
25bb     25bb:	48 89 df             	mov    %rbx,%rdi
25be     25be:	49 ff c7             	inc    %r15
25c1     25c1:	e8 00 00 00 00       	call   25c6 <shrink_node+0x25c6>	25c2: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
25c6     25c6:	4c 8b ac 24 78 01 00 00 	mov    0x178(%rsp),%r13
25ce     25ce:	4c 89 3b             	mov    %r15,(%rbx)
25d1     25d1:	49 81 c5 70 19 00 00 	add    $0x1970,%r13
25d8     25d8:	4c 89 ef             	mov    %r13,%rdi
25db     25db:	e8 00 00 00 00       	call   25e0 <shrink_node+0x25e0>	25dc: R_X86_64_PLT32	__tsan_read8-0x4
25e0     25e0:	48 8b 44 24 78       	mov    0x78(%rsp),%rax
25e5     25e5:	48 8b 98 70 19 00 00 	mov    0x1970(%rax),%rbx
25ec     25ec:	48 85 db             	test   %rbx,%rbx
25ef     25ef:	74 6e                	je     265f <shrink_node+0x265f>
25f1     25f1:	e8 00 00 00 00       	call   25f6 <shrink_node+0x25f6>	25f2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
25f6     25f6:	4c 8b 35 00 00 00 00 	mov    0x0(%rip),%r14        # 25fd <shrink_node+0x25fd>	25f9: R_X86_64_PC32	_ftrace_branch+0x88a4c
25fd     25fd:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2600: R_X86_64_32S	_ftrace_branch+0x88a50
2604     2604:	49 ff c6             	inc    %r14
2607     2607:	e8 00 00 00 00       	call   260c <shrink_node+0x260c>	2608: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
260c     260c:	48 89 df             	mov    %rbx,%rdi
260f     260f:	4c 89 35 00 00 00 00 	mov    %r14,0x0(%rip)        # 2616 <shrink_node+0x2616>	2612: R_X86_64_PC32	_ftrace_branch+0x88a4c
2616     2616:	e8 00 00 00 00       	call   261b <shrink_node+0x261b>	2617: R_X86_64_PLT32	__tsan_read8-0x4
261b     261b:	4c 8b 7c 24 60       	mov    0x60(%rsp),%r15
2620     2620:	4d 8b 74 24 40       	mov    0x40(%r12),%r14
2625     2625:	4c 89 ff             	mov    %r15,%rdi
2628     2628:	4c 03 33             	add    (%rbx),%r14
262b     262b:	e8 00 00 00 00       	call   2630 <shrink_node+0x2630>	262c: R_X86_64_PLT32	__tsan_read_write8-0x4
2630     2630:	4c 89 ef             	mov    %r13,%rdi
2633     2633:	4d 89 74 24 40       	mov    %r14,0x40(%r12)
2638     2638:	e8 00 00 00 00       	call   263d <shrink_node+0x263d>	2639: R_X86_64_PLT32	__tsan_read8-0x4
263d     263d:	49 8b 5d 00          	mov    0x0(%r13),%rbx
2641     2641:	48 89 df             	mov    %rbx,%rdi
2644     2644:	e8 00 00 00 00       	call   2649 <shrink_node+0x2649>	2645: R_X86_64_PLT32	__tsan_write8-0x4
2649     2649:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
2650     2650:	45 0f b7 74 24 28    	movzwl 0x28(%r12),%r14d
2656     2656:	41 81 e6 00 02 00 00 	and    $0x200,%r14d
265d     265d:	eb 27                	jmp    2686 <shrink_node+0x2686>
265f     265f:	e8 00 00 00 00       	call   2664 <shrink_node+0x2664>	2660: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2664     2664:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 266b <shrink_node+0x266b>	2667: R_X86_64_PC32	_ftrace_branch+0x88a44
266b     266b:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	266e: R_X86_64_32S	_ftrace_branch+0x88a48
2672     2672:	48 ff c3             	inc    %rbx
2675     2675:	e8 00 00 00 00       	call   267a <shrink_node+0x267a>	2676: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
267a     267a:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 2681 <shrink_node+0x2681>	267d: R_X86_64_PC32	_ftrace_branch+0x88a44
2681     2681:	4c 8b 7c 24 60       	mov    0x60(%rsp),%r15
2686     2686:	4c 89 ff             	mov    %r15,%rdi
2689     2689:	4c 8b a4 24 f0 00 00 00 	mov    0xf0(%rsp),%r12
2691     2691:	e8 00 00 00 00       	call   2696 <shrink_node+0x2696>	2692: R_X86_64_PLT32	__tsan_read8-0x4
2696     2696:	49 8b 1f             	mov    (%r15),%rbx
2699     2699:	e8 00 00 00 00       	call   269e <shrink_node+0x269e>	269a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
269e     269e:	45 85 f6             	test   %r14d,%r14d
26a1     26a1:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	26a4: R_X86_64_32S	_ftrace_branch+0x883c0
26a8     26a8:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	26ab: R_X86_64_32S	_ftrace_branch+0x883c8
26af     26af:	4c 0f 44 f0          	cmove  %rax,%r14
26b3     26b3:	4d 8b 3e             	mov    (%r14),%r15
26b6     26b6:	4c 89 f7             	mov    %r14,%rdi
26b9     26b9:	49 ff c7             	inc    %r15
26bc     26bc:	e8 00 00 00 00       	call   26c1 <shrink_node+0x26c1>	26bd: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
26c1     26c1:	4d 89 3e             	mov    %r15,(%r14)
26c4     26c4:	4c 8b b4 24 08 01 00 00 	mov    0x108(%rsp),%r14
26cc     26cc:	48 89 df             	mov    %rbx,%rdi
26cf     26cf:	4c 89 f6             	mov    %r14,%rsi
26d2     26d2:	e8 00 00 00 00       	call   26d7 <shrink_node+0x26d7>	26d3: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
26d7     26d7:	4c 39 f3             	cmp    %r14,%rbx
26da     26da:	75 0e                	jne    26ea <shrink_node+0x26ea>
26dc     26dc:	e8 00 00 00 00       	call   26e1 <shrink_node+0x26e1>	26dd: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
26e1     26e1:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	26e4: R_X86_64_32S	_ftrace_branch+0x883d0
26e8     26e8:	eb 16                	jmp    2700 <shrink_node+0x2700>
26ea     26ea:	e8 00 00 00 00       	call   26ef <shrink_node+0x26ef>	26eb: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
26ef     26ef:	b0 01                	mov    $0x1,%al
26f1     26f1:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	26f4: R_X86_64_32S	_ftrace_branch+0x883d8
26f8     26f8:	48 89 84 24 e8 00 00 00 	mov    %rax,0xe8(%rsp)
2700     2700:	4d 8b 3e             	mov    (%r14),%r15
2703     2703:	4c 89 f7             	mov    %r14,%rdi
2706     2706:	49 ff c7             	inc    %r15
2709     2709:	e8 00 00 00 00       	call   270e <shrink_node+0x270e>	270a: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
270e     270e:	4d 89 3e             	mov    %r15,(%r14)
2711     2711:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
2716     2716:	4c 89 f7             	mov    %r14,%rdi
2719     2719:	e8 00 00 00 00       	call   271e <shrink_node+0x271e>	271a: R_X86_64_PLT32	__tsan_read4-0x4
271e     271e:	45 8b 36             	mov    (%r14),%r14d
2721     2721:	be 00 00 02 00       	mov    $0x20000,%esi
2726     2726:	31 ff                	xor    %edi,%edi
2728     2728:	44 21 f6             	and    %r14d,%esi
272b     272b:	e8 00 00 00 00       	call   2730 <shrink_node+0x2730>	272c: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
2730     2730:	b8 00 00 02 00       	mov    $0x20000,%eax
2735     2735:	41 21 c6             	and    %eax,%r14d
2738     2738:	75 27                	jne    2761 <shrink_node+0x2761>
273a     273a:	e8 00 00 00 00       	call   273f <shrink_node+0x273f>	273b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
273f     273f:	4c 8b 35 00 00 00 00 	mov    0x0(%rip),%r14        # 2746 <shrink_node+0x2746>	2742: R_X86_64_PC32	_ftrace_branch+0x883dc
2746     2746:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2749: R_X86_64_32S	_ftrace_branch+0x883e0
274d     274d:	49 ff c6             	inc    %r14
2750     2750:	e8 00 00 00 00       	call   2755 <shrink_node+0x2755>	2751: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
2755     2755:	4c 89 35 00 00 00 00 	mov    %r14,0x0(%rip)        # 275c <shrink_node+0x275c>	2758: R_X86_64_PC32	_ftrace_branch+0x883dc
275c     275c:	e9 25 03 00 00       	jmp    2a86 <shrink_node+0x2a86>
2761     2761:	4c 8b 35 00 00 00 00 	mov    0x0(%rip),%r14        # 2768 <shrink_node+0x2768>	2764: R_X86_64_PC32	_ftrace_branch+0x883e4
2768     2768:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	276b: R_X86_64_32S	_ftrace_branch+0x883e8
276f     276f:	49 ff c6             	inc    %r14
2772     2772:	e8 00 00 00 00       	call   2777 <shrink_node+0x2777>	2773: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
2777     2777:	4c 89 35 00 00 00 00 	mov    %r14,0x0(%rip)        # 277e <shrink_node+0x277e>	277a: R_X86_64_PC32	_ftrace_branch+0x883e4
277e     277e:	4c 8b b4 24 28 01 00 00 	mov    0x128(%rsp),%r14
2786     2786:	4c 89 f7             	mov    %r14,%rdi
2789     2789:	e8 00 00 00 00       	call   278e <shrink_node+0x278e>	278a: R_X86_64_PLT32	__tsan_read4-0x4
278e     278e:	45 8b 36             	mov    (%r14),%r14d
2791     2791:	31 ff                	xor    %edi,%edi
2793     2793:	44 89 f6             	mov    %r14d,%esi
2796     2796:	e8 00 00 00 00       	call   279b <shrink_node+0x279b>	2797: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
279b     279b:	45 85 f6             	test   %r14d,%r14d
279e     279e:	74 22                	je     27c2 <shrink_node+0x27c2>
27a0     27a0:	e8 00 00 00 00       	call   27a5 <shrink_node+0x27a5>	27a1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
27a5     27a5:	4c 8b bc 24 88 00 00 00 	mov    0x88(%rsp),%r15
27ad     27ad:	4c 89 ff             	mov    %r15,%rdi
27b0     27b0:	e8 00 00 00 00       	call   27b5 <shrink_node+0x27b5>	27b1: R_X86_64_PLT32	__tsan_read4-0x4
27b5     27b5:	41 8b 37             	mov    (%r15),%esi
27b8     27b8:	44 89 f7             	mov    %r14d,%edi
27bb     27bb:	e8 00 00 00 00       	call   27c0 <shrink_node+0x27c0>	27bc: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
27c0     27c0:	eb 05                	jmp    27c7 <shrink_node+0x27c7>
27c2     27c2:	e8 00 00 00 00       	call   27c7 <shrink_node+0x27c7>	27c3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
27c7     27c7:	45 85 f6             	test   %r14d,%r14d
27ca     27ca:	74 6d                	je     2839 <shrink_node+0x2839>
27cc     27cc:	4c 8b bc 24 88 00 00 00 	mov    0x88(%rsp),%r15
27d4     27d4:	4c 89 ff             	mov    %r15,%rdi
27d7     27d7:	e8 00 00 00 00       	call   27dc <shrink_node+0x27dc>	27d8: R_X86_64_PLT32	__tsan_read4-0x4
27dc     27dc:	45 8b 3f             	mov    (%r15),%r15d
27df     27df:	44 89 f7             	mov    %r14d,%edi
27e2     27e2:	44 89 fe             	mov    %r15d,%esi
27e5     27e5:	e8 00 00 00 00       	call   27ea <shrink_node+0x27ea>	27e6: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
27ea     27ea:	45 39 fe             	cmp    %r15d,%r14d
27ed     27ed:	0f 85 62 01 00 00    	jne    2955 <shrink_node+0x2955>
27f3     27f3:	e8 00 00 00 00       	call   27f8 <shrink_node+0x27f8>	27f4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
27f8     27f8:	4c 8b 35 00 00 00 00 	mov    0x0(%rip),%r14        # 27ff <shrink_node+0x27ff>	27fb: R_X86_64_PC32	_ftrace_branch+0x883f4
27ff     27ff:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2802: R_X86_64_32S	_ftrace_branch+0x883f8
2806     2806:	49 ff c6             	inc    %r14
2809     2809:	e8 00 00 00 00       	call   280e <shrink_node+0x280e>	280a: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
280e     280e:	4c 89 35 00 00 00 00 	mov    %r14,0x0(%rip)        # 2815 <shrink_node+0x2815>	2811: R_X86_64_PC32	_ftrace_branch+0x883f4
2815     2815:	4c 8b b4 24 e0 00 00 00 	mov    0xe0(%rsp),%r14
281d     281d:	be 08 00 00 00       	mov    $0x8,%esi
2822     2822:	ba 05 00 00 00       	mov    $0x5,%edx
2827     2827:	4c 89 f7             	mov    %r14,%rdi
282a     282a:	e8 00 00 00 00       	call   282f <shrink_node+0x282f>	282b: R_X86_64_PLT32	__kcsan_check_access-0x4
282f     282f:	f0 41 80 0e 02       	lock orb $0x2,(%r14)
2834     2834:	e9 3e 01 00 00       	jmp    2977 <shrink_node+0x2977>
2839     2839:	e8 00 00 00 00       	call   283e <shrink_node+0x283e>	283a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
283e     283e:	e9 17 01 00 00       	jmp    295a <shrink_node+0x295a>
2843     2843:	e8 00 00 00 00       	call   2848 <shrink_node+0x2848>	2844: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2848     2848:	4c 8b 35 00 00 00 00 	mov    0x0(%rip),%r14        # 284f <shrink_node+0x284f>	284b: R_X86_64_PC32	_ftrace_branch+0x88594
284f     284f:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2852: R_X86_64_32S	_ftrace_branch+0x88598
2856     2856:	49 ff c6             	inc    %r14
2859     2859:	e8 00 00 00 00       	call   285e <shrink_node+0x285e>	285a: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
285e     285e:	4c 89 35 00 00 00 00 	mov    %r14,0x0(%rip)        # 2865 <shrink_node+0x2865>	2861: R_X86_64_PC32	_ftrace_branch+0x88594
2865     2865:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
286a     286a:	44 0f b6 70 2a       	movzbl 0x2a(%rax),%r14d
286f     286f:	0f b7 40 28          	movzwl 0x28(%rax),%eax
2873     2873:	41 c1 e6 10          	shl    $0x10,%r14d
2877     2877:	41 09 c6             	or     %eax,%r14d
287a     287a:	41 0f ba e6 0f       	bt     $0xf,%r14d
287f     287f:	0f 82 18 09 00 00    	jb     319d <shrink_node+0x319d>
2885     2885:	e8 00 00 00 00       	call   288a <shrink_node+0x288a>	2886: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
288a     288a:	4c 8b 3d 00 00 00 00 	mov    0x0(%rip),%r15        # 2891 <shrink_node+0x2891>	288d: R_X86_64_PC32	_ftrace_branch+0x885a4
2891     2891:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2894: R_X86_64_32S	_ftrace_branch+0x885a8
2898     2898:	49 ff c7             	inc    %r15
289b     289b:	e8 00 00 00 00       	call   28a0 <shrink_node+0x28a0>	289c: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
28a0     28a0:	41 0f ba e6 0e       	bt     $0xe,%r14d
28a5     28a5:	4c 89 3d 00 00 00 00 	mov    %r15,0x0(%rip)        # 28ac <shrink_node+0x28ac>	28a8: R_X86_64_PC32	_ftrace_branch+0x885a4
28ac     28ac:	0f 82 54 09 00 00    	jb     3206 <shrink_node+0x3206>
28b2     28b2:	e8 00 00 00 00       	call   28b7 <shrink_node+0x28b7>	28b3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
28b7     28b7:	4c 8b 35 00 00 00 00 	mov    0x0(%rip),%r14        # 28be <shrink_node+0x28be>	28ba: R_X86_64_PC32	_ftrace_branch+0x885b4
28be     28be:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	28c1: R_X86_64_32S	_ftrace_branch+0x885b8
28c5     28c5:	49 ff c6             	inc    %r14
28c8     28c8:	e8 00 00 00 00       	call   28cd <shrink_node+0x28cd>	28c9: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
28cd     28cd:	4c 89 e7             	mov    %r12,%rdi
28d0     28d0:	4c 89 35 00 00 00 00 	mov    %r14,0x0(%rip)        # 28d7 <shrink_node+0x28d7>	28d3: R_X86_64_PC32	_ftrace_branch+0x885b4
28d7     28d7:	e8 00 00 00 00       	call   28dc <shrink_node+0x28dc>	28d8: R_X86_64_PLT32	__tsan_read8-0x4
28dc     28dc:	4c 8b bc 24 f8 00 00 00 	mov    0xf8(%rsp),%r15
28e4     28e4:	4d 8b 34 24          	mov    (%r12),%r14
28e8     28e8:	4c 89 ff             	mov    %r15,%rdi
28eb     28eb:	e8 00 00 00 00       	call   28f0 <shrink_node+0x28f0>	28ec: R_X86_64_PLT32	__tsan_read8-0x4
28f0     28f0:	49 8b 07             	mov    (%r15),%rax
28f3     28f3:	31 d2                	xor    %edx,%edx
28f5     28f5:	4a 8d 0c 30          	lea    (%rax,%r14,1),%rcx
28f9     28f9:	48 8d 7c 08 01       	lea    0x1(%rax,%rcx,1),%rdi
28fe     28fe:	4a 8d 34 31          	lea    (%rcx,%r14,1),%rsi
2902     2902:	48 89 d8             	mov    %rbx,%rax
2905     2905:	49 8d 4c 0e 01       	lea    0x1(%r14,%rcx,1),%rcx
290a     290a:	48 01 fe             	add    %rdi,%rsi
290d     290d:	48 0f af c6          	imul   %rsi,%rax
2911     2911:	48 f7 f1             	div    %rcx
2914     2914:	31 d2                	xor    %edx,%edx
2916     2916:	48 89 c1             	mov    %rax,%rcx
2919     2919:	b8 c8 00 00 00       	mov    $0xc8,%eax
291e     291e:	29 d8                	sub    %ebx,%eax
2920     2920:	48 98                	cltq
2922     2922:	48 0f af c6          	imul   %rsi,%rax
2926     2926:	48 f7 f7             	div    %rdi
2929     2929:	48 89 8c 24 00 02 00 00 	mov    %rcx,0x200(%rsp)
2931     2931:	48 89 c2             	mov    %rax,%rdx
2934     2934:	31 c0                	xor    %eax,%eax
2936     2936:	48 89 94 24 08 02 00 00 	mov    %rdx,0x208(%rsp)
293e     293e:	48 01 ca             	add    %rcx,%rdx
2941     2941:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
2946     2946:	b8 01 00 00 00       	mov    $0x1,%eax
294b     294b:	48 89 54 24 50       	mov    %rdx,0x50(%rsp)
2950     2950:	e9 55 e2 ff ff       	jmp    baa <shrink_node+0xbaa>
2955     2955:	e8 00 00 00 00       	call   295a <shrink_node+0x295a>	2956: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
295a     295a:	4c 8b 35 00 00 00 00 	mov    0x0(%rip),%r14        # 2961 <shrink_node+0x2961>	295d: R_X86_64_PC32	_ftrace_branch+0x883ec
2961     2961:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2964: R_X86_64_32S	_ftrace_branch+0x883f0
2968     2968:	49 ff c6             	inc    %r14
296b     296b:	e8 00 00 00 00       	call   2970 <shrink_node+0x2970>	296c: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
2970     2970:	4c 89 35 00 00 00 00 	mov    %r14,0x0(%rip)        # 2977 <shrink_node+0x2977>	2973: R_X86_64_PC32	_ftrace_branch+0x883ec
2977     2977:	4c 8b b4 24 30 01 00 00 	mov    0x130(%rsp),%r14
297f     297f:	4c 89 f7             	mov    %r14,%rdi
2982     2982:	e8 00 00 00 00       	call   2987 <shrink_node+0x2987>	2983: R_X86_64_PLT32	__tsan_read4-0x4
2987     2987:	4c 8b bc 24 18 01 00 00 	mov    0x118(%rsp),%r15
298f     298f:	45 8b 36             	mov    (%r14),%r14d
2992     2992:	4c 89 ff             	mov    %r15,%rdi
2995     2995:	e8 00 00 00 00       	call   299a <shrink_node+0x299a>	2996: R_X86_64_PLT32	__tsan_read4-0x4
299a     299a:	45 8b 3f             	mov    (%r15),%r15d
299d     299d:	44 89 f7             	mov    %r14d,%edi
29a0     29a0:	44 89 fe             	mov    %r15d,%esi
29a3     29a3:	e8 00 00 00 00       	call   29a8 <shrink_node+0x29a8>	29a4: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
29a8     29a8:	45 39 fe             	cmp    %r15d,%r14d
29ab     29ab:	75 43                	jne    29f0 <shrink_node+0x29f0>
29ad     29ad:	e8 00 00 00 00       	call   29b2 <shrink_node+0x29b2>	29ae: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
29b2     29b2:	4c 8b 35 00 00 00 00 	mov    0x0(%rip),%r14        # 29b9 <shrink_node+0x29b9>	29b5: R_X86_64_PC32	_ftrace_branch+0x88404
29b9     29b9:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	29bc: R_X86_64_32S	_ftrace_branch+0x88408
29c0     29c0:	49 ff c6             	inc    %r14
29c3     29c3:	e8 00 00 00 00       	call   29c8 <shrink_node+0x29c8>	29c4: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
29c8     29c8:	4c 89 35 00 00 00 00 	mov    %r14,0x0(%rip)        # 29cf <shrink_node+0x29cf>	29cb: R_X86_64_PC32	_ftrace_branch+0x88404
29cf     29cf:	4c 8b b4 24 e0 00 00 00 	mov    0xe0(%rsp),%r14
29d7     29d7:	be 08 00 00 00       	mov    $0x8,%esi
29dc     29dc:	ba 05 00 00 00       	mov    $0x5,%edx
29e1     29e1:	4c 89 f7             	mov    %r14,%rdi
29e4     29e4:	e8 00 00 00 00       	call   29e9 <shrink_node+0x29e9>	29e5: R_X86_64_PLT32	__kcsan_check_access-0x4
29e9     29e9:	f0 41 80 0e 01       	lock orb $0x1,(%r14)
29ee     29ee:	eb 22                	jmp    2a12 <shrink_node+0x2a12>
29f0     29f0:	e8 00 00 00 00       	call   29f5 <shrink_node+0x29f5>	29f1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
29f5     29f5:	4c 8b 35 00 00 00 00 	mov    0x0(%rip),%r14        # 29fc <shrink_node+0x29fc>	29f8: R_X86_64_PC32	_ftrace_branch+0x883fc
29fc     29fc:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	29ff: R_X86_64_32S	_ftrace_branch+0x88400
2a03     2a03:	49 ff c6             	inc    %r14
2a06     2a06:	e8 00 00 00 00       	call   2a0b <shrink_node+0x2a0b>	2a07: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
2a0b     2a0b:	4c 89 35 00 00 00 00 	mov    %r14,0x0(%rip)        # 2a12 <shrink_node+0x2a12>	2a0e: R_X86_64_PC32	_ftrace_branch+0x883fc
2a12     2a12:	4c 8b b4 24 20 01 00 00 	mov    0x120(%rsp),%r14
2a1a     2a1a:	4c 89 f7             	mov    %r14,%rdi
2a1d     2a1d:	e8 00 00 00 00       	call   2a22 <shrink_node+0x2a22>	2a1e: R_X86_64_PLT32	__tsan_read4-0x4
2a22     2a22:	45 8b 36             	mov    (%r14),%r14d
2a25     2a25:	31 ff                	xor    %edi,%edi
2a27     2a27:	44 89 f6             	mov    %r14d,%esi
2a2a     2a2a:	e8 00 00 00 00       	call   2a2f <shrink_node+0x2a2f>	2a2b: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
2a2f     2a2f:	45 85 f6             	test   %r14d,%r14d
2a32     2a32:	74 30                	je     2a64 <shrink_node+0x2a64>
2a34     2a34:	e8 00 00 00 00       	call   2a39 <shrink_node+0x2a39>	2a35: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2a39     2a39:	4c 8b 35 00 00 00 00 	mov    0x0(%rip),%r14        # 2a40 <shrink_node+0x2a40>	2a3c: R_X86_64_PC32	_ftrace_branch+0x88414
2a40     2a40:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2a43: R_X86_64_32S	_ftrace_branch+0x88418
2a47     2a47:	49 ff c6             	inc    %r14
2a4a     2a4a:	e8 00 00 00 00       	call   2a4f <shrink_node+0x2a4f>	2a4b: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
2a4f     2a4f:	48 8b 7c 24 58       	mov    0x58(%rsp),%rdi
2a54     2a54:	31 f6                	xor    %esi,%esi
2a56     2a56:	4c 89 35 00 00 00 00 	mov    %r14,0x0(%rip)        # 2a5d <shrink_node+0x2a5d>	2a59: R_X86_64_PC32	_ftrace_branch+0x88414
2a5d     2a5d:	e8 00 00 00 00       	call   2a62 <shrink_node+0x2a62>	2a5e: R_X86_64_PLT32	reclaim_throttle-0x4
2a62     2a62:	eb 22                	jmp    2a86 <shrink_node+0x2a86>
2a64     2a64:	e8 00 00 00 00       	call   2a69 <shrink_node+0x2a69>	2a65: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2a69     2a69:	4c 8b 35 00 00 00 00 	mov    0x0(%rip),%r14        # 2a70 <shrink_node+0x2a70>	2a6c: R_X86_64_PC32	_ftrace_branch+0x8840c
2a70     2a70:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2a73: R_X86_64_32S	_ftrace_branch+0x88410
2a77     2a77:	49 ff c6             	inc    %r14
2a7a     2a7a:	e8 00 00 00 00       	call   2a7f <shrink_node+0x2a7f>	2a7b: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
2a7f     2a7f:	4c 89 35 00 00 00 00 	mov    %r14,0x0(%rip)        # 2a86 <shrink_node+0x2a86>	2a82: R_X86_64_PC32	_ftrace_branch+0x8840c
2a86     2a86:	4c 8b b4 24 98 00 00 00 	mov    0x98(%rsp),%r14
2a8e     2a8e:	4c 89 f7             	mov    %r14,%rdi
2a91     2a91:	e8 00 00 00 00       	call   2a96 <shrink_node+0x2a96>	2a92: R_X86_64_PLT32	__tsan_read4-0x4
2a96     2a96:	45 8b 36             	mov    (%r14),%r14d
2a99     2a99:	31 ff                	xor    %edi,%edi
2a9b     2a9b:	44 89 f6             	mov    %r14d,%esi
2a9e     2a9e:	e8 00 00 00 00       	call   2aa3 <shrink_node+0x2aa3>	2a9f: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
2aa3     2aa3:	45 85 f6             	test   %r14d,%r14d
2aa6     2aa6:	74 22                	je     2aca <shrink_node+0x2aca>
2aa8     2aa8:	e8 00 00 00 00       	call   2aad <shrink_node+0x2aad>	2aa9: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2aad     2aad:	4c 8b bc 24 90 00 00 00 	mov    0x90(%rsp),%r15
2ab5     2ab5:	4c 89 ff             	mov    %r15,%rdi
2ab8     2ab8:	e8 00 00 00 00       	call   2abd <shrink_node+0x2abd>	2ab9: R_X86_64_PLT32	__tsan_read4-0x4
2abd     2abd:	41 8b 37             	mov    (%r15),%esi
2ac0     2ac0:	44 89 f7             	mov    %r14d,%edi
2ac3     2ac3:	e8 00 00 00 00       	call   2ac8 <shrink_node+0x2ac8>	2ac4: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
2ac8     2ac8:	eb 05                	jmp    2acf <shrink_node+0x2acf>
2aca     2aca:	e8 00 00 00 00       	call   2acf <shrink_node+0x2acf>	2acb: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2acf     2acf:	45 85 f6             	test   %r14d,%r14d
2ad2     2ad2:	0f 84 b7 00 00 00    	je     2b8f <shrink_node+0x2b8f>
2ad8     2ad8:	4c 8b bc 24 90 00 00 00 	mov    0x90(%rsp),%r15
2ae0     2ae0:	4c 89 ff             	mov    %r15,%rdi
2ae3     2ae3:	e8 00 00 00 00       	call   2ae8 <shrink_node+0x2ae8>	2ae4: R_X86_64_PLT32	__tsan_read4-0x4
2ae8     2ae8:	45 8b 3f             	mov    (%r15),%r15d
2aeb     2aeb:	44 89 f7             	mov    %r14d,%edi
2aee     2aee:	44 89 fe             	mov    %r15d,%esi
2af1     2af1:	e8 00 00 00 00       	call   2af6 <shrink_node+0x2af6>	2af2: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
2af6     2af6:	45 39 fe             	cmp    %r15d,%r14d
2af9     2af9:	0f 85 97 00 00 00    	jne    2b96 <shrink_node+0x2b96>
2aff     2aff:	e8 00 00 00 00       	call   2b04 <shrink_node+0x2b04>	2b00: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2b04     2b04:	4c 8b 35 00 00 00 00 	mov    0x0(%rip),%r14        # 2b0b <shrink_node+0x2b0b>	2b07: R_X86_64_PC32	_ftrace_branch+0x88424
2b0b     2b0b:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2b0e: R_X86_64_32S	_ftrace_branch+0x88428
2b12     2b12:	49 ff c6             	inc    %r14
2b15     2b15:	e8 00 00 00 00       	call   2b1a <shrink_node+0x2b1a>	2b16: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
2b1a     2b1a:	4c 8b 3d 00 00 00 00 	mov    0x0(%rip),%r15        # 2b21 <shrink_node+0x2b21>	2b1d: R_X86_64_PC32	_ftrace_branch+0x8842c
2b21     2b21:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2b24: R_X86_64_32S	_ftrace_branch+0x88430
2b28     2b28:	4c 89 35 00 00 00 00 	mov    %r14,0x0(%rip)        # 2b2f <shrink_node+0x2b2f>	2b2b: R_X86_64_PC32	_ftrace_branch+0x88424
2b2f     2b2f:	49 ff c7             	inc    %r15
2b32     2b32:	e8 00 00 00 00       	call   2b37 <shrink_node+0x2b37>	2b33: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
2b37     2b37:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
2b3c     2b3c:	4c 89 3d 00 00 00 00 	mov    %r15,0x0(%rip)        # 2b43 <shrink_node+0x2b43>	2b3f: R_X86_64_PC32	_ftrace_branch+0x8842c
2b43     2b43:	4c 89 f7             	mov    %r14,%rdi
2b46     2b46:	e8 00 00 00 00       	call   2b4b <shrink_node+0x2b4b>	2b47: R_X86_64_PLT32	__tsan_read4-0x4
2b4b     2b4b:	45 8b 36             	mov    (%r14),%r14d
2b4e     2b4e:	be 00 00 02 00       	mov    $0x20000,%esi
2b53     2b53:	31 ff                	xor    %edi,%edi
2b55     2b55:	44 21 f6             	and    %r14d,%esi
2b58     2b58:	e8 00 00 00 00       	call   2b5d <shrink_node+0x2b5d>	2b59: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
2b5d     2b5d:	b8 00 00 02 00       	mov    $0x20000,%eax
2b62     2b62:	41 21 c6             	and    %eax,%r14d
2b65     2b65:	0f 85 72 05 00 00    	jne    30dd <shrink_node+0x30dd>
2b6b     2b6b:	e8 00 00 00 00       	call   2b70 <shrink_node+0x2b70>	2b6c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2b70     2b70:	4c 8b 35 00 00 00 00 	mov    0x0(%rip),%r14        # 2b77 <shrink_node+0x2b77>	2b73: R_X86_64_PC32	_ftrace_branch+0x88434
2b77     2b77:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2b7a: R_X86_64_32S	_ftrace_branch+0x88438
2b7e     2b7e:	49 ff c6             	inc    %r14
2b81     2b81:	e8 00 00 00 00       	call   2b86 <shrink_node+0x2b86>	2b82: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
2b86     2b86:	4c 89 35 00 00 00 00 	mov    %r14,0x0(%rip)        # 2b8d <shrink_node+0x2b8d>	2b89: R_X86_64_PC32	_ftrace_branch+0x88434
2b8d     2b8d:	eb 29                	jmp    2bb8 <shrink_node+0x2bb8>
2b8f     2b8f:	e8 00 00 00 00       	call   2b94 <shrink_node+0x2b94>	2b90: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2b94     2b94:	eb 05                	jmp    2b9b <shrink_node+0x2b9b>
2b96     2b96:	e8 00 00 00 00       	call   2b9b <shrink_node+0x2b9b>	2b97: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2b9b     2b9b:	4c 8b 35 00 00 00 00 	mov    0x0(%rip),%r14        # 2ba2 <shrink_node+0x2ba2>	2b9e: R_X86_64_PC32	_ftrace_branch+0x8841c
2ba2     2ba2:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2ba5: R_X86_64_32S	_ftrace_branch+0x88420
2ba9     2ba9:	49 ff c6             	inc    %r14
2bac     2bac:	e8 00 00 00 00       	call   2bb1 <shrink_node+0x2bb1>	2bad: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
2bb1     2bb1:	4c 89 35 00 00 00 00 	mov    %r14,0x0(%rip)        # 2bb8 <shrink_node+0x2bb8>	2bb4: R_X86_64_PC32	_ftrace_branch+0x8841c
2bb8     2bb8:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
2bbd     2bbd:	4c 89 f7             	mov    %r14,%rdi
2bc0     2bc0:	e8 00 00 00 00       	call   2bc5 <shrink_node+0x2bc5>	2bc1: R_X86_64_PLT32	__tsan_read4-0x4
2bc5     2bc5:	45 8b 36             	mov    (%r14),%r14d
2bc8     2bc8:	be 00 00 12 00       	mov    $0x120000,%esi
2bcd     2bcd:	31 ff                	xor    %edi,%edi
2bcf     2bcf:	44 21 f6             	and    %r14d,%esi
2bd2     2bd2:	e8 00 00 00 00       	call   2bd7 <shrink_node+0x2bd7>	2bd3: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
2bd7     2bd7:	b8 00 00 12 00       	mov    $0x120000,%eax
2bdc     2bdc:	41 21 c6             	and    %eax,%r14d
2bdf     2bdf:	74 0a                	je     2beb <shrink_node+0x2beb>
2be1     2be1:	e8 00 00 00 00       	call   2be6 <shrink_node+0x2be6>	2be2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2be6     2be6:	e9 a1 00 00 00       	jmp    2c8c <shrink_node+0x2c8c>
2beb     2beb:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
2bf0     2bf0:	0f b6 41 2a          	movzbl 0x2a(%rcx),%eax
2bf4     2bf4:	0f b7 49 28          	movzwl 0x28(%rcx),%ecx
2bf8     2bf8:	c1 e0 10             	shl    $0x10,%eax
2bfb     2bfb:	09 c8                	or     %ecx,%eax
2bfd     2bfd:	0f ba e0 0c          	bt     $0xc,%eax
2c01     2c01:	0f 82 80 00 00 00    	jb     2c87 <shrink_node+0x2c87>
2c07     2c07:	4c 89 e7             	mov    %r12,%rdi
2c0a     2c0a:	e8 00 00 00 00       	call   2c0f <shrink_node+0x2c0f>	2c0b: R_X86_64_PLT32	__tsan_read8-0x4
2c0f     2c0f:	be 08 00 00 00       	mov    $0x8,%esi
2c14     2c14:	4c 89 e7             	mov    %r12,%rdi
2c17     2c17:	ba 04 00 00 00       	mov    $0x4,%edx
2c1c     2c1c:	e8 00 00 00 00       	call   2c21 <shrink_node+0x2c21>	2c1d: R_X86_64_PLT32	__kcsan_check_access-0x4
2c21     2c21:	4c 89 e7             	mov    %r12,%rdi
2c24     2c24:	e8 00 00 00 00       	call   2c29 <shrink_node+0x2c29>	2c25: R_X86_64_PLT32	__tsan_volatile_read8-0x4
2c29     2c29:	4d 8b 34 24          	mov    (%r12),%r14
2c2d     2c2d:	31 ff                	xor    %edi,%edi
2c2f     2c2f:	4c 89 f6             	mov    %r14,%rsi
2c32     2c32:	48 83 e6 01          	and    $0x1,%rsi
2c36     2c36:	e8 00 00 00 00       	call   2c3b <shrink_node+0x2c3b>	2c37: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
2c3b     2c3b:	49 83 e6 01          	and    $0x1,%r14
2c3f     2c3f:	0f 85 51 05 00 00    	jne    3196 <shrink_node+0x3196>
2c45     2c45:	e8 00 00 00 00       	call   2c4a <shrink_node+0x2c4a>	2c46: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2c4a     2c4a:	be 08 00 00 00       	mov    $0x8,%esi
2c4f     2c4f:	4c 89 e7             	mov    %r12,%rdi
2c52     2c52:	ba 04 00 00 00       	mov    $0x4,%edx
2c57     2c57:	e8 00 00 00 00       	call   2c5c <shrink_node+0x2c5c>	2c58: R_X86_64_PLT32	__kcsan_check_access-0x4
2c5c     2c5c:	4c 89 e7             	mov    %r12,%rdi
2c5f     2c5f:	e8 00 00 00 00       	call   2c64 <shrink_node+0x2c64>	2c60: R_X86_64_PLT32	__tsan_volatile_read8-0x4
2c64     2c64:	4d 8b 34 24          	mov    (%r12),%r14
2c68     2c68:	31 ff                	xor    %edi,%edi
2c6a     2c6a:	4c 89 f6             	mov    %r14,%rsi
2c6d     2c6d:	48 83 e6 02          	and    $0x2,%rsi
2c71     2c71:	e8 00 00 00 00       	call   2c76 <shrink_node+0x2c76>	2c72: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
2c76     2c76:	49 83 e6 02          	and    $0x2,%r14
2c7a     2c7a:	0f 85 4b 05 00 00    	jne    31cb <shrink_node+0x31cb>
2c80     2c80:	e8 00 00 00 00       	call   2c85 <shrink_node+0x2c85>	2c81: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2c85     2c85:	eb 05                	jmp    2c8c <shrink_node+0x2c8c>
2c87     2c87:	e8 00 00 00 00       	call   2c8c <shrink_node+0x2c8c>	2c88: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2c8c     2c8c:	4c 8b 35 00 00 00 00 	mov    0x0(%rip),%r14        # 2c93 <shrink_node+0x2c93>	2c8f: R_X86_64_PC32	_ftrace_branch+0x88444
2c93     2c93:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2c96: R_X86_64_32S	_ftrace_branch+0x88448
2c9a     2c9a:	4c 8b 7c 24 40       	mov    0x40(%rsp),%r15
2c9f     2c9f:	49 ff c6             	inc    %r14
2ca2     2ca2:	e8 00 00 00 00       	call   2ca7 <shrink_node+0x2ca7>	2ca3: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
2ca7     2ca7:	4c 89 35 00 00 00 00 	mov    %r14,0x0(%rip)        # 2cae <shrink_node+0x2cae>	2caa: R_X86_64_PC32	_ftrace_branch+0x88444
2cae     2cae:	4c 8b b4 24 a8 00 00 00 	mov    0xa8(%rsp),%r14
2cb6     2cb6:	4c 89 f7             	mov    %r14,%rdi
2cb9     2cb9:	e8 00 00 00 00       	call   2cbe <shrink_node+0x2cbe>	2cba: R_X86_64_PLT32	__tsan_read4-0x4
2cbe     2cbe:	45 8b 36             	mov    (%r14),%r14d
2cc1     2cc1:	31 ff                	xor    %edi,%edi
2cc3     2cc3:	44 89 f6             	mov    %r14d,%esi
2cc6     2cc6:	83 e6 40             	and    $0x40,%esi
2cc9     2cc9:	e8 00 00 00 00       	call   2cce <shrink_node+0x2cce>	2cca: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
2cce     2cce:	41 83 e6 40          	and    $0x40,%r14d
2cd2     2cd2:	0f 84 f8 05 00 00    	je     32d0 <shrink_node+0x32d0>
2cd8     2cd8:	4c 89 ff             	mov    %r15,%rdi
2cdb     2cdb:	e8 00 00 00 00       	call   2ce0 <shrink_node+0x2ce0>	2cdc: R_X86_64_PLT32	__tsan_read1-0x4
2ce0     2ce0:	45 0f b6 37          	movzbl (%r15),%r14d
2ce4     2ce4:	31 ff                	xor    %edi,%edi
2ce6     2ce6:	44 89 f6             	mov    %r14d,%esi
2ce9     2ce9:	e8 00 00 00 00       	call   2cee <shrink_node+0x2cee>	2cea: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
2cee     2cee:	45 85 f6             	test   %r14d,%r14d
2cf1     2cf1:	0f 84 e0 05 00 00    	je     32d7 <shrink_node+0x32d7>
2cf7     2cf7:	45 0f b6 fe          	movzbl %r14b,%r15d
2cfb     2cfb:	bf 03 00 00 00       	mov    $0x3,%edi
2d00     2d00:	44 89 fe             	mov    %r15d,%esi
2d03     2d03:	e8 00 00 00 00       	call   2d08 <shrink_node+0x2d08>	2d04: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
2d08     2d08:	41 80 ff 04          	cmp    $0x4,%r15b
2d0c     2d0c:	7c 07                	jl     2d15 <shrink_node+0x2d15>
2d0e     2d0e:	e8 00 00 00 00       	call   2d13 <shrink_node+0x2d13>	2d0f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2d13     2d13:	eb 2d                	jmp    2d42 <shrink_node+0x2d42>
2d15     2d15:	4c 8b 7c 24 28       	mov    0x28(%rsp),%r15
2d1a     2d1a:	4c 89 ff             	mov    %r15,%rdi
2d1d     2d1d:	e8 00 00 00 00       	call   2d22 <shrink_node+0x2d22>	2d1e: R_X86_64_PLT32	__tsan_read1-0x4
2d22     2d22:	45 0f b6 3f          	movzbl (%r15),%r15d
2d26     2d26:	bf 0a 00 00 00       	mov    $0xa,%edi
2d2b     2d2b:	44 89 fe             	mov    %r15d,%esi
2d2e     2d2e:	e8 00 00 00 00       	call   2d33 <shrink_node+0x2d33>	2d2f: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
2d33     2d33:	41 80 ff 0a          	cmp    $0xa,%r15b
2d37     2d37:	0f 8d b6 05 00 00    	jge    32f3 <shrink_node+0x32f3>
2d3d     2d3d:	e8 00 00 00 00       	call   2d42 <shrink_node+0x2d42>	2d3e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2d42     2d42:	4c 8b 3d 00 00 00 00 	mov    0x0(%rip),%r15        # 2d49 <shrink_node+0x2d49>	2d45: R_X86_64_PC32	_ftrace_branch+0x88abc
2d49     2d49:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2d4c: R_X86_64_32S	_ftrace_branch+0x88ac0
2d50     2d50:	49 ff c7             	inc    %r15
2d53     2d53:	e8 00 00 00 00       	call   2d58 <shrink_node+0x2d58>	2d54: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
2d58     2d58:	4c 8b 25 00 00 00 00 	mov    0x0(%rip),%r12        # 2d5f <shrink_node+0x2d5f>	2d5b: R_X86_64_PC32	_ftrace_branch+0x88a54
2d5f     2d5f:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2d62: R_X86_64_32S	_ftrace_branch+0x88a58
2d66     2d66:	4c 89 3d 00 00 00 00 	mov    %r15,0x0(%rip)        # 2d6d <shrink_node+0x2d6d>	2d69: R_X86_64_PC32	_ftrace_branch+0x88abc
2d6d     2d6d:	49 ff c4             	inc    %r12
2d70     2d70:	e8 00 00 00 00       	call   2d75 <shrink_node+0x2d75>	2d71: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
2d75     2d75:	4c 8b bc 24 08 01 00 00 	mov    0x108(%rsp),%r15
2d7d     2d7d:	48 89 df             	mov    %rbx,%rdi
2d80     2d80:	4c 89 25 00 00 00 00 	mov    %r12,0x0(%rip)        # 2d87 <shrink_node+0x2d87>	2d83: R_X86_64_PC32	_ftrace_branch+0x88a54
2d87     2d87:	4c 89 fe             	mov    %r15,%rsi
2d8a     2d8a:	e8 00 00 00 00       	call   2d8f <shrink_node+0x2d8f>	2d8b: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
2d8f     2d8f:	4c 39 fb             	cmp    %r15,%rbx
2d92     2d92:	0f 84 46 05 00 00    	je     32de <shrink_node+0x32de>
2d98     2d98:	e8 00 00 00 00       	call   2d9d <shrink_node+0x2d9d>	2d99: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2d9d     2d9d:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 2da4 <shrink_node+0x2da4>	2da0: R_X86_64_PC32	_ftrace_branch+0x88a64
2da4     2da4:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2da7: R_X86_64_32S	_ftrace_branch+0x88a68
2dab     2dab:	48 ff c3             	inc    %rbx
2dae     2dae:	e8 00 00 00 00       	call   2db3 <shrink_node+0x2db3>	2daf: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
2db3     2db3:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 2dba <shrink_node+0x2dba>	2db6: R_X86_64_PC32	_ftrace_branch+0x88a64
2dba     2dba:	48 8b 5c 24 38       	mov    0x38(%rsp),%rbx
2dbf     2dbf:	48 89 df             	mov    %rbx,%rdi
2dc2     2dc2:	e8 00 00 00 00       	call   2dc7 <shrink_node+0x2dc7>	2dc3: R_X86_64_PLT32	__tsan_read1-0x4
2dc7     2dc7:	0f b6 1b             	movzbl (%rbx),%ebx
2dca     2dca:	31 ff                	xor    %edi,%edi
2dcc     2dcc:	89 de                	mov    %ebx,%esi
2dce     2dce:	e8 00 00 00 00       	call   2dd3 <shrink_node+0x2dd3>	2dcf: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
2dd3     2dd3:	84 db                	test   %bl,%bl
2dd5     2dd5:	0f 88 63 01 00 00    	js     2f3e <shrink_node+0x2f3e>
2ddb     2ddb:	e8 00 00 00 00       	call   2de0 <shrink_node+0x2de0>	2ddc: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2de0     2de0:	48 8b 5c 24 58       	mov    0x58(%rsp),%rbx
2de5     2de5:	45 31 e4             	xor    %r12d,%r12d
2de8     2de8:	4c 8d b3 80 00 00 00 	lea    0x80(%rbx),%r14
2def     2def:	be 08 00 00 00       	mov    $0x8,%esi
2df4     2df4:	ba 04 00 00 00       	mov    $0x4,%edx
2df9     2df9:	4c 89 f7             	mov    %r14,%rdi
2dfc     2dfc:	e8 00 00 00 00       	call   2e01 <shrink_node+0x2e01>	2dfd: R_X86_64_PLT32	__kcsan_check_access-0x4
2e01     2e01:	4c 89 f7             	mov    %r14,%rdi
2e04     2e04:	e8 00 00 00 00       	call   2e09 <shrink_node+0x2e09>	2e05: R_X86_64_PLT32	__tsan_volatile_read8-0x4
2e09     2e09:	4c 8b b3 80 00 00 00 	mov    0x80(%rbx),%r14
2e10     2e10:	31 ff                	xor    %edi,%edi
2e12     2e12:	4c 89 f6             	mov    %r14,%rsi
2e15     2e15:	e8 00 00 00 00       	call   2e1a <shrink_node+0x2e1a>	2e16: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
2e1a     2e1a:	4d 85 f6             	test   %r14,%r14
2e1d     2e1d:	0f 84 d4 00 00 00    	je     2ef7 <shrink_node+0x2ef7>
2e23     2e23:	4c 8b 35 00 00 00 00 	mov    0x0(%rip),%r14        # 2e2a <shrink_node+0x2e2a>	2e26: R_X86_64_PC32	_ftrace_branch+0x88a74
2e2a     2e2a:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2e2d: R_X86_64_32S	_ftrace_branch+0x88a78
2e31     2e31:	4c 89 64 24 10       	mov    %r12,0x10(%rsp)
2e36     2e36:	49 ff c6             	inc    %r14
2e39     2e39:	e8 00 00 00 00       	call   2e3e <shrink_node+0x2e3e>	2e3a: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
2e3e     2e3e:	4c 8b 64 24 40       	mov    0x40(%rsp),%r12
2e43     2e43:	4c 89 35 00 00 00 00 	mov    %r14,0x0(%rip)        # 2e4a <shrink_node+0x2e4a>	2e46: R_X86_64_PC32	_ftrace_branch+0x88a74
2e4a     2e4a:	4c 89 e7             	mov    %r12,%rdi
2e4d     2e4d:	e8 00 00 00 00       	call   2e52 <shrink_node+0x2e52>	2e4e: R_X86_64_PLT32	__tsan_read1-0x4
2e52     2e52:	48 89 df             	mov    %rbx,%rdi
2e55     2e55:	45 0f be 34 24       	movsbl (%r12),%r14d
2e5a     2e5a:	e8 00 00 00 00       	call   2e5f <shrink_node+0x2e5f>	2e5b: R_X86_64_PLT32	__tsan_read8-0x4
2e5f     2e5f:	48 8d 7b 20          	lea    0x20(%rbx),%rdi
2e63     2e63:	4c 8b 3b             	mov    (%rbx),%r15
2e66     2e66:	e8 00 00 00 00       	call   2e6b <shrink_node+0x2e6b>	2e67: R_X86_64_PLT32	__tsan_read8-0x4
2e6b     2e6b:	4c 8b 6c 24 38       	mov    0x38(%rsp),%r13
2e70     2e70:	4c 03 7b 20          	add    0x20(%rbx),%r15
2e74     2e74:	4c 89 ef             	mov    %r13,%rdi
2e77     2e77:	e8 00 00 00 00       	call   2e7c <shrink_node+0x2e7c>	2e78: R_X86_64_PLT32	__tsan_read1-0x4
2e7c     2e7c:	41 0f be 4d 00       	movsbl 0x0(%r13),%ecx
2e81     2e81:	48 89 df             	mov    %rbx,%rdi
2e84     2e84:	44 89 f6             	mov    %r14d,%esi
2e87     2e87:	4c 89 fa             	mov    %r15,%rdx
2e8a     2e8a:	45 31 c0             	xor    %r8d,%r8d
2e8d     2e8d:	e8 00 00 00 00       	call   2e92 <shrink_node+0x2e92>	2e8e: R_X86_64_PLT32	zone_watermark_ok-0x4
2e92     2e92:	84 c0                	test   %al,%al
2e94     2e94:	0f 85 1a 04 00 00    	jne    32b4 <shrink_node+0x32b4>
2e9a     2e9a:	4c 8b 35 00 00 00 00 	mov    0x0(%rip),%r14        # 2ea1 <shrink_node+0x2ea1>	2e9d: R_X86_64_PC32	_ftrace_branch+0x88a84
2ea1     2ea1:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2ea4: R_X86_64_32S	_ftrace_branch+0x88a88
2ea8     2ea8:	49 ff c6             	inc    %r14
2eab     2eab:	e8 00 00 00 00       	call   2eb0 <shrink_node+0x2eb0>	2eac: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
2eb0     2eb0:	4c 89 e7             	mov    %r12,%rdi
2eb3     2eb3:	4c 89 35 00 00 00 00 	mov    %r14,0x0(%rip)        # 2eba <shrink_node+0x2eba>	2eb6: R_X86_64_PC32	_ftrace_branch+0x88a84
2eba     2eba:	e8 00 00 00 00       	call   2ebf <shrink_node+0x2ebf>	2ebb: R_X86_64_PLT32	__tsan_read1-0x4
2ebf     2ebf:	4c 89 ef             	mov    %r13,%rdi
2ec2     2ec2:	45 0f be 34 24       	movsbl (%r12),%r14d
2ec7     2ec7:	e8 00 00 00 00       	call   2ecc <shrink_node+0x2ecc>	2ec8: R_X86_64_PLT32	__tsan_read1-0x4
2ecc     2ecc:	41 0f be 55 00       	movsbl 0x0(%r13),%edx
2ed1     2ed1:	48 89 df             	mov    %rbx,%rdi
2ed4     2ed4:	44 89 f6             	mov    %r14d,%esi
2ed7     2ed7:	e8 00 00 00 00       	call   2edc <shrink_node+0x2edc>	2ed8: R_X86_64_PLT32	compaction_suitable-0x4
2edc     2edc:	84 c0                	test   %al,%al
2ede     2ede:	0f 85 de 03 00 00    	jne    32c2 <shrink_node+0x32c2>
2ee4     2ee4:	e8 00 00 00 00       	call   2ee9 <shrink_node+0x2ee9>	2ee5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2ee9     2ee9:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	2eec: R_X86_64_32S	_ftrace_branch+0x88a98
2ef0     2ef0:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
2ef5     2ef5:	eb 0c                	jmp    2f03 <shrink_node+0x2f03>
2ef7     2ef7:	e8 00 00 00 00       	call   2efc <shrink_node+0x2efc>	2ef8: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2efc     2efc:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	2eff: R_X86_64_32S	_ftrace_branch+0x88a80
2f03     2f03:	4d 8b 3e             	mov    (%r14),%r15
2f06     2f06:	4c 89 f7             	mov    %r14,%rdi
2f09     2f09:	49 ff c7             	inc    %r15
2f0c     2f0c:	e8 00 00 00 00       	call   2f11 <shrink_node+0x2f11>	2f0d: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
2f11     2f11:	4d 89 3e             	mov    %r15,(%r14)
2f14     2f14:	4c 8b 74 24 38       	mov    0x38(%rsp),%r14
2f19     2f19:	4c 89 f7             	mov    %r14,%rdi
2f1c     2f1c:	e8 00 00 00 00       	call   2f21 <shrink_node+0x2f21>	2f1d: R_X86_64_PLT32	__tsan_read1-0x4
2f21     2f21:	49 0f be 06          	movsbq (%r14),%rax
2f25     2f25:	49 39 c4             	cmp    %rax,%r12
2f28     2f28:	7d 1b                	jge    2f45 <shrink_node+0x2f45>
2f2a     2f2a:	49 ff c4             	inc    %r12
2f2d     2f2d:	e8 00 00 00 00       	call   2f32 <shrink_node+0x2f32>	2f2e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2f32     2f32:	48 81 c3 40 07 00 00 	add    $0x740,%rbx
2f39     2f39:	e9 aa fe ff ff       	jmp    2de8 <shrink_node+0x2de8>
2f3e     2f3e:	e8 00 00 00 00       	call   2f43 <shrink_node+0x2f43>	2f3f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2f43     2f43:	eb 15                	jmp    2f5a <shrink_node+0x2f5a>
2f45     2f45:	e8 00 00 00 00       	call   2f4a <shrink_node+0x2f4a>	2f46: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2f4a     2f4a:	48 8b 5c 24 40       	mov    0x40(%rsp),%rbx
2f4f     2f4f:	48 89 df             	mov    %rbx,%rdi
2f52     2f52:	e8 00 00 00 00       	call   2f57 <shrink_node+0x2f57>	2f53: R_X86_64_PLT32	__tsan_read1-0x4
2f57     2f57:	44 8a 33             	mov    (%rbx),%r14b
2f5a     2f5a:	4d 0f be f6          	movsbq %r14b,%r14
2f5e     2f5e:	bf 40 00 00 00       	mov    $0x40,%edi
2f63     2f63:	41 0f b6 f6          	movzbl %r14b,%esi
2f67     2f67:	44 89 f3             	mov    %r14d,%ebx
2f6a     2f6a:	e8 00 00 00 00       	call   2f6f <shrink_node+0x2f6f>	2f6b: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
2f6f     2f6f:	41 80 fe 3f          	cmp    $0x3f,%r14b
2f73     2f73:	0f 87 ec 02 00 00    	ja     3265 <shrink_node+0x3265>
2f79     2f79:	e8 00 00 00 00       	call   2f7e <shrink_node+0x2f7e>	2f7a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2f7e     2f7e:	41 bc 02 00 00 00    	mov    $0x2,%r12d
2f84     2f84:	89 d9                	mov    %ebx,%ecx
2f86     2f86:	be 08 00 00 00       	mov    $0x8,%esi
2f8b     2f8b:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2f8e: R_X86_64_32S	vm_node_stat+0x10
2f92     2f92:	ba 04 00 00 00       	mov    $0x4,%edx
2f97     2f97:	49 d3 e4             	shl    %cl,%r12
2f9a     2f9a:	e8 00 00 00 00       	call   2f9f <shrink_node+0x2f9f>	2f9b: R_X86_64_PLT32	__kcsan_check_access-0x4
2f9f     2f9f:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2fa2: R_X86_64_32S	vm_node_stat+0x10
2fa6     2fa6:	e8 00 00 00 00       	call   2fab <shrink_node+0x2fab>	2fa7: R_X86_64_PLT32	__tsan_volatile_read8-0x4
2fab     2fab:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 2fb2 <shrink_node+0x2fb2>	2fae: R_X86_64_PC32	vm_node_stat+0xc
2fb2     2fb2:	48 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%rdi
2fb9     2fb9:	48 89 de             	mov    %rbx,%rsi
2fbc     2fbc:	e8 00 00 00 00       	call   2fc1 <shrink_node+0x2fc1>	2fbd: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
2fc1     2fc1:	48 85 db             	test   %rbx,%rbx
2fc4     2fc4:	78 0e                	js     2fd4 <shrink_node+0x2fd4>
2fc6     2fc6:	e8 00 00 00 00       	call   2fcb <shrink_node+0x2fcb>	2fc7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2fcb     2fcb:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	2fce: R_X86_64_32S	_ftrace_branch+0x877f8
2fd2     2fd2:	eb 0e                	jmp    2fe2 <shrink_node+0x2fe2>
2fd4     2fd4:	e8 00 00 00 00       	call   2fd9 <shrink_node+0x2fd9>	2fd5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2fd9     2fd9:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	2fdc: R_X86_64_32S	_ftrace_branch+0x87800
2fe0     2fe0:	31 db                	xor    %ebx,%ebx
2fe2     2fe2:	4d 8b 3e             	mov    (%r14),%r15
2fe5     2fe5:	4c 89 f7             	mov    %r14,%rdi
2fe8     2fe8:	49 ff c7             	inc    %r15
2feb     2feb:	e8 00 00 00 00       	call   2ff0 <shrink_node+0x2ff0>	2fec: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
2ff0     2ff0:	be 08 00 00 00       	mov    $0x8,%esi
2ff5     2ff5:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2ff8: R_X86_64_32S	nr_swap_pages
2ffc     2ffc:	ba 04 00 00 00       	mov    $0x4,%edx
3001     3001:	4d 89 3e             	mov    %r15,(%r14)
3004     3004:	e8 00 00 00 00       	call   3009 <shrink_node+0x3009>	3005: R_X86_64_PLT32	__kcsan_check_access-0x4
3009     3009:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	300c: R_X86_64_32S	nr_swap_pages
3010     3010:	e8 00 00 00 00       	call   3015 <shrink_node+0x3015>	3011: R_X86_64_PLT32	__tsan_volatile_read8-0x4
3015     3015:	4c 8b 35 00 00 00 00 	mov    0x0(%rip),%r14        # 301c <shrink_node+0x301c>	3018: R_X86_64_PC32	nr_swap_pages-0x4
301c     301c:	31 ff                	xor    %edi,%edi
301e     301e:	4c 89 f6             	mov    %r14,%rsi
3021     3021:	e8 00 00 00 00       	call   3026 <shrink_node+0x3026>	3022: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
3026     3026:	4d 85 f6             	test   %r14,%r14
3029     3029:	49 c7 c7 00 00 00 00 	mov    $0x0,%r15	302c: R_X86_64_32S	_ftrace_branch+0x877e8
3030     3030:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	3033: R_X86_64_32S	_ftrace_branch+0x877f0
3037     3037:	4c 0f 4f f8          	cmovg  %rax,%r15
303b     303b:	4d 8b 2f             	mov    (%r15),%r13
303e     303e:	4c 89 ff             	mov    %r15,%rdi
3041     3041:	49 ff c5             	inc    %r13
3044     3044:	e8 00 00 00 00       	call   3049 <shrink_node+0x3049>	3045: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
3049     3049:	4d 85 f6             	test   %r14,%r14
304c     304c:	4d 89 2f             	mov    %r13,(%r15)
304f     304f:	7e 68                	jle    30b9 <shrink_node+0x30b9>
3051     3051:	4c 8b 35 00 00 00 00 	mov    0x0(%rip),%r14        # 3058 <shrink_node+0x3058>	3054: R_X86_64_PC32	_ftrace_branch+0x88aac
3058     3058:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	305b: R_X86_64_32S	_ftrace_branch+0x88ab0
305f     305f:	49 ff c6             	inc    %r14
3062     3062:	e8 00 00 00 00       	call   3067 <shrink_node+0x3067>	3063: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
3067     3067:	be 08 00 00 00       	mov    $0x8,%esi
306c     306c:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	306f: R_X86_64_32S	vm_node_stat
3073     3073:	ba 04 00 00 00       	mov    $0x4,%edx
3078     3078:	4c 89 35 00 00 00 00 	mov    %r14,0x0(%rip)        # 307f <shrink_node+0x307f>	307b: R_X86_64_PC32	_ftrace_branch+0x88aac
307f     307f:	e8 00 00 00 00       	call   3084 <shrink_node+0x3084>	3080: R_X86_64_PLT32	__kcsan_check_access-0x4
3084     3084:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	3087: R_X86_64_32S	vm_node_stat
308b     308b:	e8 00 00 00 00       	call   3090 <shrink_node+0x3090>	308c: R_X86_64_PLT32	__tsan_volatile_read8-0x4
3090     3090:	4c 8b 35 00 00 00 00 	mov    0x0(%rip),%r14        # 3097 <shrink_node+0x3097>	3093: R_X86_64_PC32	vm_node_stat-0x4
3097     3097:	48 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%rdi
309e     309e:	4c 89 f6             	mov    %r14,%rsi
30a1     30a1:	e8 00 00 00 00       	call   30a6 <shrink_node+0x30a6>	30a2: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
30a6     30a6:	4d 85 f6             	test   %r14,%r14
30a9     30a9:	78 71                	js     311c <shrink_node+0x311c>
30ab     30ab:	e8 00 00 00 00       	call   30b0 <shrink_node+0x30b0>	30ac: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
30b0     30b0:	49 c7 c7 00 00 00 00 	mov    $0x0,%r15	30b3: R_X86_64_32S	_ftrace_branch+0x877f8
30b7     30b7:	eb 72                	jmp    312b <shrink_node+0x312b>
30b9     30b9:	e8 00 00 00 00       	call   30be <shrink_node+0x30be>	30ba: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
30be     30be:	4c 8b 35 00 00 00 00 	mov    0x0(%rip),%r14        # 30c5 <shrink_node+0x30c5>	30c1: R_X86_64_PC32	_ftrace_branch+0x88aa4
30c5     30c5:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	30c8: R_X86_64_32S	_ftrace_branch+0x88aa8
30cc     30cc:	49 ff c6             	inc    %r14
30cf     30cf:	e8 00 00 00 00       	call   30d4 <shrink_node+0x30d4>	30d0: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
30d4     30d4:	4c 89 35 00 00 00 00 	mov    %r14,0x0(%rip)        # 30db <shrink_node+0x30db>	30d7: R_X86_64_PC32	_ftrace_branch+0x88aa4
30db     30db:	eb 62                	jmp    313f <shrink_node+0x313f>
30dd     30dd:	e8 00 00 00 00       	call   30e2 <shrink_node+0x30e2>	30de: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
30e2     30e2:	4c 8b 35 00 00 00 00 	mov    0x0(%rip),%r14        # 30e9 <shrink_node+0x30e9>	30e5: R_X86_64_PC32	_ftrace_branch+0x8843c
30e9     30e9:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	30ec: R_X86_64_32S	_ftrace_branch+0x88440
30f0     30f0:	49 ff c6             	inc    %r14
30f3     30f3:	e8 00 00 00 00       	call   30f8 <shrink_node+0x30f8>	30f4: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
30f8     30f8:	be 08 00 00 00       	mov    $0x8,%esi
30fd     30fd:	4c 89 e7             	mov    %r12,%rdi
3100     3100:	ba 05 00 00 00       	mov    $0x5,%edx
3105     3105:	4c 89 35 00 00 00 00 	mov    %r14,0x0(%rip)        # 310c <shrink_node+0x310c>	3108: R_X86_64_PC32	_ftrace_branch+0x8843c
310c     310c:	e8 00 00 00 00       	call   3111 <shrink_node+0x3111>	310d: R_X86_64_PLT32	__kcsan_check_access-0x4
3111     3111:	f0 41 80 0c 24 02    	lock orb $0x2,(%r12)
3117     3117:	e9 9c fa ff ff       	jmp    2bb8 <shrink_node+0x2bb8>
311c     311c:	e8 00 00 00 00       	call   3121 <shrink_node+0x3121>	311d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3121     3121:	49 c7 c7 00 00 00 00 	mov    $0x0,%r15	3124: R_X86_64_32S	_ftrace_branch+0x87800
3128     3128:	45 31 f6             	xor    %r14d,%r14d
312b     312b:	4d 8b 2f             	mov    (%r15),%r13
312e     312e:	4c 89 ff             	mov    %r15,%rdi
3131     3131:	49 ff c5             	inc    %r13
3134     3134:	e8 00 00 00 00       	call   3139 <shrink_node+0x3139>	3135: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
3139     3139:	4c 01 f3             	add    %r14,%rbx
313c     313c:	4d 89 2f             	mov    %r13,(%r15)
313f     313f:	4c 8b 6c 24 68       	mov    0x68(%rsp),%r13
3144     3144:	4c 39 e3             	cmp    %r12,%rbx
3147     3147:	0f 86 9f 01 00 00    	jbe    32ec <shrink_node+0x32ec>
314d     314d:	e8 00 00 00 00       	call   3152 <shrink_node+0x3152>	314e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3152     3152:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 3159 <shrink_node+0x3159>	3155: R_X86_64_PC32	_ftrace_branch+0x8845c
3159     3159:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	315c: R_X86_64_32S	_ftrace_branch+0x88460
3160     3160:	48 ff c3             	inc    %rbx
3163     3163:	e8 00 00 00 00       	call   3168 <shrink_node+0x3168>	3164: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
3168     3168:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 316f <shrink_node+0x316f>	316b: R_X86_64_PC32	_ftrace_branch+0x8845c
316f     316f:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
3174     3174:	48 8b bc 24 98 00 00 00 	mov    0x98(%rsp),%rdi
317c     317c:	48 8b 5c 24 60       	mov    0x60(%rsp),%rbx
3181     3181:	4c 8b bc 24 68 01 00 00 	mov    0x168(%rsp),%r15
3189     3189:	4c 8b a4 24 60 01 00 00 	mov    0x160(%rsp),%r12
3191     3191:	e9 29 d0 ff ff       	jmp    1bf <shrink_node+0x1bf>
3196     3196:	e8 00 00 00 00       	call   319b <shrink_node+0x319b>	3197: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
319b     319b:	eb 33                	jmp    31d0 <shrink_node+0x31d0>
319d     319d:	e8 00 00 00 00       	call   31a2 <shrink_node+0x31a2>	319e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
31a2     31a2:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 31a9 <shrink_node+0x31a9>	31a5: R_X86_64_PC32	_ftrace_branch+0x885ac
31a9     31a9:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	31ac: R_X86_64_32S	_ftrace_branch+0x885b0
31b0     31b0:	48 ff c3             	inc    %rbx
31b3     31b3:	e8 00 00 00 00       	call   31b8 <shrink_node+0x31b8>	31b4: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
31b8     31b8:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 31bf <shrink_node+0x31bf>	31bb: R_X86_64_PC32	_ftrace_branch+0x885ac
31bf     31bf:	b8 02 00 00 00       	mov    $0x2,%eax
31c4     31c4:	31 c9                	xor    %ecx,%ecx
31c6     31c6:	e9 d3 d9 ff ff       	jmp    b9e <shrink_node+0xb9e>
31cb     31cb:	e8 00 00 00 00       	call   31d0 <shrink_node+0x31d0>	31cc: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
31d0     31d0:	4c 8b 35 00 00 00 00 	mov    0x0(%rip),%r14        # 31d7 <shrink_node+0x31d7>	31d3: R_X86_64_PC32	_ftrace_branch+0x8844c
31d7     31d7:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	31da: R_X86_64_32S	_ftrace_branch+0x88450
31de     31de:	4c 8b 7c 24 40       	mov    0x40(%rsp),%r15
31e3     31e3:	49 ff c6             	inc    %r14
31e6     31e6:	e8 00 00 00 00       	call   31eb <shrink_node+0x31eb>	31e7: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
31eb     31eb:	48 8b 7c 24 58       	mov    0x58(%rsp),%rdi
31f0     31f0:	be 03 00 00 00       	mov    $0x3,%esi
31f5     31f5:	4c 89 35 00 00 00 00 	mov    %r14,0x0(%rip)        # 31fc <shrink_node+0x31fc>	31f8: R_X86_64_PC32	_ftrace_branch+0x8844c
31fc     31fc:	e8 00 00 00 00       	call   3201 <shrink_node+0x3201>	31fd: R_X86_64_PLT32	reclaim_throttle-0x4
3201     3201:	e9 a8 fa ff ff       	jmp    2cae <shrink_node+0x2cae>
3206     3206:	e8 00 00 00 00       	call   320b <shrink_node+0x320b>	3207: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
320b     320b:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 3212 <shrink_node+0x3212>	320e: R_X86_64_PC32	_ftrace_branch+0x885bc
3212     3212:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	3215: R_X86_64_32S	_ftrace_branch+0x885c0
3219     3219:	48 ff c3             	inc    %rbx
321c     321c:	e8 00 00 00 00       	call   3221 <shrink_node+0x3221>	321d: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
3221     3221:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 3228 <shrink_node+0x3228>	3224: R_X86_64_PC32	_ftrace_branch+0x885bc
3228     3228:	e9 67 d9 ff ff       	jmp    b94 <shrink_node+0xb94>
322d     322d:	e8 00 00 00 00       	call   3232 <shrink_node+0x3232>	322e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3232     3232:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	3235: R_X86_64_32S	.data..Lanon.bd2167bd7cc052698832bf453910f546.7
3239     3239:	48 89 de             	mov    %rbx,%rsi
323c     323c:	4c 89 f2             	mov    %r14,%rdx
323f     323f:	e8 00 00 00 00       	call   3244 <shrink_node+0x3244>	3240: R_X86_64_PLT32	__ubsan_handle_shift_out_of_bounds-0x4
3244     3244:	e9 30 d3 ff ff       	jmp    579 <shrink_node+0x579>
3249     3249:	e8 00 00 00 00       	call   324e <shrink_node+0x324e>	324a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
324e     324e:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	3251: R_X86_64_32S	.data..Lanon.bd2167bd7cc052698832bf453910f546.9
3255     3255:	48 89 de             	mov    %rbx,%rsi
3258     3258:	4c 89 f2             	mov    %r14,%rdx
325b     325b:	e8 00 00 00 00       	call   3260 <shrink_node+0x3260>	325c: R_X86_64_PLT32	__ubsan_handle_shift_out_of_bounds-0x4
3260     3260:	e9 7c d3 ff ff       	jmp    5e1 <shrink_node+0x5e1>
3265     3265:	e8 00 00 00 00       	call   326a <shrink_node+0x326a>	3266: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
326a     326a:	be 02 00 00 00       	mov    $0x2,%esi
326f     326f:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	3272: R_X86_64_32S	.data..Lanon.bd2167bd7cc052698832bf453910f546.6
3276     3276:	48 89 da             	mov    %rbx,%rdx
3279     3279:	e8 00 00 00 00       	call   327e <shrink_node+0x327e>	327a: R_X86_64_PLT32	__ubsan_handle_shift_out_of_bounds-0x4
327e     327e:	e9 fb fc ff ff       	jmp    2f7e <shrink_node+0x2f7e>
3283     3283:	e8 00 00 00 00       	call   3288 <shrink_node+0x3288>	3284: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3288     3288:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	328b: R_X86_64_32S	.data..Lanon.bd2167bd7cc052698832bf453910f546.10
328f     328f:	4c 89 ee             	mov    %r13,%rsi
3292     3292:	48 89 da             	mov    %rbx,%rdx
3295     3295:	e8 00 00 00 00       	call   329a <shrink_node+0x329a>	3296: R_X86_64_PLT32	__ubsan_handle_shift_out_of_bounds-0x4
329a     329a:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
329f     329f:	44 0f b6 78 2a       	movzbl 0x2a(%rax),%r15d
32a4     32a4:	0f b7 40 28          	movzwl 0x28(%rax),%eax
32a8     32a8:	41 c1 e7 10          	shl    $0x10,%r15d
32ac     32ac:	41 09 c7             	or     %eax,%r15d
32af     32af:	e9 ba d6 ff ff       	jmp    96e <shrink_node+0x96e>
32b4     32b4:	e8 00 00 00 00       	call   32b9 <shrink_node+0x32b9>	32b5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
32b9     32b9:	48 c7 c3 00 00 00 00 	mov    $0x0,%rbx	32bc: R_X86_64_32S	_ftrace_branch+0x88a90
32c0     32c0:	eb 5a                	jmp    331c <shrink_node+0x331c>
32c2     32c2:	e8 00 00 00 00       	call   32c7 <shrink_node+0x32c7>	32c3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
32c7     32c7:	48 c7 c3 00 00 00 00 	mov    $0x0,%rbx	32ca: R_X86_64_32S	_ftrace_branch+0x88aa0
32ce     32ce:	eb 4c                	jmp    331c <shrink_node+0x331c>
32d0     32d0:	e8 00 00 00 00       	call   32d5 <shrink_node+0x32d5>	32d1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
32d5     32d5:	eb 21                	jmp    32f8 <shrink_node+0x32f8>
32d7     32d7:	e8 00 00 00 00       	call   32dc <shrink_node+0x32dc>	32d8: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
32dc     32dc:	eb 1a                	jmp    32f8 <shrink_node+0x32f8>
32de     32de:	e8 00 00 00 00       	call   32e3 <shrink_node+0x32e3>	32df: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
32e3     32e3:	48 c7 c3 00 00 00 00 	mov    $0x0,%rbx	32e6: R_X86_64_32S	_ftrace_branch+0x88a70
32ea     32ea:	eb 30                	jmp    331c <shrink_node+0x331c>
32ec     32ec:	e8 00 00 00 00       	call   32f1 <shrink_node+0x32f1>	32ed: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
32f1     32f1:	eb 3a                	jmp    332d <shrink_node+0x332d>
32f3     32f3:	e8 00 00 00 00       	call   32f8 <shrink_node+0x32f8>	32f4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
32f8     32f8:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 32ff <shrink_node+0x32ff>	32fb: R_X86_64_PC32	_ftrace_branch+0x88ab4
32ff     32ff:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	3302: R_X86_64_32S	_ftrace_branch+0x88ab8
3306     3306:	48 ff c3             	inc    %rbx
3309     3309:	e8 00 00 00 00       	call   330e <shrink_node+0x330e>	330a: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
330e     330e:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 3315 <shrink_node+0x3315>	3311: R_X86_64_PC32	_ftrace_branch+0x88ab4
3315     3315:	48 c7 c3 00 00 00 00 	mov    $0x0,%rbx	3318: R_X86_64_32S	_ftrace_branch+0x88a60
331c     331c:	4c 8b 33             	mov    (%rbx),%r14
331f     331f:	48 89 df             	mov    %rbx,%rdi
3322     3322:	49 ff c6             	inc    %r14
3325     3325:	e8 00 00 00 00       	call   332a <shrink_node+0x332a>	3326: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
332a     332a:	4c 89 33             	mov    %r14,(%rbx)
332d     332d:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 3334 <shrink_node+0x3334>	3330: R_X86_64_PC32	_ftrace_branch+0x88454
3334     3334:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	3337: R_X86_64_32S	_ftrace_branch+0x88458
333b     333b:	48 ff c3             	inc    %rbx
333e     333e:	e8 00 00 00 00       	call   3343 <shrink_node+0x3343>	333f: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
3343     3343:	48 8b 84 24 e8 00 00 00 	mov    0xe8(%rsp),%rax
334b     334b:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 3352 <shrink_node+0x3352>	334e: R_X86_64_PC32	_ftrace_branch+0x88454
3352     3352:	31 ff                	xor    %edi,%edi
3354     3354:	24 01                	and    $0x1,%al
3356     3356:	0f b6 d8             	movzbl %al,%ebx
3359     3359:	89 de                	mov    %ebx,%esi
335b     335b:	e8 00 00 00 00       	call   3360 <shrink_node+0x3360>	335c: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
3360     3360:	84 db                	test   %bl,%bl
3362     3362:	75 5e                	jne    33c2 <shrink_node+0x33c2>
3364     3364:	e8 00 00 00 00       	call   3369 <shrink_node+0x3369>	3365: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3369     3369:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 3370 <shrink_node+0x3370>	336c: R_X86_64_PC32	_ftrace_branch+0x88464
3370     3370:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	3373: R_X86_64_32S	_ftrace_branch+0x88468
3377     3377:	48 ff c3             	inc    %rbx
337a     337a:	e8 00 00 00 00       	call   337f <shrink_node+0x337f>	337b: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
337f     337f:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 3386 <shrink_node+0x3386>	3382: R_X86_64_PC32	_ftrace_branch+0x88464
3386     3386:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
338b     338b:	0f b6 59 2a          	movzbl 0x2a(%rcx),%ebx
338f     338f:	0f b7 41 28          	movzwl 0x28(%rcx),%eax
3393     3393:	c1 e3 10             	shl    $0x10,%ebx
3396     3396:	09 c3                	or     %eax,%ebx
3398     3398:	0f ba e3 0e          	bt     $0xe,%ebx
339c     339c:	72 63                	jb     3401 <shrink_node+0x3401>
339e     339e:	e8 00 00 00 00       	call   33a3 <shrink_node+0x33a3>	339f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
33a3     33a3:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 33aa <shrink_node+0x33aa>	33a6: R_X86_64_PC32	_ftrace_branch+0x88474
33aa     33aa:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	33ad: R_X86_64_32S	_ftrace_branch+0x88478
33b1     33b1:	48 ff c3             	inc    %rbx
33b4     33b4:	e8 00 00 00 00       	call   33b9 <shrink_node+0x33b9>	33b5: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
33b9     33b9:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 33c0 <shrink_node+0x33c0>	33bc: R_X86_64_PC32	_ftrace_branch+0x88474
33c0     33c0:	eb 77                	jmp    3439 <shrink_node+0x3439>
33c2     33c2:	e8 00 00 00 00       	call   33c7 <shrink_node+0x33c7>	33c3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
33c7     33c7:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 33ce <shrink_node+0x33ce>	33ca: R_X86_64_PC32	_ftrace_branch+0x8846c
33ce     33ce:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	33d1: R_X86_64_32S	_ftrace_branch+0x88470
33d5     33d5:	48 ff c3             	inc    %rbx
33d8     33d8:	e8 00 00 00 00       	call   33dd <shrink_node+0x33dd>	33d9: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
33dd     33dd:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 33e4 <shrink_node+0x33e4>	33e0: R_X86_64_PC32	_ftrace_branch+0x8846c
33e4     33e4:	48 8b 5c 24 58       	mov    0x58(%rsp),%rbx
33e9     33e9:	48 8d bb 90 20 00 00 	lea    0x2090(%rbx),%rdi
33f0     33f0:	e8 00 00 00 00       	call   33f5 <shrink_node+0x33f5>	33f1: R_X86_64_PLT32	__tsan_write4-0x4
33f5     33f5:	c7 83 90 20 00 00 00 00 00 00 	movl   $0x0,0x2090(%rbx)
33ff     33ff:	eb 38                	jmp    3439 <shrink_node+0x3439>
3401     3401:	49 89 cf             	mov    %rcx,%r15
3404     3404:	e8 00 00 00 00       	call   3409 <shrink_node+0x3409>	3405: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3409     3409:	4c 8b 35 00 00 00 00 	mov    0x0(%rip),%r14        # 3410 <shrink_node+0x3410>	340c: R_X86_64_PC32	_ftrace_branch+0x8847c
3410     3410:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	3413: R_X86_64_32S	_ftrace_branch+0x88480
3417     3417:	49 ff c6             	inc    %r14
341a     341a:	e8 00 00 00 00       	call   341f <shrink_node+0x341f>	341b: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
341f     341f:	89 d8                	mov    %ebx,%eax
3421     3421:	c1 eb 10             	shr    $0x10,%ebx
3424     3424:	4c 89 35 00 00 00 00 	mov    %r14,0x0(%rip)        # 342b <shrink_node+0x342b>	3427: R_X86_64_PC32	_ftrace_branch+0x8847c
342b     342b:	0d 00 01 00 00       	or     $0x100,%eax
3430     3430:	41 88 5f 2a          	mov    %bl,0x2a(%r15)
3434     3434:	66 41 89 47 28       	mov    %ax,0x28(%r15)
3439     3439:	e8 00 00 00 00       	call   343e <shrink_node+0x343e>	343a: R_X86_64_PLT32	__tsan_func_exit-0x4
343e     343e:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
3442     3442:	5b                   	pop    %rbx
3443     3443:	41 5c                	pop    %r12
3445     3445:	41 5d                	pop    %r13
3447     3447:	41 5e                	pop    %r14
3449     3449:	41 5f                	pop    %r15
344b     344b:	5d                   	pop    %rbp
344c     344c:	31 c0                	xor    %eax,%eax
344e     344e:	31 c9                	xor    %ecx,%ecx
3450     3450:	31 ff                	xor    %edi,%edi
3452     3452:	31 d2                	xor    %edx,%edx
3454     3454:	31 f6                	xor    %esi,%esi
3456     3456:	45 31 c0             	xor    %r8d,%r8d
3459     3459:	45 31 c9             	xor    %r9d,%r9d
345c     345c:	45 31 d2             	xor    %r10d,%r10d
345f     345f:	c3                   	ret

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
