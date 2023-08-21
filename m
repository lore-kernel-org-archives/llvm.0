Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CDF12B84;
	Mon, 21 Aug 2023 21:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692654938; x=1724190938;
  h=date:from:cc:subject:message-id:mime-version;
  bh=ee23pb0ZQElDkjcLGV6jlNtdJVlvE7oTqvN32XRKmvI=;
  b=Qkv38CLSK/QRFw6QryHBBHeeW1e/ByajNyccMYIuwDb6IyoCW4RFRzyb
   256Rd9NfTC5kyh+MPYqvuuhwuzTgFf9NnK8FWEKwBnBOzY4wfgipTMOmf
   jnnGeuKAlR0vSEt27JWdMMVQxWUkVThjyEeusDBH4HZ29qgxD2B1fHAa8
   Ay1eRiZ+AO4DJjSe2J2H5g23yPsE2QAe8HsGGSsKf06oAQpy22jIjokyB
   p6IZrY25s9/oOfYmnL8V6CSmwyynp5iqtg33L5CRoFfgfMwqosh/YVZJL
   V0LFKRvQFJlwRMmf+KO7gKH0itW02xLZICfjehAiplwbSwyhyRa/vI/Tv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="377464927"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="377464927"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 14:55:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="729576869"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="729576869"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 21 Aug 2023 14:55:32 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYCqh-0000ym-36;
	Mon, 21 Aug 2023 21:54:26 +0000
Date: Tue, 22 Aug 2023 05:53:58 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [stable:linux-5.10.y 7799/9999] kernel/sched/fair.o: warning:
 objtool: dequeue_task_fair()+0x7ca: unreachable instruction
