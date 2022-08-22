Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7844369
	for <llvm@lists.linux.dev>; Mon, 22 Aug 2022 02:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661136747; x=1692672747;
  h=date:from:cc:subject:message-id:mime-version;
  bh=g5hWdDXmFVcBVhegmZvPEjPUy61T+K+FJ0evseqn6sE=;
  b=PvifStTIJSvlub25k0rN0KIbK/AsQnjvu9QJO0tSG9Au9ddxI8LY/Gvq
   novEvGopY9fPtR9RN82vv4NlaIl6FFXiaO+POFBu5Uha0To9LSVBJWvdr
   S5LX3WLh4CMzhC12tQ/fchSH5ATxOC/H7mMMsBLjjxdS5+7d2AY8DJe4a
   tcKTKoGk4UMCzaS6IMd+E415HmtHF9sE3SZRLs+/zzABH9Ga6B0VSeguS
   TxgDZNx4bzdIHnaYJJTOBXLokYFgKZW4i0lZO5jbAcAgBQk0LmLhS0OTh
   FKtyFvGrl3TnnN/7UkaLHnnWZV2wFubt5UrDbVQv6qMt/9F/W4E3kklHp
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10446"; a="379600109"
X-IronPort-AV: E=Sophos;i="5.93,254,1654585200"; 
   d="scan'208";a="379600109"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2022 19:52:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,254,1654585200"; 
   d="scan'208";a="677051488"
Received: from lkp-server01.sh.intel.com (HELO 44b6dac04a33) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 21 Aug 2022 19:52:26 -0700
Received: from kbuild by 44b6dac04a33 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oPxY9-0004qN-1t;
	Mon, 22 Aug 2022 02:52:25 +0000
Date: Mon, 22 Aug 2022 10:51:51 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: enter_from_user_mode+0x11b: call to
 __SCT__preempt_schedule() leaves .noinstr.text section
