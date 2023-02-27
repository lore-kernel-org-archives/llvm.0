Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7497D640;
	Mon, 27 Feb 2023 06:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677479020; x=1709015020;
  h=date:from:cc:subject:message-id:mime-version;
  bh=6gAFlXpUti1SLctfB/k0AJRLvd70B0fJZMh+Xb18ak4=;
  b=AEXFPlHxtV2Fnj4oGMKyT+ECZpI7T1PE/uTAlOiag9vq334qh+9CAKIY
   1JHS3PKLlw6RQgR3UF4gtOcbY6hmzBTVQzxOps23qHGRs5JvCdQTVRNn3
   l3JqAfMtUHujSpG1HVyplB7VF4U9w7CFDhyKNrRiSWGbK/wfqdm0xLNmb
   feU97aTS+sZjaagkUHSUQ+2P5t4tzCAQiRAiO47+ZfRxM25AqhZz0T0I5
   dGmbCpfhRDB/E2d1CakrbLK+984PCsnTU0vno5JPzzIM4cWxCzqiz7OX5
   p8R/7bQHDttrh+f9IZAm8TqpZBLjD9EBT6wlwV5nvXaO1tcFs2nrJmKX3
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="322032907"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; 
   d="scan'208";a="322032907"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2023 22:23:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="847677831"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; 
   d="scan'208";a="847677831"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 26 Feb 2023 22:23:24 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWWux-000491-37;
	Mon, 27 Feb 2023 06:23:23 +0000
Date: Mon, 27 Feb 2023 14:23:06 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: ct_idle_exit+0x4c: call to
 ftrace_likely_update() leaves .noinstr.text section
Message-ID: <202302271401.WlwFqfKd-lkp@intel.com>
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
head:   f3a2439f20d918930cc4ae8f76fe1c1afd26958f
commit: c33ef43a359001415032665dfcd433979c462b71 rcu/context-tracking: Remove unused and/or unecessary middle functions
date:   8 months ago
config: x86_64-randconfig-r001-20230227 (https://download.01.org/0day-ci/archive/20230227/202302271401.WlwFqfKd-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c33ef43a359001415032665dfcd433979c462b71
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout c33ef43a359001415032665dfcd433979c462b71
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302271401.WlwFqfKd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: ibt_selftest+0xf: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: __rdgsbase_inactive+0x39: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __wrgsbase_inactive+0x3e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret+0x2d: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: noist_exc_debug+0x4a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi+0x37: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: poke_int3_handler+0x5a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: enter_from_user_mode+0x62: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode+0x67: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare+0x62: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter_from_user_mode+0x62: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_exit+0x47: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_enter+0x4f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_exit+0x63: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_dynticks_eqs_enter+0x36: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_nmi_enter+0x41: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_dynticks_eqs_exit+0x2d: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_idle_enter+0x3d: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_eqs_enter+0x41: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: ct_idle_exit+0x4c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_eqs_exit+0x4a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_irq_enter+0x3d: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_irq_exit+0x3d: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ibt_selftest+0x19: return with modified stack frame


objdump-func vmlinux.o ct_idle_exit:
0000 0000000000004580 <ct_idle_exit>:
0000     4580:	f3 0f 1e fa          	endbr64
0004     4584:	55                   	push   %rbp
0005     4585:	48 89 e5             	mov    %rsp,%rbp
0008     4588:	41 56                	push   %r14
000a     458a:	53                   	push   %rbx
000b     458b:	50                   	push   %rax
000c     458c:	48 bb aa aa aa aa aa aa aa aa 	movabs $0xaaaaaaaaaaaaaaaa,%rbx
0016     4596:	48 89 5d e8          	mov    %rbx,-0x18(%rbp)
001a     459a:	9c                   	pushf
001b     459b:	8f 45 e8             	pop    -0x18(%rbp)
001e     459e:	4c 8b 75 e8          	mov    -0x18(%rbp),%r14
0022     45a2:	fa                   	cli
0023     45a3:	e8 58 00 00 00       	call   4600 <rcu_eqs_exit>
0028     45a8:	48 89 5d e8          	mov    %rbx,-0x18(%rbp)
002c     45ac:	9c                   	pushf
002d     45ad:	8f 45 e8             	pop    -0x18(%rbp)
0030     45b0:	48 8b 5d e8          	mov    -0x18(%rbp),%rbx
0034     45b4:	81 e3 00 02 00 00    	and    $0x200,%ebx
003a     45ba:	48 89 de             	mov    %rbx,%rsi
003d     45bd:	48 c1 ee 09          	shr    $0x9,%rsi
0041     45c1:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	45c4: R_X86_64_32S	_ftrace_annotated_branch+0x47220
0048     45c8:	31 d2                	xor    %edx,%edx
004a     45ca:	31 c9                	xor    %ecx,%ecx
004c     45cc:	e8 00 00 00 00       	call   45d1 <ct_idle_exit+0x51>	45cd: R_X86_64_PLT32	ftrace_likely_update-0x4
0051     45d1:	48 85 db             	test   %rbx,%rbx
0054     45d4:	74 05                	je     45db <ct_idle_exit+0x5b>
0056     45d6:	e8 00 00 00 00       	call   45db <ct_idle_exit+0x5b>	45d7: R_X86_64_PLT32	warn_bogus_irq_restore-0x4
005b     45db:	41 0f ba e6 09       	bt     $0x9,%r14d
0060     45e0:	73 01                	jae    45e3 <ct_idle_exit+0x63>
0062     45e2:	fb                   	sti
0063     45e3:	48 83 c4 08          	add    $0x8,%rsp
0067     45e7:	5b                   	pop    %rbx
0068     45e8:	41 5e                	pop    %r14
006a     45ea:	5d                   	pop    %rbp
006b     45eb:	c3                   	ret
006c     45ec:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
0076     45f6:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
