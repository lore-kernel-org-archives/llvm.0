Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6450D387;
	Sat, 26 Aug 2023 01:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693013585; x=1724549585;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0xfi99d+MSBvaAIRFTxrUPN86pncS8duO07e0eIUNu4=;
  b=RMmnUKlnruv2jxIdk59OyT5NNDUyR+xRjR2wzul1MF3JStR1Mdbu1JUV
   UQGO7dhGpjzzMq7TSMBIBliNvIz7uYDUVLncgKev4shGK3FF9Bi2pyabF
   3n9cPkPucyKygiCvU+FvFSD0xucRkpcgv4+D2YvkOrsFxP8lSqSPV5dzE
   QZgkQqsaRO6T1viO2QE/vF3yUsOEs0XAnSxhmeWxuFIA+YJtEqlbDiVVn
   jfgmjFuEsJJRCh/rOPSqkgCcemRPNuj2ZkYyFx0eHyUk3MJmJypl02pat
   XIVxWtqrB/Btb0rXMPaceGukimXGe8w+TW9OH7e1Bfrx5vVK90oOeVQ1N
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="405831043"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="405831043"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 18:33:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="767095322"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="767095322"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 25 Aug 2023 18:33:00 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZiAd-0004Dp-17;
	Sat, 26 Aug 2023 01:32:59 +0000
Date: Sat, 26 Aug 2023 09:32:05 +0800
From: kernel test robot <lkp@intel.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [rt-devel:linux-6.5.y-rt-rebase 49/87]
 kernel/printk/printk.c:3361:6: warning: no previous prototype for function
 'console_bkl_kthread_create'
Message-ID: <202308260912.i1Fadnhp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git linux-6.5.y-rt-rebase
head:   c328ba8602906864849212de9927db3542a6d9f1
commit: ebf7d7c2929535b0203001866e5d1f816bc46c6f [49/87] printk: Add threaded printing support for BKL consoles.
config: powerpc64-randconfig-r022-20230826 (https://download.01.org/0day-ci/archive/20230826/202308260912.i1Fadnhp-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308260912.i1Fadnhp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308260912.i1Fadnhp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/printk/printk.c:3361:6: warning: no previous prototype for function 'console_bkl_kthread_create' [-Wmissing-prototypes]
    3361 | void console_bkl_kthread_create(void)
         |      ^
   kernel/printk/printk.c:3361:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3361 | void console_bkl_kthread_create(void)
         | ^
         | static 
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
