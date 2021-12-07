Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6156D68
	for <llvm@lists.linux.dev>; Tue,  7 Dec 2021 17:48:08 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10190"; a="217662925"
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; 
   d="scan'208";a="217662925"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2021 09:32:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; 
   d="scan'208";a="542882151"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 07 Dec 2021 09:32:10 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mueK1-000MoJ-PY; Tue, 07 Dec 2021 17:32:09 +0000
Date: Wed, 8 Dec 2021 01:31:18 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [paulmck-rcu:rcu/next 42/52] vmlinux.o: warning: objtool:
 __context_tracking_enter()+0x75: call to rcu_user_enter() leaves
 .noinstr.text section
Message-ID: <202112080042.l1yRbman-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git rcu/next
head:   6a3aa1f6d19ed22b517cbb0acc0f88cda4ad42ad
commit: fe90808c12f91a180afde9eb71ce44dfcd99bbc3 [42/52] kcsan: Support WEAK_MEMORY with Clang where no objtool support exists
config: x86_64-randconfig-a003-20210928 (https://download.01.org/0day-ci/archive/20211208/202112080042.l1yRbman-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1cb1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git/commit/?id=fe90808c12f91a180afde9eb71ce44dfcd99bbc3
        git remote add paulmck-rcu https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git
        git fetch --no-tags paulmck-rcu rcu/next
        git checkout fe90808c12f91a180afde9eb71ce44dfcd99bbc3
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: do_syscall_64()+0x4c: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_int80_syscall_32()+0x6b: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __do_fast_syscall_32()+0x6f: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret()+0x1e: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: in_task_stack()+0x13: call to task_stack_page() leaves .noinstr.text section
   vmlinux.o: warning: objtool: in_entry_stack()+0x10: call to cpu_entry_stack() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi()+0x8: call to sev_es_nmi_complete() leaves .noinstr.text section
   vmlinux.o: warning: objtool: enter_from_user_mode()+0x55: call to __kcsan_check_access() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode()+0x5c: call to __kcsan_check_access() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare()+0x55: call to __kcsan_check_access() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter_from_user_mode()+0x55: call to __kcsan_check_access() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: __context_tracking_enter()+0x75: call to rcu_user_enter() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: __context_tracking_exit()+0x3c: call to rcu_user_exit() leaves .noinstr.text section

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
