Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC8AA20;
	Fri, 23 Jun 2023 03:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687490578; x=1719026578;
  h=date:from:cc:subject:message-id:mime-version;
  bh=6v6yRKCesVGWmPSojJsfdoCFC3r8AKR3D195OH8TMJA=;
  b=AnI50YeC+DTyt04H6cQU21O5mj3nsGH2Xi7CQFb28vhKWkt7+BRFsUeE
   cAz1T2LFcBKQDH9azObPeRm8bogsKDrCRGmXP5mBH8CicMGVJa7pFjD+9
   0qNXxGQOsACnbjjfWgzOAftYC82CiquHZrEoxLKiwxbnjzS0MTDmXH/H8
   /yxepDo+jZfqHQ8jwzksMr5uSc2ue7BF+H84S/hUZ9kmPh6ZRZ32WPdOv
   oEJo59Z7of0LEvSIAkUhMwZNBGp0VchQdkmpogXuxUyn2h+GKfywHeUSZ
   lMfcPntFd6MTQq0R/f5FRDGdV2k7DMREz4eUf9EwphRbEVmIY6gGFTsno
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="341012442"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; 
   d="scan'208";a="341012442"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 20:22:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="1045490661"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; 
   d="scan'208";a="1045490661"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 22 Jun 2023 20:22:55 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCXNu-0007xL-2f;
	Fri, 23 Jun 2023 03:22:54 +0000
Date: Fri, 23 Jun 2023 11:21:54 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: intel_idle_ibrs+0x13: call to
 sched_smt_active() leaves .noinstr.text section
