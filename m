Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F44733ADAB;
	Thu,  5 Mar 2026 22:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772751024; cv=none; b=l+Te4QKjPBWiYZOVkEbgbJp71Fqp/lmGx5ja3B2t/DcoXaGGSQ2CQE2tTVS6UHBYMT7AGDGpzcpMPOkJyPP45gWVPdzwoQyAXPA6Mx83k67/6jZ9/cJ0482lSOk3YVpzmuiLGBrL9z01QmrNbc3MGCa6ou2/q2glr3098VzTUwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772751024; c=relaxed/simple;
	bh=A3JNYCbQ1bI2Ru//fHlbOZ83rS5jtOWcTTZ5KORXoFg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Wzot9aW0VBnHcVN4kNA4hdhE2Ydvs7M2idJyWV38qQcmZa953RCjkq/75ojtYc1cU7jpC76zhuqEz8xCIwCmT75RJsS2MjC5y9iK140W8+yBZwY6Ot+9vboQesKkPpW4TEYGUC6jpbyzY573LfEbCEbya7kO5sCaKj9PUKgk3vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FZluMXzh; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FZluMXzh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772751024; x=1804287024;
  h=date:from:to:cc:subject:message-id;
  bh=A3JNYCbQ1bI2Ru//fHlbOZ83rS5jtOWcTTZ5KORXoFg=;
  b=FZluMXzhj9DUTVpBpYZqM4+/4AQfX5XvNdYV4bdstxkv7hUPHg77F5Zu
   H/KU9oH5FLi6UsrBReX/h/OqZgZuYxdHGsCRPcc9qIlTXjzueB0k5vtiH
   H/QNJhuhNR6Rz+iTnlp1FNetCQL4Apy6GDw786/FW4FUmzOoJhqXRr1wc
   ATBfrl9laRREq3EUdfYEKcrPqZzXP/XMVQTRyZ6VKlHq2f92aoEKap4wa
   AXvwWKMwKEEOOiaDAq5AnsqSms2uCg/sa6HqTB/37wkVMpucq9ZHhjsbk
   miZ8gTbgs6mVUEHoFwFJchQ91Jqd8CCBC0P5ouU/QawWCCO+QYx9HSkMS
   Q==;
X-CSE-ConnectionGUID: JX+s4/b4TpaTJbJKasq9bw==
X-CSE-MsgGUID: Q+XTG6IJTmiJUJAPeJuXXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="76456763"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="76456763"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 14:50:23 -0800
X-CSE-ConnectionGUID: 5wuXcS9UQqGdltdMvzDncw==
X-CSE-MsgGUID: 9SPRmRgYRiSCviu3f26rMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="223313268"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Mar 2026 14:50:20 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyHWL-00000000023-3kN8;
	Thu, 05 Mar 2026 22:50:17 +0000
Date: Fri, 06 Mar 2026 06:50:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe:rw_iter 135/467]
 drivers/gpu/drm/i915/display/intel_wm.c:45:6: error: conflicting types for
 'intel_update_watermarks'
