Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4749D8C17;
	Mon, 13 Mar 2023 20:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678740827; x=1710276827;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Y1ThLjPjo5bnAdM0jpDoTnc4FDe1W9P1zHjKggvyrvk=;
  b=js5ck9qINjaJbWBfw1zSwL7IRi1KTOYOrBvIF6P535tVSDFIwvWIqNCS
   ZKDnVT8NoNTg+yJNGO1IHxQuFCoV6vcP1MV3JQ1JFSR4DO9eGt3Fu+u+j
   2ww0+DfNwaTCIvN+Fc/JI2Ce4UrAlWnh2hhxQXEirATwEP8y4bH55jnBK
   Z17lfWptzQugiQGuVRZY+bbUIUny+PU0py6Us36ehyriIgU2ojbKsUvvD
   v4CK7hJRz801JWGDohildg48PBW9QJwjR4IvYvVjV2xWnxGiAETzQjTqx
   AC7ZmN7VTE90KzsfTvqhiT0k2yI2rB2V4oznsPWQUFjtNrqvC3dajgOG6
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="337281401"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; 
   d="scan'208";a="337281401"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 13:53:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="681180854"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; 
   d="scan'208";a="681180854"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 13 Mar 2023 13:53:44 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbpAt-00067E-2s;
	Mon, 13 Mar 2023 20:53:43 +0000
Date: Tue, 14 Mar 2023 04:53:30 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: ct_irq_enter+0x35: call to
 ftrace_likely_update() leaves .noinstr.text section
Message-ID: <202303140438.RQu7HYOs-lkp@intel.com>
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
head:   fc89d7fb499b0162e081f434d45e8d1b47e82ece
commit: 3864caafe7c66f01b188ffccb6a4215f3bf56292 rcu/context-tracking: Remove rcu_irq_enter/exit()
date:   8 months ago
config: x86_64-randconfig-k001-20230313 (https://download.01.org/0day-ci/archive/20230314/202303140438.RQu7HYOs-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3864caafe7c66f01b188ffccb6a4215f3bf56292
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 3864caafe7c66f01b188ffccb6a4215f3bf56292
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303140438.RQu7HYOs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: __rdgsbase_inactive+0x35: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __wrgsbase_inactive+0x39: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret+0x87: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: noist_exc_debug+0x4e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi+0x2f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: poke_int3_handler+0x4e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_machine_check+0x56: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_start+0x6b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_machine_check+0x4e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_check_crashing_cpu+0x28: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_idle_enter+0x38: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_eqs_enter+0x3d: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_dynticks_eqs_enter+0x1e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_idle_exit+0x43: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_eqs_exit+0x3b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_nmi_enter+0x2f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_dynticks_eqs_exit+0x25: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: enter_from_user_mode+0x4a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode+0x55: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare+0x4a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter_from_user_mode+0x4a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_exit+0x3e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_enter+0x43: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_exit+0x5c: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: ct_irq_enter+0x35: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: ct_irq_exit+0x35: call to ftrace_likely_update() leaves .noinstr.text section


objdump-func vmlinux.o ct_irq_enter:
0000 0000000000004993 <ct_irq_enter>:
0000     4993:	53                   	push   %rbx
0001     4994:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0(%rip)        # 499b <ct_irq_enter+0x8>	4996: R_X86_64_PC32	debug_locks-0x5
0008     499b:	74 0b                	je     49a8 <ct_irq_enter+0x15>
000a     499d:	65 8b 05 00 00 00 00 	mov    %gs:0x0(%rip),%eax        # 49a4 <ct_irq_enter+0x11>	49a0: R_X86_64_PC32	lockdep_recursion-0x4
0011     49a4:	85 c0                	test   %eax,%eax
0013     49a6:	74 04                	je     49ac <ct_irq_enter+0x19>
0015     49a8:	31 c0                	xor    %eax,%eax
0017     49aa:	eb 0c                	jmp    49b8 <ct_irq_enter+0x25>
0019     49ac:	65 8b 05 00 00 00 00 	mov    %gs:0x0(%rip),%eax        # 49b3 <ct_irq_enter+0x20>	49af: R_X86_64_PC32	hardirqs_enabled-0x4
0020     49b3:	85 c0                	test   %eax,%eax
0022     49b5:	0f 95 c0             	setne  %al
0025     49b8:	0f b6 d8             	movzbl %al,%ebx
0028     49bb:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	49be: R_X86_64_32S	_ftrace_annotated_branch+0x47b20
002f     49c2:	89 de                	mov    %ebx,%esi
0031     49c4:	31 d2                	xor    %edx,%edx
0033     49c6:	31 c9                	xor    %ecx,%ecx
0035     49c8:	e8 00 00 00 00       	call   49cd <ct_irq_enter+0x3a>	49c9: R_X86_64_PLT32	ftrace_likely_update-0x4
003a     49cd:	84 db                	test   %bl,%bl
003c     49cf:	74 04                	je     49d5 <ct_irq_enter+0x42>
003e     49d1:	90                   	nop
003f     49d2:	0f 0b                	ud2
0041     49d4:	90                   	nop
0042     49d5:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	49d8: R_X86_64_32S	_ftrace_annotated_branch+0x47b50
0049     49dc:	89 de                	mov    %ebx,%esi
004b     49de:	31 d2                	xor    %edx,%edx
004d     49e0:	31 c9                	xor    %ecx,%ecx
004f     49e2:	e8 00 00 00 00       	call   49e7 <ct_irq_enter+0x54>	49e3: R_X86_64_PLT32	ftrace_likely_update-0x4
0054     49e7:	5b                   	pop    %rbx
0055     49e8:	e9 00 00 00 00       	jmp    49ed <ct_nmi_enter>	49e9: R_X86_64_PLT32	ct_nmi_enter-0x4

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
