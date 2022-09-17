Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3B6365
	for <llvm@lists.linux.dev>; Sat, 17 Sep 2022 06:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663396188; x=1694932188;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PFmSYqA1sRRRmagozgpP7O81ayKFX6TIQr4XKJqeANg=;
  b=govUbWYS+MZ21oQLtIEvY5S2NWMCa+3ORJPr31CshOV+YP0gIe6Woj9+
   GsBw9DidMbohsgHuJs6GF2djnyd9Saan5R06QfwtH0oJFQWVsuKnSLhEC
   alt0AavubyGTA+t3HVZb7m59zJdiWnurmvE5FM6H2uOwdo1hmn0A0hM/Z
   6JnxIjUUIsvGL8wvdwYxgdhxrB//6KiARRN7kP82KkQObHPkDIsLYVWMM
   OehFYYKNdZKXpTICyvmzihjDjn27KgPHMdqiNBfsS7K4ilN2J2lklBQK2
   k4hw5aSi9ZmtZOBUSvTtBD/8gBDGc0Z5FgD/1IS2kHr8PBZ2mMIjjAv5t
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10472"; a="282157422"
X-IronPort-AV: E=Sophos;i="5.93,322,1654585200"; 
   d="scan'208";a="282157422"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2022 23:29:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,322,1654585200"; 
   d="scan'208";a="686386089"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 16 Sep 2022 23:29:46 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oZRKk-00004B-0c;
	Sat, 17 Sep 2022 06:29:46 +0000
Date: Sat, 17 Sep 2022 14:29:18 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [peterz-queue:sched/idle 19/39] vmlinux.o: warning: objtool:
 fpu_idle_fpregs+0x41: call to __this_cpu_preempt_check() leaves
 .noinstr.text section
Message-ID: <202209171417.u0nFD51e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/idle
head:   86ceee2551e6a63a16f2d0f9d19d2685d06ad31f
commit: 78d81ae0773af0d4dc84c40a81c444a34c27231d [19/39] cpuidle,intel_idle: Fix CPUIDLE_FLAG_INIT_XSTATE
config: x86_64-randconfig-a016 (https://download.01.org/0day-ci/archive/20220917/202209171417.u0nFD51e-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=78d81ae0773af0d4dc84c40a81c444a34c27231d
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue sched/idle
        git checkout 78d81ae0773af0d4dc84c40a81c444a34c27231d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: fixup_bad_iret+0x1e: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: in_entry_stack+0x9: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi+0x8: call to sev_es_nmi_complete() leaves .noinstr.text section
   vmlinux.o: warning: objtool: default_do_nmi+0x10: call to __this_cpu_preempt_check() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: fpu_idle_fpregs+0x41: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: kvm_read_and_reset_apf_flags+0x1: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: lockdep_hardirqs_on+0xb0: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: lockdep_hardirqs_off+0xae: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_enter+0x69: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_exit+0x32: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mwait_idle+0x1: call to current_set_polling_and_test() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_processor_ffh_cstate_enter+0x9: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: intel_idle_ibrs+0x26: call to spec_ctrl_current() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_idle_enter+0x43: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_idle_enter_s2idle+0x45: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_idle_do_entry+0x4: call to perf_lopwr_cb() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_safe_halt+0x11: call to test_ti_thread_flag() leaves .noinstr.text section
   vmlinux.o: warning: objtool: io_idle+0x3: call to __inb() leaves .noinstr.text section


objdump-func vmlinux.o fpu_idle_fpregs:
0000 0000000000002a40 <fpu_idle_fpregs>:
0000     2a40:	e9 00 00 00 00       	jmp    2a45 <fpu_idle_fpregs+0x5>	2a41: R_X86_64_PLT32	.altinstr_aux+0x554
0005     2a45:	48 83 05 00 00 00 00 01 	addq   $0x1,0x0(%rip)        # 2a4d <fpu_idle_fpregs+0xd>	2a48: R_X86_64_PC32	.bss+0x255bb
000d     2a4d:	48 83 05 00 00 00 00 01 	addq   $0x1,0x0(%rip)        # 2a55 <fpu_idle_fpregs+0x15>	2a50: R_X86_64_PC32	.bss+0x255c3
0015     2a55:	48 83 05 00 00 00 00 01 	addq   $0x1,0x0(%rip)        # 2a5d <fpu_idle_fpregs+0x1d>	2a58: R_X86_64_PC32	.bss+0x25d0b
001d     2a5d:	48 83 05 00 00 00 00 01 	addq   $0x1,0x0(%rip)        # 2a65 <fpu_idle_fpregs+0x25>	2a60: R_X86_64_PC32	.bss+0x2601b
0025     2a65:	b9 01 00 00 00       	mov    $0x1,%ecx
002a     2a6a:	0f 01 d0             	xgetbv
002d     2a6d:	a9 00 00 06 00       	test   $0x60000,%eax
0032     2a72:	74 1e                	je     2a92 <fpu_idle_fpregs+0x52>
0034     2a74:	48 83 05 00 00 00 00 01 	addq   $0x1,0x0(%rip)        # 2a7c <fpu_idle_fpregs+0x3c>	2a77: R_X86_64_PC32	.bss+0x25d13
003c     2a7c:	c4 e2 78 49 c0       	tilerelease
0041     2a81:	e8 00 00 00 00       	call   2a86 <fpu_idle_fpregs+0x46>	2a82: R_X86_64_PLT32	.text+0x8e47c
0046     2a86:	65 48 c7 05 00 00 00 00 00 00 00 00 	movq   $0x0,%gs:0x0(%rip)        # 2a92 <fpu_idle_fpregs+0x52>	2a8a: R_X86_64_PC32	fpu_fpregs_owner_ctx-0x8
0052     2a92:	c3                   	ret
0053     2a93:	48 83 05 00 00 00 00 01 	addq   $0x1,0x0(%rip)        # 2a9b <fpu_idle_fpregs+0x5b>	2a96: R_X86_64_PC32	.bss+0x255cb
005b     2a9b:	c3                   	ret
005c     2a9c:	cc                   	int3
005d     2a9d:	cc                   	int3
005e     2a9e:	cc                   	int3
005f     2a9f:	cc                   	int3
0060     2aa0:	cc                   	int3
0061     2aa1:	cc                   	int3
0062     2aa2:	cc                   	int3
0063     2aa3:	cc                   	int3
0064     2aa4:	cc                   	int3
0065     2aa5:	cc                   	int3
0066     2aa6:	cc                   	int3
0067     2aa7:	cc                   	int3
0068     2aa8:	cc                   	int3
0069     2aa9:	cc                   	int3
006a     2aaa:	cc                   	int3
006b     2aab:	cc                   	int3
006c     2aac:	cc                   	int3
006d     2aad:	cc                   	int3
006e     2aae:	cc                   	int3
006f     2aaf:	cc                   	int3
0070     2ab0:	cc                   	int3
0071     2ab1:	cc                   	int3
0072     2ab2:	cc                   	int3
0073     2ab3:	cc                   	int3
0074     2ab4:	cc                   	int3
0075     2ab5:	cc                   	int3
0076     2ab6:	cc                   	int3
0077     2ab7:	cc                   	int3
0078     2ab8:	cc                   	int3
0079     2ab9:	cc                   	int3
007a     2aba:	cc                   	int3
007b     2abb:	cc                   	int3
007c     2abc:	cc                   	int3
007d     2abd:	cc                   	int3
007e     2abe:	cc                   	int3
007f     2abf:	cc                   	int3

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