Message-ID: <202306231129.KiH6GlC2-lkp@intel.com>
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
head:   dad9774deaf1cf8e8f7483310dfb2690310193d2
commit: 2b5a0e425e6e319b1978db1e9564f6af4228a567 objtool/idle: Validate __cpuidle code as noinstr
date:   5 months ago
config: x86_64-buildonly-randconfig-r002-20230622 (https://download.01.org/0day-ci/archive/20230623/202306231129.KiH6GlC2-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230623/202306231129.KiH6GlC2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306231129.KiH6GlC2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: handle_bug+0x8: call to kmsan_unpoison_entry_regs() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret+0x8c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: noist_exc_debug+0x5c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi+0x16f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: poke_int3_handler+0x5e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_machine_check+0x3e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_machine_check+0x97: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_check_crashing_cpu+0x26: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __sev_es_ist_exit+0x48: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __sev_get_ghcb+0x3a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __sev_put_ghcb+0x38: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: kernel_exc_vmm_communication+0xee: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: enter_from_user_mode+0x68: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode+0x70: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare+0x68: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter_from_user_mode+0x68: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter+0x3d: call to lockdep_hardirqs_off() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_exit+0x53: call to lockdep_hardirqs_on() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_enter+0x4e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_exit+0x25: call to lockdep_hardirqs_on() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_exit_state+0x35: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_nmi_enter+0x2e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_enter_state+0x37: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_idle_enter+0x39: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_exit+0x49: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_idle_exit+0x7c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_enter+0x49: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __ct_user_enter+0x31: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: context_tracking_recursion_enter+0x38: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: check_preemption_disabled+0x2d: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mwait_idle+0x5: call to current_set_polling_and_test() leaves .noinstr.text section
   vmlinux.o: warning: objtool: cpu_idle_poll+0x4f: call to test_ti_thread_flag() leaves .noinstr.text section
   vmlinux.o: warning: objtool: intel_idle+0x2ad: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: intel_idle_s2idle+0x2af: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: intel_idle_irq+0x2cb: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: intel_idle_ibrs+0x13: call to sched_smt_active() leaves .noinstr.text section
   vmlinux.o: warning: objtool: intel_idle_xstate+0x13: call to fpu_idle_fpregs() leaves .noinstr.text section


objdump-func vmlinux.o intel_idle_ibrs:
0000 0000000000000b40 <intel_idle_ibrs>:
0000      b40:	55                   	push   %rbp
0001      b41:	48 89 e5             	mov    %rsp,%rbp
0004      b44:	41 57                	push   %r15
0006      b46:	41 56                	push   %r14
0008      b48:	41 55                	push   %r13
000a      b4a:	41 54                	push   %r12
000c      b4c:	53                   	push   %rbx
000d      b4d:	41 89 d7             	mov    %edx,%r15d
0010      b50:	48 89 f3             	mov    %rsi,%rbx
0013      b53:	e8 00 00 00 00       	call   b58 <intel_idle_ibrs+0x18>	b54: R_X86_64_PLT32	.text+0x303a1fc
0018      b58:	e8 00 00 00 00       	call   b5d <intel_idle_ibrs+0x1d>	b59: R_X86_64_PLT32	spec_ctrl_current-0x4
001d      b5d:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # b64 <intel_idle_ibrs+0x24>	b60: R_X86_64_PC32	.bss+0x786d9c
0024      b64:	49 63 c7             	movslq %r15d,%rax
0027      b67:	48 6b c0 68          	imul   $0x68,%rax,%rax
002b      b6b:	44 0f b6 74 03 5b    	movzbl 0x5b(%rbx,%rax,1),%r14d
0031      b71:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # b78 <intel_idle_ibrs+0x38>	b74: R_X86_64_PC32	.bss+0x786dac
0038      b78:	e9 00 00 00 00       	jmp    b7d <intel_idle_ibrs+0x3d>	b79: R_X86_64_PLT32	.altinstr_aux+0xe0c
003d      b7d:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # b84 <intel_idle_ibrs+0x44>	b80: R_X86_64_PC32	.bss+0x786dec
0044      b84:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # b8b <intel_idle_ibrs+0x4b>	b87: R_X86_64_PC32	.bss+0x786df4
004b      b8b:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # b92 <intel_idle_ibrs+0x52>	b8e: R_X86_64_PC32	.bss+0x786dc4
0052      b92:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	b95: R_X86_64_32S	.bss+0x786e00
0059      b99:	e9 00 00 00 00       	jmp    b9e <intel_idle_ibrs+0x5e>	b9a: R_X86_64_PLT32	.altinstr_aux+0xe1e
005e      b9e:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # ba5 <intel_idle_ibrs+0x65>	ba1: R_X86_64_PC32	.bss+0x786dec
0065      ba5:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # bac <intel_idle_ibrs+0x6c>	ba8: R_X86_64_PC32	.bss+0x786df4
006c      bac:	0f ae f0             	mfence
006f      baf:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # bb6 <intel_idle_ibrs+0x76>	bb2: R_X86_64_PC32	.bss+0x786e14
0076      bb6:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # bbd <intel_idle_ibrs+0x7d>	bb9: R_X86_64_PC32	.bss+0x786e0c
007d      bbd:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # bc4 <intel_idle_ibrs+0x84>	bc0: R_X86_64_PC32	pcpu_hot-0x4
0084      bc4:	0f ae 38             	clflush (%rax)
0087      bc7:	0f ae f0             	mfence
008a      bca:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	bcd: R_X86_64_32S	.bss+0x786de0
0091      bd1:	48 ff 00             	incq   (%rax)
0094      bd4:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # bdb <intel_idle_ibrs+0x9b>	bd7: R_X86_64_PC32	.bss+0x786e14
009b      bdb:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # be2 <intel_idle_ibrs+0xa2>	bde: R_X86_64_PC32	.bss+0x786e1c
00a2      be2:	4c 8b 2d 00 00 00 00 	mov    0x0(%rip),%r13        # be9 <intel_idle_ibrs+0xa9>	be5: R_X86_64_PC32	pcpu_hot-0x4
00a9      be9:	4c 89 e8             	mov    %r13,%rax
00ac      bec:	31 c9                	xor    %ecx,%ecx
00ae      bee:	31 d2                	xor    %edx,%edx
00b0      bf0:	0f 01 c8             	monitor %rax,%ecx,%edx
00b3      bf3:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # bfa <intel_idle_ibrs+0xba>	bf6: R_X86_64_PC32	.bss+0x786e24
00ba      bfa:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # c01 <intel_idle_ibrs+0xc1>	bfd: R_X86_64_PC32	.bss+0x786e14
00c1      c01:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # c08 <intel_idle_ibrs+0xc8>	c04: R_X86_64_PC32	.bss+0x786e4c
00c8      c08:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # c0f <intel_idle_ibrs+0xcf>	c0b: R_X86_64_PC32	.bss+0x786e6c
00cf      c0f:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # c16 <intel_idle_ibrs+0xd6>	c12: R_X86_64_PC32	.bss+0x786eb4
00d6      c16:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # c1d <intel_idle_ibrs+0xdd>	c19: R_X86_64_PC32	.bss+0x786ebc
00dd      c1d:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # c24 <intel_idle_ibrs+0xe4>	c20: R_X86_64_PC32	.bss+0x786ec4
00e4      c24:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # c2b <intel_idle_ibrs+0xeb>	c27: R_X86_64_PC32	.bss+0x786ea4
00eb      c2b:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # c32 <intel_idle_ibrs+0xf2>	c2e: R_X86_64_PC32	.bss+0x786d1c
00f2      c32:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # c39 <intel_idle_ibrs+0xf9>	c35: R_X86_64_PC32	.bss+0x786f24
00f9      c39:	49 8b 5d 00          	mov    0x0(%r13),%rbx
00fd      c3d:	83 e3 08             	and    $0x8,%ebx
0100      c40:	48 c1 eb 03          	shr    $0x3,%rbx
0104      c44:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	c47: R_X86_64_32S	_ftrace_annotated_branch+0x8e4a0
010b      c4b:	89 de                	mov    %ebx,%esi
010d      c4d:	31 d2                	xor    %edx,%edx
010f      c4f:	31 c9                	xor    %ecx,%ecx
0111      c51:	e8 00 00 00 00       	call   c56 <intel_idle_ibrs+0x116>	c52: R_X86_64_PLT32	ftrace_likely_update-0x4
0116      c56:	48 85 db             	test   %rbx,%rbx
0119      c59:	75 41                	jne    c9c <intel_idle_ibrs+0x15c>
011b      c5b:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # c62 <intel_idle_ibrs+0x122>	c5e: R_X86_64_PC32	.bss+0x786de4
0122      c62:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # c69 <intel_idle_ibrs+0x129>	c65: R_X86_64_PC32	.bss+0x786e2c
0129      c69:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # c70 <intel_idle_ibrs+0x130>	c6c: R_X86_64_PC32	.bss+0x786ecc
0130      c70:	e9 98 01 00 00       	jmp    e0d <intel_idle_ibrs+0x2cd>
0135      c75:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # c7c <intel_idle_ibrs+0x13c>	c78: R_X86_64_PC32	.bss+0x786edc
013c      c7c:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # c83 <intel_idle_ibrs+0x143>	c7f: R_X86_64_PC32	.bss+0x786ed4
0143      c83:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # c8a <intel_idle_ibrs+0x14a>	c86: R_X86_64_PC32	.bss+0x786eec
014a      c8a:	0f 00 2d 00 00 00 00 	verw   0x0(%rip)        # c91 <intel_idle_ibrs+0x151>	c8d: R_X86_64_PC32	.rodata+0x70b30a
0151      c91:	b9 01 00 00 00       	mov    $0x1,%ecx
0156      c96:	4c 89 f0             	mov    %r14,%rax
0159      c99:	0f 01 c9             	mwait  %eax,%ecx
015c      c9c:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # ca3 <intel_idle_ibrs+0x163>	c9f: R_X86_64_PC32	.bss+0x786e34
0163      ca3:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # caa <intel_idle_ibrs+0x16a>	ca6: R_X86_64_PC32	.bss+0x786ef4
016a      caa:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # cb1 <intel_idle_ibrs+0x171>	cad: R_X86_64_PC32	.bss+0x786e14
0171      cb1:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # cb8 <intel_idle_ibrs+0x178>	cb4: R_X86_64_PC32	.bss+0x786f04
0178      cb8:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # cbf <intel_idle_ibrs+0x17f>	cbb: R_X86_64_PC32	.bss+0x786f0c
017f      cbf:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # cc6 <intel_idle_ibrs+0x186>	cc2: R_X86_64_PC32	.bss+0x786e84
0186      cc6:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # ccd <intel_idle_ibrs+0x18d>	cc9: R_X86_64_PC32	.bss+0x786e9c
018d      ccd:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # cd4 <intel_idle_ibrs+0x194>	cd0: R_X86_64_PC32	.bss+0x786ea4
0194      cd4:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # cdb <intel_idle_ibrs+0x19b>	cd7: R_X86_64_PC32	.bss+0x786f14
019b      cdb:	41 80 65 02 df       	andb   $0xdf,0x2(%r13)
01a0      ce0:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # ce7 <intel_idle_ibrs+0x1a7>	ce3: R_X86_64_PC32	.bss+0x786e14
01a7      ce7:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # cee <intel_idle_ibrs+0x1ae>	cea: R_X86_64_PC32	.bss+0x786e4c
01ae      cee:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # cf5 <intel_idle_ibrs+0x1b5>	cf1: R_X86_64_PC32	.bss+0x786e6c
01b5      cf5:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # cfc <intel_idle_ibrs+0x1bc>	cf8: R_X86_64_PC32	.bss+0x786eb4
01bc      cfc:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # d03 <intel_idle_ibrs+0x1c3>	cff: R_X86_64_PC32	.bss+0x786ebc
01c3      d03:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # d0a <intel_idle_ibrs+0x1ca>	d06: R_X86_64_PC32	.bss+0x786ec4
01ca      d0a:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # d11 <intel_idle_ibrs+0x1d1>	d0d: R_X86_64_PC32	.bss+0x786ea4
01d1      d11:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # d18 <intel_idle_ibrs+0x1d8>	d14: R_X86_64_PC32	.bss+0x786d1c
01d8      d18:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # d1f <intel_idle_ibrs+0x1df>	d1b: R_X86_64_PC32	.bss+0x786f24
01df      d1f:	49 f7 45 00 08 00 00 00 	testq  $0x8,0x0(%r13)
01e7      d27:	74 18                	je     d41 <intel_idle_ibrs+0x201>
01e9      d29:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # d30 <intel_idle_ibrs+0x1f0>	d2c: R_X86_64_PC32	.bss+0x786e3c
01f0      d30:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # d37 <intel_idle_ibrs+0x1f7>	d33: R_X86_64_PC32	.bss+0x786efc
01f7      d37:	81 25 00 00 00 00 ff ff ff 7f 	andl   $0x7fffffff,0x0(%rip)        # d41 <intel_idle_ibrs+0x201>	d39: R_X86_64_PC32	pcpu_hot
0201      d41:	44 89 f8             	mov    %r15d,%eax
0204      d44:	5b                   	pop    %rbx
0205      d45:	41 5c                	pop    %r12
0207      d47:	41 5d                	pop    %r13
0209      d49:	41 5e                	pop    %r14
020b      d4b:	41 5f                	pop    %r15
020d      d4d:	5d                   	pop    %rbp
020e      d4e:	c3                   	ret
020f      d4f:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # d56 <intel_idle_ibrs+0x216>	d52: R_X86_64_PC32	.bss+0x786dfc
0216      d56:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # d5d <intel_idle_ibrs+0x21d>	d59: R_X86_64_PC32	.bss+0x786e04
021d      d5d:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # d64 <intel_idle_ibrs+0x224>	d60: R_X86_64_PC32	.bss+0x786e44
0224      d64:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # d6b <intel_idle_ibrs+0x22b>	d67: R_X86_64_PC32	.bss+0x786e14
022b      d6b:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # d72 <intel_idle_ibrs+0x232>	d6e: R_X86_64_PC32	.bss+0x786e74
0232      d72:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # d79 <intel_idle_ibrs+0x239>	d75: R_X86_64_PC32	.bss+0x786e7c
0239      d79:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # d80 <intel_idle_ibrs+0x240>	d7c: R_X86_64_PC32	.bss+0x786e84
0240      d80:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # d87 <intel_idle_ibrs+0x247>	d83: R_X86_64_PC32	.bss+0x786e9c
0247      d87:	4c 8b 2d 00 00 00 00 	mov    0x0(%rip),%r13        # d8e <intel_idle_ibrs+0x24e>	d8a: R_X86_64_PC32	pcpu_hot-0x4
024e      d8e:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # d95 <intel_idle_ibrs+0x255>	d91: R_X86_64_PC32	.bss+0x786ea4
0255      d95:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # d9c <intel_idle_ibrs+0x25c>	d98: R_X86_64_PC32	.bss+0x786e8c
025c      d9c:	41 80 4d 02 20       	orb    $0x20,0x2(%r13)
0261      da1:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # da8 <intel_idle_ibrs+0x268>	da4: R_X86_64_PC32	.bss+0x786e14
0268      da8:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # daf <intel_idle_ibrs+0x26f>	dab: R_X86_64_PC32	.bss+0x786e4c
026f      daf:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # db6 <intel_idle_ibrs+0x276>	db2: R_X86_64_PC32	.bss+0x786e6c
0276      db6:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # dbd <intel_idle_ibrs+0x27d>	db9: R_X86_64_PC32	.bss+0x786eb4
027d      dbd:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # dc4 <intel_idle_ibrs+0x284>	dc0: R_X86_64_PC32	.bss+0x786ebc
0284      dc4:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # dcb <intel_idle_ibrs+0x28b>	dc7: R_X86_64_PC32	.bss+0x786ec4
028b      dcb:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # dd2 <intel_idle_ibrs+0x292>	dce: R_X86_64_PC32	.bss+0x786ea4
0292      dd2:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # dd9 <intel_idle_ibrs+0x299>	dd5: R_X86_64_PC32	.bss+0x786d1c
0299      dd9:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # de0 <intel_idle_ibrs+0x2a0>	ddc: R_X86_64_PC32	.bss+0x786f24
02a0      de0:	4d 8b 65 00          	mov    0x0(%r13),%r12
02a4      de4:	41 83 e4 08          	and    $0x8,%r12d
02a8      de8:	49 c1 ec 03          	shr    $0x3,%r12
02ac      dec:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	def: R_X86_64_32S	_ftrace_annotated_branch+0x8e470
02b3      df3:	44 89 e6             	mov    %r12d,%esi
02b6      df6:	31 d2                	xor    %edx,%edx
02b8      df8:	31 c9                	xor    %ecx,%ecx
02ba      dfa:	e8 00 00 00 00       	call   dff <intel_idle_ibrs+0x2bf>	dfb: R_X86_64_PLT32	ftrace_likely_update-0x4
02bf      dff:	4d 85 e4             	test   %r12,%r12
02c2      e02:	0f 84 83 fd ff ff    	je     b8b <intel_idle_ibrs+0x4b>
02c8      e08:	e9 8f fe ff ff       	jmp    c9c <intel_idle_ibrs+0x15c>
02cd      e0d:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # e14 <intel_idle_ibrs+0x2d4>	e10: R_X86_64_PC32	.bss+0x786ee4
02d4      e14:	e9 78 fe ff ff       	jmp    c91 <intel_idle_ibrs+0x151>
02d9      e19:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
