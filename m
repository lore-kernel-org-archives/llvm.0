Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554EB1AA797;
	Wed, 30 Sep 2026 04:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790743846; cv=none; b=KnvfqJ7lN78baHY9kR2q1ORWIM7CZ43kHZXuGjMbR9Zve9Etx/H8ZLsiiRL05HnPq0sZb0PzisA+oMRcJzgMDvOOH7RlWCcHdSuks4JuApu9UVm+IrH5AvDOW3Spe/ChllmFB83g8bO1B0U9v4cTxVBfWmqG6UEVROI/Plofm70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790743846; c=relaxed/simple;
	bh=s4SvWS+RrKkW9kXaivHHYotM9p7nyBnO2rAcFghSPOg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=heenzBbbqMaGsFtajyFW+pULwIixLSfF61Sm7P2TlxBLjOGTE8aj6emHB5aFg1W1D0/9NSZLupUrBkTtLW8mp/fbtxhOYupLC6abnXnvIHnJWptCji5X1Vc4bXUj/CQJ5sSEyZX/kExdIxfrftIoXjjUGKpXfcWVsznbAF2ToMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XletSvNa; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XletSvNa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790743844; x=1822279844;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=s4SvWS+RrKkW9kXaivHHYotM9p7nyBnO2rAcFghSPOg=;
  b=XletSvNaakvjFLL5kKF4iDkcEHR1HLcbb7rmYbw023EFgq2gOA4zya4m
   rDy2w10zW/L6su2uWax6UWOmWAGlHpm8roXTuFRvTekFN/5HzqBPHcwgY
   LSaRAURfphdnjzxMmyL2nqNNdTsnhPAQfntTl8xWXuKFt+r1mPXlLSpNi
   b2x0gowiD2tgjmAObEbaD97+8qZCwcQ7+cl4D8c/iVRqxBbw+MwHzi4bN
   /A/Um4Xi6lMVvOffMgxp+MAG9duC1fq/GMJZiDyQ/Rtnuv13hPIISgcWa
   n5o0zhCRLG5DB+XNIWH9cQSQeRMomEZE3dl48/u+IgPUF2rxWvj4RDe9A
   w==;
X-CSE-ConnectionGUID: bwGpsnoFQfSf4c2O7xefqw==
X-CSE-MsgGUID: pxWA3PnASqatSKZXzgaW2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90523784"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="90523784"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 21:50:44 -0700
X-CSE-ConnectionGUID: JFYVe0DLRIqHxawlK6Oc6w==
X-CSE-MsgGUID: +MB7WyA6QDOFexzExUZbOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="279376522"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 29 Sep 2026 21:50:43 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBmHA-00000000Q9E-1s58;
	Wed, 30 Sep 2026 04:50:40 +0000
Date: Wed, 30 Sep 2026 12:50:24 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:timekeeping 10/14] kernel/time/timekeeping.c:2957:49:
 warning: shift count >= width of type
Message-ID: <202609301233.YZC3mUrE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   git://git.infradead.org/users/dwmw2/linux timekeeping
head:   6000baa1ec08e9e0880ad0b51db6574882d09ae1
commit: ff4e31e721392e007b2b38a9815e3c01f497ce2d [10/14] timekeeping: Add a=
bsolute reference for feed-forward clock discipline
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260930/2=
02609301233.YZC3mUrE-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 600970=
8b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260930/202609301233.YZC3mUrE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609301233.YZC3mUrE-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

>> kernel/time/timekeeping.c:2957:49: warning: shift count >=3D width of ty=
pe [-Wshift-count-overflow]
    2957 |         offset_scaled =3D (sec_diff * (s64)(NSEC_PER_SEC << NTP_=
SCALE_SHIFT)) +
         |                                                        ^  ~~~~~~=
~~~~~~~~~
   1 warning generated.


