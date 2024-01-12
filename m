Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0027C6EB4C;
	Fri, 12 Jan 2024 15:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O8xnjWY+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705072663; x=1736608663;
  h=date:from:cc:subject:message-id:mime-version;
  bh=tGixYOSzqXMwPB5gbJC9ya2jZh8OCS1qhCaCv4dTOoA=;
  b=O8xnjWY++B5GRlBCjZY9lPC+lWV9eAdhxMi3XUiOjT0gan8+Y5iNdZyR
   8rtP0/j9mYHUvAq5M5QRmUY7AUecSNbme+UV1VBWaPTkRdHycPas7tybK
   wufXRQCExuaFkU2jYdo3NzEu3j+nrg7xdiCPbrfq0eusEDdZ88tjsx04N
   BDR341zWzkzueWuZrkp0GefpxFSYDRK7Sp+9wnIZFi6jiMaLAKHCMUKFa
   sYdPmsTQ6Tmg2VyIxCy4dX+2mFzDRcKNCPZ6QFYi91YHMTHjRWruE+GjO
   ySRdnekyaqUD5vQ7Hfb3HZkwT6sF/homCs8lMOABmPtmvofYV2272pyq3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="6557015"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; 
   d="scan'208";a="6557015"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2024 07:17:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="786372789"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; 
   d="scan'208";a="786372789"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 12 Jan 2024 07:17:39 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOJHt-0009bd-0Q;
	Fri, 12 Jan 2024 15:17:37 +0000
Date: Fri, 12 Jan 2024 23:16:58 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [tip:x86/percpu 20/36] vmlinux.o: warning: objtool:
 set_ftrace_ops_ro+0x52: relocation to !ENDBR:
 arch_crash_save_vmcoreinfo+0xe9
Message-ID: <202401122351.7nSbjfmp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Uros Bizjak <ubizjak@gmail.com>
CC: Ingo Molnar <mingo@kernel.org>

