Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE6C15AEA;
	Tue, 28 Nov 2023 08:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bt9gn6Cn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701159143; x=1732695143;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AGYpkcwM+QbY4uebWNvZsCySwRDqsGt8liWhbUR8B6M=;
  b=Bt9gn6CnKQsuFZ0YoHimpm7PwJ3WiSbnxLvDwDbV7zonPzEQol9AUcUf
   0hQ1URA4MyyyoNAVnR9oL4wUDJ9NAVK/3O8WWaIZvQmFO0Fni2r3VqPO6
   c/vSg0kyXOyN0unBJD5uqpJp5dD06Rlq1aVRJpPWGWt7SKgea89WAamJW
   70XQVofzOBy2e7NJjMGhj+qI/sWMa1279WIjcIdM6qXaOjBCE7/byx6ke
   7OWih2yYBh2TtBiLtv1VHfjHqnbVgYLkIhqJm0BZpYc7EinyDjr7d2GJs
   bTsfgXmZ9WCYplt46V7WojBf2uwAgLGJSrGFHV6XfJmDciCZt7diSQIRM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="377902491"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
   d="scan'208";a="377902491"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 00:12:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="859344712"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
   d="scan'208";a="859344712"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 28 Nov 2023 00:12:08 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7tCQ-0007I4-0L;
	Tue, 28 Nov 2023 08:12:06 +0000
Date: Tue, 28 Nov 2023 16:11:07 +0800
From: kernel test robot <lkp@intel.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [rt-devel:linux-6.5.y-rt 44/87] kernel/printk/printk.c:3361:6:
 warning: no previous prototype for function 'console_bkl_kthread_create'
Message-ID: <202311281428.tmjA6dLT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git linux-6.5.y-rt
head:   7f033c046085109bf6044730509ba1395afc0230
commit: 184530c511550e6ddeacb1d86df7b8c0b923e0bc [44/87] printk: Add threaded printing support for BKL consoles.
config: i386-buildonly-randconfig-003-20231128 (https://download.01.org/0day-ci/archive/20231128/202311281428.tmjA6dLT-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231128/202311281428.tmjA6dLT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311281428.tmjA6dLT-lkp@intel.com/

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
