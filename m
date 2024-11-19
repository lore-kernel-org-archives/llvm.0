Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20745139B;
	Tue, 19 Nov 2024 00:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731975229; cv=none; b=fhuhiC5QyUZw8BOlQTVI0cjTHJxJ78cK/mARzaMk8dlgHw1AfofTwWMKYUenZUc4lAXSq/Ha2mzNGXiFMlbHNF3eGEjymKhfLmE01XASne3xcuQ7tzH+5L5IswuEyUnhLg6EkcmYeBfhxcRgkzCq3arNJb0oH/v0yuJOsqAbZwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731975229; c=relaxed/simple;
	bh=Va1bM13KboSGMCVdJtdvhpwW6k4fhqlWKZkztq9IfvU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EVnSLFXsy8Ft3EQUguuuTYn89hPWSgonB9HlJBGjgYlqW9BZERm4QEjHXfFrkMYwwFd/1b2pj6udGv55NbWZCGLcqJAWU7O1YTJgzJ1Ixvbvd/VVA6GkUz8z1HyEiCuLFXojLjkuJqQqDl/BbNOtHoQeepxBwSWovxh1lcjR4YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OYCrdHJM; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OYCrdHJM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731975227; x=1763511227;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Va1bM13KboSGMCVdJtdvhpwW6k4fhqlWKZkztq9IfvU=;
  b=OYCrdHJMsmHkMwtjXMfnlpV//vQQhCfYlCq78Xw/wpqYB8c80lYvsSy9
   RkAbqlOeqYYZZeTcSE6x0jyG+uCuPAshPBpyBNA9oAwpA21q5VbhEuq+A
   vYZW5umkqmju5JF8LS2rQmp5urNyKy34N+8ulgR6m4lbOgGN1sHwMy6li
   AaVr0Jno1MgDR6IACmaKDPznaj7CPXwoKxkugbHGkdtsC9515TPhs7nJa
   BqK6Z7+rX0GuvCgm61/d3l18GjtELcoDdEj9d+s3bvsLfKV32GWAvO5m+
   /oITXVZStyE+KW782kJQ/MkefWqorP2Pfmkn7SAlwHuo9qRgvQ0k8brzd
   Q==;
X-CSE-ConnectionGUID: iv4HyXO7RyuWTxzt+BZmRA==
X-CSE-MsgGUID: ID/oxDm7RJy5cWnC0QJ8qA==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="49492232"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="49492232"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 16:13:44 -0800
X-CSE-ConnectionGUID: BgSijMUBTxyU9CH7n/Gquw==
X-CSE-MsgGUID: bmRdYYpJReqCQk2Ipxa2eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="89787290"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Nov 2024 16:13:43 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDBsC-0002hj-2B;
	Tue, 19 Nov 2024 00:13:40 +0000
Date: Tue, 19 Nov 2024 08:12:56 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:timers/ptp/tkntp 146/147]
 kernel/time/timekeeping.c:2590: warning: Function parameter or struct member
 'tkd' not described in '__do_adjtimex'
Message-ID: <202411190859.EBB3GhI9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/ptp/tkntp
head:   a4bce60c005c044a73440e5bdade846cce1c3d02
commit: 5181b278b790743ada0bee91fd6abe45f991c481 [146/147] timekeeping: Make do_adjimex() reusable
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241119/202411190859.EBB3GhI9-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241119/202411190859.EBB3GhI9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411190859.EBB3GhI9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/time/timekeeping.c:1462: warning: Function parameter or struct member 'tkd' not described in '__timekeeping_inject_offset'
>> kernel/time/timekeeping.c:2590: warning: Function parameter or struct member 'tkd' not described in '__do_adjtimex'
>> kernel/time/timekeeping.c:2590: warning: Function parameter or struct member 'result' not described in '__do_adjtimex'
>> kernel/time/timekeeping.c:2590: warning: expecting prototype for do_adjtimex(). Prototype was for __do_adjtimex() instead


vim +2590 kernel/time/timekeeping.c

