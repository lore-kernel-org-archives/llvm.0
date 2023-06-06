Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58ECF65C;
	Tue,  6 Jun 2023 03:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686022074; x=1717558074;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3jugwMRYFof+vJpiHk1VlmAVGD7RYY23TWN2lyl70tY=;
  b=lKXlcwqRr3e13zcXggCrXtV6U756fpQR4gox2onM0u/AgA9RaTIEjwb+
   9OQyHzbAr+V+To9IzqeCmbhip/3Ta41JrIIckDA7DQgq3QVElbGrMcoSI
   Pw0fpfWnNDgSL8r+Mnv66dKv3VYvzgPzPTuXFolXNUJSaV6EzKqgs+60I
   Pu/uNx+YRBNXk1SV50jtAfzGi+WFQpnK0uOvJ9dUVH8u8ydVLqVUyl4Y4
   4S4bVCUHLZNWQBB+D11FcUNuDdzdWsnpM0FqeS6ZHwUuQuOR7PRWKUCkC
   8e6Fgkd9zHid1jU5oRPhCvAOAYuOGxC+I1D/vCOXTFRvM85KV/8kosgcQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="420099731"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; 
   d="scan'208";a="420099731"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 20:27:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="703002533"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; 
   d="scan'208";a="703002533"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 05 Jun 2023 20:27:50 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6NML-0004mF-1O;
	Tue, 06 Jun 2023 03:27:49 +0000
Date: Tue, 6 Jun 2023 11:26:50 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:timers/posix 56/61] fs/proc/base.c:2504:17: error:
 member reference type 'struct sigqueue' is not a pointer; did you mean to
 use '.'?
