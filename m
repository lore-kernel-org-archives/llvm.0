Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D7338B147;
	Sun, 12 Jul 2026 22:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783896827; cv=none; b=fAL4bfRiSjaE67fiZIeG8pHNpbqd8ntYOHBoOaeE1OGQkdmtRTrPVt09DB6k7711dx1hvkkb7Ecx/6HHcXVs7zA25XsWDOQy2lkx8SkT+sBIqh++Rf+Kw0oRKsNgwF/cwa/yHVPQk33X2Dmxf9FqY/cve26CQfU2KazpyTtJqMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783896827; c=relaxed/simple;
	bh=tSmyDJ+WLgj6BWUEHdNb+oxEMw6jl56UVVWU9OnYkuU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ClaHdYuAYlcIBws5ICulGz50BDl76HDrBdlBoaFwOZcyDRMmDwgIk8wxaFWHlFyZh61b4OTRR5gxtqbmLF3eQKBicaTvOWbo1pAnBK8zeqGY1wtRgZ2M1rN45fBVzPxszcMZBz3Ovkqx43dAsAcDPUMTFE6MIl8uQ6oEs8xvThI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SUMMDgqj; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SUMMDgqj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783896826; x=1815432826;
  h=date:from:to:cc:subject:message-id;
  bh=tSmyDJ+WLgj6BWUEHdNb+oxEMw6jl56UVVWU9OnYkuU=;
  b=SUMMDgqj3HX7tfQSzj2PJ2NdbxQBfT2QVcWzqxC36uqhvTZlqYidxsP2
   PrjoOczItNzPA2e2yFG8EeZoT7MUgmPmFaZQVUM+jEmFLaW2qqM7/abWV
   icXqr2Oy7ykuVD5reDlvDtQ5B6IkHH1L+j5rQA9nrctm9KLRox0caFHYm
   GpUybLmFfehJeV3KdNp4KEg0nppvsmB7iBZbxXG3IfwtQj7saoGeMo4b2
   2G8Mr70JcPOt9t3/FLcVEbQYL4a6iOkqCdmOYTJBV04+Gsm1nguNEUS1R
   KYvdFrg5Y6gTVgFx0NiNPOSLkHRBPEIgdhYFK2dkhgnTavA3cZOqjVzVe
   w==;
X-CSE-ConnectionGUID: 5aayGqsCQf6GyxRmbW8J8g==
X-CSE-MsgGUID: PrXun0QFRAuNHHaXp6MOyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95109656"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="95109656"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 15:53:40 -0700
X-CSE-ConnectionGUID: p5xjLpkeR/+r0v62iNi4tw==
X-CSE-MsgGUID: tjAr1fh0QG6OwIhhTmtqLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="250980746"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 12 Jul 2026 15:53:38 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wj33I-00000000LBa-1N92;
	Sun, 12 Jul 2026 22:53:36 +0000
Date: Mon, 13 Jul 2026 06:52:44 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:timers/cleanup 59/59]
 arch/s390/kernel/early.c:230:2: error: call to undeclared function
 'time_early_init'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202607130621.lg3dg2Y0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/cleanup
head:   0ad363c8e014568032d53fe2c7ab288de68373f4
commit: 0ad363c8e014568032d53fe2c7ab288de68373f4 [59/59] treewide: Remove asm/timex.h includes from generic code
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20260713/202607130621.lg3dg2Y0-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project b3e6e6dabdc02153552a64fc74ff5c7532447eed)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260713/202607130621.lg3dg2Y0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607130621.lg3dg2Y0-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> arch/s390/kernel/early.c:230:2: error: call to undeclared function 'time_early_init'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     230 |         time_early_init();
         |         ^
   1 error generated.
--
>> arch/s390/kernel/debug.c:1187:2: error: call to undeclared function 'store_tod_clock_ext'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1187 |         store_tod_clock_ext(&clk);
         |         ^
>> arch/s390/kernel/debug.c:1189:15: error: use of undeclared identifier 'TOD_UNIX_EPOCH'
    1189 |         timestamp -= TOD_UNIX_EPOCH >> 12;
         |                      ^~~~~~~~~~~~~~
   2 errors generated.
--
>> arch/s390/kernel/smp.c:178:17: error: call to undeclared function 'get_tod_clock_fast'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     178 |         pcpu->ec_clk = get_tod_clock_fast();
         |                        ^
>> arch/s390/kernel/smp.c:434:8: error: call to undeclared function 'get_tod_clock_monotonic'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     434 |         end = get_tod_clock_monotonic() + (1000000UL << 12);
         |               ^
>> arch/s390/kernel/smp.c:828:26: error: call to undeclared function 'get_tod_clock'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     828 |         lc->last_update_clock = get_tod_clock();
         |                                 ^
>> arch/s390/kernel/smp.c:837:2: error: call to undeclared function 'init_cpu_timer'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     837 |         init_cpu_timer();
         |         ^
   arch/s390/kernel/smp.c:837:2: note: did you mean 'get_cpu_timer'?
   arch/s390/include/asm/processor.h:107:38: note: 'get_cpu_timer' declared here
     107 | static __always_inline unsigned long get_cpu_timer(void)
         |                                      ^
   4 errors generated.
