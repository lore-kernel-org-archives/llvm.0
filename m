Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D621A15AE;
	Thu, 23 Mar 2023 04:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679546539; x=1711082539;
  h=date:from:cc:subject:message-id:mime-version;
  bh=REXj/nRr1pJ6cCHGI8C9v4UGaE7F4wxePVrJQQ8Ts2w=;
  b=jNNmVDyrpW7iCwhYw1vP0zagbe2SPwxTjh8UHhiH7SqPDlwZ1ImKNE3y
   l0IS+hPbxVs3YIiVCGOkQzypDJpH/bKNMARRBbBEQDL3AJdi8wKWU5ssA
   4KKRretOVY0wcumC+zAHAGlRQwxYWTyWfVlQVqrYqMA0oV8opHXH/UjG5
   ZhAoudyYyLkRgFRjOSCh5ZeVmEnM1XStuB0RMDjFMIaPZXMz0QSzfI8dy
   Annuuv0dTYjCww6tEr8jSRBNxe+zlQrJT5Y+/BSVyWDhThj8Taih51/kc
   IEIfuP4tn1YkSYo4HF76jxvwXNEvy8zMLVav1PX37YfwAxFvYs+Cb/awq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="319046294"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="319046294"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 21:42:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="632238614"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="632238614"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 22 Mar 2023 21:42:09 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfCm8-000Dxw-2A;
	Thu, 23 Mar 2023 04:42:08 +0000
Date: Thu, 23 Mar 2023 12:41:29 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [intel-tdx:kvm-upstream-workaround 184/325] vmlinux.o: warning:
 objtool: vmx_vcpu_enter_exit+0x224: call to kvm_make_all_cpus_request()
 leaves .noinstr.text section
Message-ID: <202303231226.2NFGIKnk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Isaku Yamahata <isaku.yamahata@intel.com>

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   f34ff32915c7aa828d8a5827b69edde1189eca75
commit: c7fd07a53241e327c12161df2bd99ec85745922b [184/325] [REVERTME] KVM: TDX: add KVM_BUG_ON to to_kvm_vmx, to_vmx, to_kvm_tdx, to_tdx
config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20230323/202303231226.2NFGIKnk-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/c7fd07a53241e327c12161df2bd99ec85745922b
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout c7fd07a53241e327c12161df2bd99ec85745922b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303231226.2NFGIKnk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: vmx_vcpu_enter_exit+0x224: call to kvm_make_all_cpus_request() leaves .noinstr.text section


