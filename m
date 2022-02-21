Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34B47E
	for <llvm@lists.linux.dev>; Mon, 21 Feb 2022 23:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645487573; x=1677023573;
  h=date:from:cc:subject:message-id:mime-version;
  bh=uObzzmlHk9136/taLTjdhA0+2JiSztNBXGFOKsDpqSk=;
  b=Vg/RCeF+PgQKxnH5sHtB1+UMv5NNRcWA531/l7vBOezMCp6pmw1lo9Fc
   yEc7A1/WOfCvjcCl3sBEjzqzmYTw0M4eP1imwu02YmFcpsVoZNX1IcYeF
   juuQcG3wsagitOZKauujJYEfTAYHxFH5fdyGy3mTxO/F0eYjzj/YJws7x
   pxGDYqSeAapNaPgLYqtUadkMu3r1F587AcHH9x3g6JT2ooPC+yCIvhG+y
   Z2QuhdsqE0zI+KYe5dsUp1pVXGq7junXDXbyR05YPuIjqTc6bGCbpe+wE
   LAYbWwbrkXp/IR1uutJUMS+rCz8pQgaC+p4aqOaNZhS0OJ0ZgzaeA0ZaN
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="250402790"
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; 
   d="scan'208";a="250402790"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2022 15:52:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; 
   d="scan'208";a="532003749"
Received: from lkp-server01.sh.intel.com (HELO da3212ac2f54) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 21 Feb 2022 15:52:46 -0800
Received: from kbuild by da3212ac2f54 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nMIU1-00026S-CT; Mon, 21 Feb 2022 23:52:45 +0000
Date: Tue, 22 Feb 2022 07:51:47 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: do_int80_syscall_32()+0x35: call to
 static_key_count() leaves .noinstr.text section
Message-ID: <202202220732.dDK5cNGY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

CC: linux-kernel@vger.kernel.org
TO: Marco Elver <elver@google.com>
CC: "Paul E. McKenney" <paulmck@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   038101e6b2cd5c55f888f85db42ea2ad3aecb4b6
commit: bd3d5bd1a0ad386475ea7a3de8a91e7d8a600536 kcsan: Support WEAK_MEMORY with Clang where no objtool support exists
date:   2 months ago
config: x86_64-randconfig-a016-20220221 (https://download.01.org/0day-ci/archive/20220222/202202220732.dDK5cNGY-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=bd3d5bd1a0ad386475ea7a3de8a91e7d8a600536
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout bd3d5bd1a0ad386475ea7a3de8a91e7d8a600536
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: do_syscall_64()+0x18: call to static_key_count() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: do_int80_syscall_32()+0x35: call to static_key_count() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: __do_fast_syscall_32()+0x39: call to static_key_count() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __rdgsbase_inactive()+0x33: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __wrgsbase_inactive()+0x37: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret()+0x2f: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: noist_exc_debug()+0x6a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: in_task_stack()+0x13: call to task_stack_page() leaves .noinstr.text section
   vmlinux.o: warning: objtool: in_entry_stack()+0x9: call to cpu_entry_stack() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi()+0xa: call to sev_es_nmi_complete() leaves .noinstr.text section
   vmlinux.o: warning: objtool: default_do_nmi()+0x10: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: poke_int3_handler()+0x8f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: kvm_read_and_reset_apf_flags()+0x1: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: lockdep_hardirqs_on()+0xb4: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: lockdep_hardirqs_off()+0xb1: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: enter_from_user_mode()+0x53: call to __kcsan_check_access() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode()+0x58: call to __kcsan_check_access() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare()+0x53: call to __kcsan_check_access() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exit_to_user_mode()+0x5e: call to __kcsan_check_access() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_exit_to_user_mode()+0x568: call to __kcsan_check_access() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter_from_user_mode()+0x53: call to __kcsan_check_access() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_exit_to_user_mode()+0x65: call to __kcsan_check_access() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_exit()+0x3c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_enter()+0x50: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_exit()+0x34: call to rcu_nmi_exit() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __context_tracking_enter()+0x36: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: context_tracking_recursion_enter()+0x2: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __context_tracking_exit()+0xc: call to __this_cpu_preempt_check() leaves .noinstr.text section

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
