Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C5026ED3D;
	Sat, 16 May 2026 13:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778938905; cv=none; b=HOA7watbffY6j41zOlKx2DhMpzSSji9R33kEvPK22BCGRCGtcbqPQ2dnb4njN97Kfrf+Sw3cDoykp0sHIxK6tp6qQW3LvosAh21NhZxSzBbVF/mgrnxY8w9blcLeEok/b8MsDAYHLEiz4fhEp64oPrAgEiHTfX/9TrkZjqmsqEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778938905; c=relaxed/simple;
	bh=K+m/S1sXXiJOFtWNRZWcnNWb14AH4JIUYzEdEeoSsvE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YWKUA5KTvX9ReovUUGEGbTK+Gg84R0JfQTFBSFLuOdJuBp7fs7epoL/6Mkloq+Po0JeXg8Fzb90rmMrT07fl7GIvAfeskvmVKnKzJe85EyezP3zZKzE38mDkevNej0ESR/0lGHxMTDO1A/bAjS+AAokT62o+HcWpDo5Rq6M/Egw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HUDQrVGk; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HUDQrVGk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778938903; x=1810474903;
  h=date:from:to:cc:subject:message-id;
  bh=K+m/S1sXXiJOFtWNRZWcnNWb14AH4JIUYzEdEeoSsvE=;
  b=HUDQrVGkgv79nlj+a3AkJDSU8hQVVD83895vZP4ZRJ6GVTs2BwHGu1ZC
   BV5Wpjb1faEO/AWgnCxvrQVB3uxizvCMFh/EPF9kMSfufSuls7kHlwQiF
   TZzha9sbVrkU/fwjNXgOOIqocbBZ5BBHH0m/A8ryCvlFO4sM9p5NPzQ7W
   BQ8O04bDHFmp30EV8tHiUmm60zE4sGQlOynVKe1er88LSG0mVB42cNtDa
   5AKgras1u20ey/ig0grdxBDVqnlm9bcnKkWjmlhx7C9d6qt9NamaYgdVh
   woc84C8PIGfZv8b5zviD3a38kZ8wVDTx3tZd6DL+2GHBNQg283ONdsrSz
   Q==;
X-CSE-ConnectionGUID: DCI/JYV3Rc6NtIw8ZrZivA==
X-CSE-MsgGUID: 2WSIhz5JS9ib+8cYqPKN4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="79910656"
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="79910656"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 06:41:43 -0700
X-CSE-ConnectionGUID: UNYVfhzURfq+msvKriMxlQ==
X-CSE-MsgGUID: sGw40AGjQNaulpcIn2Se4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="236335564"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 May 2026 06:41:41 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOFGt-000000000r6-0x1q;
	Sat, 16 May 2026 13:41:39 +0000
Date: Sat, 16 May 2026 21:41:18 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:ffclock 37/39] kernel/time/timekeeping.c:2375:4:
 error: use of undeclared identifier 'p'
Message-ID: <202605162110.rwgthuxA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux ffclock
head:   4d04890e42f4f8a0651ffae982f1da9bc2fe2948
commit: 69d60b32e76db4c6af56882b7b3fffc843262427 [37/39] timekeeping: Add absolute reference for feed-forward clock discipline
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20260516/202605162110.rwgthuxA-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605162110.rwgthuxA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605162110.rwgthuxA-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   kernel/time/timekeeping.c:2371:4: error: use of undeclared identifier '__uint128_t'
    2371 |                         __uint128_t p = (__uint128_t)d * tk_ref.period_frac_sec;
         |                         ^~~~~~~~~~~
>> kernel/time/timekeeping.c:2375:4: error: use of undeclared identifier 'p'
    2375 |                         p >>= tk_ref.period_shift;
         |                         ^
   kernel/time/timekeeping.c:2376:4: error: use of undeclared identifier 'p'
    2376 |                         p += tk_ref.time_frac_sec;
         |                         ^
   kernel/time/timekeeping.c:2377:14: error: use of undeclared identifier 'p'
    2377 |                         rf = (u64)p;
         |                                   ^
   kernel/time/timekeeping.c:1947:13: warning: variable 'suspend_timing_needed' set but not used [-Wunused-but-set-global]
    1947 | static bool suspend_timing_needed;
         |             ^
>> kernel/time/timekeeping.c:2331:13: warning: variable 'tk_ref_valid' set but not used [-Wunused-but-set-global]
    2331 | static bool tk_ref_valid;
         |             ^
   2 warnings and 4 errors generated.


vim +/p +2375 kernel/time/timekeeping.c

  2329	
  2330	static struct tk_reference tk_ref;
