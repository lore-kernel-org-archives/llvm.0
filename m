Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C646AA3;
	Tue, 29 Aug 2023 10:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693304400; x=1724840400;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C2z3xUDpBI57xEzPF0joZwUCPxyXmBpgtj+e7mXqqDM=;
  b=lk/S90rOhXRaK2ra1lFrzWjJK/D/ZXV+9Y2DCnkRdUy0xPgBFS/1VAb+
   MH2udtb1bytMVQSCdBKuFasLjn+1qg/OKfgaAYeJbspHPvWP4Vn8rSk/j
   Peg4PuiTPnAfyO7eugOmQEZUZREs0choZCpYAXZzSHbXFATyuzQcwy1k5
   hYoqUlgBhEnRO6uhaxhXxYpjUHUu569c3qI/kLvfyQcgUxGBj9PBEMnmh
   MW03LYsm3VL2JKoAUIAdtVS45MyOymGtduw2UxB3Nw4lzQ7OYvuTL85M+
   BzP8414cb6hz2bcNzK6O/frcDUke24uOAWcgvJ2NQ9X4zyfxelppQEq9L
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="354846738"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; 
   d="scan'208";a="354846738"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 03:19:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="732157262"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; 
   d="scan'208";a="732157262"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 29 Aug 2023 03:19:56 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qavpD-0008e7-1Y;
	Tue, 29 Aug 2023 10:19:55 +0000
Date: Tue, 29 Aug 2023 18:19:07 +0800
From: kernel test robot <lkp@intel.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	cluster-devel@redhat.com
Subject: [gfs2:for-later 27/30] kernel/kthread.c:738: warning: Function
 parameter or member 'k' not described in 'kthread_stop_put'
Message-ID: <202308291833.73wBCBdr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git for-later
head:   b10d94a0cbfc4bbfdf6dcdaa966fb4f17eee08f1
commit: d3a19da72d2ef3e8f1d756b9f859a93ef84c3078 [27/30] kthread: Add kthread_stop_put
config: i386-buildonly-randconfig-001-20230829 (https://download.01.org/0day-ci/archive/20230829/202308291833.73wBCBdr-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230829/202308291833.73wBCBdr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308291833.73wBCBdr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/kthread.c:738: warning: Function parameter or member 'k' not described in 'kthread_stop_put'


vim +738 kernel/kthread.c

   721	
   722	/**
   723	 * kthread_stop_put - stop a thread and put its task struct
   724	 *
   725	 * Stops a kthread and put its task_struct.  This is meant for callers
   726	 * holding an extra reference on the task struct obtained by something
   727	 * like:
   728	 *
   729	 *   t = kthread_create(...);
   730	 *   if (!IS_ERR(t)) {
   731	 *     get_task_struct(t);
   732	 *     wake_up_process(t)
   733	 *   }
   734	 *
   735	 * Returns the result of kthread_stop().
   736	 */
   737	int kthread_stop_put(struct task_struct *k)
 > 738	{
   739		int ret;
   740	
   741		ret = kthread_stop(k);
   742		put_task_struct(k);
   743		return ret;
   744	}
   745	EXPORT_SYMBOL(kthread_stop_put);
   746	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
