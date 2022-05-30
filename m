Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C869B196
	for <llvm@lists.linux.dev>; Mon, 30 May 2022 07:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653894045; x=1685430045;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/oAtpAhKFz79DLWxiDfq47qye1mCkzf9NNkwYDqE+5g=;
  b=UKmVrAeMfDdiEw/3qqlnE9Fqq44Zta9c/yqUJSWso9A1aE0/p1gHPvCn
   ZE+e2eTuC43kkXUPdKF8VQ7hzo8VQ6cbX2yLy0Ee3BaP4UARgN+zqC6aZ
   v/hbEN87JzLv0Xjmx7vC/1x3S0MYlgkqsSOs1HUo8tZzKN616l2xHRJkb
   XTkBIyLOWR9JrKQZ/YAr4ROw0urH3dXdDGZKB9yQGrfodx0sah/d2ZqjV
   Qg4lcXdbXiw9zq13aBwU6WyeIeafOA/pHEp00HZTPlDrAeuSITatBV522
   K9YZnm34Sq/4RytaD5eGPtmVxx6lM8QbZsKOeInFHRs89+iXLYqQ0Cxey
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10362"; a="274917615"
X-IronPort-AV: E=Sophos;i="5.91,262,1647327600"; 
   d="scan'208";a="274917615"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2022 00:00:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,262,1647327600"; 
   d="scan'208";a="561802135"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 30 May 2022 00:00:43 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nvZOM-0001ZG-Pr;
	Mon, 30 May 2022 07:00:42 +0000
Date: Mon, 30 May 2022 14:59:52 +0800
From: kernel test robot <lkp@intel.com>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 13472/14198] include/linux/workqueue.h:610:2:
 error: call to __warn_flushing_systemwide_wq declared with 'warning'
 attribute: Please avoid flushing system-wide workqueues.
Message-ID: <202205301443.2n5yYq7Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d3fde8ff50ab265749704bd7fbcf70d35235421f
commit: e449c388913ccd36641f7cc0c335029a7cc161f4 [13472/14198] workqueue: Wrap flush_workqueue() using an inline function
config: x86_64-randconfig-a014-20220530 (https://download.01.org/0day-ci/archive/20220530/202205301443.2n5yYq7Y-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0776c48f9b7e69fa447bee57c7c0985caa856be9)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=e449c388913ccd36641f7cc0c335029a7cc161f4
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout e449c388913ccd36641f7cc0c335029a7cc161f4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/display/intel_display.c:28:
   In file included from include/linux/i2c.h:13:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/irqdomain.h:35:
   In file included from include/linux/of.h:17:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:16:
   In file included from include/linux/kernfs.h:12:
   In file included from include/linux/idr.h:15:
   In file included from include/linux/radix-tree.h:12:
   In file included from include/linux/gfp.h:6:
   In file included from include/linux/mmzone.h:21:
   In file included from include/linux/mm_types.h:18:
>> include/linux/workqueue.h:610:2: error: call to __warn_flushing_systemwide_wq declared with 'warning' attribute: Please avoid flushing system-wide workqueues. [-Werror,-Wattribute-warning]
           __warn_flushing_systemwide_wq();
           ^
   1 error generated.


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
