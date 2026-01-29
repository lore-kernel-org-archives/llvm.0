Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B532745C;
	Thu, 29 Jan 2026 03:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769659088; cv=none; b=CGMpbp+nxzE393ByfH4d6DcnOy5av8gXxrgOjKw30w3yhav/vGtbL9ll4Ssy3hK8R+iaO6iIGXGqZ87L6FG57juiNpHJcdVoy+zlKeqL0fLQ17vaVKa1hNUK0JBLlyfbFDcnmJBCII8132730a6Xb4vf9FIMrpce9zPtTuK4VcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769659088; c=relaxed/simple;
	bh=pZTQzzhwMQxHvcW4sgILOyyLiK0welR6IrsOw4ftPkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KJPs6srrTW9Bu38sf148QFBhaOTWqwEB/ZjQJrIYF1cqqu/Fq0vzD/h6Zq6OnQXBMqrwpO9E5C9T7Wrs+HWvEiflHOih273x/LtJDXo84xFG8jADsfnD7xZLRBo0aTy57c/stMXixvf7FIzh3Jyoe1YrjVP0jxkofrtI3n2WZrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KZTHB/YD; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KZTHB/YD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769659085; x=1801195085;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=pZTQzzhwMQxHvcW4sgILOyyLiK0welR6IrsOw4ftPkU=;
  b=KZTHB/YDtyA/4axUIqEWr14uVXQRTQzzmzt0D/z4Jgv2pFy8vPw1sUX6
   F4KYPbS5MkXSDv3G+ytb7C7RNsr5Zxbn+queqL7e7btMYZhjgKZU0fVA4
   hqGaTcwozfmmYmt4MD+Vdnr427GwV9pxY/Fw14xsl61esJDQjCrip/eH+
   sG8uxQIy2bfQ+pUYuPnS8ob/QmUwsnbNfCqmXgg+iNx6efy70Uy4zm/FQ
   upmX8vA5nYZWzFq+qImoZtZR4YsSPEAAZISzNRYvrJpx1GMQeFyyfeR/W
   ElnnY+IIhkTvPlAZgiQzDSB7W/ZQ7KMW92fQSnUoJLnqCMhkoIFgSESUy
   g==;
X-CSE-ConnectionGUID: ncJzWDwWSxSv/sOhNZidTQ==
X-CSE-MsgGUID: 5FUE9rqbTV2FXQvSGw/FSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="88303733"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="88303733"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 19:58:04 -0800
X-CSE-ConnectionGUID: vGVHJt50RfarKYwk8gf0VQ==
X-CSE-MsgGUID: FBtdmdWjSiqdmBW3aBXjBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="208347944"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Jan 2026 19:58:02 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlJAO-00000000b44-0YLF;
	Thu, 29 Jan 2026 03:58:00 +0000
Date: Thu, 29 Jan 2026 11:57:47 +0800
From: kernel test robot <lkp@intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	jani.nikula@linux.intel.com, imre.deak@intel.com,
	Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH 11/16] drm/i915/dp: Introduce helper to check pixel rate
 against dotclock limits
Message-ID: <202601291157.RJA0VVmb-lkp@intel.com>
References: <20260128140636.3527799-12-ankit.k.nautiyal@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260128140636.3527799-12-ankit.k.nautiyal@intel.com>

