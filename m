Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD783D60;
	Sun,  5 Mar 2023 23:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678057730; x=1709593730;
  h=date:from:cc:subject:message-id:mime-version;
  bh=ssbrPdpbgpk/99U3BjnqfA4DAdZo9qYZ7Q7zkBUYj84=;
  b=E4o6zGoyyH/Z/X2HcQseZZn23Vzsash93UQp+jgbDC5EVEyaax9vYR9u
   CQphjdPhSh0J3oBfHA9QQi+/KjyYy7QYEfJwei1Za4QVSAOnCKUDNrxJO
   scDqpFOkR+i6AmE5708ywq48+Y2/vZ1jY3ttg63Myuuv4vr1T3tEItJtS
   S9YAQP9L4Yp24gAppRxovkYjgx/mEgV4KeQM5vQ3SZbWdruY0DDfQ6nFB
   XjBc1PTfvv21IMExlCmSfO/rvVXRSxn98aaxs0jCx8ua00bpWjMtoIw/6
   gjnqcVR+rZjce+FCpl56F0GzhRV09uDBdPYQxAI8BqnSp1I5E0cXnBpCP
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="315089851"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="315089851"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2023 15:08:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="678288457"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="678288457"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 05 Mar 2023 15:08:48 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYxTE-00038s-00;
	Sun, 05 Mar 2023 23:08:48 +0000
Date: Mon, 6 Mar 2023 07:08:47 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: tdx_safe_halt+0x30: call to
 ftrace_likely_update() leaves .noinstr.text section