5181b278b79074 Thomas Gleixner    2024-08-04  2583  
aa6f9c595d8573 John Stultz        2013-03-22  2584  /**
aa6f9c595d8573 John Stultz        2013-03-22  2585   * do_adjtimex() - Accessor function to NTP __do_adjtimex function
e1b6a78b58aa85 Yang Li            2024-06-07  2586   * @txc:	Pointer to kernel_timex structure containing NTP parameters
aa6f9c595d8573 John Stultz        2013-03-22  2587   */
5181b278b79074 Thomas Gleixner    2024-08-04  2588  static int __do_adjtimex(struct tk_data *tkd, struct __kernel_timex *txc,
5181b278b79074 Thomas Gleixner    2024-08-04  2589  			 struct adjtimex_result *result)
aa6f9c595d8573 John Stultz        2013-03-22 @2590  {
5181b278b79074 Thomas Gleixner    2024-08-04  2591  	struct timespec64 ts;
e4085693f629de John Stultz        2013-03-22  2592  	int ret;
e4085693f629de John Stultz        2013-03-22  2593  
e4085693f629de John Stultz        2013-03-22  2594  	/* Validate the data before disabling interrupts */
1572fa03784831 Arnd Bergmann      2017-10-19  2595  	ret = timekeeping_validate_timex(txc);
e4085693f629de John Stultz        2013-03-22  2596  	if (ret)
e4085693f629de John Stultz        2013-03-22  2597  		return ret;
b8ac29b40183a6 Jason A. Donenfeld 2022-07-17  2598  	add_device_randomness(txc, sizeof(*txc));
e4085693f629de John Stultz        2013-03-22  2599  
36c2195dacb38a Thomas Gleixner    2024-11-09  2600  	ktime_get_real_ts64(&ts);
36c2195dacb38a Thomas Gleixner    2024-11-09  2601  	add_device_randomness(&ts, sizeof(ts));
36c2195dacb38a Thomas Gleixner    2024-11-09  2602  
45ea865d514623 Thomas Gleixner    2024-08-04  2603  	scoped_guard (raw_spinlock_irqsave, &tkd->lock) {
45ea865d514623 Thomas Gleixner    2024-08-04  2604  		struct timekeeper *tks = &tkd->shadow_timekeeper;
36c2195dacb38a Thomas Gleixner    2024-11-09  2605  		s32 orig_tai, tai;
36c2195dacb38a Thomas Gleixner    2024-11-09  2606  
45ea865d514623 Thomas Gleixner    2024-08-04  2607  		if (!tks->clock_valid)
45ea865d514623 Thomas Gleixner    2024-08-04  2608  			return -ENODEV;
45ea865d514623 Thomas Gleixner    2024-08-04  2609  
36c2195dacb38a Thomas Gleixner    2024-11-09  2610  		if (txc->modes & ADJ_SETOFFSET) {
5181b278b79074 Thomas Gleixner    2024-08-04  2611  			result->delta.tv_sec  = txc->time.tv_sec;
5181b278b79074 Thomas Gleixner    2024-08-04  2612  			result->delta.tv_nsec = txc->time.tv_usec;
cef90377fab488 John Stultz        2013-03-22  2613  			if (!(txc->modes & ADJ_NANO))
5181b278b79074 Thomas Gleixner    2024-08-04  2614  				result->delta.tv_nsec *= 1000;
5181b278b79074 Thomas Gleixner    2024-08-04  2615  			ret = __timekeeping_inject_offset(tkd, &result->delta);
cef90377fab488 John Stultz        2013-03-22  2616  			if (ret)
cef90377fab488 John Stultz        2013-03-22  2617  				return ret;
5181b278b79074 Thomas Gleixner    2024-08-04  2618  			result->clock_set = true;
cef90377fab488 John Stultz        2013-03-22  2619  		}
cef90377fab488 John Stultz        2013-03-22  2620  
ae455cb7b8ad2c Anna-Maria Behnsen 2024-10-09  2621  		orig_tai = tai = tks->tai_offset;
5181b278b79074 Thomas Gleixner    2024-08-04  2622  		ret = ntp_adjtimex(tks->id, txc, &ts, &tai, &result->ad);
aa6f9c595d8573 John Stultz        2013-03-22  2623  
4e8f8b34b92b65 John Stultz        2013-04-10  2624  		if (tai != orig_tai) {
ae455cb7b8ad2c Anna-Maria Behnsen 2024-10-09  2625  			__timekeeping_set_tai_offset(tks, tai);
45ea865d514623 Thomas Gleixner    2024-08-04  2626  			timekeeping_update_from_shadow(tkd, TK_CLOCK_WAS_SET);
5181b278b79074 Thomas Gleixner    2024-08-04  2627  			result->clock_set = true;
9fe7d9a984f230 Anna-Maria Behnsen 2024-10-09  2628  		} else {
ae455cb7b8ad2c Anna-Maria Behnsen 2024-10-09  2629  			tk_update_leap_state_all(&tk_core);
ae455cb7b8ad2c Anna-Maria Behnsen 2024-10-09  2630  		}
7e8eda734d30de Ondrej Mosnacek    2019-04-10  2631  
b061c7a513afe1 Miroslav Lichvar   2018-06-04  2632  		/* Update the multiplier immediately if frequency was set directly */
b061c7a513afe1 Miroslav Lichvar   2018-06-04  2633  		if (txc->modes & (ADJ_FREQUENCY | ADJ_TICK))
5181b278b79074 Thomas Gleixner    2024-08-04  2634  			result->clock_set |= __timekeeping_advance(tkd, TK_ADV_FREQ);
36c2195dacb38a Thomas Gleixner    2024-11-09  2635  	}
36c2195dacb38a Thomas Gleixner    2024-11-09  2636  
5181b278b79074 Thomas Gleixner    2024-08-04  2637  	return ret;
5181b278b79074 Thomas Gleixner    2024-08-04  2638  }
5181b278b79074 Thomas Gleixner    2024-08-04  2639  

:::::: The code at line 2590 was first introduced by commit
:::::: aa6f9c595d857328e5d815e5b94c0e7cd31a6b59 ntp: Move do_adjtimex() and hardpps() functions to timekeeping.c

:::::: TO: John Stultz <john.stultz@linaro.org>
:::::: CC: John Stultz <john.stultz@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
