Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979A210F4;
	Sat, 11 May 2024 00:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715388402; cv=none; b=qowe23AE4y3XcWCH5ebk4O32xPdbV5RHYo33M9iZjQkUSazWagLGMOZthGz34JqEHODDMKuEQJ/+n5sBBTxLyVIy4PAmIVZSi3T2r9FEiqz24MibXRd1J3jrufVWPtAVoUedNHann0ht/nk9851KTuCjIPA8cja+DICQ/Zp5X3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715388402; c=relaxed/simple;
	bh=u1zRObv83MG4t5lkib9kDVrQ6dUbWjXdhDPS1LJXm9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cd/kv26fmaST5yBLiRsF3GtIv24pJCP4WrHNWbgtAEW9EnDfPLz4ABjkxRSecGdxiZRvn0RfG7QaNlvh2uaOIPDFtliblKr6N/CB29Pj/eCa9dQHpPqDYwFlCuGdyGIxPBnY6l+ak2bOMFDoyY2dJwBd+CKdLf06PPdleRm4TuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fl907q28; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fl907q28"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715388401; x=1746924401;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u1zRObv83MG4t5lkib9kDVrQ6dUbWjXdhDPS1LJXm9Y=;
  b=fl907q28G1gUMDhL5MGAM75mJbscG9k5XcVn+m9fIZFrWuca+wyCmz++
   POdkWJyYPE17mpuSV35PSwhvbVkzgXCReIUU3Sv1dqLZpBh5rSiV+BWoH
   AGVG8aW8Rs9nSRzBtTYVTl4ZRX07tNzK06Qje3lX3N3TTSPfezp5j8pY/
   LsXBxdYxDWf8HoICLnuCUybw2c5g9WJDO/ubQ5zNRXwl+T+TMx4B+B+tX
   ltIJlwpyrjGECtnErsAJD6Wwhz98rwHWrPa0nGg2PZdI8YdklF5eReJ+F
   WfnSYaonb4tdKQ3D6whRCmen/psLmIrXpFhFMQ+d/yOGIyDZ3V1OQ9gFO
   w==;
X-CSE-ConnectionGUID: Rk4rv3QaQP+hefKyR2Z06A==
X-CSE-MsgGUID: h2Op6pa/Q8aAXETZSpW6zw==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="11227619"
X-IronPort-AV: E=Sophos;i="6.08,152,1712646000"; 
   d="scan'208";a="11227619"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 17:46:40 -0700
X-CSE-ConnectionGUID: qznoM9lGQ2u6gCfMf9dgXg==
X-CSE-MsgGUID: iIBZXyM4QySzRb31HuPNsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,152,1712646000"; 
   d="scan'208";a="34454540"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 May 2024 17:46:39 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5asm-0006kF-1W;
	Sat, 11 May 2024 00:46:36 +0000
Date: Sat, 11 May 2024 08:46:31 +0800
From: kernel test robot <lkp@intel.com>
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v8 3/7] drm/i915: Compute CMRR and calculate vtotal
Message-ID: <202405110834.fRP3Ivmx-lkp@intel.com>
References: <20240509075833.1858363-4-mitulkumar.ajitkumar.golani@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240509075833.1858363-4-mitulkumar.ajitkumar.golani@intel.com>

Hi Mitul,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-intel/for-linux-next]
[also build test ERROR on next-20240510]
[cannot apply to drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.9-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mitul-Golani/drm-i915-Define-and-compute-Transcoder-CMRR-registers/20240509-160819
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20240509075833.1858363-4-mitulkumar.ajitkumar.golani%40intel.com
patch subject: [PATCH v8 3/7] drm/i915: Compute CMRR and calculate vtotal
config: arm-randconfig-001-20240511 (https://download.01.org/0day-ci/archive/20240511/202405110834.fRP3Ivmx-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project b910bebc300dafb30569cecc3017b446ea8eafa0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240511/202405110834.fRP3Ivmx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405110834.fRP3Ivmx-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/display/intel_vrr.c:7:
   In file included from drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h:15:
   In file included from drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h:11:
   In file included from drivers/gpu/drm/xe/xe_bo.h:9:
   In file included from include/drm/ttm/ttm_tt.h:30:
   In file included from include/linux/pagemap.h:8:
   In file included from include/linux/mm.h:2210:
   include/linux/vmstat.h:522:36: error: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Werror,-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/gpu/drm/i915/display/intel_vrr.c:160:28: error: comparison of distinct pointer types ('typeof ((adjusted_pixel_rate)) *' (aka 'long long *') and 'uint64_t *' (aka 'unsigned long long *')) [-Werror,-Wcompare-distinct-pointer-types]
     160 |         crtc_state->cmrr.cmrr_m = do_div(adjusted_pixel_rate, crtc_state->cmrr.cmrr_n);
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:222:28: note: expanded from macro 'do_div'
     222 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                ~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~
   2 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for FB_IOMEM_HELPERS
   Depends on [n]: HAS_IOMEM [=y] && FB_CORE [=n]
   Selected by [m]:
   - DRM_XE_DISPLAY [=y] && HAS_IOMEM [=y] && DRM_XE [=m] && DRM_XE [=m]=m


vim +160 drivers/gpu/drm/i915/display/intel_vrr.c

   134	
   135	static unsigned int
   136	cmrr_get_vtotal(struct intel_crtc_state *crtc_state)
   137	{
   138		int multiplier_m = 1, multiplier_n = 1, vtotal;
   139		int actual_refresh_rate, desired_refresh_rate;
   140		long long actual_pixel_rate, adjusted_pixel_rate, pixel_clock_per_line;
   141		struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
   142	
   143		pixel_clock_per_line =
   144			adjusted_mode->crtc_clock * 1000 / adjusted_mode->crtc_htotal;
   145		actual_refresh_rate =
   146			pixel_clock_per_line * FIXED_POINT_PRECISION / adjusted_mode->crtc_vtotal;
   147		desired_refresh_rate = drm_mode_vrefresh(adjusted_mode);
   148		actual_pixel_rate = actual_refresh_rate * adjusted_mode->crtc_vtotal;
   149		actual_pixel_rate =
   150			(actual_pixel_rate * adjusted_mode->crtc_htotal) / FIXED_POINT_PRECISION;
   151	
   152		multiplier_m = 1001;
   153		multiplier_n = 1000;
   154	
   155		crtc_state->cmrr.cmrr_n =
   156			((desired_refresh_rate * adjusted_mode->crtc_htotal * multiplier_n) / multiplier_m);
   157		crtc_state->cmrr.cmrr_n *= multiplier_n;
   158		vtotal = (actual_pixel_rate * multiplier_n) / crtc_state->cmrr.cmrr_n;
   159		adjusted_pixel_rate = actual_pixel_rate * multiplier_m;
 > 160		crtc_state->cmrr.cmrr_m = do_div(adjusted_pixel_rate, crtc_state->cmrr.cmrr_n);
   161	
   162		return vtotal;
   163	}
   164	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
