Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E983C1996;
	Wed, 25 Feb 2026 13:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772027575; cv=none; b=ZqLH85XHUQw+jLCMVrIYo9K/4hwtRLoVCu7uQHBz+HZ6h/zRZJ5J4BKCQtl3TrNWYG+wiMPWRSg/dp6L7XZ2jGJE4upv/Vs5yL1txwKoPGFgHoAc11Cgh1CwjTTvNmyqg0v0nJN4Kod2TXgXfTxFXerqaLybW7wyIjM16Qmr+bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772027575; c=relaxed/simple;
	bh=eU3luCEpEbyesp69kTun0rpDQYWFy2uNKeaTeEUTTHY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iZm+y+y7wsyUcoEL/+PA7ToxWEVl2v5/LLFm0QAfEZbwP35aRH8fpO81WV1PfpaS7wc58jnaSjaT2ZNTXnK9oBd4ttfJu9KAX0uqzAB01Z/zTXRUXyVRUtTe6mPateg3xCvr0e2DaI/jsAquqVJsaI+05Cs+VTSsI5R6eqU1OXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P57g+l4L; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P57g+l4L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772027572; x=1803563572;
  h=date:from:to:cc:subject:message-id;
  bh=eU3luCEpEbyesp69kTun0rpDQYWFy2uNKeaTeEUTTHY=;
  b=P57g+l4LrPCpFbTMo/1DZVstX/Nma33PVoRKRQRD75UKHFR63c9tRT93
   z/iLKsGOB9KRB/ThJ8OMAsiASwtpx8pIzd1bvNANZIOhbKAAH4Q9njoky
   s0z5GGpjEZ+0hUA6y+FDLHuHEf/l5rtcTTScqhXzM3nu6GI2xCt6NPhek
   bH9UhE+ca/lQlQS1SIO+Rn+sEUbXoaOhZFLPqOZpzKAZ5xqK7mofquMqa
   kVKXoSX+FKLfzLH2nqq63uGfOq2SCeaClV30KLg5xru3+gQzboXGK7XCL
   5nnJPWWyNOnOPNpPjYZ68+dyyn6KSy/879yMFMeA4O4rVLyfWw4I0qtaR
   A==;
X-CSE-ConnectionGUID: nIhT7FiTTR6Rh2NfLdE0lw==
X-CSE-MsgGUID: aS0h0aG5RHOB4i9r9QnZDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="90643401"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="90643401"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 05:52:51 -0800
X-CSE-ConnectionGUID: Zd6dCw1MRPehf3sU2CR0qA==
X-CSE-MsgGUID: PH0Ex5rJSX63AhsgFKsGbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="215342717"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 25 Feb 2026 05:52:50 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvFJn-000000005uT-0m72;
	Wed, 25 Feb 2026 13:52:47 +0000
Date: Wed, 25 Feb 2026 21:52:22 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mripard:drm/state-readout 23/28]
 drivers/gpu/drm/tidss/tidss_crtc.c:445:13: error: call to undeclared function
 'FIELD_GET'; ISO C99 and later do not support implicit function declarations
