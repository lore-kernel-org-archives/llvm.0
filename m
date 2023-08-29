Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFD32109;
	Tue, 29 Aug 2023 08:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693298706; x=1724834706;
  h=date:from:cc:subject:message-id:mime-version;
  bh=tqEw6KZkxZK87itCMCDFLZolCe6f8WkcANV+V8K28vc=;
  b=ah6LRBOX5hOREGBxsZImsFGUB0rBp9HtCSiY4O0gEsxakOoEHT79y4AV
   LCfNQEZpnmKx4KCWV6l/OtMRJ3zpwtPp3O/aKnHzTonbMcEG1MtmH9bhw
   HTXMVVp9qHFQNxe+EOknuLsxW0fylTa3p5NjpkNNE2J/zgfSRkccMU9fV
   kFsPrEW24TkCayRZ83ZRe77bOlfXrNrX0soVp+HQd0jBPF/Zd6Pti4l75
   NQLgN0CkBebotaugWhG1mby0FjuGzjVLSZ3nstj1vmypLCnX1mgMwHds3
   YitQQ5cdU8Elx+SBdU0TC3MOVAUomQBbyd5SP7Ba55Tmbz+Wz2NT6NXK8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="441662273"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; 
   d="scan'208";a="441662273"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 01:45:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="853199146"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; 
   d="scan'208";a="853199146"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 29 Aug 2023 01:45:03 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qauLK-0008aH-2L;
	Tue, 29 Aug 2023 08:44:59 +0000
Date: Tue, 29 Aug 2023 16:44:13 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [linux-next:master 10262/13297] vmlinux.o: warning: objtool:
 set_ftrace_ops_ro+0x33: relocation to !ENDBR: machine_kexec+0x152
