Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741A88BE6;
	Sun, 10 Sep 2023 21:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694380586; x=1725916586;
  h=date:from:cc:subject:message-id:mime-version;
  bh=kxWvYnG1uUoztPxMsfpFdV73lOjsBAHWLerX3Jd3FaI=;
  b=b98OG63EwkktWJc9SfY+iisRON43ZZr82J1iRMXgajm/cat9cDB1avBY
   zaPsUMjimF98p9K0ywg3fMpse4evHs8AByT5Vumhva7wVqG1ykEHyGVI1
   hT0GLVksZOZTLdf9jXBfYQ88ncI8LsmBxHG39mGQl/b3JpXVXpE8GtwX4
   eZcknKd2OXUaAmwLtP6J2+dDltjZIbWIJsgOmb5KogbesVPXLoBvURcw9
   3HvLkhShAhHabfFFZBGYeTZdS5ZOiYR3BiO4Mywra+h4pBSz/RJpzv25W
   PmNcClyVZknk2qJMmsAtZvNE3SigSF59+XAltoYW1zEqnfp86lG7raavi
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="464294523"
X-IronPort-AV: E=Sophos;i="6.02,242,1688454000"; 
   d="scan'208";a="464294523"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2023 14:16:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="736558136"
X-IronPort-AV: E=Sophos;i="6.02,242,1688454000"; 
   d="scan'208";a="736558136"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 10 Sep 2023 14:16:23 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfRn3-0005Q0-1X;
	Sun, 10 Sep 2023 21:16:21 +0000
Date: Mon, 11 Sep 2023 05:15:47 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: do_user_addr_fault+0xca8: unreachable
 instruction
Message-ID: <202309110553.a9YFlwfE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Peter Zijlstra <peterz@infradead.org>

