Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D192F531B;
	Wed, 24 Jun 2026 03:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782270435; cv=none; b=YWPAGfx1V2Gb+FFOO9Ko0SweWv2yXYMoYB4HG5AjfwXxAEAqICdeKX6LQYVMy+4HMmtfT51D54MVLSLhqfN9JWVcrljTfRLOLJQRl2rRuTDQcqTxYGCYmQOE5TubduncQJJ7VbtBZsLpacOFT/GSBns/QgMle5XIeIM6pNJ5r2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782270435; c=relaxed/simple;
	bh=xEa64Y95Rwumd8X1bvjBhev70rDgWeAbfF+qHVNldEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=B6YGrcti/Vv66IJI3hTYwI+Paus4xFJiIylKknUAVWINIzBOV1DuF1Dv2ptKiwWIT3+nTw8HApi8wNFbUiwbQj4qR5AB7w3Q+IjlCseFLwkhR87Vausx2o+91KNx/0UhrCxEAI95jquWqgub2SIN4V/F8aMBJPdAE/1W0Nfp5+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gCqYf+Dy; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gCqYf+Dy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782270435; x=1813806435;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xEa64Y95Rwumd8X1bvjBhev70rDgWeAbfF+qHVNldEQ=;
  b=gCqYf+DyPxeoWwzOB99BCr0+KoV5TPYMUfaIVA4Yyt6kUsZRJCmQeRG5
   qBgqjTxY1LMh9bocDG3ZvM2TjZArKtcSgPUXMMRumW/Z7jXpDqBlZNqhs
   oT2A0y6tWxB+aN3HXBOjWk6rUW7WeXhsXe7CGmMriHF2nHcWkYNh/RrkC
   zMtTPv1zo8NIZsPK8fZeTGB1TCwhTLyiJO0YH8E+uwDdZVQGvkD15FEXY
   5YBMkZkubQWARIgg6bS6m7JOu5yxMBEvQWG4koD0KwGqF365qgHFYMfp8
   S97VP3OZjfRukbvJQXjHuWvno1tR5q330Zj4C5K4mkNxebNzj5aswdLYm
   A==;
X-CSE-ConnectionGUID: E7OA29Z5RGalrF4rnfogag==
X-CSE-MsgGUID: NuTMHZKPQMmH6hj4HeAb0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="82906159"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="82906159"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 20:07:14 -0700
X-CSE-ConnectionGUID: C8AxWRHjRPCin9FzFHIgyA==
X-CSE-MsgGUID: Xyvz/p5mSwOlQoeuSwbg7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="245326870"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 23 Jun 2026 20:07:12 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcDxB-0000000035P-3t5Z;
	Wed, 24 Jun 2026 03:07:07 +0000
Date: Wed, 24 Jun 2026 11:05:59 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/b4-sysfs-const-attr-device_attr 7/12]
 drivers/perf/nvidia_t410_cmem_latency_pmu.c:447:25: error: incompatible
 function pointer types initializing 'ssize_t (*)(struct device *, struct
 device_attribute *, char *)' (aka 'long (*)(struct device *, struct
 device_attribute *, char *)') with an expr...
Message-ID: <202606241123.ZtjpkcdO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/b4-sysfs-const-attr-device_attr
head:   bc80ee47805905a6b1e67acf7d467ba57ffb6e7f
commit: 858ac3375fd495c1c894b364cae0f98d8ce471a9 [7/12] device_string
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260624/202606241123.ZtjpkcdO-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project a9b492db3d50683e446cd1a5c9ffaf4e92cb77a7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260624/202606241123.ZtjpkcdO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606241123.ZtjpkcdO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/perf/nvidia_t410_cmem_latency_pmu.c:447:25: error: incompatible function pointer types initializing 'ssize_t (*)(struct device *, struct device_attribute *, char *)' (aka 'long (*)(struct device *, struct device_attribute *, char *)') with an expression of type 'ssize_t (struct device *, const struct device_attribute *, char *)' (aka 'long (struct device *, const struct device_attribute *, char *)') [-Wincompatible-function-pointer-types]
     447 |         NV_PMU_EXT_ATTR(event, device_show_string, "config:0-1"),
         |                                ^~~~~~~~~~~~~~~~~~
   1 error generated.
