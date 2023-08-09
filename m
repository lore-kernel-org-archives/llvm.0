Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D1D24512;
	Wed,  9 Aug 2023 21:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691615632; x=1723151632;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DGY+Ebdjceb0GEAHe2jqRRlpj7TTaBCkl+ciV1zjV7I=;
  b=eYLBmdIK/hCnFoIHYsirAL35X8Y/4v6KFE7jTFqFlrQjiFWq/Mta6Bwh
   j1M6LbYxwd83OvdiL3TX+A6gLUoZcQ3bV9sz5qkx+LkLX1DTstiwtHhJm
   VEOmhSu7VNujFfhp2idlinBKeLnZqofvOapjLdPSWHWJOImN0cjGQuYAR
   AMeuYA7KoglTFMz65BGqn8AAVUPin7h6MW05oirAZ1brGo1zBBjiZi+d6
   mYo3FFIQ3pEEwwmCHIK8/jF6saOO398xPTXxLohAaBnQmUqR/xYI2O0+L
   Fm2pk2LcWh/SvHHJLSH0YJu94I6dSKpfMfjhXfKU5s18ggIVsS5TqTDwh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="374014177"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; 
   d="scan'208";a="374014177"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 14:13:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="681844719"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; 
   d="scan'208";a="681844719"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 09 Aug 2023 14:13:45 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTqUy-0006PO-2G;
	Wed, 09 Aug 2023 21:13:44 +0000
Date: Thu, 10 Aug 2023 05:13:23 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:locking/core 5/7] kernel/sched/core.c:7068:18: error:
 invalid application of 'typeof' to bit-field
Message-ID: <202308100502.Q4h5VfV2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/core
head:   47a35f56e63994577fabd8fbc58b6551416f8250
commit: 876dda04d9e0849c1d112180ec0e35cab6fbe494 [5/7] sched: Provide rt_mutex specific scheduler helpers
config: arm-randconfig-r003-20230809 (https://download.01.org/0day-ci/archive/20230810/202308100502.Q4h5VfV2-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308100502.Q4h5VfV2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308100502.Q4h5VfV2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/core.c:7068:18: error: invalid application of 'typeof' to bit-field
    7068 |         lockdep_assert(!fetch_and_set(current->sched_rt_mutex, 1));
         |                         ^
   kernel/sched/core.c:7064:38: note: expanded from macro 'fetch_and_set'
    7064 | #define fetch_and_set(x, v) ({ typeof(x) _x = (x); (x) = (v); _x; })
         |                                      ^
   kernel/sched/core.c:7081:17: error: invalid application of 'typeof' to bit-field
    7081 |         lockdep_assert(fetch_and_set(current->sched_rt_mutex, 0));
         |                        ^
   kernel/sched/core.c:7064:38: note: expanded from macro 'fetch_and_set'
    7064 | #define fetch_and_set(x, v) ({ typeof(x) _x = (x); (x) = (v); _x; })
         |                                      ^
   2 errors generated.


vim +/typeof +7068 kernel/sched/core.c

  7065	
  7066	void rt_mutex_pre_schedule(void)
  7067	{
> 7068		lockdep_assert(!fetch_and_set(current->sched_rt_mutex, 1));
  7069		sched_submit_work(current);
  7070	}
  7071	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
