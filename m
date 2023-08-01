Received: from mgamail.intel.com (unknown [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FA21ADC5;
	Tue,  1 Aug 2023 14:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690901982; x=1722437982;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ukvCFNrd9s4xLeAGl5CWyUh7MaDl1MFjtdbAcuz7zuI=;
  b=BZznfVIbV4Q4yIJyQGHEs59V8wbiyA8xpwiyMOGY0icq4dQJEsBmpGOE
   FyhfqpnmZEibRVZs4JgPilIz34W83mWYy3b0CZ9R3M9cQSaikIEMyp8Z0
   yPpmR+KeAY4//sjPMSNTg7Dn8npRPYM9/k3I5/QrYYeB5kcePqF9JIBUF
   gaDBHekCBWB1CJ+PpzTiGaVn24OcXsfU4EYgo4NIMeXb5/jJ6TnDJ96Xn
   8fDfPhISpDhi5VTxOKJ6md9LXHwBgnCQGIoDlCItp9hImWxItzx8UuPaa
   PIy0aiylxpxdNX4OJcCBPxVgClJCg6X1bdlakDq+Tyu8b5orEY7DUgaVj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="433159003"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; 
   d="scan'208";a="433159003"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 07:58:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="818823532"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; 
   d="scan'208";a="818823532"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 01 Aug 2023 07:58:00 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQqox-0000N3-2Y;
	Tue, 01 Aug 2023 14:57:59 +0000
Date: Tue, 1 Aug 2023 22:57:53 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:timers/softirq-preemptible 5/6]
 kernel/time/timer.c:1700:3: error: call to undeclared function
 'local_bh_vec_disable'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202308012245.VWA9uc8o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git timers/softirq-preemptible
head:   c233aee141ddb78d07b2f7311be38cfc286de654
commit: e54180a8daee54a469b182cd7e753d17e52394ef [5/6] timers: Introduce soft-interruptible timers
config: arm64-randconfig-r021-20230731 (https://download.01.org/0day-ci/archive/20230801/202308012245.VWA9uc8o-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230801/202308012245.VWA9uc8o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308012245.VWA9uc8o-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/time/timer.c:1700:3: error: call to undeclared function 'local_bh_vec_disable'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   local_bh_vec_disable(1 << TIMER_SOFTIRQ);
                   ^
   kernel/time/timer.c:1700:3: note: did you mean 'local_bh_disable'?
   include/linux/bottom_half.h:18:20: note: 'local_bh_disable' declared here
   static inline void local_bh_disable(void)
                      ^
>> kernel/time/timer.c:1719:3: error: call to undeclared function 'local_bh_vec_enable'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   local_bh_vec_enable(1 << TIMER_SOFTIRQ);
                   ^
   kernel/time/timer.c:1719:3: note: did you mean 'local_bh_enable'?
   include/linux/bottom_half.h:31:20: note: 'local_bh_enable' declared here
   static inline void local_bh_enable(void)
                      ^
   2 errors generated.


vim +/local_bh_vec_disable +1700 kernel/time/timer.c

  1693	
  1694		if (IS_ENABLED(CONFIG_PREEMPT_RT) &&
  1695		    IS_ENABLED(CONFIG_ARCH_HAS_SOFTIRQ_DISABLED_MASK) &&
  1696		    timer->flags & TIMER_SOFTINTERRUPTIBLE)
  1697			softinterruptible = true;
  1698	
  1699		if (softinterruptible) {
> 1700			local_bh_vec_disable(1 << TIMER_SOFTIRQ);
  1701			local_bh_exit();
  1702		}
  1703	
  1704		/*
  1705		 * Couple the lock chain with the lock chain at
  1706		 * timer_delete_sync() by acquiring the lock_map around the fn()
  1707		 * call here and in timer_delete_sync().
  1708		 */
  1709		lock_map_acquire(&lockdep_map);
  1710	
  1711		trace_timer_expire_entry(timer, baseclk);
  1712		fn(timer);
  1713		trace_timer_expire_exit(timer);
  1714	
  1715		lock_map_release(&lockdep_map);
  1716	
  1717		if (softinterruptible) {
  1718			local_bh_enter();
> 1719			local_bh_vec_enable(1 << TIMER_SOFTIRQ);
  1720		}
  1721	
  1722	
  1723		if (count != preempt_count()) {
  1724			WARN_ONCE(1, "timer: %pS preempt leak: %08x -> %08x\n",
  1725				  fn, count, preempt_count());
  1726			/*
  1727			 * Restore the preempt count. That gives us a decent
  1728			 * chance to survive and extract information. If the
  1729			 * callback kept a lock held, bad luck, but not worse
  1730			 * than the BUG() we had.
  1731			 */
  1732			preempt_count_set(count);
  1733		}
  1734	}
  1735	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
