Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F353E67A08;
	Thu,  8 Feb 2024 05:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707369212; cv=none; b=VVJK4USfYzf7QIE0OCR8w73ni5in4t5qpJDhQaAyvIGli30p0ngkPOuDFpcJCGTCwexmEasZty6slfR/V25kRNrYstcWb0sH74nPUQN6P0ux8mQ5wyHwEYXwFsFKnwFsHpk3elAYnIEboCk3zFUA1TyBvlaH1Pdv9FbjmIz0HFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707369212; c=relaxed/simple;
	bh=G/kkDEdMT1vUCZeZLxvMe7M2SfhlVVR8mR+DLj2DqLw=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qUpC1ZZAdYPyGLgyy94zJlswlJ/qy+BECd0ZIdAaYpLTwyLUPxn9JnPFDsf1nopiGhvlUh0Al7Ee5fT5D3ejdVQ2Hx9/k9Iig3n+Xs4mwj4xT9KZ8cs48up5b7lhMPVjHxq5vWPy7QPnWzBogrrYXrscu2cHIrp2eZSH3fSdPbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QEZ4w36H; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QEZ4w36H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707369211; x=1738905211;
  h=date:from:cc:subject:message-id:mime-version;
  bh=G/kkDEdMT1vUCZeZLxvMe7M2SfhlVVR8mR+DLj2DqLw=;
  b=QEZ4w36HEsM6C/BNnRNQvTXGdsMhZ4mHTx9Pei/FIQESBXI2F4Dao0Tj
   1MC6fUyiKBSd/vzYiqi2JhXA2a3T4VZJzjQGHiGCBpVnDB9+nm4mk50eS
   PfREvL8XWZ2+r5eqI77WDUrlj1lYRfTJDIQxZ177gUErp58xNVBbCaItS
   p4L0KS11ylEFDegNcxX07HiQ3VKqANBlufnyAi+4bWebWZlRcwEHtC4wO
   LJ+NnmRnsPRcCs/mD9HXUdMWb4wAd/CUo0jgmw8e0R6lhRT7L5J4dYi8O
   sl4S8XO3MKbrn2zIlWA3rgC3DLAik5osli84DTmLB+gaBPPLRLlDlDMPv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="11725275"
X-IronPort-AV: E=Sophos;i="6.05,252,1701158400"; 
   d="scan'208";a="11725275"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2024 21:13:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,252,1701158400"; 
   d="scan'208";a="32630506"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 Feb 2024 21:13:27 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXwiz-0003Nc-1A;
	Thu, 08 Feb 2024 05:13:25 +0000
Date: Thu, 8 Feb 2024 13:12:30 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: finish_mkwrite_fault+0x302: stack state
 mismatch: cfa1=4+96 cfa2=-1+0
