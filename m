Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D26EF9DA;
	Fri, 16 Feb 2024 02:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708051693; cv=none; b=pW4O05ROdwn8HmKhSaMfzbi28jMGXc1O7fEOD8lNSpcfzS5WsPipwA2fVcnmzzyBXgZKQ0CbEp+G5j3VXrhyx21X7uTaKORhzkSu6GVBz2PHZ1UStmImC5ut8Qx34RfJbS3O8RH0QBb7+g26Ucl3IR5BwacEeykJPt/l2EosXN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708051693; c=relaxed/simple;
	bh=T+ZVcoirSKhJXq34TdBvn4l9qfLS2vOsjl6j/LpO8/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r4eM8ul+bOe7/p5ovDIjcdO+/3msi0Ulmid4FP2ovqDcKRaCi+vJJDgCdWFA85c/J5NbC+fsJKO2GL0Q6mUJiRmH914xx2kZKFgBRjMKm8W1tyMSd0eFe4zrD+cXY//OspmcCSZj+trPSnz5Wif5rrKP7tN/cfgv0B1wcufA1JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nnbIRVmw; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nnbIRVmw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708051691; x=1739587691;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T+ZVcoirSKhJXq34TdBvn4l9qfLS2vOsjl6j/LpO8/w=;
  b=nnbIRVmwFNkT0HCYsGK4uh+Q7fi3fJVoFslEEsO6uPUGAU9MeyfR+aSO
   4kVzEVeRTqin3fK9Ep0s4L9iHPuAQxf/pLRxECh7tOaLnSswuDWT9WeNX
   lD0MangbQTBB9SdJ8HE+g3pHM3GuRAENp8VbIs9Q0uOoQnZT3JEgHIfr7
   rOCcJf6nOd6oLi9YEvCqHJaQShDUWdAw3LA/nCHi+kbZEJWMyJgBDEAEa
   9ZSUO7tF4umMK71ofop0GlRlX6KvhlXhKVSMfjBDhVLNQ9pK/srjlrXXO
   I0wwRcwWisCt3gaaODDxPxh7rd/gBur/KIYNHBzns7OcBHpCLns3cypPs
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="24638395"
X-IronPort-AV: E=Sophos;i="6.06,163,1705392000"; 
   d="scan'208";a="24638395"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2024 18:48:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,163,1705392000"; 
   d="scan'208";a="4015120"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 15 Feb 2024 18:48:09 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1raoGi-0000xM-2q;
	Fri, 16 Feb 2024 02:48:05 +0000
Date: Fri, 16 Feb 2024 10:47:55 +0800
From: kernel test robot <lkp@intel.com>
To: Jouni =?iso-8859-1?Q?H=F6gander?= <jouni.hogander@intel.com>,
	intel-gfx@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jouni =?iso-8859-1?Q?H=F6gander?= <jouni.hogander@intel.com>
Subject: Re: [PATCH 4/6] drm/i915/psr: Silence period and lfps half cycle
Message-ID: <202402161056.O7eY8Uvv-lkp@intel.com>
References: <20240215104934.2395239-5-jouni.hogander@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240215104934.2395239-5-jouni.hogander@intel.com>

Hi Jouni,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-tip/drm-tip next-20240215]
[cannot apply to drm-intel/for-linux-next-fixes drm/drm-next linus/master v6.8-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jouni-H-gander/drm-display-Add-missing-aux-less-alpm-wake-related-bits/20240215-185209
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20240215104934.2395239-5-jouni.hogander%40intel.com
patch subject: [PATCH 4/6] drm/i915/psr: Silence period and lfps half cycle
config: i386-buildonly-randconfig-004-20240215 (https://download.01.org/0day-ci/archive/20240216/202402161056.O7eY8Uvv-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240216/202402161056.O7eY8Uvv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402161056.O7eY8Uvv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_psr.c:1253:6: warning: variable 'silence_period' is uninitialized when used here [-Wuninitialized]
    1253 |             silence_period > 256 || silence_period < 0 ||
         |             ^~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_psr.c:1240:17: note: initialize the variable 'silence_period' to silence this warning
    1240 |                 silence_period, lfps_half_cycle;
         |                               ^
         |                                = 0
   1 warning generated.


vim +/silence_period +1253 drivers/gpu/drm/i915/display/intel_psr.c

  1234	
  1235	static int _lnl_compute_aux_less_alpm_params(struct intel_dp *intel_dp,
  1236						     struct intel_crtc_state *crtc_state)
  1237	{
  1238		struct drm_i915_private *i915 = dp_to_i915(intel_dp);
  1239		int aux_less_wake_time, aux_less_wake_lines, switch_to_active_lines,
  1240			silence_period, lfps_half_cycle;
  1241	
  1242		aux_less_wake_time =
  1243			_lnl_compute_aux_less_wake_time(crtc_state->port_clock / 1000);
  1244		aux_less_wake_lines = intel_usecs_to_scanlines(&crtc_state->hw.adjusted_mode,
  1245							       aux_less_wake_time);
  1246	
  1247		switch_to_active_lines =
  1248			intel_usecs_to_scanlines(
  1249				&crtc_state->hw.adjusted_mode,
  1250				_lnl_compute_switch_to_active_time(crtc_state->port_clock / 1000));
  1251	
  1252		if (aux_less_wake_lines > 32 || switch_to_active_lines > 32 ||
> 1253		    silence_period > 256 || silence_period < 0 ||
  1254		    !_lnl_get_silence_period_and_lfps_half_cycle(intel_dp->link_rate,
  1255								 &silence_period,
  1256								 &lfps_half_cycle))
  1257			return false;
  1258	
  1259		if (i915->display.params.psr_safest_params) {
  1260			aux_less_wake_lines = 32;
  1261			switch_to_active_lines = 32;
  1262		}
  1263	
  1264		intel_dp->psr.alpm_parameters.aux_less_wake_lines = aux_less_wake_lines;
  1265		intel_dp->psr.alpm_parameters.switch_to_active_lines = switch_to_active_lines;
  1266		intel_dp->psr.alpm_parameters.silence_period_sym_clocks = silence_period;
  1267		intel_dp->psr.alpm_parameters.lfps_half_cycle_num_of_syms = lfps_half_cycle;
  1268	
  1269		return true;
  1270	}
  1271	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