vim +2957 kernel/time/timekeeping.c

  2872=09
  2873	int timekeeping_set_reference(const struct tk_reference *ref, bool s=
tep)
  2874	{
  2875		struct timekeeper *tks =3D &tk_core.shadow_timekeeper;
  2876		struct timespec64 ts_delta;
  2877		u64 new_tl, delta, ref_frac, ref_sec;
  2878		s64 offset_ns, offset_scaled, ref_ns, sec_diff;
  2879		u64 xt_shifted;
  2880		unsigned long flags;
  2881=09
  2882		raw_spin_lock_irqsave(&tk_core.lock, flags);
  2883=09
  2884		if (tks->cs_id !=3D ref->cs_id) {
  2885			raw_spin_unlock_irqrestore(&tk_core.lock, flags);
  2886			return -ENODEV;
  2887		}
  2888=09
  2889		/*
  2890		 * Process any pending ticks and set up a known state of the *curre=
nt*
  2891		 * tick, including zero skew_delta.
  2892		 */
  2893		ntp_set_time_offset(tks->id, 0);
  2894		__timekeeping_advance(&tk_core, TK_ADV_FREQ);
  2895=09
  2896		/*
  2897		 * Compute the NTP tick_length from the reference period.
  2898		 * tick_length is in ns << NTP_SCALE_SHIFT (i.e. ns << 32) per tick.
  2899		 * period_frac_sec is the counter period as a fraction of a second
  2900		 * (0.period_shift fixed point), so:
  2901		 *   tick_length =3D period_frac_sec * cycle_interval * NSEC_PER_SEC
  2902		 *                 >> (32 + period_shift)
  2903		 */
  2904		new_tl =3D mul_u64_u64_shr(ref->period_frac_sec,
  2905				(u64)tks->cycle_interval * NSEC_PER_SEC,
  2906				32 + ref->period_shift);
  2907		ntp_set_tick_length(tks->id, new_tl);
  2908=09
  2909		/*
  2910		 * Compute reference time at cycle_last (i.e. "now" after
  2911		 * __timekeeping_advance()). Use 128-bit arithmetic to handle
  2912		 * seconds overflow in ref_frac.
  2913		 */
  2914		delta =3D tks->tkr_mono.cycle_last - ref->counter_value;
  2915		ref_frac =3D mul_u64_u64_shr_add_u64(&ref_sec, delta,
  2916						    ref->period_frac_sec,
  2917						    ref->period_shift,
  2918						    ref->time_frac_sec);
  2919		ref_sec +=3D ref->time_sec;
  2920=09
  2921		/*
  2922		 * Compute the phase error between the reference time at the next
  2923		 * tick boundary and the kernel's xtime there.
  2924		 */
  2925		xt_shifted =3D tks->tkr_mono.xtime_nsec;
  2926		ref_ns =3D (s64)mul_u64_u64_shr(ref_frac, NSEC_PER_SEC, 64);
  2927		sec_diff =3D (s64)(ref_sec - tks->xtime_sec);
  2928=09
  2929		offset_ns =3D sec_diff * NSEC_PER_SEC + ref_ns -
  2930			    (s64)(xt_shifted >> tks->tkr_mono.shift);
  2931=09
  2932=09
  2933		if (step) {
  2934			struct timespec64 new_xt, xt;
  2935=09
  2936			xt =3D tk_xtime(tks);
  2937			ts_delta =3D ns_to_timespec64(offset_ns);
  2938			new_xt =3D timespec64_add(xt, ts_delta);
  2939			tk_set_wall_to_mono(tks,
  2940				timespec64_sub(tks->wall_to_monotonic, ts_delta));
  2941			tk_set_xtime(tks, &new_xt);
  2942=09
  2943			/* Recompute after step =E2=80=94 only sub-ns residual remains */
  2944			xt_shifted =3D tks->tkr_mono.xtime_nsec;
  2945			sec_diff =3D (s64)(ref_sec - tks->xtime_sec);
  2946		} else if (offset_ns > MAXPHASE || offset_ns < -MAXPHASE) {
  2947			timekeeping_restore_shadow(&tk_core);
  2948			raw_spin_unlock_irqrestore(&tk_core.lock, flags);
  2949			return -EINVAL;
  2950		}
  2951=09
  2952		/*
  2953		 * Set time_offset with full sub-ns precision. sec_diff can
  2954		 * only be -1, 0, or 1 at this point (bounded by MAXPHASE or
  2955		 * by the step having just aligned to the nearest nanosecond).
  2956		 */
> 2957		offset_scaled =3D (sec_diff * (s64)(NSEC_PER_SEC << NTP_SCALE_SHIFT=
)) +
  2958			(((s64)mul_u64_u64_shr(ref_frac,
  2959				(u64)NSEC_PER_SEC << tks->tkr_mono.shift, 64) -
  2960			  (s64)xt_shifted) << (NTP_SCALE_SHIFT - tks->tkr_mono.shift));
  2961		ntp_set_time_offset(tks->id, offset_scaled);
  2962		/*
  2963		 * Preload ntp_error with the negative of the in-progress tick's
  2964		 * accumulation delta. logarithmic_accumulation() will do:
  2965		 *   ntp_error +=3D ntp_tick - (xtime_interval << ntp_error_shift)
  2966		 * (skew_delta is zero, so there is no skew term). Setting ntp_erro=
r to
  2967		 * the negation means that after this tick accumulates, ntp_error l=
ands
  2968		 * at ~0 =E2=80=94 so no spurious =C2=B11 dithering is triggered. T=
he cached ntp_tick
  2969		 * and xtime_interval here are exactly the ones that tick will use =
(the
  2970		 * new tick_length only takes effect from the tick after).
  2971		 */
  2972		tks->ntp_error =3D ((s64)tks->xtime_interval << tks->ntp_error_shif=
t) -
  2973				 (s64)tks->ntp_tick;
  2974=09
  2975		timekeeping_update_from_shadow(&tk_core,
  2976			step ? TK_CLOCK_WAS_SET : 0);
  2977		raw_spin_unlock_irqrestore(&tk_core.lock, flags);
  2978=09
  2979		if (step) {
  2980			clock_was_set(CLOCK_SET_WALL);
  2981			audit_tk_injoffset(ts_delta);
  2982		}
  2983		return 0;
  2984	}
  2985	EXPORT_SYMBOL_GPL(timekeeping_set_reference);
  2986=09

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