Hi Josh,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1548b060d6f32a00a2f7e2c11328205fb66fc4fa
commit: c6cfcbd8ca43766851a8c952e3b570727147020f x86/ibt: Convert IBT selftest to asm
date:   3 weeks ago
config: x86_64-randconfig-015-20230910 (https://download.01.org/0day-ci/archive/20230911/202309110553.a9YFlwfE-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230911/202309110553.a9YFlwfE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309110553.a9YFlwfE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: do_user_addr_fault+0xca8: unreachable instruction


objdump-func vmlinux.o do_user_addr_fault:
0000 0000000000155e90 <do_user_addr_fault>:
0000   155e90:	f3 0f 1e fa          	endbr64
0004   155e94:	55                   	push   %rbp
0005   155e95:	48 89 e5             	mov    %rsp,%rbp
0008   155e98:	41 57                	push   %r15
000a   155e9a:	41 56                	push   %r14
000c   155e9c:	41 55                	push   %r13
000e   155e9e:	41 54                	push   %r12
0010   155ea0:	53                   	push   %rbx
0011   155ea1:	48 81 ec a0 00 00 00 	sub    $0xa0,%rsp
0018   155ea8:	49 89 d4             	mov    %rdx,%r12
001b   155eab:	49 89 f6             	mov    %rsi,%r14
001e   155eae:	49 89 fd             	mov    %rdi,%r13
0021   155eb1:	49 bf 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r15
002b   155ebb:	e8 00 00 00 00       	call   155ec0 <do_user_addr_fault+0x30>	155ebc: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0030   155ec0:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 155ec7 <do_user_addr_fault+0x37>	155ec3: R_X86_64_PC32	pcpu_hot-0x4
0037   155ec7:	48 89 45 90          	mov    %rax,-0x70(%rbp)
003b   155ecb:	48 8d 98 80 02 00 00 	lea    0x280(%rax),%rbx
0042   155ed2:	48 89 d8             	mov    %rbx,%rax
0045   155ed5:	48 c1 e8 03          	shr    $0x3,%rax
0049   155ed9:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
0050   155ee0:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
0055   155ee5:	74 08                	je     155eef <do_user_addr_fault+0x5f>
0057   155ee7:	48 89 df             	mov    %rbx,%rdi
005a   155eea:	e8 00 00 00 00       	call   155eef <do_user_addr_fault+0x5f>	155eeb: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
005f   155eef:	48 89 9d 70 ff ff ff 	mov    %rbx,-0x90(%rbp)
0066   155ef6:	48 8b 03             	mov    (%rbx),%rax
0069   155ef9:	48 89 45 98          	mov    %rax,-0x68(%rbp)
006d   155efd:	44 89 f3             	mov    %r14d,%ebx
0070   155f00:	83 e3 14             	and    $0x14,%ebx
0073   155f03:	bf 10 00 00 00       	mov    $0x10,%edi
0078   155f08:	48 89 de             	mov    %rbx,%rsi
007b   155f0b:	e8 00 00 00 00       	call   155f10 <do_user_addr_fault+0x80>	155f0c: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0080   155f10:	48 83 fb 10          	cmp    $0x10,%rbx
0084   155f14:	0f 84 e1 09 00 00    	je     1568fb <do_user_addr_fault+0xa6b>
008a   155f1a:	49 8d 9d 88 00 00 00 	lea    0x88(%r13),%rbx
0091   155f21:	48 89 d8             	mov    %rbx,%rax
0094   155f24:	48 c1 e8 03          	shr    $0x3,%rax
0098   155f28:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
009c   155f2c:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
00a1   155f31:	74 08                	je     155f3b <do_user_addr_fault+0xab>
00a3   155f33:	48 89 df             	mov    %rbx,%rdi
00a6   155f36:	e8 00 00 00 00       	call   155f3b <do_user_addr_fault+0xab>	155f37: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
00ab   155f3b:	48 89 5d b8          	mov    %rbx,-0x48(%rbp)
00af   155f3f:	48 8b 1b             	mov    (%rbx),%rbx
00b2   155f42:	48 89 de             	mov    %rbx,%rsi
00b5   155f45:	48 83 e6 03          	and    $0x3,%rsi
00b9   155f49:	31 ff                	xor    %edi,%edi
00bb   155f4b:	e8 00 00 00 00       	call   155f50 <do_user_addr_fault+0xc0>	155f4c: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
00c0   155f50:	48 83 e3 03          	and    $0x3,%rbx
00c4   155f54:	74 0a                	je     155f60 <do_user_addr_fault+0xd0>
00c6   155f56:	e8 00 00 00 00       	call   155f5b <do_user_addr_fault+0xcb>	155f57: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00cb   155f5b:	e9 c1 00 00 00       	jmp    156021 <do_user_addr_fault+0x191>
00d0   155f60:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 155f66 <do_user_addr_fault+0xd6>	155f62: R_X86_64_PC32	pcpu_hot+0x4
00d6   155f66:	89 de                	mov    %ebx,%esi
00d8   155f68:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
00de   155f6e:	31 ff                	xor    %edi,%edi
00e0   155f70:	e8 00 00 00 00       	call   155f75 <do_user_addr_fault+0xe5>	155f71: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
00e5   155f75:	81 e3 ff ff ff 7f    	and    $0x7fffffff,%ebx
00eb   155f7b:	74 07                	je     155f84 <do_user_addr_fault+0xf4>
00ed   155f7d:	e8 00 00 00 00       	call   155f82 <do_user_addr_fault+0xf2>	155f7e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00f2   155f82:	eb 54                	jmp    155fd8 <do_user_addr_fault+0x148>
00f4   155f84:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	155f87: R_X86_64_32S	pv_ops+0xe0
00fb   155f8b:	48 c1 e8 03          	shr    $0x3,%rax
00ff   155f8f:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
0104   155f94:	74 0c                	je     155fa2 <do_user_addr_fault+0x112>
0106   155f96:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	155f99: R_X86_64_32S	pv_ops+0xe0
010d   155f9d:	e8 00 00 00 00       	call   155fa2 <do_user_addr_fault+0x112>	155f9e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0112   155fa2:	48 83 3d 00 00 00 00 00 	cmpq   $0x0,0x0(%rip)        # 155faa <do_user_addr_fault+0x11a>	155fa5: R_X86_64_PC32	pv_ops+0xdb
011a   155faa:	0f 84 d5 0b 00 00    	je     156b85 <do_user_addr_fault+0xcf5>
0120   155fb0:	ff 15 00 00 00 00    	call   *0x0(%rip)        # 155fb6 <do_user_addr_fault+0x126>	155fb2: R_X86_64_PC32	pv_ops+0xdc
0126   155fb6:	48 89 c3             	mov    %rax,%rbx
0129   155fb9:	48 89 c6             	mov    %rax,%rsi
012c   155fbc:	48 81 e6 00 02 00 00 	and    $0x200,%rsi
0133   155fc3:	31 ff                	xor    %edi,%edi
0135   155fc5:	e8 00 00 00 00       	call   155fca <do_user_addr_fault+0x13a>	155fc6: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
013a   155fca:	48 81 e3 00 02 00 00 	and    $0x200,%rbx
0141   155fd1:	75 49                	jne    15601c <do_user_addr_fault+0x18c>
0143   155fd3:	e8 00 00 00 00       	call   155fd8 <do_user_addr_fault+0x148>	155fd4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0148   155fd8:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 155fdf <do_user_addr_fault+0x14f>	155fdb: R_X86_64_PC32	current_kprobe-0x4
014f   155fdf:	31 ff                	xor    %edi,%edi
0151   155fe1:	48 89 de             	mov    %rbx,%rsi
0154   155fe4:	e8 00 00 00 00       	call   155fe9 <do_user_addr_fault+0x159>	155fe5: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0159   155fe9:	48 85 db             	test   %rbx,%rbx
015c   155fec:	74 27                	je     156015 <do_user_addr_fault+0x185>
015e   155fee:	4c 89 ef             	mov    %r13,%rdi
0161   155ff1:	be 0e 00 00 00       	mov    $0xe,%esi
0166   155ff6:	e8 00 00 00 00       	call   155ffb <do_user_addr_fault+0x16b>	155ff7: R_X86_64_PLT32	kprobe_fault_handler-0x4
016b   155ffb:	89 c3                	mov    %eax,%ebx
016d   155ffd:	31 ff                	xor    %edi,%edi
016f   155fff:	89 c6                	mov    %eax,%esi
0171   156001:	e8 00 00 00 00       	call   156006 <do_user_addr_fault+0x176>	156002: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0176   156006:	85 db                	test   %ebx,%ebx
0178   156008:	0f 85 98 09 00 00    	jne    1569a6 <do_user_addr_fault+0xb16>
017e   15600e:	e8 00 00 00 00       	call   156013 <do_user_addr_fault+0x183>	15600f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0183   156013:	eb 0c                	jmp    156021 <do_user_addr_fault+0x191>
0185   156015:	e8 00 00 00 00       	call   15601a <do_user_addr_fault+0x18a>	156016: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
018a   15601a:	eb 05                	jmp    156021 <do_user_addr_fault+0x191>
018c   15601c:	e8 00 00 00 00       	call   156021 <do_user_addr_fault+0x191>	15601d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0191   156021:	4c 89 f6             	mov    %r14,%rsi
0194   156024:	48 83 e6 08          	and    $0x8,%rsi
0198   156028:	31 ff                	xor    %edi,%edi
019a   15602a:	e8 00 00 00 00       	call   15602f <do_user_addr_fault+0x19f>	15602b: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
019f   15602f:	4c 89 f0             	mov    %r14,%rax
01a2   156032:	48 83 e0 08          	and    $0x8,%rax
01a6   156036:	0f 85 e3 08 00 00    	jne    15691f <do_user_addr_fault+0xa8f>
01ac   15603c:	e8 00 00 00 00       	call   156041 <do_user_addr_fault+0x1b1>	15603d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01b1   156041:	e9 00 00 00 00       	jmp    156046 <do_user_addr_fault+0x1b6>	156042: R_X86_64_PLT32	.altinstr_aux+0xcda
01b6   156046:	e8 00 00 00 00       	call   15604b <do_user_addr_fault+0x1bb>	156047: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01bb   15604b:	4c 89 f6             	mov    %r14,%rsi
01be   15604e:	48 83 e6 04          	and    $0x4,%rsi
01c2   156052:	31 ff                	xor    %edi,%edi
01c4   156054:	e8 00 00 00 00       	call   156059 <do_user_addr_fault+0x1c9>	156055: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
01c9   156059:	4c 89 f0             	mov    %r14,%rax
01cc   15605c:	48 83 e0 04          	and    $0x4,%rax
01d0   156060:	75 4f                	jne    1560b1 <do_user_addr_fault+0x221>
01d2   156062:	49 8d 9d 90 00 00 00 	lea    0x90(%r13),%rbx
01d9   156069:	48 89 d8             	mov    %rbx,%rax
01dc   15606c:	48 c1 e8 03          	shr    $0x3,%rax
01e0   156070:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
01e5   156075:	74 08                	je     15607f <do_user_addr_fault+0x1ef>
01e7   156077:	48 89 df             	mov    %rbx,%rdi
01ea   15607a:	e8 00 00 00 00       	call   15607f <do_user_addr_fault+0x1ef>	15607b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
01ef   15607f:	48 8b 1b             	mov    (%rbx),%rbx
01f2   156082:	41 bf 00 00 04 00    	mov    $0x40000,%r15d
01f8   156088:	be 00 00 04 00       	mov    $0x40000,%esi
01fd   15608d:	48 21 de             	and    %rbx,%rsi
0200   156090:	31 ff                	xor    %edi,%edi
0202   156092:	e8 00 00 00 00       	call   156097 <do_user_addr_fault+0x207>	156093: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0207   156097:	49 21 df             	and    %rbx,%r15
020a   15609a:	0f 84 c4 08 00 00    	je     156964 <do_user_addr_fault+0xad4>
0210   1560a0:	e8 00 00 00 00       	call   1560a5 <do_user_addr_fault+0x215>	1560a1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0215   1560a5:	49 bf 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r15
021f   1560af:	eb 05                	jmp    1560b6 <do_user_addr_fault+0x226>
0221   1560b1:	e8 00 00 00 00       	call   1560b6 <do_user_addr_fault+0x226>	1560b2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0226   1560b6:	48 8b 45 90          	mov    -0x70(%rbp),%rax
022a   1560ba:	48 8d 98 d4 10 00 00 	lea    0x10d4(%rax),%rbx
0231   1560c1:	48 89 d8             	mov    %rbx,%rax
0234   1560c4:	48 c1 e8 03          	shr    $0x3,%rax
0238   1560c8:	42 0f b6 04 38       	movzbl (%rax,%r15,1),%eax
023d   1560cd:	84 c0                	test   %al,%al
023f   1560cf:	0f 85 e7 08 00 00    	jne    1569bc <do_user_addr_fault+0xb2c>
0245   1560d5:	8b 1b                	mov    (%rbx),%ebx
0247   1560d7:	31 ff                	xor    %edi,%edi
0249   1560d9:	89 de                	mov    %ebx,%esi
024b   1560db:	e8 00 00 00 00       	call   1560e0 <do_user_addr_fault+0x250>	1560dc: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0250   1560e0:	85 db                	test   %ebx,%ebx
0252   1560e2:	0f 85 4f 08 00 00    	jne    156937 <do_user_addr_fault+0xaa7>
0258   1560e8:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 1560ee <do_user_addr_fault+0x25e>	1560ea: R_X86_64_PC32	pcpu_hot+0x4
025e   1560ee:	89 de                	mov    %ebx,%esi
0260   1560f0:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
0266   1560f6:	31 ff                	xor    %edi,%edi
0268   1560f8:	e8 00 00 00 00       	call   1560fd <do_user_addr_fault+0x26d>	1560f9: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
026d   1560fd:	81 e3 ff ff ff 7f    	and    $0x7fffffff,%ebx
0273   156103:	0f 85 35 08 00 00    	jne    15693e <do_user_addr_fault+0xaae>
0279   156109:	48 83 7d 98 00       	cmpq   $0x0,-0x68(%rbp)
027e   15610e:	0f 84 2a 08 00 00    	je     15693e <do_user_addr_fault+0xaae>
0284   156114:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
0288   156118:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
028d   15611d:	48 8b 5d b8          	mov    -0x48(%rbp),%rbx
0291   156121:	74 08                	je     15612b <do_user_addr_fault+0x29b>
0293   156123:	48 89 df             	mov    %rbx,%rdi
0296   156126:	e8 00 00 00 00       	call   15612b <do_user_addr_fault+0x29b>	156127: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
029b   15612b:	48 8b 1b             	mov    (%rbx),%rbx
029e   15612e:	48 89 de             	mov    %rbx,%rsi
02a1   156131:	48 83 e6 03          	and    $0x3,%rsi
02a5   156135:	31 ff                	xor    %edi,%edi
02a7   156137:	e8 00 00 00 00       	call   15613c <do_user_addr_fault+0x2ac>	156138: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
02ac   15613c:	48 83 e3 03          	and    $0x3,%rbx
02b0   156140:	74 49                	je     15618b <do_user_addr_fault+0x2fb>
02b2   156142:	e8 00 00 00 00       	call   156147 <do_user_addr_fault+0x2b7>	156143: R_X86_64_PLT32	trace_hardirqs_on-0x4
02b7   156147:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	15614a: R_X86_64_32S	pv_ops+0xf0
02be   15614e:	48 c1 e8 03          	shr    $0x3,%rax
02c2   156152:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
02c7   156157:	74 0c                	je     156165 <do_user_addr_fault+0x2d5>
02c9   156159:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	15615c: R_X86_64_32S	pv_ops+0xf0
02d0   156160:	e8 00 00 00 00       	call   156165 <do_user_addr_fault+0x2d5>	156161: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
02d5   156165:	48 83 3d 00 00 00 00 00 	cmpq   $0x0,0x0(%rip)        # 15616d <do_user_addr_fault+0x2dd>	156168: R_X86_64_PC32	pv_ops+0xeb
02dd   15616d:	0f 84 04 0a 00 00    	je     156b77 <do_user_addr_fault+0xce7>
02e3   156173:	e8 00 00 00 00       	call   156178 <do_user_addr_fault+0x2e8>	156174: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
02e8   156178:	ff 15 00 00 00 00    	call   *0x0(%rip)        # 15617e <do_user_addr_fault+0x2ee>	15617a: R_X86_64_PC32	pv_ops+0xec
02ee   15617e:	48 89 e0             	mov    %rsp,%rax
02f1   156181:	bb 54 02 00 00       	mov    $0x254,%ebx
02f6   156186:	e9 93 00 00 00       	jmp    15621e <do_user_addr_fault+0x38e>
02fb   15618b:	49 8d 9d 90 00 00 00 	lea    0x90(%r13),%rbx
0302   156192:	48 89 d8             	mov    %rbx,%rax
0305   156195:	48 c1 e8 03          	shr    $0x3,%rax
0309   156199:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
030e   15619e:	74 08                	je     1561a8 <do_user_addr_fault+0x318>
0310   1561a0:	48 89 df             	mov    %rbx,%rdi
0313   1561a3:	e8 00 00 00 00       	call   1561a8 <do_user_addr_fault+0x318>	1561a4: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0318   1561a8:	48 8b 1b             	mov    (%rbx),%rbx
031b   1561ab:	41 bf 00 02 00 00    	mov    $0x200,%r15d
0321   1561b1:	be 00 02 00 00       	mov    $0x200,%esi
0326   1561b6:	48 21 de             	and    %rbx,%rsi
0329   1561b9:	31 ff                	xor    %edi,%edi
032b   1561bb:	e8 00 00 00 00       	call   1561c0 <do_user_addr_fault+0x330>	1561bc: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0330   1561c0:	49 21 df             	and    %rbx,%r15
0333   1561c3:	75 0c                	jne    1561d1 <do_user_addr_fault+0x341>
0335   1561c5:	e8 00 00 00 00       	call   1561ca <do_user_addr_fault+0x33a>	1561c6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
033a   1561ca:	bb 14 02 00 00       	mov    $0x214,%ebx
033f   1561cf:	eb 50                	jmp    156221 <do_user_addr_fault+0x391>
0341   1561d1:	e8 00 00 00 00       	call   1561d6 <do_user_addr_fault+0x346>	1561d2: R_X86_64_PLT32	trace_hardirqs_on-0x4
0346   1561d6:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	1561d9: R_X86_64_32S	pv_ops+0xf0
034d   1561dd:	48 c1 e8 03          	shr    $0x3,%rax
0351   1561e1:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
035b   1561eb:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
035f   1561ef:	74 0c                	je     1561fd <do_user_addr_fault+0x36d>
0361   1561f1:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1561f4: R_X86_64_32S	pv_ops+0xf0
0368   1561f8:	e8 00 00 00 00       	call   1561fd <do_user_addr_fault+0x36d>	1561f9: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
036d   1561fd:	48 83 3d 00 00 00 00 00 	cmpq   $0x0,0x0(%rip)        # 156205 <do_user_addr_fault+0x375>	156200: R_X86_64_PC32	pv_ops+0xeb
0375   156205:	0f 84 73 09 00 00    	je     156b7e <do_user_addr_fault+0xcee>
037b   15620b:	e8 00 00 00 00       	call   156210 <do_user_addr_fault+0x380>	15620c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0380   156210:	ff 15 00 00 00 00    	call   *0x0(%rip)        # 156216 <do_user_addr_fault+0x386>	156212: R_X86_64_PC32	pv_ops+0xec
0386   156216:	48 89 e0             	mov    %rsp,%rax
0389   156219:	bb 14 02 00 00       	mov    $0x214,%ebx
038e   15621e:	48 89 c4             	mov    %rax,%rsp
0391   156221:	4c 89 6d c8          	mov    %r13,-0x38(%rbp)
0395   156225:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
039a   15622a:	e8 00 00 00 00       	call   15622f <do_user_addr_fault+0x39f>	15622b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
039f   15622f:	44 89 f6             	mov    %r14d,%esi
03a2   156232:	83 e6 40             	and    $0x40,%esi
03a5   156235:	31 ff                	xor    %edi,%edi
03a7   156237:	48 89 75 80          	mov    %rsi,-0x80(%rbp)
03ab   15623b:	e8 00 00 00 00       	call   156240 <do_user_addr_fault+0x3b0>	15623c: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
03b0   156240:	44 89 f6             	mov    %r14d,%esi
03b3   156243:	83 e6 02             	and    $0x2,%esi
03b6   156246:	31 ff                	xor    %edi,%edi
03b8   156248:	48 89 b5 78 ff ff ff 	mov    %rsi,-0x88(%rbp)
03bf   15624f:	e8 00 00 00 00       	call   156254 <do_user_addr_fault+0x3c4>	156250: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
03c4   156254:	45 31 ff             	xor    %r15d,%r15d
03c7   156257:	4c 89 f6             	mov    %r14,%rsi
03ca   15625a:	48 83 e6 42          	and    $0x42,%rsi
03ce   15625e:	41 0f 95 c7          	setne  %r15b
03d2   156262:	31 ff                	xor    %edi,%edi
03d4   156264:	e8 00 00 00 00       	call   156269 <do_user_addr_fault+0x3d9>	156265: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
03d9   156269:	44 09 fb             	or     %r15d,%ebx
03dc   15626c:	89 d8                	mov    %ebx,%eax
03de   15626e:	0d 00 01 00 00       	or     $0x100,%eax
03e3   156273:	4c 89 f6             	mov    %r14,%rsi
03e6   156276:	48 83 e6 10          	and    $0x10,%rsi
03ea   15627a:	0f 44 c3             	cmove  %ebx,%eax
03ed   15627d:	89 45 c4             	mov    %eax,-0x3c(%rbp)
03f0   156280:	31 ff                	xor    %edi,%edi
03f2   156282:	48 89 b5 38 ff ff ff 	mov    %rsi,-0xc8(%rbp)
03f9   156289:	e8 00 00 00 00       	call   15628e <do_user_addr_fault+0x3fe>	15628a: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
03fe   15628e:	4c 89 e3             	mov    %r12,%rbx
0401   156291:	48 81 e3 00 f0 ff ff 	and    $0xfffffffffffff000,%rbx
0408   156298:	48 c7 c7 00 00 60 ff 	mov    $0xffffffffff600000,%rdi
040f   15629f:	48 89 de             	mov    %rbx,%rsi
0412   1562a2:	e8 00 00 00 00       	call   1562a7 <do_user_addr_fault+0x417>	1562a3: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0417   1562a7:	48 81 fb 00 00 60 ff 	cmp    $0xffffffffff600000,%rbx
041e   1562ae:	75 1d                	jne    1562cd <do_user_addr_fault+0x43d>
0420   1562b0:	4c 89 f7             	mov    %r14,%rdi
0423   1562b3:	48 8b 75 c8          	mov    -0x38(%rbp),%rsi
0427   1562b7:	4c 89 e2             	mov    %r12,%rdx
042a   1562ba:	e8 00 00 00 00       	call   1562bf <do_user_addr_fault+0x42f>	1562bb: R_X86_64_PLT32	emulate_vsyscall-0x4
042f   1562bf:	84 c0                	test   %al,%al
0431   1562c1:	74 11                	je     1562d4 <do_user_addr_fault+0x444>
0433   1562c3:	e8 00 00 00 00       	call   1562c8 <do_user_addr_fault+0x438>	1562c4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0438   1562c8:	e9 fb 04 00 00       	jmp    1567c8 <do_user_addr_fault+0x938>
043d   1562cd:	e8 00 00 00 00       	call   1562d2 <do_user_addr_fault+0x442>	1562ce: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0442   1562d2:	eb 05                	jmp    1562d9 <do_user_addr_fault+0x449>
0444   1562d4:	e8 00 00 00 00       	call   1562d9 <do_user_addr_fault+0x449>	1562d5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0449   1562d9:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
044d   1562dd:	4c 89 e6             	mov    %r12,%rsi
0450   1562e0:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
0454   1562e4:	e8 00 00 00 00       	call   1562e9 <do_user_addr_fault+0x459>	1562e5: R_X86_64_PLT32	lock_mm_and_find_vma-0x4
0459   1562e9:	4c 89 e3             	mov    %r12,%rbx
045c   1562ec:	48 85 c0             	test   %rax,%rax
045f   1562ef:	0f 84 61 06 00 00    	je     156956 <do_user_addr_fault+0xac6>
0465   1562f5:	49 89 c4             	mov    %rax,%r12
0468   1562f8:	48 89 5d b0          	mov    %rbx,-0x50(%rbp)
046c   1562fc:	4c 89 f3             	mov    %r14,%rbx
046f   1562ff:	45 31 f6             	xor    %r14d,%r14d
0472   156302:	48 83 bd 78 ff ff ff 00 	cmpq   $0x0,-0x88(%rbp)
047a   15630a:	41 0f 94 c6          	sete   %r14b
047e   15630e:	48 83 7d 80 00       	cmpq   $0x0,-0x80(%rbp)
0483   156313:	41 0f 94 c7          	sete   %r15b
0487   156317:	41 89 dd             	mov    %ebx,%r13d
048a   15631a:	41 81 e5 20 80 00 00 	and    $0x8020,%r13d
0491   156321:	31 ff                	xor    %edi,%edi
0493   156323:	4c 89 ee             	mov    %r13,%rsi
0496   156326:	e8 00 00 00 00       	call   15632b <do_user_addr_fault+0x49b>	156327: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
049b   15632b:	89 de                	mov    %ebx,%esi
049d   15632d:	83 e6 41             	and    $0x41,%esi
04a0   156330:	31 ff                	xor    %edi,%edi
04a2   156332:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
04a9   156339:	e8 00 00 00 00       	call   15633e <do_user_addr_fault+0x4ae>	15633a: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
04ae   15633e:	48 8b 45 90          	mov    -0x70(%rbp),%rax
04b2   156342:	48 05 30 05 00 00    	add    $0x530,%rax
04b8   156348:	48 89 85 58 ff ff ff 	mov    %rax,-0xa8(%rbp)
04bf   15634f:	8b 45 c4             	mov    -0x3c(%rbp),%eax
04c2   156352:	83 c8 20             	or     $0x20,%eax
04c5   156355:	89 45 8c             	mov    %eax,-0x74(%rbp)
04c8   156358:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
04cc   15635c:	83 e3 03             	and    $0x3,%ebx
04cf   15635f:	bf 01 00 00 00       	mov    $0x1,%edi
04d4   156364:	48 89 de             	mov    %rbx,%rsi
04d7   156367:	e8 00 00 00 00       	call   15636c <do_user_addr_fault+0x4dc>	156368: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
04dc   15636c:	48 83 fb 01          	cmp    $0x1,%rbx
04e0   156370:	0f 95 c0             	setne  %al
04e3   156373:	4b 8d 0c b6          	lea    (%r14,%r14,4),%rcx
04e7   156377:	48 83 c1 02          	add    $0x2,%rcx
04eb   15637b:	48 89 8d 50 ff ff ff 	mov    %rcx,-0xb0(%rbp)
04f2   156382:	44 20 f8             	and    %r15b,%al
04f5   156385:	88 45 d7             	mov    %al,-0x29(%rbp)
04f8   156388:	4c 89 a5 48 ff ff ff 	mov    %r12,-0xb8(%rbp)
04ff   15638f:	49 bf 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r15
0509   156399:	48 8b 9d 70 ff ff ff 	mov    -0x90(%rbp),%rbx
0510   1563a0:	4c 8b 75 a8          	mov    -0x58(%rbp),%r14
0514   1563a4:	4d 85 ed             	test   %r13,%r13
0517   1563a7:	0f 84 84 03 00 00    	je     156731 <do_user_addr_fault+0x8a1>
051d   1563ad:	e8 00 00 00 00       	call   1563b2 <do_user_addr_fault+0x522>	1563ae: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0522   1563b2:	4c 8b a5 48 ff ff ff 	mov    -0xb8(%rbp),%r12
0529   1563b9:	4c 8b 75 a8          	mov    -0x58(%rbp),%r14
052d   1563bd:	e9 f3 03 00 00       	jmp    1567b5 <do_user_addr_fault+0x925>
0532   1563c2:	e8 00 00 00 00       	call   1563c7 <do_user_addr_fault+0x537>	1563c3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0537   1563c7:	80 7d d7 00          	cmpb   $0x0,-0x29(%rbp)
053b   1563cb:	0f 84 df 03 00 00    	je     1567b0 <do_user_addr_fault+0x920>
0541   1563d1:	e8 00 00 00 00       	call   1563d6 <do_user_addr_fault+0x546>	1563d2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0546   1563d6:	4c 8b bd 50 ff ff ff 	mov    -0xb0(%rbp),%r15
054d   1563dd:	49 8d 5c 24 20       	lea    0x20(%r12),%rbx
0552   1563e2:	48 89 d8             	mov    %rbx,%rax
0555   1563e5:	48 c1 e8 03          	shr    $0x3,%rax
0559   1563e9:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0563   1563f3:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
0567   1563f7:	74 08                	je     156401 <do_user_addr_fault+0x571>
0569   1563f9:	48 89 df             	mov    %rbx,%rdi
056c   1563fc:	e8 00 00 00 00       	call   156401 <do_user_addr_fault+0x571>	1563fd: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0571   156401:	48 8b 1b             	mov    (%rbx),%rbx
0574   156404:	4c 89 fe             	mov    %r15,%rsi
0577   156407:	48 21 de             	and    %rbx,%rsi
057a   15640a:	31 ff                	xor    %edi,%edi
057c   15640c:	e8 00 00 00 00       	call   156411 <do_user_addr_fault+0x581>	15640d: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0581   156411:	49 21 df             	and    %rbx,%r15
0584   156414:	0f 84 69 05 00 00    	je     156983 <do_user_addr_fault+0xaf3>
058a   15641a:	4c 89 e7             	mov    %r12,%rdi
058d   15641d:	4c 8b 65 b0          	mov    -0x50(%rbp),%r12
0591   156421:	4c 89 e6             	mov    %r12,%rsi
0594   156424:	8b 55 c4             	mov    -0x3c(%rbp),%edx
0597   156427:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
059b   15642b:	e8 00 00 00 00       	call   156430 <do_user_addr_fault+0x5a0>	15642c: R_X86_64_PLT32	handle_mm_fault-0x4
05a0   156430:	41 89 c5             	mov    %eax,%r13d
05a3   156433:	89 c6                	mov    %eax,%esi
05a5   156435:	81 e6 00 04 00 00    	and    $0x400,%esi
05ab   15643b:	31 ff                	xor    %edi,%edi
05ad   15643d:	e8 00 00 00 00       	call   156442 <do_user_addr_fault+0x5b2>	15643e: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
05b2   156442:	44 89 e8             	mov    %r13d,%eax
05b5   156445:	25 00 04 00 00       	and    $0x400,%eax
05ba   15644a:	0f 84 a1 03 00 00    	je     1567f1 <do_user_addr_fault+0x961>
05c0   156450:	4c 8b 7d 90          	mov    -0x70(%rbp),%r15
05c4   156454:	4c 89 ff             	mov    %r15,%rdi
05c7   156457:	be 08 00 00 00       	mov    $0x8,%esi
05cc   15645c:	e8 00 00 00 00       	call   156461 <do_user_addr_fault+0x5d1>	15645d: R_X86_64_PLT32	__kasan_check_read-0x4
05d1   156461:	4c 89 fb             	mov    %r15,%rbx
05d4   156464:	48 c1 eb 03          	shr    $0x3,%rbx
05d8   156468:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
05e2   156472:	80 3c 03 00          	cmpb   $0x0,(%rbx,%rax,1)
05e6   156476:	74 08                	je     156480 <do_user_addr_fault+0x5f0>
05e8   156478:	4c 89 ff             	mov    %r15,%rdi
05eb   15647b:	e8 00 00 00 00       	call   156480 <do_user_addr_fault+0x5f0>	15647c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
05f0   156480:	4d 8b 3f             	mov    (%r15),%r15
05f3   156483:	4c 89 fe             	mov    %r15,%rsi
05f6   156486:	48 83 e6 04          	and    $0x4,%rsi
05fa   15648a:	31 ff                	xor    %edi,%edi
05fc   15648c:	e8 00 00 00 00       	call   156491 <do_user_addr_fault+0x601>	15648d: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0601   156491:	49 83 e7 04          	and    $0x4,%r15
0605   156495:	75 07                	jne    15649e <do_user_addr_fault+0x60e>
0607   156497:	e8 00 00 00 00       	call   15649c <do_user_addr_fault+0x60c>	156498: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
060c   15649c:	eb 4b                	jmp    1564e9 <do_user_addr_fault+0x659>
060e   15649e:	4c 8b bd 58 ff ff ff 	mov    -0xa8(%rbp),%r15
0615   1564a5:	4c 89 f8             	mov    %r15,%rax
0618   1564a8:	48 c1 e8 03          	shr    $0x3,%rax
061c   1564ac:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0626   1564b6:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
062a   1564ba:	74 08                	je     1564c4 <do_user_addr_fault+0x634>
062c   1564bc:	4c 89 ff             	mov    %r15,%rdi
062f   1564bf:	e8 00 00 00 00       	call   1564c4 <do_user_addr_fault+0x634>	1564c0: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0634   1564c4:	4d 8b 3f             	mov    (%r15),%r15
0637   1564c7:	be 00 01 00 00       	mov    $0x100,%esi
063c   1564cc:	4c 21 fe             	and    %r15,%rsi
063f   1564cf:	31 ff                	xor    %edi,%edi
0641   1564d1:	e8 00 00 00 00       	call   1564d6 <do_user_addr_fault+0x646>	1564d2: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0646   1564d6:	b8 00 01 00 00       	mov    $0x100,%eax
064b   1564db:	49 21 c7             	and    %rax,%r15
064e   1564de:	0f 85 88 03 00 00    	jne    15686c <do_user_addr_fault+0x9dc>
0654   1564e4:	e8 00 00 00 00       	call   1564e9 <do_user_addr_fault+0x659>	1564e5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0659   1564e9:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0663   1564f3:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
0667   1564f7:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
066b   1564fb:	4c 8b 7d b8          	mov    -0x48(%rbp),%r15
066f   1564ff:	74 08                	je     156509 <do_user_addr_fault+0x679>
0671   156501:	4c 89 ff             	mov    %r15,%rdi
0674   156504:	e8 00 00 00 00       	call   156509 <do_user_addr_fault+0x679>	156505: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0679   156509:	4d 8b 3f             	mov    (%r15),%r15
067c   15650c:	4c 89 fe             	mov    %r15,%rsi
067f   15650f:	48 83 e6 03          	and    $0x3,%rsi
0683   156513:	31 ff                	xor    %edi,%edi
0685   156515:	e8 00 00 00 00       	call   15651a <do_user_addr_fault+0x68a>	156516: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
068a   15651a:	49 83 e7 03          	and    $0x3,%r15
068e   15651e:	0f 84 b9 00 00 00    	je     1565dd <do_user_addr_fault+0x74d>
0694   156524:	44 89 6d c4          	mov    %r13d,-0x3c(%rbp)
0698   156528:	4c 8b 6d 90          	mov    -0x70(%rbp),%r13
069c   15652c:	4c 89 ef             	mov    %r13,%rdi
069f   15652f:	be 08 00 00 00       	mov    $0x8,%esi
06a4   156534:	e8 00 00 00 00       	call   156539 <do_user_addr_fault+0x6a9>	156535: R_X86_64_PLT32	__kasan_check_read-0x4
06a9   156539:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
06b3   156543:	80 3c 03 00          	cmpb   $0x0,(%rbx,%rax,1)
06b7   156547:	74 08                	je     156551 <do_user_addr_fault+0x6c1>
06b9   156549:	4c 89 ef             	mov    %r13,%rdi
06bc   15654c:	e8 00 00 00 00       	call   156551 <do_user_addr_fault+0x6c1>	15654d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
06c1   156551:	4d 8b 7d 00          	mov    0x0(%r13),%r15
06c5   156555:	be 00 00 02 00       	mov    $0x20000,%esi
06ca   15655a:	4c 21 fe             	and    %r15,%rsi
06cd   15655d:	31 ff                	xor    %edi,%edi
06cf   15655f:	e8 00 00 00 00       	call   156564 <do_user_addr_fault+0x6d4>	156560: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
06d4   156564:	b8 00 00 02 00       	mov    $0x20000,%eax
06d9   156569:	49 21 c7             	and    %rax,%r15
06dc   15656c:	0f 85 40 04 00 00    	jne    1569b2 <do_user_addr_fault+0xb22>
06e2   156572:	4c 89 ef             	mov    %r13,%rdi
06e5   156575:	be 08 00 00 00       	mov    $0x8,%esi
06ea   15657a:	e8 00 00 00 00       	call   15657f <do_user_addr_fault+0x6ef>	15657b: R_X86_64_PLT32	__kasan_check_read-0x4
06ef   15657f:	49 bf 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r15
06f9   156589:	42 80 3c 3b 00       	cmpb   $0x0,(%rbx,%r15,1)
06fe   15658e:	74 08                	je     156598 <do_user_addr_fault+0x708>
0700   156590:	4c 89 ef             	mov    %r13,%rdi
0703   156593:	e8 00 00 00 00       	call   156598 <do_user_addr_fault+0x708>	156594: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0708   156598:	49 8b 5d 00          	mov    0x0(%r13),%rbx
070c   15659c:	48 89 de             	mov    %rbx,%rsi
070f   15659f:	48 83 e6 04          	and    $0x4,%rsi
0713   1565a3:	31 ff                	xor    %edi,%edi
0715   1565a5:	e8 00 00 00 00       	call   1565aa <do_user_addr_fault+0x71a>	1565a6: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
071a   1565aa:	48 83 e3 04          	and    $0x4,%rbx
071e   1565ae:	0f 85 9d 02 00 00    	jne    156851 <do_user_addr_fault+0x9c1>
0724   1565b4:	8b 5d c4             	mov    -0x3c(%rbp),%ebx
0727   1565b7:	89 de                	mov    %ebx,%esi
0729   1565b9:	81 e6 00 40 00 00    	and    $0x4000,%esi
072f   1565bf:	31 ff                	xor    %edi,%edi
0731   1565c1:	e8 00 00 00 00       	call   1565c6 <do_user_addr_fault+0x736>	1565c2: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0736   1565c6:	81 e3 00 40 00 00    	and    $0x4000,%ebx
073c   1565cc:	4c 8b 6d c8          	mov    -0x38(%rbp),%r13
0740   1565d0:	0f 85 82 02 00 00    	jne    156858 <do_user_addr_fault+0x9c8>
0746   1565d6:	e8 00 00 00 00       	call   1565db <do_user_addr_fault+0x74b>	1565d7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
074b   1565db:	eb 30                	jmp    15660d <do_user_addr_fault+0x77d>
074d   1565dd:	44 89 ee             	mov    %r13d,%esi
0750   1565e0:	81 e6 00 40 00 00    	and    $0x4000,%esi
0756   1565e6:	31 ff                	xor    %edi,%edi
0758   1565e8:	e8 00 00 00 00       	call   1565ed <do_user_addr_fault+0x75d>	1565e9: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
075d   1565ed:	41 81 e5 00 40 00 00 	and    $0x4000,%r13d
0764   1565f4:	49 bf 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r15
076e   1565fe:	0f 85 d9 02 00 00    	jne    1568dd <do_user_addr_fault+0xa4d>
0774   156604:	e8 00 00 00 00       	call   156609 <do_user_addr_fault+0x779>	156605: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0779   156609:	4c 8b 6d c8          	mov    -0x38(%rbp),%r13
077d   15660d:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
0781   156611:	4c 89 e6             	mov    %r12,%rsi
0784   156614:	4c 89 ea             	mov    %r13,%rdx
0787   156617:	e8 00 00 00 00       	call   15661c <do_user_addr_fault+0x78c>	156618: R_X86_64_PLT32	lock_mm_and_find_vma-0x4
078c   15661c:	48 85 c0             	test   %rax,%rax
078f   15661f:	48 8b 9d 70 ff ff ff 	mov    -0x90(%rbp),%rbx
0796   156626:	0f 84 61 03 00 00    	je     15698d <do_user_addr_fault+0xafd>
079c   15662c:	49 89 c4             	mov    %rax,%r12
079f   15662f:	e8 00 00 00 00       	call   156634 <do_user_addr_fault+0x7a4>	156630: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
07a4   156634:	8b 45 8c             	mov    -0x74(%rbp),%eax
07a7   156637:	89 45 c4             	mov    %eax,-0x3c(%rbp)
07aa   15663a:	4c 8b ad 68 ff ff ff 	mov    -0x98(%rbp),%r13
07b1   156641:	4d 85 ed             	test   %r13,%r13
07b4   156644:	0f 85 63 fd ff ff    	jne    1563ad <do_user_addr_fault+0x51d>
07ba   15664a:	e9 e2 00 00 00       	jmp    156731 <do_user_addr_fault+0x8a1>
07bf   15664f:	49 8d 5c 24 20       	lea    0x20(%r12),%rbx
07c4   156654:	48 89 d8             	mov    %rbx,%rax
07c7   156657:	48 c1 e8 03          	shr    $0x3,%rax
07cb   15665b:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
07d5   156665:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
07d9   156669:	74 08                	je     156673 <do_user_addr_fault+0x7e3>
07db   15666b:	48 89 df             	mov    %rbx,%rdi
07de   15666e:	e8 00 00 00 00       	call   156673 <do_user_addr_fault+0x7e3>	15666f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
07e3   156673:	48 8b 1b             	mov    (%rbx),%rbx
07e6   156676:	e9 00 00 00 00       	jmp    15667b <do_user_addr_fault+0x7eb>	156677: R_X86_64_PLT32	.altinstr_aux+0xcec
07eb   15667b:	e8 00 00 00 00       	call   156680 <do_user_addr_fault+0x7f0>	15667c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
07f0   156680:	31 c9                	xor    %ecx,%ecx
07f2   156682:	0f 01 ee             	rdpkru
07f5   156685:	41 89 c5             	mov    %eax,%r13d
07f8   156688:	48 c1 eb 1f          	shr    $0x1f,%rbx
07fc   15668c:	83 e3 1e             	and    $0x1e,%ebx
07ff   15668f:	41 bf 01 00 00 00    	mov    $0x1,%r15d
0805   156695:	89 d9                	mov    %ebx,%ecx
0807   156697:	41 d3 e7             	shl    %cl,%r15d
080a   15669a:	44 89 ee             	mov    %r13d,%esi
080d   15669d:	44 21 fe             	and    %r15d,%esi
0810   1566a0:	31 ff                	xor    %edi,%edi
0812   1566a2:	e8 00 00 00 00       	call   1566a7 <do_user_addr_fault+0x817>	1566a3: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0817   1566a7:	45 21 ef             	and    %r13d,%r15d
081a   1566aa:	0f 85 37 02 00 00    	jne    1568e7 <do_user_addr_fault+0xa57>
0820   1566b0:	48 83 bd 78 ff ff ff 00 	cmpq   $0x0,-0x88(%rbp)
0828   1566b8:	75 1e                	jne    1566d8 <do_user_addr_fault+0x848>
082a   1566ba:	48 83 bd 60 ff ff ff 00 	cmpq   $0x0,-0xa0(%rbp)
0832   1566c2:	0f 85 22 01 00 00    	jne    1567ea <do_user_addr_fault+0x95a>
0838   1566c8:	e8 00 00 00 00       	call   1566cd <do_user_addr_fault+0x83d>	1566c9: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
083d   1566cd:	41 bf 07 00 00 00    	mov    $0x7,%r15d
0843   1566d3:	e9 05 fd ff ff       	jmp    1563dd <do_user_addr_fault+0x54d>
0848   1566d8:	b8 03 00 00 00       	mov    $0x3,%eax
084d   1566dd:	89 d9                	mov    %ebx,%ecx
084f   1566df:	d3 e0                	shl    %cl,%eax
0851   1566e1:	41 21 c5             	and    %eax,%r13d
0854   1566e4:	31 ff                	xor    %edi,%edi
0856   1566e6:	44 89 ee             	mov    %r13d,%esi
0859   1566e9:	e8 00 00 00 00       	call   1566ee <do_user_addr_fault+0x85e>	1566ea: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
085e   1566ee:	48 83 7d 80 00       	cmpq   $0x0,-0x80(%rbp)
0863   1566f3:	0f 85 f8 01 00 00    	jne    1568f1 <do_user_addr_fault+0xa61>
0869   1566f9:	45 85 ed             	test   %r13d,%r13d
086c   1566fc:	0f 85 ef 01 00 00    	jne    1568f1 <do_user_addr_fault+0xa61>
0872   156702:	e8 00 00 00 00       	call   156707 <do_user_addr_fault+0x877>	156703: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0877   156707:	41 bf 02 00 00 00    	mov    $0x2,%r15d
087d   15670d:	e9 cb fc ff ff       	jmp    1563dd <do_user_addr_fault+0x54d>
0882   156712:	f3 0f 1e fa          	endbr64
0886   156716:	e8 00 00 00 00       	call   15671b <do_user_addr_fault+0x88b>	156717: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
088b   15671b:	e9 60 ff ff ff       	jmp    156680 <do_user_addr_fault+0x7f0>
0890   156720:	f3 0f 1e fa          	endbr64
0894   156724:	e8 00 00 00 00       	call   156729 <do_user_addr_fault+0x899>	156725: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0899   156729:	45 31 ed             	xor    %r13d,%r13d
089c   15672c:	e9 57 ff ff ff       	jmp    156688 <do_user_addr_fault+0x7f8>
08a1   156731:	4c 89 ad 68 ff ff ff 	mov    %r13,-0x98(%rbp)
08a8   156738:	48 83 bd 38 ff ff ff 00 	cmpq   $0x0,-0xc8(%rbp)
08b0   156740:	75 5f                	jne    1567a1 <do_user_addr_fault+0x911>
08b2   156742:	48 8b 85 40 ff ff ff 	mov    -0xc0(%rbp),%rax
08b9   156749:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
08be   15674e:	74 08                	je     156758 <do_user_addr_fault+0x8c8>
08c0   156750:	48 89 df             	mov    %rbx,%rdi
08c3   156753:	e8 00 00 00 00       	call   156758 <do_user_addr_fault+0x8c8>	156754: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
08c8   156758:	4c 8b 3b             	mov    (%rbx),%r15
08cb   15675b:	4d 85 ff             	test   %r15,%r15
08ce   15675e:	0f 84 5e fc ff ff    	je     1563c2 <do_user_addr_fault+0x532>
08d4   156764:	49 8d 5c 24 10       	lea    0x10(%r12),%rbx
08d9   156769:	48 89 d8             	mov    %rbx,%rax
08dc   15676c:	48 c1 e8 03          	shr    $0x3,%rax
08e0   156770:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
08ea   15677a:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
08ee   15677e:	74 08                	je     156788 <do_user_addr_fault+0x8f8>
08f0   156780:	48 89 df             	mov    %rbx,%rdi
08f3   156783:	e8 00 00 00 00       	call   156788 <do_user_addr_fault+0x8f8>	156784: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
08f8   156788:	4c 3b 3b             	cmp    (%rbx),%r15
08fb   15678b:	0f 84 be fe ff ff    	je     15664f <do_user_addr_fault+0x7bf>
0901   156791:	e8 00 00 00 00       	call   156796 <do_user_addr_fault+0x906>	156792: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0906   156796:	80 7d d7 00          	cmpb   $0x0,-0x29(%rbp)
090a   15679a:	74 14                	je     1567b0 <do_user_addr_fault+0x920>
090c   15679c:	e9 30 fc ff ff       	jmp    1563d1 <do_user_addr_fault+0x541>
0911   1567a1:	e8 00 00 00 00       	call   1567a6 <do_user_addr_fault+0x916>	1567a2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0916   1567a6:	80 7d d7 00          	cmpb   $0x0,-0x29(%rbp)
091a   1567aa:	0f 85 21 fc ff ff    	jne    1563d1 <do_user_addr_fault+0x541>
0920   1567b0:	e8 00 00 00 00       	call   1567b5 <do_user_addr_fault+0x925>	1567b1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0925   1567b5:	48 8b 7d c8          	mov    -0x38(%rbp),%rdi
0929   1567b9:	4c 89 f6             	mov    %r14,%rsi
092c   1567bc:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
0930   1567c0:	4c 89 e1             	mov    %r12,%rcx
0933   1567c3:	e8 48 2e 00 00       	call   159610 <bad_area_access_error>
0938   1567c8:	48 81 c4 a0 00 00 00 	add    $0xa0,%rsp
093f   1567cf:	5b                   	pop    %rbx
0940   1567d0:	41 5c                	pop    %r12
0942   1567d2:	41 5d                	pop    %r13
0944   1567d4:	41 5e                	pop    %r14
0946   1567d6:	41 5f                	pop    %r15
0948   1567d8:	5d                   	pop    %rbp
0949   1567d9:	31 c0                	xor    %eax,%eax
094b   1567db:	31 c9                	xor    %ecx,%ecx
094d   1567dd:	31 ff                	xor    %edi,%edi
094f   1567df:	31 d2                	xor    %edx,%edx
0951   1567e1:	31 f6                	xor    %esi,%esi
0953   1567e3:	45 31 c0             	xor    %r8d,%r8d
0956   1567e6:	45 31 c9             	xor    %r9d,%r9d
0959   1567e9:	c3                   	ret
095a   1567ea:	e8 00 00 00 00       	call   1567ef <do_user_addr_fault+0x95f>	1567eb: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
095f   1567ef:	eb c4                	jmp    1567b5 <do_user_addr_fault+0x925>
0961   1567f1:	44 89 ee             	mov    %r13d,%esi
0964   1567f4:	81 e6 00 40 00 00    	and    $0x4000,%esi
096a   1567fa:	31 ff                	xor    %edi,%edi
096c   1567fc:	e8 00 00 00 00       	call   156801 <do_user_addr_fault+0x971>	1567fd: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0971   156801:	44 89 e8             	mov    %r13d,%eax
0974   156804:	25 00 40 00 00       	and    $0x4000,%eax
0979   156809:	48 8b 5d 90          	mov    -0x70(%rbp),%rbx
097d   15680d:	75 53                	jne    156862 <do_user_addr_fault+0x9d2>
097f   15680f:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
0984   156814:	e8 00 00 00 00       	call   156819 <do_user_addr_fault+0x989>	156815: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0989   156819:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
098d   15681d:	48 81 c7 e8 00 00 00 	add    $0xe8,%rdi
0994   156824:	e8 00 00 00 00       	call   156829 <do_user_addr_fault+0x999>	156825: R_X86_64_PLT32	up_read-0x4
0999   156829:	44 89 ee             	mov    %r13d,%esi
099c   15682c:	81 e6 73 08 00 00    	and    $0x873,%esi
09a2   156832:	31 ff                	xor    %edi,%edi
09a4   156834:	e8 00 00 00 00       	call   156839 <do_user_addr_fault+0x9a9>	156835: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
09a9   156839:	44 89 e8             	mov    %r13d,%eax
09ac   15683c:	25 73 08 00 00       	and    $0x873,%eax
09b1   156841:	0f 85 92 01 00 00    	jne    1569d9 <do_user_addr_fault+0xb49>
09b7   156847:	e8 00 00 00 00       	call   15684c <do_user_addr_fault+0x9bc>	156848: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
09bc   15684c:	e9 77 ff ff ff       	jmp    1567c8 <do_user_addr_fault+0x938>
09c1   156851:	e8 00 00 00 00       	call   156856 <do_user_addr_fault+0x9c6>	156852: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
09c6   156856:	eb 23                	jmp    15687b <do_user_addr_fault+0x9eb>
09c8   156858:	e8 00 00 00 00       	call   15685d <do_user_addr_fault+0x9cd>	156859: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
09cd   15685d:	e9 66 ff ff ff       	jmp    1567c8 <do_user_addr_fault+0x938>
09d2   156862:	e8 00 00 00 00       	call   156867 <do_user_addr_fault+0x9d7>	156863: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
09d7   156867:	e9 5c ff ff ff       	jmp    1567c8 <do_user_addr_fault+0x938>
09dc   15686c:	e8 00 00 00 00       	call   156871 <do_user_addr_fault+0x9e1>	15686d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
09e1   156871:	49 bf 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r15
09eb   15687b:	48 8b 5d b8          	mov    -0x48(%rbp),%rbx
09ef   15687f:	4c 8b 6d c8          	mov    -0x38(%rbp),%r13
09f3   156883:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
09f7   156887:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
09fc   15688c:	74 08                	je     156896 <do_user_addr_fault+0xa06>
09fe   15688e:	48 89 df             	mov    %rbx,%rdi
0a01   156891:	e8 00 00 00 00       	call   156896 <do_user_addr_fault+0xa06>	156892: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0a06   156896:	48 8b 1b             	mov    (%rbx),%rbx
0a09   156899:	48 89 de             	mov    %rbx,%rsi
0a0c   15689c:	48 83 e6 03          	and    $0x3,%rsi
0a10   1568a0:	31 ff                	xor    %edi,%edi
0a12   1568a2:	e8 00 00 00 00       	call   1568a7 <do_user_addr_fault+0xa17>	1568a3: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0a17   1568a7:	48 83 e3 03          	and    $0x3,%rbx
0a1b   1568ab:	74 0a                	je     1568b7 <do_user_addr_fault+0xa27>
0a1d   1568ad:	e8 00 00 00 00       	call   1568b2 <do_user_addr_fault+0xa22>	1568ae: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0a22   1568b2:	e9 11 ff ff ff       	jmp    1567c8 <do_user_addr_fault+0x938>
0a27   1568b7:	e8 00 00 00 00       	call   1568bc <do_user_addr_fault+0xa2c>	1568b8: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0a2c   1568bc:	4c 89 ef             	mov    %r13,%rdi
0a2f   1568bf:	4c 89 f6             	mov    %r14,%rsi
0a32   1568c2:	4c 89 e2             	mov    %r12,%rdx
0a35   1568c5:	b9 07 00 00 00       	mov    $0x7,%ecx
0a3a   1568ca:	41 b8 02 00 00 00    	mov    $0x2,%r8d
0a40   1568d0:	45 31 c9             	xor    %r9d,%r9d
0a43   1568d3:	e8 28 0d 00 00       	call   157600 <kernelmode_fixup_or_oops>
0a48   1568d8:	e9 eb fe ff ff       	jmp    1567c8 <do_user_addr_fault+0x938>
0a4d   1568dd:	e8 00 00 00 00       	call   1568e2 <do_user_addr_fault+0xa52>	1568de: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0a52   1568e2:	e9 e1 fe ff ff       	jmp    1567c8 <do_user_addr_fault+0x938>
0a57   1568e7:	e8 00 00 00 00       	call   1568ec <do_user_addr_fault+0xa5c>	1568e8: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0a5c   1568ec:	e9 c4 fe ff ff       	jmp    1567b5 <do_user_addr_fault+0x925>
0a61   1568f1:	e8 00 00 00 00       	call   1568f6 <do_user_addr_fault+0xa66>	1568f2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0a66   1568f6:	e9 ba fe ff ff       	jmp    1567b5 <do_user_addr_fault+0x925>
0a6b   1568fb:	4c 89 ef             	mov    %r13,%rdi
0a6e   1568fe:	4c 89 e6             	mov    %r12,%rsi
0a71   156901:	e8 2a 2a 00 00       	call   159330 <is_errata93>
0a76   156906:	89 c3                	mov    %eax,%ebx
0a78   156908:	31 ff                	xor    %edi,%edi
0a7a   15690a:	89 c6                	mov    %eax,%esi
0a7c   15690c:	e8 00 00 00 00       	call   156911 <do_user_addr_fault+0xa81>	15690d: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0a81   156911:	85 db                	test   %ebx,%ebx
0a83   156913:	74 56                	je     15696b <do_user_addr_fault+0xadb>
0a85   156915:	e8 00 00 00 00       	call   15691a <do_user_addr_fault+0xa8a>	156916: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0a8a   15691a:	e9 a9 fe ff ff       	jmp    1567c8 <do_user_addr_fault+0x938>
0a8f   15691f:	e8 00 00 00 00       	call   156924 <do_user_addr_fault+0xa94>	156920: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0a94   156924:	4c 89 ef             	mov    %r13,%rdi
0a97   156927:	4c 89 f6             	mov    %r14,%rsi
0a9a   15692a:	4c 89 e2             	mov    %r12,%rdx
0a9d   15692d:	e8 4e 2c 00 00       	call   159580 <pgtable_bad>
0aa2   156932:	e9 0a f7 ff ff       	jmp    156041 <do_user_addr_fault+0x1b1>
0aa7   156937:	e8 00 00 00 00       	call   15693c <do_user_addr_fault+0xaac>	156938: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0aac   15693c:	eb 05                	jmp    156943 <do_user_addr_fault+0xab3>
0aae   15693e:	e8 00 00 00 00       	call   156943 <do_user_addr_fault+0xab3>	15693f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0ab3   156943:	4c 89 ef             	mov    %r13,%rdi
0ab6   156946:	4c 89 f6             	mov    %r14,%rsi
0ab9   156949:	4c 89 e2             	mov    %r12,%rdx
0abc   15694c:	e8 6f 06 00 00       	call   156fc0 <bad_area_nosemaphore>
0ac1   156951:	e9 72 fe ff ff       	jmp    1567c8 <do_user_addr_fault+0x938>
0ac6   156956:	e8 00 00 00 00       	call   15695b <do_user_addr_fault+0xacb>	156957: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0acb   15695b:	4c 8b 6d c8          	mov    -0x38(%rbp),%r13
0acf   15695f:	48 89 da             	mov    %rbx,%rdx
0ad2   156962:	eb 32                	jmp    156996 <do_user_addr_fault+0xb06>
0ad4   156964:	e8 00 00 00 00       	call   156969 <do_user_addr_fault+0xad9>	156965: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0ad9   156969:	eb 05                	jmp    156970 <do_user_addr_fault+0xae0>
0adb   15696b:	e8 00 00 00 00       	call   156970 <do_user_addr_fault+0xae0>	15696c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0ae0   156970:	4c 89 ef             	mov    %r13,%rdi
0ae3   156973:	4c 89 f6             	mov    %r14,%rsi
0ae6   156976:	4c 89 e2             	mov    %r12,%rdx
0ae9   156979:	e8 12 0f 00 00       	call   157890 <page_fault_oops>
0aee   15697e:	e9 45 fe ff ff       	jmp    1567c8 <do_user_addr_fault+0x938>
0af3   156983:	e8 00 00 00 00       	call   156988 <do_user_addr_fault+0xaf8>	156984: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0af8   156988:	e9 28 fe ff ff       	jmp    1567b5 <do_user_addr_fault+0x925>
0afd   15698d:	e8 00 00 00 00       	call   156992 <do_user_addr_fault+0xb02>	15698e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0b02   156992:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
0b06   156996:	4c 89 ef             	mov    %r13,%rdi
0b09   156999:	4c 89 f6             	mov    %r14,%rsi
0b0c   15699c:	e8 1f 06 00 00       	call   156fc0 <bad_area_nosemaphore>
0b11   1569a1:	e9 22 fe ff ff       	jmp    1567c8 <do_user_addr_fault+0x938>
0b16   1569a6:	e8 00 00 00 00       	call   1569ab <do_user_addr_fault+0xb1b>	1569a7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0b1b   1569ab:	0f 0b                	ud2
0b1d   1569ad:	e9 16 fe ff ff       	jmp    1567c8 <do_user_addr_fault+0x938>
0b22   1569b2:	e8 00 00 00 00       	call   1569b7 <do_user_addr_fault+0xb27>	1569b3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0b27   1569b7:	e9 b5 fe ff ff       	jmp    156871 <do_user_addr_fault+0x9e1>
0b2c   1569bc:	89 d9                	mov    %ebx,%ecx
0b2e   1569be:	80 e1 07             	and    $0x7,%cl
0b31   1569c1:	80 c1 03             	add    $0x3,%cl
0b34   1569c4:	38 c1                	cmp    %al,%cl
0b36   1569c6:	0f 8c 09 f7 ff ff    	jl     1560d5 <do_user_addr_fault+0x245>
0b3c   1569cc:	48 89 df             	mov    %rbx,%rdi
0b3f   1569cf:	e8 00 00 00 00       	call   1569d4 <do_user_addr_fault+0xb44>	1569d0: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0b44   1569d4:	e9 fc f6 ff ff       	jmp    1560d5 <do_user_addr_fault+0x245>
0b49   1569d9:	48 89 df             	mov    %rbx,%rdi
0b4c   1569dc:	e8 5f 2f 00 00       	call   159940 <fatal_signal_pending>
0b51   1569e1:	89 c3                	mov    %eax,%ebx
0b53   1569e3:	31 ff                	xor    %edi,%edi
0b55   1569e5:	89 c6                	mov    %eax,%esi
0b57   1569e7:	e8 00 00 00 00       	call   1569ec <do_user_addr_fault+0xb5c>	1569e8: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0b5c   1569ec:	85 db                	test   %ebx,%ebx
0b5e   1569ee:	74 43                	je     156a33 <do_user_addr_fault+0xba3>
0b60   1569f0:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0b6a   1569fa:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
0b6e   1569fe:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
0b72   156a02:	74 09                	je     156a0d <do_user_addr_fault+0xb7d>
0b74   156a04:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
0b78   156a08:	e8 00 00 00 00       	call   156a0d <do_user_addr_fault+0xb7d>	156a09: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0b7d   156a0d:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
0b81   156a11:	48 8b 18             	mov    (%rax),%rbx
0b84   156a14:	48 89 de             	mov    %rbx,%rsi
0b87   156a17:	48 83 e6 03          	and    $0x3,%rsi
0b8b   156a1b:	31 ff                	xor    %edi,%edi
0b8d   156a1d:	e8 00 00 00 00       	call   156a22 <do_user_addr_fault+0xb92>	156a1e: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0b92   156a22:	48 83 e3 03          	and    $0x3,%rbx
0b96   156a26:	0f 84 9e 00 00 00    	je     156aca <do_user_addr_fault+0xc3a>
0b9c   156a2c:	e8 00 00 00 00       	call   156a31 <do_user_addr_fault+0xba1>	156a2d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0ba1   156a31:	eb 05                	jmp    156a38 <do_user_addr_fault+0xba8>
0ba3   156a33:	e8 00 00 00 00       	call   156a38 <do_user_addr_fault+0xba8>	156a34: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0ba8   156a38:	44 89 eb             	mov    %r13d,%ebx
0bab   156a3b:	44 89 ee             	mov    %r13d,%esi
0bae   156a3e:	83 e6 01             	and    $0x1,%esi
0bb1   156a41:	31 ff                	xor    %edi,%edi
0bb3   156a43:	e8 00 00 00 00       	call   156a48 <do_user_addr_fault+0xbb8>	156a44: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0bb8   156a48:	44 89 e8             	mov    %r13d,%eax
0bbb   156a4b:	83 e0 01             	and    $0x1,%eax
0bbe   156a4e:	75 33                	jne    156a83 <do_user_addr_fault+0xbf3>
0bc0   156a50:	44 89 eb             	mov    %r13d,%ebx
0bc3   156a53:	44 89 ee             	mov    %r13d,%esi
0bc6   156a56:	83 e6 32             	and    $0x32,%esi
0bc9   156a59:	31 ff                	xor    %edi,%edi
0bcb   156a5b:	e8 00 00 00 00       	call   156a60 <do_user_addr_fault+0xbd0>	156a5c: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0bd0   156a60:	44 89 e8             	mov    %r13d,%eax
0bd3   156a63:	83 e0 32             	and    $0x32,%eax
0bd6   156a66:	74 7d                	je     156ae5 <do_user_addr_fault+0xc55>
0bd8   156a68:	e8 00 00 00 00       	call   156a6d <do_user_addr_fault+0xbdd>	156a69: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0bdd   156a6d:	48 8b 7d c8          	mov    -0x38(%rbp),%rdi
0be1   156a71:	48 8b 75 a8          	mov    -0x58(%rbp),%rsi
0be5   156a75:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
0be9   156a79:	e8 62 2f 00 00       	call   1599e0 <do_sigbus>
0bee   156a7e:	e9 45 fd ff ff       	jmp    1567c8 <do_user_addr_fault+0x938>
0bf3   156a83:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0bfd   156a8d:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
0c01   156a91:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
0c05   156a95:	74 09                	je     156aa0 <do_user_addr_fault+0xc10>
0c07   156a97:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
0c0b   156a9b:	e8 00 00 00 00       	call   156aa0 <do_user_addr_fault+0xc10>	156a9c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0c10   156aa0:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
0c14   156aa4:	48 8b 18             	mov    (%rax),%rbx
0c17   156aa7:	48 89 de             	mov    %rbx,%rsi
0c1a   156aaa:	48 83 e6 03          	and    $0x3,%rsi
0c1e   156aae:	31 ff                	xor    %edi,%edi
0c20   156ab0:	e8 00 00 00 00       	call   156ab5 <do_user_addr_fault+0xc25>	156ab1: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0c25   156ab5:	48 83 e3 03          	and    $0x3,%rbx
0c29   156ab9:	74 5c                	je     156b17 <do_user_addr_fault+0xc87>
0c2b   156abb:	e8 00 00 00 00       	call   156ac0 <do_user_addr_fault+0xc30>	156abc: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0c30   156ac0:	e8 00 00 00 00       	call   156ac5 <do_user_addr_fault+0xc35>	156ac1: R_X86_64_PLT32	pagefault_out_of_memory-0x4
0c35   156ac5:	e9 fe fc ff ff       	jmp    1567c8 <do_user_addr_fault+0x938>
0c3a   156aca:	e8 00 00 00 00       	call   156acf <do_user_addr_fault+0xc3f>	156acb: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0c3f   156acf:	48 8b 7d c8          	mov    -0x38(%rbp),%rdi
0c43   156ad3:	48 8b 75 a8          	mov    -0x58(%rbp),%rsi
0c47   156ad7:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
0c4b   156adb:	31 c9                	xor    %ecx,%ecx
0c4d   156add:	45 31 c0             	xor    %r8d,%r8d
0c50   156ae0:	e9 eb fd ff ff       	jmp    1568d0 <do_user_addr_fault+0xa40>
0c55   156ae5:	44 89 ee             	mov    %r13d,%esi
0c58   156ae8:	83 e6 40             	and    $0x40,%esi
0c5b   156aeb:	31 ff                	xor    %edi,%edi
0c5d   156aed:	e8 00 00 00 00       	call   156af2 <do_user_addr_fault+0xc62>	156aee: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0c62   156af2:	41 83 e5 40          	and    $0x40,%r13d
0c66   156af6:	0f 84 a9 00 00 00    	je     156ba5 <do_user_addr_fault+0xd15>
0c6c   156afc:	e8 00 00 00 00       	call   156b01 <do_user_addr_fault+0xc71>	156afd: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0c71   156b01:	48 8b 7d c8          	mov    -0x38(%rbp),%rdi
0c75   156b05:	48 8b 75 a8          	mov    -0x58(%rbp),%rsi
0c79   156b09:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
0c7d   156b0d:	e8 ae 04 00 00       	call   156fc0 <bad_area_nosemaphore>
0c82   156b12:	e9 b1 fc ff ff       	jmp    1567c8 <do_user_addr_fault+0x938>
0c87   156b17:	e8 00 00 00 00       	call   156b1c <do_user_addr_fault+0xc8c>	156b18: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0c8c   156b1c:	48 8b 7d c8          	mov    -0x38(%rbp),%rdi
0c90   156b20:	48 8b 75 a8          	mov    -0x58(%rbp),%rsi
0c94   156b24:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
0c98   156b28:	b9 0b 00 00 00       	mov    $0xb,%ecx
0c9d   156b2d:	41 b8 01 00 00 00    	mov    $0x1,%r8d
0ca3   156b33:	e9 98 fd ff ff       	jmp    1568d0 <do_user_addr_fault+0xa40>
0ca8   156b38:	f3 0f 1e fa          	endbr64
0cac   156b3c:	e8 00 00 00 00       	call   156b41 <do_user_addr_fault+0xcb1>	156b3d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0cb1   156b41:	e9 05 f5 ff ff       	jmp    15604b <do_user_addr_fault+0x1bb>
0cb6   156b46:	f3 0f 1e fa          	endbr64
0cba   156b4a:	e8 00 00 00 00       	call   156b4f <do_user_addr_fault+0xcbf>	156b4b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0cbf   156b4f:	e9 62 f5 ff ff       	jmp    1560b6 <do_user_addr_fault+0x226>
0cc4   156b54:	f3 0f 1e fa          	endbr64
0cc8   156b58:	e8 00 00 00 00       	call   156b5d <do_user_addr_fault+0xccd>	156b59: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0ccd   156b5d:	be 01 00 00 00       	mov    $0x1,%esi
0cd2   156b62:	bf 02 00 00 00       	mov    $0x2,%edi
0cd7   156b67:	4c 89 ea             	mov    %r13,%rdx
0cda   156b6a:	4c 89 e1             	mov    %r12,%rcx
0cdd   156b6d:	e8 00 00 00 00       	call   156b72 <do_user_addr_fault+0xce2>	156b6e: R_X86_64_PLT32	__perf_sw_event-0x4
0ce2   156b72:	e9 b8 f6 ff ff       	jmp    15622f <do_user_addr_fault+0x39f>
0ce7   156b77:	e8 00 00 00 00       	call   156b7c <do_user_addr_fault+0xcec>	156b78: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0cec   156b7c:	0f 0b                	ud2
0cee   156b7e:	e8 00 00 00 00       	call   156b83 <do_user_addr_fault+0xcf3>	156b7f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0cf3   156b83:	0f 0b                	ud2
0cf5   156b85:	e8 00 00 00 00       	call   156b8a <do_user_addr_fault+0xcfa>	156b86: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0cfa   156b8a:	0f 0b                	ud2
0cfc   156b8c:	f3 0f 1e fa          	endbr64
0d00   156b90:	e8 00 00 00 00       	call   156b95 <do_user_addr_fault+0xd05>	156b91: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0d05   156b95:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
0d09   156b99:	31 f6                	xor    %esi,%esi
0d0b   156b9b:	e8 00 00 00 00       	call   156ba0 <do_user_addr_fault+0xd10>	156b9c: R_X86_64_PLT32	__mmap_lock_do_trace_released-0x4
0d10   156ba0:	e9 74 fc ff ff       	jmp    156819 <do_user_addr_fault+0x989>
0d15   156ba5:	e8 00 00 00 00       	call   156baa <do_user_addr_fault+0xd1a>	156ba6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0d1a   156baa:	0f 0b                	ud2
0d1c   156bac:	0f 1f 40 00          	nopl   0x0(%rax)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