Message-ID: <202303060700.eybH3HNx-lkp@intel.com>
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
head:   f915322fe014c5c515119381e886faf07b3c9d31
commit: 2b5a0e425e6e319b1978db1e9564f6af4228a567 objtool/idle: Validate __cpuidle code as noinstr
date:   7 weeks ago
config: x86_64-randconfig-a011-20230306 (https://download.01.org/0day-ci/archive/20230306/202303060700.eybH3HNx-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2b5a0e425e6e319b1978db1e9564f6af4228a567
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 2b5a0e425e6e319b1978db1e9564f6af4228a567
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303060700.eybH3HNx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: tdx_safe_halt+0x30: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __halt+0x2e: call to __tdx_hypercall() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mwait_idle+0x5: call to current_set_polling_and_test() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_processor_ffh_cstate_enter+0x130: call to __kasan_check_write() leaves .noinstr.text section
   vmlinux.o: warning: objtool: cpu_idle_poll+0x8c: call to test_ti_thread_flag() leaves .noinstr.text section
   vmlinux.o: warning: objtool: intel_idle+0x114: call to __kasan_check_write() leaves .noinstr.text section
   vmlinux.o: warning: objtool: intel_idle_s2idle+0x120: call to __kasan_check_write() leaves .noinstr.text section
   vmlinux.o: warning: objtool: intel_idle_irq+0x13b: call to __kasan_check_write() leaves .noinstr.text section
   vmlinux.o: warning: objtool: intel_idle_ibrs+0x12: call to spec_ctrl_current() leaves .noinstr.text section
   vmlinux.o: warning: objtool: intel_idle_xstate+0x12: call to fpu_idle_fpregs() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __rdgsbase_inactive+0x33: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __wrgsbase_inactive+0x37: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: sync_regs+0x23: call to memcpy() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret+0x25: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: noist_exc_debug+0x45: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi+0xc9: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: poke_int3_handler+0x3b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_machine_check+0x54: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_machine_check+0x59: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_check_crashing_cpu+0x10: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: enter_from_user_mode+0x48: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode+0x51: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare+0x48: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter_from_user_mode+0x48: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_exit+0x40: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_enter+0x44: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_exit+0x4d: call to ftrace_likely_update() leaves .noinstr.text section


objdump-func vmlinux.o tdx_safe_halt:
0000 0000000000000000 <tdx_safe_halt>:
0000    0:	f3 0f 1e fa          	endbr64
0004    4:	55                   	push   %rbp
0005    5:	53                   	push   %rbx
0006    6:	31 ff                	xor    %edi,%edi
0008    8:	be 01 00 00 00       	mov    $0x1,%esi
000d    d:	e8 ae 00 00 00       	call   c0 <__halt>
0012   12:	48 85 c0             	test   %rax,%rax
0015   15:	74 31                	je     48 <tdx_safe_halt+0x48>
0017   17:	0f b6 2d 00 00 00 00 	movzbl 0x0(%rip),%ebp        # 1e <tdx_safe_halt+0x1e>	1a: R_X86_64_PC32	.data.once-0x3
001e   1e:	89 eb                	mov    %ebp,%ebx
0020   20:	83 f3 01             	xor    $0x1,%ebx
0023   23:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	26: R_X86_64_32S	_ftrace_annotated_branch+0x780
002a   2a:	89 de                	mov    %ebx,%esi
002c   2c:	31 d2                	xor    %edx,%edx
002e   2e:	31 c9                	xor    %ecx,%ecx
0030   30:	e8 00 00 00 00       	call   35 <tdx_safe_halt+0x35>	31: R_X86_64_PLT32	ftrace_likely_update-0x4
0035   35:	85 ed                	test   %ebp,%ebp
0037   37:	74 12                	je     4b <tdx_safe_halt+0x4b>
0039   39:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	3c: R_X86_64_32S	_ftrace_annotated_branch+0x7b0
0040   40:	89 de                	mov    %ebx,%esi
0042   42:	31 d2                	xor    %edx,%edx
0044   44:	31 c9                	xor    %ecx,%ecx
0046   46:	eb 59                	jmp    a1 <tdx_safe_halt+0xa1>
0048   48:	5b                   	pop    %rbx
0049   49:	5d                   	pop    %rbp
004a   4a:	c3                   	ret
004b   4b:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 52 <tdx_safe_halt+0x52>	4d: R_X86_64_PC32	.data.once-0x4
0052   52:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	55: R_X86_64_32S	_ftrace_annotated_branch+0x7b0
0059   59:	89 de                	mov    %ebx,%esi
005b   5b:	31 d2                	xor    %edx,%edx
005d   5d:	31 c9                	xor    %ecx,%ecx
005f   5f:	e8 00 00 00 00       	call   64 <tdx_safe_halt+0x64>	60: R_X86_64_PLT32	ftrace_likely_update-0x4
0064   64:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	67: R_X86_64_32S	_ftrace_annotated_branch+0x7e0
006b   6b:	be 01 00 00 00       	mov    $0x1,%esi
0070   70:	31 d2                	xor    %edx,%edx
0072   72:	b9 01 00 00 00       	mov    $0x1,%ecx
0077   77:	e8 00 00 00 00       	call   7c <tdx_safe_halt+0x7c>	78: R_X86_64_PLT32	ftrace_likely_update-0x4
007c   7c:	90                   	nop
007d   7d:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	80: R_X86_64_32S	.rodata+0x4820
0084   84:	e8 00 00 00 00       	call   89 <tdx_safe_halt+0x89>	85: R_X86_64_PLT32	__warn_printk-0x4
0089   89:	90                   	nop
008a   8a:	0f 0b                	ud2
008c   8c:	90                   	nop
008d   8d:	90                   	nop
008e   8e:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	91: R_X86_64_32S	_ftrace_annotated_branch+0x810
0095   95:	be 01 00 00 00       	mov    $0x1,%esi
009a   9a:	31 d2                	xor    %edx,%edx
009c   9c:	b9 01 00 00 00       	mov    $0x1,%ecx
00a1   a1:	e8 00 00 00 00       	call   a6 <tdx_safe_halt+0xa6>	a2: R_X86_64_PLT32	ftrace_likely_update-0x4
00a6   a6:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	a9: R_X86_64_32S	_ftrace_annotated_branch+0x840
00ad   ad:	be 01 00 00 00       	mov    $0x1,%esi
00b2   b2:	31 d2                	xor    %edx,%edx
00b4   b4:	b9 01 00 00 00       	mov    $0x1,%ecx
00b9   b9:	5b                   	pop    %rbx
00ba   ba:	5d                   	pop    %rbp
00bb   bb:	e9 00 00 00 00       	jmp    c0 <__halt>	bc: R_X86_64_PLT32	ftrace_likely_update-0x4

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