Message-ID: <202402081340.otUFBuHV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Rick Edgecombe <rick.p.edgecombe@intel.com>
CC: "Yu-cheng Yu" <yu-cheng.yu@intel.com>
CC: Dave Hansen <dave.hansen@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   547ab8fc4cb04a1a6b34377dd8fad34cd2c8a8e3
commit: bb3aadf7d446aaf22c725b274e2c194ac5cb2111 x86/mm: Start actually marking _PAGE_SAVED_DIRTY
date:   7 months ago
config: x86_64-buildonly-randconfig-006-20240208 (https://download.01.org/0day-ci/archive/20240208/202402081340.otUFBuHV-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240208/202402081340.otUFBuHV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402081340.otUFBuHV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: finish_mkwrite_fault+0x302: stack state mismatch: cfa1=4+96 cfa2=-1+0


objdump-func vmlinux.o finish_mkwrite_fault:
0000 00000000007425b0 <finish_mkwrite_fault>:
0000   7425b0:	f3 0f 1e fa          	endbr64
0004   7425b4:	55                   	push   %rbp
0005   7425b5:	41 57                	push   %r15
0007   7425b7:	41 56                	push   %r14
0009   7425b9:	41 55                	push   %r13
000b   7425bb:	41 54                	push   %r12
000d   7425bd:	53                   	push   %rbx
000e   7425be:	48 83 ec 28          	sub    $0x28,%rsp
0012   7425c2:	49 89 fe             	mov    %rdi,%r14
0015   7425c5:	48 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbp
001f   7425cf:	e8 00 00 00 00       	call   7425d4 <finish_mkwrite_fault+0x24>	7425d0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0024   7425d4:	4d 89 f7             	mov    %r14,%r15
0027   7425d7:	49 c1 ef 03          	shr    $0x3,%r15
002b   7425db:	41 80 3c 2f 00       	cmpb   $0x0,(%r15,%rbp,1)
0030   7425e0:	74 08                	je     7425ea <finish_mkwrite_fault+0x3a>
0032   7425e2:	4c 89 f7             	mov    %r14,%rdi
0035   7425e5:	e8 00 00 00 00       	call   7425ea <finish_mkwrite_fault+0x3a>	7425e6: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
003a   7425ea:	49 8b 1e             	mov    (%r14),%rbx
003d   7425ed:	48 83 c3 20          	add    $0x20,%rbx
0041   7425f1:	48 89 d8             	mov    %rbx,%rax
0044   7425f4:	48 c1 e8 03          	shr    $0x3,%rax
0048   7425f8:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
004c   7425fc:	74 08                	je     742606 <finish_mkwrite_fault+0x56>
004e   7425fe:	48 89 df             	mov    %rbx,%rdi
0051   742601:	e8 00 00 00 00       	call   742606 <finish_mkwrite_fault+0x56>	742602: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0056   742606:	f6 03 08             	testb  $0x8,(%rbx)
0059   742609:	0f 84 b7 02 00 00    	je     7428c6 <finish_mkwrite_fault+0x316>
005f   74260f:	e8 00 00 00 00       	call   742614 <finish_mkwrite_fault+0x64>	742610: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0064   742614:	41 80 3c 2f 00       	cmpb   $0x0,(%r15,%rbp,1)
0069   742619:	74 08                	je     742623 <finish_mkwrite_fault+0x73>
006b   74261b:	4c 89 f7             	mov    %r14,%rdi
006e   74261e:	e8 00 00 00 00       	call   742623 <finish_mkwrite_fault+0x73>	74261f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0073   742623:	49 8b 1e             	mov    (%r14),%rbx
0076   742626:	48 83 c3 10          	add    $0x10,%rbx
007a   74262a:	48 89 d8             	mov    %rbx,%rax
007d   74262d:	48 c1 e8 03          	shr    $0x3,%rax
0081   742631:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
0085   742635:	74 08                	je     74263f <finish_mkwrite_fault+0x8f>
0087   742637:	48 89 df             	mov    %rbx,%rdi
008a   74263a:	e8 00 00 00 00       	call   74263f <finish_mkwrite_fault+0x8f>	74263b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
008f   74263f:	4c 8b 23             	mov    (%rbx),%r12
0092   742642:	49 8d 7e 30          	lea    0x30(%r14),%rdi
0096   742646:	48 89 f8             	mov    %rdi,%rax
0099   742649:	48 c1 e8 03          	shr    $0x3,%rax
009d   74264d:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
00a1   742651:	74 05                	je     742658 <finish_mkwrite_fault+0xa8>
00a3   742653:	e8 00 00 00 00       	call   742658 <finish_mkwrite_fault+0xa8>	742654: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
00a8   742658:	4d 8b 6e 30          	mov    0x30(%r14),%r13
00ac   74265c:	49 8d 5e 18          	lea    0x18(%r14),%rbx
00b0   742660:	48 89 d8             	mov    %rbx,%rax
00b3   742663:	48 c1 e8 03          	shr    $0x3,%rax
00b7   742667:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
00bc   74266c:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
00c0   742670:	74 08                	je     74267a <finish_mkwrite_fault+0xca>
00c2   742672:	48 89 df             	mov    %rbx,%rdi
00c5   742675:	e8 00 00 00 00       	call   74267a <finish_mkwrite_fault+0xca>	742676: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
00ca   74267a:	48 89 5c 24 08       	mov    %rbx,0x8(%rsp)
00cf   74267f:	49 8b 56 18          	mov    0x18(%r14),%rdx
00d3   742683:	49 8d 5e 60          	lea    0x60(%r14),%rbx
00d7   742687:	4c 89 e7             	mov    %r12,%rdi
00da   74268a:	4c 89 ee             	mov    %r13,%rsi
00dd   74268d:	48 89 d9             	mov    %rbx,%rcx
00e0   742690:	e8 00 00 00 00       	call   742695 <finish_mkwrite_fault+0xe5>	742691: R_X86_64_PLT32	__pte_offset_map_lock-0x4
00e5   742695:	49 89 c5             	mov    %rax,%r13
00e8   742698:	49 8d 7e 58          	lea    0x58(%r14),%rdi
00ec   74269c:	49 89 fc             	mov    %rdi,%r12
00ef   74269f:	49 c1 ec 03          	shr    $0x3,%r12
00f3   7426a3:	41 80 3c 2c 00       	cmpb   $0x0,(%r12,%rbp,1)
00f8   7426a8:	74 21                	je     7426cb <finish_mkwrite_fault+0x11b>
00fa   7426aa:	4c 89 fd             	mov    %r15,%rbp
00fd   7426ad:	4d 89 e7             	mov    %r12,%r15
0100   7426b0:	49 89 fc             	mov    %rdi,%r12
0103   7426b3:	e8 00 00 00 00       	call   7426b8 <finish_mkwrite_fault+0x108>	7426b4: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0108   7426b8:	4c 89 e7             	mov    %r12,%rdi
010b   7426bb:	4d 89 fc             	mov    %r15,%r12
010e   7426be:	49 89 ef             	mov    %rbp,%r15
0111   7426c1:	48 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbp
011b   7426cb:	4c 89 2f             	mov    %r13,(%rdi)
011e   7426ce:	4d 85 ed             	test   %r13,%r13
0121   7426d1:	0f 84 9d 01 00 00    	je     742874 <finish_mkwrite_fault+0x2c4>
0127   7426d7:	48 89 7c 24 18       	mov    %rdi,0x18(%rsp)
012c   7426dc:	4c 89 e8             	mov    %r13,%rax
012f   7426df:	48 c1 e8 03          	shr    $0x3,%rax
0133   7426e3:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
0137   7426e7:	74 08                	je     7426f1 <finish_mkwrite_fault+0x141>
0139   7426e9:	4c 89 ef             	mov    %r13,%rdi
013c   7426ec:	e8 00 00 00 00       	call   7426f1 <finish_mkwrite_fault+0x141>	7426ed: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0141   7426f1:	48 89 1c 24          	mov    %rbx,(%rsp)
0145   7426f5:	4d 8b 6d 00          	mov    0x0(%r13),%r13
0149   7426f9:	48 8d 44 24 10       	lea    0x10(%rsp),%rax
014e   7426fe:	48 c1 e8 03          	shr    $0x3,%rax
0152   742702:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
0156   742706:	74 0a                	je     742712 <finish_mkwrite_fault+0x162>
0158   742708:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
015d   74270d:	e8 00 00 00 00       	call   742712 <finish_mkwrite_fault+0x162>	74270e: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0162   742712:	4c 89 6c 24 10       	mov    %r13,0x10(%rsp)
0167   742717:	49 8d 5e 40          	lea    0x40(%r14),%rbx
016b   74271b:	48 89 dd             	mov    %rbx,%rbp
016e   74271e:	48 c1 ed 03          	shr    $0x3,%rbp
0172   742722:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
017c   74272c:	80 7c 05 00 00       	cmpb   $0x0,0x0(%rbp,%rax,1)
0181   742731:	74 08                	je     74273b <finish_mkwrite_fault+0x18b>
0183   742733:	48 89 df             	mov    %rbx,%rdi
0186   742736:	e8 00 00 00 00       	call   74273b <finish_mkwrite_fault+0x18b>	742737: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
018b   74273b:	48 89 e1             	mov    %rsp,%rcx
018e   74273e:	4c 3b 2b             	cmp    (%rbx),%r13
0191   742741:	0f 85 34 01 00 00    	jne    74287b <finish_mkwrite_fault+0x2cb>
0197   742747:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
01a1   742751:	41 80 3c 07 00       	cmpb   $0x0,(%r15,%rax,1)
01a6   742756:	74 0e                	je     742766 <finish_mkwrite_fault+0x1b6>
01a8   742758:	4c 89 f7             	mov    %r14,%rdi
01ab   74275b:	49 89 cf             	mov    %rcx,%r15
01ae   74275e:	e8 00 00 00 00       	call   742763 <finish_mkwrite_fault+0x1b3>	74275f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
01b3   742763:	4c 89 f9             	mov    %r15,%rcx
01b6   742766:	4d 8b 36             	mov    (%r14),%r14
01b9   742769:	4c 89 ef             	mov    %r13,%rdi
01bc   74276c:	48 89 cc             	mov    %rcx,%rsp
01bf   74276f:	ff 15 00 00 00 00    	call   *0x0(%rip)        # 742775 <finish_mkwrite_fault+0x1c5>	742771: R_X86_64_PC32	pv_ops+0x1d4
01c5   742775:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
01cf   74277f:	80 7c 05 00 00       	cmpb   $0x0,0x0(%rbp,%rax,1)
01d4   742784:	74 08                	je     74278e <finish_mkwrite_fault+0x1de>
01d6   742786:	48 89 df             	mov    %rbx,%rdi
01d9   742789:	e8 00 00 00 00       	call   74278e <finish_mkwrite_fault+0x1de>	74278a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
01de   74278e:	48 8b 03             	mov    (%rbx),%rax
01e1   742791:	31 db                	xor    %ebx,%ebx
01e3   742793:	a8 02                	test   $0x2,%al
01e5   742795:	0f 94 c3             	sete   %bl
01e8   742798:	49 89 dd             	mov    %rbx,%r13
01eb   74279b:	49 c1 e5 3a          	shl    $0x3a,%r13
01ef   74279f:	49 09 c5             	or     %rax,%r13
01f2   7427a2:	49 81 cd 60 08 00 00 	or     $0x860,%r13
01f9   7427a9:	48 c1 e3 06          	shl    $0x6,%rbx
01fd   7427ad:	48 f7 d3             	not    %rbx
0200   7427b0:	49 8d 6e 20          	lea    0x20(%r14),%rbp
0204   7427b4:	48 89 e8             	mov    %rbp,%rax
0207   7427b7:	48 c1 e8 03          	shr    $0x3,%rax
020b   7427bb:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0215   7427c5:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
0219   7427c9:	74 08                	je     7427d3 <finish_mkwrite_fault+0x223>
021b   7427cb:	48 89 ef             	mov    %rbp,%rdi
021e   7427ce:	e8 00 00 00 00       	call   7427d3 <finish_mkwrite_fault+0x223>	7427cf: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0223   7427d3:	49 21 dd             	and    %rbx,%r13
0226   7427d6:	f6 45 00 02          	testb  $0x2,0x0(%rbp)
022a   7427da:	0f 84 fd 00 00 00    	je     7428dd <finish_mkwrite_fault+0x32d>
0230   7427e0:	e8 00 00 00 00       	call   7427e5 <finish_mkwrite_fault+0x235>	7427e1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0235   7427e5:	4c 89 ef             	mov    %r13,%rdi
0238   7427e8:	4c 89 f6             	mov    %r14,%rsi
023b   7427eb:	e8 00 00 00 00       	call   7427f0 <finish_mkwrite_fault+0x240>	7427ec: R_X86_64_PLT32	pte_mkwrite-0x4
0240   7427f0:	49 89 c5             	mov    %rax,%r13
0243   7427f3:	49 bf 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r15
024d   7427fd:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
0252   742802:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
0257   742807:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
025c   74280c:	74 08                	je     742816 <finish_mkwrite_fault+0x266>
025e   74280e:	48 89 df             	mov    %rbx,%rdi
0261   742811:	e8 00 00 00 00       	call   742816 <finish_mkwrite_fault+0x266>	742812: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0266   742816:	48 8b 1b             	mov    (%rbx),%rbx
0269   742819:	43 80 3c 3c 00       	cmpb   $0x0,(%r12,%r15,1)
026e   74281e:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
0273   742823:	74 08                	je     74282d <finish_mkwrite_fault+0x27d>
0275   742825:	4c 89 e7             	mov    %r12,%rdi
0278   742828:	e8 00 00 00 00       	call   74282d <finish_mkwrite_fault+0x27d>	742829: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
027d   74282d:	49 8b 14 24          	mov    (%r12),%rdx
0281   742831:	4c 89 f7             	mov    %r14,%rdi
0284   742834:	48 89 de             	mov    %rbx,%rsi
0287   742837:	4c 89 e9             	mov    %r13,%rcx
028a   74283a:	41 b8 01 00 00 00    	mov    $0x1,%r8d
0290   742840:	e8 00 00 00 00       	call   742845 <finish_mkwrite_fault+0x295>	742841: R_X86_64_PLT32	ptep_set_access_flags-0x4
0295   742845:	48 8b 1c 24          	mov    (%rsp),%rbx
0299   742849:	48 89 d8             	mov    %rbx,%rax
029c   74284c:	48 c1 e8 03          	shr    $0x3,%rax
02a0   742850:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
02a5   742855:	74 08                	je     74285f <finish_mkwrite_fault+0x2af>
02a7   742857:	48 89 df             	mov    %rbx,%rdi
02aa   74285a:	e8 00 00 00 00       	call   74285f <finish_mkwrite_fault+0x2af>	74285b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
02af   74285f:	48 8b 3b             	mov    (%rbx),%rdi
02b2   742862:	ff 15 00 00 00 00    	call   *0x0(%rip)        # 742868 <finish_mkwrite_fault+0x2b8>	742864: R_X86_64_PC32	pv_ops+0x264
02b8   742868:	65 48 ff 05 00 00 00 00 	incq   %gs:0x0(%rip)        # 742870 <finish_mkwrite_fault+0x2c0>	74286c: R_X86_64_PC32	vm_event_states+0xbc
02c0   742870:	31 c0                	xor    %eax,%eax
02c2   742872:	eb 43                	jmp    7428b7 <finish_mkwrite_fault+0x307>
02c4   742874:	e8 00 00 00 00       	call   742879 <finish_mkwrite_fault+0x2c9>	742875: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
02c9   742879:	eb 37                	jmp    7428b2 <finish_mkwrite_fault+0x302>
02cb   74287b:	49 89 ce             	mov    %rcx,%r14
02ce   74287e:	e8 00 00 00 00       	call   742883 <finish_mkwrite_fault+0x2d3>	74287f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
02d3   742883:	48 8b 1c 24          	mov    (%rsp),%rbx
02d7   742887:	48 89 d8             	mov    %rbx,%rax
02da   74288a:	48 c1 e8 03          	shr    $0x3,%rax
02de   74288e:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
02e8   742898:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
02ec   74289c:	74 08                	je     7428a6 <finish_mkwrite_fault+0x2f6>
02ee   74289e:	48 89 df             	mov    %rbx,%rdi
02f1   7428a1:	e8 00 00 00 00       	call   7428a6 <finish_mkwrite_fault+0x2f6>	7428a2: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
02f6   7428a6:	48 8b 3b             	mov    (%rbx),%rdi
02f9   7428a9:	4c 89 f4             	mov    %r14,%rsp
02fc   7428ac:	ff 15 00 00 00 00    	call   *0x0(%rip)        # 7428b2 <finish_mkwrite_fault+0x302>	7428ae: R_X86_64_PC32	pv_ops+0x264
0302   7428b2:	b8 00 01 00 00       	mov    $0x100,%eax
0307   7428b7:	48 83 c4 28          	add    $0x28,%rsp
030b   7428bb:	5b                   	pop    %rbx
030c   7428bc:	41 5c                	pop    %r12
030e   7428be:	41 5d                	pop    %r13
0310   7428c0:	41 5e                	pop    %r14
0312   7428c2:	41 5f                	pop    %r15
0314   7428c4:	5d                   	pop    %rbp
0315   7428c5:	c3                   	ret
0316   7428c6:	e8 00 00 00 00       	call   7428cb <finish_mkwrite_fault+0x31b>	7428c7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
031b   7428cb:	0f 0b                	ud2
031d   7428cd:	41 80 3c 2f 00       	cmpb   $0x0,(%r15,%rbp,1)
0322   7428d2:	0f 85 43 fd ff ff    	jne    74261b <finish_mkwrite_fault+0x6b>
0328   7428d8:	e9 46 fd ff ff       	jmp    742623 <finish_mkwrite_fault+0x73>
032d   7428dd:	e8 00 00 00 00       	call   7428e2 <finish_mkwrite_fault+0x332>	7428de: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0332   7428e2:	e9 0c ff ff ff       	jmp    7427f3 <finish_mkwrite_fault+0x243>
0337   7428e7:	66 0f 1f 84 00 00 00 00 00 	nopw   0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
