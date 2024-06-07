Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE19125C0;
	Fri,  7 Jun 2024 21:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717795254; cv=none; b=Tm0ANx3Ma4wxXdYsvT2rIVFbxsajyyo07ydj+q8jpVFKa86J9K3vEdIcukJQrNjNg4LPWeJyx0Y8loRNJB5wjc4zdUeRGOhbZCoTOJr1D97n24I6VBosB0/hZ4s0MNRDmbjwI/o+mKmJ7+RydS4JVOmiBkIT8LTwfIGBKylvNa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717795254; c=relaxed/simple;
	bh=u9aaITUHZN/v0GjHq8xggNIC5NrvqpqXQYwn4OOL7NI=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F4Xmc5IiEOvzph1aN5zU1h5S/OWJ0KVScd1aDXFy/7+2a25KntPH8xJMNu+7XbyfWVvQte9a6uwzsDn00IrzbdJjrDgxsCL4rJ7ddtFwVx3c2aDqamggcsidaV2HM3chPvbSJ0NfxE3Rl3mD7GRl54PeT7rrZ9PnJLtHHaRDZGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dCwefjTI; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dCwefjTI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717795247; x=1749331247;
  h=date:from:cc:subject:message-id:mime-version;
  bh=u9aaITUHZN/v0GjHq8xggNIC5NrvqpqXQYwn4OOL7NI=;
  b=dCwefjTIHZZIfhIxwl5WIE9puN4mrR++Ht0Wgm6NNNrZZ63lxhT70Hwe
   CLYpXToDVPcL2raJAwJNf1tiISe/mpAIFdTxInVw+8bI9aTC3k/J5xMx6
   633ccSjLUUh/O7czpY8bd20R97CJtuybIEs9IKfP3/NrhFze3wQDpLDd3
   qqOvY+5j2LCw1/2SMoZ/ndWxtFnbkklRtuwsikya++Gp6gfpEqvouzPY+
   gWzV8QlGM3RQG5DStfGpNDw2T7ElXb9ZD9qCotMVQQuJOCT/syxr0nt5Z
   0HQJjEH1lf/es0fNIzSopv592GqROMqAUvkv4pel6hb9j02IreaB5cr9h
   g==;
X-CSE-ConnectionGUID: lDIhfVOEQ1a/20V05aaKIg==
X-CSE-MsgGUID: 3r3Dw2GQQGyspN93+rvsLQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14376950"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="14376950"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 14:20:46 -0700
X-CSE-ConnectionGUID: n6mSpZNeReeFg/QbVPNixQ==
X-CSE-MsgGUID: SjjR+DeURn2zGPas7o4FXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="39110275"
Received: from lkp-server01.sh.intel.com (HELO 472b94a103a1) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 07 Jun 2024 14:20:44 -0700
Received: from kbuild by 472b94a103a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFh0r-0000YK-2b;
	Fri, 07 Jun 2024 21:20:41 +0000
Date: Sat, 8 Jun 2024 05:19:38 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: __send_ipi_mask+0x4f7: undefined stack
 state
