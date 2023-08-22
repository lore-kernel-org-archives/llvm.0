Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CAFEA5;
	Tue, 22 Aug 2023 01:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692666376; x=1724202376;
  h=date:from:cc:subject:message-id:mime-version;
  bh=S25hoUkfc/L7UzpvxLvCDLLBSHT5grr+sf2oA5zaBMY=;
  b=FGttcyvkTdf+FcokR2On1LTUSugSjABzIAs78L/J51Jnz3fNxmGBM/af
   0HHbJGOd7/5wUzGUmbmfmpQ2JkAtcs5YNI86fT+ru9/Tikn0zuvHjzU3T
   Y7UBNJRwTEYfUW3EOmGfHBU02BXe3ujFmCaJ6eEi+mZ43iC6D/COKTVhD
   tZiUpMx0e0TEcU1Lxt+8NvvL8GXQmV8s/McmZSPIRnuo0VzB+64ZH//x8
   XIsqckkBHtffUqXVcM2nJqvPMfMXb2wZ+y8eMEVNVbn0qvTY5d3uvoPjA
   A9sW4Ev1DM5cjej865A2hx7Kj/H9XryUKtBft+ZaU9rIMB3uFq4190WOJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="437664154"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="437664154"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 18:06:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="859689659"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="859689659"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 21 Aug 2023 18:06:08 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYFqJ-000194-0k;
	Tue, 22 Aug 2023 01:06:02 +0000
Date: Tue, 22 Aug 2023 09:04:42 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [stable:linux-5.15.y 601/9999]
 drivers/net/ethernet/chelsio/cxgb3/aq100x.o: warning: objtool:
 aq100x_get_link_status()+0x20a: can't find switch jump table
