Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756F2480DCD;
	Wed,  1 Jul 2026 12:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782909540; cv=none; b=EIhuGJlh/fsX1vBmyS/t7WzsLk2c4rizQ6G7vDj+voYUu6lntgro6bvZL4q6/mQtRfznnpQncTl4jILKkz5SMAbHQNYoOCigmG7d7jq2g/Q0gjmcGqgHQyj0CQvOPuNjNkBZIDZrv6mlKJaFUqzxjvqYPMKnnVf5usvFAzse86I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782909540; c=relaxed/simple;
	bh=AwewDJtObQedp0iqnaU6tor13GazPTeID0ZEBQdRrb4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rLrp3vIEZiap81wimo92JpIMP6f3oZjXKiJ1WGkyFca6Ri/xZGd/2lPptKNxs66k7DX7X3LEcX3jUmf44FecYs2MoLA7f1U34MzlXq+I3eewXjHYUPOoLd6zuwHIi+/CaK9Qg73vm1YzUzaZUx38QNOO56IVYo9yu+eoshruF+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MV4nRdsn; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MV4nRdsn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782909538; x=1814445538;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AwewDJtObQedp0iqnaU6tor13GazPTeID0ZEBQdRrb4=;
  b=MV4nRdsnM66p/rzY2XYvLilt2e3MOQGvkZb9rLG00QJwI9rY1DOKHHQU
   JsiZgS9+ADxQmN1a2zxsGdR0mq3Qy8ydZihhtsxs12smjpsiwwpVlqaiU
   UPjiPxwdAE1Fpr2/GiiNb+DOsSpPk/I/AovXhTQV/5m9B0pAKH80nKIQn
   YPGIPMK1TG0v4aq1tfxZWL6mzIxrA5BXtti0bi0Q8RvopollB4KIIi5eU
   fj/+0PuVaho/89nT6/KC7xkIFVGtIvwj9XqFcccKTIXRhZQXA3qv9Wqiu
   qr7SJCObZh41VKdfC/2Qmz56b+D2pnPR/z+lk2lwEFLZHHKYddcLIQ+nC
   A==;
X-CSE-ConnectionGUID: gE7mP/9TRgqhhAbx75CwAw==
X-CSE-MsgGUID: +rplMaAJQVSiKTjW3AWUNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="71164777"
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="71164777"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 05:38:58 -0700
X-CSE-ConnectionGUID: lJxqaXX3Tk2CheDhoIQ5rg==
X-CSE-MsgGUID: i8XVqhrXSYmYtkJtNYzOMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="252684306"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 01 Jul 2026 05:38:56 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weuDM-000000009Hh-2m71;
	Wed, 01 Jul 2026 12:38:52 +0000
Date: Wed, 01 Jul 2026 20:38:02 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh?= (Schneider Electric)" <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/hrtimer-header-dependencies 6/6]
 kernel/time/timekeeping.c:1684:16: error: use of undeclared identifier
 'HRTIMER_BASE_REALTIME'
