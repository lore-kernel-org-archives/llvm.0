Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F526633;
	Tue,  6 Jun 2023 02:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686017924; x=1717553924;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qQV6D5rwdATUjpxlTo7BXB0mFd/BI/2oTMrcdGFwysY=;
  b=IgS41lXj7kTF0coJGfaOXKV7Ko+Icv/ZJ+jmODKpYeRUXvKbuGldvfuS
   qPueFVp9ivxPhBKb3GR69tpvNuWVocP3OhGRA0obwTroNHjK2ZDsIWQ8F
   W3a43r88xQURNkOnlJizpKKg4DTrX6cLvh6zT4hwfG6Ns1yvg6J9lKaoJ
   lJrEe6HttopHGLSFzq293ACPLCHxXexBGmRp0ErYq/SRep8QQ1PrQZkEl
   hIBznoSSE9LSoaKOAoebkeNSzLNSOiE6dM+pUYKjAmhwUVxOwPYW9tyeC
   fHouNdWfnUgxQyz8tUm7l4ukC1bhSbYhgILSWXHilnBzKl7DcTt5Xl4Gu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="358994385"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; 
   d="scan'208";a="358994385"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 19:18:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="773951635"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; 
   d="scan'208";a="773951635"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 05 Jun 2023 19:18:39 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6MHP-0004hl-0r;
	Tue, 06 Jun 2023 02:18:39 +0000
Date: Tue, 6 Jun 2023 10:17:54 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:timers/posix 22/61] init/init_task.c:31:33: error:
 expected '}'
Message-ID: <202306061012.xWzgDSg0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/posix
head:   16a20adb1e0ae19ad42041a7d1b5583e4705ca0c
commit: 2e9a3527e7a51ba24410e43a2d0d1d10d62ae1b1 [22/61] posix-timers: Convert timer list to hlist
config: riscv-randconfig-r036-20230605 (https://download.01.org/0day-ci/archive/20230606/202306061012.xWzgDSg0-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 4faf3aaf28226a4e950c103a14f6fc1d1fdabb1b)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git/commit/?id=2e9a3527e7a51ba24410e43a2d0d1d10d62ae1b1
        git remote add tglx-devel https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git
        git fetch --no-tags tglx-devel timers/posix
        git checkout 2e9a3527e7a51ba24410e43a2d0d1d10d62ae1b1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash fs/proc/ init/ kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306061012.xWzgDSg0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> init/init_task.c:31:33: error: expected '}'
           .posix_timers   = HLIST_HEAD_INIT(),
                                            ^
   init/init_task.c:18:44: note: to match this '{'
   static struct signal_struct init_signals = {
                                              ^
   1 error generated.
--
>> fs/proc/base.c:2464:24: error: incompatible pointer types passing 'struct hlist_head *' to parameter of type 'struct list_head *' [-Werror,-Wincompatible-pointer-types]
           return seq_list_start(&tp->task->signal->posix_timers, *pos);
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/seq_file.h:273:59: note: passing argument to parameter 'head' here
   extern struct list_head *seq_list_start(struct list_head *head,
                                                             ^
   fs/proc/base.c:2470:26: error: incompatible pointer types passing 'struct hlist_head *' to parameter of type 'struct list_head *' [-Werror,-Wincompatible-pointer-types]
           return seq_list_next(v, &tp->task->signal->posix_timers, pos);
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/seq_file.h:277:67: note: passing argument to parameter 'head' here
   extern struct list_head *seq_list_next(void *v, struct list_head *head,
                                                                     ^
>> fs/proc/base.c:2499:10: error: static assertion failed due to requirement '__builtin_types_compatible_p(struct list_head, struct hlist_node) || __builtin_types_compatible_p(struct list_head, void)': pointer type mismatch in container_of()
           timer = list_entry((struct list_head *)v, struct k_itimer, list);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:520:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:20:16: note: expanded from macro 'container_of'
           static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
           ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:338:27: note: expanded from macro '__same_type'
   #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
                             ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
   #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                    ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
   #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                          ^~~~
   3 errors generated.


vim +31 init/init_task.c

    17	
    18	static struct signal_struct init_signals = {
    19		.nr_threads	= 1,
    20		.thread_head	= LIST_HEAD_INIT(init_task.thread_node),
    21		.wait_chldexit	= __WAIT_QUEUE_HEAD_INITIALIZER(init_signals.wait_chldexit),
    22		.shared_pending	= {
    23			.list = LIST_HEAD_INIT(init_signals.shared_pending.list),
    24			.signal =  {{0}}
    25		},
    26		.multiprocess	= HLIST_HEAD_INIT,
    27		.rlim		= INIT_RLIMITS,
    28		.cred_guard_mutex = __MUTEX_INITIALIZER(init_signals.cred_guard_mutex),
    29		.exec_update_lock = __RWSEM_INITIALIZER(init_signals.exec_update_lock),
    30	#ifdef CONFIG_POSIX_TIMERS
  > 31		.posix_timers	= HLIST_HEAD_INIT(),
    32		.cputimer	= {
    33			.cputime_atomic	= INIT_CPUTIME_ATOMIC,
    34		},
    35	#endif
    36		INIT_CPU_TIMERS(init_signals)
    37		.pids = {
    38			[PIDTYPE_PID]	= &init_struct_pid,
    39			[PIDTYPE_TGID]	= &init_struct_pid,
    40			[PIDTYPE_PGID]	= &init_struct_pid,
    41			[PIDTYPE_SID]	= &init_struct_pid,
    42		},
    43		INIT_PREV_CPUTIME(init_signals)
    44	};
    45	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
