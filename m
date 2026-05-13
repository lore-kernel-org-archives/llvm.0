Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1B846AF3C;
	Wed, 13 May 2026 14:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778684399; cv=none; b=ggDxGTW+N8FEOTgyYtGxSFUH7FYUOFH+Z44DZApVIKMUjM5cQLgmKhyntMkIPfhd/gA2s4hlka3aOAzAljr71aMJaDM25g9VryHS4e0oh5Ny11HXCqDcMdi/Xhq+PsWQcQPpf/cm61dOmEtIVubAovyGAJtVXcwGQr8yPTH/FU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778684399; c=relaxed/simple;
	bh=ie1zKjFpKyGEGO7837DLJunuOw2IcEkCwOzNQFLVxVo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=i5JjjQoerLCGzNFzBe0MwrfL7kX5doko9Z7Ol5mT7l6tBnCFsaEaV1HT9U/g9wRyP5ajAet8QG46+Ga++zVEeS+PrlDbWXTWMEOZM4/G/h+0RRzJntT66PoZg7GDLbcEvrgo+nOlMpp9wqv/IwnykSlqKwxq/IezKDCCnM5EFts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QYAqiaOB; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QYAqiaOB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778684396; x=1810220396;
  h=date:from:to:cc:subject:message-id;
  bh=ie1zKjFpKyGEGO7837DLJunuOw2IcEkCwOzNQFLVxVo=;
  b=QYAqiaOBp3G7BzdjX8dSZF1wGHYpuE0herkztJLi1BVWus8RTvHmwAde
   YBVZt3RESXgV2GsnOpTsl+Fr8L6twE1te88NPvzWgN7SPvIKAIxk944WX
   HTF2eHFgGkpikDVFCh7S3KU/YCsm6QjvWxzF9Yb+bAyvGv3Sl23ozyurW
   xexc1ek4U4SAmhwkzbSwksVAcgojdzMTEe2PNBgbrkfAMD6eLYZXBZQlF
   RuKgB0ECJV/UJ3U0xAqBMrXnYfssuUCVu+47/Xlr9JoD+FqHFNzCZ0NGG
   CuXh9tAuBtm0uQJNuzt79khWGZUuuQiFZmhJqdbkgQVTZhpHStr6MM2Cv
   w==;
X-CSE-ConnectionGUID: wtNftdppRhSlidhc/bS5ag==
X-CSE-MsgGUID: e1edTGZLQ8SqRks3fHuWDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="83486662"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="83486662"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 07:59:37 -0700
X-CSE-ConnectionGUID: pueLIVwMTWq1toAtsopu1Q==
X-CSE-MsgGUID: iKlgjsLxSWSPdc8PRNydUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="235042119"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 May 2026 07:59:35 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNB3c-000000004Hr-1iJQ;
	Wed, 13 May 2026 14:59:32 +0000
Date: Wed, 13 May 2026 22:58:32 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:vmtk 36/37] kernel/time/timekeeping.c:2351:2: error:
 use of undeclared identifier '__uint128_t'
Message-ID: <202605132233.nvcOSVzq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux vmtk
head:   f3b2e27904ff7b3ad3551c83fcd234281b5b8142
commit: 4b13ac5bbca55428330930343b92cdecd6a601f4 [36/37] timekeeping: Add absolute reference for feed-forward clock discipline
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20260513/202605132233.nvcOSVzq-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605132233.nvcOSVzq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605132233.nvcOSVzq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/time/timekeeping.c:2351:2: error: use of undeclared identifier '__uint128_t'
    2351 |         __uint128_t product;
         |         ^~~~~~~~~~~
>> kernel/time/timekeeping.c:2356:2: error: use of undeclared identifier 'product'
    2356 |         product = (__uint128_t)delta * tk_ref.period_frac_sec;
         |         ^~~~~~~
   kernel/time/timekeeping.c:2356:13: error: use of undeclared identifier '__uint128_t'
    2356 |         product = (__uint128_t)delta * tk_ref.period_frac_sec;
         |                    ^~~~~~~~~~~
   kernel/time/timekeeping.c:2357:2: error: use of undeclared identifier 'product'
    2357 |         product >>= tk_ref.period_shift;
         |         ^~~~~~~
   kernel/time/timekeeping.c:2358:2: error: use of undeclared identifier 'product'
    2358 |         product += tk_ref.time_frac_sec;
         |         ^~~~~~~
   kernel/time/timekeeping.c:2359:36: error: use of undeclared identifier 'product'
    2359 |         ref_sec = tk_ref.time_sec + (u64)(product >> 64);
         |                                           ^~~~~~~
   kernel/time/timekeeping.c:2360:18: error: use of undeclared identifier 'product'
    2360 |         ref_frac = (u64)product;
         |                         ^~~~~~~
   kernel/time/timekeeping.c:1955:13: warning: variable 'suspend_timing_needed' set but not used [-Wunused-but-set-global]
    1955 | static bool suspend_timing_needed;
         |             ^
   1 warning and 7 errors generated.