objdump-func vmlinux.o vmx_vcpu_enter_exit:
0000 00000000000002c0 <vmx_vcpu_enter_exit>:
0000      2c0:	55                   	push   %rbp
0001      2c1:	41 56                	push   %r14
0003      2c3:	53                   	push   %rbx
0004      2c4:	89 f5                	mov    %esi,%ebp
0006      2c6:	48 89 fb             	mov    %rdi,%rbx
0009      2c9:	48 8b 07             	mov    (%rdi),%rax
000c      2cc:	48 83 b8 e8 15 00 00 01 	cmpq   $0x1,0x15e8(%rax)
0014      2d4:	75 0d                	jne    2e3 <vmx_vcpu_enter_exit+0x23>
0016      2d6:	80 b8 e1 ae 00 00 00 	cmpb   $0x0,0xaee1(%rax)
001d      2dd:	0f 84 cd 01 00 00    	je     4b0 <vmx_vcpu_enter_exit+0x1f0>
0023      2e3:	90                   	nop
0024      2e4:	e8 00 00 00 00       	call   2e9 <vmx_vcpu_enter_exit+0x29>	2e5: R_X86_64_PLT32	trace_hardirqs_on_prepare-0x4
0029      2e9:	e8 00 00 00 00       	call   2ee <vmx_vcpu_enter_exit+0x2e>	2ea: R_X86_64_PLT32	lockdep_hardirqs_on_prepare-0x4
002e      2ee:	90                   	nop
002f      2ef:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0(%rip)        # 2f6 <vmx_vcpu_enter_exit+0x36>	2f1: R_X86_64_PC32	context_tracking_key-0x5
0036      2f6:	7e 0a                	jle    302 <vmx_vcpu_enter_exit+0x42>
0038      2f8:	bf 03 00 00 00       	mov    $0x3,%edi
003d      2fd:	e8 00 00 00 00       	call   302 <vmx_vcpu_enter_exit+0x42>	2fe: R_X86_64_PLT32	__ct_user_enter-0x4
0042      302:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0(%rip)        # 309 <vmx_vcpu_enter_exit+0x49>	304: R_X86_64_PC32	context_tracking_key-0x5
0049      309:	7e 0b                	jle    316 <vmx_vcpu_enter_exit+0x56>
004b      30b:	65 8a 05 00 00 00 00 	mov    %gs:0x0(%rip),%al        # 312 <vmx_vcpu_enter_exit+0x52>	30e: R_X86_64_PC32	context_tracking-0x4
0052      312:	84 c0                	test   %al,%al
0054      314:	75 09                	jne    31f <vmx_vcpu_enter_exit+0x5f>
0056      316:	90                   	nop
0057      317:	31 ff                	xor    %edi,%edi
0059      319:	e8 00 00 00 00       	call   31e <vmx_vcpu_enter_exit+0x5e>	31a: R_X86_64_PLT32	rcu_note_context_switch-0x4
005e      31e:	90                   	nop
005f      31f:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
0064      324:	4c 89 f7             	mov    %r14,%rdi
0067      327:	e8 00 00 00 00       	call   32c <vmx_vcpu_enter_exit+0x6c>	328: R_X86_64_PLT32	lockdep_hardirqs_on-0x4
006c      32c:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0(%rip)        # 333 <vmx_vcpu_enter_exit+0x73>	32e: R_X86_64_PC32	.bss+0x449b
0073      333:	0f 8f 33 01 00 00    	jg     46c <vmx_vcpu_enter_exit+0x1ac>
0079      339:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0(%rip)        # 340 <vmx_vcpu_enter_exit+0x80>	33b: R_X86_64_PC32	mds_user_clear-0x5
0080      340:	0f 8f 42 01 00 00    	jg     488 <vmx_vcpu_enter_exit+0x1c8>
0086      346:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0(%rip)        # 34d <vmx_vcpu_enter_exit+0x8d>	348: R_X86_64_PC32	mmio_stale_data_clear-0x5
008d      34d:	0f 8f 41 01 00 00    	jg     494 <vmx_vcpu_enter_exit+0x1d4>
0093      353:	80 bb b0 27 00 00 00 	cmpb   $0x0,0x27b0(%rbx)
009a      35a:	74 27                	je     383 <vmx_vcpu_enter_exit+0xc3>
009c      35c:	b9 23 01 00 00       	mov    $0x123,%ecx
00a1      361:	0f 32                	rdmsr
00a3      363:	48 c1 e2 20          	shl    $0x20,%rdx
00a7      367:	48 09 c2             	or     %rax,%rdx
00aa      36a:	48 89 d0             	mov    %rdx,%rax
00ad      36d:	48 83 c8 08          	or     $0x8,%rax
00b1      371:	48 c1 ea 20          	shr    $0x20,%rdx
00b5      375:	b9 23 01 00 00       	mov    $0x123,%ecx
00ba      37a:	0f 30                	wrmsr
00bc      37c:	48 89 83 a8 27 00 00 	mov    %rax,0x27a8(%rbx)
00c3      383:	48 8b 83 78 02 00 00 	mov    0x278(%rbx),%rax
00ca      38a:	0f 20 d1             	mov    %cr2,%rcx
00cd      38d:	48 39 c8             	cmp    %rcx,%rax
00d0      390:	74 0a                	je     39c <vmx_vcpu_enter_exit+0xdc>
00d2      392:	48 8b 83 78 02 00 00 	mov    0x278(%rbx),%rax
00d9      399:	0f 22 d0             	mov    %rax,%cr2
00dc      39c:	48 8d b3 d8 01 00 00 	lea    0x1d8(%rbx),%rsi
00e3      3a3:	48 89 df             	mov    %rbx,%rdi
00e6      3a6:	89 ea                	mov    %ebp,%edx
00e8      3a8:	e8 00 00 00 00       	call   3ad <vmx_vcpu_enter_exit+0xed>	3a9: R_X86_64_PLT32	__vmx_vcpu_run-0x4
00ed      3ad:	88 83 90 1f 00 00    	mov    %al,0x1f90(%rbx)
00f3      3b3:	0f 20 d0             	mov    %cr2,%rax
00f6      3b6:	48 89 83 78 02 00 00 	mov    %rax,0x278(%rbx)
00fd      3bd:	80 bb b0 27 00 00 00 	cmpb   $0x0,0x27b0(%rbx)
0104      3c4:	74 20                	je     3e6 <vmx_vcpu_enter_exit+0x126>
0106      3c6:	48 8b 93 a8 27 00 00 	mov    0x27a8(%rbx),%rdx
010d      3cd:	48 89 d0             	mov    %rdx,%rax
0110      3d0:	48 83 e0 f7          	and    $0xfffffffffffffff7,%rax
0114      3d4:	48 89 83 a8 27 00 00 	mov    %rax,0x27a8(%rbx)
011b      3db:	48 c1 ea 20          	shr    $0x20,%rdx
011f      3df:	b9 23 01 00 00       	mov    $0x123,%ecx
0124      3e4:	0f 30                	wrmsr
0126      3e6:	80 bb 90 1f 00 00 00 	cmpb   $0x0,0x1f90(%rbx)
012d      3ed:	0f 85 86 00 00 00    	jne    479 <vmx_vcpu_enter_exit+0x1b9>
0133      3f3:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0(%rip)        # 3fa <vmx_vcpu_enter_exit+0x13a>	3f5: R_X86_64_PC32	enable_evmcs-0x5
013a      3fa:	0f 8f 79 01 00 00    	jg     579 <vmx_vcpu_enter_exit+0x2b9>
0140      400:	b8 02 44 00 00       	mov    $0x4402,%eax
0145      405:	0f 78 c0             	vmread %rax,%rax
0148      408:	0f 86 36 01 00 00    	jbe    544 <vmx_vcpu_enter_exit+0x284>
014e      40e:	89 83 80 24 00 00    	mov    %eax,0x2480(%rbx)
0154      414:	66 85 c0             	test   %ax,%ax
0157      417:	0f 85 00 01 00 00    	jne    51d <vmx_vcpu_enter_exit+0x25d>
015d      41d:	48 8b 03             	mov    (%rbx),%rax
0160      420:	48 83 b8 e8 15 00 00 01 	cmpq   $0x1,0x15e8(%rax)
0168      428:	75 0d                	jne    437 <vmx_vcpu_enter_exit+0x177>
016a      42a:	80 b8 e1 ae 00 00 00 	cmpb   $0x0,0xaee1(%rax)
0171      431:	0f 84 98 00 00 00    	je     4cf <vmx_vcpu_enter_exit+0x20f>
0177      437:	48 0f ba ab 60 02 00 00 18 	btsq   $0x18,0x260(%rbx)
0180      440:	0f 82 b2 00 00 00    	jb     4f8 <vmx_vcpu_enter_exit+0x238>
0186      446:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0(%rip)        # 44d <vmx_vcpu_enter_exit+0x18d>	448: R_X86_64_PC32	enable_evmcs-0x5
018d      44d:	0f 8f 66 01 00 00    	jg     5b9 <vmx_vcpu_enter_exit+0x2f9>
0193      453:	b8 04 44 00 00       	mov    $0x4404,%eax
0198      458:	0f 78 c0             	vmread %rax,%rax
019b      45b:	0f 86 27 01 00 00    	jbe    588 <vmx_vcpu_enter_exit+0x2c8>
01a1      461:	89 83 a0 1f 00 00    	mov    %eax,0x1fa0(%rbx)
01a7      467:	e9 92 00 00 00       	jmp    4fe <vmx_vcpu_enter_exit+0x23e>
01ac      46c:	48 89 df             	mov    %rbx,%rdi
01af      46f:	e8 bc 01 00 00       	call   630 <vmx_l1d_flush>
01b4      474:	e9 da fe ff ff       	jmp    353 <vmx_vcpu_enter_exit+0x93>
01b9      479:	c7 83 80 24 00 00 ad de 00 00 	movl   $0xdead,0x2480(%rbx)
01c3      483:	e9 95 00 00 00       	jmp    51d <vmx_vcpu_enter_exit+0x25d>
01c8      488:	0f 00 2d 00 00 00 00 	verw   0x0(%rip)        # 48f <vmx_vcpu_enter_exit+0x1cf>	48b: R_X86_64_PC32	.rodata+0x496fc
01cf      48f:	e9 bf fe ff ff       	jmp    353 <vmx_vcpu_enter_exit+0x93>
01d4      494:	48 8b 3b             	mov    (%rbx),%rdi
01d7      497:	e8 00 00 00 00       	call   49c <vmx_vcpu_enter_exit+0x1dc>	498: R_X86_64_PLT32	kvm_arch_has_assigned_device-0x4
01dc      49c:	84 c0                	test   %al,%al
01de      49e:	0f 84 af fe ff ff    	je     353 <vmx_vcpu_enter_exit+0x93>
01e4      4a4:	0f 00 2d 00 00 00 00 	verw   0x0(%rip)        # 4ab <vmx_vcpu_enter_exit+0x1eb>	4a7: R_X86_64_PC32	.rodata+0x496fc
01eb      4ab:	e9 a3 fe ff ff       	jmp    353 <vmx_vcpu_enter_exit+0x93>
01f0      4b0:	90                   	nop
01f1      4b1:	0f 0b                	ud2
01f3      4b3:	90                   	nop
01f4      4b4:	48 8b 3b             	mov    (%rbx),%rdi
01f7      4b7:	66 c7 87 e1 ae 00 00 01 01 	movw   $0x101,0xaee1(%rdi)
0200      4c0:	be 01 03 00 00       	mov    $0x301,%esi
0205      4c5:	e8 00 00 00 00       	call   4ca <vmx_vcpu_enter_exit+0x20a>	4c6: R_X86_64_PLT32	kvm_make_all_cpus_request-0x4
020a      4ca:	e9 14 fe ff ff       	jmp    2e3 <vmx_vcpu_enter_exit+0x23>
020f      4cf:	90                   	nop
0210      4d0:	0f 0b                	ud2
0212      4d2:	90                   	nop
0213      4d3:	48 8b 3b             	mov    (%rbx),%rdi
0216      4d6:	66 c7 87 e1 ae 00 00 01 01 	movw   $0x101,0xaee1(%rdi)
021f      4df:	be 01 03 00 00       	mov    $0x301,%esi
0224      4e4:	e8 00 00 00 00       	call   4e9 <vmx_vcpu_enter_exit+0x229>	4e5: R_X86_64_PLT32	kvm_make_all_cpus_request-0x4
0229      4e9:	48 0f ba ab 60 02 00 00 18 	btsq   $0x18,0x260(%rbx)
0232      4f2:	0f 83 4e ff ff ff    	jae    446 <vmx_vcpu_enter_exit+0x186>
0238      4f8:	8b 83 a0 1f 00 00    	mov    0x1fa0(%rbx),%eax
023e      4fe:	25 00 07 00 80       	and    $0x80000700,%eax
0243      503:	3d 00 02 00 80       	cmp    $0x80000200,%eax
0248      508:	75 13                	jne    51d <vmx_vcpu_enter_exit+0x25d>
024a      50a:	c6 83 fa 0b 00 00 02 	movb   $0x2,0xbfa(%rbx)
0251      511:	e8 00 00 00 00       	call   516 <vmx_vcpu_enter_exit+0x256>	512: R_X86_64_PLT32	vmx_do_nmi_irqoff-0x4
0256      516:	c6 83 fa 0b 00 00 00 	movb   $0x0,0xbfa(%rbx)
025d      51d:	4c 89 f7             	mov    %r14,%rdi
0260      520:	e8 00 00 00 00       	call   525 <vmx_vcpu_enter_exit+0x265>	521: R_X86_64_PLT32	lockdep_hardirqs_off-0x4
0265      525:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0(%rip)        # 52c <vmx_vcpu_enter_exit+0x26c>	527: R_X86_64_PC32	context_tracking_key-0x5
026c      52c:	7e 0a                	jle    538 <vmx_vcpu_enter_exit+0x278>
026e      52e:	bf 03 00 00 00       	mov    $0x3,%edi
0273      533:	e8 00 00 00 00       	call   538 <vmx_vcpu_enter_exit+0x278>	534: R_X86_64_PLT32	__ct_user_exit-0x4
0278      538:	90                   	nop
0279      539:	e8 00 00 00 00       	call   53e <vmx_vcpu_enter_exit+0x27e>	53a: R_X86_64_PLT32	trace_hardirqs_off_finish-0x4
027e      53e:	90                   	nop
027f      53f:	5b                   	pop    %rbx
0280      540:	41 5e                	pop    %r14
0282      542:	5d                   	pop    %rbp
0283      543:	c3                   	ret
0284      544:	f3 0f 1e fa          	endbr64
0288      548:	90                   	nop
0289      549:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 550 <vmx_vcpu_enter_exit+0x290>	54b: R_X86_64_PC32	.data.once+0x2b
0290      550:	0f 84 90 00 00 00    	je     5e6 <vmx_vcpu_enter_exit+0x326>
0296      556:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	559: R_X86_64_32S	.data+0x93160
029d      55d:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	560: R_X86_64_32S	.rodata.str1.1+0xbfb63
02a4      564:	e8 00 00 00 00       	call   569 <vmx_vcpu_enter_exit+0x2a9>	565: R_X86_64_PLT32	___ratelimit-0x4
02a9      569:	85 c0                	test   %eax,%eax
02ab      56b:	75 53                	jne    5c0 <vmx_vcpu_enter_exit+0x300>
02ad      56d:	90                   	nop
02ae      56e:	eb 09                	jmp    579 <vmx_vcpu_enter_exit+0x2b9>
02b0      570:	f3 0f 1e fa          	endbr64
02b4      574:	e8 00 00 00 00       	call   579 <vmx_vcpu_enter_exit+0x2b9>	575: R_X86_64_PLT32	kvm_spurious_fault-0x4
02b9      579:	c7 83 80 24 00 00 00 00 00 00 	movl   $0x0,0x2480(%rbx)
02c3      583:	e9 95 fe ff ff       	jmp    41d <vmx_vcpu_enter_exit+0x15d>
02c8      588:	f3 0f 1e fa          	endbr64
02cc      58c:	90                   	nop
02cd      58d:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 594 <vmx_vcpu_enter_exit+0x2d4>	58f: R_X86_64_PC32	.data.once+0x2b
02d4      594:	74 73                	je     609 <vmx_vcpu_enter_exit+0x349>
02d6      596:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	599: R_X86_64_32S	.data+0x93160
02dd      59d:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	5a0: R_X86_64_32S	.rodata.str1.1+0xbfb63
02e4      5a4:	e8 00 00 00 00       	call   5a9 <vmx_vcpu_enter_exit+0x2e9>	5a5: R_X86_64_PLT32	___ratelimit-0x4
02e9      5a9:	85 c0                	test   %eax,%eax
02eb      5ab:	75 26                	jne    5d3 <vmx_vcpu_enter_exit+0x313>
02ed      5ad:	90                   	nop
02ee      5ae:	eb 09                	jmp    5b9 <vmx_vcpu_enter_exit+0x2f9>
02f0      5b0:	f3 0f 1e fa          	endbr64
02f4      5b4:	e8 00 00 00 00       	call   5b9 <vmx_vcpu_enter_exit+0x2f9>	5b5: R_X86_64_PLT32	kvm_spurious_fault-0x4
02f9      5b9:	31 c0                	xor    %eax,%eax
02fb      5bb:	e9 a1 fe ff ff       	jmp    461 <vmx_vcpu_enter_exit+0x1a1>
0300      5c0:	be 02 44 00 00       	mov    $0x4402,%esi
0305      5c5:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	5c8: R_X86_64_32S	.rodata+0x48a20
030c      5cc:	e8 00 00 00 00       	call   5d1 <vmx_vcpu_enter_exit+0x311>	5cd: R_X86_64_PLT32	_printk-0x4
0311      5d1:	eb 9a                	jmp    56d <vmx_vcpu_enter_exit+0x2ad>
0313      5d3:	be 04 44 00 00       	mov    $0x4404,%esi
0318      5d8:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	5db: R_X86_64_32S	.rodata+0x48a20
031f      5df:	e8 00 00 00 00       	call   5e4 <vmx_vcpu_enter_exit+0x324>	5e0: R_X86_64_PLT32	_printk-0x4
0324      5e4:	eb c7                	jmp    5ad <vmx_vcpu_enter_exit+0x2ed>
0326      5e6:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 5ed <vmx_vcpu_enter_exit+0x32d>	5e8: R_X86_64_PC32	.data.once+0x2b
032d      5ed:	90                   	nop
032e      5ee:	be 02 44 00 00       	mov    $0x4402,%esi
0333      5f3:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	5f6: R_X86_64_32S	.rodata+0x48980
033a      5fa:	e8 00 00 00 00       	call   5ff <vmx_vcpu_enter_exit+0x33f>	5fb: R_X86_64_PLT32	__warn_printk-0x4
033f      5ff:	90                   	nop
0340      600:	0f 0b                	ud2
0342      602:	90                   	nop
0343      603:	90                   	nop
0344      604:	e9 4d ff ff ff       	jmp    556 <vmx_vcpu_enter_exit+0x296>
0349      609:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 610 <vmx_vcpu_enter_exit+0x350>	60b: R_X86_64_PC32	.data.once+0x2b
0350      610:	90                   	nop
0351      611:	be 04 44 00 00       	mov    $0x4404,%esi
0356      616:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	619: R_X86_64_32S	.rodata+0x48980
035d      61d:	e8 00 00 00 00       	call   622 <vmx_vcpu_enter_exit+0x362>	61e: R_X86_64_PLT32	__warn_printk-0x4
0362      622:	90                   	nop
0363      623:	0f 0b                	ud2
0365      625:	90                   	nop
0366      626:	90                   	nop
0367      627:	e9 6a ff ff ff       	jmp    596 <vmx_vcpu_enter_exit+0x2d6>
036c      62c:	0f 1f 40 00          	nopl   0x0(%rax)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
