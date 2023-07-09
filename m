Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC427F;
	Sun,  9 Jul 2023 20:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688935137; x=1720471137;
  h=date:from:cc:subject:message-id:mime-version;
  bh=7tEf3hW9sHU6M4ddpvupIrTxX5yW1jNO2TN6fQb7M8s=;
  b=i33DVP4DQ/bXes0Gg06D4H1WkEAijasM1d6QjQB6e+376XEKEXxHszHt
   uZMHWxMYYomClTjEXr4Vra1gckIddb311sYUrIGarmcr0WWSa8eh6u/Zf
   A1btWYBG/agFB6TvVq5Ui5036hgr4VV59hZPLLDEi0IJT8EI8ZHW7OQTK
   +fSbOJgZW3jPzI2399uNc2niFDUTJMEJu03p7PY5z5FQudF8K5RUL2xn7
   kimFXL6FrmXLfCe+VPW6YFxqc7zv1thD0sUOvCGkyvzW77IpLAM7VTdNB
   NC2b+gYijVqFx/zebHgUZSEpNppObs1BWLP1KDab7b3MGG7invbjVl5Wv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="430275968"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="430275968"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2023 13:38:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="755771112"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="755771112"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 09 Jul 2023 13:38:56 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qIbBH-0003NQ-0A;
	Sun, 09 Jul 2023 20:38:55 +0000
Date: Mon, 10 Jul 2023 04:38:49 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x4e: relocation to
 !ENDBR: recover_probed_instruction+0x6e