vim +/__uint128_t +2351 kernel/time/timekeeping.c

  2347	
  2348	bool timekeeping_ref_ahead(struct timekeeper *tk)
  2349	{
  2350		u64 delta, ref_frac, ref_sec, ref_shifted_ns;
> 2351		__uint128_t product;
  2352	
  2353		if (tk->cs_id != tk_ref.cs_id)
  2354			return false;
  2355		delta = tk->tkr_mono.cycle_last - tk_ref.counter_value;
> 2356		product = (__uint128_t)delta * tk_ref.period_frac_sec;
  2357		product >>= tk_ref.period_shift;
  2358		product += tk_ref.time_frac_sec;
  2359		ref_sec = tk_ref.time_sec + (u64)(product >> 64);
  2360		ref_frac = (u64)product;
  2361		ref_shifted_ns = mul_u64_u64_shr(ref_frac,
  2362					(u64)NSEC_PER_SEC << tk->tkr_mono.shift, 64);
  2363		if (tk->xtime_sec > ref_sec)
  2364			return true;
  2365		if (tk->xtime_sec == ref_sec &&
  2366		    tk->tkr_mono.xtime_nsec > ref_shifted_ns)
  2367			return true;
  2368		return false;
  2369	}
  2370	/*
  2371	 * Adjust the timekeeper's multiplier to the correct frequency
  2372	 * and also to reduce the accumulated error value.
  2373	
  2374	 */
  2375	static void timekeeping_adjust(struct timekeeper *tk, s64 offset)
  2376	{
  2377		u64 ntp_tl = ntp_tick_length(tk->id);
  2378		u32 mult;
  2379	
  2380		/*
  2381		 * Determine the multiplier from the current NTP tick length.
  2382		 * Avoid expensive division when the tick length doesn't change.
  2383		 */
  2384		if (likely(tk->ntp_tick == ntp_tl)) {
  2385			mult = tk->tkr_mono.mult - tk->ntp_err_mult;
  2386		} else {
  2387			tk->ntp_tick = ntp_tl;
  2388			mult = div64_u64((tk->ntp_tick >> tk->ntp_error_shift) -
  2389					 tk->xtime_remainder, tk->cycle_interval);
  2390		}
  2391	
  2392		vmclock_host_update(tk);
  2393	
  2394		/*
  2395		 * If the clock is behind the NTP time, increase the multiplier by 1
  2396		 * to catch up with it. If it's ahead and there was a remainder in the
  2397		 * tick division, the clock will slow down. Otherwise it will stay
  2398		 * ahead until the tick length changes to a non-divisible value.
  2399		 */
  2400		if (timekeeping_has_reference())
  2401			tk->ntp_err_mult = timekeeping_ref_ahead(tk) ? 0 : 1;
  2402		else
  2403			tk->ntp_err_mult = tk->ntp_error > 0 ? 1 : 0;
  2404		mult += tk->ntp_err_mult;
  2405	
  2406		timekeeping_apply_adjustment(tk, offset, mult - tk->tkr_mono.mult);
  2407	
  2408		if (unlikely(tk->tkr_mono.clock->maxadj &&
  2409			(abs(tk->tkr_mono.mult - tk->tkr_mono.clock->mult)
  2410				> tk->tkr_mono.clock->maxadj))) {
  2411			printk_once(KERN_WARNING
  2412				"Adjusting %s more than 11%% (%ld vs %ld)\n",
  2413				tk->tkr_mono.clock->name, (long)tk->tkr_mono.mult,
  2414				(long)tk->tkr_mono.clock->mult + tk->tkr_mono.clock->maxadj);
  2415		}
  2416	
  2417		/*
  2418		 * It may be possible that when we entered this function, xtime_nsec
  2419		 * was very small.  Further, if we're slightly speeding the clocksource
  2420		 * in the code above, its possible the required corrective factor to
  2421		 * xtime_nsec could cause it to underflow.
  2422		 *
  2423		 * Now, since we have already accumulated the second and the NTP
  2424		 * subsystem has been notified via second_overflow(), we need to skip
  2425		 * the next update.
  2426		 */
  2427		if (unlikely((s64)tk->tkr_mono.xtime_nsec < 0)) {
  2428			tk->tkr_mono.xtime_nsec += (u64)NSEC_PER_SEC <<
  2429								tk->tkr_mono.shift;
  2430			tk->xtime_sec--;
  2431			tk->skip_second_overflow = 1;
  2432		}
  2433	}
  2434	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
