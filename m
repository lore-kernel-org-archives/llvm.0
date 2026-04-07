Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09F2374E57;
	Tue,  7 Apr 2026 03:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775533766; cv=none; b=C/wzOSEDDjD05Q7rANjA+Js6xu7u5nF17ZFzDbNlphYfwHO4/D0Ajj7PtWi7frNnqzl9lkNWeZ8Vak6tmJmEJ6CZtwPpF0GSluLW17gRa52495MjwIHlosvRimAJSdWRwjGaKag9mCw5Ij2MLCW0j4XYcoZB32qpEK96b+EUW9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775533766; c=relaxed/simple;
	bh=wRCtZ7CPaLG3gmL++yYgpA4v+LbBMBNo8bMQRCsfGSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SWRs8jmKK10KVdHOU3tfYU6M8t+UkO8LbwwWoeJah/1p8TxXn6nh23tHUI/sIgIhbcLMFUxb7/m1jUMj48AYuJjpHwONyeUT09naWF7ue6NG1mICIrdaa4YnmLD5hqnhcvtUbZYz0y3MR92tzkTqE4PkoeZ4TgEvs47xq6W/cC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QSDMEGNK; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QSDMEGNK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775533764; x=1807069764;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wRCtZ7CPaLG3gmL++yYgpA4v+LbBMBNo8bMQRCsfGSg=;
  b=QSDMEGNKBHfPXVuawSewE+yGFwIQ4VK6MWf8p4u9V91EZwLd8ukFKFIB
   uXPR2RMiQG0ka0GPNdAunBedJP1VbqW3YEXXvauNvmehmQ228dX9DacMF
   8YIkPJat6Bds9zd8qk39umgU9LZ2VXUgyuqVPs2CoxUUY8+SutQo3iI4i
   ofNHAbBRn9b8YptcIaZjhy+VKxpFrIdCFbw5Sd+XybeQaaYueT4ykbPZd
   jMTTlEY/BL+shqgTiQ70k9YnNgJjld1ftYOOzKtAGnJCsmUT8l5CrBoRq
   JA7cH8GLBkacbhMbii/d/XauxKCujecBSNLKb2XtcEBqACSaUyXYQ8sGd
   w==;
X-CSE-ConnectionGUID: fn0mIxdKRFuGr06gQwejRA==
X-CSE-MsgGUID: Ec40n/+zTzCc1PxyN+2KSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76385870"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="76385870"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:49:22 -0700
X-CSE-ConnectionGUID: AxbBSVqjSBKvW2dHIRP16Q==
X-CSE-MsgGUID: KkEjQWiyStaehsaLz7LKpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="251191884"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Apr 2026 20:49:20 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xRG-0000000001F-0YnG;
	Tue, 07 Apr 2026 03:49:18 +0000
Date: Tue, 7 Apr 2026 11:49:01 +0800
From: kernel test robot <lkp@intel.com>
To: Nemesa Garg <nemesa.garg@intel.com>, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	ville.syrjala@linux.intel.com, Nemesa Garg <nemesa.garg@intel.com>
Subject: Re: [PATCH] drm/i915/pfit: Prevent negative coordinates in center
 mode
Message-ID: <202604032320.Bmwm7fST-lkp@intel.com>
References: <20260331181656.77300-1-nemesa.garg@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331181656.77300-1-nemesa.garg@intel.com>

