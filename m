Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FB915AE1;
	Thu, 15 Jun 2023 16:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686845596; x=1718381596;
  h=date:from:cc:subject:message-id:mime-version;
  bh=TxgZjeYcAoi+wUaIAEyA5ptYxhVn9Eh20zIuX7NkCyg=;
  b=gyOVn2HggltNerVv4t/DCfG2ZjiaVJbySeEFddJ6NsqgVeTFmW0VfCyz
   L3INBau2d5Jfor5ObEqsCZRB8xRq1WdQ7zGkzj9Msp20z8E5PMdpnd/mz
   AHHryMi0wzVrdoqF8EBcQDDnvH1TBjxclX3U1obB/KqpcAxK6gxHB0TvQ
   bxPlayU2M8yYNlfv9o+S/Q8g8A5sGXGyTYftL0aqbv3YBgwdeYWucpFKE
   LiHGTHrsu2EVOj2qeB5lKWANESV+R1TdpatxlKQ41371Spg2Uk/YnxlDU
   0t93h81uyt/LE/Ww2+CBC1tWc+RYnLsC+KQyNBgvPk08tEU7og0BmNOD1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="343690872"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; 
   d="scan'208";a="343690872"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 09:10:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="662849753"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; 
   d="scan'208";a="662849753"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 15 Jun 2023 09:10:39 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9pYU-000098-1I;
	Thu, 15 Jun 2023 16:10:38 +0000
Date: Fri, 16 Jun 2023 00:10:02 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [stable:linux-5.4.y 7936/8786] arch/x86/kernel/apic/vector.o:
 warning: objtool: x86_vector_activate()+0x5dd: unreachable instruction
