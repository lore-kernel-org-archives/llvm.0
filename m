Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2C2433BC;
	Tue,  3 Sep 2024 03:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725333341; cv=none; b=iDxEir+TB24kAVZSYrXTGAnWwr3+RcLj1LnEB0hXqP01QQNJMovuNYpXmIB/GI7CkZPwzjQuDCF6wWmowBkay63KWSNjCTbTUFFUX5DOMEcRS2lJy3xZMumvcd/geMYZM88qCAkf5oQPHp2sAKX03Y3aREMb9TWthXXP3VAV9vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725333341; c=relaxed/simple;
	bh=ARVgzjc77gwC4k0HXCvC8mOKt71sAJB8KzGegu4qRJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fXFIwTAOnJZavam1jKuH00my3e34I87F1GlaWszH6KbNCOX7isyZXumCepEZJzEFgh+J4BxjA3+zjEhep7a93xoo/m66FqbKZ04jOtVEDT9nUPqeOS9zgzcGdIyD7hxTZRLqmA3o9V+I5lpKpSSPJQUtVuEUuxvNoQ4ihPv7pHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mk08CFVA; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mk08CFVA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725333340; x=1756869340;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ARVgzjc77gwC4k0HXCvC8mOKt71sAJB8KzGegu4qRJk=;
  b=Mk08CFVAdq7PFNZS93q36v0DFHV4Di4gkQfa5uoPOX6yPU1l7rl3ztVc
   uB3Xy0BvNfEnGNUP1SNGtECax9kPuw73aIog3qR989m4Jhe8hcFBbFEpI
   aaR/P1+P4syDmsh2onUeBVMrqvVgFPKgatYxCkrNPkBJJLnpAn1Fw1EDi
   wM1etzBv1PvbGqwxTlu+3k5K4scmpwiCFiJCGlGoewD02Zbz8qL7krFUo
   XLiepfuw8aWckQExA+CR+H3DRXXcAdVEncCmCsVq0yqkckwzOIvufChDp
   mALWvb+9BZFBqkp3UYqVKhNuzBAHnE2Xwr4oMEPFg23wEbqDSkSqWkmuH
   w==;
X-CSE-ConnectionGUID: A3osA54WRMOoKOT491ZSwA==
X-CSE-MsgGUID: FqlgEPzuR0WFv3YmSj+9sg==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="27664109"
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; 
   d="scan'208";a="27664109"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 20:15:38 -0700
X-CSE-ConnectionGUID: TAo27OybTx2qFDf1mBgO9A==
X-CSE-MsgGUID: vTjRbZ1jTACniPdDgXUDTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; 
   d="scan'208";a="64797274"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 02 Sep 2024 20:15:34 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slK0x-000694-34;
	Tue, 03 Sep 2024 03:15:31 +0000
Date: Tue, 3 Sep 2024 11:15:02 +0800
From: kernel test robot <lkp@intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
	intel-gfx@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	jani.nikula@linux.intel.com, ville.syrjala@linux.intel.com,
	mitulkumar.ajitkumar.golani@intel.com
Subject: Re: [PATCH 04/13] drm/i915/display: Enable MSA Ignore Timing PAR
 only when in not fixed_rr mode
Message-ID: <202409031027.GftRdwjU-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-tip/drm-tip next-20240902]
[cannot apply to drm-intel/for-linux-next-fixes linus/master v6.11-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ankit-Nautiyal/drm-i915-dp-Avoid-vrr-compute-config-for-HDMI-sink/20240902-205135
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20240902080635.2946858-5-ankit.k.nautiyal%40intel.com
patch subject: [PATCH 04/13] drm/i915/display: Enable MSA Ignore Timing PAR only when in not fixed_rr mode
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240903/202409031027.GftRdwjU-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240903/202409031027.GftRdwjU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409031027.GftRdwjU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_dp_link_training.c:724:6: warning: variable 'enable_msa_timing_par_ignore' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     724 |         if (crtc_state->vrr.enable && !crtc_state->vrr.fixed_rr)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_dp_link_training.c:728:30: note: uninitialized use occurs here
     728 |                                         crtc_state->port_clock, enable_msa_timing_par_ignore);
         |                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_dp_link_training.c:724:2: note: remove the 'if' if its condition is always true
     724 |         if (crtc_state->vrr.enable && !crtc_state->vrr.fixed_rr)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     725 |                 enable_msa_timing_par_ignore = true;
>> drivers/gpu/drm/i915/display/intel_dp_link_training.c:724:6: warning: variable 'enable_msa_timing_par_ignore' is used uninitialized whenever '&&' condition is false [-Wsometimes-uninitialized]
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
   2 warnings generated.


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