Message-ID: <202308220534.wCDlwUVS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: "Steven Rostedt (Google)" <rostedt@goodmis.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.10.y
head:   da742ebfa00c3add4a358dd79ec92161c07e1435
commit: ec663c410ce0023e13f56a95e096be9cd6d471c2 [7799/9999] tracing: Make tracepoint lockdep check actually test something
config: x86_64-randconfig-072-20230821 (https://download.01.org/0day-ci/archive/20230822/202308220534.wCDlwUVS-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308220534.wCDlwUVS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308220534.wCDlwUVS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/fair.o: warning: objtool: dequeue_task_fair()+0x7ca: unreachable instruction


objdump-func vmlinux.o dequeue_task_fair:
0000 0000000000247ed2 <dequeue_task_fair>:
0000   247ed2:	55                   	push   %rbp
0001   247ed3:	41 57                	push   %r15
0003   247ed5:	41 56                	push   %r14
0005   247ed7:	41 55                	push   %r13
0007   247ed9:	41 54                	push   %r12
0009   247edb:	53                   	push   %rbx
000a   247edc:	48 81 ec 80 00 00 00 	sub    $0x80,%rsp
0011   247ee3:	89 54 24 18          	mov    %edx,0x18(%rsp)
0015   247ee7:	49 89 f5             	mov    %rsi,%r13
0018   247eea:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
0021   247ef3:	48 89 44 24 78       	mov    %rax,0x78(%rsp)
0026   247ef8:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0030   247f02:	48 8d 9e 10 03 00 00 	lea    0x310(%rsi),%rbx
0037   247f09:	48 89 d8             	mov    %rbx,%rax
003a   247f0c:	48 c1 e8 03          	shr    $0x3,%rax
003e   247f10:	8a 04 10             	mov    (%rax,%rdx,1),%al
0041   247f13:	84 c0                	test   %al,%al
0043   247f15:	0f 85 aa 09 00 00    	jne    2488c5 <dequeue_task_fair+0x9f3>
0049   247f1b:	31 ed                	xor    %ebp,%ebp
004b   247f1d:	83 3b 05             	cmpl   $0x5,(%rbx)
004e   247f20:	0f 94 c3             	sete   %bl
0051   247f23:	48 8d 4f 40          	lea    0x40(%rdi),%rcx
0055   247f27:	48 89 c8             	mov    %rcx,%rax
0058   247f2a:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
005d   247f2f:	48 c1 e9 03          	shr    $0x3,%rcx
0061   247f33:	48 89 4c 24 28       	mov    %rcx,0x28(%rsp)
0066   247f38:	8a 04 11             	mov    (%rcx,%rdx,1),%al
0069   247f3b:	84 c0                	test   %al,%al
006b   247f3d:	0f 85 af 09 00 00    	jne    2488f2 <dequeue_task_fair+0xa20>
0071   247f43:	40 88 dd             	mov    %bl,%bpl
0074   247f46:	8b 5f 40             	mov    0x40(%rdi),%ebx
0077   247f49:	4c 8d bf d8 00 00 00 	lea    0xd8(%rdi),%r15
007e   247f50:	4c 89 f8             	mov    %r15,%rax
0081   247f53:	48 c1 e8 03          	shr    $0x3,%rax
0085   247f57:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
008a   247f5c:	8a 04 10             	mov    (%rax,%rdx,1),%al
008d   247f5f:	84 c0                	test   %al,%al
008f   247f61:	0f 85 bd 09 00 00    	jne    248924 <dequeue_task_fair+0xa52>
0095   247f67:	4d 8d b5 80 00 00 00 	lea    0x80(%r13),%r14
009c   247f6e:	f7 dd                	neg    %ebp
009e   247f70:	41 3b 1f             	cmp    (%r15),%ebx
00a1   247f73:	0f 95 c0             	setne  %al
00a4   247f76:	85 db                	test   %ebx,%ebx
00a6   247f78:	0f 94 c1             	sete   %cl
00a9   247f7b:	08 c1                	or     %al,%cl
00ab   247f7d:	88 4c 24 30          	mov    %cl,0x30(%rsp)
00af   247f81:	4c 89 74 24 40       	mov    %r14,0x40(%rsp)
00b4   247f86:	4c 89 6c 24 20       	mov    %r13,0x20(%rsp)
00b9   247f8b:	4c 89 7c 24 50       	mov    %r15,0x50(%rsp)
00be   247f90:	89 6c 24 10          	mov    %ebp,0x10(%rsp)
00c2   247f94:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
00c7   247f99:	48 8d b7 78 01 00 00 	lea    0x178(%rdi),%rsi
00ce   247fa0:	49 89 f7             	mov    %rsi,%r15
00d1   247fa3:	49 c1 ef 03          	shr    $0x3,%r15
00d5   247fa7:	41 8a 04 17          	mov    (%r15,%rdx,1),%al
00d9   247fab:	84 c0                	test   %al,%al
00db   247fad:	0f 85 04 0a 00 00    	jne    2489b7 <dequeue_task_fair+0xae5>
00e1   247fb3:	8b 2e                	mov    (%rsi),%ebp
00e3   247fb5:	49 8d 9d f8 01 00 00 	lea    0x1f8(%r13),%rbx
00ea   247fbc:	48 89 d8             	mov    %rbx,%rax
00ed   247fbf:	48 c1 e8 03          	shr    $0x3,%rax
00f1   247fc3:	8a 04 10             	mov    (%rax,%rdx,1),%al
00f4   247fc6:	84 c0                	test   %al,%al
00f6   247fc8:	0f 85 1c 0a 00 00    	jne    2489ea <dequeue_task_fair+0xb18>
00fc   247fce:	44 8b 33             	mov    (%rbx),%r14d
00ff   247fd1:	48 8d 44 24 70       	lea    0x70(%rsp),%rax
0104   247fd6:	48 c1 e8 03          	shr    $0x3,%rax
0108   247fda:	8a 04 10             	mov    (%rax,%rdx,1),%al
010b   247fdd:	84 c0                	test   %al,%al
010d   247fdf:	0f 85 38 0a 00 00    	jne    248a1d <dequeue_task_fair+0xb4b>
0113   247fe5:	44 89 74 24 70       	mov    %r14d,0x70(%rsp)
0118   247fea:	49 8d 9d fc 01 00 00 	lea    0x1fc(%r13),%rbx
011f   247ff1:	48 89 d8             	mov    %rbx,%rax
0122   247ff4:	48 c1 e8 03          	shr    $0x3,%rax
0126   247ff8:	8a 04 10             	mov    (%rax,%rdx,1),%al
0129   247ffb:	84 c0                	test   %al,%al
012b   247ffd:	0f 85 47 0a 00 00    	jne    248a4a <dequeue_task_fair+0xb78>
0131   248003:	44 8b 2b             	mov    (%rbx),%r13d
0134   248006:	48 8d 44 24 6c       	lea    0x6c(%rsp),%rax
0139   24800b:	48 c1 e8 03          	shr    $0x3,%rax
013d   24800f:	8a 04 10             	mov    (%rax,%rdx,1),%al
0140   248012:	84 c0                	test   %al,%al
0142   248014:	0f 85 63 0a 00 00    	jne    248a7d <dequeue_task_fair+0xbab>
0148   24801a:	41 81 e6 ff ff ff 7f 	and    $0x7fffffff,%r14d
014f   248021:	45 39 f5             	cmp    %r14d,%r13d
0152   248024:	45 0f 47 f5          	cmova  %r13d,%r14d
0156   248028:	49 89 fc             	mov    %rdi,%r12
0159   24802b:	48 8d 9f c0 00 00 00 	lea    0xc0(%rdi),%rbx
0160   248032:	44 89 6c 24 6c       	mov    %r13d,0x6c(%rsp)
0165   248037:	31 c0                	xor    %eax,%eax
0167   248039:	44 29 f5             	sub    %r14d,%ebp
016a   24803c:	0f 42 e8             	cmovb  %eax,%ebp
016d   24803f:	41 8a 04 17          	mov    (%r15,%rdx,1),%al
0171   248043:	84 c0                	test   %al,%al
0173   248045:	0f 85 6a 0a 00 00    	jne    248ab5 <dequeue_task_fair+0xbe3>
0179   24804b:	89 2e                	mov    %ebp,(%rsi)
017b   24804d:	48 89 df             	mov    %rbx,%rdi
017e   248050:	e8 ed 74 01 00       	call   25f542 <trace_sched_util_est_cfs_tp>
0183   248055:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
018d   24805f:	4c 8b 74 24 40       	mov    0x40(%rsp),%r14
0192   248064:	4c 8b 6c 24 20       	mov    0x20(%rsp),%r13
0197   248069:	4c 89 e7             	mov    %r12,%rdi
019a   24806c:	4c 8b 7c 24 50       	mov    0x50(%rsp),%r15
019f   248071:	4d 85 f6             	test   %r14,%r14
01a2   248074:	0f 84 be 03 00 00    	je     248438 <dequeue_task_fair+0x566>
01a8   24807a:	4d 8d 65 40          	lea    0x40(%r13),%r12
01ac   24807e:	4d 89 e5             	mov    %r12,%r13
01af   248081:	49 c1 ed 03          	shr    $0x3,%r13
01b3   248085:	41 8a 44 15 00       	mov    0x0(%r13,%rdx,1),%al
01b8   24808a:	84 c0                	test   %al,%al
01ba   24808c:	0f 85 46 0a 00 00    	jne    248ad8 <dequeue_task_fair+0xc06>
01c0   248092:	48 89 7c 24 58       	mov    %rdi,0x58(%rsp)
01c5   248097:	41 8b 1c 24          	mov    (%r12),%ebx
01c9   24809b:	48 81 fb 00 20 00 00 	cmp    $0x2000,%rbx
01d0   2480a2:	0f 83 9e 10 00 00    	jae    249146 <dequeue_task_fair+0x1274>
01d6   2480a8:	48 8d 1c dd 00 00 00 00 	lea    0x0(,%rbx,8),%rbx	2480ac: R_X86_64_32S	__per_cpu_offset
01de   2480b0:	48 89 d8             	mov    %rbx,%rax
01e1   2480b3:	48 c1 e8 03          	shr    $0x3,%rax
01e5   2480b7:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
01e9   2480bb:	74 08                	je     2480c5 <dequeue_task_fair+0x1f3>
01eb   2480bd:	48 89 df             	mov    %rbx,%rdi
01ee   2480c0:	e8 00 00 00 00       	call   2480c5 <dequeue_task_fair+0x1f3>	2480c1: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
01f3   2480c5:	48 8b 03             	mov    (%rbx),%rax
01f6   2480c8:	48 8d 98 00 00 00 00 	lea    0x0(%rax),%rbx	2480cb: R_X86_64_32S	runqueues
01fd   2480cf:	48 8d a8 00 00 00 00 	lea    0x0(%rax),%rbp	2480d2: R_X86_64_32S	runqueues+0xc0
0204   2480d6:	48 89 ef             	mov    %rbp,%rdi
0207   2480d9:	e8 66 a5 00 00       	call   252644 <update_curr>
020c   2480de:	48 89 ef             	mov    %rbp,%rdi
020f   2480e1:	4c 89 f6             	mov    %r14,%rsi
0212   2480e4:	ba 01 00 00 00       	mov    $0x1,%edx
0217   2480e9:	e8 81 b7 00 00       	call   25386f <update_load_avg>
021c   2480ee:	48 89 1c 24          	mov    %rbx,(%rsp)
0220   2480f2:	48 89 6c 24 48       	mov    %rbp,0x48(%rsp)
0225   2480f7:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
022a   2480fc:	48 89 ef             	mov    %rbp,%rdi
022d   2480ff:	4c 89 f6             	mov    %r14,%rsi
0230   248102:	e8 32 b0 00 00       	call   253139 <clear_buddies>
0235   248107:	48 81 c3 00 01 00 00 	add    $0x100,%rbx
023c   24810e:	48 89 d8             	mov    %rbx,%rax
023f   248111:	48 c1 e8 03          	shr    $0x3,%rax
0243   248115:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
024d   24811f:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
0251   248123:	74 12                	je     248137 <dequeue_task_fair+0x265>
0253   248125:	48 89 df             	mov    %rbx,%rdi
0256   248128:	e8 00 00 00 00       	call   24812d <dequeue_task_fair+0x25b>	248129: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
025b   24812d:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0265   248137:	4c 39 33             	cmp    %r14,(%rbx)
0268   24813a:	74 15                	je     248151 <dequeue_task_fair+0x27f>
026a   24813c:	48 89 ef             	mov    %rbp,%rdi
026d   24813f:	4c 89 f6             	mov    %r14,%rsi
0270   248142:	e8 b3 b6 00 00       	call   2537fa <__dequeue_entity>
0275   248147:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
027f   248151:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
0284   248156:	48 8d 98 b8 00 00 00 	lea    0xb8(%rax),%rbx
028b   24815d:	48 89 d8             	mov    %rbx,%rax
028e   248160:	48 c1 e8 03          	shr    $0x3,%rax
0292   248164:	8a 04 10             	mov    (%rax,%rdx,1),%al
0295   248167:	84 c0                	test   %al,%al
0297   248169:	0f 85 97 09 00 00    	jne    248b06 <dequeue_task_fair+0xc34>
029d   24816f:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
02a3   248175:	4c 89 f0             	mov    %r14,%rax
02a6   248178:	48 c1 e8 03          	shr    $0x3,%rax
02aa   24817c:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
02ae   248180:	74 12                	je     248194 <dequeue_task_fair+0x2c2>
02b0   248182:	4c 89 f7             	mov    %r14,%rdi
02b3   248185:	e8 00 00 00 00       	call   24818a <dequeue_task_fair+0x2b8>	248186: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
02b8   24818a:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
02c2   248194:	49 8b 1e             	mov    (%r14),%rbx
02c5   248197:	48 89 e8             	mov    %rbp,%rax
02c8   24819a:	48 c1 e8 03          	shr    $0x3,%rax
02cc   24819e:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
02d0   2481a2:	74 12                	je     2481b6 <dequeue_task_fair+0x2e4>
02d2   2481a4:	48 89 ef             	mov    %rbp,%rdi
02d5   2481a7:	e8 00 00 00 00       	call   2481ac <dequeue_task_fair+0x2da>	2481a8: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
02da   2481ac:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
02e4   2481b6:	4c 8b 34 24          	mov    (%rsp),%r14
02e8   2481ba:	49 29 9e c0 00 00 00 	sub    %rbx,0xc0(%r14)
02ef   2481c1:	49 8d 9e c8 00 00 00 	lea    0xc8(%r14),%rbx
02f6   2481c8:	48 89 d8             	mov    %rbx,%rax
02f9   2481cb:	48 c1 e8 03          	shr    $0x3,%rax
02fd   2481cf:	8a 04 10             	mov    (%rax,%rdx,1),%al
0300   2481d2:	84 c0                	test   %al,%al
0302   2481d4:	0f 85 53 09 00 00    	jne    248b2d <dequeue_task_fair+0xc5b>
0308   2481da:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
030e   2481e0:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
0313   2481e5:	48 8d 98 58 16 00 00 	lea    0x1658(%rax),%rbx
031a   2481ec:	48 89 d8             	mov    %rbx,%rax
031d   2481ef:	48 c1 e8 03          	shr    $0x3,%rax
0321   2481f3:	8a 04 10             	mov    (%rax,%rdx,1),%al
0324   2481f6:	84 c0                	test   %al,%al
0326   2481f8:	0f 85 56 09 00 00    	jne    248b54 <dequeue_task_fair+0xc82>
032c   2481fe:	31 ed                	xor    %ebp,%ebp
032e   248200:	83 3b ff             	cmpl   $0xffffffff,(%rbx)
0331   248203:	40 0f 95 c5          	setne  %bpl
0335   248207:	f7 dd                	neg    %ebp
0337   248209:	4d 8d 7e 44          	lea    0x44(%r14),%r15
033b   24820d:	4c 89 f8             	mov    %r15,%rax
033e   248210:	48 c1 e8 03          	shr    $0x3,%rax
0342   248214:	8a 04 10             	mov    (%rax,%rdx,1),%al
0345   248217:	84 c0                	test   %al,%al
0347   248219:	0f 85 5c 09 00 00    	jne    248b7b <dequeue_task_fair+0xca9>
034d   24821f:	41 01 2f             	add    %ebp,(%r15)
0350   248222:	8b 1b                	mov    (%rbx),%ebx
0352   248224:	41 8a 44 15 00       	mov    0x0(%r13,%rdx,1),%al
0357   248229:	84 c0                	test   %al,%al
0359   24822b:	49 89 d6             	mov    %rdx,%r14
035c   24822e:	0f 85 6f 09 00 00    	jne    248ba3 <dequeue_task_fair+0xcd1>
0362   248234:	41 8b 3c 24          	mov    (%r12),%edi
0366   248238:	e8 00 00 00 00       	call   24823d <dequeue_task_fair+0x36b>	248239: R_X86_64_PLT32	__cpu_to_node-0x4
036b   24823d:	31 ed                	xor    %ebp,%ebp
036d   24823f:	39 c3                	cmp    %eax,%ebx
036f   248241:	40 0f 94 c5          	sete   %bpl
0373   248245:	f7 dd                	neg    %ebp
0375   248247:	48 8b 04 24          	mov    (%rsp),%rax
0379   24824b:	48 8d 58 48          	lea    0x48(%rax),%rbx
037d   24824f:	48 89 d8             	mov    %rbx,%rax
0380   248252:	48 c1 e8 03          	shr    $0x3,%rax
0384   248256:	42 8a 04 30          	mov    (%rax,%r14,1),%al
0388   24825a:	84 c0                	test   %al,%al
038a   24825c:	4c 89 f2             	mov    %r14,%rdx
038d   24825f:	4c 8b 74 24 20       	mov    0x20(%rsp),%r14
0392   248264:	0f 85 57 09 00 00    	jne    248bc1 <dequeue_task_fair+0xcef>
0398   24826a:	01 2b                	add    %ebp,(%rbx)
039a   24826c:	49 8d ae a8 00 00 00 	lea    0xa8(%r14),%rbp
03a1   248273:	49 8d 9e b0 00 00 00 	lea    0xb0(%r14),%rbx
03a8   24827a:	49 89 de             	mov    %rbx,%r14
03ab   24827d:	49 c1 ee 03          	shr    $0x3,%r14
03af   248281:	41 80 3c 16 00       	cmpb   $0x0,(%r14,%rdx,1)
03b4   248286:	74 12                	je     24829a <dequeue_task_fair+0x3c8>
03b6   248288:	48 89 df             	mov    %rbx,%rdi
03b9   24828b:	e8 00 00 00 00       	call   248290 <dequeue_task_fair+0x3be>	24828c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
03be   248290:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
03c8   24829a:	48 89 5c 24 38       	mov    %rbx,0x38(%rsp)
03cd   24829f:	4c 8b 3b             	mov    (%rbx),%r15
03d0   2482a2:	49 89 ec             	mov    %rbp,%r12
03d3   2482a5:	49 c1 ec 03          	shr    $0x3,%r12
03d7   2482a9:	41 80 3c 14 00       	cmpb   $0x0,(%r12,%rdx,1)
03dc   2482ae:	74 12                	je     2482c2 <dequeue_task_fair+0x3f0>
03de   2482b0:	48 89 ef             	mov    %rbp,%rdi
03e1   2482b3:	e8 00 00 00 00       	call   2482b8 <dequeue_task_fair+0x3e6>	2482b4: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
03e6   2482b8:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
03f0   2482c2:	48 8b 5d 00          	mov    0x0(%rbp),%rbx
03f4   2482c6:	4c 8d 6b 08          	lea    0x8(%rbx),%r13
03f8   2482ca:	4c 89 e8             	mov    %r13,%rax
03fb   2482cd:	48 c1 e8 03          	shr    $0x3,%rax
03ff   2482d1:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
0403   2482d5:	74 12                	je     2482e9 <dequeue_task_fair+0x417>
0405   2482d7:	4c 89 ef             	mov    %r13,%rdi
0408   2482da:	e8 00 00 00 00       	call   2482df <dequeue_task_fair+0x40d>	2482db: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
040d   2482df:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0417   2482e9:	4d 89 7d 00          	mov    %r15,0x0(%r13)
041b   2482ed:	4c 89 f8             	mov    %r15,%rax
041e   2482f0:	48 c1 e8 03          	shr    $0x3,%rax
0422   2482f4:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
0426   2482f8:	74 12                	je     24830c <dequeue_task_fair+0x43a>
0428   2482fa:	4c 89 ff             	mov    %r15,%rdi
042b   2482fd:	e8 00 00 00 00       	call   248302 <dequeue_task_fair+0x430>	2482fe: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0430   248302:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
043a   24830c:	49 89 1f             	mov    %rbx,(%r15)
043d   24830f:	41 80 3c 14 00       	cmpb   $0x0,(%r12,%rdx,1)
0442   248314:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
0447   248319:	74 12                	je     24832d <dequeue_task_fair+0x45b>
0449   24831b:	48 89 ef             	mov    %rbp,%rdi
044c   24831e:	e8 00 00 00 00       	call   248323 <dequeue_task_fair+0x451>	24831f: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0451   248323:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
045b   24832d:	48 89 6d 00          	mov    %rbp,0x0(%rbp)
045f   248331:	41 80 3c 16 00       	cmpb   $0x0,(%r14,%rdx,1)
0464   248336:	48 8b 5c 24 38       	mov    0x38(%rsp),%rbx
0469   24833b:	74 12                	je     24834f <dequeue_task_fair+0x47d>
046b   24833d:	48 89 df             	mov    %rbx,%rdi
046e   248340:	e8 00 00 00 00       	call   248345 <dequeue_task_fair+0x473>	248341: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0473   248345:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
047d   24834f:	48 89 2b             	mov    %rbp,(%rbx)
0480   248352:	4c 8b 34 24          	mov    (%rsp),%r14
0484   248356:	49 8d 9e d0 00 00 00 	lea    0xd0(%r14),%rbx
048b   24835d:	48 89 d8             	mov    %rbx,%rax
048e   248360:	48 c1 e8 03          	shr    $0x3,%rax
0492   248364:	8a 04 10             	mov    (%rax,%rdx,1),%al
0495   248367:	84 c0                	test   %al,%al
0497   248369:	0f 85 79 08 00 00    	jne    248be8 <dequeue_task_fair+0xd16>
049d   24836f:	ff 0b                	decl   (%rbx)
049f   248371:	f6 44 24 18 01       	testb  $0x1,0x18(%rsp)
04a4   248376:	8b 6c 24 10          	mov    0x10(%rsp),%ebp
04a8   24837a:	75 56                	jne    2483d2 <dequeue_task_fair+0x500>
04aa   24837c:	49 8d 9e e8 00 00 00 	lea    0xe8(%r14),%rbx
04b1   248383:	48 89 d8             	mov    %rbx,%rax
04b4   248386:	48 c1 e8 03          	shr    $0x3,%rax
04b8   24838a:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
04bc   24838e:	74 12                	je     2483a2 <dequeue_task_fair+0x4d0>
04be   248390:	48 89 df             	mov    %rbx,%rdi
04c1   248393:	e8 00 00 00 00       	call   248398 <dequeue_task_fair+0x4c6>	248394: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
04c6   248398:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
04d0   2483a2:	4c 8b 33             	mov    (%rbx),%r14
04d3   2483a5:	49 8d 9f d0 00 00 00 	lea    0xd0(%r15),%rbx
04da   2483ac:	48 89 d8             	mov    %rbx,%rax
04dd   2483af:	48 c1 e8 03          	shr    $0x3,%rax
04e1   2483b3:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
04e5   2483b7:	74 12                	je     2483cb <dequeue_task_fair+0x4f9>
04e7   2483b9:	48 89 df             	mov    %rbx,%rdi
04ea   2483bc:	e8 00 00 00 00       	call   2483c1 <dequeue_task_fair+0x4ef>	2483bd: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
04ef   2483c1:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
04f9   2483cb:	4c 29 33             	sub    %r14,(%rbx)
04fc   2483ce:	4c 8b 34 24          	mov    (%rsp),%r14
0500   2483d2:	8b 44 24 18          	mov    0x18(%rsp),%eax
0504   2483d6:	83 e0 06             	and    $0x6,%eax
0507   2483d9:	83 f8 02             	cmp    $0x2,%eax
050a   2483dc:	74 14                	je     2483f2 <dequeue_task_fair+0x520>
050c   2483de:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
0511   2483e3:	e8 c5 a8 00 00       	call   252cad <update_min_vruntime>
0516   2483e8:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0520   2483f2:	49 8d be d4 00 00 00 	lea    0xd4(%r14),%rdi
0527   2483f9:	48 89 f8             	mov    %rdi,%rax
052a   2483fc:	48 c1 e8 03          	shr    $0x3,%rax
052e   248400:	8a 04 10             	mov    (%rax,%rdx,1),%al
0531   248403:	84 c0                	test   %al,%al
0533   248405:	4c 8b 7c 24 50       	mov    0x50(%rsp),%r15
0538   24840a:	0f 85 ff 07 00 00    	jne    248c0f <dequeue_task_fair+0xd3d>
053e   248410:	41 ff 8e d4 00 00 00 	decl   0xd4(%r14)
0545   248417:	49 81 c6 d8 00 00 00 	add    $0xd8,%r14
054c   24841e:	4c 89 f0             	mov    %r14,%rax
054f   248421:	48 c1 e8 03          	shr    $0x3,%rax
0553   248425:	8a 04 10             	mov    (%rax,%rdx,1),%al
0556   248428:	84 c0                	test   %al,%al
0558   24842a:	0f 85 03 08 00 00    	jne    248c33 <dequeue_task_fair+0xd61>
055e   248430:	41 01 2e             	add    %ebp,(%r14)
0561   248433:	48 8b 7c 24 58       	mov    0x58(%rsp),%rdi
0566   248438:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
056b   24843d:	8a 04 10             	mov    (%rax,%rdx,1),%al
056e   248440:	84 c0                	test   %al,%al
0570   248442:	0f 85 0a 05 00 00    	jne    248952 <dequeue_task_fair+0xa80>
0576   248448:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
057b   24844d:	ff 08                	decl   (%rax)
057d   24844f:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
0582   248454:	48 8d b7 48 0a 00 00 	lea    0xa48(%rdi),%rsi
0589   24845b:	48 89 f5             	mov    %rsi,%rbp
058c   24845e:	48 c1 ed 03          	shr    $0x3,%rbp
0590   248462:	8a 44 15 00          	mov    0x0(%rbp,%rdx,1),%al
0594   248466:	84 c0                	test   %al,%al
0596   248468:	0f 85 16 05 00 00    	jne    248984 <dequeue_task_fair+0xab2>
059c   24846e:	44 8b 2e             	mov    (%rsi),%r13d
059f   248471:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
05a4   248476:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
05a9   24847b:	4c 8b 64 24 20       	mov    0x20(%rsp),%r12
05ae   248480:	74 34                	je     2484b6 <dequeue_task_fair+0x5e4>
05b0   248482:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
05b5   248487:	8a 04 10             	mov    (%rax,%rdx,1),%al
05b8   24848a:	84 c0                	test   %al,%al
05ba   24848c:	0f 85 c9 07 00 00    	jne    248c5b <dequeue_task_fair+0xd89>
05c0   248492:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
05c5   248497:	8b 18                	mov    (%rax),%ebx
05c7   248499:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
05cc   24849e:	8a 04 10             	mov    (%rax,%rdx,1),%al
05cf   2484a1:	84 c0                	test   %al,%al
05d1   2484a3:	0f 85 ea 07 00 00    	jne    248c93 <dequeue_task_fair+0xdc1>
05d7   2484a9:	85 db                	test   %ebx,%ebx
05d9   2484ab:	74 09                	je     2484b6 <dequeue_task_fair+0x5e4>
05db   2484ad:	41 3b 1f             	cmp    (%r15),%ebx
05de   2484b0:	0f 84 97 03 00 00    	je     24884d <dequeue_task_fair+0x97b>
05e4   2484b6:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
05e9   2484bb:	f6 44 24 18 01       	testb  $0x1,0x18(%rsp)
05ee   2484c0:	0f 84 35 03 00 00    	je     2487fb <dequeue_task_fair+0x929>
05f4   2484c6:	49 8d 8c 24 f8 01 00 00 	lea    0x1f8(%r12),%rcx
05fc   2484ce:	49 89 c9             	mov    %rcx,%r9
05ff   2484d1:	49 c1 e9 03          	shr    $0x3,%r9
0603   2484d5:	41 8a 04 11          	mov    (%r9,%rdx,1),%al
0607   2484d9:	84 c0                	test   %al,%al
0609   2484db:	0f 85 e6 07 00 00    	jne    248cc7 <dequeue_task_fair+0xdf5>
060f   2484e1:	45 8b 9c 24 f8 01 00 00 	mov    0x1f8(%r12),%r11d
0617   2484e9:	49 8d bc 24 fc 01 00 00 	lea    0x1fc(%r12),%rdi
061f   2484f1:	49 89 f8             	mov    %rdi,%r8
0622   2484f4:	49 c1 e8 03          	shr    $0x3,%r8
0626   2484f8:	41 8a 04 10          	mov    (%r8,%rdx,1),%al
062a   2484fc:	84 c0                	test   %al,%al
062c   2484fe:	0f 85 fd 07 00 00    	jne    248d01 <dequeue_task_fair+0xe2f>
0632   248504:	44 8b 37             	mov    (%rdi),%r14d
0635   248507:	4c 8d 54 24 6c       	lea    0x6c(%rsp),%r10
063a   24850c:	49 c1 ea 03          	shr    $0x3,%r10
063e   248510:	41 8a 04 12          	mov    (%r10,%rdx,1),%al
0642   248514:	84 c0                	test   %al,%al
0644   248516:	0f 85 38 08 00 00    	jne    248d54 <dequeue_task_fair+0xe82>
064a   24851c:	44 89 74 24 6c       	mov    %r14d,0x6c(%rsp)
064f   248521:	45 85 db             	test   %r11d,%r11d
0652   248524:	0f 88 d1 02 00 00    	js     2487fb <dequeue_task_fair+0x929>
0658   24852a:	49 81 c4 f0 01 00 00 	add    $0x1f0,%r12
065f   248531:	4c 89 e0             	mov    %r12,%rax
0662   248534:	48 c1 e8 03          	shr    $0x3,%rax
0666   248538:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
066b   24853d:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
066f   248541:	74 4c                	je     24858f <dequeue_task_fair+0x6bd>
0671   248543:	48 89 3c 24          	mov    %rdi,(%rsp)
0675   248547:	4c 89 e7             	mov    %r12,%rdi
0678   24854a:	48 89 f3             	mov    %rsi,%rbx
067b   24854d:	48 89 4c 24 18       	mov    %rcx,0x18(%rsp)
0680   248552:	48 89 6c 24 10       	mov    %rbp,0x10(%rsp)
0685   248557:	4c 89 c5             	mov    %r8,%rbp
0688   24855a:	4d 89 ce             	mov    %r9,%r14
068b   24855d:	4d 89 d5             	mov    %r10,%r13
068e   248560:	45 89 df             	mov    %r11d,%r15d
0691   248563:	e8 00 00 00 00       	call   248568 <dequeue_task_fair+0x696>	248564: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0696   248568:	45 89 fb             	mov    %r15d,%r11d
0699   24856b:	4d 89 ea             	mov    %r13,%r10
069c   24856e:	4d 89 f1             	mov    %r14,%r9
069f   248571:	49 89 e8             	mov    %rbp,%r8
06a2   248574:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
06a7   248579:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
06ac   24857e:	48 8b 3c 24          	mov    (%rsp),%rdi
06b0   248582:	48 89 de             	mov    %rbx,%rsi
06b3   248585:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
06bd   24858f:	4c 89 64 24 20       	mov    %r12,0x20(%rsp)
06c2   248594:	4d 8b 24 24          	mov    (%r12),%r12
06c6   248598:	4c 8d 6c 24 70       	lea    0x70(%rsp),%r13
06cb   24859d:	49 c1 ed 03          	shr    $0x3,%r13
06cf   2485a1:	41 8a 44 15 00       	mov    0x0(%r13,%rdx,1),%al
06d4   2485a6:	84 c0                	test   %al,%al
06d6   2485a8:	0f 85 0d 08 00 00    	jne    248dbb <dequeue_task_fair+0xee9>
06dc   2485ae:	44 89 64 24 70       	mov    %r12d,0x70(%rsp)
06e1   2485b3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
06e6   2485b8:	41 8a 04 12          	mov    (%r10,%rdx,1),%al
06ea   2485bc:	84 c0                	test   %al,%al
06ec   2485be:	0f 85 56 08 00 00    	jne    248e1a <dequeue_task_fair+0xf48>
06f2   2485c4:	8b 5c 24 6c          	mov    0x6c(%rsp),%ebx
06f6   2485c8:	41 8a 44 15 00       	mov    0x0(%r13,%rdx,1),%al
06fb   2485cd:	84 c0                	test   %al,%al
06fd   2485cf:	0f 85 a8 08 00 00    	jne    248e7d <dequeue_task_fair+0xfab>
0703   2485d5:	44 8b 64 24 70       	mov    0x70(%rsp),%r12d
0708   2485da:	44 39 e3             	cmp    %r12d,%ebx
070b   2485dd:	0f 83 d2 00 00 00    	jae    2486b5 <dequeue_task_fair+0x7e3>
0711   2485e3:	41 8a 04 12          	mov    (%r10,%rdx,1),%al
0715   2485e7:	84 c0                	test   %al,%al
0717   2485e9:	0f 85 b6 0a 00 00    	jne    2490a5 <dequeue_task_fair+0x11d3>
071d   2485ef:	44 89 64 24 6c       	mov    %r12d,0x6c(%rsp)
0722   2485f4:	41 8a 44 15 00       	mov    0x0(%r13,%rdx,1),%al
0727   2485f9:	84 c0                	test   %al,%al
0729   2485fb:	0f 85 db 08 00 00    	jne    248edc <dequeue_task_fair+0x100a>
072f   248601:	80 4c 24 73 80       	orb    $0x80,0x73(%rsp)
0734   248606:	8b 5c 24 70          	mov    0x70(%rsp),%ebx
0738   24860a:	41 8a 04 11          	mov    (%r9,%rdx,1),%al
073c   24860e:	84 c0                	test   %al,%al
073e   248610:	0f 85 05 09 00 00    	jne    248f1b <dequeue_task_fair+0x1049>
0744   248616:	89 19                	mov    %ebx,(%rcx)
0746   248618:	41 8a 04 12          	mov    (%r10,%rdx,1),%al
074a   24861c:	84 c0                	test   %al,%al
074c   24861e:	0f 85 37 09 00 00    	jne    248f5b <dequeue_task_fair+0x1089>
0752   248624:	8b 5c 24 6c          	mov    0x6c(%rsp),%ebx
0756   248628:	41 8a 04 10          	mov    (%r8,%rdx,1),%al
075a   24862c:	84 c0                	test   %al,%al
075c   24862e:	0f 85 5f 09 00 00    	jne    248f93 <dequeue_task_fair+0x10c1>
0762   248634:	89 1f                	mov    %ebx,(%rdi)
0764   248636:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
0769   24863b:	65 8b 1d 00 00 00 00 	mov    %gs:0x0(%rip),%ebx        # 248642 <dequeue_task_fair+0x770>	24863e: R_X86_64_PC32	cpu_number-0x4
0770   248642:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	248645: R_X86_64_32S	nr_cpu_ids
0777   248649:	48 c1 e8 03          	shr    $0x3,%rax
077b   24864d:	8a 04 10             	mov    (%rax,%rdx,1),%al
077e   248650:	84 c0                	test   %al,%al
0780   248652:	0f 85 65 09 00 00    	jne    248fbd <dequeue_task_fair+0x10eb>
0786   248658:	39 1d 00 00 00 00    	cmp    %ebx,0x0(%rip)        # 24865e <dequeue_task_fair+0x78c>	24865a: R_X86_64_PC32	nr_cpu_ids-0x4
078c   24865e:	0f 86 5a 02 00 00    	jbe    2488be <dequeue_task_fair+0x9ec>
0792   248664:	89 db                	mov    %ebx,%ebx
0794   248666:	48 89 d8             	mov    %rbx,%rax
0797   248669:	48 c1 e8 06          	shr    $0x6,%rax
079b   24866d:	48 8d 3c c5 00 00 00 00 	lea    0x0(,%rax,8),%rdi	248671: R_X86_64_32S	__cpu_online_mask
07a3   248675:	be 08 00 00 00       	mov    $0x8,%esi
07a8   24867a:	e8 00 00 00 00       	call   24867f <dequeue_task_fair+0x7ad>	24867b: R_X86_64_PLT32	__kasan_check_read-0x4
07ad   24867f:	48 0f a3 1d 00 00 00 00 	bt     %rbx,0x0(%rip)        # 248687 <dequeue_task_fair+0x7b5>	248683: R_X86_64_PC32	__cpu_online_mask-0x4
07b5   248687:	0f 83 6e 01 00 00    	jae    2487fb <dequeue_task_fair+0x929>
07bb   24868d:	e8 00 00 00 00       	call   248692 <dequeue_task_fair+0x7c0>	24868e: R_X86_64_PLT32	rcu_is_watching-0x4
07c0   248692:	84 c0                	test   %al,%al
07c2   248694:	0f 85 61 01 00 00    	jne    2487fb <dequeue_task_fair+0x929>
07c8   24869a:	0f 0b                	ud2
07ca   24869c:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
07d3   2486a5:	48 3b 44 24 78       	cmp    0x78(%rsp),%rax
07d8   2486aa:	0f 85 54 0c 00 00    	jne    249304 <dequeue_task_fair+0x1432>
07de   2486b0:	e9 5a 01 00 00       	jmp    24880f <dequeue_task_fair+0x93d>
07e3   2486b5:	41 8a 44 15 00       	mov    0x0(%r13,%rdx,1),%al
07e8   2486ba:	84 c0                	test   %al,%al
07ea   2486bc:	0f 85 21 09 00 00    	jne    248fe3 <dequeue_task_fair+0x1111>
07f0   2486c2:	44 8b 64 24 70       	mov    0x70(%rsp),%r12d
07f5   2486c7:	41 8a 04 12          	mov    (%r10,%rdx,1),%al
07f9   2486cb:	84 c0                	test   %al,%al
07fb   2486cd:	0f 85 6b 09 00 00    	jne    24903e <dequeue_task_fair+0x116c>
0801   2486d3:	44 89 e3             	mov    %r12d,%ebx
0804   2486d6:	2b 5c 24 6c          	sub    0x6c(%rsp),%ebx
0808   2486da:	8d 43 09             	lea    0x9(%rbx),%eax
080b   2486dd:	83 f8 12             	cmp    $0x12,%eax
080e   2486e0:	77 16                	ja     2486f8 <dequeue_task_fair+0x826>
0810   2486e2:	45 29 e3             	sub    %r12d,%r11d
0813   2486e5:	41 83 c3 09          	add    $0x9,%r11d
0817   2486e9:	41 83 fb 13          	cmp    $0x13,%r11d
081b   2486ed:	0f 83 01 ff ff ff    	jae    2485f4 <dequeue_task_fair+0x722>
0821   2486f3:	e9 03 01 00 00       	jmp    2487fb <dequeue_task_fair+0x929>
0826   2486f8:	48 89 5c 24 08       	mov    %rbx,0x8(%rsp)
082b   2486fd:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
0830   248702:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
0834   248706:	48 8b 5c 24 20       	mov    0x20(%rsp),%rbx
0839   24870b:	74 46                	je     248753 <dequeue_task_fair+0x881>
083b   24870d:	48 89 3c 24          	mov    %rdi,(%rsp)
083f   248711:	48 89 df             	mov    %rbx,%rdi
0842   248714:	49 89 f6             	mov    %rsi,%r14
0845   248717:	49 89 cf             	mov    %rcx,%r15
0848   24871a:	48 89 6c 24 10       	mov    %rbp,0x10(%rsp)
084d   24871f:	4c 89 c5             	mov    %r8,%rbp
0850   248722:	4d 89 cc             	mov    %r9,%r12
0853   248725:	4c 89 54 24 28       	mov    %r10,0x28(%rsp)
0858   24872a:	e8 00 00 00 00       	call   24872f <dequeue_task_fair+0x85d>	24872b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
085d   24872f:	4c 8b 54 24 28       	mov    0x28(%rsp),%r10
0862   248734:	4d 89 e1             	mov    %r12,%r9
0865   248737:	49 89 e8             	mov    %rbp,%r8
0868   24873a:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
086d   24873f:	4c 89 f9             	mov    %r15,%rcx
0870   248742:	48 8b 3c 24          	mov    (%rsp),%rdi
0874   248746:	4c 89 f6             	mov    %r14,%rsi
0877   248749:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0881   248753:	48 8b 03             	mov    (%rbx),%rax
0884   248756:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
0889   24875b:	8a 44 15 00          	mov    0x0(%rbp,%rdx,1),%al
088d   24875f:	84 c0                	test   %al,%al
088f   248761:	0f 85 8d 09 00 00    	jne    2490f4 <dequeue_task_fair+0x1222>
0895   248767:	48 89 4c 24 18       	mov    %rcx,0x18(%rsp)
089a   24876c:	8b 1e                	mov    (%rsi),%ebx
089c   24876e:	48 81 fb 00 20 00 00 	cmp    $0x2000,%rbx
08a3   248775:	0f 83 31 0a 00 00    	jae    2491ac <dequeue_task_fair+0x12da>
08a9   24877b:	4d 89 cf             	mov    %r9,%r15
08ac   24877e:	49 89 fc             	mov    %rdi,%r12
08af   248781:	48 63 c3             	movslq %ebx,%rax
08b2   248784:	48 8d 1c c5 00 00 00 00 	lea    0x0(,%rax,8),%rbx	248788: R_X86_64_32S	__per_cpu_offset
08ba   24878c:	48 89 d8             	mov    %rbx,%rax
08bd   24878f:	48 c1 e8 03          	shr    $0x3,%rax
08c1   248793:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
08c5   248797:	74 1e                	je     2487b7 <dequeue_task_fair+0x8e5>
08c7   248799:	48 89 df             	mov    %rbx,%rdi
08ca   24879c:	4d 89 c6             	mov    %r8,%r14
08cd   24879f:	4c 89 d5             	mov    %r10,%rbp
08d0   2487a2:	e8 00 00 00 00       	call   2487a7 <dequeue_task_fair+0x8d5>	2487a3: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
08d5   2487a7:	49 89 ea             	mov    %rbp,%r10
08d8   2487aa:	4d 89 f0             	mov    %r14,%r8
08db   2487ad:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
08e5   2487b7:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	2487ba: R_X86_64_32S	runqueues+0x9f8
08ec   2487be:	4c 03 33             	add    (%rbx),%r14
08ef   2487c1:	4c 89 f0             	mov    %r14,%rax
08f2   2487c4:	48 c1 e8 03          	shr    $0x3,%rax
08f6   2487c8:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
08fa   2487cc:	74 1e                	je     2487ec <dequeue_task_fair+0x91a>
08fc   2487ce:	4c 89 f7             	mov    %r14,%rdi
08ff   2487d1:	4c 89 c3             	mov    %r8,%rbx
0902   2487d4:	4c 89 d5             	mov    %r10,%rbp
0905   2487d7:	e8 00 00 00 00       	call   2487dc <dequeue_task_fair+0x90a>	2487d8: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
090a   2487dc:	49 89 ea             	mov    %rbp,%r10
090d   2487df:	49 89 d8             	mov    %rbx,%r8
0910   2487e2:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
091a   2487ec:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
091f   2487f1:	49 3b 06             	cmp    (%r14),%rax
0922   2487f4:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
0927   2487f9:	76 26                	jbe    248821 <dequeue_task_fair+0x94f>
0929   2487fb:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
0932   248804:	48 3b 44 24 78       	cmp    0x78(%rsp),%rax
0937   248809:	0f 85 f5 0a 00 00    	jne    249304 <dequeue_task_fair+0x1432>
093d   24880f:	48 81 c4 80 00 00 00 	add    $0x80,%rsp
0944   248816:	5b                   	pop    %rbx
0945   248817:	41 5c                	pop    %r12
0947   248819:	41 5d                	pop    %r13
0949   24881b:	41 5e                	pop    %r14
094b   24881d:	41 5f                	pop    %r15
094d   24881f:	5d                   	pop    %rbp
094e   248820:	c3                   	ret
094f   248821:	4c 89 e7             	mov    %r12,%rdi
0952   248824:	4d 89 f9             	mov    %r15,%r9
0955   248827:	41 8a 04 12          	mov    (%r10,%rdx,1),%al
0959   24882b:	84 c0                	test   %al,%al
095b   24882d:	0f 85 31 09 00 00    	jne    249164 <dequeue_task_fair+0x1292>
0961   248833:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
0966   248838:	c1 e8 02             	shr    $0x2,%eax
0969   24883b:	03 44 24 6c          	add    0x6c(%rsp),%eax
096d   24883f:	25 ff ff ff 3f       	and    $0x3fffffff,%eax
0972   248844:	89 44 24 6c          	mov    %eax,0x6c(%rsp)
0976   248848:	e9 a7 fd ff ff       	jmp    2485f4 <dequeue_task_fair+0x722>
097b   24884d:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	248850: R_X86_64_32S	jiffies
0982   248854:	48 c1 e8 03          	shr    $0x3,%rax
0986   248858:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
098a   24885c:	74 22                	je     248880 <dequeue_task_fair+0x9ae>
098c   24885e:	48 89 fb             	mov    %rdi,%rbx
098f   248861:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	248864: R_X86_64_32S	jiffies
0996   248868:	49 89 f6             	mov    %rsi,%r14
0999   24886b:	e8 00 00 00 00       	call   248870 <dequeue_task_fair+0x99e>	24886c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
099e   248870:	4c 89 f6             	mov    %r14,%rsi
09a1   248873:	48 89 df             	mov    %rbx,%rdi
09a4   248876:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
09ae   248880:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 248887 <dequeue_task_fair+0x9b5>	248883: R_X86_64_PC32	jiffies-0x4
09b5   248887:	48 81 c7 68 09 00 00 	add    $0x968,%rdi
09bc   24888e:	48 89 f8             	mov    %rdi,%rax
09bf   248891:	48 c1 e8 03          	shr    $0x3,%rax
09c3   248895:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
09c7   248899:	74 1b                	je     2488b6 <dequeue_task_fair+0x9e4>
09c9   24889b:	49 89 fe             	mov    %rdi,%r14
09cc   24889e:	49 89 f7             	mov    %rsi,%r15
09cf   2488a1:	e8 00 00 00 00       	call   2488a6 <dequeue_task_fair+0x9d4>	2488a2: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
09d4   2488a6:	4c 89 fe             	mov    %r15,%rsi
09d7   2488a9:	4c 89 f7             	mov    %r14,%rdi
09da   2488ac:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
09e4   2488b6:	48 89 1f             	mov    %rbx,(%rdi)
09e7   2488b9:	e9 f8 fb ff ff       	jmp    2484b6 <dequeue_task_fair+0x5e4>
09ec   2488be:	0f 0b                	ud2
09ee   2488c0:	e9 9f fd ff ff       	jmp    248664 <dequeue_task_fair+0x792>
09f3   2488c5:	89 d9                	mov    %ebx,%ecx
09f5   2488c7:	80 e1 07             	and    $0x7,%cl
09f8   2488ca:	80 c1 03             	add    $0x3,%cl
09fb   2488cd:	38 c1                	cmp    %al,%cl
09fd   2488cf:	0f 8c 46 f6 ff ff    	jl     247f1b <dequeue_task_fair+0x49>
0a03   2488d5:	49 89 fe             	mov    %rdi,%r14
0a06   2488d8:	48 89 df             	mov    %rbx,%rdi
0a09   2488db:	e8 00 00 00 00       	call   2488e0 <dequeue_task_fair+0xa0e>	2488dc: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0a0e   2488e0:	4c 89 f7             	mov    %r14,%rdi
0a11   2488e3:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0a1b   2488ed:	e9 29 f6 ff ff       	jmp    247f1b <dequeue_task_fair+0x49>
0a20   2488f2:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
0a25   2488f7:	80 e1 07             	and    $0x7,%cl
0a28   2488fa:	80 c1 03             	add    $0x3,%cl
0a2b   2488fd:	38 c1                	cmp    %al,%cl
0a2d   2488ff:	0f 8c 3e f6 ff ff    	jl     247f43 <dequeue_task_fair+0x71>
0a33   248905:	49 89 fe             	mov    %rdi,%r14
0a36   248908:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
0a3b   24890d:	e8 00 00 00 00       	call   248912 <dequeue_task_fair+0xa40>	24890e: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0a40   248912:	4c 89 f7             	mov    %r14,%rdi
0a43   248915:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0a4d   24891f:	e9 1f f6 ff ff       	jmp    247f43 <dequeue_task_fair+0x71>
0a52   248924:	44 89 f9             	mov    %r15d,%ecx
0a55   248927:	80 e1 07             	and    $0x7,%cl
0a58   24892a:	80 c1 03             	add    $0x3,%cl
0a5b   24892d:	38 c1                	cmp    %al,%cl
0a5d   24892f:	0f 8c 32 f6 ff ff    	jl     247f67 <dequeue_task_fair+0x95>
0a63   248935:	49 89 fe             	mov    %rdi,%r14
0a66   248938:	4c 89 ff             	mov    %r15,%rdi
0a69   24893b:	e8 00 00 00 00       	call   248940 <dequeue_task_fair+0xa6e>	24893c: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0a6e   248940:	4c 89 f7             	mov    %r14,%rdi
0a71   248943:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0a7b   24894d:	e9 15 f6 ff ff       	jmp    247f67 <dequeue_task_fair+0x95>
0a80   248952:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
0a85   248957:	80 e1 07             	and    $0x7,%cl
0a88   24895a:	80 c1 03             	add    $0x3,%cl
0a8b   24895d:	38 c1                	cmp    %al,%cl
0a8d   24895f:	0f 8c e3 fa ff ff    	jl     248448 <dequeue_task_fair+0x576>
0a93   248965:	48 89 fb             	mov    %rdi,%rbx
0a96   248968:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
0a9b   24896d:	e8 00 00 00 00       	call   248972 <dequeue_task_fair+0xaa0>	24896e: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0aa0   248972:	48 89 df             	mov    %rbx,%rdi
0aa3   248975:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0aad   24897f:	e9 c4 fa ff ff       	jmp    248448 <dequeue_task_fair+0x576>
0ab2   248984:	89 f1                	mov    %esi,%ecx
0ab4   248986:	80 e1 07             	and    $0x7,%cl
0ab7   248989:	80 c1 03             	add    $0x3,%cl
0aba   24898c:	38 c1                	cmp    %al,%cl
0abc   24898e:	0f 8c da fa ff ff    	jl     24846e <dequeue_task_fair+0x59c>
0ac2   248994:	48 89 fb             	mov    %rdi,%rbx
0ac5   248997:	48 89 f7             	mov    %rsi,%rdi
0ac8   24899a:	49 89 f6             	mov    %rsi,%r14
0acb   24899d:	e8 00 00 00 00       	call   2489a2 <dequeue_task_fair+0xad0>	24899e: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0ad0   2489a2:	4c 89 f6             	mov    %r14,%rsi
0ad3   2489a5:	48 89 df             	mov    %rbx,%rdi
0ad6   2489a8:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0ae0   2489b2:	e9 b7 fa ff ff       	jmp    24846e <dequeue_task_fair+0x59c>
0ae5   2489b7:	89 f1                	mov    %esi,%ecx
0ae7   2489b9:	80 e1 07             	and    $0x7,%cl
0aea   2489bc:	80 c1 03             	add    $0x3,%cl
0aed   2489bf:	38 c1                	cmp    %al,%cl
0aef   2489c1:	0f 8c ec f5 ff ff    	jl     247fb3 <dequeue_task_fair+0xe1>
0af5   2489c7:	48 89 fb             	mov    %rdi,%rbx
0af8   2489ca:	48 89 f7             	mov    %rsi,%rdi
0afb   2489cd:	49 89 f6             	mov    %rsi,%r14
0afe   2489d0:	e8 00 00 00 00       	call   2489d5 <dequeue_task_fair+0xb03>	2489d1: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0b03   2489d5:	4c 89 f6             	mov    %r14,%rsi
0b06   2489d8:	48 89 df             	mov    %rbx,%rdi
0b09   2489db:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0b13   2489e5:	e9 c9 f5 ff ff       	jmp    247fb3 <dequeue_task_fair+0xe1>
0b18   2489ea:	89 d9                	mov    %ebx,%ecx
0b1a   2489ec:	80 e1 07             	and    $0x7,%cl
0b1d   2489ef:	80 c1 03             	add    $0x3,%cl
0b20   2489f2:	38 c1                	cmp    %al,%cl
0b22   2489f4:	0f 8c d4 f5 ff ff    	jl     247fce <dequeue_task_fair+0xfc>
0b28   2489fa:	49 89 fe             	mov    %rdi,%r14
0b2b   2489fd:	48 89 df             	mov    %rbx,%rdi
0b2e   248a00:	49 89 f4             	mov    %rsi,%r12
0b31   248a03:	e8 00 00 00 00       	call   248a08 <dequeue_task_fair+0xb36>	248a04: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0b36   248a08:	4c 89 e6             	mov    %r12,%rsi
0b39   248a0b:	4c 89 f7             	mov    %r14,%rdi
0b3c   248a0e:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0b46   248a18:	e9 b1 f5 ff ff       	jmp    247fce <dequeue_task_fair+0xfc>
0b4b   248a1d:	3c 03                	cmp    $0x3,%al
0b4d   248a1f:	0f 8f c0 f5 ff ff    	jg     247fe5 <dequeue_task_fair+0x113>
0b53   248a25:	48 89 fb             	mov    %rdi,%rbx
0b56   248a28:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
0b5b   248a2d:	49 89 f4             	mov    %rsi,%r12
0b5e   248a30:	e8 00 00 00 00       	call   248a35 <dequeue_task_fair+0xb63>	248a31: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
0b63   248a35:	4c 89 e6             	mov    %r12,%rsi
0b66   248a38:	48 89 df             	mov    %rbx,%rdi
0b69   248a3b:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0b73   248a45:	e9 9b f5 ff ff       	jmp    247fe5 <dequeue_task_fair+0x113>
0b78   248a4a:	89 d9                	mov    %ebx,%ecx
0b7a   248a4c:	80 e1 07             	and    $0x7,%cl
0b7d   248a4f:	80 c1 03             	add    $0x3,%cl
0b80   248a52:	38 c1                	cmp    %al,%cl
0b82   248a54:	0f 8c a9 f5 ff ff    	jl     248003 <dequeue_task_fair+0x131>
0b88   248a5a:	49 89 fc             	mov    %rdi,%r12
0b8b   248a5d:	48 89 df             	mov    %rbx,%rdi
0b8e   248a60:	49 89 f5             	mov    %rsi,%r13
0b91   248a63:	e8 00 00 00 00       	call   248a68 <dequeue_task_fair+0xb96>	248a64: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0b96   248a68:	4c 89 ee             	mov    %r13,%rsi
0b99   248a6b:	4c 89 e7             	mov    %r12,%rdi
0b9c   248a6e:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0ba6   248a78:	e9 86 f5 ff ff       	jmp    248003 <dequeue_task_fair+0x131>
0bab   248a7d:	48 8d 4c 24 6c       	lea    0x6c(%rsp),%rcx
0bb0   248a82:	80 e1 04             	and    $0x4,%cl
0bb3   248a85:	80 c9 03             	or     $0x3,%cl
0bb6   248a88:	38 c1                	cmp    %al,%cl
0bb8   248a8a:	0f 8c 8a f5 ff ff    	jl     24801a <dequeue_task_fair+0x148>
0bbe   248a90:	48 89 fb             	mov    %rdi,%rbx
0bc1   248a93:	48 8d 7c 24 6c       	lea    0x6c(%rsp),%rdi
0bc6   248a98:	49 89 f4             	mov    %rsi,%r12
0bc9   248a9b:	e8 00 00 00 00       	call   248aa0 <dequeue_task_fair+0xbce>	248a9c: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
0bce   248aa0:	4c 89 e6             	mov    %r12,%rsi
0bd1   248aa3:	48 89 df             	mov    %rbx,%rdi
0bd4   248aa6:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0bde   248ab0:	e9 65 f5 ff ff       	jmp    24801a <dequeue_task_fair+0x148>
0be3   248ab5:	89 f1                	mov    %esi,%ecx
0be5   248ab7:	80 e1 07             	and    $0x7,%cl
0be8   248aba:	80 c1 03             	add    $0x3,%cl
0beb   248abd:	38 c1                	cmp    %al,%cl
0bed   248abf:	0f 8c 86 f5 ff ff    	jl     24804b <dequeue_task_fair+0x179>
0bf3   248ac5:	48 89 f7             	mov    %rsi,%rdi
0bf6   248ac8:	49 89 f6             	mov    %rsi,%r14
0bf9   248acb:	e8 00 00 00 00       	call   248ad0 <dequeue_task_fair+0xbfe>	248acc: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
0bfe   248ad0:	4c 89 f6             	mov    %r14,%rsi
0c01   248ad3:	e9 73 f5 ff ff       	jmp    24804b <dequeue_task_fair+0x179>
0c06   248ad8:	44 89 e1             	mov    %r12d,%ecx
0c09   248adb:	80 e1 07             	and    $0x7,%cl
0c0c   248ade:	80 c1 03             	add    $0x3,%cl
0c0f   248ae1:	38 c1                	cmp    %al,%cl
0c11   248ae3:	0f 8c a9 f5 ff ff    	jl     248092 <dequeue_task_fair+0x1c0>
0c17   248ae9:	48 89 fb             	mov    %rdi,%rbx
0c1a   248aec:	4c 89 e7             	mov    %r12,%rdi
0c1d   248aef:	e8 00 00 00 00       	call   248af4 <dequeue_task_fair+0xc22>	248af0: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0c22   248af4:	48 89 df             	mov    %rbx,%rdi
0c25   248af7:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0c2f   248b01:	e9 8c f5 ff ff       	jmp    248092 <dequeue_task_fair+0x1c0>
0c34   248b06:	89 d9                	mov    %ebx,%ecx
0c36   248b08:	80 e1 07             	and    $0x7,%cl
0c39   248b0b:	80 c1 03             	add    $0x3,%cl
0c3c   248b0e:	38 c1                	cmp    %al,%cl
0c3e   248b10:	0f 8c 59 f6 ff ff    	jl     24816f <dequeue_task_fair+0x29d>
0c44   248b16:	48 89 df             	mov    %rbx,%rdi
0c47   248b19:	e8 00 00 00 00       	call   248b1e <dequeue_task_fair+0xc4c>	248b1a: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
0c4c   248b1e:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0c56   248b28:	e9 42 f6 ff ff       	jmp    24816f <dequeue_task_fair+0x29d>
0c5b   248b2d:	89 d9                	mov    %ebx,%ecx
0c5d   248b2f:	80 e1 07             	and    $0x7,%cl
0c60   248b32:	80 c1 03             	add    $0x3,%cl
0c63   248b35:	38 c1                	cmp    %al,%cl
0c65   248b37:	0f 8c 9d f6 ff ff    	jl     2481da <dequeue_task_fair+0x308>
0c6b   248b3d:	48 89 df             	mov    %rbx,%rdi
0c6e   248b40:	e8 00 00 00 00       	call   248b45 <dequeue_task_fair+0xc73>	248b41: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
0c73   248b45:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0c7d   248b4f:	e9 86 f6 ff ff       	jmp    2481da <dequeue_task_fair+0x308>
0c82   248b54:	89 d9                	mov    %ebx,%ecx
0c84   248b56:	80 e1 07             	and    $0x7,%cl
0c87   248b59:	80 c1 03             	add    $0x3,%cl
0c8a   248b5c:	38 c1                	cmp    %al,%cl
0c8c   248b5e:	0f 8c 9a f6 ff ff    	jl     2481fe <dequeue_task_fair+0x32c>
0c92   248b64:	48 89 df             	mov    %rbx,%rdi
0c95   248b67:	e8 00 00 00 00       	call   248b6c <dequeue_task_fair+0xc9a>	248b68: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0c9a   248b6c:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0ca4   248b76:	e9 83 f6 ff ff       	jmp    2481fe <dequeue_task_fair+0x32c>
0ca9   248b7b:	44 89 f9             	mov    %r15d,%ecx
0cac   248b7e:	80 e1 07             	and    $0x7,%cl
0caf   248b81:	80 c1 03             	add    $0x3,%cl
0cb2   248b84:	38 c1                	cmp    %al,%cl
0cb4   248b86:	0f 8c 93 f6 ff ff    	jl     24821f <dequeue_task_fair+0x34d>
0cba   248b8c:	4c 89 ff             	mov    %r15,%rdi
0cbd   248b8f:	e8 00 00 00 00       	call   248b94 <dequeue_task_fair+0xcc2>	248b90: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0cc2   248b94:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0ccc   248b9e:	e9 7c f6 ff ff       	jmp    24821f <dequeue_task_fair+0x34d>
0cd1   248ba3:	44 89 e1             	mov    %r12d,%ecx
0cd4   248ba6:	80 e1 07             	and    $0x7,%cl
0cd7   248ba9:	80 c1 03             	add    $0x3,%cl
0cda   248bac:	38 c1                	cmp    %al,%cl
0cdc   248bae:	0f 8c 80 f6 ff ff    	jl     248234 <dequeue_task_fair+0x362>
0ce2   248bb4:	4c 89 e7             	mov    %r12,%rdi
0ce5   248bb7:	e8 00 00 00 00       	call   248bbc <dequeue_task_fair+0xcea>	248bb8: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0cea   248bbc:	e9 73 f6 ff ff       	jmp    248234 <dequeue_task_fair+0x362>
0cef   248bc1:	89 d9                	mov    %ebx,%ecx
0cf1   248bc3:	80 e1 07             	and    $0x7,%cl
0cf4   248bc6:	80 c1 03             	add    $0x3,%cl
0cf7   248bc9:	38 c1                	cmp    %al,%cl
0cf9   248bcb:	0f 8c 99 f6 ff ff    	jl     24826a <dequeue_task_fair+0x398>
0cff   248bd1:	48 89 df             	mov    %rbx,%rdi
0d02   248bd4:	e8 00 00 00 00       	call   248bd9 <dequeue_task_fair+0xd07>	248bd5: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0d07   248bd9:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0d11   248be3:	e9 82 f6 ff ff       	jmp    24826a <dequeue_task_fair+0x398>
0d16   248be8:	89 d9                	mov    %ebx,%ecx
0d18   248bea:	80 e1 07             	and    $0x7,%cl
0d1b   248bed:	80 c1 03             	add    $0x3,%cl
0d1e   248bf0:	38 c1                	cmp    %al,%cl
0d20   248bf2:	0f 8c 77 f7 ff ff    	jl     24836f <dequeue_task_fair+0x49d>
0d26   248bf8:	48 89 df             	mov    %rbx,%rdi
0d29   248bfb:	e8 00 00 00 00       	call   248c00 <dequeue_task_fair+0xd2e>	248bfc: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0d2e   248c00:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0d38   248c0a:	e9 60 f7 ff ff       	jmp    24836f <dequeue_task_fair+0x49d>
0d3d   248c0f:	89 f9                	mov    %edi,%ecx
0d3f   248c11:	80 e1 07             	and    $0x7,%cl
0d42   248c14:	80 c1 03             	add    $0x3,%cl
0d45   248c17:	38 c1                	cmp    %al,%cl
0d47   248c19:	0f 8c f1 f7 ff ff    	jl     248410 <dequeue_task_fair+0x53e>
0d4d   248c1f:	e8 00 00 00 00       	call   248c24 <dequeue_task_fair+0xd52>	248c20: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0d52   248c24:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0d5c   248c2e:	e9 dd f7 ff ff       	jmp    248410 <dequeue_task_fair+0x53e>
0d61   248c33:	44 89 f1             	mov    %r14d,%ecx
0d64   248c36:	80 e1 07             	and    $0x7,%cl
0d67   248c39:	80 c1 03             	add    $0x3,%cl
0d6a   248c3c:	38 c1                	cmp    %al,%cl
0d6c   248c3e:	0f 8c ec f7 ff ff    	jl     248430 <dequeue_task_fair+0x55e>
0d72   248c44:	4c 89 f7             	mov    %r14,%rdi
0d75   248c47:	e8 00 00 00 00       	call   248c4c <dequeue_task_fair+0xd7a>	248c48: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0d7a   248c4c:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0d84   248c56:	e9 d5 f7 ff ff       	jmp    248430 <dequeue_task_fair+0x55e>
0d89   248c5b:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
0d8e   248c60:	80 e1 07             	and    $0x7,%cl
0d91   248c63:	80 c1 03             	add    $0x3,%cl
0d94   248c66:	38 c1                	cmp    %al,%cl
0d96   248c68:	0f 8c 24 f8 ff ff    	jl     248492 <dequeue_task_fair+0x5c0>
0d9c   248c6e:	48 89 fb             	mov    %rdi,%rbx
0d9f   248c71:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
0da4   248c76:	49 89 f6             	mov    %rsi,%r14
0da7   248c79:	e8 00 00 00 00       	call   248c7e <dequeue_task_fair+0xdac>	248c7a: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0dac   248c7e:	4c 89 f6             	mov    %r14,%rsi
0daf   248c81:	48 89 df             	mov    %rbx,%rdi
0db2   248c84:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0dbc   248c8e:	e9 ff f7 ff ff       	jmp    248492 <dequeue_task_fair+0x5c0>
0dc1   248c93:	44 89 f9             	mov    %r15d,%ecx
0dc4   248c96:	80 e1 07             	and    $0x7,%cl
0dc7   248c99:	80 c1 03             	add    $0x3,%cl
0dca   248c9c:	38 c1                	cmp    %al,%cl
0dcc   248c9e:	0f 8c 05 f8 ff ff    	jl     2484a9 <dequeue_task_fair+0x5d7>
0dd2   248ca4:	49 89 fe             	mov    %rdi,%r14
0dd5   248ca7:	4c 89 ff             	mov    %r15,%rdi
0dd8   248caa:	49 89 f5             	mov    %rsi,%r13
0ddb   248cad:	e8 00 00 00 00       	call   248cb2 <dequeue_task_fair+0xde0>	248cae: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0de0   248cb2:	4c 89 ee             	mov    %r13,%rsi
0de3   248cb5:	4c 89 f7             	mov    %r14,%rdi
0de6   248cb8:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0df0   248cc2:	e9 e2 f7 ff ff       	jmp    2484a9 <dequeue_task_fair+0x5d7>
0df5   248cc7:	49 89 ce             	mov    %rcx,%r14
0df8   248cca:	80 e1 07             	and    $0x7,%cl
0dfb   248ccd:	80 c1 03             	add    $0x3,%cl
0dfe   248cd0:	38 c1                	cmp    %al,%cl
0e00   248cd2:	4c 89 f1             	mov    %r14,%rcx
0e03   248cd5:	0f 8c 06 f8 ff ff    	jl     2484e1 <dequeue_task_fair+0x60f>
0e09   248cdb:	48 89 cf             	mov    %rcx,%rdi
0e0c   248cde:	48 89 f3             	mov    %rsi,%rbx
0e0f   248ce1:	4d 89 cf             	mov    %r9,%r15
0e12   248ce4:	e8 00 00 00 00       	call   248ce9 <dequeue_task_fair+0xe17>	248ce5: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0e17   248ce9:	4d 89 f9             	mov    %r15,%r9
0e1a   248cec:	4c 89 f1             	mov    %r14,%rcx
0e1d   248cef:	48 89 de             	mov    %rbx,%rsi
0e20   248cf2:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0e2a   248cfc:	e9 e0 f7 ff ff       	jmp    2484e1 <dequeue_task_fair+0x60f>
0e2f   248d01:	49 89 cf             	mov    %rcx,%r15
0e32   248d04:	89 f9                	mov    %edi,%ecx
0e34   248d06:	80 e1 07             	and    $0x7,%cl
0e37   248d09:	80 c1 03             	add    $0x3,%cl
0e3a   248d0c:	38 c1                	cmp    %al,%cl
0e3c   248d0e:	4c 89 f9             	mov    %r15,%rcx
0e3f   248d11:	0f 8c ed f7 ff ff    	jl     248504 <dequeue_task_fair+0x632>
0e45   248d17:	49 89 fe             	mov    %rdi,%r14
0e48   248d1a:	48 89 f3             	mov    %rsi,%rbx
0e4b   248d1d:	4d 89 c5             	mov    %r8,%r13
0e4e   248d20:	4c 89 4c 24 30       	mov    %r9,0x30(%rsp)
0e53   248d25:	44 89 5c 24 08       	mov    %r11d,0x8(%rsp)
0e58   248d2a:	e8 00 00 00 00       	call   248d2f <dequeue_task_fair+0xe5d>	248d2b: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0e5d   248d2f:	44 8b 5c 24 08       	mov    0x8(%rsp),%r11d
0e62   248d34:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
0e67   248d39:	4d 89 e8             	mov    %r13,%r8
0e6a   248d3c:	4c 89 f9             	mov    %r15,%rcx
0e6d   248d3f:	4c 89 f7             	mov    %r14,%rdi
0e70   248d42:	48 89 de             	mov    %rbx,%rsi
0e73   248d45:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0e7d   248d4f:	e9 b0 f7 ff ff       	jmp    248504 <dequeue_task_fair+0x632>
0e82   248d54:	49 89 cd             	mov    %rcx,%r13
0e85   248d57:	48 8d 4c 24 6c       	lea    0x6c(%rsp),%rcx
0e8a   248d5c:	80 e1 04             	and    $0x4,%cl
0e8d   248d5f:	80 c9 03             	or     $0x3,%cl
0e90   248d62:	38 c1                	cmp    %al,%cl
0e92   248d64:	4c 89 e9             	mov    %r13,%rcx
0e95   248d67:	0f 8c af f7 ff ff    	jl     24851c <dequeue_task_fair+0x64a>
0e9b   248d6d:	48 89 3c 24          	mov    %rdi,(%rsp)
0e9f   248d71:	48 8d 7c 24 6c       	lea    0x6c(%rsp),%rdi
0ea4   248d76:	48 89 f3             	mov    %rsi,%rbx
0ea7   248d79:	4d 89 c7             	mov    %r8,%r15
0eaa   248d7c:	4c 89 4c 24 30       	mov    %r9,0x30(%rsp)
0eaf   248d81:	4c 89 54 24 28       	mov    %r10,0x28(%rsp)
0eb4   248d86:	44 89 5c 24 08       	mov    %r11d,0x8(%rsp)
0eb9   248d8b:	e8 00 00 00 00       	call   248d90 <dequeue_task_fair+0xebe>	248d8c: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
0ebe   248d90:	44 8b 5c 24 08       	mov    0x8(%rsp),%r11d
0ec3   248d95:	4c 8b 54 24 28       	mov    0x28(%rsp),%r10
0ec8   248d9a:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
0ecd   248d9f:	4d 89 f8             	mov    %r15,%r8
0ed0   248da2:	4c 89 e9             	mov    %r13,%rcx
0ed3   248da5:	48 8b 3c 24          	mov    (%rsp),%rdi
0ed7   248da9:	48 89 de             	mov    %rbx,%rsi
0eda   248dac:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0ee4   248db6:	e9 61 f7 ff ff       	jmp    24851c <dequeue_task_fair+0x64a>
0ee9   248dbb:	3c 03                	cmp    $0x3,%al
0eeb   248dbd:	0f 8f eb f7 ff ff    	jg     2485ae <dequeue_task_fair+0x6dc>
0ef1   248dc3:	48 89 3c 24          	mov    %rdi,(%rsp)
0ef5   248dc7:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
0efa   248dcc:	48 89 f3             	mov    %rsi,%rbx
0efd   248dcf:	48 89 4c 24 18       	mov    %rcx,0x18(%rsp)
0f02   248dd4:	48 89 6c 24 10       	mov    %rbp,0x10(%rsp)
0f07   248dd9:	4c 89 c5             	mov    %r8,%rbp
0f0a   248ddc:	4d 89 ce             	mov    %r9,%r14
0f0d   248ddf:	4c 89 54 24 28       	mov    %r10,0x28(%rsp)
0f12   248de4:	45 89 df             	mov    %r11d,%r15d
0f15   248de7:	e8 00 00 00 00       	call   248dec <dequeue_task_fair+0xf1a>	248de8: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
0f1a   248dec:	45 89 fb             	mov    %r15d,%r11d
0f1d   248def:	4c 8b 54 24 28       	mov    0x28(%rsp),%r10
0f22   248df4:	4d 89 f1             	mov    %r14,%r9
0f25   248df7:	49 89 e8             	mov    %rbp,%r8
0f28   248dfa:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
0f2d   248dff:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
0f32   248e04:	48 8b 3c 24          	mov    (%rsp),%rdi
0f36   248e08:	48 89 de             	mov    %rbx,%rsi
0f39   248e0b:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0f43   248e15:	e9 94 f7 ff ff       	jmp    2485ae <dequeue_task_fair+0x6dc>
0f48   248e1a:	49 89 cc             	mov    %rcx,%r12
0f4b   248e1d:	48 8d 4c 24 6c       	lea    0x6c(%rsp),%rcx
0f50   248e22:	80 e1 04             	and    $0x4,%cl
0f53   248e25:	80 c9 03             	or     $0x3,%cl
0f56   248e28:	38 c1                	cmp    %al,%cl
0f58   248e2a:	4c 89 e1             	mov    %r12,%rcx
0f5b   248e2d:	0f 8c 91 f7 ff ff    	jl     2485c4 <dequeue_task_fair+0x6f2>
0f61   248e33:	48 89 3c 24          	mov    %rdi,(%rsp)
0f65   248e37:	48 8d 7c 24 6c       	lea    0x6c(%rsp),%rdi
0f6a   248e3c:	48 89 f3             	mov    %rsi,%rbx
0f6d   248e3f:	4d 89 c7             	mov    %r8,%r15
0f70   248e42:	4c 89 4c 24 30       	mov    %r9,0x30(%rsp)
0f75   248e47:	4d 89 d6             	mov    %r10,%r14
0f78   248e4a:	44 89 5c 24 08       	mov    %r11d,0x8(%rsp)
0f7d   248e4f:	e8 00 00 00 00       	call   248e54 <dequeue_task_fair+0xf82>	248e50: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0f82   248e54:	44 8b 5c 24 08       	mov    0x8(%rsp),%r11d
0f87   248e59:	4d 89 f2             	mov    %r14,%r10
0f8a   248e5c:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
0f8f   248e61:	4d 89 f8             	mov    %r15,%r8
0f92   248e64:	4c 89 e1             	mov    %r12,%rcx
0f95   248e67:	48 8b 3c 24          	mov    (%rsp),%rdi
0f99   248e6b:	48 89 de             	mov    %rbx,%rsi
0f9c   248e6e:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0fa6   248e78:	e9 47 f7 ff ff       	jmp    2485c4 <dequeue_task_fair+0x6f2>
0fab   248e7d:	3c 03                	cmp    $0x3,%al
0fad   248e7f:	0f 8f 50 f7 ff ff    	jg     2485d5 <dequeue_task_fair+0x703>
0fb3   248e85:	48 89 3c 24          	mov    %rdi,(%rsp)
0fb7   248e89:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
0fbc   248e8e:	49 89 f4             	mov    %rsi,%r12
0fbf   248e91:	48 89 4c 24 18       	mov    %rcx,0x18(%rsp)
0fc4   248e96:	48 89 6c 24 10       	mov    %rbp,0x10(%rsp)
0fc9   248e9b:	4c 89 c5             	mov    %r8,%rbp
0fcc   248e9e:	4d 89 ce             	mov    %r9,%r14
0fcf   248ea1:	4c 89 54 24 28       	mov    %r10,0x28(%rsp)
0fd4   248ea6:	45 89 df             	mov    %r11d,%r15d
0fd7   248ea9:	e8 00 00 00 00       	call   248eae <dequeue_task_fair+0xfdc>	248eaa: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0fdc   248eae:	45 89 fb             	mov    %r15d,%r11d
0fdf   248eb1:	4c 8b 54 24 28       	mov    0x28(%rsp),%r10
0fe4   248eb6:	4d 89 f1             	mov    %r14,%r9
0fe7   248eb9:	49 89 e8             	mov    %rbp,%r8
0fea   248ebc:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
0fef   248ec1:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
0ff4   248ec6:	48 8b 3c 24          	mov    (%rsp),%rdi
0ff8   248eca:	4c 89 e6             	mov    %r12,%rsi
0ffb   248ecd:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1005   248ed7:	e9 f9 f6 ff ff       	jmp    2485d5 <dequeue_task_fair+0x703>
100a   248edc:	3c 03                	cmp    $0x3,%al
100c   248ede:	0f 8f 1d f7 ff ff    	jg     248601 <dequeue_task_fair+0x72f>
1012   248ee4:	48 89 fb             	mov    %rdi,%rbx
1015   248ee7:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
101a   248eec:	49 89 ce             	mov    %rcx,%r14
101d   248eef:	4d 89 c7             	mov    %r8,%r15
1020   248ef2:	4d 89 cc             	mov    %r9,%r12
1023   248ef5:	4d 89 d5             	mov    %r10,%r13
1026   248ef8:	e8 00 00 00 00       	call   248efd <dequeue_task_fair+0x102b>	248ef9: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
102b   248efd:	4d 89 ea             	mov    %r13,%r10
102e   248f00:	4d 89 e1             	mov    %r12,%r9
1031   248f03:	4d 89 f8             	mov    %r15,%r8
1034   248f06:	4c 89 f1             	mov    %r14,%rcx
1037   248f09:	48 89 df             	mov    %rbx,%rdi
103a   248f0c:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1044   248f16:	e9 e6 f6 ff ff       	jmp    248601 <dequeue_task_fair+0x72f>
1049   248f1b:	49 89 cc             	mov    %rcx,%r12
104c   248f1e:	80 e1 07             	and    $0x7,%cl
104f   248f21:	80 c1 03             	add    $0x3,%cl
1052   248f24:	38 c1                	cmp    %al,%cl
1054   248f26:	4c 89 e1             	mov    %r12,%rcx
1057   248f29:	0f 8c e7 f6 ff ff    	jl     248616 <dequeue_task_fair+0x744>
105d   248f2f:	49 89 fe             	mov    %rdi,%r14
1060   248f32:	48 89 cf             	mov    %rcx,%rdi
1063   248f35:	4d 89 c7             	mov    %r8,%r15
1066   248f38:	4d 89 d5             	mov    %r10,%r13
1069   248f3b:	e8 00 00 00 00       	call   248f40 <dequeue_task_fair+0x106e>	248f3c: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
106e   248f40:	4d 89 ea             	mov    %r13,%r10
1071   248f43:	4d 89 f8             	mov    %r15,%r8
1074   248f46:	4c 89 e1             	mov    %r12,%rcx
1077   248f49:	4c 89 f7             	mov    %r14,%rdi
107a   248f4c:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1084   248f56:	e9 bb f6 ff ff       	jmp    248616 <dequeue_task_fair+0x744>
1089   248f5b:	48 8d 4c 24 6c       	lea    0x6c(%rsp),%rcx
108e   248f60:	80 e1 04             	and    $0x4,%cl
1091   248f63:	80 c9 03             	or     $0x3,%cl
1094   248f66:	38 c1                	cmp    %al,%cl
1096   248f68:	0f 8c b6 f6 ff ff    	jl     248624 <dequeue_task_fair+0x752>
109c   248f6e:	48 89 fb             	mov    %rdi,%rbx
109f   248f71:	48 8d 7c 24 6c       	lea    0x6c(%rsp),%rdi
10a4   248f76:	4d 89 c6             	mov    %r8,%r14
10a7   248f79:	e8 00 00 00 00       	call   248f7e <dequeue_task_fair+0x10ac>	248f7a: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
10ac   248f7e:	4d 89 f0             	mov    %r14,%r8
10af   248f81:	48 89 df             	mov    %rbx,%rdi
10b2   248f84:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
10bc   248f8e:	e9 91 f6 ff ff       	jmp    248624 <dequeue_task_fair+0x752>
10c1   248f93:	89 f9                	mov    %edi,%ecx
10c3   248f95:	80 e1 07             	and    $0x7,%cl
10c6   248f98:	80 c1 03             	add    $0x3,%cl
10c9   248f9b:	38 c1                	cmp    %al,%cl
10cb   248f9d:	0f 8c 91 f6 ff ff    	jl     248634 <dequeue_task_fair+0x762>
10d1   248fa3:	49 89 fe             	mov    %rdi,%r14
10d4   248fa6:	e8 00 00 00 00       	call   248fab <dequeue_task_fair+0x10d9>	248fa7: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
10d9   248fab:	4c 89 f7             	mov    %r14,%rdi
10dc   248fae:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
10e6   248fb8:	e9 77 f6 ff ff       	jmp    248634 <dequeue_task_fair+0x762>
10eb   248fbd:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	248fc0: R_X86_64_32S	nr_cpu_ids
10f2   248fc4:	80 e1 07             	and    $0x7,%cl
10f5   248fc7:	80 c1 03             	add    $0x3,%cl
10f8   248fca:	38 c1                	cmp    %al,%cl
10fa   248fcc:	0f 8c 86 f6 ff ff    	jl     248658 <dequeue_task_fair+0x786>
1100   248fd2:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	248fd5: R_X86_64_32S	nr_cpu_ids
1107   248fd9:	e8 00 00 00 00       	call   248fde <dequeue_task_fair+0x110c>	248fda: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
110c   248fde:	e9 75 f6 ff ff       	jmp    248658 <dequeue_task_fair+0x786>
1111   248fe3:	3c 03                	cmp    $0x3,%al
1113   248fe5:	0f 8f d7 f6 ff ff    	jg     2486c2 <dequeue_task_fair+0x7f0>
1119   248feb:	48 89 3c 24          	mov    %rdi,(%rsp)
111d   248fef:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
1122   248ff4:	48 89 f3             	mov    %rsi,%rbx
1125   248ff7:	49 89 cf             	mov    %rcx,%r15
1128   248ffa:	48 89 6c 24 10       	mov    %rbp,0x10(%rsp)
112d   248fff:	4c 89 c5             	mov    %r8,%rbp
1130   249002:	4d 89 cc             	mov    %r9,%r12
1133   249005:	4c 89 54 24 28       	mov    %r10,0x28(%rsp)
1138   24900a:	45 89 de             	mov    %r11d,%r14d
113b   24900d:	e8 00 00 00 00       	call   249012 <dequeue_task_fair+0x1140>	24900e: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1140   249012:	45 89 f3             	mov    %r14d,%r11d
1143   249015:	4c 8b 54 24 28       	mov    0x28(%rsp),%r10
1148   24901a:	4d 89 e1             	mov    %r12,%r9
114b   24901d:	49 89 e8             	mov    %rbp,%r8
114e   249020:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
1153   249025:	4c 89 f9             	mov    %r15,%rcx
1156   249028:	48 8b 3c 24          	mov    (%rsp),%rdi
115a   24902c:	48 89 de             	mov    %rbx,%rsi
115d   24902f:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1167   249039:	e9 84 f6 ff ff       	jmp    2486c2 <dequeue_task_fair+0x7f0>
116c   24903e:	48 89 cb             	mov    %rcx,%rbx
116f   249041:	48 8d 4c 24 6c       	lea    0x6c(%rsp),%rcx
1174   249046:	80 e1 04             	and    $0x4,%cl
1177   249049:	80 c9 03             	or     $0x3,%cl
117a   24904c:	38 c1                	cmp    %al,%cl
117c   24904e:	48 89 d9             	mov    %rbx,%rcx
117f   249051:	0f 8c 7c f6 ff ff    	jl     2486d3 <dequeue_task_fair+0x801>
1185   249057:	48 89 3c 24          	mov    %rdi,(%rsp)
1189   24905b:	48 8d 7c 24 6c       	lea    0x6c(%rsp),%rdi
118e   249060:	48 89 74 24 38       	mov    %rsi,0x38(%rsp)
1193   249065:	4d 89 c7             	mov    %r8,%r15
1196   249068:	4c 89 4c 24 30       	mov    %r9,0x30(%rsp)
119b   24906d:	4d 89 d6             	mov    %r10,%r14
119e   249070:	44 89 5c 24 08       	mov    %r11d,0x8(%rsp)
11a3   249075:	e8 00 00 00 00       	call   24907a <dequeue_task_fair+0x11a8>	249076: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
11a8   24907a:	44 8b 5c 24 08       	mov    0x8(%rsp),%r11d
11ad   24907f:	4d 89 f2             	mov    %r14,%r10
11b0   249082:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
11b5   249087:	4d 89 f8             	mov    %r15,%r8
11b8   24908a:	48 89 d9             	mov    %rbx,%rcx
11bb   24908d:	48 8b 3c 24          	mov    (%rsp),%rdi
11bf   249091:	48 8b 74 24 38       	mov    0x38(%rsp),%rsi
11c4   249096:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
11ce   2490a0:	e9 2e f6 ff ff       	jmp    2486d3 <dequeue_task_fair+0x801>
11d3   2490a5:	49 89 ce             	mov    %rcx,%r14
11d6   2490a8:	48 8d 4c 24 6c       	lea    0x6c(%rsp),%rcx
11db   2490ad:	80 e1 04             	and    $0x4,%cl
11de   2490b0:	80 c9 03             	or     $0x3,%cl
11e1   2490b3:	38 c1                	cmp    %al,%cl
11e3   2490b5:	4c 89 f1             	mov    %r14,%rcx
11e6   2490b8:	0f 8c 31 f5 ff ff    	jl     2485ef <dequeue_task_fair+0x71d>
11ec   2490be:	48 89 3c 24          	mov    %rdi,(%rsp)
11f0   2490c2:	48 8d 7c 24 6c       	lea    0x6c(%rsp),%rdi
11f5   2490c7:	4d 89 c7             	mov    %r8,%r15
11f8   2490ca:	4c 89 cd             	mov    %r9,%rbp
11fb   2490cd:	4c 89 d3             	mov    %r10,%rbx
11fe   2490d0:	e8 00 00 00 00       	call   2490d5 <dequeue_task_fair+0x1203>	2490d1: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
1203   2490d5:	49 89 da             	mov    %rbx,%r10
1206   2490d8:	49 89 e9             	mov    %rbp,%r9
1209   2490db:	4d 89 f8             	mov    %r15,%r8
120c   2490de:	4c 89 f1             	mov    %r14,%rcx
120f   2490e1:	48 8b 3c 24          	mov    (%rsp),%rdi
1213   2490e5:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
121d   2490ef:	e9 fb f4 ff ff       	jmp    2485ef <dequeue_task_fair+0x71d>
1222   2490f4:	49 89 cc             	mov    %rcx,%r12
1225   2490f7:	89 f1                	mov    %esi,%ecx
1227   2490f9:	80 e1 07             	and    $0x7,%cl
122a   2490fc:	80 c1 03             	add    $0x3,%cl
122d   2490ff:	38 c1                	cmp    %al,%cl
122f   249101:	4c 89 e1             	mov    %r12,%rcx
1232   249104:	0f 8c 5d f6 ff ff    	jl     248767 <dequeue_task_fair+0x895>
1238   24910a:	49 89 fe             	mov    %rdi,%r14
123b   24910d:	48 89 f7             	mov    %rsi,%rdi
123e   249110:	48 89 f3             	mov    %rsi,%rbx
1241   249113:	4d 89 c7             	mov    %r8,%r15
1244   249116:	4c 89 4c 24 30       	mov    %r9,0x30(%rsp)
1249   24911b:	4c 89 d5             	mov    %r10,%rbp
124c   24911e:	e8 00 00 00 00       	call   249123 <dequeue_task_fair+0x1251>	24911f: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1251   249123:	49 89 ea             	mov    %rbp,%r10
1254   249126:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
1259   24912b:	4d 89 f8             	mov    %r15,%r8
125c   24912e:	4c 89 e1             	mov    %r12,%rcx
125f   249131:	4c 89 f7             	mov    %r14,%rdi
1262   249134:	48 89 de             	mov    %rbx,%rsi
1265   249137:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
126f   249141:	e9 21 f6 ff ff       	jmp    248767 <dequeue_task_fair+0x895>
1274   249146:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	249149: R_X86_64_32S	.data+0xe3aa0
127b   24914d:	48 89 de             	mov    %rbx,%rsi
127e   249150:	e8 00 00 00 00       	call   249155 <dequeue_task_fair+0x1283>	249151: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
1283   249155:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
128d   24915f:	e9 44 ef ff ff       	jmp    2480a8 <dequeue_task_fair+0x1d6>
1292   249164:	48 8d 4c 24 6c       	lea    0x6c(%rsp),%rcx
1297   249169:	80 e1 04             	and    $0x4,%cl
129a   24916c:	80 c9 03             	or     $0x3,%cl
129d   24916f:	38 c1                	cmp    %al,%cl
129f   249171:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
12a4   249176:	0f 8c b7 f6 ff ff    	jl     248833 <dequeue_task_fair+0x961>
12aa   24917c:	48 8d 7c 24 6c       	lea    0x6c(%rsp),%rdi
12af   249181:	4c 89 c3             	mov    %r8,%rbx
12b2   249184:	4d 89 d6             	mov    %r10,%r14
12b5   249187:	e8 00 00 00 00       	call   24918c <dequeue_task_fair+0x12ba>	249188: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
12ba   24918c:	4d 89 f2             	mov    %r14,%r10
12bd   24918f:	4d 89 f9             	mov    %r15,%r9
12c0   249192:	49 89 d8             	mov    %rbx,%r8
12c3   249195:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
12c8   24919a:	4c 89 e7             	mov    %r12,%rdi
12cb   24919d:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
12d5   2491a7:	e9 87 f6 ff ff       	jmp    248833 <dequeue_task_fair+0x961>
12da   2491ac:	49 89 fe             	mov    %rdi,%r14
12dd   2491af:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2491b2: R_X86_64_32S	.data+0xe3c50
12e4   2491b6:	48 89 de             	mov    %rbx,%rsi
12e7   2491b9:	4d 89 c7             	mov    %r8,%r15
12ea   2491bc:	4d 89 cc             	mov    %r9,%r12
12ed   2491bf:	4c 89 d5             	mov    %r10,%rbp
12f0   2491c2:	e8 00 00 00 00       	call   2491c7 <dequeue_task_fair+0x12f5>	2491c3: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
12f5   2491c7:	49 89 ea             	mov    %rbp,%r10
12f8   2491ca:	4d 89 e1             	mov    %r12,%r9
12fb   2491cd:	4d 89 f8             	mov    %r15,%r8
12fe   2491d0:	4c 89 f7             	mov    %r14,%rdi
1301   2491d3:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
130b   2491dd:	e9 99 f5 ff ff       	jmp    24877b <dequeue_task_fair+0x8a9>
1310   2491e2:	48 89 fb             	mov    %rdi,%rbx
1313   2491e5:	be ff ff ff ff       	mov    $0xffffffff,%esi
1318   2491ea:	e8 00 00 00 00       	call   2491ef <dequeue_task_fair+0x131d>	2491eb: R_X86_64_PLT32	call_trace_sched_update_nr_running-0x4
131d   2491ef:	48 89 df             	mov    %rbx,%rdi
1320   2491f2:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
132a   2491fc:	e9 53 f2 ff ff       	jmp    248454 <dequeue_task_fair+0x582>
132f   249201:	48 89 6c 24 10       	mov    %rbp,0x10(%rsp)
1334   249206:	48 89 74 24 38       	mov    %rsi,0x38(%rsp)
1339   24920b:	4d 89 fc             	mov    %r15,%r12
133c   24920e:	49 89 fe             	mov    %rdi,%r14
133f   249211:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	249214: R_X86_64_32S	tick_nohz_full_running
1346   249218:	48 c1 e8 03          	shr    $0x3,%rax
134a   24921c:	8a 04 10             	mov    (%rax,%rdx,1),%al
134d   24921f:	84 c0                	test   %al,%al
134f   249221:	0f 85 ad 04 00 00    	jne    2496d4 <dequeue_task_fair+0x1802>
1355   249227:	0f b6 1d 00 00 00 00 	movzbl 0x0(%rip),%ebx        # 24922e <dequeue_task_fair+0x135c>	24922a: R_X86_64_PC32	tick_nohz_full_running-0x4
135c   24922e:	48 83 fb 02          	cmp    $0x2,%rbx
1360   249232:	0f 83 91 05 00 00    	jae    2497c9 <dequeue_task_fair+0x18f7>
1366   249238:	f6 c3 01             	test   $0x1,%bl
1369   24923b:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1373   249245:	4c 89 f7             	mov    %r14,%rdi
1376   249248:	4d 89 e7             	mov    %r12,%r15
1379   24924b:	48 8b 74 24 38       	mov    0x38(%rsp),%rsi
137e   249250:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
1383   249255:	0f 84 1b f2 ff ff    	je     248476 <dequeue_task_fair+0x5a4>
1389   24925b:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	24925e: R_X86_64_32S	tick_nohz_full_mask
1390   249262:	48 c1 e8 03          	shr    $0x3,%rax
1394   249266:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
1398   24926a:	74 0c                	je     249278 <dequeue_task_fair+0x13a6>
139a   24926c:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	24926f: R_X86_64_32S	tick_nohz_full_mask
13a1   249273:	e8 00 00 00 00       	call   249278 <dequeue_task_fair+0x13a6>	249274: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
13a6   249278:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 24927f <dequeue_task_fair+0x13ad>	24927b: R_X86_64_PC32	tick_nohz_full_mask-0x4
13ad   24927f:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	249282: R_X86_64_32S	nr_cpu_ids
13b4   249286:	48 c1 e8 03          	shr    $0x3,%rax
13b8   24928a:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
13c2   249294:	8a 04 08             	mov    (%rax,%rcx,1),%al
13c5   249297:	84 c0                	test   %al,%al
13c7   249299:	0f 85 58 04 00 00    	jne    2496f7 <dequeue_task_fair+0x1825>
13cd   24929f:	44 39 2d 00 00 00 00 	cmp    %r13d,0x0(%rip)        # 2492a6 <dequeue_task_fair+0x13d4>	2492a2: R_X86_64_PC32	nr_cpu_ids-0x4
13d4   2492a6:	0f 86 d8 03 00 00    	jbe    249684 <dequeue_task_fair+0x17b2>
13da   2492ac:	4c 89 e8             	mov    %r13,%rax
13dd   2492af:	48 c1 e8 06          	shr    $0x6,%rax
13e1   2492b3:	48 8d 3c c3          	lea    (%rbx,%rax,8),%rdi
13e5   2492b7:	be 08 00 00 00       	mov    $0x8,%esi
13ea   2492bc:	e8 00 00 00 00       	call   2492c1 <dequeue_task_fair+0x13ef>	2492bd: R_X86_64_PLT32	__kasan_check_read-0x4
13ef   2492c1:	4c 0f a3 2b          	bt     %r13,(%rbx)
13f3   2492c5:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
13fd   2492cf:	4c 89 f7             	mov    %r14,%rdi
1400   2492d2:	4d 89 e7             	mov    %r12,%r15
1403   2492d5:	48 8b 74 24 38       	mov    0x38(%rsp),%rsi
1408   2492da:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
140d   2492df:	0f 83 91 f1 ff ff    	jae    248476 <dequeue_task_fair+0x5a4>
1413   2492e5:	e8 00 00 00 00       	call   2492ea <dequeue_task_fair+0x1418>	2492e6: R_X86_64_PLT32	sched_can_stop_tick-0x4
1418   2492ea:	44 89 ef             	mov    %r13d,%edi
141b   2492ed:	be 02 00 00 00       	mov    $0x2,%esi
1420   2492f2:	84 c0                	test   %al,%al
1422   2492f4:	0f 84 66 03 00 00    	je     249660 <dequeue_task_fair+0x178e>
1428   2492fa:	e8 00 00 00 00       	call   2492ff <dequeue_task_fair+0x142d>	2492fb: R_X86_64_PLT32	tick_nohz_dep_clear_cpu-0x4
142d   2492ff:	e9 61 03 00 00       	jmp    249665 <dequeue_task_fair+0x1793>
1432   249304:	e8 00 00 00 00       	call   249309 <dequeue_task_fair+0x1437>	249305: R_X86_64_PLT32	__stack_chk_fail-0x4
1437   249309:	48 81 c3 00 01 00 00 	add    $0x100,%rbx
143e   249310:	48 89 d8             	mov    %rbx,%rax
1441   249313:	48 c1 e8 03          	shr    $0x3,%rax
1445   249317:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
144f   249321:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
1453   249325:	74 08                	je     24932f <dequeue_task_fair+0x145d>
1455   249327:	48 89 df             	mov    %rbx,%rdi
1458   24932a:	e8 00 00 00 00       	call   24932f <dequeue_task_fair+0x145d>	24932b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
145d   24932f:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
1462   249334:	48 39 03             	cmp    %rax,(%rbx)
1465   249337:	74 0f                	je     249348 <dequeue_task_fair+0x1476>
1467   249339:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
146c   24933e:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
1471   249343:	e8 c2 a0 00 00       	call   25340a <update_stats_wait_end>
1476   249348:	f6 44 24 18 01       	testb  $0x1,0x18(%rsp)
147b   24934d:	4c 8b 74 24 40       	mov    0x40(%rsp),%r14
1480   249352:	48 8b 1c 24          	mov    (%rsp),%rbx
1484   249356:	48 8b 6c 24 48       	mov    0x48(%rsp),%rbp
1489   24935b:	0f 84 9b ed ff ff    	je     2480fc <dequeue_task_fair+0x22a>
148f   249361:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
1494   249366:	48 8d 68 10          	lea    0x10(%rax),%rbp
1498   24936a:	49 89 ef             	mov    %rbp,%r15
149b   24936d:	49 c1 ef 03          	shr    $0x3,%r15
149f   249371:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
14a9   24937b:	41 80 3c 07 00       	cmpb   $0x0,(%r15,%rax,1)
14ae   249380:	74 08                	je     24938a <dequeue_task_fair+0x14b8>
14b0   249382:	48 89 ef             	mov    %rbp,%rdi
14b3   249385:	e8 00 00 00 00       	call   24938a <dequeue_task_fair+0x14b8>	249386: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
14b8   24938a:	48 f7 45 00 01 00 00 00 	testq  $0x1,0x0(%rbp)
14c0   249392:	0f 84 d7 00 00 00    	je     24946f <dequeue_task_fair+0x159d>
14c6   249398:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	24939b: R_X86_64_32S	debug_locks
14cd   24939f:	48 c1 e8 03          	shr    $0x3,%rax
14d1   2493a3:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
14db   2493ad:	8a 04 08             	mov    (%rax,%rcx,1),%al
14de   2493b0:	84 c0                	test   %al,%al
14e0   2493b2:	0f 85 8b 03 00 00    	jne    249743 <dequeue_task_fair+0x1871>
14e6   2493b8:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0(%rip)        # 2493bf <dequeue_task_fair+0x14ed>	2493ba: R_X86_64_PC32	debug_locks-0x5
14ed   2493bf:	74 1a                	je     2493db <dequeue_task_fair+0x1509>
14ef   2493c1:	48 8b 04 24          	mov    (%rsp),%rax
14f3   2493c5:	48 8d 78 18          	lea    0x18(%rax),%rdi
14f7   2493c9:	be ff ff ff ff       	mov    $0xffffffff,%esi
14fc   2493ce:	e8 00 00 00 00       	call   2493d3 <dequeue_task_fair+0x1501>	2493cf: R_X86_64_PLT32	lock_is_held_type-0x4
1501   2493d3:	85 c0                	test   %eax,%eax
1503   2493d5:	0f 84 b7 02 00 00    	je     249692 <dequeue_task_fair+0x17c0>
1509   2493db:	48 8b 04 24          	mov    (%rsp),%rax
150d   2493df:	48 8d 98 78 09 00 00 	lea    0x978(%rax),%rbx
1514   2493e6:	48 89 d8             	mov    %rbx,%rax
1517   2493e9:	48 c1 e8 03          	shr    $0x3,%rax
151b   2493ed:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
1525   2493f7:	8a 04 08             	mov    (%rax,%rcx,1),%al
1528   2493fa:	84 c0                	test   %al,%al
152a   2493fc:	0f 85 67 03 00 00    	jne    249769 <dequeue_task_fair+0x1897>
1530   249402:	83 3b 01             	cmpl   $0x1,(%rbx)
1533   249405:	77 0d                	ja     249414 <dequeue_task_fair+0x1542>
1535   249407:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 24940e <dequeue_task_fair+0x153c>	249409: R_X86_64_PC32	.data.once+0x6c
153c   24940e:	0f 84 8c 02 00 00    	je     2496a0 <dequeue_task_fair+0x17ce>
1542   249414:	48 8b 04 24          	mov    (%rsp),%rax
1546   249418:	48 8d 98 80 09 00 00 	lea    0x980(%rax),%rbx
154d   24941f:	48 89 d8             	mov    %rbx,%rax
1550   249422:	48 c1 e8 03          	shr    $0x3,%rax
1554   249426:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
155e   249430:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
1562   249434:	74 08                	je     24943e <dequeue_task_fair+0x156c>
1564   249436:	48 89 df             	mov    %rbx,%rdi
1567   249439:	e8 00 00 00 00       	call   24943e <dequeue_task_fair+0x156c>	24943a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
156c   24943e:	4c 8b 33             	mov    (%rbx),%r14
156f   249441:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
1574   249446:	48 8d 98 18 01 00 00 	lea    0x118(%rax),%rbx
157b   24944d:	48 89 d8             	mov    %rbx,%rax
157e   249450:	48 c1 e8 03          	shr    $0x3,%rax
1582   249454:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
158c   24945e:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
1590   249462:	74 08                	je     24946c <dequeue_task_fair+0x159a>
1592   249464:	48 89 df             	mov    %rbx,%rdi
1595   249467:	e8 00 00 00 00       	call   24946c <dequeue_task_fair+0x159a>	249468: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
159a   24946c:	4c 89 33             	mov    %r14,(%rbx)
159d   24946f:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
15a7   249479:	41 80 3c 07 00       	cmpb   $0x0,(%r15,%rax,1)
15ac   24947e:	74 08                	je     249488 <dequeue_task_fair+0x15b6>
15ae   249480:	48 89 ef             	mov    %rbp,%rdi
15b1   249483:	e8 00 00 00 00       	call   249488 <dequeue_task_fair+0x15b6>	249484: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
15b6   249488:	48 f7 45 00 02 00 00 00 	testq  $0x2,0x0(%rbp)
15be   249490:	4c 8b 74 24 40       	mov    0x40(%rsp),%r14
15c3   249495:	48 8b 1c 24          	mov    (%rsp),%rbx
15c7   249499:	48 8b 6c 24 48       	mov    0x48(%rsp),%rbp
15cc   24949e:	0f 84 58 ec ff ff    	je     2480fc <dequeue_task_fair+0x22a>
15d2   2494a4:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	2494a7: R_X86_64_32S	debug_locks
15d9   2494ab:	48 c1 e8 03          	shr    $0x3,%rax
15dd   2494af:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
15e7   2494b9:	8a 04 08             	mov    (%rax,%rcx,1),%al
15ea   2494bc:	84 c0                	test   %al,%al
15ec   2494be:	0f 85 c2 02 00 00    	jne    249786 <dequeue_task_fair+0x18b4>
15f2   2494c4:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0(%rip)        # 2494cb <dequeue_task_fair+0x15f9>	2494c6: R_X86_64_PC32	debug_locks-0x5
15f9   2494cb:	74 1a                	je     2494e7 <dequeue_task_fair+0x1615>
15fb   2494cd:	48 8b 04 24          	mov    (%rsp),%rax
15ff   2494d1:	48 8d 78 18          	lea    0x18(%rax),%rdi
1603   2494d5:	be ff ff ff ff       	mov    $0xffffffff,%esi
1608   2494da:	e8 00 00 00 00       	call   2494df <dequeue_task_fair+0x160d>	2494db: R_X86_64_PLT32	lock_is_held_type-0x4
160d   2494df:	85 c0                	test   %eax,%eax
160f   2494e1:	0f 84 b2 01 00 00    	je     249699 <dequeue_task_fair+0x17c7>
1615   2494e7:	48 8b 04 24          	mov    (%rsp),%rax
1619   2494eb:	48 8d 98 78 09 00 00 	lea    0x978(%rax),%rbx
1620   2494f2:	48 89 d8             	mov    %rbx,%rax
1623   2494f5:	48 c1 e8 03          	shr    $0x3,%rax
1627   2494f9:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
1631   249503:	8a 04 08             	mov    (%rax,%rcx,1),%al
1634   249506:	84 c0                	test   %al,%al
1636   249508:	0f 85 9e 02 00 00    	jne    2497ac <dequeue_task_fair+0x18da>
163c   24950e:	83 3b 01             	cmpl   $0x1,(%rbx)
163f   249511:	77 0d                	ja     249520 <dequeue_task_fair+0x164e>
1641   249513:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 24951a <dequeue_task_fair+0x1648>	249515: R_X86_64_PC32	.data.once+0x6c
1648   24951a:	0f 84 9a 01 00 00    	je     2496ba <dequeue_task_fair+0x17e8>
164e   249520:	48 8b 04 24          	mov    (%rsp),%rax
1652   249524:	48 8d 98 80 09 00 00 	lea    0x980(%rax),%rbx
1659   24952b:	48 89 d8             	mov    %rbx,%rax
165c   24952e:	48 c1 e8 03          	shr    $0x3,%rax
1660   249532:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
166a   24953c:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
166e   249540:	74 08                	je     24954a <dequeue_task_fair+0x1678>
1670   249542:	48 89 df             	mov    %rbx,%rdi
1673   249545:	e8 00 00 00 00       	call   24954a <dequeue_task_fair+0x1678>	249546: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1678   24954a:	4c 8b 33             	mov    (%rbx),%r14
167b   24954d:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
1680   249552:	48 8d 98 30 01 00 00 	lea    0x130(%rax),%rbx
1687   249559:	48 89 d8             	mov    %rbx,%rax
168a   24955c:	48 c1 e8 03          	shr    $0x3,%rax
168e   249560:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
1698   24956a:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
169c   24956e:	74 08                	je     249578 <dequeue_task_fair+0x16a6>
169e   249570:	48 89 df             	mov    %rbx,%rdi
16a1   249573:	e8 00 00 00 00       	call   249578 <dequeue_task_fair+0x16a6>	249574: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
16a6   249578:	4c 89 33             	mov    %r14,(%rbx)
16a9   24957b:	4c 8b 74 24 40       	mov    0x40(%rsp),%r14
16ae   249580:	48 8b 1c 24          	mov    (%rsp),%rbx
16b2   249584:	48 8b 6c 24 48       	mov    0x48(%rsp),%rbp
16b7   249589:	e9 6e eb ff ff       	jmp    2480fc <dequeue_task_fair+0x22a>
16bc   24958e:	65 8b 1d 00 00 00 00 	mov    %gs:0x0(%rip),%ebx        # 249595 <dequeue_task_fair+0x16c3>	249591: R_X86_64_PC32	cpu_number-0x4
16c3   249595:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	249598: R_X86_64_32S	nr_cpu_ids
16ca   24959c:	48 c1 e8 03          	shr    $0x3,%rax
16ce   2495a0:	8a 04 10             	mov    (%rax,%rdx,1),%al
16d1   2495a3:	84 c0                	test   %al,%al
16d3   2495a5:	0f 85 72 01 00 00    	jne    24971d <dequeue_task_fair+0x184b>
16d9   2495ab:	39 1d 00 00 00 00    	cmp    %ebx,0x0(%rip)        # 2495b1 <dequeue_task_fair+0x16df>	2495ad: R_X86_64_PC32	nr_cpu_ids-0x4
16df   2495b1:	0f 86 d4 00 00 00    	jbe    24968b <dequeue_task_fair+0x17b9>
16e5   2495b7:	89 db                	mov    %ebx,%ebx
16e7   2495b9:	48 89 d8             	mov    %rbx,%rax
16ea   2495bc:	48 c1 e8 06          	shr    $0x6,%rax
16ee   2495c0:	48 8d 3c c5 00 00 00 00 	lea    0x0(,%rax,8),%rdi	2495c4: R_X86_64_32S	__cpu_online_mask
16f6   2495c8:	be 08 00 00 00       	mov    $0x8,%esi
16fb   2495cd:	e8 00 00 00 00       	call   2495d2 <dequeue_task_fair+0x1700>	2495ce: R_X86_64_PLT32	__kasan_check_read-0x4
1700   2495d2:	48 0f a3 1d 00 00 00 00 	bt     %rbx,0x0(%rip)        # 2495da <dequeue_task_fair+0x1708>	2495d6: R_X86_64_PC32	__cpu_online_mask-0x4
1708   2495da:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
1712   2495e4:	0f 83 11 f2 ff ff    	jae    2487fb <dequeue_task_fair+0x929>
1718   2495ea:	65 ff 05 00 00 00 00 	incl   %gs:0x0(%rip)        # 2495f1 <dequeue_task_fair+0x171f>	2495ed: R_X86_64_PC32	__preempt_count-0x4
171f   2495f1:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	2495f4: R_X86_64_32S	__tracepoint_sched_util_est_se_tp+0x40
1726   2495f8:	48 c1 e8 03          	shr    $0x3,%rax
172a   2495fc:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
172e   249600:	74 0c                	je     24960e <dequeue_task_fair+0x173c>
1730   249602:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	249605: R_X86_64_32S	__tracepoint_sched_util_est_se_tp+0x40
1737   249609:	e8 00 00 00 00       	call   24960e <dequeue_task_fair+0x173c>	24960a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
173c   24960e:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 249615 <dequeue_task_fair+0x1743>	249611: R_X86_64_PC32	__tracepoint_sched_util_est_se_tp+0x3c
1743   249615:	48 85 db             	test   %rbx,%rbx
1746   249618:	74 30                	je     24964a <dequeue_task_fair+0x1778>
1748   24961a:	48 83 c3 08          	add    $0x8,%rbx
174c   24961e:	48 89 d8             	mov    %rbx,%rax
174f   249621:	48 c1 e8 03          	shr    $0x3,%rax
1753   249625:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
175d   24962f:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
1761   249633:	74 08                	je     24963d <dequeue_task_fair+0x176b>
1763   249635:	48 89 df             	mov    %rbx,%rdi
1766   249638:	e8 00 00 00 00       	call   24963d <dequeue_task_fair+0x176b>	249639: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
176b   24963d:	48 8b 3b             	mov    (%rbx),%rdi
176e   249640:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
1773   249645:	e8 00 00 00 00       	call   24964a <dequeue_task_fair+0x1778>	249646: R_X86_64_PLT32	__SCT__tp_func_sched_util_est_se_tp-0x4
1778   24964a:	65 ff 0d 00 00 00 00 	decl   %gs:0x0(%rip)        # 249651 <dequeue_task_fair+0x177f>	24964d: R_X86_64_PC32	__preempt_count-0x4
177f   249651:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1789   24965b:	e9 db ef ff ff       	jmp    24863b <dequeue_task_fair+0x769>
178e   249660:	e8 00 00 00 00       	call   249665 <dequeue_task_fair+0x1793>	249661: R_X86_64_PLT32	tick_nohz_dep_set_cpu-0x4
1793   249665:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
179d   24966f:	4c 89 f7             	mov    %r14,%rdi
17a0   249672:	4d 89 e7             	mov    %r12,%r15
17a3   249675:	48 8b 74 24 38       	mov    0x38(%rsp),%rsi
17a8   24967a:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
17ad   24967f:	e9 f2 ed ff ff       	jmp    248476 <dequeue_task_fair+0x5a4>
17b2   249684:	0f 0b                	ud2
17b4   249686:	e9 21 fc ff ff       	jmp    2492ac <dequeue_task_fair+0x13da>
17b9   24968b:	0f 0b                	ud2
17bb   24968d:	e9 25 ff ff ff       	jmp    2495b7 <dequeue_task_fair+0x16e5>
17c0   249692:	0f 0b                	ud2
17c2   249694:	e9 42 fd ff ff       	jmp    2493db <dequeue_task_fair+0x1509>
17c7   249699:	0f 0b                	ud2
17c9   24969b:	e9 47 fe ff ff       	jmp    2494e7 <dequeue_task_fair+0x1615>
17ce   2496a0:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 2496a7 <dequeue_task_fair+0x17d5>	2496a2: R_X86_64_PC32	.data.once+0x6c
17d5   2496a7:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2496aa: R_X86_64_32S	.rodata+0x76ce0
17dc   2496ae:	e8 00 00 00 00       	call   2496b3 <dequeue_task_fair+0x17e1>	2496af: R_X86_64_PLT32	__warn_printk-0x4
17e1   2496b3:	0f 0b                	ud2
17e3   2496b5:	e9 5a fd ff ff       	jmp    249414 <dequeue_task_fair+0x1542>
17e8   2496ba:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 2496c1 <dequeue_task_fair+0x17ef>	2496bc: R_X86_64_PC32	.data.once+0x6c
17ef   2496c1:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2496c4: R_X86_64_32S	.rodata+0x76ce0
17f6   2496c8:	e8 00 00 00 00       	call   2496cd <dequeue_task_fair+0x17fb>	2496c9: R_X86_64_PLT32	__warn_printk-0x4
17fb   2496cd:	0f 0b                	ud2
17fd   2496cf:	e9 4c fe ff ff       	jmp    249520 <dequeue_task_fair+0x164e>
1802   2496d4:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	2496d7: R_X86_64_32S	tick_nohz_full_running
1809   2496db:	80 e1 07             	and    $0x7,%cl
180c   2496de:	38 c1                	cmp    %al,%cl
180e   2496e0:	0f 8c 41 fb ff ff    	jl     249227 <dequeue_task_fair+0x1355>
1814   2496e6:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2496e9: R_X86_64_32S	tick_nohz_full_running
181b   2496ed:	e8 00 00 00 00       	call   2496f2 <dequeue_task_fair+0x1820>	2496ee: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
1820   2496f2:	e9 30 fb ff ff       	jmp    249227 <dequeue_task_fair+0x1355>
1825   2496f7:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	2496fa: R_X86_64_32S	nr_cpu_ids
182c   2496fe:	80 e1 07             	and    $0x7,%cl
182f   249701:	80 c1 03             	add    $0x3,%cl
1832   249704:	38 c1                	cmp    %al,%cl
1834   249706:	0f 8c 93 fb ff ff    	jl     24929f <dequeue_task_fair+0x13cd>
183a   24970c:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	24970f: R_X86_64_32S	nr_cpu_ids
1841   249713:	e8 00 00 00 00       	call   249718 <dequeue_task_fair+0x1846>	249714: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1846   249718:	e9 82 fb ff ff       	jmp    24929f <dequeue_task_fair+0x13cd>
184b   24971d:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	249720: R_X86_64_32S	nr_cpu_ids
1852   249724:	80 e1 07             	and    $0x7,%cl
1855   249727:	80 c1 03             	add    $0x3,%cl
1858   24972a:	38 c1                	cmp    %al,%cl
185a   24972c:	0f 8c 79 fe ff ff    	jl     2495ab <dequeue_task_fair+0x16d9>
1860   249732:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	249735: R_X86_64_32S	nr_cpu_ids
1867   249739:	e8 00 00 00 00       	call   24973e <dequeue_task_fair+0x186c>	24973a: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
186c   24973e:	e9 68 fe ff ff       	jmp    2495ab <dequeue_task_fair+0x16d9>
1871   249743:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	249746: R_X86_64_32S	debug_locks
1878   24974a:	80 e1 07             	and    $0x7,%cl
187b   24974d:	80 c1 03             	add    $0x3,%cl
187e   249750:	38 c1                	cmp    %al,%cl
1880   249752:	0f 8c 60 fc ff ff    	jl     2493b8 <dequeue_task_fair+0x14e6>
1886   249758:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	24975b: R_X86_64_32S	debug_locks
188d   24975f:	e8 00 00 00 00       	call   249764 <dequeue_task_fair+0x1892>	249760: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1892   249764:	e9 4f fc ff ff       	jmp    2493b8 <dequeue_task_fair+0x14e6>
1897   249769:	89 d9                	mov    %ebx,%ecx
1899   24976b:	80 e1 07             	and    $0x7,%cl
189c   24976e:	80 c1 03             	add    $0x3,%cl
189f   249771:	38 c1                	cmp    %al,%cl
18a1   249773:	0f 8c 89 fc ff ff    	jl     249402 <dequeue_task_fair+0x1530>
18a7   249779:	48 89 df             	mov    %rbx,%rdi
18aa   24977c:	e8 00 00 00 00       	call   249781 <dequeue_task_fair+0x18af>	24977d: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
18af   249781:	e9 7c fc ff ff       	jmp    249402 <dequeue_task_fair+0x1530>
18b4   249786:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	249789: R_X86_64_32S	debug_locks
18bb   24978d:	80 e1 07             	and    $0x7,%cl
18be   249790:	80 c1 03             	add    $0x3,%cl
18c1   249793:	38 c1                	cmp    %al,%cl
18c3   249795:	0f 8c 29 fd ff ff    	jl     2494c4 <dequeue_task_fair+0x15f2>
18c9   24979b:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	24979e: R_X86_64_32S	debug_locks
18d0   2497a2:	e8 00 00 00 00       	call   2497a7 <dequeue_task_fair+0x18d5>	2497a3: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
18d5   2497a7:	e9 18 fd ff ff       	jmp    2494c4 <dequeue_task_fair+0x15f2>
18da   2497ac:	89 d9                	mov    %ebx,%ecx
18dc   2497ae:	80 e1 07             	and    $0x7,%cl
18df   2497b1:	80 c1 03             	add    $0x3,%cl
18e2   2497b4:	38 c1                	cmp    %al,%cl
18e4   2497b6:	0f 8c 52 fd ff ff    	jl     24950e <dequeue_task_fair+0x163c>
18ea   2497bc:	48 89 df             	mov    %rbx,%rdi
18ed   2497bf:	e8 00 00 00 00       	call   2497c4 <dequeue_task_fair+0x18f2>	2497c0: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
18f2   2497c4:	e9 45 fd ff ff       	jmp    24950e <dequeue_task_fair+0x163c>
18f7   2497c9:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2497cc: R_X86_64_32S	.data+0xe4290
18fe   2497d0:	48 89 de             	mov    %rbx,%rsi
1901   2497d3:	e8 00 00 00 00       	call   2497d8 <dequeue_task_fair+0x1906>	2497d4: R_X86_64_PLT32	__ubsan_handle_load_invalid_value-0x4
1906   2497d8:	e9 5b fa ff ff       	jmp    249238 <dequeue_task_fair+0x1366>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
