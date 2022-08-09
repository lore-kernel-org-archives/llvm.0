Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCE2443C
	for <llvm@lists.linux.dev>; Tue,  9 Aug 2022 16:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660064155; x=1691600155;
  h=date:from:cc:subject:message-id:mime-version;
  bh=ynBRoJEhifv8BvqJioJrEPgVB91XGb+I2OLEYFIjlDQ=;
  b=iruDZyn55CxDi8Qtr7jBmPYgA5SyNk3BBlEf/y7kG42JHSs8kiqHeiEq
   mbpGp97AVzpKysaXk0yh2tz0Oko4juuIOn4HrsDFcUgjJwLjMAyNodnaF
   jMJL/7QePT7tb2/sBCTqFyQ6Nm1eTQQelUHEY7E+eWsiO4JWPk1T1jKHT
   8LQmJ8+JBQqSM+Dx8pOo2kveyD1HeN6pIyUyeLG0SgxxuDjE43rxAARS2
   HkICARg7tnOFmID77O3LtR8ZIa/XXCuuRMkfuEylQVMugtPMheSRoyLuV
   G3uloSxqw90Exn2sNMo4ONjUQ8btSN9Rx8pSLl3Mjv04dfKDZGqDnq3kG
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10434"; a="290887349"
X-IronPort-AV: E=Sophos;i="5.93,225,1654585200"; 
   d="scan'208";a="290887349"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2022 09:55:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,225,1654585200"; 
   d="scan'208";a="555411701"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 09 Aug 2022 09:55:53 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oLSWG-000N5p-1x;
	Tue, 09 Aug 2022 16:55:52 +0000
Date: Wed, 10 Aug 2022 00:55:36 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: __ct_user_enter+0xab: call to
 __kasan_check_write() leaves .noinstr.text section
