Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515FF3ADB8D;
	Fri, 29 May 2026 22:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780093863; cv=none; b=QrRwzrVIIbD2qYazsqtcF7/MsOk5WwomGr4hc+kfCRyFp/lRJ7Jmc8O4vYAtawcfYAbxKjB+GaMI/G6J08fhmqJgGC3lNn2UcjOKY/n/EMJkiOaQUsfViDfCl/tgxeLAzDkWgVnxMZbxNRPlotVU3AXIv+ph8WJLueIMqYFbNXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780093863; c=relaxed/simple;
	bh=Lx7Le+gc/NfhYmDuBG+v8oPpIVrtd7UcVWadeoFkbtk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Xtej9BsTgX/juVxeKEnPLGhnHZeOPbjvlPa0hiimLqha+LJZCKUnU+jg7bdxhSTqPFRmcVPpMJprn3ALynOkfF2gEZhTTZ7KpqJCceK01+kCSbO4CpVjpWwztIGgGfUGHj0CrVCtEVBIH+wP1cRBtFgWK6mreTFqQR6p53LOwqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UqoQX8kc; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UqoQX8kc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780093862; x=1811629862;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Lx7Le+gc/NfhYmDuBG+v8oPpIVrtd7UcVWadeoFkbtk=;
  b=UqoQX8kcCD8slcHbwv+yZ2BzdAbEur8iICSSGkkuke5G4np7fOYehmKJ
   KOEjYYIaQRTKHRsGRBWOky2NKjrG//9lgz120n2zmCV5X6GchgtOJzNNt
   kWatdIoxqNILAP3qq5tD5rSaY+kRssZqlLMcfUzOmyOCgG0O8al+dWJh0
   ++Tlx9UZJaDidM1Z2BiCDmqhKwCKiz6awu+f9uVwjWBXDlXfb0jttyH7f
   ZirEtBA/QQ0OpqsWIiQx/4A8i5d0WrGwnjXd56YW1tFL5kchC5qFr7ADh
   oSrTsi6KnLyD9Xa836yMlSgsb4eQy1NFTKmfDmd30UtmDHwfr5QoKaz2f
   w==;
X-CSE-ConnectionGUID: sjldBeLhQVmeqUYRud+q8A==
X-CSE-MsgGUID: JeYul3daSya0aHKXAh+Njg==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="91635369"
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="91635369"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 15:31:00 -0700
X-CSE-ConnectionGUID: LUwkx6TjSLujbsgMDQg5LQ==
X-CSE-MsgGUID: V4jw9mZASmSD72apMPlUTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="246978148"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 29 May 2026 15:30:54 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wT5j9-000000007k6-1TXG;
	Fri, 29 May 2026 22:30:51 +0000
Date: Sat, 30 May 2026 06:30:02 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:ffclock 8/10] kernel/time/timekeeping.c:2526:49:
 warning: shift count >= width of type
Message-ID: <202605300611.vR6jAFZe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   git://git.infradead.org/users/dwmw2/linux ffclock
head:   70c32e7a9e128f2579034276c19d34bcf79f4b0c
commit: 6fc43ccf0a8bed65163bc381478a4c6ad65f4479 [8/10] timekeeping: Add ab=
solute reference for feed-forward clock discipline
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20260530/20=
2605300611.vR6jAFZe-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 940=
9c07de6378507397ecdb6f05f628f58110112)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260530/202605300611.vR6jAFZe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605300611.vR6jAFZe-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

>> kernel/time/timekeeping.c:2526:49: warning: shift count >=3D width of ty=
pe [-Wshift-count-overflow]
    2526 |         offset_scaled =3D (sec_diff * (s64)(NSEC_PER_SEC << NTP_=
SCALE_SHIFT)) +
         |                                                        ^  ~~~~~~=
~~~~~~~~~
   kernel/time/timekeeping.c:2010:13: warning: variable 'suspend_timing_nee=
ded' set but not used [-Wunused-but-set-global]
    2010 | static bool suspend_timing_needed;
         |             ^
   2 warnings generated.


