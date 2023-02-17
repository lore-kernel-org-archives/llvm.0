Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CE2376;
	Fri, 17 Feb 2023 03:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676603893; x=1708139893;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dJTTAfOTed3nnh1VUrRj2G9v30va4J9QFEQSzlTKiOQ=;
  b=OL06LGl1K77seYT7feY3WCpWsIhScUXV4v2NJj0eNvfaJ98hNPGZ0SU6
   LZXaouGS6x2PZ+xwd81F7+BJLAlG/6jMbWyyD5bIFV7Buf7ffi4slhDql
   LlSf5WCmX5fdR4kevtiMgZlMZRBnYjIjDwIeq0yrROi8bEW7pOXs6CiNp
   U5glskgcIa2aNyUk3IKsKwOUMcE5fAfYfXY28oX3hImd/qvffUbnJtU97
   ZmCszmzCTLO5hcHG09NYVKtzjLFf1YEGWfxAdEEtllKGfHgSXxQNbRhFP
   Q3UFSl0gl8NO56RezSilMCcd3YLU1tDY4SKKbR+v61VGDJTjqXQUWpKSS
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="394374442"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="394374442"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 19:17:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="670403171"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="670403171"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 16 Feb 2023 19:17:58 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSrG1-000B4n-17;
	Fri, 17 Feb 2023 03:17:57 +0000
Date: Fri, 17 Feb 2023 11:17:03 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jfern:timers/dyn_hrtimer 6/6] kernel/time/hrtimer.c:2303:13: error:
 use of undeclared identifier 'hrtimer_hres_enabled'; did you mean
 'hrtimer_is_hres_enabled'?
Message-ID: <202302171109.LLKBlkkh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git timers/dyn_hrtimer
head:   31e07f4405a012e1635024ec1b251a0751eca016
commit: 74512df043ae505bec27969a542a6c7b8e66e5ac [6/6] sysctl boiler plate
config: arm64-randconfig-r023-20230212 (https://download.01.org/0day-ci/archive/20230217/202302171109.LLKBlkkh-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/commit/?id=74512df043ae505bec27969a542a6c7b8e66e5ac
        git remote add jfern https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
        git fetch --no-tags jfern timers/dyn_hrtimer
        git checkout 74512df043ae505bec27969a542a6c7b8e66e5ac
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash kernel/time/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302171109.LLKBlkkh-lkp@intel.com/

All errors (new ones prefixed by >>):

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
>> kernel/time/hrtimer.c:2303:13: error: use of undeclared identifier 'hrtimer_hres_enabled'; did you mean 'hrtimer_is_hres_enabled'?
                   .data           = &hrtimer_hres_enabled,
                                      ^~~~~~~~~~~~~~~~~~~~
                                      hrtimer_is_hres_enabled
   kernel/time/hrtimer.c:762:19: note: 'hrtimer_is_hres_enabled' declared here
   static inline int hrtimer_is_hres_enabled(void) { return 0; }
                     ^
   4 warnings and 1 error generated.


vim +2303 kernel/time/hrtimer.c

  2299	
  2300	static struct ctl_table timer_hres_sysctl[] = {
  2301		{
  2302			.procname	= "timer_highres",
> 2303			.data		= &hrtimer_hres_enabled,
  2304			.maxlen		= sizeof(unsigned int),
  2305			.mode		= 0644,
  2306			.proc_handler	= hrtimer_hres_handler,
  2307			.extra1		= SYSCTL_ZERO,
  2308			.extra2		= SYSCTL_ONE,
  2309		},
  2310		{}
  2311	};
  2312	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
