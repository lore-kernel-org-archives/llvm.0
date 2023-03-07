Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71AF190;
	Tue,  7 Mar 2023 02:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678156249; x=1709692249;
  h=date:from:cc:subject:message-id:mime-version;
  bh=QUCMvGUOH3jdnpmlE6VVRlbzd7r1bvwa/k6CVZMpVg0=;
  b=Zbkum9RJylR0/qw7nY5+REn16F5Q/tgCewO9pjDACOt79bhlrPaTDufH
   NR7JzKpeFMB6x7SQIVeLviCirO92/8LW67p5JgGYPnShs4OC+WbLjBXFB
   hwazwNWTBcxo8pAz5B084v0UV/0tEThSKTtNgu0vPEC68Z0gEvx0/yeDj
   t6w0wvQPOcOvT0rWLNKHpXJZbQ3KxMrpDlYcqqn1lpgDVR+I8HU8ZtXF0
   BkNr9TtcpCfRBV5rdT/SY2MLSM3McuktAY/Yn+pRd7NEt8LiIpyNA3rqG
   zF4zSqjiv7OGC4kURImToo9tBjP4TUM9EIe5QYQm36IKmmYi1oOSDw3p5
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="316145350"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="316145350"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 18:30:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="678752341"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="678752341"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 06 Mar 2023 18:30:47 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZN6E-0000sX-2S;
	Tue, 07 Mar 2023 02:30:46 +0000
Date: Tue, 7 Mar 2023 10:30:25 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [intel-tdx:guest-debug 2/4] vmlinux.o: warning: objtool:
 __halt+0x28: call to __trace_tdx_hypercall() leaves .noinstr.text section
Message-ID: <202303071026.rc7Jg3je-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
CC: Tony Luck <tony.luck@intel.com>
CC: Andi Kleen <ak@linux.intel.com>

tree:   https://github.com/intel/tdx.git guest-debug
head:   cd4562557ed3eaea18d74d9521791d7889c696aa
commit: 9499ad5bd6e897e4c11b974504973939f2d4730a [2/4] x86/tdx: Add TDCALL tracepoint
config: x86_64-randconfig-a011-20230306 (https://download.01.org/0day-ci/archive/20230307/202303071026.rc7Jg3je-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/9499ad5bd6e897e4c11b974504973939f2d4730a
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest-debug
        git checkout 9499ad5bd6e897e4c11b974504973939f2d4730a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303071026.rc7Jg3je-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: __rdgsbase_inactive+0x33: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __wrgsbase_inactive+0x37: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret+0x89: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: noist_exc_debug+0x45: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi+0x68: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: poke_int3_handler+0x3b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: native_sched_clock+0x68: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_machine_check+0x54: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_machine_check+0x59: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_check_crashing_cpu+0x10: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: pvclock_clocksource_read_nowd+0x8c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: local_clock+0x53: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: enter_from_user_mode+0x48: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode+0x51: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare+0x48: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter_from_user_mode+0x48: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_exit+0x40: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_enter+0x44: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_exit+0x4d: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: tdx_safe_halt+0x2b: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: __halt+0x28: call to __trace_tdx_hypercall() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mwait_idle+0x2b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_processor_ffh_cstate_enter+0x80: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: intel_idle+0x78: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: intel_idle_s2idle+0x84: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: intel_idle_irq+0x79: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: intel_idle_ibrs+0x7e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: intel_idle_xstate+0x7e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: poll_idle+0x49: call to ftrace_likely_update() leaves .noinstr.text section


objdump-func vmlinux.o __halt:
0000 00000000000000c0 <__halt>:
0000   c0:	48 83 ec 60          	sub    $0x60,%rsp
0004   c4:	89 fa                	mov    %edi,%edx
0006   c6:	48 89 e6             	mov    %rsp,%rsi
0009   c9:	b9 18 00 00 00       	mov    $0x18,%ecx
000e   ce:	31 c0                	xor    %eax,%eax
0010   d0:	48 89 f7             	mov    %rsi,%rdi
0013   d3:	f3 ab                	rep stos %eax,%es:(%rdi)
0015   d5:	48 c7 46 18 0c 00 00 00 	movq   $0xc,0x18(%rsi)
001d   dd:	89 d0                	mov    %edx,%eax
001f   df:	48 89 46 20          	mov    %rax,0x20(%rsi)
0023   e3:	48 89 f7             	mov    %rsi,%rdi
0026   e6:	31 f6                	xor    %esi,%esi
0028   e8:	e8 00 00 00 00       	call   ed <__halt+0x2d>	e9: R_X86_64_PLT32	.text+0x51ac
002d   ed:	48 83 c4 60          	add    $0x60,%rsp
0031   f1:	c3                   	ret
0032   f2:	cc                   	int3
0033   f3:	cc                   	int3
0034   f4:	cc                   	int3
0035   f5:	cc                   	int3
0036   f6:	cc                   	int3
0037   f7:	cc                   	int3
0038   f8:	cc                   	int3
0039   f9:	cc                   	int3
003a   fa:	cc                   	int3
003b   fb:	cc                   	int3
003c   fc:	cc                   	int3
003d   fd:	cc                   	int3
003e   fe:	cc                   	int3
003f   ff:	cc                   	int3

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
