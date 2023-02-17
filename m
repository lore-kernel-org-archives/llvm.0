Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8749469;
	Fri, 17 Feb 2023 20:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676667156; x=1708203156;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NdtU66rqatKJZbyjB6Madcg3aWu8nFR+ZP9FV09wk2M=;
  b=REcK3OAeWOetg36c34t9Dy/fWOU72gZZRryPNqOaAIO+Yj36+0iPWveG
   riYH+4SqBdUZdHmQNLwGkjvSl/iLaDDP+RCI0j7r0RcqMCdxaYOdZGdUt
   OojSmH6Ev9PABz9fyKXSexh8jTHyj9qa/AV2h+d7W78OzJWisOHnZ1Vrx
   CIOtvMblfSlhAk3Ur/0nxvIYz/KGK8dWAbT/Qbz+0OUFFckIQRYZopeAR
   XCfDHLw0a7Fsed5Uv0Kb00mDcqRaPgO8Xk+/H1vPmFH3UASqSdzUkucVU
   3GZYlbYX6LMEw3KUjlZMUtoGg8sgeF3qYdAxpU0wWL1JRI7Qc2g5cOaXc
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="315801348"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="315801348"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 12:52:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="916209600"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="916209600"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 17 Feb 2023 12:52:34 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pT7ib-000BoP-2k;
	Fri, 17 Feb 2023 20:52:33 +0000
Date: Sat, 18 Feb 2023 04:51:43 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jfern:timers/dyn_hrtimer 8/8] kernel/time/hrtimer.c:2266:6:
 warning: no previous prototype for function 'hrtimer_smp_call'
Message-ID: <202302180419.n7fR1f51-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git timers/dyn_hrtimer
head:   621948fff66f3ce64f723a81566228363a29e3b5
commit: 621948fff66f3ce64f723a81566228363a29e3b5 [8/8] hrtimer: Add a sysctl to lower resolution of timers
config: arm-randconfig-r026-20230217 (https://download.01.org/0day-ci/archive/20230218/202302180419.n7fR1f51-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/commit/?id=621948fff66f3ce64f723a81566228363a29e3b5
        git remote add jfern https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
        git fetch --no-tags jfern timers/dyn_hrtimer
        git checkout 621948fff66f3ce64f723a81566228363a29e3b5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash kernel/time/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302180419.n7fR1f51-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/time/hrtimer.c:120:21: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [CLOCK_REALTIME]        = HRTIMER_BASE_REALTIME,
                                     ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:118:27: note: previous initialization is here
           [0 ... MAX_CLOCKS - 1]  = HRTIMER_MAX_CLOCK_BASES,
                                     ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:121:22: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [CLOCK_MONOTONIC]       = HRTIMER_BASE_MONOTONIC,
                                     ^~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:118:27: note: previous initialization is here
           [0 ... MAX_CLOCKS - 1]  = HRTIMER_MAX_CLOCK_BASES,
                                     ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:122:21: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [CLOCK_BOOTTIME]        = HRTIMER_BASE_BOOTTIME,
                                     ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:118:27: note: previous initialization is here
           [0 ... MAX_CLOCKS - 1]  = HRTIMER_MAX_CLOCK_BASES,
                                     ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:123:17: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [CLOCK_TAI]             = HRTIMER_BASE_TAI,
                                     ^~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:118:27: note: previous initialization is here
           [0 ... MAX_CLOCKS - 1]  = HRTIMER_MAX_CLOCK_BASES,
                                     ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:1648:7: warning: variable 'expires_in_hardirq' set but not used [-Wunused-but-set-variable]
           bool expires_in_hardirq;
                ^
>> kernel/time/hrtimer.c:2266:6: warning: no previous prototype for function 'hrtimer_smp_call' [-Wmissing-prototypes]
   void hrtimer_smp_call(void *info)
        ^
   kernel/time/hrtimer.c:2266:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void hrtimer_smp_call(void *info)
   ^
   static 
   kernel/time/hrtimer.c:276:20: warning: unused function 'is_migration_base' [-Wunused-function]
   static inline bool is_migration_base(struct hrtimer_clock_base *base)
                      ^
   kernel/time/hrtimer.c:1874:20: warning: unused function '__hrtimer_peek_ahead_timers' [-Wunused-function]
   static inline void __hrtimer_peek_ahead_timers(void)
                      ^
   8 warnings generated.
--
>> kernel/time/tick-sched.c:1395:6: warning: no previous prototype for function 'tick_nohz_switch_to_nohz' [-Wmissing-prototypes]
   void tick_nohz_switch_to_nohz(void)
        ^
   kernel/time/tick-sched.c:1395:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void tick_nohz_switch_to_nohz(void)
   ^
   static 
   1 warning generated.


vim +/hrtimer_smp_call +2266 kernel/time/hrtimer.c

  2264	
  2265	void tick_nohz_switch_to_nohz(void);
> 2266	void hrtimer_smp_call(void *info)
  2267	{
  2268		struct hrtimer_cpu_base *base = this_cpu_ptr(&hrtimer_bases);
  2269		bool hres = *((bool *)info);
  2270	
  2271		if (hres == __hrtimer_hres_active(base))
  2272			return;
  2273	
  2274		if (!hres) {
  2275			trace_printk("smp call: called stn\n");
  2276	
  2277			tick_nohz_switch_to_nohz();
  2278			base->hres_active = 0;
  2279			hrtimer_resolution = LOW_RES_NSEC;
  2280			return;
  2281		}
  2282		hrtimer_switch_to_hres();
  2283	}
  2284	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
