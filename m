Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EB363CC;
	Wed,  6 Dec 2023 02:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D2dZh12x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701830840; x=1733366840;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9nbzF4iFuelo7idaJWyBPtD/DXAnJq9jgv1ivPPwVKg=;
  b=D2dZh12xnliJ4coAMJOoDWYSmBdn8+olqaFMNrY294EBXKEy8h5Ew1Tq
   Bzx5EVA8IALsdfCs8pWDSO7QD1LhB+CtPZe4BdmuUJvfQTHFUgWSUAZ12
   03Ax3Vh+MAPG7l7D42Y+vqiSILTJH7YWmFGZ+ZblodhXER/L40rzA9Uo2
   IWqLVri7Y8uaWvUzctwTOiPxfc1lcrxrThNjEO+jBX9lllUFdAvtDHFpL
   gufrXLOgJKBLW0QEwH11BdOKsENUET8lY1HuHLfK/Gcu4ZUBACsjBxNh4
   lFS/rk9JMOOpNWTQaCIwp3jCw2IRWMjqtOhAppUI18nDYafliAfvv2LkR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1060117"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="1060117"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 18:47:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1102665130"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="1102665130"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 05 Dec 2023 18:47:18 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAhwS-000A74-10;
	Wed, 06 Dec 2023 02:47:16 +0000
Date: Wed, 6 Dec 2023 10:46:24 +0800
From: kernel test robot <lkp@intel.com>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:timers/pushpull 29/32] kernel/time/timer.c:2209:6:
 warning: no previous prototype for function 'timer_base_is_idle'
Message-ID: <202312061041.Ln8dqICl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Anna-Maria,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/pushpull
head:   c5f729902c462bd2f9153641aebe042bbb5f9ede
commit: 2d179dd1eb10c4033f67686598041df429fb9382 [29/32] timers: Introduce function to check timer base is_idle flag
config: arm-mv78xx0_defconfig (https://download.01.org/0day-ci/archive/20231206/202312061041.Ln8dqICl-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312061041.Ln8dqICl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312061041.Ln8dqICl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/time/timer.c:2209:6: warning: no previous prototype for function 'timer_base_is_idle' [-Wmissing-prototypes]
    2209 | bool timer_base_is_idle(void)
         |      ^
   kernel/time/timer.c:2209:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2209 | bool timer_base_is_idle(void)
         | ^
         | static 
   1 warning generated.


vim +/timer_base_is_idle +2209 kernel/time/timer.c

  2203	
  2204	/**
  2205	 * timer_base_is_idle() - Return whether timer base is set idle
  2206	 *
  2207	 * Returns value of local timer base is_idle value.
  2208	 */
> 2209	bool timer_base_is_idle(void)
  2210	{
  2211		return __this_cpu_read(timer_bases[BASE_LOCAL].is_idle);
  2212	}
  2213	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
