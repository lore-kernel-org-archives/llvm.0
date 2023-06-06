Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6079937B71;
	Tue,  6 Jun 2023 13:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686059442; x=1717595442;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I3+kJBG1ObK30+MuR2tQyHodqlxIFHSuii8lJUDW0y4=;
  b=h7rzqEkHaXLCpqXIF+E07Hkbi72gbTP0EHt8LkBtbSqVq63NSeCc2jL/
   eKqWWsFlTOWrzxZ7sLHBnkYW1jbDM2k7Zt7hGgZiE64YOiIL1e8rayVSg
   8ApCsog+5ZzaxK5dlhU/dfHKM6auFvwcjbiFARjHK6ciBCBdtG4cLU3gG
   OrFUaFfLrJPR8SWYFW05rlBRfYZTg3FRA3UKMPB8RFvNDWQi+yWwyZJFx
   HSe+XrU0whTmA74M+FoVz94zJ38mbBwvdj8BG2IOEW9FOvekeeBTRMrPJ
   2ghnT2LR2msQ1iEQVnZYIBd4347eYXYtCEkL1nqlDUmJEOwwPTmJWWe/W
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="355530697"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; 
   d="scan'208";a="355530697"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2023 06:50:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="709077754"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; 
   d="scan'208";a="709077754"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 06 Jun 2023 06:50:31 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6X4w-0005JT-06;
	Tue, 06 Jun 2023 13:50:30 +0000
Date: Tue, 6 Jun 2023 21:50:08 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:timers/posix 58/61] kernel/signal.c:2097:48: error: no
 member named 'list' in 'struct kernel_siginfo'
Message-ID: <202306062137.desNbLij-lkp@intel.com>
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
commit: 3ef2ce19cb1200cb49c61f9b3cef58c4b8a3a10d [58/61] signal: Add list to track ignored posix timers
config: riscv-randconfig-r036-20230605 (https://download.01.org/0day-ci/archive/20230606/202306062137.desNbLij-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 4faf3aaf28226a4e950c103a14f6fc1d1fdabb1b)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git/commit/?id=3ef2ce19cb1200cb49c61f9b3cef58c4b8a3a10d
        git remote add tglx-devel https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git
        git fetch --no-tags tglx-devel timers/posix
        git checkout 3ef2ce19cb1200cb49c61f9b3cef58c4b8a3a10d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306062137.desNbLij-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/signal.c:2097:48: error: no member named 'list' in 'struct kernel_siginfo'
    2097 |                 if (WARN_ON_ONCE(!list_empty(&tmr->sigq.info.list)))
         |                                               ~~~~~~~~~~~~~~ ^
   include/asm-generic/bug.h:110:25: note: expanded from macro 'WARN_ON_ONCE'
     110 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~
   1 error generated.


vim +2097 kernel/signal.c

  2067	
  2068	static void posixtimer_sig_unignore(struct task_struct *tsk, int sig)
  2069	{
  2070		struct hlist_head *head = &tsk->signal->ignored_posix_timers;
  2071		struct hlist_node *tmp;
  2072		struct k_itimer *tmr;
  2073	
  2074		if (likely(hlist_empty(head)))
  2075			return;
  2076	
  2077		/*
  2078		 * Rearming a timer with sighand lock held is not possible due to
  2079		 * lock ordering vs. tmr::it_lock. Just stick the sigqueue back and
  2080		 * let the signal delivery path deal with it whether it needs to be
  2081		 * rearmed or not. This cannot be decided here w/o dropping sighand
  2082		 * lock and creating a loop retry horror show.
  2083		 */
  2084		hlist_for_each_entry_safe(tmr, tmp , head, ignored_list) {
  2085			struct task_struct *target;
  2086	
  2087			/*
  2088			 * tmr::sigq.info.si_signo is immutable, so accessing it
  2089			 * without holding tmr::it_lock is safe.
  2090			 */
  2091			if (tmr->sigq.info.si_signo != sig)
  2092				continue;
  2093	
  2094			hlist_del_init(&tmr->ignored_list);
  2095	
  2096			/* This should never happen and leaks a reference count */
> 2097			if (WARN_ON_ONCE(!list_empty(&tmr->sigq.info.list)))
  2098				continue;
  2099	
  2100			/*
  2101			 * Get the target for the signal. If target is a thread and
  2102			 * has exited by now, drop the reference count.
  2103			 */
  2104			target = posixtimer_get_target(tmr);
  2105			if (target)
  2106				posixtimer_queue_sigqueue(&tmr->sigq, target, tmr->it_pid_type);
  2107			else
  2108				posixtimer_putref(tmr);
  2109		}
  2110	}
  2111	#else /* CONFIG_POSIX_TIMERS */
  2112	static inline void posixtimer_sig_ignore(struct task_struct *tsk, struct sigqueue *q) { }
  2113	static inline void posixtimer_sig_unignore(struct task_struct *tsk, int sig) { }
  2114	#endif /* !CONFIG_POSIX_TIMERS */
  2115	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
