Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693AAEC2;
	Mon, 28 Aug 2023 07:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693207172; x=1724743172;
  h=date:from:cc:subject:message-id:mime-version;
  bh=z56BEF/rJecydwL7yzJqGNBCfydsIIO8E8fYWkGTtDM=;
  b=RFqx7hgL9lSFi+koSjx5nb3g8oZBbJAQRz+UKvhOgxJePSkcmXAo0BRn
   xFFSsW3CMYnLn/rPxAlrET+9orAj6lVh9js9TGq/95dm3hDjmLCscJJw4
   02eba4/7Fr3ptO3rFkJA60EWHyMYmKKvGGxZ6xzdnx+xHdZBcYs6Yl7oI
   QIJiQOOmi0qPdLwz7Nyw12jxtwovXbUGJaKx9dMQ7QUaH5saQp70hgIjY
   uQ81EDqkc9R5xcNtQsMp+nYY2CKNRHks5EfQz6K3NjeGmLhABbPiOub+b
   rysffqHm659X0VwAwkvJn8cyzyoJWcQG3BtRvE7OlRBTLwzfv4UkyhTjC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="354558444"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="354558444"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 00:19:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="881832434"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 28 Aug 2023 00:19:35 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaWX3-0007fb-2f;
	Mon, 28 Aug 2023 07:19:29 +0000
Date: Mon, 28 Aug 2023 15:18:40 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x47: relocation to
 !ENDBR: machine_kexec_cleanup+0x53