vim +2526 kernel/time/timekeeping.c

  2445=09
  2446=09
  2447	int timekeeping_set_reference(const struct tk_reference *ref, bool s=
tep)
  2448	{
  2449		struct timekeeper *tks =3D &tk_core.shadow_timekeeper;
  2450		struct timespec64 ts_delta;
  2451		u64 new_tl, delta, ref_frac, ref_sec;
  2452		s64 offset_ns, offset_scaled, ref_ns, sec_diff;
  2453		u64 xt_shifted;
  2454		unsigned long flags;
  2455=09
  2456		raw_spin_lock_irqsave(&tk_core.lock, flags);
  2457=09
  2458		if (tks->cs_id !=3D ref->cs_id) {
  2459			raw_spin_unlock_irqrestore(&tk_core.lock, flags);
  2460			return -ENODEV;
  2461		}
  2462=09
  2463		timekeeping_forward_now(tks);
  2464=09
  2465		/*
  2466		 * Compute the NTP tick_length from the reference period.
  2467		 * tick_length is in ns << NTP_SCALE_SHIFT (i.e. ns << 32) per tick.
  2468		 * period_frac_sec is the counter period as a fraction of a second
  2469		 * (0.period_shift fixed point), so:
  2470		 *   tick_length =3D period_frac_sec * cycle_interval * NSEC_PER_SEC
  2471		 *                 >> (32 + period_shift)
  2472		 */
  2473		new_tl =3D mul_u64_u64_shr(ref->period_frac_sec,
  2474				(u64)tks->cycle_interval * NSEC_PER_SEC,
  2475				32 + ref->period_shift);
  2476		ntp_set_tick_length(tks->id, new_tl);
  2477=09
  2478		/*
  2479		 * Compute reference time at cycle_last (i.e. "now" after
  2480		 * timekeeping_forward_now). Use 128-bit arithmetic to handle
  2481		 * seconds overflow in ref_frac.
  2482		 */
  2483		delta =3D tks->tkr_mono.cycle_last - ref->counter_value;
  2484		ref_frac =3D mul_u64_u64_shr_add_u64(&ref_sec, delta,
  2485						    ref->period_frac_sec,
  2486						    ref->period_shift,
  2487						    ref->time_frac_sec);
  2488		ref_sec +=3D ref->time_sec;
  2489=09
  2490		/*
  2491		 * Compute the phase error between the reference time at the next
  2492		 * tick boundary and the kernel's xtime there.
  2493		 */
  2494		xt_shifted =3D tks->tkr_mono.xtime_nsec;
  2495		ref_ns =3D (s64)mul_u64_u64_shr(ref_frac, NSEC_PER_SEC, 64);
  2496		sec_diff =3D (s64)(ref_sec - tks->xtime_sec);
  2497=09
  2498		offset_ns =3D sec_diff * NSEC_PER_SEC + ref_ns -
  2499			    (s64)(xt_shifted >> tks->tkr_mono.shift);
  2500=09
  2501=09
  2502		if (step) {
  2503			struct timespec64 new_xt, xt;
  2504=09
  2505			xt =3D tk_xtime(tks);
  2506			ts_delta =3D ns_to_timespec64(offset_ns);
  2507			new_xt =3D timespec64_add(xt, ts_delta);
  2508			tk_set_wall_to_mono(tks,
  2509				timespec64_sub(tks->wall_to_monotonic, ts_delta));
  2510			tk_set_xtime(tks, &new_xt);
  2511=09
  2512			/* Recompute after step =E2=80=94 only sub-ns residual remains */
  2513			xt_shifted =3D tks->tkr_mono.xtime_nsec;
  2514			sec_diff =3D (s64)(ref_sec - tks->xtime_sec);
  2515		} else if (offset_ns > MAXPHASE || offset_ns < -MAXPHASE) {
  2516			timekeeping_restore_shadow(&tk_core);
  2517			raw_spin_unlock_irqrestore(&tk_core.lock, flags);
  2518			return -EINVAL;
  2519		}
  2520=09
  2521		/*
  2522		 * Set time_offset with full sub-ns precision. sec_diff can
  2523		 * only be -1, 0, or 1 at this point (bounded by MAXPHASE or
  2524		 * by the step having just aligned to the nearest nanosecond).
  2525		 */
> 2526		offset_scaled =3D (sec_diff * (s64)(NSEC_PER_SEC << NTP_SCALE_SHIFT=
)) +
  2527			(((s64)mul_u64_u64_shr(ref_frac,
  2528				(u64)NSEC_PER_SEC << tks->tkr_mono.shift, 64) -
  2529			  (s64)xt_shifted) << (NTP_SCALE_SHIFT - tks->tkr_mono.shift));
  2530		ntp_set_time_offset(tks->id, offset_scaled);
  2531		tks->ntp_error =3D 0;
  2532=09
  2533		timekeeping_update_from_shadow(&tk_core,
  2534			step ? TK_CLOCK_WAS_SET : 0);
  2535		raw_spin_unlock_irqrestore(&tk_core.lock, flags);
  2536=09
  2537		if (step) {
  2538			clock_was_set(CLOCK_SET_WALL);
  2539			audit_tk_injoffset(ts_delta);
  2540		}
  2541		return 0;
  2542	}
  2543	EXPORT_SYMBOL_GPL(timekeeping_set_reference);
  2544=09

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
