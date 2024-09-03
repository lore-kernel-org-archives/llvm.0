Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A8C1865F0;
	Tue,  3 Sep 2024 07:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725349972; cv=none; b=keZ1aEFQ5nQo1XkH2hK0MY+Pf6jcSMBJAh03rMo+KHLKmbQ7wqvkOsbkQ2F0/LKDKOhC1SkL0wfjHv9QpKLpJnnnO1HXLdL72kLjo779dY5xC7qX7JR0jMv5jk84bI6dW46E6umva2rmIJyjLUekfIMxUER6O0vakwGMkKzVfKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725349972; c=relaxed/simple;
	bh=t9N/jlwW/ok+MM/Mta0kNwYGTnj3VNDdb++trM9lic0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rx10hRcojC2jptwgPUxA6d+70APtbAPe0pisGSemeO2klZig/ZKUu1B2Rl/esp9wZhKwi60itVsHug1qT4EWWUvkmVp4moEo8GI0lq5qTsj1gJyQHjwoaV3PSuA21ctbkuXS/iLBvKGpbjfLNIjIVcmrEPjDrKdu72nJP2esAMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fy9DN6K+; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fy9DN6K+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725349971; x=1756885971;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=t9N/jlwW/ok+MM/Mta0kNwYGTnj3VNDdb++trM9lic0=;
  b=Fy9DN6K+hc/EfeEQF7h8ZWWA/n5scTChsFCeAyBS//Xk7KmUMZR4D1BG
   PRHKdnlnGvhdQ74OGQAgf+DFAZpHute7NrXptNxlSTSc9UjP6j58qmyMb
   E2f7ahPX2ok0xuVYs9FXmQv6OLguVIEkOPqaZPD1tv1N/bTR0RZ5aFLlN
   P5EUBLI5lLPMJMZCfy33PNVD6AyT/euwWoLDzhdeRMEyRVM8gSUj9uOmT
   JmA/fU5Ak/Z1j2O3wxx6azO8RgwqdIGy6x6iaG30/m9iHVpgDIcL0kC24
   hr5GjJes3EYGxxXUTctg8HHoKbX+Hvx7HquaK9/yVkSmIyvNsE7A/7qKI
   A==;
X-CSE-ConnectionGUID: Fsk8U/YdR1CFZRdHs0sf/g==
X-CSE-MsgGUID: oi3KmmR9SzOEfeGe4q6hzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="24085479"
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; 
   d="scan'208";a="24085479"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 00:52:50 -0700
X-CSE-ConnectionGUID: KgR/VfDuQTGrHzuBecpYnw==
X-CSE-MsgGUID: zll42YBsR3uoQUQ4fNhZOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; 
   d="scan'208";a="65017340"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 03 Sep 2024 00:52:47 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slOLF-0006NK-2l;
	Tue, 03 Sep 2024 07:52:45 +0000
Date: Tue, 3 Sep 2024 15:52:22 +0800
From: kernel test robot <lkp@intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
	intel-gfx@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	jani.nikula@linux.intel.com, ville.syrjala@linux.intel.com,
	mitulkumar.ajitkumar.golani@intel.com
Subject: Re: [PATCH 04/13] drm/i915/display: Enable MSA Ignore Timing PAR
 only when in not fixed_rr mode
Message-ID: <202409031530.5OEhhqKb-lkp@intel.com>
References: <20240902080635.2946858-5-ankit.k.nautiyal@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902080635.2946858-5-ankit.k.nautiyal@intel.com>

Hi Ankit,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-intel/for-linux-next]
[also build test ERROR on drm-tip/drm-tip next-20240902]
[cannot apply to drm-intel/for-linux-next-fixes linus/master v6.11-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ankit-Nautiyal/drm-i915-dp-Avoid-vrr-compute-config-for-HDMI-sink/20240902-205135
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20240902080635.2946858-5-ankit.k.nautiyal%40intel.com
patch subject: [PATCH 04/13] drm/i915/display: Enable MSA Ignore Timing PAR only when in not fixed_rr mode
config: x86_64-randconfig-071-20240903 (https://download.01.org/0day-ci/archive/20240903/202409031530.5OEhhqKb-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240903/202409031530.5OEhhqKb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409031530.5OEhhqKb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_dp_link_training.c:724:6: error: variable 'enable_msa_timing_par_ignore' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
     724 |         if (crtc_state->vrr.enable && !crtc_state->vrr.fixed_rr)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_dp_link_training.c:728:30: note: uninitialized use occurs here
     728 |                                         crtc_state->port_clock, enable_msa_timing_par_ignore);
         |                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_dp_link_training.c:724:2: note: remove the 'if' if its condition is always true
     724 |         if (crtc_state->vrr.enable && !crtc_state->vrr.fixed_rr)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     725 |                 enable_msa_timing_par_ignore = true;
>> drivers/gpu/drm/i915/display/intel_dp_link_training.c:724:6: error: variable 'enable_msa_timing_par_ignore' is used uninitialized whenever '&&' condition is false [-Werror,-Wsometimes-uninitialized]
     724 |         if (crtc_state->vrr.enable && !crtc_state->vrr.fixed_rr)
         |             ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_dp_link_training.c:728:30: note: uninitialized use occurs here
     728 |                                         crtc_state->port_clock, enable_msa_timing_par_ignore);
         |                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_dp_link_training.c:724:6: note: remove the '&&' if its condition is always true
     724 |         if (crtc_state->vrr.enable && !crtc_state->vrr.fixed_rr)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_dp_link_training.c:721:35: note: initialize the variable 'enable_msa_timing_par_ignore' to silence this warning
     721 |         bool enable_msa_timing_par_ignore;
         |                                          ^
         |                                           = 0
   2 errors generated.


vim +724 drivers/gpu/drm/i915/display/intel_dp_link_training.c

   717	
   718	static void intel_dp_update_downspread_ctrl(struct intel_dp *intel_dp,
   719						    const struct intel_crtc_state *crtc_state)
   720	{
   721		bool enable_msa_timing_par_ignore;
   722	
   723		/* Enable MSA TIMING PAR IGNORE only in non fixed_rr mode */
 > 724		if (crtc_state->vrr.enable && !crtc_state->vrr.fixed_rr)
   725			enable_msa_timing_par_ignore = true;
   726	
   727		intel_dp_link_training_set_mode(intel_dp,
   728						crtc_state->port_clock, enable_msa_timing_par_ignore);
   729	}
   730	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