Hi Uros,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/percpu
head:   de8c6a352131f642b82474abe0cbb5dd26a7e081
commit: 59bec00ace28d565ae0a68b23063ef3b961d82d5 [20/36] x86/percpu: Introduce %rip-relative addressing to PER_CPU_VAR()
config: x86_64-buildonly-randconfig-004-20240112 (https://download.01.org/0day-ci/archive/20240112/202401122351.7nSbjfmp-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240112/202401122351.7nSbjfmp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401122351.7nSbjfmp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x52: relocation to !ENDBR: arch_crash_save_vmcoreinfo+0xe9


objdump-func vmlinux.o set_ftrace_ops_ro:
0000 000000000013d0b0 <set_ftrace_ops_ro>:
0000   13d0b0:	f3 0f 1e fa          	endbr64
0004   13d0b4:	55                   	push   %rbp
0005   13d0b5:	41 57                	push   %r15
0007   13d0b7:	41 56                	push   %r14
0009   13d0b9:	41 55                	push   %r13
000b   13d0bb:	41 54                	push   %r12
000d   13d0bd:	53                   	push   %rbx
000e   13d0be:	48 83 ec 20          	sub    $0x20,%rsp
0012   13d0c2:	e8 00 00 00 00       	call   13d0c7 <set_ftrace_ops_ro+0x17>	13d0c3: R_X86_64_PLT32	__msan_get_context_state-0x4
0017   13d0c7:	49 89 c6             	mov    %rax,%r14
001a   13d0ca:	4c 8b 2d 00 00 00 00 	mov    0x0(%rip),%r13        # 13d0d1 <set_ftrace_ops_ro+0x21>	13d0cd: R_X86_64_PC32	ftrace_ops_list-0x4
0021   13d0d1:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	13d0d4: R_X86_64_32S	ftrace_ops_list
0028   13d0d8:	e8 00 00 00 00       	call   13d0dd <set_ftrace_ops_ro+0x2d>	13d0d9: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
002d   13d0dd:	48 8b 18             	mov    (%rax),%rbx
0030   13d0e0:	44 8b 3a             	mov    (%rdx),%r15d
0033   13d0e3:	4c 89 74 24 18       	mov    %r14,0x18(%rsp)
0038   13d0e8:	41 c7 86 20 03 00 00 00 00 00 00 	movl   $0x0,0x320(%r14)
0043   13d0f3:	e8 00 00 00 00       	call   13d0f8 <set_ftrace_ops_ro+0x48>	13d0f4: R_X86_64_PLT32	debug_lockdep_rcu_enabled-0x4
0048   13d0f8:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	13d0fb: R_X86_64_32S	ftrace_regs_caller
004f   13d0ff:	48 f7 d8             	neg    %rax
0052   13d102:	48 8d 04 05 00 00 00 00 	lea    0x0(,%rax,1),%rax	13d106: R_X86_64_32S	ftrace_regs_caller_end+0x100c
005a   13d10a:	48 c1 e8 0c          	shr    $0xc,%rax
005e   13d10e:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
0063   13d113:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	13d116: R_X86_64_32S	ftrace_caller
006a   13d11a:	48 f7 d8             	neg    %rax
006d   13d11d:	48 8d 04 05 00 00 00 00 	lea    0x0(,%rax,1),%rax	13d121: R_X86_64_32S	ftrace_caller_end+0x100c
0075   13d125:	48 c1 e8 0c          	shr    $0xc,%rax
0079   13d129:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
007e   13d12e:	48 85 db             	test   %rbx,%rbx
0081   13d131:	0f 85 55 01 00 00    	jne    13d28c <set_ftrace_ops_ro+0x1dc>
0087   13d137:	44 89 7c 24 04       	mov    %r15d,0x4(%rsp)
008c   13d13c:	49 8d 7d 10          	lea    0x10(%r13),%rdi
0090   13d140:	48 8b 2f             	mov    (%rdi),%rbp
0093   13d143:	e8 00 00 00 00       	call   13d148 <set_ftrace_ops_ro+0x98>	13d144: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
0098   13d148:	4c 8b 38             	mov    (%rax),%r15
009b   13d14b:	44 8b 32             	mov    (%rdx),%r14d
009e   13d14e:	44 89 f8             	mov    %r15d,%eax
00a1   13d151:	25 00 08 00 00       	and    $0x800,%eax
00a6   13d156:	41 89 ec             	mov    %ebp,%r12d
00a9   13d159:	41 81 e4 00 08 00 00 	and    $0x800,%r12d
00b0   13d160:	48 85 c0             	test   %rax,%rax
00b3   13d163:	74 0b                	je     13d170 <set_ftrace_ops_ro+0xc0>
00b5   13d165:	f7 d0                	not    %eax
00b7   13d167:	44 21 e0             	and    %r12d,%eax
00ba   13d16a:	0f 84 29 01 00 00    	je     13d299 <set_ftrace_ops_ro+0x1e9>
00c0   13d170:	4d 85 e4             	test   %r12,%r12
00c3   13d173:	0f 84 8d 00 00 00    	je     13d206 <set_ftrace_ops_ro+0x156>
00c9   13d179:	41 83 e7 04          	and    $0x4,%r15d
00cd   13d17d:	83 e5 04             	and    $0x4,%ebp
00d0   13d180:	4d 85 ff             	test   %r15,%r15
00d3   13d183:	41 0f 94 c4          	sete   %r12b
00d7   13d187:	41 f7 d7             	not    %r15d
00da   13d18a:	44 85 fd             	test   %r15d,%ebp
00dd   13d18d:	41 0f 95 c7          	setne  %r15b
00e1   13d191:	48 85 db             	test   %rbx,%rbx
00e4   13d194:	0f 85 35 01 00 00    	jne    13d2cf <set_ftrace_ops_ro+0x21f>
00ea   13d19a:	45 08 fc             	or     %r15b,%r12b
00ed   13d19d:	49 8d bd 70 01 00 00 	lea    0x170(%r13),%rdi
00f4   13d1a4:	4c 8b 3f             	mov    (%rdi),%r15
00f7   13d1a7:	e8 00 00 00 00       	call   13d1ac <set_ftrace_ops_ro+0xfc>	13d1a8: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
00fc   13d1ac:	31 f6                	xor    %esi,%esi
00fe   13d1ae:	45 84 e4             	test   %r12b,%r12b
0101   13d1b1:	75 03                	jne    13d1b6 <set_ftrace_ops_ro+0x106>
0103   13d1b3:	44 89 f6             	mov    %r14d,%esi
0106   13d1b6:	8b 3a                	mov    (%rdx),%edi
0108   13d1b8:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
010d   13d1bd:	41 89 ce             	mov    %ecx,%r14d
0110   13d1c0:	48 85 ed             	test   %rbp,%rbp
0113   13d1c3:	74 08                	je     13d1cd <set_ftrace_ops_ro+0x11d>
0115   13d1c5:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
011a   13d1ca:	41 89 ce             	mov    %ecx,%r14d
011d   13d1cd:	48 83 38 00          	cmpq   $0x0,(%rax)
0121   13d1d1:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
0126   13d1d6:	c7 80 20 03 00 00 00 00 00 00 	movl   $0x0,0x320(%rax)
0130   13d1e0:	0f 85 f7 00 00 00    	jne    13d2dd <set_ftrace_ops_ro+0x22d>
0136   13d1e6:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
013b   13d1eb:	33 44 24 08          	xor    0x8(%rsp),%eax
013f   13d1ef:	0f 94 c0             	sete   %al
0142   13d1f2:	41 08 c4             	or     %al,%r12b
0145   13d1f5:	0f 84 f0 00 00 00    	je     13d2eb <set_ftrace_ops_ro+0x23b>
014b   13d1fb:	4c 89 ff             	mov    %r15,%rdi
014e   13d1fe:	44 89 f6             	mov    %r14d,%esi
0151   13d201:	e8 00 00 00 00       	call   13d206 <set_ftrace_ops_ro+0x156>	13d202: R_X86_64_PLT32	set_memory_ro-0x4
0156   13d206:	48 85 db             	test   %rbx,%rbx
0159   13d209:	0f 85 a0 00 00 00    	jne    13d2af <set_ftrace_ops_ro+0x1ff>
015f   13d20f:	4c 89 ef             	mov    %r13,%rdi
0162   13d212:	48 83 c7 08          	add    $0x8,%rdi
0166   13d216:	4c 8b 2f             	mov    (%rdi),%r13
0169   13d219:	e8 00 00 00 00       	call   13d21e <set_ftrace_ops_ro+0x16e>	13d21a: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
016e   13d21e:	48 8b 18             	mov    (%rax),%rbx
0171   13d221:	44 8b 3a             	mov    (%rdx),%r15d
0174   13d224:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
0179   13d229:	c7 80 20 03 00 00 00 00 00 00 	movl   $0x0,0x320(%rax)
0183   13d233:	e8 00 00 00 00       	call   13d238 <set_ftrace_ops_ro+0x188>	13d234: R_X86_64_PLT32	debug_lockdep_rcu_enabled-0x4
0188   13d238:	48 89 d8             	mov    %rbx,%rax
018b   13d23b:	48 f7 d0             	not    %rax
018e   13d23e:	4c 85 e8             	test   %r13,%rax
0191   13d241:	0f 94 c1             	sete   %cl
0194   13d244:	4d 85 ed             	test   %r13,%r13
0197   13d247:	40 0f 94 c5          	sete   %bpl
019b   13d24b:	0f 95 c2             	setne  %dl
019e   13d24e:	4c 89 ee             	mov    %r13,%rsi
01a1   13d251:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	13d254: R_X86_64_32S	ftrace_list_end
01a8   13d258:	48 31 fe             	xor    %rdi,%rsi
01ab   13d25b:	48 85 c6             	test   %rax,%rsi
01ae   13d25e:	0f 94 c0             	sete   %al
01b1   13d261:	49 39 fd             	cmp    %rdi,%r13
01b4   13d264:	41 0f 94 c6          	sete   %r14b
01b8   13d268:	40 0f 95 c6          	setne  %sil
01bc   13d26c:	20 c2                	and    %al,%dl
01be   13d26e:	40 08 c6             	or     %al,%sil
01c1   13d271:	40 20 ce             	and    %cl,%sil
01c4   13d274:	40 08 d6             	or     %dl,%sil
01c7   13d277:	40 80 fe 01          	cmp    $0x1,%sil
01cb   13d27b:	75 05                	jne    13d282 <set_ftrace_ops_ro+0x1d2>
01cd   13d27d:	48 85 db             	test   %rbx,%rbx
01d0   13d280:	75 3b                	jne    13d2bd <set_ftrace_ops_ro+0x20d>
01d2   13d282:	44 08 f5             	or     %r14b,%bpl
01d5   13d285:	75 70                	jne    13d2f7 <set_ftrace_ops_ro+0x247>
01d7   13d287:	e9 a2 fe ff ff       	jmp    13d12e <set_ftrace_ops_ro+0x7e>
01dc   13d28c:	44 89 ff             	mov    %r15d,%edi
01df   13d28f:	e8 00 00 00 00       	call   13d294 <set_ftrace_ops_ro+0x1e4>	13d290: R_X86_64_PLT32	__msan_warning-0x4
01e4   13d294:	e9 9e fe ff ff       	jmp    13d137 <set_ftrace_ops_ro+0x87>
01e9   13d299:	44 89 f7             	mov    %r14d,%edi
01ec   13d29c:	e8 00 00 00 00       	call   13d2a1 <set_ftrace_ops_ro+0x1f1>	13d29d: R_X86_64_PLT32	__msan_warning-0x4
01f1   13d2a1:	4d 85 e4             	test   %r12,%r12
01f4   13d2a4:	0f 85 cf fe ff ff    	jne    13d179 <set_ftrace_ops_ro+0xc9>
01fa   13d2aa:	e9 57 ff ff ff       	jmp    13d206 <set_ftrace_ops_ro+0x156>
01ff   13d2af:	8b 7c 24 04          	mov    0x4(%rsp),%edi
0203   13d2b3:	e8 00 00 00 00       	call   13d2b8 <set_ftrace_ops_ro+0x208>	13d2b4: R_X86_64_PLT32	__msan_warning-0x4
0208   13d2b8:	e9 52 ff ff ff       	jmp    13d20f <set_ftrace_ops_ro+0x15f>
020d   13d2bd:	44 89 ff             	mov    %r15d,%edi
0210   13d2c0:	e8 00 00 00 00       	call   13d2c5 <set_ftrace_ops_ro+0x215>	13d2c1: R_X86_64_PLT32	__msan_warning-0x4
0215   13d2c5:	44 08 f5             	or     %r14b,%bpl
0218   13d2c8:	75 2d                	jne    13d2f7 <set_ftrace_ops_ro+0x247>
021a   13d2ca:	e9 5f fe ff ff       	jmp    13d12e <set_ftrace_ops_ro+0x7e>
021f   13d2cf:	8b 7c 24 04          	mov    0x4(%rsp),%edi
0223   13d2d3:	e8 00 00 00 00       	call   13d2d8 <set_ftrace_ops_ro+0x228>	13d2d4: R_X86_64_PLT32	__msan_warning-0x4
0228   13d2d8:	e9 bd fe ff ff       	jmp    13d19a <set_ftrace_ops_ro+0xea>
022d   13d2dd:	89 f5                	mov    %esi,%ebp
022f   13d2df:	e8 00 00 00 00       	call   13d2e4 <set_ftrace_ops_ro+0x234>	13d2e0: R_X86_64_PLT32	__msan_warning-0x4
0234   13d2e4:	89 ee                	mov    %ebp,%esi
0236   13d2e6:	e9 fb fe ff ff       	jmp    13d1e6 <set_ftrace_ops_ro+0x136>
023b   13d2eb:	89 f7                	mov    %esi,%edi
023d   13d2ed:	e8 00 00 00 00       	call   13d2f2 <set_ftrace_ops_ro+0x242>	13d2ee: R_X86_64_PLT32	__msan_warning-0x4
0242   13d2f2:	e9 04 ff ff ff       	jmp    13d1fb <set_ftrace_ops_ro+0x14b>
0247   13d2f7:	48 83 c4 20          	add    $0x20,%rsp
024b   13d2fb:	5b                   	pop    %rbx
024c   13d2fc:	41 5c                	pop    %r12
024e   13d2fe:	41 5d                	pop    %r13
0250   13d300:	41 5e                	pop    %r14
0252   13d302:	41 5f                	pop    %r15
0254   13d304:	5d                   	pop    %rbp
0255   13d305:	31 c0                	xor    %eax,%eax
0257   13d307:	31 c9                	xor    %ecx,%ecx
0259   13d309:	31 ff                	xor    %edi,%edi
025b   13d30b:	31 d2                	xor    %edx,%edx
025d   13d30d:	31 f6                	xor    %esi,%esi
025f   13d30f:	2e e9 00 00 00 00    	cs jmp 13d315 <set_ftrace_ops_ro+0x265>	13d311: R_X86_64_PLT32	__x86_return_thunk-0x4
0265   13d315:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
