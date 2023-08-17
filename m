Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E2C12B62;
	Thu, 17 Aug 2023 11:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692270049; x=1723806049;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8YLd6v+XCjtNvZ9V//6v/gUDJj7FKxTnr8OvhgVBG6E=;
  b=DIhF8zpMZ5OJ04lui1PVOIqH07oRTfmQ7Dfj3LtRyBtEnN/J+NqEQHdu
   JD6CLhikcjuWd6bgB+UQ2InE0aiL+6Fzx8odFI0hLDoU2EX8tvA2XmXyI
   A5FggAmyjoEr616u8UzA3ep847Qp53qCuZdrRIUAFwJ5UsEx9PCsUza3j
   iZc3RaDIyreA13miARX07lqftpdvjHsqO1X77fXelBnfKyEHeS04WAm/G
   wvpPikul8OzKH4pZEOFwzQHsBGkzHsI3A2FN4zOEn7M1PEXm1c0/hQ/E9
   wa6Ddk/uZMLIaLuJky0dsMh+F7AkusderrEbCxsUc+LJImUP7okd4/Hhi
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="370247813"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="370247813"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 04:00:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="764031285"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="764031285"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 17 Aug 2023 04:00:45 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWak8-000141-1P;
	Thu, 17 Aug 2023 11:00:44 +0000
Date: Thu, 17 Aug 2023 19:00:01 +0800
From: kernel test robot <lkp@intel.com>
To: Tony Lindgren <tony@atomide.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: drivers/clocksource/timer-ti-dm.c:82: warning: Function parameter or
 member 'val' not described in 'dmtimer_write'
Message-ID: <202308171822.ZcUAzWPw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4853c74bd7ab7fdb83f319bd9ace8a08c031e9b6
commit: 49cd16bb573e43dc2ee64d734b9b545475dbb35f clocksource/drivers/timer-ti-dm: Simplify register writes with dmtimer_write()
date:   11 months ago
config: riscv-randconfig-r002-20230817 (https://download.01.org/0day-ci/archive/20230817/202308171822.ZcUAzWPw-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308171822.ZcUAzWPw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308171822.ZcUAzWPw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clocksource/timer-ti-dm.c:82: warning: Function parameter or member 'val' not described in 'dmtimer_write'
>> drivers/clocksource/timer-ti-dm.c:82: warning: Excess function parameter 'value' description in 'dmtimer_write'


vim +82 drivers/clocksource/timer-ti-dm.c

41e79b1d458477 Tony Lindgren 2022-04-08  70  
49cd16bb573e43 Tony Lindgren 2022-08-15  71  /**
49cd16bb573e43 Tony Lindgren 2022-08-15  72   * dmtimer_write - write timer registers in posted and non-posted mode
49cd16bb573e43 Tony Lindgren 2022-08-15  73   * @timer:      timer pointer over which write operation is to perform
49cd16bb573e43 Tony Lindgren 2022-08-15  74   * @reg:        lowest byte holds the register offset
49cd16bb573e43 Tony Lindgren 2022-08-15  75   * @value:      data to write into the register
49cd16bb573e43 Tony Lindgren 2022-08-15  76   *
49cd16bb573e43 Tony Lindgren 2022-08-15  77   * The posted mode bit is encoded in reg. Note that in posted mode, the write
49cd16bb573e43 Tony Lindgren 2022-08-15  78   * pending bit must be checked. Otherwise a write on a register which has a
49cd16bb573e43 Tony Lindgren 2022-08-15  79   * pending write will be lost.
49cd16bb573e43 Tony Lindgren 2022-08-15  80   */
49cd16bb573e43 Tony Lindgren 2022-08-15  81  static inline void dmtimer_write(struct omap_dm_timer *timer, u32 reg, u32 val)
41e79b1d458477 Tony Lindgren 2022-04-08 @82  {
49cd16bb573e43 Tony Lindgren 2022-08-15  83  	u16 wp, offset;
49cd16bb573e43 Tony Lindgren 2022-08-15  84  
49cd16bb573e43 Tony Lindgren 2022-08-15  85  	wp = reg >> WPSHIFT;
49cd16bb573e43 Tony Lindgren 2022-08-15  86  	offset = reg & 0xff;
49cd16bb573e43 Tony Lindgren 2022-08-15  87  
49cd16bb573e43 Tony Lindgren 2022-08-15  88  	/* Wait for a possible write pending bit in posted mode */
49cd16bb573e43 Tony Lindgren 2022-08-15  89  	if (wp && timer->posted)
49cd16bb573e43 Tony Lindgren 2022-08-15  90  		while (readl_relaxed(timer->pend) & wp)
41e79b1d458477 Tony Lindgren 2022-04-08  91  			cpu_relax();
41e79b1d458477 Tony Lindgren 2022-04-08  92  
49cd16bb573e43 Tony Lindgren 2022-08-15  93  	writel_relaxed(val, timer->func_base + offset);
41e79b1d458477 Tony Lindgren 2022-04-08  94  }
41e79b1d458477 Tony Lindgren 2022-04-08  95  

:::::: The code at line 82 was first introduced by commit
:::::: 41e79b1d458477212d0a880c87622bcaa69ab3ea clocksource/drivers/timer-ti-dm: Move inline functions to driver for am6

:::::: TO: Tony Lindgren <tony@atomide.com>
:::::: CC: Daniel Lezcano <daniel.lezcano@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
