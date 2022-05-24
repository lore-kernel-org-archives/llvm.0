Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349337C
	for <llvm@lists.linux.dev>; Tue, 24 May 2022 05:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653370485; x=1684906485;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G1LVkDBsQva+Ds6JI7urcKrGmSXLYOucpwAcGY2rwEA=;
  b=Uvr2l5okkUmhd8jPcbfvNOWXpKBAteu+ppc/vFtoAimA3T6ukUe7nLY9
   IWWklZyO+38shhidGjmxHJT/bEebsVS+cFWcmYr5vx52qvLZRaOHQi/c+
   /6ou3yiZj7xPd/aX1Ws1E14TEDfLoyNM8j3cq5G0txCxT0SJcxJvggefI
   1/XFhRNHaKGXw0+AS4wD3cdZshTiilwtE8TuvC2Xvt03tTNyZUxsppwpH
   Mc2asERwShJBqW5ayQqdK9oE0Q0Fi/lAR87sa7xUGvHiAD4CzkWE386HO
   iAXElcj+MaYRlKj98ncK1GZYSiZIQut31C37D6WKxiYIdvOV/h+yT1bci
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="255501085"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; 
   d="scan'208";a="255501085"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2022 22:34:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; 
   d="scan'208";a="703327724"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 23 May 2022 22:34:43 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ntNBq-0001lO-5j;
	Tue, 24 May 2022 05:34:42 +0000
Date: Tue, 24 May 2022 13:34:10 +0800
From: kernel test robot <lkp@intel.com>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [tomoyo-tomoyo-test1:master 1/1] include/linux/workqueue.h:610:2:
 warning: call to __warn_flushing_systemwide_wq declared with 'warning'
 attribute: Please avoid flushing system-wide workqueues.
Message-ID: <202205241340.Wrnl4CKV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.osdn.net/gitroot/tomoyo/tomoyo-test1.git master
head:   e449c388913ccd36641f7cc0c335029a7cc161f4
commit: e449c388913ccd36641f7cc0c335029a7cc161f4 [1/1] workqueue: Wrap flush_workqueue() using an inline function
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20220524/202205241340.Wrnl4CKV-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 10c9ecce9f6096e18222a331c5e7d085bd813f75)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add tomoyo-tomoyo-test1 git://git.osdn.net/gitroot/tomoyo/tomoyo-test1.git
        git fetch --no-tags tomoyo-tomoyo-test1 master
        git checkout e449c388913ccd36641f7cc0c335029a7cc161f4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/rtc/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/rtc/dev.c:13:
   In file included from include/linux/compat.h:14:
   In file included from include/linux/sem.h:5:
   In file included from include/uapi/linux/sem.h:5:
   In file included from include/linux/ipc.h:7:
   In file included from include/linux/rhashtable-types.h:15:
>> include/linux/workqueue.h:610:2: warning: call to __warn_flushing_systemwide_wq declared with 'warning' attribute: Please avoid flushing system-wide workqueues. [-Wattribute-warning]
           __warn_flushing_systemwide_wq();
           ^
   1 warning generated.


vim +/warning +610 include/linux/workqueue.h

   565	
   566	/*
   567	 * Detect attempt to flush system-wide workqueues at compile time when possible.
   568	 *
   569	 * See https://lkml.kernel.org/r/49925af7-78a8-a3dd-bce6-cfc02e1a9236@I-love.SAKURA.ne.jp
   570	 * for reasons and steps for converting system-wide workqueues into local workqueues.
   571	 */
   572	extern void __warn_flushing_systemwide_wq(void)
   573		__compiletime_warning("Please avoid flushing system-wide workqueues.");
   574	
   575	/**
   576	 * flush_scheduled_work - ensure that any scheduled work has run to completion.
   577	 *
   578	 * Forces execution of the kernel-global workqueue and blocks until its
   579	 * completion.
   580	 *
   581	 * It's very easy to get into trouble if you don't take great care.
   582	 * Either of the following situations will lead to deadlock:
   583	 *
   584	 *	One of the work items currently on the workqueue needs to acquire
   585	 *	a lock held by your code or its caller.
   586	 *
   587	 *	Your code is running in the context of a work routine.
   588	 *
   589	 * They will be detected by lockdep when they occur, but the first might not
   590	 * occur very often.  It depends on what work items are on the workqueue and
   591	 * what locks they need, which you have no control over.
   592	 *
   593	 * In most situations flushing the entire workqueue is overkill; you merely
   594	 * need to know that a particular work item isn't queued and isn't running.
   595	 * In such cases you should use cancel_delayed_work_sync() or
   596	 * cancel_work_sync() instead.
   597	 *
   598	 * Please stop calling this function! A conversion to stop flushing system-wide
   599	 * workqueues is in progress. This function will be removed after all in-tree
   600	 * users stopped calling this function.
   601	 */
   602	static inline void flush_scheduled_work(void)
   603	{
   604	#if !defined(CONFIG_WERROR) && defined(CONFIG_PROVE_LOCKING)
   605		/*
   606		 * Warn only if emitting warning message does not cause build failure
   607		 * and the developer wants warning about possibility of deadlock, for
   608		 * there are currently in-tree flush_scheduled_work() users.
   609		 */
 > 610		__warn_flushing_systemwide_wq();
   611	#endif
   612		__flush_workqueue(system_wq);
   613	}
   614	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