> 2331	static bool tk_ref_valid;
  2332	static bool tk_ref_pending;
  2333	
  2334	int timekeeping_set_reference(const struct tk_reference *ref)
  2335	{
  2336		u64 ci = tk_core.timekeeper.cycle_interval;
  2337		u64 new_tl;
  2338	
  2339		tk_ref = *ref;
  2340	
  2341		new_tl = mul_u64_u64_shr(ref->period_frac_sec,
  2342				(u64)ci * NSEC_PER_SEC,
  2343				32 + ref->period_shift);
  2344		ntp_set_tick_length(TIMEKEEPER_CORE, new_tl);
  2345	
  2346		/* Ensure tk_ref fields are visible before tk_ref_valid/pending */
  2347		smp_wmb();
  2348		tk_ref_valid = true;
  2349		tk_ref_pending = true;
  2350		return 0;
  2351	}
  2352	EXPORT_SYMBOL_GPL(timekeeping_set_reference);
  2353	
  2354	static void timekeeping_adjust(struct timekeeper *tk, s64 offset)
  2355	{
  2356		u64 ntp_tl = ntp_tick_length(tk->id);
  2357		u32 mult;
  2358	
  2359		/*
  2360		 * Determine the multiplier from the current NTP tick length.
  2361		 * Avoid expensive division when the tick length doesn't change.
  2362		 */
  2363		if (likely(tk->ntp_tick == ntp_tl)) {
  2364			mult = tk->tkr_mono.mult - tk->ntp_err_mult;
  2365		} else {
  2366			tk->ntp_tick = ntp_tl;
  2367			mult = div64_u64(tk->ntp_tick >> tk->ntp_error_shift,
  2368					 tk->cycle_interval);
  2369			if (tk_ref_pending && tk->cs_id == tk_ref.cs_id) {
  2370				u64 d = tk->tkr_mono.cycle_last - tk_ref.counter_value;
  2371				__uint128_t p = (__uint128_t)d * tk_ref.period_frac_sec;
  2372				u64 rf;
  2373				s64 ref_err;
  2374	
> 2375				p >>= tk_ref.period_shift;
  2376				p += tk_ref.time_frac_sec;
  2377				rf = (u64)p;
  2378				ref_err = (s64)mul_u64_u64_shr(rf,
  2379					(u64)NSEC_PER_SEC << tk->tkr_mono.shift, 64) -
  2380					(s64)tk->tkr_mono.xtime_nsec;
  2381				ntp_set_time_offset(tk->id,
  2382					ref_err >> tk->tkr_mono.shift);
  2383				tk->ntp_error = 0;
  2384				tk_ref_pending = false;
  2385			}
  2386		}
  2387	
  2388		/*
  2389		 * If the clock is behind the NTP time, increase the multiplier by 1
  2390		 * to catch up with it. If it's ahead and there was a remainder in the
  2391		 * tick division, the clock will slow down. Otherwise it will stay
  2392		 * ahead until the tick length changes to a non-divisible value.
  2393		 */
  2394		tk->ntp_err_mult = tk->ntp_error > 0 ? 1 : 0;
  2395		mult += tk->ntp_err_mult;
  2396	
  2397		timekeeping_apply_adjustment(tk, offset, mult - tk->tkr_mono.mult);
  2398	
  2399		if (unlikely(tk->tkr_mono.clock->maxadj &&
  2400			(abs(tk->tkr_mono.mult - tk->tkr_mono.clock->mult)
  2401				> tk->tkr_mono.clock->maxadj))) {
  2402			printk_once(KERN_WARNING
  2403				"Adjusting %s more than 11%% (%ld vs %ld)\n",
  2404				tk->tkr_mono.clock->name, (long)tk->tkr_mono.mult,
  2405				(long)tk->tkr_mono.clock->mult + tk->tkr_mono.clock->maxadj);
  2406		}
  2407	
  2408		/*
  2409		 * It may be possible that when we entered this function, xtime_nsec
  2410		 * was very small.  Further, if we're slightly speeding the clocksource
  2411		 * in the code above, its possible the required corrective factor to
  2412		 * xtime_nsec could cause it to underflow.
  2413		 *
  2414		 * Now, since we have already accumulated the second and the NTP
  2415		 * subsystem has been notified via second_overflow(), we need to skip
  2416		 * the next update.
  2417		 */
  2418		if (unlikely((s64)tk->tkr_mono.xtime_nsec < 0)) {
  2419			tk->tkr_mono.xtime_nsec += (u64)NSEC_PER_SEC <<
  2420								tk->tkr_mono.shift;
  2421			tk->xtime_sec--;
  2422			tk->skip_second_overflow = 1;
  2423		}
  2424	}
  2425	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
