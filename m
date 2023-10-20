Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDACC2DF;
	Fri, 20 Oct 2023 06:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bR5yTs7d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697783097; x=1729319097;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R79iSo+vI4TO5UruwkgFEskq6WOSxr38k5BKT2X6DDc=;
  b=bR5yTs7d1a38A0WA6yTdTGe41U5hPf9Im0asrKeENOEBe1XFptDPG1Fs
   cfRTOfRgaqcEWRJsoYsLZwOyhhknqu70etVJeZiqRuGZ1Lee50biHLoOe
   W8d0G6WvsUIGj4u3/1Ufjth9vtiu4w6svlO8gY/uVJ+wJR04CFbT/cZq3
   dZJbWTN1AjfLOQ8sNZU1JaDYgO0YjoVatIAsbGDFXtsn2wdcGr3OQIDbo
   /hRiasL75t0K4P5Jzz7J9V6gQeodW8PVr1WMcBrLEG+UOjecnaATKh4Qo
   tTBt7l/idW+Du8g/k3fFS539YWeEuvrkGyv3ndL4j5a49M0tXLYHdH2di
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="417569783"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="417569783"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 23:24:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="707136981"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="707136981"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 19 Oct 2023 23:24:53 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtiwF-00038g-0F;
	Fri, 20 Oct 2023 06:24:51 +0000
Date: Fri, 20 Oct 2023 14:24:09 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:rcu/dev 4/4] include/linux/rcupdate.h:137:2:
 error: void function 'rcu_spawn_tasks_kthread' should not return a value
Message-ID: <202310201433.pvZqPrwK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git rcu/dev
head:   f9a3a161b4eb14012fe048077374c34046b770a3
commit: f9a3a161b4eb14012fe048077374c34046b770a3 [4/4] rcu/tasks: Delay creation of RCU-Tasks gp kthread to real idle code
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20231020/202310201433.pvZqPrwK-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231020/202310201433.pvZqPrwK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310201433.pvZqPrwK-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/um/user-offsets.c:17:6: warning: no previous prototype for function 'foo' [-Wmissing-prototypes]
      17 | void foo(void)
         |      ^
   arch/x86/um/user-offsets.c:17:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      17 | void foo(void)
         | ^
         | static 
   1 warning generated.
   In file included from arch/um/kernel/asm-offsets.c:1:
   In file included from arch/x86/um/shared/sysdep/kernel-offsets.h:3:
   In file included from include/linux/sched.h:14:
   In file included from include/linux/pid.h:5:
   In file included from include/linux/rculist.h:11:
>> include/linux/rcupdate.h:137:2: error: void function 'rcu_spawn_tasks_kthread' should not return a value [-Wreturn-type]
     137 |         return 0;
         |         ^      ~
   In file included from arch/um/kernel/asm-offsets.c:1:
   arch/x86/um/shared/sysdep/kernel-offsets.h:9:6: warning: no previous prototype for function 'foo' [-Wmissing-prototypes]
       9 | void foo(void)
         |      ^
   arch/x86/um/shared/sysdep/kernel-offsets.h:9:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
       9 | void foo(void)
         | ^
         | static 
   1 warning and 1 error generated.
   make[3]: *** [scripts/Makefile.build:116: arch/um/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1202: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/rcu_spawn_tasks_kthread +137 include/linux/rcupdate.h

   131	
   132	#ifdef CONFIG_TASKS_RCU
   133	int rcu_spawn_tasks_kthread(void);
   134	#else
   135	static inline void rcu_spawn_tasks_kthread(void)
   136	{
 > 137		return 0;
   138	}
   139	#endif
   140	
   141	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
