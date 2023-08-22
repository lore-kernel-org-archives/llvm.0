Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C480310E5;
	Tue, 22 Aug 2023 00:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692664936; x=1724200936;
  h=date:from:cc:subject:message-id:mime-version;
  bh=KpTlBJWkbRLsQzbRLyT5M9CCd8Hrk4vDD5SyTfFW/uI=;
  b=ngaQfnlY7950JgCIeQn68vNUfHikxAXxi4mvY6/3nub8WQg3CsPv/xXp
   fBRD2speSXq4OCKH3mroATL9oFX+M/Mxsw4y0mRE5H/wEvEOTXhug7zVp
   BVyFUAImsjTpJg8W+MNzRrxn6ubA6Lf9tsOlwm8gdrt6e8TO/+8mXBXEb
   gwEb/aUNOm8Xq8MbM5LcN77bIjxLdIumFkcdlszzbfGrrrbuWHEMM5i0M
   YbG851u0u3kJItXpmQRwvG+9qVeWB/iLJiJFQf9K2uIUaByYVdu2K5cUv
   u1AqJuarJCBJrIA0hqnbnIWSSjwJ3dQ8puKp6etzln2wJbiBmqlW1FWIO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="460108487"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="460108487"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 17:42:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="771148123"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="771148123"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 21 Aug 2023 17:42:13 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYFTJ-00017m-0V;
	Tue, 22 Aug 2023 00:42:13 +0000
Date: Tue, 22 Aug 2023 08:42:03 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [stable:linux-5.10.y 2874/9999]
 drivers/net/ethernet/chelsio/cxgb3/aq100x.o: warning: objtool:
 aq100x_get_link_status()+0x20a: can't find switch jump table
