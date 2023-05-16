Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90AF47494;
	Tue, 16 May 2023 05:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684215597; x=1715751597;
  h=date:from:cc:subject:message-id:mime-version;
  bh=OkVrnenMg0FTF4D0G4qE5H0gCNdq6NxX1L+xUp0SKk4=;
  b=Ic6Dy2wberYkhiEcFJjglYsDd3pZOyyUVwLlioV0DQfNB54Gkd3X5eR0
   IOC9/aGuCwvJsmFfL8HF1HjmPFiW+4gI+o9nLXBClKuDbKnqzeyOvsrr0
   ctPvuPdbAMm1npXTS8zWJhzflsteUH8tprUyolFo1+SWCBogsO0aSu3S3
   04o3S3VvPn9zoVwhHLR0EJudgyuZ5XCJ3+Z1N3/zR2RD7YyWAYcQC8kYW
   iByapfQ+XXVhQWN64KuvonUszzlve5T5lkr9fl9LH9MH9QuoJKXHN+nLI
   TKERWIC4g+YgMlnW07uQRunXlXMtFc/BuvR03sdO6rSPw95WURm57ZGEB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="348886972"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; 
   d="scan'208";a="348886972"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2023 22:39:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="813269334"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; 
   d="scan'208";a="813269334"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 15 May 2023 22:39:55 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pynPf-000712-0F;
	Tue, 16 May 2023 05:39:55 +0000
Date: Tue, 16 May 2023 13:39:20 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: Re: [RFC PATCH 3/3] irqflags: Warn on irq disable when disabled and
 enable when enabled
Message-ID: <202305161334.p58CST5Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In-Reply-To: <20230509110739.241735-4-npiggin@gmail.com>
References: <20230509110739.241735-4-npiggin@gmail.com>
TO: Nicholas Piggin <npiggin@gmail.com>

Hi Nicholas,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/timers/core]
[also build test WARNING on tip/locking/core linus/master v6.4-rc2 next-20230515]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nicholas-Piggin/hrtimer-balance-irq-save-restore/20230509-191049
base:   tip/timers/core
patch link:    https://lore.kernel.org/r/20230509110739.241735-4-npiggin%40gmail.com
patch subject: [RFC PATCH 3/3] irqflags: Warn on irq disable when disabled and enable when enabled
config: x86_64-randconfig-x085-20230515 (https://download.01.org/0day-ci/archive/20230516/202305161334.p58CST5Y-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d91910ca3451a1d633351e3492117ca62054eb92
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Nicholas-Piggin/hrtimer-balance-irq-save-restore/20230509-191049
        git checkout d91910ca3451a1d633351e3492117ca62054eb92
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305161334.p58CST5Y-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: ftrace_likely_update+0x112: call to __stack_chk_fail() with UACCESS enabled
   vmlinux.o: warning: objtool: __rdgsbase_inactive+0x33: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __wrgsbase_inactive+0x37: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret+0x9a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: noist_exc_debug+0x53: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi+0xe0: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: poke_int3_handler+0x3b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: native_sched_clock+0x7e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_machine_check+0xcd: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_machine_check+0x59: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_check_crashing_cpu+0x10: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: pvclock_clocksource_read_nowd+0x56: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: local_clock+0x56: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: enter_from_user_mode+0x48: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode+0x4e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare+0x4a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter_from_user_mode+0x48: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_exit+0x40: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_enter+0x44: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_exit+0x53: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: tdx_safe_halt+0x2b: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: default_idle+0x54: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mwait_idle+0x3d: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_processor_ffh_cstate_enter+0x80: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: cpu_idle_poll+0xbd: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: intel_idle+0x78: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: intel_idle_s2idle+0x86: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: intel_idle_irq+0x54: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: intel_idle_ibrs+0x7e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: intel_idle_xstate+0x7e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_idle_enter+0x3a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_idle_enter_s2idle+0x43: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: acpi_safe_halt+0x61: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: poll_idle+0x67: call to ftrace_likely_update() leaves .noinstr.text section


objdump-func vmlinux.o default_idle:
0000 0000000000000180 <default_idle>:
0000      180:	f3 0f 1e fa          	endbr64
0004      184:	53                   	push   %rbx
0005      185:	48 83 ec 10          	sub    $0x10,%rsp
0009      189:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
0012      192:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
0017      197:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0(%rip)        # 19e <default_idle+0x1e>	199: R_X86_64_PC32	mds_idle_clear-0x5
001e      19e:	7e 07                	jle    1a7 <default_idle+0x27>
0020      1a0:	0f 00 2d 00 00 00 00 	verw   0x0(%rip)        # 1a7 <default_idle+0x27>	1a3: R_X86_64_PC32	.rodata+0x3265c
0027      1a7:	fb                   	sti
0028      1a8:	f4                   	hlt
0029      1a9:	48 b8 aa aa aa aa aa aa aa aa 	movabs $0xaaaaaaaaaaaaaaaa,%rax
0033      1b3:	48 89 04 24          	mov    %rax,(%rsp)
0037      1b7:	9c                   	pushf
0038      1b8:	8f 04 24             	pop    (%rsp)
003b      1bb:	8b 1c 24             	mov    (%rsp),%ebx
003e      1be:	c1 eb 09             	shr    $0x9,%ebx
0041      1c1:	83 e3 01             	and    $0x1,%ebx
0044      1c4:	89 de                	mov    %ebx,%esi
0046      1c6:	83 f6 01             	xor    $0x1,%esi
0049      1c9:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1cc: R_X86_64_32S	_ftrace_annotated_branch+0xd7a0
0050      1d0:	31 d2                	xor    %edx,%edx
0052      1d2:	31 c9                	xor    %ecx,%ecx
0054      1d4:	e8 00 00 00 00       	call   1d9 <default_idle+0x59>	1d5: R_X86_64_PLT32	ftrace_likely_update-0x4
0059      1d9:	48 85 db             	test   %rbx,%rbx
005c      1dc:	75 05                	jne    1e3 <default_idle+0x63>
005e      1de:	e8 00 00 00 00       	call   1e3 <default_idle+0x63>	1df: R_X86_64_PLT32	warn_bogus_irq_disable-0x4
0063      1e3:	fa                   	cli
0064      1e4:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
006d      1ed:	48 3b 44 24 08       	cmp    0x8(%rsp),%rax
0072      1f2:	75 06                	jne    1fa <default_idle+0x7a>
0074      1f4:	48 83 c4 10          	add    $0x10,%rsp
0078      1f8:	5b                   	pop    %rbx
0079      1f9:	c3                   	ret
007a      1fa:	e8 00 00 00 00       	call   1ff <default_idle+0x7f>	1fb: R_X86_64_PLT32	__stack_chk_fail-0x4
007f      1ff:	90                   	nop

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