Message-ID: <202602252135.crqaJLVS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git drm/state-readout
head:   c9f24e410ebb9f3bade012825d8cfd87915e9d4d
commit: bd325f6eb5f08e76ae51b78f9646ac6763156adb [23/28] drm/tidss: Implement readout support
config: riscv-randconfig-001-20260225 (https://download.01.org/0day-ci/archive/20260225/202602252135.crqaJLVS-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9a109fbb6e184ec9bcce10615949f598f4c974a9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260225/202602252135.crqaJLVS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602252135.crqaJLVS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/tidss/tidss_crtc.c:445:13: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     445 |         hdisplay = FIELD_GET(DISPC_VP_SIZE_SCREEN_HDISPLAY_MASK, val) + 1;
         |                    ^
   drivers/gpu/drm/tidss/tidss_crtc.c:523:7: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     523 |         if (!FIELD_GET(DISPC_VP_CONTROL_ENABLE_MASK, val))
         |              ^
   2 errors generated.
--
>> drivers/gpu/drm/tidss/tidss_plane.c:203:39: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     203 |                 dispc_plane_find_fourcc_by_dss_code(FIELD_GET(DISPC_VID_ATTRIBUTES_FORMAT_MASK,
         |                                                     ^
   drivers/gpu/drm/tidss/tidss_plane.c:291:7: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     291 |         if (!FIELD_GET(DISPC_VID_ATTRIBUTES_ENABLE_MASK, val)) {
         |              ^
   2 errors generated.


vim +/FIELD_GET +445 drivers/gpu/drm/tidss/tidss_crtc.c

   430	
   431	static int tidss_crtc_readout_mode(struct dispc_device *dispc,
   432					   struct tidss_crtc *tcrtc,
   433					   struct drm_display_mode *mode)
   434	{
   435		struct tidss_device *tidss = dispc->tidss;
   436		struct drm_device *dev = &tidss->ddev;
   437		unsigned long pixel_clock;
   438		unsigned int refresh;
   439		u16 hdisplay, hfp, hsw, hbp;
   440		u16 vdisplay, vfp, vsw, vbp;
   441		u32 vp = tcrtc->hw_videoport;
   442		u32 val;
   443	
   444		val = dispc_vp_read(dispc, vp, DISPC_VP_SIZE_SCREEN);
 > 445		hdisplay = FIELD_GET(DISPC_VP_SIZE_SCREEN_HDISPLAY_MASK, val) + 1;
   446		vdisplay = FIELD_GET(DISPC_VP_SIZE_SCREEN_VDISPLAY_MASK, val) + 1;
   447	
   448		mode->hdisplay = hdisplay;
   449		mode->vdisplay = vdisplay;
   450	
   451		val = dispc_vp_read(dispc, vp, DISPC_VP_TIMING_H);
   452		hsw = FIELD_GET(DISPC_VP_TIMING_H_SYNC_PULSE_MASK, val) + 1;
   453		hfp = FIELD_GET(DISPC_VP_TIMING_H_FRONT_PORCH_MASK, val) + 1;
   454		hbp = FIELD_GET(DISPC_VP_TIMING_H_BACK_PORCH_MASK, val) + 1;
   455	
   456		mode->hsync_start = hdisplay + hfp;
   457		mode->hsync_end = hdisplay + hfp + hsw;
   458		mode->htotal = hdisplay + hfp + hsw + hbp;
   459	
   460		val = dispc_vp_read(dispc, vp, DISPC_VP_TIMING_V);
   461		vsw = FIELD_GET(DISPC_VP_TIMING_V_SYNC_PULSE_MASK, val) + 1;
   462		vfp = FIELD_GET(DISPC_VP_TIMING_V_FRONT_PORCH_MASK, val);
   463		vbp = FIELD_GET(DISPC_VP_TIMING_V_BACK_PORCH_MASK, val);
   464	
   465		mode->vsync_start = vdisplay + vfp;
   466		mode->vsync_end = vdisplay + vfp + vsw;
   467		mode->vtotal = vdisplay + vfp + vsw + vbp;
   468	
   469		refresh = tidss_find_closest_refresh_rate_from_clk(dev,
   470								   dispc->vp_clk[vp],
   471								   mode->htotal,
   472								   mode->vtotal,
   473								   &pixel_clock);
   474		if (!refresh)
   475			return -EINVAL;
   476	
   477		mode->clock = pixel_clock / 1000;
   478	
   479		val = dispc_vp_read(dispc, vp, DISPC_VP_POL_FREQ);
   480		if (FIELD_GET(DISPC_VP_POL_FREQ_IVS_MASK, val))
   481			mode->flags |= DRM_MODE_FLAG_NVSYNC;
   482		else
   483			mode->flags |= DRM_MODE_FLAG_PVSYNC;
   484	
   485		if (FIELD_GET(DISPC_VP_POL_FREQ_IHS_MASK, val))
   486			mode->flags |= DRM_MODE_FLAG_NHSYNC;
   487		else
   488			mode->flags |= DRM_MODE_FLAG_PHSYNC;
   489	
   490		mode->type |= DRM_MODE_TYPE_DRIVER;
   491		drm_mode_set_name(mode);
   492		drm_mode_set_crtcinfo(mode, 0);
   493	
   494		return 0;
   495	}
   496	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