Message-ID: <202308281523.cbkGxLVb-lkp@intel.com>
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
CC: Thomas Gleixner <tglx@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2dde18cd1d8fac735875f2e4987f11817cc0bc2c
commit: ee3e2469b3463d28ca4cde20e0283319ac6a562d x86/ftrace: Make it call depth tracking aware
date:   11 months ago
config: x86_64-randconfig-r015-20230826 (https://download.01.org/0day-ci/archive/20230828/202308281523.cbkGxLVb-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230828/202308281523.cbkGxLVb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308281523.cbkGxLVb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: amd_spi_master_transfer() falls through to next function amd_spi_max_transfer_size()
   vmlinux.o: warning: objtool: bmi160_setup_irq() falls through to next function bmi160_data_rdy_trigger_set_state()
   vmlinux.o: warning: objtool: sync_regs+0x23: call to memcpy() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret+0x36: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: enter_from_user_mode+0xa3: call to preempt_count_add() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode+0xb0: call to preempt_count_add() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare+0xa3: call to preempt_count_add() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter_from_user_mode+0xa3: call to preempt_count_add() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __ct_user_enter+0x8b: call to __kasan_check_write() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __ct_user_exit+0x5d: call to __kasan_check_write() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x47: relocation to !ENDBR: machine_kexec_cleanup+0x53


objdump-func vmlinux.o set_ftrace_ops_ro:
0000 00000000000ea720 <set_ftrace_ops_ro>:
0000    ea720:	f3 0f 1e fa          	endbr64
0004    ea724:	55                   	push   %rbp
0005    ea725:	41 57                	push   %r15
0007    ea727:	41 56                	push   %r14
0009    ea729:	41 55                	push   %r13
000b    ea72b:	41 54                	push   %r12
000d    ea72d:	53                   	push   %rbx
000e    ea72e:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	ea731: R_X86_64_32S	ftrace_ops_list
0015    ea735:	48 c1 e8 03          	shr    $0x3,%rax
0019    ea739:	49 bf 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r15
0023    ea743:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
0028    ea748:	74 0c                	je     ea756 <set_ftrace_ops_ro+0x36>
002a    ea74a:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	ea74d: R_X86_64_32S	ftrace_ops_list
0031    ea751:	e8 00 00 00 00       	call   ea756 <set_ftrace_ops_ro+0x36>	ea752: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0036    ea756:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # ea75d <set_ftrace_ops_ro+0x3d>	ea759: R_X86_64_PC32	ftrace_ops_list-0x4
003d    ea75d:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	ea760: R_X86_64_32S	ftrace_regs_caller
0044    ea764:	48 f7 d8             	neg    %rax
0047    ea767:	4c 8d 2c 05 00 00 00 00 	lea    0x0(,%rax,1),%r13	ea76b: R_X86_64_32S	ftrace_regs_caller_end+0x1008
004f    ea76f:	49 c1 ed 0c          	shr    $0xc,%r13
0053    ea773:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	ea776: R_X86_64_32S	ftrace_caller
005a    ea77a:	48 f7 d8             	neg    %rax
005d    ea77d:	48 8d 2c 05 00 00 00 00 	lea    0x0(,%rax,1),%rbp	ea781: R_X86_64_32S	ftrace_caller_end+0x1008
0065    ea785:	48 c1 ed 0c          	shr    $0xc,%rbp
0069    ea789:	4c 8d 73 10          	lea    0x10(%rbx),%r14
006d    ea78d:	4c 89 f0             	mov    %r14,%rax
0070    ea790:	48 c1 e8 03          	shr    $0x3,%rax
0074    ea794:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
0079    ea799:	74 08                	je     ea7a3 <set_ftrace_ops_ro+0x83>
007b    ea79b:	4c 89 f7             	mov    %r14,%rdi
007e    ea79e:	e8 00 00 00 00       	call   ea7a3 <set_ftrace_ops_ro+0x83>	ea79f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0083    ea7a3:	4d 8b 26             	mov    (%r14),%r12
0086    ea7a6:	41 0f ba e4 0b       	bt     $0xb,%r12d
008b    ea7ab:	73 2f                	jae    ea7dc <set_ftrace_ops_ro+0xbc>
008d    ea7ad:	4c 8d b3 60 01 00 00 	lea    0x160(%rbx),%r14
0094    ea7b4:	4c 89 f0             	mov    %r14,%rax
0097    ea7b7:	48 c1 e8 03          	shr    $0x3,%rax
009b    ea7bb:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
00a0    ea7c0:	74 08                	je     ea7ca <set_ftrace_ops_ro+0xaa>
00a2    ea7c2:	4c 89 f7             	mov    %r14,%rdi
00a5    ea7c5:	e8 00 00 00 00       	call   ea7ca <set_ftrace_ops_ro+0xaa>	ea7c6: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
00aa    ea7ca:	41 f6 c4 04          	test   $0x4,%r12b
00ae    ea7ce:	49 8b 3e             	mov    (%r14),%rdi
00b1    ea7d1:	44 89 ee             	mov    %r13d,%esi
00b4    ea7d4:	0f 44 f5             	cmove  %ebp,%esi
00b7    ea7d7:	e8 00 00 00 00       	call   ea7dc <set_ftrace_ops_ro+0xbc>	ea7d8: R_X86_64_PLT32	set_memory_ro-0x4
00bc    ea7dc:	48 83 c3 08          	add    $0x8,%rbx
00c0    ea7e0:	48 89 d8             	mov    %rbx,%rax
00c3    ea7e3:	48 c1 e8 03          	shr    $0x3,%rax
00c7    ea7e7:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
00cc    ea7ec:	74 08                	je     ea7f6 <set_ftrace_ops_ro+0xd6>
00ce    ea7ee:	48 89 df             	mov    %rbx,%rdi
00d1    ea7f1:	e8 00 00 00 00       	call   ea7f6 <set_ftrace_ops_ro+0xd6>	ea7f2: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
00d6    ea7f6:	48 8b 1b             	mov    (%rbx),%rbx
00d9    ea7f9:	48 85 db             	test   %rbx,%rbx
00dc    ea7fc:	74 10                	je     ea80e <set_ftrace_ops_ro+0xee>
00de    ea7fe:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	ea801: R_X86_64_32S	ftrace_list_end
00e5    ea805:	48 39 c3             	cmp    %rax,%rbx
00e8    ea808:	0f 85 7b ff ff ff    	jne    ea789 <set_ftrace_ops_ro+0x69>
00ee    ea80e:	5b                   	pop    %rbx
00ef    ea80f:	41 5c                	pop    %r12
00f1    ea811:	41 5d                	pop    %r13
00f3    ea813:	41 5e                	pop    %r14
00f5    ea815:	41 5f                	pop    %r15
00f7    ea817:	5d                   	pop    %rbp
00f8    ea818:	31 c0                	xor    %eax,%eax
00fa    ea81a:	31 ff                	xor    %edi,%edi
00fc    ea81c:	31 f6                	xor    %esi,%esi
00fe    ea81e:	c3                   	ret
00ff    ea81f:	90                   	nop

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