--
>> drivers/s390/char/sclp.c:730:13: error: call to undeclared function 'get_tod_clock_monotonic'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     730 |                 timeout = get_tod_clock_monotonic() +
         |                           ^
>> drivers/s390/char/sclp.c:740:13: error: call to undeclared function 'local_tick_disable'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     740 |         old_tick = local_tick_disable();
         |                    ^
   drivers/s390/char/sclp.c:740:13: note: did you mean 'local_mcck_disable'?
   arch/s390/include/asm/processor.h:362:20: note: 'local_mcck_disable' declared here
     362 | static inline void local_mcck_disable(void)
         |                    ^
   drivers/s390/char/sclp.c:750:7: error: call to undeclared function 'get_tod_clock_monotonic'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     750 |                 if (get_tod_clock_monotonic() > timeout && timer_delete(&sclp_request_timer))
         |                     ^
>> drivers/s390/char/sclp.c:758:2: error: call to undeclared function 'local_tick_enable'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     758 |         local_tick_enable(old_tick);
         |         ^
   drivers/s390/char/sclp.c:758:2: note: did you mean 'local_mcck_enable'?
   arch/s390/include/asm/processor.h:367:20: note: 'local_mcck_enable' declared here
     367 | static inline void local_mcck_enable(void)
         |                    ^
   4 errors generated.
--
>> drivers/s390/cio/css.c:971:32: error: call to undeclared function 'get_tod_clock'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     971 |         css_generate_pgid(css, (u32) (get_tod_clock() >> 32));
         |                                       ^
>> drivers/s390/cio/css.c:971:48: warning: shift count >= width of type [-Wshift-count-overflow]
     971 |         css_generate_pgid(css, (u32) (get_tod_clock() >> 32));
         |                                                       ^  ~~
   1 warning and 1 error generated.
--
>> drivers/s390/cio/device_fsm.c:53:34: error: call to undeclared function 'get_tod_clock'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      53 |                "device information:\n", get_tod_clock());
         |                                         ^
>> drivers/s390/cio/device_fsm.c:53:34: warning: format specifies type 'unsigned long' but the argument has type 'int' [-Wformat]
      52 |         printk(KERN_WARNING "cio: ccw device timeout occurred at %lx, "
         |                                                                  ~~~
         |                                                                  %x
      53 |                "device information:\n", get_tod_clock());
         |                                         ^~~~~~~~~~~~~~~
   include/linux/printk.h:511:60: note: expanded from macro 'printk'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:483:19: note: expanded from macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   1 warning and 1 error generated.
--
>> drivers/s390/cio/cmf.c:290:26: error: call to undeclared function 'get_tod_clock'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     290 |         cmb_data->last_update = get_tod_clock();
         |                                 ^
   drivers/s390/cio/cmf.c:365:34: error: call to undeclared function 'get_tod_clock'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     365 |         cdev->private->cmb_start_time = get_tod_clock();
         |                                         ^
   drivers/s390/cio/cmf.c:588:17: error: call to undeclared function 'get_tod_clock'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     588 |         elapsed_time = get_tod_clock() - start_time;
         |                        ^
>> drivers/s390/cio/cmf.c:589:17: error: call to undeclared function 'tod_to_ns'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     589 |         elapsed_time = tod_to_ns(elapsed_time);
         |                        ^
   drivers/s390/cio/cmf.c:675:23: error: call to undeclared function 'tod_to_ns'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     675 |         data->elapsed_time = tod_to_ns(time);
         |                              ^
   drivers/s390/cio/cmf.c:934:23: error: call to undeclared function 'tod_to_ns'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     934 |         data->elapsed_time = tod_to_ns(time);
         |                              ^
   drivers/s390/cio/cmf.c:993:14: error: call to undeclared function 'get_tod_clock'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     993 |                 interval = get_tod_clock() - cdev->private->cmb_start_time;
         |                            ^
   drivers/s390/cio/cmf.c:994:14: error: call to undeclared function 'tod_to_ns'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     994 |                 interval = tod_to_ns(interval);
         |                            ^
   8 errors generated.


vim +/time_early_init +230 arch/s390/kernel/early.c

a156f09c9063bc Heiko Carstens     2022-02-28  226  
ab14de6c37fae2 Heiko Carstens     2007-02-05  227  void __init startup_init(void)
ab14de6c37fae2 Heiko Carstens     2007-02-05  228  {
557b19709da97b Vasily Gorbik      2023-02-09  229  	kasan_early_init();
b1c0854d168cc5 Martin Schwidefsky 2016-10-10 @230  	time_early_init();

:::::: The code at line 230 was first introduced by commit
:::::: b1c0854d168cc5741e9568556e7d7cc3873c9cdc s390/time: refactor clock sync

:::::: TO: Martin Schwidefsky <schwidefsky@de.ibm.com>
:::::: CC: Martin Schwidefsky <schwidefsky@de.ibm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
