Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E37F12D744;
	Fri,  2 Feb 2024 23:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706918325; cv=none; b=oP5vyACNfVsdFAyafkavQztvXX9PFvJmUrJq6PmgyryV/sZW2klKOwIwQiYMCrtAQcYcgybG4ovlJpw4uK6ofWxtQBc3OKeXm3yBoG1PjxR7d7z63UAdTrCYH50CEIzaicFMAtwaOinXjNKwN6mLNcw99nwDSEPznvG3lZJwJOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706918325; c=relaxed/simple;
	bh=MVRIQWNEhJ6IvF2kCPeZP4p5KUrthvTq7J4fcJBUdHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EbbBAO9zpMH6zzrWTdTfTLT7hBI0B7yfL7xGJv4vkTSd2CCnRjpCSVyHvDQTxxFLcsMf/nOyZM6FJUJ8xjHbAWPHCA/wReEo1OXLR6JzbrtJbN4AoQxvrtJ3FjenqXzn3d7UEh/mngZmSXqi1bnsjdMszKYGGkBz+MjRzotYtdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dR5QtlrS; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dR5QtlrS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706918324; x=1738454324;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MVRIQWNEhJ6IvF2kCPeZP4p5KUrthvTq7J4fcJBUdHI=;
  b=dR5QtlrSm2eG07JVDeA5uz8qkUgn4CCusNsizC/171rKoi7ZI3L6Vina
   3wnfBcXAdcFN1l29Z4oAvVRq1BVJm/nx4z0o8PepJoWPr42l9jQUUPcD/
   OKOHx/O0+yR/6HYpVJOV5pev6w7H4feyiN1OPvevyxysFDZ+nnZ3QnwMi
   hUmNn9uKunl7tSZtRMDvD6RrCZmuK5biGt3XPfOHL3A0cwJmcRS7Flkfe
   c4OLWKkqjz9seDdwh8CVAEo0EAx6qlw5LNqHaFXO/pN72BQ18CW9hiPrE
   L7VNQhsiIIrDMNebu/q07sZz9PKDSuM3mjG9vBBUf++L93WP4x/2QitYR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="172882"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="172882"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 15:58:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="932625978"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="932625978"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 02 Feb 2024 15:58:38 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rW3QZ-0004Q0-2Z;
	Fri, 02 Feb 2024 23:58:35 +0000
Date: Sat, 3 Feb 2024 07:58:35 +0800
From: kernel test robot <lkp@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
	intel-gfx@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [PATCH v3 12/16] drm/i915: Simplify intel_initial_plane_config()
 calling convention
Message-ID: <202402030704.nGzOFDCt-lkp@intel.com>
References: <20240116075636.6121-13-ville.syrjala@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240116075636.6121-13-ville.syrjala@linux.intel.com>

Hi Ville,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-intel/for-linux-next]
[also build test ERROR on drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.8-rc2 next-20240202]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ville-Syrjala/drm-i915-Use-struct-resource-for-memory-region-IO-as-well/20240125-222947
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20240116075636.6121-13-ville.syrjala%40linux.intel.com
patch subject: [PATCH v3 12/16] drm/i915: Simplify intel_initial_plane_config() calling convention
config: x86_64-randconfig-076-20240202 (https://download.01.org/0day-ci/archive/20240203/202402030704.nGzOFDCt-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240203/202402030704.nGzOFDCt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402030704.nGzOFDCt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/xe/display/xe_plane_initial.c:270:6: error: no previous prototype for function 'intel_crtc_initial_plane_config' [-Werror,-Wmissing-prototypes]
     270 | void intel_crtc_initial_plane_config(struct intel_crtc *crtc)
         |      ^
   drivers/gpu/drm/xe/display/xe_plane_initial.c:270:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     270 | void intel_crtc_initial_plane_config(struct intel_crtc *crtc)
         | ^
         | static 
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_I915_DEBUG_GEM
   Depends on [n]: HAS_IOMEM [=y] && DRM_I915 [=m] && EXPERT [=y] && DRM_I915_WERROR [=n]
   Selected by [m]:
   - DRM_I915_DEBUG [=y] && HAS_IOMEM [=y] && DRM_I915 [=m] && EXPERT [=y] && !COMPILE_TEST [=n]


vim +/intel_crtc_initial_plane_config +270 drivers/gpu/drm/xe/display/xe_plane_initial.c

44e694958b9539 Maarten Lankhorst 2023-08-17  269  
44e694958b9539 Maarten Lankhorst 2023-08-17 @270  void intel_crtc_initial_plane_config(struct intel_crtc *crtc)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
