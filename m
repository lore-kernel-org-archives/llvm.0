Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0971A217F3F;
	Sat, 26 Oct 2024 10:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729937464; cv=none; b=DqODFr05rts0/RkZuTT0ezWi8aR0OqUCZqxPSLWKR3Id3LQjB2DlrfaM2ygOkqAKEm/VWFIjZKsIDjJXo/0TyZDxg8q3fVJyn9cniHzi8kPfdWK6YZQMEFwaU6osR4U5F1rqEbuZzI2BMtAfVsO26nVx1Vxy7yzYDY4YK5fC9Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729937464; c=relaxed/simple;
	bh=8DU14E5D0lWg600MwJ4URtFuPIv26XFVrn6CO/yON44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bAyX/3T7BdrWWwOIpBYyLcQy+h0nQTfkqGCjYnICRp0nV2lKTMmKo8C3ZMzUMV6xykAaY956Nv03IeR1pSBrvFK/jfAF2uX4HC6bSgn/WuLYJqgbzqdZDGwoCrQSBAyvGnq1vFWlKwz9pwAMC++1NWuYX2bI1JJp8etg4lXn2bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cglk0D4Y; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cglk0D4Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729937463; x=1761473463;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8DU14E5D0lWg600MwJ4URtFuPIv26XFVrn6CO/yON44=;
  b=Cglk0D4YFaDrFLiLRKfkDl+9gcOl7EyVR3sM5FeHjppMTgm+PumqTuf4
   qMcA2HNUVeWnZCEWf45XGilNAwGSWsYxZ59wUnXvPMErK6JKoMCrSxiXn
   +RWvCLwcptLwuuq4zvZRd0Z+4IwPdsSYl6SNSkRNg59I3MAT4WETKbCE5
   SpkBy6QV3qvd9Av91em0D60GtfDAc4POxRj/jaKapnQ1B73Stqdv5Twa9
   QINa/2zYyv9m8tbtlS4GYvf8q6m6V2bSQ/lFlNS1B1tDowuZBsGBpAdjX
   boeeIaTjth8VMbL8cGCdp5pbMj6wL2KKJIEjigku2ieQ0ebtqTA2msf/P
   g==;
X-CSE-ConnectionGUID: 16YGj2hWRNuESH/+nSDrhQ==
X-CSE-MsgGUID: Sk6B2uKESu+1onqpI+r6rQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29464302"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29464302"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 03:11:02 -0700
X-CSE-ConnectionGUID: w7o/M5n7SL2VFBwPyocUFw==
X-CSE-MsgGUID: r+fgvL8nRhaZ3YSCRxyh4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,234,1725346800"; 
   d="scan'208";a="81113883"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 26 Oct 2024 03:10:56 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4dkz-000ZUo-3D;
	Sat, 26 Oct 2024 10:10:54 +0000
Date: Sat, 26 Oct 2024 18:10:30 +0800
From: kernel test robot <lkp@intel.com>
To: Raag Jadav <raag.jadav@intel.com>, airlied@gmail.com, simona@ffwll.ch,
	lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
	jani.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
	lina@asahilina.net, michal.wajdeczko@intel.com,
	christian.koenig@amd.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
	aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
	alexander.deucher@amd.com, andrealmeid@igalia.com,
	amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
	Raag Jadav <raag.jadav@intel.com>
Subject: Re: [PATCH v8 1/4] drm: Introduce device wedged event
Message-ID: <202410261754.enck8cc6-lkp@intel.com>
References: <20241025084817.144621-2-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025084817.144621-2-raag.jadav@intel.com>

Hi Raag,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.12-rc4 next-20241025]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Raag-Jadav/drm-Introduce-device-wedged-event/20241025-165119
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20241025084817.144621-2-raag.jadav%40intel.com
patch subject: [PATCH v8 1/4] drm: Introduce device wedged event
config: arm-randconfig-002-20241026 (https://download.01.org/0day-ci/archive/20241026/202410261754.enck8cc6-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 5886454669c3c9026f7f27eab13509dd0241f2d6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410261754.enck8cc6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410261754.enck8cc6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/drm_drv.c:36:
   In file included from include/linux/pseudo_fs.h:4:
   In file included from include/linux/fs_context.h:14:
   In file included from include/linux/security.h:33:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/gpu/drm/drm_drv.c:81:3: error: expression is not an integer constant expression
      81 |         [ffs(DRM_WEDGE_RECOVERY_REBIND) - 1]    = "rebind",
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/ffs.h:43:16: note: expanded from macro 'ffs'
      43 | #define ffs(x) generic_ffs(x)
         |                ^
   drivers/gpu/drm/drm_drv.c:82:3: error: expression is not an integer constant expression
      82 |         [ffs(DRM_WEDGE_RECOVERY_BUS_RESET) - 1] = "bus-reset",
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/ffs.h:43:16: note: expanded from macro 'ffs'
      43 | #define ffs(x) generic_ffs(x)
         |                ^
>> drivers/gpu/drm/drm_drv.c:84:15: error: invalid application of 'sizeof' to an incomplete type 'const char *const[]'
      84 | static_assert(ARRAY_SIZE(drm_wedge_recovery_opts) == ffs(DRM_WEDGE_RECOVERY_BUS_RESET));
         | ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:32: note: expanded from macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   drivers/gpu/drm/drm_drv.c:528:32: error: invalid application of 'sizeof' to an incomplete type 'const char *const[]'
     528 |         unsigned int len, opt, size = ARRAY_SIZE(drm_wedge_recovery_opts);
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:32: note: expanded from macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                ^~~~~
   1 warning and 4 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]


vim +81 drivers/gpu/drm/drm_drv.c

    75	
    76	/*
    77	 * Available recovery methods for wedged device. To be sent along with device
    78	 * wedged uevent.
    79	 */
    80	static const char *const drm_wedge_recovery_opts[] = {
  > 81		[ffs(DRM_WEDGE_RECOVERY_REBIND) - 1]	= "rebind",
    82		[ffs(DRM_WEDGE_RECOVERY_BUS_RESET) - 1]	= "bus-reset",
    83	};
  > 84	static_assert(ARRAY_SIZE(drm_wedge_recovery_opts) == ffs(DRM_WEDGE_RECOVERY_BUS_RESET));
    85	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
