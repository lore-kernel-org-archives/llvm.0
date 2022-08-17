Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B34E7C
	for <llvm@lists.linux.dev>; Wed, 17 Aug 2022 00:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660695066; x=1692231066;
  h=date:from:cc:subject:message-id:mime-version;
  bh=bvPWONBRB8NhITIv1Q0w6IkTr3sFBOQQL8YDYnpzrvE=;
  b=ChJLmDrkQNVais0XzWRrbcGhMNWbkSNWep7IiRRKi+gNJmb6SZ1OR9i7
   kAKBs97baDjsKYiYcR29l6IlW4lC8BTOYygDHaX4rAN7um2KwrJ8uFqtT
   O29GbSECU+NUaZuVE7z2l5zoyaY8yd4heP8qTKX8nn6TF1jdJHtz8KCZ8
   obAhaV9Fq4f9gJ/+i0tOqhIm1FP5NZOgh3HsirRvZdlO2hkFl7fMlr6Q+
   cZnmkHcng25PAur9vz3Ylu3NfytN3BVs8lDucQZocB7SH1QRoMhmG6GA7
   Qimadao/ymbsStBDmeh5ZKCDFvoc0jYOw8Kmej9SduIdMhpCvTwt7beWI
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10441"; a="279322309"
X-IronPort-AV: E=Sophos;i="5.93,242,1654585200"; 
   d="scan'208";a="279322309"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2022 17:11:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,242,1654585200"; 
   d="scan'208";a="935127632"
Received: from lkp-server02.sh.intel.com (HELO 81d7e1ade3ba) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 16 Aug 2022 17:11:04 -0700
Received: from kbuild by 81d7e1ade3ba with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oO6eG-0000M8-0P;
	Wed, 17 Aug 2022 00:11:04 +0000
Date: Wed, 17 Aug 2022 08:10:07 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: irqentry_nmi_exit+0x30: call to
 ct_nmi_exit() leaves .noinstr.text section
