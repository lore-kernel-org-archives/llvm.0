Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278D9A937;
	Thu, 27 Apr 2023 22:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682635951; x=1714171951;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MJ+tpye/MxLB3gRJcK/IkawpTh4vpodnJylo1pwkKV4=;
  b=D2nTUkBjoHW94pRgVGu7H2MK9mi7qWy4/SD3zmZiTO5s/J1Q+ClQwllv
   b+VSKe6Va7Ldmd5cLhXP/9UIF4jp+4CsA7a5AwQ+erphXmPazSPRg/WUH
   /RXbS8jNKYyTb+qs4bQ9STWwP1xuIM32wkEFFDgUtkG1O5T/zAakcsJl+
   rt3BAJB1vfKsqH71EFMifrC8+xaOpYtG2BDN33K52bQW/untEqwZQwVUo
   HpS2ehefEHk3shs9dA9Praiv3vPBZNkKQRVS1w6iuDjbR+nc+uSYphyFn
   wzIbapXF+VngfhvLZM6W4nDLRbi2AbQj2sQMz3imWw83gWetFB+SywLl2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="350476234"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; 
   d="scan'208";a="350476234"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 15:52:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="671938919"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; 
   d="scan'208";a="671938919"
Received: from lkp-server01.sh.intel.com (HELO b95e16499b55) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 27 Apr 2023 15:52:29 -0700
Received: from kbuild by b95e16499b55 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psATU-0000B7-1e;
	Thu, 27 Apr 2023 22:52:28 +0000
Date: Fri, 28 Apr 2023 06:52:15 +0800
From: kernel test robot <lkp@intel.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [rt-devel:linux-6.3.y-rt-rebase 44/77]
 kernel/printk/printk.c:3370:6: warning: no previous prototype for function
 'console_bkl_kthread_create'
Message-ID: <202304280656.BBdRteur-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git linux-6.3.y-rt-rebase
head:   35ea14bea980c7f5e134ba962f64c1d1376f88f8
commit: 28b0eb3e1cf4791cba0be98b5103be3f077ad5d1 [44/77] printk: Add threaded printing support for BKL consoles.
config: arm64-randconfig-r001-20230428 (https://download.01.org/0day-ci/archive/20230428/202304280656.BBdRteur-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git/commit/?id=28b0eb3e1cf4791cba0be98b5103be3f077ad5d1
        git remote add rt-devel https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git
        git fetch --no-tags rt-devel linux-6.3.y-rt-rebase
        git checkout 28b0eb3e1cf4791cba0be98b5103be3f077ad5d1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash kernel/printk/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304280656.BBdRteur-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/printk/printk.c:3370:6: warning: no previous prototype for function 'console_bkl_kthread_create' [-Wmissing-prototypes]
   void console_bkl_kthread_create(void)
        ^
   kernel/printk/printk.c:3370:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void console_bkl_kthread_create(void)
   ^
   static 
   1 warning generated.


vim +/console_bkl_kthread_create +3370 kernel/printk/printk.c

  3369	
> 3370	void console_bkl_kthread_create(void)
  3371	{
  3372		struct task_struct *kt;
  3373		struct console *c;
  3374	
  3375		lockdep_assert_held(&console_mutex);
  3376	
  3377		if (!IS_ENABLED(CONFIG_PREEMPT_RT))
  3378			return;
  3379	
  3380		if (!printk_threads_enabled || console_bkl_kthread)
  3381			return;
  3382	
  3383		for_each_console(c) {
  3384			if (c->flags & CON_BOOT)
  3385				return;
  3386		}
  3387	
  3388		kt = kthread_run(console_bkl_kthread_func, NULL, "pr/bkl");
  3389		if (IS_ERR(kt)) {
  3390			pr_err("unable to start BKL printing thread\n");
  3391			return;
  3392		}
  3393	
  3394		console_bkl_kthread = kt;
  3395	
  3396		/*
  3397		 * It is important that console printing threads are scheduled
  3398		 * shortly after a printk call and with generous runtime budgets.
  3399		 */
  3400		sched_set_normal(console_bkl_kthread, -20);
  3401	}
  3402	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
