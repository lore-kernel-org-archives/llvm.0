Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C2E20F0;
	Mon,  6 Mar 2023 03:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678074900; x=1709610900;
  h=date:from:cc:subject:message-id:mime-version;
  bh=SYE8xYlDTOyf3oVkvtfD35ZqxftN+SFB174ZlhLa/cQ=;
  b=ZccriYMawcYrvRzpgHKSFFj8AeSnq4UpxlIfP0Hw83WpU4JWQIGVQlM0
   bs2g1yYiPLlkkVj55HuAX1tigIAx1Xa5q+UtRF29++lKf/FQjazCDCJgi
   EvWAvnvsyO342vYGV8KUnnxPw8pmnQvnlsF/VHSuTpyqIXKE/zWl6J80n
   FvuzjgLER8prZ1CLSCs58ub6Vj4q9SJ2ie9hm52cXkVmfZUUozU8VpED1
   BNrM+Sk/a9ei7e3aZQisPesW9/0A8P+nJI20ZC9moiX+ts5wlFAvG6Ihi
   CBrgHXOrDsWyBktT1JiqY+eb4wKaQ4XzlmMPB83CoEHDse8+syB/WI0Uj
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="398048636"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="398048636"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2023 19:55:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="799868160"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="799868160"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 05 Mar 2023 19:54:59 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZ1wB-0003Ik-0g;
	Mon, 06 Mar 2023 03:54:59 +0000
Date: Mon, 6 Mar 2023 11:54:36 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: mwait_idle+0x2b: call to
 ftrace_likely_update() leaves .noinstr.text section
Message-ID: <202303061129.ZU7qlWLA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>
CC: Ingo Molnar <mingo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fe15c26ee26efa11741a7b632e9f23b01aca4cc6
commit: e4df1511e1f4bcaa0d590aa7bbffe8bbbd6dfb49 cpuidle, sched: Remove instrumentation from TIF_{POLLING_NRFLAG,NEED_RESCHED}
date:   7 weeks ago
config: x86_64-randconfig-a011-20230306 (https://download.01.org/0day-ci/archive/20230306/202303061129.ZU7qlWLA-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e4df1511e1f4bcaa0d590aa7bbffe8bbbd6dfb49
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e4df1511e1f4bcaa0d590aa7bbffe8bbbd6dfb49
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303061129.ZU7qlWLA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: tdx_safe_halt+0x2b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __halt+0x2b: call to __tdx_hypercall() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: mwait_idle+0x2b: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: acpi_processor_ffh_cstate_enter+0x120: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: intel_idle+0x102: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: intel_idle_s2idle+0x111: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: intel_idle_irq+0x104: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: intel_idle_ibrs+0x108: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: intel_idle_xstate+0x108: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __rdgsbase_inactive+0x33: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __wrgsbase_inactive+0x37: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: sync_regs+0x23: call to memcpy() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret+0x25: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: noist_exc_debug+0x45: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi+0xc9: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: poke_int3_handler+0x3b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_machine_check+0x54: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_machine_check+0x59: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_check_crashing_cpu+0x10: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: enter_from_user_mode+0x48: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode+0x51: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare+0x48: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter_from_user_mode+0x48: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_exit+0x40: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_enter+0x44: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_exit+0x4d: call to ftrace_likely_update() leaves .noinstr.text section


objdump-func vmlinux.o mwait_idle:
0000 0000000000000130 <mwait_idle>:
0000  130:	f3 0f 1e fa          	endbr64
0004  134:	41 56                	push   %r14
0006  136:	53                   	push   %rbx
0007  137:	4c 8b 34 25 00 00 00 00 	mov    0x0,%r14	13b: R_X86_64_32S	pcpu_hot
000f  13f:	41 80 4e 02 20       	orb    $0x20,0x2(%r14)
0014  144:	49 8b 1e             	mov    (%r14),%rbx
0017  147:	83 e3 08             	and    $0x8,%ebx
001a  14a:	48 c1 eb 03          	shr    $0x3,%rbx
001e  14e:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	151: R_X86_64_32S	_ftrace_annotated_branch+0x8430
0025  155:	89 de                	mov    %ebx,%esi
0027  157:	31 d2                	xor    %edx,%edx
0029  159:	31 c9                	xor    %ecx,%ecx
002b  15b:	e8 00 00 00 00       	call   160 <mwait_idle+0x30>	15c: R_X86_64_PLT32	ftrace_likely_update-0x4
0030  160:	48 85 db             	test   %rbx,%rbx
0033  163:	75 48                	jne    1ad <mwait_idle+0x7d>
0035  165:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 16c <mwait_idle+0x3c>	168: R_X86_64_PC32	boot_cpu_data+0x74
003c  16c:	a8 80                	test   $0x80,%al
003e  16e:	74 0e                	je     17e <mwait_idle+0x4e>
0040  170:	0f ae f0             	mfence
0043  173:	4c 89 f7             	mov    %r14,%rdi
0046  176:	e8 00 00 00 00       	call   17b <mwait_idle+0x4b>	177: R_X86_64_PLT32	.text+0x52e4c
004b  17b:	0f ae f0             	mfence
004e  17e:	4c 89 f7             	mov    %r14,%rdi
0051  181:	e8 00 00 00 00       	call   186 <mwait_idle+0x56>	182: R_X86_64_PLT32	.text+0x52e5c
0056  186:	49 8b 1e             	mov    (%r14),%rbx
0059  189:	83 e3 08             	and    $0x8,%ebx
005c  18c:	48 c1 eb 03          	shr    $0x3,%rbx
0060  190:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	193: R_X86_64_32S	_ftrace_annotated_branch+0x8460
0067  197:	89 de                	mov    %ebx,%esi
0069  199:	31 d2                	xor    %edx,%edx
006b  19b:	31 c9                	xor    %ecx,%ecx
006d  19d:	e8 00 00 00 00       	call   1a2 <mwait_idle+0x72>	19e: R_X86_64_PLT32	ftrace_likely_update-0x4
0072  1a2:	48 85 db             	test   %rbx,%rbx
0075  1a5:	75 06                	jne    1ad <mwait_idle+0x7d>
0077  1a7:	e8 00 00 00 00       	call   1ac <mwait_idle+0x7c>	1a8: R_X86_64_PLT32	.text+0x52e6c
007c  1ac:	fa                   	cli
007d  1ad:	41 80 66 02 df       	andb   $0xdf,0x2(%r14)
0082  1b2:	5b                   	pop    %rbx
0083  1b3:	41 5e                	pop    %r14
0085  1b5:	c3                   	ret
0086  1b6:	cc                   	int3
0087  1b7:	cc                   	int3
0088  1b8:	cc                   	int3
0089  1b9:	cc                   	int3
008a  1ba:	cc                   	int3
008b  1bb:	cc                   	int3
008c  1bc:	cc                   	int3
008d  1bd:	cc                   	int3
008e  1be:	cc                   	int3
008f  1bf:	cc                   	int3

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
