Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7931369;
	Sat, 27 May 2023 07:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685172367; x=1716708367;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Q8apO0PEbcwWdgUKUDHym1z8+C/MECxMUerFwtEIgfg=;
  b=OAIBXWY95eEYUoKPAGkBtoHuFiuJfUSM1/CPdmLwnVHeP39o5PmCwAjd
   pBQs8Pg2lwaDc8sDE43nRB3Ke/P+3ZIuYzg95HyMQRNRWtbCoLxj4hZyA
   jKdpeQwyfllu5NxJfJli+ItI1/Es7k6sO5DX14RNiK7fbM/+6ZnTDfyKS
   Sjg0Do623lNoAP25hCVmOAeO9UX8+1lK3XLsg2LERsWEykJ/wbW5gefac
   LahCOD4kxKVBrRAQihikn9KAC4y4uFlTomC0GCMZ08fFzndlu7Veo4VqH
   h0058ll8xu8G0b+mGfrpDiFUJd3PFN+9qD3+xmwMTPuA2+scMJ3/am/Lq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="351879288"
X-IronPort-AV: E=Sophos;i="6.00,196,1681196400"; 
   d="scan'208";a="351879288"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2023 00:25:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="879775118"
X-IronPort-AV: E=Sophos;i="6.00,196,1681196400"; 
   d="scan'208";a="879775118"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 27 May 2023 00:25:56 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2oJH-000Jpy-11;
	Sat, 27 May 2023 07:25:55 +0000
Date: Sat, 27 May 2023 15:25:12 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [jpoimboe:objtool-diet 28/34] drivers/media/tuners/mt2063.o:
 warning: objtool: MT2063_SetReceiverMode+0x356: can't find switch jump table
