Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA763002AB;
	Sat, 26 Sep 2026 06:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790402577; cv=none; b=j6j/8ihVfyZEr25N85KCyeAS8j8uWYqITAzm1zqTDCW3Qd4tUaanhmD9EA9AcEU+HYexHBXLPSou/dewW5R3BDG9t/LV9lMXUcuM+8eIbrH/JV2AVoEUYprvk9gKsOmxvlGOrk0p2y759OSDyL/i8VxD0t7vZtD0HnkuQBQJ/84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790402577; c=relaxed/simple;
	bh=k+mYgrxuJ6njYZR/YmdsqCA+vq/QLRbW9eZTubZeEfA=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Let4m5Bts3QV534sIURlHySEb5SBBoosdgO/q3gjp/1BG8Aciz7DJWV2ZR9sWrOl4gQm8NQMqwGwICuJC2NxKeksxLJlmRasyi7tMBUg5zR3p4jhUCYDpITzkmz1/7ExVp1vy4kLnNQNVwWFO78DWlWaHzX3UGbnCk68d3/tBew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FxtBIgr7; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FxtBIgr7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790402575; x=1821938575;
  h=date:from:cc:subject:message-id:references:mime-version:
   in-reply-to;
  bh=k+mYgrxuJ6njYZR/YmdsqCA+vq/QLRbW9eZTubZeEfA=;
  b=FxtBIgr7a85RxPNgz/Cq0VfKdkg/aMpp43kq1Qf6cKTShs7m+lg8PIpy
   8jBEUc4tQzmuf8SZ55ftR5fHMfkcS2QUagK173W5+oxwxNZ4Gex+m9rPV
   aF+3tHCBAvuY5TfCT1Gee8gyY+tknxYlwhAVu6FCjcNE8lq1yQhb/uAhe
   rUxE3MFzzcqmu2yryVGaPcO8meKbEHFB63cC9rG7MqZql0hyZyE/DMkVP
   ywXNsyDLBH4ZNqe8xZeumu7RN2Kgpfb7W+Lj5ZU5XSUOgEJB+HE6QEBgy
   IE4viKLXpW26/RpA4WTyWaed9dY1I6mWhBlouzlHh1KI2XT61lNh0FLou
   A==;
X-CSE-ConnectionGUID: YWEyyV+FRq6YdU3KOxuvfQ==
X-CSE-MsgGUID: D4G/YCsfQ52JO8CyHSHTmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="90242621"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="90242621"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 23:02:51 -0700
X-CSE-ConnectionGUID: wD2DRJQhRJefPsuxTd0yGg==
X-CSE-MsgGUID: eHM7KaF+RJyQHGIVYddpjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="300779094"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 Sep 2026 23:02:50 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xALUm-00000000LZN-1Zxj;
	Sat, 26 Sep 2026 06:02:48 +0000
Date: Sat, 26 Sep 2026 14:02:33 +0800
From: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re:
Message-ID: <202609261355.8IxZvLnO-lkp@intel.com>
References: <202609261355.8IxZvLnO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202609261355.8IxZvLnO-lkp@intel.com>

Hi Xizhe,

kernel test robot noticed the following build errors:



url:    https://github.com/intel-lab-lkp/linux/commits/Xizhe-Tang/drm-i915-dp-Only-send-AS-SDP-when-VRR-CMRR-is-enabled-or-PR-async/20260924-035159
base:   
patch link:    https://lore.kernel.org/r/202609261355.8IxZvLnO-lkp%40intel.com
config: x86_64-randconfig-1014-20260926 (https://download.01.org/0day-ci/archive/20260926/202609261355.8IxZvLnO-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260926/202609261355.8IxZvLnO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609261355.8IxZvLnO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_dp.c:3117:21: error: no member named 'cmrr' in 'struct intel_crtc_state'
    3117 |                crtc_state->cmrr.enable;
         |                ~~~~~~~~~~  ^
   1 error generated.


vim +3117 drivers/gpu/drm/i915/display/intel_dp.c

  3099	
  3100	static bool intel_dp_needs_as_sdp(struct intel_dp *intel_dp,
  3101					  struct intel_crtc_state *crtc_state)
  3102	{
  3103		if (!intel_dp->as_sdp_v2_supported)
  3104			return false;
  3105	
  3106		/*
  3107		 * #TODO: Add AS SDP v1 support for PCONs (DP branch devices).
  3108		 */
  3109		if (drm_dp_is_branch(intel_dp->dpcd))
  3110			return false;
  3111	
  3112		if (intel_psr_needs_alpm_aux_less(intel_dp, crtc_state) &&
  3113		    !intel_psr_pr_async_video_timing_supported(intel_dp))
  3114			return true;
  3115	
  3116		return crtc_state->vrr.enable ||
> 3117		       crtc_state->cmrr.enable;
  3118	}
  3119	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