--
>> drivers/perf/nvidia_t410_c2c_pmu.c:560:2: error: incompatible function pointer types initializing 'ssize_t (*)(struct device *, struct device_attribute *, char *)' (aka 'long (*)(struct device *, struct device_attribute *, char *)') with an expression of type 'ssize_t (struct device *, const struct device_attribute *, char *)' (aka 'long (struct device *, const struct device_attribute *, char *)') [-Wincompatible-function-pointer-types]
     560 |         NV_C2C_PMU_FORMAT_EVENT_ATTR,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/nvidia_t410_c2c_pmu.c:557:2: note: expanded from macro 'NV_C2C_PMU_FORMAT_EVENT_ATTR'
     557 |         NV_C2C_PMU_FORMAT_ATTR(event, "config:0-3")
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/nvidia_t410_c2c_pmu.c:554:29: note: expanded from macro 'NV_C2C_PMU_FORMAT_ATTR'
     554 |         NV_C2C_PMU_EXT_ATTR(_name, device_show_string, _config)
         |                                    ^~~~~~~~~~~~~~~~~~
   drivers/perf/nvidia_t410_c2c_pmu.c:561:2: error: incompatible function pointer types initializing 'ssize_t (*)(struct device *, struct device_attribute *, char *)' (aka 'long (*)(struct device *, struct device_attribute *, char *)') with an expression of type 'ssize_t (struct device *, const struct device_attribute *, char *)' (aka 'long (struct device *, const struct device_attribute *, char *)') [-Wincompatible-function-pointer-types]
     561 |         NV_C2C_PMU_FORMAT_ATTR(gpu_mask, "config1:0-1"),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/nvidia_t410_c2c_pmu.c:554:29: note: expanded from macro 'NV_C2C_PMU_FORMAT_ATTR'
     554 |         NV_C2C_PMU_EXT_ATTR(_name, device_show_string, _config)
         |                                    ^~~~~~~~~~~~~~~~~~
   drivers/perf/nvidia_t410_c2c_pmu.c:571:2: error: incompatible function pointer types initializing 'ssize_t (*)(struct device *, struct device_attribute *, char *)' (aka 'long (*)(struct device *, struct device_attribute *, char *)') with an expression of type 'ssize_t (struct device *, const struct device_attribute *, char *)' (aka 'long (struct device *, const struct device_attribute *, char *)') [-Wincompatible-function-pointer-types]
     571 |         NV_C2C_PMU_FORMAT_EVENT_ATTR,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/nvidia_t410_c2c_pmu.c:557:2: note: expanded from macro 'NV_C2C_PMU_FORMAT_EVENT_ATTR'
     557 |         NV_C2C_PMU_FORMAT_ATTR(event, "config:0-3")
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/nvidia_t410_c2c_pmu.c:554:29: note: expanded from macro 'NV_C2C_PMU_FORMAT_ATTR'
     554 |         NV_C2C_PMU_EXT_ATTR(_name, device_show_string, _config)
         |                                    ^~~~~~~~~~~~~~~~~~
   3 errors generated.


vim +447 drivers/perf/nvidia_t410_cmem_latency_pmu.c

429b7638b2df55 Besar Wicaksono 2026-03-24  437  
429b7638b2df55 Besar Wicaksono 2026-03-24  438  #define NV_PMU_EXT_ATTR(_name, _func, _config)			\
429b7638b2df55 Besar Wicaksono 2026-03-24  439  	(&((struct dev_ext_attribute[]){				\
429b7638b2df55 Besar Wicaksono 2026-03-24  440  		{							\
429b7638b2df55 Besar Wicaksono 2026-03-24  441  			.attr = __ATTR(_name, 0444, _func, NULL),	\
429b7638b2df55 Besar Wicaksono 2026-03-24  442  			.var = (void *)_config				\
429b7638b2df55 Besar Wicaksono 2026-03-24  443  		}							\
429b7638b2df55 Besar Wicaksono 2026-03-24  444  	})[0].attr.attr)
429b7638b2df55 Besar Wicaksono 2026-03-24  445  
429b7638b2df55 Besar Wicaksono 2026-03-24  446  static struct attribute *cmem_lat_pmu_formats[] = {
429b7638b2df55 Besar Wicaksono 2026-03-24 @447  	NV_PMU_EXT_ATTR(event, device_show_string, "config:0-1"),
429b7638b2df55 Besar Wicaksono 2026-03-24  448  	NULL
429b7638b2df55 Besar Wicaksono 2026-03-24  449  };
429b7638b2df55 Besar Wicaksono 2026-03-24  450  

:::::: The code at line 447 was first introduced by commit
:::::: 429b7638b2df5538e945aaa2cc189cf0d6e8fb3a perf: add NVIDIA Tegra410 CPU Memory Latency PMU

:::::: TO: Besar Wicaksono <bwicaksono@nvidia.com>
:::::: CC: Will Deacon <will@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
