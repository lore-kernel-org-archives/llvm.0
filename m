Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F24C1C752;
	Mon,  5 Jun 2023 22:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686004051; x=1717540051;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=60tS7ufVPG6OAsS41ttnhSA8BcqMg9ReN4URLShoTmM=;
  b=gx0Ked2haRE1CcvgQHavv7osRWj+IPOpDA5rjlkR8yW7RQBqfEeHMgX/
   8oOx1HxddAa7vABVva0C4llvqTkhqC3WSNR6yMuHxvbhL8uWTao3EbAvW
   gc8wMnFEY+/y+YHRUP1DmxVOK3FaFpvnrjL7F0tmEX2jBmr0bpS2PXKwj
   zKbtMzhbVxVeXTn2KBval5vlkpqqznRcHYjTdgcSj8nfzv+dm0FxAHVKb
   Bu7p+403XI/QYGcGW7BFuXH6kGRXFJT9sZRWw5DY8eFAil6uvfaGmKpGg
   YxkLCcNC9PQHh84l6f8BROZDwvyVGLuJtp9YNnT+gJriIl+oh8Zr3kl/A
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="355351807"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; 
   d="scan'208";a="355351807"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 15:27:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="659282696"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; 
   d="scan'208";a="659282696"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 05 Jun 2023 15:27:28 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6Iff-0004UB-2H;
	Mon, 05 Jun 2023 22:27:27 +0000
Date: Tue, 6 Jun 2023 06:27:22 +0800
From: kernel test robot <lkp@intel.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [rt-devel:linux-6.4.y-rt-rebase 46/79]
 kernel/printk/printk.c:3361:6: warning: no previous prototype for function
 'console_bkl_kthread_create'
Message-ID: <202306060658.sq3c4uqM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git linux-6.4.y-rt-rebase
head:   0576a708b07124cac8205893c9ed734ee41f64a9
commit: 094c02761170c2bb60bfd8203fde8c553e30871c [46/79] printk: Add threaded printing support for BKL consoles.
config: riscv-randconfig-r002-20230605 (https://download.01.org/0day-ci/archive/20230606/202306060658.sq3c4uqM-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 4faf3aaf28226a4e950c103a14f6fc1d1fdabb1b)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git/commit/?id=094c02761170c2bb60bfd8203fde8c553e30871c
        git remote add rt-devel https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git
        git fetch --no-tags rt-devel linux-6.4.y-rt-rebase
        git checkout 094c02761170c2bb60bfd8203fde8c553e30871c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash kernel/printk/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306060658.sq3c4uqM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/printk/printk.c:3361:6: warning: no previous prototype for function 'console_bkl_kthread_create' [-Wmissing-prototypes]
   void console_bkl_kthread_create(void)
        ^
   kernel/printk/printk.c:3361:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void console_bkl_kthread_create(void)
   ^
   static 
   1 warning generated.


vim +/console_bkl_kthread_create +3361 kernel/printk/printk.c

  3360	
> 3361	void console_bkl_kthread_create(void)
  3362	{
  3363		struct task_struct *kt;
  3364		struct console *c;
  3365	
  3366		lockdep_assert_held(&console_mutex);
  3367	
  3368		if (!IS_ENABLED(CONFIG_PREEMPT_RT))
  3369			return;
  3370	
  3371		if (!printk_threads_enabled || console_bkl_kthread)
  3372			return;
  3373	
  3374		for_each_console(c) {
  3375			if (c->flags & CON_BOOT)
  3376				return;
  3377		}
  3378	
  3379		kt = kthread_run(console_bkl_kthread_func, NULL, "pr/bkl");
  3380		if (IS_ERR(kt)) {
  3381			pr_err("unable to start BKL printing thread\n");
  3382			return;
  3383		}
  3384	
  3385		console_bkl_kthread = kt;
  3386	
  3387		/*
  3388		 * It is important that console printing threads are scheduled
  3389		 * shortly after a printk call and with generous runtime budgets.
  3390		 */
  3391		sched_set_normal(console_bkl_kthread, -20);
  3392	}
  3393	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