Message-ID: <202208170814.LaMKmosu-lkp@intel.com>
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
head:   3cc40a443a04d52b0c95255dce264068b01e9bfe
commit: 493c1822825f00025d6754ec0632990a27edc6f8 context_tracking: Take NMI eqs entrypoints over RCU
date:   6 weeks ago
config: x86_64-randconfig-a012-20220815 (https://download.01.org/0day-ci/archive/20220817/202208170814.LaMKmosu-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project aed5e3bea138ce581d682158eb61c27b3cfdd6ec)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=493c1822825f00025d6754ec0632990a27edc6f8
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 493c1822825f00025d6754ec0632990a27edc6f8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: sync_regs+0x23: call to memcpy() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret+0x22: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi+0xc: call to sev_es_nmi_complete() leaves .noinstr.text section
   vmlinux.o: warning: objtool: default_do_nmi+0x10: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_rdmsrl+0x7: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_wrmsrl+0x7: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_machine_check+0x7c5: call to pentium_machine_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: kvm_read_and_reset_apf_flags+0x5: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: lockdep_hardirqs_on+0xa6: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: lockdep_hardirqs_off+0xa3: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_exit+0x6e: call to ct_irq_exit() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_enter+0x63: call to __this_cpu_preempt_check() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: irqentry_nmi_exit+0x30: call to ct_nmi_exit() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __ct_user_enter+0x29: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: context_tracking_recursion_enter+0x1: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __ct_user_exit+0x10: call to __this_cpu_preempt_check() leaves .noinstr.text section


objdump-func vmlinux.o irqentry_nmi_exit:
0000 0000000000006380 <irqentry_nmi_exit>:
0000     6380:	f3 0f 1e fa          	endbr64
0004     6384:	53                   	push   %rbx
0005     6385:	89 f3                	mov    %esi,%ebx
0007     6387:	90                   	nop
0008     6388:	e8 00 00 00 00       	call   638d <irqentry_nmi_exit+0xd>	6389: R_X86_64_PLT32	.text+0x359cfc
000d     638d:	f6 c3 01             	test   $0x1,%bl
0010     6390:	75 13                	jne    63a5 <irqentry_nmi_exit+0x25>
0012     6392:	90                   	nop
0013     6393:	e8 00 00 00 00       	call   6398 <irqentry_nmi_exit+0x18>	6394: R_X86_64_PLT32	.text+0x359d3c
0018     6398:	e8 00 00 00 00       	call   639d <irqentry_nmi_exit+0x1d>	6399: R_X86_64_PLT32	.text+0x359c3c
001d     639d:	ff 0d 00 00 00 00    	decl   0x0(%rip)        # 63a3 <irqentry_nmi_exit+0x23>	639f: R_X86_64_PC32	hardirq_context-0x4
0023     63a3:	eb 25                	jmp    63ca <irqentry_nmi_exit+0x4a>
0025     63a5:	e8 00 00 00 00       	call   63aa <irqentry_nmi_exit+0x2a>	63a6: R_X86_64_PLT32	trace_hardirqs_on_prepare-0x4
002a     63aa:	e8 00 00 00 00       	call   63af <irqentry_nmi_exit+0x2f>	63ab: R_X86_64_PLT32	lockdep_hardirqs_on_prepare-0x4
002f     63af:	90                   	nop
0030     63b0:	e8 00 00 00 00       	call   63b5 <irqentry_nmi_exit+0x35>	63b1: R_X86_64_PLT32	.text+0x359d3c
0035     63b5:	e8 00 00 00 00       	call   63ba <irqentry_nmi_exit+0x3a>	63b6: R_X86_64_PLT32	.text+0x359c3c
003a     63ba:	ff 0d 00 00 00 00    	decl   0x0(%rip)        # 63c0 <irqentry_nmi_exit+0x40>	63bc: R_X86_64_PC32	hardirq_context-0x4
0040     63c0:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
0045     63c5:	e8 00 00 00 00       	call   63ca <irqentry_nmi_exit+0x4a>	63c6: R_X86_64_PLT32	lockdep_hardirqs_on-0x4
004a     63ca:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 63d1 <irqentry_nmi_exit+0x51>	63cd: R_X86_64_PC32	.bss+0xd5314c
0051     63d1:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 63d7 <irqentry_nmi_exit+0x57>	63d3: R_X86_64_PC32	__preempt_count-0x4
0057     63d7:	a9 00 00 f0 00       	test   $0xf00000,%eax
005c     63dc:	74 3a                	je     6418 <irqentry_nmi_exit+0x98>
005e     63de:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 63e5 <irqentry_nmi_exit+0x65>	63e1: R_X86_64_PC32	.bss+0xd531ec
0065     63e5:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 63ec <irqentry_nmi_exit+0x6c>	63e8: R_X86_64_PC32	.bss+0xd531f4
006c     63ec:	81 05 00 00 00 00 00 00 ef ff 	addl   $0xffef0000,0x0(%rip)        # 63f6 <irqentry_nmi_exit+0x76>	63ee: R_X86_64_PC32	__preempt_count-0x8
0076     63f6:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 63fd <irqentry_nmi_exit+0x7d>	63f9: R_X86_64_PC32	.bss+0xd53214
007d     63fd:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 6404 <irqentry_nmi_exit+0x84>	6400: R_X86_64_PC32	.bss+0xd5317c
0084     6404:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 640b <irqentry_nmi_exit+0x8b>	6407: R_X86_64_PC32	current_task-0x4
008b     640b:	81 80 ac 08 00 00 00 00 ff ff 	addl   $0xffff0000,0x8ac(%rax)
0095     6415:	5b                   	pop    %rbx
0096     6416:	c3                   	ret
0097     6417:	cc                   	int3
0098     6418:	90                   	nop
0099     6419:	0f 0b                	ud2
009b     641b:	cc                   	int3
009c     641c:	cc                   	int3
009d     641d:	cc                   	int3
009e     641e:	cc                   	int3
009f     641f:	cc                   	int3
00a0     6420:	cc                   	int3
00a1     6421:	cc                   	int3
00a2     6422:	cc                   	int3
00a3     6423:	cc                   	int3
00a4     6424:	cc                   	int3
00a5     6425:	cc                   	int3
00a6     6426:	cc                   	int3
00a7     6427:	cc                   	int3
00a8     6428:	cc                   	int3
00a9     6429:	cc                   	int3
00aa     642a:	cc                   	int3
00ab     642b:	cc                   	int3
00ac     642c:	cc                   	int3
00ad     642d:	cc                   	int3
00ae     642e:	cc                   	int3
00af     642f:	cc                   	int3
00b0     6430:	cc                   	int3
00b1     6431:	cc                   	int3
00b2     6432:	cc                   	int3
00b3     6433:	cc                   	int3
00b4     6434:	cc                   	int3
00b5     6435:	cc                   	int3
00b6     6436:	cc                   	int3
00b7     6437:	cc                   	int3
00b8     6438:	cc                   	int3
00b9     6439:	cc                   	int3
00ba     643a:	cc                   	int3
00bb     643b:	cc                   	int3
00bc     643c:	cc                   	int3
00bd     643d:	cc                   	int3
00be     643e:	cc                   	int3
00bf     643f:	cc                   	int3

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