Hi Ankit,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-tip/drm-tip]
[cannot apply to drm-i915/for-linux-next drm-i915/for-linux-next-fixes linus/master v6.19-rc7 next-20260128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ankit-Nautiyal/drm-i915-dp-Early-reject-bad-hdisplay-in-intel_dp_mode_valid/20260128-234512
base:   https://gitlab.freedesktop.org/drm/tip.git drm-tip
patch link:    https://lore.kernel.org/r/20260128140636.3527799-12-ankit.k.nautiyal%40intel.com
patch subject: [PATCH 11/16] drm/i915/dp: Introduce helper to check pixel rate against dotclock limits
config: i386-randconfig-004-20260129 (https://download.01.org/0day-ci/archive/20260129/202601291157.RJA0VVmb-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260129/202601291157.RJA0VVmb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601291157.RJA0VVmb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_dp.c:2828:6: warning: variable 'max_dotclk' set but not used [-Wunused-but-set-variable]
    2828 |         int max_dotclk = display->cdclk.max_dotclk_freq;
         |             ^
   1 warning generated.


vim +/max_dotclk +2828 drivers/gpu/drm/i915/display/intel_dp.c

aa099402f98b1e drivers/gpu/drm/i915/display/intel_dp.c Ville Syrjälä         2024-04-05  2814  
72b2d2a6f178b9 drivers/gpu/drm/i915/display/intel_dp.c Imre Deak             2023-09-21  2815  static int
0d71b594bb8132 drivers/gpu/drm/i915/display/intel_dp.c Ankit Nautiyal        2026-01-28  2816  intel_dp_compute_link_for_joined_pipes(struct intel_encoder *encoder,
72b2d2a6f178b9 drivers/gpu/drm/i915/display/intel_dp.c Imre Deak             2023-09-21  2817  				       struct intel_crtc_state *pipe_config,
72b2d2a6f178b9 drivers/gpu/drm/i915/display/intel_dp.c Imre Deak             2023-09-21  2818  				       struct drm_connector_state *conn_state,
72b2d2a6f178b9 drivers/gpu/drm/i915/display/intel_dp.c Imre Deak             2023-09-21  2819  				       bool respect_downstream_limits)
72b2d2a6f178b9 drivers/gpu/drm/i915/display/intel_dp.c Imre Deak             2023-09-21  2820  {
8146b9235fc2b3 drivers/gpu/drm/i915/display/intel_dp.c Jani Nikula           2024-12-13  2821  	struct intel_display *display = to_intel_display(encoder);
0d71b594bb8132 drivers/gpu/drm/i915/display/intel_dp.c Ankit Nautiyal        2026-01-28  2822  	int num_joined_pipes = intel_crtc_num_joined_pipes(pipe_config);
e43b4f7980f860 drivers/gpu/drm/i915/display/intel_dp.c Ville Syrjälä         2024-04-05  2823  	struct intel_connector *connector =
36f579ffc69214 drivers/gpu/drm/i915/display/intel_dp.c Imre Deak             2023-10-24  2824  		to_intel_connector(conn_state->connector);
72b2d2a6f178b9 drivers/gpu/drm/i915/display/intel_dp.c Imre Deak             2023-09-21  2825  	const struct drm_display_mode *adjusted_mode =
72b2d2a6f178b9 drivers/gpu/drm/i915/display/intel_dp.c Imre Deak             2023-09-21  2826  		&pipe_config->hw.adjusted_mode;
72b2d2a6f178b9 drivers/gpu/drm/i915/display/intel_dp.c Imre Deak             2023-09-21  2827  	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
0d71b594bb8132 drivers/gpu/drm/i915/display/intel_dp.c Ankit Nautiyal        2026-01-28 @2828  	int max_dotclk = display->cdclk.max_dotclk_freq;
72b2d2a6f178b9 drivers/gpu/drm/i915/display/intel_dp.c Imre Deak             2023-09-21  2829  	struct link_config_limits limits;
aa099402f98b1e drivers/gpu/drm/i915/display/intel_dp.c Ville Syrjälä         2024-04-05  2830  	bool dsc_needed, joiner_needs_dsc;
7d0f2f68b661e5 drivers/gpu/drm/i915/display/intel_dp.c Imre Deak             2023-09-21  2831  	int ret = 0;
72b2d2a6f178b9 drivers/gpu/drm/i915/display/intel_dp.c Imre Deak             2023-09-21  2832  
5d1bbfba0f39cf drivers/gpu/drm/i915/display/intel_dp.c Jani Nikula           2024-12-13  2833  	joiner_needs_dsc = intel_dp_joiner_needs_dsc(display, num_joined_pipes);
1dedcdd0336c35 drivers/gpu/drm/i915/display/intel_dp.c Jani Nikula           2022-03-30  2834  
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak             2023-09-21  2835  	dsc_needed = joiner_needs_dsc || intel_dp->force_dsc_en ||
ba49a4643cf53c drivers/gpu/drm/i915/display/intel_dp.c Chaitanya Kumar Borah 2025-07-30  2836  		     !intel_dp_compute_config_limits(intel_dp, conn_state, pipe_config,
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak             2023-09-21  2837  						     respect_downstream_limits,
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak             2023-09-21  2838  						     false,
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak             2023-09-21  2839  						     &limits);
7d0f2f68b661e5 drivers/gpu/drm/i915/display/intel_dp.c Imre Deak             2023-09-21  2840  
7d0f2f68b661e5 drivers/gpu/drm/i915/display/intel_dp.c Imre Deak             2023-09-21  2841  	if (!dsc_needed) {
3acd115d08f706 drivers/gpu/drm/i915/intel_dp.c         Jani Nikula           2018-04-26  2842  		/*
acca7762eb71bc drivers/gpu/drm/i915/display/intel_dp.c Kai-Heng Feng         2021-04-21  2843  		 * Optimize for slow and wide for everything, because there are some
acca7762eb71bc drivers/gpu/drm/i915/display/intel_dp.c Kai-Heng Feng         2021-04-21  2844  		 * eDP 1.3 and 1.4 panels don't work well with fast and narrow.
3acd115d08f706 drivers/gpu/drm/i915/intel_dp.c         Jani Nikula           2018-04-26  2845  		 */
7d0f2f68b661e5 drivers/gpu/drm/i915/display/intel_dp.c Imre Deak             2023-09-21  2846  		ret = intel_dp_compute_link_config_wide(intel_dp, pipe_config,
7d0f2f68b661e5 drivers/gpu/drm/i915/display/intel_dp.c Imre Deak             2023-09-21  2847  							conn_state, &limits);
ef0a0757bbeac9 drivers/gpu/drm/i915/display/intel_dp.c Jani Nikula           2025-01-03  2848  		if (!ret && intel_dp_is_uhbr(pipe_config))
ef0a0757bbeac9 drivers/gpu/drm/i915/display/intel_dp.c Jani Nikula           2025-01-03  2849  			ret = intel_dp_mtp_tu_compute_config(intel_dp,
ef0a0757bbeac9 drivers/gpu/drm/i915/display/intel_dp.c Jani Nikula           2025-01-03  2850  							     pipe_config,
bb322c6fa16f97 drivers/gpu/drm/i915/display/intel_dp.c Jani Nikula           2025-01-29  2851  							     conn_state,
67782bf6e8a628 drivers/gpu/drm/i915/display/intel_dp.c Jani Nikula           2025-01-31  2852  							     fxp_q4_from_int(pipe_config->pipe_bpp),
67782bf6e8a628 drivers/gpu/drm/i915/display/intel_dp.c Jani Nikula           2025-01-31  2853  							     fxp_q4_from_int(pipe_config->pipe_bpp),
ef0a0757bbeac9 drivers/gpu/drm/i915/display/intel_dp.c Jani Nikula           2025-01-03  2854  							     0, false);
7d0f2f68b661e5 drivers/gpu/drm/i915/display/intel_dp.c Imre Deak             2023-09-21  2855  		if (ret)
7d0f2f68b661e5 drivers/gpu/drm/i915/display/intel_dp.c Imre Deak             2023-09-21  2856  			dsc_needed = true;
7d0f2f68b661e5 drivers/gpu/drm/i915/display/intel_dp.c Imre Deak             2023-09-21  2857  	}
a4a157777c807d drivers/gpu/drm/i915/intel_dp.c         Manasi Navare         2018-11-28  2858  
939bc3e4d996ba drivers/gpu/drm/i915/display/intel_dp.c Ankit Nautiyal        2025-01-03  2859  	if (dsc_needed && !intel_dp_supports_dsc(intel_dp, connector, pipe_config)) {
939bc3e4d996ba drivers/gpu/drm/i915/display/intel_dp.c Ankit Nautiyal        2025-01-03  2860  		drm_dbg_kms(display->drm, "DSC required but not available\n");
939bc3e4d996ba drivers/gpu/drm/i915/display/intel_dp.c Ankit Nautiyal        2025-01-03  2861  		return -EINVAL;
939bc3e4d996ba drivers/gpu/drm/i915/display/intel_dp.c Ankit Nautiyal        2025-01-03  2862  	}
939bc3e4d996ba drivers/gpu/drm/i915/display/intel_dp.c Ankit Nautiyal        2025-01-03  2863  
7d0f2f68b661e5 drivers/gpu/drm/i915/display/intel_dp.c Imre Deak             2023-09-21  2864  	if (dsc_needed) {
8146b9235fc2b3 drivers/gpu/drm/i915/display/intel_dp.c Jani Nikula           2024-12-13  2865  		drm_dbg_kms(display->drm,
8146b9235fc2b3 drivers/gpu/drm/i915/display/intel_dp.c Jani Nikula           2024-12-13  2866  			    "Try DSC (fallback=%s, joiner=%s, force=%s)\n",
1dedcdd0336c35 drivers/gpu/drm/i915/display/intel_dp.c Jani Nikula           2022-03-30  2867  			    str_yes_no(ret), str_yes_no(joiner_needs_dsc),
1dedcdd0336c35 drivers/gpu/drm/i915/display/intel_dp.c Jani Nikula           2022-03-30  2868  			    str_yes_no(intel_dp->force_dsc_en));
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak             2023-09-21  2869  
ba49a4643cf53c drivers/gpu/drm/i915/display/intel_dp.c Chaitanya Kumar Borah 2025-07-30  2870  		if (!intel_dp_compute_config_limits(intel_dp, conn_state, pipe_config,
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak             2023-09-21  2871  						    respect_downstream_limits,
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak             2023-09-21  2872  						    true,
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak             2023-09-21  2873  						    &limits))
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak             2023-09-21  2874  			return -EINVAL;
78015e27b7d75e drivers/gpu/drm/i915/display/intel_dp.c Imre Deak             2023-09-21  2875  
204474a6b859ff drivers/gpu/drm/i915/intel_dp.c         Lyude Paul            2019-01-15  2876  		ret = intel_dp_dsc_compute_config(intel_dp, pipe_config,
2056f0ad806272 drivers/gpu/drm/i915/display/intel_dp.c Jani Nikula           2025-01-31  2877  						  conn_state, &limits, 64);
204474a6b859ff drivers/gpu/drm/i915/intel_dp.c         Lyude Paul            2019-01-15  2878  		if (ret < 0)
204474a6b859ff drivers/gpu/drm/i915/intel_dp.c         Lyude Paul            2019-01-15  2879  			return ret;
7769db5883841b drivers/gpu/drm/i915/intel_dp.c         Jani Nikula           2018-09-05  2880  	}
3600836585e3fd drivers/gpu/drm/i915/intel_dp.c         Simona Vetter         2013-03-27  2881  
0d71b594bb8132 drivers/gpu/drm/i915/display/intel_dp.c Ankit Nautiyal        2026-01-28  2882  	max_dotclk *= num_joined_pipes;
0d71b594bb8132 drivers/gpu/drm/i915/display/intel_dp.c Ankit Nautiyal        2026-01-28  2883  
d98b5ca9b08780 drivers/gpu/drm/i915/display/intel_dp.c Ankit Nautiyal        2026-01-28  2884  	if (!intel_dp_dotclk_valid(display,
d98b5ca9b08780 drivers/gpu/drm/i915/display/intel_dp.c Ankit Nautiyal        2026-01-28  2885  				   adjusted_mode->crtc_clock,
d98b5ca9b08780 drivers/gpu/drm/i915/display/intel_dp.c Ankit Nautiyal        2026-01-28  2886  				   num_joined_pipes))
0d71b594bb8132 drivers/gpu/drm/i915/display/intel_dp.c Ankit Nautiyal        2026-01-28  2887  		return -EINVAL;
0d71b594bb8132 drivers/gpu/drm/i915/display/intel_dp.c Ankit Nautiyal        2026-01-28  2888  
8146b9235fc2b3 drivers/gpu/drm/i915/display/intel_dp.c Jani Nikula           2024-12-13  2889  	drm_dbg_kms(display->drm,
2796b7ceec95bd drivers/gpu/drm/i915/display/intel_dp.c Imre Deak             2024-08-05  2890  		    "DP lane count %d clock %d bpp input %d compressed " FXP_Q4_FMT " link rate required %d available %d\n",
a4a157777c807d drivers/gpu/drm/i915/intel_dp.c         Manasi Navare         2018-11-28  2891  		    pipe_config->lane_count, pipe_config->port_clock,
a4a157777c807d drivers/gpu/drm/i915/intel_dp.c         Manasi Navare         2018-11-28  2892  		    pipe_config->pipe_bpp,
2796b7ceec95bd drivers/gpu/drm/i915/display/intel_dp.c Imre Deak             2024-08-05  2893  		    FXP_Q4_ARGS(pipe_config->dsc.compressed_bpp_x16),
e35cce9371fe1d drivers/gpu/drm/i915/display/intel_dp.c Imre Deak             2024-02-20  2894  		    intel_dp_config_required_rate(pipe_config),
a4ea61b7482f56 drivers/gpu/drm/i915/display/intel_dp.c Imre Deak             2024-02-20  2895  		    intel_dp_max_link_data_rate(intel_dp,
a4ea61b7482f56 drivers/gpu/drm/i915/display/intel_dp.c Imre Deak             2024-02-20  2896  						pipe_config->port_clock,
a4a157777c807d drivers/gpu/drm/i915/intel_dp.c         Manasi Navare         2018-11-28  2897  						pipe_config->lane_count));
3acd115d08f706 drivers/gpu/drm/i915/intel_dp.c         Jani Nikula           2018-04-26  2898  
204474a6b859ff drivers/gpu/drm/i915/intel_dp.c         Lyude Paul            2019-01-15  2899  	return 0;
981a63eb2725ec drivers/gpu/drm/i915/intel_dp.c         Jani Nikula           2018-04-26  2900  }
981a63eb2725ec drivers/gpu/drm/i915/intel_dp.c         Jani Nikula           2018-04-26  2901  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