Message-ID: <202208221035.JagzmyMU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Frederic Weisbecker <frederic@kernel.org>
CC: "Paul E. McKenney" <paulmck@kernel.org>
CC: Nicolas Saenz Julienne <nsaenzju@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4daa6a81c07c54f989e70d682fa0bff568c14df0
commit: 171476775d32a40bfebf83250136c19b2e842672 context_tracking: Convert state to atomic_t
date:   7 weeks ago
config: x86_64-buildonly-randconfig-r001-20220822 (https://download.01.org/0day-ci/archive/20220822/202208221035.JagzmyMU-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=171476775d32a40bfebf83250136c19b2e842672
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 171476775d32a40bfebf83250136c19b2e842672
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: fixup_bad_iret+0x1e: call to memset() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: enter_from_user_mode+0x11b: call to __SCT__preempt_schedule() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: syscall_enter_from_user_mode+0x1e2: call to __SCT__preempt_schedule() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare+0x11e: call to __SCT__preempt_schedule() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: irqentry_enter_from_user_mode+0x11b: call to __SCT__preempt_schedule() leaves .noinstr.text section


objdump-func vmlinux.o enter_from_user_mode:
0000 0000000000003580 <enter_from_user_mode>:
0000     3580:	50                   	push   %rax
0001     3581:	48 c7 04 24 00 00 00 00 	movq   $0x0,(%rsp)
0009     3589:	9c                   	pushf
000a     358a:	8f 04 24             	pop    (%rsp)
000d     358d:	48 8b 04 24          	mov    (%rsp),%rax
0011     3591:	48 0f ba 25 00 00 00 00 34 	btq    $0x34,0x0(%rip)        # 359a <enter_from_user_mode+0x1a>	3595: R_X86_64_PC32	boot_cpu_data+0x33
001a     359a:	0f 82 b8 00 00 00    	jb     3658 <enter_from_user_mode+0xd8>
0020     35a0:	b9 00 44 00 00       	mov    $0x4400,%ecx
0025     35a5:	48 f7 05 00 00 00 00 00 00 01 00 	testq  $0x10000,0x0(%rip)        # 35b0 <enter_from_user_mode+0x30>	35a8: R_X86_64_PC32	boot_cpu_data+0x30
0030     35b0:	0f 85 a2 00 00 00    	jne    3658 <enter_from_user_mode+0xd8>
0036     35b6:	85 c1                	test   %eax,%ecx
0038     35b8:	0f 85 a7 00 00 00    	jne    3665 <enter_from_user_mode+0xe5>
003e     35be:	f6 87 88 00 00 00 03 	testb  $0x3,0x88(%rdi)
0045     35c5:	0f 84 ab 00 00 00    	je     3676 <enter_from_user_mode+0xf6>
004b     35cb:	65 48 8b 05 00 00 00 00 	mov    %gs:0x0(%rip),%rax        # 35d3 <enter_from_user_mode+0x53>	35cf: R_X86_64_PC32	cpu_current_top_of_stack-0x4
0053     35d3:	48 29 e0             	sub    %rsp,%rax
0056     35d6:	48 3d 00 40 00 00    	cmp    $0x4000,%rax
005c     35dc:	0f 83 9d 00 00 00    	jae    367f <enter_from_user_mode+0xff>
0062     35e2:	65 48 8b 05 00 00 00 00 	mov    %gs:0x0(%rip),%rax        # 35ea <enter_from_user_mode+0x6a>	35e6: R_X86_64_PC32	current_task-0x4
006a     35ea:	b9 58 3f 00 00       	mov    $0x3f58,%ecx
006f     35ef:	48 03 48 20          	add    0x20(%rax),%rcx
0073     35f3:	48 39 f9             	cmp    %rdi,%rcx
0076     35f6:	0f 85 8c 00 00 00    	jne    3688 <enter_from_user_mode+0x108>
007c     35fc:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0(%rip)        # 3603 <enter_from_user_mode+0x83>	35fe: R_X86_64_PC32	context_tracking_key-0x5
0083     3603:	7e 36                	jle    363b <enter_from_user_mode+0xbb>
0085     3605:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0(%rip)        # 360c <enter_from_user_mode+0x8c>	3607: R_X86_64_PC32	context_tracking_key-0x5
008c     360c:	7e 29                	jle    3637 <enter_from_user_mode+0xb7>
008e     360e:	65 ff 05 00 00 00 00 	incl   %gs:0x0(%rip)        # 3615 <enter_from_user_mode+0x95>	3611: R_X86_64_PC32	__preempt_count-0x4
0095     3615:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	3618: R_X86_64_32S	context_tracking+0x8
009c     361c:	65 48 03 05 00 00 00 00 	add    %gs:0x0(%rip),%rax        # 3624 <enter_from_user_mode+0xa4>	3620: R_X86_64_PC32	this_cpu_off-0x4
00a4     3624:	8b 00                	mov    (%rax),%eax
00a6     3626:	83 e0 03             	and    $0x3,%eax
00a9     3629:	65 ff 0d 00 00 00 00 	decl   %gs:0x0(%rip)        # 3630 <enter_from_user_mode+0xb0>	362c: R_X86_64_PC32	__preempt_count-0x4
00b0     3630:	74 69                	je     369b <enter_from_user_mode+0x11b>
00b2     3632:	83 f8 02             	cmp    $0x2,%eax
00b5     3635:	74 04                	je     363b <enter_from_user_mode+0xbb>
00b7     3637:	90                   	nop
00b8     3638:	0f 0b                	ud2
00ba     363a:	90                   	nop
00bb     363b:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0(%rip)        # 3642 <enter_from_user_mode+0xc2>	363d: R_X86_64_PC32	context_tracking_key-0x5
00c2     3642:	7e 0a                	jle    364e <enter_from_user_mode+0xce>
00c4     3644:	bf 02 00 00 00       	mov    $0x2,%edi
00c9     3649:	e8 00 00 00 00       	call   364e <enter_from_user_mode+0xce>	364a: R_X86_64_PLT32	__ct_user_exit-0x4
00ce     364e:	90                   	nop
00cf     364f:	90                   	nop
00d0     3650:	58                   	pop    %rax
00d1     3651:	31 c0                	xor    %eax,%eax
00d3     3653:	31 c9                	xor    %ecx,%ecx
00d5     3655:	31 ff                	xor    %edi,%edi
00d7     3657:	c3                   	ret
00d8     3658:	b9 00 44 04 00       	mov    $0x44400,%ecx
00dd     365d:	85 c1                	test   %eax,%ecx
00df     365f:	0f 84 59 ff ff ff    	je     35be <enter_from_user_mode+0x3e>
00e5     3665:	90                   	nop
00e6     3666:	0f 0b                	ud2
00e8     3668:	90                   	nop
00e9     3669:	f6 87 88 00 00 00 03 	testb  $0x3,0x88(%rdi)
00f0     3670:	0f 85 55 ff ff ff    	jne    35cb <enter_from_user_mode+0x4b>
00f6     3676:	90                   	nop
00f7     3677:	0f 0b                	ud2
00f9     3679:	90                   	nop
00fa     367a:	e9 4c ff ff ff       	jmp    35cb <enter_from_user_mode+0x4b>
00ff     367f:	90                   	nop
0100     3680:	0f 0b                	ud2
0102     3682:	90                   	nop
0103     3683:	e9 5a ff ff ff       	jmp    35e2 <enter_from_user_mode+0x62>
0108     3688:	90                   	nop
0109     3689:	0f 0b                	ud2
010b     368b:	90                   	nop
010c     368c:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0(%rip)        # 3693 <enter_from_user_mode+0x113>	368e: R_X86_64_PC32	context_tracking_key-0x5
0113     3693:	0f 8f 6c ff ff ff    	jg     3605 <enter_from_user_mode+0x85>
0119     3699:	eb a0                	jmp    363b <enter_from_user_mode+0xbb>
011b     369b:	e8 00 00 00 00       	call   36a0 <enter_from_user_mode+0x120>	369c: R_X86_64_PLT32	__SCT__preempt_schedule-0x4
0120     36a0:	83 f8 02             	cmp    $0x2,%eax
0123     36a3:	74 96                	je     363b <enter_from_user_mode+0xbb>
0125     36a5:	eb 90                	jmp    3637 <enter_from_user_mode+0xb7>
0127     36a7:	66 0f 1f 84 00 00 00 00 00 	nopw   0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