Message-ID: <202607012020.CeEmwJum-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/hrtimer-header-dependencies
head:   0e0dec10cf362a392e4fe54d84f43509556d903e
commit: 0e0dec10cf362a392e4fe54d84f43509556d903e [6/6] hrtimer: Remove inclusion of hrtimer_bases.h remove from hrtimer.h
config: hexagon-allnoconfig (https://download.01.org/0day-ci/archive/20260701/202607012020.CeEmwJum-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 6cc609bb250b21b47fc7d394b4019101e9983597)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260701/202607012020.CeEmwJum-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607012020.CeEmwJum-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/time/timekeeping.c:1684:16: error: use of undeclared identifier 'HRTIMER_BASE_REALTIME'
    1684 |         clock_was_set(CLOCK_SET_WALL);
         |                       ^~~~~~~~~~~~~~
   kernel/time/tick-internal.h:180:7: note: expanded from macro 'CLOCK_SET_WALL'
     180 |         (BIT(HRTIMER_BASE_REALTIME) | BIT(HRTIMER_BASE_REALTIME_SOFT) | \
         |              ^~~~~~~~~~~~~~~~~~~~~
>> kernel/time/timekeeping.c:1684:16: error: use of undeclared identifier 'HRTIMER_BASE_REALTIME_SOFT'; did you mean 'HRTIMER_MODE_REL_SOFT'?
    1684 |         clock_was_set(CLOCK_SET_WALL);
         |                       ^~~~~~~~~~~~~~
   kernel/time/tick-internal.h:180:36: note: expanded from macro 'CLOCK_SET_WALL'
     180 |         (BIT(HRTIMER_BASE_REALTIME) | BIT(HRTIMER_BASE_REALTIME_SOFT) | \
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hrtimer.h:54:2: note: 'HRTIMER_MODE_REL_SOFT' declared here
      54 |         HRTIMER_MODE_REL_SOFT   = HRTIMER_MODE_REL | HRTIMER_MODE_SOFT,
         |         ^
>> kernel/time/timekeeping.c:1684:16: error: use of undeclared identifier 'HRTIMER_BASE_TAI'
    1684 |         clock_was_set(CLOCK_SET_WALL);
         |                       ^~~~~~~~~~~~~~
   kernel/time/tick-internal.h:181:7: note: expanded from macro 'CLOCK_SET_WALL'
     181 |          BIT(HRTIMER_BASE_TAI) | BIT(HRTIMER_BASE_TAI_SOFT))
         |              ^~~~~~~~~~~~~~~~
>> kernel/time/timekeeping.c:1684:16: error: use of undeclared identifier 'HRTIMER_BASE_TAI_SOFT'
    1684 |         clock_was_set(CLOCK_SET_WALL);
         |                       ^~~~~~~~~~~~~~
   kernel/time/tick-internal.h:181:31: note: expanded from macro 'CLOCK_SET_WALL'
     181 |          BIT(HRTIMER_BASE_TAI) | BIT(HRTIMER_BASE_TAI_SOFT))
         |                                      ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/timekeeping.c:1755:17: error: use of undeclared identifier 'HRTIMER_BASE_REALTIME'
    1755 |                 clock_was_set(CLOCK_SET_WALL);
         |                               ^~~~~~~~~~~~~~
   kernel/time/tick-internal.h:180:7: note: expanded from macro 'CLOCK_SET_WALL'
     180 |         (BIT(HRTIMER_BASE_REALTIME) | BIT(HRTIMER_BASE_REALTIME_SOFT) | \
         |              ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/timekeeping.c:1755:17: error: use of undeclared identifier 'HRTIMER_BASE_REALTIME_SOFT'; did you mean 'HRTIMER_MODE_REL_SOFT'?
    1755 |                 clock_was_set(CLOCK_SET_WALL);
         |                               ^~~~~~~~~~~~~~
   kernel/time/tick-internal.h:180:36: note: expanded from macro 'CLOCK_SET_WALL'
     180 |         (BIT(HRTIMER_BASE_REALTIME) | BIT(HRTIMER_BASE_REALTIME_SOFT) | \
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hrtimer.h:54:2: note: 'HRTIMER_MODE_REL_SOFT' declared here
      54 |         HRTIMER_MODE_REL_SOFT   = HRTIMER_MODE_REL | HRTIMER_MODE_SOFT,
         |         ^
   kernel/time/timekeeping.c:1755:17: error: use of undeclared identifier 'HRTIMER_BASE_TAI'
    1755 |                 clock_was_set(CLOCK_SET_WALL);
         |                               ^~~~~~~~~~~~~~
   kernel/time/tick-internal.h:181:7: note: expanded from macro 'CLOCK_SET_WALL'
     181 |          BIT(HRTIMER_BASE_TAI) | BIT(HRTIMER_BASE_TAI_SOFT))
         |              ^~~~~~~~~~~~~~~~
   kernel/time/timekeeping.c:1755:17: error: use of undeclared identifier 'HRTIMER_BASE_TAI_SOFT'
    1755 |                 clock_was_set(CLOCK_SET_WALL);
         |                               ^~~~~~~~~~~~~~
   kernel/time/tick-internal.h:181:31: note: expanded from macro 'CLOCK_SET_WALL'
     181 |          BIT(HRTIMER_BASE_TAI) | BIT(HRTIMER_BASE_TAI_SOFT))
         |                                      ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/timekeeping.c:3006:17: error: use of undeclared identifier 'HRTIMER_BASE_REALTIME'
    3006 |                 clock_was_set(CLOCK_SET_WALL);
         |                               ^~~~~~~~~~~~~~
   kernel/time/tick-internal.h:180:7: note: expanded from macro 'CLOCK_SET_WALL'
     180 |         (BIT(HRTIMER_BASE_REALTIME) | BIT(HRTIMER_BASE_REALTIME_SOFT) | \
         |              ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/timekeeping.c:3006:17: error: use of undeclared identifier 'HRTIMER_BASE_REALTIME_SOFT'; did you mean 'HRTIMER_MODE_REL_SOFT'?
    3006 |                 clock_was_set(CLOCK_SET_WALL);
         |                               ^~~~~~~~~~~~~~
   kernel/time/tick-internal.h:180:36: note: expanded from macro 'CLOCK_SET_WALL'
     180 |         (BIT(HRTIMER_BASE_REALTIME) | BIT(HRTIMER_BASE_REALTIME_SOFT) | \
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hrtimer.h:54:2: note: 'HRTIMER_MODE_REL_SOFT' declared here
      54 |         HRTIMER_MODE_REL_SOFT   = HRTIMER_MODE_REL | HRTIMER_MODE_SOFT,
         |         ^
   kernel/time/timekeeping.c:3006:17: error: use of undeclared identifier 'HRTIMER_BASE_TAI'
    3006 |                 clock_was_set(CLOCK_SET_WALL);
         |                               ^~~~~~~~~~~~~~
   kernel/time/tick-internal.h:181:7: note: expanded from macro 'CLOCK_SET_WALL'
     181 |          BIT(HRTIMER_BASE_TAI) | BIT(HRTIMER_BASE_TAI_SOFT))
         |              ^~~~~~~~~~~~~~~~
   kernel/time/timekeeping.c:3006:17: error: use of undeclared identifier 'HRTIMER_BASE_TAI_SOFT'
    3006 |                 clock_was_set(CLOCK_SET_WALL);
         |                               ^~~~~~~~~~~~~~
   kernel/time/tick-internal.h:181:31: note: expanded from macro 'CLOCK_SET_WALL'
     181 |          BIT(HRTIMER_BASE_TAI) | BIT(HRTIMER_BASE_TAI_SOFT))
         |                                      ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/timekeeping.c:2029:13: warning: variable 'suspend_timing_needed' set but not used [-Wunused-but-set-global]
    2029 | static bool suspend_timing_needed;
         |             ^
   1 warning and 12 errors generated.


vim +/HRTIMER_BASE_REALTIME +1684 kernel/time/timekeeping.c

02ecee07ca30f7 Lakshmi Sowjanya D 2024-05-13  1651  
8524070b7982d7 John Stultz        2007-05-08  1652  /**
21f7eca555ad14 pang.xunlei        2014-11-18  1653   * do_settimeofday64 - Sets the time of day.
21f7eca555ad14 pang.xunlei        2014-11-18  1654   * @ts:     pointer to the timespec64 variable containing the new time
8524070b7982d7 John Stultz        2007-05-08  1655   *
8524070b7982d7 John Stultz        2007-05-08  1656   * Sets the time of day to the new time and update NTP and notify hrtimers
8524070b7982d7 John Stultz        2007-05-08  1657   */
21f7eca555ad14 pang.xunlei        2014-11-18  1658  int do_settimeofday64(const struct timespec64 *ts)
8524070b7982d7 John Stultz        2007-05-08  1659  {
21f7eca555ad14 pang.xunlei        2014-11-18  1660  	struct timespec64 ts_delta, xt;
8524070b7982d7 John Stultz        2007-05-08  1661  
7a8e61f8478639 Thomas Gleixner    2019-03-23  1662  	if (!timespec64_valid_settod(ts))
8524070b7982d7 John Stultz        2007-05-08  1663  		return -EINVAL;
8524070b7982d7 John Stultz        2007-05-08  1664  
bba9898ef39966 Anna-Maria Behnsen 2024-10-09  1665  	scoped_guard (raw_spinlock_irqsave, &tk_core.lock) {
bba9898ef39966 Anna-Maria Behnsen 2024-10-09  1666  		struct timekeeper *tks = &tk_core.shadow_timekeeper;
8524070b7982d7 John Stultz        2007-05-08  1667  
bba9898ef39966 Anna-Maria Behnsen 2024-10-09  1668  		timekeeping_forward_now(tks);
8524070b7982d7 John Stultz        2007-05-08  1669  
bba9898ef39966 Anna-Maria Behnsen 2024-10-09  1670  		xt = tk_xtime(tks);
4e8c11b6b3f0b6 Yu Liao            2021-12-13  1671  		ts_delta = timespec64_sub(*ts, xt);
1e75fa8be9fb61 John Stultz        2012-07-13  1672  
bba9898ef39966 Anna-Maria Behnsen 2024-10-09  1673  		if (timespec64_compare(&tks->wall_to_monotonic, &ts_delta) > 0) {
bba9898ef39966 Anna-Maria Behnsen 2024-10-09  1674  			timekeeping_restore_shadow(&tk_core);
bba9898ef39966 Anna-Maria Behnsen 2024-10-09  1675  			return -EINVAL;
e1d7ba8735551e Wang YanQing       2015-06-23  1676  		}
e1d7ba8735551e Wang YanQing       2015-06-23  1677  
bba9898ef39966 Anna-Maria Behnsen 2024-10-09  1678  		tk_set_wall_to_mono(tks, timespec64_sub(tks->wall_to_monotonic, ts_delta));
bba9898ef39966 Anna-Maria Behnsen 2024-10-09  1679  		tk_set_xtime(tks, ts);
bba9898ef39966 Anna-Maria Behnsen 2024-10-09  1680  		timekeeping_update_from_shadow(&tk_core, TK_UPDATE_ALL);
bba9898ef39966 Anna-Maria Behnsen 2024-10-09  1681  	}
8524070b7982d7 John Stultz        2007-05-08  1682  
17a1b8826b451c Thomas Gleixner    2021-07-13  1683  	/* Signal hrtimers about time change */
17a1b8826b451c Thomas Gleixner    2021-07-13 @1684  	clock_was_set(CLOCK_SET_WALL);
8524070b7982d7 John Stultz        2007-05-08  1685  
2d87a0674bd60d Ondrej Mosnacek    2019-04-10  1686  	audit_tk_injoffset(ts_delta);
b8ac29b40183a6 Jason A. Donenfeld 2022-07-17  1687  	add_device_randomness(ts, sizeof(*ts));
bba9898ef39966 Anna-Maria Behnsen 2024-10-09  1688  	return 0;
8524070b7982d7 John Stultz        2007-05-08  1689  }
21f7eca555ad14 pang.xunlei        2014-11-18  1690  EXPORT_SYMBOL(do_settimeofday64);
8524070b7982d7 John Stultz        2007-05-08  1691  

:::::: The code at line 1684 was first introduced by commit
:::::: 17a1b8826b451c80e7999a7c68e06b70579b2b8f hrtimer: Add bases argument to clock_was_set()

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