Message-ID: <202306061124.o4M9klgi-lkp@intel.com>
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
commit: 21477ceed1e544982c3c00a574c125a88f2c69ff [56/61] posix-timers: Embed sigqueue in struct k_itimer
config: riscv-randconfig-r036-20230605 (https://download.01.org/0day-ci/archive/20230606/202306061124.o4M9klgi-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 4faf3aaf28226a4e950c103a14f6fc1d1fdabb1b)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git/commit/?id=21477ceed1e544982c3c00a574c125a88f2c69ff
        git remote add tglx-devel https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git
        git fetch --no-tags tglx-devel timers/posix
        git checkout 21477ceed1e544982c3c00a574c125a88f2c69ff
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash fs/proc/ kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306061124.o4M9klgi-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/proc/base.c:2464:24: error: incompatible pointer types passing 'struct hlist_head *' to parameter of type 'struct list_head *' [-Werror,-Wincompatible-pointer-types]
    2464 |         return seq_list_start(&tp->task->signal->posix_timers, *pos);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/seq_file.h:273:59: note: passing argument to parameter 'head' here
     273 | extern struct list_head *seq_list_start(struct list_head *head,
         |                                                           ^
   fs/proc/base.c:2470:26: error: incompatible pointer types passing 'struct hlist_head *' to parameter of type 'struct list_head *' [-Werror,-Wincompatible-pointer-types]
    2470 |         return seq_list_next(v, &tp->task->signal->posix_timers, pos);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/seq_file.h:277:67: note: passing argument to parameter 'head' here
     277 | extern struct list_head *seq_list_next(void *v, struct list_head *head,
         |                                                                   ^
   fs/proc/base.c:2499:10: error: static assertion failed due to requirement '__builtin_types_compatible_p(struct list_head, struct hlist_node) || __builtin_types_compatible_p(struct list_head, void)': pointer type mismatch in container_of()
    2499 |         timer = list_entry((struct list_head *)v, struct k_itimer, list);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:520:2: note: expanded from macro 'list_entry'
     520 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:20:16: note: expanded from macro 'container_of'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      21 |                       __same_type(*(ptr), void),                        \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      22 |                       "pointer type mismatch in container_of()");       \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:338:27: note: expanded from macro '__same_type'
     338 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
>> fs/proc/base.c:2504:17: error: member reference type 'struct sigqueue' is not a pointer; did you mean to use '.'?
    2504 |                    timer->sigq->info.si_signo,
         |                    ~~~~~~~~~~~^~
         |                               .
   fs/proc/base.c:2505:17: error: member reference type 'struct sigqueue' is not a pointer; did you mean to use '.'?
    2505 |                    timer->sigq->info.si_value.sival_ptr);
         |                    ~~~~~~~~~~~^~
         |                               .
   5 errors generated.


vim +2504 fs/proc/base.c

48f6a7a511ef88 Pavel Emelyanov  2013-03-11  2487  
48f6a7a511ef88 Pavel Emelyanov  2013-03-11  2488  static int show_timer(struct seq_file *m, void *v)
48f6a7a511ef88 Pavel Emelyanov  2013-03-11  2489  {
48f6a7a511ef88 Pavel Emelyanov  2013-03-11  2490  	struct k_itimer *timer;
57b8015e07a703 Pavel Emelyanov  2013-03-11  2491  	struct timers_private *tp = m->private;
57b8015e07a703 Pavel Emelyanov  2013-03-11  2492  	int notify;
cedbccab8bb104 Alexey Dobriyan  2014-08-08  2493  	static const char * const nstr[] = {
57b8015e07a703 Pavel Emelyanov  2013-03-11  2494  		[SIGEV_SIGNAL] = "signal",
57b8015e07a703 Pavel Emelyanov  2013-03-11  2495  		[SIGEV_NONE] = "none",
57b8015e07a703 Pavel Emelyanov  2013-03-11  2496  		[SIGEV_THREAD] = "thread",
57b8015e07a703 Pavel Emelyanov  2013-03-11  2497  	};
48f6a7a511ef88 Pavel Emelyanov  2013-03-11  2498  
48f6a7a511ef88 Pavel Emelyanov  2013-03-11  2499  	timer = list_entry((struct list_head *)v, struct k_itimer, list);
57b8015e07a703 Pavel Emelyanov  2013-03-11  2500  	notify = timer->it_sigev_notify;
57b8015e07a703 Pavel Emelyanov  2013-03-11  2501  
48f6a7a511ef88 Pavel Emelyanov  2013-03-11  2502  	seq_printf(m, "ID: %d\n", timer->it_id);
ba3edf1f770ebc Linus Torvalds   2017-12-06  2503  	seq_printf(m, "signal: %d/%px\n",
25ce319167b517 Joe Perches      2015-04-15 @2504  		   timer->sigq->info.si_signo,
57b8015e07a703 Pavel Emelyanov  2013-03-11  2505  		   timer->sigq->info.si_value.sival_ptr);
57b8015e07a703 Pavel Emelyanov  2013-03-11  2506  	seq_printf(m, "notify: %s/%s.%d\n",
57b8015e07a703 Pavel Emelyanov  2013-03-11  2507  		   nstr[notify & ~SIGEV_THREAD_ID],
57b8015e07a703 Pavel Emelyanov  2013-03-11  2508  		   (notify & SIGEV_THREAD_ID) ? "tid" : "pid",
57b8015e07a703 Pavel Emelyanov  2013-03-11  2509  		   pid_nr_ns(timer->it_pid, tp->ns));
15ef0298deb392 Pavel Tikhomirov 2013-05-17  2510  	seq_printf(m, "ClockID: %d\n", timer->it_clock);
48f6a7a511ef88 Pavel Emelyanov  2013-03-11  2511  
48f6a7a511ef88 Pavel Emelyanov  2013-03-11  2512  	return 0;
48f6a7a511ef88 Pavel Emelyanov  2013-03-11  2513  }
48f6a7a511ef88 Pavel Emelyanov  2013-03-11  2514  

:::::: The code at line 2504 was first introduced by commit
:::::: 25ce319167b517a913a2ba9fc80da8330dbc3249 proc: remove use of seq_printf return value

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