Message-ID: <202406080557.hOawqe0K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Dexuan Cui <decui@microsoft.com>
CC: Wei Liu <wei.liu@kernel.org>
CC: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
CC: Michael Kelley <mikelley@microsoft.com>
CC: Tianyu Lan <tiala@microsoft.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8a92980606e3585d72d510a03b59906e96755b8a
commit: d6e0228d265f29348a01780ff306321c399d8b95 x86/hyperv: Support hypercalls for fully enlightened TDX guests
date:   10 months ago
config: x86_64-buildonly-randconfig-001-20240608 (https://download.01.org/0day-ci/archive/20240608/202406080557.hOawqe0K-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240608/202406080557.hOawqe0K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406080557.hOawqe0K-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: __send_ipi_mask+0x4f7: undefined stack state
   vmlinux.o: warning: objtool: handle_bug+0x4: call to kmsan_unpoison_entry_regs() leaves .noinstr.text section


objdump-func vmlinux.o __send_ipi_mask:
0000 000000000006f1d0 <__send_ipi_mask_ex>:
0000    6f1d0:	55                   	push   %rbp
0001    6f1d1:	41 57                	push   %r15
0003    6f1d3:	41 56                	push   %r14
0005    6f1d5:	41 55                	push   %r13
0007    6f1d7:	41 54                	push   %r12
0009    6f1d9:	53                   	push   %rbx
000a    6f1da:	48 83 ec 78          	sub    $0x78,%rsp
000e    6f1de:	89 54 24 38          	mov    %edx,0x38(%rsp)
0012    6f1e2:	41 89 f6             	mov    %esi,%r14d
0015    6f1e5:	48 89 7c 24 50       	mov    %rdi,0x50(%rsp)
001a    6f1ea:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
0023    6f1f3:	48 89 44 24 70       	mov    %rax,0x70(%rsp)
0028    6f1f8:	e8 00 00 00 00       	call   6f1fd <__send_ipi_mask_ex+0x2d>	6f1f9: R_X86_64_PLT32	__msan_get_context_state-0x4
002d    6f1fd:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
0032    6f202:	bd 00 08 00 00       	mov    $0x800,%ebp
0037    6f207:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 6f20d <__send_ipi_mask_ex+0x3d>	6f209: R_X86_64_PC32	ms_hyperv+0x8
003d    6f20d:	21 eb                	and    %ebp,%ebx
003f    6f20f:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	6f212: R_X86_64_32S	ms_hyperv+0xc
0046    6f216:	e8 00 00 00 00       	call   6f21b <__send_ipi_mask_ex+0x4b>	6f217: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
004b    6f21b:	23 28                	and    (%rax),%ebp
004d    6f21d:	74 0a                	je     6f229 <__send_ipi_mask_ex+0x59>
004f    6f21f:	f7 d5                	not    %ebp
0051    6f221:	21 dd                	and    %ebx,%ebp
0053    6f223:	0f 84 83 05 00 00    	je     6f7ac <__send_ipi_mask_ex+0x5dc>
0059    6f229:	31 c9                	xor    %ecx,%ecx
005b    6f22b:	41 bf 00 00 00 00    	mov    $0x0,%r15d
0061    6f231:	b8 00 00 00 00       	mov    $0x0,%eax
0066    6f236:	85 db                	test   %ebx,%ebx
0068    6f238:	0f 84 34 05 00 00    	je     6f772 <__send_ipi_mask_ex+0x5a2>
006e    6f23e:	48 8d 5c 24 68       	lea    0x68(%rsp),%rbx
0073    6f243:	be 08 00 00 00       	mov    $0x8,%esi
0078    6f248:	48 89 df             	mov    %rbx,%rdi
007b    6f24b:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	6f24e: R_X86_64_32S	.rodata+0x22c4
0082    6f252:	e8 00 00 00 00       	call   6f257 <__send_ipi_mask_ex+0x87>	6f253: R_X86_64_PLT32	__msan_poison_alloca-0x4
0087    6f257:	be 08 00 00 00       	mov    $0x8,%esi
008c    6f25c:	48 89 df             	mov    %rbx,%rdi
008f    6f25f:	e8 00 00 00 00       	call   6f264 <__send_ipi_mask_ex+0x94>	6f260: R_X86_64_PLT32	__msan_instrument_asm_store-0x4
0094    6f264:	9c                   	pushf
0095    6f265:	8f 44 24 68          	pop    0x68(%rsp)
0099    6f269:	48 8b 6c 24 68       	mov    0x68(%rsp),%rbp
009e    6f26e:	48 89 df             	mov    %rbx,%rdi
00a1    6f271:	e8 00 00 00 00       	call   6f276 <__send_ipi_mask_ex+0xa6>	6f272: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
00a6    6f276:	8b 00                	mov    (%rax),%eax
00a8    6f278:	89 c1                	mov    %eax,%ecx
00aa    6f27a:	f7 d1                	not    %ecx
00ac    6f27c:	8b 12                	mov    (%rdx),%edx
00ae    6f27e:	89 54 24 2c          	mov    %edx,0x2c(%rsp)
00b2    6f282:	fa                   	cli
00b3    6f283:	81 e5 00 02 00 00    	and    $0x200,%ebp
00b9    6f289:	c1 e8 09             	shr    $0x9,%eax
00bc    6f28c:	81 c9 ff fd ff ff    	or     $0xfffffdff,%ecx
00c2    6f292:	85 cd                	test   %ecx,%ebp
00c4    6f294:	0f 94 c1             	sete   %cl
00c7    6f297:	20 c1                	and    %al,%cl
00c9    6f299:	88 4c 24 03          	mov    %cl,0x3(%rsp)
00cd    6f29d:	80 f9 01             	cmp    $0x1,%cl
00d0    6f2a0:	0f 84 45 05 00 00    	je     6f7eb <__send_ipi_mask_ex+0x61b>
00d6    6f2a6:	48 85 ed             	test   %rbp,%rbp
00d9    6f2a9:	74 05                	je     6f2b0 <__send_ipi_mask_ex+0xe0>
00db    6f2ab:	e8 00 00 00 00       	call   6f2b0 <__send_ipi_mask_ex+0xe0>	6f2ac: R_X86_64_PLT32	trace_hardirqs_off-0x4
00e0    6f2b0:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 6f2b7 <__send_ipi_mask_ex+0xe7>	6f2b3: R_X86_64_PC32	hyperv_pcpu_input_arg-0x4
00e7    6f2b7:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	6f2ba: R_X86_64_32S	hyperv_pcpu_input_arg
00ee    6f2be:	e8 00 00 00 00       	call   6f2c3 <__send_ipi_mask_ex+0xf3>	6f2bf: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
00f3    6f2c3:	48 83 38 00          	cmpq   $0x0,(%rax)
00f7    6f2c7:	0f 85 35 05 00 00    	jne    6f802 <__send_ipi_mask_ex+0x632>
00fd    6f2cd:	65 48 03 1d 00 00 00 00 	add    %gs:0x0(%rip),%rbx        # 6f2d5 <__send_ipi_mask_ex+0x105>	6f2d1: R_X86_64_PC32	this_cpu_off-0x4
0105    6f2d5:	4c 8b 2b             	mov    (%rbx),%r13
0108    6f2d8:	48 89 df             	mov    %rbx,%rdi
010b    6f2db:	e8 00 00 00 00       	call   6f2e0 <__send_ipi_mask_ex+0x110>	6f2dc: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
0110    6f2e0:	48 8b 00             	mov    (%rax),%rax
0113    6f2e3:	8b 0a                	mov    (%rdx),%ecx
0115    6f2e5:	89 4c 24 04          	mov    %ecx,0x4(%rsp)
0119    6f2e9:	49 89 c7             	mov    %rax,%r15
011c    6f2ec:	49 f7 d7             	not    %r15
011f    6f2ef:	4d 21 ef             	and    %r13,%r15
0122    6f2f2:	48 85 c0             	test   %rax,%rax
0125    6f2f5:	74 09                	je     6f300 <__send_ipi_mask_ex+0x130>
0127    6f2f7:	4d 85 ff             	test   %r15,%r15
012a    6f2fa:	0f 84 b8 04 00 00    	je     6f7b8 <__send_ipi_mask_ex+0x5e8>
0130    6f300:	4d 85 ed             	test   %r13,%r13
0133    6f303:	0f 84 c7 04 00 00    	je     6f7d0 <__send_ipi_mask_ex+0x600>
0139    6f309:	b9 05 00 00 00       	mov    $0x5,%ecx
013e    6f30e:	48 89 4c 24 30       	mov    %rcx,0x30(%rsp)
0143    6f313:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
0148    6f318:	48 85 c0             	test   %rax,%rax
014b    6f31b:	48 89 6c 24 10       	mov    %rbp,0x10(%rsp)
0150    6f320:	4c 89 7c 24 58       	mov    %r15,0x58(%rsp)
0155    6f325:	0f 85 f6 04 00 00    	jne    6f821 <__send_ipi_mask_ex+0x651>
015b    6f32b:	4c 89 ef             	mov    %r13,%rdi
015e    6f32e:	e8 00 00 00 00       	call   6f333 <__send_ipi_mask_ex+0x163>	6f32f: R_X86_64_PLT32	__msan_metadata_ptr_for_store_4-0x4
0163    6f333:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
0169    6f339:	45 89 75 00          	mov    %r14d,0x0(%r13)
016d    6f33d:	49 8d 7d 04          	lea    0x4(%r13),%rdi
0171    6f341:	e8 00 00 00 00       	call   6f346 <__send_ipi_mask_ex+0x176>	6f342: R_X86_64_PLT32	__msan_metadata_ptr_for_store_4-0x4
0176    6f346:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
017c    6f34c:	41 c7 45 04 00 00 00 00 	movl   $0x0,0x4(%r13)
0184    6f354:	49 8d 7d 10          	lea    0x10(%r13),%rdi
0188    6f358:	48 89 7c 24 48       	mov    %rdi,0x48(%rsp)
018d    6f35d:	e8 00 00 00 00       	call   6f362 <__send_ipi_mask_ex+0x192>	6f35e: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
0192    6f362:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
0199    6f369:	49 c7 45 10 00 00 00 00 	movq   $0x0,0x10(%r13)
01a1    6f371:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
01a6    6f376:	4c 8b 37             	mov    (%rdi),%r14
01a9    6f379:	e8 00 00 00 00       	call   6f37e <__send_ipi_mask_ex+0x1ae>	6f37a: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
01ae    6f37e:	4c 8b 38             	mov    (%rax),%r15
01b1    6f381:	8b 1a                	mov    (%rdx),%ebx
01b3    6f383:	4c 8b 25 00 00 00 00 	mov    0x0(%rip),%r12        # 6f38a <__send_ipi_mask_ex+0x1ba>	6f386: R_X86_64_PC32	__cpu_present_mask-0x4
01ba    6f38a:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	6f38d: R_X86_64_32S	__cpu_present_mask
01c1    6f391:	e8 00 00 00 00       	call   6f396 <__send_ipi_mask_ex+0x1c6>	6f392: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
01c6    6f396:	48 8b 00             	mov    (%rax),%rax
01c9    6f399:	49 09 c7             	or     %rax,%r15
01cc    6f39c:	4d 39 e6             	cmp    %r12,%r14
01cf    6f39f:	40 0f 95 c5          	setne  %bpl
01d3    6f3a3:	40 0a 6c 24 38       	or     0x38(%rsp),%bpl
01d8    6f3a8:	4d 85 ff             	test   %r15,%r15
01db    6f3ab:	74 16                	je     6f3c3 <__send_ipi_mask_ex+0x1f3>
01dd    6f3ad:	4d 31 e6             	xor    %r12,%r14
01e0    6f3b0:	49 f7 d7             	not    %r15
01e3    6f3b3:	4d 21 f7             	and    %r14,%r15
01e6    6f3b6:	75 0b                	jne    6f3c3 <__send_ipi_mask_ex+0x1f3>
01e8    6f3b8:	80 7c 24 38 00       	cmpb   $0x0,0x38(%rsp)
01ed    6f3bd:	0f 84 4b 04 00 00    	je     6f80e <__send_ipi_mask_ex+0x63e>
01f3    6f3c3:	49 8d 5d 08          	lea    0x8(%r13),%rbx
01f7    6f3c7:	40 84 ed             	test   %bpl,%bpl
01fa    6f3ca:	0f 84 94 00 00 00    	je     6f464 <__send_ipi_mask_ex+0x294>
0200    6f3d0:	48 83 7c 24 40 00    	cmpq   $0x0,0x40(%rsp)
0206    6f3d6:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
020b    6f3db:	0f 85 01 05 00 00    	jne    6f8e2 <__send_ipi_mask_ex+0x712>
0211    6f3e1:	48 89 df             	mov    %rbx,%rdi
0214    6f3e4:	e8 00 00 00 00       	call   6f3e9 <__send_ipi_mask_ex+0x219>	6f3e5: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
0219    6f3e9:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
0220    6f3f0:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
0227    6f3f7:	44 8b 35 00 00 00 00 	mov    0x0(%rip),%r14d        # 6f3fe <__send_ipi_mask_ex+0x22e>	6f3fa: R_X86_64_PC32	hv_max_vp_index-0x4
022e    6f3fe:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	6f401: R_X86_64_32S	hv_max_vp_index
0235    6f405:	e8 00 00 00 00       	call   6f40a <__send_ipi_mask_ex+0x23a>	6f406: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
023a    6f40a:	8b 00                	mov    (%rax),%eax
023c    6f40c:	89 c1                	mov    %eax,%ecx
023e    6f40e:	f7 d1                	not    %ecx
0240    6f410:	44 21 f1             	and    %r14d,%ecx
0243    6f413:	81 f9 00 10 00 00    	cmp    $0x1000,%ecx
0249    6f419:	0f 93 c1             	setae  %cl
024c    6f41c:	44 09 f0             	or     %r14d,%eax
024f    6f41f:	3d 00 10 00 00       	cmp    $0x1000,%eax
0254    6f424:	0f 93 c0             	setae  %al
0257    6f427:	38 c1                	cmp    %al,%cl
0259    6f429:	0f 85 c1 04 00 00    	jne    6f8f0 <__send_ipi_mask_ex+0x720>
025f    6f42f:	41 81 fe ff 0f 00 00 	cmp    $0xfff,%r14d
0266    6f436:	0f 86 c8 04 00 00    	jbe    6f904 <__send_ipi_mask_ex+0x734>
026c    6f43c:	45 31 f6             	xor    %r14d,%r14d
026f    6f43f:	45 31 ff             	xor    %r15d,%r15d
0272    6f442:	80 7c 24 03 00       	cmpb   $0x0,0x3(%rsp)
0277    6f447:	0f 84 8b 02 00 00    	je     6f6d8 <__send_ipi_mask_ex+0x508>
027d    6f44d:	8b 7c 24 2c          	mov    0x2c(%rsp),%edi
0281    6f451:	e8 00 00 00 00       	call   6f456 <__send_ipi_mask_ex+0x286>	6f452: R_X86_64_PLT32	__msan_warning-0x4
0286    6f456:	48 85 ed             	test   %rbp,%rbp
0289    6f459:	0f 85 7e 02 00 00    	jne    6f6dd <__send_ipi_mask_ex+0x50d>
028f    6f45f:	e9 7e 02 00 00       	jmp    6f6e2 <__send_ipi_mask_ex+0x512>
0294    6f464:	48 83 7c 24 40 00    	cmpq   $0x0,0x40(%rsp)
029a    6f46a:	0f 85 01 07 00 00    	jne    6fb71 <__send_ipi_mask_ex+0x9a1>
02a0    6f470:	4d 89 ec             	mov    %r13,%r12
02a3    6f473:	48 89 df             	mov    %rbx,%rdi
02a6    6f476:	e8 00 00 00 00       	call   6f47b <__send_ipi_mask_ex+0x2ab>	6f477: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
02ab    6f47b:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
02b2    6f482:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
02b9    6f489:	31 c0                	xor    %eax,%eax
02bb    6f48b:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
02c0    6f490:	c7 44 24 08 00 00 00 00 	movl   $0x0,0x8(%rsp)
02c8    6f498:	31 c9                	xor    %ecx,%ecx
02ca    6f49a:	0f b7 d9             	movzwl %cx,%ebx
02cd    6f49d:	4c 8b 35 00 00 00 00 	mov    0x0(%rip),%r14        # 6f4a4 <__send_ipi_mask_ex+0x2d4>	6f4a0: R_X86_64_PC32	phys_base-0x4
02d4    6f4a4:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	6f4a7: R_X86_64_32S	phys_base
02db    6f4ab:	e8 00 00 00 00       	call   6f4b0 <__send_ipi_mask_ex+0x2e0>	6f4ac: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
02e0    6f4b0:	4c 8b 28             	mov    (%rax),%r13
02e3    6f4b3:	8b 2a                	mov    (%rdx),%ebp
02e5    6f4b5:	49 c7 c7 00 00 00 80 	mov    $0xffffffff80000000,%r15
02ec    6f4bc:	4c 2b 3d 00 00 00 00 	sub    0x0(%rip),%r15        # 6f4c3 <__send_ipi_mask_ex+0x2f3>	6f4bf: R_X86_64_PC32	page_offset_base-0x4
02f3    6f4c3:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	6f4c6: R_X86_64_32S	page_offset_base
02fa    6f4ca:	e8 00 00 00 00       	call   6f4cf <__send_ipi_mask_ex+0x2ff>	6f4cb: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
02ff    6f4cf:	48 8b 00             	mov    (%rax),%rax
0302    6f4d2:	31 ff                	xor    %edi,%edi
0304    6f4d4:	48 85 c0             	test   %rax,%rax
0307    6f4d7:	74 02                	je     6f4db <__send_ipi_mask_ex+0x30b>
0309    6f4d9:	8b 3a                	mov    (%rdx),%edi
030b    6f4db:	48 c1 e3 11          	shl    $0x11,%rbx
030f    6f4df:	4c 89 e6             	mov    %r12,%rsi
0312    6f4e2:	49 81 fc 00 00 00 80 	cmp    $0xffffffff80000000,%r12
0319    6f4e9:	48 89 c1             	mov    %rax,%rcx
031c    6f4ec:	49 0f 43 cd          	cmovae %r13,%rcx
0320    6f4f0:	0f 43 fd             	cmovae %ebp,%edi
0323    6f4f3:	4c 89 fd             	mov    %r15,%rbp
0326    6f4f6:	49 0f 43 ee          	cmovae %r14,%rbp
032a    6f4fa:	4c 01 e5             	add    %r12,%rbp
032d    6f4fd:	48 81 7c 24 58 00 00 00 80 	cmpq   $0xffffffff80000000,0x58(%rsp)
0336    6f506:	0f 93 c2             	setae  %dl
0339    6f509:	4c 8b 64 24 40       	mov    0x40(%rsp),%r12
033e    6f50e:	4c 09 e6             	or     %r12,%rsi
0341    6f511:	48 81 fe 00 00 00 80 	cmp    $0xffffffff80000000,%rsi
0348    6f518:	40 0f 93 c6          	setae  %sil
034c    6f51c:	40 30 d6             	xor    %dl,%sil
034f    6f51f:	4d 31 fe             	xor    %r15,%r14
0352    6f522:	4d 09 ee             	or     %r13,%r14
0355    6f525:	49 09 c6             	or     %rax,%r14
0358    6f528:	40 84 f6             	test   %sil,%sil
035b    6f52b:	4c 0f 44 f1          	cmove  %rcx,%r14
035f    6f52f:	8b 44 24 04          	mov    0x4(%rsp),%eax
0363    6f533:	0f 45 f8             	cmovne %eax,%edi
0366    6f536:	4d 85 f6             	test   %r14,%r14
0369    6f539:	0f 44 f8             	cmove  %eax,%edi
036c    6f53c:	41 89 fd             	mov    %edi,%r13d
036f    6f53f:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
0374    6f544:	41 c6 87 20 03 00 00 00 	movb   $0x0,0x320(%r15)
037c    6f54c:	e8 00 00 00 00       	call   6f551 <__send_ipi_mask_ex+0x381>	6f54d: R_X86_64_PLT32	hv_isolation_type_tdx-0x4
0381    6f551:	41 80 bf 20 03 00 00 01 	cmpb   $0x1,0x320(%r15)
0389    6f559:	0f 84 0c 03 00 00    	je     6f86b <__send_ipi_mask_ex+0x69b>
038f    6f55f:	48 83 cb 15          	or     $0x15,%rbx
0393    6f563:	4d 09 f4             	or     %r14,%r12
0396    6f566:	48 81 ed 00 00 00 80 	sub    $0xffffffff80000000,%rbp
039d    6f56d:	84 c0                	test   %al,%al
039f    6f56f:	49 89 df             	mov    %rbx,%r15
03a2    6f572:	48 89 eb             	mov    %rbp,%rbx
03a5    6f575:	74 53                	je     6f5ca <__send_ipi_mask_ex+0x3fa>
03a7    6f577:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
03ac    6f57c:	48 c7 80 20 03 00 00 00 00 00 00 	movq   $0x0,0x320(%rax)
03b7    6f587:	66 83 7c 24 18 00    	cmpw   $0x0,0x18(%rsp)
03bd    6f58d:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
03c2    6f592:	44 89 ef             	mov    %r13d,%edi
03c5    6f595:	0f 85 e4 05 00 00    	jne    6fb7f <__send_ipi_mask_ex+0x9af>
03cb    6f59b:	4d 85 e4             	test   %r12,%r12
03ce    6f59e:	0f 85 f0 05 00 00    	jne    6fb94 <__send_ipi_mask_ex+0x9c4>
03d4    6f5a4:	4c 89 ff             	mov    %r15,%rdi
03d7    6f5a7:	48 89 de             	mov    %rbx,%rsi
03da    6f5aa:	31 d2                	xor    %edx,%edx
03dc    6f5ac:	e8 00 00 00 00       	call   6f5b1 <__send_ipi_mask_ex+0x3e1>	6f5ad: R_X86_64_PLT32	hv_tdx_hypercall-0x4
03e1    6f5b1:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
03e6    6f5b6:	44 0f b7 b1 20 03 00 00 	movzwl 0x320(%rcx),%r14d
03ee    6f5be:	44 8b b9 a8 0f 00 00 	mov    0xfa8(%rcx),%r15d
03f5    6f5c5:	e9 e0 00 00 00       	jmp    6f6aa <__send_ipi_mask_ex+0x4da>
03fa    6f5ca:	48 89 5c 24 38       	mov    %rbx,0x38(%rsp)
03ff    6f5cf:	4c 89 e3             	mov    %r12,%rbx
0402    6f5d2:	4c 8b 74 24 20       	mov    0x20(%rsp),%r14
0407    6f5d7:	41 c6 86 20 03 00 00 00 	movb   $0x0,0x320(%r14)
040f    6f5df:	e8 00 00 00 00       	call   6f5e4 <__send_ipi_mask_ex+0x414>	6f5e0: R_X86_64_PLT32	hv_isolation_type_en_snp-0x4
0414    6f5e4:	41 80 be 20 03 00 00 01 	cmpb   $0x1,0x320(%r14)
041c    6f5ec:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
0421    6f5f1:	0f 84 a7 05 00 00    	je     6fb9e <__send_ipi_mask_ex+0x9ce>
0427    6f5f7:	4d 89 fc             	mov    %r15,%r12
042a    6f5fa:	84 c0                	test   %al,%al
042c    6f5fc:	74 31                	je     6f62f <__send_ipi_mask_ex+0x45f>
042e    6f5fe:	49 89 e7             	mov    %rsp,%r15
0431    6f601:	66 83 7c 24 18 00    	cmpw   $0x0,0x18(%rsp)
0437    6f607:	0f 85 33 06 00 00    	jne    6fc40 <__send_ipi_mask_ex+0xa70>
043d    6f60d:	48 85 db             	test   %rbx,%rbx
0440    6f610:	0f 85 3c 06 00 00    	jne    6fc52 <__send_ipi_mask_ex+0xa82>
0446    6f616:	45 31 f6             	xor    %r14d,%r14d
0449    6f619:	4c 89 fc             	mov    %r15,%rsp
044c    6f61c:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
0451    6f621:	4c 89 e1             	mov    %r12,%rcx
0454    6f624:	4d 89 f0             	mov    %r14,%r8
0457    6f627:	0f 01 d9             	vmmcall
045a    6f62a:	45 31 ff             	xor    %r15d,%r15d
045d    6f62d:	eb 7b                	jmp    6f6aa <__send_ipi_mask_ex+0x4da>
045f    6f62f:	4c 8b 35 00 00 00 00 	mov    0x0(%rip),%r14        # 6f636 <__send_ipi_mask_ex+0x466>	6f632: R_X86_64_PC32	hv_hypercall_pg-0x4
0466    6f636:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	6f639: R_X86_64_32S	hv_hypercall_pg
046d    6f63d:	e8 00 00 00 00       	call   6f642 <__send_ipi_mask_ex+0x472>	6f63e: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
0472    6f642:	4c 89 f6             	mov    %r14,%rsi
0475    6f645:	4c 8b 38             	mov    (%rax),%r15
0478    6f648:	44 8b 32             	mov    (%rdx),%r14d
047b    6f64b:	4d 85 ff             	test   %r15,%r15
047e    6f64e:	74 0f                	je     6f65f <__send_ipi_mask_ex+0x48f>
0480    6f650:	4c 89 f8             	mov    %r15,%rax
0483    6f653:	48 f7 d0             	not    %rax
0486    6f656:	48 21 f0             	and    %rsi,%rax
0489    6f659:	0f 84 b8 05 00 00    	je     6fc17 <__send_ipi_mask_ex+0xa47>
048f    6f65f:	48 85 f6             	test   %rsi,%rsi
0492    6f662:	0f 84 ca 05 00 00    	je     6fc32 <__send_ipi_mask_ex+0xa62>
0498    6f668:	48 89 e5             	mov    %rsp,%rbp
049b    6f66b:	4d 85 ff             	test   %r15,%r15
049e    6f66e:	0f 85 eb 05 00 00    	jne    6fc5f <__send_ipi_mask_ex+0xa8f>
04a4    6f674:	66 83 7c 24 18 00    	cmpw   $0x0,0x18(%rsp)
04aa    6f67a:	48 89 d8             	mov    %rbx,%rax
04ad    6f67d:	0f 85 ef 05 00 00    	jne    6fc72 <__send_ipi_mask_ex+0xaa2>
04b3    6f683:	48 85 c0             	test   %rax,%rax
04b6    6f686:	0f 85 01 06 00 00    	jne    6fc8d <__send_ipi_mask_ex+0xabd>
04bc    6f68c:	45 31 f6             	xor    %r14d,%r14d
04bf    6f68f:	48 89 ec             	mov    %rbp,%rsp
04c2    6f692:	4c 89 e1             	mov    %r12,%rcx
04c5    6f695:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
04ca    6f69a:	4d 89 f0             	mov    %r14,%r8
04cd    6f69d:	ff d6                	call   *%rsi
04cf    6f69f:	90                   	nop
04d0    6f6a0:	90                   	nop
04d1    6f6a1:	90                   	nop
04d2    6f6a2:	45 31 ff             	xor    %r15d,%r15d
04d5    6f6a5:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
04da    6f6aa:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
04df    6f6af:	0f b7 d8             	movzwl %ax,%ebx
04e2    6f6b2:	4d 85 f6             	test   %r14,%r14
04e5    6f6b5:	74 0d                	je     6f6c4 <__send_ipi_mask_ex+0x4f4>
04e7    6f6b7:	44 89 f0             	mov    %r14d,%eax
04ea    6f6ba:	f7 d0                	not    %eax
04ec    6f6bc:	21 d8                	and    %ebx,%eax
04ee    6f6be:	0f 84 c2 01 00 00    	je     6f886 <__send_ipi_mask_ex+0x6b6>
04f4    6f6c4:	48 85 db             	test   %rbx,%rbx
04f7    6f6c7:	0f 84 ca 01 00 00    	je     6f897 <__send_ipi_mask_ex+0x6c7>
04fd    6f6cd:	80 7c 24 03 00       	cmpb   $0x0,0x3(%rsp)
0502    6f6d2:	0f 85 75 fd ff ff    	jne    6f44d <__send_ipi_mask_ex+0x27d>
0508    6f6d8:	48 85 ed             	test   %rbp,%rbp
050b    6f6db:	74 05                	je     6f6e2 <__send_ipi_mask_ex+0x512>
050d    6f6dd:	e8 00 00 00 00       	call   6f6e2 <__send_ipi_mask_ex+0x512>	6f6de: R_X86_64_PLT32	trace_hardirqs_on-0x4
0512    6f6e2:	48 8d 5c 24 68       	lea    0x68(%rsp),%rbx
0517    6f6e7:	be 08 00 00 00       	mov    $0x8,%esi
051c    6f6ec:	48 89 df             	mov    %rbx,%rdi
051f    6f6ef:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	6f6f2: R_X86_64_32S	.rodata+0x22cc
0526    6f6f6:	e8 00 00 00 00       	call   6f6fb <__send_ipi_mask_ex+0x52b>	6f6f7: R_X86_64_PLT32	__msan_poison_alloca-0x4
052b    6f6fb:	be 08 00 00 00       	mov    $0x8,%esi
0530    6f700:	48 89 df             	mov    %rbx,%rdi
0533    6f703:	e8 00 00 00 00       	call   6f708 <__send_ipi_mask_ex+0x538>	6f704: R_X86_64_PLT32	__msan_instrument_asm_store-0x4
0538    6f708:	9c                   	pushf
0539    6f709:	8f 44 24 68          	pop    0x68(%rsp)
053d    6f70d:	4c 8b 64 24 68       	mov    0x68(%rsp),%r12
0542    6f712:	48 89 df             	mov    %rbx,%rdi
0545    6f715:	e8 00 00 00 00       	call   6f71a <__send_ipi_mask_ex+0x54a>	6f716: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
054a    6f71a:	48 8b 00             	mov    (%rax),%rax
054d    6f71d:	25 00 02 00 00       	and    $0x200,%eax
0552    6f722:	41 81 e4 00 02 00 00 	and    $0x200,%r12d
0559    6f729:	48 85 c0             	test   %rax,%rax
055c    6f72c:	74 0b                	je     6f739 <__send_ipi_mask_ex+0x569>
055e    6f72e:	f7 d0                	not    %eax
0560    6f730:	44 21 e0             	and    %r12d,%eax
0563    6f733:	0f 84 a6 00 00 00    	je     6f7df <__send_ipi_mask_ex+0x60f>
0569    6f739:	4d 85 e4             	test   %r12,%r12
056c    6f73c:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
0571    6f741:	0f 85 6a 01 00 00    	jne    6f8b1 <__send_ipi_mask_ex+0x6e1>
0577    6f747:	80 7c 24 03 00       	cmpb   $0x0,0x3(%rsp)
057c    6f74c:	0f 85 74 01 00 00    	jne    6f8c6 <__send_ipi_mask_ex+0x6f6>
0582    6f752:	48 85 ed             	test   %rbp,%rbp
0585    6f755:	74 01                	je     6f758 <__send_ipi_mask_ex+0x588>
0587    6f757:	fb                   	sti
0588    6f758:	0f b7 c0             	movzwl %ax,%eax
058b    6f75b:	4d 85 f6             	test   %r14,%r14
058e    6f75e:	0f 95 c2             	setne  %dl
0591    6f761:	41 f7 d6             	not    %r14d
0594    6f764:	44 85 f0             	test   %r14d,%eax
0597    6f767:	0f 94 c1             	sete   %cl
059a    6f76a:	20 d1                	and    %dl,%cl
059c    6f76c:	48 85 c0             	test   %rax,%rax
059f    6f76f:	0f 94 c0             	sete   %al
05a2    6f772:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
05a7    6f777:	88 8a 20 03 00 00    	mov    %cl,0x320(%rdx)
05ad    6f77d:	44 89 ba a8 0f 00 00 	mov    %r15d,0xfa8(%rdx)
05b4    6f784:	65 48 8b 0c 25 28 00 00 00 	mov    %gs:0x28,%rcx
05bd    6f78d:	48 3b 4c 24 70       	cmp    0x70(%rsp),%rcx
05c2    6f792:	0f 85 08 05 00 00    	jne    6fca0 <__send_ipi_mask_ex+0xad0>
05c8    6f798:	48 83 c4 78          	add    $0x78,%rsp
05cc    6f79c:	5b                   	pop    %rbx
05cd    6f79d:	41 5c                	pop    %r12
05cf    6f79f:	41 5d                	pop    %r13
05d1    6f7a1:	41 5e                	pop    %r14
05d3    6f7a3:	41 5f                	pop    %r15
05d5    6f7a5:	5d                   	pop    %rbp
05d6    6f7a6:	2e e9 00 00 00 00    	cs jmp 6f7ac <__send_ipi_mask_ex+0x5dc>	6f7a8: R_X86_64_PLT32	__x86_return_thunk-0x4
05dc    6f7ac:	8b 3a                	mov    (%rdx),%edi
05de    6f7ae:	e8 00 00 00 00       	call   6f7b3 <__send_ipi_mask_ex+0x5e3>	6f7af: R_X86_64_PLT32	__msan_warning-0x4
05e3    6f7b3:	e9 71 fa ff ff       	jmp    6f229 <__send_ipi_mask_ex+0x59>
05e8    6f7b8:	8b 7c 24 04          	mov    0x4(%rsp),%edi
05ec    6f7bc:	48 89 c3             	mov    %rax,%rbx
05ef    6f7bf:	e8 00 00 00 00       	call   6f7c4 <__send_ipi_mask_ex+0x5f4>	6f7c0: R_X86_64_PLT32	__msan_warning-0x4
05f4    6f7c4:	48 89 d8             	mov    %rbx,%rax
05f7    6f7c7:	4d 85 ed             	test   %r13,%r13
05fa    6f7ca:	0f 85 39 fb ff ff    	jne    6f309 <__send_ipi_mask_ex+0x139>
0600    6f7d0:	b8 05 00 00 00       	mov    $0x5,%eax
0605    6f7d5:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
060a    6f7da:	e9 5d fc ff ff       	jmp    6f43c <__send_ipi_mask_ex+0x26c>
060f    6f7df:	8b 3a                	mov    (%rdx),%edi
0611    6f7e1:	e8 00 00 00 00       	call   6f7e6 <__send_ipi_mask_ex+0x616>	6f7e2: R_X86_64_PLT32	__msan_warning-0x4
0616    6f7e6:	e9 4e ff ff ff       	jmp    6f739 <__send_ipi_mask_ex+0x569>
061b    6f7eb:	8b 7c 24 2c          	mov    0x2c(%rsp),%edi
061f    6f7ef:	e8 00 00 00 00       	call   6f7f4 <__send_ipi_mask_ex+0x624>	6f7f0: R_X86_64_PLT32	__msan_warning-0x4
0624    6f7f4:	48 85 ed             	test   %rbp,%rbp
0627    6f7f7:	0f 85 ae fa ff ff    	jne    6f2ab <__send_ipi_mask_ex+0xdb>
062d    6f7fd:	e9 ae fa ff ff       	jmp    6f2b0 <__send_ipi_mask_ex+0xe0>
0632    6f802:	8b 3a                	mov    (%rdx),%edi
0634    6f804:	e8 00 00 00 00       	call   6f809 <__send_ipi_mask_ex+0x639>	6f805: R_X86_64_PLT32	__msan_warning-0x4
0639    6f809:	e9 bf fa ff ff       	jmp    6f2cd <__send_ipi_mask_ex+0xfd>
063e    6f80e:	48 85 c0             	test   %rax,%rax
0641    6f811:	74 02                	je     6f815 <__send_ipi_mask_ex+0x645>
0643    6f813:	8b 1a                	mov    (%rdx),%ebx
0645    6f815:	89 df                	mov    %ebx,%edi
0647    6f817:	e8 00 00 00 00       	call   6f81c <__send_ipi_mask_ex+0x64c>	6f818: R_X86_64_PLT32	__msan_warning-0x4
064c    6f81c:	e9 a2 fb ff ff       	jmp    6f3c3 <__send_ipi_mask_ex+0x1f3>
0651    6f821:	8b 6c 24 04          	mov    0x4(%rsp),%ebp
0655    6f825:	89 ef                	mov    %ebp,%edi
0657    6f827:	e8 00 00 00 00       	call   6f82c <__send_ipi_mask_ex+0x65c>	6f828: R_X86_64_PLT32	__msan_warning-0x4
065c    6f82c:	4c 89 ef             	mov    %r13,%rdi
065f    6f82f:	e8 00 00 00 00       	call   6f834 <__send_ipi_mask_ex+0x664>	6f830: R_X86_64_PLT32	__msan_metadata_ptr_for_store_4-0x4
0664    6f834:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
066a    6f83a:	45 89 75 00          	mov    %r14d,0x0(%r13)
066e    6f83e:	49 8d 5d 04          	lea    0x4(%r13),%rbx
0672    6f842:	89 ef                	mov    %ebp,%edi
0674    6f844:	e8 00 00 00 00       	call   6f849 <__send_ipi_mask_ex+0x679>	6f845: R_X86_64_PLT32	__msan_warning-0x4
0679    6f849:	48 89 df             	mov    %rbx,%rdi
067c    6f84c:	e8 00 00 00 00       	call   6f851 <__send_ipi_mask_ex+0x681>	6f84d: R_X86_64_PLT32	__msan_metadata_ptr_for_store_4-0x4
0681    6f851:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
0687    6f857:	41 c7 45 04 00 00 00 00 	movl   $0x0,0x4(%r13)
068f    6f85f:	89 ef                	mov    %ebp,%edi
0691    6f861:	e8 00 00 00 00       	call   6f866 <__send_ipi_mask_ex+0x696>	6f862: R_X86_64_PLT32	__msan_warning-0x4
0696    6f866:	e9 e9 fa ff ff       	jmp    6f354 <__send_ipi_mask_ex+0x184>
069b    6f86b:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
06a0    6f870:	8b b9 a8 0f 00 00    	mov    0xfa8(%rcx),%edi
06a6    6f876:	41 89 c7             	mov    %eax,%r15d
06a9    6f879:	e8 00 00 00 00       	call   6f87e <__send_ipi_mask_ex+0x6ae>	6f87a: R_X86_64_PLT32	__msan_warning-0x4
06ae    6f87e:	44 89 f8             	mov    %r15d,%eax
06b1    6f881:	e9 d9 fc ff ff       	jmp    6f55f <__send_ipi_mask_ex+0x38f>
06b6    6f886:	44 89 ff             	mov    %r15d,%edi
06b9    6f889:	e8 00 00 00 00       	call   6f88e <__send_ipi_mask_ex+0x6be>	6f88a: R_X86_64_PLT32	__msan_warning-0x4
06be    6f88e:	48 85 db             	test   %rbx,%rbx
06c1    6f891:	0f 85 36 fe ff ff    	jne    6f6cd <__send_ipi_mask_ex+0x4fd>
06c7    6f897:	e8 00 00 00 00       	call   6f89c <__send_ipi_mask_ex+0x6cc>	6f898: R_X86_64_PLT32	arch_touch_nmi_watchdog-0x4
06cc    6f89c:	e8 00 00 00 00       	call   6f8a1 <__send_ipi_mask_ex+0x6d1>	6f89d: R_X86_64_PLT32	touch_softlockup_watchdog-0x4
06d1    6f8a1:	80 7c 24 03 00       	cmpb   $0x0,0x3(%rsp)
06d6    6f8a6:	0f 84 2c fe ff ff    	je     6f6d8 <__send_ipi_mask_ex+0x508>
06dc    6f8ac:	e9 9c fb ff ff       	jmp    6f44d <__send_ipi_mask_ex+0x27d>
06e1    6f8b1:	e8 00 00 00 00       	call   6f8b6 <__send_ipi_mask_ex+0x6e6>	6f8b2: R_X86_64_PLT32	warn_bogus_irq_restore-0x4
06e6    6f8b6:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
06eb    6f8bb:	80 7c 24 03 00       	cmpb   $0x0,0x3(%rsp)
06f0    6f8c0:	0f 84 8c fe ff ff    	je     6f752 <__send_ipi_mask_ex+0x582>
06f6    6f8c6:	8b 7c 24 2c          	mov    0x2c(%rsp),%edi
06fa    6f8ca:	e8 00 00 00 00       	call   6f8cf <__send_ipi_mask_ex+0x6ff>	6f8cb: R_X86_64_PLT32	__msan_warning-0x4
06ff    6f8cf:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
0704    6f8d4:	48 85 ed             	test   %rbp,%rbp
0707    6f8d7:	0f 85 7a fe ff ff    	jne    6f757 <__send_ipi_mask_ex+0x587>
070d    6f8dd:	e9 76 fe ff ff       	jmp    6f758 <__send_ipi_mask_ex+0x588>
0712    6f8e2:	8b 7c 24 04          	mov    0x4(%rsp),%edi
0716    6f8e6:	e8 00 00 00 00       	call   6f8eb <__send_ipi_mask_ex+0x71b>	6f8e7: R_X86_64_PLT32	__msan_warning-0x4
071b    6f8eb:	e9 f1 fa ff ff       	jmp    6f3e1 <__send_ipi_mask_ex+0x211>
0720    6f8f0:	8b 3a                	mov    (%rdx),%edi
0722    6f8f2:	e8 00 00 00 00       	call   6f8f7 <__send_ipi_mask_ex+0x727>	6f8f3: R_X86_64_PLT32	__msan_warning-0x4
0727    6f8f7:	41 81 fe ff 0f 00 00 	cmp    $0xfff,%r14d
072e    6f8fe:	0f 87 38 fb ff ff    	ja     6f43c <__send_ipi_mask_ex+0x26c>
0734    6f904:	49 8d 7d 18          	lea    0x18(%r13),%rdi
0738    6f908:	41 c1 ee 03          	shr    $0x3,%r14d
073c    6f90c:	41 81 e6 f8 01 00 00 	and    $0x1f8,%r14d
0743    6f913:	49 83 c6 08          	add    $0x8,%r14
0747    6f917:	31 db                	xor    %ebx,%ebx
0749    6f919:	31 f6                	xor    %esi,%esi
074b    6f91b:	4c 89 f2             	mov    %r14,%rdx
074e    6f91e:	e8 00 00 00 00       	call   6f923 <__send_ipi_mask_ex+0x753>	6f91f: R_X86_64_PLT32	__msan_memset-0x4
0753    6f923:	c7 44 24 0c 01 00 00 00 	movl   $0x1,0xc(%rsp)
075b    6f92b:	45 31 ff             	xor    %r15d,%r15d
075e    6f92e:	31 ed                	xor    %ebp,%ebp
0760    6f930:	e9 91 00 00 00       	jmp    6f9c6 <__send_ipi_mask_ex+0x7f6>
0765    6f935:	45 85 e4             	test   %r12d,%r12d
0768    6f938:	44 89 f7             	mov    %r14d,%edi
076b    6f93b:	0f 44 7c 24 04       	cmove  0x4(%rsp),%edi
0770    6f940:	e8 00 00 00 00       	call   6f945 <__send_ipi_mask_ex+0x775>	6f941: R_X86_64_PLT32	__msan_warning-0x4
0775    6f945:	45 85 e4             	test   %r12d,%r12d
0778    6f948:	0f 85 65 01 00 00    	jne    6fab3 <__send_ipi_mask_ex+0x8e3>
077e    6f94e:	44 89 f8             	mov    %r15d,%eax
0781    6f951:	c1 f8 06             	sar    $0x6,%eax
0784    6f954:	48 98                	cltq
0786    6f956:	41 83 e7 c0          	and    $0xffffffc0,%r15d
078a    6f95a:	45 29 fd             	sub    %r15d,%r13d
078d    6f95d:	49 63 cd             	movslq %r13d,%rcx
0790    6f960:	49 89 ed             	mov    %rbp,%r13
0793    6f963:	48 0f ab 4c c5 18    	bts    %rcx,0x18(%rbp,%rax,8)
0799    6f969:	48 8b 6c 24 18       	mov    0x18(%rsp),%rbp
079e    6f96e:	85 ed                	test   %ebp,%ebp
07a0    6f970:	44 8b 44 24 08       	mov    0x8(%rsp),%r8d
07a5    6f975:	44 89 c1             	mov    %r8d,%ecx
07a8    6f978:	41 0f 44 ce          	cmove  %r14d,%ecx
07ac    6f97c:	8d 50 01             	lea    0x1(%rax),%edx
07af    6f97f:	44 8b 4c 24 0c       	mov    0xc(%rsp),%r9d
07b4    6f984:	44 89 ce             	mov    %r9d,%esi
07b7    6f987:	31 d6                	xor    %edx,%esi
07b9    6f989:	89 ef                	mov    %ebp,%edi
07bb    6f98b:	44 09 e7             	or     %r12d,%edi
07be    6f98e:	09 f7                	or     %esi,%edi
07c0    6f990:	44 39 c8             	cmp    %r9d,%eax
07c3    6f993:	44 89 e0             	mov    %r12d,%eax
07c6    6f996:	0f 4c c5             	cmovl  %ebp,%eax
07c9    6f999:	45 0f 4c f0          	cmovl  %r8d,%r14d
07cd    6f99d:	44 0f 4d ca          	cmovge %edx,%r9d
07d1    6f9a1:	44 89 4c 24 0c       	mov    %r9d,0xc(%rsp)
07d6    6f9a6:	44 09 e5             	or     %r12d,%ebp
07d9    6f9a9:	0f 45 c7             	cmovne %edi,%eax
07dc    6f9ac:	44 0f 45 f1          	cmovne %ecx,%r14d
07e0    6f9b0:	41 89 c7             	mov    %eax,%r15d
07e3    6f9b3:	44 89 f5             	mov    %r14d,%ebp
07e6    6f9b6:	4c 8b 64 24 48       	mov    0x48(%rsp),%r12
07eb    6f9bb:	ff c3                	inc    %ebx
07ed    6f9bd:	83 fb 40             	cmp    $0x40,%ebx
07f0    6f9c0:	0f 83 3c 01 00 00    	jae    6fb02 <__send_ipi_mask_ex+0x932>
07f6    6f9c6:	49 c7 c4 ff ff ff ff 	mov    $0xffffffffffffffff,%r12
07fd    6f9cd:	89 d9                	mov    %ebx,%ecx
07ff    6f9cf:	49 d3 e4             	shl    %cl,%r12
0802    6f9d2:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
0807    6f9d7:	4c 8b 37             	mov    (%rdi),%r14
080a    6f9da:	4d 21 e6             	and    %r12,%r14
080d    6f9dd:	e8 00 00 00 00       	call   6f9e2 <__send_ipi_mask_ex+0x812>	6f9de: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
0812    6f9e2:	8b 1a                	mov    (%rdx),%ebx
0814    6f9e4:	4c 23 20             	and    (%rax),%r12
0817    6f9e7:	74 0f                	je     6f9f8 <__send_ipi_mask_ex+0x828>
0819    6f9e9:	4c 89 e0             	mov    %r12,%rax
081c    6f9ec:	48 f7 d0             	not    %rax
081f    6f9ef:	4c 21 f0             	and    %r14,%rax
0822    6f9f2:	0f 84 c8 00 00 00    	je     6fac0 <__send_ipi_mask_ex+0x8f0>
0828    6f9f8:	4d 85 f6             	test   %r14,%r14
082b    6f9fb:	0f 84 fc 00 00 00    	je     6fafd <__send_ipi_mask_ex+0x92d>
0831    6fa01:	4d 85 e4             	test   %r12,%r12
0834    6fa04:	0f 85 c8 00 00 00    	jne    6fad2 <__send_ipi_mask_ex+0x902>
083a    6fa0a:	4c 89 74 24 60       	mov    %r14,0x60(%rsp)
083f    6fa0f:	f3 48 0f bc 5c 24 60 	tzcnt  0x60(%rsp),%rbx
0846    6fa16:	83 fb 3f             	cmp    $0x3f,%ebx
0849    6fa19:	4c 8b 64 24 48       	mov    0x48(%rsp),%r12
084e    6fa1e:	0f 87 de 00 00 00    	ja     6fb02 <__send_ipi_mask_ex+0x932>
0854    6fa24:	80 7c 24 38 00       	cmpb   $0x0,0x38(%rsp)
0859    6fa29:	74 0b                	je     6fa36 <__send_ipi_mask_ex+0x866>
085b    6fa2b:	65 8b 05 00 00 00 00 	mov    %gs:0x0(%rip),%eax        # 6fa32 <__send_ipi_mask_ex+0x862>	6fa2e: R_X86_64_PC32	pcpu_hot+0x8
0862    6fa32:	39 d8                	cmp    %ebx,%eax
0864    6fa34:	74 85                	je     6f9bb <__send_ipi_mask_ex+0x7eb>
0866    6fa36:	89 6c 24 08          	mov    %ebp,0x8(%rsp)
086a    6fa3a:	4c 89 ed             	mov    %r13,%rbp
086d    6fa3d:	4c 89 7c 24 18       	mov    %r15,0x18(%rsp)
0872    6fa42:	41 89 de             	mov    %ebx,%r14d
0875    6fa45:	49 c1 e6 02          	shl    $0x2,%r14
0879    6fa49:	4c 03 35 00 00 00 00 	add    0x0(%rip),%r14        # 6fa50 <__send_ipi_mask_ex+0x880>	6fa4c: R_X86_64_PC32	hv_vp_index-0x4
0880    6fa50:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	6fa53: R_X86_64_32S	hv_vp_index
0887    6fa57:	e8 00 00 00 00       	call   6fa5c <__send_ipi_mask_ex+0x88c>	6fa58: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
088c    6fa5c:	48 83 38 00          	cmpq   $0x0,(%rax)
0890    6fa60:	0f 85 8b 00 00 00    	jne    6faf1 <__send_ipi_mask_ex+0x921>
0896    6fa66:	45 8b 2e             	mov    (%r14),%r13d
0899    6fa69:	4c 89 f7             	mov    %r14,%rdi
089c    6fa6c:	e8 00 00 00 00       	call   6fa71 <__send_ipi_mask_ex+0x8a1>	6fa6d: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
08a1    6fa71:	4c 63 20             	movslq (%rax),%r12
08a4    6fa74:	44 8b 32             	mov    (%rdx),%r14d
08a7    6fa77:	4d 85 e4             	test   %r12,%r12
08aa    6fa7a:	74 0b                	je     6fa87 <__send_ipi_mask_ex+0x8b7>
08ac    6fa7c:	44 89 e0             	mov    %r12d,%eax
08af    6fa7f:	44 09 e8             	or     %r13d,%eax
08b2    6fa82:	83 f8 ff             	cmp    $0xffffffff,%eax
08b5    6fa85:	74 57                	je     6fade <__send_ipi_mask_ex+0x90e>
08b7    6fa87:	41 83 fd ff          	cmp    $0xffffffff,%r13d
08bb    6fa8b:	0f 84 6b 01 00 00    	je     6fbfc <__send_ipi_mask_ex+0xa2c>
08c1    6fa91:	45 8d 7d 3f          	lea    0x3f(%r13),%r15d
08c5    6fa95:	45 85 ed             	test   %r13d,%r13d
08c8    6fa98:	45 0f 49 fd          	cmovns %r13d,%r15d
08cc    6fa9c:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
08d1    6faa1:	4c 09 e0             	or     %r12,%rax
08d4    6faa4:	0f 85 8b fe ff ff    	jne    6f935 <__send_ipi_mask_ex+0x765>
08da    6faaa:	45 85 e4             	test   %r12d,%r12d
08dd    6faad:	0f 84 9b fe ff ff    	je     6f94e <__send_ipi_mask_ex+0x77e>
08e3    6fab3:	44 89 f7             	mov    %r14d,%edi
08e6    6fab6:	e8 00 00 00 00       	call   6fabb <__send_ipi_mask_ex+0x8eb>	6fab7: R_X86_64_PLT32	__msan_warning-0x4
08eb    6fabb:	e9 8e fe ff ff       	jmp    6f94e <__send_ipi_mask_ex+0x77e>
08f0    6fac0:	89 df                	mov    %ebx,%edi
08f2    6fac2:	e8 00 00 00 00       	call   6fac7 <__send_ipi_mask_ex+0x8f7>	6fac3: R_X86_64_PLT32	__msan_warning-0x4
08f7    6fac7:	4d 85 f6             	test   %r14,%r14
08fa    6faca:	0f 85 31 ff ff ff    	jne    6fa01 <__send_ipi_mask_ex+0x831>
0900    6fad0:	eb 2b                	jmp    6fafd <__send_ipi_mask_ex+0x92d>
0902    6fad2:	89 df                	mov    %ebx,%edi
0904    6fad4:	e8 00 00 00 00       	call   6fad9 <__send_ipi_mask_ex+0x909>	6fad5: R_X86_64_PLT32	__msan_warning-0x4
0909    6fad9:	e9 2c ff ff ff       	jmp    6fa0a <__send_ipi_mask_ex+0x83a>
090e    6fade:	44 89 f7             	mov    %r14d,%edi
0911    6fae1:	e8 00 00 00 00       	call   6fae6 <__send_ipi_mask_ex+0x916>	6fae2: R_X86_64_PLT32	__msan_warning-0x4
0916    6fae6:	41 83 fd ff          	cmp    $0xffffffff,%r13d
091a    6faea:	75 a5                	jne    6fa91 <__send_ipi_mask_ex+0x8c1>
091c    6faec:	e9 0b 01 00 00       	jmp    6fbfc <__send_ipi_mask_ex+0xa2c>
0921    6faf1:	8b 3a                	mov    (%rdx),%edi
0923    6faf3:	e8 00 00 00 00       	call   6faf8 <__send_ipi_mask_ex+0x928>	6faf4: R_X86_64_PLT32	__msan_warning-0x4
0928    6faf8:	e9 69 ff ff ff       	jmp    6fa66 <__send_ipi_mask_ex+0x896>
092d    6fafd:	4c 8b 64 24 48       	mov    0x48(%rsp),%r12
0932    6fb02:	45 31 f6             	xor    %r14d,%r14d
0935    6fb05:	45 85 ff             	test   %r15d,%r15d
0938    6fb08:	89 6c 24 08          	mov    %ebp,0x8(%rsp)
093c    6fb0c:	89 eb                	mov    %ebp,%ebx
093e    6fb0e:	41 0f 44 df          	cmove  %r15d,%ebx
0942    6fb12:	41 0f 95 c6          	setne  %r14b
0946    6fb16:	41 0f 44 df          	cmove  %r15d,%ebx
094a    6fb1a:	49 f7 de             	neg    %r14
094d    6fb1d:	8b 44 24 0c          	mov    0xc(%rsp),%eax
0951    6fb21:	89 c1                	mov    %eax,%ecx
0953    6fb23:	f6 d9                	neg    %cl
0955    6fb25:	48 c7 c5 ff ff ff ff 	mov    $0xffffffffffffffff,%rbp
095c    6fb2c:	48 d3 ed             	shr    %cl,%rbp
095f    6fb2f:	48 83 7c 24 40 00    	cmpq   $0x0,0x40(%rsp)
0965    6fb35:	0f 85 81 00 00 00    	jne    6fbbc <__send_ipi_mask_ex+0x9ec>
096b    6fb3b:	4c 89 e7             	mov    %r12,%rdi
096e    6fb3e:	e8 00 00 00 00       	call   6fb43 <__send_ipi_mask_ex+0x973>	6fb3f: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
0973    6fb43:	4c 89 30             	mov    %r14,(%rax)
0976    6fb46:	45 85 ff             	test   %r15d,%r15d
0979    6fb49:	75 7f                	jne    6fbca <__send_ipi_mask_ex+0x9fa>
097b    6fb4b:	49 89 2c 24          	mov    %rbp,(%r12)
097f    6fb4f:	45 31 ff             	xor    %r15d,%r15d
0982    6fb52:	8b 4c 24 0c          	mov    0xc(%rsp),%ecx
0986    6fb56:	85 c9                	test   %ecx,%ecx
0988    6fb58:	7e 0f                	jle    6fb69 <__send_ipi_mask_ex+0x999>
098a    6fb5a:	4d 89 ec             	mov    %r13,%r12
098d    6fb5d:	31 c0                	xor    %eax,%eax
098f    6fb5f:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
0994    6fb64:	e9 31 f9 ff ff       	jmp    6f49a <__send_ipi_mask_ex+0x2ca>
0999    6fb69:	45 31 f6             	xor    %r14d,%r14d
099c    6fb6c:	e9 91 00 00 00       	jmp    6fc02 <__send_ipi_mask_ex+0xa32>
09a1    6fb71:	8b 7c 24 04          	mov    0x4(%rsp),%edi
09a5    6fb75:	e8 00 00 00 00       	call   6fb7a <__send_ipi_mask_ex+0x9aa>	6fb76: R_X86_64_PLT32	__msan_warning-0x4
09aa    6fb7a:	e9 f1 f8 ff ff       	jmp    6f470 <__send_ipi_mask_ex+0x2a0>
09af    6fb7f:	8b 7c 24 08          	mov    0x8(%rsp),%edi
09b3    6fb83:	e8 00 00 00 00       	call   6fb88 <__send_ipi_mask_ex+0x9b8>	6fb84: R_X86_64_PLT32	__msan_warning-0x4
09b8    6fb88:	44 89 ef             	mov    %r13d,%edi
09bb    6fb8b:	4d 85 e4             	test   %r12,%r12
09be    6fb8e:	0f 84 10 fa ff ff    	je     6f5a4 <__send_ipi_mask_ex+0x3d4>
09c4    6fb94:	e8 00 00 00 00       	call   6fb99 <__send_ipi_mask_ex+0x9c9>	6fb95: R_X86_64_PLT32	__msan_warning-0x4
09c9    6fb99:	e9 06 fa ff ff       	jmp    6f5a4 <__send_ipi_mask_ex+0x3d4>
09ce    6fb9e:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
09d3    6fba3:	8b b9 a8 0f 00 00    	mov    0xfa8(%rcx),%edi
09d9    6fba9:	89 c5                	mov    %eax,%ebp
09db    6fbab:	e8 00 00 00 00       	call   6fbb0 <__send_ipi_mask_ex+0x9e0>	6fbac: R_X86_64_PLT32	__msan_warning-0x4
09e0    6fbb0:	89 e8                	mov    %ebp,%eax
09e2    6fbb2:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
09e7    6fbb7:	e9 3b fa ff ff       	jmp    6f5f7 <__send_ipi_mask_ex+0x427>
09ec    6fbbc:	8b 7c 24 04          	mov    0x4(%rsp),%edi
09f0    6fbc0:	e8 00 00 00 00       	call   6fbc5 <__send_ipi_mask_ex+0x9f5>	6fbc1: R_X86_64_PLT32	__msan_warning-0x4
09f5    6fbc5:	e9 71 ff ff ff       	jmp    6fb3b <__send_ipi_mask_ex+0x96b>
09fa    6fbca:	4d 89 e6             	mov    %r12,%r14
09fd    6fbcd:	4d 89 ec             	mov    %r13,%r12
0a00    6fbd0:	4c 89 7c 24 18       	mov    %r15,0x18(%rsp)
0a05    6fbd5:	89 df                	mov    %ebx,%edi
0a07    6fbd7:	48 89 d3             	mov    %rdx,%rbx
0a0a    6fbda:	e8 00 00 00 00       	call   6fbdf <__send_ipi_mask_ex+0xa0f>	6fbdb: R_X86_64_PLT32	__msan_chain_origin-0x4
0a0f    6fbdf:	89 03                	mov    %eax,(%rbx)
0a11    6fbe1:	89 43 04             	mov    %eax,0x4(%rbx)
0a14    6fbe4:	49 89 2e             	mov    %rbp,(%r14)
0a17    6fbe7:	8b 7c 24 08          	mov    0x8(%rsp),%edi
0a1b    6fbeb:	e8 00 00 00 00       	call   6fbf0 <__send_ipi_mask_ex+0xa20>	6fbec: R_X86_64_PLT32	__msan_warning-0x4
0a20    6fbf0:	8b 4c 24 0c          	mov    0xc(%rsp),%ecx
0a24    6fbf4:	85 c9                	test   %ecx,%ecx
0a26    6fbf6:	0f 8f 9e f8 ff ff    	jg     6f49a <__send_ipi_mask_ex+0x2ca>
0a2c    6fbfc:	45 31 f6             	xor    %r14d,%r14d
0a2f    6fbff:	45 31 ff             	xor    %r15d,%r15d
0a32    6fc02:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
0a37    6fc07:	80 7c 24 03 00       	cmpb   $0x0,0x3(%rsp)
0a3c    6fc0c:	0f 84 c6 fa ff ff    	je     6f6d8 <__send_ipi_mask_ex+0x508>
0a42    6fc12:	e9 36 f8 ff ff       	jmp    6f44d <__send_ipi_mask_ex+0x27d>
0a47    6fc17:	44 89 f7             	mov    %r14d,%edi
0a4a    6fc1a:	48 89 74 24 48       	mov    %rsi,0x48(%rsp)
0a4f    6fc1f:	e8 00 00 00 00       	call   6fc24 <__send_ipi_mask_ex+0xa54>	6fc20: R_X86_64_PLT32	__msan_warning-0x4
0a54    6fc24:	48 8b 74 24 48       	mov    0x48(%rsp),%rsi
0a59    6fc29:	48 85 f6             	test   %rsi,%rsi
0a5c    6fc2c:	0f 85 36 fa ff ff    	jne    6f668 <__send_ipi_mask_ex+0x498>
0a62    6fc32:	48 c7 44 24 30 ff ff ff ff 	movq   $0xffffffffffffffff,0x30(%rsp)
0a6b    6fc3b:	e9 fc f7 ff ff       	jmp    6f43c <__send_ipi_mask_ex+0x26c>
0a70    6fc40:	8b 7c 24 08          	mov    0x8(%rsp),%edi
0a74    6fc44:	e8 00 00 00 00       	call   6fc49 <__send_ipi_mask_ex+0xa79>	6fc45: R_X86_64_PLT32	__msan_warning-0x4
0a79    6fc49:	48 85 db             	test   %rbx,%rbx
0a7c    6fc4c:	0f 84 c4 f9 ff ff    	je     6f616 <__send_ipi_mask_ex+0x446>
0a82    6fc52:	44 89 ef             	mov    %r13d,%edi
0a85    6fc55:	e8 00 00 00 00       	call   6fc5a <__send_ipi_mask_ex+0xa8a>	6fc56: R_X86_64_PLT32	__msan_warning-0x4
0a8a    6fc5a:	e9 b7 f9 ff ff       	jmp    6f616 <__send_ipi_mask_ex+0x446>
0a8f    6fc5f:	44 89 f7             	mov    %r14d,%edi
0a92    6fc62:	49 89 f6             	mov    %rsi,%r14
0a95    6fc65:	e8 00 00 00 00       	call   6fc6a <__send_ipi_mask_ex+0xa9a>	6fc66: R_X86_64_PLT32	__msan_warning-0x4
0a9a    6fc6a:	4c 89 f6             	mov    %r14,%rsi
0a9d    6fc6d:	e9 02 fa ff ff       	jmp    6f674 <__send_ipi_mask_ex+0x4a4>
0aa2    6fc72:	8b 7c 24 08          	mov    0x8(%rsp),%edi
0aa6    6fc76:	49 89 f6             	mov    %rsi,%r14
0aa9    6fc79:	e8 00 00 00 00       	call   6fc7e <__send_ipi_mask_ex+0xaae>	6fc7a: R_X86_64_PLT32	__msan_warning-0x4
0aae    6fc7e:	4c 89 f6             	mov    %r14,%rsi
0ab1    6fc81:	48 89 d8             	mov    %rbx,%rax
0ab4    6fc84:	48 85 c0             	test   %rax,%rax
0ab7    6fc87:	0f 84 ff f9 ff ff    	je     6f68c <__send_ipi_mask_ex+0x4bc>
0abd    6fc8d:	44 89 ef             	mov    %r13d,%edi
0ac0    6fc90:	48 89 f3             	mov    %rsi,%rbx
0ac3    6fc93:	e8 00 00 00 00       	call   6fc98 <__send_ipi_mask_ex+0xac8>	6fc94: R_X86_64_PLT32	__msan_warning-0x4
0ac8    6fc98:	48 89 de             	mov    %rbx,%rsi
0acb    6fc9b:	e9 ec f9 ff ff       	jmp    6f68c <__send_ipi_mask_ex+0x4bc>
0ad0    6fca0:	e8 00 00 00 00       	call   6fca5 <__send_ipi_mask_ex+0xad5>	6fca1: R_X86_64_PLT32	__stack_chk_fail-0x4
0ad5    6fca5:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
0000 000000000006fcc0 <__send_ipi_mask>:
0000    6fcc0:	55                   	push   %rbp
0001    6fcc1:	41 57                	push   %r15
0003    6fcc3:	41 56                	push   %r14
0005    6fcc5:	41 55                	push   %r13
0007    6fcc7:	41 54                	push   %r12
0009    6fcc9:	53                   	push   %rbx
000a    6fcca:	48 83 ec 40          	sub    $0x40,%rsp
000e    6fcce:	89 14 24             	mov    %edx,(%rsp)
0011    6fcd1:	41 89 f5             	mov    %esi,%r13d
0014    6fcd4:	49 89 ff             	mov    %rdi,%r15
0017    6fcd7:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
0020    6fce0:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
0025    6fce5:	e8 00 00 00 00       	call   6fcea <__send_ipi_mask+0x2a>	6fce6: R_X86_64_PLT32	__msan_get_context_state-0x4
002a    6fcea:	48 89 c3             	mov    %rax,%rbx
002d    6fced:	65 8b 05 00 00 00 00 	mov    %gs:0x0(%rip),%eax        # 6fcf4 <__send_ipi_mask+0x34>	6fcf0: R_X86_64_PC32	pcpu_hot+0x8
0034    6fcf4:	89 44 24 08          	mov    %eax,0x8(%rsp)
0038    6fcf8:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
003d    6fcfd:	be 10 00 00 00       	mov    $0x10,%esi
0042    6fd02:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	6fd05: R_X86_64_32S	.rodata+0x22d7
0049    6fd09:	e8 00 00 00 00       	call   6fd0e <__send_ipi_mask+0x4e>	6fd0a: R_X86_64_PLT32	__msan_poison_alloca-0x4
004e    6fd0e:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
0053    6fd13:	65 8b 05 00 00 00 00 	mov    %gs:0x0(%rip),%eax        # 6fd1a <__send_ipi_mask+0x5a>	6fd16: R_X86_64_PC32	pcpu_hot+0x8
005a    6fd1a:	89 c0                	mov    %eax,%eax
005c    6fd1c:	48 0f a3 05 00 00 00 00 	bt     %rax,0x0(%rip)        # 6fd24 <__send_ipi_mask+0x64>	6fd20: R_X86_64_PC32	__cpu_online_mask-0x4
0064    6fd24:	73 0c                	jae    6fd32 <__send_ipi_mask+0x72>
0066    6fd26:	c6 83 20 03 00 00 00 	movb   $0x0,0x320(%rbx)
006d    6fd2d:	e8 00 00 00 00       	call   6fd32 <__send_ipi_mask+0x72>	6fd2e: R_X86_64_PLT32	rcu_is_watching-0x4
0072    6fd32:	4d 8b 27             	mov    (%r15),%r12
0075    6fd35:	4c 89 ff             	mov    %r15,%rdi
0078    6fd38:	e8 00 00 00 00       	call   6fd3d <__send_ipi_mask+0x7d>	6fd39: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
007d    6fd3d:	48 83 38 00          	cmpq   $0x0,(%rax)
0081    6fd41:	0f 85 e0 00 00 00    	jne    6fe27 <__send_ipi_mask+0x167>
0087    6fd47:	4c 89 e7             	mov    %r12,%rdi
008a    6fd4a:	e8 00 00 00 00       	call   6fd4f <__send_ipi_mask+0x8f>	6fd4b: R_X86_64_PLT32	__sw_hweight64-0x4
008f    6fd4f:	48 89 c1             	mov    %rax,%rcx
0092    6fd52:	b0 01                	mov    $0x1,%al
0094    6fd54:	85 c9                	test   %ecx,%ecx
0096    6fd56:	0f 84 c2 00 00 00    	je     6fe1e <__send_ipi_mask+0x15e>
009c    6fd5c:	83 f9 01             	cmp    $0x1,%ecx
009f    6fd5f:	75 1b                	jne    6fd7c <__send_ipi_mask+0xbc>
00a1    6fd61:	80 3c 24 00          	cmpb   $0x0,(%rsp)
00a5    6fd65:	74 15                	je     6fd7c <__send_ipi_mask+0xbc>
00a7    6fd67:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
00ab    6fd6b:	31 d2                	xor    %edx,%edx
00ad    6fd6d:	49 0f a3 0f          	bt     %rcx,(%r15)
00b1    6fd71:	b9 00 00 00 00       	mov    $0x0,%ecx
00b6    6fd76:	0f 82 6c 04 00 00    	jb     701e8 <__send_ipi_mask+0x528>
00bc    6fd7c:	4c 8b 35 00 00 00 00 	mov    0x0(%rip),%r14        # 6fd83 <__send_ipi_mask+0xc3>	6fd7f: R_X86_64_PC32	hv_hypercall_pg-0x4
00c3    6fd83:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	6fd86: R_X86_64_32S	hv_hypercall_pg
00ca    6fd8a:	e8 00 00 00 00       	call   6fd8f <__send_ipi_mask+0xcf>	6fd8b: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
00cf    6fd8f:	48 8b 00             	mov    (%rax),%rax
00d2    6fd92:	48 89 c6             	mov    %rax,%rsi
00d5    6fd95:	48 f7 d6             	not    %rsi
00d8    6fd98:	4d 85 f6             	test   %r14,%r14
00db    6fd9b:	40 0f 94 c7          	sete   %dil
00df    6fd9f:	41 8d 8d 00 ff ff ff 	lea    -0x100(%r13),%ecx
00e6    6fda6:	81 f9 10 ff ff ff    	cmp    $0xffffff10,%ecx
00ec    6fdac:	40 0f 92 c5          	setb   %bpl
00f0    6fdb0:	40 08 fd             	or     %dil,%bpl
00f3    6fdb3:	4c 85 f6             	test   %r14,%rsi
00f6    6fdb6:	75 0d                	jne    6fdc5 <__send_ipi_mask+0x105>
00f8    6fdb8:	81 f9 10 ff ff ff    	cmp    $0xffffff10,%ecx
00fe    6fdbe:	72 05                	jb     6fdc5 <__send_ipi_mask+0x105>
0100    6fdc0:	48 85 c0             	test   %rax,%rax
0103    6fdc3:	75 6e                	jne    6fe33 <__send_ipi_mask+0x173>
0105    6fdc5:	31 d2                	xor    %edx,%edx
0107    6fdc7:	b9 00 00 00 00       	mov    $0x0,%ecx
010c    6fdcc:	b8 00 00 00 00       	mov    $0x0,%eax
0111    6fdd1:	40 84 ed             	test   %bpl,%bpl
0114    6fdd4:	0f 85 0e 04 00 00    	jne    701e8 <__send_ipi_mask+0x528>
011a    6fdda:	4c 89 6c 24 10       	mov    %r13,0x10(%rsp)
011f    6fddf:	4d 8b 37             	mov    (%r15),%r14
0122    6fde2:	4c 89 ff             	mov    %r15,%rdi
0125    6fde5:	e8 00 00 00 00       	call   6fdea <__send_ipi_mask+0x12a>	6fde6: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
012a    6fdea:	4c 8b 28             	mov    (%rax),%r13
012d    6fded:	44 8b 22             	mov    (%rdx),%r12d
0130    6fdf0:	4d 85 ed             	test   %r13,%r13
0133    6fdf3:	74 0b                	je     6fe00 <__send_ipi_mask+0x140>
0135    6fdf5:	4c 89 e8             	mov    %r13,%rax
0138    6fdf8:	48 f7 d0             	not    %rax
013b    6fdfb:	4c 21 f0             	and    %r14,%rax
013e    6fdfe:	74 3c                	je     6fe3c <__send_ipi_mask+0x17c>
0140    6fe00:	4d 85 f6             	test   %r14,%r14
0143    6fe03:	74 44                	je     6fe49 <__send_ipi_mask+0x189>
0145    6fe05:	4d 85 ed             	test   %r13,%r13
0148    6fe08:	0f 85 a9 02 00 00    	jne    700b7 <__send_ipi_mask+0x3f7>
014e    6fe0e:	4c 89 74 24 20       	mov    %r14,0x20(%rsp)
0153    6fe13:	48 0f bd 44 24 20    	bsr    0x20(%rsp),%rax
0159    6fe19:	4c 63 e0             	movslq %eax,%r12
015c    6fe1c:	eb 31                	jmp    6fe4f <__send_ipi_mask+0x18f>
015e    6fe1e:	31 d2                	xor    %edx,%edx
0160    6fe20:	31 c9                	xor    %ecx,%ecx
0162    6fe22:	e9 c1 03 00 00       	jmp    701e8 <__send_ipi_mask+0x528>
0167    6fe27:	8b 3a                	mov    (%rdx),%edi
0169    6fe29:	e8 00 00 00 00       	call   6fe2e <__send_ipi_mask+0x16e>	6fe2a: R_X86_64_PLT32	__msan_warning-0x4
016e    6fe2e:	e9 14 ff ff ff       	jmp    6fd47 <__send_ipi_mask+0x87>
0173    6fe33:	8b 3a                	mov    (%rdx),%edi
0175    6fe35:	e8 00 00 00 00       	call   6fe3a <__send_ipi_mask+0x17a>	6fe36: R_X86_64_PLT32	__msan_warning-0x4
017a    6fe3a:	eb 89                	jmp    6fdc5 <__send_ipi_mask+0x105>
017c    6fe3c:	44 89 e7             	mov    %r12d,%edi
017f    6fe3f:	e8 00 00 00 00       	call   6fe44 <__send_ipi_mask+0x184>	6fe40: R_X86_64_PLT32	__msan_warning-0x4
0184    6fe44:	4d 85 f6             	test   %r14,%r14
0187    6fe47:	75 bc                	jne    6fe05 <__send_ipi_mask+0x145>
0189    6fe49:	41 bc 40 00 00 00    	mov    $0x40,%r12d
018f    6fe4f:	49 c1 e4 02          	shl    $0x2,%r12
0193    6fe53:	4c 03 25 00 00 00 00 	add    0x0(%rip),%r12        # 6fe5a <__send_ipi_mask+0x19a>	6fe56: R_X86_64_PC32	hv_vp_index-0x4
019a    6fe5a:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	6fe5d: R_X86_64_32S	hv_vp_index
01a1    6fe61:	e8 00 00 00 00       	call   6fe66 <__send_ipi_mask+0x1a6>	6fe62: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
01a6    6fe66:	48 83 38 00          	cmpq   $0x0,(%rax)
01aa    6fe6a:	75 40                	jne    6feac <__send_ipi_mask+0x1ec>
01ac    6fe6c:	41 8b 2c 24          	mov    (%r12),%ebp
01b0    6fe70:	4c 89 e7             	mov    %r12,%rdi
01b3    6fe73:	e8 00 00 00 00       	call   6fe78 <__send_ipi_mask+0x1b8>	6fe74: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
01b8    6fe78:	83 38 00             	cmpl   $0x0,(%rax)
01bb    6fe7b:	75 38                	jne    6feb5 <__send_ipi_mask+0x1f5>
01bd    6fe7d:	83 fd 3f             	cmp    $0x3f,%ebp
01c0    6fe80:	7e 3f                	jle    6fec1 <__send_ipi_mask+0x201>
01c2    6fe82:	c6 83 20 03 00 00 00 	movb   $0x0,0x320(%rbx)
01c9    6fe89:	0f b6 14 24          	movzbl (%rsp),%edx
01cd    6fe8d:	4c 89 ff             	mov    %r15,%rdi
01d0    6fe90:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
01d5    6fe95:	e8 36 f3 ff ff       	call   6f1d0 <__send_ipi_mask_ex>
01da    6fe9a:	0f b6 93 20 03 00 00 	movzbl 0x320(%rbx),%edx
01e1    6fea1:	8b 8b a8 0f 00 00    	mov    0xfa8(%rbx),%ecx
01e7    6fea7:	e9 3c 03 00 00       	jmp    701e8 <__send_ipi_mask+0x528>
01ec    6feac:	8b 3a                	mov    (%rdx),%edi
01ee    6feae:	e8 00 00 00 00       	call   6feb3 <__send_ipi_mask+0x1f3>	6feaf: R_X86_64_PLT32	__msan_warning-0x4
01f3    6feb3:	eb b7                	jmp    6fe6c <__send_ipi_mask+0x1ac>
01f5    6feb5:	8b 3a                	mov    (%rdx),%edi
01f7    6feb7:	e8 00 00 00 00       	call   6febc <__send_ipi_mask+0x1fc>	6feb8: R_X86_64_PLT32	__msan_warning-0x4
01fc    6febc:	83 fd 3f             	cmp    $0x3f,%ebp
01ff    6febf:	7f c1                	jg     6fe82 <__send_ipi_mask+0x1c2>
0201    6fec1:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
0206    6fec6:	e8 00 00 00 00       	call   6fecb <__send_ipi_mask+0x20b>	6fec7: R_X86_64_PLT32	__msan_metadata_ptr_for_store_4-0x4
020b    6fecb:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
0211    6fed1:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
0216    6fed6:	89 44 24 28          	mov    %eax,0x28(%rsp)
021a    6feda:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
021f    6fedf:	e8 00 00 00 00       	call   6fee4 <__send_ipi_mask+0x224>	6fee0: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
0224    6fee4:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
022b    6feeb:	48 c7 44 24 30 00 00 00 00 	movq   $0x0,0x30(%rsp)
0234    6fef4:	45 31 ed             	xor    %r13d,%r13d
0237    6fef7:	eb 2d                	jmp    6ff26 <__send_ipi_mask+0x266>
0239    6fef9:	44 89 e7             	mov    %r12d,%edi
023c    6fefc:	e8 00 00 00 00       	call   6ff01 <__send_ipi_mask+0x241>	6fefd: R_X86_64_PLT32	__msan_warning-0x4
0241    6ff01:	41 83 fe 3f          	cmp    $0x3f,%r14d
0245    6ff05:	0f 8f 77 ff ff ff    	jg     6fe82 <__send_ipi_mask+0x1c2>
024b    6ff0b:	44 89 e7             	mov    %r12d,%edi
024e    6ff0e:	e8 00 00 00 00       	call   6ff13 <__send_ipi_mask+0x253>	6ff0f: R_X86_64_PLT32	__msan_warning-0x4
0253    6ff13:	4c 0f ab 74 24 30    	bts    %r14,0x30(%rsp)
0259    6ff19:	41 ff c5             	inc    %r13d
025c    6ff1c:	41 83 fd 40          	cmp    $0x40,%r13d
0260    6ff20:	0f 83 03 01 00 00    	jae    70029 <__send_ipi_mask+0x369>
0266    6ff26:	48 c7 c5 ff ff ff ff 	mov    $0xffffffffffffffff,%rbp
026d    6ff2d:	44 89 e9             	mov    %r13d,%ecx
0270    6ff30:	48 d3 e5             	shl    %cl,%rbp
0273    6ff33:	4d 8b 37             	mov    (%r15),%r14
0276    6ff36:	49 21 ee             	and    %rbp,%r14
0279    6ff39:	4c 89 ff             	mov    %r15,%rdi
027c    6ff3c:	e8 00 00 00 00       	call   6ff41 <__send_ipi_mask+0x281>	6ff3d: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
0281    6ff41:	44 8b 22             	mov    (%rdx),%r12d
0284    6ff44:	48 23 28             	and    (%rax),%rbp
0287    6ff47:	74 0f                	je     6ff58 <__send_ipi_mask+0x298>
0289    6ff49:	48 89 e8             	mov    %rbp,%rax
028c    6ff4c:	48 f7 d0             	not    %rax
028f    6ff4f:	4c 21 f0             	and    %r14,%rax
0292    6ff52:	0f 84 95 00 00 00    	je     6ffed <__send_ipi_mask+0x32d>
0298    6ff58:	4d 85 f6             	test   %r14,%r14
029b    6ff5b:	0f 84 c8 00 00 00    	je     70029 <__send_ipi_mask+0x369>
02a1    6ff61:	48 85 ed             	test   %rbp,%rbp
02a4    6ff64:	0f 85 96 00 00 00    	jne    70000 <__send_ipi_mask+0x340>
02aa    6ff6a:	4c 89 74 24 18       	mov    %r14,0x18(%rsp)
02af    6ff6f:	f3 4c 0f bc 6c 24 18 	tzcnt  0x18(%rsp),%r13
02b6    6ff76:	41 83 fd 3f          	cmp    $0x3f,%r13d
02ba    6ff7a:	0f 87 a9 00 00 00    	ja     70029 <__send_ipi_mask+0x369>
02c0    6ff80:	80 3c 24 00          	cmpb   $0x0,(%rsp)
02c4    6ff84:	74 07                	je     6ff8d <__send_ipi_mask+0x2cd>
02c6    6ff86:	44 39 6c 24 08       	cmp    %r13d,0x8(%rsp)
02cb    6ff8b:	74 8c                	je     6ff19 <__send_ipi_mask+0x259>
02cd    6ff8d:	45 89 ec             	mov    %r13d,%r12d
02d0    6ff90:	49 c1 e4 02          	shl    $0x2,%r12
02d4    6ff94:	4c 03 25 00 00 00 00 	add    0x0(%rip),%r12        # 6ff9b <__send_ipi_mask+0x2db>	6ff97: R_X86_64_PC32	hv_vp_index-0x4
02db    6ff9b:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	6ff9e: R_X86_64_32S	hv_vp_index
02e2    6ffa2:	e8 00 00 00 00       	call   6ffa7 <__send_ipi_mask+0x2e7>	6ffa3: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
02e7    6ffa7:	48 83 38 00          	cmpq   $0x0,(%rax)
02eb    6ffab:	75 73                	jne    70020 <__send_ipi_mask+0x360>
02ed    6ffad:	4d 63 34 24          	movslq (%r12),%r14
02f1    6ffb1:	4c 89 e7             	mov    %r12,%rdi
02f4    6ffb4:	e8 00 00 00 00       	call   6ffb9 <__send_ipi_mask+0x2f9>	6ffb5: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
02f9    6ffb9:	8b 28                	mov    (%rax),%ebp
02fb    6ffbb:	44 8b 22             	mov    (%rdx),%r12d
02fe    6ffbe:	85 ed                	test   %ebp,%ebp
0300    6ffc0:	74 0a                	je     6ffcc <__send_ipi_mask+0x30c>
0302    6ffc2:	89 e8                	mov    %ebp,%eax
0304    6ffc4:	44 09 f0             	or     %r14d,%eax
0307    6ffc7:	83 f8 ff             	cmp    $0xffffffff,%eax
030a    6ffca:	74 41                	je     7000d <__send_ipi_mask+0x34d>
030c    6ffcc:	41 83 fe ff          	cmp    $0xffffffff,%r14d
0310    6ffd0:	0f 84 d6 00 00 00    	je     700ac <__send_ipi_mask+0x3ec>
0316    6ffd6:	85 ed                	test   %ebp,%ebp
0318    6ffd8:	0f 85 1b ff ff ff    	jne    6fef9 <__send_ipi_mask+0x239>
031e    6ffde:	41 83 fe 3f          	cmp    $0x3f,%r14d
0322    6ffe2:	0f 8e 2b ff ff ff    	jle    6ff13 <__send_ipi_mask+0x253>
0328    6ffe8:	e9 95 fe ff ff       	jmp    6fe82 <__send_ipi_mask+0x1c2>
032d    6ffed:	44 89 e7             	mov    %r12d,%edi
0330    6fff0:	e8 00 00 00 00       	call   6fff5 <__send_ipi_mask+0x335>	6fff1: R_X86_64_PLT32	__msan_warning-0x4
0335    6fff5:	4d 85 f6             	test   %r14,%r14
0338    6fff8:	0f 85 63 ff ff ff    	jne    6ff61 <__send_ipi_mask+0x2a1>
033e    6fffe:	eb 29                	jmp    70029 <__send_ipi_mask+0x369>
0340    70000:	44 89 e7             	mov    %r12d,%edi
0343    70003:	e8 00 00 00 00       	call   70008 <__send_ipi_mask+0x348>	70004: R_X86_64_PLT32	__msan_warning-0x4
0348    70008:	e9 5d ff ff ff       	jmp    6ff6a <__send_ipi_mask+0x2aa>
034d    7000d:	44 89 e7             	mov    %r12d,%edi
0350    70010:	e8 00 00 00 00       	call   70015 <__send_ipi_mask+0x355>	70011: R_X86_64_PLT32	__msan_warning-0x4
0355    70015:	41 83 fe ff          	cmp    $0xffffffff,%r14d
0359    70019:	75 bb                	jne    6ffd6 <__send_ipi_mask+0x316>
035b    7001b:	e9 8c 00 00 00       	jmp    700ac <__send_ipi_mask+0x3ec>
0360    70020:	8b 3a                	mov    (%rdx),%edi
0362    70022:	e8 00 00 00 00       	call   70027 <__send_ipi_mask+0x367>	70023: R_X86_64_PLT32	__msan_warning-0x4
0367    70027:	eb 84                	jmp    6ffad <__send_ipi_mask+0x2ed>
0369    70029:	44 8b 74 24 28       	mov    0x28(%rsp),%r14d
036e    7002e:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
0373    70033:	e8 00 00 00 00       	call   70038 <__send_ipi_mask+0x378>	70034: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
0378    70038:	44 8b 28             	mov    (%rax),%r13d
037b    7003b:	8b 2a                	mov    (%rdx),%ebp
037d    7003d:	4c 8b 7c 24 30       	mov    0x30(%rsp),%r15
0382    70042:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
0387    70047:	e8 00 00 00 00       	call   7004c <__send_ipi_mask+0x38c>	70048: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
038c    7004c:	4c 8b 20             	mov    (%rax),%r12
038f    7004f:	8b 02                	mov    (%rdx),%eax
0391    70051:	89 04 24             	mov    %eax,(%rsp)
0394    70054:	c6 83 20 03 00 00 00 	movb   $0x0,0x320(%rbx)
039b    7005b:	e8 00 00 00 00       	call   70060 <__send_ipi_mask+0x3a0>	7005c: R_X86_64_PLT32	hv_isolation_type_tdx-0x4
03a0    70060:	80 bb 20 03 00 00 01 	cmpb   $0x1,0x320(%rbx)
03a7    70067:	74 5b                	je     700c4 <__send_ipi_mask+0x404>
03a9    70069:	84 c0                	test   %al,%al
03ab    7006b:	74 72                	je     700df <__send_ipi_mask+0x41f>
03ad    7006d:	48 c7 83 20 03 00 00 00 00 00 00 	movq   $0x0,0x320(%rbx)
03b8    70078:	45 85 ed             	test   %r13d,%r13d
03bb    7007b:	0f 85 a2 00 00 00    	jne    70123 <__send_ipi_mask+0x463>
03c1    70081:	4d 85 e4             	test   %r12,%r12
03c4    70084:	0f 85 a9 00 00 00    	jne    70133 <__send_ipi_mask+0x473>
03ca    7008a:	bf 0b 00 01 00       	mov    $0x1000b,%edi
03cf    7008f:	4c 89 f6             	mov    %r14,%rsi
03d2    70092:	4c 89 fa             	mov    %r15,%rdx
03d5    70095:	e8 00 00 00 00       	call   7009a <__send_ipi_mask+0x3da>	70096: R_X86_64_PLT32	hv_tdx_hypercall-0x4
03da    7009a:	0f b7 93 20 03 00 00 	movzwl 0x320(%rbx),%edx
03e1    700a1:	8b 8b a8 0f 00 00    	mov    0xfa8(%rbx),%ecx
03e7    700a7:	e9 22 01 00 00       	jmp    701ce <__send_ipi_mask+0x50e>
03ec    700ac:	31 d2                	xor    %edx,%edx
03ee    700ae:	31 c9                	xor    %ecx,%ecx
03f0    700b0:	31 c0                	xor    %eax,%eax
03f2    700b2:	e9 31 01 00 00       	jmp    701e8 <__send_ipi_mask+0x528>
03f7    700b7:	44 89 e7             	mov    %r12d,%edi
03fa    700ba:	e8 00 00 00 00       	call   700bf <__send_ipi_mask+0x3ff>	700bb: R_X86_64_PLT32	__msan_warning-0x4
03ff    700bf:	e9 4a fd ff ff       	jmp    6fe0e <__send_ipi_mask+0x14e>
0404    700c4:	8b bb a8 0f 00 00    	mov    0xfa8(%rbx),%edi
040a    700ca:	89 6c 24 04          	mov    %ebp,0x4(%rsp)
040e    700ce:	89 c5                	mov    %eax,%ebp
0410    700d0:	e8 00 00 00 00       	call   700d5 <__send_ipi_mask+0x415>	700d1: R_X86_64_PLT32	__msan_warning-0x4
0415    700d5:	89 e8                	mov    %ebp,%eax
0417    700d7:	8b 6c 24 04          	mov    0x4(%rsp),%ebp
041b    700db:	84 c0                	test   %al,%al
041d    700dd:	75 8e                	jne    7006d <__send_ipi_mask+0x3ad>
041f    700df:	c6 83 20 03 00 00 00 	movb   $0x0,0x320(%rbx)
0426    700e6:	e8 00 00 00 00       	call   700eb <__send_ipi_mask+0x42b>	700e7: R_X86_64_PLT32	hv_isolation_type_en_snp-0x4
042b    700eb:	48 89 e1             	mov    %rsp,%rcx
042e    700ee:	80 bb 20 03 00 00 01 	cmpb   $0x1,0x320(%rbx)
0435    700f5:	74 49                	je     70140 <__send_ipi_mask+0x480>
0437    700f7:	84 c0                	test   %al,%al
0439    700f9:	74 6b                	je     70166 <__send_ipi_mask+0x4a6>
043b    700fb:	4d 85 e4             	test   %r12,%r12
043e    700fe:	0f 85 17 01 00 00    	jne    7021b <__send_ipi_mask+0x55b>
0444    70104:	45 85 ed             	test   %r13d,%r13d
0447    70107:	0f 85 25 01 00 00    	jne    70232 <__send_ipi_mask+0x572>
044d    7010d:	48 89 cc             	mov    %rcx,%rsp
0450    70110:	b9 0b 00 01 00       	mov    $0x1000b,%ecx
0455    70115:	4c 89 f2             	mov    %r14,%rdx
0458    70118:	4d 89 f8             	mov    %r15,%r8
045b    7011b:	0f 01 d9             	vmmcall
045e    7011e:	e9 a1 00 00 00       	jmp    701c4 <__send_ipi_mask+0x504>
0463    70123:	89 ef                	mov    %ebp,%edi
0465    70125:	e8 00 00 00 00       	call   7012a <__send_ipi_mask+0x46a>	70126: R_X86_64_PLT32	__msan_warning-0x4
046a    7012a:	4d 85 e4             	test   %r12,%r12
046d    7012d:	0f 84 57 ff ff ff    	je     7008a <__send_ipi_mask+0x3ca>
0473    70133:	8b 3c 24             	mov    (%rsp),%edi
0476    70136:	e8 00 00 00 00       	call   7013b <__send_ipi_mask+0x47b>	70137: R_X86_64_PLT32	__msan_warning-0x4
047b    7013b:	e9 4a ff ff ff       	jmp    7008a <__send_ipi_mask+0x3ca>
0480    70140:	8b bb a8 0f 00 00    	mov    0xfa8(%rbx),%edi
0486    70146:	89 6c 24 04          	mov    %ebp,0x4(%rsp)
048a    7014a:	88 44 24 08          	mov    %al,0x8(%rsp)
048e    7014e:	48 89 cd             	mov    %rcx,%rbp
0491    70151:	e8 00 00 00 00       	call   70156 <__send_ipi_mask+0x496>	70152: R_X86_64_PLT32	__msan_warning-0x4
0496    70156:	48 89 e9             	mov    %rbp,%rcx
0499    70159:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
049e    7015e:	8b 6c 24 04          	mov    0x4(%rsp),%ebp
04a2    70162:	84 c0                	test   %al,%al
04a4    70164:	75 95                	jne    700fb <__send_ipi_mask+0x43b>
04a6    70166:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
04ab    7016b:	89 6c 24 04          	mov    %ebp,0x4(%rsp)
04af    7016f:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 70176 <__send_ipi_mask+0x4b6>	70172: R_X86_64_PC32	hv_hypercall_pg-0x4
04b6    70176:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
04bb    7017b:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	7017e: R_X86_64_32S	hv_hypercall_pg
04c2    70182:	e8 00 00 00 00       	call   70187 <__send_ipi_mask+0x4c7>	70183: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
04c7    70187:	48 8b 28             	mov    (%rax),%rbp
04ca    7018a:	8b 3a                	mov    (%rdx),%edi
04cc    7018c:	4d 85 e4             	test   %r12,%r12
04cf    7018f:	0f 85 af 00 00 00    	jne    70244 <__send_ipi_mask+0x584>
04d5    70195:	48 85 ed             	test   %rbp,%rbp
04d8    70198:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
04dd    7019d:	0f 85 b4 00 00 00    	jne    70257 <__send_ipi_mask+0x597>
04e3    701a3:	45 85 ed             	test   %r13d,%r13d
04e6    701a6:	0f 85 be 00 00 00    	jne    7026a <__send_ipi_mask+0x5aa>
04ec    701ac:	48 89 c4             	mov    %rax,%rsp
04ef    701af:	b9 0b 00 01 00       	mov    $0x1000b,%ecx
04f4    701b4:	4c 89 f2             	mov    %r14,%rdx
04f7    701b7:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
04fc    701bc:	4d 89 f8             	mov    %r15,%r8
04ff    701bf:	ff d0                	call   *%rax
0501    701c1:	90                   	nop
0502    701c2:	90                   	nop
0503    701c3:	90                   	nop
0504    701c4:	48 89 e1             	mov    %rsp,%rcx
0507    701c7:	48 89 cc             	mov    %rcx,%rsp
050a    701ca:	31 d2                	xor    %edx,%edx
050c    701cc:	31 c9                	xor    %ecx,%ecx
050e    701ce:	0f b7 c0             	movzwl %ax,%eax
0511    701d1:	48 85 d2             	test   %rdx,%rdx
0514    701d4:	40 0f 95 c6          	setne  %sil
0518    701d8:	f7 d2                	not    %edx
051a    701da:	85 d0                	test   %edx,%eax
051c    701dc:	0f 94 c2             	sete   %dl
051f    701df:	40 20 f2             	and    %sil,%dl
0522    701e2:	48 85 c0             	test   %rax,%rax
0525    701e5:	0f 94 c0             	sete   %al
0528    701e8:	80 e2 01             	and    $0x1,%dl
052b    701eb:	88 93 20 03 00 00    	mov    %dl,0x320(%rbx)
0531    701f1:	89 8b a8 0f 00 00    	mov    %ecx,0xfa8(%rbx)
0537    701f7:	65 48 8b 0c 25 28 00 00 00 	mov    %gs:0x28,%rcx
0540    70200:	48 3b 4c 24 38       	cmp    0x38(%rsp),%rcx
0545    70205:	75 76                	jne    7027d <__send_ipi_mask+0x5bd>
0547    70207:	48 83 c4 40          	add    $0x40,%rsp
054b    7020b:	5b                   	pop    %rbx
054c    7020c:	41 5c                	pop    %r12
054e    7020e:	41 5d                	pop    %r13
0550    70210:	41 5e                	pop    %r14
0552    70212:	41 5f                	pop    %r15
0554    70214:	5d                   	pop    %rbp
0555    70215:	2e e9 00 00 00 00    	cs jmp 7021b <__send_ipi_mask+0x55b>	70217: R_X86_64_PLT32	__x86_return_thunk-0x4
055b    7021b:	8b 3c 24             	mov    (%rsp),%edi
055e    7021e:	49 89 cc             	mov    %rcx,%r12
0561    70221:	e8 00 00 00 00       	call   70226 <__send_ipi_mask+0x566>	70222: R_X86_64_PLT32	__msan_warning-0x4
0566    70226:	4c 89 e1             	mov    %r12,%rcx
0569    70229:	45 85 ed             	test   %r13d,%r13d
056c    7022c:	0f 84 db fe ff ff    	je     7010d <__send_ipi_mask+0x44d>
0572    70232:	89 ef                	mov    %ebp,%edi
0574    70234:	49 89 cc             	mov    %rcx,%r12
0577    70237:	e8 00 00 00 00       	call   7023c <__send_ipi_mask+0x57c>	70238: R_X86_64_PLT32	__msan_warning-0x4
057c    7023c:	4c 89 e1             	mov    %r12,%rcx
057f    7023f:	e9 c9 fe ff ff       	jmp    7010d <__send_ipi_mask+0x44d>
0584    70244:	41 89 fc             	mov    %edi,%r12d
0587    70247:	8b 3c 24             	mov    (%rsp),%edi
058a    7024a:	e8 00 00 00 00       	call   7024f <__send_ipi_mask+0x58f>	7024b: R_X86_64_PLT32	__msan_warning-0x4
058f    7024f:	44 89 e7             	mov    %r12d,%edi
0592    70252:	e9 3e ff ff ff       	jmp    70195 <__send_ipi_mask+0x4d5>
0597    70257:	e8 00 00 00 00       	call   7025c <__send_ipi_mask+0x59c>	70258: R_X86_64_PLT32	__msan_warning-0x4
059c    7025c:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
05a1    70261:	45 85 ed             	test   %r13d,%r13d
05a4    70264:	0f 84 42 ff ff ff    	je     701ac <__send_ipi_mask+0x4ec>
05aa    7026a:	8b 7c 24 04          	mov    0x4(%rsp),%edi
05ae    7026e:	e8 00 00 00 00       	call   70273 <__send_ipi_mask+0x5b3>	7026f: R_X86_64_PLT32	__msan_warning-0x4
05b3    70273:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
05b8    70278:	e9 2f ff ff ff       	jmp    701ac <__send_ipi_mask+0x4ec>
05bd    7027d:	e8 00 00 00 00       	call   70282 <__send_ipi_mask+0x5c2>	7027e: R_X86_64_PLT32	__stack_chk_fail-0x4
05c2    70282:	f3 0f 1e fa          	endbr64
05c6    70286:	65 8b 05 00 00 00 00 	mov    %gs:0x0(%rip),%eax        # 7028d <__send_ipi_mask+0x5cd>	70289: R_X86_64_PC32	pcpu_hot+0x8
05cd    7028d:	89 c0                	mov    %eax,%eax
05cf    7028f:	48 0f a3 05 00 00 00 00 	bt     %rax,0x0(%rip)        # 70297 <__send_ipi_mask+0x5d7>	70293: R_X86_64_PC32	__cpu_online_mask-0x4
05d7    70297:	0f 83 95 fa ff ff    	jae    6fd32 <__send_ipi_mask+0x72>
05dd    7029d:	4c 89 ed             	mov    %r13,%rbp
05e0    702a0:	be 04 00 00 00       	mov    $0x4,%esi
05e5    702a5:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	702a8: R_X86_64_32S	pcpu_hot+0x8
05ec    702ac:	e8 00 00 00 00       	call   702b1 <__send_ipi_mask+0x5f1>	702ad: R_X86_64_PLT32	__msan_instrument_asm_store-0x4
05f1    702b1:	65 ff 05 00 00 00 00 	incl   %gs:0x0(%rip)        # 702b8 <__send_ipi_mask+0x5f8>	702b4: R_X86_64_PC32	pcpu_hot+0x4
05f8    702b8:	4c 8b 25 00 00 00 00 	mov    0x0(%rip),%r12        # 702bf <__send_ipi_mask+0x5ff>	702bb: R_X86_64_PC32	__tracepoint_hyperv_send_ipi_mask+0x44
05ff    702bf:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	702c2: R_X86_64_32S	__tracepoint_hyperv_send_ipi_mask+0x48
0606    702c6:	e8 00 00 00 00       	call   702cb <__send_ipi_mask+0x60b>	702c7: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
060b    702cb:	4c 8b 30             	mov    (%rax),%r14
060e    702ce:	44 8b 2a             	mov    (%rdx),%r13d
0611    702d1:	4d 85 f6             	test   %r14,%r14
0614    702d4:	74 0b                	je     702e1 <__send_ipi_mask+0x621>
0616    702d6:	4c 89 f0             	mov    %r14,%rax
0619    702d9:	48 f7 d0             	not    %rax
061c    702dc:	4c 21 e0             	and    %r12,%rax
061f    702df:	74 59                	je     7033a <__send_ipi_mask+0x67a>
0621    702e1:	4d 85 e4             	test   %r12,%r12
0624    702e4:	74 34                	je     7031a <__send_ipi_mask+0x65a>
0626    702e6:	49 83 c4 08          	add    $0x8,%r12
062a    702ea:	4d 85 f6             	test   %r14,%r14
062d    702ed:	75 5a                	jne    70349 <__send_ipi_mask+0x689>
062f    702ef:	4d 8b 2c 24          	mov    (%r12),%r13
0633    702f3:	4c 89 e7             	mov    %r12,%rdi
0636    702f6:	e8 00 00 00 00       	call   702fb <__send_ipi_mask+0x63b>	702f7: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
063b    702fb:	8b 3a                	mov    (%rdx),%edi
063d    702fd:	48 83 38 00          	cmpq   $0x0,(%rax)
0641    70301:	c7 83 20 03 00 00 00 00 00 00 	movl   $0x0,0x320(%rbx)
064b    7030b:	75 46                	jne    70353 <__send_ipi_mask+0x693>
064d    7030d:	4c 89 ef             	mov    %r13,%rdi
0650    70310:	4c 89 fe             	mov    %r15,%rsi
0653    70313:	89 ea                	mov    %ebp,%edx
0655    70315:	e8 00 00 00 00       	call   7031a <__send_ipi_mask+0x65a>	70316: R_X86_64_PLT32	__SCT__tp_func_hyperv_send_ipi_mask-0x4
065a    7031a:	be 04 00 00 00       	mov    $0x4,%esi
065f    7031f:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	70322: R_X86_64_32S	pcpu_hot+0x8
0666    70326:	e8 00 00 00 00       	call   7032b <__send_ipi_mask+0x66b>	70327: R_X86_64_PLT32	__msan_instrument_asm_store-0x4
066b    7032b:	65 ff 0d 00 00 00 00 	decl   %gs:0x0(%rip)        # 70332 <__send_ipi_mask+0x672>	7032e: R_X86_64_PC32	pcpu_hot+0x4
0672    70332:	49 89 ed             	mov    %rbp,%r13
0675    70335:	e9 d9 f9 ff ff       	jmp    6fd13 <__send_ipi_mask+0x53>
067a    7033a:	44 89 ef             	mov    %r13d,%edi
067d    7033d:	e8 00 00 00 00       	call   70342 <__send_ipi_mask+0x682>	7033e: R_X86_64_PLT32	__msan_warning-0x4
0682    70342:	4d 85 e4             	test   %r12,%r12
0685    70345:	75 9f                	jne    702e6 <__send_ipi_mask+0x626>
0687    70347:	eb d1                	jmp    7031a <__send_ipi_mask+0x65a>
0689    70349:	44 89 ef             	mov    %r13d,%edi
068c    7034c:	e8 00 00 00 00       	call   70351 <__send_ipi_mask+0x691>	7034d: R_X86_64_PLT32	__msan_warning-0x4
0691    70351:	eb 9c                	jmp    702ef <__send_ipi_mask+0x62f>
0693    70353:	e8 00 00 00 00       	call   70358 <__send_ipi_mask+0x698>	70354: R_X86_64_PLT32	__msan_warning-0x4
0698    70358:	eb b3                	jmp    7030d <__send_ipi_mask+0x64d>
069a    7035a:	cc                   	int3
069b    7035b:	cc                   	int3
069c    7035c:	cc                   	int3
069d    7035d:	cc                   	int3
069e    7035e:	cc                   	int3
069f    7035f:	cc                   	int3
0000 0000000000129820 <__send_ipi_mask>:
0000   129820:	55                   	push   %rbp
0001   129821:	48 89 e5             	mov    %rsp,%rbp
0004   129824:	41 57                	push   %r15
0006   129826:	41 56                	push   %r14
0008   129828:	41 55                	push   %r13
000a   12982a:	41 54                	push   %r12
000c   12982c:	53                   	push   %rbx
000d   12982d:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
0011   129831:	48 81 ec c0 00 00 00 	sub    $0xc0,%rsp
0018   129838:	89 f3                	mov    %esi,%ebx
001a   12983a:	49 89 ff             	mov    %rdi,%r15
001d   12983d:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
0026   129846:	48 89 84 24 b0 00 00 00 	mov    %rax,0xb0(%rsp)
002e   12984e:	e8 00 00 00 00       	call   129853 <__send_ipi_mask+0x33>	12984f: R_X86_64_PLT32	__msan_get_context_state-0x4
0033   129853:	4c 8d b4 24 90 00 00 00 	lea    0x90(%rsp),%r14
003b   12985b:	be 10 00 00 00       	mov    $0x10,%esi
0040   129860:	4c 89 f7             	mov    %r14,%rdi
0043   129863:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	129866: R_X86_64_32S	.rodata+0x921b
004a   12986a:	e8 00 00 00 00       	call   12986f <__send_ipi_mask+0x4f>	12986b: R_X86_64_PLT32	__msan_poison_alloca-0x4
004f   12986f:	be 10 00 00 00       	mov    $0x10,%esi
0054   129874:	4c 89 f7             	mov    %r14,%rdi
0057   129877:	e8 00 00 00 00       	call   12987c <__send_ipi_mask+0x5c>	129878: R_X86_64_PLT32	__msan_metadata_ptr_for_store_n-0x4
005c   12987c:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
0063   129883:	48 c7 40 08 00 00 00 00 	movq   $0x0,0x8(%rax)
006b   12988b:	48 c7 84 24 90 00 00 00 00 00 00 00 	movq   $0x0,0x90(%rsp)
0077   129897:	48 c7 84 24 98 00 00 00 00 00 00 00 	movq   $0x0,0x98(%rsp)
0083   1298a3:	4d 8b 37             	mov    (%r15),%r14
0086   1298a6:	4c 89 bc 24 80 00 00 00 	mov    %r15,0x80(%rsp)
008e   1298ae:	4c 89 ff             	mov    %r15,%rdi
0091   1298b1:	e8 00 00 00 00       	call   1298b6 <__send_ipi_mask+0x96>	1298b2: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
0096   1298b6:	48 8b 00             	mov    (%rax),%rax
0099   1298b9:	48 85 c0             	test   %rax,%rax
009c   1298bc:	74 0c                	je     1298ca <__send_ipi_mask+0xaa>
009e   1298be:	48 f7 d0             	not    %rax
00a1   1298c1:	4c 21 f0             	and    %r14,%rax
00a4   1298c4:	0f 84 3d 07 00 00    	je     12a007 <__send_ipi_mask+0x7e7>
00aa   1298ca:	4d 85 f6             	test   %r14,%r14
00ad   1298cd:	0f 84 09 07 00 00    	je     129fdc <__send_ipi_mask+0x7bc>
00b3   1298d3:	4c 8d b4 24 a8 00 00 00 	lea    0xa8(%rsp),%r14
00bb   1298db:	be 08 00 00 00       	mov    $0x8,%esi
00c0   1298e0:	4c 89 f7             	mov    %r14,%rdi
00c3   1298e3:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	1298e6: R_X86_64_32S	.rodata+0x9226
00ca   1298ea:	e8 00 00 00 00       	call   1298ef <__send_ipi_mask+0xcf>	1298eb: R_X86_64_PLT32	__msan_poison_alloca-0x4
00cf   1298ef:	be 08 00 00 00       	mov    $0x8,%esi
00d4   1298f4:	4c 89 f7             	mov    %r14,%rdi
00d7   1298f7:	e8 00 00 00 00       	call   1298fc <__send_ipi_mask+0xdc>	1298f8: R_X86_64_PLT32	__msan_instrument_asm_store-0x4
00dc   1298fc:	9c                   	pushf
00dd   1298fd:	8f 84 24 a8 00 00 00 	pop    0xa8(%rsp)
00e4   129904:	4c 8b bc 24 a8 00 00 00 	mov    0xa8(%rsp),%r15
00ec   12990c:	4c 89 f7             	mov    %r14,%rdi
00ef   12990f:	e8 00 00 00 00       	call   129914 <__send_ipi_mask+0xf4>	129910: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
00f4   129914:	8b 00                	mov    (%rax),%eax
00f6   129916:	89 c1                	mov    %eax,%ecx
00f8   129918:	f7 d1                	not    %ecx
00fa   12991a:	8b 12                	mov    (%rdx),%edx
00fc   12991c:	89 54 24 3c          	mov    %edx,0x3c(%rsp)
0100   129920:	fa                   	cli
0101   129921:	41 81 e7 00 02 00 00 	and    $0x200,%r15d
0108   129928:	c1 e8 09             	shr    $0x9,%eax
010b   12992b:	81 c9 ff fd ff ff    	or     $0xfffffdff,%ecx
0111   129931:	41 85 cf             	test   %ecx,%r15d
0114   129934:	0f 94 c1             	sete   %cl
0117   129937:	20 c1                	and    %al,%cl
0119   129939:	88 4c 24 0b          	mov    %cl,0xb(%rsp)
011d   12993d:	80 f9 01             	cmp    $0x1,%cl
0120   129940:	0f 84 11 07 00 00    	je     12a057 <__send_ipi_mask+0x837>
0126   129946:	4c 89 7c 24 78       	mov    %r15,0x78(%rsp)
012b   12994b:	4d 85 ff             	test   %r15,%r15
012e   12994e:	74 05                	je     129955 <__send_ipi_mask+0x135>
0130   129950:	e8 00 00 00 00       	call   129955 <__send_ipi_mask+0x135>	129951: R_X86_64_PLT32	trace_hardirqs_off-0x4
0135   129955:	83 fb 02             	cmp    $0x2,%ebx
0138   129958:	b8 00 04 00 00       	mov    $0x400,%eax
013d   12995d:	0f 45 c3             	cmovne %ebx,%eax
0140   129960:	48 98                	cltq
0142   129962:	48 89 44 24 68       	mov    %rax,0x68(%rsp)
0147   129967:	4c 8d ac 24 90 00 00 00 	lea    0x90(%rsp),%r13
014f   12996f:	45 31 f6             	xor    %r14d,%r14d
0152   129972:	c7 44 24 1c 00 00 00 00 	movl   $0x0,0x1c(%rsp)
015a   12997a:	c7 44 24 18 00 00 00 00 	movl   $0x0,0x18(%rsp)
0162   129982:	31 c0                	xor    %eax,%eax
0164   129984:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
0169   129989:	c7 44 24 4c 00 00 00 00 	movl   $0x0,0x4c(%rsp)
0171   129991:	c7 44 24 48 00 00 00 00 	movl   $0x0,0x48(%rsp)
0179   129999:	c7 44 24 2c 00 00 00 00 	movl   $0x0,0x2c(%rsp)
0181   1299a1:	49 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%r15
0188   1299a8:	44 89 f1             	mov    %r14d,%ecx
018b   1299ab:	49 d3 e7             	shl    %cl,%r15
018e   1299ae:	48 8b bc 24 80 00 00 00 	mov    0x80(%rsp),%rdi
0196   1299b6:	4c 8b 37             	mov    (%rdi),%r14
0199   1299b9:	4d 21 fe             	and    %r15,%r14
019c   1299bc:	e8 00 00 00 00       	call   1299c1 <__send_ipi_mask+0x1a1>	1299bd: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
01a1   1299c1:	8b 1a                	mov    (%rdx),%ebx
01a3   1299c3:	4c 23 38             	and    (%rax),%r15
01a6   1299c6:	74 0f                	je     1299d7 <__send_ipi_mask+0x1b7>
01a8   1299c8:	4c 89 f8             	mov    %r15,%rax
01ab   1299cb:	48 f7 d0             	not    %rax
01ae   1299ce:	4c 21 f0             	and    %r14,%rax
01b1   1299d1:	0f 84 41 02 00 00    	je     129c18 <__send_ipi_mask+0x3f8>
01b7   1299d7:	4d 85 f6             	test   %r14,%r14
01ba   1299da:	0f 84 d2 04 00 00    	je     129eb2 <__send_ipi_mask+0x692>
01c0   1299e0:	4d 85 ff             	test   %r15,%r15
01c3   1299e3:	0f 85 44 02 00 00    	jne    129c2d <__send_ipi_mask+0x40d>
01c9   1299e9:	4c 89 b4 24 88 00 00 00 	mov    %r14,0x88(%rsp)
01d1   1299f1:	f3 4c 0f bc b4 24 88 00 00 00 	tzcnt  0x88(%rsp),%r14
01db   1299fb:	41 f7 c6 c0 ff ff ff 	test   $0xffffffc0,%r14d
01e2   129a02:	0f 85 aa 04 00 00    	jne    129eb2 <__send_ipi_mask+0x692>
01e8   129a08:	44 89 f0             	mov    %r14d,%eax
01eb   129a0b:	83 e0 3f             	and    $0x3f,%eax
01ee   129a0e:	48 8d 3c c5 00 00 00 00 	lea    0x0(,%rax,8),%rdi	129a12: R_X86_64_32S	__per_cpu_offset
01f6   129a16:	48 8b 1c c5 00 00 00 00 	mov    0x0(,%rax,8),%rbx	129a1a: R_X86_64_32S	__per_cpu_offset
01fe   129a1e:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	129a21: R_X86_64_32S	x86_cpu_to_apicid
0205   129a25:	48 01 c3             	add    %rax,%rbx
0208   129a28:	e8 00 00 00 00       	call   129a2d <__send_ipi_mask+0x20d>	129a29: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
020d   129a2d:	48 83 38 00          	cmpq   $0x0,(%rax)
0211   129a31:	0f 85 21 02 00 00    	jne    129c58 <__send_ipi_mask+0x438>
0217   129a37:	0f b7 03             	movzwl (%rbx),%eax
021a   129a3a:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
021f   129a3f:	48 89 df             	mov    %rbx,%rdi
0222   129a42:	e8 00 00 00 00       	call   129a47 <__send_ipi_mask+0x227>	129a43: R_X86_64_PLT32	__msan_metadata_ptr_for_load_2-0x4
0227   129a47:	0f b7 00             	movzwl (%rax),%eax
022a   129a4a:	89 44 24 0c          	mov    %eax,0xc(%rsp)
022e   129a4e:	8b 1a                	mov    (%rdx),%ebx
0230   129a50:	4c 8b a4 24 90 00 00 00 	mov    0x90(%rsp),%r12
0238   129a58:	4c 8b bc 24 98 00 00 00 	mov    0x98(%rsp),%r15
0240   129a60:	be 10 00 00 00       	mov    $0x10,%esi
0245   129a65:	4c 89 ef             	mov    %r13,%rdi
0248   129a68:	e8 00 00 00 00       	call   129a6d <__send_ipi_mask+0x24d>	129a69: R_X86_64_PLT32	__msan_metadata_ptr_for_load_n-0x4
024d   129a6d:	48 8b 08             	mov    (%rax),%rcx
0250   129a70:	4c 8b 40 08          	mov    0x8(%rax),%r8
0254   129a74:	8b 3a                	mov    (%rdx),%edi
0256   129a76:	48 89 4c 24 60       	mov    %rcx,0x60(%rsp)
025b   129a7b:	48 89 c8             	mov    %rcx,%rax
025e   129a7e:	4c 09 c0             	or     %r8,%rax
0261   129a81:	4c 89 64 24 58       	mov    %r12,0x58(%rsp)
0266   129a86:	74 1d                	je     129aa5 <__send_ipi_mask+0x285>
0268   129a88:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
026d   129a8d:	48 f7 d0             	not    %rax
0270   129a90:	4c 89 c1             	mov    %r8,%rcx
0273   129a93:	48 f7 d1             	not    %rcx
0276   129a96:	4c 21 f9             	and    %r15,%rcx
0279   129a99:	4c 21 e0             	and    %r12,%rax
027c   129a9c:	48 09 c8             	or     %rcx,%rax
027f   129a9f:	0f 84 94 01 00 00    	je     129c39 <__send_ipi_mask+0x419>
0285   129aa5:	4c 89 e0             	mov    %r12,%rax
0288   129aa8:	4c 89 7c 24 70       	mov    %r15,0x70(%rsp)
028d   129aad:	4c 09 f8             	or     %r15,%rax
0290   129ab0:	8b 74 24 0c          	mov    0xc(%rsp),%esi
0294   129ab4:	41 89 f7             	mov    %esi,%r15d
0297   129ab7:	41 89 db             	mov    %ebx,%r11d
029a   129aba:	48 8b 54 24 30       	mov    0x30(%rsp),%rdx
029f   129abf:	41 89 d4             	mov    %edx,%r12d
02a2   129ac2:	89 f1                	mov    %esi,%ecx
02a4   129ac4:	41 89 d9             	mov    %ebx,%r9d
02a7   129ac7:	89 d0                	mov    %edx,%eax
02a9   129ac9:	0f 84 28 03 00 00    	je     129df7 <__send_ipi_mask+0x5d7>
02af   129acf:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
02b4   129ad4:	41 89 c4             	mov    %eax,%r12d
02b7   129ad7:	41 29 d4             	sub    %edx,%r12d
02ba   129ada:	41 0f 9f c5          	setg   %r13b
02be   129ade:	85 f6                	test   %esi,%esi
02c0   129ae0:	41 89 d9             	mov    %ebx,%r9d
02c3   129ae3:	44 0f 44 4c 24 18    	cmove  0x18(%rsp),%r9d
02c9   129ae9:	89 5c 24 44          	mov    %ebx,0x44(%rsp)
02cd   129aed:	41 89 db             	mov    %ebx,%r11d
02d0   129af0:	44 0f 44 5c 24 48    	cmove  0x48(%rsp),%r11d
02d6   129af6:	8b 44 24 2c          	mov    0x2c(%rsp),%eax
02da   129afa:	29 d0                	sub    %edx,%eax
02dc   129afc:	44 8b 7c 24 4c       	mov    0x4c(%rsp),%r15d
02e1   129b01:	41 09 f7             	or     %esi,%r15d
02e4   129b04:	0f 95 c1             	setne  %cl
02e7   129b07:	3d 80 00 00 00       	cmp    $0x80,%eax
02ec   129b0c:	0f 9c c3             	setl   %bl
02ef   129b0f:	44 89 e8             	mov    %r13d,%eax
02f2   129b12:	20 c8                	and    %cl,%al
02f4   129b14:	08 d9                	or     %bl,%cl
02f6   129b16:	44 8b 54 24 1c       	mov    0x1c(%rsp),%r10d
02fb   129b1b:	41 09 f2             	or     %esi,%r10d
02fe   129b1e:	44 89 54 24 28       	mov    %r10d,0x28(%rsp)
0303   129b23:	0f b6 c0             	movzbl %al,%eax
0306   129b26:	0f b6 c9             	movzbl %cl,%ecx
0309   129b29:	0f 44 c8             	cmove  %eax,%ecx
030c   129b2c:	80 f9 01             	cmp    $0x1,%cl
030f   129b2f:	0f 84 2f 01 00 00    	je     129c64 <__send_ipi_mask+0x444>
0315   129b35:	41 20 dd             	and    %bl,%r13b
0318   129b38:	0f 84 79 01 00 00    	je     129cb7 <__send_ipi_mask+0x497>
031e   129b3e:	44 89 4c 24 40       	mov    %r9d,0x40(%rsp)
0323   129b43:	89 7c 24 24          	mov    %edi,0x24(%rsp)
0327   129b47:	48 8b 54 24 58       	mov    0x58(%rsp),%rdx
032c   129b4c:	48 89 d0             	mov    %rdx,%rax
032f   129b4f:	44 89 e1             	mov    %r12d,%ecx
0332   129b52:	48 d3 e0             	shl    %cl,%rax
0335   129b55:	41 f6 c4 40          	test   $0x40,%r12b
0339   129b59:	48 89 c1             	mov    %rax,%rcx
033c   129b5c:	be 00 00 00 00       	mov    $0x0,%esi
0341   129b61:	48 0f 45 ce          	cmovne %rsi,%rcx
0345   129b65:	48 89 4c 24 10       	mov    %rcx,0x10(%rsp)
034a   129b6a:	44 89 e1             	mov    %r12d,%ecx
034d   129b6d:	48 8b 5c 24 70       	mov    0x70(%rsp),%rbx
0352   129b72:	48 0f a5 d3          	shld   %cl,%rdx,%rbx
0356   129b76:	41 f6 c4 40          	test   $0x40,%r12b
035a   129b7a:	48 0f 45 d8          	cmovne %rax,%rbx
035e   129b7e:	48 8b 7c 24 60       	mov    0x60(%rsp),%rdi
0363   129b83:	48 89 f8             	mov    %rdi,%rax
0366   129b86:	48 d3 e0             	shl    %cl,%rax
0369   129b89:	41 f6 c4 40          	test   $0x40,%r12b
036d   129b8d:	48 89 c2             	mov    %rax,%rdx
0370   129b90:	48 0f 45 d6          	cmovne %rsi,%rdx
0374   129b94:	49 0f a5 f8          	shld   %cl,%rdi,%r8
0378   129b98:	41 f6 c4 40          	test   $0x40,%r12b
037c   129b9c:	4c 0f 45 c0          	cmovne %rax,%r8
0380   129ba0:	8b 44 24 28          	mov    0x28(%rsp),%eax
0384   129ba4:	f7 d8                	neg    %eax
0386   129ba6:	41 bf 00 00 00 00    	mov    $0x0,%r15d
038c   129bac:	4d 19 ff             	sbb    %r15,%r15
038f   129baf:	4d 09 f8             	or     %r15,%r8
0392   129bb2:	49 09 d7             	or     %rdx,%r15
0395   129bb5:	be 10 00 00 00       	mov    $0x10,%esi
039a   129bba:	4c 8d ac 24 90 00 00 00 	lea    0x90(%rsp),%r13
03a2   129bc2:	4c 89 ef             	mov    %r13,%rdi
03a5   129bc5:	4d 89 c4             	mov    %r8,%r12
03a8   129bc8:	e8 00 00 00 00       	call   129bcd <__send_ipi_mask+0x3ad>	129bc9: R_X86_64_PLT32	__msan_metadata_ptr_for_store_n-0x4
03ad   129bcd:	4c 89 60 08          	mov    %r12,0x8(%rax)
03b1   129bd1:	4c 89 38             	mov    %r15,(%rax)
03b4   129bd4:	4d 09 e7             	or     %r12,%r15
03b7   129bd7:	0f 85 2a 01 00 00    	jne    129d07 <__send_ipi_mask+0x4e7>
03bd   129bdd:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
03c2   129be2:	48 89 84 24 90 00 00 00 	mov    %rax,0x90(%rsp)
03ca   129bea:	48 89 9c 24 98 00 00 00 	mov    %rbx,0x98(%rsp)
03d2   129bf2:	44 8b 7c 24 4c       	mov    0x4c(%rsp),%r15d
03d7   129bf7:	44 8b 5c 24 48       	mov    0x48(%rsp),%r11d
03dc   129bfc:	44 8b 64 24 2c       	mov    0x2c(%rsp),%r12d
03e1   129c01:	8b 74 24 0c          	mov    0xc(%rsp),%esi
03e5   129c05:	89 f1                	mov    %esi,%ecx
03e7   129c07:	8b 5c 24 44          	mov    0x44(%rsp),%ebx
03eb   129c0b:	41 89 d9             	mov    %ebx,%r9d
03ee   129c0e:	48 8b 54 24 30       	mov    0x30(%rsp),%rdx
03f3   129c13:	e9 dd 01 00 00       	jmp    129df5 <__send_ipi_mask+0x5d5>
03f8   129c18:	89 df                	mov    %ebx,%edi
03fa   129c1a:	e8 00 00 00 00       	call   129c1f <__send_ipi_mask+0x3ff>	129c1b: R_X86_64_PLT32	__msan_warning-0x4
03ff   129c1f:	4d 85 f6             	test   %r14,%r14
0402   129c22:	0f 85 b8 fd ff ff    	jne    1299e0 <__send_ipi_mask+0x1c0>
0408   129c28:	e9 85 02 00 00       	jmp    129eb2 <__send_ipi_mask+0x692>
040d   129c2d:	89 df                	mov    %ebx,%edi
040f   129c2f:	e8 00 00 00 00       	call   129c34 <__send_ipi_mask+0x414>	129c30: R_X86_64_PLT32	__msan_warning-0x4
0414   129c34:	e9 b0 fd ff ff       	jmp    1299e9 <__send_ipi_mask+0x1c9>
0419   129c39:	41 89 fc             	mov    %edi,%r12d
041c   129c3c:	4c 89 44 24 50       	mov    %r8,0x50(%rsp)
0421   129c41:	e8 00 00 00 00       	call   129c46 <__send_ipi_mask+0x426>	129c42: R_X86_64_PLT32	__msan_warning-0x4
0426   129c46:	4c 8b 44 24 50       	mov    0x50(%rsp),%r8
042b   129c4b:	44 89 e7             	mov    %r12d,%edi
042e   129c4e:	4c 8b 64 24 58       	mov    0x58(%rsp),%r12
0433   129c53:	e9 4d fe ff ff       	jmp    129aa5 <__send_ipi_mask+0x285>
0438   129c58:	8b 3a                	mov    (%rdx),%edi
043a   129c5a:	e8 00 00 00 00       	call   129c5f <__send_ipi_mask+0x43f>	129c5b: R_X86_64_PLT32	__msan_warning-0x4
043f   129c5f:	e9 d3 fd ff ff       	jmp    129a37 <__send_ipi_mask+0x217>
0444   129c64:	39 54 24 10          	cmp    %edx,0x10(%rsp)
0448   129c68:	89 7c 24 24          	mov    %edi,0x24(%rsp)
044c   129c6c:	bf 00 00 00 00       	mov    $0x0,%edi
0451   129c71:	41 0f 4f fb          	cmovg  %r11d,%edi
0455   129c75:	83 7c 24 28 00       	cmpl   $0x0,0x28(%rsp)
045a   129c7a:	41 0f 45 f9          	cmovne %r9d,%edi
045e   129c7e:	4c 89 44 24 50       	mov    %r8,0x50(%rsp)
0463   129c83:	44 89 5c 24 20       	mov    %r11d,0x20(%rsp)
0468   129c88:	44 89 4c 24 40       	mov    %r9d,0x40(%rsp)
046d   129c8d:	e8 00 00 00 00       	call   129c92 <__send_ipi_mask+0x472>	129c8e: R_X86_64_PLT32	__msan_warning-0x4
0472   129c92:	44 8b 4c 24 40       	mov    0x40(%rsp),%r9d
0477   129c97:	44 8b 5c 24 20       	mov    0x20(%rsp),%r11d
047c   129c9c:	4c 8b 44 24 50       	mov    0x50(%rsp),%r8
0481   129ca1:	8b 7c 24 24          	mov    0x24(%rsp),%edi
0485   129ca5:	8b 74 24 0c          	mov    0xc(%rsp),%esi
0489   129ca9:	48 8b 54 24 30       	mov    0x30(%rsp),%rdx
048e   129cae:	41 20 dd             	and    %bl,%r13b
0491   129cb1:	0f 85 87 fe ff ff    	jne    129b3e <__send_ipi_mask+0x31e>
0497   129cb7:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
049c   129cbc:	39 d0                	cmp    %edx,%eax
049e   129cbe:	0f 9c c3             	setl   %bl
04a1   129cc1:	05 80 00 00 00       	add    $0x80,%eax
04a6   129cc6:	39 d0                	cmp    %edx,%eax
04a8   129cc8:	41 0f 9f c4          	setg   %r12b
04ac   129ccc:	83 7c 24 28 00       	cmpl   $0x0,0x28(%rsp)
04b1   129cd1:	4c 8d ac 24 90 00 00 00 	lea    0x90(%rsp),%r13
04b9   129cd9:	75 5a                	jne    129d35 <__send_ipi_mask+0x515>
04bb   129cdb:	44 20 e3             	and    %r12b,%bl
04be   129cde:	0f 84 87 00 00 00    	je     129d6b <__send_ipi_mask+0x54b>
04c4   129ce4:	44 8b 64 24 2c       	mov    0x2c(%rsp),%r12d
04c9   129ce9:	41 39 d4             	cmp    %edx,%r12d
04cc   129cec:	44 0f 4e e2          	cmovle %edx,%r12d
04d0   129cf0:	8b 4c 24 1c          	mov    0x1c(%rsp),%ecx
04d4   129cf4:	44 8b 4c 24 18       	mov    0x18(%rsp),%r9d
04d9   129cf9:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
04de   129cfe:	8b 5c 24 44          	mov    0x44(%rsp),%ebx
04e2   129d02:	e9 f0 00 00 00       	jmp    129df7 <__send_ipi_mask+0x5d7>
04e7   129d07:	83 7c 24 28 00       	cmpl   $0x0,0x28(%rsp)
04ec   129d0c:	8b 7c 24 40          	mov    0x40(%rsp),%edi
04f0   129d10:	0f 44 7c 24 24       	cmove  0x24(%rsp),%edi
04f5   129d15:	49 89 d7             	mov    %rdx,%r15
04f8   129d18:	e8 00 00 00 00       	call   129d1d <__send_ipi_mask+0x4fd>	129d19: R_X86_64_PLT32	__msan_chain_origin-0x4
04fd   129d1d:	89 c0                	mov    %eax,%eax
04ff   129d1f:	48 89 c1             	mov    %rax,%rcx
0502   129d22:	48 c1 e1 20          	shl    $0x20,%rcx
0506   129d26:	48 09 c1             	or     %rax,%rcx
0509   129d29:	49 89 0f             	mov    %rcx,(%r15)
050c   129d2c:	49 89 4f 08          	mov    %rcx,0x8(%r15)
0510   129d30:	e9 a8 fe ff ff       	jmp    129bdd <__send_ipi_mask+0x3bd>
0515   129d35:	89 7c 24 24          	mov    %edi,0x24(%rsp)
0519   129d39:	44 89 cf             	mov    %r9d,%edi
051c   129d3c:	4c 89 44 24 50       	mov    %r8,0x50(%rsp)
0521   129d41:	44 89 5c 24 20       	mov    %r11d,0x20(%rsp)
0526   129d46:	e8 00 00 00 00       	call   129d4b <__send_ipi_mask+0x52b>	129d47: R_X86_64_PLT32	__msan_warning-0x4
052b   129d4b:	44 8b 5c 24 20       	mov    0x20(%rsp),%r11d
0530   129d50:	4c 8b 44 24 50       	mov    0x50(%rsp),%r8
0535   129d55:	8b 7c 24 24          	mov    0x24(%rsp),%edi
0539   129d59:	8b 74 24 0c          	mov    0xc(%rsp),%esi
053d   129d5d:	48 8b 54 24 30       	mov    0x30(%rsp),%rdx
0542   129d62:	44 20 e3             	and    %r12b,%bl
0545   129d65:	0f 85 79 ff ff ff    	jne    129ce4 <__send_ipi_mask+0x4c4>
054b   129d6b:	48 83 7c 24 60 00    	cmpq   $0x0,0x60(%rsp)
0551   129d71:	0f 85 fd 00 00 00    	jne    129e74 <__send_ipi_mask+0x654>
0557   129d77:	4d 85 c0             	test   %r8,%r8
055a   129d7a:	48 8b 4c 24 70       	mov    0x70(%rsp),%rcx
055f   129d7f:	48 8b 5c 24 58       	mov    0x58(%rsp),%rbx
0564   129d84:	0f 85 fe 00 00 00    	jne    129e88 <__send_ipi_mask+0x668>
056a   129d8a:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%rsp)
056f   129d8f:	0f 85 09 01 00 00    	jne    129e9e <__send_ipi_mask+0x67e>
0575   129d95:	8b 54 24 10          	mov    0x10(%rsp),%edx
0579   129d99:	b8 0a 00 00 00       	mov    $0xa,%eax
057e   129d9e:	48 8b 74 24 68       	mov    0x68(%rsp),%rsi
0583   129da3:	0f 01 c1             	vmcall
0586   129da6:	be 10 00 00 00       	mov    $0x10,%esi
058b   129dab:	4c 89 ef             	mov    %r13,%rdi
058e   129dae:	e8 00 00 00 00       	call   129db3 <__send_ipi_mask+0x593>	129daf: R_X86_64_PLT32	__msan_metadata_ptr_for_store_n-0x4
0593   129db3:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
059a   129dba:	48 c7 40 08 00 00 00 00 	movq   $0x0,0x8(%rax)
05a2   129dc2:	48 c7 84 24 90 00 00 00 00 00 00 00 	movq   $0x0,0x90(%rsp)
05ae   129dce:	48 c7 84 24 98 00 00 00 00 00 00 00 	movq   $0x0,0x98(%rsp)
05ba   129dda:	8b 74 24 0c          	mov    0xc(%rsp),%esi
05be   129dde:	41 89 f7             	mov    %esi,%r15d
05c1   129de1:	8b 5c 24 44          	mov    0x44(%rsp),%ebx
05c5   129de5:	41 89 db             	mov    %ebx,%r11d
05c8   129de8:	48 8b 54 24 30       	mov    0x30(%rsp),%rdx
05cd   129ded:	41 89 d4             	mov    %edx,%r12d
05d0   129df0:	89 f1                	mov    %esi,%ecx
05d2   129df2:	41 89 d9             	mov    %ebx,%r9d
05d5   129df5:	89 d0                	mov    %edx,%eax
05d7   129df7:	09 ce                	or     %ecx,%esi
05d9   129df9:	75 45                	jne    129e40 <__send_ipi_mask+0x620>
05db   129dfb:	89 c6                	mov    %eax,%esi
05dd   129dfd:	48 98                	cltq
05df   129dff:	48 29 c2             	sub    %rax,%rdx
05e2   129e02:	48 0f ab 94 24 90 00 00 00 	bts    %rdx,0x90(%rsp)
05eb   129e0b:	41 ff c6             	inc    %r14d
05ee   129e0e:	41 83 e6 7f          	and    $0x7f,%r14d
05f2   129e12:	89 4c 24 1c          	mov    %ecx,0x1c(%rsp)
05f6   129e16:	44 89 4c 24 18       	mov    %r9d,0x18(%rsp)
05fb   129e1b:	89 f0                	mov    %esi,%eax
05fd   129e1d:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
0602   129e22:	44 89 7c 24 4c       	mov    %r15d,0x4c(%rsp)
0607   129e27:	44 89 5c 24 48       	mov    %r11d,0x48(%rsp)
060c   129e2c:	44 89 64 24 2c       	mov    %r12d,0x2c(%rsp)
0611   129e31:	41 83 fe 40          	cmp    $0x40,%r14d
0615   129e35:	0f 82 66 fb ff ff    	jb     1299a1 <__send_ipi_mask+0x181>
061b   129e3b:	e9 82 00 00 00       	jmp    129ec2 <__send_ipi_mask+0x6a2>
0620   129e40:	85 c9                	test   %ecx,%ecx
0622   129e42:	41 0f 45 d9          	cmovne %r9d,%ebx
0626   129e46:	89 df                	mov    %ebx,%edi
0628   129e48:	89 cb                	mov    %ecx,%ebx
062a   129e4a:	44 89 4c 24 0c       	mov    %r9d,0xc(%rsp)
062f   129e4f:	44 89 5c 24 20       	mov    %r11d,0x20(%rsp)
0634   129e54:	89 44 24 10          	mov    %eax,0x10(%rsp)
0638   129e58:	e8 00 00 00 00       	call   129e5d <__send_ipi_mask+0x63d>	129e59: R_X86_64_PLT32	__msan_warning-0x4
063d   129e5d:	8b 44 24 10          	mov    0x10(%rsp),%eax
0641   129e61:	44 8b 5c 24 20       	mov    0x20(%rsp),%r11d
0646   129e66:	44 8b 4c 24 0c       	mov    0xc(%rsp),%r9d
064b   129e6b:	89 d9                	mov    %ebx,%ecx
064d   129e6d:	48 8b 54 24 30       	mov    0x30(%rsp),%rdx
0652   129e72:	eb 87                	jmp    129dfb <__send_ipi_mask+0x5db>
0654   129e74:	89 fb                	mov    %edi,%ebx
0656   129e76:	4d 89 c7             	mov    %r8,%r15
0659   129e79:	e8 00 00 00 00       	call   129e7e <__send_ipi_mask+0x65e>	129e7a: R_X86_64_PLT32	__msan_warning-0x4
065e   129e7e:	4d 89 f8             	mov    %r15,%r8
0661   129e81:	89 df                	mov    %ebx,%edi
0663   129e83:	e9 ef fe ff ff       	jmp    129d77 <__send_ipi_mask+0x557>
0668   129e88:	49 89 cf             	mov    %rcx,%r15
066b   129e8b:	e8 00 00 00 00       	call   129e90 <__send_ipi_mask+0x670>	129e8c: R_X86_64_PLT32	__msan_warning-0x4
0670   129e90:	4c 89 f9             	mov    %r15,%rcx
0673   129e93:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%rsp)
0678   129e98:	0f 84 f7 fe ff ff    	je     129d95 <__send_ipi_mask+0x575>
067e   129e9e:	8b 7c 24 18          	mov    0x18(%rsp),%edi
0682   129ea2:	49 89 cf             	mov    %rcx,%r15
0685   129ea5:	e8 00 00 00 00       	call   129eaa <__send_ipi_mask+0x68a>	129ea6: R_X86_64_PLT32	__msan_warning-0x4
068a   129eaa:	4c 89 f9             	mov    %r15,%rcx
068d   129ead:	e9 e3 fe ff ff       	jmp    129d95 <__send_ipi_mask+0x575>
0692   129eb2:	8b 4c 24 1c          	mov    0x1c(%rsp),%ecx
0696   129eb6:	44 8b 4c 24 18       	mov    0x18(%rsp),%r9d
069b   129ebb:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
06a0   129ec0:	89 c6                	mov    %eax,%esi
06a2   129ec2:	89 4c 24 30          	mov    %ecx,0x30(%rsp)
06a6   129ec6:	41 89 f7             	mov    %esi,%r15d
06a9   129ec9:	44 89 4c 24 0c       	mov    %r9d,0xc(%rsp)
06ae   129ece:	48 8b 9c 24 90 00 00 00 	mov    0x90(%rsp),%rbx
06b6   129ed6:	4c 8b b4 24 98 00 00 00 	mov    0x98(%rsp),%r14
06be   129ede:	48 8d bc 24 90 00 00 00 	lea    0x90(%rsp),%rdi
06c6   129ee6:	be 10 00 00 00       	mov    $0x10,%esi
06cb   129eeb:	e8 00 00 00 00       	call   129ef0 <__send_ipi_mask+0x6d0>	129eec: R_X86_64_PLT32	__msan_metadata_ptr_for_load_n-0x4
06d0   129ef0:	4c 8b 28             	mov    (%rax),%r13
06d3   129ef3:	4c 8b 60 08          	mov    0x8(%rax),%r12
06d7   129ef7:	8b 3a                	mov    (%rdx),%edi
06d9   129ef9:	4c 89 e8             	mov    %r13,%rax
06dc   129efc:	4c 09 e0             	or     %r12,%rax
06df   129eff:	74 1b                	je     129f1c <__send_ipi_mask+0x6fc>
06e1   129f01:	4c 89 e8             	mov    %r13,%rax
06e4   129f04:	48 f7 d0             	not    %rax
06e7   129f07:	4c 89 e1             	mov    %r12,%rcx
06ea   129f0a:	48 f7 d1             	not    %rcx
06ed   129f0d:	4c 21 f1             	and    %r14,%rcx
06f0   129f10:	48 21 d8             	and    %rbx,%rax
06f3   129f13:	48 09 c8             	or     %rcx,%rax
06f6   129f16:	0f 84 fd 00 00 00    	je     12a019 <__send_ipi_mask+0x7f9>
06fc   129f1c:	48 89 d8             	mov    %rbx,%rax
06ff   129f1f:	4c 09 f0             	or     %r14,%rax
0702   129f22:	74 30                	je     129f54 <__send_ipi_mask+0x734>
0704   129f24:	4d 85 ed             	test   %r13,%r13
0707   129f27:	0f 85 46 01 00 00    	jne    12a073 <__send_ipi_mask+0x853>
070d   129f2d:	44 89 fa             	mov    %r15d,%edx
0710   129f30:	4d 85 e4             	test   %r12,%r12
0713   129f33:	0f 85 4a 01 00 00    	jne    12a083 <__send_ipi_mask+0x863>
0719   129f39:	83 7c 24 30 00       	cmpl   $0x0,0x30(%rsp)
071e   129f3e:	0f 85 55 01 00 00    	jne    12a099 <__send_ipi_mask+0x879>
0724   129f44:	b8 0a 00 00 00       	mov    $0xa,%eax
0729   129f49:	4c 89 f1             	mov    %r14,%rcx
072c   129f4c:	48 8b 74 24 68       	mov    0x68(%rsp),%rsi
0731   129f51:	0f 01 c1             	vmcall
0734   129f54:	80 7c 24 0b 00       	cmpb   $0x0,0xb(%rsp)
0739   129f59:	0f 85 06 01 00 00    	jne    12a065 <__send_ipi_mask+0x845>
073f   129f5f:	4c 8b 7c 24 78       	mov    0x78(%rsp),%r15
0744   129f64:	4d 85 ff             	test   %r15,%r15
0747   129f67:	74 05                	je     129f6e <__send_ipi_mask+0x74e>
0749   129f69:	e8 00 00 00 00       	call   129f6e <__send_ipi_mask+0x74e>	129f6a: R_X86_64_PLT32	trace_hardirqs_on-0x4
074e   129f6e:	48 8d 9c 24 a8 00 00 00 	lea    0xa8(%rsp),%rbx
0756   129f76:	be 08 00 00 00       	mov    $0x8,%esi
075b   129f7b:	48 89 df             	mov    %rbx,%rdi
075e   129f7e:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	129f81: R_X86_64_32S	.rodata+0x9230
0765   129f85:	e8 00 00 00 00       	call   129f8a <__send_ipi_mask+0x76a>	129f86: R_X86_64_PLT32	__msan_poison_alloca-0x4
076a   129f8a:	be 08 00 00 00       	mov    $0x8,%esi
076f   129f8f:	48 89 df             	mov    %rbx,%rdi
0772   129f92:	e8 00 00 00 00       	call   129f97 <__send_ipi_mask+0x777>	129f93: R_X86_64_PLT32	__msan_instrument_asm_store-0x4
0777   129f97:	9c                   	pushf
0778   129f98:	8f 84 24 a8 00 00 00 	pop    0xa8(%rsp)
077f   129f9f:	4c 8b b4 24 a8 00 00 00 	mov    0xa8(%rsp),%r14
0787   129fa7:	48 89 df             	mov    %rbx,%rdi
078a   129faa:	e8 00 00 00 00       	call   129faf <__send_ipi_mask+0x78f>	129fab: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
078f   129faf:	48 8b 00             	mov    (%rax),%rax
0792   129fb2:	25 00 02 00 00       	and    $0x200,%eax
0797   129fb7:	41 81 e6 00 02 00 00 	and    $0x200,%r14d
079e   129fbe:	48 85 c0             	test   %rax,%rax
07a1   129fc1:	74 07                	je     129fca <__send_ipi_mask+0x7aa>
07a3   129fc3:	f7 d0                	not    %eax
07a5   129fc5:	44 21 f0             	and    %r14d,%eax
07a8   129fc8:	74 65                	je     12a02f <__send_ipi_mask+0x80f>
07aa   129fca:	4d 85 f6             	test   %r14,%r14
07ad   129fcd:	75 6c                	jne    12a03b <__send_ipi_mask+0x81b>
07af   129fcf:	80 7c 24 0b 00       	cmpb   $0x0,0xb(%rsp)
07b4   129fd4:	75 71                	jne    12a047 <__send_ipi_mask+0x827>
07b6   129fd6:	4d 85 ff             	test   %r15,%r15
07b9   129fd9:	74 01                	je     129fdc <__send_ipi_mask+0x7bc>
07bb   129fdb:	fb                   	sti
07bc   129fdc:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
07c5   129fe5:	48 3b 84 24 b0 00 00 00 	cmp    0xb0(%rsp),%rax
07cd   129fed:	0f 85 ba 00 00 00    	jne    12a0ad <__send_ipi_mask+0x88d>
07d3   129ff3:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
07d7   129ff7:	5b                   	pop    %rbx
07d8   129ff8:	41 5c                	pop    %r12
07da   129ffa:	41 5d                	pop    %r13
07dc   129ffc:	41 5e                	pop    %r14
07de   129ffe:	41 5f                	pop    %r15
07e0   12a000:	5d                   	pop    %rbp
07e1   12a001:	2e e9 00 00 00 00    	cs jmp 12a007 <__send_ipi_mask+0x7e7>	12a003: R_X86_64_PLT32	__x86_return_thunk-0x4
07e7   12a007:	8b 3a                	mov    (%rdx),%edi
07e9   12a009:	e8 00 00 00 00       	call   12a00e <__send_ipi_mask+0x7ee>	12a00a: R_X86_64_PLT32	__msan_warning-0x4
07ee   12a00e:	4d 85 f6             	test   %r14,%r14
07f1   12a011:	0f 85 bc f8 ff ff    	jne    1298d3 <__send_ipi_mask+0xb3>
07f7   12a017:	eb c3                	jmp    129fdc <__send_ipi_mask+0x7bc>
07f9   12a019:	89 7c 24 10          	mov    %edi,0x10(%rsp)
07fd   12a01d:	8b 7c 24 10          	mov    0x10(%rsp),%edi
0801   12a021:	e8 00 00 00 00       	call   12a026 <__send_ipi_mask+0x806>	12a022: R_X86_64_PLT32	__msan_warning-0x4
0806   12a026:	8b 7c 24 10          	mov    0x10(%rsp),%edi
080a   12a02a:	e9 ed fe ff ff       	jmp    129f1c <__send_ipi_mask+0x6fc>
080f   12a02f:	8b 3a                	mov    (%rdx),%edi
0811   12a031:	e8 00 00 00 00       	call   12a036 <__send_ipi_mask+0x816>	12a032: R_X86_64_PLT32	__msan_warning-0x4
0816   12a036:	4d 85 f6             	test   %r14,%r14
0819   12a039:	74 94                	je     129fcf <__send_ipi_mask+0x7af>
081b   12a03b:	e8 00 00 00 00       	call   12a040 <__send_ipi_mask+0x820>	12a03c: R_X86_64_PLT32	warn_bogus_irq_restore-0x4
0820   12a040:	80 7c 24 0b 00       	cmpb   $0x0,0xb(%rsp)
0825   12a045:	74 8f                	je     129fd6 <__send_ipi_mask+0x7b6>
0827   12a047:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
082b   12a04b:	e8 00 00 00 00       	call   12a050 <__send_ipi_mask+0x830>	12a04c: R_X86_64_PLT32	__msan_warning-0x4
0830   12a050:	4d 85 ff             	test   %r15,%r15
0833   12a053:	75 86                	jne    129fdb <__send_ipi_mask+0x7bb>
0835   12a055:	eb 85                	jmp    129fdc <__send_ipi_mask+0x7bc>
0837   12a057:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
083b   12a05b:	e8 00 00 00 00       	call   12a060 <__send_ipi_mask+0x840>	12a05c: R_X86_64_PLT32	__msan_warning-0x4
0840   12a060:	e9 e1 f8 ff ff       	jmp    129946 <__send_ipi_mask+0x126>
0845   12a065:	8b 7c 24 3c          	mov    0x3c(%rsp),%edi
0849   12a069:	e8 00 00 00 00       	call   12a06e <__send_ipi_mask+0x84e>	12a06a: R_X86_64_PLT32	__msan_warning-0x4
084e   12a06e:	e9 ec fe ff ff       	jmp    129f5f <__send_ipi_mask+0x73f>
0853   12a073:	41 89 fd             	mov    %edi,%r13d
0856   12a076:	e8 00 00 00 00       	call   12a07b <__send_ipi_mask+0x85b>	12a077: R_X86_64_PLT32	__msan_warning-0x4
085b   12a07b:	44 89 ef             	mov    %r13d,%edi
085e   12a07e:	e9 aa fe ff ff       	jmp    129f2d <__send_ipi_mask+0x70d>
0863   12a083:	49 89 d4             	mov    %rdx,%r12
0866   12a086:	e8 00 00 00 00       	call   12a08b <__send_ipi_mask+0x86b>	12a087: R_X86_64_PLT32	__msan_warning-0x4
086b   12a08b:	4c 89 e2             	mov    %r12,%rdx
086e   12a08e:	83 7c 24 30 00       	cmpl   $0x0,0x30(%rsp)
0873   12a093:	0f 84 ab fe ff ff    	je     129f44 <__send_ipi_mask+0x724>
0879   12a099:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
087d   12a09d:	49 89 d7             	mov    %rdx,%r15
0880   12a0a0:	e8 00 00 00 00       	call   12a0a5 <__send_ipi_mask+0x885>	12a0a1: R_X86_64_PLT32	__msan_warning-0x4
0885   12a0a5:	4c 89 fa             	mov    %r15,%rdx
0888   12a0a8:	e9 97 fe ff ff       	jmp    129f44 <__send_ipi_mask+0x724>
088d   12a0ad:	e8 00 00 00 00       	call   12a0b2 <__send_ipi_mask+0x892>	12a0ae: R_X86_64_PLT32	__stack_chk_fail-0x4
0892   12a0b2:	66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
