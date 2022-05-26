Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D7E10EA
	for <llvm@lists.linux.dev>; Thu, 26 May 2022 01:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653527066; x=1685063066;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Gjw8BmQvzZc/6kD0fZavvF6Bp+p5MlKm5JDUBKMmivc=;
  b=HnqNGX4ozuRH21DBezYGe+cyWHV9KSALP9m9xi4oY6rcovDig0Sf4xak
   5MTt/L+Z0dgNITDE4K92RLjM71xJ5HqFin9gwdBHJY6X4VeZeByWCDlCE
   CXkYiZ6hKiYi8pSMsnfBVAUBUeC3Y3p8eRG/RQn+6e+g9dImySW7al/NH
   pZwnvJ4UOMqHlg14mn5SpjpAQ3qRFn7jVOGxS4pDa2Qr+74vHZ2aqms1b
   w+rPzFvmlswO+m0F4WJUSPBqrFD/7MqcYO158+OfRXIXEj7Rst/+0cdxC
   huzplqbPmcJXRHkTWnHrHu77DuRWfhmIA2THEKDMQiOl7O6x6JmZ1Nxsk
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10358"; a="273708968"
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; 
   d="scan'208";a="273708968"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2022 18:04:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; 
   d="scan'208";a="704252899"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 25 May 2022 18:04:24 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nu1vL-0003Ss-Lh;
	Thu, 26 May 2022 01:04:23 +0000
Date: Thu, 26 May 2022 09:00:55 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [frederic-dynticks:cpuset/nocb 1/4] kernel/rcu/rcutorture.c:1890:28:
 error: passing 'const struct cpumask *' to parameter of type 'struct cpumask
 *' discards qualifiers
Message-ID: <202205260823.5HeTsoRS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git cpuset/nocb
head:   ad895c0b6a5e3c41d46f184900d193e70bfc90d3
commit: 25db09cc1131b612d5dbb474ea1640b90b2518ca [1/4] rcu/nocb: Pass a cpumask instead of a single CPU to offload/deoffload
config: hexagon-randconfig-r011-20220524 (https://download.01.org/0day-ci/archive/20220526/202205260823.5HeTsoRS-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d52a6e75b0c402c7f3b42a2b1b2873f151220947)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git/commit/?id=25db09cc1131b612d5dbb474ea1640b90b2518ca
        git remote add frederic-dynticks https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git
        git fetch --no-tags frederic-dynticks cpuset/nocb
        git checkout 25db09cc1131b612d5dbb474ea1640b90b2518ca
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash kernel/rcu/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> kernel/rcu/rcutorture.c:1890:28: error: passing 'const struct cpumask *' to parameter of type 'struct cpumask *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
                           rcu_nocb_cpumask_update(cpumask_of(cpu), true);
                                                   ^~~~~~~~~~~~~~~
   include/linux/cpumask.h:636:25: note: expanded from macro 'cpumask_of'
   #define cpumask_of(cpu) (get_cpu_mask(cpu))
                           ^~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:121:59: note: passing argument to parameter 'cpumask' here
   static inline int rcu_nocb_cpumask_update(struct cpumask *cpumask, bool offload)
                                                             ^
   kernel/rcu/rcutorture.c:1893:28: error: passing 'const struct cpumask *' to parameter of type 'struct cpumask *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
                           rcu_nocb_cpumask_update(cpumask_of(cpu), false);
                                                   ^~~~~~~~~~~~~~~
   include/linux/cpumask.h:636:25: note: expanded from macro 'cpumask_of'
   #define cpumask_of(cpu) (get_cpu_mask(cpu))
                           ^~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:121:59: note: passing argument to parameter 'cpumask' here
   static inline int rcu_nocb_cpumask_update(struct cpumask *cpumask, bool offload)
                                                             ^
   2 errors generated.


vim +1890 kernel/rcu/rcutorture.c

  1858	
  1859	/*
  1860	 * Randomly Toggle CPUs' callback-offload state.  This uses hrtimers to
  1861	 * increase race probabilities and fuzzes the interval between toggling.
  1862	 */
  1863	static int rcu_nocb_toggle(void *arg)
  1864	{
  1865		int cpu;
  1866		int maxcpu = -1;
  1867		int oldnice = task_nice(current);
  1868		long r;
  1869		DEFINE_TORTURE_RANDOM(rand);
  1870		ktime_t toggle_delay;
  1871		unsigned long toggle_fuzz;
  1872		ktime_t toggle_interval = ms_to_ktime(nocbs_toggle);
  1873	
  1874		VERBOSE_TOROUT_STRING("rcu_nocb_toggle task started");
  1875		while (!rcu_inkernel_boot_has_ended())
  1876			schedule_timeout_interruptible(HZ / 10);
  1877		for_each_online_cpu(cpu)
  1878			maxcpu = cpu;
  1879		WARN_ON(maxcpu < 0);
  1880		if (toggle_interval > ULONG_MAX)
  1881			toggle_fuzz = ULONG_MAX >> 3;
  1882		else
  1883			toggle_fuzz = toggle_interval >> 3;
  1884		if (toggle_fuzz <= 0)
  1885			toggle_fuzz = NSEC_PER_USEC;
  1886		do {
  1887			r = torture_random(&rand);
  1888			cpu = (r >> 4) % (maxcpu + 1);
  1889			if (r & 0x1) {
> 1890				rcu_nocb_cpumask_update(cpumask_of(cpu), true);
  1891				atomic_long_inc(&n_nocb_offload);
  1892			} else {
  1893				rcu_nocb_cpumask_update(cpumask_of(cpu), false);
  1894				atomic_long_inc(&n_nocb_deoffload);
  1895			}
  1896			toggle_delay = torture_random(&rand) % toggle_fuzz + toggle_interval;
  1897			set_current_state(TASK_INTERRUPTIBLE);
  1898			schedule_hrtimeout(&toggle_delay, HRTIMER_MODE_REL);
  1899			if (stutter_wait("rcu_nocb_toggle"))
  1900				sched_set_normal(current, oldnice);
  1901		} while (!torture_must_stop());
  1902		torture_kthread_stopping("rcu_nocb_toggle");
  1903		return 0;
  1904	}
  1905	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
