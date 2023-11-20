Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08AB21FC8;
	Mon, 20 Nov 2023 03:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PyQjCPxB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700451658; x=1731987658;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IlPqiDrz3tKuyD7L4wQ6R/Nl5fvYg+pnDt+lTYjtfrU=;
  b=PyQjCPxBDkv9fMLDCGsl4ODRiRuLTz3hQVG02ZdFOeD8vg/0O2JIF6eq
   nQGnJatD9A5DD2KflkcC+mGkken8pHcZpH4QMvyFv7Ficq8O347gC+EWX
   th3RYHnos4Cr8IhBMuz3MvZmcWVnLbtvgGeVyqoDzNEDsR8jf84Cc+tMf
   zTVW9gdJAcIkVoZmoT+eQ+2stG/2m9EqR6UaW98S+YTLvGYI0HuYMH1gH
   pkucc5REZL0vdah8CQuDR7m5pWcPQjH4Ex1C3GhnRgTTDo5grc/s4MBfe
   R1u9rDfMNfN5pV9ihwP5rsMXY8N0pRPG7YmvtTAuvsqb+xyislunCo1K0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="370887641"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="370887641"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 19:40:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="7427393"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 19 Nov 2023 19:40:56 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4v9Y-0005uZ-2Z;
	Mon, 20 Nov 2023 03:40:52 +0000
Date: Mon, 20 Nov 2023 11:40:17 +0800
From: kernel test robot <lkp@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Subject: [drm-intel:for-linux-next-gt 1/6]
 drivers/gpu/drm/i915/i915_drm_client.h:81:1: warning: non-void function does
 not return a value
Message-ID: <202311201118.Jmt74ras-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm-intel for-linux-next-gt
head:   3c7a5eb700661e8905ab4e50c2d09c6568125280
commit: e4ae85e364fc652ea15d85b0f3a6da304c9b5ce7 [1/6] drm/i915: Add ability for tracking buffer objects per client
config: i386-buildonly-randconfig-006-20231120 (https://download.01.org/0day-ci/archive/20231120/202311201118.Jmt74ras-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231120/202311201118.Jmt74ras-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311201118.Jmt74ras-lkp@intel.com/

All warnings (new ones prefixed by >>):

   warning: unknown warning option '-Wrestrict' [-Wunknown-warning-option]
   warning: unknown warning option '-Wpacked-not-aligned'; did you mean '-Wpacked-non-pod'? [-Wunknown-warning-option]
   warning: unknown warning option '-Wformat-overflow'; did you mean '-Wshift-overflow'? [-Wunknown-warning-option]
   warning: unknown warning option '-Wformat-truncation' [-Wunknown-warning-option]
   warning: unknown warning option '-Wstringop-overflow'; did you mean '-Wshift-overflow'? [-Wunknown-warning-option]
   warning: unknown warning option '-Wstringop-truncation'; did you mean '-Wstring-concatenation'? [-Wunknown-warning-option]
   In file included from drivers/gpu/drm/i915/i915_debugfs_params.c:11:
   In file included from drivers/gpu/drm/i915/i915_drv.h:54:
>> drivers/gpu/drm/i915/i915_drm_client.h:81:1: warning: non-void function does not return a value [-Wreturn-type]
   }
   ^
   7 warnings generated.


vim +81 drivers/gpu/drm/i915/i915_drm_client.h

    78	
    79	static inline bool i915_drm_client_remove_object(struct drm_i915_gem_object *obj)
    80	{
  > 81	}
    82	#endif
    83	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