Message-ID: <202307100416.9IxnudrY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Ze Gao <zegao2021@gmail.com>
CC: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
CC: "Steven Rostedt (Google)" <rostedt@goodmis.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c192ac7357683f78c2e6d6e75adfcc29deb8c4ae
commit: 571a2a50a8fc546145ffd3bf673547e9fe128ed2 rethook, fprobe: do not trace rethook related functions
date:   8 weeks ago
config: x86_64-randconfig-x005-20230710 (https://download.01.org/0day-ci/archive/20230710/202307100416.9IxnudrY-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230710/202307100416.9IxnudrY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307100416.9IxnudrY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: ibt_selftest+0x14: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: ibt_selftest+0x1e: return with modified stack frame
>> vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x4e: relocation to !ENDBR: recover_probed_instruction+0x6e
>> vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x64: relocation to !ENDBR: can_boost+0x224


objdump-func vmlinux.o set_ftrace_ops_ro:
0000 00000000000e1b00 <set_ftrace_ops_ro>:
0000    e1b00:	f3 0f 1e fa          	endbr64
0004    e1b04:	55                   	push   %rbp
0005    e1b05:	48 89 e5             	mov    %rsp,%rbp
0008    e1b08:	41 57                	push   %r15
000a    e1b0a:	41 56                	push   %r14
000c    e1b0c:	41 55                	push   %r13
000e    e1b0e:	41 54                	push   %r12
0010    e1b10:	53                   	push   %rbx
0011    e1b11:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	e1b14: R_X86_64_32S	ftrace_ops_list
0018    e1b18:	48 c1 e8 03          	shr    $0x3,%rax
001c    e1b1c:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0026    e1b26:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
002a    e1b2a:	74 0c                	je     e1b38 <set_ftrace_ops_ro+0x38>
002c    e1b2c:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	e1b2f: R_X86_64_32S	ftrace_ops_list
0033    e1b33:	e8 00 00 00 00       	call   e1b38 <set_ftrace_ops_ro+0x38>	e1b34: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0038    e1b38:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # e1b3f <set_ftrace_ops_ro+0x3f>	e1b3b: R_X86_64_PC32	ftrace_ops_list-0x4
003f    e1b3f:	e8 00 00 00 00       	call   e1b44 <set_ftrace_ops_ro+0x44>	e1b40: R_X86_64_PLT32	debug_lockdep_rcu_enabled-0x4
0044    e1b44:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	e1b47: R_X86_64_32S	ftrace_regs_caller
004b    e1b4b:	48 f7 d8             	neg    %rax
004e    e1b4e:	4c 8d 2c 05 00 00 00 00 	lea    0x0(,%rax,1),%r13	e1b52: R_X86_64_32S	ftrace_regs_caller_end+0x1008
0056    e1b56:	49 c1 ed 0c          	shr    $0xc,%r13
005a    e1b5a:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	e1b5d: R_X86_64_32S	ftrace_caller
0061    e1b61:	48 f7 d8             	neg    %rax
0064    e1b64:	4c 8d 24 05 00 00 00 00 	lea    0x0(,%rax,1),%r12	e1b68: R_X86_64_32S	ftrace_caller_end+0x1008
006c    e1b6c:	49 c1 ec 0c          	shr    $0xc,%r12
0070    e1b70:	4c 8d 73 10          	lea    0x10(%rbx),%r14
0074    e1b74:	4c 89 f0             	mov    %r14,%rax
0077    e1b77:	48 c1 e8 03          	shr    $0x3,%rax
007b    e1b7b:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0085    e1b85:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
0089    e1b89:	74 08                	je     e1b93 <set_ftrace_ops_ro+0x93>
008b    e1b8b:	4c 89 f7             	mov    %r14,%rdi
008e    e1b8e:	e8 00 00 00 00       	call   e1b93 <set_ftrace_ops_ro+0x93>	e1b8f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0093    e1b93:	4d 8b 3e             	mov    (%r14),%r15
0096    e1b96:	41 f7 c7 00 08 00 00 	test   $0x800,%r15d
009d    e1b9d:	74 39                	je     e1bd8 <set_ftrace_ops_ro+0xd8>
009f    e1b9f:	4c 8d b3 90 01 00 00 	lea    0x190(%rbx),%r14
00a6    e1ba6:	4c 89 f0             	mov    %r14,%rax
00a9    e1ba9:	48 c1 e8 03          	shr    $0x3,%rax
00ad    e1bad:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
00b7    e1bb7:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
00bb    e1bbb:	74 08                	je     e1bc5 <set_ftrace_ops_ro+0xc5>
00bd    e1bbd:	4c 89 f7             	mov    %r14,%rdi
00c0    e1bc0:	e8 00 00 00 00       	call   e1bc5 <set_ftrace_ops_ro+0xc5>	e1bc1: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
00c5    e1bc5:	41 f6 c7 04          	test   $0x4,%r15b
00c9    e1bc9:	49 8b 3e             	mov    (%r14),%rdi
00cc    e1bcc:	44 89 ee             	mov    %r13d,%esi
00cf    e1bcf:	41 0f 44 f4          	cmove  %r12d,%esi
00d3    e1bd3:	e8 00 00 00 00       	call   e1bd8 <set_ftrace_ops_ro+0xd8>	e1bd4: R_X86_64_PLT32	set_memory_ro-0x4
00d8    e1bd8:	48 83 c3 08          	add    $0x8,%rbx
00dc    e1bdc:	48 89 d8             	mov    %rbx,%rax
00df    e1bdf:	48 c1 e8 03          	shr    $0x3,%rax
00e3    e1be3:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
00ed    e1bed:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
00f1    e1bf1:	74 08                	je     e1bfb <set_ftrace_ops_ro+0xfb>
00f3    e1bf3:	48 89 df             	mov    %rbx,%rdi
00f6    e1bf6:	e8 00 00 00 00       	call   e1bfb <set_ftrace_ops_ro+0xfb>	e1bf7: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
00fb    e1bfb:	48 8b 1b             	mov    (%rbx),%rbx
00fe    e1bfe:	e8 00 00 00 00       	call   e1c03 <set_ftrace_ops_ro+0x103>	e1bff: R_X86_64_PLT32	debug_lockdep_rcu_enabled-0x4
0103    e1c03:	48 85 db             	test   %rbx,%rbx
0106    e1c06:	74 10                	je     e1c18 <set_ftrace_ops_ro+0x118>
0108    e1c08:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	e1c0b: R_X86_64_32S	ftrace_list_end
010f    e1c0f:	48 39 c3             	cmp    %rax,%rbx
0112    e1c12:	0f 85 58 ff ff ff    	jne    e1b70 <set_ftrace_ops_ro+0x70>
0118    e1c18:	5b                   	pop    %rbx
0119    e1c19:	41 5c                	pop    %r12
011b    e1c1b:	41 5d                	pop    %r13
011d    e1c1d:	41 5e                	pop    %r14
011f    e1c1f:	41 5f                	pop    %r15
0121    e1c21:	5d                   	pop    %rbp
0122    e1c22:	c3                   	ret
0123    e1c23:	66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
0132    e1c32:	66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
