Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DFE2F31;
	Wed, 15 Mar 2023 09:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678873128; x=1710409128;
  h=date:from:cc:subject:message-id:mime-version;
  bh=scbmdTSjDwKAAN2kg9jxBv2Clr+B4YQgmGTSocFNl/0=;
  b=f1OkK2cljsNJVNgKE4AGjPwQoJLeHTU91OUP121HwZxgw1OS1SvayfZY
   BTtt2oCuDpSDGGa0bPrbJxsnPCigOfKA3VjZXKBnf3R9Mq6+/5q7PczFN
   ozfcYP8ioGPpm+cE3h20lMkH+djQXDRGund0G3O7UinYzxltZbKMo13S0
   LBv9EtF8eNPEI+Y0y8ULgUcYlDlc3q0trumW4tA/kHZlbl9QU6kdRVE6M
   /mBwpz+wMHdtG93ehYxzwV2zHYGNPZtSBQ5uFBamVAf9VW6TcPtAf2MJp
   FAgEIQ7v5n3tiP5gjkliE9GBTxtXwEFzxW7WKLdVsp6sUQ3Vro9+jIlLh
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="326017159"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="326017159"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 02:38:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="748352299"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="748352299"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 15 Mar 2023 02:38:46 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcNaj-0007ad-0e;
	Wed, 15 Mar 2023 09:38:41 +0000
Date: Wed, 15 Mar 2023 17:38:18 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: ct_kernel_exit_state+0x2e: call to
 ftrace_likely_update() leaves .noinstr.text section
Message-ID: <202303151752.Mgdq7hev-lkp@intel.com>
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
head:   6015b1aca1a233379625385feb01dd014aca60b5
commit: 171476775d32a40bfebf83250136c19b2e842672 context_tracking: Convert state to atomic_t
date:   8 months ago
config: x86_64-randconfig-k001-20230313 (https://download.01.org/0day-ci/archive/20230315/202303151752.Mgdq7hev-lkp@intel.com/config)
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
| Link: https://lore.kernel.org/oe-kbuild-all/202303151752.Mgdq7hev-lkp@intel.com/

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
   vmlinux.o: warning: objtool: enter_from_user_mode+0x4a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode+0x55: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare+0x4a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter_from_user_mode+0x4a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_exit+0x3e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_enter+0x43: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_exit+0x5c: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: ct_kernel_exit_state+0x2e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_nmi_enter+0x39: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: ct_kernel_enter_state+0x31: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_idle_enter+0x38: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: ct_kernel_exit+0x3c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_idle_exit+0x43: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: ct_kernel_enter+0x4a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_irq_enter+0x35: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_irq_exit+0x35: call to ftrace_likely_update() leaves .noinstr.text section


objdump-func vmlinux.o ct_kernel_exit_state:
0000 000000000000438e <ct_kernel_exit_state>:
0000     438e:	55                   	push   %rbp
0001     438f:	53                   	push   %rbx
0002     4390:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	4393: R_X86_64_32S	context_tracking
0009     4397:	65 48 03 05 00 00 00 00 	add    %gs:0x0(%rip),%rax        # 439f <ct_kernel_exit_state+0x11>	439b: R_X86_64_PC32	this_cpu_off-0x4
0011     439f:	89 fd                	mov    %edi,%ebp
0013     43a1:	f0 0f c1 28          	lock xadd %ebp,(%rax)
0017     43a5:	01 fd                	add    %edi,%ebp
0019     43a7:	83 e5 04             	and    $0x4,%ebp
001c     43aa:	89 eb                	mov    %ebp,%ebx
001e     43ac:	c1 eb 02             	shr    $0x2,%ebx
0021     43af:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	43b2: R_X86_64_32S	_ftrace_annotated_branch+0x477c0
0028     43b6:	89 de                	mov    %ebx,%esi
002a     43b8:	31 d2                	xor    %edx,%edx
002c     43ba:	31 c9                	xor    %ecx,%ecx
002e     43bc:	e8 00 00 00 00       	call   43c1 <ct_kernel_exit_state+0x33>	43bd: R_X86_64_PLT32	ftrace_likely_update-0x4
0033     43c1:	85 ed                	test   %ebp,%ebp
0035     43c3:	74 04                	je     43c9 <ct_kernel_exit_state+0x3b>
0037     43c5:	90                   	nop
0038     43c6:	0f 0b                	ud2
003a     43c8:	90                   	nop
003b     43c9:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	43cc: R_X86_64_32S	_ftrace_annotated_branch+0x477f0
0042     43d0:	89 de                	mov    %ebx,%esi
0044     43d2:	31 d2                	xor    %edx,%edx
0046     43d4:	31 c9                	xor    %ecx,%ecx
0048     43d6:	5b                   	pop    %rbx
0049     43d7:	5d                   	pop    %rbp
004a     43d8:	e9 00 00 00 00       	jmp    43dd <ct_nmi_enter>	43d9: R_X86_64_PLT32	ftrace_likely_update-0x4

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
