Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF4B37DAAD;
	Wed,  1 Jul 2026 17:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782928337; cv=none; b=bczvoNrwf7bPMYsk2jpA1/ectu2/HybapkFgblZ0iT0im3TUcona2UUo+CAok5SDzrzU4m5zJFgPtiKdCyzHrQZ1u4tgVfgnGUe2WycsUWl145VX6/S6kfAvdMdMgTmWEtMBFeuOpjd4tZ4qGMG8OJmIzy0/rByJYbc+o+F2cTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782928337; c=relaxed/simple;
	bh=/bMDZevl1FiSLonZ16+G2rc1tVUFEsqGvn8fl37bFa0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gQ0Y7P6TCcSQr295PHQAFBTu6s7rrY/xW94Y58fQCA+cVD5mpaAdVKGkYD8uH0rSvEdz7+19c14PD7gJmW7rbBsWY3cozGG+nBt4smyqEOZEgsOKVoPJ+WKCzukVy7EQGA/9/UYNBU3Li8bOciTWkg/1aXLF7tPlhw6Q6riIzKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T19d+xVv; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T19d+xVv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782928336; x=1814464336;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/bMDZevl1FiSLonZ16+G2rc1tVUFEsqGvn8fl37bFa0=;
  b=T19d+xVvDtIm/51bjdpYD8/PGAk323EZNqcHV3XQS76zNks8eMgOwD3n
   9csWM/2L/oRbFM0xv/FFEdVWDrlrN27n9a/LwBHMs9M385rcHeoRlN/kW
   7uxceqlySjdzJk6KWZ4jDfnzKg9rCegi5WYGCIaRDaUFK/HU6El/HJ+Qq
   cwLTjTDaTT9VIWaGWIXRi0Uh/NbmtLpXM1Ovis7VLbX0xKN4kY3uLTd4s
   0mx3WTXF+MOwp9hj0aKv3lPlmnttlqNVkbqgd55UVaL0Dhs7IqOJjFy47
   eqSB0F7O+Vj6+/2OL8hxjP6/OmoU5xIq37hCV+EdP6hpa3iccml8hDkZO
   g==;
X-CSE-ConnectionGUID: rUiV895JRTKJM8Kq+7hErQ==
X-CSE-MsgGUID: LHcM08eZTBGn3PrPfTjDzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="109218113"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="109218113"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 10:52:15 -0700
X-CSE-ConnectionGUID: GKi4ubfLQVWV0cmNZJNPFA==
X-CSE-MsgGUID: r0ewbxsNRZiZAfjZKsjK/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="250913025"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 01 Jul 2026 10:52:14 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wez6Z-000000000qf-3Otq;
	Wed, 01 Jul 2026 17:52:11 +0000
Date: Wed, 01 Jul 2026 19:51:16 +0200
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh?= (Schneider Electric)" <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 21/60]
 kernel/time/hrtimer.c:2092:55: warning: variable 'timer' is uninitialized
 when used here
Message-ID: <202607011937.nn21lRKI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/auxclock-nanosleep
head:   80d7be4639ebb1f847fd06f3b8ad6b60389a6399
commit: ab89377d780b43204be2991594e25d64d4de0c88 [21/60] validation
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260701/202607011937.nn21lRKI-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260701/202607011937.nn21lRKI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607011937.nn21lRKI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/time/hrtimer.c:2092:55: warning: variable 'timer' is uninitialized when used here [-Wuninitialized]
    2092 |                 if (trace_hrtimer_run_queues_deviation_enabled() && timer) {
         |                                                                     ^~~~~
   kernel/time/hrtimer.c:2090:24: note: initialize the variable 'timer' to silence this warning
    2090 |                 struct hrtimer *timer;
         |                                      ^
         |                                       = NULL
   1 warning generated.


vim +/timer +2092 kernel/time/hrtimer.c

  2081	
  2082	static void __hrtimer_run_queues(struct hrtimer_cpu_base *cpu_base, ktime_t now,
  2083					 unsigned long flags, unsigned int active_mask)
  2084	{
  2085		unsigned int active = cpu_base->active_bases & active_mask;
  2086		struct hrtimer_clock_base *base;
  2087	
  2088		for_each_active_base(base, cpu_base, active) {
  2089			ktime_t basenow = ktime_add(now, base->offset);
  2090			struct hrtimer *timer;
  2091	
> 2092			if (trace_hrtimer_run_queues_deviation_enabled() && timer) {
  2093				timer = clock_base_next_timer(base);
  2094	
  2095				if (timer) {
  2096					ktime_t real_basenow = hrtimer_cb_get_time(timer);
  2097	
  2098					/* Should never be negative */
  2099					trace_hrtimer_run_queues_deviation(cpu_base, base->clockid,
  2100									   ktime_sub(real_basenow, basenow));
  2101				}
  2102			}
  2103	
  2104			while ((timer = clock_base_next_timer(base))) {
  2105				/*
  2106				 * The immediate goal for using the softexpires is
  2107				 * minimizing wakeups, not running timers at the
  2108				 * earliest interrupt after their soft expiration.
  2109				 * This allows us to avoid using a Priority Search
  2110				 * Tree, which can answer a stabbing query for
  2111				 * overlapping intervals and instead use the simple
  2112				 * BST we already have.
  2113				 * We don't add extra wakeups by delaying timers that
  2114				 * are right-of a not yet expired timer, because that
  2115				 * timer will have to trigger a wakeup anyway.
  2116				 */
  2117				if (basenow < hrtimer_get_softexpires(timer))
  2118					break;
  2119	
  2120				__run_hrtimer(cpu_base, base, timer, basenow, flags);
  2121				if (active_mask == HRTIMER_ACTIVE_SOFT)
  2122					hrtimer_sync_wait_running(cpu_base, flags);
  2123			}
  2124		}
  2125	}
  2126	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