Message-ID: <202306160008.b4nijKqT-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.4.y
head:   61a2f83e4762ee0c766f86944e612305f5888bcb
commit: 6fe55dce9dd61c0d7a8424dc2706784183c8c91c [7936/8786] tracing: Make tracepoint lockdep check actually test something
config: x86_64-randconfig-a014-20230615 (https://download.01.org/0day-ci/archive/20230616/202306160008.b4nijKqT-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=6fe55dce9dd61c0d7a8424dc2706784183c8c91c
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.4.y
        git checkout 6fe55dce9dd61c0d7a8424dc2706784183c8c91c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306160008.b4nijKqT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/apic/vector.o: warning: objtool: x86_vector_activate()+0x5dd: unreachable instruction


objdump-func vmlinux.o x86_vector_activate:
0000 00000000000b0290 <x86_vector_activate>:
0000    b0290:	55                   	push   %rbp
0001    b0291:	41 57                	push   %r15
0003    b0293:	41 56                	push   %r14
0005    b0295:	41 55                	push   %r13
0007    b0297:	41 54                	push   %r12
0009    b0299:	53                   	push   %rbx
000a    b029a:	48 83 ec 48          	sub    $0x48,%rsp
000e    b029e:	48 89 f7             	mov    %rsi,%rdi
0011    b02a1:	41 89 d6             	mov    %edx,%r14d
0014    b02a4:	49 89 f5             	mov    %rsi,%r13
0017    b02a7:	49 bf 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r15
0021    b02b1:	e8 ca f2 ff ff       	call   af580 <apic_chip_data>
0026    b02b6:	49 8d 5d 04          	lea    0x4(%r13),%rbx
002a    b02ba:	48 89 c5             	mov    %rax,%rbp
002d    b02bd:	48 89 d8             	mov    %rbx,%rax
0030    b02c0:	48 c1 e8 03          	shr    $0x3,%rax
0034    b02c4:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
0039    b02c9:	42 0f b6 04 38       	movzbl (%rax,%r15,1),%eax
003e    b02ce:	84 c0                	test   %al,%al
0040    b02d0:	0f 85 14 06 00 00    	jne    b08ea <x86_vector_activate+0x65a>
0046    b02d6:	8b 03                	mov    (%rbx),%eax
0048    b02d8:	48 83 c5 30          	add    $0x30,%rbp
004c    b02dc:	48 89 5c 24 08       	mov    %rbx,0x8(%rsp)
0051    b02e1:	89 44 24 10          	mov    %eax,0x10(%rsp)
0055    b02e5:	48 89 e8             	mov    %rbp,%rax
0058    b02e8:	48 c1 e8 03          	shr    $0x3,%rax
005c    b02ec:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
0061    b02f1:	42 0f b6 04 38       	movzbl (%rax,%r15,1),%eax
0066    b02f6:	84 c0                	test   %al,%al
0068    b02f8:	0f 85 09 06 00 00    	jne    b0907 <x86_vector_activate+0x677>
006e    b02fe:	44 0f b6 65 00       	movzbl 0x0(%rbp),%r12d
0073    b0303:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	b0306: R_X86_64_32S	__tracepoint_vector_activate+0x8
007a    b030a:	be 04 00 00 00       	mov    $0x4,%esi
007f    b030f:	48 89 6c 24 30       	mov    %rbp,0x30(%rsp)
0084    b0314:	48 c7 c3 00 00 00 00 	mov    $0x0,%rbx	b0317: R_X86_64_32S	__tracepoint_vector_activate+0x8
008b    b031b:	e8 00 00 00 00       	call   b0320 <x86_vector_activate+0x90>	b031c: R_X86_64_PLT32	__kasan_check_read-0x4
0090    b0320:	48 c1 eb 03          	shr    $0x3,%rbx
0094    b0324:	42 0f b6 04 3b       	movzbl (%rbx,%r15,1),%eax
0099    b0329:	84 c0                	test   %al,%al
009b    b032b:	0f 85 f0 05 00 00    	jne    b0921 <x86_vector_activate+0x691>
00a1    b0331:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0(%rip)        # b0338 <x86_vector_activate+0xa8>	b0333: R_X86_64_PC32	__tracepoint_vector_activate+0x3
00a8    b0338:	0f 8e ea 00 00 00    	jle    b0428 <x86_vector_activate+0x198>
00ae    b033e:	44 89 74 24 24       	mov    %r14d,0x24(%rsp)
00b3    b0343:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
00b8    b0348:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	b034b: R_X86_64_32S	__tracepoint_vector_activate+0x20
00bf    b034f:	ff 05 00 00 00 00    	incl   0x0(%rip)        # b0355 <x86_vector_activate+0xc5>	b0351: R_X86_64_PC32	__preempt_count-0x4
00c5    b0355:	48 c1 e8 03          	shr    $0x3,%rax
00c9    b0359:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
00ce    b035e:	74 0c                	je     b036c <x86_vector_activate+0xdc>
00d0    b0360:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	b0363: R_X86_64_32S	__tracepoint_vector_activate+0x20
00d7    b0367:	e8 00 00 00 00       	call   b036c <x86_vector_activate+0xdc>	b0368: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
00dc    b036c:	4c 8b 35 00 00 00 00 	mov    0x0(%rip),%r14        # b0373 <x86_vector_activate+0xe3>	b036f: R_X86_64_PC32	__tracepoint_vector_activate+0x1c
00e3    b0373:	4d 85 f6             	test   %r14,%r14
00e6    b0376:	0f 84 96 00 00 00    	je     b0412 <x86_vector_activate+0x182>
00ec    b037c:	44 89 e0             	mov    %r12d,%eax
00ef    b037f:	0f b6 4c 24 24       	movzbl 0x24(%rsp),%ecx
00f4    b0384:	41 80 e4 02          	and    $0x2,%r12b
00f8    b0388:	4c 89 f3             	mov    %r14,%rbx
00fb    b038b:	24 04                	and    $0x4,%al
00fd    b038d:	41 d0 ec             	shr    %r12b
0100    b0390:	c0 e8 02             	shr    $0x2,%al
0103    b0393:	45 0f b6 e4          	movzbl %r12b,%r12d
0107    b0397:	44 0f b6 e8          	movzbl %al,%r13d
010b    b039b:	89 4c 24 18          	mov    %ecx,0x18(%rsp)
010f    b039f:	eb 0b                	jmp    b03ac <x86_vector_activate+0x11c>
0111    b03a1:	48 83 7b 18 00       	cmpq   $0x0,0x18(%rbx)
0116    b03a6:	48 8d 5b 18          	lea    0x18(%rbx),%rbx
011a    b03aa:	74 66                	je     b0412 <x86_vector_activate+0x182>
011c    b03ac:	4c 89 f0             	mov    %r14,%rax
011f    b03af:	4c 89 fd             	mov    %r15,%rbp
0122    b03b2:	48 c1 e8 03          	shr    $0x3,%rax
0126    b03b6:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
012b    b03bb:	74 08                	je     b03c5 <x86_vector_activate+0x135>
012d    b03bd:	4c 89 f7             	mov    %r14,%rdi
0130    b03c0:	e8 00 00 00 00       	call   b03c5 <x86_vector_activate+0x135>	b03c1: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0135    b03c5:	49 8d 7e 08          	lea    0x8(%r14),%rdi
0139    b03c9:	4c 8b 3b             	mov    (%rbx),%r15
013c    b03cc:	48 89 f8             	mov    %rdi,%rax
013f    b03cf:	48 c1 e8 03          	shr    $0x3,%rax
0143    b03d3:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
0147    b03d7:	74 05                	je     b03de <x86_vector_activate+0x14e>
0149    b03d9:	e8 00 00 00 00       	call   b03de <x86_vector_activate+0x14e>	b03da: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
014e    b03de:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
0152    b03e2:	8b 74 24 10          	mov    0x10(%rsp),%esi
0156    b03e6:	44 8b 44 24 18       	mov    0x18(%rsp),%r8d
015b    b03eb:	44 89 e2             	mov    %r12d,%edx
015e    b03ee:	44 89 e9             	mov    %r13d,%ecx
0161    b03f1:	41 ff d7             	call   *%r15
0164    b03f4:	49 83 c6 18          	add    $0x18,%r14
0168    b03f8:	49 89 ef             	mov    %rbp,%r15
016b    b03fb:	4c 89 f0             	mov    %r14,%rax
016e    b03fe:	48 c1 e8 03          	shr    $0x3,%rax
0172    b0402:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
0176    b0406:	74 99                	je     b03a1 <x86_vector_activate+0x111>
0178    b0408:	4c 89 f7             	mov    %r14,%rdi
017b    b040b:	e8 00 00 00 00       	call   b0410 <x86_vector_activate+0x180>	b040c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0180    b0410:	eb 8f                	jmp    b03a1 <x86_vector_activate+0x111>
0182    b0412:	ff 0d 00 00 00 00    	decl   0x0(%rip)        # b0418 <x86_vector_activate+0x188>	b0414: R_X86_64_PC32	__preempt_count-0x4
0188    b0418:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
018d    b041d:	44 8b 74 24 24       	mov    0x24(%rsp),%r14d
0192    b0422:	0f 84 78 04 00 00    	je     b08a0 <x86_vector_activate+0x610>
0198    b0428:	e8 00 00 00 00       	call   b042d <x86_vector_activate+0x19d>	b0429: R_X86_64_PLT32	rcu_is_watching-0x4
019d    b042d:	84 c0                	test   %al,%al
019f    b042f:	0f 84 64 04 00 00    	je     b0899 <x86_vector_activate+0x609>
01a5    b0435:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	b0438: R_X86_64_32S	.data+0x7f6a0
01ac    b043c:	e8 00 00 00 00       	call   b0441 <x86_vector_activate+0x1b1>	b043d: R_X86_64_PLT32	_raw_spin_lock_irqsave-0x4
01b1    b0441:	4c 8b 64 24 40       	mov    0x40(%rsp),%r12
01b6    b0446:	48 89 c3             	mov    %rax,%rbx
01b9    b0449:	48 8b 6c 24 30       	mov    0x30(%rsp),%rbp
01be    b044e:	43 0f b6 04 3c       	movzbl (%r12,%r15,1),%eax
01c3    b0453:	84 c0                	test   %al,%al
01c5    b0455:	0f 85 ec 04 00 00    	jne    b0947 <x86_vector_activate+0x6b7>
01cb    b045b:	f6 45 00 04          	testb  $0x4,0x0(%rbp)
01cf    b045f:	75 23                	jne    b0484 <x86_vector_activate+0x1f4>
01d1    b0461:	43 0f b6 04 3c       	movzbl (%r12,%r15,1),%eax
01d6    b0466:	84 c0                	test   %al,%al
01d8    b0468:	0f 85 f3 04 00 00    	jne    b0961 <x86_vector_activate+0x6d1>
01de    b046e:	f6 45 00 02          	testb  $0x2,0x0(%rbp)
01e2    b0472:	75 10                	jne    b0484 <x86_vector_activate+0x1f4>
01e4    b0474:	4c 89 ef             	mov    %r13,%rdi
01e7    b0477:	e8 54 23 00 00       	call   b27d0 <assign_irq_vector_any_locked>
01ec    b047c:	45 31 e4             	xor    %r12d,%r12d
01ef    b047f:	e9 23 01 00 00       	jmp    b05a7 <x86_vector_activate+0x317>
01f4    b0484:	45 84 f6             	test   %r14b,%r14b
01f7    b0487:	0f 85 08 01 00 00    	jne    b0595 <x86_vector_activate+0x305>
01fd    b048d:	48 89 5c 24 10       	mov    %rbx,0x10(%rsp)
0202    b0492:	49 8d 5d 10          	lea    0x10(%r13),%rbx
0206    b0496:	49 89 de             	mov    %rbx,%r14
0209    b0499:	49 c1 ee 03          	shr    $0x3,%r14
020d    b049d:	43 80 3c 3e 00       	cmpb   $0x0,(%r14,%r15,1)
0212    b04a2:	74 08                	je     b04ac <x86_vector_activate+0x21c>
0214    b04a4:	48 89 df             	mov    %rbx,%rdi
0217    b04a7:	e8 00 00 00 00       	call   b04ac <x86_vector_activate+0x21c>	b04a8: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
021c    b04ac:	48 89 5c 24 18       	mov    %rbx,0x18(%rsp)
0221    b04b1:	48 8b 1b             	mov    (%rbx),%rbx
0224    b04b4:	48 89 d8             	mov    %rbx,%rax
0227    b04b7:	48 c1 e8 03          	shr    $0x3,%rax
022b    b04bb:	42 0f b6 04 38       	movzbl (%rax,%r15,1),%eax
0230    b04c0:	84 c0                	test   %al,%al
0232    b04c2:	0f 85 b3 04 00 00    	jne    b097b <x86_vector_activate+0x6eb>
0238    b04c8:	f6 43 02 80          	testb  $0x80,0x2(%rbx)
023c    b04cc:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
0241    b04d1:	0f 85 be 00 00 00    	jne    b0595 <x86_vector_activate+0x305>
0247    b04d7:	43 0f b6 04 3c       	movzbl (%r12,%r15,1),%eax
024c    b04dc:	84 c0                	test   %al,%al
024e    b04de:	0f 85 b4 04 00 00    	jne    b0998 <x86_vector_activate+0x708>
0254    b04e4:	f6 45 00 02          	testb  $0x2,0x0(%rbp)
0258    b04e8:	0f 85 da 00 00 00    	jne    b05c8 <x86_vector_activate+0x338>
025e    b04ee:	43 0f b6 04 3c       	movzbl (%r12,%r15,1),%eax
0263    b04f3:	84 c0                	test   %al,%al
0265    b04f5:	0f 85 b7 04 00 00    	jne    b09b2 <x86_vector_activate+0x722>
026b    b04fb:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
0270    b0500:	45 31 e4             	xor    %r12d,%r12d
0273    b0503:	f6 00 08             	testb  $0x8,(%rax)
0276    b0506:	0f 84 9b 00 00 00    	je     b05a7 <x86_vector_activate+0x317>
027c    b050c:	4c 89 ef             	mov    %r13,%rdi
027f    b050f:	e8 6c f0 ff ff       	call   af580 <apic_chip_data>
0284    b0514:	4c 89 ef             	mov    %r13,%rdi
0287    b0517:	48 89 c3             	mov    %rax,%rbx
028a    b051a:	e8 b1 22 00 00       	call   b27d0 <assign_irq_vector_any_locked>
028f    b051f:	41 89 c4             	mov    %eax,%r12d
0292    b0522:	85 c0                	test   %eax,%eax
0294    b0524:	0f 85 37 03 00 00    	jne    b0861 <x86_vector_activate+0x5d1>
029a    b052a:	48 83 c3 30          	add    $0x30,%rbx
029e    b052e:	4c 89 fd             	mov    %r15,%rbp
02a1    b0531:	49 89 dd             	mov    %rbx,%r13
02a4    b0534:	49 c1 ed 03          	shr    $0x3,%r13
02a8    b0538:	43 0f b6 44 3d 00    	movzbl 0x0(%r13,%r15,1),%eax
02ae    b053e:	84 c0                	test   %al,%al
02b0    b0540:	0f 85 52 05 00 00    	jne    b0a98 <x86_vector_activate+0x808>
02b6    b0546:	80 23 f7             	andb   $0xf7,(%rbx)
02b9    b0549:	41 80 3c 2e 00       	cmpb   $0x0,(%r14,%rbp,1)
02be    b054e:	48 8b 6c 24 18       	mov    0x18(%rsp),%rbp
02c3    b0553:	74 08                	je     b055d <x86_vector_activate+0x2cd>
02c5    b0555:	48 89 ef             	mov    %rbp,%rdi
02c8    b0558:	e8 00 00 00 00       	call   b055d <x86_vector_activate+0x2cd>	b0559: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
02cd    b055d:	48 8b 6d 00          	mov    0x0(%rbp),%rbp
02d1    b0561:	48 89 e8             	mov    %rbp,%rax
02d4    b0564:	48 c1 e8 03          	shr    $0x3,%rax
02d8    b0568:	42 0f b6 04 38       	movzbl (%rax,%r15,1),%eax
02dd    b056d:	84 c0                	test   %al,%al
02df    b056f:	0f 85 3d 05 00 00    	jne    b0ab2 <x86_vector_activate+0x822>
02e5    b0575:	f6 45 03 04          	testb  $0x4,0x3(%rbp)
02e9    b0579:	0f 85 e2 02 00 00    	jne    b0861 <x86_vector_activate+0x5d1>
02ef    b057f:	43 0f b6 44 3d 00    	movzbl 0x0(%r13,%r15,1),%eax
02f5    b0585:	84 c0                	test   %al,%al
02f7    b0587:	0f 85 42 05 00 00    	jne    b0acf <x86_vector_activate+0x83f>
02fd    b058d:	80 23 fb             	andb   $0xfb,(%rbx)
0300    b0590:	e9 cc 02 00 00       	jmp    b0861 <x86_vector_activate+0x5d1>
0305    b0595:	4c 89 ef             	mov    %r13,%rdi
0308    b0598:	be ef 00 00 00       	mov    $0xef,%esi
030d    b059d:	31 d2                	xor    %edx,%edx
030f    b059f:	45 31 e4             	xor    %r12d,%r12d
0312    b05a2:	e8 89 09 00 00       	call   b0f30 <apic_update_irq_cfg>
0317    b05a7:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	b05aa: R_X86_64_32S	.data+0x7f6a0
031e    b05ae:	48 89 de             	mov    %rbx,%rsi
0321    b05b1:	e8 00 00 00 00       	call   b05b6 <x86_vector_activate+0x326>	b05b2: R_X86_64_PLT32	_raw_spin_unlock_irqrestore-0x4
0326    b05b6:	44 89 e0             	mov    %r12d,%eax
0329    b05b9:	48 83 c4 48          	add    $0x48,%rsp
032d    b05bd:	5b                   	pop    %rbx
032e    b05be:	41 5c                	pop    %r12
0330    b05c0:	41 5d                	pop    %r13
0332    b05c2:	41 5e                	pop    %r14
0334    b05c4:	41 5f                	pop    %r15
0336    b05c6:	5d                   	pop    %rbp
0337    b05c7:	c3                   	ret
0338    b05c8:	43 80 3c 3e 00       	cmpb   $0x0,(%r14,%r15,1)
033d    b05cd:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
0342    b05d2:	74 08                	je     b05dc <x86_vector_activate+0x34c>
0344    b05d4:	48 89 df             	mov    %rbx,%rdi
0347    b05d7:	e8 00 00 00 00       	call   b05dc <x86_vector_activate+0x34c>	b05d8: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
034c    b05dc:	48 8b 1b             	mov    (%rbx),%rbx
034f    b05df:	48 83 c3 18          	add    $0x18,%rbx
0353    b05e3:	48 89 d8             	mov    %rbx,%rax
0356    b05e6:	48 c1 e8 03          	shr    $0x3,%rax
035a    b05ea:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
035f    b05ef:	74 08                	je     b05f9 <x86_vector_activate+0x369>
0361    b05f1:	48 89 df             	mov    %rbx,%rdi
0364    b05f4:	e8 00 00 00 00       	call   b05f9 <x86_vector_activate+0x369>	b05f5: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0369    b05f9:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	b05fc: R_X86_64_32S	__cpu_online_mask
0370    b0600:	48 8b 1b             	mov    (%rbx),%rbx
0373    b0603:	48 c1 e8 03          	shr    $0x3,%rax
0377    b0607:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
037c    b060c:	74 0c                	je     b061a <x86_vector_activate+0x38a>
037e    b060e:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	b0611: R_X86_64_32S	__cpu_online_mask
0385    b0615:	e8 00 00 00 00       	call   b061a <x86_vector_activate+0x38a>	b0616: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
038a    b061a:	48 23 1d 00 00 00 00 	and    0x0(%rip),%rbx        # b0621 <x86_vector_activate+0x391>	b061d: R_X86_64_PC32	__cpu_online_mask-0x4
0391    b0621:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
0396    b0626:	89 d8                	mov    %ebx,%eax
0398    b0628:	83 e0 01             	and    $0x1,%eax
039b    b062b:	f6 c3 01             	test   $0x1,%bl
039e    b062e:	48 89 05 00 00 00 00 	mov    %rax,0x0(%rip)        # b0635 <x86_vector_activate+0x3a5>	b0631: R_X86_64_PC32	.bss+0xd23c
03a5    b0635:	0f 84 6f 02 00 00    	je     b08aa <x86_vector_activate+0x61a>
03ab    b063b:	43 80 3c 3e 00       	cmpb   $0x0,(%r14,%r15,1)
03b0    b0640:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
03b5    b0645:	4d 89 fd             	mov    %r15,%r13
03b8    b0648:	74 05                	je     b064f <x86_vector_activate+0x3bf>
03ba    b064a:	e8 00 00 00 00       	call   b064f <x86_vector_activate+0x3bf>	b064b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
03bf    b064f:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
03c4    b0654:	48 8b 6f 10          	mov    0x10(%rdi),%rbp
03c8    b0658:	48 83 c5 18          	add    $0x18,%rbp
03cc    b065c:	e8 1f ef ff ff       	call   af580 <apic_chip_data>
03d1    b0661:	48 89 e9             	mov    %rbp,%rcx
03d4    b0664:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # b066b <x86_vector_activate+0x3db>	b0667: R_X86_64_PC32	.bss+0xd23c
03db    b066b:	49 89 c6             	mov    %rax,%r14
03de    b066e:	48 c1 e9 03          	shr    $0x3,%rcx
03e2    b0672:	42 80 3c 29 00       	cmpb   $0x0,(%rcx,%r13,1)
03e7    b0677:	74 08                	je     b0681 <x86_vector_activate+0x3f1>
03e9    b0679:	48 89 ef             	mov    %rbp,%rdi
03ec    b067c:	e8 00 00 00 00       	call   b0681 <x86_vector_activate+0x3f1>	b067d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
03f1    b0681:	23 5d 00             	and    0x0(%rbp),%ebx
03f4    b0684:	49 8d 6e 08          	lea    0x8(%r14),%rbp
03f8    b0688:	48 89 e8             	mov    %rbp,%rax
03fb    b068b:	48 c1 e8 03          	shr    $0x3,%rax
03ff    b068f:	83 e3 01             	and    $0x1,%ebx
0402    b0692:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # b0699 <x86_vector_activate+0x409>	b0695: R_X86_64_PC32	.bss+0xd23c
0409    b0699:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
040e    b069e:	84 c0                	test   %al,%al
0410    b06a0:	0f 85 2b 03 00 00    	jne    b09d1 <x86_vector_activate+0x741>
0416    b06a6:	83 7d 00 00          	cmpl   $0x0,0x0(%rbp)
041a    b06aa:	4c 89 ed             	mov    %r13,%rbp
041d    b06ad:	74 41                	je     b06f0 <x86_vector_activate+0x460>
041f    b06af:	49 83 c6 10          	add    $0x10,%r14
0423    b06b3:	4c 89 f0             	mov    %r14,%rax
0426    b06b6:	48 c1 e8 03          	shr    $0x3,%rax
042a    b06ba:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax
042e    b06be:	84 c0                	test   %al,%al
0430    b06c0:	0f 85 28 03 00 00    	jne    b09ee <x86_vector_activate+0x75e>
0436    b06c6:	41 8b 1e             	mov    (%r14),%ebx
0439    b06c9:	be 08 00 00 00       	mov    $0x8,%esi
043e    b06ce:	48 89 d8             	mov    %rbx,%rax
0441    b06d1:	48 c1 e8 06          	shr    $0x6,%rax
0445    b06d5:	48 8d 3c c5 00 00 00 00 	lea    0x0(,%rax,8),%rdi	b06d9: R_X86_64_32S	.bss+0xd240
044d    b06dd:	e8 00 00 00 00       	call   b06e2 <x86_vector_activate+0x452>	b06de: R_X86_64_PLT32	__kasan_check_read-0x4
0452    b06e2:	48 0f a3 1d 00 00 00 00 	bt     %rbx,0x0(%rip)        # b06ea <x86_vector_activate+0x45a>	b06e6: R_X86_64_PC32	.bss+0xd23c
045a    b06ea:	0f 82 6e 01 00 00    	jb     b085e <x86_vector_activate+0x5ce>
0460    b06f0:	48 8b 3d 00 00 00 00 	mov    0x0(%rip),%rdi        # b06f7 <x86_vector_activate+0x467>	b06f3: R_X86_64_PC32	.bss+0xd21c
0467    b06f7:	48 8d 54 24 04       	lea    0x4(%rsp),%rdx
046c    b06fc:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	b06ff: R_X86_64_32S	.bss+0xd240
0473    b0703:	e8 00 00 00 00       	call   b0708 <x86_vector_activate+0x478>	b0704: R_X86_64_PLT32	irq_matrix_alloc_managed-0x4
0478    b0708:	41 89 c4             	mov    %eax,%r12d
047b    b070b:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
0480    b0710:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax
0484    b0714:	84 c0                	test   %al,%al
0486    b0716:	0f 85 f0 02 00 00    	jne    b0a0c <x86_vector_activate+0x77c>
048c    b071c:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
0491    b0721:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	b0724: R_X86_64_32S	__tracepoint_vector_alloc_managed+0x8
0498    b0728:	be 04 00 00 00       	mov    $0x4,%esi
049d    b072d:	48 c7 c3 00 00 00 00 	mov    $0x0,%rbx	b0730: R_X86_64_32S	__tracepoint_vector_alloc_managed+0x8
04a4    b0734:	44 8b 38             	mov    (%rax),%r15d
04a7    b0737:	e8 00 00 00 00       	call   b073c <x86_vector_activate+0x4ac>	b0738: R_X86_64_PLT32	__kasan_check_read-0x4
04ac    b073c:	48 c1 eb 03          	shr    $0x3,%rbx
04b0    b0740:	0f b6 04 2b          	movzbl (%rbx,%rbp,1),%eax
04b4    b0744:	84 c0                	test   %al,%al
04b6    b0746:	0f 85 e2 02 00 00    	jne    b0a2e <x86_vector_activate+0x79e>
04bc    b074c:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0(%rip)        # b0753 <x86_vector_activate+0x4c3>	b074e: R_X86_64_PC32	__tracepoint_vector_alloc_managed+0x3
04c3    b0753:	0f 8e aa 00 00 00    	jle    b0803 <x86_vector_activate+0x573>
04c9    b0759:	ff 05 00 00 00 00    	incl   0x0(%rip)        # b075f <x86_vector_activate+0x4cf>	b075b: R_X86_64_PC32	__preempt_count-0x4
04cf    b075f:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	b0762: R_X86_64_32S	__tracepoint_vector_alloc_managed+0x20
04d6    b0766:	48 c1 e8 03          	shr    $0x3,%rax
04da    b076a:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
04de    b076e:	74 0c                	je     b077c <x86_vector_activate+0x4ec>
04e0    b0770:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	b0773: R_X86_64_32S	__tracepoint_vector_alloc_managed+0x20
04e7    b0777:	e8 00 00 00 00       	call   b077c <x86_vector_activate+0x4ec>	b0778: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
04ec    b077c:	48 8b 2d 00 00 00 00 	mov    0x0(%rip),%rbp        # b0783 <x86_vector_activate+0x4f3>	b077f: R_X86_64_PC32	__tracepoint_vector_alloc_managed+0x1c
04f3    b0783:	48 85 ed             	test   %rbp,%rbp
04f6    b0786:	74 6c                	je     b07f4 <x86_vector_activate+0x564>
04f8    b0788:	48 89 eb             	mov    %rbp,%rbx
04fb    b078b:	eb 0b                	jmp    b0798 <x86_vector_activate+0x508>
04fd    b078d:	48 83 7b 18 00       	cmpq   $0x0,0x18(%rbx)
0502    b0792:	48 8d 5b 18          	lea    0x18(%rbx),%rbx
0506    b0796:	74 5c                	je     b07f4 <x86_vector_activate+0x564>
0508    b0798:	48 89 e8             	mov    %rbp,%rax
050b    b079b:	48 c1 e8 03          	shr    $0x3,%rax
050f    b079f:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0514    b07a4:	74 08                	je     b07ae <x86_vector_activate+0x51e>
0516    b07a6:	48 89 ef             	mov    %rbp,%rdi
0519    b07a9:	e8 00 00 00 00       	call   b07ae <x86_vector_activate+0x51e>	b07aa: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
051e    b07ae:	48 8d 7d 08          	lea    0x8(%rbp),%rdi
0522    b07b2:	4c 8b 33             	mov    (%rbx),%r14
0525    b07b5:	48 89 f8             	mov    %rdi,%rax
0528    b07b8:	48 c1 e8 03          	shr    $0x3,%rax
052c    b07bc:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0531    b07c1:	74 05                	je     b07c8 <x86_vector_activate+0x538>
0533    b07c3:	e8 00 00 00 00       	call   b07c8 <x86_vector_activate+0x538>	b07c4: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0538    b07c8:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
053c    b07cc:	44 89 fe             	mov    %r15d,%esi
053f    b07cf:	44 89 e2             	mov    %r12d,%edx
0542    b07d2:	44 89 e1             	mov    %r12d,%ecx
0545    b07d5:	41 ff d6             	call   *%r14
0548    b07d8:	48 83 c5 18          	add    $0x18,%rbp
054c    b07dc:	48 89 e8             	mov    %rbp,%rax
054f    b07df:	48 c1 e8 03          	shr    $0x3,%rax
0553    b07e3:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0558    b07e8:	74 a3                	je     b078d <x86_vector_activate+0x4fd>
055a    b07ea:	48 89 ef             	mov    %rbp,%rdi
055d    b07ed:	e8 00 00 00 00       	call   b07f2 <x86_vector_activate+0x562>	b07ee: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0562    b07f2:	eb 99                	jmp    b078d <x86_vector_activate+0x4fd>
0564    b07f4:	4c 89 ed             	mov    %r13,%rbp
0567    b07f7:	ff 0d 00 00 00 00    	decl   0x0(%rip)        # b07fd <x86_vector_activate+0x56d>	b07f9: R_X86_64_PC32	__preempt_count-0x4
056d    b07fd:	0f 84 dd 00 00 00    	je     b08e0 <x86_vector_activate+0x650>
0573    b0803:	e8 00 00 00 00       	call   b0808 <x86_vector_activate+0x578>	b0804: R_X86_64_PLT32	rcu_is_watching-0x4
0578    b0808:	84 c0                	test   %al,%al
057a    b080a:	0f 84 c9 00 00 00    	je     b08d9 <x86_vector_activate+0x649>
0580    b0810:	4c 8b 74 24 28       	mov    0x28(%rsp),%r14
0585    b0815:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
058a    b081a:	45 85 e4             	test   %r12d,%r12d
058d    b081d:	48 8d 5c 24 04       	lea    0x4(%rsp),%rbx
0592    b0822:	78 47                	js     b086b <x86_vector_activate+0x5db>
0594    b0824:	48 c1 eb 03          	shr    $0x3,%rbx
0598    b0828:	0f b6 04 2b          	movzbl (%rbx,%rbp,1),%eax
059c    b082c:	84 c0                	test   %al,%al
059e    b082e:	0f 85 20 02 00 00    	jne    b0a54 <x86_vector_activate+0x7c4>
05a4    b0834:	8b 54 24 04          	mov    0x4(%rsp),%edx
05a8    b0838:	4c 89 f7             	mov    %r14,%rdi
05ab    b083b:	44 89 e6             	mov    %r12d,%esi
05ae    b083e:	e8 ed 14 00 00       	call   b1d30 <apic_update_vector>
05b3    b0843:	0f b6 04 2b          	movzbl (%rbx,%rbp,1),%eax
05b7    b0847:	84 c0                	test   %al,%al
05b9    b0849:	0f 85 27 02 00 00    	jne    b0a76 <x86_vector_activate+0x7e6>
05bf    b084f:	8b 54 24 04          	mov    0x4(%rsp),%edx
05c3    b0853:	4c 89 f7             	mov    %r14,%rdi
05c6    b0856:	44 89 e6             	mov    %r12d,%esi
05c9    b0859:	e8 d2 06 00 00       	call   b0f30 <apic_update_irq_cfg>
05ce    b085e:	45 31 e4             	xor    %r12d,%r12d
05d1    b0861:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
05d6    b0866:	e9 3c fd ff ff       	jmp    b05a7 <x86_vector_activate+0x317>
05db    b086b:	0f 0b                	ud2
05dd    b086d:	48 89 c3             	mov    %rax,%rbx
05e0    b0870:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
05e5    b0875:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax
05e9    b0879:	84 c0                	test   %al,%al
05eb    b087b:	0f 85 68 02 00 00    	jne    b0ae9 <x86_vector_activate+0x859>
05f1    b0881:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
05f6    b0886:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	b0889: R_X86_64_32S	.rodata+0x391e0
05fd    b088d:	8b 30                	mov    (%rax),%esi
05ff    b088f:	e8 00 00 00 00       	call   b0894 <x86_vector_activate+0x604>	b0890: R_X86_64_PLT32	printk-0x4
0604    b0894:	e9 0e fd ff ff       	jmp    b05a7 <x86_vector_activate+0x317>
0609    b0899:	0f 0b                	ud2
060b    b089b:	e9 95 fb ff ff       	jmp    b0435 <x86_vector_activate+0x1a5>
0610    b08a0:	e8 00 00 00 00       	call   b08a5 <x86_vector_activate+0x615>	b08a1: R_X86_64_PLT32	___preempt_schedule_notrace-0x4
0615    b08a5:	e9 7e fb ff ff       	jmp    b0428 <x86_vector_activate+0x198>
061a    b08aa:	0f 0b                	ud2
061c    b08ac:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
0621    b08b1:	42 0f b6 04 38       	movzbl (%rax,%r15,1),%eax
0626    b08b6:	84 c0                	test   %al,%al
0628    b08b8:	0f 85 4d 02 00 00    	jne    b0b0b <x86_vector_activate+0x87b>
062e    b08be:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
0633    b08c3:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	b08c6: R_X86_64_32S	.rodata+0x39180
063a    b08ca:	8b 30                	mov    (%rax),%esi
063c    b08cc:	e8 00 00 00 00       	call   b08d1 <x86_vector_activate+0x641>	b08cd: R_X86_64_PLT32	printk-0x4
0641    b08d1:	41 bc ea ff ff ff    	mov    $0xffffffea,%r12d
0647    b08d7:	eb 88                	jmp    b0861 <x86_vector_activate+0x5d1>
0649    b08d9:	0f 0b                	ud2
064b    b08db:	e9 30 ff ff ff       	jmp    b0810 <x86_vector_activate+0x580>
0650    b08e0:	e8 00 00 00 00       	call   b08e5 <x86_vector_activate+0x655>	b08e1: R_X86_64_PLT32	___preempt_schedule_notrace-0x4
0655    b08e5:	e9 19 ff ff ff       	jmp    b0803 <x86_vector_activate+0x573>
065a    b08ea:	89 d9                	mov    %ebx,%ecx
065c    b08ec:	80 e1 07             	and    $0x7,%cl
065f    b08ef:	80 c1 03             	add    $0x3,%cl
0662    b08f2:	38 c1                	cmp    %al,%cl
0664    b08f4:	0f 8c dc f9 ff ff    	jl     b02d6 <x86_vector_activate+0x46>
066a    b08fa:	48 89 df             	mov    %rbx,%rdi
066d    b08fd:	e8 00 00 00 00       	call   b0902 <x86_vector_activate+0x672>	b08fe: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0672    b0902:	e9 cf f9 ff ff       	jmp    b02d6 <x86_vector_activate+0x46>
0677    b0907:	89 e9                	mov    %ebp,%ecx
0679    b0909:	80 e1 07             	and    $0x7,%cl
067c    b090c:	38 c1                	cmp    %al,%cl
067e    b090e:	0f 8c ea f9 ff ff    	jl     b02fe <x86_vector_activate+0x6e>
0684    b0914:	48 89 ef             	mov    %rbp,%rdi
0687    b0917:	e8 00 00 00 00       	call   b091c <x86_vector_activate+0x68c>	b0918: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
068c    b091c:	e9 dd f9 ff ff       	jmp    b02fe <x86_vector_activate+0x6e>
0691    b0921:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	b0924: R_X86_64_32S	__tracepoint_vector_activate+0x8
0698    b0928:	80 e1 07             	and    $0x7,%cl
069b    b092b:	80 c1 03             	add    $0x3,%cl
069e    b092e:	38 c1                	cmp    %al,%cl
06a0    b0930:	0f 8c fb f9 ff ff    	jl     b0331 <x86_vector_activate+0xa1>
06a6    b0936:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	b0939: R_X86_64_32S	__tracepoint_vector_activate+0x8
06ad    b093d:	e8 00 00 00 00       	call   b0942 <x86_vector_activate+0x6b2>	b093e: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
06b2    b0942:	e9 ea f9 ff ff       	jmp    b0331 <x86_vector_activate+0xa1>
06b7    b0947:	89 e9                	mov    %ebp,%ecx
06b9    b0949:	80 e1 07             	and    $0x7,%cl
06bc    b094c:	38 c1                	cmp    %al,%cl
06be    b094e:	0f 8c 07 fb ff ff    	jl     b045b <x86_vector_activate+0x1cb>
06c4    b0954:	48 89 ef             	mov    %rbp,%rdi
06c7    b0957:	e8 00 00 00 00       	call   b095c <x86_vector_activate+0x6cc>	b0958: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
06cc    b095c:	e9 fa fa ff ff       	jmp    b045b <x86_vector_activate+0x1cb>
06d1    b0961:	89 e9                	mov    %ebp,%ecx
06d3    b0963:	80 e1 07             	and    $0x7,%cl
06d6    b0966:	38 c1                	cmp    %al,%cl
06d8    b0968:	0f 8c 00 fb ff ff    	jl     b046e <x86_vector_activate+0x1de>
06de    b096e:	48 89 ef             	mov    %rbp,%rdi
06e1    b0971:	e8 00 00 00 00       	call   b0976 <x86_vector_activate+0x6e6>	b0972: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
06e6    b0976:	e9 f3 fa ff ff       	jmp    b046e <x86_vector_activate+0x1de>
06eb    b097b:	89 d9                	mov    %ebx,%ecx
06ed    b097d:	80 e1 07             	and    $0x7,%cl
06f0    b0980:	80 c1 03             	add    $0x3,%cl
06f3    b0983:	38 c1                	cmp    %al,%cl
06f5    b0985:	0f 8c 3d fb ff ff    	jl     b04c8 <x86_vector_activate+0x238>
06fb    b098b:	48 89 df             	mov    %rbx,%rdi
06fe    b098e:	e8 00 00 00 00       	call   b0993 <x86_vector_activate+0x703>	b098f: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0703    b0993:	e9 30 fb ff ff       	jmp    b04c8 <x86_vector_activate+0x238>
0708    b0998:	89 e9                	mov    %ebp,%ecx
070a    b099a:	80 e1 07             	and    $0x7,%cl
070d    b099d:	38 c1                	cmp    %al,%cl
070f    b099f:	0f 8c 3f fb ff ff    	jl     b04e4 <x86_vector_activate+0x254>
0715    b09a5:	48 89 ef             	mov    %rbp,%rdi
0718    b09a8:	e8 00 00 00 00       	call   b09ad <x86_vector_activate+0x71d>	b09a9: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
071d    b09ad:	e9 32 fb ff ff       	jmp    b04e4 <x86_vector_activate+0x254>
0722    b09b2:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
0727    b09b7:	80 e1 07             	and    $0x7,%cl
072a    b09ba:	38 c1                	cmp    %al,%cl
072c    b09bc:	0f 8c 39 fb ff ff    	jl     b04fb <x86_vector_activate+0x26b>
0732    b09c2:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
0737    b09c7:	e8 00 00 00 00       	call   b09cc <x86_vector_activate+0x73c>	b09c8: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
073c    b09cc:	e9 2a fb ff ff       	jmp    b04fb <x86_vector_activate+0x26b>
0741    b09d1:	89 e9                	mov    %ebp,%ecx
0743    b09d3:	80 e1 07             	and    $0x7,%cl
0746    b09d6:	80 c1 03             	add    $0x3,%cl
0749    b09d9:	38 c1                	cmp    %al,%cl
074b    b09db:	0f 8c c5 fc ff ff    	jl     b06a6 <x86_vector_activate+0x416>
0751    b09e1:	48 89 ef             	mov    %rbp,%rdi
0754    b09e4:	e8 00 00 00 00       	call   b09e9 <x86_vector_activate+0x759>	b09e5: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0759    b09e9:	e9 b8 fc ff ff       	jmp    b06a6 <x86_vector_activate+0x416>
075e    b09ee:	44 89 f1             	mov    %r14d,%ecx
0761    b09f1:	80 e1 07             	and    $0x7,%cl
0764    b09f4:	80 c1 03             	add    $0x3,%cl
0767    b09f7:	38 c1                	cmp    %al,%cl
0769    b09f9:	0f 8c c7 fc ff ff    	jl     b06c6 <x86_vector_activate+0x436>
076f    b09ff:	4c 89 f7             	mov    %r14,%rdi
0772    b0a02:	e8 00 00 00 00       	call   b0a07 <x86_vector_activate+0x777>	b0a03: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0777    b0a07:	e9 ba fc ff ff       	jmp    b06c6 <x86_vector_activate+0x436>
077c    b0a0c:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
0781    b0a11:	80 e1 07             	and    $0x7,%cl
0784    b0a14:	80 c1 03             	add    $0x3,%cl
0787    b0a17:	38 c1                	cmp    %al,%cl
0789    b0a19:	0f 8c fd fc ff ff    	jl     b071c <x86_vector_activate+0x48c>
078f    b0a1f:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
0794    b0a24:	e8 00 00 00 00       	call   b0a29 <x86_vector_activate+0x799>	b0a25: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0799    b0a29:	e9 ee fc ff ff       	jmp    b071c <x86_vector_activate+0x48c>
079e    b0a2e:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	b0a31: R_X86_64_32S	__tracepoint_vector_alloc_managed+0x8
07a5    b0a35:	80 e1 07             	and    $0x7,%cl
07a8    b0a38:	80 c1 03             	add    $0x3,%cl
07ab    b0a3b:	38 c1                	cmp    %al,%cl
07ad    b0a3d:	0f 8c 09 fd ff ff    	jl     b074c <x86_vector_activate+0x4bc>
07b3    b0a43:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	b0a46: R_X86_64_32S	__tracepoint_vector_alloc_managed+0x8
07ba    b0a4a:	e8 00 00 00 00       	call   b0a4f <x86_vector_activate+0x7bf>	b0a4b: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
07bf    b0a4f:	e9 f8 fc ff ff       	jmp    b074c <x86_vector_activate+0x4bc>
07c4    b0a54:	48 8d 4c 24 04       	lea    0x4(%rsp),%rcx
07c9    b0a59:	80 e1 04             	and    $0x4,%cl
07cc    b0a5c:	80 c9 03             	or     $0x3,%cl
07cf    b0a5f:	38 c1                	cmp    %al,%cl
07d1    b0a61:	0f 8c cd fd ff ff    	jl     b0834 <x86_vector_activate+0x5a4>
07d7    b0a67:	48 8d 7c 24 04       	lea    0x4(%rsp),%rdi
07dc    b0a6c:	e8 00 00 00 00       	call   b0a71 <x86_vector_activate+0x7e1>	b0a6d: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
07e1    b0a71:	e9 be fd ff ff       	jmp    b0834 <x86_vector_activate+0x5a4>
07e6    b0a76:	48 8d 4c 24 04       	lea    0x4(%rsp),%rcx
07eb    b0a7b:	80 e1 04             	and    $0x4,%cl
07ee    b0a7e:	80 c9 03             	or     $0x3,%cl
07f1    b0a81:	38 c1                	cmp    %al,%cl
07f3    b0a83:	0f 8c c6 fd ff ff    	jl     b084f <x86_vector_activate+0x5bf>
07f9    b0a89:	48 8d 7c 24 04       	lea    0x4(%rsp),%rdi
07fe    b0a8e:	e8 00 00 00 00       	call   b0a93 <x86_vector_activate+0x803>	b0a8f: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0803    b0a93:	e9 b7 fd ff ff       	jmp    b084f <x86_vector_activate+0x5bf>
0808    b0a98:	89 d9                	mov    %ebx,%ecx
080a    b0a9a:	80 e1 07             	and    $0x7,%cl
080d    b0a9d:	38 c1                	cmp    %al,%cl
080f    b0a9f:	0f 8c a1 fa ff ff    	jl     b0546 <x86_vector_activate+0x2b6>
0815    b0aa5:	48 89 df             	mov    %rbx,%rdi
0818    b0aa8:	e8 00 00 00 00       	call   b0aad <x86_vector_activate+0x81d>	b0aa9: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
081d    b0aad:	e9 94 fa ff ff       	jmp    b0546 <x86_vector_activate+0x2b6>
0822    b0ab2:	89 e9                	mov    %ebp,%ecx
0824    b0ab4:	80 e1 07             	and    $0x7,%cl
0827    b0ab7:	80 c1 03             	add    $0x3,%cl
082a    b0aba:	38 c1                	cmp    %al,%cl
082c    b0abc:	0f 8c b3 fa ff ff    	jl     b0575 <x86_vector_activate+0x2e5>
0832    b0ac2:	48 89 ef             	mov    %rbp,%rdi
0835    b0ac5:	e8 00 00 00 00       	call   b0aca <x86_vector_activate+0x83a>	b0ac6: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
083a    b0aca:	e9 a6 fa ff ff       	jmp    b0575 <x86_vector_activate+0x2e5>
083f    b0acf:	89 d9                	mov    %ebx,%ecx
0841    b0ad1:	80 e1 07             	and    $0x7,%cl
0844    b0ad4:	38 c1                	cmp    %al,%cl
0846    b0ad6:	0f 8c b1 fa ff ff    	jl     b058d <x86_vector_activate+0x2fd>
084c    b0adc:	48 89 df             	mov    %rbx,%rdi
084f    b0adf:	e8 00 00 00 00       	call   b0ae4 <x86_vector_activate+0x854>	b0ae0: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
0854    b0ae4:	e9 a4 fa ff ff       	jmp    b058d <x86_vector_activate+0x2fd>
0859    b0ae9:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
085e    b0aee:	80 e1 07             	and    $0x7,%cl
0861    b0af1:	80 c1 03             	add    $0x3,%cl
0864    b0af4:	38 c1                	cmp    %al,%cl
0866    b0af6:	0f 8c 85 fd ff ff    	jl     b0881 <x86_vector_activate+0x5f1>
086c    b0afc:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
0871    b0b01:	e8 00 00 00 00       	call   b0b06 <x86_vector_activate+0x876>	b0b02: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0876    b0b06:	e9 76 fd ff ff       	jmp    b0881 <x86_vector_activate+0x5f1>
087b    b0b0b:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
0880    b0b10:	80 e1 07             	and    $0x7,%cl
0883    b0b13:	80 c1 03             	add    $0x3,%cl
0886    b0b16:	38 c1                	cmp    %al,%cl
0888    b0b18:	0f 8c a0 fd ff ff    	jl     b08be <x86_vector_activate+0x62e>
088e    b0b1e:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
0893    b0b23:	e8 00 00 00 00       	call   b0b28 <x86_vector_activate+0x898>	b0b24: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0898    b0b28:	e9 91 fd ff ff       	jmp    b08be <x86_vector_activate+0x62e>
089d    b0b2d:	0f 1f 00             	nopl   (%rax)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