Message-ID: <202305271524.lTiiaPGR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Josh Poimboeuf <jpoimboe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-diet
head:   5c199e3b1e91c997cb07ea571594202af554af3f
commit: c1b7445d6401048b2db2bf927f192c316ce304fb [28/34] objtool: Get rid of reloc->jump_table_start
config: x86_64-randconfig-x094-20230526 (https://download.01.org/0day-ci/archive/20230527/202305271524.lTiiaPGR-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=c1b7445d6401048b2db2bf927f192c316ce304fb
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe objtool-diet
        git checkout c1b7445d6401048b2db2bf927f192c316ce304fb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/media/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305271524.lTiiaPGR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/tuners/mt2063.o: warning: objtool: MT2063_SetReceiverMode+0x356: can't find switch jump table


objdump-func vmlinux.o MT2063_SetReceiverMode:
0000 0000000002e76440 <MT2063_SetReceiverMode>:
0000  2e76440:	55                   	push   %rbp
0001  2e76441:	41 57                	push   %r15
0003  2e76443:	41 56                	push   %r14
0005  2e76445:	41 55                	push   %r13
0007  2e76447:	41 54                	push   %r12
0009  2e76449:	53                   	push   %rbx
000a  2e7644a:	48 83 ec 50          	sub    $0x50,%rsp
000e  2e7644e:	41 89 f7             	mov    %esi,%r15d
0011  2e76451:	49 89 fd             	mov    %rdi,%r13
0014  2e76454:	83 3d 00 00 00 00 02 	cmpl   $0x2,0x0(%rip)        # 2e7645b <MT2063_SetReceiverMode+0x1b>	2e76456: R_X86_64_PC32	.bss+0x14bc25b
001b  2e7645b:	0f 83 71 05 00 00    	jae    2e769d2 <MT2063_SetReceiverMode+0x592>
0021  2e76461:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
002b  2e7646b:	49 8d 9d 67 05 00 00 	lea    0x567(%r13),%rbx
0032  2e76472:	45 89 f8             	mov    %r15d,%r8d
0035  2e76475:	48 89 d8             	mov    %rbx,%rax
0038  2e76478:	48 c1 e8 03          	shr    $0x3,%rax
003c  2e7647c:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
0041  2e76481:	8a 04 30             	mov    (%rax,%rsi,1),%al
0044  2e76484:	84 c0                	test   %al,%al
0046  2e76486:	4c 89 44 24 08       	mov    %r8,0x8(%rsp)
004b  2e7648b:	0f 85 14 1a 00 00    	jne    2e77ea5 <MT2063_SetReceiverMode+0x1a65>
0051  2e76491:	48 89 5c 24 28       	mov    %rbx,0x28(%rsp)
0056  2e76496:	40 8a 2b             	mov    (%rbx),%bpl
0059  2e76499:	41 89 ee             	mov    %ebp,%r14d
005c  2e7649c:	41 80 e6 bf          	and    $0xbf,%r14b
0060  2e764a0:	49 8d 98 00 00 00 00 	lea    0x0(%r8),%rbx	2e764a3: R_X86_64_32S	.rodata+0x850520
0067  2e764a7:	48 89 d8             	mov    %rbx,%rax
006a  2e764aa:	48 c1 e8 03          	shr    $0x3,%rax
006e  2e764ae:	8a 04 30             	mov    (%rax,%rsi,1),%al
0071  2e764b1:	84 c0                	test   %al,%al
0073  2e764b3:	0f 85 15 1a 00 00    	jne    2e77ece <MT2063_SetReceiverMode+0x1a8e>
0079  2e764b9:	80 3b 00             	cmpb   $0x0,(%rbx)
007c  2e764bc:	0f 95 c3             	setne  %bl
007f  2e764bf:	c0 e3 06             	shl    $0x6,%bl
0082  2e764c2:	44 08 f3             	or     %r14b,%bl
0085  2e764c5:	40 38 dd             	cmp    %bl,%bpl
0088  2e764c8:	44 89 7c 24 4c       	mov    %r15d,0x4c(%rsp)
008d  2e764cd:	0f 84 80 00 00 00    	je     2e76553 <MT2063_SetReceiverMode+0x113>
0093  2e764d3:	48 8d 44 24 07       	lea    0x7(%rsp),%rax
0098  2e764d8:	48 c1 e8 03          	shr    $0x3,%rax
009c  2e764dc:	8a 04 30             	mov    (%rax,%rsi,1),%al
009f  2e764df:	84 c0                	test   %al,%al
00a1  2e764e1:	0f 85 00 1c 00 00    	jne    2e780e7 <MT2063_SetReceiverMode+0x1ca7>
00a7  2e764e7:	88 5c 24 07          	mov    %bl,0x7(%rsp)
00ab  2e764eb:	83 3d 00 00 00 00 02 	cmpl   $0x2,0x0(%rip)        # 2e764f2 <MT2063_SetReceiverMode+0xb2>	2e764ed: R_X86_64_PC32	.bss+0x14bc25b
00b2  2e764f2:	0f 83 c0 16 00 00    	jae    2e77bb8 <MT2063_SetReceiverMode+0x1778>
00b8  2e764f8:	48 8d 5c 24 07       	lea    0x7(%rsp),%rbx
00bd  2e764fd:	4c 89 ef             	mov    %r13,%rdi
00c0  2e76500:	be 1b 00 00 00       	mov    $0x1b,%esi
00c5  2e76505:	48 89 da             	mov    %rbx,%rdx
00c8  2e76508:	b9 01 00 00 00       	mov    $0x1,%ecx
00cd  2e7650d:	e8 ae fa ff ff       	call   2e75fc0 <mt2063_write>
00d2  2e76512:	85 c0                	test   %eax,%eax
00d4  2e76514:	0f 88 f3 01 00 00    	js     2e7670d <MT2063_SetReceiverMode+0x2cd>
00da  2e7651a:	48 c1 eb 03          	shr    $0x3,%rbx
00de  2e7651e:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
00e8  2e76528:	8a 04 33             	mov    (%rbx,%rsi,1),%al
00eb  2e7652b:	84 c0                	test   %al,%al
00ed  2e7652d:	0f 85 5f 1d 00 00    	jne    2e78292 <MT2063_SetReceiverMode+0x1e52>
00f3  2e76533:	8a 5c 24 07          	mov    0x7(%rsp),%bl
00f7  2e76537:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
00fc  2e7653c:	8a 04 30             	mov    (%rax,%rsi,1),%al
00ff  2e7653f:	84 c0                	test   %al,%al
0101  2e76541:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
0106  2e76546:	0f 85 6f 1d 00 00    	jne    2e782bb <MT2063_SetReceiverMode+0x1e7b>
010c  2e7654c:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
0111  2e76551:	88 18                	mov    %bl,(%rax)
0113  2e76553:	4d 8d b5 78 05 00 00 	lea    0x578(%r13),%r14
011a  2e7655a:	4c 89 f5             	mov    %r14,%rbp
011d  2e7655d:	48 c1 ed 03          	shr    $0x3,%rbp
0121  2e76561:	8a 44 35 00          	mov    0x0(%rbp,%rsi,1),%al
0125  2e76565:	84 c0                	test   %al,%al
0127  2e76567:	0f 85 eb 19 00 00    	jne    2e77f58 <MT2063_SetReceiverMode+0x1b18>
012d  2e7656d:	45 8a 3e             	mov    (%r14),%r15b
0130  2e76570:	45 89 fc             	mov    %r15d,%r12d
0133  2e76573:	41 80 e4 fc          	and    $0xfc,%r12b
0137  2e76577:	49 8d 98 00 00 00 00 	lea    0x0(%r8),%rbx	2e7657a: R_X86_64_32S	.rodata+0x850580
013e  2e7657e:	48 89 d8             	mov    %rbx,%rax
0141  2e76581:	48 c1 e8 03          	shr    $0x3,%rax
0145  2e76585:	8a 04 30             	mov    (%rax,%rsi,1),%al
0148  2e76588:	84 c0                	test   %al,%al
014a  2e7658a:	0f 85 f2 19 00 00    	jne    2e77f82 <MT2063_SetReceiverMode+0x1b42>
0150  2e76590:	8a 1b                	mov    (%rbx),%bl
0152  2e76592:	80 e3 03             	and    $0x3,%bl
0155  2e76595:	44 08 e3             	or     %r12b,%bl
0158  2e76598:	41 38 df             	cmp    %bl,%r15b
015b  2e7659b:	74 78                	je     2e76615 <MT2063_SetReceiverMode+0x1d5>
015d  2e7659d:	48 8d 44 24 07       	lea    0x7(%rsp),%rax
0162  2e765a2:	48 c1 e8 03          	shr    $0x3,%rax
0166  2e765a6:	8a 04 30             	mov    (%rax,%rsi,1),%al
0169  2e765a9:	84 c0                	test   %al,%al
016b  2e765ab:	0f 85 b8 1b 00 00    	jne    2e78169 <MT2063_SetReceiverMode+0x1d29>
0171  2e765b1:	88 5c 24 07          	mov    %bl,0x7(%rsp)
0175  2e765b5:	83 3d 00 00 00 00 02 	cmpl   $0x2,0x0(%rip)        # 2e765bc <MT2063_SetReceiverMode+0x17c>	2e765b7: R_X86_64_PC32	.bss+0x14bc25b
017c  2e765bc:	0f 83 65 16 00 00    	jae    2e77c27 <MT2063_SetReceiverMode+0x17e7>
0182  2e765c2:	48 8d 5c 24 07       	lea    0x7(%rsp),%rbx
0187  2e765c7:	4c 89 ef             	mov    %r13,%rdi
018a  2e765ca:	be 2c 00 00 00       	mov    $0x2c,%esi
018f  2e765cf:	48 89 da             	mov    %rbx,%rdx
0192  2e765d2:	b9 01 00 00 00       	mov    $0x1,%ecx
0197  2e765d7:	e8 e4 f9 ff ff       	call   2e75fc0 <mt2063_write>
019c  2e765dc:	85 c0                	test   %eax,%eax
019e  2e765de:	0f 88 29 01 00 00    	js     2e7670d <MT2063_SetReceiverMode+0x2cd>
01a4  2e765e4:	48 c1 eb 03          	shr    $0x3,%rbx
01a8  2e765e8:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
01b2  2e765f2:	8a 04 33             	mov    (%rbx,%rsi,1),%al
01b5  2e765f5:	84 c0                	test   %al,%al
01b7  2e765f7:	0f 85 a0 1d 00 00    	jne    2e7839d <MT2063_SetReceiverMode+0x1f5d>
01bd  2e765fd:	8a 5c 24 07          	mov    0x7(%rsp),%bl
01c1  2e76601:	8a 44 35 00          	mov    0x0(%rbp,%rsi,1),%al
01c5  2e76605:	84 c0                	test   %al,%al
01c7  2e76607:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
01cc  2e7660c:	0f 85 b4 1d 00 00    	jne    2e783c6 <MT2063_SetReceiverMode+0x1f86>
01d2  2e76612:	41 88 1e             	mov    %bl,(%r14)
01d5  2e76615:	4d 8d b5 79 05 00 00 	lea    0x579(%r13),%r14
01dc  2e7661c:	4d 89 f7             	mov    %r14,%r15
01df  2e7661f:	49 c1 ef 03          	shr    $0x3,%r15
01e3  2e76623:	41 8a 04 37          	mov    (%r15,%rsi,1),%al
01e7  2e76627:	84 c0                	test   %al,%al
01e9  2e76629:	0f 85 7c 19 00 00    	jne    2e77fab <MT2063_SetReceiverMode+0x1b6b>
01ef  2e7662f:	45 8a 26             	mov    (%r14),%r12b
01f2  2e76632:	44 89 e5             	mov    %r12d,%ebp
01f5  2e76635:	40 80 e5 0f          	and    $0xf,%bpl
01f9  2e76639:	49 8d b8 00 00 00 00 	lea    0x0(%r8),%rdi	2e7663c: R_X86_64_32S	.rodata+0x8505a0
0200  2e76640:	48 89 f8             	mov    %rdi,%rax
0203  2e76643:	48 c1 e8 03          	shr    $0x3,%rax
0207  2e76647:	8a 04 30             	mov    (%rax,%rsi,1),%al
020a  2e7664a:	84 c0                	test   %al,%al
020c  2e7664c:	0f 85 83 19 00 00    	jne    2e77fd5 <MT2063_SetReceiverMode+0x1b95>
0212  2e76652:	41 8a 98 00 00 00 00 	mov    0x0(%r8),%bl	2e76655: R_X86_64_32S	.rodata+0x8505a0
0219  2e76659:	c0 e3 07             	shl    $0x7,%bl
021c  2e7665c:	40 08 eb             	or     %bpl,%bl
021f  2e7665f:	49 8d a8 00 00 00 00 	lea    0x0(%r8),%rbp	2e76662: R_X86_64_32S	.rodata+0x8505c0
0226  2e76666:	48 89 e8             	mov    %rbp,%rax
0229  2e76669:	48 c1 e8 03          	shr    $0x3,%rax
022d  2e7666d:	8a 04 30             	mov    (%rax,%rsi,1),%al
0230  2e76670:	84 c0                	test   %al,%al
0232  2e76672:	0f 85 83 19 00 00    	jne    2e77ffb <MT2063_SetReceiverMode+0x1bbb>
0238  2e76678:	8a 45 00             	mov    0x0(%rbp),%al
023b  2e7667b:	c0 e0 04             	shl    $0x4,%al
023e  2e7667e:	08 c3                	or     %al,%bl
0240  2e76680:	41 38 dc             	cmp    %bl,%r12b
0243  2e76683:	41 bc 00 00 00 00    	mov    $0x0,%r12d
0249  2e76689:	0f 84 90 00 00 00    	je     2e7671f <MT2063_SetReceiverMode+0x2df>
024f  2e7668f:	48 8d 44 24 07       	lea    0x7(%rsp),%rax
0254  2e76694:	48 c1 e8 03          	shr    $0x3,%rax
0258  2e76698:	8a 04 30             	mov    (%rax,%rsi,1),%al
025b  2e7669b:	84 c0                	test   %al,%al
025d  2e7669d:	0f 85 48 1b 00 00    	jne    2e781eb <MT2063_SetReceiverMode+0x1dab>
0263  2e766a3:	88 5c 24 07          	mov    %bl,0x7(%rsp)
0267  2e766a7:	83 3d 00 00 00 00 02 	cmpl   $0x2,0x0(%rip)        # 2e766ae <MT2063_SetReceiverMode+0x26e>	2e766a9: R_X86_64_PC32	.bss+0x14bc25b
026e  2e766ae:	0f 83 8b 15 00 00    	jae    2e77c3f <MT2063_SetReceiverMode+0x17ff>
0274  2e766b4:	48 8d 6c 24 07       	lea    0x7(%rsp),%rbp
0279  2e766b9:	4c 89 ef             	mov    %r13,%rdi
027c  2e766bc:	be 2d 00 00 00       	mov    $0x2d,%esi
0281  2e766c1:	48 89 ea             	mov    %rbp,%rdx
0284  2e766c4:	b9 01 00 00 00       	mov    $0x1,%ecx
0289  2e766c9:	e8 f2 f8 ff ff       	call   2e75fc0 <mt2063_write>
028e  2e766ce:	85 c0                	test   %eax,%eax
0290  2e766d0:	0f 88 74 01 00 00    	js     2e7684a <MT2063_SetReceiverMode+0x40a>
0296  2e766d6:	48 89 e8             	mov    %rbp,%rax
0299  2e766d9:	48 c1 e8 03          	shr    $0x3,%rax
029d  2e766dd:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
02a7  2e766e7:	8a 04 10             	mov    (%rax,%rdx,1),%al
02aa  2e766ea:	84 c0                	test   %al,%al
02ac  2e766ec:	0f 85 6a 22 00 00    	jne    2e7895c <MT2063_SetReceiverMode+0x251c>
02b2  2e766f2:	8a 5c 24 07          	mov    0x7(%rsp),%bl
02b6  2e766f6:	41 8a 04 17          	mov    (%r15,%rdx,1),%al
02ba  2e766fa:	84 c0                	test   %al,%al
02bc  2e766fc:	0f 85 83 22 00 00    	jne    2e78985 <MT2063_SetReceiverMode+0x2545>
02c2  2e76702:	41 88 1e             	mov    %bl,(%r14)
02c5  2e76705:	45 31 e4             	xor    %r12d,%r12d
02c8  2e76708:	e9 4a 01 00 00       	jmp    2e76857 <MT2063_SetReceiverMode+0x417>
02cd  2e7670d:	41 89 c4             	mov    %eax,%r12d
02d0  2e76710:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
02da  2e7671a:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
02df  2e7671f:	83 3d 00 00 00 00 02 	cmpl   $0x2,0x0(%rip)        # 2e76726 <MT2063_SetReceiverMode+0x2e6>	2e76721: R_X86_64_PC32	.bss+0x14bc25b
02e6  2e76726:	0f 83 7f 02 00 00    	jae    2e769ab <MT2063_SetReceiverMode+0x56b>
02ec  2e7672c:	49 8d bd 7b 05 00 00 	lea    0x57b(%r13),%rdi
02f3  2e76733:	49 89 fe             	mov    %rdi,%r14
02f6  2e76736:	49 c1 ee 03          	shr    $0x3,%r14
02fa  2e7673a:	41 8a 04 36          	mov    (%r14,%rsi,1),%al
02fe  2e7673e:	84 c0                	test   %al,%al
0300  2e76740:	0f 85 b1 17 00 00    	jne    2e77ef7 <MT2063_SetReceiverMode+0x1ab7>
0306  2e76746:	41 8a 9d 7b 05 00 00 	mov    0x57b(%r13),%bl
030d  2e7674d:	80 e3 03             	and    $0x3,%bl
0310  2e76750:	4d 8d bd 7c 05 00 00 	lea    0x57c(%r13),%r15
0317  2e76757:	4c 89 fa             	mov    %r15,%rdx
031a  2e7675a:	48 c1 ea 03          	shr    $0x3,%rdx
031e  2e7675e:	8a 04 32             	mov    (%rdx,%rsi,1),%al
0321  2e76761:	84 c0                	test   %al,%al
0323  2e76763:	48 89 54 24 10       	mov    %rdx,0x10(%rsp)
0328  2e76768:	0f 85 b5 17 00 00    	jne    2e77f23 <MT2063_SetReceiverMode+0x1ae3>
032e  2e7676e:	41 8a 07             	mov    (%r15),%al
0331  2e76771:	f6 d0                	not    %al
0333  2e76773:	31 c9                	xor    %ecx,%ecx
0335  2e76775:	a8 03                	test   $0x3,%al
0337  2e76777:	0f 95 c1             	setne  %cl
033a  2e7677a:	8d 04 09             	lea    (%rcx,%rcx,1),%eax
033d  2e7677d:	80 fb 03             	cmp    $0x3,%bl
0340  2e76780:	8d 5c 09 01          	lea    0x1(%rcx,%rcx,1),%ebx
0344  2e76784:	0f 44 d8             	cmove  %eax,%ebx
0347  2e76787:	83 3d 00 00 00 00 02 	cmpl   $0x2,0x0(%rip)        # 2e7678e <MT2063_SetReceiverMode+0x34e>	2e76789: R_X86_64_PC32	.bss+0x14bc25b
034e  2e7678e:	0f 83 56 02 00 00    	jae    2e769ea <MT2063_SetReceiverMode+0x5aa>
0354  2e76794:	89 d8                	mov    %ebx,%eax
0356  2e76796:	ff 24 c5 00 00 00 00 	jmp    *0x0(,%rax,8)	2e76799: R_X86_64_32S	.rodata+0x84fe80
035d  2e7679d:	41 8a 04 36          	mov    (%r14,%rsi,1),%al
0361  2e767a1:	84 c0                	test   %al,%al
0363  2e767a3:	0f 85 6c 1c 00 00    	jne    2e78415 <MT2063_SetReceiverMode+0x1fd5>
0369  2e767a9:	8a 07                	mov    (%rdi),%al
036b  2e767ab:	89 c3                	mov    %eax,%ebx
036d  2e767ad:	80 cb 03             	or     $0x3,%bl
0370  2e767b0:	45 31 c9             	xor    %r9d,%r9d
0373  2e767b3:	38 d8                	cmp    %bl,%al
0375  2e767b5:	0f 84 66 05 00 00    	je     2e76d21 <MT2063_SetReceiverMode+0x8e1>
037b  2e767bb:	48 89 7c 24 18       	mov    %rdi,0x18(%rsp)
0380  2e767c0:	48 8d 44 24 07       	lea    0x7(%rsp),%rax
0385  2e767c5:	48 c1 e8 03          	shr    $0x3,%rax
0389  2e767c9:	8a 04 30             	mov    (%rax,%rsi,1),%al
038c  2e767cc:	84 c0                	test   %al,%al
038e  2e767ce:	0f 85 b7 24 00 00    	jne    2e78c8b <MT2063_SetReceiverMode+0x284b>
0394  2e767d4:	88 5c 24 07          	mov    %bl,0x7(%rsp)
0398  2e767d8:	83 3d 00 00 00 00 02 	cmpl   $0x2,0x0(%rip)        # 2e767df <MT2063_SetReceiverMode+0x39f>	2e767da: R_X86_64_PC32	.bss+0x14bc25b
039f  2e767df:	0f 83 1a 15 00 00    	jae    2e77cff <MT2063_SetReceiverMode+0x18bf>
03a5  2e767e5:	48 8d 6c 24 07       	lea    0x7(%rsp),%rbp
03aa  2e767ea:	4c 89 ef             	mov    %r13,%rdi
03ad  2e767ed:	be 2f 00 00 00       	mov    $0x2f,%esi
03b2  2e767f2:	48 89 ea             	mov    %rbp,%rdx
03b5  2e767f5:	b9 01 00 00 00       	mov    $0x1,%ecx
03ba  2e767fa:	e8 c1 f7 ff ff       	call   2e75fc0 <mt2063_write>
03bf  2e767ff:	85 c0                	test   %eax,%eax
03c1  2e76801:	0f 88 03 05 00 00    	js     2e76d0a <MT2063_SetReceiverMode+0x8ca>
03c7  2e76807:	48 c1 ed 03          	shr    $0x3,%rbp
03cb  2e7680b:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
03d5  2e76815:	8a 44 35 00          	mov    0x0(%rbp,%rsi,1),%al
03d9  2e76819:	84 c0                	test   %al,%al
03db  2e7681b:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
03e0  2e76820:	0f 85 39 27 00 00    	jne    2e78f5f <MT2063_SetReceiverMode+0x2b1f>
03e6  2e76826:	8a 5c 24 07          	mov    0x7(%rsp),%bl
03ea  2e7682a:	41 8a 04 36          	mov    (%r14,%rsi,1),%al
03ee  2e7682e:	84 c0                	test   %al,%al
03f0  2e76830:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
03f5  2e76835:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
03fa  2e7683a:	0f 85 4d 27 00 00    	jne    2e78f8d <MT2063_SetReceiverMode+0x2b4d>
0400  2e76840:	88 1f                	mov    %bl,(%rdi)
0402  2e76842:	45 31 c9             	xor    %r9d,%r9d
0405  2e76845:	e9 d7 04 00 00       	jmp    2e76d21 <MT2063_SetReceiverMode+0x8e1>
040a  2e7684a:	41 89 c4             	mov    %eax,%r12d
040d  2e7684d:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0417  2e76857:	4d 8d b5 74 05 00 00 	lea    0x574(%r13),%r14
041e  2e7685e:	4d 89 f7             	mov    %r14,%r15
0421  2e76861:	49 c1 ef 03          	shr    $0x3,%r15
0425  2e76865:	41 8a 04 17          	mov    (%r15,%rdx,1),%al
0429  2e76869:	84 c0                	test   %al,%al
042b  2e7686b:	0f 85 99 19 00 00    	jne    2e7820a <MT2063_SetReceiverMode+0x1dca>
0431  2e76871:	41 8a 1e             	mov    (%r14),%bl
0434  2e76874:	80 cb 01             	or     $0x1,%bl
0437  2e76877:	48 c1 ed 03          	shr    $0x3,%rbp
043b  2e7687b:	8a 44 15 00          	mov    0x0(%rbp,%rdx,1),%al
043f  2e7687f:	84 c0                	test   %al,%al
0441  2e76881:	0f 85 a8 19 00 00    	jne    2e7822f <MT2063_SetReceiverMode+0x1def>
0447  2e76887:	44 89 64 24 20       	mov    %r12d,0x20(%rsp)
044c  2e7688c:	88 5c 24 07          	mov    %bl,0x7(%rsp)
0450  2e76890:	83 3d 00 00 00 00 02 	cmpl   $0x2,0x0(%rip)        # 2e76897 <MT2063_SetReceiverMode+0x457>	2e76892: R_X86_64_PC32	.bss+0x14bc25b
0457  2e76897:	0f 83 ba 13 00 00    	jae    2e77c57 <MT2063_SetReceiverMode+0x1817>
045d  2e7689d:	48 8d 6c 24 07       	lea    0x7(%rsp),%rbp
0462  2e768a2:	4c 89 ef             	mov    %r13,%rdi
0465  2e768a5:	be 28 00 00 00       	mov    $0x28,%esi
046a  2e768aa:	48 89 ea             	mov    %rbp,%rdx
046d  2e768ad:	b9 01 00 00 00       	mov    $0x1,%ecx
0472  2e768b2:	e8 09 f7 ff ff       	call   2e75fc0 <mt2063_write>
0477  2e768b7:	85 c0                	test   %eax,%eax
0479  2e768b9:	78 34                	js     2e768ef <MT2063_SetReceiverMode+0x4af>
047b  2e768bb:	48 89 e8             	mov    %rbp,%rax
047e  2e768be:	48 c1 e8 03          	shr    $0x3,%rax
0482  2e768c2:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
048c  2e768cc:	8a 04 10             	mov    (%rax,%rdx,1),%al
048f  2e768cf:	84 c0                	test   %al,%al
0491  2e768d1:	0f 85 d3 20 00 00    	jne    2e789aa <MT2063_SetReceiverMode+0x256a>
0497  2e768d7:	8a 5c 24 07          	mov    0x7(%rsp),%bl
049b  2e768db:	41 8a 04 17          	mov    (%r15,%rdx,1),%al
049f  2e768df:	84 c0                	test   %al,%al
04a1  2e768e1:	0f 85 ec 20 00 00    	jne    2e789d3 <MT2063_SetReceiverMode+0x2593>
04a7  2e768e7:	41 88 1e             	mov    %bl,(%r14)
04aa  2e768ea:	45 31 e4             	xor    %r12d,%r12d
04ad  2e768ed:	eb 0d                	jmp    2e768fc <MT2063_SetReceiverMode+0x4bc>
04af  2e768ef:	41 89 c4             	mov    %eax,%r12d
04b2  2e768f2:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
04bc  2e768fc:	41 8a 04 17          	mov    (%r15,%rdx,1),%al
04c0  2e76900:	84 c0                	test   %al,%al
04c2  2e76902:	0f 85 46 19 00 00    	jne    2e7824e <MT2063_SetReceiverMode+0x1e0e>
04c8  2e76908:	41 8a 1e             	mov    (%r14),%bl
04cb  2e7690b:	80 e3 fe             	and    $0xfe,%bl
04ce  2e7690e:	48 c1 ed 03          	shr    $0x3,%rbp
04d2  2e76912:	8a 44 15 00          	mov    0x0(%rbp,%rdx,1),%al
04d6  2e76916:	84 c0                	test   %al,%al
04d8  2e76918:	0f 85 55 19 00 00    	jne    2e78273 <MT2063_SetReceiverMode+0x1e33>
04de  2e7691e:	88 5c 24 07          	mov    %bl,0x7(%rsp)
04e2  2e76922:	83 3d 00 00 00 00 02 	cmpl   $0x2,0x0(%rip)        # 2e76929 <MT2063_SetReceiverMode+0x4e9>	2e76924: R_X86_64_PC32	.bss+0x14bc25b
04e9  2e76929:	0f 83 40 13 00 00    	jae    2e77c6f <MT2063_SetReceiverMode+0x182f>
04ef  2e7692f:	8b 44 24 20          	mov    0x20(%rsp),%eax
04f3  2e76933:	44 09 e0             	or     %r12d,%eax
04f6  2e76936:	41 89 c4             	mov    %eax,%r12d
04f9  2e76939:	48 8d 5c 24 07       	lea    0x7(%rsp),%rbx
04fe  2e7693e:	4c 89 ef             	mov    %r13,%rdi
0501  2e76941:	be 28 00 00 00       	mov    $0x28,%esi
0506  2e76946:	48 89 da             	mov    %rbx,%rdx
0509  2e76949:	b9 01 00 00 00       	mov    $0x1,%ecx
050e  2e7694e:	e8 6d f6 ff ff       	call   2e75fc0 <mt2063_write>
0513  2e76953:	85 c0                	test   %eax,%eax
0515  2e76955:	78 35                	js     2e7698c <MT2063_SetReceiverMode+0x54c>
0517  2e76957:	48 c1 eb 03          	shr    $0x3,%rbx
051b  2e7695b:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
0525  2e76965:	8a 04 33             	mov    (%rbx,%rsi,1),%al
0528  2e76968:	84 c0                	test   %al,%al
052a  2e7696a:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
052f  2e7696f:	0f 85 83 20 00 00    	jne    2e789f8 <MT2063_SetReceiverMode+0x25b8>
0535  2e76975:	8a 5c 24 07          	mov    0x7(%rsp),%bl
0539  2e76979:	41 8a 04 37          	mov    (%r15,%rsi,1),%al
053d  2e7697d:	84 c0                	test   %al,%al
053f  2e7697f:	0f 85 a1 20 00 00    	jne    2e78a26 <MT2063_SetReceiverMode+0x25e6>
0545  2e76985:	41 88 1e             	mov    %bl,(%r14)
0548  2e76988:	31 c0                	xor    %eax,%eax
054a  2e7698a:	eb 0f                	jmp    2e7699b <MT2063_SetReceiverMode+0x55b>
054c  2e7698c:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
0556  2e76996:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
055b  2e7699b:	41 09 c4             	or     %eax,%r12d
055e  2e7699e:	83 3d 00 00 00 00 02 	cmpl   $0x2,0x0(%rip)        # 2e769a5 <MT2063_SetReceiverMode+0x565>	2e769a0: R_X86_64_PC32	.bss+0x14bc25b
0565  2e769a5:	0f 82 81 fd ff ff    	jb     2e7672c <MT2063_SetReceiverMode+0x2ec>
056b  2e769ab:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2e769ae: R_X86_64_32S	.rodata+0x84fec0
0572  2e769b2:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	2e769b5: R_X86_64_32S	.rodata.str1.1+0xacc4f
0579  2e769b9:	e8 00 00 00 00       	call   2e769be <MT2063_SetReceiverMode+0x57e>	2e769ba: R_X86_64_PLT32	_printk-0x4
057e  2e769be:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
0583  2e769c3:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
058d  2e769cd:	e9 5a fd ff ff       	jmp    2e7672c <MT2063_SetReceiverMode+0x2ec>
0592  2e769d2:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2e769d5: R_X86_64_32S	.rodata+0x84fec0
0599  2e769d9:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	2e769dc: R_X86_64_32S	.rodata.str1.1+0x1ff64
05a0  2e769e0:	e8 00 00 00 00       	call   2e769e5 <MT2063_SetReceiverMode+0x5a5>	2e769e1: R_X86_64_PLT32	_printk-0x4
05a5  2e769e5:	e9 77 fa ff ff       	jmp    2e76461 <MT2063_SetReceiverMode+0x21>
05aa  2e769ea:	48 89 fd             	mov    %rdi,%rbp
05ad  2e769ed:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2e769f0: R_X86_64_32S	.rodata+0x84fec0
05b4  2e769f4:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	2e769f7: R_X86_64_32S	.rodata.str1.1+0xcf69a
05bb  2e769fb:	e8 00 00 00 00       	call   2e76a00 <MT2063_SetReceiverMode+0x5c0>	2e769fc: R_X86_64_PLT32	_printk-0x4
05c0  2e76a00:	48 89 ef             	mov    %rbp,%rdi
05c3  2e76a03:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
05c8  2e76a08:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
05cd  2e76a0d:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
05d7  2e76a17:	89 d8                	mov    %ebx,%eax
05d9  2e76a19:	ff 24 c5 00 00 00 00 	jmp    *0x0(,%rax,8)	2e76a1c: R_X86_64_32S	.rodata+0x84fe80
05e0  2e76a20:	44 89 64 24 20       	mov    %r12d,0x20(%rsp)
05e5  2e76a25:	4d 89 fc             	mov    %r15,%r12
05e8  2e76a28:	41 8a 04 36          	mov    (%r14,%rsi,1),%al
05ec  2e76a2c:	84 c0                	test   %al,%al
05ee  2e76a2e:	0f 85 12 1a 00 00    	jne    2e78446 <MT2063_SetReceiverMode+0x2006>
05f4  2e76a34:	45 8a bd 7b 05 00 00 	mov    0x57b(%r13),%r15b
05fb  2e76a3b:	49 8d ad c4 04 00 00 	lea    0x4c4(%r13),%rbp
0602  2e76a42:	48 89 e8             	mov    %rbp,%rax
0605  2e76a45:	48 c1 e8 03          	shr    $0x3,%rax
0609  2e76a49:	8a 04 30             	mov    (%rax,%rsi,1),%al
060c  2e76a4c:	84 c0                	test   %al,%al
060e  2e76a4e:	0f 85 23 1a 00 00    	jne    2e78477 <MT2063_SetReceiverMode+0x2037>
0614  2e76a54:	8b 6d 00             	mov    0x0(%rbp),%ebp
0617  2e76a57:	48 83 fd 06          	cmp    $0x6,%rbp
061b  2e76a5b:	0f 83 f4 29 00 00    	jae    2e79455 <MT2063_SetReceiverMode+0x3015>
0621  2e76a61:	41 80 e7 fc          	and    $0xfc,%r15b
0625  2e76a65:	48 8d ad 00 00 00 00 	lea    0x0(%rbp),%rbp	2e76a68: R_X86_64_32S	.rodata+0x8507a0
062c  2e76a6c:	48 89 e8             	mov    %rbp,%rax
062f  2e76a6f:	48 c1 e8 03          	shr    $0x3,%rax
0633  2e76a73:	8a 04 30             	mov    (%rax,%rsi,1),%al
0636  2e76a76:	84 c0                	test   %al,%al
0638  2e76a78:	0f 85 30 1a 00 00    	jne    2e784ae <MT2063_SetReceiverMode+0x206e>
063e  2e76a7e:	8a 5d 00             	mov    0x0(%rbp),%bl
0641  2e76a81:	80 e3 03             	and    $0x3,%bl
0644  2e76a84:	44 08 fb             	or     %r15b,%bl
0647  2e76a87:	41 8a 04 36          	mov    (%r14,%rsi,1),%al
064b  2e76a8b:	84 c0                	test   %al,%al
064d  2e76a8d:	0f 85 4f 1a 00 00    	jne    2e784e2 <MT2063_SetReceiverMode+0x20a2>
0653  2e76a93:	45 31 c9             	xor    %r9d,%r9d
0656  2e76a96:	38 1f                	cmp    %bl,(%rdi)
0658  2e76a98:	4d 89 e7             	mov    %r12,%r15
065b  2e76a9b:	44 8b 64 24 20       	mov    0x20(%rsp),%r12d
0660  2e76aa0:	0f 84 37 03 00 00    	je     2e76ddd <MT2063_SetReceiverMode+0x99d>
0666  2e76aa6:	48 89 7c 24 18       	mov    %rdi,0x18(%rsp)
066b  2e76aab:	48 8d 44 24 07       	lea    0x7(%rsp),%rax
0670  2e76ab0:	48 c1 e8 03          	shr    $0x3,%rax
0674  2e76ab4:	8a 04 30             	mov    (%rax,%rsi,1),%al
0677  2e76ab7:	84 c0                	test   %al,%al
0679  2e76ab9:	0f 85 eb 21 00 00    	jne    2e78caa <MT2063_SetReceiverMode+0x286a>
067f  2e76abf:	88 5c 24 07          	mov    %bl,0x7(%rsp)
0683  2e76ac3:	83 3d 00 00 00 00 02 	cmpl   $0x2,0x0(%rip)        # 2e76aca <MT2063_SetReceiverMode+0x68a>	2e76ac5: R_X86_64_PC32	.bss+0x14bc25b
068a  2e76aca:	0f 83 47 12 00 00    	jae    2e77d17 <MT2063_SetReceiverMode+0x18d7>
0690  2e76ad0:	48 8d 6c 24 07       	lea    0x7(%rsp),%rbp
0695  2e76ad5:	4c 89 ef             	mov    %r13,%rdi
0698  2e76ad8:	be 2f 00 00 00       	mov    $0x2f,%esi
069d  2e76add:	48 89 ea             	mov    %rbp,%rdx
06a0  2e76ae0:	b9 01 00 00 00       	mov    $0x1,%ecx
06a5  2e76ae5:	e8 d6 f4 ff ff       	call   2e75fc0 <mt2063_write>
06aa  2e76aea:	85 c0                	test   %eax,%eax
06ac  2e76aec:	0f 88 d4 02 00 00    	js     2e76dc6 <MT2063_SetReceiverMode+0x986>
06b2  2e76af2:	48 c1 ed 03          	shr    $0x3,%rbp
06b6  2e76af6:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
06c0  2e76b00:	8a 44 35 00          	mov    0x0(%rbp,%rsi,1),%al
06c4  2e76b04:	84 c0                	test   %al,%al
06c6  2e76b06:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
06cb  2e76b0b:	0f 85 b1 24 00 00    	jne    2e78fc2 <MT2063_SetReceiverMode+0x2b82>
06d1  2e76b11:	8a 5c 24 07          	mov    0x7(%rsp),%bl
06d5  2e76b15:	41 8a 04 36          	mov    (%r14,%rsi,1),%al
06d9  2e76b19:	84 c0                	test   %al,%al
06db  2e76b1b:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
06e0  2e76b20:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
06e5  2e76b25:	0f 85 c5 24 00 00    	jne    2e78ff0 <MT2063_SetReceiverMode+0x2bb0>
06eb  2e76b2b:	88 1f                	mov    %bl,(%rdi)
06ed  2e76b2d:	45 31 c9             	xor    %r9d,%r9d
06f0  2e76b30:	e9 a8 02 00 00       	jmp    2e76ddd <MT2063_SetReceiverMode+0x99d>
06f5  2e76b35:	41 8a 04 36          	mov    (%r14,%rsi,1),%al
06f9  2e76b39:	84 c0                	test   %al,%al
06fb  2e76b3b:	0f 85 d2 19 00 00    	jne    2e78513 <MT2063_SetReceiverMode+0x20d3>
0701  2e76b41:	8a 07                	mov    (%rdi),%al
0703  2e76b43:	89 c3                	mov    %eax,%ebx
0705  2e76b45:	80 cb 03             	or     $0x3,%bl
0708  2e76b48:	45 31 c9             	xor    %r9d,%r9d
070b  2e76b4b:	38 d8                	cmp    %bl,%al
070d  2e76b4d:	0f 84 46 03 00 00    	je     2e76e99 <MT2063_SetReceiverMode+0xa59>
0713  2e76b53:	48 89 7c 24 18       	mov    %rdi,0x18(%rsp)
0718  2e76b58:	48 8d 44 24 07       	lea    0x7(%rsp),%rax
071d  2e76b5d:	48 c1 e8 03          	shr    $0x3,%rax
0721  2e76b61:	8a 04 30             	mov    (%rax,%rsi,1),%al
0724  2e76b64:	84 c0                	test   %al,%al
0726  2e76b66:	0f 85 5d 21 00 00    	jne    2e78cc9 <MT2063_SetReceiverMode+0x2889>
072c  2e76b6c:	88 5c 24 07          	mov    %bl,0x7(%rsp)
0730  2e76b70:	83 3d 00 00 00 00 02 	cmpl   $0x2,0x0(%rip)        # 2e76b77 <MT2063_SetReceiverMode+0x737>	2e76b72: R_X86_64_PC32	.bss+0x14bc25b
0737  2e76b77:	0f 83 b2 11 00 00    	jae    2e77d2f <MT2063_SetReceiverMode+0x18ef>
073d  2e76b7d:	48 8d 6c 24 07       	lea    0x7(%rsp),%rbp
0742  2e76b82:	4c 89 ef             	mov    %r13,%rdi
0745  2e76b85:	be 2f 00 00 00       	mov    $0x2f,%esi
074a  2e76b8a:	48 89 ea             	mov    %rbp,%rdx
074d  2e76b8d:	b9 01 00 00 00       	mov    $0x1,%ecx
0752  2e76b92:	e8 29 f4 ff ff       	call   2e75fc0 <mt2063_write>
0757  2e76b97:	85 c0                	test   %eax,%eax
0759  2e76b99:	0f 88 e3 02 00 00    	js     2e76e82 <MT2063_SetReceiverMode+0xa42>
075f  2e76b9f:	48 c1 ed 03          	shr    $0x3,%rbp
0763  2e76ba3:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
076d  2e76bad:	8a 44 35 00          	mov    0x0(%rbp,%rsi,1),%al
0771  2e76bb1:	84 c0                	test   %al,%al
0773  2e76bb3:	0f 85 6c 24 00 00    	jne    2e79025 <MT2063_SetReceiverMode+0x2be5>
0779  2e76bb9:	8a 5c 24 07          	mov    0x7(%rsp),%bl
077d  2e76bbd:	41 8a 04 36          	mov    (%r14,%rsi,1),%al
0781  2e76bc1:	84 c0                	test   %al,%al
0783  2e76bc3:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
0788  2e76bc8:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
078d  2e76bcd:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
0792  2e76bd2:	0f 85 76 24 00 00    	jne    2e7904e <MT2063_SetReceiverMode+0x2c0e>
0798  2e76bd8:	88 1f                	mov    %bl,(%rdi)
079a  2e76bda:	45 31 c9             	xor    %r9d,%r9d
079d  2e76bdd:	e9 b7 02 00 00       	jmp    2e76e99 <MT2063_SetReceiverMode+0xa59>
07a2  2e76be2:	4c 89 7c 24 40       	mov    %r15,0x40(%rsp)
07a7  2e76be7:	44 89 64 24 20       	mov    %r12d,0x20(%rsp)
07ac  2e76bec:	41 8a 04 36          	mov    (%r14,%rsi,1),%al
07b0  2e76bf0:	84 c0                	test   %al,%al
07b2  2e76bf2:	0f 85 4c 19 00 00    	jne    2e78544 <MT2063_SetReceiverMode+0x2104>
07b8  2e76bf8:	4c 89 e8             	mov    %r13,%rax
07bb  2e76bfb:	45 8a ad 7b 05 00 00 	mov    0x57b(%r13),%r13b
07c2  2e76c02:	49 89 c4             	mov    %rax,%r12
07c5  2e76c05:	4c 8d 90 c4 04 00 00 	lea    0x4c4(%rax),%r10
07cc  2e76c0c:	4d 89 d7             	mov    %r10,%r15
07cf  2e76c0f:	49 c1 ef 03          	shr    $0x3,%r15
07d3  2e76c13:	41 8a 04 37          	mov    (%r15,%rsi,1),%al
07d7  2e76c17:	84 c0                	test   %al,%al
07d9  2e76c19:	0f 85 56 19 00 00    	jne    2e78575 <MT2063_SetReceiverMode+0x2135>
07df  2e76c1f:	41 8b 2a             	mov    (%r10),%ebp
07e2  2e76c22:	48 83 fd 06          	cmp    $0x6,%rbp
07e6  2e76c26:	0f 83 57 28 00 00    	jae    2e79483 <MT2063_SetReceiverMode+0x3043>
07ec  2e76c2c:	41 80 e5 fc          	and    $0xfc,%r13b
07f0  2e76c30:	48 8d ad 00 00 00 00 	lea    0x0(%rbp),%rbp	2e76c33: R_X86_64_32S	.rodata+0x8507a0
07f7  2e76c37:	48 89 e8             	mov    %rbp,%rax
07fa  2e76c3a:	48 c1 e8 03          	shr    $0x3,%rax
07fe  2e76c3e:	8a 04 30             	mov    (%rax,%rsi,1),%al
0801  2e76c41:	84 c0                	test   %al,%al
0803  2e76c43:	0f 85 6a 19 00 00    	jne    2e785b3 <MT2063_SetReceiverMode+0x2173>
0809  2e76c49:	8a 5d 00             	mov    0x0(%rbp),%bl
080c  2e76c4c:	80 e3 03             	and    $0x3,%bl
080f  2e76c4f:	44 08 eb             	or     %r13b,%bl
0812  2e76c52:	41 8a 04 36          	mov    (%r14,%rsi,1),%al
0816  2e76c56:	84 c0                	test   %al,%al
0818  2e76c58:	0f 85 93 19 00 00    	jne    2e785f1 <MT2063_SetReceiverMode+0x21b1>
081e  2e76c5e:	45 31 c9             	xor    %r9d,%r9d
0821  2e76c61:	38 1f                	cmp    %bl,(%rdi)
0823  2e76c63:	4d 89 e5             	mov    %r12,%r13
0826  2e76c66:	44 8b 64 24 20       	mov    0x20(%rsp),%r12d
082b  2e76c6b:	0f 84 40 03 00 00    	je     2e76fb1 <MT2063_SetReceiverMode+0xb71>
0831  2e76c71:	4c 89 54 24 38       	mov    %r10,0x38(%rsp)
0836  2e76c76:	48 89 7c 24 18       	mov    %rdi,0x18(%rsp)
083b  2e76c7b:	48 8d 44 24 07       	lea    0x7(%rsp),%rax
0840  2e76c80:	48 c1 e8 03          	shr    $0x3,%rax
0844  2e76c84:	8a 04 30             	mov    (%rax,%rsi,1),%al
0847  2e76c87:	84 c0                	test   %al,%al
0849  2e76c89:	0f 85 59 20 00 00    	jne    2e78ce8 <MT2063_SetReceiverMode+0x28a8>
084f  2e76c8f:	88 5c 24 07          	mov    %bl,0x7(%rsp)
0853  2e76c93:	83 3d 00 00 00 00 02 	cmpl   $0x2,0x0(%rip)        # 2e76c9a <MT2063_SetReceiverMode+0x85a>	2e76c95: R_X86_64_PC32	.bss+0x14bc25b
085a  2e76c9a:	0f 83 a7 10 00 00    	jae    2e77d47 <MT2063_SetReceiverMode+0x1907>
0860  2e76ca0:	48 8d 6c 24 07       	lea    0x7(%rsp),%rbp
0865  2e76ca5:	4c 89 ef             	mov    %r13,%rdi
0868  2e76ca8:	be 2f 00 00 00       	mov    $0x2f,%esi
086d  2e76cad:	48 89 ea             	mov    %rbp,%rdx
0870  2e76cb0:	b9 01 00 00 00       	mov    $0x1,%ecx
0875  2e76cb5:	e8 06 f3 ff ff       	call   2e75fc0 <mt2063_write>
087a  2e76cba:	85 c0                	test   %eax,%eax
087c  2e76cbc:	0f 88 d3 02 00 00    	js     2e76f95 <MT2063_SetReceiverMode+0xb55>
0882  2e76cc2:	48 c1 ed 03          	shr    $0x3,%rbp
0886  2e76cc6:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
0890  2e76cd0:	8a 44 35 00          	mov    0x0(%rbp,%rsi,1),%al
0894  2e76cd4:	84 c0                	test   %al,%al
0896  2e76cd6:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
089b  2e76cdb:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
08a0  2e76ce0:	4c 8b 54 24 38       	mov    0x38(%rsp),%r10
08a5  2e76ce5:	0f 85 98 23 00 00    	jne    2e79083 <MT2063_SetReceiverMode+0x2c43>
08ab  2e76ceb:	8a 5c 24 07          	mov    0x7(%rsp),%bl
08af  2e76cef:	41 8a 04 36          	mov    (%r14,%rsi,1),%al
08b3  2e76cf3:	84 c0                	test   %al,%al
08b5  2e76cf5:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
08ba  2e76cfa:	0f 85 bb 23 00 00    	jne    2e790bb <MT2063_SetReceiverMode+0x2c7b>
08c0  2e76d00:	88 1f                	mov    %bl,(%rdi)
08c2  2e76d02:	45 31 c9             	xor    %r9d,%r9d
08c5  2e76d05:	e9 a7 02 00 00       	jmp    2e76fb1 <MT2063_SetReceiverMode+0xb71>
08ca  2e76d0a:	41 89 c1             	mov    %eax,%r9d
08cd  2e76d0d:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
08d7  2e76d17:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
08dc  2e76d1c:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
08e1  2e76d21:	8a 04 32             	mov    (%rdx,%rsi,1),%al
08e4  2e76d24:	84 c0                	test   %al,%al
08e6  2e76d26:	0f 85 fc 18 00 00    	jne    2e78628 <MT2063_SetReceiverMode+0x21e8>
08ec  2e76d2c:	41 8a 07             	mov    (%r15),%al
08ef  2e76d2f:	89 c3                	mov    %eax,%ebx
08f1  2e76d31:	80 cb 03             	or     $0x3,%bl
08f4  2e76d34:	38 d8                	cmp    %bl,%al
08f6  2e76d36:	0f 84 7f 03 00 00    	je     2e770bb <MT2063_SetReceiverMode+0xc7b>
08fc  2e76d3c:	48 8d 44 24 07       	lea    0x7(%rsp),%rax
0901  2e76d41:	48 c1 e8 03          	shr    $0x3,%rax
0905  2e76d45:	8a 04 30             	mov    (%rax,%rsi,1),%al
0908  2e76d48:	84 c0                	test   %al,%al
090a  2e76d4a:	0f 85 b7 1f 00 00    	jne    2e78d07 <MT2063_SetReceiverMode+0x28c7>
0910  2e76d50:	45 89 ce             	mov    %r9d,%r14d
0913  2e76d53:	88 5c 24 07          	mov    %bl,0x7(%rsp)
0917  2e76d57:	83 3d 00 00 00 00 02 	cmpl   $0x2,0x0(%rip)        # 2e76d5e <MT2063_SetReceiverMode+0x91e>	2e76d59: R_X86_64_PC32	.bss+0x14bc25b
091e  2e76d5e:	0f 83 fb 0f 00 00    	jae    2e77d5f <MT2063_SetReceiverMode+0x191f>
0924  2e76d64:	48 8d 6c 24 07       	lea    0x7(%rsp),%rbp
0929  2e76d69:	4c 89 ef             	mov    %r13,%rdi
092c  2e76d6c:	be 30 00 00 00       	mov    $0x30,%esi
0931  2e76d71:	48 89 ea             	mov    %rbp,%rdx
0934  2e76d74:	b9 01 00 00 00       	mov    $0x1,%ecx
0939  2e76d79:	e8 42 f2 ff ff       	call   2e75fc0 <mt2063_write>
093e  2e76d7e:	85 c0                	test   %eax,%eax
0940  2e76d80:	0f 88 20 03 00 00    	js     2e770a6 <MT2063_SetReceiverMode+0xc66>
0946  2e76d86:	48 c1 ed 03          	shr    $0x3,%rbp
094a  2e76d8a:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
0954  2e76d94:	8a 44 35 00          	mov    0x0(%rbp,%rsi,1),%al
0958  2e76d98:	84 c0                	test   %al,%al
095a  2e76d9a:	45 89 f1             	mov    %r14d,%r9d
095d  2e76d9d:	0f 85 52 23 00 00    	jne    2e790f5 <MT2063_SetReceiverMode+0x2cb5>
0963  2e76da3:	8a 5c 24 07          	mov    0x7(%rsp),%bl
0967  2e76da7:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
096c  2e76dac:	8a 04 30             	mov    (%rax,%rsi,1),%al
096f  2e76daf:	84 c0                	test   %al,%al
0971  2e76db1:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
0976  2e76db6:	0f 85 65 23 00 00    	jne    2e79121 <MT2063_SetReceiverMode+0x2ce1>
097c  2e76dbc:	41 88 1f             	mov    %bl,(%r15)
097f  2e76dbf:	31 c0                	xor    %eax,%eax
0981  2e76dc1:	e9 f2 02 00 00       	jmp    2e770b8 <MT2063_SetReceiverMode+0xc78>
0986  2e76dc6:	41 89 c1             	mov    %eax,%r9d
0989  2e76dc9:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
0993  2e76dd3:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
0998  2e76dd8:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
099d  2e76ddd:	8a 04 32             	mov    (%rdx,%rsi,1),%al
09a0  2e76de0:	84 c0                	test   %al,%al
09a2  2e76de2:	0f 85 70 18 00 00    	jne    2e78658 <MT2063_SetReceiverMode+0x2218>
09a8  2e76de8:	41 8a 07             	mov    (%r15),%al
09ab  2e76deb:	89 c3                	mov    %eax,%ebx
09ad  2e76ded:	80 cb 03             	or     $0x3,%bl
09b0  2e76df0:	38 d8                	cmp    %bl,%al
09b2  2e76df2:	0f 84 98 03 00 00    	je     2e77190 <MT2063_SetReceiverMode+0xd50>
09b8  2e76df8:	48 8d 44 24 07       	lea    0x7(%rsp),%rax
09bd  2e76dfd:	48 c1 e8 03          	shr    $0x3,%rax
09c1  2e76e01:	8a 04 30             	mov    (%rax,%rsi,1),%al
09c4  2e76e04:	84 c0                	test   %al,%al
09c6  2e76e06:	0f 85 20 1f 00 00    	jne    2e78d2c <MT2063_SetReceiverMode+0x28ec>
09cc  2e76e0c:	45 89 ce             	mov    %r9d,%r14d
09cf  2e76e0f:	88 5c 24 07          	mov    %bl,0x7(%rsp)
09d3  2e76e13:	83 3d 00 00 00 00 02 	cmpl   $0x2,0x0(%rip)        # 2e76e1a <MT2063_SetReceiverMode+0x9da>	2e76e15: R_X86_64_PC32	.bss+0x14bc25b
09da  2e76e1a:	0f 83 57 0f 00 00    	jae    2e77d77 <MT2063_SetReceiverMode+0x1937>
09e0  2e76e20:	48 8d 6c 24 07       	lea    0x7(%rsp),%rbp
09e5  2e76e25:	4c 89 ef             	mov    %r13,%rdi
09e8  2e76e28:	be 30 00 00 00       	mov    $0x30,%esi
09ed  2e76e2d:	48 89 ea             	mov    %rbp,%rdx
09f0  2e76e30:	b9 01 00 00 00       	mov    $0x1,%ecx
09f5  2e76e35:	e8 86 f1 ff ff       	call   2e75fc0 <mt2063_write>
09fa  2e76e3a:	85 c0                	test   %eax,%eax
09fc  2e76e3c:	0f 88 39 03 00 00    	js     2e7717b <MT2063_SetReceiverMode+0xd3b>
0a02  2e76e42:	48 c1 ed 03          	shr    $0x3,%rbp
0a06  2e76e46:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
0a10  2e76e50:	8a 44 35 00          	mov    0x0(%rbp,%rsi,1),%al
0a14  2e76e54:	84 c0                	test   %al,%al
0a16  2e76e56:	0f 85 f2 22 00 00    	jne    2e7914e <MT2063_SetReceiverMode+0x2d0e>
0a1c  2e76e5c:	8a 5c 24 07          	mov    0x7(%rsp),%bl
0a20  2e76e60:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
0a25  2e76e65:	8a 04 30             	mov    (%rax,%rsi,1),%al
0a28  2e76e68:	84 c0                	test   %al,%al
0a2a  2e76e6a:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
0a2f  2e76e6f:	45 89 f1             	mov    %r14d,%r9d
0a32  2e76e72:	0f 85 ff 22 00 00    	jne    2e79177 <MT2063_SetReceiverMode+0x2d37>
0a38  2e76e78:	41 88 1f             	mov    %bl,(%r15)
0a3b  2e76e7b:	31 c0                	xor    %eax,%eax
0a3d  2e76e7d:	e9 0b 03 00 00       	jmp    2e7718d <MT2063_SetReceiverMode+0xd4d>
0a42  2e76e82:	41 89 c1             	mov    %eax,%r9d
0a45  2e76e85:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
0a4f  2e76e8f:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
0a54  2e76e94:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
0a59  2e76e99:	8a 04 32             	mov    (%rdx,%rsi,1),%al
0a5c  2e76e9c:	84 c0                	test   %al,%al
0a5e  2e76e9e:	0f 85 e4 17 00 00    	jne    2e78688 <MT2063_SetReceiverMode+0x2248>
0a64  2e76ea4:	45 8a b5 7c 05 00 00 	mov    0x57c(%r13),%r14b
0a6b  2e76eab:	49 8d ad c4 04 00 00 	lea    0x4c4(%r13),%rbp
0a72  2e76eb2:	48 89 e8             	mov    %rbp,%rax
0a75  2e76eb5:	48 c1 e8 03          	shr    $0x3,%rax
0a79  2e76eb9:	8a 04 30             	mov    (%rax,%rsi,1),%al
0a7c  2e76ebc:	84 c0                	test   %al,%al
0a7e  2e76ebe:	0f 85 f9 17 00 00    	jne    2e786bd <MT2063_SetReceiverMode+0x227d>
0a84  2e76ec4:	8b 6d 00             	mov    0x0(%rbp),%ebp
0a87  2e76ec7:	48 83 fd 06          	cmp    $0x6,%rbp
0a8b  2e76ecb:	0f 83 ea 25 00 00    	jae    2e794bb <MT2063_SetReceiverMode+0x307b>
0a91  2e76ed1:	41 80 e6 fc          	and    $0xfc,%r14b
0a95  2e76ed5:	48 8d ad 00 00 00 00 	lea    0x0(%rbp),%rbp	2e76ed8: R_X86_64_32S	.rodata+0x8507c0
0a9c  2e76edc:	48 89 e8             	mov    %rbp,%rax
0a9f  2e76edf:	48 c1 e8 03          	shr    $0x3,%rax
0aa3  2e76ee3:	8a 04 30             	mov    (%rax,%rsi,1),%al
0aa6  2e76ee6:	84 c0                	test   %al,%al
0aa8  2e76ee8:	0f 85 06 18 00 00    	jne    2e786f4 <MT2063_SetReceiverMode+0x22b4>
0aae  2e76eee:	8a 5d 00             	mov    0x0(%rbp),%bl
0ab1  2e76ef1:	80 e3 03             	and    $0x3,%bl
0ab4  2e76ef4:	44 08 f3             	or     %r14b,%bl
0ab7  2e76ef7:	8a 04 32             	mov    (%rdx,%rsi,1),%al
0aba  2e76efa:	84 c0                	test   %al,%al
0abc  2e76efc:	0f 85 26 18 00 00    	jne    2e78728 <MT2063_SetReceiverMode+0x22e8>
0ac2  2e76f02:	41 38 1f             	cmp    %bl,(%r15)
0ac5  2e76f05:	0f 84 5a 03 00 00    	je     2e77265 <MT2063_SetReceiverMode+0xe25>
0acb  2e76f0b:	48 8d 44 24 07       	lea    0x7(%rsp),%rax
0ad0  2e76f10:	48 c1 e8 03          	shr    $0x3,%rax
0ad4  2e76f14:	8a 04 30             	mov    (%rax,%rsi,1),%al
0ad7  2e76f17:	84 c0                	test   %al,%al
0ad9  2e76f19:	0f 85 32 1e 00 00    	jne    2e78d51 <MT2063_SetReceiverMode+0x2911>
0adf  2e76f1f:	45 89 ce             	mov    %r9d,%r14d
0ae2  2e76f22:	88 5c 24 07          	mov    %bl,0x7(%rsp)
0ae6  2e76f26:	83 3d 00 00 00 00 02 	cmpl   $0x2,0x0(%rip)        # 2e76f2d <MT2063_SetReceiverMode+0xaed>	2e76f28: R_X86_64_PC32	.bss+0x14bc25b
0aed  2e76f2d:	0f 83 5c 0e 00 00    	jae    2e77d8f <MT2063_SetReceiverMode+0x194f>
0af3  2e76f33:	48 8d 6c 24 07       	lea    0x7(%rsp),%rbp
0af8  2e76f38:	4c 89 ef             	mov    %r13,%rdi
0afb  2e76f3b:	be 30 00 00 00       	mov    $0x30,%esi
0b00  2e76f40:	48 89 ea             	mov    %rbp,%rdx
0b03  2e76f43:	b9 01 00 00 00       	mov    $0x1,%ecx
0b08  2e76f48:	e8 73 f0 ff ff       	call   2e75fc0 <mt2063_write>
0b0d  2e76f4d:	85 c0                	test   %eax,%eax
0b0f  2e76f4f:	0f 88 fb 02 00 00    	js     2e77250 <MT2063_SetReceiverMode+0xe10>
0b15  2e76f55:	48 c1 ed 03          	shr    $0x3,%rbp
0b19  2e76f59:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
0b23  2e76f63:	8a 44 35 00          	mov    0x0(%rbp,%rsi,1),%al
0b27  2e76f67:	84 c0                	test   %al,%al
0b29  2e76f69:	0f 85 35 22 00 00    	jne    2e791a4 <MT2063_SetReceiverMode+0x2d64>
0b2f  2e76f6f:	8a 5c 24 07          	mov    0x7(%rsp),%bl
0b33  2e76f73:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
0b38  2e76f78:	8a 04 30             	mov    (%rax,%rsi,1),%al
0b3b  2e76f7b:	84 c0                	test   %al,%al
0b3d  2e76f7d:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
0b42  2e76f82:	45 89 f1             	mov    %r14d,%r9d
0b45  2e76f85:	0f 85 42 22 00 00    	jne    2e791cd <MT2063_SetReceiverMode+0x2d8d>
0b4b  2e76f8b:	41 88 1f             	mov    %bl,(%r15)
0b4e  2e76f8e:	31 c0                	xor    %eax,%eax
0b50  2e76f90:	e9 cd 02 00 00       	jmp    2e77262 <MT2063_SetReceiverMode+0xe22>
0b55  2e76f95:	41 89 c1             	mov    %eax,%r9d
0b58  2e76f98:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
0b62  2e76fa2:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
0b67  2e76fa7:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
0b6c  2e76fac:	4c 8b 54 24 38       	mov    0x38(%rsp),%r10
0b71  2e76fb1:	8a 04 32             	mov    (%rdx,%rsi,1),%al
0b74  2e76fb4:	84 c0                	test   %al,%al
0b76  2e76fb6:	0f 85 9c 17 00 00    	jne    2e78758 <MT2063_SetReceiverMode+0x2318>
0b7c  2e76fbc:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
0b81  2e76fc1:	44 8a 30             	mov    (%rax),%r14b
0b84  2e76fc4:	41 8a 04 37          	mov    (%r15,%rsi,1),%al
0b88  2e76fc8:	84 c0                	test   %al,%al
0b8a  2e76fca:	0f 85 c7 17 00 00    	jne    2e78797 <MT2063_SetReceiverMode+0x2357>
0b90  2e76fd0:	41 8b 2a             	mov    (%r10),%ebp
0b93  2e76fd3:	48 83 fd 06          	cmp    $0x6,%rbp
0b97  2e76fd7:	0f 83 0c 25 00 00    	jae    2e794e9 <MT2063_SetReceiverMode+0x30a9>
0b9d  2e76fdd:	41 80 e6 fc          	and    $0xfc,%r14b
0ba1  2e76fe1:	48 8d ad 00 00 00 00 	lea    0x0(%rbp),%rbp	2e76fe4: R_X86_64_32S	.rodata+0x8507c0
0ba8  2e76fe8:	48 89 e8             	mov    %rbp,%rax
0bab  2e76feb:	48 c1 e8 03          	shr    $0x3,%rax
0baf  2e76fef:	8a 04 30             	mov    (%rax,%rsi,1),%al
0bb2  2e76ff2:	84 c0                	test   %al,%al
0bb4  2e76ff4:	4c 8b 7c 24 40       	mov    0x40(%rsp),%r15
0bb9  2e76ff9:	0f 85 d6 17 00 00    	jne    2e787d5 <MT2063_SetReceiverMode+0x2395>
0bbf  2e76fff:	8a 5d 00             	mov    0x0(%rbp),%bl
0bc2  2e77002:	80 e3 03             	and    $0x3,%bl
0bc5  2e77005:	44 08 f3             	or     %r14b,%bl
0bc8  2e77008:	8a 04 32             	mov    (%rdx,%rsi,1),%al
0bcb  2e7700b:	84 c0                	test   %al,%al
0bcd  2e7700d:	0f 85 f6 17 00 00    	jne    2e78809 <MT2063_SetReceiverMode+0x23c9>
0bd3  2e77013:	41 38 1f             	cmp    %bl,(%r15)
0bd6  2e77016:	0f 84 1e 03 00 00    	je     2e7733a <MT2063_SetReceiverMode+0xefa>
0bdc  2e7701c:	48 8d 44 24 07       	lea    0x7(%rsp),%rax
0be1  2e77021:	48 c1 e8 03          	shr    $0x3,%rax
0be5  2e77025:	8a 04 30             	mov    (%rax,%rsi,1),%al
0be8  2e77028:	84 c0                	test   %al,%al
0bea  2e7702a:	0f 85 46 1d 00 00    	jne    2e78d76 <MT2063_SetReceiverMode+0x2936>
0bf0  2e77030:	45 89 ce             	mov    %r9d,%r14d
0bf3  2e77033:	88 5c 24 07          	mov    %bl,0x7(%rsp)
0bf7  2e77037:	83 3d 00 00 00 00 02 	cmpl   $0x2,0x0(%rip)        # 2e7703e <MT2063_SetReceiverMode+0xbfe>	2e77039: R_X86_64_PC32	.bss+0x14bc25b
0bfe  2e7703e:	0f 83 63 0d 00 00    	jae    2e77da7 <MT2063_SetReceiverMode+0x1967>
0c04  2e77044:	48 8d 6c 24 07       	lea    0x7(%rsp),%rbp
0c09  2e77049:	4c 89 ef             	mov    %r13,%rdi
0c0c  2e7704c:	be 30 00 00 00       	mov    $0x30,%esi
0c11  2e77051:	48 89 ea             	mov    %rbp,%rdx
0c14  2e77054:	b9 01 00 00 00       	mov    $0x1,%ecx
0c19  2e77059:	e8 62 ef ff ff       	call   2e75fc0 <mt2063_write>
0c1e  2e7705e:	85 c0                	test   %eax,%eax
0c20  2e77060:	0f 88 bf 02 00 00    	js     2e77325 <MT2063_SetReceiverMode+0xee5>
0c26  2e77066:	48 c1 ed 03          	shr    $0x3,%rbp
0c2a  2e7706a:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
0c34  2e77074:	8a 44 35 00          	mov    0x0(%rbp,%rsi,1),%al
0c38  2e77078:	84 c0                	test   %al,%al
0c3a  2e7707a:	0f 85 7a 21 00 00    	jne    2e791fa <MT2063_SetReceiverMode+0x2dba>
0c40  2e77080:	8a 5c 24 07          	mov    0x7(%rsp),%bl
0c44  2e77084:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
0c49  2e77089:	8a 04 30             	mov    (%rax,%rsi,1),%al
0c4c  2e7708c:	84 c0                	test   %al,%al
0c4e  2e7708e:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
0c53  2e77093:	45 89 f1             	mov    %r14d,%r9d
0c56  2e77096:	0f 85 87 21 00 00    	jne    2e79223 <MT2063_SetReceiverMode+0x2de3>
0c5c  2e7709c:	41 88 1f             	mov    %bl,(%r15)
0c5f  2e7709f:	31 c0                	xor    %eax,%eax
0c61  2e770a1:	e9 91 02 00 00       	jmp    2e77337 <MT2063_SetReceiverMode+0xef7>
0c66  2e770a6:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
0c70  2e770b0:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
0c75  2e770b5:	45 89 f1             	mov    %r14d,%r9d
0c78  2e770b8:	41 09 c1             	or     %eax,%r9d
0c7b  2e770bb:	4d 8d b5 6c 05 00 00 	lea    0x56c(%r13),%r14
0c82  2e770c2:	4c 89 f5             	mov    %r14,%rbp
0c85  2e770c5:	48 c1 ed 03          	shr    $0x3,%rbp
0c89  2e770c9:	8a 44 35 00          	mov    0x0(%rbp,%rsi,1),%al
0c8d  2e770cd:	84 c0                	test   %al,%al
0c8f  2e770cf:	0f 85 64 17 00 00    	jne    2e78839 <MT2063_SetReceiverMode+0x23f9>
0c95  2e770d5:	41 8a 06             	mov    (%r14),%al
0c98  2e770d8:	89 c3                	mov    %eax,%ebx
0c9a  2e770da:	80 e3 bf             	and    $0xbf,%bl
0c9d  2e770dd:	38 d8                	cmp    %bl,%al
0c9f  2e770df:	0f 84 12 03 00 00    	je     2e773f7 <MT2063_SetReceiverMode+0xfb7>
0ca5  2e770e5:	48 8d 44 24 07       	lea    0x7(%rsp),%rax
0caa  2e770ea:	48 c1 e8 03          	shr    $0x3,%rax
0cae  2e770ee:	8a 04 30             	mov    (%rax,%rsi,1),%al
0cb1  2e770f1:	84 c0                	test   %al,%al
0cb3  2e770f3:	0f 85 a2 1c 00 00    	jne    2e78d9b <MT2063_SetReceiverMode+0x295b>
0cb9  2e770f9:	45 89 cf             	mov    %r9d,%r15d
0cbc  2e770fc:	88 5c 24 07          	mov    %bl,0x7(%rsp)
0cc0  2e77100:	83 3d 00 00 00 00 02 	cmpl   $0x2,0x0(%rip)        # 2e77107 <MT2063_SetReceiverMode+0xcc7>	2e77102: R_X86_64_PC32	.bss+0x14bc25b
0cc7  2e77107:	0f 83 b2 0c 00 00    	jae    2e77dbf <MT2063_SetReceiverMode+0x197f>
0ccd  2e7710d:	48 8d 5c 24 07       	lea    0x7(%rsp),%rbx
0cd2  2e77112:	4c 89 ef             	mov    %r13,%rdi
0cd5  2e77115:	be 20 00 00 00       	mov    $0x20,%esi
0cda  2e7711a:	48 89 da             	mov    %rbx,%rdx
0cdd  2e7711d:	b9 01 00 00 00       	mov    $0x1,%ecx
0ce2  2e77122:	e8 99 ee ff ff       	call   2e75fc0 <mt2063_write>
0ce7  2e77127:	85 c0                	test   %eax,%eax
0ce9  2e77129:	0f 88 b3 02 00 00    	js     2e773e2 <MT2063_SetReceiverMode+0xfa2>
0cef  2e7712f:	48 c1 eb 03          	shr    $0x3,%rbx
0cf3  2e77133:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
0cfd  2e7713d:	8a 04 33             	mov    (%rbx,%rsi,1),%al
0d00  2e77140:	84 c0                	test   %al,%al
0d02  2e77142:	0f 85 08 21 00 00    	jne    2e79250 <MT2063_SetReceiverMode+0x2e10>
0d08  2e77148:	8a 5c 24 07          	mov    0x7(%rsp),%bl
0d0c  2e7714c:	8a 44 35 00          	mov    0x0(%rbp,%rsi,1),%al
0d10  2e77150:	84 c0                	test   %al,%al
0d12  2e77152:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
0d17  2e77157:	45 89 f9             	mov    %r15d,%r9d
0d1a  2e7715a:	0f 84 7b 02 00 00    	je     2e773db <MT2063_SetReceiverMode+0xf9b>
0d20  2e77160:	44 89 f1             	mov    %r14d,%ecx
0d23  2e77163:	80 e1 07             	and    $0x7,%cl
0d26  2e77166:	38 c1                	cmp    %al,%cl
0d28  2e77168:	0f 8c 6d 02 00 00    	jl     2e773db <MT2063_SetReceiverMode+0xf9b>
0d2e  2e7716e:	4c 89 f7             	mov    %r14,%rdi
0d31  2e77171:	e8 00 00 00 00       	call   2e77176 <MT2063_SetReceiverMode+0xd36>	2e77172: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
0d36  2e77176:	e9 94 21 00 00       	jmp    2e7930f <MT2063_SetReceiverMode+0x2ecf>
0d3b  2e7717b:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
0d45  2e77185:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
0d4a  2e7718a:	45 89 f1             	mov    %r14d,%r9d
0d4d  2e7718d:	41 09 c1             	or     %eax,%r9d
0d50  2e77190:	4d 8d b5 6c 05 00 00 	lea    0x56c(%r13),%r14
0d57  2e77197:	4c 89 f5             	mov    %r14,%rbp
0d5a  2e7719a:	48 c1 ed 03          	shr    $0x3,%rbp
0d5e  2e7719e:	8a 44 35 00          	mov    0x0(%rbp,%rsi,1),%al
0d62  2e771a2:	84 c0                	test   %al,%al
0d64  2e771a4:	0f 85 bf 16 00 00    	jne    2e78869 <MT2063_SetReceiverMode+0x2429>
0d6a  2e771aa:	41 8a 06             	mov    (%r14),%al
0d6d  2e771ad:	89 c3                	mov    %eax,%ebx
0d6f  2e771af:	80 e3 bf             	and    $0xbf,%bl
0d72  2e771b2:	38 d8                	cmp    %bl,%al
0d74  2e771b4:	0f 84 3d 02 00 00    	je     2e773f7 <MT2063_SetReceiverMode+0xfb7>
0d7a  2e771ba:	48 8d 44 24 07       	lea    0x7(%rsp),%rax
0d7f  2e771bf:	48 c1 e8 03          	shr    $0x3,%rax
0d83  2e771c3:	8a 04 30             	mov    (%rax,%rsi,1),%al
0d86  2e771c6:	84 c0                	test   %al,%al
0d88  2e771c8:	0f 85 f2 1b 00 00    	jne    2e78dc0 <MT2063_SetReceiverMode+0x2980>
0d8e  2e771ce:	45 89 cf             	mov    %r9d,%r15d
0d91  2e771d1:	88 5c 24 07          	mov    %bl,0x7(%rsp)
0d95  2e771d5:	83 3d 00 00 00 00 02 	cmpl   $0x2,0x0(%rip)        # 2e771dc <MT2063_SetReceiverMode+0xd9c>	2e771d7: R_X86_64_PC32	.bss+0x14bc25b
0d9c  2e771dc:	0f 83 f5 0b 00 00    	jae    2e77dd7 <MT2063_SetReceiverMode+0x1997>
0da2  2e771e2:	48 8d 5c 24 07       	lea    0x7(%rsp),%rbx
0da7  2e771e7:	4c 89 ef             	mov    %r13,%rdi
0daa  2e771ea:	be 20 00 00 00       	mov    $0x20,%esi
0daf  2e771ef:	48 89 da             	mov    %rbx,%rdx
0db2  2e771f2:	b9 01 00 00 00       	mov    $0x1,%ecx
0db7  2e771f7:	e8 c4 ed ff ff       	call   2e75fc0 <mt2063_write>
0dbc  2e771fc:	85 c0                	test   %eax,%eax
0dbe  2e771fe:	0f 88 de 01 00 00    	js     2e773e2 <MT2063_SetReceiverMode+0xfa2>
0dc4  2e77204:	48 c1 eb 03          	shr    $0x3,%rbx
0dc8  2e77208:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
0dd2  2e77212:	8a 04 33             	mov    (%rbx,%rsi,1),%al
0dd5  2e77215:	84 c0                	test   %al,%al
0dd7  2e77217:	0f 85 5c 20 00 00    	jne    2e79279 <MT2063_SetReceiverMode+0x2e39>
0ddd  2e7721d:	8a 5c 24 07          	mov    0x7(%rsp),%bl
0de1  2e77221:	8a 44 35 00          	mov    0x0(%rbp,%rsi,1),%al
0de5  2e77225:	84 c0                	test   %al,%al
0de7  2e77227:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
0dec  2e7722c:	45 89 f9             	mov    %r15d,%r9d
0def  2e7722f:	0f 84 a6 01 00 00    	je     2e773db <MT2063_SetReceiverMode+0xf9b>
0df5  2e77235:	44 89 f1             	mov    %r14d,%ecx
0df8  2e77238:	80 e1 07             	and    $0x7,%cl
0dfb  2e7723b:	38 c1                	cmp    %al,%cl
0dfd  2e7723d:	0f 8c 98 01 00 00    	jl     2e773db <MT2063_SetReceiverMode+0xf9b>
0e03  2e77243:	4c 89 f7             	mov    %r14,%rdi
0e06  2e77246:	e8 00 00 00 00       	call   2e7724b <MT2063_SetReceiverMode+0xe0b>	2e77247: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
0e0b  2e7724b:	e9 bf 20 00 00       	jmp    2e7930f <MT2063_SetReceiverMode+0x2ecf>
0e10  2e77250:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
0e1a  2e7725a:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
0e1f  2e7725f:	45 89 f1             	mov    %r14d,%r9d
0e22  2e77262:	41 09 c1             	or     %eax,%r9d
0e25  2e77265:	4d 8d b5 6c 05 00 00 	lea    0x56c(%r13),%r14
0e2c  2e7726c:	4c 89 f5             	mov    %r14,%rbp
0e2f  2e7726f:	48 c1 ed 03          	shr    $0x3,%rbp
0e33  2e77273:	8a 44 35 00          	mov    0x0(%rbp,%rsi,1),%al
0e37  2e77277:	84 c0                	test   %al,%al
0e39  2e77279:	0f 85 1a 16 00 00    	jne    2e78899 <MT2063_SetReceiverMode+0x2459>
0e3f  2e7727f:	41 8a 06             	mov    (%r14),%al
0e42  2e77282:	89 c3                	mov    %eax,%ebx
0e44  2e77284:	80 cb 40             	or     $0x40,%bl
0e47  2e77287:	38 d8                	cmp    %bl,%al
0e49  2e77289:	0f 84 68 01 00 00    	je     2e773f7 <MT2063_SetReceiverMode+0xfb7>
0e4f  2e7728f:	48 8d 44 24 07       	lea    0x7(%rsp),%rax
0e54  2e77294:	48 c1 e8 03          	shr    $0x3,%rax
0e58  2e77298:	8a 04 30             	mov    (%rax,%rsi,1),%al
0e5b  2e7729b:	84 c0                	test   %al,%al
0e5d  2e7729d:	0f 85 42 1b 00 00    	jne    2e78de5 <MT2063_SetReceiverMode+0x29a5>
0e63  2e772a3:	45 89 cf             	mov    %r9d,%r15d
0e66  2e772a6:	88 5c 24 07          	mov    %bl,0x7(%rsp)
0e6a  2e772aa:	83 3d 00 00 00 00 02 	cmpl   $0x2,0x0(%rip)        # 2e772b1 <MT2063_SetReceiverMode+0xe71>	2e772ac: R_X86_64_PC32	.bss+0x14bc25b
0e71  2e772b1:	0f 83 38 0b 00 00    	jae    2e77def <MT2063_SetReceiverMode+0x19af>
0e77  2e772b7:	48 8d 5c 24 07       	lea    0x7(%rsp),%rbx
0e7c  2e772bc:	4c 89 ef             	mov    %r13,%rdi
0e7f  2e772bf:	be 20 00 00 00       	mov    $0x20,%esi
0e84  2e772c4:	48 89 da             	mov    %rbx,%rdx
0e87  2e772c7:	b9 01 00 00 00       	mov    $0x1,%ecx
0e8c  2e772cc:	e8 ef ec ff ff       	call   2e75fc0 <mt2063_write>
0e91  2e772d1:	85 c0                	test   %eax,%eax
0e93  2e772d3:	0f 88 09 01 00 00    	js     2e773e2 <MT2063_SetReceiverMode+0xfa2>
0e99  2e772d9:	48 c1 eb 03          	shr    $0x3,%rbx
0e9d  2e772dd:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
0ea7  2e772e7:	8a 04 33             	mov    (%rbx,%rsi,1),%al
0eaa  2e772ea:	84 c0                	test   %al,%al
0eac  2e772ec:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
0eb1  2e772f1:	0f 85 ab 1f 00 00    	jne    2e792a2 <MT2063_SetReceiverMode+0x2e62>
0eb7  2e772f7:	8a 5c 24 07          	mov    0x7(%rsp),%bl
0ebb  2e772fb:	8a 44 35 00          	mov    0x0(%rbp,%rsi,1),%al
0ebf  2e772ff:	84 c0                	test   %al,%al
0ec1  2e77301:	45 89 f9             	mov    %r15d,%r9d
0ec4  2e77304:	0f 84 d1 00 00 00    	je     2e773db <MT2063_SetReceiverMode+0xf9b>
0eca  2e7730a:	44 89 f1             	mov    %r14d,%ecx
0ecd  2e7730d:	80 e1 07             	and    $0x7,%cl
0ed0  2e77310:	38 c1                	cmp    %al,%cl
0ed2  2e77312:	0f 8c c3 00 00 00    	jl     2e773db <MT2063_SetReceiverMode+0xf9b>
0ed8  2e77318:	4c 89 f7             	mov    %r14,%rdi
0edb  2e7731b:	e8 00 00 00 00       	call   2e77320 <MT2063_SetReceiverMode+0xee0>	2e7731c: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
0ee0  2e77320:	e9 ea 1f 00 00       	jmp    2e7930f <MT2063_SetReceiverMode+0x2ecf>
0ee5  2e77325:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
0eef  2e7732f:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
0ef4  2e77334:	45 89 f1             	mov    %r14d,%r9d
0ef7  2e77337:	41 09 c1             	or     %eax,%r9d
0efa  2e7733a:	4d 8d b5 6c 05 00 00 	lea    0x56c(%r13),%r14
0f01  2e77341:	4c 89 f5             	mov    %r14,%rbp
0f04  2e77344:	48 c1 ed 03          	shr    $0x3,%rbp
0f08  2e77348:	8a 44 35 00          	mov    0x0(%rbp,%rsi,1),%al
0f0c  2e7734c:	84 c0                	test   %al,%al
0f0e  2e7734e:	0f 85 75 15 00 00    	jne    2e788c9 <MT2063_SetReceiverMode+0x2489>
0f14  2e77354:	41 8a 06             	mov    (%r14),%al
0f17  2e77357:	89 c3                	mov    %eax,%ebx
0f19  2e77359:	80 cb 40             	or     $0x40,%bl
0f1c  2e7735c:	38 d8                	cmp    %bl,%al
0f1e  2e7735e:	0f 84 93 00 00 00    	je     2e773f7 <MT2063_SetReceiverMode+0xfb7>
0f24  2e77364:	48 8d 44 24 07       	lea    0x7(%rsp),%rax
0f29  2e77369:	48 c1 e8 03          	shr    $0x3,%rax
0f2d  2e7736d:	8a 04 30             	mov    (%rax,%rsi,1),%al
0f30  2e77370:	84 c0                	test   %al,%al
0f32  2e77372:	0f 85 92 1a 00 00    	jne    2e78e0a <MT2063_SetReceiverMode+0x29ca>
0f38  2e77378:	45 89 cf             	mov    %r9d,%r15d
0f3b  2e7737b:	88 5c 24 07          	mov    %bl,0x7(%rsp)
0f3f  2e7737f:	83 3d 00 00 00 00 02 	cmpl   $0x2,0x0(%rip)        # 2e77386 <MT2063_SetReceiverMode+0xf46>	2e77381: R_X86_64_PC32	.bss+0x14bc25b
0f46  2e77386:	0f 83 7b 0a 00 00    	jae    2e77e07 <MT2063_SetReceiverMode+0x19c7>
0f4c  2e7738c:	48 8d 5c 24 07       	lea    0x7(%rsp),%rbx
0f51  2e77391:	4c 89 ef             	mov    %r13,%rdi
0f54  2e77394:	be 20 00 00 00       	mov    $0x20,%esi
0f59  2e77399:	48 89 da             	mov    %rbx,%rdx
0f5c  2e7739c:	b9 01 00 00 00       	mov    $0x1,%ecx
0f61  2e773a1:	e8 1a ec ff ff       	call   2e75fc0 <mt2063_write>
0f66  2e773a6:	85 c0                	test   %eax,%eax
0f68  2e773a8:	78 38                	js     2e773e2 <MT2063_SetReceiverMode+0xfa2>
0f6a  2e773aa:	48 c1 eb 03          	shr    $0x3,%rbx
0f6e  2e773ae:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
0f78  2e773b8:	8a 04 33             	mov    (%rbx,%rsi,1),%al
0f7b  2e773bb:	84 c0                	test   %al,%al
0f7d  2e773bd:	0f 85 0d 1f 00 00    	jne    2e792d0 <MT2063_SetReceiverMode+0x2e90>
0f83  2e773c3:	8a 5c 24 07          	mov    0x7(%rsp),%bl
0f87  2e773c7:	8a 44 35 00          	mov    0x0(%rbp,%rsi,1),%al
0f8b  2e773cb:	84 c0                	test   %al,%al
0f8d  2e773cd:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
0f92  2e773d2:	45 89 f9             	mov    %r15d,%r9d
0f95  2e773d5:	0f 85 1e 1f 00 00    	jne    2e792f9 <MT2063_SetReceiverMode+0x2eb9>
0f9b  2e773db:	41 88 1e             	mov    %bl,(%r14)
0f9e  2e773de:	31 c0                	xor    %eax,%eax
0fa0  2e773e0:	eb 12                	jmp    2e773f4 <MT2063_SetReceiverMode+0xfb4>
0fa2  2e773e2:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
0fac  2e773ec:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
0fb1  2e773f1:	45 89 f9             	mov    %r15d,%r9d
0fb4  2e773f4:	41 09 c1             	or     %eax,%r9d
0fb7  2e773f7:	45 09 e1             	or     %r12d,%r9d
0fba  2e773fa:	0f 88 15 08 00 00    	js     2e77c15 <MT2063_SetReceiverMode+0x17d5>
0fc0  2e77400:	4d 8d b5 63 05 00 00 	lea    0x563(%r13),%r14
0fc7  2e77407:	4c 89 f5             	mov    %r14,%rbp
0fca  2e7740a:	48 c1 ed 03          	shr    $0x3,%rbp
0fce  2e7740e:	8a 44 35 00          	mov    0x0(%rbp,%rsi,1),%al
0fd2  2e77412:	84 c0                	test   %al,%al
0fd4  2e77414:	0f 85 0a 0c 00 00    	jne    2e78024 <MT2063_SetReceiverMode+0x1be4>
0fda  2e7741a:	45 8a 3e             	mov    (%r14),%r15b
0fdd  2e7741d:	45 89 fc             	mov    %r15d,%r12d
0fe0  2e77420:	41 80 e4 e0          	and    $0xe0,%r12b
0fe4  2e77424:	49 8d 98 00 00 00 00 	lea    0x0(%r8),%rbx	2e77427: R_X86_64_32S	.rodata+0x8505e0
0feb  2e7742b:	48 89 d8             	mov    %rbx,%rax
0fee  2e7742e:	48 c1 e8 03          	shr    $0x3,%rax
0ff2  2e77432:	8a 04 30             	mov    (%rax,%rsi,1),%al
0ff5  2e77435:	84 c0                	test   %al,%al
0ff7  2e77437:	0f 85 17 0c 00 00    	jne    2e78054 <MT2063_SetReceiverMode+0x1c14>
0ffd  2e7743d:	8a 1b                	mov    (%rbx),%bl
0fff  2e7743f:	80 e3 1f             	and    $0x1f,%bl
1002  2e77442:	44 08 e3             	or     %r12b,%bl
1005  2e77445:	41 38 df             	cmp    %bl,%r15b
1008  2e77448:	0f 84 a1 00 00 00    	je     2e774ef <MT2063_SetReceiverMode+0x10af>
100e  2e7744e:	48 8d 44 24 07       	lea    0x7(%rsp),%rax
1013  2e77453:	48 c1 e8 03          	shr    $0x3,%rax
1017  2e77457:	8a 04 30             	mov    (%rax,%rsi,1),%al
101a  2e7745a:	84 c0                	test   %al,%al
101c  2e7745c:	0f 85 87 0e 00 00    	jne    2e782e9 <MT2063_SetReceiverMode+0x1ea9>
1022  2e77462:	45 89 cf             	mov    %r9d,%r15d
1025  2e77465:	88 5c 24 07          	mov    %bl,0x7(%rsp)
1029  2e77469:	83 3d 00 00 00 00 02 	cmpl   $0x2,0x0(%rip)        # 2e77470 <MT2063_SetReceiverMode+0x1030>	2e7746b: R_X86_64_PC32	.bss+0x14bc25b
1030  2e77470:	0f 83 11 08 00 00    	jae    2e77c87 <MT2063_SetReceiverMode+0x1847>
1036  2e77476:	48 8d 5c 24 07       	lea    0x7(%rsp),%rbx
103b  2e7747b:	4c 89 ef             	mov    %r13,%rdi
103e  2e7747e:	be 17 00 00 00       	mov    $0x17,%esi
1043  2e77483:	48 89 da             	mov    %rbx,%rdx
1046  2e77486:	b9 01 00 00 00       	mov    $0x1,%ecx
104b  2e7748b:	e8 30 eb ff ff       	call   2e75fc0 <mt2063_write>
1050  2e77490:	85 c0                	test   %eax,%eax
1052  2e77492:	78 40                	js     2e774d4 <MT2063_SetReceiverMode+0x1094>
1054  2e77494:	48 c1 eb 03          	shr    $0x3,%rbx
1058  2e77498:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1062  2e774a2:	8a 04 33             	mov    (%rbx,%rsi,1),%al
1065  2e774a5:	84 c0                	test   %al,%al
1067  2e774a7:	0f 85 c8 15 00 00    	jne    2e78a75 <MT2063_SetReceiverMode+0x2635>
106d  2e774ad:	8a 5c 24 07          	mov    0x7(%rsp),%bl
1071  2e774b1:	8a 44 35 00          	mov    0x0(%rbp,%rsi,1),%al
1075  2e774b5:	84 c0                	test   %al,%al
1077  2e774b7:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
107c  2e774bc:	45 89 f9             	mov    %r15d,%r9d
107f  2e774bf:	0f 85 d9 15 00 00    	jne    2e78a9e <MT2063_SetReceiverMode+0x265e>
1085  2e774c5:	41 88 1e             	mov    %bl,(%r14)
1088  2e774c8:	31 c0                	xor    %eax,%eax
108a  2e774ca:	41 09 c1             	or     %eax,%r9d
108d  2e774cd:	79 20                	jns    2e774ef <MT2063_SetReceiverMode+0x10af>
108f  2e774cf:	e9 41 07 00 00       	jmp    2e77c15 <MT2063_SetReceiverMode+0x17d5>
1094  2e774d4:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
109e  2e774de:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
10a3  2e774e3:	45 89 f9             	mov    %r15d,%r9d
10a6  2e774e6:	41 09 c1             	or     %eax,%r9d
10a9  2e774e9:	0f 88 26 07 00 00    	js     2e77c15 <MT2063_SetReceiverMode+0x17d5>
10af  2e774ef:	49 8d bd 66 05 00 00 	lea    0x566(%r13),%rdi
10b6  2e774f6:	49 89 ff             	mov    %rdi,%r15
10b9  2e774f9:	49 c1 ef 03          	shr    $0x3,%r15
10bd  2e774fd:	41 8a 04 37          	mov    (%r15,%rsi,1),%al
10c1  2e77501:	84 c0                	test   %al,%al
10c3  2e77503:	48 89 7c 24 20       	mov    %rdi,0x20(%rsp)
10c8  2e77508:	0f 85 79 0b 00 00    	jne    2e78087 <MT2063_SetReceiverMode+0x1c47>
10ce  2e7750e:	40 8a 2f             	mov    (%rdi),%bpl
10d1  2e77511:	41 89 ec             	mov    %ebp,%r12d
10d4  2e77514:	41 80 e4 c0          	and    $0xc0,%r12b
10d8  2e77518:	49 8d 98 00 00 00 00 	lea    0x0(%r8),%rbx	2e7751b: R_X86_64_32S	.rodata+0x850600
10df  2e7751f:	48 89 d8             	mov    %rbx,%rax
10e2  2e77522:	48 c1 e8 03          	shr    $0x3,%rax
10e6  2e77526:	8a 04 30             	mov    (%rax,%rsi,1),%al
10e9  2e77529:	84 c0                	test   %al,%al
10eb  2e7752b:	0f 85 87 0b 00 00    	jne    2e780b8 <MT2063_SetReceiverMode+0x1c78>
10f1  2e77531:	8a 1b                	mov    (%rbx),%bl
10f3  2e77533:	80 e3 3f             	and    $0x3f,%bl
10f6  2e77536:	44 08 e3             	or     %r12b,%bl
10f9  2e77539:	40 38 dd             	cmp    %bl,%bpl
10fc  2e7753c:	0f 84 a5 00 00 00    	je     2e775e7 <MT2063_SetReceiverMode+0x11a7>
1102  2e77542:	48 8d 44 24 07       	lea    0x7(%rsp),%rax
1107  2e77547:	48 c1 e8 03          	shr    $0x3,%rax
110b  2e7754b:	8a 04 30             	mov    (%rax,%rsi,1),%al
110e  2e7754e:	84 c0                	test   %al,%al
1110  2e77550:	0f 85 9a 0e 00 00    	jne    2e783f0 <MT2063_SetReceiverMode+0x1fb0>
1116  2e77556:	44 89 cd             	mov    %r9d,%ebp
1119  2e77559:	88 5c 24 07          	mov    %bl,0x7(%rsp)
111d  2e7755d:	83 3d 00 00 00 00 02 	cmpl   $0x2,0x0(%rip)        # 2e77564 <MT2063_SetReceiverMode+0x1124>	2e7755f: R_X86_64_PC32	.bss+0x14bc25b
1124  2e77564:	0f 83 35 07 00 00    	jae    2e77c9f <MT2063_SetReceiverMode+0x185f>
112a  2e7756a:	48 8d 5c 24 07       	lea    0x7(%rsp),%rbx
112f  2e7756f:	4c 89 ef             	mov    %r13,%rdi
1132  2e77572:	be 1a 00 00 00       	mov    $0x1a,%esi
1137  2e77577:	48 89 da             	mov    %rbx,%rdx
113a  2e7757a:	b9 01 00 00 00       	mov    $0x1,%ecx
113f  2e7757f:	e8 3c ea ff ff       	call   2e75fc0 <mt2063_write>
1144  2e77584:	85 c0                	test   %eax,%eax
1146  2e77586:	78 44                	js     2e775cc <MT2063_SetReceiverMode+0x118c>
1148  2e77588:	48 c1 eb 03          	shr    $0x3,%rbx
114c  2e7758c:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1156  2e77596:	8a 04 33             	mov    (%rbx,%rsi,1),%al
1159  2e77599:	84 c0                	test   %al,%al
115b  2e7759b:	0f 85 b2 15 00 00    	jne    2e78b53 <MT2063_SetReceiverMode+0x2713>
1161  2e775a1:	8a 5c 24 07          	mov    0x7(%rsp),%bl
1165  2e775a5:	41 8a 04 37          	mov    (%r15,%rsi,1),%al
1169  2e775a9:	84 c0                	test   %al,%al
116b  2e775ab:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
1170  2e775b0:	41 89 e9             	mov    %ebp,%r9d
1173  2e775b3:	0f 85 c3 15 00 00    	jne    2e78b7c <MT2063_SetReceiverMode+0x273c>
1179  2e775b9:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
117e  2e775be:	88 18                	mov    %bl,(%rax)
1180  2e775c0:	31 c0                	xor    %eax,%eax
1182  2e775c2:	41 09 c1             	or     %eax,%r9d
1185  2e775c5:	79 20                	jns    2e775e7 <MT2063_SetReceiverMode+0x11a7>
1187  2e775c7:	e9 49 06 00 00       	jmp    2e77c15 <MT2063_SetReceiverMode+0x17d5>
118c  2e775cc:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1196  2e775d6:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
119b  2e775db:	41 89 e9             	mov    %ebp,%r9d
119e  2e775de:	41 09 c1             	or     %eax,%r9d
11a1  2e775e1:	0f 88 2e 06 00 00    	js     2e77c15 <MT2063_SetReceiverMode+0x17d5>
11a7  2e775e7:	4c 89 6c 24 10       	mov    %r13,0x10(%rsp)
11ac  2e775ec:	4d 8d a5 64 05 00 00 	lea    0x564(%r13),%r12
11b3  2e775f3:	4c 89 e5             	mov    %r12,%rbp
11b6  2e775f6:	48 c1 ed 03          	shr    $0x3,%rbp
11ba  2e775fa:	8a 44 35 00          	mov    0x0(%rbp,%rsi,1),%al
11be  2e775fe:	84 c0                	test   %al,%al
11c0  2e77600:	0f 85 00 0b 00 00    	jne    2e78106 <MT2063_SetReceiverMode+0x1cc6>
11c6  2e77606:	45 8a 34 24          	mov    (%r12),%r14b
11ca  2e7760a:	45 89 f5             	mov    %r14d,%r13d
11cd  2e7760d:	41 80 e5 e0          	and    $0xe0,%r13b
11d1  2e77611:	49 8d 98 00 00 00 00 	lea    0x0(%r8),%rbx	2e77614: R_X86_64_32S	.rodata+0x850620
11d8  2e77618:	48 89 d8             	mov    %rbx,%rax
11db  2e7761b:	48 c1 e8 03          	shr    $0x3,%rax
11df  2e7761f:	8a 04 30             	mov    (%rax,%rsi,1),%al
11e2  2e77622:	84 c0                	test   %al,%al
11e4  2e77624:	0f 85 0c 0b 00 00    	jne    2e78136 <MT2063_SetReceiverMode+0x1cf6>
11ea  2e7762a:	8a 1b                	mov    (%rbx),%bl
11ec  2e7762c:	80 e3 1f             	and    $0x1f,%bl
11ef  2e7762f:	44 08 eb             	or     %r13b,%bl
11f2  2e77632:	41 38 de             	cmp    %bl,%r14b
11f5  2e77635:	75 0a                	jne    2e77641 <MT2063_SetReceiverMode+0x1201>
11f7  2e77637:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
11fc  2e7763c:	e9 a7 00 00 00       	jmp    2e776e8 <MT2063_SetReceiverMode+0x12a8>
1201  2e77641:	48 8d 44 24 07       	lea    0x7(%rsp),%rax
1206  2e77646:	48 c1 e8 03          	shr    $0x3,%rax
120a  2e7764a:	8a 04 30             	mov    (%rax,%rsi,1),%al
120d  2e7764d:	84 c0                	test   %al,%al
120f  2e7764f:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
1214  2e77654:	0f 85 f6 13 00 00    	jne    2e78a50 <MT2063_SetReceiverMode+0x2610>
121a  2e7765a:	45 89 ce             	mov    %r9d,%r14d
121d  2e7765d:	88 5c 24 07          	mov    %bl,0x7(%rsp)
1221  2e77661:	83 3d 00 00 00 00 02 	cmpl   $0x2,0x0(%rip)        # 2e77668 <MT2063_SetReceiverMode+0x1228>	2e77663: R_X86_64_PC32	.bss+0x14bc25b
1228  2e77668:	0f 83 49 06 00 00    	jae    2e77cb7 <MT2063_SetReceiverMode+0x1877>
122e  2e7766e:	48 8d 5c 24 07       	lea    0x7(%rsp),%rbx
1233  2e77673:	4c 89 ef             	mov    %r13,%rdi
1236  2e77676:	be 18 00 00 00       	mov    $0x18,%esi
123b  2e7767b:	48 89 da             	mov    %rbx,%rdx
123e  2e7767e:	b9 01 00 00 00       	mov    $0x1,%ecx
1243  2e77683:	e8 38 e9 ff ff       	call   2e75fc0 <mt2063_write>
1248  2e77688:	85 c0                	test   %eax,%eax
124a  2e7768a:	78 41                	js     2e776cd <MT2063_SetReceiverMode+0x128d>
124c  2e7768c:	48 c1 eb 03          	shr    $0x3,%rbx
1250  2e77690:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
125a  2e7769a:	8a 04 33             	mov    (%rbx,%rsi,1),%al
125d  2e7769d:	84 c0                	test   %al,%al
125f  2e7769f:	0f 85 90 15 00 00    	jne    2e78c35 <MT2063_SetReceiverMode+0x27f5>
1265  2e776a5:	8a 5c 24 07          	mov    0x7(%rsp),%bl
1269  2e776a9:	8a 44 35 00          	mov    0x0(%rbp,%rsi,1),%al
126d  2e776ad:	84 c0                	test   %al,%al
126f  2e776af:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
1274  2e776b4:	45 89 f1             	mov    %r14d,%r9d
1277  2e776b7:	0f 85 a1 15 00 00    	jne    2e78c5e <MT2063_SetReceiverMode+0x281e>
127d  2e776bd:	41 88 1c 24          	mov    %bl,(%r12)
1281  2e776c1:	31 c0                	xor    %eax,%eax
1283  2e776c3:	41 09 c1             	or     %eax,%r9d
1286  2e776c6:	79 20                	jns    2e776e8 <MT2063_SetReceiverMode+0x12a8>
1288  2e776c8:	e9 48 05 00 00       	jmp    2e77c15 <MT2063_SetReceiverMode+0x17d5>
128d  2e776cd:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1297  2e776d7:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
129c  2e776dc:	45 89 f1             	mov    %r14d,%r9d
129f  2e776df:	41 09 c1             	or     %eax,%r9d
12a2  2e776e2:	0f 88 2d 05 00 00    	js     2e77c15 <MT2063_SetReceiverMode+0x17d5>
12a8  2e776e8:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
12ad  2e776ed:	8a 04 30             	mov    (%rax,%rsi,1),%al
12b0  2e776f0:	84 c0                	test   %al,%al
12b2  2e776f2:	0f 85 90 0a 00 00    	jne    2e78188 <MT2063_SetReceiverMode+0x1d48>
12b8  2e776f8:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
12bd  2e776fd:	40 8a 28             	mov    (%rax),%bpl
12c0  2e77700:	41 89 ee             	mov    %ebp,%r14d
12c3  2e77703:	41 80 e6 c0          	and    $0xc0,%r14b
12c7  2e77707:	49 8d 98 00 00 00 00 	lea    0x0(%r8),%rbx	2e7770a: R_X86_64_32S	.rodata+0x850640
12ce  2e7770e:	48 89 d8             	mov    %rbx,%rax
12d1  2e77711:	48 c1 e8 03          	shr    $0x3,%rax
12d5  2e77715:	8a 04 30             	mov    (%rax,%rsi,1),%al
12d8  2e77718:	84 c0                	test   %al,%al
12da  2e7771a:	0f 85 9c 0a 00 00    	jne    2e781bc <MT2063_SetReceiverMode+0x1d7c>
12e0  2e77720:	8a 1b                	mov    (%rbx),%bl
12e2  2e77722:	80 e3 3f             	and    $0x3f,%bl
12e5  2e77725:	44 08 f3             	or     %r14b,%bl
12e8  2e77728:	40 38 dd             	cmp    %bl,%bpl
12eb  2e7772b:	0f 84 a9 00 00 00    	je     2e777da <MT2063_SetReceiverMode+0x139a>
12f1  2e77731:	48 8d 44 24 07       	lea    0x7(%rsp),%rax
12f6  2e77736:	48 c1 e8 03          	shr    $0x3,%rax
12fa  2e7773a:	8a 04 30             	mov    (%rax,%rsi,1),%al
12fd  2e7773d:	84 c0                	test   %al,%al
12ff  2e7773f:	0f 85 e9 13 00 00    	jne    2e78b2e <MT2063_SetReceiverMode+0x26ee>
1305  2e77745:	44 89 cd             	mov    %r9d,%ebp
1308  2e77748:	88 5c 24 07          	mov    %bl,0x7(%rsp)
130c  2e7774c:	83 3d 00 00 00 00 02 	cmpl   $0x2,0x0(%rip)        # 2e77753 <MT2063_SetReceiverMode+0x1313>	2e7774e: R_X86_64_PC32	.bss+0x14bc25b
1313  2e77753:	0f 83 76 05 00 00    	jae    2e77ccf <MT2063_SetReceiverMode+0x188f>
1319  2e77759:	48 8d 5c 24 07       	lea    0x7(%rsp),%rbx
131e  2e7775e:	4c 89 ef             	mov    %r13,%rdi
1321  2e77761:	be 1b 00 00 00       	mov    $0x1b,%esi
1326  2e77766:	48 89 da             	mov    %rbx,%rdx
1329  2e77769:	b9 01 00 00 00       	mov    $0x1,%ecx
132e  2e7776e:	e8 4d e8 ff ff       	call   2e75fc0 <mt2063_write>
1333  2e77773:	85 c0                	test   %eax,%eax
1335  2e77775:	78 48                	js     2e777bf <MT2063_SetReceiverMode+0x137f>
1337  2e77777:	48 c1 eb 03          	shr    $0x3,%rbx
133b  2e7777b:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1345  2e77785:	8a 04 33             	mov    (%rbx,%rsi,1),%al
1348  2e77788:	84 c0                	test   %al,%al
134a  2e7778a:	0f 85 f7 16 00 00    	jne    2e78e87 <MT2063_SetReceiverMode+0x2a47>
1350  2e77790:	8a 5c 24 07          	mov    0x7(%rsp),%bl
1354  2e77794:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
1359  2e77799:	8a 04 30             	mov    (%rax,%rsi,1),%al
135c  2e7779c:	84 c0                	test   %al,%al
135e  2e7779e:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
1363  2e777a3:	41 89 e9             	mov    %ebp,%r9d
1366  2e777a6:	0f 85 04 17 00 00    	jne    2e78eb0 <MT2063_SetReceiverMode+0x2a70>
136c  2e777ac:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
1371  2e777b1:	88 18                	mov    %bl,(%rax)
1373  2e777b3:	31 c0                	xor    %eax,%eax
1375  2e777b5:	41 09 c1             	or     %eax,%r9d
1378  2e777b8:	79 20                	jns    2e777da <MT2063_SetReceiverMode+0x139a>
137a  2e777ba:	e9 56 04 00 00       	jmp    2e77c15 <MT2063_SetReceiverMode+0x17d5>
137f  2e777bf:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1389  2e777c9:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
138e  2e777ce:	41 89 e9             	mov    %ebp,%r9d
1391  2e777d1:	41 09 c1             	or     %eax,%r9d
1394  2e777d4:	0f 88 3b 04 00 00    	js     2e77c15 <MT2063_SetReceiverMode+0x17d5>
139a  2e777da:	49 8d 98 00 00 00 00 	lea    0x0(%r8),%rbx	2e777dd: R_X86_64_32S	.rodata+0x850660
13a1  2e777e1:	48 89 d8             	mov    %rbx,%rax
13a4  2e777e4:	48 c1 e8 03          	shr    $0x3,%rax
13a8  2e777e8:	8a 04 30             	mov    (%rax,%rsi,1),%al
13ab  2e777eb:	84 c0                	test   %al,%al
13ad  2e777ed:	0f 85 1b 0b 00 00    	jne    2e7830e <MT2063_SetReceiverMode+0x1ece>
13b3  2e777f3:	49 8d bd 4c 05 00 00 	lea    0x54c(%r13),%rdi
13ba  2e777fa:	48 89 f8             	mov    %rdi,%rax
13bd  2e777fd:	48 c1 e8 03          	shr    $0x3,%rax
13c1  2e77801:	8a 04 30             	mov    (%rax,%rsi,1),%al
13c4  2e77804:	84 c0                	test   %al,%al
13c6  2e77806:	0f 85 31 0b 00 00    	jne    2e7833d <MT2063_SetReceiverMode+0x1efd>
13cc  2e7780c:	8a 1b                	mov    (%rbx),%bl
13ce  2e7780e:	45 8a b5 4c 05 00 00 	mov    0x54c(%r13),%r14b
13d5  2e77815:	4d 8d a5 65 05 00 00 	lea    0x565(%r13),%r12
13dc  2e7781c:	4c 89 e5             	mov    %r12,%rbp
13df  2e7781f:	48 c1 ed 03          	shr    $0x3,%rbp
13e3  2e77823:	8a 44 35 00          	mov    0x0(%rbp,%rsi,1),%al
13e7  2e77827:	84 c0                	test   %al,%al
13e9  2e77829:	0f 85 3a 0b 00 00    	jne    2e78369 <MT2063_SetReceiverMode+0x1f29>
13ef  2e7782f:	41 8a 04 24          	mov    (%r12),%al
13f3  2e77833:	89 c1                	mov    %eax,%ecx
13f5  2e77835:	80 e1 e0             	and    $0xe0,%cl
13f8  2e77838:	80 e3 1f             	and    $0x1f,%bl
13fb  2e7783b:	41 80 fe 9e          	cmp    $0x9e,%r14b
13ff  2e7783f:	0f b6 d3             	movzbl %bl,%edx
1402  2e77842:	bb 05 00 00 00       	mov    $0x5,%ebx
1407  2e77847:	0f 44 da             	cmove  %edx,%ebx
140a  2e7784a:	08 cb                	or     %cl,%bl
140c  2e7784c:	38 d8                	cmp    %bl,%al
140e  2e7784e:	0f 84 a2 00 00 00    	je     2e778f6 <MT2063_SetReceiverMode+0x14b6>
1414  2e77854:	48 8d 44 24 07       	lea    0x7(%rsp),%rax
1419  2e77859:	48 c1 e8 03          	shr    $0x3,%rax
141d  2e7785d:	8a 04 30             	mov    (%rax,%rsi,1),%al
1420  2e77860:	84 c0                	test   %al,%al
1422  2e77862:	0f 85 a8 13 00 00    	jne    2e78c10 <MT2063_SetReceiverMode+0x27d0>
1428  2e77868:	45 89 ce             	mov    %r9d,%r14d
142b  2e7786b:	88 5c 24 07          	mov    %bl,0x7(%rsp)
142f  2e7786f:	83 3d 00 00 00 00 02 	cmpl   $0x2,0x0(%rip)        # 2e77876 <MT2063_SetReceiverMode+0x1436>	2e77871: R_X86_64_PC32	.bss+0x14bc25b
1436  2e77876:	0f 83 6b 04 00 00    	jae    2e77ce7 <MT2063_SetReceiverMode+0x18a7>
143c  2e7787c:	48 8d 5c 24 07       	lea    0x7(%rsp),%rbx
1441  2e77881:	4c 89 ef             	mov    %r13,%rdi
1444  2e77884:	be 19 00 00 00       	mov    $0x19,%esi
1449  2e77889:	48 89 da             	mov    %rbx,%rdx
144c  2e7788c:	b9 01 00 00 00       	mov    $0x1,%ecx
1451  2e77891:	e8 2a e7 ff ff       	call   2e75fc0 <mt2063_write>
1456  2e77896:	85 c0                	test   %eax,%eax
1458  2e77898:	78 41                	js     2e778db <MT2063_SetReceiverMode+0x149b>
145a  2e7789a:	48 c1 eb 03          	shr    $0x3,%rbx
145e  2e7789e:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1468  2e778a8:	8a 04 33             	mov    (%rbx,%rsi,1),%al
146b  2e778ab:	84 c0                	test   %al,%al
146d  2e778ad:	45 89 f1             	mov    %r14d,%r9d
1470  2e778b0:	0f 85 50 16 00 00    	jne    2e78f06 <MT2063_SetReceiverMode+0x2ac6>
1476  2e778b6:	8a 5c 24 07          	mov    0x7(%rsp),%bl
147a  2e778ba:	8a 44 35 00          	mov    0x0(%rbp,%rsi,1),%al
147e  2e778be:	84 c0                	test   %al,%al
1480  2e778c0:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
1485  2e778c5:	0f 85 67 16 00 00    	jne    2e78f32 <MT2063_SetReceiverMode+0x2af2>
148b  2e778cb:	41 88 1c 24          	mov    %bl,(%r12)
148f  2e778cf:	31 c0                	xor    %eax,%eax
1491  2e778d1:	41 09 c1             	or     %eax,%r9d
1494  2e778d4:	79 20                	jns    2e778f6 <MT2063_SetReceiverMode+0x14b6>
1496  2e778d6:	e9 3a 03 00 00       	jmp    2e77c15 <MT2063_SetReceiverMode+0x17d5>
149b  2e778db:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
14a5  2e778e5:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
14aa  2e778ea:	45 89 f1             	mov    %r14d,%r9d
14ad  2e778ed:	41 09 c1             	or     %eax,%r9d
14b0  2e778f0:	0f 88 1f 03 00 00    	js     2e77c15 <MT2063_SetReceiverMode+0x17d5>
14b6  2e778f6:	4d 8d a5 68 05 00 00 	lea    0x568(%r13),%r12
14bd  2e778fd:	4c 89 e5             	mov    %r12,%rbp
14c0  2e77900:	48 c1 ed 03          	shr    $0x3,%rbp
14c4  2e77904:	8a 44 35 00          	mov    0x0(%rbp,%rsi,1),%al
14c8  2e77908:	84 c0                	test   %al,%al
14ca  2e7790a:	0f 85 e9 0f 00 00    	jne    2e788f9 <MT2063_SetReceiverMode+0x24b9>
14d0  2e77910:	45 8a 2c 24          	mov    (%r12),%r13b
14d4  2e77914:	45 89 ee             	mov    %r13d,%r14d
14d7  2e77917:	41 80 e6 c0          	and    $0xc0,%r14b
14db  2e7791b:	49 8d 98 00 00 00 00 	lea    0x0(%r8),%rbx	2e7791e: R_X86_64_32S	.rodata+0x850680
14e2  2e77922:	48 89 d8             	mov    %rbx,%rax
14e5  2e77925:	48 c1 e8 03          	shr    $0x3,%rax
14e9  2e77929:	8a 04 30             	mov    (%rax,%rsi,1),%al
14ec  2e7792c:	84 c0                	test   %al,%al
14ee  2e7792e:	0f 85 f5 0f 00 00    	jne    2e78929 <MT2063_SetReceiverMode+0x24e9>
14f4  2e77934:	8a 1b                	mov    (%rbx),%bl
14f6  2e77936:	80 e3 3f             	and    $0x3f,%bl
14f9  2e77939:	44 08 f3             	or     %r14b,%bl
14fc  2e7793c:	41 38 dd             	cmp    %bl,%r13b
14ff  2e7793f:	75 0a                	jne    2e7794b <MT2063_SetReceiverMode+0x150b>
1501  2e77941:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
1506  2e77946:	e9 a7 00 00 00       	jmp    2e779f2 <MT2063_SetReceiverMode+0x15b2>
150b  2e7794b:	48 8d 44 24 07       	lea    0x7(%rsp),%rax
1510  2e77950:	48 c1 e8 03          	shr    $0x3,%rax
1514  2e77954:	8a 04 30             	mov    (%rax,%rsi,1),%al
1517  2e77957:	84 c0                	test   %al,%al
1519  2e77959:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
151e  2e7795e:	0f 85 fe 14 00 00    	jne    2e78e62 <MT2063_SetReceiverMode+0x2a22>
1524  2e77964:	45 89 ce             	mov    %r9d,%r14d
1527  2e77967:	88 5c 24 07          	mov    %bl,0x7(%rsp)
152b  2e7796b:	83 3d 00 00 00 00 02 	cmpl   $0x2,0x0(%rip)        # 2e77972 <MT2063_SetReceiverMode+0x1532>	2e7796d: R_X86_64_PC32	.bss+0x14bc25b
1532  2e77972:	0f 83 e5 04 00 00    	jae    2e77e5d <MT2063_SetReceiverMode+0x1a1d>
1538  2e77978:	48 8d 5c 24 07       	lea    0x7(%rsp),%rbx
153d  2e7797d:	4c 89 ef             	mov    %r13,%rdi
1540  2e77980:	be 1c 00 00 00       	mov    $0x1c,%esi
1545  2e77985:	48 89 da             	mov    %rbx,%rdx
1548  2e77988:	b9 01 00 00 00       	mov    $0x1,%ecx
154d  2e7798d:	e8 2e e6 ff ff       	call   2e75fc0 <mt2063_write>
1552  2e77992:	85 c0                	test   %eax,%eax
1554  2e77994:	78 41                	js     2e779d7 <MT2063_SetReceiverMode+0x1597>
1556  2e77996:	48 c1 eb 03          	shr    $0x3,%rbx
155a  2e7799a:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1564  2e779a4:	8a 04 33             	mov    (%rbx,%rsi,1),%al
1567  2e779a7:	84 c0                	test   %al,%al
1569  2e779a9:	0f 85 9c 19 00 00    	jne    2e7934b <MT2063_SetReceiverMode+0x2f0b>
156f  2e779af:	8a 5c 24 07          	mov    0x7(%rsp),%bl
1573  2e779b3:	8a 44 35 00          	mov    0x0(%rbp,%rsi,1),%al
1577  2e779b7:	84 c0                	test   %al,%al
1579  2e779b9:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
157e  2e779be:	45 89 f1             	mov    %r14d,%r9d
1581  2e779c1:	0f 85 ad 19 00 00    	jne    2e79374 <MT2063_SetReceiverMode+0x2f34>
1587  2e779c7:	41 88 1c 24          	mov    %bl,(%r12)
158b  2e779cb:	31 c0                	xor    %eax,%eax
158d  2e779cd:	41 09 c1             	or     %eax,%r9d
1590  2e779d0:	79 20                	jns    2e779f2 <MT2063_SetReceiverMode+0x15b2>
1592  2e779d2:	e9 3e 02 00 00       	jmp    2e77c15 <MT2063_SetReceiverMode+0x17d5>
1597  2e779d7:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
15a1  2e779e1:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
15a6  2e779e6:	45 89 f1             	mov    %r14d,%r9d
15a9  2e779e9:	41 09 c1             	or     %eax,%r9d
15ac  2e779ec:	0f 88 23 02 00 00    	js     2e77c15 <MT2063_SetReceiverMode+0x17d5>
15b2  2e779f2:	41 8a 04 37          	mov    (%r15,%rsi,1),%al
15b6  2e779f6:	84 c0                	test   %al,%al
15b8  2e779f8:	0f 85 cd 10 00 00    	jne    2e78acb <MT2063_SetReceiverMode+0x268b>
15be  2e779fe:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
15c3  2e77a03:	40 8a 28             	mov    (%rax),%bpl
15c6  2e77a06:	41 89 ec             	mov    %ebp,%r12d
15c9  2e77a09:	41 80 e4 7f          	and    $0x7f,%r12b
15cd  2e77a0d:	49 8d 98 00 00 00 00 	lea    0x0(%r8),%rbx	2e77a10: R_X86_64_32S	.rodata+0x8506a0
15d4  2e77a14:	48 89 d8             	mov    %rbx,%rax
15d7  2e77a17:	48 c1 e8 03          	shr    $0x3,%rax
15db  2e77a1b:	8a 04 30             	mov    (%rax,%rsi,1),%al
15de  2e77a1e:	84 c0                	test   %al,%al
15e0  2e77a20:	0f 85 d9 10 00 00    	jne    2e78aff <MT2063_SetReceiverMode+0x26bf>
15e6  2e77a26:	80 3b 00             	cmpb   $0x0,(%rbx)
15e9  2e77a29:	0f 95 c3             	setne  %bl
15ec  2e77a2c:	c0 e3 07             	shl    $0x7,%bl
15ef  2e77a2f:	44 08 e3             	or     %r12b,%bl
15f2  2e77a32:	40 38 dd             	cmp    %bl,%bpl
15f5  2e77a35:	0f 84 a5 00 00 00    	je     2e77ae0 <MT2063_SetReceiverMode+0x16a0>
15fb  2e77a3b:	48 8d 44 24 07       	lea    0x7(%rsp),%rax
1600  2e77a40:	48 c1 e8 03          	shr    $0x3,%rax
1604  2e77a44:	8a 04 30             	mov    (%rax,%rsi,1),%al
1607  2e77a47:	84 c0                	test   %al,%al
1609  2e77a49:	0f 85 92 14 00 00    	jne    2e78ee1 <MT2063_SetReceiverMode+0x2aa1>
160f  2e77a4f:	44 89 cd             	mov    %r9d,%ebp
1612  2e77a52:	88 5c 24 07          	mov    %bl,0x7(%rsp)
1616  2e77a56:	83 3d 00 00 00 00 02 	cmpl   $0x2,0x0(%rip)        # 2e77a5d <MT2063_SetReceiverMode+0x161d>	2e77a58: R_X86_64_PC32	.bss+0x14bc25b
161d  2e77a5d:	0f 83 12 04 00 00    	jae    2e77e75 <MT2063_SetReceiverMode+0x1a35>
1623  2e77a63:	48 8d 5c 24 07       	lea    0x7(%rsp),%rbx
1628  2e77a68:	4c 89 ef             	mov    %r13,%rdi
162b  2e77a6b:	be 1a 00 00 00       	mov    $0x1a,%esi
1630  2e77a70:	48 89 da             	mov    %rbx,%rdx
1633  2e77a73:	b9 01 00 00 00       	mov    $0x1,%ecx
1638  2e77a78:	e8 43 e5 ff ff       	call   2e75fc0 <mt2063_write>
163d  2e77a7d:	85 c0                	test   %eax,%eax
163f  2e77a7f:	78 44                	js     2e77ac5 <MT2063_SetReceiverMode+0x1685>
1641  2e77a81:	48 c1 eb 03          	shr    $0x3,%rbx
1645  2e77a85:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
164f  2e77a8f:	8a 04 33             	mov    (%rbx,%rsi,1),%al
1652  2e77a92:	84 c0                	test   %al,%al
1654  2e77a94:	0f 85 07 19 00 00    	jne    2e793a1 <MT2063_SetReceiverMode+0x2f61>
165a  2e77a9a:	8a 5c 24 07          	mov    0x7(%rsp),%bl
165e  2e77a9e:	41 8a 04 37          	mov    (%r15,%rsi,1),%al
1662  2e77aa2:	84 c0                	test   %al,%al
1664  2e77aa4:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
1669  2e77aa9:	41 89 e9             	mov    %ebp,%r9d
166c  2e77aac:	0f 85 18 19 00 00    	jne    2e793ca <MT2063_SetReceiverMode+0x2f8a>
1672  2e77ab2:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
1677  2e77ab7:	88 18                	mov    %bl,(%rax)
1679  2e77ab9:	31 c0                	xor    %eax,%eax
167b  2e77abb:	41 09 c1             	or     %eax,%r9d
167e  2e77abe:	79 20                	jns    2e77ae0 <MT2063_SetReceiverMode+0x16a0>
1680  2e77ac0:	e9 50 01 00 00       	jmp    2e77c15 <MT2063_SetReceiverMode+0x17d5>
1685  2e77ac5:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
168f  2e77acf:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
1694  2e77ad4:	41 89 e9             	mov    %ebp,%r9d
1697  2e77ad7:	41 09 c1             	or     %eax,%r9d
169a  2e77ada:	0f 88 35 01 00 00    	js     2e77c15 <MT2063_SetReceiverMode+0x17d5>
16a0  2e77ae0:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
16a5  2e77ae5:	8a 04 30             	mov    (%rax,%rsi,1),%al
16a8  2e77ae8:	84 c0                	test   %al,%al
16aa  2e77aea:	0f 85 bd 10 00 00    	jne    2e78bad <MT2063_SetReceiverMode+0x276d>
16b0  2e77af0:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
16b5  2e77af5:	40 8a 28             	mov    (%rax),%bpl
16b8  2e77af8:	41 89 ee             	mov    %ebp,%r14d
16bb  2e77afb:	41 80 e6 7f          	and    $0x7f,%r14b
16bf  2e77aff:	49 8d 98 00 00 00 00 	lea    0x0(%r8),%rbx	2e77b02: R_X86_64_32S	.rodata+0x8506c0
16c6  2e77b06:	48 89 d8             	mov    %rbx,%rax
16c9  2e77b09:	48 c1 e8 03          	shr    $0x3,%rax
16cd  2e77b0d:	8a 04 30             	mov    (%rax,%rsi,1),%al
16d0  2e77b10:	84 c0                	test   %al,%al
16d2  2e77b12:	0f 85 c9 10 00 00    	jne    2e78be1 <MT2063_SetReceiverMode+0x27a1>
16d8  2e77b18:	80 3b 00             	cmpb   $0x0,(%rbx)
16db  2e77b1b:	0f 95 c3             	setne  %bl
16de  2e77b1e:	c0 e3 07             	shl    $0x7,%bl
16e1  2e77b21:	44 08 f3             	or     %r14b,%bl
16e4  2e77b24:	40 38 dd             	cmp    %bl,%bpl
16e7  2e77b27:	0f 84 ba 00 00 00    	je     2e77be7 <MT2063_SetReceiverMode+0x17a7>
16ed  2e77b2d:	48 8d 44 24 07       	lea    0x7(%rsp),%rax
16f2  2e77b32:	48 c1 e8 03          	shr    $0x3,%rax
16f6  2e77b36:	8a 04 30             	mov    (%rax,%rsi,1),%al
16f9  2e77b39:	84 c0                	test   %al,%al
16fb  2e77b3b:	0f 85 e5 17 00 00    	jne    2e79326 <MT2063_SetReceiverMode+0x2ee6>
1701  2e77b41:	44 89 cd             	mov    %r9d,%ebp
1704  2e77b44:	88 5c 24 07          	mov    %bl,0x7(%rsp)
1708  2e77b48:	83 3d 00 00 00 00 02 	cmpl   $0x2,0x0(%rip)        # 2e77b4f <MT2063_SetReceiverMode+0x170f>	2e77b4a: R_X86_64_PC32	.bss+0x14bc25b
170f  2e77b4f:	0f 83 38 03 00 00    	jae    2e77e8d <MT2063_SetReceiverMode+0x1a4d>
1715  2e77b55:	48 8d 5c 24 07       	lea    0x7(%rsp),%rbx
171a  2e77b5a:	4c 89 ef             	mov    %r13,%rdi
171d  2e77b5d:	be 1b 00 00 00       	mov    $0x1b,%esi
1722  2e77b62:	48 89 da             	mov    %rbx,%rdx
1725  2e77b65:	b9 01 00 00 00       	mov    $0x1,%ecx
172a  2e77b6a:	e8 51 e4 ff ff       	call   2e75fc0 <mt2063_write>
172f  2e77b6f:	85 c0                	test   %eax,%eax
1731  2e77b71:	78 5d                	js     2e77bd0 <MT2063_SetReceiverMode+0x1790>
1733  2e77b73:	48 c1 eb 03          	shr    $0x3,%rbx
1737  2e77b77:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1741  2e77b81:	8a 04 33             	mov    (%rbx,%rsi,1),%al
1744  2e77b84:	84 c0                	test   %al,%al
1746  2e77b86:	0f 85 6f 18 00 00    	jne    2e793fb <MT2063_SetReceiverMode+0x2fbb>
174c  2e77b8c:	8a 5c 24 07          	mov    0x7(%rsp),%bl
1750  2e77b90:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
1755  2e77b95:	8a 04 30             	mov    (%rax,%rsi,1),%al
1758  2e77b98:	84 c0                	test   %al,%al
175a  2e77b9a:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
175f  2e77b9f:	41 89 e9             	mov    %ebp,%r9d
1762  2e77ba2:	0f 85 7c 18 00 00    	jne    2e79424 <MT2063_SetReceiverMode+0x2fe4>
1768  2e77ba8:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
176d  2e77bad:	88 18                	mov    %bl,(%rax)
176f  2e77baf:	31 c0                	xor    %eax,%eax
1771  2e77bb1:	41 09 c1             	or     %eax,%r9d
1774  2e77bb4:	79 31                	jns    2e77be7 <MT2063_SetReceiverMode+0x17a7>
1776  2e77bb6:	eb 5d                	jmp    2e77c15 <MT2063_SetReceiverMode+0x17d5>
1778  2e77bb8:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2e77bbb: R_X86_64_32S	.rodata+0x84fec0
177f  2e77bbf:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	2e77bc2: R_X86_64_32S	.rodata.str1.1+0x5de08
1786  2e77bc6:	e8 00 00 00 00       	call   2e77bcb <MT2063_SetReceiverMode+0x178b>	2e77bc7: R_X86_64_PLT32	_printk-0x4
178b  2e77bcb:	e9 28 e9 ff ff       	jmp    2e764f8 <MT2063_SetReceiverMode+0xb8>
1790  2e77bd0:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
179a  2e77bda:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
179f  2e77bdf:	41 89 e9             	mov    %ebp,%r9d
17a2  2e77be2:	41 09 c1             	or     %eax,%r9d
17a5  2e77be5:	78 2e                	js     2e77c15 <MT2063_SetReceiverMode+0x17d5>
17a7  2e77be7:	49 81 c5 c4 04 00 00 	add    $0x4c4,%r13
17ae  2e77bee:	4c 89 e8             	mov    %r13,%rax
17b1  2e77bf1:	48 c1 e8 03          	shr    $0x3,%rax
17b5  2e77bf5:	8a 04 30             	mov    (%rax,%rsi,1),%al
17b8  2e77bf8:	84 c0                	test   %al,%al
17ba  2e77bfa:	0f 85 2f 12 00 00    	jne    2e78e2f <MT2063_SetReceiverMode+0x29ef>
17c0  2e77c00:	8b 44 24 4c          	mov    0x4c(%rsp),%eax
17c4  2e77c04:	41 89 45 00          	mov    %eax,0x0(%r13)
17c8  2e77c08:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0(%rip)        # 2e77c0f <MT2063_SetReceiverMode+0x17cf>	2e77c0a: R_X86_64_PC32	.bss+0x14bc25b
17cf  2e77c0f:	0f 85 0a 02 00 00    	jne    2e77e1f <MT2063_SetReceiverMode+0x19df>
17d5  2e77c15:	44 89 c8             	mov    %r9d,%eax
17d8  2e77c18:	48 83 c4 50          	add    $0x50,%rsp
17dc  2e77c1c:	5b                   	pop    %rbx
17dd  2e77c1d:	41 5c                	pop    %r12
17df  2e77c1f:	41 5d                	pop    %r13
17e1  2e77c21:	41 5e                	pop    %r14
17e3  2e77c23:	41 5f                	pop    %r15
17e5  2e77c25:	5d                   	pop    %rbp
17e6  2e77c26:	c3                   	ret
17e7  2e77c27:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2e77c2a: R_X86_64_32S	.rodata+0x84fec0
17ee  2e77c2e:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	2e77c31: R_X86_64_32S	.rodata.str1.1+0x5de08
17f5  2e77c35:	e8 00 00 00 00       	call   2e77c3a <MT2063_SetReceiverMode+0x17fa>	2e77c36: R_X86_64_PLT32	_printk-0x4
17fa  2e77c3a:	e9 83 e9 ff ff       	jmp    2e765c2 <MT2063_SetReceiverMode+0x182>
17ff  2e77c3f:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2e77c42: R_X86_64_32S	.rodata+0x84fec0
1806  2e77c46:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	2e77c49: R_X86_64_32S	.rodata.str1.1+0x5de08
180d  2e77c4d:	e8 00 00 00 00       	call   2e77c52 <MT2063_SetReceiverMode+0x1812>	2e77c4e: R_X86_64_PLT32	_printk-0x4
1812  2e77c52:	e9 5d ea ff ff       	jmp    2e766b4 <MT2063_SetReceiverMode+0x274>
1817  2e77c57:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2e77c5a: R_X86_64_32S	.rodata+0x84fec0
181e  2e77c5e:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	2e77c61: R_X86_64_32S	.rodata.str1.1+0x5de08
1825  2e77c65:	e8 00 00 00 00       	call   2e77c6a <MT2063_SetReceiverMode+0x182a>	2e77c66: R_X86_64_PLT32	_printk-0x4
182a  2e77c6a:	e9 2e ec ff ff       	jmp    2e7689d <MT2063_SetReceiverMode+0x45d>
182f  2e77c6f:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2e77c72: R_X86_64_32S	.rodata+0x84fec0
1836  2e77c76:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	2e77c79: R_X86_64_32S	.rodata.str1.1+0x5de08
183d  2e77c7d:	e8 00 00 00 00       	call   2e77c82 <MT2063_SetReceiverMode+0x1842>	2e77c7e: R_X86_64_PLT32	_printk-0x4
1842  2e77c82:	e9 a8 ec ff ff       	jmp    2e7692f <MT2063_SetReceiverMode+0x4ef>
1847  2e77c87:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2e77c8a: R_X86_64_32S	.rodata+0x84fec0
184e  2e77c8e:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	2e77c91: R_X86_64_32S	.rodata.str1.1+0x5de08
1855  2e77c95:	e8 00 00 00 00       	call   2e77c9a <MT2063_SetReceiverMode+0x185a>	2e77c96: R_X86_64_PLT32	_printk-0x4
185a  2e77c9a:	e9 d7 f7 ff ff       	jmp    2e77476 <MT2063_SetReceiverMode+0x1036>
185f  2e77c9f:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2e77ca2: R_X86_64_32S	.rodata+0x84fec0
1866  2e77ca6:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	2e77ca9: R_X86_64_32S	.rodata.str1.1+0x5de08
186d  2e77cad:	e8 00 00 00 00       	call   2e77cb2 <MT2063_SetReceiverMode+0x1872>	2e77cae: R_X86_64_PLT32	_printk-0x4
1872  2e77cb2:	e9 b3 f8 ff ff       	jmp    2e7756a <MT2063_SetReceiverMode+0x112a>
1877  2e77cb7:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2e77cba: R_X86_64_32S	.rodata+0x84fec0
187e  2e77cbe:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	2e77cc1: R_X86_64_32S	.rodata.str1.1+0x5de08
1885  2e77cc5:	e8 00 00 00 00       	call   2e77cca <MT2063_SetReceiverMode+0x188a>	2e77cc6: R_X86_64_PLT32	_printk-0x4
188a  2e77cca:	e9 9f f9 ff ff       	jmp    2e7766e <MT2063_SetReceiverMode+0x122e>
188f  2e77ccf:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2e77cd2: R_X86_64_32S	.rodata+0x84fec0
1896  2e77cd6:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	2e77cd9: R_X86_64_32S	.rodata.str1.1+0x5de08
189d  2e77cdd:	e8 00 00 00 00       	call   2e77ce2 <MT2063_SetReceiverMode+0x18a2>	2e77cde: R_X86_64_PLT32	_printk-0x4
18a2  2e77ce2:	e9 72 fa ff ff       	jmp    2e77759 <MT2063_SetReceiverMode+0x1319>
18a7  2e77ce7:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2e77cea: R_X86_64_32S	.rodata+0x84fec0
18ae  2e77cee:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	2e77cf1: R_X86_64_32S	.rodata.str1.1+0x5de08
18b5  2e77cf5:	e8 00 00 00 00       	call   2e77cfa <MT2063_SetReceiverMode+0x18ba>	2e77cf6: R_X86_64_PLT32	_printk-0x4
18ba  2e77cfa:	e9 7d fb ff ff       	jmp    2e7787c <MT2063_SetReceiverMode+0x143c>
18bf  2e77cff:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2e77d02: R_X86_64_32S	.rodata+0x84fec0
18c6  2e77d06:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	2e77d09: R_X86_64_32S	.rodata.str1.1+0x5de08
18cd  2e77d0d:	e8 00 00 00 00       	call   2e77d12 <MT2063_SetReceiverMode+0x18d2>	2e77d0e: R_X86_64_PLT32	_printk-0x4
18d2  2e77d12:	e9 ce ea ff ff       	jmp    2e767e5 <MT2063_SetReceiverMode+0x3a5>
18d7  2e77d17:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2e77d1a: R_X86_64_32S	.rodata+0x84fec0
18de  2e77d1e:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	2e77d21: R_X86_64_32S	.rodata.str1.1+0x5de08
18e5  2e77d25:	e8 00 00 00 00       	call   2e77d2a <MT2063_SetReceiverMode+0x18ea>	2e77d26: R_X86_64_PLT32	_printk-0x4
18ea  2e77d2a:	e9 a1 ed ff ff       	jmp    2e76ad0 <MT2063_SetReceiverMode+0x690>
18ef  2e77d2f:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2e77d32: R_X86_64_32S	.rodata+0x84fec0
18f6  2e77d36:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	2e77d39: R_X86_64_32S	.rodata.str1.1+0x5de08
18fd  2e77d3d:	e8 00 00 00 00       	call   2e77d42 <MT2063_SetReceiverMode+0x1902>	2e77d3e: R_X86_64_PLT32	_printk-0x4
1902  2e77d42:	e9 36 ee ff ff       	jmp    2e76b7d <MT2063_SetReceiverMode+0x73d>
1907  2e77d47:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2e77d4a: R_X86_64_32S	.rodata+0x84fec0
190e  2e77d4e:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	2e77d51: R_X86_64_32S	.rodata.str1.1+0x5de08
1915  2e77d55:	e8 00 00 00 00       	call   2e77d5a <MT2063_SetReceiverMode+0x191a>	2e77d56: R_X86_64_PLT32	_printk-0x4
191a  2e77d5a:	e9 41 ef ff ff       	jmp    2e76ca0 <MT2063_SetReceiverMode+0x860>
191f  2e77d5f:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2e77d62: R_X86_64_32S	.rodata+0x84fec0
1926  2e77d66:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	2e77d69: R_X86_64_32S	.rodata.str1.1+0x5de08
192d  2e77d6d:	e8 00 00 00 00       	call   2e77d72 <MT2063_SetReceiverMode+0x1932>	2e77d6e: R_X86_64_PLT32	_printk-0x4
1932  2e77d72:	e9 ed ef ff ff       	jmp    2e76d64 <MT2063_SetReceiverMode+0x924>
1937  2e77d77:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2e77d7a: R_X86_64_32S	.rodata+0x84fec0
193e  2e77d7e:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	2e77d81: R_X86_64_32S	.rodata.str1.1+0x5de08
1945  2e77d85:	e8 00 00 00 00       	call   2e77d8a <MT2063_SetReceiverMode+0x194a>	2e77d86: R_X86_64_PLT32	_printk-0x4
194a  2e77d8a:	e9 91 f0 ff ff       	jmp    2e76e20 <MT2063_SetReceiverMode+0x9e0>
194f  2e77d8f:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2e77d92: R_X86_64_32S	.rodata+0x84fec0
1956  2e77d96:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	2e77d99: R_X86_64_32S	.rodata.str1.1+0x5de08
195d  2e77d9d:	e8 00 00 00 00       	call   2e77da2 <MT2063_SetReceiverMode+0x1962>	2e77d9e: R_X86_64_PLT32	_printk-0x4
1962  2e77da2:	e9 8c f1 ff ff       	jmp    2e76f33 <MT2063_SetReceiverMode+0xaf3>
1967  2e77da7:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2e77daa: R_X86_64_32S	.rodata+0x84fec0
196e  2e77dae:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	2e77db1: R_X86_64_32S	.rodata.str1.1+0x5de08
1975  2e77db5:	e8 00 00 00 00       	call   2e77dba <MT2063_SetReceiverMode+0x197a>	2e77db6: R_X86_64_PLT32	_printk-0x4
197a  2e77dba:	e9 85 f2 ff ff       	jmp    2e77044 <MT2063_SetReceiverMode+0xc04>
197f  2e77dbf:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2e77dc2: R_X86_64_32S	.rodata+0x84fec0
1986  2e77dc6:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	2e77dc9: R_X86_64_32S	.rodata.str1.1+0x5de08
198d  2e77dcd:	e8 00 00 00 00       	call   2e77dd2 <MT2063_SetReceiverMode+0x1992>	2e77dce: R_X86_64_PLT32	_printk-0x4
1992  2e77dd2:	e9 36 f3 ff ff       	jmp    2e7710d <MT2063_SetReceiverMode+0xccd>
1997  2e77dd7:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2e77dda: R_X86_64_32S	.rodata+0x84fec0
199e  2e77dde:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	2e77de1: R_X86_64_32S	.rodata.str1.1+0x5de08
19a5  2e77de5:	e8 00 00 00 00       	call   2e77dea <MT2063_SetReceiverMode+0x19aa>	2e77de6: R_X86_64_PLT32	_printk-0x4
19aa  2e77dea:	e9 f3 f3 ff ff       	jmp    2e771e2 <MT2063_SetReceiverMode+0xda2>
19af  2e77def:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2e77df2: R_X86_64_32S	.rodata+0x84fec0
19b6  2e77df6:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	2e77df9: R_X86_64_32S	.rodata.str1.1+0x5de08
19bd  2e77dfd:	e8 00 00 00 00       	call   2e77e02 <MT2063_SetReceiverMode+0x19c2>	2e77dfe: R_X86_64_PLT32	_printk-0x4
19c2  2e77e02:	e9 b0 f4 ff ff       	jmp    2e772b7 <MT2063_SetReceiverMode+0xe77>
19c7  2e77e07:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2e77e0a: R_X86_64_32S	.rodata+0x84fec0
19ce  2e77e0e:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	2e77e11: R_X86_64_32S	.rodata.str1.1+0x5de08
19d5  2e77e15:	e8 00 00 00 00       	call   2e77e1a <MT2063_SetReceiverMode+0x19da>	2e77e16: R_X86_64_PLT32	_printk-0x4
19da  2e77e1a:	e9 6d f5 ff ff       	jmp    2e7738c <MT2063_SetReceiverMode+0xf4c>
19df  2e77e1f:	44 89 cd             	mov    %r9d,%ebp
19e2  2e77e22:	4a 8d 1c c5 00 00 00 00 	lea    0x0(,%r8,8),%rbx	2e77e26: R_X86_64_32S	.rodata+0x850740
19ea  2e77e2a:	48 89 d8             	mov    %rbx,%rax
19ed  2e77e2d:	48 c1 e8 03          	shr    $0x3,%rax
19f1  2e77e31:	80 3c 30 00          	cmpb   $0x0,(%rax,%rsi,1)
19f5  2e77e35:	74 08                	je     2e77e3f <MT2063_SetReceiverMode+0x19ff>
19f7  2e77e37:	48 89 df             	mov    %rbx,%rdi
19fa  2e77e3a:	e8 00 00 00 00       	call   2e77e3f <MT2063_SetReceiverMode+0x19ff>	2e77e3b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
19ff  2e77e3f:	48 8b 13             	mov    (%rbx),%rdx
1a02  2e77e42:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2e77e45: R_X86_64_32S	.rodata+0x8506e0
1a09  2e77e49:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	2e77e4c: R_X86_64_32S	.rodata.str1.1+0x1ff64
1a10  2e77e50:	e8 00 00 00 00       	call   2e77e55 <MT2063_SetReceiverMode+0x1a15>	2e77e51: R_X86_64_PLT32	_printk-0x4
1a15  2e77e55:	41 89 e9             	mov    %ebp,%r9d
1a18  2e77e58:	e9 b8 fd ff ff       	jmp    2e77c15 <MT2063_SetReceiverMode+0x17d5>
1a1d  2e77e5d:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2e77e60: R_X86_64_32S	.rodata+0x84fec0
1a24  2e77e64:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	2e77e67: R_X86_64_32S	.rodata.str1.1+0x5de08
1a2b  2e77e6b:	e8 00 00 00 00       	call   2e77e70 <MT2063_SetReceiverMode+0x1a30>	2e77e6c: R_X86_64_PLT32	_printk-0x4
1a30  2e77e70:	e9 03 fb ff ff       	jmp    2e77978 <MT2063_SetReceiverMode+0x1538>
1a35  2e77e75:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2e77e78: R_X86_64_32S	.rodata+0x84fec0
1a3c  2e77e7c:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	2e77e7f: R_X86_64_32S	.rodata.str1.1+0x5de08
1a43  2e77e83:	e8 00 00 00 00       	call   2e77e88 <MT2063_SetReceiverMode+0x1a48>	2e77e84: R_X86_64_PLT32	_printk-0x4
1a48  2e77e88:	e9 d6 fb ff ff       	jmp    2e77a63 <MT2063_SetReceiverMode+0x1623>
1a4d  2e77e8d:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2e77e90: R_X86_64_32S	.rodata+0x84fec0
1a54  2e77e94:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	2e77e97: R_X86_64_32S	.rodata.str1.1+0x5de08
1a5b  2e77e9b:	e8 00 00 00 00       	call   2e77ea0 <MT2063_SetReceiverMode+0x1a60>	2e77e9c: R_X86_64_PLT32	_printk-0x4
1a60  2e77ea0:	e9 b0 fc ff ff       	jmp    2e77b55 <MT2063_SetReceiverMode+0x1715>
1a65  2e77ea5:	89 d9                	mov    %ebx,%ecx
1a67  2e77ea7:	80 e1 07             	and    $0x7,%cl
1a6a  2e77eaa:	38 c1                	cmp    %al,%cl
1a6c  2e77eac:	0f 8c df e5 ff ff    	jl     2e76491 <MT2063_SetReceiverMode+0x51>
1a72  2e77eb2:	48 89 df             	mov    %rbx,%rdi
1a75  2e77eb5:	e8 00 00 00 00       	call   2e77eba <MT2063_SetReceiverMode+0x1a7a>	2e77eb6: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
1a7a  2e77eba:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
1a7f  2e77ebf:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1a89  2e77ec9:	e9 c3 e5 ff ff       	jmp    2e76491 <MT2063_SetReceiverMode+0x51>
1a8e  2e77ece:	89 d9                	mov    %ebx,%ecx
1a90  2e77ed0:	80 e1 07             	and    $0x7,%cl
1a93  2e77ed3:	38 c1                	cmp    %al,%cl
1a95  2e77ed5:	0f 8c de e5 ff ff    	jl     2e764b9 <MT2063_SetReceiverMode+0x79>
1a9b  2e77edb:	48 89 df             	mov    %rbx,%rdi
1a9e  2e77ede:	e8 00 00 00 00       	call   2e77ee3 <MT2063_SetReceiverMode+0x1aa3>	2e77edf: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
1aa3  2e77ee3:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
1aa8  2e77ee8:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1ab2  2e77ef2:	e9 c2 e5 ff ff       	jmp    2e764b9 <MT2063_SetReceiverMode+0x79>
1ab7  2e77ef7:	89 f9                	mov    %edi,%ecx
1ab9  2e77ef9:	80 e1 07             	and    $0x7,%cl
1abc  2e77efc:	38 c1                	cmp    %al,%cl
1abe  2e77efe:	0f 8c 42 e8 ff ff    	jl     2e76746 <MT2063_SetReceiverMode+0x306>
1ac4  2e77f04:	48 89 fb             	mov    %rdi,%rbx
1ac7  2e77f07:	e8 00 00 00 00       	call   2e77f0c <MT2063_SetReceiverMode+0x1acc>	2e77f08: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
1acc  2e77f0c:	48 89 df             	mov    %rbx,%rdi
1acf  2e77f0f:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
1ad4  2e77f14:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1ade  2e77f1e:	e9 23 e8 ff ff       	jmp    2e76746 <MT2063_SetReceiverMode+0x306>
1ae3  2e77f23:	44 89 f9             	mov    %r15d,%ecx
1ae6  2e77f26:	80 e1 07             	and    $0x7,%cl
1ae9  2e77f29:	38 c1                	cmp    %al,%cl
1aeb  2e77f2b:	0f 8c 3d e8 ff ff    	jl     2e7676e <MT2063_SetReceiverMode+0x32e>
1af1  2e77f31:	48 89 fd             	mov    %rdi,%rbp
1af4  2e77f34:	4c 89 ff             	mov    %r15,%rdi
1af7  2e77f37:	e8 00 00 00 00       	call   2e77f3c <MT2063_SetReceiverMode+0x1afc>	2e77f38: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
1afc  2e77f3c:	48 89 ef             	mov    %rbp,%rdi
1aff  2e77f3f:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
1b04  2e77f44:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
1b09  2e77f49:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1b13  2e77f53:	e9 16 e8 ff ff       	jmp    2e7676e <MT2063_SetReceiverMode+0x32e>
1b18  2e77f58:	44 89 f1             	mov    %r14d,%ecx
1b1b  2e77f5b:	80 e1 07             	and    $0x7,%cl
1b1e  2e77f5e:	38 c1                	cmp    %al,%cl
1b20  2e77f60:	0f 8c 07 e6 ff ff    	jl     2e7656d <MT2063_SetReceiverMode+0x12d>
1b26  2e77f66:	4c 89 f7             	mov    %r14,%rdi
1b29  2e77f69:	e8 00 00 00 00       	call   2e77f6e <MT2063_SetReceiverMode+0x1b2e>	2e77f6a: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
1b2e  2e77f6e:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
1b33  2e77f73:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1b3d  2e77f7d:	e9 eb e5 ff ff       	jmp    2e7656d <MT2063_SetReceiverMode+0x12d>
1b42  2e77f82:	89 d9                	mov    %ebx,%ecx
1b44  2e77f84:	80 e1 07             	and    $0x7,%cl
1b47  2e77f87:	38 c1                	cmp    %al,%cl
1b49  2e77f89:	0f 8c 01 e6 ff ff    	jl     2e76590 <MT2063_SetReceiverMode+0x150>
1b4f  2e77f8f:	48 89 df             	mov    %rbx,%rdi
1b52  2e77f92:	e8 00 00 00 00       	call   2e77f97 <MT2063_SetReceiverMode+0x1b57>	2e77f93: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
1b57  2e77f97:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
1b5c  2e77f9c:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1b66  2e77fa6:	e9 e5 e5 ff ff       	jmp    2e76590 <MT2063_SetReceiverMode+0x150>
1b6b  2e77fab:	44 89 f1             	mov    %r14d,%ecx
1b6e  2e77fae:	80 e1 07             	and    $0x7,%cl
1b71  2e77fb1:	38 c1                	cmp    %al,%cl
1b73  2e77fb3:	0f 8c 76 e6 ff ff    	jl     2e7662f <MT2063_SetReceiverMode+0x1ef>
1b79  2e77fb9:	4c 89 f7             	mov    %r14,%rdi
1b7c  2e77fbc:	e8 00 00 00 00       	call   2e77fc1 <MT2063_SetReceiverMode+0x1b81>	2e77fbd: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
1b81  2e77fc1:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
1b86  2e77fc6:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1b90  2e77fd0:	e9 5a e6 ff ff       	jmp    2e7662f <MT2063_SetReceiverMode+0x1ef>
1b95  2e77fd5:	89 f9                	mov    %edi,%ecx
1b97  2e77fd7:	80 e1 07             	and    $0x7,%cl
1b9a  2e77fda:	38 c1                	cmp    %al,%cl
1b9c  2e77fdc:	0f 8c 70 e6 ff ff    	jl     2e76652 <MT2063_SetReceiverMode+0x212>
1ba2  2e77fe2:	e8 00 00 00 00       	call   2e77fe7 <MT2063_SetReceiverMode+0x1ba7>	2e77fe3: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
1ba7  2e77fe7:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
1bac  2e77fec:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1bb6  2e77ff6:	e9 57 e6 ff ff       	jmp    2e76652 <MT2063_SetReceiverMode+0x212>
1bbb  2e77ffb:	89 e9                	mov    %ebp,%ecx
1bbd  2e77ffd:	80 e1 07             	and    $0x7,%cl
1bc0  2e78000:	38 c1                	cmp    %al,%cl
1bc2  2e78002:	0f 8c 70 e6 ff ff    	jl     2e76678 <MT2063_SetReceiverMode+0x238>
1bc8  2e78008:	48 89 ef             	mov    %rbp,%rdi
1bcb  2e7800b:	e8 00 00 00 00       	call   2e78010 <MT2063_SetReceiverMode+0x1bd0>	2e7800c: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
1bd0  2e78010:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
1bd5  2e78015:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1bdf  2e7801f:	e9 54 e6 ff ff       	jmp    2e76678 <MT2063_SetReceiverMode+0x238>
1be4  2e78024:	44 89 f1             	mov    %r14d,%ecx
1be7  2e78027:	80 e1 07             	and    $0x7,%cl
1bea  2e7802a:	38 c1                	cmp    %al,%cl
1bec  2e7802c:	0f 8c e8 f3 ff ff    	jl     2e7741a <MT2063_SetReceiverMode+0xfda>
1bf2  2e78032:	4c 89 f7             	mov    %r14,%rdi
1bf5  2e78035:	44 89 cb             	mov    %r9d,%ebx
1bf8  2e78038:	e8 00 00 00 00       	call   2e7803d <MT2063_SetReceiverMode+0x1bfd>	2e78039: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
1bfd  2e7803d:	41 89 d9             	mov    %ebx,%r9d
1c00  2e78040:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
1c05  2e78045:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1c0f  2e7804f:	e9 c6 f3 ff ff       	jmp    2e7741a <MT2063_SetReceiverMode+0xfda>
1c14  2e78054:	89 d9                	mov    %ebx,%ecx
1c16  2e78056:	80 e1 07             	and    $0x7,%cl
1c19  2e78059:	38 c1                	cmp    %al,%cl
1c1b  2e7805b:	0f 8c dc f3 ff ff    	jl     2e7743d <MT2063_SetReceiverMode+0xffd>
1c21  2e78061:	48 89 df             	mov    %rbx,%rdi
1c24  2e78064:	44 89 4c 24 18       	mov    %r9d,0x18(%rsp)
1c29  2e78069:	e8 00 00 00 00       	call   2e7806e <MT2063_SetReceiverMode+0x1c2e>	2e7806a: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
1c2e  2e7806e:	44 8b 4c 24 18       	mov    0x18(%rsp),%r9d
1c33  2e78073:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
1c38  2e78078:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1c42  2e78082:	e9 b6 f3 ff ff       	jmp    2e7743d <MT2063_SetReceiverMode+0xffd>
1c47  2e78087:	89 f9                	mov    %edi,%ecx
1c49  2e78089:	80 e1 07             	and    $0x7,%cl
1c4c  2e7808c:	38 c1                	cmp    %al,%cl
1c4e  2e7808e:	0f 8c 7a f4 ff ff    	jl     2e7750e <MT2063_SetReceiverMode+0x10ce>
1c54  2e78094:	44 89 cb             	mov    %r9d,%ebx
1c57  2e78097:	e8 00 00 00 00       	call   2e7809c <MT2063_SetReceiverMode+0x1c5c>	2e78098: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
1c5c  2e7809c:	41 89 d9             	mov    %ebx,%r9d
1c5f  2e7809f:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
1c64  2e780a4:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
1c69  2e780a9:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1c73  2e780b3:	e9 56 f4 ff ff       	jmp    2e7750e <MT2063_SetReceiverMode+0x10ce>
1c78  2e780b8:	89 d9                	mov    %ebx,%ecx
1c7a  2e780ba:	80 e1 07             	and    $0x7,%cl
1c7d  2e780bd:	38 c1                	cmp    %al,%cl
1c7f  2e780bf:	0f 8c 6c f4 ff ff    	jl     2e77531 <MT2063_SetReceiverMode+0x10f1>
1c85  2e780c5:	48 89 df             	mov    %rbx,%rdi
1c88  2e780c8:	45 89 ce             	mov    %r9d,%r14d
1c8b  2e780cb:	e8 00 00 00 00       	call   2e780d0 <MT2063_SetReceiverMode+0x1c90>	2e780cc: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
1c90  2e780d0:	45 89 f1             	mov    %r14d,%r9d
1c93  2e780d3:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
1c98  2e780d8:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1ca2  2e780e2:	e9 4a f4 ff ff       	jmp    2e77531 <MT2063_SetReceiverMode+0x10f1>
1ca7  2e780e7:	48 8d 4c 24 07       	lea    0x7(%rsp),%rcx
1cac  2e780ec:	80 e1 07             	and    $0x7,%cl
1caf  2e780ef:	38 c1                	cmp    %al,%cl
1cb1  2e780f1:	0f 8c f0 e3 ff ff    	jl     2e764e7 <MT2063_SetReceiverMode+0xa7>
1cb7  2e780f7:	48 8d 7c 24 07       	lea    0x7(%rsp),%rdi
1cbc  2e780fc:	e8 00 00 00 00       	call   2e78101 <MT2063_SetReceiverMode+0x1cc1>	2e780fd: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
1cc1  2e78101:	e9 e1 e3 ff ff       	jmp    2e764e7 <MT2063_SetReceiverMode+0xa7>
1cc6  2e78106:	44 89 e1             	mov    %r12d,%ecx
1cc9  2e78109:	80 e1 07             	and    $0x7,%cl
1ccc  2e7810c:	38 c1                	cmp    %al,%cl
1cce  2e7810e:	0f 8c f2 f4 ff ff    	jl     2e77606 <MT2063_SetReceiverMode+0x11c6>
1cd4  2e78114:	4c 89 e7             	mov    %r12,%rdi
1cd7  2e78117:	44 89 cb             	mov    %r9d,%ebx
1cda  2e7811a:	e8 00 00 00 00       	call   2e7811f <MT2063_SetReceiverMode+0x1cdf>	2e7811b: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
1cdf  2e7811f:	41 89 d9             	mov    %ebx,%r9d
1ce2  2e78122:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
1ce7  2e78127:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1cf1  2e78131:	e9 d0 f4 ff ff       	jmp    2e77606 <MT2063_SetReceiverMode+0x11c6>
1cf6  2e78136:	89 d9                	mov    %ebx,%ecx
1cf8  2e78138:	80 e1 07             	and    $0x7,%cl
1cfb  2e7813b:	38 c1                	cmp    %al,%cl
1cfd  2e7813d:	0f 8c e7 f4 ff ff    	jl     2e7762a <MT2063_SetReceiverMode+0x11ea>
1d03  2e78143:	48 89 df             	mov    %rbx,%rdi
1d06  2e78146:	44 89 4c 24 18       	mov    %r9d,0x18(%rsp)
1d0b  2e7814b:	e8 00 00 00 00       	call   2e78150 <MT2063_SetReceiverMode+0x1d10>	2e7814c: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
1d10  2e78150:	44 8b 4c 24 18       	mov    0x18(%rsp),%r9d
1d15  2e78155:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
1d1a  2e7815a:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1d24  2e78164:	e9 c1 f4 ff ff       	jmp    2e7762a <MT2063_SetReceiverMode+0x11ea>
1d29  2e78169:	48 8d 4c 24 07       	lea    0x7(%rsp),%rcx
1d2e  2e7816e:	80 e1 07             	and    $0x7,%cl
1d31  2e78171:	38 c1                	cmp    %al,%cl
1d33  2e78173:	0f 8c 38 e4 ff ff    	jl     2e765b1 <MT2063_SetReceiverMode+0x171>
1d39  2e78179:	48 8d 7c 24 07       	lea    0x7(%rsp),%rdi
1d3e  2e7817e:	e8 00 00 00 00       	call   2e78183 <MT2063_SetReceiverMode+0x1d43>	2e7817f: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
1d43  2e78183:	e9 29 e4 ff ff       	jmp    2e765b1 <MT2063_SetReceiverMode+0x171>
1d48  2e78188:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
1d4d  2e7818d:	80 e1 07             	and    $0x7,%cl
1d50  2e78190:	38 c1                	cmp    %al,%cl
1d52  2e78192:	0f 8c 60 f5 ff ff    	jl     2e776f8 <MT2063_SetReceiverMode+0x12b8>
1d58  2e78198:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
1d5d  2e7819d:	44 89 cb             	mov    %r9d,%ebx
1d60  2e781a0:	e8 00 00 00 00       	call   2e781a5 <MT2063_SetReceiverMode+0x1d65>	2e781a1: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
1d65  2e781a5:	41 89 d9             	mov    %ebx,%r9d
1d68  2e781a8:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
1d6d  2e781ad:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1d77  2e781b7:	e9 3c f5 ff ff       	jmp    2e776f8 <MT2063_SetReceiverMode+0x12b8>
1d7c  2e781bc:	89 d9                	mov    %ebx,%ecx
1d7e  2e781be:	80 e1 07             	and    $0x7,%cl
1d81  2e781c1:	38 c1                	cmp    %al,%cl
1d83  2e781c3:	0f 8c 57 f5 ff ff    	jl     2e77720 <MT2063_SetReceiverMode+0x12e0>
1d89  2e781c9:	48 89 df             	mov    %rbx,%rdi
1d8c  2e781cc:	45 89 cc             	mov    %r9d,%r12d
1d8f  2e781cf:	e8 00 00 00 00       	call   2e781d4 <MT2063_SetReceiverMode+0x1d94>	2e781d0: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
1d94  2e781d4:	45 89 e1             	mov    %r12d,%r9d
1d97  2e781d7:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
1d9c  2e781dc:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1da6  2e781e6:	e9 35 f5 ff ff       	jmp    2e77720 <MT2063_SetReceiverMode+0x12e0>
1dab  2e781eb:	48 8d 4c 24 07       	lea    0x7(%rsp),%rcx
1db0  2e781f0:	80 e1 07             	and    $0x7,%cl
1db3  2e781f3:	38 c1                	cmp    %al,%cl
1db5  2e781f5:	0f 8c a8 e4 ff ff    	jl     2e766a3 <MT2063_SetReceiverMode+0x263>
1dbb  2e781fb:	48 8d 7c 24 07       	lea    0x7(%rsp),%rdi
1dc0  2e78200:	e8 00 00 00 00       	call   2e78205 <MT2063_SetReceiverMode+0x1dc5>	2e78201: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
1dc5  2e78205:	e9 99 e4 ff ff       	jmp    2e766a3 <MT2063_SetReceiverMode+0x263>
1dca  2e7820a:	44 89 f1             	mov    %r14d,%ecx
1dcd  2e7820d:	80 e1 07             	and    $0x7,%cl
1dd0  2e78210:	38 c1                	cmp    %al,%cl
1dd2  2e78212:	0f 8c 59 e6 ff ff    	jl     2e76871 <MT2063_SetReceiverMode+0x431>
1dd8  2e78218:	4c 89 f7             	mov    %r14,%rdi
1ddb  2e7821b:	e8 00 00 00 00       	call   2e78220 <MT2063_SetReceiverMode+0x1de0>	2e7821c: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
1de0  2e78220:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1dea  2e7822a:	e9 42 e6 ff ff       	jmp    2e76871 <MT2063_SetReceiverMode+0x431>
1def  2e7822f:	48 8d 4c 24 07       	lea    0x7(%rsp),%rcx
1df4  2e78234:	80 e1 07             	and    $0x7,%cl
1df7  2e78237:	38 c1                	cmp    %al,%cl
1df9  2e78239:	0f 8c 48 e6 ff ff    	jl     2e76887 <MT2063_SetReceiverMode+0x447>
1dff  2e7823f:	48 8d 7c 24 07       	lea    0x7(%rsp),%rdi
1e04  2e78244:	e8 00 00 00 00       	call   2e78249 <MT2063_SetReceiverMode+0x1e09>	2e78245: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
1e09  2e78249:	e9 39 e6 ff ff       	jmp    2e76887 <MT2063_SetReceiverMode+0x447>
1e0e  2e7824e:	44 89 f1             	mov    %r14d,%ecx
1e11  2e78251:	80 e1 07             	and    $0x7,%cl
1e14  2e78254:	38 c1                	cmp    %al,%cl
1e16  2e78256:	0f 8c ac e6 ff ff    	jl     2e76908 <MT2063_SetReceiverMode+0x4c8>
1e1c  2e7825c:	4c 89 f7             	mov    %r14,%rdi
1e1f  2e7825f:	e8 00 00 00 00       	call   2e78264 <MT2063_SetReceiverMode+0x1e24>	2e78260: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
1e24  2e78264:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1e2e  2e7826e:	e9 95 e6 ff ff       	jmp    2e76908 <MT2063_SetReceiverMode+0x4c8>
1e33  2e78273:	48 8d 4c 24 07       	lea    0x7(%rsp),%rcx
1e38  2e78278:	80 e1 07             	and    $0x7,%cl
1e3b  2e7827b:	38 c1                	cmp    %al,%cl
1e3d  2e7827d:	0f 8c 9b e6 ff ff    	jl     2e7691e <MT2063_SetReceiverMode+0x4de>
1e43  2e78283:	48 8d 7c 24 07       	lea    0x7(%rsp),%rdi
1e48  2e78288:	e8 00 00 00 00       	call   2e7828d <MT2063_SetReceiverMode+0x1e4d>	2e78289: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
1e4d  2e7828d:	e9 8c e6 ff ff       	jmp    2e7691e <MT2063_SetReceiverMode+0x4de>
1e52  2e78292:	48 8d 4c 24 07       	lea    0x7(%rsp),%rcx
1e57  2e78297:	80 e1 07             	and    $0x7,%cl
1e5a  2e7829a:	38 c1                	cmp    %al,%cl
1e5c  2e7829c:	0f 8c 91 e2 ff ff    	jl     2e76533 <MT2063_SetReceiverMode+0xf3>
1e62  2e782a2:	48 8d 7c 24 07       	lea    0x7(%rsp),%rdi
1e67  2e782a7:	e8 00 00 00 00       	call   2e782ac <MT2063_SetReceiverMode+0x1e6c>	2e782a8: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
1e6c  2e782ac:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1e76  2e782b6:	e9 78 e2 ff ff       	jmp    2e76533 <MT2063_SetReceiverMode+0xf3>
1e7b  2e782bb:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
1e80  2e782c0:	80 e1 07             	and    $0x7,%cl
1e83  2e782c3:	38 c1                	cmp    %al,%cl
1e85  2e782c5:	0f 8c 81 e2 ff ff    	jl     2e7654c <MT2063_SetReceiverMode+0x10c>
1e8b  2e782cb:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
1e90  2e782d0:	e8 00 00 00 00       	call   2e782d5 <MT2063_SetReceiverMode+0x1e95>	2e782d1: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
1e95  2e782d5:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
1e9a  2e782da:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1ea4  2e782e4:	e9 63 e2 ff ff       	jmp    2e7654c <MT2063_SetReceiverMode+0x10c>
1ea9  2e782e9:	48 8d 4c 24 07       	lea    0x7(%rsp),%rcx
1eae  2e782ee:	80 e1 07             	and    $0x7,%cl
1eb1  2e782f1:	38 c1                	cmp    %al,%cl
1eb3  2e782f3:	0f 8c 69 f1 ff ff    	jl     2e77462 <MT2063_SetReceiverMode+0x1022>
1eb9  2e782f9:	48 8d 7c 24 07       	lea    0x7(%rsp),%rdi
1ebe  2e782fe:	45 89 cf             	mov    %r9d,%r15d
1ec1  2e78301:	e8 00 00 00 00       	call   2e78306 <MT2063_SetReceiverMode+0x1ec6>	2e78302: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
1ec6  2e78306:	45 89 f9             	mov    %r15d,%r9d
1ec9  2e78309:	e9 54 f1 ff ff       	jmp    2e77462 <MT2063_SetReceiverMode+0x1022>
1ece  2e7830e:	89 d9                	mov    %ebx,%ecx
1ed0  2e78310:	80 e1 07             	and    $0x7,%cl
1ed3  2e78313:	38 c1                	cmp    %al,%cl
1ed5  2e78315:	0f 8c d8 f4 ff ff    	jl     2e777f3 <MT2063_SetReceiverMode+0x13b3>
1edb  2e7831b:	48 89 df             	mov    %rbx,%rdi
1ede  2e7831e:	44 89 cd             	mov    %r9d,%ebp
1ee1  2e78321:	e8 00 00 00 00       	call   2e78326 <MT2063_SetReceiverMode+0x1ee6>	2e78322: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
1ee6  2e78326:	41 89 e9             	mov    %ebp,%r9d
1ee9  2e78329:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
1eee  2e7832e:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1ef8  2e78338:	e9 b6 f4 ff ff       	jmp    2e777f3 <MT2063_SetReceiverMode+0x13b3>
1efd  2e7833d:	89 f9                	mov    %edi,%ecx
1eff  2e7833f:	80 e1 07             	and    $0x7,%cl
1f02  2e78342:	38 c1                	cmp    %al,%cl
1f04  2e78344:	0f 8c c2 f4 ff ff    	jl     2e7780c <MT2063_SetReceiverMode+0x13cc>
1f0a  2e7834a:	44 89 cd             	mov    %r9d,%ebp
1f0d  2e7834d:	e8 00 00 00 00       	call   2e78352 <MT2063_SetReceiverMode+0x1f12>	2e7834e: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
1f12  2e78352:	41 89 e9             	mov    %ebp,%r9d
1f15  2e78355:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
1f1a  2e7835a:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1f24  2e78364:	e9 a3 f4 ff ff       	jmp    2e7780c <MT2063_SetReceiverMode+0x13cc>
1f29  2e78369:	44 89 e1             	mov    %r12d,%ecx
1f2c  2e7836c:	80 e1 07             	and    $0x7,%cl
1f2f  2e7836f:	38 c1                	cmp    %al,%cl
1f31  2e78371:	0f 8c b8 f4 ff ff    	jl     2e7782f <MT2063_SetReceiverMode+0x13ef>
1f37  2e78377:	4c 89 e7             	mov    %r12,%rdi
1f3a  2e7837a:	44 89 4c 24 18       	mov    %r9d,0x18(%rsp)
1f3f  2e7837f:	e8 00 00 00 00       	call   2e78384 <MT2063_SetReceiverMode+0x1f44>	2e78380: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
1f44  2e78384:	44 8b 4c 24 18       	mov    0x18(%rsp),%r9d
1f49  2e78389:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
1f4e  2e7838e:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1f58  2e78398:	e9 92 f4 ff ff       	jmp    2e7782f <MT2063_SetReceiverMode+0x13ef>
1f5d  2e7839d:	48 8d 4c 24 07       	lea    0x7(%rsp),%rcx
1f62  2e783a2:	80 e1 07             	and    $0x7,%cl
1f65  2e783a5:	38 c1                	cmp    %al,%cl
1f67  2e783a7:	0f 8c 50 e2 ff ff    	jl     2e765fd <MT2063_SetReceiverMode+0x1bd>
1f6d  2e783ad:	48 8d 7c 24 07       	lea    0x7(%rsp),%rdi
1f72  2e783b2:	e8 00 00 00 00       	call   2e783b7 <MT2063_SetReceiverMode+0x1f77>	2e783b3: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
1f77  2e783b7:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1f81  2e783c1:	e9 37 e2 ff ff       	jmp    2e765fd <MT2063_SetReceiverMode+0x1bd>
1f86  2e783c6:	44 89 f1             	mov    %r14d,%ecx
1f89  2e783c9:	80 e1 07             	and    $0x7,%cl
1f8c  2e783cc:	38 c1                	cmp    %al,%cl
1f8e  2e783ce:	0f 8c 3e e2 ff ff    	jl     2e76612 <MT2063_SetReceiverMode+0x1d2>
1f94  2e783d4:	4c 89 f7             	mov    %r14,%rdi
1f97  2e783d7:	e8 00 00 00 00       	call   2e783dc <MT2063_SetReceiverMode+0x1f9c>	2e783d8: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
1f9c  2e783dc:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
1fa1  2e783e1:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
1fab  2e783eb:	e9 22 e2 ff ff       	jmp    2e76612 <MT2063_SetReceiverMode+0x1d2>
1fb0  2e783f0:	48 8d 4c 24 07       	lea    0x7(%rsp),%rcx
1fb5  2e783f5:	80 e1 07             	and    $0x7,%cl
1fb8  2e783f8:	38 c1                	cmp    %al,%cl
1fba  2e783fa:	0f 8c 56 f1 ff ff    	jl     2e77556 <MT2063_SetReceiverMode+0x1116>
1fc0  2e78400:	48 8d 7c 24 07       	lea    0x7(%rsp),%rdi
1fc5  2e78405:	44 89 cd             	mov    %r9d,%ebp
1fc8  2e78408:	e8 00 00 00 00       	call   2e7840d <MT2063_SetReceiverMode+0x1fcd>	2e78409: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
1fcd  2e7840d:	41 89 e9             	mov    %ebp,%r9d
1fd0  2e78410:	e9 41 f1 ff ff       	jmp    2e77556 <MT2063_SetReceiverMode+0x1116>
1fd5  2e78415:	89 f9                	mov    %edi,%ecx
1fd7  2e78417:	80 e1 07             	and    $0x7,%cl
1fda  2e7841a:	38 c1                	cmp    %al,%cl
1fdc  2e7841c:	0f 8c 87 e3 ff ff    	jl     2e767a9 <MT2063_SetReceiverMode+0x369>
1fe2  2e78422:	48 89 fb             	mov    %rdi,%rbx
1fe5  2e78425:	e8 00 00 00 00       	call   2e7842a <MT2063_SetReceiverMode+0x1fea>	2e78426: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
1fea  2e7842a:	48 89 df             	mov    %rbx,%rdi
1fed  2e7842d:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
1ff2  2e78432:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
1ff7  2e78437:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2001  2e78441:	e9 63 e3 ff ff       	jmp    2e767a9 <MT2063_SetReceiverMode+0x369>
2006  2e78446:	89 f9                	mov    %edi,%ecx
2008  2e78448:	80 e1 07             	and    $0x7,%cl
200b  2e7844b:	38 c1                	cmp    %al,%cl
200d  2e7844d:	0f 8c e1 e5 ff ff    	jl     2e76a34 <MT2063_SetReceiverMode+0x5f4>
2013  2e78453:	48 89 fb             	mov    %rdi,%rbx
2016  2e78456:	e8 00 00 00 00       	call   2e7845b <MT2063_SetReceiverMode+0x201b>	2e78457: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
201b  2e7845b:	48 89 df             	mov    %rbx,%rdi
201e  2e7845e:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
2023  2e78463:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
2028  2e78468:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2032  2e78472:	e9 bd e5 ff ff       	jmp    2e76a34 <MT2063_SetReceiverMode+0x5f4>
2037  2e78477:	89 e9                	mov    %ebp,%ecx
2039  2e78479:	80 e1 07             	and    $0x7,%cl
203c  2e7847c:	80 c1 03             	add    $0x3,%cl
203f  2e7847f:	38 c1                	cmp    %al,%cl
2041  2e78481:	0f 8c cd e5 ff ff    	jl     2e76a54 <MT2063_SetReceiverMode+0x614>
2047  2e78487:	48 89 fb             	mov    %rdi,%rbx
204a  2e7848a:	48 89 ef             	mov    %rbp,%rdi
204d  2e7848d:	e8 00 00 00 00       	call   2e78492 <MT2063_SetReceiverMode+0x2052>	2e7848e: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
2052  2e78492:	48 89 df             	mov    %rbx,%rdi
2055  2e78495:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
205a  2e7849a:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
205f  2e7849f:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2069  2e784a9:	e9 a6 e5 ff ff       	jmp    2e76a54 <MT2063_SetReceiverMode+0x614>
206e  2e784ae:	89 e9                	mov    %ebp,%ecx
2070  2e784b0:	80 e1 07             	and    $0x7,%cl
2073  2e784b3:	38 c1                	cmp    %al,%cl
2075  2e784b5:	0f 8c c3 e5 ff ff    	jl     2e76a7e <MT2063_SetReceiverMode+0x63e>
207b  2e784bb:	48 89 fb             	mov    %rdi,%rbx
207e  2e784be:	48 89 ef             	mov    %rbp,%rdi
2081  2e784c1:	e8 00 00 00 00       	call   2e784c6 <MT2063_SetReceiverMode+0x2086>	2e784c2: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
2086  2e784c6:	48 89 df             	mov    %rbx,%rdi
2089  2e784c9:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
208e  2e784ce:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
2093  2e784d3:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
209d  2e784dd:	e9 9c e5 ff ff       	jmp    2e76a7e <MT2063_SetReceiverMode+0x63e>
20a2  2e784e2:	89 f9                	mov    %edi,%ecx
20a4  2e784e4:	80 e1 07             	and    $0x7,%cl
20a7  2e784e7:	38 c1                	cmp    %al,%cl
20a9  2e784e9:	0f 8c a4 e5 ff ff    	jl     2e76a93 <MT2063_SetReceiverMode+0x653>
20af  2e784ef:	48 89 fd             	mov    %rdi,%rbp
20b2  2e784f2:	e8 00 00 00 00       	call   2e784f7 <MT2063_SetReceiverMode+0x20b7>	2e784f3: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
20b7  2e784f7:	48 89 ef             	mov    %rbp,%rdi
20ba  2e784fa:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
20bf  2e784ff:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
20c4  2e78504:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
20ce  2e7850e:	e9 80 e5 ff ff       	jmp    2e76a93 <MT2063_SetReceiverMode+0x653>
20d3  2e78513:	89 f9                	mov    %edi,%ecx
20d5  2e78515:	80 e1 07             	and    $0x7,%cl
20d8  2e78518:	38 c1                	cmp    %al,%cl
20da  2e7851a:	0f 8c 21 e6 ff ff    	jl     2e76b41 <MT2063_SetReceiverMode+0x701>
20e0  2e78520:	48 89 fb             	mov    %rdi,%rbx
20e3  2e78523:	e8 00 00 00 00       	call   2e78528 <MT2063_SetReceiverMode+0x20e8>	2e78524: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
20e8  2e78528:	48 89 df             	mov    %rbx,%rdi
20eb  2e7852b:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
20f0  2e78530:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
20f5  2e78535:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
20ff  2e7853f:	e9 fd e5 ff ff       	jmp    2e76b41 <MT2063_SetReceiverMode+0x701>
2104  2e78544:	89 f9                	mov    %edi,%ecx
2106  2e78546:	80 e1 07             	and    $0x7,%cl
2109  2e78549:	38 c1                	cmp    %al,%cl
210b  2e7854b:	0f 8c a7 e6 ff ff    	jl     2e76bf8 <MT2063_SetReceiverMode+0x7b8>
2111  2e78551:	48 89 fb             	mov    %rdi,%rbx
2114  2e78554:	e8 00 00 00 00       	call   2e78559 <MT2063_SetReceiverMode+0x2119>	2e78555: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
2119  2e78559:	48 89 df             	mov    %rbx,%rdi
211c  2e7855c:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
2121  2e78561:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
2126  2e78566:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2130  2e78570:	e9 83 e6 ff ff       	jmp    2e76bf8 <MT2063_SetReceiverMode+0x7b8>
2135  2e78575:	44 89 d1             	mov    %r10d,%ecx
2138  2e78578:	80 e1 07             	and    $0x7,%cl
213b  2e7857b:	80 c1 03             	add    $0x3,%cl
213e  2e7857e:	38 c1                	cmp    %al,%cl
2140  2e78580:	0f 8c 99 e6 ff ff    	jl     2e76c1f <MT2063_SetReceiverMode+0x7df>
2146  2e78586:	48 89 fb             	mov    %rdi,%rbx
2149  2e78589:	4c 89 d7             	mov    %r10,%rdi
214c  2e7858c:	4c 89 d5             	mov    %r10,%rbp
214f  2e7858f:	e8 00 00 00 00       	call   2e78594 <MT2063_SetReceiverMode+0x2154>	2e78590: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
2154  2e78594:	49 89 ea             	mov    %rbp,%r10
2157  2e78597:	48 89 df             	mov    %rbx,%rdi
215a  2e7859a:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
215f  2e7859f:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
2164  2e785a4:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
216e  2e785ae:	e9 6c e6 ff ff       	jmp    2e76c1f <MT2063_SetReceiverMode+0x7df>
2173  2e785b3:	89 e9                	mov    %ebp,%ecx
2175  2e785b5:	80 e1 07             	and    $0x7,%cl
2178  2e785b8:	38 c1                	cmp    %al,%cl
217a  2e785ba:	0f 8c 89 e6 ff ff    	jl     2e76c49 <MT2063_SetReceiverMode+0x809>
2180  2e785c0:	48 89 7c 24 18       	mov    %rdi,0x18(%rsp)
2185  2e785c5:	48 89 ef             	mov    %rbp,%rdi
2188  2e785c8:	4c 89 d3             	mov    %r10,%rbx
218b  2e785cb:	e8 00 00 00 00       	call   2e785d0 <MT2063_SetReceiverMode+0x2190>	2e785cc: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
2190  2e785d0:	49 89 da             	mov    %rbx,%r10
2193  2e785d3:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
2198  2e785d8:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
219d  2e785dd:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
21a2  2e785e2:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
21ac  2e785ec:	e9 58 e6 ff ff       	jmp    2e76c49 <MT2063_SetReceiverMode+0x809>
21b1  2e785f1:	89 f9                	mov    %edi,%ecx
21b3  2e785f3:	80 e1 07             	and    $0x7,%cl
21b6  2e785f6:	38 c1                	cmp    %al,%cl
21b8  2e785f8:	0f 8c 60 e6 ff ff    	jl     2e76c5e <MT2063_SetReceiverMode+0x81e>
21be  2e785fe:	48 89 fd             	mov    %rdi,%rbp
21c1  2e78601:	4d 89 d5             	mov    %r10,%r13
21c4  2e78604:	e8 00 00 00 00       	call   2e78609 <MT2063_SetReceiverMode+0x21c9>	2e78605: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
21c9  2e78609:	4d 89 ea             	mov    %r13,%r10
21cc  2e7860c:	48 89 ef             	mov    %rbp,%rdi
21cf  2e7860f:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
21d4  2e78614:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
21d9  2e78619:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
21e3  2e78623:	e9 36 e6 ff ff       	jmp    2e76c5e <MT2063_SetReceiverMode+0x81e>
21e8  2e78628:	44 89 f9             	mov    %r15d,%ecx
21eb  2e7862b:	80 e1 07             	and    $0x7,%cl
21ee  2e7862e:	38 c1                	cmp    %al,%cl
21f0  2e78630:	0f 8c f6 e6 ff ff    	jl     2e76d2c <MT2063_SetReceiverMode+0x8ec>
21f6  2e78636:	4c 89 ff             	mov    %r15,%rdi
21f9  2e78639:	44 89 cb             	mov    %r9d,%ebx
21fc  2e7863c:	e8 00 00 00 00       	call   2e78641 <MT2063_SetReceiverMode+0x2201>	2e7863d: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
2201  2e78641:	41 89 d9             	mov    %ebx,%r9d
2204  2e78644:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
2209  2e78649:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2213  2e78653:	e9 d4 e6 ff ff       	jmp    2e76d2c <MT2063_SetReceiverMode+0x8ec>
2218  2e78658:	44 89 f9             	mov    %r15d,%ecx
221b  2e7865b:	80 e1 07             	and    $0x7,%cl
221e  2e7865e:	38 c1                	cmp    %al,%cl
2220  2e78660:	0f 8c 82 e7 ff ff    	jl     2e76de8 <MT2063_SetReceiverMode+0x9a8>
2226  2e78666:	4c 89 ff             	mov    %r15,%rdi
2229  2e78669:	44 89 cb             	mov    %r9d,%ebx
222c  2e7866c:	e8 00 00 00 00       	call   2e78671 <MT2063_SetReceiverMode+0x2231>	2e7866d: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
2231  2e78671:	41 89 d9             	mov    %ebx,%r9d
2234  2e78674:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
2239  2e78679:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2243  2e78683:	e9 60 e7 ff ff       	jmp    2e76de8 <MT2063_SetReceiverMode+0x9a8>
2248  2e78688:	44 89 f9             	mov    %r15d,%ecx
224b  2e7868b:	80 e1 07             	and    $0x7,%cl
224e  2e7868e:	38 c1                	cmp    %al,%cl
2250  2e78690:	0f 8c 0e e8 ff ff    	jl     2e76ea4 <MT2063_SetReceiverMode+0xa64>
2256  2e78696:	4c 89 ff             	mov    %r15,%rdi
2259  2e78699:	44 89 cb             	mov    %r9d,%ebx
225c  2e7869c:	e8 00 00 00 00       	call   2e786a1 <MT2063_SetReceiverMode+0x2261>	2e7869d: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
2261  2e786a1:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
2266  2e786a6:	41 89 d9             	mov    %ebx,%r9d
2269  2e786a9:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
226e  2e786ae:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2278  2e786b8:	e9 e7 e7 ff ff       	jmp    2e76ea4 <MT2063_SetReceiverMode+0xa64>
227d  2e786bd:	89 e9                	mov    %ebp,%ecx
227f  2e786bf:	80 e1 07             	and    $0x7,%cl
2282  2e786c2:	80 c1 03             	add    $0x3,%cl
2285  2e786c5:	38 c1                	cmp    %al,%cl
2287  2e786c7:	0f 8c f7 e7 ff ff    	jl     2e76ec4 <MT2063_SetReceiverMode+0xa84>
228d  2e786cd:	48 89 ef             	mov    %rbp,%rdi
2290  2e786d0:	44 89 cb             	mov    %r9d,%ebx
2293  2e786d3:	e8 00 00 00 00       	call   2e786d8 <MT2063_SetReceiverMode+0x2298>	2e786d4: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
2298  2e786d8:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
229d  2e786dd:	41 89 d9             	mov    %ebx,%r9d
22a0  2e786e0:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
22a5  2e786e5:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
22af  2e786ef:	e9 d0 e7 ff ff       	jmp    2e76ec4 <MT2063_SetReceiverMode+0xa84>
22b4  2e786f4:	89 e9                	mov    %ebp,%ecx
22b6  2e786f6:	80 e1 07             	and    $0x7,%cl
22b9  2e786f9:	38 c1                	cmp    %al,%cl
22bb  2e786fb:	0f 8c ed e7 ff ff    	jl     2e76eee <MT2063_SetReceiverMode+0xaae>
22c1  2e78701:	48 89 ef             	mov    %rbp,%rdi
22c4  2e78704:	44 89 cb             	mov    %r9d,%ebx
22c7  2e78707:	e8 00 00 00 00       	call   2e7870c <MT2063_SetReceiverMode+0x22cc>	2e78708: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
22cc  2e7870c:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
22d1  2e78711:	41 89 d9             	mov    %ebx,%r9d
22d4  2e78714:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
22d9  2e78719:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
22e3  2e78723:	e9 c6 e7 ff ff       	jmp    2e76eee <MT2063_SetReceiverMode+0xaae>
22e8  2e78728:	44 89 f9             	mov    %r15d,%ecx
22eb  2e7872b:	80 e1 07             	and    $0x7,%cl
22ee  2e7872e:	38 c1                	cmp    %al,%cl
22f0  2e78730:	0f 8c cc e7 ff ff    	jl     2e76f02 <MT2063_SetReceiverMode+0xac2>
22f6  2e78736:	4c 89 ff             	mov    %r15,%rdi
22f9  2e78739:	44 89 cd             	mov    %r9d,%ebp
22fc  2e7873c:	e8 00 00 00 00       	call   2e78741 <MT2063_SetReceiverMode+0x2301>	2e7873d: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
2301  2e78741:	41 89 e9             	mov    %ebp,%r9d
2304  2e78744:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
2309  2e78749:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2313  2e78753:	e9 aa e7 ff ff       	jmp    2e76f02 <MT2063_SetReceiverMode+0xac2>
2318  2e78758:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
231d  2e7875d:	80 e1 07             	and    $0x7,%cl
2320  2e78760:	38 c1                	cmp    %al,%cl
2322  2e78762:	0f 8c 54 e8 ff ff    	jl     2e76fbc <MT2063_SetReceiverMode+0xb7c>
2328  2e78768:	48 8b 7c 24 40       	mov    0x40(%rsp),%rdi
232d  2e7876d:	44 89 cb             	mov    %r9d,%ebx
2330  2e78770:	4c 89 d5             	mov    %r10,%rbp
2333  2e78773:	e8 00 00 00 00       	call   2e78778 <MT2063_SetReceiverMode+0x2338>	2e78774: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
2338  2e78778:	49 89 ea             	mov    %rbp,%r10
233b  2e7877b:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
2340  2e78780:	41 89 d9             	mov    %ebx,%r9d
2343  2e78783:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
2348  2e78788:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2352  2e78792:	e9 25 e8 ff ff       	jmp    2e76fbc <MT2063_SetReceiverMode+0xb7c>
2357  2e78797:	44 89 d1             	mov    %r10d,%ecx
235a  2e7879a:	80 e1 07             	and    $0x7,%cl
235d  2e7879d:	80 c1 03             	add    $0x3,%cl
2360  2e787a0:	38 c1                	cmp    %al,%cl
2362  2e787a2:	0f 8c 28 e8 ff ff    	jl     2e76fd0 <MT2063_SetReceiverMode+0xb90>
2368  2e787a8:	4c 89 d7             	mov    %r10,%rdi
236b  2e787ab:	44 89 cb             	mov    %r9d,%ebx
236e  2e787ae:	4c 89 d5             	mov    %r10,%rbp
2371  2e787b1:	e8 00 00 00 00       	call   2e787b6 <MT2063_SetReceiverMode+0x2376>	2e787b2: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
2376  2e787b6:	49 89 ea             	mov    %rbp,%r10
2379  2e787b9:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
237e  2e787be:	41 89 d9             	mov    %ebx,%r9d
2381  2e787c1:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
2386  2e787c6:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2390  2e787d0:	e9 fb e7 ff ff       	jmp    2e76fd0 <MT2063_SetReceiverMode+0xb90>
2395  2e787d5:	89 e9                	mov    %ebp,%ecx
2397  2e787d7:	80 e1 07             	and    $0x7,%cl
239a  2e787da:	38 c1                	cmp    %al,%cl
239c  2e787dc:	0f 8c 1d e8 ff ff    	jl     2e76fff <MT2063_SetReceiverMode+0xbbf>
23a2  2e787e2:	48 89 ef             	mov    %rbp,%rdi
23a5  2e787e5:	44 89 cb             	mov    %r9d,%ebx
23a8  2e787e8:	e8 00 00 00 00       	call   2e787ed <MT2063_SetReceiverMode+0x23ad>	2e787e9: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
23ad  2e787ed:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
23b2  2e787f2:	41 89 d9             	mov    %ebx,%r9d
23b5  2e787f5:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
23ba  2e787fa:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
23c4  2e78804:	e9 f6 e7 ff ff       	jmp    2e76fff <MT2063_SetReceiverMode+0xbbf>
23c9  2e78809:	44 89 f9             	mov    %r15d,%ecx
23cc  2e7880c:	80 e1 07             	and    $0x7,%cl
23cf  2e7880f:	38 c1                	cmp    %al,%cl
23d1  2e78811:	0f 8c fc e7 ff ff    	jl     2e77013 <MT2063_SetReceiverMode+0xbd3>
23d7  2e78817:	4c 89 ff             	mov    %r15,%rdi
23da  2e7881a:	44 89 cd             	mov    %r9d,%ebp
23dd  2e7881d:	e8 00 00 00 00       	call   2e78822 <MT2063_SetReceiverMode+0x23e2>	2e7881e: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
23e2  2e78822:	41 89 e9             	mov    %ebp,%r9d
23e5  2e78825:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
23ea  2e7882a:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
23f4  2e78834:	e9 da e7 ff ff       	jmp    2e77013 <MT2063_SetReceiverMode+0xbd3>
23f9  2e78839:	44 89 f1             	mov    %r14d,%ecx
23fc  2e7883c:	80 e1 07             	and    $0x7,%cl
23ff  2e7883f:	38 c1                	cmp    %al,%cl
2401  2e78841:	0f 8c 8e e8 ff ff    	jl     2e770d5 <MT2063_SetReceiverMode+0xc95>
2407  2e78847:	4c 89 f7             	mov    %r14,%rdi
240a  2e7884a:	44 89 cb             	mov    %r9d,%ebx
240d  2e7884d:	e8 00 00 00 00       	call   2e78852 <MT2063_SetReceiverMode+0x2412>	2e7884e: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
2412  2e78852:	41 89 d9             	mov    %ebx,%r9d
2415  2e78855:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
241a  2e7885a:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2424  2e78864:	e9 6c e8 ff ff       	jmp    2e770d5 <MT2063_SetReceiverMode+0xc95>
2429  2e78869:	44 89 f1             	mov    %r14d,%ecx
242c  2e7886c:	80 e1 07             	and    $0x7,%cl
242f  2e7886f:	38 c1                	cmp    %al,%cl
2431  2e78871:	0f 8c 33 e9 ff ff    	jl     2e771aa <MT2063_SetReceiverMode+0xd6a>
2437  2e78877:	4c 89 f7             	mov    %r14,%rdi
243a  2e7887a:	44 89 cb             	mov    %r9d,%ebx
243d  2e7887d:	e8 00 00 00 00       	call   2e78882 <MT2063_SetReceiverMode+0x2442>	2e7887e: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
2442  2e78882:	41 89 d9             	mov    %ebx,%r9d
2445  2e78885:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
244a  2e7888a:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2454  2e78894:	e9 11 e9 ff ff       	jmp    2e771aa <MT2063_SetReceiverMode+0xd6a>
2459  2e78899:	44 89 f1             	mov    %r14d,%ecx
245c  2e7889c:	80 e1 07             	and    $0x7,%cl
245f  2e7889f:	38 c1                	cmp    %al,%cl
2461  2e788a1:	0f 8c d8 e9 ff ff    	jl     2e7727f <MT2063_SetReceiverMode+0xe3f>
2467  2e788a7:	4c 89 f7             	mov    %r14,%rdi
246a  2e788aa:	44 89 cb             	mov    %r9d,%ebx
246d  2e788ad:	e8 00 00 00 00       	call   2e788b2 <MT2063_SetReceiverMode+0x2472>	2e788ae: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
2472  2e788b2:	41 89 d9             	mov    %ebx,%r9d
2475  2e788b5:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
247a  2e788ba:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2484  2e788c4:	e9 b6 e9 ff ff       	jmp    2e7727f <MT2063_SetReceiverMode+0xe3f>
2489  2e788c9:	44 89 f1             	mov    %r14d,%ecx
248c  2e788cc:	80 e1 07             	and    $0x7,%cl
248f  2e788cf:	38 c1                	cmp    %al,%cl
2491  2e788d1:	0f 8c 7d ea ff ff    	jl     2e77354 <MT2063_SetReceiverMode+0xf14>
2497  2e788d7:	4c 89 f7             	mov    %r14,%rdi
249a  2e788da:	44 89 cb             	mov    %r9d,%ebx
249d  2e788dd:	e8 00 00 00 00       	call   2e788e2 <MT2063_SetReceiverMode+0x24a2>	2e788de: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
24a2  2e788e2:	41 89 d9             	mov    %ebx,%r9d
24a5  2e788e5:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
24aa  2e788ea:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
24b4  2e788f4:	e9 5b ea ff ff       	jmp    2e77354 <MT2063_SetReceiverMode+0xf14>
24b9  2e788f9:	44 89 e1             	mov    %r12d,%ecx
24bc  2e788fc:	80 e1 07             	and    $0x7,%cl
24bf  2e788ff:	38 c1                	cmp    %al,%cl
24c1  2e78901:	0f 8c 09 f0 ff ff    	jl     2e77910 <MT2063_SetReceiverMode+0x14d0>
24c7  2e78907:	4c 89 e7             	mov    %r12,%rdi
24ca  2e7890a:	44 89 cb             	mov    %r9d,%ebx
24cd  2e7890d:	e8 00 00 00 00       	call   2e78912 <MT2063_SetReceiverMode+0x24d2>	2e7890e: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
24d2  2e78912:	41 89 d9             	mov    %ebx,%r9d
24d5  2e78915:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
24da  2e7891a:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
24e4  2e78924:	e9 e7 ef ff ff       	jmp    2e77910 <MT2063_SetReceiverMode+0x14d0>
24e9  2e78929:	89 d9                	mov    %ebx,%ecx
24eb  2e7892b:	80 e1 07             	and    $0x7,%cl
24ee  2e7892e:	38 c1                	cmp    %al,%cl
24f0  2e78930:	0f 8c fe ef ff ff    	jl     2e77934 <MT2063_SetReceiverMode+0x14f4>
24f6  2e78936:	48 89 df             	mov    %rbx,%rdi
24f9  2e78939:	44 89 4c 24 18       	mov    %r9d,0x18(%rsp)
24fe  2e7893e:	e8 00 00 00 00       	call   2e78943 <MT2063_SetReceiverMode+0x2503>	2e7893f: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
2503  2e78943:	44 8b 4c 24 18       	mov    0x18(%rsp),%r9d
2508  2e78948:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
250d  2e7894d:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2517  2e78957:	e9 d8 ef ff ff       	jmp    2e77934 <MT2063_SetReceiverMode+0x14f4>
251c  2e7895c:	48 8d 4c 24 07       	lea    0x7(%rsp),%rcx
2521  2e78961:	80 e1 07             	and    $0x7,%cl
2524  2e78964:	38 c1                	cmp    %al,%cl
2526  2e78966:	0f 8c 86 dd ff ff    	jl     2e766f2 <MT2063_SetReceiverMode+0x2b2>
252c  2e7896c:	48 8d 7c 24 07       	lea    0x7(%rsp),%rdi
2531  2e78971:	e8 00 00 00 00       	call   2e78976 <MT2063_SetReceiverMode+0x2536>	2e78972: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
2536  2e78976:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
2540  2e78980:	e9 6d dd ff ff       	jmp    2e766f2 <MT2063_SetReceiverMode+0x2b2>
2545  2e78985:	44 89 f1             	mov    %r14d,%ecx
2548  2e78988:	80 e1 07             	and    $0x7,%cl
254b  2e7898b:	38 c1                	cmp    %al,%cl
254d  2e7898d:	0f 8c 6f dd ff ff    	jl     2e76702 <MT2063_SetReceiverMode+0x2c2>
2553  2e78993:	4c 89 f7             	mov    %r14,%rdi
2556  2e78996:	e8 00 00 00 00       	call   2e7899b <MT2063_SetReceiverMode+0x255b>	2e78997: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
255b  2e7899b:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
2565  2e789a5:	e9 58 dd ff ff       	jmp    2e76702 <MT2063_SetReceiverMode+0x2c2>
256a  2e789aa:	48 8d 4c 24 07       	lea    0x7(%rsp),%rcx
256f  2e789af:	80 e1 07             	and    $0x7,%cl
2572  2e789b2:	38 c1                	cmp    %al,%cl
2574  2e789b4:	0f 8c 1d df ff ff    	jl     2e768d7 <MT2063_SetReceiverMode+0x497>
257a  2e789ba:	48 8d 7c 24 07       	lea    0x7(%rsp),%rdi
257f  2e789bf:	e8 00 00 00 00       	call   2e789c4 <MT2063_SetReceiverMode+0x2584>	2e789c0: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
2584  2e789c4:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
258e  2e789ce:	e9 04 df ff ff       	jmp    2e768d7 <MT2063_SetReceiverMode+0x497>
2593  2e789d3:	44 89 f1             	mov    %r14d,%ecx
2596  2e789d6:	80 e1 07             	and    $0x7,%cl
2599  2e789d9:	38 c1                	cmp    %al,%cl
259b  2e789db:	0f 8c 06 df ff ff    	jl     2e768e7 <MT2063_SetReceiverMode+0x4a7>
25a1  2e789e1:	4c 89 f7             	mov    %r14,%rdi
25a4  2e789e4:	e8 00 00 00 00       	call   2e789e9 <MT2063_SetReceiverMode+0x25a9>	2e789e5: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
25a9  2e789e9:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
25b3  2e789f3:	e9 ef de ff ff       	jmp    2e768e7 <MT2063_SetReceiverMode+0x4a7>
25b8  2e789f8:	48 8d 4c 24 07       	lea    0x7(%rsp),%rcx
25bd  2e789fd:	80 e1 07             	and    $0x7,%cl
25c0  2e78a00:	38 c1                	cmp    %al,%cl
25c2  2e78a02:	0f 8c 6d df ff ff    	jl     2e76975 <MT2063_SetReceiverMode+0x535>
25c8  2e78a08:	48 8d 7c 24 07       	lea    0x7(%rsp),%rdi
25cd  2e78a0d:	e8 00 00 00 00       	call   2e78a12 <MT2063_SetReceiverMode+0x25d2>	2e78a0e: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
25d2  2e78a12:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
25d7  2e78a17:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
25e1  2e78a21:	e9 4f df ff ff       	jmp    2e76975 <MT2063_SetReceiverMode+0x535>
25e6  2e78a26:	44 89 f1             	mov    %r14d,%ecx
25e9  2e78a29:	80 e1 07             	and    $0x7,%cl
25ec  2e78a2c:	38 c1                	cmp    %al,%cl
25ee  2e78a2e:	0f 8c 51 df ff ff    	jl     2e76985 <MT2063_SetReceiverMode+0x545>
25f4  2e78a34:	4c 89 f7             	mov    %r14,%rdi
25f7  2e78a37:	e8 00 00 00 00       	call   2e78a3c <MT2063_SetReceiverMode+0x25fc>	2e78a38: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
25fc  2e78a3c:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
2601  2e78a41:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
260b  2e78a4b:	e9 35 df ff ff       	jmp    2e76985 <MT2063_SetReceiverMode+0x545>
2610  2e78a50:	48 8d 4c 24 07       	lea    0x7(%rsp),%rcx
2615  2e78a55:	80 e1 07             	and    $0x7,%cl
2618  2e78a58:	38 c1                	cmp    %al,%cl
261a  2e78a5a:	0f 8c fa eb ff ff    	jl     2e7765a <MT2063_SetReceiverMode+0x121a>
2620  2e78a60:	48 8d 7c 24 07       	lea    0x7(%rsp),%rdi
2625  2e78a65:	45 89 ce             	mov    %r9d,%r14d
2628  2e78a68:	e8 00 00 00 00       	call   2e78a6d <MT2063_SetReceiverMode+0x262d>	2e78a69: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
262d  2e78a6d:	45 89 f1             	mov    %r14d,%r9d
2630  2e78a70:	e9 e5 eb ff ff       	jmp    2e7765a <MT2063_SetReceiverMode+0x121a>
2635  2e78a75:	48 8d 4c 24 07       	lea    0x7(%rsp),%rcx
263a  2e78a7a:	80 e1 07             	and    $0x7,%cl
263d  2e78a7d:	38 c1                	cmp    %al,%cl
263f  2e78a7f:	0f 8c 28 ea ff ff    	jl     2e774ad <MT2063_SetReceiverMode+0x106d>
2645  2e78a85:	48 8d 7c 24 07       	lea    0x7(%rsp),%rdi
264a  2e78a8a:	e8 00 00 00 00       	call   2e78a8f <MT2063_SetReceiverMode+0x264f>	2e78a8b: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
264f  2e78a8f:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2659  2e78a99:	e9 0f ea ff ff       	jmp    2e774ad <MT2063_SetReceiverMode+0x106d>
265e  2e78a9e:	44 89 f1             	mov    %r14d,%ecx
2661  2e78aa1:	80 e1 07             	and    $0x7,%cl
2664  2e78aa4:	38 c1                	cmp    %al,%cl
2666  2e78aa6:	0f 8c 19 ea ff ff    	jl     2e774c5 <MT2063_SetReceiverMode+0x1085>
266c  2e78aac:	4c 89 f7             	mov    %r14,%rdi
266f  2e78aaf:	e8 00 00 00 00       	call   2e78ab4 <MT2063_SetReceiverMode+0x2674>	2e78ab0: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
2674  2e78ab4:	45 89 f9             	mov    %r15d,%r9d
2677  2e78ab7:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
267c  2e78abc:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2686  2e78ac6:	e9 fa e9 ff ff       	jmp    2e774c5 <MT2063_SetReceiverMode+0x1085>
268b  2e78acb:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
2690  2e78ad0:	80 e1 07             	and    $0x7,%cl
2693  2e78ad3:	38 c1                	cmp    %al,%cl
2695  2e78ad5:	0f 8c 23 ef ff ff    	jl     2e779fe <MT2063_SetReceiverMode+0x15be>
269b  2e78adb:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
26a0  2e78ae0:	44 89 cb             	mov    %r9d,%ebx
26a3  2e78ae3:	e8 00 00 00 00       	call   2e78ae8 <MT2063_SetReceiverMode+0x26a8>	2e78ae4: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
26a8  2e78ae8:	41 89 d9             	mov    %ebx,%r9d
26ab  2e78aeb:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
26b0  2e78af0:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
26ba  2e78afa:	e9 ff ee ff ff       	jmp    2e779fe <MT2063_SetReceiverMode+0x15be>
26bf  2e78aff:	89 d9                	mov    %ebx,%ecx
26c1  2e78b01:	80 e1 07             	and    $0x7,%cl
26c4  2e78b04:	38 c1                	cmp    %al,%cl
26c6  2e78b06:	0f 8c 1a ef ff ff    	jl     2e77a26 <MT2063_SetReceiverMode+0x15e6>
26cc  2e78b0c:	48 89 df             	mov    %rbx,%rdi
26cf  2e78b0f:	45 89 ce             	mov    %r9d,%r14d
26d2  2e78b12:	e8 00 00 00 00       	call   2e78b17 <MT2063_SetReceiverMode+0x26d7>	2e78b13: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
26d7  2e78b17:	45 89 f1             	mov    %r14d,%r9d
26da  2e78b1a:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
26df  2e78b1f:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
26e9  2e78b29:	e9 f8 ee ff ff       	jmp    2e77a26 <MT2063_SetReceiverMode+0x15e6>
26ee  2e78b2e:	48 8d 4c 24 07       	lea    0x7(%rsp),%rcx
26f3  2e78b33:	80 e1 07             	and    $0x7,%cl
26f6  2e78b36:	38 c1                	cmp    %al,%cl
26f8  2e78b38:	0f 8c 07 ec ff ff    	jl     2e77745 <MT2063_SetReceiverMode+0x1305>
26fe  2e78b3e:	48 8d 7c 24 07       	lea    0x7(%rsp),%rdi
2703  2e78b43:	44 89 cd             	mov    %r9d,%ebp
2706  2e78b46:	e8 00 00 00 00       	call   2e78b4b <MT2063_SetReceiverMode+0x270b>	2e78b47: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
270b  2e78b4b:	41 89 e9             	mov    %ebp,%r9d
270e  2e78b4e:	e9 f2 eb ff ff       	jmp    2e77745 <MT2063_SetReceiverMode+0x1305>
2713  2e78b53:	48 8d 4c 24 07       	lea    0x7(%rsp),%rcx
2718  2e78b58:	80 e1 07             	and    $0x7,%cl
271b  2e78b5b:	38 c1                	cmp    %al,%cl
271d  2e78b5d:	0f 8c 3e ea ff ff    	jl     2e775a1 <MT2063_SetReceiverMode+0x1161>
2723  2e78b63:	48 8d 7c 24 07       	lea    0x7(%rsp),%rdi
2728  2e78b68:	e8 00 00 00 00       	call   2e78b6d <MT2063_SetReceiverMode+0x272d>	2e78b69: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
272d  2e78b6d:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2737  2e78b77:	e9 25 ea ff ff       	jmp    2e775a1 <MT2063_SetReceiverMode+0x1161>
273c  2e78b7c:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
2741  2e78b81:	80 e1 07             	and    $0x7,%cl
2744  2e78b84:	38 c1                	cmp    %al,%cl
2746  2e78b86:	0f 8c 2d ea ff ff    	jl     2e775b9 <MT2063_SetReceiverMode+0x1179>
274c  2e78b8c:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
2751  2e78b91:	e8 00 00 00 00       	call   2e78b96 <MT2063_SetReceiverMode+0x2756>	2e78b92: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
2756  2e78b96:	41 89 e9             	mov    %ebp,%r9d
2759  2e78b99:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
275e  2e78b9e:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2768  2e78ba8:	e9 0c ea ff ff       	jmp    2e775b9 <MT2063_SetReceiverMode+0x1179>
276d  2e78bad:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
2772  2e78bb2:	80 e1 07             	and    $0x7,%cl
2775  2e78bb5:	38 c1                	cmp    %al,%cl
2777  2e78bb7:	0f 8c 33 ef ff ff    	jl     2e77af0 <MT2063_SetReceiverMode+0x16b0>
277d  2e78bbd:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
2782  2e78bc2:	44 89 cb             	mov    %r9d,%ebx
2785  2e78bc5:	e8 00 00 00 00       	call   2e78bca <MT2063_SetReceiverMode+0x278a>	2e78bc6: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
278a  2e78bca:	41 89 d9             	mov    %ebx,%r9d
278d  2e78bcd:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
2792  2e78bd2:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
279c  2e78bdc:	e9 0f ef ff ff       	jmp    2e77af0 <MT2063_SetReceiverMode+0x16b0>
27a1  2e78be1:	89 d9                	mov    %ebx,%ecx
27a3  2e78be3:	80 e1 07             	and    $0x7,%cl
27a6  2e78be6:	38 c1                	cmp    %al,%cl
27a8  2e78be8:	0f 8c 2a ef ff ff    	jl     2e77b18 <MT2063_SetReceiverMode+0x16d8>
27ae  2e78bee:	48 89 df             	mov    %rbx,%rdi
27b1  2e78bf1:	45 89 cf             	mov    %r9d,%r15d
27b4  2e78bf4:	e8 00 00 00 00       	call   2e78bf9 <MT2063_SetReceiverMode+0x27b9>	2e78bf5: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
27b9  2e78bf9:	45 89 f9             	mov    %r15d,%r9d
27bc  2e78bfc:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
27c1  2e78c01:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
27cb  2e78c0b:	e9 08 ef ff ff       	jmp    2e77b18 <MT2063_SetReceiverMode+0x16d8>
27d0  2e78c10:	48 8d 4c 24 07       	lea    0x7(%rsp),%rcx
27d5  2e78c15:	80 e1 07             	and    $0x7,%cl
27d8  2e78c18:	38 c1                	cmp    %al,%cl
27da  2e78c1a:	0f 8c 48 ec ff ff    	jl     2e77868 <MT2063_SetReceiverMode+0x1428>
27e0  2e78c20:	48 8d 7c 24 07       	lea    0x7(%rsp),%rdi
27e5  2e78c25:	45 89 ce             	mov    %r9d,%r14d
27e8  2e78c28:	e8 00 00 00 00       	call   2e78c2d <MT2063_SetReceiverMode+0x27ed>	2e78c29: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
27ed  2e78c2d:	45 89 f1             	mov    %r14d,%r9d
27f0  2e78c30:	e9 33 ec ff ff       	jmp    2e77868 <MT2063_SetReceiverMode+0x1428>
27f5  2e78c35:	48 8d 4c 24 07       	lea    0x7(%rsp),%rcx
27fa  2e78c3a:	80 e1 07             	and    $0x7,%cl
27fd  2e78c3d:	38 c1                	cmp    %al,%cl
27ff  2e78c3f:	0f 8c 60 ea ff ff    	jl     2e776a5 <MT2063_SetReceiverMode+0x1265>
2805  2e78c45:	48 8d 7c 24 07       	lea    0x7(%rsp),%rdi
280a  2e78c4a:	e8 00 00 00 00       	call   2e78c4f <MT2063_SetReceiverMode+0x280f>	2e78c4b: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
280f  2e78c4f:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2819  2e78c59:	e9 47 ea ff ff       	jmp    2e776a5 <MT2063_SetReceiverMode+0x1265>
281e  2e78c5e:	44 89 e1             	mov    %r12d,%ecx
2821  2e78c61:	80 e1 07             	and    $0x7,%cl
2824  2e78c64:	38 c1                	cmp    %al,%cl
2826  2e78c66:	0f 8c 51 ea ff ff    	jl     2e776bd <MT2063_SetReceiverMode+0x127d>
282c  2e78c6c:	4c 89 e7             	mov    %r12,%rdi
282f  2e78c6f:	e8 00 00 00 00       	call   2e78c74 <MT2063_SetReceiverMode+0x2834>	2e78c70: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
2834  2e78c74:	45 89 f1             	mov    %r14d,%r9d
2837  2e78c77:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
283c  2e78c7c:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2846  2e78c86:	e9 32 ea ff ff       	jmp    2e776bd <MT2063_SetReceiverMode+0x127d>
284b  2e78c8b:	48 8d 4c 24 07       	lea    0x7(%rsp),%rcx
2850  2e78c90:	80 e1 07             	and    $0x7,%cl
2853  2e78c93:	38 c1                	cmp    %al,%cl
2855  2e78c95:	0f 8c 39 db ff ff    	jl     2e767d4 <MT2063_SetReceiverMode+0x394>
285b  2e78c9b:	48 8d 7c 24 07       	lea    0x7(%rsp),%rdi
2860  2e78ca0:	e8 00 00 00 00       	call   2e78ca5 <MT2063_SetReceiverMode+0x2865>	2e78ca1: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
2865  2e78ca5:	e9 2a db ff ff       	jmp    2e767d4 <MT2063_SetReceiverMode+0x394>
286a  2e78caa:	48 8d 4c 24 07       	lea    0x7(%rsp),%rcx
286f  2e78caf:	80 e1 07             	and    $0x7,%cl
2872  2e78cb2:	38 c1                	cmp    %al,%cl
2874  2e78cb4:	0f 8c 05 de ff ff    	jl     2e76abf <MT2063_SetReceiverMode+0x67f>
287a  2e78cba:	48 8d 7c 24 07       	lea    0x7(%rsp),%rdi
287f  2e78cbf:	e8 00 00 00 00       	call   2e78cc4 <MT2063_SetReceiverMode+0x2884>	2e78cc0: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
2884  2e78cc4:	e9 f6 dd ff ff       	jmp    2e76abf <MT2063_SetReceiverMode+0x67f>
2889  2e78cc9:	48 8d 4c 24 07       	lea    0x7(%rsp),%rcx
288e  2e78cce:	80 e1 07             	and    $0x7,%cl
2891  2e78cd1:	38 c1                	cmp    %al,%cl
2893  2e78cd3:	0f 8c 93 de ff ff    	jl     2e76b6c <MT2063_SetReceiverMode+0x72c>
2899  2e78cd9:	48 8d 7c 24 07       	lea    0x7(%rsp),%rdi
289e  2e78cde:	e8 00 00 00 00       	call   2e78ce3 <MT2063_SetReceiverMode+0x28a3>	2e78cdf: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
28a3  2e78ce3:	e9 84 de ff ff       	jmp    2e76b6c <MT2063_SetReceiverMode+0x72c>
28a8  2e78ce8:	48 8d 4c 24 07       	lea    0x7(%rsp),%rcx
28ad  2e78ced:	80 e1 07             	and    $0x7,%cl
28b0  2e78cf0:	38 c1                	cmp    %al,%cl
28b2  2e78cf2:	0f 8c 97 df ff ff    	jl     2e76c8f <MT2063_SetReceiverMode+0x84f>
28b8  2e78cf8:	48 8d 7c 24 07       	lea    0x7(%rsp),%rdi
28bd  2e78cfd:	e8 00 00 00 00       	call   2e78d02 <MT2063_SetReceiverMode+0x28c2>	2e78cfe: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
28c2  2e78d02:	e9 88 df ff ff       	jmp    2e76c8f <MT2063_SetReceiverMode+0x84f>
28c7  2e78d07:	48 8d 4c 24 07       	lea    0x7(%rsp),%rcx
28cc  2e78d0c:	80 e1 07             	and    $0x7,%cl
28cf  2e78d0f:	38 c1                	cmp    %al,%cl
28d1  2e78d11:	0f 8c 39 e0 ff ff    	jl     2e76d50 <MT2063_SetReceiverMode+0x910>
28d7  2e78d17:	48 8d 7c 24 07       	lea    0x7(%rsp),%rdi
28dc  2e78d1c:	44 89 cd             	mov    %r9d,%ebp
28df  2e78d1f:	e8 00 00 00 00       	call   2e78d24 <MT2063_SetReceiverMode+0x28e4>	2e78d20: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
28e4  2e78d24:	41 89 e9             	mov    %ebp,%r9d
28e7  2e78d27:	e9 24 e0 ff ff       	jmp    2e76d50 <MT2063_SetReceiverMode+0x910>
28ec  2e78d2c:	48 8d 4c 24 07       	lea    0x7(%rsp),%rcx
28f1  2e78d31:	80 e1 07             	and    $0x7,%cl
28f4  2e78d34:	38 c1                	cmp    %al,%cl
28f6  2e78d36:	0f 8c d0 e0 ff ff    	jl     2e76e0c <MT2063_SetReceiverMode+0x9cc>
28fc  2e78d3c:	48 8d 7c 24 07       	lea    0x7(%rsp),%rdi
2901  2e78d41:	44 89 cd             	mov    %r9d,%ebp
2904  2e78d44:	e8 00 00 00 00       	call   2e78d49 <MT2063_SetReceiverMode+0x2909>	2e78d45: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
2909  2e78d49:	41 89 e9             	mov    %ebp,%r9d
290c  2e78d4c:	e9 bb e0 ff ff       	jmp    2e76e0c <MT2063_SetReceiverMode+0x9cc>
2911  2e78d51:	48 8d 4c 24 07       	lea    0x7(%rsp),%rcx
2916  2e78d56:	80 e1 07             	and    $0x7,%cl
2919  2e78d59:	38 c1                	cmp    %al,%cl
291b  2e78d5b:	0f 8c be e1 ff ff    	jl     2e76f1f <MT2063_SetReceiverMode+0xadf>
2921  2e78d61:	48 8d 7c 24 07       	lea    0x7(%rsp),%rdi
2926  2e78d66:	44 89 cd             	mov    %r9d,%ebp
2929  2e78d69:	e8 00 00 00 00       	call   2e78d6e <MT2063_SetReceiverMode+0x292e>	2e78d6a: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
292e  2e78d6e:	41 89 e9             	mov    %ebp,%r9d
2931  2e78d71:	e9 a9 e1 ff ff       	jmp    2e76f1f <MT2063_SetReceiverMode+0xadf>
2936  2e78d76:	48 8d 4c 24 07       	lea    0x7(%rsp),%rcx
293b  2e78d7b:	80 e1 07             	and    $0x7,%cl
293e  2e78d7e:	38 c1                	cmp    %al,%cl
2940  2e78d80:	0f 8c aa e2 ff ff    	jl     2e77030 <MT2063_SetReceiverMode+0xbf0>
2946  2e78d86:	48 8d 7c 24 07       	lea    0x7(%rsp),%rdi
294b  2e78d8b:	44 89 cd             	mov    %r9d,%ebp
294e  2e78d8e:	e8 00 00 00 00       	call   2e78d93 <MT2063_SetReceiverMode+0x2953>	2e78d8f: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
2953  2e78d93:	41 89 e9             	mov    %ebp,%r9d
2956  2e78d96:	e9 95 e2 ff ff       	jmp    2e77030 <MT2063_SetReceiverMode+0xbf0>
295b  2e78d9b:	48 8d 4c 24 07       	lea    0x7(%rsp),%rcx
2960  2e78da0:	80 e1 07             	and    $0x7,%cl
2963  2e78da3:	38 c1                	cmp    %al,%cl
2965  2e78da5:	0f 8c 4e e3 ff ff    	jl     2e770f9 <MT2063_SetReceiverMode+0xcb9>
296b  2e78dab:	48 8d 7c 24 07       	lea    0x7(%rsp),%rdi
2970  2e78db0:	45 89 cf             	mov    %r9d,%r15d
2973  2e78db3:	e8 00 00 00 00       	call   2e78db8 <MT2063_SetReceiverMode+0x2978>	2e78db4: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
2978  2e78db8:	45 89 f9             	mov    %r15d,%r9d
297b  2e78dbb:	e9 39 e3 ff ff       	jmp    2e770f9 <MT2063_SetReceiverMode+0xcb9>
2980  2e78dc0:	48 8d 4c 24 07       	lea    0x7(%rsp),%rcx
2985  2e78dc5:	80 e1 07             	and    $0x7,%cl
2988  2e78dc8:	38 c1                	cmp    %al,%cl
298a  2e78dca:	0f 8c fe e3 ff ff    	jl     2e771ce <MT2063_SetReceiverMode+0xd8e>
2990  2e78dd0:	48 8d 7c 24 07       	lea    0x7(%rsp),%rdi
2995  2e78dd5:	45 89 cf             	mov    %r9d,%r15d
2998  2e78dd8:	e8 00 00 00 00       	call   2e78ddd <MT2063_SetReceiverMode+0x299d>	2e78dd9: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
299d  2e78ddd:	45 89 f9             	mov    %r15d,%r9d
29a0  2e78de0:	e9 e9 e3 ff ff       	jmp    2e771ce <MT2063_SetReceiverMode+0xd8e>
29a5  2e78de5:	48 8d 4c 24 07       	lea    0x7(%rsp),%rcx
29aa  2e78dea:	80 e1 07             	and    $0x7,%cl
29ad  2e78ded:	38 c1                	cmp    %al,%cl
29af  2e78def:	0f 8c ae e4 ff ff    	jl     2e772a3 <MT2063_SetReceiverMode+0xe63>
29b5  2e78df5:	48 8d 7c 24 07       	lea    0x7(%rsp),%rdi
29ba  2e78dfa:	45 89 cf             	mov    %r9d,%r15d
29bd  2e78dfd:	e8 00 00 00 00       	call   2e78e02 <MT2063_SetReceiverMode+0x29c2>	2e78dfe: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
29c2  2e78e02:	45 89 f9             	mov    %r15d,%r9d
29c5  2e78e05:	e9 99 e4 ff ff       	jmp    2e772a3 <MT2063_SetReceiverMode+0xe63>
29ca  2e78e0a:	48 8d 4c 24 07       	lea    0x7(%rsp),%rcx
29cf  2e78e0f:	80 e1 07             	and    $0x7,%cl
29d2  2e78e12:	38 c1                	cmp    %al,%cl
29d4  2e78e14:	0f 8c 5e e5 ff ff    	jl     2e77378 <MT2063_SetReceiverMode+0xf38>
29da  2e78e1a:	48 8d 7c 24 07       	lea    0x7(%rsp),%rdi
29df  2e78e1f:	45 89 cf             	mov    %r9d,%r15d
29e2  2e78e22:	e8 00 00 00 00       	call   2e78e27 <MT2063_SetReceiverMode+0x29e7>	2e78e23: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
29e7  2e78e27:	45 89 f9             	mov    %r15d,%r9d
29ea  2e78e2a:	e9 49 e5 ff ff       	jmp    2e77378 <MT2063_SetReceiverMode+0xf38>
29ef  2e78e2f:	44 89 e9             	mov    %r13d,%ecx
29f2  2e78e32:	80 e1 07             	and    $0x7,%cl
29f5  2e78e35:	80 c1 03             	add    $0x3,%cl
29f8  2e78e38:	38 c1                	cmp    %al,%cl
29fa  2e78e3a:	0f 8c c0 ed ff ff    	jl     2e77c00 <MT2063_SetReceiverMode+0x17c0>
2a00  2e78e40:	4c 89 ef             	mov    %r13,%rdi
2a03  2e78e43:	44 89 cb             	mov    %r9d,%ebx
2a06  2e78e46:	e8 00 00 00 00       	call   2e78e4b <MT2063_SetReceiverMode+0x2a0b>	2e78e47: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
2a0b  2e78e4b:	41 89 d9             	mov    %ebx,%r9d
2a0e  2e78e4e:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
2a13  2e78e53:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2a1d  2e78e5d:	e9 9e ed ff ff       	jmp    2e77c00 <MT2063_SetReceiverMode+0x17c0>
2a22  2e78e62:	48 8d 4c 24 07       	lea    0x7(%rsp),%rcx
2a27  2e78e67:	80 e1 07             	and    $0x7,%cl
2a2a  2e78e6a:	38 c1                	cmp    %al,%cl
2a2c  2e78e6c:	0f 8c f2 ea ff ff    	jl     2e77964 <MT2063_SetReceiverMode+0x1524>
2a32  2e78e72:	48 8d 7c 24 07       	lea    0x7(%rsp),%rdi
2a37  2e78e77:	45 89 ce             	mov    %r9d,%r14d
2a3a  2e78e7a:	e8 00 00 00 00       	call   2e78e7f <MT2063_SetReceiverMode+0x2a3f>	2e78e7b: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
2a3f  2e78e7f:	45 89 f1             	mov    %r14d,%r9d
2a42  2e78e82:	e9 dd ea ff ff       	jmp    2e77964 <MT2063_SetReceiverMode+0x1524>
2a47  2e78e87:	48 8d 4c 24 07       	lea    0x7(%rsp),%rcx
2a4c  2e78e8c:	80 e1 07             	and    $0x7,%cl
2a4f  2e78e8f:	38 c1                	cmp    %al,%cl
2a51  2e78e91:	0f 8c f9 e8 ff ff    	jl     2e77790 <MT2063_SetReceiverMode+0x1350>
2a57  2e78e97:	48 8d 7c 24 07       	lea    0x7(%rsp),%rdi
2a5c  2e78e9c:	e8 00 00 00 00       	call   2e78ea1 <MT2063_SetReceiverMode+0x2a61>	2e78e9d: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
2a61  2e78ea1:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2a6b  2e78eab:	e9 e0 e8 ff ff       	jmp    2e77790 <MT2063_SetReceiverMode+0x1350>
2a70  2e78eb0:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
2a75  2e78eb5:	80 e1 07             	and    $0x7,%cl
2a78  2e78eb8:	38 c1                	cmp    %al,%cl
2a7a  2e78eba:	0f 8c ec e8 ff ff    	jl     2e777ac <MT2063_SetReceiverMode+0x136c>
2a80  2e78ec0:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
2a85  2e78ec5:	e8 00 00 00 00       	call   2e78eca <MT2063_SetReceiverMode+0x2a8a>	2e78ec6: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
2a8a  2e78eca:	41 89 e9             	mov    %ebp,%r9d
2a8d  2e78ecd:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
2a92  2e78ed2:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2a9c  2e78edc:	e9 cb e8 ff ff       	jmp    2e777ac <MT2063_SetReceiverMode+0x136c>
2aa1  2e78ee1:	48 8d 4c 24 07       	lea    0x7(%rsp),%rcx
2aa6  2e78ee6:	80 e1 07             	and    $0x7,%cl
2aa9  2e78ee9:	38 c1                	cmp    %al,%cl
2aab  2e78eeb:	0f 8c 5e eb ff ff    	jl     2e77a4f <MT2063_SetReceiverMode+0x160f>
2ab1  2e78ef1:	48 8d 7c 24 07       	lea    0x7(%rsp),%rdi
2ab6  2e78ef6:	44 89 cd             	mov    %r9d,%ebp
2ab9  2e78ef9:	e8 00 00 00 00       	call   2e78efe <MT2063_SetReceiverMode+0x2abe>	2e78efa: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
2abe  2e78efe:	41 89 e9             	mov    %ebp,%r9d
2ac1  2e78f01:	e9 49 eb ff ff       	jmp    2e77a4f <MT2063_SetReceiverMode+0x160f>
2ac6  2e78f06:	48 8d 4c 24 07       	lea    0x7(%rsp),%rcx
2acb  2e78f0b:	80 e1 07             	and    $0x7,%cl
2ace  2e78f0e:	38 c1                	cmp    %al,%cl
2ad0  2e78f10:	0f 8c a0 e9 ff ff    	jl     2e778b6 <MT2063_SetReceiverMode+0x1476>
2ad6  2e78f16:	48 8d 7c 24 07       	lea    0x7(%rsp),%rdi
2adb  2e78f1b:	e8 00 00 00 00       	call   2e78f20 <MT2063_SetReceiverMode+0x2ae0>	2e78f1c: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
2ae0  2e78f20:	45 89 f1             	mov    %r14d,%r9d
2ae3  2e78f23:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2aed  2e78f2d:	e9 84 e9 ff ff       	jmp    2e778b6 <MT2063_SetReceiverMode+0x1476>
2af2  2e78f32:	44 89 e1             	mov    %r12d,%ecx
2af5  2e78f35:	80 e1 07             	and    $0x7,%cl
2af8  2e78f38:	38 c1                	cmp    %al,%cl
2afa  2e78f3a:	0f 8c 8b e9 ff ff    	jl     2e778cb <MT2063_SetReceiverMode+0x148b>
2b00  2e78f40:	4c 89 e7             	mov    %r12,%rdi
2b03  2e78f43:	e8 00 00 00 00       	call   2e78f48 <MT2063_SetReceiverMode+0x2b08>	2e78f44: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
2b08  2e78f48:	45 89 f1             	mov    %r14d,%r9d
2b0b  2e78f4b:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
2b10  2e78f50:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2b1a  2e78f5a:	e9 6c e9 ff ff       	jmp    2e778cb <MT2063_SetReceiverMode+0x148b>
2b1f  2e78f5f:	48 8d 4c 24 07       	lea    0x7(%rsp),%rcx
2b24  2e78f64:	80 e1 07             	and    $0x7,%cl
2b27  2e78f67:	38 c1                	cmp    %al,%cl
2b29  2e78f69:	0f 8c b7 d8 ff ff    	jl     2e76826 <MT2063_SetReceiverMode+0x3e6>
2b2f  2e78f6f:	48 8d 7c 24 07       	lea    0x7(%rsp),%rdi
2b34  2e78f74:	e8 00 00 00 00       	call   2e78f79 <MT2063_SetReceiverMode+0x2b39>	2e78f75: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
2b39  2e78f79:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
2b3e  2e78f7e:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2b48  2e78f88:	e9 99 d8 ff ff       	jmp    2e76826 <MT2063_SetReceiverMode+0x3e6>
2b4d  2e78f8d:	89 f9                	mov    %edi,%ecx
2b4f  2e78f8f:	80 e1 07             	and    $0x7,%cl
2b52  2e78f92:	38 c1                	cmp    %al,%cl
2b54  2e78f94:	0f 8c a6 d8 ff ff    	jl     2e76840 <MT2063_SetReceiverMode+0x400>
2b5a  2e78f9a:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
2b5f  2e78f9f:	e8 00 00 00 00       	call   2e78fa4 <MT2063_SetReceiverMode+0x2b64>	2e78fa0: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
2b64  2e78fa4:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
2b69  2e78fa9:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
2b6e  2e78fae:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
2b73  2e78fb3:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2b7d  2e78fbd:	e9 7e d8 ff ff       	jmp    2e76840 <MT2063_SetReceiverMode+0x400>
2b82  2e78fc2:	48 8d 4c 24 07       	lea    0x7(%rsp),%rcx
2b87  2e78fc7:	80 e1 07             	and    $0x7,%cl
2b8a  2e78fca:	38 c1                	cmp    %al,%cl
2b8c  2e78fcc:	0f 8c 3f db ff ff    	jl     2e76b11 <MT2063_SetReceiverMode+0x6d1>
2b92  2e78fd2:	48 8d 7c 24 07       	lea    0x7(%rsp),%rdi
2b97  2e78fd7:	e8 00 00 00 00       	call   2e78fdc <MT2063_SetReceiverMode+0x2b9c>	2e78fd8: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
2b9c  2e78fdc:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
2ba1  2e78fe1:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2bab  2e78feb:	e9 21 db ff ff       	jmp    2e76b11 <MT2063_SetReceiverMode+0x6d1>
2bb0  2e78ff0:	89 f9                	mov    %edi,%ecx
2bb2  2e78ff2:	80 e1 07             	and    $0x7,%cl
2bb5  2e78ff5:	38 c1                	cmp    %al,%cl
2bb7  2e78ff7:	0f 8c 2e db ff ff    	jl     2e76b2b <MT2063_SetReceiverMode+0x6eb>
2bbd  2e78ffd:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
2bc2  2e79002:	e8 00 00 00 00       	call   2e79007 <MT2063_SetReceiverMode+0x2bc7>	2e79003: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
2bc7  2e79007:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
2bcc  2e7900c:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
2bd1  2e79011:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
2bd6  2e79016:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2be0  2e79020:	e9 06 db ff ff       	jmp    2e76b2b <MT2063_SetReceiverMode+0x6eb>
2be5  2e79025:	48 8d 4c 24 07       	lea    0x7(%rsp),%rcx
2bea  2e7902a:	80 e1 07             	and    $0x7,%cl
2bed  2e7902d:	38 c1                	cmp    %al,%cl
2bef  2e7902f:	0f 8c 84 db ff ff    	jl     2e76bb9 <MT2063_SetReceiverMode+0x779>
2bf5  2e79035:	48 8d 7c 24 07       	lea    0x7(%rsp),%rdi
2bfa  2e7903a:	e8 00 00 00 00       	call   2e7903f <MT2063_SetReceiverMode+0x2bff>	2e7903b: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
2bff  2e7903f:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2c09  2e79049:	e9 6b db ff ff       	jmp    2e76bb9 <MT2063_SetReceiverMode+0x779>
2c0e  2e7904e:	89 f9                	mov    %edi,%ecx
2c10  2e79050:	80 e1 07             	and    $0x7,%cl
2c13  2e79053:	38 c1                	cmp    %al,%cl
2c15  2e79055:	0f 8c 7d db ff ff    	jl     2e76bd8 <MT2063_SetReceiverMode+0x798>
2c1b  2e7905b:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
2c20  2e79060:	e8 00 00 00 00       	call   2e79065 <MT2063_SetReceiverMode+0x2c25>	2e79061: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
2c25  2e79065:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
2c2a  2e7906a:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
2c2f  2e7906f:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
2c34  2e79074:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2c3e  2e7907e:	e9 55 db ff ff       	jmp    2e76bd8 <MT2063_SetReceiverMode+0x798>
2c43  2e79083:	48 8d 4c 24 07       	lea    0x7(%rsp),%rcx
2c48  2e79088:	80 e1 07             	and    $0x7,%cl
2c4b  2e7908b:	38 c1                	cmp    %al,%cl
2c4d  2e7908d:	0f 8c 58 dc ff ff    	jl     2e76ceb <MT2063_SetReceiverMode+0x8ab>
2c53  2e79093:	48 8d 7c 24 07       	lea    0x7(%rsp),%rdi
2c58  2e79098:	e8 00 00 00 00       	call   2e7909d <MT2063_SetReceiverMode+0x2c5d>	2e79099: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
2c5d  2e7909d:	4c 8b 54 24 38       	mov    0x38(%rsp),%r10
2c62  2e790a2:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
2c67  2e790a7:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
2c6c  2e790ac:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2c76  2e790b6:	e9 30 dc ff ff       	jmp    2e76ceb <MT2063_SetReceiverMode+0x8ab>
2c7b  2e790bb:	89 f9                	mov    %edi,%ecx
2c7d  2e790bd:	80 e1 07             	and    $0x7,%cl
2c80  2e790c0:	38 c1                	cmp    %al,%cl
2c82  2e790c2:	0f 8c 38 dc ff ff    	jl     2e76d00 <MT2063_SetReceiverMode+0x8c0>
2c88  2e790c8:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
2c8d  2e790cd:	e8 00 00 00 00       	call   2e790d2 <MT2063_SetReceiverMode+0x2c92>	2e790ce: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
2c92  2e790d2:	4c 8b 54 24 38       	mov    0x38(%rsp),%r10
2c97  2e790d7:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
2c9c  2e790dc:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
2ca1  2e790e1:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
2ca6  2e790e6:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2cb0  2e790f0:	e9 0b dc ff ff       	jmp    2e76d00 <MT2063_SetReceiverMode+0x8c0>
2cb5  2e790f5:	48 8d 4c 24 07       	lea    0x7(%rsp),%rcx
2cba  2e790fa:	80 e1 07             	and    $0x7,%cl
2cbd  2e790fd:	38 c1                	cmp    %al,%cl
2cbf  2e790ff:	0f 8c 9e dc ff ff    	jl     2e76da3 <MT2063_SetReceiverMode+0x963>
2cc5  2e79105:	48 8d 7c 24 07       	lea    0x7(%rsp),%rdi
2cca  2e7910a:	e8 00 00 00 00       	call   2e7910f <MT2063_SetReceiverMode+0x2ccf>	2e7910b: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
2ccf  2e7910f:	45 89 f1             	mov    %r14d,%r9d
2cd2  2e79112:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2cdc  2e7911c:	e9 82 dc ff ff       	jmp    2e76da3 <MT2063_SetReceiverMode+0x963>
2ce1  2e79121:	44 89 f9             	mov    %r15d,%ecx
2ce4  2e79124:	80 e1 07             	and    $0x7,%cl
2ce7  2e79127:	38 c1                	cmp    %al,%cl
2ce9  2e79129:	0f 8c 8d dc ff ff    	jl     2e76dbc <MT2063_SetReceiverMode+0x97c>
2cef  2e7912f:	4c 89 ff             	mov    %r15,%rdi
2cf2  2e79132:	e8 00 00 00 00       	call   2e79137 <MT2063_SetReceiverMode+0x2cf7>	2e79133: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
2cf7  2e79137:	45 89 f1             	mov    %r14d,%r9d
2cfa  2e7913a:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
2cff  2e7913f:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2d09  2e79149:	e9 6e dc ff ff       	jmp    2e76dbc <MT2063_SetReceiverMode+0x97c>
2d0e  2e7914e:	48 8d 4c 24 07       	lea    0x7(%rsp),%rcx
2d13  2e79153:	80 e1 07             	and    $0x7,%cl
2d16  2e79156:	38 c1                	cmp    %al,%cl
2d18  2e79158:	0f 8c fe dc ff ff    	jl     2e76e5c <MT2063_SetReceiverMode+0xa1c>
2d1e  2e7915e:	48 8d 7c 24 07       	lea    0x7(%rsp),%rdi
2d23  2e79163:	e8 00 00 00 00       	call   2e79168 <MT2063_SetReceiverMode+0x2d28>	2e79164: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
2d28  2e79168:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2d32  2e79172:	e9 e5 dc ff ff       	jmp    2e76e5c <MT2063_SetReceiverMode+0xa1c>
2d37  2e79177:	44 89 f9             	mov    %r15d,%ecx
2d3a  2e7917a:	80 e1 07             	and    $0x7,%cl
2d3d  2e7917d:	38 c1                	cmp    %al,%cl
2d3f  2e7917f:	0f 8c f3 dc ff ff    	jl     2e76e78 <MT2063_SetReceiverMode+0xa38>
2d45  2e79185:	4c 89 ff             	mov    %r15,%rdi
2d48  2e79188:	e8 00 00 00 00       	call   2e7918d <MT2063_SetReceiverMode+0x2d4d>	2e79189: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
2d4d  2e7918d:	45 89 f1             	mov    %r14d,%r9d
2d50  2e79190:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
2d55  2e79195:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2d5f  2e7919f:	e9 d4 dc ff ff       	jmp    2e76e78 <MT2063_SetReceiverMode+0xa38>
2d64  2e791a4:	48 8d 4c 24 07       	lea    0x7(%rsp),%rcx
2d69  2e791a9:	80 e1 07             	and    $0x7,%cl
2d6c  2e791ac:	38 c1                	cmp    %al,%cl
2d6e  2e791ae:	0f 8c bb dd ff ff    	jl     2e76f6f <MT2063_SetReceiverMode+0xb2f>
2d74  2e791b4:	48 8d 7c 24 07       	lea    0x7(%rsp),%rdi
2d79  2e791b9:	e8 00 00 00 00       	call   2e791be <MT2063_SetReceiverMode+0x2d7e>	2e791ba: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
2d7e  2e791be:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2d88  2e791c8:	e9 a2 dd ff ff       	jmp    2e76f6f <MT2063_SetReceiverMode+0xb2f>
2d8d  2e791cd:	44 89 f9             	mov    %r15d,%ecx
2d90  2e791d0:	80 e1 07             	and    $0x7,%cl
2d93  2e791d3:	38 c1                	cmp    %al,%cl
2d95  2e791d5:	0f 8c b0 dd ff ff    	jl     2e76f8b <MT2063_SetReceiverMode+0xb4b>
2d9b  2e791db:	4c 89 ff             	mov    %r15,%rdi
2d9e  2e791de:	e8 00 00 00 00       	call   2e791e3 <MT2063_SetReceiverMode+0x2da3>	2e791df: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
2da3  2e791e3:	45 89 f1             	mov    %r14d,%r9d
2da6  2e791e6:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
2dab  2e791eb:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2db5  2e791f5:	e9 91 dd ff ff       	jmp    2e76f8b <MT2063_SetReceiverMode+0xb4b>
2dba  2e791fa:	48 8d 4c 24 07       	lea    0x7(%rsp),%rcx
2dbf  2e791ff:	80 e1 07             	and    $0x7,%cl
2dc2  2e79202:	38 c1                	cmp    %al,%cl
2dc4  2e79204:	0f 8c 76 de ff ff    	jl     2e77080 <MT2063_SetReceiverMode+0xc40>
2dca  2e7920a:	48 8d 7c 24 07       	lea    0x7(%rsp),%rdi
2dcf  2e7920f:	e8 00 00 00 00       	call   2e79214 <MT2063_SetReceiverMode+0x2dd4>	2e79210: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
2dd4  2e79214:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2dde  2e7921e:	e9 5d de ff ff       	jmp    2e77080 <MT2063_SetReceiverMode+0xc40>
2de3  2e79223:	44 89 f9             	mov    %r15d,%ecx
2de6  2e79226:	80 e1 07             	and    $0x7,%cl
2de9  2e79229:	38 c1                	cmp    %al,%cl
2deb  2e7922b:	0f 8c 6b de ff ff    	jl     2e7709c <MT2063_SetReceiverMode+0xc5c>
2df1  2e79231:	4c 89 ff             	mov    %r15,%rdi
2df4  2e79234:	e8 00 00 00 00       	call   2e79239 <MT2063_SetReceiverMode+0x2df9>	2e79235: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
2df9  2e79239:	45 89 f1             	mov    %r14d,%r9d
2dfc  2e7923c:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
2e01  2e79241:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2e0b  2e7924b:	e9 4c de ff ff       	jmp    2e7709c <MT2063_SetReceiverMode+0xc5c>
2e10  2e79250:	48 8d 4c 24 07       	lea    0x7(%rsp),%rcx
2e15  2e79255:	80 e1 07             	and    $0x7,%cl
2e18  2e79258:	38 c1                	cmp    %al,%cl
2e1a  2e7925a:	0f 8c e8 de ff ff    	jl     2e77148 <MT2063_SetReceiverMode+0xd08>
2e20  2e79260:	48 8d 7c 24 07       	lea    0x7(%rsp),%rdi
2e25  2e79265:	e8 00 00 00 00       	call   2e7926a <MT2063_SetReceiverMode+0x2e2a>	2e79266: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
2e2a  2e7926a:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2e34  2e79274:	e9 cf de ff ff       	jmp    2e77148 <MT2063_SetReceiverMode+0xd08>
2e39  2e79279:	48 8d 4c 24 07       	lea    0x7(%rsp),%rcx
2e3e  2e7927e:	80 e1 07             	and    $0x7,%cl
2e41  2e79281:	38 c1                	cmp    %al,%cl
2e43  2e79283:	0f 8c 94 df ff ff    	jl     2e7721d <MT2063_SetReceiverMode+0xddd>
2e49  2e79289:	48 8d 7c 24 07       	lea    0x7(%rsp),%rdi
2e4e  2e7928e:	e8 00 00 00 00       	call   2e79293 <MT2063_SetReceiverMode+0x2e53>	2e7928f: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
2e53  2e79293:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2e5d  2e7929d:	e9 7b df ff ff       	jmp    2e7721d <MT2063_SetReceiverMode+0xddd>
2e62  2e792a2:	48 8d 4c 24 07       	lea    0x7(%rsp),%rcx
2e67  2e792a7:	80 e1 07             	and    $0x7,%cl
2e6a  2e792aa:	38 c1                	cmp    %al,%cl
2e6c  2e792ac:	0f 8c 45 e0 ff ff    	jl     2e772f7 <MT2063_SetReceiverMode+0xeb7>
2e72  2e792b2:	48 8d 7c 24 07       	lea    0x7(%rsp),%rdi
2e77  2e792b7:	e8 00 00 00 00       	call   2e792bc <MT2063_SetReceiverMode+0x2e7c>	2e792b8: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
2e7c  2e792bc:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
2e81  2e792c1:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2e8b  2e792cb:	e9 27 e0 ff ff       	jmp    2e772f7 <MT2063_SetReceiverMode+0xeb7>
2e90  2e792d0:	48 8d 4c 24 07       	lea    0x7(%rsp),%rcx
2e95  2e792d5:	80 e1 07             	and    $0x7,%cl
2e98  2e792d8:	38 c1                	cmp    %al,%cl
2e9a  2e792da:	0f 8c e3 e0 ff ff    	jl     2e773c3 <MT2063_SetReceiverMode+0xf83>
2ea0  2e792e0:	48 8d 7c 24 07       	lea    0x7(%rsp),%rdi
2ea5  2e792e5:	e8 00 00 00 00       	call   2e792ea <MT2063_SetReceiverMode+0x2eaa>	2e792e6: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
2eaa  2e792ea:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2eb4  2e792f4:	e9 ca e0 ff ff       	jmp    2e773c3 <MT2063_SetReceiverMode+0xf83>
2eb9  2e792f9:	44 89 f1             	mov    %r14d,%ecx
2ebc  2e792fc:	80 e1 07             	and    $0x7,%cl
2ebf  2e792ff:	38 c1                	cmp    %al,%cl
2ec1  2e79301:	0f 8c d4 e0 ff ff    	jl     2e773db <MT2063_SetReceiverMode+0xf9b>
2ec7  2e79307:	4c 89 f7             	mov    %r14,%rdi
2eca  2e7930a:	e8 00 00 00 00       	call   2e7930f <MT2063_SetReceiverMode+0x2ecf>	2e7930b: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
2ecf  2e7930f:	45 89 f9             	mov    %r15d,%r9d
2ed2  2e79312:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
2ed7  2e79317:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2ee1  2e79321:	e9 b5 e0 ff ff       	jmp    2e773db <MT2063_SetReceiverMode+0xf9b>
2ee6  2e79326:	48 8d 4c 24 07       	lea    0x7(%rsp),%rcx
2eeb  2e7932b:	80 e1 07             	and    $0x7,%cl
2eee  2e7932e:	38 c1                	cmp    %al,%cl
2ef0  2e79330:	0f 8c 0b e8 ff ff    	jl     2e77b41 <MT2063_SetReceiverMode+0x1701>
2ef6  2e79336:	48 8d 7c 24 07       	lea    0x7(%rsp),%rdi
2efb  2e7933b:	44 89 cd             	mov    %r9d,%ebp
2efe  2e7933e:	e8 00 00 00 00       	call   2e79343 <MT2063_SetReceiverMode+0x2f03>	2e7933f: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
2f03  2e79343:	41 89 e9             	mov    %ebp,%r9d
2f06  2e79346:	e9 f6 e7 ff ff       	jmp    2e77b41 <MT2063_SetReceiverMode+0x1701>
2f0b  2e7934b:	48 8d 4c 24 07       	lea    0x7(%rsp),%rcx
2f10  2e79350:	80 e1 07             	and    $0x7,%cl
2f13  2e79353:	38 c1                	cmp    %al,%cl
2f15  2e79355:	0f 8c 54 e6 ff ff    	jl     2e779af <MT2063_SetReceiverMode+0x156f>
2f1b  2e7935b:	48 8d 7c 24 07       	lea    0x7(%rsp),%rdi
2f20  2e79360:	e8 00 00 00 00       	call   2e79365 <MT2063_SetReceiverMode+0x2f25>	2e79361: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
2f25  2e79365:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2f2f  2e7936f:	e9 3b e6 ff ff       	jmp    2e779af <MT2063_SetReceiverMode+0x156f>
2f34  2e79374:	44 89 e1             	mov    %r12d,%ecx
2f37  2e79377:	80 e1 07             	and    $0x7,%cl
2f3a  2e7937a:	38 c1                	cmp    %al,%cl
2f3c  2e7937c:	0f 8c 45 e6 ff ff    	jl     2e779c7 <MT2063_SetReceiverMode+0x1587>
2f42  2e79382:	4c 89 e7             	mov    %r12,%rdi
2f45  2e79385:	e8 00 00 00 00       	call   2e7938a <MT2063_SetReceiverMode+0x2f4a>	2e79386: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
2f4a  2e7938a:	45 89 f1             	mov    %r14d,%r9d
2f4d  2e7938d:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
2f52  2e79392:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2f5c  2e7939c:	e9 26 e6 ff ff       	jmp    2e779c7 <MT2063_SetReceiverMode+0x1587>
2f61  2e793a1:	48 8d 4c 24 07       	lea    0x7(%rsp),%rcx
2f66  2e793a6:	80 e1 07             	and    $0x7,%cl
2f69  2e793a9:	38 c1                	cmp    %al,%cl
2f6b  2e793ab:	0f 8c e9 e6 ff ff    	jl     2e77a9a <MT2063_SetReceiverMode+0x165a>
2f71  2e793b1:	48 8d 7c 24 07       	lea    0x7(%rsp),%rdi
2f76  2e793b6:	e8 00 00 00 00       	call   2e793bb <MT2063_SetReceiverMode+0x2f7b>	2e793b7: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
2f7b  2e793bb:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2f85  2e793c5:	e9 d0 e6 ff ff       	jmp    2e77a9a <MT2063_SetReceiverMode+0x165a>
2f8a  2e793ca:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
2f8f  2e793cf:	80 e1 07             	and    $0x7,%cl
2f92  2e793d2:	38 c1                	cmp    %al,%cl
2f94  2e793d4:	0f 8c d8 e6 ff ff    	jl     2e77ab2 <MT2063_SetReceiverMode+0x1672>
2f9a  2e793da:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
2f9f  2e793df:	e8 00 00 00 00       	call   2e793e4 <MT2063_SetReceiverMode+0x2fa4>	2e793e0: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
2fa4  2e793e4:	41 89 e9             	mov    %ebp,%r9d
2fa7  2e793e7:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
2fac  2e793ec:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2fb6  2e793f6:	e9 b7 e6 ff ff       	jmp    2e77ab2 <MT2063_SetReceiverMode+0x1672>
2fbb  2e793fb:	48 8d 4c 24 07       	lea    0x7(%rsp),%rcx
2fc0  2e79400:	80 e1 07             	and    $0x7,%cl
2fc3  2e79403:	38 c1                	cmp    %al,%cl
2fc5  2e79405:	0f 8c 81 e7 ff ff    	jl     2e77b8c <MT2063_SetReceiverMode+0x174c>
2fcb  2e7940b:	48 8d 7c 24 07       	lea    0x7(%rsp),%rdi
2fd0  2e79410:	e8 00 00 00 00       	call   2e79415 <MT2063_SetReceiverMode+0x2fd5>	2e79411: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
2fd5  2e79415:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2fdf  2e7941f:	e9 68 e7 ff ff       	jmp    2e77b8c <MT2063_SetReceiverMode+0x174c>
2fe4  2e79424:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
2fe9  2e79429:	80 e1 07             	and    $0x7,%cl
2fec  2e7942c:	38 c1                	cmp    %al,%cl
2fee  2e7942e:	0f 8c 74 e7 ff ff    	jl     2e77ba8 <MT2063_SetReceiverMode+0x1768>
2ff4  2e79434:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
2ff9  2e79439:	e8 00 00 00 00       	call   2e7943e <MT2063_SetReceiverMode+0x2ffe>	2e7943a: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
2ffe  2e7943e:	41 89 e9             	mov    %ebp,%r9d
3001  2e79441:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
3006  2e79446:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
3010  2e79450:	e9 53 e7 ff ff       	jmp    2e77ba8 <MT2063_SetReceiverMode+0x1768>
3015  2e79455:	48 89 fb             	mov    %rdi,%rbx
3018  2e79458:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2e7945b: R_X86_64_32S	.data+0xcf2960
301f  2e7945f:	48 89 ee             	mov    %rbp,%rsi
3022  2e79462:	e8 00 00 00 00       	call   2e79467 <MT2063_SetReceiverMode+0x3027>	2e79463: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
3027  2e79467:	48 89 df             	mov    %rbx,%rdi
302a  2e7946a:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
302f  2e7946f:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
3034  2e79474:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
303e  2e7947e:	e9 de d5 ff ff       	jmp    2e76a61 <MT2063_SetReceiverMode+0x621>
3043  2e79483:	48 89 7c 24 18       	mov    %rdi,0x18(%rsp)
3048  2e79488:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2e7948b: R_X86_64_32S	.data+0xcf29a0
304f  2e7948f:	48 89 ee             	mov    %rbp,%rsi
3052  2e79492:	4c 89 d3             	mov    %r10,%rbx
3055  2e79495:	e8 00 00 00 00       	call   2e7949a <MT2063_SetReceiverMode+0x305a>	2e79496: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
305a  2e7949a:	49 89 da             	mov    %rbx,%r10
305d  2e7949d:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
3062  2e794a2:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
3067  2e794a7:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
306c  2e794ac:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
3076  2e794b6:	e9 71 d7 ff ff       	jmp    2e76c2c <MT2063_SetReceiverMode+0x7ec>
307b  2e794bb:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2e794be: R_X86_64_32S	.data+0xcf2980
3082  2e794c2:	48 89 ee             	mov    %rbp,%rsi
3085  2e794c5:	44 89 cb             	mov    %r9d,%ebx
3088  2e794c8:	e8 00 00 00 00       	call   2e794cd <MT2063_SetReceiverMode+0x308d>	2e794c9: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
308d  2e794cd:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
3092  2e794d2:	41 89 d9             	mov    %ebx,%r9d
3095  2e794d5:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
309a  2e794da:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
30a4  2e794e4:	e9 e8 d9 ff ff       	jmp    2e76ed1 <MT2063_SetReceiverMode+0xa91>
30a9  2e794e9:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2e794ec: R_X86_64_32S	.data+0xcf29c0
30b0  2e794f0:	48 89 ee             	mov    %rbp,%rsi
30b3  2e794f3:	44 89 cb             	mov    %r9d,%ebx
30b6  2e794f6:	e8 00 00 00 00       	call   2e794fb <MT2063_SetReceiverMode+0x30bb>	2e794f7: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
30bb  2e794fb:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
30c0  2e79500:	41 89 d9             	mov    %ebx,%r9d
30c3  2e79503:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
30c8  2e79508:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
30d2  2e79512:	e9 c6 da ff ff       	jmp    2e76fdd <MT2063_SetReceiverMode+0xb9d>
30d7  2e79517:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
30e1  2e79521:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
30eb  2e7952b:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
30f5  2e79535:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
30ff  2e7953f:	90                   	nop

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