Hi Nemesa,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-i915/for-linux-next]
[also build test WARNING on drm-i915/for-linux-next-fixes drm-tip/drm-tip linus/master v7.0-rc6 next-20260401]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nemesa-Garg/drm-i915-pfit-Prevent-negative-coordinates-in-center-mode/20260403-100828
base:   https://gitlab.freedesktop.org/drm/i915/kernel.git for-linux-next
patch link:    https://lore.kernel.org/r/20260331181656.77300-1-nemesa.garg%40intel.com
patch subject: [PATCH] drm/i915/pfit: Prevent negative coordinates in center mode
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20260403/202604032320.Bmwm7fST-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260403/202604032320.Bmwm7fST-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604032320.Bmwm7fST-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_pfit.c:209:9: warning: variable 'width' is uninitialized when used here [-Wuninitialized]
     209 |                                     width, height,
         |                                     ^~~~~
   include/drm/drm_print.h:653:52: note: expanded from macro 'drm_dbg_kms'
     653 |         drm_dev_dbg(__drm_to_dev(drm), DRM_UT_KMS, fmt, ##__VA_ARGS__)
         |                                                           ^~~~~~~~~~~
   include/drm/drm_print.h:563:39: note: expanded from macro 'drm_dev_dbg'
     563 |         __drm_dev_dbg(NULL, dev, cat, fmt, ##__VA_ARGS__)
         |                                              ^~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_pfit.c:194:22: note: initialize the variable 'width' to silence this warning
     194 |         int ret, x, y, width, height;
         |                             ^
         |                              = 0
>> drivers/gpu/drm/i915/display/intel_pfit.c:209:16: warning: variable 'height' is uninitialized when used here [-Wuninitialized]
     209 |                                     width, height,
         |                                            ^~~~~~
   include/drm/drm_print.h:653:52: note: expanded from macro 'drm_dbg_kms'
     653 |         drm_dev_dbg(__drm_to_dev(drm), DRM_UT_KMS, fmt, ##__VA_ARGS__)
         |                                                           ^~~~~~~~~~~
   include/drm/drm_print.h:563:39: note: expanded from macro 'drm_dev_dbg'
     563 |         __drm_dev_dbg(NULL, dev, cat, fmt, ##__VA_ARGS__)
         |                                              ^~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_pfit.c:194:30: note: initialize the variable 'height' to silence this warning
     194 |         int ret, x, y, width, height;
         |                                     ^
         |                                      = 0
   2 warnings generated.


vim +/width +209 drivers/gpu/drm/i915/display/intel_pfit.c

   183	
   184	/* adjusted_mode has been preset to be the panel's fixed mode */
   185	static int pch_panel_fitting(struct intel_crtc_state *crtc_state,
   186				     const struct drm_connector_state *conn_state)
   187	{
   188		struct intel_display *display = to_intel_display(crtc_state);
   189		struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
   190		const struct drm_display_mode *adjusted_mode =
   191			&crtc_state->hw.adjusted_mode;
   192		int pipe_src_w = drm_rect_width(&crtc_state->pipe_src);
   193		int pipe_src_h = drm_rect_height(&crtc_state->pipe_src);
   194		int ret, x, y, width, height;
   195	
   196		/* Native modes don't need fitting */
   197		if (adjusted_mode->crtc_hdisplay == pipe_src_w &&
   198		    adjusted_mode->crtc_vdisplay == pipe_src_h &&
   199		    crtc_state->output_format != INTEL_OUTPUT_FORMAT_YCBCR420)
   200			return 0;
   201	
   202		switch (conn_state->scaling_mode) {
   203		case DRM_MODE_SCALE_CENTER:
   204			if (adjusted_mode->crtc_hdisplay < pipe_src_w ||
   205			    adjusted_mode->crtc_vdisplay < pipe_src_h) {
   206				drm_dbg_kms(display->drm,
   207					    "[CRTC:%d:%s] pfit center mode source (%dx%d) exceeds display (%dx%d)\n",
   208					    crtc->base.base.id, crtc->base.name,
 > 209					    width, height,
   210					    adjusted_mode->crtc_hdisplay,
   211					    adjusted_mode->crtc_vdisplay);
   212				return -EINVAL;
   213			}
   214			width = pipe_src_w;
   215			height = pipe_src_h;
   216			x = (adjusted_mode->crtc_hdisplay - width + 1)/2;
   217			y = (adjusted_mode->crtc_vdisplay - height + 1)/2;
   218			break;
   219	
   220		case DRM_MODE_SCALE_ASPECT:
   221			/* Scale but preserve the aspect ratio */
   222			{
   223				u32 scaled_width = adjusted_mode->crtc_hdisplay * pipe_src_h;
   224				u32 scaled_height = pipe_src_w * adjusted_mode->crtc_vdisplay;
   225	
   226				if (scaled_width > scaled_height) { /* pillar */
   227					width = scaled_height / pipe_src_h;
   228					if (width & 1)
   229						width++;
   230					x = (adjusted_mode->crtc_hdisplay - width + 1) / 2;
   231					y = 0;
   232					height = adjusted_mode->crtc_vdisplay;
   233				} else if (scaled_width < scaled_height) { /* letter */
   234					height = scaled_width / pipe_src_w;
   235					if (height & 1)
   236						height++;
   237					y = (adjusted_mode->crtc_vdisplay - height + 1) / 2;
   238					x = 0;
   239					width = adjusted_mode->crtc_hdisplay;
   240				} else {
   241					x = y = 0;
   242					width = adjusted_mode->crtc_hdisplay;
   243					height = adjusted_mode->crtc_vdisplay;
   244				}
   245			}
   246			break;
   247	
   248		case DRM_MODE_SCALE_NONE:
   249			WARN_ON(adjusted_mode->crtc_hdisplay != pipe_src_w);
   250			WARN_ON(adjusted_mode->crtc_vdisplay != pipe_src_h);
   251			fallthrough;
   252		case DRM_MODE_SCALE_FULLSCREEN:
   253			x = y = 0;
   254			width = adjusted_mode->crtc_hdisplay;
   255			height = adjusted_mode->crtc_vdisplay;
   256			break;
   257	
   258		default:
   259			MISSING_CASE(conn_state->scaling_mode);
   260			return -EINVAL;
   261		}
   262	
   263		drm_rect_init(&crtc_state->pch_pfit.dst,
   264			      x, y, width, height);
   265		crtc_state->pch_pfit.enabled = true;
   266	
   267		/*
   268		 * SKL+ have unified scalers for pipes/planes so the
   269		 * checks are done in a single place for all scalers.
   270		 */
   271		if (DISPLAY_VER(display) >= 9)
   272			return 0;
   273	
   274		ret = intel_pch_pfit_check_dst_window(crtc_state);
   275		if (ret)
   276			return ret;
   277	
   278		ret = intel_pch_pfit_check_src_size(crtc_state);
   279		if (ret)
   280			return ret;
   281	
   282		ret = intel_pch_pfit_check_scaling(crtc_state);
   283		if (ret)
   284			return ret;
   285	
   286		ret = intel_pch_pfit_check_timings(crtc_state);
   287		if (ret)
   288			return ret;
   289	
   290		ret = intel_pch_pfit_check_cloning(crtc_state);
   291		if (ret)
   292			return ret;
   293	
   294		return 0;
   295	}
   296	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
