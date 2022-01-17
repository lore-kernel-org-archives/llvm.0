Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B39E2C82
	for <llvm@lists.linux.dev>; Mon, 17 Jan 2022 16:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642435932; x=1673971932;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EFYuPuJvdHi/G8K17mY0fNgWIkokW505n/J2iNCmH/g=;
  b=DHz4shz1hxMF4ru/iLMw0193F8Rd087Ivjynj+YI7VzWE/axYW+ax9aM
   G4wOhOmK5xBmYZvNE1JxH+AI4ZIwMiQfWJNKM1d2zaKt9tXanLBKxWaMZ
   0xnLuwb5a67VIEt8pg2FdHzgedM3Q5LZorDDnbYBK5joa02GT3oSOxIca
   5Wbn0gs7yYaWbdEJmz3c8vdeYU0Ro0ZTk/FbItRiG24oHhRIkHOHM7LvE
   8ab6wO+rN40biGskt03jCSwMVdR7FQjpbScYQLYPLoXUeb243CemgKR9r
   zsgPpzi0/jqKUKn2jm6lNIfrwGKD2nxUXAl61HqYzlu0MYPz+YGa1j1I1
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10229"; a="307992571"
X-IronPort-AV: E=Sophos;i="5.88,295,1635231600"; 
   d="scan'208";a="307992571"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2022 08:11:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,295,1635231600"; 
   d="scan'208";a="517461043"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 17 Jan 2022 08:11:38 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n9Uba-000Bh2-2M; Mon, 17 Jan 2022 16:11:38 +0000
Date: Tue, 18 Jan 2022 00:10:47 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mingo-tip:sched/headers 111/2384]
 include/linux/thread_info.h:68:20: error: redefinition of 'set_restart_fn'
Message-ID: <202201180017.awOuzVzR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git sched/headers
head:   4c707c1c0de83967079b4e385012fa5b00e2cd11
commit: 7d7e24a8155b9ee4b8c93b14489476ce906788d3 [111/2384] headers/deps: kernel: Split <linux/restart_block.h> into <linux/restart_block_types.h> and <linux/restart_block_api.h>
config: i386-randconfig-a014-20220109 (https://download.01.org/0day-ci/archive/20220118/202201180017.awOuzVzR-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5f782d25a742302d25ef3c8b84b54f7483c2deb9)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git/commit/?id=7d7e24a8155b9ee4b8c93b14489476ce906788d3
        git remote add mingo-tip git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git
        git fetch --no-tags mingo-tip sched/headers
        git checkout 7d7e24a8155b9ee4b8c93b14489476ce906788d3
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 prepare

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

Note: the mingo-tip/sched/headers HEAD 4c707c1c0de83967079b4e385012fa5b00e2cd11 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from arch/x86/kernel/../../../kernel/sched/per_task_area_struct.h:7:
   In file included from include/linux/sched.h:17:
   In file included from include/linux/rbtree.h:24:
   In file included from include/linux/rcupdate.h:27:
   In file included from include/linux/preempt.h:78:
   In file included from arch/x86/include/asm/preempt.h:7:
>> include/linux/thread_info.h:68:20: error: redefinition of 'set_restart_fn'
   static inline long set_restart_fn(struct restart_block *restart,
                      ^
   include/linux/restart_block_api.h:23:20: note: previous definition is here
   static inline long set_restart_fn(struct restart_block *restart,
                      ^
   In file included from arch/x86/kernel/asm-offsets.c:34:
   arch/x86/kernel/../../../kernel/sched/per_task_area_struct_defs.h:13:13: warning: no previous prototype for function 'per_task_common' [-Wmissing-prototypes]
   void __used per_task_common(void)
               ^
   arch/x86/kernel/../../../kernel/sched/per_task_area_struct_defs.h:13:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __used per_task_common(void)
   ^
   static 
   1 warning and 1 error generated.
   make[2]: *** [scripts/Makefile.build:121: arch/x86/kernel/asm-offsets.s] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1197: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/set_restart_fn +68 include/linux/thread_info.h

5abbe51a526253 Oleg Nesterov 2021-02-01  67  
5abbe51a526253 Oleg Nesterov 2021-02-01 @68  static inline long set_restart_fn(struct restart_block *restart,
5abbe51a526253 Oleg Nesterov 2021-02-01  69  					long (*fn)(struct restart_block *))
5abbe51a526253 Oleg Nesterov 2021-02-01  70  {
5abbe51a526253 Oleg Nesterov 2021-02-01  71  	restart->fn = fn;
5abbe51a526253 Oleg Nesterov 2021-02-01  72  	arch_set_restart_data(restart);
5abbe51a526253 Oleg Nesterov 2021-02-01  73  	return -ERESTART_RESTARTBLOCK;
5abbe51a526253 Oleg Nesterov 2021-02-01  74  }
5abbe51a526253 Oleg Nesterov 2021-02-01  75  

:::::: The code at line 68 was first introduced by commit
:::::: 5abbe51a526253b9f003e9a0a195638dc882d660 kernel, fs: Introduce and use set_restart_fn() and arch_set_restart_data()

:::::: TO: Oleg Nesterov <oleg@redhat.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