Message-ID: <202208100038.LXwKpqxg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: "Paul E. McKenney" <paulmck@kernel.org>
CC: Marco Elver <elver@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   eb555cb5b794f4e12a9897f3d46d5a72104cd4a7
commit: 1dcaa3b462265f688613163a1562a65ee53a3311 context_tracking: Use arch_atomic_read() in __ct_state for KASAN
date:   5 weeks ago
config: x86_64-randconfig-r021-20220808 (https://download.01.org/0day-ci/archive/20220810/202208100038.LXwKpqxg-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e2cc5a3c07cbc2412e851a7283c1841f520)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1dcaa3b462265f688613163a1562a65ee53a3311
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 1dcaa3b462265f688613163a1562a65ee53a3311
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: sync_regs+0x24: call to memcpy() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret+0x36: call to memset() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: __ct_user_enter+0xab: call to __kasan_check_write() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __ct_user_exit+0x75: call to __kasan_check_write() leaves .noinstr.text section


objdump-func vmlinux.o __ct_user_enter:
0000 0000000000003ca2 <__ct_user_enter>:
0000     3ca2:	55                   	push   %rbp
0001     3ca3:	48 89 e5             	mov    %rsp,%rbp
0004     3ca6:	41 57                	push   %r15
0006     3ca8:	41 56                	push   %r14
0008     3caa:	53                   	push   %rbx
0009     3cab:	41 89 fe             	mov    %edi,%r14d
000c     3cae:	48 c7 c3 00 00 00 00 	mov    $0x0,%rbx	3cb1: R_X86_64_32S	context_tracking
0013     3cb5:	65 48 03 1d 00 00 00 00 	add    %gs:0x0(%rip),%rbx        # 3cbd <__ct_user_enter+0x1b>	3cb9: R_X86_64_PC32	this_cpu_off-0x4
001b     3cbd:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0(%rip)        # 3cc4 <__ct_user_enter+0x22>	3cbf: R_X86_64_PC32	debug_locks-0x5
0022     3cc4:	74 1a                	je     3ce0 <__ct_user_enter+0x3e>
0024     3cc6:	65 8b 05 00 00 00 00 	mov    %gs:0x0(%rip),%eax        # 3ccd <__ct_user_enter+0x2b>	3cc9: R_X86_64_PC32	lockdep_recursion-0x4
002b     3ccd:	85 c0                	test   %eax,%eax
002d     3ccf:	75 0f                	jne    3ce0 <__ct_user_enter+0x3e>
002f     3cd1:	65 8b 05 00 00 00 00 	mov    %gs:0x0(%rip),%eax        # 3cd8 <__ct_user_enter+0x36>	3cd4: R_X86_64_PC32	hardirqs_enabled-0x4
0036     3cd8:	85 c0                	test   %eax,%eax
0038     3cda:	0f 85 8c 00 00 00    	jne    3d6c <__ct_user_enter+0xca>
003e     3ce0:	65 4c 8b 3d 00 00 00 00 	mov    %gs:0x0(%rip),%r15        # 3ce8 <__ct_user_enter+0x46>	3ce4: R_X86_64_PC32	current_task-0x4
0046     3ce8:	49 83 bf 80 12 00 00 00 	cmpq   $0x0,0x1280(%r15)
004e     3cf0:	74 74                	je     3d66 <__ct_user_enter+0xc4>
0050     3cf2:	e8 7e 00 00 00       	call   3d75 <context_tracking_recursion_enter>
0055     3cf7:	84 c0                	test   %al,%al
0057     3cf9:	74 63                	je     3d5e <__ct_user_enter+0xbc>
0059     3cfb:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	3cfe: R_X86_64_32S	context_tracking+0x8
0060     3d02:	65 48 03 05 00 00 00 00 	add    %gs:0x0(%rip),%rax        # 3d0a <__ct_user_enter+0x68>	3d06: R_X86_64_PC32	this_cpu_off-0x4
0068     3d0a:	8b 00                	mov    (%rax),%eax
006a     3d0c:	83 e0 03             	and    $0x3,%eax
006d     3d0f:	44 39 f0             	cmp    %r14d,%eax
0070     3d12:	74 43                	je     3d57 <__ct_user_enter+0xb5>
0072     3d14:	80 3b 00             	cmpb   $0x0,(%rbx)
0075     3d17:	74 28                	je     3d41 <__ct_user_enter+0x9f>
0077     3d19:	41 83 fe 02          	cmp    $0x2,%r14d
007b     3d1d:	75 0f                	jne    3d2e <__ct_user_enter+0x8c>
007d     3d1f:	90                   	nop
007e     3d20:	e8 00 00 00 00       	call   3d25 <__ct_user_enter+0x83>	3d21: R_X86_64_PLT32	.text+0x55894a
0083     3d25:	4c 89 ff             	mov    %r15,%rdi
0086     3d28:	e8 00 00 00 00       	call   3d2d <__ct_user_enter+0x8b>	3d29: R_X86_64_PLT32	vtime_user_enter-0x4
008b     3d2d:	90                   	nop
008c     3d2e:	e8 00 00 00 00       	call   3d33 <__ct_user_enter+0x91>	3d2f: R_X86_64_PLT32	rcu_irq_work_resched-0x4
0091     3d33:	41 83 c6 04          	add    $0x4,%r14d
0095     3d37:	44 89 f7             	mov    %r14d,%edi
0098     3d3a:	e8 a6 fc ff ff       	call   39e5 <ct_kernel_exit>
009d     3d3f:	eb 16                	jmp    3d57 <__ct_user_enter+0xb5>
009f     3d41:	48 89 df             	mov    %rbx,%rdi
00a2     3d44:	48 83 c7 08          	add    $0x8,%rdi
00a6     3d48:	be 04 00 00 00       	mov    $0x4,%esi
00ab     3d4d:	e8 00 00 00 00       	call   3d52 <__ct_user_enter+0xb0>	3d4e: R_X86_64_PLT32	__kasan_check_write-0x4
00b0     3d52:	f0 44 01 73 08       	lock add %r14d,0x8(%rbx)
00b5     3d57:	65 ff 0d 00 00 00 00 	decl   %gs:0x0(%rip)        # 3d5e <__ct_user_enter+0xbc>	3d5a: R_X86_64_PC32	context_tracking
00bc     3d5e:	5b                   	pop    %rbx
00bd     3d5f:	41 5e                	pop    %r14
00bf     3d61:	41 5f                	pop    %r15
00c1     3d63:	5d                   	pop    %rbp
00c2     3d64:	c3                   	ret    
00c3     3d65:	cc                   	int3   
00c4     3d66:	90                   	nop
00c5     3d67:	0f 0b                	ud2    
00c7     3d69:	90                   	nop
00c8     3d6a:	eb 86                	jmp    3cf2 <__ct_user_enter+0x50>
00ca     3d6c:	90                   	nop
00cb     3d6d:	0f 0b                	ud2    
00cd     3d6f:	90                   	nop
00ce     3d70:	e9 6b ff ff ff       	jmp    3ce0 <__ct_user_enter+0x3e>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