Message-ID: <202603060654.qzHEPK65-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   9d549a35a0c4585bfc4ff24185c5d8cb7485078e
commit: cad0bb9e353bf6c4224c6fd99335dd17f6da67c7 [135/467] drm/i915: convert to read/write iterators
config: x86_64-randconfig-014-20260305 (https://download.01.org/0day-ci/archive/20260306/202603060654.qzHEPK65-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603060654.qzHEPK65-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603060654.qzHEPK65-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_wm.c:45:6: error: conflicting types for 'intel_update_watermarks'
      45 | void intel_update_watermarks(struct drm_i915_private *i915)
         |      ^
   drivers/gpu/drm/i915/display/intel_wm.h:17:6: note: previous declaration is here
      17 | void intel_update_watermarks(struct intel_display *display);
         |      ^
>> drivers/gpu/drm/i915/display/intel_wm.c:47:19: error: member reference type 'struct intel_display *' is a pointer; did you mean to use '->'?
      47 |         if (i915->display.funcs.wm->update_wm)
         |             ~~~~~~~~~~~~~^
         |                          ->
>> drivers/gpu/drm/i915/display/intel_wm.c:47:19: error: incomplete definition of type 'struct intel_display'
      47 |         if (i915->display.funcs.wm->update_wm)
         |             ~~~~~~~~~~~~~^
   drivers/gpu/drm/i915/i915_drv.h:64:8: note: forward declaration of 'struct intel_display'
      64 | struct intel_display;
         |        ^
   drivers/gpu/drm/i915/display/intel_wm.c:48:16: error: member reference type 'struct intel_display *' is a pointer; did you mean to use '->'?
      48 |                 i915->display.funcs.wm->update_wm(i915);
         |                 ~~~~~~~~~~~~~^
         |                              ->
   drivers/gpu/drm/i915/display/intel_wm.c:48:16: error: incomplete definition of type 'struct intel_display'
      48 |                 i915->display.funcs.wm->update_wm(i915);
         |                 ~~~~~~~~~~~~~^
   drivers/gpu/drm/i915/i915_drv.h:64:8: note: forward declaration of 'struct intel_display'
      64 | struct intel_display;
         |        ^
   drivers/gpu/drm/i915/display/intel_wm.c:56:19: error: member reference type 'struct intel_display *' is a pointer; did you mean to use '->'?
      56 |         if (i915->display.funcs.wm->compute_pipe_wm)
         |             ~~~~~~~~~~~~~^
         |                          ->
   drivers/gpu/drm/i915/display/intel_wm.c:56:19: error: incomplete definition of type 'struct intel_display'
      56 |         if (i915->display.funcs.wm->compute_pipe_wm)
         |             ~~~~~~~~~~~~~^
   drivers/gpu/drm/i915/i915_drv.h:64:8: note: forward declaration of 'struct intel_display'
      64 | struct intel_display;
         |        ^
   drivers/gpu/drm/i915/display/intel_wm.c:57:23: error: member reference type 'struct intel_display *' is a pointer; did you mean to use '->'?
      57 |                 return i915->display.funcs.wm->compute_pipe_wm(state, crtc);
         |                        ~~~~~~~~~~~~~^
         |                                     ->
   drivers/gpu/drm/i915/display/intel_wm.c:57:23: error: incomplete definition of type 'struct intel_display'
      57 |                 return i915->display.funcs.wm->compute_pipe_wm(state, crtc);
         |                        ~~~~~~~~~~~~~^
   drivers/gpu/drm/i915/i915_drv.h:64:8: note: forward declaration of 'struct intel_display'
      64 | struct intel_display;
         |        ^
>> drivers/gpu/drm/i915/display/intel_wm.c:51:5: warning: no previous prototype for function 'intel_compute_pipe_wm' [-Wmissing-prototypes]
      51 | int intel_compute_pipe_wm(struct intel_atomic_state *state,
         |     ^
   drivers/gpu/drm/i915/display/intel_wm.c:51:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      51 | int intel_compute_pipe_wm(struct intel_atomic_state *state,
         | ^
         | static 
   drivers/gpu/drm/i915/display/intel_wm.c:67:20: error: member reference type 'struct intel_display *' is a pointer; did you mean to use '->'?
      67 |         if (!i915->display.funcs.wm->compute_intermediate_wm)
         |              ~~~~~~~~~~~~~^
         |                           ->
   drivers/gpu/drm/i915/display/intel_wm.c:67:20: error: incomplete definition of type 'struct intel_display'
      67 |         if (!i915->display.funcs.wm->compute_intermediate_wm)
         |              ~~~~~~~~~~~~~^
   drivers/gpu/drm/i915/i915_drv.h:64:8: note: forward declaration of 'struct intel_display'
      64 | struct intel_display;
         |        ^
>> drivers/gpu/drm/i915/display/intel_wm.c:70:6: error: call to undeclared function 'drm_WARN_ON'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      70 |         if (drm_WARN_ON(&i915->drm, !i915->display.funcs.wm->compute_pipe_wm))
         |             ^
   drivers/gpu/drm/i915/display/intel_wm.c:70:44: error: member reference type 'struct intel_display *' is a pointer; did you mean to use '->'?
      70 |         if (drm_WARN_ON(&i915->drm, !i915->display.funcs.wm->compute_pipe_wm))
         |                                      ~~~~~~~~~~~~~^
         |                                                   ->
   drivers/gpu/drm/i915/display/intel_wm.c:70:44: error: incomplete definition of type 'struct intel_display'
      70 |         if (drm_WARN_ON(&i915->drm, !i915->display.funcs.wm->compute_pipe_wm))
         |                                      ~~~~~~~~~~~~~^
   drivers/gpu/drm/i915/i915_drv.h:64:8: note: forward declaration of 'struct intel_display'
      64 | struct intel_display;
         |        ^
   drivers/gpu/drm/i915/display/intel_wm.c:73:22: error: member reference type 'struct intel_display *' is a pointer; did you mean to use '->'?
      73 |         return i915->display.funcs.wm->compute_intermediate_wm(state, crtc);
         |                ~~~~~~~~~~~~~^
         |                             ->
   drivers/gpu/drm/i915/display/intel_wm.c:73:22: error: incomplete definition of type 'struct intel_display'
      73 |         return i915->display.funcs.wm->compute_intermediate_wm(state, crtc);
         |                ~~~~~~~~~~~~~^
   drivers/gpu/drm/i915/i915_drv.h:64:8: note: forward declaration of 'struct intel_display'
      64 | struct intel_display;
         |        ^
>> drivers/gpu/drm/i915/display/intel_wm.c:62:5: warning: no previous prototype for function 'intel_compute_intermediate_wm' [-Wmissing-prototypes]
      62 | int intel_compute_intermediate_wm(struct intel_atomic_state *state,
         |     ^
   drivers/gpu/drm/i915/display/intel_wm.c:62:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      62 | int intel_compute_intermediate_wm(struct intel_atomic_state *state,
         | ^
         | static 
   drivers/gpu/drm/i915/display/intel_wm.c:81:19: error: member reference type 'struct intel_display *' is a pointer; did you mean to use '->'?
      81 |         if (i915->display.funcs.wm->initial_watermarks) {
         |             ~~~~~~~~~~~~~^
         |                          ->
   drivers/gpu/drm/i915/display/intel_wm.c:81:19: error: incomplete definition of type 'struct intel_display'
      81 |         if (i915->display.funcs.wm->initial_watermarks) {
         |             ~~~~~~~~~~~~~^
   drivers/gpu/drm/i915/i915_drv.h:64:8: note: forward declaration of 'struct intel_display'
      64 | struct intel_display;
         |        ^
   drivers/gpu/drm/i915/display/intel_wm.c:82:16: error: member reference type 'struct intel_display *' is a pointer; did you mean to use '->'?
      82 |                 i915->display.funcs.wm->initial_watermarks(state, crtc);
         |                 ~~~~~~~~~~~~~^
         |                              ->
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   2 warnings and 20 errors generated.


vim +/intel_update_watermarks +45 drivers/gpu/drm/i915/display/intel_wm.c

    11	
    12	/**
    13	 * intel_update_watermarks - update FIFO watermark values based on current modes
    14	 * @i915: i915 device
    15	 *
    16	 * Calculate watermark values for the various WM regs based on current mode
    17	 * and plane configuration.
    18	 *
    19	 * There are several cases to deal with here:
    20	 *   - normal (i.e. non-self-refresh)
    21	 *   - self-refresh (SR) mode
    22	 *   - lines are large relative to FIFO size (buffer can hold up to 2)
    23	 *   - lines are small relative to FIFO size (buffer can hold more than 2
    24	 *     lines), so need to account for TLB latency
    25	 *
    26	 *   The normal calculation is:
    27	 *     watermark = dotclock * bytes per pixel * latency
    28	 *   where latency is platform & configuration dependent (we assume pessimal
    29	 *   values here).
    30	 *
    31	 *   The SR calculation is:
    32	 *     watermark = (trunc(latency/line time)+1) * surface width *
    33	 *       bytes per pixel
    34	 *   where
    35	 *     line time = htotal / dotclock
    36	 *     surface width = hdisplay for normal plane and 64 for cursor
    37	 *   and latency is assumed to be high, as above.
    38	 *
    39	 * The final value programmed to the register should always be rounded up,
    40	 * and include an extra 2 entries to account for clock crossings.
    41	 *
    42	 * We don't use the sprite, so we can ignore that.  And on Crestline we have
    43	 * to set the non-SR watermarks to 8.
    44	 */
  > 45	void intel_update_watermarks(struct drm_i915_private *i915)
    46	{
  > 47		if (i915->display.funcs.wm->update_wm)
    48			i915->display.funcs.wm->update_wm(i915);
    49	}
    50	
  > 51	int intel_compute_pipe_wm(struct intel_atomic_state *state,
    52				  struct intel_crtc *crtc)
    53	{
    54		struct drm_i915_private *i915 = to_i915(state->base.dev);
    55	
    56		if (i915->display.funcs.wm->compute_pipe_wm)
  > 57			return i915->display.funcs.wm->compute_pipe_wm(state, crtc);
    58	
    59		return 0;
    60	}
    61	
  > 62	int intel_compute_intermediate_wm(struct intel_atomic_state *state,
    63					  struct intel_crtc *crtc)
    64	{
    65		struct drm_i915_private *i915 = to_i915(state->base.dev);
    66	
  > 67		if (!i915->display.funcs.wm->compute_intermediate_wm)
    68			return 0;
    69	
  > 70		if (drm_WARN_ON(&i915->drm, !i915->display.funcs.wm->compute_pipe_wm))
    71			return 0;
    72	
  > 73		return i915->display.funcs.wm->compute_intermediate_wm(state, crtc);
    74	}
    75	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
