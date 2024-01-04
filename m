Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27004C60;
	Thu,  4 Jan 2024 01:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Num5mb19"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704331214; x=1735867214;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4Ze0Tdgo1fQGOsqQ1lqVwA3BRdBAUETvSb8m1oaGkKU=;
  b=Num5mb19r15VdHPYGl7Op6yw0nnOM+hxgRX4GY+ZQU03hJdNeYUskwnL
   URgr4AF8o6+zGjSZFiTYr00doGV9/Q22x8SA7/TC1G6HbExHypaTQxGyu
   qRIWWYbXjHxaLBmXNojoMPwgIzuMxezPNKnm0n6dk+9+f1se9VVR3cN0O
   XLA1UThjy211IIrmH1aECHSnlBgNK6Kqh5NXituE3dhqJRs6fvGitazBm
   Il6VIuWdLcR2qRx3F8ITNf7VUjb1sMw4l3HsvM4BlVpVKa9Pl0wXVnFhY
   dT/Oszv3Pcqkzlueh95EWBOH9fAQyWnXrI+xYacyTZ2DFdGZfrSwCySBd
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="382060190"
X-IronPort-AV: E=Sophos;i="6.04,329,1695711600"; 
   d="scan'208";a="382060190"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2024 17:20:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="1111541250"
X-IronPort-AV: E=Sophos;i="6.04,329,1695711600"; 
   d="scan'208";a="1111541250"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 03 Jan 2024 17:20:12 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rLCP4-000Mkm-0e;
	Thu, 04 Jan 2024 01:20:10 +0000
Date: Thu, 4 Jan 2024 09:19:34 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:timers/core 13/15]
 kernel/time/tick-sched.c:1563:23: error: too few arguments to function call,
 expected 2, have 1
Message-ID: <202401040915.501Ru1Ez-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git timers/core
head:   0597d80e45327e79c48f36f941bad088404dc746
commit: 003b9fd66c1eebaa2d362901c1907fe69e8fe2ca [13/15] tick: Split nohz and highres features from nohz_mode
config: hexagon-randconfig-001-20240104 (https://download.01.org/0day-ci/archive/20240104/202401040915.501Ru1Ez-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 7e186d366d6c7def0543acc255931f617e76dff0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240104/202401040915.501Ru1Ez-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401040915.501Ru1Ez-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/time/tick-sched.c:14:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from kernel/time/tick-sched.c:14:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from kernel/time/tick-sched.c:14:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> kernel/time/tick-sched.c:1563:23: error: too few arguments to function call, expected 2, have 1
    1563 |         tick_nohz_activate(ts);
         |         ~~~~~~~~~~~~~~~~~~   ^
   kernel/time/tick-sched.c:1509:20: note: 'tick_nohz_activate' declared here
    1509 | static inline void tick_nohz_activate(struct tick_sched *ts, int mode) { }
         |                    ^                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   6 warnings and 1 error generated.


vim +1563 kernel/time/tick-sched.c

  1531	
  1532	/**
  1533	 * tick_setup_sched_timer - setup the tick emulation timer
  1534	 * @mode: tick_nohz_mode to setup for
  1535	 */
  1536	void tick_setup_sched_timer(bool hrtimer)
  1537	{
  1538		struct tick_sched *ts = this_cpu_ptr(&tick_cpu_sched);
  1539	
  1540		/* Emulate tick processing via per-CPU hrtimers: */
  1541		hrtimer_init(&ts->sched_timer, CLOCK_MONOTONIC, HRTIMER_MODE_ABS_HARD);
  1542		if (hrtimer) {
  1543			tick_sched_flag_set(ts, TS_FLAG_HIGHRES);
  1544			ts->sched_timer.function = tick_nohz_highres_handler;
  1545		}
  1546	
  1547		/* Get the next period (per-CPU) */
  1548		hrtimer_set_expires(&ts->sched_timer, tick_init_jiffy_update());
  1549	
  1550		/* Offset the tick to avert 'jiffies_lock' contention. */
  1551		if (sched_skew_tick) {
  1552			u64 offset = TICK_NSEC >> 1;
  1553			do_div(offset, num_possible_cpus());
  1554			offset *= smp_processor_id();
  1555			hrtimer_add_expires_ns(&ts->sched_timer, offset);
  1556		}
  1557	
  1558		hrtimer_forward_now(&ts->sched_timer, TICK_NSEC);
  1559		if (hrtimer)
  1560			hrtimer_start_expires(&ts->sched_timer, HRTIMER_MODE_ABS_PINNED_HARD);
  1561		else
  1562			tick_program_event(hrtimer_get_expires(&ts->sched_timer), 1);
> 1563		tick_nohz_activate(ts);
  1564	}
  1565	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