Message-ID: <202308220830.zVqkR1IR-lkp@intel.com>
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
CC: Ben Hutchings <bwh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.10.y
head:   da742ebfa00c3add4a358dd79ec92161c07e1435
commit: b24fdd0f1c3328cf8ee0c518b93a7187f8cee097 [2874/9999] x86/retbleed: Add fine grained Kconfig knobs
config: x86_64-randconfig-004-20230822 (https://download.01.org/0day-ci/archive/20230822/202308220830.zVqkR1IR-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308220830.zVqkR1IR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308220830.zVqkR1IR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/chelsio/cxgb3/aq100x.o: warning: objtool: aq100x_get_link_status()+0x20a: can't find switch jump table


objdump-func vmlinux.o aq100x_get_link_status:
0000 0000000001966100 <aq100x_get_link_status>:
0000  1966100:	e8 00 00 00 00       	call   1966105 <aq100x_get_link_status+0x5>	1966101: R_X86_64_PLT32	__fentry__-0x4
0005  1966105:	55                   	push   %rbp
0006  1966106:	41 57                	push   %r15
0008  1966108:	41 56                	push   %r14
000a  196610a:	41 55                	push   %r13
000c  196610c:	41 54                	push   %r12
000e  196610e:	53                   	push   %rbx
000f  196610f:	48 83 ec 10          	sub    $0x10,%rsp
0013  1966113:	49 89 ce             	mov    %rcx,%r14
0016  1966116:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
001b  196611b:	49 89 f4             	mov    %rsi,%r12
001e  196611e:	49 89 ff             	mov    %rdi,%r15
0021  1966121:	48 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbp
002b  196612b:	e8 00 00 00 00       	call   1966130 <aq100x_get_link_status+0x30>	196612c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0030  1966130:	4d 85 e4             	test   %r12,%r12
0033  1966133:	0f 84 c5 00 00 00    	je     19661fe <aq100x_get_link_status+0xfe>
0039  1966139:	4c 89 34 24          	mov    %r14,(%rsp)
003d  196613d:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 1966144 <aq100x_get_link_status+0x44>	1966140: R_X86_64_PC32	_ftrace_branch+0x17e1e4
0044  1966144:	49 8d 7f 40          	lea    0x40(%r15),%rdi
0048  1966148:	48 89 f8             	mov    %rdi,%rax
004b  196614b:	48 c1 e8 03          	shr    $0x3,%rax
004f  196614f:	48 89 eb             	mov    %rbp,%rbx
0052  1966152:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
0056  1966156:	74 05                	je     196615d <aq100x_get_link_status+0x5d>
0058  1966158:	e8 00 00 00 00       	call   196615d <aq100x_get_link_status+0x5d>	1966159: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
005d  196615d:	4d 8d 6f 28          	lea    0x28(%r15),%r13
0061  1966161:	4d 8b 77 40          	mov    0x40(%r15),%r14
0065  1966165:	49 8d 6f 38          	lea    0x38(%r15),%rbp
0069  1966169:	48 89 e8             	mov    %rbp,%rax
006c  196616c:	48 c1 e8 03          	shr    $0x3,%rax
0070  1966170:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1)
0074  1966174:	74 08                	je     196617e <aq100x_get_link_status+0x7e>
0076  1966176:	48 89 ef             	mov    %rbp,%rdi
0079  1966179:	e8 00 00 00 00       	call   196617e <aq100x_get_link_status+0x7e>	196617a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
007e  196617e:	48 8b 6d 00          	mov    0x0(%rbp),%rbp
0082  1966182:	4c 89 e8             	mov    %r13,%rax
0085  1966185:	48 c1 e8 03          	shr    $0x3,%rax
0089  1966189:	0f b6 04 18          	movzbl (%rax,%rbx,1),%eax
008d  196618d:	84 c0                	test   %al,%al
008f  196618f:	0f 85 89 02 00 00    	jne    196641e <aq100x_get_link_status+0x31e>
0095  1966195:	41 8b 75 00          	mov    0x0(%r13),%esi
0099  1966199:	48 89 ef             	mov    %rbp,%rdi
009c  196619c:	ba 01 00 00 00       	mov    $0x1,%edx
00a1  19661a1:	b9 00 e8 00 00       	mov    $0xe800,%ecx
00a6  19661a6:	41 ff d6             	call   *%r14
00a9  19661a9:	89 c5                	mov    %eax,%ebp
00ab  19661ab:	31 ff                	xor    %edi,%edi
00ad  19661ad:	89 c6                	mov    %eax,%esi
00af  19661af:	e8 00 00 00 00       	call   19661b4 <aq100x_get_link_status+0xb4>	19661b0: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
00b4  19661b4:	85 ed                	test   %ebp,%ebp
00b6  19661b6:	78 54                	js     196620c <aq100x_get_link_status+0x10c>
00b8  19661b8:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 19661bf <aq100x_get_link_status+0xbf>	19661bb: R_X86_64_PC32	_ftrace_branch+0x17e1ec
00bf  19661bf:	83 e5 01             	and    $0x1,%ebp
00c2  19661c2:	4c 89 e0             	mov    %r12,%rax
00c5  19661c5:	48 c1 e8 03          	shr    $0x3,%rax
00c9  19661c9:	0f b6 04 18          	movzbl (%rax,%rbx,1),%eax
00cd  19661cd:	84 c0                	test   %al,%al
00cf  19661cf:	0f 85 c5 02 00 00    	jne    196649a <aq100x_get_link_status+0x39a>
00d5  19661d5:	41 89 2c 24          	mov    %ebp,(%r12)
00d9  19661d9:	45 31 e4             	xor    %r12d,%r12d
00dc  19661dc:	31 ff                	xor    %edi,%edi
00de  19661de:	89 ee                	mov    %ebp,%esi
00e0  19661e0:	e8 00 00 00 00       	call   19661e5 <aq100x_get_link_status+0xe5>	19661e1: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
00e5  19661e5:	85 ed                	test   %ebp,%ebp
00e7  19661e7:	4c 8b 34 24          	mov    (%rsp),%r14
00eb  19661eb:	75 33                	jne    1966220 <aq100x_get_link_status+0x120>
00ed  19661ed:	e8 00 00 00 00       	call   19661f2 <aq100x_get_link_status+0xf2>	19661ee: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00f2  19661f2:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 19661f9 <aq100x_get_link_status+0xf9>	19661f5: R_X86_64_PC32	_ftrace_branch+0x17e204
00f9  19661f9:	e9 0e 02 00 00       	jmp    196640c <aq100x_get_link_status+0x30c>
00fe  19661fe:	e8 00 00 00 00       	call   1966203 <aq100x_get_link_status+0x103>	19661ff: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0103  1966203:	49 c7 c4 00 00 00 00 	mov    $0x0,%r12	1966206: R_X86_64_32S	_ftrace_branch+0x17e1e0
010a  196620a:	eb 23                	jmp    196622f <aq100x_get_link_status+0x12f>
010c  196620c:	e8 00 00 00 00       	call   1966211 <aq100x_get_link_status+0x111>	196620d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0111  1966211:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 1966218 <aq100x_get_link_status+0x118>	1966214: R_X86_64_PC32	_ftrace_branch+0x17e1f4
0118  1966218:	41 89 ec             	mov    %ebp,%r12d
011b  196621b:	e9 ec 01 00 00       	jmp    196640c <aq100x_get_link_status+0x30c>
0120  1966220:	e8 00 00 00 00       	call   1966225 <aq100x_get_link_status+0x125>	1966221: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0125  1966225:	49 c7 c4 00 00 00 00 	mov    $0x0,%r12	1966228: R_X86_64_32S	_ftrace_branch+0x17e200
012c  196622c:	48 89 dd             	mov    %rbx,%rbp
012f  196622f:	4d 8d 6c 24 07       	lea    0x7(%r12),%r13
0134  1966234:	4c 89 e0             	mov    %r12,%rax
0137  1966237:	48 c1 e8 03          	shr    $0x3,%rax
013b  196623b:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax
013f  196623f:	84 c0                	test   %al,%al
0141  1966241:	0f 85 f5 01 00 00    	jne    196643c <aq100x_get_link_status+0x33c>
0147  1966247:	4c 89 e8             	mov    %r13,%rax
014a  196624a:	48 c1 e8 03          	shr    $0x3,%rax
014e  196624e:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax
0152  1966252:	84 c0                	test   %al,%al
0154  1966254:	0f 85 02 02 00 00    	jne    196645c <aq100x_get_link_status+0x35c>
015a  196625a:	49 ff 04 24          	incq   (%r12)
015e  196625e:	49 8d 7f 40          	lea    0x40(%r15),%rdi
0162  1966262:	48 89 f8             	mov    %rdi,%rax
0165  1966265:	48 c1 e8 03          	shr    $0x3,%rax
0169  1966269:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
016d  196626d:	74 05                	je     1966274 <aq100x_get_link_status+0x174>
016f  196626f:	e8 00 00 00 00       	call   1966274 <aq100x_get_link_status+0x174>	1966270: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0174  1966274:	4d 8d 67 28          	lea    0x28(%r15),%r12
0178  1966278:	4d 8b 6f 40          	mov    0x40(%r15),%r13
017c  196627c:	49 83 c7 38          	add    $0x38,%r15
0180  1966280:	4c 89 f8             	mov    %r15,%rax
0183  1966283:	48 c1 e8 03          	shr    $0x3,%rax
0187  1966287:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
018b  196628b:	74 08                	je     1966295 <aq100x_get_link_status+0x195>
018d  196628d:	4c 89 ff             	mov    %r15,%rdi
0190  1966290:	e8 00 00 00 00       	call   1966295 <aq100x_get_link_status+0x195>	1966291: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0195  1966295:	4d 8b 3f             	mov    (%r15),%r15
0198  1966298:	4c 89 e0             	mov    %r12,%rax
019b  196629b:	48 c1 e8 03          	shr    $0x3,%rax
019f  196629f:	48 89 eb             	mov    %rbp,%rbx
01a2  19662a2:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax
01a6  19662a6:	84 c0                	test   %al,%al
01a8  19662a8:	0f 85 ce 01 00 00    	jne    196647c <aq100x_get_link_status+0x37c>
01ae  19662ae:	41 8b 34 24          	mov    (%r12),%esi
01b2  19662b2:	4c 89 ff             	mov    %r15,%rdi
01b5  19662b5:	ba 07 00 00 00       	mov    $0x7,%edx
01ba  19662ba:	b9 00 c8 00 00       	mov    $0xc800,%ecx
01bf  19662bf:	41 ff d5             	call   *%r13
01c2  19662c2:	41 89 c4             	mov    %eax,%r12d
01c5  19662c5:	31 ff                	xor    %edi,%edi
01c7  19662c7:	89 c6                	mov    %eax,%esi
01c9  19662c9:	e8 00 00 00 00       	call   19662ce <aq100x_get_link_status+0x1ce>	19662ca: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
01ce  19662ce:	bd ff ff ff ff       	mov    $0xffffffff,%ebp
01d3  19662d3:	45 85 e4             	test   %r12d,%r12d
01d6  19662d6:	41 0f 49 ec          	cmovns %r12d,%ebp
01da  19662da:	78 61                	js     196633d <aq100x_get_link_status+0x23d>
01dc  19662dc:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 19662e3 <aq100x_get_link_status+0x1e3>	19662df: R_X86_64_PC32	_ftrace_branch+0x17e20c
01e3  19662e3:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
01e8  19662e8:	4d 85 e4             	test   %r12,%r12
01eb  19662eb:	74 61                	je     196634e <aq100x_get_link_status+0x24e>
01ed  19662ed:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 19662f4 <aq100x_get_link_status+0x1f4>	19662f0: R_X86_64_PC32	_ftrace_branch+0x17e224
01f4  19662f4:	41 89 ef             	mov    %ebp,%r15d
01f7  19662f7:	41 83 e7 06          	and    $0x6,%r15d
01fb  19662fb:	4c 89 ff             	mov    %r15,%rdi
01fe  19662fe:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	1966301: R_X86_64_32S	.data+0xa1cd40
0205  1966305:	e8 00 00 00 00       	call   196630a <aq100x_get_link_status+0x20a>	1966306: R_X86_64_PLT32	__sanitizer_cov_trace_switch-0x4
020a  196630a:	42 ff 24 fd 00 00 00 00 	jmp    *0x0(,%r15,8)	196630e: R_X86_64_32S	.rodata+0x3b6c80
0212  1966312:	e8 00 00 00 00       	call   1966317 <aq100x_get_link_status+0x217>	1966313: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0217  1966317:	4c 89 e0             	mov    %r12,%rax
021a  196631a:	48 c1 e8 03          	shr    $0x3,%rax
021e  196631e:	0f b6 04 18          	movzbl (%rax,%rbx,1),%eax
0222  1966322:	84 c0                	test   %al,%al
0224  1966324:	0f 85 ac 01 00 00    	jne    19664d6 <aq100x_get_link_status+0x3d6>
022a  196632a:	41 c7 04 24 0a 00 00 00 	movl   $0xa,(%r12)
0232  1966332:	4d 85 f6             	test   %r14,%r14
0235  1966335:	0f 85 a9 00 00 00    	jne    19663e4 <aq100x_get_link_status+0x2e4>
023b  196633b:	eb 74                	jmp    19663b1 <aq100x_get_link_status+0x2b1>
023d  196633d:	e8 00 00 00 00       	call   1966342 <aq100x_get_link_status+0x242>	196633e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0242  1966342:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 1966349 <aq100x_get_link_status+0x249>	1966345: R_X86_64_PC32	_ftrace_branch+0x17e214
0249  1966349:	e9 be 00 00 00       	jmp    196640c <aq100x_get_link_status+0x30c>
024e  196634e:	e8 00 00 00 00       	call   1966353 <aq100x_get_link_status+0x253>	196634f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0253  1966353:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 196635a <aq100x_get_link_status+0x25a>	1966356: R_X86_64_PC32	_ftrace_branch+0x17e21c
025a  196635a:	4d 85 f6             	test   %r14,%r14
025d  196635d:	0f 85 81 00 00 00    	jne    19663e4 <aq100x_get_link_status+0x2e4>
0263  1966363:	eb 4c                	jmp    19663b1 <aq100x_get_link_status+0x2b1>
0265  1966365:	e8 00 00 00 00       	call   196636a <aq100x_get_link_status+0x26a>	1966366: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
026a  196636a:	4c 89 e0             	mov    %r12,%rax
026d  196636d:	48 c1 e8 03          	shr    $0x3,%rax
0271  1966371:	0f b6 04 18          	movzbl (%rax,%rbx,1),%eax
0275  1966375:	84 c0                	test   %al,%al
0277  1966377:	0f 85 77 01 00 00    	jne    19664f4 <aq100x_get_link_status+0x3f4>
027d  196637d:	41 c7 04 24 10 27 00 00 	movl   $0x2710,(%r12)
0285  1966385:	4d 85 f6             	test   %r14,%r14
0288  1966388:	75 5a                	jne    19663e4 <aq100x_get_link_status+0x2e4>
028a  196638a:	eb 25                	jmp    19663b1 <aq100x_get_link_status+0x2b1>
028c  196638c:	e8 00 00 00 00       	call   1966391 <aq100x_get_link_status+0x291>	196638d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0291  1966391:	4c 89 e0             	mov    %r12,%rax
0294  1966394:	48 c1 e8 03          	shr    $0x3,%rax
0298  1966398:	0f b6 04 18          	movzbl (%rax,%rbx,1),%eax
029c  196639c:	84 c0                	test   %al,%al
029e  196639e:	0f 85 6e 01 00 00    	jne    1966512 <aq100x_get_link_status+0x412>
02a4  19663a4:	41 c7 04 24 64 00 00 00 	movl   $0x64,(%r12)
02ac  19663ac:	4d 85 f6             	test   %r14,%r14
02af  19663af:	75 33                	jne    19663e4 <aq100x_get_link_status+0x2e4>
02b1  19663b1:	e8 00 00 00 00       	call   19663b6 <aq100x_get_link_status+0x2b6>	19663b2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
02b6  19663b6:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 19663bd <aq100x_get_link_status+0x2bd>	19663b9: R_X86_64_PC32	_ftrace_branch+0x17e22c
02bd  19663bd:	eb 4a                	jmp    1966409 <aq100x_get_link_status+0x309>
02bf  19663bf:	e8 00 00 00 00       	call   19663c4 <aq100x_get_link_status+0x2c4>	19663c0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
02c4  19663c4:	4c 89 e0             	mov    %r12,%rax
02c7  19663c7:	48 c1 e8 03          	shr    $0x3,%rax
02cb  19663cb:	0f b6 04 18          	movzbl (%rax,%rbx,1),%eax
02cf  19663cf:	84 c0                	test   %al,%al
02d1  19663d1:	0f 85 59 01 00 00    	jne    1966530 <aq100x_get_link_status+0x430>
02d7  19663d7:	41 c7 04 24 e8 03 00 00 	movl   $0x3e8,(%r12)
02df  19663df:	4d 85 f6             	test   %r14,%r14
02e2  19663e2:	74 cd                	je     19663b1 <aq100x_get_link_status+0x2b1>
02e4  19663e4:	e8 00 00 00 00       	call   19663e9 <aq100x_get_link_status+0x2e9>	19663e5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
02e9  19663e9:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 19663f0 <aq100x_get_link_status+0x2f0>	19663ec: R_X86_64_PC32	_ftrace_branch+0x17e234
02f0  19663f0:	83 e5 01             	and    $0x1,%ebp
02f3  19663f3:	4c 89 f0             	mov    %r14,%rax
02f6  19663f6:	48 c1 e8 03          	shr    $0x3,%rax
02fa  19663fa:	0f b6 04 18          	movzbl (%rax,%rbx,1),%eax
02fe  19663fe:	84 c0                	test   %al,%al
0300  1966400:	0f 85 b2 00 00 00    	jne    19664b8 <aq100x_get_link_status+0x3b8>
0306  1966406:	41 89 2e             	mov    %ebp,(%r14)
0309  1966409:	45 31 e4             	xor    %r12d,%r12d
030c  196640c:	44 89 e0             	mov    %r12d,%eax
030f  196640f:	48 83 c4 10          	add    $0x10,%rsp
0313  1966413:	5b                   	pop    %rbx
0314  1966414:	41 5c                	pop    %r12
0316  1966416:	41 5d                	pop    %r13
0318  1966418:	41 5e                	pop    %r14
031a  196641a:	41 5f                	pop    %r15
031c  196641c:	5d                   	pop    %rbp
031d  196641d:	c3                   	ret
031e  196641e:	44 89 e9             	mov    %r13d,%ecx
0321  1966421:	80 e1 07             	and    $0x7,%cl
0324  1966424:	80 c1 03             	add    $0x3,%cl
0327  1966427:	38 c1                	cmp    %al,%cl
0329  1966429:	0f 8c 66 fd ff ff    	jl     1966195 <aq100x_get_link_status+0x95>
032f  196642f:	4c 89 ef             	mov    %r13,%rdi
0332  1966432:	e8 00 00 00 00       	call   1966437 <aq100x_get_link_status+0x337>	1966433: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0337  1966437:	e9 59 fd ff ff       	jmp    1966195 <aq100x_get_link_status+0x95>
033c  196643c:	44 89 e1             	mov    %r12d,%ecx
033f  196643f:	80 e1 07             	and    $0x7,%cl
0342  1966442:	38 c1                	cmp    %al,%cl
0344  1966444:	0f 8c fd fd ff ff    	jl     1966247 <aq100x_get_link_status+0x147>
034a  196644a:	be 08 00 00 00       	mov    $0x8,%esi
034f  196644f:	4c 89 e7             	mov    %r12,%rdi
0352  1966452:	e8 00 00 00 00       	call   1966457 <aq100x_get_link_status+0x357>	1966453: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
0357  1966457:	e9 eb fd ff ff       	jmp    1966247 <aq100x_get_link_status+0x147>
035c  196645c:	44 89 e9             	mov    %r13d,%ecx
035f  196645f:	80 e1 07             	and    $0x7,%cl
0362  1966462:	38 c1                	cmp    %al,%cl
0364  1966464:	0f 8c f0 fd ff ff    	jl     196625a <aq100x_get_link_status+0x15a>
036a  196646a:	be 08 00 00 00       	mov    $0x8,%esi
036f  196646f:	4c 89 ef             	mov    %r13,%rdi
0372  1966472:	e8 00 00 00 00       	call   1966477 <aq100x_get_link_status+0x377>	1966473: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
0377  1966477:	e9 de fd ff ff       	jmp    196625a <aq100x_get_link_status+0x15a>
037c  196647c:	44 89 e1             	mov    %r12d,%ecx
037f  196647f:	80 e1 07             	and    $0x7,%cl
0382  1966482:	80 c1 03             	add    $0x3,%cl
0385  1966485:	38 c1                	cmp    %al,%cl
0387  1966487:	0f 8c 21 fe ff ff    	jl     19662ae <aq100x_get_link_status+0x1ae>
038d  196648d:	4c 89 e7             	mov    %r12,%rdi
0390  1966490:	e8 00 00 00 00       	call   1966495 <aq100x_get_link_status+0x395>	1966491: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0395  1966495:	e9 14 fe ff ff       	jmp    19662ae <aq100x_get_link_status+0x1ae>
039a  196649a:	44 89 e1             	mov    %r12d,%ecx
039d  196649d:	80 e1 07             	and    $0x7,%cl
03a0  19664a0:	80 c1 03             	add    $0x3,%cl
03a3  19664a3:	38 c1                	cmp    %al,%cl
03a5  19664a5:	0f 8c 2a fd ff ff    	jl     19661d5 <aq100x_get_link_status+0xd5>
03ab  19664ab:	4c 89 e7             	mov    %r12,%rdi
03ae  19664ae:	e8 00 00 00 00       	call   19664b3 <aq100x_get_link_status+0x3b3>	19664af: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
03b3  19664b3:	e9 1d fd ff ff       	jmp    19661d5 <aq100x_get_link_status+0xd5>
03b8  19664b8:	44 89 f1             	mov    %r14d,%ecx
03bb  19664bb:	80 e1 07             	and    $0x7,%cl
03be  19664be:	80 c1 03             	add    $0x3,%cl
03c1  19664c1:	38 c1                	cmp    %al,%cl
03c3  19664c3:	0f 8c 3d ff ff ff    	jl     1966406 <aq100x_get_link_status+0x306>
03c9  19664c9:	4c 89 f7             	mov    %r14,%rdi
03cc  19664cc:	e8 00 00 00 00       	call   19664d1 <aq100x_get_link_status+0x3d1>	19664cd: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
03d1  19664d1:	e9 30 ff ff ff       	jmp    1966406 <aq100x_get_link_status+0x306>
03d6  19664d6:	44 89 e1             	mov    %r12d,%ecx
03d9  19664d9:	80 e1 07             	and    $0x7,%cl
03dc  19664dc:	80 c1 03             	add    $0x3,%cl
03df  19664df:	38 c1                	cmp    %al,%cl
03e1  19664e1:	0f 8c 43 fe ff ff    	jl     196632a <aq100x_get_link_status+0x22a>
03e7  19664e7:	4c 89 e7             	mov    %r12,%rdi
03ea  19664ea:	e8 00 00 00 00       	call   19664ef <aq100x_get_link_status+0x3ef>	19664eb: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
03ef  19664ef:	e9 36 fe ff ff       	jmp    196632a <aq100x_get_link_status+0x22a>
03f4  19664f4:	44 89 e1             	mov    %r12d,%ecx
03f7  19664f7:	80 e1 07             	and    $0x7,%cl
03fa  19664fa:	80 c1 03             	add    $0x3,%cl
03fd  19664fd:	38 c1                	cmp    %al,%cl
03ff  19664ff:	0f 8c 78 fe ff ff    	jl     196637d <aq100x_get_link_status+0x27d>
0405  1966505:	4c 89 e7             	mov    %r12,%rdi
0408  1966508:	e8 00 00 00 00       	call   196650d <aq100x_get_link_status+0x40d>	1966509: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
040d  196650d:	e9 6b fe ff ff       	jmp    196637d <aq100x_get_link_status+0x27d>
0412  1966512:	44 89 e1             	mov    %r12d,%ecx
0415  1966515:	80 e1 07             	and    $0x7,%cl
0418  1966518:	80 c1 03             	add    $0x3,%cl
041b  196651b:	38 c1                	cmp    %al,%cl
041d  196651d:	0f 8c 81 fe ff ff    	jl     19663a4 <aq100x_get_link_status+0x2a4>
0423  1966523:	4c 89 e7             	mov    %r12,%rdi
0426  1966526:	e8 00 00 00 00       	call   196652b <aq100x_get_link_status+0x42b>	1966527: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
042b  196652b:	e9 74 fe ff ff       	jmp    19663a4 <aq100x_get_link_status+0x2a4>
0430  1966530:	44 89 e1             	mov    %r12d,%ecx
0433  1966533:	80 e1 07             	and    $0x7,%cl
0436  1966536:	80 c1 03             	add    $0x3,%cl
0439  1966539:	38 c1                	cmp    %al,%cl
043b  196653b:	0f 8c 96 fe ff ff    	jl     19663d7 <aq100x_get_link_status+0x2d7>
0441  1966541:	4c 89 e7             	mov    %r12,%rdi
0444  1966544:	e8 00 00 00 00       	call   1966549 <aq100x_get_link_status+0x449>	1966545: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
0449  1966549:	e9 89 fe ff ff       	jmp    19663d7 <aq100x_get_link_status+0x2d7>
044e  196654e:	66 90                	xchg   %ax,%ax

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
