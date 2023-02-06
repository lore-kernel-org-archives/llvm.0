Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45D91FC1;
	Mon,  6 Feb 2023 05:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675661879; x=1707197879;
  h=date:from:cc:subject:message-id:mime-version;
  bh=QMIqOe0B/lmaxZia/EGx2fsBoI86DhnKa+2GX+0ZPAo=;
  b=g/RxuM97JtiAlMx3RJ0auurbzv8Z9ib3nArXZ06w45rExzmzcS52oIag
   +4dYZYup3la2t2cHYmVhDiKlMqUtNZrRpaUymuC1W4+DL2a87b/IbDFh0
   /8FbpWc03o+fk3vMt8O9wQe8NNMBto66nUhpiQph/tWjmI+ONVsx3NjPu
   sGKeJYn8tj8FdCSSho/j0cMO+gZ9tjSNrPEKbwAhKnsjzbW8yyjZePNni
   PY8MQDjOS0XveBGTkQuC4RZ3Sjpjsd6FLxI+Gme7O9d9+Q4nu+QaX3pwt
   sbtnL0LQH9OI3uoPBuGPoOwJqpVMs2nOOJfryDb3241pL/hIRm5GNfcXW
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="329149241"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="329149241"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 21:37:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="790326391"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="790326391"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 05 Feb 2023 21:37:50 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOuCL-0002P8-0v;
	Mon, 06 Feb 2023 05:37:49 +0000
Date: Mon, 6 Feb 2023 13:37:39 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: __ct_user_exit+0x40: call to
 __kcsan_check_access() leaves .noinstr.text section
Message-ID: <202302061352.b25yPcAC-lkp@intel.com>
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

Hi Frederic,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2d11f342b179f1894a901f143ec7c008caba43e
commit: 171476775d32a40bfebf83250136c19b2e842672 context_tracking: Convert state to atomic_t
date:   7 months ago
config: x86_64-buildonly-randconfig-r006-20230206 (https://download.01.org/0day-ci/archive/20230206/202302061352.b25yPcAC-lkp@intel.com/config)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: __rdgsbase_inactive+0x34: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __wrgsbase_inactive+0x38: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret+0x37: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: noist_exc_debug+0x51: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi+0x33: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: poke_int3_handler+0x57: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_machine_check+0x63: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_machine_check+0x4d: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_check_crashing_cpu+0x2e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: enter_from_user_mode+0x5b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode+0x65: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare+0x5b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter_from_user_mode+0x5b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_exit+0x3e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_enter+0x4b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_exit+0x5f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_exit_state+0x27: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_nmi_enter+0x34: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_enter_state+0x27: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_idle_enter+0x14: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_exit+0x47: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_enter+0x2d: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_irq_enter+0x34: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_irq_exit+0x34: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __ct_user_enter+0x4d: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: context_tracking_recursion_enter+0x2d: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: __ct_user_exit+0x40: call to __kcsan_check_access() leaves .noinstr.text section


objdump-func vmlinux.o __ct_user_exit:
0000 0000000000006780 <__ct_user_exit>:
0000     6780:	55                   	push   %rbp
0001     6781:	48 89 e5             	mov    %rsp,%rbp
0004     6784:	41 57                	push   %r15
0006     6786:	41 56                	push   %r14
0008     6788:	53                   	push   %rbx
0009     6789:	49 c7 c7 00 00 00 00 	mov    $0x0,%r15	678c: R_X86_64_32S	context_tracking
0010     6790:	41 89 fe             	mov    %edi,%r14d
0013     6793:	65 4c 03 3d 00 00 00 00 	add    %gs:0x0(%rip),%r15        # 679b <__ct_user_exit+0x1b>	6797: R_X86_64_PC32	this_cpu_off-0x4
001b     679b:	e8 60 ff ff ff       	call   6700 <context_tracking_recursion_enter>
0020     67a0:	84 c0                	test   %al,%al
0022     67a2:	74 7d                	je     6821 <__ct_user_exit+0xa1>
0024     67a4:	48 c7 c3 00 00 00 00 	mov    $0x0,%rbx	67a7: R_X86_64_32S	context_tracking+0x8
002b     67ab:	be 04 00 00 00       	mov    $0x4,%esi
0030     67b0:	ba 04 00 00 00       	mov    $0x4,%edx
0035     67b5:	65 48 03 1d 00 00 00 00 	add    %gs:0x0(%rip),%rbx        # 67bd <__ct_user_exit+0x3d>	67b9: R_X86_64_PC32	this_cpu_off-0x4
003d     67bd:	48 89 df             	mov    %rbx,%rdi
0040     67c0:	e8 00 00 00 00       	call   67c5 <__ct_user_exit+0x45>	67c1: R_X86_64_PLT32	__kcsan_check_access-0x4
0045     67c5:	8b 03                	mov    (%rbx),%eax
0047     67c7:	83 e0 03             	and    $0x3,%eax
004a     67ca:	44 39 f0             	cmp    %r14d,%eax
004d     67cd:	75 4b                	jne    681a <__ct_user_exit+0x9a>
004f     67cf:	41 80 3f 00          	cmpb   $0x0,(%r15)
0053     67d3:	74 2a                	je     67ff <__ct_user_exit+0x7f>
0055     67d5:	bf 04 00 00 00       	mov    $0x4,%edi
005a     67da:	44 29 f7             	sub    %r14d,%edi
005d     67dd:	e8 1e fc ff ff       	call   6400 <ct_kernel_enter>
0062     67e2:	41 83 fe 02          	cmp    $0x2,%r14d
0066     67e6:	75 32                	jne    681a <__ct_user_exit+0x9a>
0068     67e8:	90                   	nop
0069     67e9:	65 48 8b 3c 25 00 00 00 00 	mov    %gs:0x0,%rdi	67ee: R_X86_64_32S	current_task
0072     67f2:	e8 00 00 00 00       	call   67f7 <__ct_user_exit+0x77>	67f3: R_X86_64_PLT32	vtime_user_exit-0x4
0077     67f7:	e8 00 00 00 00       	call   67fc <__ct_user_exit+0x7c>	67f8: R_X86_64_PLT32	.text+0x3a303c
007c     67fc:	90                   	nop
007d     67fd:	eb 1b                	jmp    681a <__ct_user_exit+0x9a>
007f     67ff:	4c 89 ff             	mov    %r15,%rdi
0082     6802:	be 04 00 00 00       	mov    $0x4,%esi
0087     6807:	ba 07 00 00 00       	mov    $0x7,%edx
008c     680c:	48 83 c7 08          	add    $0x8,%rdi
0090     6810:	e8 00 00 00 00       	call   6815 <__ct_user_exit+0x95>	6811: R_X86_64_PLT32	__kcsan_check_access-0x4
0095     6815:	f0 45 29 77 08       	lock sub %r14d,0x8(%r15)
009a     681a:	65 ff 0d 00 00 00 00 	decl   %gs:0x0(%rip)        # 6821 <__ct_user_exit+0xa1>	681d: R_X86_64_PC32	context_tracking
00a1     6821:	5b                   	pop    %rbx
00a2     6822:	41 5e                	pop    %r14
00a4     6824:	41 5f                	pop    %r15
00a6     6826:	5d                   	pop    %rbp
00a7     6827:	c3                   	ret
00a8     6828:	cc                   	int3
00a9     6829:	cc                   	int3
00aa     682a:	cc                   	int3
00ab     682b:	cc                   	int3
00ac     682c:	cc                   	int3
00ad     682d:	cc                   	int3
00ae     682e:	cc                   	int3
00af     682f:	cc                   	int3

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
