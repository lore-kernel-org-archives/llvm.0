Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24177A
	for <llvm@lists.linux.dev>; Tue,  9 Aug 2022 05:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660023823; x=1691559823;
  h=date:from:cc:subject:message-id:mime-version;
  bh=punBtQKVeEytlPlGdkpTPxFaBHnVt5dHmKOY/2+Kpk4=;
  b=IwYwIXzf72oHxPEXGVgGLv1XR6r7/Cr8lbZouotSdUXKPvfmRuSBd60H
   1r9PK5lMbLxirmitn1rYfW5++o4aqxv/A2JwXuZP247DYpkLFOwIJZBYc
   jOhBBnPOUGYqy3z171fQ9CXE25j8P8Dv0Mh7xe6iajbzG72TizzDcrY7K
   P9pW9OURdkdQR99BKyLkhTyIS91UUVAdWvCNE2mRqPmatnhUIlJcq65JV
   2MBc4tmUKRh1P114A16mGR36CzBflgRZjo9/qDMU+UE405mOocwDvBtvT
   vvdHMlVXgchvKHsqTa9tWFoeWuf+STZpIPy/UGodzFChkKwsUbpuIngjO
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10433"; a="352489747"
X-IronPort-AV: E=Sophos;i="5.93,223,1654585200"; 
   d="scan'208";a="352489747"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2022 22:43:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,223,1654585200"; 
   d="scan'208";a="633199108"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 08 Aug 2022 22:43:42 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oLI1l-000MmL-1f;
	Tue, 09 Aug 2022 05:43:41 +0000
Date: Tue, 9 Aug 2022 13:42:51 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: ct_irq_enter+0x39: call to
 ftrace_likely_update() leaves .noinstr.text section
Message-ID: <202208091334.7tJ5hj6V-lkp@intel.com>
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
head:   eb555cb5b794f4e12a9897f3d46d5a72104cd4a7
commit: 3864caafe7c66f01b188ffccb6a4215f3bf56292 rcu/context-tracking: Remove rcu_irq_enter/exit()
date:   5 weeks ago
config: x86_64-randconfig-a014-20220808 (https://download.01.org/0day-ci/archive/20220809/202208091334.7tJ5hj6V-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e2cc5a3c07cbc2412e851a7283c1841f520)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3864caafe7c66f01b188ffccb6a4215f3bf56292
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 3864caafe7c66f01b188ffccb6a4215f3bf56292
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: kvm_spurious_fault+0x1c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: vmx_update_host_rsp+0x31: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: vmx_vcpu_enter_exit+0x1c3: call to do_trace_write_msr() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __rdgsbase_inactive+0x39: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __wrgsbase_inactive+0x3e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: sync_regs+0x24: call to memcpy() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret+0x36: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: noist_exc_debug+0x54: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi+0x33: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: poke_int3_handler+0x56: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_machine_check+0xbe: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_machine_check+0x54: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_check_crashing_cpu+0x2e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_idle_enter+0x14: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_eqs_enter+0x41: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_dynticks_eqs_enter+0x1e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_idle_exit+0x58: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_eqs_exit+0x1b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_nmi_enter+0x38: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_dynticks_eqs_exit+0x1e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: enter_from_user_mode+0x5e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode+0x67: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare+0x5e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter_from_user_mode+0x5e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_exit+0x43: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_enter+0x48: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_exit+0x5f: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: ct_irq_enter+0x39: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: ct_irq_exit+0x39: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __ct_user_enter+0x32: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: context_tracking_recursion_enter+0x43: call to ftrace_likely_update() leaves .noinstr.text section


objdump-func vmlinux.o ct_irq_enter:
0000 0000000000007c70 <ct_irq_enter>:
0000     7c70:	55                   	push   %rbp
0001     7c71:	48 89 e5             	mov    %rsp,%rbp
0004     7c74:	53                   	push   %rbx
0005     7c75:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0(%rip)        # 7c7c <ct_irq_enter+0xc>	7c77: R_X86_64_PC32	debug_locks-0x5
000c     7c7c:	74 0b                	je     7c89 <ct_irq_enter+0x19>
000e     7c7e:	65 8b 05 00 00 00 00 	mov    %gs:0x0(%rip),%eax        # 7c85 <ct_irq_enter+0x15>	7c81: R_X86_64_PC32	lockdep_recursion-0x4
0015     7c85:	85 c0                	test   %eax,%eax
0017     7c87:	74 04                	je     7c8d <ct_irq_enter+0x1d>
0019     7c89:	31 c0                	xor    %eax,%eax
001b     7c8b:	eb 0c                	jmp    7c99 <ct_irq_enter+0x29>
001d     7c8d:	65 8b 05 00 00 00 00 	mov    %gs:0x0(%rip),%eax        # 7c94 <ct_irq_enter+0x24>	7c90: R_X86_64_PC32	hardirqs_enabled-0x4
0024     7c94:	85 c0                	test   %eax,%eax
0026     7c96:	0f 95 c0             	setne  %al
0029     7c99:	0f b6 d8             	movzbl %al,%ebx
002c     7c9c:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	7c9f: R_X86_64_32S	_ftrace_annotated_branch+0x59550
0033     7ca3:	89 de                	mov    %ebx,%esi
0035     7ca5:	31 d2                	xor    %edx,%edx
0037     7ca7:	31 c9                	xor    %ecx,%ecx
0039     7ca9:	e8 00 00 00 00       	call   7cae <ct_irq_enter+0x3e>	7caa: R_X86_64_PLT32	ftrace_likely_update-0x4
003e     7cae:	84 db                	test   %bl,%bl
0040     7cb0:	74 04                	je     7cb6 <ct_irq_enter+0x46>
0042     7cb2:	90                   	nop
0043     7cb3:	0f 0b                	ud2    
0045     7cb5:	90                   	nop
0046     7cb6:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	7cb9: R_X86_64_32S	_ftrace_annotated_branch+0x59580
004d     7cbd:	89 de                	mov    %ebx,%esi
004f     7cbf:	31 d2                	xor    %edx,%edx
0051     7cc1:	31 c9                	xor    %ecx,%ecx
0053     7cc3:	e8 00 00 00 00       	call   7cc8 <ct_irq_enter+0x58>	7cc4: R_X86_64_PLT32	ftrace_likely_update-0x4
0058     7cc8:	e8 00 00 00 00       	call   7ccd <ct_irq_enter+0x5d>	7cc9: R_X86_64_PLT32	ct_nmi_enter-0x4
005d     7ccd:	5b                   	pop    %rbx
005e     7cce:	5d                   	pop    %rbp
005f     7ccf:	c3                   	ret    

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