Message-ID: <202308291620.kR3ZENbY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Pengfei Xu <pengfei.xu@intel.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Dmitry Vyukov <dvyukov@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2ee82481c392eec06a7ef28df61b7f0d8e45be2e
commit: 0d345996e4cb573f8cc81d49b3ee9a7fd2035bef [10262/13297] x86/kernel: increase kcov coverage under arch/x86/kernel folder
config: x86_64-randconfig-004-20230826 (https://download.01.org/0day-ci/archive/20230829/202308291620.kR3ZENbY-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230829/202308291620.kR3ZENbY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308291620.kR3ZENbY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: ibt_selftest+0x1a: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: amd_spi_master_transfer() falls through to next function __cfi_amd_spi_max_transfer_size()
>> vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x33: relocation to !ENDBR: machine_kexec+0x152
   vmlinux.o: warning: objtool: bad call to elf_init_reloc_text_sym() for data symbol .rodata


objdump-func vmlinux.o set_ftrace_ops_ro:
0000 00000000001325f0 <set_ftrace_ops_ro>:
0000   1325f0:	f3 0f 1e fa          	endbr64
0004   1325f4:	55                   	push   %rbp
0005   1325f5:	48 89 e5             	mov    %rsp,%rbp
0008   1325f8:	41 57                	push   %r15
000a   1325fa:	41 56                	push   %r14
000c   1325fc:	41 55                	push   %r13
000e   1325fe:	41 54                	push   %r12
0010   132600:	53                   	push   %rbx
0011   132601:	e8 00 00 00 00       	call   132606 <set_ftrace_ops_ro+0x16>	132602: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0016   132606:	4c 8b 3d 00 00 00 00 	mov    0x0(%rip),%r15        # 13260d <set_ftrace_ops_ro+0x1d>	132609: R_X86_64_PC32	ftrace_ops_list-0x4
001d   13260d:	e8 00 00 00 00       	call   132612 <set_ftrace_ops_ro+0x22>	13260e: R_X86_64_PLT32	debug_lockdep_rcu_enabled-0x4
0022   132612:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	132615: R_X86_64_32S	ftrace_list_end
0029   132619:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	13261c: R_X86_64_32S	ftrace_regs_caller
0030   132620:	48 f7 d8             	neg    %rax
0033   132623:	4c 8d 2c 05 00 00 00 00 	lea    0x0(,%rax,1),%r13	132627: R_X86_64_32S	ftrace_regs_caller_end+0x100c
003b   13262b:	49 c1 ed 0c          	shr    $0xc,%r13
003f   13262f:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	132632: R_X86_64_32S	ftrace_caller
0046   132636:	48 f7 d8             	neg    %rax
0049   132639:	4c 8d 24 05 00 00 00 00 	lea    0x0(,%rax,1),%r12	13263d: R_X86_64_32S	ftrace_caller_end+0x100c
0051   132641:	49 c1 ec 0c          	shr    $0xc,%r12
0055   132645:	49 8b 5f 10          	mov    0x10(%r15),%rbx
0059   132649:	48 89 de             	mov    %rbx,%rsi
005c   13264c:	48 81 e6 00 08 00 00 	and    $0x800,%rsi
0063   132653:	31 ff                	xor    %edi,%edi
0065   132655:	e8 00 00 00 00       	call   13265a <set_ftrace_ops_ro+0x6a>	132656: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
006a   13265a:	48 89 d8             	mov    %rbx,%rax
006d   13265d:	48 25 00 08 00 00    	and    $0x800,%rax
0073   132663:	75 07                	jne    13266c <set_ftrace_ops_ro+0x7c>
0075   132665:	e8 00 00 00 00       	call   13266a <set_ftrace_ops_ro+0x7a>	132666: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
007a   13266a:	eb 30                	jmp    13269c <set_ftrace_ops_ro+0xac>
007c   13266c:	e8 00 00 00 00       	call   132671 <set_ftrace_ops_ro+0x81>	13266d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0081   132671:	48 83 e3 04          	and    $0x4,%rbx
0085   132675:	45 89 ee             	mov    %r13d,%r14d
0088   132678:	45 0f 44 f4          	cmove  %r12d,%r14d
008c   13267c:	31 ff                	xor    %edi,%edi
008e   13267e:	48 89 de             	mov    %rbx,%rsi
0091   132681:	e8 00 00 00 00       	call   132686 <set_ftrace_ops_ro+0x96>	132682: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0096   132686:	49 8b bf 80 01 00 00 	mov    0x180(%r15),%rdi
009d   13268d:	44 89 f6             	mov    %r14d,%esi
00a0   132690:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	132693: R_X86_64_32S	ftrace_list_end
00a7   132697:	e8 00 00 00 00       	call   13269c <set_ftrace_ops_ro+0xac>	132698: R_X86_64_PLT32	set_memory_ro-0x4
00ac   13269c:	4d 8b 7f 08          	mov    0x8(%r15),%r15
00b0   1326a0:	e8 00 00 00 00       	call   1326a5 <set_ftrace_ops_ro+0xb5>	1326a1: R_X86_64_PLT32	debug_lockdep_rcu_enabled-0x4
00b5   1326a5:	4d 85 ff             	test   %r15,%r15
00b8   1326a8:	74 0c                	je     1326b6 <set_ftrace_ops_ro+0xc6>
00ba   1326aa:	4d 39 f7             	cmp    %r14,%r15
00bd   1326ad:	74 07                	je     1326b6 <set_ftrace_ops_ro+0xc6>
00bf   1326af:	e8 00 00 00 00       	call   1326b4 <set_ftrace_ops_ro+0xc4>	1326b0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00c4   1326b4:	eb 8f                	jmp    132645 <set_ftrace_ops_ro+0x55>
00c6   1326b6:	e8 00 00 00 00       	call   1326bb <set_ftrace_ops_ro+0xcb>	1326b7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00cb   1326bb:	5b                   	pop    %rbx
00cc   1326bc:	41 5c                	pop    %r12
00ce   1326be:	41 5d                	pop    %r13
00d0   1326c0:	41 5e                	pop    %r14
00d2   1326c2:	41 5f                	pop    %r15
00d4   1326c4:	5d                   	pop    %rbp
00d5   1326c5:	c3                   	ret
00d6   1326c6:	cc                   	int3
00d7   1326c7:	66 0f 1f 84 00 00 00 00 00 	nopw   0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