Message-ID: <202308220909.bbUZq7Cg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Peter Zijlstra <peterz@infradead.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Borislav Petkov <bp@suse.de>
CC: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   f6f7927ac664ba23447f8dd3c3dfe2f4ee39272f
commit: cc3011cdbe5f834b0e9873b841d1be02be9a1524 [601/9999] x86/retbleed: Add fine grained Kconfig knobs
config: x86_64-randconfig-004-20230822 (https://download.01.org/0day-ci/archive/20230822/202308220909.bbUZq7Cg-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308220909.bbUZq7Cg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308220909.bbUZq7Cg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/chelsio/cxgb3/aq100x.o: warning: objtool: aq100x_get_link_status()+0x20a: can't find switch jump table


objdump-func vmlinux.o aq100x_get_link_status:
0000 0000000001ad0080 <aq100x_get_link_status>:
0000  1ad0080:	e8 00 00 00 00       	call   1ad0085 <aq100x_get_link_status+0x5>	1ad0081: R_X86_64_PLT32	__fentry__-0x4
0005  1ad0085:	55                   	push   %rbp
0006  1ad0086:	41 57                	push   %r15
0008  1ad0088:	41 56                	push   %r14
000a  1ad008a:	41 55                	push   %r13
000c  1ad008c:	41 54                	push   %r12
000e  1ad008e:	53                   	push   %rbx
000f  1ad008f:	48 83 ec 10          	sub    $0x10,%rsp
0013  1ad0093:	49 89 ce             	mov    %rcx,%r14
0016  1ad0096:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
001b  1ad009b:	49 89 f4             	mov    %rsi,%r12
001e  1ad009e:	49 89 ff             	mov    %rdi,%r15
0021  1ad00a1:	48 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbp
002b  1ad00ab:	e8 00 00 00 00       	call   1ad00b0 <aq100x_get_link_status+0x30>	1ad00ac: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0030  1ad00b0:	4d 85 e4             	test   %r12,%r12
0033  1ad00b3:	0f 84 c5 00 00 00    	je     1ad017e <aq100x_get_link_status+0xfe>
0039  1ad00b9:	4c 89 34 24          	mov    %r14,(%rsp)
003d  1ad00bd:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 1ad00c4 <aq100x_get_link_status+0x44>	1ad00c0: R_X86_64_PC32	_ftrace_branch+0x18f384
0044  1ad00c4:	49 8d 7f 40          	lea    0x40(%r15),%rdi
0048  1ad00c8:	48 89 f8             	mov    %rdi,%rax
004b  1ad00cb:	48 c1 e8 03          	shr    $0x3,%rax
004f  1ad00cf:	48 89 eb             	mov    %rbp,%rbx
0052  1ad00d2:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
0056  1ad00d6:	74 05                	je     1ad00dd <aq100x_get_link_status+0x5d>
0058  1ad00d8:	e8 00 00 00 00       	call   1ad00dd <aq100x_get_link_status+0x5d>	1ad00d9: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
005d  1ad00dd:	4d 8d 6f 28          	lea    0x28(%r15),%r13
0061  1ad00e1:	4d 8b 77 40          	mov    0x40(%r15),%r14
0065  1ad00e5:	49 8d 6f 38          	lea    0x38(%r15),%rbp
0069  1ad00e9:	48 89 e8             	mov    %rbp,%rax
006c  1ad00ec:	48 c1 e8 03          	shr    $0x3,%rax
0070  1ad00f0:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1)
0074  1ad00f4:	74 08                	je     1ad00fe <aq100x_get_link_status+0x7e>
0076  1ad00f6:	48 89 ef             	mov    %rbp,%rdi
0079  1ad00f9:	e8 00 00 00 00       	call   1ad00fe <aq100x_get_link_status+0x7e>	1ad00fa: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
007e  1ad00fe:	48 8b 6d 00          	mov    0x0(%rbp),%rbp
0082  1ad0102:	4c 89 e8             	mov    %r13,%rax
0085  1ad0105:	48 c1 e8 03          	shr    $0x3,%rax
0089  1ad0109:	0f b6 04 18          	movzbl (%rax,%rbx,1),%eax
008d  1ad010d:	84 c0                	test   %al,%al
008f  1ad010f:	0f 85 89 02 00 00    	jne    1ad039e <aq100x_get_link_status+0x31e>
0095  1ad0115:	41 8b 75 00          	mov    0x0(%r13),%esi
0099  1ad0119:	48 89 ef             	mov    %rbp,%rdi
009c  1ad011c:	ba 01 00 00 00       	mov    $0x1,%edx
00a1  1ad0121:	b9 00 e8 00 00       	mov    $0xe800,%ecx
00a6  1ad0126:	41 ff d6             	call   *%r14
00a9  1ad0129:	89 c5                	mov    %eax,%ebp
00ab  1ad012b:	31 ff                	xor    %edi,%edi
00ad  1ad012d:	89 c6                	mov    %eax,%esi
00af  1ad012f:	e8 00 00 00 00       	call   1ad0134 <aq100x_get_link_status+0xb4>	1ad0130: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
00b4  1ad0134:	85 ed                	test   %ebp,%ebp
00b6  1ad0136:	78 54                	js     1ad018c <aq100x_get_link_status+0x10c>
00b8  1ad0138:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 1ad013f <aq100x_get_link_status+0xbf>	1ad013b: R_X86_64_PC32	_ftrace_branch+0x18f38c
00bf  1ad013f:	83 e5 01             	and    $0x1,%ebp
00c2  1ad0142:	4c 89 e0             	mov    %r12,%rax
00c5  1ad0145:	48 c1 e8 03          	shr    $0x3,%rax
00c9  1ad0149:	0f b6 04 18          	movzbl (%rax,%rbx,1),%eax
00cd  1ad014d:	84 c0                	test   %al,%al
00cf  1ad014f:	0f 85 c5 02 00 00    	jne    1ad041a <aq100x_get_link_status+0x39a>
00d5  1ad0155:	41 89 2c 24          	mov    %ebp,(%r12)
00d9  1ad0159:	45 31 e4             	xor    %r12d,%r12d
00dc  1ad015c:	31 ff                	xor    %edi,%edi
00de  1ad015e:	89 ee                	mov    %ebp,%esi
00e0  1ad0160:	e8 00 00 00 00       	call   1ad0165 <aq100x_get_link_status+0xe5>	1ad0161: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
00e5  1ad0165:	85 ed                	test   %ebp,%ebp
00e7  1ad0167:	4c 8b 34 24          	mov    (%rsp),%r14
00eb  1ad016b:	75 33                	jne    1ad01a0 <aq100x_get_link_status+0x120>
00ed  1ad016d:	e8 00 00 00 00       	call   1ad0172 <aq100x_get_link_status+0xf2>	1ad016e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00f2  1ad0172:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 1ad0179 <aq100x_get_link_status+0xf9>	1ad0175: R_X86_64_PC32	_ftrace_branch+0x18f3a4
00f9  1ad0179:	e9 0e 02 00 00       	jmp    1ad038c <aq100x_get_link_status+0x30c>
00fe  1ad017e:	e8 00 00 00 00       	call   1ad0183 <aq100x_get_link_status+0x103>	1ad017f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0103  1ad0183:	49 c7 c4 00 00 00 00 	mov    $0x0,%r12	1ad0186: R_X86_64_32S	_ftrace_branch+0x18f380
010a  1ad018a:	eb 23                	jmp    1ad01af <aq100x_get_link_status+0x12f>
010c  1ad018c:	e8 00 00 00 00       	call   1ad0191 <aq100x_get_link_status+0x111>	1ad018d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0111  1ad0191:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 1ad0198 <aq100x_get_link_status+0x118>	1ad0194: R_X86_64_PC32	_ftrace_branch+0x18f394
0118  1ad0198:	41 89 ec             	mov    %ebp,%r12d
011b  1ad019b:	e9 ec 01 00 00       	jmp    1ad038c <aq100x_get_link_status+0x30c>
0120  1ad01a0:	e8 00 00 00 00       	call   1ad01a5 <aq100x_get_link_status+0x125>	1ad01a1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0125  1ad01a5:	49 c7 c4 00 00 00 00 	mov    $0x0,%r12	1ad01a8: R_X86_64_32S	_ftrace_branch+0x18f3a0
012c  1ad01ac:	48 89 dd             	mov    %rbx,%rbp
012f  1ad01af:	4d 8d 6c 24 07       	lea    0x7(%r12),%r13
0134  1ad01b4:	4c 89 e0             	mov    %r12,%rax
0137  1ad01b7:	48 c1 e8 03          	shr    $0x3,%rax
013b  1ad01bb:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax
013f  1ad01bf:	84 c0                	test   %al,%al
0141  1ad01c1:	0f 85 f5 01 00 00    	jne    1ad03bc <aq100x_get_link_status+0x33c>
0147  1ad01c7:	4c 89 e8             	mov    %r13,%rax
014a  1ad01ca:	48 c1 e8 03          	shr    $0x3,%rax
014e  1ad01ce:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax
0152  1ad01d2:	84 c0                	test   %al,%al
0154  1ad01d4:	0f 85 02 02 00 00    	jne    1ad03dc <aq100x_get_link_status+0x35c>
015a  1ad01da:	49 ff 04 24          	incq   (%r12)
015e  1ad01de:	49 8d 7f 40          	lea    0x40(%r15),%rdi
0162  1ad01e2:	48 89 f8             	mov    %rdi,%rax
0165  1ad01e5:	48 c1 e8 03          	shr    $0x3,%rax
0169  1ad01e9:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
016d  1ad01ed:	74 05                	je     1ad01f4 <aq100x_get_link_status+0x174>
016f  1ad01ef:	e8 00 00 00 00       	call   1ad01f4 <aq100x_get_link_status+0x174>	1ad01f0: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0174  1ad01f4:	4d 8d 67 28          	lea    0x28(%r15),%r12
0178  1ad01f8:	4d 8b 6f 40          	mov    0x40(%r15),%r13
017c  1ad01fc:	49 83 c7 38          	add    $0x38,%r15
0180  1ad0200:	4c 89 f8             	mov    %r15,%rax
0183  1ad0203:	48 c1 e8 03          	shr    $0x3,%rax
0187  1ad0207:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
018b  1ad020b:	74 08                	je     1ad0215 <aq100x_get_link_status+0x195>
018d  1ad020d:	4c 89 ff             	mov    %r15,%rdi
0190  1ad0210:	e8 00 00 00 00       	call   1ad0215 <aq100x_get_link_status+0x195>	1ad0211: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0195  1ad0215:	4d 8b 3f             	mov    (%r15),%r15
0198  1ad0218:	4c 89 e0             	mov    %r12,%rax
019b  1ad021b:	48 c1 e8 03          	shr    $0x3,%rax
019f  1ad021f:	48 89 eb             	mov    %rbp,%rbx
01a2  1ad0222:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax
01a6  1ad0226:	84 c0                	test   %al,%al
01a8  1ad0228:	0f 85 ce 01 00 00    	jne    1ad03fc <aq100x_get_link_status+0x37c>
01ae  1ad022e:	41 8b 34 24          	mov    (%r12),%esi
01b2  1ad0232:	4c 89 ff             	mov    %r15,%rdi
01b5  1ad0235:	ba 07 00 00 00       	mov    $0x7,%edx
01ba  1ad023a:	b9 00 c8 00 00       	mov    $0xc800,%ecx
01bf  1ad023f:	41 ff d5             	call   *%r13
01c2  1ad0242:	41 89 c4             	mov    %eax,%r12d
01c5  1ad0245:	31 ff                	xor    %edi,%edi
01c7  1ad0247:	89 c6                	mov    %eax,%esi
01c9  1ad0249:	e8 00 00 00 00       	call   1ad024e <aq100x_get_link_status+0x1ce>	1ad024a: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
01ce  1ad024e:	bd ff ff ff ff       	mov    $0xffffffff,%ebp
01d3  1ad0253:	45 85 e4             	test   %r12d,%r12d
01d6  1ad0256:	41 0f 49 ec          	cmovns %r12d,%ebp
01da  1ad025a:	78 61                	js     1ad02bd <aq100x_get_link_status+0x23d>
01dc  1ad025c:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 1ad0263 <aq100x_get_link_status+0x1e3>	1ad025f: R_X86_64_PC32	_ftrace_branch+0x18f3ac
01e3  1ad0263:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
01e8  1ad0268:	4d 85 e4             	test   %r12,%r12
01eb  1ad026b:	74 61                	je     1ad02ce <aq100x_get_link_status+0x24e>
01ed  1ad026d:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 1ad0274 <aq100x_get_link_status+0x1f4>	1ad0270: R_X86_64_PC32	_ftrace_branch+0x18f3c4
01f4  1ad0274:	41 89 ef             	mov    %ebp,%r15d
01f7  1ad0277:	41 83 e7 06          	and    $0x6,%r15d
01fb  1ad027b:	4c 89 ff             	mov    %r15,%rdi
01fe  1ad027e:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	1ad0281: R_X86_64_32S	.data+0xa28ab0
0205  1ad0285:	e8 00 00 00 00       	call   1ad028a <aq100x_get_link_status+0x20a>	1ad0286: R_X86_64_PLT32	__sanitizer_cov_trace_switch-0x4
020a  1ad028a:	42 ff 24 fd 00 00 00 00 	jmp    *0x0(,%r15,8)	1ad028e: R_X86_64_32S	.rodata+0x3d5b40
0212  1ad0292:	e8 00 00 00 00       	call   1ad0297 <aq100x_get_link_status+0x217>	1ad0293: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0217  1ad0297:	4c 89 e0             	mov    %r12,%rax
021a  1ad029a:	48 c1 e8 03          	shr    $0x3,%rax
021e  1ad029e:	0f b6 04 18          	movzbl (%rax,%rbx,1),%eax
0222  1ad02a2:	84 c0                	test   %al,%al
0224  1ad02a4:	0f 85 ac 01 00 00    	jne    1ad0456 <aq100x_get_link_status+0x3d6>
022a  1ad02aa:	41 c7 04 24 0a 00 00 00 	movl   $0xa,(%r12)
0232  1ad02b2:	4d 85 f6             	test   %r14,%r14
0235  1ad02b5:	0f 85 a9 00 00 00    	jne    1ad0364 <aq100x_get_link_status+0x2e4>
023b  1ad02bb:	eb 74                	jmp    1ad0331 <aq100x_get_link_status+0x2b1>
023d  1ad02bd:	e8 00 00 00 00       	call   1ad02c2 <aq100x_get_link_status+0x242>	1ad02be: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0242  1ad02c2:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 1ad02c9 <aq100x_get_link_status+0x249>	1ad02c5: R_X86_64_PC32	_ftrace_branch+0x18f3b4
0249  1ad02c9:	e9 be 00 00 00       	jmp    1ad038c <aq100x_get_link_status+0x30c>
024e  1ad02ce:	e8 00 00 00 00       	call   1ad02d3 <aq100x_get_link_status+0x253>	1ad02cf: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0253  1ad02d3:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 1ad02da <aq100x_get_link_status+0x25a>	1ad02d6: R_X86_64_PC32	_ftrace_branch+0x18f3bc
025a  1ad02da:	4d 85 f6             	test   %r14,%r14
025d  1ad02dd:	0f 85 81 00 00 00    	jne    1ad0364 <aq100x_get_link_status+0x2e4>
0263  1ad02e3:	eb 4c                	jmp    1ad0331 <aq100x_get_link_status+0x2b1>
0265  1ad02e5:	e8 00 00 00 00       	call   1ad02ea <aq100x_get_link_status+0x26a>	1ad02e6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
026a  1ad02ea:	4c 89 e0             	mov    %r12,%rax
026d  1ad02ed:	48 c1 e8 03          	shr    $0x3,%rax
0271  1ad02f1:	0f b6 04 18          	movzbl (%rax,%rbx,1),%eax
0275  1ad02f5:	84 c0                	test   %al,%al
0277  1ad02f7:	0f 85 77 01 00 00    	jne    1ad0474 <aq100x_get_link_status+0x3f4>
027d  1ad02fd:	41 c7 04 24 10 27 00 00 	movl   $0x2710,(%r12)
0285  1ad0305:	4d 85 f6             	test   %r14,%r14
0288  1ad0308:	75 5a                	jne    1ad0364 <aq100x_get_link_status+0x2e4>
028a  1ad030a:	eb 25                	jmp    1ad0331 <aq100x_get_link_status+0x2b1>
028c  1ad030c:	e8 00 00 00 00       	call   1ad0311 <aq100x_get_link_status+0x291>	1ad030d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0291  1ad0311:	4c 89 e0             	mov    %r12,%rax
0294  1ad0314:	48 c1 e8 03          	shr    $0x3,%rax
0298  1ad0318:	0f b6 04 18          	movzbl (%rax,%rbx,1),%eax
029c  1ad031c:	84 c0                	test   %al,%al
029e  1ad031e:	0f 85 6e 01 00 00    	jne    1ad0492 <aq100x_get_link_status+0x412>
02a4  1ad0324:	41 c7 04 24 64 00 00 00 	movl   $0x64,(%r12)
02ac  1ad032c:	4d 85 f6             	test   %r14,%r14
02af  1ad032f:	75 33                	jne    1ad0364 <aq100x_get_link_status+0x2e4>
02b1  1ad0331:	e8 00 00 00 00       	call   1ad0336 <aq100x_get_link_status+0x2b6>	1ad0332: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
02b6  1ad0336:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 1ad033d <aq100x_get_link_status+0x2bd>	1ad0339: R_X86_64_PC32	_ftrace_branch+0x18f3cc
02bd  1ad033d:	eb 4a                	jmp    1ad0389 <aq100x_get_link_status+0x309>
02bf  1ad033f:	e8 00 00 00 00       	call   1ad0344 <aq100x_get_link_status+0x2c4>	1ad0340: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
02c4  1ad0344:	4c 89 e0             	mov    %r12,%rax
02c7  1ad0347:	48 c1 e8 03          	shr    $0x3,%rax
02cb  1ad034b:	0f b6 04 18          	movzbl (%rax,%rbx,1),%eax
02cf  1ad034f:	84 c0                	test   %al,%al
02d1  1ad0351:	0f 85 59 01 00 00    	jne    1ad04b0 <aq100x_get_link_status+0x430>
02d7  1ad0357:	41 c7 04 24 e8 03 00 00 	movl   $0x3e8,(%r12)
02df  1ad035f:	4d 85 f6             	test   %r14,%r14
02e2  1ad0362:	74 cd                	je     1ad0331 <aq100x_get_link_status+0x2b1>
02e4  1ad0364:	e8 00 00 00 00       	call   1ad0369 <aq100x_get_link_status+0x2e9>	1ad0365: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
02e9  1ad0369:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 1ad0370 <aq100x_get_link_status+0x2f0>	1ad036c: R_X86_64_PC32	_ftrace_branch+0x18f3d4
02f0  1ad0370:	83 e5 01             	and    $0x1,%ebp
02f3  1ad0373:	4c 89 f0             	mov    %r14,%rax
02f6  1ad0376:	48 c1 e8 03          	shr    $0x3,%rax
02fa  1ad037a:	0f b6 04 18          	movzbl (%rax,%rbx,1),%eax
02fe  1ad037e:	84 c0                	test   %al,%al
0300  1ad0380:	0f 85 b2 00 00 00    	jne    1ad0438 <aq100x_get_link_status+0x3b8>
0306  1ad0386:	41 89 2e             	mov    %ebp,(%r14)
0309  1ad0389:	45 31 e4             	xor    %r12d,%r12d
030c  1ad038c:	44 89 e0             	mov    %r12d,%eax
030f  1ad038f:	48 83 c4 10          	add    $0x10,%rsp
0313  1ad0393:	5b                   	pop    %rbx
0314  1ad0394:	41 5c                	pop    %r12
0316  1ad0396:	41 5d                	pop    %r13
0318  1ad0398:	41 5e                	pop    %r14
031a  1ad039a:	41 5f                	pop    %r15
031c  1ad039c:	5d                   	pop    %rbp
031d  1ad039d:	c3                   	ret
031e  1ad039e:	44 89 e9             	mov    %r13d,%ecx
0321  1ad03a1:	80 e1 07             	and    $0x7,%cl
0324  1ad03a4:	80 c1 03             	add    $0x3,%cl
0327  1ad03a7:	38 c1                	cmp    %al,%cl
0329  1ad03a9:	0f 8c 66 fd ff ff    	jl     1ad0115 <aq100x_get_link_status+0x95>
032f  1ad03af:	4c 89 ef             	mov    %r13,%rdi
0332  1ad03b2:	e8 00 00 00 00       	call   1ad03b7 <aq100x_get_link_status+0x337>	1ad03b3: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0337  1ad03b7:	e9 59 fd ff ff       	jmp    1ad0115 <aq100x_get_link_status+0x95>
033c  1ad03bc:	44 89 e1             	mov    %r12d,%ecx
033f  1ad03bf:	80 e1 07             	and    $0x7,%cl
0342  1ad03c2:	38 c1                	cmp    %al,%cl
0344  1ad03c4:	0f 8c fd fd ff ff    	jl     1ad01c7 <aq100x_get_link_status+0x147>
034a  1ad03ca:	be 08 00 00 00       	mov    $0x8,%esi
034f  1ad03cf:	4c 89 e7             	mov    %r12,%rdi
0352  1ad03d2:	e8 00 00 00 00       	call   1ad03d7 <aq100x_get_link_status+0x357>	1ad03d3: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
0357  1ad03d7:	e9 eb fd ff ff       	jmp    1ad01c7 <aq100x_get_link_status+0x147>
035c  1ad03dc:	44 89 e9             	mov    %r13d,%ecx
035f  1ad03df:	80 e1 07             	and    $0x7,%cl
0362  1ad03e2:	38 c1                	cmp    %al,%cl
0364  1ad03e4:	0f 8c f0 fd ff ff    	jl     1ad01da <aq100x_get_link_status+0x15a>
036a  1ad03ea:	be 08 00 00 00       	mov    $0x8,%esi
036f  1ad03ef:	4c 89 ef             	mov    %r13,%rdi
0372  1ad03f2:	e8 00 00 00 00       	call   1ad03f7 <aq100x_get_link_status+0x377>	1ad03f3: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
0377  1ad03f7:	e9 de fd ff ff       	jmp    1ad01da <aq100x_get_link_status+0x15a>
037c  1ad03fc:	44 89 e1             	mov    %r12d,%ecx
037f  1ad03ff:	80 e1 07             	and    $0x7,%cl
0382  1ad0402:	80 c1 03             	add    $0x3,%cl
0385  1ad0405:	38 c1                	cmp    %al,%cl
0387  1ad0407:	0f 8c 21 fe ff ff    	jl     1ad022e <aq100x_get_link_status+0x1ae>
038d  1ad040d:	4c 89 e7             	mov    %r12,%rdi
0390  1ad0410:	e8 00 00 00 00       	call   1ad0415 <aq100x_get_link_status+0x395>	1ad0411: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0395  1ad0415:	e9 14 fe ff ff       	jmp    1ad022e <aq100x_get_link_status+0x1ae>
039a  1ad041a:	44 89 e1             	mov    %r12d,%ecx
039d  1ad041d:	80 e1 07             	and    $0x7,%cl
03a0  1ad0420:	80 c1 03             	add    $0x3,%cl
03a3  1ad0423:	38 c1                	cmp    %al,%cl
03a5  1ad0425:	0f 8c 2a fd ff ff    	jl     1ad0155 <aq100x_get_link_status+0xd5>
03ab  1ad042b:	4c 89 e7             	mov    %r12,%rdi
03ae  1ad042e:	e8 00 00 00 00       	call   1ad0433 <aq100x_get_link_status+0x3b3>	1ad042f: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
03b3  1ad0433:	e9 1d fd ff ff       	jmp    1ad0155 <aq100x_get_link_status+0xd5>
03b8  1ad0438:	44 89 f1             	mov    %r14d,%ecx
03bb  1ad043b:	80 e1 07             	and    $0x7,%cl
03be  1ad043e:	80 c1 03             	add    $0x3,%cl
03c1  1ad0441:	38 c1                	cmp    %al,%cl
03c3  1ad0443:	0f 8c 3d ff ff ff    	jl     1ad0386 <aq100x_get_link_status+0x306>
03c9  1ad0449:	4c 89 f7             	mov    %r14,%rdi
03cc  1ad044c:	e8 00 00 00 00       	call   1ad0451 <aq100x_get_link_status+0x3d1>	1ad044d: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
03d1  1ad0451:	e9 30 ff ff ff       	jmp    1ad0386 <aq100x_get_link_status+0x306>
03d6  1ad0456:	44 89 e1             	mov    %r12d,%ecx
03d9  1ad0459:	80 e1 07             	and    $0x7,%cl
03dc  1ad045c:	80 c1 03             	add    $0x3,%cl
03df  1ad045f:	38 c1                	cmp    %al,%cl
03e1  1ad0461:	0f 8c 43 fe ff ff    	jl     1ad02aa <aq100x_get_link_status+0x22a>
03e7  1ad0467:	4c 89 e7             	mov    %r12,%rdi
03ea  1ad046a:	e8 00 00 00 00       	call   1ad046f <aq100x_get_link_status+0x3ef>	1ad046b: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
03ef  1ad046f:	e9 36 fe ff ff       	jmp    1ad02aa <aq100x_get_link_status+0x22a>
03f4  1ad0474:	44 89 e1             	mov    %r12d,%ecx
03f7  1ad0477:	80 e1 07             	and    $0x7,%cl
03fa  1ad047a:	80 c1 03             	add    $0x3,%cl
03fd  1ad047d:	38 c1                	cmp    %al,%cl
03ff  1ad047f:	0f 8c 78 fe ff ff    	jl     1ad02fd <aq100x_get_link_status+0x27d>
0405  1ad0485:	4c 89 e7             	mov    %r12,%rdi
0408  1ad0488:	e8 00 00 00 00       	call   1ad048d <aq100x_get_link_status+0x40d>	1ad0489: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
040d  1ad048d:	e9 6b fe ff ff       	jmp    1ad02fd <aq100x_get_link_status+0x27d>
0412  1ad0492:	44 89 e1             	mov    %r12d,%ecx
0415  1ad0495:	80 e1 07             	and    $0x7,%cl
0418  1ad0498:	80 c1 03             	add    $0x3,%cl
041b  1ad049b:	38 c1                	cmp    %al,%cl
041d  1ad049d:	0f 8c 81 fe ff ff    	jl     1ad0324 <aq100x_get_link_status+0x2a4>
0423  1ad04a3:	4c 89 e7             	mov    %r12,%rdi
0426  1ad04a6:	e8 00 00 00 00       	call   1ad04ab <aq100x_get_link_status+0x42b>	1ad04a7: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
042b  1ad04ab:	e9 74 fe ff ff       	jmp    1ad0324 <aq100x_get_link_status+0x2a4>
0430  1ad04b0:	44 89 e1             	mov    %r12d,%ecx
0433  1ad04b3:	80 e1 07             	and    $0x7,%cl
0436  1ad04b6:	80 c1 03             	add    $0x3,%cl
0439  1ad04b9:	38 c1                	cmp    %al,%cl
043b  1ad04bb:	0f 8c 96 fe ff ff    	jl     1ad0357 <aq100x_get_link_status+0x2d7>
0441  1ad04c1:	4c 89 e7             	mov    %r12,%rdi
0444  1ad04c4:	e8 00 00 00 00       	call   1ad04c9 <aq100x_get_link_status+0x449>	1ad04c5: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
0449  1ad04c9:	e9 89 fe ff ff       	jmp    1ad0357 <aq100x_get_link_status+0x2d7>
044e  1ad04ce:	66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
045d  1ad04dd:	66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
046c  1ad04ec:	66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
047b  1ad04fb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
